# CMRankZeroConverse repair report

## F01 (P2) — applied

Nine theorem signatures → five density/proportion headlines. Deleted the four input theorems, the cube-sum definition and the Layer 4 comment; retained their mathematical targets in README prose. Updated Scope, §§4.4, 6.2–6.5 and the module docstring; only §§3.2–3.3, 4.2 and 4.5 are listed as unstatable end theorems. Evidence: BT line 260, BT line 277, BT line 279.

## F02 (P2) — applied

A Part II of the nonexistent RankZeroOneBSD → a roadmap developing the all-prime CM converse. Deleted both introductory framing sentences, retaining the mathematical summary and the actual RankZeroOneBSDPartII consumer. No exact RankZeroOneBSD folder occurs on main, in Completed, in the indexed open roadmap heads, in board packages or in the merge order. No substitute forward-theorem dependency was introduced.

## F03 (P2) — applied

A redundant equality gap → direct imports of ModularIwasawaMainConjecturesPartII §CZ.4 rational-equivariant-main-conjecture, §CZ.5 cm-contained-descent and cm-h2-torsion, and §CZ.6 cm-kato-main-conjecture and cm-kato-normalization-dictionary. Deleted the gap from both copies and updated §3.3 throughout. The supplier's design §CZ.6 explicitly quantifies over every CM newform and every λ|p. Evidence: BT line 208 through BT line 218.

## F04 (P2) — applied

Compatibility with a nonexistent Layer 7 theta-series L-function → the central coefficient-conjugation and entire removed-factor identities alone. Deleted the theta clause from both gap copies. ModularForms Layer 7 on main treats the L-series, Euler product, completion, functional equation and analytic rank; it contains no theta-series construction. Theta realization remains in the separate CM supplier contract.

## F05 (P2) — applied

EllipticCurves Layer 1 → AlgebraicCurves Layer 10. Rephrased the gap on the integral plane-cubic function field and the marked degree-one place, with pullback k(W)→k(C). Updated Scope, both gap copies, §6.2 and Layer 6 Dependencies. Added the origin-uniformizer Check. AlgebraicCurves Layer 10 supplies these carriers; EllipticCurves Layer 1 treats Weierstrass isogenies, differentials and formal groups.

## F06 (P3) — applied

The stale Layer 3 dependency sentence → separate suppliers for zeta/reciprocity, the CM equality, pinned newform L-functions/conjugation, and the central analytic identities. Its roles now agree with the supplier contracts and §3.3. Evidence: Kato line 4053 through Kato line 4071; ModularIwasawaMainConjecturesPartII §CZ.6; Mathlib ModularForms/LFunction.lean:134,190; Tau Ceti ModularForms/Conjugate.lean:298.

## F07 (P3) — applied

Two Checks headings in §5.2 → one six-item list. The model checks come first, followed by finite two-torsion, Smith obstruction products and the residue denominator. Recomputed Δ(1)=64, Δ(2)=4096, Δ(0)=0 and the products −1,2,2. No Lean declarations were added.

## F08 (P3) — applied

CM supplier §§1.2 and 4.2 → §1.1. Narrowed both gap copies to descent of the geometric j=0 endomorphism identification to an arbitrary characteristic-zero field containing a primitive cube root. Updated Scope, the supplier paragraph and §6.3's route; added the ℚ negative control. The supplier's §1.1 already states idealLatticeCurve.endomorphismRing and idealLatticeCurve.automorphism_factors over ℂ.

## F09 (P3) — applied

A second request for the induction L-identity → an explicit import of GL2AutomorphicRepresentationsAndTransfer §R17.4.16 quadraticInduction. Narrowed both gap copies to the weight-two newform realization and Galois comparison for arbitrary A/K. Updated Scope, supplier contracts and §§4.1–4.2. The imported statement includes local induction at every place and cuspidality iff ψ≠ψ^σ; BT line 253 through BT line 259 supports the application.

## Verification outcomes

- The required `lake env lean` invocation on packages/CMRankZeroConverse/Suggested.lean, run from the pinned content checkout, exited 0. Exactly five warnings were emitted: `declaration uses sorry`, at lines 55, 67, 78, 105 and 131. Every imported Tau Ceti module had an object file; no targeted build was necessary.
- A single scratch copy appended `#check @name` for all nine retained declarations and elaborated, exit 0. Compared every elaborated type with its README statement. No hypothesis was lost and no binder repair was needed. The three congruent-number signatures retain their precise filters and cutoffs. Both CM signatures retain NumberField, total complexity, dimension two, non-primality of (3), ellipticity, non-scalar endomorphisms, ε>0 and the strict real height cutoff. The four definitions retain their explicit field/algebra instances.
- The prescribed dependency command with `--depcheck`, `--name CMRankZeroConverse`, the supplied order and `--movable` exited 0. Its complete output was:

```text
depcheck: 51 roadmaps, 591 edges, 0 problem(s)
```

- It emitted no UPWARD, CYCLE or moved line. The equality supplier precedes this roadmap at merge-order positions 215 and 281; GL2AutomorphicRepresentationsAndTransfer is at 106. AlgebraicCurves is on main.
- `git diff --check` passed. All twelve remaining gap slugs, suppliers and needs sentences match the README exactly. A parsed comparison against HEAD confirms that no plan data outside the top-level gaps list changed. Metadata and source manifests are unchanged.
- Every retained Lean declaration appears in the README. None of the five deleted names remains in README or Suggested.lean. There is one Mathlib import, four used Tau Ceti imports, five admitted theorems and four definitions with real bodies. There is no admitted data, option override or added example/API theorem. Each layer still ends in Examples and Dependencies; every definition retains its API and discriminating Checks.
- No gate failures were listed in the brief. The nine review findings are the changes recorded above. Nothing was committed or pushed.

## Adversarial mathematics pass

The following are computations and boundary tests, not proofs of the admitted headlines. Source-supported general statements keep their full hypotheses. The two-term local, lattice and germ models test the identities used in their proof routes. Finite counts below test the counting filters and ordering, not the unknown analytic numerator.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 rank-r p-converse and its negation | (corank, analytic rank)=(0,0),(0,1),(1,0) | At r=0 the implications have truth values true,false,true; failure has values false,true,false | Direction and vacuity agree | None |
| §0.1 rank-zero/nonvanishing equivalence | Germs 1 and s−1 at 1 | Orders 0,1; values 1,0; order zero iff value nonzero in both cases | Finite-order convention agrees | None |
| §0.1 corank versus finite Sel₂ | Corank 0 and rational two-torsion dimension 2 | Rational corank 0; finite Sel₂ dimension at least 2, not 0 | Distinct antecedents preserved | None |
| ellipticLNonvanishingAtOne: actual continuation | Congruent twists n=1,5; F replaced by 2F or 0 | n=1 has nonzero value; n=5 gives F(1)=−F(1)=0; first coefficients 1,2,0 distinguish F,2F,0 | Half-plane agreement excludes rescalings | Definition retained |
| §0.1 continuation uniqueness and isomorphism transport | F−G zero on the open convergence half-plane; identical local coefficients | F−G=0 there and hence on ℂ; central difference 0; isomorphic curves have coefficient differences all 0 | Actual L-function is fixed | None |
| §0.2 total sign and arithmetic sign relation | k=0,1,2,3,4,6 | ε=1,1,1,1,−1,1; ε(−1)^h=1,1,−1,−1,−1,−1; ε²=1 in every case | Even k≥2 domain retained; k=0 fails the arithmetic identity | None |
| §0.2 four-weight periodicity | k=2,3,4 and k+4 | Sign pairs (1,1),(1,1),(−1,−1) | Natural division/subtraction agrees on stated domain | None |
| §0.2 rational projections | c=diag(1,−1), v=(1,−1) | P₊v=(1,0), P₋v=(0,−1); sum v; second application unchanged | Image, complementary kernel and idempotence agree | None |
| §0.2 dyadic lattice boundary | c swaps coordinates, v=(1,0) | P₊v=(1/2,1/2), outside ℤ₂²; 2P₊v=(1,1) integral | Rationalization is necessary | None |
| §0.3 dual/twist and Frobenius conventions | Weight two αβ=ℓ; weight four h=2 | Geometric twisted determinant ℓ/ℓ²=1/ℓ; arithmetic determinant ℓ; 1−4+2=−1=1−h | Dual and Tate directions agree | None |
| §0.4 central evaluation | (p,h,c)=(3,1,4); σ₋₁ at h=1,2 | ev=1/4; σ₋₁=−1,+1; σ₋₁+1 evaluates 0,2 and σ₋₁−1 evaluates −2,0 | Negative exponent and finite component agree | None |
| §0.4 kernel, residue and twist/augmentation | σ_c with c=4,h=1; scalar p=3 | Aug(Tw_h σ₄)=1/4=ev σ₄; ev(3)=3≠0; A/ker(ev)=E | p is not in the central prime | None |
| §1.1 global invariant vanishing | Irreducible rank two versus 1⊕χ_cyc | Invariant dimensions 0 versus 1 | Reducible model excluded | None |
| §1.2 duality twice | h⁰=h²=0, negative-sign dimension 1; local dimensions 2,1 | Euler gives h¹=1; local quotient 2−1=1; kernel 1−1=0 | Dual Selmer vanishes before the second use | None |
| §1.2 failed quotient control | Replace local quotient dimension 1 by 0 | Kernel dimension becomes 1−0=1, not 0 | Local-dimension gap remains necessary | None |
| §1.2 real-place correction | ℤ/2 before and after rationalization | Integral cardinality 2; tensor with ℚ₂ has dimension 0 | Integral term cannot be dropped early | None |
| §1.3 Euler sign and global line | Odd rank two; zero representation | 0−1+0=−1; 0−0+0=0 | Negative dimension convention agrees | None |
| §1.4 central H_g=H_f | Crystalline root moduli at p=2,3 | 2⁻¹ᐟ²≈0.7071, 1/2, 1/3 all differ from 1; fixed-line dimension 0; dim H_g−dim H_f=0 | Central hypotheses give equality | None |
| §1.4 de Rham negative control | V=ℚ_p(1), dual twist ℚ_p | Fixed crystalline dimension 1; dim H_g=2, dim H_f=1; difference 1 | Cannot assert equality for every de Rham V | None |
| §2.1 derived specialization | DVR two-term differential π; H²=R/π | Tor₁(R/π,R/π)=R/π, dimension 1; omitting Tor gives dimension 0 | Both Tor degrees retained until amplitude/vanishing apply | None |
| §2.1 Nakayama/control endpoint | Finitely generated localized H² with residue 0 | H²/π=0 implies H²=0; resulting Tor dimension 0 and specialized H¹ dimension 1 | Order of deductions agrees | None |
| §2.2 central zeta linearity and zero | γ=0, γ, 2γ, γ/2 | Images 0,z,2z,z/2; for z≠0 the last three scalars differ | Scalar normalization cannot be discarded | None |
| §2.2 sign of specialized zeta | h=1,2 and c-eigenvalue ±1 | z(cγ)=−(−1)^h zγ gives surviving eigenvalues +1,−1; wrong sign gives 2z=0 and z=0 | Actual sign relation determines projection | None |
| §2.3 basis from characteristic equality | DVR quotient R/π versus 0 | Lengths 1,0; characteristic ideals (π),(1); H²=0 requires length 0 | Divisibility cannot replace equality | None |
| §2.3 nonzero projection requirement | Correct-sign projection zero versus a basis vector | Specialized generator 0 versus z≠0 in a one-dimensional space | Nonzero vector alone is insufficient | None |
| §2.4 nonfinite p-localization | Global line E with finite subspace 0; generator z=1 | 1∉0; a class finite everywhere would lie in 0; zero class instead lies in every local finite condition | Away-p comparison remains explicit | None |
| §3.1 reciprocity period/sign | k=2,4,6 | h=1,2,3; powers 1,2πi,(2πi)²; signs +1,−1,+1 | Only F-rational basis vectors enter complex periods | None |
| §3.1 removed-factor implication | Formal scalars (P,L)=(0,5),(2,3) | PL=0,6; nonzero product forces L≠0 without dividing by P | Zero denominator never used | None |
| §3.2 conditional converse | Localized quotient length 0 versus 1, at p=2 | Length 0 gives nonzero generator on the global line; length 1 has char (π)≠(1) and fails the input | Equality stays a hypothesis | None |
| §3.3 all-prime CM equality | K=ℚ(i), ℚ(√−2) at two; ℚ(ζ₃) at three | i²=−1; (ζ₈+ζ₈³)²=−2; ζ₃²+ζ₃+1=0 | Contained-field branches remain included | Redundant gap replaced by named targets |
| §4.1 rational Kummer/coefficient comparison | Two one-dimensional CM components over splitting L | dim(V_pA⊗L)=1+1=2; zero source gives modular dimensions 0+0=0; omitted Tate twist changes determinant by χ_cyc² | Coefficients and twists remain typed | Imported induction identity separately |
| §4.2 CM elliptic nonvanishing | Central factors a=2,b=3; a=0,b=3 as negative control | Products 6≠0 and 0; Selmer-zero route forces both factors nonzero | Product implication agrees at ramified and dyadic primes | Route updated |
| §4.3 corank doubling | r=0,1; exchanged dyadic coordinates | Coranks 0=2·0 and 2=2·1; det of columns (1,1),(1,−1) is −2, index 2 | Rational direct sum does not imply integral direct sum | None |
| §4.4 analytic-order doubling | Germs (s−1)^r u, u(1)=1, r=0,1,2 | Squared orders 0,2,4 equal 2r; squared units 1,1,1 nonzero | Input theorem remains true | Retained in README only |
| §4.5 rational converse | p=2,3 and 2r=0 in ℕ | Only r=0 solves 2r=0; r=1 gives 2≠0 even when p=2 | Rational characteristic-zero conclusion agrees | None |
| §5.1 exact Goldfeld proposition | Limiting ratios 0,1/2,3/4,1 | Only 1/2 satisfies equality; 3/4 satisfies the lower bound but not equality | Exact limit distinguished from liminf | None |
| congruentTwist coefficients and discriminant | n=−1,0,1,2,3 | a₄=−1,0,−1,−4,−9; Δ=64,0,64,4096,46656; j=1728 for nonzero n | Singular value excluded; sign leaves coefficients unchanged | Checks merged |
| §5.2 Smith products | Roots c=0,1,−1 | (0−1)(0+1)=−1; (1−0)(1+1)=2; (−1−0)(−1−1)=2; all nonsquares in ℚ | Hypothesis witness agrees | Checks merged |
| congruentNumber_densityOne | Residue counts, empty cutoff | Denominator leading term 3X/π²; numerator same up to o(X); limit 1; X=0 gives totalized 0/0=0 | Finite empty cutoff does not affect limit | Headline retained unchanged |
| congruentNumber_half_positive | Six squarefree residues; count at X=200000 | Permitted mass 3/6=1/2; counts 60782/121581≈0.4999301 for the residue filters | Root numbers supply the analytic upper bound | Headline retained unchanged |
| §5.3 functional equation obstruction | Root number −1 | Λ(1)=−Λ(1) gives 2Λ(1)=0 and Λ(1)=0; allowed residues 1,2,3 versus 5,6,7 | Odd order need not be exactly one | None |
| Fundamental-discriminant filter | d=1,−4,8,−8,12,−3,5,−7; d=0,4,9,−1 | First eight accepted; last four rejected with Euclidean residues | Both signs and trivial character agree | None |
| §5.4 twist scaling | d=8=4·2 | a₄(8)=−64=2⁴(−4); Y scaling 2³; nonzero discriminants | Twist at d agrees with squarefree part | None |
| congruentNumber_half_discriminants | n=1,2,3 and all residue weights | Discriminants (1,−4),(8,−8),(12,−3); weights 5/4,1/2,5/4 sum 3 of total 6; 60771/121589≈0.4998067 in the finite filter test | Required limit 1/2 has the correct ordering | Headline retained unchanged |
| squareclassHeight representative independence | ℚ: 2,1/2,2·2² | Valuations 1,−1,3; all odd; heights 2,2,2 | Negative valuations and square multiples agree | None |
| squareclassHeight over quadratic fields | ℚ(i): classes 1,i,2,3,5 | Heights 1,1,1,9,25; [2]=[i] because 2/i=−2i=(1−i)² | Height one need not be the identity | None |
| squareclassHeight positivity/finiteness | Trivial class, X≤1, height-one unit classes | Empty product 1; H<X empty for X≤1; H<2 contains [1],[i] | Units are included; support finite by the pinned valuation theorem | None |
| CM and non-inert-three hypotheses | K=ℚ(ζ₃), ℚ(i), ℚ(√−2) | O_K/(3)=𝔽₃[e]/(e²), 𝔽₉, 𝔽₃×𝔽₃; non-primality true,false,true | Ramified/split allowed, inert excluded | None |
| Native CM predicate | Gaussian curve over ℚ(i) versus ℚ(√−2) | End ranks 2 versus 1 over ℤ; scalar map non-surjective versus surjective | Condition means CM over the stated field | None |
| cmTwists_nonvanishing_lowerHalf | Statistical fraction 1/2; ε=1/100 or 1 | Required coefficients 0.49 or −0.5; counts nonnegative in the latter case | Eventual inequality matches lower proportion | Headline retained unchanged |
| Cube-sum model, j and base change | n=−3,−1,0,1,3 | a₆=−243,−27,0,−27,−243; Δ=−25509168,−314928,0,−314928,−25509168; c₄=0 gives j=0 when Δ≠0 | Characteristic-zero nonsingularity requires n≠0 | Definition retained in README only |
| Cube-sum forward substitution | n=1, (x,y,z)=(1,1,1); general expansion | Image (6,0,2) represents (3,0); G=0=108F; expansion gives G∘M=108n²F | Coefficient scale is fixed | README target retained |
| Cube-sum inverse and composites | n=−3,−1,0,1,3 | F∘N=54nG; NM=MN=18n·id, scalars −54,−18,0,18,54; 625 integer tests gave zero failures | Inverse exists for nonzero n only | README target retained |
| Cube-sum conventional scales | n=1 and scale (X,Y)↦(4X,8Y) | 64(−27)=−1728; cube parameter n rather than 2n gives coefficient −432n² | Source parameter cannot be silently changed | None |
| Pointed cubic function-field/place comparison | Origin [1:−1:0]; n=1 affine point (1,1) | Origin maps [0:18n:0]; affine point maps (3,0), not origin | Marked-point hypothesis necessary | Gap moved to AlgebraicCurves |
| Origin uniformizer pullback | Chart x−y=1, u=x+y,v=z | C has u³+3u=8nv³; v has order 1; M*(X/Y)=(2/3)v also has order 1 | Pullback direction and degree-one place agree | Added README Check |
| j=0 full-CM descent | k=ℚ(ζ₃) versus ℚ; α:(X,Y)↦(ζ₃X,Y) | α³=1 and 1+α+α²=0 over k; identity gives [3]≠0; geometric End rank 2, rational End rank 1 | Primitive-root field hypothesis is necessary | Narrowed gap and added negative control |
| Eisenstein CM arithmetic | p=3, cyclotomic exponent one | Disc(T²+T+1)=−3; prime norm 3; square norm 9; ramification index 2 | (3) is not prime | Existing pinned declarations retained |
| descendsToRat: positive and negative models | y²=x³−x over ℚ(i); y²=x³+x+(1+i) | First has witness C=1; second has Δ=−64−864i and j=6912/733−(93312/733)i∉ℚ | Actual pointed descent predicate discriminates | Definition retained |
| descendsToRat: isomorphism/square transport | Parameter t versus 4t; C versus inverse/composite | Short coefficients multiply by 16,64; variable-change scale 2 divides by 16,64; CC⁻¹=1 | Both transport directions agree | None |
| §6.4 generic and exceptional cosets | Quotient of exponent two, j=0 | [u]³=[u]; [u]³=1 forces [u]=1; at t=t₀, q=u=1 gives equality | One coset suffices away from j=1728 | Input theorem retained in README only |
| §6.4 second coset | K=ℚ(√−2), t=√−2, a₄=−1 | Native short coefficient −(4t)²=32; scale 2 gives 2; a square with rational part zero would require a²=2b² in ℚ | t is outside the rational-squareclass coset; second coset needed | Signature deleted, mathematics retained |
| §6.5 rational-image support estimate | Split 5, inert 3, ramified 2 in ℚ(i) | Heights 25=5²,9=3²,1; a fixed unramified squarefree product 15 gives 225=15² | Ramified/fixed support must be separated | Input theorem retained in README only |
| §6.5 descending count/density | Empty descent set; two cosets each bounded C√X | Empty count 0≤√X; union bounded 2C√X; divided by cX gives (2C/c)/√X→0 | No assumption that A descends is needed | Signature deleted, target retained |
| cmTwists_nondescending_nonvanishing_lowerHalf | Total X, numerator X/2, removed √X | At X=10000 ratio 49/100; at X=1000000 ratio 499/1000; limit 1/2 | Removing descending twists preserves the lower half | Headline retained unchanged |
| §6.6 restricted denominator and stronger original bound | Non-descending count X−√X; original ratio 3/4; empty descent set | Restricted/full denominator 1−1/√X→1; removing √X leaves 3/4 in the limit; empty set loses 0 | No exact half-density is inferred | None |
| Central analytic supplier identities | Formal L=3, p=3, k=2, a₃=0; coefficient value 2+3i | Euler polynomial at h=1 is 4/3, product 4; conjugate value 2−3i | Value conjugation and removed-factor identity remain meaningful without theta | Deleted nonexistent compatibility clause |
| Quadratic induction local identity | Split eigenvalues 1+2i,1−2i; inert coset matrix [[0,2],[3,0]] | Split polynomial 1−2T+5T² equals the product; inert polynomial 1−6T²; coset determinant −6 | Every-place induction convention agrees | Imported from GL2 supplier |
| Quadratic induction cuspidality and theta gap | Norm character versus principal-ideal exponents (1,0),(0,1) | Norm case has equal conjugates and two one-dimensional constituents; CM ideal exponent pairs (1,0),(0,1) give idelic pairs (−1,0),(0,−1), hence unequal conjugates and rank-two cuspidal induction | Only newform/Galois realization remains requested | Narrowed gap |

The characteristic-zero restrictions exclude characteristic two or three from the cubic substitutions: their composite scalar 18n would be zero there. NumberField assumptions exclude zero rings, nonreduced coefficient rings and positive-characteristic fields from every retained headline. In the new cubic Check, n≠0 permits cancelling 6n/9n; 3 and x−y are nonzero at the marked point. X/Y is used only on the chart Y≠0. The five count statements require positive denominators only eventually, exactly as supplied by the denominator contracts. No theorem quantified over unrelated analytic functions or free Selmer predicates was introduced.

## Sources, pins, citations and ownership

The content checkout HEAD equals origin/main at 63835771ae53669f03c706d3df5ed5605e046e3f. Its manifest and the actual package HEADs agree: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read the three legal cached source extractions at their used locators. BT locators continue to mean arXiv v2, not the published numbering. No new work was cited, no fetch was necessary, and no missing-reference request was created. The OCR at Kato line 4066 through Kato line 4068 is imperfect; BT line 235 independently fixes the central sign. No source passage was copied into a repository file.

Read ComplexTori, PadicMeasuresIwasawaAlgebras and LocalGaloisGroups on main for shape. Used `roadmaps list`, `roadmaps grep` by object over main/open heads, and `roadmaps show` for the suppliers. The converse deductions and analytic applications remain this roadmap's work; ArithmeticStatisticsPartVII explicitly assigns the analytic step downstream. The generic cubic comparison belongs with AlgebraicCurves; complex CM classification remains in the CM supplier; the induction L-identity remains in GL2AutomorphicRepresentationsAndTransfer. No new carrier was constructed, and no retained declaration has another roadmap's fully qualified name.

Re-read the exact library locators in the README at these pins, including their definitions and relevant hypotheses: Mathlib Weierstrass.lean:76,86,131,230,366,388; EllipticCurve/LFunction.lean:79,84; ModularForms/LFunction.lean:134,190; Analytic/Order.lean:523,528; Analytic/Uniqueness.lean:234; DedekindDomain/Factorization.lean:309,596; Ideal/Norm/AbsNorm.lean:258; NumberField/Basic.lean:101; Cyclotomic/Basic.lean:652; NumberField/Cyclotomic/Basic.lean:56 and Ideal.lean:83,106,124. Tau Ceti: SquareClassGroup/Basic.lean:45,66; Newforms/AnalyticInvariants.lean:72,80,107; LFunction/EulerProduct.lean:217; LFunction/FunctionalEquation.lean:324; ModularForms/Conjugate.lean:298; ShortWeierstrass.lean:109,168; NormalForms.lean:131,140; QuadraticTwist/Basic.lean:169,411,739; Isogeny/Hom/Basic.lean:106 and Ring.lean:174; Newforms/Newform.lean:104; CompletedGroupAlgebra/Basic.lean:145. These are library-relative locators, not new roadmap targets.

Object searches at the pins distinguish the missing carriers from existing finite two-descent Selmer conditions: Tau Ceti EllipticCurve/MordellWeil/SelmerGroup.lean:104 and SelmerGroupA.lean:129 define finite two-descent/S-unit conditions, not classical p∞ or modular Bloch–Kato Selmer groups. No modular zeta morphism or CM-newform predicate was found. The missing-carrier docstring does not claim that the actual newform analytic L-function is missing.

| Citation checked | Available copy and contract |
| --- | --- |
| ModularForms | Main Layer 7; no theta object. |
| EllipticCurves | Main Layers 1,5,7; Weierstrass isogenies/twists and classical Selmer functor. |
| AlgebraicCurves | Main Layer 10; smooth plane curves, function fields, genus-one degree-one-divisor and point–place interfaces. |
| AutomorphicGaloisRepresentations | Indexed head 81e9d0f, §§1.5,3.15,4.4–4.8,6.4,7.2; normalization, CM, irreducibility and purity. |
| ArithmeticGaloisDuality | Indexed head 09ad340, R02.4.3–R02.4.4, D7.3,D7.5–D7.7; compact Shapiro, rational duality and local conditions. |
| SelmerIwasawaCohomology | Indexed head 1fa1c7d, §§2.4,2.10–2.12a,2.19–2.20,3.0,3.7,3.10,3.13–3.16,4.9,4.26,4.29; corank, control, j_* corrections and Kummer comparison. |
| ArithmeticStatisticsPartI | Indexed head 3b1a24f, §§0.1–0.2,0.5–0.7,0.15; support height, residue counts, piecewise rescaling and Positive squareclass denominator. |
| ArithmeticStatisticsPartVII | Indexed head, §§5.9–5.11; Smith/corank and three-isogeny inputs. The CM numerator still assumes the windowed count C, so its existing unconditional gap is retained. |
| ComplexMultiplicationAndExplicitReciprocity | Indexed head 0c6c6e2, §§1.1,1.2,4.1–4.2; complex End/Aut, self-twist, components and full factors. Arbitrary-A/K induction realization remains a gap. |
| GL2AutomorphicRepresentationsAndTransfer | Indexed head 69bcab7, R17.4.16; every-place local induction, L-identity and cuspidality. |
| EllipticCurveModularity | Indexed head ed342f3, R29.6, Continuation and the functional equation; continuation agrees on Re(s)>3/2. |
| PadicHodgeRegulators | Indexed head 1a3728e, §§0.1,1.1,1.4–1.8; Tate convention, local conditions, dual exponential, dimensions and Shapiro. |
| ModularIwasawaMainConjecturesPartII | Board design §§CZ.4–CZ.6; all five named targets in F03 exist there. |
| RankZeroOneBSDPartII | Board design Scope and ownership; consumes the shared C.0 proposition and CM converse direction. |
| RankOneConverse | Board design Scope; rank-one converse ownership, not a supplier here. |
| NonordinaryCMSpecialValues and InertAnticyclotomicCMMainConjecture | Board designs; anticyclotomic directions, mentioned only to distinguish ownership. |

The resolver reports two absent-roadmap leads and no absent Lean names. ModularIwasawaMainConjecturesPartII is a false lead because its board design is readable and was checked directly. KatoEulerSystems has no README in the supplied main checkout, board package or indexed open roadmap heads; `roadmaps show` confirms that absence. Its exact present section numbering could not be independently recertified in this round. The cited mathematics was checked directly at Kato line 4046 through Kato line 4073 and Kato line 4721 through Kato line 4849. Its existing supplier contracts were retained without inventing a supplier statement. No unsubmitted job snapshot was treated as an authoritative supplier head. Ownership against the indexed open roadmap heads was checked where their files were available; no unavailable head was guessed.

## Maintainer consequences

The acceptance module no longer declares cm_analyticOrder_double, cubeSumModel, cubeSum_fullCM, descendingTwist_twoCosets or descendingTwists_count_sqrt. Their mathematical targets remain in README prose, with unchanged intended generality. The five density/proportion theorem names and four retained definition names are unchanged. The consumer design imports stages, not these deleted signatures.

There are twelve supplier gaps rather than thirteen. The equality is consumed by its existing target names. The cubic gap now names AlgebraicCurves Layer 10; the CM-field-descent and theta/Galois-realization gaps are narrower. These edits register required interfaces; they do not claim that another author's roadmap has already added them. No supplier file, merge order, tooling or pull-request text changed.

The non-gap portions of packages/CMRankZeroConverse/design/plan.json still contain historical RankZeroOneBSD references, including its summary and node prerequisites. The brief forbids editing those fields. The normative README and acceptance module contain no reference to that nonexistent base roadmap. This restriction is the remaining limitation of repairing that pattern outside the explicitly editable gap list.
