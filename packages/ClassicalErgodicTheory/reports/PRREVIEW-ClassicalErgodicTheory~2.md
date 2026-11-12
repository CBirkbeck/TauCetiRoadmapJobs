# Review of ClassicalErgodicTheory (pull request #2231 at 82466a3)

**Verdict:** needs changes

## R01 (P1) — §1.1 item 4 omits the limit, so the equivalence is false

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:519–520`, "for all measurable `A`, `B` there is a set `J ⊆ ℕ` of natural density one along which the correlations converge".

**Claim:** Not repaired (previous R01). Item 4 holds for systems that are not weakly mixing, so 1 ⇔ 4 is false.

**Witness:** Identity on two equiprobable points, `A = B = {0}`: correlation `1/2` for every `n`, convergent along `J = ℕ`, but `1/2 ≠ 1/4 = μ A μ B`; `Prod.map id id` is not ergodic. Sarig2023 line 4519–4524 (Theorem 3.2(3), p. 91) gives the limit `µ(E)µ(F)`.

**Repair:** Replace item 4 with "for all measurable `A`, `B` there is a set `J ⊆ ℕ` of natural density one with `μ.real (A ∩ T^[n] ⁻¹' B) → μ.real A * μ.real B` as `n → ∞` along `J` (density defined by `#(J ∩ range N)/N → 1`);". Add the Check: "The identity on two equiprobable points has correlation `1/2 ≠ 1/4` for `A = B = {0}` along every `J`, so it fails item 4, as it fails item 1."

## R02 (P1) — §5.3's positive-expansiveness target has no instance

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1319–1320`, "`toralEndomorphism A` with `A.det = ±1` and no eigenvalue of modulus 1 is an expansive homeomorphism, that it is positively expansive when every eigenvalue has modulus `> 1`".

**Claim:** "it" carries `A.det = ±1`, and no such `A` has every eigenvalue of modulus `> 1`, so the positive-expansiveness target is vacuous. The intended expanding endomorphisms are not invertible.

**Witness:** `|det A| = ∏ |λᵢ| = 1` rules out `|λᵢ| > 1` for every `i`. For example, the cat map `!![2,1;1,1]` has eigenvalues `(3 ± √5)/2 ≈ 2.618, 0.382`.

**Repair:** Replace with "`toralEndomorphism A` with `A.det = ±1` and no eigenvalue of modulus 1 is an expansive homeomorphism; for every `A` with `A.det ≠ 0` and every eigenvalue of modulus `> 1` (for example `!![2,0;0,2]`), `toralEndomorphism A` is positively expansive;".

## R03 (P2) — Kolmogorov–Sinai entropy is claimed here although two earlier roadmaps own it

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:67–78`, "**Kolmogorov–Sinai entropy is owned here.** … GeometryOfNumbersAndQuadraticArithmetic … and ArithmeticDynamics … state the same objects". Also §§4.0, 4.10 and 6.1 (lines 973–1014, 1219–1246, 1415–1433) and `Suggested.lean:20–24, 49–89`.

**Claim:** Partly repaired (previous R03). The previous head consumed these objects. This head instead plans them as their owner, although two roadmaps earlier in the merge order already own them, so one object now has three plans.

**Witness:** GeometryOfNumbersAndQuadraticArithmetic `README.md:1362` (3b084ef) defines the five entropy names; ArithmeticDynamics `README.md:71–79, 2492–2530, 2608–2650` (ae79f44) owns the supremum formula, SMB, the decomposition, Goodwyn's bound and null-boundary partitions. Merge order: lines 54, 342 before 408.

**Repair:**
- **README, ownership.** Delete lines 67–78 and add two rows to the ownership table:
  - "Countable-label and conditional label entropy, itineraries, entropy rates and measure entropy (`countablePartitionEntropy`, `conditionalPartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate`, `measureEntropy`) | GeometryOfNumbersAndQuadraticArithmetic §4.2";
  - "Finite-partition supremum formula, conditional entropy given a σ-algebra, map Shannon–McMillan–Breiman, endomorphism ergodic decomposition with entropy integration, small null-boundary partitions and `h_μ(T) ≤ h_top(T)` | ArithmeticDynamics §§2.6–2.7".
- **README, sections.**
  - §4.0: reduce to a paragraph that consumes these objects. Keep only statements they do not make, each with one clause saying how it differs.
  - §4.10: reduce to extending ArithmeticDynamics §2.7's SMB to countable labels of finite entropy.
  - §6.1: cite §2.7 for the partitions and for Goodwyn's bound.
  - Restore these citations in the *Needs:* lines of §§4.1–4.2, 4.7–4.8, 6.1–6.4 and 7.1.
- **`Suggested.lean`.** Replace lines 20–24 with "`countablePartitionEntropy`, `iteratedPartitionLabel`, `partitionEntropyRate`, `measureEntropy` and `condPartitionEntropy` restate GeometryOfNumbersAndQuadraticArithmetic §4.2 and ArithmeticDynamics §2.7 only to make the headline theorems below statable." Delete `conditionalPartitionEntropy` (no statement uses it) and `measureEntropy_eq_iSup_finite` (it is ArithmeticDynamics §2.6's theorem).

## R04 (P2) — §4.7 re-plans GeometryOfNumbersAndQuadraticArithmetic's tempered pointwise ergodic theorem

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1141–1147`, "prove the pointwise ergodic theorem along a tempered left Følner sequence `F_n` … Build the tempered covering estimate and weak `(1,1)` maximal inequality".

**Claim:** Not repaired (previous R04). A roadmap earlier in the merge order already owns the theorem, its maximal inequality and the same temperedness bound.

**Witness:** GeometryOfNumbersAndQuadraticArithmetic `README.md:1346` (head 3b084ef) has `TemperedFolnerSequence` with the bound `η(⋃_(k<j) A_k⁻¹A_j)≤Cη(A_j)`, `tempered_action_maximal_inequality` and `tempered_action_pointwise`, whose limit is the conditional expectation on invariants. It includes the finite-group case.

**Repair:** Replace lines 1141–1147 with: "For a countable discrete amenable group acting on a standard Borel probability space, the pointwise ergodic theorem along a tempered left Følner sequence is GeometryOfNumbersAndQuadraticArithmetic §4.2 `tempered_action_pointwise`, with counting measure as Haar measure. Its `TemperedFolnerSequence` bound is `#(⋃ k < n, F_k⁻¹ * F_n) ≤ C * #F_n` (Lindenstrauss1999, Definition 1.2, p. 83). Prove that every Følner sequence has a tempered subsequence (Lindenstrauss1999, Proposition 1.5, p. 84), and identify the ℤ-interval case with ProbabilisticAndMetricNumberTheory §4.1 `birkhoff_pointwise`." Add `tempered_action_pointwise` to the GeometryOfNumbersAndQuadraticArithmetic row and to §4.7's *Needs:* line.

## R05 (P2) — Layer 9 re-plans MathematicalBilliards and restates Tau Ceti's simple polygon

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1860–1994` (Layer 9) and line 51; `Suggested.lean:709–833`.

**Claim:** A roadmap earlier in the merge order owns polygonal tables with holes, their phase space, singular set, billiard flow and Liouville measure. `SimplePolygon` restates a structure that is already in Tau Ceti at the pin.

**Witness:** `packages/MathematicalBilliards/design/README.md` line 7 and §§7.1–8.3 (lines 505–600); design accepted 2026-11-11; merge-order line 407, before 408. Tau Ceti has `TauCeti.SimplePolygon` (`TauCeti/Geometry/Polygon/Simple.lean:767`) and `Polygon.IsSimple.isJordanCurve_boundary` (line 614).

**Repair:**
- Delete Layer 9 and the `Billiards` section of `Suggested.lean`.
- Add the ownership row "Polygonal tables with holes, phase space, singular set, billiard flow and Liouville measure | MathematicalBilliards Layers 7–8".
- In §3.5 item 1, replace "Layer 9's billiard flow" with "MathematicalBilliards §8.2's billiard flow".
- Drop billiards from the opening paragraphs, from the scope row at line 51 and from the build table.

## R06 (P2) — Weak mixing of real flows and its eigenfunction criterion have two owners

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:806–812` (§3.2 items 1–3), 686–687 ("Give the analogue for finite measures on `ℝ`") and 289–299 (strong continuity of the Koopman representation); `Suggested.lean:416–420`.

**Claim:** MathematicalBilliards, earlier in the merge order, owns four results for measure-preserving ℝ-actions: weak mixing, strong continuity of the Koopman group, Wiener's lemma on ℝ and the eigenfunction criterion. §3.2 restates that criterion over a second definition of the same notion.

**Witness:** `packages/MathematicalBilliards/design/README.md` line 7; §12.1 defines `Billiards.IsWeaklyMixing` in Cesàro form (line 802); §12.3 (line 830), §12.4 (line 838) and §12.5 `Billiards.isWeaklyMixing_iff` (line 862) cover the rest.

**Repair:**
- Add the ownership row "Weak mixing of measure-preserving ℝ-actions (`Billiards.IsWeaklyMixing`), strong continuity of their Koopman groups, Wiener's lemma on `ℝ` and the eigenfunction criterion (`Billiards.isWeaklyMixing_iff`) | MathematicalBilliards §§12.1–12.5".
- In §3.2, replace items 1–3 with "Prove that `WeakMixingVAdd ℝ X μ` is equivalent to the Cesàro decay of MathematicalBilliards §12.1; with §12.5 this gives the eigenfunction criterion."
- Delete the ℝ sentence of §2.2. In §0.2, cite MathematicalBilliards §12.3 for `G = ℝ`.
- In `Suggested.lean`, replace `weakMixingVAdd_real_iff` with the following statement. It elaborates at the pins with the `Layer3` section's binders.

```lean
/-- Layer 3.2: diagonal weak mixing of a real flow is Cesàro decay of set correlations. -/
theorem weakMixingVAdd_real_iff_tendsto_cesaro :
    WeakMixingVAdd ℝ X μ ↔ ∀ A B : Set X, MeasurableSet A → MeasurableSet B →
      Tendsto (fun T : ℝ => T⁻¹ * ∫ t in (0 : ℝ)..T,
          |μ.real (A ∩ (t +ᵥ ·) ⁻¹' B) - μ.real A * μ.real B|) atTop (𝓝 0) := by
  sorry
```

## R07 (P2) — `set_option` in Suggested.lean

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:27`, `set_option autoImplicit false`.

**Claim:** Not repaired (previous R02). `Suggested.lean` may contain no `set_option` of any kind, and the gate fails on this line.

**Witness:** The gate at 82466a3 reports `set_option=1 … FAIL`, at line 27. A scratch copy without line 27 elaborates with only `declaration uses sorry` warnings.

**Repair:** Delete line 27.

## R08 (P2) — Statable headlines are missing, and the docstring names no non-statable headline

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:7–25`, "The statements here suggest Lean forms for particular milestones … discharging all of them finishes neither a layer nor the roadmap." The headline list is at `README.md:13–24`.

**Claim:** Not repaired (previous R05). Four headlines can be stated at the pins and are absent:
- Wiener's lemma (§2.2);
- weak mixing of a map as the absence of nonconstant `L²` eigenfunctions (§2.3);
- the Følner mean ergodic theorem (§2.5);
- the amenable variational principle (§7.4), whose carriers the file already defines.

Six more headlines are neither stated nor named as not statable: the generator theorem, the Bernoulli, Markov and toral entropies, natural-extension entropy, Brin–Katok and the Ruelle–Perron–Frobenius theorem.

**Witness:** Appended to a copy of `Suggested.lean`, the four statements below elaborate against the pinned Mathlib and Tau Ceti with only `sorry` warnings.

**Repair:**
- **Docstring.** Replace lines 7–25 with "Classical ergodic theory: target signatures. The roadmap is README.md; this file is not the roadmap. It states the roadmap's headline theorems against the pinned Mathlib and Tau Ceti." Follow it with one sentence for each headline that is not stated, naming the carrier it lacks.
- **Four statements.** Add:

```lean
/-- Layer 2.2: Wiener's lemma. -/
theorem tendsto_cesaro_norm_moment_sq (σ : Measure Circle) [IsFiniteMeasure σ] :
    Tendsto (fun N : ℕ => (N : ℝ)⁻¹ * ∑ n ∈ Finset.range N, ‖∫ z, (z : ℂ) ^ n ∂σ‖ ^ 2) atTop
      (𝓝 (∑' z : Circle, σ.real {z} ^ 2)) := by
  sorry

/-- Layer 2.3: weak mixing of a map is the absence of nonconstant `L²` eigenfunctions. -/
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

/-- Layer 7.4: the amenable variational principle. -/
theorem actionTopologicalPressure_eq_iSup {G X : Type*} [Group G] [Countable G] [Infinite G]
    [MeasurableSpace G] [MeasurableSingletonClass G]
    [MetricSpace X] [CompactSpace X] [Nonempty X] [MeasurableSpace X] [BorelSpace X]
    [MulAction G X] (hcont : ∀ g : G, Continuous fun x : X => g • x)
    (hamen : (maxFoelner G (Measure.count : Measure G)).NeBot) (φ : C(X, ℝ)) :
    actionTopologicalPressure (G := G) φ =
      ⨆ ν ∈ actionInvariantProbabilities G (X := X),
        ((actionMeasureEntropy (G := G) (ν : Measure X) : EReal) +
          ((∫ x, φ x ∂(ν : Measure X) : ℝ) : EReal)) := by
  sorry
```

- **The other six headlines.** State the generator theorem, the Bernoulli, Markov and toral entropies, natural-extension entropy, Brin–Katok and the Ruelle–Perron–Frobenius theorem on the file's carriers, or name each in the docstring with the carrier it lacks.

## R09 (P3) — Padding and unused definitions in Suggested.lean

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:36–47, 346–350, 385–399, 444–449, 504–508, 542–545, 597–600, 656–691`, and the definitions listed under Repair.

**Claim:** Not repaired (previous R06), and the head adds more padding. These declarations restate a definition, close in one tactic, treat a boundary case, mirror a README Check or are API lemmas rather than headlines. The listed definitions serve no statement. `spectralMeasureAction` also fails the gate's statement-hygiene rule (`Classical.choose`).

**Witness:** In a scratch copy, each of four theorems closes in one step:
- `isStrongMixing_iff` by `Iff.rfl`;
- `spectralMeasureAction_spec` by `exact` of `Classical.choose_spec`;
- `ruelleOperator_fullShift_one` by `simp [ruelleOperator, consSeq]`;
- `isMeasureOfMaximalEntropy_iff` by `simp` with `topologicalPressure_zero`.

**Repair:**
- **Theorems and their definitions.** Delete:
  - `IsStrongMixing` with `isStrongMixing_iff`. Keep the definition only if the spectral criterion for mixing is stated with it.
  - `spectralMeasureAction` and `spectralMeasureAction_spec`.
  - `information`, `information_zero` and `information_one`.
  - `topologicalPressure_zero` and `isMeasureOfMaximalEntropy_iff`.
  - `map_withDensity_flow` and `flow_coboundary_of_hasDerivAt`.
  - `ruelleOperator_fullShift_one`, and also `consSeq` and `ruelleOperator` unless the Ruelle–Perron–Frobenius theorem is stated.
- **Unused definitions.** Delete `IsJoining`, `MixingVAdd`, `IsWeakMixingRepresentation`, `RelativelyWeakMixing`, `flowCorrelation`, `holderNorm`, `IsExponentiallyMixing`, `IsFlowEquilibriumState`, `sftTwoSided` and `sftOneSided`.
- **Amenable carriers.** Keep `actionTopologicalPressure`, `actionPressureAlong`, `actionPressureNetSum`, `orbitEntourage`, `actionMeasureEntropy` and `actionInvariantProbabilities` only together with R08's amenable variational principle.
- The README keeps every statement.

## R10 (P3) — Abramov's formula for induced maps is narrower than its source

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1081–1083`, "for an ergodic invertible system and measurable `A` with `μ A > 0`, the entropy of `inducedMap T A` for the normalized restriction is `h_μ(T) / μ A`."

**Claim:** Not repaired (previous R08). The source needs neither ergodicity nor invertibility, only a spanning set, and §0.4 already builds `inducedMap` for non-invertible maps.

**Witness:** Sarig2023 line 5776–5780 (Theorem 4.6, p. 116). One-sided fair shift, `A = {x 0 = 0}`: spanning, not invertible, induced entropy `2 log 2 = log 2 / (1/2)`; the README's hypotheses exclude it.

**Repair:** "Prove **Abramov's formula for induced maps** (Sarig2023, Theorem 4.6, p. 116): for a probability-preserving `T` on a standard Borel space and measurable `A` with `μ A > 0` and `μ (⋃ n, T^[n] ⁻¹' A) = 1`, the entropy of `inducedMap T A` for the normalized restriction is `h_μ(T) / μ A`." Add the Check: "The one-sided fair shift with `A = {x 0 = 0}` gives `2 log 2`."

## R11 (P3) — The sampled targets carry no theorem-level locator

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md` §§0.7, 1.4, 2.3, 4.2, 4.5, 4.7 and 6.1. For example, line 1039 reads "Prove the **Kolmogorov–Sinai theorem**: for a one-sided generator `h_μ(T) = h_μ(T, ξ)`".

**Claim:** Not repaired (previous R07). Every theorem needs an exact locator at the claim, and the package manifest records locators that the README never cites. In §6.1 the source needs only a Borel map, so the README narrows the statement.

**Witness:** The README's only theorem-level locator is Kechris–Miller Lemma 6.7 (line 372). `sources.toml` lists Sarig2023 Theorems 1.6, 3.2, 4.4, 4.6 and Lindenstrauss1999 Proposition 1.5, none cited. Sarig2023 line 5564–5566 (Proposition 4.5) assumes only a Borel map.

**Repair:** Add these locators at the claims, and in §6.1's partition-limit statement replace "continuous `T`" with "Borel `T`":
- §0.7: (Sarig2023, Definition 1.17 and Lemma 1.2, p. 24; Theorem 1.6, p. 26).
- §1.4, items 2–3: (Sarig2023, Proposition 1.7, p. 11; Corollary 1.1, p. 14).
- §2.3, item 1: (Sarig2023, Theorem 3.2, p. 91; Proposition 3.3, p. 93, for the invertible case).
- §4.2: (Sarig2023, Definition 4.4 and Theorem 4.4, p. 111). For zero entropy with a one-sided generator: (Sarig2023, proof of Proposition 4.7, p. 114).
- §4.5: (Sarig2023, Definition 3.8 and Proposition 3.5, p. 96).
- §4.7: (Lindenstrauss1999, Definition 1.2 and Theorems 1.3–1.4, p. 83; Proposition 1.5, p. 84).
- §6.1: (Sarig2023, Proposition 4.5, p. 112; Theorem 4.7, p. 119).
- §§3.4, 3.5 and 6.2: a theorem number in Walters1982, or in Mackey (1962) for §3.5.

## R12 (P3) — Two library citations are not at the pins

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:198`, "Tau Ceti `MeasurePreserving.trim_comap`"; line 213, "Tau Ceti `IsStarNormal` compact spectral theorem (`TauCeti/Analysis/InnerProductSpace/Spectral/CompactNormal.lean`)"; line 58, "compact normal operators".

**Claim:** Not repaired (previous R09): neither declaration exists at the pins. Previous R09 was wrong about its third citation: `Measure.disintegrate` is at Mathlib `Probability/Kernel/Disintegration/Basic.lean:62`, so that citation stays.

**Witness:** `TauCeti/Dynamics/Ergodic/MeasurePreserving.lean` declares only `isFiniteMeasure` (line 27). `TauCeti/Analysis/InnerProductSpace/Spectral/` contains only `Eigenframe.lean`.

**Repair:**
- Replace the first citation with Mathlib `MeasureTheory.map_trim_comap` (`Mathlib/MeasureTheory/Measure/Trim.lean:64`).
- Replace the second with Tau Ceti `ContinuousLinearMap.exists_hilbertBasis_forall_hasEigenvector` (compact self-adjoint operators, `TauCeti/Analysis/InnerProductSpace/Spectrum.lean:152`), applied to `K* K` in §2.4.
- At line 58, write "compact self-adjoint operators".

## R13 (P3) — The README names theorems as this roadmap's own that Suggested.lean does not declare

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- lines 577–578: `isStrongMixing_iff_mixingVAdd`, `weakMixing_iff_weakMixingVAdd`;
- line 822: `mixingVAdd_real_iff`;
- line 1598: `isEquilibriumState_iff_isMaxOn`;
- line 289: `scalarLpKoopman_continuous_of_measurable`;
- line 524: `WeakMixing.ergodic`, `IsStrongMixing.weakMixing`.

**Claim:** Not repaired (previous R10). A backticked name of this roadmap's own claims that `Suggested.lean` declares it, and none of these seven is declared.

**Witness:** The gate at 82466a3 reports `readme-ids-missing=4` for the first four names. None of the seven occurs in `Suggested.lean`.

**Repair:** State each fact in prose without the name:
- lines 577–578: "Prove that `T` is strongly mixing iff `MeasurableEquiv.zAddAction T` is `MixingVAdd`, and weakly mixing iff that action is `WeakMixingVAdd`";
- line 822: "Prove that the flow is mixing iff its time-1 map is strongly mixing";
- lines 1597–1598: "prove that these are exactly the measures attaining the suprema of Layer 7, and the flow analogue";
- line 289: "Prove that `g ↦ scalarLpKoopman p μ hμ g f` is continuous if …";
- line 524: "Prove that weak mixing implies ergodicity and that strong mixing implies weak mixing".

## R14 (P3) — Pull-request numbers, process wording and a source-led opening

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- lines 59–60, 64–65, 72–73, 99, 223–227, 287–307, 349–385, 505, 538, 970, 980, 1013, 1137, 1147, 1166, 1227 and 1234;
- lines 3–5: "starting from the single-transformation theory in Walters … and Cornfeld–Fomin–Sinai";
- lines 26–27 and 2025–2026.

Also `Suggested.lean:16–24, 40`.

**Claim:** Partly repaired (previous R11: 38 hits are now 26). Citations name a roadmap and a section, never a pull request or a revision. The text must be timeless, and a roadmap does not say it follows a source.

**Witness:** The gate at 82466a3 reports `prnum=26`. `Suggested.lean:17–18` reads "checked against revision d311ebe1 of that PR", and line 24 says names are "provisional".

**Repair:**
- Replace "PR #851" with "GeometryOfNumbersAndQuadraticArithmetic", "PR #1421" with "ProbabilisticAndMetricNumberTheory" and "PR #1335" with "ArithmeticDynamics", keeping each section number. Drop the links at lines 59–60.
- Replace lines 64–65 with "These roadmaps' sections are consumed with the names and signatures given there."
- Lines 3–5: "Develop classical ergodic theory for measure-preserving monoid actions, group actions and real flows. Develop the mixing hierarchy …".
- Lines 26–27: "[`Suggested.lean`](Suggested.lean) states the headline theorems."
- Delete lines 2025–2026.
- In `Suggested.lean`, R08's docstring replaces lines 16–24, and R09 deletes line 40.

## R15 (P3) — A code span with TeX subscripts is split across a line break

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1439–1440`, "`h_{ν'}(T) = inf_n` … `H_{ν'}(ξ^n)/n`".

**Claim:** Not repaired (previous R12). The broken span leaves `_{` outside a code span on each line.

**Witness:** The gate at 82466a3 reports `tex=2`, at lines 1439 and 1440.

**Repair:** "and `h_ν'(T) = inf_n H_ν'(ξ^n)/n` is an infimum of functions continuous at `ν`."

## R16 (P3) — README shape and Checks

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md` headings at lines 34, 192, 219, 1996 and 2028; §6.1 (lines 1415–1433); the Checks at lines 1028–1030 and 1056–1057.

**Claim:** Not repaired (previous R13).
- The README lacks `**Summary.**`, `## Exact supplier contracts`, `## How to read the build`, per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers`.
- §6.1 has no Checks. Most other subsections have a single prose paragraph or two bullets, for example §§0.5, 0.6, 1.2, 4.4, 4.5, 5.1, 5.3 and 6.3.
- §4.1's Check says the swap's label and its iterate "are equal".
- §4.2's Check fails for `p = δ_a`.

**Witness:** For the swap, `ξ(T x) = 1 − ξ(x) ≠ ξ(x)`. For `p = δ_a` the two-sided shift is a point mod 0, so the first coordinate is a one-sided generator.

**Repair:**
- **Shape.**
  - Recast "Existing library" and the ownership tables as `## Exact supplier contracts`, with `### From Mathlib`, `### From Tau Ceti` and `### From TauCetiRoadmap.<X>` subsections.
  - Recast "Layers and dependencies" as `## How to read the build`.
  - Add `**Summary.**`, per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers`.
  - Fold "Completion checks" into the layers.
- **Checks.** Give every definition three bulleted Checks. For §6.1: "The one-sided full 2-shift with `d(x,y) = 2^(-min{k | x k ≠ y k})` is positively expansive with constant `3/4`; the partition by `x 0` has atom diameter `1/2 < 3/4` and is a one-sided generator for every invariant measure."
- **§4.1:** "… because `ξ ∘ T = 1 − ξ` generates the same partition as `ξ`, so the two labels are not independent."
- **§4.2:** "For the two-sided shift with nondegenerate `p`, it is a two-sided but not a one-sided generator."

## R17 (P3) — `flowTopologicalPressure` names different objects in the README and in Lean

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1359–1364`, "define `flowTopologicalPressure ϕ F` as in 5.4 with `(t, ε)`-separated sets … Prove: 1. `flowTopologicalPressure ϕ F = topologicalPressure (ϕ 1) F₁`"; `Suggested.lean:566–569`.

**Claim:** The Lean body is the time-1 formula. Item 1 therefore holds by definition in Lean, while the README's Bowen-ball definition has no name.

**Witness:** `Suggested.lean:568–569` defines `flowTopologicalPressure ϕ F` as `topologicalPressure (ϕ 1) (fun x => ∫ s in (0 : ℝ)..1, F (ϕ s x))`.

**Repair:** In §5.5, write "Define `flowTopologicalPressure ϕ F` as `topologicalPressure (ϕ 1) F₁` with `F₁ x = ∫_0^1 F (ϕ s x) ds`. Prove: 1. it is the limit as `ε → 0` of the exponential growth rate in real `t` of the sums of `exp (∫_0^t F (ϕ s x) ds)` over `(t, ε)`-separated sets for the flow Bowen balls;". Keep items 2–4.

## R18 (P3) — The description omits suppliers, and its ownership and stand-in sentences need rewriting

**Location:** The pull-request description: "Kolmogorov–Sinai entropy (owned here, with the names GeometryOfNumbersAndQuadraticArithmetic uses)"; "`Suggested.lean` prototypes selected interfaces"; "with an explicitly marked prototype stand-in for `IsStrongMixing`."

**Claim:** Partly repaired (previous R14: the build placeholder is gone).
- The description names no supplier on main.
- After R03–R06 it also misses the new suppliers ArithmeticDynamics and MathematicalBilliards.
- "prototypes selected interfaces" misstates the role of `Suggested.lean`.

**Witness:** `README.md:61–62` cite MarkovChainsAndRenewal and AmenableGroups, both on main. R03–R06 make ArithmeticDynamics and MathematicalBilliards suppliers.

**Repair:**
- Replace the second and fourth paragraphs with: "`README.md` is the roadmap; `Suggested.lean` states its headline theorems that are statable at the pins. Suppliers: GeometryOfNumbersAndQuadraticArithmetic §4.2, ProbabilisticAndMetricNumberTheory §§4.1–4.3, 4.6, 5.1a, ArithmeticDynamics §§2.6–2.7 and MathematicalBilliards Layers 7–8 and 12 (earlier in the merge order), and MarkovChainsAndRenewal Layers 0–3 and AmenableGroups on main."
- In the first paragraph, replace "Kolmogorov–Sinai entropy (owned here, with the names GeometryOfNumbersAndQuadraticArithmetic uses)" with "Kolmogorov–Sinai entropy theory on GeometryOfNumbersAndQuadraticArithmetic's measure entropy", and drop "and polygonal billiard flows, including tables with holes".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| §0.5 `orbitLabel`, `orbitEntourage` | `F = ∅`; `F = {1}` | ∅: label into a one-point type, entropy 0, entourage `univ`; `{1}`: label `ξ`, entourage `U` | holds | R16 |
| §0.6 Radon probabilities | two-point discrete `X`; Dirac map | probabilities = segment `tδ₀ + (1−t)δ₁`; `f_* δ_x = δ_(f x)` | holds | R16 |
| §0.7 `existsUnique_naturalExtensionMeasure` | `T` invertible; doubling map | invariance and marginal force the law of `(x_0,…,x_n)` = image of μ under `y ↦ (T^n y,…,y)`; unique (Sarig Lemma 1.2) | holds | R11 |
| §1.4 examples | `!![0,1;1,0]`; switching two-state chain; Bernoulli | `x₁+x₂` invariant, not ergodic; period 2: ergodic, not mixing (Sarig Cor 1.1, p. 14); Bernoulli mixing (Prop 1.7, p. 11) | holds | R11 |
| §2.3 item 1 | swap; identity on two points | swap: eigenvalue −1, `T×T` invariant set of measure 1/2; Sarig Thm 3.2 needs a Lebesgue space, README route via §2.2 does not | holds | R11 |
| §3.4 | unit-speed circle flow; trivial flow | flow-invariant `{volume}`; `ϕ 1 = id`: all probabilities; averaging any ν over `[0,1]` gives volume | holds | none |
| §3.5 Mackey; transport | `T t x = x+t` off 0, `T t 0 = 0`; `W = 1_[0,1]` | flow law fails only on `{0, −t}`, null; `(Φ t)_*(W·Leb) = 1_[t,t+1]·Leb` | holds | R09 |
| §4.2 generators | one-sided fair shift; two-sided fair shift; `p = δ_a` | strong generator, `h = log 2`; not one-sided (else `h = 0`, Sarig p. 114); `δ_a`: point mod 0, first coordinate generates | Check false at `δ_a` | R16 |
| §4.4 Abramov | 3-cycle, `A` a point; one-sided fair shift, `A = {x0 = 0}` | `0 = 0/(1/3)`; induced Bernoulli `p_k = 2^-(k+1)`, entropy `2 log 2 = log 2/(1/2)`, outside README hypotheses | narrow | R10 |
| §4.5 Pinsker, K-systems | identity on two points; two-sided Bernoulli | all rates 0, `pinsker = ⊤`; past σ-algebra has `T⁻¹𝒦 ⊆ 𝒦`, as Sarig Def 3.8, p. 96 | holds | R11 |
| §4.7 tempered pointwise | Shulman bound | README bound = Lindenstrauss1999 (1.1), p. 83, index-shifted = GeometryOfNumbersAndQuadraticArithmetic `TemperedFolnerSequence` with counting Haar | duplicate | R04 |
| §6.1 small partitions | doubling map, dyadic partitions | diameters `2^-k → 0`, every rate `log 2`; Sarig Prop 4.5, p. 112, needs only a Borel map | holds, narrow | R11 |
| §6.2 upper semicontinuity | full 2-shift, Bernoulli `(1−1/k, 1/k) → δ_000…`; identity on `[0,1]` | entropies `H(1/k) → 0 = h(δ)`; entropy map ≡ 0 | holds | none |
| §8.1 definitions | `h_top = ⊤`; identity on finite `F` | `P ≡ ⊤`, equilibrium iff `h_ν = ⊤`; identity: equilibrium states = probabilities on argmax `φ` | holds | none |
| §9.3 billiard flow | unit square, `1/2 + I/4`, direction 1; triangle `0, 1, I` | `τ = 1/2`, `v' = −1`; reflections generate order 8, `|Re v|·|Im v|` invariant | holds | R05 |
| §1.1 item 4 | identity on two points, `A = B = {0}` | correlation 1/2 for all `n`, converges along ℕ; `μAμB = 1/4`; `T×T` not ergodic | false | R01 |
| `weakMixing_iff_tendsto_cesaro` | swap; one point | swap: `|corr − 1/4| = 1/4`, mean 1/4, not weakly mixing; point: 0; `N = 0` term `0⁻¹·0 = 0` | holds | none |
| `WeakMixing.ergodic_prodMap_of_ergodic` | irrational rotation `R`, `S = R` | `R` not weakly mixing; `R×R` preserves `{x−y ∈ [0,1/2)}`, measure 1/2 | consistent | none |
| `MixingAlong.weakMixingSMul` | `l = pure m₀` | `μ(A ∩ m₀⁻¹B) = μAμB` forces `μB ∈ {0,1}`; `μ⊗μ` is then 0–1, diagonal ergodic | holds | none |
| `relativeSelfJoining`, `RelativelyWeakMixing` | one-point base; identity base | `μ⊗μ`, relative = absolute weak mixing; diagonal measure, every invariant set a pullback | holds | none |
| `exists_small_completeSection` | rotation by 1/3 | `μ{T³x = x} = 1`, hypothesis fails; aperiodic invertible systems have no atoms (atom orbits are finite) | hypothesis needed | none |
| `measurePreserving_inducedMap` | rotation by 1/3, `A = [0,1/3)` | return time 3, induced map = identity on `A`, preserves `3·μ|_A` | holds | none |
| `measureEntropy_factor_add_relative` | `π = id`; `π` to a point | full conditioning: `h = h + 0`; trivial: `h = 0 + h` | holds | R03 |
| `topologicalPressure_eq_iSup` | `X = ∅`; identity on finite `F` | ∅: both sides `⊥`; `F`: both sides `max φ` | holds | none |
| `flowTopologicalPressure_eq_iSup` | unit-speed circle flow | `F₁ ≡ ∫F`, `P(id, F₁) = ∫F`; right side only volume: `0 + ∫F` | holds | R17 |
| `exists_isEquilibriumState` | identity on finite `F` | entropy ≡ 0 is upper semicontinuous; ν on argmax `φ` attains `max φ` | holds | none |
| `existsUnique_isEquilibriumState` | full 2-shift, `φ = w(x 0)`; identity on two points | unique Bernoulli `e^(w_i)/Σ e^(w_j)`; identity: expansive, no specification, two equilibrium states of `φ = 0` | holds | none |
| `isEquilibriumState_iff_toReal` | finite `h_top`; `X = ∅` | `h_ν ≤ h_top < ⊤` makes the `toReal` comparison exact; empty `X` has no ν | holds | none |
| `measureEntropy_flow` | `t = 0`; `t = −1` | `h(id) = 0 = 0·h` (`0·⊤ = 0`); `h(T⁻¹) = h(T)` | holds | R03 |
| §5.3 positive expansiveness | cat map; `!![2,0;0,2]` | det 1, eigenvalues 2.618, 0.382; det 4, eigenvalues 2, 2 | vacuous as written | R02 |
| Wiener's lemma (absent) | `σ = δ₁ + δ₋₁` | `|σ̂(n)|² = 4, 0, 4, …`, Cesàro mean 2 = `1² + 1²` | statable | R08 |
| Følner mean ergodic theorem (absent) | trivial representation | every average equals `v = P_fix v` | statable | R08 |
| amenable variational principle (absent) | trivial action of infinite `G` on finite `X` | entropy 0; both sides `max φ`, as the §5.6 Check | statable | R08 |
| §8.5 Check, roof depending on `x 0` | `r₀ = r₁ = 1` | `2e^(−c) = 1`, `c = log 2`, matching the constant-roof Check | holds | none |
| §8.6 Parry measure | golden-mean shift | `Σ_(i₁) μ[i₀i₁] = u_(i₀)(Av)_(i₀)/(λ u·v) = u_(i₀)v_(i₀)/(u·v)`: consistent marginals | holds | none |
| §8.2 Misiurewicz-type example | pieces `X_k`, entropies `log λ_k < log 2` | every mixture has `Σ a_k log λ_k < log 2`; supremum `log 2` not attained | holds | none |

- **Previous review (c227c24).** Of its 14 findings, 11 are not repaired (R01, R02, R04–R10, R12, R13) and 3 are partly repaired (R03, R11, R14). Its R09 claim about `Measure.disintegrate` was wrong.
- **Gate and dependency check.** Gate rerun at 82466a3: FAIL, with `set_option=1`, `tex=2`, `prnum=26`, `statement-hygiene=1` and `readme-ids-missing=4`. Imports, stray files and the outside-folder diff are clean. Depcheck: `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`.
- **Elaboration.** `lake env lean Suggested.lean` gives 29 warnings, all `declaration uses sorry`. I compared the `#check @` output for 80 declarations with the README: all 25 binder-loss leads are definitions that do not use the binder. A copy without `set_option`, with the five R06/R08 statements added, gives 34 `sorry` warnings and no errors.
- **One-tactic probe.** I tried five theorems; four close (R09), and `topologicalPressure_zero` does not close with one `simp`.
- **Sources.** 21 statements read at their locators: Sarig2023 Definitions 1.17, 3.5, 3.8 and 4.4, Lemma 1.2, Theorems 1.6, 1.7, 3.2, 4.4, 4.6 and 4.7, Propositions 1.7, 3.3, 3.5, 4.5 and 4.7, and Corollary 1.1; Lindenstrauss1999 Definition 1.2, Theorems 1.3–1.4 and Proposition 1.5.
- **Library.** I grepped 31 cited library names at the pins and 2 are absent (R12). Opened: Mathlib `Trim.lean:64`, `Disintegration/Basic.lean:62`, `NetEntropy.lean:254, 348`; Tau Ceti `Spectrum.lean:152`, `StronglyContinuous.lean:283`, `Polygon/Simple.lean:109, 614, 767`.
- **Cross-roadmap citations.** All resolved:
  - GeometryOfNumbersAndQuadraticArithmetic §4.2 at 3b084ef (10 names);
  - ProbabilisticAndMetricNumberTheory §§4.1, 4.6, 5.1a at d311ebe (5 names);
  - ArithmeticDynamics §§2.6–2.7 at ae79f44;
  - MarkovChainsAndRenewal Layers 0–3 and AmenableGroups Layer 5 on main (d551b7e);
  - MathematicalBilliards design §§7–8, 12.
- **Overlap check.** I read ProbabilisticAndMetricNumberTheory, ArithmeticDynamics, Equidistribution, PointProcesses, GeometryOfNumbersAndQuadraticArithmetic, Exchangeability, OptimalTransport, StochasticCalculus and MathematicalBilliards. Shared objects and their owners:
  - measure entropy and the tempered pointwise theorem: GeometryOfNumbersAndQuadraticArithmetic §4.2 (R03, R04);
  - SMB, the endomorphism decomposition, the finite-partition formula and Goodwyn's bound: ArithmeticDynamics §§2.6–2.7 (R03);
  - `IsStrongMixing`: ProbabilisticAndMetricNumberTheory §4.6 (consumed);
  - Koopman operators and invariant σ-algebras of maps: Exchangeability Layer 5 through Tau Ceti (consumed);
  - polygonal billiards and real-flow weak mixing: MathematicalBilliards (R05, R06);
  - Equidistribution, PointProcesses, OptimalTransport and StochasticCalculus share nothing.

## Not verifiable

- Settled as uncertified (paywalled), not read: Walters1982, CornfeldFominSinai1982, EinsiedlerWard2011, KechrisMiller2004, WardZhang1992, OrnsteinWeiss1987, BowenRuelle1975, BrinKatok1983, MoulinOllagnier1985, MasurTabachnikov2002 and Lindenstrauss2001. Kechris–Miller Lemma 6.7, the README's only theorem-level locator, is therefore unchecked.
- Not in the manifest and cited without theorem numbers, so there is no locator to check: Mackey 1962 (§3.5), Bowen 1974 and LNM 470 (§§8.4, 8.6), Franco 1977 (§8.5), Bowen–Walters 1972, Parry–Pollicott 1990, Abramov 1959, Glasner 2003, Downarowicz 2011, Tabachnikov 2005 and Misiurewicz 1973. I did not fetch them because this review edits no manifest.
- No cached legal text states §§0.5, 0.6, 3.4, 6.2, 8.1 or 9.3 at theorem level; I checked them only by computation (table).
- Lindenstrauss1999 Theorem 1.4 (p. 83) does not state §4.7's growth hypothesis `#F_n / log(n + 2) → ∞`. The published Lindenstrauss2001 is paywalled, so whether that hypothesis matches it is unchecked.

## Source issues

- none
