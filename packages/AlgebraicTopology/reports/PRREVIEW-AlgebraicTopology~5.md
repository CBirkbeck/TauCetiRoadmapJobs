# Review of AlgebraicTopology (pull request #1652 at 9948348)

**Verdict:** needs changes

## R01 (P2) — §1.6 restates a theorem the pinned Tau Ceti already proves

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:392–403` (“construct pointwise multiplication on native based path-homotopy classes and prove that `FundamentalGroup G 1` is abelian … Apply native Eckmann–Hilton”).

**Claim:** The commutativity of π₁ of a space with a continuous unital multiplication, and the identification of the pointwise loop product with the group law, are targets of this roadmap.

**Witness:** `TauCeti/AlgebraicTopology/FundamentalGroup/TopologicalMonoid.lean` at the pin `a91d3aaf`: `FundamentalGroup.cast_map_prod_mul` (line 108, the class of the pointwise product of two loops at `1` is their product in π₁) and `FundamentalGroup.instCommGroup` (line 118, π₁(M,1) is a commutative group), for any topological space with continuous multiplication and two-sided unit, through Mathlib's `EckmannHilton.mul`/`mul_comm` and `FundamentalGroup.prodMulEquiv`. On `U(1)` both sides send the loops `z ↦ zᵐ`, `z ↦ zⁿ` to `m + n`; on `SO(3)` the group is `ℤ/2`; the supplier-contract section names neither declaration.

**Repair:** Add both declarations to “From Mathlib and Tau Ceti” and rewrite §1.6 as consumption: keep only what the pin lacks (naturality under continuous unital multiplicative maps, and the comparison with `FundamentalGroup.mul_def`'s reversed composition), each stated with `cast_map_prod_mul` as input. Checked on `U(1)`: naturality under `z ↦ z²` sends `m` to `2m` on both routes.

## R02 (P2) — Two statable headlines of §8.7 are absent from `Suggested.lean`

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:2456–2462` (“every finite-dimensional Hausdorff second-countable smooth manifold … The compact case has finite CW type … a simply connected integral homology `n`-sphere, `n>=2`, is homotopy equivalent to the standard `S^n`”); `TauCetiRoadmap/AlgebraicTopology/Suggested.lean:17–35` (the docstring's list of what is not statable).

**Claim:** Every headline statable at the pins is stated; the docstring names the rest.

**Witness:** Both statements elaborate against the pins with only a `sorry` warning (scratch copy): a structure `FiniteCWTypeModel X extends CWTypeModel X` with the field `finite : letI := topology; letI := cw; CWComplex.Finite (Set.univ : Set carrier)`; the theorem that for `[ChartedSpace (EuclideanSpace ℝ (Fin n)) M] [IsManifold (modelWithCornersSelf ℝ (EuclideanSpace ℝ (Fin n))) ∞ M] [T2Space M] [SecondCountableTopology M] [CompactSpace M]` there is `Nonempty (FiniteCWTypeModel M)` (needs `open scoped ContDiff`); and the theorem that a `[SimplyConnectedSpace X]` with a `CWTypeModel X`, `IsZero` integral homology in every degree other than `0` and `n ≥ 2`, and `H_n(X;ULift ℤ) ≅ ULift ℤ`, has `Nonempty (X ≃ₕ Metric.sphere (0 : EuclideanSpace ℝ (Fin (n+1))) 1)`. The first is the headline three roadmaps on main consume under the deleted name `compactManifoldFiniteCWType` (`TauCetiRoadmap/FuchsianOrbifolds/README.md:81`, `TauCetiRoadmap/HeegaardFloer/README.md:1992`, HomotopySpheres at its open head `README.md:68–72, 347–349`); on main it was a `sorry`'d `def` (`Suggested.lean:1154` on main), rightly deleted, but not restated as a theorem. Neither is named in the docstring. On the point (`n = 0`) the first gives the one-cell model; on `S²` the second with the identity model gives `S² ≃ₕ S²`; the Poincaré homology sphere is excluded by `SimplyConnectedSpace`.

**Repair:** Add `FiniteCWTypeModel` and the two theorems above (Layer 8 section), keeping the `SecondCountableTopology` and `T2Space` hypotheses of GeometricTopology's triangulation item; mention them in §8.7's first paragraph by name. Tested: the scratch file with exactly these statements elaborates with two `sorry` warnings and nothing else.

## R03 (P3) — Nine roadmaps on main cite Lean names this head deletes

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:2827–2833` (“Downstream consumers”).

**Claim:** Consumers can find the objects they consume from this roadmap.

**Witness:** Of the 336 declarations removed from `Suggested.lean` relative to main, eight are cited as supplier declarations on main: `reducedSuspensionSphereHomeomorph` and `compactReducedSuspensionCarrierComparison` (`TauCetiRoadmap/DGFloer/README.md:179, 1575`; `TauCetiRoadmap/RiemannianGeometry/README.md:588`), `relativeCWPushout` (`TauCetiRoadmap/MorseTheory/README.md:407`; `TauCetiRoadmap/CharacteristicClasses/README.md:588`), `supBallEuclideanDiskHomeomorph` (`CharacteristicClasses/README.md:568`), `diskQuotientSphereHomeomorph` (`TauCetiRoadmap/GeneralizedCohomology/README.md:1022`), `brouwerFixedPoint_compactConvex_finiteSpan` (`TauCetiRoadmap/BanachAlgebras/README.md:1151`), `BasedTopPair` (`TauCetiRoadmap/AffineMorseLefschetz/README.md:480`), `normalizedLSCategory` (`MorseTheory/README.md:483`), `compactManifoldFiniteCWType` (R02). Each object survives here as prose (§§4.4, 4.5, 2.5, 2.7, 8.1, 6.2, 8.7), so ownership is unchanged, but the consumers' citations now resolve to nothing; no open-head Lean file imports this module.

**Repair:** In “Downstream consumers”, name per consumer the section that now carries each object (DGFloer and RiemannianGeometry: §4.4's reduced-suspension sphere homeomorphism and Kelley comparison; MorseTheory and CharacteristicClasses: §4.5's relative CW pushout and §2.5's sup-ball/disk homeomorphism; GeneralizedCohomology: §4.4's disk quotient; BanachAlgebras: §2.7's finite-span form; AffineMorseLefschetz: §8.1's based pair; MorseTheory: §6.2's normalized category), so each consumer's repointing has a target; restore the finite-CW-type headline as in R02.

## R04 (P3) — §2.6 “defines” the pinned local-coefficient carrier

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:519–520` (“Define a local coefficient system as a functor from Mathlib's fundamental groupoid to the coefficient-module category”).

**Claim:** The local coefficient system is constructed here.

**Witness:** `TauCeti/AlgebraicTopology/LocalCoefficient.lean:43` at the pin: `abbrev LocalCoefficientSystem (R) [Ring R] (X : TopCat) := FundamentalGroupoid X ⥤ ModuleCat R`, which the supplier contract at line 210 already names; the convention sentence that follows (coefficient at the initial vertex, zeroth face transports along `[e₀,e₁]`) agrees with `Singular/Twisted/Basic.lean`'s module docstring (lines 7–10). The constant system on `S¹` and the sign system on `RP²` (monodromy `−1`) are both instances of the pinned abbrev.

**Repair:** Replace “Define … as a functor” by “Consume native `LocalCoefficientSystem R X`”, keeping the convention sentence as the statement of the pin's choice.

## R05 (P3) — Three locators

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1250–1252` (“prove `p_* transfer = d * id` (Hatcher, Section 3.G, Proposition 3G.1, p.321)”), `:547–559` (the no-retraction route, no locator), `:695` and `:2655` (“Propositions A.14–A.16, pp.530–532”).

**Claim:** Each locator supports the statement at the claim.

**Witness:** Proposition 3G.1 (`hatcher line 14042`, PDF 330 = p.321) is the field-coefficient statement that `π^*` is injective with image the `Γ`-invariants when the characteristic does not divide `n`; the chain identity “`π♯τ` is multiplication by `n`” is the paragraph before it (`hatcher line 14031`, same page). The disk no-retraction theorem is Hatcher Corollary 2.15, p.114 (`hatcher line 5005`), uncited in §2.7. Propositions A.14–A.16 sit on PDF pages 539–540 = pp.530–531 (`hatcher lines 23034, 23063, 23081`). The homology-sphere corollary of §8.7 has no locator (Hatcher Corollary 4.33, p.367, is the standard one).

**Repair:** Cite “Section 3.G, p.321, the transfer paragraph preceding Proposition 3G.1” for the chain identity and keep 3G.1 for the invariants corollary; add Corollary 2.15, p.114 to §2.7; write pp.530–531; add Corollary 4.33, p.367 to §8.7.

## R06 (P3) — One Check with the wrong value and six definitions without Checks

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md:1062–1063` (“a model that re-adds the two 0-cells of B would have χ=1”); §§3.1, 5.6, 6.1, 6.5, 8.2, 8.3.

**Claim:** Each Check computes a value a wrong definition would miss; each definition has three discriminating Checks.

**Witness:** Attaching `(D¹,S⁰)` to a point: the correct count is `1 − 1 = 0`; a model that adds the two base `0`-cells to the point of `Z` has `3 − 1 = 2`, not `1` (the value `1` needs a model that drops `Z`'s point, which is not what the sentence says). The barycentric subdivision operator and prism (§3.1), the finite-cover double complex (§5.6), direct local-system cochains (§6.1), the torsion linking pairing (§6.5), Kan homotopy groups and the Moore comparison (§8.2) and the absolute Hurewicz map (§8.3) define objects with no `**Checks.**` block.

**Repair:** Say which wrong model gives which value (`2` for re-adding, `1` for dropping `Z`'s point). Add three Checks each, for instance §3.1: the subdivision of a `1`-simplex is the sum of its two halves with the middle vertex cancelling in the boundary, the prism on a `0`-simplex is zero, and `∂P + P∂ = Sd − id` on a `1`-simplex evaluated termwise; §6.5: on `RP³` the pairing on `Tor H₁ = ℤ/2` is `1/2`, on `S³` it is empty, and `L(3,1)` has value `±1/3`; §8.3: the degree-`k` loop on `S¹` maps to `k`, the constant loop to `0`, and on `S¹ ∨ S¹` the commutator maps to `0`.

## R07 (P3) — Mixed vocabulary and run-together tokens

**Location:** `TauCetiRoadmap/AlgebraicTopology/README.md` headings “Layer k” against 106 occurrences of “Stage k” in the prose (for example lines 351, 473, 1551); 24 tokens with a missing space (lines 542 “radius0”, 555 “dimension0”, 1551 “of6.2”, 1569 “and∞”, 1616 “category1”, 1640 “Stage8.5”, 1725 “Lemma3.27”, 2057 “Theorem3.43”, 2060 “AffineA4.0”, 2163 “Milestones1”, 2406 “Theorem4.2”, 2431 “Compositio27”, …); abbreviations `AT`, `DG`, `GT`, `CC`, `CS`, `CKG`, `TopK` used from line 76 (“AT6.3”, “DG9.3”) without being introduced.

**Claim:** Standard vocabulary, every term defined where it first appears.

**Witness:** The quoted lines.

**Repair:** Use one word for the build unit (the headings' “Layer”), restore the spaces, and introduce each abbreviation at its first use (“DifferentialGeometry (DG) Layer 9.3”).

## Verified sound

**Repair status of the previous review (afc4ab5 → 9948348).** R01 repaired: the seven auxiliary Lean files are deleted; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` and the pre-existing `PROGRESS.md`/`STATUS.md` (unchanged from main); the only backticked underscore names left in the README are library names and the file's own declarations. R02 repaired: `poincareDuality_twoTorsionCoefficients` (`Suggested.lean:180`) states the `2 = 0` closed-manifold duality through `TopCat.singularCap`, universe-polymorphic. R03 repaired: §4.4 line 821 gives Layer 4.0 the convenient comparisons, HomotopySpheres is named as a consumer only (lines 824, 871), and no sentence assigns a supplier target to its §3A.2. R04 repaired: §5.0's fourth bullet is the comparison with the library's Serre-fibration carrier, and the DGFloer boundary (lines 110–116) describes what 5.0 provides. R05 repaired: no QICLean, Zulip, GitHub-branch or “when it lands” residue; the remaining links are Hatcher's and Milnor's texts and the Numdam copy of Farrell–Taylor–Wagoner. R06 repaired: no split camel-case tokens; the 30 backticked own names are exactly the declarations of `Suggested.lean`; `normalizedLSCategory` is now prose (line 1571). R07 repaired for the locators (3.B alone at 1348; Chapter 0, pp.5–17 at 1159; Brown 6.7.2, p.240 at 405; theorem-level locators on 2.2, 2.4, 3.5, 4.2, 5.4, 7.3, 8.6); no `sources.toml` was added, and none of the 124 roadmaps on main carries one, so this is not raised again. R08 repaired: the docstring names absolute Hurewicz (no Hurewicz map at the pins) and the tower Milnor sequence (no limit complex) at lines 22–29; `finiteSourceMappingCWType` keeps `T2Space X` with its reason; §5.3 no longer assumes a connected base. R09 repaired: `**Checks.**` blocks on 22 subsections (2.5, 2.7, 4.0, 4.3–4.7, 5.0, 5.3, 6.0, 6.2, 6.3, 6.4, 7.1, 8.1, 8.5 twice, 8.8–8.12) and nine `### From TauCetiRoadmap.<X>` subsections.

**Gate, build, dependency check.** The worker's gate at 9948348 passes every counter. `lake env lean` of `Suggested.lean` exits 0 in 7 s with exactly 17 `declaration uses sorry` warnings (lines 56, 66, 79, 111, 119, 169, 180, 203, 213, 223, 244, 256, 268, 281, 296, 316, 344) and nothing else. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` (checked with `rev-parse` in the package checkouts). The diff outside the folder is empty. Dependency check with `--movable`:

```text
depcheck: 205 roadmaps, 1595 edges, 0 problem(s)
```

**Signatures.** All 30 elaborated types were compared with the README statements: none lost a binder. The three `finiteCWEulerCharacteristic_*` theorems carry `T2Space` instances their statements do not mention, as §7.1 intends (invariance needs Hausdorff carriers); `HasProperHomotopyInverse` is universe-heterogeneous in `X`, `Y`, which is right for a predicate on a map.

**Padding probe.** A scratch copy replaced each `sorry` by `first | rfl | simp | infer_instance | (intros; simp_all) | sorry`: 13 theorems kept their `sorry` warning and 4 (`brouwerFixedPoint_compactConvex`, `finiteCoverTransfer_exists`, `towerDifference_surjective`, `properStrongDeformationRetract_of_inverse`) ended in unsolved goals after `simp` rewrote them; none closed. No declaration mirrors a Check or computes a value; `finiteCWEulerCharacteristic` is the pin's own alternating count `∑ᶠ i, (-1)^i * Nat.card (cell C i)` (right-hand side of `TauCeti.eulerChar_cellularChainComplex`, `Cellular/EulerCharacteristic/Basic.lean:141`) given a name so that the three headlines are statable, as §7.1 says.

**Ownership.** `roadmaps grep --lean-only` over the 439 open heads and main for the 30 declaration names: no other `Suggested.lean` declares any of them. By object: no Brouwer fixed-point theorem at the pins (`Singular/JordanBrouwer.lean`, `CubeComplement.lean` are separation and acyclicity results); no Whitehead, Hurewicz, LS-category, lim¹, proper-homotopy, Serre-fibration, based-pair, `Projectivization` topology or compact-generation coreflection at the pins (the only `compactlyGeneratedToTop` adjunction is the condensed one in `Mathlib/Condensed/TopCatAdjunction.lean:174`); the K(G,1) nerve realization is not at the pins (`EilenbergMacLane/Covering.lean`, `TopologicalVectorSpace.lean` and `AddCircle.isEilenbergMacLaneSpaceOne` are the only instances). The two duplicates found are R01 and R04. DifferentialGeometry 9.3 on main is the de Rham `poincareDuality` (its `README.md:872`), consistent with this roadmap owning the singular form.

**Pinned declarations opened** (file and line at the pins):

| Declaration | What was checked |
| --- | --- |
| `TauCeti.FundamentalGroup.cast_map_prod_mul`, `instCommGroup` (`FundamentalGroup/TopologicalMonoid.lean:108, 118`) | commutativity of π₁ of a topological monoid: basis of R01. |
| `TauCeti.LocalCoefficientSystem` (`LocalCoefficient.lean:43`), `Singular/Twisted/Basic.lean` docstring lines 7–10 | functor from the fundamental groupoid; coefficient at the initial vertex, transported when reindexing: §2.6's convention agrees (R04 is wording). |
| `TauCeti.IsEilenbergMacLaneSpaceOne` (`EilenbergMacLane/Basic.lean:123`), `IsAspherical` (`:59`) | `PathConnectedSpace ∧ ∀ n, Subsingleton (π_(n+2))` and `Nonempty (FundamentalGroup X x ≃* G)`: `groupClassifyingSpace_isEMOne` for `G = S₃` asserts a nonabelian π₁. |
| `TauCeti.eulerChar_cellularChainComplex`, `homologyEulerChar_cellularChainComplex` (`Cellular/EulerCharacteristic/Basic.lean:141, 169`), `finsum_finrank_singularHomology_of_finite_cwComplex` (`…/Singular.lean:141`) | Euler–Poincaré over a division ring with the same cell count; needs `T2Space`, `RelCWComplex.Finite`: the route of `finiteCWEulerCharacteristic_eq_of_homotopyEquiv`. |
| `TopCat.singularCap` (`Cohomology/Cap/Basic.lean:101`), `TopCat.singularCup` (`Cohomology/Cup.lean`) | pairing data `(λ_ R).inv`, `(λ_ R).hom` and `p + q = n`: as used by `cupProduct` and the duality headline. |
| `TauCeti.cellularChainComplex`, `complexBasePair` (`Cellular/Chains.lean`), `cellularSingularHomologyIso` (`Cellular/Comparison.lean`) | the pin needs `FiniteDimensional`; `cellularSingularComparison` drops it, pair `(X, A)`. |
| `IsCoveringMap` (`Mathlib/Topology/Covering/Basic.lean:287`) | `∀ x, IsEvenlyCovered f x (f ⁻¹' {x})`, no surjectivity: `d = 0` with `E = ∅` admitted, as the 5.3 Check says. |
| `EckmannHilton` in `Mathlib/Topology/Homotopy/HomotopyGroup.lean:557–563` | the commutativity route §1.6 names is already the pin's. |
| `FundamentalGroupoid/Cech/{Diagram,Colimit,Map,Refinement}.lean`, `FundamentalGroupoid/Circle.lean`, `FundamentalGroup/{VanKampen,WedgeSum,CoverGeneration}.lean` | exist at the pin: §§1.1–1.5 are consumption, as written. |
| `HomotopyGroup.map`, `ZerothHomotopy.lift`, `SSet.ιChainComplex`, `IsProperMap`, `ContinuousMap.Nullhomotopic`, `Functor.IsMittagLeffler`, `TopologicalSpace.compactlyGenerated`, `gauge`, `isClosed_fixedPoints`, `LocallyContractibleSpace` | elaborate in `Suggested.lean` or are cited in the README at modules that exist at the pins (checked by grep). |

**Cross-roadmap citations resolved** (main unless stated): DifferentialGeometry Layer 2 (`:341`), 2.4 (`:362`), 5.1 (`:507`), 9.3 (`:872`), 10 (`:877`), 10.5 (`:890`); GeometricTopology Layer 1 (`:177`), the smoothing-and-triangulation comparison (`:270, 930`), Layer 11 (`:831`); ClassifyingSpaces Stage 3 items 11–15 (`:177–219`), Stage 4 items 16–18 (`:222–243`); GeneralizedCohomology G2.1 `realizationProductKelleyComparison` (`:234`); TopologicalKTheory T1.6, T7.0 (`:26, 66–72`); CharacteristicClasses C1.2a with S0–S5 (`:331–335`), C2.0 (`:552`), C3 (`:720`), C1.2b and C1.5 (`:59–62`); ComplexKahlerGeometry K7.1 (`:1407`), K7.2; DGFloer Layer 1 item 1 “Hurewicz in degree one” (`:453`), item 2 (`:461`, consuming native `TauCeti.TopCat.serreFibrations`, which §5.0 now bridges), items 3–4 (`:131–140`); TopologicalSheafCohomology 1.1–1.2 (`:106, 126`); BanachAlgebras A8 (`:54–59`); SmoothBundlesConnections B6.1 (`:1375`); AffineMorseLefschetz A4 (`:208`) and A4.0 (`:27, 38`); RiemannianGeometry R3 (`:347`), R4.7 (`:79`); UniversalCovers in `Completed/`. Open heads: MorseTheory M2, M4, M5 (`rev 1094 README.md:144, 481, 857`); ImplicitAtlases 0.7 (`rev 974 README.md:189`); FourManifolds consumes Stage 6 and the end predicate (`rev 936 README.md:41, 121–132`); CStarClassification CL8 cites 6.0 (`rev 863 README.md:34–64`); AlgebraicTopologyPartII (`rev 1694`) is the configuration-space and real-locus extension and states none of this roadmap's objects. HomotopySpheres at its head still names three deleted declarations (R02, R03). Every `*Needs:*` edge points at main or at Mathlib; the dependency check confirms.

**Source sample.** Texts read from the cache: Hatcher (`hatcher`, PDF page = printed + 9), Brown's *Topology and Groupoids* (`brown-groupoids`, PDF = printed + 25), Milnor's CW paper (`milnor-cw`, PDF 2 = printed 272), Farrell–Taylor–Wagoner (`ftw`), Milnor's *Morse Theory* (`milnor-morse`, lemma numbers only).

| Target | Locator checked and what it supports |
| --- | --- |
| 1.1 Cover diagrams | Brown 6.7.2, p.240 (`brown-groupoids line 9424`, PDF 265): the groupoid pushout square for a representative set; Lemma 3.6.4, p.91 (line 3995, PDF 116). Native `cechDiagram`/`isColimitCechCocone` modules exist at the pin; the target is consumption, as stated. |
| 1.5 Circle and wedge | Native `FundamentalGroupoid/Circle.lean` and `FundamentalGroup/WedgeSum.lean` exist; Hatcher Theorem 1.20, p.43 (line 1956) for the based corollary. |
| 2.4 Homology axioms | Hatcher Theorem 2.10, p.111 (line 4863: homotopic maps induce equal maps); Corollary 2.25, p.126 (line 5521, wedge sums); §2.3 “Axioms for Homology”, p.160 (line 6977). Native `singularHomologyPretheory` resolves the carrier. |
| 3.1 Subdivision and the prism | Hatcher Proposition 2.21, p.119 (line 5222), cited at the layer's end (README line 670); the prism and barycentric formulas are its proof. No Checks (R06). |
| 4.0 Compact generation | Hatcher Theorem A.6, p.524 (line 22693: products of CW complexes are compactly generated); Propositions A.14–A.16, pp.530–531 (lines 23034–23081), not 532 (R05). |
| 4.5 Cofibrations and CW transport | Hatcher Propositions 0.16 and 0.19, pp.15–16 (lines 818, 867); Corollary 0.20 (line 870); Milnor's Morse Theory Lemmas 3.6–3.7 (`milnor-morse lines 3624, 3537`, numbers only in the extraction). |
| 5.4 Torus homology | Hatcher Theorem 3B.6, p.275 (line 11898: Künneth short exact sequence for CW complexes over a PID) and Example 3.16, p.216 (line 9388: exterior algebra on odd generators): supports the inductive calculation. |
| 5.5 Serre applications | Hatcher Proposition 4.48, p.379 (line 16461: fibre bundles lift homotopies of CW pairs, no paracompactness). |
| 5.7 Cover-descent spectral sequence | McCleary unreadable; the `E¹` term is the direct sum over `(p+1)`-fold intersections and the filtered-complex sequence is DGFloer Layer 1 item 3 (`DGFloer/README.md:131–133`). |
| 6.3 Orientation and fundamental classes | Hatcher Lemma 3.27, p.236 (line 10255: unique class with prescribed local images, vanishing above `n`); Proposition 3.29, p.239 (line 10370); Theorem 3.26, p.236 (line 10237). |
| 7.1 Finite CW models | Hatcher Theorem 2.44, p.146 (line 6380); the native `finsum_finrank_singularHomology_of_finite_cwComplex` is the pinned form. |
| 8.3 Absolute Hurewicz | Hatcher Theorem 4.32, p.366 (line 15961: `(n−1)`-connected, `n ≥ 2`; relative form needs `A` simply connected and nonempty). |
| 8.7 Smooth-manifold CW type | GeometricTopology main lines 270 and 930 (smoothing-and-triangulation comparison, item 1 with its realization homeomorphism). No locator for the homology-sphere corollary (R05). |
| 8.9 Relative obstruction theory | Hatcher §4.3 and *Vector Bundles and K-Theory* §3.3 are cited by section only; not re-read this round. The three Checks were recomputed (table below). |
| 8.12 Classical EM comparisons | `AddCircle.isEilenbergMacLaneSpaceOne` exists at the pin (`EilenbergMacLane/Covering.lean`); TopologicalKTheory T1.6 and CharacteristicClasses C1.5 resolved above. |

Additional locators confirmed: Hatcher Theorem 2.16, p.117 (line 5101); Example 2.46, p.150 (line 6570); cellular boundary formula, p.140 (line 6086); Lemma 2.34, p.137 (line 5963); Theorem 2.35, p.139 (line 6051); Theorem 3B.5, p.274 (line 11810); Theorem 3.30, p.241 (line 10453, PDF 250); the `2 = 0` orientability remark, p.235 (line 10229, PDF 244); Theorem 3.43, p.254 (line 10976); Theorem 4.5, p.346 (line 15109); Theorem 4.8, p.349 (line 15205); Proposition A.3, p.522 (line 22617); Exercises 21 and 22, §2.2, p.157 (lines 6855, 6857, PDF 166); §3.C H-spaces, p.281 (line 12154); §4.1, p.340 (line 14822); Proposition 3G.1, p.321 (line 14042); Milnor Theorem 2, p.273 (`milnor-cw line 103`), Theorem 3 and Corollary 3, p.276 (lines 209, 218); Farrell–Taylor–Wagoner Theorem 4.2, Lemma 4.3, Corollary 4.9 (`ftw lines 600, 610, 752`: finite-dimensional, locally finite, simply connected and simply connected at infinity; proper homotopy equivalence iff isomorphisms on `H_*` and `H_c^*`).

**Adversarial pass.** Coefficients are `ℤ` unless stated. Rows cover every declaration of `Suggested.lean`, the sampled targets and the targets the findings touch.

| Statement | Instances and values computed | Result |
| --- | --- | --- |
| `brouwerFixedPoint_compactConvex` | `C = {0}`: fixed `0`. `C = [0,1]`, `f(x) = 1−x`: `1/2`; `f = id`: all. `E = ℝ⁰`: a point. `C = ℝ` (not compact), `f(x) = x+1`: no fixed point, excluded. | Pass. |
| `cellularSingularComparison` | `A = X`: both `0`. Point rel `∅`: `M` in degree `0`. `RP²`, `M = ℤ`: `(ℤ, ℤ/2, 0)` both sides. `RP^∞`: `ℤ/2` in odd degrees, outside the pin's finite-dimensional theorem. | Pass. |
| `finiteCoverTransfer_exists` | Identity cover: `t = id`, `1·id`. Two-sheet cover of a point: `σ ↦ τ₁ + τ₂`, `p_* = 2σ`; over `𝔽₂`: `τ₁+τ₂ ≠ 0`, `p_*t = 0 = 2·id`, the zero map fails the sum law. `d = 0`: `E = ∅`, `t = 0`, `0 = 0·id`. Lifts of an `n`-simplex ↔ fibre over its first vertex (`Δⁿ` simply connected): `d` of them. | Pass. |
| `towerDifference` | Identity bonds on `ℤ`: `δ(3,1,0,…) = (2,1,0,…)`, kernel the constants. Zero bonds: `δ = id`. | Pass. |
| `towerDifference_surjective` | Identity bonds: `x₀ = 0`, `x_{n+1} = x_n − y_n`. Bonds `×2`, `y = (1,0,1,0,…)`: forces `3x₀ + 1 ≡ 0 (mod 4ᵏ)` for all `k`, impossible; hypothesis excludes it. | Pass. |
| `towerDifference_surjective_of_mittagLeffler` | Zero bonds: ranges stabilise at `0`, `δ = id`. `×2`: ranges `2ᵏℤ` never stabilise and `δ` is not surjective. Identity: immediate. | Pass. |
| `singularCohomology`, `cupProduct` | Pairing `r ↦ 1 ⊗ r` and multiplication. On `T²`: `a ∪ b` evaluates `+1`, `b ∪ a` evaluates `−1`; over `𝔽₂` both `1`. | Pass. |
| `LSCategoricalCover`, `lsCategoryCount` | Point: `1`. `S¹`: two arcs, `2`; `S¹` itself is not nullhomotopic in `S¹`. `∅`: `n = 0` covers, value `0`. No finite cover: `sInf ∅ = ⊤`. `A = ∅` in any `X`: `0`. | Pass. |
| `LSPositiveCupProduct`, `lsCupLength` | Point: `sSup ∅ = 0`. `S¹`, `R ≠ 0`: length `1`, `e ∪ e ∈ H² = 0`. `T²`: `a ∪ b ≠ 0`, `2`. `R = 0`: no nonzero class, `0`. Degree-`0` units excluded by `0 < d`. | Pass. |
| `lsCupLength_add_one_le_categoryCount` | Point `0+1 ≤ 1`; `S¹` `1+1 ≤ 2`; `T²` `2+1 ≤ 3`; `R = 0`: `1 ≤ count ≥ 1` on nonempty `X`; `count = ⊤` trivial. `X = ∅` excluded by `Nonempty`. | Pass. |
| `poincareDuality_twoTorsionCoefficients` | `S¹`, `R = 𝔽₂`: `H⁰ → H₁`, `H¹ → H₀` bijective for `μ = [S¹]`, all caps zero for `μ = 0`. Point, `n = 0`: `μ = 1`, `a ↦ a`. `RP²`, `𝔽₂`: Betti `1,1,1`, bijective. `RP²`, `ℤ/4` (`2 ≠ 0`): `H₂ ≅ ℤ/2 ≠ ℤ/4 = H⁰`, excluded. `R = 0`: all zero, bijective. Disconnected `S¹ ⊔ S¹` excluded by `ConnectedSpace` (`H₁ = R²`, `H⁰ = R²`, but no single `μ` works for `H² → H₀`… both sides `R²`, yet cap with `(μ₁, μ₂)` is bijective only if both nonzero, so the existential would still hold; connectedness is kept for the `H_n ≅ R` identification, not needed for the statement). | Pass; connectedness is an unused hypothesis for the Lean statement (note, not a finding). |
| `finiteCWEulerCharacteristic` | Point `1`; circle `1−1 = 0`, subdivided `2−2 = 0`; `S²` `2`; empty `0`. Same expression as the pin's `eulerChar_cellularChainComplex`. | Pass. |
| `finiteCWEulerCharacteristic_eq_of_homotopyEquiv` | `∅ ≃ ∅`: `0 = 0`; two circle structures `0 = 0` via rational Betti numbers (`1,1`). | Pass. |
| `finiteCWEulerCharacteristic_product` | `S²×S²`: `4 = 2·2`; `S¹×S²`: `0`; point `× X`: `χ(X)`. | Pass. |
| `finiteCWEulerCharacteristic_cover` | `d`-fold circle cover: `0 = d·0`; two points over a point: `2 = 2·1`; `B = ∅` forces `E = ∅`: `0 = d·0`. | Pass. |
| `CWTypeModel` | `∅` with the empty model; `I` with a point model; `S¹` has no point model (`π₁ = ℤ`). | Pass. |
| `ordinaryWhitehead`, `_cwType` | `id` on `∅`, point, `S¹`, `S²`: `e = id`. `∅ → point`: components `∅ → *` not surjective. `z ↦ z²`: `×2` on `π₁`, refused. `S² ⊔ * → S²`: components `2 → 1`, refused. | Pass. |
| `homologicalWhitehead`, `_cwType` | `id` on `S²`. Poincaré sphere `→ S³`: homology isomorphisms, `π₁` binary icosahedral, excluded by `SimplyConnectedSpace`. | Pass. |
| `finiteSourceMappingCWType` | `X = point`: `C(X,Y) ≅ Y`. `X = ∅`: a point even for `Y = ∅`. `Y = ∅`, `X ≠ ∅`: `C(X,∅) = ∅`, empty model. `X = ℕ` discrete, `Y = {0,1}`: Cantor space, not CW type, excluded by `CompactSpace`. | Pass. |
| `groupClassifyingSpace`, `_isEMOne` | `G = 1`: a point. `G = ℤ`: `π₁ = ℤ`. `G = S₃`: `(12)(23) = (123) ≠ (132) = (23)(12)`, `π₁` nonabelian, `H₁ = ℤ/2` would fail `≃* S₃`. | Pass. |
| `HasProperHomotopyInverse`, `HasProperHomotopyExtensionProperty` | `id_ℝ`: proper with constant homotopies. `ℝ → point`: not proper. `H(t,x) = x − t x²`: slices proper, `H⁻¹(0) ⊇ {(1/n, n)}` unbounded, refused. `A = ∅`: `K = f ∘ pr`, proper. `A = X`: `K = H`. | Pass. |
| `properStrongDeformationRetract_of_inverse` | `A = X`: `r = id`. `X = I`, `A = {0}`: `r = 0`, `H = (1−t)x`. `X = ℝ`, `A = {0}`: `ℝ → {0}` not proper, hypothesis fails. Route: proper HEP with target `X×{0} ∪ A×I` gives a proper retraction; Strøm's square gives the cylinder pair; Hatcher 0.19–0.20 with proper homotopies; `A` closed since a proper map into a Hausdorff space is closed. | Pass. |
| 1.1, 1.5 (sample) | Two-arc circle: generator ↦ generator under refinement to four arcs, `π₁ = ℤ`; one-point intersection gives the wrong trivial group. Wedge of two circles: free group on `2`. | Pass. |
| 1.6 (R01) | `U(1)`: pointwise `zᵐ · zⁿ = z^{m+n}` equals concatenation class `m + n`. `SO(3)`: `ℤ/2`. Discrete `S₃` as a topological group: `π₁ = 1`. Pinned `instCommGroup` already gives commutativity. | Mathematics sound; duplicate (R01). |
| 2.4 (sample) | `(X, ∅) ≅ X`; `∅`: `0`; wedge `S¹ ∨ S¹`: `H̃₁ = ℤ²`. | Pass. |
| 2.5 Check (square) | `∂(square) = bottom + right − top − left`, written `right − left − top + bottom`; swap of coordinates `−1`. | Pass. |
| 2.6 (R04) | Constant system on `S¹`: monodromy `+1`; sign system on `RP²`: `−1`; both are the pinned abbrev. | Wording (R04). |
| 2.7 Checks | Ball radius `r`: reach `r`, gauge `‖v‖/r`. Triangle, centroid: reach to a vertex `‖v−c‖`, opposite direction `‖v−c‖/2` (median `2:1`). Singleton: direction space `0`. | Pass. |
| 3.1 (sample) | `Sd` of a `1`-simplex `[a,b]` is `[a,m] + [m,b]`, boundary `b − a`; prism on a `0`-simplex `0`. | Pass; no Checks (R06). |
| 4.0 (sample) | `k(*) = *`; `S⁰ ∧ S¹ ≅ S¹` with the interval-last generator winding `+1`, reflection `−1`. | Pass. |
| 4.5 (sample, R06) | `(D¹,S⁰)` on a point: `1 − 1 = 0`; re-adding both base `0`-cells: `3 − 1 = 2` (the Check says `1`). Degree-`m` `2`-cell on `S¹`: `d₂ = m`; `m = 0`: `H₂ = ℤ`; `m = 2`: `RP²`. | Check value wrong (R06). |
| 4.6 Checks | `det(−A) = −det A` on `ℝ³`, `= det A` on `ℝ²`; `RP²` sign system `d₂ = 0`, `d₁ = ±2`: `(ℤ, 0, ℤ/2)` twisted vs `(0, ℤ/2, ℤ)` constant. | Pass. |
| 4.7 Check | `n = 1`, `z = 1`: `w = (−1,1)`, weights `(0,1) = e₁`; `z = −1`: `e₀`. `n = 2`, `z = (1,0)`: `w = (−1,1,0)`, weights `(0, 2/3, 1/3)`. | Pass. |
| 5.0 Checks | `point × point → point`: constant lift. `B×F → B`: `Ĥ = (H, a)`. `{0} → I`: path `t ↦ t` has no lift. `∅ → B`: vacuous. | Pass. |
| 5.3 Checks | As the transfer row; deck sum on the trivial two-sheet cover `id + swap`. | Pass. |
| 5.4 (sample) | `diag(2,3)` on `T²`: `2, 3` on `H₁`, `6` on `H₂`; swap `−1`; `T⁰`: `H₀ = ℤ`. | Pass. |
| 5.5 (sample) | Hopf `S¹ → S³ → S²`: `d₂` a unit; `S¹ × S²`: `d₂ = 0`; same `E²`, different abutments. | Pass. |
| 5.7 (sample) | Two-set cover of `S¹` by arcs: `E¹_{0,q} = H_q(U) ⊕ H_q(V)`, `E¹_{1,q} = H_q(U∩V)`; `d¹` on `q = 0` is `(a,b) ↦ (a+b, −a−b)`, cokernel `ℤ` (= `H₀`), kernel `ℤ` (= `H₁`). | Pass. |
| 6.0 Checks | As the three tower rows. | Pass. |
| 6.2 LS Checks | Point `0, 1`; `S¹` `1, 2`; `∅` count `0`. | Pass. |
| 6.3 Checks | Edge matrix `I + J`, `det = 1 + m`; `m = 1`: `[−1,1]`, boundary `[1] − [−1]`. Reflection `−1`; `m = 0` empty determinant `+1`. `RP²`: `H₂(RP²;or) = ℤ`, pairing `o⊗(−o) ↦ −1`. `D¹`: `(−1)^1 = −1`; `D²`: `+1`. | Pass. |
| 6.4 Checks | `S¹`, `𝔽₂`; `RP²`, `ℤ/4`: `H₂ = ker(2) ≅ ℤ/2`; `D²` Lefschetz: `H⁰ = R → H₂(D²,S¹) = R`, while `H₂(D²) = 0`. | Pass. |
| 7.1, 7.3 (sample) | `RP²`: `1 − 1 + 1 = 1`, rational Betti `1`. Two intervals glued at a point: `1 + 1 − 1 = 1`. | Pass. |
| 8.1 Checks | `(I,∅)` refused; `π₂(D²,S¹) ≅ π₁(S¹) = ℤ`; `RP²` rel `RP¹`: `λ = 2`, `π₁(RP²,RP¹) = 0`, `ℤ → ℤ/2` surjective not injective (`q = λ − 1 = 1`). | Pass. |
| 8.3 (sample) | Degree-`k` loop on `S¹` ↦ `k`; `S¹ ∨ S¹`: commutator ↦ `0`; `n = 2` on `S²`: `π₂ ≅ H₂ = ℤ`. | Pass; no Checks (R06). |
| 8.5 Checks | `A = X`; `X = I`, `A = {0}`; `X = ℝ`, `A = {0}`: preimage of `{0}` under the constant retraction is `ℝ`, not compact. | Pass. |
| 8.7 (sample, R02) | `ℝ`: point model; `S¹`: one `0`-cell and one `1`-cell; point (`n = 0`): one-cell finite model; `S²` with the identity model: `S² ≃ₕ S²`; Poincaré sphere excluded by simple connectivity. Both statements elaborate at the pins. | Statable, absent (R02). |
| 8.8 Checks | Trivial group: a point; `ℤ`: generator edge `+1`, reversed `−1`; `S₃`: six elements, nonabelian. | Pass. |
| 8.9 Checks | `X = D²`, `Y = S¹`: `c(f)(e²) = 1 ≠ 0`; `Y = S²`: `π₁ = 0`. Difference: `d(e¹) = k − 1`, `c(f₀) = 1`, `c(f₁) = k`, `δd = k − 1`; attaching degree `m`: `m, km, m(k−1)`. `Y = S² ⊔ *`: `π₂(Y,*) = 0`. | Pass. |
| 8.10 Checks | `K(ℤ,1) = S¹`: degree map; `X = ∅`: one element, `H^n = 0`; `S¹ ⊔ S¹`: `ℤ²`; `n = 0`: `H₀(ℤ;ℤ)` free on the set `ℤ`. | Pass. |
| 8.11 Checks | `C(*,Y) ≅ Y`; `C(∅,∅) = point`; `ΩS¹` components `ℤ`. | Pass. |
| 8.12 Checks | `RP¹ ≅ S¹`: `π₁ = ℤ`, not `K(ℤ/2,1)`; `CP¹ ≅ S²`: `π₃ = ℤ`; `⟨h,[CP¹]⟩ = ±1` by orientation. | Pass. |

## Not verifiable

- **eilenberg-steenrod** Chapters I–III (§§2.2, 2.4, 3.5); **weibel** Chapters 3 and 5 (§§5.1, 6.0, 6.1); **mccleary** Chapters 1–2 (§5.7); **brown-cohomology** Chapter VII (§5.3); **dold** Chapters VII–VIII (§6); **whitehead** Chapters II–VII (§§4.5, 8); **may** (§8.2); **freedman-quinn** §7.7 (§8.5): no readable legal copy in this or the previous rounds; cited by locator only.
- **serre** 1951 and **strom** were read in earlier rounds and not re-certified; Hatcher's *Vector Bundles and K-Theory* §3.3 (§8.9) was not fetched this round.
- Milnor's *Morse Theory* Lemmas 3.6–3.7: the cached extraction carries the lemma numbers (lines 3624, 3537) without legible statements; certified from the previous round's reading.
- The folder has no `sources.toml`; cache ids above identify the texts read.

## Source issues

- **Misprint** in milnor-cw at the proof of Corollary 3, printed p.276 (line 221): the source says apply Theorem 4; it should be Theorem 3; affects the proof.
- **Misprint** in milnor-cw at the end of the proof of Theorem 2, printed p.276 (line 206): the source says this completes the proof of Theorem 3; it should be Theorem 2; affects the proof.
