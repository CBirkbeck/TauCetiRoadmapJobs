<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/37#issuecomment-6305874703 -->
Review (codex) of f3d83a5

Verdict: needs_changes

1. **F01** (P2) Restore the cited natural-integration theorem's coefficient scope

   **Location.** `packages/ColemanIntegrationPartII/design/README.md:498`: “For every prime p, every finite K/ℚ_p”; also the standing convention at line 17 and `packages/ColemanIntegrationPartII/design/plan.json:1414`–1418.

   **Claim.** The only named natural single-integration theory is restricted to finite p-adic fields. The cited Colmez theorem is more general: its coefficient field is any closed subfield of ℂ_p. The brief expressly requires retaining source-supported generality. The special-purpose finite-field construction and its compactness argument do not establish the omitted coefficient cases. Even the full ℂ_p theory used in the finite-map APIs at README line 521 is not exported by §4.0c, although §§4.0–4.0b build substantial ingredients for it.

   **Witness.** colmez1998 line 2957 fixes any closed subfield of ℂ_p; line 2996 states Theorem II.1.4 in that scope. The completion of ℚ_p's maximal unramified extension is excluded by §4.0c.

   **Exact repair.** Register a named general natural-integration target for each closed subfield K⊆ℂ_p, every smooth geometrically connected finite-type U/K, closed regular ω, and a,b∈U(K), with values in K+KT and the naturality, exact/logarithmic evaluation, Chasles and uniqueness properties of Definition II.1.3. Include compatibility for inclusions of these coefficient fields. Keep the finite-K semistable-model, finite-trace and compactness theorems at their justified scope and make their integration input the specialization of this general target. Explicitly export the ℂ_p case used by §4.0d.

   For descent, consume the existing earlier owner PadicPeriodRings §1.2, `padicComplex_fixed_closure_eq`, rather than planning Ax–Sen–Tate again. Its contract at `TauCetiRoadmap/PadicPeriodRings/README.md:90`, head `e37c9fb3ff76bd2b8fb3e48a5dcb421dfba2899e`, gives fixed points for closed Galois subgroups. State the needed closed-subfield adapter and the descent of the geometric primitive here, with the actual hypotheses; do not extend finite-field compactness to ℂ_p or other non-locally-compact fields. Add Checks over ℂ_p with the existing transcendental-j example and over the completed maximal unramified field, plus agreement with the finite-K theory. Update the summary, conventions, target/API entries and supplier/prerequisite declarations together. PadicPeriodRings is earlier in the supplied order.

2. **F02** (P3) Specify the fibre in the nonsplit Frobenius Check

   **Location.** `packages/ColemanIntegrationPartII/design/README.md:351`: “For ℙ¹ minus one degree-two closed point”; also `packages/ColemanIntegrationPartII/design/plan.json:890`, Check `doublePairing_nonsplit_spectrum`.

   **Claim.** The asserted eigenvalue −Q_K is the correct test for a degree-two point of the residue-field curve, or a separated unramified lift of that boundary. In this p-adic section, “degree-two closed point” alone also suggests a degree-two point of the generic curve. That degree does not determine the residue Frobenius permutation. The Check must identify its base and good-reduction boundary explicitly.

   **Witness.** `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:14638` concerns special-fibre D_k. The generic quadratic point t²−3 over ℚ₃ is ramified; its conjugates collide modulo 3, rather than defining a degree-two residue point.

   **Exact repair.** State the Check on ℙ¹ over 𝔽₃ minus the point t²+1, with coefficients K=ℚ₃, or on its good-reduction Coleman wide-open lift with the two conjugate omitted discs. The residue quotient is the anti-diagonal of the two geometric boundary coordinates; Frobenius is 3 times their transposition, so the eigenvalue is −3 and its square is 9. Explain that t²−3 on the generic fibre is not this example. Preserve the valid general qζ spectrum and reciprocal-eigenvalue exclusion. Synchronize the named JSON Check.

Two findings: one P2 blocker and one P3 Check clarification. The design is repairable within this Part II. No rejection, supplier gap or ownership move is required.

## Previous repair verification

The named `packages/ColemanIntegrationPartII/reports/REV-DESIGN-ColemanIntegrationPartII~3.md` is absent. The available `packages/ColemanIntegrationPartII/reports/FIX-DESIGN-ColemanIntegrationPartII~4.md` records F01–F03 and marks all applied; none is marked “not actionable in this package.” I checked those three descriptions against the amended design and independent evidence. I cannot certify that the missing review contained no other findings.

| Previous finding | Repaired passage | Independent verification | Status |
| --- | --- | --- | --- |
| F01: finite-model logarithm used for arbitrary abelian varieties over ℂ_p | `packages/ColemanIntegrationPartII/design/README.md:438`: “For every abelian variety A defined over ℂ_p” and “No model over a finite extension of ℚ_p is required.” | New §4.0 owns existence, open-quotient torsion, uniqueness, functoriality and agreement with the finite-model supplier. Colmez Theorem II.1.9, printed pp. 76–77, includes the non-finite-model argument at colmez1998 line 3113; Lemma II.1.13 is at line 3147. The finite-model limitation really is present in AnabelianGeometryAndNonabelianChabauty §5.8. The transcendental-j Check distinguishes the extension. | Repaired |
| F02: unrestricted logarithmic spanning after transcendental coefficient extension | `packages/ColemanIntegrationPartII/design/README.md:480`: “For an algebraic closure k̄/k, the k̄-span of the scalar-extended LogDesc_k(X) is the full logarithmic subspace”; the following sentence restricts arbitrary E to finite algebraic fields of definition. | The separable Vandermonde argument recovers each conjugate logarithmic derivative. Finite algebraic coefficients suffice over k̄. On ℙ¹ over E, a pole at transcendental α cannot arise from the finite-algebraic-field-of-definition span. The new Check at line 494 detects precisely that failure. Colmez's geometric comparison and moving argument are at colmez1998 lines 3376 and 3399. | Repaired |
| F03: Layer 7 treated its internal integration theorem as imported | `packages/ColemanIntegrationPartII/design/README.md:987`: “the universal single-integration theorem of §4.0c”; the same phrase occurs in Layer 7's `dependencies` in `design/plan.json`. | Read both summaries and checked the prerequisite graph. §4.0c is an internal earlier target; no extra supplier edge is asserted. | Repaired |

R01 below is a separate remaining coefficient-generality issue. It does not deny that F01's arbitrary-ℂ_p abelian logarithm was added correctly.

## Verified sound

### Coverage, principles and shape

Read the complete design: **7 layers, 45 targets, 135 API entries, 155 Checks and 45 `*Needs:*` lines**, including proof sketches and conventions. Compared every target statement, API statement, Check and proof sketch in `design/plan.json` with its README text; they agree. JSON and TOML parse. The **12 targets tagged as definitions** have respectively 8, 3, 3, 3, 3, 3, 3, 3, 3, 3, 3 and 3 Checks. `NaturalIntegration.descendedLogForms`, introduced within §4.0b, also has explicit closure, scalar, splitting and tower APIs and discriminating examples.

The README has the required title, Summary, scope, conventions, exact contracts, reading guide, seven ordered layers, seven Examples sections, seven Dependencies sections, consumers and references. I read the main-branch StableReduction, JacobianChallenge and RigidAnalyticGeometry READMEs for comparison. The additional detail is mathematical, and the Part II boundary states where ColemanIntegration stops. No computational algorithm, route-only prime restriction, regulator construction disguised as a prerequisite, source passage copied into the design, `set_option`, sorry'd data or `lemma` declaration was found. No source-manifest entry was changed. The generality exception is R01.

No restricted-prime shortcut was found: the all-prime route uses Colmez, while the Vologodsky preprint comparison explicitly retains p>2. The formal local theory uses characteristic-zero fields; the analytic extension separately requires completeness, an ultrametric norm and open annuli. The construction keeps loops, parallel edges, ramification, nonsplit closed points and all genera. It does not claim that arbitrary local auxiliary choices define a whole-curve triple pairing.

### Source verification and seeded item

All **six** manifest texts were readable at the supplied cached versions. No source is flagged `unverified` or `uncertified` in this design or manifest. No additional cited work needed fetching, and no missing-reference request was necessary.

The seeded name **PadicHodgeRegulators** occurs at `packages/ColemanIntegrationPartII/design/README.md:991` and in the JSON consumer list. It is an intended downstream consumer, not one of the 45 mathematical targets, and has no theorem/page locator. I checked that no prerequisite or supplier contract consumes it. Thus there is no source-locator sample attached to that name to certify. I did not invent a target or treat its unspecified future section as supplier drift.

Beyond that sample, I checked the following source loci directly. The entries record the mathematical statements read, not verbatim passages.

| Source and exact locus | Verification |
| --- | --- |
| colmez1998 lines 2957, 2982, 2986, 2996; Definitions II.1.2–II.1.3 and Theorem II.1.4, printed pp. 73–74 | Natural integration, its affine universal-log values, exact/logarithmic normalization and algebraic naturality. Finite-K specialization is supported, but omits the full closed-subfield scope: R01. |
| colmez1998 lines 229 and 246; Remark 2(ii), (iv), printed pp. 2–3 | Good-reduction comparison and geometric Galois descent; the latter explicitly uses completed-field fixed points. |
| colmez1998 lines 3079, 3113, 3147; Theorem II.1.9 and Lemma II.1.13, printed pp. 76–78 | Open-quotient torsion, including non-finite-model varieties, and existence/uniqueness of invariant-form logarithms. Supports repaired §4.0. |
| colmez1998 lines 3169, 3193, 3213; Theorem II.1.16, Proposition II.1.17 and Remark II.1.18, printed pp. 78–79 | Finite-difference splitting and differential rigidification of abelian primitives; invariant forms give group logarithms. Polynomial ambiguity is degree <n, equivalently at most n−1. |
| colmez1998 lines 602, 1938, 2083, 2095, 3376, 3399; Chapter I scope, §I.5 and Lemmas II.1.26–II.1.27, printed pp. 13, 45–49, 83–85 | Algebraically closed characteristic-zero geometric scope, proper Albanese and rational-form comparison, and removal of apparent poles. The finite-field-of-definition trace/Vandermonde statement is an additional consequence, correctly labelled as such. |
| colmez1998 line 3950; §II.2.5, printed p. 97 | Universal logarithm uses v_p(p)=1. Field trace and norm-log compatibility do not justify multiplying separate traces of index factors. |
| besser2017 lines 402, 421, 435, 449, 492, 503; Definitions 3.1, 3.2, 3.4, 3.8 and Propositions 3.5, 3.9, pp. 9–11 | Local orientation, alternating double index, proper point sums and wide-open end sums; exactness, constant cancellation and rational-core vanishing. |
| besser2017 lines 528, 553, 586, 627, 646, 654, 671; Definitions 4.1–4.3, Theorem 4.4, equations (4.2)–(4.7), Lemma 4.8, pp. 11–14 | Characteristic-zero graph decomposition; Čech signs, graph retraction, residue monodromy and ordered second-kind cup formula. Rational-length extension is separately proved in the design. |
| besser2017 lines 700, 738, 747, 768, 777, 807; Theorem 4.10, Definition 4.11, Proposition 4.12, Corollary 5.3, pp. 14–16 | Correction c·Resη−d·Resω, proper cup restriction, refinement, Frobenius and monodromy, and final point-sum comparison. The design proves the early algebraic identities directly and does not inherit the paper's forward-reference wording as a dependency. |
| besser-zerbes2017 lines 74, 88, 99, 108, 130, 142, 212, 218; Theorem 1.1, Corollary 1.2 and §2, pp. 2–5 | Harmonic constants, smooth-residue-domain comparison, subdivision/valuation interpolation, principal-divisor argument and logarithmic-residue exactness. The roadmap correctly separates whole-annulus values from component Coleman functions. |
| besser-zerbes2017 lines 245, 265; Tate example §3, pp. 5–6 | Cyclic jump −log(q)/n and branch-cancelling primitive. The source uses n≥3 for its presentation; the design supplies flags/subdivision to retain n=1,2. |
| besser-dejeu2012 lines 2232, 2243, 2251, 2277, 2299, 2327; §7, Definition 7.1, Proposition 7.3, Lemmas 7.4–7.5, printed pp. 355–359 | Formal polynomial logarithms, actual auxiliary data, triple characterization and negative constant-change signs. Distinct labels prevent accidental identification of choices for equal functions. |
| besser-dejeu2012 lines 2413, 2430; Definition 7.7 and Proposition 7.8, printed pp. 359–360 | Simple-pole constant-term formula. Constant terms themselves change with the parameter; transported full data preserve the index. |
| besser-dejeu2012 lines 2520, 2529, 2533, 2546, 2576, 2591; §8, Lemmas 8.1–8.3 and Proposition 8.4, printed pp. 361–362 | Annular degree law, global auxiliary cancellation, surviving ordinary constants, and both q-eigenclass hypotheses. The proof produces functional eigenvalue 1/q. The source works over ℂ_p here; the design explicitly owns its finite-field descent and general formal extensions. |
| besser-dejeu2012 lines 2769, 2776, 2784; Lemma 9.1 and Proposition 9.2, printed p. 364 | Actual Coleman-form symbol map, relation-kernel containment and bilinear pairing. The design does not replace multiplication relations by a free symbol module. |
| besser2005 lines 355, 358, 365, 369, 376; arXiv v1 Proposition 3.4 and Lemmas 3.5–3.7, pp. 8–9 | Natural principal-divisor reciprocity, rational-line calculation, finite-degree scaling and projection by differential trace. Nonzero rational functions and separated supports are retained. |
| vologodsky2001 lines 51, 187, 195, 1806; arXiv v1 §1.1, Theorem B(4), §1.17 p. 5, and Proposition 52, §17.2 p. 42 | p>2 is a standing condition; finite extension and comparison with Colmez are supported in that scope. This source is not used to assert an all-prime iterated theory. |

The source pages above are printed pages where the README specifies printed pagination, not the PDF viewer's offset. No published/preprint numbering was silently interchanged.

### Adversarial mathematics pass

Each target row covers the headline, its attached API statements and its Checks; together the rows cover all 45 targets and all 135 API entries. These are mathematical counterexample and proof-plan checks, not claims of formal proof. “None” means no correction found in that row. Non-applicable cases are excluded by the explicit field, characteristic, domain or geometric hypotheses, rather than by selecting favourable primes.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Coefficient/domain conventions | Zero ring; characteristic p; equal-characteristic-zero valued field; ℚ₂ and ℚ₃; finite and transcendental extensions | CharZero fields exclude zero-ring and derivative-kernel failures. Formal and analytic scopes are separated. Natural-theory coefficient scope is incomplete. | R01 |
| Branch and valuation conventions | λ′−λ=2; v_p(p)=1; ramification e=2; unit and nonunit of the valuation ring | Changes are 2 at p, 1 at a ramified uniformizer, 0 at an integral unit. | None |
| Edge, Čech and cup conventions | One directed edge; xy=π with f=x; total coboundary; interchange α,β | d(2,5)=−3, Res(dx/x)=1=−d(ord); χ kills a total coboundary; ordered cup and correction signs agree. | None |
| Local index and auxiliary conventions | B(1,L), B(L,1), B(z,z⁻¹); auxiliary shift 1; all half-squares | Values 1, −1, −1; triple change −Res(dF); three equal normalized logarithms give zero, also over ℚ₃. | None |
| Trace/divisor conventions | Quadratic α²=π; degree-two point; empty divisor | Trα=0, Trα²=2π; point degree 2; zero divisor value 0. Whole scalar indices must be traced. | None |
| §1.1 `Graph.LengthCochains` | Empty graph; isolated vertex; two isolated vertices; loop; parallel edges; ℓ=1/2,c=2,d=3 | Zero-dimensional cases and componentwise constants work; loop divergence cancels; pairing 12 and divergences ±4. Pinned coboundary has the opposite sign. | None |
| §1.2 `harmonic_exact_decomposition` | Triangle (3,0,0); tree; disconnected graph; characteristic 3 | Harmonic part (1,1,1), exact part (2,−1,−1). The characteristic-3 intersection is excluded; ℚ₃ remains valid. Positive rational lengths allow the rational-rank proof. | None |
| §1.3 `harmonic_subdivision` | Jump 6 split in proportions 1/3,2/3; m=1; rational tail | Jumps 2,4; energy and jump-residue sum preserved; attached tree current vanishes. Zero lengths and m=0 are excluded. | None |
| §2.0 `residueTransport` | z=t²; reversal; identity; constant map; quadratic residue; infinite negative Laurent tail | Degree 2 and sign −1 are correct; constant map excluded; trace of residue 1 is 2; analytic/formal comparison requires finite principal part. | None |
| §2.1 `LogarithmicFunctions` | 2+3L; constants; L²; z^p in characteristic p | Residue 3; constant kernel; L² outside degree one; characteristic-zero hypothesis is necessary. | None |
| §2.1a `generalCoefficients` | L²/2 over ℚ₂; L³/3 over ℚ₃; trivially valued restriction to ℚ; closed versus open annulus | Polynomial-log primitives and kernel argument work; interior-radius margins absorb inverse-integer growth. Closed-boundary convergence is not asserted. | None |
| §2.2 `doubleIndex` | (1,L),(L,1),(z,z⁻¹); two constants; shifts in both slots | Values 1,−1,−1,0 and A Res(dG)−B Res(dF); alternation follows from exact-residue vanishing. | None |
| §2.3 `doubleIndex_pullback` | Orders 1 and 2; inverse coordinate; coefficient embedding | Degree scaling and orientation sign hold; positive formal order prevents an invalid substitution of arbitrary Laurent germs at infinity. | None |
| §3.0a `colemanCover` | Good reduction; ordinary node; self-node; separated punctures | Opposite annular residues and subdivision treatment of loops are consistent; poles are removed from connecting annuli. | None |
| §3.0b `fullAnalyticExtension` | Transcendental coefficient in (1−αz)⁻¹; scalar; log z; residue-disc indicator | Full analytic coefficients exceed algebraic tensors; a nonconstant discwise constant cannot be Coleman. Primitive and restriction comparisons are explicit new targets. | None |
| §3.0c `semistableDeRhamComparison` | Smooth positive-genus model; Čech coboundary; φ=diag(1,q), Ne₂=e₁; 𝔽₄ coefficient lift | χ=N=0 does not erase proper H¹. χφ=χ, Nφ=qN and N²=0 hold on the test; identity-coefficient geometric Frobenius requires q=(#κ_K)^r. | None |
| §3.1 `doublePairing` | Zero form; rational core; proper holomorphic forms; second-kind cup value 1 | Global constants cancel by the residue sum. Empty end sums on regular proper forms agree with holomorphic isotropy; second-kind punctured examples detect a nonzero pairing. | None |
| §3.1a `doublePairing_reciprocity` | Analytic exact; dlog unit; rational core; split boundary; degree-two boundary; ramified generic quadratic point | Proper projection and q-radical argument agree with weights. The −q Check needs its special-fibre boundary specified. | R02 |
| §3.2 `HarmonicPrimitiveData` | Bridge jump 2; triangle jump (1,1,1); zero form; loop subdivision | Vertex shifts kill the bridge but not the cycle. Uniqueness is modulo one global constant, not equality of functions on connecting annuli. | None |
| §3.3 `auxiliaryDoubleIndex_formula` | c=2,d=3,rη=5,rω=7; reverse edge; shift one component | Correction −11 is orientation invariant; arbitrary component shifts change both sides consistently. | None |
| §3.4 `correctedDoublePairing` | ℙ¹ with empty boundary; positive genus; good reduction; exact class; second-kind cup 1 | The pairing uses full Čech cohomology, not only global holomorphic representatives; ordered cup survives and exact classes vanish. | None |
| §3.5 `correctedDoublePairing_phi_N` | N=0; symplectic plane with diag(1,q); iterate; arbitrary identity | Scaling q and skew-adjoint cancellation hold; identity fails for a nonzero pairing and q≥2. Scalar extension is distinguished from Frobenius iteration. | None |
| §4.0 `abelianLogCp` | Dimension 0; torsion; small exp(v); finite-model extension; transcendental-j E_t | Zero-dimensional and torsion values vanish; local inverse returns v. Torsion open quotient supports the arbitrary-ℂ_p extension without compactness. | None; F01 repaired |
| §4.0a `abelianPrimitive` | Zero abelian variety; invariant form; rational exact form; second differences; finite extension | Differential plus square rigidification removes the spurious locally constant ambiguity. Invariant-form values have zero T coefficient; finite extension does not introduce a degree factor. | Retain as ingredient for R01 |
| §4.0b `albaneseReduction` and `descendedLogForms` | A¹; G_m; point; proper curve; dt/(t²−2) over ℚ₃; dt at infinity; transcendental pole | Rational, logarithmic and Albanese terms are distinguished. Quadratic trace formula is correct. Algebraic-closure spanning and restricted E-spanning now have valid separate proofs. | None; F02 repaired |
| §4.0c `naturalIntegration` | I(0,1;dt); I(1,p;dlog t); equal endpoints; nonsplit poles; completed unramified K | Values 1,T,0 and the traced primitive are correct in the stated finite scope. The last coefficient field is omitted despite the source theorem. | R01 |
| §4.0d `naturalIndexReciprocity` | Constant f; f=0; z=t²; ℙ¹ with dt and (t−a)/(t−b) | Nonzero constant gives zero; zero function excluded; ramification contributes 2. Divisor integral and infinity residue both equal a−b. | R01 supplies the explicitly used ℂ_p natural theory |
| §4.0e `jacobianIntegrationBridge` | Genus 0; split multiplicative elliptic curve; compact H; noncompact K× | Proper rational-point groups are compact; a locally constant additive map on H has finite image and vanishes. Valuation on K× is a valid negative control. | None |
| §4.1 `dlog_residue_is_exact` | f=x on xy=π; nonzero constant; zero f; exact df | Order sign is −d(ord); logarithmic and exact forms have zero harmonic jumps; zero f excluded. | None |
| §4.2 `harmonicPrimitive_eq_singleIntegral` | Tree; cycle; df,dlog f; Tate points at valuations 1/3 and 2/3 | Smooth-residue comparison is justified by reciprocity and compactness; whole-annulus equality modulo one constant would fail, as the Checks demonstrate. | None |
| §4.3 `singleIntegral_on_annulus` | F_tail=2,c=6,t=1/3; reversal; quadratic subdivision | Both orientations give 4; two jumps 3 recover 6; common valuation scale prevents a ramification factor error. | None |
| §4.4 `globalDoublePairing_eq_pointSum` | Empty Z and regular forms; exact form; second-kind cup 1; nonzero cycle | Global constants cancel and proper cup is retained. The empty-support form calculation is not substituted for all proper cohomology. | None |
| §5.1 `TripleIndexData` | All L with half-squares; zero functions with opposite constants; incompatible pair (1,0) | Derivative and product equations hold for valid data; (1,0) fails for a zero product, while (1,−1) works. | None |
| §5.2 `tripleIndex` | (1,1;L); (z,z;z⁻²); (z,z⁻¹;L); all L | Values 1,−2,1,0; symmetry and the three-term relation concern transported labelled auxiliary data. | None |
| §5.3 `tripleIndex_changeConstant` | (L,0;L); C=1,2; zero residue; unused pair | Changes −1,−2,0; the F,G pair has no effect. Vanishing of a function alone does not force local vanishing with arbitrary auxiliary constants. | None |
| §5.4 `tripleIndex_simplePoles` | (2+L,3;L); half-squares; u=az | Value 6, then 0 in the normalized all-L case; constant term shifts by −log a or −δ while the full transported expression is invariant. | None |
| §5.5 `tripleIndex_pullback` | z=t²; identity; reversal; auxiliary shifted after pullback | Factors 2,1,−1; an extra shift gives the separate residue error. | None |
| §6.0 `formSymbolRelations` | Analytic coefficient; nonzero [dG]⊗η; G dC=0 | Kernel containment is the actual-form relation theorem; zero products cannot have nonzero symbols. | None |
| §6.1 `ColemanWideOpen.tripleIndex` | Zero triple; rational core; G=1 and B_U(F,H)=1 | Values 0,0,1; replacing actual functions by differential classes loses the last example. | None |
| §6.2 `tripleIndex_laws` | Global auxiliary shift; shift at just one end; G↦G+2; constant third slot | Global shifts cancel; isolated end shift can contribute −1; ordinary second-slot shift contributes 2 when B=1; constant third slot vanishes. | None |
| §6.3 `tripleIndex_frobenius_vanishing` | Zero classes; q=2 over ℚ₂; q=4 over unramified quadratic field; G=1 with nonradical F | Both eigenclass conditions are needed; the induced functional has eigenvalue 1/q, excluded by the positive weights. | None |
| §6.4 `colemanFormPairing` | P(F,dH); G dC; sum G dH+H dG | Recovers double pairing; actual zero form pairs to zero; relations are handled before descent from product presentations. | None |
| §7.0 `uniformizationDifferential` | Tate n=1,2,3; q=1; p=2; z↦qz | Loops/parallel edges are retained, q=1 excluded, differential invariant. Point uniformization is not mistaken for an already supplied rigid quotient. | None |
| §7.1 `branchTransport` | u=p; ramified uniformizer; integral unit; equal branches; zero form | Branch changes 2,2/e,0,0,0; no unwarranted affine claim for arbitrary triple auxiliary data. | None |
| §7.2 `properHolomorphic_branchIndependent` | ℙ¹; elliptic curve; G_m; no K-rational basepoint | Proper values reduce to the abelian logarithm after extension; G_m supplies the nonproper counterexample. | None |
| §7.3 `coefficientTrace` | Identity extension; a=b; quadratic α²=π; tower | Trace gives the degree factor on K-values and composes linearly; averaging produces a descended primitive representative. Endpoints in the trace identity remain K-rational. | None |
| §7.4 `divisorSingleIntegral` | [t²−π]−2[0] with t dt; zero divisor; single quadratic point minus one rational point | Values π and 0; the last divisor has degree 1 and leaves basepoint dependence. | None |
| §7.5 `tracedLocalIndexSum` | Quadratic local residue 1; infinity residue −2; rational point; empty set; coefficient product α² | Contributions 2 and −2 cancel; whole scalar trace is essential. Local triple auxiliary independence is not asserted. | None |
| §7.6 `integrationRealization_descent` | Good reduction; ramified splitting; common refinement; quadratic constant field; unrelated component triple choices | Intrinsic integration compares harmonic realizations; larger constant fields require trace. Arbitrary whole-curve triple summation remains excluded. | None; F03 repaired |
| §7.7 `singleIntegral_normalization` | q=p³, log p=1; n=1,2; q=1; p=2 | Jump −1 and F(z)=log(z)−ν_p(z); q-periodicity and branch cancellation are exact. n=0 is excluded. | None |

### Duplication and supplier audit

Read `lake-manifest.json`: Mathlib pin `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti pin `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Used GitHub code search for discovery, then read files at these pins. Also inspected both complete pinned repository trees and searched the available main/completed roadmaps by mathematical objects. Negative search results are evidence of the audit's coverage, not a proof that no equivalent statement could exist under unrelated terminology.

| Object | Pinned or roadmap witness read | Ownership result |
| --- | --- | --- |
| p-adic coefficient field | `Mathlib/NumberTheory/Padics/PadicNumbers.lean:531`, 798, 1024: `Padic`, `Padic.normedField`, completeness | Imported; no new completion construction. |
| Multigraph incidence and simple Laplacian | `Mathlib/Combinatorics/Graph/Basic.lean:90`, 260, 356, 499; `Mathlib/Combinatorics/SimpleGraph/LapMatrix.lean:80`, 125 | Graph identities, loops and parallel edges exist. The retained rational-length multigraph harmonic theory differs from the simple-graph matrix API. |
| Simple-graph cohomology and functoriality | `TauCeti/Combinatorics/SimpleGraph/Cohomology/Basic.lean:54`, 79, 99, 122, 150; `Map.lean:97`, 169; `Relabel.lean:123`, 130 | Multiplicative quotient and induced maps are imported. The signed additive chain comparison and multigraph extension are genuine additional targets. |
| Formal Laurent derivative | `Mathlib/RingTheory/LaurentSeries.lean:132`, 176, 184 | Existing carrier and derivative are consumed. The logarithmic polynomial extension and indices are separate objects. |
| Trace and scalar towers | `Mathlib/RingTheory/Trace/Defs.lean:110`, 137; `Basic.lean:230`, 249 | Free/finite tower and separability/algebraic-closure hypotheses checked in scope. New integration/index consequences use these declarations rather than re-proving trace. |
| Restricted series | `TauCeti/RingTheory/MvPowerSeries/TateAlgebra/Basic.lean:62`, 88, 152 | Positive polyradii, ultrametric norm and complete coefficients match the contract. No duplicate analytic carrier is introduced. |
| Pointed Albanese property | `TauCeti/AlgebraicGeometry/AbelianVariety/Albanese.lean:84`, 109, 173 | Predicate and uniqueness already exist. §4.0b adds existence/rational-form comparison and uses that predicate. |
| Analytic logarithms and good-reduction Coleman functions | ColemanIntegration head `acaaf506f3822fc5c8211345cb48f6b1cb00656c`, L0.A1–A2, L0.11–12, L0.15–23, L1.2–3, L1.17–19, L1.17a, L1.43 | The base's coefficient distinction and pullback hypotheses are respected. Its L0.20/L0.22 scope is complete subfields of ℂ_p; §2.1a adds other complete ultrametric characteristic-zero fields. Full analytic coefficients are not identified with its algebraic tensor extension. |
| Finite-K and finite-model abelian logarithms | AnabelianGeometryAndNonabelianChabauty head `59d989dd138cd28b4a4643ab233c04ad6d62aa34`, `TauCetiRoadmap/AnabelianGeometryAndNonabelianChabauty/README.md:6829`, especially 6833–6849 | §4.0's arbitrary-ℂ_p extension does not re-plan the supplied finite-model theorem. Good-reduction curve comparison remains imported. |
| Rigid cohomology, Frobenius and weights | PadicDifferentialEquationsAndRigidCohomology head `c01dad49213cd0dd3c7b72b6023a0ce912a5e315`, RD.4.31–33, RD.5.76, RD.6.1, RD.6.86, RD.6.88, RD.6.92 | Every cited section exists. Constant coefficients have the required Frobenius structure for finite dimensionality. Identity coefficient lift, residue-degree iteration, proper weight one and boundary qζ match the contract. R02 concerns a Check's field, not missing supply. |
| Smooth compactification | ResolutionOfSingularitiesCharacteristicZero head `7f4bd21732080caa7af07328917421939f6c7cd9`, `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:770` | §6.2 supplies the claimed smooth quasi-projective compactification. The design applies it on a dense quasi-projective open and owns the Albanese extension. |
| Rigid ambient geometry | Main `TauCetiRoadmap/RigidAnalyticGeometry/README.md:235`, 355, 479, 690 | §§1.3, 2.3, 6.2 and 8.1 supply field extension, reduction, discs/annuli/gluing and analytification. Quasi-separatedness is retained for global base change. |
| Models, dual graphs, common resolution, all genera and markings | Main `TauCetiRoadmap/StableReduction/README.md:295`, 321, 354, 468, 491, 550, 615 | Layers 0–2, 4–5, 7 and 9 exist with the consumed interfaces. Marking separation is independent of the stable-range inequality; genus zero and one are supplied explicitly. |
| Jacobian and pointed Abel–Jacobi | Main `TauCetiRoadmap/JacobianChallenge/README.md:218`, 332, 448 | Layers D–F own the underlying objects and pointed comparison. Part II uses a temporary point after extension and owns its integration/topology bridge. |
| Tate point uniformization | Main `TauCetiRoadmap/EllipticCurves/README.md:885` | The analytic strand has q∈K×, norm <1, and finite-extension/Galois-compatible point uniformization. §7.0 adds differential/chart comparison, not a second point uniformization. |
| Additional fixed-field input for R01 | PadicPeriodRings head `e37c9fb3ff76bd2b8fb3e48a5dcb421dfba2899e`, §1.2, line 90; PadicHodgeTheory §0.2 imports that owner | The general closed-subgroup Ax–Sen–Tate target already has an earlier owner. R01 should import it. |

For the open-head context, read ArithmeticDynamics at `1921611a7a96ac19fb15c2b1291b35958c3ef0cb` and ErdosProgressionPowers at `e101259371172a32b3dd13e926676ae33b6af5cd`. ArithmeticDynamics §3.58 really is `noRationalFiveCycle` at that head, with the two named EffectiveDiophantineMethods contracts; its board copy has different section numbering and was not substituted for the head. Neither head supplies local indices, harmonic integration or the arbitrary-ℂ_p logarithm. ErdosProgressionPowers uses rational-point finiteness, not this producer. No upward consumer citation was used as a prerequisite.

### Dependency check

The literal prescribed command names `packages/ColemanIntegrationPartII/README.md`, which does not exist. It exits 1 with `FileNotFoundError`; a shortened repository-relative rendering of the terminal diagnostic is:

```text
FileNotFoundError: [Errno 2] No such file or directory: 'packages/ColemanIntegrationPartII/README.md'
```

I reran the same gate and configuration with candidate `packages/ColemanIntegrationPartII/design/README.md`, `--only ColemanIntegrationPartII`, and order `merge-order/ORDER.txt`. Exit status 0; exact output:

```text
candidate: ColemanIntegrationPartII is not in the merge order yet; checked as if placed after AnabelianGeometryAndNonabelianChabauty (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 10 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. I supplemented the limited three-roadmap gate with all eight declared roadmap contracts and all 45 Needs lines. Four suppliers are on main; the four ordered suppliers are ResolutionOfSingularitiesCharacteristicZero, PadicDifferentialEquationsAndRigidCohomology, ColemanIntegration and AnabelianGeometryAndNonabelianChabauty, all before the candidate's computed position. All **112 internal target edges** resolve and point to earlier targets. Forward explanatory references to later exported consequences were not treated as proof premises. No declared gaps exist, and no missing supplier section was found. R01's proposed PadicPeriodRings supplier is also earlier. No merge-order file or other roadmap was changed.

## Not verifiable

- **Previous review text:** `packages/ColemanIntegrationPartII/reports/REV-DESIGN-ColemanIntegrationPartII~3.md` is absent. Only the repair report's three descriptions could be checked finding by finding.
- **Seeded consumer's future interface:** PadicHodgeRegulators has no target, theorem locator or exact consuming section in these inputs. The prospective relationship is not a source theorem. It introduces no dependency and does not warrant a missing-text request.
- **Lean elaboration: not available.** This is a design-only package with no `Suggested.lean`. The brief supplies no executable Lean elaboration command. No Lean command was run, and there is no claim that elaboration succeeded or that `sorry` was its only warning. Binder inclusion, actual signatures and proved example mirrors must be checked when the Lean package exists.
- **Formal truth and exhaustive semantic duplication:** reading source statements, inspecting pinned declarations and testing boundary cases does not prove the roadmap's theorems or exclude all differently worded library equivalents. The concrete discovery paths and declarations checked are recorded above.

All six cited mathematical works were legally readable. There is no unread source, paywall blocker, waiver request or new missing-reference record. The GitHub connector rejected two oversized supplier files and the ArithmeticDynamics README; those repository texts were successfully read at their exact heads through the public raw-file endpoint. Only this report and `design/review.json` were written in the package.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "f3d83a50d3696ebed61e23abf9a31aa588874c41", "job": "REV-DESIGN-ColemanIntegrationPartII~4", "model": "gpt-6-astra", "worker": "chris-3"} -->
