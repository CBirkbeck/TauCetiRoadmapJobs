# Review of CompressibleEulerEquations (design, round 3)

**Verdict:** needs changes

Reviewed the 1,543-line design README, all 53 plan targets with their APIs and prerequisites, and all 21 manifest entries. There are eight findings: six P2 and two P3. This is a repairable design, not a package review. No design or manifest entry was changed. The previous findings were checked first; their disposition is recorded below. Elaboration is **not available (this lane does not elaborate; say so in the report)**.

## R01 (P2) — The unweighted energy still lacks coefficient bounds

**Location:** `packages/CompressibleEulerEquations/design/README.md:875`, “of class `C¹` with bounded derivatives”; `packages/CompressibleEulerEquations/design/plan.json:1132`, targets 5.1 and 5.1.1.

**Claim:** the stated coefficient and solution classes suffice to define a finite differentiable energy and establish the unweighted L² estimate.

**Witness:** Take n=N=1, Λ=0, A⁰(x)=√(1+x²), A¹=B=0 and W(t,x)=(1+x²)⁻¹ᐟ². Then A⁰≥1, |(A⁰)′|≤1, LW=0, ‖W‖₂²=π, ‖W′‖₂²=π/8, but E=∫(1+x²)⁻¹ᐟ²=∞.

The truncated energy on [−R,R] is 2 asinh R, tending to infinity. Bounded derivatives do not imply bounded coefficients on a noncompact carrier. A totalised real integral would give a junk value rather than the asserted coercive energy. The appearance of sup‖A⁰‖ in the conclusion is not a hypothesis that it is finite. Unbounded spatial matrices also need care to make LW an L² function for arbitrary members of the stated class.

**Exact repair:** state the unweighted theorem for uniformly bounded A^μ with bounded first derivatives, retaining A⁰≥λ₀I and bounded B. If the linear-operator carrier continues to admit unbounded coefficients, put these bounds explicitly on its unweighted energy theorem rather than silently assuming them. Synchronise the plan and add this negative control. The witness is excluded by the new A⁰ bound; replacing A⁰ by 1 gives E=π and both sides of the energy identity equal 0. The repaired compact-support weighted theorem §5.2 already has the necessary local bounds.

## R02 (P2) — Uniformly local existence does not state its full hypotheses or a valid localisation route

**Location:** `packages/CompressibleEulerEquations/design/README.md:1266`–1273, “let `G` contain the segments `[Ū, U]` for `U ∈ K`”; `packages/CompressibleEulerEquations/design/plan.json:1544`, target 7.3.

**Claim:** the displayed uniformly local bound and segment condition imply a uniform-time classical solution, and the displayed cutoff data can be solved by §7.1.

**Witness:** For u_t=0, G=ℝ, K=[0,1], Ū=0 and k=0, U₀=1_{[0,∞)} has sup_y‖χ(·−y)U₀‖₂≤‖χ‖₂. Its initial trace has left/right limits 0/1, so no classical solution attains it.

The plan's hypothesis list includes 2k>n+2, but the README theorem does not, and neither copy explicitly requires compact K. This is not just notation: for G=(−∞,1), F(u)=u/(1−u), A⁰=1, A¹=0, Ū=0, K=[1/2,1), the smooth data U₀(x)=1−1/(2+√(1+x²)) have bounded uniformly local Hᵏ norms for every fixed k. The pointwise ODE reaches the edge u=1 at time −log U₀−(1−U₀), whose infimum is 0. There is no uniform positive existence time.

Two inputs of the proposed route are also missing. First, χ is not required to lie in [0,1]: with G=(0,2), Ū=1, K={3/2}, a smooth cutoff equal to 1 on the unit ball but taking value 3 elsewhere produces the localised value 5/2, outside G. Second, §7.1 requires F(Ū)=0; §7.3 neither requires it nor supplies a reduction. The uniformly local theorem itself should retain general smooth sources.

**Exact repair:** state the system, Ū∈G, compact K⊆G, M>0 and 2k>n+2 explicitly in both copies; choose 0≤χ≤1. Use a compact neighbourhood of the compact segment hull, containing the solution values for a uniform short time, for the speed bound. To retain general F using §7.1, add the following owned localisation construction to the route: adjoin a stationary scalar a, take matrices diag(A⁰,1), diag(Aⁱ,0), and source (aF(U),0); use compactly supported cutoff data for a, equal to 1 on the smaller data ball. The augmented background (Ū,0) is an equilibrium, and on a=1 the first component solves the original system. Apply §7.1, restrict to the smaller cones, and glue by §6.2. Name this construction as a target/input in 7.3.

With these repairs, the discontinuous k=0 datum and noncompact-K datum are excluded; the cutoff value becomes 1+θ/2∈[1,3/2] for 0≤θ≤1. For F≡1 and A¹=0 the augmented source vanishes at (Ū,0), while on a=1 it gives U=Ū+t, as required, without assuming a false equilibrium for the original equation.

## R03 (P2) — Order-zero composition needs first-derivative control

**Location:** `packages/CompressibleEulerEquations/design/README.md:781`–782, “on `Φ` through its derivatives up to order `k` on `K`”; composition at lines 773–779, plan target 4.3.2.

**Claim:** the centred composition bound at k=0 has a constant controlled by order-zero bounds of Φ on K alone.

**Witness:** Let Λ=0, n=N=1, K=[0,1], Ū=0, Φ_m(s)=sin(ms), and u_m=m⁻¹1_{[0,1]}. Then sup_K|Φ_m|=1 (m≥2), ‖u_m‖₂=1/m, and ‖Φ_m(u_m)−Φ_m(0)‖₂=sin 1≈0.84147.

Thus the necessary constant is at least m sin 1, although all specified order-zero controls are unchanged. The repair of the uncentred k=0 formula is correct, but centring alone does not supply this constant dependence.

**Exact repair:** at k=0 include a Lipschitz bound for Φ on K; more uniformly allow derivative bounds through max(1,k) on a fixed compact neighbourhood inside G, with the usual finite-cover/secant control when K is nonconvex. Keep the centred H⁰ theorem. Record the dependence and the new Check in the plan. On the witness Lip(Φ_m)≤m, and the corrected estimate reads sin 1≤1. The positive-order formula and the existing Φ≡1 Check remain valid.

## R04 (P2) — The summary reverses the global-extension uniqueness criterion

**Location:** `packages/CompressibleEulerEquations/design/README.md:19`–20, “developments that extend a common classical solution are unique”.

**Claim:** extending a common solution ensures uniqueness of developments.

**Witness:** The design's §8.2 developments D₁,D₂ both extend the classical solution on W₁₂=(D₁∩D₂)∩{t<1}. Nevertheless (2,0) belongs to both domains and v₁(2,0)=2 while v₂(2,0)=−2.

Even compatible truncations have different domains, so “are unique” cannot mean equality of arbitrary developments either. The actual theorem at lines 1350–1353 assumes that the *data* extend to a classical solution on the whole future half-space and concludes uniqueness of the *maximal* development.

**Exact repair:** replace this headline clause by “if the data extend to a classical solution on the whole future half-space, the maximal development is unique.” Keep the maximal-common and compatibility claims separately. The counter-flow pair no longer satisfies the added global-extension hypothesis; constant data on a ball satisfy it and have precisely the unique maximal cone described in §8.2.

## R05 (P2) — The spectral correction is missing from the scope and a plan Check

**Location:** `packages/CompressibleEulerEquations/design/README.md:36`–37, “identification of its null covectors with the characteristic covectors of the Euler symbol”; `packages/CompressibleEulerEquations/design/plan.json:405`, “speeds v·ω, v·ω ± c”.

**Claim:** acoustical-null covectors are all characteristic covectors, and a constant barotropic state always has the material speed.

**Witness:** At n=2, ρ=c=1, v=0, ζ=(0,1,0), σ=[[0,1,0],[1,0,0],[0,0,0]] has determinant 0 while g⁻¹(ζ,ζ)=1. At n=1 the 2×2 symbol has speeds −1,1; 0 is absent.

The detailed theorems in §§2.2 and 3.1 correctly retain the material sheet only at positive multiplicity. The scope drops that distinction, and the plan's `constant_state` Check belongs specifically to the barotropic construction 2.2. This is an incomplete propagation of the previous multiplicity repair, not a new objection to the corrected theorem.

**Exact repair:** identify the null covectors with the *sound sheet* of the characteristic variety in Scope. In the plan Check specify unit ω and material speed multiplicity n−1, hence absence for n=1; keep the full-system multiplicity n separately. The n=2 witness is then characteristic on the material sheet but non-null, while the n=1 witness correctly has exactly two speeds. No further restriction of spatial dimension is needed.

## R06 (P3) — The interpolation negative control uses the wrong dilation limit

**Location:** `packages/CompressibleEulerEquations/design/README.md:786`–787, “the wrong exponent `L^{k/i}` scales differently and is refuted as `λ → ∞`”.

**Claim:** the wrong L^{k/i} version of the homogeneous estimate is refuted by large spatial dilation.

**Witness:** For n=1,k=2,i=1, the proposed wrong left side scales as λ¹ᐟ² and the right side as λ³ᐟ⁴. Their ratio is λ⁻¹ᐟ⁴: its dilation factor is 1/2 at λ=16 and 2 at λ=1/16.

**Exact repair:** specify the homogeneous Λ=0 estimate and use λ→0. In general the wrong-to-right ratio scales as λ^{−ni/(2k)}, tending to infinity at 0, not at infinity. Add the computed exponents to the plan's `scaling` Check. This preserves the correct estimate, whose two sides both scale as λ^{i−ni/(2k)}.

## R07 (P3) — Two causal-curve locators still point to other sections

**Location:** `packages/CompressibleEulerEquations/design/README.md:523`, “MinguzziCone2019 lines 1735–1740 for causal curves”; `packages/CompressibleEulerEquations/sources.toml:246`, “Theorem 2.12, Remark 2.13 (§2.2)”.

**Claim:** these are the locators for the causal-curve definition and its Lipschitz reparametrisation.

**Witness:** MinguzziCone2019 line 1737 is Definition 2.17 of a domain of dependence. Its differential-inclusion curve definition is at lines 681–697, printed p.17. Minguzzi2019 line 1354 heads §2.5, which contains Theorem 2.12 and Remark 2.13.

**Exact repair:** cite MinguzziCone2019 §2.1, equation (2.2), lines 681–697, p.17, and Remark 2.3, lines 698–718, for the curve/reparametrisation background. Retain Definition 2.17 for §3.3. Correct the Minguzzi2019 manifest section to §2.5, retaining the theorem numbers and source identities. Add the curve locator to the existing MinguzziCone2019 entry; do not create a second key. Reopening those locations gives the locally absolutely continuous differential-inclusion definition and the Lipschitz reparametrisation argument, respectively. The separate, previously repaired timelike-versus-causal qualification remains correct.

## R08 (P2) — The cited mollifier API only supplies the normalised-bump special case

**Location:** `packages/CompressibleEulerEquations/design/README.md:821`–827, “are cited, not reproved”; `packages/CompressibleEulerEquations/design/plan.json`, target 4.4 API `bounds`.

**Claim:** the pinned `normedBumpL` theorems supply the Λ=0 properties for the arbitrary even nonnegative compactly supported smooth kernel specified at line 809.

**Witness:** `TauCeti/Analysis/Sobolev/Wkp/ApproximateIdentity.lean:52` takes `phi : ContDiffBump 0`. An allowed kernel φ(x)=(η(x−2)+η(x+2))/2, with η even, nonnegative, integral 1 and support (−1/4,1/4), has φ(0)=0; normalised library bumps have positive value there.

These are different operator families. Norm equivalence also does not turn the native contraction into a contraction with constant 1 in the multi-index norm, although the README correctly gives a separate Young-inequality argument for that part. The normalised-bump theorems are useful inputs, not the whole claimed arbitrary-kernel result.

**Exact repair:** retain the general kernel class. State explicitly that 4.4 owns its extension of contraction/commutation/convergence beyond the native normalised-bump family, in both the README and plan. Cite `TauCeti.Wkp.continuous_translate` (`TauCeti/Analysis/Sobolev/Wkp/Translation.lean:182`) and the translation isometries; express J_ε as ∫φ(y)τ_{−εy}, use Young coordinatewise for the multi-index contraction and dominated convergence of translations for strong convergence. No new supplier gap is required. On the two-bump witness, ∫φ=1 and φ(0)=0 remain allowed; the translation argument still gives ‖J_εu−u‖→0. On a native normalised bump it recovers the cited API rather than duplicating its proof.

## Verified sound

### Previous findings, checked before the new pass

The following are quotations of the present repaired passages, not instructions taken from the repair report. Twelve previous findings are repaired in the audited statements; two are partly repaired as explained below. The external half of previous R12 is not re-raised against this package: the repair report's reason that the companion file is outside this package is correct.

| Previous finding | Repaired passage and current location | Disposition and recomputation |
|---|---|---|
| R01 forcing coefficient | §5.3, line 963: “C(1 + ‖U − Ū‖_{Hᵏ_Λ})” multiplying the forcing term | **Repaired.** R=√(π(1+m²+m⁴)); the coefficient can grow as m², matching 2√S_m/√(2π)≥√(2/3)m². Time commutator and inverse-multiplier route are present. |
| R02 source term | §5.3, line 991: “C(‖F(U)‖_∞ + ‖∇U‖_∞)” | **Repaired.** For U=eᵗ,F(u)=u at 0: 1≤C(1+0), rather than 1≤0. |
| R03 background matrices | §5.4, line 1025: “the constant matrices Ā⁰, …, Āⁿ (the spatial ones included)” | **Repaired.** E₂′=22πM, E₂≤24eπ; C may depend on M. |
| R04 weighted integrability | §5.2, lines 905–907: “containing the closure of {χ > 0}” and relative compactness modulo Λ | **Repaired.** The singular W=(1−x)⁻¹ is excluded; compact support with bounded W gives finite energy. Related unweighted omission is new R01. |
| R05 large mollifier radius | §4.4, line 813: “C(1 + ε^{−1})” | **Repaired.** Constant mode gives 1≤C(1+ε⁻¹); for ε≤1 this is bounded by 2C/ε. |
| R06 order-zero formulas | §4.3, lines 759 and 776: “k ≥ 1”; §4.2, line 727: “‖u‖_{H⁰_Λ} = ‖u‖_{L²_Λ}” | **Repaired for the formulas raised.** No 0/0 remains; centred Φ≡1 gives 0≤0. The constant dependence still has the separate R03 defect. |
| R07 norm comparison | §4.1, lines 672–673: “equal in particular when k ≤ 1, and at every order when n = 1” | **Repaired.** Gaussian squared norms in n=1 are both 5√(π/2); in n=2 they are 5π and (7/2+8e⁻²)π. |
| R08 timelike hyperplanes | §3.1, lines 483–485: “exactly one negative square” and “negative definite … when n = 1” | **Repaired.** ker dx is the time axis; values at τ=1,2 are −1,−4. |
| R09 empty union | §8.2, line 1344: “any nonempty pairwise compatible family” | **Repaired.** Empty union has initial slice ∅, singleton union has slice S; nonempty-chain Zorn is the right pinned statement. |
| R10 product/dependence locators | §4.3, lines 765–770: Leibniz/Hölder/GN route; §3.3, line 580: “the timelike variant” | **Repaired.** Luk's derivative-product formula is no longer cited as a product theorem; Chruściel's two notions are distinguished. New locator slips are R07. |
| R11 zero multiplicity | §2.1, lines 377–378: “For N = 0 … κ = (1, 0)”; lines 393–395: “the eigenvalue ζ₀ is absent” | **Partly repaired overall.** These clauses and their plan copies are correct (det=1; eigenvalues ±1). The same missing-material-multiplicity pattern survives in plan 2.2's Check: new R05. |
| R12 acoustical ownership | Scope, line 66: “LorentzianGeometry is a consumer, never a supplier” | **Partly repaired across the two designs; repaired here.** The consumer/zero-vector bridge is explicit. The companion still constructs the form at `packages/LorentzianGeometry/design/README.md:210` and advertises reverse supply at line 661. Its correction is outside this package, as the repair report says; no repeated finding here. |
| R13 isothermal sign | §1.1, line 266: “c = \|a\|” | **Repaired.** a=−1 gives c=1; a=0 gives p′=0 and is rejected. |
| R14 periodic coefficient | §4.4, line 817: “bounded, Lipschitz and Λ-periodic” | **Repaired.** The antiperiodic coefficient produces values ±μ₂ε²/8 at π,3π and is excluded; constant coefficient gives 0. |

### Computed adversarial pass

All README statements, API clauses, Checks and plan targets were read. The table records the seeded targets, headlines, repaired passages and every target touched by a finding; it is intentionally not a second 53-target catalogue. Previously computed rows were relied on only for unchanged mathematics with explicit values, and the values used here were recomputed. These tests are falsification controls and proof-route checks, not proofs of the deep PDE theorems.

| Statement | Instances tried | Computed values on both sides | Result / change |
|---|---|---|---|
| Conventions: sign, time orientation, conformal normalisation | c=1,v=0; X=(1,1/2),(1,1),(1,2); c=2 | g(X,X)=−3/4,0,3; g⁻¹(dt,dt)=−1/4; g(B,B)=−4 versus normalised −1 | Sound, including nonzero/future distinction |
| §1.1 sound speed | p=ρ²/2 at ρ=4; p=−A/ρ; p=−ρ² | c²=4,c=2 versus wrong c=4; c²=A/ρ²>0 despite p<0; p′=−2ρ<0 rejected | Sound general EOS, no positive-pressure shortcut |
| §1.1 isothermal/full law | a=−1,0,2; P=eˢρ² at (1,0) | c=1, excluded,2; P_ρ=2,P_s=1,c=√2 | Sign repair sound |
| §§1.2–1.3 equations and conservative equivalence | expanding flow at t=1,n=1; boost w=1; static entropy wave | mass terms −ρ₀/4+ρ₀/4=0; momentum −x/4+x/4=0; wrong boost residual −1/2; P(e^{−x/2},x)=1 and Bs=0 | Both directions use ρ>0; sound |
| §1.3 entropy transport | (ρ,v,s)=(1,0,t); constant entropy s=0 | Bs=1≠0; P(ρ,0)=ρ² and c²=2ρ in both reductions | Definition excludes wrong model; bounded-velocity route reaches initial slice |
| §2.1 dominance, symmetrisation | transport a=3; cone (1,0); N=0 | ζ=(1,−1) satisfies 1≥1 but σ=−2; empty det=1 has no root, every empty quadratic inequality is 0≥0 | Repaired κ=(1,0) at size zero sound |
| §2.1 wave multiplicity and nonexamples | n=1 and n=2, ζ=(0,e₁); Cauchy–Riemann | spectra {−1,1} and {−1,0,1}; CR off-diagonal entries −1,1 unequal | Wave repair sound; no elliptic system admitted |
| §2.2 Euler symmetrisers | n=1,ρ=1,c=2,v=3; full P=eˢρ² | det(A¹−λA⁰)=4(λ−1)(λ−5); full S leading minors 2,2,2; deleting the added 1 gives determinant 0 | Sound positivity and equivalence |
| §2.2 dominance and absent material root | c=2,v=3; ζ=(−3,1) | minimal static speed 5; σ=[[0,4],[4,0]], determinant −16, g⁻¹(ζ,ζ)=1 | Detailed theorem sound; plan Check needs R05 |
| §3.1 form/inverse | c=2,v=(1,0) | G=[[-3,-1,0],[-1,1,0],[0,0,1]], G⁻¹=[[-1/4,-1/4,0],[-1/4,3/4,0],[0,0,1]]; GG⁻¹=I, det G=−4 | Sound |
| §3.1 vector, covector and hyperplane classifications | X=(1,3,0),(1,4,0); ζ=(−3,1,0); n=1,ζ=dx | g=0,5; ζ(B)=−2, g⁻¹(ζ,ζ)=0 (past null); ker dx gives −τ² | Sound, including the n=1 repair |
| Scope characteristic identification | n=2,c=ρ=1,v=0,ζ=(0,1,0) | det σ=0 but g⁻¹=1; n=1 material speed has multiplicity 0 | R05: sound sheet versus whole characteristic variety |
| §3.2 integral characterisation/local curves | field (1,0), x=t/2,2t,\|t\| on [−1,1] | displacement over length Δ: Δ/2≤Δ, 2Δ>Δ; corner has a.e. speed 1 | Both directions discriminate; corners admitted |
| §3.2 regularity/compact limits | x=10 Cantor function; x_m=t/2+1/m on [0,1] | first has a.e. derivative 0 but displacement 10>∫c=1; second has common speed 1/2 and sup distance 1/m→0 | Lipschitz condition essential; uniform limit remains causal |
| §3.3 causal past/compactness/openness | constant field (1,0), S=(−2,2), p=(1/2,0) | initial past interval [−1/2,1/2]⊂S; D⁺={\|x\|<2−t}; margin at p is 3/2 | Past-closed restriction and idempotence retain the same triangle; empty S gives empty D⁺ |
| §3.3 noncompact failure and expanding flow | v=x², through (1/2,−4); expanding p=ρ²/2 | x(s)=1/(1/4−s), x′=x², divergence at s↓1/4; expanding half-width at 1 is 2√2−2≈0.8284, at 3 is 0 | Bounded-slab condition and non-frozen cones sound |
| §4.1 carrier/rank | constant 1; n=2 cylinder Gaussian×cosine | norm²=(2π)ⁿ for full lattice, ∞ for Λ=0/cylinder; Gaussian×cos norm²=π√(π/2) | No compact-cell shortcut for rank-deficient Λ |
| §4.1 Hilbert versus Wkp norm | n=2,k=2, e^{−\|x\|²}; n=1,e^{−x²} | multi-index terms π/2+π+7π/2=5π; operator-Hessian total (7/2+8e⁻²)π; n=1 both 5√(π/2) | Repaired comparison sound |
| §4.1 circle and torus comparisons | u=1 and cos x | CircleSobolev norm² 1,2 versus H¹_Λ 2π,2π; unit-torus cos norm²=(1+4π²)/2 | Equivalence, not equality/proportionality; comparison is not upstream supply |
| §4.2 embedding/interpolation | Gaussian; n=2 critical cut-off log log(1+1/r); k=0 | sup²=1≤√(π/2); critical derivative integral behaves as ∫dr/(r log²(1/r))<∞ while sup=∞; H¹ norm²=2√(π/2)≤√5√(π/2); H⁰=L² | Threshold and endpoint sound |
| §4.2 lower semicontinuity | u_m=sin(mx)/m on 2π-circle | ‖u_m‖₂²=π/m²→0; ‖u_m‖_{H¹}²=π(1+m⁻²); limit norm 0≤liminf=√π | Correct inequality, no false strong H¹ conclusion |
| §4.3 GN and products | n=1,k=2,i=1; f=g Gaussian; u=r^{−n/3} near 0 | correct dilation powers 3/4 on both sides; product derivative 2uu′; ∫u² finite but ∫u⁴ infinite | Main GN/product statements sound; R06 corrects wrong-exponent limit |
| §4.3 commutator | k=1, f=g=sin x on circle | (fg)′−fg′=cos x sin x; L² norm √π/2; first RHS term ‖f′‖∞‖g‖₂=√π | Sign and first-order commutator control sound |
| §4.3 k=0 constant dependence | Φ_m(s)=sin(ms), u=m⁻¹1_[0,1], m=10,100,1000 | output norm .84147 each; input .1,.01,.001; required constants 8.4147,84.1471,841.471 | R03; first-derivative bound m repairs it |
| §4.3 repaired centring | Φ≡1,u=Ū=0,k=0 | uncentred L² norm ∞ versus 0; centred 0 versus 0 | Formula repair sound |
| §4.3 negative-control scaling | λ=16 and 1/16 in wrong L² bound | LHS/RHS dilation factors 4/8=1/2 and (1/4)/(1/8)=2 | R06: use λ→0 |
| §4.4 gain/loss | constant 1; cos(mx), m→∞ | constant ratio 1≤C(1+ε⁻¹); loss ratio \|1−φ̂(εm)\|→1, so k=0 O(ε) fails; k=1 bound ≤εm∫\|y\|φ | Repairs sound |
| §4.4 periodic commutator | a=sin(x/2),sin x,constant; u=sin x | first values at π,3π are ±μ₂ε²/8+o(ε²); periodic coefficient gives periodic output; constant coefficient gives 0 | Periodicity repair sound |
| §4.4 general kernel supply | two separated bumps | φ(0)=0, ∫φ=1 versus native normalised bump(0)>0; ∫φ(y)‖τ_{−εy}u−u‖→0 | R08: add general-kernel transfer |
| §5.1 energy and damping | constant transport; B=b; unbounded A⁰ witness | transport E′=0; damping E′=−2bE; witness L² norm²=π,H¹ norm²=9π/8 but E_R=2asinh R→∞ | Signs sound; R01 adds missing bounds |
| §5.2 weighted regularity | χ=(1−\|x\|)₊, W=(1−x)⁻¹ | LW=0,σ(dχ)=0 but ∫χW²=∞; repaired closure hypothesis rejects W | Previous R04 repaired |
| §5.2 monotonicity sign | transport a=1, speed M=1 versus M=1/2 | χ_t+χ_x=−1−sign x≤0 versus +1/2 on x<0 | Correct sign; a bump nonzero at −1.2 enters the slow cone at t=.9,x=−.3 |
| §§5.2/6.1 moving periodic cones | v=3,c=1,w=3 versus w=0 | moving threshold M=1, static M=4; dχ=(e·w−M,−e), dual cone expression equals M | Periodisation preserves the sign and compact quotient support |
| §5.3 forcing and tame energy | sin(mx) background; Burgers; U=eᵗ | E₂′(0)=2δS_m, S_m≥πm⁴/3; R=√(π(1+m²+m⁴)); Burgers (‖u_x‖²)′=−∫u_x³; U_t(0)=1,∇U=0 | Revised coefficients and source term sound |
| §5.3 C¹ energy route | top derivative only C(L²), mollified before differentiation | J_ε∂^αW has an L² time derivative; commutator remainder tends to 0 in L²; scalar constant background gives E′=0 | Route avoids falsely differentiating W in Hᵏ |
| §5.4 constant dependence | A⁰=e^{sin x},A¹=M,w=sin x+sin 2x | four integrals 2π,4π,π,0; E₂′=2·2πM+4·4πM+2·πM=22πM; E₂≤24eπ | Previous R03 repaired |
| §6.1 periodicity/local uniqueness | added system (u,z),z=x,u=g(t+1/x) for x<0 | u_t+x²u_x=g′−g′=0; initial u=0; at (.9,−1/.3), u=g(.6)≠0 | Nonperiodic counterexample excluded; compact-quotient proof applies to periodic solutions |
| §6.2 causal-past uniqueness | field (1,0), p=(1/2,1.4), S=(−2,2) | initial past [.9,1.9]⊂S; at x=1.6 it becomes [1.1,2.1]⊄S | Correct sharp region; Λ=0 cones fit arbitrary neighbourhoods |
| §7.1 existence/continuation | Burgers u₀=−e^{−x²}; constant equilibrium; F≡1 on ℝ | min u₀′=−√2e⁻¹ᐟ²; T*=e¹ᐟ²/√2≈1.16582; gradient time integral ∞, range stays [−1,0]; equilibrium T*=∞; F≡1 gives non-L² perturbation t | Correct equilibrium and continuation discriminators |
| §7.2 Euler headline | p=ρ³/3,ρ̄=1+e^{−x²}/2,v̄=ρ̄−1 | c=ρ; v−ρ=−1; v+ρ=1+e^{−x²}; T*≈1.16582 while 1≤ρ≤3/2 | Non-vacuum gradient blow-up; n=3,k=3 gives 6>5 |
| §7.3 uniformly local data | counter-flow tails; step at k=0; noncompact K; overshooting cutoff | tails give finite local norms but global L²=∞; step trace limits 0/1; ODE lifespans at x=0,10,100: .07213,.003647,.00004837; cutoff state 2.5∉(0,2) | R02; compact K, order, and admissible cutoff needed |
| §7.3 augmented localisation repair | original F≡1, stationary cutoff a | F_aug(Ū,0)=0; on a=1, U_t=1 and U=Ū+t; at cutoff values θ, U_localised=1+θ/2∈[1,1.5] | General smooth sources retained by an explicit construction |
| §8.1 developments and truncations | empty S; slow cone; constant solution | D⁺(∅)=∅; slow-cone boundary gives 1/2<1 and a past curve exits before 0; time truncation gives 1>0 | Correct rejection of wrong domains; truncations remain developments |
| §8.2 maximal common/compatibility | counter-flow towers at t=2,x=0 | left bound 0<1 and right bound 0>−1 both hold; velocities 2≠−2; W₁₂ lies at t<1 | Detailed theorem and counterexample sound; headline overclaim R04 |
| §8.2 compatible unions/Zorn | empty family,S=(−1,1); singleton; S=∅ | initial slices ∅≠S, S=S, ∅=∅ respectively | Nonempty-family repair sound; pinned Zorn needs only nonempty chains |
| §8.2 global-extension criterion | constant data on ball B(0,R) | every base point lies in ball iff \|x−tv₀\|+c₀t<R | Correct unique maximal cone; stronger than a common partial extension |
| §8.3 existence and slab compatibility | constant half-space data; S=E | D⁺={x¹>(v₀¹+c₀)(t−t₀)}; for S=E all past curves reach the initial slice, so D⁺=O | Correct restriction/gluing route and headline |
| §8.4 null boundary headline | constant cone; expanding flow at t=1; time truncation | constant: φ_t+v·∇φ=c; expanding: 1−1/√2+√2−1=1/√2=c; truncation: 1>0 | Correct nullity under maximality and extendibility; nonmaximal spacelike boundary allowed |
| §8.4 extension lens | M>c+\|v−v(q)\|, disjoint period translates | along past-directed causal paths ψ increases at least M−c−\|v−v(q)\|>0; strict φ inequality makes φ decrease backwards | Lens stays inside until φ=0; extension creates a larger development if boundary were spacelike |

### Seeded sources and source limits

All fifteen requested sections were checked against their readable citations. No additional author-flagged unverified locator was found in the README or plan. The seven settled inaccessible works were not requested again. All 21 cited works have exactly one manifest key; no new fetch was needed. Source passages below are described, not copied. Page numbers are those of the versions recorded in the manifest, not guessed published pagination.

| Seeded target | Text reopened | What it supports |
|---|---|---|
| 1.1 | ChristodoulouMiao2014 line 606, (1.24), p.17; AbbresciaSpeck2022 lines 165–171, (1.3), p.4; LuoYu2023a line 88, pp.2–3 | c²=P_ρ at fixed entropy. Luo–Yu's 1<γ<3 is a specialised application; it does not constrain the general EOS library. Negative-pressure Chaplygin law passes the roadmap's direct calculation. |
| 1.3 | ChristodoulouMiao2014 lines 833–838, (2.1)–(2.3), p.24, and 530–544, p.16; AbbresciaSpeck2022 lines 158–160, p.4 | Mass, full pressure-gradient momentum, and entropy transport. Bounded velocity is the roadmap's explicit hypothesis ensuring backward material curves reach the data. |
| 2.1 | Christodoulou2019 lines 124–126, Prologue, PDF p.5 | Describes Euler as first-order quasilinear hyperbolic, not the entire abstract symmetric-system API. Friedrichs/Majda/Dafermos are settled inaccessible references. Matrices, size zero, dominance and symmetrisation were independently tested. |
| 3.1 | ChristodoulouMiao2014 lines 672–685, (1.39)–(1.40), p.19; LukSpeck2018 lines 1999–2008, Definition 3.3, p.42; LuoYu2023a line 95, p.3 | Form, inverse and determinant normalization. Luk–Speck use c⁻²g; the README's factor comparison is correct. |
| 3.2 | Minguzzi2019 lines 1354–1371, Theorem 2.12/Remark 2.13, §2.5, p.32, and 1917–1941, §2.11, p.45; Chrusciel2011 §2.3 at line 534, p.13, and §2.6 at line 1352, pp.32–33; MinguzziCone2019 lines 681–718, p.17 | Locally Lipschitz/AC curves, reparametrisation and limit-curve machinery. The concrete time-parametrised integral inequality follows here by FTC and differentiation. R07 corrects two locators. |
| 4.1 | AbbresciaSpeck2022 lines 149–152,176–179, p.4; pinned Wkp and CircleSobolev definitions | The source uses ℝ×𝕋² and H³ data; it is background for, not a theorem supplying, the arbitrary-rank quotient construction. Native weak-derivative and norm comparisons reopened. |
| 4.2 | LukNotes lines 1210–1212, Theorem 5.5, p.20; pinned embedding and difference-quotient declarations | Whole-space sup bound for s>n/2. Higher-derivative/periodic variants use the stated localisation. Exact lower-semicontinuity bound is consistent with weak closedness of the full derivative graph, not a claim of strong top-order convergence. |
| 4.3 | Nirenberg1959 lines 318–329, Lecture II, (2.2)–(2.3), printed p.125; LukNotes lines 1612–1617, p.26 | Rendered p.125 of the cached PDF because extraction omits formulas. Substitution m=k,j=i,q=∞,r=2,a=i/k gives 1/p=i/(2k). The printed theorem has j<m; i=k is the identity endpoint, independently valid. Luk's centred composition estimate applies; its printed Lemma 6.9 is not a product estimate. R03/R06 are roadmap errors. |
| 4.4 | Pinned ApproximateIdentity, Translation and W1p/Mollification; Friedrichs1954/Majda1984 settled | The native API supplies normalised smooth bumps for finite p, not every allowed even kernel: R08. General convolution estimates are mathematical targets, not computational algorithms. |
| 5.2 | LukNotes lines 724–755, Proposition 4.4, pp.13–14 | Wave energy on shrinking speed-one balls and the flux sign. The general Lipschitz-weight extension is proved here. Revised compact-support/closure hypotheses suffice; no source claim of that full generality was inferred. |
| 5.3 | LukNotes lines 1620–1645, Theorem 6.10, p.26; Majda1984 §§2.1–2.2 settled | Wave breakdown analogue, not the displayed general-system differential inequality. Direct commutator/multiplier computations verify the repaired coefficient dependence. |
| 6.1 | EperonReallSbierski2019 lines 1178–1189, Proposition 4.63, p.29; LukNotes Proposition 4.4; BarGinouxPfaffle2007 lines 3664–3670, Theorem 3.2.11, printed p.85/PDF p.91 | ERS quotes standard local uniqueness for wave developments; BGP gives smooth normally hyperbolic Cauchy theory on globally hyperbolic manifolds with compactly supported data. Both are accurately labelled analogues, not the general lens theorem verbatim. |
| 7.1 | LukNotes lines 1214–1250, Theorem 6.1, p.20, and Theorem 6.10 at line 1620; Kato/Majda/Dafermos settled | Luk uses H^{n+2}×H^{n+1} and states lower-order continuous dependence. It does not directly certify the optimal integer-order/top-order general-system theorem; the design's own energy/regularisation route is needed. |
| 7.3 | Kato1975 Theorem I, settled uncertified; §7.1/§6.2 internal inputs | Text unavailable; no claim of reading uniformly local hypotheses in Kato. The stated target was independently tested: R02. |
| 8.4 | Christodoulou2019 lines 131–138, Prologue, PDF p.5; ChristodoulouMiao2014 lines 880–886, p.25; LuoYu2023b lines 417–419, §1.4.2,p.11; ERS lines 1603–1612, Theorem 4.82,p.39 | Christodoulou/Luo–Yu describe regular characteristic boundaries; ERS gives a global one-sided-boundary uniqueness criterion, not the nullity theorem. The roadmap supplies the local conormal/extension argument with its own hypotheses. |

Additional repaired/headline locators reopened: Minguzzi2019 Definition 3.1/Remark 3.2 (lines 3576–3586,p.84) and Proposition 3.16 (lines 3716–3735,p.87); MinguzziCone2019 Definition 2.17 (lines 1737–1744,p.43); Chrusciel2011 lines 1843–1864,§2.9,p.44; BGP Definition 1.3.5 (lines 1006–1017,printed p.22); ERS Theorem 3.45 (line 767,p.19), development definition (lines 1129–1144,p.28), Theorem 4.64's nonempty common-family construction (lines 1228–1240,p.30), and Corollaries 4.68–4.69 (lines 1338–1344,p.32). Their connected-data and wave-equation hypotheses were not silently transferred to the disconnected Euler counterexample. LuoYu2023b Definition 2.13 (line 910,p.24) is the downstream rarefaction-wave definition, not a supplier for local existence here.

### Pinned declarations and ownership

The manifest pins agree with the plan: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The named declarations were opened at these pins, not inferred from the resolver. Important domains and limitations:

| Pinned file and line | Declaration(s) and checked contract |
|---|---|
| `Mathlib/Analysis/Calculus/ContDiff/Defs.lean:471`; `Mathlib/Analysis/Calculus/FDeriv/Defs.lean:151`; `Mathlib/Analysis/Calculus/TangentCone/Defs.lean:153`; `Mathlib/Analysis/Calculus/TangentCone/Real.lean:80` | ContDiffOn, fderivWithin, UniqueDiffOn and uniqueDiffOn_convex. The half-space has nonempty interior; relative-open restrictions inherit unique differentiability locally. fderivWithin otherwise has junk value 0, so the domain argument matters. |
| `Mathlib/LinearAlgebra/Matrix/PosDef.lean:62` and `:176`; `Mathlib/LinearAlgebra/Matrix/Hermitian.lean:45`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63` | PosSemidef/PosDef include Hermitian and finite-support quadratic tests; size-zero positivity is vacuous. IsHermitian is equality to the conjugate transpose; empty determinant is 1. |
| `Mathlib/LinearAlgebra/QuadraticForm/Real.lean:78` | equivalent_signType_weighted_sum_squared includes finite dimensionality, available here. |
| `Mathlib/Topology/EMetricSpace/Lipschitz.lean:72`; `Mathlib/Analysis/Calculus/Rademacher.lean:362` | LocallyLipschitzOn uses neighbourhoods within the set; Rademacher has finite-dimensional real domain/codomain assumptions. |
| `Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:310`; `Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:227` | LipschitzOnWith.absolutelyContinuousOnInterval and scalar AbsolutelyContinuousOnInterval.integral_deriv_eq_sub; coordinatewise use is valid. |
| `Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:113`; `Mathlib/Order/Zorn.lean:126` | arzela_ascoli requires compact range/equicontinuity; zorn_le_nonempty₀ takes a starting element and bounds only chains with a member. |
| `Mathlib/Analysis/ODE/PicardLindelof.lean:80`; `Mathlib/Analysis/ODE/ExistUnique.lean:57` and `:252` | IsPicardLindelof bundles state-Lipschitz, time-continuity and interval/norm bounds; existence uses CompleteSpace. ODE_solution_unique_of_mem_Icc uses an interior initial time and uniform Lipschitz bounds; compact subintervals provide the material-curve use. |
| `Mathlib/Analysis/Distribution/Sobolev.lean:153`; `Mathlib/Analysis/Fourier/LpSpace.lean:51` | TemperedDistribution.MemSobolev is Bessel-potential membership; MeasureTheory.Lp.fourierTransformₗᵢ is the native L² Fourier equivalence. |
| `Mathlib/Analysis/Calculus/BumpFunction/Basic.lean:70`; `Mathlib/Analysis/Calculus/BumpFunction/Normed.lean:35`; `Mathlib/Analysis/Convolution.lean:401` | ContDiffBump has positive inner radius and larger outer radius; its normalisation divides by its integral. MeasureTheory.convolution is a Bochner integral with the x−t convention. R08 distinguishes this bump class from an arbitrary even kernel. |
| `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145`, module discussion lines 15–36; `TauCeti/Analysis/Calculus/IteratedGradient.lean:64` | Wkp is real-valued and recursively uses continuous-linear derivative fields; higher operator norms need not be Hilbert norms. The coordinatewise multi-index norm is a genuinely distinct norm. |
| `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251` | HasWeakFDerivOn requires directional weak derivatives and local integrability, not L² by itself. §4.1 explicitly adds L² integrability. |
| `TauCeti/Analysis/Sobolev/BesselPotential/Basic.lean:133`; `TauCeti/Analysis/Sobolev/BesselPotential/Embedding.lean:81` and `:194` | memSobolev_natCast_iff_exists_wkp_value_eq requires 1<p<∞; exists_zeroAtInftyContinuousMap_ae_eq/toZeroAtInfty require dim E<2k and supply the stated representative/bounded map. |
| `TauCeti/Analysis/Sobolev/Wkp/SmoothDensity.lean:92`; `TauCeti/Analysis/Sobolev/Wkp/ApproximateIdentity.lean:52,67,107,118,132`; `TauCeti/Analysis/Sobolev/W1p/Mollification.lean:87` | dense_contDiff_representatives and normedBumpL require finite p; the lower-order/gradient commutations and convergence as outer radii→0 have the claimed native-bump signatures. |
| `TauCeti/Analysis/Sobolev/Leibniz.lean:112,168,317` | contDiffOn_smul for weak line/Fréchet derivatives and lipschitzOnWith_smul require one smooth/Lipschitz scalar factor. Two Sobolev factors need the roadmap's density argument. |
| `TauCeti/Analysis/Sobolev/Circle/Basic.lean:197,375`; `TauCeti/Analysis/Sobolev/Circle/Lp.lean:59` | CircleSobolev has Fourier weight (1+\|m\|)^{2s}; norm_sq_eq_tsum records it; toLpₗᵢ is at s=0 with positive period and probability Haar measure. |
| `TauCeti/Analysis/Sobolev/DifferenceQuotient.lean:152`; `TauCeti/Analysis/ODE/Gronwall.lean:59` | exists_norm_le_hasWeakLineDerivOn_of_frequently_eLpNorm_inv_mul_sub_le uses compact-set L² quotient bounds; le_mul_exp_of_le_add_mul_integral requires continuity and nonnegative coefficient. |

Object searches were run in both pinned libraries, main, readable board packages and indexed open heads, using the roadmap service for open work. The pins' Gagliardo–Nirenberg–Sobolev embedding (`Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean:303`) controls a first derivative and its Sobolev-conjugate norm; it is not §4.3's L∞/higher-derivative interpolation theorem. Elliptic Moser iteration is likewise a different object. No competing pinned symmetric-hyperbolic, acoustical-development or arbitrary-rank periodic Hᵏ carrier was found. Whole-space Sobolev, weak derivatives, native mollification and circle spaces are correctly imported as existing objects, subject to R08's exact scope correction.

The board package index was read before absence claims. The five overlap leads were examined at their available heads:

- **IncompressibleFlows, PR #237**, `TauCetiRoadmap/IncompressibleFlows/README.md:155`–177: finite-dimensional vector-valued weak spaces, intrinsic full-torus spaces and a real Fourier-order scale. The present arbitrary-rank periodic-lift extension is distinct; its full-rank comparison is explicitly in Scope and numerically checked above. It is not consumed as a supplier. This review does not authorise a second generic vector-valued Wkp carrier.
- **YangMillsConnectionsAndCaloricGauge, PR #2164**, `TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/README.md:55`–78 and `:143`: gauge-specific homogeneous products and parabolic heat flow; hyperbolic Yang–Mills is outside that roadmap. It requests generic vector-valued Sobolev infrastructure from PDE, not an Euler/symmetric-system carrier. No second owner of this roadmap's quasilinear energy theory was found.
- **PDE, revision PR #1614**, scope and analytic lanes, was read as overlap data. The supplier/scope citations were resolved against **main**, `TauCetiRoadmap/PDE/README.md:769` (§1.3), `:803` (§1.4), and Layer 7; main's scalar restriction is at lines 117–118 and 183. The open revision is not used as a dependency. PDE and PseudodifferentialOperators on main were also read as house-style examples.
- **RelativisticQuantumFieldTheory, PR #1772**, `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md:10` and `:325` (RQFT1.2): fixed-Minkowski Klein–Gordon causal Green/Cauchy theory, correctly distinguished in Scope from this general first-order quasilinear library.
- **NoncompactQuantumSymmetry, PR #1015**, `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md:4`–24: representation/symmetry theory, not fluid evolution or causal developments. No shared construction was found.

The supplied overlap facts list no dropped cited ids, revision-only cited ids, dropped owned ids or competing head changing this roadmap. The resolver found no unresolved cross-roadmap citation or roadmap Lean name, but explicitly did not check Lake declarations; those were opened separately above. The live overlap command reports no CompressibleEulerEquations roadmap on main or in an open content pull request, consistent with a design-stage candidate; it supplies no contradictory overlap facts. No unlisted open pull request was sought.

The readable companion LorentzianGeometry design still has the external half of old R12 outstanding (file/lines in the repair table). Both forms give g(B,B)=−4 and g⁻¹(dt,dt)=−1/4 at c=2,v=(1,0); only this roadmap includes the zero vector in its causal cone. The repaired downstream bridge handles that convention. The companion's edits remain its worker's responsibility, not a new finding against this package.

### Supply, shape, principles and acceptance-test scope

Every *Needs:* line and all plan prerequisites were read. No roadmap is an upstream supplier and there are no declared gaps. The target graph has 53 nodes and 109 internal prerequisite edges, with no missing target or cycle; §4.3's density proof uses §4.4, which depends only on §4.1/native inputs and must be implemented before that proof. This is an intra-layer scheduling edge, not a cycle. §6.2 uses Λ=0 local cones, while §8.4 uses the data period group. The source references are proof references, not substitutes for unowned library inputs; the inputs requiring clarification are R02 and R08.

Dependency gate output:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 232 roadmaps, 2071 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order/tooling change was made.

This remains a general Euler/symmetric-hyperbolic design. No route-specific choice of EOS, pressure sign, spatial dimension, full-rank lattice or compact data domain replaces the general statement. It does not re-plan the existing scalar PDE roadmap. Part II is explicitly separated at characteristic data/eikonal/geodesic and fractional-order theory. The eight mathematically named layers follow the inputs needed by the end theorems; no statement says the build follows a source, and no freely permutable run is presented as source chapter order. The independent Sobolev and causal branches join at uniqueness/local existence and then developments.

All eight layers have Examples and Dependencies. The thirteen definition/construction groups have API prose and at least three README Checks (related initial-data/development definitions share §8.1). The defects in exact hypotheses, constants, scope statements and Checks are itemised above. No copied source passage, executable algorithm, process handoff, machine path, PR-number supplier citation or HTML anchor was found in the README. Its backticked mathematical variables are notation, not claimed Lean declarations; named pinned declarations were resolved. Plan-only proposed names are design catalogue entries, not a claim that a Lean file already declares them. JSON and TOML parse, and source keys are unique.

Headline inventory:

1. §7.1 general symmetric-hyperbolic local existence, uniqueness, top-order continuous dependence, persistence and continuation; §7.2 barotropic/full Euler specialisations.
2. §6.1 lens uniqueness and §6.2 causal-past/domain-of-dependence uniqueness.
3. §§8.2–8.3 maximal common developments, compatibility/union, existence of maximal developments, uniqueness under a global extension, and existence from extended initial data, including full-data slab compatibility.
4. §8.4 nullity of the extendible regular boundary of a maximal development.

There is **no Suggested.lean in this design**. The package-only signature inventory, module docstring/import checks, sorry-data/set_option checks, one-tactic padding probe and mechanical `#check @name` comparison have zero applicable declarations. No build or sorry-only-warning result is claimed. This is not a missing-file finding at design stage. At package stage, real-bodied definitions on native carriers must make all statable headlines explicit; a missing heavy carrier must be named in the module docstring. Algebraic/constant-mode/empty-case Checks in this report are not substitutes for those headlines and must not become sorried padding. R04 must be corrected before translating the summary into acceptance signatures.

## Not verifiable

- Lean elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run and no mechanical binder comparison or one-tactic elaboration was possible.
- Kato1975 Theorem I, Majda1984 Ch.2 §§2.1–2.3/Theorem 2.1, and Dafermos2016 Ch.V §5.1/Theorem 5.1.1 remain **uncertified**. Their text, precise hypotheses and printed pages were not independently read; no new request was made.
- Christodoulou2007 Ch.1–2, HawkingEllis1973 §6.5, Friedrichs1954 pp.345–392 and ONeill1983 Ch.14 remain **waived**. Their locators were retained without claiming text verification or requesting them again.
- Ownership is checked against the readable supplied/indexed heads and board files. No content PR for the companion LorentzianGeometry design was identified in the supplied name index, so none is invented in this report. Its outstanding reciprocal ownership text is recorded under the settled prior finding.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp.24–25 (lines 864–880): the source says developments of identical data agree throughout their overlap and have a uniquely maximal union; it should be agreement on the maximal common development, with additional hypotheses for global uniqueness; affects a stated result.
- **Error** in LukNotes at Lemma 6.9, printed p.26 (lines 1616–1617): the source says f times one derivative of g has an Hˢ bound using only Hˢ regularity of g; it should be a commutator bound or include the missing derivative of g; affects a stated result.
- **Misprint** in LukNotes at §6, equation (6.2), printed p.20 (line 1221): the source says the coefficient matrix is zero at zero while uniformly close to Minkowski; it should be equal to the Minkowski matrix at zero; affects a stated result.
