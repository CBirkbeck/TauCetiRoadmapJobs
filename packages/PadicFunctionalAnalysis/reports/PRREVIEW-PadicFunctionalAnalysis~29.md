# Review of PadicFunctionalAnalysis (pull request #1808 at d1a45bf)

**Verdict:** needs changes

Scope: full review of `TauCetiRoadmap/PadicFunctionalAnalysis/` at this head. The pull request changes only README §5.3 and the Layer 5 and dependency-order paragraphs of this folder; `Suggested.lean` is unchanged from main. The push gate fails (imports, an admitted `example`, pull-request numbers, an UPWARD supplier, files outside the pull request's folders), so this folder cannot be accepted at this head. Every statement I computed is true. The defects are in supply direction, duplication of the pinned Tau Ceti, the acceptance test, and form.

## R01 (P1) — Supply cycles: completed tensors, the distribution product and coefficient extension

**Location.** `TauCetiRoadmap/PadicFunctionalAnalysis/README.md` lines 471–476: "Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0, and compare it by the universal property with the Banach-module completed tensor of AdicSpacesPartII §R0.3." Also lines 43–46, 814–816 and 1052–1055. Separately, lines 32, 559–560 and 927–934 take measure calculus and coefficient extension from PadicMeasuresIwasawaAlgebras Layers 0–1.

**Claim.** Three roadmaps are cited as suppliers here, and each of them consumes this roadmap. LocallyAnalyticDistributions is also later in the merge order (an open pull request).

**Witness.** The dependency check prints `UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#70) at README lines [1052]`. Each supplier consumes this roadmap in turn:
- LocallyAnalyticDistributions README (at its head), supplier table lines 175–177: cites this roadmap's §§4.3, 4.4 and 4.7.
- `TauCetiRoadmap/AdicSpacesPartII/README.md` line 340: cites §0.4.
- `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` lines 352–367: cite §§3.4 and 5.1–5.3.

**Repair.**
- (a) Delete the following, all of which serve only the completed-extension corollary of §2.4:
  - the corollary itself (lines 471–479);
  - the paragraph at lines 43–46;
  - the first bullet of "Dependency order and completion";
  - "completed tensors only for the final corollary of §2.4" in the Layer 2 dependencies.

  AdicSpacesPartIII R3.6 already owns this transport: "Transport of PadicFunctionalAnalysis §2.4's splitting to Part II's Banach completed tensor" (`TauCetiRoadmap/AdicSpacesPartIII/README.md` line 606). Keep only the sentence that §2.4 supplies its `countable-type-closed-subspace-section` interface.
- (b) Delete the comparison "with … the general distribution product supplied later by LocallyAnalyticDistributions §1.4" (lines 814–816). That comparison belongs to the consumer.
- (c) In §3.1, §5.3 and the scope row "Measures", take coefficient extension from the pinned Tau Ceti instead of PadicMeasuresIwasawaAlgebras Layers 0–1:
  - `AbstractMeasure.extendCoefficients` (`NumberTheory/Padics/Measure/ExtendCoefficients/Basic.lean:239`);
  - `TauCeti.measureFun` (`NumberTheory/Padics/Measure/Units/WeightIntegral.lean:77`).

  Then list PadicMeasuresIwasawaAlgebras only as a consumer.

After (a)–(c), the dependency check has no UPWARD line, and none of the three roadmaps both supplies and consumes this one.

## R02 (P2) — Results the pinned Tau Ceti proves are restated as open targets

**Location.** In `Suggested.lean`: lines 53–121, 127–140, 154–229, 251–278, 297–315 and 331–381. In the README: §0.4 line 299 ("Retain the consumer names `tateGauge`, `exists_tateSeminorm`, …"), §§2.2–2.4, 3.4, 4.3–4.4, 4.7 and 5.1–5.3. "Existing foundations" (lines 141–188) cites none of these pinned results.

**Claim.** The README lists the following as targets, and `Suggested.lean` states them with `sorry`, although the pinned Tau Ceti already proves them without `sorry`:
- Tate gauges;
- the ring operator norm;
- orthonormal bases;
- Serre's theorem;
- countable-type splitting;
- finite coordinates;
- Mahler duality;
- the integral unit ball;
- φ and ψ;
- the Amice stage norms and their inequalities;
- the weight space and its normed parametrisation;
- `measureFun`, its bound and its injectivity;
- the measure/completed-group-algebra equivalence and `ℤ_p[C]⟦X⟧ ≃ ℤ_p[[C × Γ]]`.

No supplier contract names them.

**Witness.** In a scratch copy of the file, 8 of the 20 admitted theorems close with one `exact` of a pinned lemma (table below). `#print axioms` shows each pinned lemma depends only on `propext`, `Classical.choice` and `Quot.sound`. The pinned `TauCeti.Huber.tateGauge` (`RingTheory/Huber/TateGauge/Basic.lean:78`) has the same body as `Suggested.lean` line 88.

| `Suggested.lean` | Pinned declaration (Tau Ceti unless noted) | Probe |
| --- | --- | --- |
| `exists_tateSeminorm` | `TauCeti.Huber.exists_tateSeminorm`, `RingTheory/Huber/TateGauge/Basic.lean:355` | `exact` closes |
| `tateGauge_eq_zero_iff` | `TauCeti.Huber.tateGauge_eq_zero_iff` (:390) with `t2Space_iff_forall_tateGauge_eq_zero_iff` | closes (pair of two lemmas) |
| `tateGauge_equiv` | `TauCeti.Huber.tateGauge_equiv` (:376) | `exact` closes |
| `tateGauge_rpow` | `TauCeti.Huber.tateGauge_rpow` (:191) | `exact` closes |
| `exists_continuousLinearEquiv_prod_of_countableType` | `TauCeti.exists_continuousLinearEquiv_prod_of_countableType`, `Analysis/Normed/Module/Bases/Splitting.lean:87` | `exact … hi.isEmbedding …` closes |
| `norm_toCLMEquiv_eq_iSup_coeff` | `AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff`, `NumberTheory/Padics/Measure/MahlerDuality.lean:201` | `exact` closes |
| `existsUnique_integral_iff_norm_le_one` | `AbstractMeasure.existsUnique_integral_iff_norm_le_one`, `Measure/IntegralUnitBall.lean:84` | `exact` closes |
| `amiceTransform_phiMeasure`, `phiMeasure` | `AbstractMeasure.amiceTransform_phiMeasure`, `phiMeasure`, `Measure/PhiPsi.lean:144, 83` | `exact` closes |
| `mem_range_amiceTransform_iff` | `AbstractMeasure.mem_range_amiceTransform_iff` (`MahlerDuality.lean:186`; fields are Tate by `NormedRing.IsTate.of_nontriviallyNormedField`) | restated with `BddAbove` |
| `exists_isOrthonormalBasis_iff`, `IsOrthonormalFamily`, `IsOrthonormalBasis`, `IsONable` | `TauCeti.exists_isOrthonormalBasis_iff`, `Bases/Orthonormal.lean:463, 95, 107, 116` | definitions differ in form |
| `IsPotentiallyONable`, `HasPr` | `Bases/PotentiallyONable.lean:74, 89` | — |
| `exists_finset_norm_le` | `Submodule.exists_finset_norm_le`, `Topology/ContinuousMap/ZeroAtInfty/FiniteCoordinates.lean:95` (finite and complete `P`) | — |
| `PseudoUniformizer`, `IsTate`, `.isPseudoUniformizer` | `TauCeti.NormedRing.PseudoUniformizer`, `IsTate`, `Analysis/Normed/Ring/PseudoUniformizer.lean:136, 150, 275` | — |
| `opNorm`, `le_opNorm` | `ContinuousLinearMap.ringOpNorm`, `le_ringOpNorm`, `Analysis/Normed/Operator/RingOpNorm.lean:149, 340` | — |
| `amiceDualNorm`, `amiceDiscNorm`, the two inequalities | `TauCeti.amiceDualNorm`, Mathlib `PowerSeries.gaussNorm` at `TauCeti.amiceRadius`, `gaussNorm_amiceRadius_le_amiceDualNorm`, `amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ`, `Distribution/Amice/Norm.lean:231, 289, 297` | — |
| `WeightSpace`, `TCoord`, `q`, `weightTest`, `existsUnique_character_of_norm_lt_one` | `TauCeti.WeightSpace`, `.coord`, `padicUnitsDepth`, `.weightTest`, `weightSpaceEquiv`, `NumberTheory/Padics/WeightSpace.lean:81, 156, 94, 287` | — |
| `measurePairing`, `measurePairing_norm_le` | `TauCeti.measureFun`, `norm_measureFun_le`, `measureFun_injective`, `WeightIntegral.lean:77, 126, 113` | — |
| Serre's theorem (README §2.3) | `TauCeti.isONable_iff_free_residueModule` (`Bases/ResidueBasis.lean:326`), `isONable_iff_discrete_norm`, `isPotentiallyONable_of_discrete_norm` (`Bases/DiscreteNorm.lean:46, 67`) | — |
| README §5.3, `Λ ≃ ℤ_p[Δ]⟦T⟧` | `TauCeti.completedGroupAlgebra.prodPowerSeriesCoordinate` (`Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/ProductCoordinate.lean:91`), `AbstractMeasure.completedGroupAlgebraEquiv` (`Measure/CompletedGroupAlgebra.lean:449`) | — |

The probe also shows three unused hypotheses:
- `hnil` is unused in all four gauge theorems;
- `tateGauge_rpow` uses none of `hϖ`, `hnil`, `hb`;
- `hϖB` is unused in `tateGauge_equiv`.

**Repair.**
- Add `## Exact supplier contracts` with a `### From Tau Ceti` subsection. It should name each pinned declaration above with its file.
- In each README section, replace "Prove …" or "Supply …" for these results with a citation, and keep only what remains. Examples of what remains:
  - Amice's theorem (§4.4);
  - the distribution carrier and the unbounded Amice bijection (§4.7);
  - the transport of `prodPowerSeriesCoordinate` to `ℤ_pˣ` and the adic universal character (§5.3).
- Delete the restated definitions and theorems from `Suggested.lean`.

This was tested: the probe file closes each listed theorem with the cited lemma. The head of #1807 carries a revision of this folder that cites these pinned names.

## R03 (P2) — Statable headlines are absent, the adic character uses stand-ins, and the docstring names no unstatable headline

**Location.** `Suggested.lean`:
- lines 20–24: "representative interfaces … not an exhaustive checklist";
- lines 288–295: `LocallyAnalytic` and `IsDiscRealization`, which no theorem uses;
- lines 331–354: a local `q`, `WeightSpace` and `TCoord`, a free `γ` and `e`, and the binder `[IsLinearTopology ℤ_[p] ℤ_[p]]`.

**Claim.** README lines 10–13 name the central results: Serre's theorem, countable-type splitting, Amice's basis theorem, the bounded and unbounded Amice transforms, and the universal character. Amice's basis theorem is statable at the pins but is not stated. The unbounded Amice transform is neither stated nor named in the docstring as unstatable. The adic character is stated on local stand-ins instead of the pinned weight-space carriers.

**Witness.** The pinned `TauCeti.AnalyticStage.amiceMap` (`NumberTheory/Padics/Distribution/Amice/Basis.lean:494`) has a docstring saying Amice's theorem "is not proved here". The pinned instance `IsLinearTopology ℤ_[p] ℤ_[p]` is at `RingTheory/Huber/Padic/Basic.lean:87`. Both statements below elaborate at the pins, with `sorry` as the only warning.

**Repair.** State:

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

Keep the binomial formula as `eq_aeval_binomialSeries`. Delete the local `q`, `WeightSpace`, `TCoord`, the free `γ` and `e`, and the linear-topology binder. Retitle the module docstring "target signatures". Then either state the unbounded Amice bijection on a subtype of stage-bounded functionals on `TauCeti.LocallyAnalytic p K K`, or name it in the docstring as not statable, with the carrier that is missing.

## R04 (P3) — Padding: declarations proved in place or used by no theorem

**Location.** `Suggested.lean`:
- lines 53–84: `IsMultiplicative` and the three `PseudoUniformizer` theorems;
- line 140: `opNorm_eq … := rfl`;
- lines 163–211: `IsONable`, `IsPotentiallyONable`, `HasPr`, `matrixCoeff`, `matrixCoeffInputFirst`;
- lines 238–249: `nonempty_mahler_coordinates`, `coeff_amiceTransform_eq_mahlerTerm`;
- lines 288–295: `LocallyAnalytic`, `IsDiscRealization`.

**Claim.** Each declaration is either proved in place in one step, or is a definition that no stated theorem uses.

**Witness.**
- `opNorm_eq` is proved by `rfl`.
- `nonempty_mahler_coordinates` is `⟨(PadicInt.mahlerEquiv E).symm⟩`.
- `coeff_amiceTransform_eq_mahlerTerm` is `rw [AbstractMeasure.coeff_amiceTransform]; congr 1`.
- `IsONable`, `IsPotentiallyONable`, `HasPr`, `matrixCoeff*`, `LocallyAnalytic` and `IsDiscRealization` occur in no theorem.

**Repair.** Delete these from `Suggested.lean`. The README keeps them as targets and Checks.

## R05 (P3) — Gate failure `imports` / `mathlib-subimports` / `no-import-mathlib`

**Location.** `Suggested.lean` lines 1–16, `import Mathlib.Analysis.Normed.Group.Ultra` through `import Mathlib.RingTheory.Noetherian.Defs`.

**Claim.** The file has 16 Mathlib submodule imports and no `import Mathlib`.

**Witness.** The gate reports `mathlib-subimports=16` and `no-import-mathlib=1`.

**Repair.** Use `import Mathlib`, followed only by the `TauCeti.*` modules the statements use. After R02 and R03 these are `TauCeti.NumberTheory.Padics.Distribution.Amice.Basis` and `TauCeti.NumberTheory.Padics.WeightSpace`. A scratch file with exactly these imports elaborates.

## R06 (P3) — Gate failure `sorry-examples`

**Location.** `Suggested.lean` line 318: `example (h : ℕ) : let F : PowerSeries ℚ_[p] := …`, admitted with `sorry`.

**Claim.** An admitted `example` tests nothing.

**Witness.** The gate reports `sorry-examples (1)` at line 318.

**Repair.** Delete it. The README §4.7 Check on `log(1+T)` (lines 823–826) keeps the statement.

## R07 (P3) — Gate failure `prnum`: pull-request numbers and fork links

**Location.** README lines 29, 30, 31, 33, 37, 40, 43, 158, 166, 170–171, 334 ("in the shape of Mathlib #42865"), and lines 1106–1121 ("Existing Lean work", and fork links pinned to commits).

**Claim.** Roadmaps and library declarations are cited by pull-request number or by fork URL instead of by name.

**Witness.** The gate reports `prnum (5)`. RestrictedPowerSeries, NewtonPolygons, AdicSpacesPartII and AdicSpacesPartIII are on main. Mathlib at the pin has `AbstractMeasure.amiceTransformₐ` and `amiceTransformEquivₐ` (`NumberTheory/Padics/Measure/AmiceTransform.lean:215, 231`).

**Repair.**
- Cite roadmaps by name and section. Use relative links for those on main. Cite LocallyAnalyticDistributions by name and section only.
- Replace the Mathlib pull-request references with the pinned declarations: `AbstractMeasure.amiceTransformₐ`, and Tau Ceti's `ContinuousLinearMap.ringOpNorm`.
- Delete the "Existing Lean work" section.

## R08 (P3) — Gate failure `outside-folder`

**Location.** `Completed/ArithmeticDirichletSeries/README.md` line 331 and `TauCetiRoadmap/SymplecticGeometry/README.md` line 77.

**Claim.** The pull request edits two files outside its stated roadmap folders.

**Witness.** `git diff --stat origin/main...HEAD` lists both files. Neither folder is among this pull request's roadmap folders.

**Repair.** Move these two one-line edits to the pull request that owns those folders, or drop them from this one.

## R09 (P3) — README and `Suggested.lean` name declarations the other does not have

**Location.** README lines 621, 638, 862, 903, 916, 923 and 934–937 name `isBoundedSMul_padicInt_padic`, `weightMeasure`, `nonempty_weightSpace_equiv`, `eq_aeval_binomialSeries`, `isLinearTopology_padicInt`, `amiceTransform_completedGroupAlgebra_compat` (line 923 is this pull request's new paragraph), `extendIntegralMeasure` and `measureFun_norm_le`.

**Claim.** None of these is declared in `Suggested.lean` or at the pins. In the other direction, at least 17 names in `Suggested.lean` never appear in the README; examples are `TCoord`, `measurePairing_injective`, `IsDiscRealization` and `opNorm`.

**Witness.** Searching `Suggested.lean`, Mathlib and Tau Ceti finds none of the eight README names. The pins do have `TauCeti.norm_measureFun_le` (`WeightIntegral.lean:126`) and the instance at `Huber/Padic/Basic.lean:87`. Lines 365 and 367 of the PadicMeasuresIwasawaAlgebras README cite `TauCetiRoadmap.PadicFunctionalAnalysis.eq_aeval_binomialSeries` and `…measureFun_norm_le`, which do not exist.

**Repair.**
- Use the pinned names where they exist.
- Declare in `Suggested.lean` the names that remain headlines (`amiceTransform_completedGroupAlgebra_compat`, `eq_aeval_binomialSeries`).
- Remove the backticks from the rest, or delete them.
- Name every remaining `Suggested.lean` declaration in the README.

## R10 (P3) — Missing and wrong locators

**Location.**
- These targets have no locator at the claim: §§0.2, 1.2, 1.3, 2.5, 3.2, 4.6, 5.2–5.4, and this pull request's new §5.3 paragraph (lines 918–925).
- Line 654 cites "[Col] I.3" for Mahler.
- Line 1015 cites "[LWX] §3.15".
- The key "[Am]" does not match the manifest key `Amice`.

**Claim.** Claims lack exact locators, and two locators point to the wrong place.

**Witness.**
- Mahler's theorem is Col Théorème I.2.3 (Col line 383, p. 8). Section I.3 is the wavelet section.
- LWX line 1215 is "Lemma 3.15" on p. 21.
- The estimate `S_h ≤ D_h ≤ p S_{h+1}` is Col Théorème II.2.2 (Col line 1502, p. 30).

**Repair.** Add these locators at the claims:
- §0.4: JN Remark 2.1.3(1), p. 8 (it assumes ϖ lies in the ring of definition), beside KL Remark 2.4.4, p. 39.
- §1.2: JN §2.1, p. 8 (open mapping; continuity is equivalent to boundedness). Also add a source for Banach–Steinhaus and the closed graph theorem, which no cited text states.
- §1.4: JN p. 8 and Buz Proposition 2.1(b), p. 6.
- §2.3: Serre Proposition 1 and Lemme 1, p. 70.
- §2.5: Serre Proposition 3 and its Corollaire, p. 71.
- §2.6: Buz Lemma 2.3, p. 10.
- §3.2: Col Théorème I.2.3, p. 8.
- §4.4: Col Théorème I.4.7 and Lemme I.4.9, pp. 15–16.
- §4.6: Col Théorème I.4.7 and Lemme II.2.1, p. 30.
- §4.7: Col Théorème II.2.2, p. 30, and RJW Theorem 3.43, p. 25.
- §§5.2–5.3: RJW Remark 3.47, pp. 25–26, and JN Lemma 3.3.1, p. 24.
- The new §5.3 paragraph: RJW Proposition 3.16, p. 16, and Theorem 3.25, p. 18.
- §5.6: LWX Lemma 3.15, p. 21, and the proof of Corollary 3.18, p. 23.
- Write the key as [Amice].

## R11 (P3) — README shape and timeless wording

**Location.**
- Line 1: "# P-adic functional analysis".
- Line 141: "## Existing foundations" stands where the supplier contracts should be.
- There is no "How to read the build", no "### Examples" or "### Dependencies" headings, and no per-definition API bullets or Checks.
- Process words: "prototype" (lines 49, 154, 163, 936), "current" (146), "when available" (174, 183, 269, 334), "requested" (922, in this pull request's new text), "supplied later" (816), "Coordinate integration with the author" (1112).

**Claim.** The README does not follow the house shape and contains process narrative.

**Witness.** The checklist under "Writing a roadmap" in the repository README. `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` line 1 reads "# Roadmap: …", and its line 271 is "## Exact supplier contracts".

**Repair.**
- Retitle as "# Roadmap: p-adic functional analysis" and add a **Summary.** paragraph.
- Turn "Existing foundations" into "Exact supplier contracts", with subsections From Mathlib, From Tau Ceti and From TauCetiRoadmap.<X>.
- Add "How to read the build".
- End each layer with "### Examples" and "### Dependencies".
- Give each definition API bullets and at least three Checks.
- Remove the process words. For example, line 922 should read "This is the specialised … comparison".

## R12 (P3) — Order relative to #1854 not stated; this folder's change is superseded by #1807

**Location.** The merge-order paragraph of the pull request description names only #1101 and #1807. This pull request changes README lines 918–925, 1042–1044 and 1056–1059.

**Claim.** Another open pull request makes the same change to this folder and conflicts with this one, and the description gives no order between them.

**Witness.**
- The head of #1854 carries the identical hunk in this README. It conflicts with this pull request in the AlgebraicTopology, CharacteristicClasses, ClassifyingSpaces and RigidAnalyticGeometry files (the overlaps index of the open pull requests).
- The head of #1807 rewrites this README (1303 lines), including §5.3, and rewrites `Suggested.lean`.

**Repair.** In the merge-order paragraph, state which of #1854 and this pull request rebases on the other. If #1807 merges first, as stated, drop this pull request's hunks in this folder rather than re-applying them over #1807's §5.3.

## Verified sound

**Gate and build.**
- Dependency check output, run on this head:

  ```text
  UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#70) at README lines [1052]
  depcheck: 240 roadmaps, 2433 edges, 1 problem(s)
  ```

- `lake env lean` on `Suggested.lean` gives 20 `declaration uses sorry` warnings and no errors.
- I compared all 48 elaborated signatures (the elaborated-signature list) with the README:
  - The four gauge theorems flagged as "dropped" do carry `ha`, `hϖ`, `hnil` and `hb`, as anonymous hypotheses through `include`, so the flag is a false positive.
  - `LocallyAnalytic` and `amiceDiscNorm` drop an unused `[Fact p.Prime]`, which is harmless.
  - No other binder is lost.

**Sampled sources** (15 targets; the README flags no locator as unverified):
- 0.2: the multiplicative-unit inverse formula and exact module scaling, JN Definition 2.1.2, p. 7, and p. 8 (JN lines 387–416). The Neumann and Jacobson-radical claims rest on [Sch] (see below).
- 0.3: JN Lemmas 2.1.6–2.1.7, pp. 9–10 (lines 460–505). These are the corrected version (footnote 3), and the exponent `s` is fixed by `|ϖ|₂ = |ϖ|₁^s`.
- 0.4: the gauge formula, its unit ball `R₀` and multiplicative `ϖ`, JN Remark 2.1.3(1), p. 8 (lines 397–402); KL Remark 2.4.4, p. 39 (lines 1538–1547), with the gap noted under Source issues.
- 1.2: open mapping and continuity being equivalent to boundedness, JN p. 8 (lines 418–422) and Buz Proposition 2.1(a). Banach–Steinhaus and the closed graph theorem have no source (R10); I checked them mathematically through Baire and the shell argument.
- 1.3: rests on [Sch]/[BGR] (see below).
- 1.4: JN p. 8 (lines 423–428) and Buz Proposition 2.1(b), p. 6 (lines 181–194).
- 2.5: Serre §2, Proposition 3 and its Corollaire, p. 71 (Serre lines 114–130). This is over a field; the proof transfers with `‖1‖ = 1`.
- 3.2: Col Théorème I.2.3 (line 383). Col line 1488 gives the Mahler coefficients `zⁿ` of `(1+z)^x`.
- 4.1: Col Remarque I.4.1 and Lemme I.4.5, pp. 13–15 (lines 636–706).
- 4.6: Col Théorème I.4.7 and Lemme II.2.1. Necessity and the excluded boundary I computed (rows 25–26 of the table).
- 4.7: Col II.2, pp. 29–30, Théorème II.2.2 on p. 30 (lines 1457–1504), and RJW Theorem 3.43, p. 25 (line 1453).
- 5.2: RJW Remark 3.47, pp. 25–26; JN §3.3 (`q = p^ε`), Lemma 3.3.1 and Definition 3.3.2, p. 24. LWX line 381 agrees with the conductor valuations.
- 5.3: RJW Proposition 3.16, p. 16, and Theorem 3.25, p. 18, for the new comparison paragraph; RJW Remark 3.47 for `F_μ(χ) = ∫ χ dμ`.
- 5.4: computed (row 31 of the table).
- 5.6: LWX Lemma 3.15, p. 21 (lines 1215–1218), and line 1299 (`v(d_m) ≥ max(0, −m)`). LWX line 357 defines `m_Λ = (p, T)`, consistent with the README's p = 2 caveat.

**Library declarations opened, at the pins.**
- Mathlib: `AmiceTransform.lean:78, 83, 94, 158, 215, 231`; `Mathlib/Analysis/Normed/Operator/Basic.lean` (`opNorm` still needs `NontriviallyNormedField`); `UnconditionalSchauderBasis` (`Analysis/Normed/Module/Bases.lean:46`).
- Tau Ceti: every declaration in the R02 table, plus:
  - `IsTateRing.of_isUnit_norm_lt_one` (`RingTheory/Huber/Normed.lean:265`);
  - `IsTateRing.exists_hasBasis_nhds_zero` (`Huber/Basic.lean:844`);
  - `PadicInt.compactSpace_units` (`PadicIntegers.lean:207`);
  - `WeightSpace.ofCoord` (`WeightSpace.lean:229`);
  - `AnalyticStage` (`Distribution/AnalyticStage.lean:107`);
  - `LocallyAnalytic` (`Distribution/LocallyAnalytic.lean:45`).

**Cross-roadmap citations resolved.**
- On main: RestrictedPowerSeries §2 (line 304), §7.1 (704) and Layers 0–2; NewtonPolygons Layer 1 (442); PadicMeasuresIwasawaAlgebras Layers 0–1 and §§2.2, 2.11 and 4.5 (lines 1229, 1865, 2620; §4.5 consumes this §5.3, lines 366 and 922); ProfiniteProPGroups "Layer 9 prerequisites" (line 1721, where the carrier is Tau Ceti's); AdicSpaces Layer 0 (135); AdicSpacesPartII §R0.3 (1769, which has a Banach comparison) and §R0.4 (2270); AdicSpacesPartIII R3.6 (606); CompactOperators; LocalFieldsRamification.
- At its open head: LocallyAnalyticDistributions §0.0 (892), §0.1 (1049), §1.1 (1482) and §1.4 (1607).

**Ownership.** Searching the open roadmap pull requests finds no other roadmap declaring `tateGauge`, `phiMeasure`, `amiceDualNorm`, `WeightSpace` or `measurePairing` (only #1807, #1854 and main). The README names "quaternionic modular-form theory" (lines 35 and 981), which is on the never-cite list, only as a consumer.

**Adversarial table (39 rows).**

| # | Statement | Instance | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- | --- |
| 1 | §0.4 Check: gauge equals the norm | (ℤ_p, p, a=p), x=p³ | admissible n ≤ 3, so inf = p^{−3}; \|p³\|_p = p^{−3} | holds | — |
| 2 | §0.4 Check: gauge not multiplicative | (ℤ_p, p², a=p) | g = p^{−⌊v/2⌋}: g(p)=1, g(p²)=p^{−1}; g(p)² = 1 ≠ p^{−1} | holds | — |
| 3 | §0.4 Check: ϖ∈A₀ is essential (hyp. `hϖ`) | ℚ_p², A₀={x≡y mod p²}, ϖ=(p,p²) | ϖ^k∈A₀ iff k=0 or k≥2; g(1)=1, g(ϖ)=a^{−1}, g(1+ϖ)=a² > max = 1 | holds | Source issue (KL) |
| 4 | §0.4 Check: topological Tate does not give normed Tate | N=max(\|x\|,\|x\|²), \|ϖ\|=r<1 | N(ϖ)N(ϖ⁻¹) = r·r^{−2} = r^{−1} > 1 = N(1) | holds | — |
| 5 | §0.4 zero ring | A=A₀=0 | every n admissible, so inf a^{−n} = 0 | holds | — |
| 6 | `tateGauge_rpow` | g_a(x)=0 | 0 = 0^{log b/log a}, exponent > 0 | holds | R02 note |
| 7 | §0.2 Neumann | ℚ_p, x=p | ‖(1−p)⁻¹‖ = 1; ‖p/(1−p)‖ = p^{−1} = ‖x‖ | holds | — |
| 8 | §0.3 rounding | c=p^{−1}, ‖m‖=p^{−1/2} | ‖m‖'=1 ≥ ‖m‖; c·1 = p^{−1} < p^{−1/2} | holds | — |
| 9 | JN Lemma 2.1.7 exponent | ℚ_p, \|·\| and \|·\|², ϖ=p | \|p\|₂ = p^{−2} = \|p\|^s, so s=2, C₁=C₂=1 | holds | — |
| 10 | §1.4 Check: unbounded identity | (ℤ_p,\|x\|²)→(ℤ_p,\|x\|), x=pⁿ | ratio = pⁿ → ∞; same topology; ℤ_p has no multiplicative unit of norm <1 | holds | — |
| 11 | `le_opNorm` | ℚ_p, u=id; M=0 | opNorm=1 and ‖x‖≤‖x‖; for M=0 opNorm = sInf{c≥0} = 0 and 0≤0 | holds | R02 |
| 12 | `exists_isOrthonormalBasis_iff` | I=∅; finite-support subspace of c₀(ℕ,ℚ_p) | I=∅ forces M=0 on both sides; the incomplete space is excluded by `CompleteSpace M` | holds | R02 |
| 13 | §2.5 duality | b=(1,1,…), λ=Σx_i on c₀(ℕ,ℚ_p) | ‖λ‖ = 1 = sup\|b_i\|; b ∉ c₀ | holds | — |
| 14 | §2.6 adapter reverses products | A(u)=[[1,1],[0,1]], A(v)=[[1,0],[2,1]] | A(u)A(v)=[[3,1],[2,1]]; B(v)B(u)=[[3,2],[1,1]] = its transpose; B(u)B(v)=[[1,2],[1,3]] | holds | — |
| 15 | `exists_finset_norm_le` | P=0; P=R·(pⁿ)ₙ | S=∅, C=1: 0≤0; S={0}, C=1: ‖rf‖ = \|r\| = \|rf₀\| | holds | R02/R04 |
| 16 | §2.7 Checks | 1+pS; p everywhere below the diagonal | inverse Σ(−pS)^k has entries ≤ 1, so isometric; the column has entries p^{−1} ↛ 0, so excluded | holds | — |
| 17 | countable-type splitting | M=0; K=ℝ | d=q works; ℝ excluded by `IsUltrametricDist` | holds | R02 |
| 18 | §3.4 Mahler Checks | x²; x³−x at p=3 | x² = binom(x,1)+2binom(x,2); x³−x = 6binom(x,2)+6binom(x,3), \|6\|₃ = 3^{−1} = sup norm (x=3: \|24\|₃), Gauss norm 1 | holds | — |
| 19 | §3.3 van der Put | p=3, n=7=(21)₃, f=x | n⁻=1; coefficient 6 = 2·3¹ | holds | — |
| 20 | §3.4 φ, ψ | p=3 | φδ₂=δ₆, ψδ₆=δ₂, ψδ₁=0; A(φδ₁) = (1+T)³ = A(δ₁)((1+X)³−1) | holds | — |
| 21 | `existsUnique_integral_iff_norm_le_one` | ν = p^{−1}δ₀ | ‖ν‖ = p > 1; an integral μ needs μ(1) = p^{−1} ∉ ℤ_p | both sides false | R02 |
| 22 | Mahler-duality field generality | K=𝔽_p((t)) via ℤ_p→𝔽_p | `IsBoundedSMul` holds (p•x=0); duality still holds | true; the Lean is wider than README §3.4 | removed by R02 |
| 23 | §4.3 Check: missing injectivity | E=𝔽_p, x^p−x at level 0 | d_{b,0} = b^p − b = 0; d_{b,j≥1} ∝ p^j = 0 | holds | — |
| 24 | §4.4 transition multiplier | p≤5, h≤2, n<3000 (script) | v_p(m_h(n)/m_{h+1}(n)) = ⌊n/p^{h+1}⌋ → ∞ | holds | — |
| 25 | §4.6 criterion and Check | p=2, \|t\|=2^{−1/2} | level 1: bound 2^{−1/2}, fails; level 2: bound 2^{−1/4}, holds | holds | — |
| 26 | §4.6 boundary excluded | \|z\| = r_p, n=p^k | \|zⁿ/n!\| = p^{−1/(p−1)} ↛ 0 | holds | — |
| 27 | §4.7 S_h ≤ D_h ≤ pS_{h+1} | p∈{2,3,5,7}, h≤3, n<5000, termwise | r_hⁿ ≤ ‖⌊n/pʰ⌋!‖ ≤ p·r_{h+1}ⁿ: 0 violations | holds (Col Thm II.2.2) | — |
| 28 | junk `iSup` in the inequalities | F restricted at every ρ<1 | D_h ≤ pS_{h+1} < ∞, so both sups are over bounded families | hypothesis suffices | — |
| 29 | §4.7 Checks | b=(−1)^{n−1}/n; b=1/n! | D_h at n=p^k is p^{k−(p^{k−h}−1)/(p−1)} → 0 while \|b_{p^k}\| = p^k; D₀=1, D₁ = sup p^{⌊n/p⌋} = ∞ | holds | — |
| 30 | §5.1 decomposition | p=2, x=3 | x̄=−1, x/ω = −3 ∈ 1+4ℤ₂; exp 4 ≡ 5 mod 8 | holds | — |
| 31 | §5.2 conductor valuations | p=3, m=2; p=2, m=3 | v₃(ζ₃−1) = 1/2 = 1/(3⁰·2); v₂(−2) = 1 = 1/2⁰ | holds | — |
| 32 | §5.4 level criterion | p=3: κ=x; κ=xψ with conductor 9 | \|T\| = 1/3 < 3^{−1/2}; \|ζ₃e³−1\| = 3^{−1/2}: fails h=1, holds h=2 (bound 3^{−1/6}) = max(m, v_p(q)) | holds | — |
| 33 | §5.3 p=2 group ring | ℤ₂[C₂] | mod 2: 𝔽₂[δ]/(δ−1)², local, maximal ideal (2, δ−1) | holds | — |
| 34 | `existsUnique_character_of_norm_lt_one` versus the dual-number Check | ℚ_p[ε], z=ε | ‖ε‖ = 1 is excluded although the weight s↦1+sε exists | narrower than README; the pinned `weightSpaceEquiv` covers it | R02/R03 |
| 35 | `exists_character_of_hasEval` | S=ℤ_p, z=p; S=ℚ_p, z=p−1 | κ(γ^s) = (1+p)^s and TCoord = p; p−1 is not topologically nilpotent | holds; binder redundant | R03 |
| 36 | `measurePairing_injective` | δ_a − δ_b, a≠b | trivial κ gives 0; κ=x gives a−b ≠ 0 | holds | R02/R04 |
| 37 | `measurePairing_norm_le` | δ_x | \|κ(x)\| = 1 = ‖δ_x‖ | holds, attained | R02 |
| 38 | §5.6 H and its gauge | U=p/T, ‖T‖=α | ‖U‖=1, ‖p‖=α, ‖U^j‖=1 so ΣU^j diverges; p=TU so (p,T) = (T) | holds | — |
| 39 | Amice headline (R03 repair) | E=ℤ_p; E=𝔽_p | Col Thm I.4.7; over 𝔽_p the matrix is unit-triangular and column-finite, as is its inverse | true; elaborates at the pins | R03 |

## Not verifiable

- [Sch] Schneider, *Nonarchimedean Functional Analysis*. The manifest settles it as uncertified (paywalled), so I did not read it. It is cited for §§0.2, 1.3 and 2.2–2.4. I checked the mathematics directly (rows 7, 12 and 17).
- [BGR] Bosch–Güntzer–Remmert. Uncertified. It is cited for §§1.3, 1.4 and 2.7. The §1.4 claims I verified through JN p. 8 and Buz Proposition 2.1 instead.
- [Bel] Bellaïche, *The Eigenbook*, Chapter II. Uncertified; not read.
- [ST], [Amice], [Mah] and [Conrad] are in the cache but outside the sample and were not opened. Col covers the claims they support.

## Source issues

- **Gap** in KL at Remark 2.4.4, p. 39: the source says that for a Tate ring with topologically nilpotent unit z and ring of definition A₀, inf{cⁿ : z^{−n}x ∈ A₀} makes A a Banach ring; it should require z ∈ A₀ (replace z by a power), since otherwise ultrametricity fails (ℚ_p², z=(p,p²)); affects a stated result.
- **Error** in JN (published version) at Lemma 2.1.6: the authors' footnote says the published statement of this norm comparison is incorrect; it should read as the arXiv version 4 statement, with separate bounds for \|a\|_π < 1 and \|a\|_π ≥ 1; affects nothing; corrected in JN arXiv version 4, Lemma 2.1.6 and footnote 3, p. 9.
