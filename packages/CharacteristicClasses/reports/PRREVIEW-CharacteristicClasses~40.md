# Review of CharacteristicClasses (pull request #1808 at 6931121)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since a3b1e14. The folder `TauCetiRoadmap/CharacteristicClasses/` at this head is byte-identical to the head the previous review read (`git diff --stat a3b1e14 HEAD -- TauCetiRoadmap/CharacteristicClasses` is empty); the three commits since then touch only ClassifyingSpaces and ComplexKahlerGeometry. None of the previous review's four findings has been repaired, so all four are carried below with their repairs unchanged except where the facts moved (R03). The worker's gate still fails on exactly the previous two counts, `dropped=5` and `outside-folder=2`.

## R01 (P2) — HomotopySpheres is cited five times, twice as a supplier, and the gate refuses the name (previous R01, not repaired)

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:24` ("HomotopySpheres §3A and §4A supplies the earlier compactly generated substrate"), `:325` ("their HomotopySpheres classifier comparison"), `:431` ("CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres"), `:514–516` ("together with HomotopySpheres §4A's quaternion-conjugation dictionary … as the only HomotopySpheres input").

Claim: HomotopySpheres is on the list of roadmaps never cited as suppliers; the gate's `dropped` rule fails on these five lines (`scratch/gate.md`; `grep -n HomotopySpheres README.md` at this head returns exactly lines 24, 325, 431, 514, 516). Lines 431 and 514–516 consume it (the compact-generation adjunction, the S³/{±1} ≃ SO(3) dictionary for π₂(SO(3)) = 0). Both inputs have owners this README already cites: the coreflection `k`, right adjoint of Mathlib's `CompactlyGenerated.compactlyGeneratedToTop`, is AlgebraicTopology Stage 4.5 at this head (`TauCetiRoadmap/AlgebraicTopology/README.md:136–138`); the double cover of SO(3) is available at the pin as `CliffordAlgebra.isCoveringMap_realCliffordSpinDoubleCoverZero_rightHom` at n = 3 (`Topology/Algebra/CliffordAlgebra/Spin/Covering.lean:108`) with `TauCeti.realSpinThreeHomeomorphQuaternionSphere` (`Spin/SimplyConnected.lean`), or as LieGroups Layer 5's `Ad : SU(2) → SO(3)` (main `RepresentationTheory/LieGroups/README.md:479–485`).

Witness: gate line `dropped: line 431: CompactlyGenerated inclusion/compact-generation adjunction of HomotopySpheres`; AlgebraicTopology head line 136 "Stage 4.5 owns the compact-generation coreflection `k`".

Repair (each line tested against the gate's plain name match; after it `grep -c HomotopySpheres` is 0 and `dropped=0`):
- 24–27: replace the HomotopySpheres sentence by "AlgebraicTopology Stage 4.5 supplies the compact-generation coreflection and the compactly generated substrate on which the stable colimits are formed; the stable O/SO and ΩBSO comparisons are downstream consumers, not inputs to the finite oriented-cover construction."
- 325: "and their classifier comparison."
- 431–432: "Consume AlgebraicTopology Stage 4.5's compact-generation coreflection `k`, right adjoint of Mathlib's `CompactlyGenerated.compactlyGeneratedToTop`, with its counit;".
- 514–516: replace the HomotopySpheres clause by the pinned Spin(3) → SO(3) covering map at n = 3 together with `TauCeti.realSpinThreeHomeomorphQuaternionSphere`, transported to T1.5a's SO(3) by the frame-to-isometry map, then "Prove π₂(SO(k))=0 for every k: π₂(SO(2))=π₂(S¹)=0, π₂(SO(3))=π₂(S³)=0 by that double cover, …".

The copy of this folder at the head of #1854 (c07dda7) already carries exactly these four edits (its README lines 27, 437, 522–532; `grep -c HomotopySpheres` there is 0), so the repair is a matter of adopting that version here or ordering the pull requests so that it lands (R03).

## R02 (P3) — the ℝP headline's docstring and README attribute to the pin a smooth-action instance it does not have (previous R02, not repaired)

Location: `TauCetiRoadmap/CharacteristicClasses/Suggested.lean:36–39` ("The antipodal map is analytic (`contMDiff_neg_sphere`), so the pinned `TauCeti.instIsManifoldQuotient` makes these charts an analytic, hence smooth, atlas"); `README.md:2260–2264`, the same sentence.

Claim: `TauCeti.instIsManifoldQuotient` (`Geometry/Manifold/Instances/Quotient.lean:242`) takes `[ContMDiffConstSMul I n G M]` (line 205). No instance `ContMDiffConstSMul (𝓡 m) _ ℤˣ (sphere 0 1)` exists at Tau Ceti 2fd255d9: `IntUnitsAction.lean` provides only `MulAction`, `ContinuousConstSMul` and `IsCancelSMul` (lines 59, 84, 92). The pinned instance therefore does not fire for ℝPᵐ. The headline statement is unaffected (`Manifold.IsImmersion` ranges over `IsManifold.maximalAtlas`, defined without the instance; with the five-line instance the identity is an immersion, so the statement is not vacuous).

Witness: the previous review's scratch probe: `example : ContMDiffConstSMul (𝓡 2) ω ℤˣ (sphere (0 : EuclideanSpace ℝ (Fin 3)) 1) := inferInstance` fails to synthesize; after a local instance proved by `Int.units_eq_one_or`, `contMDiff_id` and `contMDiff_neg_sphere`, `IsManifold (𝓡 2) ∞ (quotient)` and `Manifold.IsImmersion.id` elaborate. The text at this head is unchanged.

Repair: in both places write "the smooth-action instance `ContMDiffConstSMul (𝓡 m) ω ℤˣ Sᵐ` is a target of C7.3a, proved from `contMDiff_neg_sphere` for `g = −1` and `contMDiff_id` for `g = 1`; with it the pinned `TauCeti.instIsManifoldQuotient` makes these charts an analytic, hence smooth, atlas, and the pinned `Manifold.IsImmersion.id` applies". No change to the theorem. (The #1854 copy of `Suggested.lean`, lines 36–42, and its README line 2326 already say this.)

## R03 (P3) — another open pull request rewrites this folder with a newer version, and neither description states the order (previous R03, not repaired)

Location: pull request description, merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**".

Claim: #1854 (same author, open, head c07dda7) conflicts with this pull request in `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean` (worker's `overlaps.md`). Since the previous review the facts have reversed: #1854's copy of the folder is now the newer one. It has no HomotopySpheres mention, makes the ℤˣ smooth-action instance a target (R01 and R02 repaired there), and further re-sources the Serre-fibration homotopy sequence and spectral sequences to AlgebraicTopology Stages 4.8 and 5.5 instead of DGFloer Layer 1 (its README lines 76–101 against this head's 74–98). Its `Suggested.lean` states the same four theorems (lines 126, 150, 166, 188). Merging #1808 after #1854 would revert the folder to this head's older text and reintroduce the five refused names. #1854's own description says "#1808 is independent of this pull request", which the nine conflicting files contradict.

Witness: `overlaps.md`: "#1808 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`, `TauCetiRoadmap/CharacteristicClasses/Suggested.lean`"; `diff` of the two READMEs: 528 lines; `grep -c HomotopySpheres` 5 here, 0 there.

Repair: state the order with #1854 in this description's merge-order paragraph and rebase the later of the two onto the earlier so that the rebased branch carries the newer (#1854) version of this folder; the simplest form is for this pull request to drop its CharacteristicClasses changes, or adopt #1854's copy, and to say so.

## R04 (P3) — the pull request still changes two files outside its roadmap folders (previous R04, not repaired)

Location: `Completed/ArithmeticDirichletSeries/README.md:331` and `TauCetiRoadmap/SymplecticGeometry/README.md:77`.

Claim: neither folder is one of the fifteen the brief names as the pull request's own; the worker's gate at 6931121 reports `outside-folder=2` on exactly these files.

Witness: `git diff --stat origin/main...HEAD` outside the fifteen folders: the two files, 2 insertions, 2 deletions; `git log origin/main..HEAD` on them shows `e591d103` and `61e5385e`.

Repair: rebase so that commits `e591d103` and `61e5385e` drop out, or name the two folders as the pull request's own in the description.

## Previous findings

- R01 — not repaired: README lines 24, 325, 431, 514 and 516 still name HomotopySpheres; the gate still reports `dropped=5`. Now R01.
- R02 — not repaired: `Suggested.lean:36–39` and README 2260–2264 still read "so the pinned `TauCeti.instIsManifoldQuotient` makes these charts an analytic, hence smooth, atlas". Now R02.
- R03 — not repaired: the description still orders only #1101 → #1807 → this pull request; #1854 now carries the newer copy of the folder. Now R03.
- R04 — not repaired: the two outside-folder files are still changed (`outside-folder=2`). Now R04.

## Verified sound

**Change set.** `scratch/changes.md`: 0 changed lines in the folder since a3b1e14; the commits since then are d1a45bff (ClassifyingSpaces) and 69311219 (ComplexKahlerGeometry). I confirmed the empty diff with git.

**Gate and build.** Worker's gate at 6931121: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 … imports=0 … statement-hygiene=0 forbidden=0 dropped=5 readme-ids-missing=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=2 source-material=0 build=0 FAIL`; the two failures are R01 and R04, both reproduced above. `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean`: exit 0 in 9 s, warnings only `declaration uses sorry` at 121:8, 145:8, 161:8, 183:8. Dependency check this round:

```text
depcheck: 230 roadmaps, 2340 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `scratch/citations.md`: no cross-roadmap citation and no Lean name found nowhere.

**Signatures.** `scratch/signatures.md` lists the same four elaborated types as the previous round (0 dropped binders); the file is unchanged, so the previous comparison with README C2.1 (903–911), C2.2 (976–984) and C7.3a (2252–2256) stands.

**Citations into the sibling folders that changed.** ComplexKahlerGeometry at this head: K4 "holomorphic and Hermitian bundles" (README 1141, with 4.2 Chern connections at 1184), K7.1 "Projective charts and orientation" (2182: the single `Projectivization ℂ (Fin (n+1) → ℂ)` carrier and atlas), K7.2 (2224: tautological `O(−1)`, dual powers `O(k)`, normalized `ω_FS`, `Θ(O(1)) = −2πi ω_FS`, `⟨u,[ℂP¹]⟩ = +1`), which is exactly what this README consumes at lines 107–111, 221–222, 749 and 785. ClassifyingSpaces at this head: title and summary (lines 1–11) still "classifying spaces of discrete groups" via the countable join, as this README says at 155–157 and 419; its line 1022 names this roadmap as a consumer. Overlaps lead "SpinGeometry §G4.1a only at #1674": false, main `SpinGeometry/README.md:397` defines G4.1a. No id this README cites is dropped by an open pull request and none it drops is cited elsewhere.

**Adversarial table.** No statement changed; every row of the previous report (r35, "Adversarial table", 48 rows with computed values for the four headlines, the ten sampled targets C1.0, C2.0, C5a.1–C5a.7, C7.AdjointHopfObstruction, and C1.1d, C3.3, C3.6, C7.1, C7.3) is carried unchanged. Representative carried values: Thom-class uniqueness on rank 0 over two points gives `u=(g,−g)` against a constant `(g,g)`; Euler class of TS² is 2 ≠ 0 against the hairy-ball absence of a section, and `H³(S⁴)=0` with `p₁=−4u` shows `hdim` is necessary; ℝP⁴ → ℝ⁶ has `w̄₃=a³≠0` with normal rank 2 < 3; C5a.3 Weil curvature `tΩ+((t²−t)/2)[θ,θ]`; C7.1 `L₃` coefficients `2/945, −13/945, 62/945` giving signature 1 on ℂP⁶ and 0 on ℍP³.

**Sources.** No locator changed; the previous round read hatcher-at (3C.4 line 12343, 4D.3 line 18734, §3.G lines 14232/14239), dupont-ln (2.20, 2.21, Ex. 4.3, A2, A7, A8, 9.5, 9.6), dupont-ccc (8.1, 8.3, 8.35), alekseev-meinrenken (§3.1, (10)), cohen-fiber-bundles ((2.4), Prop. 3.7), zentner (Ex. 2) at the lines its report gives; nothing to re-read.

**Ownership.** Unchanged folder; the previous round's `roadmaps grep` on `isImmersion` and `eulerClass_eq_zero_iff` found only this folder. The newer copy of the folder at #1854 states the same four theorems, so there is one version to keep (R03), not a second owner.

## Not verifiable

- Milnor–Stasheff §4, §10, §12, §14, §15, §18, §19, Appendix C; Milnor, *Topology from the Differentiable Viewpoint* §6; Milnor, *Construction of Universal Bundles II* §§2–3; Bott–Tu §§6, 11–14, 20–23: settled as uncertified in the manifest, cited by locator alone.
- The two `CliffordAlgebra` Spin names of C3.5 and of the R01 repair have no object file on this worker; checked in the pinned source only (`Spin/Covering.lean:108`).

## Source issues

- none
