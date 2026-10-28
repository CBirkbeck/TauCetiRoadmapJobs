# Review of PointProcesses (pull request #417 at 234a33d)

**Verdict:** needs changes

The mathematics survived the adversarial pass: every statement I instantiated computed the same value on both sides (table under *Verified sound*), every Last–Penrose and Björk locator resolves to the theorem the README attributes to it, every cited Mathlib and Tau Ceti declaration exists at the pins, and the dependency check is clean. What blocks acceptance is form and policy: `Suggested.lean` carries 33 sorry'd data declarations and is an API catalogue rather than an acceptance test, and the README is not in the TauCetiRoadmap shape (no locators at claims, no per-definition Checks, 13 Lean blocks duplicating the Lean file, process narrative). The gate fails.

## R01 (P1) — sorry'd data in `Suggested.lean`

**Location.** `TauCetiRoadmap/PointProcesses/Suggested.lean`, 33 declarations, among them line 80 `instance : PolishSpace (LocallyFiniteMeasure S) := sorry`, line 135 `PointMeasure.enum`, line 257 `Measure.sigmaFiniteCondKernel`, line 325 `PointMeasure.factorial`, line 395 `poissonLaw`, line 409 `poissonPointKernel`, line 454 `nthPoint`, line 539 `markKernel`, line 703 `reducedSecondFactorialMomentMeasure`, lines 794–799 `renewalPalmLaw`/`stationaryRenewalLaw`, line 904 `eventTime`, line 916 `internalHistory`, line 956 `hazardCompensator`, line 1128 `windowHistory`, lines 1145–1157 `hawkesClusterKernel`/`stationaryHawkesLaw`; and the side-condition sorries in `dirac`, `insert`, `erase`, `restrict`, `ofTuple`, `finsum` (lines 111–131), the two `VAdd` instances (lines 681–685) and `windowRestrict` (line 1124).

**Claim.** The file follows the rule "no sorry'd data: no `def`, `abbrev`, `instance` or `opaque` whose body is `sorry`, and nothing that mentions one".

**Witness.** The gate's `sorry-data (33)` list; and two `sorry` terms inside theorem *statements*: line 660 `law P (fun ω => PointMeasure.finsum …) sorry` and line 1032 `⟨ν.prod (Measure.dirac ()), sorry⟩` (both show as `⋯` in the elaborated types). Roughly 90 of the 160 declarations mention a sorry'd carrier.

**Repair.** Two kinds of sorry need two repairs.
1. *True side conditions* (local finiteness and integer values of `dirac`, `insert`, `erase`, `restrict`, `ofTuple`, `finsum`, the `VAdd` maps, `windowRestrict`; `Nonempty`): prove them (each is a few lines: `map` by a homeomorphism preserves finiteness on compacts; `(μ.map f) A = μ (f ⁻¹' A)` preserves integer values; the two statement-level sorries are `Measurable` and `IsFiniteMeasureOnCompacts` facts that follow once these are proved). Give `internalHistory` and `windowHistory` real bodies as `Filtration`s built from `MeasurableSpace.comap` of the restrictions, as `initialEnlargement` already does.
2. *Heavy constructions* (`PolishSpace` instances, `enum`, `sigmaFiniteCondKernel`, `palmKernel`, `reducedPalmKernel`, `factorial`, `factorialMomentMeasure`/`janossyMeasure` as far as they depend on `factorial`, `poissonLaw`, `poissonPointKernel`, `poissonPointLaw`, `nthPoint`, `markKernel`, `reducedSecondFactorialMomentMeasure`, `renewalPalmLaw`, `stationaryRenewalLaw`, `eventTime`, `hazardCompensator`, `hawkesClusterKernel`, `stationaryHawkesLaw`): delete them and everything that mentions them; they stay README targets with their intended signatures. Restate each headline either on native carriers or in existence form, and name in the module docstring the ones that are not statable:
   - Polishness: `theorem polishSpace_locallyFiniteMeasure : PolishSpace (LocallyFiniteMeasure S)` (the topology and Borel structure have real bodies, so this is statable as a theorem, not an instance).
   - Mecke, the Mecke iff, the exponential Laplace formula, marking, mapping, superposition, the compound-Poisson characteristic function, and the Cox Laplace/variance/simplicity statements are already on real carriers (`IsPoissonRandomMeasure`, `laplaceFunctional`, `intensity`, `campbellMeasure`, `IsCox` once `poissonPointKernel` is replaced by "`N` is Poisson given `Λ`" through `IsPoissonRandomMeasure` of a conditional law, or by an existence form); keep those.
   - Palm: `∃ κ : Kernel X T, IsMarkovKernel κ ∧ intensity P N ⊗ₘ κ = campbellMeasure P N Y` plus the a.e.-uniqueness clause, instead of the sorry'd `sigmaFiniteCondKernel`/`palmKernel`.
   - GNZ and its converse: replace `HasPoissonDensity` (which needs `poissonPointLaw`) by a hypothesis "`N'` on some `(Ω', P')` satisfies `IsPoissonPointProcess P' N' (μ.restrict W)` and `P.map N = (P'.map N').withDensity f`".
   - Watanabe, random time change, Poisson embedding, the Lipschitz existence theorem, the refined Campbell theorem, Slivnyak's iff, Palm–Khinchin inversion and the Voronoi identity are all on real carriers once the side conditions above are proved; keep them.
   - The Hawkes capstone: state existence and uniqueness directly, `∃! Q : ProbabilityMeasure (PointMeasure ℝ), VAddInvariantMeasure ℝ _ Q ∧ intensityDensity Q id (Set.Ico 0 1) < ∞ ∧ HasHawkesIntensity Q ν h id`, with the mean rate `ν / (1 - ∫ h)` as a second clause; the cluster construction is a README target.
   - Janossy reconstruction and the factorial-moment convergence theorems need `factorial`, which is a heavy definition: name them in the docstring as not statable (what they lack: the factorial measure on `Fin n → S`).

## R02 (P3) — `Suggested.lean` is an API catalogue with padding

**Location.** `TauCetiRoadmap/PointProcesses/Suggested.lean` lines 4–21 (module docstring) and the 160 declarations.

**Claim.** The docstring itself says the file "gives possible Lean statements for milestones", "these declarations are examples, not an exhaustive API". That is the old prototype note; the acceptance-test form states headline theorems only.

**Witness (one-tactic probe, elaborated on a scratch copy).** `intensity_apply` (line 164) closes by `exact Measure.bind_apply hA hN.aemeasurable`; `lintegral_intensity` (line 169) closes by `exact Measure.lintegral_bind hN.aemeasurable hf.aemeasurable`. Definitional restatements and boundary cases: `isFiniteMeasureOnCompacts_intensity_iff` (174, unfolds the class), `campbellMeasure_fst` (243), `reducedPalmKernel_apply` (302, is the definition of `reducedPalmKernel`), `PointMeasure.factorial_zero` (327, `n = 0`), `factorial_univ_pi` (331, mirrors a Check), `janossyMeasure_univ` (344, computes a total mass), `coe_vadd_apply` (687, unfolds `map`), `map_coe_poissonPointKernel` (413), `compProd_fst_sigmaFiniteCondKernel`/`eq_sigmaFiniteCondKernel_of_measure_eq_compProd` (267, 273, adapter API), `exists_isSFiniteKernel_ae_eq`/`aemeasurable_campbellKernel` (232, 238, measurability adapters), `measurable_pointMeasure_count` (141), `LocallyFiniteMeasure.measurableSpace_eq_generateFrom_eval` (92, an API fact), `PointMeasure.coe_eq_sum_dirac_enum` (137).

**Repair.** Delete these from `Suggested.lean` (the README keeps each as a target or Check). Replace the module docstring by the "random measures, point processes, Palm theory, and stochastic intensities: target signatures" form: the roadmap is `README.md`, this file states the headline theorems against the pinned APIs, and it lists which headlines are not statable and what each lacks. Keep `theorem`s only for the end theorems of the README's eleven packages.

## R03 (P3) — README not in the TauCetiRoadmap shape

**Location.** `TauCetiRoadmap/PointProcesses/README.md`, whole file.

**Claim.** The shape is: `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`, `## Layer k` with `### k.n` prose subsections, each definition with an API list and a `**Checks.**` list of at least three discriminating checks, each theorem with its hypotheses and a locator at the claim, each layer ending in `### Examples` and `### Dependencies`, then `## Downstream consumers` and `## References`.

**Witness.**
- Locators: 38 of 2643 lines mention a theorem, proposition, section or page; inside the layers only line 1945 (Brémaud 5.2.2–5.2.4), line 1047 (Last–Penrose 3.6) and line 1839 (Exercises 13.8–13.9) carry one. The Mecke iff (1136), GNZ (1240), Grigelionis (1479), the refined Campbell theorem (1698), Watanabe (2244), the time change (2257) and the Hawkes uniqueness (2491) have no locator at the claim; the locators sit only in `## References and division of labor`.
- Checks: each layer has one collective `**Completion checks.**` paragraph (13 in all). No definition has its own three discriminating Checks: `IsCompensator` (2067), `HasStochasticIntensity` (2095), `IsCox` (1876), `papangelouIntensity` (1228), `IsPoissonRandomMeasure` (1098), `palmProbability` (1694) have none attached.
- 13 `**Key declarations.**` Lean blocks (lines 593–686, 733–786, 848–926, 982–1022, 1087–1165, 1210–1263, 1369–1491, 1569–1614, 1690–1770, 1869–1924, 2027–2115, 2215–2319, 2431–2508), about 750 lines, reproduce `Suggested.lean` with bodies elided; the README is prose and the Lean file is the only place for signatures.
- Process narrative: "Suggested homes" file list (35–58), `## How to drive the roadmap` (2617–2643, "Claims should be narrow …"), `## Cross-layer acceptance tests` (2521), "Coordination with existing work" describing another project's "landed Mathlib material" (118–133), "which is the exact handoff" (100, 1562), a mermaid graph (524–546), `## End goals` and `## Encoding conventions` in place of the named sections. The standard-distributions and point-process cross-citations use relative links (`../StandardDistributions/README.md`) and a blueprint URL rather than roadmap name and section.

**Repair.** Rewrite into the shape above. Move the "What Mathlib and Tau Ceti already supply" material into `## Exact supplier contracts` with exact names and files (see R06), turn each `**Build.**` bullet into a `### k.n` prose target ending with its locator and a `*Needs:*` line, split the collective completion checks into per-definition `**Checks.**` lists with at least three each (the double-point, atomic-intensity, hard-core and shifted-lattice computations in the adversarial table below are ready-made), drop the Lean blocks, the homes list, the driving section and the mermaid graph, and add `## Downstream consumers` naming MarkovChainsAndRenewal (Layers 0, 1, 4, 6, 8), RandomMatrices (Layers 0–6) and StochasticCalculus (Layers 4 and 10), which already cite this roadmap by section.

## R04 (P3) — gate failures: TeX syntax, residue, undeclared names

**Location.** `TauCetiRoadmap/PointProcesses/README.md` lines 100, 1356, 1562, 1985, 2196, 2398, 2407–2408; and the gate's `readme-ids-missing`.

**Witness.** `gate PointProcesses: … tex=8 … residue=2 … readme-ids-missing=2 … FAIL`. The TeX hits are code spans broken across lines (1356: `∑_k … / k!` continues on the next line; 1985; 2407–2408). The residue is the word "handoff" at 100 and 1562. The undeclared backticked names of this roadmap's own are `isCox_superposition_of_jointLaw`, `isCox_superposition_of_indepFun` (1841, 1848) and also `picard_intensity_disagreement_le` (2196) and `hawkes_remote_past_disagreement_le` (2398), none of which occurs in `Suggested.lean`.

**Repair.** Keep each display formula on one line inside a single code span or in an indented code block; replace "handoff" by "boundary" or "interface"; state the four named targets in prose without a backticked name (a backticked name is a claim that `Suggested.lean` declares it).

## R05 (P3) — conventions without a witness

**Location.** `TauCetiRoadmap/PointProcesses/README.md` lines 1157–1164 (`nthPoint`), 1507 (`d ≥ 1`), 764–768 (`pgfl`).

**Claim and witness.**
- `nthPoint ξ k` is "the `k`th smallest occurrence … or `∞`" with `k : ℕ`. With `nthPoint ξ 0` the first point, the interarrival theorem (1160) is about `T₂ − T₁, T₃ − T₂, …` and omits `T₁ ~ expMeasure γ`; with an origin sentinel `nthPoint ξ 0 = 0` it covers all interarrivals. Last–Penrose state the interval theorem with `T₀ = 0` (lastpenrose2018 line 2945, `Tₙ − Tₙ₋₁`, `n ≥ 1`), the README Build bullet (1078–1081) promises the full i.i.d. family, and the open StochasticCalculus pull request consumes "`nthPoint`, the origin sentinel" from Layer 4. Pin `nthPoint ξ 0 = 0` in the README and the docstring, with the Check: for `ξ = δ₂ + δ₅`, `nthPoint ξ 0 = 0`, `nthPoint ξ 1 = 2`, `nthPoint ξ 2 = 5`, `nthPoint ξ 3 = ∞`.
- "`E d` … with `d ≥ 1` throughout" versus `{d : ℕ}` in every Lean statement. The `d = 0` instances are true (computed below: `E 0` is a point, `unitCube 0 = univ`, `volume univ = 1`, and both the intensity theorem and the covariogram reduce to `Var N = 𝔼[N(N−1)] + λ − λ²`), so either drop the sentence or add `d ≥ 1` to the Lean; the README's generality must equal the Lean's.
- `pgfl P N v` for `v x > 1` gives the factor `1`, not `v x` (`ENNReal.ofReal (−log 2) = 0`). The docstring reads "`𝔼 ∏ v x`"; say that the definition is used for `0 ≤ v ≤ 1` and clamps above 1.

## R06 (P3) — supplier contract slips

**Location.** `TauCetiRoadmap/PointProcesses/README.md` lines 475–511, 1811–1815, 2560.

**Witness (at the pins).** `memoryless_expMeasure` and `hasLaw_min_expMeasure_of_indepFun` are in `TauCeti/Probability/Distributions/Exponential/Basic.lean` (lines 211, 255), not `Distributions/Exponential.lean`; `measurable_poissonMeasure` is in `Distributions/Poisson/Measurability.lean` (line 26), not `Distributions/Measurability.lean`; `pgf_poissonMeasure` is in `Distributions/Poisson/Basic.lean` (line 36), not `GeneratingFunction.lean`; `IsCoupling` is in `TauCeti/MeasureTheory/Measure/Coupling/Basic.lean` (line 68). Layer 9's identifiability route (1811–1815) uses real-analyticity of `t ↦ 𝔼 exp(−t ∫ g dΛ)`, which Mathlib provides as `ProbabilityTheory.analyticOn_mgf` (`Mathlib/Probability/Moments/MGFAnalytic.lean` line 120) but the README names no supplier for it. Last–Penrose's book is dated 2017 (IMS Textbooks; the authors' PDF is the version of 21 August 2017), not 2018.

**Repair.** Correct the four file locators, cite `analyticOn_mgf` on the integrable-exponential set (the hypothesis `0 < t` there is the interior condition) in the Layer 9 `*Needs:*` line, and date the book 2017.

## R07 (P3) — Lean form: namespaces and an instance standing for a headline

**Location.** `TauCetiRoadmap/PointProcesses/Suggested.lean` lines 34, 150, 257, 267, 273 (`_root_.MeasureTheory.Measure.IsIntegerValued`, `_root_.ENNReal.expNeg`, `_root_.MeasureTheory.Measure.sigmaFiniteCondKernel` and its theorems) and line 80.

**Witness.** The form is `namespace TauCetiRoadmap.PointProcesses` for every declaration; `_root_` places roadmap declarations inside Mathlib's namespaces. The configuration-space headline "`LocallyFiniteMeasure S` is Polish" (README 159) appears only as a sorry'd `instance` (line 80), not as a theorem.

**Repair.** Drop the `_root_` prefixes (the names can stay `Measure.IsIntegerValued` inside the roadmap namespace); state Polishness as a `theorem` (R01).

## Verified sound

**Gate and dependency check.** Build passed (`build=0`); the gate fails only on `tex=8`, `sorry-data=33`, `residue=2`, `readme-ids-missing=2` (R01, R04). Dependency check output:

```
depcheck: 156 roadmaps, 1061 edges, 0 problem(s)
```

No UPWARD or CYCLE line. No change outside `TauCetiRoadmap/PointProcesses/` (`git diff --stat origin/main...HEAD` excluding the folder is empty). `metadata.toml` has `topic = "math.PR"`.

**Signatures.** `#check @…` on a scratch copy for `intensity_apply`, `lintegral_intensity`, `map_eq_poissonLaw`, `IsPoissonRandomMeasure`, `isPoissonRandomMeasure_id_poissonLaw`, `laplaceFunctional_of_isPoissonRandomMeasure`, `variance_count_eq_covariogram`, `refinedCampbell`, `IsCompensator`, `palmKernel`, `janossyMeasure_univ`, `map_eq_of_laplaceFunctional_eq`, `tendsto_sum_poissonLaw_of_nullArray`, `isAdaptedPoisson_of_isCompensator_const`: every `theorem` about `P` keeps `[IsProbabilityMeasure P]`; the `def`s `IsPoissonRandomMeasure`, `IsCompensator`, `laplaceFunctional`, `intensity` drop it, which is harmless since their bodies do not use it. The 104 "dropped binder" leads in the worker's signature file are of this kind (`PolishSpace S`, `LocallyCompactSpace S`, `BorelSpace S` on `def`s whose bodies do not need them; `IsProbabilityMeasure P` on `def`s). Nothing changed.

**Sources opened.** Last–Penrose, *Lectures on the Poisson Process* (authors' copy, `lastpenrose2018`): all 29 locators the README cites resolve and support the attributed statement: Theorem 3.6 existence (line 1255), 4.1 Mecke iff for s-finite intensity and a point process (1504), 4.4 multivariate Mecke (1647), 5.1 mapping (2071), 5.6 marking of a proper Poisson process (2296), 5.8 colour classes (2348), Corollary 5.9 thinning (2359), 6.10 Rényi with diffuse s-finite intensity and simple process (2597), 6.11 (2604), 6.12 (2655), 7.2 interval theorem with `T₀ = 0` (2945), Propositions 8.2 (3358), 8.7 reduced second factorial moment measure locally finite iff locally square integrable (3428), 8.8 pair correlation (3478), 8.11 local approximation (3523), 8.12 mixing via a π-system (3577), 8.13 stationary Poisson is mixing (3608), Theorems 9.1 refined Campbell (3857), 9.4 Slivnyak iff (3957), 9.6 Voronoi inversion (4078), Propositions 9.5 (3994), 9.7 (4122), Theorem 10.2 mass transport (4291), Proposition 13.6 (5811), Theorems 13.7 identifiability (5838), 13.8 the Cox Mecke characterization, exactly `isCox_iff_campbell` (5867), 13.11 (5950), Exercises 13.8–13.9 (6012, 6022). Björk, *Point Processes from a Martingale Point of View* (`bjork2011`): Proposition 3.5.1 (line 1234) gives the `𝓖`-intensity as the `𝓖_{t−}`-conditional expectation of the `𝓕`-intensity for a sub-filtration; the README's special case (intensity already `𝓖`-predictable) follows.

**Library declarations opened at the pins.** Mathlib: `poissonMeasure_conv_poissonMeasure` (Probability/Distributions/Poisson/Basic.lean:173), `charFun_map_cast_poissonMeasure` (:140), `binomial_tendsto_poissonPMFReal_atTop` (PoissonLimitThm.lean:94), `expMeasure` (Exponential.lean:94), `cdf_expMeasure_eq` (:163), `eq_condKernel_of_measure_eq_compProd` (Kernel/Disintegration/Unique.lean), `Measure.disintegrate` (Disintegration/Basic.lean:62), `Filtration.predictable` (Process/Predictable.lean:52), `IsStronglyPredictable` (:163), `Filtration.IsRightContinuous` (Filtration.lean:373), `Filtration.natural` (:395), `Locally` (LocalProperty.lean:93), `IsLocalizingSequence` (:64), `VAddInvariantMeasure` (MeasureTheory/Group/Defs.lean:51), `ErgodicVAdd` (Dynamics/Ergodic/Action/Basic.lean:31), `Besicovitch.ae_tendsto_rnDeriv` (Covering/Besicovitch.lean:1078, needs both measures locally finite, as the README says), `HasBesicovitchCovering` (:155), `SigmaFinite.of_isFiniteMeasureOnCompacts` (Typeclasses/SFinite.lean:701), `withDensity_compProd` (Kernel/Composition/WithDensity.lean:58), `Measure.infinitePi` (Probability/ProductMeasure.lean:354), `Measure.join` (GiryMonad.lean:125), `Measure.instSub` (Measure/Sub.lean:35), `HasLaw` (HasLaw.lean:39), `NullSingletonClass` (in use at NumberField/CanonicalEmbedding/Basic.lean:234), `analyticOn_mgf` (Moments/MGFAnalytic.lean:120), `MeasureTheory/VectorMeasure/Integral.lean` and `Measure/Haar/Unique.lean` present. Tau Ceti: `Measure.map_bind`, `Measure.bind_map` (MeasureTheory/Measure/GiryMonad.lean:46, 59), `measurable_sum_smul_dirac`, `measurable_probabilityMeasure_map` (Measurability.lean), `countableCondKernel` (Probability/Kernel/Disintegration/Countable.lean), `measurable_infinitePi` (ProductKernel.lean:208), `Measure.ext_of_forall_integral_exp_neg_natCast_mul_eq` (Moments/LaplaceDeterminacy.lean:94, on `Measure ℝ≥0`), `IsCoupling` (Measure/Coupling/Basic.lean:68), `poissonMeasure_tail_eq_regularizedGamma` (Poisson/Tail.lean:103), `measurable_poissonMeasure` (Poisson/Measurability.lean:26), `pgf` (GeneratingFunction.lean:73, `t : ℝ`), `pgf_poissonMeasure` (Poisson/Basic.lean:36), `measure_eq_of_pgf_eqOn` (GeneratingFunction.lean:337), `memoryless_expMeasure` (Exponential/Basic.lean:211), `hasLaw_min_expMeasure_of_indepFun` (:255), `iIndepFun.hasLaw_sum_expMeasure` (Sums.lean:156), `bind_gammaMeasure_poissonMeasure` (Gamma/Poisson.lean:134), `Measure/Prokhorov.lean` present. Neither pin has a point-process, random-measure, vague-topology, integer-valued-measure or `expNeg` object: this roadmap is the owner.

**Ownership against roadmaps on main and open pull requests.** Searched by object (`PointMeasure`, point process, Poisson random measure, compensator, Palm, Hawkes, vague topology, random measure) across main and the 384 open heads. No second owner. Three consumers cite this roadmap as their supplier and their contracts agree with its layers: MarkovChainsAndRenewal on main (its scope table rows for Layers 0, 1, 4, 6, 8 and its Layer 7, which consumes the homogeneous Poisson characterization with stationary independent increments and the interarrival family); the open RandomMatrices pull request (Layers 0–6, configuration spaces and factorial moment measures); the open StochasticCalculus pull request (`nnvolume`, `TemporalPointMeasure`, `eventTime`, `IsCompensator`, the internal history, the compensated-integral martingale, and from Layer 4 `nthPoint` with "the origin sentinel"; it also expects an `eraseMarks` from Layer 10 that this README does not name, which is drift on the consumer's side, not here). StandardDistributions on main owns `pgf`, `poissonMeasure` and `expMeasure` as this README says. This roadmap is last in the merge order and cites nothing later than itself.

**Adversarial table.** One row per statement checked; values computed on each side.

| Statement | Instance | Left | Right | Result |
|---|---|---|---|---|
| `IsIntegerValued` (34) | Lebesgue on ℝ, `A = [0,½]` | `½ ∉ ℕ` | not integer-valued | definition excludes it; `2δ₀` on `{0}` gives `2`, admitted (multiplicity) |
| `count` (104) | `ξ = 2δ₀ + δ₁`, `A = {0}` / `A = ℝ` / `Σₙ δₙ`, `A = ℝ` | `⌊2⌋ = 2` / `3` / `⊤` | `ξ A` as ℕ∞ | agree |
| `IsSimple` (107) | `2δ₀` / `δ₀ + δ₁` | `ξ{0} = 2 > 1` / all `≤ 1` | not simple / simple | correct split |
| `VAdd`, `coe_vadd_apply` (681, 687) | `ξ = δ₃` on ℝ, `x = 3`, `B = {0}` | `(3 +ᵥ ξ){0} = ξ{3} = 1` | `ξ((·+3)''{0}) = ξ{3} = 1` | point at `x` moves to the origin, as the README's `θₓ` |
| `expNeg`, `laplaceFunctional` (150, 181) | `t = ∞`, `t = 0`; deterministic `μ` | `0`, `1`; `expNeg(∫ f dμ)` | README 793 | agree |
| `pgfl_indicator_eq_pgf` (210) | `N = 2δ_a`, `a ∈ A`, `t = ½` / `t = 0` / `N A = 0`, `t = 0` | `exp(−2·log 2) = ¼` / `expNeg ∞ = 0` / `1` | `pgf = t² = ¼` / `0² = 0` / `0⁰ = 1` | agree, zero convention consistent with `pgf` |
| `pgfl` for `v > 1` | `v = 2` on an occurrence | factor `exp(−ofReal(−log 2)) = 1` | docstring `𝔼∏v = 2` | clamp above 1 (R05) |
| Janossy normalization (340, 349) | `N = δ_a + δ_b`, `a ≠ b ∈ W` | `N^{(2)}(W²) = 2`, `J[W,2](W²) = ½·2 = 1`, pushforward `δ_{δ_a+δ_b}` mass 1 | `P(N W = 2) = 1` | reconstruction without a second factorial |
| Janossy double point (README 1028) | `N = 2δ_a` | `factorial 2` mass `2` at `(a,a)`, `J[W,2]` total `1` | Check 1028 | agree |
| `janossyMeasure_restrict_eq_tsum` (355) | general `n, k`; `n = 0`, `A = univ` | `C(n+k,n)·k!/(n+k)! = 1/n!`; `Σ_k P(N V = 0, N U = k)` | `J[V,n](A)`; `P(N V = 0)` | identity holds since `N W < ∞` on a bounded window |
| `factorial_univ_pi` (331) | `ξ A = 3`, `n = 2 / 4 / 0` | `6 / 0 / 1` | `descFactorial 3 n` | agree |
| Poisson Janossy (446) | `n = 0`; `Λ W = 0` | `e^{−ΛW}·dirac`; `δ, 0, 0, …` | `P(N W = 0) = e^{−ΛW}`; `N|W = 0` | agree |
| Poisson Laplace (417) | `f = ∞·1_A`, `Λ A = a`; `Λ = 0` | `expNeg a` ; `1` | `P(N A = 0) = e^{−a}`; `1` | agree, including the `∞` convention |
| Mecke (423) | `g = 1_B(x)·μ(B)`, `Λ B = a` | `𝔼 N(B)² = a + a²` | `∫_B 𝔼[N B + 1] dΛ = a(a+1)` | agree |
| Mecke iff (428) | deterministic `N = ν ≠ 0`, `g = 1_B(x)1{μ B = ν B}` | `ν(B)` | `0` | forces `ν = 0`: no non-Poisson deterministic solution; LP 4.1 (line 1504) is the same iff |
| `palmKernel_ae_pos_singleton` (308) | any `N`, `A` measurable | `∫_A Pˣ(ξ{x}=0) Λ(dx) = 𝔼∫_A 1{N{x}=0} N(dx)` | `0` | ordinary Palm has a point at `x` a.e. |
| Slivnyak–Mecke (435) | Poisson(Λ) | reduced Palm `= P.map N` | LP 9.4 line 3957 (stationary form) | agree |
| interarrival (456) | Poisson rate `γ` | increments `Exp(γ)` under either index convention | LP 7.2 line 2945 uses `T₀ = 0` | true; convention unpinned (R05) |
| Papangelou Poisson case (515) | `c = 2`, `μ W = 1`, `ξ W = n`; `x ∈ W`; `c = 0` | Janossy ratio `e^{−2}2ⁿ/e^{−1} = 2ⁿe^{−1}`; `2^{n+1}e^{−1}/2ⁿe^{−1} = 2`; `f = 1{n=0}e` | `f ξ`; `c`; density of `δ_∅` | agree; `hc` unused (note) |
| hard-core / non-hereditary (README 1200–1204, 1269–1272) | `ξ = δ_a + δ_b`, `|a−b| ≥ r`, `|x−a| < r`; `f = 1{n = 2}` | `f(ξ+δ_x) = 0 ⇒ λ = 0`; `f(∅) = 0 ⇒ λ(x,∅) = 0` | Checks | agree; converse route needs `f(∅) > 0`, which heredity gives |
| GNZ converse (507) | hereditary `f, f'` | `f(ξ+δ_x) = λ(x,ξ) f(ξ)` for all `ξ` (zero case by heredity), `f = f(∅)·∏λ`, `∫f = ∫f' = 1` | `f = f'` Π-a.e. | law determined |
| covariogram (707) | Poisson `λ·vol`, `α₂^! = λ² vol` | `λ|W| + λ²|W|² − λ²|W|²` | `Var N(W) = λ|W|` | agree |
| covariogram | shifted lattice `ℤ`, `W = [0,1)` | `λ = 1`, `α₂^! = Σ_{k≠0} δ_k`, `|W ∩ (W−k)| = 0`, `1 + 0 − 1 = 0` | `Var N(W) = 0` (`N W = 1` a.s.) | agree; README 1624 `γ_red = Σ_{k≠0}δ_k − vol` consistent |
| covariogram, `d = 0` | `E 0` a point, `vol univ = 1` | `λ + K(pt) − λ²` with `K(pt) = 𝔼[N(N−1)]` | `𝔼N² − λ²` | agree (R05: README says `d ≥ 1`) |
| `α₂^!` normalization (README 1541–1542) | Poisson | `𝔼∫∫1_{[0,1)^d}(x)1_B(y−x)N^{(2)} = λ²|B|` | `α₂(A×B) = ∫_A α₂^!(B−x)dx = λ²|A||B|` | absorbs `λ²`; Lean formula matches (LP Prop 8.7 line 3428) |
| `intensity_eq_smul_volume` (696) | Poisson `λ·vol` | `intensity = λ·vol` | `intensityDensity = λ` | agree |
| `refinedCampbell` (732) | `f = 1_{[0,1)^d}(x)` | `𝔼 N[0,1)^d = λ` | `λ·1·1` | agree |
| Slivnyak stationary iff (751) | Poisson; uniformly shifted `ℤ^d` | `P⁰ = law(N+δ₀)`; `P⁰ = δ_{ℤ^d} ≠ law(N+δ₀)` | Poisson / not | both directions consistent |
| `palmKernel_ae_eq_palmProbability` (742) | `B = {x}` | `((−x) +ᵥ ξ){x} = ξ{0} = 1` | Palm kernel at `x` has a point at `x` | direction correct |
| Voronoi (764) | Poisson; `N = 0` with prob `p`; `2·ℤ^d` | `𝔼⁰|C₀| = 1/λ`, `P(N≠0) = 1`; `λ⁻¹(1−p)`; occurrences double-counted | identity | `hs` needed and present |
| Palm–Khinchin (783) | `f = 1`; renewal `F` mean `m`; `Exp(γ)` | `P(N≠0) = λ𝔼⁰T₁`; `λ = 1/m`, `𝔼⁰T₁ = m`; `γ·1/γ` | `1` | agree |
| `nextOccurrence` (775) | locally finite `ξ` with a positive atom | `sInf > 0` (finitely many atoms in `(0,1]`) | README `T₁` | no junk on the Palm support |
| Cox variance (841) | `Λ = ξ·μ` mixed Poisson | `𝔼ξ·μB + Var ξ·(μB)²` | `𝔼Λ(B) + VarΛ(B)` | agree; `Λ` deterministic gives Poisson |
| `ae_isSimple_iff_of_isCox` (864) | `Λ = δ₀` | `P(N{0} ≥ 2) = 1 − 2/e > 0` | not simple | both directions |
| `isCox_iff_campbell` (856) | `f = 1_B(x)` | `𝔼N(B) = 𝔼Λ(B)` | LP 13.8 line 5867 | the iff is Last–Penrose's theorem verbatim in content |
| `IsCompensator` (936) | Poisson rate `γ`, `H = 1_{(s,t]}1_F`, `F ∈ 𝓕_s`; `H` at `t = 0` | `P(F)γ(t−s)`; `N{0} = 0` | `𝔼[1_F A(s,t]]`; `A{0} = 0` | agree |
| hazard formula (README 1985, 2124) | Poisson `γ`; one event at fixed `s` | `γe^{−γu}/e^{−γu} = γ`; `A({s}) = 1` | Checks | agree |
| `hzero` in `lintegral_eq` (1011) | `μ({0}×E') = 1`, `H = 1{M({0}×·)=0}1_{t=0}` | `0` | `e^{−1}·1` | identity fails without `hzero`: hypothesis necessary and present |
| Watanabe atoms (1029) | `ν{s} = 1` deterministic | `N{s} ∈ {0,1}` (time-simple) | Poisson(1) has `P(2) > 0` | atomless needed and present |
| time change (1043) | `A = γt`; `A` flat on `(a,b]` | points `Tₙ ↦ γTₙ`, rate 1; `𝔼N(a,b] = 𝔼A(a,b] = 0` | unit Poisson | agree |
| `embedMeasure` (1056) | `f ≡ γ` | thinning of `dt Q(dz) du` by `u ≤ γ` | intensity `γ dt Q(dz)` | README 2326 |
| Lipschitz theorem instantiated by Hawkes (1093, README 2358) | `ψ = ν + ∫h(t−s)ξ(ds)`, `r = 1`, `Q = δ()` | `∫H r dQ = ∫h = m ≤ ρ`, `ρ = m < 1`; `ψ(0) = ν ≤ C` | hypotheses of 1093 | Layer 12 uses Layer 11 exactly as stated |
| cluster size (1147) | `m = 0`; `m = ½` | `1`; `2` | `1/(1−m)` | ancestor included, consistent |
| mean rate (1165) | `ν = 1`, `m = ½` | `λ̄ = 1 + ½λ̄ ⇒ 2` | `ν/(1−m) = 2` | agree; `h = 0` gives Poisson `ν` (README 2515) |
| Grigelionis (650) | `ξₙⱼ = Bernoulli(λ/n)·δ_{Uⱼ}`, `j ≤ n`, `U` uniform on `[0,1]` | `Σⱼ P(ξₙⱼ I = 1) = λ|I|`, `ΣP(>1) = 0`, `sup P(>0) = λ/n → 0` | Poisson(`λ`·Leb) | hypotheses `h1`, `h2`, `hnull` hold and the limit is right |
| factorial-moment convergence (605) | `N = 2`, `c = 3` | `𝔼[c^N] = Σ(c−1)^k𝔼[(N)_k]/k!`: `9 = 1 + 2·2 + 4·1` | identity | bound `α_k(W^k)/k! ≤ (c−1)^{−k}𝔼[c^N]`; summable iff `c > 2` (at `c = 2` the bound `1^{−k}` is not): threshold correct |
| compound Poisson (570) | `Q = δ₁` | `exp(γt(e^{iu}−1))` | `charFun` of Poisson(`γt`) | README 1498 |
| `map_eq_of_laplaceFunctional_eq` (194) | deterministic `μ ≠ μ'` | some `f ∈ C_c⁺` with `∫f dμ ≠ ∫f dμ'` | laws differ | determining class nonvacuous |
| `sigmaFiniteCondKernel` (257) | `ρ = Leb ⊗ δ₀` on `ℝ×ℝ`, `g = e^{−|x|}/2` | `ρ.withDensity(g∘fst)` finite, kernel `δ₀` | `ρ.fst ⊗ δ₀ = ρ` | adapter route sound |
| `IsAdaptedPoisson.isCompensator` (1020) | `μ` locally finite in time | `μ({0}×E) = 𝔼N({0}×E) = 0` | `hzero` of 1011 derivable | no missing hypothesis |

Unused-hypothesis notes (P3, no finding): `hc : 0 < c` in `papangelouIntensity_of_isPoissonPointProcess` (the `c = 0` case computed above is correct); `hlocal` in `tendsto_law_of_tendsto_factorialMomentMeasure` follows from `hexp` and `hconv` by the inheritance argument the README gives.

## Not verifiable

- Kallenberg, *Foundations of Modern Probability* (3rd ed., 2021) and *Random Measures* (2017); Brémaud, *Point Process Calculus in Time and Space* (2020); Daley–Vere-Jones (1988, 2008); Møller–Waagepetersen (2004); Hawkes–Oakes (1974): all behind publisher paywalls (Springer DOI prefix 10.1007, Cambridge, Taylor & Francis); the sources service found no legal copy, and I did not go past a paywall. The claims resting on them alone are cited by locator: Polishness of the vague topology and closedness of point measures (Kallenberg RM Theorem 4.2), the tightness criterion and Laplace-functional convergence criterion (FMP 23.15–23.25), Grigelionis (FMP 30.1, 30.3), the local approximation `𝔼[g(X+ᵥN) | N(B(0,r)) ≥ 1] → 𝔼⁰g` for bounded measurable `g` (FMP 31.9), the time–cycle duality (FMP 31.4), Watanabe (Brémaud 2.4.1), the hazard formula and jump identity (Brémaud 5.2.2–5.2.4), the marked time change for a general probability `Q` (DVJ II 14.6.IV; I checked by the exponential formula that the time-changed compensator is deterministic `vol ⊗ Q`, so the statement is consistent), and the Cox ergodicity/mixing equivalence (DVJ II Proposition 12.3.VII).
- The Cambridge Core record of Last–Penrose is not marked open access; the copy read is the authors' version of 21 August 2017 from their institutional site, whose theorem numbering matched every locator checked.

## Source issues

- none
