# Review of TopologicalKTheory (pull request #1808 at d56e187)

**Verdict:** needs changes

Nothing in `TauCetiRoadmap/TopologicalKTheory/` has changed since dc47c7e, and the pins are unchanged. Fifteen of the sixteen previous findings therefore stand; they are renumbered below, and each one names its previous id. The previous R04 is repaired by this pull request's ComplexKahlerGeometry revision.

One carried repair is corrected. The previous R02 said to cite DGFloerPartII. That is not allowed: TopologicalKTheory is on main, and a roadmap on main never names as a supplier a roadmap that is not on main. R02 below gives a replacement.

## R01 (P2) — The TopologicalKTheory edits repeat #1807's and #1854's, on a superseded base, and conflict with main

Previously R01; not repaired.

- **Location.** `TauCetiRoadmap/TopologicalKTheory/README.md` lines 51–74, 248–254, 304–307, 333–362, 1119–1126 and 1365–1366. These are the AT Stage 5.5 swap for DGFloer Layer 1 item 2, and T1.5 taking the smooth graph-chart upgrade from GeneralizedCohomology G4.0b.
- **Claim.** This pull request's 70-line TopologicalKTheory diff has nothing to do with its subject (SchemeAndStackFoundations and ModularCurves). Two other open pull requests make the same two edits on newer bases, and the description's merge order puts #1807 first.
- **Witness.**
  - `git merge-tree --write-tree origin/main HEAD` reports "CONFLICT (content): Merge conflict in TauCetiRoadmap/TopologicalKTheory/README.md".
  - Since the merge base a891cd1, main has changed this folder: README 541 lines, Suggested.lean 163 lines.
  - #1807 at 2ce4de6 has the same edits at lines 127, 142 and 469; #1854 at 0905eb1 at lines 54, 64 and 311.
- **Repair.**
  - Drop this pull request's TopologicalKTheory edits. Either restore the README to its merge-base content, or rebase on main and restore it to main's.
  - Test: `git diff origin/main...HEAD -- TauCetiRoadmap/TopologicalKTheory` is empty, and `git merge-tree` reports no conflict in this folder.
  - R02–R15 then apply to whichever pull request next edits this folder. R02 and R03 also hold for main's text.

## R02 (P2) — HomotopySpheres is cited as a supplier (gate dropped=6), and DGFloerPartII cannot replace it

Previously R02; not repaired. The previous repair is withdrawn.

- **Location.** README lines 108–120: "HomotopySpheres §4A–4B … supplies stable O/SO, the loop comparison with T1.6's oriented classifier, and the full real Bott loop chain". Also lines 115, 372, 615, 1258 and 1374.
- **Claim.**
  - T1.6a, T1.6d and T7.1's real periodicity rest on a roadmap that may never be cited as a supplier.
  - This roadmap is on main, so it consumes only the pins and roadmaps on main. No roadmap on main supplies these objects.
  - The previous suggestion, DGFloerPartII, is not on main, so citing it is an upward edge. It is also circular: DGFloerPartII consumes GeneralizedCohomology, which consumes this roadmap.
- **Witness.**
  - The gate reports dropped=6 at lines 108, 115, 372, 615, 1258 and 1374.
  - There is no `TauCetiRoadmap/DGFloerPartII` on main (1bea835). At #1799's head f27b94b, 4.2a needs "GeneralizedCohomology G4.0b" (line 1426), and GeneralizedCohomology line 1992 consumes TopK T1.5.
  - Main's DGFloer (line 56) and GeneralizedCohomology (lines 1491 and 1658) also defer the real Bott chain to HomotopySpheres.
- **Repair.**
  - Delete the HomotopySpheres bullet (lines 108–120) and the citations at lines 372, 615, 1258 and 1374.
  - State as T7 targets owned here, each with a locator: the stable groups O and SO, ΩBSO≃SO compared with T1.6c's classifier, and the eight-fold real periodicity that T7.1 uses.
  - Name DGFloerPartII 4.2a–4.2c only as a consumer. A roadmap on main is earlier than every open one.
  - Test: the gate shows dropped=0, and the README names no roadmap that is absent from main as a supplier.

## R03 (P2) — TopologicalKTheory T1.6a and CharacteristicClasses C1.1a supply each other

Previously R03; not repaired. CharacteristicClasses' side has moved, which turns the mutual citation into a layer-level cycle.

- **Location.** README line 367: "For oriented real bundles of fixed positive rank n≥1 compare using CharacteristicClasses C1.1a's finite oriented-cover precursor". Also lines 75–82, 113, 431, 475 and 581.
- **Claim.** T1.6a consumes CharacteristicClasses C1.1a, while C1.1a at this head consumes T1.6a. That is a cycle T1.6a → C1.1a → T1.6a.
- **Witness.**
  - `CharacteristicClasses/README.md` at this head, line 270: "Use TopK T1.5's actual finite real Grassmannians". Lines 643–646: C1.1a compares "T1.6a's lifted Schubert cells"; "TopK T1.6a owns the finite oriented carriers".
  - The oriented carrier is pinned as `TauCeti.finiteOrientedGrassmannian` (`Topology/Grassmannian/Oriented.lean:44`).
- **Repair.**
  - In T1.6a and T1.6c, consume `TauCeti.finiteOrientedGrassmannian` and its `forget` (`Oriented.lean:53`) directly. Own the lifted Schubert cells, the SO–Stiefel comparison and the BSO→BO double cover here.
  - In lines 75–82 and 113, name CharacteristicClasses C1.1a–b only as consumers.
  - Test: no `C1.1a` remains in a supplier position in this README.

## R04 (P2) — Suggested.lean and T1.5 restate pinned Tau Ceti declarations

Previously R05; not repaired.

- **Location.**
  - `Suggested.lean` lines 231–282 (the finite Grassmannian block), lines 59–113 (partition gaps) and lines 196–201 (finite trivial embedding).
  - README lines 343–345: "In rank one own the real and complex projective comparison homeomorphisms from native `Projectivization 𝕜 (Fin (n+1)→𝕜)` to `finiteGrassmannian 𝕜 1 (n+1)`".
- **Claim.** These objects exist at the pinned Tau Ceti; the README does not cite them and the Lean file declares them again.
- **Witness.**
  - On a scratch copy at this head I replaced six `sorry`s with one tactic each:
    - `exact TauCeti.finiteGrassmannian.frameSpan_surjective`
    - `exact …isQuotientMap_frameSpan`
    - `exact …isQuotientMap_frameSpan_toFullRankFrame`
    - `exact …isEmpty_of_lt h`
    - `exact …equivModuleGrassmannian 𝕜 hr`
    - `rfl`
  - The copy then elaborates with 11 `sorry` warnings instead of 17, and no error.
  - Two more objects are pinned: `PartitionOfUnity.gap` (`Topology/PartitionOfUnity/Gap.lean:67`) and `TauCeti.finiteGrassmannian.projectivizationHomeomorph` (`Topology/Grassmannian/Projectivization.lean:46`).
- **Repair.**
  - Delete these declarations.
  - In T1.3, T1.5 and T1.6a cite these declarations with their files: `TauCeti.finiteGrassmannian`, `frameSpan`, `isQuotientMap_frameSpan`, `finiteOrthonormalFrame`, `equivModuleGrassmannian`, `projectivizationHomeomorph`, `Tautological`, `PartitionOfUnity.gap`/`gapPartition` and `exists_continuous_injective_fin_of_compactSpace`.
  - Keep as a target only the smooth upgrade, which is not at the pin.

## R05 (P2) — Sorry'd data (gate sorry-data=3)

Previously R06; not repaired.

- **Location.** `Suggested.lean` line 240 (`⟨Submodule.span 𝕜 (Set.range f.1), by sorry⟩`), line 260 (the same) and lines 274–277 (`… ≃ Module.Grassmannian … := by sorry`).
- **Claim.** These are a `def` with a sorry'd field and a sorry'd `Equiv`, and the `instance` at line 242 is built on the first.
- **Witness.** The gate lists lines 238, 258 and 274. The pinned `equivModuleGrassmannian` (`Topology/Grassmannian/Basic.lean:216`) has a real body.
- **Repair.** Delete them, as in R04. Test: the gate shows sorry-data=0.

## R06 (P2) — No headline theorem is stated, though three are statable at the pins

Previously R07; not repaired.

- **Location.** `Suggested.lean` lines 17–23. The docstring names no headline and no missing carrier.
- **Claim.** The file is an API catalogue. The following statements elaborate at the pins:

```lean
theorem nonempty_pullback_iso_of_homotopic {𝕜 : Type} [RCLike 𝕜] {X Y : Type}
    [TopologicalSpace X] [TopologicalSpace Y] [ParacompactSpace X] [T2Space X]
    (A : TauCeti.FiniteRankBundleCore 𝕜 Y) {f g : C(X, Y)} (h : f.Homotopic g) :
    Nonempty (A.pullback f ≅ A.pullback g)
theorem exists_iso_pullback_tautological {𝕜 : Type} [RCLike 𝕜] {X : Type}
    [TopologicalSpace X] [CompactSpace X] [T2Space X] (A : TauCeti.FiniteRankBundleCore 𝕜 X) :
    ∃ (N : ℕ) (f : C(X, TauCeti.finiteGrassmannian 𝕜 A.rank N)),
      Nonempty (A ≅ (TauCeti.FiniteRankBundleCore.ofBundle 𝕜 A.rank
        (TauCeti.finiteGrassmannian.Tautological 𝕜 A.rank N)).pullback f)
theorem kZero_evenSphere (n : ℕ) :
    Nonempty (TauCeti.SplitK0.{0} (TauCeti.FiniteRankBundleCore ℂ
      (Metric.sphere (0 : EuclideanSpace ℝ (Fin (2 * n + 3))) 1)) ≃+ ℤ × ℤ)
```

- **Witness.**
  - A scratch file with `import Mathlib` and four Tau Ceti modules elaborates these three statements with exit 0 and three `sorry` warnings. The modules are `Topology.Grassmannian.Tautological`, `Topology.VectorBundle.FiniteRank.{Biproduct,Pullback}` and `CategoryTheory.GrothendieckGroup.Split`.
  - The statements are hatcher-vbkt Theorem 1.6 (line 788), Proposition 1.4 with Theorem 1.16, and T4.8's sphere groups.
- **Repair.**
  - State these three, with their sources in their docstrings.
  - In the module docstring, name each headline that is not statable and the carrier it lacks:
    - the periodicity map and `K(S²)`: no tensor product on cores;
    - the Thom isomorphism: no compactly supported K;
    - `R(G)≃K_(G,c)(V)`: no equivariant bundle category;
    - the KO coefficient ring: no graded theory;
    - `[X,BU×ℤ]`: no stable Grassmannian.

## R07 (P3) — Padding: non-headline declarations

Previously R08; not repaired.

- **Location.** `Suggested.lean`:
  - lines 34–37 (`FiniteRankAtlas`);
  - lines 45–53 (`BundleCategoryK0` and the `example … := inferInstance`);
  - line 117 (the T2.4 monoid exercise);
  - lines 125–163 (`adamsValueOfLambdaSeries` and two lemmas, which are T2.5 Checks);
  - lines 183–193 (`RelativeSymbol`);
  - lines 210–226 (the T4.2/T4.4 lemmas);
  - line 268 (the boundary case `r > N`).
- **Claim.** None of these is a headline, and no stated theorem uses `FiniteRankAtlas`, `RelativeSymbol` or `BundleCategoryK0`.
- **Witness.** The `example` closes by `inferInstance`, and line 268 closes by `exact TauCeti.finiteGrassmannian.isEmpty_of_lt h` (R04 probe).
- **Repair.** Delete these declarations from `Suggested.lean`; the README keeps them as targets and Checks.

## R08 (P3) — Imports (gate imports=1, mathlib-subimports=13, no-import-mathlib=1)

Previously R09; not repaired.

- **Location.** `Suggested.lean` lines 1–15. The file begins with `import TauCeti.RingTheory.PowerSeries.Log`, followed by thirteen `import Mathlib.…` lines.
- **Claim.** The file must import `Mathlib` first, then only the Tau Ceti modules it uses.
- **Witness.** The gate output at this head.
- **Repair.** Use the single line `import Mathlib`, followed only by the Tau Ceti modules that the R06 statements need (listed in R06's witness).

## R09 (P3) — Commit-pinned links (gate blob=4)

Previously R10; not repaired.

- **Location.** README lines 83, 88, 92 and 96, for example `…/blob/13b2335…/ComplexKahlerGeometry/README.md`.
- **Claim.** Roadmaps are cited by name and section, not by commit.
- **Witness.** The gate output at this head.
- **Repair.** Link `../ComplexKahlerGeometry/README.md` (K5–K7), `../RepresentationTheory/CompactGroups/README.md` (Layer 5.1) and `../BanachAlgebras/README.md` (A2). Cite NoncompactQuantumSymmetry M0 by name.

## R10 (P3) — A Mathlib pull-request link and an interface absent at the pin (gate prnum=1)

Previously R11; not repaired.

- **Location.** README lines 762–768: "Consume the generic `AdamsOperations` and `AdamsHom` interfaces of [Mathlib PR42468] … If this interface is unavailable, provide it in Tau Ceti in the same shape."
- **Claim.** The README cites a declaration that does not exist at the pin, and makes its scope conditional on Mathlib.
- **Witness.** `grep -rn AdamsOperations` over the pinned Mathlib returns nothing.
- **Repair.** Make the package of ψᵏ on `K(X)` (composition, the prime congruence, pullback compatibility) a definite T2.5 target. Delete the link and the "if".

## R11 (P3) — Edits outside this pull request's roadmap folders (gate outside-folder=2)

Previously R12; not repaired.

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.
- **Claim.** Neither folder is one of this pull request's roadmap folders.
- **Witness.** `git diff -U0 origin/main...HEAD` shows one-line hunks at these lines. Both folders belong to #1854's set.
- **Repair.** Drop both edits, or leave them to #1854.

## R12 (P3) — The sampled targets T2.0 and T7.0 have no locator

Previously R13; not repaired.

- **Location.** README lines 651–700 (T2.0) and 1186–1254 (T7.0). Neither paragraph cites a source, and the README never cites Sibson.
- **Claim.** Every claim needs its locator.
- **Witness.**
  - T2.0's compact case is hatcher-vbkt §2.1, pp. 39–40 (lines 1504–1558), and its homotopy invariance is Theorem 1.6, p. 20 (lines 788–790).
  - The manifest's `sibson-1969` entry (pp. 19–21) is never cited.
- **Repair.**
  - At T2.0 add "(Hatcher, VBKT, §2.1, pp. 39–40; Theorem 1.6, p. 20)", marking the paracompact, unbounded-rank extension as the roadmap's own.
  - At T7.0 add "(Sibson 1969, pp. 19–21)" and list Sibson under References.

## R13 (P3) — README and Lean names disagree

Previously R14; not repaired.

- **Location.**
  - Backticked names of this roadmap appear in the README but not in `Suggested.lean`, for example `stableRealGrassmannian` (×2), `stableOrientedGrassmannianWhitneySum` (×3), `stableRealGrassmannianShear`, `adamsOperation`, `complexKClassifyingMap` and `coneBoundary`. There are sixteen in all, the list of the previous report.
  - Conversely, `partitionGap`, `adamsValueOfLambdaSeries` and `exists_finite_trivial_embedding` are declared in the Lean file but never mentioned in the README.
- **Claim.** A backticked name of the roadmap's own claims a Lean declaration.
- **Witness.** A grep of each name at this head: the README count is ≥1 and the Lean declaration count is 0, and the reverse for the last three.
- **Repair.** Write README-only names in italics. After R04 and R07, every remaining Lean name appears in the README.

## R14 (P3) — The README is not in house form

Previously R15; not repaired.

- **Location.**
  - Line 1, "# Topological K-theory of vector bundles": there is no `# Roadmap:` title and no `**Summary.**` paragraph.
  - The sections are "Scope, carriers and suppliers" and "T1."–"T7." headings. There are no Exact supplier contracts, How to read the build, `## Layer k`, Examples, Dependencies or Downstream consumers sections.
  - The text has process words: "prototype" (lines 37 and 798) and "If this interface is unavailable" (line 767).
- **Claim.** The definitions lack API bullets and Checks, and no target has a `*Needs:*` line.
- **Witness.** `grep -c '\*\*Checks\.\*\*'` and `grep -c '\*Needs:\*'` both return 0.
- **Repair.**
  - Recast T1–T7 as Layers 1–7 with `### k.n` subsections.
  - Give each definition API bullets and at least three Checks; for β, use the Conventions computations (`s₀=z·s∞`, and the folded symbol `z̄` gives `−β`).
  - Give each target a `*Needs:*` line, and move the suppliers into Exact supplier contracts.

## R15 (P3) — #1854 changes this roadmap, and the description states no order with it

Previously R16; not repaired.

- **Location.** The pull request's description. Its merge-order paragraph is "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".
- **Claim.** #1854 makes the same TopologicalKTheory edits, and it conflicts with this pull request in nine roadmap folders.
- **Witness.** #1854's README at 0905eb1 has line 54, "its Stage 5.5 supplies the bundle-to-Serre comparison", and line 64, "T1.5 owns the smooth graph-chart upgrade". See also `roadmaps overlaps TopologicalKTheory`.
- **Repair.** State whether #1854 merges before or after this pull request, and rebase on it if it comes first. After R01 this pull request no longer touches this folder.

## Previous findings

- R01 — not repaired: lines 53–54 still read "its Stage 5.5 supplies the Serre-fibration homotopy sequence and native bundle-to-Serre comparison used by T1.5", and `git merge-tree` still conflicts in this README. Now R01.
- R02 — not repaired: line 108 still has "[HomotopySpheres §4A–4B](…/pull/1287) supplies stable O/SO". Its DGFloerPartII repair is withdrawn, because that roadmap is not on main. Now R02.
- R03 — not repaired: line 367 still reads "compare using CharacteristicClasses C1.1a's finite oriented-cover precursor", while CharacteristicClasses C1.1a at this head consumes T1.6a. Now R03.
- R04 — repaired, by this pull request's ComplexKahlerGeometry revision: CKG 7.2 (lines 2310–2318) now transports the pinned `TauCeti.ComplexProjectiveSpace.cwComplex` to `Projectivization ℂ (Fin (n+1) → ℂ)`, so line 635's "CKG K7.2's complex characteristic cells" resolves.
- R05 — not repaired: `Suggested.lean` lines 231–282 still declare `finiteGrassmannianFrameSpan` and five siblings, and each closes with one Tau Ceti lemma. Now R04.
- R06 — not repaired: lines 238, 258 and 274 still have `by sorry` in a `def` (gate sorry-data=3). Now R05.
- R07 — not repaired: the module docstring (lines 17–23) states and names no headline. Now R06.
- R08 — not repaired: `FiniteRankAtlas`, `BundleCategoryK0`, the `inferInstance` example, `adamsValueOfLambdaSeries` and `RelativeSymbol` are still declared. Now R07.
- R09 — not repaired: line 1 is still `import TauCeti.RingTheory.PowerSeries.Log`, followed by thirteen `import Mathlib.…` lines. Now R08.
- R10 — not repaired: lines 83, 88, 92 and 96 still link `…/blob/<sha>/…`. Now R09.
- R11 — not repaired: line 763 still links "[Mathlib PR42468]", and line 767 still reads "If this interface is unavailable". Now R10.
- R12 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77 are still edited. Now R11.
- R13 — not repaired: T2.0 (line 651) and T7.0 (line 1186) still cite no source. Now R12.
- R14 — not repaired: `stableRealGrassmannian` and the other README-only names are still backticked. Now R13.
- R15 — not repaired: there are still zero `**Checks.**` and zero `*Needs:*` lines, and line 1 is still "# Topological K-theory of vector bundles". Now R14.
- R16 — not repaired: the description's merge order still names only #1101 and #1807. Now R15.

## Verified sound

**Gate, build and dependency check.**
- I re-ran the gate at d56e187. Every count matches the worker's (set_option=0, blob=4, prnum=1, sorry-data=3, imports=1, mathlib-subimports=13, no-import-mathlib=1, dropped=6, statement-hygiene=0, stray-files=0), except outside-folder. My run reports 30 because it also counts this pull request's own folders; the worker's 2 is the right count.
- `lake env lean …/Suggested.lean` exits 0 with 17 `sorry` warnings and nothing else.
- `gate --depcheck … --movable` prints "depcheck: 236 roadmaps, 2283 edges, 0 problem(s)". There is no UPWARD or CYCLE line. The check does not read the prose HomotopySpheres link (R02) or the C1.1a mutual citation (R03), so its 0 is a false negative there.
- `lake-manifest.json` and `lean-toolchain` are unchanged since dc47c7e.

**Signatures.** I compared all 30 elaborated types in `signatures.md` with the README. The one lead, `RelativeSymbol`, drops only `IsTopologicalAddGroup` and `ContinuousSMul` on the fibres. It keeps `AddCommGroup`, `Module` and `TopologicalSpace` (inst_5–inst_10), which is all that `E₁ x →L[ℂ] E₂ x` needs. I did not edit the file.

**Library declarations opened at the pins this round.**
- Grassmannian: `Topology/Grassmannian/Basic.lean:120,127,181,216,246`, `Orthonormal.lean:218`, `Projectivization.lean:46`, `Tautological.lean:143,172,178` (the `FiberBundle`/`VectorBundle` instances on `Fin r → 𝕜`), `Oriented.lean:44,53`.
- Bundles and K-groups: `Topology/PartitionOfUnity/Gap.lean:67,419`, `Topology/VectorBundle/FiniteRank/Basic.lean:56,209`, `Pullback.lean:43`, `CategoryTheory/GrothendieckGroup/Split.lean:128`.
- Cells and fibrations: `Topology/CWComplex/Classical/ComplexProjective.lean:419` (`cwComplex`), `Topology/Homotopy/SerreFibration/FiberBundle.lean:365,395`.
- Mathlib: no `AdamsOperations`.

**Cross-roadmap citations resolved at this head.**
- AlgebraicTopology:
  - the Stage 5.5 scope (lines 112–133, which name TopK T1.5 as a consumer);
  - Stage 5 item 5 (lines 1196–1203; line 1325, "TopologicalKTheory T1.5 consumes the based homotopy sequence");
  - Stages 4.5, 4.6, 8.1 and 8.5, and `cwProductKelley`, `basedHomotopyInverseOfEquivalence` and `homotopyGroupKelleyProduct`, all present.
- ComplexKahlerGeometry: 7.1 (line 2243), 7.2 (lines 2285 and 2310–2318) and Layer 5 (line 1372).
- CharacteristicClasses: C1.1a (lines 610–646) and C1.1b (line 648).
- GeneralizedCohomology: the table row at line 39 and line 1992, where TopK T1.5 is consumed.
- DGFloerPartII at #1799's head f27b94b: 4.2a, 4.2b and 4.2c (lines 1388, 1442 and 1500; *Needs:* lines 1426 and 1484).
- Main: DGFloer line 56, GeneralizedCohomology lines 1491 and 1658, and the absence of DGFloerPartII.

**Seeded sample.**
- T2.0 agrees with hatcher-vbkt line 1508 (compact Hausdorff bases), lines 1540–1546 (formal differences; cancellation needs compactness) and line 1557 (K≈K̃⊕ℤ by a basepoint). Its paracompact homotopy invariance agrees with Theorem 1.6 (lines 788–790).
- T7.0's AlgebraicTopology inputs resolve (above). Sibson is uncertified.
- Neither has a locator (R12).

**Ownership against open pull requests.**
- I checked #1807 (2ce4de6), #1854 (0905eb1) and #1799 (f27b94b).
- `overlaps.md` lists no dropped or revision-only ids, and its vocabulary neighbours CharacteristicClasses and GeneralizedCohomology are the roadmaps checked in R03 and R02.

**Remark (no change requested).** Lines 53–54 credit AT Stage 5.5 with the bundle-to-Serre comparison. That comparison is the pinned `TauCeti.TopCat.mem_serreFibrations_proj` (`FiberBundle.lean:395`), which AT Stage 5 item 5 consumes, so the citation resolves.

**Adversarial table.** Rows marked "(r42)" are carried from the previous report, whose statements are untouched. The other rows were computed this round.

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| Headline T4: `a⊠1+b⊠β` | X=pt; X=S² | K(S²)=ℤ[H]/(H−1)² with basis 1,β, so (a,b)↦a+bβ is ℤ²≅K(S²); S²×S² has 4 even cells and K is ℤ⁴=ℤ²⊗ℤ² | holds |
| Headline T5.3 Thom | X=pt, E=ℂⁿ | K_c(ℂⁿ)=K̃(S²ⁿ)=ℤ=K(pt) | holds |
| Headline T6.7 `R(G)≃K_(G,c)(V)` | G=1, V=ℂⁿ; G=U(1) of weight 1 on ℂ | ℤ≅ℤ; R(U(1))=ℤ[t,t⁻¹], free of rank 1 over itself | holds |
| Headline T7.1 coefficient ring | degrees −1…−8 | η, η², η³=0, a, ηa=0, η²a=0, 0, b give ℤ/2, ℤ/2, 0, ℤ, 0, 0, 0, ℤ, which is KO⁻ⁿ(pt) | holds |
| Headline `[X,BU×ℤ]≅K(X)` | X=pt, S¹, S² | ℤ; ℤ (BU simply connected, K̃(S¹)=0); ℤ×π₂BU=ℤ² | holds |
| R06 homotopy invariance | X=∅; arbitrary Y | both pullbacks are zero objects; Theorem 1.6 puts no hypothesis on the bundle's base | holds |
| R06 compact classification | rank 0; X=∅ | Gr(0,N) is a point and γ has rank 0, so the pullback is the zero bundle ≅A; N=0 works for ∅ | holds |
| R06 `K(S^(2n+2))` | n=0 | S² is connected, so constant-rank cores give all of K; K(S²)=ℤ² | holds |
| T2.0 pair relation with a non-trivial G | transitivity | from E⊕F′⊕G≃E′⊕F⊕G and E′⊕F″⊕G′≃E″⊕F′⊕G′, adding gives E⊕F″⊕(F′⊕G⊕G′)≃E″⊕F⊕(F′⊕G⊕G′), with no cancellation needed | holds |
| T7.0 basepoint track | k=1, N=3 | frame (e₁,e₂); i=0: e₁→e₃→e₀; i=1: e₂→e₄→e₁; the end frame is (e₀,e₁), and each moving vector stays orthogonal to the rest | holds |
| R04 probe | one tactic each | 17 → 11 `sorry` warnings, no error | duplicates |
| R02 replacement | DGFloerPartII on main? | absent from main; 4.2a needs GC G4.0b, which consumes TopK T1.5 | upward and circular |
| Conventions: L with transition z is O(−1) (r42) | `[z:1]` | s₀=z·s∞ | holds |
| Folded symbol z̄ gives −β (r42) | (H−1)²=0 | H*=2−H, so [H*]−1=−β | holds |
| Wedge vs Koszul `(−1)^r det E·u_dual` (r42) | r=1 | 1−E = (−1)·E·(1−E*) | holds |
| T2.0 `rc=2`, `cr=1+conj` (r42) | ℝ; L | r(ℂ)=ℝ²; c(r(L))=L⊕L̄ | holds |
| T2.0 empty base is the zero ring (r42) | X=∅ | 1=0 | holds |
| T2.0 K⁰(ℝ)=ℤ, K_c⁰(ℝ)=0 (r42) | ℝ, S¹ | contractible; every bundle on S¹ is trivial | holds |
| T2.0 arbitrary products (r42) | X=ℕ | (0,1,2,…) is realised | holds |
| T2.5 λ-series (r42) | a line L | ψᵏβ = (1+β)ᵏ−1 = kβ | holds |
| `adamsValueOfLambdaSeries` index (r42) | tⁿ | gives ψ^(n+1) | holds |
| T5.2 relation (r42) | r=0, 1, 2; E=M⊕1 | 1=0; t−E; (t−1)²; (t−1)(t−M) | holds |
| T4.3 companion pencil (r42) | d=1, 2 | p₀+p₁z; p₀+p₁z+p₂z² | holds |
| T4.5 H_t (r42) | \|z\|=1 | H_t=(1+tz)(A·m_t(z)+B) | holds |
| T4.6 β-coefficient (r42) | p=z, z⁻¹ | E(1+β); E(1−β) | holds |
| T3.5 block matrix (r42) | entry (1,2) of M*M | 0 | holds |
| T1.5a boundary degree (r42) | m=1, 2 | 2; 0 | holds |
| T1.5a π₁SO(n) (r42) | n=0..3 | 0, 0, ℤ, ℤ/2 | holds |
| T1.6b connectivity, dim D (r42) | ℝ, ℂ | k−1, 2k; r+(r−j)k | holds |
| T1.6c Whitney sign ε_k (r42) | k=1..7 | +,−,−,+,+,−,− | holds |
| T1.6c μ(sV,sW) vs s²μ (r42) | frames | (−1)ᵏ | holds |
| T1.6d virtual dimension (r42) | (k,2n)→(k+1,2n+2) | k−n preserved | holds |
| T7.0 shear (r42) | π_* | (a,b)↦(a,a+b), inverse (a,b−a) | holds |
| T7.0 complement class (r42) | Gr(k,ℝᴺ) | [γ^⊥]−N | holds |
| T7.0 k=0 track (r42) | k=0 | a backtracking loop | holds |
| T7.1 c and r on generators (r42) | conj(u)=−u | c(a)=2u², c(b)=u⁴, c(a²)=4u⁴=c(4b) | holds |
| T7.3 relative failures (r42) | (D²,S¹), (D³,S²) | ℤ→K(D²) is zero; K(D³) misses β | holds |
| T6.6 U(r)/H_r≅CP^(r−1) (r42) | dimensions | 2r−2 | holds |
| T1.6a rank-0 orientations (r42) | `Fin 0` | two orientations, fixed by every isomorphism | holds |
| `partitionGap` identity (r42) | (0.7,0.3), (0.5,0.5) | 1, 1 | holds |
| `exists_continuous_inside_projection` (r42) | \|λ\|<1, >1; k=0 | P=1, P=0, v=0 | holds |
| `isUnit_segment_of_uniform_inverse_bound` (r42) | t=0, 1 | norm < 1 | holds |
| Monoid exercise (r42) | general | st=1 ⇒ ts=1 | holds |

## Not verifiable

- `sibson-1969` (T7.0, pp. 19–21) is paywalled and settled as uncertified. I checked T7.0's shear and basepoint algebra myself (table).
- `atiyah-bott-1964`, `abs-1964`, `atiyah-1968-bott-index` and `husemoller-fibre-bundles` are settled as uncertified. The KO ring and Clifford sign conventions of T7.1 were checked only for internal consistency (table).

## Source issues

- none
