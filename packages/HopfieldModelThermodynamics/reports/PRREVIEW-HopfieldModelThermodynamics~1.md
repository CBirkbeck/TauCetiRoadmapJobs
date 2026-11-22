# Review of HopfieldModelThermodynamics (pull request #3007 at e04586d)

**Verdict:** needs changes

**Summary.** Changes are needed for one sentence: the random-pattern Example of Layer 2 asserts a limit that is false when `P = 0` and `β > 1`, a case the roadmap's own conventions include; adding `P ≥ 1` repairs it. The ten stated theorems, their routes and every Check were recomputed and stand, and all source locators were confirmed in the texts. There is one small correction (a claim about Mathlib's metric on `ι → Bool`) and no format note. Two facts are left for the human reviewers.

## R01 (P2) — The random-pattern Example of Layer 2 is false for `P = 0` and `β > 1`

The Example (README line 292–296) says that for independent uniform columns on `{±1}^P`, "2.1 and 2.2 give `(1/N) log Z_N → pressure β 0` for every `β ≥ 0`", with no restriction on `P`. The roadmap counts `P = 0` as a case of its statements (1.1 says "`N = 0` and `P = 0` included", and the last Check of 2.2 says `1 ≤ P` is needed), so a reader takes the Example to cover it, and there it fails.

For `P = 0` the overlap space is a point, `hopfieldPartition ξ β = Σ_x exp(0) = 2^N`, and `(1/N) log Z_N = log 2` for every `N ≥ 1`. But `pressure β 0 = max_m (βm²/2 + binEntropy((1 + m)/2))` exceeds `log 2` when `β > 1`: the second derivative of the bracket at `m = 0` is `β − 1 > 0` (numerically, `pressure 1.5 0 = 0.8083 > 0.6931`). The step that breaks is the appeal to the Mattis theorem of 2.2, which carries `P ≥ 1`. For `0 ≤ β ≤ 1` both sides are `log 2` and the sentence holds for every `P`.

The smallest repair is to add `P ≥ 1` to the Example ("if `P ≥ 1` and the columns …"). The Example of Layer 4 ("for uniform patterns mixing is exponentially slow for `β > 1`") has the same omission, though its `1/P` already signals `P ≥ 1`; the same two words would settle it.

## C01 — Pinned Mathlib has no metric at all on `ι → Bool`, so it is not "the supremum metric"

The parenthesis on the alternative route of 4.2 (README line 489–490) says "on plain functions `ι → Bool` Mathlib's metric is the supremum metric, not the Hamming distance". At the pin `Bool` has a `UniformSpace` instance (`Mathlib/Topology/UniformSpace/Basic.lean:745`) but no `Dist` or `MetricSpace` instance, so `ι → Bool` carries no metric and the `[MetricSpace S]` binder of MarkovChainMixing 4.2 `tvToStationary_le_pow_mul_diam` cannot be filled there at all. The conclusion the sentence draws is unaffected: the path-coupling route must run on `Hamming`, whose metric is at `Mathlib/InformationTheory/Hamming.lean:352–392`. Would read correctly as "plain functions `ι → Bool` carry no metric in Mathlib; the Hamming metric lives on the type synonym `Hamming`".

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 total weight | `N=2,P=1,ξ=(1,1)`; `P=0`; `N=0`; `β=−1` | `√(2π)(2e^β+2)` both sides; `2^N=2^N`; `(2π)^{P/2}·1` both; `β<0`: `(2π)^{P/2}2^N ≠ Z` | holds for `β≥0`; hypothesis needed |
| 1.1 energy identity and law | `N=2,P=1` at `σ=(1,1)` | `hopfieldEnergy=−1=PN/2−½·2²`; `−(β/N)E=βN‖m‖²/2−βP/2` | Gibbs law `∝ exp(βN‖m‖²/2)` |
| 1.1 conditional kernels | `N=1,P=1` | `P(σ=1∣z)=e^{√βz}/(2cosh√βz)=(1+tanh√βz)/2`; mean `√(β/N)Σξσ=√(βN)m` | matches `visibleKernel`, `hiddenKernel`; density jointly measurable, so `Kernel.withDensity` is not the zero kernel |
| 2.1 lower bound | `N=1,P=1`; `N=0`; `β=−1` | `log2+logcosh(βm)−βm²/2 ≤ log2+β/2`; `N=0`: `0 < log 2`; `β=−1`: `log2−½ < log2` | holds; `N≥1`, `β≥0` needed |
| 2.1 upper bound | `N=1,P=1,m=1`; `N=0` (Lean has no `Nonempty`) | `β ≤ log(e^β+e^{−β})`; `N=0`: `0 ≤ log 2` at `m=0` | holds for all real `β`, all `N` |
| 2.1 limit | `β=0`; `P=1,β=−1`; `P=0` | `log 2` both; `β<0`: `⨆=0` junk vs `≥ log2−½>0`; `P=0`: `log 2` both | holds for `β≥0` |
| 2.2 Curie–Weiss bound | `P=0` with any `λ`; two equal patterns; `β=0` | `log2 ≤ pressure(βλ)0`; `λ=2`, `supΦ=pressure(2β)0`; `Φ≡log 2` | holds; `λ≥1` forced when `P≥1` (trace of covariance is `P`) |
| 2.2 Mattis states | `P=2,β=1.5` grid; `P=1`; `P=0`; `β=0` | grid max `0.80834` at `(0.86,0)`; `m*=0.8586`, `Φ(m*,0)=pressure=0.808341`; `P=0`: iff fails; `β=0`: every point maximises | holds for `P≥1`, `β>1`; both needed |
| 2.2 mixed-state Check | Taylor coefficients | `2·4^k` vs `8^k`: equal for `k≤1`, smaller for `k≥2` | Check true |
| 3.1 rate and LDP | `P=1`; `β=0`; off `Z_ν` | `Λ*=log2−binEntropy`, rate `=freeEnergy β m+pressure β 0`; `β=0`: `Λ*`; off `Z_ν`: `⊤−r+finite=⊤` | Gärtner–Ellis hypotheses hold (frontier of `univ` empty); tilt by `(β/2)min(‖m‖²,P)` |
| 3.2 zeros and concentration | `P=1,β=2`; `β=0`; `P=0` | zeros `±m*(2)`; `β=0`: zeros `{0}` vs all points; `P=0`: point both sides | holds for `β>0`; needed |
| 4.1 slow mixing | `P=1`; `P=0`; `β=0`; other Mattis states vs `closure U` | `dist(m*e₀,Uᶜ)=m*/√2` (`m*` if `P=1`); `m₀=0<m*` excludes `±m*e_ν`; `d(t)≥½−te^{−cN/2}` | route sound; `P≥1`, `β>1` needed |
| 4.2 fast mixing | `N=2`, `tanh βa=½`, exact rationals; 512 random real `J`, `β∈[−1.5,1.5]`, `N≤4`; `N=1`; `N=0` | `d(0)=7/8`, `d(t)=½(¾)^t`, `t_mix(¼)=3≤9`; max of `d(t)−N(1−c/N)^t` is `0`; `N=0`: `½>0` | holds; `Nonempty` needed |
| 4.2 Hebbian clause | `P=0`; `P=1` | `(N−1)tanh(∣β∣P/N) ≤ ∣β∣P`; `P=0`: `c=1` | holds |
| Layer 2 Example (R01) | `P=0,β=1.5` | `log 2=0.6931` vs `pressure 1.5 0=0.8083` | false at `P=0,β>1` |
| 4.2 parenthesis (C01) | pinned Mathlib | no `Dist Bool`; `UniformSpace Bool` only | claim inaccurate |

- Source locators checked against the text: 14 (BBSC lines 129–180 and 258–305; BovierGayrard lines 139–142, 704–724, 1424–1432, 1587–1602, 1689–1727; LPW lines 10897–10912 and 11010–11015), all confirmed at the stated printed pages.
- Library declarations opened at the pin: 17 in Mathlib (among them `tvDist`, `MeasureTheory/Measure/TotalVariation/Defs.lean:62`, which is the variation of `μ − ν`, so `tvDist/2` is the usual distance; `Kernel.withDensity`, `Probability/Kernel/WithDensity.lean:48`; `IsReversible.invariant`, `Probability/Kernel/Invariance.lean:63`; `integral_cexp_quadratic`, `Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:174`) and 3 in Tau Ceti (`TauCeti/Analysis/Convex/Conjugate.lean:119, 132, 143`).
- Cross-roadmap citations resolved at the suppliers' heads or on main: all 14 copied definitions agree character for character with their owners; the 12 cited supplier theorems exist with the hypotheses the contracts state (LargeDeviations 1.2, 2.4, 5.3; CurieWeissModel 2.1, 2.2; MarkovChainMixing 1.3, 3.1, 4.1, 4.2, 6.1; GlauberDynamicsOfTheIsingModel 3.1, 3.2).
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line. No file outside the folder is changed.
- Elaboration: `Suggested.lean` elaborates with `sorry` the only warning; all 38 elaborated types compared with the README statements, no hypothesis lost on a theorem (the binders dropped on five copied definitions are unused by their types). One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`): none of the 10 theorems closes.
- Headline theorems: all 7 targets (10 theorems) are stated; no padding found.

Overlap check: read CurieWeissModel, GlauberDynamicsOfTheIsingModel, HopfieldNetworks, LargeDeviations, RestrictedBoltzmannMachines; the one-pattern model is owned by CurieWeissModel (cited through the gauge, not restated); fast mixing on graphs is owned by GlauberDynamicsOfTheIsingModel 3.1 (4.2 here is the real-coupling generalisation and recovers it as a Check); Gaussian hidden units are outside RestrictedBoltzmannMachines' scope and owned here; nothing else shared.

Source independence: 10 passages compared with 3 sources, none shared; largest share BovierGayrard, 6 of 12 locator groups; contents compared with BovierGayrard (sections 1–8): independent, the layers do not follow its sections.

Research link: Layers 1–3 give, for a fixed number of patterns and deterministic column laws, the free energy and overlap large deviations that Bovier–Gayrard (1996) treat for random patterns; Layer 4 extends Levin–Peres (2017) Theorems 15.1 and 15.4 from graphs to Hebbian couplings. Rests on the README's citations and the three texts read.

## Not verifiable

- nothing: all three cited texts were read at their locators.

## Source issues

- none

## For the human reviewers

- **Scope.** By the description's own account, the routes of 2.1, 2.2, 3.1, 3.2, 4.1 (for `P ≥ 2`) and 4.2 (real couplings) are the author's proofs, not found in the cited sources in this form; this review rechecked each by hand and numerically.
- **Licence.** LPW was read from the copy on David Levin's own page (pages.uoregon.edu), an author's page; the README cites it as "the edition made available by the authors".
