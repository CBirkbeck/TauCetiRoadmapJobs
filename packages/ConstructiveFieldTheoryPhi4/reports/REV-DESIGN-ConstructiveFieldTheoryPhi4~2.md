# Review of ConstructiveFieldTheoryPhi4 (design, round 2)

**Verdict:** needs changes

The three original findings are repaired. This review finds twelve further issues: five P2 and seven P3. The base construction is repairable; rejection is not warranted. No design or source-manifest entry was changed.

## Previous findings, checked first

- **F01 — repaired.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:626` now says “`T_{f∘g,L,Σ}(φ) = T_{f,L,Σ}(φ ∘ g⁻¹)`”; the equivalent identity and `plan.json:1588` agree. For the quarter-turn, f = 1_{e₁}, φ = 1_{e₂}, the corrected sides are 0 and 0; the former right side is 1. The equivalent identity gives 1 = 1. The appended Check's final exclusivity claim has a separate defect, R10.
- **F02 — repaired.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:200` now says “`J` of either sign: stable iff `|J| < 2|b|`”; `plan.json:431` agrees. At b = −1 and J = 1, −1, 2, −3 the determinants are 3, 3, 0, −5 and the eigenvalue pairs are (1,3), (3,1), (0,4), (5,−1). Exactly the first two are positive definite.
- **F03 — repaired.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:33` says “Aizenman–Duminil-Copin's”; line 516 says “printed in Aizenman–Duminil-Copin (5.9)”. No occurrence of the undefined abbreviation remains in either design file. The numerical comparison remains 1.459404 versus 0.666667.

I swept the other action formulas, Gaussian stability conditions and expanded citations. The invariance statements quantify over a group, so replacing g by g⁻¹ leaves them unchanged. The remaining one-sided Gaussian box condition is explicitly ferromagnetic. No previous finding was marked not actionable; none is re-raised here.

## R01 (P2) — The Griffiths–Simon generality needs a missing equivalence theorem

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:234`, and `packages/ConstructiveFieldTheoryPhi4/design/plan.json:517`: “here it is required uniformly along the approximating sequence”. This restriction propagates to §§3.5, 3.7, 4.1–4.3 and 8.2.

**Claim.** The roadmap calls its class the Griffiths–Simon class but substitutes a uniform superquadratic exponential moment of approximants for the source's growth condition on the limit, specifically to use §1.4. No target proves these existential definitions equivalent.

**Witness.** `aizenman-duminilcopin-2021 line 374`, Definition 2.1(2), pp.8–9, requires weak approximation; line 384 puts the growth integral on ρ. The README puts a supremum over approximants there instead.

**Exact repair.** Keep the justified nonnegative-weight correction of §2.1, but define the full weak-limit class with the growth hypothesis on the limit. Own the finite-volume transfer theorem at that generality. Alternatively, retain the present definition only after adding and proving a target that every member of the full class admits a uniformly controlled approximating sequence. Do not assume every given approximation has that control.

**Repair test.** Independent Ising blocks `X_N = Σ_{i=1}^N σ_i/(√N log N)`, N ≥ 3, converge to δ₀ because their variance is `(log N)⁻² → 0`. Nevertheless, for every α > 2 their exponential α-moments are at least `2^{1−N} exp(N^{α/2}/(log N)^α) → ∞`. The limit has exponential α-moment 1. δ₀ also has a good constant approximation: this example does **not** prove the two existential classes differ; it proves that the missing equivalence/choice-of-approximation argument cannot be replaced by weak convergence alone. The repaired transfer contract must handle this distinction. Narrowing the class to fit a proof route does not meet the general-library contract.

## R02 (P2) — Source-conditioned current laws need positive normalizers

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:316`, and `packages/ConstructiveFieldTheoryPhi4/design/plan.json:734`: “P^{A∆B,∅} being the product of the normalised source-constrained current laws”.

**Claim.** A probability law obtained by normalizing source-constrained weights is used for arbitrary A, B and every nonnegative coupling, including disconnected and zero couplings.

**Witness.** Two sites, J = 0, A = {x,y}, B = ∅: `Σ_{∂n=A} w(n) = sinh 0 = 0`. Dividing by it produces total mass 0 under Lean's zero-inverse convention, not 1.

**Exact repair.** Define the probability law P^D only under `Z_D := Σ_{∂n=D} w(n) > 0`, and require `Z_{A∆B} > 0` for this probability corollary. Equivalently, require even source parity in each connected component of the graph of strictly positive couplings, and prove that equivalence. Keep the unnormalized switching identity for all A, B; it covers zero-normalizer cases. Add a disconnected/zero-coupling Check and propagate the qualification to probability-based proof routes in §3.5.

**Repair test.** The J = 0 instance is excluded from the probability corollary and remains the valid unnormalized identity 0 = 0. At J = 1, `Z_{xy} = sinh 1 > 0` and normalized mass is 1. For a singleton source the source set is impossible, independently of J. Source (3.7)–(3.9), `aizenman-duminilcopin-2021 line 500`, pp.11–12, does not remove the need to state this denominator hypothesis in a total-function interface.

## R03 (P2) — Stability alone does not define the reachability normalization

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:642`, and `packages/ConstructiveFieldTheoryPhi4/design/plan.json:1632`: “a set 𝒞 of single-site measures” and “each triple … is stable”. Compare the real nonnegative Σ in §7.1, line 621.

**Claim.** Every stable finite-volume law in a reachability scheme supplies a finite real block second moment and hence a rescaled random variable.

**Witness.** Take 𝒞 to contain the standard Cauchy law and J_n = 0. Every partition function is 1, but a sum of N independent standard Cauchy spins has scale N and infinite second moment.

**Exact repair.** Require every coordinate square to be integrable under each finite-volume Gibbs law of the scheme (or state directly the sufficient finite block second-moment condition). Specify `Σ_{n,m} < ∞`, retain Σ = 0 only with the stated zero-field convention, and name the normalization as a second moment when evenness is absent. Apply the same domain qualification wherever §7.1 forms expectations. Do not exclude Gaussian single-site laws by replacing this with admissibility alone.

**Repair test.** The Cauchy scheme now fails the moment hypothesis although Z = 1. Ising gives Σ = N at J = 0; a Gaussian of variance v gives Σ = Nv; δ₀ gives Σ = 0 and the zero field. All intended examples survive. Treating the divergent integral as Lean's real-integral junk value 0 would instead make a nonzero Cauchy system satisfy the zero-field convention and is not a repair.

## R04 (P2) — Continuum Green-kernel facts have two owners

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:17` and lines 669–675: “so no statement of this roadmap depends on that roadmap”, followed by the position-space kernel, its inverse Fourier transform, decay and massless formula in §7.4.

**Claim.** Defining covariance in Fourier space avoids consuming RelativisticQuantumFieldTheory's continuum kernel theory.

**Witness.** Open pull request **#1772**, `TauCetiRoadmap/RelativisticQuantumFieldTheory/README.md:4477`, §7.1, explicitly owns G_m as a function via the heat integral, its Fourier agreement, exterior decay, and the massless radial formula. It is not restricted to an opaque distribution.

**Exact repair.** Import those analytic kernel facts from RelativisticQuantumFieldTheory §7.1, with m > 0 or the stated d ≥ 3 massless domain, in Scope, Exact supplier contracts, §7.4's Needs and the plan. Keep ownership here of the probability law indexed by C_c, its block normalization and lattice reachability. Remove the claim of no dependency. Keep supply one-way: the RQFT comparison proposed in Downstream consumers can instead be a consequence here or in Part II; do not require the earlier supplier to consume this roadmap.

**Repair test.** Both kernel constructions give multiplier 1 at m = 1, ξ = 0, and `G_1(1) = e⁻¹/2` in d = 1. The separately owned random-field normalization gives `C_1(1_Q,1_Q) = 1 + e⁻²`. Importing the unnormalized kernel preserves that calculation. RQFT is at `merge-order/ORDER.txt:213`, earlier than the candidate position; this repair requires no upward edge. The previous review's tempered-functionals distinction no longer excludes the function-level overlap at the current head.

## R05 (P2) — The summit targets do not belong to this roadmap's completion

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:699`, line 711 and line 731; `packages/ConstructiveFieldTheoryPhi4/design/plan.json:1817` and line 1856: “The proof is the subject of ConstructiveFieldTheoryPhi4PartII.”

**Claim.** §§8.1–8.2 are theorem targets and summit statements of this roadmap, while another roadmap owns their proofs and the indispensable estimates.

**Witness.** Line 16 assigns current intersection estimates, improved tree bounds, infinite-volume infrared bounds and both summit proofs to Part II. The two theorem prerequisite lists contain only definitions and no route to Gaussianity.

**Exact repair.** Give each theorem one owner. For the stated foundational scope, move ownership of marginal triviality to ConstructiveFieldTheoryPhi4PartII: remove §§8.1–8.2 as this plan's theorem targets and present their full sourced statements as downstream goals. Make the Summary and future acceptance file end at the deep results actually owned here, including Gaussian-field reachability. If these remain headline acceptance theorems here, their missing proof infrastructure must instead be owned here in earlier layers; a later consumer cannot supply it back.

**Repair test.** A completion of Layers 0–7 then establishes the base's advertised results without falsely certifying either marginal-triviality proof. Part II consumes Layers 0–7 and owns the summit proof exactly once. This is an acceptance/ownership defect, not a claim that Theorem 1.2 is false, and the dependency gate does not detect it because the proof dependency is absent from the encoded edges.

## R06 (P3) — Refresh the pin claims and declaration locators

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:41` and line 61; `packages/ConstructiveFieldTheoryPhi4/design/plan.json:7`–8: “The pin is f6090c7095e1e56b3464c1daba5f24631f1290d2.”

**Claim.** The supplier contracts describe the libraries pinned for this review.

**Witness.** `lake-manifest.json:10` pins Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`; line 22 pins Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. The checked-out library HEADs agree.

**Exact repair.** Update both baseline hashes and refresh line locators against these pins. For example, `hasDerivAt_integral_of_dominated_loc_of_deriv_le` is at `Mathlib/Analysis/Calculus/ParametricIntegral.lean:569`, not 286; the Gaussian central-moment theorem is at `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147`, not 118. Use the declaration inventory below. No pin file is to be changed.

**Repair test.** The named APIs still exist with the required mathematical hypotheses at the actual pins; this is stale provenance/locator data, not a missing-supplier finding.

## R07 (P3) — The δ₀ Check forgets the zeroth correlation

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:403`, and the tests of plan target 4.1: “For ρ = δ₀ all limits vanish”.

**Claim.** Every multi-index correlation vanishes for δ₀.

**Witness.** A = 0 is allowed. Its monomial is the empty/zero-exponent product 1, so its finite-volume expectation and infinite-volume limit are both 1, not 0.

**Exact repair.** Say that correlations of positive total degree vanish and the zeroth correlation equals 1; update the corresponding plan Check. Tested on A = 0 and A = 2δ_x: the values are 1 and 0 respectively. This also agrees with Wick's n = 0 convention.

## R08 (P3) — The product-measure reflection Check omits fixed vertices

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:494`, and the tests of plan target 5.2: “reflection positivity is `|E f|² ≥ 0`”.

**Claim.** At J = 0 both vertex and edge reflection forms equal the square of the unconditional mean.

**Witness.** In d = 1, L = 2, take R(x) = −x, Ising spins, J = 0 and f(φ) = φ₀. R fixes 0, giving `E[f·conj(f∘R)] = 1` but `|Ef|² = 0`.

**Exact repair.** Restrict the unconditional formula to edge reflections. For vertex reflections use `E[|E(f | spins on the fixed vertices)|²] ≥ 0`, and include this fixed-spin Check. In the witness the corrected right side is 1. This is exactly the conditioning step at `peled-spinka-2017 line 1331`, Proposition 2.14, p.28.

## R09 (P3) — The Gaussian equality Check has an unremoved zero mode

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:505`, and the tests of plan target 5.3: “For a Lebesgue a-priori measure … Z(h) = Z(0)”.

**Claim.** A periodic Gaussian gradient model with unrestricted Lebesgue spins supplies a finite partition-function equality case.

**Witness.** For the two-vertex torus, J = 1, `∫∫ exp(−(a−b+u)²) da db = ∞` for every u: the common-translation coordinate has infinite volume. There is no normalized probability law on the stated carrier.

**Exact repair.** State this Check on the quotient by constant configurations or explicitly pin φ₀ = 0, using Lebesgue measure on the remaining coordinates and the Gaussian-gradient partition function. This is a separate example outside the admissible-probability a-priori setting. `peled-spinka-2017 line 1640`, p.33, explicitly makes this quotient/pinning qualification.

**Repair test.** With φ₀ = 0, the same example is `Z(u) = ∫ exp(−(x−u)²) dx = √π = Z(0) < ∞`. The equality is now informative rather than ∞ = ∞ (or a real-integral junk equality).

## R10 (P3) — The new action Check excludes other involutions

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:638`: “Only d = 1 and the reflections, where g = g⁻¹, fail to separate the two.”

**Claim.** In dimensions above one, only reflections fail to distinguish g from g⁻¹.

**Witness.** In W₂, g = −I is the half-turn, not a reflection in a hyperplane. Yet g = g⁻¹, so both candidate formulas agree for every f and φ.

**Exact repair.** Replace the final sentence with: “The two identities cannot be separated when g² = id; the quarter-turn and the selected f and φ separate them.” At g = −I, f = 1_{e₁}, φ = 1_{−e₁}, both sides of both conventions are 1. At the added quarter-turn the corrected and incorrect right sides remain 0 and 1. The original F01 repair remains valid.

## R11 (P3) — The PDE deferral points to a section that no longer owns the topic

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:18`: “PDE, stretch goals”.

**Claim.** PDE's stretch goals own stochastic quantisation and its Gibbs measure.

**Witness.** `TauCetiRoadmap/PDE/README.md:101`–110 on main assigns this stochastic programme to **PDE, Part II** and says PDE stops at deterministic theory. There is no current stretch-goals target supplying it.

**Exact repair.** Cite “PDE, Scope and ownership: the stochastic programme assigned to PDE, Part II” as a deferral. Do not add PDE Part II as a supplier. The corrected destination contains the two-dimensional stochastic quantisation equation, Wick renormalization and Gibbs measure verbatim as topics; no dependency of this roadmap changes. This is a deferral citation, hence P3, not an unowned prerequisite.

## R12 (P3) — The infinite-volume FKG consequence lacks its finite-volume dependency

**Location.** `packages/ConstructiveFieldTheoryPhi4/design/README.md:413`–415; `packages/ConstructiveFieldTheoryPhi4/design/plan.json:989`: “Griffiths I and II and the FKG inequality hold”.

**Claim.** Target 4.2's listed prerequisites suffice for all its announced inequalities.

**Witness.** Its prerequisite closure through 3.7, 3.5 and 4.1 never includes §3.3. Griffiths' inequalities for spin monomials do not state association for arbitrary increasing cylinder functions.

**Exact repair.** Add §3.3 to §4.2's Needs and `target:3.3` to its plan prerequisites. For continuous polynomially bounded cylinder functions, use finite-volume FKG and the already specified uniform-integrability limit. On one Ising coordinate F = G = φ, the inherited inequality is 1 ≥ 0; at independent distinct coordinates it is 0 ≥ 0. This adds an earlier-layer edge and no cycle.

## Verified sound

**Scope of this pass.** I read all 749 README lines, all 38 plan entries, the 13-entry manifest, the previous review and repair report, and the supplied package index and overlap report. The README has 36 numbered subsections in nine layers, 36 Needs lines, and at least three listed Checks in each subsection. All definitions have API lists; each layer has Examples and Dependencies. The plan has 121 tests. The previous review's numerical rows are inherited only for unchanged material; its prose-only assurances are not used as evidence. The sampled targets, every changed passage and the targets of the findings were re-examined here.

**Principles and form.** The finite-volume theory treats arbitrary finite sets and signed couplings for existence, and general ferromagnetic couplings for the inequalities; Gaussian stability is not silently replaced by admissibility. No algorithm, copied source passage, process identifier, HTML anchor, local-machine path, or Lean option was found in the README. There is no existing ConstructiveFieldTheoryPhi4 folder on main to re-plan. The narrow GS definition and summit ownership are the principle failures described above. No supplier gap is declared. Formula/code spans are mathematical notation; this design makes no unsupported claim that a newly named Lean declaration already exists.

**Headline inventory and Lean stage.** The Summary advertises: finite-volume Gibbs existence and moments (§§1.1–1.5); the Ising-block approximation of every φ⁴ measure (§2.3); Griffiths, FKG, switching, Lebowitz/Gaussian/Simon–Lieb, reflection and uniform-moment results (Layer 3); the free-boundary state and its two-point theory (Layer 4); reflection positivity, Gaussian domination, the infrared bound and Ising long-range order (Layer 5); Gaussian-kernel realization and Wick's characterization (Layer 6); structure and Gaussian-free-field reachability (Layer 7); and the two marginal-triviality statements (Layer 8, R05).

This is a **design**, not a package. No `Suggested.lean` exists among its files. Therefore absent package signatures, namespace/import layout, declaration docstrings, section-variable retention, and padding are not findings at this stage. There are zero sorried declarations to probe. Elaboration and mechanical `#check @name` comparison: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run and no passing build is claimed. Native real measures, finite-dimensional Gaussian laws, finite products, C_c and IsGaussianProcess make many finite-volume and Gaussian-process headlines statable with simple genuine definitions; they must not later be replaced by free predicates or boundary-case padding. This design review does not certify a future Lean file.

**Adversarial table.** Values below were recomputed; “inherited” rows additionally identify where an unchanged round-one numerical check remains applicable. Inputs excluded by explicit hypotheses are negative controls, not false instances of the theorem. Non-numerical ownership/metadata defects have their exact file witnesses above; the table tests their mathematical interfaces where applicable.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Hamiltonian convention, §§1.1–1.3 | Two Ising sites, J = 1 | Z = cosh 1; correlation = tanh 1 = 0.761594; ordered-pair double counting gives tanh 2 = 0.964028 | Correct factor 1/2 in ordered sum | None |
| §1.2 integrability | One spin, ρ = δ₂, arbitrary c,h | Integral of exp(hφ+cφ²) = exp(2h+4c), finite; odd first moment = 2 | Integrability holds; evenness is necessary for spin flip | None |
| §1.2 symmetries | Chain 0–1–2; J₀₁ = J₁₂ = 1, then 0 and 1 | Equal-bond edge correlations 0.761594 = 0.761594; unequal-bond ones 0 versus 0.761594 | Automorphism hypothesis discriminates | None |
| §1.5 repaired Gaussian stability | b = −1; J = ±1,2,−3 | Determinants 3,3,0,−5; for ±1, covariance off diagonal ±1/3 and diagonal 2/3 | Both signs and singular boundary correct | F02 repaired |
| §2.1 block sign convention | q = (1,−1), K = log 3 | ε = 1/10; fourth moment = 1.6; three times variance squared = 0.48 | Mixed signs break the intended transfer | Nonnegative-weight correction justified |
| §2.2 membership and growth | δ₀; N(0,1); ε = 1/4 sparse sign law | δ₀ exponential moment = 1; Gaussian exponential α-moment = ∞ for α > 2; sparse law fourth = 1/4 > 3/16 | Stated exclusions correct | Preserve these controls |
| §2.2 approximation generality | X_N = Σσ/(√N log N) | Var = 1/log²N → 0; exponential α-moment ≥ exp((1−N)log2 + N^{α/2}/log^αN) → ∞; limit's moment = 1 | Weak limit and uniform approximant growth differ | R01 |
| §2.3 quartic block limit | c = (12λ)^(−1/4), g_N = 1+2bc²/√N | N(g_N−1)m²/2 = bφ²; Nm⁴/12 = φ⁴/(12c⁴) = λφ⁴ | Scaling and sign agree; unchanged numerical round-one row applies | None |
| §3.2 coupling and volume | Ising chain J = 1; remove middle vertex | Endpoint correlation 0.580026 versus 0; derivative of tanh J is 1−tanh²J = 0.419974 | Monotonicity correct | None |
| §3.2 evenness control | ρ = (2δ₋₁+δ₁)/3, J rises from 0 to ∞ | One-site mean −1/3; coupled mean −3/(5+4e^(−2J)) → −3/5 | Monotonicity fails without evenness | None |
| §3.3 FKG | Two Bernoulli {0,1} spins; e^J = 3 | Cov(n₁,n₂) = (3−1)/(3+3)² = 1/18; at J = 0 it is 0 | Inequality and independence boundary correct | None |
| §3.4 switching | Two sites, A = B = {x,y}, J = 1 | Left = sinh²1 = 1.381098; right = cosh²1−1 = 1.381098 | Unnormalized identity correct | None |
| §3.4 conditioned current law | J = 0, D = {x,y}; singleton D | Z_D = sinh0 = 0; normalized measure mass 0 versus required 1; singleton has no currents | Missing positivity | R02 |
| §3.5 Lebowitz and Gaussian | One Ising spin; N(0,v); sparse ε = 1/4 | 1 ≤ 3; 3v² = 3v²; 1/4 > 3/16 outside the class | Correct class boundary and sharp Gaussian comparison | None |
| §3.5 Simon–Lieb; repeated sites | Chain J = 1, Λ = {0}; (x,x,y,y) | 0.580026 ≤ 0.761594; 1 ≤ 1+2tanh²1 = 2.160051 | Both formulas hold | None |
| §3.7 quartic moments | One site, λ = 1,b = 0,J = 0 | 4Eφ⁴ = 1; bound M = 1/2; exact Eφ² = Γ(3/4)/Γ(1/4) ≈ 0.337989 | Identity and bound compatible | None |
| §3.7 Newman bound | Ising a = 2; sparse ε = 1/4 | Ising cosh2 = 3.762196 ≤ e² = 7.389056; sparse 1.690549 > e^(1/2) = 1.648721 | Correct positive and negative controls | None |
| §4.1 monotone exhaustion | d = 1, J = 1, x = 2; boxes or [−n,2n] | Once sites are included, both exhaustions give tanh²1 = 0.580026 | Exhaustion independence holds | None |
| §4.1 zero-order Check | ρ = δ₀, A = 0 and A = 2δ_x | Zeroth correlation = 1, claimed 0; positive degree = 0 | Check overstates vanishing | R07 |
| §4.2 state and association | d = 1 Ising J = 1; F = G = φ₀ | P(same spin) = (1+tanh1)/2 = 0.880797; E(FG) = 1 ≥ EF·EG = 0 | Numerical result correct; association input missing from edges | R12 |
| §4.3 susceptibility | d = 1, J = 1; δ₀; zero coupling | 1+2t/(1−t) = e² = 7.389056; δ₀ gives χ = 0; J = 0 gives χ = Eφ² | β_c = ∞ for chain/zero cases; nonnegative sum convention correct | None |
| §4.3 small coupling bound | d = 1, J = 1/4 | Exact χ = e^(1/2) = 1.648721 ≤ 1/(1−2J) = 2 | Simon–Lieb consequence holds in its strict domain | None |
| §4.4 axis monotonicity | d = 1, J = 1; d = 2 formal small t | S(0),S(1),S(2) = 1,0.761594,0.580026; leading coefficients t,2t²,t² for (1,0),(1,1),(2,0) | Ordering and both norm comparisons agree | None |
| §5.2 edge reflection | L = 1,d = 1,J = 1 | Matrix eigenvalues e²+e⁻² > 0 and e²−e⁻² > 0; second eigenvalue reverses sign at J = −1 | Correct positivity boundary | None |
| §5.2 chessboard | Two sites, J = 0, f₀ = 1_{+}, f₁ = 1 | Left = (1/2)² = 1/4; right = E(1_{+}⊗1_{+})·1 = 1/4 | Exponent and product normalization correct | None |
| §5.2 vertex reflection | L = 2,d = 1,J = 0,f = σ₀ | Reflection form = 1; unconditional mean square = 0; conditional mean square = 1 | Check confuses shared and disjoint halves | R08 |
| §5.3 Gaussian equality | Two-site gradient Gaussian, J = 1 | Unpinned Z(u) = ∞ for every u; pinned Z(u) = √π = Z(0) | Zero mode must be removed | R09 |
| §5.4 infrared normalization | L = 1,d = 1,J = 3/8 | E(π)Ŝ(π) = 1.459404; source's printed RHS = 2/3; corrected RHS = 8/3 | README constant correct | Source error retained |
| §5.5 long-range order | d = 3, J = 1; d = 1,2 | I₃ ≈ 0.2527, lower bound ≈ 0.7473; near zero integral has radial power r^(d−3), divergent for d ≤ 2 | Dimension and factor agree with inherited round-one calculation | None |
| §6.2 Schwinger functions and decay | Deterministic h(x) = e^(−|x|²); h = 1 | At x = −y = re₁, S₂ = e^(−2r²), bound e^(−|x−y|²/2) = e^(−2r²); constant field gives 1, not 0 at infinity | Decay does not imply centering | None |
| §6.2 white noise | Disjoint supports versus f = g nonzero | Off-diagonal tests give covariance 0; diagonal test gives ∫f² > 0; any locally integrable candidate vanishing off diagonal gives 0 | White noise has no function kernel | None |
| §6.3 Gaussian kernel | [[1,r],[r,1]], r = 1,2; zero kernel | Var(X₁−X₂) = 2−2r: 0 at r = 1, −2 at r = 2; zero kernel gives Dirac zero | Semidefinite singular case allowed, negative case excluded | None |
| §6.4 Wick equivalence | One centered Gaussian variance 1; fair sign | Gaussian second/fourth = 1,3; sign second/fourth = 1,1 versus Wick's 3 | Both directions discriminated | None |
| §6.4 determinacy and n = 0 | Y with Wick moments; zero slots | E cosh(aY) = Σ(a²v/2)^n/n! = exp(a²v/2); M₀ = 1 = empty pairing product | Converse supplies its own exponential moment, not a circular assumption | None |
| §7.1 repaired action | Quarter-turn; inverse form; identity | Correct formula 0 = 0, wrong RHS 1; equivalent form 1 = 1; id gives T_f = T_f | Repair correct | F01 repaired |
| §7.1 new exclusivity sentence | Half-turn −I in W₂; f = 1_{e₁},φ = 1_{−e₁} | g e₁ = g⁻¹e₁ = −e₁; both candidate right sides = 1 | A non-reflection also fails to separate | R10 |
| §7.2 normalization | J = 0; N spins: Ising, Gaussian v, Cauchy, δ₀ | Z = 1 in all four; block second moments N,Nv,∞,0 respectively | Stability does not imply finite normalization | R03 |
| §7.3 non-even reachable field | Bernoulli {0,1}, J = 0, N = (2L+1)^d | Block second moment = (N²+N)/4; mean normalized test → 2^(−d)∫f; variance → 0 | Asymmetry is allowed unless evenness is assumed | None |
| §7.3 strict second-moment bound | Rare-spike Check p = N⁻²,a² = 1/p | Single-site second moment 2−p; probability of any spike in O(N) sampled sites = O(1/N); lattice test variance → 2^(−d)∫f², limit variance → 2^(−d−1)∫f² | Strict inequality is real; no moment convergence claimed | None |
| §7.4 kernel and block normalization | d = 1,m = 1; m ↓ 0 | C₁(1_Q,1_Q) = 2−(1−e⁻²) = 1.135335; C_m = 2/m−4/3+O(m) → ∞ | Fourier and massless exclusion correct; kernel duplicated | R04 |
| §7.4 reachability scaling | Gaussian b_n = −(d+m²/(2L²)), J = 1 | Precision symbol = m²/L²+E(p); L²E(q/L) → |q|²; p = 2πξ/L gives 4π²|ξ|²+m² | Mass and 2π conventions match | None |
| §7.4 d = 4 kernel | G₀(x) = 1/(4π²|x|²) | Ball integral = (2π²)/(4π²)∫₀^ε r dr = ε²/4; value → 0 as |x| → ∞ | Local integrability and decay correct | Kernel facts imported under R04 |
| §§8.1–8.2 controls and ownership | d = 1 telegraph; d = 4 GFF; white noise | Telegraph S₂ = e^(−c|u−v|)/κ → 0, with nonzero finite variance and bounded observables; GFF kernel decays as |x|⁻²; white-noise kernel would give contradictory 0 and ∫f² | Controls agree with source theorem; they do not provide its proof | R05 |

For unchanged sections not expanded in this table, the prior numerical rows used are: §0.1's Dirac/Gaussian/Cauchy and superquadratic-density tests; §0.2's Gamma values and scaling Jacobian; §1.1's three-spin partition function; §1.3's covariance derivative; §1.4's escaping-mass counterexample; §2.1's three-point block and representation; §3.1's parity/duplication and sign tests; §3.6's reflected chain and coefficient calculations; §§5.1 and 5.3's two- and four-site Fourier/second-derivative calculations; and §6.1's failure of linearity for |∫f|. These are the computed rows in `packages/ConstructiveFieldTheoryPhi4/reports/REV-DESIGN-ConstructiveFieldTheoryPhi4.md`, not its blanket “everything else” conclusion. I read the corresponding current passages and checked that the repairs had not changed them. The inherited δ₀, normalization, pin and ownership assurances are explicitly superseded by this report.

**Sources: all fifteen seeded targets revisited.** Page numbers below refer to the recorded preprint/version, not an assumed published pagination. Every referenced work is present under its existing manifest key: six readable texts and seven settled uncertified works. No additional source was fetched, no key duplicated, and no request for a settled text was made. No extra locator is marked unverified in the design files.

| Sampled target | Locator opened | Support and limits |
|---|---|---|
| 1.2 | `aizenman-duminilcopin-2021 line 230`, (1.17), p.5; `sokal-1982 line 405`, items (a)–(b), p.327 | Gibbs formula and lattice/spin symmetries located. These specialize to Ising/φ⁴; the README's arbitrary admissible-measure result follows from its explicit §1.1 domination and change-of-variables argument, rather than being the literal source theorem. |
| 2.2 | `aizenman-duminilcopin-2021 line 363`, Definition 2.1, pp.8–9; line 384, (2.2) | Nonnegative-weight repair is justified by the sign counterexample. Uniform growth along approximants is not the condition printed there: R01. |
| 3.2 | `peled-spinka-2017 line 519`, after Theorem 2.3, p.13; `sokal-1982 line 400`, p.327 | Derivative/correlation identity and volume monotonicity found. PS is O(1)/O(2), Sokal φ⁴; the general even-measure extension uses the roadmap's §3.1 duplication proof. |
| 3.3 | `sokal-1982 line 423`, item (h), (2.25), p.327 | Increasing-function FKG located, but its equation is missing from the extraction. General admissible non-even ρ is supported by the roadmap's log-supermodular density and pinned finite-lattice FKG route, not certified from the missing display. |
| 3.5 | `aizenman-duminilcopin-2021 line 520`, (3.11), p.12; line 1314, Lemma 5.7 and line 1342 footnote 5, p.30; `sokal-1982 line 419`, pp.327–328 | Four-point identity and Simon–Lieb bound found; footnote explicitly permits the finite-Λ factor. Higher Gaussian inequalities are derived by switching/induction; Sokal's displayed formulas cannot be read in this extraction. §7's cited lines 1996–2002 concern spin-balanced transfer of diagram bounds, not a separately numbered theorem containing all three inequalities. |
| 3.7 | `sokal-1982 line 434`, item (j), p.328; line 846, §3.1, pp.342–343 | Exponential bound and integration-by-parts route located; displays absent. The README's exact 4λ,2b factors and quadratic-root bound were recomputed independently above. |
| 4.1 | `sokal-1982 line 400`, p.327 and line 455, p.329; `peled-spinka-2017 line 527`, p.13; `aizenman-duminilcopin-2021 line 231`, p.5 | Monotone free-boundary limits and exhaustion independence supported. The zero multi-index contradicts the README Check, not the source: R07. |
| 4.3 | `aizenman-duminilcopin-2021 line 1017`, (5.1), p.23; line 1247, (5.23); `sokal-1982 line 470`, p.329 and line 574, Proposition 2.1, p.333 | Two-point notation, susceptibility and critical behavior located. Sokal Proposition 2.1 varies the quadratic mass parameter; it is not literally the general β-supremum definition in this roadmap. That definition and its stated monotonicity follow from §4.1; no equality with a separately defined magnetization threshold is claimed. |
| 4.4 | `aizenman-duminilcopin-2021 line 1040`, Proposition 5.1, (5.3)–(5.4), pp.23–24 | Both norm comparisons and their direction checked. Source assumes its growth condition (2.2); the README explicitly derives its admissible-measure version from finite-volume §3.6 and exhaustion. |
| 5.2 | `peled-spinka-2017 line 1328`, Proposition 2.14, p.28; line 1385, Proposition 2.15, p.29; line 1490, Proposition 2.16, p.30 | Vertex conditional independence, positive-definite edge kernel and chessboard exponent verified. The source's abstract setup uses a finite a-priori measure and bounded interaction; the scalar unbounded-spin application needs the admissible Gaussian tilt/truncation justified by §§0.1 and 5.3. Its fixed-vertex conditioning refutes the Check: R08. |
| 6.2 | `aizenman-duminilcopin-2021 line 59`, (1.5)–(1.6), p.2; line 126, (1.10), p.3 | Moment-kernel convention and decay condition found. The roadmap deliberately makes “function” locally integrable and equality almost everywhere; the countable ε = 1/k null-set removal gives the stated representative equivalence. |
| 6.4 | `aizenman-duminilcopin-2021 line 81`, (1.7), p.2 | Pairing formula verified. Its all-moments converse is additionally justified by the exp/cosh determinacy argument and StandardDistributions §5.3, not merely by the introductory formula. |
| 7.3 | `aizenman-duminilcopin-2021 line 172`, Definition 1.1 discussion and footnote 2, p.4; `sokal-1982 line 710`, Lemma 2.2, p.337 | ADC uses local integrability to build a distribution-valued field; this roadmap's weaker coordinate-law field follows from its named arbitrary-index extension and closed linearity constraints. Sokal's displayed hypotheses are unreadable. The finite-second-moment issue arises earlier, in the general schemes: R03. |
| 7.4 | `sokal-1982 line 620`, §2.3, pp.334–337; `frohlich-1982 line 266`, preprint p.13; `simon-2020-twelve-tales line 954`, pp.23–24, (3.8) | Gaussian lattice/continuum covariance relationship supported. None of the readable passages states this exact C_c/block-normalized, all-dimension reachability theorem. Its lattice Fourier derivation is checked above; missing scanned formulas and the uncertified book prevent certifying it as a verbatim source theorem. Analytic ownership must be repaired under R04. |
| 8.1 | `aizenman-duminilcopin-2021 line 190`, Theorem 1.2, p.5, with (1.10), p.3; lines 122–128; `frohlich-1982 line 112`, preprint p.5 | d = 4 Gaussianity and the decay hypothesis are exactly located. The d > 4 result is explicitly reported by ADC; Fröhlich's main display is absent, so its exact formula is not independently certified. Statement/proof ownership remains R05. |

Also revisited: ADC Definition 3.2/Lemma 3.3 and (3.7)–(3.9), pp.11–12; Section 7, Theorem 7.1 and Proposition 7.2 at `aizenman-duminilcopin-2021 line 2006` and line 2014, p.45, including β ≤ β_c and L ≤ ξ in the quantitative estimates; PS's quotient/pinning discussion at line 1640, p.33; Simon's block-spin discussion at lines 1011–1030, p.25; and Duminil-Copin Corollary 1.9 at line 549, p.14. The quantitative GS estimate is uniform in the model; its hypotheses and the limit passage must be carried by the roadmap that actually proves marginal triviality.

**Current suppliers and overlap.** The reference checkout is main `4ec889e8f0480e2cdb21a524eb76e48215c9ad94`. I used the roadmap grep/show tools and the supplied overlap data, not remembered head contents.

- `TauCetiRoadmap/StochasticCalculus/README.md:879`, §1.1 on main, contains the arbitrary-index standard-Borel projective-limit statement at lines 888–891. It supplies precisely the product-σ-algebra probability law consumed here. Its Brownian/Chentsov work does not own an arbitrary PSD-kernel Gaussian realization.
- `TauCetiRoadmap/StandardDistributions/README.md:577`, §5.3 on main, has the centered PSD-covariance Wick–Isserlis statement at line 605. The #1187 head retains this numbering and content. No open-only revision dependency is needed.
- `TauCetiRoadmap/OperatorAlgebraDynamics/README.md:3851`, D9 on main, owns quantum spin systems/thermodynamic limits, as deferred. PDE's changed deferral is R11. RQFT's current function-level overlap is R04.
- Closest heads read: MathematicalStatisticsFoundations **#2111** (finite-sample inference), RandomMatrices **#1971** (matrix laws and moments), RelativisticQuantumFieldTheory **#1772**, DysonBrownianMotion **#2118** (finite-dimensional matrix/particle dynamics), and StandardDistributions **#1187**. RandomMatrices §2.5, `TauCetiRoadmap/RandomMatrices/README.md:560`, mentions Gaussian integration by parts/Wick, but this roadmap already imports the general multivariate moments from the earlier StandardDistributions and owns a random-field characterization, not a second finite-vector formula.
- Object searches covered Gaussian processes/kernels, Schwinger functions, Griffiths–Simon, lattice Ising measures, random currents, FKG, reflection positivity, Wick, and extension of finite-dimensional laws across main, accessible open heads and the board checkout. DenseGraphLimits' reflection positivity concerns graph parameters, not spin measures. No competing lattice-Gibbs/current owner was found. Generic Gaussian-kernel realization remains a reasonable ownership choice here, subject to importing extension/multivariate moments.
- The three entries in the supplied board-package index were checked at their recorded heads. AnalyticNumberTheory and LogicAndDefinabilityInNumberTheory have no matching field-theory objects. LawrenceVenkateshMethod has only `packages/LawrenceVenkateshMethod/design/README.md` at that head (the package-level README lookup returns 404); its design identifies arithmetic owners and contains no matching object. No package was declared missing without checking the index.
- The supplied overlap report has no conflicting head, dropped cited id, or open-revision-only id. Explicit StandardDistributions head inspection confirms the relevant retained id. The `roadmaps overlaps ConstructiveFieldTheoryPhi4` command itself reports no such roadmap on main/in an open roadmap pull request, as expected for this board design; it does not supersede the supplied overlap report. Ownership against the accessible open heads was checked and did find R04; no assertion is made about unavailable private work.

**Dependency check, run without edits.**

    candidate: ConstructiveFieldTheoryPhi4 is not in the merge order yet; checked as if placed after SobolevMapsBetweenManifolds (the intake inserts it when its design is accepted)
    depcheck: 224 roadmaps, 2037 edges, 0 problem(s)

There is no UPWARD or CYCLE line. StochasticCalculus and StandardDistributions are now on main. The candidate placement differs from the previous review's output because the reference state has changed; absence from ORDER is not a finding. All 36 Needs lines and both supplier contracts were read. The mechanical success does not establish omitted edges (R12) or statement/proof ownership (R05).

**Pinned declaration inventory.** These are the actual files opened, relative to the two pinned library roots. Names remain available. Definition bodies and relevant theorem binders were read; this is source inspection, not elaboration. The native Gaussian process has finite-dimensional Gaussian laws, with no centering field. Projectivity says restriction pushforwards agree, not that a limit already exists. C_c bundles continuity and compact support, with no distribution-valued sample-path assertion. ProbabilityMeasure bundles a measure with the probability property. Measure.map requires measurability to express the intended pushforward; withDensity uses an ℝ≥0∞ density. All finite products and projections used here have the required Borel measurability. The positive-definiteness hypotheses of multivariate Gaussian covariance/characteristic-function statements are retained.

| Declaration(s) | File and line at the actual pin |
|---|---|
| `MeasureTheory.Measure.IsNegInvariant` | `Mathlib/MeasureTheory/Group/Measure.lean:310` |
| `ProbabilityTheory.integrableExpSet` | `Mathlib/Probability/Moments/IntegrableExpMul.lean:112` |
| `MeasureTheory.Measure.pi` | `Mathlib/MeasureTheory/Constructions/Pi.lean:211` |
| `MeasureTheory.Measure.withDensity` | `Mathlib/MeasureTheory/Measure/WithDensity.lean:39` |
| `MeasureTheory.Measure.map` | `Mathlib/MeasureTheory/Measure/Map.lean:96` |
| `MeasureTheory.Measure.infinitePi` | `Mathlib/Probability/ProductMeasure.lean:354` |
| `MeasureTheory.IsProjectiveMeasureFamily`, `IsProjectiveLimit`, `IsProjectiveLimit.unique` | `Mathlib/MeasureTheory/Constructions/Projective.lean:45`, :115, :150 |
| `ProbabilityTheory.map_eq_iff_forall_finset_map_restrict_eq` | `Mathlib/Probability/Process/FiniteDimensionalLaws.lean:61` |
| `ProbabilityTheory.IsGaussianProcess` | `Mathlib/Probability/Distributions/Gaussian/IsGaussianProcess/Def.lean:30` |
| `ProbabilityTheory.HasGaussianLaw` | `Mathlib/Probability/Distributions/Gaussian/HasGaussianLaw/Def.lean:33` |
| `ProbabilityTheory.IsGaussian` | `Mathlib/Probability/Distributions/Gaussian/Basic.lean:45` |
| `ProbabilityTheory.multivariateGaussian`, `charFun_multivariateGaussian`, `measurePreserving_restrict₂_multivariateGaussian` | `Mathlib/Probability/Distributions/Gaussian/Multivariate.lean:166`, :233, :241 |
| `ProbabilityTheory.BrownianReal.projectiveFamily` | `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:81` |
| `MeasureTheory.Measure.ext_of_charFun` | `Mathlib/MeasureTheory/Measure/CharacteristicFunction/Basic.lean:257` |
| `MeasureTheory.ProbabilityMeasure.tendsto_iff_tendsto_charFun` | `Mathlib/MeasureTheory/Measure/LevyConvergence.lean:214` |
| `ProbabilityTheory.tendstoInDistribution_iff_tendstoInDistribution_inner` | `Mathlib/Probability/CramerWold.lean:39` |
| `MeasureTheory.ProbabilityMeasure`, `ProbabilityMeasure.tendsto_iff_forall_integral_tendsto` | `Mathlib/MeasureTheory/Measure/ProbabilityMeasure.lean:103`, :367 |
| `isCompact_closure_of_isTightMeasureSet` | `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530` |
| `fkg` | `Mathlib/Combinatorics/SetFamily/FourFunctions.lean:370` |
| `CompactlySupportedContinuousMap` | `Mathlib/Topology/ContinuousMap/CompactlySupported.lean:41` |
| `EuclideanSpace` | `Mathlib/Analysis/InnerProductSpace/PiL2.lean:114` |
| `Real.fourier_eq` and the expanded exponential convention | `Mathlib/Analysis/Fourier/FourierTransform.lean:434`, :437 |
| `ZMod.dft` | `Mathlib/Analysis/Fourier/ZMod.lean:87` |
| `ae_eq_zero_of_integral_contDiff_smul_eq_zero` | `Mathlib/Analysis/Distribution/AEEqOfIntegralContDiff.lean:186` |
| `integral_gaussian` | `Mathlib/Analysis/SpecialFunctions/Gaussian/GaussianIntegral.lean:210` |
| `Real.Gamma` | `Mathlib/Analysis/SpecialFunctions/Gamma/Basic.lean:402` |
| `hasDerivAt_integral_of_dominated_loc_of_deriv_le` | `Mathlib/Analysis/Calculus/ParametricIntegral.lean:569` |
| `ProbabilityTheory.gaussianReal` | `Mathlib/Probability/Distributions/Gaussian/Real.lean:220` |
| `TauCeti.Measure.exists_isProjectiveLimit_of_countable` | `TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:165` |
| `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_exists_integrable_exp` | `TauCeti/Probability/Moments/Determinacy.lean:246` |
| `TauCeti.Probability.centralMoment_id_two_mul_gaussianReal` | `TauCeti/Probability/Distributions/Gaussian/Moments.lean:147` |

The countable extension requires standard-Borel coordinates and probability finite marginals; ℤ^d meets the index condition. Determinacy requires finite measures and a positive exponential moment for each, supplied in §4.2 and derived in §6.4. Finite-dimensional real inner-product/Borel hypotheses hold for the Cramér–Wold uses. The fkg theorem is for a finite distributive lattice with nonnegative log-supermodular weights and nonnegative monotone functions; shifting bounded increasing functions and finite approximation are genuine extra steps here. Library object searches did not find the lattice interacting measure/current/GS objects. Mathlib's Brownian family documentation at `Mathlib/Probability/BrownianMotion/GaussianProjectiveFamily.lean:24` still notes the absence of a general Kolmogorov extension theorem; special product and trajectory constructions are not such a theorem. No duplicate finite-product, Gaussian distribution, characteristic-function or moment-determinacy construction is needed here.

## Not verifiable

- `griffiths-simon-1973`, `aizenman-1982`, `frohlich-simon-spencer-1976`, `friedli-velenik-2017`, `glimm-jaffe-1987`, `fernandez-frohlich-sokal-1992`, and `simon-1974` are settled uncertified entries. Their full texts, precise primary proof hypotheses and book/chapter claims were not verified. They were not requested again and are not new missing-reference requests.
- `frohlich-1982 line 103`–115 and line 266–269: the cached extraction omits the main displayed bounds and covariance formula. The surrounding prose was read; it cannot certify the missing constants or exact theorem generality.
- `sokal-1982 line 414`–444, line 470, line 574, line 710–721 and line 846–853: important displays are absent. This affects direct verification of (2.20)–(2.30), susceptibility/mass-renormalizability formulas, Lemma 2.2's hypotheses and the integration-by-parts display. Independent calculations do not repair source readability.
- The extraction of `peled-spinka-2017 line 1325` and line 1382 loses or omits conjugation while allowing complex f. Its proof ends with a squared modulus. The README's conjugated form is mathematically right; whether the PDF has a bar cannot be settled from this extraction, so no new printed-source erratum is asserted for that issue.
- The exact block-normalized general reachability theorem of §7.4 is not literally present in the readable cited passages. Its Fourier scaling was checked as a derived result, with the kernel ownership problem reported separately.
- Lean elaboration, `#check` binder verification and one-tactic execution are unavailable in this design lane. There is no acceptance file to inspect or run; this report is not a package-build certificate.

## Source issues

- **Error** in aizenman-duminilcopin-2021 at (5.9), preprint p.24: the source says the infrared constant is 1/(2|J|β) with |J| the coupling row sum; it should be 1/(βJ) for nearest-neighbour per-bond J and the displayed Laplacian symbol; affects a stated result.
- **Error** in aizenman-duminilcopin-2021 at Definition 2.1(1), preprint p.8, and the sampling weights in §7.1, p.45: the source says block coefficients may have arbitrary signs and later uses their products as probability weights; it should require a common sign, chosen nonnegative, for the ferromagnetic block-transfer arguments; affects a stated result.
