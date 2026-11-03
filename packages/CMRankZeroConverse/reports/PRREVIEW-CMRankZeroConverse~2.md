# Review of CMRankZeroConverse (pull request #1744 at 121e457)

**Verdict:** accepted

No findings remain. This is an AI-assisted incremental re-review of 69 changed lines since 5c3c0b5, limited to the repairs, changed passages and their dependencies. Acceptance is subject to the thirteen declared supplier contracts; it means ready for human final approval, not that the admitted mathematics or supplier contracts are implemented.

## Previous findings

- R01 — repaired: README lines 131–139, 420, 428, 438 and 600 now distinguish ImaginaryQuadraticClassNumber §H3.1's geometric order comparison from ComplexMultiplicationAndExplicitReciprocity §1.1's self-twist and the separate coefficient-field descent contract.
- R02 — repaired: Suggested.lean lines 56–68 and 158–167 state the unrestricted analytic-order doubling and uniform square-root descent count on native curves. README lines 434 and 632 name both; no conclusion is assumed.

## Verified sound

### Scope, gate and elaboration

The head is 121e457bcf3401dae62f0494962fe06c7d72034f. The diff contains 28 changed README lines and 41 changed Lean lines. There are no changes outside TauCetiRoadmap/CMRankZeroConverse in the PR diff. No worktree source was edited.

I read the repository writing and review rules, the previous report and complete incremental diff. The previous full review's unchanged mathematics and shape audit are carried forward explicitly below; this is not a claim to have repeated that full review. Main-branch form references remain EllipticCurves, AlgebraicCurves and PadicMeasuresIwasawaAlgebras.

The worker's head-specific gate passes every scanner, dependency check and targeted build. My fresh gate returned:

    gate CMRankZeroConverse: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK

The independent dependency check returned exactly:

    depcheck: 204 roadmaps, 1632 edges, 0 problem(s)

No UPWARD, CYCLE or moved line appeared. I separately ran the targeted build of TauCetiRoadmap.CMRankZeroConverse.Suggested and direct elaboration of Suggested.lean from the worktree. Both succeeded, with exactly seven admitted-theorem warnings and no other warnings.

A scratch copy containing #check @name for all eleven declarations elaborated successfully. I compared all eleven printed signatures with the README: four real-body definitions and seven headline theorems. No required binder is lost. In particular:

- Analytic doubling retains the totally complex number field, rational dimension two, ellipticity, non-scalar endomorphisms over K, both entire functions and their separate agreements with the actual L-series. It does not assume their product identity.
- The descent bound retains arbitrary elliptic A/K, with no CM or condition at three. Its positive C is chosen before the eventual quantifier over X, so C depends on A,K but not X.
- The unchanged density signatures retain their actual filters, strict height inequality, CM and non-inertness hypotheses where needed. The descent definition retains its rational algebra structure.

The same scratch copy tested every one of the seven admitted theorems against single-tactic simp, rfl and infer_instance, using fail_if_success to detect a complete proof: all 21 attempts failed to close the target. The available analytic-order product lemma requires a product identity absent from the hypotheses; the native twist classification does not supply the arithmetic counting bound. Object searches found no matching one-library-lemma proof. Neither added declaration is padding.

### Headline coverage

| README theorem or milestone | Head-specific acceptance test |
|---|---|
| §2.3 central Kato basis; §§3.2–3.3 conditional and CM newform converses | Module docstring now explicitly includes the basis milestone and names missing modular realizations, finite Selmer, zeta and Iwasawa-complex carriers. No free predicate replaces them. |
| §§4.2 and 4.5 elliptic converses over K and over ℚ | Docstring retains the missing classical p∞ Kummer Selmer/corank interface. |
| §4.4 unrestricted rational analytic-order doubling | Added cm_analyticOrder_baseChange, Suggested.lean:56; native arithmetic curves and no rank restriction. |
| §§5.2–5.4 congruent-number density one and the two half-density orderings | The three unchanged native signatures remain at Suggested.lean:80, 92 and 103. |
| §6.1 CM twist lower-half nonvanishing | Unchanged native signature at Suggested.lean:131. |
| §6.5 quantitative descent count | Added descendingTwists_count_le_sqrt, Suggested.lean:158; unrestricted elliptic A/K and a uniform eventual C√X bound. |
| §6.6 non-descending lower-half nonvanishing | Unchanged native signature at Suggested.lean:171; its count input is now explicitly stated above it. |

### Sources and seeded sample

Fresh source reading covered BT lines 253–261 (Theorem 1.1 proof, arXiv v2 p. 6), BT lines 277–282 (Remark 3.6, p. 7), and BKLOS lines 80–98 (§2, author-version p. 2). These are the legal cached versions cited by the README. BT directly supplies the doubling assertion and the cube-sum application. BT does not state the quantitative C√X bound: the README correctly presents its own support calculation, using the height defined in BKLOS and the at-most-two-coset classification. The calculation is reviewed below.

The two sampled targets affected directly by the edits are §4.4 and §6.3. The other thirteen sampled targets have unchanged statements, locators and Checks; their previous evidence is carried forward, rather than counted as fresh source reading. The supplied sample is accounted for as follows:

| Sampled target | Evidence used this round |
|---|---|
| §0.1 rank-r proposition | Unchanged; prior review's implication and actual-continuation rows. |
| §0.3 central realization | Unchanged; prior Kato (14.10.1)–(14.10.5), pp. 240–241, lines 4793–4812 audit and determinant/dual rows. |
| §0.4 central prime | Unchanged; prior BT lines 224–249 and Kato proof of Proposition 14.13 audit; both prime and dyadic-component rows retained. |
| §1.3 global central line | Unchanged; prior Euler-characteristic calculation giving dimension one retained. |
| §1.4 geometric condition is finite | Unchanged; prior Kato Proposition 14.12 audit and both positive/negative representation rows retained. |
| §2.1 control | Unchanged; prior derived-control Tor calculation retained. |
| §2.2 specialized zeta class | Unchanged; prior Kato Theorem 12.5(1), p. 221, lines 4053–4071 audit and linearity row retained. |
| §2.4 basis not finite | Unchanged; prior Selmer-zero versus nonzero-basis calculation retained. |
| §3.2 conditional converse | Unchanged; prior BT Remark 3.2, p. 6, lines 251–252 audit and length/normalization row retained. |
| §4.1 typed CM comparison | Statement unchanged; its CM §4.2 supplier boundary was reread. The prior coefficient-splitting row is retained; no extension to non-descending curves is silently imported from the rational supplier. |
| §4.4 analytic order doubles | Fresh: BT lines 260–261, actual self-twist supplier §1.1 and pinned analytic-order operations. |
| §5.1 even Goldfeld proposition | Unchanged; prior BT Theorem 1.2, p. 2, lines 47–52 audit and ordering row retained. |
| §5.3 positive-squarefree half | Unchanged; prior six-residue-class transfer and finite-count rows retained. |
| §6.2 cube-sum pointed model | Unchanged; prior off-locus polynomial and marked-place rows retained; §6.3's use of the model was rechecked. |
| §6.3 full CM and ramified three | Fresh: BT lines 277–278, the repaired geometric-order supplier and the pinned cyclotomic declarations listed below. |

No changed passage introduces an unread external source or an unverified-locator flag.

### Computed adversarial pass

The table contains 50 rows: 39 unchanged rows explicitly attributed to the [prior review][prior], followed by 11 fresh rows for changed statements and their immediate dependencies. Finite counts test the conventions and bounds; they are not proofs of density theorems. Inherited rows retain the prior calculations without representing them as recomputed in this incremental review.

| Statement or convention | Instances tried | Computed values on the two sides, or positive/negative values | Result; change |
|---|---|---|---|
| Standing domains and ellipticity | Zero ring, 𝔽₂, square-zero thickening; n=0 versus n=1 | The first three have no required number-field structure. Δ(congruentTwist 0)=0; Δ(congruentTwist 1)=64≠0. | Excluded by actual binders/family filters; no change.  Carried from [prior review][prior]. |
| §0.1 rank-r implication | (corank, analytic order)=(0,0),(0,1),(1,0) | Rank-zero implications have truth values true,false,true respectively; the last is vacuous because its antecedent fails. | Definition distinguishes the false converse instance; no free Selmer predicate added in Lean.  Carried from [prior review][prior]. |
| §0.1 entire arithmetic L-value definition | Actual continuation F; candidates 0 and 2F | First Dirichlet coefficients are 1,0,2 respectively, so agreement on the half-plane rejects 0 and 2F. | Uniqueness pins the arithmetic value; no change.  Carried from [prior review][prior]. |
| §0.2 total central sign | k=0,2,4,6 | Sign values +1,+1,−1,+1; for k=2,4,6 multiplication by (−1)^(k/2) gives −1 each time. The total-function k=0 value instead gives +1. | The central claims require even k≥2; boundary not silently used.  Carried from [prior review][prior]. |
| §0.2 rational projectors | c=diag(1,−1), v=(1,−1); swapping involution on ℤ₂² | e₊v=(1,0), e₋v=(0,−1), sum=v, cross-products=0. For the swap, e₊(1,0)=(1/2,1/2)∉ℤ₂². | Rational sign splitting passes; integral replacement fails.  Carried from [prior review][prior]. |
| §0.3 determinant and Frobenius | k=2,h=1; geometric roots with product 3 at ℓ=3 | det M=χ⁻¹, det M(1)=χ. Twisted geometric root product is 3/3²=1/3, versus arithmetic determinant value 3. | Inverse-Frobenius distinction preserved.  Carried from [prior review][prior]. |
| §0.3 dual twist | k=4,h=2 | 1−k+h=−1=1−h. | Central dual convention agrees; no change.  Carried from [prior review][prior]. |
| §0.4 coordinate and residue | p=3, γ=4,h=1; p=2,γ=5,h=1 | Evaluation gives T=−3/4 and −4/5; T−evaluation vanishes, whereas T itself does not. The quotient is E; p evaluates to p≠0 and is inverted. | Central prime is not augmentation or (p); no change.  Carried from [prior review][prior]. |
| §0.4 sign component at two | h=1 and h=2 | σ evaluates to −1,+1; σ+1 to 0,2; σ−1 to −2,0. Selected rational idempotent evaluates to 1, the other to 0. | Correct component; the scalar 2 is invertible after rationalization.  Carried from [prior review][prior]. |
| §1.1 global invariants | Irreducible rank-two modular representation; 1⊕χ as negative control | Invariant dimensions 0 and 1. | Irreducibility excludes the countermodel, including at p=2.  Carried from [prior review][prior]. |
| §1.2 duality dimension step | Dual invariants zero, central local dimensions (2,1) | Local quotient dimension 2−1=1; global h¹=1, kernel dimension 0. Replacing quotient by zero would leave kernel dimension 1. | Route uses both duality and local hypotheses; conditional on named contracts.  Carried from [prior review][prior]. |
| §1.2 rational real-place correction | A finite ℤ/2 error, p=2 | (ℤ/2)⊗ℚ₂=0, while the integral error has two elements. | Discarding it only after rationalization is justified.  Carried from [prior review][prior]. |
| §1.3 central global line | Negative eigenspace dimension 1, H⁰=H²=0; zero representation | 0−h¹+0=−1 gives h¹=1; zero representation instead gives h¹=0. | Zero representation is not the modular rank-two input.  Carried from [prior review][prior]. |
| §1.4 crystalline fixed-space test | p=2 good central weight; bad weight-two exception; p=3 exception | Relevant absolute values 1/√2,1/2,1/3 are all different from 1. Thus fixed-space dimension 0 and geometric-minus-finite dimension 0. | Includes small/bad primes; no good-prime restriction.  Carried from [prior review][prior]. |
| §1.4 negative representation control | V=ℚ_p(1) | V*(1)=ℚ_p has crystalline fixed dimension 1; dim H_g¹=2 and dim H_f¹=1. | Shows why equality is not a general de Rham assertion.  Carried from [prior review][prior]. |
| §2.1 derived control | DVR complex R —π→ R in degrees 1,2 | H¹=0, H²=R/π; after reduction H¹ has dimension 1, supplied by Tor₁(R/π,R/π), also dimension 1. If H²=0, this Tor is 0. | Tor cannot be omitted; actual vanishing comes from §1.2.  Carried from [prior review][prior]. |
| §2.2 zeta linearity | γ=0,γ,2γ,γ/2 | Images 0,z,2z,z/2; at k=2 the minus projection is killed, at k=4 the plus projection is killed. | Actual morphism and sign select the object; even p=2 permits rational scaling.  Carried from [prior review][prior]. |
| §2.3 basis via length | A rank-one module, z=πe versus z=e | Quotient lengths 1 and 0 respectively; H² length 0 matches only the second. Wrong sign gives z=0, not a basis. | Equality excludes the nonbasis model; conditional on rational main conjecture.  Carried from [prior review][prior]. |
| §2.4 non-finite localization | Selmer=0, global basis e≠0; zero class | If e were finite everywhere it would lie in {0}, contradicting e≠0. Zero lies in {0} but is not a basis. | Nonzero basis is essential; unramified conditions away from p retained.  Carried from [prior review][prior]. |
| §3.1 reciprocity normalization | k=2,4,6 at r=k/2 | Exponents k−r−1 are 0,1,2; factors are 1,2πi,−4π² and signs +,−,+. | Agrees with Kato's formula, not a uniform sign or period.  Carried from [prior review][prior]. |
| §3.1 Euler-factor implication | P=2,L=3; P=0,L=3 | P·L=6≠0 implies L≠0; P·L=0 in the second case cannot imply nonzero period. | No division by zero; bad-prime factor must be the actual one.  Carried from [prior review][prior]. |
| §3.2 conditional converse | z↦2z; quotient length 1 versus H² length 0 | Ideal unchanged since 2 is a rational unit; period doubles. Length equality fails for (1,0). | Equality and normalization play distinct roles; no CM hypothesis needed.  Carried from [prior review][prior]. |
| §3.3 CM cyclotomic-contained cases | ℚ(i),p=2; ℚ(√−2),p=2; ℚ(ζ₃),p=3 | i²=−1; (ζ₈+ζ₈³)²=−2; ζ₃²+ζ₃+1=0. These CM fields are contained in the respective cyclotomic towers. | Named contained-case descent is needed; no disjointness shortcut.  Carried from [prior review][prior]. |
| §4.1 typed Selmer decomposition | Splitting coefficients, summand dimensions a,b | V_pA has dimension 2 over ℚ_p; its two coefficient-character lines have dimension 1 each. Finite Selmer dimension a+b=0 forces a=b=0. | Distinguishes coefficient extension from Pontryagin duality and Tate twisting.  Carried from [prior review][prior]. |
| §4.5 rational converse | r=0,1,2, including p=2 | 2r=0 is true,false,false, so only r=0 survives. | Equality is in ℕ, not modulo two.  Carried from [prior review][prior]. |
| §5.1 even Goldfeld convention | All, none, three-quarters nonvanishing; squarefree n=1,2,3 | Fractions 1,0,3/4 differ from 1/2. Fundamental discriminant pairs are (1,−4),(8,−8),(12,−3). | Ordering changes require the stated transfer, not a bijection preserving height.  Carried from [prior review][prior]. |
| §5.2 congruent curve definition | n=−1,0,1,2,3 | a₄=−1,0,−1,−4,−9; Δ=64,0,64,4096,46656; j=1728 for nonzero n. | Negative twist symmetry and singular exclusion agree.  Carried from [prior review][prior]. |
| §5.2 two-torsion versus corank | Curve y²=x³−x | Roots 0,±1 give four rational two-torsion points, dimension 2, while corank can be 0. Root-difference products −1,2,2 are nonsquares over ℚ. | Finite two-descent dimension is not substituted for p∞ corank.  Carried from [prior review][prior]. |
| §§5.2–5.3 candidate counts | Positive squarefree n≤100000 | Residue counts at 1,2,3,5,6,7 are 10126,10132,10131,10134,10135,10136. Even candidates 30389; total 60794. | Consistent finite check of family arithmetic only; analytic density uses the supplied theorem.  Carried from [prior review][prior]. |
| §5.3 exact-half transfer | Six equal asymptotic squarefree residue classes | Three permitted classes give 3/6=1/2; the other three have central value 0 by negative root sign. | Negative sign need not mean analytic rank exactly 1.  Carried from [prior review][prior]. |
| §5.4 fundamental-discriminant transfer | Absolute-discriminant cutoff; even residues 1,2,3 | Paired height weights are 5/4,1/2,5/4, total 3 against total weight 6. At 100000: 30371 even candidates among 60787 discriminants. | Correct asymptotic half; finite counts are not asserted to be exactly half.  Carried from [prior review][prior]. |
| §5.4 filter and model comparison | d=0,4,9,8; n=2 | Filter rejects 0,4,9 and accepts 8. a₄(d=8)=−64 versus a₄(n=2)=−4; scaling x by 4,y by 8 accounts for factor 16. | Fundamental-discriminant predicate and isomorphic twist convention agree.  Carried from [prior review][prior]. |
| §6.1 support height definition | ℚ: 2,1/2; ℚ(i): 5,3,2 | H([2])=H([1/2])=2 over ℚ. Over ℚ(i), H([5])=25, H([3])=9, H([2])=1. | Valuation parity, inverse representatives and ramification distinguished.  Carried from [prior review][prior]. |
| §6.1 height boundary and squareclasses | ℚ(i), X=1 and X=2; classes 1,i | H(1)=H(i)=1. H<1 is empty; H<2 contains both classes. Also [2]=[i], since 2=−i(1+i)² and −1 is a square. | Strict inequality and unit fibres correct; empty small cutoffs do not invalidate eventual statements.  Carried from [prior review][prior]. |
| §6.1 non-inertness of three | K=ℚ(√−2),ℚ(i),ℚ(ζ₃) | Modulo 3: T²+2 splits; T²+1 is irreducible; T²+T+1=(T−1)². Quotients are 𝔽₃×𝔽₃,𝔽₉,𝔽₃[ε]/ε². | “Ideal (3) not prime” includes split and ramified, excludes inert.  Carried from [prior review][prior]. |
| §6.1 CM and native twist | y²=x³−x over ℚ(i) versus ℚ(√−2); native parameter t=2 | Endomorphism ranks over ℤ are 2 versus 1, so non-surjectivity holds only in the first. Native twist parameter 4t gives a₄=−64, isomorphic to short-twist a₄=−4. | Field of definition of CM and factor-four twist convention retained.  Carried from [prior review][prior]. |
| §6.1 lower proportion | N=1000000, ε=0.01 | Required numerator ≥490000; 750000 also satisfies it. For ε≥1/2 the lower bound is nonpositive. | Lower half is not an exact-half claim.  Carried from [prior review][prior]. |
| §6.2 cube-sum model and maps | n=1,3,0; off-curve point (2,3,1) at n=1 | a₆=−27,−243,0; Δ=−314928,−25509168,0. At the off-curve point F=33 and G(forward)=3564=108·33; inverse-after-forward=(36,54,18)=18(2,3,1). | Polynomial identities pass off the locus as well; n=0 loses invertibility and is excluded.  Carried from [prior review][prior]. |
| §6.2 pointed comparison | Source origin; affine point (1,1) at n=1 | Origin maps to [0:18n:0]=[0:1:0]; (1,1) maps to (3,0). Pullback X/Y=2z/(3(x−y)) has order 1 at the marked origin. | Marked-place hypothesis distinguishes an unmarked model correspondence.  Carried from [prior review][prior]. |
| §4.2 repaired full-factorization input | A/K with two central factors 2,3; zero-factor control | 2·3=6≠0; 0·3=0. A ramified rank-one local factor is 1, not an omitted formal symbol. | Supplier §4.2 explicitly includes A/K without rational descent and bad factors. Gap for its theta comparison remains; no new hypothesis restriction. |
| §4.3 corank doubling, repaired self-twist input | Coranks r=0,1,2; dyadic swap | r+r=0,2,4; determinant of columns (1,1),(1,−1) is −2, integral index 2 but rational index 1. | Recomputed; §1.1 supplies an isogeny, so rationalization covers p dividing its degree. |
| Scope and §4.3 actual-order ownership | ℤ[i] and ℤ+3ℤi | i·conj(i)=1; (3i)·conj(3i)=9. The latter order does not contain i. | The repaired self-twist citation supplies the actual-order construction, not a degree-one assertion. |
| §4.4 and cm_analyticOrder_baseChange | F=(s−1)^r u, u(1)=2, r=0,1,2,3; G=F² | Orders (F,G)=(0,0),(1,2),(2,4),(3,6); leading units are 2 and 4. Thus ord G=2r for all four cases. | Native theorem includes every r; arithmetic identification G=F² must be proved, not supplied as a hypothesis. |
| §4.4 arithmetic carriers and negative models | A:y²=x³−x; K=ℚ(i) versus ℚ(√−2); proposed continuations 0,2F | Endomorphism ℤ-ranks are respectively 2 and 1, so scalar-surjectivity is false and true. First Dirichlet coefficients of F,0,2F are 1,0,2. | hCM excludes the wrong field of definition; half-plane agreement rejects zero and rescaling. Zero-ring and positive-characteristic models cannot satisfy the number-field binders. |
| §6.3 geometric CM and repaired owner | n=1 and n=0; ζ action versus identity | Δ=−314928 and 0; ζ³=1, 1+ζ+ζ²=0, while 1+1+1=3≠0. Over ℚ the endomorphism order has rank 1; over ℚ(ζ) it has rank 2. | ImaginaryQuadraticClassNumber §H3.1 supplies the full geometric order; the named gap supplies coefficient-field descent. Singular n=0 is excluded. |
| §6.3 ramification and cube-sum descent contract | p=3, k=0 in cyclotomic prime-power formulas | (−1)^1·3^1=−3 for the power-basis discriminant; prime norm 3; norm of its square 9; ramification index 3^0(3−1)=2. | Matches the actual three-ramified case. The characteristic-zero gap keeps the primitive cube root and excludes the identity action. |
| §6.4 descendsToRat and two cosets | Rational base change; A:y²=x³+x+(1+i); t=√−2 at j=1728 | Identity change gives descent; second j=6912/(4+54i) has nonzero imaginary part; t²=−2 changes −x to +2x. At j=0, a class of exponent two satisfies [s]³=[s]. | Both truth values occur; second coset is necessary at j=1728. The new count uses the same pointed definition. |
| §6.5 and descendingTwists_count_le_sqrt, exact finite example | A:y²=x³−x over ℚ(i), cutoffs X=1,2,10,26,10⁶ | Descent counts 0,2,4,6,808; with C=2 the bounds are 2,2√2,2√10,2√26,2000. Every listed count is at most its bound. | Derived by counting [n],[2n] for positive odd squarefree n with n²<X; signs coincide and [i]=[2], so the exceptional coset adds no third family. |
| §6.5 split/inert/ramified and uniformity | Rational 5,3,2 over ℚ(i); empty descent set; X≤0 | Heights 5·5=25,9,1. Empty count is 0≤√X for X≥0; for X≤0 the height set is empty and Real.sqrt X=0. Two bounds C₁√X,C₂√X sum to (C₁+C₂)√X. | Finite exceptional support affects the fixed C only. C precedes X. Northcott finiteness comes from §0.5, so ncard is not exploiting its infinite-set junk value. |
| §6.6 consequence of the new quantitative bound | Total 10⁶, at most 1000 descending, numerators 500000 and 750000 | Remaining counts ≥499000,749000; proportions ≥0.499,0.749. √(10⁶)/10⁶=0.001. | Loss tends to zero; neither the descent theorem nor its consumer falsely imposes exact half-density. |

The count example uses the actual rational-image classification: in ℚ(i), a rational number becomes a square only in the rational squareclasses 1 and −1. Thus distinct positive squarefree n and 2n with n odd give distinct classes. Their ramified factor at two has even valuation, giving height n². At a nonrational j, all twists preserve j and the descent set is empty. These checks cover both branches of the count proof without imposing CM or a hypothesis at three.

### Pinned declarations opened

The manifest pins remain Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. The following nine groups were opened afresh for the repairs. Library paths are relative to their pinned repositories.

| File and line | Declaration and significance |
|---|---|
| Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:43, 79, 84 | localPolynomial, LFunction and LSeries use the actual finite-prime factors; the total series is not itself an entire continuation. Good reduction uses finite residue cardinality, available for number fields here. |
| Mathlib/Analysis/Analytic/Order.lean:523, 528 | analyticOrderAt_mul and analyticOrderNatAt_mul. The latter has finite-order hypotheses; it cannot prove arithmetic doubling without identifying G with F². |
| TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Basic.lean:106; TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Hom/Ring.lean:174 | Hom is the native pointed algebraic hom carrier, with its zero morphism and endomorphism ring. Non-surjectivity of integer scalars expresses an actual extra endomorphism. |
| TauCeti/FieldTheory/SquareClassGroup/Basic.lean:45, 66 | SquareClassGroup is the additive quotient of units by squares; squareClass_toMul_out certifies the chosen representative. Zero is never a twist parameter. |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist/Basic.lean:169, 739 | quadraticTwistOf at (0,−t) has discriminant parameter 4t. The generic classification excludes j=0,1728, which §6.4 handles separately. |
| TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean:131, 140 | variableChange_a₄_of_isShortNF and variableChange_a₆_of_isShortNF require regular 2 and 3 and scale by inverse fourth and sixth powers. The characteristic-zero field hypotheses supply regularity. |
| TauCeti/AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean:168 | smul_shortCurve supplies the actual coefficient scaling used by pointed descent and the exceptional cosets. |
| Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:56 | IsCyclotomicExtension.Rat.discr_odd_prime' gives the power-basis discriminant −3 at p=3. Identifying it with the field discriminant also uses the cyclotomic integral-basis dictionary; no arbitrary basis discriminant is substituted. |
| Mathlib/NumberTheory/NumberField/Cyclotomic/Ideal.lean:83, 106, 124 | absNorm_span_zeta_sub_one, map_eq_span_zeta_sub_one_pow and ramificationIdx_span_zeta_sub_one give norm 3 and exponent/index 2. |

The four real-body definitions are unchanged. Their other supporting declarations and the missing Selmer-carrier audit are carried from the prior review; the eleven newly elaborated signatures introduce no new carrier or import.

### Supplier resolution, ownership and gaps

The changed supplier citations and their immediate proof inputs were resolved against the named main or indexed new-roadmap head, not from remembered target titles. The eight groups below record the relevant boundaries.

| Supplier and locator | Verified contract and its use |
|---|---|
| TauCetiRoadmap/ImaginaryQuadraticClassNumber/README.md:83, 87, §H3.1, main | All-order ideal-lattice/complex elliptic dictionary and full endomorphism-order comparison. The Eisenstein case supplies the geometric input; it does not itself assert descent to every coefficient field. |
| TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:342, §1.1; 634, §4.1; 670 and 674, §4.2 | Actual-order rational self-twist isogeny, coefficient characters, all-prime factorization over A/K, and rational A/ℚ induction. The two §4.2 titles now match exactly. No rational-descent hypothesis is dropped from the existing induction comparison; the separate arbitrary-CM-curve gap supplies that extension. |
| TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2127, R17.4.16 | Quadratic induction with local parameters, full L-identity and cuspidality exactly when the conjugate characters differ. The CM characters have different infinity types. |
| TauCetiRoadmap/EllipticCurveModularity/README.md:1019, 1260 and 1604 | R29.3–R29.6 retain newform attachment, coefficient/local-factor comparison and continuation. The entire quadratic base-change identity is still gap:elliptic-quadratic-analytic-identities, not an inferred existing theorem. |
| TauCetiRoadmap/SelmerIwasawaCohomology/README.md:2329, §4.26 | Rational Tate-module/Kummer comparison includes every p and keeps rational corank separate from finite torsion. Finite-condition Shapiro remains its named additional contract. |
| TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:974, §0.5; 1804, §0.15 | The same odd-support squareclass height, bounded-height finiteness, and positive linear denominator. These are supplied general objects; this roadmap owns the descending-subset C√X estimate. |
| TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md:1520, §5.11 | CM corank lower-half theorem retains its counting premise. The unconditional numerator gap remains substantive and is not silently discharged by adding the descent estimate. |
| packages/ModularIwasawaMainConjecturesPartII/design/README.md:143, 159, 182 | CZ.4–CZ.6 and the normalization/contained-case targets are present as design contracts. This does not certify an implemented export; the prior access limitation remains. |

The general pointed-twist and plane-cubic inputs retain EllipticCurves Layer 5 and AlgebraicCurves Layer 10 as owners. The repair moves no construction between roadmaps: it corrects the consuming references to the existing geometric-order and self-twist owners. The changed *Needs:* lines do not introduce upward supply or a cycle.

Ownership searches used roadmaps grep/show across main and indexed open heads, searches of board packages, and the supplied RankZeroOneBSDPartII and ComplexMultiplicationAndExplicitReciprocityPartII sibling files. Searches by descending twists, squareclass height, analytic doubling, full endomorphism order and self-twist found no competing owner for the two added arithmetic milestones. Searching both new Lean names found only this folder; no duplicate fully qualified declaration was introduced. General analytic-order multiplication remains Mathlib's, general twists remain the pinned curve API's, and general height/counting remains ArithmeticStatisticsPartI's.

All thirteen gap slugs match between packages/CMRankZeroConverse/design/plan.json and the README's exact supplier contracts, with named owners. Only cube-sum-full-cm's prerequisite wording changed: it now points to ImaginaryQuadraticClassNumber §H3.1 for the geometric order. Its additional target is still full descent over an arbitrary characteristic-zero field containing a primitive cube root. This is a precise single comparison contract, not a second construction of the complex dictionary. The plan retains the same slug and supplier, satisfying the intake's matching rule. The other twelve gap statements are unchanged; their previous precision and minimality assessment is carried forward. No newly discovered existing export makes the changed gap redundant.

## Not verifiable

- KatoEulerSystems' asserted supplied section contents remain unavailable from the main/open-roadmap index. The fresh resolver again reports this supplier absent. The previous access limitation and packages/CMRankZeroConverse/reports/FIX-PKG-CMRankZeroConverse~4.md, F01, remain applicable: the full-range extension is explicitly owned by its declared gap. No new evidence invalidates the settled reason.
- ModularIwasawaMainConjecturesPartII was resolved afresh in its board design, not an available main/open README or implemented library export. The same resolver lead remains; acceptance does not certify completion of its CM equality.
- The fresh resolver says it did not inspect pinned Lake packages. I therefore used direct reads of the actual pinned library files and Lean elaboration for the library claims above, rather than treating that tool's empty missing-name list as verification.
- Unchanged source audits and adversarial rows are inherited from the prior review as marked, not independently repeated. No newly required external source was inaccessible, and no additional reference request was necessary. The thirteen supplier contracts remain obligations of their named owners.

## Source issues

- **Error** in BT at proof of Theorem 1.1, arXiv v2 p. 6 (BT line 256): the source says the dual Selmer module tensored with the CM number field equals untwisted modular finite Selmer spaces; it should be a rational Tate-module comparison over p-adic splitting coefficients, with central twists and conjugate summands; affects the proof.

This is the source issue carried from the prior review and rechecked at BT lines 253–259; the present roadmap's typed §4.1 comparison already accounts for it. No additional source issue was found.

[prior]: packages/CMRankZeroConverse/reports/PRREVIEW-CMRankZeroConverse~1.md
