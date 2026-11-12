# Review of ClassicalErgodicTheory (pull request #2231 at c227c24)

**Verdict:** needs changes

## R01 (P1) — §1.1 item 4 omits the limit, so the equivalence is false

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:489–490`, "for all measurable `A`, `B` there is a set `J ⊆ ℕ` of natural density one along which the correlations converge (density defined by `#(J ∩ range N)/N → 1`)".

**Claim:** Item 4 never says what the correlations converge to. As written it holds for maps that are not weakly mixing, so the equivalence 1 ⇔ 4 is false.

**Witness:** Identity on two equiprobable points, `A = B = {0}`: correlation `1/2` for all `n`, convergent along `J = ℕ`; `Prod.map id id` is not ergodic. Sarig Theorem 3.2(3), p. 91 (Sarig line 4519–4524) gives limit `μ(E)μ(F)`.

**Repair:** Replace item 4 with "for all measurable `A`, `B` there is a set `J ⊆ ℕ` of natural density one with `μ.real (A ∩ T^[n] ⁻¹' B) → μ.real A * μ.real B` as `n → ∞` along `J` (density defined by `#(J ∩ range N)/N → 1`);". Add the Check: "The identity on two equiprobable points has constant correlation `1/2 ≠ 1/4` for `A = B = {0}`. It converges along `ℕ`, so without the limit value item 4 would hold for a system that is not weakly mixing." With the limit restored, the identity fails item 4 (`1/2 ≠ 1/4`), which matches item 1.

## R02 (P2) — `set_option` in Suggested.lean

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:28`, `set_option autoImplicit false`.

**Claim:** `Suggested.lean` may contain no `set_option` of any kind, and the push gate fails on this line.

**Witness:** Gate at c227c24 reports `set_option=1 … FAIL` at line 28. A scratch copy with line 28 deleted elaborates under `lake env lean` with only `declaration uses sorry` warnings.

**Repair:** Delete line 28.

## R03 (P2) — Stand-ins restate other roadmaps' objects in Suggested.lean

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:16–25, 41–67, 412–415`, "Marked **stand-ins** cover objects consumed from open roadmap PRs that have no implementation: `IsStrongMixing`, copied verbatim from the prototype of ProbabilisticAndMetricNumberTheory".

**Claim:** This file plans six objects a second time. `IsStrongMixing` belongs to ProbabilisticAndMetricNumberTheory §4.6; `countablePartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate` and `measureEntropy` belong to GeometryOfNumbersAndQuadraticArithmetic §4.2; the σ-algebra conditional entropy belongs to ArithmeticDynamics §2.7. A headline whose carrier is not at the pins must be named as not statable, never stated through a stand-in. `conditionalPartitionEntropy` also reuses a supplier's name for a different object.

**Witness:** GeometryOfNumbersAndQuadraticArithmetic §4.2 defines `conditionalPartitionEntropy` for two countable labels (`Σ p_ij log(p_j/p_ij)`). `Suggested.lean:414` gives that name a sub-σ-algebra argument and a `condExpKernel` body. None of the six names exists in pinned Mathlib or Tau Ceti.

**Repair:**
- Delete lines 16–25 and the `StandIns` section.
- Delete every declaration stated through the stand-ins: `isStrongMixing_iff`, `actionPartitionEntropyRate`, `actionMeasureEntropy`, `actionPartitionEntropyRate_tendsto`, `conditionalPartitionEntropy`, `relativePartitionEntropyRate`, `relativeMeasureEntropy`, `measureEntropy_factor_add_relative`, `topologicalPressure_eq_iSup`, `coverEntropy_eq_iSup`, `flowTopologicalPressure_eq_iSup`, `IsEquilibriumState`, `IsMeasureOfMaximalEntropy`, `IsFlowEquilibriumState`, `isMeasureOfMaximalEntropy_iff`, `exists_isEquilibriumState`, `measureEntropy_flow`.
- Then delete the definitions no remaining statement uses: `IsFactorMap`, `orbitLabel`, `invariantProbabilities`, `flowInvariantProbabilities`, `pressureNetSum`, `topologicalPressure`, `flowTopologicalPressure`.
- Add this paragraph to the module docstring: "Not statable at the pins: the Kolmogorov–Sinai generator theorem, entropy of natural extensions, the Abramov–Rokhlin and Abramov flow formulas, Brin–Katok, the Bernoulli, Markov and toral entropies, amenable entropy, the variational principles for maps, amenable actions and flows, and existence of equilibrium states. Their carrier, the measure entropy of GeometryOfNumbersAndQuadraticArithmetic §4.2 (`countablePartitionEntropy`, `measureEntropy`), is in neither Mathlib nor Tau Ceti. The spectral characterization of strong mixing needs `IsStrongMixing` (ProbabilisticAndMetricNumberTheory §4.6), likewise absent."
- At README line 476, state `isStrongMixing_iff` in prose without the name (see R10).

## R04 (P2) — §4.7 re-plans GeometryOfNumbersAndQuadraticArithmetic's tempered pointwise ergodic theorem

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:992–997`, "prove the pointwise ergodic theorem along a tempered left Følner sequence `F_n` … Build the tempered covering estimate and weak `(1,1)` maximal inequality, then pass from a dense class and the mean theorem to `L¹`."

**Claim:** GeometryOfNumbersAndQuadraticArithmetic, which is earlier in the merge order, already owns this theorem, its maximal inequality and the same temperedness condition. The object has two owners.

**Witness:** GeometryOfNumbersAndQuadraticArithmetic README §4.2, "Averaging and additional measure invariance", has:
- `TemperedFolnerSequence` with the bound `η(⋃_(k<j) A_k⁻¹A_j)≤Cη(A_j)`;
- `tempered_action_maximal_inequality`;
- `tempered_action_pointwise`, whose limit is the conditional expectation on invariants;
- API that includes "the finite-group constant-universe case".

**Repair:** Replace README lines 992–998 with: "For a countable discrete amenable group acting on a standard Borel probability space, the pointwise ergodic theorem along a tempered left Følner sequence is GeometryOfNumbersAndQuadraticArithmetic §4.2 `tempered_action_pointwise`, with counting measure as Haar measure: the temperedness bound `#(⋃ k < n, F_k⁻¹ * F_n) ≤ C * #F_n` is its `TemperedFolnerSequence` bound. Prove here that every Følner sequence has a tempered subsequence, and identify the ℤ-interval case with ProbabilisticAndMetricNumberTheory §4.1 `birkhoff_pointwise`." Add `tempered_action_pointwise` and `tempered_action_maximal_inequality` to the GeometryOfNumbersAndQuadraticArithmetic row of the ownership table and to §4.7's *Needs:*.

## R05 (P2) — Statable headlines are missing from Suggested.lean, and its docstring names no non-statable ones

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:7–15`, "The statements here suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap." The headline list is at `README.md:13–16`.

**Claim:** Three headlines can be stated on carriers that exist at the pins, yet none is stated: Wiener's lemma (§2.2), weak mixing of a map as the absence of nonconstant `L²` eigenfunctions (§2.3), and the Følner mean ergodic theorem (§2.5). The docstring presents the file as a sample of signatures and lists no non-statable headline with its missing carrier.

**Witness:** The three statements below elaborate at the pins in a scratch copy, with only `sorry` warnings. They use Mathlib `Lp.compMeasurePreservingₗᵢ`, `Module.End.HasEigenvector` and `IsFoelner`.

**Repair:** Replace the module docstring with: "Classical ergodic theory: target signatures. The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti." Follow it with the not-statable paragraph from R03. Then add:

```lean
/-- Layer 2.2: Wiener's lemma. -/
theorem tendsto_cesaro_norm_moment_sq (σ : Measure Circle) [IsFiniteMeasure σ] :
    Tendsto (fun N : ℕ => (N : ℝ)⁻¹ * ∑ n ∈ Finset.range N, ‖∫ z, (z : ℂ) ^ n ∂σ‖ ^ 2) atTop
      (𝓝 (∑' z : Circle, σ.real {z} ^ 2)) := by
  sorry

/-- Layer 2.3: weak mixing is the absence of nonconstant `L²` eigenfunctions. -/
theorem weakMixing_iff_hasEigenvector_ae_const {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsProbabilityMeasure μ] {T : X → X} (hT : MeasurePreserving T μ μ) :
    WeakMixing T μ ↔ ∀ (c : ℂ) (f : Lp ℂ 2 μ),
      Module.End.HasEigenvector (Lp.compMeasurePreservingₗᵢ ℂ T hT).toLinearMap c f →
        ∃ a : ℂ, (f : X → ℂ) =ᵐ[μ] fun _ => a := by
  sorry

/-- Layer 2.5: the Følner mean ergodic theorem for isometric representations. -/
theorem exists_tendsto_foelner_average {G H ι : Type*} [Group G] [Countable G]
    [MeasurableSpace G] [MeasurableSingletonClass G]
    [NormedAddCommGroup H] [InnerProductSpace ℂ H] [CompleteSpace H]
    (U : G →* (H →L[ℂ] H)) (hU : ∀ g v, ‖U g v‖ = ‖v‖)
    (l : Filter ι) [l.NeBot] (F : ι → Finset G)
    (hF : IsFoelner G (Measure.count : Measure G) l fun i => (F i : Set G)) (v : H) :
    ∃ w : H, (∀ g, U g w = w) ∧ (∀ u : H, (∀ g, U g u = u) → inner ℂ u (v - w) = 0) ∧
      Tendsto (fun i => ((F i).card : ℂ)⁻¹ • ∑ g ∈ F i, U g⁻¹ v) l (𝓝 w) := by
  sorry
```

## R06 (P3) — Padding and unused definitions in Suggested.lean

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:326, 372, 437–441, 476, 530`, and the definitions at lines 188, 213, 288–299, 313, 353, 366, 454 and 587.

**Claim:** These declarations are padding:
- `isStrongMixing_iff`, `spectralMeasureAction_spec`, `topologicalPressure_zero` and `isMeasureOfMaximalEntropy_iff` each close with one tactic.
- `information_zero` and `information_one` are boundary values.
- `spectralMeasureAction` chooses its value with `Classical.choose`, which fails the gate's statement-hygiene check.
- These definitions serve no stated headline: `IsJoining`, `orbitEntourage`, `actionPressureNetSum`, `actionPressureAlong`, `actionTopologicalPressure`, `MixingVAdd`, `IsWeakMixingRepresentation`, `actionInvariantProbabilities`, `information` and `SimplePolygon.sideVector`.

**Witness:** In a scratch copy each of the four theorems closes with one step:
- `isStrongMixing_iff`: `exact Iff.rfl`.
- `spectralMeasureAction_spec`: `exact` of `Classical.choose_spec`, with the transform equation symmetrised.
- `topologicalPressure_zero`: one `simp` unfolding `topologicalPressure`, `pressureNetSum`, `Dynamics.netEntropyEntourage` and `ExpGrowth.expGrowthSup`, with `Finset.sum_const`.
- `isMeasureOfMaximalEntropy_iff`: `simp [IsMeasureOfMaximalEntropy, IsEquilibriumState, topologicalPressure_zero hT]`.

**Repair:** Delete these declarations from `Suggested.lean`. The README keeps their statements as targets and Checks.

## R07 (P3) — The sampled targets have no theorem-level locators

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md` §§0.5, 1.5, 2.1, 2.2, 2.3, 2.5, 3.3, 3.4, 4.1, 4.3, 4.7, 4.8, 5.4, 7.1 and 9.1. For example, line 653 reads "Prove **Wiener's lemma**: for a finite measure `σ` on `Circle`" with no locator.

**Claim:** Every theorem needs an exact locator at the claim. None of these sections cites one; §7.1 gives only "Walters, Chapter 9", and References gives chapter ranges only.

**Witness:** Searching the README for theorem, lemma, proposition and page locators finds one theorem-level locator: Kechris–Miller Lemma 6.7, in §0.4. The package has no `sources.toml`.

**Repair:** Add a parenthesised locator at each claim and record each work in `sources.toml`:
- §§1.1 and 2.3: Sarig, *Lecture Notes on Ergodic Theory* (2023), Theorem 3.2, p. 91; Definition 3.6 and Proposition 3.3, p. 93.
- §1.5, ergodicity and mixing of the natural extension: Sarig, Theorem 1.6, p. 26.
- §4.3: Sarig, Proposition 4.6, p. 113, and Proposition 4.8, p. 114.
- §4.7: Sarig, Theorem 4.3, p. 109, for the map case; Lindenstrauss 2001, by theorem number, for the amenable case.
- §2.5: Creutz, Theorem 13.7, p. 117.
- §§5.4 and 7.1: Walters 1982, by theorem number.
- §§3.3, 3.4 and 9.1: the theorem numbers in Cornfeld–Fomin–Sinai or Tabachnikov.

## R08 (P3) — Abramov's formula for induced maps is narrower than its source

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:932–934`, "for an ergodic invertible system and measurable `A` with `μ A > 0`, the entropy of `inducedMap T A` for the normalized restriction is `h_μ(T) / μ A`."

**Claim:** The source proves the formula for any probability-preserving map of a standard space with `A` spanning, without ergodicity or invertibility. §0.4 already builds `inducedMap` for noninvertible maps.

**Witness:** Sarig Theorem 4.6, p. 116 (Sarig line 5776–5780): ppt on a Lebesgue space, `A` spanning, noninvertible case via natural extension. One-sided fair shift, `A = {x 0 = 0}`: induced entropy `2 log 2`, excluded by the README.

**Repair:** Replace with: "Prove **Abramov's formula for induced maps** (Sarig, Theorem 4.6, p. 116): for a probability-preserving `T` on a standard Borel space and measurable `A` with `μ A > 0` and `μ (⋃ n, T^[n] ⁻¹' A) = 1`, the entropy of `inducedMap T A` for the normalized restriction is `h_μ(T) / μ A`." Add a Check: the one-sided fair shift with `A = {x 0 = 0}` gives `2 log 2`.

## R09 (P3) — Three library citations do not exist at the pins

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- line 169: "Tau Ceti `MeasurePreserving.trim_comap`";
- line 182: "Mathlib … `Measure.disintegrate`";
- line 184: "Tau Ceti `IsStarNormal` compact spectral theorem (`TauCeti/Analysis/InnerProductSpace/Spectral/CompactNormal.lean`)", repeated as "compact normal operators" at line 54.

**Claim:** None of the three is in pinned Mathlib or Tau Ceti.

**Witness:**
- `TauCeti/Dynamics/Ergodic/MeasurePreserving.lean` declares only `isFiniteMeasure`.
- Mathlib has no `disintegrate` declaration; the word appears only in docstrings of `Probability/Kernel/Disintegration/Basic.lean`.
- `TauCeti/Analysis/InnerProductSpace/Spectral/` contains only `Eigenframe.lean`.

**Repair:**
- Delete `MeasurePreserving.trim_comap`. If it is needed, cite Mathlib `map_trim_comap` (`Mathlib/MeasureTheory/Measure/Trim.lean`).
- Replace `Measure.disintegrate` with Mathlib `MeasureTheory.Measure.IsCondKernel` (`Mathlib/Probability/Kernel/Disintegration/Basic.lean`).
- Replace the compact-normal citations with Mathlib `ContinuousLinearMap.orthogonalComplement_iSup_eigenspaces_eq_bot` (`Mathlib/Analysis/InnerProductSpace/Spectrum.lean:436`), the compact self-adjoint spectral theorem, and apply it to `K* K` in §2.4.

## R10 (P3) — The README names theorems as this roadmap's own that Suggested.lean does not declare

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- lines 547–548: "Prove `isStrongMixing_iff_mixingVAdd` and `weakMixing_iff_weakMixingVAdd`";
- line 792: "Prove `mixingVAdd_real_iff`";
- line 1392: `isEquilibriumState_iff_isMaxOn`;
- also line 259 (`scalarLpKoopman_continuous_of_measurable`) and line 494 (`WeakMixing.ergodic`, `IsStrongMixing.weakMixing`).

**Claim:** A backticked name of this roadmap's own claims that `Suggested.lean` declares it. None of these seven is declared.

**Witness:** Gate at c227c24 reports `readme-ids-missing=4` for the first four names. None of the seven occurs in `Suggested.lean`.

**Repair:** State each fact in prose without the name:
- Lines 547–548: "Prove that `T` is strongly mixing iff `MeasurableEquiv.zAddAction T` is mixing along `cocompact ℤ`, and weakly mixing iff that action is `WeakMixingVAdd`."
- Line 792: "Prove that the flow is mixing iff its time-1 map is strongly mixing."
- Line 1392: "prove that `ν` is an equilibrium state iff it maximizes `ν ↦ h_ν(T) + ∫ φ dν` on `invariantProbabilities T`."
- Line 259: "Prove that `g ↦ scalarLpKoopman p μ hμ g f` is continuous if …".
- Line 494: "Prove that weak mixing implies ergodicity and strong mixing implies weak mixing."
- After R03, line 476 likewise: "prove that `IsStrongMixing` restates, for `μ : Measure X` with `[IsProbabilityMeasure μ]`, as …".

## R11 (P3) — Pull-request numbers and process wording

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:55–62`, e.g. "ProbabilisticAndMetricNumberTheory, roadmap PR [#1421](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1421)" and "The open roadmap PRs in the table are cited by section". There are 38 such lines. Also `README.md:1623–1624` and `Suggested.lean:16–25` ("revision d311ebe1", "provisional").

**Claim:** Citations name the roadmap and section, never a pull request or a revision. Process wording is not timeless.

**Witness:** Gate at c227c24 reports `prnum=38`, at README lines 55–57, 72, 127, 193–200, 257, 262, 277, 319, 326, 355, 475, 508, 862–863, 883, 910, 971 and others.

**Repair:**
- Replace "PR #851" with "GeometryOfNumbersAndQuadraticArithmetic", "PR #1421" with "ProbabilisticAndMetricNumberTheory" and "PR #1335" with "ArithmeticDynamics", keeping each section number, and drop the links.
- Replace lines 61–62 with "These roadmaps' sections are consumed with the names and signatures given there."
- Delete lines 1623–1624.
- The new docstring of R05 removes the revision references from `Suggested.lean`.

## R12 (P3) — A code span with TeX subscripts is split across a line break

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1233–1234`, where "`h_{ν'}(T) = inf_n` … `H_{ν'}(ξ^n)/n`" is broken across the line break.

**Claim:** The broken span leaves `_{` outside a code span on each line.

**Witness:** Gate at c227c24 reports `tex=2`, at lines 1233 and 1234.

**Repair:** Put the formula in one unbroken span without braces: "and `h_ν'(T) = inf_n H_ν'(ξ^n)/n` is an infimum of functions continuous at `ν`."

## R13 (P3) — README shape and Checks

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md` headings (lines 163, 189, 1600, 1626); §6.1 (lines 1218–1227); Checks at lines 879–881 and 907–908.

**Claim:**
- These required sections are missing: `## Exact supplier contracts`, `## How to read the build`, the per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers`.
- §§0.5, 0.6, 1.0, 1.2, 4.5, 5.1 and 5.3 have only one or two Checks, and §6.1 has none.
- The §4.1 Check says the swap's label and its iterate "are equal", but `ξ ∘ T = 1 − ξ`.
- The §4.2 Check about the two-sided shift fails for `p = δ_a`.

**Witness:** The README's headings include none of the five required sections, and §6.1 has no **Checks.** block. For `p = δ_a` the shift is a point mod 0, so the first coordinate is a one-sided generator.

**Repair:**
- Recast "Existing library" and the two ownership tables as `## Exact supplier contracts`, with `### From Mathlib`, `### From Tau Ceti` and `### From TauCetiRoadmap.<X>` subsections.
- Recast "Layers and dependencies" as `## How to read the build`.
- End each layer with `### Examples` and `### Dependencies`, add `## Downstream consumers`, and fold "Completion checks" into the layers.
- Bring each listed section to three Checks. For §6.1: "The one-sided full 2-shift with `d(x,y) = 2^(-min{k | x k ≠ y k})` is positively expansive with constant `3/4`; the partition by `x 0` has atom diameter `1/2 < 3/4` and is a one-sided generator for every invariant measure."
- §4.1: "…because `ξ ∘ T = 1 − ξ` generates the same partition as `ξ`, so the two labels are not independent."
- §4.2: "for the two-sided shift with nondegenerate `p`, …".

## R14 (P3) — The pull-request description omits suppliers on main and describes stand-ins

**Location:** Pull-request description: "The generic map foundations are consumed from the prerequisite proposals #1421 (…), #851 (…) and #1335 (…), with explicitly marked prototype stand-ins." and "Full `lake build` is running; the result will be recorded here when it finishes."

**Claim:** The description does not name the suppliers on main (MarkovChainsAndRenewal Layers 0–3, AmenableGroups). It describes stand-ins that R03 removes, and the build sentence is a placeholder.

**Witness:** README lines 58–59 and §§0.3, 1.4, 2.5 and 4.6 cite MarkovChainsAndRenewal and AmenableGroups, and the description names neither.

**Repair:** Use: "Suppliers: GeometryOfNumbersAndQuadraticArithmetic §4.2, ProbabilisticAndMetricNumberTheory §§4.1–4.3, 4.6, 5.1a and ArithmeticDynamics §§2.6–2.7 (open, earlier in the merge order), and MarkovChainsAndRenewal Layers 0–3 and AmenableGroups on main. Suggested.lean states the headline theorems statable at the pins; its docstring lists those whose carriers the open suppliers own as not statable." Delete the "Full `lake build` is running" line.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.4 inducedMap, Kac (noninvertible) | rotation by 1/3, `A=[0,1/3)`; one-sided fair shift, `A={x 0=0}` | return time 3, induced map id; `∫_A r_A = 1`, conditional mean 2 | holds | none |
| §0.5 `orbitLabel`, `orbitEntourage` | `F = ∅`; `F = {1}` | ∅: one-point label space, `H = 0`, entourage univ; {1}: label `ξ`, entourage `U` | holds | Checks (R13) |
| §1.0 `MixingAlong.weakMixingSMul` | `l = pure m₀`; `l = ⊥` | pure: `A = m₀⁻¹B` forces `μB = μB²`, trivial σ-algebra, weakly mixing; ⊥ excluded by `NeBot` | holds | none |
| §1.1 item 4 | identity on two points, `A=B={0}` | correlation 1/2 for all n, converges along ℕ; `μAμB = 1/4`; square not ergodic | false | R01 |
| §1.1 `weakMixing_iff_tendsto_cesaro` | swap on two points; one point | swap: `|corr − 1/4| = 1/4` for all n, Cesàro 1/4, not weakly mixing; point: 0, weakly mixing | holds | none |
| §1.1 `WeakMixing.ergodic_prodMap_of_ergodic` | irrational rotation R | R has eigenfunction `e^{2πix}`; R×R preserves `{x−y ∈ [0,1/2)}`, measure 1/2 | consistent | none |
| §1.5 relative weak mixing | identity two-point base × fair Bernoulli fibre | invariant sets of `Z×W×W` are base pullbacks; `{z}×W×W` invariant, measure 1/2, not ergodic | holds | none |
| §2.1 spectral measure | rotation by a, `f = e^{2πinx}`; `f = (−1)^{x 0}` | `⟪f,Uᵏf⟫ = e^{2πinak}`, measure `δ_{e^{2πina}}`; correlations 1,0,0,…, so Haar; matches Sarig Def 3.6 | holds | none |
| §2.2 Wiener's lemma | `σ = δ₁ + δ₋₁`, `λ = −1` | `|σ̂(n)|² = 4,0,4,…`, mean 2 = 1²+1²; `(1/N)Σ(−1)ⁿ(1+(−1)ⁿ) → 1 = σ{−1}` | holds | R05 |
| §2.3 items 1, 3, 4 | swap, identity on two points; isometry U | swap eigenvalues ±1 simple; identity eigenvalue 1 twice, not ergodic; `Ue=λe` gives `U*e=λ̄e`, so `H_c` invariant | holds | none |
| §2.5 Følner mean ergodic theorem | `v = U_h w − w`, left Følner F | `‖A_F v‖ ≤ #(h⁻¹F Δ F)‖w‖/#F → 0`; Creutz Thm 13.7 window `F⁻¹`, `π(γ)f = f∘γ⁻¹` agrees | holds | R05 |
| §3.2 `weakMixingVAdd_real_iff`, `…_weakMixing` | unit-speed circle flow | `e^{2πix}` has frequency 1, nonconstant, so not weakly mixing; time-1 map is id, not weakly mixing | holds | none |
| §3.3 suspension | roof ≡ c; one-point base | `g ≡ 1`, `e^{2πiαc} = 1`, so `α = 1/c`, eigenfunction `e^{2πis/c}`; one-point base gives rotation flow on `AddCircle c` | holds | none |
| §3.4 invariant measures of flows | circle flow; trivial flow | flow-invariant `{volume}`; `ϕ 1 = id` gives all probabilities; `(ϕ t)_*ν̄ = ν̄` from `ϕ 1`-invariance | holds | none |
| §4.1 items 4, 5 | `a = 0`, `h_μ = ⊤`; swap, point partition | `0·⊤ = 0`, both sides `h_ν`; `H(ξⁿ) = log 2`, rate 0 < log 2; `ξ∘T = 1−ξ` | holds | R13 wording |
| §4.3 Bernoulli, Markov | (1/2,1/2), (1/3,1/3,1/3), `δ_a`; two-state κ | log 2, log 3, 0 (Sarig Prop 4.6); `−Σ ½κᵢⱼ log κᵢⱼ = −(p log p + (1−p) log(1−p))` (Prop 4.8) | holds | R07 |
| §4.4 Abramov (induced maps) | one-sided fair shift, `A = {x 0 = 0}` | spanning, noninvertible: `h_A = log 2/(1/2) = 2 log 2` (Sarig Thm 4.6); outside README hypotheses | narrow | R08 |
| §4.6 `actionPartitionEntropyRate_tendsto` | ℤ/2 acting trivially; ℤ Bernoulli coordinate | ℤ/2: limit `H(ξ)/2` = infimum at `F = G`; ℤ: `H(ξ^F)/#F = H(p)` for every F | holds | R03 |
| §4.7 tempered pointwise theorem | temperedness bound | `#(⋃_{k<n} F_k⁻¹F_n) ≤ C#F_n` is the `TemperedFolnerSequence` bound with counting Haar measure | duplicate | R04 |
| §4.8 `measureEntropy_factor_add_relative` | π = id; π to a point | 𝒜 full: relative entropy 0, `h = h + 0`; 𝒜 trivial: `h = 0 + h`; `T⁻¹𝒜 ⊆ 𝒜` gives subadditivity | holds | R03 |
| §5.4 pressure | identity on finite F; 2-shift with potential a/b on `x 0` | `(1/n)log Σ e^{nφ(x)} → max φ`; `Σ_words e^{S_nφ} = (eᵃ+eᵇ)ⁿ`, so `log(eᵃ+eᵇ)` | holds | none |
| §6.4 `measureEntropy_flow` | t = 0; t = −1 | `h(id) = 0 = ofReal 0 · h` (`0·⊤ = 0`); `h(T⁻¹) = h(T)` | holds | R03 |
| §7.1 `topologicalPressure_eq_iSup` | identity on finite F; X = ∅ | supremum `max φ`, attained on maximizers; empty: net sums 0, so LHS ⊥; no probabilities, so RHS ⊥ | holds | R03 |
| §7.3 `flowTopologicalPressure_eq_iSup` | unit-speed circle flow | LHS `∫F dvolume` (§5.5 Check); RHS only volume: `0 + ∫F` | holds | R03 |
| §8.2 `exists_isEquilibriumState` | identity on finite F; entropy supremum ⊤ | ν supported on argmax φ; upper semicontinuity gives `h_ν = ⊤`, `⊤ + ∫φ = ⊤ = P` | holds | R03 |
| §9.1 reflection | triangle 0, 1, I | side [0,1]: `σ(I) = conj I = −I`; hypotenuse `e² = −i`, `(a,b)↦(−b,−a)`; generated group order 8 | holds | none |
| §9.3 `exists_billiardFlow` | unit square, `1/2 + I/4`, direction 1 | `τ = 1/2`, `q = 1+I/4`; `e = i`, `v' = e²·conj 1 = −1`; `F(1/2+s) = (1−s+I/4, −1)` | holds | none |

- Gate rerun at c227c24: FAIL, with `set_option=1`, `tex=2`, `prnum=38`, `statement-hygiene=1` and `readme-ids-missing=4`. Imports, stray files, depcheck and the outside-folder diff are clean.
- Depcheck output: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- Elaboration: `lake env lean Suggested.lean` gives 21 warnings, all `declaration uses sorry`. The scratch copy without `set_option` and with R05's three statements gives 24 `sorry` warnings and no errors.
- Signatures: 84 elaborated types compared with the README. The 19 dropped-binder leads are all on definitions whose bodies do not use the binder; no theorem lost a hypothesis.
- One-tactic probe on 6 theorems: 4 close (R06); `measurePreserving_inducedMap` and the variational principles do not.
- Sources: no locator at the 15 sampled targets. Statements checked against Sarig (author page): Theorem 1.6, Theorem 3.2, Definition 3.6, Proposition 3.3, Theorem 4.3, Propositions 4.6 and 4.8, Theorem 4.6. Also against Creutz Theorems 10.8 and 13.7.
- Library and supplier names: 72 cited names searched at the pins, 3 absent (R09). Supplier names resolved at the open heads: GeometryOfNumbersAndQuadraticArithmetic §4.2 (9 names), ProbabilisticAndMetricNumberTheory §§4.1, 4.6, 5.1a, and ArithmeticDynamics §§2.6–2.7. MarkovChainsAndRenewal and AmenableGroups are on main.
- Overlap check: read ProbabilisticAndMetricNumberTheory, GeometryOfNumbersAndQuadraticArithmetic, ArithmeticDynamics, Equidistribution, PointProcesses, Exchangeability, OptimalTransport, StochasticCalculus and FactorRigidity. Shared objects and owners:
  - tempered amenable pointwise theorem, measure entropy, Koopman representation and Kac's lemma: GeometryOfNumbersAndQuadraticArithmetic §4.2 (R03, R04);
  - `IsStrongMixing`: ProbabilisticAndMetricNumberTheory §4.6;
  - Shannon–McMillan–Breiman, `h_μ ≤ h_top` and ergodic decomposition: ArithmeticDynamics §2.7.
  - Equidistribution and PointProcesses defer ergodic theorems to an ergodic-theory roadmap. FactorRigidity §8.2 defines weak mixing on tracial von Neumann algebras, a different carrier. OptimalTransport's gluing lemma is existential.

## Not verifiable

- Walters 1982, Cornfeld–Fomin–Sinai 1982, Einsiedler–Ward 2011, Downarowicz 2011, Glasner 2003 and Tabachnikov 2005 are publisher books, not fetched. The README cites only chapters of them, so there was no locator to check.
- Lindenstrauss (Invent. Math. 146), Ward–Zhang (Monatsh. Math. 114), Ornstein–Weiss (J. Analyse Math. 48), Chung (ETDS 33), Bowen–Ruelle (Invent. Math. 29), Brin–Katok (LNM 1007), Moulin Ollagnier (LNM 1115), Abramov 1959 and Masur–Tabachnikov 2002 are paywalled journals or books, not fetched; no theorem locators are given for them.
- Kechris–Miller, LNM 1852, Lemma 6.7 is paywalled, so the README's one explicit lemma locator is unchecked.
- MathematicalBilliards appears in the merge order but has no README on main, at an open head or in the board index, so Layer 9's ownership against it was not checked.

## Source issues

- none
