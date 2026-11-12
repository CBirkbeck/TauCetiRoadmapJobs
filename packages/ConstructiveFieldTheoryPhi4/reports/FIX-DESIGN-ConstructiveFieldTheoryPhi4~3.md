# ConstructiveFieldTheoryPhi4 design repairs

All twelve findings in `packages/ConstructiveFieldTheoryPhi4/reports/REV-DESIGN-ConstructiveFieldTheoryPhi4~2.md` are applied. Changes are in `packages/ConstructiveFieldTheoryPhi4/design/README.md` and `packages/ConstructiveFieldTheoryPhi4/design/plan.json`. The existing source manifest needs no new work or key.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R01 (P2) — applied

Uniform superquadratic growth of approximants → growth on the limit. Section 2.2 owns full-class finite-volume moment transfer, simultaneously for finitely many systems and subregions. Updated closure, §1.4's explanation, §3.5's transfer route and downstream §8.2. Added shrinking-block, constant-zero, one-/two-site and φ⁴ approximation Checks. The nonnegative-weight convention remains.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R02 (P2) — applied

Unqualified normalized current laws → laws defined only for positive source normalizers. Section 3.4 states the component-parity equivalence, with its elementary path-pairing proof, and restricts the probability corollary. Unnormalized switching retains every source set and zero coupling. Section 3.5's proof route explicitly handles zero normalizers without probabilities; zero/disconnected/singleton Checks were added.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R03 (P2) — applied

Stability alone → stability and integrable coordinate squares in §§7.1–7.2 and the plan. Normalizers are finite second moments, called variances only with evenness. Qualified the second-moment and indicator identities and the zero-normalizer convention. Added Cauchy exclusion alongside Ising, Gaussian and Dirac computations. Gaussian laws remain permitted through positive definiteness, rather than admissibility.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R04 (P2) — applied

Independently owned continuum kernel facts → imports from RelativisticQuantumFieldTheory §7.1 in ownership, contracts, §7.4, layer dependencies and plan. Probability laws, block normalization and lattice reachability remain here. Removed the reverse consumer edge. Specified the indicator integral domain and off-origin radial formula. Recomputed Fourier/kernel/block witnesses; clarified mass monotonicity as quadratic-form order, with the cross-term negative control.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R05 (P2) — applied

Base summit theorem targets with external proofs → full sourced downstream goals owned by ConstructiveFieldTheoryPhi4PartII. Summary, ownership, build description and plan end base completion at Layer 7. Sections 8.1–8.2 retain their identifiers under Downstream consumers; their plan entries move outside owned layers. Updated §7.4's references and the consumer contract, including the reconstruction application.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R06 (P3) — applied

Stale baselines → Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. Refreshed declaration positions throughout supplier contracts, including multivariate Gaussian, projectivity, differentiation, determinacy and Gaussian moments. Added exact positions for previously unlocated finite-product, density, pushforward, Gaussian-law and Gamma definitions. No pin file changed.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R07 (P3) — applied

“Every δ₀ correlation vanishes” → positive-degree correlations vanish and the zeroth equals 1, in §4.1 and its plan Check. The empty-product sweep also records n = 0 Gaussian/pairing equality in §3.5 and makes n ≥ 1 explicit for its recursion selecting x₁. Wick's empty-pairing convention remains consistent.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R08 (P3) — applied

Unconditional squared mean for every product reflection → unconditional formula for edge reflections and conditional squared mean given fixed spins for vertex reflections. Updated §5.2 and its plan Check, including d = 1, L = 2, R(x) = −x, f = φ₀: reflection form 1 versus squared unconditional mean 0.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R09 (P3) — applied

Unrestricted Lebesgue equality example → separate pinned Gaussian-gradient example with φ₀ = 0, J > 0 and Lebesgue measure on remaining coordinates. Section 5.3 and its plan Check give the pinned shift h − h₀, finite integral √π and the divergent unpinned integral. The theorem's admissible probability a-priori setting is unchanged.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R10 (P3) — applied

“Only reflections” → every involution satisfies g = g⁻¹. Section 7.1 and its plan Check include the half-turn −I, with both candidate right sides equal to 1. The quarter-turn still separates them: corrected side 0, incorrect side 1. Neither action identity was reversed again.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R11 (P3) — applied

PDE's obsolete stretch-goal reference → PDE, Scope and ownership, assigning the stochastic programme to PDE, Part II. This remains an ownership deferral, not a supplier edge to PDE Part II. No stochastic-quantisation target or prerequisite was introduced here.

## REV-DESIGN-ConstructiveFieldTheoryPhi4~2/R12 (P3) — applied

Missing finite-volume FKG input → §3.3 in §4.2's Needs and `target:3.3` in its plan prerequisites. Specified uniform-integrability passage for continuous polynomially bounded increasing cylinder functions. Added one-coordinate Ising and independent-coordinate Checks: 1 ≥ 0 and 0 ≥ 0. No later-layer prerequisite is used.

## Evidence and mathematical limits

The source claims were verified against the legal cached extractions, rather than accepted from the review. No passage was copied into the design.

| Finding | Evidence read and conclusion |
| --- | --- |
| R01 | `aizenman-duminilcopin-2021 line 374` and `aizenman-duminilcopin-2021 line 384`, Definition 2.1(2), pp.8–9, place growth on the limit. `aizenman-duminilcopin-2021 line 1982` and `aizenman-duminilcopin-2021 line 2019`, §7, pp.44–45, invoke continuity for the class. They do not assert uniform superquadratic moments for every approximation. The repaired finite-volume approximation theorem is explicitly work owned here; it is not claimed as a consequence of weak convergence alone. Simultaneous transfer is needed for Simon–Lieb's factors on V and Λ. |
| R02 | `aizenman-duminilcopin-2021 line 500`, (3.7)–(3.9), pp.11–12, defines constrained probabilities by division. For zero normalizer this is not a probability. Positive-weight currents use only positive-coupling edges; componentwise source parity is necessary. Pairing even sources along paths, adding the path indicators modulo two, constructs a positive-weight current and proves sufficiency. |
| R03 | `aizenman-duminilcopin-2021 line 157`, (1.14)–(1.15), p.4, supplies the second-moment normalization for the source's finite-moment classes. It does not justify extending it to arbitrary stable single-site laws. Cauchy density has x² times its density tending to 1/π, so its second moment diverges despite Z = 1 at J = 0. |
| R04 | `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md`, §7.1, explicitly owns the heat-integral function, Fourier agreement, exterior decay and massless radial kernel. This is function-level ownership as well as tempered-distribution ownership. The imported normalization is the same 4π² convention. |
| R05 | `aizenman-duminilcopin-2021 line 190`, Theorem 1.2, p.5, and `aizenman-duminilcopin-2021 line 2006` / `aizenman-duminilcopin-2021 line 2014`, Theorem 7.1 / Proposition 7.2, p.45, support the downstream statements. The latter estimates have β ≤ β_c and L ≤ ξ hypotheses; their proof/limit infrastructure is assigned to Part II, not asserted to follow from base definitions. |
| R06 | `lake-manifest.json` and direct reads of the pinned files agree with the replacement hashes and positions. Declaration types, not just names, were inspected. |
| R07 | For A = 0 the monomial is the empty product 1, so every probability expectation is 1. For A = 2δ_x under δ₀ it is 0. This also fixes the n = 0 boundary in the Gaussian-moment sweep. |
| R08 | `peled-spinka-2017 line 1331`, Proposition 2.14, p.28, conditions on fixed vertices before factorizing the form. This produces the conditional squared modulus. |
| R09 | `peled-spinka-2017 line 1640`, p.33, explicitly removes constants by quotient or pinning. A pinned translation has coordinate 0 at the pinned vertex; the unpinned common-translation coordinate has infinite Lebesgue volume. |
| R10 | (−I)² = I in W₂, although −I is not a hyperplane reflection. The same equality g = g⁻¹ is exactly the obstruction for all involutions. |
| R11 | `TauCetiRoadmap/PDE/README.md`, Scope and ownership, lines 101–110 on main, assigns stochastic quantisation, Wick renormalization and its Gibbs measure to PDE, Part II and stops at deterministic theory. |
| R12 | `target:3.3` supplies association for increasing functions; monomial Griffiths inequalities do not by themselves state this. The exponential moment hypothesis of §4.2 gives uniform integrability for the cylinder products being passed to the limit. |

The six certified source extractions remain the readable sources. The seven previously settled uncertified entries remain cited by their existing locators and were not requested again. In particular, the exact general finite-volume transfer and block-normalized Gaussian reachability statements are roadmap targets, not claims that the readable source contains those exact signatures as numbered theorems. Sokal's scanned displays are incomplete: `sokal-1982 line 620`, §2.3, and `sokal-1982 line 710`, Lemma 2.2, give the continuum-limit context; the Gaussian reachability normalization is checked by the roadmap's Fourier calculation. `simon-2020-twelve-tales line 960`, (3.8), gives the finite Gaussian lattice model. No new missing text or unsettled source request arose.

## Adversarial mathematics pass

Each row records actual values or symbolic evaluations, including the changed APIs and their consumers. The finite tests distinguish conventions and invalid generalizations; they do not replace proofs of the planned general theorems. Unchanged rows were recomputed from the definitions, not inherited as blanket assurances from an earlier acceptance.

| Statement | Instances tried | Values computed | Result and change |
| --- | --- | --- | --- |
| Lattice/box convention | d = 1, R = 0,1; d = 2, R = 1 | Cardinalities 1,3,9 = (2R+1)^d | Empty dimension excluded by d ≥ 1. |
| Hamiltonian convention | Two Ising sites, J = 1 | Z = cosh 1 = 1.543081; correlation = 0.761594, rather than tanh 2 = 0.964028 | One unordered bond, no extra factor two. |
| Single-site sign | b = −1/2; b = +1/2 at λ = 0 | Variance 1 for first; integral of exp(x²/2) infinite for second | Negative b fixes Gaussian sign. |
| Torus bond/Fourier convention | d = 1, L = 1 | Effective pair coupling 2J; E(0) = 0, E(π) = 4 | Doubled small-torus bond retained. |
| Continuum Fourier convention | d = 1, m = 1, ξ = 0; x = 1 | Multiplier 1; kernel exp(−1)/2 = 0.183940 | Imported convention agrees with §7.4. |
| Total normalization convention | Σ = 0; stable nonempty block | √0 = 0, inverse 0 = 0, T = 0 | Infinite moments excluded; zero integral cannot disguise divergence. |
| §0.1 admissibility/evenness | δ₂, N(0,1), Cauchy | δ₂ exponential moment exp(4c), mean 2; Gaussian moment at c = 1/2 infinite; Cauchy second moment infinite | δ₂ admissible but not even; latter laws inadmissible. |
| §0.1 closure/product APIs | δ₁ scaled by 2; tilt by exp(ax²+hx); empty/two-site product | Scaled moment exp(4c); normalized tilt still δ₁; product integrals 1 and exp(2c) | Real tilts have positive finite denominator. |
| §0.1 domination/growth | exp(−x² log(1+x²)); α = 3 | Quadratic tilt exponent = x²(c−log(1+x²)) → −∞; cubic tilt exponent x³−x²log(1+x²) → +∞ | Admissibility weaker than superquadratic growth. |
| §0.2 φ⁴ law/moments | λ = 1,b = 0,k = 0,1,2 | Moments 1, 0.3379891200, 0.25 | Zeroth/Gamma normalization consistent. |
| §0.2 scaling/double well | λ = 1,b = 2,s = 2 | New parameters 1/16,1/2; maxima move from ±1 to ±2 | Scaling uses s⁻⁴ and s⁻². |
| §0.2.1 Ising law/hard limit | Ising; λ → ∞,b = 2λ | Odd moments 0, even moments 1; exponent relative to wells = −λ(x²−1)² | Atomic limit permitted without a density. |
| §1.1 stability/Gibbs measure | Empty V; one site; two standard normals at J = 1 | Z = 1,1,∞ respectively | Only stable triples define normalized laws. |
| §1.1 decoupling/relabel/tilt | Two independent Ising sites; swap; quadratic tilt | Z = 1, E σ₁σ₂ = 0 before/after swap; normalized one-site quadratic tilt leaves Ising unchanged | Product and transport formulas agree. |
| §1.1 signed interaction | Three-site triangle, J = 1 and J = −1 | Z(1) = 5.297294, correlation 0.930553; correlation at −1 = (exp(−3)−exp(1))/(exp(−3)+3exp(1)) < 0 | Existence does not require ferromagnetism. |
| §1.2 moments/symmetries | Chain J = 1; unequal end couplings; biased Ising | Neighbor correlations both 0.761594; unequal couplings give tanh J₁ and tanh J₂; mean −1/3 for biased law | Automorphism and evenness hypotheses necessary. |
| §1.3 coupling derivatives | Two Ising sites J = 0,1; diagonal direction | Derivatives 1, 0.419974; diagonal derivative 0 | Symmetric off-diagonal direction has no extra 1/2. |
| §1.4 continuity | Escaping-mass example; J = 0 | Two-site Z ≥ exp(k²−2k)/4 → ∞ versus Z(δ₀) = 1; at J = 0, Z = 1 throughout | Bare weak convergence insufficient; uniform quadratic hypothesis retained. |
| §1.5 Gaussian stability | b = −1,J = 1,−1,2,−3 | Precision eigenvalues (1,3),(3,1),(0,4),(5,−1); determinants 3,3,0,−5 | Exactly first two stable; absolute-value threshold retained. |
| §1.5 Gaussian inverse/Green limit | b = −1,J = ±1; d = 1,μ = 1 and μ ↓ 0 | Variance 2/3; covariance ±1/3; G₁(0) = 1/√5; G_μ(0) ∼ 1/(2μ) | Covariance sign and massless exclusion agree. |
| §2.1 blocks/representation | Two-spin Griffiths trick; q = 0; q = (s) | Three masses 1/3 each; zero block δ₀; two-site correlation s²tanh(Js²) | Nonnegative blocks and zero weights included. |
| §2.1 wrong signed block | ε = 1/4 for difference of two spins | Fourth moment 16ε = 4; three times squared second moment 48ε² = 3 | Negative weights violate transferred Lebowitz. |
| §2.2 limit-growth definition | Normal CLT; δ₀; φ⁴ with α = 3 | Normal cubic exponential moment ∞; δ₀ moment 1; φ⁴ exponent −λx⁴+bx²+abs(x)³ → −∞ | Full limit-growth class restored. |
| §2.2 closure | s = 0; s = 2,α = 3,smaller exponent 5/2 | Scaled δ₀ moment 1; 2^(5/2)abs(x)^(5/2)−abs(x)³ → −∞ | Scaling can lower growth exponent; no false fixed-exponent claim. |
| §2.2 bad weak approximants | Independent shrinking blocks, N → ∞ | Variance 1/(log N)² → 0; logarithm of exponential α-moment lower bound = (1−N)log 2+N^(α/2)/(log N)^α → ∞ | Approximation-dependent uniform superquadratic inference rejected. |
| §2.2 finite-volume transfer | Same constant approximation on one/two sites, s = 0,1 | Second moments 0,1; two-point moments 0,tanh J; both zeroth moments 1 | Simultaneous system/subregion convergence explicitly owned. |
| §2.3 φ⁴ Ising approximation | λ = 1/12,b = ±1,c = 1 | g_N = 1±2/√N; exponent bφ²−φ⁴/12; negative-b coupling positive for N > 4 | Correct quartic scaling and sign survive full-class repair. |
| §3.1 Griffiths/Ginibre | Two Ising sites J = ±1; m = n = 2 | Correlations ±0.761594; for independent ±1, (x+y)²(x−y)² = 0; odd n integrates to 0 | Nonnegative coefficients and evenness needed. |
| §3.2 monotonicity | Open chain versus disconnected endpoints | Endpoint correlations tanh²1 = 0.580026 versus 0 | Added positive bonds/volume increase correlation. |
| §3.3 finite FKG | Two lattice-gas sites J = 0,1; F = G one Ising coordinate | Covariances 0, (e−1)/(3+e)² = 0.05255…; one-site variance 1 | Finite FKG supplies increasing-function association. |
| §3.4 current representation | One edge J = 0,1; n = 0 | Z_∅ = 1,cosh1; Z_xy = 0,sinh1 = 1.175201; zero-current weight 0⁰/0! = 1 | Positive empty normalizer; nonempty normalizer may vanish. |
| §3.4 switching | A = B = {x,y}, J = 1; J = 0 | sinh²1 = cosh²1−1 = 1.381098; both sides 0 at J = 0 | Unnormalized identity includes zero cases. |
| §3.4 normalization/parity | J = 0,1; singleton; disconnected odd components | Normalized mass undefined at Z_xy = 0, equals 1 at J = 1; singleton/disconnected source sums 0 | Probability corollary now has its domain. |
| §3.5 Gaussian/Lebowitz | Ising; λ = 1,b = 0; ε = 1/4; n = 0 | 1 ≤ 3; 0.25 ≤ 0.342710; 0.25 > 0.1875; empty pairing gives 1 = 1 | Class restriction retained; recursion now explicitly n ≥ 1. |
| §3.5 Simon–Lieb/repetitions | Chain J = 1,Λ = {0}; tuple (x,x,y,y) | 0.580026 ≤ 0.761594; 1 ≤ 1+2tanh²1 = 2.160051 | Finite-region factor and repeated-site convention agree. |
| §3.6 reflection inequality | Chain J = 1,R(x) = 3−x | tanh1 = 0.761594 ≥ tanh²1 = 0.580026; 1 ≥ tanh³1 = 0.441744 | Reflection direction retained. |
| §3.6 reflected Hamiltonian | J_xy = 3,J_x,Ry = 1 | s coefficient (3+1)/2 = 2; t coefficient (3−1)/2 = 1 | Both nonnegative; reversed dominance would give negative t coefficient. |
| §3.7 integration by parts/uniform bound | One site λ = 1,b = 0,J = 0 | 4Eφ⁴ = 4·0.25 = 1; M = 0.5 ≥ 0.337989 | Factors 4λ and 2b agree with density. |
| §3.7 Newman bound | Ising a = 2; rare nonmember ε = 1/4 | cosh2 = 3.762196 ≤ exp2 = 7.389056; nonmember 1.690549 > exp(1/2) = 1.648721 | Full-class transfer has a real discriminating consequence. |
| §4.1 free correlations | δ₀,A = 0 and 2δ_x; Ising chain J = 1 | Limits 1,0; distance-two chain limit 0.580026 for both exhaustions | Zeroth correlation repaired. |
| §4.2 limiting law/FKG | Independent Ising; adjacent chain pair | Product covariance 0; one-coordinate covariance 1; P(same neighbor) = (1+tanh1)/2 = 0.880797 | Added §3.3 supplies FKG passage. |
| §4.3 susceptibility/critical point | Ising chain J = 1; δ₀ | χ = (1+tanh1)/(1−tanh1) = exp2; δ₀ χ = 0 and β_c = ∞ | Sum includes origin; zero law has no finite critical point. |
| §4.4 axis monotonicity | d = 1 chain, J = 1,x = 0,1,2 | Values 1,0.761594,0.580026 | Both norm bounds agree in one dimension. |
| §5.1 periodic law | d = 1,L = 1,2,J = 1 | Two-site correlation tanh2; four-cycle neighbor (t+t³)/(1+t⁴) = 0.900413, versus open-chain t = 0.761594 | Periodicity is not free boundary. |
| §5.2 edge positivity/chessboard | Two-site Ising J = 0,−1; constant functions | Eigenvalues proportional to e^(2J)±e^(−2J): (2,0) at 0, negative smaller eigenvalue at −1; constant chessboard gives 1 = 1 | Ferromagnetic domain and equality case retained. |
| §5.2 vertex product form | d = 1,L = 2,J = 0,f = φ₀ | Form Eφ₀² = 1 = conditional square; unconditional squared mean 0 | Fixed-vertex defect repaired. |
| §5.3 domination derivative | Two-site torus,J = 1,u = 0 | Second derivative −4+28exp(−4) = −3.487162 | Correct sign and doubled torus edge. |
| §5.3 pinned Gaussian equality | Two vertices,J = 1,u = 0,1 | Both pinned integrals √π = 1.772454; both unpinned positive integrals ∞ | Zero mode removed, rather than comparing junk real integrals. |
| §5.4 infrared/sum rule | L = 1,d = 1,J = 3/8; Gaussian mass gap → 0 | E(π)Ŝ(π) = 1.459404 ≤ 8/3, but > source's 2/3; Gaussian product → 1/J | Earlier correction remains valid. |
| §5.5 long-range order | d = 3,J = 1; d = 1,2 | Lower bound 1−I₃ ≈ 0.7473; radial integral ∫r^(d−3)dr diverges for d ≤ 2 | Dimension threshold justified. |
| §6.1 random-field linearity/transport | Integral test value 1; its negative; zero field | Linear field values 1,−1; absolute-integral model values 1,1; zero values 0,0 | Wrong nonlinear model excluded; no sample-path continuity asserted. |
| §6.2 Schwinger functions/decay | h(x) = exp(−x²),x = −y = r; h = 1; white noise | S₂ = exp(−2r²) = bound exp(−abs(x−y)²/2); constant kernel 1; white-noise off-diagonal value 0 but variance ∫f² > 0 | Decay need not imply centering; white noise has no function kernel. |
| §6.3 PSD realization/uniqueness | K = [[1,r],[r,1]],r = 1,2; zero K; Brownian t = 0,1 | Difference variances 0,−2; zero process variance 0; Brownian variances 0,1 | Semidefinite case allowed, invalid covariance excluded. |
| §6.4 Wick iff | Centered N(0,1); fair sign; empty tuple; shifted mean 1 | Fourth moments 3 versus 1; empty moment 1; shifted first moment 1 versus Wick 0 | Both implications and centering tested. |
| §7.1 normalization/second moments | Independent N sites: Ising, Gaussian variance v, δ₀, Cauchy | Σ = N,Nv,0,∞; normalized indicator second moment 1,1,0,undefined | Finite-moment domain preserves all intended examples. |
| §7.1 non-even normalization | Bernoulli {0,1},N = 3,J = 0 | Block second moment (N²+N)/4 = 3; mean normalized sum = √3/2; variance normalized sum = 1/4 | Second moment 1 is not variance 1 without evenness. |
| §7.1 block monotonicity | Chain L = R = 1,J = 0,1 | Σ = 3 and 3+4tanh1+2tanh²1 = 7.206428 | Covariance sums count both directions correctly. |
| §7.1 action direction | Quarter-turn; half-turn; identity | Quarter-turn corrected sides 0 = 0, wrong RHS 1; half-turn sides 1 = 1; identity unchanged | All involutions acknowledged. |
| §7.2 reachability | J = 0 Ising; δ₀; Cauchy; Gaussian stable box | Limit covariance 2^(−d)∫fg; zero law; Cauchy Z = 1 but Σ = ∞; Gaussian Σ finite positive | Stability alone no longer creates a scheme. |
| §7.2 telegraph counterexample | c = 1,Q = [−1,1] | κ = 2+2exp(−2) = 2.270671; S₂(u,v) = exp(−abs(u−v))/κ → 0; normalized block variance 1 | Bounded nonconstant block variable is non-Gaussian; d = 1 excluded downstream. |
| §7.3 structure/symmetry | Biased independent law; rare spikes p = N⁻²,a² = 1/p | Biased limit mean 2^(−d)∫f, variance 0; spike probability in O(N) sites O(1/N), single-site second moment 2−p | Evenness needed for spin symmetry; second moments may drop in limits. |
| §7.3 lower semicontinuity Check | Rare-spike scheme | Lattice variance → 2^(−d)∫f²; limit variance → 2^(−d−1)∫f² | Strict inequality remains compatible with finite lattice moments. |
| §7.4 kernel/block covariance | d = 1,m = 1,2 | C₁(1_Q,1_Q) = 1.135335; C₂ = 0.377289; G₁(1) = 0.183940 | Imported kernel normalization preserved. |
| §7.4 mass order | f = 1_Q by L² extension; g = −f | Quadratic terms decrease 1.135335 → 0.377289; cross terms increase −1.135335 → −0.377289 | Quadratic-form order explicitly distinguished. |
| §7.4 massless domain/local singularity | d = 1,m ↓ 0; d = 4,m = 0 | Block covariance 2/m−4/3+O(m) → ∞; integral of 1/(4π²r²) over radius ε ball = ε²/4 | Excludes low-dimensional massless normalization; d = 4 singularity integrable. |
| §7.4.1 lattice reachability | b_n = −(d+m²/(2L²)),J = 1; q = 0 and small q | Precision m²/L²+E(p); L²E(q/L) → abs(q)²; p = 2πξ/L gives 4π²abs(ξ)²+m² | Mass/Fourier conventions and exact block variance 1 agree. |
| Downstream §8.1 | d = 1 telegraph; d = 4 GFF; white noise | Telegraph decay exp(−r)/κ with nonzero bounded block; GFF decay r⁻² or exponential; white-noise function kernel would give 0 versus ∫f² | Full theorem retained as Part II goal, not base acceptance. |
| Downstream §8.2 | Ising inclusion; Gaussian exclusion; δ₀ | Ising growth moment exp(1), δ₀ moment 1; Gaussian α-exponential moment ∞ | Correct full class; Gaussian lattice reachability is not an instance. |

For the zero-normalizer assertion in Conventions, Gibbs and product measures have the same null sets because their density is strictly positive. If a nonempty sum of independent identically distributed coordinates is almost surely zero, each coordinate is constant and that constant is zero. Thus finite Σ = 0 characterizes δ₀ on the stated stable domain. This argument does not turn an infinite moment into a zero real integral.

The covariance integral is finite on C_c in the stated mass range: bounded Fourier transforms control a neighborhood of zero, whose massless radial integral is ∫r^(d−3)dr; Plancherel controls the complement. The same applies to 1_Q in L¹ ∩ L². Its covariance is strictly positive since its transform is nonzero near zero. No denominator in the normalized Gaussian field is zero.

## Suppliers, pins and ownership

Read main's StochasticCalculus, StandardDistributions and PDE roadmaps before editing. Their shape, scope and cited supplier sections were inspected, as was OperatorAlgebraDynamics D9. StochasticCalculus §1.1 supplies arbitrary-index standard-Borel extension; StandardDistributions §5.3 supplies finite-vector Wick–Isserlis; neither is reconstructed here. RelativisticQuantumFieldTheory §7.1 was read at the accessible open head and supplies precisely the analytic kernel facts now imported.

Object searches used the roadmap grep/show tools across main and accessible open heads and searched the board packages and pinned libraries. The supplied overlap report has no conflicting edit, dropped citation or open-revision-only numbering. The closest accessible roadmaps inspected were MathematicalStatisticsFoundations (finite-sample statistics), RandomMatrices (matrix laws), DysonBrownianMotion (finite-dimensional matrix/particle dynamics), StandardDistributions and RelativisticQuantumFieldTheory. Only the last owns the duplicated continuum analytic kernels. The generic PSD-kernel process realization remains here: it assembles finite Gaussian laws using the imported extension theorem. No new carrier or theorem has been assigned to another supplier, and no supplier gap is needed.

The pin inspection confirms these native definitions and limits:

- `MeasureTheory.Measure.IsNegInvariant`, `Mathlib/MeasureTheory/Group/Measure.lean:310`, has condition `μ.neg = μ`; it asserts no tail integrability.
- `MeasureTheory.IsProjectiveMeasureFamily`, `Mathlib/MeasureTheory/Constructions/Projective.lean:45`, asserts equality with restriction pushforwards, not existence of a limit. Limit and uniqueness are at lines 115 and 150.
- `ProbabilityTheory.IsGaussianProcess`, `Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean:30`, requires Gaussian finite restrictions, not centering. `HasGaussianLaw` is at its `Def.lean:33`.
- `ProbabilityTheory.multivariateGaussian`, `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`, uses the matrix square root. Its characteristic-function and restriction theorems at lines 233 and 241 require positive semidefiniteness; invalid covariance falls back to a Dirac law, not a process with that covariance.
- `CompactlySupportedContinuousMap`, `Mathlib/Topology/ContinuousMap/CompactlySupported.lean:41`, bundles continuity and compact support; it imposes no distribution-valued sample-path condition on an indexed random field.
- Countable projective extension at `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165` requires probability marginals and standard-Borel coordinates. Moment determinacy at `TauCeti/Probability/Moments/Determinacy.lean:246` requires finite measures and a positive exponential moment for each measure. Gaussian moments are at `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147`.
- Differentiation under the integral at `Mathlib/Analysis/Calculus/ParametricIntegral.lean:569` requires an integrable local derivative bound and the displayed measurability/differentiability hypotheses; §1.2's exponential domination provides them. `fkg` at `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370` is a finite distributive-lattice theorem with nonnegative monotone functions; the scalar-spin extension still requires §3.3's finite approximation and shifts.

All other file positions in the supplier contracts were opened directly at the pins. No declaration was reported missing based on a newer library or a remembered locator.

## Check outcomes

- Dependency check, exact output:

```text
candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after RelativisticQuantumFieldTheory (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2134 edges, 0 problem(s)
```

  Exit status 0. No UPWARD or CYCLE line. No merge-order file changed.
- Plan validation: JSON parses; eight owned layers, 36 owned entries, two separately owned downstream goals, 121 owned Checks, and no dangling `target:` prerequisite. Every owned entry retains at least three Checks. The new finite-volume FKG edge is earlier-layer supply.
- Source manifest: TOML parses; thirteen distinct keys, six certified and seven settled uncertified sources. No new source was needed, so `packages/ConstructiveFieldTheoryPhi4/sources.toml` is unchanged.
- Citation resolver: no cross-roadmap citation or Lean name found nowhere. Its generic warning that it did not check pinned packages is not a pin check; the direct file inspection above supplies that verification.
- `git diff --check`: exit status 0. Design files and this report contain repository-relative references, with no machine path.
- Lean elaboration and mechanical `#check @name` binder audit: not applicable in this design lane. There is no `Suggested.lean` in this package and no Lean command was authorized for this lane. No acceptance declaration was added, deleted or silently left with a changed README signature. The later acceptance inventory ends at this roadmap's owned deep results, including Gaussian reachability; marginal triviality belongs to Part II.
- No gate failures were listed beyond the review findings. No tooling, other package, pin file, pull-request text or merge-order file was edited; no commit was made.

Maintainer consequences: RelativisticQuantumFieldTheory §7.1 is now an explicit earlier supplier, not a downstream consumer. ConstructiveFieldTheoryPhi4PartII owns both marginal-triviality statements and proofs. Mathematical identifiers 8.1–8.2 are preserved under Downstream consumers; no cited Lean name changes. Section 2.2's stronger transfer obligation must be implemented for the full limit-growth class, with simultaneous finite-system approximation; the roadmap no longer treats that work as an automatic consequence of §1.4.
