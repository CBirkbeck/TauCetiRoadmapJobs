# GATE-AlgebraicTopology~4: answers to the human review of 2026-11-06

Review answered: one comment by roed-math (cross-PR overlap check) with six numbered points, H01–H06.
Head before this job: `61ee7a2`. Commit made: `bd4f35d` "AlgebraicTopology: review repairs (Serre and
tower API consumed from Tau Ceti, compact generation 4.8, numbering map)". Not pushed.

All library facts below are checked at the brief's pins (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`,
the pins of the content repository's `lake-manifest.json`, which is also main's pin since #1800).
**This branch's own `lake-manifest.json` still pins Tau Ceti `358314d`** (its merge base `a0ad405`
predates #1800), and the build below runs at that older pin. The Serre-fibration and tower modules
cited in H02 and H04 exist at `2fd255d`, not at `358314d`. See "Pin drift" below: it blocks merge.

## H01 (roed-math) — answered

This branch should be rebased onto #1663, not the reverse. #1652 is the structural rewrite (Stage →
Layer headings, house shape, Suggested.lean cut from about 3000 lines to about 360), and it can carry
#1663's added targets across mechanically under "Stage k item m = §k.m" (README lines 448–465):
Stage 4 item 8 is already §4.8 here (H03), and #1663's Stage 8 items 13–16 become §§8.13–8.16.
Going the other way would mean re-applying #1663's targeted edits to text that no longer exists. This
job restates none of #1663's additions. The same files also conflict with #1797, #1807, #1808, #1854
(same author) and #1187 (pin bump), and the branch still has to merge main's pin bump #1800 (see Pin
drift).

## H02 (roed-math) — applied differently

The generic tower API belongs to neither DerivedModuleAlgebra §1.T.1 nor AlgebraicTopology Stage 6
item 0: the pinned Tau Ceti already has it in `TauCeti/Algebra/Category/ModuleCat/Tower/`, namely
`TauCeti.ModuleTower`, `shift`, `lim`, `limOne` and `connecting` with `connecting_naturality`
(`Basic`, `Exact`), `subsingleton_limOne_of_isMittagLeffler` (`MittagLeffler`), Milnor sequences for
`TauCeti.ComplexTower` of every complex shape with naturality (`Milnor/Basic`, `Milnor/Naturality`),
the cofinal comparisons (`Subsequence`, `Subsequence/LimOne`, `Milnor/Subsequence`), and
`homotopyLimitFunctor`, `derivedLimit` and `derivedLimitIsoLimComplex` (`DerivedLimit`). So the
supplier-contract section "From TauCetiRoadmap.DerivedModuleAlgebra" is deleted, these names are
added to "From Mathlib and Tau Ceti" (README line 332), the ownership bullet is rewritten (line 129),
and §6.0 (line 1584) now owns only (a) the one generic piece the library lacks, maps of shifted cones
induced by tower maps whose squares commute up to *specified* homotopies (`DerivedLimit` is functorial
only for strict maps), with composition, second-homotopy, cohomology and quasi-isomorphism laws and
three computed Checks, and (b) the topological restriction-tower adapters. This README no longer cites
§1.T.1, so #1701 dropping it breaks nothing here. #1701 hands the homotopy-square maps to
AlgebraicTopology Stage 6 item 0 (= §6.0), which is consistent with this; on main they are still also
in DerivedModuleAlgebra §1.1 until #1701 merges.

## H03 (roed-math) — applied

AlgebraicTopology was already the owner, and #1287 already agrees: at its current head `8a5be10`,
HomotopySpheres §3A says compact generation, convenient products and exponentials and the pointed
suspension–loop adjunction "are AlgebraicTopology Stage 4 item 8", and it cites that item about 25
times (lines 113, 131, 694, 702, …). To settle the number with #1663 and #1287, §4.0 is renumbered
**§4.0 → §4.8**, moved to the end of Layer 4 (README line 1298), and every reference is updated
(about 20). Because §4.4's raw-quotient comparisons and §4.5's kified products use only the
coreflection portion, the Layer 4 introduction (lines 841–844) and §4.8's *Needs* say that this
portion uses only Mathlib and precedes §§4.4–4.5.

## H04 (roed-math) — applied differently

The Serre-fibration predicate should not be handed to DGFloer, because it is in the pinned Tau Ceti:
`TauCeti/Topology/Homotopy/SerreFibration/Basic.lean` (`TauCeti.TopCat.serreFibrations`,
`mem_serreFibrations_iff`, `mem_serreFibrations_iff_cube`, `mem_serreFibrations_pullbackFst`,
`mem_serreFibrations_fst`, `IsCoveringMap.mem_serreFibrations`), `FiberBundle.lean`
(`mem_serreFibrations_of_exists_trivialization`, `mem_serreFibrations_proj`, no paracompactness), and
`RelativeCube.lean` (`exists_lift_openBox_of_mem_serreFibrations`). #1798 itself consumes them
(its "Already in the library" paragraph, DGFloer README lines 89–99), and main's DGFloer Layer 1
item 2 ("All-CW testing") already owns lifting against relative CW pairs, the only part of the old
§5.0 the library lacks. So **§5.0 is deleted**: the claim at old line 113 that the interface is "absent
from the pinned libraries" was true only at the branch's older pin. In its place: the Layer 5
introduction (line 1363) and supplier contracts (line 316) cite the Tau Ceti API by name, the ownership
bullet (line 111) and the DGFloer contract (line 392) assign relative-CW lifting to DGFloer Layer 1
item 2, §5.5 (line 1473) and §8.9 consume those directly, and §5.5 gains three computed Checks (empty
map, {1} → S¹, Hopf vs product). Nothing here is left for #1798 to state that it does not already state.

## H05 (roed-math) — answered

No renumbering is reverted. The README now gives the old → new correspondence that #1694, #1287,
#990, #974, #987, #942, #1045, #1645, #1798 and the main roadmaps citing `#stage-k-…` anchors
(MorseTheory, GeneralizedCohomology, DerivedModuleAlgebra) need: one line per stage (README lines
448–465). Stage k has the same title as Layer k (checked by diff), so `stage-k-<title>` becomes
`layer-k-<title>` and Stage k item m becomes §k.m. The exceptions are spelled out: Stage 2 item 2 →
Tau Ceti `TopPair.singularHomologyFunctor`; Stage 4 item 8 → §4.8; the Serre predicate of Stage 5
item 5 and the generic part of Stage 6 item 0 → Tau Ceti. With §4.0 now §4.8 (H03), #1663's numbering
and this one agree item for item, so dependents update once, mechanically.

## H06 (roed-math) — answered

No change is needed for #1287: at its head `8a5be10` its supplier contract already cites the README
targets "relative Hurewicz … (Stage 8 item 4)" and "Poincaré–Lefschetz duality … (Stage 6 item 4)",
which are §8.4 and §6.4 here, and the two Lean names it still uses, `homologicalWhitehead` and
`compactManifoldFiniteCWType`, are declared in Suggested.lean. The docstring's reason for not stating
relative Hurewicz holds at the branch's pin `358314d`, which has no relative homotopy carrier. At the
brief's pin `2fd255d` it no longer holds: `TauCeti.RelHomotopyGroup` (`Homotopy/Relative/Basic.lean`)
and its `hurewicz`/`hurewiczHom` (`Homotopy/Relative/Hurewicz.lean`) exist. That belongs to the pin
reconciliation below.

## Pin drift (not raised by the review; blocks merge)

The branch must merge main (pin bump #1800 to Tau Ceti `2fd255d`), and the roadmap must then be
reconciled with the Tau Ceti modules added since `358314d` (839 files under
`AlgebraicTopology`, `Topology/Homotopy`, `Topology/Category`, `Topology/CWComplex`). This job cannot do
that: Suggested.lean must build in this worktree, which runs at `358314d`, and `lake-manifest.json`
is out of scope. So I only repaired what the review and the gate required. Found at `2fd255d`, to be
reconciled next:

- `TauCeti.brouwerFixedPoint_compactConvex` (`Singular/BrouwerFixedPoint.lean:125`) is exactly the
  Suggested.lean headline of the same name. `noRetraction_diskBoundary`, `_continuousOn`, `_closedBall`
  and `_finiteSpan` cover the rest of §2.7.
- Whitehead for CW-type spaces, `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`
  (`Homotopy/Whitehead.lean:243`) with `TauCeti.CWType`, subsumes `ordinaryWhitehead` and
  `ordinaryWhitehead_cwType` (§8.5).
- Absolute Hurewicz `HomotopyGroup.hurewiczAddEquiv` (`Homotopy/Hurewicz/Absolute.lean`) contradicts
  the docstring's "no Hurewicz module at the pins" (§8.3). Relative homotopy groups and relative
  Hurewicz (bijective when A and X are (n−1)-connected) are in `Homotopy/Relative/*` and
  `Hurewicz/Relative.lean` (§§8.1, 8.4); the general relative Hurewicz (A simply connected) becomes
  statable.
- Further overlaps to check: `TauCeti.BasedTopPair` (§8.1 convention), `Singular/Transfer/*` (§5.3,
  `finiteCoverTransfer_exists`), `Singular/MappingTorus/*` (§5.2), `Singular/Torus/*` (§5.4),
  `Cellular/EulerCharacteristic/{FiniteCWType,Product,Covering}` (Layer 7 headlines),
  `ClassifyingSpace/*` (30 files, §8.8 and `groupClassifyingSpace_isEMOne`), `Homotopy/CWApproximation`,
  `Singular/LocalHomology/Orientation/*` with `TauCeti.HomologicalOrientation` (§6.3 and the duality
  docstring), and `Singular/Cech/*` (§§5.6–5.7).

## Gate repairs (not raised by the review)

The baseline gate at `61ee7a2` failed with statement-hygiene=2 (P3: `Nonempty (… ≅ …)` conclusions).

- `cellularSingularComparison` is deleted from Suggested.lean, with its Layer 4 section header, its
  now-unused import `TauCeti.AlgebraicTopology.Cellular.Comparison`, and a misplaced mention at the top
  of README §4.1. At `2fd255d` it is `TauCeti.cellularSingularHomologyIso` together with the instance
  `isIso_singularHomologyMap_skeletonBasePairToComplex_succ_of_hasExactColimitsOfShape`
  (`Cellular/Comparison.lean:227,244`), for any relative CW complex and coefficients with exact
  sequential colimits, which covers `ModuleCat R`. §4.3 is renamed "Cellular comparison at chain level
  and with local coefficients" and consumes it; the supplier bullet now states both instances.
- `simplyConnectedHomologySphere_homotopyEquiv_sphere` → `nonempty_homotopyEquiv_sphere_of_homologySphere`
  (Suggested.lean line 284, README lines 2874 and 2891), with the statement unchanged. The theorem is
  the existence corollary of `homologicalWhitehead_cwType` plus Hurewicz, and no canonical map exists.
- The docstring sentences touched by H02 and the deletion are reworded; nothing else in it changed.

## Signature check

I appended `#check @name` for all 30 remaining declarations to Suggested.lean, ran the allowed
`lake build` once (exit 0), and restored the file byte-for-byte (diffed). Each elaborated type matches
its entry in `scratch/signatures.md`; the renamed theorem's type is identical to the old one's. No
binder was lost or changed. README statements of the touched declarations (§8.7) agree.

## Ownership, citations and overlaps

- Ownership checks, by object: the Serre predicate (Tau Ceti; DGFloer main Layer 1 item 2 lines
  486–510; #1798 lines 89–99, 643–680); the module towers (Tau Ceti; DerivedModuleAlgebra main §1.T.1;
  #1701 lines 18–25, 57); compact generation (#1287 lines 131, 690–698; #1663 Stage 4 item 8). The
  homotopy-square cone maps are owned here because the library lacks them and #1701 hands them to this
  roadmap.
- Cited ids that an open PR drops: DerivedModuleAlgebra §1.T.1 is no longer cited. DifferentialGeometry
  Layers 9 and 10 (dropped by #886) are still cited, unchanged by this job; on main they exist.
- Ids that only an open revision defines: none.
- Ids this PR drops that others cite: Stage/anchor ids are covered by the correspondence in H05. The
  branch-only §§4.0 and 5.0 are gone. #1807, #1808 and #1854 cite "AlgebraicTopology Stage 5.0's generic
  filtered-complex spectral sequence" in ComplexKahlerGeometry (e.g. #1807 line 2123). Neither main
  nor this branch has such an item: that spectral sequence is DGFloer Layer 1 item 3 / Tau Ceti's, so
  those PRs need to fix it.
- Notions moved down from later roadmaps: none. Sources: no new work cited (Hatcher Proposition 4.48,
  Proposition A.1 and Theorem 3.5 were already cited; `hatcher` line 16461 checked for 4.48). No
  `needs-references.toml` entries.

## Adversarial pass (statements added or changed)

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §6.0 cone map holim(f,h) needs the correction term | Kₙ=Lₙ=[R→R] (deg −1,0), identity transitions, fₙ=n·id, hₙ=s | φfₙ₊₁−fₙφ=(n+1−n)id=id=ds+sd; (δ∏f−∏fδ)(x)ₙ=(nxₙ−(n+1)xₙ₊₁)−(nxₙ−nxₙ₊₁)=−xₙ₊₁ ≠ 0 | holds; uncorrected map is not a chain map | added as Check |
| §6.0 composite homotopy kₙfₙ₊₁+gₙhₙ | same, g=f, k=h | defect ((n+1)²−n²)=2n+1; formula (n+1)+n=2n+1; dropping gₙhₙ gives n+1 ≠ 2n+1 for n≥1 (equal at n=0) | holds | added as Check |
| §6.0 no independence from h | K=ℤ const (deg 0), L=×3 tower (deg −1), f=0, hₙ=rₙ | H⁰holim K=ℤ, H⁰holim L=lim¹≅ℤ₃/ℤ; rₙ=0 ↦ 0; rₙ=1 ↦ ±Σ3ⁿ=∓1/2 ∉ ℤ. With ×2: Σ2ⁿ=−1 ∈ ℤ, so the class is 0 (p=2 does not discriminate) | holds with p=3 | added as Check (p=3) |
| §6.0 strict case = library map | hₙ=0 | correction term 0, components (∏f,∏f) = `homotopyLimitFunctor.map` | holds | API bullet |
| §6.0 projection compatibility | general | first cone component of holim(f,h) is ∏f exactly; Hᵏ(φᴸ)Hᵏ(fₙ₊₁)=Hᵏ(fₙ)Hᵏ(φᴷ) since homotopic maps agree on cohomology | holds | API bullet |
| §6.0 quasi-iso | fₙ quasi-isos | ∏fₙ quasi-iso (exact products in ModuleCat); five lemma on the two fibre LES | holds | API bullet |
| §6.0 degenerate ring | R = 0 | all modules 0, holim = 0, all maps 0; laws trivially true | holds | none |
| §6.0 tower Checks (library δ) | constant ℤ; zero bonds; ×2 tower | (3,1,0,…)↦(2,1,0,…); δ=id ⇒ lim=lim¹=0; 3x₀+1 ≡ 0 mod 4ᵐ ∀m ⇒ 3x₀=−1 impossible | hold | wording only |
| §4.3 consumes native comparison in every dimension | A=X; point rel ∅; RP²; hypotheses at pin | 0=0; M in degree 0 both sides; d₁=0, d₂=2 ⇒ H₁=ℤ/2, H₂=0; pin needs T2, abelian, exact cell coproducts, `HasExactColimitsOfShape ℕ` (true for ModuleCat) | holds | consume + supplier bullet |
| §5 native Serre predicate, no surjectivity | ∅ → B | Dⁿ ≠ ∅ for all n (D⁰ = point), so no lifting squares: member; fibres empty ⇒ E²=0=H(∅) | holds | Check |
| §5.5 fibration hypothesis needed | {1} → S¹ | n=0 lift of the loop would be constant: fails; E² from fibre over 1 gives E²_(1,0)=ℤ vs H₁({1})=0 | negative control | Check |
| §5.5 trivial monodromy ≠ collapse | S¹×S²→S², Hopf S³→S² | E² = ℤ at (0,0),(0,1),(2,0),(2,1) for both; product H=ℤ,ℤ,ℤ,ℤ ⇒ d²=0; S³ H₁=H₂=0 ⇒ d²:E²_(2,0)→E²_(0,1) iso, leaving H₀=H₃=ℤ | holds | Check |
| §8.9 relative lifting from DGFloer L1 item 2 | relative CW (X,B), Hausdorff convention | DGFloer main "All-CW testing" covers arbitrary dimension, empty pairs, 0-cells; AT convention makes CW carriers T2 | consistent | Needs + text |
| H05 correspondence lines | all 8 stages | titles identical (diff of `## Stage`/`## Layer` lists); main item counts 6,7,5,7(+8),7,0–5,4,12 match §§ | holds | added |
| `nonempty_homotopyEquiv_sphere_of_homologySphere` (renamed) | n=2, X=S²; n=0,1 | S² simply connected, H₂=ℤ, H₁=0 ⇒ conclusion holds; n<2 excluded by `hn` | statement unchanged | rename only |
| Deleted `cellularSingularComparison` | X:Type u, A=`ModuleCat.{u} R` | `HasCoproducts.{u}` ✓, exact sequential colimits ✓ ⇒ equals ⟨`TauCeti.cellularSingularHomologyIso`⟩ at `2fd255d` | duplicate | deleted |

## Build

`lake build TauCetiRoadmap.AlgebraicTopology.Suggested` on the committed file:
`Build completed successfully (8979 jobs).` Exit 0; the only warnings are "declaration uses `sorry`".
This is at the branch's pin `358314d`.

## Gate

`gate AlgebraicTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

Depcheck (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2365 edges, 0 problem(s)`, with no
UPWARD, CYCLE or moved line.

No text in the review asked for anything outside this job; nothing suspicious to quote.
