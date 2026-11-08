# Review of StochasticCalculus (pull request #1030 at 038c6b7)

**Verdict:** needs changes

Full review of the folder at this head (the five auxiliary Lean files were folded into `Suggested.lean`, 1355 changed lines). The gate fails at this head (`residue=19`), so acceptance is excluded whatever else holds. The findings are one P2 (statable headlines absent from `Suggested.lean`) and eight P3 (gate residue, namespace, padding, README–Lean name agreement, a supplier contract, locators, Checks, an ownership claim about OptimalTransport). None of the previous review's four findings is repaired.

## R01 (P3) — Gate failure: nineteen `lemma` declarations in `Suggested.lean`

**Location:** `TauCetiRoadmap/StochasticCalculus/Suggested.lean:910`–`:1010` (`lemma integrable_bounded_one` … `lemma not_indep_X_Y`, the `ThreeAtomExample` block).

**Claim:** The worker's gate at this head reports `residue=19 … FAIL`; the rule forbids `lemma` in `Suggested.lean`. The folding of `IndependentLaws.lean` into `Suggested.lean` moved the nineteen `lemma`s with it unchanged.

**Witness:** `gate.md` at this head lists the nineteen lines; `grep -c '^lemma' Suggested.lean` gives 19 (the `theorem`/`lemma` rule applies to the whole file).

**Repair:** Delete the `ThreeAtomExample` block with the rest of the padding in R03 (its content is the README's worked example at README lines 3344–3349). If any declaration of that block is kept, write it as `theorem`.

## R02 (P3) — Two namespaces; the required one holds only the two newest declarations

**Location:** `Suggested.lean:38` (`namespace StochasticCalculusSuggested`, 119 declarations) and `:1204` (`namespace TauCetiRoadmap.StochasticCalculus`, 2 declarations); also the section comments `:553`, `:808`, `:1059`, `:1080`, `:1121` (`## Raw-filtration localization`, `## Independent laws`, `## Point-process adapters`, `## Cameron–Martin grid targets`, `## Autonomous arcsin–sech ODE`).

**Claim:** The form rule asks for one `namespace TauCetiRoadmap.<Name>` and, where several layers are stated, `/-! ## Layer k: <title> -/` comments in README order. This head keeps the old namespace for everything but the two path headlines (the previous review's R02, not repaired) and adds five section headings that name no layer (their content belongs to §0.3/§2.4, §0.0, §0.6/§3.1, §8.3 and §9.4, out of README order).

**Witness:** `grep -n '^namespace' Suggested.lean` → lines 38 and 1204; `grep -n '^/-! ##' Suggested.lean` → the five non-layer headings after line 551.

**Repair:** Rename the first namespace to `TauCetiRoadmap.StochasticCalculus`, delete the second header (lines 1201–1209) and its duplicate `open`/`variable` lines, and keep one `variable {Ω : Type*} [mΩ : MeasurableSpace Ω]`. After R03 the five extra section headings disappear.

## R03 (P3) — Sixty-odd supporting declarations are padding, not headlines

**Location:** `Suggested.lean:560`–`:1199`: the sections `RawLocalization` (13 declarations), `IndependentLaws` (6 theorems, the 22-declaration `ThreeAtomExample`, the 3-declaration `FairCoinExample`), `PointProcessesAdapter` (3), `CameronMartinGrid` (6) and `AutonomousODE` (18); also `predictableMeasure` at `:91`.

**Claim:** `Suggested.lean` states the headline theorems and only the definitions they need. These sections are API lemmas, native aliases, worked-example computations and a deterministic scalar ODE, all of which the README already carries as targets or Checks. The module docstring itself calls them "Supporting interfaces". Sixty-three of the file's names do not occur in the README at all (the README–Lean agreement rule), and some are one-tactic or one-term proofs.

**Witness (one instance each):** `odeSolution_initial` (`:1169`) closes with `simp [odeSolution, timeCoordinateEquiv]` on a scratch copy; `stoppedValue_countable_range` (`:569`) is one `exact` of the Mathlib lemma it names; `integrable_X_sq` (`:933`) is `integrable_Y`; `nnvolume_eq_comap_volume`, `timeMeasure_eq_comap_volume`, `predictableMeasure_eq_comap_volume` (`:1066`–`:1077`) are `rfl`; `independent_sum_law`, `independent_finite_vector_law`, `independent_sum_hasPDF` (`:822`–`:880`) are one-term aliases of `IndepFun.map_add_eq_map_conv_map₀`, `iIndepFun.map_fun_eq_pi_map`, `IndepFun.add_hasPDF`; `variance_Y` (`:1004`) computes 2/9 and `cylinder_probability` (`:1048`) computes 2^(−|S|), both README Checks (README 3344–3356); `independent_sum_joint_event` (`:883`) is a statement about free `f g : Ω → ℝ` whose conclusion is Tonelli on its hypotheses; `odeSolution` (`:1166`) is data built through `timeCoordinateEquiv`, whose body uses the sorried `timeCoordinate_bijective` (`:1158`), so the definition rests on an unproved proof term; `predictableMeasure` (`:91`) is used by no headline, only by its own `rfl` adapter.

**Repair:** Delete lines 553–1199 and `predictableMeasure` (`:91`–`:93`) from `Suggested.lean`; the README keeps every statement (§0.0, §0.3, §2.4, §3.1, §8.3, §9.4 and the worked examples already state them in prose). Keep `predictable_le_prod` only if a retained statement uses it (none does after the deletion). This also discharges R01 and the previous review's R02/R03.

## R04 (P2) — Headlines statable at the pins are absent, and the docstring's reason does not cover them

**Location:** `Suggested.lean:18`–`:25` (module docstring: the Feynman–Kac comparison "lacks the constructed diffusion-law and generator-domain carriers"; the Stratonovich formula "lacks a constructed semimartingale integral"), against README §10.3 (lines 3137–3142) and §5.3 (lines 1852–1860).

**Claim:** Two headline statements the README names are statable now with the file's own carriers and are not stated. (a) §10.3's Feynman–Kac representation for the scalar equation: with `IsStrongSolution F P B b σ (fun _ => x) X` (already in the file), bounded Borel `q`, a bounded `C²` function `u` with bounded spatial derivative solving `∂ₜu + b ∂ₓu + ½σ² ∂ₓₓu + q u = 0` on `[0,T]`, the identity `u 0 x = ∫ ω, exp(∫₀ᵀ q(s, X_s) ds) · u(T, X_T) ∂P` needs no diffusion-law or generator-domain carrier: the expectation is over `P` and the solution is `X`. (b) §5.3's Brownian temporal-midpoint/symmetric-sum theorem for `h ∈ C¹` with primitive `H`: along deterministic vanishing-mesh partitions of `[0,t]`, the symmetric sums converge in probability to `H(B_t) − H(B_0)`; it mentions only `IsBrownianReal`, `TendstoInMeasure` and finite sums, no semimartingale integral. (c) §6.1's right continuity of the null-augmented natural Brownian filtration is statable as `Filtration.IsRightContinuous (ambientNullAugmentation (Filtration.natural B hm) P)` with the file's own `ambientNullAugmentation`.

**Witness:** A scratch copy of `Suggested.lean` with (a) and (b) added inside `section Headlines` (hypotheses as above, `deriv`/`iteratedDeriv` for the partial derivatives, `timeMeasure T` for the time integrals, partitions as `π : ℕ → ℕ → ℝ≥0` with mesh `→ 0`) elaborates with `lake env lean`: exit 0, 59 `declaration uses sorry` warnings (57 + 2), no other diagnostic.

**Repair:** State (a) and (b) (and (c) if §6.1 is to remain a headline) in `Suggested.lean` with `sorry`, and reword the docstring so that the not-statable list names only what still lacks a carrier (the general semimartingale and vector-diffusion forms).

## R05 (P3) — README and Lean names disagree in both directions

**Location:** `README.md:3182` ("Prove `gauge_weighted_stopped_family_uniformIntegrable` by the following …"); `README.md:2116` ("The two scalar path headlines are stated on native `IsBrownianReal` in `Suggested.lean`"); `Suggested.lean:1213`, `:1226`.

**Claim:** A backticked name of this roadmap's own is a claim that `Suggested.lean` declares it; `gauge_weighted_stopped_family_uniformIntegrable` is declared nowhere. Conversely `brownian_exact_uniform_modulus` and `brownian_simultaneous_nowhere_differentiable` are declared but never named in the README (the previous review's R01, not repaired), and after R03 the remaining declared names must each appear in the README.

**Witness:** `grep -c gauge_weighted Suggested.lean` → 0; `grep -c brownian_exact_uniform_modulus README.md` → 0.

**Repair:** In §10.4 write the UI statement in prose without a backticked name (or declare it); in §6.3 write "Prove `brownian_exact_uniform_modulus`: for every T>0 …" and "Prove `brownian_simultaneous_nowhere_differentiable`: …" at the two statements, as the LIL sentence does for `brownian_lil`.

## R06 (P3) — The PolarDecomposition contract still claims range-projection identities the supplier does not state

**Location:** `README.md:91`–`:93` ("PD-C19–PD-C27 supplies the finite-dimensional Moore–Penrose inverse, its uniqueness and its range/orthogonal-projection identities") and `:3102` ("Use the supplied range/projection identities").

**Claim:** Unchanged since the previous review (its R03). On main, `TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md:500`–`:515` state the four Penrose equations, existence, uniqueness, adjoint compatibility and the injective/surjective/invertible cases; no item says `AA⁺` is the orthogonal projection onto `ran A` or `A⁺A` onto `(ker A)⊥`, which §10.2 consumes for `Id − σ⁺σ`.

**Witness:** For `A = diag(2,0)`, PD-C19 gives `AA⁺ = diag(1,0)` as a self-adjoint idempotent; that its range is `ran A` follows from `AA⁺A = A` and is a two-line consequence the supplier does not list.

**Repair:** Write that PD-C19–PD-C27 supply the inverse, the four equations and uniqueness, and that §10.2 derives the two range projections from PD-C19 (self-adjoint idempotents whose ranges are fixed by `AA⁺A = A` and `A⁺AA⁺ = A⁺`).

## R07 (P3) — Locators: the path headlines, a mis-numbered citation, and sampled sections with no locator

**Location:** `README.md:2097`–`:2111` (§6.3 modulus and nowhere-differentiability, no theorem or page), `:1769` ("Baudoin, Lecture 24, Theorem 1"), `:3051` (§9.6 "spatial C_b^7 drift/diffusion and C_b^6 test functions"), and the sampled sections §0.3 (640–649), §0.6.0–0.6.2 (763–880), §2.4 (1236–1352), §4.4 (1798–1806), §5.3 (1841–1867), §7.1 (2438–2445), §9.4 (2867–2968), §9.5 (3029–3041), §10.2 (3092–3133), §10.3 (3135–3155), none of which carries a theorem or page locator into a readable or uncertified source.

**Claim:** Every theorem carries a locator. The two §6.3 headlines are certified by readable texts the README does not cite (previous review's R04, not repaired): Lévy's modulus is Mörters–Peres Theorem 1.14 (`morters-peres line 965`, printed p. 16, limsup form on `[0,1]`), simultaneous nowhere differentiability is Mörters–Peres Theorem 1.30 and the three-increment argument is `lalley line 921` (Proposition 9, printed p. 25). Baudoin's Lecture 24 states its result as an unnumbered "Theorem (Burkholder–Davis–Gundy inequalities)" (`baudoin-l24 line 51`), so "Theorem 1" points at nothing. §9.6's finite orders `C_b^7`/`C_b^6` are supported by no cited text (Talay–Tubaro assume `C^∞` coefficients with bounded derivatives, `talay-tubaro line 435`). The sampled sections cite at most a supplier roadmap (§0.6, §10.2) or the waived MATH5695 pages (§2.4 none, §4.4 none, §7.1 none, §10.3 none; Karatzas–Shreve §5.7 and Revuz–Yor appear only in the reference list without theorem numbers).

**Witness:** `grep -n 'Theorem 1.14\|Theorem 1.30\|Proposition 9' README.md` → nothing; `grep -c 'Revuz\|Karatzas\|Protter\|Kunita' README.md` restricted to lines 2436–3207 → only the chapter-level mentions in §7.2, §7.3, §7.4, §9.1 and §8.

**Repair:** Attach the three §6.3 locators and add Mörters–Peres (author-page copy on Mörters's Cologne page) to the references; cite Baudoin's theorem as unnumbered; give §9.6 a locator for its finite-regularity weak-order statement (e.g. Kloeden–Platen, Theorem 14.5.2, uncertified) or drop the specific orders; give each sampled section at least one theorem-or-page locator (Karatzas–Shreve 3.2.C/3.2.D for §2.4's localization, Revuz–Yor IV.1.? for §4.4, Revuz–Yor V.1 for §7.1, Karatzas–Shreve 5.7.6 for §10.3, Revuz–Yor XI.1 for §9.4a), recorded `uncertified` where paywalled; record the readable works in a `sources.toml` with one key per work.

## R08 (P3) — Definitions without their three discriminating Checks; Layer 3's pooled dependencies

**Location:** `README.md:444` (`Indistinguishable P X Y`), `:422`–`:438` (the L⁰ metric wrapper), `:643` (`ambientNullAugmentation`), `:1238` (`IsLocalMartingale`), `:1461`–`:1466` (`ElementaryIntegrand`, three examples inline in prose), `:2440`–`:2445` (the inverse clock `T(s)`), `:2585` (`IsCameronMartinShift`), `:2755`–`:2761` (`IsStrongSolution`, examples only under `### Examples`), `:1651` (Layer 3's single `*Needs:*` line).

**Claim:** Every definition lists its unit tests as a `**Checks.**` bullet list; the README has ten such lists for well over thirty defined objects, and the eight definitions above (five of them declared in `Suggested.lean`) have none. The L⁰ metric and inverse-clock items and the pooled Layer 3 `*Needs:*` line are the earlier review's R05, not repaired.

**Witness:** `grep -c '\*\*Checks\.\*\*' README.md` → 10, at lines 847, 957, 1018, 1430, 1485, 1555, 1668, 2300, 2498, 2525; none between 2526 and 3628.

**Repair:** Add a three-bullet `**Checks.**` list under each definition above (for `IsStrongSolution` the three `### Examples` items already serve: move them; for `IsCameronMartinShift` the Layer 8 examples `h = 2t`, `h = √t`, `h(0) = 1`; for `Indistinguishable` the two-process rational-dense example and the fixed-time-version non-example of §0.2), and split Layer 3's `*Needs:*` by subsection (§3.2 direct integral: Layers 0–1; §3.1/§3.3: Layer 2.5; §3.4: Layer 2.4; §3.5: Layer 0.0).

## R09 (P3) — The OptimalTransport consumption claim is false at main; two constructions of the Brownian path law

**Location:** `README.md:33`–`:35` ("OptimalTransport §13C consumes Wiener laws and heat-generator identification"), `:184`–`:187`, `:990`–`:995` ("This roadmap supplies the centered and initial-law Wiener laws … consumed by §13C; the dependency points from OT to S1/S10 only"), `:3564`–`:3565`.

**Claim:** OptimalTransport on main, §13C item 12 (`TauCetiRoadmap/OptimalTransport/README.md:1549`–`:1556`), builds "the Brownian probability law `R^ε_r`" on `C([0,1];ℝⁿ)` with initial law `r`, transition density and generator itself, and the OptimalTransport README never mentions StochasticCalculus. So the Brownian path law with initial law is constructed in two roadmaps, the earlier one (on main) not consuming this one, and this README's statement of what OT consumes describes a dependency that does not exist.

**Witness:** `grep -c StochasticCalculus TauCetiRoadmap/OptimalTransport/README.md` on main → 0; OT line 1549: "On `C([0,1];ℝⁿ)`, build the Brownian probability law `R^ε_r` with explicit initial law `r`".

**Repair:** Either cite OptimalTransport §13C item 12 as the existing owner of the finite-horizon `ℝⁿ` initial-law Brownian law and state in §1.2 how the half-line scalar Wiener measure here relates to it (restriction and coordinates), or state the ownership as a deferral OT must adopt ("§13C item 12's `R^ε_r` is the pushforward of §1.2's `W_r` under restriction to `[0,1]` and scaling") without asserting that OT consumes it today. Drop "consumes" from lines 34, 184 and 3564.

## Previous findings

- R01 — not repaired: `grep -c brownian_exact_uniform_modulus README.md` → 0; the two path headlines are still unnamed in §6.3 (R05 above).
- R02 — partly repaired: the five auxiliary files are folded into `Suggested.lean` (`stray-files=0`), but the file still declares under `StochasticCalculusSuggested` (line 38) with the two newest declarations alone under `TauCetiRoadmap.StochasticCalculus` (line 1204), still uses `lemma` (19 times) and keeps the three `rfl` adapters and the padding (R01–R03 above).
- R03 — not repaired: `README.md:93` and `:3102` still say "range/orthogonal-projection identities" and "supplied range/projection identities" (R06 above).
- R04 — not repaired: §6.3 still has no theorem or page locator for the modulus and nowhere-differentiability, Mörters–Peres is not in the references, and the folder has no `sources.toml` (R07 above).

## Verified sound

**Gate, build, dependency check.** The worker's gate at this head: every scanner 0 except `residue=19`, `build=0`, verdict FAIL. Direct elaboration with `lake env lean` of `Suggested.lean`: exit 0, exactly 57 `declaration uses sorry` warnings, nothing else (the worker's signature transcript's "elaboration errors" at lines 900–1049 are artefacts of its `#check` wrapper; the file itself is clean). The dependency check:

```text
depcheck: 243 roadmaps, 2456 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. StochasticCalculus is line 211 of the merge order. No file outside the folder changed (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StochasticCalculus'` is empty).

**Elaborated signatures.** The worker's seven flagged binders were compared with the README: `stochasticExponential` needs no `[MeasurableSpace Ω]` (a real-valued formula); `completedRawFiltration`, `IsUsualAugmentation`, `nullCompletedFiltration`, `usualAugmentation`, `usualAugmentation_isUsualAugmentation` lose `[IsProbabilityMeasure P]`, which their types do not need (filtrations built from null sets of any measure). Every headline theorem in `section Headlines` carries `[IsProbabilityMeasure P]` and its filtration, Brownian and integrability hypotheses explicitly; `continuous_bdg` quantifies its probability space inside the statement so the constants are universal. The probe file of R04 was elaborated with `#check`-free statements (exit 0).

**Pinned declarations opened.** `Mathlib/Probability/BrownianMotion/Basic.lean:75` (`IsPreBrownianReal`: `HasLaw` of every finite restriction against `projectiveFamily`) and `:302` (`IsBrownianReal` adds `∀ᵐ ω, Continuous (X · ω)`); `Mathlib/Probability/Process/LocalProperty.lean:64` (`IsLocalizingSequence`: stopping times, a.s. monotone, a.s. `→ ⊤`; `isLocalizingSequence_const_top` exists, so a true martingale is `Locally` a martingale) and `:93` (`Locally` stops `{ω | ⊥ < τ n ω}.indicator (X i)` at `τ n`, matching the file's `(⊥ : WithTop ℝ≥0) < τ n ω` indicators and the README's `1_{0<τ_n}` convention); `Mathlib/Probability/Process/HittingTime.lean:65` (`hittingAfter u s n ω` is `sInf {i | n ≤ i ∧ u i ω ∈ s}` when that set is nonempty and `⊤` otherwise, so `brownian_hitting_laplace` and `brownian_interval_exit` take the first hit, attained for closed targets on continuous paths); `Mathlib/Probability/Process/Stopping.lean:832` (`stoppedProcess u τ i ω = u (min i (τ ω)).untopA ω`); `Mathlib/Probability/Process/Predictable.lean:52` (`predictable` generated by `{⊥} ×ˢ A`, `A ∈ 𝓕 ⊥`, and `Ioi i ×ˢ A`, `A ∈ 𝓕 i`, which is what `predictable_le_prod`'s proof uses) and `:163`; `Mathlib/Probability/Process/Adapted.lean:191` (`IsProgressive` tests `Set.Iic i × Ω` with the product σ-algebra, as the Conventions say), `:104`, `:261`; `Mathlib/Probability/Process/Filtration.lean:373`, `:395` (`IsRightContinuous`, `natural`). The 18 Tau Ceti names in the supplier contracts (`le_setAverage_ball_of_laplacian_nonneg`, `SubharmonicOn`, `SubharmonicOn.le_of_le_sphere`, `tendsto_ae_condExp_iInf`, `centralMoment_id_two_mul_gaussianReal`, `gaussianHermitePiBasis`, `piHilbertBasis`, `exists_isProjectiveLimit_nat`, `exists_isProjectiveLimit_of_countable`, `markovChainLaw`, `AnalyticSet.nullMeasurableSet`, `ballPoissonKernel_pos_on_sphere`, `integral_ballPoissonKernel`, `harmonicOnNhd_ballPoissonIntegral`, `tendsto_ballPoissonIntegral`, `exists_harmonicOnNhd_ball_continuousOn_closedBall_eqOn_sphere`, `harmonicOnNhd_integral_smul_of_contDiffOn`, `toSphere_real_apply_univ`, `ballPoissonIntegral_def`) all occur in the named files at Tau Ceti `a91d3aaf`; the 34 Mathlib names checked (`trajMeasure`, `IsKolmogorovProcess`, `tendstoInDistribution_inv_sqrt_mul_sum_sub`, `tendstoInDistribution_iff_tendstoInDistribution_inner`, `condLExp`, `stoppedValue_ae_eq_condExp_of_le_const_of_countable_range`, `IsStronglyProgressive.stoppedProcess`, `isConservativeOn_and_continuousOn_iff_isDifferentiableOn`, `variation_withDensityᵥ`, `exists_measure_symmDiff_lt_of_generateFrom_isSetRing`, `setIntegral_Ioc_leftLim_vectorMeasure_eq_sub`, `integral_eq_of_hasDerivAt_off_countable_of_le`, `absolutelyContinuousOnInterval_intervalIntegral`, `AbsolutelyContinuousOnInterval.boundedVariationOn`, `infinitePi_cylinder`, `iIndepFun_infinitePi`, `measure_zero_or_one_of_measurableSet_limsup_atTop`, `ZeroAtInftyContinuousMap`, `map_add_eq_map_conv_map₀`, `StronglyMeasurable.exists_eq_measurable_comp`, `tendstoInMeasure_of_tendsto_Lp`, `Measure.IsComplete`, `measurable_stoppedValue`, `stronglyMeasurable_stoppedValue_of_le`, `measurableSet_preimage_stoppedValue_inter`, `upcrossingStrat`, `mul_integral_upcrossingsBefore_le_integral_pos_part`, `preVariationFun`, `variation_le_of_forall_enorm_le`, `totalVariation_eq_variation`, `vectorMeasure_Ioc`, `variation_vectorMeasure_Ioc`, `stronglyAdapted_iff_adapted`, `IsProgressive.isStronglyProgressive`) occur in Mathlib `6b7abb3c` (`IndepFun.add_hasPDF` is used and elaborates). The `BrownianMotion` directory at the pin has only `Basic.lean` and `GaussianProjectiveFamily.lean`: no stochastic integral, bracket, local time or path theorem, so every headline is new here.

**Cross-roadmap citations resolved.** PointProcesses at #417 (`roadmaps show`): Layer 0 count evaluation (line 571), Layer 4 `IsPoissonPointProcess` (1108), `ae_isSimple_of_isPoissonPointProcess` with `NullSingletonClass` (1149), `nthPoint` (1159), `iIndepFun_interarrival_of_isPoissonPointProcess` (1161, differences of successive `nthPoint`s, so the README's remark at 0.6.1 that the displayed theorem alone does not assert independence of the first wait is a fair reading), the homogeneous equivalence sentence (1079–1082), Layer 10 `TemporalPointMeasure` (2030), `eventTime` (2037), `IsCompensator` (2068, with restriction to `Iic t ×ˢ univ` adapted and the predictable-integral identity), `MarkedLocallyFiniteMeasure` (2088), `martingale_compensated_integral` (2108, finite-horizon integrability hypothesis as the README says), Layer 11 `IsAdaptedPoisson` (2223: Poisson random measure, `Iic t` restriction `𝓕 t`-measurable, `Ioi t` restriction independent of `𝓕 t`) and `IsAdaptedPoisson.isCompensator` (2237: inputs exactly the measurable `N`, the measure-valued adapted-Poisson law, `SigmaFinite μ` and `μ (K ×ˢ univ) < ∞` on compacts; output the constant `⟨μ, hloc⟩`), `nnvolume` (1090, the same comap formula). StandardDistributions on main: §8.1 Modified Bessel I with `Real.besselI` (README line 1227–1229), §12.1 Uniform sphere and ball (2143), §12.2 Von Mises–Fisher (2159). PDE on main: B8 (1098), C12 (1304), C15 (1508). OneParameterSemigroups on main (Completed): Part A strongly continuous semigroups (line 91), `LinearPMap` generator and resolvent (41–45). Completed/OrthogonalL2Bases Part D with `gaussianHermitePiBasis` (line 372). OperatorTheory/PolarDecomposition PD-C19–PD-C27 (lines 500–515). DifferentialGeometry §0.3 rough forms and pullback (line 284). FinancialMathematics M0.1–M0.4 on main (lines 11, 29, 45, 57) and MarketImpact at #1655 (13 mentions) are consumers citing this roadmap. OptimalTransport §13C: see R09. ConformalMapping on main (Completed) has no Hardy-boundary target (grep "hardy" → none), as §6.5.2 says. The two resolver leads resolve: `ElementaryIntegrand.toProcess` is declared at `Suggested.lean:127`; `IsAdaptedPoisson.isCompensator` is PointProcesses Layer 11. The citation of PointProcesses (#417, a new folder by another author) and the design-stage placement are consistent with the dependency check's 0 problems.

**Sources read (cache line numbers).** `lalley line 69` Theorem 1 (Wiener, existence, printed p. 2), `line 453` Theorem 5 (strong Markov, standard filtration, finite stopping time, p. 13), `line 619`–`622` Proposition 4 and (32) (`P{M(t) ≥ a} = 2P{W(t) > a}`, p. 16), `line 981` Theorem 7 (nested partitions of `[0,1]` with mesh → 0, a.s. quadratic variation 1, p. 26), `line 921` Proposition 9. `morters-peres line 965` Theorem 1.14 (Lévy's modulus, limsup form on `[0,1]`, printed p. 16). `kratschmer-urusov line 41`–`57` Theorem 1.1: covering bound `N(η) ≤ Cη^{−t}`, pair measurability (1.2), `E d(X_θ,X_ϑ)^p ≤ M d(θ,ϑ)^q` with `q > t`, Hölder modification of every order `β < (q−t)/p` when the state metric is complete, exactly the hypotheses §1.1 restates. `theodorakopoulos line 75` Theorem 2.3 (Souslin closure), `147` Theorem 2.4, `183` Theorem 2.5 (outer measure `P*`), `235` Lemma 3.5, `266` Theorem 3.7 (measurable section), `304` Lemma 4.2, `318` Theorem 4.4 (predictable section), `337` Lemma 4.8, `345` Theorem 4.9 (optional section), matching the README's reference entry item by item. `bgs1971 line 540`–`567`: §5 "The unit disc", Theorem 1′ (`H^p` norm comparable to the nontangential maximal function, every `0<p<∞`) on printed p. 150 and Theorem 3′ (`c_α m{N_α u > λ} ≤ P(u* > λ) ≤ C_α m{N_α u > λ}`, Brownian start at the origin) on p. 151, as §6.5.3 cites. `chung1985` page 1 = printed 496, the gauge theorem on p. 497 (ordinary statement) and the conditional-gauge development, as §10.4 says. `dlmf10 line 73`, `109`: 10.29.1 and 10.29.2 are the recurrence and the derivative identity §9.4a uses (10.25.1 is the modified Bessel equation). `ondrejat-seidler line 49`–`56` Theorem 0.1: adapted, `B(ℝ₊)⊗F`-measurable process into a Polish space has a progressively measurable modification, equality a.s. at each fixed `t`, exactly the fixed-time distinction §0.2 draws. `talay-tubaro line 185`–`190` Theorem 1 (Euler error `−h∫Eψ + O(h²)` for test functions of their class `F`), `line 435` (H1) `C^∞` coefficients with bounded derivatives; cited by the README as architecture only. `baudoin-l24 line 51`: a continuous local martingale with zero start, every `p > 0`, universal constants (the html text has lost the displayed formulas; see Not verifiable).

**Seeded sample.** §0.3: the Lean definition `ambientNullAugmentation` (seq `F t ⊔ generateFrom {A | MeasurableSet A ∧ P A = 0}`) is a filtration (mono and `le'` proved in place) and `measurableSet_null_ambientNullAugmentation` is proved; the README's distinction from completion of the measure is correct. §0.6.0–0.6.2: the three consumed PointProcesses contracts exist at #417 as listed above; the increments `m·P(Poisson(αT/m) ≥ 2) ≤ m(αT/m)²/2 → 0`; the `F_∞ = F_t ∨ G_t` factorization is the Blumenthal-type argument. §2.2: Doob's inequalities and the dyadic examples (values below). §2.4: `Locally` convention matches the pin; the example `X_t = 1_{t=U}` computed below. §4.2: Lalley Theorem 7 read; the second-moment identities computed below. §4.3: BGS structure read; good-λ form standard. §4.4: `[N−αt] = N`, `⟨N−αt⟩ = αt` computed. §5.3: the Stratonovich identities and the biased-clock test computed. §7.1: plateau constancy is Revuz–Yor IV.(1.13), uncertified. §9.4: OU covariance, GBM moments, hyperbolic SDE, Bessel kernel and the inverse-radius expectation computed below; DLMF read. §9.5: Kunita cited at chapter level only (R07). §9.6: Talay–Tubaro read. §10.2: PD-C19–PD-C27 read on main; the pseudoinverse Checks computed. §10.3: the sign convention computed.

**Padding probes.** On a scratch copy: `odeSolution_initial` closes with `simp [odeSolution, timeCoordinateEquiv]`; `simp` leaves `brownian_quadraticVariation`, `filteredBrownian_of_brownianLaw_localMartingale`, `exists_predictable_brownian_version`, `martingale_stopped_countable_range`, `independent_sum_joint_event`, `translated_increment_density`, `likelihood_power_integrable`, `timeCoordinate_smooth`, `odeSolution_strictMono`, `odeSolution_hitTime_pos` open, and `nlinarith` with `cosh_pos`/`sinh_lt_cosh` does not close `logArgument_pos`; `stoppedValue_countable_range` is already a one-`exact` proof in the file. No headline theorem in `section Headlines` closes in one tactic.

**Adversarial table.** One row per statement checked; values on both sides.

| Statement | Instances tried | Computed sides | Result; change |
|---|---|---|---|
| `IsFilteredBrownian` (1.3) | `2B`; `F₀` revealing sign of `B₁` | `2B` increment variance on `[1,3]` = 8 ≠ 2; `P(B₁>0 ∩ B₁>0) = 1/2 ≠ 1/4` | Both wrong models excluded by `IsBrownianReal` and `Indep`; no change |
| `exists_wienerMeasure` (1.2) | Dirac at zero path; independent marginals | variance at 1: 0 ≠ 1; covariance(1,3) = 0 ≠ 1 | `IsBrownianReal` excludes both; no change |
| `IsItoIntegral` at `t = 0` | any `H` | `timeMeasure 0 = restrict (Ioc 0 0) = 0`; elementary integral `B(min 0 s) − B(min 0 s) = 0`; so `I₀ = 0` a.s. | README Check correct; no change |
| `IsItoIntegral` with `H = 1` | one-step grid `0 ≤ t`, height 1 | energy 0, elementary integral `B_t − B_0 = B_t`; uniqueness forces `I_t = B_t`, excludes `cI`, `c ≠ 1` | Check correct; no change |
| `IsItoIntegral`, non-measurable `H = 1_A` | `A` and `Aᶜ` of inner measure 0 | lower integrals of `|0−H|²` and `|1−H|²` both 0 without predictability | predictability hypothesis is what excludes it; no change |
| `itoIntegral_isometry` | `H = 2`, `T = 3` | `E[(2B₃)²] = 12`; `∫ 4 d(timeMeasure 3 ⊗ P) = 12` | equal; no change |
| `BrownianIntegrable`/`LocallyBrownianIntegrable` (3.4) | `H = 2`; `H = t^{−1/2}`; `H = Z` Cauchy in `F₀` | energies `4T`; `∫₀¹ t⁻¹ = ∞`; pathwise `TZ² < ∞` but `E Z² = ∞` | the three Checks hold; no change |
| `IsQuadraticVariation` for `B` (4.1) | `A = 2t`; `A = 0`; `A = t` | `E[B_t² − 2t] = −t` (strict supermartingale); `E B_t² = t ≠ 0`; `B_t² − t` martingale | only `A = t`; no change |
| `IsQuadraticVariation` for `N_t − t` (4.1 Check) | `A = t` | `Var N_t = t` so `(N_t−t)² − t` martingale; optional bracket `N ≠ t` | Check correct: predicate is the predictable bracket for jumps; no change |
| `isQuadraticVariation_unique` | trivial filtration, arbitrary `M`; constant filtration `σ(U)` | native-local ⇒ `A_t = M_t² − M_0²` a.s. per `t`, deterministic; two continuous versions agreeing at rationals are indistinguishable | holds with no hypothesis on `M` in these models; the Lean is wider than README/Revuz–Yor IV.1.8 (which assume `M` a continuous local martingale) but no refuting instance found; no change |
| `continuous_bdg` | `M = 0`; `τ = 0`; `p = 2` | `0 ≤ 0 ≤ 0`; stopped at 0: `M₀ = 0` a.s. and `A₀ = 0`; `p = 2`: `E sup M² ≤ 4 E[M]_∞` with `c₂ = 1` from `E M² = E[M]` | consistent; no change |
| Locally convention (2.4) | `U` uniform, `F_t = σ(U)`, `X_t = 1_{t=U}` | `X_t = 0` a.s. each `t` ⇒ martingale; `X^U_t = 1_{U≤t}` not constant in `t` ⇒ not a martingale | README example correct; no change |
| `levy_characterization_adapted` | `M = 2B` | `[2B]_t = 4t ≠ t` | hypothesis excludes rescaling; no change |
| `brownian_ito_C2` | `f = x²`; `f = 3` | `B_t² = 2∫B dB + t` (`f'' = 2`, `½·2·t = t`); `f = 3`: both derivative terms 0 | Layer 5 example correct; no change |
| Stratonovich (5.3) | `h = x`; `h = e^x` | `∫B dB = (B² − t)/2`, `∫B∘dB = B²/2`; `∫e^B∘dB = e^{B_t} − 1`, Itô drift `½e^{B}ds` | identities correct; R04(b) statable |
| 5.3 deterministic-clock test | biased-binary `μ_p`, `M = W∘A` | midpoint sum mean `Σ p·ΔA_j = pA(1)`; variance `Σ ΔA_j² p(1+p) ≤ 2 max ΔA_j · A(1)`; limit `Itô + pA(1) = Strat + (p−½)A(1)` | README values correct; no change |
| 4.2 `E[(Q_π − T)²]` | any deterministic `π` | `Var(ΔB²) = 2Δt²`, sum `2ΣΔt_i² ≤ 2T·mesh`, equal mesh `2T²/n` | correct; no change |
| 4.2 `E[(B_t² − B_s²)²]` | `s = 1, t = 2` | `4s(t−s) + 3(t−s)² = 4 + 3 = 7`; `E[(B₂−B₁)⁴] = 3` | correct; no change |
| 4.2 `E C_π²`, `E R_π²` | partition `0,1,2,3` | `E C_π² = 15Σd_i³`; `E R_π²`: diagonal `3(0+1+2) = 9`, off-diagonal `2·t₁d₁d₂ = 2`, total 11 | correct; no change |
| 4.2 `E[(R_π − ∫B)²] ≤ 5T²δ` | general `π` | `2Σ t_i d_i² ≤ 2T²δ`; Riemann error `(1/3)Σd_i³ ≤ (1/3)Tδ²`; `(a+b)² ≤ 2a²+2b²` gives `≤ 4T²δ + (2/3)Tδ² ≤ 5T²δ` | correct; no change |
| 4.2 cubic identity | `n` equal intervals | `B_T³ = 3ΣB_{t_i}²Δ_i + 3R_π + C_π`; step error `Σ(2t_i d_i² + d_i³) = T³/n`; `E|Σ∫(B_{t_i}−B_t)dt|² = T³/(3n²)`; `E|ΣΔ³|² = 15T³/n²` | all four values correct; no change |
| Layer 4 example | `M = 2B`, `t = 3`; rate-2 Poisson at 3 | `[2B]_3 = 12`; `[N−2t]_3 = N₃`, `⟨N−2t⟩_3 = 6` | correct; no change |
| `brownian_reflection` at `t = 0` | `a > 0`; `a = 0` | both sides 0; `a = 0` would give `1 = 2` | `0 < a` needed; no change |
| `brownian_hitting_laplace` | `x = a`; `θ = 0` | `τ = 0`, `E e⁰ = 1 = e⁰`; `θ = 0`: `E 1 = 1` with `τ < ∞` a.s. | degenerate cases consistent; no change |
| `brownian_interval_exit` | `|x| ≥ K`; `|x| < K` | `τ = 0`, `max 0 (K²−x²) = 0`; `E τ = E(x+B_τ)² − x² = K² − x²` | correct; no change |
| 6.2 truncated exponential | `B_t ~ N(x,t)` | `e^{αx} P̃(W_t < a−x)` with `W_t ~ N(αt,t)` = `e^{αx}Φ((a−x−αt)/√t)` | correct; no change |
| 6.2 hitting density | `x ≠ a`, `t > 0` | `d/dt 2P(B_t ≥ |a−x|) = |a−x| e^{−(a−x)²/2t}/√(2πt³)` | correct; no change |
| `brownian_lil` normalization | `t ≤ e` | `log log t ≤ 0`, `Real.sqrt` of a negative is 0, division gives 0; outside the eventual filter | junk values harmless; no change |
| `brownian_exact_uniform_modulus` | `2B`; line `x(t) = t`; `T = 0` | ratio limit 2; line `h/√(2h log(1/h)) → 0`; `T = 0`: sup 0, ratio 0 ≠ 1 | matches Mörters–Peres 1.14 scaled to `[0,T]`; `0 < T` needed; no change |
| `brownian_simultaneous_nowhere_differentiable` | line `x(t) = t` | differentiable everywhere, variance 0 ≠ t | excluded by `IsBrownianReal`; no change |
| 6.4 inverse radius | `d = 3`, `|x| = r`, `t > 0` | Newton's sphere average `1/max(r,s)`: `(1/r)P(S ≤ r) + E[1/S; S > r] = (2Φ(r/√t)−1)/r − 2φ/√t + 2φ/√t` | §9.4a value `(2Φ(r/√t)−1)/r < 1/r` correct; no change |
| 6.5 submean Checks | `u = ‖x‖²`, `−‖x‖²`, `3` on the unit disk | `Δu = 4`, center 0, average `1/2`; `Δu = −4`, `0 > −1/2`; constant 3 both sides | correct; no change |
| 6.5.1 normalization | `d ≥ 2` | `c_d = d·vol(B)` = sphere area; `K_prob = (1−‖x‖²)/‖x−ζ‖^d`, mass 1 against `σ_prob` | correct; no change |
| `exists_brownian_localTime` | `T = 1`, `a = 0` | `E L₁⁰ = E|B₁| = √(2/π)`; `sgn(0) = 0` differs from Revuz–Yor's `sgn(0) = −1` only on a `dt×P`-null set | Tanaka normalization correct; no change |
| `dambisDubinsSchwarz` example | `M = 2B`, `A = 4t` | `W_s = 2B_{s/4}` has variance `s`; `W_{4t} = 2B_t` | correct; no change |
| `stochasticExponential`/`novikov_expectation` | `θ = 0`; `θ = 2`, `T = 3`; sign/energy errors | density 1; `exp(2B₃ − 6)`, `E = e^{6−6} = 1`; reversed cross term mean `−6`, no half-energy `e⁶` | Checks correct; no change |
| `girsanov_on_horizon` | `θ = 2, T = 3`; tilt only on `[0,1]` | `Q`-mean `B₃ = 6`, corrected 0, variance 3; `Q`-mean `B₂ = 1`, `1 − 2 = −1` | minus-sign correction and horizon restriction correct; no change |
| `cameronMartin_pushforward` sign | one coordinate `T`, `u = h_T/T` | `dN(h_T,T)/dN(0,T)(x) = exp(h_T x/T − h_T²/2T) = exp(∫u dB − ½∫u²)` | positive sign correct; no change |
| `cameronMartin_equivalence` at `T = 0` | `h(0) = 0`; `h(0) ≠ 0` | laws `δ₀`, `δ_{h(0)}`: equivalent iff `h(0) = 0`; `u = 0` is a shift | correct; no change |
| Layer 8 examples | `h = 2t` on `[0,3]`; `h = √t`; `h(0) = 1` | energy 12, density `exp(2B₃ − 6)`; `∫₀¹ 1/(4t) = ∞`; initial evaluations separate | correct; no change |
| 8.3 `h = t²` | `[0,T]` | `½∫4t² = 2T³/3` | correct; no change |
| 1.4 Volterra inverse | `z = ∫₀ᵗKx` | `z' + Kz = Ky` ⇒ `z(t) = ∫₀ᵗK(s)e^{−∫_s^tK}y(s)ds`, `‖T_K⁻¹‖ ≤ 1 + T‖K‖∞e^{T‖K‖∞}` | correct; no change |
| 9.1 Gronwall constant | `K_b`, `K_σ` | three-term bound `3E|ΔX₀|² + 3TK_b²E∫|Δ|² + 12K_σ²E∫|Δ|²` ⇒ `c_T = 3TK_b² + 12K_σ²` | correct; no change |
| `exists_strongSolution` examples | `b = σ = 0`; `b = tx`; `b = 2√|x|` | `X = ξ`; `X = ξe^{t²/2}`, `L_T = T`; `X = 0` and `X = t²` both solve | Lipschitz hypothesis is sharp; no change |
| 9.4 OU | `λ ≠ 0`, `λ = 0`, stationary | `Cov(Z_s,Z_t) = σ²e^{−λ(t−s)}(1−e^{−2λs})/2λ`; `σ²s`; `Var X₀ = σ²/2λ` gives `σ²e^{−λ|t−s|}/2λ` | correct; no change |
| 9.4 GBM moments | `p > 0` | `E e^{pσW_t} = e^{p²σ²t/2}` ⇒ `exp((pμ + p(p−1)σ²/2)t)` | correct; no change |
| 9.4 hyperbolic | `X = sinh(C+t+B)` | `dX = cosh·(dt+dB) + ½sinh dt = √(1+X²)(dt+dB) + (X/2)dt` | correct; no change |
| 9.4 Lyapunov `V = log(1+y²)` | `y² ≥ 2`, `u = f/(1+y²)` | `LV = 2yf/(1+y²) + (1−y²)f²/(1+y²)²`; `(y²−1)u² − 2yu + 2 ≥ 0` iff discriminant `8 − 4y² ≤ 0` | correct; no change |
| 9.4 arcsin–sech ODE | `w = C − z` | `F' = 2cosh w/(2cosh w − sinh w) = 1/(1 − ½tanh w) ∈ (2/3, 2)`; `2cosh − sinh > cosh > 0`; hit time `F(C) − F(z₀) > 0` for `z₀ < C` | README formulas correct (the Lean copies are padding, R03); no change |
| 9.4a Bessel kernel | `d = 3` | `I_{1/2}(z) = √(2/πz)sinh z`; `ν = 1/2` | correct; no change |
| 10.2 pseudoinverse | `A = diag(2,0)`, `0`, invertible; `ε = 1/(k+1)` | `A*(AA*+εI)⁻¹ = diag(2/(4+ε),0) → diag(1/2,0)`; `AA⁺ = A⁺A = diag(1,0)`; `0 → 0`; `A⁻¹` | Checks correct; R06 is about the contract wording only |
| 10.2/10.3 examples | generator on `x²`; `q = 2`, payoff 1 | `½·2 = 1`; `d[e^{∫q}u] = e^{∫q}(∂_t u + Lu + qu) = 0` ⇒ `u = e^{2(T−t)}`, killing `e^{−2(T−t)}` | sign convention correct; R04(a) statable |
| 2.3 doubling | fair signs | `W_n = 1 − 2ⁿ1_{τ>n}`, `E[W_n1_{τ>n}] = 2^{−n} − 1 → −1` | signed tail fails as stated; no change |
| 2.3 gambler's ruin | `p ≠ q`; `p = q` | `((q/p)^s − 1)/((q/p)^{r+s} − 1)`; `s/(r+s)` | correct; no change |
| 2.2 dyadic examples | `ξ_n = 2ⁿ1_{[0,2^{−n})}`; `F_t = D_{⌈t⌉}` | martingale, `Eξ_n = 1`, `ξ_n → 0` a.s., not UI; `F_{0+} = D_1 ∋ [0,1/2) ∉ D_0` | correct; no change |
| 0.6.1 Checks | `δ₁ + δ₃`; rate 0; `F₀` reveals `T₀ > 1` at rate 1 | times 1,3, waits 1,2; all event times `∞`; `P(A ∩ A) = e^{−1} ≠ e^{−2}` | correct; no change |
| 0.6.0 simplicity | mesh `T/m` | `m·P(Poisson(αT/m) ≥ 2) ≈ m(αT/m)²/2 → 0` | correct; no change |
| 0.0 finite/cofinite content | `1 = 1_Ω = Σ1_{n}` | coefficient-mass sums 1 and 0 | non-uniqueness correct; no change |
| Worked example `X ∈ {−1,0,1}`, `Y = X²` | uniform on `Fin 3` | `EX = 0`, `EY = 2/3`, `EXY = 0`, `Var X = 2/3`, `Var Y = 2/3 − 4/9 = 2/9`; `P(X=0,Y=0) = 1/3 ≠ 1/9` | README and Lean values agree; the Lean block is padding (R03) |
| Conditional-mean table | `ξ = 2x²` on thirds; densities `x+y`, `(3/2)(x²+y²)`; disk | `2/27, 14/27, 38/27`; `(1/3+y/2)/(1/2+y) = (2+3y)/(3+6y)`; `(1/4+y²/2)/(1/3+y²) = (3+6y²)/(4+12y²)`; `(1−y²)/3` | all correct; no change |
| Conditional share | `B = {x ≤ ½, y ≤ ½}` | `P(B) = ½log2`, `E[s1_B] = ¼ − (log2)/8`, ratio `1/(2log2) − ¼` | correct; no change |
| Finite-lot model | weights `1/((N+1)(N−i+1))` | `P(A_N) = (N/2+1)H_N/(N+1)`; `E[s1_A] = (N/2+1)[(N/2+1)/N − (1/N+¼)H_N]/(N+1)`; quotient `(½+1/N)/H_N − ¼ − 1/N`; error `≤ 2.5/N ≤ 5/N` | correct; no change |
| Assignment reflection example | `ξ = 2x²`, `η = (x−½)²` | `(2x² + 2(1−x)²)/2 = 2η + ½` | correct; no change |
| Coin example | `p₅₀ = ½` | `η + 25 ∈ {25,35,45,55}` | correct; no change |
| Corrections table rows 100, 102, 157 | `α = 3, x = 1`; variance `Δt`; `n = 3, k = 1` | `3 > 2·1`; sixth moment `15Δt³`, left-rectangle error `T³/(3n²)`; `(3+1)/2 = 2` positive steps | correct; no change |

## Not verifiable

- **Karatzas–Shreve** (§2.8, §2.9, §3.2.D, §3.3, §3.4, §3.5, §5.2, §5.7, Theorems 2.9.18 and 2.9.25): Springer, paywalled; cited by locator only.
- **Revuz–Yor** (IV.1.8, VI §1, VIII §1, V §1, XI §1) and **Protter**, **Kunita**: paywalled; cited at chapter level.
- **Chung–Rao 1981** (Seminar on Stochastic Processes): Springer, paywalled; the ordinary gauge statement was checked against Chung 1985 (Numdam) instead.
- **Burkholder 1973** (Annals of Probability): open at Project Euclid, but both the DOI and the `journalArticle/Download` route return the host's bot-protection page ("Request unsuccessful. Incapsula"); cited only as a general distribution-function reference.
- **Baudoin, Lecture 24**: the author-page html text is readable but every displayed formula was dropped by the converter (`baudoin-l24 line 51`–`57`); only the theorem's structure (continuous local martingale, zero start, every `p > 0`, universal constants) could be checked, not the exact form of the two-sided inequality.
- **MATH5695 (Dooley)**: waived by the manifest; its page citations (§2.2 p. 218, §4.2 p. 235, §5.4 p. 173, §8.3 pp. 261–263, the corrections table) remain uncertified.
- **Talay–Tubaro**: the author-page scan is image-only and was read through OCR; hypothesis (H1) and Theorem 1 are legible, the displayed error expansions only partly.
- **Mörters–Peres Theorems 1.27/1.30 and Exercise 1.7**: the author-page text was read at Theorem 1.14 (`line 965`); the other three locators are the previous review's and were not re-read this round.

## Source issues

- **Misprint** in lalley at Proposition 9, equation (49), printed p. 25: the source sums the probabilities of events indexed by the wrong letter (the union events are indexed by the scale, not the position); it should sum over the scale index just defined; affects nothing.
- **Gap** in lalley at Proposition 9, printed p. 25: the source asserts that excluding differentiability at interior times of `(0,1)` suffices and leaves the reduction as a question; nondifferentiability at the endpoints needs the one-sided three-increment window the roadmap adds in §6.3; affects a stated result.
- **Misprint** in lalley at Proposition 9, footnote 4, printed p. 25: the source itself flags that the constant 16 in (48) may need to be 32 or 64; with the triangle inequality on three consecutive increments of length `4^{−k}` the bound `2C·3·4^{−k}` suffices, so 16 is enough; affects nothing.
