# Review of BanachSpaceTheory (pull request #1854 at 56715a5)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/BanachSpaceTheory/` has 0 changed lines since `c07dda7`. The two commits since then, `1ccc517` and `56715a5`, touch only `TauCetiRoadmap/AlgebraicTopology/` and `TauCetiRoadmap/BordismFormalGroups/`; neither folder cites this roadmap, and this roadmap cites neither. The pins (`lake-manifest.json`, `lean-toolchain`) are unchanged: Tau Ceti `2fd255d`, Mathlib `1b1ccf4`.

All eleven previous findings are carried forward unrepaired, with the same numbers. Each witness was re-checked at this head, at the pins and on main (`bbbde05`, which includes the `373d88d` the tools read). There are 11 findings, 4 of them blocking (P2).

## R01 (P2) — B5's scalar-measure layer restates proved Tau Ceti declarations as targets

**Location.** `README.md:49–54`: "B5 owns the generic scalar-measure integration, signed-part, density, regularity, uniqueness and bounded continuous-approximation layer (B5.ScalarIntegral, …); SelfAdjointSpectralTheory consumes it". The targets are at `:946–1024`.

**Claim.** All five bold targets are proved at the pinned Tau Ceti, and none of them carries a source locator. The README makes itself a second owner of this layer and routes SelfAdjointSpectralTheory through BanachSpaceTheory for material the library already supplies.

**Witness.** B5.ScalarUniqueness is `MeasureTheory.VectorMeasure.eq_zero_of_integral_eq_zero_on_continuousMap` (`TauCeti/MeasureTheory/VectorMeasure/Uniqueness.lean:115`). The maps B5.ScalarIntegral asks to name exist already as `scalarMeasureRealPart` and `scalarMeasureOfReal` (`ScalarIntegral.lean:79,88`).

**Repair.** Delete the five bold paragraphs and say in Scope that this layer is in Tau Ceti. Cite the pinned declarations in a "From Tau Ceti" contract:

- **B5.ScalarIntegral** is in `MeasureTheory/VectorMeasure/ScalarIntegral.lean`:
  - homogeneity: `integral_const_mul` (67), `integral_smul_vectorMeasure_mul` (73);
  - the parts: `scalarMeasureRealPart`, `scalarMeasureImagPart`, `scalarMeasureOfReal` (79, 84, 88) and `scalarMeasureOfReal_realPart_add_I_smul_imagPart` (119);
  - the variation bounds (139–153);
  - the integral comparisons: `re_integral_ofReal`, `im_integral_ofReal`, `integral_ofReal_scalarMeasureOfReal`, `scalarMeasureOfReal_withDensityᵥ` (190–219);
  - the Jordan split: `integral_mul_eq_integral_posPart_sub_integral_negPart` (252).
- **B5.ScalarDensity** is in `MeasureTheory/VectorMeasure/WithDensity.lean`: `integral_mul_withDensityᵥ` (155), `withDensityᵥ_one_apply` (167), `Measure.variation_withDensityᵥ_one` (175) and `integral_withDensityᵥ_congr_ae` (83).
- **B5.AbsContRegular** is `MeasureTheory.Measure.AbsolutelyContinuous.regular` (`MeasureTheory/Measure/Regular.lean:234`), with `regular_variation_add`, `_smul` and `_sub` (`MeasureTheory/VectorMeasure/Variation/Regular.lean:62–88`).
- **B5.ScalarUniqueness** is `Uniqueness.lean:115,122`; the `C_c` forms are at :81 and :100.
- **B5.BoundedApprox** is `exists_continuous_norm_le_forall_integral_norm_sub_le` and `exists_seq_continuous_norm_le_tendsto_integral_norm_sub` (`MeasureTheory/Function/ContinuousApproximation.lean:87,119`). These handle the finite families of measures that SelfAdjointSpectralTheory needs.

Then:

- Repoint the B5.* references in the M(K) and density paragraphs (`:1010–1013`, `:1036`, `:1046–1048`, `:1056`, `:1060–1063`, `:1083`, `:1114–1122`) to these names.
- In the M(K) construction "Λ⁺(f)=sup{Λ(g):0≤g≤f}", cite `TauCeti.RealRMK.posPart`, `TauCeti.RealRMK.negPart` and `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` (`MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:160,205,262`).
- SelfAdjointSpectralTheory, in this pull request, cites B5.* at `README.md:95–99, 425, 479–531, 699, 1311`. Repoint those citations to the same Tau Ceti names.
  - With that, neither roadmap cites the other for this layer, and the loop the pull request description describes stays cut.
  - `roadmaps grep` finds no other roadmap, on main or at an open head, citing these five ids.

## R02 (P2) — The docstring calls six headlines unstatable, but they are statable at the pins

**Location.** `Suggested.lean:24–33`: "the projective and injective tensor norms are targets", "the normed space of finite regular scalar Borel measures … is a target carrier", "needs the domination measure as data", "ellipsoids and volume of convex bodies are B7 targets".

**Claim.** The carriers these bullets call missing are present at the pinned Tau Ceti, or the theorem needs no new carrier.

**Witness.** The pinned Tau Ceti has `TauCeti.CompletedProjectiveTensor.toCompletedInjectiveTensor` (`TensorProduct/Completion.lean:170`), `TauCeti.HasMetricApproximationProperty` (`ApproximationProperty/Basic.lean:62`) and the proved Pietsch factorization (`AbsolutelySumming/Factorization.lean:143`). The five statements below elaborated at this head with only `sorry` warnings.

**Repair.** State these five, each with its README locator in its docstring:

```lean
theorem exists_vectorMeasure_of_strongDual {K : Type*} [TopologicalSpace K] [CompactSpace K]
    [T2Space K] [MeasurableSpace K] [BorelSpace K] (φ : StrongDual 𝕜 C(K, 𝕜)) :
    ∃ μ : VectorMeasure K 𝕜, μ.variation.Regular ∧
      (∀ f : C(K, 𝕜), φ f = ∫ᵛ x, f x ∂[ContinuousLinearMap.mul ℝ 𝕜; μ]) ∧
      ‖φ‖ = (μ.variation Set.univ).toReal

theorem dunford_pettis {X : Type*} [MeasurableSpace X] (μ : Measure X) [IsFiniteMeasure μ]
    (S : Set (Lp 𝕜 1 μ)) :
    IsCompact (closure (toWeakSpace 𝕜 (Lp 𝕜 1 μ) '' S)) ↔
      Bornology.IsBounded S ∧ UnifIntegrable (fun f : S ↦ ((f : Lp 𝕜 1 μ) : X → 𝕜)) 1 μ

theorem hasMetricApproximationProperty_of_reflexive [CompleteSpace E]
    (hE : Function.Surjective (NormedSpace.inclusionInDoubleDual 𝕜 E))
    (h : TauCeti.HasApproximationProperty 𝕜 E) : TauCeti.HasMetricApproximationProperty 𝕜 E

theorem hasApproximationProperty_iff_injective {E : Type u} [NormedAddCommGroup E]
    [NormedSpace 𝕜 E] [CompleteSpace E] :
    TauCeti.HasApproximationProperty 𝕜 E ↔
      ∀ (F : Type u) [NormedAddCommGroup F] [NormedSpace 𝕜 F] [CompleteSpace F],
        Function.Injective (TauCeti.CompletedProjectiveTensor.toCompletedInjectiveTensor 𝕜 F E)

theorem exists_john_contact {n : ℕ} (K : ConvexBody (EuclideanSpace ℝ (Fin n)))
    (hsymm : ∀ x ∈ K, -x ∈ K) (hB : Metric.closedBall (0 : EuclideanSpace ℝ (Fin n)) 1 ⊆ K)
    (hmax : ∀ T : EuclideanSpace ℝ (Fin n) ≃L[ℝ] EuclideanSpace ℝ (Fin n),
      T '' Metric.closedBall 0 1 ⊆ K → |LinearMap.det (T : EuclideanSpace ℝ (Fin n) →ₗ[ℝ] _)| ≤ 1) :
    ∃ (m : ℕ) (u : Fin m → EuclideanSpace ℝ (Fin n)) (c : Fin m → ℝ),
      (∀ i, ‖u i‖ = 1 ∧ u i ∈ frontier (K : Set _) ∧ 0 < c i) ∧
      (∀ x, ∑ i, c i • (⟪u i, x⟫_ℝ • u i) = x) ∧ ∑ i, c i = n
```

Then rewrite the docstring:

- Keep the LocalHaar bullet and the Enflo/Argyros–Haydon bullet.
- Say that the Pietsch factorization is proved at the pin.
- If the metric criterion `MAP(X) ↔ ‖Θ_X u‖=‖u‖π` stays unstated, name `Θ_X` as the missing map. The tensor norms are not missing.

## R03 (P2) — Kadec–Snobar is over `𝕜` in the README but over `ℝ` in Lean

**Location.** `README.md:1391–1393`: "every subspace of dimension at most `n` of a normed `𝕜`-space is the range of a projection of norm at most `√n`". `Suggested.lean:329`: `theorem kadec_snobar (F : Submodule ℝ E) [FiniteDimensional ℝ F]`.

**Witness.** The elaborated type carries `[NormedSpace ℝ E]`, so complex spaces such as `ℓ∞ⁿ` over `ℂ` are not covered. Yet README `:1384–1391` builds the complex John decomposition precisely for this case.

**Repair.** State `kadec_snobar` with `(F : Submodule 𝕜 E) [FiniteDimensional 𝕜 F]`, `P : E →L[𝕜] E` and the bound `‖P‖ ≤ Real.sqrt (Module.finrank 𝕜 F)`. This form elaborated at this head with only a `sorry` warning.

## R04 (P2) — The two-point family does not exclude type p>2 or cotype q<2 with large constants

**Location.** `README.md:1269–1270`: "no nonzero space has cotype q<2 or type p>2 (by the two-point family y,y)". `README.md:1284–1286`: "excluding cotype q<2 with constant 1 and type p>2 with any constant".

**Witness.** For `(y,y)`, `R₂=√2‖y‖` and `(Σ‖y_i‖⁴)^(1/4)=2^(1/4)‖y‖`.

- Type 4 with `C=2` needs `1.414≤2·1.189=2.378`. This is true, so type 4 is not refuted.
- Cotype 1 with `C=√2` needs `2‖y‖≤√2·√2‖y‖`. This holds with equality, so cotype 1 is not refuted either.

**Repair.** Use the `n`-fold repetition `(y,…,y)`, for which `R₂=√n‖y‖`:

- cotype `q<2` needs `n^(1/q)≤C√n`, which fails as `n→∞` for every fixed `C`;
- type `p>2` needs `√n≤C·n^(1/p)`, which fails in the same way.

Keep `(y,y)` only for what it shows: it excludes type `p>2` with `C<2^(1/2−1/p)` and cotype `q<2` with `C<2^(1/q−1/2)`, in particular `C=1`.

## R05 (P3) — The gate fails: two files outside this pull request's roadmap folders

**Location.** `Completed/ArithmeticDirichletSeries/README.md:331` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md:76–78` (three lines).

**Witness.** The worker's gate at `56715a5` reports `outside-folder=2 … FAIL`. My rerun lists 33 files. The brief's exclusion diff leaves exactly these two, with the same hunks as at `c07dda7`.

**Repair.** Either move the two hunks into a pull request of their own, or have the board register ArithmeticDirichletSeries and SymplecticGeometry as folders of this pull request, so that each gets its own review. No acceptance is possible while the gate fails.

## R06 (P3) — Eleven `Suggested.lean` theorems are already proved at the pinned Tau Ceti (padding)

**Location.** Six theorems close by one tactic: `Suggested.lean:50, 62, 75, 200, 283, 292`. Five more are short derivations from a pinned theorem: `:68, 97, 117, 246, 316`.

**Witness.** I re-ran the probe at this head on a scratch copy that imports the pinned modules. One tactic closes each of `eberlein_smulian`, `milman_pettis`, `bishop_phelps`, `integral_withDensityᵥ`, `grothendieck_real` and `grothendieck_complex`, taking the file from 25 to 19 `sorry`s. Lean also reports `hM` unused at `:203`.

**Repair.** Delete all eleven from `Suggested.lean`. The README keeps the statements and cites these declarations, and the module docstring says that they are proved at the pin.

| Declaration | Line | Pinned Tau Ceti declaration | File:line |
|---|---|---|---|
| `eberlein_smulian` | 50 | `TauCeti.isCompact_toWeakSpace_iff_isSeqCompact` | `WeakSpace/EberleinSmulian.lean:153` |
| `milman_pettis` | 62 | `TauCeti.surjective_inclusionInDoubleDual_of_uniformConvexSpace` | `Convex/Uniform/Basic.lean:147` |
| `krein_smulian` | 68 | `Convex.isClosed_iff_forall_isClosed_inter_closedBall` | `Dual/KreinSmulian.lean:272` |
| `bishop_phelps` | 75 | `TauCeti.dense_setOf_exists_norm_apply_eq_norm` | `Dual/BishopPhelps.lean:319` |
| `SchauderBasis.reflexive_iff` | 97 | `SchauderBasis.surjective_inclusionInDoubleDual_iff` | `Bases/Reflexive.lean:199` |
| `SchauderBasis.approximationProperty` | 117 | `b.hasBoundedApproximationProperty.hasApproximationProperty` | `Bases/Approximation.lean:64` |
| `integral_withDensityᵥ` | 200 | `MeasureTheory.VectorMeasure.integral_mul_withDensityᵥ` (no finiteness needed; a.e. bound) | `VectorMeasure/WithDensity.lean:155` |
| `pietsch_domination` | 246 | `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_isProbabilityMeasure` | `AbsolutelySumming/Pietsch.lean:329` |
| `grothendieck_real` | 283 | `Matrix.abs_sum_sum_mul_inner_le_eight_mul` | `Matrix/Grothendieck.lean:169` |
| `grothendieck_complex` | 292 | `Matrix.norm_sum_sum_mul_inner_le_sixteen_mul` | `Matrix/Grothendieck.lean:207` |
| `local_reflexivity` | 316 | `LinearIsometry.exists_continuousLinearMap_of_doubleDual` (over `𝕜`) | `Dual/LocalReflexivity.lean:228` |

## R07 (P3) — Private stand-ins for pinned definitions, and one unused definition

**Location.** `Suggested.lean:85, 90, 108, 223, 229, 235, 266`: `IsShrinking`, `IsBoundedlyComplete`, `HasApproximationProperty`, `weakNorm`, `IsAbsolutelySumming`, `DualBall` and `HasType`.

**Witness.**

- `TauCeti/Analysis/Normed/Module/Bases/Reflexive.lean:49,60` declares `SchauderBasis.IsShrinking` and `IsBoundedlyComplete`.
- `ApproximationProperty/Basic.lean:47` declares `TauCeti.HasApproximationProperty`.
- `grep HasType Suggested.lean` finds line 266 alone, so `HasType` is never used.

**Repair.** Delete the seven definitions; with R06, the theorems that used them go too. Restate the one remaining user on the native gauge `ContinuousLinearMap.summingENorm` (`AbsolutelySumming/Basic.lean:99`), importing `TauCeti.Analysis.Normed.Operator.AbsolutelySumming.Basic`:

```lean
theorem cotype2_summing_bound (C : ℝ) :
    ∃ K : ℝ, ∀ (Y : Type u) [NormedAddCommGroup Y] [NormedSpace ℝ Y], HasCotype Y 2 C →
      ∀ (n : ℕ) (U : EuclideanSpace ℝ (Fin n) →L[ℝ] Y),
        U.summingENorm 2 ≤ ENNReal.ofReal
          (K * Real.sqrt (rademacherSecondMoment fun i ↦ U (EuclideanSpace.single i 1)))
```

This form elaborated at this head with only a `sorry` warning. Keep `rademacherSecondMoment` and `HasCotype`, which have no counterpart at the pin.

## R08 (P3) — NoncommutativeIntegration §7.5 does not consume B6's type and cotype

**Location.** `README.md:45–47`: "B6 owns Rademacher type p and cotype q with their transport API; NoncommutativeIntegration §7.5 consumes them."

**Witness.** On main (`bbbde05`), NoncommutativeIntegration §7.5 (`README.md:1299–1317`) cites Pisier's survey, Definition 9.6, directly. Its "From TauCetiRoadmap.BanachSpaceTheory" contract (`:165–169`) lists B1–B2 only, and "B6" occurs nowhere in that README.

**Repair.** Drop the consumer clause. That roadmap is on main, so this pull request cannot make §7.5 cite B6.

## R09 (P3) — "PDE Lane A item1" does not exist

**Location.** `README.md:918`: "`‖u‖_1+‖u'‖_1` on PDE Lane A item1's weak W^(1,1) carrier".

**Witness.** The PDE roadmap on main (`bbbde05`; unchanged since `c58403c`) contains no "Lane" at all. Its interval Sobolev carrier is "### 1.1 Weak derivatives and Sobolev classes on intervals (A1)" (`PDE/README.md:677`).

**Repair.** Cite "PDE §1.1 (A1)", the pinned `TauCeti.W1p` at p=1.

## R10 (P3) — A target sentence sits inside a Check bullet

**Location.** `README.md:1286–1288`: "Construct the shared finite Gaussian model here, before its use in this argument and Grothendieck's inequality below; prove the required Banach-valued integrability and sign/Gaussian law comparisons."

**Witness.** This sentence is the tail of the third bullet of the B6 Checks list that starts at `:1276`. It assigns a construction rather than testing anything.

**Repair.** Move it after the Checks list, as its own paragraph ahead of "Prove Gaussian weak-2 domination" (`:1290`).

## R11 (P3) — README shape, missing `*Needs:*` lines and missing Checks

**Location.** The headings are `## Scope and conventions`, `## B1.` … `## B7.` and `## Sources and API alignment` (`README.md:9–1441`).

**Claim.** The README lacks "Exact supplier contracts", "How to read the build", per-layer "Examples" and "Dependencies", and "Downstream consumers". B1–B3, B4 before B4.C, B6 outside Cotype2, and B7 have no `*Needs:*` line.

**Witness.** `grep -c '^\*\*Checks' README.md` gives 4 (lines 829, 889, 1176, 1276). The `*Needs:*` lines are at 358, 509, 798, 839, 901, 1081, 1145, 1192 and 1315, none of them in B1–B3 or B7.

**Repair.**

- Add `## Exact supplier contracts`, with:
  - "From Mathlib";
  - "From Tau Ceti", holding the names in R01, R06 and R07 and the pinned results the README still plans: closed range `ContinuousLinearMap.isClosed_range_precomp_iff`, Goldstine `NormedSpace.closure_image_inclusionInDoubleDualWeak_closedBall`, `TauCeti.banachMazurDist`, `TauCeti.FinitelyRepresentable` and `TauCeti.absolutelySummingOperators`;
  - one subsection per roadmap: AmenableGroups Layer 7; OperatorIdeals OI-A01, OI-A25–OI-A28 and OI-B29–OI-B30; PDE §1.1; PseudodifferentialOperators P5.
- Add a `*Needs:*` line to each B1–B3 and B7 milestone.
- Give at least three Checks to each definition the roadmap still owns: M(K) with the variation norm, the nuclear-operator carrier, the integral endomorphism ideal I(X*), the finitely additive charges on L∞, and the Haar basis.

## Previous findings

- R01 — not repaired (R01 here): "B5 owns the generic scalar-measure integration, signed-part, density, regularity, uniqueness and bounded continuous-approximation layer (B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular, B5.ScalarUniqueness and B5.BoundedApprox)" (`README.md:49–52`), unchanged.
- R02 — not repaired (R02 here): "the projective and injective tensor norms are targets (the pinned `injectiveSeminorm` is not the classical `ε` norm)" (`Suggested.lean:24–26`), unchanged.
- R03 — not repaired (R03 here): `theorem kadec_snobar (F : Submodule ℝ E) [FiniteDimensional ℝ F]` (`Suggested.lean:329`) against "a normed `𝕜`-space" (`README.md:1392`).
- R04 — not repaired (R04 here): "no nonzero space has cotype q<2 or type p>2 (by the two-point family y,y)" (`README.md:1269–1270`), unchanged.
- R05 — not repaired (R05 here): the gate still reports `outside-folder=2` for `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`, with the same hunks.
- R06 — not repaired (R06 here): `theorem eberlein_smulian (K : Set E) : IsCompact (toWeakSpace 𝕜 E '' K) ↔ IsSeqCompact (toWeakSpace 𝕜 E '' K)` (`Suggested.lean:50`), still closed by one `exact`.
- R07 — not repaired (R07 here): `def IsShrinking (b : _root_.SchauderBasis 𝕜 E) : Prop` (`Suggested.lean:85`) and the unused `def HasType` (`:266`), unchanged.
- R08 — not repaired (R08 here): "B6 owns Rademacher type p and cotype q with their transport API; NoncommutativeIntegration §7.5 consumes them" (`README.md:45–47`). NoncommutativeIntegration on main still does not cite B6.
- R09 — not repaired (R09 here): "`‖u‖_1+‖u'‖_1` on PDE Lane A item1's weak W^(1,1) carrier" (`README.md:918`), unchanged.
- R10 — not repaired (R10 here): "Construct the shared finite Gaussian model here, before its use in this argument and Grothendieck's inequality below" (`README.md:1286–1287`), still inside the third Check bullet.
- R11 — not repaired (R11 here): the headings are still `## Scope and conventions`, `## B1.`…`## B7.`, `## Sources and API alignment`. There are still 4 `**Checks.**` blocks and no `*Needs:*` in B1–B3 or B7.

## Verified sound

**Change set.**

- `git diff --stat c07dda7 HEAD` lists only `TauCetiRoadmap/AlgebraicTopology/{README.md,Suggested.lean}` and `TauCetiRoadmap/BordismFormalGroups/{README.md,Suggested.lean}`.
- `grep BanachSpaceTheory` finds nothing in either folder or in the diff.
- `lake-manifest.json` is unchanged.
- No repair report exists for this folder, so no finding is settled as "not actionable".

**Gate and build.**

- Worker's gate: every count is 0 except `outside-folder=2` (R05), and the targeted build passes.
- My gate rerun gives the same counts, with `outside-folder=33`. The brief's exclusion diff reduces those 33 to the same two files (R05).
- `lake env lean TauCetiRoadmap/BanachSpaceTheory/Suggested.lean`: exit 0, 25 `declaration uses sorry` warnings and nothing else.

**Dependency check.** Output: `depcheck: 239 roadmaps, 2364 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

**Elaborated signatures.** I compared the 34 signatures in `signatures.md` with their README statements.

- Both "looks dropped `[NormedAddCommGroup E]`" leads (`exists_reflexive_not_hasApproximationProperty`, `exists_scalarPlusCompact`) elaborate as existential binders `∃ E x x_1, …`, not as lost section binders.
- The only generality mismatch is R03.

**Citations leads.** `citations.md` lists `SchauderBasis.reflexive_iff` (README 204) and `SchauderBasis.approximationProperty` (README 257) as found nowhere. Both are declared in this roadmap's `Suggested.lean:97,117`, so neither is a defect; R06 asks for their deletion.

**Probes run at this head**, in one scratch copy importing eight pinned Tau Ceti modules (exit 0, 26 `sorry` warnings and the `hM` lint only):

- the one-tactic closures of the six theorems (R06);
- the five R02 statements;
- `kadec_snobar` over `𝕜` (R03);
- `cotype2_summing_bound` on `summingENorm` (R07).

**Library declarations opened at the pinned Tau Ceti `2fd255d` (28 lines):**

- `MeasureTheory/VectorMeasure/Uniqueness.lean:115`
- `ScalarIntegral.lean:79,88`
- `WithDensity.lean:155`
- `Measure/Regular.lean:234`
- `VectorMeasure/Variation/Regular.lean:62`
- `ContinuousApproximation.lean:87,119`
- `EberleinSmulian.lean:153`
- `Convex/Uniform/Basic.lean:147`
- `KreinSmulian.lean:272`
- `BishopPhelps.lean:319`
- `Bases/Reflexive.lean:49,60,199`
- `Bases/Approximation.lean:64`
- `Pietsch.lean:329`
- `AbsolutelySumming/Basic.lean:99`
- `Factorization.lean:143`
- `Grothendieck.lean:169,207`
- `LocalReflexivity.lean:228`
- `TensorProduct/Completion.lean:170`
- `ApproximationProperty/Basic.lean:47,62`
- `Integral/RieszMarkovKakutani/Signed.lean:160,205,262`

**Cross-roadmap citations resolved (12).** Main is at `bbbde05`. Since `c58403c`, `git diff` shows no change in OperatorIdeals, AmenableGroups, PseudodifferentialOperators, BanachAlgebras, VonNeumannAlgebras, PDE or NoncommutativeIntegration, so the previous resolutions of these stand:

- OperatorIdeals OI-A01, OI-A25, OI-A28, OI-B29–OI-B30;
- AmenableGroups Layer 7;
- PseudodifferentialOperators P5;
- BanachAlgebras A8;
- VonNeumannAlgebras Layer 1.

Re-read this round:

- NoncommutativeIntegration §7.5 and its contract (`:1299`, `:165–169`; R08) and PDE §1.1 (`:677`; R09).
- At open heads:
  - UnboundedOperators §4.1, head now `d0d839e` (was `b46d79f`): "### 4.1 Deficiency functions on half-planes (UO-D01)" (`README.md:595–599`) consumes B5's Hilbert dimension and unitary classification, as do Scope `:13` and the contract `:152`;
  - IndexTheory Layer 1, head now `75046fc` (was `6a51fc7`): §1.6 (`README.md:488`), "Consume BanachSpaceTheory B5's Hilbert dimension and unitary classification";
  - SelfAdjointSpectralTheory's B5.* citations in this pull request (`:95–99`, `:425`, `:479–531`, `:699`, `:1311`; R01).
- `roadmaps grep` for the five B5.Scalar* ids finds only this pull request's BanachSpaceTheory and SelfAdjointSpectralTheory.

**Overlaps.** The overlaps tool reports no dropped ids, no other pull request changing this roadmap, and no revision-only ids. Its closest roadmaps are #1187 SelfAdjointSpectralTheory (R01), #1028, #1041, #1155 and #1027. None of these changed this roadmap's ownership since the previous review.

**Sources sample.** No sampled passage changed. I re-read the two cached extractions at their locators:

- `bdlhv08` lines 14607–14627 (Appendix C.5, printed pp. 383–384) has the locally Borel and locally null definitions, the locally-null L∞(G), and its identification with L¹(G)* by the bilinear pairing `∫ f ϕ`. This matches B5.LocalHaarDual's carrier and pairing (`README.md:1149–1155`), with no conjugation.
  - BdlHV's quotient is of locally measurable functions, the README's of Borel functions. The README's gluing step, a pointwise limsup of continuous functions pasted over clopen cosets, supplies a Borel representative for every functional, so the two quotients agree on the dual side.
- `pisier12gt` lines 1591–1598 (Definition 9.6, printed p. 31) has cotype 2 and type 2 by the L²(B) Rademacher norm. Lines 1604–1605 (printed p. 32) have the cotype-p variant. This matches B6.Cotype2's "Definition 9.6, for cotype 2, type 2 and the cotype-q variant" (`README.md:1265`).
- B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular, B5.ScalarUniqueness and B5.BoundedApprox carry no source locator (`README.md:946–1024`). I checked them against the pinned declarations that prove them (R01).
- The B6.Cotype2 absorption argument (`README.md:1300–1305`) was recomputed: `G₂≤t R₂+½G₂` gives `G₂≤2tR₂`, since `G₂` is finite in finite dimension.

**Remark on untouched text (no change requested).** NoncommutativeIntegration Layer 6 (main, `README.md:52–54`) proves a Kahane moment comparison for its random-sum norm, and B6 (`README.md:1271–1272`) proves the Banach-valued Kahane inequality. The noncommutative roadmap can cite B6 when it is next revised.

**Adversarial table.** No statement changed. Rows are carried from the previous report (`PRREVIEW-BanachSpaceTheory~7`, at `c07dda7`). Rows marked † were recomputed by hand or re-probed in Lean at this head. Here `R₂(y)=(E_ε‖Σε_i y_i‖²)^(1/2)`.

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| B5.ScalarIntegral reconstruction † | X={pt}, μ=(3+4i)δ; 𝕜=ℝ | `re μ(pt)=3`, `im μ(pt)=4`, `3+4i=μ(pt)`; `|re μ|=3≤|μ|=5`; over ℝ `im μ=0` | holds | R01 |
| B5.ScalarIntegral homogeneity | μ=z·δ, f=a | `I_μ(cf)=c·a·z=c·I_μ(f)` | holds | R01 |
| B5.ScalarDensity pairing † | ν=δ_pt, g=i, f=2 | `I_(ν.withDensityᵥ g)(f)=2i=∫f g dν`; a conjugate pairing gives `−2i` | holds, bilinear | R01, R06 |
| B5.AbsContRegular † | ν=2·1_[0,1/2]·Leb ≪ Leb on [0,1]; ν=∞·Leb | the first is finite and regular; the second has `ν{0}=0` but `ν U=∞` for every open U∋0 | finiteness needed, stated | R01 |
| B5.ScalarUniqueness † | μ=δ₀−δ₁ on {0,1}; Dieudonné ν vs δ_ω₁ on [0,ω₁] | `∫1_{0}dμ=1≠0`; equal integrals on every continuous f, yet `ν{ω₁}=0≠1` | regularity needed, stated | R01 |
| B5.BoundedApprox † | f=1_[0,1/2], M=1, ramp g_n of width 1/n | `∫|f−g_n|=1/(2n)→0`, `‖g_n‖≤1` | holds | R01 |
| B5.LocalHaarDual † | ℝ_d×ℝ, A=ℝ_d×{0} | `μ(A∩B)=0` for every finite-measure B; `μ(A)=inf_U Σ_x 2ε_x=∞`, global ess-norm 1 | local ≠ global, as stated | none |
| B6 cotype, c₀ | e_1…e_n | `n^(1/q)` vs `R₂=1` | no finite cotype | none |
| B6 cotype 2, ℓ¹ | e_1…e_n | `√n` vs `R₂=n` | cotype 2 with C=1; type p>1 fails | none |
| B6 two-point family † | (y,y), p=4, C=2; q=1, C=√2 | `1.414‖y‖` vs `2.378‖y‖`; `2‖y‖` vs `2‖y‖` | neither refuted | R04 |
| B6 n-fold family † | (y,…,y) | `R₂=√n‖y‖` vs `n^(1/p)‖y‖`, `n^(1/q)‖y‖` | excludes both for every C | R04 repair |
| `cotype2_summing_bound` † | Y=0; Y=ℓ₂ⁿ, U=id | `0=0`; `π₂(id)=√n=R₂(e_i)`; summingENorm form elaborates | K≥1, consistent | R07 |
| `eberlein_smulian` † | ℓ¹, K={e_n}; K=∅ | not weakly compact and not weakly seq. compact; ∅ both | holds; one `exact` | R06 |
| `james` | c₀, f=(2^{−n}) | `‖f‖=1`, not attained; c₀ not reflexive | holds | none |
| `krein_smulian` | c₀₀⊂ℓ¹=c₀* | weak*-dense, not closed; its balls are not closed | holds | R06 |
| `integral_withDensityᵥ` † | ν=δ_pt, g=i, f=b, M=‖b‖ | `b·i=b·i`; Lean reports `hM` unused | holds; one `exact` | R06 |
| `grothendieck_real` † | a=½[[1,1],[1,−1]] | scalar sup 1; Hilbert value `√2≤8` | holds; one `simpa` | R06 |
| `exists_complexificationStrongDualEquiv` | i-linearity | `e⟨−h,g⟩⟨x,y⟩=i·e⟨g,h⟩⟨x,y⟩` | complex-linear | none |
| `hilbertBasis_lift_mk_eq` | ℂ vs ℂ²; ℓ²(ℕ) vs L²[0,1] | `1≠2`; `ℵ₀=ℵ₀` | holds | none |
| `exists_lpInftyDualEquiv` | μ=∞·δ_pt | `L¹=0`, `‖1‖_∞=1` | σ-finite needed, stated | none |
| `banach_stone` | K=L={0,1}, Tf(y)=−f(1−y) | h=−1, φ=swap | holds | none |
| `kadec_snobar` † | F=0; F=E=ℓ∞ⁿ; ℂ-space | `0≤0`; `1≤√n`; the ℂ case is outside the ℝ signature | holds, too narrow | R03 |
| `dvoretzky_finite` | k=0, 1 | trivial; N=1 | holds | none |
| Riesz C(K,𝕜)* (statable) † | φ(f)=f(0)−f(1) on {0,1} | μ=δ₀−δ₁, `‖φ‖=2=|μ|(K)`; elaborates | holds | R02 |
| Dunford–Pettis (statable) † | μ=δ_pt | L¹=𝕜; bounded ⇔ relatively weakly compact, UI holds; elaborates | iff holds | R02 |

## Not verifiable

- **Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 12.18**, cited for B5.LocalHaarDual. It is paywalled and recorded as uncertified (`hewittross63`). The same duality, with the same locally-null convention, is in `bdlhv08` Appendix C.5, p. 384 (lines 14611–14627).
- **Pisier, *Factorization of Linear Operators and Geometry of Banach Spaces* (CBMS 60), §3: Lemma 3.5, Proposition 3.7, Lemma 3.8, Theorem 3.9, pp. 33–37**, cited for B6.Cotype2. It is behind the AMS paywall, so the page and theorem numbers are unchecked. The absorption argument was recomputed (above).

## Source issues

- none
