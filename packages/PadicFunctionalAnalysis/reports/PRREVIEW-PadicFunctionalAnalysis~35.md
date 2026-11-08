# Review of PadicFunctionalAnalysis (pull request #1808 at c9403e2)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since `d1a45bf`. Three things are unchanged since the previous review:
- the folder: `git diff d1a45bf c9403e2 -- TauCetiRoadmap/PadicFunctionalAnalysis` is empty;
- the pins: `lake-manifest.json` is unchanged;
- every consumer and pinned declaration that the previous witnesses cite: each is re-found at its cited line.

So none of R01–R12 is repaired, and each is restated below under its own number. The push gate fails on these checks:
- `prnum` (5);
- `sorry-examples` (1);
- `imports`, `mathlib-subimports` (16) and `no-import-mathlib`;
- `depcheck` (1 UPWARD);
- `outside-folder` (2).

The pull request's own hunk in this folder (§5.3, the Layer 5 dependencies and the dependency-order paragraph) is unchanged. The hunk is already contained, in repaired form, in the other open pull request that rewrites this folder (R12).

## R01 (P1) — Supply cycles: completed tensors, the distribution product and coefficient extension

**Location.** `TauCetiRoadmap/PadicFunctionalAnalysis/README.md` lines 471–476: "Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0, and compare it by the universal property with the Banach-module completed tensor of AdicSpacesPartII §R0.3." The same cycles are at:
- lines 43–46, 814–816 and 1052–1055;
- lines 32, 559–560 and 927–937, which take measure calculus and coefficient extension from PadicMeasuresIwasawaAlgebras Layers 0–1.

**Claim.** Three roadmaps are cited here as suppliers, and each of them consumes this roadmap. LocallyAnalyticDistributions is also an open pull request cited as a supplier by a roadmap on main.

**Witness.** The dependency check prints `UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#44) at README lines [1052]`. The suppliers cite this roadmap back:
- LocallyAnalyticDistributions (its head), lines 175–177: §§4.3, 4.4, 4.7.
- `TauCetiRoadmap/AdicSpacesPartII/README.md` line 340: §0.4.
- `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` lines 352–362: §3.4.

**Repair.** This is unchanged from the previous review:
- (a) Delete everything that serves only the completed-extension corollary of §2.4:
  - lines 471–479;
  - the paragraph at lines 43–46;
  - the first bullet of "Dependency order and completion" (lines 1052–1055);
  - the completed-tensor clause of the Layer 2 dependencies.

  AdicSpacesPartIII R3.6 owns that transport (`TauCetiRoadmap/AdicSpacesPartIII/README.md` line 606: "Transport of PadicFunctionalAnalysis §2.4's splitting to Part II's Banach completed tensor"). Keep only the sentence that §2.4 supplies the `countable-type-closed-subspace-section` interface.
- (b) Delete the comparison with "the general distribution product supplied later by LocallyAnalyticDistributions §1.4" (lines 814–816).
- (c) In the scope row "Measures", §3.1 (lines 559–560) and §5.3 (lines 927–937), take coefficient extension from the pinned Tau Ceti:
  - `AbstractMeasure.extendCoefficients` (`NumberTheory/Padics/Measure/ExtendCoefficients/Basic.lean:239`);
  - `TauCeti.measureFun` (`NumberTheory/Padics/Measure/Units/WeightIntegral.lean:77`).

  Then list PadicMeasuresIwasawaAlgebras only as a consumer.

After (a)–(c), the dependency check has no UPWARD line, and no supplier of this roadmap also consumes it.

## R02 (P2) — Results the pinned Tau Ceti proves are restated as open targets

**Location.**
- `Suggested.lean` lines 53–121, 127–140, 154–229, 251–278, 297–315 and 331–381.
- README §0.4 lines 299–300: "Retain the consumer names `tateGauge`, `exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`."
- README §§2.2–2.4, 3.4, 4.3–4.4, 4.7 and 5.1–5.3.
- "Existing foundations" (lines 141–188) cites none of the pinned declarations below.

**Claim.** The README lists the following as targets, and `Suggested.lean` states them with `sorry`, although the pinned Tau Ceti proves them:
- Tate gauges;
- the ring operator norm;
- orthonormal bases;
- Serre's theorem;
- countable-type splitting;
- Mahler duality;
- the integral unit ball;
- `φ` and `ψ`;
- the Amice stage norms;
- the weight space;
- `measureFun`;
- the measure/completed-group-algebra equivalence.

**Witness.** In the previous probe, 8 of the 20 admitted theorems closed with one `exact` of a pinned lemma. One example is `TauCeti.Huber.exists_tateSeminorm` (`RingTheory/Huber/TateGauge/Basic.lean:355`). The pins are unchanged, and every declaration below is at its cited line at this pin.

**Repair.** Add `## Exact supplier contracts` with `### From Tau Ceti`. Cite each of the following there and at its section, and delete the restated definitions and theorems from `Suggested.lean`:

| Restated here | Pinned declaration (Tau Ceti unless noted), file:line |
| --- | --- |
| `tateGauge`, `exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow` | `TauCeti.Huber.tateGauge`, `exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`, `RingTheory/Huber/TateGauge/Basic.lean:78, 355, 390, 376, 191` |
| `PseudoUniformizer`, `IsTate` | `TauCeti.NormedRing.PseudoUniformizer`, `IsTate`, `Analysis/Normed/Ring/PseudoUniformizer.lean:136, 150` |
| `opNorm`, `le_opNorm` | `ContinuousLinearMap.ringOpNorm`, `le_ringOpNorm`, `Analysis/Normed/Operator/RingOpNorm.lean:149, 340` |
| `IsOrthonormalFamily`, `IsOrthonormalBasis`, `IsONable`, `exists_isOrthonormalBasis_iff` | `Analysis/Normed/Module/Bases/Orthonormal.lean:95, 107, 116, 463` |
| `IsPotentiallyONable`, `HasPr` | `Analysis/Normed/Module/Bases/PotentiallyONable.lean:74, 89` |
| Serre's theorem (§2.3) | `TauCeti.isONable_iff_free_residueModule`, `Analysis/Normed/Module/Bases/ResidueBasis.lean:326` |
| `exists_continuousLinearEquiv_prod_of_countableType` | `TauCeti.exists_continuousLinearEquiv_prod_of_countableType`, `Analysis/Normed/Module/Bases/Splitting.lean:87` |
| `exists_finset_norm_le` | `Submodule.exists_finset_norm_le`, `Topology/ContinuousMap/ZeroAtInfty/FiniteCoordinates.lean:95` |
| `norm_toCLMEquiv_eq_iSup_coeff`, `mem_range_amiceTransform_iff` | `AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff`, `mem_range_amiceTransform_iff`, `NumberTheory/Padics/Measure/MahlerDuality.lean:201, 186` |
| `existsUnique_integral_iff_norm_le_one` | `AbstractMeasure.existsUnique_integral_iff_norm_le_one`, `Measure/IntegralUnitBall.lean:84` |
| `phiMeasure`, `amiceTransform_phiMeasure` | `AbstractMeasure.phiMeasure`, `amiceTransform_phiMeasure`, `Measure/PhiPsi.lean:83, 144` |
| `amiceDualNorm`, `amiceDiscNorm` and the two inequalities | `TauCeti.amiceDualNorm`, Mathlib `PowerSeries.gaussNorm` at `TauCeti.amiceRadius`, `gaussNorm_amiceRadius_le_amiceDualNorm`, `amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ`, `Distribution/Amice/Norm.lean:231, 289, 297` |
| `WeightSpace`, `TCoord`, `q`, `existsUnique_character_of_norm_lt_one` | `TauCeti.WeightSpace`, `.coord`, `weightSpaceEquiv`, `NumberTheory/Padics/WeightSpace.lean:81, 156, 287`; `TauCeti.padicUnitsDepth`, `NumberTheory/Padics/UnitsDecomposition/Logarithm.lean:75` |
| `measurePairing`, `measurePairing_norm_le`, `measurePairing_injective` | `TauCeti.measureFun`, `norm_measureFun_le`, `measureFun_injective`, `Measure/Units/WeightIntegral.lean:77, 126, 113` |
| §5.3, `Λ ≃ ℤ_p[Δ]⟦T⟧` | `TauCeti.completedGroupAlgebra.prodPowerSeriesCoordinate` (`Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/ProductCoordinate.lean`), `AbstractMeasure.completedGroupAlgebraEquiv` (`Measure/CompletedGroupAlgebra.lean:449`) |

What remains a target here includes:
- Amice's theorem (§4.4);
- the unbounded Amice bijection (§4.7);
- the transport of the product coordinate to `ℤ_pˣ`, with the adic universal character (§5.3).

## R03 (P2) — Statable headlines are absent, the adic character uses stand-ins, and the docstring names no unstatable headline

**Location.** `Suggested.lean`:
- lines 20–24: "# P-adic functional analysis: representative interfaces … not an exhaustive checklist";
- lines 288–295: `LocallyAnalytic` and `IsDiscRealization`, which no theorem uses;
- lines 331–354: a local `q`, `WeightSpace` and `TCoord`, a free `γ` and `e`, and the binder `[IsLinearTopology ℤ_[p] ℤ_[p]]`.

**Claim.** README lines 10–13 name the headlines:
- Serre's theorem;
- countable-type splitting;
- Amice's basis theorem;
- the bounded and unbounded Amice transforms;
- the universal character.

Amice's basis theorem is statable at the pins but is absent. The unbounded transform is neither stated nor named in the docstring as unstatable. The character is stated on local stand-ins.

**Witness.** The pinned `TauCeti.AnalyticStage.amiceMap` is at `NumberTheory/Padics/Distribution/Amice/Basis.lean:494`. A scratch file with `import Mathlib` and the two statements below elaborates at this head; see "Verified sound" for the output.

**Repair.** State these two theorems (tested at this head):

```lean
theorem amiceMap_isometry_and_surjective (h : ℕ) {E : Type*} [NormedAddCommGroup E]
    [Module ℤ_[p] E] [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E] :
    Isometry (TauCeti.AnalyticStage.amiceMap p h (E := E) ℤ_[p]) ∧
      Function.Surjective (TauCeti.AnalyticStage.amiceMap p h (E := E) ℤ_[p])

theorem existsUnique_weight_of_hasEval {S : Type*} [CommRing S] [UniformSpace S]
    [IsUniformAddGroup S] [IsTopologicalRing S] [IsLinearTopology S S] [CompleteSpace S]
    [T2Space S] [Algebra ℤ_[p] S] [ContinuousSMul ℤ_[p] S]
    (η : (ZMod (p ^ TauCeti.padicUnitsDepth p))ˣ →* Sˣ) {z : S} (hz : PowerSeries.HasEval z) :
    ∃! κ : TauCeti.WeightSpace p S, κ.finiteChar = η ∧ κ.coord = z
```

Then:
- Delete the local `q`, `WeightSpace` and `TCoord`, the free `γ` and `e`, and the linear-topology binder.
- Retitle the docstring "target signatures".
- Either state the unbounded Amice bijection on stage-bounded functionals on the pinned `AnalyticStage`, or name it in the docstring as not statable, with the missing carrier.

## R04 (P3) — Padding: declarations proved in place or used by no theorem

**Location.** `Suggested.lean`:
- lines 53–84: `IsMultiplicative` and the three `PseudoUniformizer` theorems;
- line 140: `opNorm_eq … := rfl`;
- lines 163–211: `IsONable`, `IsPotentiallyONable`, `HasPr`, `matrixCoeff`, `matrixCoeffInputFirst`;
- lines 238–249: `nonempty_mahler_coordinates`, `coeff_amiceTransform_eq_mahlerTerm`;
- lines 288–295: `LocallyAnalytic`, `IsDiscRealization`.

**Claim.** Each of these declarations is either proved in place in one step or is a definition that no stated theorem uses.

**Witness.**
- `opNorm_eq` is proved by `rfl`.
- `nonempty_mahler_coordinates` is `⟨(PadicInt.mahlerEquiv E).symm⟩`.
- `coeff_amiceTransform_eq_mahlerTerm` is a `rw` followed by `congr 1`.
- `IsONable`, `HasPr`, `matrixCoeff*`, `LocallyAnalytic` and `IsDiscRealization` occur in no theorem.

**Repair.** Delete these from `Suggested.lean`. The README keeps them as targets and Checks.

## R05 (P3) — Gate failure `imports` / `mathlib-subimports` / `no-import-mathlib`

**Location.** `Suggested.lean` lines 1–16, from `import Mathlib.Analysis.Normed.Group.Ultra` to `import Mathlib.RingTheory.Noetherian.Defs`.

**Claim.** The file has 16 Mathlib submodule imports and no `import Mathlib`.

**Witness.** The gate at this head reports `imports=1 mathlib-subimports=16 no-import-mathlib=1`.

**Repair.** Use the single line `import Mathlib`, then only the `TauCeti.*` modules the statements use. After R02 and R03 these are `TauCeti.NumberTheory.Padics.Distribution.Amice.Basis` and `TauCeti.NumberTheory.Padics.WeightSpace`. The scratch file with exactly these three imports elaborates at this head.

## R06 (P3) — Gate failure `sorry-examples`

**Location.** `Suggested.lean` line 318: `example (h : ℕ) : let F : PowerSeries ℚ_[p] := …`, admitted with `sorry`.

**Claim.** An admitted `example` tests nothing.

**Witness.** The gate reports `sorry-examples: line 318: example (h : ℕ) :`. The elaboration reports `Suggested.lean:318:0: warning: declaration uses sorry`.

**Repair.** Delete it. The README §4.7 Check on `log(1+T)` (lines 823–826) keeps the statement.

## R07 (P3) — Gate failure `prnum`: pull-request numbers and fork links

**Location.** README lines 29–31, 33, 37, 40, 43, 158, 166, 170–171 and 334 ("Mathlib #42865"). Also lines 1106–1121 ("## Existing Lean work", fork links pinned to commits) and the link definitions after it.

**Claim.** Roadmaps and library declarations are cited by pull-request number or by fork URL instead of by name.

**Witness.** The gate reports `prnum (5)`, including line 158: "Follow [Mathlib PR #42865](…)". RestrictedPowerSeries, NewtonPolygons, AdicSpacesPartII and AdicSpacesPartIII are on main. Mathlib at the pin has `AbstractMeasure.amiceTransformₐ` (`AmiceTransform.lean:215`).

**Repair.**
- Cite roadmaps by name and section, with relative links for those on main. Cite LocallyAnalyticDistributions by name and section only.
- Replace the Mathlib pull-request references with the pinned declarations: `AbstractMeasure.amiceTransformₐ`, `amiceTransformEquivₐ` and Tau Ceti's `ContinuousLinearMap.ringOpNorm`.
- Delete "Existing Lean work" and the fork link definitions.

## R08 (P3) — Gate failure `outside-folder`

**Location.**
- `Completed/ArithmeticDirichletSeries/README.md` line 331: "`LFunctions` consumes this package and supplies its own character-specific continuation."
- `TauCetiRoadmap/SymplecticGeometry/README.md` line 77: "consumed by HeegaardFloer and consumed by DGFloer".

**Claim.** The pull request edits two files outside its roadmap folders.

**Witness.** `git diff --stat origin/main...HEAD` lists both files, with 2 lines each. The worker's gate lists both under `outside-folder (2)`.

**Repair.** Move these two one-line edits to a pull request that owns those folders, or drop them from this one.

## R09 (P3) — The README and `Suggested.lean` name declarations the other does not have

**Location.** README lines 621, 638, 862, 903, 916, 923, 934 and 937 name these declarations:
- `isBoundedSMul_padicInt_padic`;
- `weightMeasure`;
- `nonempty_weightSpace_equiv`;
- `eq_aeval_binomialSeries`;
- `isLinearTopology_padicInt`;
- `amiceTransform_completedGroupAlgebra_compat`, which is in this pull request's hunk;
- `extendIntegralMeasure`;
- `measureFun_norm_le`.

**Claim.** None of these is declared in `Suggested.lean` or at the pins. In the other direction, names in `Suggested.lean` such as `TCoord`, `measurePairing_injective`, `IsDiscRealization` and `opNorm` never appear in the README.

**Witness.** `grep -c` of the eight names in `Suggested.lean` gives 0. The pins have `TauCeti.norm_measureFun_le` (`WeightIntegral.lean:126`), not `measureFun_norm_le`.

**Repair.**
- Use the pinned names where they exist.
- Declare in `Suggested.lean` the names that remain headlines.
- Remove the backticks from the rest, or delete them.
- Name every remaining `Suggested.lean` declaration in the README.

## R10 (P3) — Missing and wrong locators

**Location.**
- No locator at the claim: §§0.2, 1.2, 1.3, 2.5, 3.2, 4.6 and 5.2–5.4, and the §5.3 paragraph at lines 918–925 (this pull request's hunk).
- Line 654: "Sources: [Mah], [Am], [Col] I.3 and [RJW] §3."
- Line 1015: "[LWX] §3.15".

**Claim.** Claims lack exact locators, two locators point to the wrong place, and the key `[Am]` does not match the manifest key `Amice`.

**Witness.**
- Mahler's theorem is Col Théorème I.2.3 (Col line 383, p. 8); Col I.3 is the wavelet section.
- LWX line 1215 is Lemma 3.15, p. 21.
- The manifest key is `Amice`.

**Repair.** Add these locators at the claims:
- §0.4: JN Remark 2.1.3(1), p. 8.
- §1.2: JN §2.1, p. 8, plus a source for Banach–Steinhaus and the closed graph theorem.
- §1.4: JN p. 8 and Buz Proposition 2.1(b), p. 6.
- §2.3: Serre Proposition 1 and Lemme 1, p. 70.
- §2.5: Serre Proposition 3 and its Corollaire, p. 71.
- §2.6: Buz Lemma 2.3, p. 10.
- §3.2: Col Théorème I.2.3, p. 8.
- §4.4: Col Théorème I.4.7 and Lemme I.4.9, pp. 15–16.
- §4.6: Col Théorème I.4.7 and Lemme II.2.1, p. 30.
- §4.7: Col Théorème II.2.2, p. 30, and RJW Theorem 3.43, p. 25.
- §§5.2–5.3: RJW Remark 3.47, pp. 25–26, and JN Lemma 3.3.1, p. 24.
- The §5.3 comparison: RJW Proposition 3.16, p. 16, and Theorem 3.25, p. 18.
- §5.6: LWX Lemma 3.15, p. 21.

Write the key as `[Amice]`.

## R11 (P3) — README shape and timeless wording

**Location.**
- Line 1: "# P-adic functional analysis".
- Line 141: "## Existing foundations" stands where the supplier contracts should be.
- There is no "How to read the build", and no layer ends with "### Examples" or "### Dependencies".
- Process words:
  - "prototype" (lines 49, 154, 163, 936);
  - "when available" (174, 182, 334);
  - "requested" (922, in this pull request's hunk);
  - "supplied later" (815);
  - "Coordinate integration with the author" (1112).

**Claim.** The README does not follow the house shape and contains process narrative.

**Witness.** The checklist is in the repository README, "Writing a roadmap". `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` opens with "# Roadmap: …" and has "## Exact supplier contracts" (line 271).

**Repair.**
- Retitle as "# Roadmap: p-adic functional analysis" and add a **Summary.** paragraph.
- Turn "Existing foundations" into "Exact supplier contracts", with subsections From Mathlib, From Tau Ceti and From TauCetiRoadmap.<X>.
- Add "How to read the build", and end each layer with "### Examples" and "### Dependencies".
- Give each definition API bullets and at least three Checks.
- Remove the process words. For example, line 922 becomes "This is the specialised … comparison".

## R12 (P3) — Order relative to #1854 not stated; this folder's hunk is superseded by #1807

**Location.**
- The pull request description, merge-order paragraph: "#1101 (ModularCurves) → #1807 (the other loops) → **this pull request**."
- This pull request changes README lines 918–925, 1042–1043 and 1056–1059.

**Claim.** Two other open pull requests touch this folder, and the description orders this one only against #1807:
- #1854 makes the same change here and conflicts with this pull request elsewhere, with no stated order between them.
- #1807 already contains the substance of this hunk.

**Witness.**
- #1854's head carries this README byte for byte, and conflicts with this pull request in four other folders (AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces, RigidAnalyticGeometry).
- The head of #1807 rewrites this folder. Its §5.3 "Amice-coordinate comparison" bullet states `amiceTransform_completedGroupAlgebra_compat` without the general comparison.

**Repair.**
- State in the merge-order paragraph which of #1854 and this pull request rebases on the other.
- Since #1807 merges first, drop this pull request's hunks in this folder. This is what the other folders of this pull request did when they adopted the newer folder. Do not re-apply the hunks over #1807's §5.3.

## Previous findings

- R01 — not repaired: README lines 471–474 still "Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0"; depcheck still prints one UPWARD line, to LocallyAnalyticDistributions at README line 1052.
- R02 — not repaired: `Suggested.lean` still declares `tateGauge`, `exists_tateSeminorm` … `measurePairing_injective` with `sorry` (20 warnings); README line 299 still "Retain the consumer names `tateGauge`, `exists_tateSeminorm`, …".
- R03 — not repaired: `Suggested.lean` line 20 still "# P-adic functional analysis: representative interfaces"; lines 331–354 still declare local `q`, `WeightSpace`, `TCoord`; no Amice-basis theorem.
- R04 — not repaired: `Suggested.lean` still has `opNorm_eq … := rfl`, `nonempty_mahler_coordinates`, `IsONable`, `HasPr`, `matrixCoeff`, `LocallyAnalytic`, `IsDiscRealization`.
- R05 — not repaired: `Suggested.lean` lines 1–16 are still `import Mathlib.<submodule>` lines; gate `mathlib-subimports=16 no-import-mathlib=1`.
- R06 — not repaired: `Suggested.lean` line 318 is still `example (h : ℕ) : … := by sorry`.
- R07 — not repaired: README line 158 still "Follow [Mathlib PR #42865](…)"; line 1106 still "## Existing Lean work"; gate `prnum=5`.
- R08 — not repaired: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md` are still in the diff; gate `outside-folder (2)`.
- R09 — not repaired: README line 937 still "Supply `measureFun_norm_le` and `measureFun_injective`"; none of the eight names occurs in `Suggested.lean`.
- R10 — not repaired: README line 654 still "Sources: [Mah], [Am], [Col] I.3 and [RJW] §3."; §§0.2, 1.2, 2.5, 4.6, 5.2–5.4 still lack locators.
- R11 — not repaired: README line 1 still "# P-adic functional analysis"; line 141 still "## Existing foundations"; line 922 still "This is the requested specialised".
- R12 — not repaired: the description's merge-order paragraph still names only #1101 and #1807; #1854's head still carries this README unchanged.

## Verified sound

**Scope of this round.** The folder diff since `d1a45bf` is empty, so there is no changed passage to review in full. Two other things were checked:
- The files the pull request changed outside the folder since `d1a45bf` (`CharacteristicClasses` and `ComplexKahlerGeometry`, README and `Suggested.lean`). Neither mentions PadicFunctionalAnalysis, and this README cites neither.
- The seeded sample. It falls in no changed passage, so it was not re-read this round. The previous review read all 15 sampled targets at their locators.

**Gate and build.**
- The worker's gate at `c9403e2`: `prnum=5 sorry-examples=1 imports=1 mathlib-subimports=16 no-import-mathlib=1 depcheck=1 outside-folder=2 build=0 FAIL`. My own run gives the same counts, except that `outside-folder` also lists the pull request's own folders, because they are not passed to it.
- The dependency check, run on this head:

  ```text
  UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#44) at README lines [1052]
  depcheck: 238 roadmaps, 2346 edges, 1 problem(s)
  ```

- `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0, with 20 `declaration uses sorry` warnings and no other message. The warnings are at lines 100, 106, 111, 119, 131, 176, 183, 213, 220, 251, 257, 264, 274, 307, 312, 318, 344, 356, 374 and 380.
- The R03/R05 repair probe is a scratch file with `import Mathlib`, `TauCeti.NumberTheory.Padics.Distribution.Amice.Basis` and `TauCeti.NumberTheory.Padics.WeightSpace`, plus the two R03 statements. It exits 0 at this head, with exactly two `declaration uses sorry` warnings (lines 9 and 15) and no other message.
- Elaborated signatures: I compared all 48 with the README. The four gauge theorems flagged as having lost binders (`exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`) carry `1 < a`, `ϖ ∈ A₀`, `IsTopologicallyNilpotent ϖ` and the basis hypothesis as anonymous arguments through `include ha hϖ hnil hb` (lines 92–98), so the flag is a false positive. No other binder is lost.

**Pinned declarations re-found at this pin.** In Tau Ceti unless marked Mathlib:
- `RingTheory/Huber/TateGauge/Basic.lean`: `tateGauge` 78, `tateGauge_rpow` 191, `exists_tateSeminorm` 355, `tateGauge_equiv` 376, `tateGauge_eq_zero_iff` 390.
- `Analysis/Normed/Module/Bases/`: `Splitting.lean:87`, `Orthonormal.lean:463`, `ResidueBasis.lean:326`.
- `NumberTheory/Padics/Measure/`: `MahlerDuality.lean:186, 201`, `IntegralUnitBall.lean:84`, `PhiPsi.lean:83, 144`, `Units/WeightIntegral.lean:77, 113, 126`, `ExtendCoefficients/Basic.lean:239`, `CompletedGroupAlgebra.lean:449`.
- `NumberTheory/Padics/Distribution/Amice/Basis.lean:494` (`amiceMap`).
- `NumberTheory/Padics/WeightSpace.lean:81, 112, 156, 287`, and `UnitsDecomposition/Logarithm.lean:75` (`padicUnitsDepth`).
- `Analysis/Normed/Ring/PseudoUniformizer.lean:136, 150`, `Bases/PotentiallyONable.lean:74, 89`, `Bases/Orthonormal.lean:95, 107, 116`, `Topology/ContinuousMap/ZeroAtInfty/FiniteCoordinates.lean:95`, `Distribution/Amice/Norm.lean:98, 231, 289, 297`.
- Mathlib: `NumberTheory/Padics/Measure/AmiceTransform.lean:215, 231` (`amiceTransformₐ`, `amiceTransformEquivₐ`).
- `Analysis/Normed/Operator/RingOpNorm.lean:149, 340`.
- `Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/ProductCoordinate.lean` (`prodPowerSeriesCoordinate`).

**Cross-roadmap citations re-resolved.**
- LocallyAnalyticDistributions at its open head: lines 9, 56, 100, 104, 163 and 175–188 cite §§1.4, 2.1–2.2, 2.6, 4.3–4.4, 4.6 and 4.7.
- `TauCetiRoadmap/AdicSpacesPartII/README.md` lines 340–341: §§0.4, 2.2, 2.4.
- `TauCetiRoadmap/AdicSpacesPartIII/README.md` lines 100, 118, 510, 598 and 606.
- `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` lines 28, 57, 65, 94 and 352–362.
- The head of #1807's version of this README, §5.3 "Amice-coordinate comparison" bullet.
- The head of #1854's version of this README: identical to this one.

The citation resolver and the overlap index report no dropped id, no id that only an open revision defines, and no lost Lean name. Ownership was checked against #854, #1807 and #1854. The closest-vocabulary roadmaps QuaternionicModularForms and DirichletPadicLFunctions are named here only as consumers, which is unchanged.

**Adversarial table.** Rows 1–39 are carried forward from the previous review (r29), since no statement changed. Row 27 was recomputed this round, over 80,000 cases with 0 violations. No row needs a new value.

| # | Statement | Instance | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §0.4 Check: gauge equals the norm (r29 row 1) | (ℤ_p, p, a=p), x=p³ | admissible n ≤ 3, inf = p^{−3}; \|p³\|_p = p^{−3} | holds | — |
| 2 | §0.4 Check: gauge not multiplicative (r29 row 2) | (ℤ_p, p², a=p) | g(p)=1, g(p²)=p^{−1}; g(p)² = 1 ≠ p^{−1} | holds | — |
| 3 | §0.4: ϖ∈A₀ essential (r29 row 3) | ℚ_p², A₀={x≡y mod p²}, ϖ=(p,p²) | g(1)=1, g(ϖ)=a^{−1}, g(1+ϖ)=a² > 1 | holds | Source issue (KL), r29 |
| 4 | §0.4 Check: topological Tate does not give normed Tate (r29 row 4) | N=max(\|x\|,\|x\|²), \|ϖ\|=r<1 | N(ϖ)N(ϖ⁻¹) = r^{−1} > 1 = N(1) | holds | — |
| 5 | §0.4 zero ring (r29 row 5) | A=A₀=0 | inf a^{−n} over all n = 0 | holds | — |
| 6 | `tateGauge_rpow` (r29 row 6) | g_a(x)=0 | 0 = 0^{log b/log a}, exponent > 0 | holds | R02 |
| 7 | §0.2 Neumann (r29 row 7) | ℚ_p, x=p | ‖(1−p)⁻¹‖ = 1; ‖p/(1−p)‖ = p^{−1} | holds | — |
| 8 | §0.3 rounding (r29 row 8) | c=p^{−1}, ‖m‖=p^{−1/2} | ‖m‖'=1 ≥ ‖m‖; c·1 = p^{−1} < p^{−1/2} | holds | — |
| 9 | JN Lemma 2.1.7 exponent (r29 row 9) | \|·\| and \|·\|², ϖ=p | \|p\|₂ = p^{−2} = \|p\|^s, s=2 | holds | — |
| 10 | §1.4 Check: unbounded identity (r29 row 10) | (ℤ_p,\|x\|²)→(ℤ_p,\|x\|), x=pⁿ | ratio pⁿ → ∞ | holds | — |
| 11 | `le_opNorm` (r29 row 11) | ℚ_p, u=id; M=0 | opNorm 1, ‖x‖≤‖x‖; M=0: 0≤0 | holds | R02 |
| 12 | `exists_isOrthonormalBasis_iff` (r29 row 12) | I=∅; finite-support subspace of c₀ | I=∅ forces M=0; incomplete excluded by `CompleteSpace M` | holds | R02 |
| 13 | §2.5 duality (r29 row 13) | λ=Σx_i on c₀(ℕ,ℚ_p) | ‖λ‖ = 1 = sup\|b_i\|; b ∉ c₀ | holds | — |
| 14 | §2.6 adapter reverses products (r29 row 14) | [[1,1],[0,1]], [[1,0],[2,1]] | A(u)A(v)=[[3,1],[2,1]]; B(v)B(u)=[[3,2],[1,1]] | holds | — |
| 15 | `exists_finset_norm_le` (r29 row 15) | P=0; P=R·(pⁿ) | S=∅: 0≤0; S={0}, C=1: equality | holds | R02/R04 |
| 16 | §2.7 Checks (r29 row 16) | 1+pS; p below diagonal | inverse entries ≤ 1; column p^{−1} ↛ 0 excluded | holds | — |
| 17 | countable-type splitting (r29 row 17) | M=0; K=ℝ | d=q; ℝ excluded by `IsUltrametricDist` | holds | R02 |
| 18 | §3.4 Mahler Checks (r29 row 18) | x²; x³−x at p=3 | x² = C(x,1)+2C(x,2); x³−x = 6C(x,2)+6C(x,3), sup norm 3^{−1} | holds | — |
| 19 | §3.3 van der Put (r29 row 19) | p=3, n=7, f=x | n⁻=1; coefficient 6 | holds | — |
| 20 | §3.4 φ, ψ (r29 row 20) | p=3 | φδ₂=δ₆, ψδ₆=δ₂, ψδ₁=0; A(φδ₁)=(1+T)³ | holds | — |
| 21 | `existsUnique_integral_iff_norm_le_one` (r29 row 21) | ν = p^{−1}δ₀ | ‖ν‖ = p > 1; μ(1) = p^{−1} ∉ ℤ_p | both false | R02 |
| 22 | Mahler duality, field generality (r29 row 22) | K=𝔽_p((t)) | duality holds; Lean wider than README | true | R02 |
| 23 | §4.3 Check: missing injectivity (r29 row 23) | E=𝔽_p, x^p−x | d_{b,0}=b^p−b=0; d_{b,j≥1}=0 | holds | — |
| 24 | §4.4 transition multiplier (r29 row 24) | p≤5, h≤2, n<3000 | v_p ratio = ⌊n/p^{h+1}⌋ → ∞ | holds | — |
| 25 | §4.6 criterion (r29 row 25) | p=2, \|t\|=2^{−1/2} | level 1 fails (bound 2^{−1/2}); level 2 holds (2^{−1/4}) | holds | — |
| 26 | §4.6 boundary (r29 row 26) | \|z\|=r_p, n=p^k | \|zⁿ/n!\| = p^{−1/(p−1)} ↛ 0 | holds | — |
| 27 | §4.7 S_h ≤ D_h ≤ pS_{h+1} (r29 row 27, **recomputed**) | p∈{2,3,5,7}, h≤3, n<5000, termwise in log_p | −n/((p−1)pʰ) ≤ −v_p(⌊n/pʰ⌋!) ≤ 1 − n/((p−1)p^{h+1}): 80,000 cases, 0 violations | holds | — |
| 28 | junk `iSup` (r29 row 28) | F restricted for every ρ<1 | D_h ≤ pS_{h+1} < ∞ | hypothesis suffices | — |
| 29 | §4.7 Checks (r29 row 29) | (−1)^{n−1}/n; 1/n! | D_h at p^k → 0 while \|b\|=p^k; D₀=1, D₁=∞ | holds | — |
| 30 | §5.1 decomposition (r29 row 30) | p=2, x=3 | x/ω = −3 ∈ 1+4ℤ₂ | holds | — |
| 31 | §5.2 conductor valuations (r29 row 31) | p=3, m=2; p=2, m=3 | v₃(ζ₃−1)=1/2; v₂(−2)=1 | holds | — |
| 32 | §5.4 level criterion (r29 row 32) | p=3, κ=x; κ=xψ, conductor 9 | \|T\|=1/3 < 3^{−1/2}; \|ζ₃e³−1\| = 3^{−1/2}: h=2 | holds | — |
| 33 | §5.3 p=2 group ring (r29 row 33) | ℤ₂[C₂] | mod 2 local, maximal ideal (2, δ−1) | holds | — |
| 34 | `existsUnique_character_of_norm_lt_one` (r29 row 34) | ℚ_p[ε], z=ε | ‖ε‖=1 excluded; the pinned `weightSpaceEquiv` covers it | narrower than README | R02/R03 |
| 35 | `exists_character_of_hasEval` (r29 row 35) | S=ℤ_p, z=p; S=ℚ_p, z=p−1 | κ(γ^s)=(1+p)^s; p−1 not topologically nilpotent | holds; binder redundant | R03 |
| 36 | `measurePairing_injective` (r29 row 36) | δ_a − δ_b | trivial κ: 0; κ=x: a−b ≠ 0 | holds | R02 |
| 37 | `measurePairing_norm_le` (r29 row 37) | δ_x | \|κ(x)\| = 1 = ‖δ_x‖ | attained | R02 |
| 38 | §5.6 H and its gauge (r29 row 38) | U=p/T, ‖T‖=α | ‖U^j‖=1, ΣU^j diverges; (p,T)=(T) | holds | — |
| 39 | Amice headline, R03 repair (r29 row 39) | E=ℤ_p; E=𝔽_p | Col Thm I.4.7; over 𝔽_p unit-triangular, column-finite | true; re-elaborated this round | R03 |

**Remarks on untouched text.** None beyond the findings above, which the previous review already raised.

**Source issues.** The two source issues recorded by the previous review (KL Remark 2.4.4 and JN Lemma 2.1.6) stand. This round read no new locator.

## Not verifiable

- [Sch] Schneider, *Nonarchimedean Functional Analysis*: settled as uncertified, not read. It is cited for §§0.2, 1.3 and 2.2–2.4; the mathematics was checked directly in the previous review (rows 7, 12, 17).
- [BGR] Bosch–Güntzer–Remmert: uncertified, not read. It is cited for §§1.3, 1.4 and 2.7.
- [Bel] Bellaïche, *The Eigenbook*: uncertified, not read.

## Source issues

- none
