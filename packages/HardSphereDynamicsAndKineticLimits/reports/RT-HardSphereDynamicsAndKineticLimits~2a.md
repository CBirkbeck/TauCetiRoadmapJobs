<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18031#issuecomment-6909199957 -->
Red team round 2 pass a (claude) of 3bffb46

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the proposition is attributed to a theorem stated on `ℝᵈ` for a fixed number of particles

   Location: `packages/HardSphereDynamicsAndKineticLimits/Suggested.lean:474-476` ("For `d ≥ 2` it is the
   theorem of BGSS2023 Theorem 1 (lines 316–321) and GST2013 Theorem 8 (lines 2069–2080)
   (Lanford1975)"); `README.md:824` ("it is the theorem of its sources for `d ≥ 2` … (BGSS2023 Theorem 1,
   lines 316–321; GST2013 Theorem 4 and Remark 3.1.1, lines 668–696, and Theorem 8 … ; Lanford1975)").

   Claim: for `d ≥ 2` the proposition (unit torus, grand canonical measure with a random particle
   number) is GST2013 Theorem 8 and Lanford's theorem. The README records that GST2013 has another mode
   of convergence, not that it has another space and another ensemble.

   Witness: GST2013 line 668 takes `f⁰` on `ℝ^{2d}`, line 672 fixes `N` with `N ε^{d−1} = 1`, line 833
   puts the particles in `ℝᵈ`. BGSS2023 lines 313–315 say Lanford [47] is the canonical setting and
   refer to [46] (line 8234) for the grand canonical one.

   Repair.

   - `Suggested.lean:474-476`, replace the sentence by: "For `d ≥ 2` it is BGSS2023 Theorem 1
     (lines 316–321), stated there without proof; GST2013 Theorem 8 (lines 2069–2080) and Lanford1975
     prove the counterpart on `ℝᵈ` for a fixed number `N` of particles with `N ε^{d−1} = 1`. Its proof is
     outside this roadmap; for `d = 0` it is false (README §10.4)."
   - `README.md:824`, replace "GST2013 prints convergence of averages against compactly supported
     continuous functions of the velocities, locally uniformly in the positions off the diagonals." by
     "GST2013 Theorems 4 and 8 are the counterpart on `ℝᵈ` (line 668) for a fixed number `N` of
     particles with `N ε^{d−1} = 1` (line 672), with convergence of averages against compactly supported
     continuous functions of the velocities, locally uniformly in the positions off the diagonals;
     Lanford1975 is likewise the fixed-`N` statement (BGSS2023 lines 313–315). The proposition on the
     torus for the grand canonical measure is BGSS2023 Theorem 1, which that source states without
     proof."

   Tested on the witness: the new text places GST2013 on `ℝᵈ` with fixed `N` (lines 668, 672, 833) and
   leaves BGSS2023 Theorem 1 as the only locator for the statement as typed.

2. **F02** (P3) the route of §10.5 applies Chebyshev's inequality at the wrong centre

   Location: `README.md:843` ("gives `E[(π_t(h) − ∫ f h)²] = … → 0`; conclude with
   `ProbabilityTheory.meas_ge_le_variance_div_sq`"), with `README.md:58`, `README.md:852`, `README.md:860`.

   Claim: the pinned lemma turns the displayed second moment about `∫ f h` into the conclusion.

   Witness: the lemma (`Mathlib/Probability/Moments/Variance.lean:398`) bounds
   `μ {ω | c ≤ |X ω - μ[X]|}` by the variance: its centre is `E[π_t(h)] = ∫ F^ε_1(t) h`, not `∫ f h`.
   For `h = 1`, `d = 3`, ε = 0.01, `E[π(1)] = ε² E[N] ∈ [0.9581, 1]` (§9.6) against `∫ f = 1`.

   Repair (either; the first changes no supplier line).

   - Replace "conclude with `ProbabilityTheory.meas_ge_le_variance_div_sq`" by: "Since
     `E[π_t(h)] = ∫ F_1 h → ∫ f h`, for small ε the event `{|π_t(h) − ∫ f h| ≥ δ}` lies in
     `{|π_t(h) − E[π_t(h)]| ≥ δ/2}`, and `Var(π_t(h)) ≤ E[(π_t(h) − ∫ f h)²]`; conclude with
     `ProbabilityTheory.meas_ge_le_variance_div_sq` at `c = δ/2`."
   - Or conclude with Markov's inequality for `(π_t(h) − ∫ f h)²` at level `δ²`,
     `MeasureTheory.mul_meas_ge_le_integral_of_nonneg`
     (`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:1169`), and replace the lemma in the supplier
     contract, the `*Needs:*` line of §10.5 and the Dependencies of Layer 10.

   Tested on the witness: with centre `E[π(1)] ≥ 0.9581` and `δ = 0.2`, the event `{|π − 1| ≥ 0.2}` lies
   in `{|π − E π| ≥ 0.1}` because `|E π − 1| ≤ 0.0419 < 0.1`; the statement of
   `HardSphere.tendsto_empirical_of_correlation` is unaffected.

3. **F03** (P3) no Check of §7.5 pins the weight `1/N!` of `Λ`

   Location: `README.md:598-600` ("The empty configuration has `Λ`-mass 1 … the components with `N ≥ 8`
   are `Λ`-null … The `N = 1` component carries `μ_X ⊗ vol` with weight 1").

   Claim: three discriminating Checks of the definition `Λ = Σ_N (1/N!) λ_N|𝒟̄_N`.

   Witness: the wrong model `Σ_N λ_N|𝒟̄_N` (no `1/N!`) passes all three: `1/0! = 1/1! = 1`, and a null
   component is null for either weight.

   Repair: add the Check "The `N = 2` component carries the weight `1/2`: on the unit circle (d = 1,
   ρ = 1/2) with ε = 0.2, the configurations of `𝒟̄_2` with both speeds at most 1 have `λ_2`-measure
   `(1 − 0.4) · 2² = 2.4` and `Λ`-measure `1.2`; the sum measure without `1/N!` would give `2.4`."

   Tested on the wrong model: it gives `2.4 ≠ 1.2` (positions: `x_1` free, `x_2` outside an arc of
   length `2ε = 0.4`; velocities in `[−1, 1]²`, of area 4).

Three P3 findings (S01–S03): one attribution, one route step, one set of Checks. No P1, no P2. No
declared gap (`design/plan.json` has `"gaps": []`; the README states none). All eleven round-1
findings are repaired, and no repair introduced an error.

Dependency check, run on `packages/HardSphereDynamicsAndKineticLimits/README.md` against
`merge-order/ORDER.txt`:

    depcheck: 249 roadmaps, 2377 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line.

## Round-1 findings at this head

| Finding | Repaired passage at 3bffb46 (quoted) | Status |
|---|---|---|
| ~1a/F01 (P2) hand-off of `LanfordStatement` for every `d` | `README.md:11` "whose end theorem would be the proposition `HardSphere.LanfordStatement d` of §10.4 for every `d ≥ 2`; the proposition is defined for every `d` and is false for `d = 0`"; `README.md:864` "would prove `HardSphere.LanfordStatement d` for every `d ≥ 2`"; `Suggested.lean:33` "for `d = 0` it is false"; new Check `README.md:834` | repaired; witness recomputed (`Z = 1 + 1 = 2`, `F_1 = 1/2`, `Q = 0`, `f(t) = 1`) |
| ~1b/F02 (P3) a roadmap that does not exist "proves" the proposition | `Suggested.lean:34` "its proof (the BBGKY and Boltzmann hierarchies) is outside this roadmap"; `README.md:824` "Its proof for `d ≥ 2` is not part of this roadmap" | repaired |
| ~1a/F02 (P3) locators of uniqueness | `README.md:417` "are proved here from the definition of §5.1 and are stated in none of the sources: DengHaniMa2024 Proposition 1.2, lines 182–183, gives existence and uniqueness only off a closed Lebesgue-null set"; same in `Suggested.lean:257-260` | repaired; DengHaniMa2024 lines 182–183 and GST2013 lines 848–854 read |
| ~1a/F03, ~1b/F03 (P3) locators of the two-sided bound | `README.md:758` "the two-sided bound with the constant `ω_d ‖ρ⁰‖_∞` is proved here and is stated in neither source"; `Suggested.lean:400-402` | repaired; BGSS2023 lines 211–217, DengHaniMa2024 lines 246–252 read |
| ~1a/F04 (P3) closed set cited to the open-set sources | `Suggested.lean:192-194` "(DengHaniMa2024 (1.1), lines 150–153; GST2013 lines 839–841 and BGSS2023 lines 137–142 use the open set with strict inequalities"; `README.md:216` separates the two | repaired; DengHaniMa2024 line 153 has `≥ ε`, GST2013 line 841 has `> ε` |
| ~1a/F05, ~1b/F05 (P3) `*Needs:*` of §9.6 | `README.md:767` "*Needs:* §1.1, §3.1, §9.3, §9.5, Mathlib `EuclideanSpace.volume_ball`" | repaired (every input of the route at `README.md:758` is listed) |
| ~1a/F06 (P3) restating Check of §4.4 | `README.md:367` "`d = 1`, ε = 1, `s = 4`: on the rectangle `a ∈ (2, 3)`, `u ∈ (−1, −1/2)`, of area `1/2`" | repaired; recomputed: `τ = (a − 1)/(−u) < 4`, `B_4 = (2 − a − 4u, −u)`, determinant 1, image in `{a > 1}`; inelastic rule gives the single state `(1, 0)` |
| ~1b/F01 (P2) §9.6 without `μ > 0`, `∫ f⁰ < ∞` | `README.md:758` "for `0 < ε < ρ`, `μ > 0` and a measurable `f⁰` with `∫ f⁰ < ∞`"; Check `README.md:763`; `README.md:747` "`ε = 0`, `μ > 0`, `∫ f⁰ = 1`"; `README.md:849` "for every `μ > 0` and every finite mass" | repaired; both witnesses recomputed (`0.39894 ≤ 0` false; `0.1 ≤ 0.02` false) and now excluded |
| ~1b/F04 (P3) `μ_ε` at `d = 0` | `README.md:30` "The exponent `d − 1` is a natural number, so for `d = 0` the Lean expression is `ε⁻¹ ^ 0 = 1`, not `ε^{−(0−1)} = ε`" | repaired |

## Verified sound

Counts: 33 declarations of `Suggested.lean` read (every line) and compared with the 33 elaborated
types of the worker's signature transcript; 45 README targets read (every line of the README); 52
cited line ranges opened (GST2013 22, BGSS2023 19, DengHaniMa2024 11), each containing the cited
object except as in S01; 181 Check bullets read, the numerical ones recomputed, all correct, one
block not discriminating (S03); 9 sibling citations resolved; 24 pinned declarations opened.

Binders. No Lean was run. The 23 "lost binder" leads of the transcript are false: every theorem
that uses the flow carries `[ProperSpace X] [MeasureSpace X] [BorelSpace X]
[FlatPositionSpace d X]`; `partitionFunction`, `grandCanonicalDensity` and `grandCanonical` carry
`[NormedAddCommGroup X] [MeasureSpace X]` only, which is all their bodies use; `LanfordStatement`
takes `[FlatPositionSpace d (UnitFlatTorus d)]`, as `README.md:824` says. Each elaborated type
equals its README statement; nothing changed.

Suppliers. ClassicalErgodicTheory §3.5 items 1, 3, 4 and §0.2 read at the head of its open pull
request (a new roadmap folder of another author): item 1 extends by the identity and gives a
jointly measurable measure-preserving family with the group law; item 3 has the "iff" on component
restrictions; item 4 is `(Φ t)_* (μ.withDensity W) = μ.withDensity (W ∘ Φ (−t))`; §0.2 assumes a
finite invariant measure. MathematicalBilliards §10.5 and ProbabilisticAndMetricNumberTheory §4.9a
(`scalarLpKoopman_strong`) exist on main. Pinned: `TauCeti.Semigroups.StronglyContinuousGroup` has
exactly the three fields the README lists; `multivariateGaussianPDFReal u (β⁻¹ • 1)` is
`(2π)^{−d/2} β^{d/2} exp(−β|v − u|²/2)`; `card_smul_empiricalFiniteMeasure` holds for empty `κ`;
`toSphere_apply_univ`, `haarMeasure_quotient` (needs `IsFiniteMeasure`, a countable subgroup, a
right-invariant Haar measure), `det_reflection`, `Submodule.quotientRel`, `proper_of_compact`,
`integral_eq_sub_of_hasDerivAt_of_le` are as described.

Ownership. `roadmaps grep` for hard spheres, Lanford, Boltzmann–Grad, BBGKY, Maxwellians, collision
operators, flat tori, grand canonical measures and correlation functions over main and the open
heads: no second owner. Pinned Mathlib and Tau Ceti have no flat torus, hard-core set or collision
operator; Tau Ceti's Maxwell–Boltzmann material is the law of `‖·‖` under a Gaussian, another
object. No declaration name collides with a readable roadmap. The pull request changes only
`packages/HardSphereDynamicsAndKineticLimits/`.

Policy and headlines. No `lemma`, `set_option`, `#eval`, `True` placeholder, sorry'd data, process
word or machine path; one `import Mathlib`. Headlines (trajectory uniqueness, Alexander's theorem,
the measure-preserving reversible group, weak Liouville, grand canonical invariance, the correlation
identity, the Boltzmann–Grad scaling, the law of large numbers and its corollary) are all stated;
none follows by one tactic or one library lemma. The hypotheses of `LanfordStatement` allow a
slightly wider class than BGSS2023 (1.1.5) (two bounds by `C₀` instead of one bound on the sum;
Lipschitz instead of a gradient bound); the proposition for `C₀` follows from the source's at `2C₀`,
`T₀` being existential.

The adversarial table (values computed on each side):

| Statement | Instances tried | Values | Result |
|---|---|---|---|
| `FlatPositionSpace` | `E`, ρ = ∞; `𝕋²`; sup-norm torus, `s = 0.1`; torus with norm `min(dist, c)`, ρ ≤ c; `d = 0` | axioms hold; ρ = 1/2, `‖(½,½)‖ = 0.7071`; lift norm `0.1414 > 0.1`; axioms hold and `‖ξ‖ ≥ ε` unchanged for ε < ρ; point of mass 1 | sound; every §1.1 API bullet rederived from the axioms |
| `shortLift` | `𝕋²` class of `(0.9, 0)`; `‖ξ‖ ≥ ρ`; `ξ = 0` | `(−0.1, 0)`; 0; 0 (unique by injectivity) | sound |
| `FlatTorus`, instances, `UnitFlatTorus` | `2ℤ × ℤ`; mass-1 normalisation, ball of radius 1/4 | covolume 2, ρ = 1/2; `π/16` against `π/32` | sound |
| `scatter` | ν = (1,0), `v = (0,.9)`, `w = (.9,0)`; ν = 0 | `((.9,.9), 0)`, energy `1.62 = 1.62`; identity | reflection in `(ν, −ν)^⊥`, determinant −1 |
| `contactScatter`, `reversal` | contact pair `(i, j)` and `(j, i)`; ε = 0; ε ≥ ρ; no matching | second component of `σ_ν` recovered from `ν_ji = −ν_ij`; normal 0; normal 0; identity | involution for every real ε |
| `IsTrajectory` | head-on witness; `J = [0,1] ∪ [2,3]`; jump with no contact | seven conditions hold, `𝒯 = {1}`; two paths agree at 0, differ at 2 (0 against 5); (6) and (7) force continuity | every path satisfying it is a hard-sphere motion |
| `IsTrajectory.eqOn` | forward from the supremum, backward from the infimum; ε = 0; ε ≥ ρ | velocity fixed by (6) and by `σ_M` injective in (7); no contact possible (`0 < 0`) | true for every ε |
| `volume_hardCoreSet_diff_goodSet` | `N = 2`, `a = (−2,1)`, `u = (−1,0)`; `d = 1`; `d = 0`; route constant | `D = 0`, past grazing, null cylinder; `D = u²ε²`, null contact set; `𝒟̄ = ∅` for `N ≥ 2`; `576π⁴ ≈ 56108` | true; `G` Borel because the second-nearest distance has a positive minimum on `[0, t]` |
| `flow_add`, `flow_reversal` | ε = −1, `d = 1`; circle, ε = 1/2; ε = 0, `d = 1` | positions `−2, 0` both ways, `(3, 0; 1, 0)` both sides; `G = ∅`; ℛ negates `V`, `G` invariant | true for every ε |
| `measurePreserving_flow` | `DC` at head-on; `d = 1` fixed and variable time | `(−1)(−1)(−3 + 4) = 1`; 1 and 0 | true |
| `weak_liouville` | `χ(t)ψ(H)`; continuity at a collision without continuity of `φ`; non-specular box; `d = 0` | `(∫W⁰ψ)(∫χ' + χ(0)) = 0`; both one-sided limits are `φ(t_c, ·)` by `hderiv` and `hspec`; `−1 ≠ 0`; `w(∫φ' + φ(0)) = 0` | true |
| `partitionFunction`, `grandCanonical` | μ = 0; ε = 0, μ = 2; `Z = ∞` | `Z = 1`; `e²`, `P(N = 1) = 0.27067`; zero measure | sound |
| `grandCanonical_flow_invariant` | `u ≠ 0`; `X = E` | `Σ|v_i − u|² = 2H − 2⟨u,P⟩ + N|u|²`; zero measure | true |
| `lintegral_sum_distinct_eq_correlation` | μ = 0, `n ≥ 1`; `n = 0`, μ = 0; `Z = ∞` | `0 = 0ⁿ · ∫(∞ · 0)h`; `h(∅) = h(∅)`; `0 = 0` | true |
| `boltzmannGrad_scaling` | `d = 1`; `d = 3`, ε = 0.01; `‖ρ⁰‖ = ∞` | `1 − 2ε‖ρ⁰‖ ≤ E[N] ≤ 1`; `[0.9581, 1]`; left side 0 | true |
| `collisionOperator`, `IsMildBoltzmannSolution` | `d = 1`; `1_{|v| ≥ 1}`, `d = 2`; `M_{β,u}`, `u ≠ 0` | `σ_ω(v,w) = (w,v)`, `Q = 0`; speeds `r/√2`, gain infinite; bound holds with `β' < β` | sound |
| `tendsto_empirical_of_correlation` | `d = 0`, `f⁰ = a`; `F_2 → 2f⊗f`; `d = 1` | `F_1 = a/(1 + μa) → 0 = f`, `π = N/μ → 0`; limit `m²`; `1 − e⁻¹ = 0.63212` | true; no hypothesis on ε is needed (eventually `ε < ρ`) |
| `LanfordStatement` | `d = 0`; cover `π ∘ B`; Scheffé step | `1/2 ↛ 1`; `B` orthogonal, `ρ' ≤ 1/2`, conjugation by `(X, BV)`; `∫|F − g| = ∫F − 1 + 2∫(g − F)⁺` | same proposition for every structure; clause 1 follows from clause 2 |
| `LanfordStatement.tendsto_empirical` | derivation from the two above | `μ_ε → ∞` iff `d ≥ 2`; `∫|f(t)| ≤ C(2π/β)^{d/2}` | true |
| Prose targets §1.4, §2.2, §4.1–4.5, §6.1–6.3, §8.3–8.4, §9.5–9.6, §10.1–10.2 | every numerical Check | `0.12566`; `π|k|, 2|k|, |k|`; `D = 1, 0, −3`; `τ = 2.2`, `(0.28, 0.96)`; `DC` rows; `0.48 < 0.5`; `2.0053/Z < 2.5066/Z`; `e^{−1.62}`; `M(0)π√(8/π)` | all agree |

## Not verifiable

- Alexander1976, AlexanderThesis1975, Lanford1975, CIP1994, Spohn1991, Uchiyama1988: uncertified;
  cited by locator only, the texts were not read.
- The uniform-on-compact-sets clause of `HardSphere.LanfordStatement` rests on the statement of
  BGSS2023 Theorem 1 (lines 316–321), which gives no proof and refers to four other works.
- No Lean was run in this pass; elaboration was taken from the worker's signature transcript.
- ClassicalErgodicTheory is not in `merge-order/ORDER.txt` and its files are not among the listed
  sibling checkouts; it was read with `roadmaps show`. The direction of that edge rests on the rule
  for open pull requests that add a roadmap folder; the dependency check reports no problem.
- Ownership against open pull requests was checked through `roadmaps grep` over the 458 indexed
  heads, not by opening each checkout.

## Copyright, licences and scope

Wording: the 52 cited ranges and 6 further passages (the docstrings of `IsTrajectory` and
`LanfordStatement`; the definitions of §8.3 and §9.3; the routes of §6.3 and §10.5) were set beside
GST2013 lines 828–960 and 2036–2084, BGSS2023 lines 116–372 and DengHaniMa2024 lines 136–300. No
sentence is shared; the common runs are formulas and standard names. Arrangement: GST2013 has 45 of
the 107 README locators; its chapters run Liouville equation, Boltzmann equation, main results,
`N`-particle flow and hierarchy (4.1–4.4), then the hierarchy estimates; the ten layers run position
spaces, scattering, phase space, two-body problem, trajectories, Alexander's theorem, flow,
densities, ensembles, limit. Only Layer 6 ↔ §4.1 and part of Layer 8 ↔ §4.2–4.3 correspond, in an
order the `*Needs:*` lines of §7.1 (§6.4) and §8.2 (§7.1) force. Reuse: no table, figure or list
taken over.

Source independence: 58 passages compared with 3 sources, none shared; largest share GST2013, 45 of 107 locators; contents compared with GST2013: independent.

## Source issues

- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p. 4 (lines 186–187): the source says the time-`t` flow maps are diffeomorphisms of the domain minus one fixed null set; it should be measure-preserving bijections, discontinuous at data colliding exactly at time `t`; affects nothing.
- **Gap** in DengHaniMa2024 at Proposition 1.2(2), printed p. 4 (lines 185–188): the source says the uniform bound on the number of collisions is proved in Alexander's thesis; it should cite the later theorems of Vaserstein and of Burago–Ferleger–Kononenko; affects nothing.
- **Gap** in BGSS2023 at the proof of Corollary 1.2.1, printed p. 5 (lines 370–371): the source says the variance tends to 0 because the correlation functions converge almost everywhere; it should pass to the limit of the integrals, by Scheffé's lemma with the conserved mass; affects the proof.
- **Gap** in GST2013 at the proof of Proposition 4.1.1, printed p. 28 (lines 879–880): the source says grazing collisions are removed up to a null set, with no argument; it should be justified, for instance by the null set of tangent relative data in pair coordinates; affects the proof.

## For the human reviewers

- **Licence.** Six of the nine sources in `sources.toml` are uncertified, among them the primary sources of both named theorems (Alexander1976 Proposition 4.3; Lanford1975); statements were checked against GST2013, BGSS2023 and DengHaniMa2024 only.
- **Scope.** `HardSphere.LanfordStatement` (`Suggested.lean:477`) is a defined proposition that this roadmap does not prove; `HardSphere.LanfordStatement.tendsto_empirical` assumes it, and no roadmap on main or in an open pull request plans its proof.
- **Scope.** The only locator for the proposition as typed (torus, grand canonical) is BGSS2023 Theorem 1, lines 316–321, stated there without proof; the cited proofs are for `ℝᵈ` with fixed `N` (S01).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3bffb468c0a271d1e045de6fa6e6e3df88484201", "job": "RT-HardSphereDynamicsAndKineticLimits~2a", "model": "fable", "worker": "chris-x82"} -->
