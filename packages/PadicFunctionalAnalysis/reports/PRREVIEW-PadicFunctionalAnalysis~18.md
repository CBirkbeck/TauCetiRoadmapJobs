# Review of PadicFunctionalAnalysis (pull request #1807 at 12e0624)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since b0ef636. `TauCetiRoadmap/PadicFunctionalAnalysis/` is byte-identical to the folder the previous review read (`git diff --stat b0ef636..HEAD -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty); against main the folder diff is still the §5.3 rewrite (README lines 918–925) and the two dependency bullets (1041–1043, 1056–1059). The two files changed since b0ef636 are `TauCetiRoadmap/ClassifyingSpaces/README.md` and `Suggested.lean`, a sibling folder of this pull request with its own review; nothing in this roadmap cites ClassifyingSpaces. The pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` in `lake-manifest.json` at b0ef636 and at this head, and in the worktree's `.lake/packages`). So every finding of the previous review stands, re-verified at this head below; no new finding arises. The gate still fails (`prnum=5 sorry-examples=1 imports=1 mathlib-subimports=16 no-import-mathlib=1 depcheck=1`), so no acceptance is possible at this head.

## R01 (P2) — The pinned Tau Ceti proves most of Layers 0–5; `Suggested.lean` restates it with `sorry` and the README plans it as targets

Location: `Suggested.lean` lines 53–381 (every declaration except `exists_character_of_hasEval` at 344 and `measurePairing_injective` at 380); README Layers 0–5, in particular §0.4 (260–325), §1.1, §1.4, §2.1–§2.4, §3.3–§3.4, §4.1, §4.6–§4.7, §5.2–§5.3; the module docstring (20–40) and "Existing foundations" (141–188), which say the library supplies only Mahler, `AbstractMeasure`, `amiceTransform` and the Huber predicates.

Claim: the Lean file states the roadmap's own headline targets, and the README's layers plan work the library lacks.

Witness (re-opened at Tau Ceti `2fd255d9` this round, file and line): `TauCeti.NormedRing.PseudoUniformizer`, `Analysis/Normed/Ring/PseudoUniformizer.lean` 136 and `IsTate` 150 (for `PseudoUniformizer` 58, `IsTate` 66); `TauCeti.Huber.tateGauge`, `RingTheory/Huber/TateGauge/Basic.lean` 78, same signature `(A₀ : Subring A) (ϖ : Aˣ) (a : ℝ) (x : A) : ℝ` (for `tateGauge` 87); `exists_tateSeminorm` 355 (for line 100), `tateGauge_eq_zero_iff` 390 with `t2Space_iff_forall_tateGauge_eq_zero_iff` 399 (106), `tateGauge_equiv` 376 (111), `tateGauge_rpow` 191 (119); `ContinuousLinearMap.ringOpNorm`, `Analysis/Normed/Operator/RingOpNorm.lean` 149, `le_ringOpNorm` 340, `ringOpNorm_eq_opNorm` 402 (127, 131, 137); `TauCeti.IsOrthonormalFamily` 95, `IsOrthonormalBasis` 107, `IsONable` 116, `IsOrthonormalBasis.repr` 370, `exists_isOrthonormalBasis_iff` 463, `Analysis/Normed/Module/Bases/Orthonormal.lean` (154–183); `IsPotentiallyONable` 74, `HasPr` 89, `Bases/PotentiallyONable.lean` (189, 195); `ContinuousLinearMap.matrixCoeff`, `Topology/ContinuousMap/ZeroAtInfty/Matrix.lean` 90 (200); `Submodule.exists_finset_norm_le`, `ZeroAtInfty/FiniteCoordinates.lean` 95 (213); `TauCeti.exists_continuousLinearEquiv_prod_of_countableType`, `Bases/Splitting.lean` 87 (220); `AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff` 201 and `mem_range_amiceTransform_iff` 186, `NumberTheory/Padics/Measure/MahlerDuality.lean` (251, 257); `existsUnique_integral_iff_norm_le_one`, `Measure/IntegralUnitBall.lean` 84, word for word (264); `phiMeasure` 83 and `amiceTransform_phiMeasure` 144, `Measure/PhiPsi.lean` (270, 274); `TauCeti.AnalyticStage`, `Distribution/AnalyticStage.lean` 107, the same carrier `C₀(ZMod (p ^ h) × ℕ, E)` (288, 292); `amiceDualNorm`, `Distribution/Amice/Norm.lean` 231, with `gaussNorm_amiceRadius_le_amiceDualNorm` 289 and `amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ` 297 (297–312); `TauCeti.WeightSpace`, `NumberTheory/Padics/WeightSpace.lean` 81, `coord` 156, `weightTest` 94, `ofCoord` 229, `weightSpaceEquiv` 287 (333, 336, 356, 367); `AbstractMeasure.characterIntegralAlgHom`, `Measure/CharacterIntegral.lean` 92 (371, 374). Serre's theorem is `isONable_iff_discrete_norm`, `Bases/DiscreteNorm.lean` 46 and `isPotentiallyONable_of_discrete_norm` 67. The §0.4 Check `(ℤ_p, p², p)` (README 1089) is `TauCeti.Huber.tateGauge_subring_sq_values_and_not_mul`, `NumberTheory/Padics/TateGauge.lean` 55. None of these files exists at the previous pin `358314d4`.

Not at the pin, by the same reading: Amice's basis theorem itself (`Distribution/Amice/Basis.lean` 494 builds `amiceMap : C₀(ℕ, E) →L[S] AnalyticStage p h E`; its docstring says the isometric isomorphism is not proved there); the adic-target universal character of §5.3 (`WeightSpace.ofCoord` needs a normed `ℤ_p`-algebra); separation of field-valued measures on `ℤ_pˣ` by weights (`measureFun_injective`, `Measure/Units/WeightIntegral.lean` 113, is for integral measures); the unbounded Amice bijection of §4.7 (`Distribution/LocallyAnalytic.lean` puts no topology on the direct limit); §5.5–§5.6.

Repair: delete from `Suggested.lean` every declaration listed above and cite the pinned name instead; keep `exists_character_of_hasEval` and `measurePairing_injective`, and add the two headlines statable with pinned carriers and absent: Amice's theorem, `Function.Bijective (TauCeti.AnalyticStage.amiceMap p h S)` together with `‖amiceMap c‖ = ‖c‖` for complete ultrametric `E` with contractive `ℤ_p`-action, and the integral case of §4.4. Rewrite "Existing foundations" as `## Exact supplier contracts` listing these files and names, and turn every section the pin proves into a citation (a target that exists in the library is deleted and listed under Scope as supplied); what remains as targets is §4.4 (Amice's theorem), §4.7 (the unbounded transform), the adic universal character and `Λ`-specialisation of §5.3, §5.5–§5.6, §2.7 only where `ZeroAtInfty/Triangular.lean` stops. The docstring then names the §4.7 bijection as not statable (no carrier for `LA(ℤ_p,K)` with its topology).

## R02 (P2) — Upward supplier: LocallyAnalyticDistributions §0.0 feeds §2.4

Location: README line 44 ("and LocallyAnalyticDistributions §0.0 supply the completed-tensor carriers and"), 471–474 ("Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0"), 1052–1055 ("LocallyAnalyticDistributions §0.0 supplies the general completed tensor construction and its functoriality. Only the last corollary of §2.4 consumes it").

Claim: the completed-extension corollary of §2.4 takes its tensor carrier from LocallyAnalyticDistributions §0.0.

Witness: the dependency check rerun on this head:

```
UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#64) at README lines [1052]
depcheck: 240 roadmaps, 2351 edges, 1 problem(s)
```

LocallyAnalyticDistributions is merge-order line 65 and is on neither `TauCetiRoadmap/` nor `Completed/` of main (eaf17b1); it consumes this roadmap (§1.4, §2.1–§2.2, §2.6, §4.3–§4.4, §4.7): a cycle.

Repair: the carrier is at the pin: `TauCeti.Huber.BanachModule.CompletedTensor A V W`, `RingTheory/Huber/BanachModule/CompletedTensor.lean` 201 (`Completion (V ⊗[A] W)`, no hypothesis on `A`, `V`, `W`), with `lift` 314, `map` 383, `lid` 346, `finiteProjectiveEquiv` 454. Cite it at lines 44 and 471–474, keep AdicSpacesPartII R0.3 only for the comparison it states, delete the bullet at 1052–1055, and reword 697–698, 808–809, 815–816 so LocallyAnalyticDistributions appears only as a consumer.

## R03 (P2) — The loop with PadicMeasuresIwasawaAlgebras is not cut

Location: README lines 927–938 ("use the general coefficient-extension interface … Use the supplier's coefficient extension for `extendIntegralMeasure`"), line 32 (scope row "Measures": coefficient extension and the measure/completed-group-algebra comparison from PadicMeasuresIwasawaAlgebras Layers 0–1), 559–560 ("General integration and measure topologies come from PadicMeasuresIwasawaAlgebras Layers 0–1").

Claim: after this pull request PadicFunctionalAnalysis no longer consumes PadicMeasuresIwasawaAlgebras.

Witness: PadicMeasuresIwasawaAlgebras on main (eaf17b1) lines 94–95 name this roadmap's §§3.4 and 5.1–5.3 as its supplier for the Amice and completed-group-algebra coordinates, and its supplier table line 367 lists `extendIntegralMeasure, weightTest, measureFun, measureFun_norm_le, measureFun_injective` from this §5.3; its Layer 1 `completedGroupAlgebraBaseChange` (982–990) is the "supplier's coefficient extension" §5.3 uses. Each roadmap consumes the other; the check does not see it because both are on main.

Repair: the extension is at the pin: `AbstractMeasure.extendCoefficients j hj : D(X, O) →+ D(X, K)`, `NumberTheory/Padics/Measure/ExtendCoefficients/Basic.lean` 239 (profinite `X`, `‖j a‖ ≤ 1`), with `norm_toCLMEquiv_extendCoefficients_le` 365 and `existsUnique_apply_comp_eq_iff_norm_le_one` 421; `TauCeti.measureFun : D(ℤ_[p]ˣ, ℤ_[p]) →+* (WeightSpace p K → K)`, `Measure/Units/WeightIntegral.lean` 77, `norm_measureFun_le` 126, `norm_measureFun_le_one` 137, `measureFun_injective` 113. Cite these at 927–938, reword line 32 so PadicMeasuresIwasawaAlgebras appears only as a consumer, and 559–560 as a deferral. The README's Check at 1039–1040 (`δ_a` has extended norm one) is `TauCeti.norm_measureFun_dirac`, line 106 of that file.

## R04 (P3) — Gate: `Mathlib.<submodule>` imports, no `import Mathlib`

Location: `Suggested.lean` lines 1–16 (`import Mathlib.Analysis.Normed.Group.Ultra` … `import Mathlib.RingTheory.Noetherian.Defs`); gate rules `imports`, `mathlib-subimports` (16), `no-import-mathlib`, and the 16 "designed for use with the module system" warnings (32 lines in the worker's targeted build).

Repair: replace lines 1–16 by `import Mathlib`, keep lines 17–18 (`TauCeti.RingTheory.Huber.Basic`, `TauCeti.NumberTheory.Padics.PadicIntegers`, both at the pin), and add the `TauCeti.*` modules the kept headlines of R01 need (`TauCeti.NumberTheory.Padics.Distribution.Amice.Basis`, `TauCeti.NumberTheory.Padics.WeightSpace`). To clear the module-system warnings the gate counts, write the file in module form (`module`, `public import Mathlib`, `@[expose] public section`), as TypeAHeckeAlgebras on main does.

## R05 (P3) — Gate: an admitted `example`

Location: `Suggested.lean` lines 317–325 (`example (h : ℕ) : let F : PowerSeries ℚ_[p] := … := by sorry`).

Witness: gate rule `sorry-examples`; `lake env lean` reports `declaration uses sorry` at 318:0. An admitted example tests nothing.

Repair: delete it; the README keeps the derivative-functional Check (823–825).

## R06 (P3) — Pull-request numbers and process links in the README

Location: lines 29–31 (pull requests #854, #919, #926), 37, 40, 43 (#817, #813), 158, 166, 170–171 (Mathlib pull requests #42865, #42836, #23772, #23791), 1106–1118 ("Existing Lean work", a pinned commit hash, "Coordinate integration with the author"), 1120–1121 (fork links pinned to commits). Gate rule `prnum` (5 lines: 29, 30, 31, 158, 166).

Witness: the two objects the Mathlib links promise exist at the pins: `AbstractMeasure.amiceTransformₐ` and `amiceTransformEquivₐ`, Mathlib `NumberTheory/Padics/Measure/AmiceTransform.lean` 215 and 231; the ring-scalar operator norm, `ContinuousLinearMap.ringOpNorm`, Tau Ceti `Analysis/Normed/Operator/RingOpNorm.lean` 149.

Repair: cite roadmaps by name and section (RestrictedPowerSeries, NewtonPolygons, AdicSpacesPartII R0.3/R0.4, AdicSpacesPartIII R3.6, LocallyAnalyticDistributions as a consumer), cite the two pinned declarations, delete lines 1106–1121.

## R07 (P3) — README and `Suggested.lean` disagree on declared names

Location: README backticked names of this roadmap's own that the Lean file does not declare (README/Lean counts recomputed at this head): `pMultiplesIndicator`, `weightMeasure`, `existsUnique_psiMeasure` 1/0 (638–639), `eq_aeval_binomialSeries` 1/0 (903), `nonempty_weightSpace_equiv` 1/0 (862), `extendIntegralMeasure` 2/0, `measureFun`, `measureFun_norm_le`, `measureFun_injective` 1/0 (934–938), `isLinearTopology_padicInt` 1/0 (916), `isBoundedSMul_padicInt_padic` 1/0 (621), `amiceTransform_completedGroupAlgebra_compat` 1/0 (923), `NormedRing.IsTate`, `NormedRing.PseudoUniformizer` (71–73; at the pin `TauCeti.NormedRing.IsTate` / `.PseudoUniformizer`). Lean declarations the README never names (0/1): `IsDiscRealization`, `single`, `IsMultiplicative`, `IsTate`, `IsOrthonormalFamily`, `TCoord`, `q`, `matrixCoeffInputFirst`, `opNorm`, `le_opNorm`, `opNorm_eq`, `nonempty_mahler_coordinates`, `coeff_amiceTransform_eq_mahlerTerm`, `measurePairing_norm_le`, `measurePairing_injective`, `exists_linearIsometryEquiv_of_isOrthonormalBasis`, `exists_isOrthonormalBasis_iff`.

Witness: the grep counts above; `isLinearTopology_padicInt` is the pinned instance `TauCeti.Huber.instIsLinearTopology`, `RingTheory/Huber/Padic/Basic.lean` 87; `pMultiplesIndicator`, `existsUnique_psiMeasure`, `measureFun` and friends are pinned (R01, R03).

Repair: after R01, every backticked name of this roadmap's own in the README is a declaration of `Suggested.lean`; library names are cited as such.

## R08 (P3) — Padding in `Suggested.lean`

Location: `PseudoUniformizer.isTopologicallyNilpotent` (70), `.isPseudoUniformizer` (75), `.isTateRing` (81), `opNorm_eq` (137), `nonempty_mahler_coordinates` (238), `coeff_amiceTransform_eq_mahlerTerm` (244), each proved by one term or one tactic from the library (`tendsto_pow_atTop_nhds_zero_of_norm_lt_one`; the two-field constructor; `rfl`; `PadicInt.mahlerEquiv`, Mathlib `NumberTheory/Padics/MahlerBasis.lean` 353; `AbstractMeasure.coeff_amiceTransform`, `AmiceTransform.lean` 83). The sorried declarations of the R01 list close by `exact` with the pinned declaration named there.

Repair: delete them; the README keeps the statements.

## R09 (P3) — Lean form

Location: module docstring lines 20–40 ("representative interfaces", "not an exhaustive checklist", "Do not import this roadmap prototype into production mathematics"); `open scoped ZeroAtInfty Classical PowerSeries.WithPiTopology` at 45; no docstring at lines 53, 100, 106, 111, 119, 131, 137, 163, 189, 213, 220, 251, 257, 264, 270, 274, 288, 297, 300, 312, 331, 333, 336, 356, 367, 374.

Repair: docstring "P-adic functional analysis: target signatures" saying the roadmap is README.md, that the file states the headline theorems against the pinned APIs, and which are not statable (R01); a docstring with the mathematics and source on every kept declaration; drop the global `Classical`.

## R10 (P3) — README shape

Location: no `## Exact supplier contracts`, `## How to read the build`, `## Downstream consumers`; no `*Needs:*` line on any target; layers end in bold "Dependencies." paragraphs rather than `### Examples` and `### Dependencies`; definitions carry no API bullets; process wording at 17–22 ("Suggested homes", "representative interfaces", "not an exhaustive checklist"), 48–49 ("the prototype imports library modules"), 154 ("the prototype proves"), 161, 173–174, 182 ("when available"), 269 ("Reuse `IsTateRing.of_isUnit_norm_lt_one` when that native comparison is available": it is, `RingTheory/Huber/Normed.lean` 265), 1110–1113.

Repair (minimum for the text this pull request touches): a `*Needs:*` line and a locator on the §5.3 comparison paragraph (918–925): "§3.4 the integral Amice equivalence (`AbstractMeasure.amiceTransformEquiv`), the pinned `AbstractMeasure.completedGroupAlgebraEquiv` (`Measure/CompletedGroupAlgebra.lean` 449) and ProfiniteProPGroups Layer 9 `powerSeriesCoordinate`" with [RJW] Proposition 3.16 (RJW line 816) and Theorem 3.25 (RJW line 959). The reshaping of the whole README follows R01.

## Previous findings

- R01 — not repaired: `Suggested.lean` lines 53–381 and README Layers 0–5 unchanged; the pinned files and lines of the table (Tau Ceti `2fd255d9`) re-opened this round and all present. Re-raised as R01.
- R02 — not repaired: lines 44, 471–474, 1052–1055 unchanged ("Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0"); the dependency check prints the same UPWARD line. Re-raised as R02.
- R03 — not repaired: lines 927–938 unchanged ("Use the supplier's coefficient extension for `extendIntegralMeasure`"); line 32 and 559–560 still name PadicMeasuresIwasawaAlgebras Layers 0–1 as suppliers. Re-raised as R03.
- R04 — not repaired: lines 1–16 are still sixteen `import Mathlib.<submodule>` lines; no `import Mathlib`. Re-raised as R04.
- R05 — not repaired: the admitted `example` at 317–325 remains. Re-raised as R05.
- R06 — not repaired: lines 29–31, 37, 40, 43, 158, 166, 170–171, 1106–1121 unchanged; gate `prnum` lists the same five lines. Re-raised as R06.
- R07 — not repaired: the counts are unchanged (recomputed: twelve README-only backticked names, two that exist only under `TauCeti.NormedRing.`, seventeen Lean-only declarations). Re-raised as R07.
- R08 — not repaired: the six one-tactic declarations remain at 70, 75, 81, 137, 238, 244. Re-raised as R08.
- R09 — not repaired: docstring 20–40, `Classical` at 45 and the undocumented declarations are unchanged. Re-raised as R09.
- R10 — not repaired: no supplier-contract, build-order or consumer sections, no `*Needs:*` lines, the process wording at 17–22, 48–49, 154, 161, 173–174, 182, 269, 1110–1113 unchanged. Re-raised as R10.
- R11 — repaired (stays repaired): `git diff --stat origin/main...HEAD` outside the pull request's fourteen folders is empty at this head.

## Verified sound

**The change since b0ef636.** `git diff --stat b0ef636..HEAD -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty; `lake-manifest.json` at b0ef636 and at this head both pin Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the revisions checked out under `.lake/packages`. The only files changed since b0ef636 are the two ClassifyingSpaces files, a sibling folder of this pull request; the README of this roadmap never names ClassifyingSpaces, so nothing here depends on that change. Against main the folder diff is README 13 insertions, 11 deletions (the §5.3 paragraph, the Layer 5 Dependencies sentence and the two consumer bullets), `Suggested.lean` untouched. Everything outside the pull request's fourteen folders is unchanged against main.

**Gate, dependency check and elaboration at this head.** The worker's gate: `set_option=0 … prnum=5 sorry-examples=1 … imports=1 mathlib-subimports=16 no-import-mathlib=1 … depcheck=1 … outside-folder=0 … build=32 FAIL` (the 32 build lines are the 16 module-system warnings printed twice). My rerun of `gate … --base origin/main` (text scanners and depcheck, no `--build`): the same counters, with `outside-folder=18`, which are the pull request's own sibling folders, not a finding. The dependency check output is quoted in R02 (no CYCLE line, one UPWARD line). `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0 in 3.5 s with 20 `declaration uses sorry` warnings at lines 100, 106, 111, 119, 131, 176, 183, 213, 220, 251, 257, 264, 274, 307, 312, 318, 344, 356, 374, 380 (the same lines as at b0ef636) and no error.

**Elaborated signatures.** The file is byte-identical to the one the previous review checked, so the worker's four "dropped binder" leads are the same four (`exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`) and are false positives: `include ha hϖ hnil hb` at line 98 carries them and the elaborated types in `scratch/signatures.md` show `1 < a → ↑ϖ ∈ A₀ → IsTopologicallyNilpotent ↑ϖ → (nhds 0).HasBasis … →`. No `#check` rerun was needed for an unchanged file.

**One-tactic probe.** Not rerun on an unchanged file: the previous report's probe (every `:= by sorry` replaced by `first | rfl | simp | infer_instance | sorry`) closed nothing; the padding of R08 is the six already-proved one-term declarations, re-read at lines 70–82, 137–140, 238–249 this round.

**Library declarations opened at the pins this round** (Tau Ceti `2fd255d9`, file and line, each confirmed to hold the named declaration): `Analysis/Normed/Ring/PseudoUniformizer.lean` 136, 150; `RingTheory/Huber/TateGauge/Basic.lean` 78, 355; `Analysis/Normed/Operator/RingOpNorm.lean` 149; `Analysis/Normed/Module/Bases/Orthonormal.lean` 463; `Bases/DiscreteNorm.lean` 46; `Bases/Splitting.lean` 87; `Topology/ContinuousMap/ZeroAtInfty/FiniteCoordinates.lean` 95; `NumberTheory/Padics/Measure/MahlerDuality.lean` 201; `Measure/IntegralUnitBall.lean` 84; `Measure/PhiPsi.lean` 144; `Distribution/AnalyticStage.lean` 107; `Distribution/Amice/Norm.lean` 231; `Distribution/Amice/Basis.lean` 494; `NumberTheory/Padics/WeightSpace.lean` 81; `Measure/CharacterIntegral.lean` 92; `RingTheory/Huber/BanachModule/CompletedTensor.lean` 201; `Measure/ExtendCoefficients/Basic.lean` 239; `Measure/Units/WeightIntegral.lean` 77, 113; `Measure/CompletedGroupAlgebra.lean` 449; `RingTheory/Huber/Normed.lean` 265. The remaining lines of the R01 witness are carried from the previous report, which opened them at the same pin.

**Suppliers resolved on main (content at eaf17b1).** `LocallyAnalyticDistributions` is on neither `TauCetiRoadmap/` nor `Completed/` (R02; merge-order line 65, this roadmap being "on main" to the check). PadicMeasuresIwasawaAlgebras lines 94–95 and 367 re-read for R03. The worker's citation check found no cross-roadmap citation or Lean name nowhere.

**Overlaps.** #1808 conflicts with #1807 only in `ClassifyingSpaces/README.md` and the two RigidAnalyticGeometry files, not in this folder. #1854 ("Cut the dependency loops main acquired after the pin bump") also carries this folder: `roadmaps show PadicFunctionalAnalysis --pr 1854` is byte-identical to the README at this head (`diff` exit 0, 1121 lines), so the two heads merge cleanly and neither restates the other; the order between them does not matter for this folder. No id this README cites is dropped by an open pull request, none is defined only by an open revision, and this pull request drops no id other roadmaps cite. Ownership against the open pull requests beyond the previous reviews' grep was not rechecked, since no passage of the folder changed and the new owner of R01–R03 is the pinned library itself.

**Seeded sample.** No sampled target lies in a changed passage (the folder has none). The sampled sections owned at the pin are matched to it as in the previous report: 0.3 (`Analysis/Normed/Ring/PowerComparison.lean`, JN Lemmas 2.1.6–2.1.7 in its header), 1.1 (`RingOpNorm.lean` 149, 340), 1.4 (`FiniteCoordinates.lean` 95), 2.1 (`Orthonormal.lean` 130, 413, 463), 2.2 (`PotentiallyONable.lean` 74, 89, 211), 2.3 (`DiscreteNorm.lean` 46, 67), 2.5 (`ZeroAtInfty/{Dual,UltrametricDual}.lean`), 3.2 (Mathlib `MahlerBasis.lean` 353 and `MahlerBasis/Polynomial.lean` 36 at Tau Ceti), 4.1 (`AnalyticStage.lean` 107–248), 4.3 (`AnalyticStage.transition` 373), 4.4 (`Amice/Basis.lean` 494: the map, not the theorem), 4.6 (`Amice/Character.lean` 161, 279), 5.3 (`WeightSpace.lean`, `WeightIntegral.lean`, `CompletedGroupAlgebra.lean` 449). 5.5 and 5.6 are not at the pin; their rows below stand from the first review.

**Adversarial table.** No statement of the folder changed; every row is carried from the previous report (r16, itself carrying r7 and r1), with its values. `g` is `tateGauge`. "pin" in the last column records that the pinned library proves the row's statement (R01).

| Statement | Instance | Left | Right | Result | Change |
| --- | --- | --- | --- | --- | --- |
| §5.3 composite `δ_a ↦ [γ^a]`, `T = [γ]−1` (this PR; r16) | `a = 0, 1`; `p = 2`, `q = 4`, `γ = 5` | `δ_0 ↦ 1 ↦ [1]`, `δ_1 ↦ 1+T ↦ [γ]`; `5` generates `1+4ℤ_2` | `[γ^0] = [1]`, `[γ^1]` | agrees | pin: `completedGroupAlgebraEquiv`, `toCompletedGroupAlgebra_dirac` 133 |
| same, generator change (r16) | `γ' = γ^u`, `u ∈ ℤ_pˣ` | `T' = (1+T)^u − 1` | PPG L9 `exists_isUnit_powerSeriesCoordinate_eq_subst` | agrees with §5.2 877–878 | none |
| §2.7 triangular perturbation (r16) | `M = 1 + pS` at `p = 2`; `M` with `p` below the diagonal everywhere | `(1+pS)⁻¹ = Σ(−pS)^k`, norm 1 | second: column `j` not null | first isometric automorphism, second excluded | pin: `ZeroAtInfty/Triangular.lean` 233 |
| §3.2 character coefficients (r16) | `χ = (1+t)^x`, `n = 0,1,2` | `Δ^nχ(0) = t^n`: `1, t, t²` | `(χ(1)−1)^n` | agrees | none |
| §4.6 criterion (r16) | `p = 2`, `t = 2`, `h = 0, 1` | `‖2‖ = 1/2 < 2^{−1/2^h}`: false at 0, true at 1 | `3^x = (−1)^x(−3)^x` | `3^x ∈ LA_1 \ LA_0` | pin: `tendsto_amiceCharCoeff_iff` 161 |
| §4.6 second form (r16) | same | `‖3^{2^h} − 1‖`: `1/2`, `1/8` | first form | agrees | none |
| §5.5 Gauss norm (r16) | `p = 2`, `h = 2`, `‖ℓ‖ < 1/2` | coefficient valuation `2(n−1) − v(n) ≥ 0` | constant term 1 | Gauss norm 1 | none |
| §0.4 Check `(ℤ_p, p², p)` (r16) | `x = p, p²`, `ϖ = p²` | `g(p) = 1`, `g(p²) = p⁻¹` | README `1, p⁻¹` | `g(p)² ≠ g(p²)` | pin: `tateGauge_subring_sq_values_and_not_mul` |
| §0.4 membership `ϖ ∈ A₀` (r16) | `ℚ_p²`, `A₀ = {x ≡ y mod p²}`, `ϖ = (p, p²)` | `g(1) = 1`, `g(ϖ) = a⁻¹`, `g(1+ϖ) = a²` | `a² > max(1, a⁻¹)` | ultrametricity fails; `hϖ` present | pin: `exists_tateSeminorm` has `hϖ` (line 355, re-read) |
| §0.4 `N(x) = max(|x|, |x|²)` (r16) | `|ϖ| = r < 1` | `N(ϖ)N(ϖ⁻¹) = r⁻¹` | `> 1` | no multiplicative pseudo-uniformiser | none |
| `tateGauge_rpow` (r16) | `x = 0`; `x` with `n_x` | `0`; `b^{−n_x}` | `0^{log b/log a}`; `(a^{−n_x})^{log b/log a}` | agrees | pin 191 |
| `tateGauge_eq_zero_iff` (r16) | `ℚ_p`, `A₀ = ℤ_p`; indiscrete `A` | `g x = 0 ⇔ x = 0`; `g ≡ 0` | `T2`; closure{0} = A | agrees both ways | pin 390, 399 |
| `tateGauge_equiv` (r16) | `ℚ_p²`, `ϖ = (p,p)`, `A₀ = ℤ_p²`, `B₀ = {x ≡ y mod p}` | `g_A ≤ g_B ≤ a·g_A` | `C = a` | holds | pin 376 |
| §0.2 Neumann (r16) | `‖x‖ < 1`; `x = 0` | `‖(1−x)⁻¹‖ = 1`, `‖(1−x)⁻¹−1‖ = ‖x‖` | `1`; `0` | agrees | none |
| §0.3 power comparison (r16) | JN 2.1.7, `|ϖ|₂ = |ϖ|₁^s` | `C₁|a|₁^s ≤ |a|₂ ≤ C₂|a|₁^s` | README | agrees | pin: `PowerComparison.lean` 108 |
| `le_opNorm` (r16) | `R = ℤ_p`, `u = id : (ℤ_p, |·|²) → (ℤ_p, |·|)`; `M = 0` | `sInf ∅ = 0`; `0 ≤ 0` | — | `IsTate R` excludes the first | pin: `le_ringOpNorm` 340 |
| `exists_isOrthonormalBasis_iff` (r16) | `I = ∅`; zero ring; incomplete `c₀` | `M = 0`; `‖1‖ = 1 ≠ 0`; no isometry | `C₀(∅,R) = 0`; excluded; `CompleteSpace` | agrees | pin 463 (re-read: `[CompleteSpace R]` in the signature) |
| `exists_finset_norm_le` (r16) | `P = 0`; `P = R·single i₀ 1` | `S = ∅, C = 1`; `S = {i₀}, C = 1` | `0`; equality | holds | pin: `FiniteCoordinates.lean` 95, `C = 1` |
| `exists_continuousLinearEquiv_prod_of_countableType` (r16) | `M = 0`; `K⟨T⟩` constants | `d = (0, id)`; Schneider splitting | — | holds | pin: `Splitting.lean` 87 |
| §2.6 adapter (r16) | 2×3 and 3×2 over `ℚ_p` | `A(u∘v) = A(u)A(v)` | transpose reverses | consistent with LAD Convention 2 | pin: `matrixCoeff` output-first |
| §3.2 Mahler of `x²` (r16) | `x² = x + 2·x(x−1)/2` | `binom(x,1) + 2 binom(x,2)` | same | agrees | pin: `MahlerBasis/Polynomial.lean` 36 |
| §3.4 `x^p − x` (r16) | `x = 1+p` | valuation 1 | sup `p⁻¹`, Gauss `1` | agrees | none |
| `existsUnique_integral_iff_norm_le_one` (r16) | `δ₀`; `p⁻¹δ₀`; `‖f‖ = p^{−j}` | `1`; `p`; `ν(f) = p^{j}μ(g)` | `≤ 1`; false; `‖ν f‖ ≤ p^{−j}` | agrees | pin: `IntegralUnitBall.lean` 84 (re-read) |
| `amiceTransform_phiMeasure` (r16) | `δ₁`, `δ₀`, `0` | `(1+T)^p`, `1`, `0` | `subst((1+X)^p−1)` | agrees | pin: `PhiPsi.lean` 144 (re-read) |
| §3.4 `φ, ψ` at `p = 3` (r16) | `δ₂`, `δ₆`, `δ₁` | `φδ₂ = δ₆`, `ψδ₆ = δ₂`, `ψδ₁ = 0` | README | agrees | pin: `psiMeasure_dirac_mul` 255, `psiMeasure_dirac_of_not_dvd` 260 |
| `norm_toCLMEquiv_eq_iSup_coeff` (r16) | `δ_a` | `1` | `sup_n ‖binom(a,n)‖ = 1` | agrees | pin: `MahlerDuality.lean` 201 (re-read) |
| §4.3 transition (r16) | `k = 1`, `w = b + pv` | `d_0 = Σ bᵏc_k`, `d_1 = Σ k b^{k−1} p c_k` | contraction `p^j` | agrees | pin: `AnalyticStage.transition` 373 |
| §4.4 `E = 𝔽_p` (r16) | `x^p − x` | `d_(a,0) = a^p − a = 0` | nonzero vector | injectivity needs `p`-torsion-freeness | pin: `eval_injective` needs `IsSMulRegular E p` |
| `amiceDiscNorm ≤ amiceDualNorm` (r16) | Legendre | `v_p(m!) ≤ n/((p−1)p^h)` | termwise | holds | pin: `Amice/Norm.lean` 289 |
| `amiceDualNorm ≤ p · amiceDiscNorm (h+1)` (r16) | `n = p^h`, `p^{h+1}`, `m = p^k − 1` | `1 ≤ p·p^{−1/(p−1)}` etc. | — | holds; factor `p` necessary | pin 297 |
| both inequalities, junk (r16) | `‖coeff n‖ = p^{v_p(n)}` | both suprema finite | — | `hF` prevents junk `⨆` | pin uses `BddAbove`/`HasGaussNorm` |
| §4.7 `b_n = 1/n!` (r16) | `h = 0, 1` | `D_0 = 1`, `D_1 = ∞` | README | agrees | none |
| §4.6/4.7 `‖t‖ = 2^{−1/2}` (r16) | `p = 2`, `h = 1, 2` | thresholds `2^{−1/2}, 2^{−1/4}` | fails level 1, passes 2 | agrees | pin: `Character.lean` 177 |
| §5.2 conductor valuations (r16) | odd `p`, `m ≥ 2`; `p = 2`, `m ≥ 3` | `1/(p^{m−2}(p−1))`; `1/2^{m−3}` | README | agrees | none |
| §5.4 equivalence (r16) | exponent `p^{h−v_p(q)}` | `p^{−1/((p−1)p^{h−v_p(q)})}` | `p^{−q/(p^h(p−1))}` | agrees | none |
| `exists_character_of_hasEval` (r16) | `x = γ`; zero ring | `κ γ = 1+z` | first conjunct | holds | none (not at the pin) |
| `existsUnique_character_of_norm_lt_one` (r16) | dual numbers, `‖ε‖ = 1` | excluded by `‖z‖ < 1` | README Check 1029–1031 | as intended | pin: `ofCoord` needs `Tendsto (t^n) → 0` |
| `measurePairing_norm_le` (r16) | `κ` continuous on compact `ℤ_pˣ` | `‖κ(x)‖ ∈ {1}` | bound | holds | pin: proof of `norm_measureFun_le` |
| `measurePairing_injective` (r16) | `δ_a − δ_b` | `0` at `κ = 1`; `a − b` at `κ(x) = x` | — | separates | none (integral case pinned, `measureFun_injective` 113 re-read) |
| §5.6 gauge (r16) | `A₀ = H`, `ϖ = T`, `a = α⁻¹` | `‖T‖ = α`, `‖U‖ = 1`, `‖p‖ = α` | README | agrees | none |
| §5.6 evaluation at `t` (r16) | `p⁻¹ < |t| < 1` | `|d_m||t|^m ≤ (p|t|)^{−|m|}` | `→ 0` iff `p|t| > 1` | annulus right | none |
| §5.3 extension (R03) (r16) | `ν = δ_a` to `ℂ_p` | `‖ν_{ℂ_p}‖ = 1`, `κ(a)` | `|κ(a)| = 1` | elementary | pin: `norm_measureFun_dirac` 106 |

## Not verifiable

- [Sch] Schneider, *Nonarchimedean Functional Analysis* (Springer): settled as uncertified; cited by locator only.
- [Bel] Bellaïche, *The Eigenbook* (Birkhäuser): settled as uncertified; cited by locator only.
- [BGR] Bosch–Güntzer–Remmert (Springer): settled as uncertified; its 2.7.1/4 and 3.7.2–3.7.3 are relayed through Conrad line 300 and JN lines 423–428.
- [Mah] is an OCR'd scan; Theorem 1 at lines 156–160 is legible, the displayed formula only partly.
- Elaboration of the pinned Tau Ceti names in the R01 witness was not run: none of those modules has an object file in the worktree, and building them is a multi-module compile outside what an unchanged folder needs. The witnesses are the pinned source files at the lines given, each opened this round.

## Source issues

- **Gap** in KL at Remark 2.4.4, arXiv v5 p. 39: the source says that for any ring of definition `A₀` and topologically nilpotent unit `z` the function `inf{cⁿ : z⁻ⁿx ∈ A₀}` is a Banach-ring norm; it should require `z ∈ A₀` (or a power of `z` in `A₀`), since otherwise the ultrametric inequality can fail (`ℚ_p²`, `A₀ = {x ≡ y mod p²}`, `z = (p,p²)`); affects a stated result. The roadmap (README line 1089) and the pinned `TauCeti.Huber.exists_tateSeminorm` both add the hypothesis.
- **Error** in JN at Lemma 2.1.6, published version (JN footnote 3, line 500): the source says the published statement of the lemma is incorrect; it should be the arXiv v4 statement with the two-regime bound `|a|_ϖ ≤ C₁` for `|a|_π < 1` and `|a|_ϖ ≤ C₂|a|_π^s` otherwise; affects a stated result; corrected in print at arXiv:1604.07739v4 Lemma 2.1.6.
