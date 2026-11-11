<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12960#issuecomment-6789740343 -->
Review (codex) of 28102a4

Verdict: needs_changes

1. **F01** (P1) The principal almost-flatness criterion has no owner

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1814`: “almost flatness modulo `p` and GR, Lemma 5.2.1, give almost flatness”; the Needs line is at :1818.

   **Claim.** The proof of §4.4 can consume the principal generic/special-fibre almost-flatness criterion as an available input.

   **Witness.** GR03 line 5263 states a separate criterion with Tor hypotheses. `TauCetiRoadmap/PerfectoidSpaces/README.md:1747` supplies Tor characterizations; :2809 supplies only square-zero flatness. Neither supplies this principal localization criterion, and §4.4 names no target for it.

   **Exact repair, tested.** Declare a supplier gap, for example `gap:principal-almost-flatness`, at PerfectoidSpaces P0.11, in both the plan's top-level gaps and the README's Exact supplier contracts. Request this sufficient specialization of GR03 Lemma 5.2.1, printed pp.106–107: for a basic setup, an almost algebra C, an almost element f of C, and a C-module M, if multiplication by f is monic on C and M, M/fM is flat over C/fC, and M[1/f] is flat over C[1/f], then M is flat over C. Cite the contract in §4.4's Needs and explain its application to C=(A°[1/g])ᵃ, M=(B°[1/g])ᵃ, f=p in characteristic zero. The regularity gives the required Tor vanishing; after inverting p the extension is finite étale. In characteristic p the reduction modulo p is the original module, so this lifting step is unnecessary. Do not replace it with the Noetherian ordinary completion criterion: A°[1/g] need not be Noetherian. Test: C=M=ℤ, f=p satisfies the criterion. C=ℤ, M=𝔽_p has flat generic fibre 0 and flat reduction 𝔽_p, but Tor₁(M,𝔽_p)=𝔽_p and M is not flat; retaining the monomorphism hypothesis excludes it. The existing Nakayama gap does not provide flatness.

2. **F02** (P2) The trace proof identifies two different topologies in characteristic p

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1921`: “`ϖ`-adically, equivalently `p`-adically, complete … `ϖ^N ∈ pK°` for large `N`”. The theorem at :1897 permits characteristic-p perfectoid fields.

   **Claim.** The p-adic and pseudouniformizer-adic topologies agree throughout §4.7.

   **Witness.** Let K be the completed perfect closure of 𝔽_p((t)), ϖ=t, A=K, g=1, B′=K. Then pK°=0 but tᴺ≠0 for every N. The p-adic topology is discrete; the t-adic topology is not.

   **Exact repair, tested.** Split the proof by characteristic. In characteristic zero, state the two divisibilities and invoke the declared complete-module Nakayama contract. In characteristic p, reduction modulo p is the identity; the already obtained almost-surjectivity modulo p is the desired conclusion. Add this case as a Check: the trace of K/K sends 1 to 1, and the split trace K²→K sends (1,0) to 1, at p=2 and 3. Preserve the theorem in both characteristics. Apply the same qualification at README:311: “contains no … pⁿ” is false in characteristic p, where pⁿ=0 for n≥1; the argument about nonzero ϖⁿ remains valid.

3. **F03** (P2) Perfectoidness of the free root algebra has a second owner

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1312`: “Prove … that the root algebra `A⟨g^{1/p^∞}⟩` (§2.8) is perfectoid”; ownership is also asserted at :57 and :98.

   **Claim.** Perfectoidness of this root extension over a perfectoid base is new work owned by this roadmap.

   **Witness.** Open PR #1042, `TauCetiRoadmap/PerfectoidQuotients/README.md:1202`–:1212, §1.4, constructs `monicRootPair(A,A⁺,P,π)` and asserts its perfectoidness. Set A⁺=A° and P(X)=X−g: its generic fibre is this same free root algebra.

   **Exact repair, tested.** Import this perfectoid specialization from PerfectoidQuotients §1.4 in Scope, Exact supplier contracts and §3.2's Needs, and delete it as a separately owned theorem. Retain §2.8's construction over arbitrary uniform A, and §3.2's comparison with its uniform quotient, extremal-epimorphism description and marked tilt element, explicitly distinguishing that comparison from the supplied perfectoidness theorem. PerfectoidQuotients is earlier in the merge order and does not consume this Part II. The objects agree by their universal property for a root h₀=g and adjacent roots hᵢ₊₁ᵖ=hᵢ. For g=0 both uniform constructions return A; for A=ℂ₂ and g=1 their first root stage is ℂ₂×ℂ₂, with four idempotents and two evaluations h₁=±1. Thus a selected branch cannot distinguish the constructions. Over A=K⟨X⟩ in characteristic p the broader §2.8 construction is not perfectoid, so that general construction remains genuinely additional. The previous repair correctly imported PerfectoidSpaces P1.30, but did not resolve this second overlap.

4. **F04** (P3) The new Nakayama Check is not a map of modules over its stated base

   **Location.** `packages/PerfectoidSpacesPartII/README.md:314`: “in the classical setup `V = m = ℤ_p`, the inclusion `ℤ_(p) → ℤ_p`”.

   **Claim.** This inclusion tests the failure of complete-module Nakayama when its source is incomplete, as a morphism of ℤ_p-modules.

   **Witness.** Choose α∈ℤ_p∖ℚ. Linearity of the inclusion would require the image of α·1∈ℤ_(p) to equal α. Every element of ℤ_(p) has rational image, a contradiction.

   **Exact repair, tested.** For this Check use V=m=ℤ_(p), I=pV, with the usual ℤ_(p)-module structures on source and target. The map modulo p is the identity 𝔽_p→𝔽_p; the target is p-adically complete, the source is not, and the map is not onto. Keep the next Check over ℤ_p, but explicitly start a new setup there. At p=2 and 3 the repaired reductions have respectively two and three elements. This changes the example, not the declared supplier contract.

5. **F05** (P3) The root-localization Check overlooks j=0

   **Location.** `packages/PerfectoidSpacesPartII/README.md:1445`: “For `R = K°/ϖ^r` with `T` acting by `0` … `R[j] = k_K[U^{1/p^∞}]`”. Section 3.5 allows j∈ℕ.

   **Claim.** That description of the stages holds also at j=0.

   **Witness.** Set r=1 and j=0, with every root of T mapped to 0. The relation T·U=ϖ⁰=1 forces 0=1. Thus R[0]=0, whereas k_K[U^(1/p^∞)] is nonzero.

   **Exact repair, tested.** Specify that all roots of T act by zero. State R[0]=0, and restrict the polynomial-ring description and positive-root-killing transition description to j≥1. The positive stages form a cofinal subsystem, so the limit remains k_K and the almost-isomorphism conclusion is unchanged. At p=2 and 3, j=0 gives the zero ring; j=1 gives k_K[U^(1/p^∞)], whose constant 1 survives to the limit. The negative-control scalar computation also remains valid: 1/p+1/p² is 3/4 or 4/9, less than 1, so ϖ^(1/p) does not kill [ϖ^(1/p²)] modulo ϖ.

6. **F06** (P3) The zero-divisor Kummer Check overlooks l=0

   **Location.** `packages/PerfectoidSpacesPartII/README.md:2442`: “the stages `A_{0l} = A[1/p][X]/(X^{p^l})` … contain the nonzero nilpotent `X`”.

   **Claim.** The class of X is nonzero at every permitted root level in this g=0 negative control.

   **Witness.** At l=0, p⁰=1, so A[1/p][X]/(X)=A[1/p] and [X]=0. At l=1, [X]≠0 and [X]ᵖ=0.

   **Exact repair, tested.** Qualify the nonzero-nilpotent assertion by l≥1 and state the l=0 value separately. For n=0 and k=𝔽_p, the l=0 algebra is ℚ_p; the l=1 algebras are ℚ₂[X]/(X²) and ℚ₃[X]/(X³). The intended reason for excluding g=0 from the normalized reduced tower is then valid without misdescribing its first stage.

7. **F07** (P3) Use the localized ideal, not every element being a unit

   **Location.** `packages/PerfectoidSpacesPartII/README.md:2427`: “since every element of `K°°_∞` becomes a unit”.

   **Claim.** This explains why almost faithful flatness becomes faithful flatness after inverting p.

   **Witness.** The ideal contains 0. Its image is still 0 in the nonzero field K∞ after inverting p, and 0 is not a unit. In contrast p maps to a unit.

   **Exact repair, tested.** Replace the clause with “p belongs to K°°_∞ and becomes a unit, so the extended almost ideal is the unit ideal”. Then an annihilated element x satisfies x=p⁻¹(px)=0. This proves precisely the required disappearance of almost-zero modules, including the zero scalar boundary, without changing §5.10's theorem.

Seven findings: one P1, two P2 and four P3; three blocking. The scope is a repairable Part II extension. The package's four input files were not changed. Lean elaboration passed, with exactly the six expected `sorry` warnings. The declared complete-almost-Nakayama gap is a valid supplier contract; its absence from the supplier is not a finding.

## Verified sound

### Previous findings checked first

The prior review's F01–F07 and the repair report were read before the new pass. None was marked not actionable. In the following table, README means `packages/PerfectoidSpacesPartII/README.md`. “Partly repaired” identifies a remaining pattern or a defect in new supporting text, rather than reasserting the original wording.

| Previous finding | Repaired passage | Result and recomputation |
| --- | --- | --- |
| F01, inverse-Frobenius norm | README:1274: “`|a|_n = |a|_sp^{p^n}`”; :1300: “The rescaled norms … all equal `q`”. | **Repaired.** For xₙ=t^(1/pⁿ), the rescaled values are all q=1/4 at p=2, or q=1/8 at p=3. The unrescaled supremum is 1. |
| F02, finite versus infinite transitions | README:2175: “For finite indices”; :2178–2179: “A transition with an infinite index is the filtered union of these finite-index transitions”. | **Repaired.** Degrees of ℚ₂(ζ₂), ℚ₂(ζ₄), ℚ₂(ζ₈) are 1,2,4; the union has unbounded degree. No other finite-freeness sentence was found asserting finiteness at infinity. |
| F03, perfected Tate algebra duplication | README:1310: “PerfectoidSpaces P1.30 with `R = A` and one variable”. | **Partly repaired as an ownership pattern.** The exact P1.30 duplication is removed, also in §§4.8 and 5.6. R03 identifies the further root-algebra specialization owned by PerfectoidQuotients. |
| F04, arbitrary coefficients called perfectoid | README:1201 calls it the “completed algebra”; :1220 uses `A = K⟨X⟩` as a negative Check. | **Repaired.** Frobenius only produces X-exponents divisible by p, so X has no root at p=2 or 3. For A=K the perfected-coordinate algebra is perfectoid. |
| F05, complete Nakayama ownership | README:301: “What PerfectoidSpaces must provide (gap:complete-almost-nakayama)”; :1923 names that gap. | **Partly repaired.** The precise contract and both §3.3/§4.7 dependencies are now declared, and match `packages/PerfectoidSpacesPartII/design/plan.json:4077`. R02 and R04 concern new justification and a new Check; the contract itself passes. R01 is a different remaining unowned-input pattern. |
| F06, zero root index in the functor Check | README:532 fixes “`k = 1`”; :536 computes the boundary “`k = 0` with `ϖ = p`”. | **Repaired.** x⊗p=0, while x⊗p^(1/p)≠0 over 𝔽_p for nonzero x. The same zero-index pattern elsewhere gives R05 and R06. |
| F07, obsolete rigid-space owner | README:125: “belongs to AdicSpacesPartV §1.7”. | **Repaired.** Open PR #2133, `TauCetiRoadmap/AdicSpacesPartV/README.md:447`, is the normal rigid-space extension theorem. Constant 1 extends; 1/T has norms q^(−n) and fails boundedness. This is a scope comparison, not an upward Needs edge. |

### Principles, organization and shape

I read the six layers, every target and its Checks, all supplier and Needs lines, conventions, examples, source corrections, references, the 440-line Lean file, metadata and all five source entries. Untouched assertions were inherited from the earlier adversarial pass only where it recorded actual computed values; in particular §§2.1, 2.2, 2.6, 2.7, 3.5, 3.7, 4.2, 4.8, 5.3, 5.5 and 5.10 were examined afresh rather than inferred sound from an earlier summary. All changed passages were checked again.

This is general principal-divisor ramification theory, not a direct-summand-only shortcut: both characteristics, p=2 and 3, arbitrary perfect residue fields, zero finite étale algebras and infinite Kummer indices remain in scope. The root construction retains all branches. The base PerfectoidSpaces roadmap is imported; R03 is a localized ownership duplication, not a reason to reject the Part II scope. R01 identifies an unowned proof input. No computational algorithm, source transcription, sorry-valued data, `set_option`, executable-source instruction or process residue was found in the package text.

The shape was compared with main `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/ProfiniteCohomology/README.md`. Summary, Scope, Conventions, exact contracts, build explanation, six mathematical layers, Examples, Dependencies, consumers and references are present. Definition blocks have APIs and at least three Checks; defective examples are listed above. The source table is a bibliography guide, not the justification for the order: §1.2 consumes §0.1–§0.2, §3.6 consumes the uniform-algebra and localization work of Layer 2, §4.7 consumes §§3.7 and 4.4–4.6, and Layer 5 consumes the tube and purity theory. Those dependencies force the main order shared with the sources. There is no source-chapter layer title or claim that the plan follows a source. Metadata is `topic = "math.AG"`.

### Seeded source verification

All 15 requested targets were checked against their cached legal texts at their locators. There were no author-marked unverified locators. All five cited works have exactly one manifest key; André's published pagination is distinguished from the preprints. No source entry needed adding or rewriting. Source quotations are not reproduced here; the line numbers below refer to the supplied extractions.

| Target | Source, number, page and text opened | Hypothesis/direction check |
| --- | --- | --- |
| 0.4 linear functors | BHATT18 line 337, Lemma 3.6, preprint p.6 | A-linearity, not merely additivity, carries scalar-zero maps to scalar-zero maps; exactness is unnecessary. The repaired negative Check has k=1. |
| 1.1 annular tower | BHATT18 line 348, Notation 4.1, p.6; line 374, proof of Theorem 4.2, p.7; SCHOLZE12 line 1393, Lemma 6.4 | Completed all-root integral presentation and annular restriction direction agree. The element t is explicitly a nonzero topologically nilpotent element. |
| 1.5 extension after limits | BHATT18 line 119, Remark 1.7, p.3; line 427, Remark 4.4, p.7 | Derived limits and the no-regularity almost comparison support the formulation. Boundedness remains essential; this does not extend 1/g. |
| 2.5 Weierstrass localization/unit ball | ANDRE18B line 240, §1.2, formula (1), p.76; line 258, formulas (2)–(6), p.77 | Discrete and nondiscrete unit-ball formulas differ. Isometric multiplication is retained for the integral quotient formula. The printed conjunction error is not imported. |
| 2.9 roots as a uniform colimit of tubes | ANDRE18A line 1372, Proposition 2.9.2, pp.33–34; line 1395, Corollary 2.9.3, p.34 | Arbitrary uniform coefficient algebras are allowed; the repaired text no longer calls every coefficient-root disc perfectoid. |
| 3.2 perfectoid roots | ANDRE18A line 1533, Examples 3.2.3(1), p.37; line 2125, §3.6.1, pp.48–49 | Perfectoid base and extremal quotient direction agree with the source. The mathematics is supported; ownership still needs R03. |
| 3.4 perfectoid annuli | ANDRE18A line 2163, §3.6.3, formulas (3.12)–(3.15), p.49; line 2261, Proposition 3.6.1, formula (3.16), p.50 | All-root almost integral model and every j∈ℕ are supported. Strict quotient/spectral norm inequality is correctly restricted to j≥1. |
| 3.6 perfectoid Riemann extension | ANDRE18A line 2580, Theorem 4.2.2, pp.55–56; line 2619, Lemma 4.2.3, p.56 | Regular g with compatible roots, root saturation and finitely generated power-bounding module formulation agree. It is not replaced by Mathlib's multiplier definition without comparison. |
| 3.8 uniform perfectoid limits | ANDRE18A line 2760, Proposition 4.3.1, pp.58–59 | The implication diagram, characteristic restrictions and reduction conditions are retained. Constant and zero systems give identity comparisons. |
| 4.3 annular envelopes | ANDRE18A line 2969, Proposition 4.4.4, pp.62–63 | Finite étale algebra over A[1/g], annular base changes and recovery after inverting g agree. The algebraic-limit correction to proof (3), line 2991, is necessary and present. |
| 4.8 reduced-affinoid envelopes | ANDRE18A line 3201, §5.4, pp.68–69 | Chosen finite injective normalization and chosen g making the generic extension étale are explicit. Only almost perfectoidness is claimed for the saturated envelope. |
| 5.6 Kummer tower/tubes | ANDRE18B line 367, Lemma 2.5.1 and formulas (9)–(10), p.79; line 589, §3.1, p.83 | Coordinate roots, cyclotomic roots and g-roots all occur. The full normalized union is completed; no branch field is substituted. |
| 5.8 Kummer flatness | ANDRE18B line 385, Theorem 2.5.2, pp.79–82, including proof at line 485 | The completed tower is almost faithfully flat over the coordinate tower. §5.7 supplies the integral monic-model route avoiding the generic-fibre gap in the source's proof. |
| 5.10 generic faithful flatness | ANDRE18B line 563, Remarks 2.6.1(1)–(3), p.82 | The generic faithful-flatness consequence and nonzerodivisor assertion agree. R06 and R07 concern its Check and explanatory wording, not the theorem. |
| 5.12 ramified Kummer purity | ANDRE18B line 589, §3.1 and Theorem 3.2.1/Corollary 3.2.2, p.83; ANDRE18A line 56, Theorem 0.3.1, p.2 | The nonzero g, normalization, finite extension étale away from pg, ramified almost setup and modulo-pᵐ range are retained. |

The new complete Nakayama contract was also checked at ANDRE18A line 176, §1.3, printed p.5, and GR03 line 5509, Lemma 5.3.3, printed p.111. The separate flatness input in R01 is GR03 line 5263, Lemma 5.2.1, pp.106–107.

### Adversarial computations

Here q=|ϖ| with 0<q<1, and a root symbol denotes the adjacent compatible system specified in the roadmap. The 65 rows record actual values, images or kernels. These are tests of the statements and conventions, not claims that finitely many examples prove the general theorem. The table covers all sampled targets, all headlines, all changed patterns and every finding; it also fills the earlier review's uncomputed sections.

| Statement | Instances tried | Values computed on the two sides | Result / change |
| --- | --- | --- | --- |
| Native perfectoid predicate | ℚ₂, ℚ₃, ℂ_p and ℂ_p[ε]/ε² | Frobenius fixes 2 or 3 residue classes, but no integer valuation lies in (0,1/p]; v(p^(1/p))=1/p in ℂ_p. In the square-zero algebra every p^(−r)ε squares to 0 and their norms are unbounded. | Divisibility and uniformity exclude the wrong models. |
| 0.1 almost-pro-zero | Mₙ=K°/ϖ^(1/pⁿ), transition multiplier ϖ^(1/pⁿ−1/pⁿ′) | Multiplying the image by ϖ^(1/pᵏ) gives 0 iff n′≥k; k=n′+1 gives a nonzero class. A constant K° tower has scalar image ϖ^(1/pᵏ)≠0. | Precision-dependent stage retained. |
| 0.1 almost-pro-isomorphism | Identity and 0→constant K° | Identity kernel and cokernel are 0. The second cokernel is K°, with ϖ^(1/pᵏ)·1≠0. | The comparison is tied to the actual tower. |
| 0.2 uniform annihilation | Zero transitions; shrinking quotients with g=1 | Offset 1 kills all zero-transition images. For any fixed c, l>n+c gives exponent 1/pⁿ−1/p^(n+c)+1/pˡ<1/pⁿ, so the shrinking-quotient image survives. | Quantifier order is substantive. |
| 0.3 passage to limits | Constant residue module K°/K°°; zero-transition modules | Constant limit is the residue module, killed by every scalar of K°°; its lim¹ is 0. For zero transitions the difference map on the product is identity, so limit and lim¹ are 0. | Almost-zero limit claim, not ordinary-zero claim. |
| 0.4 linear functors | A-linear tensor/Hom versus the non-linear scalar-action example | F(tₖρ)=tₖF(ρ)=0. For ϖ=p, x⊗p=0 at k=0; x⊗p^(1/p)≠0 at k=1 for nonzero vectors over 𝔽_p. | F06 repaired. |
| 0.5 derived tensor | Scalar-zero map on R[−1]⊕R[−2] | Tensoring preserves the zero scalar map on both summands: both induced maps are 0, with the same offset. | No amplitude-dependent weakening. |
| 1.1 annular direction/presentation | g=T, q=1/2, n=1,c=1; g=1; g=0 | Inner radii 1/2 and 1/4 give restriction from the larger domain to the smaller. u_(n+c)^(1/p) maps to t^(c/p)uₙ^(1/p); at g=1 both sides equal t^((n+c)/p). At g=0 the localization is 0. | Directions and zero ring agree with the native maps. |
| 1.2 kernel headline | g=1; g=(T,0), a=(0,1); m=0 | Kernel=0 at g=1. In the product fₙ(a)=0 but tₗa≠0 modulo tᵐ for sufficiently large l; almost regularity fails. At m=0 the quotient is 0. | Regularity is necessary and is in the Lean type. |
| 1.2 exact cokernel offset | p=2,3 and (k,m)=(0,1),(1,1),(2,2) | c=pᵏm gives 1,2,8 and 1,3,18; c/pᵏ=m in all six cases. Exponents e≥1/pᵏ gain at least m powers of t; e<1/pᵏ leaves nonnegative exponent 1/pᵏ−e on g. | Exact bound retained at both small primes. |
| 1.3 derived/Koszul headline | Sequence (0) versus a regular element x | K(0) has H₀=H₁=R; K(x) has H₁=0 and H₀=R/x. Scalar-zero comparison maps remain 0 after tensoring. | Homology vanishing retains weak regularity. |
| 1.4 no-regularity headline | g=(T,0), a=(0,1); g=0; m=0 | tₖa may survive, but gₖtₖa=(0,0). At g=0 the multiplier is 0. At m=0, t⁰=1 and b=gₖtₖa solves the divisibility equation. | Correct product annihilator; no leaked regularity binder. |
| 1.5 limit headline | Laurent monomial aT^(−r), r>0; constant 1 | Annular norm is |a|q^(−jr), unbounded unless a=0; constant 1 has norm 1 at every stage. | Bounded extension excludes 1/T. |
| 2.1 p-root closure | 𝔽_p[T]⊂𝔽_p[T^(1/p)]; ℤ⊂ℤ[i], p=3 | (T^(1/p))ᵖ=T, so closure is the larger ring. Imaginary part of (a+bi)³ is b(3a²−b²); its vanishing forces b=0. Thus 3-root closure is ℤ although i is integral. | Root closure differs from integral closure. |
| 2.1 localized complete closure | ℤ⊂ℤ[1/2], s=a/2ᵉ reduced | 2ᵐsⁿ integral for every n requires en≤m for every n, hence e=0; closure is ℤ. For s=1 choose the module ℤ·1. | Finite-module formulation and denominator bound agree. |
| 2.2 norm/unit-ball dictionary | Lattice K°[T,ϖ⁻¹T²] in its completion; standard spectral field | Gauge gives |T|=1, |T²|=q; spectral radius of T is √q. In K, |ϖ|=q and |ϖ²|=q². | Ordinary gauge need not be spectral; the spectral hypotheses matter. |
| 2.3 root saturation | Perfectoid disc, g=T, b=1 or 1/T; product g=(T,0) | T^(1/pᵏ)·1 is integral; T^(1/pᵏ)/T has negative exponent for k≥1. Localization kills the second product factor. | Ambient image is not silently treated as an inclusion. |
| 2.3 saturation may enlarge | A=K+closure(Σₘ T₁^(1/pᵐ)P), P=K⟨T₁^(1/p∞),T₂^(1/p∞)⟩ | T₂∉A but T₁^(1/pᵐ)T₂∈A for all m. | No general equality between A and its root saturation. |
| 2.4 quotient norm/restriction | K², g=(ϖ²,1), λ=ϖ, a=(1,ϖ²) | First factor dies. Quotient norm=q²; infₘ max(qᵐ,q^(2−m))=q. At q=1/2 these are 1/4 and 1/2. Restricting from λ=ϖ³ to ϖ kills (1,0). | Source's norm identity and unrestricted injectivity are correctly rejected. |
| 2.5 unit ball | f=T, λ=ϖ; f=ϖT, λ=ϖ² | First quotient has T=ϖU and unit ball K°⟨U⟩. In the second integral quotient v=ϖU−T is nonzero and ϖv=0. | Isometric multiplication is essential. |
| 2.5 coordinate convention | f′=f+λa, λ′=λu, |u|=1 | U′=(λ/λ′)U+(f′−f)/λ′ gives λ′U′−f′=λU−f; reverse substitution gives U. | Sign and both map directions agree. |
| 2.6 uniform limits | Constant connected diagram; empty diagram; annuli; discs rᵢ↑1 | Limits are A and the zero ring respectively. Negative Laurent coefficients satisfy |a_(−n)|≤Cq^(jn) for every j, hence are 0. The series ΣTⁿ/ϖ^⌊√n⌋ converges for r<1 but its norms tend to infinity as r↑1. | Bounded and algebraic limits differ as stated. |
| 2.7 uniform colimits | Discs with |T|≤qⁱ; constant system; isometric root inclusions | In the shrinking system lim|T|=0, so T dies in the separated colimit, giving K, although it survives algebraically. A constant system gives A; an element of norm q in an isometric system retains norm q. | Separation and isometry clauses are necessary. |
| 2.8 free roots | ℂ₂, g=1; characteristic-p g=0 | First stage ℂ₂[S]/(S²−1)=ℂ₂² has four idempotents, not two. For g=0, every root has a power equal to 0 and dies in uniformization. | All branches retained; nilpotents removed. |
| 2.9 tube colimit | f=T and f=0; characteristic-p A=K⟨X⟩ | Tube norms of T are ≤qⁱ→0; f=0 gives the whole algebra. Frobenius X-exponents lie in pℕ, excluding X in the arbitrary-coefficient root disc. | F04 repaired; colimit theorem keeps its generality. |
| 3.1 inverse-Frobenius norm | p=2,q=1/4; p=3,q=1/8 | Raw supremum of q^(1/pⁿ) is 1; every rescaled coordinate norm is q, equal to the counit norm. | F01 repaired. |
| 3.1 coreflection | Characteristic-p K⟨X⟩ and perfect K | An X-exponent divisible by every pⁿ must be 0. Thus the first coreflection is K, with non-surjective counit; the second is K with identity counit. | Excludes a quotient interpretation. |
| 3.2 root specialization/ownership | P(X)=X−g in PerfectoidQuotients §1.4; g=0,1 | Both constructions impose h₀=g and hᵢ₊₁ᵖ=hᵢ. At g=0 both give A; for ℂ₂,g=1 both have the four first-stage idempotents and evaluations ±1. | R03: same object, not different branches. |
| 3.3 almost perfectoid | B=K+(T₁^(1/p∞)P)⁻+(T₂P)⁻⊂P | T₁^(1/pᵏ)(P/B)=0 for every k, but T₂∈B and T₂^(1/p)∉B. | Almost perfectoidness does not imply perfectoidness. |
| 3.4 annular norm boundary | j=0,1; p=2,q=1/4; p=3,q=1/8 | Spectral norm of (ϖʲ/T)^(1/p) is 1. Quotient norms at j=1 are 2 and 4; at j=0 both are 1, since T^(−1/p)=T^(1−1/p)U. | Strictness range is correctly repaired. |
| 3.5 root limit | r=0; all T-roots=1; all T-roots=0, r=1 | First case all rings=0; second R[j]=R. Third R[0]=0, positive stages=k_K[U^(1/p∞)], positive-stage limit=k_K; the claimed stage-zero polynomial ring is nonzero. | R05; cofinal limit is unaffected. |
| 3.5 annihilator | p=2,3, r=1, T-roots=0 | ϖ^(1/p)[ϖ^(1/p²)] has valuation 3/4 or 4/9<1, so is nonzero modulo ϖ; the T-root part of the declared almost ideal acts as 0. | Ramified ideal is essential; valuation ideal alone does not work. |
| 3.6 closure headline | g=1; disc g=T, b=1 or 1/T | At g=1 both sets=A°. For b=1 a cyclic module bounds all powers. Powers T^(−n) escape every finite denominator bound, and T^(1/pᵏ)/T is nonintegral. | Both membership and nonmembership agree. |
| 3.7 maximal subalgebra | Perfectoid disc g=T; g=1; characteristic-p tilt | Saturation of the disc unit ball is itself; maximal perfectoid algebra is A, while 1/T is excluded. At g=1 the saturation and coreflection are identities. In characteristic p sharp/tilt identify these same elements. | Maximality statement uses continuous structure maps. |
| 3.8 limit comparison | Constant A and zero perfectoid diagrams | Limits=A and 0; reduction comparisons and Frobenius linearizations are identities, cokernel=0. | Consistent with the source's implication diagram. |
| 3.9 lim¹/non-nested control | Rᵢ=(K°/ϖ)[X], successors X↦0, T↦1 | 1↦1, X↦0; cokernel contains X with ϖ^(1/p)X≠0. Images stabilize at constants, so lim¹=0. For the stated 12-bound, 12(1−1/p) is 6 or 8 at p=2,3. | Vanishing lim¹ alone does not give the required transition estimates. |
| 3.10 envelope recovery | Standard perfectoid annuli; zero system | Uniform limit of the standard annuli is A; localizing its j-th annulus gives A[j]. Both operations give 0 for the zero system. | Zero object and adjunction maps agree. |
| 3.11 nested-systems headline | Same standard and zero systems | Unit and counit are identity maps on A[j], and the unique map 0→0. | No extra faithfulness or nonzero assumption introduced. |
| 4.1 Galois-map convention | C₂ on A², e₁⊗e₂; regular S₃ torsor | Swap component of b·γ(b′) is e₁; of γ(b)·b′ is e₂. Tensor swap identifies them. All 36 delta tensors for S₃ map bijectively to 36 delta coordinates. | Nonabelian and factor-order checks agree with the supplier. |
| 4.2 Galois closure | Rank 1, separable quadratic, irreducible cubic with S₃ group; rank 0 | Closure ranks are 1,2,6 respectively. Rank-0 algebra is 0 and cannot be faithful over a nonzero base. | Rank stratification/faithfulness are substantive. |
| 4.3 envelope | B′=A[1/T], 0, or its split square | Envelopes are A,0,A². Norms of 1/T are q^(−j); it lies in the algebraic limit but not its bounded part. | Correct source repair retained. |
| 4.4 principal flatness input | Ordinary setup C=ℤ, f=p, M=ℤ or 𝔽_p | M=ℤ has Tor₁=0 and is flat. For M=𝔽_p, generic fibre=0 and reduction=𝔽_p are flat, but Tor₁=𝔽_p≠0 and M is not flat. | R01: own the criterion with the regularity/Tor hypothesis. |
| 4.4 almost étaleness | g=1; B=A or A² | Reductions are A°/pᵐ and (A°/pᵐ)², finite étale of ranks 1 and 2; m=0 gives zero quotients when admitted by a later theorem. | The conclusions match almost purity. |
| 4.5 ramified purity headline | Identity, zero, split cover; tame Y^ℓ=T, ℓ≠p | Equivalences return A,0,A². Derivative ℓY^(ℓ−1) is a unit after inverting T but vanishes at Y=0 when ℓ>1. | Ramification is not bypassed. |
| 4.6 envelope integral model | g=1 and the general coreflection inclusion | At g=1 cokernel=0. In general the asserted relation is kernel=0, m·cokernel=0, not cokernel=0. | Perfectoid coreflection and almost-perfectoid model are distinguished. |
| 4.7 trace headline | B′=0, A[1/g], A[1/g]² | Zero envelope=0 and A→0 is not injective. Identity trace sends 1↦1; split trace sends (a,b)↦a+b and (1,0)↦1. | Faithfulness restriction on injectivity/trace is correct. |
| 4.7 characteristic boundary | K=completed 𝔽_p((t))^perf, p=2,3 | pK°=0; tᴺ≠0 for every N. Mod-p trace is already the original trace. | R02: split the lifting argument by characteristic. |
| Complete Nakayama contract/Check | V=ℤ_(p), I=pV; ℤ_p→ℤ_p⊕ℚ_p | First reduction is identity on 𝔽_p but ℤ_(p)→ℤ_p is not onto. Second reduction is identity since ℚ_p/pℚ_p=0; its cokernel is ℚ_p≠0. | Contract passes; R04 corrects the first base ring. |
| Complete Nakayama almostness | K°°→K°, I=(ϖ); I=0 or I=V | Cokernel=k_K≠0 and K°°·k_K=0. For I=0 the reduction is the original map. For I=V an I-complete module must be 0. | Completeness and almost-surjectivity are correctly distinguished. |
| 4.8 affinoid envelope | B=A, A², 0; inseparable X=Yᵖ in characteristic p | At g=1 envelopes are P and P². Zero B cannot contain a nonzero normalization. For X=Yᵖ the derivative is 0 after any localization, so no g gives the required étale extension. | Chosen étale locus is an assumption, not a consequence for every normalization. |
| 5.1 module purity | Identity, diagonal R→R², ℤ→𝔽₂, ℤ→ℤ[i] | Tensor maps x↦x and x↦(x,x) have kernel 0. In ℤ→𝔽₂, 2↦0. Retraction a+bi↦a splits ℤ[i], but (2+i),(2−i) are two primes above 5. | Module purity differs from spectral universal injectivity. |
| 5.2 almost predicates | m=0, m=V; M=V, M=0, M=ℚ over ℤ | At m=0 every annihilation assertion is true. At m=V, scalar 1 forces actual zero. V tensors identically; 0 fails faithfulness on V≠0; ℚ⊗ℤ/2=0 although ℤ/2≠0. | Real predicates, not conclusion placeholders. |
| 5.2 almost purity | K°°→K° tensor K°/ϖ; multiplication by p | First tensor kernel is ϖK°/ϖK°°≅k_K, nonzero and almost zero. Multiplication by p modulo p is zero on a module not killed by all smaller root scalars. | Injectivity alone is insufficient. |
| 5.3 Krull detection | Noetherian local R, K=0 or S; non-Noetherian K° | K=0 gives s=0 and (1−r)s=0. K=S cannot kill a nonzero M⊗S. For R=S=K°, K=K°°, M=k_K, K·M=0 and K∩R≠0 but M≠0. | Noetherian hypothesis is essential. |
| 5.4 finite/infinite stages | n=0,k=𝔽₂,l=0,j′=1,2,3,∞ | Degrees over ℚ₂ are 1,2,4 and unbounded. Equal indices give the identity. | F02 repaired; infinite transitions are filtered unions. |
| 5.4 normalization/all branches | p=3, g=3; p=2,g=2,j=3,l=1 | If X³=3 then (X²/3)³=1/3, so X²/3 is not integral; normalization tests cannot admit arbitrary denominators. At p=2, X²−2=(X−u)(X+u), u=ζ₈+ζ₈⁻¹; e=(1+X/u)/2 has e²=e, e≠0,1. | Full reduced algebra, not a chosen root field. |
| 5.5 spectral norm/valuation ideal | Split idempotent e; p=2,3 | |e|=|1−e|=1 but |e(1−e)|=0, excluding multiplicativity on the full algebra. v(ζ_(p²)−1)=1/2 and 1/6. | Root indexing and product norm are correct. |
| 5.6 completed tower | g=1,n≥1 versus g=T₁,n=1 | Without coordinate roots Frobenius misses T₁ in the first example. In the second (g^(1/p^(j+1)))ᵖ=T₁^(1/pʲ), so g-roots supply coordinate roots. | Source's omitted-coordinate shortcut is excluded. |
| 5.7 integral tubes | j=k′,k′+1, p=2,3; bad f=0 | Monic reduction degrees are 1,2,3; basis ZᵃUᵇ has 0≤a<d and includes 1. With f=0 a nonzero U is killed by ϖ_(ik′). | Actual monic models meet the complete-flatness hypotheses. |
| 5.8 flatness headline | Dimension zero; split quadratic branch at p=2 | Torsion-free modules over the valuation base are flat; the completed full algebra has nonzero e and 1−e of norm 1. | Flatness does not require or imply a field target. |
| 5.9 purity headline | Identity; D→D²; filtered union | Tensor kernels are 0 for the identity and diagonal, with first projection a retraction. Every tensor-kernel element in the union has a finite-stage representative. | All finite/infinite indices remain in the statement. |
| 5.10 generic faithful flatness | p invertible; scalar 0 | Extended ideal contains p·p⁻¹=1 and kills only the zero module. Scalar 0 remains 0 and is not invertible in K∞. | R07 corrects the explanation. |
| 5.10 zero-root Check | g=0,l=0,1,p=2,3 | At l=0, [X]=0 and algebra=ℚ_p. At l=1, [X]≠0 with square 0 at p=2 or cube 0 at p=3. | R06. |
| 5.11 integral lower-shriek model | Split idempotent e and scalar unitized image | e has branch residues (1,0); the image of the unitized lower-shriek model has equal scalar residues. | S need not be the entire integral ring. |
| 5.12 ramified modulo-p headline | g=1; m=0; identity or split finite extension | At g=1 the ramified ideal becomes the valuation ideal. At m=0 both quotients are 0. For m≥1 the identity tensor kernel is 0, and the split diagonal again has kernel 0. | Correct almost setup and boundary range. |

### Pinned-library audit and Lean acceptance test

The content checkout is main at `697bab2d2362e98fd3e7fb618cba7001c9326784`. Its manifest pins Mathlib at `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti at `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following are library-relative paths at those pins. I opened the declarations and compared their hypotheses, rather than accepting the near-match tool's descriptions.

| Object inspected | Pinned declaration and file/line | Comparison |
| --- | --- | --- |
| Perfectoid Tate predicate | `TauCeti.Perfectoid.IsPerfectoidTateRing`, `TauCeti/RingTheory/Perfectoid/Basic.lean:86`; `isUniform` :102; `isReduced` :108 | CompleteSpace and T2Space are binders. Fields include bounded power-bounded elements and the pseudouniformizer/Frobenius conditions. These are native inputs, not local placeholder predicates. |
| Almost zero | `Module.IsTorsionBySet`, `Mathlib/Algebra/Module/Torsion/Basic.lean:214`; `TauCeti.Almost.BasicSetup.IsAlmostZero`, `TauCeti/RingTheory/Almost/BasicSetup.lean:252`, `isAlmostZero_iff` :261 | Every ideal scalar annihilates every element, not merely some scalar depending on the element. The predicates do not themselves impose completeness or finiteness. |
| Almost-module carrier | `TauCeti.Almost.Module`, `TauCeti/RingTheory/Almost/Module.lean:75`; `Module.toAlmost` :86 | A Serre localization of native modules. This supplies the category, not the missing almost-perfectoid and almost finite-étale algebra packages. |
| Finite-projective trace | `LinearMap.projectiveTrace`, `TauCeti/LinearAlgebra/Trace/Projective.lean:72`; cyclicity :96; equality with trace :118; base change :158 | Defined by dual-tensor contraction, with finite projectivity. On (1,0)(k×k), trace(id)=(1,0). |
| Ordinary trace | `LinearMap.trace`, `Mathlib/LinearAlgebra/Trace.lean:75` | The definition selects a finite basis if one exists and otherwise gives 0. It is not a replacement for the previous row at nonconstant rank. |
| Huber carriers | `PairOfDefinition`, `TauCeti/RingTheory/Huber/Basic.lean:163`; `IsPseudoUniformizer` :186; `IsTateRing` :213 | Pair of definition includes an open subring and finitely generated adic ideal. A pseudouniformizer is a topologically nilpotent unit. Tate alone does not assert completeness or Hausdorffness. |
| Boundedness and uniformity | `IsBounded`, `TauCeti/RingTheory/Huber/Bounded.lean:109`; `IsPowerBounded`, `PowerBounded.lean:121`; `powerBoundedSubring` :456; `isPowerBounded_of_isIntegral` :482; `topologicallyNilpotentIdeal` :598; `IsUniform`, `Uniform.lean:71` | Power boundedness is boundedness of all nonnegative powers; uniformity bounds the whole set. It is not automatic for a square-zero extension. |
| Rational-localization hypothesis | `HasDenominatorPower`, `TauCeti/RingTheory/Huber/LocalizationTopology/Basic.lean:311` | A power of the chosen ideal divided by the denominator lands in the localization's defining subring. The Lean signatures retain this presentation hypothesis. |
| Completed plus ring | `completedPlusSubring`, `TauCeti/RingTheory/Huber/LocalizationTopology/Plus.lean:117` | Closure of the image of the integral closure before completion, with a presentation-dependent completion type. This is the actual ring used in the Bhatt signatures. |
| Restriction map | `pairHomOfRationalSubsetSubset`, `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Localization/PlusComparison.lean:219` | A pair morphism from the larger rational domain's ring to the smaller one's ring. Its hIplus and power-boundedness hypotheses remain explicit. |
| Complete integral closure | `IsAlmostIntegral`, `Mathlib/RingTheory/IntegralClosure/IsIntegral/AlmostIntegral.lean:27`; `completeIntegralClosure` :32; `completeIntegralClosure_eq_integralClosure` :126 | Native definition uses a nonzerodivisor multiplier. The native equality requires a Noetherian domain and a fraction ring; it cannot close the root-saturation headline. The headline instead states the finite-submodule formulation explicitly. |
| Integral-closure finiteness | `IsIntegralClosure.finite`, `Mathlib/RingTheory/DedekindDomain/IntegralClosure.lean:175` | Assumes integrally closed Noetherian base and finite separable fraction-field extension. Kummer normalization applies it in the characteristic-zero finite components; it does not assert finiteness of the infinite union. |
| Flatness tests | `Module.Flat.iff_lTensor_injective`, `Mathlib/RingTheory/Flat/Tensor.lean:89`; `Module.FaithfullyFlat.lTensor_injective_iff_injective`, `Mathlib/RingTheory/Flat/FaithfullyFlat/Basic.lean:385` | The first tests finitely generated ideals; the second assumes faithful flatness. Neither proves the explicit Kummer flatness assertion from the supplied hypotheses. |
| Krull intersection | `Ideal.mem_iInf_smul_pow_eq_bot_iff`, `Mathlib/RingTheory/Filtration.lean:393` | Noetherian ring and finite module are required. §5.3 retains both, and its non-Noetherian valuation-ring Check fails the conclusion as expected. |
| Completion | `IsAdicComplete`, `Mathlib/RingTheory/AdicCompletion/Basic.lean:57`; `AdicCompletion` :172 | The former includes Hausdorffness; the latter is a compatible inverse limit of quotients and is not automatically complete for arbitrary ideals. The Kummer theorem uses the principal ideal (p) and explicitly supplies the scalar module structures. |
| Inverse versus direct perfection | `Perfection`, `Mathlib/RingTheory/Perfection.lean:40`; `PerfectClosure`, `Mathlib/FieldTheory/PerfectClosure.lean:68` | The former is adjacent inverse-root sequences; the latter is the quotient constructing the direct Frobenius colimit. Neither has the rescaled Banach norm built in. |
| Witt vectors and valuation | `WittVector`, `Mathlib/RingTheory/WittVector/Defs.lean:52`; `NormedField.valuation`, `Mathlib/Topology/Algebra/Valued/NormedValued.lean:47` | Native carriers are used. The Kummer theorems retain prime p, Field k, CharP k p and PerfectRing k p. The field criterion retains nondiscreteness and Frobenius, not Frobenius alone. |

Object searches, including tensor-injectivity and annihilation formulations rather than only names, did not locate a native general ring-purity or almost-faithful-flatness predicate replacing the small local definitions. Near matches for Kummer coordinates, polynomial quotients, integral closures and power series are construction APIs, not the tower theorems. Searches for the three distinctive headline names found no duplicate fully qualified declaration on main or in the available open roadmap heads.

The actual package was elaborated using the prescribed `lake env lean` command from the content checkout, passing the absolute input path to the command. Exit status was 0. The only warnings were `declaration uses 'sorry'` at `packages/PerfectoidSpacesPartII/Suggested.lean:97`, :145, :208, :252, :370 and :422. No Tau Ceti object file was missing, and no library build or update was run. The Lean header uses the pinned syntax `module`, `public import Mathlib`, and only six individual Tau Ceti modules used by the signatures. There is one module docstring, the required namespace, real definition bodies, and no option override.

A scratch copy with `#check @name` for all 23 named declarations elaborated successfully. I compared the resulting types with the README and the supplied signature inventory. No required binder disappeared: the perfectoid signatures retain complete Hausdorff topological algebras, continuous K-action and compatible roots; the closure equality retains regular g; Kummer purity retains all finite/infinite indices; the flatness theorem carries its actual inclusion-induced module structures. `Fin n` excludes out-of-range coordinates; p=0 and p=1 are excluded by primality, and the explicit boundary indices j=0,l=0 remain part of the construction. No signature change is requested.

The headline inventory is the list at README:35–40, checked against the module docstring and declarations:

| README headline | Lean disposition |
| --- | --- |
| §1.2 quantitative Riemann extension | Kernel at :97 and exact-constant cokernel at :145; assembled pro-object named in docstring as unavailable. |
| §1.3 derived form | Named at :39–45 as unavailable: the assembled presentationwise annular tower and its derived comparison must first be constructed. |
| §1.4 no-regularity form | Kernel at :208, with the product root annihilator; the cokernel at :145 already does not require regularity. |
| §1.5 limit form | Named at :39–45 with the missing assembled tower/limit. |
| §3.6 perfectoid Riemann extension | Finite-submodule complete-integral-closure equality at :252; uniform-limit clause named at :46–49 with its missing Banach localization diagram. |
| §3.11 nested systems | Named at :46–49; uniform limits and the category of compatible perfectoid annular systems are missing. |
| §4.5 ramified almost purity | Named at :50–52; almost-perfectoid and almost finite-étale algebra structures are missing despite the native almost-module category. |
| §4.7 perfectoid Abhyankar lemma | Named at :53–56; needs topologies on intermediate algebras and almost finite-étale algebra structures. Finite-projective trace is correctly recognized as native. |
| §5.8 Kummer almost faithful flatness | Stated at :422 on the explicit normalized tower's p-adic completion as a module. |
| §5.9 Kummer purity | Stated at :370 for all finite/infinite indices on the actual inclusion. |
| §5.12 ramified modulo-pᵐ theorem | Named at :57–60; the completion as an algebra over the ramified root setup, its integral closure and almost-purity structures are not yet supplied. |

No statable headline omission or stand-in was found. Missing structured diagrams are not replaced by arbitrary functions or free Prop-valued fields.

All six admissions were tested on a scratch copy with `solve | simp | rfl | infer_instance`; each alternative was required to close the goal. All six remained unproved, with errors at precisely those six goals and no import/elaboration errors elsewhere. The exact-lemma near matches were also read at the pin:

| Admission | One-tactic and exact-lemma comparison |
| --- | --- |
| `bhatt_riemann_extension_ker_almostZero` | None of the three tactics closes it. Native kernel identities give no root annihilation estimate. |
| `bhatt_quantitative_riemann_extension` | None closes it. Cokernel presentations do not supply the uniform offset pᵏm or the root-divisibility assertion. |
| `bhatt_kernel_without_regularity` | None closes it. The regular-kernel theorem has a hypothesis this statement deliberately lacks; native localization APIs do not supply the root-product bound. |
| `riemann_extension_completeIntegralClosure` | None closes it. The native Noetherian fraction-ring closure equality has different hypotheses and a different right-hand side. |
| `kummer_isPureHom` | None closes it. Injectivity of `Subalgebra.inclusion` before tensoring is strictly weaker than universal module injectivity. |
| `kummer_almost_faithfullyFlat` | None closes it. Native faithful-flatness lemmas require precisely the tensor properties this theorem is to establish. |

The two already proved support theorems construct the stage inclusion used by a headline and prove integrality needed for the actual ideal generators. They are not admitted examples or boundary-case padding. Every local backticked declaration name resolves, including the inductive constructors. No padding deletion is requested.

### Supplier direction, drift and ownership

The board package index was read first. It lists the other available packages and their branches; none supplies these constructions. The supplied overlaps inventory, freshly resolved citations, `roadmaps grep` searches by objects, and the scopes/current text of the closest open roadmaps were examined. No dropped cited id, unmapped renumbering, competing head editing this package, or dependence on numbering defined only by an unacknowledged revision was found. The resolver's old `Algebra.galoisTensorMap` lead resolves to the explicit alias at AdicEtaleGeometry A4.2, not an assumed native declaration. The resolver does not itself certify native names; those were checked at the pins as above.

All cross-roadmap supplier sections resolve on main or the authorized open head. The following ledger gives the concrete places read; paths in the first block are on main, so an open revision was not substituted as a supplier.

| Citation | Resolved location and contract |
| --- | --- |
| PerfectoidSpaces P0.1–P0.3 | `TauCetiRoadmap/PerfectoidSpaces/README.md:879`, :965, :1042: basic, root and valuation setups, including flatness of the tensor square of the almost ideal. |
| PerfectoidSpaces P0.6, P0.8–P0.9 | Same file :1262, :1447, :1562: almost elements, algebra structures and lower shriek on algebras; faithful-flatness preservation, not unrestricted flatness preservation. |
| PerfectoidSpaces P0.11–P0.12, P0.14 | Same file :1714, :1832, :2034: almost flatness/Tor tests, duals and traces, finite étaleness. The principal local criterion is not among them: R01. |
| PerfectoidSpaces P0.16, P0.25 | Same file :2161, :2199, :3029, :3074: inversion, basic-setup base change, faithfully flat descent and lower-shriek-shriek faithful flatness. |
| PerfectoidSpaces P0.26–P0.27 | Same file :3168, :3220, :3250: tight-ideal Nakayama and complete almost finite projectives, plus almost-zero limits/colimits. The separately declared complete-module gap is precise and not supplied by those narrower Nakayama statements. |
| PerfectoidSpaces P1.1–P1.2, P1.4–P1.5, P1.7, P1.11 | Same file :3583, :3702, :3843, :3965, :4079, :4355: perfectoid Tate rings, characteristic-p criterion, tilt/sharp, tilt of uniform rings and perfectoid fields. The sharp/gauge normalization at :4095 agrees with the repaired §3.1. |
| PerfectoidSpaces P1.24–P1.25, P1.27, P1.29–P1.30 | Same file :5049, :5101, :5197, :5289, :5423: integral/Tate dictionary, tilting, completed filtered colimits and perfected Tate algebras. P1.30 at R=A with one variable gives exactly the removed free-disc theorem. |
| PerfectoidSpaces P2.2–P2.4, P2.13, P2.16 | Same file :6207, :6235, :6427, :7391, :7652: approximation, rational localization/integral model, pair restrictions, completed tensor perfectoidness and almost plus-ring formula. |
| PerfectoidSpaces P3.10–P3.13 | Same file :8628, :8649, :8688, :8746: finite étale perfectoidness, almost equivalence, integral closures and almost purity. |
| PerfectoidSpaces P4.15.4 | Same file :11144: scope-only comparison with the general André cover; not a duplicate target of this Part II. |
| AdicSpaces §§2.2,3.1 | `Completed/AdicSpaces/README.md:378`, :461: rational subsets and rational localization. Native presentationwise plus rings supply the precise completion model in Lean. |
| AdicSpacesPartII R0.3,R0.4,R0.9 | `TauCetiRoadmap/AdicSpacesPartII/README.md:1769`, :2304, :2473, :4097: completed tensors, spectral seminorm, uniformization and Noether normalization. The last explicitly points through to RigidAnalyticGeometry §§1.1–1.2. |
| AdicSpacesPartIII R3.5,R3.9 | `TauCetiRoadmap/AdicSpacesPartIII/README.md:10370`, :12470: uniform/spectral norm criterion and Gel'fand maximum formula, with the zero-ring convention. |
| AdicEtaleGeometry A4.2,A4.2a | `TauCetiRoadmap/AdicEtaleGeometry/README.md:9246`, :9267, :9376: finite étale torsors, the alias for `TauCeti.MulSemiringAction.tensorToPi`, and semilinear descent. The roadmap's tensor-factor swap is explicit and matches the C₂/S₃ computations. |
| DerivedModuleAlgebra §0.K.1,§0.2,§1.T.1,§1.1 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:649`, :794, :38, :1865: Koszul complexes, derived tensors, the explicit old-id resolution to native module towers, and derived limits. The old tower id is mapped, not missing. |
| EnhancedDerivedSheaves E2:towers.2 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1401`: ordinary pro-zero towers, pro-isomorphisms and cofinality. Almost/uniform versions here are additional. |
| DerivedDeRhamCohomology §1.10 | `TauCetiRoadmap/DerivedDeRhamCohomology/README.md:536` at its supplied head: Noetherian, torsion-free, complete ordinary flatness criterion. The exact hypotheses used in §5.7 are present. |
| DeformationAndDerivedPatchingAlgebra §1.13 | `TauCetiRoadmap/DeformationAndDerivedPatchingAlgebra/README.md:304` at its supplied head: flat completion over a Noetherian base; faithfulness requires a Jacobson-radical condition. |

The closest-head ownership comparisons give:

- PR #1042, PerfectoidQuotients, `TauCetiRoadmap/PerfectoidQuotients/README.md:1114` (§1.3) and :1193 (§1.4): fixed-field integral root extensions and their monic-root generalization. The explicit normalized two-index Kummer flatness theorem is different, but the perfectoid root specialization is the same object, as R03 records. The scope-only comparison in this package does not settle that overlap.
- PR #1735, DirectSummandsAndBigCohenMacaulay, `TauCetiRoadmap/DirectSummandsAndBigCohenMacaulay/README.md:9` and :92: it consumes the ramification and purity theory and owns the direct-summand/big-Cohen–Macaulay applications. Its old RA.0–RA.5 vocabulary is not an id dropped by this repair. Its ramified-multielement gap is not a gap declared by this package.
- PR #816, PerfectoidTowers, `TauCetiRoadmap/PerfectoidTowers/README.md:3`–:55: quotient and tower-descent theory. PR #1209, RelativeFarguesFontaine, `TauCetiRoadmap/RelativeFarguesFontaine/README.md:3`–:30: relative period geometry. Neither scope owns the explicit Kummer flatness headline or the quantitative almost-pro estimate.
- PR #875, ClassicalAdicEtaleCohomology, `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:7`–:24: cohomology, trace and nearby-cycle comparisons; it imports perfectoid geometry rather than duplicating this ramification theory.
- PR #2133, AdicSpacesPartV, `TauCetiRoadmap/AdicSpacesPartV/README.md:447`: normal rigid-space Riemann extension, a correct scope-only deferral. PR #1085, PerfectoidShimuraVarieties, `TauCetiRoadmap/PerfectoidShimuraVarieties/README.md:448`: characteristic-p arbitrary-ideal Hebbarkeitssatz through AutomorphicBundles §10.3, likewise a scope comparison rather than an upward input.

The actual declared gap `complete-almost-nakayama` has a named supplier PerfectoidSpaces P0.26; its identical slug appears in the README and `packages/PerfectoidSpacesPartII/design/plan.json:4077`. Its one-sentence needs specifies a basic setup, ideal, both inverse-limit completeness isomorphisms and the reduction epimorphism. It asks for no finiteness or tightness already supplied by P0.26. Thus its ownership, precision and minimality pass; R04 concerns only the illustrative base ring.

The prescribed dependency command was run against the package README with `--name PerfectoidSpacesPartII --movable`, the provided merge order and the main content checkout. Its complete output was:

```text
depcheck: 236 roadmaps, 2136 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No merge-order file or tooling was edited. R01 concerns an undeclared proof input that a direction checker cannot detect; R03's proposed supplier is already earlier in that order.

## Not verifiable

- None of the sources needed for the seeded sample was unreadable. The fourteen source-correction claims were checked in the published cached texts and the separately cached original ANDRE18B preprint, reusing the same manifest work id. No reference request or waiver is needed.
- Ownership was checked against the supplied open-head index, the accessible roadmap tool texts and the board package index. No inaccessible named head was used as evidence of absence.

## Source issues

These source defects are already corrected or explicitly avoided by the package; they are not additional package findings.

- **Error** in ANDRE18A at Theorem 0.3.1(1), printed p.2, ANDRE18A line 61: the source says the envelope contains the base injectively for every finite étale algebra; it should be a structure map, injective under faithfulness; affects a stated result.
- **Error** in ANDRE18A at §2.6.2, printed p.28, ANDRE18A line 1158, and Lemma 2.6.3 proof, printed p.29: the source says the quotient norm is the infimum of rescaled powers; it should be the quotient Gauss norm, which is q² rather than q in the product example; affects a stated result.
- **Error** in ANDRE18A at Lemma 2.6.3 proof, printed p.29, ANDRE18A line 1190: the source says that infimum is at least one; it should be bounded below by the nonzero input's norm under the stated size hypothesis; affects the proof.
- **Error** in ANDRE18A at Remark 2.6.4(1), printed p.29, ANDRE18A line 1193: the source says all uniform-localization restriction maps are injective; it should be qualified, since restricting a product algebra can kill one factor; affects a stated result.
- **Misprint** in ANDRE18A at formula (2.17), printed p.26, ANDRE18A line 1005: the source says invert p in the integral middle term; it should be invert the pseudouniformizer, including in characteristic p; affects a stated result.
- **Misprint** in ANDRE18A at Lemma 2.5.3, proof of (2)⇒(6), printed p.27, ANDRE18A line 1086: the source says apply condition (1); it should be condition (2), since the scaled elements lie in B[1/g]; affects the proof.
- **Error** in ANDRE18A at Proposition 4.4.4, proof (3), printed p.63, ANDRE18A line 2991: the source says A[1/g] embeds into the bounded uniform limit; it should be the algebraic limit, because 1/T has unbounded annular norms; affects the proof.
- **Gap** in BHATT18 at §1.4 Notation, preprint p.3, BHATT18 line 149: the source says t has roots and matches p's norm in characteristic zero; it should be required to have norm strictly between zero and one in characteristic p too; affects a stated result.
- **Misprint** in ANDRE18B at §1.2.1, formula (2), printed p.77, ANDRE18B line 266: the source says the discrete-valuation condition with a misplaced conjunction; it should be the condition that the valuation is discrete; affects nothing.
- **Error** in ANDRE18B at introduction §0.6, printed p.74, ANDRE18B line 142: the source says the completed root algebra uses only cyclotomic and g-root integral closures; it should be the normalized stages also adjoining coordinate roots as in §§2.2–2.3; affects a stated result.
- **Gap** in ANDRE18B at Theorem 2.5.2, proof step (a), printed p.81, ANDRE18B line 485: the source says the generic-fibre flatness follows from flatness on affinoid polydiscs; it should be justified over the localized formal power-series base, for example through the integral complete-flatness argument; affects the proof.
- **Misprint** in ANDRE18B at Lemma A.2.1 proof, printed p.90, ANDRE18B line 888: the source says use the S-linear dual of S with values in R; it should be the R-linear dual, with a finite sum of evaluations giving one; affects the proof.
- **Misprint** in ANDRE18B at Annexe A.4, printed p.92, ANDRE18B line 947: the source says the intermediate-module arrow points from M′ to M; it should be the factorization M→M′→N, whose first map is almost pure; affects nothing.
- **Error** in ANDRE18B at arXiv v1 §5.5, preprint p.14, ANDRE18B line 741: the source says test module-map almost purity using a ring S absent from the data; it should be tensor the specified map M→N with every test module; affects a stated result; corrected in print at Annexe A.4, p.92.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "28102a48dc68965d10e7f33e91f2ef4f382226e7", "job": "REV-PKG-PerfectoidSpacesPartII~4", "model": "gpt-6-astra", "worker": "chris-10"} -->
