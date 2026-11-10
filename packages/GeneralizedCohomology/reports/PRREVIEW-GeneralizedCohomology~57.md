# Review of GeneralizedCohomology (pull request #1808 at 71ad8ae)

**Verdict:** needs changes

This is an incremental re-review of the 0 lines changed in `TauCetiRoadmap/GeneralizedCohomology/` since 43a6b84. Neither `README.md` nor `Suggested.lean` changed, so none of R01–R14 is repaired and each is restated below. Several repairs are updated because sibling folders of this pull request moved: TopologicalKTheory now owns real Bott periodicity (T7.0b), and HilbertModules and CStarAlgebras are on main. One new problem (R15) comes from sibling changes since 43a6b84. TopologicalKTheory's README was restored to main's wording, and it now hands the smooth Grassmannian graph-chart upgrade back to G4.0b. G4.0b, unchanged, still consumes that upgrade from TopologicalKTheory T1.5.

The push gate still fails with the same counts as before. Elaboration gives 25 `sorry` warnings and nothing else.

A shorter path for most findings: #1807, which the description orders before this pull request, carries a rewritten GeneralizedCohomology folder. At its head it has the house shape (`# Roadmap: …`, `**Summary.**`, `## Downstream consumers`), cites no HomotopySpheres section, has G2.11 at `### 2.11`, and its `Suggested.lean` has 8 declarations. The overlap check reports no conflict between the two heads in this folder. Taking that folder here, or dropping this pull request's changes to the folder so that #1807 alone carries them, clears most of R01–R14 at once. Whatever stays open there belongs to that pull request's review. The findings below are about this head.

## R01 (P1) — Supply cycle through HomotopySpheres, and an upward OperatorKTheory supplier

- **Location:** `TauCetiRoadmap/GeneralizedCohomology/README.md` line 37: "[HomotopySpheres Stage 3A](…/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint; pointed convenient mapping spaces, suspension/loop, smash, mapping cone/Puppe, stable sphere stems and Freudenthal".
  - HomotopySpheres is also cited at lines 75, 241, 328, 2320 and 2487.
  - Line 45 cites OperatorKTheory K5, which lines 2647–2650 consume.
  - TangentialBordism (line 43) and StringOrientation (line 3419) are named as suppliers.
  - `Suggested.lean` line 511 mentions "PR284-owned".
- **Claim:** GeneralizedCohomology is on main, so it may consume only Mathlib, Tau Ceti and roadmaps on main. HomotopySpheres is on the never-cite list and is not on main. OperatorKTheory is not on main.
- **Witness:** the dependency check at this head prints `UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]`, `-> OperatorKTheory (#9) [45]`, `-> StringOrientation (#11) [3419]` and `-> TangentialBordism (#14) [43]`, then `CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism`.
- **Repair:**
  - **Compact generation.** Repoint the compact-generation coreflection and the k-products to AlgebraicTopology Stage 4.5. At this head, AlgebraicTopology README line 141 says "Stage 4.5 owns the compact-generation coreflection `k`".
  - **Suspension–loop.** Repoint the pointed suspension–loop adjunction to AlgebraicTopology 8.11b. Its line 2963 lists "its own fixed-interval suspension–loop adjunction".
  - **Topological constructions.** State the topological smash, cone/Puppe sequence and stable sphere stems here, in G2.5. G2.5 already proves general Freudenthal (line 329).
  - **Real Bott chain (lines 2320, 2487).** This repair changes from the previous review. Repoint to TopologicalKTheory T7.0a–T7.0b, which at this head own O, SO, ΩBO≃O, the eight stable Bott maps and O≃Ω⁸O (TopologicalKTheory README lines 149–152 and 1831–1838).
    - The *Needs* of T7.0a (line 1808) and T7.0b name no GeneralizedCohomology section, so there is no return edge.
    - The supplier table already lists TopologicalKTheory T5–T7.
  - **K5 operator APIs.** HilbertModules and CStarAlgebras are now on main (`TauCetiRoadmap/HilbertModules`, `TauCetiRoadmap/CStarAlgebras`).
    - Cite their sections by name with relative links instead of `pull/861` and `pull/860`.
    - Replace "OperatorKTheory K5" by those sections, or state the graded Clifford functional-calculus adapters in G5.5.
  - **Consumer mentions.** Move the TangentialBordism (line 43) and StringOrientation (line 3419) mentions into a `## Downstream consumers` section.
  - **Test.** Re-run `gate --depcheck`. It must print no UPWARD or CYCLE line.

## R02 (P2) — Sorry'd data and `set_option` in Suggested.lean

- **Location:** `TauCetiRoadmap/GeneralizedCohomology/Suggested.lean`.
  - Twenty-two `def`/`instance` bodies are `sorry`: lines 246, 391, 485, 514, 537, 566, 580, 592, 601, 606, 612, 616, 626, 631, 646, 656, 660, 698, 703 and 706, plus `coefficientDegreeEquiv` (730) and `suspensionCohomologyEquiv` (748).
  - Line 333 and line 355 each have `set_option maxHeartbeats 1000000 in`.
- **Claim:** the acceptance-test contract forbids both sorry'd data and `set_option`.
- **Witness:** the gate re-run at this head gives `sorry-data=22` and `set_option: line 333`, `line 355`. For example, line 537 is `noncomputable instance pointedSSetMonoidal : MonoidalCategory PointedSSet := by sorry`.
- **Repair:**
  - Delete every sorry'd `def` and `instance`, including the two that need the heartbeat override (`quaternionSpEmbeddedLieSubgroupData`, `quaternionSp_contMDiff_iff_comp_subtypeVal`).
  - Delete the `Classical.choose` datum `quaternionSpSliceChartData` (statement-hygiene, lines 328–329).
  - Keep them as README targets with their intended signatures.

## R03 (P2) — README and Suggested.lean re-plan objects the pinned Tau Ceti and Mathlib already have

- **Location:** `Suggested.lean` redeclares:
  - `MappingPathSpace` (51), `IsHurewiczFibration` (62), `MappingPathFiber` (87), and the `mappingPathFiberConstHomeomorph…` pair (97, 125);
  - `PointedSSet` (499), `FiniteBijection` (523), `pointedSSetMonoidal`/`pointedSSetSymmetric`, `SymmetricSequence` (596), `symmetricSphere`, `SymmetricSpectrum` (665), and `freeSpectrum`/`freeEvaluationEquiv`;
  - `quaternionProjectiveQuotientTopology` (467) and `realizationProductKelleyComparison` (514).

  The README plans the same objects:
  - G2.10 "Own `IsHurewiczFibration p`" (line 539);
  - G2.11 "Construct joins and slice quasicategories" (1031), the marked simplicial sets (1076) and the Kan core (1070);
  - G4.0a's projective quotient topology (1792).
- **Claim:** each of these exists at the pins as the same mathematics, so it must be cited, not restated.
- **Witness:** these are pinned Tau Ceti 2fd255d declarations, re-opened at this head:
  - `abbrev PointedSSet := Under (Δ[0] : SSet.{u})` (Pointed/Basic.lean:33);
  - `def IsHurewiczFibration` (HurewiczFibration/Basic.lean:58);
  - `abbrev SymmetricSpectrum := Mod SymmetricSequence SymmetricSequence.sphere` (Spectra/SymmetricSpectrum.lean:92);
  - `abbrev MappingPathSpace` (MappingPath/Basic.lean:40);
  - `structure MarkedSSet` (Marked/Basic.lean:49).

  Mathlib has `Projectivization.instTopologicalSpace` (Topology/Algebra/Projectivization.lean:44).
- **Repair:**
  - Delete these declarations from `Suggested.lean`.
  - Add a "From Tau Ceti" contract naming each pinned declaration with its file. The previous review's list also has `PointedSSet.monoidalCategory`, `TauCeti.FiniteBijection`, `SymmetricSequence.sphere`, `SymmetricSpectrum.free`, `SSet.join`, `SSet.slice`, `SSet.Edge.IsCartesian`, `SSet.CartesianFibration` and `SSet.core`.
  - Turn the construction sentences in G2.1, G2.2, G2.10, G2.11 and G4.0a into consumption lines.

## R04 (P2) — No headline theorem is stated; a statable headline is absent; the others are not named

- **Location:** `Suggested.lean` lines 31–41 say: "The statements here suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap". README lines 17–19 say Suggested.lean "checks selected carrier and interface shapes".
- **Claim:** none of the roadmap's end theorems is stated, and the docstring does not name them as unstatable with the carrier each one lacks. The end theorems are:
  - Brown representability on arbitrary CW (G3.1);
  - the arbitrary-CW comparison (G3.3);
  - the Milnor sequence (G3.4);
  - the Thom isomorphism (G4.3);
  - Spanier–Whitehead duality (G5.1);
  - the stable model structure and its comparison with sequential spectra (G2.3, G2.5);
  - rational stable Hurewicz (G5.6).
- **Witness:** with only the `sorry` warning, the pins elaborate the following (the previous review's probe; the pins are unchanged): `theorem (n k : ℕ) (hn : 1 ≤ n) (hk : n + 2 ≤ k) : ∀ x : π_ (n+k+1) (Metric.sphere (0 : EuclideanSpace ℝ (Fin (k+2))) 1) ⟨EuclideanSpace.single 0 1, by simp⟩, IsOfFinOrder x`.
- **Repair:**
  - Rewrite the module docstring as "GeneralizedCohomology: target signatures". List the headlines above, and for each unstatable one name the missing carrier: a stable homotopy category or stable equivalences on `TauCeti.SymmetricSpectrum`, or a generalized cohomology theory on pointed CW complexes.
  - State the rational stable-stem theorem as probed.
  - Check whether the G3.3 and G5.6 statements are statable on Mathlib's `HomologyPretheory` and Tau Ceti's `hurewicz`, and state them if so.
  - Replace README lines 17–19 by one sentence saying that Suggested.lean states the headline theorems.

## R05 (P2) — G2.11 and the open HigherToposTheory roadmap own the same objects

- **Location:** README lines 666–1504 (G2.11), and Scope line 62: "BordismFormalGroups F6.5 and EllipticCohomology consume G2.11's enriched, quasicategorical, straightening, monoidal-localization and operadic foundations".
- **Claim:** two roadmaps own the Bergner and Joyal model structures, straightening, Kan extensions and Ind.
- **Witness:** HigherToposTheory (#1901 at 2176cc4), lines 39–40, owns "simplicial categories, the Bergner model structure and Dugger's theorem (Layer F3); joins, slices, …, the Joyal model structure, straightening, Kan extensions". Its line 51 says BordismFormalGroups builds on it.
- **Repair:**
  - Keep G2.11 as the owner: GeneralizedCohomology is on main and therefore earlier.
  - Name HigherToposTheory Layers F3, L2–L6 and L9 as G2.11's consumers in the Scope.
  - State in the description the order relative to #1901.
  - Alternatively, cut G2.11 to the sub-lanes that G5.7 and BordismFormalGroups use.

## R06 (P2) — Supplier names that AlgebraicTopology at this head, or an open revision, no longer defines

- **Location:**
  - README line 35 cites `ordinaryEMUniversalClass`, `ordinaryEMRepresentability`, `ordinaryEMRelativeRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension` and `projectiveEMComparisons`.
  - The same old names recur at lines 101, 231–232 (`simplicialGroupMooreHomotopyIso`), 432, 2094 and 3112.
  - Lines 42 and 2737 consume SpinGeometry G1.3's `cliffordScalarTrace`.
- **Claim:** this pull request renames these AlgebraicTopology targets, and the GeneralizedCohomology citations do not follow. The open SpinGeometry revision drops the trace's name.
- **Witness:** AlgebraicTopology README `## Renamed targets` (line 3033 at this head) maps:
  - `ordinaryEMRepresentability` → `exists_universalClass_ordinaryEMPullback_bijective`;
  - `ordinaryCohomologySuspension` → σ_right (Stage 8.11b);
  - `simplicialGroupKan` → pinned `SSet.kanComplex_of_group` (KanComplex/SimplicialGroup.lean:186).

  SpinGeometry at #1674 has only `cliffordScalarTrace_exists`.
- **Repair:**
  - Replace each old name by its new target as AlgebraicTopology's lines 3037–3050 give it.
  - Cite the Moore homotopy comparison by its section (AT 8.2).
  - Cite SpinGeometry G1.3 by section and formula, τ(a)=2^(−dim)·tr(L_a), not by a Lean name.

## R07 (P2) — The realization-product comparison is handed in opposite directions

- **Location:** README line 33 consumes "Stage4.5's simplicial-realization product comparison |K×L|≃k(|K|×|L|)". `Suggested.lean` line 514 still declares `realizationProductKelleyComparison`.
- **Claim:** at this head AlgebraicTopology Stage 4.5 owns the comparison. The open AlgebraicTopology revision (#1652) hands it back to G2.1, and HigherToposTheory (#1901) consumes G2.1's Lean name.
- **Witness:**
  - This head: AlgebraicTopology lines 148–149, "Stage 4.5 also owns the single simplicial-realization product comparison".
  - #1652 at c204943, line 171: "GeneralizedCohomology G2.1 owns the simplicial-realization product comparison", and lines 3866–3867 consume G2.1's `realizationProductKelleyComparison`.
  - #1901, line 198 does the same.
- **Repair:**
  - Keep AlgebraicTopology 4.5 as the owner and delete the Lean declaration (R03).
  - Add one Scope sentence: "the realization-product comparison is AlgebraicTopology 4.5's". Roadmaps that cite G2.1's name can then follow it.
  - State in the description the order relative to #1652.

## R08 (P3) — Three wrong locators, and HTT TeX labels used as locators

- **Location:**
  - line 1246, "the localization criterion of HTT5.2.7.4";
  - line 1055, "recognition (HTTA.2.6.13)";
  - line 1377, "(HA4.8.1.10/13)";
  - TeX labels at lines 982 ("HTT2.2's simfun"), 1004 ("weakcompatequiv") and 1118 ("spek3–spek5").
- **Witness:**
  - LurieHTT line 17361: 5.2.7.4 characterizes localization functors; the universal property is Proposition 5.2.7.12 (line 17500).
  - LurieHTT line 38362: A.2.6.13 is an example; recognition is A.2.6.15 (line 38368).
  - LurieHA line 27099: 4.8.1.13 is a Remark; the characterization is Corollary 4.8.1.14 (line 27108).
- **Repair:**
  - Cite HTT 5.2.7.12, HTT A.2.6.15, and HA 4.8.1.10 with Corollary 4.8.1.14.
  - For "weakcompatequiv", cite HTT Proposition A.3.1.10 (line 39789).
  - For the other two TeX labels, cite printed numbers in HTT §3.2.1 (e.g. 3.2.1.11, line 8305) and §2.2.2.

## R09 (P3) — Most theorems carry no locator

- **Location:** among others:
  - G3.1 Brown representability (line 1508);
  - G2.5 Freudenthal and homotopy excision (329–335);
  - G2.6's F₁S¹ counterexample (405);
  - G3.4 Milnor sequence (1560);
  - G4.1 Leray–Hirsch (2028), G4.3 Thom (2053), G4.5;
  - G5.1 Spanier–Whitehead duality (2341);
  - G5.5.
- **Witness:** Brown is HatcherAT Theorems 4E.1/4E.2 (lines 19285, 19338). The F₁S¹ example is HSS Example 3.1.10 (line 1088). Both sources are in the manifest.
- **Repair:** put a locator in parentheses at each claim.

## R10 (P3) — The README is not in TauCetiRoadmap form

- **Location:** the title is `# Generalized cohomology, spectra and orientations`. The README has no `**Summary.**`, no `## Exact supplier contracts` (only a table, lines 31–46) and no `## How to read the build`, and its sections are `## G1.`–`## G5.` with numbered paragraphs.
- **Claim:**
  - The README has no API bullets, no `**Checks.**` (zero in the file), no per-layer `### Examples`/`### Dependencies` and no `## Downstream consumers`.
  - The Scope omits EnhancedDerivedSheaves, which consumes G2.1–G2.7 and G3.8–G3.9 (EnhancedDerivedSheaves README line 149 on main).
- **Repair:** restructure in the house shape, with per-supplier contracts, API bullets, at least three Checks per definition, per-layer Examples and Dependencies, and `## Downstream consumers` including EnhancedDerivedSheaves. #1807's head already has this shape.

## R11 (P3) — Commit-pinned links, pull-request numbers, process words, a broken link and a LaTeX delimiter

- **Location:**
  - `blob/<sha>` links at lines 39, 42, 3112, 3260 and 3262;
  - pull-request numbers at lines 37, 39 ("PR279", "#279"), 45, 75, 241, 328, 2320 and 2487;
  - the link `../SpinRepresentations/README.md` (line 41);
  - "current"/"currently" at lines 49, 52, 2728 and 3528;
  - `V=K\A, Z=L\(A∩L), U=K\(A∪L)` (line 3279);
  - `Suggested.lean` line 465: "Delete this local specialization when AT4.6 supplies".
- **Witness:**
  - Gate counts: `blob=5`, `prnum=6`, `latex=2`.
  - On main the folder is `TauCetiRoadmap/RepresentationTheory/SpinRepresentations`.
  - This pull request's ComplexKahlerGeometry renames `## K7.` to `## Layer 7: … (K7)`, with the mapping "`K7.1` → 7.1" at its line 570, so the K7 anchor at line 3262 no longer resolves on the new text.
- **Repair:**
  - Cite by name and section: ComplexKahlerGeometry 7.1 (K7.1), AlgebraicTopology 8.2, SpinGeometry G1.3, SmoothBundlesConnections B1.4.
  - Fix the relative link.
  - Write `K∖A` inside a code span.
  - Remove the process words.

## R12 (P3) — Imports of Suggested.lean

- **Location:** `Suggested.lean` lines 1–29 have 25 `import Mathlib.<submodule>` lines and four `TauCeti.*` lines, and no `import Mathlib`.
- **Witness:** gate counts `imports=1`, `mathlib-subimports=25`, `no-import-mathlib=1`.
- **Repair:** use `import Mathlib`, followed only by the `TauCeti.*` modules the rewritten headlines use.

## R13 (P3) — Padding in Suggested.lean

- **Location:**
  - `mappingPathFiberConstHomeomorphPath_apply`/`_symm_apply` and the `LoopSpace` pair (lines 115–136, `rfl`);
  - `mappingPathProjection_comp_inclusion`/`mappingPathEndpoint_comp_inclusion` (161–171);
  - `nativeSpinFourQuaternionHomeomorph_apply` (254);
  - `quaternionProjectiveGrassmannianHomeomorph_toEquiv` (492);
  - `levelMap_id`/`levelMap_comp` (674–681);
  - four `example … := inferInstance` (286, 411, 621, 622);
  - `IsHurewiczFibration.lift` (69);
  - `spinFourCalibratedPair_vectorAction` and `quaternionFrameAction_preserves`.
- **Witness:** line 118 reads `mappingPathFiberConstHomeomorphPath b k p t = p.val.2 t := rfl`. Each of the others closes by one tactic, restates a definition, or mirrors a README convention.
- **Repair:** delete them from `Suggested.lean`; the README keeps the statements.

## R14 (P3) — Edits outside the pull request's named folders

- **Location:** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`, one line each.
- **Witness:** `git diff --stat origin/main...HEAD`, excluding the fifteen named folders, lists exactly these two files. The worker's gate has `outside-folder=2`.
- **Repair:** move these two edits into a pull request of their own, or drop them.

## R15 (P2) — The smooth Grassmannian graph-chart upgrade is handed back and forth with TopologicalKTheory

- **Location:**
  - README lines 1992–1994: "Consume TopK T1.5's smooth graph-chart upgrade of its existing finite real/complex Grassmannian carriers, with … its rank-one diffeomorphisms to the native RP and CP manifold structures".
  - The same assumption appears at line 38 (supplier row), line 39 ("TopologicalKTheory T1.5 consumes these atlases for its real/complex graph-chart upgrade") and lines 3439–3445 ("T6.6, which instead uses T1.5's smooth comparison").
- **Claim:**
  - At 43a6b84 TopologicalKTheory agreed. Its line 68 there said "GeneralizedCohomology G4.0b consumes" the upgrade, as this pull request's commit 54a7a0cd ("real/complex Grassmannian smooth upgrade to T1.5") intended.
  - The later restoration of TopologicalKTheory's README to main's text reverses this, so the four GeneralizedCohomology passages now cite T1.5 for something it no longer provides.
  - Neither roadmap now owns the upgrade.
- **Witness:** TopologicalKTheory README at this head:
  - line 72: "GeneralizedCohomology G4.0b supplies the smooth graph-chart upgrade";
  - lines 397–398: "GeneralizedCohomology G4.0b supplies the smooth graph-chart/native-projective upgrade; this item owns the topological construction";
  - line 1601: "Consume G4.0b's rank-one graph-chart/native-Projectivization diffeomorphism".

  #1807's head has "G4.0b consumes" (its line 148).
- **Repair:** pick one owner. Either works without a cycle.
  - (a) **T1.5 owns it**, as at #1807's head and this pull request's previous head. When reconciling this pull request's TopologicalKTheory README with #1807 (the two conflict there), make lines 72–78, 397–398 and 1599–1601 say that T1.5 owns the upgrade and G4.0b consumes it. The four GeneralizedCohomology passages then stand unchanged.
  - (b) **G4.0b owns it.** Rewrite lines 38, 39, 1992–1997 and 3439–3445 so that G4.0b constructs the real/complex graph charts and rank-one RP/CP diffeomorphisms on T1.5's topological carriers, and T6.6 consumes G4.0b.
  - **Test.** Every "graph-chart upgrade" mention in both READMEs names the same owner.

## Previous findings

- R01 — not repaired: line 37 still reads "[HomotopySpheres Stage 3A](https://github.com/TauCetiProject/TauCetiRoadmap/pull/284) | the native `CompactlyGenerated` inclusion and compact-generation right adjoint"; depcheck prints the same four UPWARD lines and the CYCLE.
- R02 — not repaired: `Suggested.lean` line 537 `noncomputable instance pointedSSetMonoidal : MonoidalCategory PointedSSet := by sorry`; line 333 `set_option maxHeartbeats 1000000 in`; gate `sorry-data=22`.
- R03 — not repaired: `Suggested.lean` line 499 still declares `PointedSSet`. README line 539, "Own `IsHurewiczFibration p` for a", still plans the pinned predicate.
- R04 — not repaired: `Suggested.lean` lines 33–34: "The statements here suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap."
- R05 — not repaired: Scope line 62 "BordismFormalGroups F6.5 and EllipticCohomology consume G2.11's …" names no HigherToposTheory; #1901 still owns Bergner/Joyal/straightening.
- R06 — not repaired: line 35 still cites `ordinaryEMRepresentability`, `ordinaryEMLoopComparison`, `ordinaryCohomologySuspension` and `projectiveEMComparisons`, which AlgebraicTopology's `## Renamed targets` (line 3033) retires.
- R07 — not repaired: `Suggested.lean` line 514 `noncomputable def realizationProductKelleyComparison (K L : SSet.{u})` while README line 33 consumes AlgebraicTopology Stage 4.5's comparison.
- R08 — not repaired: line 1246 "(the localization criterion of HTT5.2.7.4)", line 1055 "recognition (HTTA.2.6.13)", line 1377 "(HA4.8.1.10/13)".
- R09 — not repaired: line 1508 "1. **Brown on arbitrary CW.** Prove set-valued pointed Brown representability" with no locator.
- R10 — not repaired: line 1 `# Generalized cohomology, spectra and orientations`; no `**Summary.**`, no `**Checks.**`.
- R11 — not repaired: line 3279 "specified compactifications V=K\A, Z=L\(A∩L), U=K\(A∪L)"; gate `blob=5`, `prnum=6`, `latex=2`.
- R12 — not repaired: `Suggested.lean` line 1 `import Mathlib.Topology.Homotopy.HomotopyGroup`; no `import Mathlib`.
- R13 — not repaired: line 118 `mappingPathFiberConstHomeomorphPath b k p t = p.val.2 t := rfl`.
- R14 — not repaired: the diff outside the named folders still lists `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

## Verified sound

**Change set.**
- `git diff --stat 43a6b84 HEAD -- TauCetiRoadmap/GeneralizedCohomology` is empty.
- `lake-manifest.json` and `lean-toolchain` are unchanged, so the pins are those of the previous review: Tau Ceti 2fd255d997.

**Gate re-run.** `gate … GeneralizedCohomology --base origin/main` gives:
- `set_option=2 blob=5 latex=2 prnum=6 sorry-data=22 imports=1 mathlib-subimports=25 no-import-mathlib=1 statement-hygiene=2 dropped=2 depcheck=5 outside-folder=31 FAIL`.
- The outside-folder count of 31 covers 29 files in the named folders and the 2 files of R14.
- Each failing rule maps to a finding: `set_option` and `sorry-data` (R02), `blob`, `latex` and `prnum` (R11), the three import rules (R12), `statement-hygiene` (R02), `dropped` and `depcheck` (R01), `outside-folder` (R14).

**Dependency check output:**

```text
UPWARD: GeneralizedCohomology (on main) -> HomotopySpheres (#45) at README lines [37]
UPWARD: GeneralizedCohomology (on main) -> OperatorKTheory (#9) at README lines [45]
UPWARD: GeneralizedCohomology (on main) -> StringOrientation (#11) at README lines [3419]
UPWARD: GeneralizedCohomology (on main) -> TangentialBordism (#14) at README lines [43]
CYCLE among: GeneralizedCohomology, HomotopySpheres, StringOrientation, TangentialBordism
depcheck: 236 roadmaps, 2296 edges, 5 problem(s)
```

**Elaboration.**
- `lake env lean TauCetiRoadmap/GeneralizedCohomology/Suggested.lean` took 2m02s and gave 25 `declaration uses sorry` warnings and no other diagnostic.
- The file is unchanged, so the previous review's comparison of all 98 elaborated signatures still applies. In that comparison the 11 "looks dropped" leads were false alarms or harmless, and the padding probe is the basis of R13.

**Pinned declarations re-opened (Tau Ceti 2fd255d, Mathlib at the pin):**
- `PointedSSet` (Pointed/Basic.lean:33);
- `IsHurewiczFibration` (HurewiczFibration/Basic.lean:58);
- `SymmetricSpectrum` (Spectra/SymmetricSpectrum.lean:92);
- `MappingPathSpace` (MappingPath/Basic.lean:40);
- `MarkedSSet` (Marked/Basic.lean:49);
- `SSet.kanComplex_of_group` (KanComplex/SimplicialGroup.lean:186);
- `Projectivization.instTopologicalSpace` (Topology/Algebra/Projectivization.lean:44).

**Cross-roadmap citations re-resolved at this head.**
- **AlgebraicTopology** at this pull request's head:
  - items 2.5, 4.4–4.8, 5.0, 5.5, 6.0, 6.4, 8.2, 8.8c, 8.8d, 8.10 and 8.11b are present (e.g. 8.8c at line 123, 8.8d at 127);
  - Stage 4.5's ownership of `k` (line 141) and of the realization product (lines 148–149);
  - `## Renamed targets` (3033).
- **CharacteristicClasses:** C1.1b, C1.2, C1.5, C2.1, C2.4, C2.5 and C3.2 are present. The section "From TauCetiRoadmap.GeneralizedCohomology" has been removed from it, so CharacteristicClasses no longer consumes this roadmap and no loop through it remains. Its line 3496 lists GeneralizedCohomology as a consumer of C1–C3.
- **TopologicalKTheory:** T1.5, T1.6, T1.6a, T1.6c, T5, T7, T7.0, T7.0a (line 1766) and T7.0b (1831) are present. Its *Needs* lines for T7.0a and T7.0b name no GeneralizedCohomology section (the basis of the R01 repoint). Lines 72, 397–398 and 1601 are the basis of R15.
- **ComplexKahlerGeometry:** K7.1 resolves through the mapping table at line 570 to `### 7.1` (line 2364).
- **BordismFormalGroups:** its F6.5 → G2.11 mapping (lines 71–79) still names G2.11's sub-lane headings. The G2.11 sub-lane headings it uses are present in this README.
- **EnhancedDerivedSheaves on main:** lines 33 and 149 consume G2.1–G2.7 and G3.8–G3.9. It supplies nothing to this roadmap, so there is no cycle.
- **On main:** HilbertModules, CStarAlgebras, GeometricTopology, SmoothBundlesConnections, SpinGeometry and `RepresentationTheory/SpinRepresentations` are present.

**Overlap facts (`scratch/overlaps.md`), each checked.**
- Three open revisions drop anchors this README links to, but each keeps the section id:
  - ComplexKahlerGeometry #1234 has `## Layer 7: … (K7)` at line 2688;
  - SpinGeometry #1674 has `### 1.3 … (G1.3)` at line 252;
  - AlgebraicTopology #1652 has "Stage 8 items 1–16 are §§8.1–8.16" at line 884.

  Citing by name and section (R11) survives them. Only the `blob` anchors break.
- #1807 and #1854 change this folder too, and the description orders #1807 first. The overlap check reports no conflict in this folder.
- #1187 touches one line of this `Suggested.lean`, as before.

**Adversarial table.** The first 33 rows are carried from the previous review (r53) for statements this head leaves untouched, with that review's computed values. The last five rows are new.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `Eⁿ(*)=π_(−n)E` (r53) | KU, n=−2; HZ, n=0,1 | `KU^(−2)(*)=π_2KU=ℤ`; `HZ^0(*)=ℤ`, `HZ^1(*)=π_(−1)HZ=0` | holds | — |
| `E*(S¹)`, σ²=0, G1.7 (r53) | E=HZ | commutativity alone gives only 2σ²=0; the diagonal nullhomotopy gives σ²=0 | holds | — |
| a×σ(b)=(−1)^p σ(a×b), G1.4 (r53) | p=0, 1 | +1, −1 | holds | — |
| Phantom `S_ℚ→ΣHZ`, G3.6 (r53) | Milnor terms | lim=π_(−1)HZ=0; lim¹=Ext(ℚ,ℤ)≠0 | holds | — |
| Telescope ε-sign, G3.4 (r53) | i=0, 1 | (−1)^i(−1)^i(a_i−f a_(i+1))=(1−shift)(a)_i | holds | — |
| Freudenthal range, G2.5 (r53) | S¹, S² | π₁S¹=ℤ→π₂S²=ℤ onto; π₃S²=ℤ→π₄S³=ℤ/2 onto | holds | — |
| Homotopy excision, G2.5 (r53) | X (k−1)-connected | X→ΩΣX is (2k−1)-connected | holds | — |
| Rational Hurewicz range, G5.6 (r53) | S², k=2 | i=3: π₃S²⊗ℚ=ℚ→H₃=0, onto | holds | — |
| `H*(K(ℤ,n);ℚ)`, G5.6 (r53) | n=1, 2 | exterior in degree 1; polynomial in degree 2 | holds | — |
| π_i GL_k(ℝ) table, G2.9 (r53) | k=0..5, i≤3 | SO(3): π₁=ℤ/2, π₃=ℤ; SO(4): π₃=ℤ²; π₂=0 | 24 entries hold | — |
| π₃ stabilization, G2.9 (r53) | (q_L,q_R) | SO(3) diagonal (1,1); in SO(5), (a,b)↦a+b | holds | — |
| [S¹,GL₂], [S⁰,GL_k], G2.9 (r53) | — | D_∞; 4 classes; 2 clutching classes | holds | — |
| KSp=Σ⁴KO, G5.4 (r53) | point | KO⁴(*)=ℤ; real forget 4, complex forget 2 | holds | — |
| π₀K_op,n, G5.5 (r53) | n=1, 4 | KO_7=0; KO_4=ℤ | holds | — |
| Bott sign on CP¹, G5.5 (r53) | H=[γ*] | (H−1)²=0 ⇒ [γ]−1=−(H−1) | holds | — |
| Hermite normalization, G5.5 (r53) | general j | ∫h_j²=1 | holds | — |
| Pin⁺ vs `unitary`, G5.4 (r53) | star(ιv) | star(ιv)ιv=−Q(v)=−1 | holds | — |
| ε_k shuffle signs, G5.0/G5.5 (r53) | k=1..4 | +,−,−,+; ε_(r+s)=ε_rε_s(−1)^(rs) | holds | — |
| Cl(1,1)⊗Cl(1,1) sign, G5.5 (r53) | p′q odd | −1 | holds | — |
| Quaternionic classes, G4.5 (r53) | rank 1, torus | c(Cγ)\|_T=Π(1−x_j²); p₁=2e | holds | — |
| Derived p-completion, G3.9 (r53) | Hℤ; H(ℤ/p^∞) | π₀=ℤ_p; π₁=ℤ_p | holds | — |
| MU cell connectivity, G5.5 (r53) | r=1, 2 | bottom 0, next 2 | holds | — |
| Localization triangle, G5.7 (r53) | K/A over L/(A∩L) | quotient K/(A∪L) | holds | notation, R11 |
| Verdier quotient, G2.11 (r53) | NikolausScholze I.3.3 | formulas identical | holds | — |
| Excellent base, G2.11 (r53) | HTT A.3.2.16 | A1–A5 as listed | holds | — |
| HTT 5.2.7.4 / A.2.6.13 / HA 4.8.1.13 (r53) | source lines 17361, 38362, 27099 | 5.2.7.12, A.2.6.15, 4.8.1.14 are the intended results | locators wrong | R08 |
| Categorical fibration over Kan, G2.11 (r53) | HTT 3.3.1.8, 2.4.2.4, 2.1.3.4 | Cartesian, right fibration, trivial | holds | — |
| Rational stable stems headline (r53) | n=1, k=3: π₄S³=ℤ/2; n=0 excluded (π_kS^k=ℤ) | probe elaborates | statable, absent | R04 |
| `coefficientDegreeEquiv` (r53) | elaborated type | additivity binder dropped; `≃+` still true | sorry'd data | R02 |
| `realizationProductKelleyComparison` (r53) | \|K×L\| | true (Milnor); duplicate owner | — | R03, R07 |
| `IsHurewiczFibration` (r53) | pinned predicate | same lifting-function predicate | duplicate | R03 |
| Source sample (r53) | 27 locators | 24 match, 3 wrong | — | R08 |
| Gate failures (r53, re-run) | 12 rules | identical counts at both heads | unchanged | R01, R02, R11, R12, R14 |
| **R01 repoint: TopologicalKTheory T7.0b ⇒ G5.4 `stableBSpin_homotopyGroupsThroughEight`** | π_i(BSpin)=π_i(BO)=π_(i−1)(O) for i≥4; π₁–π₃(BSpin)=0 | T7.0b: π₃O=ℤ, π₄–₆O=0, π₇O=ℤ ⇒ π₄=ℤ, π₅–₇=0, π₈=ℤ; G5.4 claims π₁,π₂,π₃,π₅,π₆,π₇=0, π₄≅π₈≅ℤ | agree | repair of R01 |
| **T7.0b's K̃O(S^d) table** (witness for the repoint) | d=1, 2, 4, 8 | K̃O(S^d)=π_(d−1)(O): ℤ/2, ℤ/2, ℤ, ℤ, matching its table | consistent | — |
| **R01: T7.0a/T7.0b *Needs*** | TopologicalKTheory lines 1808–1814 and the T7.0b *Needs* | T1.5, T1.6a, T1.6c, T1.6d, T7.0, T2.0, RiemannianGeometry, MorseTheory, AT, Tau Ceti; no GeneralizedCohomology item | no return edge | — |
| **R15: graph-chart upgrade owner** | the GC side and the TopK side, at 43a6b84, this head and #1807 | GC (4 places): T1.5 owns. TopK at this head (3 places): G4.0b owns. TopK at 43a6b84 (line 68) and #1807 (line 148): G4.0b consumes | no owner at this head | R15 |
| **R07: realization-product owner** | this head, #1652, #1901 | AT 4.5 owns (lines 148–149); #1652 line 171 gives it to G2.1; #1901 line 198 consumes G2.1's Lean name | opposite hand-offs | R07 |

**Seeded sample.** The worker's sample of 15 targets falls in no changed passage, because 0 lines changed. The previous review's 27-locator sample is carried; no locator in this README is flagged unverified. R15 is an ownership defect and involves no locator.

**Ownership against open pull requests.** I checked by object for the passages above, against HigherToposTheory #1901 (2176cc4), AlgebraicTopology #1652 (c204943), TopologicalKTheory and GeneralizedCohomology at #1807, and the anchor-dropping revisions #1234 and #1674. The rest of the folder is untouched, and the previous review's ownership audit stands for it.

## Not verifiable

- **Spin(4) factor swap.** The G4.0a claim (line 1819) that a factor swap alone fails on ι(e₀)ι(e₁) needs the native factor order of `TauCeti.realSpinFourEquivQuaternionUnitaryProd`. I did not compute it, as in the previous review.
- **Uncertified sources.** ABSClifford, McDuffSegal, SegalCategories, JoachimKO and QuillenHA are uncertified in the manifest. None of their locators lies in a changed passage.
- **Unrecorded sources.** Adams, *Stable Homotopy and Generalised Homology*, and Joachim, *Higher coherences for equivariant K-theory*, are cited in References but not recorded in the manifest. This is unchanged text.

## Source issues

- none
