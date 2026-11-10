# Review of CompressibleEulerEquations (design, round 2)

**Verdict:** needs changes

Reviewed `packages/CompressibleEulerEquations/design/README.md` (1,395 lines), `packages/CompressibleEulerEquations/design/plan.json` (53 targets, eight layers, no gaps), and `packages/CompressibleEulerEquations/sources.toml` (21 works). This is a design review; there is no `Suggested.lean`. Fourteen findings follow: three P1, nine P2, two P3. The design is repairable. No design or source-manifest entry was changed.

## R01 (P1) — The high-order forcing coefficient cannot depend only on K

**Location:** `packages/CompressibleEulerEquations/design/README.md:887`, “`C(K)E_k^{1/2}‖f‖_{Hᵏ_Λ}`”; `packages/CompressibleEulerEquations/design/plan.json:1186`, target 5.3.

**Claim:** the forcing coefficient is independent of spatial derivatives of the background U, even when A⁰ depends on U.

**Witness:** On the 2π-circle, k=2, take U=sin(mx), A⁰(U)=1/(2+U), A¹=0, f=1, W=(δ+t)(2+sin(mx)). Then E₂=(δ+t)²S_m, E₂′(0)=2δS_m, and S_m≥πm⁴/3.

Here G=(−3/2,3/2), K=[−1,1], Ū=0, and U is stationary, so all stated hypotheses hold. Put r=2+sin(mx). Explicitly S_m=∫(r²+r′²+r″²)/r. Divide the asserted inequality at t=0 by δ and let δ decrease to zero, with m fixed. It requires 2√S_m≤C(K)√(2π), hence C(K)≥√(2/3)m² for every m, impossible. The omitted commutator is [∂^α,A⁰(U)]∂_tW; eliminating ∂_tW differentiates (A⁰(U))⁻¹f.

**Repair:** retain the general system and replace the general linearised bound by one with both coefficients depending on a bound R for ‖U−Ū‖Hᵏ, as well as K and the fixed system, for example E_k′≤C(K,R)(1+‖∂_tU‖∞)E_k+C(K,R)√E_k‖f‖Hᵏ. State the time commutator in the route and justify the multiplier estimate for (A⁰(U))⁻¹f. Keep the separate nonlinear tame estimate. On this witness R grows as m² and the necessary forcing coefficient can grow as m²; the contradiction disappears. Add it as a negative-control Check.

## R02 (P1) — The time-derivative bound drops the source term

**Location:** `packages/CompressibleEulerEquations/design/README.md:897`, “`‖∂_tU‖_∞ ≤ C(K)‖∇U‖_∞`”.

**Claim:** every solution of the general system has its time derivative controlled by its spatial gradient.

**Witness:** Take scalar A⁰=1, A¹=0, F(u)=u, Ū=0, Λ=2πℤ, U(t,x)=eᵗ, 0≤t≤log 2, K=[0,2]. Then F(Ū)=0, ‖∂_tU(0)‖∞=1, and ‖∇U(0)‖∞=0.

**Repair:** use ‖∂_tU‖∞≤C(K)(‖F(U)‖∞+‖∇U‖∞), or ≤C(K)(1+‖∇U‖∞) when the source is bounded on K. The displayed homogeneous estimate is valid for F=0, including Euler, but must not replace the general statement. The corrected first bound gives 1≤C(K) on the witness. Carry this source contribution through the tame-energy proof; its existing “1+” allows it.

## R03 (P2) — Linear-existence energy constants omit the constant spatial matrices

**Location:** `packages/CompressibleEulerEquations/design/README.md:914`; `packages/CompressibleEulerEquations/design/plan.json:1214`, target 5.4. The listed dependence is on λ₀, ∂_tA⁰, A^μ−Ā^μ and B only.

**Claim:** those quantities uniformly control the high-order energy growth, regardless of Āⁱ.

**Witness:** On the 2π-circle, k=2, A⁰=e^{sin x}, A¹=M, B=f=0, W(0)=sin x+sin 2x: E₂(0)≤24eπ, while E₂′(0)=22πM. All listed coefficient bounds are independent of M.

For verification, set a=e^{sin x}, w=sin x+sin 2x and use W_t=−M w′/a. Integration by parts gives E₂′/M=2∫cos x(w′)²+4∫cos x(w″)²+2∫(−sin x−cos²x)w″w′. The four integrals are respectively 2π, 4π, π, and 0 before their displayed coefficients: the answer is 22π. Take Ā⁰=1, Ā¹=M and λ₀=e⁻¹.

**Repair:** allow C to depend also on the background matrices (or full uniform coefficient bounds), including the spatial Āⁱ; specify the fixed dimensions, order and period group. This admits C proportional to M on the witness. Update both copies and add this Check. The added C¹-in-time hypothesis from F02 remains correct.

## R04 (P2) — The weighted energy need not be finite

**Location:** `packages/CompressibleEulerEquations/design/README.md:839` and `:850`; `packages/CompressibleEulerEquations/design/plan.json:1153`, target 5.2. The hypothesis is “`W` be `C¹` on a neighbourhood of `{χ > 0}`”.

**Claim:** E_χ is a finite Lipschitz function of time under that hypothesis.

**Witness:** Let Λ=0, L=∂_t, χ=(1−|x|)₊, W=1/(1−x) on (−1,1), independent of t. Then LW=0 and σ(dχ)=0, but ∫₀¹χW²=∫₀¹(1−x)⁻¹dx=∞.

The open positivity set itself is a neighbourhood of that set. Smoothness there does not bound W at its boundary. A totalised nonintegrable Bochner integral would instead give a junk value, not the asserted energy.

**Repair:** state explicit integrability and time-regularity hypotheses sufficient for differentiation and integration by parts. A concrete version covering the intended lenses is: the spacetime support is compact modulo Λ, and W is C¹ on a neighbourhood of its closure (with periodicity for the quotient formulation). Keep a more general version only with explicit weighted integrability hypotheses. This excludes the witness; bounded C¹ W on the closed cone support yields finite energy and the stated calculation. Align §6.1's use of this theorem with these hypotheses.

## R05 (P2) — The inhomogeneous mollifier gain fails for large ε

**Location:** `packages/CompressibleEulerEquations/design/README.md:761`; `packages/CompressibleEulerEquations/design/plan.json:1050`, 4.4 gain_loss.

**Claim:** ‖J_εu‖Hᵏ⁺¹≤Cε⁻¹‖u‖Hᵏ for all ε>0, with C independent of ε.

**Witness:** Λ=2πℤ, u=1: J_εu=1 and both norms equal √(2π), so the claim requires 1≤C/ε. At ε=2C it requires 1≤1/2.

**Repair:** give the general bound C(1+ε⁻¹)‖u‖Hᵏ and its C′ε⁻¹ consequence for 0<ε≤1. Specify ε>0 in the README as the plan already does. The constant-mode witness now gives 1≤C(1+ε⁻¹), valid with C≥1. The repaired loss bound k≥1 is sound and should remain.

## R06 (P2) — Order-zero cases still break the interpolation/composition block

**Location:** `packages/CompressibleEulerEquations/design/README.md:720` and `:734`; `packages/CompressibleEulerEquations/design/plan.json:941`, target 4.3 (and 4.3.2 for the composition API).

**Claim:** k may be any natural number in the formulas 2k/i, i/k and the homogeneous top-derivative composition bound.

**Witness:** For k=i=0 the exponents contain 0/0. More decisively, Λ=0, u=Ū=0, Φ≡1, K={0}: D⁰Φ(u)=1 has infinite L² norm, whereas C‖D⁰u‖₂=0.

**Repair:** state Gagliardo–Nirenberg for k≥1, 1≤i≤k, with the i=0 endpoint separately as L∞. State the uncentred top-derivative composition bound only for k≥1; at k=0 use the already centred Φ(u)−Φ(Ū), which is zero on the witness. Spell out the k=0 interpolation endpoint in §4.2 instead of leaving j/k undefined. Add both endpoint Checks and synchronise the plan. This preserves all Sobolev orders, rather than excluding H⁰ from the library.

## R07 (P2) — The repaired norm comparison adds a false converse

**Location:** `packages/CompressibleEulerEquations/design/README.md:646`, “equal in the first case exactly when `k ≤ 1`”; `packages/CompressibleEulerEquations/design/plan.json:863`, eq_wkp.

**Claim:** equality of the whole-space norm structures fails at every order k≥2.

**Witness:** For scalar functions on ℝ, every iterated gradient has norm |u⁽ʲ⁾|. At k=2, u=e^{−x²}, both squared norms are 5√(π/2). Thus k=2 also gives equal norm structures in dimension one.

Pinned witness: `TauCeti/Analysis/Calculus/IteratedGradient.lean:64` recursively adds continuous linear maps; over a one-dimensional Euclidean domain each has the scalar absolute-value norm. `TauCeti/Analysis/Sobolev/GraphStep/Basic.lean:75` takes the squared-sum norm.

**Repair:** replace “exactly when” by “in particular when”; explicitly allow n=1 at every order. Preserve equivalence in general and the two-dimensional counterexample. For the latter, an integrated check is stronger than the local Hessian observation: for u=e^{−|x|²} on ℝ² the H² squared norm is 5π and the Wkp squared norm is (7/2+8e⁻²)π, which differ. This also avoids inferring unequal integrals merely from an inequality near one point.

## R08 (P1) — Timelike hyperplanes need not carry an indefinite form

**Location:** `packages/CompressibleEulerEquations/design/README.md:467`, “timelike (`g` indefinite on it)”; `packages/CompressibleEulerEquations/design/plan.json:532`, covector classification.

**Claim:** |ζ₀+v·ζ′|<c|ζ′| is equivalent to indefiniteness on ker ζ for every n≥1.

**Witness:** n=1, c=1, v=0, ζ=dx. The inequality is 0<1. But ker dx is the time axis and g((τ,0),(τ,0))=−τ²: negative definite, not indefinite.

**Repair:** define a timelike hyperplane by Lorentzian restriction, of signature (one negative, n−1 positive directions), including a negative-definite line when n=1. Say “indefinite” only for n≥2. With the repaired definition this witness is correctly timelike; its norm-square values are −1 and −4 at τ=1 and 2. Add it as a Check and make the plan's terminology agree.

## R09 (P2) — The union theorem needs a nonempty family

**Location:** `packages/CompressibleEulerEquations/design/README.md:1207`, “the union of any pairwise compatible family”; `packages/CompressibleEulerEquations/design/plan.json:1625`, target 8.2.1.

**Claim:** an arbitrary compatible family of developments of fixed data has its union as a development.

**Witness:** Take constant data on S=(−1,1) and the empty family. Compatibility is vacuous; its union is ∅, whose initial slice is ∅≠{0}×S.

**Repair:** require the family to be nonempty, or state the empty case only for S=∅. The Zorn proof uses upper bounds of nonempty chains above a specified development; `Mathlib/Order/Zorn.lean:126`, `zorn_le_nonempty₀`, has precisely this form. For a singleton family the union has initial slice {0}×S, and for empty S the unique empty development is available. Add both controls.

## R10 (P3) — Two source citations identify different statements

**Location:** `packages/CompressibleEulerEquations/design/README.md:729` cites LukNotes Lemma 6.9 for the product estimate; `:553` cites Chrusciel2011 §2.9 for the causal domain of dependence.

**Claim:** these locators directly support the displayed product bound and the causal-curve definition.

**Witness:** LukNotes line 1617, p.26, has f·∂ᵢg on its left, not fg. Chrusciel2011 lines 1843–1848, printed p.44, define dependence using timelike curves, not all causal curves.

**Repair:** derive the product bound from the stated Gagliardo–Nirenberg estimate and Leibniz rule, retaining Majda1984 §2.1 as the settled uncertified reference; do not cite Luk's displayed Lemma 6.9 as that product theorem. Label Chruściel's definition as the timelike variant; retain Minguzzi2019 Definition 3.1 and MinguzziCone2019 Definition 2.17 for the causal notion, with their stated regularity/closedness qualifications. Update plan locators and manifest annotations without changing source identities. The derivative mismatch is substantive: for f fixed and equal to 1 on supp g_m, g_m=η sin(mx), the printed left side at s=1 grows as m² while its right side grows only as m. See Source issues.

## R11 (P2) — The zero-multiplicity repair was not propagated to the general-system block

**Location:** `packages/CompressibleEulerEquations/design/README.md:369` (largest root) and `:383` (wave-system eigenvalues); `packages/CompressibleEulerEquations/design/plan.json:304` and `:321`.

**Claim:** the cone-speed recipe is defined for every system size N, and ζ₀ is an eigenvalue of the first-order wave symbol in every spatial dimension n≥1.

**Witness:** At N=0, the determinant is constantly 1 and has no largest root. At n=1, ζ=(0,1), the wave symbol is [[0,−1],[−1,0]], with determinant −1 and eigenvalues −1,1; 0 is absent.

**Repair:** retain zero-size systems but define κ=(1,0) separately when N=0; use the largest-root recipe only when N>0. State the wave eigenvalue ζ₀ with multiplicity n−1, hence absent at n=1, exactly as the repaired Euler statement does. On the witnesses, the zero-dimensional symbol is positive semidefinite vacuously and the 2×2 characteristic polynomial is λ²−1. Add both Checks.

## R12 (P2) — The board designs assign the acoustical form to two owners

**Location:** `packages/CompressibleEulerEquations/design/README.md:35` and `:61`–`:67`, ownership of the explicit acoustical form and its inverse/signature; compare `packages/LorentzianGeometry/design/README.md:204`, §1.9, and `:661`, its consumer list.

**Claim:** this roadmap owns that construction and a general Lorentzian roadmap will consume it; the companion design instead constructs it and advertises supplying it to CompressibleEulerEquations.

**Witness:** `packages/LorentzianGeometry/design/README.md:210` constructs the same a_{c,v}, B, inverse and causal inequality; line 212 needs only its own layers and libraries. Line 661 supplies this acoustical theory to CompressibleEulerEquations.

**Repair:** settle ownership explicitly with the companion design: keep the concrete Galilean form, inverse and elementary cone calculations here (§3.1); LorentzianGeometry §1.9 imports them and owns their identification with its general forms, while §2.5 owns the manifold metric extension. State that named downstream contract here and remove the reverse supply in the companion design before accepting both. Do not make LorentzianGeometry an unlisted upstream supplier. The bridge must also say that its “causal vector” excludes zero, whereas this roadmap's nonpositive quadratic cone includes zero. Both conventions give g(0,0)=0; the bridge must restrict to nonzero vectors.

This is a board-design overlap, not a claimed open content pull request: no LorentzianGeometry content PR appeared in the supplied index/search, so no PR number is invented. The previous review's assertion that this folder contained only a target is no longer true of the supplied checkout.

## R13 (P3) — The isothermal Check omits the sign of its parameter

**Location:** `packages/CompressibleEulerEquations/design/README.md:263`, “The isothermal law `p = a²ρ` has constant sound speed `a`”.

**Claim:** the sound speed is a rather than |a|.

**Witness:** a=−1 gives p=ρ, p′=1>0 and c=√1=1, while the Check reports −1. The standing equation-of-state assumptions do not exclude a=−1.

**Repair:** write c=|a| for a≠0, or explicitly assume a>0 in this Check. Include a=0 as the excluded zero-sound-speed case. On a=−1 the corrected value is 1.

## R14 (P2) — The periodic Friedrichs commutator needs a periodic coefficient

**Location:** `packages/CompressibleEulerEquations/design/README.md:763`, “for `a` bounded and Lipschitz”; `packages/CompressibleEulerEquations/design/plan.json:1055`, 4.4 friedrichs_lemma.

**Claim:** the commutator is an operator into L²_Λ for every bounded Lipschitz a.

**Witness:** For Λ=2πℤ, u=sin x, a=sin(x/2), the commutator is nonzero and 2π-antiperiodic. At x=π and 3π its values are respectively μ₂ε²/8+o(ε²) and its negative, where μ₂=∫y²φ(y)dy>0.

Indeed its exact value is half of (φ̂(3ε/2)−φ̂(ε))sin(3x/2)−(φ̂(ε/2)−φ̂(ε))sin(x/2). The expansion φ̂(η)=1−μ₂η²/2+o(η²) gives the values above. It therefore does not belong to the periodic carrier L²_Λ, although both u and the coefficient satisfy the written hypotheses.

**Repair:** require a to be Λ-periodic for the quotient-space theorem, and retain the arbitrary bounded Lipschitz coefficient theorem for Λ=0. State the same hypothesis in the plan API. The nonperiodic witness is then correctly excluded; a=sin x instead gives a periodic commutator, and constant a gives zero. Do not silently interpret L²_Λ as integration over an arbitrary chosen cell for nonperiodic functions.

## Verified sound

### Previous findings, checked first

The previous review and repair report were read before the new pass. None was marked “not actionable”; no settled finding is re-raised. The following quotations are from the repaired README and were checked against the corresponding plan entries.

| Prior finding | Repaired passage | Status and witness |
| ---\|---\|--- |
| F01 | §2.2: “when that root has positive multiplicity” | **Repaired** in §§2.2/3.1 and plan 2.2.3/3.1.1. At n=1 the barotropic material covector still has determinant −16, correctly nonsingular. The same pattern survives elsewhere: R11. |
| F02 | §5.4: “`A⁰ − Ā⁰ ∈ C¹([0, T]; Hᵏ⁻¹_Λ)`” | **Repaired**; at n=1,k=2, 2(k−1)=2>1, so ∂_tA⁰ is bounded. §7.1 supplies it by the chain rule. The newly specified constant has the independent defect R03. |
| F03 | §4.4: “and, for `k ≥ 1`” | **Repaired** for the loss estimate, including its negative control. Related endpoint defects remain in R05–R06; the periodic commutator has the separate R14 defect. |
| F04 | §6.1: “the *periodised moving cone*” | **Repaired**. Periodicity and the domination sign are correct, including the §5.2 weight. For the arbitrary domains in §6.2, instantiate the cone theorem with Λ=0; for §8.4 use the data period group. Both are allowed cases of the definition. |
| F05 | §4.1: “equivalent norms in both cases” | **Partly repaired**. Equivalence is right; the added “exactly when k≤1” is false: R07. |
| F06 | supplier contracts: “`TauCeti.Wkp.normedBumpL`”; §4.3: “two Sobolev factors by density” | **Repaired as to the cited ownership**. Opened the mollifier, Leibniz and circle declarations at the pin; their precise domains are recorded below. General even kernels still need the elementary Young/convergence transfer from the normalised-bump interface. |
| F07 | §3.3: “the open-`S` statement on a domain is proved here” | **Repaired**. Minguzzi2019 Proposition 3.16 is now accurately identified as the closed-achronal classical analogue; definitions are no longer claimed to be the openness theorem. The separate timelike-definition citation is R10. |

### Computed adversarial table

This table covers every seeded section, all headlines, all repair additions and every finding. The preceding round's numerical rows were reused only for unchanged statements with actual computed values; its qualitative compactness and uniqueness summaries were checked again via the limit-curve and first-exit arguments and the explicit cases below. Formula checks alone are not proofs of the global PDE theorems.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| ---\|---\|---\|--- |
| Conventions: signature and normalisation | c=1,v=0; X=(1,1/2),(1,1),(1,2); c=2 | g(X,X)=−3/4,0,3; g⁻¹(dt,dt)=−1/4; normalised g(B,B)=−1 versus unnormalised −4 | Sound |
| §1.1 state laws | p=ρ²/2 at ρ=4; p=−A/ρ; isothermal a=−1 | c=2; p′=A/ρ²>0; √a²=1≠−1 | R13 only |
| §1.2 material/conservative equivalence | expanding flow n=1,t=1 | ρ_t=−ρ₀/4, (ρv)_x=ρ₀/4; v_t+vv_x=−x/4+x/4=0 | Sound; division uses ρ>0 |
| §1.2 Galilean sign | expanding flow, boost w=1,t=1 | correct residual 0; omitting +w gives −1/2 | Sound |
| §1.3 full equations, reduction | P=e^sρ²,s=x,ρ=e^{−x/2},v=0 | P=1, BP=Bs=Bρ=Bv=0; omitted entropy pressure term leaves −e^{x/2}; at s=0 both c²=2ρ | Sound |
| §2.1 carrier and cone monotonicity | scalar a=3,ζ=(1,−1); enlarged cone | cone inequality 1≥1 but σ=−2; in general σ≥(ζ₀−λ\|ζ′\|)A⁰≥\|ζ′\|A⁰ for κ=(1+λ,0), N>0 | Sound in positive size |
| §2.1 size/spectral degeneracies | N=0; wave n=1,ζ=(0,1) | det(empty)=1, root set ∅; wave det=−1, eigenvalues −1,1 rather than −1,0,1 | R11 |
| §2.2 Euler symmetrisers | n=1,ρ=1,c=2,v=3; full ideal gas | det(A¹−λA⁰)=4(λ−1)(λ−5); full S leading minors 2,2,2, versus determinant 0 for d=1/2 | Sound |
| §§2.2/3.1 repaired material sheet | ζ=(−3,1), barotropic n=1; full n=1 | barotropic σ=[[0,4],[4,0]], det=−16, g⁻¹=1; full material row gives det=0 | F01 repaired |
| §2.2 dominance iff | c=2,v=3; cones (2,3),(2,0),(5,0) | thresholds 2≥2, 2<5, 5=5; failure symbol margin −3 | Sound, both directions |
| §3.1 inverse and covariance | n=2,c=2,v=(1,0) | Gram determinant −4; product with stated inverse I₃; g(1,3,0)=0=g_static(1,2,0) | Sound |
| §3.1 hyperplane type | n=1,c=1,v=0,ζ=dx | 0<1; restriction −τ², with values −1,−4 | R08 |
| §3.2 causal curve versus a.e. slope alone | x=t/2, x=2t, x=\|t\|; Cantor curve 10f | slopes 1/2≤1, 2>1, \|±1\|=1; Cantor displacement 10>∫c=1 despite derivative 0 a.e. | Sound |
| §3.3 compact past and openness | constant field, p=(t,x) in half-space | J⁻(p)={(s,y):0≤s≤t, \|y−x+(t−s)v\|≤c(t−s)}; slice at 0 is closed ball centred x−tv of radius ct | Compact; fits open S exactly when whole ball does |
| §3.3 open data and idempotence | c=1,v=0,S=(−1,1) | D⁺={\|x\|+t<1}; J⁻ of (1/2,0) has base [−1/2,1/2]; recomputing inside D⁺ gives the same set | Sound; base margin 1/2 |
| §3.3 closed-domain control | D={\|x\|≤1+t}, p=(1,1.9) | closed D⁺=D; in open version constant x=1.9 hits boundary at s=0.9 and misses S; D⁺={\|x\|<1−t} | Sound |
| §3.3 unbounded-field slab control | v=x²,c=1,x(s)=1/(1/4−s) | x(1/2)=−4, x′=x², x→−∞ at 1/4>0 | Point excluded from D⁺(Σ₀), boundedness needed |
| §3.3 expanding domain | ρ=(1+t)⁻¹,v=x/(1+t),p=ρ²/2 | half-width b(t)=2√(1+t)−(1+t); b(1)=2√2−2; b(3)=0 | Sound |
| §4.1 rank and quotient integration | constant 1; Gaussian×cosine cylinder | full torus norm²=(2π)ⁿ, noncompact quotient ∞; cylinder L² norm²=π√(π/2) | Sound |
| §4.1 Wkp comparison | Gaussian, n=1,k=2 and n=2,k=2 | n=1: both 5√(π/2); n=2: H²=5π, Wkp²=(7/2+8e⁻²)π | R07; equivalence survives |
| §4.1 CircleSobolev comparison | cos x, constant 1, period 2π,k=1 | circle squared norms 2,1; roadmap 2π,2π; ratios π,2π | New Check sound; equivalent, not proportional |
| §4.2 embedding/interpolation | e^{−x²},j=1,k=2; critical log-log n=2 | norms²: a,a,3a, a=√(π/2); 2a≤√5 a; critical derivative integral ∫dr/(r log²(1/r))<∞ while supremum=∞ | Sound with strict threshold |
| §4.2 wrong exponent control | u(λx),j=1,k=2 | correct sides grow λ^{1/2}; proposed wrong exponent pair gives λ^{1/6} | Sound |
| §4.3 GN, positive orders | k=2,i=1,Gaussian | ‖u′‖₄⁴=3√π/8; homogeneous sides scale λ^{1−1/4}; L² singularity test has ∫u²<∞ but ∫u⁴=∞ | Positive-order checks sound |
| §4.3 composition endpoints | Φ(z)=z²,k=1; Φ≡1,u=Ū=0,k=0 | derivative 2uu′ bounded by 2‖u‖∞‖u′‖₂; at k=0 uncentred sides ∞ and 0 | R06 |
| §4.4 gain and loss | u=1,ε=2C; cos(mx),k=0/1 | gain requires 1≤1/2; k=0 loss ratio tends to 1; k=1 ratio ≤εm∫\|y\|φ and ‖cos(mx)‖H¹=√(π(1+m²)) | F03 repaired; R05 remains |
| §4.4 commutator | a constant; a=x | constant commutator 0; linear coefficient kernel ψ′ has norm ∫\|φ+wφ′\| independent of ε | Sound |
| §4.4 periodic coefficient | a=sin(x/2), u=sin x, Λ=2πℤ | commutator at π is μ₂ε²/8+o(ε²), at 3π its negative; periodicity would require equality | R14 |
| §5.1 identity/sign | transport; B=bI; nonsymmetric Jordan block | E′=0; E=e^{−2bt}E₀; Jordan solution (g−tf′,f) grows with t‖f′‖₂ | Sound for finite energies and bounded coefficients |
| §5.2 monotone moving weight | c=1,v=3,static versus moving | static worst defect 4−M; co-moving worst defect 1−M | Thresholds 4 and 1 correct |
| §§5.2/6.1 periodised cone | Λ=2πℤ,R<π,at x₀ and x₀+2π | both values R; dφ=(e·w−M,−e), dual test M−e·w+w·e=M | F04 periodicity/sign repaired |
| §5.2 energy regularity | χ=(1−\|x\|)₊,W=(1−x)⁻¹ | LW=σ(dχ)=0; weighted integral ∞ | R04 |
| §5.3 general forcing | U=sin(mx),W=(δ+t)(2+sin(mx)) | E=δ²S_m,E′=2δS_m; required C≥√(2/3)m² | R01 |
| §5.3 nonlinear tame estimate and source | Burgers; u=eᵗ,F(u)=u | Burgers (‖u_x‖²)′=−∫u_x³; spatially constant u has u_t=1,u_x=0 at 0 | Tame “1+” sound; R02 |
| §5.4 repaired regularity and background speed | n=1,k=2; a=e^{sin x},A¹=M | 2(k−1)=2>1; E₂′=22πM, E₂≤24eπ | F02 repaired; R03 |
| §6.1 local uniqueness control | transport a=1, cone speed 1 versus 1/2 | weight defect ≤0 versus 1/2 on x<0; translating bump enters slow cone | Correct discriminator |
| §6.2 general-domain route | p=(1/2,0),O width 4 | past spatial width≤1<4; choosing Λ=0 permits local cones within O, whereas a 2π-periodic pair has distance 2π>4 | Apply the universally stated lens theorem with zero period group |
| §7.1 local theory and continuation | Burgers u₀=−e^{−x²}; F≡1 on ℝ | min u₀′=−√2e⁻¹ᐟ²; T*=e¹ᐟ²/√2; constant source gives u₀+t with infinite L² perturbation | Checks sound; equilibrium needed |
| §7.1 new iterate regularity | n=1,k=2 | ∂_tA⁰(U^m)=DA⁰(U^m)∂_tU^m; H¹ embeds in C_b since 2>1 | Time regularity supplied |
| §7.2 Euler headline | p=ρ³/3, ρ̄=1+e^{−x²}/2,v̄=ρ̄−1 | c=ρ,v−ρ=−1,v+ρ=1+e^{−x²}; T*=e¹ᐟ²/√2, 1≤ρ≤3/2 | Non-vacuum blow-up Check sound |
| §7.2 Sobolev threshold | n=3 | k=3:6>5; k=2:4<5 | Matches stated cylinder H³ example |
| §7.3 uniformly local data | v=±2 outside [−1,1],ρ=1/2 | local cutoff norms uniformly bounded; for any constant background one tail has nonzero constant difference, global L²=∞ | Distinguishes uniformly local from affine Hᵏ |
| §8.1 developments | S=∅; slow cone | D⁺(∅)=∅ by existence of inextendible curves; from (1,0.4), x(s)=1.4−s exits slow cone at s=0.8 | Definition rejects wrong models |
| §8.2 maximal common / compatibility | counter-flow states ρ=1/2,v=±2 | c=1; towers x<−1+t and x>1−t; at (2,0) velocities 2 and −2; W₁₂ is the part t<1 | Nonuniqueness witness sound; fields agree precisely on common development |
| §8.2 compatible union, Zorn | empty family, S=(−1,1); singleton | initial slices ∅ versus S; singleton slice S | R09; nonempty-chain Zorn route sound |
| §8.2 global uniqueness criterion | constant global extension,S=B(0,R) | every past base ball lies in S iff \|x−tv\|+ct<R; largest domain is exactly that cone | Criterion sound |
| §8.3 existence/slab headline | constant half-space data | D⁺={x¹>(v¹+c)(t−t₀)}; for S=E every past curve reaches Σ₀, so D⁺=whole slab | Sound |
| §8.4 boundary headline | φ=t−T; expanding-flow boundary at t=1 | first case 1>0; second 1−1/√2+√2−1=1/√2=c\|φ_x\| | Truncation spacelike; extendible maximal boundary null |
| §8.4 new translated lens | 2ε below nonzero period separation | translates disjoint; backward cone speed bound <M gives nondecreasing ψ backwards | Periodisation is appropriate here |
| Shared acoustical object | c=2,v=(1,0); zero vector | both roadmaps give g(B,B)=−4,g⁻¹(dt,dt)=−1/4; g(0,0)=0 but only one calls zero causal | R12 ownership/bridge |

### Seeded source verification

All 15 seeded sections were checked. The cached PDF pages for Nirenberg p.125 and Luk pp.20,26 were rendered and inspected to resolve missing or suspicious extracted formulas. The table distinguishes a direct statement from background or an analogue. Page numbers refer to the cached version recorded in the manifest; where PDF and printed pagination differ, this is explicit. No new source key or fetch was needed.

| Target | Text opened and locator | Support and limits |
| ---\|---\|--- |
| 1.2 | ChristodoulouMiao2014 lines 481–529, eqs.(1.4),(1.9),(1.10), pp.15–16; lines 818–822, p.23; LuoYu2023a lines 82–95, pp.2–3; AbbresciaSpeck2022 lines 158–164, p.4 | Mass/momentum and Galilean invariance resolve. Luo–Yu is two-dimensional, polytropic, 1<γ<3; it is an instance, not evidence for all equations of state. General dimensional invariance follows from the displayed calculus. |
| 1.3 | ChristodoulouMiao2014 lines 530–544, p.16, and 833–838, eqs.(2.1)–(2.3), p.24; AbbresciaSpeck2022 lines 158–171, p.4 | Entropy transport and full pressure gradient resolve; the roadmap correctly adds bounded velocity to the backwards-material-curve argument. |
| 2.1 | Christodoulou2019 lines 124–126, Prologue, PDF p.5 | Says first-order quasilinear hyperbolic for Euler, not the full abstract carrier/API. Friedrichs1954, Majda1984 and Dafermos2016 are settled inaccessible references. Algebraic API tested independently, including R11. |
| 2.2 | Majda1984 Ch.2 §2.1; Dafermos2016 Ch.V §5.1 | Uncertified texts, not rerequested. Explicit matrices, principal minors, spectrum and dominance checked directly. |
| 3.3 | Minguzzi2019 lines 1917–1936 (§2.11, p.45), 3576–3586 (Definition 3.1, p.84), 3716–3735 (Proposition 3.16, p.87); MinguzziCone2019 lines 1737–1744 (Definition 2.17, p.43); BarGinouxPfaffle2007 lines 1006–1017 (Definition 1.3.5, PDF p.28, printed p.22); Chrusciel2011 lines 1169–1191 and 1843–1858 (printed pp.28,44) | Classical open-set/closed-achronal and continuous/piecewise-C¹ qualifications checked. New open-S half-space results are explicitly proved here, not attributed to those definitions. Chruściel uses the timelike variant: R10. |
| 4.1 | AbbresciaSpeck2022 lines 149–152,176–179, p.4; pinned Wkp/Circle declarations below | Cylinder and H³ setup resolve. This is background for the new arbitrary-rank lift construction, not a source theorem constructing it. |
| 4.2 | LukNotes lines 1210–1212, Theorem 5.5, p.20; pinned embedding and difference quotient declarations | Whole-space sup bound s>n/2 resolves. Higher derivatives and partial periodicity are the roadmap's transfer. Majda's additional locators remain uncertified. |
| 4.3 | LukNotes lines 1612–1617, Lemmas 6.8–6.9, p.26; Nirenberg1959 lines 318–329, Lecture II theorem, printed p.125 | Composition source has F(0)=0, handled by centring. Lemma 6.9 is not the claimed product statement (R10). Nirenberg printed p.125 was also inspected in the cached PDF: set m=k, j=i, q=∞, r=2, a=i/k in (2.2)–(2.3), obtaining 1/p=i/(2k). For 0<i<k the exceptional a=1 case does not arise; i=k is the identity endpoint. This supports the positive-order formula, not k=0. |
| 4.4 | Friedrichs1954 and Majda1984 §2.1; pinned ApproximateIdentity declarations | Settled inaccessible texts. Native normalised-bump contraction, commutation and convergence inspected; elementary Fourier/constant-mode tests detect R05. |
| 5.2 | LukNotes lines 724–726, Proposition 4.4, p.13, proof p.14 | Local energy on the backward unit-speed wave cone, not the whole Lipschitz-weight theorem. Roadmap's sign is right; its regularity extension needs R04. |
| 5.3 | LukNotes lines 1620–1645, Theorem 6.10, p.26; Majda1984 §§2.1–2.2 | Luk states wave breakdown criteria, not the displayed general-system estimate. R01/R02 come from direct counterexamples, not guesses about Majda. |
| 5.4 | LukNotes lines 1158–1205, Theorem 5.3, p.19; Kato1975 Theorem I, Majda1984 §2.1 | Duality-based wave existence is an analogue with its own coefficient hypotheses. It does not certify the revised system constant; R03. Inaccessible source hypotheses were not asserted to have been independently read. |
| 7.1 | LukNotes lines 1214–1250, Theorem 6.1, p.20, and 1620–1645, Theorem 6.10, p.26 | Wave theorem uses H^{n+2}×H^{n+1}, and Theorem 6.1 gives continuous dependence below the top order. The printed coefficient normalisation (6.2) also contains the misprint recorded below. It is only the stated wave analogue, not certification of optimal-order system continuity. Kato/Majda/Dafermos remain uncertified. |
| 7.2 | AbbresciaSpeck2022 lines 172–179, p.4; ChristodoulouMiao2014 lines 866–868, p.24; LuoYu2023a lines 82–95 | Cylinder non-vacuum H³ local theory is described, not a general-dimension theorem with all these conclusions. The general result is the §7.1 application to the computed symmetrisers. Chaplygin exclusion concerns the source's shock results. |
| 8.2 | EperonReallSbierski2019 lines 767–768 (Theorem 3.45, p.19), 1129–1144 (definition, p.28), 1178–1189 (Proposition 4.63, p.29), 1228–1240 (Theorem 4.64/proof, p.30), 1338–1344 (Corollaries 4.68–4.69, p.32); AbbresciaSpeck2022 lines 408–414, p.9 | ERS concerns quasilinear wave equations and connected initial hypersurfaces; its union construction explicitly starts from a nonempty family (line 1236). Roadmap's disconnected Euler example is independently checked, not an instance of that connected-data corollary. R09 is a missing hypothesis in the roadmap's general union. |

The remaining changed-boundary locators were opened: Christodoulou2019 lines 131–138 (Prologue, PDF p.5), ChristodoulouMiao2014 lines 880–886 (p.25), and LuoYu2023b lines 417–419 (§1.4.2, p.11). They describe the regular characteristic boundary; the roadmap supplies its own maximality/extension proof rather than treating the descriptions as a general low-regularity theorem.

### Pinned library and ownership audit

Pins match the plan: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declarations and signatures were opened at those pins; no claimed absent identifier was inferred merely from the resolver.

- Mathlib `Matrix.PosSemidef` and `Matrix.PosDef`, `Mathlib/LinearAlgebra/Matrix/PosDef.lean:62` and `:176`: Hermitian plus the finite-support quadratic inequality; positive definiteness is vacuous in size zero, relevant to R11. `QuadraticForm.equivalent_signType_weighted_sum_squared`, `Mathlib/LinearAlgebra/QuadraticForm/Real.lean:78`, includes finite dimensionality.
- `ContDiffOn`, `Mathlib/Analysis/Calculus/ContDiff/Defs.lean:471`; `UniqueDiffOn`, `Mathlib/Analysis/Calculus/TangentCone/Defs.lean:153`; `uniqueDiffOn_convex`, `Mathlib/Analysis/Calculus/TangentCone/Real.lean:80`. The latter requires nonempty interior; the half-space has it. Relatively open restrictions inherit unique differentiability locally, even though an arbitrary domain itself need not be convex.
- `LipschitzOnWith.ae_differentiableWithinAt_of_mem`, `Mathlib/Analysis/Calculus/Rademacher.lean:362`, is finite-dimensional real Rademacher. `LipschitzOnWith.absolutelyContinuousOnInterval`, `Mathlib/MeasureTheory/Function/AbsolutelyContinuous.lean:310`; scalar `AbsolutelyContinuousOnInterval.integral_deriv_eq_sub`, `Mathlib/MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:227`; `BoundedContinuousFunction.arzela_ascoli`, `Mathlib/Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:113`, uses compact range and equicontinuity.
- `IsPicardLindelof`, `Mathlib/Analysis/ODE/PicardLindelof.lean:80`, includes Lipschitz-in-state, continuous-in-time, norm and interval bounds. `IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt`, `Mathlib/Analysis/ODE/ExistUnique.lean:57`, uses a complete normed space. `ODE_solution_unique_of_mem_Icc`, same file `:252`, has an interior initial time and uniform Lipschitz constant; apply it on compact subintervals for material curves. `zorn_le_nonempty₀`, `Mathlib/Order/Zorn.lean:126`, supplies nonempty-chain maximality, not an empty-family union.
- `TemperedDistribution.MemSobolev`, `Mathlib/Analysis/Distribution/Sobolev.lean:153`, is the Bessel-potential membership predicate. `ContDiffBump`, `Mathlib/Analysis/Calculus/BumpFunction/Basic.lean:70`, has 0<rIn<rOut and constructs the library bump, not an arbitrary even test function. `MeasureTheory.convolution`, `Mathlib/Analysis/Convolution.lean:401`, and the Fourier isometric equivalence `MeasureTheory.Lp.fourierTransformₗᵢ`, `Mathlib/Analysis/Fourier/LpSpace.lean:51`, supply the native convolution/Plancherel objects. The small carrier names `fderivWithin`, `LocallyLipschitzOn`, `Matrix.IsHermitian`, and `Matrix.det` also resolve at the pin.
- `TauCeti.Wkp`, `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145`, is scalar-valued, order zero Lp, with iterative derivative graphs. Its module description at lines 15–36 explicitly distinguishes the operator derivative norm from a Hilbert Hᵏ norm. `TauCeti.HasWeakFDerivOn`, `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251`, quantifies directional weak derivatives and local integrability; it does not itself assert L² integrability. This distinction is respected by §4.1's additional hypotheses.
- `MeasureTheory.Lp.memSobolev_natCast_iff_exists_wkp_value_eq`, `TauCeti/Analysis/Sobolev/BesselPotential/Basic.lean:133`, requires 1<p<∞. `TemperedDistribution.MemSobolev.exists_zeroAtInftyContinuousMap_ae_eq`, `TauCeti/Analysis/Sobolev/BesselPotential/Embedding.lean:81`, and `TauCeti.Wkp.toZeroAtInfty`, same file `:194`, require dim E<2k and produce the claimed continuous representative/bounded map.
- `TauCeti.Wkp.dense_contDiff_representatives`, `TauCeti/Analysis/Sobolev/Wkp/SmoothDensity.lean:92`, requires p≠∞. `normedBumpL`, `norm_normedBumpL_le_one`, `lowerOrder_normedBumpL`, `iteratedGradient_normedBumpL`, `tendsto_normedBumpL`, `TauCeti/Analysis/Sobolev/Wkp/ApproximateIdentity.lean:52,67,107,118,132`, have the claimed domains and convergence through outer radii tending to zero. `TauCeti.W1p.normedBumpL`, `TauCeti/Analysis/Sobolev/W1p/Mollification.lean:87`, is the first-order case.
- The three cited Leibniz declarations in `TauCeti/Analysis/Sobolev/Leibniz.lean:112,168,317` require one smooth/Lipschitz scalar factor. The design correctly retains the two-Sobolev-factor density step. `TauCeti.CircleSobolev`, `TauCeti/Analysis/Sobolev/Circle/Basic.lean:197`, `norm_sq_eq_tsum` at `:375`, and `toLpₗᵢ`, `TauCeti/Analysis/Sobolev/Circle/Lp.lean:59`, give precisely the Fourier weights and probability Haar convention used by the new Check; toLpₗᵢ is at order zero and assumes T>0.
- `TauCeti.exists_norm_le_hasWeakLineDerivOn_of_frequently_eLpNorm_inv_mul_sub_le`, `TauCeti/Analysis/Sobolev/DifferenceQuotient.lean:152`, gives a derivative from uniform compact-set L² difference-quotient bounds. `TauCeti.le_mul_exp_of_le_add_mul_integral`, `TauCeti/Analysis/ODE/Gronwall.lean:59`, requires continuous φ and K≥0.

Ownership was searched by object in both pinned trees, main, the board packages, and the indexed open heads, using `roadmaps grep` for symmetric hyperbolic systems, domains of dependence, acoustical forms, Moser/Gagliardo–Nirenberg estimates and Friedrichs mollifiers. Mathlib's Gagliardo–Nirenberg–Sobolev embedding and Tau Ceti's elliptic Moser iteration are different objects from §4.3's interpolation/tame calculus. No pinned symmetric-hyperbolic or acoustical-development carrier was found. The partial-periodic extension has a genuine new arbitrary-rank scope; the whole-space and circle inputs are cited. The companion board ownership conflict is R12.

The board-package index was read before making any absence statement. All five closest-roadmap leads in `scratch/overlaps.md` were inspected:

- IncompressibleFlows, open PR #237, `TauCetiRoadmap/IncompressibleFlows/README.md`, Layer 0, items 1–5 (lines 155–177 of the returned head): intrinsic full-torus weak spaces and real-order Fourier scale, and finite-dimensional vector-valued bridges. The design records the full-rank overlap and distinct arbitrary-rank lift construction; the computed H¹ rescaling Check is accurate. IncompressibleFlows is not consumed as a supplier.
- PDE on main, `TauCetiRoadmap/PDE/README.md:769` (§1.3), `:803` (§1.4), `:2661` (Layer 7), resolves every scope citation; the superseding pinned weak/Bessel comparison is indeed available. Its scalar elliptic/parabolic scope is recorded at `:117` and `:183`. Open revision #1614 is not used as a supplier. PDE and PseudodifferentialOperators on main were read as house-style examples.
- RelativisticQuantumFieldTheory, open PR #1772, `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md`, scope and RQFT1: fixed Minkowski Klein–Gordon/Dirac/Maxwell propagators, not the quasilinear Euler development object. The named deferral resolves.
- NoncompactQuantumSymmetry, open PR #1015, `TauCetiRoadmap/NoncompactQuantumSymmetry/README.md`, Scope and ownership: group representations and Galilei/Poincaré symmetry; no competing fluid evolution or Sobolev calculus.
- QuasiregularMaps, open PR #2134, `TauCetiRoadmap/QuasiregularMaps/README.md:35`, owns distortion, ACL and quasiregular maps on W^{1,n}_loc, not this Hᵏ evolution theory.

The overlap file lists no dropped ids, open-revision-only ids or conflicting heads for this roadmap. The resolver likewise found no unresolved roadmap citations; its output explicitly excludes pinned Lake declarations, which were checked separately above. No fully qualified Lean declaration collision can occur in a nonexistent design-stage Suggested.lean.

### Supplier order, shape, principles and acceptance-test scope

All *Needs:* lines were read. No roadmap is an upstream supplier, the plan's suppliers and gaps are empty, and all external analysis inputs are pinned declarations. The local prerequisites requiring repair are in R01 and R04. The arbitrary-domain proof of §6.2 uses the zero-period-group instance of §6.1, while §8.4 uses the development's period group; no nonempty periodic cone must fit in an arbitrary small neighbourhood. The density step in §4.3 refers to §4.4, which depends only on §4.1 and pinned density; this is an acyclic same-layer scheduling edge, and the implementation order must honour it.

Dependency check output:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after QuasiregularMaps (the intake inserts it when its design is accepted)
depcheck: 234 roadmaps, 2109 edges, 0 problem(s)
```

No UPWARD or CYCLE line. No merge-order or tooling file was edited.

The mathematical scope is a general library of Euler/symmetric-hyperbolic theory, not a route-specific shortcut or a re-planning of the scalar PDE roadmap. No computational algorithm, copied source passage, process hand-off block, machine path, HTML anchor, or PR-number supplier citation was found in the design README. Its eight layers each end in Examples and Dependencies. All thirteen definition/construction groups have an API and at least three Checks; the false or incomplete Checks found in this pass are identified above. Plan JSON and manifest TOML parse. All 21 referenced works have manifest identities, and no duplicate source key was added. Definition/API prose uses mathematical identifiers rather than an invented backticked catalogue of future Lean declarations.

Headline inventory from the summary and lines 232–235:

1. §7.2 Euler local well-posedness, including the full system, continuous dependence and continuation; the general §7.1 symmetric-hyperbolic theorem is also a deep promised result.
2. §6.1 uniqueness on lenses and §6.2 uniqueness on causal pasts.
3. §§8.2–8.3 maximal common developments, compatibility, existence of maximal developments, the global-extension uniqueness criterion, and existence of developments from extended data.
4. §8.4 nullity of an extendible regular boundary of a maximal development.

There is no `Suggested.lean` in this design deliverable. Therefore declaration-by-declaration padding probes, import/namespace/docstring checks, omitted-signature checks and mechanical #check comparisons have **zero applicable declarations**, rather than a claimed successful build. At package stage the whole-space Sobolev statements can use pinned Wkp; the periodic predicates, Euler equations and causal/development notions require real-bodied definitions on native carriers. The package must state each genuinely statable headline or name the precise missing carrier in its docstring; replacing them by the small computed Checks above would be padding. No missing design-stage file is raised as a finding.

## Not verifiable

- Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run, no sorry-only warning claim is made, and no #check type comparison was possible.
- Kato1975 Theorem I; Majda1984 Ch.2 §§2.1–2.3/Theorem 2.1; Dafermos2016 Ch.V §5.1/Theorem 5.1.1: manifest status uncertified. Their text, page numbers and exact source hypotheses were not independently verified. They remain settled and were not rerequested.
- Friedrichs1954 pp.345–392, HawkingEllis1973 §6.5, ONeill1983 Ch.14, Christodoulou2007 Ch.1–2: waived. Only their recorded locators were used; no new missing-source request was created.
- Open ownership checks are limited to the supplied/indexed heads and readable board designs. No additional unlisted PR was sought. LorentzianGeometry's readable board design has no identified content PR in that index; R12 cites the exact board files rather than pretending otherwise.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp.24–25 (lines 872–880): the source says developments of identical data always agree on their intersection and their union is uniquely maximal; it should be agreement on the maximal common development, with an additional hypothesis for global uniqueness; affects a stated result.
- **Error** in LukNotes at Lemma 6.9, printed p.26 (lines 1616–1617): the source says the Hˢ norm of f∂ᵢg is controlled using only Hˢ regularity of g and Hˢ⁺¹ regularity of f; it should be a commutator estimate or include a term controlling the extra derivative of g; affects a stated result.
- **Misprint** in LukNotes at §6, equation (6.2), printed p.20 (line 1221): the source says a(0)=0 while requiring the coefficient matrix to stay within 1/10 of Minkowski; it should be a(0)=m, consistently with the flat background; affects a stated result.
