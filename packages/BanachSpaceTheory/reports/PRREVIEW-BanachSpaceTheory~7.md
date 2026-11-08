# Review of BanachSpaceTheory (pull request #1854 at c07dda7)

**Verdict:** needs changes

This is an incremental re-review. `TauCetiRoadmap/BanachSpaceTheory/` has 0 changed lines since `c9c60d0`; the only commit since then, `c07dda7`, touches `TauCetiRoadmap/CharacteristicClasses/` alone, which neither cites nor is cited by this roadmap. The pins (`lake-manifest.json`, `lean-toolchain`) are unchanged.

Eleven of the twelve previous findings are carried forward unrepaired, renumbered below by severity. Each witness was re-checked at this head and the pins. The twelfth, the Hilbert-dimension ownership finding, was resolved on the other side: UnboundedOperators now consumes B5. There are 11 findings, 4 of them blocking (P2).

## R01 (P2) — B5's scalar-measure layer restates proved Tau Ceti declarations as targets

Carried from the previous report's R01.

**Location.** `README.md:49–54`: "B5 owns the generic scalar-measure integration, signed-part, density, regularity, uniqueness and bounded continuous-approximation layer (B5.ScalarIntegral, …); SelfAdjointSpectralTheory consumes it". The targets are at `:946–1024`.

**Claim.** All five bold targets are proved at the pinned Tau Ceti, and none of them carries a source locator. The README gives this layer a second owner. It also routes SelfAdjointSpectralTheory through BanachSpaceTheory for material the library already supplies.

**Witness.** B5.ScalarUniqueness is `MeasureTheory.VectorMeasure.eq_zero_of_integral_eq_zero_on_continuousMap` (`TauCeti/MeasureTheory/VectorMeasure/Uniqueness.lean:115`). The maps B5.ScalarIntegral asks to name already exist as `scalarMeasureRealPart` and `scalarMeasureOfReal` (`ScalarIntegral.lean:79,88`).

**Repair.** Delete the five bold paragraphs and say in Scope that this layer is in Tau Ceti. Cite the pinned declarations in a "From Tau Ceti" contract:

- **B5.ScalarIntegral** is in `MeasureTheory/VectorMeasure/ScalarIntegral.lean`:
  - homogeneity: `integral_const_mul` (67), `integral_smul_vectorMeasure_mul` (73);
  - the parts: `scalarMeasureRealPart`, `scalarMeasureImagPart`, `scalarMeasureOfReal` (79, 84, 88) and `scalarMeasureOfReal_realPart_add_I_smul_imagPart` (119);
  - the variation bounds (139–153);
  - the integral comparisons: `re_integral_ofReal`, `im_integral_ofReal`, `integral_ofReal_scalarMeasureOfReal`, `scalarMeasureOfReal_withDensityᵥ` (190–219);
  - the Jordan split: `integral_mul_eq_integral_posPart_sub_integral_negPart` (252).
- **B5.ScalarDensity** is in `WithDensity.lean`: `integral_mul_withDensityᵥ` (155), `withDensityᵥ_one_apply` (167), `Measure.variation_withDensityᵥ_one` (175), `integral_withDensityᵥ_congr_ae` (83).
- **B5.AbsContRegular** is `MeasureTheory.Measure.AbsolutelyContinuous.regular` (`Measure/Regular.lean:234`), with `regular_variation_add`, `_smul` and `_sub` (`VectorMeasure/Variation/Regular.lean:62–88`).
- **B5.ScalarUniqueness** is `Uniqueness.lean:115,122`; the `C_c` forms are at :81 and :100.
- **B5.BoundedApprox** is `exists_continuous_norm_le_forall_integral_norm_sub_le` and `exists_seq_continuous_norm_le_tendsto_integral_norm_sub` (`MeasureTheory/Function/ContinuousApproximation.lean:87,119`). These handle finite families of measures, as SelfAdjointSpectralTheory needs.

Then:

- Repoint the B5.* references in the M(K) and density paragraphs (`:1010–1013`, `:1036`, `:1046–1048`, `:1056`, `:1060–1063`, `:1083`, `:1114–1122`) to these names.
- In the M(K) construction "Λ⁺(f)=sup{Λ(g):0≤g≤f}", cite `TauCeti.RealRMK.posPart`, `TauCeti.RealRMK.negPart` and `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` (`RieszMarkovKakutani/Signed.lean:160,205,262`).
- SelfAdjointSpectralTheory, in this same pull request, cites B5.* at `README.md:95–99, 425, 479–531, 699, 1311`. Repoint those citations to the same Tau Ceti names. Neither roadmap then cites the other for this layer, so the loop stays cut.

## R02 (P2) — The docstring calls six headlines unstatable; they are statable at the pins

Carried from the previous report's R04.

**Location.** `Suggested.lean:24–33`: "the projective and injective tensor norms are targets", "the normed space of finite regular scalar Borel measures … is a target carrier", "needs the domination measure as data", "ellipsoids and volume of convex bodies are B7 targets".

**Claim.** The carriers these bullets call missing are present at the pinned Tau Ceti, or the theorem needs no new carrier.

**Witness.** The pinned Tau Ceti has:

- `TauCeti.CompletedProjectiveTensor.toCompletedInjectiveTensor` (`TensorProduct/Completion.lean:170`);
- `TauCeti.HasMetricApproximationProperty` (`ApproximationProperty/Basic.lean:62`);
- the proved Pietsch factorization `summingENorm_le_ofReal_iff_exists_eq_comp_codRestrict_topologicalClosure` (`AbsolutelySumming/Factorization.lean:143`).

The five statements below elaborate today with only `sorry` warnings.

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
- If the metric criterion `MAP(X) ↔ ‖Θ_X u‖=‖u‖π` stays unstated, name `Θ_X` as the missing map; the tensor norms are not missing.

## R03 (P2) — Kadec–Snobar is over `𝕜` in the README and over `ℝ` in Lean

Carried from the previous report's R05.

**Location.** `README.md:1391–1393`: "every subspace of dimension at most `n` of a normed `𝕜`-space is the range of a projection of norm at most `√n`". `Suggested.lean:329`: `theorem kadec_snobar (F : Submodule ℝ E) [FiniteDimensional ℝ F]`.

**Witness.** The elaborated type carries `[NormedSpace ℝ E]`, so complex spaces such as `ℓ∞ⁿ` over `ℂ` are not covered. Yet README `:1384–1391` builds the complex John decomposition precisely for this case.

**Repair.** State `kadec_snobar` with `(F : Submodule 𝕜 E) [FiniteDimensional 𝕜 F]`, `P : E →L[𝕜] E` and the bound `‖P‖ ≤ Real.sqrt (Module.finrank 𝕜 F)`. This elaborated today at the pins with only a `sorry` warning.

## R04 (P2) — The two-point family does not exclude type p>2 or cotype q<2 with large constants

Carried from the previous report's R07.

**Location.** `README.md:1269–1270`: "no nonzero space has cotype q<2 or type p>2 (by the two-point family y,y)". `README.md:1284–1286`: "excluding cotype q<2 with constant 1 and type p>2 with any constant".

**Witness.** For `(y,y)`, `R₂=√2‖y‖` and `(Σ‖y_i‖⁴)^(1/4)=2^(1/4)‖y‖`. Type 4 with `C=2` needs `1.414≤2·1.189=2.378`, which is true, so it is not refuted. Cotype 1 with `C=√2` needs `2‖y‖≤√2·√2‖y‖`, which holds with equality.

**Repair.** Use the `n`-fold repetition `(y,…,y)`, for which `R₂=√n‖y‖`:

- cotype `q<2` needs `n^(1/q)≤C√n`, which fails as `n→∞` for every fixed `C`;
- type `p>2` needs `√n≤C·n^(1/p)`, which fails likewise.

Keep `(y,y)` only for what it does show: it excludes type `p>2` with `C<2^(1/2−1/p)` and cotype `q<2` with `C<2^(1/q−1/2)`, in particular `C=1`.

## R05 (P3) — The gate fails: two files outside this pull request's roadmap folders

Carried from the previous report's R08.

**Location.** `Completed/ArithmeticDirichletSeries/README.md:331` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md:76–78` (three lines).

**Witness.** The worker's gate at `c07dda7` reports `outside-folder=2 … FAIL`. Rerunning it here lists 33 files; 31 are in the pull request's seventeen listed folders, and the other two are exactly these files, with hunks unchanged.

**Repair.** Do one of the following:

- move the two hunks into a pull request of their own; or
- have the board register ArithmeticDirichletSeries and SymplecticGeometry as folders of this pull request, so that each gets its own review.

No acceptance is possible while the gate fails.

## R06 (P3) — Eleven `Suggested.lean` theorems are already proved at the pinned Tau Ceti (padding)

Carried from the previous report's R02.

**Location.** `Suggested.lean:50, 62, 75, 200, 283, 292` close by one tactic. Lines `:68, 97, 117, 246, 316` are short derivations from a pinned theorem.

**Witness.** I re-ran the probe today on a scratch copy importing the pinned modules. One tactic each closes `eberlein_smulian`, `milman_pettis`, `bishop_phelps`, `integral_withDensityᵥ`, `grothendieck_real` and `grothendieck_complex`, taking the file from 25 to 19 `sorry`s. Lean also reports `hM` unused.

**Repair.** Delete all eleven from `Suggested.lean`. The README keeps the statements and cites these declarations, and the module docstring says they are proved at the pin.

| Declaration | Line | Pinned Tau Ceti declaration | File:line |
|---|---|---|---|
| `eberlein_smulian` | 50 | `TauCeti.isCompact_toWeakSpace_iff_isSeqCompact` | `WeakSpace/EberleinSmulian.lean:153` |
| `milman_pettis` | 62 | `TauCeti.surjective_inclusionInDoubleDual_of_uniformConvexSpace` | `Convex/Uniform/Basic.lean:147` |
| `krein_smulian` | 68 | `Convex.isClosed_iff_forall_isClosed_inter_closedBall` | `Dual/KreinSmulian.lean:272` |
| `bishop_phelps` | 75 | `TauCeti.dense_setOf_exists_norm_apply_eq_norm` | `Dual/BishopPhelps.lean:319` |
| `SchauderBasis.reflexive_iff` | 97 | `SchauderBasis.surjective_inclusionInDoubleDual_iff` | `Bases/Reflexive.lean:199` |
| `SchauderBasis.approximationProperty` | 117 | `b.hasBoundedApproximationProperty.hasApproximationProperty` | `Bases/Approximation.lean:64` |
| `integral_withDensityᵥ` | 200 | `MeasureTheory.VectorMeasure.integral_mul_withDensityᵥ` (no finite measure needed; a.e. bound) | `VectorMeasure/WithDensity.lean:155` |
| `pietsch_domination` | 246 | `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_isProbabilityMeasure` | `AbsolutelySumming/Pietsch.lean:329` |
| `grothendieck_real` | 283 | `Matrix.abs_sum_sum_mul_inner_le_eight_mul` | `Matrix/Grothendieck.lean:169` |
| `grothendieck_complex` | 292 | `Matrix.norm_sum_sum_mul_inner_le_sixteen_mul` | `Matrix/Grothendieck.lean:207` |
| `local_reflexivity` | 316 | `LinearIsometry.exists_continuousLinearMap_of_doubleDual` (over `𝕜`) | `Dual/LocalReflexivity.lean:228` |

## R07 (P3) — Private stand-ins for pinned definitions, and one unused definition

Carried from the previous report's R03.

**Location.** `Suggested.lean:85, 90, 108, 223, 229, 235, 266`: `IsShrinking`, `IsBoundedlyComplete`, `HasApproximationProperty`, `weakNorm`, `IsAbsolutelySumming`, `DualBall` and `HasType`.

**Witness.**

- `TauCeti/Analysis/Normed/Module/Bases/Reflexive.lean:49,60` declares `SchauderBasis.IsShrinking` and `IsBoundedlyComplete`.
- `ApproximationProperty/Basic.lean:47` declares `TauCeti.HasApproximationProperty`.
- `HasType` occurs only at its own definition (`grep` finds line 266 alone).

**Repair.** Delete the seven definitions; with R06, the theorems that used them go too. Restate the one remaining user on the native gauge `ContinuousLinearMap.summingENorm` (`AbsolutelySumming/Basic.lean:99`), importing `TauCeti.Analysis.Normed.Operator.AbsolutelySumming.Basic`:

```lean
theorem cotype2_summing_bound (C : ℝ) :
    ∃ K : ℝ, ∀ (Y : Type u) [NormedAddCommGroup Y] [NormedSpace ℝ Y], HasCotype Y 2 C →
      ∀ (n : ℕ) (U : EuclideanSpace ℝ (Fin n) →L[ℝ] Y),
        U.summingENorm 2 ≤ ENNReal.ofReal
          (K * Real.sqrt (rademacherSecondMoment fun i ↦ U (EuclideanSpace.single i 1)))
```

This elaborated today with only a `sorry` warning. Keep `rademacherSecondMoment` and `HasCotype`, which have no counterpart at the pin.

## R08 (P3) — NoncommutativeIntegration §7.5 does not consume B6's type and cotype

Carried from the previous report's R09.

**Location.** `README.md:45–47`: "B6 owns Rademacher type p and cotype q with their transport API; NoncommutativeIntegration §7.5 consumes them."

**Witness.** NoncommutativeIntegration is now on main. Its §7.5 (`NoncommutativeIntegration/README.md:1299–1317`) cites Pisier's survey, Definition 9.6, directly. Its "From TauCetiRoadmap.BanachSpaceTheory" contract (`:165–169`) lists only B1–B2.

**Repair.** Drop the consumer clause. Since the roadmap is on main, this pull request cannot make §7.5 cite B6.

## R09 (P3) — "PDE Lane A item1" does not exist

Carried from the previous report's R10.

**Location.** `README.md:918`: "`‖u‖_1+‖u'‖_1` on PDE Lane A item1's weak W^(1,1) carrier".

**Witness.** The PDE roadmap on main (`c58403c`) contains no "Lane". Its interval Sobolev carrier is "### 1.1 Weak derivatives and Sobolev classes on intervals (A1)" (`PDE/README.md:677`).

**Repair.** Cite "PDE §1.1 (A1), the pinned `TauCeti.W1p` at p=1".

## R10 (P3) — A target sentence sits inside a Check bullet

Carried from the previous report's R11.

**Location.** `README.md:1286–1288`: "Construct the shared finite Gaussian model here, before its use in this argument and Grothendieck's inequality below; prove the required Banach-valued integrability and sign/Gaussian law comparisons."

**Witness.** This is the tail of the third bullet of the B6 Checks list at `:1276`. It assigns a construction; it does not test anything.

**Repair.** Move it after the Checks list, as its own paragraph ahead of "Prove Gaussian weak-2 domination" (`:1290`).

## R11 (P3) — README shape, missing `*Needs:*` lines and Checks

Carried from the previous report's R12.

**Location.** The headings are `## Scope and conventions`, `## B1.` … `## B7.` and `## Sources and API alignment` (`README.md:9–1441`).

**Claim.** The README lacks "Exact supplier contracts", "How to read the build", per-layer "Examples" and "Dependencies", and "Downstream consumers". B1–B3, B4 before B4.C, B6 outside Cotype2, and B7 have no `*Needs:*` line.

**Witness.** `grep -c '^\*\*Checks' README.md` gives 4 (lines 829, 889, 1176, 1276). The `*Needs:*` lines are at 358, 509, 798, 839, 901, 1081, 1145, 1192 and 1315, none of them in B1–B3 or B7.

**Repair.**

- Add `## Exact supplier contracts`, with:
  - "From Mathlib";
  - "From Tau Ceti", holding the names in R01, R06 and R07 and the pinned results the README still plans (closed range `ContinuousLinearMap.isClosed_range_precomp_iff`, Goldstine `NormedSpace.closure_image_inclusionInDoubleDualWeak_closedBall`, `TauCeti.banachMazurDist`, `TauCeti.FinitelyRepresentable`, `TauCeti.absolutelySummingOperators`);
  - one subsection per roadmap: AmenableGroups Layer 7; OperatorIdeals OI-A01, OI-A25–OI-A28, OI-B29–OI-B30; PDE §1.1; PseudodifferentialOperators P5.
- Add a `*Needs:*` line to each B1–B3 and B7 milestone.
- Give at least three Checks to each definition the roadmap still owns: M(K) with the variation norm, the nuclear-operator carrier, the integral endomorphism ideal I(X*), the finitely additive charges on L∞, and the Haar basis.

## Previous findings

- R01 — not repaired (R01 here): "B5 owns the generic scalar-measure integration, signed-part, density, regularity, uniqueness and bounded continuous-approximation layer (B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular, B5.ScalarUniqueness and B5.BoundedApprox)" (`README.md:49–52`), unchanged.
- R02 — not repaired (R06 here): `theorem eberlein_smulian (K : Set E) : IsCompact (toWeakSpace 𝕜 E '' K) ↔ IsSeqCompact (toWeakSpace 𝕜 E '' K)` (`Suggested.lean:50`), still closed by one `exact`.
- R03 — not repaired (R07 here): `def IsShrinking (b : _root_.SchauderBasis 𝕜 E) : Prop` (`Suggested.lean:85`) and `def HasType` (`:266`), unchanged.
- R04 — not repaired (R02 here): "the projective and injective tensor norms are targets (the pinned `injectiveSeminorm` is not the classical `ε` norm)" (`Suggested.lean:24–26`), unchanged.
- R05 — not repaired (R03 here): `theorem kadec_snobar (F : Submodule ℝ E) [FiniteDimensional ℝ F]` (`Suggested.lean:329`) against "a normed `𝕜`-space" (`README.md:1392`).
- R06 — repaired, on the other side: "the unbounded-operator roadmap (OperatorTheory/UnboundedOperators §4.1) and the index-theory roadmap (IndexTheory Layer 1) consume it" (`README.md:44–45`). This is now accurate: at the UnboundedOperators head `b46d79f`, §4.1 consumes B5 (`README.md:448`) and `Suggested.lean:17–18` no longer restates the theorem.
- R07 — not repaired (R04 here): "no nonzero space has cotype q<2 or type p>2 (by the two-point family y,y)" (`README.md:1269–1270`), unchanged.
- R08 — not repaired (R05 here): the gate still reports `outside-folder=2`, `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`, with the same hunks.
- R09 — not repaired (R08 here): "B6 owns Rademacher type p and cotype q with their transport API; NoncommutativeIntegration §7.5 consumes them" (`README.md:45–47`). NoncommutativeIntegration, now on main, still does not cite B6.
- R10 — not repaired (R09 here): "`‖u‖_1+‖u'‖_1` on PDE Lane A item1's weak W^(1,1) carrier" (`README.md:918`), unchanged.
- R11 — not repaired (R10 here): "Construct the shared finite Gaussian model here, before its use in this argument and Grothendieck's inequality below" (`README.md:1286–1287`), still inside the third Check bullet.
- R12 — not repaired (R11 here): the headings are still `## Scope and conventions`, `## B1.`…`## B7.`, `## Sources and API alignment`. There are still 4 `**Checks.**` blocks and no `*Needs:*` in B1–B3 or B7.

## Verified sound

**Change set.**

- `git diff --stat c9c60d0 HEAD` lists only `TauCetiRoadmap/CharacteristicClasses/README.md` and `Suggested.lean`.
- `grep` finds no citation between CharacteristicClasses and BanachSpaceTheory in either direction.
- `lake-manifest.json` is unchanged; the pins are Tau Ceti `2fd255d` and Mathlib `1b1ccf4`.

**Gate and build.**

- Worker's gate: every count is 0 except `outside-folder=2` (R05), and the targeted build passes.
- My gate run gives the same counts. Its 33 outside-folder entries reduce to the same two files once the seventeen listed folders are excluded.
- `lake env lean TauCetiRoadmap/BanachSpaceTheory/Suggested.lean`: exit 0, 25 `declaration uses sorry` warnings, nothing else.

**Dependency check.** Output: `depcheck: 238 roadmaps, 2352 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.

**Elaborated signatures.** I compared the 34 signatures in `signatures.md` with their README statements. Both "looks dropped `[NormedAddCommGroup E]`" leads (`exists_reflexive_not_hasApproximationProperty`, `exists_scalarPlusCompact`) elaborate as existential binders `∃ E x x_1, …`, not lost section binders. The only generality mismatch is R03.

**Probes run at this head**, on scratch copies:

- one-tactic closures of six theorems (R06);
- the five R02 statements, `kadec_snobar` over `𝕜` (R03) and `cotype2_summing_bound` on `summingENorm` (R07), all with only `sorry` warnings.

**Library declarations opened at the pinned Tau Ceti (21 lines):**

- `Uniqueness.lean:115`
- `ScalarIntegral.lean:79,88`
- `WithDensity.lean:155`
- `Measure/Regular.lean:234`
- `ContinuousApproximation.lean:87,119`
- `EberleinSmulian.lean:153`
- `Uniform/Basic.lean:147`
- `KreinSmulian.lean:272`
- `BishopPhelps.lean:319`
- `Bases/Reflexive.lean:49,54,60,199`
- `Bases/Approximation.lean:64`
- `Pietsch.lean:329`
- `Grothendieck.lean:169,207`
- `LocalReflexivity.lean:228`
- `AbsolutelySumming/Basic.lean:99`
- `TensorProduct/Completion.lean:170`
- `ApproximationProperty/Basic.lean:47,62`
- `Factorization.lean:143`
- `RieszMarkovKakutani/Signed.lean:262`

**Cross-roadmap citations resolved again (12).** Main is at `c58403c`.

- On main:
  - OperatorIdeals OI-A01, OI-A25, OI-A28, OI-B29–OI-B30 (`:125`, `:172–179`, `:349–350`);
  - AmenableGroups Layer 7 (`:415`);
  - PseudodifferentialOperators P5 / §5.4 (`:927`, `:1337`);
  - BanachAlgebras A8 (`:155–158`);
  - VonNeumannAlgebras Layer 1 (`:392`);
  - NoncommutativeIntegration §7.5 (`:1299`; R08).
- At open heads:
  - IndexTheory Layer 1 at `6a51fc7`: `README.md:463` "Consume BanachSpaceTheory B5's Hilbert dimension";
  - UnboundedOperators §4.1 at `b46d79f` (`:448`);
  - SelfAdjointSpectralTheory's B5.* citations in this pull request (`:95–99`; R01).
- Unresolved: PDE "Lane A" (R09).

**Overlaps.** The overlaps tool reports no dropped ids, no other pull request changing this roadmap, and no revision-only ids. LocallyConvexDuality (#1782), new since the previous review, consumes B4's injective norm by name (`README.md:41`, `:119`). It leaves Eberlein–Šmulian out of scope (`:56`), so no object has two owners.

**Sources sample.** No sampled passage changed, so the previous review's verification stands. I re-read the two cited extractions at their locators:

- `bdlhv08` lines 14607–14627 (Appendix C.5, printed pp. 383–384) has the locally-null L∞(G) with the bilinear pairing `∫ f ϕ` (B5.LocalHaarDual).
- `pisier12gt` lines 1591–1598 (Definition 9.6, printed p. 31) has cotype 2 and type 2 by second moments (B6.Cotype2).
- B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular, B5.ScalarUniqueness and B5.BoundedApprox carry no locator. They are verified against the pinned declarations that prove them (R01).

**Remark on untouched text (no change requested).** NoncommutativeIntegration Layer 6 (main, `README.md:52–54`) proves a Kahane moment comparison for its random-sum norm, and B6 (`README.md:1271–1272`) proves the Banach-valued Kahane inequality. The noncommutative one can cite B6 when that roadmap is next revised.

**Adversarial table.** No statement changed, so these rows are carried from the previous review at `c9c60d0`. Rows marked † were recomputed or re-probed at this head. `R₂(y)=(E_ε‖Σε_i y_i‖²)^(1/2)`.

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| B5.ScalarIntegral reconstruction | X={pt}, μ=z·δ; 𝕜=ℝ | `re μ(pt)+i·im μ(pt)=z`; over ℝ `im μ=0`, `μ=re μ` | holds | R01 |
| B5.ScalarIntegral homogeneity | μ=z·δ, f=a | `I_μ(cf)=c·a·z=c·I_μ(f)`; `|re μ|=|Re z|δ≤|z|δ` | holds | R01 |
| B5.ScalarDensity pairing | ν=aδ, g=i, f=b | `I=a·b·i`; a conjugate pairing would give `−a·b·i` | holds, bilinear | R01 |
| B5.AbsContRegular | ν=2·1_[0,1/2]·Leb; ν=∞·Leb | the first is regular; the second has `ν{0}=0` but `ν U=∞` for every open U∋0 | finiteness needed, stated | R01 |
| B5.ScalarUniqueness | μ=δ₀−δ₁ on {0,1}; Dieudonné ν vs δ_ω₁ | `∫1_{0}dμ=1≠0`; equal integrals on C([0,ω₁]) but `ν≠δ_ω₁` | regularity needed, stated | R01 |
| B5.BoundedApprox | f=1_[0,1/2], ramp of width 1/n | error `1/(2n)`, bound 1 kept | holds | R01 |
| B5.LocalHaarDual | ℝ_d×ℝ, A=ℝ_d×{0} | `μ(A)=∞`, global ess-norm 1; every finite-measure B has `μ(A∩B)=0` | local ≠ global, as stated | none |
| B6 cotype, c₀ | e_1…e_n | `n^(1/q)` vs `R₂=1` | no finite cotype | none |
| B6 cotype 2, ℓ¹ | e_1…e_n | `√n` vs `R₂=n` | cotype 2 with C=1, type p>1 fails | none |
| B6 two-point family † | (y,y), p=4, C=2; q=1, C=√2 | `1.414‖y‖` vs `2.378‖y‖`; `2‖y‖` vs `2‖y‖` | neither refuted | R04 |
| B6 n-fold family † | (y,…,y) | `R₂=√n‖y‖` vs `n^(1/p)‖y‖`, `n^(1/q)‖y‖` | excludes both for every C | R04 repair |
| `cotype2_summing_bound` | Y=0; Y=ℓ₂ⁿ, U=id | 0=0; `π₂(id)=√n=R₂(e_i)` | K≥1, consistent | R07 |
| `eberlein_smulian` † | ℓ¹, K={e_n}; K=∅ | not weakly compact and not weakly seq. compact; ∅ both | holds; one `exact` | R06 |
| `james` | c₀, f=(2^{−n}) | `‖f‖=1`, not attained; c₀ not reflexive | holds | none |
| `krein_smulian` | c₀₀⊂ℓ¹=c₀* | weak*-dense, not closed; balls not closed | holds | R06 |
| `integral_withDensityᵥ` † | ν=δ_pt, g=i, f=b, M=‖b‖ | `b·i=b·i`; Lean reports `hM` unused | holds; one `exact` | R06 |
| `grothendieck_real` † | a=½[[1,1],[1,−1]] | scalar sup 1; Hilbert value `√2≤8` | holds; one `simpa` | R06 |
| `exists_complexificationStrongDualEquiv` | i-linearity | `e⟨−h,g⟩⟨x,y⟩=i·e⟨g,h⟩⟨x,y⟩` | complex-linear | none |
| `hilbertBasis_lift_mk_eq` | ℂ vs ℂ²; ℓ²(ℕ) vs L²[0,1] | 1≠2; ℵ₀=ℵ₀ | holds | none |
| `exists_lpInftyDualEquiv` | μ=∞·δ_pt | `L¹=0`, `‖1‖_∞=1` | σ-finite needed, stated | none |
| `banach_stone` | K=L={0,1}, Tf(y)=−f(1−y) | h=−1, φ=swap | holds | none |
| `kadec_snobar` † | F=0; F=E=ℓ∞ⁿ; ℂ-space | `0≤0`; `1≤√n`; the ℂ case is not covered by the ℝ signature | holds, too narrow | R03 |
| `dvoretzky_finite` | k=0, 1 | trivial; N=1 | holds | none |
| Riesz C(K,𝕜)* (statable) † | φ(f)=f(0)−f(1) on {0,1} | μ=δ₀−δ₁, `‖φ‖=2=|μ|(K)`; elaborates | holds | R02 |
| Dunford–Pettis (statable) † | μ=δ_pt | L¹=𝕜, bounded ⇒ rel. compact, UI holds; elaborates | iff holds | R02 |

## Not verifiable

- **Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 12.18**, cited for B5.LocalHaarDual. It is paywalled and recorded as uncertified (`hewittross63`). The same duality, with the same locally-null convention, is in `bdlhv08` Appendix C.5, p. 384 (lines 14611–14627).
- **Pisier, *Factorization of Linear Operators and Geometry of Banach Spaces* (CBMS 60), §3: Lemma 3.5, Proposition 3.7, Lemma 3.8, Theorem 3.9, pp. 33–37**, cited for B6.Cotype2. It is behind the AMS paywall, so the page and theorem numbers are unchecked; the argument was recomputed in the previous review.

## Source issues

- none
