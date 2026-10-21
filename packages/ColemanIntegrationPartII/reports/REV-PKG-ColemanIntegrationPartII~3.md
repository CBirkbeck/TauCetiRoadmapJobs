<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/96#issuecomment-6309467647 -->
Review (codex) of c2849a1

Verdict: accepted

1. **F01** (P3) Attribute the Jacobian differential comparison to its local target

   **Location:** `packages/ColemanIntegrationPartII/README.md:691`: “Use the supplied Abel–Jacobi differential identification”.

   **Claim:** The proof sketch treats the holomorphic-differential comparison as supplied, although §4.0e explicitly includes its construction in `Curve.jacobianIntegrationBridge` at line 681.

   **Witness:** `TauCetiRoadmap/JacobianChallenge/README.md:305` supplies the Picard tangent comparison; `:449` supplies Abel–Jacobi's universal property. Neither passage states the asserted pullback identification of holomorphic differentials. The local target at package line 681 already owns it.

   **Exact repair:** Replace the quoted instruction with: “Construct this subsection's Abel–Jacobi differential identification from the Jacobian tangent comparison and curve duality, then apply §4.0c naturality.” Name JacobianChallenge Layer B's duality alongside Layers D–F in this subsection's Needs line if using that proof. Retain the identification as part of `jacobianIntegrationBridge`. This corrects the attribution, without adding a prerequisite gap or changing the theorem's scope.

One non-blocking attribution correction (P3); no P1 or P2 findings. No conditional supplier gaps. This is a review of the mathematical plan and representative signatures, not certification of completed proofs or Lean elaboration.

## Previous findings and repairs

The specified `packages/ColemanIntegrationPartII/reports/REV-PKG-ColemanIntegrationPartII~2.md` is absent. Consequently I cannot compare its original wording or establish whether the repair report lists every original finding. I independently checked both findings recorded in `packages/ColemanIntegrationPartII/reports/FIX-PKG-ColemanIntegrationPartII~3.md`; neither is marked not actionable.

| Previous finding | Repaired passage | Independent evidence and result |
| --- | --- | --- |
| F01: ownership of formal calculus and point completions | `packages/ColemanIntegrationPartII/README.md:11`: “AlgebraicCurves Layers 5 and 9 own general DVR completions, point expansions, traced geometric residues and the proper residue theorem.” | **Repaired.** The detailed contracts at lines 54–60 match `TauCetiRoadmap/AlgebraicCurves/README.md:643`, `:887`, `:900` and `TauCetiRoadmap/FormalLaurentPuiseux/README.md:114`, `:142`. The Needs lines at 206, 230, 278 and 298 import these constructions. ColemanIntegration L0.11, line 407, supplies `annulusResidue_laurentSeries` for convergent germs with finite negative part. Analytic finite-map transport and logarithmic extensions remain local targets. |
| F02: characteristic-two negative control | `packages/ColemanIntegrationPartII/README.md:238`: “Over ZMod 2, F=(single 2 1,0) represents z², has `differential F = 0`, and differs from every scalar pair (single 0 c,0)” | **Repaired mathematically and in the written example.** `packages/ColemanIntegrationPartII/Suggested.lean:94` and `:105` contain the zero-derivative assertion and coefficient-2 proof of non-scalarity, without admission. At the Mathlib pin, `LaurentSeries.hasseDeriv_single` computes the derivative as 2z, and `HahnSeries.coeff_single_same`/`coeff_single_of_ne` distinguish z² from a scalar. Elaboration remains unavailable. |

## Verified sound

### Coverage and principles

Read all four package files: 1221 README lines, 250 Lean lines, metadata and the six-entry source manifest. Read the repair report. Reviewed all 45 numbered README subsections, their APIs, Checks and 45 Needs lines, plus the conventions and downstream paragraph. The adversarial tables below include all subsection targets and all 14 Lean theorem signatures.

The extension boundary is explicit: ColemanIntegration supplies good-reduction integration and analytic logarithmic rings; Part II adds arbitrary-reduction natural integration, harmonic realization and indices. Formal residue calculus and point completions are imported. The arbitrary-ℂ_p abelian logarithm is distinguished from extending points of a variety defined over a finite p-adic field. No route-specific prime restriction, re-planning of the base roadmap, computational algorithm, source passage copied into the package, sorry'd data, or `set_option` was found. Division by 2 and 3 is in characteristic-zero fields, including ℚ₂ and ℚ₃. No suspicious instruction in the reviewed material was acted on.

The order separates the auxiliary pairing from harmonic identification, and proves natural reciprocity independently of the harmonic theorem. Wide-open triple sums require global auxiliary data; the package does not claim a whole-curve triple pairing from independently chosen bad-reduction primitives. Closed-field natural integration, finite-field compactness and finite-field semistable realizations have different, explicit coefficient hypotheses.

### Seeded source verification

All six manifest texts were readable in the supplied legal cache. Their cited versions are explicit: the three arXiv v1 texts, the published Besser–de Jeu article, Colmez's Astérisque volume, and the 2003 arXiv version of Besser's 2005 publication. No locator was flagged unverified or uncertified in the package. All 15 seeded targets were checked against the theorem/definition, printed page, hypotheses and surrounding argument, as follows. The entries below paraphrase evidence; they do not reproduce source passages.

| Seeded target | Text and locator inspected | Result |
| --- | --- | --- |
| 1.1 Cochains with edge identities | besser2017 line 528, Definitions 4.1–4.3, printed pp. 11–12; line 553, Theorem 4.4; line 768, subdivision argument | Unit-length differential, reversal and pairing agree. Positive rational metric weights are explicitly an extension; grouping flags proves adjointness, and rational rank transport proves the characteristic-zero generality. Loops need two flags. |
| 3.1 The end-sum on a wide open | besser2017 line 492, Definition 3.8; line 503, Proposition 3.9; line 516, Remark 3.10, p. 11 | Correct domain, end orientation, constant cancellation and shrinking. Rational-core vanishing and nonzero positive-genus cup examples distinguish it from a zero pairing. |
| 3.2 Normalized component primitives | besser-zerbes2017 line 74 through line 88, equation (1.4) and Theorem 1.1, p. 2 | Harmonic normalization exists modulo one common constant. Its sign is consistent with this roadmap's opposite coboundary convention. The package retains the smooth-residue restriction for later identification. |
| 3.4 The cohomological pairing with graph terms | besser2017 line 738, Definition 4.11; line 747, Proposition 4.12(1)–(3), pp. 15–16 | Component pairing plus the two ordered graph terms is correct. Proper cup compatibility uses second-kind or Čech representatives. Metric insertion in N cancels the inverse metric weight in the graph pairing. |
| 3.5 Frobenius and monodromy compatibility | besser2017 line 754 and line 777, Proposition 4.12(4) and proof, pp. 15–16 | Scaling by q and skew-adjointness of N agree with the proof. The package correctly uses its corrected pairing despite the source's inconsistent pairing subscript in the displayed identities. q is a positive power of the residue cardinality. |
| 4.0 Abelian logarithms for arbitrary geometric coefficients | colmez1998 line 3079, Theorem II.1.9, pp. 76–77; line 3113, geometric deformation case; line 3147, Lemma II.1.13, p. 78 | The source covers varieties not defined over a finite p-adic field. Torsion of open quotients, rather than compactness of ℂ_p-points, gives unique extension of the local logarithm. The vector-valued formulation follows by invariant differentials. |
| 4.0a Natural primitives on abelian varieties | colmez1998 line 3162, difference convention; line 3169, Theorem II.1.16, p. 78; line 3184 and line 3193, normalized square primitive and Proposition II.1.17, p. 79 | Symmetric finite differences, differential rigidification and uniqueness modulo constants agree. Finite-field traced logarithms are identified as descent consequences, not misattributed to a separate numbered trace theorem. |
| 4.0c The all-prime natural single integral | colmez1998 line 2957, coefficient scope, p. 73; line 2982 through line 2997, Definitions II.1.2–II.1.3 and Theorem II.1.4, p. 74; line 246, Remark 2(iv), pp. 2–3; line 3395, proof, pp. 84–85 | Closed subfields, affine universal values, naturality and exact/log evaluation are supported. The package adds the fixed-field adapter and fixed-K uniqueness argument explicitly. Vologodsky comparison is restricted to p>2: vologodsky2001 line 51 and line 1806, Proposition 52, p. 42. |
| 4.0d Natural principal-divisor reciprocity | besser2005 line 355, Proposition 3.4; line 358, line 365 and line 369, Lemmas 3.5–3.7, p. 8 of the cited preprint; besser-zerbes2017 line 151, p. 4 | Reciprocity, finite degree and projection formula agree. Nonzero f, disjoint support, separable differential trace and local ramification factors are retained. The package corrects the source's informal inclusion of f=0. |
| 4.0e Jacobian differentials and point topology | colmez1998 line 3147 and line 3213, Lemma II.1.13 and Remark II.1.18, pp. 78–79; besser-zerbes2017 line 142, pp. 3–4 | The holomorphic logarithm identity and divisor argument are supported. The package strengthens the source's abbreviated Jacobian argument by working with the open compact subgroup generated by rational-point differences. Mathematical claim sound; attribution correction R01. |
| 4.1 Rational logarithms and graph residues | besser-zerbes2017 line 218, Lemma 2.1 and proof, p. 5; line 135, exact/log primitives, pp. 3–4 | The sign is independently pinned by xy=π, tail=(y), head=(x), f=x. Residue 1 equals head order minus tail order, hence minus this roadmap's d. No-zero/no-pole on the annulus is retained. |
| 4.4 The Vologodsky point-sum | besser2017 line 807, Corollary 5.3, p. 16; line 449, Proposition 3.5, p. 10 | Correct equality with the harmonic pairing, exact-form vanishing and proper cup restriction. The empty-boundary statement concerns global regular forms, not all proper cohomology represented by such forms. Nonsplit poles are separately traced. |
| 6.0 Relations among actual Coleman forms | besser-dejeu2012 line 2769, Lemma 9.1; line 2784, Proposition 9.2 proof, p. 364 | Symbol well-definedness and the kernel containment are precisely the actual-product relations needed. They are not imposed on a free replacement module. |
| 6.2 Choice cancellation, constants and shrinking | besser-dejeu2012 line 2546, Lemma 8.2, p. 361; line 2559 through line 2587, constant formulas and Lemma 8.3, pp. 361–362; introduction p. 310 | Global auxiliary constants cancel by the residue sum. A constant second slot gives C times the double pairing; a constant third slot gives zero. Shrinking includes the extension hypothesis across new discs. |
| 6.4 A pairing on actual Coleman one-forms | besser-dejeu2012 line 2776 through line 2792, Proposition 9.2 and proof, p. 364 | The generator formula, uniqueness and descent through actual-form relations agree. The reduction on analytic-function tensors is the required final step. |

Also read the local logarithmic and triple-index constructions at besser-dejeu2012 line 2232, line 2277, line 2299, line 2413 and line 2430; transport and Frobenius at line 2529 and line 2591; the Čech sequence and χ,N formulas at besser2017 line 586 through line 658; the Tate calculation at besser-zerbes2017 line 245; and the Albanese comparison at colmez1998 line 3376 through line 3431. No new source was needed, and no manifest entry was modified.

### Adversarial mathematics pass

Each subsection row covers its definition, named API, standing hypotheses, equations and Checks, not only its headline. Instances were calculated or checked against the construction and cited text. “None” means no change to the package is required by that test; it does not mean a formal proof was run. Positive characteristic, the zero ring, inseparability and noncompactness were used as negative controls where the target excludes them, rather than silently admitted as instances.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Standing conventions | Reversed edge; xy=π with x; ramification index 2; quadratic trace; p=2,3 | d(2,5)=−3; residue of dlog x=1; both annular orientations give 4; branch increment is 2/e; Tr(1)=2 | None |
| §1.1 LengthCochains and bridges | Empty vertices/edges; isolated vertex; loop; parallel edges; length 1/2 | Empty complex is zero; loop divergence cancels; pairing of values 2,3 is 12; simple coboundary has the opposite sign | None |
| §1.2 decomposition and projection | Tree; two isolated vertices; triangle (3,0,0); characteristic 3 | Harmonic triangle part is (1,1,1); constants are componentwise; characteristic 3 has nonzero exact/harmonic intersection | None |
| §1.3 metric subdivision | Jump 6 split in proportions 1/3,2/3; identity subdivision; tree attachment | Jumps 2,4 add to 6; energy and jump-residue sum are preserved; tree current is zero | None |
| §2.0 analytic transport and germ adapter | z=t²; z=t⁻¹; constant map; infinite negative tail; quadratic point | Residues 2,−1; degree-zero map excluded; infinite-tail analytic series cannot enter the formal germ carrier; trace of residue 1 is 2 | None |
| §2.1 logarithmic functions and polynomial presentation | Scalar; L; Laurent z⁻²; L²; z² over ZMod 2 | dL=z⁻¹; primitive of z⁻² is −z⁻¹; L² is outside degree one; non-scalar z² is in the characteristic-two kernel | None |
| §2.1a general analytic coefficients | ℚ₂; ℚ₃; characteristic-zero residue field; closed boundary | Field division is valid; interior-radius margins absorb integer denominators; no assertion of primitive convergence at a closed boundary | None |
| §2.2 double index and uniqueness | (1,L), (L,1), (z,z⁻¹), (L,L); two scalar shifts | Values 1,−1,−1,0; shift is a Res(dG)−b Res(dF); the Laurent-plus-log decomposition determines the pairing | None |
| §2.3 transport | Degrees 1,2; reversal; scalar embedding; trace | Degree multipliers 1,2 and orientation multiplier −1; coefficient trace commutes with extraction, not with products | None |
| §3.0a Coleman cover | Smooth model; ordinary node; self-node; pole on overlap | Smooth case imports the base presentation; opposite residues cancel; self-node requires subdivision; pole-overlap case is excluded | None |
| §3.0b full analytic coefficients | Transcendental geometric-series coefficient; zero/scalar; log; disc indicator | Full coefficients exceed finite tensor sums; scalar kernel is global; unrelated locally constant disc indicators are excluded | None |
| §3.0c Čech, cup, χ,N,φ | Smooth positive genus; total coboundary; diag(1,q); residue extension 𝔽₂→𝔽₄ | Proper H¹ survives with χ=N=0; coboundaries vanish; Nφ=qN; identity-coefficient geometric Frobenius must be iterated over the enlarged residue field | None |
| §3.1 double end-sum | Zero form; rational core; second-kind cup value 1; added nonsingular disc | Values 0,0,1; global constants cancel; new nonsingular disc contributes zero | None |
| §3.1a reciprocity and spectrum | Exact analytic form; dlog unit; quadratic boundary over 𝔽₃ | Radical values vanish; boundary eigenvalue −3 becomes 9 on squaring; 1/3 is absent | None |
| §3.2 harmonic primitives | Bridge jump 2; single component; triangle cycle | Shift of head by −2 kills bridge jump; one common constant remains; cycle period survives | None |
| §3.3 auxiliary correction | c=2,d=3,rη=5,rω=7; reversal; shift at one component | Correction −11 is orientation invariant; arbitrary component shifts can change both sides | None |
| §3.4 corrected pairing | ℙ¹, Z empty; proper cup value 1; total coboundary; refinement | Zero genus gives zero; second-kind value is 1; coboundaries vanish; length factors cancel | None |
| §3.5 φ and N identities | N=0; symplectic plane; φ=identity; residue degree 2 | diag(1,q) scales by q; monodromy terms are 1 and −1; arbitrary identity fails at q≥2; extension uses the specified iterate | None |
| §4.0 geometric abelian logarithm | Dimension 0; torsion; small nonzero tangent; transcendental Legendre parameter | Values 0,0,v; transcendental j prevents a finite p-adic field model, but the geometric theorem applies | None |
| §4.0a abelian primitives | Invariant form; df; zero variety; quadratic normalized trace | Invariant primitive is the logarithm pairing; exact primitive is f modulo constants; averaging divides by 2, also over ℚ₂ | None |
| §4.0b Albanese and LogDesc | Point; A¹; G_m; dt/(t²−2) over ℚ₃; transcendental pole over an overfield | Exact and logarithmic parts are distinct; the quadratic form requires traced scalar logs; finite algebraic generators cannot produce a transcendental pole | None |
| §4.0c natural integration and descent | Equal endpoints; A¹ dt; G_m dlog; completed unramified field; nonclosed ℚ̄_p | Values 0,b−a,T; compactness unnecessary; closedness is essential for the fixed-field assertion; uniqueness is a natural-theory assertion | None |
| §4.0d natural reciprocity | Constant nonzero f; f=0; (t−a)/(t−b) with dt; degree-two map | Constant case zero; zero f excluded; residue at infinity is a−b; multiplicity 2 is retained | None |
| §4.0e Jacobian bridge | Genus 0; multiplicative elliptic reduction; noncompact K× | J(K) remains compact in bad reduction; locally constant homomorphism on compact H vanishes; valuation on K× is the negative control | R01: correct proof attribution |
| §4.1 dlog residues | f=x at xy=π; nonzero constant; zero function | Residue 1 is −d(ord); constants have zero jumps; zero f excluded | None |
| §4.2 harmonic identification | Tree; cycle; df,dlog f; Tate points of valuations 1/3,2/3 | Tree jumps vanish; cycles need not; annular corrections −1/3,−2/3 prevent extending constant comparison to the whole overlap | None |
| §4.3 annular interpolation | Tail value 2, jump 6, t=1/3; reversal; quadratic refinement | Both orientations give 4; subdivision gives jumps 3,3; valuation scales by ramification | None |
| §4.4 point-sum | Empty boundary; holomorphic forms; second-kind cup value 1; cycle | Holomorphic value zero; second-kind value 1; graph term cannot be discarded | None |
| §5.1 labelled auxiliary data | Three L functions; three zero functions; G=0,H=L with entries (1,0) and (1,−1) | Half squares satisfy the equations; zero functions retain off-diagonal choices; only (1,−1) is compatible | None |
| §5.2 local triple index | (1,1;L), (z,z;z⁻²), (z,z⁻¹;L), (L,L;L) with half squares | Values 1,−2,1,0; division by 3 valid over ℚ₃; data-compatible linearity is essential | None |
| §5.3 choice laws | F=L,G=0,H=L; pair shifts 1,2; unused pair | Changes −1,−2; changing the F,G pair has no effect; zero function alone does not force local zero | None |
| §5.4 simple-pole formula | (2+L,3;L); pure logs with half squares; u=az | Value 6; pure-log value 0; constant coefficient changes by −δ while transported index is unchanged | None |
| §5.5 transport | Identity; degree 2; reversal; an untransported primitive shift | Multipliers 1,2,−1; independent shift introduces the specified residue error | None |
| §6.0 actual-form relations | Analytic coefficient; nonzero symbol; G dC | Analytic symbol zero; nonzero symbol forbids zero product; scalar C gives zero actual form | None |
| §6.1 triple end-sum | Zero data; rational core; positive genus and G=1 | Values 0,0,B_U(F,H), with the latter possibly 1; differential-class-only descent is false | None |
| §6.2 global laws | Global versus single-end shift; second-slot constant 2; third-slot constant | Global residue sum cancels; single-end change can be −1; adding 2 can add 2; constant third slot gives zero | None |
| §6.3 Frobenius vanishing | Zero eigenclasses; q=2; residue-degree-two extension; arbitrary F with G=1 | Both eigenclass hypotheses matter; the functional has eigenvalue 1/q; geometric extension requires iteration | None |
| §6.4 actual one-form pairing | 1·dH; G dC; Leibniz presentations of d(GH) | Double pairing recovered; scalar derivative gives zero; actual-product relations, not free symbols, guarantee agreement | None |
| §7.0 Tate charts | q=p³; n=1,2; q=1; p=2 | Final gluing subtracts log q; differential stays dz/z; flags retain short cycles; n=0 excluded | None |
| §7.1 branch and affine specialization | Zero ring; general commutative ring; slopes 0,1,1/2; equal branches | Distributive identity needs no domain; branch increment 2 gives 0,2,1; equal branches give zero | None |
| §7.2 proper holomorphic forms | ℙ¹; elliptic curve; G_m | Proper holomorphic coefficient of T is zero; nonproper dlog from 1 to p gives T | None |
| §7.3 coefficient trace and averaging | Identity extension; ramified quadratic at p=2; α²=π; equal endpoints | Tr(α)=0, Tr(α²)=2π; base-field value traces to degree times itself; averaging degree is nonzero | None |
| §7.4 divisor integral | Empty support; b−a; quadratic point minus 2[0]; degree 1 error | Values 0,I(a,b),π for t dt; incorrect divisor degree leaves basepoint dependence | None |
| §7.5 traced indices | Rational point; quadratic point; empty sum; product trace | Identity trace or trace 2; infinity contributes −2; tracing input factors separately is wrong | None |
| §7.6 realization descent | Good reduction; ramified splitting; common refinement; quadratic constant field | Intrinsic integral identifies realizations; scalar 1 over quadratic constants traces to 2; global triple-data restriction retained | None |
| §7.7 Tate normalization | q=p³, log(p)=1; q multiplication; branch change; n=1,2 | Primitive log z−ν_p(z), jump −1; period and branch differences zero; positive valuation justifies division | None |

The following signature audit is against the bodies and explicit binders in `packages/ColemanIntegrationPartII/Suggested.lean`. There are no section-variable hypotheses that can disappear from admitted declarations.

| Lean theorem | Instances/argument checked | Result | Change |
| --- | --- | --- | --- |
| `formal_primitive` | w=0,z⁻¹,z⁻²; subtract the residue term then use Laurent primitive existence | Characteristic-zero field sufficient; prescribed second coordinate is correct | None |
| `differential_eq_zero_iff` | Scalars, L, characteristic-two z² | Residue forces log coefficient zero, then imported Laurent kernel applies; CharZero explicit | None |
| `differential_residue` | General f+aL, residue-one L | Derivative coefficient at −1 is 0 times coefficient 0; result a | None |
| `residue_zero_iff` | a=0 and a=1 | Exactly the zero-log-coefficient locus | None |
| `toPolynomial_injective` | Zero, Laurent constant, L; coefficients 0 and 1 | Pair recovered in every field; no CharZero needed | None |
| `doubleIndex_self` | Laurent part and log correction | Residue of f df vanishes in characteristic zero; log terms cancel | None |
| `doubleIndex_add_left` | Two Laurent-plus-log pairs | Derivative and coefficient linearity give the stated sum | None |
| `doubleIndex_laurent_first` | f=1,z and arbitrary log coefficient | Coefficient of f·z⁻¹ is coefficient 0 of f; formula matches the body | None |
| `doubleIndex_ext` | Laurent summands plus multiples of L | Residue rule and bilinearity fix mixed terms; alternation fixes B(L,L); conclusion not assumed | None |
| `doubleIndex_add_constants` | (a,b)=(1,0),(0,1), general a,b | Difference aG₂−bF₂, no ab cross term | None |
| `specialize_zero` | General pair and zero ring | Evaluation at 0 is first coordinate | None |
| `specialize_add` | General commutative ring and two pairs | Distributivity | None |
| `specialize_tower` | Identity homomorphism and arbitrary ring homomorphism | Both coefficients and branch parameter transported | None |
| `branchTransport_affinePolynomial` | Equal branches; slopes 0,1,1/2; zero ring | Difference (λ′−λ)B, independent of integration existence | None |

### Duplication and supplier audit

Read main-branch shape and ownership examples in `TauCetiRoadmap/AlgebraicCurves/README.md`, `TauCetiRoadmap/FormalLaurentPuiseux/README.md` and `TauCetiRoadmap/JacobianChallenge/README.md`. Main was read at `0e8b058a97cc4f9401d2679313e0e937761c1024`. Searches used objects and operations, including Laurent differentiation/residue, graph incidence/cochains, harmonic projection, logarithms, Albanese, local indices, trace and restricted-series norms. Default-branch GitHub search results were followed by reads at the pinned revisions; search hits alone were not treated as pinned availability.

| Object | Existing owner read | Audit result |
| --- | --- | --- |
| Multigraph incidence and simple Laplacian | Mathlib `Mathlib/Combinatorics/Graph/Basic.lean:92`, `:260`, `:499`; `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:80`, `:125` | Imported Graph, loop and banana carriers, and simple Laplacian. Rational metric multigraph cochains are an additional target. |
| Simple graph cochains and quotient | Tau Ceti `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean:54`, `:81`, `:107`; `Map.lean:97`, `:169`; `Relabel.lean:123`, `:130` | Existing multiplicative cochains, quotient, universal property, coefficient maps and relabelling are imported. The value-preserving bridge and opposite differential are explicit. |
| Laurent derivative and singleton coefficients | Mathlib `Mathlib/RingTheory/LaurentSeries.lean:132`, `:150`, `:176`; `Mathlib/RingTheory/HahnSeries/Basic.lean:202`, `:206` | No second Laurent carrier or derivative construction. Formal residue/primitives/kernel imported from FormalLaurentPuiseux L1–L3; degree-one logarithmic presentation is new. |
| Field trace | Mathlib `Mathlib/RingTheory/Trace/Defs.lean:72`, `:110`, `:137`; `Mathlib/RingTheory/Trace/Basic.lean:249` | Finite-free tower and separable-embedding hypotheses retained. The roadmap constructs applications to integrals and whole local indices, not a second trace API. |
| p-adic coefficients and restricted-series norm | Mathlib `Mathlib/NumberTheory/Padics/PadicNumbers.lean:798`, `Complex.lean:137`, `:199`, `:240`, `:244`; Tau Ceti `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:88`, `:151` | Foundations imported; no integration theorem inferred from a norm/completion instance. |
| Albanese universal property | Tau Ceti `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84`, `:109`, `:173`; JacobianChallenge Layers D–F | Native predicate and universal-property API reused. Higher-dimensional existence/rational-form comparison and the integration bridge are retained additions; R01 corrects one attribution. |
| Geometric completions and residues | AlgebraicCurves Layers 5/9; FormalLaurentPuiseux L1–L3 | Explicit imports match their present statements. A newer default-branch differential-residue file is absent at the Tau Ceti pin (404); it was not treated as pinned supply. |
| Base Coleman integration | ColemanIntegration L0.A1–L0.A2, L0.11–L0.23, L1.2–L1.3, L1.17–L1.19, L1.17a and L1.43 | Good-reduction and algebraic-coefficient constructions are imported. Full analytic coefficients and component-domain comparisons are explicit additional targets; no tensor-completion equality is asserted. |
| Galois action/fixed closure | PadicPeriodRings §§1.1–1.2 | Supplied closed-subgroup fixed-closure theorem exists. The arbitrary closed-subfield adapter is a named local target. |
| Abelian logarithm over finite fields of definition | AnabelianGeometryAndNonabelianChabauty §5.8 | Imported for A/K with K finite p-adic, including all ℂ_p-points of that variety. The geometric A/ℂ_p extension is distinct. |
| Rigid cohomology and Frobenius | PadicDifferentialEquationsAndRigidCohomology RD.4.31–RD.4.33, RD.5.76, RD.6.1, RD.6.86, RD.6.88, RD.6.92 | Finite base change, dagger/proper comparisons, finite dimensionality and weights exist. Residue-field iteration and qζ boundary eigenvalues match the supplier. |
| Compactification | ResolutionOfSingularitiesCharacteristicZero §6.2, line 772 | Smooth quasi-projective characteristic-zero input and preservation of that open are supplied; the roadmap uses a dense quasi-projective open for the general variety. |
| Analytic geometry and nodal models | RigidAnalyticGeometry §§1.3,2.3,6.2,8.1; StableReduction Layers 0–2,4–5,7,9 | Complete extension retains quasi-separatedness. Nodal reduction covers all genera, flags include loops, and section separation is distinct from stable-range stabilization. |
| Tate uniformization | EllipticCurves Layer 4, line 885 | Point-level uniformization supplied for nonzero q with norm less than 1; differential/chart comparison remains local. |

The library pins read are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, matching `lake-manifest.json`. Additional local source-tree searches were used for discovery only; positive availability claims above use pinned reads.

Five named earlier suppliers are absent from the main working tree and package directory; their available roadmap Git objects were read instead: ColemanIntegration `acaaf506f3822fc5c8211345cb48f6b1cb00656c`, PadicPeriodRings `e37c9fb3ff76bd2b8fb3e48a5dcb421dfba2899e`, AnabelianGeometryAndNonabelianChabauty `dcadccb60dc136b8307a9d5e63acb66897472dc7`, PadicDifferentialEquationsAndRigidCohomology `c01dad49213cd0dd3c7b72b6023a0ce912a5e315`, and ResolutionOfSingularitiesCharacteristicZero `7f4bd21732080caa7af07328917421939f6c7cd9`. These are earlier owners in `merge-order/ORDER.txt`, not new imports from a later roadmap. The report records the exact versions checked rather than claiming they were present on main.

The two open sibling heads were verified through GitHub and their README objects read at those heads: ArithmeticDynamics `85e78c07dcc361ead6505c970a1181deee483819` and ErdosProgressionPowers `42053a57c08415a9ec0808d442eb654702586215`. ArithmeticDynamics §3.58 consumes the EffectiveDiophantineMethods contracts named in the package's downstream paragraph. Neither sibling supplies or duplicates this package's local/global index constructions. No supplier edge is inferred from a consumer paragraph.

All 11 roadmap supplier contracts and all 45 Needs lines were inspected. No upward roadmap dependency, supplier cycle or undeclared missing prerequisite was found. No ownership move or new supplier gap is required. Local constructions precede their consumers; §6.1's congruence export explicitly waits for §6.2's choice-independence proof, while §6.2 uses only the already defined end-sum, so this is not a proof cycle.

The prescribed dependency command exited 0. Its complete output was:

```text
depcheck: 3 roadmaps, 19 edges, 0 problem(s)
```

No UPWARD or CYCLE line occurred. The three-roadmap scope is reported literally; this mechanical result was supplemented by the manual supplier audit above.

### Shape, Lean form and checks

The README has the required title/summary, ownership, conventions, exact supplier contracts, reading guide, seven layers, per-layer Examples and Dependencies, consumers and references. Every numbered subsection has at least three Checks. Definitions have named APIs and discriminating examples/non-examples. The package uses Unicode mathematics and code spans without LaTeX delimiters, target-numbering tables or the forbidden catalogue field lists.

`Suggested.lean` has one `import Mathlib`, one module docstring, the required namespace and layer comments, six real-bodied definitions/abbreviations, fourteen admitted theorem targets and six proved example blocks. Each declaration has a mathematical docstring. No admitted example/data, `lemma` declaration, `set_option`, placeholder condition, evaluation command or axiom-printing command occurs. All 20 declared names occur in the README. The example groups test logarithmic coefficient/differential/polynomial presentation, double index, and affine specialization, with at most two blocks per definition. The missing geometric carriers stay in README targets. The affine specialization carrier is explicitly only the algebraic ingredient and is not used to stand in for natural integration.

Both TOML files parse. `metadata.toml` declares topic `math.NT`; the source manifest has the required schema and six certified entries. The package's four input files were not edited. Only this report, `review.json` and the permitted scratch worklist were written.

## Not verifiable

- **Previous review text:** `packages/ColemanIntegrationPartII/reports/REV-PKG-ColemanIntegrationPartII~2.md` is absent. Both findings described by the repair report were independently verified, but completeness against the absent original review cannot be certified.
- **Lean elaboration: not available.** The brief specifies no available elaboration command and permits no substitute Lean command. No Lean process was started. The six example proofs and fourteen signatures were inspected against pinned APIs; neither successful elaboration nor “sorry is the only warning” is claimed. Elaborated `#check @name` types were not available.
- **Future implementation proofs:** this package states a roadmap. Source and adversarial checks support its claims but do not replace proofs of the analytic extensions, geometric comparisons or descent constructions.
- **Source access:** no unreadable cited text remains. No missing-reference request is needed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c2849a1810770207f7c5dce18bcce24dc3c9469b", "job": "REV-PKG-ColemanIntegrationPartII~3", "model": "gpt-6-astra", "worker": "chris-1"} -->
