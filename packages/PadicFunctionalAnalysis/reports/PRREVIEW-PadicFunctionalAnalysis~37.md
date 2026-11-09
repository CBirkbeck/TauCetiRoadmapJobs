# Review of PadicFunctionalAnalysis (pull request #1854 at 1ccc517)

**Verdict:** needs changes

The gate fails on this head (prnum 5, sorry-examples 1, imports 1, mathlib-subimports 16, no-import-mathlib 1, depcheck 1, outside-folder 2; the build passes). The findings below are against the folder as it stands at this head.

**Overlap and order.** The only commit of this pull request that touches the folder, `4faa251c` (§5.3 and the dependency-order paragraph), is an ancestor of the head of #1807. #1807 then rewrites the folder (`70140e69`). The description orders #1807 before this pull request. Once #1807 merges, this pull request's diff to the folder is empty. Rebase this pull request on #1807 and do not restate its changes here. Each finding below says whether it is still present at #1807's head (`d5922c8d`, the same text as `roadmaps show --pr 1807`). #1808 carries the folder unchanged from this head.

## R01 (P2) — Two headline theorems that can be stated at the pins are missing from `Suggested.lean`

- **Location.** `README.md:10–13` lists the headlines: “Serre's orthonormalisation theorem; continuous splitting …; Amice's basis theorem for analytic stages; the bounded and unbounded Amice transforms; and the universal character”. `Suggested.lean:20–40` (module docstring) states neither of the two below and does not say they cannot be stated.
- **Claim.** Amice's basis theorem (§4.4) and the unbounded Amice bijection (§4.7) are absent. Every carrier both need exists at the pins.
- **Witness.** In a scratch copy, the following elaborates with only a `sorry` warning: `∃ e : C₀(ℕ,E) ≃ₗᵢ[ℤ_[p]] TauCeti.AnalyticStage p h E, ∀ c, e c = TauCeti.AnalyticStage.amiceMap p h ℤ_[p] c`. So does the §4.7 bijection below. The pin proves only `TauCeti.AnalyticStage.norm_amiceMap_le` (`Distribution/Amice/Basis.lean:537`).
- **Repair.** Add the two statements that elaborated (sources: [Col] Théorème I.4.7, p. 15, and Théorème II.2.2, p. 30):
  ```lean
  theorem amiceMap_isometryEquiv (h : ℕ) {E : Type*} [NormedAddCommGroup E] [Module ℤ_[p] E]
      [IsBoundedSMul ℤ_[p] E] [IsUltrametricDist E] [CompleteSpace E] :
      ∃ e : C₀(ℕ, E) ≃ₗᵢ[ℤ_[p]] TauCeti.AnalyticStage p h E,
        ∀ c, e c = TauCeti.AnalyticStage.amiceMap p h ℤ_[p] c := by sorry
  theorem amice_unbounded (K : Type*) [NontriviallyNormedField K] [NormedAlgebra ℚ_[p] K]
      [IsUltrametricDist K] [CompleteSpace K] [Algebra ℤ_[p] K] [IsBoundedSMul ℤ_[p] K] :
      ∃ A : {μ : TauCeti.LocallyAnalytic p K K →ₗ[K] K // ∀ h, ∃ C, ∀ c : TauCeti.AnalyticStage p h K,
          ‖μ (TauCeti.LocallyAnalytic.ofStage K h c)‖ ≤ C * ‖c‖} ≃ {F : K⟦X⟧ // F.OnOpenDisc 1},
        ∀ μ n, (A μ).1.coeff n = μ.1 (TauCeti.LocallyAnalytic.ofStage K 0
          (TauCeti.AnalyticStage.amiceMap p 0 K (ZeroAtInftyContinuousMap.single n ((n.factorial : K)⁻¹)))) := by sorry
  ```
  The subtype is the README's own carrier for D(ℤ_p,K): K-linear functionals on the algebraic union that are bounded on every stage, with no global topology. It is a predicate on native carriers.
- **At #1807's head.** Amice's theorem is stated (`amiceMap_bijective_and_norm_eq`). The docstring calls the unbounded bijection not statable because “`TauCeti.LocallyAnalytic` carries no topology”. The statement above needs no topology, so this half of the finding is still present there.

## R02 (P2) — The completed-extension corollary of §2.4 takes supplies from LocallyAnalyticDistributions (later in the order) and from AdicSpacesPartII, which consumes §2.4

- **Location.** `README.md:473–476`: “Use the separated completed projective tensor and functoriality of LocallyAnalyticDistributions §0.0, and compare it … with the Banach-module completed tensor of AdicSpacesPartII §R0.3”. The same dependency appears at lines 44–46 and 1052–1055. `README.md:815–816` also compares with “the general distribution product supplied later by LocallyAnalyticDistributions §1.4”.
- **Claim.**
  - The dependency check reports an upward supply.
  - AdicSpacesPartII §R0.5 (*banach-countable-type-orthogonal-basis*) consumes this roadmap's §§2.2 and 2.4, so the two roadmaps supply each other.
  - §R0.3 is the wrong section: Banach-module completed tensors are §R0.5.
  - AdicSpacesPartIII §R3.6 already owns the transport of the §2.4 splitting through completed tensors.
- **Witness.** The dependency check prints `UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#44) at README lines [1052]`. AdicSpacesPartII README lines 2820 and 2862 (in §R0.5) cite “PadicFunctionalAnalysis §§2.2, 2.4”.
- **Repair.**
  - Take the tensor only from the pinned `TauCeti.Huber.BanachModule.CompletedTensor`, which is what #1807 does, or delete the corollary and name AdicSpacesPartIII §R3.6 as its owner.
  - Delete the LocallyAnalyticDistributions supply at lines 44–46, 473–476 and 1052–1055.
  - Delete the comparison with LocallyAnalyticDistributions §1.4 at lines 815–816. That roadmap lists the §1.4 dictionary as its own.
  - Rerun the dependency check; it must print no UPWARD line.
- **At #1807's head.** Resolved: the tensor is pinned and LocallyAnalyticDistributions appears only as a consumer.

## R03 (P2) — PadicFunctionalAnalysis and PadicMeasuresIwasawaAlgebras still supply each other

- **Location.** `README.md:927–935`: “use the general coefficient-extension interface … Use the supplier's coefficient extension for `extendIntegralMeasure`”. Also lines 32 and 559–560 (“General integration and measure topologies come from PadicMeasuresIwasawaAlgebras Layers 0–1”) and line 616 (“extension to `ℚ_p`”).
- **Claim.** This pull request cuts only the §1.7 general-comparison edge. Coefficient extension is still taken from PadicMeasuresIwasawaAlgebras Layer 1, while that roadmap's §§2.2, 2.5, 2.11, 3a.1 and 4.5 consume this roadmap's §§3.4 and 5.1–5.3. The loop the description says it cuts therefore remains.
- **Witness.** PadicMeasuresIwasawaAlgebras README:
  - line 367: “with O coefficients supplied by §1.7”;
  - lines 352–366: those sections are supplied by “PadicFunctionalAnalysis §3.4 … §5.3”;
  - lines 1111–1113: Layer 1 names this roadmap's §§3.4 and 5.3 as its consumers.
- **Repair.**
  - Take coefficient extension from the pinned `AbstractMeasure.extendCoefficients` and `AbstractMeasure.existsUnique_apply_comp_eq_iff_norm_le_one` (`TauCeti/NumberTheory/Padics/Measure/ExtendCoefficients/Basic.lean`).
  - Take the measure function from `TauCeti.measureFun` (`Measure/Units/WeightIntegral.lean:77`).
  - List PadicMeasuresIwasawaAlgebras only as a consumer (lines 32, 559–560, 927–935).
- **At #1807's head.** Resolved: that roadmap appears only under consumers.

## R04 (P2) — §5.2 parametrises weights without a bounded (contractive) structural map

- **Location.** `README.md:857–860`: “For `G=ℤ_pˣ` and a complete normed `ℤ_p`-algebra `R`, parametrise weights by a character `η:Δ→Rˣ` and a topologically nilpotent `T_κ=κ(γ)−1`.”
- **Claim.** The statement is false without the contractive-action hypothesis that §3.2 and §5.3 impose.
- **Witness.** Make ℂ a ℤ₂-algebra through a field isomorphism ℂ₂ ≅ ℂ and give it the usual norm, which is complete. Let κ: ℤ₂ˣ → ℂˣ send `γ` to −1 (it is locally constant, hence continuous). Then `T_κ = −2` and `‖T_κ^n‖ = 2^n` does not tend to 0.
- **Repair.** Change the clause to “a complete ultrametric normed commutative `ℤ_p`-algebra `R` with `IsBoundedSMul ℤ_p R`”. This is exactly the hypothesis of the pinned `TauCeti.weightSpaceEquiv` (`NumberTheory/Padics/WeightSpace.lean:287`), which proves the parametrisation; cite it. With that hypothesis the ℂ example is excluded, since `‖2·1‖ ≤ |2|₂ = 1/2` fails in ℂ.
- **At #1807's head.** Resolved.

## R05 (P3) — `Suggested.lean` restates the pinned Tau Ceti library

- **Location.** `Suggested.lean:53–380`. `README.md:176–188` (“Existing foundations”) does not cite those declarations.
- **Claim.** Most declarations in `Suggested.lean` duplicate proved declarations of the pinned Tau Ceti, so they are padding.
- **Witness.** In a scratch copy, the sorried theorems at lines 100, 106, 111, 119, 220, 251, 257, 264 and 274 each close with one pinned lemma, and the file elaborates without error. The table and the lists below give the detail.

  | Theorem | Closed by |
  | --- | --- |
  | `exists_tateSeminorm` (l. 100) | `TauCeti.Huber.exists_tateSeminorm hb ha hϖ` |
  | `tateGauge_eq_zero_iff` (l. 106) | `TauCeti.Huber.tateGauge_eq_zero_iff` with `t2Space_iff_forall_tateGauge_eq_zero_iff` |
  | `tateGauge_equiv` (l. 111) | `TauCeti.Huber.tateGauge_equiv` |
  | `tateGauge_rpow` (l. 119) | `TauCeti.Huber.tateGauge_rpow` |
  | `exists_continuousLinearEquiv_prod_of_countableType` (l. 220) | `TauCeti.exists_continuousLinearEquiv_prod_of_countableType … hi.isEmbedding …` |
  | `norm_toCLMEquiv_eq_iSup_coeff` (l. 251) | `AbstractMeasure.norm_toCLMEquiv_eq_iSup_coeff` |
  | `mem_range_amiceTransform_iff` (l. 257) | `AbstractMeasure.mem_range_amiceTransform_iff`, with `BddAbove` unfolded |
  | `existsUnique_integral_iff_norm_le_one` (l. 264) | `AbstractMeasure.existsUnique_integral_iff_norm_le_one` |
  | `amiceTransform_phiMeasure` (l. 274) | `AbstractMeasure.amiceTransform_phiMeasure` |

  - **Proved restatements.**
    - Lines 70–84 restate `TauCeti.NormedRing.PseudoUniformizer.isPseudoUniformizer` and the instance `IsTate.isTateRing`.
    - `opNorm_eq` (line 137) is `rfl`.
    - Lines 238 and 244 restate Mathlib's `PadicInt.mahlerEquiv` and `coeff_amiceTransform`.
  - **Duplicated definitions** (pinned counterpart in parentheses):
    - `PseudoUniformizer`, `IsTate` (`TauCeti.NormedRing.*`);
    - `tateGauge` (`TauCeti.Huber.tateGauge`, same body);
    - `opNorm` and `le_opNorm` (`ContinuousLinearMap.ringOpNorm` and `le_ringOpNorm`);
    - `single` (`ZeroAtInftyContinuousMap.single`);
    - `IsOrthonormalFamily`, `IsOrthonormalBasis`, `IsONable`, `IsPotentiallyONable`, `HasPr`, `exists_isOrthonormalBasis_iff` and `exists_linearIsometryEquiv_of_isOrthonormalBasis` (`TauCeti.*` in `Bases/Orthonormal.lean` and `Bases/PotentiallyONable.lean`, and `IsOrthonormalBasis.repr`);
    - `matrixCoeff` (`ContinuousLinearMap.matrixCoeff`);
    - `phiMeasure` (`AbstractMeasure.phiMeasure`);
    - `LocallyAnalytic` (`TauCeti.AnalyticStage`; the local name also clashes with the pinned direct limit `TauCeti.LocallyAnalytic`);
    - `amiceDualNorm` and the two Amice inequalities (`TauCeti.amiceDualNorm`, `gaussNorm_amiceRadius_le_amiceDualNorm`, `amiceDualNorm_le_mul_gaussNorm_amiceRadius_succ`);
    - `WeightSpace`, `TCoord`, `weightTest` and `existsUnique_character_of_norm_lt_one` (`TauCeti.WeightSpace`, `.coord`, `.weightTest`, `TauCeti.weightSpaceEquiv`).
  - **README side.** README §5.3 calls the finite-factor comparison Λ ≃ ℤ_p[Δ]⟦T⟧ a “new target” (line 891). The pin has it as `TauCeti.completedGroupAlgebra.prodPowerSeriesCoordinate` (`CompletedGroupAlgebra/ProductCoordinate.lean:91`).
- **Repair.**
  - Delete these declarations from `Suggested.lean`. The README keeps the statements.
  - Restate the declarations that remain on the pinned carriers: `exists_finset_norm_le` (the pin assumes `CompleteSpace P`, not Noetherian), `exists_character_of_hasEval`, `measurePairing_injective`, and the R01 statements.
  - In the README, cite each pinned declaration by name and file at its target.
- **At #1807's head.** Resolved.

## R06 (P3) — Imports (gate rules imports, mathlib-subimports, no-import-mathlib)

- **Location.** `Suggested.lean:1–16`: `import Mathlib.Analysis.Normed.Group.Ultra` … `import Mathlib.RingTheory.Noetherian.Defs`.
- **Claim.** The file imports 16 Mathlib submodules and has no `import Mathlib`.
- **Witness.** `gate.md`, rules imports, mathlib-subimports and no-import-mathlib.
- **Repair.** Replace lines 1–16 with `import Mathlib`. Keep only the `TauCeti.*` modules actually used: those of R01 and R05 (`TauCeti.NumberTheory.Padics.Distribution.Amice.Basis`, `…Distribution.LocallyAnalytic`, `TauCeti.RingTheory.PowerSeries.OpenDisc.Basic`, `TauCeti.NumberTheory.Padics.WeightSpace`, …).
- **At #1807's head.** Resolved.

## R07 (P3) — An admitted `example` that also mirrors a README Check (gate rule sorry-examples)

- **Location.** `Suggested.lean:318–325`: `example (h : ℕ) : let F : PowerSeries ℚ_[p] := PowerSeries.mk fun n ↦ … := by sorry`.
- **Claim.** An admitted example tests nothing. It also restates the §4.7 Check on the derivative functional (README lines 823–825).
- **Witness.** `gate.md`, rule sorry-examples, line 318.
- **Repair.** Delete it; the README keeps the Check.
- **At #1807's head.** Resolved.

## R08 (P3) — `Suggested.lean` is written as an interface catalogue, not an acceptance test

- **Location.** `Suggested.lean:21–25`: “representative interfaces … These signatures fix selected conventions and supplier contracts, not an exhaustive checklist”. `README.md:18–19` says the same.
- **Claim.**
  - The docstring is not “<title>: target signatures”.
  - It does not list the headlines that the pinned library already proves (Serre's theorem, the splitting, the bounded Amice transform), nor those that cannot be stated (§§5.5–5.6).
  - 25 of the 48 declarations have no docstring (for example lines 100, 131, 213, 251, 297, 333, 356).
  - Several definitions are used by no theorem: `IsDiscRealization` (l. 292), `matrixCoeffInputFirst` (l. 208), `LocallyAnalytic` (l. 288), `IsONable`, `IsPotentiallyONable`, `HasPr`, `matrixCoeff`.
- **Witness.** For each of the definitions listed as unused above, `grep` finds no theorem of the file whose statement contains its name.
- **Repair.**
  - Rewrite the docstring in the required form and list each headline as stated, proved at the pin (with its name), or not statable (with the missing carrier).
  - Delete the unused definitions.
  - Give every remaining declaration a docstring.
- **At #1807's head.** Resolved.

## R09 (P3) — README backticks names of this roadmap's own that `Suggested.lean` does not declare, and the reverse

- **Location.** README §3.4 line 638 (“`pMultiplesIndicator`, `weightMeasure`, `existsUnique_psiMeasure`”). Also line 621 (`isBoundedSMul_padicInt_padic`), line 862 (`nonempty_weightSpace_equiv`), lines 903 and 916 (`eq_aeval_binomialSeries`, `isLinearTopology_padicInt`), line 923 (`amiceTransform_completedGroupAlgebra_compat`) and lines 934–938 (`extendIntegralMeasure`, `measureFun`, `measureFun_norm_le`, `measureFun_injective`).
- **Claim.**
  - Twelve backticked names are declared nowhere in `Suggested.lean`.
  - Conversely, about twenty Lean names never appear in the README, for example `TCoord`, `measurePairing_injective`, `IsDiscRealization` and `exists_linearIsometryEquiv_of_isOrthonormalBasis`.
  - PadicMeasuresIwasawaAlgebras cites these as `TauCetiRoadmap.PadicFunctionalAnalysis.measureFun` and similar (its README lines 365–367), names that do not exist.
- **Witness.** `grep` of `Suggested.lean` finds none of the twelve. Several exist only at the pinned Tau Ceti under other namespaces, for example `AbstractMeasure.pMultiplesIndicator` (`Measure/Multiples.lean:54`) and `TauCeti.measureFun` (`Measure/Units/WeightIntegral.lean:77`).
- **Repair.**
  - Write each name that exists at the pin with its fully qualified pinned name: also `AbstractMeasure.existsUnique_psiMeasure` (`Measure/PhiPsi.lean:247`), `TauCeti.measureFun_injective` (line 113) and `TauCeti.norm_measureFun_le` (line 126).
  - Declare in `Suggested.lean` the names that are headlines.
  - For the rest, drop the backticks.
  - Mention every remaining Lean name in the README.
  - Give the old → new name mapping once under consumers, as #1807 does.
- **At #1807's head.** Resolved.

## R10 (P3) — Sampled theorems carry no locator at the claim, and some locators are imprecise

- **Location.** In §§2.3, 2.4, 2.5, 4.4, 4.6, 4.7, 5.1, 5.2, 5.4 and 5.6 sources appear only on layer-level lines (for example `README.md:832–833`, “Sources: [Am], [Col] I.4 and II.2, [ST] and [RJW] Theorem 3.43”). Other problems:
  - “[LWX] §3.15” (line 1015);
  - the key “[Am]” (line 1092), while the manifest key is `Amice`;
  - “LocalFieldsRamification” with no section (lines 757 and 1042).
- **Claim.** Each theorem needs its own locator. The ones I verified (see Verified sound) are:
  - Serre's theorem: [Serre] Lemme 1 and Prop. 1, p. 70.
  - Dual of `c₀`: [Serre] Prop. 3 and Corollaire, p. 71.
  - Finite coordinates: [Buz] Lemma 2.3, p. 10.
  - (Pr) lifting: [Buz] p. 18 and Lemma 2.11, p. 19.
  - Amice basis: [Col] Th. I.4.7, p. 15, with Lemme I.4.9, p. 16.
  - Mahler criterion: [Col] Cor. I.4.8, p. 15.
  - `S_h ≤ D_h ≤ p S_(h+1)`: [Col] Th. II.2.2, p. 30.
  - Λ and `T_κ`: [LWX] Notation 2.1, p. 8.
  - Locally analytic weights and conductor valuations: [LWX] p. 9.
  - The annular coefficient ring: [LWX] Lemma 3.15, p. 21.
  - The Tate gauge: [JN] Remark 2.1.3(1), p. 8.
- **Witness.** For example, `LWX line 1215` is “Lemma 3.15”, not a section, and the page marker before it is p. 21.
- **Repair.** Put these locators in parentheses at each claim. Rename the key [Am] to [Amice]. Cite LocalFieldsRamification Layer 1 (Teichmüller and the log/exp isomorphism).
- **At #1807's head.** Mostly resolved; its commit message says “locators”.

## R11 (P3) — Pull-request numbers, process vocabulary, and stale or broken links (gate rule prnum)

- **Location.**
  - Lines 29–31, 158 and 166 carry PR numbers (gate).
  - Lines 37, 40 and 43 link AdicSpacesPartII and AdicSpacesPartIII by PR URL although both are on main.
  - Process words: “the prototype” (lines 49, 154, 163, 936), “production” (line 164), “when available” (lines 174, 182, 334), “Retain the consumer names” (line 299), “This is the requested specialised …” (line 922, added by this pull request).
  - Line 34 links `../ProfiniteProPGroups/README.md`, which does not exist; the roadmap is in `Completed/`.
  - Lines 1120–1121 link RestrictedPowerSeries and NewtonPolygons to a personal fork.
- **Claim.** These break the timeless rule and the citation-by-name rule.
- **Witness.**
  - Mathlib PR #42836 has landed: `AbstractMeasure.amiceTransformₐ` and `amiceTransformEquivₐ` are in `Mathlib/NumberTheory/Padics/Measure/AmiceTransform.lean` at the pin.
  - Mathlib's `opNorm` at the pin still assumes a field (`Mathlib/Analysis/Normed/Operator/Basic.lean:51`). Tau Ceti supplies `ContinuousLinearMap.ringOpNorm`.
- **Repair.**
  - Cite the pinned names in place of “follow Mathlib PR …”.
  - Use relative links on main (`../AdicSpacesPartII/README.md`, `../../Completed/ProfiniteProPGroups/README.md`, `../RestrictedPowerSeries/README.md`).
  - Delete the process words. Line 922 becomes “State the comparison `amiceTransform_completedGroupAlgebra_compat` …”.
- **At #1807's head.** Resolved.

## R12 (P3) — README shape

- **Location.** Line 1 (`# P-adic functional analysis`). There is no `**Summary.**` paragraph, no `## Exact supplier contracts`, no `## How to read the build` and no `## Downstream consumers`.
- **Claim.**
  - Layers end with `**Dependencies.**` paragraphs, not `### Examples` and `### Dependencies` subsections.
  - Definitions have no API bullet lists. For example, `LA_h`, `D(ℤ_p,K)`, `WeightSpace` and `H` have no per-definition bullets and no list of ≥3 Checks.
  - Checks are written as paragraphs.
  - “Existing Lean work” points to a personal repository.
- **Witness.** `grep -c '^### Examples' README.md` returns 0. Compare with `Completed/ProfiniteProPGroups/README.md`.
- **Repair.**
  - Use the house shape: `# Roadmap: p-adic functional analysis` with a `**Summary.**`, the four sections named above, per-layer `### Examples` and `### Dependencies`, API bullets, and ≥3 Check bullets per definition.
  - Move the external Lean work into Scope as prose without URLs.
- **At #1807's head.** Mostly resolved. The title and `**Summary.**` are still missing there.

## R13 (P3) — Files outside the pull request's named folders (gate rule outside-folder)

- **Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.
- **Claim.** This brief does not list either folder as one of this pull request's roadmap folders.
- **Witness.** `gate.md`, rule outside-folder.
- **Repair.** Move these two edits to a pull request whose folder list names them, or add the folders to this pull request's declared set.
- **At #1807's head.** Not applicable; this is a property of the pull request.

## Verified sound

**Gate and dependency check.** I read `gate.md` and reran the dependency check:

```text
UPWARD: PadicFunctionalAnalysis (on main) -> LocallyAnalyticDistributions (#44) at README lines [1052]
depcheck: 239 roadmaps, 2352 edges, 1 problem(s)
```

The edges of R03 are not reported, because the tool treats roadmaps on main as available to all. I found them by reading both READMEs.

**Elaboration.** `lake env lean TauCetiRoadmap/PadicFunctionalAnalysis/Suggested.lean` exits 0 in about 14 s with exactly 20 warnings, all `declaration uses 'sorry'`.

**`#check` comparison.** I compared all 48 elaborated signatures in `signatures.md` with the README:
- The four leads flagged as “dropped binder” (`exists_tateSeminorm`, `tateGauge_eq_zero_iff`, `tateGauge_equiv`, `tateGauge_rpow`) are false positives. `include ha hϖ hnil hb` places all four hypotheses in each type, as anonymous arrows.
- The probe's unused-variable linter shows `hnil` unused in all four, `hϖ` also unused in `tateGauge_equiv`, and five binders unused in `tateGauge_rpow`. This is a P3 note only, and moot under R05.
- `le_opNorm` correctly keeps `IsTate`. The `(ℤ_p, |x|²)` Check of Layer 1 shows that the hypothesis is needed.

**Scratch probes** (in the scratch directory, not in the pull request):
- `Probe.lean`: the nine closures of R05; it elaborates with no error.
- `Headlines.lean` and `Headlines2.lean`: the R01 statements, plus `TauCeti.completedGroupAlgebra ℤ_[p] ℤ_[p]ˣ ≃ₐ[ℤ_[p]] PowerSeries (MonoidAlgebra ℤ_[p] (ZMod (p ^ padicUnitsDepth p))ˣ)` with `of (padicUnitsGenerator p) ↦ 1 + X`. All elaborate with `sorry` only.

**Library declarations opened at the pins (25).**
- Tau Ceti:
  - `RingTheory/Huber/TateGauge/Basic.lean`: `tateGauge` (78), `tateGauge_rpow` (191), `exists_tateSeminorm` (355), `tateGauge_equiv` (376), `tateGauge_eq_zero_iff` (390, which needs `R0Space`), `t2Space_iff_forall_tateGauge_eq_zero_iff` (400).
  - `Analysis/Normed/Ring/PseudoUniformizer.lean`: `PseudoUniformizer` (136), `IsTate` (150), `isPseudoUniformizer` (275), instance `isTateRing` (313).
  - `Analysis/Normed/Operator/RingOpNorm.lean`: `ringOpNorm` (149), `le_ringOpNorm` (340), `ringOpNorm_eq_opNorm` (402).
  - `Analysis/Normed/Module/Bases/Orthonormal.lean`: `IsOrthonormalFamily` (95), `IsOrthonormalBasis` (107), `IsONable` (116), `repr` (370), `exists_isOrthonormalBasis_iff` (463).
  - `Analysis/Normed/Module/Bases/PotentiallyONable.lean` (74, 89); `Analysis/Normed/Module/Bases/ResidueBasis.lean`: `isOrthonormalBasis_iff` (300), which is Serre's theorem; `Analysis/Normed/Module/Bases/Splitting.lean` (87).
  - `Topology/ContinuousMap/ZeroAtInfty/FiniteCoordinates.lean:95` and `Topology/ContinuousMap/ZeroAtInfty/Matrix.lean:90`.
  - `NumberTheory/Padics/Measure/`: `MahlerDuality.lean` (186, 201), `IntegralUnitBall.lean` (84), `PhiPsi.lean` (83, 144, 247), `ExtendCoefficients/Basic.lean`, `Units/WeightIntegral.lean` (77, 113, 126).
  - `NumberTheory/Padics/Distribution/`: `AnalyticStage.lean` (107), `LocallyAnalytic.lean` (45, 55), `Amice/Basis.lean` (494, 537), `Amice/Norm.lean` (231, 289, 297).
  - `NumberTheory/Padics/WeightSpace.lean` (81, 94, 287); `UnitsDecomposition/Logarithm.lean` (75, 243, 318); `RingTheory/PowerSeries/OpenDisc/Basic.lean` (100); `CompletedGroupAlgebra/ProductCoordinate.lean` (91).
- Mathlib: `MahlerBasis.lean` (`mahlerEquiv`, `mahlerTerm`), `Measure/AmiceTransform.lean` (`amiceTransform`, `coeff_amiceTransform`, `injective_amiceTransform`, `amiceTransformEquiv`, `amiceTransformₐ`, `amiceTransformEquivₐ`), `Analysis/Normed/Module/Bases.lean` (`UnconditionalSchauderBasis`), `PowerSeries/Evaluation.lean` (`HasEval`), `PowerSeries/Binomial.lean` (`binomialSeries`).

**Cross-roadmap citations resolved (11).**
- On main:
  - AdicSpaces Layer 0, in `Completed/` ✓.
  - AdicSpacesPartII §R0.4 consumes §0.4 (README lines 2273–2336) ✓. Its §R0.3 is the Huber-pair tensor ✗ (R02).
  - AdicSpacesPartIII §R3.6 (lines 606 and 10472) ✓.
  - ProfiniteProPGroups Layer 9, in `Completed/`, lines 2192–2255 ✓; the link path is wrong (R11).
  - RestrictedPowerSeries Layers 0–2, §2.4 and §7.1 ✓.
  - NewtonPolygons Layer 1 ✓.
  - LocalFieldsRamification Layer 1 (Teichmüller at line 343, log/exp at line 395) ✓.
  - CompactOperators: a consumer (line 24) ✓.
  - PadicMeasuresIwasawaAlgebras §§1.7 (909), 2.2, 2.11, 3a.1 and 4.5 (2620) ✓. The new §5.3 sentence “§4.5 consumes it” is confirmed by that README's line 366.
- Open: LocallyAnalyticDistributions at its head (`roadmaps show`) consumes Layers 0–4 (its lines 56 and 175–211) and claims the tensors and the §1.4 dictionary (line 104). RigidAnalyticGeometry (this pull request) consumes Layers 0–2 one way.

**Ownership against open pull requests.**
- I checked the overlap list: #1807 and #1808 change this roadmap, with the order stated in the description; LocallyAnalyticDistributions (#854) and RigidAnalyticGeometry are the nearest in vocabulary.
- I grepped open Lean files for `def tateGauge|amiceDualNorm|WeightSpace|IsONable|HasPr|measureFun|phiMeasure`. The only hits are copies of this folder (main, #1807, #1808, #1854).
- No other open roadmap owns these objects.

**Sources read at their locators.**
- [JN] Def. 2.1.2 (p. 7), Remark 2.1.3 (p. 8), Def. 2.1.5 (p. 8) and Lemmas 2.1.6–2.1.7 (pp. 9–10), v4.
- [KL] Remark 2.4.4 (p. 39).
- [Serre] §1 Lemme 1, Prop. 1, Cor. and Prop. 2 (p. 70); Prop. 3 and Cor. (p. 71).
- [Buz] Prop. 2.1 and Lemma 2.2 (p. 6); ON bases and matrices (pp. 7–9); Lemma 2.3 (p. 10); (Pr) and Lemma 2.11 (pp. 18–19).
- [Conrad] Lemma 1.1.5 and its proof using BGR 2.7.1/4 (pp. 6–7).
- [Col] §I.4 (pp. 13–17: Lemme I.4.5, Th. I.4.7, Cor. I.4.8, Lemme I.4.9) and Th. II.2.2 (p. 30).
- [RJW] Def. 3.42 and Th. 3.43 (pp. 24–25).
- [LWX] Notation 2.1 (p. 8), m-local analyticity and conductor valuations (p. 9), Lemma 3.15 (p. 21).

| Statement | Instances tried | Values computed (each side) | Result |
| --- | --- | --- | --- |
| §0.4 gauge `(ℤ_p,p,a=p)` | `x=p²` | `g=p^(−2)`; `|p²|_p=p^(−2)` | equal ✓ |
| §0.4 `(ℤ_p,p²,p)` | `x=p,p²` | `g(p)=1`, `g(p²)=p⁻¹`; `g(p)²=1≠p⁻¹` | Check true; not multiplicative ✓ |
| §0.4 `ϖ∉A₀` control | `A₀={x−y∈p²ℤ_p}`, `ϖ=(p,p²)` | index sets `{0,−2,−3,…}`, `{1,−1,−2,…}`, `{−2,−3,…}` give `g=1, a⁻¹, a²` | `a²>max(1,a⁻¹)`: not ultrametric ✓ (KL gap) |
| §0.4 `N=max(|x|,|x|²)` | `|ϖ|=r<1` | `N(ϖ)N(ϖ⁻¹)=r·r⁻²=r⁻¹`; `N(1)=1` | no multiplicative unit ✓ |
| §0.4 zero ring | `A=0` | index set `ℤ`, `inf a^(−n)=0` | gauge 0 ✓ |
| `tateGauge_rpow` | `x=p`, `(ℤ_p,p)` | `g_b=b⁻¹`; `(a⁻¹)^(log b/log a)=b⁻¹` | equal ✓ |
| §1.4 Check `(ℤ_p,|x|²)→(ℤ_p,|x|)` | `x=p^n` | `p^(−n)≤C p^(−2n)` fails as `n→∞` | continuous, unbounded ✓ |
| §2.3 rescaled line | `‖x‖=p^(−1/2)|x|` | values in `p^(−1/2)p^ℤ ∉ p^ℤ` | potentially but not isometrically ON ✓ |
| §2.4 splitting | `M=0`; `N=0` | `d=q`; `d=i⁻¹` | both trivial cases hold ✓ |
| §2.5 dual of `c₀` | `b=(1,1,…)` | `‖φ_b‖=1=sup|b_i|`; `b∉c₀` | isometric, not `c₀` ✓ |
| §2.6 `exists_finset_norm_le` | `P=0`; `P=ℚ_p·(1,p,p²,…)` | `S=∅,C=1`; `S={0},C=1`, `‖f‖=|f_0|` | ✓ |
| §2.6 adapter | `u:[a b]`, `v:[[c],[d]]` | `B(u∘v)=[ac+bd]`; `B(v)B(u)=[ca+db]` | equal ✓ |
| §2.7 | `1+pS`; `p` below diagonal | `‖(1+pS)x‖=‖x‖`; column 0 `(1,p,p,…)` | isometry; not null, so excluded ✓ |
| §3.2 Mahler `x²` | `x=3` | `3+2·3=9` | ✓ |
| §3.4 `x^p−x` | `p=3` | `6C(x,2)+6C(x,3)`, norm `1/3`; sup at `x=2`: `|6|=1/3`; Gauss norm `1` | ✓ |
| §3.4 `φ,ψ` | `p=3` | `φδ₂=δ₆`, `ψδ₆=δ₂`, `ψδ₁=0`; `A_{φδ₁}=(1+T)³=A_{δ₁}((1+T)³−1)` | ✓ |
| integral unit ball | `ν=p⁻¹δ₀`; `ν=δ₀` | `‖ν‖=p`, `μ(1)=p⁻¹∉ℤ_p`; `‖δ₀‖=1`, `μ=δ₀` | both sides false; both true ✓ |
| §4.3 transition, `E=𝔽_p` | `x^p−x`, `h=0` | `d_0=b^p−b≡0`; `d_j=p^j·…=0` for `j≥1` | non-injective ✓ |
| §4.4 Amice basis | `h=0,p=2,n=2` | `e=2C(x,2)=x²−x`; disc coefficients `(0,−1,1)` | integral, norm 1 ✓ |
| §4.4 multiplier | `p=2,h=0,n=4` | `4!/2!=12`, `|12|₂=1/4`; formula `2^(−⌊4/2⌋)=1/4` | equal ✓ |
| §4.6 criterion | `p=2`, `‖t‖=2^(−1/2)` | bounds `2^(−1/2)` (h=1) and `2^(−1/4)` (h=2) | fails at h=1, holds at h=2 ✓ |
| §4.6 boundary | `p=3,h=0`, `‖t‖=3^(−1/2)`, `n=3^k` | `‖t^n‖/‖n!‖=3^(−1/2)` | does not tend to 0 ✓ |
| §4.7 `S_h≤D_h≤pS_{h+1}` | `δ₋₁` | `S_h=D_h=1`, `pS_{h+1}=p` | ✓ |
| §4.7 same | derivative, `p=2,h=0` | `S₀=1/2`, `D₀=1`, `2S₁=2` | ✓ |
| §4.7 `b_n=1/n!` | `h=0,1` | `D₀=1`; `D₁=sup 2^⌊n/2⌋=∞` (`p=2`) | ✓ |
| §5.1 decomposition | `p=3,x=2`; `p=2,x=3` | `x/ω(x̄)=−2∈1+3ℤ₃`; `−3∈1+4ℤ₂` | ✓ |
| §5.2 conductor valuations | `(3,m=2)`, `(2,m=3)`, `(2,m=4)` | `v(ζ₃−1)=1/2`, `v(−2)=1`, `v(i−1)=1/2` | match the formulas ✓ |
| §5.2 parametrisation | `R=ℂ`, `κ(γ)=−1` | `T_κ=−2`, `‖T_κ^n‖=2^n` | false without contractive action (R04) |
| §5.4 level | `p=3`, `ψ` of conductor 9 | `‖T‖=3^(−1/2)`; bounds `3^(−1/2)` (h=1), `3^(−1/6)` (h=2) | analytic at h=2, not at h=1 ✓ |
| §5.5 radius | `p=3,h=1,‖c‖=‖t_h‖=1/3` | both conditions give `r<3^(1/2)` | consistent ✓ |
| §5.6 `H` | `Σ U^j`, `TU=p` | `v(d_{−j})=j≥j`; `‖U^j‖=1` | in `H`, not gauge-convergent ✓ |
| §5.3 at `p=2` | `ℤ₂[Δ]` | quotient by `(2,δ−1)` is `𝔽₂` | local; LWX's `m_Λ:=(p,T)` is consistent ✓ |
| `measurePairing_injective` | `δ_a−δ_b` | trivial weight → 0; `κ(x)=x` → `a−b≠0` | ✓ |
| `measurePairing_norm_le` | `δ_a` | `|κ(a)|=1=‖δ_a‖` | equality ✓ |
| `exists_character_of_hasEval` | `S=0`; `S=ℤ_p`, `z=p` | unique `κ`, `TCoord=0=z`; `κ(γ)=1+p` | ✓ |

## Not verifiable

- [Sch] §§3–4 and §10, [BGR] 2.7.1/4 and 3.7, and [Bel] §II.1 are paywalled and uncertified in the manifest. They are cited by locator only and I did not read them.
- [ST] and [Am]: the texts are cached, but in the sampled sections the README gives them no locator, so there was nothing to check against (R10).
- [Mah] (§3.2) was not in the sample.

## Source issues

- **Gap** in KL at Remark 2.4.4, p. 39: the source says the gauge `inf{c^n : z^(−n)x∈A₀}` makes any Tate ring with topologically nilpotent unit `z` a Banach ring; it should require `z∈A₀`, and completeness and separatedness for “Banach”; affects nothing (README §0.4 states the hypotheses and its Check gives the counterexample).
- **Error** in JN (published version, Algebra Number Theory 13, 2019) at Lemma 2.1.6: the authors' footnote 3 on p. 9 of v4 says the published norm comparison is incorrect; it should be the v4 bounds `|a|_ϖ≤C₁` for `|a|_π<1` and `|a|_ϖ≤C₂|a|_π^s` otherwise; affects nothing (the README cites v4); corrected in print at arXiv v4, Lemma 2.1.6.
