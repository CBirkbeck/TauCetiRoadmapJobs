# Review of HardSphereDynamicsAndKineticLimits (design, round 3)

**Verdict:** needs changes

Seven findings: one P1, three P2, three P3; four blocking. The design is repairable. The README, plan and sources manifest were not edited. All locations below are repository-relative. No maintainer notes were supplied.

This is the design lane. There is no `Suggested.lean` in this package. Elaboration is **not available (this lane does not elaborate; say so in the report)**. No Lean command was run, and no passing build or warning audit is claimed.

## Previous findings, checked first

The preceding review is `packages/HardSphereDynamicsAndKineticLimits/reports/REV-DESIGN-HardSphereDynamicsAndKineticLimits~2.md`; the repair report is `packages/HardSphereDynamicsAndKineticLimits/reports/FIX-DESIGN-HardSphereDynamicsAndKineticLimits~3.md`. Locations in this table refer to `packages/HardSphereDynamicsAndKineticLimits/design/README.md`.

| Round-2 finding | Status | Repaired passage and independent check |
|---|---|---|
| R01, free boost | Repaired | Line 262: “`S_t ∘ B_c = A_{π(t c)} ∘ B_c ∘ S_t`”. For x=v=0,t=c=1, both corrected sides are (1,1); plain commutation gives (0,1). Plan 3.4 agrees. |
| R02, physical identities off G | Repaired | Line 519: “for every `Z ∈ G`”; line 544: “Galilean covariance on the good set”. For a=(2,1),u=(−1,0), D=0: T₁ fixes x₁=(2,1), while S₁ gives (1,1). This input is now excluded from the physical identities. |
| R03, full pair-map composition | Repaired | Line 358: “fix every other coordinate”; line 471: “each coordinate is moved exactly once”. The four-particle positions (0,2,20,22), all speeds .1, become (.1,2.1,20.1,22.1), not (.2,2.2,20.2,22.2). |
| R04, factorial counts | Repaired | Line 713: “`E[Nat.descFactorial N n]`”; line 622: “for `s < N`”; line 634: “for `s ≤ N`”. Counts at (N,n)=(0,1),(1,2),(3,2) are 0,0,6. The separate missing specular hypothesis in plan 8.3 is R03 below. |
| R05, finite phase volume | Partly repaired | Line 562: “`𝒟̄_1 = X × E` has measure `1 · ∞ = ∞`”; the cutoff integral is 2. Correct for N=d=1. The new universal infinite-mass assertion at line 581 and plan 7.4 fails for empty or null position sectors: R01 below. |
| R06, admissible tests | Partly repaired | Line 609: “bounded measurable `a`”; line 615: “θ smooth with compact support”. The multiplier rule and bounded derivative repair hold. The modified non-specular Check still cannot use a nonzero L¹ density at a fixed collision time: R05 below. |
| R07, positive inverse temperature | Repaired | Lines 713 and 762 explicitly require “`β₀ > 0`” and “`β > 0`”. The β=0 profile has divergent gain; positive β gives a Gaussian times a linear velocity moment. |
| R08, integrated Gaussian factor | Repaired | Line 713: “`K = μ_X(X) (2π/β₀)^{d/2}`”. In the unit-circle witness, 2.0053026/Z ≤ 2.5066283/Z. The double exponential-series bound also includes both integrated indices. |
| R09, dimension-one LLN | Repaired | Line 810: “for `d ≥ 2`”; line 815 computes “`1 − e^{−1}`”. At d=1, μ=1 and the failure probability tends to .6321206; at d≥2, μ⁻¹ tends to 0. |
| R10, zero density/diameter | Repaired | Line 681: “When `∫ f⁰ = 0` the measure is the vacuum law”; finite truncation requires “`0 < ε < ρ`”. Vacuum gives Z=1; ε=0,μ=1,∫f⁰=1 gives Z=e with infinitely many positive terms. |
| R11, numerical Jacobian Check | Repaired | Line 338 specifies the four rows of DC; line 339 specifies “the fixed-time map”. Determinants are 1 for DC and fixed-time Bₛ, and 0 for B_(τ+.7). |
| R12, mild-solution API/sign | Repaired | Lines 779–781 give initial value, restriction and characteristic APIs. Line 787 gives “`0.5 M(1)`” versus “`1.5 M(1)`”, approximately .1209854 versus .3629561. Continuity makes the failure positive-measure, as required by an a.e. definition. |
| R13, Alexander attribution | Repaired | Line 497: “Alexander1976 Proposition 4.3”; manifest retains the original keys. GST2013 line 855 cites [2], identified at lines 5439–5440 as Alexander; Lanford is [34] at line 5507. The original Alexander text remains uncertified. |

No finding was marked “not actionable in this package”; no settled finding is re-raised. Eleven repairs are complete and two are partial. Changed statements, changed Checks and their downstream uses were read anew. Earlier computed rows were used only for unchanged assertions they actually tested; they did not certify every API clause or every allowed carrier.

## R01 (P1) — The revised infinite-phase-volume assertion contradicts the packing example

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:581`, “infinite for `N ≥ 1` on every position space”; `packages/HardSphereDynamicsAndKineticLimits/design/plan.json:1442` repeats it.

**Claim:** Every non-vacuum hard-core phase sector has infinite measure because its velocity space is infinite.

**Witness:** Unit torus, d=2, ε=.4, N=8: §1.4 gives 8π(.2)²=1.0053096>1, hence the position sector is empty. Its phase measure is 0, not ∞; §9.2 explicitly uses this example.

**Exact repair:** Let q_N be the measure of admissible positions. For N≥1 state that the phase mass is 0 when q_N=0 and ∞ when q_N>0; it is always σ-finite. Retain the correct N=d=1 cutoff Check. In line 581 qualify the Euclidean energy-sublevel assertion by N≥1 and r>0: at r=0 the velocity sublevel is null and the restricted measure is 0. Update plan 7.4 and add the empty-sector negative control. On the witness q₈=0 gives phase mass 0; on the unit circle q₁=1 gives ∞ and the r=1/2 cutoff gives 2.

## R02 (P2) — The convention comparison uses an uncontrolled endpoint left limit

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:425`, “equals `(X(t), V(t−))`”; `packages/HardSphereDynamicsAndKineticLimits/design/plan.json:999`. The interval definition is at README line 381.

**Claim:** Every trajectory on an interval has the stated ambient left-limit comparison at every time of that interval.

**Witness:** N=1,d=2,J=[0,1], x(t)=0, V(t)=0 for t≥0 and V(t)=e₁ for t<0. This satisfies §5.1 on J. At 0, σ_MV(0)=0 but V(0−)=e₁.

**Exact repair:** State the comparison for global trajectories, and retain the general interval version at times approached from the left within J. At a least endpoint define the incoming endpoint value by σ_MV(t), without identifying it with an unconstrained extension's left limit. Specify relative one-sided continuity on intervals. State agreement with DengHaniMa2024 Definition 1.1 for the Euclidean d≥2 specialization and the corresponding initial incoming state; its source carrier is Euclidean (DengHaniMa2024 lines 140–153). Mirror this in plan 5.4 and its Checks. The witness is excluded from the ambient comparison at 0 and gives 0=0 at every t∈(0,1]. This preserves the general interval and torus theory.

## R03 (P2) — Plan 8.3 drops the hypothesis needed for specular marginals

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/plan.json:1625`, “it inherits the specular condition”; hypotheses at lines 1626–1630 and API at line 1654. README line 622 correctly requires the parent density to satisfy that condition.

**Claim:** Symmetry, nonnegativity and hard-core support alone imply specular invariance of the marginal.

**Witness:** Set s=N=2,d=2 and W=e^(−|v|²−|w|²)1_(|v|≤1)1_(|w|≤1)1_𝒟̄. At a contact normal e₁, (v,w)=((0,.9),(.9,0)) gives W=e^(−1.62); its scattered state gives 0. The full marginal equals W.

**Exact repair:** Copy the README's parent specular-condition hypothesis into the plan statement, hypotheses and `marginal_specular` API. Retain symmetry/support as separate hypotheses. Add the full-marginal counterexample. The missing hypothesis rejects this W; the Maxwellian product gives equal values before and after scattering. The numerical discrepancy is .1978987 versus 0.

## R04 (P2) — The iteration route replaces an image subset by the whole enlarged region

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:485`, “the measure of those failing at step `j` is the measure of the complement”. This supplies plan target 6.3.

**Claim:** Preservation onto the image identifies the first-failure measure with the entire bad set in the enlarged position region.

**Witness:** On ℝ take N=3,ε=R=1,δ=2,t=3,K={0},j=1. No initial hard-core configuration has all positions in K, so failure mass is 0. The enlarged interval (−2,2) contains open bad configurations near (−1.1,0,1.1), of positive mass.

**Exact repair:** Denote by A_j the image of initial configurations surviving the previous j steps. Then the first-failure mass equals λ_N(A_j∩Sᶜ), which is **at most** the bad-set measure in the jRδ-neighbourhood. Apply §6.1 to that upper bound. For arbitrary δ count ceil(t/δ) steps, or use δ=t/m for the limiting argument. The theorem's O(δ) conclusion survives. On the witness A₁ is empty, so the corrected relation is 0≤a positive number. This does not require a new supplier.

## R05 (P3) — The revised non-specular Check still has no nonzero L¹ witness

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:616`, “colliding once at time τ”; plan 8.2, `non_specular`, at line 1610.

**Claim:** A nonzero L¹ initial density can be concentrated at one collision time and its weak residual factored into a single velocity jump times its mass.

**Witness:** For a fixed τ, first-contact data satisfy |a+τu|=ε. For each u this is a translated sphere, hence position-null. Fubini makes the full set null: an L¹ density supported there has mass 0 and residual 0.

**Exact repair:** Use a positive-measure neighbourhood with variable τ(Z) and keep the jump inside the integral. An explicit replacement: d=1,N=2,ε=1; uniform probability on x₂∈(0,.01), a∈(1.99,2.01), v₁∈(−1.02,−.98), v₂∈(−.02,.02). Choose χ=1 on [.9,1.1] with compact time support, and θ=1 on [.47,.53] with compact energy support. Then τ(Z)∈(.9519,1.0521), H∈(.4802,.5204), and each trajectory has one collision. The weak residual is ∫W⁰(v₁−v₂)=−1. Update both Checks. The boundedness and multiplier repairs remain correct; no test theorem belongs in `Suggested.lean`.

## R06 (P3) — Several Checks omit the instance that makes their claimed value true

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:489`, “the neighbourhoods of `K` are all of `X`”; also lines 563, 675, 707 and 734, and the corresponding plan tests.

**Claim:** These examples assert their stated values for all objects allowed by their surrounding sections.

**Witness:** On the unit circle B(0,1)=X, so the line-563 indicator is velocity-only and ‖U_tf−f‖∞=0, not 1. At N=0 the line-675 Euclidean ensemble has mass 1, not ∞.

**Exact repair, with controls:**

- §6.3: say “take K=X on the unit torus”. For K={0}, its zero-radius neighbourhood has mass 0 whereas X has mass 1; for K=X both are X.
- §7.4: explicitly take X=E in the p=∞ non-example. On ℝ, f=1_((-1,1)×(.5,1.5)) has norm difference 1 for every sufficiently small nonzero t; on the unit circle the original radius-one example has difference 0. Mirror this in plan `p_infinity`.
- §9.2: require N≥1 for infinite Euclidean mass. N=0 is the vacuum, with mass 1, and is permitted throughout the roadmap.
- §9.4: use the concrete smooth profile ρ(x)=1+.5cos(2πx) on the unit circle. Merely nonconstant measurable ρ is insufficient: ρ=1+1_{x=0} is nonconstant but equals 1 a.e., so its measure is the invariant Maxwellian measure. The cosine profile at t=1/4,x=0,v=1 changes its density factor from 1.5 to 1 under free transport.
- §9.6: specify a positive datum, for example a Maxwellian, when asserting a strict inequality at coincident positions. A compactly supported probability velocity density evaluated outside its support gives F₂=0=f⁰⊗f⁰ there. A Maxwellian gives 0<M(v₁)M(v₂).

These are Check repairs, not restrictions on the general theorems.

## R07 (P3) — Some sampled locators do not contain the attributed result

**Location:** `packages/HardSphereDynamicsAndKineticLimits/design/README.md:544`, “GST2013 lines 211–215; BGSS2023 lines 184–187”; the same attribution occurs at line 413. Related mismatches are line 634 and line 669, with their plan locators.

**Claim:** The cited passages support the full symmetry, general symmetric-expectation and canonical-equilibrium statements.

**Witness:** GST2013 lines 211–215 and BGSS2023 lines 184–187 discuss exchangeability, not reversal or boosts. GST2013 lines 216–220 define only the first marginal. BGSS2023 lines 158–160 describe fixed particle number, without the Maxwellian canonical measure.

**Exact repair:** Separate attribution from derivation. For §§5.3/7.3 retain those locators only for relabelling, and identify reversal/translation/boost covariance as consequences proved here from the scattering identities, trajectory definition and uniqueness. Cite the scattering source GST2013 (4.1.1)–(4.1.2), printed p.27, lines 835–847, for its input. For §8.4 use the general distinct-label identity BGSS2023 (1.1.9), printed p.3, lines 241–266, and explain the fixed-N proof by symmetry and counting injections. For §9.2 label BGSS2023 printed p.2, lines 158–160 as the canonical formalism only, and identify the invariant-density and Maxwellian specialization as this roadmap's consequence of §§7.2–7.3/9.1. Include §7.3 in that target's Needs, since §3.5 only supplies conservation for free/contact maps. Update plan locators accordingly. The computed boost (1,1), injection count 6, and N=1 canonical mass 1 stay unchanged; the unsupported attributions disappear.

## Verified sound

### Coverage and principles

Read all 854 README lines, all 45 plan statements with their APIs and 159 planned Checks, all 45 Needs blocks, all 10 layer-dependency paragraphs, and all 9 source entries. Every plan target has at least three Checks; dependency references resolve to earlier targets. There are no supplier gaps, no plan suppliers, and no upstream roadmap consumed through a future revision.

The scope develops the microscopic library at d≥1 on its flat-position-space carrier, with d≥2 explicitly required for the Boltzmann–Grad LLN application. The restrictions ε<ρ and β>0 are mathematical hypotheses, with separating examples, not route-specific shortcuts. No re-planned hard-sphere roadmap, copied source passage, executable computational algorithm, source-chapter layer title, or source-order dependency policy was found. The layers run from local geometry/scattering to trajectories, null exceptional sets, transport and correlations because the displayed dependencies require those inputs. The scattering Jacobian is a mathematical derivative computation.

The previous computed table was usable for the unchanged scattering, shell, collision-time, hard-core, Maxwellian and initial-chaos identities; their displayed numbers were re-evaluated where they enter sampled or repaired targets. It was not used to excuse the new infinite-volume generalization, the plan-only specular omission, interval endpoints or inaccurate source attributions. The table below records the sampled targets, headline results and every target touched by a finding; numerical values are calculations, not reports of unperformed Lean tests.

### Adversarial table

Here E is Euclidean position space, the circle has circumference one, and the head-on witness is ε=1, x₁=2e₁,x₂=0,v₁=−e₁,v₂=0. Values on excluded inputs are deliberately included.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| 1.1 flat carrier and lift | Unit 2-torus; supremum-norm wrong carrier | ‖π(.5,.5)‖=√.5=.7071068; ℓ(π(.9,0))=(−.1,0), norm .1. Sup-norm π(.1,.1) has norm .1 while every Euclidean lift has norm≥√.02=.1414214. | Euclidean quotient passes; sup carrier excluded. |
| 1.3–1.4 local normalization | 2ℤ×ℤ; unit torus packing | Ball radius .25 has π/16=.1963495, versus .0981748 after wrong probability normalization. Eight radius-.2 discs demand 1.0053096>1. | Sound adapter and packing; supplies R01 witness. |
| 2.1 scattering/conservation | ν=e₁, v=(0,.9),w=(.9,0); ν=0 wrong parameter | Output ((.9,.9),0); P=(.9,.9) and twice-energy 1.62 on both sides. ν=0 gives identity determinant +1, versus −1 required only for unit ν. | Unit hypothesis needed; API, not headline padding. |
| 2.2 kernel normalization | d=1,2,3, |k|=1 | Integrals 1,2,π; probability-normalized d=3 integral 1/4. Θ carries kernel .9 to .9. | Sound. |
| 3.1–3.3 hard core/reversal | Torus pair .05,.95,ε=.4; outgoing contact | Torus distance .1<.4, representative distance .9. Reversal of velocities (e₁,0) at contact is (0,−e₁), with outgoing relative normal speed +1. Applying reversal twice returns (e₁,0). | Sound. |
| 3.4 free transport/boost | x=v=0,t=c=1; free hard-core penetration | S₁B₁=(1,1)=A₁B₁S₁; B₁S₁=(0,1). At head-on t=1.5 free separation .5<1. | Repair sound. |
| 4.1–4.2 collision root/map | Head-on; tangent a=(1,3),u=(0,−1) | Head-on D=1,τ=1,B₃=(3e₁,e₁); wrong root 3 crosses the ball. Tangency D=0,τ=3,q=e₁. | Nongrazing/grazing distinction correct. |
| 4.3 Jacobian | Displayed 4×4 DC; d=1 variable time | det DC=(−1)(−1)(−3+4)=1; det DB₃=1. Fixed map (2−a−su,−u) has det 1; variable-time (1−.7u,−u) has det 0. | Repair sound. |
| 4.4 pair preservation | d=1, a∈(2,3),u∈(1,2),s=1 | No collision: image (a+u,u) has area 1=source area 1. Frozen velocity-only reflection has determinant −1; full map +1. | Sound change-of-variables route. |
| 4.5 / 6.2 disjoint blocks | Three/four positions 0,2,20,(22), speeds .1 | P¹² moves to (.1,2.1,20); full step to (.1,2.1,20.1,22.1). Old full-map product moves all four by .2. | Repair sound. |
| 5.1–5.2 trajectory uniqueness/gluing | N=1; head-on at times 1,3 | Contact state has velocities (0,−e₁), not (−e₁,0); from time 1 to 3, second position goes 0→−2e₁ in both glued paths. N=1 gives x(t)=x(0)+tv. | Sound right-continuous uniqueness. |
| 5.3 trajectory symmetry | Head-on boost c=e₁ | Boosted time-3 positions (4e₁,e₁) and velocities (e₁,0); original positions (e₁,−2e₁)+3e₁ give the same values. | Mathematical identity sound; locator R07. |
| 5.4 convention comparison | N=1,J=[0,1], extension V=e₁ on negative times | σ_MV(0)=0 while V(0−)=e₁; at t=.5 both are 0. At an interior head-on collision σ_M(0,−e₁)=(−e₁,0)=V(1−). | R02. |
| 5.5 / 6.4 exceptional set | N=1; two-body tangent versus head-on | N=1 complement empty, measure 0. Tangent has D=0 and is excluded; head-on D=1 is good. Bound Cδ→0 gives exceptional mass ≤0. | Null-set conclusion sound. |
| 6.1 near triples | d=1,N=3,K=[−3,3],ε=R=1,η=.1; N=2 | Shell length .2. Ordered-triple Fubini bound 6·6·.2²·4π/3=1.92π≤27·6·.2²·4π/3=8.64π. N=2: I mass 0. | Explicit bound supports generalization of source lemma. |
| 6.2 chart restriction | Circle ε=.3,R=1 | δ=.045 gives near radius .39 and maximum chart separation .48<.5. δ=.09 can require .47+.18=.65>.5. | Stronger chart condition needed and present. |
| 6.3 iteration | δ and δ/2; R04 empty initial region | On unit circle,d=1,N=3,ε=.1,R=1,t=.1: bounds with δ=.01,.005 are .576π and .288π, respectively, from ceil(t/δ) shell bounds. R04 failure mass 0 versus positive entire-neighbourhood bad mass. | O(δ) survives; equality in route needs R04. |
| 6.3 torus Check | K={0},j=0; K=X | Neighbourhood mass 0 versus claimed mass 1; K=X gives 1=1. | R06. |
| 7.1 flow/group | Head-on T₃ then T₋₃; off-G tangent | Positions (2,0)→(1,−2)→(2,0), velocities (−1,0)→(0,−1)→(−1,0). Off G, T₁Z=Z; S₁ changes (2,1) to (1,1). | Group law and repaired physical identity consistent. |
| 7.2 measure preservation | Noncolliding shear; off-G extension | Local determinant 1 gives λ(TA)=λ(A); on off-G identity piece λ(TA)=λ(A). Inelastic collapse would give image mass 0 from positive source mass. | Route uses owned two-body theorem and injective pieces. |
| 7.3 flow symmetries | Head-on reversal; boost off G | ℛT₃ has positions (e₁,−2e₁), velocities (0,e₁), equal to T₋₃ℛ. Off-G boosted positions remain ((2,1),0), versus ((3,1),(1,0)) in the excluded covariance formula. | Repair sound; attribution R07. |
| 7.4 Koopman/cutoff | N=d=1 circle; same indicator on ℝ | Full phase mass ∞; ∫1_(H≤1/2)=2, invariant. Circle radius-one position indicator has norm difference 0; ℝ version gives 1 for small t≠0. | Finite-p theorem survives; R06 fixes L∞ Check. |
| Layer 7 example | d=2,N=8,ε=.4 torus; E,N=1,r=0 | Phase mass 0 versus claimed ∞. Zero-energy restriction has mass 0 versus claimed ∞. | R01. |
| 7.5 grand phase space | N=0,1,8 in packing example | Vacuum mass 1/0!=1; N=1 mass ∞ with factor 1; N=8 mass 0/8!=0. Particle number stays 0,1,8 respectively. | Sound and internally refutes R01 claim. |
| 8.1 transported density | One particle t=1,x=v=e₁ | W(1)(e₁,e₁)=W⁰(0,e₁); wrong sign evaluates W⁰(2e₁,e₁). Invariant Φ(H,P) has identical argument at ±t. | Sound sign/duality. |
| 8.2 weak equation and bounded tests | χ(t)ψ(H); cutoff head-on | ∫₀∞χ′+χ(0)=0. At collision, cutoff test has derivatives χ′(1)−χ(1),χ′(1)+χ(1), values both χ(1). Without cutoff Lφ=M→∞. | FTC route and bounded-multiplier repair sound. |
| 8.2 non-specular Check | Fixed τ; replacement open box | Fixed-time supporting set mass 0, residual 0. Replacement box has average v₁−v₂=−1 and χ=θ=1 at every collision, residual −1. | R05. |
| 8.3 marginal and specularity | Circle N=2,ε=.1; R03 full marginal | First marginal factor .8, versus 1 without exclusion. At s=N the marginal is W; R03 gives e^(−1.62)=.1978987 versus 0 after scattering. | Recursion repaired; plan hypothesis R03. |
| 8.4 symmetric expectations | (N,s)=(3,2),(0,0),(1,2) | Injection counts 6,1,0; truncated factorial ratio at (1,2) gives 1, not 0. For s≤N and h=1, both expectation sides are descFactorial N s. | Formula sound; locator R07. |
| 9.2 canonical/invariant law | N=1 torus; N=8 packing; N=0 Euclidean | Canonical position normalizers 1,0,1; probability masses 1, undefined,1 respectively. Conserved Gaussian exponent 2H−2u·P+N|u|² is unchanged. | Theorems sound; N=0 Check and attribution require R06/R07. |
| 9.3 grand canonical | ε=0,μ=2,∫f⁰=1; f⁰=0 | Z=e², P(N=1)=2e⁻²=.2706706; vacuum gives Z=1,P₀=1, while f⁰/∫f⁰ has mass 0. | Boundary repairs sound. |
| 9.4 equilibrium | Shifted Maxwellian; radial indicator; null-modified ρ | Maxwellian product depends only on conserved (H,P,N). Radial product changes 1→0. ρ=1+1_{x=0} differs pointwise but its measure equals the invariant ρ=1 law. | Invariance sound; Check R06. |
| 9.5 correlation identity/inversion | Vacuum; Gaussian circle; Poisson(2) | Vacuum n=1 gives 0=0. Integrated bound 2.0053026/Z≤2.5066283/Z. Poisson factorial second moment 4 times μ⁻²=1. Double absolute series equals exp(2μC₀K), finite. | Repairs sound. |
| 9.6 initial chaos/scaling | d=3,ε=.01,ρ⁰=1; diagonal outside support | ε²E[N]∈[.9581121,1]. On diagonal outside velocity support, both F₂ and product are 0; Maxwellian product instead is positive. | Bound sound; strict Check R06. |
| 10.1 empirical moments | N=0; N=3,μ=2,h=1 | π=0 in vacuum. For N=3, π²=9/4; diagonal 3/4 plus distinct part 6/4 equals 9/4. | Correct normalization and empty carrier handling. |
| 10.2 collision operator | Maxwellian; β=0 profile | Maxwellian gain minus loss 0; at d=3,v=0 normalized loss is M(0)π√(8/π). β=0 example has gain r/√2 on a cone and divergent radial integral. | β>0 repair sound. |
| 10.3 mild characteristic API | d=1 cosine; t=0; restriction S=0 | Q=0 because scattering swaps v,w. Wrong transport gives .1209854 versus .3629561; initial integral 0 gives f(0)=f⁰ a.e. | Repair sound. |
| 10.4 Lanford proposition | Maxwellian on unit torus,d≥2 | Q(M,M)=0; |F₁−M|≤ω_dεM→0; integrated n-particle error→0; for distinct positions the exclusion indicator is eventually 1. | Equilibrium consistency; full convergence proof not claimed here. |
| 10.5 LLN | μ→∞; d=1; wrong F₂ limit | Second-moment error→0+m²−2m²+m²=0. d=1,h=1,δ=.5 gives 1−e⁻¹=.6321206. F₂→2f⊗f instead gives m². | General theorem and repaired d≥2 corollary sound. |

The tests include empty particle populations, empty and null configuration sectors, zero diameter, zero density, tangency, coincident positions, non-unit normals, finite/infinite phase mass, endpoint limits and natural-subtraction junk values. Characteristics p, DVRs and noncommutative groups are not carriers of these real Euclidean statements. The step-map and trajectory constructions were checked for injectivity, sources/targets, matching restrictions and the use of total-flow junk values. None is allowed to infer physical transport off G.

### Seeded source sample

All three readable source entries were inspected in their cached, numbered extractions. The references specify the arXiv versions actually read: GST2013 v2, BGSS2023 v2, DengHaniMa2024 v3. Printed pages below distinguish pagination from PDF page markers. No additional work needed fetching. Six original works are settled uncertified, as listed under Not verifiable; they were not requested again. There are no additional author-marked unverified locators in the design.

| Sample target | Text opened and assessment |
|---|---|
| 1.1 Flat position spaces | GST2013 line 833, §4.1, p.27; BGSS2023 line 119, §1.1, p.1. They supply Euclidean and unit-torus settings, not this new abstract class. Its explicit local lift/measure axioms are the roadmap's unifying definition; the metric and measure adapters were independently checked. BGSS assumes d≥2; the roadmap's d=1 extension is justified by its direct constructions. |
| 3.4 Free transport | GST2013 (4.1.1), lines 835–837, p.27; BGSS2023 (1.1.1), lines 122–123, p.1. Free position velocity and constant velocity match. The shear, group and corrected boost identities follow directly. |
| 6.1 Near-triple estimate | GST2013 Lemma 4.1.1, lines 867–874, p.28. Source uses bounded Euclidean positions, a velocity bound and two shell constraints, obtaining order δ². The roadmap owns the explicit N³ bound and flat-space Fubini adaptation; η>0 and ε+η<ρ give exactly the shell volumes required. |
| 6.3 Iteration | GST2013 lines 875–910, pp.28–29. Source takes t/δ integral, conserves the velocity ball, enlarges position balls and sums order δ² losses. Target's arbitrary δ version requires a ceiling count and restriction to surviving images (R04). |
| 6.4 Alexander | GST2013 Proposition 4.1.1, lines 862–863, p.28, proof through line 910; BGSS2023 lines 132–139, p.1; DengHaniMa2024 Proposition 1.2, lines 182–188, p.4. A.e. finite-particle existence is supported. The roadmap adds Borel bookkeeping and an exact right-continuous total action through its own step construction. Alexander1976 Proposition 4.3 attribution verified through GST2013 line 855 and bibliography lines 5439–5440; original not readable. |
| 7.1 Flow | GST2013 line 862, p.28; BGSS2023 lines 132–139, p.1; DengHaniMa2024 (1.4), lines 173–178, p.4. Sources support a.e. dynamics. Identity extension and collision-time convention are owned here, not attributed as exact source formulas. |
| 7.3 Symmetries/conservation | GST2013 lines 211–215, p.6; BGSS2023 lines 184–187, p.2. These are exchangeability passages. They do not supply the full symmetry attribution: R07. Scattering conservation is supported separately by GST2013 (2.1.3), lines 396–399, p.11. |
| 7.5 Grand phase space | BGSS2023 lines 158–170, p.2; DengHaniMa2024 Definition 1.3, lines 199–209, p.5. Variable-N disjoint components and 1/N! convention match. The auxiliary σ-finite reference measure Λ and exact group statement are roadmap constructions. |
| 8.1 Transported densities | BGSS2023 (1.1.3)–(1.1.4), lines 145–157, p.2; GST2013 (4.3.5), lines 1138–1140, p.32; DengHaniMa2024 (1.10), lines 233–234, p.5. Inverse-time pullback is supported. The roadmap uses measurable/Lp functions, avoiding GST's unsupported ordinary-C⁰ codomain claim (Source issues). |
| 8.3 Marginals | GST2013 (4.2.2)–(4.2.3), lines 929–938, p.29. Integration over discarded particles, recursion and inheritance from the parent's boundary condition match the README. Plan alone omits that last hypothesis: R03. Extra contacts of integrated particles lie on null shells and do not invalidate the README's inherited condition. |
| 8.4 Symmetric expectations | GST2013 lines 216–220, p.6 supplies only the first marginal. BGSS2023 (1.1.9), lines 241–266, p.3 supplies the general distinct-label identity, including the N≥n indicator. R07 corrects attribution, not the repaired formula. |
| 9.2 Invariant/canonical measures | BGSS2023 lines 158–160, p.2 supports fixed-N formalism only. General Φ(H,P) invariance and the explicit Maxwellian ensemble must be identified as deductions here: R07. Finite position mass and Zcan>0 are correctly required. |
| 9.3 Grand canonical measures | BGSS2023 (1.1.5)–(1.1.6), lines 167–181, p.2; DengHaniMa2024 Definition 1.3, lines 199–223, p.5. Weights, product density, exclusion and partition function agree. General integrable f⁰, arbitrary μ, ε=0 and zero-density clauses are explicit elementary extensions; 1+μ∫f⁰≤Z≤exp(μ∫f⁰) justifies them. |
| 10.1 Empirical measure | BGSS2023 (1.2.4)–(1.2.7), lines 324–369, pp.4–5. μ⁻¹ normalization, first moment and diagonal/distinct second-moment split agree. |
| 10.4 Lanford proposition | BGSS2023 Theorem 1, lines 316–321, p.4, with initial bound (1.1.5), line 168, p.2; GST2013 Theorem 4 and Remark 3.1.1, lines 668–696, pp.19–20; Theorem 8, lines 2069–2080, p.49. BGSS supplies the torus grand-canonical statement, compact one-particle convergence and a.e. higher correlations. GST concerns Euclidean fixed-N data and observables and is not independently a source for all torus conclusions. Sequencewise a.e. formulation respects representatives. Full bounded-test convergence also uses uniform integrability from the future hierarchy estimates; this roadmap defines that proposition, does not assert its proof. |

### Pinned declarations and duplication audit

The baseline revisions match `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declaration bodies/signatures were opened at those pins, not inferred from a current web version. The paths in this table are relative to the corresponding library source tree.

| Object / pinned declaration | File and line; relevant contract |
|---|---|
| `EuclideanSpace`, `EuclideanSpace.volume_ball` | `Mathlib/Analysis/InnerProductSpace/PiL2.lean:114`; `Mathlib/MeasureTheory/Measure/Lebesgue/VolumeOfBalls.lean:308`. PiLp 2 carrier and ofReal-radius volume formula. |
| Quotient norm and normed instance | `Mathlib/Analysis/Normed/Group/Quotient.lean:168`, `:222`: infDist formula; closed-subgroup instance. Generated additive names checked via `to_additive`. |
| Quotient Borel and closed discrete subgroup | `Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:649`; `Mathlib/Topology/Algebra/OpenSubgroup.lean:377`: Polish/topological group and closedness, T1/discreteness hypotheses. |
| Lattice, domain, countability | `Mathlib/Algebra/Module/ZLattice/Basic.lean:93`, `:434`, `:645`, `:652`: fundamental domain, span-top lattice class with separate discrete instance, domain theorem and countability. |
| Covolume | `Mathlib/Algebra/Module/ZLattice/Covolume.lean:73`, `:85`: real-valued covolume equals measure.real of a fundamental domain. |
| Fundamental-domain quotient measure | `Mathlib/MeasureTheory/Group/FundamentalDomain.lean:731`, `:755`, `:801`: pushforward equality class, independence, and construction from one domain. It does not itself choose a MeasureSpace. |
| Quotient Haar measure | `Mathlib/MeasureTheory/Measure/Haar/Quotient.lean:75`, `:222`: projection preservation from the restricted domain; finite quotient Haar theorem. Opposite subgroup/right action is explicit and correctly adapted using commutativity. |
| Product circle comparison | `Mathlib/Topology/Instances/AddCircle/Real.lean:55`; `Mathlib/Analysis/Fourier/AddCircleMulti.lean:173`: native product circle carrier and measure equivalence, not Euclidean metric identification. |
| Jacobian change of variables | `Mathlib/MeasureTheory/Function/Jacobian.lean:1096`, `:1184`: measurable set, derivative within it and injectivity. |
| Reflection and triangular determinant | `Mathlib/Analysis/InnerProductSpace/Projection/Reflection.lean:52`; `Mathlib/Analysis/InnerProductSpace/Projection/FiniteDimensional.lean:59`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:734`. Reflection determinant and block determinant formula. |
| Haar linear map / null sets | `Mathlib/MeasureTheory/Measure/Lebesgue/EqHaar.lean:172`, `:231`, `:527`: proper submodule, nonzero-determinant pushforward factor, nontrivial-space sphere nullity. |
| Haar carrier | `Mathlib/MeasureTheory/Group/Measure.lean:773`: invariant, positive on opens, finite on compact sets; no finite-total-mass axiom. |
| Sphere measure | `Mathlib/MeasureTheory/Constructions/HaarToSphere.lean:52`, `:88`: dimension times cone measure and total mass d·vol(B). |
| Gaussian integration | `Mathlib/Analysis/SpecialFunctions/Gaussian/FourierTransform.lean:330`: requires b>0 and gives (π/b)^(dim/2). |
| Gaussian/Poisson measures | `Mathlib/Probability/Distributions/Gaussian/Real.lean:47`; `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`, `:170`; `Mathlib/Probability/Distributions/Poisson/Basic.lean:40`. Non-PSD covariance gives a Dirac measure; scalar Gaussian parameter is variance. |
| Relabelling / measurable sums | `Mathlib/MeasureTheory/Constructions/Pi.lean:732`; `Mathlib/MeasureTheory/MeasurableSpace/Constructions.lean:871`; `Mathlib/MeasureTheory/Measure/Sum.lean:30`. |
| Measure-preserving / continuous-flow carriers | `Mathlib/Dynamics/Ergodic/MeasurePreserving.lean:44`; `Mathlib/Dynamics/Flow.lean:85`. The former requires measurability and map equality; the latter requires joint continuity, so only free transport uses it. |
| Lp composition and density | `Mathlib/MeasureTheory/Function/LpSpace/Basic.lean:595`, `:611`; `Mathlib/MeasureTheory/Function/ContinuousMapDense.lean:142`. Native composition/norm and compact-support approximation under regularity, local compactness/separation and p≠∞. |
| FTC and Chebyshev | `Mathlib/MeasureTheory/Integral/IntervalIntegral/FundThmCalculus.lean:1140`; `Mathlib/Probability/Moments/Variance.lean:398`. Open-piece derivative suffices for FTC; Chebyshev centers at the expectation, so the LLN also uses convergence of the mean to its proposed limit. |
| Falling factorial | `Mathlib/Data/Nat/Factorial/Basic.lean:332`, `:367`, `:424`: recursive definition, zero iff N<n, factorial quotient only when n≤N. |
| Tau Ceti Gaussian density | `TauCeti/Probability/Distributions/Gaussian/Density.lean:82`, `:88`, `:265`: real/ENNReal densities and positive-definite withDensity theorem. |
| Tau Ceti C₀ group | `TauCeti/Analysis/Semigroups/Group/Basic.lean:74`: continuous linear operators, all-real addition law, strong continuity at zero. |
| Tau Ceti empirical carriers | `TauCeti/Probability/Process/EmpiricalMeasure.lean:58`, `:75`, `:85`, `:217`, `:224`: finite empirical measure includes empty populations; its probability wrapper requires Nonempty. The design's μ⁻¹ rescaling differs from probability normalization. |
| Tau Ceti Lipschitz flow | `TauCeti/Dynamics/Flow/OfLipschitz.lean:54`, `:59`: complete real normed space and globally Lipschitz vector field; applicable to free transport, not collisions. |

Object searches at both pins found Gaussian radial Maxwell–Boltzmann distributions, entropy and Boltzmann weights, but no hard-sphere trajectories, BBGKY hierarchy, specular collision operator or grand-canonical dynamics. Existing quotient-Haar, Lp and empirical APIs are consumed. The finite empirical carrier also handles N=0; the README correctly says only that the probability wrapper cannot do so. No second generic probability-empirical construction is proposed.

### Roadmap ownership, overlap and supplier order

Read the board-package index before drawing ownership conclusions. It lists AnalyticNumberTheory, LawrenceVenkateshMethod and LogicAndDefinabilityInNumberTheory at their board heads; none is a candidate owner of this microscopic model. Local package object searches hit this design. Ran `roadmaps grep` for hard spheres, BBGKY, Lanford, flat tori, specular dynamics and grand-canonical measures across the indexed open heads and main, and used `roadmaps show` for the closest scopes. Findings from those searches were read, not treated as instructions.

Cross-roadmap mentions and potential overlaps resolved as follows:

- `TauCetiRoadmap/StandardDistributions/README.md:547`, §5.2 at line 562: multivariate Gaussian density; `Completed/OneParameterSemigroups/README.md:35`: C₀ groups. Both scope mentions resolve on main and are consumed through pinned declarations. These two READMEs and ComplexTori were also read for upstream shape.
- `TauCetiRoadmap/ComplexTori/README.md:16`: complex lattice quotient and holomorphic families. This roadmap's real Euclidean quotient metric and local Lebesgue normalization are distinct adapters over Mathlib, with no complex-family construction.
- PointProcesses, open #417, `TauCetiRoadmap/PointProcesses/README.md:936` and `:1176`: intrinsic factorial/Janossy measures and finite point-process densities/Papangelou theory. The hard-core example around line 1200 belongs to that unlabelled theory; this roadmap explicitly owns the labelled disjoint phase sectors and their deterministic flow. No PointProcesses supplier edge or generic point-measure carrier is introduced.
- HamiltonianSystems, open #480, `TauCetiRoadmap/HamiltonianSystems/README.md:20`: smooth symplectic mechanics and moment maps. The discontinuous collision dynamics here does not reuse or restate a smooth Hamiltonian-flow theorem.
- RelativisticQuantumFieldTheory, open #1772, `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md:5`: relativistic fields, Fock carriers and distribution-valued correlations; distinct from these classical particle correlations.
- OptimalTransport, open #950, `TauCetiRoadmap/OptimalTransport/README.md:3` and `:16`: coupling/Wasserstein/gradient-flow theory. Read both main and the explicit #950 head; no collision-dynamics ownership found.
- ProbabilisticAndMetricNumberTheory, open #1421, `TauCetiRoadmap/ProbabilisticAndMetricNumberTheory/README.md:6` and §4.9a around line 6361: scalar Lp representation packaging and strong continuity for **continuous** group actions. The hard-sphere flow has velocity jumps; the concrete a.e.-continuity argument here is not that continuous-action theorem. Native per-time Lp composition is already cited.
- The broader search found `TauCetiRoadmap/SymplecticGeometry/CotangentLagrangian/README.md:527`: next-collision maps inside bounded strictly convex planar tables and their generating functions. This is not the all-dimension exterior-ball, fixed-time two-body map of Layer 4.

No duplicate owner of the microscopic targets was identified. `scratch/overlaps.md` reports no conflicting head, dropped cited id or revision-only cited id; the design has no supplier section numbering to drift. MathematicalBilliards occurs in the merge order but `roadmaps show` reports no readable roadmap on main or in the indexed open heads; it is not cited by this design, and no absence of ownership is inferred from that unavailable text. Ownership against unprovided files beyond the indexed searches was not individually checked.

A fresh `roadmaps overlaps` invocation could not select this not-yet-ported candidate (it reports no such roadmap on main or in an open pull request); the supplied candidate-specific overlap file and direct head comparisons are the evidence used here.

The resolver reports no unresolved roadmap citation or local roadmap name, but explicitly declines the external-library lookup because it cannot locate the pinned Lake packages. That limitation was addressed by the manual pinned-file inspection above. The initial 17-name report consists of intended new roadmap names, not assertions that those names already exist in Mathlib.

Dependency gate output:

```text
candidate: HardSphereDynamicsAndKineticLimits is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 230 roadmaps, 2063 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The candidate's absence from the order is expected. All plan target edges point to earlier targets; no supplier gap or cycle was found. R07 asks for an internal conservation dependency, not an external supplier. No merge-order file was changed.

### Shape, headline theorems and acceptance-file policy

All required major headings, 10 mathematically named layers and their Examples/Dependencies endings are present. Definitions have mathematical APIs and at least three planned Checks; some APIs are embedded in construction prose. No machine path, pull-request number, HTML anchor, date, mandatory algorithm or source-chapter plan was found in the design text. The remaining Check defects are itemized above.

The deep results and their intended acceptance coverage are:

| README headline | Planned name / treatment |
|---|---|
| Trajectory uniqueness | `HardSphere.IsTrajectory.eqOn`, §5.2 |
| Alexander null exceptional set | `HardSphere.volume_hardCoreSet_diff_goodSet`, §6.4 |
| Total flow group law | `HardSphere.flow_add`, §7.1 |
| Volume preservation | `HardSphere.measurePreserving_flow`, §7.2 |
| Reversal compatibility | `HardSphere.flow_reversal`, §7.3 |
| Concrete strongly continuous Koopman group | §7.4, included in the summary/build; package acceptance must cover it or explain the missing carrier |
| Weak Liouville equation | `HardSphere.weak_liouville`, §8.2 |
| Grand canonical equilibrium invariance | `HardSphere.grandCanonical_flow_invariant`, §9.4 |
| Distinct-particle expectation/correlation identity | `HardSphere.lintegral_sum_distinct_eq_correlation`, §9.5 |
| Initial Boltzmann–Grad particle-number scaling | `HardSphere.boltzmannGrad_scaling`, §9.6 |
| LLN from first two correlations | `HardSphere.tendsto_empirical_of_correlation`, §10.5 |
| Conditional Lanford LLN | `HardSphere.LanfordStatement.tendsto_empirical`, §10.5 |

Lanford convergence itself is a fully specified proposition, not a theorem this roadmap promises to prove. Every own backticked identifier was traced to the prospective declaration list at README line 78 and its defining target. Their absence from the pin is expected. Since this is a design, not the package submission, the future-file tense is not treated as a fabricated existing library declaration.

There are zero existing sorried theorems to probe and zero actual Lean signatures to compare with `#check`. Reading-based review confirms that scattering identities and small-value Checks should remain outside the acceptance file. No statement has been excused with a free Prop placeholder. The actual package must state every statable headline using only simple real-bodied definitions, and name any genuinely unstatable headline in its docstring. Its imports, namespace, binders, absence of sorry'd data/set_option, one-tactic padding and warning output cannot be certified before that file exists.

## Not verifiable

- Alexander1976 Proposition 4.3, pp.217–232: settled uncertified; Project Euclid bot protection in the manifest. Only the GST attribution and secondary finite-system proof were read.
- AlexanderThesis1975 Chapter 1: settled uncertified; institutional HTTP 403 recorded. The original proof was not read.
- Lanford1975 convergence theorem, CIP1994 Chapters 2/4 and Spohn1991 Part I: settled uncertified/paywalled. No renewed requests were made.
- Uchiyama1988, pp.245–297: settled uncertified after bot protection; background only, not independently read.
- Lean elaboration, inferred binders, one-tactic execution and the assertion that sorry is the only warning: **not available (this lane does not elaborate; say so in the report)**. No `Suggested.lean` exists here.
- The complete Lanford hierarchy convergence proof was not reconstructed. Source statements, normalizations, initial/equilibrium cases and the LLN implication were checked. This design does not own that proof.
- MathematicalBilliards and other open work without readable supplied/indexed files were not individually audited; no such work is a supplier of this design.

## Source issues

- **Gap** in GST2013 at Proposition 4.1.1 proof, printed p.28: the source uses phase-volume invariance in its step iteration without establishing it there; it should justify the two-body step's measure preservation before iteration; affects the proof.
- **Error** in GST2013 at (4.3.5), printed p.32: the source maps arbitrary continuous phase functions to continuous functions by collision-flow pullback; it should impose boundary compatibility or use measurable/Lp functions, since velocity-sensitive pullbacks jump across collision-time hypersurfaces; affects a stated result.
- **Gap** in BGSS2023 at Corollary 1.2.1 proof, (1.2.7), printed p.5: the source infers integrated moment convergence from almost-everywhere correlation convergence; it should invoke suitable uniform integrability and restrict tests to controlled growth; affects the proof.
- **Error** in DengHaniMa2024 at Proposition 1.2(3), printed p.4: the source asserts measure-preserving diffeomorphisms after removing one closed null set; it should use measure-preserving maps with smooth collision-itinerary pieces and account for collision-time velocity jumps; affects a stated result.
- **Error** in BGSS2023 at Remark 6.1.2, printed p.59: the source calls the inhomogeneous transport-collision semigroup self-adjoint; it should distinguish the skew-adjoint transport term from the self-adjoint collision part; affects a stated result.
