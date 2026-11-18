# Review of MultiArmedBandits (pull request #2493 at 47eba90)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: `Policy.PlaysIn` constrains a policy at every history, including those it never reaches, so `IsETC` is false for the explore-then-commit policy of the cited source as one would write it, the second Check of 3.1 is false as stated, and no target lets `etc_regret_le` be transferred to such a policy. Every other statement, Check value and locator that could be opened was recomputed or read and holds. There are no small corrections and one format note; two questions are left for a human (the comparison with the LML library, and one paywalled source).

## R01 (P2) — `IsETC` asks for the exploration rule at histories the policy never reaches, so the second Check of 3.1 is false and `etc_regret_le` does not cover the cyclic policy it is said to generalise

`Policy.PlaysIn` (1.1, README line 180; `Suggested.lean` line 61) requires `π.next n (frestrictLe n ω) (S (n + 1) ω) = 1` for every `ω`, not for almost every one. An implementer who encodes Algorithm 1 of Lattimore and Szepesvári in the obvious way, with exploration kernels that ignore the history, therefore gets a policy to which `etc_regret_le` does not apply, although 3.1 (line 503) presents the theorem as that result "for `c = 1`, exploration in cyclic order" extended to a variance proxy and any order.

The computation, on the policy of the second Check of 3.1 (line 511: "playing arm `0`, then arm `1`, then for ever the arm with the larger first reward: `IsETC 1` holds"). Take `first = dirac 0` and `next 0` constant equal to `dirac 1`. For a trajectory `ω` with `A_0 = 1`, `pullCount 1 1 ω = 1` and `pullCount 0 1 ω = 0`, so the set of 3.1 with `m = 1` is `S 1 ω = {0}` (the second disjunct needs every arm played), and `next 0 (frestrictLe 0 ω) {0} = dirac 1 {0} = 0 ≠ 1`. So `IsETC 1` fails, although `A_0 = 1` has probability `0`. Likewise "the arm with the larger first reward" is not defined at a history in which one arm was never played, and `IsETC 1` constrains the kernel there too. The Check is true only for an encoding that follows the rule off its own path (in round `1` the arm not played in round `0`), which the text does not say. The existence argument of 3.1 is unaffected: the policy that plays the first arm of `S t ω` obeys the rule at every history. `IsUCB` and `IsExp3` are defined by a rule on all histories and have no such gap.

Smallest change, in three places. (a) In 1.1, say in one sentence that `Policy.PlaysIn` constrains the kernels at every history, reachable or not, and add the target that closes the gap: if `π.first = π'.first` and, for every `n`, `π.next n h = π'.next n h` for almost every history `h` under the law of the history through round `n` of `envLaw ρ π`, then `envLaw ρ π = envLaw ρ π'` (it follows from the uniqueness item, since the composition product sees a kernel only almost everywhere). (b) Reword the second Check of 3.1 so that it is true: for example "arm `0` in round `0`, in round `1` the arm not played in round `0`, then an arm of largest `prefixSum · 1 t ω`, at every history", and add the negative control that the history-independent version (`next 0` constant `dirac 1`) is not `IsETC 1` but has the same law as one that is. (c) In the source sentence of 3.1, say that the cyclic policy of the source is covered through (a).

## N01 — The Provenance section names the roadmap's author

"by the author of this roadmap" (README line 952) is authorship narrative in a text meant to be timeless; the repository can be named without it.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `ae_forall_mem_of_playsIn` | countable ι; ι = ℝ; two arms, trivial σ-algebra | countable: bad event ⊆ {next{A}=0}, null. ℝ: first(S)=1, A_0∉S always. Trivial: outer measure of {0} is 1 | true; both hypotheses needed | none |
| 1.1 `PlaysIn` Checks | S=univ, {a}, ∅; deterministic switch policy | univ: all; {a}: only constant policy; ∅: first ∅ = 0; trajectory (1,0),(0,1),(0,1) | Checks true | none |
| 1.2 `pullCount`, `empMean` | arms (0,1,0,0), rewards (2,5,4) | counts 2,1 at t=3; 3,1 at t=4; empMean 3, 5, 2; unplayed 0 | Checks true | none |
| 1.3 decomposition | n=0; one arm; Cauchy arm | n=0: 0=0. Cauchy: left n, right 1, differ for n≥2 | true; finite means needed | none |
| 2.1 weighted noise | Check 2 enumeration, n=6, c=0.7 | E exp S=1.8743, E exp(−S)=1.8526 ≤ 2.0138; two-arm weight 2.9612 ≤ 4.0552; sign weight 2.3086 > 1.4191 | true; Checks true | none |
| 2.2 union bound | c>0, L≥0; L<0; c=0; n=0; Gaussian one round | ε=√(2cLm) gives exp(−L) per m; n=0 event empty; Φ(−√2)=0.0786 ≤ 0.3679 | true | none |
| 2.2 `prefixSum` | arms (0,1,0,0), rewards (2,5,4,7) | (m=2)→6, (m=1)→2, with ≤ 13, (m=5)→13, arm 1 → 5 | Checks true | none |
| 3.1 `etc_regret_le` | m=0; c=0; n<mK; Dirac pair; Gaussian (0.5,0) | m=0: nΣΔ. c=0: exp(0)=1, bound n−m ≥ m. n=1,K=2: regret 1 > 1−exp(−1/4c). Bound 35.42; exact regret 12.16 | true; mK≤n needed | none |
| 3.1 `IsETC`, second Check | first=dirac 0, next 0 ≡ dirac 1, ω with A_0=1 | S 1 ω={0}, kernel mass of {0} is 0 | Check false as written | R01 |
| 3.1 constant 4 | Gaussian gap 4, m=1 | Φ(−4/√2)=0.00234, exp(−8)=0.00034, exp(−4)=0.0183 | Check true | none |
| 3.2 `ucb_regret_le` | n=0,1; c=0; rescaling by √c; (0.5,0), n=1000 | n≤1: log=0, bound 3ΣΔ ≥ maxΔ. u≥16c log n/Δ² gives √(2cL/u)≤Δ/2, tail ≤1/n². Bound 222.55 | true | none |
| 3.2 no-bonus Check | Bernoulli ½ vs dirac ¼, n=2000 | regret ≥ 249.75 > 122.36 | Check true | none |
| 3.3 `ucb_regret_le_sqrt` | Δ=4√(cK log n/n); K=2, n=1000 | nΔ = 16cK log n/Δ = 4√(cKn log n); 940.3, 2210.6, 941.8 | true | none |
| 4.1 divergence decomposition | n=0; unplayed arm with ∞; stopping policy n=2 | 0=0; 0·∞=0; (3/2)·0.14384=0.21576 = direct sum; under ν′ 0.25172 | true in ℝ≥0∞ | none |
| 4.1 two-bandit inequality | Dirac 0 vs Dirac 1 | P A + P′ Aᶜ = 0, D=∞ | finiteness needed, stated | none |
| 4.2 minimax bound | K=1; v=0; K=731, n=1; constant | D ≤ ½; exp(−½)/16=0.03791 ≥ 0.03704; √730/27=1.0007 > 1 | true; K≤n+1 needed | none |
| 4.3 `lai_robbins` | r≤0; K=1; kl=∞ pair; Cauchy Q; Gaussian; Bernoulli | contradiction needs p<1−rk; Dirac and Cauchy examples give count 1; 2v/Δ²=8; kl 0.13081, 1/kl 7.645 | true; hQ, hkl needed | none |
| 5.1 `advRegret` | alternating table; rotating policy | max of sums 1, not 2; K=2: 5; K=5: 8 | Checks true | none |
| 5.2 estimator | probabilities (0.2,0.5,0.3), rewards (0.3,0.9,0); η=1 | increments −2.5, 0.8, −2.333; averages 0.3, 0.9, 0; 1/(1+e²)=0.1192 | unbiased; Checks true | none |
| 5.3 `exp3_advRegret_le` | exact enumeration K=2, n=1,2,3,6; η=1,n=2; x=(4,0); η=0 | 0.5000, 0.8678, 1.1912, 1.9916 vs 1.6651, 2.3548, 2.8841, 4.0787; 0.8096 ≤ 2.693; 2 > 1.693 | true; η>0, range needed | none |
| 5.3 `exp3_advRegret_le_sqrt` | n=0; K=1; tuned η | η=0, both sides 0; log K/η = ηnK/2 = √(nK log K/2) | true | none |

- Source locators checked against the text: 31 in LattimoreSzepesvari2020 (among them lines 2774, 2846, 2921, 2937, 3523, 4154, 4626, 4701, 4862, 4934, 7068, 7194, 7234, 7268, 7482, 7503, 7552, 9147, 9524, 9619, 9912, 9934, 12402), 4 in BubeckCesaBianchi2012 (lines 1014, 1021, 1031, 1579), 3 in GarivierMenardStoltz2019 (lines 392, 543, 550); all support the statements as cited.
- Library declarations opened at the pins: 28, all present with the stated hypotheses, among them `Kernel.trajMeasure` (`Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean` 763), `condDistrib_trajMeasure` (785), `HasSubgaussianMGF.measure_ge_le` (`Mathlib/Probability/Moments/SubGaussian.lean` 696), `sum_of_hasCondSubgaussianMGF` (895, constant parameters as the README says), `hasSubgaussianMGF_of_mem_Icc` (851), `klDiv_map_le` (`Mathlib/InformationTheory/KullbackLeibler/DataProcessing.lean` 159), `TauCeti.klDiv_compProd_right` and `klDiv_compProd_eq_add_lintegral` (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean` 125, 150).
- Cross-roadmap citations resolved on main: MathematicalStatisticsNonparametric 1.3 (`klDiv_gaussianReal`, `v ≠ 0`) and 1.4 (`half_exp_neg_klDiv_le`), MathematicalStatisticsFoundations 9.2; all three state what is cited.
- Duplication: no bandit, pull-count or regret object in the pinned Mathlib or Tau Ceti; no other roadmap, open or on main, states one.
- Overlap check: read MarkovDecisionProcesses, RegretMinimizationAndEquilibria, DenoisingDiffusion, FirstOrderOptimization, HiddenMarkovModels, RandomizedSmoothing; nothing shared (MarkovDecisionProcesses owns trajectory laws of controlled chains on states and actions, RegretMinimizationAndEquilibria excludes bandit feedback).
- Dependency check output: `depcheck: 217 roadmaps, 2335 edges, 0 problem(s)`; both supplier roadmaps are on main.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (12 theorems). One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 12 closes. All 33 elaborated signatures compared with the README: the binders flagged as dropped are `[MeasurableSpace ι]` and `[MeasurableSingletonClass ι]` on six definitions that do not use them; no statement lost a hypothesis.
- All automatic checks passed on this head.

Source independence: 38 passages compared with 3 sources, none shared; largest share LattimoreSzepesvari2020, 16 of 25 source mentions; contents compared with LattimoreSzepesvari2020: independent (Layer 2 is a martingale bound that is not the source's Chapter 5, Layer 4 precedes Layer 5 against Chapters 11 and 15–16, and the order 1, 2, 3 is forced by the *Needs:* lines of 2.1, 2.2, 3.1 and 3.2). AuerCesaBianchiFischer2002 could not be read.

Research link: The headline targets are the regret bounds of Auer, Cesa-Bianchi and Fischer 2002 (UCB), the Exp3 bound as in Bubeck and Cesa-Bianchi 2012, and the Lai–Robbins bound in the form of Garivier, Ménard and Stoltz 2019, as presented in Lattimore and Szepesvári 2020; this rests on the README's references and the three texts read.

## Not verifiable

- Auer, Cesa-Bianchi and Fischer 2002, Theorem 1 (cited in 3.2 for the original bound): the DOI resolves only to a paywalled page; the description of its hypotheses was not checked.
- The simulated values (3.2: regret about `31.5` and the per-arm bound over `c ∈ {1/4, 1, 4}`; 4.2: about `2.3`) and the ratio `0.426` over twelve reward tables in 5.3 were not recomputed; the tables and seeds are not given.
- The LML library named under Coordination was not opened, so the Lean declarations were not compared with it.

## Source issues

- none

## For the human reviewers

- **Licence.** README lines 936–951 name the LML library (Apache-2.0) as prior work on Layers 1 to 3 and 4.1; `TauCetiRoadmap/MultiArmedBandits/Suggested.lean` was not compared with it, and names such as `pullCount`, `empMean`, `regret` could coincide.
- **Not tested.** AuerCesaBianchiFischer2002 is paywalled; it is cited once (3.2) and no statement depends on it.
- **Licence.** LattimoreSzepesvari2020 was read in the authors' online edition on an author's page; the README cites that edition's numbering.
