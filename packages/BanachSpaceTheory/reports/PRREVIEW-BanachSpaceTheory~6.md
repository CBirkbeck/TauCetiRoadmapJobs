# Review of BanachSpaceTheory (pull request #1854 at c9c60d0)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/BanachSpaceTheory/README.md` and `TauCetiRoadmap/BanachSpaceTheory/Suggested.lean`. The pull request's change to this folder moves the generic scalar-measure layer from SelfAdjointSpectralTheory into B5 (B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular, B5.ScalarUniqueness, B5.BoundedApprox) and adds `integral_withDensityᵥ` to `Suggested.lean`.

The main defect is that every one of those five targets is already proved, under the README's own names, in the pinned Tau Ceti. So are eleven of the theorems in `Suggested.lean`.

There are 12 findings, 5 of them blocking (P2).

## R01 (P2) — B5's new scalar-measure layer restates proved Tau Ceti declarations as targets

**Location.** `TauCetiRoadmap/BanachSpaceTheory/README.md:49–54` and `:946–1024`: "B5 owns the generic scalar-measure integration, signed-part, density, regularity, uniqueness and bounded continuous-approximation layer (B5.ScalarIntegral, …); SelfAdjointSpectralTheory consumes it".

**Claim.** All five bold targets are proved at the pinned Tau Ceti. The README gives them a second owner, plans them again, and routes SelfAdjointSpectralTheory through BanachSpaceTheory for material the library already supplies. None of the five carries a source locator either.

**Witness.** `MeasureTheory.VectorMeasure.eq_zero_of_integral_eq_zero_on_continuousMap` (`TauCeti/MeasureTheory/VectorMeasure/Uniqueness.lean:115`) is B5.ScalarUniqueness word for word. The maps the README asks to "Name" (`scalarMeasureRealPart`, `scalarMeasureOfReal`) are already declared at `TauCeti/MeasureTheory/VectorMeasure/ScalarIntegral.lean:79,88`.

**Repair.** Delete the five bold paragraphs and say in Scope that this layer is in Tau Ceti. Cite the pinned declarations in a "From Tau Ceti" contract, using this map:

- **B5.ScalarIntegral** → `ScalarIntegral.lean`:
  - homogeneity: `integral_const_mul` (67), `integral_smul_vectorMeasure_mul` (73);
  - the parts: `scalarMeasureRealPart` / `scalarMeasureImagPart` / `scalarMeasureOfReal` (79/84/88) and `scalarMeasureOfReal_realPart_add_I_smul_imagPart` (119);
  - variation bounds: `variation_scalarMeasureRealPart_le`, `variation_scalarMeasureImagPart_le`, `variation_scalarMeasureOfReal` (139–153);
  - integral comparisons: `re_integral_ofReal` / `im_integral_ofReal` (190/199), `integral_ofReal_scalarMeasureOfReal` (208), `scalarMeasureOfReal_withDensityᵥ` (219);
  - signed and Jordan splits: `integral_mul_toSignedMeasure_sub` (241), `integral_mul_eq_integral_posPart_sub_integral_negPart` (252).
- **B5.ScalarDensity** → `WithDensity.lean`: `integral_mul_withDensityᵥ` (155), `withDensityᵥ_one_apply` (167), `Measure.variation_withDensityᵥ_one` (175), `VectorMeasure.integral_mul_withDensityᵥ_one` (183), `integral_withDensityᵥ_congr_ae` (83).
- **B5.AbsContRegular** → `MeasureTheory.Measure.AbsolutelyContinuous.regular` (`TauCeti/MeasureTheory/Measure/Regular.lean:234`); `regular_variation_add` / `regular_variation_smul` / `regular_variation_sub` (`VectorMeasure/Variation/Regular.lean:62/81/88`).
- **B5.ScalarUniqueness** → `Uniqueness.lean:115,122`, with the `C_c` forms at :81 and :100.
- **B5.BoundedApprox** → `MeasureTheory.exists_continuous_norm_le_forall_integral_norm_sub_le` and `MeasureTheory.exists_seq_continuous_norm_le_tendsto_integral_norm_sub` (`TauCeti/MeasureTheory/Function/ContinuousApproximation.lean:87,119`). These already handle finite families of measures, which covers SelfAdjointSpectralTheory's use.

Then:

- Replace the B5.* references in the M(K) and density paragraphs (`:1036`, `:1046–1048`, `:1056`, `:1060–1063`, `:1083`, `:1114–1122`) by these names.
- The M(K) paragraph's construction "Λ⁺(f)=sup{Λ(g):0≤g≤f} … Apply RMK to those parts" is `TauCeti.RealRMK.posPart` / `negPart` and `TauCeti.RealRMK.integral_rieszMeasure_posPart_sub_integral_rieszMeasure_negPart` (`TauCeti/MeasureTheory/Integral/RieszMarkovKakutani/Signed.lean:160,205,262`). Cite it rather than plan it.
- SelfAdjointSpectralTheory's citations of B5.* (its README `:95–99`, `:425`, `:478–512`, `:698`, `:1310`) repoint to the same names in that folder. The loop stays cut, because neither roadmap then cites the other for this layer.

## R02 (P3) — Eleven `Suggested.lean` theorems are already proved at the pinned Tau Ceti (padding)

**Location.** `Suggested.lean:50, 62, 75, 200, 283, 292` (each closed by one tactic) and `:68, 97, 117, 246, 316` (short derivations from a pinned theorem).

**Witness.** In a scratch copy, `exact TauCeti.isCompact_toWeakSpace_iff_isSeqCompact` closes `eberlein_smulian`. Lines 62, 75, 200, 283 and 292 also close with one `exact` or `simpa using`. Line 68 needs three lines and line 316 two.

**Repair.** Delete all eleven from `Suggested.lean`. The README keeps the statements and cites these declarations; the module docstring says they are proved at the pin.

| Declaration | Line | Pinned Tau Ceti declaration | File:line |
|---|---|---|---|
| `eberlein_smulian` | 50 | `TauCeti.isCompact_toWeakSpace_iff_isSeqCompact`; relative form `isCompact_closure_toWeakSpace_iff` | `Analysis/Normed/Module/WeakSpace/EberleinSmulian.lean:153`, `:137` |
| `milman_pettis` | 62 | `TauCeti.surjective_inclusionInDoubleDual_of_uniformConvexSpace` | `Analysis/Convex/Uniform/Basic.lean:147` |
| `krein_smulian` | 68 | `Convex.isClosed_iff_forall_isClosed_inter_closedBall`; subspace form `Submodule.isClosed_iff_isClosed_inter_closedBall_zero_one` | `Analysis/Normed/Module/Dual/KreinSmulian.lean:272`, `:305` |
| `bishop_phelps` | 75 | `TauCeti.dense_setOf_exists_norm_apply_eq_norm` | `Analysis/Normed/Module/Dual/BishopPhelps.lean:319` |
| `SchauderBasis.reflexive_iff` | 97 | `SchauderBasis.surjective_inclusionInDoubleDual_iff` | `Analysis/Normed/Module/Bases/Reflexive.lean:199` |
| `SchauderBasis.approximationProperty` | 117 | `b.hasBoundedApproximationProperty.hasApproximationProperty` | `Analysis/Normed/Module/Bases/Approximation.lean:64` |
| `integral_withDensityᵥ` | 200 | `MeasureTheory.VectorMeasure.integral_mul_withDensityᵥ` (more general: no finite measure, an a.e. bound); the hypothesis `hM` is unused | `MeasureTheory/VectorMeasure/WithDensity.lean:155` |
| `pietsch_domination` | 246 | `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_isProbabilityMeasure` | `Analysis/Normed/Operator/AbsolutelySumming/Pietsch.lean:329` |
| `grothendieck_real` | 283 | `Matrix.abs_sum_sum_mul_inner_le_eight_mul` | `Analysis/Matrix/Grothendieck.lean:169` |
| `grothendieck_complex` | 292 | `Matrix.norm_sum_sum_mul_inner_le_sixteen_mul` | `Analysis/Matrix/Grothendieck.lean:207` |
| `local_reflexivity` | 316 | `LinearIsometry.exists_continuousLinearMap_of_doubleDual` (over `𝕜`, no completeness, every `ε>0`) | `Analysis/Normed/Module/Dual/LocalReflexivity.lean:228` |

## R03 (P3) — Private stand-ins for pinned definitions, and one unused definition

**Location.** `Suggested.lean:85, 90, 108, 223, 229, 235, 266` (`IsShrinking`, `IsBoundedlyComplete`, `HasApproximationProperty`, `weakNorm`, `IsAbsolutelySumming`, `DualBall`, `HasType`).

**Claim.** The first six restate Tau Ceti definitions that exist at the pin. The repository README's Prototyping rule says an implemented target is prototyped against its implementation, not through a private stand-in. `HasType` appears in no theorem.

**Witness.** In the scratch probe:

- `IsShrinking b ↔ b.IsShrinking` closes by `exact b.isShrinking_iff.symm`.
- `HasApproximationProperty 𝕜 E ↔ TauCeti.HasApproximationProperty 𝕜 E` closes by one `simp only`.
- `HasType` occurs only at its own definition.

**Repair.** Delete the seven definitions; with R02, the theorems that used them go too. Restate the one remaining user on the native gauge `ContinuousLinearMap.summingENorm` (`TauCeti/Analysis/Normed/Operator/AbsolutelySumming/Basic.lean:99`), importing `TauCeti.Analysis.Normed.Operator.AbsolutelySumming.Basic`:

```lean
theorem cotype2_summing_bound (C : ℝ) :
    ∃ K : ℝ, ∀ (Y : Type u) [NormedAddCommGroup Y] [NormedSpace ℝ Y], HasCotype Y 2 C →
      ∀ (n : ℕ) (U : EuclideanSpace ℝ (Fin n) →L[ℝ] Y),
        U.summingENorm 2 ≤ ENNReal.ofReal
          (K * Real.sqrt (rademacherSecondMoment fun i ↦ U (EuclideanSpace.single i 1)))
```

This elaborates at the pins, with `sorry` as the only warning. Keep `rademacherSecondMoment` and `HasCotype`, which have no counterpart at the pin.

## R04 (P2) — The docstring calls six headlines unstatable; all are statable at the pins

**Location.** `Suggested.lean:24–33`: "the projective and injective tensor norms are targets", "the normed space of finite regular scalar Borel measures … is a target carrier", "needs the domination measure as data", "ellipsoids and volume of convex bodies are B7 targets".

**Claim.** The carriers these bullets call missing are present at the pins, or the theorems need no new carrier.

- Tau Ceti has the completed tensor products: `TauCeti.CompletedProjectiveTensor`, `CompletedInjectiveTensor` and `toCompletedInjectiveTensor` (`Analysis/Normed/Module/TensorProduct/Completion.lean:76,81,170`).
- It has integral bilinear forms (`TauCeti.IntegralBilinearForm`, `TensorProduct/IntegralBilinearForm.lean`).
- It has Grothendieck's compact-operator form of AP (`TauCeti.hasApproximationProperty_iff_forall_isCompactOperator`, `ApproximationProperty/CompactOperator.lean:178`).
- It has the Pietsch factorization, proved: `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_eq_comp_codRestrict_topologicalClosure`, `AbsolutelySumming/Factorization.lean:143`.

**Witness.** A scratch file with the five statements below, each with `sorry`, elaborates at the pins with only `sorry` warnings. It also states Kadec–Snobar over `𝕜` (R05).

**Repair.** State these five, each with its README locator in the docstring:

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

The third statement is B4.0's assigned theorem, and it needs no tensor product at all. Then rewrite the docstring:

- Keep the LocalHaar bullet and the Enflo/Argyros–Haydon bullet.
- Say the Pietsch factorization is proved at the pin.
- If the metric criterion `MAP(X) ↔ ‖Θ_X u‖=‖u‖π` stays unstated, name `Θ_X` as the missing map; the tensor norms are not missing.

## R05 (P2) — Kadec–Snobar is over `𝕜` in the README and over `ℝ` in Lean

**Location.** `README.md:1391–1393`: "every subspace of dimension at most `n` of a normed `𝕜`-space is the range of a projection of norm at most `√n`". `Suggested.lean:329`: `theorem kadec_snobar (F : Submodule ℝ E)`.

**Witness.** The elaborated type has `[NormedSpace ℝ E]`, so complex spaces such as `ℓ∞ⁿ` over `ℂ` are not covered. README `:1384–1391` builds the complex John decomposition precisely for this case.

**Repair.** State `kadec_snobar` with `{𝕜} [RCLike 𝕜] [NormedSpace 𝕜 E] (F : Submodule 𝕜 E) [FiniteDimensional 𝕜 F]` and the bound `‖P‖ ≤ Real.sqrt (Module.finrank 𝕜 F)`, with `P : E →L[𝕜] E`. This elaborates at the pins.

`local_reflexivity` has the same mismatch: it is over `ℝ` and adds `[CompleteSpace E]` and `ε < 1`, neither of which is in the README. Deleting it (R02) resolves this, since the pinned theorem is over `𝕜`.

## R06 (P2) — Hilbert dimension has a second owner in OperatorTheory/UnboundedOperators

**Location.** `README.md:42–45`: "B5 owns Hilbert dimension … the unbounded-operator roadmap (OperatorTheory/UnboundedOperators §4.1) and the index-theory roadmap (IndexTheory Layer 1) consume it".

**Witness.** At the head `a075503` of #1027, `OperatorTheory/UnboundedOperators/README.md:419` says to prove `nonempty_linearIsometryEquiv_iff_lift_mk_eq`. Its `Suggested.lean:55` declares it as `TauCetiRoadmap.UnboundedOperators.nonempty_linearIsometryEquiv_iff_lift_mk_eq`.

**Repair.** B5 stays the owner: it is on main, ahead of the new roadmap. Record the overlap on #1027 so that its §4.1 cites "BanachSpaceTheory B5" and drops its own statement. In this README, name only IndexTheory Layer 1 as a consumer: its §1.6 (I1.6) says "Consume BanachSpaceTheory B5's Hilbert dimension" at the #1077 head, `README.md:463`. Add UnboundedOperators once its §4.1 cites B5.

## R07 (P2) — The two-point family does not exclude type p>2 or cotype q<2 with large constants

**Location.** `README.md:1269–1270`: "no nonzero space has cotype q<2 or type p>2 (by the two-point family y,y)". `README.md:1284–1286`: "excluding cotype q<2 with constant 1 and type p>2 with any constant".

**Witness.** For `(y,y)`, `R₂=√2‖y‖` and `(Σ‖y_i‖⁴)^(1/4)=2^(1/4)‖y‖`. Type 4 with `C=2` needs `√2≤2·2^(1/4)≈2.38`, which is true. So `(y,y)` refutes neither type 4 with `C=2` nor cotype 1 with `C=√2`. The inequality was checked in Lean.

**Repair.** Use the `n`-fold repetition `(y,…,y)`. `E(Σε_i)²=n` gives `R₂=√n‖y‖`, against `n^(1/q)‖y‖` for cotype and `n^(1/p)‖y‖` for type. With `C` fixed, cotype `q<2` needs `n^(1/q)≤C√n` and type `p>2` needs `√n≤C n^(1/p)`; both fail as `n→∞`. Keep `(y,y)` only for its true content: it excludes type `p>2` with `C<2^(1/2−1/p)` and cotype `q<2` with `C<2^(1/q−1/2)`, in particular `C=1`.

## R08 (P3) — The gate fails: two files outside this pull request's roadmap folders

**Location.** `Completed/ArithmeticDirichletSeries/README.md` (one line) and `TauCetiRoadmap/SymplecticGeometry/README.md` (three lines).

**Witness.** The worker's gate reports `outside-folder=2 … FAIL`. `git diff --stat origin/main...HEAD`, excluding the pull request's seventeen listed folders, shows exactly these two files.

**Repair.** Do one of the following:

- move these two hunks into a pull request of their own; or
- have the board register ArithmeticDirichletSeries and SymplecticGeometry as folders of this pull request, so that each gets its own review.

No acceptance is possible while the gate fails.

## R09 (P3) — NoncommutativeIntegration §7.5 does not consume B6's type and cotype

**Location.** `README.md:45–47`: "B6 owns Rademacher type p and cotype q with their transport API; NoncommutativeIntegration §7.5 consumes them."

**Witness.** At the head `10a5614` of #864, §7.5 (`NoncommutativeIntegration/README.md:1299–1317`) cites Pisier's survey, Definition 9.6, directly. Its "From TauCetiRoadmap.BanachSpaceTheory" contract (`:165–169`) lists only B1–B2.

**Repair.** Drop the consumer clause, and record on #864 that §7.5 should cite B6 for type and cotype.

## R10 (P3) — "PDE Lane A item1" does not exist

**Location.** `README.md:917–918`: "`‖u‖_1+‖u'‖_1` on PDE Lane A item1's weak W^(1,1) carrier".

**Witness.** The PDE roadmap on main has no "Lane". The interval Sobolev carrier is §1.1 "(A1)" (`PDE/README.md:677`), built on the pinned `TauCeti.W1p`.

**Repair.** Cite "PDE §1.1 (A1), the pinned `TauCeti.W1p` at p=1".

## R11 (P3) — A target sentence sits inside a Check bullet

**Location.** `README.md:1286–1288`: "Construct the shared finite Gaussian model here, before its use in this argument and Grothendieck's inequality below; prove the required Banach-valued integrability and sign/Gaussian law comparisons."

**Witness.** This is the tail of the third Check bullet of B6.Cotype2. It assigns a construction; it does not test anything.

**Repair.** Move it after the Checks list, as its own paragraph ahead of "Prove Gaussian weak-2 domination".

## R12 (P3) — README shape, missing `*Needs:*` lines and Checks

**Location.** The headings are `## Scope and conventions`, `## B1.`…`## B7.` and `## Sources and API alignment`.

**Claim.** The README lacks "Exact supplier contracts", "How to read the build", per-layer "Examples" and "Dependencies", and "Downstream consumers". B1–B3, B6 apart from Cotype2, and B7 have no `*Needs:*` line. Only four Checks blocks exist.

**Witness.** `grep -c '^\*\*Checks' README.md` gives 4 (at lines 829, 889, 1176 and 1276). The first `*Needs:*` line is at 358, in B4.C.

**Repair.**

- Add `## Exact supplier contracts`, with:
  - "From Mathlib";
  - "From Tau Ceti", holding the names in R01–R03 and the other pinned results the README still plans as targets: closed range `ContinuousLinearMap.isClosed_range_precomp_iff`, Goldstine `NormedSpace.closure_image_inclusionInDoubleDualWeak_closedBall`, `TauCeti.banachMazurDist`, `TauCeti.FinitelyRepresentable`, `TauCeti.absolutelySummingOperators`;
  - one subsection per roadmap: AmenableGroups Layer 7 item 1; OperatorIdeals OI-A01, OI-A25–OI-A28, OI-B29–OI-B30; PDE §1.1; PseudodifferentialOperators P5.
- Add a `*Needs:*` line to each B1–B3 and B7 milestone.
- Give at least three Checks to each definition the roadmap still owns after R01–R03: M(K) with the variation norm, the nuclear-operator carrier, the integral endomorphism ideal I(X*), the finitely additive charges on L∞, and the Haar basis.

## Verified sound

**Gate and build.**

- Worker gate: every check is 0 except `outside-folder=2` (R08); `build=0`.
- `lake env lean` on `Suggested.lean` gives 25 `declaration uses sorry` warnings and nothing else.
- Lean form: one `import Mathlib` plus `TauCeti.Analysis.Normed.Module.Complexification`, which exists at the pin. No `set_option`, no `lemma`, no sorry'd data.
- The four `local instance … := inferInstance` lines in B7 are needed. Without them, `Submodule ℝ (StrongDual ℝ (StrongDual ℝ E))` fails to synthesize `AddCommGroup ↥F`, as checked in the probe.

**Dependency check.** Output: `depcheck: 240 roadmaps, 2441 edges, 0 problem(s)`. No UPWARD or CYCLE line. Every supplier BanachSpaceTheory cites is on main.

**Elaborated signatures.** All 34 elaborated signatures were compared with their README statements. The two "looks dropped `[NormedAddCommGroup E]`" leads, at `exists_reflexive_not_hasApproximationProperty` and `exists_scalarPlusCompact`, are existential binders `∃ (E : Type) (_ : NormedAddCommGroup E) …` and not lost section binders. No `def` lost a binder its statement needs. Generality mismatches are R05.

**One-tactic probe.** A scratch copy importing the 10 built Tau Ceti modules:

- one `exact` or `simpa using` closes 6 of the 25 sorried theorems: lines 50, 62, 75, 200, 283, 292;
- two to three lines close 2 more: 68 and 316;
- with native definitions, three more close by one `exact`: lines 97 and 117, and line 246 is the pinned Pietsch theorem;
- the other 14 (James, Enflo, Argyros–Haydon, the complexified dual, the three Hilbert-dimension statements, the two Lp dualities, Banach–Stone, `cotype2_summing_bound`, Kadec–Snobar and both Dvoretzky statements) have no counterpart at either pin (searched by object), so no one-tactic proof exists.

**Library declarations opened at the pins (Tau Ceti, 23 files).**

- `EberleinSmulian.lean:137,153`
- `KreinSmulian.lean:272,305`
- `LocalReflexivity.lean:228,298,320`
- `BishopPhelps.lean:319`
- `Uniform/Basic.lean:147`
- `Bases/Reflexive.lean:49,60,199`
- `Bases/Approximation.lean:59,64`
- `ApproximationProperty/Basic.lean:47,62`
- `ApproximationProperty/CompactOperator.lean:178`
- `TensorProduct/Completion.lean:76,81,170`
- `AbsolutelySumming/Basic.lean:99`
- `Pietsch.lean:329`
- `Factorization.lean:143`
- `Matrix/Grothendieck.lean:169,207`
- `WithDensity.lean:105,155`
- `ScalarIntegral.lean:67–252`
- `Uniqueness.lean:81–122`
- `Measure/Regular.lean:234`
- `Variation/Regular.lean:62–88`
- `ContinuousApproximation.lean:68–119`
- `RieszMarkovKakutani/Signed.lean:160–272`
- `L1Space/Dual.lean:102`: L¹–L∞ duality only for finite `μ`, so the σ-finite `exists_lpInftyDualEquiv` is new.
- `Lp/Duality.lean:431`: `toDual` is an isometry, not an equivalence, so `exists_lpDualEquiv` is new.

**Library searches with no hit.** No James theorem, Banach–Stone, Hilbert-dimension cardinal, type/cotype, Kadec–Snobar or Dvoretzky declaration exists at either pin. Those headlines are correctly kept.

**Cross-roadmap citations resolved, 12.**

- AmenableGroups Layer 7 item 1 (main, `README.md:438`).
- OperatorIdeals OI-A01, OI-A25–OI-A28, OI-B29–OI-B30 (main, `:125`, `:172–179`, `:349–350`).
- PseudodifferentialOperators P5 (main, §5.4 `:1337`).
- BanachAlgebras A1–A8 (main, `:181`).
- VonNeumannAlgebras V1 (main, Layer 1 `:392`).
- IndexTheory Layer 1, §1.6 (#1077, `:463`).
- SelfAdjointSpectralTheory's B5 consumption (this pull request, `:95–99`).
- UnboundedOperators §4.1 (R06), NoncommutativeIntegration §7.5 (R09) and PDE "Lane A" (R10) do not resolve as cited.

**Overlaps.** The overlaps tool lists no dropped ids, no other pull request changing this roadmap, and no revision-only ids. Each item was re-checked.

**Sources sample.** Results for the seven sampled targets:

1. **B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular, B5.ScalarUniqueness, B5.BoundedApprox.** No locator is given, so each statement was verified mathematically and against the pinned declaration that proves it (R01). The density pairing is bilinear without conjugation, matching `WithDensity.lean:155`.
2. **B5.LocalHaarDual.** `bdlhv08`, Appendix C.5, printed pp. 383–384 (`bdlhv08` lines 14607–14627), defines "locally Borel", "locally null" and L∞(G) modulo locally null sets. It identifies L∞(G) with L¹(G)* by the bilinear pairing `∫ f ϕ`, as the README says.
3. **B6.Cotype2.** `pisier12gt`, Definition 9.6, printed p. 31 (`pisier12gt` lines 1591–1598), defines cotype 2 and type 2 by second moments. The cotype-p variant is on printed p. 32 (lines 1604–1605). The README's definitions match these, with `C>0`.

**Adversarial table** (values computed; `R₂(y)=(E_ε‖Σε_i y_i‖²)^(1/2)`):

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| B5.ScalarIntegral reconstruction | X={pt}, μ=z·δ, z∈ℂ; 𝕜=ℝ | `re μ(pt)+i·im μ(pt)=Re z+i Im z=z`; over ℝ `RCLike.I=0`, `im μ=0`, `μ=re μ` | holds | R01 (cite pin) |
| B5.ScalarIntegral homogeneity | X={pt}, μ=z·δ, f=a | `I_μ(cf)=c·a·z=c·I_μ(f)`; `|re μ|=|Re z|δ≤|z|δ=|μ|` | holds | R01 |
| B5.ScalarDensity pairing | X={pt}, ν=aδ, g=i, f=b | `I=b·(a·i)`; `∫fg dν=a·b·i`; conjugate pairing would give `−a·b·i` | holds, convention pinned | R01 |
| B5.ScalarDensity g=1 | ν=Lebesgue on [0,1], B=[0,1/2] | value `ν.real B=1/2`; variation ν | holds | R01 |
| B5.AbsContRegular | ν=2·1_[0,1/2]·Leb ≪ Leb; ν=∞·Leb | first regular; second has `ν{0}=0` but every open U∋0 has `ν U=∞`, so not outer regular | finiteness of ν needed, and stated | R01 |
| B5.ScalarUniqueness | K={0,1}, μ=δ₀−δ₁, f=1_{0}; Dieudonné ν vs δ_ω₁ on [0,ω₁] | `∫f dμ=1≠0`; on [0,ω₁] equal integrals on C(K) but `ν≠δ_ω₁`, ν not regular | regularity needed, and stated | R01 |
| B5.BoundedApprox | f=1_[0,1/2], Leb, ramp of width 1/n | error `1/(2n)`, bound 1 kept; clipping error ≤ 2× | holds | R01 |
| B5.LocalHaarDual, uncountable discrete G | counting measure | finite-measure sets are finite, local bound = sup, ℓ∞(G)=ℓ¹(G)* | holds | none |
| B5.LocalHaarDual, ℝ_d×ℝ | A=ℝ_d×{0} | `μ(A)=Σ_x 2ε_x=∞`, so global ess-norm of 1_A is 1; finite-measure B meets countably many cosets, so `μ(A∩B)=0` | global→local not injective, as stated | none |
| B5.LocalHaarDual, σ-finite | countable exhaustion | local null = global null | holds | none |
| B6 cotype, c₀ | e_1…e_n | `(Σ‖e_i‖^q)^(1/q)=n^(1/q)` vs `R₂=1` | no finite cotype, as stated | none |
| B6 cotype 2, ℓ¹ | e_1…e_n | `√n` vs `R₂=n` | cotype 2 with C=1; type p>1 fails (`n≤Cn^(1/p)`) | none |
| B6 two-point family | (y,y), p=4, C=2 | `R₂=√2‖y‖` vs `2·2^(1/4)‖y‖≈2.38‖y‖` | type 4 with C=2 **not** refuted | R07 |
| B6 n-fold family | (y,…,y) | `R₂=√n‖y‖` vs `n^(1/p)`, `n^(1/q)` | excludes type p>2 and cotype q<2 for every C | R07 repair |
| `cotype2_summing_bound` | Y=0; Y=ℓ₂ⁿ, U=id | Y=0: both sides 0; Hilbert: `π₂(id)=√n`, `R₂(e_i)=√n`, ratio 1 | K≥1 forced, consistent | R03 (restate on native gauge) |
| Cotype2 complex constant | realified basis (e_i, ie_i) | real weak-2 ≤ complex weak-2; `R₂^ℝ≤2R₂` | `π₂≤4Ct(C)R₂`, as stated | none |
| `eberlein_smulian` | ℓ¹, K={e_n}; K=∅ | Schur: no weakly convergent subsequence, not weakly compact; ∅ both true | iff holds | R02 |
| `james` | c₀, f=(2^{−n})∈ℓ¹ | `‖f‖=1`, sup over the c₀ ball needs all |x_n|=1: not attained; c₀ not reflexive | iff holds | none |
| `krein_smulian` | C=c₀₀⊂ℓ¹=c₀* | weak*-dense, not closed; balls also not closed | iff holds | R02 |
| `bishop_phelps` | E=c₀ | attaining f = finitely supported ℓ¹, dense in ℓ¹ | holds | R02 |
| `SchauderBasis.reflexive_iff` | c₀ basis; ℓ¹ basis | c₀: shrinking, a=(1,1,…) bounded sums not convergent; ℓ¹: span e_n* = c₀₀ not dense in ℓ∞ | both non-reflexive | R02, R03 |
| `exists_complexificationStrongDualEquiv` | i-linearity | `e⟨−h,g⟩⟨x,y⟩=−h(x)−g(y)+i(g(x)−h(y))=i·e⟨g,h⟩⟨x,y⟩` | formula complex-linear | none |
| `hilbertBasis_lift_mk_eq` / `nonempty_linearIsometryEquiv_iff_lift_mk_eq` | ℂ vs ℂ²; ℓ²(ℕ) vs L²[0,1]; zero space | 1≠2, no unitary; ℵ₀=ℵ₀; empty basis | holds | R06 (ownership) |
| `exists_lpInftyDualEquiv` | μ=∞·δ_pt (not σ-finite) | `L¹=0` but `‖1‖_∞=1` | σ-finite needed, and stated | none |
| `exists_lpDualEquiv` | μ=∞·δ_pt, p=2 | `L²=0=(L²)*` | holds for arbitrary μ | none |
| `banach_stone` | K=L={0,1}, Tf(y)=−f(1−y) | h=−1, φ=swap; K=L=∅ vacuous | holds | none |
| `grothendieck_real` | a=½[[1,1],[1,−1]] | scalar sup 1; Hilbert value `√2` with u=e₁,e₂, v=(e₁±e₂)/√2 | `√2≤8` | R02 |
| `kadec_snobar` | F=0; F=E=ℓ∞ⁿ | P=0, `0≤0`; P=id, `1≤√n` | holds; ℂ case missing in Lean | R05 |
| `local_reflexivity` | E reflexive | T=J⁻¹ on F, exact | holds; ℝ-only in Lean | R02, R05 |
| `dvoretzky_finite` | k=1; k=0 | N=1, normalized vector exact; k=0 trivial | holds | none |
| Riesz C(K,𝕜)* (statable) | K=∅; K={0,1}, φ(f)=f(0)−f(1) | φ=0, μ=0; μ=δ₀−δ₁, `‖φ‖=2=|μ|(K)` | holds | R04 |
| Dunford–Pettis (statable) | μ=δ_pt | L¹=𝕜, bounded ⇒ relatively compact; sets with μ<1 are null, so UI holds | iff holds | R04 |

## Not verifiable

- **Hewitt–Ross, *Abstract Harmonic Analysis I*, Theorem 12.18**, cited for B5.LocalHaarDual. It is behind Springer's paywall; the sources service records it as uncertified. The duality it is cited for is stated, with the same locally-null convention and bilinear pairing, in `bdlhv08` Appendix C.5, p. 384, which refers to Bourbaki's *Intégration*, Chapter 5, §5, No. 8.
- **Pisier, *Factorization of Linear Operators and Geometry of Banach Spaces* (CBMS 60), §3: Lemma 3.5, Proposition 3.7, Lemma 3.8, Theorem 3.9, pp. 33–37**, cited for B6.Cotype2. It is behind the AMS paywall (`pubs.ams.org/ebooks/cbms/060`). The page and theorem numbers are unchecked. The argument itself was recomputed step by step; see the Cotype2 rows above.

## Source issues

- none
