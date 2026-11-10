<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12830#issuecomment-6780895640 -->
Red team round 1 pass a (codex) of 4963861

Verdict: needs_changes

1. **F01** (P2) Zero envelopes do not detect zero in the stated class

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:1483–1485`: “in a translation-invariant space X” and “majorizes only zero data”.

   **Claim:** The zero homogeneous frequency envelope can majorize only the zero element of any translation-invariant space.

   **Witness:** Take X = L∞(ℝ⁴), u = 1. Every homogeneous block P_k u = 0, so c_k = 0 majorizes u, although ‖u‖∞ = 1. PDE §7.1, README:2703–2705, explicitly gives this computation.

   **Exact repair text:** “The identically zero sequence is also allowed. It majorizes exactly the data with every homogeneous block zero; on a realised space contained in 𝒮′_h this means u = 0, and on a homogeneous quotient it means the zero class.” Retest: the constant has zero blocks but is excluded from 𝒮′_h because P_{≤k}1 = 1; the zero distribution has both limits and all blocks zero.

2. **F02** (P2) The local Besov hypothesis has no defined carrier

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:933`: “O;x ∈ ℓ¹W^{1,d/2}(B)”; also 943–946 and the route at 1893.

   **Claim:** This condition implies continuity and can be consumed in constructing the normalised flat gauge.

   **Witness:** The Conventions define only whole-space dyadic norms in dimension four. PDE §7.2 (README:2721–2726) defines whole-space Besov spaces. Neither defines blocks on B or an extension/restriction norm; zero extension of a nonzero constant has a boundary jump.

   **Exact repair text:** “For a ball B ⊂ ℝ^d, write ℓ¹W^{1,p}(B) for the restrictions to B of the inhomogeneous Besov space B¹_{p,1}(ℝ^d), with the infimum of the extension norms. In §4.3 take p = d/2. All uses of this notation use this restriction norm, not the norm of extension by zero.” Add the restriction construction and its independence of extensions as targets consuming PDE §7.2, and identify this norm with the extension-based norm in OhTataru-TopClass Lemma 3.17, lines 1487–1496. Add Checks: a constant on B extends by a smooth cutoff and has finite norm; its zero extension has a boundary jump and is not an admissible B¹_{p,1} extension for p > 1; the logarithmic gauge of §2.1 fails this derivative condition. For the latter, continuity would contradict its distinct cluster values at the origin.

3. **F03** (P3) Strictness Checks omit their nonvanishing conditions

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:548–550` (“strict”, “refuting the inequality”) and 1207–1208 (“< ℰ_e”).

   **Claim:** The displayed examples always give strict inequalities.

   **Witness:** In §1.5 take X = 0: both sides are 0, and 8|X|² > 2|X|² is false. In §6.3 take the zero connection: it is self-dual and anti-self-dual on the two regions, but |χ| = ℰ_e = 0.

   **Exact repair text:** In §1.5 add “For X ≠ 0” to the second and third Checks. In §6.3 replace the second Check by: “If both I₊ = ∫|F⁺|² and I₋ = ∫|F⁻|² are positive, then ℰ_e − |χ| = 2 min(I₊, I₋) > 0. Thus pointwise equality does not imply integrated equality when both dualities carry nonzero energy.” Retest: X = 0 is explicitly excluded from strictness; I₊ = I₋ = 1 gives 2 − 0 = 2, while I₊ = I₋ = 0 gives equality.

4. **F04** (P2) The imported Sobolev embedding is overclaimed at the critical endpoint

   **Location:** `packages/YangMillsConnectionsAndCaloricGauge/README.md:255–258`: “the continuous linear map … extending φ ↦ φ”; the finite-exponent condition appears only afterwards.

   **Claim:** The exponent equation alone makes `TauCeti.D1p0.sobolevEmbeddingL` extend the identity on test functions.

   **Witness:** At d = p = 4, p* = ∞, the exponent equation is 0 + 1/4 = 1/4. `TauCeti/Analysis/Sobolev/D1p0/Basic.lean:240–246` explicitly says this endpoint takes an unspecified value; identity on tests requires p* ≠ ∞ at line 264.

   **Exact repair text:** “For an additive Haar measure, p* ≠ ∞ and 1/p* + 1/dim E = 1/p, `TauCeti.D1p0.sobolevEmbeddingL` is the continuous linear map to L^{p*}(Ω) extending φ ↦ φ, with the following bound, weak-gradient identity and injectivity theorem.” Keep the subsequent named declarations. Retest: the actual use d = 4, p = 2, p* = 4 satisfies 1/4 + 1/4 = 1/2 and p* ≠ ∞; d = p = 4, p* = ∞ is excluded. Smooth truncations of a cutoff of log log(1/r) have bounded gradient L⁴ norms and unbounded sup norms, ruling out an identity-extending bounded map at that endpoint.

## Verified sound

Coverage: README lines 1–2106 and Suggested.lean lines 1–58 read in full; **0 Lean declarations**, **52 numbered target sections**, **49 Checks blocks containing 155 bullets** read and tested by the computations below. The source ledger records **42 locator groups** checked against the supplied extractions. **9 cross-roadmap owners** were checked, including the cited sections of the 8 exact-contract suppliers and the FourManifolds overlap. Source verification is at the preprint versions named in References, not an assertion about unchanged numbering in published versions. The four findings above are exceptions to the sound computations recorded below.

The generality tests use d = 3 and 4, the zero Lie algebra (including noncommutative finite groups), U(1), SU(2), products and disconnected compact groups. Characteristic-p rings, inseparability, non-Noetherian schemes and DVRs are outside the real finite-dimensional hypotheses; they are not claimed as tests of these statements. N = 0 and d < 3 are excluded explicitly. Empty open domains give empty restrictions, zero integrals and singleton a.e. function spaces, not nonzero curvature. Infinite-volume domains are tested using constants, angular maps and pure gauges. Quantitative constants are allowed the dependencies stated in each target; the computations do not assert their numerical optimality except where explicitly claimed.

### Lean declaration and headline ledger

| File/section | Declarations and context | Computed/structural test | Result |
|---|---|---|---|
| Suggested.lean:1–58 | 0 definitions, instances, theorems, examples and section variables; namespace TauCetiRoadmap.YangMillsConnectionsAndCaloricGauge | 0 candidate signatures, 0 possible lost binders, 0 padding statements, 1 import Mathlib, 0 set_option | No signature elaboration applicable or run. |
| Module docstring:12–16 | §3.2 gauge invariance; §4.1 Coulomb gauge; §4.2 removal | Native scalar Wkp plus smooth connections do not supply the critical matrix-gauge action or normal trace; a finite group gives F = 0 but does not test the nonabelian carrier | Each full headline named as unavailable. |
| Module docstring:17–28 | §§5.2, 5.4, 5.5 good gauge/topological class; §§6.2–6.4 characteristic numbers, Bogomol'nyi, instanton classification | Two constant maps ±1 give distinct free homotopy classes but the same connection 0; plain HomotopyGroup cannot replace the required quotient | Missing rough/gauge-at-infinity carriers accurately distinguished. |
| Module docstring:29–38 | §§7.2–7.3 regularity/removal; §§7.5, 7.7 gap/ground state; §§8.2–8.4 covariant estimates | BPST has E = 8π² but is outside global Hdot¹; smooth-only inputs would omit weak hypotheses. Inhomogeneous H¹ includes an L² term absent from the required scaling | No substitute headline on a weaker carrier. |
| Module docstring:39–50 | §§9.3–9.7 LWP, continuation, limits, dichotomy, threshold; §§10.1–10.5 pure gauge, caloric gauge/manifold/div–curl | BPST gives Q = ∞; pure gauge data give Q = 0; neither free scalar parameters nor an arbitrary Prop encode the maximal flow | Each full headline named with its missing carrier. |

No additional fully general headline from the introduction was found expressible using only the pins and a few simple definitions. The auxiliary split-embedding criterion in §10.4 is statable on native Banach spaces, but it is an auxiliary criterion, not the caloric-manifold headline. There is no quota requiring it in the acceptance file. Conversely, this conclusion does not certify the absent carrier constructions: those remain the roadmap's work.

### Computed target ledger

The context column supplies the standing hypotheses for each row; all groups below carry the prescribed positive Ad(G)-invariant metric. “Retain” means the stated instance does not refute the target, not that a future formal proof has been supplied. Symbols such as F = 0 are actual values on both sides of the relevant identity. Rows with multiple assertions list their separate computations. All section locations refer to `packages/YangMillsConnectionsAndCaloricGauge/README.md`.

| Statement/context | Instances and computed values | Result/change |
|---|---|---|
| Conventions: real d, λ > 0; compact G ⊂ U(N), N ≥ 1 | λ = 2 in d = 4: curvature factor 4, squared density factor 16, volume factor 1/16; E unchanged. Finite G: Lie algebra dimension 0, A = F = 0 | Retain; real dimensions and compactness are used. |
| Conventions: right Maurer–Cartan and gauge sign | O = exp(x₁i)exp(x₂j): at 0, R₁ = i, R₂ = j, (dR)₁₂ = 2k; F[−R]₁₂ = −2k + 2k = 0; F[R]₁₂ = 4k | Retain; wrong sign excluded. |
| Conventions: form norm, orientation, Fourier convention | F = X(dx12 + dx34): norm² = 2‖X‖², paired wedge coefficient = 2‖X‖². Δ exp(2πiξx) = −4π²‖ξ‖² exp(2πiξx). Quaternion conjugation has determinant −1 in ℝ⁴ | Retain. |
| 1.1: matrix Lie algebra and invariant metric | U(1): bracket 0, curvature dA. SU(2): norms² 2, [i,j] = 2k and cyclic variants. Finite G: algebra 0. T²⋊C₂ with weights (1,2): ad-invariance holds, swapped squared norm 1 → 2 violates Ad-invariance | Retain; disconnected wrong metric excluded. |
| 1.2: smooth nearest-point map on a sufficiently small tube | U(1): derivative a+ib ↦ ib; linear surrogate 1+ib has norm √(1+b²), not 1. Shear t = 1: polar distance² 5−2√5 ≈ .528 versus Gram–Schmidt distance² 1. Finite ±1: derivative 0; at matrix 0 all unitary distances² N | Retain; domain cannot contain the zero matrix. |
| 1.3: smooth gauge action, Bianchi, adjoint derivative | SU(2) g = exp(πk/4), X = i, Y = j: correct derivative 2k, misplaced adjoint gives 0. U(1), A = ix₁dx2: F₁₂ = i before and after gauge. Central constant: Ad(c)A = A; Bianchi for constant nonabelian coefficients is Jacobi, sum 0 | Retain. |
| 1.4: evaluated invariant polynomials and transgression | A = −R: F = 0 and CS = (1−2/3)tr(R³) = tr(R³)/3. Positive frame maps to (k,i,j): trace cubic −12, integral −24π², Cartan integral −8π². ∫t dt = 1/2, ∫(t²−t)/2 dt = −1/12; extra polarisation factorial would give −4π² | Retain the supplier normalisation. |
| 1.5: self-dual splitting and pointwise bound | SD form: both sides 2‖X‖²; simple form Xdx12: norm² ‖X‖², wedge 0. X = 0 gives 0 = 0 in both examples, not strictness | Target retained; R03 repairs Checks. |
| 1.6: γ₀ maximum and cubic inequality | su(2): bracket norm √8 divided by √2√2 gives √2. Zero/abelian algebra: γ₀ = 0, cubic 0. Metric multiplied by c: γ₀ → c^(−1/2)γ₀. Coefficients λ(i,j,k): norm² 6λ², triple pairing 4λ³, absolute cubic 24√2 abs(λ)³ on both sides; signed value −24√2λ³ | Retain; unit-ball maximum handles algebra 0. |
| 2.1: vector Sobolev and G-valued classes; 1 ≤ k < d for critical results | d = 4 logarithmic gauge: derivative radial integrals ∫₁∞L⁻²dL = 1 and ∫₁∞L⁻⁴dL = 1/3; no limit at 0. Finite G on connected domain: derivative 0, a.e. constant. d = 3 vortex: transverse integral ∫₀¹ρ⁻²dρ = ∞ | Retain conditional on vector-valued-wkp. |
| 2.2: smoothing on W, unchanged on V and outside U | W = U = ball: bump has range [0,e⁻¹], positive inside, 0 outside. Opposite half-balls: hypothetical cutoff 0/1 has two limits at the common boundary; positive flat bump has limit 0 from both sides. W empty: O′−O = 0 | Retain; positivity, not value 1, is necessary. |
| 2.3: products and inversion at critical Sobolev orders | U(1), O₁ = exp(iφ), O₂ = exp(iψ): product exp(i(φ+ψ)), MC derivative i(dφ+dψ); inverse derivative −idφ. Finite ±1: all weak derivatives 0. Products retain bounded zeroth-order factors | Retain. |
| 2.4: MC map and adjoint action, bounded top-order B | U(1): Ad(O)B = B. SU(2) O = exp(√L i), B = √L j: input fourth-power derivative integrals finite (= constant times 1), output rotating derivative integral ∫dr/r = ∞. B = j constant gives ∫₁∞L⁻²dL = 1 instead | Retain added top-order boundedness. |
| 2.5: annular homotopy, extension and exterior triviality | Constant −1 extends with degree 0 but is not homotopic to constant +1 in {±1}. Φ has degree 1 whereas extendible boundary degree is 0. Exterior homogeneous Φ has gradient integral C∫₁∞dr/r = ∞; constant derivative integral 0 | Retain “some constant”; both directions tested. |
| 3.1: rough cocycles, connections, weak curvature | Critical norm under dilation: λ^dλ^(−d) = 1; d = 3 curvature L² norm scales λ^(1/2). Angular A = idθ: off-axis F = 0, but derivative integral ∞, so not admissible. Finite G: all local potentials and curvatures 0; cocycle condition remains group multiplication | Retain. |
| 3.2: gauge invariance of weak curvature/energy | Abelian O = exp(iφ): F[A−idφ] = dA−i d²φ = dA. Punctured degree-one gauge: F[−O;x] = 0 = Ad(O)0 despite potential size r⁻¹. SU(2) constant conjugation preserves norm² 2 of i | Retain. |
| 3.3: patching on a ball or ℝ^d | Two trivial charts with transition c constant: choosing local gauges 1,c makes overlap transition 1 and both potentials 0. Empty overlap imposes no equation; triple constant cocycle c₁₂c₂₃=c₁₃ gives patched transition 1 | Retain; no extension to noncontractible bases asserted. |
| 3.4: inner/outer concentration radii | F = 0 gives (∞,0); total norm ≤ ε gives inner radius ∞. BPST ball energy at r = 1 is 4π², at ∞ is 8π², near 0 is 24π²r⁴; radius asymptotic (ε²/24π²)^(1/4), dilation divides it by λ | Retain; extended values explicit. |
| 4.1: small-curvature Coulomb gauge and uniqueness | U(1): Δφ = −i div A and ∂νφ = −iν·A give div(A−idφ)=0 and normal trace 0. A = 0 forces transformed norm 0, hence constant gauge. Linearised Neumann kernel constants; SU(2), d = 4 exponent d/2 = 2 and embedding exponent 4 | Retain conditional on both Neumann/div–curl gaps. |
| 4.2: puncture removal after gauge | Degree-one pure gauge: F norm 0, original derivative norm² contains ∫₀¹dr/r = ∞, transformed potential 0 extends. For integrable curvature, shrinking-ball integral tends 0, hence falls below ε′₀ | Retain; does not assert the original potential extends. |
| 4.3: nonlinear div–curl regularity and continuity | Constant abelian curvature: first derivatives constant, higher ones 0. A_n=n^(−3/2)sin(nx₁)i dx2: W¹,² size O(n^(−1/2))→0, second derivative L^(4/3) size ≍n^(1/2)→∞. Constant O: MC = 0, Besov sum 0 | Regularity retained; define the local Besov carrier as R02. |
| 4.4: good ball gauge | Flat data give transformed A = 0. Small global curvature gives the rescaled 4.1 estimate. (R,r) ↦ (R/λ,r/λ) gives the same ratio R/r and critical norms | Retain. |
| 5.1: good representative with vanishing inner cutoff | η≡1 and degree-one O: derivative integral ∫₀¹dr/r = ∞. η=0 near 0 removes that singular term. Finite ±1: both gauges have MC 0. BPST remainder at infinity is O(r⁻³), gradient O(r⁻⁴), giving integrable fourth and second powers | Retain cutoff condition. |
| 5.2: global gauge with centre/scale | Flat A: (r_c,R_c)=(∞,0), constant O∞ and B=0. A in Wdot¹,d/2 has (O∞,B)=(1,A). Translating BPST changes centre by b and remainder norm by 0; dilation changes radii by λ⁻¹ and ratio by 1 | Retain, including centre dependence. |
| 5.3: uniqueness of infinity class and converse modulo gauge | Abelian phases: derivative of O′∞⁻¹ P O∞ is i(−dθ′+dψ+dθ)=0; reversed product gives 2idψ. Angular exp(ix₁/r): tail norm contains C∫₂∞dr/r=∞ for potential 0; the corresponding nonzero pure gauge has remainder 0 outside the cutoff | Retain corrected converse; not a converse for a fixed potential. |
| 5.4: topological quotient and perturbations | Finite ±1: two free constant classes become one G×G orbit, matching only A=0. O(4) reflection swaps the two π₃ factors. U(1) sphere classes = 0. Flat −2x₁i dx1 plus b=j dx2/(1+r²): curvature k-component −4x₁/(1+r²), squared tail ∫r dr=∞ | Retain good-representative restriction and constant quotient. |
| 5.5: trivial class iff homogeneous potential exists | Zero potential: class 0 and norm 0. Cutoff Φ: degree 1, χ=−8π² versus χ=0 for every Hdot¹ representative; no such representative. Connected d=4 trivial class is π₃ element 0 | Retain both directions. |
| 5.6: connected-group comparison with π₃ | SU(2): sphere degree n indexes ℤ. U(1): π₃=0. Normalisation at e₁ sends a constant c to c⁻¹c=1; for a homotopy H the normalised value remains 1 throughout | Retain connected hypothesis. |
| 6.1: characteristic integral and bounds, d=2k | Abelian A=iα: f(F²)=dα∧dα, integral 0. SU(2): χ=8π²c₂. d=4 dilation factor λ⁴λ⁻⁴=1. F=0 gives every positive-degree polynomial evaluation 0 | Retain. |
| 6.2: transgression to infinity and topological invariance | Cutoff degree-one Φ: boundary integral −8π² equals χ. Constant O∞: pullback positive-degree form 0. Odd d: 2k≠d, so no top-degree integral of this form | Retain. |
| 6.3: integrated bound and equality iff one duality vanishes globally | E−χ=2I₊, E+χ=2I₋. BPST (I₊,I₋)=(0,8π²) gives E=χ=8π². Mixed (1,1) gives E=2, χ=0; zero (0,0) gives E=χ=0 | Retain theorem; R03 fixes strictness Check. |
| 6.4: instanton number, integrality, completeness | Degree-one Φ gives c₂=−1; conjugation degree (−1)³=−1 gives c₂=+1; constant degree 0 gives c₂=0. Degree-n power map gives c₂=−n, so all integers occur; reversing orientation changes sign | Retain orientation/sign. |
| 7.1: weak harmonic equation, variation, conformal/gauge invariance | Flat F=0 gives weak pairing 0. Abelian A=(i/2)(x₁dx2−x₂dx1): constant F=i dx12, divergence 0 but energy ∞. Replacing by ψ(x₁) yields divergence iψ′, not 0. ASD BPST is harmonic, E=8π² | Retain finite-energy distinction. |
| 7.2: harmonic regularity and ε-estimates | A=0: all derivatives of F vanish, both sides of each estimate 0. Constant abelian F: n≥1 left side 0; n=0 compares a constant to its ball L² norm. Singular pure gauge has F=0 but requires a gauge change for smooth potential | Retain; no smoothness claimed in the original gauge. |
| 7.3: harmonic removal and decay | BPST norm √48/(1+r²)² gives r⁴‖F‖→√48; derivatives add r⁻¹. Punctured pure gauge F=0 transforms to potential 0. Flat case has decay constant 0 | Retain. |
| 7.4: Weitzenböck, improved Kato and square-root inequality | Commutative bracket 0. SD BPST at 0: half-Laplacian of norm² = −768, covariant gradient 0, cubic pairing +768; correct sign gives −768. u=48^(1/4)/(1+r²): Δu=−8·48^(1/4)/(1+r²)³ equals the cubic lower bound | Retain sign and 3/2 Kato factor. |
| 7.5: sharp energy gap for γ₀>0 | SU(2): 16π²/γ₀²=8π², attained by SD BPST. Opposite-duality pair in su(2)⊕su(2): E=16π², χ=0, bound 32π²/γ₀²=16π². Abelian γ₀=0 uses F=0 theorem, not division by 0 | Retain. |
| 7.6: explicit BPST and metric-scaled images | At 0: A=0, F12=2Φ(i), F34=−2Φ(i), ASD. Six components give norm² 48/(1+r²)⁴. Radial integral 1/12 times 96π² gives 8π². Infinity gauge degree −1 gives c₂=1; metric scaling c gives energy 8π²c | Retain. |
| 7.7: attained ground state, nonabelian Lie algebra | SU(2): E_GS=16π²/2=8π² and 2E_GS=16π². Metric c: γ₀²→γ₀²/c and E_GS→cE_GS. Abelian or finite G: nontrivial harmonic set empty, infimum +∞ | Retain conditional on longest-root extremality gap. |
| 8.1: D1p0 image and Hdot¹; Banach graph ℋ | Test φ: native norm ‖∇φ‖₂ versus roadmap ‖∇φ‖₂+‖φ‖₄; equivalent, unequal for φ≠0. Constant 1: gradient 0 but L⁴ norm ∞. Divergence block sequence 1/k: squares sum π²/6, sum diverges; ℋ is a proper subspace. Dyadic dilation reindexes sums | Retain; R04 restricts imported endpoint. |
| 8.1: realised fractional spaces and heat-continuity subspace | g=sign(x₁): low-pass limit 0, norm∞1; g+c has low-pass limit c and norm∞1+abs(c). b=abs(D)g: Wdot^(−1,∞) norm1; heat-distance1 for every s>0. Smooth compact datum has inverse abs(D) kernel 1/(4π²r³), hence BUC potential. Dilation factor λ⁻¹ | Retain realisation and strong-trace distinction. |
| 8.1: frequency envelopes and full/block norms | Zero blocks with u=1 still give norm∞1 (R01). Positive envelope with ℓ² bound by zero would force 0<c_k≤0. c_k=2^k has ratio growth 2, exceeding 2^(1−ε). σ̃=0,d_j=1 gives divergent sum. A shell shrinking to radius 2^(k+1) gives full/block norm ratio (4π)^σ, not 1 | R01; asymptotic shell calculation valid as a limit of multipliers. |
| 8.2: covariant elliptic inversion, 0<σ<2 | A=0: multiplier −1/(4π²‖ξ‖²), so ΔB=F away from 0. Positive linear variational term gives −Δ_AB+F=0; negative term gives Δ_AB=−F. Pure gauge conjugates Δ. Inner product ⟨B,[A,B]⟩=0 gives diamagnetic identity | Retain; no value at ξ=0 is divided by. |
| 8.3: covariant heat bounds/decay | A=0, unit L² datum: sup norm1, integrated gradient²1/2, sum1+1/√2. Scaling forcing factor λ⁴λ⁻²λ⁻²=1. K separated blocks: input Hdot⁻¹ norm≈1, ℓ²L¹ bound≈1, L¹ bound≳√K. Low frequency 2^(−m) at time4^m keeps multiplier≥e^(−16π²), precluding a uniform decay rate | Retain ℓ²L¹ and qualitative decay. |
| 8.3: time-global and endpoint restrictions | Static BPST: nonzero stationary contraction B_j=ξ^kF_kj has fixed L² norm; curvature L² in infinite heat-time is ∞. σ=2 is outside the stated open interval; rough F does not acquire two derivatives by multiplication | Retain global hypotheses; no σ=2 assertion. |
| 8.4: weighted L^p heat estimates | Free block decays exp(−c4^ks), dominating polynomial weights. Constant near-zero forcing gives B(s)=sG+O(s²4^kG), matching β=0. At p=∞,σ=−1 the sign datum has norm1 and heat-distance1 although each fixed block tends to its initial block | Retain β-range and weak/full trace separation. |
| 9.1: flow definitions, curvature identities and dissipation | Abelian transverse Fourier mode: E′=−32π⁴‖ξ‖⁴‖α‖²e^(−8π²‖ξ‖²s), dissipation density16π⁴…; coefficient2. Constant su(2) triple: ∂sF12=−32k, Δ_AF12=−16k, difference−16k matches −2[F13,F23]. Flat F gives stationary A; parabolic scaling multiplies both PDE sides by λ³ | Retain. |
| 9.2: covariant weighted bounds | Weight exponent n/2+1−2/q cancels λ^(2+n−4/q) exactly. Extra source exponent 1/4−1/p would give λ^(−1/2+2/p), at p=∞ λ^(−1/2). F=0 gives all curvature bounds0 while a stationary pure-gauge potential may be nonzero | Retain corrected weights and potential initial-size term. |
| 9.3: local-caloric solutions and well-posedness | Flat Hdot¹ data give A(s)=a and lifespan∞. Abelian data give gradient part unchanged and transverse multiplier e^(−4π²s‖ξ‖²). Dilated maximal lifespan λ⁻²s₀; Hdot¹ norm unchanged | Retain; norm alone is not a uniform lifespan. |
| 9.4: caloric size, continuation and small energy | Q³ scaling: λ⁶λ⁻⁴λ⁻²=1. Flat flow Q=0, endpoint∞; no larger interval exists. BPST potential L⁴ tail ∫dr/r=∞ and static curvature space-time L³ integral∞ | Retain finite-endpoint clause and initial-space restriction. |
| 9.5: nonlinear/linearised flat limits | Abelian nonlinear limit gradient projection; pure gauge limit equals initial a. At σ=−1/2, transverse squared norm integral with weight abs(ξ)⁻¹e^(−8π²s‖ξ‖²) tends0; gradient projection norm≤initial norm with constant1 | Retain negative regularity and curl-free limit. |
| 9.6: dichotomy and bubbling | E(a)<E_GS rules out a bubble since E_GS≤E(Q)≤E(a). Flat data have Q=0, selecting the first alternative. Rescaling A by r and F by r² leaves spatial energy unchanged | Retain; no unjustified convergence of centres added. |
| 9.7: uniform threshold for Hdot¹ data | SU(2) threshold16π². Potential BPST energy8π² and Q∞ violates the conclusion only after removing Hdot¹. Bubble argument: E(initial)≥E(Q)+abs(χ(Q))≥2E_GS, contradicting strict subthreshold hypothesis | Retain exact hypotheses and strict threshold. |
| 10.1: flat connection gauge and normalisation | U(1) a=idφ: O=exp(iφ) gives O⁻¹dO=idφ. a=0 gives constant O, limit condition selects1. Multiplying O on left by c preserves O⁻¹dO | Retain; R02 supplies local regularity notation used in the route. |
| 10.2: caloric subset, map Cal and quotient metric | U(1): Cal removes gradient part; pure gauge gives Cal=0. Constant conjugation c: metric d(Ad(c)a,a)=0 by choosing c⁻¹ in the infimum. Normalised limit1 removes residual left multiplication | Retain. |
| 10.3: caloric bounds in ℋ and homogeneous derivative space | Abelian caloric a has divergence0, E=‖∇a‖²₂. h_λ=λ²h(λx): derivative L^(4/3) norm factor1 but undifferentiated norm factorλ⁻¹. SU(2) packet frequencies1,2 give (1−4)/(1+4)[i,j]=−6k/5, proving nonzero divergence occurs | Retain homogeneous, not inhomogeneous, norm. |
| 10.4: split submanifold definition and abstract criterion | Linear closed complemented subspace: chart derivative inclusion, left inverse projection, composite identity. Sphere chart at e has derivative inclusion of e⊥; proposed inverse gives v back and radial coordinate t back. Cross at0 has four punctured branches, not two/one. Corner chart t↦(t³,abs(t)³) has derivative0, not split injection | Retain; native immersion predicate excludes the false chart. |
| 10.4: caloric chart and complemented tangent | U(1): chart b↦a+b, c=0, L=inclusion, P=Leray, PL=id. General calculation on E_a: div_a b=0, div_a Lb=−Δ_ac, so P(Lb)=Lb+D_ac=b. Gauge direction D_ac maps under P to0 | Retain; proof route names inverse-function and covariant elliptic inputs. |
| 10.5: tangent closure, nonlinear div–curl, projection and bundle | Abelian w: c=−Δ⁻¹div w, b=w−∇Δ⁻¹div w. w=D_ac₀ gives (b,c)=(0,−c₀); tangent w gives (b,c)=(w,0). Hence Π²=Π and kernel gauge directions; pair carrier has actual base a∈𝒞 | Retain signs, uniqueness space and bundle base. |

### Suppliers, ownership, and build direction

The following table resolves owners, rather than merely checking whether the names occur. Main owns the existing generic objects; the Euclidean rough and caloric extensions remain here. The open-head searches found no duplicate fully qualified declaration (there are none in this Suggested.lean).

| Owner and current locator | Contract comparison |
|---|---|
| PDE §§1.2, 1.4–1.6, 2.3, 3.2, 6.1, 6.3, 7.1–7.3 | Density/embedding/trace, multipliers, maximum principle, Bochner/heat and dyadic/Besov/paraproduct inputs exist. README:2309–2374 distinguishes finite-p and BUC heat continuity; 2703–2705 gives zero blocks for constants; 2721–2726 gives whole-space Besov carriers, hence R02. |
| SmoothBundlesConnections B3.1, B4.1–B4.2 | README:871–909 and 979–1021 contain connections, curvature and left gauge action. The sign −du·u⁻¹ agrees. Its smooth and closed-manifold objects do not replace critical Euclidean weak gauges. |
| CharacteristicClasses C4 item 1, C5a.3 | README:1321–1337 and 1530–1568 supply invariant polynomial evaluation/transgression and normalised Cartan forms. At k=2 the coefficients give 2/3, not 1/3, in tr(A³); no duplicate construction proposed here. |
| RiemannianGeometry R6 | README:3470–3504 supplies the normal tube/retraction. Package §1.2 computes its derivative and identifies the unitary polar factor; it does not re-own tube existence. |
| DifferentialGeometry Layers 0–1, 5.2–5.4, 10.3–10.5 | Forms, integration/Stokes and degree have the required oriented compact hypotheses. README:2716–2767 gives degree normalisation, integral formula and continuous sphere-map extension. |
| AlgebraicTopology Stage 6 item 5; Stage 8 item 3 | Current §6.5 and §8.3 supply degree comparison and Hurewicz/cubical-spherical comparison. Former-number mapping preserves these citations. Normalised sphere identity degree1 gives π₃(S³) generator1. |
| LieGroups Layers 0–2, 5A, 6 | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:641–670` has invariant metric/splitting; root planes and rank-one representatives occur at 750–751. Longest-root norm extremality is a declared additional contract, not falsely treated as supplied. |
| Yamabe Y2 item 1 | README:150–172 supplies sharp Euclidean Sobolev. In n=4, Y(S⁴)=8√6π; the package's γ₀ normalisation yields 16π²/γ₀². |
| FourManifolds §5.3 and Layer 5 introduction | Its SU(2), four-ball Coulomb theorem and S⁴ BPST object are acknowledged, with the current open head checked. General compact G and d≥3 rough Coulomb theory and the explicit ℝ⁴ potential are the kept extensions, not a claim of new ownership of the SU(2) special case. |

Ownership searches used the roadmap service across open heads/main and searched board packages by object: Coulomb gauge, homogeneous Sobolev spaces, caloric connections, nearest-point retraction and split submanifold. InstantonFloerTheory's open head, scope/IF1 at README:88–100, consumes the four-dimensional gauge core and owns its Floer/SO(3) interface, not the critical Euclidean caloric theory. PositiveMass did not provide the missing homogeneous/covariant carriers. No forbidden roadmap is introduced as a supplier. The overlap file reports no conflicting heads or dropped identifiers for this package.

All five declared gap slugs agree between README Exact supplier contracts and design/plan.json: lp-neumann-ball, lp-divcurl-normal-ball, hardy-inequality, vector-valued-wkp, compact-su2-subalgebra. Suppliers are PDE or LieGroups, never none. Each describes a specific analytic/algebraic object and its hypotheses. Tests: f=V=0 in Neumann gives constant solutions; zero normal div–curl kernel on a ball gives a=0; d=4,p=2 Hardy constant=1; coefficient space V=0 gives the zero Sobolev space; su(2) longest-root restriction gives γ₀=√2. These remain declared contracts and are not findings for being absent today.

Pinned evidence includes `Mathlib/LinearAlgebra/UnitaryGroup.lean:278` (special unitary submonoid); `Mathlib/Analysis/Distribution/FourierMultiplier.lean:143` (tempered Fourier multiplier); `Mathlib/Analysis/Distribution/TemperedDistribution.lean:160` (Lp embedding); `Mathlib/Geometry/Manifold/SmoothEmbedding.lean:70` (immersion plus embedding, with no arbitrary replacement predicate); `Mathlib/Geometry/Manifold/Immersion.lean:802` and 1008 (common complement and differential immersion); `Mathlib/Analysis/Calculus/InverseFunctionTheorem/ContDiff.lean:31` (local inverse construction). The distribution API uses complex normed coefficients, so the README's explicit complexification matters.

At Tau Ceti, `TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:251` supplies actual weak Fréchet derivatives, and `TauCeti/Analysis/Sobolev/Wkp/Basic.lean:145` is a scalar carrier, not the requested general vector-valued one. `TauCeti/Analysis/Sobolev/D1p0/Basic.lean:246`, 264, 275, 321 and 362 distinguish the map, its test-function identity, bound, weak-gradient identity and injectivity; the endpoint defect is R04. `TauCeti/Analysis/InnerProductSpace/HodgeStar/AlternatingForm.lean:76`, 111 and 157 supply the star, wedge pairing and even-degree involution. `TauCeti/Analysis/PDE/HeatKernel/Basic.lean:76`, 185 and 254 supply the kernel, mass1 and semigroup identity. No pinned theorem found supplies the missing rough Yang–Mills or caloric carrier.

The required dependency command returned, verbatim:

```text
depcheck: 236 roadmaps, 2135 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The read-only diff against origin/main contains seven files, all under `packages/YangMillsConnectionsAndCaloricGauge/`. README and Lean contain no PR numbers, executable algorithms, sorry'd data, set_option, or lemma declarations. No package source file, library, merge order or git state was edited during this pass; only this report and scratch notes were written.

### Source-locator ledger

These 42 groups record the loci read and compared, with normalisations or hypotheses checked as in the computed table. A group can contain multiple theorem numbers. They do not certify the six inaccessible references below.

| # | Source locator and extracted lines | Comparison |
|---|---|---|
| 1 | OhTataru-YMHF §1.1, lines 92–130 | Gauge convention and Ad-invariance; disconnected qualification retained. |
| 2 | OhTataru-YMHF Theorem 2.1, lines 275–276 | Weak harmonic regularity up to gauge. |
| 3 | OhTataru-YMHF Theorems 2.4–2.5, lines 342–350 | SU(2) energy 8π² per charge and non-instanton extra 16π². |
| 4 | OhTataru-YMHF §3 frequency envelopes, lines 884–954 | Slow variation, compatibility, convolution and c^[σ]. |
| 5 | OhTataru-YMHF Theorem 4.1, lines 963–974 | 0<σ<2 and ℓ¹ endpoint; variational sign corrected. |
| 6 | OhTataru-YMHF Theorems 4.4–4.5, lines 1180–1245 | L² covariant heat hypotheses and envelope bounds. |
| 7 | OhTataru-YMHF Theorem 4.6, lines 1286–1304 | Frequency-summed L¹ estimate; ℓ² is necessary. |
| 8 | OhTataru-YMHF Theorem 4.7, lines 1346–1415 | Weighted p-bounds, polynomial decay and p=∞ trace limitation. |
| 9 | OhTataru-YMHF Theorem 4.8, lines 1514–1530 | Forced near-zero heat-time exponent; β correction. |
| 10 | OhTataru-YMHF §5.1, lines 1531–1607 | Covariant, dynamic and linearised equations. |
| 11 | OhTataru-YMHF Propositions 5.6–5.7, lines 1611–1647 | Dissipation coefficient2 and derivative-weighted covariant estimates. |
| 12 | OhTataru-YMHF Corollary 5.8, lines 1791–1802 | ds/s scaling; erroneous additional weight removed. |
| 13 | OhTataru-YMHF local-caloric theory, lines 1860–1962 | ℋ, local theory, finite-endpoint continuation and flat limits. |
| 14 | OhTataru-YMHF linearised proof, lines 2170–2237 | Dynamic-variable route and negative-order duality. |
| 15 | OhTataru-YMHF Lemma 5.32, lines 2478–2505 | Small-energy Q² estimate. |
| 16 | OhTataru-YMHF Theorem 6.1, lines 2560–2592 | Dichotomy and rescaled bubble conclusion. |
| 17 | OhTataru-YMHF §6.2, lines 2833–2869 | Threshold, characteristic invariant and transgression. |
| 18 | OhTataru-YMHF Theorem 6.10/proof of 6.6, lines 2905–2945 | Ground-state dichotomy and threshold bubble extraction. |
| 19 | OhTataru-YMHF §7.1, lines 3155–3215 | Flat gauge, adjoint dyadic estimates and normalisation. |
| 20 | OhTataru-YMHF Proposition 7.7/Theorem 7.8, lines 3286–3346 | Homogeneous divergence bound and C¹ caloric chart. |
| 21 | OhTataru-YMHF §7.2, lines 3347–3395 | Tangent/div–curl decomposition. |
| 22 | OhTataru-TopClass §1.1, lines 121–183 and 226–285 | Matrix and rough Sobolev conventions. |
| 23 | OhTataru-TopClass Theorem 1.4, lines 320–360 | Quantitative ball gauge. |
| 24 | OhTataru-TopClass Theorem 1.5, lines 361–389 | Good global gauge and remainder; global regularity qualification. |
| 25 | OhTataru-TopClass Proposition 1.6, lines 390–403 | Infinity gauge comparison; disconnected/fixed-potential amendments tested. |
| 26 | OhTataru-TopClass Corollary 1.11/Remark 1.12, lines 451–466 | Trivial-class equivalence. |
| 27 | OhTataru-TopClass §1.6, lines 829–918 | Harmonic equation, characteristic normalisation and bound. |
| 28 | OhTataru-TopClass §3.1, lines 957–1027 | Critical G-valued maps and approximation domain. |
| 29 | OhTataru-TopClass Lemmas 3.2–3.4, lines 1028–1135 | Local smoothing, products, inverse, MC and adjoint continuity; corrected endpoint. |
| 30 | OhTataru-TopClass §3.2, lines 1165–1235 | Patching construction and potential regularity. |
| 31 | OhTataru-TopClass Theorem 3.11, lines 1358–1408 | Coulomb gauge, bound, uniqueness and convergence; MC sign. |
| 32 | OhTataru-TopClass Lemmas 3.13–3.17, lines 1410–1505 | Div–curl regularity and extension-based local Besov continuity. |
| 33 | OhTataru-TopClass Lemmas 3.20–3.22, lines 1620–1707 | Critical homotopy, extension and exterior hypothesis. |
| 34 | OhTataru-TopClass §6, lines 2268–2453 | Compact Lie algebra constants, decomposition, rank-one ground state route. |
| 35 | OhTataru-Threshold §1.1.8/Theorems 1.5–1.6, lines 245–288 | Harmonic regularity and ground-state alternative. |
| 36 | OhTataru-Threshold Theorem 2.8 and tangent-state description, lines 905–925 | Caloric quotient metric, ℋ and L² tangent bundle. |
| 37 | OhTataru-Threshold Theorems 2.16–2.17, lines 1066–1075 | Trivial class and global gauge. |
| 38 | OhTataru-CaloricLWP Theorems 1.6–1.9, lines 269–307 | Caloric manifold/tangent summary and downstream boundary. |
| 39 | Rade-YMHeat Theorems 1–2, lines 212–224 | Closed dimension2/3 heat flow; correctly outside this roadmap. |
| 40 | GurskyKelleherStreets-GapTheorem Theorem 1.1, Corollaries 1.2–1.3, lines 36–123 | Compact theorem, curvature normalisation and downstream closed-flow result. |
| 41 | GurskyKelleherStreets-GapTheorem Lemma 2.1, Definition 2.3, Lemma 2.6/Remark 2.7, lines 139–232 | Bochner sign, γ₀ and cubic coefficient after metric/form conversion. |
| 42 | GurskyKelleherStreets-GapTheorem Proposition 2.8, lines 242–286 | Improved Kato coefficient3/2; source proof slips separated below. |

## Not verifiable

- Uhlenbeck-LpCurvature Theorem 1.3; Uhlenbeck-RemovableSingularities Theorem 4.1; FreedUhlenbeck-Instantons Chapters 1–3; DonaldsonKronheimer Chapters 2–4; Bogomolnyi-Stability; MimuraToda-TopologyLieGroups Chapters IV–V: settled uncertified sources, unavailable as legal text in this pass. Their locators were not silently certified and no repeat request was made. Open Oh–Tataru/Gursky–Kelleher–Streets text and explicit computations support the applicable comparisons independently.
- Published-version numbering beyond the explicitly cited arXiv versions was not compared. The roadmap specifies the versions actually read.
- No Lean execution was performed, as required by the read-only brief. There are zero named declarations to elaborate with #check. This report does not assert a successful Lean build.
- The five declared supplier gaps remain conditional inputs. Their absence from the current supplier is not a finding. Searches establish no duplicate owner found, not a proof that no differently phrased library theorem exists anywhere.
- The source's finite-time bubble-centre convergence and its linearised limiting claim above σ=1 were not independently established. The package deliberately omits the former and restricts the latter; neither is reported as a package defect or a newly proved source theorem.

## Source issues

- **Error** in OhTataru-YMHF at §1.1, printed page 3 (lines 97–99): the source says infinitesimal ad-invariance and invariance under the whole compact group are equivalent; it should be equivalence for connected groups, with whole-group invariance separately required otherwise; affects a stated result.
- **Misprint** in OhTataru-YMHF at §2.2, printed page 10 (line 386): the source says a flat potential is the positive right Maurer–Cartan form; it should be minus that form, or the positive left Maurer–Cartan form; affects the proof.
- **Misprint** in OhTataru-YMHF at Theorem 4.1 proof, printed page 23 (line 974): the source says the variational functional has negative linear forcing term; it should be positive for Δ_AB=F; affects the proof.
- **Error** in OhTataru-YMHF at Theorem 4.6, printed page 29 (line 1290): the source says the covariant derivative has an unsummed L¹ heat-time Sobolev bound; it should be the ℓ²-summed dyadic L¹ bound; affects a stated result.
- **Error** in OhTataru-YMHF at Theorem 4.7, printed page 30 (line 1356): the source says solutions are strongly continuous at initial time throughout the stated p-range; it should be finite p, or heat-continuous data at p=∞; affects a stated result.
- **Misprint** in OhTataru-YMHF at Theorem 4.8, printed pages 33–34 (lines 1522–1528): the source says the near-zero forcing weight involves 1−α/2 with α undefined there; it should be 1−β for forcing weight β; affects a stated result.
- **Misprint** in OhTataru-YMHF at (1.19) and Proposition 5.6, printed pages 5 and 36 (line 1617): the source says the dissipation coefficient is one and reverses one curvature pair in (5.11); it should be twice the squared norm of D^ℓF_ℓj; affects a stated result.
- **Misprint** in OhTataru-YMHF at Proposition 5.7 proof, printed page 37 (line 1668): the source says the differentiated forward heat equation has plus Δ_A on its left; it should be minus Δ_A, as in the preceding equation; affects the proof.
- **Error** in OhTataru-YMHF at Corollary 5.8, printed page 38 (lines 1792–1800): the source says the ds/s estimates include an additional weight 1/4−1/p; it should be removed to preserve parabolic scaling; affects a stated result.
- **Error** in OhTataru-YMHF at Corollary 5.12, printed page 42 (line 1931): the source says finite caloric size always gives a strictly larger interval; it should be conditional on a finite original endpoint; affects a stated result.
- **Gap** in OhTataru-YMHF at Corollary 5.15 and Lemma 5.33, printed pages 42 and 54–55 (lines 1955, 2515–2521): the source says the linearised limit conclusion holds for −1<σ<2 and follows from Lemma 5.33; it should be restricted to the proved range, or supplemented for the missing ranges; affects the proof.
- **Misprint** in OhTataru-YMHF at Lemma 6.9 proof, printed page 62 (lines 2899–2902): the source says a wedge square without Hodge star is the nonnegative remainder and uses the same sign in both terms; it should be the squared norm of F±⋆F, with the opposite sign on the cross term; affects the proof.
- **Misprint** in OhTataru-YMHF at Theorem 6.10 discussion, printed page 62 (line 2916): the source says Gursky–Kelleher–Streets Corollary 1.3 supplies the non-instanton energy gap; it should be Corollary 1.2(1) in the cited v3; affects nothing.
- **Misprint** in OhTataru-YMHF at Proposition 7.7, printed page 69 (line 3288): the source says divergence is bounded in inhomogeneous W^{1,4/3}; it should be homogeneous Wdot^{1,4/3}, alongside ℓ¹L²; affects a stated result.
- **Error** in OhTataru-TopClass at Theorem 1.5, printed page 8 (lines 374–375): the source says curvature derivatives controlled only on B_R imply global higher regularity of the remainder; it should be a global curvature-regularity hypothesis for that global conclusion; affects a stated result.
- **Error** in OhTataru-TopClass at Proposition 1.6, printed page 9 (lines 401–403): the source says all gauges at infinity of gauge-equivalent potentials are homotopic without constant factors; it should be homotopy modulo left and right constant multiplication when G is disconnected; affects a stated result.
- **Error** in OhTataru-TopClass at Proposition 1.6 converse, printed page 9 (line 403): the source says every homotopic angular map is a gauge at infinity of the same fixed potential; it should be a gauge at infinity of some gauge-equivalent potential; affects a stated result.
- **Misprint** in OhTataru-TopClass at (1.26), printed page 17 (line 886): the source says the paired wedge coefficient is the unscaled all-index antisymmetric sum; it should be one quarter of that sum under F=½F_jk dx^j∧dx^k; affects a stated result.
- **Error** in OhTataru-TopClass at Lemma 3.2 proof, printed page 21 (line 1049): the source says disjoint open V,W admit a smooth cutoff zero on V and one on W; it should be zero on V and positive on W, allowing touching closures; affects the proof.
- **Misprint** in OhTataru-TopClass at Lemma 3.3 proof, printed page 22 (line 1098): the source says the derivatives of the inverse maps are Cauchy in W^{1,d}; it should be L^d for this step; affects the proof.
- **Error** in OhTataru-TopClass at Lemma 3.4(2), printed page 22 (lines 1116–1123): the source says critical adjoint multiplication preserves top-order Sobolev regularity for arbitrary top-order data; it should be restricted below top order, or require boundedness of top-order data; affects a stated result.
- **Misprint** in OhTataru-TopClass at Lemma 3.4(3), printed page 22 (line 1130): the source says the Maurer–Cartan bracket is inside the adjoint action; it should be [O;x,Ad(O)B] outside that action; affects a stated result.
- **Misprint** in OhTataru-TopClass at Theorem 3.11 proof, printed page 27 (line 1375): the source says the right Maurer–Cartan curl has negative bracket and its divergence has an outer adjoint; it should be positive bracket, and divergence [O;ℓ,A′_ℓ] without that outer adjoint; affects the proof.
- **Misprint** in OhTataru-TopClass at Theorem 3.11 proof, printed page 28 (line 1392): the source says the ordinary curl of the transformed potential equals curvature; it should be curvature minus the potential's quadratic bracket, with sequence indices consistently attached; affects the proof.
- **Misprint** in OhTataru-TopClass at Lemma 3.13, printed page 29 (line 1423): the source says the output exponent is d/(n+2) with n unspecified; it should be d/(m+2); affects a stated result.
- **Misprint** in OhTataru-TopClass at Lemma 3.20, printed page 33 (line 1630): the source says the approximating sequence converges to itself; it should be convergence to O; affects a stated result.
- **Error** in OhTataru-TopClass at Lemma 3.21, printed page 33 (line 1642): the source says the constant value of an extending map is homotopic to the identity value; it should be homotopic to some constant, unless connectedness is assumed; affects the proof.
- **Error** in OhTataru-TopClass at Lemma 3.22, printed page 33 (line 1646): the source says the unitary-valued map belongs to a global finite-p Sobolev class on the exterior; it should be locally Sobolev with the stated global derivative integrability; affects a stated result.
- **Error** in OhTataru-TopClass at §6, printed page 50 (lines 2417–2418): the source says a nonabelian compact group necessarily has a nonzero simple Lie-algebra factor; it should be a compact group with nonabelian Lie algebra; affects a stated result.
- **Error** in OhTataru-TopClass at §6, printed page 50 (line 2424): the source says projections G→G_i exist for the simply connected simple factors of the universal cover; it should be Lie-algebra projections, or projections from the cover of the identity component; affects the proof.
- **Misprint** in OhTataru-TopClass at (6.4), printed page 50 (lines 2432–2437): the source says χ is an integral of the negative curvature inner product; it should be the paired wedge integral, as in the earlier definition; affects the proof.
- **Error** in OhTataru-TopClass at §6, printed page 50 (line 2443): the source says the abelian component of a harmonic finite-energy potential vanishes; it should be its curvature that vanishes, with the potential removable by gauge; affects the proof.
- **Error** in GurskyKelleherStreets-GapTheorem at Definition 2.3, printed page 4 (line 173): the source says the suprema over nonzero vectors are always attained; it should be restricted to nonzero Lie algebras, with the zero-algebra value separately defined as zero; affects a stated result.
- **Error** in GurskyKelleherStreets-GapTheorem at Lemma 2.4, printed page 4 (lines 178–196): the source says every subalgebra's supremum is attained by a nonzero Pauli pair; it should be a description of equality in the universal √2 bound, not arbitrary-subalgebra attainment; affects a stated result.
- **Misprint** in GurskyKelleherStreets-GapTheorem at Lemma 2.6 proof, printed page 5 (line 218): the source says one product contains the third power of ‖P³‖; it should be the second power, making every summand homogeneous of degree four; affects the proof.
- **Misprint** in GurskyKelleherStreets-GapTheorem at Proposition 2.8 proof, printed pages 5–6 (lines 248–279): the source says the curvature pairing has positive sign, and later changes the Weyl/scalar coefficients; it should be the negative curvature sign of Lemma 2.1 with consistent Weyl/scalar coefficients throughout cancellation; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4963861d655719f678083cf3b3005e2a3244368d", "job": "RT-YangMillsConnectionsAndCaloricGauge~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
