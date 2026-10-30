# Review of StochasticCalculus (pull request #1030 at b93ec29)

**Verdict:** needs changes

## R01 (P1) — The integral predicate admits two different integrals of one integrand

**Location:** `TauCetiRoadmap/StochasticCalculus/Suggested.lean:398` and `:457`; `TauCetiRoadmap/StochasticCalculus/README.md:1246`. The uniqueness theorem assumes `hB`, `hI`, and `hJ`, but no measurability of H.

**Claim:** Elementary approximation using the lower Lebesgue integral alone determines an arbitrary H's integral uniquely.

**Witness:** Choose A in positive time such that A and its complement have inner measure zero on every bounded interval. For H=1_A, both elementary approximants 0 and 1 have lower square error zero; their integrals are 0 and B.

Here A can be a Bernstein set meeting every positive-measure compact set, with its complement doing likewise. Mathlib's `lintegral` is the supremum of measurable simple minorants (`Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean:48`), not an outer integral. For each horizon t, take the constant sequence of zero elementary integrands, or the constant sequence with height 1 on (0,t]. Both approximation errors are identically zero. Their elementary integrals are 0 and B_t−B_0. The processes I=0 and J=B−B_0 have a.s. continuous paths, hence both satisfy the stated predicate. At t=1, P(J_1=0)=0, whereas indistinguishability would require probability 1. The issue is nonmeasurability, not Bochner totalization or infinite energy.

**Repair:** Require actual predictable measurability in `IsItoIntegral`, with progressive inputs passing through the already planned predictable-representative adapter. Alternatively restrict every uniqueness use to an explicitly measurable local domain and document that the unrestricted predicate is not an integral characterization. Add this negative control to S3.2. With the first repair H=1_A is excluded; for measurable H=0 the competing unit approximant has energy t, and for H=1 the competing zero approximant has energy t. At t=1 neither erroneous approximation converges.

## R02 (P1) — PointProcesses contracts are attributed to targets it does not supply

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:702`, `:729`, `:733`, `:776`, and `:1189`. Claimed supplier names include `isPoissonPointProcess_of_Ioc_counts`, `eraseMarks`, `groundTemporal`, and `isCompensator_of_isAdaptedPoisson`.

**Claim:** PointProcesses supplies these named interfaces and the convention `nthPoint ξ 0=0`.

**Witness:** The inspected PointProcesses README and Suggested file contain none of those four names. Its `nthPoint` describes the kth occurrence without an origin sentinel. Its actual forward compensator theorem is `IsAdaptedPoisson.isCompensator`.

Resolved supplier locations are `TauCetiRoadmap/PointProcesses/README.md:1076` (count-process equivalence), `:1157` (occurrence enumeration), `:2035` (event times), `:2147` and `:2236` (forward compensator), and `TauCetiRoadmap/PointProcesses/Suggested.lean:1020`. For δ₁+δ₃, zero-based occurrence enumeration gives 1,3, whereas the asserted sentinel convention gives 0,1,3; “kth occurrence” does not determine that shift. No corresponding supplier gap is declared.

The claimed normalization comparison at README:3120 also is not what `PointProcessesAdapter.lean:14` proves: all three equalities expand this roadmap's definitions to `Measure.comap`; none mentions a PointProcesses declaration.

**Repair:** Cite `IsAdaptedPoisson.isCompensator` with its actual typed inputs. Repoint the interval characterization to the supplier's real statement and explicitly own any small specialization needed here. For genuinely missing generic contracts, declare a precise named supplier gap in the plan and README, or place the required adapter here without attributing it to an absent target. Specify count-level enumeration and the first-wait convention explicitly. Test δ₁+δ₃: event times must be 1,3 and gaps including the initial wait 1,2. Remove the claim that a definitional self-expansion checks a supplier interface.

## R03 (P2) — Statable headline theorems are missing from the acceptance file

**Location:** `TauCetiRoadmap/StochasticCalculus/Suggested.lean:7`; `TauCetiRoadmap/StochasticCalculus/README.md:817`, `:1491`, `:1633`, `:1718`, `:2057`, `:2281`, `:2618`.

**Claim:** “Representative construction interfaces” serve as the acceptance test for the roadmap's end results.

**Witness:** Brownian existence is absent although native `IsBrownianReal` already states its law and a.s. continuity. A scratch theorem asserting a probability measure on `(ℝ≥0 → ℝ)` with Brownian coordinate process elaborated at the pins with only `sorry`.

Headlines: Wiener construction; integration/brackets/BDG; Itô/Stratonovich; strong Markov/representation; reflection/exits/LIL/local time; harmonic Hardy representation; DDS; Novikov/Girsanov; Cameron–Martin equivalence/singularity; SDE existence/uniqueness/flows; diffusion generators/martingale problems/Feynman–Kac. The file states integral, bracket, Lévy, scalar Itô, density and scalar SDE existence signatures; it omits other statable headlines and missing-carrier explanations. Scalar SDE pathwise uniqueness can already be stated using its kept `IsStrongSolution`; reflection can already be stated using Brownian motion and event probabilities. The uniform-global-constant scalar existence special case is explicitly not the full S9.1 target.

**Repair:** Replace the representative catalogue by the statable headline results, including Brownian existence and SDE pathwise uniqueness, and the full advertised generality wherever native carriers and a few simple definitions suffice. State the remaining unavailable headlines by name in the module docstring, identifying each missing carrier. Retain the scratch Brownian coordinate-law signature as a statability test; the zero process fails it at time 1 since its variance is 0 rather than 1. 

## R04 (P2) — The planned C² submean proof is already in the pinned library

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:1933`: “Own the circle-to-ball subharmonic implications used here: C² plus Δ≥0 implies the native continuous sub-mean predicate”.

**Claim:** This deterministic implication needs to be constructed here.

**Witness:** `TauCeti.le_setAverage_ball_of_laplacian_nonneg`, in `TauCeti/Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:464`, already gives the submean inequality. The predicate at `Harmonic/Subharmonic.lean:63` is continuity plus frequent small-ball inequalities.

**Repair:** Delete the plan to reprove this submean theorem and cite the pinned result, supplying openness, contained closed balls, C² regularity and positive radius at its application. Keep the additional measurable-to-continuous and finite-boundary-measure bridges. The native theorem gives, for u(x)=‖x‖² on the unit ball in ℝ², 0≤1/2 at its center; u=−‖x‖² has Δu=−4 and is correctly excluded. 

## R05 (P3) — The acceptance files contain aliases, boundary cases and worked Checks

**Location:** `TauCetiRoadmap/StochasticCalculus/Suggested.lean:256`, `:425`, `:578`, `:602`, `:730`, `:748`, `:768`; `IndependentLaws.lean:28`, `:37`, `:79`, `:105`; `PointProcessesAdapter.lean:14`; `AutonomousODE.lean:56`; `RawLocalization.lean:32` (all under the same folder).

**Claim:** These elementary identities and examples belong among acceptance signatures.

**Witness:** `complexDensity_variation_eq` is literally `exact MeasureTheory.Measure.variation_withDensityᵥ hf`; `predictableClass_coe` is `exact MemLp.coeFn_toLp ...`; the three point-process “adapters” are `rfl`. Fin 3 and tent-map declarations compute README Checks.

**Repair:** Delete this padding from `Suggested.lean`; keep the mathematics as README targets, native citations or Checks. Remove equivalent auxiliary catalogues rather than relocating the padding. The finite example computes E[X]=0, E[Y]=2/3, Cov(X,Y)=0 but P(X=0,Y=0)=1/3≠1/9; it remains a useful README negative control. The complex-density identity gives variation mass 1 for f=i under a probability measure on both sides. The one-tactic search on all 23 admitted declarations of Suggested found no additional closures by `simp`, `rfl`, or `infer_instance`; this does not excuse its already proved padding.

## R06 (P3) — All six Lean files need the specified signature-file form

**Location:** `TauCetiRoadmap/StochasticCalculus/AutonomousODE.lean:5`, `CameronMartinGridTargets.lean:1`, `IndependentLaws.lean:5`, `RawLocalization.lean:5`, `PointProcessesAdapter.lean:1`, and `Suggested.lean:18`.

**Claim:** The auxiliary files use Mathlib submodule imports, one imports another roadmap module, and every file uses `StochasticCalculusSuggested` instead of `TauCetiRoadmap.StochasticCalculus`.

**Witness:** `IndependentLaws.lean:117` also introduces `lemma`; `PointProcessesAdapter.lean:1` imports `TauCetiRoadmap.StochasticCalculus.Suggested`. Several declarations lack docstrings and the files do not have the required headline/missing-carrier module docstring.

**Repair:** After removing auxiliary padding, apply the single `import Mathlib` rule and permitted individual Tau Ceti imports to every retained file; use the required namespace, declaration docstrings, `theorem`, and README-ordered layer comments. Give each retained module its prescribed target-signatures docstring. No `set_option` or directly sorry-bodied data declaration was found.

## R07 (P3) — Definitions and layers lack the required API, Checks and dependency structure

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:1`, `:215`, `:373`, `:709`, `:3041`.

**Claim:** The long S0–S10 prose supplies the required roadmap structure.

**Witness:** S0.6.1 defines a repaired marked process without three explicit discriminating Checks or an API list; the README has only two `**Checks.**` blocks and one literal `*Needs:*` line, despite dozens of constructions.

**Repair:** Use the required Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered Layers, and per-layer Examples/Dependencies. Give each definition its mathematical API and at least three discriminating Checks; split dependencies by target and proof route. For the marked adapter retain the already computed controls: zero rate gives the zero measure, δ₁+δ₃ fixes indexing, and an external time-zero revelation of the future fails independence. 

## R08 (P3) — Source claims need exact locators and a source manifest

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:215`, `:682`, `:3074`, `:3077`, and `:2679`.

**Claim:** Broad chapter references and a source-comparison transcript locate the individual target statements.

**Witness:** S0.0's many measure-theoretic targets lack claim-level theorem/page locators; S0.6.0 has no precise source locator for its construction. The folder has no `sources.toml`. MATH5695 has no identified author or edition.

**Repair:** Attach exact locators to the individual claims, identify the MATH5695 text/version, and record each cited work once in the prescribed source manifest. Keep unavailable books explicitly uncertified. Replace process phrases such as instructions to preserve conflicting source displays with timeless mathematical statements and concise errata locators. For the seeded sample, identify separately where path regularization, event indexing, external-filtration independence and compensator specialization are proved. The computations below remain valid controls, but they cannot certify an unidentified source's theorem numbers or hypotheses.

## R09 (P3) — The gate rejects an extra roadmap file

**Location:** `TauCetiRoadmap/StochasticCalculus/SupplierDependencies.md`; reference at `TauCetiRoadmap/StochasticCalculus/README.md:3116`.

**Claim:** The extra file carries supplier contracts outside the permitted roadmap files.

**Witness:** The gate names this file, reports `stray-files: 1`, and returns FAIL. All other checks, including the targeted build, pass.

**Repair:** Move necessary contracts into the README's Exact supplier contracts section, then delete it; sources are the README's references. Remove its link. Re-run the gate: the witness is eliminated when the file is absent and the contracts are in the README.

## Verified sound

Read all six requested Lean files and the whole README. The requested head matches, the outside-folder diff is empty, and the worktree is unchanged. StochasticCalculus is not on main; no replanning rejection applies. No copied passage or executable algorithm was identified; approximation schemes are mathematical convergence targets.

The supplied gate fails only R09. Direct Suggested elaboration succeeds with 23 `sorry` warnings. A scratch copy checking all 83 declaration types also elaborates. The three binder alerts are harmless: `stochasticExponential` needs no measurable Ω; modification equality needs no topology; progressive modification needs measurable structure, not the extra Polish instances. The SDE theorem retains F₀-measurability. R01 is an absent hypothesis, not a printer artifact.

The audit covered 267 computed instances: 85 main-file rows (83 declarations and two examples), 107 prose rows and 75 auxiliary rows. The condensed table below retains 53 rows; declaration-by-declaration ledgers are omitted. These are sanity checks, not proofs. The dependency command returned:

```text
depcheck: 207 roadmaps, 1463 edges, 0 problem(s)
```

No UPWARD or CYCLE line appeared. All Needs/supplier lines were read; the coarse graph does not settle R02.

Pinned declarations opened and used in the audit (paths below are library-relative):

| Pin | Declaration / location | What the native object does and does not say |
|---|---|---|
| Mathlib `6b7abb3c` | `Probability/BrownianMotion/Basic.lean:75`, `:302` | `IsPreBrownianReal` gives Gaussian finite-dimensional laws; `IsBrownianReal` adds a.s. continuity, not adaptation to an arbitrary filtration. |
| Mathlib | `Probability/Process/Kolmogorov.lean:56` | Moment and pair-measurability hypotheses; not by itself a constructed continuous modification. |
| Mathlib | `MeasureTheory/Integral/Lebesgue/Basic.lean:48` | Lower simple-function integral; nonmeasurable inner-null indicators can have integral zero. |
| Mathlib | `MeasureTheory/VectorMeasure/WithDensityVec.lean:366` | `Measure.variation_withDensityᵥ`, with integrability and complete target space; directly supplies the complex specialization. |
| Mathlib | `Probability/Independence/Basic.lean:839` | `iIndepFun.map_fun_eq_pi_map`, including measurability; finite-vector alias is not new theory. |
| Mathlib | `Probability/Independence/Integration.lean:358` | Independent integrable factors have integrable product; covariance alone does not imply independence. |
| Mathlib | `Probability/Moments/Covariance.lean:323` | `IndepFun.covariance_eq_zero`, with the L² hypotheses retained by the auxiliary file. |
| Mathlib | `MeasureTheory/Function/FactorsThrough.lean:56` | Factorization of strongly measurable functions through a comap; used by the tent example. |
| Mathlib | `MeasureTheory/Function/ConditionalExpectation/Real.lean:304` | Uniform integrability of conditional expectations of one integrable terminal variable. |
| Tau Ceti `a91d3aaf` | `MeasureTheory/Measure/ProjectiveLimit/Countable.lean:167` | Probability projective limit on countable standard Borel products; no continuous-path carrier is provided by this theorem alone. |
| Tau Ceti | `Probability/Martingale/Convergence.lean:164` | Reverse conditional-expectation convergence, with decreasing sigma-fields and finite-measure assumptions. |
| Tau Ceti | `Analysis/InnerProductSpace/Harmonic/MeanValue/Basic.lean:440`, `:464` | Submean inequality, with C² on the ball, continuity on its closure and nonnegative Laplacian. |
| Tau Ceti | `Analysis/InnerProductSpace/Harmonic/MeanValue/Converse.lean:68`, `:116` | Continuous mean-value functions are harmonic; continuity is not supplied for a merely measurable function. |
| Tau Ceti | `Analysis/InnerProductSpace/Harmonic/Subharmonic.lean:63` | Continuous real-valued subharmonic predicate; not an upper-semicontinuous extended-valued theory. |

Object searches covered both pins, main, board package texts and indexed open texts (`roadmaps grep/show` and file searches): stochastic integration, local time, Gaussian RKHS, Cameron–Martin, convergence in measure, harmonic mean values, Bessel and Moore–Penrose. Shape examples read: Completed/OrthogonalL2Bases, Completed/Exchangeability and StandardDistributions. The earlier owners resolved were:

- `Completed/OrthogonalL2Bases/README.md`, Part D: Gaussian Hermite tensor bases, not a new SC orthogonal-basis construction.
- `TauCetiRoadmap/StandardDistributions/README.md:1227`, `:2143`, `:2159`: §8.1 Bessel functions, §12.1 sphere normalization, §12.2 von Mises–Fisher normalizer. The resolver's `Real.besselI` alert is not a missing-owner finding.
- `Completed/OneParameterSemigroups/README.md`, Part A: strongly continuous semigroup, partial-map generator and resolvent. S10's stochastic generator identification is distinct.
- `TauCetiRoadmap/PDE/README.md:290`, `:298`: Lane C12 mean-value characterization and C15 subharmonic theory; deterministic ownership is retained. R04 concerns a result already at the pin, not an unavailable future PDE theorem.
- `TauCetiRoadmap/DifferentialGeometry/README.md:284`: §0.3 differential/pullback interfaces. `Completed/ConformalMapping/README.md`, L2–L3 on main: conformal/Riemann-map theory, not stochastic time change.
- PointProcesses Layers 4, 10 and 11: generic temporal measures, adaptation, compensators and the forward adapted-Poisson result; missing additional names are isolated in R02. The inspected indexed open text is distinguished from a native declaration.
- `TauCetiRoadmap/OptimalTransport/README.md:1543`, §13C, is a consumer: its named Brownian entropy reference and reciprocal-process theory are not imported by SC. `TauCetiRoadmap/FinancialMathematics/README.md:11`, `:57`, M0.1/M0.4, likewise owns assets and pricing rather than supplying Brownian calculus.

OperatorTheory's later Moore–Penrose scope was found. S10 explicitly builds the finite-dimensional measurable adapter it needs, without an upward citation. No conflicting Gaussian RKHS owner was found. The search does not certify other roadmaps' mathematics.

### Computed adversarial table

Selected rows retain the five seeded targets, the headline families and the mathematical witnesses used in the findings. “Pass” refers only to the displayed instance, not a universal proof. Main-file names are shortened; constants use probability mass one. The Fin 3 example uses X=(−1,0,1), Y=(1,0,1), each point of mass 1/3.

| Statement | Instances and computed values on both sides | Result / change |
|---|---|---|
| `IsItoIntegral` | Bernstein H=1_A: lower errors for 0 and 1 are both 0; candidate integrals 0 and B−B₀ differ at time 1. | Fails characterization; R01. |
| `isItoIntegral_unique` | Same Bernstein H admits I=0,J=B−B₀: P(I₁=J₁)=0, required 1. | False; R01. |
| `itoIntegral_isometry` | H=2,t=3 gives E[(2B₃)²]=12=∫H²; H=0 gives 0=0. | Pass under measurable-domain hypothesis. |
| `exists_isQuadraticVariation` | M=0 gives A=0; M=2B gives A=4t. | Pass finite tests. |
| `levy_characterization_adapted` | M=B passes [M]₁=1; M=2B fails since [M]₁=4; M=B+1 fails M₀=0. | Pass. |
| `brownian_ito_C2` | f(x)=x²: B_t²=2∫B dB+t; f=3 gives 3=3+0+0. | Pass; drift coefficient 1/2 checked. |
| `novikov_expectation` | θ=1,T=2: E exp(energy/2)=e<∞ and E Z=1. | Pass; no unconditional positive-local-martingale claim. |
| `girsanov_on_horizon` | θ=1,T=2: tilted B₂ has mean 2, corrected B₂−2 has mean 0 and variance 2. | Correct sign; plus correction would have mean 4. |
| `cameronMartin_pushforward` | h(t)=t,T=1: translated B₁ and tilted B₁ both N(1,1); zero shift gives P=P. | Pass finite-coordinate check; full path-law headline still needed. |
| `exists_strongSolution` | b=x,σ=0,ξ=2 gives X_t=2e^t; b=0,σ=1 gives variance t. | Pass special case; full target/uniqueness missing, R03. |
| `predictableClass_coe` | Same representative: difference=0 almost everywhere in the trim. | R05 delete alias. |
| `complexDensity_variation_eq` | f=i, probability μ: variation mass=1=∫norm(i); f=0 gives 0. | R05 native alias. |
| `tent` | At −1,0,1/4,1/2,3/4,1,2: 0,0,1/4,1/2,1/4,0,0. | R05 worked example. |
| `conditional_tent_factor` | Uniform X on [0,1], ξ=X: conditional mean=1/2 on paired fibers {x,1−x}; ξ=1 gives 1. | Pass; example/Doob–Dynkin application, R05. |
| PointProcessesAdapter: `nnvolume_eq_comap_volume` | Both definitions give mass 2 to (0,2]. No supplier term is present. | R02/R05. |
| `timeMeasure_eq_comap_volume` | Horizon 0 gives mass 0; horizon 2 gives mass 2 on both sides. | R02/R05. |
| `predictableMeasure_eq_comap_volume` | Trivial Ω,T=2: total mass 2=2 after trim. | R02/R05. |
| RawLocalization: `stoppedValue_countable_range` | Constant M=2,T=1≤2: stopped value=2=conditional expectation of 2. | Native optional-sampling alias, R05. |
| `not_indep_X_Y` | P(X=0,Y=0)=1/3 versus P(X=0)P(Y=0)=1/9. | Discriminating Check; R05 retain in README. |
| S0.0 Stieltjes measure from variation | Increasing g(t)=t² on [0,2]: ν((0,2])=g(2)−g(0)=4; jump of size 2 at 1 gives ν({1})=2. | Pass; includes endpoint atoms. |
| S0.0 signed variation | Path 0→2→1 has net increment 1 but variation 3; positive/negative masses 2 and 1. | Distinguishes variation from net increment. |
| S0.0 measure uniqueness on generators | Two-point probability (1/2,1/2): singleton masses determine total 1; empty set mass 0. | Pass; finite uniqueness hypotheses needed. |
| S0.0 density/Radon–Nikodym adapter | μ=(1/2,1/2), f=(0,2): ν=(0,1), ν(Ω)=1=∫f dμ. | Pass; source locator unverified. |
| S0.0 countable-exception FTC | f=x² gives 1=∫₀¹2x; Cantor function has a.e. derivative 0 but increment 1 and violates countable-exception hypothesis. | Correctly excludes singular continuous counterexample. |
| S0.0 signed/complex densities | Density i on a probability space: total variation 1, whereas signed integral i is not a nonnegative mass. | Pass; native variation theorem, R05. |
| S0.0 atoms and zero-one events | Dirac mass at 1 has atom mass 1; Lebesgue singleton mass 0 is not an atom of positive measure. | Pass. |
| **S0.6.0 process-to-point-measure** | Rate 2,T=3,m cells: mP(Pois(6/m)≥2)∼18/m→0. At rate 0 every increment/count is 0. | Simple-jump estimate passes; source unverified and R02 supplier repair. |
| **S0.6.1 marked carrier/event dictionary** | δ₁+δ₃ pushed to Unit: counts at t=0,1,2,3 are 0,1,1,2; correct first/second arrivals 1,3 and initial/interarrival gaps 1,2. | Numerical dictionary fixed; asserted supplier sentinel unverified, R02. |
| S0.6.1 null-origin repair | Add an origin atom on a P-null event: original origin count 1 there, repaired count 0; all fixed-time counts agree with probability 1. | Pass; does not imply pointwise equality on exceptional paths. |
| **S0.6.2 external filtration** | Rate-1 Poisson and A={N₁=0}∈F₀: P(A∩A)=e⁻¹, independence product=e⁻². | External future independence is necessary and fails this control. |
| S0.6.2 usual history | Independent past/future count events of means 1,2: joint no-point probability e⁻³=e⁻¹e⁻². Null augmentation alters probabilities by 0. | Independence normalization passes. |
| **S0.6.3 compensator** | α=2,t=3: A((0,3]×Unit)=6=E N₃; empty mark set gives 0=0. | Typed finite-horizon specialization sound; rename supplier theorem, R02. |
| S1.2 canonical Wiener law | At (1,2), determinant of covariance [[1,1],[1,2]]=1; at duplicate times determinant=0. | Handle singular finite-dimensional laws; construction headline missing, R03. |
| S3.2 elementary density/integral | Grid 0,1,2, heights 2,−1: integral variance=5 and energy=4+1=5. Bernstein H gives erroneous double limit 0 and B. | Positive control passes; R01 fixes negative control. |
| S4.3 BDG | M=0: both moment terms 0; M=2B: both sides scale by 2^p, not 2^(p/2). | Homogeneity control; headline missing, R03. |
| S5.1 vector Itô | f(x)=‖x‖² in dimension d: drift=(1/2)·2d=d; d=0 gives 0. | Correct Hessian contraction. |
| S5.3 Stratonovich | ∫B∘dB=B_T²/2 versus Itô (B_T²−T)/2; expectations T/2 and 0. | Half-bracket sign correct. |
| S6.1 strong Markov/restart | Deterministic stopping time 1: B_(1+t)−B₁ has variance t and covariance 0 with B₁. At ∞ no finite restart is asserted. | Pass; full stopping-time theorem remains deep. |
| S6.1 martingale representation | Terminal B₁²−1 has integrand 2B_s on [0,1]; E terminal²=2=E∫₀¹4B_s²ds. | Isometry and centering agree. |
| S6.2 reflection/maximum | a=1,T=1: P(max B≥1)=2(1−Φ(1))≈0.317311; terminal upper tail≈0.158655. | Factor 2 correct; statable headline missing. |
| S6.2 interval exit | Start x=0 in (−1,1): right-exit probability 1/2 and expected exit time 1; boundary start gives time 0. | Pass. |
| S6.3 LIL normalization | Standard B has upper/lower limits 1,−1 under √(2t log log t); 2B gives 2,−2 and fails unit covariance. | Normalization control; not a finite simulation proof. |
| S6.5.1 C² submean bridge | u=norm² on planar unit ball: u(0)=0≤average=1/2; −norm² gives 0≤−1/2 false and Δ<0. | Existing pinned result; R04. |
| S6.5.2 Hardy representation | Constant u=3 has every radial Lp norm 3 and trace norm 3; Poisson(δ₁) has radial L¹ norm 1 but singular measure trace. | Correct p>1 / p=1 distinction. |
| S6.6 local time | Tanaka at a=0: abs(B_t)=∫sgn(B)dB+L_t^0, so E L₁^0=√(2/π). Half that would contradict E abs(B₁). | Correct occupation/Tanaka normalization. |
| S7.2 DDS | M=2B, [M]_t=4t: time-changed M_(s/4)=2B_(s/4) has variance s. | Correct inverse and factor. |
| S8.2 singular translations | h₀=1: original origin event {ω₀=0} has mass 1 and translated mass 0; h=ct is a finite-energy admissible shift. | Singularity and equivalence distinguished. |
| S9.1 global Lipschitz theory | b=x,σ=0,ξ=2: X=2e^t; difference from ξ=1 solution=e^t, matching deterministic uniqueness. | General theorem not supplied by scalar existence alone, R03. |
| S9.5 flows | b=x,σ=0: flow φ_(s,t)(x)=e^(t−s)x; φ_(u,t)∘φ_(s,u)=e^(t−s)x. | Composition direction passes. |
| S10.2 generator | σ=1,b=0,f=x²: Lf=1; σ=0,b=x gives Lf=2x². | Half-covariance convention correct. |
| S10.2 pseudoinverse reconstruction | σ=diag(2,0): σ⁺=diag(1/2,0), σσ⁺=diag(1,0); missing-noise projection=diag(0,1). | Rank-deficient case requires independent extension noise. |
| S10.3 Feynman–Kac | L=0,q=2,f=3,g=5,horizon 1: u(0)=5e²+(3/2)(e²−1), obtained both by expectation and backward ODE. | Checks positive-potential/forcing sign. |
| S10.4 gauge/Dirichlet | q=0, boundary f=1: gauge and solution=1. In bounded interval with positive q beyond exponential exit-time threshold, gauge=∞. | Finite-gauge hypothesis essential; no unconditional exponential moment. |

The extra Brownian-existence signature elaborated. The auxiliary ODE initial-value boundary theorem closes with `simp [odeSolution, timeCoordinateEquiv]`; no other admitted auxiliary theorem closed under the generic one-tactic search. Auxiliary files also emit unused-binder/simp warnings.

### Source checks

All acquisitions used the sources service. **None of the five seeded MATH5695 locators was certified against the unidentified text.** The same applies to uncertain glyphs and purported source corrections; those are not verified source errata.

Accessible checks: `theodorakopoulos` lines 75–78, 147–185, 304–324 and 337–358 support the Souslin/capacity and predictable/optional-section route, with the roadmap explicitly undertaking omitted construction steps. `kratschmer-urusov` lines 41–57 supports Theorem 1.1's pair-measurability, completeness and exponent condition q>d; the retrieved arXiv v2 numbering does not certify the README's separate “Lemma 1.3” locator. `brownian-lean` lines 37–82 supports the Gaussian/projective/Chentsov architecture, not the licensing or completeness of every linked code snapshot. `dlmf` lines 62–64 gives equation 10.25.1 with the negative (z²+ν²) coefficient. `chung-1985` lines 40–44 separates the ordinary gauge theorem from the conditional gauge discussion at lines 65–73. `lalley` lines 981–985 supports the deterministic nested-partition theorem; its proof has the issues recorded below. The roadmap's direct reflection route does not assume the faulty sign-independence inference. [Lalley's author-hosted notes](https://galton.uchicago.edu/~lalley/Courses/383/BrownianMotion.pdf).

## Not verifiable

- **MATH5695:** author/edition and legal text unidentified; service title lookup and exact-title web search found no usable copy. This covers all five seeded targets and every uncertainty in the source-comparison tables. Their theorem/page/hypothesis matches remain uncertified.
- **Karatzas–Shreve, Revuz–Yor, Protter, Kunita, Chung–Rao:** service classified the located publisher/DOI sources as uncertified/paywalled. No text-content claim is certified from these references; they are not renewed missing-text requests.
- **Ondřeját–Seidler:** DOI landing page did not yield the article; UCLA copy returned 404 and the EMIS institutional mirror refused connection. **Burkholder 1973:** DOI landing page supplied no readable article. **Burkholder–Gundy–Silverstein 1971:** the AMS PDF URL returned a journal landing page, not the article. **Talay–Tubaro:** the linked INRIA author copy refused connection. These unresolved works are recorded together in the missing-reference request.
- **Baudoin Lecture 24:** accessible prose, but the service extraction omits the displayed mathematical formulas; it does not certify all exponents and constants. DLMF §10.29 recurrences and the exact external implementation commits/licences were not independently certified. No findings rely on their presumed contents.
- Auxiliary sanity checks do not constitute proofs of the raw-localization, section, Hardy, weak-SDE or gauge theorems. Source access limitations are not assertions that those targets are false.

## Source issues

- **Error** in lalley at §7, dyadic proof of Theorem 7, printed p. 27 (`lalley` lines 1021–1028): the source says the Chebyshev numerator is one summand's second moment over 4ⁿε²; it should be the sum's variance, giving 2/(2ⁿε²); affects the proof.
- **Misprint** in lalley at Lemma 4, printed p. 28 (`lalley` line 1047): the source says the second variable's sign twice; it should be the first and second signs; affects the proof.
- **Error** in lalley at Lemma 4, printed p. 28 (`lalley` lines 1045–1054): the source says separate sign independence from G eliminates the conditional cross term; it should require zero conditional sign product, for example joint sign-vector independence from G; affects a stated result.

Witness: independent standard normals ξ,ζ and G=σ(abs ξ,abs ζ,sgn ξ·sgn ζ). Each sign is separately independent of G, but the conditional identity differs by the G-measurable 2ξζ≠0 a.s. Joint independence excludes this example. The corrected dyadic bound is summable.
