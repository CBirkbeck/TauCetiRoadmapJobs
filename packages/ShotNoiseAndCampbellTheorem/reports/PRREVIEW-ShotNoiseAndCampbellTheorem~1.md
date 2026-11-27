# Review of ShotNoiseAndCampbellTheorem (pull request #3204 at 313730a)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed on degenerate and two-term instances (the table below), the ten Last–Penrose locators and the Popov locator were read at their pages, every cited library declaration was opened at the pins, and none of the ten theorems closes by one tactic. There are no small corrections and three format notes, none blocking. Two points are left for the human reviewers: the relation to the open PointProcesses roadmap, and the status of the two sources.

## N01 — The Scope paragraph on PointProcesses describes the state of the repository

In Scope and ownership (line 441), "PointProcesses (an open roadmap, not on main)" will be out of date once that state changes, and a reader a year on cannot tell what it referred to. Would read as well without the parenthesis: the paragraph already says which statements differ and that nothing is consumed from it.

## N02 — "Proved here" is explained only in the pull request description

"(Proved here.)" at 1.5, 2.3, 3.2 and "proved here" in 1.3, 3.1, 4.1 mean that the route is written out in this README, not that a proof exists; the README never says so. One clause at the first use (the window formula of 1.3, line 107) would do, or "route written out here".

## N03 — Scope does not name the owner of the homogeneous Poisson counting process

Scope names MarkovChainsAndRenewal Layer 7 for the half-line process; that layer itself rests on StochasticCalculus §0.6, which owns the counting process, its jump times and exponential waiting times. A reader placing the right-hand half of the model would look for it. A clause after the Layer 7 sentence (line 437) would suffice; nothing is consumed from either.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `IsMarkedPoissonInput` | rate 0; P not a probability measure; ν of mass 2 | `expMeasure 0` has density `0¹/Γ(1)·x⁰·e⁰ = 0`, so map is 0 but `iIndepFun` gives P(Ω)=1; mass: 1 = 1·ν(E) | rate>0, P and ν probability forced, as Convention 2 says | none |
| 1.1 `twoSidedPoint` | n = 0; wrong variant `arrival n` | τ(inl 0)=G(inl 0) (`arrival 1`); variant gives τ(inl 0)=0=τ(inr 0), an atom at 0 | Erlang-sum Check: Σ_{n≥1} λⁿs^{n−1}e^{−λs}/(n−1)! = λ excludes the variant | none |
| 1.2 Campbell | f = 1_{(a,b]×E}; f = ∞·1_B; f supported at s = 0 | λ(b−a) both sides; ∞ = ∞ when Leb⊗ν(B)>0; 0 = 0 | holds | none |
| 1.3 Laplace | f = θ1_{(a,b]}; θ = ∞; f ≡ ∞; f ≡ 0 | exp(−λ(b−a)(1−e^{−θ})); e^{−λ(b−a)}; 0 = exp(−∞) = 0; 1 = 1 | holds, no 0·∞ since rate>0 | none |
| 1.3 window formula | φ ≡ 1; φ = 0 on window; k-th term | 1 = e⁰; e^{−2λL} = P(no point in [−L,L]); e^{−λL}(λ∫₀ᴸψ)^k/k!, sums to exp(λ∫(ψ−1)) | holds | none |
| 1.4 dichotomy | 1/(1+\|s\|); \|s\|^{−1/2}1_{(0,1)}; f ≡ 0; both directions | ∫min = ∞, Σf̃ = ∞ a.s. via E e^{−Σf̃} = 0; ∫min = 1 finite; 0 < ∞ summable | holds both ways | none |
| 1.5 characteristic functional | f = 2π on [0,∞), 1 on [−1,0); f = u·1_{(0,1]} | first: RHS modulus e^{−λ(1−cos 1)} < 1, LHS 1 (tsum junk 0): hypothesis needed; second: exp(λ(e^{iu}−1)) both | holds under ∫min<∞ | none |
| 2.1 mean | g = 1_{[0,a)}; g = 1/s on (0,1); g only a.e.-measurable | λa; ∫min = 1 but EX = ∞; null set N gets E#points = λ·0 = 0 | holds; integrability needed | none |
| 2.2 covariance | 1_{[0,a)}; e^{−s}1_{s≥0}; 1_{[0,1)}−1_{[1,2)} at τ=1; 1/(1+\|s\|) | λ(a−\|τ\|)⁺; λe^{−\|τ\|}/2; ∫g(s)g(s+1) = −1 so −λ, variance 2λ; LHS 0 vs λ∫g² = 2λ | holds; sign of the shift s+τ agrees README/Lean | none |
| 2.3 cumulants | 1_{[0,a)}; e^{−s}; s^{−1/2}1_{(0,1)}; 1/(1+\|s\|) | λa(e^θ−1); ∫e^{−ns} = 1/n; ∫₁^∞ e^{θu}2u^{−3}du = ∞ so cgf junk 0, left slope 2λ; cgf ≡ 0 vs 2λ | holds; both hypotheses needed | none |
| 3.1 stationarity | ∫min(\|g\|,1) = ∞; g = 1_{[0,1)}; bound on F_s | all X(t) = 0 a.s., both laws δ₀; char. function exp(λ∫(e^{iF_s}−1)) shift-free; min(\|Σu_jg_j\|,1) ≤ Σmax(\|u_j\|,1)min(\|g_j\|,1) | holds | none |
| 3.2 Gaussian limit | 1_{[0,1)} one time; e^{−s}; 1/(1+\|s\|); s^{−1/2}1_{(0,1)} | e^{−u²/2}; C(τ) = e^{−\|τ\|}/2; LHS 1 vs e^{−u²} (C(0)=2); exponent 2u²∫_{u/√λ}^∞(e^{iy}−1−iy)y^{−3}dy, real part → −∞ | holds; ∫F² = Σu_ju_lC(t_l−t_j) matches Lean index order | none |
| 4.1 queue | ν = δ_d; ν = δ₀; exponential(μ); mean ∞ | Leb⊗ν(B) = d, Poisson(λd); Q ≡ 0 = Poisson(0) = δ₀; λ/μ; E e^{−θQ} = 0 so Q = ∞ a.s. | holds; `toNNReal` only used when mean finite | none |
| 4.1 Check, covariance | g = 1{0≤s<x}, exponential service | ∫g(s,x)g(s+τ,x)ds = (x−\|τ\|)⁺; E(M−τ)⁺ = e^{−μτ}/μ | (λ/μ)e^{−μ\|τ\|} as stated | none |
| Convention 4, tsum junk | non-summable family | Σ' = 0, used consistently in 1.5, 2.2, 2.3, 3.2 Checks | consistent | none |

- Source locators checked against the text: 11 (Last–Penrose Prop. 2.7, Thms 3.3, 3.9, 5.6, 7.2, Prop. 12.1, Lemma 12.2, (15.18)–(15.20) with Prop. 15.13, Example 15.14, Exercise 15.10: printed page = PDF page − 12, all as cited; Popov p. 3, mean λE(S∧t)); also the Campbell 1909 reference.
- Library declarations opened at the pins: 20 (`arrival` Renewal/Basic.lean:84; `hasLaw_arrival_gammaMeasure` Renewal/Exponential.lean:78; `ae_tendsto_arrival_atTop_of_expMeasure` :65; `expMeasure` Exponential.lean:94; `gammaMeasure` Gamma.lean:128; `poissonMeasure` Poisson/Basic.lean:40; `iIndepFun_iff_map_fun_eq_pi_map` Independence/Basic.lean:866; `iIndepSets.isProbabilityMeasure` :168; `lintegral_tsum` Lebesgue/Add.lean:362; `Measurable.tsum`, `summable_abs_iff`, `covariance` Covariance.lean:44, `mgf`/`cgf` Moments/Basic.lean:122/126, `EReal.exp` ERealExp.lean:39, `tendsto_Lp_finite_of_tendsto_ae` UniformIntegrable.lean:457, `hasDerivAt_integral_of_dominated_loc_of_deriv_le` ParametricIntegral.lean:569, `Measure.ext_of_charFun` CharacteristicFunction/Basic.lean:257, cylinders Cylinders.lean:335/366, dominated convergence :58).
- Cross-roadmap citations resolved: 3 (MarkovChainsAndRenewal Layer 7 and 7.1 on main; InfinitelyDivisibleLawsAndTriangularArrays on main; PointProcesses Layers 4, 6, 9 at its open head).
- Duplication by object: no Poisson point process, Campbell formula or shot noise in the pinned Mathlib or Tau Ceti; Tau Ceti has only the one-sided Poisson count (`hasLaw_renewalCountNat_poissonMeasure`), cited in Scope.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning; `#check @name` types compared with the README for all 15 declarations, no hypothesis lost (the binders dropped from the four definitions are measurable-space instances their types do not mention).
- One-tactic probe: `simp` and `rfl` fail on all 10 theorems.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no change outside the folder.
- Headline theorems (1.2–1.5, 2.1–2.3, 3.1, 3.2, 4.1): all ten stated in `Suggested.lean`; none unstatable.

Overlap check: read PointProcesses, QueueingModels, RandomTelegraphProcess, RuinTheory, LevyProcesses (open), MarkovChainsAndRenewal, PopulationDynamics (main), and searched LocalLimitTheorems by object; shared: Poisson counts of half-line windows, owner MarkovChainsAndRenewal 7.1 (here only an Example citing it); the Poisson counting process, owner StochasticCalculus §0.6 (not used); the infinite-server stationary Poisson law as a limit of Erlang laws, owner QueueingModels Layer 3 (a different statement, consistent with the Check of 4.1); Campbell and Laplace formulas for general Poisson random measures, PointProcesses Layer 4 (a different carrier; see the human reviewers' section).

Source independence: 16 passages compared with 2 sources, none shared; largest share Last–Penrose, 15 of 16 locators; contents compared with Last–Penrose: independent (Layer 1 draws on its Chapters 2, 3, 5, 7 and 12, Layer 2 on §15.4 and Chapter 12, Layers 3–4 are not in its contents).

Research link: Layers 1–2 are the line-and-marks case of the Poisson calculus of Last–Penrose (2017), Propositions 2.7, 12.1 and 15.13, going back to Campbell (1909); Layer 4 is the Poisson representation Popov (2024) uses to classify transience of M/G/∞ queues. Rests on the README's references and both texts as read.

## Not verifiable

- none

Automatic checks set aside as false positives: the scan for roadmap names the project's roadmaps never cite as suppliers flagged the Scope paragraph naming PointProcesses; the paragraph draws a boundary and says nothing is consumed from it, so it is no supplier citation.

## Source issues

- none

## For the human reviewers

- **Scope.** Targets 1.2 and 1.3 are the line-and-marks cases of formulas the open PointProcesses roadmap states for general Poisson random measures (README, Scope, lines 441–450); this roadmap states them for an explicit point sequence and consumes nothing from it.
- **Licence.** Last–Penrose is read in the authors' version of 21 August 2017 on an author's institutional page; its title page says commercial reproduction is prohibited. Only locators are used.
- **Scope.** Popov, arXiv:2406.03517v2, is cited as a preprint; the README gives no journal reference. It supports only the queue started empty; the stationary form 4.1 rests on the README's own route.
