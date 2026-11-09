# Review of SelfAdjointSpectralTheory (pull request #1854 at 49135b7)
Folder: `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/`
**Verdict:** needs changes

Incremental re-review of 0 changed lines since 56715a5. The folder and the family index `TauCetiRoadmap/OperatorTheory/*` are byte-identical to what the previous review read, and the Mathlib and Tau Ceti pins are unchanged (`git diff 56715a5 HEAD -- lake-manifest.json lean-toolchain` is empty). So all thirteen previous findings stand. They are restated below with their witnesses re-checked at this head.

The commits since 56715a5 do rewrite BanachSpaceTheory, which this README cites for Goldstine's theorem (B1) and for the five-item scalar-measure layer (B5). At this head, BanachSpaceTheory says that all of these are Tau Ceti's at the pin, and it has deleted its own `integral_withDensityᵥ`. That leaves this README's supplier attribution stale, and it turns SA-B58 into a restatement of a pinned theorem. This is the one new finding, R14. The worker's gate still fails on the same five checks.

## R01 (P1) — Sorry'd data makes the stated theorems false

**Location.** `Suggested.lean` lines 83, 112, 164, 170, 176, 182, 209, 217, 270, 278, 285, 302, 325, 333, 372, 432, 440, 680, 698 and 753. For example, line 112 reads "noncomputable def generator (U : OneParameterUnitaryGroup H) : H →ₗ.[ℂ] H := sorry".

**Claim.** A `sorry` body whose type does not mention the arguments elaborates to a single constant. So `generator`, `diagMeasure`, `scalarMeasure`, `integral`, `spectralPVM`, `genToGroup` and `yosidaGroup` ignore their inputs, and the ring, star and algebra instances on `BoundedBorelFunction` are unrelated to pointwise operations. Every theorem about these objects is false or vacuous, including the headlines `isSelfAdjoint_generator`, `spectralPVM_resolvent_formula`, `generator_genToGroup` and `tendsto_yosidaGroup`.

**Witness.** Re-proved at this head in a scratch copy: `example (U V : OneParameterUnitaryGroup H) : generator U = generator V := rfl`, and `spectralPVM A hA = spectralPVM B hB := rfl`, both elaborate (exit 0, no error). At A = 0 and A = 1 on ℂ, `generator_genToGroup` would then force 0 = 1.

**Repair.** Unchanged from the previous report:
- Delete every sorry'd `def` and `instance`.
- Make the bounded Borel symbols a `StarSubalgebra ℂ (X → ℂ)` with carrier `{f | Measurable f ∧ ∃ M, ∀ x, ‖f x‖ ≤ M}`.
- Replace the constructions `spectralPVM` and `ofRepresentation` by `∃! P : ProjValMeasure ℝ H, …` characterisations: the resolvent formula on diagonal measures for the first; regular measures with `⟪ξ, π f ξ⟫ = ∫ f dμ` for the second.
- State Yosida approximation for the native `StronglyContinuousGroup` with `U.complexGenerator hU = Complex.I • A`.

Tested on the refuting instance: once P is bound per operator, A = 0 and A = 1 receive the δ₀-valued and δ₁-valued PVMs, and no `rfl` identifies them.

## R02 (P2) — Parts A, C and D, SA-E28 and SA-E32–E34 restate what the pinned Tau Ceti already proves

**Location.** README line 128, "## What is missing (build here)", and its bullets. `Suggested.lean` lines 36–37: "What Part D still adds at the level of the core is the spectrum, which Tau Ceti does not define for a partial operator." Also `Suggested.lean` lines 40–56, 71–135, 490–523 and 635–663.

**Claim.** Most "build here" obligations are declarations of the pinned Tau Ceti or Mathlib. They must be cited, not planned. `Suggested.lean` duplicates `spectrum` in Tau Ceti's own namespace and re-creates the unitary-group carrier together with its generator and Stone's theorem.

**Witness.** In the pinned Tau Ceti, `Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:140` reads "def spectrum (A : X →ₗ.[𝕜] X) : Set 𝕜 := A.resolventSetᶜ". `Analysis/Semigroups/Group/Stone/Unbounded.lean:115` declares `LinearPMap.isSelfAdjoint_iff_exists_isUnitary_complexGenerator_eq_I_smul`.

**Repair.**
- Delete these targets from the build and list them under "From Tau Ceti" and "From Mathlib", using the names and files in the table of PRREVIEW-SelfAdjointSpectralTheory~4.
- Correct SA-D02 and the docstring.
- Delete the duplicated declarations and the `OneParameterUnitaryGroup` block from `Suggested.lean`.
- Add one old → new line for each deleted id that UnboundedOperators, QuantumFoundations, AutomorphicSpectralTheory or GeneralizedCohomology cites. GeneralizedCohomology cites SA-D15–D17 at this head, at its README lines 415, 3770 and 3792.

## R03 (P2) — VonNeumannAlgebras also claims ownership of the Borel calculus, the multiplication models and the unbounded spectral measure

**Location.** README lines 1343–1345: "VonNeumannAlgebras V4.0.Decomposition and OperatorAlgebraDynamics D5 consume SA-B85’s separable diagonal C₀(X) representation, multiplicity and measure-change theorem."

**Claim.** VonNeumannAlgebras, on main and at merge-order line 5, owns V2.BorelCalculus, V4.0.Multiplication and V10.ClosedOperators, and says it consumes nothing from this roadmap. SA-B01–B62, B66–B80, B85, B86 and E01–E13/E44 plan the same objects, so each of those objects has two owners. The Downstream sentence quoted above is false.

**Witness.** VonNeumannAlgebras README on main (3090489), lines 31–39: this roadmap "is a consumer of this roadmap … so nothing here is taken from it", followed by the three blocks "owned here". Line 218 reads "Nothing is consumed from the spectral sub-roadmap SelfAdjointSpectralTheory". The same claim appears at its open head, line 32.

**Repair.** Settle a single owner. The owner consistent with the merge order is VonNeumannAlgebras:
- Cite its three blocks in a "From TauCetiRoadmap.VonNeumannAlgebras" contract.
- Delete SA-B85, SA-B86 and the Part B and Part E targets those blocks state. Keep only what they do not state: PVMs on arbitrary measurable spaces, the reindexing in SA-B25 and SA-B51, and Yosida approximation for the native group.
- Add old → new lines for the ids that other roadmaps cite.
- Delete the false Downstream sentence.

## R04 (P2) — Statable headline theorems are absent or stated through stand-ins

**Location.** `Suggested.lean` lines 10–21 (the module docstring), 372–417 and 680–762.

**Claim.** The README gives no headline list. Its end theorems are statable at the pins without stand-ins:
- existence and uniqueness of the unbounded spectral measure (SA-E01/E05/E44);
- existence and uniqueness of the PVM of a representation (SA-B59–B62);
- Yosida approximation (SA-E27);
- the compact normal decomposition (SA-C86).

The file states the first three through the sorry'd `spectralPVM`, `genToGroup`, `yosidaGroup`, `ofRepresentation` and `integral`. It omits SA-C86, and it does not name SA-B85's multiplicity classification as not statable.

**Witness.** Tau Ceti's `exists_hilbertBasis_forall_hasEigenvector` (`Analysis/InnerProductSpace/Spectrum.lean:152`) requires `IsSymmetric`. No pinned Tau Ceti file that mentions `IsCompactOperator` also mentions `IsStarNormal`.

**Repair.**
- Add a headline list to the README.
- State the first three in the `∃!` forms given under R01.
- Add `exists_hilbertBasis_eigenvectors` for a compact normal `T : H →L[ℂ] H`.
- Name the multiplicity classification in the docstring as not statable, subject to R03.

## R05 (P3) — `Suggested.lean` imports another roadmap's module, and uses nothing from it

**Location.** `Suggested.lean` line 8: "import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested".

**Claim.** Only `Mathlib` and `TauCeti.*` modules may be imported. The gate rule `imports` fails with 1 hit at this head.

**Witness.** The gate line at this head reads: "found: `import Mathlib` (line 5), … `import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested` (line 8)". No declaration of OrthogonalGeometry occurs in the file.

**Repair.** Delete line 8.

## R06 (P3) — Padding in `Suggested.lean`

**Location.** `Suggested.lean` lines 94–103, 131–135, 186–192, 222–244, 316–367, 419–471, 504–617, 741–746 and 766–781. This includes line 773, "noncomputable def courseMatrixOperator :".

**Claim.**
- One term closes the form-bound monotonicity lemmas, `IsPositive.lowerFormBoundOn_top`, `isPositive_of_lowerFormBoundOn_top`, `eventually_ae_iff` and `toSemigroup_apply`.
- `BoundedBorelFunction.ext` and `pullbackHom_apply` restate definitions.
- The course-matrix block computes a small value.
- `MapsDomainTo`, `SylvesterEquation`, `LowerFormBoundOn`, `UpperFormBoundOn` and `ProjValMeasure.ae` serve no headline.

**Witness.** `fun x hx => (mul_le_mul_of_nonneg_right hc (sq_nonneg _)).trans (h x hx)` proves `LowerFormBoundOn.mono_const` at the pins (PRREVIEW-SelfAdjointSpectralTheory~4). The block is unchanged at this head.

**Repair.** Delete these declarations from `Suggested.lean`. The README keeps each one as a target or a Check.

## R07 (P3) — The README does not follow the TauCetiRoadmap form

**Location.** README line 1: "# Self-adjoint spectral theory: the Borel functional calculus, unbounded operators, and Stone's theorem". The same problem runs through the sections "What Mathlib and Tau Ceti already have (consume)", "What is missing (build here)", "Part A"–"Part E", the milestones and "Definitions".

**Claim.** The README lacks:
- a `# Roadmap:` title and a **Summary.** paragraph;
- Scope and ownership, and How to read the build sections;
- `## Layer k` / `### k.n` prose and per-supplier contracts;
- *Needs:* lines and `**Checks.**` lists;
- Examples and Dependencies for each layer.

In addition, the SA-xxx labels form a catalogue and "SAST" is never defined.

**Witness.** At this head, `grep -c '\*\*Checks' README.md` and `grep -c '\*Needs:\*' README.md` both return 0, against about forty definitions.

**Repair.** Rewrite the README in the house shape, with API bullets and at least three Checks for each surviving definition. PRREVIEW-SelfAdjointSpectralTheory~4 gives the Cayley transform's three Checks as a model.

## R08 (P3) — No theorem carries a locator

**Location.** README lines 1384–1386: "M. Reed, B. Simon, … — VII (the spectral theorem, bounded and unbounded), VIII.3–4 (Stone's theorem, the Cayley transform, von Neumann's criterion)."

**Claim.** None of SA-A01–SA-E47 has a theorem or page locator, and the references give chapter ranges only. As a result, none of the seeded sample can be checked against a text.

**Witness.** At this head, `grep -cE 'Thm\.?|Theorem [0-9IVX]|p\. ?[0-9]' README.md` returns 0.

**Repair.** Put a locator at each theorem. The certified Teschl2009 already in the manifest supplies three, checked here; record the sign conventions next to them:
- The Cayley transform (2.102) and Theorem 2.25, p. 81 (Teschl2009 lines 3333–3336), for D24 and D5.
- Theorem 3.7, p. 96 (line 3983), for SA-E01/E05. Teschl's resolvent is `(A−z)⁻¹`.
- Theorem 5.2 (Stone), p. 124 (line 5232), for SA-A21–A22. Teschl writes `U(t)=exp(−itA)`.

## R09 (P3) — Links pinned to commits, and a dead link

**Location.** README lines 624, 944, 960, 1318 and 1328 link `…/TauCetiRoadmap/blob/<sha>/…` (gate `blob`, 5 hits). Lines 109, 161 and 1334 link "…/blob/main/TauCetiRoadmap/OneParameterSemigroups/README.md".

**Claim.** Links into the roadmap repository must not be pinned to a commit, and the OneParameterSemigroups link no longer resolves.

**Witness.** On main (3090489) the roadmap lives at `Completed/OneParameterSemigroups/`. `TauCetiRoadmap/OneParameterSemigroups/` does not exist.

**Repair.** Use relative links: `../../VonNeumannAlgebras/README.md`, `../../BanachAlgebras/README.md` and `../../../Completed/OneParameterSemigroups/README.md`.

## R10 (P3) — Backticked names the gate cannot resolve (`readme-ids-missing`)

**Location.** README line 579: "`spectrum_apply_subset`, `ContinuousMap.spectrum_eq_range` and".

**Claim.** `spectrum_apply_subset` is not a full Mathlib name. The other three hits exist at the pins and are false positives:
- `spectrum.isOpen_resolventSet` (Mathlib `Analysis/Normed/Algebra/Spectrum.lean:164`);
- `LinearPMap.analyticOnNhd_resolvent` (Tau Ceti `Analysis/Normed/Operator/Resolvent/Analytic.lean:76`);
- the Stone criterion (Tau Ceti `Analysis/Semigroups/Group/Stone/Unbounded.lean:115`).

**Witness.** `Mathlib/Algebra/Algebra/Spectrum/Basic.lean:416` declares `theorem spectrum_apply_subset` inside `namespace AlgHom` (opened at line 401).

**Repair.** Write `AlgHom.spectrum_apply_subset`. Move the other three into the "From Mathlib" and "From Tau Ceti" contracts with their modules. If the gate still flags them there, the worker reports the false positive.

## R11 (P3) — Edits outside the roadmap folder

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (1 line changed) and `TauCetiRoadmap/SymplecticGeometry/README.md` (3 lines changed).

**Claim.** Neither folder is among this pull request's own roadmap folders, so no review covers those two loop cuts. The gate's `outside-folder` check fails.

**Witness.** `git diff --stat origin/main...HEAD` with every listed folder excluded still prints exactly these two files: 4 insertions and 4 deletions.

**Repair.** Move the two loop cuts into their own pull requests, or declare those folders as this pull request's own so that they are reviewed.

## R12 (P3) — Conflict with open pull request #1187, and no order is stated

**Location.** The description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Claim.** #1187 (the Tau Ceti bump) also changes this roadmap's `Suggested.lean`, and the description says nothing about it.

**Witness.** The overlaps report at this head lists #1187 as conflicting in `TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/Suggested.lean`. `roadmaps show SelfAdjointSpectralTheory --pr 1187 --file Suggested.lean` still declares `theorem integral_withDensityᵥ` at line 236.

**Repair.** Add one line to the description: this pull request merges first, and #1187 rebases and drops its hunk here. SA-B82's statement is Tau Ceti's `MeasureTheory.VectorMeasure.integral_mul_withDensityᵥ` at the pin, and BanachSpaceTheory at this head no longer restates it either.

## R13 (P3) — Form of `Suggested.lean`

**Location.** `Suggested.lean` lines 13–16: "README.md is the definitive and exhaustive roadmap specification. This file gives suggested Lean forms for selected labeled obligations … in this human-owned roadmap library". Also line 51 (`def spectrum` inside `namespace TauCeti` / `namespace LinearPMap`, lines 40–56) and line 773 (`courseMatrixOperator`, which has no docstring).

**Claim.** The heading has the required "…: target signatures" form, but the body has three problems. It does not say that the file states the roadmap's headline theorems. It names no unstatable headline. It uses process wording ("human-owned roadmap library"). Separately, a declaration sits in Tau Ceti's namespace, and "the course's concrete matrix" is unexplained vocabulary.

**Witness.** The lines quoted above, unchanged at this head.

**Repair.** Rewrite the docstring body in the required form. Delete the `TauCeti` namespace block (R02) and the course-matrix block (R06).

## R14 (P3) — Part B cites BanachSpaceTheory for Goldstine and the scalar-measure layer, which BanachSpaceTheory at this head says are Tau Ceti's at the pin

**Location.** README lines 95–100: "BanachSpaceTheory B5's scalar-measure layer: B5.ScalarIntegral … B5.BoundedApprox … — Part B consumes these". The same attribution appears at lines 264, 425, 478–479, 493–495, 503, 512, 531, 535, 698–699 and 711, and at lines 1308–1311 (the sampled "Internal" paragraph).

**Claim.** This head rewrites BanachSpaceTheory:
- It no longer states Goldstine or B5.ScalarIntegral–B5.BoundedApprox as targets; it keeps the ids only as pointers to pinned Tau Ceti files.
- It deletes `integral_withDensityᵥ` from its `Suggested.lean`.

So the supplier attribution of SA-B43, SA-B58–B60, SA-B64, SA-B65, Milestones B1 and B5 and "Internal" now routes through a roadmap that owns none of it. SA-B58 also becomes a restatement of the pinned theorem it says it "applies".

**Witness.** BanachSpaceTheory README at this head, lines 71–72: the five items "are Tau Ceti's at the pin, and this roadmap and SelfAdjointSpectralTheory both consume them there". Lines 50 and 175 list Goldstine as pinned `NormedSpace.closure_image_inclusionInDoubleDualWeak_closedBall`.

**Repair.**
1. Move these to "From Tau Ceti", with names and files:
   - `MeasureTheory.VectorMeasure.integral_const_mul`, `scalarMeasureRealPart`, `scalarMeasureImagPart` and `scalarMeasureOfReal` (`MeasureTheory/VectorMeasure/ScalarIntegral.lean:67,79,84,88`);
   - `integral_mul_withDensityᵥ` and `VectorMeasure.integral_mul_withDensityᵥ_one` (`MeasureTheory/VectorMeasure/WithDensity.lean:155,183`);
   - `Measure.AbsolutelyContinuous.regular` (`MeasureTheory/Measure/Regular.lean:234`);
   - `regular_variation_add`, `regular_variation_smul` and `regular_variation_sub` (`MeasureTheory/VectorMeasure/Variation/Regular.lean:62,81,88`);
   - `VectorMeasure.ext_of_integral_eq_on_continuousMap` (`MeasureTheory/VectorMeasure/Uniqueness.lean:122`);
   - `exists_continuous_norm_le_forall_integral_norm_sub_le` and `exists_seq_continuous_norm_le_tendsto_integral_norm_sub` (`MeasureTheory/Function/ContinuousApproximation.lean:87,119`);
   - Goldstine (`Analysis/Normed/Module/Dual/Goldstine.lean:50`).
2. Repoint SA-B43, B59, B60, B64, B65, Milestones B1 and B5 and "Internal" to these names. Keep BanachSpaceTheory only for §5.4's `M(K)` in SA-B63, which it still owns.
3. Delete SA-B58. The reductions are: compact Hausdorff is normal, finite regular is weakly regular, take ε/2; the sequence clause is the second theorem.
4. Delete the integral clause of SA-B43, which is `VectorMeasure.integral_mul_withDensityᵥ_one`.
5. The worker updates the description's BanachSpaceTheory bullet, which still says the layer "is owned by BanachSpaceTheory".

Tested: a scratch copy proves SA-B58's statement (finite family of finite regular measures on a compact Hausdorff Borel K, measurable f bounded by M, strict ε) from `exists_continuous_norm_le_forall_integral_norm_sub_le` with ε/2 in two lines. It elaborates at the pins, exit 0, no error. If the gate flags the pinned names, they are R10's false-positive class.

## Previous findings

- R01 — not repaired: `Suggested.lean` line 112 still reads "noncomputable def generator (U : OneParameterUnitaryGroup H) : H →ₗ.[ℂ] H := sorry", and lines 680 and 698 still give `spectralPVM` and `genToGroup` `sorry` bodies. The gate still counts 20 `sorry-data` hits.
- R02 — not repaired: README line 128 still opens "## What is missing (build here)". `Suggested.lean` lines 36–37 still say Tau Ceti "does not define" the spectrum of a partial operator.
- R03 — not repaired: README lines 1343–1345 still say "VonNeumannAlgebras V4.0.Decomposition and OperatorAlgebraDynamics D5 consume SA-B85’s separable diagonal C₀(X) representation". VonNeumannAlgebras on main (3090489) still owns the three blocks.
- R04 — not repaired: there is still no headline list, no `exists_hilbertBasis_eigenvectors`, and `spectralPVM`/`genToGroup` are still sorry'd definitions (lines 680, 698).
- R05 — not repaired: line 8 still reads "import TauCetiRoadmap.OperatorTheory.OrthogonalGeometry.Suggested".
- R06 — not repaired: line 773 still declares `courseMatrixOperator`, and the form-bound monotonicity lemmas are still present.
- R07 — not repaired: line 1 is still "# Self-adjoint spectral theory: …". The `**Checks` and `*Needs:*` counts are both 0.
- R08 — not repaired: the locator grep returns 0, and References still gives chapter ranges only (lines 1384–1397).
- R09 — not repaired: lines 624, 944, 960, 1318 and 1328 still link `blob/<sha>`. Lines 109, 161 and 1334 still link `TauCetiRoadmap/OneParameterSemigroups/README.md`.
- R10 — not repaired: line 579 still reads "`spectrum_apply_subset`, `ContinuousMap.spectrum_eq_range` and".
- R11 — not repaired: the outside-folder diff still lists `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.
- R12 — not repaired: the description's merge-order paragraph still names only #1101, #1807 and #1808.
- R13 — not repaired: lines 13–16, 40–56 and 773 are unchanged.

## Verified sound

**The change since 56715a5.**
- `git diff --stat 56715a5..HEAD -- TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory 'TauCetiRoadmap/OperatorTheory/*'` prints nothing.
- The 22 commits since then change 22 files in eleven other folders. The pins are unchanged.
- Among those folders, this README cites only BanachSpaceTheory (R14). A grep finds no citation of the other ten.
- GeneralizedCohomology cites this roadmap's SA-D15–D17, which exist at README lines 1034–1038.
- BanachSpaceTheory at this head still owns §5.4 `M(K)` (lines 1317–1394), so SA-B63's citation is valid.
- BanachSpaceTheory's Downstream line 1941 is consistent with this roadmap as a consumer.
- No repair introduced a new problem, because no repair was made.

**Gate, dependency check, elaboration.**
- Worker's gate at 49135b7: FAIL on `blob` 5, `sorry-data` 20, `imports` 1, `readme-ids-missing` 4 and `outside-folder` 2 (covered by R09, R01, R05, R10 and R11). `build` 0, `depcheck` 0, `stray-files` 0, `statement-hygiene` 0.
- My own rerun of the gate reproduces the same counts for the first four checks. Run without the pull request's folder list, it lists `outside-folder` 38: the two above plus the pull request's own folders.
- Dependency check at this head prints `depcheck: 235 roadmaps, 2265 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line for this roadmap. BanachSpaceTheory and VonNeumannAlgebras are both on main.
- `lake env lean TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/Suggested.lean`: exit 0 in 16 s, with 53 warnings, all "declaration uses `sorry`", and no error.

**Mechanical signature check.**
- A scratch copy with `#check @` for all 70 declarations elaborates (exit 0).
- The headline signatures match the README's generality as recorded in PRREVIEW-SelfAdjointSpectralTheory~4/5: `spectralPVM_resolvent_formula` (`z.im ≠ 0`, `∫ (z − s)⁻¹ ∂ diagMeasure ξ`), `ofRepresentation_unique` (regularity explicit), `tendsto_yosidaGroup` and `generator_genToGroup`.
- Nothing changed since then.

**Probes, in a scratch copy elaborated at the pins (exit 0, no error).**
- `generator U = generator V := rfl` (R01).
- `spectralPVM A hA = spectralPVM B hB := rfl` (R01).
- SA-B58 from `MeasureTheory.exists_continuous_norm_le_forall_integral_norm_sub_le` in two lines (R14).

**Library declarations opened at the pins (14).**

Tau Ceti:
- `MeasureTheory/Function/ContinuousApproximation.lean:68,87,119`
- `MeasureTheory/VectorMeasure/WithDensity.lean:105,155,167,183`
- `MeasureTheory/VectorMeasure/Uniqueness.lean:122`
- `MeasureTheory/Measure/Regular.lean:234`
- `MeasureTheory/VectorMeasure/Variation/Regular.lean:62,81,88`
- `MeasureTheory/VectorMeasure/ScalarIntegral.lean:67–190`
- `Analysis/Normed/Module/Dual/Goldstine.lean:50`
- `Topology/Algebra/Module/LinearPMap/Resolvent/Basic.lean:140`
- `Analysis/Semigroups/Group/Stone/Unbounded.lean:115`
- `Analysis/Normed/Operator/Resolvent/Analytic.lean:76`
- `Analysis/InnerProductSpace/Spectrum.lean:152` (symmetric only)

Mathlib:
- `Algebra/Algebra/Spectrum/Basic.lean:401,416`
- `Analysis/Normed/Algebra/Spectrum.lean:164`

**Cross-roadmap citations resolved.**
- BanachSpaceTheory at this head, lines 23–83, 175, 1317–1394 and 1941; at 56715a5, lines 946 and 1017 and `Suggested.lean` line 200.
- VonNeumannAlgebras on main 3090489, lines 31–39 and 218; at its open head, line 32.
- `Completed/OneParameterSemigroups/` on main.
- #1187's copy of this roadmap's `Suggested.lean`, line 236.
- The worker's citation scan finds every cross-roadmap citation. The overlaps scan lists no dropped id in either direction.

**Ownership against open pull requests.** I re-checked UnboundedOperators (#1027, which cites this roadmap 65 times and owns none of its objects), QuantumFoundations (#1771, a consumer) and VonNeumannAlgebras (#1041, R03). #1187 is the only open pull request that changes this folder (R12).

**Seeded sample.** Milestones A1, B2, B6, C1, C2, C3 and E2, the "Objects" paragraphs (lines 163, 268, 724, 981, 1126), the "Acceptance examples" paragraphs (lines 1273–1298), "Internal" (line 1306) and D1, D3, D4 and D5 (lines 1358–1373) carry no locator (R08). I checked their mathematics in the table below. For three of them I located the corresponding statement in Teschl2009.

**Remark on untouched text, not a finding.** SA-C87 sits in no milestone: C4 lists only SA-C86 (line 960).

**Adversarial table.** The rows for unchanged statements carry forward from PRREVIEW-SelfAdjointSpectralTheory~5 ("Adversarial table") with their values. The rows marked new cover this round's sampled targets and R14.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| `generator_genToGroup` (E29), as elaborated | H=ℂ, A₀=0, A₁=id | LHS is one constant (`rfl` re-proved at this head); RHS at vector 1: 0 vs 1 | false | R01 |
| `ProjValMeasure.inner_proj` (B22), as elaborated | PVM on ℂ, B=univ, ξ=1, 2 | LHS 1 and 4; RHS one constant | false | R01 |
| `spectralPVM` (E01), as elaborated | A=0, B=id on ℂ | `spectralPVM A hA = spectralPVM B hB` by `rfl` (re-proved); true PVMs δ₀ vs δ₁ | false | R01 |
| `spectralPVM_resolvent_formula` (E05), mathematics | A=a on ℂ, z=i, ξ=1; a=0 | ⟪1,(i−a)⁻¹⟫ = (i−a)⁻¹; μ_ξ=δ_a gives ∫(i−s)⁻¹ = (i−a)⁻¹; at a=0: −i = −i | true | none |
| E05 against Teschl Thm 3.7 (new) | A=a | Teschl2009 line 3990: `R_A(z)=P_A((λ−z)⁻¹)` with `R=(A−z)⁻¹`; README `(zI−A)⁻¹ ↔ (z−s)⁻¹`; both give the same μ_ξ=δ_a | consistent; opposite resolvent sign recorded | R08 |
| D5 (SA-E01) inverse Cayley coordinate (new) | A=a·I, a=0, 1, −1 | U=(a−i)/(a+i) = −1, −i, i; κ(U)=Re(i(1+U)/(1−U)) = 0, 1, −1 = a | true | none |
| D5 junk value κ(1)=0 (new) | any self-adjoint A | 1−U=2i(A+i)⁻¹ is injective (Teschl2009 line 3344), so P_U({1})=0 and κ(1) is never charged | harmless | none |
| D24 convention U=1+2iR(−i) (new) | A=1 | R(−i)=(−i−1)⁻¹; U=1−2i/(1+i)=1−(1+i)=−i; (A−i)(A+i)⁻¹=(1−i)/(1+i)=−i; Teschl2009 line 3333 has the same V | agree | none |
| D1 (SA-A02) generator (new) | U(t)=e^{ita} on ℂ | README quotient (e^{ita}−1)/(it) → a, so U=exp(itA); Teschl Thm 5.2 (line 5233) writes exp(−itA) and gets generator −a for the same group | consistent; opposite sign to Teschl recorded | R08 |
| D3 perturbation (SA-C52) | A=id total, V=−id | (A+V)ψ=0 on dom A; equals `LinearPMap.perturb` at the pin by `rfl` | true | R02 |
| D4 resolvent (SA-D03–D07) | A=0, z=2i; A=1, z=1+i | ‖R‖=½ ≤ 1/\|Im z\|=½; ‖R‖=1 ≤ 1 | true, sharp | R02 |
| Milestone A1/A2 grouping (new) | ids defined A01–A24 | A1 = A01–A20 (20), A2 = A21–A24 (4); disjoint, union = all 24 | sound | none |
| Milestone B2 grouping (new) | ids B14–B25, B40–B53 | 12 + 14 = 26, all defined (B81–B84 absent, as moved) | sound | none |
| Milestones C1–C3 grouping (new) | ids C01–C87 | C1 43, C2 13+11=24, C3 10; C57–C61 and C73–C75 undefined and uncited; C87 in no milestone | sound (C87 remark) | none |
| Milestone E2 grouping (new) | ids E14–E31 | 18 defined; E42 undefined and not listed in E3 | sound | none |
| Milestone B6 (B85) multiplicity | c·I on ℂ² | two cyclic vectors, μ_j=δ_c, m(c)=2; ‖w^{−1/2}f‖²_{wμ}=‖f‖²_μ | true | R03 (owner) |
| SA-C84 restriction bridge (Milestone C3) | A=diag(1,2) on ℂ², U=span e₂; U=0 | σ(A\|_U)={2}, 2\|x₂\|² ≤ ⟨Ax,x⟩; σ=∅, 0 ≤ 0 | true | none |
| Milestone C2 Kato–Rellich (C55) at b=1 | V=−A on dom A ≠ H | A+V=0 on dom A, not closed, not self-adjoint | b<1 needed and kept | none |
| Yosida approximants (E14–E16, E21, E27; Milestone E2) | A=a·I | A_n⁺=ina/(in−a) → a; S_n=n²a/(n²+a²) real; a=n=1 gives A_1⁺=(1−i)/2, not real | true | R01 (state for the native group) |
| Compact normal decomposition (C86) | T=diag(i,−i) on ℂ²; T=0 | eigenbasis e₁, e₂ with ν=i, −i; any orthonormal basis with ν=0 | true | R04 (absent headline) |
| SA-B58 vs pinned approximation (new) | K=[0,1], ν=Lebesgue, f=1_[0,½], M=1; K=∅ | ramp g_n: error 1/(2n) → 0, ‖g_n‖ ≤ 1; K=∅: g=0, vacuous (Tau Ceti handles it at line 92); Lean probe proves SA-B58 from the pin | duplicate of pinned theorem | R14 |
| SA-B43 integral clause (new) | ν=δ_p, bounded f; non-integrable f | LHS f(p) = RHS f(p); both 0 by `VectorMeasure.integral_mul_withDensityᵥ_one` | duplicate of pinned theorem | R14 |
| SA-B65 Goldstine input (new) | E=c₀, x=0, r=1 | 1∈ℓ∞=c₀** is the weak-star limit of (1,…,1,0,…) in the ball, ‖1‖=1; pinned at `Goldstine.lean:50` | supplier is Tau Ceti | R14 |
| "Internal" paragraph (sampled, new) | supplier of each named item at this head | B5.* map to five Tau Ceti files (BanachSpaceTheory lines 71–83); B1 Goldstine to Tau Ceti; §5.4 `M(K)` to BanachSpaceTheory | attribution stale for B1/B5.* | R14 |
| C87 matrix | the 5×5 matrix | column norms 45, 128, 2, 350, 280; all cross products 0; ‖T‖=√350 | true | R06 (Check) |
| E41 reassembly | c=∞; Q={id}, c=1 | ∞·‖Qᵢx‖ₑ ≤ ‖Qᵢy‖ₑ forces Qᵢx=0; ‖x‖ ≤ ‖y‖ | true | none |
| B32 half-line criterion | T=0, c=0 and c=1 | P((−∞,0))=0 ⟺ 0 ≤ 0; P((−∞,1))=I ≠ 0 ⟺ ‖x‖² ≤ 0, which fails | true both ways | none |
| B04 polarization | s conjugate-linear in x | Σ i⁻ᵏ q(x+iᵏy) = 4 s(x,y) | true | none |
| B12, B47 on X=∅ | X=∅ | P(univ)=P(∅) gives id=0, H=0, norm 0 ≤ M | true | none |

## Not verifiable

- **Sampled locators.** No sampled target carries a theorem or page locator (R08), so no locator could be checked. Instead I located the corresponding statements for D1, D5 and D24 in Teschl2009 (the rows above).
- **The six references.** Reed–Simon I, Schmüdgen GTM 265, Rudin *Functional Analysis*, Kato, Weidmann GTM 68 and Engel–Nagel GTM 194 are commercial books with no legal open copy. None was fetched. Schmudgen2012 and Conway1990 are settled as uncertified in the manifest.
- **The manifest's `cited_for` entries.** `sources.toml` records Teschl2009 for "1.3", "2.2" … "4.2", Schmudgen2012 for "4.1" and Conway1990 for "1.1". The README at this head has no sections with those numbers and cites none of the three works, so those entries could verify nothing here.

## Source issues

- none
