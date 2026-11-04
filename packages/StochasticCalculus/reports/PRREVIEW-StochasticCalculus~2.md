# Review of StochasticCalculus (pull request #1030 at 0326f80)

**Verdict:** needs changes

## R01 (P2) — State the remaining Brownian path headlines

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:2087` and `TauCetiRoadmap/StochasticCalculus/Suggested.lean:13`. The README promises “Lévy's exact scalar uniform modulus” and “simultaneous nowhere-differentiability.”

**Claim:** These are major end results of §6.3, but neither has an acceptance signature or a missing-carrier explanation. The new LIL signature does not cover either result.

**Witness:** Two scratch signatures using only `IsBrownianReal`, `DifferentiableAt`, `sSup`, and `Filter.Tendsto` elaborated at the pins, with only two `sorry` warnings. No new path carrier or stochastic integral was needed.

**Repair:** Add both headline statements to `Suggested.lean`. State nowhere differentiability simultaneously at every positive time, with the one-sided endpoint statement as appropriate; state the exact uniform modulus on each fixed positive finite horizon. Keep the strict positive horizon and the approach through positive mesh sizes. Test normalization with a Brownian scaling: replacing B by 2B doubles the modulus limit from 1 to 2. A deterministic line has derivative 1 and modulus ratio tending to 0, so neither conclusion is a generic continuity theorem. The probe also demonstrates that the missing-carrier rule cannot justify these omissions.

## R02 (P2) — Reuse the existing Moore–Penrose construction

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:3081`: “construct the measurable finite-dimensional Moore–Penrose inverse of σ by regularized inverses and spectral calculus, prove the range/projection identities”.

**Claim:** This assigns the generic inverse construction and its algebraic identities a second owner. The genuinely new requirement here is measurable dependence on a varying diffusion matrix, followed by stochastic reconstruction.

**Witness:** On main, `TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md:500`–PD-C27 already owns the inverse and four Penrose equations. Its `Suggested.lean:274` defines `moorePenroseInverse`; lines 284 and 290 state the equations and uniqueness.

**Repair:** Cite OperatorTheory/PolarDecomposition PD-C19–PD-C27 in Scope and Exact supplier contracts. Retain here the Borel-measurability theorem, the regularized approximation converging to that existing inverse, and the noise-extension construction. Do not create another inverse. For σ=diag(2,0), both constructions must give diag(1/2,0), with σσ⁺=σ⁺σ=diag(1,0); the added independent noise acts on diag(0,1). For σ=0 the inverse and range projection are zero. These checks preserve the rank-changing regime without replanning the supplier. 

## R03 (P3) — Remove auxiliary aliases and acceptance-test padding

**Location:** `TauCetiRoadmap/StochasticCalculus/PointProcessesAdapter.lean:14`, `IndependentLaws.lean:28`, `RawLocalization.lean:32`, and `AutonomousODE.lean:56`.

**Claim:** The additional Lean files still contain definition expansions, direct library aliases, boundary tests and worked-example catalogues. The Lean form rules apply to these files too.

**Witness:** All three PointProcessesAdapter theorems have proof `rfl`. `independent_sum_law` is the single existing `IndepFun.map_add_eq_map_conv_map₀` theorem. `stoppedValue_countable_range` is the single native countable-range sampling theorem. The ODE initial-value assertion closes by one `simp`.

**Repair:** Delete these declarations from the acceptance signatures; in particular, delete them from `Suggested.lean` if consolidating the auxiliaries there. Delete the now-empty PointProcessesAdapter file. Keep the mathematics as README targets/Checks and cite the native declarations. Remove the ThreeAtomExample and FairCoinExample catalogues from acceptance signatures. Do not repair this by proving padding in place. On the three-atom example the computations remain E[X]=0, E[Y]=2/3 and Cov(X,Y)=0, while P(X=0,Y=0)=1/3 differs from 1/9; these useful README controls need no separate Lean catalogue. The ODE initial-value probe reduces inverse-chart evaluation to z₀=z₀.

## R04 (P3) — Apply the Lean form to all six files

**Location:** `TauCetiRoadmap/StochasticCalculus/Suggested.lean:34`, `AutonomousODE.lean:6`, `IndependentLaws.lean:117`, and `PointProcessesAdapter.lean:1`.

**Claim:** Every file uses `StochasticCalculusSuggested`, rather than the required `TauCetiRoadmap.StochasticCalculus` namespace. Auxiliary files retain submodule imports or a roadmap import, incomplete module/declaration docstrings, and `lemma` declarations.

**Witness:** AutonomousODE begins with three `Mathlib.*` imports. PointProcessesAdapter imports another roadmap module. IndependentLaws contains `lemma integrable_bounded_one`; its later worked-example declarations repeat that form. The worker's passing gate did not detect these auxiliary-file violations.

**Repair:** After deleting padding, use the required namespace and single `import Mathlib` in every retained file, with only genuinely used permitted Tau Ceti imports. Give retained declarations mathematical docstrings and use `theorem`. Make each module docstring identify its headline targets and unavailable carriers. Re-elaborate the retained files; do not use options to suppress the auxiliary warnings. This is a manual form finding, not a claim that the recorded gate failed.

## R05 (P3) — Supply definition-level APIs, Checks and dependencies

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:412`, `README.md:2423`, and `README.md:2587`.

**Claim:** Definitions still occur in long prose blocks without their required API lists and at least three discriminating Checks. Nearly all dependencies are pooled at layer ends, even where the text itself distinguishes different prerequisites.

**Witness:** The L⁰ metric at line 412 has no local Checks list. The inverse clock at line 2423 has no three Checks. Layer 3's single `*Needs:*` at line 1641 separates three proof routes only inside one pooled paragraph.

**Repair:** Add the API and three local controls for each definition and give each target its statement/route dependencies. For L⁰, compute d(0,2)=2/3 on a probability atom, d=0 for a null-set alteration, and explain why counting measure on an infinite space makes the real-integral formula invalid as a metric. For clocks test A(t)=t, A(t)=0, and a continuous clock with a plateau: inverses are s, ∞, and the right endpoint of that plateau at its height. These controls distinguish strict from non-strict inverses and expose the infinite-clock case. Repeat this treatment for the remaining definitions rather than relying on a layer's two global examples.

## R06 (P3) — Make source locators independently identifiable

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:2402`, `README.md:3052`, and `README.md:3560`.

**Claim:** Several sampled theorem blocks still have no theorem/page locator. “MATH5695” has no author, institution, edition or URL, so its many page references do not identify a text. The folder has no `sources.toml` recording its works or certification status.

**Witness:** §6.7 states Wiener-shift mixing without a locator; §§10.1–10.3 give whole theorem families against broad book references. The sources service could not identify MATH5695 from its title. The seeded-source ledger below records the resulting limits.

**Repair:** Identify the precise notes and edition and attach exact locators to every theorem, especially all 15 seeded targets. Add the source manifest using one key per work and distinguish fetched, uncertified and waived texts. For inaccessible books keep an honest uncertified locator rather than claiming verification. A corrected §6.7 citation must support the two-sided increment shift and separated-cylinder mixing; overlapping intervals [0,2] and [1,3] have covariance 1 and cannot use a product-law argument. 

## Previous findings, checked before the full pass

No repair disposition declaring a finding “not actionable in this package” was present in the supplied review/change artifacts.

| Previous finding | Head passage and disposition |
|---|---|
| R01: nonmeasurable integral admitted | **Repaired.** `Suggested.lean:138` now requires `IsStronglyPredictable F H`. README §3.2 explicitly excludes nonmeasurable lower-integral impostors. A nonmeasurable Bernstein indicator no longer satisfies the predicate. |
| R02: nonexistent PointProcesses suppliers | **Repaired.** README:201 names `IsAdaptedPoisson.isCompensator`; §§0.6.0–0.6.3 own the process adapters. “count threshold k+1” and separate zero-rate treatment repair the indexing/sentinel problem. The named compensator target was found in the supplier. |
| R03: absent headlines | **Partly repaired.** The file now states Wiener existence, BDG, reflection, exits, strong Markov, representation, LIL, local time, DDS, Cameron–Martin and SDE uniqueness. The remaining concrete omission is R01 above. |
| R04: duplicated submean theorem | **Repaired.** README:2273 applies the pinned `SubharmonicOn` construction rather than reconstructing the C² submean theorem. The negative quadratic is explicitly excluded by the Laplacian condition. |
| R05: padding | **Partly repaired.** Main-file aliases were removed; the auxiliary aliases and example catalogues remain. R03 above gives exact witnesses. |
| R06: Lean form | **Not repaired in the auxiliaries.** `namespace StochasticCalculusSuggested` and forbidden auxiliary import/lemma forms remain. See R04. |
| R07: README form | **Partly repaired.** The opening Summary, Scope, Conventions and layer Examples/Dependencies headings now exist. Definition-level API/Checks and individual Needs remain incomplete; see R05. |
| R08: source precision | **Partly repaired.** Lalley and section-theorem locators are substantially more precise, but the unidentified notes and broad book citations remain; see R06. |
| R09: SupplierDependencies stray file | **Repaired.** The file was deleted. The worker gate reports `stray-files=0`; no replacement stray source file was found. |

## Verified sound

All six Lean files and the README were read, including unchanged passages. The tables are adversarial tests, not proofs or certification of inaccessible texts. No false main-file headline, sorry-bodied data, set_option, outside-folder edit or cycle was established. §9.6 develops convergence theory, not an executable algorithm.

The recorded push gate at this exact head says:

```text
gate StochasticCalculus: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

The dependency check was rerun, without changing the order:

```text
depcheck: 210 roadmaps, 1445 edges, 0 problem(s)
```

No UPWARD/CYCLE/moved line appeared; all 12 Needs lines were read. Direct elaboration passed with 31 sorry warnings only. A scratch copy checking all 49 elaborated signatures also passed. No lost necessary binder was found: stochasticExponential legitimately needs no measurable-space binder for Ω. Probability, filtration and initial-data hypotheses remain explicit.

Scratch one-tactic probes (`simp`, `rfl`, `infer_instance`) closed none of the 31 main admitted statements. Auxiliary probes closed `odeSolution_initial` with one `simp [odeSolution, timeCoordinateEquiv]`; native-lemma/rfl aliases were inspected directly. Probe failures do not indicate a submitted-build failure. Both missing-headline probes elaborated.

### Headline coverage

The README's headline families are Wiener existence and path-space laws; stochastic integral existence/uniqueness/isometry; continuous brackets and BDG; Itô/Stratonovich; Lévy characterization and Brownian representative selection; strong Markov and representation; reflection, exits, LIL, exact uniform modulus and nowhere differentiability; local time and reflected motion; harmonic/Hardy boundary theory; DDS; Novikov/Girsanov; Cameron–Martin equivalence/singularity; strong/weak SDEs, maximal solutions and flows; diffusion kernels/generators/martingale problems and Feynman–Kac.

Scalar headline signatures are present except R01. The docstring identifies missing general semimartingale, vector-integral, maximal-solution/flow, Hardy/trace, diffusion-generator-domain and independent-extension DDS carriers. These exclusions have no free-predicate stand-ins.

### Pinned declarations and ownership

Mathlib was checked at `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following 12 declaration sites were opened, not inferred from a name search:

| Pin and site | What the declaration supplies, and its limit |
|---|---|
| `Mathlib/Probability/BrownianMotion/Basic.lean:75`, `:302` | `IsPreBrownianReal` and `IsBrownianReal`: Gaussian finite-dimensional laws and a.e. path continuity; no arbitrary-filtration adaptation. |
| `Mathlib/Probability/Process/LocalProperty.lean:93` | `Locally`: native localization with the `0<τ` indicator; not an integrability assertion about an arbitrary initial value. |
| `Mathlib/Probability/Martingale/OptionalSampling.lean:89` | Countable-range conditional sampling, including the trimmed sigma-finiteness hypothesis. It directly supplies RawLocalization's alias. |
| `Mathlib/Probability/Independence/Basic.lean:839` | `iIndepFun.map_fun_eq_pi_map`, with finite index and a.e. measurable coordinates. |
| `Mathlib/Probability/Independence/Integration.lean:358` | `IndepFun.integrable_mul`, for independent integrable factors; mere zero covariance is insufficient. |
| `Mathlib/MeasureTheory/VectorMeasure/WithDensityVec.lean:366` | `Measure.variation_withDensityᵥ`: norm-density variation under the stated integrability/completeness hypotheses. |
| `TauCeti/Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464` | The C² submean inequality, with continuity on the closed ball, positive radius and nonnegative Laplacian. |
| `TauCeti/Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:63` | Continuous submean-value objects, not arbitrary upper-semicontinuous extended-valued functions. |
| `TauCeti/Analysis/InnerProductSpace/Laplacian/ParametricIntegral.lean:80` | `harmonicOnNhd_integral_smul_of_contDiffOn`, with integrable weight, continuous parameter map, joint C² neighborhood and compact/second-countable parameter hypotheses. |
| `TauCeti/Probability/Distributions/Gaussian/Hermite/Pi/Basis.lean:54` | `gaussianHermitePiBasis` on finite products of standard Gaussian measures; Brownian-increment pullback is a separate adapter. |
| `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:167` | `exists_isProjectiveLimit_of_countable`, for countable standard-Borel products of consistent probability laws. It is not already continuous-path Wiener measure. |
| `TauCeti/Probability/Martingale/Convergence.lean:164` | `tendsto_ae_condExp_iInf`, finite-measure reverse conditional-expectation convergence. Nonintegrable arguments use the library's zero convention. |

Also opened `TauCeti/LinearAlgebra/LinearMap/PseudoInverse.lean:30`: `LinearMap.exists_comp_comp_eq_self` only gives an algebraic generalized inverse. It is not a substitute for the four Hilbert-space Penrose equations in R02.

Object searches covered the roadmap index, relevant main/open files and board packages: stochastic integration, Cameron–Martin/RKHS, Donsker, predictable measures, local time, Moore–Penrose and Hardy theory. R02 records the additional overlap. Generic supplied carriers are distinguished from the new stochastic and finite-measure adapters.

Cross-roadmap resolutions read this round:

| Citation | Resolved target |
|---|---|
| PointProcesses Layers 0, 4, 10, 11 | Native point-measure/Poisson ownership; temporal carrier, event times and `IsAdaptedPoisson.isCompensator` found in the indexed supplier. The latter requires measurable N, sigma-finite deterministic intensity and compact-time finiteness. The README now supplies those arguments. |
| OrthogonalL2Bases Part D | `Completed/OrthogonalL2Bases/README.md:372`: Gaussian finite-product Hermite basis; native implementation above. |
| StandardDistributions §§8.1, 12.1–12.2 | `TauCetiRoadmap/StandardDistributions/README.md:1227`, `:2143`, `:2159`: Bessel and sphere normalizations. `Real.besselI` is a roadmap target, not falsely asserted as pinned Mathlib. |
| PDE C12/C15 and C/F | `TauCetiRoadmap/PDE/README.md:290`, `:298` and Lane F: deterministic mean-value/Dirichlet/parabolic ownership. The measurable-to-continuous and finite-signed-boundary-measure adapters here are distinguished from those targets. |
| OneParameterSemigroups Part A | `Completed/OneParameterSemigroups/README.md:90`: the single `LinearPMap` generator, domain, growth bounds, resolvent and closedness theory. Diffusion core/dense-range premises remain here. |
| DifferentialGeometry §0.3 | `TauCetiRoadmap/DifferentialGeometry/README.md:284`: differentials and pullbacks; not stochastic chain rules. |
| ConformalMapping | `Completed/ConformalMapping/README.md:116`, `:119`: disk automorphisms and Riemann mapping; stochastic clock/exit transport remains here. |
| FinancialMathematics M0.1, M0.4 | Main targets at README lines 11 and 57 consume the linear SDE and Gaussian payoff interface; no reverse supply edge. |
| OptimalTransport §13C | Main README:1543 consumes the Wiener reference/scaling interface. Its entropy/reciprocal-process ownership is not rebuilt here. |
| OperatorTheory/PolarDecomposition | Main PD-C19–PD-C27, README:500 and Suggested:274; see R02. |

The resolver's three leads resolve: local toProcess, supplier IsAdaptedPoisson.isCompensator and StandardDistributions Real.besselI. MarketImpact is only a consumer/feedback-model owner, not a prerequisite.

### Computed adversarial checks

The tables retain 95 computed rows covering the headline theorems, all 15 seeded targets and finding witnesses. B is standard scalar Brownian motion, P a probability measure, and T a finite horizon unless stated otherwise. “Pass” means agreement on the displayed instance, not a proof; “excluded” means the hypotheses reject the wrong model.

| Statement / definition | Instance | Computed sides / negative control | Result; change |
|---|---|---|---|
| `IsFilteredBrownian` | B; 2B; filtration revealing sign(B₁) at 0 | Variance on [1,3] is 2 versus 8; revealing event has joint probability 1/2 versus product 1/4 | Wrong models excluded; no change |
| `exists_wienerMeasure` | Coordinates 0,1,3; zero Dirac law | Means 0; cov(1,3)=1 and var(3)=3; Dirac gives 0 instead of 3 | Discriminates construction; no change |
| `predictableMeasure` | Same rectangle, P(A)=1/4 | Trim and product both give 2·1/4=1/2; T=0 gives 0 | Pass; delete rfl aliases, R03 |
| `exists_stronglyPredictable_ae_of_progressive` | H=1_{t=1}, K=0 | Product-a.e. difference integral 0; at t=1 difference 1 | Conclusion is product-a.e., not indistinguishability; no change |
| `IsItoIntegral` | H=1, I=B versus I=0 | Approximation error 0 versus E sup abs(B)²>0; at T=0 forces I₀=0 | Nonmeasurable H now excluded; prior R01 repaired |
| `itoIntegral_isometry` | H=2, T=3 | E(2B₃)²=12=∫₀³4 ds | Pass |
| `exists_isItoIntegral` | H=2 | I=2B, energy and terminal variance both 4T | Pass |
| `isItoIntegral_unique` | H=2, candidate 2B and 0 | Correct pair difference 0; wrong candidate terminal squared error 4T | Wrong candidate excluded; no change |
| `itoIntegral_localMartingale` | H=Z as above | Stopped finite-energy integral ZB; conditional centered increments 0 | Local conclusion appropriate; no change |
| `itoIntegral_local_congr` | H=1 on rational times, K=0 | dt×P squared difference 0; both integrals 0 | Pass; arbitrary deterministic left sums would incorrectly give B_T |
| `exists_isQuadraticVariation` | M=0 and M=2B | A=0 and A=4t satisfy zero start/monotonicity | Pass |
| `isQuadraticVariation_unique` | M=2B; A=4t versus 8t | Square-compensator means 0 versus −4t | Wrong alternative excluded; no change |
| `brownian_quadraticVariation` | t=0,3 | Bracket values 0,3; squared means 0,3 | Pass |
| `continuous_bdg` | Zero M; B stopped at exit ±1, p=2 | Zero gives 0≤0≤0; exit gives E sup M²=1 and E bracket=Eτ=1 | Constants must bracket 1; no change |
| `levy_characterization_adapted` | B versus 2B | Brackets t versus 4t | Correct normalization; no change |
| `exists_predictable_brownian_of_localMartingale` | B with null-path alterations | Common-a.e. difference 0; chosen representative retains bracket t | Representative qualification appropriate; no change |
| `filteredBrownian_of_brownianLaw_localMartingale` | Initial revelation of sign(B₁) | E[B₁ given B₁>0]=sqrt(2/π), not 0 | Local-martingale input excludes enlargement; no change |
| `exists_predictable_brownian_version` | Literal B plus a common-null alteration | Path difference 0 a.s.; laws and brackets unchanged | Selection, not raw measurability transfer; no change |
| `brownian_ito_C2` | f(x)=x²; f=3 | B_t²=2∫B dB+t, expectations t=0+t; constant identity 3=3+0+0 | Half-Laplacian correct; no change |
| `brownian_reflection` | a=1,t=1; t=0,a>0 | Both probabilities 2(1−Φ(1))≈0.31731; both 0 at t=0 | Pass; a=0,t=0 would give 1 versus 2 and is excluded |
| `brownian_hitting_laplace` | Distance 1, θ=1/2; distance 0 | Transform e^(−1); at initial hit both sides 1 | Pass |
| `brownian_interval_exit` | K=2,x=1; x=3 | Mean exit 4−1=3; outside start gives 0, not −5 | Positive-part/outside convention correct; no change |
| `brownian_strongMarkov` | τ=0 and deterministic τ=1 | Shifted increment variance t, covariance min(s,t), mean 0 | Pass; finite-stop restriction retained |
| `brownian_martingaleRepresentation` | ξ=B₁² | Eξ=1, H=2B, integral B₁²−1; 1+(B₁²−1)=ξ | Nontrivial representation witness; no change |
| `brownian_lil` | B versus 2B | Limsup/liminf ±1 versus ±2 | Wrong scale excluded; no change |
| Omitted exact uniform modulus | B versus 2B, zero path | Limits 1 versus 2 versus 0 | Signature feasible; R01 |
| Omitted simultaneous nondifferentiability | Straight path x(t)=t | Derivative 1 at every t; variance 0 versus required t | Brownian hypothesis essential; R01 |
| `exists_brownian_localTime` | a=0,t=1 | E L₁⁰=E abs(B₁)=sqrt(2/π)≈0.79788456; half-scale gives 0.39894228 | Tanaka normalization correct; no change |
| `dambisDubinsSchwarz` | M=2B, A=4t | Inverse clock s/4; W_s=2B_{s/4}, var W_s=s, W_{4t}=M_t | Pass; finite-terminal-clock extension separately excluded |
| `novikov_expectation` | Same θ,T | Novikov expectation exp(6)<∞; density expectation 1 | Pass |
| `IsBrownianOn` | Terminal density at T=1, θ=1 | Under Q, E B_t=t for t≤1, but E(B₂−2)=−1 | Horizon restriction necessary and present |
| `girsanov_on_horizon` | θ=1,T=1 | Under Q, B_t−t has mean 0 and variance t on [0,1] | Correct minus sign; no change |
| `IsCameronMartinShift` | h=2t,u=2,T=3 | h₀=0, ∫u=2t, energy 12 | Wrong h₀=1 fails at 0; no change |
| `cameronMartin_pushforward` | Same h | Shifted B₃ mean 6; density exp(2B₃−6) tilts mean to 6 | Correct translation sign; no change |
| `cameronMartin_equivalence` | h=2t; h=0,T=0 | Positive density above; zero horizon gives identical δ₀ | Pass |
| `cameronMartin_singularity` | h≡1; h=sqrt(t) on [0,1] | At 0 supports {0} versus {1}; second derivative-energy ∫1/(4t)=∞ | Both outside CM; no change |
| `exists_strongSolution` | Same b, finite horizon T | Lipschitz constant T; drift integral ξ(exp(t²/2)−1) | Pass |
| `strongSolution_pathwise_unique` | b(x)=2sqrt(abs x), σ=0, ξ=0 | X=0 and X=t² both solve; coefficient fails Lipschitz at 0 | Excluded control; no change |

The following rows retain all 15 seeded targets, additional headline families and the witnesses relevant to the findings.

| Statement / target | Instance | Computed sides / negative control | Result; change |
|---|---|---|---|
| §0.1 L⁰ metric | One probability atom, f=0,g=2 | d=2/3>0; null alteration gives 0; infinite counting-measure constant integrand is nonintegrable, real integral 0 | Finiteness retained; add local Checks, R05 |
| **§0.5 predictable times** | τ=1 on A,2 off A; P(A)=1/2 revealed at 1 | Time-1 graph section is A; F_{1−} probabilities only 0,1, so A is excluded | Nonpredictability witness correct |
| §0.5 zero/infinite predictable time | τ=0 on F₀ event A,∞ elsewhere | τ∧n equals 0 on A,n elsewhere; limit 0/∞ and strict inequality on {τ>0} | Pass; no zero-time exception lost |
| **§0.6.0 process-to-point-measure** | Waiting times 1,2 | Event times 1,3; point measure δ₁+δ₃; counts at 0,1,2,3 are 0,1,1,2 | Correct origin and cumulative-wait convention |
| **§0.6.1 event dictionary** | Same two events, k=0,1,2 | Thresholds k+1 give times 1,3,∞; threshold k would give erroneous initial time 0 | Sentinel/index repair works |
| §0.6.2 external filtration | Poisson rate 2, T=3; future count revealed at 0 | Mean/variance 6; revealing N₃ makes conditional future count N₃ instead of 6 | Marginal Poisson law alone insufficient; external independence retained |
| §0.6.3 compensator | Rate 2, T=3; rate 0 | Predictable mean measure 6, compensated mean 0; zero rate gives empty measure and compensator 0 | No exponential waiting distribution of rate 0 asserted |
| §1.5 Donsker interpolation | Symmetric ±1 steps at n=4, t=1 | Scaled sum variance 4/4=1; unscaled sum variance 4 | Centering and variance normalization retained |
| **§2.2 Doob theory** | Constant martingale 1, p=2 | E sup M²=1≤4E M_T²=4; maximal tail at threshold 1 equals 1 | Nontrivial constant check; source locator uncertified |
| §2.2 generated-field convergence | M_n=2^n 1_{U≤2^(−n)} | E M_n=1, a.s. limit 0, L¹ distance from 0 is 1 | UI is essential for L¹/terminal identification |
| §2.2 complete non-right-continuous filtration | Dyadic D_{ceil t} | F₀=D₀; F_{0+}=D₁; event [0,1/2) has mass 1/2 and is absent from D₀ | Concrete strict inclusion correct |
| **§3.1 predictable measures** | Time measure on (1,3] and event mass 1/4 | Product/trim mass 1/2; point {0} contributes 0 | No missing comparison inferred from rfl |
| §3.2 elementary completion | Integrand 2 on (1,3] | Energy 8; terminal integral variance 4·2=8 | Isometry starts from measurable elementary coefficients |
| §4.4 jumps | M=N−λt | [M]_t=N_t, predictable bracket λt; expectation both λt but values differ | Jump/continuous distinction retained |
| **§5.3 Stratonovich** | ∫B∘dB on [0,1] | Value B₁²/2, mean 1/2; Itô integral mean 0 | Correction +[B]/2 correct |
| §5.3 biased sampling | Evaluation at fraction p=3/4 of each Brownian interval | Cov(B_{left+ph},ΔB)=ph; total expected sum 3/4 versus Stratonovich 1/2 | Symmetric/time-mesh hypotheses discriminate |
| **§5.4 stochastic exponentials** | M_t≡3 versus centered M−M₀ | Centered exponential starts 1; using exp(M_t) starts e³ | Centering convention essential and stated |
| **§5.5 Lévy and Brownian versions** | Matrix process (B,2B) | Bracket matrix t[[1,2],[2,4]], not tI₂ | Component marginal claims do not imply vector Brownian law |
| §6.5 Poisson normalization | Unit disk, u=3 | Probability kernel at center 1; area kernel 1/(2π); both integrals 3 with corresponding boundary measures | Correct area/probability conversion |
| §6.5 finite boundary measures | μ=δζ, unit mass | Radial L¹ norm 1; boundary measure atomic, hence no L¹ density | p=1 finite-measure result distinguished from density result |
| §6.5 signed measure scaling | μ_prob mass 1; μ_area=2π μ_prob | TV norms 1 and 2π; paired Poisson functions equal | Scale factor in measure, not just kernel |
| §6.5 C² submean | u(x)=x² and u(x)=−x² on interval radius 1 | Center 0 versus ball average 1/3; negative quadratic gives 0 versus −1/3 | Native Δ≥0 condition excludes counterexample |
| §6.5 Hardy comparison | Constant harmonic u=3 | Radial Lp norm, boundary norm and Brownian maximal value all 3 | Checks normalization, not numerical sharp constants |
| **§6.6 local time/reflection** | B₀=0,T=1 | abs(B₁)=∫sgn(B)dB+L₁⁰; expectation 0.79788456=0+0.79788456 | abs(B) alone is not Brownian; local-time correction retained |
| **§6.7 Wiener dynamics** | θ₁ followed by θ₂ | (θ₁θ₂ω)(t)=ω(t+3)−ω(3)=θ₃ω(t) | Cocycle shift correct; add exact locator R06 |
| §6.7 separated/overlapping cylinders | Increments [0,2],[1,3] | Variances 2,2; covariance overlap length 1 versus product-law covariance 0 | Only separated increments independent |
| §7.1 strict clock inverse | A=t; A=0; A flat at height 1 on [1,2] | T(s)=s; T(s)=∞; T(1)=2 | Strict-inverse convention fixed; add Checks R05 |
| §7.2 DDS stopped clock | M=B_{t∧1} | Bracket tends 1, so inverse for s>1 is ∞ | Independent extension needed beyond terminal clock; correctly separated |
| **§7.4 Girsanov** | θ=2,T=1 | Tilt gives B₁ mean 2; corrected B₁−2 mean 0 and variance 1 | Correct sign/horizon; book text uncertified |
| §7.5 infinite horizon | Constant nonzero θ | Each Z_T has mean 1; Z_T→0 a.s. as T→∞ | Finite-horizon equivalence does not imply global equivalence |
| §8.1 Gaussian RKHS | One coordinate variance 2, shift 2 | Energy a²/v=2, log-density x−1; E density=1 | Covariance inverse, not covariance, supplies energy |
| **§8.2 Wiener identification** | h(t)=2t on [0,3]; h(t)=sqrt(t) | CM norm²=12; second candidate norm²=∞ | Correct Cameron–Martin class; exact source locator absent |
| §8.3 finite-grid likelihood | v=(1,2), a=(1,2) | Energy 3; p=2 and p=−1 moments both exp(3); p=0,1 moments 1 | Correct p(p−1)/2 factor |
| §8.3 zero variance | v=0,a=1 | Translated law δ₁ versus δ₀; total division a²/0=0 would falsely give density 1 | Strict variance hypothesis excludes junk division |
| §8.3 h(t)=t² | T=1, coarse derivative average 1 | True energy 4/3; coarse energy 1; likelihood L² error exp(4/3)−e>0 | Coarse grid is not already continuum limit |
| §9.2 maximal/local solutions | Deterministic x'=x²,x₀=1 | X_t=1/(1−t), explosion at 1 | Local Lipschitz alone does not imply global existence |
| §9.3 weak/pathwise uniqueness | Zero drift/unit diffusion | X=B gives Gaussian law; product extension preserves this law | Weak law and literal driving path distinguished |
| §9.4 linear SDE / GBM | dX=aX dt+bX dB | X_t=x exp((a−b²/2)t+bB_t), E X_t=x exp(at) | Itô correction −b²/2 passes |
| §9.5 flow/cocycle | Translation flow | X_{s+t}(x,ω)=x+ω(s+t); X_t(X_s,θ_sω) gives same value | Unshifted composition would give ω(s)+ω(t), generally different |
| **§10.1 kernels/Markov** | Brownian transition, times s,t | Mean x; composed variance s+t equals direct variance s+t | Semigroup identity passes |
| §10.1 C₀ preservation | Deterministic b(x)=−x³ | Flow x/√(1+2tx²) tends ±1/√(2t) as x→±∞ | Escape can fail; bounded-coefficient regime avoids this example |
| **§10.2 generator** | b=0, f=x², σ=1 versus 2 | Lf=1 versus 4; E f(X_t)−f(0) equals t versus 4t | Half trace and σσ* correct |
| §10.2 Moore–Penrose | σ=diag(2,0) | σ⁺=diag(1/2,0); σσ⁺=diag(1,0); complement diag(0,1) | Retain measurable adapter, cite existing owner R02 |
| §10.2 rank zero | σ=0 | σ⁺=0, range projection 0, complementary noise full identity | No invertibility shortcut |
| §10.2 resolvent/core criterion | A=0, λ=2 on ℝ | R=1/2; A(Ry)=0=2(y/2)−y; image-density and domain-density agree | λ in resolvent set is essential |
| **§10.3 Feynman–Kac** | Constant q=2, forcing 3, terminal 5, duration 1 | Value 5e²+3(e²−1)/2; derivative obeys v'=2v+3 | Potential and source signs consistent |
| §10.4 stopped gauge | q=0, boundary ψ=1 | Weight 1, gauge 1, solution 1 | Pass; general exponential exit moments still need hypotheses |

Auxiliary witnesses for R03 are retained below; the repetitive declaration-by-declaration ledger is omitted.

| Auxiliary statement | Instance | Computed sides | Result; change |
|---|---|---|---|
| IndependentLaws `independent_sum_law` | Independent Bernoulli(1/2) pair | Sum masses at 0,1,2 are 1/4,1/2,1/4 on both pushforward/convolution sides | Native alias; R03 |
| `independent_finite_vector_law` | Two fair bits | Four vector atoms each mass 1/4; empty family has single atom mass 1 | Native alias; R03 |
| `independent_sum_hasPDF` | Independent uniform [0,1] pair | Density at 1 is 1, at 1/2 is 1/2, outside [0,2] is 0 | Native alias; R03 |
| `not_indep_X_Y` | X=0,Y=0 event | Joint mass 1/3 versus product 1/9 | Discriminating README Check; R03 |
| `cylinder_probability` | Two specified distinct coordinates | Probability 1/4=2^(−2) | Check/native product evaluation; R03 |
| `odeSolution_initial` | Arbitrary z₀,t=0 | z₀=z₀ by inverse law | One-simp padding; R03 |
| Raw `stoppedValue_countable_range` | Constant martingale 7, stop 1 | Stopped value 7=conditional expectation 7 | Native alias; R03 |
| Adapter `nnvolume_eq_comap_volume` | Interval (1,3] | 2=2, identical definition expansion | Delete, R03 |
| Adapter `timeMeasure_eq_comap_volume` | T=3 | 3=3, identical definition expansion | Delete, R03 |
| Adapter `predictableMeasure_eq_comap_volume` | Rectangle mass 1/2 | 1/2=1/2, identical trim expression | Delete, R03 |

### Seeded source verification

Every one of the 15 requested targets was traced to its available reference. Absence of an exact locator is reported separately from a text being inaccessible. No source passage is reproduced here. There was no additional literal “unverified” locator flag in the README to certify independently.

| Seeded target | Locator/text inspected | Verification result |
|---|---|---|
| 0.5 predictable times | Theodorakopoulos v2, Definition 4.1, Lemma 4.2 and Theorem 4.4, printed pp.5–6; `theodorakopoulos line 288`, `line 304`, `line 318` | Pointwise announcing times and raw predictable sections are supported. The outer-projection probability is used; no usual conditions are imposed for this section theorem. The README's subsequent complete/right-continuous graph-to-announcement argument is an additional proof obligation, not attributed wholesale to Theorem 4.4. |
| 0.6.0 process-to-point-measure | PointProcesses Layer 4 construction and Layer 11 temporal carrier read | Supplier ownership and the process-side extra construction are resolved. No independent exact textbook locator is attached to this whole block; source certification incomplete, R06. |
| 0.6.1 marked carrier/event times | PointProcesses temporal carrier, eventTime and compensator signatures read | Literal carrier comparison and k+1 indexing verified against the supplier, including zero-origin and local finiteness. This is a new adapter, not a theorem asserted by a similarly named nonexistent declaration. No precise independent source locator supplied. |
| 2.2 Doob theory | KS Chapters 1–3; Tau Ceti reverse convergence declaration | Native reverse convergence checked. Book theorem numbers/pages for all forward/regularization/class-D claims not supplied/read; uncertified. |
| 3.1 predictable measures | Concrete product restriction/trim, native predictable algebra, supplier compensator | Measure normalization and construction checked; the general martingale-bracket measure needs its promised Doob–Meyer input. Broad integration references do not certify every hypothesis at a theorem/page locator. |
| 5.3 Stratonovich | Protter and Revuz–Yor broad references | No readable text/exact local locator certified. Midpoint-versus-biased-sampling normalization computed above. |
| 5.4 stochastic exponentials | Revuz–Yor/KS integration references | Uncertified book text. Centered exponential, unit initial value and positive local-martingale versus true-density distinction checked directly. |
| 5.5 Lévy characterization/versions | KS Brownian/integration chapters; native Brownian predicate | Filtration/representative distinction and normalization checked at the pin. Exact book theorem/page certification unavailable. |
| 6.6 local time/reflection | KS Chapter 6 and Revuz–Yor | Uncertified; no page-level text read. The Tanaka factor and reflected-motion correction pass the displayed calculation. |
| 6.7 Brownian dynamical models | No theorem/page locator in the target block | Shift law computed; no identifiable source locator to certify, R06. |
| 7.4 Girsanov | KS §3.5 | Section identified, but paywalled text unavailable and target-level page/theorem locator absent. Finite-horizon sign and density normalizations tested. |
| 8.2 Wiener identification | Gaussian/RKHS discussion and broad Cameron–Martin references | Finite-grid/continuum normalizations tested; no precise readable theorem/page locator establishing the full Wiener RKHS identification. |
| 10.1 kernels/Markov | KS Chapter 5; OneParameterSemigroups Part A | Generic semigroup supplier resolved. Diffusion Markov/Feller theorems not certified against exact book locators; compact-escape qualification is substantive and was checked. |
| 10.2 generators/martingale problems | KS Chapter 5; semigroup supplier; main Moore–Penrose owner | Generator sign, degeneracy and ownership tested. Full weak-SDE/martingale-problem equivalence/core theorem source hypotheses remain uncertified. R02 applies independently. |
| 10.3 Feynman–Kac | KS §5.7 | Correct terminal-value sign computed. Book text not readable; finite smoothness/no-ellipticity converse is a roadmap proof obligation, not a source-certified consequence here. |

Other legal sources opened this round:

- `lalley line 69`: Theorem 1, Brownian existence. `lalley line 453`: Theorem 5, printed p.13, natural-filtration strong Markov. `lalley line 619`: equation (32), p.16, reflection. `lalley line 981`: Theorem 7, p.26, nested-partition quadratic variation. Its proof needs the corrections listed below; the roadmap's corrected variance and conditional-orthogonality obligations avoid treating the erroneous intermediate line as a library theorem.
- `kratschmer-urusov line 41`: Theorem 1.1, arXiv v2, completeness, pair measurability, covering bound and p-th moment/q-dimensional condition. The Holder exponent is strictly below (q−d)/p. This supports the metric-index route, not unconditional continuity of arbitrary processes.
- `theodorakopoulos line 75`, `line 147`, `line 183`: Theorems 2.3–2.5, printed pp.2–4, closure/capacity/outer-probability ingredients. The v2 PDF numbering, rather than HTML pagination, was used. The index misprint below was independently checked.
- `bgs line 548`: §5 Theorem 1′, printed p.150, normalized harmonic conjugate at the origin and p>0. `bgs line 565`: Theorem 3′, p.151, disk Brownian/nontangential maximal-distribution comparison. These exact locators are real and match the disk setting used in §6.5. They do not themselves supply every finite-measure/Hardy boundary construction in that section.
- `chung-1985 line 40`: the bounded-domain gauge statement and bounded potential are present; the conditional-gauge discussion is separate. The scan's formula extraction is insufficient for certifying every detailed stopped-boundary claim.
- `brownian-lean line 36`: the paper's Brownian definition; `line 43` onward: the formalization's transformation/Markov scope. It is architectural context, not evidence that all those declarations are at these pins. The native files were searched separately.
- `talay-tubaro line 185`: Theorem 1's weak-error expansion is present in the author-hosted scan. OCR interleaves facing pages; this does not certify the roadmap's precise finite C_b^7/C_b^6 derivative budget. That budget still needs a precise supporting locator or its explicit proof obligations.
- `dlmf line 62` in §10.25: equation 10.25.1 is the modified Bessel equation with the minus sign before z²+ν². §10.29 was also fetched for the recurrence locators. These are supporting special-function references, not a substitute for the StandardDistributions ownership contract.

## Not verifiable

Sources were acquired legally through the service. Resolved fetch failures were removed from the missing ledger. This review is not parked for source access.

- **MATH5695:** title search and the sources service did not identify the notes; the README supplies no author, institution, edition or legal URL. Its numerous worked-example page references cannot be independently certified. Recorded as `math5695` in the missing-reference ledger.
- **Karatzas–Shreve, Revuz–Yor, Protter and Kunita:** publisher/DOI routes resolved only to restricted book records, not legally readable full text. Their exact theorem hypotheses and pages remain uncertified. They were not converted into repeated missing-text requests.
- **Chung–Rao's conditional gauge reference:** restricted publisher record; no full proof text read. The readable Chung article does not automatically certify this separate theorem.
- **Ondreját–Seidler:** the Project Euclid DOI landing page exposed no downloadable text through the service; the indexed UCLA institutional PDF returned HTTP 404. The progressive-modification theorem's exact hypothesis comparison remains unverified, recorded under the existing `ondrejat-seidler` key.
- **Burkholder (1973):** the Project Euclid DOI page exposed no PDF to the service. Its distribution-function proof route was not certified from the primary paper. Recorded as `burkholder`.
- **Baudoin Lecture 24:** the legal author page was read, but the extracted text loses the displayed formulas and parameters (`baudoin line 47`, `line 51`). It identifies the BDG theorem and proof route but is insufficient to certify its exponent range from that extraction alone.
- **Talay–Tubaro:** the legal author PDF was fetched and its weak expansion found; scan/OCR quality and the source's smooth coefficient framework do not certify the exact finite derivative orders stated here. No claim of a verified finite-order reduction is made.
- **External implementation designs/code discussions:** they are not pinned theorem suppliers. Their prose or proposed APIs were not accepted as proofs, and no code from them was downloaded and executed. Where this roadmap needs a carrier absent at the pins, it must own the construction explicitly as it now does for the Gaussian translation interface.

## Source issues

- **Error** in lalley at Proposition 10 proof, printed p.27 (`lalley line 1021`): the source says a single summand's second moment bounds the unnormalized dyadic sum's variance; it should be the sum variance 2·2^n, giving 2/(2^n ε²); affects the proof.
- **Misprint** in lalley at Lemma 4, printed p.28 (`lalley line 1047`): the source says the sign of the second Gaussian twice; it should be the signs of the first and second Gaussians; affects a stated result.
- **Error** in lalley at Lemma 4 and its proof, printed p.28 (`lalley line 1045`): the source says separate sign independence from G removes the conditional cross term; it should be conditional mean-zero sign product, or joint sign-vector independence; affects a stated result. Witness: G generated by both magnitudes and the product of signs leaves each sign independent but makes ξζ measurable, giving an extra 2ξζ instead of zero.
- **Misprint** in theodorakopoulos at Theorem 2.5 proof, printed p.4 (`theodorakopoulos line 191`): the source says to intersect the same hull indexed by n over all m≥n; it should be the hull indexed by m inside that intersection; affects the proof.
