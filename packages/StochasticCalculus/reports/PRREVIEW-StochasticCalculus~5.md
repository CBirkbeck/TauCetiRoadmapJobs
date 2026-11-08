# Review of StochasticCalculus (pull request #1030 at 76211b5)

**Verdict:** needs changes

This is a full review: the folder changed by 1136 lines since `038c6b7`. The gate fails at this head (`dropped=21`). The findings are one P1 (a dropped roadmap cited as a supplier), two P2 (a quadratic-variation uniqueness headline that drops the README's hypotheses on `M`, and statable headlines of two Summary families that are neither stated nor named) and three P3 (locators, Checks, a broken link). Of the previous review's nine findings, seven are repaired and two (R07, R08) are partly repaired; see "Previous findings".

## R01 (P1) — PointProcesses, a dropped roadmap, is the supplier of Layer 0.6 and of the Poisson parts of §§2.1, 2.5, 3.1, 3.5 and 4.4

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md:24`–`:25` (Scope), `:46` (Conventions), `:155`–`:182` and `:208`–`:223` (supplier contracts), §0.6 `:800`–`:964`, §2.5 `:1433`–`:1449`, §3.5 `:1680`, the Layer 0 and Layer 2 dependency lines `:972` and `:1471`, and `:3767`. For example, line 155: "[PointProcesses](../PointProcesses/README.md) owns the shared `nnvolume` convention and unmarked Poisson point-measure construction targets, `TemporalPointMeasure E`, `eventTime`, `IsCompensator`…"

**Claim:** PointProcesses is on the project's dropped-names list, and roadmaps on that list may not be cited as suppliers. Nothing else owns what this README consumes from it: `IsPoissonPointProcess`, `PointMeasure`, `TemporalPointMeasure`, `MarkedLocallyFiniteMeasure`, `IsAdaptedPoisson`, `IsCompensator` and `IsAdaptedPoisson.isCompensator`, plus the Layer 4 simplicity, zero-atom and interarrival results and the compensated-integral martingale theorem. These prerequisites are therefore unowned. The dependency check reports 0 problems only because PointProcesses is in no merge order. The gate's `dropped` rule catches it.

**Witness:** Rerunning the gate on this head gives `dropped=21 … FAIL`. `roadmaps grep -i 'IsCompensator|Poisson point process|PoissonPointProcess|compensator'` over main and all 466 open heads matches only PointProcesses (101 lines) and this roadmap (37).

**Repair:** Delete every PointProcesses citation and state the homogeneous Poisson material here, on a real counting process (the notion moves down):
- A process `N` with `N₀=0` and independent increments, where `N_t−N_s` has law `poissonMeasure (α(t−s))` (Mathlib `ProbabilityTheory.poissonMeasure`, `Probability/Distributions/Poisson/Basic.lean:40`) pushed to ℝ. Relative to `F`, its increments after `s` are independent of `F_s`.
- Prove here: the càdlàg unit-jump regularization; the jump-time and interarrival identities (Erlang sums); that `N_t−αt` and `(N_t−αt)²−αt` are `F`-martingales; `[N−αt]=N` and `⟨N−αt⟩=αt`; and the §3.5 pathwise identity.
- Prove nonpredictability of the first jump `τ` for every such `F` without a compensator carrier. If `τ_n↑τ` announces `τ`, optional sampling of `N−αt` at the bounded times `τ_n∧k` and `τ∧k` gives `E[N_{τ∧k}−N_{τ_n∧k}]=αE[τ∧k−τ_n∧k]→0`. But that difference equals `1_{τ≤k}`, whose mean is `1−e^{−αk}>0`. I checked this computation.
- Remove the §2.5 random-measure dictionary (`TemporalPointMeasure`, `MarkedLocallyFiniteMeasure`, `IsCompensator`), or restate it for the counting process's own Doob–Meyer compensator.
- Keep `nnvolume` as this roadmap's own definition (it is already `Suggested.lean:81`) without "PointProcesses' shared convention".
- Drop PointProcesses from the dependency lines and from the pull request's merge-order paragraph.

After these edits the gate's `dropped` count is 0.

## R02 (P2) — `isQuadraticVariation_unique` drops the hypotheses on `M` that its README statement, proof route and source carry

**Location:** `Suggested.lean:222`–`:226` (binders `(M A A' …) (hA …) (hA' …)` only), against `README.md:1730`–`:1734`: "For an almost surely continuous native local martingale M on a raw filtration, prove `exists_isQuadraticVariation` … and `isQuadraticVariation_unique` (two such A are indistinguishable: their difference is a continuous local martingale…)".

**Claim:** The Lean theorem quantifies over every process `M`. For such an `M`, `M²−M₀²−A` and `M²−M₀²−A'` are native local martingales whose stages have no path regularity. The stated route needs their difference to be a local martingale, which means stopping one stage at the other's localizer. Bare martingales are not stable under that stopping, so the route does not apply. Neither the README nor Revuz–Yor IV.1.8 asserts the unrestricted form, and an acceptance test should state only what we are sure of. The Lean statement is more general than the README, which defect class 9 forbids.

**Witness:** The README's own §2.4 example (`:1308`–`:1309`): with `U` uniform and `F_t=σ(U)`, `X_t=1_{t=U}` is a martingale, but stopping it at `U` gives `1_{U≤t}`, whose mean `t≠0`. In the elaborated type, `M` carries no binder.

**Repair:** Add `(hM : IsLocalMartingale F P M) (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω))`, as in `exists_isQuadraticVariation`. A scratch copy with these binders elaborates (exit 0, 37 `sorry` warnings), and the instance `M=B`, `A=A'=t` satisfies the new hypotheses (`brownian_quadraticVariation`).

## R03 (P2) — Statable headlines of the Summary's "weak SDEs" and "Brownian potential theory" are neither stated nor named as not statable

**Location:** `README.md:5`–`:7` ("Brownian path and potential theory … strong and weak SDEs"), §9.3 `:2945`–`:2981` (weak existence by Girsanov for bounded Borel drift, uniqueness in law, Yamada–Watanabe), §6.4 `:2215`–`:2241` (annulus exit, recurrence, point polarity), §6.5 (Kakutani exit law, Burkholder–Gundy–Silverstein comparison); against the module docstring `Suggested.lean:14`–`:27`.

**Claim:** The docstring lists the headline families, but leaves out potential theory and weak solutions. Its "not statable" list does not mention them either. Both families have headlines that are statable with the file's own carriers.

**Witness:** I added two statements to a scratch copy and it elaborates (exit 0, 39 `sorry` warnings, nothing else):
- Weak existence: for Borel `b` with `|b|≤C` and `x : ℝ`, there exist a probability space `Ω' : Type` and `F' P' B' X'` with `IsFilteredBrownian F' P' B' ∧ IsStrongSolution F' P' B' b (fun _ _ => 1) (fun _ => x) X'`.
- Point polarity: for `2 ≤ d` and a predicate requiring the coordinates `B i` to be `IsBrownianReal` and `iIndepFun` as path-valued maps, `P {ω | ∃ t, 0 < t ∧ ∀ i, x i + B i t ω = a i} = 0`.

**Repair:** State these two theorems: `§9.3` weak existence for bounded Borel drift with unit diffusion, and `§6.4` point polarity in dimension ≥2 with that vector-Brownian predicate as the one supporting definition, citing Mörters–Peres Corollary 2.26. Otherwise, name both families in the docstring's not-statable paragraph together with the carrier each lacks. Add the new names to the README.

## R04 (P3) — Locators: seven sampled sections carry none, the modulus is stated in a form its locator does not contain, and one theorem number names no source

**Location:** §1.5 `:1103`–`:1142`, §5.2 `:1905`–`:1911`, §6.4 `:2213`–`:2241`, §8.1 `:2701`–`:2710`, §8.3 `:2735`–`:2850`, §9.3 `:2943`–`:2981` and §10.1 `:3192`–`:3213` have no theorem, section or page locator. Stochastic Fubini in §3.5 (`:1711`) has none either. §6.3 `:2186`–`:2188` and `Suggested.lean:425`–`:427` cite only Theorem 1.14 for a limit statement. `:2885` reads "textbook Theorem 6.2.3".

**Claim:** Every theorem needs a locator. Mörters–Peres Theorem 1.14 states the modulus as a limsup over exact lags `h`, while `brownian_exact_uniform_modulus` asserts a limit. In §9.1, "textbook Theorem 6.2.3" names no work.

**Witness:** A grep for theorem, section or page tokens finds none in the seven sections. `morters-peres line 965` (Theorem 1.14, printed p. 16) is a limsup. Line 1040 (Remark 1.18, p. 17) and line 1953 (Exercise 1.7, p. 31) give the limit.

**Repair:**
- §1.5: Mörters–Peres, Theorem 5.22, p. 132 (`line 7404`).
- §6.4: Theorem 3.18, p. 72 (annulus); Theorem 3.20, p. 72 (recurrence and transience); Corollary 2.26, p. 47 (point polarity); Theorem 9.22, p. 272 (double points).
- §8.3: Theorem 1.38, p. 25 (Cameron–Martin on `C[0,1]`).
- §6.3 and the Lean docstring: add "Remark 1.18 and Exercise 1.7 for the limit form".
- §9.3: Karatzas–Shreve §5.3 (uncertified).
- §5.2, §8.1, §10.1 and stochastic Fubini: a theorem- or section-level locator each.
- `:2885`: name the work that has Theorem 6.2.3, or replace the number with a locator.

## R05 (P3) — Definitions after §9.1 and several earlier ones have no Checks

**Location:** class D and DL (`:1228`–`:1230`); the Stratonovich integral `∫H∘dX=∫H dX+½[H,X]` and `[h(X),X]` (`:1916`, `:1926`–`:1929`); the finite-history Markov property (`:2115`–`:2118`); analytic and harmonic `H^p` (`:2487`–`:2493`); weak solutions (`:2945`); the generator `L` (`:3218`).

**Claim:** Every definition needs a `**Checks.**` list of at least three discriminating tests. The README has 18 such lists, and the last is at line 2872.

**Witness:** `grep -n '\*\*Checks\.\*\*' README.md` → 18 hits, none in §2.2, §5.3, §6.1, §6.5.3 after `:2389`, or §9.3 through §10.

**Repair:** Add three Checks to each. For example:
- **Class D/DL:** `B` is DL but not D on `[0,∞)` (`E|B_n|=√(2n/π)→∞`). `1/‖x+B_t‖` in `d=3` is L²-bounded but not DL, since it is a strict local martingale. `E[ξ|F_t]` is D.
- **Stratonovich integral:** `∫B∘dB=B_t²/2` against Itô `(B_t²−t)/2`. `∫1∘dB=B_t`. A continuous finite-variation `X` gives `[H,X]=0`, so the two integrals agree.
- **Markov property:** `B` is Markov. `∫₀ᵗB_s ds` alone is not, though the pair with `B` is.
- **`H^p`:** the constant 3 is in every `H^p`. A Poisson kernel `P(·,ζ)` is in `h¹` but not in `h^p` for `p>1`.
- **Weak solution:** Tanaka's `dX=sgn(X)dB` has a weak solution and uniqueness in law, but no strong solution.
- **Generator:** `L x²=1` for `B`. `L` of a constant is `0`. For OU, `L x=−λx`.

## R06 (P3) — Broken relative link to OneParameterSemigroups

**Location:** `README.md:184`: "[OneParameterSemigroups](../OneParameterSemigroups/README.md)".

**Claim:** On main the roadmap is under `Completed/`, so this link resolves to nothing.

**Witness:** `TauCetiRoadmap/OneParameterSemigroups` does not exist on main at `fb99861`; `Completed/OneParameterSemigroups/README.md` does (Part A at line 90). The other seven relative links resolve, except PointProcesses (R01).

**Repair:** Change the link to `../../Completed/OneParameterSemigroups/README.md`.

## Previous findings

- **R01** (nineteen `lemma`s): repaired. `grep -c '^lemma' Suggested.lean` gives 0 and the gate's `residue=0`.
- **R02** (two namespaces): repaired. The file has one `namespace TauCetiRoadmap.StochasticCalculus` (`:35`) and ten `/-! ## Layer k: … -/` comments in README order (`:43` … `:616`).
- **R03** (padding): repaired. The file is 645 lines with 37 theorems and 17 supporting definitions, and `predictableMeasure` and the five non-layer sections are gone. All 37 theorems survive the one-tactic probe (below).
- **R04** (absent headlines): repaired. `feynmanKac_scalar` (`:626`), `brownian_stratonovich_symmetric_sums` (`:316`), `brownian_stratonovich_midpoint_sums` (`:333`) and `brownian_natural_augmentation_isRightContinuous` (`:408`) are stated, and the docstring now names only carrier-less families. R03 above covers two families it still omits.
- **R05** (README–Lean names): repaired. `gauge_weighted…` occurs 0 times, and `README.md:2186` and `:2190` now say "Prove `brownian_exact_uniform_modulus`" and "prove `brownian_simultaneous_nowhere_differentiable`". All 54 Lean names occur in the README.
- **R06** (PolarDecomposition contract): repaired. `README.md:95`–`:99` now reads "…the injective, surjective and invertible cases; it states no range-projection identity. S10.2 … derives from PD-C19 that `AA⁺` and `A⁺A` are the orthogonal projections…"
- **R07** (locators): partly repaired.
  - Fixed: the §6.3 locators (MP 1.14 p. 16, 1.27 p. 20, 1.30 p. 21, Lalley Proposition 9 p. 25); Baudoin cited as unnumbered (`:1839`); §9.6 now cites Talay–Tubaro under (H1) plus Kloeden–Platen §14.5; locators added to §0.3, §0.6, §2.4, §4.4, §5.3, §7.1, §9.4, §9.5, §10.2 and §10.3.
  - Still open: the sections listed in R04.
- **R08** (Checks and Layer 3 needs): partly repaired.
  - Fixed: Checks added for `Indistinguishable`, the L⁰ metric, `ambientNullAugmentation`, `IsLocalMartingale`, `ElementaryIntegrand`, the inverse clock, `IsCameronMartinShift` and `IsStrongSolution`. The Layer 3 `*Needs:*` line is split by subsection (`:1721`).
  - Still open: the definitions listed in R05.
- **R09** (OptimalTransport): repaired. `:37`–`:40`, `:189`–`:193`, `:1030`–`:1039` and `:3699`–`:3701` now say OT §13C item 12 builds its own `R^ε_r` and consumes nothing here, and §1.2 proves the comparison.

## Verified sound

**Gate, build, dependency check.**
- The worker's gate and my rerun on this head agree: every scanner is 0 except `dropped=21`, and the verdict is FAIL (R01).
- `lake env lean` on `Suggested.lean` exits 0 with exactly 37 `declaration uses sorry` warnings and nothing else.
- No file outside the folder changes (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StochasticCalculus'` is empty).
- StochasticCalculus is line 209 of the merge order. The dependency check prints:

```text
depcheck: 238 roadmaps, 2349 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. PointProcesses is invisible to this check (see R01).

**Signatures and padding.**
- `#check @name` for all 54 declarations elaborates. The only section binder an elaborated type drops is `[MeasurableSpace Ω]` on `stochasticExponential`, which its body does not use (the time integral is over `ℝ≥0`).
- Every theorem carries `[IsProbabilityMeasure P]` and its filtration and Brownian hypotheses in its own signature. Every README generality matches the Lean except R02.
- Padding probe: replacing each `sorry` by `first | rfl | infer_instance | trivial | simp` leaves all 37 theorems open (27 "`simp` made no progress", 10 "unsolved goals").

**Pinned declarations opened.**
- Mathlib `6b7abb3c`:
  - `IsBrownianReal` (`Probability/BrownianMotion/Basic.lean:302`: `IsPreBrownianReal` plus a.e. continuity); `.neg/.smul/.shift` (`:306`–`:319`); `IsPreBrownianReal.inv` (`:277`, the pre-Brownian inversion S1.4 consumes).
  - `Filtration.IsRightContinuous` (`Process/Filtration.lean:373`: a class with `RC : 𝓕₊ ≤ 𝓕`).
  - `Locally` (`Process/LocalProperty.lean:93`) and `IsStable` (`:142`); `predictable` (`Process/Predictable.lean:52`).
  - `IsCadlag` (`Topology/Order/Cadlag.lean:104`); `poissonMeasure` (`Distributions/Poisson/Basic.lean:40`).
  - `toSphere_real_apply_univ` (`Constructions/HaarToSphere.lean:92`); `AddContent.measure` (`OuterMeasure/OfAddContent.lean`).
  - 38 further README names found by declaration grep, including `isLocalizingSequence_const_top`, both countable-range `stoppedValue_ae_eq_condExp…`, `ext_of_generate_finite`, `indepFun_iff_map_prod_eq_prod_map_map`, `IndepFun.integrable_mul`, `infinitePi_pi`, `infinitePi_cylinder`, `measurable_condLExp`, `setLIntegral_condLExp`, `ae_eq_condLExp`, `withDensityᵥ_apply`, `vectorMeasure_singleton`, `ofFunction_eq_iInf_mem`, `analyticSet_image`, `measurablySeparable`, `measurableSet_of_compl`, `preCantorSet`, `IsStronglyProgressive.isProgressive`, `IsProgressive.isStronglyProgressive`, `setIntegral_Ioc_leftLim_vectorMeasure_eq_sub`, `hittingBtwn`, both CLT names, `IsKolmogorovProcess`, `trajMeasure`, `exists_eq_measurable_comp` and `integral_eq_of_hasDerivAt_off_countable_of_le`.
- Tau Ceti `a91d3aaf` (the README's provenance line matches `lake-manifest.json`): all 19 cited names occur in the cited files (`le_setAverage_ball_of_laplacian_nonneg`, `SubharmonicOn`, `le_of_le_sphere`, `tendsto_ae_condExp_iInf`, `centralMoment_id_two_mul_gaussianReal`, `gaussianHermitePiBasis`, `piHilbertBasis`, both `exists_isProjectiveLimit_*`, `markovChainLaw`, `AnalyticSet.nullMeasurableSet`, the five ball-Poisson names, `harmonicOnNhd_integral_smul_of_contDiffOn`, `ballPoissonIntegral_def`).
- Duplication sweep: neither library has a stochastic integral, bracket, local-martingale abbreviation, indistinguishability or filtration augmentation. The only Tau Ceti "Wiener" hits are Wiener–Ikehara, so every headline is new here.

**Cross-roadmap citations resolved on main (`fb99861`).**
- StandardDistributions: §8.1 Modified Bessel I (line 1227, `Real.besselI` at 1229), §12.1 (2143), §12.2 (2159).
- PDE: B8 = §2.1 (1098), C12 = §3.1 (1304), C15 = §3.4 (1508); Lanes C/F = Layers 3/6. PDE line 101 names StochasticCalculus as owner of Brownian integration and BDG.
- OperatorTheory/PolarDecomposition PD-C19–PD-C27 (500–515).
- `Completed/OneParameterSemigroups` Part A (90); `Completed/OrthogonalL2Bases` Part D (372).
- DifferentialGeometry §0.3 (284); OptimalTransport §13C item 12 (1543–1549).
- FinancialMathematics on main cites S0.2, S3.2–S3.4, S5.1, S5.4, S6.1, S7.3, S7.4 and S9.4 (lines 21, 43, 73), and all of these exist here.

**Ownership against open pull requests (all 466 heads).**
- `roadmaps grep` for Itô integral, stochastic integral, Wiener measure, `IsBrownianReal`, quadratic variation, Girsanov, Cameron–Martin, Feynman–Kac and local martingale finds only consumers: FinancialMathematics/MarketImpact #1655. RandomMatrices #1971 notes that the Itô integral is missing; RelativisticQuantumFieldTheory #1772 matches by vocabulary only.
- PointProcesses #417 is the only other owner of anything here (R01). `overlaps.md` lists no dropped ids and no other pull request changing this folder.

**Sources read (cache line numbers, printed pages).**
- `morters-peres`: line 965 (Theorem 1.14, p. 16, limsup form); 1040 (Remark 1.18, p. 17); 1145 (Theorem 1.27, p. 20); 1205 (Theorem 1.30, p. 21, all `t`); 1953 (Exercise 1.7, p. 31, the limit form); 2272 and 2284 (Theorems 2.5 and 2.7, p. 38, independence from `F⁺(s)` and Blumenthal); 1491 (Theorem 1.38, p. 25); 2694 (Corollary 2.26, p. 47); 4062 and 4091 (Theorems 3.18 and 3.20, p. 72); 6704 (Theorem 5.1, p. 119); 7404 (Theorem 5.22, p. 132); 16136 (Theorem 9.22, p. 272). The printed page is the PDF page minus 10 throughout.
- `lalley`: line 69 (Theorem 1, p. 2), 453 (Theorem 5, p. 13, a finite stopping time of the standard filtration), 619–622 (Proposition 4, equation (32), p. 16), 921 (Proposition 9, p. 25), 981 (Theorem 7, p. 26, nested partitions of `[0,1]`).
- `kratschmer-urusov`: lines 30 and 41–57 (Theorem 1.1). The README's `q>d≥0` widens `t>0` harmlessly: a bound `Cη^{0}` implies `CΔ^{t'}η^{−t'}` for every `t'>0`, and letting `t'↓0` gives every order `γ<q/p`.
- The seeded sample's other locators point to uncertified texts (see Not verifiable).

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances tried | Computed sides | Result; change |
|---|---|---|---|
| `exists_wienerMeasure` | Dirac at 0 path; independent marginals | Var at 1: 0 vs 1; Cov(1,3): 0 vs 1 | both excluded by `IsBrownianReal`; none |
| `Indistinguishable` | `Y_t=1_{t=U}` vs 0 | `P(X_t≠Y_t)=0` each t; common event empty | version, not indistinguishable; Check correct |
| `IsFilteredBrownian` | `2B`; `F₀∋{B₁>0}` | Var(B₃−B₁) 8 vs 2; P(A∩A)=½ vs ¼ | both excluded; none |
| `ambientNullAugmentation` | finite Ω full support; Ω=[0,1], trivial F | only null set ∅ ⇒ F; null-or-conull Borel sets | Checks correct; none |
| `IsLocalMartingale` | constant Cauchy ξ, `τ_n=0` on `{|ξ|>n}` | stage `ξ1_{|ξ|≤n}` bounded; `τ_n↑∞` | Check correct; none |
| `timeMeasure`/§3.1 | T=0; T=2; `(1,3]×A`, P(A)=½ | 0; ‖1‖²=2; mass 1 (right-end error 3/2) | Checks correct; none |
| `exists_stronglyPredictable_ae_of_progressive` | `H=1_{t≥U}`, `F_t=σ(U)` | `K=1_{t>U}` predictable; differs on graph `{t=U}`, dt×P-mass 0 | holds; none |
| `ElementaryIntegrand` | grid 1,3, height 2; `ξ=B₃−B₁` | integral at t=1: 0; anticipating height: E(B₃−B₁)²=2≠0 | Checks correct; none |
| `IsItoIntegral` | t=0; H=1 | `timeMeasure 0=0` ⇒ `I₀=0`; one-step grid gives `B_t`, excludes `cI` | correct; none |
| `itoIntegral_isometry` | H=2, T=3 | `E(2B₃)²=12`; `∫4 d(timeMeasure 3⊗P)=12` | equal; none |
| `exists_isItoIntegral`, `itoIntegral_localMartingale` | `H=Z` Cauchy in F₀ | `I=ZB`; stages `Z1_{|Z|≤n}B` martingales; `E Z²B₁²=∞` | local, not L²; none |
| `isItoIntegral_unique` | H=1, candidates B and 2B | 2B fails the elementary limit `B_t` | unique; none |
| `itoIntegral_local_congr` | H=1, K=`1_{t≠U}` | equal dt×P-a.e.; both integrals B | indistinguishable; none |
| `IsQuadraticVariation` for B | A=2t; A=0; A=t | `E[B_t²−2t]=−t`; `E B_t²=t≠0`; `B²−t` martingale | only A=t; none |
| same, `N_t−t` | A=t | `Var N_t=t` ⇒ `(N−t)²−t` martingale; `[N−t]=N` | predictable bracket; Check correct |
| `isQuadraticVariation_unique` | M=B; arbitrary M | A=A'=t; for arbitrary M route needs stopping bare martingales; `X_t=1_{t=U}` stopped at U has mean t≠0 | R02: add hM, hCont |
| `continuous_bdg` | M=B, τ=1, p=2 | `E[M]₁=1`; `1≤E sup_{s≤1}B_s²≤4` (Doob) | consistent with c₂≤1, C₂≥4; none |
| `levy_characterization_adapted` | M=2B | `[2B]_t=4t≠t` | excluded; none |
| `filteredBrownian_of_brownianLaw_localMartingale` | F₀ reveals sign B₁ | `E[B₁|F₀]=sgn(B₁)E|B₁|≠0` ⇒ not F-local | hypothesis excludes; none |
| `exists_predictable_brownian_*` | B altered on a null set N to non-adapted values | selected predictable B' equals B off N | indistinguishable; none |
| `brownian_ito_C2` | f=x²; f=3 | `B_t²=2∫B dB+t`; 3=3 | correct; none |
| `brownian_stratonovich_symmetric_sums` | h=x; h=1; t=0 | sums telescope to `(B_t²−B₀²)/2`; `B_t−B₀`; empty-partition sum 0=H(B₀)−H(B₀) | correct; none |
| `brownian_stratonovich_midpoint_sums` | h=x; biased clock μ_p | mean `Σ(m_i−t_i)=t/2`; clock limit `Strat+(p−½)A(1)` | Brownian-only; none |
| `brownian_reflection` | t=0; a=0; t=a=1 | 0=0; 1 vs 2 (excluded by `0<a`); `2(1−Φ(1))≈0.3173` | Lalley (32); none |
| `brownian_hitting_laplace` | x=a; θ=0; x=0,a=1,θ=½ | 1=e⁰; 1=1; `e^{−1}` | correct; none |
| `brownian_interval_exit` | x=0,K=1; |x|≥K | Eτ=1=K²; 0=max 0(K²−x²) | correct; none |
| `brownian_strongMarkov` | τ≡1 | reduces to independent increments after 1 | correct; none |
| `brownian_martingaleRepresentation` | ξ=B_T² | `ξ=T+∫2B dB`, Eξ=T | correct; none |
| `brownian_natural_augmentation_isRightContinuous` | germ event `{limsup_{t↓0}B_t/√t>0}` | in F₀₊, P=1 (Blumenthal), so in F₀⊔null sets; not in raw F₀ | augmentation needed; none |
| `brownian_lil` | 2B; t≤e | limsup 2; junk `√(neg)=0` outside eventual filter | correct; none |
| `brownian_exact_uniform_modulus` | 2B; line; T=0; scaling to [0,T] | 2; 0; 0≠1 (so `0<T`); `√T·g(h/T)/g(h)→1` | true as a limit (MP Ex. 1.7); R04 locator |
| `brownian_simultaneous_nowhere_differentiable` | line t | differentiable, variance 0≠t | excluded; none |
| `exists_brownian_localTime` | T=1, a=0; ½L | `E L₁⁰=E|B₁|=√(2/π)`; ½L breaks Tanaka | correct; none |
| `dambisDubinsSchwarz` | M=2B, A=4t | `W_s=2B_{s/4}`, Var s; `W_{A_t}=2B_t` | correct; none |
| `stochasticExponential`, `novikov_expectation` | θ=0; θ=2, T=3 | 1; `E e^{2B₃−6}=1`, Novikov `E e^{6}<∞`; sign flip mean −6 | correct; none |
| `IsBrownianOn`, `girsanov_on_horizon` | θ=2,T=3; θ=1 on [0,1] | Q-mean B₃=6, corrected 0, Var 3; Q-mean B₂=1, minus 2 gives −1 | horizon needed; none |
| `IsCameronMartinShift` | h=2t; √t; h(0)=1 | energy 12; `∫dt/4t=∞`; `∫_(0,0]=0` | Checks correct; none |
| `cameronMartin_pushforward` | h=2t, T=3, coordinate B₃ | `dN(6,3)/dN(0,3)(x)=e^{2x−6}` = density | positive sign; none |
| `cameronMartin_equivalence`/`_singularity` | T=0; h=√t; product vs path σ-algebra | `δ₀~δ_{h(0)}` iff h(0)=0; singular; traces agree on continuous paths | correct; none |
| `IsStrongSolution`, `exists_strongSolution` | b=σ=0, Cauchy ξ; b=tx | X=ξ (no moment); `X=ξe^{t²/2}`, `L_T=T` | correct; none |
| `strongSolution_pathwise_unique` | b=2√|x|, ξ=0 | X=0 and X=t² both solve | Lipschitz needed; none |
| `feynmanKac_scalar` | b=0,σ=1,q=½,u=sin; T=0 | residual `−½sin+½sin=0`; `E[e^{T/2}sin(x+B_T)]=sin x`; reversed weight `e^{−T}sin x`; both sides u(0,x) | sign pinned; none |
| §1.1 Chentsov | B: q=p/2, d=1 | Hölder `<(p/2−1)/p→½` | matches K–U 1.1; none |
| §1.5 Donsker | σ=0; Kolmogorov maximal | polygon ≡0, law δ₀ = law of 0·B; `P(max≥λ)≤ΣEZ²/λ²` | correct; R04 locator |
| §3.5 overshoot | `M=1_{[s₀,∞)}`, X≡1, t∈[s₀−2⁻ⁿ,s₀) | overshooting sum 1, integral 0, for every n | not uniform; correct |
| §3.5 Poisson identity | X≡1 | `∫dM=N_t−αt=Σ_{τ_k≤t}1−αt` | correct; R01 carrier |
| §4.4 | rate 2, t=3 | `[N−2t]₃=N₃`, `⟨N−2t⟩₃=6` | correct; R01 carrier |
| §5.2 jump Itô | f=x², X=N | jump sum `Σ(n²−(n−1)²−2(n−1))=N_t`; at N_t=2: 4=2·1+2 | correct; R04 locator |
| §6.4 | annulus d=2; d=3 `E_x[1/‖B_t‖]` near part | `log(R/|x|)/log(R/r)` (MP 3.18); `(2πt)^{−3/2}·2πR²` | correct; R04 locator |
| §8.3 finite grid | D_n; D−D_n; Abel N=2; h=t² | `E D_n^p=e^{p(p−1)‖u_n‖²/2}`; `E(D−D_n)²=e^{‖u‖²}−e^{‖u_n‖²}`; both sides `−h₁z₀+(h₁−h₂)z₁+h₂z₂`; `2T³/3` | correct; none |
| §8.3 BV case | `1/D(x+h)` | `=exp(−I(h,x)−½∫h′²)=J(h,x)`; pushforward `J(−h,x)=D` | signs correct; none |
| §9.4 | GBM moment; bounded random case; linear system; hyperbolic | `exp((pμ+p(p−1)σ²/2)t)`; `p(p−1)<0` term ≤0; `e^{−t}X_t=C₁+tC₂+∫se^{−s}dA+∫[1−s(t−s)]e^{−s}dB`; `dX=√(1+X²)(dt+dB)+X/2 dt` | correct; none |
| §9.4 Lyapunov, F_C, g | `y²≥2`; `F_C′`; `g=2arctan e^{z−C}` | max `y²/(y²−1)≤2`; `2cosh w/(2cosh w−sinh w)`; `g′=sech=sin g` | correct; none |
| §9.4a | d=3 kernel; sphere integral d=2,3 | `I_{1/2}=√(2/πz)sinh z`; `2πI₀(z)`; `4π sinh z/z` | correct; none |
| §10.2 pseudoinverse | diag(2,0); 0; invertible | `diag(½,0)`, projections `diag(1,0)`; 0; `A⁻¹` | correct; none |
| §10.3 | q=2, payoff 1 | `e^{2(T−t)}`; killing `e^{−2(T−t)}` | correct; none |
| §2.3 doubling, ruin | fair signs; p≠q | `E[W_n1_{τ>n}]=2⁻ⁿ−1→−1`; `((q/p)^s−1)/((q/p)^{r+s}−1)` | correct; none |
| §7.1 inverse clock | `min(t,1)`; interior plateau | T(1)=∞ vs non-strict 1; `T(1)=2`, `T(A_t)=2≠t` | correct; none |
| R01 repair | first jump τ, announcing τ_n | `E[N_{τ∧k}−N_{τ_n∧k}]=αE[τ∧k−τ_n∧k]→0` vs `P(τ≤k)=1−e^{−αk}` | contradiction, so no carrier needed |

## Not verifiable

- **Karatzas–Shreve** (§§1.5, 2.7.A, 2.8, 2.9, 3.2.D, 3.3, 3.4, 3.5, 5.2, 5.4, Theorem 5.7.6): Springer, paywalled; the manifest settles it as uncertified. Theorem 5.7.6 as I recall it assumes a continuous nonnegative killing rate. The README's bounded signed Borel `q` is covered by its own Itô route (`e^{∫q}≤e^{CT}`), not by the citation.
- **Revuz–Yor** (IV §1, IV.1.8, IV §4, V §1, VI §1, VII §1, VIII §1, XI §1), **Protter** (I §4, II §6, III, V §5), **Kunita**, **Kloeden–Platen** §14.5 and **Chung–Rao 1981**: paywalled, uncertified; the section titles are plausible, but I checked no statement.
- **MATH5695**: waived by the manifest. Its page citations (pp. 1, 17, 101, 173, 178, 185, 218, 235, 247, 261–263 and the corrections table) are not checked.

## Source issues

- none
