<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13067#issuecomment-6782651260 -->
Review (codex) of 9a28043

Verdict: needs_changes

1. **F01** (P1) A parabolic does not determine even the unindexed filtration

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1137`: “a parabolic alone determines a filtration only up to reindexing”.

   **Claim:** Equality of dynamic parabolics determines the chain of subspaces of every representation, after forgetting filtration indices.

   **Witness:** G=𝔾_m, V=ℚe₊⊕ℚe₋ with characters t,t⁻¹; μ(t)=t, ν(t)=t⁻¹. Both parabolics equal G. Their intermediate filtration spaces are respectively ℚe₊ and ℚe₋, so no reindexing identifies the chains.

   **Repair:** Delete that implication and state that the parabolic records a stabilizer, but does not in general determine the filtration even up to reindexing. Keep the precise equal-parabolic plus conjugacy criterion already stated. Add this torus representation as a negative-control Check. In the example μ and ν are not conjugate in the abelian group G, so the retained criterion correctly distinguishes the filtrations. The weaker GL₂ Check currently present detects only different indices, not different chains. The source itself contains this error at LS line 2647; copying its conclusion does not fix it.

2. **F02** (P2) Vanishing on one complex component does not give membership in the period ideal

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:1456`: “vanishing on the complex component, and Rückert's Nullstellensatz … places a power `H^m` in the ideal”.

   **Claim:** The nonzero algebraic equation obtained for one analytic component has a power in the ideal of all pulled-back period equations at the chosen point.

   **Witness:** In ℂ{x,y}, set I=(xy), choose the component x=0 and H=x. H vanishes on that component, but H^m mod(y)=x^m≠0 for every m≥1. Thus H^m∉I=√I.

   **Repair:** At σ(x₀), take the finitely many irreducible analytic germ components of the entire inverse image of Z. Apply §3.3 to each, choose a nonzero regular H_j vanishing on its algebraic closure on the affine irreducible X_ℂ, and set H=∏H_j. After shrinking the neighbourhood, H vanishes on the entire common zero germ; only then apply Rückert, transport and take the norm. Name local finiteness of analytic components from ComplexKahlerGeometry K3 §3.4 alongside its Nullstellensatz. For I=(xy), the repaired product is xy∈I. A product over arbitrarily many global components is not asserted. This repairs the proof route without weakening the non-density theorem.

3. **F03** (P2) Import the existing scheme-theoretic stabilizer

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:2590`: “The translation stabilizer `Stab(H)` is the group scheme of `a` with `H + a = H`”. Its API and Needs do not import the owner.

   **Claim:** §10.1 introduces this scheme-theoretic group object as part of its own good-reduction/primitive API, while the supplier contracts import only §§1.6–1.7 of HeightsRationalPointsAndObstructions.

   **Witness:** Open PR #1017, `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:2188`, §5.2, already constructs the same stabilizer functor for every closed X⊂A, including nonreduced test schemes, with membership, action and base change.

   **Repair:** Import that §5.2 object explicitly in Scope, Exact supplier contracts, §10.1 Needs and Layer 10 dependencies. Describe `Stab(H)` as its specialization to H. Keep the additional ample-divisor finiteness assertion, good reduction, primitivity and the degree-bounded primitive quotient application here; do not re-plan the general stabilizer construction. Check the identification on a point (stabilizer 0), A itself (stabilizer A), and a pullback of a primitive divisor under [2]×id on an abelian surface (stabilizer the degree-four kernel). These are the same functor over all test schemes. The supplier is earlier in the merge order. Its quotient by the connected stabilizer is different from this package's finite primitive quotient, so §10.7 need not be deleted.

4. **F04** (P2) Positive module rank does not exclude the zero coefficient algebra

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:837`: “a perfect alternating `E`-bilinear pairing … so `N` is even”, under the definitions of §§1.1 and 1.4.

   **Claim:** N>0 and perfection imply even N for every finite étale coefficient algebra admitted by those definitions.

   **Witness:** E=0 is the empty finite étale ℚ-algebra. V=E¹=0 has the declared rank N=1, and L=E is invertible. The unique alternating pairing induces the isomorphism 0→Hom_E(0,E)=0, yet 1 is odd.

   **Repair:** Keep the general H⁰-algebra and equidimensional-module definitions, including the empty algebra, but put E≠0 on the inference that an alternating perfect form forces even N and on the numerical classical-rank assertions that use it. Alternatively explicitly include a nonzero coefficient algebra in the classical-structure input of §1.5, retaining the general definitions earlier. Add the zero-algebra negative Check and explain that N>0 alone does not supply nontriviality. Over a nonzero finite étale algebra at least one geometric factor is a field; a perfect alternating matrix has even size there. The example E=ℚ,N=1 is then rejected, E=ℚ,N=2 with matrix ((0,1),(−1,0)) is accepted, and the empty algebra no longer proves an odd/even contradiction.

5. **F05** (P3) The pinned intersection number is defined beyond curves

   **Location:** `packages/MordellLawrenceVenkateshPartII/README.md:238`: “pairs a class only with a curve over a field”.

   **Claim:** The native carrier requires the testing scheme to be a curve.

   **Witness:** `TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean:105` binds an arbitrary scheme C over Spec k and ι:C→X; line 111 defines `eulerDegree k (pullback ι a)`. No dimension-one or properness binder occurs.

   **Repair:** Say that this declaration is the truncated Euler-characteristic degree of the pullback to any scheme C over k, using H⁰−H¹, and agrees with the usual restriction degree when C is a proper curve (`TauCeti/AlgebraicGeometry/LineBundle/Degree.lean:74`). It is not already a numerical-equivalence carrier or the top self-intersection φⁿ. Keep that latter limitation. Test C=X=Spec k, ι=id: the declaration exists and the trivial class has value 0. The Lean docstring's positive assertion that curve intersections exist is true; it need not be changed into another absence claim.

6. **F06** (P3) Correct two pages and stale source-usage ranges

   **Locations:** `packages/MordellLawrenceVenkateshPartII/README.md:2256`: “LS, Lemma A.2, p. 90”; line 2739: “Corollary 9.3 and proof, p. 87”. `packages/MordellLawrenceVenkateshPartII/sources.toml:20` and line 39 still include §3.5 in `cited_for` ranges.

   **Claim:** These locators and target ranges point to the cited statements in the chosen version and current package.

   **Witness:** LS line 4245 places A.2 after the page-91 marker. LS lines 4027–4029 give the degree/kernel argument on page 88. Layer 3 now ends at §3.4; no §3.5 remains.

   **Repair:** Change A.2 to p.91; change Corollary 9.3 “and proof” to pp.87–88. In the existing LS entry replace `3.1-3.5` by `3.1-3.4`; in LV replace `3.3-3.5` by `3.3-3.4`. Preserve both source keys and their access records. The reviewer has not rewritten either author-recorded entry. Verification is immediate at the named source markers and the four current Layer 3 headings.

Six findings: one P1, three P2 and two P3. The package is repairable. Its actual Lean file elaborates, and neither admitted theorem is padding. No roadmap file was changed by this review.

## Verification of the previous repairs

All sixteen preceding findings were checked before the new pass. Locations below are in `packages/MordellLawrenceVenkateshPartII/README.md` unless specified otherwise. “Repaired” certifies the original defect, not every other assertion in its section. None of the preceding findings was marked not actionable.

| Previous finding | Repaired passage and verification | Status |
|---|---|---|
| R01, subgroup orbits | Lines 1303–1313: “an unmarked subgroup is classified by its normalizer, a marked homomorphism by its centralizer.” For maximal tori in GL₂/ℚ₃ the two kernels have sizes 4 and 1. | Repaired. |
| R02, Hodge sign | Lines 170–176 and §5.4: “average descending de Rham degree `w/2`, equivalently arithmetic Hodge–Tate average `−w/2`”. ℚ_p(−1) gives (w,F,HT)=(2,1,−1); §7.2 now uses a genuine cocharacter. | Repaired. |
| R03, Ax–Schanuel ambient | Contract and §3.3 use “`X × D_mon`” and “proper weakly special”. The varying-plus-constant elliptic example gives 1≥1 in this ambient, versus the false 3≥5 in the larger flag variety. The plan has the same corrected contract. | Repaired. |
| R04, generality | §2.9: “Fix a number field `K`”; §3.4: “Let `K` be a number field”; §9.2 includes n,d≥2 with the cubic-surface exception. Plane cubics have connected monodromy Sp₂, quartic surfaces SO₂₁. | Repaired. |
| R05, Frobenius twists | §1.9 treats “`γF^m`” as finite descent data and cites SchemeAndStackFoundations §1.16. For C₃⋊C₂, FγF⁻¹=γ² while Fe=eF and (γF)²=1. | Repaired. |
| R06, transfer coefficients | Lines 1451–1455: “formal power-series scheme over `K_v`” and “transporting its `K_v`-coefficients”. At a transcendental centre the series a+u becomes σ(a)+u, with no number-field assertion. | Original coefficient defect repaired; the revised component-to-ideal step has the new R02 below. |
| R07, lissity | Lines 380–389 supply “the higher direct images are lisse” from EtaleCohomologyFoundations §F.3 and proper analytic comparison from ClassicalAdicEtaleCohomology §8.2. The relative-comparison gap explicitly uses constant ℤ_p coefficients. | Repaired in README and plan. |
| R08, nonexistent pairing | §10.5: “In the nonsymmetric branch no nondegenerate invariant bilinear form exists”. A scalar ζI∈SL₆ gives B=ζ²B, hence B=0. The symmetric branch keeps sign (−1)^(n−1). | Repaired. |
| R09, Jacobian input | Lines 2808–2810: “a unique homomorphism `h : Jac C → A` (JacobianChallenge Layer F)”. That supplier has the pointed Albanese universal property; AS §A1.2 is no longer used on a curve. | Repaired. |
| R10, duplicated Rückert theorem | Scope and contract import “`ruckert_nullstellensatz`”; §3.4 applies it. The old standalone target is gone and the four remaining Layer 3 targets are consecutive. No incoming dropped-id overlap was reported. | Repaired. |
| R11, residue bidegree | Lines 2343–2347: “`H^(n−1−p, p)_prim`”, followed by Hodge symmetry. For a quartic surface, degree-zero residues have type (2,0), and the row is (1,19,1). | Repaired. |
| R12, reflected convolution | §8.2 uses “`β_j = (α * α)_(n−1+j)`”. At n=2,j=0 the value is 1/2, whereas the unshifted value was 1/4. | Repaired. |
| R13, impossible negative Check | §3.1 now compares “the plane spanned by `e₁, f₁`” with a Lagrangian. B(e₁,f₁)=1 and B restricted to span(e₁,e₂)=0. | Repaired. |
| R14, impossible balance triple | §5.3 and the worked example say “weak balance and balance coincide here” for blocks 2+2+2, and use blocks 4+4+4 for (1,4,1). Enumeration gives only (1,1,1) in the former example. | Repaired throughout. |
| R15, existing geometric carriers | Lines 227–240 and Lean docstring lines 31–43 now credit “`LineBundleClass.IsAmple`”, “`Scheme.CartierDivisor`” and “`Scheme.CartierDivisor.IsEffective`”. | Original false absence claims repaired. The added restriction on `intersectionNumber` needs R05. |
| R16, locators | Contract now gives dynamic parabolic “line 154”; the A.4/A.5 corrections cite “p. 91”; Krull cites line 432. These are the locations at the pin/source. | Repaired. Searching the same locator pattern found R06 below. |

## Verified sound

### Scope, coverage and principles

Read the four package files, the previous review and repair report, the board package index, all 79 numbered targets in 11 layers, all Needs lines and the six gap contracts. The previous round's computed rows were reused only for unchanged assertions they actually instantiate; its blanket assurances were not treated as mathematical evidence. Repaired passages, the fifteen seeded targets, the headline theorems and previously unsampled definitions were examined directly. The tables below record the source sample, the repaired and new counterexamples, and the headline computations; they deliberately do not reproduce a catalogue of every planned API fact.

This is a Part II extension of the one-dimensional MordellLawrenceVenkatesh roadmap, not a replacement plan. The realization/coefficients/group layers feed period orbits and balanced incidence estimates, then the two applications. Their Needs lines support that direction. No source-chapter heading or assertion that the plan follows a source's exposition was found. No computational algorithm, copied source passage, prohibited supplier, sorry'd data, `set_option`, own `lemma`, API catalogue in Lean or route-specific good-prime restriction was found. No PR number, machine path, review narrative or hand-off residue was found in the mathematical roadmap text. R03 is the additional ownership repair; R04 is a real boundary defect rather than permission to narrow the general coefficient library.

Compared the house shape with main's JacobianChallenge, ComplexKahlerGeometry and ReductiveGroupsPartII. The required summary, ownership, conventions, exact supplier contracts, build paragraph, mathematical layers, Examples, Dependencies, downstream and references sections are present. Definitions have API lists and at least three listed Checks; every theorem target has prose hypotheses and a locator. Having three Checks does not establish that they cover all admitted inputs, as R01 and R04 show. All six own Lean identifiers used in the README are declared in Suggested.lean.

### Seeded source verification

All fifteen seeded targets were read at their actual source locations. All cited works are recorded under five existing manifest keys. There is no newly missing source to fetch. LS uses arXiv v5 pagination; LV uses printed pagination 893–999, not arXiv's stronger first numerical inequality. Serre is the only settled unavailable text, recorded separately below.

| Target | Source text opened | Locator, hypotheses and comparison |
|---|---|---|
| 1.1 Étale H⁰-algebras | LS lines 2054–2069, Definitions 5.14/5.16, p.45 | Unital commutative algebra object, weight zero and filtration (F⁰=E,F¹=0); finite étale realization. Constancy is separately required in the arithmetic use. Empty algebra remains admitted, relevant to R04 downstream. |
| 1.4 Equidimensional coefficient modules | LS lines 2164–2186, Definitions 5.24–5.25/Lemma 5.26, pp.47–48 | Equal geometric ranks, freeness and realization comparison agree. Existence of a rank is not uniqueness over the empty coefficient algebra. |
| 1.9 Rational Frobenius polynomials | LS lines 2261–2365, proof of Lemma 5.29, pp.49–51 | Rational orbit idempotent, rational traces and integral eigenvalues are the right inputs. The revised finite-descent argument handles γF^m without claiming γ commutes with F. |
| 2.5 Tensor filtrations | LS lines 2600–2674, Definitions 5.40–5.41/Lemma 5.42, pp.56–58 | Same-filtration criterion and passage to G° match. The additional reindexing assertion at LS line 2647 is false: R01. |
| 2.8 Uniform filtrations | LS lines 2776–2806, Definition 5.46/Lemma 5.48, pp.60–61 | Uniformity is equality of the adjoint profiles, not equality of the original weights. Scaling by [E:E₀] is exactly the supplied conclusion. |
| 3.2 Parabolic stabilizers | LS lines 2940–2954, Lemma 6.2, p.64 | Pure polarized integral variation and connected monodromy are retained; monodromy normality is a declared supplier contract. The quotient is the monodromy orbit. |
| 4.5 Semisimple non-density | LS lines 3259–3298, Theorem 7.3, pp.71–72 | Positive base dimension, semisimple fibres, strong balance and A≥(d+dim H)/c are retained. Rational integer polynomials are explicitly supplied, correcting the missing condition in LS 5.49. |
| 5.1 Central weights | LS lines 3382–3416 and 3434–3441, Definition 8.4, pp.74–75 | Geometric central cocharacters, projection and inverse-adjoint determinant agree; upper GL₂ gives a⁻¹b. The source's word “automorphism” for χ∘μ is a slip, listed below. |
| 5.3 Balance notions | LS lines 3417–3448, Example 8.6, pp.75–76 | Sign and averages agree after translating the auxiliary flag's direction. The new GL₁₂ example is a valid strict separation; the old GL₆ example cannot separate weak balance. |
| 5.4 Global purity | LS lines 3338–3350 and 3464–3505, Lemmas 8.1/8.7, pp.73–74 and 76–77 | Base ℚ is essential; de Rham average w/2 is retained and translated to arithmetic HT average −w/2. No extension to individual embeddings of a CM field is claimed. |
| 5.6 Unipotent cocycles | LS lines 3661–3667, Lemma 8.13, p.80 | Characteristic zero, finite cyclic action and norm-one condition agree. The finite-order action is explicitly restricted in §5.7 when applied to Frobenius. |
| 7.4 Bad self-dual filtrations | LV lines 3341–3379, Proposition 10.6, printed pp.981–982 | Non-strict first inequality, strict second inequality, centralizer of φ^ss, fixed graded filtered objects and paired middle piece all retained. |
| 8.1 Classical adjoint profiles | LS lines 4076–4230, Lemma A.1, pp.89–90 | Package adds the necessary geometric parity to the source's overbroad strict bound. N=n!d and the similitude zero direction agree. |
| 10.4 Smooth base reduction | LS lines 3930–3944, proof of Theorem 9.2, p.86 | Package correctly restricts to the dense smooth open before rational/integral lifting. Properness alone would not supply a rational lift over a singular point. |
| 10.7 Primitive quotients | LS lines 4013–4029, Corollary 9.3 and proof, pp.87–88 | Finite translation kernel, primitive quotient and degree multiplication agree. The last steps are on p.88, requiring R06. |

Additional repaired source passages were checked: LS lines 2810–2848 (global types over arbitrary K, integral rational characteristic polynomials and disconnected groups); LS lines 2979–3077 (formal transfer and norm); LS lines 4255–4325 (A.4–A.6, including corrected tails); Beauville lines 84–104 and 129–155 (Theorems 2/4, printed pp.10–12, with the ambient-dimension shift); BC lines 1341–1352 (Theorem 10.13/Remark 10.14, PDF p.34, residue grading). The transfer text at LS lines 3056–3062 invokes vanishing on the entire inverse image; the package's revised “one component” wording does not supply that premise.

### Adversarial computations

These are tests of the statements, not proofs from successful `sorry` elaboration. For unchanged entries also present in the preceding review, the explicit values were retained or recomputed, never replaced by “checked”. Fresh integer computations enumerated descent counts through n=7 and independently generated the Eulerian recurrence through n=9, extracted the displayed Jacobian Hilbert coefficients and enumerated the two balance examples.

| Statement | Instances tried | Values computed on the two sides | Result / change |
|---|---|---|---|
| §§0.1–0.2 realizations and integral Frobenius | Unit; ℚ(1); mismatched ranks | Unit ranks 1=1=1=1, weight 0; ℚ(1) eigenvalue 1/p is not integral, though an allowed system; ranks 2≠1 forbid a comparison | Predicates remain separate. |
| §0.3 tensor category | Unit scalar 2; disconnected two-point base | Fibre of scalar 2 is 2; map (0,1)≠0 has first fibre 0 | Connectedness is needed for faithfulness. |
| §§0.4/0.6 constant versus arithmetic monodromy | Nonsplit quadratic H⁰; dense SL₂; finite C₂ | Arithmetic permutation has order 2 but geometric group 1; dense example dim G_mon=3≠4; finite example has 2 components, identity dimension 0 | Correct distinctions. |
| §0.5 rational projector | e=(1−swap)/2 on ℚ²; e=0,1 | e²=e; e(1,0)=(1/2,−1/2); im(e)∩ℤ²=ℤ(1,−1), versus eℤ²=(1/2)ℤ(1,−1); extreme ranks 0,2 | Correct lattice, including denominator 2. |
| §0.7 and repaired lissity route | Constant smooth projective family | ∇=0, transport=1, transported φ=φ; higher-image rank equals fibre cohomology rank | The new supplier route supplies lissity; remaining comparison is a declared gap. |
| §1.1 H⁰-algebra | ℚ²; ℚ[ε]/ε²; empty algebra | Two primitive idempotents versus nonzero ε with ε²=0; zero algebra has dimension 0 and no geometric points | First étale, second not; zero object matters in R04. |
| §§1.2–1.3 operations | C₃; product modules; sesquilinear form over ℚ(i) | ℚ[C₃]=ℚ×ℚ(ζ₃) has 2 rational primitive factors, ℚ³ has 3; cross tensor (1,0)⊗_E(0,1)=0; B(i,1)=i but B(1,i)=−i | Convolution algebra and balanced tensor definition distinguish wrong models. |
| §1.4 rank | E=ℚ², ranks (2,2),(1,3); zero module | Totals 4=2·2 and 4, but geometric ranks 1≠3 in second case; zero ranks (0,0) | Equal total dimension does not suffice. |
| §1.5 paired rank | Zero algebra with V=L=0,N=1; E=ℚ,N=2 | Perfect map 0≅0 with odd N=1; over ℚ determinant of ((0,1),(−1,0)) is 1 | R04; nontriviality needed for parity. |
| §1.9 Frobenius rationality | C₃ with inversion by F, e=(2−γ−γ²)/3 | Fe−eF=0; FγF⁻¹=γ²≠γ; (γF)²=1; e²=e | Revised descent argument passes; individual deck commutation is not used. |
| §2.2 centralizer | Two GL₂ factors, φ=swap versus id | Dimensions 4≤4 versus 8; fixed coefficient algebra for id is E₀²≠E₀ | Transitivity/fixed-algebra hypothesis necessary. |
| §§2.3–2.4 semisimplification/tensor input | Upper-unipotent GL₂ image; tensor unit sent to k² | Levi image is (1,1); unit dimensions 2≠1 | Correct rejection and projection; no silent marking change. |
| §2.5 filtration | G=𝔾_m on weights 1,−1; μ and −μ | Pμ=Pν=G, but F¹μ=ℚe₊≠ℚe₋=F¹ν | R01; same parabolic does not give the same chain. |
| §§2.7–2.8 top sums and uniformity | Weights 2,0,−2; two identical SL₂ factors | T(1/2)=1,T(1)=T(2)=2; doubled profile T_res(1)=2=2T(1/2). Profiles with root weights ±1 versus ±2 differ | Scaling and interpolation correct; total rank does not give uniformity. |
| §2.9 global types over K | K=ℚ(i), trivial rank-one representation | All good characteristic polynomials t−1∈ℤ[t], weight 0; one trivial class | Repaired generality includes this example. |
| §§2.10–2.11 orbit classification | Trivial subgroup GL₂; diagonal GL₃; tori over ℚ₃; μ₂ | Pair counts 2 and 1+6+6=13; normalizer kernel size 4 versus centralizer kernel 1; square-class counts over ℚ₂,ℚ₃ are 8,4 | Original classification defect repaired, no p=2 exclusion. |
| §§3.1–3.2 period orbit/parabolic | Constant system; elliptic SL₂; symplectic rank four | Orbit dimensions 0 and dim(SL₂/B)=3−2=1; B(e₁,f₁)=1 versus B restricted to span(e₁,e₂)=0 | Orbit and corrected negative Check discriminate. |
| §3.3 Ax–Schanuel | Varying elliptic plus constant elliptic | Correct ambient codimensions give 1≥0+1; larger compact dual gives false 3≥2+3 | Repaired contract/target agree. |
| §3.4 coefficients and radical | Transcendental centre a; I=(xy), component x=0 | t=a+u becomes σ(a)+u; H=x vanishes on component but H^m mod(y)=x^m≠0; product xy∈I | Coefficients repaired; R02 fixes remaining radical step. |
| §3.4 excluded whole orbit | d=1,Z=D_mon | codim Z=0<1; inverse image is the whole disk and its closure X | Positive codimension condition substantive. |
| §§4.1–4.2 strong balance | Four 2-element classes; permutation (13)(24)(57)(68) | 4 classes total, each orbit meets 2; full diagonal has 1 class | 4-balanced, strongly 2-balanced, not strongly 4-balanced. |
| §§4.4–4.5 semisimple bound | GL₂ weights (1,0), base dimension 1,c=5; c=1 | A=1,dim H=4; cA−dim H=1≥1; with c=1, −3<1 | Valid numerical instance; d=0 would have a dense point and is excluded. |
| §5.1 central weights/sign | GL₂ μ=(1,0); SL₂; upper Borel | Central average 1/2; a_SL₂=0; γ_P(diag(t,1))=t⁻¹, pairing −1 | Both central projection and inverse-determinant sign fixed. |
| §§5.2–5.3 induced/balanced | Blocks 2+2+2, F¹dim3; blocks 4+4+4,F¹dim6 | First weak triples only (1,1,1); modular values at (0,1,2),(2,1,0) are −8,+8. In second, (1,4,1) gives modular 0, averages (1/4,1,1/4)≠(1/2,1/2,1/2) | Repaired distinction and sign correct. |
| §5.4 global purity | ℚ_p(−1); H¹ elliptic; its Tate module | (w,mean F,mean HT)=(2,1,−1),(1,1/2,−1/2),(−1,−1/2,1/2) | All signs agree with convention. |
| §5.5 graded types | Auxiliary weights (1,0)→(5,0); Hodge weights same change | Auxiliary parabolic unchanged, hence same type; Hodge F² changes from 0 to a line, hence different type | Index-forgetting applied to the intended filtration only. |
| §5.6 cyclic cocycle | U=𝔾_a,ψ=−1,r=2; char p with ψ=id,r=p | Norm u−u=0; choosing v=−u/2 gives ψ(v)−v=u. In char p norm=pu=0 but coboundary=0 for all v | Characteristic-zero conclusion and negative control correct. |
| §5.7 stable Levi | φ=diag(2,1) on upper GL₂ unipotents | Adφ(x)=2x; fixed subgroup of φ^r is {0}; finite-order action holds on that subgroup, not all 𝔾_a | Correct restricted application. |
| §5.9 root correspondence | SL₂,w=s; SL₃,w=(123); identity | −s(−α)=−α; lengths 1,2,0 respectively; two SL₃ inversions are mapped bijectively by −w, inverse −w⁻¹ | Minus sign and direction consistent. |
| §§5.10–5.12 fixed-type bounds | GL₂ profile (1,2,1),t=2,e=c=1 | A=B=1; T(1)+T((2−2)/2+1)=2>1 | Hypothesis fails on small flag variety, as required. |
| §6.1 coefficient headline | Same GL₂ profile, d=1,c=30 | x=(1+4)/30=1/6; A=1≥1/6 and B=1>2T(1/6)=1/3 | Numerical conditions satisfiable; not a vacuous headline. |
| §§7.1–7.3 comparisons/cocharacter | Equal tensor fibres; ordinary elliptic H¹; weight r=2 | Identity tensor isomorphism exists; μ(t)=diag(t,1), not diag(1,0); eigenvalue 1 pairs with ℓ²; regular GSp₂ centralizer dimension 2 | Correct torsor/sign/multiplier distinctions. |
| §7.4 bad-filtration bound | GSp₂ profile (1,2,1),z=2,e=1 | A=1<z+e=3; required T arguments 3 and 4 are in [0,4] but first inequality already fails | No spurious small-dimensional codimension conclusion. |
| §§7.6–7.7 general-family headlines | Elliptic monodromy; closure dimensions 2→1→0 | dim Sp₂=3 versus dim GSp₂=4; top arguments decrease 4,5→3,4 when d=2→1,h⁰=2; a zero-dimensional reduced closure with r points has ≤r rational points | Correct scalar exclusion and termination of dimension induction. |
| §7.8 point-count headline | Fourier kernel M=1 | Coefficients (1,2,3,2,1), squared norm 19; ratio 9/19≤3/4; largest frequency 2, not 1 | Corrected cutoff through 2M necessary. |
| §8.1 adjoint profiles | n=2,d=1,GL₂/GSp₂; nongeometric GO₂; n=3,d=1,GO₆ | 4<6; 4<4 false; GO₆ has h⁰=(18−4)/2+1=8, so 16<16+4=20 | Geometric parity repairs the source overclaim. |
| §8.2 difference law | n=2,j=0,1,−1 | β=(1/4,1/2,1/4); shifted convolution at n−1 gives 1/2, unshifted gives 1/4 | Normalization and shift repaired. |
| §8.3 variance | n=2,3,4,5 | Second moments 1/2,2/3,5/6,1 equal (n+1)/6 | Difference variance, not standard deviation. |
| §8.4 Lean headline | n=1,2,3,4,5,6 | 2ΣA² = 2,4,36,488,11420,377816; (n!)² = 1,4,36,576,14400,518400 | n=1 false and excluded; equality at 2,3. |
| §8.4 large/small bridge | n=7,8,9; n=0 junk convention | LHS 17405640,1049776080,80786169900; RHS 25401600,1625702400,131681894400. At n=0 A(0,0)=1 but sum over q<0 is 0 | Correct tested inequalities; probability laws explicitly start n≥2. |
| §8.6 repaired residue route | Quartic surface | Jacobian degrees 0,4,8 have dimensions 1,19,1; degree 0 has type (2,0) | Correct bidegree and Hodge symmetry. |
| §§8.6–8.7 primitive rows | (n,d)=(2,3),(4,5),(5,4),(3,3),(4,2),(3,2) | Rows (1,1),(1,101,101,1),(0,21,141,21,0),(0,6,0),(0,0,0,0),(0,1,0) | Hilbert coefficient formulas include quadrics and zero slots. |
| §9.1 native predicates | F=0; F=x₀; F=Σx_i^p in char 2 or 3 | First and third have zero gradient; x₀ has ∂₀=1. pF modulo p is 0, whereas x₀ remains smooth | Geometric smoothness excludes nilpotent/inseparable examples; scaling prime must lie in S. |
| §9.2 repaired generality | Plane cubic; quartic surface; cubic surface; split SO₂ | Connected dimensions 3,210,0 respectively; cubic surface finite W(E₆); an open subgroup of SO₂ has closure dimension 1 | Exceptional surface is excluded; SO density does not add the other O component. |
| §9.3 Lean headline | n=2,d=4 parameter; homogeneous rescaling | binom(6,4)=15 coordinates, dimension 14; G(cF)=c^eG(F) | Correct projective non-density formulation and ∀S after thresholds. |
| §§10.1/10.7 stabilizer | Point; A; primitive pullback under [2]×id | Stabilizers 0,A,ker([2]×id); last has order 4, d=4d′ | Mathematical quotient valid; R03 imports shared carrier. |
| §10.3 Weil restriction | Degree 1 and separable degree 2; nonétale dual numbers | Relative dimensions m,2m; restriction of an elliptic curve along dual numbers has an affine-line tangent fibre and is not proper | Étale assumption needed. |
| §10.4 resolution | Smooth C; nonsplit-conic exceptional fibre | Unique rational lift over smooth U; exceptional fibre may have 0 rational points | Repaired restriction to U is correct. |
| §10.5 classical branches | Standard SL₆; symmetric n=4 | ζ²B=B forces B=0; symmetric branch sign (−1)³=−1 | GL branch no longer assumes inversion pairing. |
| §§10.6/10.9 Shafarevich headlines | Exceptional pair (5,20); degrees 8855,17710 | binom(25,5)/6=53130/6=8855; 17710≠8855 but 8855 divides 17710 | Primitive exception is equality; arbitrary-divisor exception uses divisibility. |
| §§10.7–10.8 quotient/descent | T of order 4; T=0 | d=4d′; for T=0, σ(a)−a=0 for every σ, hence translation a is K-rational | Degree/descent direction correct. |
| §10.10 surface headline | Principal class; doubled Jacobian map | φ²=2 gives g=1+2/2=2; q(2h)=4q(h) | Correct use of multiplicity and Jacobian universal property. |
| Native intersection-number claim | C=X=Spec k, identity map, trivial class | Dimension C=0, expression defined, value χ(O)−χ(O)=0 | R05: not restricted to curves. |
| Page and usage locators | A.2; Corollary 9.3 proof; Layer 3 headings | 91≠90; proof extends to 88; headings count 4, maximum 3.4 | R06. |
| §1.6 finite characters | Orders 1 and 3; multiplication by p in characteristic p | Coefficient degrees 1 and φ(3)=2; on an elliptic curve [p] has degree p² and differential 0, hence is not étale | Invertibility and cyclotomic descent discriminate. |
| §1.7 orbit system | Orbit sizes 1,2 with N=6 | Total ranks 6 and 12, respectively; retaining just one member of a two-element conjugacy orbit gives rank 6 instead of 12 | Galois and cyclotomic orbit closure both retained. |
| §1.8 inversion pairing | n=3 and 4; character order 3 | Symmetry signs +1 and −1; χ⁻¹=χ²≠χ, so raw cup product pairs distinct idempotents while the inversion-twisted form pairs equal ones | Correct parity and E-linearity. |
| §2.1 normalizer | E=k and k², H=GL₂ | Quotient coefficient automorphism groups 1 and C₂; swap²=1 and swap is not coefficient-linear; kernel in second case GL₂×GL₂ has dimension 8 | Normalizer/kernel statements have the right functor and components. |
| §2.6 inner forms | G=GL₁ and GL₂ with chosen tensor identification | Trivial tensor torsor gives the same GL₁; GL(D_cris V) has dimension 4 for rank two, with matrix identification changed by conjugation after a basis change | No canonical matrix identification is asserted for an arbitrary torsor. |
| §4.3 orbit strong balance | Product monodromy on 4 indices in a single Frobenius cycle; diagonal subgroup | Product has 4 singleton classes, orbit meets 4; diagonal has 1 class, orbit meets 1 | Imported independent-factor input is essential for a claimed c=4. |
| §5.8 finite local types | Irreducible global semisimplification, auxiliary indices 0 and 100 | Each has one nonzero graded piece and one parabolic G; forgetting the auxiliary index gives 1 type rather than 2 | Does not claim finiteness of all extensions. |
| §5.11 graded-pair dimension | Regular diagonal φ in GL₂; nontrivial Jordan block | Two Borels through the diagonal torus, locus dimension 0≤2=dim Z(φ); Jordan centralizer dimension 2≤4=dim Z(φ^ss) | Semisimplification only enlarges the allowable cost. |
| §7.5 semisimplification fibres | Irreducible global representation | Only auxiliary flag 0⊂V; its one graded object is V itself, so fixed-graded condition becomes the ordinary fixed filtered-φ isomorphism condition | Recovers the semisimple-orbit input rather than a different quotient. |
| §8.5 large c | GL₂ profile A=B=1,h⁰=rank=2,e=1,c=25 | x=(1+4)/25=1/5; A≥1/5 and B=1>2/5; T(0)=0<1 | Stated sufficient bound c≥5(e+4) works on the test instance. |
| §8.8 normal/tail estimates | Limit difference variance; n=6400 and 6401 | 1/12+1/12=1/6; 40/√6400=1/2, 40/√6401<1/2; tail bound √((n+1)/6)√(c/√n)=O(n^(1/4))=o(√n) | Correct scale, strict cutoff and need for second-moment control. |
| §8.9 order of limits | Fixed n≥2, increasing d | dim Y has degree n in d; adjoint mass has degree 2n; quotient tends to 0 as d^(−n). Even old parameter degree n+1 gives d^(1−n)→0 | Supports degree-after-dimension threshold; no uniform D₀ asserted. |
| §10.2 parameter space | Translate of H; nodal divisor; changed numerical class | [H+a]=[H]; at a node the gradient is (0,0), excluding smooth locus; unequal top degrees give unequal leading Hilbert coefficients | Fixed class and smooth Cartier locus are substantive. |

### Lean acceptance test and headline inventory

Ran the required `lake env lean` on the actual `packages/MordellLawrenceVenkateshPartII/Suggested.lean` from the pinned content checkout. Exit status **0**. The only warnings were “declaration uses sorry” at **69:8** and **106:8**. The sole import is `import Mathlib`; no Tau Ceti object build was necessary.

Independently elaborated a scratch copy with `#check @name` for all six actual declarations: `eulerian`, `eulerian_central_mass_le_half`, `HypersurfaceMonomial`, `IsSmoothHypersurface`, `HasGoodReductionOutside`, `integralHypersurfaces_not_zariskiDense`. All types agree with the intended README binders. In particular n≥2, `[Field k]`, the prime binder installing `Fact p.Prime`, homogeneous degree d and the threshold order `∃n₀ ∀n≥n₀ ∃D₀ ∀d≥D₀ ∀S ∃G≠0` remain in scope. No signature was changed. The supplied “seven declarations” lead includes a parser artefact, not another real declaration.

On a scratch copy, each of the two admitted theorems was tried with `simp`, `rfl`, and `infer_instance`, each branch required to close the goal. All six one-tactic attempts failed. The library candidates below do not supply an `exact` proof of either theorem. There are no admitted examples, boundary-case theorems, Check mirrors or one-tactic lemmas to delete. The four real-bodied definitions are the minimal permutation and polynomial carriers needed by the two headlines.

| Headline from summary/deep targets | Suggested.lean coverage |
|---|---|
| §6.1 coefficient non-density | Docstring lines 23–27: not statable; compatible cohomology realizations and their monodromy/comparison carrier missing. |
| §§7.6–7.7 higher-dimensional LV and finiteness | Docstring lines 28–30: not statable; primitive family cohomology, monodromy and Hodge numbers missing. |
| §7.8 Frobenius-centralizer point-count bound | Docstring lines 44–45: not statable; primitive étale Frobenius eigenvalues missing. |
| §8.4 Eulerian central mass | Theorem line 69, exact denominator-free inequality for n≥2. |
| §9.3 integral hypersurface parameter non-density | Theorem line 106, native MvPolynomial coefficients, algebraic-closure smoothness and homogeneous equation. |
| §§10.6, 10.9, 10.10 hypersurface Shafarevich theorems | Docstring lines 31–43: not statable; arithmetic abelian-scheme model/good-reduction interface and numerical classes/top intersection absent. Existing ample/effective carriers are credited. R05 corrects a narrower README description. |

A nonzero integral homogeneous form smooth modulo every prime outside finite S has S-unit content and gives an integral point of the smooth projective parameter space. Conversely S-integral projective coordinates can be cleared by an S-unit to give an integer representative. Homogeneity of G makes its vanishing independent of this rescaling. The theorem's thresholds may be enlarged, so it does not assert low-degree or dimension-zero cases. No additional statable omitted headline was established, and no surrogate for an unstatable headline was introduced.

### Pinned declarations and duplication by object

Opened the native definitions and relevant near-matches at the specified pins. Library-relative paths below refer to those checked copies, not a newer upstream version.

| File and line | Declaration or object actually supplied |
|---|---|
| `Mathlib/Data/Finsupp/Weight.lean:216` | `Finsupp.degree`: sum of natural exponents. |
| `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean:46` | `MvPolynomial.IsHomogeneous`: support-degree condition; zero is homogeneous in every degree. |
| `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61` | `MvPolynomial.pderiv`: x^p has derivative 0 in characteristic p. |
| `Mathlib/Algebra/MvPolynomial/Eval.lean:572` | `MvPolynomial.aeval`: algebra-valued evaluation. |
| `Mathlib/FieldTheory/IsAlgClosed/AlgebraicClosure.lean:127` | Algebraic closure carrier used to test geometric singularities. |
| `Mathlib/RingTheory/Regular/RegularSequence.lean:147` | `RingTheory.Sequence.IsRegular`: weak regularity and nonzero final quotient. |
| `Mathlib/RingTheory/Filtration.lean:432` | `Ideal.iInf_pow_eq_bot_of_isLocalRing`: Noetherian local ring, proper ideal. |
| `TauCeti/Algebra/AlgebraicGroup/Dynamic/Parabolic.lean:154` | `TauCeti.Cocharacter.parabolic`: conjugation-limit subgroup functor on Hopf-algebra points. |
| `TauCeti/Algebra/AlgebraicGroup/Representation/Tannaka/Equivalence.lean:188` | `TauCeti.Tannaka.fgPointTensorIsoEquiv`: known Hopf-group points versus tensor automorphisms of its forgetful functor; not construction of an arbitrary fibre-functor torsor. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95` | Proper geometrically integral group scheme over a field. |
| `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71` | Ample class: quasi-compactness and positive-power affine nonvanishing neighbourhoods. |
| `TauCeti/AlgebraicGeometry/CartierDivisor/Basic.lean:127` | Cartier divisors on an integral scheme as sections of the units quotient. |
| `TauCeti/AlgebraicGeometry/CartierDivisor/Effective/Basic.lean:45` | Effectivity: local equations regular at their points. |
| `TauCeti/AlgebraicGeometry/IntersectionNumber/Basic.lean:105` and line 111 | Arbitrary scheme C over k and map to X; pullback degree using truncated H⁰−H¹, R05. |
| `Mathlib/Combinatorics/Derangements/Finite.lean:66` | `numDerangements` counts fixed-point-free permutations; at n=1 it is 0, whereas A(1,0)=1. |
| `Mathlib/Combinatorics/Additive/Convolution.lean:87` | `Finset.convolution_le_card_left` is a finite-set cardinality bound, not the Eulerian probability bound 1/2. |
| `Mathlib/RingTheory/MvPolynomial/Basic.lean:198` | `MvPolynomial.basisMonomials` uses all exponent functions; the degree-d subtype here is a simple specialization. |
| `Mathlib/RingTheory/Smooth/Basic.lean:110` | Formal smoothness of polynomial algebras; does not assert smoothness of arbitrary hypersurface quotients. |
| `Mathlib/RingTheory/Valuation/Integers.lean:257` | Ordered valuation-range nondensity; not Zariski nondensity of integral hypersurface parameters. |

Object searches used the supplied `roadmaps grep/show` tools across main and open heads, as well as pinned-library searches and the board package index. No pinned theorem proving either Lean headline or duplicate fully qualified Lean name was found. The classical Eulerian counting definition is explicitly attributed to ClassicalArithmeticCompletion §2.18 and is permitted here solely to state its deeper central-mass headline without importing another roadmap's module. General algebraic groups, neutral Tannaka torsors, Rückert, the Jacobian universal property and geometric convolution theory remain with their named earlier owners.

The five nearest open scopes were read: SheafConvolutionOnAbelianVarieties (#1809), MordellLawrenceVenkatesh (#1231), GaloisSectionsPadicPeriodMaps (#1739), WeightsInEtaleCohomology (#1001), HeightsRationalPointsAndObstructions (#1017). This package owns the arithmetic assembly and higher-dimensional incidence/application theorems; #1809 owns convolution/character monodromy, #1231 the earlier one-dimensional method, #1739 Galois-section/model-free loci, and #1001 weight calculus. R03 identifies the shared stabilizer object with #1017. The family-quotient gap recorded by #1809 at `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:94` concerns shrinking a family and its generic stabilizer; it is not a second declaration of this package's fixed-divisor, fixed-degree finiteness theorem.

The supplied overlaps report has no other PR changing this new roadmap, no dropped cited id, and no id defined only by an open revision. Current cited sections and the relevant closest scopes were checked, so no numbering or conflicting-head finding is inferred merely from vocabulary. The separately indexed LawrenceVenkateshMethod package was not retrievable; see below rather than a claim of nonexistence.

### Supplier resolutions, direction and gaps

The required dependency check completed successfully:

```
depcheck: 236 roadmaps, 2157 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. No merge-order file was changed. The one resolver lead, `VanishingCycles.lisseDirectImageTransport`, is present in the **supplier roadmap** EtaleCohomologyFoundations §F.3; it is not claimed to be an implemented pin declaration. It is not a missing-input finding.

Resolved the named supplier sections against main or the supplied current open heads, including every Needs line. Representative load-bearing resolutions are listed with original README lines (not the extra header inserted by `roadmaps show`):

| Supplier location | Consumed content and boundary checked |
|---|---|
| `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:707`, §F.3 | Smooth proper higher direct images with finite invertible coefficients are lisse; applies to ℤ/pᵐ after inverting p. |
| `TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:4076`, §8.2 | Proper algebraic/analytic higher-image comparison for torsion coefficients; no extra prime-to-residue restriction is inserted. |
| `TauCetiRoadmap/PadicHodgeTheory/README.md:1279`, §7.3 | De Rham proper pushforward assumes lisse higher direct images and carries the Gauss–Manin connection. |
| `TauCetiRoadmap/PadicHodgeTheory/README.md:1072`, §5.5 | Tensor-isomorphism torsors; its local Kottwitz discussion supplies connected reductive H¹ finiteness over finite extensions of ℚ_p, including p=2. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md:2694`, §1.16 | Contracted products and forms from descent; used with finite deck data in §1.9. |
| `TauCetiRoadmap/JacobianChallenge/README.md:449`, Layer F | Pointed Abel–Jacobi universal property; not mere rigidity between abelian schemes. |
| `TauCetiRoadmap/ComplexKahlerGeometry/README.md:972`, K3 §3.4 | Rückert requires vanishing on the entire zero germ; also supplies locally finite analytic components. This is precisely R02's missing premise. |
| `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:483`, §§0.3–0.4; line 771, §0.24; line 848, §1.2 | Semilinear centralizer, Goursat, Faltings finiteness over K with integral characteristic polynomials. |
| `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:950`, §§1.10–1.13; line 1181, §§2.5–2.8; line 1284, §2.11 | Global Hodge weight with friendly-place restrictions; disks/formal solutions/convergence; abelian-by-finite crystalline transport. General relative compatibility is separately declared as a gap. |
| `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:669`, §3.3; line 841, §4.8 | Torsion-twist row has arithmetic HT weight −q; inversion symmetry is needed for the pairing. |
| `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:909`, §§5.2–5.3; line 1170, §6.7; line 1310, §§8.2–8.3 | Pell exceptions, classical convolution monodromy and generic Galois-orbit/strong-balance inputs. |
| `TauCetiRoadmap/ShimuraData/README.md:505`, §3.7 | Its Hodge cocharacter convention is inverse to this package's degree +p convention: use P(μ⁻¹) there. The resulting filtration stabilizer agrees. §§3.1–3.6 supply the variation, polarization and transversality inputs. |
| `TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:1229`, §6.8 | Affine faithfully flat tensor-isomorphism torsor; finite type when the group is finite type. Nonempty over k does not mean a k-point; algebraic-closure trivialization suffices. |
| `TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:3008`, §2.18; line 3604, §2.39; line 4071, §2.56 | Eulerian counting, identities and unimodality; does not already state the requested CLT plus moment/convolution contracts. |
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1546`, §A3.6 | Descent needs a linearization/splitting; a translation-invariant divisor supplies the canonical action on its ideal and line bundle. Isotropy alone would not choose a descent. |
| `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md:2188`, §5.2 | Existing general scheme-theoretic stabilizer, the ownership repair R03; §§1.6–1.7 already supply the arithmetic translation-descent input. |

Also resolved: ComplexComparisonPartII §§C5.2–C5.3, C5.6, C6.6; CrystallineCohomology §CR.7.3; DeligneWeightsAndPurity §§0.1–0.2, 0.7, 0.9–0.10, 0.16, 2.2, 4.3–4.4, 9.12; WeilConjectures WC.3/WC.5; PadicDifferentialEquationsAndRigidCohomology §RD.7.7; InverseGaloisAndArithmeticFundamentalGroups §IG.0.T4; EtaleDualityAndPerverseSheaves §4.3; LefschetzPencilsAndVanishingCycles §§2.8, 3.4, 4.4–4.5, 5.8, 5.10; AlgebraicModuliForArithmeticGeometry §§2.1, 9.4; AbelianSchemesAndArithmeticModuli §§A0.1, A1.2, A1.8, A2.4, A2.10, A3.3, A6.7, A6.14, A6.30–A6.32; ArithmeticGaloisDuality §R02.3.1; FaltingsFinitenessAndIsogenyTheorems §R28.5.15; main's ReductiveGroups Layers 3–7b, ReductiveGroupsPartII §RG2.0.2, RestrictedPowerSeries §§2.1, 5.2, and Completed/Chebotarev Layer 10. None of the reported missing-input findings is based solely on failure of a name search.

All six declared gap slugs agree between README and `design/plan.json`:

- `eulerian-log-concavity-and-variance`: ClassicalArithmeticCompletion §2.56; contiguous support, convolution/reflection and n≥2 variance are specified.
- `eulerian-central-limit`: ClassicalArithmeticCompletion §2.18; normalization by √n, limit variance 1/12 and bounded second moments are specified.
- `andre-monodromy-normality`: ShimuraData §3.4; polarized integral variation, connected smooth complex algebraic base and derived generic Mumford–Tate group are specified.
- `period-map-ax-schanuel`: AbelianSchemesAndArithmeticModuliPartII B3; monodromy-orbit ambient and proper weakly special exception match the repaired target.
- `relative-crystalline-comparison`: PadicHodgeTheory §8.1; constant ℤ_p coefficient, lisse higher images, horizontal de Rham comparison and crystalline Frobenius compatibility are distinguished.
- `hodge-tate-image-cocharacter`: PadicHodgeTheory §4.4; crystalline tensor-preserving representation over finite unramified K/ℚ_p, conjugacy in its tensor group and the image torus are specified.

These are named, precise supplier contracts, not unowned prerequisites. No duplicate already-provided contract was established. Their absence as implemented results is not a finding. Because the package has repair findings, this verdict is not an acceptance conditional on gaps.

## Not verifiable

- Serre, *Galois cohomology*, I §5.4 Corollary 1 to Proposition 36 and III §4.3 Theorem 4 remains `uncertified`. Its text was unavailable for locator certification and was not requested again. The local torus and square-class computations are independent checks, not a claim to have opened the book.
- The board index lists LawrenceVenkateshMethod at PR #345, head 9ee7ac3. Reading its indexed README returned HTTP 404. Ownership against that package could not be checked at that head; it is not declared nonexistent. Ownership against the available open heads and the five closest scopes was checked.
- The recorded institutional licence class for the supplied LV cache was preserved; this review did not independently authenticate the hosting institution. No source was obtained from an unauthorized mirror.
- The future cohomology and comparison constructions have not been formally proved by this review. Successful elaboration checks the stated signatures, not the truth of the admitted headlines.

## Source issues

The following source corrections were encountered or rechecked while reading the sampled passages and repaired proof routes. They are not claims that the package should reproduce the source's errors.

- **Error** in LS at §5.8.2 after Definition 5.40, preprint p. 57: the source says a parabolic determines each representation filtration up to reindexing; it should retain the cocharacter filtration class, since opposite torus weights have different intermediate subspaces; affects a stated result.
- **Misprint** in LS at the central-weight discussion preceding Definition 8.4, preprint p. 74: the source calls χ∘μ an automorphism of 𝔾_m; it should call it an endomorphism, since t↦t² and the trivial character are permitted; affects nothing.
- **Error** in LV at §10.2, printed p. 971: the source gives coefficient parameter dimension binom(n+d,d−1)−1; it should give binom(n+d,d)−1, for example 14 for plane quartics; affects nothing.
- **Gap** in LV at Lemma 12.1 and proof, printed pp. 995–996: the source uses point-count bounds through N with Fourier frequencies through 2N; it should require the bounds through 2N; affects a stated result.
- **Misprint** in LV at proof of Lemma 10.4, printed p. 978: the source gives degree-r pairing multiplier ℓ; it should give ℓ^r, pairing λ with ℓ^r/λ; affects nothing.
- **Misprint** in LV at Example 4 after Lemma 11.2, printed p. 988: the source maps the induced filtration into f_k/f_(k+1); it should use f_k/f_(k−1); affects nothing.
- **Misprint** in LV at proof of Lemma 11.4, printed p. 993: the source uses w and w⁻¹ as the inverse root-set correspondences; it should use −w and −w⁻¹; affects nothing.
- **Misprint** in LS at proof of Lemma A.4, preprint p. 91: the source propagates a denominator 3^j to index i; it should use 3^i; affects the proof.
- **Misprint** in LS at proof of Lemma A.5, preprint p. 91: the source puts the tail comparison in the greater-than direction; it should use less-than for the second-moment upper bound 3/2; affects nothing.
- **Misprint** in LS at proof of Lemma A.5, preprint p. 91: the source retains denominator 3^i in the final single k-sum; it should use 3^k; affects nothing.
- **Gap** in LS at proof of Lemma 8.14, preprint p. 80: the source applies its finite cyclic argument on the whole unipotent radical; it should restrict to Z_U(φ^r), where the conjugation action has finite order; affects the proof.
- **Gap** in LS at proof of Lemma 5.49, preprint pp. 61–62: the source applies Faltings finiteness with only algebraic-integral Frobenius eigenvalues; it should also require rational Frobenius characteristic polynomials, hence integer coefficients; affects the proof.
- **Error** in LS at proof of Lemma 5.49, preprint p. 61: the source treats the even-rank coefficient-linear GO subgroup as connected; it should separate the identity component from its finite component quotient; affects the proof.
- **Error** in LS at Lemma A.1, preprint pp. 89–90: the source gives a strict bound for every listed classical group; it should retain geometric parity, since n=2,d=1,GO₂ gives equality; affects a stated result.
- **Misprint** in LS at the paragraph after the GO calculation in Lemma A.1, preprint p. 90: the source gives square-root growth for variance; it should give variance (n+1)/12 and square-root growth for standard deviation; affects nothing.
- **Misprint** in LS at Definition 9.1, preprint p. 85: the source excludes every stabilizing translation, including zero; it should exclude only nonzero translations; affects nothing.
- **Gap** in LS at proof of Theorem 9.2, preprint p. 86: the source uses properness to lift every integral point through a resolution; it should first restrict to the dense smooth open with unique rational lifts; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9a28043eb2cfcd5d6e9cee995dee656c0fb17a69", "job": "REV-PKG-MordellLawrenceVenkateshPartII~3", "model": "gpt-6-astra", "worker": "chris-4"} -->
