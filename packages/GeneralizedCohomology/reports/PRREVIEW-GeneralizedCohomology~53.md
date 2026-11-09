# Review of GeneralizedCohomology (pull request #1808 at 43a6b84)

**Verdict:** needs changes

Scope of this review: the whole folder `TauCetiRoadmap/GeneralizedCohomology/`. Against `origin/main`, the pull request changes only the README (+926/−84): it adds G2.11, moved from BordismFormalGroups F6.5, and repoints G2.1, G4.0b and G5.7. `Suggested.lean` is unchanged from main. The push gate fails on this head (re-run: `set_option` 2, blob 5, latex 2, prnum 6, sorry-data 22, imports 1 / mathlib-subimports 25 / no-import-mathlib 1, statement-hygiene 2, dropped 2, depcheck 5, outside-folder 2 beyond the pull request's named folders). Every failing rule is one of the findings below.

## R01 (P1) — Supply cycle through HomotopySpheres, and an upward OperatorKTheory supplier

- **Location:** `TauCetiRoadmap/GeneralizedCohomology/README.md` line 37, "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal". The same supplier is cited at lines 75, 241, 328, 2320 ("real Bott/stable-O loop-chain theorem of HomotopySpheres PR284 §4B") and 2487. Line 45 cites "[OperatorKTheory K5](…/pull/866)", and lines 2647–2650 consume K5. `Suggested.lean` line 511 says "PR284-owned compact-generation right adjoint".
- **Claim:** GeneralizedCohomology is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. HomotopySpheres is on this job's never-cite list and sits at position 45 of the merge order. OperatorKTheory is not on main (position 9).
- **Witness:** the dependency check prints `UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]`, `… -> OperatorKTheory (#9) [45]`, `… -> StringOrientation (#11) [3419]`, `… -> TangentialBordism (#14) [43]` and `CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism`.
- **Repair:**
  - **Compact generation.** Repoint the compact-generation coreflection and the k-products to AlgebraicTopology Stage 4.5. At this head, AlgebraicTopology README line 138 says Stage 4.5 "owns the compact-generation coreflection `k`".
  - **Suspension–loop.** Repoint the pointed suspension–loop adjunction to AlgebraicTopology 8.11b.
  - **Topological constructions.** State the topological smash, cone/Puppe sequence and stable sphere stems here, in G2.5. G2.5 already proves general Freudenthal (line 329).
  - **Real Bott chain.** State the real Bott loop chain as a G5.4 target. TopologicalKTheory on main also takes it from HomotopySpheres (TopologicalKTheory README line 110), so no earlier owner exists.
  - **K5 operator APIs.** Replace "OperatorKTheory K5" by HilbertModules/CStarAlgebras sections on main, or state the graded Clifford functional-calculus adapters in G5.5. G5.5 already builds the real extensions.
  - **Consumer mentions.** Move the mentions of TangentialBordism (line 43, "Boundary" column) and StringOrientation (line 3419) out of the supplier table and the dependency paragraph into a `## Downstream consumers` section.
  - **Test.** Re-run `gate --depcheck`. It must print no UPWARD or CYCLE line for this roadmap.

## R02 (P2) — Sorry'd data and `set_option` in Suggested.lean

- **Location:** `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` has 22 `def`/`instance` bodies that are `sorry`.
  - lines 246, 391, 485, 514, 537, 566, 580, 592, 601, 606, 612, 616, 626, 631, 646, 656, 660, 698, 703, 706;
  - also `coefficientDegreeEquiv` (730) and `suspensionCohomologyEquiv` (748).
  - `set_option maxHeartbeats 1000000 in` appears at lines 333 and 355.
- **Claim:** sorry'd data and `set_option` are both forbidden by the acceptance-test contract.
- **Witness:** gate re-run lines `sorry-data=22` and `set_option: line 333`, `line 355`. `lake env lean` gives 25 `declaration uses sorry` warnings and no other diagnostics.
- **Repair:** delete every sorry'd `def`/`instance`. These include `pointedSSetMonoidal`, `finiteBijectionMonoidal`, `symmetricSphere`, `spectrumSmash`, `freeSpectrum` and `quaternionFrameGroupChartedSpace`. Also delete the two declarations that need the heartbeat override (`quaternionSpEmbeddedLieSubgroupData`, `quaternionSp_contMDiff_iff_comp_subtypeVal`) and the `Classical.choose` datum `quaternionSpSliceChartData`, which the gate's statement-hygiene rule flags at lines 328–329. Keep them as README targets with intended signatures.

## R03 (P2) — README and Suggested.lean re-plan objects the pinned Tau Ceti and Mathlib already have

- **Location:**
  - **Suggested.lean redeclarations.** `MappingPathSpace` (51), `IsHurewiczFibration` (62), `MappingPathFiber` (87), `mappingPathFiberConstHomeomorphPath`/`…LoopSpace` (97, 125), `PointedSSet` (499), `FiniteBijection` (523), `pointedSSetMonoidal`/`pointedSSetSymmetric` (537, 592), `SymmetricSequence` (596), `symmetricSphere` (656), `SymmetricSpectrum` (665), `freeSpectrum`/`freeEvaluationEquiv` (703–706), `quaternionProjectiveQuotientTopology` (467), `realizationProductKelleyComparison` (514).
  - **README targets.** G2.10 "Own `IsHurewiczFibration p`" (line 539). G2.1/G2.2 (lines 215–270). G2.11 "Construct marked simplicial sets on native SSet" (1076), "Construct joins and slice quasicategories" (1031), the Cartesian-edge definition (1037) and "Construct the maximal Kan core" (1070). G4.0a "consume AT4.6's generic division-ring quotient topology" (1792).
- **Claim:** each of these exists at the pins under the same mathematics, so it must be cited, not restated.
- **Witness:** pinned Tau Ceti (2fd255d) has:
  - **Pointed SSet and spectra.** `TauCeti.PointedSSet` (Pointed/Basic.lean:33), `PointedSSet.monoidalCategory`/`symmetricCategory` (Pointed/Smash/Basic.lean:65,69), `TauCeti.FiniteBijection` (CategoryTheory/FiniteBijection.lean:45), `TauCeti.SymmetricSequence` (Spectra/SymmetricSequence.lean:90), `SymmetricSequence.sphere` and `TauCeti.SymmetricSpectrum` (Spectra/SymmetricSpectrum.lean:82,92), `SymmetricSpectrum.free`/`freeEvaluationAdjunction` (Spectra/Free.lean:174,178), `SymmetricSequence.sphereMonoid`/`SphereModule` (Spectra/SphereMonoid.lean:60,91).
  - **Hurewicz fibrations and path spaces.** `TauCeti.IsHurewiczFibration` (HurewiczFibration/Basic.lean:58), `MappingPathSpace` (MappingPath/Basic.lean:40), `MappingPathFiber` and `mappingPathFiberConstHomeomorphPath` (MappingPath/Fiber.lean:51,177).
  - **∞-categorical carriers.** `TauCeti.MarkedSSet` (SimplicialSet/Marked/Basic.lean:49), `SSet.join` (Join/Basic.lean:358), `SSet.slice` (Slice.lean:103), `SSet.Edge.IsCartesian` (Quasicategory/Cartesian.lean:65; it is the slice trivial-fibration test of HTT 2.4.1.1), `SSet.CartesianFibration` (:110) and `SSet.core` (Quasicategory/Core.lean:226).
  - **Mathlib.** Mathlib has `Projectivization.instTopologicalSpace`, the quotient topology coinduced by `mk'` (Topology/Algebra/Projectivization.lean:44).
  - **Realization product.** At this head AlgebraicTopology README lines 928–949 owns the realization-product comparison "so no second realization-product comparison is built there".
- **Repair:**
  - **Suggested.lean.** Delete these declarations from `Suggested.lean`.
  - **README.** Add a "From Tau Ceti" contract naming each pinned declaration with its file, and turn G2.1, G2.2 and G2.10's construction sentences for them into consumption lines. In G2.11, consume `MarkedSSet`, `join`, `slice`, `Edge.IsCartesian`, `CartesianFibration` and `core` rather than constructing them. In G4.0a, use Mathlib's projective topology.

## R04 (P2) — No headline theorem is stated; a statable headline is absent; the others are not named

- **Location:** `Suggested.lean` lines 31–41 describe the file as "suggest Lean forms for particular milestones … not exhaustive". The file states carriers, interface `def`s and `rfl` lemmas only. README lines 17–19 say Suggested.lean "checks selected carrier and interface shapes … its admitted constructions are targets".
- **Claim:**
  - The roadmap's end theorems (README lines 1–8, G3, G4, G5) are absent:
    - Brown representability on arbitrary CW (G3.1);
    - the arbitrary-CW comparison theorem (G3.3);
    - the Milnor sequence (G3.4);
    - the Thom isomorphism for E-oriented bundles (G4.3);
    - Spanier–Whitehead duality (G5.1);
    - the stable model structure and its Quillen equivalence with sequential spectra (G2.3, G2.5);
    - rational stable Hurewicz (G5.6).
  - The docstring names none of them as not statable, and does not say which carrier each lacks.
  - G5.6's rational stable-stem statement can be stated on Mathlib's homotopy groups.
- **Witness:** this probe elaborates at the pins with only the `sorry` warning: `theorem (n k : ℕ) (hn : 1 ≤ n) (hk : n + 2 ≤ k) : ∀ x : π_ (n+k+1) (Metric.sphere (0 : EuclideanSpace ℝ (Fin (k+2))) 1) ⟨EuclideanSpace.single 0 1, by simp⟩, IsOfFinOrder x`.
- **Repair:**
  - **Docstring.** Rewrite `Suggested.lean` in the acceptance-test form. One module docstring, "GeneralizedCohomology: target signatures", lists the headline theorems above. For each one that is not statable it names the missing carrier: a stable homotopy category or stable equivalences on `TauCeti.SymmetricSpectrum`, or a generalized cohomology theory structure on pointed CW complexes.
  - **Statement.** State the rational stable-stem theorem as probed. Mathlib's `HomologyPretheory` (EilenbergSteenrod.lean:48) and Tau Ceti's Hurewicz map `hurewicz` (AlgebraicTopology/Homotopy/Hurewicz/Basic.lean:201) also exist. Check whether the G3.3 homology comparison and G5.6's unstable rational Hurewicz range are statable on them, and state them if so.
  - **README.** Replace README lines 17–19 by one sentence saying that Suggested.lean states the headline theorems.

## R05 (P2) — G2.11 and the open HigherToposTheory roadmap own the same objects

- **Location:** README lines 666–1504 (G2.11), and Scope line 62: "BordismFormalGroups F6.5 and EllipticCohomology consume G2.11's enriched, quasicategorical, straightening, monoidal-localization and operadic foundations".
- **Claim:** two open roadmaps own the same objects:
  - the Bergner model (HTT A.3.2);
  - the Joyal model;
  - marked straightening;
  - Kan extensions;
  - Ind;
  - stable ∞-categories;
  - HTT 5.2.7.12 localization.
- **Witness:** HigherToposTheory at #1901, Scope: "simplicial categories, the Bergner model structure and Dugger's theorem (Layer F3); joins, slices, …, the Joyal model structure, straightening, Kan extensions … (L1–L8)". It adds: "BordismFormalGroups, EnhancedDerivedSheaves and DerivedModuleAlgebra build on this material".
- **Repair:** settle on a single owner. GeneralizedCohomology is on main and therefore earlier, so G2.11 stays the owner:
  - The Scope section names HigherToposTheory Layers F3, L2–L6 and L9 as consumers of G2.11, and they cite G2.11 rather than restating it.
  - The pull request description states the order relative to #1901.
  - Alternatively, cut G2.11 to the sub-lanes G5.7 and BordismFormalGroups F6.5 actually use, keeping the same single-owner rule.

## R06 (P2) — Supplier names that this head, or an open revision, no longer defines

- **Location:** README line 35 cites `ordinaryEMUniversalClass`, `ordinaryEMRepresentability`, `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension` and `projectiveEMComparisons`. Later lines use the same old names:
  - line 101: `ordinaryCohomologySuspension`;
  - lines 231–232: "AT8.2's `simplicialGroupKan`, `simplicialGroupMooreHomotopyIso` and `kanRealizationUnitHomotopyIso`";
  - line 432: `ordinaryEMLoopComparison`;
  - line 2094: `projectiveEMComparisons`;
  - line 3112: `simplicialGroupKan`.

  Lines 42 and 2737 consume "SpinGeometry G1.3's `cliffordScalarTrace`".
- **Claim:** this pull request renames the AlgebraicTopology targets, and its GeneralizedCohomology citations do not follow. `simplicialGroupMooreHomotopyIso` exists nowhere at this head. Separately, the open SpinGeometry revision drops the named trace.
- **Witness:**
  - AlgebraicTopology README "## Renamed targets" maps:
    - `simplicialGroupKan` → pinned `SSet.kanComplex_of_group` (Tau Ceti KanComplex/SimplicialGroup.lean:186);
    - `ordinaryEMRepresentability` → `exists_universalClass_ordinaryEMPullback_bijective`;
    - `ordinaryEMLoopComparison` → `exists_ordinaryEMModel_loopComparison`;
    - `ordinaryCohomologySuspension` → σ_right (8.11b);
    - `projectiveEMComparisons` → 8.12 and CharacteristicClasses C1.5a.
  - SpinGeometry at #1674 has only `cliffordScalarTrace_exists`.
- **Repair:** replace each old name by its new target as AlgebraicTopology's list gives it, at all eight places. Cite the Moore homotopy comparison by its section (AT 8.2 or Stage 8.9's Dold–Kan realization). Cite SpinGeometry G1.3 by section and formula (τ(a)=2^(−dim)·tr(L_a)) rather than by a Lean name.

## R07 (P2) — The realization-product comparison is handed in opposite directions by this pull request and #1652

- **Location:** README line 33 and lines 236–243: G2.1 consumes "AT Stage 4.5's simplicial-realization product comparison". `Suggested.lean` line 514 still declares `realizationProductKelleyComparison`.
- **Claim:** at this head, AlgebraicTopology Stage 4.5 owns the comparison and GeneralizedCohomology consumes it. In the open AlgebraicTopology revision #1652, GeneralizedCohomology owns it and AlgebraicTopology consumes it. Each pull request hands the object to the other.
- **Witness:** AlgebraicTopology at #1652, lines 154–155: "GeneralizedCohomology G2.1 owns the … simplicial-realization product comparison". Line 3401 consumes G2.1's `realizationProductKelleyComparison`.
- **Repair:** keep AlgebraicTopology 4.5 as the owner, as this head does, and delete the Lean declaration (R03). State in the description that #1652 must be rebased so that its §8.10 consumes 4.5, with the order between the two pull requests.

## R08 (P3) — Three wrong locators, and HTT TeX labels used as locators

- **Location:**
  - line 1246: "the localization criterion of HTT5.2.7.4";
  - line 1055: "model recognition (HTTA.2.6.13)";
  - line 1377: "characterized by that universal property (HA4.8.1.10/13)";
  - line 982: "HTT2.2's simfun";
  - line 1004: "HTT's weakcompatequiv";
  - line 1118: "HTT spek3–spek5".
- **Witness:**
  - LurieHTT line 17361: 5.2.7.4 characterizes localization endofunctors. The universal property is Proposition 5.2.7.12 (line 17500).
  - LurieHTT line 38362: A.2.6.13 is the example that isomorphisms form a perfect class. Recognition is Proposition A.2.6.15 (line 38368).
  - LurieHA line 27099: 4.8.1.13 is a Remark on Day convolution. The Ind characterization is Corollary 4.8.1.14 (line 27108).
  - The weakly-compatible Quillen-equivalence criterion is HTT Proposition A.3.1.10 (line 39789).
- **Repair:**
  - Cite HTT 5.2.7.12, HTT A.2.6.15 and HA 4.8.1.10 with Corollary 4.8.1.14.
  - Cite HTT Proposition A.3.1.10.
  - Replace "spek3–spek5" and "simfun" by HTT's printed numbers in §3.2.1 (e.g. Proposition 3.2.1.11, line 8305) and §2.2.2.

## R09 (P3) — Most theorems carry no locator

- **Location:** among others, these claims have none:
  - G3.1 Brown representability (line 1508);
  - G2.5 general Freudenthal and homotopy excision (lines 329–335);
  - G2.6 "require a nonsemistable counterexample F₁S¹" (line 405);
  - G3.4 Milnor sequence (line 1560);
  - G4.1 Leray–Hirsch (line 2028), G4.3 Thom isomorphism (line 2053), G4.5 `H*(BSp(r);Z)`;
  - G5.1 Spanier–Whitehead duality (line 2341);
  - G5.5 operator classifiers.
- **Witness:** the sources are in the manifest:
  - Brown is HatcherAT Theorems 4E.1 and 4E.2 (lines 19285, 19338);
  - the F₁S¹ example is HSS Example 3.1.10 (line 1088).
- **Repair:** put a locator in parentheses at each claim, as in the house shape.

## R10 (P3) — The README is not in TauCetiRoadmap form

- **Location:** the whole README. Its title is `# Generalized cohomology, spectra and orientations`. It has no `**Summary.**`, no `## Exact supplier contracts` (there is a table, lines 31–46), no `## How to read the build`, and sections `## G1.`–`## G5.` with numbered paragraphs.
- **Claim:**
  - There are no API bullets, no `**Checks.**` lists (zero in the file), no `### Examples` and no `### Dependencies` per layer, and no `## Downstream consumers`.
  - The Scope section names BordismFormalGroups F6.5 and EllipticCohomology as G2.11's consumers (lines 62, 674, 3391) but not EnhancedDerivedSheaves, which on main consumes the same sub-lanes (EnhancedDerivedSheaves README lines 146–148). Those citations reach G2.11 through BordismFormalGroups' mapping at lines 71–78.
- **Repair:** restructure in the house shape:
  - `## Layer k:` with `### k.n` prose subsections;
  - API bullets, and at least three discriminating Checks per definition (e.g. the README's own sign tests in Conventions become Checks);
  - per-layer Examples and Dependencies;
  - supplier contracts per supplier;
  - `## Downstream consumers`, including EnhancedDerivedSheaves.

## R11 (P3) — Links, pull-request numbers, process words, a broken link and a LaTeX delimiter

- **Location:**
  - commit-pinned `blob/<sha>` links at lines 39, 42, 3112, 3260 and 3262;
  - pull-request numbers at lines 37, 39 ("PR279", "#279"), 45 (pull/860, 861, 866), 75, 241, 328, 2320 and 2487;
  - `../SpinRepresentations/README.md` at line 41;
  - "current"/"currently" at lines 49, 52, 2728 and 3528;
  - `V=K\A, Z=L\(A∩L), U=K\(A∪L)` at line 3279;
  - `Suggested.lean` line 465: "Delete this local specialization when AT4.6 supplies".
- **Witness:**
  - gate `blob=5`, `prnum=6`, `latex=2`;
  - on main the folder is `TauCetiRoadmap/RepresentationTheory/SpinRepresentations`;
  - open revisions drop the anchors of three of the blob links: AlgebraicTopology #1652, SpinGeometry #1674, ComplexKahlerGeometry #1807/#1854.
- **Repair:**
  - Cite roadmaps by name and section: AlgebraicTopology 8.2, SpinGeometry G1.3, ComplexKahlerGeometry K7.1, SmoothBundlesConnections B1.4.
  - Fix the relative link.
  - Write set difference as `K∖A` inside a code span.
  - Remove the process words.

## R12 (P3) — Imports of Suggested.lean

- **Location:** `Suggested.lean` lines 1–29: 25 `import Mathlib.<submodule>` lines and four `TauCeti.*` lines, with no `import Mathlib`.
- **Witness:** gate `imports=1`, `mathlib-subimports=25`, `no-import-mathlib=1`.
- **Repair:** use the single line `import Mathlib`, followed only by the `TauCeti.*` modules the rewritten headlines use.

## R13 (P3) — Padding in Suggested.lean

- **Location:**
  - `mappingPathFiberConstHomeomorphPath_apply`/`_symm_apply` and the `LoopSpace` pair (lines 115–136, `rfl`);
  - `mappingPathProjection_comp_inclusion` and `mappingPathEndpoint_comp_inclusion` (161–171, `ext; rfl`);
  - `nativeSpinFourQuaternionHomeomorph_apply` (254, `rfl`);
  - `quaternionProjectiveGrassmannianHomeomorph_toEquiv` (492, `rfl`);
  - `levelMap_id`/`levelMap_comp` (674–681, `rfl`);
  - four `example … := inferInstance` (286, 411, 621, 622);
  - `IsHurewiczFibration.lift` (69, restates the pinned lifting API);
  - the convention witness `spinFourCalibratedPair_vectorAction` and the API lemma `quaternionFrameAction_preserves`.
- **Witness:** each closes by one tactic as written, restates a definition, or mirrors a README convention.
- **Repair:** delete them from `Suggested.lean`. The README keeps the statements.

## R14 (P3) — Edits outside the pull request's named folders

- **Location:** the pull request also changes `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line each).
- **Witness:** `git diff --stat origin/main...HEAD` restricted to everything outside the fifteen named folders lists exactly these two files. They come from commits e591d103 and 61e5385e.
- **Repair:** move these two consumer-statement edits into a pull request of their own, or drop them.

## Verified sound

**Gate and build.**
- I re-ran the full gate, with the same failures as the worker's. The worker's `outside-folder=2` is my R14. My re-run lists 29 outside-folder files; the other 27 are in the pull request's named folders.
- `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` took 1m28s and gave 25 `sorry` warnings and no errors.
- The elaborated signatures of all 98 declarations were compared with the worker's elaborated-signature list. The 11 "looks dropped" leads are false alarms or harmless:
  - `realizationProductKelleyComparison` keeps `hk` as an explicit argument.
  - `coefficientDegreeEquiv` and `suspensionCohomologyEquiv` lose the additivity instance. The `≃+` stays true because shift autoequivalences of a preadditive category are additive.
  - The `[Category* C]` hits are parse artefacts.

**Depcheck output.** Four UPWARD lines and one CYCLE (R01). I confirmed by reading that the HomotopySpheres and OperatorKTheory edges are real supplier citations. The TangentialBordism (line 43) and StringOrientation (line 3419) edges come from consumer mentions placed in the supplier table and the order paragraph.

**Source sample: 22 locators read; 19 match, 3 wrong (R08).**

| Locator | Source line | Result |
| --- | --- | --- |
| HTT 1.2.4.3 | 2066 | matches |
| HTT 1.2.9.3 | 2434 | matches |
| HTT 2.1.3.4 | 3469 | matches |
| HTT 2.2.1.2 | 3814 | matches; README uses its first clause for the Quillen adjunction |
| HTT 2.4.2.4 | 5975 | matches |
| HTT 3.3.1.8 | 9952 | matches |
| HTT 4.2.4.1 | 12161 | matches |
| HTT 4.2.4.3 | 12172 | matches |
| HTT 4.2.4.4 | 12198 | matches |
| HTT A.3.2.16 | 40160 | matches; excellence axioms A1–A5 as listed |
| HTT A.3.2.24 | 40232 | matches; Bergner fibrancy |
| HTT A.3.4.14 | 41430 | matches; the Hom_Ho exponential bijection |
| HTT A.3.5.15 | 41696 | matches |
| HTT A.3.6.16 | 41987 | matches |
| HA 4.1.8.4 | 18817 | matches |
| HA 4.3.3.17 | 21223 | matches |
| HA 7.3.2.6 | 49435 | matches |
| HA 7.3.2.7 | 49482 | matches |
| NikolausScholze I.3.3 | 827–843 | matches; the displayed mapping formula agrees exactly |
| NikolausScholze I.3.6 | 976 | matches |
| HatcherAT 4E.1 | 19285 | matches |
| HatcherAT 4E.2 | 19338 | matches |
| HSS Example 3.1.10 | 1088 | matches |
| SchwedeSymSpec Examples 1.16–1.20 | 803–963 | matches |
| HTT 5.2.7.4 | — | wrong (R08) |
| HTT A.2.6.13 | — | wrong (R08) |
| HA 4.8.1.13 | — | wrong (R08) |

**Library declarations opened at the pins (40).**
- **Mathlib:**
  - `HomotopyGroup.Pi` (Topology/Homotopy/HomotopyGroup.lean:460);
  - `compactlyGeneratedToTop` (Topology/Category/CompactlyGenerated.lean:78);
  - `Projectivization.instTopologicalSpace` (Topology/Algebra/Projectivization.lean:44);
  - `HomologyPretheory` (AlgebraicTopology/EilenbergSteenrod.lean:48);
  - present by grep: `ReedyStructure`, `enrichedOrdinaryCategory`, `enrichedHomπ`, `SimplicialThickening`, `SimplicialNerve`, `LawfulDayConvolutionMonoidalCategoryStruct`, `onePointHyperplaneHomeoUnitSphere`, `onePointEquivSphereOfFinrankEq`, `equivProjectivization`, `equivSubmodule`, `ofRiemannianMetric`, `instLoewnerPartialOrder`, `instStarOrderedRingRCLike`, `instCStarModuleComplex`, `unitsLieAlgebraLieEquiv_symm_mem_lieSubalgebraOfSubgroup_iff_mem_skewAdjoint`, `linftyOpNormedRing`, `ContAction`.
- **Tau Ceti:**
  - present by grep: `serreFibrations`, `mem_serreFibrations_of_hasHomotopyLiftingProperty`, `realSpinThreeEquivQuaternionUnitary`, `realSpinFourEquivQuaternionUnitaryProd`, `isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom`, `instCompactSpaceRealCliffordSpinGroupZero`, `exists_isSliceChart_of_isClosed_subgroup`, `isClosed_unitarySubgroup_units`, `chartedSpaceOfIsSliceChart`, `realCliffordForm`, `spinGroupMap`;
  - read at file and line: the R03 list, `SSet.kanComplex_of_group` (KanComplex/SimplicialGroup.lean:186), `FiberInclusionPathFiber.loopHomotopyEquiv` (HurewiczFibration/FiberInclusion.lean:263), `hurewicz` (Homotopy/Hurewicz/Basic.lean:201).
- `supBallEuclideanDiskHomeomorph` and `diskQuotientSphereHomeomorph` are AlgebraicTopology targets, present in its README.

**Cross-roadmap citations resolved.**
- **AlgebraicTopology at this head:** Stages 2–8 item ids 2.5, 4.4–4.8, 5.0, 5.5, 6.0, 6.4, 8.2, 8.8c/d, 8.10, 8.11b. Also Stage 4.5's ownership (lines 138, 928–949) and the "Renamed targets" list.
- **CharacteristicClasses** C1.1b, C1.2, C1.5, C2.1, C2.4 (item 4 of C2, line 1596), C2.5, C3.2.
- **TopologicalKTheory** T1.5, T1.6a, T1.6c, T5, T7, T7.0.
- **SpinGeometry** G1.3 (line 233 at this head; open revision #1674).
- **ComplexKahlerGeometry** K7.1 (line 2243 at this head).
- **BordismFormalGroups** F6.5 → G2.11 mapping (lines 71–78).
- **EnhancedDerivedSheaves on main:** its F6.5 citations and its `symmetricSpectra_equiv_spectra` comparison. This is a distinct object from G2.11's Sp∞ and is not a duplicate.
- **Open pull requests:** HigherToposTheory #1901 Scope; AlgebraicTopology #1652 lines 154–155, 599, 3401.
- #1187 changes one line of this folder's `Suggested.lean` (`Aut.of` versus `.of`). This pull request does not touch that file, so that conflict is not this folder's.

**Adversarial pass.**

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `Eⁿ(*)=π_(−n)E` (Conventions; `coefficientDegreeEquiv`) | KU, n=−2; HZ, n=0,1 | `KU^(−2)(*)=π_2KU=ℤ`; `HZ^0(*)=π_0=ℤ`, `HZ^1(*)=π_(−1)HZ=0` | holds | — |
| `E*(S¹)`, σ²=0 (G1.7) | E=HZ; graded commutativity alone | `H*(S¹)=ℤ[σ]/σ²`; commutativity gives σ²=−σ², i.e. only 2σ²=0 | holds; the diagonal nullhomotopy is needed, as stated | — |
| a×σ(b)=(−1)^p σ(a×b) (G1.4) | p=0, 1 | +1 and −1, the Koszul sign of moving degree-1 σ past a | holds | — |
| Phantom `S_ℚ→ΣHZ` (G3.6) | Milnor terms | lim `[S,ΣHZ]=π_(−1)HZ=0`; lim¹ of `ℤ←2ℤ←3…` is Ext(ℚ,ℤ)≠0; a preimage of the constant 1 forces a₁≡Σ_(j<m) j! mod m!, and 0<Σ<m! is unbounded | holds | — |
| ε-normalization of the telescope MV (G3.4) | i=0, 1 | (−1)^i·(−1)^i(a_i−f a_(i+1))=(1−shift)(a)_i | holds | — |
| General Freudenthal range (G2.5) | S¹ (k=1); S² (k=2) | `π_1S¹=ℤ→π_2S²=ℤ`, surjective at i=1; `π_2S²→π_3S³` iso; `π_3S²=ℤ→π_4S³=ℤ/2` surjective at i=3 | holds | — |
| Homotopy excision on the two cones (G2.5) | X (k−1)-connected | each map X→CX is k-connected, so the square is (2k−1)-cartesian and X→ΩΣX is (2k−1)-connected | holds; agrees with Freudenthal | — |
| Unstable rational Hurewicz range (G5.6) | S², k=2 | i=2: ℚ≅ℚ; i=3: `π_3S²⊗ℚ=ℚ→H_3=0`, onto but not injective | holds as "surjection at 2k−1" | — |
| `H*(K(ℤ,n);ℚ)` (G5.6) | n=1, 2 | S¹: exterior in degree 1; CP∞: polynomial in degree 2 | holds | — |
| π_i GL_k(ℝ) table (G2.9) | k=0..5, i≤3 | O(1)=ℤ/2; SO(2)=S¹: π₁=ℤ; SO(3)=RP³: π₁=ℤ/2, π₃=ℤ; SO(4)=(S³×S³)/±1: π₃=ℤ²; k≥5: π₃=ℤ; π₂=0; k=0 trivial | all 24 entries hold | — |
| Stabilization on π₃ (G2.9) | (q_L,q_R) generators | SO(3)={q_L=q_R} gives (1,1); L and R are conjugate by v↦v̄, which is inner in SO(5), so (a,b)↦a+b | holds | — |
| [S¹,GL₂], [S⁰,GL_k] (G2.9) | — | ℤ⋊ℤ/2 under negation is D_∞; (ℤ/2)², 4 classes; clutching over S¹ gives 2 classes | holds | — |
| KSp=Σ⁴KO conventions (G5.4) | at a point | `KSp^0=KO^4(*)=π_4KO=ℤ`; [ℍ]=ab⁻¹ in degree −4+8; real forget gives a²b⁻¹=4; complex forget gives u²·2u²·u⁻⁴=2 | holds | — |
| π₀K_op,n (G5.5) | n=1, 4 | `KO^1(*)=KO_7=0`; `KO^4(*)=KO_4=ℤ` | holds | — |
| Bott sign on CP¹ (G5.5) | H=[γ*] | (H−1)²=0, so [γ]=2−H and [γ]−1=−(H−1) | holds | — |
| Hermite normalization (G5.5) | general j | ∫h_j²=π^(−1/2)(j!)⁻¹2^(−1/2)·√(2π)·j!=1; h_(2α) is even | holds | — |
| Pin⁺ versus `unitary` (G5.4) | Mathlib star = reverse∘involute | star(ιv)=−ιv, so star(ιv)ιv=−Q(v)=−1 | holds | — |
| ε_k shuffle signs (G5.0, G5.5) | k=1..4 | ε=+,−,−,+; ε_kε_(k+1)(−1)^k=(−1)^(k²+k)=1; ε_(r+s)=ε_rε_s(−1)^(rs) | holds; rotation needed exactly for k≡2,3 mod 4 | — |
| Signature shuffle signs (G5.5) | Cl(1,1)⊗Cl(1,1) | (−1)^(p′q)=−1, matching the stated test; Morita (−1)^(cq) | holds | — |
| Quaternionic classes (G4.5) | rank 1; torus | `c(Cγ)|_T=Π(1−x_j²)`, so a_i↦(−1)^i e_i(x²); p₁=−2c₂ and e=−c₂, so p₁=2e; w_(4i+2)=0 | holds | — |
| Derived p-completion sequence (G3.9) | Hℤ, n=0; H(ℤ/p^∞), n=1 | Ext(ℤ/p^∞,ℤ)=ℤ_p, so π₀=ℤ_p; Hom(ℤ/p^∞,ℤ/p^∞)=ℤ_p, so π₁=ℤ_p | holds | — |
| MU Schubert-cell connectivity (G5.5) | r=1, 2 | bottom cell degree 0, next 2 (real); unit cofibre has cells in degree ≥2 | holds | — |
| Localization triangle (G5.7) | K/A over L/(A∩L) | quotient is K/(A∪L); U=V∖Z is open | holds | notation only (R11) |
| Verdier quotient (G2.11) | NikolausScholze I.3.3(ii) | formulas identical | holds | — |
| Excellent base (G2.11) | HTT A.3.2.16 | A1–A4 plus invertibility as listed | holds | — |
| Localization criterion (G2.11) | HTT 5.2.7.4 versus 5.2.7.12 | 5.2.7.4 characterizes L; the universal property is 5.2.7.12 | locator wrong | R08 |
| Recognition (G2.11) | HTT A.2.6.13 | the example "isomorphisms are perfect"; recognition is A.2.6.15 | locator wrong | R08 |
| Monoidal Ind (G2.11) | HA 4.8.1.13 | Remark on Day convolution; characterization is Cor. 4.8.1.14 | locator wrong | R08 |
| Categorical fibration over a Kan complex (G2.11) | HTT 3.3.1.8, 2.4.2.4, 2.1.3.4 | Cartesian; right fibration; trivial if fibres are contractible (dual as in 2.1.3.4's proof) | holds | — |
| Rational stable stems (headline G5.6) | n=1, k=3: π₄S³=ℤ/2; n=0 excluded since π_kS^k=ℤ | probe statement elaborates | statable and absent | R04 |
| `coefficientDegreeEquiv` signature | elaborated type | additivity binder dropped; `≃+` still true | true; sorry'd data | R02 |
| `realizationProductKelleyComparison` | elaborated type; |K×L| | keeps `hk`; true statement (Milnor/Gabriel–Zisman) | duplicate owner | R03, R07 |
| `IsHurewiczFibration` | pinned `isHurewiczFibration_iff_nonempty_liftingFunction` | the same lifting-function predicate | duplicate | R03 |

## Not verifiable

- **Spin(4) factor swap.** The Spin(4) calibration claim (G4.0a, line 1819) is that a factor swap alone fails on ι(e₀)ι(e₁). Checking it needs the native factor order of `TauCeti.realSpinFourEquivQuaternionUnitaryProd`, which I did not compute.
- **Uncertified sources.** ABSClifford, McDuffSegal, SegalCategories, JoachimKO and QuillenHA are uncertified in the manifest. No locator from them was sampled.
- **Unrecorded sources.** Adams, *Stable Homotopy and Generalised Homology*, and Joachim, *Higher coherences for equivariant K-theory*, are cited in References but not recorded in the manifest. I found no legal copy in the cache.
- **Cached but not sampled.** CohenBMH, MillerCobordism, MMSS, ShipleyConvenient, ElmendorfMandell and HebestreitSagave are cached but were not in this sample.

## Source issues

- none
