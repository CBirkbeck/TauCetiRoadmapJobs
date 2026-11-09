# Review of BanachSpaceTheory (pull request #1854 at 81fee5f)

**Verdict:** needs changes

This is a full review of `TauCetiRoadmap/BanachSpaceTheory/` at `81fee5f`. The pins are Mathlib `1b1ccf4` and Tau Ceti `2fd255d`. This pull request changes the B5 scalar-measure layer of the folder (the paragraphs B5.ScalarIntegral to B5.BoundedApprox) and adds `integral_withDensityᵥ` to `Suggested.lean`. The rest of the folder is unchanged from main and was reviewed as well.

## R01 (P2) — The B5 scalar-measure layer moved in here is already proved in the pinned Tau Ceti

**Location.** `TauCetiRoadmap/BanachSpaceTheory/README.md:49–54`, "B5 owns the generic scalar-measure integration, signed-part, density, regularity, uniqueness and bounded continuous-approximation layer … SelfAdjointSpectralTheory consumes it". The four paragraphs at lines 946–1015 restate that layer, and lines 961–963 say "Name these maps `scalarMeasureRealPart` and `scalarMeasureImagPart`".

**Claim.** B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular and B5.ScalarUniqueness are written as new targets owned by this roadmap. The pinned Tau Ceti already states and proves all four, under the very names the README asks for. So the ownership sentence is false at the pin, and the backticked names at 962–964 are claimed as this roadmap's own although `Suggested.lean` does not declare them. There is also a second owner: at the head of the open pin-bump pull request #1187, which also revises SelfAdjointSpectralTheory, SA-B81 is still SA's target (`TauCetiRoadmap/OperatorTheory/SelfAdjointSpectralTheory/README.md:605` at that head).

**Witness.** Tau Ceti `TauCeti/MeasureTheory/VectorMeasure/ScalarIntegral.lean:79,84,88,119` declares `MeasureTheory.VectorMeasure.scalarMeasureRealPart`, `scalarMeasureImagPart`, `scalarMeasureOfReal` and the reconstruction. `WithDensity.lean:155` proves `integral_mul_withDensityᵥ`, and `Uniqueness.lean:115,122` proves uniqueness on `C(X, 𝕜)`.

**Repair.**
- Delete the paragraphs B5.ScalarIntegral, B5.ScalarDensity, B5.AbsContRegular and B5.ScalarUniqueness.
- In a `From Tau Ceti` supplier contract (see R10), cite:
  - `TauCeti/MeasureTheory/VectorMeasure/ScalarIntegral.lean`: `integral_const_mul` (:67), `integral_smul_vectorMeasure_mul` (:73), `scalarMeasureRealPart` (:79), `scalarMeasureImagPart` (:84), `scalarMeasureOfReal` (:88), `scalarMeasureOfReal_realPart_add_I_smul_imagPart` (:119), `variation_scalarMeasureRealPart_le` (:139), `variation_scalarMeasureImagPart_le` (:146), `variation_scalarMeasureOfReal` (:153), `re_integral_ofReal` (:190), `im_integral_ofReal` (:199), `integral_ofReal_scalarMeasureOfReal` (:208), `scalarMeasureOfReal_withDensityᵥ` (:219), `integral_mul_toSignedMeasure_sub` (:241), `integral_mul_eq_integral_posPart_sub_integral_negPart` (:252).
  - `TauCeti/MeasureTheory/VectorMeasure/WithDensity.lean`: `integral_withDensityᵥ_congr_ae` (:83), `integral_mul_withDensityᵥ` (:155), `withDensityᵥ_one_apply` (:167), `Measure.variation_withDensityᵥ_one` (:175), `integral_mul_withDensityᵥ_one` (:183).
  - `TauCeti/MeasureTheory/Measure/Regular.lean:234` `MeasureTheory.Measure.AbsolutelyContinuous.regular`, and `TauCeti/MeasureTheory/VectorMeasure/Variation/Regular.lean:62,81,88` `regular_variation_add`, `regular_variation_smul`, `regular_variation_sub`.
  - `TauCeti/MeasureTheory/VectorMeasure/Uniqueness.lean:115,122` `eq_zero_of_integral_eq_zero_on_continuousMap`, `ext_of_integral_eq_on_continuousMap`.
- Rewrite lines 49–54 so that B5 consumes Tau Ceti's scalar-measure layer and owns only B5.BoundedApprox, which is not at the pin. SelfAdjointSpectralTheory then cites Tau Ceti for the rest, so no edge between the two roadmaps remains, whichever head merges first.
- Repoint the consuming sentences at lines 1036, 1046–1048, 1056, 1061–1063, 1083 and 1114–1122 to these names.
- Drop the backticks on the three map names as names of this roadmap's own.

Tested: each name above is present at the pinned Tau Ceti. Also, `Suggested.lean`'s `integral_withDensityᵥ` closes by `exact VectorMeasure.integral_mul_withDensityᵥ hg hf.aestronglyMeasurable M (ae_of_all _ hbound)` (see R06).

## R02 (P2) — The module docstring's "not statable" list is out of date: four headlines can be stated at the pins

**Location.** `TauCetiRoadmap/BanachSpaceTheory/Suggested.lean:24–30`:

- "the projective and injective tensor norms are targets"
- "B5's dual identification `C(K,𝕜)* ≃ M(K)` and the Dunford–Pettis criterion: … a target carrier"
- "Pietsch factorization … needs the domination measure as data"

Also line 33: "John's ellipsoid theorem: ellipsoids and volume … are B7 targets".

**Claim.** Each stated reason fails at the pins, and the headlines are absent:

- **Riesz representation.** It needs no new carrier. It can be stated on native `VectorMeasure K 𝕜` with `μ.variation.Regular`.
- **Dunford–Pettis criterion.** It concerns subsets of `Lp 𝕜 1 μ` and does not involve M(K) at all.
- **John's bound.** `d(E,ℓ₂ⁿ) ≤ √n` can be stated with `TauCeti.banachMazurDist`.
- **Pietsch factorization.** It is stated and proved in Tau Ceti.
- **Tensor norms.** They exist in Tau Ceti, and so does Grothendieck's AP equivalence.

**Witness.** The following elaborate at the pins with `sorry` as their only warning: `∃! μ : VectorMeasure K 𝕜, μ.variation.Regular ∧ (∀ f, φ f = ∫ᵛ x, f x ∂[mul ℝ 𝕜; μ]) ∧ ‖φ‖ = (μ.variation univ).toReal`, the L¹ criterion, and `banachMazurDist 𝕜 E (EuclideanSpace 𝕜 (Fin n)) ≤ √n`.

**Repair.**
- Add three headline theorems to `Suggested.lean`.
  - (a) Scalar Riesz representation: for compact Hausdorff Borel `K` and `φ : StrongDual 𝕜 C(K, 𝕜)`, there is a unique `μ : VectorMeasure K 𝕜` with `μ.variation.Regular`, `φ f = ∫ᵛ x, f x ∂[ContinuousLinearMap.mul ℝ 𝕜; μ]` for all `f`, and `‖φ‖ = (μ.variation Set.univ).toReal`.
  - (b) Dunford–Pettis: for `[IsFiniteMeasure μ]` and `S : Set (Lp 𝕜 1 μ)`, `IsCompact (closure (toWeakSpace 𝕜 _ '' S))` holds iff `Bornology.IsBounded S ∧ ∀ ε > 0, ∃ δ > 0, ∀ A, MeasurableSet A → μ.real A ≤ δ → ∀ f ∈ S, ∫ x in A, ‖f x‖ ∂μ ≤ ε`.
  - (c) John's bound: `[FiniteDimensional 𝕜 E]`, `finrank 𝕜 E = n` ⊢ `TauCeti.banachMazurDist 𝕜 E (EuclideanSpace 𝕜 (Fin n)) ≤ √n`. Import `TauCeti.Analysis.Normed.Module.BanachMazur`.
- Delete the Pietsch-factorization bullet. The pinned `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_eq_comp_codRestrict_topologicalClosure` (`TauCeti/Analysis/Normed/Operator/AbsolutelySumming/Factorization.lean:143`) is that theorem.
- Rewrite the B4 bullet. The pinned `TauCeti.ProjectiveTensor` (`TensorProduct/ProjectiveSeminorm.lean:236`), `TauCeti.InjectiveTensor` (`InjectiveSeminorm.lean:330`) and `TauCeti.CompletedProjectiveTensor` (`Completion.lean:76`) exist, and Grothendieck's equivalence is `TauCeti.hasApproximationProperty_iff_forall_isCompactOperator` (`ApproximationProperty/CompactOperator.lean:178`). Either state the metric criterion on these carriers or name the one object that is missing, the trace-pairing map `Θ_X`.

Tested: (a), (b) and (c) elaborate in a scratch copy, with `sorry` the only warning.

## R03 (P2) — Kadec–Snobar is stated over ℝ; the README states it over 𝕜

**Location.** `Suggested.lean:304, 329–332`: `variable {E : Type*} [NormedAddCommGroup E] [NormedSpace ℝ E]` and `theorem kadec_snobar (F : Submodule ℝ E)`. `README.md:12–14` says local reflexivity, John's theorem and the projection theorems are over 𝕜, and `README.md:1391–1393` says "every subspace of dimension at most `n` of a normed `𝕜`-space is the range of a projection of norm at most `√n`".

**Claim.** The Lean headline is narrower than the README. The complex case, which the README promises, is statable but absent. The same is true of `local_reflexivity` (`Suggested.lean:316`), although R06 deletes that one.

**Witness.** `theorem kadec_snobar (F : Submodule 𝕜 E) [FiniteDimensional 𝕜 F] : ∃ P : E →L[𝕜] E, LinearMap.range P.toLinearMap = F ∧ (∀ x ∈ F, P x = x) ∧ ‖P‖ ≤ √(finrank 𝕜 F)` elaborates under the file's B1 section variables, which assume `[RCLike 𝕜]`.

**Repair.** Move `kadec_snobar` out of `section Local` and state it over `[RCLike 𝕜] [NormedSpace 𝕜 E]` as in the witness. Keep `dvoretzky_finite` and `dvoretzky` over ℝ, as README:14 says.

Tested: the 𝕜 statement elaborates. At `F = ⊥` it gives `P = 0` with `‖P‖ = 0 ≤ 0`. At `dim F = 1` it gives `‖P‖ = 1 ≤ 1` by Hahn–Banach over ℂ.

## R04 (P2) — B6.Cotype2: the two-point family does not exclude cotype q<2 or type p>2 with an arbitrary constant

**Location.** `README.md:1269–1270`: "no nonzero space has cotype q<2 or type p>2 (by the two-point family y,y)". The Check at `README.md:1283–1286` says the family gives "`R₂=√2‖y‖` against `2^(1/q)‖y‖`, excluding cotype q<2 with constant 1 and type p>2 with any constant".

**Claim.** With the family `(y,y)` the type-p inequality reads `√2‖y‖ ≤ C·2^(1/p)‖y‖`. This holds as soon as `C ≥ 2^(1/2−1/p)`, so the family excludes nothing beyond constant 1. The same holds for cotype q<2.

**Witness.** Take p = 4, y ≠ 0 and C = 2^(1/4). Then `R₂(y,y) = √2‖y‖` and `C(2‖y‖⁴)^(1/4) = 2^(1/4)·2^(1/4)‖y‖ = √2‖y‖`, so the inequality holds. For cotype q = 1 and C = √2, `2‖y‖ ≤ √2·√2‖y‖` holds.

**Repair.** Replace "(by the two-point family y,y)" with "(by the n-fold family (y,…,y), for which `R₂ = √n‖y‖`: `n^(1/q) ≤ C√n` fails for q<2 and `√n ≤ C n^(1/p)` fails for p>2 as n→∞)". In the Check, change "type p>2 with any constant" to "type p>2 with constant 1", and add the n-fold family as the Check that excludes every constant.

Tested at p = 4, C = 2^(1/4): n = 16 gives `4‖y‖ ≤ 2^(1/4)·2‖y‖ ≈ 2.38‖y‖`, which is false, as required.

## R05 (P3) — The push gate fails on files outside the folder

**Location.** The gate at this head reports `outside-folder=2`: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Claim.** The pull request edits two roadmap folders that are not among its own folders. No acceptance is possible while the gate fails.

**Witness.** `git diff --stat origin/main...HEAD`, excluding the pull request's 17 folders, lists exactly these two files (2 and 6 changed lines).

**Repair.** Move the ArithmeticDirichletSeries and SymplecticGeometry loop cuts into a pull request whose folders include them, or have both folders recorded as this pull request's own so that each gets its own review.

Tested: a re-run of the gate, excluding the pull request's folders, still lists `Completed/ArithmeticDirichletSeries/README.md`.

## R06 (P3) — Padding: seven `Suggested.lean` theorems close with one pinned Tau Ceti lemma, and Krein–Šmulian restates one

**Location.** `Suggested.lean:50` `eberlein_smulian`, `:62` `milman_pettis`, `:68` `krein_smulian`, `:75` `bishop_phelps`, `:200` `integral_withDensityᵥ`, `:283` `grothendieck_real`, `:292` `grothendieck_complex`, `:316` `local_reflexivity`.

**Claim.** These are theorems already proved at the pin. An admitted copy tests nothing the library has not already done. The pinned sources are:
- `TauCeti/Analysis/Normed/Module/WeakSpace/EberleinSmulian.lean:153`
- `TauCeti/Analysis/Convex/Uniform/Basic.lean:147`
- `TauCeti/Analysis/Normed/Module/Dual/BishopPhelps.lean:319`
- `TauCeti/Analysis/Matrix/Grothendieck.lean:169,207`
- `TauCeti/MeasureTheory/VectorMeasure/WithDensity.lean:155`
- `local_reflexivity`: `LinearIsometry.exists_continuousLinearMap_of_doubleDual F.subtypeₗᵢ G hε` (`Dual/LocalReflexivity.lean:228`, over `RCLike 𝕜`), plus one repackaging line.
- `krein_smulian`: `Convex.isClosed_iff_forall_isClosed_inter_closedBall` (`Dual/KreinSmulian.lean:272`), transported along `StrongDual.toWeakDual`.

**Witness.** In a scratch copy each closes with one tactic:
- `exact TauCeti.isCompact_toWeakSpace_iff_isSeqCompact`
- `exact TauCeti.surjective_inclusionInDoubleDual_of_uniformConvexSpace`
- `exact TauCeti.dense_setOf_exists_norm_apply_eq_norm`
- `simpa using Matrix.abs_sum_sum_mul_inner_le_eight_mul a ha hu hv` (and `…sixteen_mul`)
- `exact VectorMeasure.integral_mul_withDensityᵥ …`

**Repair.** Delete these eight declarations from `Suggested.lean`; the README keeps the statements. List the pinned names in the module docstring as headlines already proved at the pin, and in the README's `From Tau Ceti` contract. Remove the backticks on `integral_withDensityᵥ` at README:987 (see R01).

Tested: the scratch probe elaborates with no error.

## R07 (P3) — `Suggested.lean` redefines carriers that the pinned Tau Ceti owns

**Location.** `Suggested.lean:85` `SchauderBasis.IsShrinking`, `:90` `IsBoundedlyComplete`, `:108` `HasApproximationProperty`, `:223` `weakNorm`, `:229` `IsAbsolutelySumming`, `:235` `DualBall`. The theorems built on them restate pinned theorems: `:97` `reflexive_iff`, `:117` `SchauderBasis.approximationProperty` and `:246` `pietsch_domination`.

**Claim.** The rule is that a definition is kept only when a headline needs it to be statable. These six carriers already exist at the pin, so each object now has two owners, and the remaining headlines are not stated against the pinned API. The math agrees: for instance, `IsShrinking` is `isShrinking_iff`, and `weakNorm` is `TauCeti.weakLpNorm` at real p ≥ 1. The pinned sources are:
- `TauCeti/Analysis/Normed/Module/Bases/Reflexive.lean:49,60,199`: `SchauderBasis.IsShrinking`, `IsBoundedlyComplete`, `surjective_inclusionInDoubleDual_iff`.
- `ApproximationProperty/Basic.lean:47`: `TauCeti.HasApproximationProperty`.
- `Bases/Approximation.lean:64`: `SchauderBasis.hasBoundedApproximationProperty`.
- `Lp/Weak.lean:78`: `TauCeti.weakLpNorm`.
- `AbsolutelySumming/Basic.lean:99`: `ContinuousLinearMap.summingENorm`.
- `AbsolutelySumming/Pietsch.lean:329`: Pietsch.

**Witness.** Pinned `ContinuousLinearMap.summingENorm_le_ofReal_iff_exists_isProbabilityMeasure` states Pietsch domination on `WeakDual.toStrongDual ⁻¹' closedBall 0 1`, which is exactly `DualBall`, with the same integrand and constant as `pietsch_domination`.

**Repair.**
- Delete the six definitions, the two instances on `DualBall`, and the three theorems.
- Restate `cotype2_summing_bound` as `U.summingENorm 2 ≤ ENNReal.ofReal (K * √(rademacherSecondMoment fun i ↦ U (EuclideanSpace.single i 1)))`, importing `TauCeti.Analysis.Normed.Operator.AbsolutelySumming.Basic`.
- Restate `exists_reflexive_not_hasApproximationProperty` with `¬ TauCeti.HasApproximationProperty ℝ E`.
- In the README, write the pinned names at lines 199–204, 249–258 and 1234–1236 (`SchauderBasis.surjective_inclusionInDoubleDual_iff`, `SchauderBasis.hasBoundedApproximationProperty`, `TauCeti.HasApproximationProperty`, `TauCeti.weakLpNorm`, `ContinuousLinearMap.summingENorm`, `TauCeti.AbsolutelySumming`).

Tested: the `summingENorm` form of the cotype bound elaborates. Note that `exact b.hasBoundedApproximationProperty.hasApproximationProperty` fails against the file's own `HasApproximationProperty` (type mismatch), which shows the two carriers are distinct declarations.

## R08 (P3) — B5.BoundedApprox has no locator and no Checks

**Location.** `README.md:1017–1024`: "construct g∈C(K,𝕜) with the same bound and `∫‖f−g‖dν<ε`". The deleted paragraphs of R01 had no locator either.

**Claim.** The target carries no source locator, and B5 has no Checks for this approximation, so a wrong carrier would pass. For example, coordinate clipping over ℂ breaks the bound.

**Witness.** Over ℂ, clipping each coordinate of `z = M(1+i)` to `[−M,M]` leaves `M(1+i)`, whose norm `√2·M > M`. Radial clipping gives `M(1+i)/√2`, of norm M. No Check pins this.

**Repair.**
- Add a locator for the theorem used: Lusin's theorem in the form where the continuous approximant keeps the sup bound of f, from a standard text, given by theorem number and page.
- Add three Checks:
  - (i) On [0,1] with Lebesgue measure, `f = 1_[0,1/2]` and M = 1, a ramp of width δ has `∫|f−g| = δ/2` and `‖g‖∞ = 1`.
  - (ii) For `ν = δ_a`, `g ≡ f(a)` gives error 0. This shows the bound M cannot be lowered below `‖f(a)‖`.
  - (iii) The complex coordinate-clipping value above, against radial clipping.

Tested on (i): with δ = ε the error is ε/2 < ε.

## R09 (P3) — A stale PDE citation, a re-planned PDE target, and a carrier that does not exist at the pin

**Location.** `README.md:918–920`: "`‖u‖_1+‖u'‖_1` on PDE Lane A item1's weak W^(1,1) carrier. Prove the closed weak-derivative graph/completeness and its absolutely-continuous representative comparison on this interval." Also `README.md:1150`: "`LocalHaarLInfinity 𝕜 μ ≃ₗᵢ[𝕜] NormedSpace.Dual 𝕜 (MeasureTheory.Lp 𝕜 1 μ)`".

**Claim.**
- PDE on main has no "Lane A item1". The interval carrier and its absolutely continuous representative are PDE Layer 1 §1.1 (A1), on the pinned `TauCeti.W1p`. So this sentence re-plans PDE §1.1.
- At the pinned Mathlib, `NormedSpace.Dual` is no longer a type; only lemma names remain in that namespace. README:15 itself requires `StrongDual`.

**Witness.** `TauCetiRoadmap/PDE/README.md:677`, "### 1.1 Weak derivatives and Sobolev classes on intervals (A1)", which identifies the absolutely continuous representative for every `1 ≤ p ≤ ∞`. A grep of the pinned Mathlib finds no `def`/`abbrev` `NormedSpace.Dual`.

**Repair.**
- Write "PDE Layer 1 §1.1 (A1)'s `W^{1,1}(0,1)` carrier and its absolutely continuous representative".
- Replace the "Prove the closed weak-derivative graph/completeness and its absolutely-continuous representative comparison" clause with "consume PDE §1.1 (A1)'s representative identification".
- Write `StrongDual 𝕜 (MeasureTheory.Lp 𝕜 1 μ)` at line 1150.

Tested: PDE §1.1 at main line 677 states the identification at p = 1.

## R10 (P3) — The README does not have the house shape, and most definitions have no Checks

**Location.** The whole of `README.md`. The headings are `# Banach space theory`, `## Scope and conventions`, `## B1.` … `## B7.` and `## Sources and API alignment`. `**Checks.**` appears only at lines 829, 889, 1176 and 1276.

**Claim.** The README is missing most of the house shape:
- There is no `# Roadmap:` title and no `**Summary.**` paragraph.
- There is no separate `## Scope and ownership` or `## Conventions` section.
- There is no `## Exact supplier contracts` section, so no `From Mathlib` / `From Tau Ceti` / `From TauCetiRoadmap.X` lists. Nowhere does the README record what the pinned Tau Ceti already supplies (see R01, R06, R07).
- There is no `## How to read the build`, no `## Layer k:` / `### k.n` headings, and no `### Examples` or `### Dependencies` per layer.
- There is no `## Downstream consumers` and no `## References`.

Definitions without API bullets or three Checks include the weak p-norm, πₚ, AP/BAP/MAP, shrinking and boundedly complete bases, the projective and injective norms, nuclear operators, the Banach–Mazur distance, finite representability, M(K) and the local-Haar quotient's operations. B1–B3, B4 (main), B6 (summing and Grothendieck) and B7 have no `*Needs:*` line. The third Cotype2 Check at lines 1286–1288 contains target prose ("Construct the shared finite Gaussian model here …").

**Witness.** `grep -n '^#' README.md` lists 14 headings. Compare `TauCetiRoadmap/PDE/README.md:24,121,200,657,675,1074,1082` on main, which has the full shape.

**Repair.**
- Restructure into the house shape, keeping all mathematics.
- Put the Tau Ceti and Mathlib names of R01, R02, R06 and R07 under `From Tau Ceti` / `From Mathlib`.
- Give each layer `### Examples` and `### Dependencies` and each target a `*Needs:*` line.
- Add API bullets and at least three Checks per definition. For instance, for πₚ: the identity of ℓ²ₙ has `π₂ = √n`, with strong norm `√n` and weak-2 norm 1 on `e₁,…,eₙ`.
- Move the Gaussian-model sentence out of the Check list.

## Adversarial table

| Statement | Instances tried | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| B5.ScalarIntegral reconstruction `μ = ofReal(re μ) + I•ofReal(im μ)` | 𝕜=ℂ, μ = i·δ₀; 𝕜=ℝ, μ = δ₀−δ₁ | ℂ: re μ = 0, im μ = δ₀, RHS = i·δ₀ = μ; ℝ: im μ = 0 and `I = 0` in ℝ, RHS = re μ = μ | holds | R01 (cite Tau Ceti `:119`) |
| B5.ScalarIntegral `I_(cμ)f = c I_μ f` | μ = δ₀, f ≡ 1, c = i | LHS = i, RHS = i·1 = i; real-only `integral_smul_vectorMeasure` covers c ∈ ℝ only | holds; explains the 𝕜-lemma | R01 |
| B5.ScalarIntegral `|re μ| ≤ |μ|`, `|ofReal σ| = |σ|` | μ = (1+i)δ₀; σ = δ₀−δ₁ | 1 ≤ √2; 2 = 2 | holds | R01 |
| B5.ScalarDensity / `integral_withDensityᵥ` | ν = δ_a, g(a) = 2−i, f(a) = i, M = 1; X = ∅ | i(2−i) = 1+2i both sides; 0 = 0 | holds; `hM`, `IsFiniteMeasure` unused (pinned lemma lacks both) | R01, R06 |
| B5.AbsContRegular | [0,1], μ Lebesgue, ν = 2x dx; control: Dieudonné ν on [0,ω₁] vs δ_{ω₁} | ν regular; control: ν([0,ω₁)) = 1, δ([0,ω₁)) = 0, so ν is not ≪ δ_{ω₁} and is no counterexample | holds | R01 (Tau Ceti `Regular.lean:234`) |
| B5.ScalarUniqueness | μ = δ₀−δ₁ on [0,1], f = 1−x; control: Dieudonné ν − δ_{ω₁} | ∫f dμ = 1 ≠ 0, so detected; control integrates every continuous f to f(ω₁)−f(ω₁) = 0 but is nonzero and not regular | holds; regularity needed and present | R01 |
| B5.BoundedApprox | [0,1], f = 1_[0,1/2], M = 1; ℂ value z = M(1+i) | ramp: error δ/2, sup 1; coordinate clip ‖·‖ = √2M, radial clip ‖·‖ = M | holds with radial clipping | R08 (Checks) |
| B5.LocalHaarDual Check 1 | uncountable discrete G, counting μ | locally null ⇔ empty; local quotient = ℓ∞(G) = ℓ¹(G)*; global-to-local is an isometry | holds | none |
| B5.LocalHaarDual Check 2 | ℝ_d × ℝ, L = ℝ_d × {0} | global: μ(L) = Σ_x 2ε_x = ∞ > 0, so ‖1_L‖∞ = 1; local: compacts in L are finite, μ = 0, so local norm 0 | holds; map not injective | none |
| B5.LocalHaarDual Check 3 | σ-finite μ | local null = global null by a countable exhaustion | holds | none |
| B6 `rademacherSecondMoment` | n = 0; n = 1; Hilbert (y,y) | 0/1 = 0; (‖y‖²+‖−y‖²)/2 = ‖y‖²; (4‖y‖²+0+0+4‖y‖²)/4 = 2‖y‖² | holds | none |
| B6 cotype Checks c₀, ℓ¹ | e₁..eₙ | c₀: R₂ = 1 vs √n, cotype fails; ℓ¹: R₂ = n ≥ √n, type p>1 needs n ≤ Cn^{1/p}, which fails | holds | none |
| B6 "two-point family excludes type p>2 / cotype q<2" | p = 4, C = 2^{1/4}; q = 1, C = √2 | √2‖y‖ ≤ √2‖y‖; 2‖y‖ ≤ 2‖y‖ | **fails** | R04 (n-fold family) |
| `cotype2_summing_bound` | Y = ℝ, C = 1, U = functional u; n = 0 | π₂(U) = ‖u‖ = R₂ needs K ≥ 1; README K = 2C·t(1), with E[g²1_{|g|>2.05}] ≈ 0.240 ≤ 1/4, so K ≈ 4.1; n = 0: 0 ≤ 0 | holds | R07 (restate on `summingENorm`) |
| `eberlein_smulian` | ℓ² unit ball; {eₙ} ⊂ ℓ¹ | both sides true; both false (Schur, eₙ not Cauchy) | holds | R06 |
| `james` | ℓ¹, f = Σ(1−1/n)xₙ; E = 0 | ‖f‖ = 1, |f(x)| < 1 on the ball, so not attained and ℓ¹ not reflexive; E = 0: both true | holds | none |
| `milman_pettis` | ℓ¹: ‖e₁+e₂‖ = 2 | not uniformly convex, so no claim | consistent | R06 |
| `krein_smulian` | r < 0 | ball = ∅, image ∅ closed on both sides | holds | R06 |
| `bishop_phelps` | E = 0 | set = {0} = dual, dense | holds | R06 |
| `reflexive_iff` | c₀ basis, aₙ = 1; ℓ¹ basis | partial sums of norm 1 do not converge, so not boundedly complete, c₀ not reflexive; span{coordᵢ} = c₀₀ not dense in ℓ∞, so not shrinking | holds | R07 |
| `approximationProperty`, `HasApproximationProperty` | E = 0; ℓ² with P_n | T = 0; ‖P_n x − x‖ → 0 uniformly on compacts | holds | R07 |
| `exists_complexificationStrongDualEquiv` | E = ℝ, ⟨g,h⟩ = ⟨id,0⟩; ℂ-linearity | value x + iy (identity); e⟨−h,g⟩ = −hx−gy + i(gx−hy) = i·(gx−hy+i(hx+gy)) | holds | none |
| `hilbertBasis_lift_mk_eq` / unitary classification | H = 0; ℝ vs ℝ² | 0 = 0; 1 ≠ 2 and no isometry | holds | none |
| `exists_lpInftyDualEquiv` | μ = ∞·δ_a (not σ-finite) | L¹ = 0, L∞ = 𝕜, so no equivalence; σ-finite needed and present | holds | none |
| `exists_lpDualEquiv` | μ = 0; ℂ, p = q = 2 | 0 ≅ 0; pairing ∫fg is ℂ-linear in g (with conj it would be antilinear) | holds | none |
| `banach_stone` | K = L = pt, T = λ·, |λ| = 1; K = ∅, L ≠ ∅ | h = λ, φ = id; no T exists (C(∅) = 0) | holds | none |
| `pietsch_domination` | E = 𝕜, T = id, C = 1 | ν = δ_id: ‖x‖ ≤ (|x|ᵖ)^{1/p} | holds | R07 |
| `grothendieck_real` | a = [1]; constant at M = 2 | 1 ≤ 8; Γ ≤ 4/(1−√3/4) ≈ 7.06 ≤ 8; tail E(|g|−M)₊² ≤ Eg⁴/(16M²) = 3/(16M²) | holds | R06 |
| `grothendieck_complex` | real/imaginary split | ≤ 8 + 8 = 16 (also ≤ 8√2 ≈ 11.3) | holds | R06 |
| `local_reflexivity` | E reflexive | T = J⁻¹ on F satisfies all three clauses | holds | R06 (over 𝕜 at the pin) |
| `kadec_snobar` | F = ⊥; dim F = 1; 𝕜 = ℂ | ‖0‖ = 0 ≤ 0; 1 ≤ 1; same bound over ℂ but stated over ℝ | holds; generality short | R03 |
| `dvoretzky_finite` | k = 0; k = 1 | T = 0; N = 1, T t = t·e | holds | none |
| `dvoretzky` | n = 1 | T t = t·e, exact | holds | none |
| Riesz C(K,𝕜)* (absent) | statability | elaborates on `VectorMeasure K 𝕜` | statable | R02 |
| Dunford–Pettis L¹ (absent) | statability | elaborates on `Lp 𝕜 1 μ` | statable | R02 |
| John `d(E,ℓ₂ⁿ) ≤ √n` (absent) | statability; n = 1 | elaborates; d = 1 ≤ 1 | statable | R02 |
| B1 `δ₀−δ₁` regularity example | A = {0,1} | μ(A) = 0; compacts ∅,{0},{1},A give 0,1,−1,0, so sup|μ(K)| = 1 | holds | none |
| B1 `x²y/(x⁴+y²)` | (t,t²); lines y = mx | 1/2; mx/(x²+m²) → 0 | holds | none |
| B4.0 Krawtchouk values | n = 3: j = 1,2,3; n = 4: j = 1..4 | 5,1,3 (bound C(6,2)/3 = 5); 14,4,6,0 (bound C(8,3)/4 = 14) | holds | none |
| B4.1 AH parameters | j = 1, 2 | (M₁,N₁) = (4,16); n₂ = 2³² = m₂²(4n₁)⁴ = 2⁸·2²⁴; n₃ = 2¹⁰²⁴ ≥ 2²⁸⁸ | holds | none |
| B4.1 quantitative contradiction | m > 256C‖T‖/δ | ‖Tz‖ ≥ δm‖z‖/(192C) > ‖T‖‖z‖, since 192 < 256 | holds | none |

## Verified sound

- **Gate.** All checks pass except outside-folder (R05). My re-run of `gate … --base origin/main` printed `outside-folder=35`. Excluding this pull request's 17 folders leaves `Completed/ArithmeticDirichletSeries/README.md`, the first listed of the worker's 2.
- **Dependency check.** `depcheck: 239 roadmaps, 2334 edges, 0 problem(s)`: no UPWARD or CYCLE line. BanachSpaceTheory is on main and so is not in the merge order.
- **Elaboration.** `lake env lean TauCetiRoadmap/BanachSpaceTheory/Suggested.lean` produced 25 `sorry` warnings and nothing else.
- **Signatures.** `#check @name` was run on all 34 declarations in one scratch file. Every elaborated type carries its binders. The two leads flagged in `signatures.md` (`exists_reflexive_not_hasApproximationProperty`, `exists_scalarPlusCompact`) are binders inside `∃`, so they are false positives. No change is needed beyond R03 and R07.
- **Padding probe.** A scratch file closing eight theorems from the pinned Tau Ceti elaborates without errors (R06). `exists_linearIsometryEquiv_hilbertBasis` does not close in one tactic: there is no `HilbertBasis.reindex` at the pin, so it stays.
- **Mathlib declarations opened at the pin:**
  - `VectorMeasure/Integral.lean:255` (notation), `:517` `integral_smul_vectorMeasure`, `:537` `integral_add_vectorMeasure`, `:542` `integral_finsetSum_vectorMeasure`, `:558` `integral_sub_vectorMeasure`, `:671` `integral_toSignedMeasure`
  - `Variation/Basic.lean:189,311,320,350`
  - `WithDensityVec.lean:366` `Measure.variation_withDensityᵥ`
  - `Operations.lean:282` `mapRangeL`
  - `Variation/SignedMeasure.lean:65` `totalVariation_eq_variation`
  - `RieszMarkovKakutani/Real.lean:408` `Measure.ext_of_integral_eq_on_compactlySupported`
  - `ContinuousMapDense.lean:352,364` `toLp_denseRange` (needs `WeaklyRegular`, supplied by `Regular.weaklyRegular`, `Measure/Regular.lean:341`)
  - `Measure/Regular.lean:892–905,991,1122`: the instance chain `Regular → InnerRegularCompactLTTop → InnerRegular`/`Regular` for finite measures that B5.AbsContRegular cites is correct
  - `WithDensity.lean:60,169`
  - `Decomposition/Lebesgue.lean:173,434`
  - `Decomposition/RadonNikodym.lean:51`
  - `RCLike/Basic.lean:1073,1099,1180` (`reCLM`, `imCLM`, `ofRealCLM`)
- **Tau Ceti declarations opened at the pin:** the files and lines cited in R01, R02, R06 and R07, and `MeasureTheory/Function/L1Space/Dual.lean:102` `Lp.dualOneEquiv`. That theorem covers finite measures only, so the σ-finite `exists_lpInftyDualEquiv` is a genuine extension. Not at the pin, so genuine targets: Hilbert-basis cardinality, Banach–Stone, cotype/type, Kadec–Snobar, Dvoretzky, John, Enflo, Argyros–Haydon, the complexification dual comparison and B5.BoundedApprox.
- **Cross-roadmap citations resolved on main (`39d3d60`):**
  - OperatorIdeals `OI-A01` (:125), `OI-A25`–`OI-A28` (:172–179), `OI-B29` (:349), `OI-B30` (:350)
  - AmenableGroups Layer 7 (:415), item 1 (:438): the localization, Baire and null-envelope contract
  - PseudodifferentialOperators Layer 5 (P5) (:927)
  - VonNeumannAlgebras V1
  - BanachAlgebras Layers 3 and 8 and its `From TauCetiRoadmap.BanachSpaceTheory` (:133)
  - NoncommutativeIntegration §7.5 (:1299)
  - Consumers in open pull requests: UnboundedOperators §4.1 and IndexTheory Layer 1 (`roadmaps grep`)
  - SelfAdjointSpectralTheory at this head (README:95–99, 474–512) consumes the B5 items, which R01 repoints to Tau Ceti
  - The two names `citations.md` reported as found nowhere, `SchauderBasis.reflexive_iff` and `SchauderBasis.approximationProperty`, are declared in `Suggested.lean` under `TauCetiRoadmap.BanachSpaceTheory`, so they are false positives.
- **Sources (seeded sample):**
  - B6.Cotype2, `pisier12gt` line 1591 (Definition 9.6, printed p. 31): cotype 2 is `(Σ‖xⱼ‖²)^{1/2} ≤ C‖Σεⱼxⱼ‖_{L²}` and type 2 is the reverse; the cotype-p variant is at line 1604 (printed p. 32). This matches `HasCotype`/`HasType` and README:1260–1265.
  - B5.LocalHaarDual vocabulary, `bdlhv08` lines 14611–14626 (Appendix C.5, printed pp. 383–384): locally Borel and locally null sets, L∞ modulo locally null sets, and the bilinear pairing `∫ f ϕ` identifying it with L¹(G)*. This matches README:1149–1154.
  - The mathematics of B5.ScalarIntegral, ScalarDensity, AbsContRegular, ScalarUniqueness and BoundedApprox was checked directly (table above); all five are true as stated.
- **Ownership against open pull requests.** `overlaps.md` reports no other open pull request that changes this roadmap and no dropped ids. Grepping open heads for the moved items found the second owner reported in R01 (SA-B81 at the head of #1187).

## Not verifiable

- `hewittross63` Theorem 12.18 (B5.LocalHaarDual): recorded as `uncertified` (paywalled) and settled, so cited by its locator. Its content agrees with `bdlhv08`'s C.5 statement, which cites Bourbaki instead.
- Pisier, *Factorization of Linear Operators and Geometry of Banach Spaces*, §3 (Lemma 3.5, Proposition 3.7, Lemma 3.8, Theorem 3.9, pp. 33–37), cited in B6.Cotype2: it is not in the roadmap's manifest and I know of no legal open copy. The proof route at README:1290–1308 was checked mathematically instead (absorption `G₂ ≤ tR₂ + G₂/2`).
- B5.ScalarIntegral, ScalarDensity, AbsContRegular, ScalarUniqueness and BoundedApprox: the README gives no locator to check (R01, R08).
- Not in the seeded sample and not checked against text: `enflo73`, `megginson98`, `albiackalton06`, `runde02`, `ryan02`, `garlinggordon71` (all `uncertified`), and `ball97`, `argyroshaydon11`, `aost05`, `daws04`, `garridojaramillo02`, `dosz09`, `emmanuele93`. Pietsch, *Eigenvalues and s-Numbers* (README:1462) is not in the manifest.

## Source issues

- none
