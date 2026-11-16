<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18031#issuecomment-6908082127 -->
Red team round 1 pass a (claude) of 87cad15

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) `HardSphere.LanfordStatement` is handed to the downstream roadmap for every `d`; it is false at `d = 0`

   Location: `packages/HardSphereDynamicsAndKineticLimits/README.md:11` ("a roadmap on the BBGKY
   hierarchy, which proves the proposition stated in §10.4"); `README.md:862` ("proves
   `HardSphere.LanfordStatement` for the structure of §1.3 on `𝕋^d`"); `Suggested.lean:31-33` ("it is the
   proposition `HardSphere.LanfordStatement`, defined here and proved by the roadmap on the BBGKY
   hierarchy").

   Claim: the proposition, defined "for every `d`" (`README.md:823`), is what the downstream roadmap
   proves. None of the three sentences restricts `d`; the sources prove it for `d ≥ 2` only
   (BGSS2023 line 119; DengHaniMa2024 line 141).

   Witness (`d = 0`, any structure, `C₀ = β₀ = 1`, `f⁰ ≡ 1`): `E` and `𝕋⁰` are points of mass 1,
   `μ_ε = ε⁻¹^(0−1) = 1`, `𝒟̄_N = ∅` for `N ≥ 2`, so `Z = 1 + 1 = 2` and `F^ε_1(t) = 1/2`; the sphere is
   empty, `Q = 0`, `f(t) = 1`. All three conclusions fail (`1/2 ↛ 1`).

   Repair (three edits and one Check; tested on the witness, which each new hypothesis excludes):

   - `README.md:11`: replace "which proves the proposition stated in §10.4" by "which proves the
     proposition stated in §10.4 for every `d ≥ 2`".
   - `README.md:862`: replace "proves `HardSphere.LanfordStatement` for the structure" by "proves
     `HardSphere.LanfordStatement d` for every `d ≥ 2`, for the structure".
   - `Suggested.lean:32-33`: replace "defined here and proved by the roadmap on the BBGKY hierarchy" by
     "defined here for every `d` and proved, for `d ≥ 2`, by the roadmap on the BBGKY hierarchy".
   - Add to the Checks of §10.4: "The proposition is false for `d = 0`, so the hypothesis `d ≥ 2` of
     the downstream theorem and of §10.5 is not decoration. There `E` and `𝕋⁰` are points of mass 1,
     `μ_ε = 1` (the exponent `d − 1` is truncated to 0) and no two particles fit, so for `f⁰ = 1`
     (admissible with `C₀ = β₀ = 1`) the partition function is `1 + 1 = 2` and `F^ε_1(t) = 1/2` for every
     ε > 0, while the unit sphere of `E` is empty, `Q = 0`, and every mild solution is `f(t) = 1`."

2. **F02** (P3) the locators of the uniqueness theorem do not contain it

   Location: `README.md:417` and `Suggested.lean:253-255` ("agree on `J`, for every diameter `ε`
   (DengHaniMa2024 lines 182–188; GST2013 lines 848–854)").

   Claim: the two locators support uniqueness of trajectories at every initial state, for every real ε
   and every interval.

   Witness: GST2013 lines 848–854 define pathological trajectories and state no uniqueness;
   DengHaniMa2024 lines 182–183 assert existence and uniqueness only off a closed null set, for
   `d ≥ 2` on Euclidean space.

   Repair: in both places replace the parenthesis by "(off a Lebesgue-null set, on Euclidean space,
   uniqueness is part of DengHaniMa2024 Proposition 1.2, lines 182–183; the statement at every initial
   state, for every real ε and every interval, is proved here from the definition of §5.1 and is stated
   in none of the sources)".

3. **F03** (P3) the locators of the Boltzmann–Grad scaling support a limit, not the inequality

   Location: `README.md:758` and `Suggested.lean:392-395` ("`1 − ω_d ε ‖ρ⁰‖_∞ ≤ ε^{d−1} E[N] ≤ 1` …
   (BGSS2023 (1.1.8), lines 211–217; DengHaniMa2024 (1.12), lines 246–252)").

   Claim: the two-sided bound with the constant `ω_d ‖ρ⁰‖_∞` is at those locators.

   Witness: BGSS2023 lines 211–214 impose `lim E(N) ε^{d−1} = 1` as the normalisation that fixes
   `μ_ε`; DengHaniMa2024 lines 246–249 say the product is 1 up to an error `O(ε)`, with no constant.

   Repair: in both places replace the parenthesis by "(the limit `ε^{d−1} E[N] → 1` is the
   normalisation BGSS2023 (1.1.8), lines 211–217, and the error `O(ε)` is DengHaniMa2024 (1.12),
   lines 246–252; the two-sided bound with the constant `ω_d ‖ρ⁰‖_∞` is proved here and is stated in
   neither source)".

4. **F04** (P3) the docstring of `HardSphere.hardCoreSet` cites the two sources that define the open set

   Location: `Suggested.lean:190-191` ("The closed hard-core set `𝒟̄^ε_N` … pairwise at distance at
   least `ε` (GST2013 lines 839–841; BGSS2023 lines 137–142)").

   Claim: the closed set is at those locators.

   Witness: GST2013 line 841 and BGSS2023 line 139 both define the domain with the strict inequality
   `> ε`; the closed set `≥ ε` is DengHaniMa2024 (1.1), lines 150–153, which `README.md:216` cites and
   the docstring omits.

   Repair: replace the parenthesis by "(DengHaniMa2024 (1.1), lines 150–153; GST2013 lines 839–841 and
   BGSS2023 lines 137–142 use the open set with strict inequalities, which differs from it by a null
   set for `0 < ε < ρ`)".

5. **F05** (P3) the `*Needs:*` line of §9.6 omits §1.1, which its route uses

   Location: `README.md:758` ("a union bound, §1.1 for the ball volume, `ε < ρ`") against
   `README.md:766` ("*Needs:* §1.4, §8.4, §9.3, §9.5.").

   Claim: the `*Needs:*` line lists the inputs of the route.

   Witness: the ball volume `volume(B(x, ε)) = ω_d ε^d` for `ε ≤ ρ` is the "Balls and spheres" API
   bullet of §1.1 (`README.md:102`); §1.4 states shells and the packing bound, not balls.

   Repair: `*Needs:* §1.1, §1.4, §8.4, §9.3, §9.5.`

6. **F06** (P3) the first Check of §4.4 restates an API bullet of §4.2

   Location: `README.md:367` ("`s = 0`: `B_0` is the identity off incoming contact states.") against
   `README.md:335` ("`B_0` is the identity off the incoming contact states").

   Claim: a Check of the measure preservation of `B_s`.

   Witness: the sentence is the second half of the first API bullet of §4.2 word for word, and holds
   equally for the totally inelastic rule of the third Check (also the identity at `s = 0` off incoming
   contacts), so it discriminates nothing.

   Repair: replace the Check by "`d = 1`, ε = 1, `s = 4`: on the rectangle `a ∈ (2, 3)`,
   `u ∈ (−1, −1/2)`, of area `1/2`, every state collides before time 4 (`τ = (a − 1)/(−u) < 2/(1/2) = 4`)
   and `B_4(a, u) = (2 − a − 4u, −u)`, an affine map of determinant `(−1)(−1) = 1`, whose image (in
   `{a > 1}`, since `2 − a − 4u > 2 − 3 + 2 = 1`) again has area `1/2`."

One P2 (the hand-off of `HardSphere.LanfordStatement` to the downstream roadmap has no hypothesis on
`d`, and the proposition is false at `d = 0`) and five P3 (three locators, one `*Needs:*` line, one
Check). No P1. No declared gap (`design/plan.json` has `"gaps": []`; the README states none).

Dependency check, run on `packages/HardSphereDynamicsAndKineticLimits/README.md` against
`merge-order/ORDER.txt`:

    depcheck: 250 roadmaps, 2363 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Verified sound

Counts: 32 declarations of `Suggested.lean` read (every line) and compared with the worker's
elaborated signatures (`#check @name` output of the 32; the 23 "dropped binder" leads are false: each
elaborated type carries `[FlatPositionSpace d X]` and `[MeasureSpace X]` where its body uses them;
`hardCoreSet`, `scatter`, `collisionOperator` and the three ensemble definitions correctly carry
fewer; nothing changed); 45 README targets read (every line of the README); 60 distinct cited line
ranges opened (GST2013 28, BGSS2023 23, DengHaniMa2024 9), all containing the cited object except as
in R02–R04; 178 Check bullets read in 45 Check blocks, every numerical value in them recomputed, all correct, one restatement (R06); 9 sibling
citations resolved (ClassicalErgodicTheory §3.5 items 1, 3, 4 and §0.2 at the head of its open pull
request; MathematicalBilliards §10.3, §10.5, §12.3; RandomMatrices §8.1;
ProbabilisticAndMetricNumberTheory §4.9a `scalarLpKoopman_strong`; StandardDistributions Layer 5;
OneParameterSemigroups; ComplexTori on main), each saying what the README says it says; the Mathlib
declarations of the supplier contracts (about 60 of its 79 backticked names; the others are standard
carriers such as `essSup`, `Fin.append`, `MeasureTheory.Measure.sum`) and the 7 Tau Ceti declarations
grepped at the pins, all present under the cited names and in the cited files
(`QuotientAddGroup.instNormedAddCommGroup`, `QuotientAddGroup.measurableSpace` and the additive
quotient-measure lemmas exist through `to_additive`).

Ownership: `roadmaps grep` for hard spheres, Lanford, the Boltzmann equation and flat tori over the
open heads and main finds no second owner; MathematicalBilliards §10.5 (`ℂ/Λ` as a translation
surface) and RandomMatrices §8.1 (correlation functions of eigenvalue counts) are different objects,
as the scope paragraph says. No declaration of `Suggested.lean` has a name declared by a readable
roadmap. The pull request changes only `packages/HardSphereDynamicsAndKineticLimits/`.

Policy: no `lemma`, `set_option`, `#eval`, `True` placeholder, sorry'd data or process word; single
`import Mathlib` (after `module`, as in MathematicalBilliards on main); every target has a locator
or says that its statement is in none of the sources. Headlines (Alexander's theorem, the
measure-preserving reversible group, weak Liouville, grand canonical invariance, the correlation
identity, the law of large numbers) are all stated; no declaration is one-tactic padding.

The adversarial table (values computed on each side):

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| `FlatPositionSpace` | `E`, ρ = ∞; `E`, ρ = 2; `𝕋²`; sup-norm torus at `s = 0.1` | all axioms; all axioms; ρ = 1/2, `‖(½,½)‖ = 0.7071`; lift norm 0.1414 > 0.1 | sound; ρ > 0 excludes the vacuous model |
| `shortLift` | `𝕋²`, class of `(0.9, 0)`; `‖ξ‖ ≥ ρ` | `(−0.1, 0)`; `0` | sound |
| `FlatTorus`, instances, `UnitFlatTorus` | `2ℤ × ℤ`; `d = 0` | covolume 2, ρ = 1/2; point of mass 1, ρ = ∞ | sound |
| `scatter` | ν = (1,0), `v = (0,.9)`, `w = (.9,0)`; head-on; ν = 0 | `((.9,.9),0)`, energy 1.62 = 1.62; velocities exchanged; identity | sound; separate reflection excluded by momentum `(1,0) ≠ (−1,0)` |
| `hardCoreSet` | `N ≤ 1`; ε < 0; `d = 0`, `N = 2`, ε > 0 | whole space; whole space; ∅ | sound |
| `contactScatter`, `reversal` | outgoing contact `((1,0),0)`; triple contact; ε ≥ ρ; ε = 0 | `(0,(1,0))`, `ℛ` gives `(0,(−1,0))`, outgoing; identity; normal 0, identity; normal 0 | involution in every case |
| `freeFlow` | `𝕋²`, `S_1(π0, e_1)`; boost `d = 1` | `(π0, e_1)`; `(1,1)` on both corrected sides | sound |
| `IsTrajectory` | head-on witness on ℝ; left-continuous variant; `J = [0,1] ∪ [2,3]` | 7 conditions hold with `𝒯 = {1}`; (5) fails at `t = 1`; two paths agree at 0, differ at 2 | sound; `OrdConnected` needed |
| `IsTrajectory.eqOn` | forward and backward from a contact time; ε = −1; ε ≥ ρ; `N = 0` | `V(t) = σ_M V(t−)` determined both ways; free motion; no contact allowed, free motion; one point | true for every ε |
| `goodSet` | `a = (−2,1)`, `u = (−1,0)`; incoming contact; equilateral triple | `D = 0`, past grazing, not in `G`; not in `G`; not in `G` | sound |
| `volume_hardCoreSet_diff_goodSet` | `N = 2` on `E`; `N = 8` on `𝕋²`, ε = 0.4; `d = 0` | cylinder `D = 0` and contact set null; `𝒟̄ = ∅` (7.96 < 8); `𝒟̄ = ∅` | true; route constants: `576π⁴ ≈ 56108` recomputed |
| `flow`, `flow_add` | ε = −1, `d = 1`; circle, ε = 1/2, `N = 2` | `T_3 = T_1 T_2`, positions `−2, 0`; `G = ∅`, identity | true for every ε |
| `measurePreserving_flow` | `N = 2` on `E`: `det DC` at head-on; `d = 1` | `(−1)(−1)(−3+4) = 1`; `diag(−1,−1)`, 1; variable-time map 0 | true; needs `G` Borel, which §6.4 proves (step sets exhaust exactly: second-neighbour distance has a positive minimum on `[0,t]`) |
| `flow_reversal` | head-on at `t = 3`; ε = −1, `t = 2`; `Z ∉ G` | `((1,0),(−2,0); 0,(1,0))` both sides; `(3,0; 1,0)` both sides; `ℛZ` both sides | true for every ε |
| `weak_liouville` | `χ(t)ψ(H)`; non-specular `χθ(H)v_1` on the box; grazing state | `−χ(0)∫W⁰ψ`; left side `−1 ≠ 0` (τ ∈ (0.9519, 1.0521), `H ∈ (0.4802, 0.5204)`); `−5` against `−2` on a null set | true; `hspec` and the null set both needed |
| `partitionFunction`, `grandCanonicalDensity`, `grandCanonical` | ε = 0, μ = 2, `∫f⁰ = 1`; μ = 0; `Z = ∞` | `Z = e²`, `P(N=1) = 0.27067`; `Z = 1`, vacuum; zero measure | sound; `1/N!` needed |
| `grandCanonical_flow_invariant` | `u ≠ 0`; `X = E`; `1_{|v| ≤ 1}` | function of `H`, `P`; zero measure, invariant; `1 ≠ 0` at `(0.9, 0.9)`, norm 1.2728 | true |
| `correlation`, `lintegral_sum_distinct_eq_correlation` | ε = 0; μ = 0, `n ≥ 1`; `n = 0`; `N = 1`, `n = 2` | `F_n = (f⁰)^{⊗n}`; `∞ · 0 = 0` both sides; total mass both sides; `descFactorial 1 2 = 0` | true |
| `boltzmannGrad_scaling` | `d = 3`, ε = 0.01; `d = 0`; `‖ρ⁰‖_∞ = ∞` | `[0.9581, 1]`; `E[N] = 1/2 < 1 − ε`, so `d ≥ 1` is needed; left side 0 | true as stated |
| `empirical` | μ = 1, `N = 2`; `N = 0` | `δ_a + δ_b`; 0 | sound |
| `collisionOperator` | Maxwellian; `d = 1`; `1_{|v| ≥ 1}`, `d = 2`; loss at `v = 0`, `d = 3` | 0; 0; gain infinite; `M(0) π √(8/π)` | sound |
| `IsMildBoltzmannSolution` | `f = M`; wrong sign on the circle | holds; `0.5 M(1) ≠ 1.5 M(1)` | sound |
| `tendsto_empirical_of_correlation` | ε = 0 Poisson; `F_2 → 2 f⊗f`; `Z = ∞`; `d = 1` | variance `μ⁻¹∫f⁰h² → 0`; variance `→ m²`; measure 0, limit 0; `1 − e⁻¹ ≈ 0.63212` (hypothesis `μ → ∞` fails) | true; `∫f⁰ < ∞` makes `toReal` faithful (`∫F_n ≤ (∫f⁰)^n`) |
| `LanfordStatement` | Maxwellian datum; `π ∘ B`, `B` a quarter turn; `d = 0` | all conclusions by §9.6; same proposition; `F_1 = 1/2`, `f = 1` | false at `d = 0`: R01 |
| `LanfordStatement.tendsto_empirical` | `d = 2` Maxwellian; derivation from the two declarations above | `C₀ = 1 ≥ 0.15915`; `μ_ε → ∞` needs `d ≥ 2`, `f(t)` integrable by the Gaussian bound | true |
| §1.4, §2.2, §4.1–4.5, §6.1–6.3, §8.3–8.4, §9.1–9.3, §9.6, §10.1 (prose targets) | every numerical Check | `0.12566`, 7 points; `π|k|`, `2|k|`, `|k|`; `D = 1, 0, −3`; `τ = 2.2`, `(0.28, 0.96)`; `2.0053/Z < 2.5066/Z`; `e^{−1.62} = 0.19790`; `15.7496` | all agree |

## Not verifiable

- Alexander1976, AlexanderThesis1975, Lanford1975, CIP1994, Spohn1991, Uchiyama1988: recorded as
  uncertified; cited by locator only, the texts were not read. The finite-particle theorem was
  checked against GST2013 Proposition 4.1.1 and DengHaniMa2024 Proposition 1.2 instead.
- No Lean was run in this pass; elaboration was taken from the worker's signature transcript.
- ClassicalErgodicTheory is an open new-roadmap pull request and is not in `merge-order/ORDER.txt`;
  the dependency check reports no problem, so the direction of that edge rests on the rule for open
  pull requests that add a roadmap folder, not on the order file.
- The uniform-on-compact-sets clause of `HardSphere.LanfordStatement` is taken from the statement
  of BGSS2023 Theorem 1 (lines 316–321), which gives no proof and refers to four other works.

## Copyright, licences and scope

Wording: 60 cited ranges and 6 further passages (the docstrings of `IsTrajectory`,
`volume_hardCoreSet_diff_goodSet` and `LanfordStatement`; the routes of §6.3, §8.2 and §10.5) were
set beside GST2013 lines 832–910, BGSS2023 lines 119–371 and DengHaniMa2024 lines 139–252. No
sentence is shared; the longest common run is a standard name. Arrangement: GST2013 has 50 of the
120 README locators; its Chapter 4 runs flow, Liouville equation and hierarchy, weak formulation,
Boltzmann hierarchy, while the ten layers run position spaces, scattering, phase space, two-body
problem, trajectories, Alexander's theorem, flow, densities, ensembles, limit; only Layer 6 ↔ §4.1
and part of Layer 8 ↔ §4.2–4.3 correspond, in an order the `*Needs:*` lines force. Reuse: no table,
figure or list taken over.

Source independence: 66 passages compared with 3 sources, none shared; largest share GST2013, 50 of 120 locators; contents compared with GST2013: independent.

## Source issues

- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4 (lines 186–187): the source says the time-`t` flow maps are diffeomorphisms of the domain minus one fixed null set; it should be measure-preserving bijections that are discontinuous at data colliding exactly at time `t`; affects nothing.
- **Gap** in BGSS2023 at the proof of Corollary 1.2.1, printed p. 5 (lines 370–371): the source says the variance tends to 0 because the correlation functions converge almost everywhere; it should be a passage to the limit of the integrals, by Scheffé's lemma with the conserved mass; affects the proof.
- **Gap** in GST2013 at the proof of Proposition 4.1.1, printed p. 28 (lines 879–880): the source says grazing collisions are removed up to a null set, with no argument; it should be justified, for instance by the null set of tangent relative data in the pair coordinates; affects the proof.

## For the human reviewers

- **Licence.** Six of the nine sources in `sources.toml` are uncertified, among them the primary sources of both named theorems (Alexander1976 Proposition 4.3; Lanford1975); the statements were checked against GST2013, BGSS2023 and DengHaniMa2024 only.
- **Scope.** `HardSphere.LanfordStatement` (`Suggested.lean:469`) is a defined proposition that this roadmap does not prove; `HardSphere.LanfordStatement.tendsto_empirical` assumes it, and the README assigns its proof to a roadmap that does not exist yet.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "87cad15ba264ee803add3edb493c1999c390b4d2", "job": "RT-HardSphereDynamicsAndKineticLimits~1a", "model": "fable", "worker": "chris-x79"} -->
