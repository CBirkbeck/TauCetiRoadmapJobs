# Review of AlgebraicTopology (pull request #1652 at afc4ab5)

**Verdict:** needs changes

## R01 (P1) — Six Lean files of the folder reference declarations this head deleted

**Location:** `TauCetiRoadmap/AlgebraicTopology/BoundaryCarrierOrientation.lean:109` (“TauCetiRoadmap.AlgebraicTopology.orientationLocalSystem”), `OrientationComparison.lean:27` (“puncturedPair”), `:58` (“coordinateSimplexPair”), `GeneralModelOrientation.lean:170` (“embeddingIntegralLocalMap”), `BoundaryInteriorComparison.lean:139` (“FreshInteriorRechart”).

**Claim:** The folder's Lean modules elaborate against the pins; the pull request “changes only README mathematics; existing Lean modules are unchanged”.

**Witness:** The head rewrites `Suggested.lean` from 336 declarations to 29. The six orientation files import `TauCetiRoadmap.AlgebraicTopology.Suggested` (directly or through each other) and use 24 of the deleted names by fully qualified reference (`orientationLocalSystem`, `puncturedPair`, `coordinateSimplexPair`, `embeddingIntegralLocalMap`, `twistedSupportLocalMap`, `compactSupportTopClass_existsUnique`, `RelativeTwistedClassDatum`, `LocallyRepresentedTopSection`, `carrierHomeomorphOriginal`, the `FreshInteriorRechart.*` fields, …). No file of the folder declares them now. `lakefile.toml` builds the library with the glob `TauCetiRoadmap.*`, so the default `lake build` fails on these modules; the gate's targeted build of `Suggested` cannot see it. The same files keep the seven `set_option` lines and the roadmap-module imports (`TauCetiRoadmap.DifferentialGeometry.Suggested`, Mathlib submodules in `TopologicalGroupFundamentalGroup.lean`) that the previous review's R08 and R09 reported.

**Repair:** Delete the six orientation files; their mathematics is already the prose of §6.3. Either delete `TopologicalGroupFundamentalGroup.lean` or move its proved construction into `Suggested.lean` under the single `import Mathlib`. Then rewrite the README passages that name their declarations as prose: lines 340, 1504, 1524, 1690, 1750 and the underscore names `linearLocalGenerator_signDet`, `orderedSimplex_vertexSwap_neg`, `pathToIdentity_of_det_pos`, `localLinearization_puncturedHomotopy`, `localDiffeomorphism_localGenerator_signDet`, `rawChartCoefficient_at`, `chartSimplexSupportClass_local_image`, `pointGenerator_eq_rawChartCoefficient_at`, `chartSimplexSupportClass_signed_local_image_pointGenerator` (the gate's readme-ids rule is satisfied today only because those files mention them). Rerun the gate; its build must cover every `.lean` file left in the folder.

## R02 (P2) — Poincaré duality with two-torsion coefficients is statable and absent

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:17–19` (“The twisted and boundary duality headlines cannot yet be stated”); README §6.4 (“Then derive the field-coefficient and integral orientable corollaries”).

**Claim:** No duality headline is statable at the pins, so none is stated.

**Witness:** The native cap `TopCat.singularCap` (`TauCeti/AlgebraicTopology/Cohomology/Cap/Basic.lean:101`) takes `p + q = n` and returns `H^p(X;M) →ₗ (H_n(X;T) ⟶ H_q(X;P))`. A scratch statement elaborated against the pins with only a `sorry` warning: for `n`, `M : Type` with `[ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [T2Space M] [CompactSpace M] [ConnectedSpace M]` and a commutative ring `R` with `(2 : R) = 0`, there is `μ` in `H_n(M;R)` such that for all `p q` with `p + q = n` the map `a ↦ (singularCap R (λ_ R).inv (λ_ R).hom p q n h a).hom μ` is bijective. Every manifold is `R`-orientable when `2 = 0` and `H_n(M;R) ≅ R`, so the existential adds nothing: any `μ` with cap bijective in degree `0 → n` is a generator. On `S¹` with `R = 𝔽₂`: `H^0 = 𝔽₂ → H_1 = 𝔽₂` and `H^1 → H_0`, both bijective; on a point `n = 0`, `μ = 1`.

**Repair:** State this two-torsion-coefficient closed-manifold duality in `Suggested.lean` (the README's own “field-coefficient corollary”), universe-polymorphic as in the file's other statements; keep the docstring's missing-carrier claim for the twisted, boundary and oriented-integral forms only.

## R03 (P2) — The convenient suspension comparisons have two owners, one of them a later roadmap

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:722–731` (“That later item owns `compactConvenientSmashComparison`, `compactConvenientSuspensionComparison` and `cwConvenientSuspensionComparison` … proposed §3A.2 supplier targets”), `:608–610` (Layer 4.0: “the comparison of raw CW suspension with the convenient suspension”), `:2478` (8.11b: “then Layer 4.0's `cwConvenientSuspensionComparison`”).

**Claim:** The suspension comparison consumed in 8.11b is owned by Layer 4.0, and HomotopySpheres is only a consumer (“there is no reverse supplier edge”, line 121).

**Witness:** §4.4 assigns the same three comparisons to HomotopySpheres §3A.2 and calls them its supplier targets. HomotopySpheres at its open head states none of those names (its README and `Suggested.lean` contain no `ConvenientSuspensionComparison`), and its §3A.2 *Needs:* line (`TauCetiRoadmap/HomotopySpheres/README.md:680`) consumes AlgebraicTopology Stages 4.5 and 8. HomotopySpheres is position 64 of the merge order while this roadmap is on main: the edge in §4.4 is upward and closes the cycle the previous review's R02 reported; the dependency check misses it because the sentence is not a *Needs:* line.

**Repair:** Delete the §3A.2 ownership sentences in §4.4 and name the three comparisons as Layer 4.0 targets in prose (no backticks: they are not declared in `Suggested.lean`). Mention HomotopySpheres only as a consumer, on a line of its own. On `S⁰ ∧ S¹`, the Layer 4.0 comparison must send the interval-last generator to winding `+1`, as the 4.0 Check already states.

## R04 (P3) — DGFloer consumes a native Serre carrier, not Layer 5.0's predicate

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:107–110` (“its Layer 1 item 2 consumes Layer 5.0's Serre-fibration carrier”), §5.5 lines 1143–1148.

**Claim:** DGFloer's spectral sequence is built on the predicate §5.0 defines, so §5.5 may apply it to §5.0's bundles.

**Witness:** `TauCetiRoadmap/DGFloer/README.md:133` and `:446–452` on main: Layer 1 item 2 “consumes native `TauCeti.TopCat.serreFibrations`”, with `mem_serreFibrations_iff_cube`, from a Tau Ceti snapshot it names as beyond the pin. Neither pin contains `serreFibrations` (checked at `a91d3aaf`). §5.5 therefore applies a sequence stated on one carrier to a predicate of another, with no identification target.

**Repair:** Replace the sentence about what DGFloer consumes by a statement of what §5.0 provides, and add to §5.0 the comparison target: the predicate is the cube-lifting characterization of that native carrier, so §5.5 transports DGFloer's sequence along it. On `point × point → point` both sides hold by the unique constant lift.

## R05 (P3) — Process narrative and external-project comparisons remain

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:504–521` (“the Lean community Brouwer interface”, “QICLean”, “Brendan Murphy's homological Brouwer development”, “Follow Mathlib the corresponding native interface's”, “supplies that PR's class field”, “Adopt the upstream class interface when it lands”), `:731` (“proposed … supplier targets”), `:954` and `:2030` (“the corresponding native interface”), `:1223–1224` (a GitHub master-branch link and a Zulip thread).

**Claim:** The README is timeless prose for mathematicians.

**Witness:** The quoted phrases are pull-request residue (three are grammatically broken where a pull-request number was replaced), a dependency on a future upstream change, and links to discussions and third-party formalizations that are not sources.

**Repair:** Delete the comparison links and the “when it lands” sentence; cite Mathlib's `gauge` and `isClosed_fixedPoints` by name only; cite the Mittag–Leffler API by declaration name without the links.

## R06 (P3) — Garbled declaration names and undeclared backticked own names

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:804` (“Own relative cwpushout”), `:1992` (“relative cwconnectivity of cell dimension”), `:2015` (“homotopy group kelley product”), `:2252` (“maps to group classifying space equiv”), `:2368` (“ordinary emrepresentability”), `:2452` (“based loop cwtype”), `:2538` (“projective emcomparisons”); `:1390` (“`normalizedLSCategory`”), `:820` (“`homotopyPushoutGluingComparison`”), `:1810` (“`compactTriadPoincareLefschetz`”).

**Claim:** Every term is the literature's or Mathlib's name, and a backticked own name is declared in `Suggested.lean`.

**Witness:** 32 occurrences are Lean identifiers with the backticks removed and camel case split, leaving tokens (“cwpushout”, “emrepresentability”, “cwtype”) that are neither words nor declarations. Separately, about forty backticked camel-case names of this roadmap's own (`cwProductKelley`, `cwSubcomplexTowerUnion`, `relativeCWPushoutCWModel`, `cofibrationTowerHomotopyEquivalence`, `simplicialRealizationCW`, `kanCubicalHomotopyComparison`, `endComponents`, `stableFundamentalGroupAtEnd`, `groupCohomologyCup`, `normalizedLSCategory`, …) are declared nowhere; MorseTheory at its head already cites `normalizedLSCategory` as a carrier of this roadmap.

**Repair:** Write each target as a sentence (“the relative CW pushout”, “the normalized category of a nonempty space, one less than the count”), reserving backticks for the 29 declarations of `Suggested.lean` and for library names.

## R07 (P3) — Locators: a wrong section, an unnumbered section, and sampled targets without a locator

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1182` (“Hatcher Sections 3.B and 4.G”), `:1007` (“Hatcher, Sections 0.4 and 2.2”), `:343` (“Brown … Chapters 6--7”); §§2.2, 2.4, 3.5, 4.2, 5.4, 7.3 and 8.6.

**Claim:** Each claim carries a locator that supports it.

**Witness:** Hatcher §4.G is “Gluing Constructions”, p.456 (`hatcher line 77`); it contains no Eilenberg–Zilber or cross-product material (0 mentions between the 4.G and 4.H headings), which is §3.B, pp.268–280. Hatcher's Chapter 0 has no numbered sections. Brown's groupoid theorem is 6.7.2, p.240 (`brown-groupoids line 9424`, PDF page 265), with the Lebesgue-number subdivision at line 9483 and the grid at line 9517. The seven sampled targets state their theorems with no locator at the claim; the layer-end source spine does not say which theorem supports, for example, the torus exterior-power calculation (Hatcher Example 3.16, §3.2) or finite-cover Euler multiplicativity.

**Repair:** Cite 3.B alone for Eilenberg–Zilber, “Hatcher, Chapter 0, pp.5–17” for cell complexes and the homotopy extension property, Brown 6.7.2 (p.240) for §§1.1–1.3, and add a theorem-level locator to each sampled target. Record Brown's text (legal author-page copy) and the other cited works in `sources.toml`, which the folder still lacks.

## R08 (P3) — Docstring inventory and Lean/README agreement

**Location:** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:17–33`, `:265–267`; README §5.3 line 1096 (“connected base”), §8.11 line 2404.

**Claim:** The docstring names every headline that is not statable and what it lacks; README and Lean have the same generality.

**Witness:** Absolute Hurewicz (criterion 6) is neither stated nor named: the pins have no Hurewicz map (no `Homotopy/Hurewicz` module at `a91d3aaf`), and an abstract-isomorphism form would be a stand-in. The algebraic Milnor sequence for a tower of complexes is likewise unmentioned (the docstring names only the integer-graded skeletal comparison). `finiteSourceMappingCWType` assumes `T2Space X` while Milnor's Theorem 3 needs only a compact n-ad (`milnor-cw line 209`). §5.3's prose requires a connected base; `finiteCoverTransfer_exists` does not, and is correct without it (constant fibre cardinality is the hypothesis used).

**Repair:** Name absolute Hurewicz and the tower Milnor sequence in the docstring with their missing carriers; drop `T2Space X` from `finiteSourceMappingCWType` or keep it and say why; drop “connected base” from §5.3's first sentence.

## R09 (P3) — Definitions without Checks, suppliers without subsections

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md` §§2.5, 2.7, 4.4, 4.5, 4.6, 4.7, 6.3, 6.4, 8.1, 8.9, 8.10, 8.12; `:291–299` (“From TauCetiRoadmap suppliers”).

**Claim:** Every definition has at least three discriminating Checks and every supplier its contract subsection.

**Witness:** Only ten subsections carry a `**Checks.**` block (4.0, 4.3, 5.0, 5.3, 6.0, 6.2, 7.1, 8.5, 8.8, 8.11). The coordinate cube class, the radial disk homeomorphism, the pointed quotient carrier, the relative CW pushout, the projective sign system, the orientation local system, the based pair and the obstruction cochain define objects with no Check. The supplier contracts are one paragraph naming nine roadmaps, not `### From TauCetiRoadmap.<X>` subsections stating what is consumed.

**Repair:** Add three Checks per definition (for the sign system on RP²: monodromy `−1` on the generator, `d₁ = ±2`, `d₂ = 0`; for the based pair: `(I,{0},0)` admitted, `(I,∅)` refused, basepoint change); split the supplier paragraph into subsections with the consumed sections.

## Verified sound

**Repair status of the previous review (e56dd0a → afc4ab5).** R01 repaired: §5.0 owns the Serre-fibration predicate with pullback and bundle lifting (see R04 for the DGFloer wording). R02 repaired at the *Needs:* level: Layer 4.0 owns compact generation and the adjunction, the dependency check is clean, but the prose of §4.4 keeps the HomotopySpheres edge (R03). R03 repaired: the Čech section is gone and TopologicalSheafCohomology §§1.1–1.2, CharacteristicClasses C1.2b and ImplicitAtlases §0.7 are named as owners in Scope. R04 repaired: `sorry-data=0`; the file has 29 declarations, every `def` with a real body. R05 repaired: `ordinaryWhitehead` and `ordinaryWhitehead_cwType` are stated with the component bijection and all positive-degree bijections. R06 repaired by deleting the obstruction constructions. R07 repaired by deleting the compact Čech theory from the base rather than by a Part II; the pull request's title and description now describe content the head no longer contains, and MorseTheory at its open head cites no Čech theory from this roadmap. R08 and R09 repaired for `Suggested.lean` only; the auxiliary files are untouched (R01 here). R10 repaired. R11 repaired for Milnor (Theorem 2 p.273, Theorem 3 and Corollary 3 p.276) and Hatcher 4.32 (§4.2, p.366); no `sources.toml` was added (R07 here). R12, R13, R14 repaired. R15 partly repaired: Summary, Scope and ownership, Conventions, supplier contracts, build order, Layers with Examples and Dependencies, Downstream consumers and References are present, and per-target *Needs:* lines exist; Checks are still missing on most definitions (R09 here).

**Gate and build.** The worker's gate at afc4ab5 passes every counter. Direct `lake env lean` of `Suggested.lean` exits 0 with exactly 16 `sorry` warnings and no other warning. The pins are Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf`. The dependency check with `--movable` against the merge order reports:

```text
depcheck: 205 roadmaps, 1594 edges, 0 problem(s)
```

The diff outside the folder is empty. The 29 elaborated signatures were compared with the README statements: none lost a section binder; `finiteCWEulerCharacteristic_eq_of_homotopyEquiv` keeps both `T2Space` instances although its statement does not mention them, which is intended (the README says invariance needs Hausdorff carriers).

**Padding probe.** A scratch copy replaced each `sorry` by `first | rfl | simp | infer_instance | (intros; simp_all) | sorry`. Of the 16 sorried theorems, 12 kept their `sorry` warning and 4 (`brouwerFixedPoint_compactConvex`, `finiteCoverTransfer_exists`, `towerDifference_surjective`, `properStrongDeformationRetract_of_inverse`) ended in unsolved goals after `simp` rewrote them; none closed. No declaration mirrors a README Check or computes a value. `towerDifference_surjective` is elementary but is the lim¹-vanishing statement itself, not a one-tactic consequence of the library.

**Ownership against open pull requests** (`roadmaps grep --lean-only` over the 439 open heads and main) for all 16 theorem and 13 definition names: no other `Suggested.lean` declares any of them. `finiteCWEulerCharacteristic` is cited (in a docstring, with no import) by FuchsianOrbifolds on main; `lsCategoryCount` by MorseTheory at its head. HomotopySpheres' supplier contract at its open head (`TauCetiRoadmap/HomotopySpheres/README.md:68–72,347–349`) names `relativeHurewicz`, `poincareDualityMap_isIso` and `compactManifoldFiniteCWType`, which this head deletes; that is drift for its own review, since no open-PR Lean file imports this module (only the six auxiliary files of R01 do).

**Pinned declarations opened** (file and line at the pins):

| Declaration | What was checked |
| --- | --- |
| `TopCat.singularCohomology`, `TauCeti/AlgebraicTopology/Cohomology/Basic.lean:94` | arguments `(R k M) X n`; `singularCohomology R X n` here specialises all three to `ModuleCat.of R R`. |
| `TopCat.singularCup`, `Cohomology/Cup.lean` (definition after line 47) | takes `u : T ⟶ R ⊗ S`, `μ : M ⊗ N ⟶ P`, `h : p + q = n`; `cupProduct` passes the left unitor's inverse and hom, i.e. the ring multiplication, with `n = p + q` by `rfl`. |
| `TopCat.singularCap`, `Cohomology/Cap/Basic.lean:101` | same pairing data, result `H^p → (H_n ⟶ H_q)`; basis of R02. |
| `TauCeti.cellularSingularHomologyIso`, `Cellular/Comparison.lean:81,104,108` | needs `[FiniteDimensional C]` and exact cell coproducts; `cellularSingularComparison` drops only finite dimension, with `complexBasePair C = (C, skeletonLT C 0)` (`Cellular/Chains.lean:253`), the pair `(X, A)`. |
| `TauCeti.IsEilenbergMacLaneSpaceOne`, `EilenbergMacLane/Basic.lean:123`; `IsAspherical` | path-connected, `π_{n+2}` subsingleton for all `n`, and `π₁ ≃* G`; so `groupClassifyingSpace_isEMOne` for `G = 1` asserts a contractible-type realization and for `G = S₃` a nonabelian `π₁`. |
| `HomotopyGroup.map`, `Topology/Homotopy/HomotopyGroup/Map.lean:36` | `(f : C(X,Y)) (hf : f x = y)`; `ordinaryWhitehead` uses `rfl` with `y := f x`. |
| `SSet.ιChainComplex`, `Mathlib/AlgebraicTopology/SimplicialSet/Homology/Basic.lean:87` | summand inclusion `R ⟶ (X.chainComplex R).X n` for a simplex; the transfer formula sums these over the finite lift set. |
| `IsCoveringMap`, `Mathlib/Topology/Covering/Basic.lean` | evenly covered with discrete fibre; no surjectivity, so `d = 0` with `E = ∅` is admitted and the formulas hold trivially. |
| `IsProperMap`, `Mathlib/Topology/Maps/Proper/Basic.lean:77`; `isProperMap_iff_isClosedMap_and_compact_fibers:225` | continuous plus universally closed; on a locally compact Hausdorff space this is closed with compact fibres, as §8.5 says. |
| `ContinuousMap.Nullhomotopic`, `Mathlib/Topology/Homotopy/Contractible.lean` | `∃ y, Homotopic f (const y)`; for `X = ∅` no open of size `n ≥ 1` is categorical, so `lsCategoryCount ∅ ∅ = 0` as the Check says. |
| `SSet.KanComplex`, `Mathlib/AlgebraicTopology/SimplicialSet/KanComplex.lean:40`; `sSetTopAdj`; `normalizedMooreComplex` | exist as cited in §8.2. |
| `TopologicalSpace.compactlyGenerated`, `UCompactlyGeneratedSpace`, `compactlyGeneratedToTop` | exist as cited in §4.0. |
| `Functor.IsMittagLeffler` (`CategoryTheory/CofilteredSystem.lean`), `isClosed_fixedPoints`, `intrinsicInterior`, `gauge`, `LocallyContractibleSpace` (`Topology/Homotopy/LocallyContractible.lean`) | exist as cited in §§2.7, 6.0, 6.2. |
| `TopCat.eilenbergZilberHomotopyEquiv`, `TopCat.shuffle`, `alexanderWhitney`, `TopPair.excisionMap`, `mayerVietorisδ`, `isColimitCechCocone`, `cellularChainGroupIso`, `finsum_finrank_singularHomology_of_finite_cwComplex`, `hasHomotopyExtensionProperty_base`, `exists_strong_deformation_retraction`, `hasHomotopyExtensionProperty_range_incl`, `reducedSingularHomologyTopCatSphereIso`, `contractibleSpace_disk`, `isZero_reducedSingularHomologyFunctor_of_contractibleSpace`, `singularHomologyDiskBoundaryPairIso`, `reducedSingularHomologySphereZeroIso_inv_ι`, `IsLocallyCollared.isCollared`, `nonempty_continuousCohomology_addEquiv_groupCohomology`, `pathLoopSpaceMulEquiv`, `zerothHomotopyLoopSpaceEquivFundamentalGroup`, `AddCircle.isEilenbergMacLaneSpaceOne`, `twistedChainComplex`, `twistedCochainComplex`, `isQuotientCoveringMap_iff_isCoveringMap_and` | all present at the pins in the modules the README names. |
| Absent at the pins | `TauCeti.TopCat.serreFibrations`, any `Homotopy/Whitehead`, `Hurewicz`, `Tower/Milnor`, `Kunneth/Sequence`, `UniversalCoefficient` module: the headlines stated here are not duplicates, and the DGFloer carrier (R04) is not pinned. |

**Cross-roadmap citations resolved.** DGFloer Layer 1 items 1–4 (main, lines 440–560): items 2–4 exist with the stated outputs; item 2 names the native carrier (R04). HomotopySpheres §3A.1–3A.2 at its head (lines 663–720): real targets; §3A.2 *Needs:* AlgebraicTopology 4.5 and 8 (R03). TopologicalSheafCohomology, CharacteristicClasses, ClassifyingSpaces, GeneralizedCohomology, TopologicalKTheory, DifferentialGeometry, GeometricTopology, MorseTheory, RiemannianGeometry, ComplexKahlerGeometry, AffineMorseLefschetz, BanachAlgebras, SmoothBundlesConnections, HeegaardFloer: all on main, so every *Needs:* edge is to main. ImplicitAtlases, HomotopySpheres, FourManifolds, CStarClassification and AlgebraicTopologyPartII are open pull requests named only as consumers or owners in Scope. AlgebraicTopologyPartII at its head is the real/semialgebraic extension and states none of this roadmap's objects. MorseTheory at its head cites the Stage 6 categorical-cover supplement with the four carriers named here (one of them undeclared, R06).

**Source sample (the worker's fifteen targets).** Texts read: Hatcher (`hatcher`, cache `bebb3032`, PDF page = printed + 9), Milnor's CW paper (`milnor-cw`, `8fce3a88`, PDF page 2 = printed 272), Milnor's Morse Theory (`milnor-morse`, `65731a25`), Farrell–Taylor–Wagoner (`ftw`, `10d5f8cd`), and Brown's Topology and Groupoids fetched now from the author's page (`brown-groupoids`, `0f97eca8`, PDF page = printed + 25).

| Target | Locator checked and what it supports |
| --- | --- |
| 1.2 Cover naturality | Brown 6.7.2, p.240 (`brown-groupoids line 9424`): the groupoid pushout for two open sets with a representative set; path subdivision by the Lebesgue number (line 9483) and the grid homotopy subdivision (line 9517). Supports generation and relations; refinement naturality is an extension of the native colimit, not in Brown. |
| 2.2 Relative homology | Hatcher §2.1, relative groups and the pair sequence, pp.115–118; Eilenberg–Steenrod unreadable. Functoriality and `H_*(X,∅) ≅ H_*(X)` are supported; no locator at the claim (R07). |
| 2.4 Homology axioms | Hatcher §2.1 and §2.3 (axioms, p.160); native `singularHomologyPretheory` resolves the carrier. No locator at the claim. |
| 2.7 Brouwer | The README cites no theorem; the route (no retraction of `Dⁿ` onto `∂Dⁿ`, ray retraction) is Hatcher Corollary 2.15, p.114 (`hatcher line 5005`), for every `n`. Native `contractibleSpace_disk` and the reduced sphere isomorphism resolve the inputs. Compact convex sets via the gauge are not in Hatcher; the README gives no locator for that extension. |
| 3.5 Sphere calculations | Hatcher §2.2, Mayer–Vietoris p.149–150 and the sphere Example 2.46; native `reducedSingularHomologySphereIso` is the pinned computation. |
| 4.2 Cellular differentials | Hatcher cellular boundary formula, p.140–141 (§2.2); native `cellularDifferential` with the triple connecting map; degrees of attaching maps are the stated extension. |
| 5.3 Finite covers and transfer | Hatcher §3.G, p.321 (`hatcher line 14015`): transfer by summing lifts, `p_* τ = d`. Supports the chain-level statement; Cartan–Leray is cited to Brown's Cohomology of Groups VII, unreadable. |
| 5.4 Torus homology | Hatcher Example 3.16, §3.2 (exterior algebra on `n` degree-one classes, referenced at `hatcher line 9265`); no locator at the claim. |
| 5.5 Serre applications | Hatcher Proposition 4.48, p.379 (`hatcher line 16461`): fibre bundles have the lifting property for CW pairs, no paracompactness. Serre 1951 Chapter II for the spectral sequence, read in the previous round. |
| 6.0 Countable inverse-system algebra | Weibel 3.5 unreadable; Mathlib `Functor.IsMittagLeffler` resolves the hypothesis form; the surjective-tower and Mittag–Leffler vanishing are standard and were recomputed below. |
| 7.1 Finite CW models | Hatcher Theorem 2.44, p.146 (`hatcher line 6380`): `χ = Σ(−1)ⁿ rank Hₙ` for finite CW complexes. Supports invariance through homology. |
| 7.3 Cover multiplicativity | No locator; the transfer route (5.3) gives `χ(E) = dχ(B)` over `ℚ`. |
| 8.6 Sphere normalization | Internal convention; no external claim. |
| 8.7 Smooth-manifold CW type | GeometricTopology smooth triangulation item 1 on main; Milnor Morse Theory Lemma 3.6 (Whitehead) and 3.7 (`milnor-morse lines 3624, 3537`, PDF page 13; printed pp.20–21) for homotopic attachments, cited in §4.5. |
| 8.11 Mapping spaces and EM loops | Milnor Theorem 3, p.276 (`milnor-cw line 209`): `A` in `W_n`, `C` a compact n-ad, then `A^C` in `W`; Corollary 3 (line 218) for based loops; Theorem 2, p.273 (line 103) for n-ads. Milnor assumes compactness only (R08). |

Additional locators confirmed: Hatcher Theorem 4.5, p.346 (`hatcher line 15109`); Theorem 4.32, p.366 (line 15961); Theorem 4.57, p.393 (line 17069); Theorem 3.43, p.254 (line 10976); Lemma 3.27, p.236 (line 10255); Proposition 3.29, p.239 (line 10370); Proposition 0.19 and Corollary 0.20, p.16 (lines 867, 870); Theorem A.6, p.524 (line 22693); Proposition A.3, p.522 (line 22617); Propositions A.14–A.16, pp.530–531 (lines 23034–23081); Proposition 2.21, p.119 (line 5222); Farrell–Taylor–Wagoner Theorem 4.2, Lemma 4.3 and Corollary 4.9 (`ftw lines 600, 610, 752`).

**Adversarial pass.** Coefficients are `ℤ` unless stated. Rows cover every declaration of `Suggested.lean`, the sampled targets and the targets the findings touch.

| Statement | Instances and values computed | Result |
| --- | --- | --- |
| `brouwerFixedPoint_compactConvex` | `C = {0}`: the only map fixes `0`. `C = [0,1]`, `f(x) = 1 − x`: fixed point `1/2`. `C = [0,1]`, `f = id`: every point. `E = ℝ⁰`: `C` is a point. Non-compact `C = ℝ`, `f(x) = x + 1`: no fixed point, excluded by `IsCompact`. | Pass. |
| `cellularSingularComparison` | `A = X`: no relative cells, `cellularChainComplex = 0`, `H_n(X,X) = 0`. Point relative to `∅`: `M` in degree 0, `0` above. `RP²` relative to `∅`, `M = ℤ`: cellular `(ℤ, ℤ/2, 0)` = singular. Infinite-dimensional `RP^∞`: both sides `ℤ/2` in odd degrees; the native finite-dimensional theorem does not apply, this does. | Pass; genuine extension of the pin. |
| `finiteCoverTransfer_exists` | Identity cover: one lift, `t = id`, `t ≫ p_* = 1·id`. Two-sheet cover of a point, `R = ℤ`: `ι_σ ≫ t = ι_τ₁ + ι_τ₂`, then `p_*` gives `2ι_σ`. Same over `𝔽₂`: `t(σ) = τ₁ + τ₂ ≠ 0`, `p_* t = 0 = 2·id`; the zero chain map satisfies the first equation but not the second. `d = 0`, `E = ∅`: `t = 0`, empty finsum `= 0`, `0 = 0·id`. Lift set of an `n`-simplex is in bijection with the fibre over its first vertex (`Δⁿ` simply connected), so `Nat.card = d` and the finsum is finite. | Pass. |
| `towerDifference` | Identity tower on `ℤ`: `δ(3,1,0,…) = (2,1,0,…)`, kernel the constants. Zero bonds: `δ = id`. | Pass; sign as pinned in §6.0. |
| `towerDifference_surjective` | Identity bonds: given `y`, `x₀ = 0`, `x_{n+1} = x_n − y_n` solves `δx = y`. Multiplication-by-2 bonds, `y = (1,0,1,0,…)`: needs `x₀ − 2x₁ = 1`, `x₁ − 2x₂ = 0`, …, forcing `3x₀ + 1 ≡ 0 mod 4ᵏ` for all `k`, impossible; bonds not surjective, hypothesis excludes it. | Pass. |
| `towerDifference_surjective_of_mittagLeffler` | Zero bonds: ranges stabilise at `0` after one step, `δ = id` surjective. Multiplication-by-2: ranges `2ᵏℤ` never stabilise, hypothesis fails, and `δ` is not surjective (previous row). Identity: stabilises immediately. | Pass. |
| `singularCohomology`, `cupProduct` | Native pairing data are `(λ_ R).inv : R → R ⊗ R` and `(λ_ R).hom : R ⊗ R → R`, i.e. `r ↦ 1 ⊗ r` and multiplication. On `T²`, `a ∪ b` evaluates `+1` and `b ∪ a` evaluates `−1` under Alexander–Whitney; over `𝔽₂` both `1`. | Pass; convention matches §6.2. |
| `LSCategoricalCover`, `lsCategoryCount` | Point: one open, `count = 1`. `S¹`: two arcs, each contractible in `S¹`; `count = 2`; one open equal to `S¹` is not nullhomotopic in `S¹`. `∅`: the `n = 0` family covers, `count = 0`; `n ≥ 1` impossible since `Nullhomotopic` needs a point. No finite cover: `sInf ∅ = ⊤`. | Pass; matches the three Checks. |
| `LSPositiveCupProduct`, `lsCupLength` | Point: no positive-degree nonzero class, `sSup ∅ = 0`. `S¹`, `R ≠ 0`: `e ≠ 0` gives length 1, `e ∪ e = 0 ∈ H² = 0`, length 2 impossible; value `1`. `T²`: `a ∪ b ≠ 0`, value `2`. `R = 0`: value `0`. Degree-0 units are excluded by `0 < d`. | Pass. |
| `lsCupLength_add_one_le_categoryCount` | Point: `0 + 1 ≤ 1`. `S¹`: `1 + 1 ≤ 2`. `T²`: `2 + 1 ≤ 3`. Contractible `X`: all positive cohomology `0`, left side `1 ≤ 1`. `R = 0`: `0 + 1 ≤ count ≥ 1` since `X` nonempty. `count = ⊤`: trivial. Proof route: a class restricts to `0` on each categorical open, lifts to `H^*(X,U_i)`, and the open-excisive product of `k` lifts lands in `H^*(X,X) = 0`. | Pass. |
| `finiteCWEulerCharacteristic` | Point `1`; `S¹` with one 0-cell and one 1-cell `0`, subdivided `2 − 2 = 0`; `S²` `2`; empty structure `0`; `finsum` finite because `Finite` bounds the cells. | Pass. |
| `finiteCWEulerCharacteristic_eq_of_homotopyEquiv` | `∅ ≃ ∅`: `0 = 0`. Two circle structures: `0 = 0` via `χ = Σ(−1)ⁿ rank Hₙ` over `ℚ` (Hatcher 2.44), which needs the Hausdorff carrier for the native comparison. | Pass. |
| `finiteCWEulerCharacteristic_product` | `S² × S²`: `4 = 2·2`; `S¹ × S²`: `0 = 0·2`; point `× X`: `χ(X)`. The product structure is an arbitrary finite one; invariance makes the identity independent of it. | Pass. |
| `finiteCWEulerCharacteristic_cover` | `d`-fold circle cover: `0 = d·0`. Two points over a point: `2 = 2·1`. `d = 0`, `E = ∅`: `0 = 0`. `B = ∅`: `0 = d·0`. | Pass. |
| `CWTypeModel` | Identity model of `∅` has zero components; `I` with a point model; `S¹` cannot have a point model (`π₁ = ℤ ≠ 0`). | Pass; matches the Checks. |
| `ordinaryWhitehead`, `_cwType` | `id` on `∅`, point, `S¹`, `S²`: bijections, `e = id`. `∅ → point`: `ZerothHomotopy ∅ = ∅ → *` not surjective. `z ↦ z²` on `S¹`: `π₁` map `×2`, not surjective. `S² ⊔ point → S²` collapsing the point: components `2 → 1`, refused. | Pass; `n = 0` handled by the component hypothesis, `HomotopyGroup (Fin 0)` excluded by `0 < n`. |
| `homologicalWhitehead`, `_cwType` | `id` on `S²`: identities on `H₀, H₂`. Poincaré homology sphere `→ S³`: homology isomorphisms but `π₁` binary icosahedral; excluded by `SimplyConnectedSpace`. `ULift ℤ` keeps the universe of `X`. | Pass. |
| `finiteSourceMappingCWType` | `X = point`: `C(X,Y) ≅ Y`. `X = ∅`: a point, even for `Y = ∅`. `Y = ∅`, `X` nonempty: `C(X,∅) = ∅`, modelled by the empty CW complex. `X = ℕ` discrete, `Y = {0,1}`: Cantor space, not CW type, excluded by `CompactSpace`. `T2Space X` unused by Milnor (R08). | Pass. |
| `groupClassifyingSpace`, `_isEMOne` | `G = 1`: one vertex, degenerate higher simplices, realization a point: `π₁ = 1`, `π_{n+2} = 0`. `G = ℤ`: `π₁ = ℤ`. `G = S₃`: `π₁ = S₃` nonabelian, `H₁ = ℤ/2`; the predicate asks for `π₁ ≃* S₃`, so the abelianization would fail it. | Pass. |
| `HasProperHomotopyInverse` | `id_ℝ`: proper with constant homotopies `I × ℝ → ℝ`, preimage of `[−1,1]` is `I × [−1,1]`, compact. `ℝ → point`: not proper, refused. `H(t,x) = x − t x²`: each slice proper but `H⁻¹(0) ⊇ {(1/n, n)}` unbounded; joint properness refuses it. | Pass. |
| `HasProperHomotopyExtensionProperty` | `A = ∅`: `K(t,x) = f(x)` is proper (preimage `I × f⁻¹K`); holds. `A = X`: `K = H`. `X = ℝ`, `A = {0}`: the L-shaped retraction of `ℝ × I` from `(0,2)` is proper, so the property holds. | Pass. |
| `properStrongDeformationRetract_of_inverse` | `A = X`: `r = id`, `H` constant, proper. `X = I`, `A = {0}`: `r = 0`, `H(t,x) = (1−t)x`. `X = ℝ`, `A = {0}`: the inclusion has no proper inverse (`ℝ → {0}` not proper), hypothesis fails. Route: proper HEP with target `X×{0} ∪ A×I` yields a proper retraction, hence the cylinder-pair proper HEP by Strøm's square homeomorphism; then Hatcher 0.19–0.20 with every homotopy proper. `A` closed because a proper map into a Hausdorff space is closed. | Pass. |
| 1.2 cover naturality (sample) | Interval path split at `1/2`: composite `0 → 1`; refining the two-arc cover of `S¹` to four arcs: induced groupoid map sends the generator to the generator, `π₁ = ℤ` both ways. | Pass. |
| 2.2, 2.4 (sample) | `(point, point)`: `0`; `(point, ∅)`: `H₀ = M`; `(X, ∅) ≅ X` naturally; `∅`: `0`. | Pass. |
| 2.7 (sample) | `f(x) = 1/2` and `f(x) = 1 − x` on `I` fix `1/2`; `n = 0` boundary empty, handled directly. | Pass. |
| 3.5 (sample) | Two arcs: `(a,b) ↦ (a+b, −a−b)`, kernel `ℤ(1,−1)`, `H₁(S¹) = ℤ`; `n = 2`: `H̃₂(S²) ≅ H̃₁(S¹) = ℤ`. | Pass. |
| 4.0 / 4.4 convenient suspension (R03) | `S⁰ ∧ S¹ ≅ S¹`, interval-last generator winding `+1`, reflection `−1`; the counit on `I` fixes both endpoints. Two owners claimed (R03). | Mathematics consistent; ownership defect. |
| 4.2 (sample) | `RP²`: `d₂ = 2`, `d₁ = 0`, `d₁d₂ = 0`; degree-`m` two-cell: `d₂ = m`, `m = 0` kernel `ℤ`, `m = 2` cokernel `ℤ/2`. | Pass. |
| 5.0 Serre predicate (R04) | `point × point → point`: unique constant lift, `n = 0, 1`. `B × F → B`: `Ĥ(z,t) = (H(z,t), a(z))`. `{0} → I`: path `t ↦ t` has no lift, refused. `∅ → B`: vacuous; surjectivity is separate. | Pass; carrier identification missing (R04). |
| 5.3 (sample) | As the transfer row; deck sum on the trivial two-sheet cover: `(a,b) ↦ (a+b, a+b) = id + swap`. | Pass. |
| 5.4 (sample) | `diag(2,3)` on `T²`: `2, 3` on `H₁`, `6` on `H₂`; coordinate swap `−1` on `H₂`; `T⁰`: `H₀ = ℤ` only. | Pass. |
| 5.5 (sample) | Hopf `S¹ → S³ → S²`: `d₂ : ℤ → ℤ` a unit, kills `H₁, H₂`; product `S¹ × S²`: `d₂ = 0`, `H₁ = H₂ = ℤ`; same `E²`, different abutments. | Pass. |
| 6.0 (sample) | As the three tower rows; six-term sequence on the identity tower: `lim = ℤ`, `lim¹ = 0` before and after dropping the first term. | Pass. |
| 6.4 duality (R02) | `S¹`, `R = 𝔽₂`: `H⁰ → H₁` and `H¹ → H₀` bijective with `μ = [S¹]`; point, `n = 0`: `μ = 1`; `RP²`, `R = 𝔽₂`: `H^k = 𝔽₂` for `k = 0,1,2`, cap with the mod-2 class bijective; `RP²`, `R = ℤ`: `H₂ = 0`, no `μ`, correctly excluded by `2 = 0`. `R = 0`: all groups `0`, bijective. | Statable, absent (R02). |
| 7.1 (sample) | `RP²`: cells `1 − 1 + 1 = 1`, rational Betti `1 − 0 + 0 = 1`. | Pass. |
| 7.3 (sample) | As the cover row; two intervals glued at a point: `1 + 1 − 1 = 1`. | Pass. |
| 8.6 (sample) | `D¹/∂D¹`: `H̃₁ = ℤ` with `[0,1]` positive; `D⁰ ⊔ point`: `S⁰`, `H̃₀ = ℤ` on `[cell] − [basepoint]`. | Pass. |
| 8.7 (sample) | `ℝ`: point CW type; `S¹`: one 0-cell and one 1-cell; a non-simply-connected homology 3-sphere is not forced to be `S³`. | Pass. |
| 8.11 (sample) | As the mapping-space row; `ΩS¹`: components `ℤ`, each contractible; `ΩK(A,n+1)`: `π_n = A`, comparison `a ↦ a`, not `−a`. | Pass. |

## Not verifiable

- **eilenberg-steenrod**, Chapters I–III (§§2.2, 2.4, 3.5): publisher DOI landing page only, as in the previous round; the native pretheory and Hatcher §2.1 were used instead.
- **weibel**, Chapters 3 and 5 (§§5.1, 6.0, 6.1); **mccleary**, Chapters 1–2 (§5.7); **brown-cohomology**, Chapter VII (§5.3 Cartan–Leray); **dold**, Chapters VII–VIII (§6); **whitehead**, Chapters II–VII (§§4.5, 8); **may** (§8.2, DjVu only); **freedman-quinn** Appendix (§8.5): no readable legal copy was found in this or the previous round; locators are cited by number only.
- **serre** 1951 and **strom** were read in the previous round and are not re-certified here.
- The folder has no `sources.toml`, so no locator is recorded in a manifest; the cache ids above identify the texts read.

## Source issues

- **Misprint** in milnor-cw at the proof of Corollary 3, printed p.276 (line 221): the source says apply Theorem 4; it should be Theorem 3; affects the proof.
- **Misprint** in milnor-cw at the end of the proof of Theorem 2, printed p.276 (line 206): the source says this completes the proof of Theorem 3; it should be Theorem 2; affects the proof.
