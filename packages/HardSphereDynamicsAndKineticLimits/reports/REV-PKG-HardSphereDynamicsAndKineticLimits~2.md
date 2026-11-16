<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18031#issuecomment-6907607124 -->
Review (claude) of 87cad15

Verdict: accepted

No finding. The three findings of the first review are repaired, the repaired passages survive the
adversarial pass, the repaired patterns occur nowhere else in the package, the sampled locators hold,
the elaboration passes with `sorry` as the only warning, and the dependency check is clean. No
supplier gap is declared and none is needed.

Maintainer notes for this roadmap: none.

## Previous findings (REV-PKG-HardSphereDynamicsAndKineticLimits), one by one

- **F01 (P1), `weak_liouville` grouping — repaired.** `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean`
  line 329 now reads `(∫ t in Ioi (0 : ℝ), ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z) + ∫ Z, W₀ Z * φ 0 Z = 0`.
  `#check` prints `(∫ (t : ℝ) in Set.Ioi 0, ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z) + ∫ Z, W₀ Z * φ 0 Z = 0`:
  the second integral is outside the first. It agrees with README §8.2.
- **F02 (P3), unused hypotheses — repaired.** `flow_add` (line 288) and `flow_reversal` (line 307) have
  no `hε`, `hερ`; `grandCanonical_flow_invariant` (line 362) has no `IsFiniteMeasure` binder. README
  Conventions: "except these, which hold for every real ε: uniqueness of trajectories (§5.2), their
  time translation and time reversal (§5.3), the group law of the flow (§7.1) and its reversibility
  (§7.3)"; §7.1 "for every real ε, `T_{s+t} = T_s ∘ T_t`"; §7.3 "for every real ε, `T_t ∘ ℛ = ℛ ∘ T_{−t}`";
  §9.4 "on every flat position space ... when `μ_X(X) = ∞` and `μ c > 0` the partition function is
  infinite ... and the measure is zero". The new Checks (§7.1 fifth, §7.3 fifth, §9.4 third) are
  recomputed below.
- **F03 (P3), `empiricalFiniteMeasure` — repaired.** The Tau Ceti contract names
  `TauCeti.Probability.empiricalFiniteMeasure`, `card_smul_empiricalFiniteMeasure` and
  `empiricalMeasureOfFintype`; §10.1 states "For every `N ≥ 0` it is
  `π_t = μ^{−1} N · TauCeti.Probability.empiricalFiniteMeasure (T_t Z)`"; the §10.1 *Needs:* line and the
  Layer 10 Dependencies list the three names. Opened at the pin:
  `TauCeti/Probability/Process/EmpiricalMeasure.lean` lines 58 (zero for an empty family, by its
  docstring and body), 75 (`card κ • empiricalFiniteMeasure x = ∑ i, dirac (x i)`, no nonemptiness
  hypothesis) and 224.

**Repaired patterns in the rest of the package.**
(i) An integral body that absorbs a later term: read at the elaborated types of all 11 theorems; in
`lintegral_sum_distinct_eq_correlation` and `boltzmannGrad_scaling` the `∂grandCanonical …` closes the
integral before `=`, `∧`, `≤`; in the two law-of-large-numbers statements the integral is closed by
`|` or `)`; in `partitionFunction`, `correlation`, `collisionOperator`, `IsMildBoltzmannSolution`
and `LanfordStatement` it is the last factor or inside `fun`/parentheses. No other occurrence.
(ii) A hypothesis the truth does not use: no further instance shown; the theorems that keep
`0 < ε < ρ` need it for their statement (measurability of the flow, part of `MeasurePreserving`) or
their route (§6.4), as the repair report says; `hd` in `boltzmannGrad_scaling` is needed (row 12).
(iii) A library object restated: none (duplication audit below).

## Verified sound

**Principles.** One class `FlatPositionSpace` carries `E`, every flat torus and every `E/Γ`, so no
route-specific carrier; no existing roadmap re-planned; supply in one direction; no algorithm; no
sorry'd data (the six `FlatTorus` instances have proofs); no `set_option`; no `lemma`; header
`module`, `import Mathlib` (94 of the 227 `Suggested.lean` files on main open with `module`); no
`TauCeti.*` import, none needed.

**Elaboration.** `lake env lean` on `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean` from
the content checkout: exit 0, 11 warnings, all `declaration uses sorry` (lines 256, 268, 288, 295,
307, 319, 362, 384, 396, 448, 495).

**One-tactic probe, all 11 sorried theorems.** On scratch copies, each `sorry` replaced by
`first | (tac; done) | sorry` with a trace on failure, for `tac` = `simp`, `rfl`, `infer_instance`,
`exact?`: 11 of 11 fail each of the four. None restates a definition, mirrors a Check, computes a
small value or treats a boundary case. No padding.

**Signatures.** `#check @name` for all 31 named declarations in one scratch file (exit 0), each type
compared with its README statement; nothing changed and nothing to change. Every theorem carries
`[NormedAddCommGroup X] [ProperSpace X] [MeasureSpace X] [BorelSpace X] [FlatPositionSpace d X]`.
`hardCoreSet`, `partitionFunction`, `grandCanonicalDensity`, `grandCanonical` keep only
`[NormedAddCommGroup X]` (and `[MeasureSpace X]`), which is what §3.1 and §9.3 state ("for every real ε,
every `μ ≥ 0` and every `f⁰`"); the "lost binder" leads are false positives.

**Headline theorems** (README Summary) and their Lean statements: uniqueness of trajectories
(`IsTrajectory.eqOn`); Alexander's theorem (`volume_hardCoreSet_diff_goodSet`); the measure-preserving
group (`flow_add`, `measurePreserving_flow`) and reversibility (`flow_reversal`); the weak Liouville
equation (`weak_liouville`); invariance of the grand canonical ensemble
(`grandCanonical_flow_invariant`); correlation functions (`lintegral_sum_distinct_eq_correlation`);
Boltzmann–Grad scaling (`boltzmannGrad_scaling`); the law of large numbers
(`tendsto_empirical_of_correlation`, `LanfordStatement.tendsto_empirical`). Lanford's theorem is the
`Prop` `LanfordStatement`, as the module docstring says. No statable headline is absent and none
goes through a stand-in.

**Backticked names.** The 26 names of the citations lead are the declarations and class fields of
`Suggested.lean`; all are declared. 68 cited Mathlib names elaborated with `#check` in one scratch
file at the pin: all resolve (the three failures of that file are the non-names `MeasureSpace`
unqualified, the namespace `QuotientAddGroup`, and `Rt`). Tau Ceti names opened at the pin:
`multivariateGaussianPDFReal` (`Probability/Distributions/Gaussian/Density.lean` line 82),
`multivariateGaussian_eq_withDensity` (line 265, hypothesis `S.PosDef`), `StronglyContinuousGroup`
(`Analysis/Semigroups/Group/Basic.lean` line 74, fields `map_zero'`, `map_add'`, `continuousAt_zero'`
as the README states), `flowOfLipschitz` (`Dynamics/Flow/OfLipschitz.lean`), the three empirical
declarations (above). Every cited `Mathlib/…` and `TauCeti/…` file path exists at the pins.

**Adversarial table** (sampled targets, headlines, repaired passages). Values are mine.

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | §1.1 class, short lift; §1.2 | kernel element `k` with `│k│ < 2ρ`; `‖ξ‖ = ε ≥ ρ`; `E`, ρ = ∞ | `±k/2` in the ball with one image ⇒ `k = 0`, so systole ≥ 2ρ; a lift `a` in `B(0,ρ)` would give `‖ξ‖ ≤ │a│ < ρ`, so `ℓ(ξ) = 0`; `{‖ξ‖ = ε} = {dist(·, ker π) = ε}` for ε < ρ; `ℓ = id` | sound |
| 2 | §1.4 shell, packing | torus d=2, ε=0.4; d=1 shell 0.4–0.6 | `1/(0.04π) = 7.96` ⇒ 7 points; measure 0.2 vs formula 0.4 (ρ = 1/2 violated) | sound |
| 3 | §2.1 `scatter`, §2.2 | ν=(1,0), v=(0,0.9), w=(0.9,0); ν=(0.8,0.6); cross-section d=2,3 | `σ = ((0.9,0.9),(0,0))`; kernel `0.9 ↦ 0.9` under Θ; numeric `∫⟨e,ω⟩_+`: 2.0000 and 3.14159 = `ω₁│k│`, `ω₂│k│` | sound |
| 4 | §3.2 contacts, boundary pieces | torus ε=0.3, `π(0.1,0)`, `π(0.8,0)`; ordered vs unordered pair | difference `π(0.3,0)`, `ν=(1,0)`; `⟨v₁−v₂,ν₁₂⟩ = ⟨v₂−v₁,ν₂₁⟩ = 1` | sound |
| 5 | §4.2 two-body map, §4.3–4.4 | `a=(3,0.6),u=(−1,0)`; `a=(2,0)`; `a=(2.5,−0.3),u=(−0.9,0.2)` | `D=0.64, τ=2.2, q=(0.8,0.6), R_q u=(0.28,0.96)`; `B_3=((3,0),(1,0))`; finite-difference `det DC = 1.000000`, `det DB_s = 1.000000` at all three; `DC` rows `(−1,0,0,0),(0,−1,0,−2),(0,0,−1,0),(0,2,0,3)` | sound |
| 6 | `contactScatter` (Lean) is an involution at fixed positions | partner pair `i,j`; ε ≤ 0; ε ≥ ρ | `j`'s new velocity `v_j − ⟨v_j−v_i,ν_ji⟩ν_ji = v_j + ⟨v_i−v_j,ν⟩ν`, the second component of `σ_ν(v_i,v_j)`; normal `0⁻¹•ℓ = 0` resp. `ε⁻¹•0 = 0`, `scatter 0 = id` | sound |
| 7 | `IsTrajectory.eqOn`, every ε | forward at `t*`, backward at `t_*`, endpoint of `J` | (7) gives `σ_M Z(t*) = σ_M Z'(t*)` as two limits of one function along `𝓝[J∩Iio t*] t*` (non-trivial since `t₀ < t*`), then row 6; (3)+(6) fix the velocity on `(t*, t*+η)`; (2) fixes positions | sound |
| 8 | `flow_add`, every ε (repair) | ε=−1, d=1, `x=(1,0), v=(−1,0)`; circle ε=1/2, N=2; `Z ∉ G` | `T_3`: `(−2,0)` = `T_1T_2`; antipodal pairs, lift 0, (5) reads `0<0`, `G=∅`, `T_t = id`; all three maps fix `Z` | sound |
| 9 | `flow_reversal`, every ε (repair) | conditions (1)–(7) for `t ↦ ℛ(γ(−t))`; ε=−1, t=2; `Z ∉ G` | (5): `⟨−(v_i'−v_j'),ν⟩ = ⟨v_i−v_j,ν⟩ > 0`; (7): `σ_M(−σ_M V) = −V`; (6): left limit of γ is `σ_M γ`; both sides `(3,0;1,0)`; `ℛℛ = id` so `ℛZ ∉ G`, both sides `ℛZ` | sound |
| 10 | `weak_liouville` (repaired form) | N=0; `φ=χ(t)ψ(H)`; non-specular box (§8.2 fourth Check); integrability in `t` | `w∫φ' + wφ(0) = 0`; `(−χ(0)+χ(0))∫W⁰ψ = 0`; left side `∫W⁰(v₁−v₂) = −1 ≠ 0` so `hspec` is used; `Lφ(t,·)=0` for `│t│>T`, integrand bounded by `C‖W⁰‖₁ 1_{t≤T}` | sound |
| 11 | `grandCanonical_flow_invariant` (repair) | `X=E`, d=1, μ=c=β=1; μ=0; N=0 term | `N=1` term `√(2π)·∞`, `Z=∞`, density `x/∞=0`, zero measure; vacuum law; `Z ≥ 1` always (the `N=0` integral is 1), so `Z ∈ [1,∞]` | sound |
| 12 | `lintegral_sum_distinct_eq_correlation`, `boltzmannGrad_scaling` | μ=0, n≥1; n=0; `Z=∞`; d=3, ε=0.01; d=0 | both sides 0 (`0^n·…`, no embedding into `Fin 0`); both `h(∅)·`mass; all 0; `ω₃ε = 0.041888`; d=0 gives `E[N]=1/2 < 1−ε`, so `hd` is needed | sound |
| 13 | §8.3 marginals | torus N=2, `g̃(v)`; cut-off Gaussian | first marginal `g(z₁)(1−ω_dε^d)∫g̃`; `e^{−1.62} = 0.197899` vs 0 at `│(0.9,0.9)│ = 1.2728 > 1` | sound |
| 14 | §9.4 non-examples, §9.5 inversion | `r = 1+0.5cos 2πx`; Poisson ε=0 | `r(0)=1.5`, `r(−1/4)=1`; `μ^nΣ(−μ)^p/p!·f^{⊗n}m^p = μ^n f^{⊗n}e^{−μm} = W_n` | sound |
| 15 | §10.1 (repair), variance identity | N=0; N=2, μ=1 | `0·0 = 0 = Σ_∅`; `2·(δ_a+δ_b)/2`, mass 2; `E[π²] = μ⁻¹∫F₁h² + ∫F₂h⊗h` from the `n=1,2` cases of row 12 | sound |
| 16 | §10.3 `IsMildBoltzmannSolution` | `f=M`; d=1; wrong transport sign | `Q(M,M)=0`; `σ_{±1}(v,w)=(w,v)` so `Q≡0`; `0.5M(1)` vs required `1.5M(1)` at `(0,1)`, `t=1/4` | sound |
| 17 | §10.4 `LanfordStatement` | hypotheses vs BGSS2023 (1.1.5); a.e. clause; other structures on `𝕋^d` | the class with constant `C₀` lies in the class of (1.1.5) with `2C₀`; null sets along a sequence form a null union; `‖B‖≤1`, `│det B│=1` ⇒ `B` orthogonal, `ρ' ≤ 1/2` | sound |
| 18 | §10.5 both theorems | limit of the variance; `∫f⁰=0`; d=1; F₂→2f⊗f | `0 + m² − 2m² + m² = 0`, mass of `P_ε` is 1 since `1 ≤ Z ≤ e^{μ∫f⁰}`; vacuum, `f=0` a.e., event empty; `1−e⁻¹ = 0.632121`; variance → `m²` | sound |
| 19 | §6.3 constant, §7.4, §9.3, §9.5 numbers | — | `576π⁴ = 56107.6`; equally spaced triples at ε=1/3 on the circle (gaps in `[1/3,2/3]`, sum 1); `2e⁻² = 0.270671`; `0.8√(2π) = 2.00530` | sound |

**Sources: the seeded sample.** No locator was flagged as unverified by the author. All 15 sampled
targets read in the cached texts; every locator holds:
§1.1, §1.2 GST2013 lines 833–841, BGSS2023 line 119; §1.4 GST2013 line 873, BGSS2023 line 165; §2.1
GST2013 lines 843–847 and 1222–1227, BGSS2023 lines 125–131, DengHaniMa2024 lines 157–163; §2.2
GST2013 lines 394–400 (involution, line 400), 432–437 (unit Jacobians), 674 and 1264–1268 (kernel);
§3.2 BGSS2023 lines 148–152; §4.2 GST2013 lines 842–847, BGSS2023 lines 133–136; §4.4 GST2013 line
883, DengHaniMa2024 lines 186–187 (Proposition 1.2(3)); §5.4 DengHaniMa2024 lines 140–172 (`d ≥ 2`,
left-continuous velocities at line 166), 150–153; §6.4 GST2013 lines 862–863, 875–910, 855,
DengHaniMa2024 lines 182–188, BGSS2023 lines 132–139; §8.3 GST2013 lines 929–932, 934–937, 938;
§9.4 BGSS2023 lines 267–268, 479–483, 3539; §10.3 BGSS2023 lines 292–304, GST2013 lines 380–384;
§10.4 BGSS2023 lines 316–321 (hypothesis (1.1.5) at line 168, `T₀` through `C₀, β₀` at line 319),
GST2013 lines 668–696, 2041–2055, 2069–2080; §10.5 BGSS2023 lines 344–349, 352–371. Printed pages 27
(GST2013) and 2, 3 (BGSS2023) agree. The manifest records all nine cited works, and a mechanical
comparison of each `cited_for` list with the sections naming the source finds no difference.

**Duplication audit.** Pinned Mathlib and Tau Ceti searched by object (hard spheres, Boltzmann,
grand canonical, flat torus, specular): the only hits are `TauCeti/Probability/Distributions/Chi/Gaussian.lean`
(the Maxwell–Boltzmann law of a speed, not the velocity Maxwellian, which §9.1 identifies with the
pinned multivariate Gaussian density) and Boltzmann entropy in optimal transport; neither is an
object of this roadmap. `roadmaps grep` over main and every open head: hard spheres only in
ClassicalErgodicTheory (which excludes the flow and names it a consumer of its §3.5) and in a remark
of MathematicalBilliards; no match for Boltzmann equation or collision operator, Lanford, BBGKY,
Boltzmann–Grad, grand canonical, Maxwellian, `HardSphere.`, `FlatPositionSpace`, `UnitFlatTorus`. Flat
tori occur elsewhere (RiemannianGeometry, RicciFlow, QuasiregularMaps, GeometricTopology) only as
examples of Riemannian manifolds; no roadmap defines the normed measured group `E ⧸ L`. No fully
qualified name of `Suggested.lean` occurs in another roadmap. Overlap facts: no other pull request
changes this roadmap, no dropped or revision-only id, no second copy.

Overlap check: read ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, DimerModelsAndLozengeTilings, HamiltonianSystems, MathematicalBilliards, OptimalTransport, RandomMatrices; flows defined off a null set — owner ClassicalErgodicTheory §3.5 (consumed here); flat tori `ℂ/Λ` as translation surfaces — owner MathematicalBilliards §10.5, the normed measured torus `E ⧸ L` in every dimension — owner this roadmap §1.3; `k`-point functions of eigenvalue counts — owner RandomMatrices §8.1 (not consumed, the difference is stated in Scope); nothing with two owners.

**Supplier-order audit.**

    depcheck: 246 roadmaps, 2296 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. Citations resolved now: ClassicalErgodicTheory (an open pull request
that adds the roadmap folder) §3.5 items 1, 3 and 4 say what the contract says, on a standard Borel
space with a σ-finite measure, and §0.2 exists; its *Needs:* do not name this roadmap, so there is no
cycle. On main: MathematicalBilliards §10.3 (area 4 for `2ℤ + 2iℤ`), §10.5, §12.3;
ProbabilisticAndMetricNumberTheory §4.9a (`scalarLpKoopman_strong`, continuous action, locally finite
measure, `p ≠ ∞`); RandomMatrices §8.1; StandardDistributions Layer 5; ComplexTori;
OneParameterSemigroups (completed). None is on the never-cite list as a supplier (PointProcesses and
HamiltonianSystems are named nowhere in the README). All 45 *Needs:* lines read; none names a later
layer or an excluded subject, and the ten layer Dependencies agree with them.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, ten layers each ending with Examples and Dependencies (10 and 10), Downstream consumers,
Worked examples, References. 45 subsections, each with a *Needs:* line and at least three Checks
(counted mechanically). Layers are named by their mathematics; the README does not say it follows a
source. No pull-request number, date, path, HTML, LaTeX delimiter, `set_option` or process word in
the README or the Lean file (searched; the one hit is the mathematical phrase "Scheffé's lemma").

**Copyright.** Wording compared at every sampled locator and in six further passages: README §5.5
with GST2013 lines 851–854; the route of §6.3 with GST2013 lines 875–898; the docstring of
`volume_hardCoreSet_diff_goodSet` with GST2013 lines 862–863; the docstring of `LanfordStatement` with
BGSS2023 lines 316–321; the route of §10.5 with BGSS2023 lines 352–371; the docstring of
`IsTrajectory` with DengHaniMa2024 lines 154–166. No shared run beyond standard four-word phrases
("uniformly on compact sets"). Arrangement: GST2013's Chapter 4 (flow, Liouville equation and
hierarchy, weak formulation, Boltzmann hierarchy) and Chapter 2 against the layers: Layers 1–5 and 9
have no counterpart, Chapter 2 corresponds to §10.2–10.3 (last here, second there), and the order of
Layers 6, 7, 8 is forced (§7.1 needs §6.4; §8.1 needs §7.1–7.4). No table, figure or list is reused.
I know of no public formalisation the Lean file resembles.

Source independence: 36 passages compared with 3 sources, none shared; largest share GST2013, 47 of 111 locators; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 (Proposition 4.3), AlexanderThesis1975, Lanford1975, CIP1994, Spohn1991, Uchiyama1988:
  recorded `uncertified`; texts not read. The finite-`N` theorem is proved in GST2013 lines 862–910,
  which I read; Alexander1976 is checked only through GST2013 line 855.
- The printed numbering of BGSS2023 and GST2013: the roadmap cites the arXiv versions the manifest
  records; the printed versions were not compared.
- The truth of `LanfordStatement d` for `d ≥ 2` rests on BGSS2023 Theorem 1, which refers elsewhere
  for its proof; checked against the statement only (row 17).

## Source issues

- **Misprint** in GST2013 at §4.4, the sentence before (4.4.1), printed p. 33: the source says the pre-collisional velocities are the pre-image under (4.1.1), the free-flow equation; it should be (4.1.2), the reflection law; affects nothing.
- **Gap** in BGSS2023 at the proof of Corollary 1.2.1, after (1.2.7), printed p. 5: the source says the variance tends to zero because the correlation functions converge almost everywhere; it should add a mass-conservation or domination argument to pass to the integrals; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "87cad15ba264ee803add3edb493c1999c390b4d2", "job": "REV-PKG-HardSphereDynamicsAndKineticLimits~2", "model": "fable", "worker": "chris-x89"} -->
