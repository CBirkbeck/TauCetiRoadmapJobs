# Review of AlgebraicTopology (pull request #1797 at 9864ff4)

**Verdict:** needs changes

Eight findings, two blocking. Six of the previous review's ten findings are repaired at this head (the integral duality statement, the Mathlib `isoModSerre` vocabulary, the normalized universal class, the wider chart hypotheses and the half-space finite-CW statement, the native filtered-space tower and fibre local system, the locators) and a seventh (the README form) in substance. The two ownership findings and the pull-request order are unchanged; four new P3s come from the full pass.

## R01 (P2) — DGFloer still owns the Serre machinery, the `K(A,n)` family, Hurewicz modulo a class and CW approximation of arbitrary spaces, which this head owns

Re-raised: r68 R01 (not repaired; no repair report marks it not actionable).

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` 111–131: "Stage 4.8 … owns … CW approximation of arbitrary spaces …; Stage 5.5 owns the fibration homotopy long exact sequence … and the homological and cohomological Serre spectral sequences …; Stage 8.8c owns the single functorial abelian K(A,n) family … Stage 8.8d … owns Hurewicz modulo a class. … DGFloer Layer 1 consumes these ordinary targets". `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` 363 (`exists_cwApproximation`) and 688 (`hurewicz_isoModSerre`).

**Claim.** These objects are owned here and DGFloer consumes them.

**Witness.** DGFloer on main, README 196–198 and 226–232: "this roadmap owns: … CW approximation, and homology invariance under weak equivalences; … the fibration homotopy exact sequence and ordinary homological and multiplicative cohomological Serre sequences on native `serreFibrations` … Serre classes; … AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets"; 405–416 lists "CW approximation; … spectral sequences for native `serreFibrations`; … Serre classes, Eilenberg–MacLane spaces `K(A, n)` for arbitrary abelian `A`" as "built here". The open head #1798 (README 56–70) says the same: "it owns: … CW approximation of spaces that are not path-connected, … the ordinary homological and multiplicative cohomological Serre spectral sequences …; Hurewicz modulo a Serre class, the functorial Eilenberg–MacLane models `K(A, n)`". Each object has two owners, and each roadmap says the other consumes it.

**Repair.** DGFloer consumes AlgebraicTopology Stages 2–8 throughout, so the acyclic choice is ownership here, as this head states. The counterpart is a change to DGFloer (main 196–232 and 405–416; #1798 56–70, 1037–1043, 1215) turning Layer 1 items 1–4 into consumption of AlgebraicTopology 4.8, 5.0, 5.5, 8.8c and 8.8d, in a pull request this one's description names together with the merge order. Until that exists this folder states a second owner.

## R02 (P2) — This roadmap and CharacteristicClasses each say the other consumes the compactly supported local-coefficient cochains

Re-raised: r68 R02 (not repaired).

**Location.** README 164–169: "CharacteristicClasses C1.2a consumes the compactly supported local-coefficient cochains of the supported-cellular supplement after Stage 6.2 (their support colimit, enlargement and cofinality comparisons, proper pullback, open extension and jointly proper homotopy invariance)"; 1834–1838: the supplement "owns the compactly supported local-coefficient cochain foundation below".

**Claim.** The foundation `C_K^*`, `C_c^*`, `H_c^n`, proper pullback, open extension and jointly proper homotopy invariance is owned here.

**Witness.** CharacteristicClasses on main, README 66–67: "C1.2a consumes ordinary AT2–4 and ordinary6.1–6.2 only. The separate AT supported-cellular supplement consumes C1.2a S0–S4"; its S0 (line 514) defines the same `C_K^*(X,A;L)`, its filtered colimit and `H_c^n`. Unchanged at the heads of #1854 (72–73), #1807 (72–73) and #1808 (71–72).

**Repair.** CharacteristicClasses consumes AlgebraicTopology 6.1–6.2, so ownership here is the acyclic choice; C1.2a S0–S4 (CC README 66–73 and 512–530) must become consumption of "AlgebraicTopology, supported-cellular supplement after Stage 6.2", in a pull request this one's description names with the merge order. Until then the object is handed in both directions.

## R03 (P3) — The docstring says the pins have no action of `π₁` on `π_n`; they do

**Location.** `Suggested.lean` 133–135: "the relative obstruction class with local coefficients (Stage 8.9): the pinned libraries have no action of `π₁` on `π_n`, so the coefficient system of the obstruction cochain cannot be written". README 2889–2899 (Stage 8.9) plans "fibre π_n and its transport along base paths as a module-valued functor on the fundamental groupoid" and "the trivial π₁ action on π_n" without naming a native carrier.

**Witness.** Tau Ceti pins `TauCeti.homotopyGroupMulAction : MulAction (FundamentalGroup X x) (HomotopyGroup N X x)` (`Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.lean` 136), the path transport `TauCeti.homotopyGroupTransportQuotient` with its `refl` and `trans` laws (90, 102, 109), the action by automorphisms in positive dimension `TauCeti.homotopyGroupMulDistribMulAction` (166), equivariance of based maps `TauCeti.map_fundamentalGroup_smul` (293) and triviality on simply connected spaces `TauCeti.fundamentalGroup_smul_eq_self` (356). The file's header says its transport convention matches `FundamentalGroup.mul_def` as a left action.

**Repair.** Replace the docstring reason: the obstruction cochain is a construction on the roadmap's cellular cochains with local coefficients (Stage 6.1), which the pins lack, not the coefficient action. In README 8.9 and the Inventory, consume `TauCeti.homotopyGroupMulAction` and `TauCeti.homotopyGroupTransportQuotient` for "π₁Y acting trivially on π_nY" and for the fibre-π_n transport, and cite `TauCeti.fundamentalGroup_smul_eq_self` where simple connectivity gives the trivial action. The statement itself stays unstated: the cochain is data.

## R04 (P3) — Declaration names dropped by this pull request that other roadmaps cite have no old → new line

**Location.** README 510–531 ("Former names of this roadmap's own declarations …") lists neither `ordinaryEMUniversalClass` nor `simplicialRealizationCW`; neither string occurs anywhere in the README.

**Witness.** Both are declared in `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` on main (`ordinaryEMUniversalClass` at 1675–1708, `simplicialRealizationCW` at 1265–1274) and are gone at this head. They are cited by GeneralizedCohomology on main (README 35: "ordinaryEMUniversalClass, ordinaryEMRepresentability, …"; 229: "Consume AT4's `simplicialRealizationCW`"), ComplexKahlerGeometry on main (1352: "AT4.7's `simplicialRealizationCW`"), CharacteristicClasses on main (603) and FuchsianOrbifolds at #1168 (101). HomotopySpheres at #1287 (128, 146, 436) cites "AlgebraicTopology Stage 4 item 8, *Compact generation and the pointed adjunction*", which this head places in Stage 4.5 and 8.11b. The overlap index tracks section ids and anchors, not Lean names, so it reports none.

**Repair.** Add to the former-names paragraph: `ordinaryEMUniversalClass` is the normalized class `ι` of `ordinaryEMRepresentability` (its first conjunct); `simplicialRealizationCW` is Stage 4.7's realization CW structure, stated in prose; "Stage 4 item 8 (compact generation and the pointed adjunction)" is Stage 4.5's compact-generation interface and 8.11b's suspension–loop adjunction.

## R05 (P3) — GeometricTopology's "smoothing-and-triangulation comparison item 1" is 12.1 at this pull request's own head

**Location.** README 537–539 ("its smoothing-and-triangulation comparison item 1 with its realization homeomorphism, consumed by Stage 8.7") and 2680 ("GeometricTopology's smoothing-and-triangulation comparison item1 and its realization homeomorphism"). `Suggested.lean` 620 and 632 say "GeometricTopology's smooth triangulation" without a section.

**Witness.** `TauCetiRoadmap/GeometricTopology/README.md` at 9864ff4, 3116–3120: the section "earlier headed 'The smoothing-and-triangulation comparison (far horizon)'" is "renumbered: its item 1 (smooth implies PL) is 12.1"; 3122 is `### 12.1 Smooth manifolds are PL manifolds`, whose bullet (3139) reads "Compact smooth manifolds have finite CW type (`TauCeti.FiniteCWType`), through 11.2", and 3235 names AlgebraicTopology as the consumer of "Layer 11's realization API and CW structure and 12.1". Both folders are in this pull request, so the citation should use the head's numbering.

**Repair.** Write "GeometricTopology 12.1 (Whitehead's smooth triangulation) and Layer 11 (the realization homeomorphism and CW structure)" at 537–539 and 2680, and "GeometricTopology 12.1" in the two Lean docstrings.

## R06 (P3) — `homotopySpherePole` is not a pinned name, and the pinned pole is not the point the README means

**Location.** README 2262: "Compare p₀ directly with `q=ULift.up (homotopySpherePole 0)` on this same sphere carrier".

**Witness.** No declaration `homotopySpherePole` exists in the pinned Tau Ceti or Mathlib. The pinned pole is `TauCeti.spherePole` (`Topology/CWComplex/Classical/Sphere/Basic.lean` 61), the image of `∞` under the one-point-compactification homeomorphism `onePointEquivSphereOfFinrankEq`, for `EuclideanSpace ℝ ι` with `Fintype.card ι = n + 1`. Nothing pins it to `e₀`, the pole Stage 2.5 fixes ("the positive local chart at q=e₀", README 670).

**Repair.** Say "q = e₀, the pole of Stage 2.5" and drop the name; if the native pole is wanted, cite `TauCeti.spherePole` and add the equation `spherePole = e₀` (or its negation) as a Check, since the n = 0 dichotomy `p₀ = q` or `p₀ = −q` fixes the sign `σ₀`.

## R07 (P3) — Brown, *Topology and Groupoids*, "Chapters 6–7" is the wrong span for van Kampen

**Location.** README 604–606: "The proof spine is Brown, *Topology and Groupoids*, Chapters 6–7: subdivision gives generation, the square-grid subdivision of a homotopy gives relations, and the universal property identifies the colimit"; References 3219: "Chapters 6–7".

**Witness.** In the cached text (brown), the groupoid van Kampen theorem for a representative set of basepoints is 6.7.2 (line 9424, page 240) and the three steps named are its proof (9445–9590, the Lebesgue-number grid at 9483–9517). Chapter 7 is "Cofibrations" (contents, lines 87–93: the track groupoid, fibrations of groupoids, adjunction spaces, cellular approximation) and contains no van Kampen theorem. The presentation and based corollaries are 8.4.1 (12849) and 9.1.2 (13039, "The Van Kampen theorem" for adjunction spaces).

**Repair.** Cite "Brown, Section 6.7 (Theorem 6.7.2 and its proof), with Sections 8.4 and 9.1 for the presentation corollaries" at 604 and 3219.

## R08 (P3) — No stated order with the open pull requests that change this folder or carry the counterparts of its ownership moves

Re-raised: r68 R09 (and r58 R06); not repaired.

**Location.** The pull request's description (data). It still describes a side-file fold ("No statement changes … Each merged Suggested.lean was elaborated … zero errors in all three") and names no other pull request.

**Witness.** The overlap index lists #1652, #1663, #1807, #1808, #1854 and #1187 as conflicting with this head in `README.md` or `Suggested.lean`. The counterparts of this head's ownership statements live only at some of those heads: GeneralizedCohomology consumes "AT Stage 4.5's simplicial-realization product comparison" at #1854 (README 237) and #1807, while on main (234) it says "Build `realizationProductKelleyComparison`"; the Stage 4.5 and 8.11b numbering of compact generation is cited as "Stage 4 item 8" by HomotopySpheres #1287.

**Repair.** Describe this head (headline `Suggested.lean`, house-form README, the ownership statements of R01–R02) and state the order: this pull request first; #1854 and #1807 rebase on it and carry the GeneralizedCohomology, ClassifyingSpaces, CharacteristicClasses and DGFloer halves; #1652 and #1663 rebase and adopt the 4.5/8.11b numbering, after which HomotopySpheres updates its citation.

## Verified sound

**Previous review (r68 at a285fd7), finding by finding.**

| r68 | Status | Evidence at 9864ff4 |
|---|---|---|
| R01 DGFloer double owner | not repaired | README 111–131 unchanged in substance; DGFloer main 196–232, 405–416 and #1798 56–70 unchanged (R01 above) |
| R02 CC C1.2a double owner | not repaired | README 164–169, 1834–1838; CC main 66–67, 514 and heads #1854/#1807/#1808 unchanged (R02) |
| R03 integral duality statable | repaired | `poincareDuality_int` (`Suggested.lean` 503–516) on `TauCeti.HomologicalOrientation.fundamentalClass` through `capProduct`; README 2331–2337 names it; docstring 127–130 limits the unstated forms to the twisted and boundary cases |
| R04 `IsCIso`/`IsCEpi` duplicate Mathlib | repaired | both deleted; `hurewicz_isoModSerre` (688–698) uses `C.isoModSerre` and `C.epiModSerre`; README 241–247 and 2865–2870 cite `CategoryTheory/Abelian/SerreClass/MorphismProperty.lean` |
| R05 universal class not pinned | repaired | `ordinaryEMRepresentability` (753–762) has the Kronecker-on-Hurewicz normalization conjunct; `OrdinaryEMModel.homotopyIdentification` is now used; README 2936–2944 states the normalization and that it excludes `−ι` |
| R06 narrower Lean statements | repaired | `compactSupportTopClass_exists/_unique` (463–487) on `{E} [FiniteDimensional ℝ E] (hm) [T2Space M] [ChartedSpace E M]`, no smoothness or second countability, matching README 1992–1996; `compactManifoldWithBoundaryFiniteCWType` (634–638) on `𝓡∂ n` added, README 2684–2687 names both |
| R07 native towers | repaired | Inventory 465–480 lists `TauCeti.filteredSpaceSpectralSequence` with first page, `d¹`, abutment and finite convergence, and `TauCeti.fiberLocalSystem`; Stage 5.5 (1485–1490, 1540–1548) consumes them and owns only exhaustion, the `E²` identification and the Serre extension |
| R08 locators | repaired | Milnor 1959 "Theorem 3 and Corollary 3" (3245–3247, with the misprint noted); "Hatcher, Chapter 0 … Theorem 4.8 … Section 2.2" (1252–1253); "Section 4.2 the absolute Hurewicz theorem (Theorem 4.32)" (3127–3128); References "4.1–4.3 and 4.G, and the Appendix" (3222–3223); Proposition 2.22 at 1131–1133, Theorem 3.30 at 2331, Corollary 4.33 at 2555, Theorem 4.57 at 2942; "DGFloer cites as compactReducedSuspensionCarrierComparison" (876–877) |
| R09 order | not repaired | re-raised as R08 |
| R10 README form | repaired in substance | `**Summary.**` (3), `## Scope and ownership` (25), `## Conventions` (174), `## Exact supplier contracts` with Mathlib/Tau Ceti/other roadmaps (232–543), `## How to read the build` (545), `### Examples` and `### Dependencies` in every stage, `## Downstream consumers` (3173); `**Checks.**` lists for `ordinaryPairQuotient` (846), `lsCupLength` (1795), `LocallyRepresentedTopSection` (1999), `HasProperHomotopyExtensionProperty` (2622), `groupClassifyingSpace` (2699), `SatisfiesSerreAxioms` (2873), `OrdinaryEMModel` (2975); `SingularHomology` named at 1725; the word "current" is gone. The headings stay `## Stage k` with numbered items rather than `## Layer k`/`### k.n`; every consumer on main and at the open heads cites "Stage k.n", so I did not ask for a renaming |

**Gate.** Worker's run at 9864ff4: every check 0, build 0. My rerun without `--build` agrees except `outside-folder`, whose hits are all files of the pull request's other folders (GeometricTopology `references/`), an artefact of running on one folder.

**Dependency check.**

```
depcheck: 238 roadmaps, 2350 edges, 0 problem(s)
```

AlgebraicTopology, DifferentialGeometry, DGFloer, CharacteristicClasses and GeometricTopology are roadmaps on main not listed in the merge order; the exchange with DifferentialGeometry (AT 6.3 consumes DG 2 and 5.1 and compares with DG 10; DG Layer 8 consumes AT 2, 3 and 6.1–6.2, DG main README 1034–1037) is acyclic item by item, and the loop-cutting head #1807 keeps the same text.

**Build, signatures, probe.**
- `lake env lean` on `Suggested.lean`: exit 0, exactly 22 `declaration uses sorry` warnings (lines 290, 298, 321, 327, 337, 363, 463, 478, 494, 507, 540, 553, 566, 592, 605, 623, 634, 658, 688, 753, 768, 777), nothing else.
- The worker's 55 elaborated signatures agree with the README statements. The two "looks dropped" leads, `relativeCWPushoutInclusion` and `relativeCWPushoutCarrier`, lose `[T2Space Y]`/`[T2Space Z]` harmlessly: the carrier is the pushout of arbitrary spaces and both theorems about it keep the separation hypotheses.
- One-tactic probe: a scratch copy with every `sorry` replaced by `first | rfl | (simp; done) | infer_instance | decide | exact? | sorry` (1 min 46 s) still reports all 22 sorries and no `Try this`; nothing closes.
- Form: `module` header, `public import Mathlib` and 61 `TauCeti.*` modules, one module docstring in the house form, `namespace TauCetiRoadmap.AlgebraicTopology`, stage section comments, `theorem` only, no `lemma`, `set_option`, `#eval`, `#print`, sorry'd data or `True` placeholder; the 80 `#check` lines pin library declarations only.

**Headline theorems.** The Summary (9–14) lists eight: Poincaré duality for closed manifolds with `ℤ/2` and with `ℤ` under an orientation (`poincareDuality_zmodTwo`, `poincareDuality_int`), relative Hurewicz with only the subspace simply connected (`relHurewicz_bijective_of_simplyConnected_subspace`), homological Whitehead (`homologicalWhitehead`), finite CW type of compact manifolds (`compactManifoldFiniteCWType`, `compactManifoldWithBoundaryFiniteCWType`), the `K(π,1)` property of the bar model (`groupClassifyingSpace_isEMOne`), Hurewicz modulo a Serre class (`hurewicz_isoModSerre`), representability (`ordinaryEMRepresentability`) and mapping-space CW type (`finiteSourceMappingCWType`, `basedLoopCWType`). All eight are stated. The docstring's seven "not statable" items: I confirmed at the pin that there is no compactly supported singular cohomology (only `Topology/ContinuousMap/CompactlySupported.lean` and the CW compact-support lemma), no Serre-fibration fibre local system (`fiberLocalSystem` needs a lifting function), and no orientation local system with coefficients; the `π₁`-action reason is wrong (R03), the conclusion (data) stands.

**Library declarations opened at the pins.**
- Tau Ceti: `Homotopy/Hurewicz/Basic.lean` 652 (`hurewiczHom : Additive π_{n+1} →+ (R ⟶ H_{n+1}(X;R))`); `Singular/LocalHomology/Orientation/Homological.lean` 75 (`HomologicalOrientation`: a local orientation at every point, compatible with path transport); `LocalHomology/FundamentalClass.lean` 139 and 204 (`fundamentalClassOn`, `fundamentalClass` with coefficients `ULift ℤ`); `EilenbergMacLane/Basic.lean` 123 (`IsEilenbergMacLaneSpaceOne` = aspherical ∧ `Nonempty (π₁ ≃* G)`); `CWComplex/Classical/FiniteCWType.lean` 74 and `CWType.lean` 38 (homotopy equivalence to a T2 (finite) CW complex); `Topology/Triangulable/FiniteCWType.lean` 41 (`IsTriangulable.finiteCWType` for compact spaces); `Topology/Homotopy/LusternikSchnirelmann.lean` 84 and 264 (covers by bundled opens with nullhomotopic inclusions; `lsCategoryCount` an infimum in `ℕ∞`); `Topology/Homotopy/HomotopyGroup/FundamentalGroupAction.lean` 90–364 (R03); `Topology/CWComplex/Classical/Sphere/Basic.lean` 61 (`spherePole`, R06); `Topology/Algebra/Projectivization.lean` 90 (the duplicate topology the Inventory describes); `Topology/Homotopy/SerreFibration/FiberBundle.lean` 365; `Singular/LocalHomology/Orientation/Chart.lean` 169; `Cohomology/Local/Basic.lean` (local cohomology at a point, not compact support).
- Mathlib: `CategoryTheory/Abelian/SerreClass/MorphismProperty.lean` 59 and 66 (`epiModSerre`, `isoModSerre`); `RepresentationTheory/Homological/GroupHomology/Basic.lean` 125–133 (the first term of `inhomogeneousChains.d` is `A.ρ (g 0)⁻¹`, as README 5.3 says); `Topology/Algebra/Projectivization.lean` 47–83 (`isQuotientMap_mk'`, `continuous_mk'`, `continuous_iff`, `continuous_mk`, `continuous_map`, `isOpenMap_mk'`, `isOpenQuotientMap_mk'`); `Topology/Compactness/CompactlyGeneratedSpace.lean` 68.
- All 232 backticked dotted names of the README resolve at the pins except module paths named in prose; `homotopySpherePole` (R06) is not backticked.

**Cross-roadmap citations resolved.**
- GeometricTopology at this head: 12.1 (3122), Layer 11 (2908), 1.1 collars (575), 1.3 tubular neighbourhoods (665), Downstream consumers 3235 (R05).
- DifferentialGeometry on main: Layer 2 with 2.4 (341–370), 5.1 outward-first `boundaryOrientation` (507–510), 9.3 de Rham duality only (872–876), Layer 10 degree (877–897); the same layers exist at #886.
- DeRhamCohomologyAndDuality #1768: §4.1 (512–546) consumes AT 6.3's classes, as README 6.3 says; its line 60 records that AT once named DG 9.3 instead, which this head no longer does.
- DGFloer main and #1798 (R01); CharacteristicClasses main and #1854/#1807/#1808 (R02); GeneralizedCohomology main 34–35, 229–239 and #1854 34–36, 232–237; ClassifyingSpaces main 72–80; HomotopySpheres #1287 128, 146, 436; FuchsianOrbifolds #1168 101; ComplexKahlerGeometry main 1352 (R04).
- Names other roadmaps cite from here and the README keeps in prose: `relativeCWPushoutCWModel` (1032), `basedHomotopyInverseOfEquivalence` (528, 1069), `cwProductKelley` (1077), `standardCellBallToOrderedSimplex` (1192), `reducedSuspensionSphereHomeomorph` (855), `compactReducedSuspensionCarrierComparison` (877).
- Overlap leads: no cited id dropped by an open pull request, none defined only by an open revision, none of this roadmap's section ids dropped; the vocabulary neighbours DGFloer and CharacteristicClasses give R01 and R02; StableHomotopyKTheory #1227 cites `standardCellBallToOrderedSimplex`, kept in prose.

**Seeded sample (15 of the 36 locator lines, seed 79).**

| # | README line | Target | Source line | Result |
|---|---|---|---|---|
| 1 | 604 | Brown, Chapters 6–7, for generation, relations and the colimit | brown 9424 (6.7.2), 87–93 (Chapter 7 is cofibrations), 13039 (9.1.2) | fails (R07) |
| 2 | 740 | Eilenberg–Steenrod, Chapters I–III | not in the cache | not verifiable |
| 3 | 741 | Hatcher, Sections 2.1–2.2 (and 3.H) for relative homology and local coefficients | hatcher 28–34, 58 (contents) | supports |
| 4 | 780 | Hatcher, Proposition 2.21, small chains | hatcher 5222–5224 | supports |
| 5 | 1025 | Hatcher Proposition A.3, CW complexes normal | hatcher 22617 | supports |
| 6 | 1091 | Hatcher Appendix A.6, product CW structure on `(X×Y)_c`, equal to `X×Y` for a locally compact factor | hatcher 22693–22697 | supports |
| 7 | 1221 | Hatcher Proposition 4.21, weak equivalences induce homology isomorphisms with any coefficients | hatcher 15508–15510 | supports |
| 8 | 1243 | Hatcher 4.18, lifts between CW models unique up to homotopy rel A | hatcher 15454–15460 | supports |
| 9 | 1246 | Hatcher Example 4.14, CW approximation of a pair | hatcher 15379–15383 | supports |
| 10 | 1563 | Hatcher Section 3.B, general Künneth | hatcher 52 | supports |
| 11 | 2520 | Hatcher 2A.1, `H₁ ≅ π₁ᵃᵇ` for path-connected X | hatcher 7230–7233 | supports |
| 12 | 2542 | Hatcher Theorem 4.37, relative Hurewicz for an (n−1)-connected pair, n ≥ 2, A ≠ ∅ | hatcher 16124–16126 | supports (with A simply connected, π′ₙ = πₙ) |
| 13 | 2805 | Hatcher 4.30, uniqueness of K(G,n) | hatcher 15928–15929 (Proposition 4.30) | supports |
| 14 | 3127 | Hatcher Section 4.1 gives Whitehead's theorem (4.5) | hatcher 61–63, 15109–15112 | supports |
| 15 | 3131 | Hatcher Section 4.3 supplies representability (4.57) and obstruction theory | hatcher 67–69, 17069–17071 | supports |

Also checked: Hatcher Theorem 3.30 (10453) for both duality statements; Proposition 2.22 (5456) for the pair quotient; Corollary 4.33 (16001) for homological Whitehead; Proposition 4.13 (15375) for CW approximation of every space; Lemma 3.27 (10255) for the compact-support lemma; Theorem 3.43 (10976) for the triad duality; Example 0.6 (453) for the `CPⁿ` cells; Proposition 0.19 (867) for the based inverse; the comb example "preceding Example 0.15" (794–796) for the `HasProperHomotopyExtensionProperty` Check; Proposition 3G.1 (14042) for transfer; Lemma 4.31 (15931) for skeletal extension; Theorem 4.32 (15961); Milnor 1959 Theorem 3 (milnor1959 209–212) and Corollary 3 (218–219) for the mapping-space statements; Mathlib's inhomogeneous-chains sign for README 5.3.

**Adversarial pass** (values computed on each side).

| Statement | Instances | Values | Result |
|---|---|---|---|
| `ordinaryPairQuotientComparison` / cohomology form | B = ∅; B = X ≠ ∅; (D¹,S⁰); n = 0 | H_n(X,∅) = H_n(X) vs H̃_n(X₊) = H_n(X); H_n(X,X) = 0 vs H̃_n(pt) = 0; H₁(D¹,S⁰) = ℤ vs H̃₁(S¹) = ℤ; H₀(D¹,S⁰) = 0 vs H̃₀(S¹) = 0 | holds; the non-good pair ([0,1], {0}∪{1/k}) is excluded by `RelCWComplex` |
| `relativeCWPushout_t2Space`, `_base_isClosedEmbedding` | (D¹,S⁰) attached to a point; (Y,∅) | S¹ is T2 and pt → S¹ is a closed embedding; the pushout is Z ⊔ Y, Z clopen | holds; `B` is closed as the base of a relative CW pair |
| `homotopyInversePairExtension_left` | A = X; A = ∅; A = pt | g = g₀ and H = H₀; a plain left inverse; the based inverse of Hatcher 0.19 | holds; general case by relative HEP and the cylinder theorem |
| `exists_cwApproximation` | ∅; ℚ; the Warsaw circle | Z = ∅; Z = ℚ discrete (components are points); Z = pt | holds |
| `compactSupportTopClass_exists/_unique` | m = 0; K = ∅; ℝ, K = [−1,1], L = ℤ | H₀(M,M∖K;L) = ⊕_{x∈K} L_x with projections as local images; H_m(M,M;L) = 0; H₁(ℝ,ℝ∖K) = ℤ with a generator at every x | holds; the family +1 on (0,∞), −1 on (−∞,0] is not locally represented at 0 (README Check 2), so the hypothesis is needed |
| `poincareDuality_zmodTwo` | n = 0; RP²; ∅; p = n+1 | (ℤ/2)^M → (ℤ/2)^M by a ↦ a⌢Σ[x]; ranks of H^p and H_{2−p} both 1,1,1; 0 → 0; `hp` excludes H^{n+1} = 0 vs H₀ ≠ 0 | holds |
| `poincareDuality_int` | S²; S¹; n = 0 with o = Σ ε_x[x]; S² ⊔ S²; RP² | H⁰ = ℤ → H₂ = ℤ, H¹ = 0 → 0, H² = ℤ → H₀ = ℤ; 1 ↦ [S¹], generator ↦ generator of H₀; a ↦ Σ ε_x a(x)[x] bijective; componentwise; RP² has H²(ℤ) = ℤ/2 vs H₀ = ℤ and admits no `HomologicalOrientation` in degree 2 | holds; the orientation hypothesis is what excludes RP² |
| `LSPositiveCupProduct`, `lsCupLength` | pt; ∅; Sⁿ; T² over ℤ; RPⁿ over ℤ/2; CP^∞ over ℤ; R = 0 | 0 (empty supremum); 0; 1 (the generator, square in H²ⁿ = 0); 2 (a⌣b generates H²); n; ⊤ (powers of the degree-2 class); 0 | the definition excludes degree-0 factors, so a point has length 0 and not ⊤ |
| `lsCupLength_add_one_le_categoryCount` | pt; k points; Sⁿ; T²; RPⁿ (ℤ/2); CP^∞; ∅ | 0+1 ≤ 1; 0+1 ≤ k; 1+1 ≤ 2; 2+1 ≤ 3; n+1 ≤ n+1; ⊤ ≤ ⊤; 0+1 ≤ 0 fails, excluded by `[Nonempty X]` | holds, sharp on spheres and projective spaces |
| `relHurewicz_bijective_of_simplyConnected_subspace` | (D³,S²), n = 0; Y = D³ ⊔ S³ | π₁(D³,S²) = π₀S² = 0, π₂ = π₁S² = 0, so π₃(D³,S²) ≅ π₂S² = ℤ vs H₃ = H̃₂(S²) = ℤ; the native theorem needs B and Y both 2-connected and π₂S² = ℤ ≠ 0 fails that, so this is new content; the disconnected Y gives π₃ = ℤ vs H₃ = ℤ², so `[PathConnectedSpace Y]` is needed | holds; indices: `RelHomotopyGroup (Fin k)` is π_{k+1}, so `hrel` kills π₁…π_{n+2} and the conclusion is degree n+3 |
| `homologicalWhitehead` | id_{S²}; degree-one P → S³ (P the Poincaré sphere) | iso; H_* iso but π₁P ≠ 0, excluded by `[SimplyConnectedSpace X]` | holds |
| `HasProperHomotopyExtensionProperty` | A = ∅; A = X; the comb pair | stationary homotopy, proper since I is compact; K = H; no retraction I×I → I×{0} ∪ A×I (Hatcher 794–796) | discriminates, as the README Checks say |
| `HasProperHomotopyExtensionProperty.cylinderBoundary` | A = ∅; A closed | the set is {0,1}×X, and the stationary extension of a proper homotopy on it is proper; in general the proper retraction onto 0×X ∪ I×A followed by the square homeomorphism (I², 0×I ∪ I×∂I) ≅ (I², 0×I) | holds |
| `properStrongDeformationRetract_of_inverse` | A = X; ([0,∞), {0}) | r = id, H stationary; the inverse [0,∞) → pt is not proper, so `hInverse` fails and no proper retraction onto a point exists | consistent |
| `compactManifoldFiniteCWType`, `…WithBoundary…` | n = 0; ∅; Sⁿ; [0,1] (n = 1); S¹ with half-space charts | finite discrete; empty complex; two cells; two 0-cells and a 1-cell; S¹ | holds; `SecondCountableTopology` is redundant under compactness and absent in the boundary form, harmless |
| `groupClassifyingSpace_isEMOne` | G = 1; ℤ; ℤ/2 | a point; ≃ S¹ with π₁ = ℤ; ≃ RP^∞ with π₁ = ℤ/2 | holds |
| `SatisfiesSerreAxioms` | 0; torsion; finite; finitely generated; groups killed by a fixed dᵐ | all axioms hold for the first four (⊗, Tor of f.g. are f.g.; H_i(K(A,1)) f.g. for f.g. A); the last is not even a Serre class (0 → ℤ/dᵐ → ℤ/d²ᵐ → ℤ/dᵐ → 0) | discriminates |
| `hurewicz_isoModSerre` | C = 0, S², n = 0; C torsion, S³, n = 1; C torsion, S², n = 0; RP², C torsion, n = 0 | absolute Hurewicz: H₁ = 0, h₂ iso, h₃: ℤ → 0 epi; H₁ = H₂ = 0, h₃: ℤ → ℤ iso, h₄: ℤ/2 → 0 cokernel 0; h₃: π₃S² = ℤ → H₃ = 0 has cokernel 0 (epi mod C) but kernel ℤ ∉ C, so the weaker degree-(n+3) conclusion is the right one; RP²: π₂ = ℤ → H₂ = 0 has kernel ℤ ∉ C, excluded by `[SimplyConnectedSpace X]` | holds; `hurewiczHom (n+1)` is π_{n+2} → H_{n+2}; hypotheses `π_i ∈ C` for 2 ≤ i < n+2 match Serre's `i < N` with N = n+2 |
| `OrdinaryEMModel` | S¹ for (ℤ,1); CP^∞ for (ℤ,2); S² for (ℤ,2); pt for (0,n); two points | admitted; admitted; π₃S² = ℤ violates `vanishing`; admitted; `connected` fails | discriminates |
| `ordinaryEMRepresentability` | A = 0; X = ∅; two points, n+1 ≥ 1; X = S¹ = K, n = 0; S¹∨S¹, n = 0 | [X,K] = 1 = H^{n+1}; 1 = 1; π₀(K)² = 1 vs H^{n+1} = 0; degree ℤ = H¹(S¹) = ℤ; Hom(F₂,ℤ)/conj = ℤ² = H¹ | holds; the normalization gives ⟨ι, h(γ_std)⟩ = 1 and rejects −ι (value −1) and ι∘α for α ≠ id |
| `finiteSourceMappingCWType` | K = ∅; K = pt; X = ∅, K ≠ ∅ | C(∅,X) = pt; ≅ X; ∅ (the empty complex) | holds |
| `basedLoopCWType` | S¹ at its 0-cell | ΩS¹ ≃ ℤ discrete | holds |
| `capProduct` degree | p = q+1 | excluded by `p ≤ q`, so `q − p` is never a junk 0 | holds |
| cap and MV sign pins (README 203–210) | k = 0; n = 1 | ∂(c⌢φ) = (−1)⁰(∂c⌢φ − c⌢δφ), Hatcher's formula at 10400 | agrees |
| 5.3 Cartan–Leray first boundary term | Mathlib `inhomogeneousChains.d` | first term `A.ρ (g 0)⁻¹`, as README says ("ρ(g₀⁻¹), do not invert again") | agrees |
| 6.3 boundary conversion `(−1)^m` | D¹; D² | ∂[D¹] = [+1] − [−1]; outward-first boundary of the counterclockwise disk is counterclockwise S¹ | agrees with the README Checks |
| 4.6 RP² differentials | constant ℤ; sign system ε | d₂ = ±2, d₁ = 0; d₂ = 0, d₁ = ±2, so H⁰(RP²;ε) = 0, H¹ = ℤ/2, H² = ℤ = H₂, H₁, H₀ of RP² in reverse | agrees with twisted duality |
| 4.5 cocountable example | uncountable X, cocountable topology | compact sets finite, kX discrete ≠ X | agrees |
| 8.11b degree bookkeeping | ΣSⁿ | reflection −1 times interval-first (−1)ⁿ = (−1)^{n+1} | agrees |
| 7.4 Euler values | Sⁿ, Tⁿ, CPⁿ | 1 + (−1)ⁿ, 0, n+1 | agrees |

**Ownership.** The moves of compact generation (from HomotopySpheres), the realization-product comparison (GeneralizedCohomology), the nerve model (ClassifyingSpaces), the Serre machinery and `K(A,n)` (DGFloer) and the supported cochains (CharacteristicClasses) into this roadmap follow the direction of supply, since each of those roadmaps consumes this one. Two counterparts exist nowhere (R01, R02) and the others only at unnamed open heads (R08). Of the open pull requests without a checkout in the brief, I read #1807, #1808, #1854, #1652, #1663 and #1187 through the roadmaps tool; others were not checked.

## Not verifiable

- serre1953 Chapter III Theorem 1 (uncertified): the degree-(n+3) epimorphism conjunct of `hurewicz_isoModSerre` was checked by instances (table), not against Serre's text; Hatcher SSAT Theorem 1.8 states only the isomorphism.
- Eilenberg–Steenrod Chapters I–III (sample item 2), Whitehead *Elements* II–VII, Dold VII–VIII, May 3 and 12, McCleary 1–2, K. Brown VII and Serre 1951 are cited at chapter level and are not in the cache.
- milnor1963 Lemmas 3.6–3.7, tomdieck2008 Theorem 9.5.1, weibel 5.5.1 and 5.5.10, fq1990 §7.7 and dowker1952 are uncertified and cited by locator.
- GeometricTopology 12.1's smooth triangulation of manifolds with boundary, which `compactManifoldWithBoundaryFiniteCWType` relies on, is GT's target (Whitehead 1940, Munkres 10.5–10.6 cited there); I checked GT's statement, not those texts.

## Source issues

- **Misprint** in milnor1959 at the proof of Corollary 3, printed page 276 (cache line 221): the source says Theorem 4 gives the CW type of the loop-space triad; it should be Theorem 3, the paper's only function-space theorem; affects nothing (the README records it at 3246–3247).
