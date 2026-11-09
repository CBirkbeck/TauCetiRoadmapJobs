# Review of StochasticCalculus (pull request #1030 at ed75179)

**Verdict:** needs changes

This is a full review: the folder changed by 646 lines since `76211b5`. The gate passes at this head (every scanner 0, `build=0`, `dropped=0`). All six findings of the previous review are repaired (see "Previous findings"). One finding remains, a P3 on locators: four of the fifteen sampled sections and five others state theorems without any source locator, and one Hairer citation attributes to a theorem's statement what only its proof shows. Nothing blocks.

## R01 (P3) — Theorem-level statements without a locator in nine sections; one Hairer attribution is to a proof, not a statement

**Location:** `TauCetiRoadmap/StochasticCalculus/README.md` §0.1 (`:383`–`:414`, the L⁰ metric: "Prove representative independence, the metric axioms, completeness and equivalence with native `MeasureTheory.TendstoInMeasure P`"), §1.4 (`:966`–`:990`, time inversion and the Volterra transform), §3.1 (`:1391`–`:1427`, the Doléans measure `μ_M` of an L² martingale), §3.3 (`:1513`–`:1526`, the integral-process properties and `μ_Y(A)=∫_A X² dμ_M`), §5.5 (`:1892`–`:1937`, the Lévy characterization and its vector form), §6.7 (`:2489`–`:2496`, the Wiener shift's ergodicity and mixing), §7.5 (`:2636`–`:2651`), §8.2 (`:2695`–`:2716`), §9.2 (`:2918`–`:2926`, maximal solutions and the Lyapunov nonexplosion criterion); and §8.1 `:2685`–`:2687`: "Theorem 4.44, p. 31, for absolute continuity of translates exactly along it and mutual singularity otherwise".

**Claim:** Every theorem needs a locator. These nine sections contain theorem statements (not only definitions or routes) and no theorem, section or page reference; §§0.1, 1.4, 3.1 and 3.3 are in the worker's seeded sample. In §8.1, Hairer's Theorem 4.44 states only that the translate is absolutely continuous iff `h ∈ H_μ`; mutual singularity for `h ∉ H_μ` is established inside its proof, not in the statement cited.

**Witness:** A scan of the README for theorem, section, page, chapter, exercise or equation tokens finds none in the nine sections (every other `### k.n` section has at least one). `hairer-spde line 1555`–`1556` is the statement of Theorem 4.44 (absolute continuity iff `h ∈ H_μ`); `lines 1585`–`1591` prove the total-variation distance is 2, hence singularity, inside the proof.

**Repair:** Add a theorem- or section-level locator to each statement, for example:
- §1.4: Karatzas–Shreve, Lemma 2.9.4 (scaling and time inversion), uncertified; the Volterra covariance is an own computation and says so.
- §3.1 and §3.3: Karatzas–Shreve, §3.2.A (the measure `μ_M` on predictable sets) and §3.2.B, Proposition 2.10 (martingale, continuity, linearity and the measure identity of the integral), uncertified.
- §5.5: Karatzas–Shreve, Theorem 3.3.16, or Revuz–Yor, Chapter IV, Theorem 3.6 (Lévy's characterization), uncertified.
- §8.2: Revuz–Yor, Chapter VIII, §1 (already cited in the Layer 8 preamble; repeat it at the statements), and Mörters–Peres, Theorem 1.38, p. 25, for the `C[0,1]` form.
- §7.5: Karatzas–Shreve, §3.5 (the finite-horizon consistency and infinite-horizon Girsanov statements), uncertified.
- §9.2: Karatzas–Shreve, §5.2 for local Lipschitz existence up to explosion, or Protter, Chapter V, uncertified; the Lyapunov criterion names its source.
- §0.1 and §6.7: a measure-theory text for the convergence-in-measure metric and a random-dynamical-systems text for the Wiener shift's cocycle and mixing, each as a new `sources.toml` entry or as an own computation stated as such.
- §8.1: cite "Theorem 4.44 and its proof" for the singularity half, or move the singularity citation to Mörters–Peres, Theorem 1.38(1).

## Previous findings

- **R01** (PointProcesses, a dropped roadmap, as supplier): repaired. `grep -c PointProcesses README.md` gives 0; the gate's `dropped=0`. §0.6 (`:771`–`:851`) now owns the filtration-relative rate-α Poisson counting process: definition with `poissonMeasure` laws and independence from `F_s`, existence by `TauCeti.Measure.exists_isProjectiveLimit_of_countable` with consistency from `poissonMeasure_conv_poissonMeasure` (`Probability/Distributions/Poisson/Basic.lean:173`), regularization, jump times with Erlang laws and independent exponential waits; §2.1 (`:1084`–`:1091`) proves `N_t−αt` and `(N_t−αt)²−αt` martingales; §2.3 (`:1188`–`:1196`) proves nonpredictability of the first jump by the bounded-sampling argument the previous review supplied; §2.5 (`:1351`–`:1365`) restates the compensator dictionary for counting processes; §3.5 and §4.4 keep the Poisson identities on the regularized process. `nnvolume` is this roadmap's own definition (`:50`). The merge-order paragraph of the pull request description still names PointProcesses (#417) as a predecessor; that is description text, not roadmap content, and the worker drops it on submission.
- **R02** (`isQuadraticVariation_unique` without hypotheses on `M`): repaired. `Suggested.lean:228`–`:232` now carries `(hM : IsLocalMartingale F P M) (hCont : ∀ᵐ ω ∂P, Continuous (fun t => M t ω))`.
- **R03** (weak SDE and potential-theory headlines neither stated nor named): repaired. `exists_weakSolution_boundedDrift` (`:646`), `weakSolution_boundedDrift_law_unique` (`:657`), `IsBrownianVector` (`:464`) and `brownian_point_polar` (`:471`) are stated; the module docstring (`:17`–`:19`) names both families; README §6.4 (`:2152`–`:2182`) and §9.3 (`:2930`–`:2941`) carry the statements with Mörters–Peres, Corollary 2.26 and Karatzas–Shreve, §5.3.
- **R04** (locators): repaired for every section it listed. §1.5 cites Mörters–Peres, Theorem 5.22, p. 132 (`:995`); §5.2 cites Protter, Chapter II, §§6–7 (`:1820`); §6.4 cites Theorems 3.18, 3.20, Corollary 2.26 and Theorem 9.22 (`:2180`–`:2208`); §8.1 cites Hairer §4.2, Definition 4.26 and Theorem 4.44 (`:2685`); §8.3 cites Theorem 1.38, p. 25 (`:2722`); §9.3 cites Karatzas–Shreve, §5.3 (`:2931`); §10.1 cites §5.4 (`:3205`); stochastic Fubini cites Protter, Chapter IV, §6, Theorems 64–65 (`:1623`); §6.3 and the Lean docstring add Remark 1.18 and Exercise 1.7 (`:2123`, `Suggested.lean:434`); `:2870` now reads "Theorem 6.2.3 of the MATH5695 notes". R01 above is the residue of this class in sections the previous sample did not reach.
- **R05** (definitions without Checks): repaired. Checks are present for class D and DL (`:1152`–`:1164`), the Stratonovich integral (`:1866`–`:1874`), the finite-history Markov property (`:2058`–`:2068`), analytic and harmonic `H^p` (`:2465`–`:2474`), weak solutions (`:2943`–`:2953`) and the generator (`:3271`–`:3277`). Each Check's values are recomputed in the table below.
- **R06** (OneParameterSemigroups link): repaired. `:173` links `../../Completed/OneParameterSemigroups/README.md`, which exists on main (Part A at line 90).

## Verified sound

**Gate, build, dependency check.**
- My rerun of the gate with `--build` on this head: every scanner 0, `build=0`, verdict OK, exit 0. The worker's gate agrees.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StochasticCalculus'` is empty: no change outside the folder. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` only.
- StochasticCalculus is line 209 of the merge order. The dependency check prints

```text
depcheck: 238 roadmaps, 2352 edges, 0 problem(s)
```

  with no UPWARD, CYCLE or `moved:` line. Every supplier named (StandardDistributions, PDE, OperatorTheory/PolarDecomposition, DifferentialGeometry, OptimalTransport, FinancialMathematics, MarkovChainsAndRenewal, Completed/OneParameterSemigroups, Completed/OrthogonalL2Bases) is on main at `9110a01`.

**Signatures and padding.**
- `scratch/signatures.md` elaborates all 58 declarations (40 theorems, 18 definitions, one `abbrev`, one `structure`). The only section binder an elaborated type drops is `[MeasurableSpace Ω]` on `stochasticExponential`, whose body does not use it. The three new theorems bind their own probability spaces (`Ω'`, `Ω₁`, `Ω₂`) or carry `IsProbabilityMeasure P` and `IsBrownianVector P B` explicitly.
- Padding probe: a scratch copy with every `sorry` replaced by `first | rfl | infer_instance | trivial | simp` elaborates with exactly 40 errors for the 40 theorems (29 "`simp` made no progress", 11 "unsolved goals"), so no theorem closes in one tactic. No `example`, `set_option`, `lemma`, sorry'd data or `#print axioms`.
- README and Lean agree: every Lean name occurs in the README (gate `readme-ids-missing=0`); `ElementaryIntegrand.toProcess`, the one lead in `scratch/citations.md`, is this roadmap's own definition at `Suggested.lean:121`.

**Pinned declarations opened** (Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`, the manifest's pins).
- `poissonMeasure_conv_poissonMeasure` (`Probability/Distributions/Poisson/Basic.lean:173`) and `IndepFun.hasLaw_add_map_cast_poissonMeasure` (`:195`: independent `X,Y` with laws `Po(R,r₁)`, `Po(R,r₂)` give `X+Y` law `Po(R,r₁+r₂)`), exactly what §0.6's consistency step and the API bullet use. `HasLaw` (`Probability/HasLaw.lean:39`).
- `hittingAfter` (`Process/HittingTime.lean:65`): `if ∃ j, n ≤ j ∧ u j x ∈ s then sInf {…} else ⊤`, with a non-strict `n ≤ j`; so in `brownian_hitting_laplace` with `x = a` and in `brownian_interval_exit` with `|x| ≥ K` the time is 0, matching `exp(0)=1` and `max 0 (K²−x²) = 0`.
- `IsStronglyPredictable` (`Process/Predictable.lean:163`), `StronglyAdapted` (`Process/Adapted.lean:104`), `IsStronglyProgressive` (`:261`), `stronglyAdapted_iff_adapted` (`:149`), `Filtration.natural` (`Process/Filtration.lean:395`), `iIndepFun` (`Independence/Basic.lean:135`), `isLocalizingSequence_const_top` (`Process/LocalProperty.lean:69`), `IsPreBrownianReal.inv` (`BrownianMotion/Basic.lean:277`), `IsBrownianReal.neg/.smul/.shift` (`:306`–`:319`). No vector Brownian predicate exists at the pin, so `IsBrownianVector` is new here.
- Tau Ceti: `exists_isProjectiveLimit_of_countable` (`Measure/ProjectiveLimit/Countable.lean:167`), `exists_isProjectiveLimit_nat` (`Nat.lean:210`), `markovChainLaw` (`Process/MarkovChain.lean:124`), `tendsto_ae_condExp_iInf` (`Martingale/Convergence.lean:164`), `centralMoment_id_two_mul_gaussianReal` (`Gaussian/Moments.lean:118`), `gaussianHermitePiBasis` (`Hermite/Pi/Basis.lean:54`), `piHilbertBasis` (`L2/Pi.lean:339`), `AnalyticSet.nullMeasurableSet` (`MeasurableSpace/Analytic.lean:312`), `le_setAverage_ball_of_laplacian_nonneg` (`Harmonic/MeanValue/Basic.lean:464`), `SubharmonicOn.le_of_le_sphere` (`Subharmonic.lean:170`), `integral_ballPoissonKernel` (`PoissonIntegral/Ball.lean:84`), `ballPoissonIntegral_def` (`:143`), `harmonicOnNhd_ballPoissonIntegral` (`:153`), `tendsto_ballPoissonIntegral` (`:261`), `exists_harmonicOnNhd_ball_continuousOn_closedBall_eqOn_sphere` (`:362`), `ballPoissonKernel_pos_on_sphere` (`GreenFunction/Ball.lean:388`), `harmonicOnNhd_integral_smul_of_contDiffOn` (`Laplacian/ParametricIntegral.lean:80`).

**Cross-roadmap citations resolved on main (`9110a01`).**
- StandardDistributions: Layer 1 line 239 (Poisson mean and variance `r`), Layer 2 line 357 (`P(X>n)=G_{n+1}(r)`), §8.1 `Real.besselI` (1227–1229), §12.1 (2143), §12.2 (2159).
- MarkovChainsAndRenewal: Layer 4 item 4 (line 309, Poisson count law of the exponential renewal process) and Layer 7 items 1–3 (lines 390–421; item 3 is the natural-history restart). Its gap equivalence is consumed from PointProcesses, a dropped roadmap, so no roadmap on main that this one may cite owns the "Poisson increments imply exponential waits" direction; §0.6 stating that direction here, and citing MarkovChainsAndRenewal for the renewal side without consuming it, is the correct ownership split.
- PDE: B8 = §2.1 (1098), C12 = §3.1 (1304), C15 = §3.4 (1508); PDE line 101 names StochasticCalculus as owner of finite-dimensional Brownian motion and the stochastic integral.
- OperatorTheory/PolarDecomposition PD-C19–PD-C27 (500–515); Completed/OneParameterSemigroups Part A (90); Completed/OrthogonalL2Bases Part D (13, 62); OptimalTransport §13C item 12 (1543–1573, which builds `R^ε_r` itself); FinancialMathematics cites S0.2, S3.2–S3.4, S5.1, S5.4, S6.1, S7.3, S7.4, S9.4 (lines 21, 43, 73), all present here.

**Ownership against open pull requests (all 466 heads, `roadmaps grep`).** "Poisson process" matches only PointProcesses #417 (dropped, not citable), GeometryOfNumbersAndQuadraticArithmetic #851 (a finite Poisson configuration on a general measurable space, a different object), RandomMatrices #1971 (uses the unit-rate process's void probability as a comparison) and MarkovChainsAndRenewal on main. "counting process", "Poisson counting", "exponential waiting", "polar for Brownian" match no other roadmap; "weak solution" matches only PDE-type roadmaps (IncompressibleFlows, InverseGalois embedding problems). `scratch/overlaps.md` lists no dropped ids and no other pull request changing this folder.

**Sources read (cache line numbers).**
- `morters-peres`: line 2694 (Corollary 2.26: for any points `x,y ∈ ℝ^d`, `d ≥ 2`, `P_x{y ∈ B(0,1]} = 0`, so `a = x` is included as the README says); 4062 (Theorem 3.18, annulus exit); 4091 (Theorem 3.20, recurrence in d ≤ 2, transience in d ≥ 3); 16136 (Theorem 9.22 on `[0,1]`: no double points for d ≥ 4, double points for d = 3); 7404 (Theorem 5.22, Donsker on `C[0,1]`); 1491 (Theorem 1.38, Cameron–Martin on `C[0,1]` with `F(0)=0`, singular off `D[0,1]`, equivalent on it); 965, 1040, 1953 (Theorem 1.14, Remark 1.18, Exercise 1.7).
- `hairer-spde`: line 1384 (Definition 4.26, between the page-27 and page-28 markers at 1357 and 1403); 1555 (Theorem 4.44, between the page-31 and page-32 markers at 1539 and 1593): the statement is absolute continuity iff `h ∈ H_μ`; lines 1585–1591 prove singularity otherwise (R01).
- `lalley`: 69 (Theorem 1, p. 2), 453 (Theorem 5, p. 13, finite stopping time of the standard filtration), 619–622 (Proposition 4, equation (32), p. 16), 921 (Proposition 9, p. 25), 981 (Theorem 7, p. 26, nested partitions of `[0,1]`).
- `kratschmer-urusov`: 41–57 (Theorem 1.1: covering numbers `N(η) ≤ Cη^{−t}`, moment bound `E d^p ≤ M d^q` with `q > t`, Hölder exponents `β < (q−t)/p`); the README's `q > d ≥ 0` widens the paper's `t > 0` harmlessly.
- `ondrejat-seidler`: 49 (Theorem 0.1: Polish state space, adapted process, no hypothesis on the filtration, progressive modification).
- `talay-tubaro`: 185 (Theorem 1), 435 ((H1): `C^∞` coefficients with bounded derivatives of every order).
- `theodorakopoulos`: 75, 147, 183 (Theorems 2.3–2.5), 235, 266 (Lemma 3.5, Theorem 3.7), 304, 318 (Lemma 4.2, Theorem 4.4), 337, 345 (Lemma 4.8, Theorem 4.9).
- `bgs1971`: 548 (Theorem 1′) and 565 (Theorem 3′), on scan pages 14–15, printed pp. 150–151.
- `dlmf10`: 10.29.1 (line 73) and 10.29.2 (line 109), the recurrence and derivative identities used in §9.4a.

**Adversarial table.** One row per statement; values on both sides.

| Statement | Instances tried | Computed sides | Result; change |
|---|---|---|---|
| §0.6 rate-α F-Poisson process | rate 2, t=3; s=t; F₀∋{N₁=0}; α=0 | mean 6, Var 6, P(N₃=0)=e⁻⁶; `poissonMeasure 0 = δ₀`; P(A∩A)=e⁻¹≠e⁻²; N≡0 a.s. | Checks correct; none |
| §0.6 regularization bound | Po(λ), λ=αT/m | `1−e^{−λ}(1+λ) ≤ λ²/2` (g(0)=0, g′=λ(1−e^{−λ})≥0); m·λ²/2=(αT)²/(2m) | correct; none |
| §0.6 joint jump-time law | boxes; k=0 | box probability `α^k∏(b_j−a_j)(e^{−αa_k}−e^{−αb_k})` = integral of `α^{k+1}e^{−αs_k}`; k=0: `e^{−αa}−e^{−αb}` = Exp(α) | correct; none |
| §0.6 Erlang jump times | k=0; general k | `P(τ_k≤t)=P(Po(αt)>k)=G_{k+1}(αt)`; k=0 gives `1−e^{−αt}` | correct; none |
| §0.6 independent waits | change of variables w_j=s_j−s_{j−1} | density `α^{k+1}e^{−αΣw_j}=∏αe^{−αw_j}` | correct; none |
| §2.1 compensated Poisson martingales | α=2, s<t=3 | `E[M_t²−M_s²∣F_s]=E[(M_t−M_s)²]=α(t−s)`; `E(N₃−6)²=6` | correct; none |
| §2.3 first jump not announceable | α=1, k=1 | `E[Ñ_{τ₀∧k}−Ñ_{ρ_n∧k}]=αE[τ₀∧k−ρ_n∧k]→0` vs `1−e^{−1}=0.632` | contradiction as stated; none |
| §2.5 counting-process compensator | Poisson rate 2, t=3; rectangle (s,t]×F | `A₃=6=E N₃`; `E[1_F(N_t−N_s)]=α(t−s)P(F)` both sides | correct; none |
| §3.5 Poisson pathwise integral | X≡1 on G; off G | `N_t−αt=Σ_{τ_k≤t}1−αt`; `0−αt` = empty sum `−αt` | correct; none |
| §4.4 jump brackets | rate 2, t=3; one-jump path | `[N−2t]₃=N₃`, `⟨N−2t⟩₃=6`; 1 vs 6 | correct; none |
| §2.2 class D/DL Checks | n=1, n=100; horizon T | `E∣B_n∣=√(2n/π)`: 0.798, 7.98 → unbounded; `E sup_{s≤T}B_s²≤4T` | correct; none |
| §6.1 Markov Check | Y=∫B, times 1,2,3 | `Cov(Y_s,Y_t)=s²(3t−s)/6`: Cov(1,3)=4/3, Var Y₂=8/3, product 32/9; Cov(1,2)=5/6, Cov(2,3)=14/3, product 35/9 | unequal, not Markov; none |
| §6.4 `IsBrownianVector` Checks | (W,W); rotated pair; d=1 | cross-cov `min(s,t)≠0`; `(min−min)/2=0`; d=1 hits a≠x a.s. | correct; none |
| `brownian_point_polar` | d=2, a=x; d=1 excluded | MP 2.26 with y=x: 0; d=1: P(hit)=1 | `2 ≤ d` needed and present; none |
| §6.5.3 `H^p` Checks | F=1/(1−z); Poisson kernel | `∫∣1−re^{iθ}∣^{−p}dθ` bounded iff p<1; kernel radial integrals 1, `∫P(rζ,ζ₀)^p ≍ (1−r)^{1−p}→∞` for p>1 | correct; none |
| §9.3 Checks | Tanaka sgn(0)=−1; b≡1; zero diffusion | `[X]=t` so every solution Brownian; law `N(x+t,t)`; `X=t²`: `2t=min(2t,2)` on [0,1] vs `X=0` | correct; none |
| `exists_weakSolution_boundedDrift` | b=0; b=1 | `X=x+B` with `I=B` from the one-step grid 0,t (energy 0, integral `B_t`); `X=x+t+B` | correct; none |
| `weakSolution_boundedDrift_law_unique` | b=1 on two spaces | both laws = law of `x+t+B`; density `exp(−∫b dX+½∫b²)` is a functional of X | correct; none |
| §10.2 generator Checks | BM x², constants; OU | `L x²=1`; `L1=0`; `Lx=−λx`, `Lx²=−2λx²+σ²`, stationary variance `σ²/(2λ)` | correct; none |
| §5.3 Stratonovich Checks | h=x; H≡1; FV X | `B²/2` vs `(B²−t)/2`; wrong sign `(B²−2t)/2`; `[1,X]=0` | correct; none |
| §5.3 biased clock | μ_p, dyadic grids | `Σ(M_mid−M_left)ΔM → pA(1)`; midpoint limit `M₁²/2+(p−½)A(1)`; p=½ recovers | correct; none |
| §1.1 Chentsov via K–U | B: p=2m, q=m, t=1 | `β<(m−1)/(2m)→½` | matches Theorem 1.1; none |
| `exists_wienerMeasure` | Dirac at 0; independent marginals | Var at 1: 0 vs 1; Cov(1,3): 0 vs 1 | excluded by `IsBrownianReal`; none |
| §1.4 time inversion, Volterra | `tB_{1/t}`; K≡1, s=t | `Cov=st·min(1/s,1/t)=min(s,t)`; `t+t²+t³/3 = Var(B_t+∫₀ᵗB)` | correct; R01 locator |
| §3.1 predictable measure Checks | T=0; T=2; (1,3]×A, P(A)=½ | 0; 2; 1 (right endpoint would give 3/2) | correct; R01 locator |
| §3.3 measure identity | X=2, M=B, T=3 | `μ_Y`-mass `4·3=12=E(2B₃)²` | correct; R01 locator |
| §3.4 domain Checks | H=2; 1/√t; Cauchy Z | `4T`; `∫₀¹dt/t=∞`; pathwise `TZ²`, expected ∞ | correct; none |
| `IsItoIntegral`, isometry, uniqueness | t=0; H=1; H=2,T=3 | `timeMeasure 0=0 ⇒ I₀=0`; one-step grid forces `I=B`; `E(2B₃)²=12=∫4` | correct; none |
| `IsQuadraticVariation` | A=2t; A=0; `N−t`, A=t | drift −t; `E B_t²=t≠0`; predicate holds yet `[N−t]=N` | Check correct; none |
| `isQuadraticVariation_unique` | M=B; M without hM | A=A′=t; `X_t=1_{t=U}` stopped at U has mean t≠0 | hypotheses now present (R02 repaired) |
| `continuous_bdg` | M=B, τ=1, p=2 | `E[M]₁=1`; `1≤E sup_{s≤1}B_s²≤4` | consistent with c₂≤1, C₂≥4; none |
| `brownian_ito_C2` | f=x²; f=3 | `B_t²=2∫B dB+t`; `3=3` | correct; none |
| Stratonovich sums | h=x; t=0 | symmetric sums telescope to `(B_t²−B₀²)/2`; empty sum `0=H(B₀)−H(B₀)` | correct; none |
| `levy_characterization_adapted` | M=2B; F₀ reveals sign B₁ | `[2B]_t=4t≠t`; `E[B₁∣F₀]≠0` so not F-local | excluded; none |
| `brownian_reflection` | t=0; a=0; t=a=1 | 0=0; 1 vs 2 excluded by `0<a`; `2(1−Φ(1))=0.3173` | Lalley (32); none |
| `brownian_hitting_laplace`, `interval_exit` | x=a; θ=0; x=0,a=1,θ=½; x=0,K=1; ∣x∣≥K | τ=0 (non-strict `hittingAfter`), `e⁰=1`; 1=1; `e^{−1}`; `Eτ=1`; τ=0 and `max 0(K²−x²)=0` | correct; none |
| `brownian_lil`, modulus, nowhere differentiable | 2B; line; T=0 | limsup 2; modulus 0 and derivative 1; `0≠1` so `0<T` | correct; none |
| `brownian_natural_augmentation_isRightContinuous` | germ event | in `F_{0+}`, P=1 (Blumenthal), not in raw `F₀` | augmentation needed; none |
| `exists_brownian_localTime` | T=1, a=0; ½L | `E L₁⁰=E∣B₁∣=0.798`; ½L breaks Tanaka | correct; none |
| §7.1 inverse clock Checks | `min(t,1)`; interior plateau | strict `T(1)=∞` vs non-strict 1; `T(A_t)=2≠t` | correct; none |
| `dambisDubinsSchwarz` | M=2B, A=4t | `W_s=2B_{s/4}`, Var s, `W_{A_t}=2B_t` | correct; none |
| `novikov_expectation`, `girsanov_on_horizon` | θ=2,T=3; θ=1 on [0,1] | `E e^{2B₃−6}=1`, `E e^{6}<∞`; Q-mean B₃=6, corrected 0; Q-mean B₂=1, minus 2 gives −1 | correct; none |
| Cameron–Martin headlines | h=2t,T=3; h=√t; h(0)=1; T=0 | energy 12, `dN(6,3)/dN(0,3)(x)=e^{2x−6}`; `∫dt/(4t)=∞`; disjoint Diracs; `δ₀~δ_{h(0)}` iff h(0)=0 | correct; none |
| §8.3 finite-grid densities | D_n; D−D_n; Abel N=2; h=t² | `E D_n^p=e^{p(p−1)‖u_n‖²/2}`; `E(D−D_n)²=e^{‖u‖²}−e^{‖u_n‖²}`; both sides `h′(ξ₂)z₂−h′(ξ₁)z₀−(h′(ξ₂)−h′(ξ₁))z₁`; `2T³/3` | correct; none |
| §9.1 Checks | b=σ=0 Cauchy ξ; b=tx; b=2√∣x∣ | `X=ξ`; `ξe^{t²/2}`, `L_T=T`; 0 and t² | correct; none |
| §9.4 OU, GBM, hyperbolic | λ≠0; p-moment; sinh | `Cov(Z_s,Z_t)=σ²e^{−λ(t−s)}(1−e^{−2λs})/(2λ)`, stationary `σ²e^{−λ∣t−s∣}/(2λ)`; `exp((pμ+p(p−1)σ²/2)t)`; `dX=√(1+X²)(dt+dB)+X/2 dt` | correct; none |
| §9.4 Lyapunov, F_C, g | y²≥2; F_C′; g=2arctan e^{z−C} | `max_u(2yu+(1−y²)u²)=y²/(y²−1)≤2`; `F_C′=2cosh w/(2cosh w−sinh w)∈(2/3,2)`; `g′=sech=sin g` | correct; none |
| §9.4a Bessel | d=3 kernel; E_r[1/R_t]; sphere d=2,3 | `I_{1/2}=√(2/πz)sinh z` gives `(y/r)√(2/πt)e^{−(r²+y²)/2t}sinh(ry/t)`; `(2Φ(r/√t)−1)/r<1/r`; `2πI₀(z)`, `4π sinh z/z` | correct; none |
| §10.2 pseudoinverse | diag(2,0); 0; invertible | `diag(½,0)`, projections `diag(1,0)`; 0; `A⁻¹` | correct; none |
| `feynmanKac_scalar` | b=0,σ=1,q=½,u=sin; T=0 | residual `−½sin+½sin=0`; `E[e^{T/2}sin(x+B_T)]=sin x`; reversed sign `e^{−T}sin x`; both sides u(0,x) | sign pinned; none |
| §4.2 polynomial estimates | s=1,t=2; partition 0,1,2,3; uniform grid | `4s(t−s)+3(t−s)²=7`; `E R_π²=9+2=11`; step error `Σ(2t_id_i²+d_i³)=n²Δ³=T³/n` | correct; none |
| §3.5 overshooting sums | M=1_{[s₀,∞)}, X≡1 | error 1 on `[s₀−2⁻ⁿ,s₀)` for every n | not uniform, as stated; none |
| §2.3 doubling, ruin | fair signs; p≠q | `E[W_n1_{τ>n}]=2⁻ⁿ−1→−1`; `((q/p)^s−1)/((q/p)^{r+s}−1)` | correct; none |
| §1.5 Donsker | σ=0; fourth-moment bound | law δ₀; K–U with p=4,q=2,t=1 gives Hölder `<1/4` | correct; none |

## Not verifiable

- **Karatzas–Shreve** (§§1.5, 2.7.A, 2.8, 2.9, 3.2.D, 3.3, 3.4, 3.5, 5.2, 5.3, 5.4, Theorem 5.7.6), **Revuz–Yor** (IV §1, IV.1.8, IV §4, V §1, VI §1, VII §1, VIII §1, XI §1), **Protter** (I §§3–4, II §§6–7, III, IV §6 Theorems 64–65, V §5), **Kunita**, **Kloeden–Platen** §14.5 and **Chung–Rao 1981**: paywalled, settled as uncertified in the manifest; cited by locator only, no statement checked. The locator suggestions in R01 into these texts are from memory of their tables of contents and are marked uncertified.
- **MATH5695**: waived by the manifest; its page citations (pp. 1, 17, 101, 173, 178, 185, 218, 235, 247, 261–263, the corrections table and Theorem 6.2.3) are not checked.
- **DLMF 10.25.1**: the cache (`dlmf10`) holds §10.29 only; a fetch of the §10.25 landing page into a scratch manifest was refused by the sources service (host in no licence class). The equation cited is the modified Bessel equation `z²w″+zw′−(z²+ν²)w=0`, which §9.4a states correctly, but its number is not verified against the text.
- **Mörters–Peres printed pages**: I checked statements at the cache lines above; the printed-page numbers rely on the previous review's PDF-to-printed offset of 10.

## Source issues

- none
