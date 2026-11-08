# Review of AlgebraicTopology (pull request #1808 at 925dc8b)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 0439c6d. The two commits since then (1b0434eb, 925dc8b0) touch only `TauCetiRoadmap/AlgebraicCurves/`, which neither cites nor is cited by this folder (no occurrence of either name in the other's README). `TauCetiRoadmap/AlgebraicTopology/README.md`, `Suggested.lean` and the seven companion `.lean` files are byte-identical to the head the previous review read, so every finding of that review is re-raised here with the same number, checked again at this head: the passages are at the same lines, the gate fails on the same counts, and the two cross-roadmap suppliers it rests on (DGFloer on main, HomotopySpheres at its open head) were re-resolved today and still say what they said. Findings marked *predates the pull request* are visible on main's copy of the folder as well; they are reported because the gate fails on them and the brief counts every gate failure.

## R01 (P2) — Two owners of the ordinary Serre and Eilenberg–MacLane machinery: this folder and DGFloer on main

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 102–117 ("The ordinary Serre and Eilenberg–MacLane machinery is owned here. Stage 4.8 owns … Stage 5.0 owns … Stage 5.5 owns … Stage 8.8c owns … Stage 8.8d owns …"; line 115 "Stage 8.10 consumes … DGFloer Layer 1 item 1's degree-one Hurewicz"), the items at lines 874–902 (4.8), 918–954 (5.0), 1014–1140 (5.5), 2086–2173 (8.8c–8.8d).

**Claim.** These targets are owned by AlgebraicTopology; DGFloer Layer 1 consumes them (line 117).

**Witness.** `TauCetiRoadmap/DGFloer/README.md` on main today (eaf17b10, later than the ffac5139 the previous review read) still owns the same objects: Layer 1 item 2 "Weak equivalences and CW approximation" (line 470), item 3 "The spectral sequence of a filtered complex" (621), item 4 "Serre classes and Hurewicz modulo a class" (659) with the K(A,n) family (695–755), and its coordination paragraph still states the opposite direction of supply at line 232: "AlgebraicTopology Stage 5.5 and GeneralizedCohomology consume these targets". DGFloer also consumes this roadmap (lines 188, 1584: Stage 4.4's suspension comparisons), so the two READMEs cite each other. The pull request does not touch the DGFloer folder.

**Repair.** Unchanged from the previous review: own the degree-one Hurewicz isomorphism in Stage 8.3 (Hatcher Theorem 2A.1, hatcher line 7230) and delete the three citations of DGFloer Layer 1 item 1 (lines 115, 1904–1905, table row 8.10 at 2417); and complete the ownership move on the supplier side, by having DGFloer's README cite Stages 4.8, 5.0, 5.5, 8.3, 8.8c and 8.8d instead of building Layer 1 items 1–4, either in this pull request (which then names DGFloer among its folders) or in DGFloer's own revision with the merge order stated. Until then the roadmap plans again what DGFloer on main plans.

## R02 (P1) — Dependency cycle reported by the gate

**Location.** Depcheck at this head: `CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism`. README citations of HomotopySpheres §3A.1/§3A.2 at lines 122, 124, 580, 782, 2253, 2292, 2355 and table rows 2399, 2417, 2418. *Predates the pull request.*

**Claim.** The roadmap's suppliers are earlier in the merge order.

**Witness.** HomotopySpheres at its open head today (52ebd6f8, unchanged) consumes this roadmap: line 680 "*Needs:* 3A.1; AlgebraicTopology Stage 4.5 cofibrations and contractible collapse, and Stage 8 relative homotopy", line 737 "AlgebraicTopology Stage 4.4 raw sphere suspension", lines 812, 822, 1390, and line 2899 "AlgebraicTopology Stage 4.5 uses the compact-generation comparison of 3A.1". The depcheck command of the brief, run at this head, prints the cycle line verbatim (`depcheck: 239 roadmaps, 2341 edges, 2 problem(s)`).

**Repair.** Unchanged: the consumed notions move down. Let Stage 4.5 own the whole compact-generation interface it uses (the coreflection `k` as right adjoint to the inclusion of compactly generated spaces on native `UCompactlyGeneratedSpace` and `TopologicalSpace.compactlyGenerated`, Mathlib `Topology/Compactness/CompactlyGeneratedSpace.lean` lines 68 and 91, its counit, the CW comparison, `k(X×Y)` as the product and the interval-product comparison), delete the §3A.1 citations at lines 580–582, 782, 2253, 2292, 2355 and the three table rows (line 1857 is a consumer mention and may stay), and state the pointed suspension–loop adjunction used by 8.11b (lines 2316–2317, 2355) on the native fixed-interval loop carrier inside 8.11b, or move that comparison to AlgebraicTopologyPartII. HomotopySpheres then remains a consumer only.

## R03 (P2) — Upward supplier: an on-main roadmap citing an open pull request

**Location.** Depcheck at this head: `UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#65) at README lines [2399, 2417, 2418]`; README lines 122 and 124 cite HomotopySpheres through a GitHub pull-request link (`…/pull/284`). *Predates the pull request.*

**Claim.** HomotopySpheres §3A.1/§3A.2 supply Stages 4.4, 4.5, 8.10, 8.11a and 8.11b.

**Witness.** HomotopySpheres is an open pull request (#1287 at 52ebd6f8; merge-order line 66); AlgebraicTopology is on main, so every supplier citation of it is upward whatever the order. Cross-roadmap citations are by roadmap name and section, never by pull-request number or link.

**Repair.** The repair of R02 removes the edges; replace the two `pull/284` links at lines 122 and 124 by the roadmap name and section.

## R04 (P2) — `set_option` in `Suggested.lean`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 910: `set_option maxHeartbeats 800000 in` before `compactSupportTopClass_existsUnique`. *Predates the pull request.*

**Claim.** The acceptance file elaborates under the defaults.

**Witness.** Gate at this head `set_option=1`; the principles make any `set_option` a blocking finding.

**Repair.** Unchanged: split the existence and the uniqueness statements and name the local section's carrier once with an `abbrev`, so that each part elaborates without the override.

## R05 (P2) — Sorry'd data in `Suggested.lean`

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean`: the gate at this head counts 69 `def`/`abbrev`/`instance` declarations whose body is `sorry`, starting at line 160 `cellularToSingular`, 180 `finiteCoverTransfer`, 230 `regularDeckSingularComplex`, 236, 255, 293 `cartanLeraySpectralSequence`, 300, 372, 486 `chartAt`, 552 `carrierHomeomorphOriginal`, 576 `orientationLocalSystem`, 602, 653, 675, 697, 724, 888, 937, 955 `poincareDualityMap`, 1055 `relativeHomotopyGroup`, and on through the relative-homotopy, CW-type, cubical-sphere and Eilenberg–MacLane blocks listed in the previous review. *Predates the pull request.*

**Claim.** `Suggested.lean` states headline theorems with only the simple definitions they need.

**Witness.** Gate `sorry-data=69`; every theorem whose statement mentions one of these (`relativeHurewicz_iso` on `relativeHomotopyGroup`, the `poincareDuality_*` theorems on `poincareDualityMap`, the `cartanLeray_*` theorems) is a statement about an unspecified object.

**Repair.** Unchanged: delete every sorry'd `def`/`abbrev`/`instance` and every declaration that mentions one (the README already carries each as a target with its intended signature). Keep the definitions with real bodies (`ordinaryDoldKanSimplicialModel`, `ordinaryDoldKanLabeledSimplex`, `OrdinaryEMModel`, `NormalizedAbelianEMFamily`, `SimplyConnectedAtInfinity`, `LSCategoricalCover`, the Brouwer statements on native carriers) and the headlines statable on native carriers (Hurewicz and Whitehead are native at the pin; Poincaré duality with two-torsion coefficients is statable through `TopCat.singularCap`, `Cohomology/Cap/Basic.lean` line 101, existentially over the fundamental class; ordinary representability on `OrdinaryEMModel`); name in the module docstring the headlines that are not statable (Serre spectral sequence with its monodromy system, Cartan–Leray, Hurewicz modulo a Serre class, the relative obstruction class with local coefficients).

## R06 (P3) — Build warnings the gate counts

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 1 (`import Mathlib` without the module header) and line 486 (`chartAt` declares `[IsManifold I ∞ M]` twice). *Predates the pull request.*

**Witness.** Gate `build=3` (twice "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`", and the `linter.overlappingInstances` warning at 486:18). My run of `lake env lean` on the file at this head: exit 0, 215 `declaration uses sorry`, the overlapping-instance warning at 486:18, the five `#check` outputs, nothing else.

**Repair.** Header `module`, `public import Mathlib` and the `TauCeti.*` imports as `public import`, then `@[expose] public section`; delete the second `[IsManifold I ∞ M]` binder of `chartAt`.

## R07 (P3) — `Suggested.lean` disagrees with the README after the ownership move

**Location.** `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` line 1259 ("The abelian model is supplied by DGFloer"), lines 1330–1332 ("The definitive DGFloer constructor pins its spaces to bar in degree one and Dold–Kan in higher degree; this interface records its normalized maps without adding a constructor in AT"), and `section SimplyConnectedObstructions` at lines 1787–1881 with `[Nontrivial (Fin n)]` at 1792.

**Claim.** README 8.8c (lines 2086–2135) owns the family `ordinaryEilenbergMacLaneFamily` with its Dold–Kan models; README 8.9 (lines 2178–2188) states the obstruction cochain for n ≥ 1 and a path-connected Y on which π₁Y acts trivially on π_nY.

**Witness.** The two docstrings name DGFloer as the supplier of the object the README now owns; the Lean 8.9 block is stated only for simply connected Y and n ≥ 2, narrower than the README; the module docstring (lines 26–31) names no headline as not statable.

**Repair.** Unchanged: rewrite the two docstrings to say the family is this roadmap's 8.8c target; either state 8.9 at the README's generality (not statable at the pin without a native π₁-action on π_n, in which case the docstring says so) or narrow README 8.9's Lean names to the simply connected case explicitly; list in the module docstring every headline not statable at the pins.

## R08 (P3) — TeX-only syntax outside a code span

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 1392: `C_c^{cell,n}(X,A;ℤ)`. *Predates the pull request.*

**Witness.** Gate `tex=1` at this head.

**Repair.** Write it as a code span, `` `C_c^cell,n(X,A;ℤ)` ``, or in words ("the compactly supported cellular n-cochains of (X,A)").

## R09 (P3) — Backticked own names that `Suggested.lean` does not declare

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 391 (`coordinateCubeReferenceChain_eq_shuffle`) and line 976 (`isQuotientCoveringMap_iff_isCoveringMap_and`, which is native: `TauCeti.isQuotientCoveringMap_iff_isCoveringMap_and` in `TauCeti/Topology/Covering/PuncturedDisc.lean`), both flagged by the gate; and the 37 further own names the previous review listed (for example `basedHomotopyInverseOfEquivalence` at 755, `basedLoopCWType` at 2252 and 2290, `cwProductKelley` at 766 and 1867, `groupCohomologyCup` at 2083, `ordinaryEMLoopComparison` at 2295, `ordinaryCohomologySuspension` at 2304 and 2326), none declared in the folder's `.lean` files or at the pins.

**Witness.** Gate `readme-ids-missing=2`; the gate's rule: a backticked own name is a claim that `Suggested.lean` declares it.

**Repair.** State each fact in prose without the name, or, for the few that are headlines, declare them; write the native one as `TauCeti.isQuotientCoveringMap_iff_isCoveringMap_and`.

## R10 (P3) — Edits outside the pull request's named folders

**Location.** `git diff --stat origin/main...HEAD` excluding the fifteen folders the brief names: `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (one line); gate `outside-folder=2` in the worker's run.

**Witness.** Neither folder is among the pull request's own as the brief lists them.

**Repair.** Drop the two hunks from this pull request, or have the pull request name those folders as its own.

## R11 (P3) — Cited works missing from the References and the manifest

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` line 877 ("tom Dieck 9.5.1"), line 2165 ("Serre 1953, Theorem 1"), line 1935 ("FQ7.7", the only occurrence), line 684 ("Milnor Lemmas 3.6–3.7"), line 688 ("Strøm's product theorem"); `## References` lines 2488–2509.

**Witness.** None of tom Dieck, Serre 1953, Freedman–Quinn, Strøm or Milnor's *Morse Theory* (the cached milnor1959 paper has Lemmas 1–4 and Theorems 1–4 only, milnor1959 lines 43–249) is in the References; the manifest records none of them, nor Weibel (lines 931, 945).

**Repair.** Add the five works to `## References` with the locators used, expand "FQ" at first use, name *Morse Theory* at line 684, and record them in `sources.toml` (tom Dieck and Serre 1953 as `uncertified`).

## R12 (P3) — A compact-generation target without its hypotheses

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 796–798: "k(X×Y) is the product in the compactly generated category with the same compact subsets as X×Y, k(X×Y)=X×Y when either factor is locally compact".

**Claim.** For spaces X, Y with one factor locally compact, `k(X×Y) = X×Y`.

**Witness.** X an uncountable set with the cocountable topology, Y a point: every compact subset of X is finite, so kX is discrete while X is not; Y is compact, yet k(X×Y) = kX ≠ X = X×Y.

**Repair.** Quantify: for compactly generated X and Y, `k(X×Y)` is their product in the compactly generated category; `k(X×Y)=X×Y` when X is compactly generated and Y is locally compact Hausdorff (and symmetrically). The CW case at line 781 (Hatcher Theorem A.6, hatcher line 22693) already carries the right hypotheses.

## R13 (P3) — The route to the K(A,1) axiom does not reach the fixed-d Serre class

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 2142–2148: transfer on 8.8a's finite covering plus 8.8c's directed-union property, for "the groups annihilated by some power of d".

**Witness.** A = ⊕_ℕ ℤ/d: its finite subgroups (ℤ/d)^i have order d^i, so transfer gives annihilation of `H̃_*(K((ℤ/d)^i,1))` only by d^i, and the colimit inherits no uniform exponent. The statement is true by Prüfer's decomposition of a bounded abelian group and Künneth on finite sums, not by the route written; for the torsion class the written route suffices.

**Repair.** State the fixed-d route through Prüfer and Künneth (or the exponent of the bar complex), keeping transfer plus directed union for the torsion class only.

## R14 (P3) — Stage 4.6 rebuilds a projectivization topology that is native at the pin

**Location.** `TauCetiRoadmap/AlgebraicTopology/README.md` lines 279–287 (the "absent" `Projectivization` topology API, cited through a mathlib4 pull-request link) and 820–823 ("Own #44117's generic quotient topology on native `Projectivization 𝕜 V`"). *Predates the pull request*, made stale by the pin bump.

**Witness.** Mathlib at the pin has `Mathlib/Topology/Algebra/Projectivization.lean` with `instTopologicalSpace` (line 44), `isQuotientMap_mk'` (47), `continuous_mk'` (51), `continuous_iff` (56), `continuous_mk` (61), `continuous_map` (71), `isOpenMap_mk'` (79), `isOpenQuotientMap_mk'` (83); Tau Ceti at the pin adds `instSecondCountableTopology`, `instT2Space`, `instCompactSpace`, `instPathConnectedSpace` and the affine charts in `TauCeti/Topology/Algebra/Projectivization.lean` lines 90–311.

**Repair.** Cite these natives in the Inventory and in 4.6; keep in 4.6 only the real projective manifold structure, the CW structure and the sign system; drop the pull-request link.

## R15 (P3) — Companion Lean files import another roadmap's module and carry `set_option`

**Location.** `TauCetiRoadmap/AlgebraicTopology/OrientationComparison.lean` lines 1–3 and 14–15, `GeneralModelOrientation.lean` lines 1–3, `CompactOrientationLaws.lean` 1–3 and 14–15, `BoundaryInteriorComparison.lean` 1–2 and 15–16, `ChartSimplexLocalImage.lean` 1, `BoundaryCarrierOrientation.lean` 1–2; `TopologicalGroupFundamentalGroup.lean` lines 1–4. *Predates the pull request.*

**Witness.** At this head the six orientation files import `TauCetiRoadmap.AlgebraicTopology.Suggested`, two of them `TauCetiRoadmap.DifferentialGeometry.Suggested`, three set `maxHeartbeats`/`synthInstance.maxHeartbeats`, and they carry 42 `sorry`s between them; `TopologicalGroupFundamentalGroup.lean` imports four `Mathlib.*` submodules instead of the single `import Mathlib`. The Lean form rules apply to each `.lean` file of the folder, and the deletions of R05 break their build.

**Repair.** Fold the statements they carry into the README (Stage 6.3 already describes each) and delete the six orientation files; keep `TopologicalGroupFundamentalGroup.lean` only with a single `import Mathlib` header.

## Previous findings

- R01 — not repaired: README lines 102–117 still own Stages 4.8/5.0/5.5/8.8c/8.8d while DGFloer on main (eaf17b10) Layer 1 items 2–4 own the same objects and line 232 states the opposite direction.
- R02 — not repaired: depcheck at this head prints the same CYCLE line; HomotopySpheres citations at lines 580, 782, 2253, 2292, 2355, 2399, 2417, 2418 unchanged.
- R03 — not repaired: the same UPWARD line; `pull/284` links at lines 122 and 124.
- R04 — not repaired: `set_option maxHeartbeats 800000 in` at `Suggested.lean` line 910.
- R05 — not repaired: gate `sorry-data=69`, first at line 160 `cellularToSingular`.
- R06 — not repaired: `import Mathlib` without `module` at line 1; duplicate `[IsManifold I ∞ M]` at line 486, warning reproduced by my elaboration.
- R07 — not repaired: docstrings at lines 1259 and 1330–1332 still name DGFloer as supplier; `[Nontrivial (Fin n)]` at 1792.
- R08 — not repaired: `C_c^{cell,n}(X,A;ℤ)` at README line 1392.
- R09 — not repaired: `coordinateCubeReferenceChain_eq_shuffle` at line 391, `isQuotientCoveringMap_iff_isCoveringMap_and` at line 976, flagged by the gate.
- R10 — not repaired: the two one-line hunks in `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still in the diff against main.
- R11 — not repaired: "tom Dieck 9.5.1" (877), "Serre 1953, Theorem 1" (2165), "FQ7.7" (1935), "Milnor Lemmas 3.6–3.7" (684), "Strøm's product theorem" (688) still unlisted in References.
- R12 — not repaired: lines 796–798 unchanged.
- R13 — not repaired: lines 2142–2148 unchanged.
- R14 — not repaired: lines 279–287 and 820–823 unchanged.
- R15 — not repaired: the six orientation files still import the roadmap modules and set heartbeats; `TopologicalGroupFundamentalGroup.lean` still imports `Mathlib.*` submodules.

## Verified sound

**Scope of this pass.** `git diff --stat 0439c6d..HEAD -- TauCetiRoadmap/AlgebraicTopology` is empty; the two commits since the previous head change `TauCetiRoadmap/AlgebraicCurves/README.md` and `Suggested.lean` only (183 insertions, 137 deletions), a folder the brief names as the pull request's own with its own review. Neither README mentions the other roadmap, and nothing in this folder cites a declaration of AlgebraicCurves, so that change has no bearing here. The diff against main outside the fifteen named folders is the same two one-line hunks as before (R10).

**Gate, depcheck and build at 925dc8b.** The worker's gate: FAIL on set_option=1, tex=1, sorry-data=69, readme-ids-missing=2, depcheck=2, outside-folder=2, build=3, identical to the previous head's counts. My own gate run reproduces every text-scanner count (its outside-folder count is 22 only because my run did not exclude the pull request's own folders). Depcheck output, verbatim:

```
UPWARD: AlgebraicTopology (on main) -> HomotopySpheres (#65) at README lines [2399, 2417, 2418]
CYCLE among: AlgebraicTopology, HilbertModules, HomotopySpheres, IndexTheory, OperatorKTheory, StringOrientation, TangentialBordism
depcheck: 239 roadmaps, 2341 edges, 2 problem(s)
```

`lake env lean TauCetiRoadmap/AlgebraicTopology/Suggested.lean` from the worktree: exit 0; 215 `declaration uses sorry` warnings; the overlapping-instance warning at 486:18; the five `#check` outputs; no error. The file is 2887 lines, unchanged.

**Padding probe.** The file is byte-identical to the one probed in the previous review, where a scratch copy with each of the 143 `theorem … := by sorry` proofs replaced by `first | (rfl; done) | (simp; done) | (infer_instance; done) | sorry` left all 215 sorry warnings in place; the result carries over: no theorem closes by one tactic. No padding finding.

**Seeded sample.** No passage changed, so no sampled target falls in a changed passage. The previous sample of 15 locators (random seed 1808031) stands; six of them were re-opened at this head to confirm the cache still reads as recorded: Hatcher Lemma 4.6 (hatcher line 15116), Proposition 4.18 (15454), Proposition 4.30 (15928, a Proposition, as the previous review noted for README line 2129), Theorem A.6 (22693), FTW Theorem 4.2 (ftw1973 line 600) and Corollary 4.9 (752). All six support the statements at README lines 896, 899, 2129, 780, 1986/2011 and 2006 as written.

**Adversarial table.** Every statement is untouched since the previous review; each row is carried forward from the review at 0439c6d (its values recomputed there) and cited as such.

| statement | instances | values each side | result | source |
| --- | --- | --- | --- | --- |
| 5.0 homological reindexing: E_r^(p,q) = native page r+1 at (a,b)=(1−2p−q,p−1) | (p,q)=(0,0); (2,1) | (1,−1): n=0, i₁=−1,i₂=0 ⇒ H_0(F_0/F_(−1)); (−4,1): n=−3, i₁=1,i₂=2 ⇒ H_3(F_2/F_1) (TauCeti `Filtered/SpectralObject.lean` 410–420) | agrees with E¹_(p,q)=H_(p+q)(F_p/F_(p−1)) | r31 |
| 5.0 cohomological reindexing (a,b)=(2p+q+1,−p−1) | (p,q)=(1,2) | (5,−2): n=3, i₁=−2,i₂=−1 ⇒ F^1/F^2 | agrees | r31 |
| 5.0 degreewise lower bound, no uniform bound | C_n=ℤ, F_pC_n=C_n iff p≥−n | F_(−n−1)C_n=0 each n; inf s(n)=−∞ | README's remark right | r31 |
| 5.0 first-quadrant regularity | d_r on E_r^(p,q) | target (p+r,q−r+1) vanishes for r>q+1 | regular, degreewise bounded | r31 |
| 5.5 multiplicative sign (−1)^(q p′) | F=pt; B=pt | +1, +1 | reduces to base/fibre cup | r31 |
| 5.5 fibre weak contractibility needs nonempty fibres | p: ∅→pt | π₀ not surjective | nonemptiness clause present | r31 |
| 4.5 k(X×Y)=X×Y, one factor locally compact | X cocountable uncountable, Y=pt | kX discrete ≠ X | R12 | r31 |
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
| 8.8d "some power of d" closed under extensions | d^aA=0,d^b(G/A)=0 | d^(a+b)G=0 | closed; K(A,1) route R13 | r31 |
| 8.8d Hurewicz mod C degrees | n=2,C=0 | π₂≅H₂, π₃→H₃ onto | agrees | r31 |
| 8.11b suspension/cone signs | n=0 | σ_right=δ; (−1)^1=−1 | agrees with (−1)^(n+1) | r31 |
| 8.12 circle class | period 1 | generator of π₁(AddCircle 1)=ℤ | `AddCircle.isEilenbergMacLaneSpaceOne` (`UniversalCover/Circle/EilenbergMacLane.lean` 47) | r31 |
| 5.3 transfer, zero sheets | E=∅ over nonempty B | p_*∘transfer=0=0·id | agrees | r31 |
| 6.0/6.1 lim¹ of eventually constant towers | H^(n−1)(X^k) constant k≥n | Mittag-Leffler ⇒ lim¹=0 | agrees | r31 |
| 1.6 π₁ abelian under continuous unital multiplication | S¹; wedge of two circles | ℤ; free group, no instance | hypothesis needed | r31 |

**Library declarations opened at the pins (Mathlib 1b1ccf4b, Tau Ceti 2fd255d9)** are those of the previous review, the pins being unchanged (`lake-manifest.json` identical); re-opened at this head: `TauCeti.TopCat.serreFibrations` (`Topology/Homotopy/SerreFibration/Basic.lean` 107), `TopCat.singularCap` (`Cohomology/Cap/Basic.lean` 101), `Projectivization.instTopologicalSpace` and `isQuotientMap_mk'` (Mathlib `Topology/Algebra/Projectivization.lean` 44, 47), `TopologicalSpace.compactlyGenerated` and `UCompactlyGeneratedSpace` (`CompactlyGeneratedSpace.lean` 68, 91), `AddCircle.isEilenbergMacLaneSpaceOne` (47).

**Cross-roadmap citations re-resolved today.** DGFloer on main at eaf17b10: Layer 1 items 2–4 (lines 470, 621, 659), coordination line 232, consumer citations of Stage 4.4 at 188 and 1584 (R01). HomotopySpheres at #1287 head 52ebd6f8: lines 75, 680, 737, 812, 822, 1390, 2899 (R02). Merge order: HomotopySpheres at line 66; AlgebraicTopology is on main and not listed, as expected for a roadmap on main. The remaining citations (GeneralizedCohomology, CharacteristicClasses, TopologicalKTheory, ComplexKahlerGeometry, ClassifyingSpaces in this pull request; DifferentialGeometry, MorseTheory, RiemannianGeometry, AffineMorseLefschetz, SmoothBundlesConnections, GeometricTopology, ComplexManifolds, BanachAlgebras, UniversalCovers on main) were resolved in the previous review and nothing in this folder that cites them changed.

**Ownership against open pull requests** was checked by object in the previous review for the moved targets (Serre spectral sequences, filtered-complex spectral sequence, CW approximation, K(A,n) family, Serre classes); the only other owner is DGFloer (R01). No new object enters the folder in this head, so no further check was needed.

## Not verifiable

- Serre 1953, Theorem 1 (README line 2165): Annals 58, DOI 10.2307/1969789, paywalled at JSTOR; no open copy found by the sources service in the previous review.
- tom Dieck, *Algebraic Topology*, Theorem 9.5.1 (README line 877): EMS Press, DOI 10.4171/048, paywalled.
- Weibel 5.5.1(2) and 5.5.10 (README lines 931, 945): Cambridge, paywalled; the hypotheses restated in the README agree with the theorems as known, not with a text read here.
- Lee, *Introduction to Smooth Manifolds* and Thom 1954: settled as uncertified in the manifest.

## Source issues

- none
