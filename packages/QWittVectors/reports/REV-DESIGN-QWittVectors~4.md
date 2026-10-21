<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/39#issuecomment-6305832594 -->
Review (codex) of a7f4b15

Verdict: needs_changes

1. **F01** (P1) A closed form need not be fixed coefficientwise by γ

   **Location:** `packages/QWittVectors/design/README.md:985`, and `packages/QWittVectors/design/plan.json:2817`: “commutativity follows because γ_i−id vanishes on cocycles modulo q^m−1”.

   **Claim:** The framed cohomology proof uses strict vanishing on cocycles to infer graded commutativity.

   **Witness:** For A=ℤ,R=ℤ[X,Y],m=2, ω=YdX+XdY is closed. Coefficientwise `(γ_X−1)ω=hXdY≠0` modulo h(h+2); also `dX·ω+ω·dX=hXdX∧dY=−d_H(XYdX)`, nonzero as a cochain.

   The nonvanishing can be checked by cancelling h in the power-series ring: divisibility of hX by h(h+2) would force the constant-coefficient equation X=2a₀ in ℤ[X,Y]. This is a counterexample to the proof assertion, not to graded commutativity of cohomology. The distinction is essential: the commutator displayed above is a boundary. Wagner Lemma 4.17, p. 61, wagner lines 3033–3052, must not be read as establishing the stronger coefficientwise assertion; its displayed inference at wagner lines 3042–3050 also needs a boundary-level justification in several variables.

   **Exact repair:** Replace the strict-vanishing sentence in both artifacts by a valid proof route showing that signed commutators of closed forms are boundaries. Register the required product homotopy or representative-comparison statement, with its hypotheses and dependency before `framedCohomologySystem`. A coordinate calculation to retain is the homotopy `K_X=−X(dX∧ι_X)`: on the witness it gives `K_Xω=−XYdX` and `d_HK_Xω=hXdX∧dY`. The full product claim must handle arbitrary closed forms, not merely degree-zero cocycles. Add the displayed two-variable nonzero-boundary computation as a negative-control Check; keep the general cohomology theorem and all primes.

2. **F02** (P2) Étale differential extension is stated for noncommutative DGAs

   **Location:** `packages/QWittVectors/design/README.md:822`, and `packages/QWittVectors/design/plan.json:2308`: “For a nonnegative DGA P and an étale map P⁰→S, the graded scalar extension S⊗_{P⁰}P admits exactly one extending differential.”

   **Claim:** `QWitt.differential_etaleDifferential` has no commutativity or central-degree-zero hypothesis on P. This design also uses associative, noncommutative DGAs, so “DGA” alone does not impose that hypothesis.

   **Witness:** Let B=ℤ[x], P⁰=B, P¹=B·u, d=0, u²=0 and ub=b(0)u. For S=B[x⁻¹], `S⊗_B P¹=S·u≠0`; any extending multiplication forces `u=(ux)x⁻¹=0`.

   Here P is the square-zero graded algebra of the B-bimodule with its usual left action and evaluation-at-zero right action; it is associative and unital. Thus the asserted scalar extension need not even admit the compatible graded algebra structure presupposed by “extending differential.” The source application is to commutative de Rham DGAs: Wagner Lemma 3.32 and its proof, p. 51, wagner lines 2561–2571, use the de Rham universal map and tensor of such algebras; the section's strictly graded-commutative setting is at wagner line 1802.

   **Exact repair:** State this auxiliary law for nonnegative graded-commutative DG B-algebras over a specified commutative base B, with strict odd alternation as in the de Rham convention, and for an étale B-algebra map P⁰→S. State that the extended differential is B-linear and extends d. This is the full source-supported class used here, not a restriction on the q-Witt base-change theorem. Put the generic extension in the ordinary de Rham supplier contract and cite it, retaining the named local specialization for P=Q_mΩ*. Add the square-zero skew bimodule as an excluded non-example. Do not impose commutativity on the framed complexes of Layer 8.

3. **F03** (P2) Intake gap sentences omit the mathematical hypotheses

   **Location:** `packages/QWittVectors/design/plan.json:3152`, `:3167`, `:3178`, `:3190`, `:3201`, `:3213`; corresponding introductions at `packages/QWittVectors/design/README.md:72`, `:74`, `:76`, `:78`, `:80`, `:82`. For example: “Required extension of DerivedModuleAlgebra §§1.5 and 1.8: cochain completion commuting with cohomology.”

   **Claim:** Each `needs` sentence is a precise supplier contract suitable for the intake announcement.

   **Witness:** The cohomology `needs` at plan.json:3178 names neither p nor h nor any torsion hypothesis. Its adjacent `detail` correctly requires all three degreewise conditions of Wagner Lemma 4.25, wagner lines 3198–3209.

   All six `needs` values are topic descriptions rather than statements of the missing interface with its hypotheses. In particular the Bockstein sentence omits termwise regularity and centrality, and the quotient sentence omits the homogeneous differential two-sided ideal. The detailed paragraphs are valuable and mostly precise, but the brief expressly requires the `needs` sentence itself to carry the contract. This is distinct from F01's settled external-owner work and is actionable in these two design files.

   **Exact repair:** Replace each `needs` with a self-contained one-sentence mathematical request, and mirror it in the README gap introduction. Preserve the detailed paragraphs. The required content is:

   | Slug | Hypotheses and conclusion that must survive into `needs` |
   | --- | --- |
   | cyclotomic-contract | Integral cyclotomic ideals for positive indices, m>1 for the prime-generator formula, distinct indices for intersections, and the prime-power/radical comparisons used for completion; do not request Mathlib's existing polynomial product identities. |
   | ordinary-derham | Exterior de Rham DGAs over arbitrary commutative bases, the correctly scoped étale extension from R02, and relative polynomial Cartier cycles in characteristic p without perfectness of the base; separate independent contracts if needed. |
   | cohomology-completion | Possibly unbounded ℤ[q]-complexes, h=q−1, prime p, degreewise bounded h-torsion and p-torsion-freeness of terms and cohomology, bounded h-torsion of their mod-p reductions, and the stated completion/cohomology comparisons. |
   | prismatic-frobenius | Perfectly covered A, prime p, finite-coordinate étale frames and the bounded q-de Rham prism; identify framed Frobenius and iterated décalage with completed scalar extension. Give the independent δ/PD-presentation comparison its own precise sentence/record if it cannot be stated as the same contract. |
   | dga-bockstein | An associative cochain B-DGA, commutative B and a central termwise regular parameter f; β_f, its signed derivation/square-zero/naturality laws and the regular-parameter change identity with the directions of F,V. |
   | dga-quotient | An associative cochain B-DGA and homogeneous two-sided differential ideal J; the quotient/projection universal property, generated differential ideals and preservation of the stated multiplication conditions. |

   Keep every existing supplier owner; if splitting an independent contract, update `neededBy`, target prerequisites and README slugs together. This repair requires no outside-folder edits or supplier implementation.

Reviewed on 2026-10-21. Three findings, all blocking: one P1 and two P2. These are repairable within the design. The design README, plan and source manifest were left unchanged. No supplier's absence, and no absence from the merge order, is treated as a defect.

**Previous finding reconciliation.** The specified `packages/QWittVectors/reports/REV-DESIGN-QWittVectors~3.md` is absent. The available `REV-DESIGN-QWittVectors.md` identifies itself as round 1, not round 3. Accordingly, the following reconciles every finding recorded in `packages/QWittVectors/reports/FIX-DESIGN-QWittVectors~4.md`; it does not pretend to quote the missing review.

| Repair-report finding | Status | Passage checked in the repaired design and independent result |
| --- | --- | --- |
| F01: missing actual supplier contracts, marked not actionable in this package | Settled; external work remains, not a blocking defect | README:70: “The following required interfaces specify their hypotheses and intended owners.” All six `gap:` records name suppliers, sections and detailed mathematical contracts, and resolve in the README. The binding brief permits these contracts before supplier implementation. R03 concerns their locally editable `needs` fields, not the settled request to create external suppliers. |
| F02: design position/package-path objection, disputed | Settled; design gate passes | README:86: “A `gap:` dependency specifies a required external mathematical interface.” The design gate independently places the candidate after HabiroCyclotomicCompletions and reports zero problems. The literal package-path invocation cannot read its absent input; both outcomes are recorded below. No merge-order change is required for this review. |
| F03: finite framing restriction | Repaired | README:21: “A frame consists of a finite list of coordinates and an étale A-algebra map A[T₁,…,T_r]→R; the map need not be finite.” The affected Layers 8–9, plan hypotheses and prismatic gap agree. README:879 computes `D(T⁻¹)=−q⁻¹T⁻²`. Cancellation of hT gives this value, and the localization is étale without being finite. Wagner §4.7, p. 57, wagner line 2831, has exactly the étale framing. |

For additional continuity, the available round-1 review's tensor-balancing correction is present at README:532; its general smooth comparison is now §9.7; its DGA quotient request is an owned gap; its missing printed pages and bhatt-scholze §2.3 manifest use are supplied. Its absence-of-suppliers and pre-intake-position objections are superseded by the binding gap and design-position rules. These observations do not reconstruct the unavailable round-3 report.

## Verified sound

**Coverage and principles.** Read all 52 targets in ten layers, all 162 named public API clauses, all 157 Checks, proof routes, conventions and supplier descriptions. The adversarial table below covers each target and its associated laws. The two mathematical exceptions are R01 and R02; R03 concerns the intake contract. No route-specific replacement, good-primes restriction, existing-roadmap replan, computational algorithm deliverable, copied source passage or reverse consumer dependency was found in the inspected design. The full smooth, frame-independent E∞ comparison of §9.7 agrees with Wagner Proposition 4.2, wagner lines 2692–2702, including all positive m and the ψ_{p^αd} twists. Its general-index tensor comparison correctly uses C_α, as justified by wagner lines 3694–3697.

**Seeded source audit.** All 15 selected locators were read in the cached legal versions. No target or manifest record is marked unverified or uncertified. No new work is cited by the design beyond its eight recorded sources, all readable. No source fetch or manifest modification was needed. Pages below are printed pages in the recorded version, not extraction page markers. Fourteen selected target blocks passed this source/hypothesis check; §7.7's headline comparisons pass, but its generic auxiliary API needs R02.

| Selected target | Text and exact locator read | Hypotheses, direction and result |
| --- | --- | --- |
| 2.1 Arithmetic Λ-rings | Hesselholt v3 Proposition 1.19, Definitions 1.21/1.23 and Lemma 1.24, pp. 17–19; hesselholt lines 711, 753, 787, 798 | W-coaction and counit, Adams operations and torsion-free converse agree. The converse is not used as the definition on torsion rings. |
| 2.4 Perfectly covered Λ-rings | Wagner v5 Remark 2.47/footnote, p. 32, wagner lines 1621–1643; Wagner–Habiro v2 §1.22(e), p. 12, wagner-habiro lines 493–498; Bhatt–Scholze v4 Lemma 2.28, p. 20, bhatt-scholze lines 778–790 | The three faithful-flat formulations and integer torsion-freeness follow with the stated Λ-structure; zero rings cause no contradiction. |
| 2.5 Relative perfection | Wagner v5 §2.45 and Remark 2.47, pp. 31–32; wagner lines 1573–1582, 1626–1628 | Right-factor action and linearization r⊗a↦ψ_n(r)a agree. Λ-structure on R is needed for the map, not for the twist. |
| 3.1 Absolute q-FV systems | Wagner v5 Definition 2.8/Remark 2.12, pp. 11–12; wagner lines 475–481, 546–549 | Includes nonunital R, positive levels, structural compatibility, additive V and multiplicative F; FV and VF have distinct coefficients. |
| 3.5 Localization and integer torsion | Wagner v5 Corollaries 2.20/2.22 and Lemmas 2.21/2.23, pp. 19–21; wagner lines 1006–1080 | Integer and Teichmüller localization, prime-specific torsion and boundedness agree; ghost injectivity retains torsion-freeness at primes dividing m. |
| 4.2 Relative q-FV systems | Wagner v5 Definition 2.40, p. 30; wagner lines 1504–1512 | Scalars use c_m; F fixes A[q], and V is A[q]-linear. No perfect-cover hypothesis is inserted. |
| 4.5 Relative base change | Wagner v5 Lemma 2.46 and proof, pp. 31–32; wagner lines 1583–1620 | Arbitrary Λ-base map, no flatness requirement; polynomial presentations address the nontrivial structural-map issue. |
| 5.2 Étale ghost pushouts | Wagner v5 Corollary 2.51, p. 34; wagner lines 1715–1730 | The twisted ghost square is both an ordinary and derived pushout for étale maps; it does not require the vertical ghost to be flat. |
| 5.3 Relative torsion and completion | Wagner v5 Remark 2.47, p. 32, wagner lines 1621–1643; Corollaries 2.22/2.24/2.26, pp. 20–22, wagner lines 1048, 1083, 1118–1121; §4.19, p. 63, wagner lines 3123–3127 | Perfect coverage and discrete derived p-completion are retained; completed base change, rather than uncompleted tensor commuting with a limit, is used. |
| 5.4 Finite type | Wagner v5 Corollary 2.39, p. 29, wagner lines 1485–1495; Lemma 2.46 proof, pp. 31–32, wagner lines 1588–1620 | Finite type is over ℤ and the finite-module argument uses finitely many variables. Filtered-colimit statements are separate. |
| 7.4 Prime Verschiebung differential identities | Wagner v5 §3.3/Lemma 3.4, p. 38, wagner lines 1849–1874; Langer–Zink July 2003 Lemma 1.5, pp. 19–20, langer-zink lines 601–645 | The general relative identity is the V-only adaptation; γ_p is first defined on the injective absolute V-image. The p=2 formula needs no division by 2. |
| 7.7 Differential base change | Wagner v5 Lemma 3.16, p. 42, wagner lines 2044–2050; Proposition 3.31/Lemma 3.32, pp. 50–51, wagner lines 2552–2595 | Both q-Witt comparisons and the extended differential agree. The arbitrary-P auxiliary statement drops the commutative context: R02. |
| 8.3 Framed Jackson derivatives | Wagner v5 §§4.7–4.8, p. 57, wagner lines 2842–2872; Scholze v1 §3, p. 6, scholze lines 291–304 | Divisibility by hT_i precedes cancellation; n=0 is treated separately; q=1 and Laurent-coordinate formulas check out. |
| 8.4 Framed difference complexes | Wagner v5 §§4.7–4.8, p. 57, wagner lines 2849–2872; Pridham v4 Definition 1.22, p. 9, pridham lines 371–385 | Koszul differentials, skew ordered-wedge product and distinct h=0 specializations agree. Associativity is not confused with graded commutativity. |
| 8.5 Framed Frobenius | Wagner v5 §4.9, p. 58, wagner lines 2882–2891; §4.28, p. 67, wagner lines 3292–3332; §4.31, p. 70, wagner lines 3452–3458; Pridham v4 Lemma 2.9, p. 15, pridham lines 635–642 | Perfect coverage gives reduced R/p and injectivity; H sends dT to T^(p−1)dT, C has the extra [p]_q, and both use q↦q^p. The arbitrary-base operator construction comes from the formal-étale argument, not a stronger interpretation of Pridham's comparison theorem. |

Supplemental reads checked the source-supported generality of the repaired framing, the cochain gap (wagner lines 3198–3227), the two Frobenius normalizations, the general smooth comparison, and the prismatic inputs (bhatt-scholze lines 3898–3909 and 4378–4380; wagner lines 3459–3466 and 3492–3517). Borger v6 §§1.16–1.18, pp. 12–13, borger lines 603–638, supplies the prime-set coalgebra/free-object context; Corollary 5.4, p. 26, borger lines 1323–1334, supports coprime prime-set decomposition. The apparent strict cocycle assertion was tested independently rather than accepted from the source proof.

**Adversarial mathematics pass.** Each row covers the headline, definitions, associated API and Checks. “No change” records the result of the concrete tests and scope review, not a formal proof of the entire target. Analytic compactness, Haar measures, Tate twists and DVR ramification formulas do not occur in these targets. Integer torsion, characteristic 2, relative scalar twists and cochain signs do occur and were tested explicitly.

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions | [0], [1], [2]; q=1; zero ring; two cochain coordinates | 0,1,1+q; ordered d¹(a,b)=D₁b−D₂a; right-factor scalars distinguish the twists | No change |
| 1.1 Truncation sets/ghost polynomials | ∅, {1}, {2}, Div(6) | {2} is excluded; w₆=x₁⁶+2x₂³+3x₃²+6x₆; empty carrier is singleton | No change |
| 1.2 Ghost criterion | ℤ, ℚ, 𝔽₂; n=1,2 | (0,1) has zero ghosts over 𝔽₂; integrality criterion needs lifts but injectivity needs torsion-freeness | No change |
| 1.3 Big Witt construction | Zero ring, ∅, zero-multiplication ℤ; τ(1)+τ(1) | Coordinates (2,−1) over ℤ; zero-multiplication input has componentwise addition and zero product | No change |
| 1.4 F,V,τ | n=1,2; coprime 2,3; τ(−1) | F₂V₂=2; V and τ coordinates give τ(−1)=−τ(1)+V₂τ(1) | No change |
| 1.5 p-typical comparison | a=0,1,2; p=2,3 | Div(p⁰) has length 1; last p=3,a=2 ghost is x₀⁹+3x₁³+9x₂ | No change |
| 1.6 Étale Witt comparison | Identity, empty S, S={1}, coprime 2,3 | Finite-set condition retained; zero/identity base-change squares and four coprime coordinates agree | No change |
| 1.7 Commuting-endomorphism Koszul | r=0,1,2; M=0; E₁₂,E₂₁ | Noncommuting pair gives d²(u₁)=u₁e₁∧e₂, so commutation is substantive | No change |
| 1.8 Arithmetic fracture | N=1,2; M=0,ℤ,ℤ[1/2] | Right side empty for N=1; ℤ[1/2] is missed by 2-completion alone | No change |
| 2.1 Arithmetic Λ-rings | ℤ, toric ℤ[T], putative identity Adams on 𝔽₂ | ψ₂(2)=2; ψ₂(T)=T²; δ₂(2)=−1 obstructs the proposed characteristic-2 coaction | No change |
| 2.2 Prime sets/free objects | Empty prime set, {2}, empty generators | Identity comonad, infinite 2-typical carrier, and free initial ring ℤ are distinct boundaries | No change |
| 2.3 Arithmetic perfection | ℤ, toric ℤ[T], perfect ring | Nonnegative rational exponents appear in the toric colimit; ψ₂ misses T before perfection | No change |
| 2.4 Perfect coverage | Zero ring, ℤ[T], ℤ[ε]/ε² with ψ_nε=nε | Toric ψ₂ has basis 1,T; dual-number map is nonflat mod 2; torsion-free alone is insufficient | No change |
| 2.5 Relative perfection | R=A for nonperfect A; ℤ[T]/ℤ; n=1 | Base linearization is invertible; polynomial ψ₂ misses T; compatibility with the Λ-base is required | No change |
| 3.1 Absolute q-FV systems | R=0,ℤ; levels 1,2 | FV₂(1)=2, VF₂(1)=1+q; replacing V by 2 fails | No change |
| 3.2 Absolute initial q-Witt ring | m=1,2; q=1; R=0,ℤ | Q₁=R; Q₂(ℤ)=ℤ[q]/(q²−1); specialization VF=2 differs from ordinary Witt restriction | No change |
| 3.3 Absolute ghosts | m=1,2,6; V₂(1) | First level-2 ghost kills 1+q; level 1 is identity; τ exponent m/d is correct | No change |
| 3.4 V-resolution | m=1,6,2^a; a=0,1 | −V₂V₃+V₃V₂=0; a=0 is the separate augmentation, with no negative level | No change |
| 3.5 Localization/torsion | R=ℤ,𝔽₂; m=1,2 | Nonzero V₂(1) has zero ghosts in characteristic 2; integer torsion hypothesis cannot be dropped | No change |
| 3.6 Absolute completion | m=1; zero and unit ideals; p-completion of ℤ | Zero ideal completion is identity, unit ideal completion zero; discreteness and bounded torsion remain distinct | No change |
| 3.7 Witt injection/exactness | R=0,𝔽₂; nonunital kernel; m=1,2,6 | Torsion ghost failure does not imply Witt injection failure; p-local factor maps retain q↦q^d | No change |
| 4.1 Λ-comparisons | ℤ, toric ℤ[T]; m=1,2 | c₂ misses T in the toric ring, while c_ms_m=ψ_m; no inverse is asserted without perfectness | No change |
| 4.2 Relative q-FV systems | R=A,0; toric T; m=2 | F₂(T)=T for the right scalar; a ψ₂-semilinear substitute would give T² | No change |
| 4.3 Relative quotient | A=ℤ[T], R=A[X], m=2; R=0,A | Odd-exponent coefficients in the image model are even; the TX half-coefficient detector distinguishes ε from 0 and the quotient kills the difference | No change |
| 4.4 Twisted ghosts | A=R=ℤ[T], m=d=2; m=1 | T⊗1=1⊗T² maps to T²; the reversed equality would force T⁴=T | No change |
| 4.5 Relative base change | A′=A,0; polynomial R; nonflat Λ-base maps | Identity and zero comparisons agree; no extra flatness is introduced | No change |
| 4.6 Perfect-cover comparison | R=A; ℤ[T]/ℤ; torsion R/ℤ | Existence of s,c is weaker than invertibility; relative perfection and perfect coverage are separate | No change |
| 5.1 Étale preservation | Identity, level 1, nonflat quotient | Étale q-Witt factor is flat, justifying ordinary=derived tensor; arbitrary quotients do not have that argument | No change |
| 5.2 Étale ghost pushout | d=m=1; R=A; quotient by x | Flatness belongs to the horizontal q-Witt map; ghost need not be flat | No change |
| 5.3 Relative completions | A=ℤ; R=A; p invertible; torsion coefficients | Zero completions allowed; completed scalar descent is used under perfect coverage | No change |
| 5.4 Finiteness | r=0,1; m=2; infinite variables | Rank m for r=0; 1,T span over a subring containing T²; no infinite-variable Noetherian claim | No change |
| 6.1 Completed étale Frobenius | R=A,0,ℤ×ℤ; p inverted; ℤ[T]/ℤ | Product lift at 2 is identity; polynomial Frobenius is not an equivalence mod 2 | No change |
| 6.2 Cyclotomic overlap | p=2,3; d=1 and p-divisible d | Φ₃ mod 3=(q−1)² and Φ₄ mod 2=(q−1)²; radical equality, not ideal equality | No change |
| 6.3 Completed ghost Frobenius | m=p,d=1; p|d; q=1+h | Teichmüller paths give r^(m/d); q-fixed map differs from q↦q²=1+2h+h² | No change |
| 7.1 Differential V-system | Exterior algebra; degree-one square in characteristic 2; even u; ideal (T) | Strict odd alternation is necessary; even squares need not vanish; (T) is not a differential ideal | No change |
| 7.2 Initial differential system | m=1,2; R=A,0,A[T] | Degree zero is preserved; d(T²)=2TdT and dT²=0, including at 2 | No change |
| 7.3 Differential FV-system | p=2,3; τ(T); mod 3 | F₃dτ(T)=T²dT while dF₃τ(T)=3T²dT; the latter vanishes mod 3 and the former does not | No change |
| 7.4 Prime V differential | p=2,3; x=0; Teichmüller and V-generators | γ₂(V₂x)=V₂(x²); no inverse of 2 or previously constructed positive-degree F is needed | No change |
| 7.5 Positive-degree F | p=2; τ₂(T)²; V₂(T); m=1 | θ₂V₂(T)=dT; θ₂(τ₂(T)²)=2T³dT rather than 2T²dT | No change |
| 7.6 Differential ghosts | i=0,1; m=1,2; V₂(T), V₂(dT) | Ghost factors 2 and 4 distinguish degrees; n^i in the F identity is necessary | No change |
| 7.7 Differential base change | Identity, m=1, localization at T; square-zero skew bimodule | d(T⁻¹)=−T⁻²dT; generic associative DGA fails to extend even its multiplication | R02 |
| 8.2 Framed automorphisms | r=0,1; zero-divisor base; polynomial q; Laurent frame | γ(T²)=q²T²; hT remains regular by flatness; inverse q requires the complete series ring | No change |
| 8.3 Jackson derivatives | n=0,1,2,3; q=1; characteristic 2; T⁻¹ | D(T²)=(1+q)T; D(1)=0; D(T⁻¹)=−q⁻¹T⁻² | No change |
| 8.4 Framed complexes | r=0,1,2; T²; q=1 | d_H(T²)=(q²−1)TdT; dT·T=qTdT; scaled specialization has zero differential | No change |
| 8.5 Framed Frobenius | p=2,3; r=0; T,h,dT,T⁻¹ | φ(h)=2h+h² at 2; H uses TdT and C uses (1+q)TdT; the coefficient and series Frobenius roles differ | No change |
| 9.2 Frobenius decomposition | α=0,1; p=2; r=0,1; Laurent frame | Ring basis 1,T and form basis TdT,dT; zero exponent does not introduce T⁻¹ in a polynomial ring | No change |
| 9.3 Two-term cohomology | p=2,α=1,e=0; e=α=0; two factors | H⁰=(h+2)S, H¹=S/(h); at e=α the differential is zero; tensor is over S_α | No change |
| 9.4 Bockstein | m=1,2; r=0,1; zero parameter excluded | β₁(T)=dT and β₂([T²])=[TdT]≠0; regularity fixes division by f_m | No change |
| 9.5 Framed cohomology | m=1,2; r=0,1,2; ω=YdX+XdY | One-variable Checks hold; the two-variable cocycle is not fixed coefficientwise, though its coordinate commutator is a boundary | R01 |
| 9.6 Simultaneous induction | α=0,1; p=2; TdT mod 2 | F₂dτ₂(T)=TdT; quotient must include dV; no α=−1 premise is used | No change |
| 9.7 Smooth E∞ comparison | m=1,2,6; p=2,3; R=0,A; toric base | For p=2,m=6 the second twist is ψ₆; wrong tensor base ℤ[q] adds Tor; coprime product factors match | No change |
| 10.1 Smooth integer torsion | m=1; R=A; ℤ[x]/x²; p=2 | xdx is nonzero 2-torsion in the nonsmooth example; smoothness is essential | No change |
| 10.2 Difference torsion/completion | m=1,2; R=A; polynomial/étale R | h acts as zero at m=1; h(q+1)=0 at m=2 is compatible with integer torsion-freeness; bounds are degreewise | No change |
| Six gap contracts | Regular/nonregular f; J=(T); unbounded complexes; d=1,p; arbitrary-base Cartier | Detailed hypotheses distinguish valid cases; the short intake sentences discard them | R03; R02 scopes the étale extension |

**Duplication and supplier audit by object.** Main was inspected at `0e8b058a97cc4f9401d2679313e0e937761c1024`. Read the shape and ownership of DerivedModuleAlgebra, DGAInfinity and EnhancedDerivedSheaves, and the specific SchemeAndStackFoundations sections. Searched main, Completed and board README objects, including big/q-Witt vectors, arithmetic Λ-structures, Jackson operators, commuting-module Koszul complexes, Bocksteins and differential ideals. Searches found no existing roadmap replacing the owned QWittVectors development.

GitHub code search was used to locate library objects, followed by reading their files at the exact pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Search results on newer default branches were not treated as pinned declarations.

| Object | Owner and verified evidence | Disposition |
| --- | --- | --- |
| p-typical Witt carrier, ghost, F,V,τ, truncation | Mathlib `WittVector`/`ext`, `Defs.lean:52,77`; `map`, `ghostMap`, `ghostComponent`, `Basic.lean:253,287,296`; `frobenius`, `Frobenius.lean:218`; `verschiebung`, `Verschiebung.lean:109`; `teichmuller`, `Teichmuller.lean:93`; `TruncatedWittVector`, `Truncated.lean:62`, ring instance at :270 | Imported correctly; big divisor indexing and its comparison are distinct targets. Paths are under `Mathlib/RingTheory/WittVector/`. |
| Witt adic topology | `TauCeti/RingTheory/WittVector/Complete.lean:197`, `WittVector.isAdicComplete_span_p_teichmuller`; `TauCeti/RingTheory/WittVector/Frobenius.lean:65,79`, continuous Frobenius/inverse | Existing p-typical hypotheses retained; not confused with Layer 6. |
| Tensor right factor, étaleness, degree-one differentials, series | `Algebra.TensorProduct.includeRight`, `Mathlib/RingTheory/TensorProduct/Basic.lean:277`; `Algebra.Etale` and localization-away, `Mathlib/RingTheory/Etale/Basic.lean:205,251`; `KaehlerDifferential.D`/`linearMapEquivDerivation`, `Mathlib/RingTheory/Kaehler/Basic.lean:226,355`; `PowerSeries.coeff`/`constantCoeff`, `Mathlib/RingTheory/PowerSeries/Basic.lean:76,139` | Existing primitives imported; no duplicate carrier construction. |
| Differential coordinate basis | `TauCeti.kaehlerBasisOfFormallyEtale`, `TauCeti/RingTheory/Kaehler/FormallyEtale.lean:67`, with commutative scalar tower and formal étaleness | Imported. No finite-module hypothesis required. This does not supply the full de Rham DGA or relative Cartier theory. |
| Cyclotomic polynomial products | `Polynomial.prod_cyclotomic_eq_X_pow_sub_one` and `prod_cyclotomic_eq_geom_sum`, `Mathlib/RingTheory/Polynomial/Cyclotomic/Basic.lean:337,357` | Imported. The integral ideal/intersection/completion contract asks for additional mathematics, not these product formulas. |
| Scalar Koszul, unbounded tensor/limits, completion and complete flatness | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516` (§0.K.1), :626 (§0.2), :1573 (§1.1), :1693 (§1.2), :1733 (§1.3), :1808 (§1.5), :1973 (§1.7), :2006 (§1.8), :2028 (§1.9) | Cited sections exist. The module-action cochain bridge is distinct from the scalar chain model. The extra degreewise cohomology/completion claim is explicitly a Part II gap. |
| DG carriers and signs | `TauCetiRoadmap/DGAInfinity/README.md:293`, Layer 1, with Layer 0 signs and cochain shift conventions | Associative carriers, maps and cohomology are supplied. Algebra-ideal quotients are not its DG-category quotient. The two generic extensions remain owned Part II gaps. |
| Continuous group Bocksteins | `TauCeti.explicitBockstein1`, `TauCeti/RepresentationTheory/Homological/ContCohomology/Bockstein/Basic.lean:92`; `TauCeti.integralBockstein`, corresponding `Integral.lean:136` | Different carriers and codomains; do not fill the regular-parameter DGA gap. |
| Enhanced tensor/limits and algebra objects | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:455` (§0.3), :1436 (E5:abstract) | Point-site enhanced operations and coherent algebra category are supplied; no q-Witt animation is silently required. |
| Étale invariance, relative Frobenius, lifts | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1484` (§0.23a), :1801 (§0.29, especially :1848), :5006 (§4.1) | Right-factor affine twist, étale Frobenius isomorphism, polynomial rank and unique lifts match this design. |
| ArithmeticDynamics at its open head | Head `1921611a7a96ac19fb15c2b1291b35958c3ef0cb`, README blob `05bc3fc0bc4c41103081d7ead52c8a4a9d39aa95`; `TauCetiRoadmap/ArithmeticDynamics/README.md:524,555,8587` | Read head scope and whole-blob object matches. Cyclotomic material concerns polynomial/dynatomic identities, not the q-Witt or integral ideal/completion interfaces. |
| ErdosProgressionPowers at its open head | Head `e101259371172a32b3dd13e926676ae33b6af5cd`, README blob `4c16df24893ccac630ed2aeb61b0a4dc617520a0`; `TauCetiRoadmap/ErdosProgressionPowers/README.md:33,418` | Scope and object scan show progression/Frey/character theory; no competing interface. Board copies were not assumed equal to these heads. |

All 52 `*Needs:*` lines and all supplier citations were inspected. Every internal target reference resolves earlier in target order; all six gap slugs resolve, and there is no dependency on a downstream consumer. The Layer 9 simultaneous induction is a single target, so its internal (a)–(d) proof is not four cyclic suppliers. DGAInfinity is on main and need not be a separate pending entry in the merge order.

The three gap-only suppliers have no inspectable section text in the supplied main/package inventory. The two Part II extensions also remain future supplier work. This is explicitly allowed. All six have owners, matching README slugs and `neededBy` consumers. No gap was found to request the already imported polynomial products, p-typical Witt objects or degree-one differential basis. The remaining ownership contracts are conditional inputs, with their announcement precision corrected by R03; none is declared unowned.

**Mechanical direction check.** The exact requested invocation using `packages/QWittVectors/README.md` exited 1 before dependency analysis because that file does not exist. Its operative error, with machine prefixes omitted, was:

```text
FileNotFoundError: [Errno 2] No such file or directory: 'packages/QWittVectors/README.md'
```

Reran the same gate with only the candidate changed to `packages/QWittVectors/design/README.md`. Exit 0; complete output:

```text
candidate: QWittVectors is not in the merge order yet; checked as if placed after HabiroCyclotomicCompletions (the intake inserts it when its design is accepted)
depcheck: 3 roadmaps, 12 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The literal-path failure is not claimed to be a successful gate, and the candidate's pre-intake absence is not a finding. No tooling, protected order or supplier file was edited.

**Shape, consistency and Lean.** JSON and TOML parse. All 52 target statements and proof sketches, 162 API statements and 157 Check statements match the README after ignoring whitespace and terminal punctuation. There are 9 definitions and 19 constructions, each with a named API and at least three Checks; 24 theorem targets; 52 Needs lines; ten Examples and ten Dependencies sections. All source works are recorded with versions and legal provenance. The shape includes summary, scope, conventions, exact suppliers, build order, layers, consumers and references. No process-marker, LaTeX-delimiter or `set_option` defect was found in the design scan. No claim is made that numerical Check counts alone prove soundness; R01 adds the missing multivariable negative control and R02 tests an omitted hypothesis.

There is no `Suggested.lean` in this design package. Elaboration command: **not available** as specified in the brief; no Lean command was run. Consequently import form, elaborated binders, proved examples and “sorry is the only warning” cannot be certified. This is a design review, not a failed build of a supplied Lean artifact. Existing-carrier examples and representative signatures remain requirements of the package stage.

## Not verifiable

- The exact round-3 findings: `packages/QWittVectors/reports/REV-DESIGN-QWittVectors~3.md` is absent. All three entries in the available round-4 repair report were reconciled, and the full design was reviewed afresh.
- Lean elaboration and theorem binder retention: no `Suggested.lean` or authorized elaboration command is available. No proof or warning-clean build is claimed.
- The literal package-README dependency run: its input is absent. The design-candidate run completed successfully and its full output is above.
- Implemented availability of the six declared supplier gaps: not supplied for inspection and not required at design acceptance under the binding gap rule. Detailed mathematical contracts were checked; `needs` precision is R03.
- Exhaustive absence from every declaration in the pinned libraries: no local full pinned checkouts are installed. Object searches and the specific positive matches were read at the pins, as listed above; negative search results alone are not a proof of global absence.

No cited mathematical text was unreadable. There is no missing-reference request, no source waived by inference and no new `needs-references.toml` entry. R01 and R02 include explicit counterexamples; they do not depend on unavailable texts.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "a7f4b156de3504467f68a8652507ebfb9e3721f7", "job": "REV-DESIGN-QWittVectors~4", "model": "gpt-6-astra", "worker": "chris-2"} -->
