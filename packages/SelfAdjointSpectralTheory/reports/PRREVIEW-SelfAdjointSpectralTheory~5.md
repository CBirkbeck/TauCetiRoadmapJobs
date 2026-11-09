# Review of SelfAdjointSpectralTheory (pull request #1854 at 56715a5)
Folder: `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/`
**Verdict:** needs changes

Incremental re-review of 0 changed lines since c07dda7. The folder is byte-for-byte the one the previous review read (`git diff --stat c07dda7..56715a5 -- TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory` is empty, and so is the diff of the family index `TauCetiRoadmap/OperatorTheory/*`). The commits since c07dda7 touch only `TauCetiRoadmap/AlgebraicTopology/` and `TauCetiRoadmap/BordismFormalGroups/`, which this roadmap does not cite. So every finding of the previous report stands unchanged, and no repair introduced a new problem. The worker's gate at this head fails on the same five checks as at c07dda7: `blob` (5), `sorry-data` (20), `imports` (1), `readme-ids-missing` (4) and `outside-folder` (2); the build and the dependency check pass. The thirteen findings below are the previous report's, re-verified at this head with their witnesses; the full repairs are in that report and are summarised here.

## R01 (P1) — Sorry'd data makes the stated theorems false

**Location.** `Suggested.lean` lines 83–88, 112, 164–184, 209, 217, 270, 278, 285, 302, 325, 333, 372, 432, 440, 680, 698 and 753. Line 112 still reads: "noncomputable def generator (U : OneParameterUnitaryGroup H) : H →ₗ.[ℂ] H := sorry".

**Claim.** A `sorry` body whose type does not mention the arguments elaborates to one constant, so `generator`, `diagMeasure`, `scalarMeasure`, `integral`, `spectralPVM`, `genToGroup` and `yosidaGroup` ignore their inputs, and the ring, star and algebra instances on `BoundedBorelFunction` are unrelated to pointwise operations. Every theorem about them, including the headlines `isSelfAdjoint_generator`, `spectralPVM_resolvent_formula`, `generator_genToGroup` and `tendsto_yosidaGroup`, is false or vacuous.

**Witness.** At the pins `generator U = generator V`, `P.diagMeasure ξ = Q.diagMeasure ψ` and `spectralPVM A hA = spectralPVM B hB` hold by `rfl`; the previous review proved in Lean the negations of `ProjValMeasure.inner_proj` (PVM on ℂ, ξ = 1, 2) and of `generator_genToGroup` (H = ℂ, A = 0, 1). The gate's `sorry-data` count at this head is 20, as before.

**Repair.** As in the previous report: delete every sorry'd `def` and `instance`; make the bounded Borel symbols a `StarSubalgebra ℂ (X → ℂ)` with carrier `{f | Measurable f ∧ ∃ M, ∀ x, ‖f x‖ ≤ M}`; replace the constructions `spectralPVM` and `ofRepresentation` by `∃! P : ProjValMeasure ℝ H, …` characterisations (resolvent formula on diagonal measures; regular measures with `⟪ξ, π f ξ⟫ = ∫ f dμ`); state Yosida approximation for the native `StronglyContinuousGroup` with `U.complexGenerator hU = Complex.I • A`. Tested on the refuting instance: with P bound per operator, A = 0 and A = 1 receive the δ₀- and δ₁-valued PVMs, which no `rfl` identifies.

## R02 (P2) — Parts A, C and D, SA-E28 and SA-E32–E34 restate what the pinned Tau Ceti already proves

**Location.** README lines 128–146 ("What is missing (build here)"); `Suggested.lean` lines 36–37 ("the spectrum, which Tau Ceti does not define for a partial operator"), 40–56, 71–135, 490–523 and 635–663.

**Claim.** Most "build here" obligations are declarations of the pinned Tau Ceti or Mathlib and must be cited, not planned; `Suggested.lean` duplicates `spectrum` and `perturb` (both equal to Tau Ceti's by `rfl`), re-creates the unitary-group carrier with its generator and Stone's theorem, and restates resolvent theorems that close in one term.

**Witness.** At the pin, `TauCeti/Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:140` declares `def spectrum (A : X →ₗ.[𝕜] X) : Set 𝕜 := A.resolventSetᶜ`, and `Analysis/Semigroups/Group/Stone/Unbounded.lean:115` declares `isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`. SA-D17 closes by `exact hA.mem_resolventSet_of_im_ne_zero hz`; SA-D19 by `exact hA.norm_resolvent_le hz`. The full table of the 30-odd target groups and their pinned declarations, with files and lines, is in the previous report and is unchanged at this pin.

**Repair.** Delete those targets from the build, list them under "From Tau Ceti" and "From Mathlib" with the names and files of the previous report's table, correct SA-D02 and the docstring, delete the duplicated declarations and the `OneParameterUnitaryGroup` block from `Suggested.lean`, and give one old → new line per deleted id that UnboundedOperators, QuantumFoundations and AutomorphicSpectralTheory cite (SA-A21, C39, C55, D17, D18, E26, E28–E30, E43).

## R03 (P2) — VonNeumannAlgebras also claims ownership of the Borel calculus, the multiplication models and the unbounded spectral measure

**Location.** README lines 133–146 and lines 1343–1345: "VonNeumannAlgebras V4.0.Decomposition and OperatorAlgebraDynamics D5 consume SA-B85’s separable diagonal C₀(X) representation".

**Claim.** VonNeumannAlgebras, on main and at merge-order line 5, owns V2.BorelCalculus, V4.0.Multiplication and V10.ClosedOperators and says it consumes nothing from this roadmap; SA-B01–B62, B66–B80, B85, B86 and E01–E13/E44 plan the same objects, so each has two owners, and the Downstream sentence is false on main.

**Witness.** VonNeumannAlgebras README on main (bbbde05a), lines 31–39: this roadmap "is a consumer of this roadmap (its SA-B85 consumes V4.0.Fields), so nothing here is taken from it", then lists the three blocks as "owned here"; line 218: "Nothing is consumed from the spectral sub-roadmap SelfAdjointSpectralTheory". Line 1279 has V4.0.Decomposition consume V4.0.Multiplication, not SA-B85.

**Repair.** Settle one owner; the choice consistent with the merge order and with SA-B85's use of V4.0.Fields is VonNeumannAlgebras: cite its three blocks in a "From TauCetiRoadmap.VonNeumannAlgebras" contract, delete SA-B85, SA-B86 and the Part B and Part E targets they state, keep only what they do not state (PVMs on arbitrary measurable spaces, reindexing SA-B25/B51, Yosida approximation for the native group), give old → new lines for the ids AutomorphicSpectralTheory, QuantumFoundations, NoncompactQuantumSymmetry, UnboundedOperators and OperatorAlgebraDynamics D5 cite, and delete the false Downstream sentence.

## R04 (P2) — Statable headline theorems are absent or stated through stand-ins

**Location.** `Suggested.lean` lines 10–21 (module docstring), 372–417 and 680–762.

**Claim.** The README gives no headline list. Its end theorems (existence and uniqueness of the unbounded spectral measure, SA-E01/E05/E44; of the PVM of a representation, SA-B59–B62; Yosida approximation, SA-E27; compact normal decomposition, SA-C86) are statable at the pins without stand-ins, yet the file states the first three through the sorry'd `spectralPVM`, `genToGroup`, `yosidaGroup`, `ofRepresentation` and `integral`, omits SA-C86, and does not name SA-B85's multiplicity classification as not statable.

**Witness.** The previous review's four statements `existsUnique_spectralPVM`, `existsUnique_projValMeasure_of_representation`, `tendsto_exp_yosida` and `exists_hilbertBasis_eigenvectors` elaborate at the pins with `import Mathlib`, two Tau Ceti modules and a sorry-free `ProjValMeasure`.

**Repair.** Add a headline list to the README; state the first three in the forms under R01; add `exists_hilbertBasis_eigenvectors` for a compact normal `T : H →L[ℂ] H` (no other roadmap owns it; Tau Ceti has only the self-adjoint case at `Analysis/InnerProductSpace/Spectrum.lean:152`); name the classification in the docstring as not statable, subject to R03.

## R05 (P3) — `Suggested.lean` imports another roadmap's module, and nothing from it is used

**Location.** `Suggested.lean` line 8: "import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested".

**Claim.** Only `Mathlib` and `TauCeti.*` modules may be imported (gate rule `imports`, 1 hit at this head), and no declaration of OrthogonalGeometry is used.

**Witness.** The previous review's scratch copy with line 8 deleted elaborates at the pins with no error.

**Repair.** Delete line 8.

## R06 (P3) — Padding and other declarations that are not headline theorems in `Suggested.lean`

**Location.** `Suggested.lean` lines 94–103, 131–135, 186–192, 222–244, 316–367, 419–471, 504–617, 741–746 and 766–781.

**Claim.** One term closes `LowerFormBoundOn.mono_const`, `.mono_subspace`, `UpperFormBoundOn.mono_const`, `.mono_subspace`, `IsPositive.lowerFormBoundOn_top`, `isPositive_of_lowerFormBoundOn_top`, `eventually_ae_iff` and `toSemigroup_apply`; `BoundedBorelFunction.ext` and `pullbackHom_apply` restate definitions; `courseMatrix`, `courseMatrixOperator` and `norm_courseMatrixOperator` compute a small value; `MapsDomainTo`, `SylvesterEquation`, `LowerFormBoundOn`, `UpperFormBoundOn` and `ProjValMeasure.ae` serve no headline; the rest listed in the previous report is intermediate API.

**Witness.** At the pins `fun x hx => (mul_le_mul_of_nonneg_right hc (sq_nonneg _)).trans (h x hx)` proves `mono_const`, and `⟨hsym, fun x => by simpa [ContinuousLinearMap.reApplyInnerSelf] using h x Submodule.mem_top⟩` proves SA-C83.

**Repair.** Delete them from `Suggested.lean`; the README keeps each as a target or a Check.

## R07 (P3) — The README does not follow the TauCetiRoadmap form

**Location.** README line 1, "# Self-adjoint spectral theory: the Borel functional calculus, unbounded operators, and Stone's theorem", and the sections "What Mathlib and Tau Ceti already have (consume)", "What is missing (build here)", "Part A"–"Part E", the milestones and "Definitions".

**Claim.** No `# Roadmap:` title, no **Summary.** paragraph, no Scope and ownership, no How to read the build, no `## Layer k` / `### k.n` prose, no per-supplier contracts (BanachSpaceTheory B5 sits under "What Mathlib and Tau Ceti already have"), no *Needs:* lines, no `**Checks.**` lists, no Examples or Dependencies per layer; the SA-xxx labels form a catalogue; "SAST" is undefined; SA-D01, D03–D09, D11 and D36–D38 are consumption notes, not obligations.

**Witness.** At this head `grep -c '\*\*Checks' README.md` and `grep -c '\*Needs:\*' README.md` both return 0, against about forty definitions.

**Repair.** Rewrite in the house shape (UnboundedOperators at its open head is a sibling in that shape), with API bullets and at least three Checks per surviving definition; the previous report gives the three Checks for the Cayley transform as a model.

## R08 (P3) — No theorem carries a locator

**Location.** README lines 1382–1397 (References), for example "M. Reed, B. Simon, … — VII (the spectral theorem, bounded and unbounded), VIII.3–4 (Stone's theorem, the Cayley transform, von Neumann's criterion)".

**Claim.** None of SA-A01–SA-E47 has a theorem or page locator; the references give chapter ranges only, so none of the seeded sample (Milestones B3, B6, C1, C2, the "Objects" and "Acceptance examples" paragraphs, "External", D1–D4) can be checked against a text.

**Witness.** At this head `grep -cE 'Thm\.?|Theorem [0-9IVX]|p\. ?[0-9]' README.md` returns 0; the only author names inside the body are the words "Kato–Rellich" at lines 837, 862 and 864.

**Repair.** A locator at each theorem; the previous report lists candidates from the VonNeumannAlgebras README and the pinned Tau Ceti docstrings (Reed–Simon I Thms VIII.3, VIII.4, VIII.7–8; Rudin Thms 13.19, 13.30; Kato Thm V.4.3; Schmüdgen §13.1; Engel–Nagel Thm II.3.24) to verify and adopt.

## R09 (P3) — Links pinned to commits, and a dead link

**Location.** README lines 624, 944, 960, 1318 and 1328 (gate `blob`, 5 hits); lines 109, 161 and 1334 link "…/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md".

**Claim.** Links into the roadmap repository must not be pinned to a commit, and the OneParameterSemigroups link no longer resolves.

**Witness.** On main the roadmap is at `Completed/OneParameterSemigroups/README.md` (present at bbbde05a with README.md, Suggested.lean, metadata.toml); `TauCetiRoadmap/OneParameterSemigroups/` does not exist.

**Repair.** Write "VonNeumannAlgebras V4.0.Fields" and "BanachAlgebras A8" with relative links `../../VonNeumannAlgebras/README.md`, `../../BanachAlgebras/README.md`, and `../../../Completed/OneParameterSemigroups/README.md`.

## R10 (P3) — Backticked names the gate cannot resolve (`readme-ids-missing`)

**Location.** README line 579: "`spectrum_apply_subset`, `ContinuousMap.spectrum_eq_range` and"; also lines 88, 118, 226, 245 and 1099.

**Claim.** `spectrum_apply_subset` is not a Mathlib name; the other three hits (`spectrum.isOpen_resolventSet`, `LinearPMap.analyticOnNhd_resolvent`, `LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`) exist at the pins and are false positives of the gate.

**Witness.** `Mathlib/Algebra/Algebra/Spectrum/Basic.lean:416` declares `theorem spectrum_apply_subset` inside `namespace AlgHom`, so the full name is `AlgHom.spectrum_apply_subset`; `Group/Stone/Unbounded.lean:115` declares the Stone criterion.

**Repair.** Write `AlgHom.spectrum_apply_subset`; move the other three into the "From Mathlib" and "From Tau Ceti" contracts with their modules; if the gate still flags them there, the worker reports the false positive.

## R11 (P3) — Edits outside the roadmap folder

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (1 line changed) and `TauCetiRoadmap/SymplecticGeometry/README.md` (3 lines changed).

**Claim.** The gate's `outside-folder` check fails: neither folder is among this pull request's own roadmap folders, so those two loop cuts are reviewed by no one.

**Witness.** `git diff --stat origin/main...HEAD` with every listed folder excluded still lists exactly these two files (2 files, 4 insertions, 4 deletions).

**Repair.** Move the two loop cuts into their own pull requests, or declare those folders as this pull request's own so that they are reviewed.

## R12 (P3) — Conflict with open pull request #1187, and no order is stated

**Location.** The merge-order paragraph of the pull-request description: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Claim.** #1187 (the Tau Ceti bump) also changes this roadmap's `Suggested.lean` and the description says nothing about it. The conflict is shallow: #1187 branched before this pull request's move of SA-B81–B84, and from its own merge base it only renames `IsUnitary`, so its copy still carries `integral_withDensityᵥ` and the README citations of SA-B81–B84 that this pull request moves to BanachSpaceTheory.

**Witness.** The overlaps report at this head lists #1187 as conflicting in `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/Suggested.lean`; `roadmaps show SelfAdjointSpectralTheory --pr 1187` still shows `theorem integral_withDensityᵥ` near line 235.

**Repair.** One line in the description: this pull request merges first, and #1187 rebases and drops its hunk here (SA-B81–B84 and `integral_withDensityᵥ` stay only in BanachSpaceTheory).

## R13 (P3) — Form of `Suggested.lean`

**Location.** `Suggested.lean` lines 13–16: "README.md is the definitive and exhaustive roadmap specification. This file gives suggested Lean forms for selected labeled obligations … in this human-owned roadmap library"; line 51 (`def spectrum` under `namespace TauCeti` / `namespace LinearPMap`); line 773 (`noncomputable def courseMatrixOperator`, no docstring).

**Claim.** The docstring is not "<title>: target signatures", does not say the file states the headline theorems, and lists no unstatable headline; a declaration sits in Tau Ceti's own namespace; `courseMatrixOperator` has no docstring and "the course's concrete matrix" is unexplained vocabulary.

**Witness.** The lines quoted above, unchanged at this head.

**Repair.** Rewrite the docstring in the required form; delete the `TauCeti` namespace block (R02) and the course-matrix block (R06).

## Previous findings

- R01 — not repaired: `Suggested.lean` line 112 still reads "noncomputable def generator (U : OneParameterUnitaryGroup H) : H →ₗ.[ℂ] H := sorry"; the gate still counts 20 `sorry-data` hits.
- R02 — not repaired: README line 128 still opens "## What is missing (build here)" with the six bullets; `Suggested.lean` lines 36–37 still say Tau Ceti "does not define" the partial-operator spectrum.
- R03 — not repaired: README lines 1343–1345 still say "VonNeumannAlgebras V4.0.Decomposition and OperatorAlgebraDynamics D5 consume SA-B85’s separable diagonal C₀(X) representation"; VonNeumannAlgebras on main still owns the three blocks.
- R04 — not repaired: lines 680 and 698 still declare `spectralPVM` and `genToGroup` with `sorry` bodies; no `exists_hilbertBasis_eigenvectors`; no headline list in the README.
- R05 — not repaired: line 8 still reads "import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested".
- R06 — not repaired: line 773 still declares `courseMatrixOperator`; the form-bound monotonicity lemmas and the other listed declarations are still present.
- R07 — not repaired: line 1 is still "# Self-adjoint spectral theory: …"; `**Checks` and `*Needs:*` counts are both 0.
- R08 — not repaired: the locator grep returns 0; the References block still gives chapter ranges only.
- R09 — not repaired: lines 624, 944, 960, 1318 and 1328 still link `blob/<sha>`; lines 109, 161 and 1334 still link `TauCetiRoadmap/OneParameterSemigroups/README.md`.
- R10 — not repaired: line 579 still reads "`spectrum_apply_subset`, `ContinuousMap.spectrum_eq_range` and".
- R11 — not repaired: the outside-folder diff still lists `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.
- R12 — not repaired: the description's merge-order paragraph still names only #1101, #1807 and #1808.
- R13 — not repaired: lines 13–16, 51 and 773 are unchanged.

## Verified sound

**The change since c07dda7.** Empty for this folder and for the family index: `git diff --stat c07dda7..56715a5 -- TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory 'TauCetiRoadmap/OperatorTheory/*'` prints nothing. The two commits since c07dda7 change `TauCetiRoadmap/AlgebraicTopology/{README.md,Suggested.lean}` and `TauCetiRoadmap/BordismFormalGroups/{README.md,Suggested.lean}`; this README cites neither roadmap (no occurrence of either name), so no changed passage affects this folder.

**Gate, dependency check, elaboration.**
- Worker's gate at 56715a5: FAIL on `blob` 5, `sorry-data` 20, `imports` 1, `readme-ids-missing` 4, `outside-folder` 2; `build` 0, `depcheck` 0, `stray-files` 0 — the same five failures as at c07dda7, each covered by R09, R01, R05, R10 and R11.
- Dependency check, run at this head: `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. No UPWARD or CYCLE line for this roadmap.
- `lake env lean TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/Suggested.lean` at this head: exit 0 in 13 s, 53 warnings, all "declaration uses 'sorry'", no error and no other warning. (The OrthogonalGeometry object file was present from the worker's targeted build.)

**The pull request's own change to this folder (SA-B81–B84 moved to BanachSpaceTheory B5)** was verified in the previous report and is unchanged: BanachSpaceTheory at this head states B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular, B5.ScalarUniqueness and B5.BoundedApprox in that order, declares `integral_withDensityᵥ` in its `Suggested.lean`, and no longer cites this roadmap as a supplier.

**Citations re-resolved at this head.**
- VonNeumannAlgebras on main (bbbde05a) lines 31–39 and 218 (ownership claim, R03), line 1279 (V4.0.Decomposition consumes V4.0.Multiplication), line 4202 (its link to this folder).
- `Completed/OneParameterSemigroups/README.md` exists on main; `TauCetiRoadmap/OneParameterSemigroups/` does not (R09).
- Pinned Tau Ceti: `Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:140` (`spectrum`), `Analysis/Semigroups/Group/Stone/Unbounded.lean:115` (Stone criterion). Pinned Mathlib: `Algebra/Algebra/Spectrum/Basic.lean:416` (`AlgHom.spectrum_apply_subset`).
- The worker's citation scan (`roadmaps resolve`) finds every cross-roadmap citation and every backticked name of this README somewhere; the overlaps scan lists no dropped id in either direction and no id that only an open revision defines.

**Mechanical signature check.** The file is unchanged, so the previous report's `#check @` pass over 42 declarations stands: every elaborated type matches its README generality except `representationEssentialSpace_complete` and `representationOnEssentialSpace` (which drop unneeded compactness and Borel instances, harmless) and `integral_complexMeasure_withDensity` (more general than SA-B64, and true).

**Adversarial table.** No statement changed, so every row of the previous report (PRREVIEW-SelfAdjointSpectralTheory~4, "Adversarial table") carries forward with its instances and values; the rows for the sampled targets and the headlines are repeated here with their values.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `generator_genToGroup` (E29), as elaborated | H=ℂ, A₀=0, A₁=id | LHS one constant (`rfl`); RHS at vector 1: 0 vs 1 | false (proved in Lean, r4) | R01 |
| `ProjValMeasure.inner_proj` (B22), as elaborated | PVM on ℂ, B=univ, ξ=1,2 | LHS 1 and 4; RHS one constant | false (proved in Lean, r4) | R01 |
| `scalarMeasure_apply` (B41), as elaborated | ψ=1, B=univ, ξ=0 vs 1 | RHS 0 vs 1; LHS constant | false | R01 |
| `spectralPVM_resolvent_formula` (E05), mathematics | A=0 on ℂ, z=i, ξ=1 | ⟪1,(i)⁻¹·1⟫=−i; μ_ξ=δ₀ gives (i−0)⁻¹=−i | true | none |
| same, as elaborated | ξ=1 vs ξ=2 | LHS −i vs −4i; RHS one constant | false | R01 |
| D1 generator domain (SA-A02) | U(t)=e^{ita}·I on ℂ | (e^{ita}−1)/(it) → a; domain ℂ, generator a·I | agrees with `complexGenerator` at the pin | R02 |
| D2 `borelCalculus` (SA-B05) | README D2 against Lean lines 381–383 | the same expression | agree | none |
| D3 perturbation (SA-C52) | A=id total, V=−id; E=0 | (A+V)ψ=0 on dom A, self-adjoint | equals `LinearPMap.perturb` at the pin by `rfl` | R02 |
| D4 resolvent (SA-D03–D07) | A=0, z=2i; A=1, z=1+i | ‖R‖=½ ≤ ½; ‖R‖=1 ≤ 1 | true, sharp | R02 |
| Milestone B3 (B59–B62) existence and uniqueness | K=∅ unital; π=0 | 1=0 in C(∅) so H=0; range π(1)=0, both sides 0 | true | R01/R04 (restate as ∃!) |
| Milestone B6 (B85) multiplicity | c·I on ℂ² | two cyclic vectors, μ_j=δ_c, m(c)=2; ‖w^{−1/2}f‖²_{wμ}=‖f‖²_μ | true | R03 (owner) |
| Milestone C1 restriction bridge (C84) | A=diag(1,2) on ℂ², U=span e₂; U=0 | σ(A\|_U)={2}, 2\|x₂\|² ≤ ⟨Ax,x⟩; σ=∅, 0 ≤ 0 | true | none |
| Milestone C2 Kato–Rellich (C55) at b=1 | V=−A on dom A ≠ H | A+V=0 on dom A, not closed, not self-adjoint | b<1 needed and kept by Tau Ceti | none |
| Yosida approximants (E14–E16, E21, E27) | A=a·I | A_n⁺=ina/(in−a)→a; S_n=n²a/(n²+a²) real; a=n=1: A_1⁺=(1−i)/2 not real | true | R01 (state for the native group) |
| Cayley transform (D24, E01) | A=a·I; a=0 | U=(a−i)/(a+i), \|U\|=1; U=−1, inverse coordinate at w=−1 gives 0 | true | none |
| Compact normal decomposition (C86) | T=diag(i, −i) on ℂ²; T=0 | eigenbasis e₁,e₂ with ν=i,−i; any orthonormal basis with ν=0 | true | R04 (absent headline) |
| C87 matrix | the 5×5 matrix | column norms 45, 128, 2, 350, 280; all cross products 0; ‖T‖=√350 | true | R06 (Check) |
| E41 reassembly | c=∞; Q={id}, c=1 | ∞·‖Qᵢx‖ₑ ≤ ‖Qᵢy‖ₑ forces Qᵢx=0; ‖x‖ ≤ ‖y‖ | true | none |
| E32–E35 grid | ε=1 | cells [k,k+1) disjoint and cover ℝ | true | R02 (`Real.gridCell`) |
| B32 half-line criterion | T=0, c=0 and c=1 | P((−∞,0))=0 ⟺ 0 ≤ 0; P((−∞,1))=I ≠ 0 ⟺ ‖x‖² ≤ 0 fails | true both ways | none |
| B04 polarization | s conjugate-linear in x | Σ i⁻ᵏ q(x+iᵏy) = 4 s(x,y) | true | none |
| B12, B47 on X=∅ | X=∅ | P(univ)=P(∅) gives id=0, H=0, norm 0 ≤ M | true | none |

**Ownership against open pull requests.** Unchanged from the previous report: UnboundedOperators (#1027) and QuantumFoundations (#1771) consume this roadmap and own none of its objects; VonNeumannAlgebras (#1041) keeps the ownership claim of R03 at its open head; NoncompactQuantumSymmetry (#1015) uses a Tau Ceti `ProjValMeasure` that exists only at a newer pin. #1187 is the only open pull request changing this folder (R12).

## Not verifiable

- **Sampled locators.** None of the sampled targets ("Tau Ceti already ships the semigroup layer" line 104, the "Objects" paragraphs at lines 163, 268, 724, 981 and 1126, Milestones B3, B6, C1, C2, the "Acceptance examples" paragraphs at lines 1273–1298, "External" line 1328, D1–D4 lines 1358–1368) carries a theorem or page locator (R08), so nothing could be checked against a text.
- **The six references.** Reed–Simon I, Schmüdgen GTM 265, Rudin *Functional Analysis*, Kato, Weidmann GTM 68 and Engel–Nagel GTM 194 are commercial books with no legal open copy; none was fetched.
- **The manifest's only source.** `sources.toml` records Teschl2009 (certified, author page) with `cited_for` sections "1.3", "2.2", …, "4.2", but the README at this head cites Teschl nowhere and has no such section numbers; the entry belongs to a rewrite that is not in this pull request, so it could verify nothing here.

## Source issues

- none
