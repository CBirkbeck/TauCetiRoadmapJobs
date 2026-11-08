# Review of AlgebraicTopology (pull request #1808 at d487de8)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since beeacfb. The two commits since then (60a92ec3, d487de89) change `TauCetiRoadmap/AlgebraicCurves/README.md` (20 lines), `TauCetiRoadmap/CharacteristicClasses/README.md` (219 lines) and `TauCetiRoadmap/CharacteristicClasses/Suggested.lean` (86 lines) only; `TauCetiRoadmap/AlgebraicTopology/` is byte-identical to the head the previous review read (`git diff beeacfb..HEAD -- TauCetiRoadmap/AlgebraicTopology` is empty) and, as before, to main's copy of the folder (unchanged since 0439c6d3). This folder never cites AlgebraicCurves and names CharacteristicClasses only as a consumer (README lines 136, 1204, 1856, 2372: C1.5, C3, C2.0); those sections still exist at this head (C1.5a at CharacteristicClasses line 773, C2.0 at 813, C3 at 1175), CharacteristicClasses still consumes this roadmap in the same direction (its lines 54, 565, 649, 1193), and its `Suggested.lean` is a `module` file in `namespace TauCetiRoadmap.CharacteristicClasses` (line 95) importing nothing of this folder, so no fully qualified name collides. The diff of CharacteristicClasses since beeacfb adds or removes no mention of AlgebraicTopology. So the two commits introduce no finding here, and every finding of the previous review stands at this head, re-witnessed below with its previous number. A repair of all seventeen (a commit that rewrites this folder, 6bff4489 on the review worktree) is not an ancestor of this head: the next repair round can re-apply it. Findings marked *predates the pull request* are visible on main's copy of the folder too; they are reported because the gate fails on them.

## R01 (P2) — Supplier drift: ClassifyingSpaces Stage 3 items 11–15 and Stage 4 items 16–18 do not exist at this head (previous R01)

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 93–101 ("ClassifyingSpaces owns Milnor and presentation models, their pointed CW-type uniqueness and the cellular/bar projective-resolution comparisons … consumes only the ClassifyingSpaces Stage3/4 model, uniqueness and resolution interfaces"), lines 2045–2046 ("using its Stage 3 items11–15 and Stage 4 items16–18"), 2048–2050 and 2061–2063.

**Claim.** Stage 8.8b's normalized comparison consumes ClassifyingSpaces' Stage 3 items 11–15 and Stage 4 items 16–18.

**Witness.** `TauCetiRoadmap/ClassifyingSpaces/README.md` at this head (unchanged since 6fc75e4c; `git diff --stat 6fc75e4c..HEAD -- TauCetiRoadmap/ClassifyingSpaces` is empty) has no Stage 3 or Stage 4: its sections are Layer 1 items 1.1–1.3 (lines 437, 510, 549) and Layer 2 items 2.1–2.3 (618, 666, 698), and its scope (lines 59–70) leaves the models, their comparison and the resolutions to the pinned Tau Ceti (`TauCeti.classifyingSpace`, `ClassifyingSpace/Basic.lean` line 73; `TauCeti.cellularClassifyingSpace`, `ClassifyingSpace/Cellular.lean` line 113; `TauCeti.universalGSpaceResolution`, `ClassifyingSpace/Resolution.lean` line 218; `TauCeti.cellularResolutionOfIsAspherical`, `EilenbergMacLane/Resolution.lean` line 57). None of the eight cited items exists at the head of this pull request, which carries both folders.

**Repair.** In lines 93–101 and 2045–2063 cite what exists at this head: the pointed map from the nerve model into a pinned model is ClassifyingSpaces item 1.1, its uniqueness up to pointed homotopy item 1.2, the pointed homotopy equivalence item 1.3 (ClassifyingSpaces' consumer paragraph, lines 775–782, names exactly these for Stage 8 item 8b); the models, the identifications of their fundamental groups and the resolution comparisons are cited as pinned declarations under *From Tau Ceti*, not as ClassifyingSpaces targets. Replace "Stage3/4 model, uniqueness and resolution interfaces" by "Layer 1 items 1.1–1.3" and drop the claim that ClassifyingSpaces owns the models and resolution comparisons.

## R02 (P2) — Two owners of the classification of pointed maps into a K(π,1) (previous R02)

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2064–2067: "the generic CW/cover proof is supplied only here. For each connected pointed CW complex X prove `[X,Bπ]_*≃Hom(π₁X,π)` and that forgetting basepoints gives the conjugation-orbit description of `[X,Bπ]`."

**Claim.** Stage 8.8 owns the classification `[X,Bπ]_* ≃ Hom(π₁X, π)`.

**Witness.** `TauCetiRoadmap/ClassifyingSpaces/README.md` at this head, lines 79–82: the classification of pointed maps from a connected pointed CW complex into a `K(π, 1)` by homomorphisms `π₁ → π`, up to pointed homotopy, is the case of its items 1.1 and 1.2 with target a `K(π, 1)` and is owned there, "not in the algebraic-topology roadmap"; repeated at lines 782–784. Items 1.1 and 1.2 (lines 437–548) state existence and pointed uniqueness for any path-connected Hausdorff CW complex and any aspherical target. ClassifyingSpaces consumes nothing from this folder (line 83).

**Repair.** In 8.8 (lines 2064–2067) replace "prove" by a citation: the pointed classification and the conjugation-orbit description are ClassifyingSpaces items 1.1–1.2 with target Bπ and are consumed, Stage 8.8 adding only the identification of its own nerve model's π₁ with π; record the deferral under Scope and ownership. If the classification is to stay here, ClassifyingSpaces' lines 79–82 and 782–784 must say so instead, in this same pull request; one owner either way.

## R03 (P2) — Two owners of the ordinary Serre and Eilenberg–MacLane machinery: this folder and DGFloer on main (previous R03)

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 102–117 (Stages 4.8, 5.0, 5.5, 8.8c, 8.8d owned here; line 115 "DGFloer Layer 1 item 1's degree-one Hurewicz"), items at lines 874–902, 918–954, 1014–1140, 2086–2173.

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main (3b3f7ef6; the folder's last commit is still eaf17b10) owns the same objects: Layer 1 item 2 "Weak equivalences and CW approximation" (line 470), item 3 "The spectral sequence of a filtered complex" (621), item 4 "Serre classes and Hurewicz modulo a class" (659), and its line 232 states the opposite direction: "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets"; DGFloer also consumes Stage 4.4 (lines 188, 1584), so the two cite each other. The pull request does not touch DGFloer.

**Repair.** Unchanged: own the degree-one Hurewicz isomorphism in Stage 8.3 (Hatcher Theorem 2A.1, hatcher line 7230) and delete the three citations of DGFloer Layer 1 item 1 (lines 115, 1904–1905, table row 2417); complete the move on the supplier side by having DGFloer cite Stages 4.8, 5.0, 5.5, 8.3, 8.8c and 8.8d instead of building its Layer 1 items 1–4, in this pull request (naming DGFloer among its folders) or in DGFloer's own revision with the order stated.

## R04 (P1) — Dependency cycle reported by the gate (previous R04)

**Location.** Depcheck at this head: `CYCLE among: AlgebraicKTheory, AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism`; README citations of HomotopySpheres §3A.1/§3A at lines 122, 124, 580, 782, 2253, 2292, 2355 and table rows 2399, 2417, 2418. *Predates the pull request.*

**Witness.** HomotopySpheres at its open head (a4f5c1e2, re-read today) consumes this roadmap: line 869 "*Needs:* AlgebraicTopology Stage 4 item 8 (compact generation and the pointed adjunction), Stage 4 item 5 …", lines 861, 871, 884, 893, 918 (Stage 4 item 8's reduced suspension, loop space, smash product, k-counit comparisons; Stage 4 item 4's sphere suspension homeomorphism), and its supplier block at line 696 "AlgebraicTopology Stages 2–4, 6 and 8". The depcheck command of the brief, run today at this head, prints the cycle line verbatim (output under Verified sound).

**Repair.** Unchanged: the consumed notions move down. Let Stage 4.5 own the compact-generation interface it uses (the coreflection `k` on native `UCompactlyGeneratedSpace` and `TopologicalSpace.compactlyGenerated`, Mathlib `Topology/Compactness/CompactlyGeneratedSpace.lean` lines 68 and 91, its counit, the CW comparison, `k(X×Y)` as the product and the interval-product comparison), delete the §3A.1 citations at lines 580–582, 782, 2253, 2292, 2355 and the three table rows (the consumer mentions at 635 and 1857 may stay), and state the pointed suspension–loop adjunction used by 8.11b (lines 2316–2317, 2355) on the native fixed-interval loop carrier inside 8.11b, or move that comparison to AlgebraicTopologyPartII. HomotopySpheres then remains a consumer only.

## R05 (P2) — Upward supplier: an on-main roadmap citing an open pull request (previous R05)

**Location.** Depcheck at this head: `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#71) at README lines [2399, 2417, 2418]`; README lines 122 and 124 cite HomotopySpheres through a GitHub pull-request link (`…/pull/284`). *Predates the pull request.*

**Witness.** HomotopySpheres is an open pull request (merge-order line 72); AlgebraicTopology is on main, so every supplier citation of it is upward. Cross-roadmap citations are by roadmap name and section, never by pull-request number or link.

**Repair.** The repair of R04 removes the edges; replace the two `pull/284` links at lines 122 and 124 by the roadmap name and section.

## R06 (P2) — `set_option` in `Suggested.lean` (previous R06)

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 910: `set_option maxHeartbeats 800000 in` before `compactSupportTopClass_existsUnique`. *Predates the pull request.*

**Witness.** Gate at this head `set_option=1`; the principles make any `set_option` blocking.

**Repair.** Split the existence and the uniqueness statements and name the local section's carrier once with an `abbrev`, so that each part elaborates under the defaults.

## R07 (P2) — Sorry'd data in `Suggested.lean` (previous R07)

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: 69 `def`/`abbrev`/`instance` declarations whose body is `sorry`, starting at line 160 `cellularToSingular`, 180 `finiteCoverTransfer`, 230 `regularDeckSingularComplex`, 293 `cartanLeraySpectralSequence`, 486 `chartAt`, 576 `orientationLocalSystem`, 955 `poincareDualityMap`, 1055 `relativeHomotopyGroup`, and on through the relative-homotopy, CW-type, cubical-sphere and Eilenberg–MacLane blocks. *Predates the pull request.*

**Witness.** Gate `sorry-data=69`; every theorem whose statement mentions one of these (`relativeHurewicz_iso`, the `poincareDuality_*` and `cartanLeray_*` theorems) is a statement about an unspecified object.

**Repair.** Delete every sorry'd `def`/`abbrev`/`instance` and every declaration that mentions one (the README carries each as a target with its intended signature). Keep the definitions with real bodies (`ordinaryDoldKanSimplicialModel`, `ordinaryDoldKanLabeledSimplex`, `OrdinaryEMModel`, `NormalizedAbelianEMFamily`, `SimplyConnectedAtInfinity`, `LSCategoricalCover`, the Brouwer statements) and the headlines statable on native carriers (Hurewicz and Whitehead are native at the pin; Poincaré duality through `TopCat.singularCap`, `Cohomology/Cap/Basic.lean` line 101, with `TauCeti.HomologicalOrientation.fundamentalClass`; ordinary representability on `OrdinaryEMModel`); name in the module docstring the headlines that are not statable (Serre spectral sequence with its monodromy system, Cartan–Leray, Hurewicz modulo a Serre class, the relative obstruction class with local coefficients).

## R08 (P3) — Build warnings the gate counts (previous R08)

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 1 (`import Mathlib` without the module header) and line 486 (`chartAt` declares `[IsManifold I ∞ M]` twice). *Predates the pull request.*

**Witness.** Gate `build=1` (the overlapping-instance warning at 486:18); my run of `lake env lean` on the file at this head: exit 0, 215 `declaration uses sorry`, that warning, the five `#check` outputs, nothing else.

**Repair.** Header `module`, `public import Mathlib` and the `TauCeti.*` imports as `public import`, then `@[expose] public section`; delete the second `[IsManifold I ∞ M]` binder of `chartAt`.

## R09 (P3) — `Suggested.lean` disagrees with the README after the ownership move (previous R09)

**Location.** `Suggested.lean` line 1259 ("The abelian model is supplied by DGFloer"), lines 1330–1332 ("The definitive DGFloer constructor pins its spaces …"), `section SimplyConnectedObstructions` at lines 1787–1881 with `[Nontrivial (Fin n)]` at 1792.

**Witness.** README 8.8c (lines 2086–2135) owns `ordinaryEilenbergMacLaneFamily`; README 8.9 (lines 2178–2188) states the obstruction cochain for n ≥ 1 and a path-connected Y with trivial π₁-action on π_nY; the Lean block is stated only for simply connected Y and n ≥ 2; the module docstring (lines 26–31) names no headline as not statable.

**Repair.** Rewrite the two docstrings to say the family is this roadmap's 8.8c target; either state 8.9 at the README's generality (not statable at the pin without a native π₁-action on π_n, in which case the docstring says so) or narrow README 8.9's Lean names to the simply connected case explicitly; list in the module docstring every headline not statable at the pins.

## R10 (P3) — TeX-only syntax outside a code span (previous R10)

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 1392: `C_c^{cell,n}(X,A;ℤ)`. *Predates the pull request.*

**Witness.** Gate `tex=1` at this head.

**Repair.** Write it as a code span, `` `C_c^cell,n(X,A;ℤ)` ``, or in words ("the compactly supported cellular n-cochains of (X,A)").

## R11 (P3) — Backticked own names that `Suggested.lean` does not declare (previous R11)

**Location.** README line 391 (`coordinateCubeReferenceChain_eq_shuffle`), line 976 (`isQuotientCoveringMap_iff_isCoveringMap_and`, native in Mathlib at the pin, `Mathlib/Topology/Covering/Quotient.lean` line 339, not a declaration of this roadmap), both flagged by the gate; and the 37 further own names the earlier reviews listed (for example `basedHomotopyInverseOfEquivalence` at 755, `basedLoopCWType` at 2252 and 2290, `cwProductKelley` at 766 and 1867, `groupCohomologyCup` at 2083, `ordinaryEMLoopComparison` at 2295, `ordinaryCohomologySuspension` at 2304 and 2326), none declared in the folder's `.lean` files or at the pins.

**Witness.** Gate `readme-ids-missing=2`; a backticked own name is a claim that `Suggested.lean` declares it.

**Repair.** State each fact in prose without the name, or, for the few that are headlines, declare them; cite the native one as Mathlib's `isQuotientCoveringMap_iff_isCoveringMap_and` under *From Mathlib*.

## R12 (P3) — Edits outside the pull request's named folders (previous R12)

**Location.** `git diff --stat origin/main...HEAD` excluding the fifteen named folders: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line); gate `outside-folder=2`.

**Witness.** Neither folder is among the pull request's own as the brief lists them; the two hunks are still in the diff at this head (run today against origin/main 3b3f7ef6).

**Repair.** Drop the two hunks from this pull request, or have the pull request name those folders as its own.

## R13 (P3) — Cited works missing from the References and the manifest (previous R13)

**Location.** README line 877 ("tom Dieck 9.5.1"), 2165 ("Serre 1953, Theorem 1"), 1935 ("FQ7.7"), 684 ("Milnor Lemmas 3.6–3.7"), 688 ("Strøm's product theorem"); `## References` lines 2488–2509.

**Witness.** None of tom Dieck, Serre 1953, Freedman–Quinn, Strøm or Milnor's *Morse Theory* is in the References (the cached milnor1959 paper has Lemmas 1–4 and Theorems 1–3 only); the manifest records tom Dieck, Serre, Freedman–Quinn, Milnor 1963 and Weibel only as uncertified keys, and Strøm's product theorem has no locator.

**Repair.** Add the five works to `## References` with the locators used, expand "FQ" at first use, name *Morse Theory* at line 684, and give Strøm's theorem its locator under the `strom1972` key.

## R14 (P3) — A compact-generation target without its hypotheses (previous R14)

**Location.** README lines 796–798: "k(X×Y)=X×Y when either factor is locally compact".

**Witness.** X an uncountable set with the cocountable topology, Y a point: every compact subset of X is finite, so kX is discrete while X is not; Y is compact, yet k(X×Y) = kX ≠ X = X×Y.

**Repair.** Quantify: for compactly generated X and Y, `k(X×Y)` is their product in the compactly generated category; `k(X×Y)=X×Y` when X is compactly generated and Y is locally compact Hausdorff (and symmetrically). The CW case at line 781 (Hatcher Theorem A.6, hatcher line 22693) already carries the right hypotheses.

## R15 (P3) — The route to the K(A,1) axiom does not reach the fixed-d Serre class (previous R15)

**Location.** README lines 2142–2148: transfer on 8.8a's finite covering plus 8.8c's directed-union property, for "the groups annihilated by some power of d".

**Witness.** A = ⊕_ℕ ℤ/d: its finite subgroups (ℤ/d)^i have order d^i, so transfer annihilates `H̃_*(K((ℤ/d)^i,1))` only by d^i, and the colimit inherits no uniform exponent. The statement is true by Prüfer's decomposition of a bounded abelian group and Künneth on finite sums; for the torsion class the written route suffices.

**Repair.** State the fixed-d route through Prüfer and Künneth (or the exponent of the bar complex), keeping transfer plus directed union for the torsion class only.

## R16 (P3) — Stage 4.6 rebuilds a projectivization topology that is native at the pin (previous R16)

**Location.** README lines 279–287 (the "absent" `Projectivization` topology API, cited through a mathlib4 pull-request link) and 820–823 ("Own #44117's generic quotient topology on native `Projectivization 𝕜 V`"). *Predates the pull request*, made stale by the pin bump.

**Witness.** Mathlib at the pin (1b1ccf4b, unchanged at this head) has `Mathlib/Topology/Algebra/Projectivization.lean` with `instTopologicalSpace` (line 44), `isQuotientMap_mk'` (47), `continuous_mk'` (51), `continuous_iff` (56), `continuous_mk` (61), `continuous_map` (71), `isOpenMap_mk'` (79), `isOpenQuotientMap_mk'` (83); Tau Ceti at the pin adds `instSecondCountableTopology`, `instT2Space`, `instCompactSpace`, `instPathConnectedSpace` and the affine charts in `TauCeti/Topology/Algebra/Projectivization.lean` lines 90–311.

**Repair.** Cite these natives in the Inventory and in 4.6; keep in 4.6 only the real projective manifold structure, the CW structure and the sign system; drop the pull-request link.

## R17 (P3) — Companion Lean files import another roadmap's module and carry `set_option` (previous R17)

**Location.** `OrientationComparison.lean` lines 1–3 and 14–15, `GeneralModelOrientation.lean` 1–3, `CompactOrientationLaws.lean` 1–3 and 14–15, `BoundaryInteriorComparison.lean` 1–2 and 15–16, `ChartSimplexLocalImage.lean` 1, `BoundaryCarrierOrientation.lean` 1–2; `TopologicalGroupFundamentalGroup.lean` lines 1–4. *Predates the pull request.*

**Witness.** The six orientation files import `TauCetiRoadmap.AlgebraicTopology.Suggested`, two of them `TauCetiRoadmap.DifferentialGeometry.Suggested`, three set `maxHeartbeats`/`synthInstance.maxHeartbeats`, and they carry 42 `sorry`s between them (counted today: 16, 10, 8, 2, 0, 6); `TopologicalGroupFundamentalGroup.lean` imports four `Mathlib.*` submodules instead of the single `import Mathlib`. The deletions of R07 break their build. All seven files are byte-identical to the previous head.

**Repair.** Fold the statements they carry into the README (Stage 6.3 already describes each) and delete the six orientation files; keep `TopologicalGroupFundamentalGroup.lean` only with a single `import Mathlib` header.

## Previous findings

- R01 — not repaired (now R01): README lines 93–101 and 2045–2063 still cite ClassifyingSpaces Stage 3 items 11–15 and Stage 4 items 16–18; ClassifyingSpaces at this head is unchanged since 6fc75e4c and has only items 1.1–1.3 and 2.1–2.3.
- R02 — not repaired (now R02): README lines 2064–2067 still "prove `[X,Bπ]_*≃Hom(π₁X,π)`"; ClassifyingSpaces lines 79–82 and 782–784 still claim it.
- R03 — not repaired (now R03): README lines 102–117 still own Stages 4.8/5.0/5.5/8.8c/8.8d while DGFloer on main (eaf17b10) Layer 1 items 2–4 own the same objects and its line 232 states the opposite direction.
- R04 — not repaired (now R04): depcheck at this head prints the CYCLE line; HomotopySpheres citations at lines 580, 782, 2253, 2292, 2355, 2399, 2417, 2418 unchanged; HomotopySpheres at its new head a4f5c1e2 still consumes Stage 4 items 4, 5 and 8 (lines 861, 869, 871, 884, 893, 918).
- R05 — not repaired (now R05): `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#71)`; `pull/284` links at lines 122 and 124.
- R06 — not repaired (now R06): `set_option maxHeartbeats 800000 in` at `Suggested.lean` line 910.
- R07 — not repaired (now R07): gate `sorry-data=69`, first at line 160 `cellularToSingular`.
- R08 — not repaired (now R08): `import Mathlib` without `module` at line 1; duplicate `[IsManifold I ∞ M]` at line 486, warning reproduced by my elaboration today.
- R09 — not repaired (now R09): docstrings at lines 1259 and 1330–1332 still name DGFloer as supplier; `[Nontrivial (Fin n)]` at 1792.
- R10 — not repaired (now R10): `C_c^{cell,n}(X,A;ℤ)` at README line 1392.
- R11 — not repaired (now R11): `coordinateCubeReferenceChain_eq_shuffle` at line 391, `isQuotientCoveringMap_iff_isCoveringMap_and` at line 976, flagged by the gate.
- R12 — not repaired (now R12): the two one-line hunks in `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still in the diff against main.
- R13 — not repaired (now R13): "tom Dieck 9.5.1" (877), "Serre 1953, Theorem 1" (2165), "FQ7.7" (1935), "Milnor Lemmas 3.6–3.7" (684), "Strøm's product theorem" (688) still unlisted in References.
- R14 — not repaired (now R14): lines 796–798 unchanged.
- R15 — not repaired (now R15): lines 2142–2148 unchanged.
- R16 — not repaired (now R16): lines 279–287 and 820–823 unchanged.
- R17 — not repaired (now R17): the six orientation files still import the roadmap modules and set heartbeats; `TopologicalGroupFundamentalGroup.lean` still imports `Mathlib.*` submodules.

## Verified sound

**Scope of this pass.** `git diff beeacfb..HEAD -- TauCetiRoadmap/AlgebraicTopology` is empty (README.md 2509 lines, Suggested.lean 2887 lines, the seven companion files, all unchanged); `git diff beeacfb..HEAD --stat` lists only `TauCetiRoadmap/AlgebraicCurves/README.md`, `TauCetiRoadmap/CharacteristicClasses/README.md` and `TauCetiRoadmap/CharacteristicClasses/Suggested.lean`. This folder has no citation of AlgebraicCurves (grep of the README: none). What it says about CharacteristicClasses was re-resolved at this head: README line 136 (C1.5 consumes Stages 4, 6 and 8.8b), 1204 (C3 consumes the cochain Milnor sequence), 1856 (C2.0's bundle-cell relative CW models), 2372 (CharacteristicClasses consumes 8.8b and 8.10); CharacteristicClasses at d487de89 has C1.5/C1.5a (lines 717–807, C1.5a at 773), C2.0 (813) and C3 (1175) and consumes AlgebraicTopology Stages 2–6, 8.1–8.7 (line 54), 6.1 (565), 6 (649), 6.0 (1193): the two folders agree on direction and sections. CharacteristicClasses' `Suggested.lean` at this head is `module` (line 1) with `public import` of Mathlib and two `TauCeti.*` modules (lines 3–5), in `namespace TauCetiRoadmap.CharacteristicClasses` (line 95), with no import of this folder, so no fully qualified name collides with `TauCetiRoadmap.AlgebraicTopology`. The CharacteristicClasses diff since beeacfb neither adds nor removes a mention of AlgebraicTopology, and its new headlines (Euler obstruction, RP^(2^k)) are its own objects, not Stages 4–8 of this folder. ClassifyingSpaces is unchanged since 6fc75e4c, so R01 and R02 are re-witnessed at the same lines. The diff against origin/main (3b3f7ef6) outside the fifteen named folders is the same two one-line hunks as before (R12).

**Gate, depcheck and build at d487de8.** The worker's gate: FAIL on set_option=1, tex=1, sorry-data=69, statement-hygiene=22 (all P3: `letI` in signatures at 208, 509–546, 1274; `eqToHom` in conclusions at 1386–1548 and 2181–2226; chosen data at 2296 and 2307, all inside the sorry'd-data blocks that R07 deletes), readme-ids-missing=2, depcheck=2, outside-folder=2, build=1, the same counts as at beeacfb. Depcheck output at this head, run today, verbatim:

```
UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#71) at README lines [2399, 2417, 2418]
CYCLE among: AlgebraicKTheory, AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism
depcheck: 244 roadmaps, 2463 edges, 2 problem(s)
```

`lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` from the worktree at this head, run today: exit 0; 215 `declaration uses sorry` warnings; the overlapping-instance warning at 486:18; the five `#check` outputs (`HomotopyGroup.prodEquiv`, `HomotopyGroup.prodMulEquiv`, `TauCeti.HasHomotopyExtensionProperty.exists_strong_deformation_retraction`, `TauCeti.MappingCylinder.homotopyEquiv`, `TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl`); no error. The worker's signature extraction (362 declarations, 10 with a binder that looks dropped) is of the same unchanged file and was compared with the README in the earlier full reviews.

**Padding probe.** The file is byte-identical to the one probed in the earlier full review, where a scratch copy with each of the 143 `theorem … := by sorry` proofs replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | sorry` left all 215 sorry warnings in place; the result carries over: no theorem closes by one tactic. No padding finding.

**Seeded sample.** No passage of this folder changed, so no sampled target falls in a changed passage; the previous sample of 15 locators stands as recorded in the earlier reviews (six re-opened there at the cache lines hatcher 15116, 15454, 15928, 22693, ftw1973 600, 752). The two locators the findings use, Hatcher Theorem 2A.1 (hatcher line 7230, R03) and Theorem A.6 (hatcher line 22693, R14), were re-opened in the previous review and are unchanged.

**Adversarial table.** Every statement of this folder is untouched; each row is carried forward from the review at 0439c6d (values recomputed there, cited as r31) or from the previous reviews (r45, r51). One row is added for the two supplier/consumer folders the new commits touch.

| statement | instances | values each side | result | source |
| --- | --- | --- | --- | --- |
| This folder's citations of the folders changed at d487de89 resolve | CharacteristicClasses at beeacfb0; at d487de89; AlgebraicCurves | C1.5/C2.0/C3 present before; C1.5a at 773, C2.0 at 813, C3 at 1175 after; CharacteristicClasses cites AT Stages 2–6, 8.1–8.7, 6, 6.0, 6.1, all present here; AlgebraicCurves cited 0 times | consumer edges intact, no new owner | this review |
| This folder's CharacteristicClasses citations (C1.5, C2.0, C3) resolve at beeacfb0 | CharacteristicClasses at 6fc75e4; at beeacfb0 | C1.5 at 701, C2.0 at 797, C3 at 1127 | consumer edges intact | r51 |
| 8.8b cites ClassifyingSpaces Stage 3 items 11–15, Stage 4 items 16–18 | ClassifyingSpaces README at 925dc8b; at 6fc75e4c = d487de89 | 8 of 8 cited items present (lines 180–244); 0 of 8 present (sections are 1.1–1.3, 2.1–2.3) | citation broken | R01 (r45) |
| 8.8 owns `[X,Bπ]_*≃Hom(π₁X,π)` | ClassifyingSpaces item 11 at 925dc8b; items 1.1–1.2 at this head | source X restricted to a cellular K(G,1); source X any path-connected Hausdorff CW complex, "owned here, not in AT" | two owners | R02 (r45) |
| 5.0 homological reindexing: E_r^(p,q) = native page r+1 at (a,b)=(1−2p−q,p−1) | (p,q)=(0,0); (2,1) | (1,−1): n=0, i₁=−1,i₂=0 ⇒ H_0(F_0/F_(−1)); (−4,1): n=−3, i₁=1,i₂=2 ⇒ H_3(F_2/F_1) (TauCeti `Filtered/SpectralObject.lean` 410–420) | agrees with E¹_(p,q)=H_(p+q)(F_p/F_(p−1)) | r31 |
| 5.0 cohomological reindexing (a,b)=(2p+q+1,−p−1) | (p,q)=(1,2) | (5,−2): n=3, i₁=−2,i₂=−1 ⇒ F^1/F^2 | agrees | r31 |
| 5.0 degreewise lower bound, no uniform bound | C_n=ℤ, F_pC_n=C_n iff p≥−n | F_(−n−1)C_n=0 each n; inf s(n)=−∞ | README's remark right | r31 |
| 5.0 first-quadrant regularity | d_r on E_r^(p,q) | target (p+r,q−r+1) vanishes for r>q+1 | regular, degreewise bounded | r31 |
| 5.5 multiplicative sign (−1)^(q p′) | F=pt; B=pt | +1, +1 | reduces to base/fibre cup | r31 |
| 5.5 fibre weak contractibility needs nonempty fibres | p: ∅→pt | π₀ not surjective | nonemptiness clause present | r31 |
| 4.5 k(X×Y)=X×Y, one factor locally compact | X cocountable uncountable, Y=pt | kX discrete ≠ X | R14 | r31 |
| 4.6 RP^n cellular differential 1+(−1)^k | k=1,2 | 0, 2 | agrees | r31 |
| 4.6/6.1 RP² sign system | twisted d₁=±2,d₂=0; δ⁰=±2,δ¹=0 | H⁰=0,H¹=ℤ/2,H²=ℤ | agrees with 6.1 and 6.3 | r31 |
| 4.4 factor interchange on S^m∧S^n | m=n=1 | −1 | swap on S² has degree −1 | r31 |
| 2.5 S⁰ reference class s₀=[q]−[−q] | local images; augmentation | +1 at q, −1 at −q; sum 0 | uniqueness needs both data | r31 |
| 6.3 boundary conversion (−1)^m | m=1; m=2 | both −[r↑]; (−1)·(−1)=+1 | agrees; ∂[D¹]=[+1]−[−1] | r31 |
| 6.2 cap boundary identity | k=0 | ∂(c⌢φ)=∂c⌢φ−c⌢δφ, sign +1 | Hatcher's convention | r31 |
| 6.5 linking symmetry (−1)^((i+1)(n−i)) | (n,i)=(3,1),(5,2),(7,3) | +1,−1,+1 | agrees | r31 |
| 7 Euler values | S⁰,S¹,T⁰,CP⁰ | 2,0,1,1 | χ(Tⁿ)=0 restricted to n>0 | r31 |
| 8.1 relative CW connectivity | λ=2,(D²,S¹) | π₁(D²,S¹)=0; π₀ bijective; π₁ onto | agrees | r31 |
| 8.8c directed union vs topological colimit | S¹→S¹, z↦z² | z~w iff z/w∈μ_(2^∞), dense ⇒ indiscrete | negative example correct | r31 |
| 8.8c π_n of Γ(A[n]) | A=ℤ,n=2 | H_2=ℤ, other positive degrees 0 | K(A,n) | r31 |
| 8.8d fixed d^m not a Serre class | 0→ℤ/2→ℤ/4→ℤ/2→0 | 2·(ℤ/4)≠0 | not closed under extensions | r31 |
| 8.8d "some power of d" closed under extensions | d^aA=0,d^b(G/A)=0 | d^(a+b)G=0 | closed; K(A,1) route R15 | r31 |
| 8.8d Hurewicz mod C degrees | n=2,C=0 | π₂≅H₂, π₃→H₃ onto | agrees | r31 |
| 8.11b suspension/cone signs | n=0 | σ_right=δ; (−1)^1=−1 | agrees with (−1)^(n+1) | r31 |
| 8.12 circle class | period 1 | generator of π₁(AddCircle 1)=ℤ | `AddCircle.isEilenbergMacLaneSpaceOne` (`UniversalCover/Circle/EilenbergMacLane.lean` 47) | r31 |
| 5.3 transfer, zero sheets | E=∅ over nonempty B | p_*∘transfer=0=0·id | agrees | r31 |
| 6.0/6.1 lim¹ of eventually constant towers | H^(n−1)(X^k) constant k≥n | Mittag-Leffler ⇒ lim¹=0 | agrees | r31 |
| 1.6 π₁ abelian under continuous unital multiplication | S¹; wedge of two circles | ℤ; free group, no instance | hypothesis needed | r31 |

**Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9; `lake-manifest.json` unchanged at this head).** Opened today through the elaboration's `#check` lines: `HomotopyGroup.prodEquiv`, `HomotopyGroup.prodMulEquiv`, `TauCeti.HasHomotopyExtensionProperty.exists_strong_deformation_retraction`, `TauCeti.MappingCylinder.homotopyEquiv`, `TauCeti.MappingCylinder.hasHomotopyExtensionProperty_range_incl`. Those of the previous reviews are unchanged with the pins: `TauCeti.classifyingSpace` (`TauCeti/AlgebraicTopology/ClassifyingSpace/Basic.lean` 73), `TauCeti.cellularClassifyingSpace` (`ClassifyingSpace/Cellular.lean` 113), `TauCeti.universalGSpaceResolution` (`ClassifyingSpace/Resolution.lean` 218), `TauCeti.cellularResolutionOfIsAspherical` (`EilenbergMacLane/Resolution.lean` 57), `TauCeti.TopCat.serreFibrations` (`Topology/Homotopy/SerreFibration/Basic.lean` 107), `TopCat.singularCap` (`Cohomology/Cap/Basic.lean` 101), `Projectivization.instTopologicalSpace` and `isQuotientMap_mk'` (Mathlib `Topology/Algebra/Projectivization.lean` 44, 47), `TopologicalSpace.compactlyGenerated` and `UCompactlyGeneratedSpace` (`CompactlyGeneratedSpace.lean` 68, 91), `AddCircle.isEilenbergMacLaneSpaceOne` (47), `isQuotientCoveringMap_iff_isCoveringMap_and` (Mathlib `Topology/Covering/Quotient.lean` 339).

**Cross-roadmap citations re-resolved today.** CharacteristicClasses at this head d487de89: lines 54, 65–67, 111, 565, 649, 717–807, 813, 1175, 1193, 1446. ClassifyingSpaces at this head (= 6fc75e4c): headings at lines 429–768, scope lines 59–83, consumer paragraph 775–784 (R01, R02). DGFloer on main at 3b3f7ef6 (folder at eaf17b10): Layer 1 items 2–4 (lines 470, 621, 659), coordination line 232, consumer citations of Stage 4.4 at 188 and 1584 (R03). HomotopySpheres at its open head a4f5c1e2: lines 78, 116, 127, 145, 696, 861, 869, 871, 884, 893, 918 (R04); merge order lines 16 (AlgebraicKTheory) and 72 (HomotopySpheres). The remaining citations (GeneralizedCohomology, TopologicalKTheory, ComplexKahlerGeometry in this pull request; DifferentialGeometry, MorseTheory, RiemannianGeometry, AffineMorseLefschetz, SmoothBundlesConnections, GeometricTopology, ComplexManifolds, BanachAlgebras, UniversalCovers on main) were resolved in the earlier reviews and nothing in this folder or in those folders' cited sections changed since (the only folders the two commits touch are CharacteristicClasses and AlgebraicCurves; main's commits since eaf17b10 are CI changes only).

**Ownership against open pull requests** was checked by object in the earlier reviews for the moved targets (Serre spectral sequences, filtered-complex spectral sequence, CW approximation, K(A,n) family, Serre classes); the only other owner is DGFloer (R03), plus ClassifyingSpaces for the pointed classification (R02). The overlaps file lists no dropped id this folder cites, none this pull request drops, and none only an open revision defines; the conflicting heads it lists (#1187, #1652, #1663, #1797, #1807, #1854) are leads the earlier reviews recorded and this head does not change.

## Not verifiable

- Serre 1953, Theorem 1 (README line 2165): Annals 58, DOI 10.2307/1969789, paywalled at JSTOR; settled as uncertified in the manifest.
- tom Dieck, *Algebraic Topology*, Theorem 9.5.1 (README line 877): EMS Press, DOI 10.4171/048, paywalled; settled as uncertified.
- Weibel 5.5.1(2) and 5.5.10 (README lines 931, 945): Cambridge, paywalled; settled as uncertified.
- Lee, *Introduction to Smooth Manifolds*, Thom 1954, Milnor *Morse Theory*, Freedman–Quinn: settled as uncertified in the manifest.

## Source issues

- none
