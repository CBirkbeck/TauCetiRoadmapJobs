<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18031#issuecomment-6906784856 -->
Review (claude) of 4192871

Verdict: needs_changes

1. **F01** (P1) `HardSphere.weak_liouville` parses with the second integral inside the first

   **Location.** `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean` line 330:
   `∫ t in Ioi (0 : ℝ), ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z + ∫ Z, W₀ Z * φ 0 Z = 0`.

   **Claim.** The docstring and README §8.2 state `∫_0^∞ ∫ W(t) Lφ(t) dλ dt + ∫ W⁰ φ(0) dλ = 0`.

   **Witness.** The integral binder takes its body at precedence 60, so `+` (65) stays inside. The
   elaborated type is `∫ t in Ioi 0, ∫ Z, (W₀ (flow ε (-t) Z) * Lφ t Z + ∫ Z', W₀ Z' * φ 0 Z') = 0`;
   in a scratch copy the two forms are equal by `rfl`. Write `c = ∫ W⁰ φ(0)`. For `N ≥ 1`, `d ≥ 1`
   the phase space has infinite measure, so when `c ≠ 0` the inner integrand (an integrable function
   plus the nonzero constant `c`) is not integrable, the Bochner integral is `0`, and the statement
   reads `0 = 0`. It then holds with `hspec` deleted, or with `flow ε t` in place of `flow ε (-t)`:
   the README's own negative control (§8.2, fourth Check, left side `−1`, `c ≠ 0` once `χ(0) ≠ 0`)
   satisfies it. The statement carries content only when `c = 0`.

   **Repair.** Parenthesise the first term:

   ```lean
       (∫ t in Ioi (0 : ℝ), ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z) + ∫ Z, W₀ Z * φ 0 Z = 0 := by
   ```

   Tested: with this line the file elaborates (`sorry` the only warning) and `#check` shows
   `(∫ t in Ioi 0, ∫ Z, W₀ (flow ε (-t) Z) * Lφ t Z) + ∫ Z, W₀ Z * φ 0 Z = 0`. On the negative
   control the repaired left side is `−1 ≠ 0`, so `hspec` is now needed. The repaired statement is
   true as stated (row 8 of the table). No README change.

2. **F02** (P3) `flow_add`, `flow_reversal` and `grandCanonical_flow_invariant` carry hypotheses their truth does not use

   **Location.** `Suggested.lean` lines 287–289 (`hε`, `hερ`), 307–309 (`hε`, `hερ`), 362
   (`[IsFiniteMeasure (volume : Measure X)]`); README §7.1 "Prove `HardSphere.flow_add`: for
   `0 < ε < ρ`", §9.4 "on a position space of finite measure".

   **Claim.** The three statements are asserted only under these hypotheses.

   **Witness.**
   - `flow_add` uses uniqueness (§5.2, every real ε) and time translation only. Instance ε = −1:
     `hardCoreSet` is everything, no contact exists, trajectories are the free motions, `flow = freeFlow`
     and `S_{s+t} = S_s ∘ S_t`; the stated theorem excludes it.
   - `flow_reversal`: `σ_M` is an involution for every ε (§3.3); for ε ≤ 0 or ε ≥ ρ the outgoing
     condition reads `0 < 0` at a contact, so trajectories are contact-free free motions and
     `t ↦ ℛ(Z(−t)) = (X(−t), −V(−t))` is one. Same instance ε = −1: `S_t(X, −V) = ℛ(S_{−t}(X, V))`.
   - `grandCanonical_flow_invariant` on `X = E`, `d = 1`, `μ = c = β = 1`: the `N = 1` term of the
     partition function is `√(2π) · vol(ℝ) = ∞`, so `Z = ∞`, every density is `x/∞ = 0`, the
     measure is `0` and is invariant; for `μ c = 0` it is the vacuum law. The route (§9.2, first
     statement) never uses finiteness.

   **Repair.** Delete `(hε : 0 < ε) (hερ : …)` from `flow_add` and `flow_reversal` and
   `[IsFiniteMeasure …]` from `grandCanonical_flow_invariant`; in README §7.1 and §7.3 write "for
   every real ε" for these two identities, and in §9.4 replace "on a position space of finite
   measure" by "on every flat position space (when `μ_X(X) = ∞` and `μ c > 0` the partition function
   is infinite and the measure is zero)", adding that instance as a Check. Tested: `flow_add` and
   `flow_reversal` without the two hypotheses elaborate in the scratch copy.
   `measurePreserving_flow`, `volume_hardCoreSet_diff_goodSet`, `weak_liouville`,
   `lintegral_sum_distinct_eq_correlation` and `boltzmannGrad_scaling` keep `0 < ε < ρ` (Alexander's
   theorem fails for ε ≥ ρ, and for ε = 0 in `d = 1`).

3. **F03** (P3) the pinned `empiricalFiniteMeasure` already represents `π_t`, the empty configuration included

   **Location.** README "From Tau Ceti" (the `empiricalMeasureOfFintype` bullet) and §10.1, third
   Check: "The empty configuration gives the zero measure, which `empiricalMeasureOfFintype` (a
   probability measure) cannot represent."

   **Claim.** The pinned library offers only a probability-valued empirical measure, so `π_t` needs a
   case split at `N = 0`.

   **Witness.** `TauCeti/Probability/Process/EmpiricalMeasure.lean` line 57,
   `TauCeti.Probability.empiricalFiniteMeasure` (zero for an empty family), and line 75,
   `card_smul_empiricalFiniteMeasure : card κ • empiricalFiniteMeasure x = ∑ i, δ_{x i}`.
   `empiricalMeasureOfFintype` (line 224) is built on it. At `N = 0`: `0 • 0 = 0 = ∑_∅`.

   **Repair.** In the Tau Ceti contract add `TauCeti.Probability.empiricalFiniteMeasure` and
   `TauCeti.Probability.card_smul_empiricalFiniteMeasure`; in §10.1 state
   `π_t = μ^{−1} • (N • empiricalFiniteMeasure (T_t Z))` for every `N ≥ 0` (first Check), keep the
   third Check as the reason the probability-valued form is not the one used, and add the two names
   to the `*Needs:*` line of §10.1 and to the Layer 10 Dependencies. No Lean change.

Three findings: one blocking (P1, a Lean statement that does not say what the README says) and two
P3. The README's mathematics survived the adversarial pass; the sampled locators all hold; the
elaboration passes with `sorry` as the only warning; the dependency check is clean.

Previous review of this package: none. Maintainer notes: none.

## Verified sound

**Principles.** No route-specific shortcut (one class `FlatPositionSpace` covers `E`, every flat
torus and every quotient `E/Γ`; I checked that the axioms force `ker π` discrete and `ρ ≤` half
the systole, so `ε < ρ` is the genuine hard-sphere model). No re-planned roadmap; no algorithm;
no sorry'd data; no `set_option`; no `lemma`; `module` / `import Mathlib` header as on main (71
roadmaps on main open with `module`); no pull-request numbers, dates, paths or HTML in the README
or the Lean file (searched).

**Elaboration.** `lake env lean` on `Suggested.lean`: exit 0, 11 warnings, all
`declaration uses 'sorry'` (lines 256, 268, 287, 295, 307, 320, 362, 384, 396, 448, 495).

**One-tactic probe, all 11 theorems.** `simp`: 9 "no progress", 2 "unsolved goals"; `rfl`: 11
failures; `infer_instance`: 11 failures. None restates a definition or mirrors a Check. No padding.

**Signatures.** Compared the 32 elaborated types with the README. The "dropped binder" leads are
false positives: every theorem carries `[ProperSpace X] [MeasureSpace X] [BorelSpace X]
[FlatPositionSpace d X]`; `partitionFunction`, `grandCanonicalDensity`, `grandCanonical`,
`hardCoreSet` keep only `[NormedAddCommGroup X]` (and `[MeasureSpace X]`), which is all the README
states for them ("for every real ε, every μ ≥ 0, every `f⁰`"). The only mismatch is R01.

**Headlines.** Uniqueness, Alexander, group law, measure preservation, reversibility, weak
Liouville, grand canonical invariance, correlation identity, Boltzmann–Grad scaling, law of large
numbers and its corollary under `LanfordStatement`: all stated; Lanford's theorem is a `Prop`
definition, as the docstring says. No statable headline absent.

**Backticked names.** The 26 names of the citations lead are all declared in `Suggested.lean`
(class fields included). 72 cited library names checked by `#check` at the pins after building
the four Tau Ceti modules: all resolve, in the files the README names
(`det_fromBlocks_zero₁₂` Determinant/Basic.lean:734; `descFactorial_eq_zero_iff_lt`
Factorial/Basic.lean:367; `meas_ge_le_variance_div_sq` Variance.lean:398;
`measurePreserving_piCongrLeft` Constructions/Pi.lean:732;
`MemLp.exists_hasCompactSupport_eLpNorm_sub_le` ContinuousMapDense.lean:142;
`EuclideanSpace.volume_ball` VolumeOfBalls.lean:308; `addHaar_submodule` EqHaar.lean:172;
`toSphere_apply_univ` HaarToSphere.lean:88; `StronglyContinuousGroup` Group/Basic.lean:74 with the
three fields the README quotes; `quotientMeasureEqMeasurePreimage_quotientMeasure`
FundamentalDomain.lean:801, `to_additive`).

**Adversarial table** (sampled targets, headlines, targets of findings).

| # | Statement | Instances | Values computed | Result |
|---|---|---|---|---|
| 1 | §1.1 class, short lift | torus `(0.9,0)`; sup-norm torus `(s,s)`, s=0.1; `E` with norm `min`-concave beyond 2, ρ=2 | lift `(−0.1,0)`; sup norm 0.1 vs least Euclidean lift 0.1414; distorted norm agrees with Euclid on `‖·‖<2` so `𝒟̄`, normals unchanged for ε<2 | sound |
| 2 | §1.2 | ball d=3; radius 100 | `4π/3=4.18879`; `10⁴π=31415.93` | sound |
| 3 | §1.3 | `2ℤ×ℤ`; ball `B(0,1/2)` d=2 | covolume 2, ρ=1/2; mass-1 measure gives `π/32≠π/16`; density `π/4<1` | sound |
| 4 | §1.4 shells, packing | torus d=2 ε=0.4; d=1 shell 0.4–0.6; d=0, r₁=0 | `1/0.12566=7.96` → 7; measure 0.2 vs formula 0.4; d=0 gives 1 vs 0 (excluded by Conventions `d ≥ 1`) | sound |
| 5 | §2.1–2.2 | ν=(1,0), v=(0,0.9), w=(0.9,0); head-on; d=1,2,3 cross-section | `σ=((0.9,0.9),0)`, energy 1.62 both sides; `(−1,0),(1,0)`; `∫_B⟨e,x⟩_+ = ω_{d−1}/(d+1)`: 1/2, 2/3, π/4 → `|k|, 2|k|, π|k|` | sound |
| 6 | §3.2–3.3 | torus ε=0.3 `π(0.1,0),π(0.8,0)`; outgoing `((1,0),0)`; ε=0, ε≥ρ, ε<0 | `ν=(1,0)`; `σ_M V=(0,(1,0))`, `ℛ` gives `(0,(−1,0))`, `⟨·,ν⟩=1`; normal 0 / no contact, `σ_0=id` | sound |
| 7 | §4.1–4.5 | `a=(2,0),u=(−1,0)`; `(1,3),(0,−1)`; `(2,3)`; `(3,0.6)`; `DC` 4×4; d=1 | `D=1,τ=1`; `D=0`,τ=3; `D=−3`; `D=0.64, τ=2.2, R_q u=(0.28,0.96)`; rows recomputed from `dτ=da₁+du₁`, det `(−1)(3−4)=1`; `(2−a−su,−u)` det 1, variable time det 0 | sound |
| 8 | §8.2 weak Liouville (README; Lean after R01) | head-on φ; 1-d box non-example; left limit at a collision | continuity: `φ(s,T_sZ)=φ(t+(s−t),S_{s−t}Y)→φ(t,Y)=φ(t,T_tZ)` by `hderiv` along free lines and `hspec`; τ∈(0.9519,1.0521), H∈(0.4802,0.5204), defect `−1`; grazing state `−5` vs `−2` on a null set | README sound; Lean R01 |
| 9 | §5.1–5.2 `IsTrajectory.eqOn` | `J=[0,1]∪[2,3]`; all ε; J singleton | both paths satisfy (1)–(7) (filters `𝓝[J∩Ioi 1] 1`, `𝓝[J∩Iio 2] 2` are `⊥`), differ at 2; proof uses (2),(3),(6),(7) and injectivity of `σ_M`, valid for every ε; trivial | sound |
| 10 | §5.4–5.5 | `a=(−2,1),u=(−1,0)`; N=2 classification | `⟨a,u⟩=2`, `D=4−4=0`, tangency at `(0,1)`, time −2; six cases of `(│a│,D,⟨a,u⟩,u)` checked against the stated union | sound |
| 11 | §6.1–6.4 Alexander | N=2 constant; grazing `(2,1)`; ε≥ρ; ε=0,d=1 | `8·(12π)²·π²/2=576π⁴≈56108`; `√5≤3` near pair, grazes at 2 then at 1; colliding data non-null for ε≥ρ, crossing rods for ε=0: hypotheses needed | sound |
| 12 | §7.1–7.3 | ε=−1; N=0; torus N=8 | free flow, group law and reversal hold; point space, flow `id`; `𝒟̄=∅`, flow `id` | sound; R02 |
| 13 | §7.4 | N=d=1 circle; ε=1/3,N=3 | mass `1·∞`; gaps sum to 1, each ≥1/3 ⇒ equal, `q₃=0` | sound |
| 14 | §9.3–9.5 | μ=0,n≥1; n=0; `∫f⁰=∞`; Poisson λ=1; circle ε=0.1 | both sides 0 (`∞·0`); both `h(∅)·P(univ)`; `Z=∞`, measure 0; `E[N(N−1)]=1` vs `E[N²]=2`; `0.8√(2π)=2.0053` | sound; R02 |
| 15 | §9.6 `boltzmannGrad_scaling` | d=3, ε=0.01; d=0 | `ω₃ε=0.0419`; d=0: `Z=2`, `E[N]=1/2 < 1−ε`: `hd` needed and present | sound |
| 16 | §10.1–10.2 | N=0; d=3 loss; β=0 | zero measure (R03); `π√(8/π)·M(0)`; speeds `r/√2≥1` | sound; R03 |
| 17 | §10.4 `LanfordStatement` | all structures on `𝕋^d`; Scheffé step; t=0 | `B` linear, `‖B‖≤1`, `│det B│=1` ⇒ orthogonal; `B⁻¹(±e₁/2)` collide ⇒ `ρ'≤1/2`; `∫│F−f│=∫F−1+2∫(f−F)^+→0`; `│F₁−f⁰│≤ω_dε‖ρ⁰‖f⁰` | sound |
| 18 | §10.5 both theorems | d=1 circle; d=0; F₂→2f⊗f | `P(N≠1)→1−e⁻¹=0.63212`; `F₁=a/(1+μa)→0`, conclusion holds; variance → `m²` | sound |

Further checks: `weak_liouville` is the only statement where an integral body swallows a later
term (the other ten, and the six definitions with integrals, read at the elaborated types).
`LanfordStatement`'s hypotheses are BGSS2023 (1.1.5) in Lipschitz form together with the
continuity of GST2013 Theorem 4; `T₀` depends on `C₀, β₀` only (BGSS2023 line 319).

**Sources: the seeded sample.** All 15 sampled targets and the headline locators read in the
cached texts; every locator holds:
§1.1, §1.2 GST2013 lines 833–841, BGSS2023 line 119; §1.4 GST2013 line 873, BGSS2023 line 165;
§3.2 BGSS2023 lines 148–152; §3.3 GST2013 lines 1219–1227; §4.1 GST2013 lines 846–847,
1210–1216; §4.5 GST2013 lines 875–887; §5.4 DengHaniMa2024 lines 140–172, 150–153; §5.5 GST2013
lines 841, 851–854; §7.2 GST2013 line 883, DengHaniMa2024 line 186; §7.4 GST2013 lines 1138–1140,
DengHaniMa2024 lines 175–178; §8.1 BGSS2023 lines 145–157, DengHaniMa2024 lines 224–234; §9.5
BGSS2023 lines 229–237, 241–266 (line 249), 267–277, 279–288, DengHaniMa2024 lines 235–244; §9.6
BGSS2023 lines 211–217, DengHaniMa2024 lines 246–252; §10.1 BGSS2023 lines 324–340, 352–369.
Also: GST2013 lines 211–215, 380–400, 432–437, 489–492, 668–696, 862–910, 911–958, 2041–2080,
5439–5440; BGSS2023 lines 292–321, 344–371, 479–483, 3539; DengHaniMa2024 lines 182–188, 199–223,
258–282, 291. Printed pages 27 (GST2013), 2 and 3 (BGSS2023) agree. No locator was flagged as
unverified by the author. The manifest records all nine cited works, with `cited_for` matching the
sections that cite each.

**Duplication audit.** Pinned Mathlib and Tau Ceti searched by object (hard spheres, Boltzmann
equation, collision operator, flat torus as a normed quotient, grand canonical, specular): nothing
(R03 is the one near object). `roadmaps grep` for hard spheres, Boltzmann equation, Lanford,
`FlatTorus`, grand canonical, BBGKY, collision operator, Maxwellian: only ClassicalErgodicTheory
(which excludes the hard-sphere flow and names it a consumer of its §3.5) and
MathematicalBilliards line 971 (a remark). Overlap facts: no other pull request changes this
roadmap, no dropped or revision-only ids, no second copy.

Overlap check: read ClassicalErgodicTheory, PointProcesses, RelativisticQuantumFieldTheory, DimerModelsAndLozengeTilings, HamiltonianSystems, MathematicalBilliards, OptimalTransport, RandomMatrices; shared objects: flows defined off a null set — ClassicalErgodicTheory §3.5 (consumed here); factorial and Janossy measures — PointProcesses (not used here); flat tori `ℂ/Λ` as translation surfaces — MathematicalBilliards §10.5 (the normed measured torus `E ⧸ L` is this roadmap's); `k`-point functions of eigenvalue counts — RandomMatrices §8.1 (not consumed); nothing with two owners.

**Supplier-order audit.**

    depcheck: 242 roadmaps, 2261 edges, 0 problem(s)

No UPWARD or CYCLE line. Cross-roadmap citations resolved now: ClassicalErgodicTheory §3.5 items
1, 3, 4 and §0.2 (open pull request adding the roadmap; items as cited; §0.2 assumes a finite
invariant measure; it does not consume this roadmap); MathematicalBilliards §10.3 (area 4 for
`2ℤ + 2iℤ`), §10.5, §12.3 (probability space) on main; ProbabilisticAndMetricNumberTheory §4.9a
`scalarLpKoopman_strong` (continuous action, locally finite measure) on main; RandomMatrices §8.1
on main; StandardDistributions Layer 5 on main; OneParameterSemigroups (completed); ComplexTori on
main. None is on the never-cite list as a supplier. No gap declared, none needed. Every `*Needs:*`
line read against its section; layer Dependencies agree with them.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
build, ten layers each ending with Examples and Dependencies, Downstream consumers, Worked
examples, References. 45 subsections, each with at least three Checks (3 to 7); every theorem has
its hypotheses and a locator or says it is proved here and stated in no source. Layers are named
by their mathematics.

**Copyright.** Wording compared at every locator above and in five further prose passages
(README §5.5 against GST2013 lines 851–854; §6.3 route against GST2013 lines 875–898; §10.4
against BGSS2023 lines 316–321; §10.5 route against BGSS2023 lines 352–371; the docstring of
`volume_hardCoreSet_diff_goodSet` against GST2013 lines 862–863): no run of more than three
shared consecutive words outside formulas and standard names. Arrangement: GST2013's contents
(Ch. 1 low-density limit, Ch. 2 Boltzmann equation, Ch. 3 results, Ch. 4 flow / Liouville / weak
form / hierarchy) against Layers 1–10: Layers 1–5 have no chapter counterpart, Ch. 2 is §10.2–10.3
(last), and Layer 6–8 order is forced (§7.1 needs §6.4; §8.1 needs §7.1–7.4). No table, figure or
exercise list is reused; I know of no public formalisation the Lean resembles.

Source independence: 24 passages compared with 3 sources, none shared; largest share GST2013, 53 of 128 source mentions; contents compared with GST2013: independent.

## Not verifiable

- Alexander1976 Proposition 4.3 (pp. 217–232), Lanford1975, AlexanderThesis1975, CIP1994,
  Spohn1991, Uchiyama1988: recorded `uncertified` in the manifest; texts not read. Alexander1976
  is checked only through GST2013 line 855 and its bibliography, lines 5439–5440; the finite-`N`
  theorem itself is proved in GST2013 lines 862–910, which I read.
- Published numbering of BGSS2023 (Ann. of Math.) and of GST2013 (EMS): the roadmap cites the
  arXiv versions it read (v2 each), as the manifest says; the printed versions were not compared.
- Truth of `LanfordStatement d` for `d ≥ 2` at the stated hypotheses rests on BGSS2023 Theorem 1,
  which refers to other works for its proof; not checked beyond the statement.

## Source issues

- **Misprint** in GST2013 at §4.4, the sentence before (4.4.1), printed p. 33: the source says the pre-collisional velocities are the pre-image under (4.1.1), the free-flow equation; it should be (4.1.2), the reflection law; affects nothing.
- **Gap** in BGSS2023 at the proof of Corollary 1.2.1, after (1.2.7), printed p. 5: the source says the variance tends to zero because the correlation functions converge almost everywhere; it should add a mass-conservation (Scheffé) or domination argument to pass to the integrals; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4192871d727a155ba7db88d931ea0bdd663ac606", "job": "REV-PKG-HardSphereDynamicsAndKineticLimits", "model": "fable", "worker": "chris-x26"} -->
