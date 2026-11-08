# Review of SelfAdjointSpectralTheory (pull request #1854 at c07dda7)
Folder: `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/`
**Verdict:** needs changes

This is a full review of the folder. The change this pull request makes here, moving SA-B81–B84 to BanachSpaceTheory B5, is correct (see Verified sound). The findings below concern the folder as it stands on main and at this head. The worker's gate fails at this head on `blob` (5), `sorry-data` (20), `imports` (1), `readme-ids-missing` (4) and `outside-folder` (2). The build passes, and the dependency check reports no problem.

## R01 (P1) — Sorry'd data makes the stated theorems false

**Location.** `Suggested.lean` lines 83–88, 112, 164–184, 209, 217, 270, 278, 285, 302, 325, 333, 372, 432, 440, 680, 698 and 753 (the gate's 20 `sorry-data` hits). Example, line 112: "noncomputable def generator (U : OneParameterUnitaryGroup H) : H →ₗ.[ℂ] H := sorry".

**Claim.** When the type of a `sorry` body does not mention the arguments, the body elaborates to one constant. As a result:
- `generator`, `ProjValMeasure.diagMeasure`, `scalarMeasure`, `integral`, `spectralPVM`, `genToGroup` and `yosidaGroup` ignore their inputs.
- The `CommRing`, `StarRing`, `Algebra` and `StarModule` instances on `BoundedBorelFunction` have nothing to do with pointwise operations. So "`borelCalculus` is a ⋆-homomorphism" is multiplicativity for an unknown multiplication.

Every theorem stated about these objects is false or vacuous. That includes the headlines `isSelfAdjoint_generator`, `spectralPVM_resolvent_formula`, `generator_genToGroup` and `tendsto_yosidaGroup`.

**Witness.** At the pins, `generator U = generator V`, `P.diagMeasure ξ = Q.diagMeasure ψ` and `spectralPVM A hA = spectralPVM B hB` all hold by `rfl`. I also proved in Lean the negations of `ProjValMeasure.inner_proj` (any PVM on ℂ, ξ = 1, 2) and of `generator_genToGroup` (H = ℂ, A = 0, 1).

**Repair.** Delete every sorry'd `def` and `instance`, and the sorry'd proof fields of `toSemigroup`. Then:
- **Bounded Borel symbols.** Use a carrier that has real proofs. For example, `boundedBorel X : StarSubalgebra ℂ (X → ℂ)` with carrier `{f | Measurable f ∧ ∃ M, ∀ x, ‖f x‖ ≤ M}`. The closure proofs take eight lines and elaborate at the pins with no `sorry`.
- **Constructions become characterizations.** Replace `spectralPVM`, `spectralPVM_resolvent_formula` and SA-E44 by:
  `∃! P : ProjValMeasure ℝ H, ∀ z : ℂ, z.im ≠ 0 → ∀ (ξ : H) (μ : Measure ℝ), IsFiniteMeasure μ → (∀ B (hB : MeasurableSet B), ((μ B).toReal : ℂ) = ⟪ξ, P.proj B hB ξ⟫_ℂ) → ⟪ξ, LinearPMap.resolvent A z ξ⟫_ℂ = ∫ s, (z - (s : ℂ))⁻¹ ∂μ`.
  Replace `ofRepresentation` and SA-B60–B62 by the analogous `∃! P` whose conclusion is `μ.Regular ∧ ∀ f : C(K, ℂ), ⟪ξ, π f ξ⟫_ℂ = ∫ x, f x ∂μ`.
- **Yosida.** State SA-E27 for the native group (R02): for `U : StronglyContinuousGroup H` with `hU : U.IsUnitary` and `U.complexGenerator hU = Complex.I • A`, show that `NormedSpace.exp (((t : ℂ) * Complex.I) • S_n) ψ → U t ψ`, where `S_n = (2:ℂ)⁻¹ • -((n:ℂ)^2 • (R(i n) + R(-i n)))`.

All of these elaborate at the pins in a scratch file. Tested on the refuting instance: P is now bound separately for each A. So A = 0 and A = 1 get the δ₀-valued and δ₁-valued PVMs, and no `rfl` can identify them.

## R02 (P2) — Parts A, C and D, SA-E28 and SA-E32–E34 restate what the pinned Tau Ceti already proves

**Location.** README lines 128–146 ("What is missing (build here)") and the targets in the table below. `Suggested.lean` lines 40–56, 71–135, 490–523 and 635–663. `Suggested.lean` lines 36–37 say: "the spectrum, which Tau Ceti does not define for a partial operator".

**Claim.** Most obligations listed as "build here" are declarations of the pinned Tau Ceti or Mathlib, so they should be cited, not planned. `Suggested.lean` duplicates three of them (two equal by `rfl`, the third equivalent field by field). It also restates three resolvent theorems that close in one term from Tau Ceti, and re-creates the unitary-group carrier together with its generator and Stone's theorem. The claim that Tau Ceti lacks the partial-operator spectrum is false at the pin.

**Witness.** At the pins:
- `TauCeti.LinearPMap.spectrum A = LinearPMap.spectrum A := rfl`
- `perturb A V = LinearPMap.perturb A V := rfl`
- SA-D17 closes by `exact hA.mem_resolventSet_of_im_ne_zero hz`.
- SA-D19 closes by `exact hA.norm_resolvent_le hz`.

| README targets | Pinned declaration (Tau Ceti unless marked) |
|---|---|
| SA-A01, A03–A06, A15 | `TauCeti.Semigroups.StronglyContinuousGroup` (`Analysis/Semigroups/Group/Basic.lean:74`), `.reflect` (:184), `.toSemigroup` (:202), `.IsUnitary` (`Group/Unitary.lean:107`), `IsUnitary.opNorm_le_one` (:137) |
| SA-A02 | `StronglyContinuousGroup.complexGenerator` (`Group/Unitary.lean:249`) |
| SA-A17, A23 | `ofBoundedExp`, `ofBoundedExp_generator`, `isUnitary_ofBoundedExp` (`Group/Stone/Basic.lean:35, 72, 86`) |
| SA-A21 | `LinearPMap.isSelfAdjoint_of_surjective_addSub` (`Analysis/InnerProductSpace/LinearPMap/SelfAdjoint.lean:393`) |
| SA-A22, E26, E29, E43 | `IsSelfAdjoint.existsUnique_isUnitary_complexGenerator_eq_I_smul`, `LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul` (`Group/Stone/Unbounded.lean:106, 115`) |
| SA-C08–C10 | Mathlib `LinearPMap` order `≤` (`Mathlib/LinearAlgebra/LinearPMap.lean:242`) |
| SA-C11–C19 | `LinearPMap.IsReducing`, `IsReducing.isSelfAdjoint_restrict` (`InnerProductSpace/LinearPMap/Reducing.lean:59, 144`), `LinearPMap.restrict` (`LinearAlgebra/LinearPMap/Restrict.lean`) |
| SA-C25–C28 | `LinearPMap.unitaryConj`, `isSelfAdjoint_unitaryConj` (`InnerProductSpace/LinearPMap/Constructions.lean:135, 177`) |
| SA-C29–C33 | `LinearPMap.withLpProdMap` and its domain, closedness and density lemmas (`Analysis/Normed/Operator/LinearPMap/ProdLp.lean:57`) |
| SA-C39–C42 | Mathlib `LinearPMap.HasCore` (`Mathlib/Topology/Algebra/Module/LinearPMap.lean:141`); Tau Ceti `Topology/Algebra/Module/LinearPMap/GraphCore.lean` |
| SA-C44–C51 | `LinearPMap.IsRelativelyBounded` with `mono`, `add`, `sub`, `neg`, `smul`, zero (`Analysis/Normed/Operator/LinearPMap/RelativeBound.lean:56`) |
| SA-C52, C54, C56 | `LinearPMap.perturb` (`LinearAlgebra/LinearPMap/Perturbation.lean:33`), `isSelfAdjoint_perturb_bounded`, `isSelfAdjoint_toPMap_top` (`Constructions.lean:75, 64`) |
| SA-C55 | `IsSelfAdjoint.add_of_isRelativelyBounded` (`InnerProductSpace/LinearPMap/KatoRellich.lean:118`) |
| SA-C62–C65 | `LinearPMap.SpectralSetsSeparated`, `.symm`, `.mono_gap`, `.mono_sets` (`SpectralSeparation.lean:49–105`) |
| SA-C66–C72 | `LinearPMap.SylvesterEquation` with `ofBounded`, `zero`, `add`, `neg`, `sub`, `smul` (`Sylvester.lean:37–155`) |
| SA-D02, D12, D13 | `LinearPMap.spectrum` (`Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:140`), `isClosed_spectrum` (`Analysis/Normed/Operator/Resolvent/Spectrum.lean:31`), `measurableSet_preimage_ofReal_spectrum` (`RealSpectrum.lean:44`) |
| SA-D10 | `TauCeti.LinearPMap.notMem_spectrum_resolvent_iff` (`Resolvent/SpectralMapping.lean:123`) |
| SA-D14–D19, D22 | `IsSelfAdjoint.mem_resolventSet_of_norm_le`, `norm_resolvent_le_of_norm_le`, `mem_resolventSet_of_im_ne_zero`, `spectrum_subset_im_eq_zero`, `norm_resolvent_le` (`InnerProductSpace/LinearPMap/Resolvent.lean:55–83`) |
| SA-D20, D21 | `IsSelfAdjoint.adjoint_resolvent`, `isSelfAdjoint_resolvent` (`Resolvent.lean:114, 120`) |
| SA-D23 | `IsSelfAdjoint.norm_resolvent_le_of_spectrum_gap` (`SpectralGap.lean:82`) |
| SA-D24–D28 | `LinearPMap.cayley` (`Analysis/Normed/Operator/LinearPMap/Cayley.lean:64`); `IsSelfAdjoint.norm_cayley_apply`, `cayley_surjective`, `cayley_mem_unitary`, `isStarNormal_cayley` (`InnerProductSpace/LinearPMap/Cayley.lean:68–85`) |
| SA-D31–D34 | `LinearPMap.Intertwines` (`Topology/Algebra/Module/LinearPMap/Intertwining.lean:39`), `intertwines_iff_comp_resolvent_eq` (`Resolvent/Intertwining.lean:70`), `Intertwines.comp_cfc_cayley_eq` (`Cayley.lean:97`) |
| SA-D35 | `LinearPMap.mem_resolventSet_iff_isClosed_denseRange_norm_le` (`Analysis/Normed/Operator/Resolvent/Characterization.lean:51`) |
| SA-D39 | `LinearPMap.hasSum_resolvent`, `resolvent_eq_tsum` (`NeumannSeries.lean:42, 55`) |
| SA-E28 | `LinearPMap.eq_of_le_of_isSelfAdjoint` (`SelfAdjointMaximal.lean:29`) |
| SA-E32–E34 | `Real.gridCell`, `Real.pairwise_disjoint_gridCell`, `Real.iUnion_gridCell` (`Order/Interval/Set/RealGrid.lean:38, 53, 78`) |

**Repair.**
1. **README.** Delete these targets from the build and list them under "From Tau Ceti" and "From Mathlib" with the names and files above. Correct SA-D02 and the docstring of `Suggested.lean`.
2. **`Suggested.lean`.** Delete `TauCeti.LinearPMap.spectrum`, `perturb`, `MapsDomainTo`, `SylvesterEquation`, `isSelfAdjoint_perturb_bounded`, `mem_resolventSet_of_im_ne_zero`, `norm_resolvent_le_of_im_ne_zero` and `mem_resolventSet_and_norm_le_of_lower_bound`. Also delete `OneParameterUnitaryGroup` with its `toSemigroup`, `generator`, `isSelfAdjoint_generator` and `generator_commute`.
3. **SA-A22.** Drop the carrier conversion; with no second carrier there is nothing to convert.
4. **Old → new mapping.** UnboundedOperators (open head, README lines 59–63), QuantumFoundations (open head, line 59) and AutomorphicSpectralTheory cite SA-A21, SA-C39, SA-C55, SA-D17, SA-D18, SA-E26, SA-E28–E30 and SA-E43. Give one old → new line per deleted id, mapping it to its Tau Ceti declaration.

## R03 (P2) — VonNeumannAlgebras also claims ownership of the Borel calculus, the multiplication models and the unbounded spectral measure

**Location.** README lines 133–146 (the build-here bullets for the Borel calculus, the multiplication models and the unbounded spectral measure) and lines 1343–1345: "VonNeumannAlgebras V4.0.Decomposition and OperatorAlgebraDynamics D5 consume SA-B85’s separable diagonal C₀(X) representation".

**Claim.** VonNeumannAlgebras is on main and earlier in the merge order (line 5). It owns three blocks:
- **V2.BorelCalculus:** the bounded Borel calculus and PVM of a unital representation of `C(K)` and of a normal operator, with the null filter, vector identity, bounded convergence and commutant law.
- **V4.0.Multiplication:** cyclic models, control measures, multiplicity, essential symbols, and the classification of representations of `C(K)` and `C₀(X)`.
- **V10.ClosedOperators:** the resolvent, the Cayley transform and the Cayley-built spectral measure of a self-adjoint `LinearPMap`.

It states that it consumes nothing from this roadmap. Meanwhile SA-B01–B62, SA-B66–B80, SA-B85, SA-B86 and SA-E01–E13/E44 plan the same objects, so they have two owners. The Downstream sentence quoted above is false on main.

**Witness.** VonNeumannAlgebras README lines 31–39 and 217–220 (its open head keeps the same claim at line 255) say: "Nothing is consumed from the spectral sub-roadmap SelfAdjointSpectralTheory". Its lines 1279–1284 have V4.0.Decomposition consume V4.0.Multiplication, not SA-B85.

**Repair.** Settle a single owner. The choice consistent with the merge order, and with SA-B85's own use of V4.0.Fields, is VonNeumannAlgebras:
1. Cite V2.BorelCalculus, V4.0.Multiplication and V10.ClosedOperators by name in a "From TauCetiRoadmap.VonNeumannAlgebras" contract.
2. Delete SA-B85, SA-B86 and every Part B or Part E target those three state.
3. Keep only what they do not state. Examples: PVMs on arbitrary measurable spaces, reindexing (SA-B25, SA-B51), and Yosida approximation (SA-E14–E27) as an approximation theorem for the native group.
4. Give old → new lines for the ids that AutomorphicSpectralTheory, QuantumFoundations, NoncompactQuantumSymmetry, UnboundedOperators and OperatorAlgebraDynamics D5 cite.
5. Delete the false Downstream sentence.

The other way round (this roadmap owns and VonNeumannAlgebras cites it) would first require moving SA-B85's V4.0.Fields input out of this roadmap, plus a VonNeumannAlgebras revision. Either way, the README must state which choice it makes.

## R04 (P2) — Statable headline theorems are absent or stated through stand-ins

**Location.** `Suggested.lean` lines 10–21 (the module docstring) and lines 372–417 and 680–762.

**Claim.** The README gives no headline list. Its end theorems are all statable at the pins without stand-ins:
- existence and uniqueness of the unbounded spectral measure (SA-E01, E05, E44);
- existence and uniqueness of the PVM of a representation (SA-B59–B62);
- Yosida approximation of the Stone group (SA-E27);
- the compact normal decomposition (SA-C86).

`Suggested.lean` states the first three through the sorry'd `spectralPVM`, `genToGroup`, `yosidaGroup`, `ofRepresentation` and `integral`, and omits SA-C86. Its docstring does not name the headline that is not statable at the pins: SA-B85's multiplicity classification, which needs measurable Hilbert fields and their direct integral.

**Witness.** Four statements, `existsUnique_spectralPVM`, `existsUnique_projValMeasure_of_representation`, `tendsto_exp_yosida` and `exists_hilbertBasis_eigenvectors`, elaborate at the pins. They use only `import Mathlib`, two Tau Ceti modules and a sorry-free `ProjValMeasure`.

**Repair.**
1. Add a headline list to the README.
2. State the first three in the forms given under R01.
3. Add the compact normal decomposition: `theorem exists_hilbertBasis_eigenvectors {T : H →L[ℂ] H} (hT : IsCompactOperator T) (hN : IsStarNormal T) : ∃ (s : Set H) (b : HilbertBasis s ℂ H) (ν : s → ℂ), ⇑b = ((↑) : s → H) ∧ ∀ x : s, Module.End.HasEigenvector (T : Module.End ℂ H) (ν x) (x : H)`. No other roadmap owns it, and Tau Ceti only has the self-adjoint case.
4. Name the classification in the docstring as not statable, subject to R03's ownership decision.

## R05 (P3) — `Suggested.lean` imports another roadmap's module, and nothing from it is used

**Location.** `Suggested.lean` line 8: "import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested".

**Claim.** Only `Mathlib` and `TauCeti.*` modules may be imported (gate rule `imports`). No declaration of OrthogonalGeometry is used.

**Witness.** A scratch copy with line 8 deleted elaborates at the pins with no error.

**Repair.** Delete line 8.

## R06 (P3) — Padding and other declarations that are not headline theorems in `Suggested.lean`

**Location.** `Suggested.lean` lines 94–103, 131–135, 186–192, 222–244, 316–367, 419–471, 504–617, 741–746 and 766–781.

**Claim.** The following are not headline theorems, and should not be in `Suggested.lean`:
- **One term closes them** (probed at the pins): `LowerFormBoundOn.mono_const`, `LowerFormBoundOn.mono_subspace`, `UpperFormBoundOn.mono_const`, `UpperFormBoundOn.mono_subspace`, `IsPositive.lowerFormBoundOn_top` and `isPositive_of_lowerFormBoundOn_top`. Also `eventually_ae_iff` (already `exact Filter.mem_iSup`) and `toSemigroup_apply` (`rfl`).
- **They restate a definition:** `BoundedBorelFunction.ext` and `pullbackHom_apply`.
- **They compute a small value:** `courseMatrix`, `courseMatrixOperator` and `norm_courseMatrixOperator`. The values are right, but this is a README Check.
- **No headline uses them:** `MapsDomainTo`, `SylvesterEquation`, `LowerFormBoundOn`, `UpperFormBoundOn` and `ProjValMeasure.ae`.
- **Intermediate API:** `norm_toSemigroup_le`, `generator_commute`, `integral_complexMeasure_withDensity`, `scalarMeasure_variation_le`, `norm_integral_le`, `integral_inner`, the `representationEssentialSpace` and `representationIntegral` block, `ofRepresentation_commute`, the SA-C84/C85 bridges and `isSelfAdjoint_yosidaApproximantSym`.

**Witness.** At the pins, `fun x hx => (mul_le_mul_of_nonneg_right hc (sq_nonneg _)).trans (h x hx)` proves `mono_const`, and `⟨hsym, fun x => by simpa [ContinuousLinearMap.reApplyInnerSelf] using h x Submodule.mem_top⟩` proves SA-C83.

**Repair.** Delete them from `Suggested.lean`; the README keeps each statement as a target or a Check.

## R07 (P3) — The README does not follow the TauCetiRoadmap form

**Location.** README line 1, "# Self-adjoint spectral theory: the Borel functional calculus, unbounded operators, and Stone's theorem", and the sections "What Mathlib and Tau Ceti already have (consume)", "What is missing (build here)", "Part A"–"Part E", the milestones and "Definitions".

**Claim.** The README lacks most required parts:
- a `# Roadmap:` title, a **Summary.** paragraph, Scope and ownership, How to read the build, and `## Layer k` / `### k.n` prose;
- per-supplier contracts. BanachSpaceTheory B5 is listed under "What Mathlib and Tau Ceti already have", although it is a roadmap.
- a *Needs:* line per target, `**Checks.**` lists, and Examples and Dependencies for each layer.

The SA-xxx labels form a catalogue. "SAST" is used without definition. "Suggested homes" points to paths inside Tau Ceti. Targets SA-D01, D03–D09, D11 and D36–D38 are consumption notes ("Already supplied by"), not obligations.

**Witness.** In `README.md`, `grep -c '\*\*Checks'` returns 0 and `grep -c '\*Needs:\*'` returns 0, although there are about forty definitions (SA-A01, A02, B01, B14, B21, B40, B44, B49, C01, C05, C08, C11–C13, C34, C39, C44, C52, C66, C76, C77, D24, D31, E01, E14–E16, E36, E38 and others).

**Repair.** Rewrite in the house shape; UnboundedOperators on its open head is a sibling already in that shape. Give each surviving definition API bullets and at least three Checks. For SA-D24 (Cayley transform), for example:
- for A = a·I with a real, U = (a−i)/(a+i);
- for A = 0, U = −1;
- a closed symmetric operator with nonzero deficiency gives a non-surjective U, which shows the self-adjointness hypothesis is needed.

## R08 (P3) — No theorem carries a locator

**Location.** README lines 1382–1397 (References). For example: "M. Reed, B. Simon, … — VII (the spectral theorem, bounded and unbounded), VIII.3–4 (Stone's theorem, the Cayley transform, von Neumann's criterion)".

**Claim.** None of SA-A01–SA-E47 has a theorem or page locator, and the references give chapter ranges only. So none of the seeded sample has a locator to verify: Milestones B1, B3, B5, C1, C2, C3 and E3, both "Objects" paragraphs, the three "Acceptance examples" paragraphs, "External", D2 and D6.

**Witness.** `grep -cE 'Thm\.?|Theorem [0-9IVX]|p\. ?[0-9]' README.md` returns 0.

**Repair.** Put a locator at each theorem. Neighbouring documents already use the following locators; verify them and adopt them:
- From the VonNeumannAlgebras README (lines 2254–2276): Reed–Simon I Thm VIII.3 (basic criterion) and Thm VIII.4 (multiplication form); Rudin, *Functional Analysis*, Thm 13.19 (Cayley transform) and Thm 13.30 (spectral measure).
- From the pinned Tau Ceti docstrings: Reed–Simon I Thms VIII.7–VIII.8 and Engel–Nagel Thm II.3.24 (Stone); Kato Thm V.4.3 (Kato–Rellich); Schmüdgen §13.1 (Cayley transform).

## R09 (P3) — Links pinned to commits, and a dead link

**Location.** README lines 624, 944, 960, 1318 and 1328 link to `github.com/…/blob/<sha>` (gate `blob`). Lines 109, 161 and 1334 link to "…/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md".

**Claim.** Links into the roadmap repository must not be pinned to a commit, and the OneParameterSemigroups link no longer resolves.

**Witness.** On main the roadmap lives at `Completed/OneParameterSemigroups/README.md`; `TauCetiRoadmap/OneParameterSemigroups/` does not exist.

**Repair.** Write "VonNeumannAlgebras V4.0.Fields" and "BanachAlgebras A8", and use relative links: `../../VonNeumannAlgebras/README.md`, `../../BanachAlgebras/README.md` and `../../../Completed/OneParameterSemigroups/README.md` (Part A).

## R10 (P3) — Backticked names the gate cannot resolve (`readme-ids-missing`)

**Location.** README line 579 ("Consume `spectrum_apply_subset`"), line 88, line 1099, and lines 118, 226 and 245.

**Claim.** One of the four names is wrong. The other three exist at the pins, so those three gate hits are false positives.

**Witness.** `spectrum_apply_subset` does not exist at the pin; the lemma is `AlgHom.spectrum_apply_subset` (`Mathlib/Algebra/Algebra/Spectrum/Basic.lean:416`). These three do exist:
- `spectrum.isOpen_resolventSet` (`Mathlib/Analysis/Normed/Algebra/Spectrum.lean:164`);
- `LinearPMap.analyticOnNhd_resolvent` (`TauCeti/Analysis/Normed/Operator/Resolvent/Analytic.lean:76`);
- `LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul` (`Group/Stone/Unbounded.lean:115`).

**Repair.** Write `AlgHom.spectrum_apply_subset`. Move the other three into the "From Mathlib" and "From Tau Ceti" contracts together with their modules (R02, R07). If the gate still flags them there, the worker reports the false positive using these lines.

## R11 (P3) — Edits outside the roadmap folder

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (three lines).

**Claim.** The gate's `outside-folder` check fails: neither folder is among this pull request's own roadmap folders.

**Witness.** `git diff --stat origin/main...HEAD`, run with every listed folder excluded, still lists these two files.

**Repair.** Move the two loop cuts into their own pull requests, or declare those folders as this pull request's own so that they get reviewed.

## R12 (P3) — Conflict with open pull request #1187, and no order is stated

**Location.** The merge-order paragraph of the pull-request description: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Claim.** #1187 (the Tau Ceti bump) also changes this roadmap's `Suggested.lean`. At #1187's head, `Suggested.lean` still declares `integral_withDensityᵥ` (SA-B82), and the README still cites SA-B81–B84 (lines 419, 488, 490, 497, 506, 525, 605–666). This pull request moves exactly those to BanachSpaceTheory B5.

**Witness.** The overlaps report says "#1187 and #1854 conflict in … SelfAdjointSpectralTheory/Suggested.lean". `roadmaps show SelfAdjointSpectralTheory --pr 1187` shows `theorem integral_withDensityᵥ` near line 235 of that file.

**Repair.** State the order in the description. For example: #1187 rebases onto this pull request and drops SA-B81–B84 and `integral_withDensityᵥ`, so that BanachSpaceTheory's declaration remains the only copy.

## R13 (P3) — Form of `Suggested.lean`

**Location.** `Suggested.lean` lines 13–16: "README.md is the definitive and exhaustive roadmap specification. This file gives suggested Lean forms for selected labeled obligations. … in this human-owned roadmap library". Also lines 40–56 and 773.

**Claim.** Three form problems:
- The docstring is not of the form "<title>: target signatures". It does not say that the file states the headline theorems, and it does not list the headlines that are not statable.
- A declaration sits in Tau Ceti's own namespace `TauCeti.LinearPMap` instead of `TauCetiRoadmap.SelfAdjointSpectralTheory`.
- `courseMatrixOperator` has no docstring, and "the course's concrete matrix" uses vocabulary the file never explains.

**Witness.** Line 51 declares `def spectrum` inside `namespace TauCeti` / `namespace LinearPMap`. Line 773, `noncomputable def courseMatrixOperator`, has no docstring.

**Repair.** Rewrite the docstring in the required form. Delete the `TauCeti` namespace block (R02) and the course-matrix block (R06).

## Verified sound

**This pull request's change (the move of SA-B81–B84).**
- At this head, BanachSpaceTheory states B5.ScalarIntegral (line 946), B5.ScalarDensity (984), B5.AbsContRegular (992), B5.ScalarUniqueness (1006) and B5.BoundedApprox (1017), in that order. So the range "B5.ScalarIntegral–B5.BoundedApprox" in Milestone B1 and in Ordering is well defined.
- `integral_withDensityᵥ` is declared in `TauCetiRoadmap/BanachSpaceTheory/Suggested.lean` line 200.
- SA-B58 applies B5.BoundedApprox, which is stated for a single regular ν, to Σν_j. That is sound, because `∫‖f−g‖dν_j ≤ ∫‖f−g‖d(Σν)` and finite sums of regular measures are regular (B5.AbsContRegular).
- No roadmap on main or at an open head cites SA-B81–B84, apart from #1187's own copy of this README (R12).
- BanachSpaceTheory no longer cites this roadmap as a supplier.

**Gate and dependency check.**
- The worker's gate at c07dda7 fails on exactly the five checks raised above (R01, R05, R09, R10, R11); the build passes.
- Dependency check output: `depcheck: 237 roadmaps, 2341 edges, 0 problem(s)`. This roadmap is on main and not in ORDER.txt; VonNeumannAlgebras is at line 5.

**Mechanical signature check.** I put `#check @` for 42 declarations into a scratch copy and elaborated it with `lake env lean`. Every elaborated type matches its README generality, with two exceptions:
- `representationEssentialSpace_complete` and `representationOnEssentialSpace` drop `[CompactSpace K] [T2Space K] [MeasurableSpace K] [BorelSpace K]`. This is harmless, since neither needs them.
- `integral_complexMeasure_withDensity` is stated on an arbitrary measurable space, whereas README SA-B64 says compact Hausdorff. The Lean statement is the more general one, and it is true.

**Adversarial table** (values computed by hand or in Lean at the pins):

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `generator_genToGroup` (E29) | H=ℂ, A₀=0, A₁=id | LHS: one constant (`rfl`); RHS at vector 1: 0 vs 1 | false as elaborated (proved in Lean) | R01 |
| `ProjValMeasure.inner_proj` (B22) | any PVM on ℂ, B=univ, ξ=1,2 | LHS 1 and 4; RHS one constant | false as elaborated (proved in Lean) | R01 |
| `scalarMeasure_apply` (B41) | ψ=1, B=univ, ξ=0 vs 1 | RHS 0 vs 1; LHS constant (type does not mention ξ, ψ) | false as elaborated | R01 |
| `spectralPVM_resolvent_formula` (E05), mathematics | A=0 on ℂ, z=i, ξ=1 | LHS ⟪1,(i)⁻¹·1⟫=−i; μ_ξ=δ₀, RHS (i−0)⁻¹=−i | true | none |
| same, as elaborated | ξ=1 vs ξ=2 | LHS −i vs −4i; RHS one constant | false | R01 |
| Yosida approximants (E14–E16, E21) | A=a·I, a∈ℝ | A_n⁺=ina/(in−a)→a; A_n⁻=ina/(in+a); S_n=n²a/(n²+a²), real; a=n=1: A_1⁺=(1−i)/2, not real | true (raw approximant not self-adjoint, as the docstring says) | none |
| Cayley transform (D24, E01) | A=a·I; a=0 | U=(a−i)/(a+i), \|U\|=1; U=−1, inverse coordinate i(1+w)/(1−w) at w=−1 gives 0; κ(1)=0 is immaterial by E02 | true | none |
| D19 resolvent bound | A=0, z=2i; A=1, z=1+i | ‖R‖=½ ≤ ½; ‖R‖=1 ≤ 1 | true, sharp | R02 (in Tau Ceti) |
| D22 lower-bound resolvent | A=0 on ℂ, z=2, c=2 | ‖0−2x‖=2‖x‖ ≥ 2‖x‖; ‖R(2)‖=½ ≤ ½ | true over ℝ and ℂ | R02 |
| D10 spectral mapping | A=0, z=1 | σ(R(1))={1}; μ=2: z−½ ∈ ρ, and 2∉σ; μ=1: z−1 ∈ σ(A), so no claim | true | R02 |
| C54 bounded perturbation | A=id (total), T=−id; E=0 | A+V=0, self-adjoint; trivial | true | R02 |
| C55 Kato–Rellich, boundary b=1 | V=−A on dom A ≠ H | A+V=0 on dom A, not closed, so not self-adjoint | b<1 is needed, and Tau Ceti keeps it | none |
| C78–C83 form bounds | A=id, U=⊤, c=1, c'=0; A=−id | bound holds at 1 and at 0; IsPositive false and LowerFormBoundOn ⊤ 0 false | consistent | R06 |
| C84 restriction bridge | A=diag(1,2) on ℂ², U=span e₂; U=0 | σ(A\|_U)={2}, and 2\|x₂\|² ≤ ⟨Ax,x⟩=2\|x₂\|²; σ=∅, conclusion 0 ≤ 0 | true | none |
| B32 half-line criterion | T=0, c=0 and c=1 | P((−∞,0))=0 ⟺ 0 ≤ 0; P((−∞,1))=I ≠ 0 ⟺ ‖x‖² ≤ 0 fails | true both ways | none |
| B36 spectrum of M_h | ν=0; ν = Lebesgue on [0,1], h=x | σ=∅=supp 0; σ=[0,1]=supp | true | none |
| B04 polarization (conjugate-first) | s(x,y) conjugate-linear in x | Σₖ i⁻ᵏ q(x+iᵏy) = 4s(x,y), because Σi⁻ᵏ = 0 and Σ(−1)ᵏ = 0 | true | none |
| B67 degenerate representation | K=∅ unital; π=0 | 1=0 in C(∅), so H=0; range π(1)=0, both sides 0 | true | none |
| B77 accumulating diagonal | diag(1/(n+1)) | 0 ∈ σ (limit point); P({0}) = projection onto the kernel = 0 | true | none |
| B85 multiplicity | c·I on ℂ² | two cyclic vectors, μ_j=δ_c, m(c)=2; ‖w^{−1/2}f‖²_{wμ} = ‖f‖²_μ | true | R03 (owner) |
| B12, B47, empty X | X=∅ | P(univ)=P(∅) gives id=0, so H=0 and the norm is 0 ≤ M | true | none |
| A24 norm continuity | e^{itS} with S bounded; e^{itx} on L²(ℝ) | domain H; domain ≠ H and ‖U(t)−I‖=2 | true | R02 |
| C87 matrix | the 5×5 matrix | column norms 45, 128, 2, 350, 280; all 10 cross products 0 (e.g. c₄·c₅ = −20−45+65 = 0); ‖T‖=√350 at e₄ | true | R06 (Check) |
| E41 reassembly | c=∞; Q={id}, c=1 | ∞·‖Qᵢx‖ₑ ≤ ‖Qᵢy‖ₑ forces Qᵢx=0, so ‖x‖ₑ=0 and 0 ≤ ‖y‖ₑ; ‖x‖ ≤ ‖y‖ | true | none |
| E32–E35 grid | ε=1 | cells [k,k+1) are disjoint and cover ℝ | true | R02 (`Real.gridCell`) |
| D2 / `borelCalculus` | README D2 against Lean lines 381–383 | the same expression | agree | none |

**Library declarations opened at the pins.**
- *Tau Ceti:* every file:line in R02's table, plus `TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:129` (`resolventSet`), `Analysis/Semigroups/Group/Stone/Unbounded.lean:106–123` and `Analysis/InnerProductSpace/Spectrum.lean:152` (compact self-adjoint eigenbasis only).
- *Mathlib:* `Analysis/InnerProductSpace/Positive.lean:274` (`ContinuousLinearMap.IsPositive` = `IsSymmetric ∧ ∀ x, 0 ≤ reApplyInnerSelf x`), `MeasureTheory/VectorMeasure/WithDensityVec.lean:42`, `LinearAlgebra/LinearPMap.lean:242`, `Topology/Algebra/Module/LinearPMap.lean:141`, `Analysis/Normed/Algebra/Spectrum.lean:164`, `Algebra/Algebra/Spectrum/Basic.lean:416`, and `Analysis/InnerProductSpace/Dual.lean:193` (`continuousLinearMapOfBilin`, namespace `InnerProductSpace`).
- 49 further README names resolve by `#check`, including `RealRMK.rieszMeasure`, `RealRMK.regular_rieszMeasure`, `Measure.ext_of_integral_eq_on_compactlySupported`, `ContinuousMap.toLp_denseRange`, `VectorMeasure.variation_withDensity`, `VectorMeasure.variation_transpose_eq`, `VectorMeasure.withDensity_congr`, `fuglede_putnam_rosenblum`, `Commute.cfcHom`, `ContinuousMap.spectrum_eq_range`, `ContinuousMap.starAlgHom_ext_map_X`, `Measure.InnerRegular.map_of_continuous`, `Measure.Regular.of_sigmaCompactSpace_of_isLocallyFiniteMeasure`, `LinearMap.IsSymmetric.iSup_eigenspace_inf_eigenspace_of_commute`, `Module.End.invtSubmodule`, `LinearMap.IsSymmetric.restrict_invariant`, `LinearMap.IsSymmetric.orthogonalComplement_mem_invtSubmodule`, `Measure.support`, `IsHilbertSum`, `SignedMeasure.totalVariation_eq_variation`, `VectorMeasure.mapRangeL`, `Measure.variation_withDensityᵥ`, `TauCeti.LinearPMap.resolvent_eq_mul_inverse_one_sub`, `ContinuousLinearMap.mem_resolventSet_toPMap_top_iff`, `ContinuousLinearMap.resolvent_toPMap_top`, `LinearPMap.IsResolventAt.unique`, `LinearPMap.resolvent_sub_resolvent`, `LinearPMap.resolvent_comm`, `LinearPMap.isOpen_resolventSet` and `LinearIsometryEquiv.conjStarAlgEquiv`.

**Cross-roadmap citations resolved.**
- VonNeumannAlgebras V4.0.Fields (main, line 1181): measurable Hilbert fields, decomposable-operator criterion and measure change, as SA-B85 says.
- BanachAlgebras A8 (main, lines 158 and 181).
- OrthogonalGeometry OG-15 and OG-18 (its README, lines 115 and 117).
- BanachSpaceTheory B1, Goldstine (line 82), and B5 (above).
- OperatorAlgebraDynamics D5 (main, lines 112–116; it cites SA-B85).
- OneParameterSemigroups Part A (`Completed/`, line 90).

**Ownership against open pull requests.**
- UnboundedOperators (#1027 head) and QuantumFoundations (#1771 head) consume this roadmap and own none of its objects.
- VonNeumannAlgebras (#1041 head) keeps the ownership claim of R03.
- NoncompactQuantumSymmetry (#1015) uses a Tau Ceti `ProjValMeasure` that exists only at a newer pin. It is not a duplicate at these pins.

**The ℂ-valued refutations in R01** use only `proj_univ` and `rfl`, so they rely on no `sorry` beyond the definitions under test.

## Not verifiable

- **Sampled locators.** None of the sampled targets carries a locator (R08), so no locator could be checked against its text.
- **The six references.** Reed–Simon I, Schmüdgen GTM 265, Rudin *Functional Analysis*, Kato, Weidmann GTM 68 and Engel–Nagel GTM 194 are commercial books with no legal open copy. I fetched none; the roadmap's `sources.toml` records none.
- **Locators suggested in R08.** These are quoted from VonNeumannAlgebras and from Tau Ceti docstrings. I have not checked them against the texts.

## Source issues

- none
