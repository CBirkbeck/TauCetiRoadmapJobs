# Review of VStackSheavesAndLisseCategoriesPartII (package, round 2)

**Verdict:** needs changes

Ten findings: one P1, four P2 and five P3. The package and library-signature files elaborate, and the dependency gate passes. Those checks do not establish the mathematical assertions below. This review changes no package input.

## R01 (P2) — The proper comparison is narrowed to the paper's applications

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:33`, 440, 639–649, 1971: “the targets restrict to proper nice maps, which covers every use in the paper.”

**Claim:** Representability may be imposed on all proper comparisons and proper correspondence maps because it suffices for the applications in HKW22.

**Witness:** HKW22 line 1165, Theorem 4.1.8, p. 24, asserts the comparison for proper fine maps. README line 440 expressly leaves that generality unplanned because its representability argument is missing.

**Exact repair:** Restore a target for the pseudo-natural comparison on all proper fine maps, including its compatibility with nontrivial 2-cells. Supply the missing representability/descent argument as a named prerequisite here, or as a precise contract with an eligible earlier supplier. Propagate the general comparison to proper maps in Corr/CoCorr and the trace/pushforward targets. Keep proper nice maps as a proved special case and keep the source gap accurately identified. A citation to the unsupported assertion alone is insufficient. This is a scope-policy finding, not a claim that the narrower theorem is false. The boundary test must retain the proper finite étale map S → B(C₂), while excluding B(C₃) → S from “proper”: over F₃ its shriek homology has H⁻¹ = F₃ whereas ordinary pushforward has H⁻¹ = 0. The missing generality cannot be repaired by allowing arbitrary stacky structure maps.

## R02 (P1) — A 0-truncated map can have nontrivial 2-automorphisms

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:648`: “2-morphisms between 0-truncated maps are identities up to unique isomorphism.”

**Claim:** The 2-cell part of pseudo-naturality of Rf_! ≅ Rf_* follows by triviality of 2-cells.

**Witness:** For a geometric S, q : S → B(C₂) is finite étale, proper nice and 0-truncated, but Aut(q) = C₂. On the sign representation over F₃ its two cells act by 1 and −1.

**Exact repair:** Delete the asserted triviality. Give the mate/descent argument establishing compatibility of the comparison with genuine 2-isomorphisms, using VS6.10 and the coherent supplier comparison. Add this q as a negative-control Check. On q_!Λ = q_*Λ the nonidentity cell permutes the two regular basis vectors; the comparison must commute with this swap, not identify it with the identity. This also reconciles VS7.7 with the package's own VS6.9 and VS6.10.

## R03 (P2) — The right-torsor convention reverses the conjugating element

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:365`, 384, 1656: “left multiplication by h ∈ H(S) with f₁ = ad(h) ∘ f₂.”

**Claim:** For the stated right H-torsor with left G-actions, left multiplication by h intertwines f₁ with f₂ under that relation. VS11.2 subsequently uses left-torsor notation without a conversion.

**Witness:** Let H = S₃, G = C₂, f₂(t) = (12), h = (123), f₁(t) = (23). Then h f₁(t) = (12), whereas f₂(t)h = (23).

**Exact repair:** Keeping f₁ = ad(h)f₂ as the label for φ_f₁ ⇒ φ_f₂, use left multiplication by h⁻¹ for the actual map P_f₁ → P_f₂; state the resulting composition convention. Alternatively reverse the displayed conjugation relation consistently everywhere. With the first repair, h⁻¹f₁(t) = f₂(t)h⁻¹ = (13), so the map is equivariant. In VS11.2 use the right-torsor formula y ↦ yφ(y), with φ(yg) = g⁻¹φ(y)g, or explicitly introduce the conversion from right torsors to left torsors. Track this conversion through α_g and the action on sheaf fibres; include the nonabelian S₃ calculation, since the existing central/abelian Checks cannot distinguish the two conventions.

## R04 (P3) — The repaired Haar witness lacks its numerical hypotheses

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:38`, 1705: “2·2·μ(K) = 4μ(K) ≠ μ(K).”

**Claim:** The affine-group example over Q_p always has χ(diag(2,1)) = 2, and the two candidate expressions always have different values.

**Witness:** At p = 3, |2|₃ = 1, so χ = 1 and both integrals equal μ(K). At p = 2 with μ = 0, both are 0 in F₅.

**Exact repair:** In both occurrences choose p = 2, a compact open pro-2 subgroup K, and the Haar measure normalized by μ(K) = 1. Then μ(gKg⁻¹) = 3 in F₅: the correct value is 2·3 = 1, while the reversed formula gives 2·2 = 4 ≠ 1. Keep the general action and operator-conjugation identity, which are correct. This completes, rather than reverses, the previous F02 repair.

## R05 (P3) — The finite-set Check identifies different functors with the identity

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:880`: “For T finite, all four operations are the identity on Λ^T-modules up to the obvious identifications.”

**Claim:** Finite T makes all four operations of f : T_S → S identity functors.

**Witness:** T = {a,b}, Λ = F₃: f^*Λ = (Λ,Λ) and f_!f^*Λ = Λ², of dimension 2 rather than 1. The functors even have different source categories.

**Exact repair:** Replace the Check by the finite-family formulas: f^* and f^! send M to (M)_t; f_! sends (M_t) to ⊕_t M_t; f_* sends it to ∏_t M_t. Finite sums and products agree. For the singleton these are identities; for the empty set pullback lands in the zero category and pushforward gives 0. These formulas reproduce dimension 2 on the witness and agree with the main statement at line 867 and HKW22 line 1224.

## R06 (P3) — The action-correspondence negative controls omit the étale case

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1245`, 1907: “is not an endomorphism in CoCorr_S, since α^* ≠ α^!; only over G is the trace defined.”

**Claim:** Equivariance never defines the action correspondence over S.

**Witness:** Let C₂ act by swapping X = {a,b}_S. The action X × C₂ → X is finite étale, hence α^! = α^*. Equivariance does define the correspondence. This is the package's own line-1905 example.

**Exact repair:** Say this construction does not work over S **in general**; retain the construction over G, which works uniformly. Supply a failing example: for X = S, G = G_m over a geometric base and nonzero prime-to-p coefficients, α^*Λ = Λ whereas α^!Λ = Λ(1)[2]. Include the finite étale positive control: the swap has two fixed pairs over 1 and none over σ, giving local-term values (1,1) and 0. HKW22 line 2020 makes the qualification “in general”; the package strengthens it incorrectly.

## R07 (P2) — The scalar trace specialization does not constrain the correspondence

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1306`: “For X = S, tr_c(u, A) = tr(u | A).”

**Claim:** Setting X equal to the base makes every trace class the scalar trace of an endomorphism of A.

**Witness:** Take X = S a geometric point, C = S ⊔ S, A = Λ, u = (1,2). Then Fix(c) = C and tr_c(u,A) = (1,2) ∈ Λ²; u is not an endomorphism of A over S.

**Exact repair:** State the specialization for S = X = C a geometric point and both legs the identity, as the existing line-1317 Check already does. Retain the general class on Fix(c) for arbitrary C. For the witness over F₅ the class is (1,2), whose proper integral is 3; for C = S and u = 2 the scalar trace is 2. HKW22 line 1324 explicitly imposes X = X′ = C = S in the scalar example.

## R08 (P3) — Negative coefficient examples silently exclude the zero ring

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:676`, 710, 1288, 1320, 1648, 1703. Representative quote: “The regular representation C_c(G, Λ) of a noncompact G is not admissible.”

**Claim:** The regular-representation and distribution examples fail dualizability/invertibility/admissibility for every allowed Λ; the open-disc extension by zero is always non-ULA.

**Witness:** Λ = 0 satisfies nΛ = 0. Every Λ-module and derived category is zero. The cited comparison is 0 → 0, the dualizing object is the unit 0, and regular invariants are the perfect complex 0.

**Exact repair:** Qualify these negative controls with nonzero coefficients, preferably the concrete choice Λ = F₃, p = 2, without restricting the general theorems. Apply the same qualification to distribution-based explanations at lines 203 and 587 where Λ is not fixed. Add the zero-ring control: K = 0 is invertible in the zero category; j_!0 is ULA; C_c(Q₂,0) is admissible with trace distribution 0. Over F₃, C_c(Q₂,F₃)^{Z₂} is the infinite direct sum indexed by Q₂/Z₂, and the open-disc extension has a specialization map F₃ → 0, so the intended nonexamples still discriminate. The existing tr.dist(0) = 0 Check already forces the zero-ring correction.

## R09 (P3) — An open of inertia is not necessarily the inertia of an open substack

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:1373`: “U the preimage of an open conjugation-invariant subset of G in the inertia”.

**Claim:** This supplies an example of VS9.12, whose hypothesis is an open substack U ⊂ X.

**Witness:** For X = BC₂ over a geometric point, In(X) = BC₂ ⊔ BC₂. The σ-component is open and nonempty. X has only empty/full opens, whose inertias are respectively empty/all of In(X).

**Exact repair:** Replace this Check with X = S ⊔ S, A = (Λ²,Λ³), U the first component: cc_X(A) = (2,3) restricts to cc_U(A|_U) = 2. If retaining the conjugacy-open example, describe only restriction of a section on In(X) to an open of In(X), not an application of the characteristic class of A|_U for an unspecified U ⊂ X. Pullback of the σ-component along the identity section is empty, which cannot yield that component's class 1 for the trivial representation.

## R10 (P2) — The free layer order reproduces the source's exposition

**Location:** `packages/VStackSheavesAndLisseCategoriesPartII/README.md:129`, 1031, 1391: “Layers VS8 and VS9 can be built in parallel once VS7 is available”.

**Claim:** The layer sequence is determined by the mathematical dependencies of the final targets.

**Witness:** VS8 is HKW22 §4.2's locally profinite examples; VS9 begins §4.3's trace formalism. Their Dependencies both use VS6/VS7, and VS9 does not use VS8. The README expressly confirms that their relative order is free.

**Exact repair:** Organize the universal trace theorem before its locally profinite applications: geometric foundations, exceptional operations, categorical/cohomological traces, the relative trace formula, locally profinite realizations, then character and action applications. Concretely the old layer order 6,7,9,10,8,11 has this dependency justification; renumber coherently and give an old → new mapping for moved IDs. Split out the geometry-free categorical prefix if useful. Do not invent a dependency from the general trace theorem to the examples. Check the moved targets' existing Needs: old VS9 and VS10 require no VS8 result, while VS11 requires both branches. This is the specific source-order policy test in the brief, not an objection to the forced VS6 → VS7 order.

## Verified sound

### Previous findings, checked first and then searched as patterns

| Previous finding | Repaired passage | Recheck and status |
|---|---|---|
| F01 | README 61: “the Check that the point of [∗/ℤ_p] is not a smooth atlas”; 62: “Relative adjoints and ULA calculus”; 64: “VS11.1 adapts the argument to [S/G_S]” | **Repaired.** Open head #1230 contains the Check in §VS0.2 and the two named subtargets in §VS1.1 and §VS5.2. The latter is correctly stated for Bun_G. All three old nonexistent slugs have zero occurrences. |
| F02 | README 38: “(g·h)(x) = h(g⁻¹xg)”; 1696: “I_(g·h, g·μ) = g ∘ I_(h,μ) ∘ g⁻¹” | **Partly repaired.** The action, characteristic-function image and substitution are correct in Conventions, VS8.10, VS11.2 and VS11.3. The new numerical witness lacks hypotheses: R04. |
| F03 | Suggested.lean 14–16: “Mathlib has pretilts, the untilt map and Fontaine's θ”; “Tau Ceti has perfectoid Tate rings and fields” | **Repaired.** Opened the declarations at the pins; rings/fields are not spaces or the v-site. The conclusion about missing headline carriers remains correct. |
| F04 | README 48: “line 203”; 51: “line 265” | **Repaired.** These locate Module.IsReflexive and FGModuleCat.rightRigidCategory exactly. Both names also passed fresh elaboration. |

The repair report contains no finding marked “not actionable in this package.” The new findings therefore do not reopen a settled exception. The earlier adversarial table was used only as evidence for its numerical rows; every one of the 65 target subsections, including its API, route and Checks, was read in this round. The scratch worklist and 65-row computed ledger retain the longer pass. The table below contains all seeded targets, headline theorems and targets touched by findings, rather than reproducing a catalogue in the comment.

### Seeded source sample

All fifteen requested targets were checked against their legal cached text, including hypotheses, numbering and printed page. None is flagged unverified in the manifest. Source support does not certify the additional package Checks or the omitted generality.

| Target | Text opened at its locator | Outcome |
|---|---|---|
| 6.8 Cohomologically smooth fine morphisms | GHW22 line 114, Definition 1.3(ii), p. 3; line 1092, Remark 4.6, p. 22; FS21 line 4205, Definition IV.1.11, p. 110 | Chart criterion, invertible-twist test and fine-map scope agree. |
| 7.6 Six-functor identities | HKW22 line 1087, P1–P5, p. 22; line 1108, BC1–BC2, p. 23; line 1165, Theorem 4.1.8, p. 24; GHW22 line 133, Theorem 1.4, pp. 3–4 | Adjunction/projection/base-change orientations agree; proper-comparison restriction is R01. |
| 8.2 Sheaves and smooth modules | HKW22 line 3604, Lemmas B.2.3–B.2.5, p. 74 | Compact-open idempotents, compact sections and completion agree. |
| 8.3 Distributions | HKW22 line 1215, Example 4.2.1, p. 25; line 3580, Appendix B.2, pp. 73–74 | Distributions are Hom of compactly supported locally constant functions, not just atomic sums. |
| 8.6 Classifying stacks are decent | HKW22 line 1229, Example 4.2.2, pp. 25–26 | Locally pro-p scope and existence of a smooth free-action chart are retained. |
| 8.10 Locally profinite quotients | HKW22 line 1306, Example 4.2.5, p. 27 | Decency, smooth equivariant modules and Haar-dual distribution formula agree. |
| 9.5 Reflexivity over truncated DVRs | HKW22 line 3512, Lemma B.1.1, pp. 72–73; line 3545, Lemma B.1.2, p. 73 | k > 0, arbitrary DVR and finite generation criterion retained; corrected exponent in proof. |
| 9.7 CoCorr | HKW22 line 1409, Definition 4.3.4, pp. 29–30; line 1519, endomorphisms of the unit, p. 31 | Composition, primed tensor target and internal Hom agree. R01 concerns reduced proper-map scope; R06 concerns a false Check. |
| 9.8 Dualizability | HKW22 line 1490, Proposition 4.3.5, p. 31 | Canonical map m and both directions agree, with evaluation/coevaluation orientation fixed. |
| 9.11 Inertia and characteristic classes | HKW22 line 1562, Definition 4.3.6, p. 32; LZ22 line 856, Notation 2.20, p. 18, and Remark 2.24, p. 20 | Inertia rather than the underlying stack is the target; scheme specialization agrees. |
| 10.2 Proper pushforward | HKW22 line 1615, Corollary 4.3.9, p. 33; LZ22 line 933, Corollary 2.22, p. 19 | Formula and dualizability hypothesis agree, subject to R01's narrowed proper-map class. |
| 11.2 Inertia of BG | HKW22 line 1702, §4.4, p. 35 | Adjoint quotient and invariant distribution identification agree; right/left torsor conversion is R03. |
| 11.4 Characteristic class equals trace distribution | HKW22 line 1712, Proposition 4.4.3 and proof, pp. 35–36 | Admissibility, Haar twist and trace operator agree. |
| 11.10 Inertia of a quotient | HKW22 line 1999, §4.6, pp. 41–42 | Fixed-pair quotient and Cartesian diagram agree. |
| 11.11 Universal local term | HKW22 line 2008, §4.6, pp. 41–42 | Passage to base G and specialization at g agree; the source's “in general” is lost in the Check (R06). |

Additional passages opened include Sch17 line 2109 (Definition 10.7), line 2118 (Remark 10.8), line 4118 (Definition 18.1), line 4132 (Proposition 18.3); Stacks07LT line 9463 (Tag 07LT); LiuZhengEnhanced line 3906 (Proposition 2.2.4, pp. 79–80); LiuZhengGluing line 2057 (Theorem 5.4, pp. 38–39); and LZ22's Grothendieck construction and trace functoriality. The source manifest has exactly eight cited works, all certified, with the versions distinguished. No new source or manifest entry was needed.

### Computed adversarial table

Here S is a geometric point when a finite-group or scalar calculation uses D(Λ); Λ is a nonzero allowed coefficient ring unless stated otherwise. Values test the actual constructions and countermodels; they are not claimed as proofs of the general theorems.

| Statement | Instances tried | Values computed on both sides | Result | Change |
|---|---|---|---|---|
| Conventions; 8.5, 8.10, 11.3 | Affine Q₂ group, Λ=F₅, μ(K)=1, g=diag(2,1); also p=3 and μ=0 | χ=2, δ_SR=3; correct integral 2·3=1, reversed 2·2=4. At p=3 both 1; at μ=0 both 0 | Action correct, witness overbroad | R04 |
| 6.2, 6.8 | f:BZ₂→S; q:S→BZ₂, Λ=F₃ | f^!Λ=Haar^∨ has rank 1; q-base-change Z₂→S has independent germs δ₀ and normalized Haar, dimension at least 2 at 0 | Invertibility alone on q does not imply smoothness | Keep geometric criterion; R08 for Λ=0 explanation |
| 6.9 | G=C₂,H=S₃,f₂(t)=(12),h=(123) | h f₁(t)=(12) versus f₂(t)h=(23); corrected h⁻¹f₁(t)=f₂(t)h⁻¹=(13) | Intertwiner direction wrong | R03 |
| 6.10, 6.11, 7.7 | q:S→BC₂ and sign over F₃ | q×_BC₂ S=C₂_S; Aut(q)=C₂; fibre actions 1 and −1, not both 1 | Proper/0-truncated does not remove 2-cells | R02 |
| 7.5 headline; proper boundary | f:BC₃→S, Λ=F₃,p=2 | H⁻¹(f_!Λ)=F₃; H⁻¹(f_*Λ)=0; H¹(f_*Λ)=F₃ | Distinguishes stacky homology/cohomology; f is not proper | R01 preserves this exclusion |
| 7.6 | f:two points→one, A=(Λ²,Λ), B=Λ³ | Projection formula ranks (2+1)·3=9=6+3; Hom adjunction ranks 3=2+1; internal Hom of ranks 2,3 gives 6 on each fibre | P3–P5 directions consistent | None |
| 7.8, 7.9 | Λ=0; also P¹ and two points | Comparison 0→0 is iso; K=0=unit invertible. For P¹, K=Λ(1)[2], integration sends generator to 1; for two points (a,b)↦a+b | General formulas valid; negative Checks fail at 0 | R08 |
| 8.1, 8.2 | T={a,b}, M=(Λ²,Λ); T=N; empty T | e_aM=Λ², e_bM=Λ, sections Λ³; for N, compact sections Λ^(N), sections Λ^N; for empty both 0 | Smoothness and completion separated | None |
| 8.3 | Three points; Z₂ with Λ=F₃ | Distribution (a,b,c) sends h to ah₁+bh₂+ch₃. Haar of 2ⁿZ₂ is 2⁻ⁿ≠0, including small balls avoiding any proposed finite support | Atomic-only model excluded | None |
| 8.4 | T=2, Λ=F₃ | f^*Λ=(Λ,Λ); f_!f^*Λ=Λ² has dimension 2 versus dim Λ=1 | Finite Check false | R05 |
| 8.6 | G=1,C₂,Z_p | B1=S; S→BC₂ has base-change fibre two étale points; S→BZ_p has profinite fibre with noninvertible distributions | Finite and infinite atlas behavior differs | None |
| 8.10 | T=empty; T=2,G=1; affine conjugation | H⁰=0=Hom(0,Λ); H⁰=Λ²=Hom(Λ²,Λ); Haar-conjugation multiplier 2·3=1 in F₅ | Quotient formula consistent | R04 only for numerical witness |
| 9.1, 9.4 | Λ⊕Λ[1]; Λ=Z/6,P=3Λ | Supertrace 1−1=0, not 2. Idempotent 3²=3; projective trace=3, native nonfree LinearMap.trace=0 | Sign and separate projective-trace supplier necessary | None |
| 9.5 | Λ=F₂[ε]/ε²,M=F₂; Λ⊕F₂; infinite-dimensional F₂-space | Dual of F₂ is εΛ≅F₂; bidual F₂. Λ⊕F₂ and bidual both length 3. Infinite direct sum has dual product and strictly larger bidual | Both directions; nonprojective/equal-characteristic case | None |
| 9.6, 9.7 | Two-point permutation; point with A=Λ²; C₂ action | Swap trace in Corr is empty. End(A)=M₂(Λ). For finite étale action α^!Λ=Λ=α^*Λ | Correspondence conventions valid, negative Check false | R06 |
| 9.8 | A=F₃²; A=F₃^(N) at S | D A⊗A→End A sends four matrix units to basis of a 4-dimensional space. Infinite case image finite-rank, identity infinite-rank | Both directions discriminate | None |
| 9.9 headline | Finite/infinite vector spaces at S; j_!F₃ on closed disc; Λ=0 | Finite dim 2: ULA and dualizable. Infinite case: identity not finite-rank, neither property. Disc specialization F₃→0 fails; for 0 it is 0→0, iso | Main equivalence passes; zero-coefficient negative fails | R08 |
| 9.10 | X=S,C=two points,A=Λ,u=(1,2); C=S,u=2 | General trace class (1,2) in Λ², integral 3; identity-correspondence scalar trace 2 | Missing C=S | R07 |
| 9.11 | A=Λ³⊕Λ[1]; BC₂; BS₃ | cc=3−1=2; BC₂ inertia has two components and trivial class (1,1); BS₃ components BS₃,BC₂,BC₃ | Inertia and sign correct | None |
| 9.12 | σ-component of In(BC₂); X=S⊔S,U=first | σ-component nonempty, identity-section preimage empty; corrected cc=(2,3) restricts to 2 | Original Check has wrong ambient open | R09 |
| 10.1 headline | Two points→S, identity correspondence; empty correspondence | Pushed object Λ² has trace 2=∫(1,1); empty correspondence gives 0=0 | Formula passes controls | R01 for generality |
| 10.2 headline | P¹→S; two points→S | Integrated cc=χ(P¹)=1+1=2; sum of two point classes 1+1=2 | Proper pushforward passes | R01 for generality |
| 10.3 headline | P¹,g(z)=az,a≠1; closed disc translation T↦T+p in char 0 | Fixed points 0,∞; local terms 1+1=2 and cohomological trace 1+1=2. Disc has no fixed point but trace 1 | Properness needed | None |
| 10.6 headline | Geometric field extension; disconnected doubled base | Point term 2 maps to 2; doubled base gives (2,2), not an unexplained scalar | Base-change map explicit | None |
| 10.8 headline | Perfect point, Λ=F₃[t]; perfected affine line translation x↦x+1 | Identity trace 1 on both sides; translation fixed equation 1=0 gives empty fixed loci and 0 local contribution on both sides | General coefficient range genuinely uses gap | None |
| 11.1 | G=Z₂,M=F₃; G=Q₂ regular; Λ=0 | Trivial K-invariants F₃ perfect; regular invariants F₃^(Q₂/Z₂) infinite rank; over 0 invariants 0 perfect | Admissibility criterion passes, negative control fails at 0 | R08 |
| 11.2 | C₂ and S₃; a right G-torsor | In(BC₂)=BC₂⊔BC₂; In(BS₃)=BS₃⊔BC₂⊔BC₃. Right formula φ(yg)=g⁻¹φ(y)g makes a(yg)=a(y)g | Geometric identification correct, convention needs repair | R03 |
| 11.3, 11.4 headline | C₂ sign over F₃; trivial Z₂; shift | cc and distribution both (1,−1); normalized Haar gives 2⁻ⁿ on 2ⁿZ₂ on both sides; shift negates both | Character comparison passes | R04/R08 for Checks |
| 11.5, 11.6 | Smooth curve U/S,Y_i=U; T=S; finite BC₂ | Modified Künneth left and right Λ(2)[4]; omitted twist gives Λ(1)[2]. Unit class 1; finite inertia trivializing class (1,1) | Twist and trivialization correct | None |
| 11.9 headline | T=S,A₁=Λ²,A₂=Λ³; A₁=Λ[1] | cc product 6=2·3; shifted value −3=(−1)·3 | Multiplicativity and Koszul sign | None |
| 11.10 | C₂ swaps two points; trivial action | Fix(c̃)={(a,1),(b,1)}, empty over σ; trivial action gives X×G before quotient | Cartesian inertia description passes | None |
| 11.11 | Same swap; positive-dimensional G_m acting on point | Universal terms (1,1) over identity, 0 over σ; finite étale α^!=α^*. For G_m, α^!Λ=Λ(1)[2] versus α^*Λ=Λ | Uniform construction valid, “only” false | R06 |
| 11.12 headline | X=S,G finite; swapping action | cc(trivial) pulls back to constant 1 on G, equal to universal term; swap gives (1,1) and empty σ-fibre on both sides | Quotient comparison passes | None |
| 11.13 | Affine z↦az+b near infinity | Fixed equation w(bw+a−1)=0. For a=1,b≠0: double root w=0. For a≠1: two simple roots | Isolated fibres do not imply étale family | Retain corrected étale hypothesis |
| Layer ordering | Existing Needs of VS8,VS9,VS10 | prerequisites(VS8) include VS6/7; prerequisites(VS9) include VS6/7 and no VS8; VS10 uses VS9 and no VS8 | Relative order not forced | R10 |

### Library evidence at the pins

Pins read from the manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declaration bodies/types were opened. A scratch file with all 24 Mathlib `#check @name` commands elaborated successfully in this round; there are no target declarations whose hidden section variables need checking.

| Declarations | Repository-relative pinned file and line | Relevant content/boundary |
|---|---|---|
| MonoidalCategory; SymmetricCategory | `Mathlib/CategoryTheory/Monoidal/Category.lean:161`; `Mathlib/CategoryTheory/Monoidal/Braided/Basic.lean:364` | Ordinary monoidal/symmetric categories, not monoidal bicategories |
| ExactPairing, coevaluation, evaluation, HasRightDual | `Mathlib/CategoryTheory/Monoidal/Rigid/Basic.lean:78`, 104, 107, 237 | Coev 1→X⊗Y; ev Y⊗X→1; triangle identities |
| Bicategory; Bicategory.Adjunction; Pseudofunctor | `Mathlib/CategoryTheory/Bicategory/Basic.lean:61`; `Mathlib/CategoryTheory/Bicategory/Adjunction/Basic.lean:89`; `Mathlib/CategoryTheory/Bicategory/Functor/Pseudofunctor.lean:57` | Bicategorical adjoints and pseudo-functors exist; the required monoidal bicategory does not |
| LocallyConstant; charFn; CompactOpens | `Mathlib/Topology/LocallyConstant/Basic.lean:212`; `Mathlib/Topology/LocallyConstant/Algebra.lean:92`; `Mathlib/Topology/Sets/Compacts.lean:777` | Native locally constant functions impose no Hausdorff/local compactness; charFn uses clopen, compact opens carry compactness/openness. README adds locally profinite hypotheses. |
| Module.Dual; Dual.eval; IsReflexive | `Mathlib/LinearAlgebra/Dual/Defs.lean:61`, 70, 203 | Linear dual, evaluation, bijectivity of evaluation |
| instIsReflexiveOfFiniteOfProjective; instFiniteDimensionalOfIsReflexive | `Mathlib/LinearAlgebra/Dual/Lemmas.lean:262`, 284 | Finite projective case, and converse over a field; not the nonprojective truncated-DVR theorem |
| IsDiscreteValuationRing; maximalIdeal; Module.Finite | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:56`; `Mathlib/RingTheory/LocalRing/MaximalIdeal/Defs.lean:30`; `Mathlib/RingTheory/Finiteness/Defs.lean:121` | DVR is a nonfield local PID; quotient exponent must be positive; finite generation is native |
| LinearMap.trace | `Mathlib/LinearAlgebra/Trace.lean:75` | Finite-basis trace, zero otherwise; cannot substitute it for general projective trace |
| FGModuleCat; rightRigidCategory | `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:57`, 265 | Finite-dimensional modules over a field form a right rigid category |
| DerivedCategory | `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | Ordinary derived category with the required existence instance; no monoidal derived-category structure at this pin |
| TauCeti.IsSmoothDiscrete | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:259` | Discrete topology and open stabilizers on a topological representation; not a v-stack or étale category |
| PreTilt; PreTilt.untilt | `Mathlib/RingTheory/Perfection.lean:623`; `Mathlib/RingTheory/Perfectoid/Untilt.lean:49` | Ring perfection and multiplicative untilt, not perfectoid spaces |
| IsPerfectoidTateRing; IsPerfectoidField | `TauCeti/RingTheory/Perfectoid/Basic.lean:86`; `TauCeti/RingTheory/Perfectoid/Field.lean:68` | Perfectoid algebraic/topological carriers, not the v-site |

Object searches at both pins found no perfectoid-space/v-stack/diamond carrier, cohomological-correspondence bicategory, or monoidal structure on DerivedCategory sufficient for these headlines. The native module-dual results do not subsume the finite-length nonprojective example in VS9.5. The finite-projective trace is correctly imported from AdicSpacesPartIII, rather than redeclared as the native free trace.

### Supplier resolution, ownership and gaps

The supplied board-package index was read before any absence conclusion. `roadmaps resolve` found no unresolved supplier names; every contract and every Needs line was then compared with the named supplier at main or the supplied open head. No upward edge, cycle or missing undeclared supplier was found. The report uses pull-request numbers only to identify the heads reviewed, not as proposed roadmap citations.

| Supplier examined | Resolved interface |
|---|---|
| VStackSheavesAndLisseCategories, #1230, `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md` | VS0.1; VS0.2 descent/shriek targets and point Check; VS1.1 ULA targets and relative-adjoint subtarget (line 286); VS1.2; VS4.2; VS5.2 torsion invariant subtarget (line 1390). F01's repaired descriptions match. |
| DiamondSixOperations, #927, `TauCetiRoadmap/DiamondSixOperations/README.md` | S0.1–S0.2, S0.4; S1.1–S1.5; S2.3–S2.4; S3.1–S3.4; S4.1–S4.5; S5.4–S5.5. Exceptional functors and distribution pullback are supplied in the representable range. |
| DiamondsAndVStacks, #820, `TauCetiRoadmap/DiamondsAndVStacks/README.md` | D4.1, D4.6, D4.7, D4.10; D5.1, D5.2, D5.12, D5.14; D6.4–D6.5. Each named slug exists; stack and representability hypotheses were retained. |
| EnhancedDerivedSheaves, main, `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` | E1.4 (580), E3.2 (1153), E3.4 (1229), E5:abstract.1 (1440), E2.6 (2293). E3.4's ringed diagrams/mates do not themselves provide the four general Liu–Zheng contracts. |
| EtaleDualityAndPerverseSheaves, #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md` | §§6.1–6.3, including CohCorr.pullbackAlong/restrictOpen. The finite-ring, bounded constructible finite-Tor range at line 6292 is smaller than the two declared scheme contracts. |
| AdicCoefficientsAndComparisons, #965, `TauCetiRoadmap/AdicCoefficientsAndComparisons/README.md` | L1/char-p-scheme-diamond-and-comparison-functor, L1/comparison-pullback; all four named L3 comparison/adjoint/full-faithfulness/shriek targets. |
| SchemeAndStackFoundations, main, `TauCetiRoadmap/SchemeAndStackFoundations/README.md` | §0.23a (1658), §0.24 (1714), perfection_universalHomeomorphism (1728); actual main numbering checked again. |
| SmoothRepresentationsOfLocalGroups, #1688, `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` | Compact-open invariants (767), unit pro-order (791), averaging (832), Haar measures (1103); derived invariants (1739), compact generation (1797), derived smooth duality (1813); SR.2.1 induction/reciprocity; modulus (2047). Its δ uses inverse right translation, so χ=δ⁻¹ as stated here. |
| PivotalSpherical, AdicSpacesPartIII, DGAInfinity, main | Respectively Layers 2/7 (ordinary symmetric traces); §R3.8 projective-module-trace/projective-trace-realization; Layer 5 compact objects/perfect modules. These are imported, not re-owned. |

Three main-roadmap shapes were read: EnhancedDerivedSheaves, PivotalSpherical and DGAInfinity. The package is an extension of the base roadmap, not a replacement: decent/fine geometry, its enhanced exceptional functors and cohomological trace classes are its additions. The base's coefficient categories, ULA theory and smooth-representation comparison remain suppliers.

The six declared gaps have matching slugs in README lines 85–101 and the top-level gaps of `packages/VStackSheavesAndLisseCategoriesPartII/design/plan.json`. They name eligible earlier owners and precise source hypotheses. The four EnhancedDerivedSheaves extensions are operation data, partial adjoints, restricted-nerve comparison and descent; the two scheme extensions enlarge the coefficient and complex range. They are contracts, not unowned prerequisites. In particular Λ=F₃[t] is killed by 3 but is not a finite ring, witnessing the actual need for the scheme extension. No finding is raised simply because a promised gap is not implemented.

Ownership searches used `roadmaps grep` by objects, plus the scopes of the five closest heads from the overlap report. Base #1230, DiamondSixOperations #927 and AdicCoefficientsAndComparisons #965 supply the interfaces above; HeckeStacksAndLocalShtukas #1252 constructs Hecke/local-shtuka applications, not this general CoCorr theory. AnalyticStacks #1687 builds the analytic/light-condensed formalism, rather than this v-stack realization. There is a relevant cross-owner overlap: `TauCetiRoadmap/AnalyticStacks/README.md:9` claims the generic restricted-nerve theorems, and §0.3 at line 157 states the same Liu–Zheng comparison assigned here to EnhancedDerivedSheaves. For this package the existing declared contract keeps ownership with the earlier EnhancedDerivedSheaves; this package neither re-plans that theorem nor depends upward on AnalyticStacks. The later owner's claim does not invalidate this declared contract and is not counted as a package repair. No duplicate fully qualified Lean names can arise from this file, which declares none.

The overlap facts contain no other head changing this folder, no dropped cited IDs and no IDs available only from an unnamed revision. No order/rebase action is required for this package. The object search distinguishes scheme correspondences from v-stack correspondences, and classical/smooth representation trace operations from their geometric characteristic-class comparison.

### Dependency check, elaboration, headlines and padding

The prescribed dependency command was run without modifying the merge order. Its complete output was:

    depcheck: 236 roadmaps, 2140 edges, 0 problem(s)

No UPWARD, CYCLE or moved line. This is this round's output, not the earlier report's different graph counts.

The prescribed `lake env lean` invocation on `packages/VStackSheavesAndLisseCategoriesPartII/Suggested.lean`, from the pinned content checkout, exited 0 with no output and no warnings. It imports only Mathlib, so no Tau Ceti object build was needed. The fresh library-check file also exited 0. No process is left running.

| README headline | Suggested.lean treatment | Assessment |
|---|---|---|
| VS7.5 enhanced exceptional functors | Docstring names decent/fine v-stacks, enhanced D_ét and operation maps as missing | Correctly not stated |
| VS9.9 dualizable iff ULA | Docstring names CoCorr and monoidal bicategories/ULA as missing | Correctly not stated |
| VS10.1 relative Lefschetz–Verdier; VS10.2 proper characteristic pushforward | Docstring names CoCorr, proper maps and dualizing complexes | Correctly not stated; README scope needs R01 |
| VS10.3 Lefschetz formula; VS10.6/10.8 local-term comparisons | Docstring names diamonds, étale categories and local terms | Correctly not stated |
| VS11.4 characteristic class equals trace distribution | Docstring names classifying/inertia v-stacks and D_ét | Correctly not stated |
| VS11.9 Künneth; VS11.12 universal local terms | Docstring names quotient/inertia stacks and based correspondences | Correctly not stated |

The file has zero declarations, zero sorries and zero examples. Thus the required one-tactic probe ranges over zero theorems; it is not a sampled probe. The target `#check @name`/section-variable audit also has zero inputs. The 24 library checks are separate evidence for the README's imports. No headline is replaced by a free predicate, arbitrary-data theorem or boundary-case substitute. The native reflexivity/module preliminaries are auxiliary API, not missing headlines. No sorry'd data, set_option, extra imports or padding appears.

### Shape, conventions and process checks

All 65 targets have per-target Needs and source paragraphs. All six layers end with Examples and Dependencies. All 26 explicitly marked definition/construction API blocks have at least three Checks; their existence is not evidence of correctness, and R04–R09 repair specific failures. Every backticked native/supplier name was resolved in its intended namespace; the package attributes no undeclared Lean API name to its own empty file. `HaarMeasureWithValues` is explicitly a supplier's name.

No executable algorithm, copied source paragraph, machine path, HTML anchor, job/PR reference, process-date residue, LaTeX delimiter or forbidden Lean command was found in the package inputs. The words describing source corrections explain mathematical differences, rather than review history. Proper/stacky directions, left/right Haar conventions, dual shifts and trace signs were recomputed above. The own-organization requirement fails specifically at R10; a successful shape scan does not settle that requirement.

## Not verifiable

- No sampled source was inaccessible; no reference request or waiver was needed. All eight cited works were available legally and opened.
- General theorem proofs and all higher coherence diagrams are future library work; neither the passing empty signature file nor these small-instance computations prove them. In particular the all-proper-fine comparison lacks the planned argument identified in R01. No claim of certification of that missing argument is made.

## Source issues

- **Misprint** in GHW22 at §1.2(3), printed page 5: the source says the partial-adjoint result is Proposition 1.4.4 of the gluing paper; it should be LiuZhengEnhanced v4 Proposition 2.2.4, pages 79–80; affects nothing.
- **Gap** in HKW22 at Theorem 4.1.8, printed page 24: the source says GHW supplies the proper-fine comparison and all listed identities; it should be supplemented by formal derivations and a general proper-comparison argument beyond the stated representable agreement; affects the proof.
- **Misprint** in HKW22 at Definition 4.1.7 and surrounding GHW citations, printed pages 23–28: the source says GHW has the cited definition and proposition numbers for charts, fineness and smoothness; it should be cross-referenced to public v1 Definitions 1.1/4.1 and Propositions 4.5/4.8/4.14, with their actual chart hypotheses; affects a stated result.
- **Error** in HKW22 at Example 4.1.1, printed page 22: the source says maps BG→BH are homomorphisms G→H; it should be right H-torsors with commuting G-action, with homomorphisms describing chosen trivializations; affects a stated result.
- **Misprint** in HKW22 at Definition 4.3.4 tensor product, printed page 30: the source says the shriek target uses an unprimed first coefficient object; it should be the exterior product of both target, primed objects; affects a stated result.
- **Misprint** in HKW22 at the paragraph after Proposition 4.3.5, printed page 31: the source says FS21 IV.2.24 is the dualizability–ULA criterion; it should be Theorem IV.2.23 in the cited FS21 v4; affects nothing.
- **Error** in HKW22 at Example 4.3.10, printed page 33: the source says properness of X suffices for the arbitrary-correspondence trace formula; it should be supplemented by properness of the correspondence space over the base; affects a stated result.
- **Error** in HKW22 at the proof of Proposition 4.4.1, printed page 34: the source says the diagonal subgroup is a direct factor of G×G; it should be treated through compact induction and the homogeneous space (G×G)/ΔG, since nonabelian diagonal subgroups are not normal; affects the proof.
- **Gap** in HKW22 at equations (4.5.8)–(4.5.9), printed page 40: the source says functorial and monoidal compatibility is straightforward without providing the coherence checks; it should be justified by compatibility of modified Künneth maps with composition and base change; affects the proof.
- **Misprint** in HKW22 at the proof of Theorem 4.5.3, printed page 41: the source says the inertia fibre product has base In_S(T₁); it should be In_S(T), the single common base; affects the proof.
- **Error** in HKW22 at the closing remark of §4.6, printed page 44: the source says isolated fixed points in every fibre make the fixed-locus projection étale; it should be assumed étale, since w(bw+a−1)=0 has a double root when a=1 and b≠0; affects a stated result.
- **Misprint** in HKW22 at §5.3's trace-map reference, printed page 48: the source says the trace construction precedes Definition 4.3.5; it should be the discussion preceding Definition 4.3.6; affects nothing.
- **Misprint** in HKW22 at the proof of Lemma B.1.1, printed pages 72–73: the source says the relevant socle and induction quotient use exponent m−1; it should be k−1, where Λ=R/𝔪^k; affects the proof.
