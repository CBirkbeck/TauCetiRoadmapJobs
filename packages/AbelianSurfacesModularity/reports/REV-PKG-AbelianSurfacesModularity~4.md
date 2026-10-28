<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1105#issuecomment-6400731486 -->
Review (codex) of 3e8763d

Verdict: accepted
Conditional on the announced gaps: `surface-open-image`, `surface-residual-endomorphisms`, `near-adequacy-reasonableness`, `integral-enormity`, `finite-tate-lift-local-control`, `dyadic-weight-one-change`, `local-neighbourhoods`, `unramified-lift-rigidity`, `genus-two-level-three-monodromy`, `ordinary-spherical-attachment`, `forward-singular-spin-transfer`, `all-place-exterior-transfers`, `odd-rank-two-system-modularity`, `induced-character-client`, `dyadic-selfdual-polarized-lift`, `strong-odd-symplectic-criterion`, `ordinary-polarized-three-model`, `all-place-surface-comparison`, `siegel-prime-to-level-monodromy`

No new package findings. Acceptance is conditional on the 19 declared supplier contracts, not on their having been implemented. The classification and lifting proof gates explicitly inherited from the suppliers remain premises of the automorphic conclusions.

## Verified sound

### Previous findings, checked first

The previous report calls these F01–F03; its discussion also calls them R01–R03. The repair report marks all three applied, with none marked not actionable.

| Previous finding | Repaired passage in packages/AbelianSurfacesModularity/README.md | Verdict and witness |
| --- | --- | --- |
| F01: fine curve moduli and geometric Torelli ownership | Line 726: “as the descended framing twist of the fine genus-two level-three family supplied by AbelianSchemesAndArithmeticModuliPartII B4.1”; line 752 includes that supplier in Needs. | Repaired. B4.1 supplies the fine family at g=2, ℓ=3, universal curve, quasi-finite Torelli and strong geometric Torelli. A4.14 instead requires a smooth special curve. The additional open-complement and local-density arguments remain here. |
| F02: duplicated near adequacy in the gap | Line 68: “Provide Whitmore Definition 3.19 reasonableness with its eventual cyclotomic-image H⁰ vanishing and semisimple-detection conditions”; line 485: “Use the supplied PL.4/relaxed-adequacy predicate”. | Repaired. PL.4 supplies the two H¹ vanishings, trace condition and adequate implication; ArithmeticGaloisRepresentations §7.9 supplies trace/spanning equivalence. The narrowed gap and plan agree verbatim. The quotient-cohomology obstruction is retained. |
| F03: undefined integer-letter parameter space | Lines 1111 and 1126 use “Z⁺(ρ̄) = Z(ρ̄) × G_m”. | Repaired. Z is the defined distinct-conjugates open. At θ=(0,1,2,3,4,5), its discriminant is 1194393600; c=2 is allowed, c=0 excluded, and the product has dimension 7. |

The revised Scope, supplier subsections, §§1.4, 2.5, 4.8, 7.1 and 8.5 were read together with their consumers. Searches found no remaining ℤ(ρ̄), no request to reconstruct near adequacy, and no use of A4.14 to construct the global unmarked curve family. Its remaining use in §5.3 is for smooth special curves; product special fibres pass through §4.8. The semilinear pairing cocycle and actual canonical-line-bundle cocycle are now explicit, so descent does not rely merely on invariance of an isomorphism class.

### Coverage and principles

Read all 46 numbered targets, their API clauses and Checks, all 46 Needs lines, all nine layer dependency blocks, conventions, supplier contracts, worked examples, references, the Lean file, metadata and source manifest. Every numbered target has at least three Checks. All nine layers end in Examples and Dependencies. The additional definition and convention clauses were tested on their stated domains; no rank-zero surface, zero coefficient field, q=1 finite field, inseparable characteristic-zero extension, or total-division value was silently admitted.

For unchanged assertions, the earlier review's actual numerical rows were retained as permitted by the brief; prose-only assurances were not treated as numerical evidence. The repaired targets and all 15 new sampled targets were independently examined. The finite-field censuses, the matrix normalization, semisimple span, A₅ cohomology, coupled theta count, local seed point counts, Weil-quartic census and split-family discriminant were recomputed this round. The table below records sampled targets, headlines and repair targets, rather than repeating every unchanged API clause.

One earlier evidence row was wrong: the round-3 row for §4.10 listed 8A instead of 4D among good marked classes. It is not inherited. The package itself correctly lists {4D,6H,6I,10A}, agreeing with BCGP25 lines 8900–8914. This is a correction to review evidence, not a package finding.

No replanning, route-specific exclusion of bad primes, copied source passage, executable algorithm target, sorry'd data, forbidden import, set_option, circular proof route or upward supply was found. Finite classifications are mathematical targets with small computed controls. Generic moduli, lifting, degeneration, transfer and image theory remain with named suppliers. The package owns their surface-specific comparisons and endpoint applications. The main roadmaps AlgebraicCurves, PolynomialGaloisGroups and EllipticCurves were read for shape and ownership boundaries.

### Source sample

All 15 sampled targets were checked in the legal cached texts at their actual locators, including hypotheses and printed pages. BCGP25 uses arXiv v1 and BCGP21 uses v3; the manifest makes that distinction explicit. There are no additional author-labelled unverified locators. The three settled uncertified books/papers are accounted for below.

| Sampled target | Locator opened | Support and boundary |
| --- | --- | --- |
| 0.2 distinguished ordinary surfaces | BCGP25 Definition 1.8.10, p.11, lines 499–522; Definition 9.1.2, p.187, lines 8635–8643 | Four characteristic-zero characters; the nonsquare-quartic equivalence is restricted to good ordinary reduction. Residual distinction is stronger. |
| 2.1 basis and S₅ embeddings | BCGP25 §8.1, pp.180–181, lines 8278–8351; p.203, lines 9423–9447 | The basis and three generator matrices agree. The later printed matrices represent inverse permutations in this basis, as the package explicitly explains. |
| 2.2 rational Weierstrass points | BCGP25 §8.1, p.180, lines 8278–8304 | Characteristic different from 2; the specified six-point action, not an arbitrary outer identification, determines the stabilizer. |
| 2.4 characteristic-two A₅ modules | BCGP25 Lemmas 8.1.2 and 8.2.1, pp.181–182, lines 8309–8390 | Simple dimensions, Brauer table, defect-zero projectivity and order-five spectrum agree. Extension from the splitting field 𝔽₄ to an arbitrary field containing it preserves the split simple-algebra decomposition. |
| 4.2 sixteen quartics | BCGP25 Definition 9.2.4 and Table 9.2.5, pp.193–194, lines 8933–8965 | All sixteen coefficient pairs and their reductions agree. A listed possible projective class is not asserted to occur in every isogeny class. |
| 4.4 dyadic curves | BCGP25 Lemma 9.1.6, pp.188–190, lines 8703–8776 | Ordinary and nonordinary counts, marked restriction and both scalar lifts agree. The package derives its two-chart criterion and corrects the source's reversed lift squares. |
| 4.5 good-ordinary exclusions | BCGP25 Lemmas 9.2.6–9.2.7, pp.193–195, lines 8943–8998; Lemmas 9.2.11–9.2.12, p.196, lines 9051–9082; Lemma 9.2.19, p.199, lines 9226–9237 | Principal polarization is retained where the S₅ ordinary-point theorem needs it; finite-field isogeny assertions retain their broader scope. The no-ratio lifting input is an explicit supplier gap. |
| 4.6 toric reduction | BCGP25 Lemma 9.2.13, pp.196–197, lines 9083–9100; §9.2.16, p.198, lines 9177–9182 | Source omits a needed hypothesis. The package adds bad reduction or semistable ordinary reduction, and gives the good nonordinary counterexample. |
| 4.7 products and coupled periods | BCGP25 Lemma 9.2.8, pp.195–196, lines 9001–9046; Lemma 9.2.14, pp.197–198, lines 9102–9172 | Products agree. The coupled construction is expressly a replacement for the source's defective diagonal-period argument, using named degeneration and pairing suppliers. |
| 4.8 odd-theta and Torelli spaces | BCGP25 Definition 9.2.1, p.192, lines 8856–8871; BCGP21 Definition 10.2.2, Proposition 10.2.3 and Lemma 10.2.4, pp.269–271, lines 12966–13072 | Marked rationality, degrees and twist obstruction agree. The global fine family is imported from B4.1; the open-complement and local-density refinement is stated and justified here. |
| 5.3 every ordinary local module | BCGP25 Corollary 9.3.6 and Lemma 9.3.7, pp.202–203, lines 9362–9447 | Finite flatness, multiplier, ordinary extension, scalar/Jordan distinction and rational marking retained. The source's scalar sign and elliptic-order slips are corrected. |
| 7.1 odd-prime transfer | BCGP25 Theorem 9.5.1, p.206, lines 9564–9592 | All eight conditions retained, together with symplectic lattices and compatible flags. The pure finite-flat component input and integral enormousness are separate. |
| 7.5 Theorem B | BCGP25 Theorem B, pp.3–4, lines 150–158; Theorem 9.5.4, p.208, lines 9656–9665 | Surjective-image version and fifteen-image extension distinguished. Both require good ordinary curve reduction at 2 and 3; the marking gives automatic triadic distinguishedness. |
| 8.4 thirty-two types | BCGP25 Theorem 10.2.1 and proof, pp.211–212, lines 9785–9835; FKRS12 Theorems 1.5 and 4.3, pp.5,22, lines 192–194 and 1002–1032 | Excludes A and B[C₂], keeps the Galois action on the real endomorphism algebra, and uses 34 over ℚ rather than 52 over arbitrary number fields. |
| 8.6 trivial triadic Frobenius | BCGP25 Remark 10.3.8, p.221, lines 10292–10299 | Six distinct rational branch points versus four points of ℙ¹; the product alternative fails ordinarity by the elliptic Hasse bound. |

The revised WHITMORE22 locators were also checked. PDF images of printed pp.22 and 24 resolve the OCR's superscripts: Definition 3.15(1a) uses H⁰ of the dual derived Lie algebra, Definition 3.19 has the eventual quantifier and conditional H¹ of that same dual, and Lemma 3.20 assumes H¹(H₁,k)=0. The README's expanded contract at line 70 agrees. ZARHIN00 lines 100–142 and 186–193 support the very-simple-module adapter beyond its Jacobian-only theorem.

PDF images of BCGP25 pp.150–151 were inspected as well. This resolves the earlier review's unreadable-column limitation in Table 6.4.4: failure sets for conditions (1),(2),(3) are respectively {3.540.2,3.540.7,3.216.2,3.36.1}, {3.810.1,3.810.5,3.162.1}, and {3.1620.2,3.540.3,3.540.5}. No row fails (4). The 15 checkmarks and 10 failures agree with §1.4.

### Adversarial mathematics: values and negative controls

These computations test statement boundaries and conventions; they do not purport to prove the automorphy theorems numerically. For finite censuses, equations rather than isomorphism classes are counted. A source-labelled conjugacy classification is distinguished from independently computed point counts.

| Statement | Instances and values computed on both sides | Result / change |
| --- | --- | --- |
| Conventions and §0.1 | Trace-one elliptic fibre at 3: Q=X²−X+3 and denominator 1−T+3T². Inverse Frobenius has determinant 1/3 rather than 3. Two factors have rank 4 and determinant 9. Exterior ranks are 1,4,6,4,1. Multiplication by 3 is invertible rationally but zero on the 81 geometric 3-torsion points. | Correct rational/integral and H¹/Tate distinctions; no change. |
| 0.2, sampled | Traces −1,2 at 3 give Q=X⁴−X³+4X²−3X+9, Q(1)=10 and Q mod 3=X²(X+1)². The quadratic factors have discriminants −11,−8 and no common root. E×E gives Q_E² instead. | Characteristic-zero distinction true in the first case, false in the second; residual distinction fails in the first. |
| 0.3 headline | GL₄ twist exponent is −3/2; GL₂ exponent is −1/2. The motivic involution sends 0 to 2 and fixes 1; unitary normalization fixes 1/2. An elliptic product has a stable rank-two subspace. | Correct shift; absolute irreducibility excludes a cuspidal-product conclusion. |
| 1.4, repaired consumer | Full group order is 2·3⁴·8·80=103680; symplectic kernel has order 51840 and index 2. Table failures count 4+3+3=10, leaving 15 of 25. | Definition and source table agree; reasonableness has not been replaced by near adequacy. |
| 2.1, sampled | Even subsets number 32; quotient by the all-ones line has 16 vectors. Computed matrices have orders 2,2,5 and ranks of M−I equal to 2,1,4. Their centralizers have orders 48,48,5. The action gives 720 distinct matrices. | Displayed basis normalization agrees. The double-transposition centralizer is 16; order 48 alone cannot distinguish the other involutions. |
| 2.2, sampled | Trivial six-point action fixes 6 letters and all 15 nonzero torsion points. Standard S₅ fixes 1 letter; transitive outer S₅ fixes 0. A separable quintic has five finite branch points plus infinity. | Both directions of the marking criterion pass; mere containment in the outer subgroup does not imply no fixed point. |
| 2.4, sampled | Simple dimensions 1,2,2,4. On a three-cycle the four-dimensional lifted trace is 1+1+ω+ω⁻¹=1; the two natural conjugates give 2ω+2ω⁻¹=−2. On a five-cycle the four nonidentity roots sum to −1. | Correct Brauer, rather than modular, trace and correct embedding distinction. |
| 2.5 and repaired PL.4 identification | A₅ has 60 matrices, 45 of odd order, spanning dimension 16. With a=(12)(34), b=(135), a²=b³=(ab)⁵=1, cocycle/coboundary dimensions are 0/0,15/15,16/15 for k,ad,ad/k; H¹ dimensions 0,0,1. | Independently recomputed. Scalar extension preserves all matrix ranks, so the quotient obstruction survives over 𝔽₁₆. |
| 2.5 negative control | For H=1 on k², semisimple span dimension is 1 versus dim End=4; both H¹ groups are zero. A nonzero trace-zero matrix pairs to zero with I. Hom(C₂,k⁺) has dimension 1, whereas Hom(C₂,kˣ) is trivial in characteristic 2. | Both near/relaxed predicates reject the trivial rank-two image; additive and multiplicative Schur coefficients remain distinct. |
| Expanded reasonableness contract | For trivial image on a symplectic rank-four space over 𝔽₃, dim H⁰(sp₄∨)=10 rather than 0. Hom(A₅,k⁺)=0, whereas Hom(C_p,k⁺) has dimension 1 in characteristic p. | H¹ vanishing alone is insufficient; the eventual H⁰ and cyclotomic stabilization conditions are substantive. |
| 3.1 headline | Sign-kernel restriction changes order 120 to 60, or retains 60. Sym³ of weights {0,1} has weights {0,1,2,3}, while a surface has {0,0,1,1}. A real lift with eigenvalues ±1 has determinant −1. | Residual seed matching does not claim equality of characteristic-zero systems. |
| 3.2 headline | Double transposition has order 2 and sign +1; a transposition has sign −1. Polarization type (1,2) has degree 4, so its mod-2 pairing need not be perfect. | Explicit residual symplectic framing and the independent image contracts are necessary. |
| 4.1–4.2, sampled | Writing Q/X² as (X+p/X)²+a(X+p/X)+(b−2p), the two real parameters must lie in [−2√p,2√p]. Exhaustion gives 16 ordinary pairs at p=2 and 40 at p=3. Dyadic row counts are 3+1+4+2+2+4=16. | Complete surface list; no Jacobian-only restriction. At X=0 the uncancelled reciprocal expression gives 0 versus 16, so its stated nonzero domain matters. |
| 4.4, sampled | Two-chart test gives 768 smooth dyadic pairs out of 2048 and 384 ordinary. h=1,f=x⁵ gives infinity test 1; h=1,f=x⁶ gives 0. h=f=0 generates the zero ideal rather than the unit ideal. Over 𝔽₃ the count is 1296 smooth out of 2187. | Infinity, zero and inseparable controls pass; no affine-only substitute. |
| 4.3–4.4 seeds and unpointed descent | Counts over 𝔽₂/𝔽₄ for C₁,C₂,C₃ are (5,7),(3,7),(3,3), giving (a,b)=(2,3),(0,1),(0,−1). The pointless example gives (0,6), hence (−3,5). The section-acquiring extension has e=1 and unchanged inertia. | Jacobian descent works even when the original smooth curve has no integral section. Source resolves the finer 6H/6G classes. |
| 4.5, sampled | Q=X⁴+X³−X²+2X+4 gives Q(1)=7, odd. Reference quartics give Q(1)=4 and 6. If α²+α+2=0 over 𝔽₃, substituting −α gives α≠0. | Rational 2-torsion parity and no-ratio tests support the exclusions. |
| 4.6, sampled | Good nonordinary Y has Q=X⁴+2X²+4, b=2 and Q(1)=7, toric rank 0. X²+1 takes values 1,2,2 over 𝔽₃. In the bad semistable case t+a=2 and t>0; t≠1 forces t=2. | Added bad-or-ordinary hypothesis excludes the actual source counterexample. |
| 4.7 products, sampled | Modulo 3, (X²−1)(X²+X+2)=X⁴+X³+X²+2X+1. Over ℤ, (X²+X+2)(X²−X+2)=X⁴+3X²+4. Cubical Tate torsion has Frobenius eigenvalues −1,1, not 1,1. | Correct classes 8A,4D,2D and distinguished unit-value pairs. |
| 4.7 coupled periods, sampled | u²=u+1 gives u³=2u+1, u⁶=8u+5, N(u³)=−1. q=8000=20³=5·40² gives valuation form 6I₂: values at (1,0),(1,1),(0,0) are 6,12,0. q=5 gives 0; q=8000⁻¹ gives −6 at (1,0). | Positive symmetric principal datum; wrong-sign and zero-valuation models excluded. |
| 4.7 theta and mod-3 actions | Of 16 refinements of K, 6 are odd; factor interchange fixes exactly the two with values 1100 and 1111. The uncoupled form gives 0 fixed odd refinements. R²=−I and diag(−R,R) has multiplier −1 and square −I. | Correct marked double-transposition action and outer class 2C; diagonal-period control fails markedness. |
| 4.8 repair and sample | At g=2, deg ω=2, dim H⁰ω=2, dim H⁰ω²=3. For y²=x⁵−x, products have basis 1,x,x² times (dx/y)²: tangent rank 3, also over the dual numbers. Product locus dimension 2<3. −I acts as 2I≠I at level 3 and I at level 2. | Fine-level and open-immersion arguments pass, including infinitesimal control; A4.14 is not misapplied to products. |
| 4.8 descent and covers | D=diag(1,1,−1,−1) satisfies DᵀJD=−J, matching conjugation of ζ₃. Canonical pullback maps compose as the descent cocycle. Cover degrees are 720/120=6, and 120 for the trivial subgroup over P, versus 1 for the full subgroup. | Pairing-compatible semilinear descent; only proper subgroup covers enter thin avoidance. |
| 4.10 headline | Good marked distinguished classes are {4D,6H,6I,10A}, size 4. Semistable marked distinguished classes add {2C,2D,6G,8A}, size 8. Both exclude {4C,12C}. | Correct table. The earlier review's 8A-for-4D typo is discarded. |
| 5.1 and 5.3, sampled | Triadic census: 864 ordinary equations, 10 with square Q, 0 of those with a rational branch point. Four seed point-count pairs are (7,15),(7,11),(3,13),(5,11), giving (a,b)=(3,7),(3,5),(−1,2),(1,1). | Source equations and quartics agree; 854 distinguished equations remain. |
| 5.3 full modules | Six invertible quadratic polynomials give eight GL₂(𝔽₃) classes because each repeated-root polynomial has scalar and Jordan cases. I fixes dimension 2, Jordan fixes dimension 1. Product traces −1,2 give scalar −1 and Q(1)=10; traces 1,−2 give +1 and Q(1)=18. | Matching only characteristic polynomials would fail; full finite model and both signs are retained. |
| 6.2–6.3 headlines | x(x²+1)(x²+2) has branch partition [1,1,2,2], sign +1 and involution order 2. At most 6·103680=622080 marking/framing choices lie over a fixed curve. | Real open and finite fibres support the switch and infinitely many distinct curves; no condition at 2 is inserted into §6.3. |
| 7.1, repaired sample/headline | At p=3 both H¹ weight lists are 0,0,1,1. The ordinary framed component dimension is 16. The node xy=0 has two components through the origin; mere common-component incidence is weaker. Identity residual image has one repeated eigenvalue and zero-dimensional Zariski closure. | Unique seed component and Sp₄ closure are separate, retained hypotheses. |
| 7.2–7.3 headlines | Full image order 103680 has index 1; cyclotomic kernel index 2. Forbidden square polynomials have coefficient tuples (1,2,2,1,1) and (1,1,2,2,1) mod 3. E×E has repeated Q and nontrivial endomorphism idempotents. | Neither a repeated ordinary polynomial nor a product supplies a false cuspidal endpoint. |
| 7.4–7.5, sampled headline | Five ordinary good-curve dyadic classes have intersection 0 with the two forbidden classes. Squarefree quintic has 5+1 branch points, while a repeated-root quintic has discriminant 0. All 10 ordinary nondistinguished triadic equations have 0 rational branch points. | Smoothness and marking give exactly the advertised Theorem B specialization. |
| 7.6 headline | Finite rank-two integral orders 1,2,3,4,6 become orders 2,1,6,4,3 after a −1 twist. A root α of X²+X+2 over 𝔽₉ has α⁴=−1 and α⁸=1, hence order 8. | Bad reduction excludes the forbidden polynomials without discarding bad-prime theory. |
| 8.1 headline | (768−144)/2048=39/128; (864−10)/2187=854/2187; product=5551/46656. Conditional dyadic fraction is 624/768=13/16. Thin-box quotient is H^(−1/2)log H→0. | Joint mod-6 distribution and generic monodromy remain explicit; no replacement by separate marginals. |
| 8.2–8.4, sampled headlines | ab=4 has (a,b)=(4,1),(2,2),(1,4). A finite representation twisted by a character has one weight value; H¹ has two. On ℝ×ℝ, trivial versus swapping C₂-action has fixed dimension 2 versus 1. 34−2=32. | Potential abelianity, regular rank-two constituents, rational versus geometric endomorphisms and exceptional types remain distinct. |
| 8.5 repair | Fifteen squared differences of 0,1,2,3,4,5 multiply to 1194393600≠0. θ=0 gives T⁶ and discriminant 0. c=2 preserves six branch points but makes the two infinities quadratic; c=0 is forbidden. | Correct Z×G_m family, dimension 7, with twist parameter retained. |
| 8.6, sampled | Required rational branch count 6 exceeds #ℙ¹(𝔽₃)=4 by 2. Only 4 in the elliptic Hasse interval [1,7] is a positive multiple of 4, giving trace 3+1−4=0. | Both local obstructions verified. |
| 8.7 headline | Direct count gives #E(𝔽₉)=8 and trace 2, hence Q=X⁴−2X²+9 and Q(1)=8. Q′=4X(X²−1), Q(0)=9, Q(±1)=8: gcd 1. Odd refinements number 1·3+3·1=6, with 0 fixed under swap. | Ordinary, distinguished, unmarked [2,2,2] seed; the decomposable special fibre is retained under the Torelli deformation. |
| 8.8 headline | Orders of A₆,S₆ are 360,720. An order-five action on 𝔽₂⁴ has irreducible polynomial X⁴+X³+X²+X+1 and no invariant rank-two submodule. An ordinary self-dual height-four model needs ranks 2+2. | Generic finite flatness alone does not supply W; spherical local choices at both 2 and 3 remain in the contract. |

### Ownership, resolved supplier citations and order

By-object searches used the roadmap service on main and all 365 indexed open heads, and local board designs, for fine curve moduli, Torelli, odd theta, ordinary finite-flat models, semisimple spanning, relaxed/near adequacy, Honda–Tate, Weil quartics, residual surface images and automorphic attachments. The board package index was read before any absence inference. Four additional board-head reads were attempted; their access limitations are recorded below. There is no fully qualified declaration collision because Suggested.lean declares nothing.

The citation resolver reports no unresolved cross-roadmap citation or roadmap Lean name against main bbed953 and the index dated 2026-10-25T16:46:16Z. Its library-name limitation was not treated as evidence of absence: library names were opened directly at the pins. The content working tree is a8132fb235144b25aba003881cc74e35d7d15f36; supplier text was obtained through the roadmap service's main/open-head resolution, rather than assuming that working tree was the service's main snapshot.

The following table records the resolved sections and hypotheses inspected. Paths in the first column are relative to TauCetiRoadmap unless explicitly prefixed packages. Line numbers exclude the service's wrapper line.

| Supplier README | Resolved input and scope checked |
| --- | --- |
| AbelianSchemesAndArithmeticModuli/README.md | A3.7–A3.8, A3.11–A3.12 (lines 1569–1682): perfectness, level structures and even-subset pairing. A4.8–A4.14 (2250–2387): effectivity, ordinary coordinates, compatible polarized truncated models, skew dyadic duality, and smooth-special-curve Torelli. A5.7 (2646): H¹=Tate dual. A6.5, A6.7–A6.8, A6.12, A6.20 and A6.32–A6.34: reducibility, endomorphisms, finite descent, separable Weil restriction and twists. |
| AbelianSchemesAndArithmeticModuliPartII/README.md | B4.1 (1983) provides the fine curve family and geometric Torelli at g=2, ℓ=3. F3.2 (2693) supplies Honda–Tate with its division-algebra dimension formula; ordinary irreducible invariants vanish. |
| ArithmeticGaloisRepresentations/README.md | §§5.12,6.3,6.4,7.3,7.6,7.9–7.11: potentially abelian decomposition, Tate extensions, coefficient changes, actual similitude forms, projective lifting and distinct image predicates. §7.9 (4751) supplies finite-image trace/spanning and coefficient-extension comparisons, not the Whitmore extension. |
| FaltingsFinitenessAndIsogenyTheorems/README.md | R28.4.4–R28.4.7 (1788–1861): semisimplicity, integral centralizer, Hom and rational isogeny comparison. These do not alone state the two residual/open-image surface contracts. R28.5.14's Torelli ownership was also checked against B4.1. |
| NeronModelsAndSemistableAbelianVarieties/README.md | §§3.5–3.6,3.11–3.12,3.14: saturated filtration, orthogonality, unipotent/finite-level semistability and period pairing/descent. §§5.0a–5.6 (2766 onward): finite étale torsion, dual convention, NOS, conductors and bad factors. §§6.10–6.13 (3972 onward): compatible systems and the ordinary principally polarized isotropic/S₅ argument. These pointwise statements do not assert full p-adic local constancy. |
| ShimuraCompactifications/README.md | C4.4–C4.6 (1865,1897,1927), under C4-a: complete normal noetherian domain, radical ideal, isotrivial tori, positive polarized data and algebraization. The coupled q=8000 datum meets these hypotheses with ideal (2). |
| LocalGaloisDeformationRings/README.md | §2.2 (1735) supplies unramified deformation rings, not rigidity of all lifts. §§6.27,6.29,6.31–6.35 give flags and pure finite-flat components; §6.35 (3858) retains p>2. The broad range includes a GL₃ subsection, but the actual surface input is the GSp₄ component statement. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md | R07.6.10 (8688): good reduction and p≥3 are retained in cyclotomic-image stability. |
| packages/PotentialAutomorphyInfrastructurePartII/design/README.md | PL.0 supplies prescribed solvable local extensions, avoidance and descent. PL.4 strong oddness (1793) supplies the even-rank symmetric-form dichotomy; PL.4 relaxed adequacy (1879) supplies its predicate and adequate implication. The additional symplectic class-count contract is separate. |
| packages/GSp4NonregularModularityLifting/design/README.md | NR2.5–NR2.6 (377,389), NR10 and NR11.2–NR11.6 (1200–1274): ordinary attachment, pure monodromy, both complete seed alternatives, nonvanishing, rank one and lifting. The proof gates at 1284 are inherited as premises. |
| OrdinaryAutomorphicFormsAndModularityLifting/README.md | §2.11 (509) starts at p≥5 with a regular weight-zero Steinberg form. The dyadic parallel-weight-one request is correctly a gap. |
| InverseGaloisAndArithmeticFundamentalGroups/README.md | IG.2.4–IG.2.7 (1879,2011,2113,2252): thin sets, full-group specialization, integral counts and simultaneous local Hilbert points. Known geometric monodromy and weak approximation are retained inputs. |
| EndoscopicTransferAndUnitaryTraceComparison/README.md | §8.3 (2943): finite-field Tate/isogeny comparison. §11.1 (4153): unitary cuspidal transfer and classification record. §§13.2–13.3 (4783,4801): solvable descent and character induction with a supplied Galois identification. The forward singular and induced-character contracts ask for additional inputs. |
| AutomorphicLFunctionsAndLocalFactors/README.md | AL.2 Global Godement–Jacquet (1827), Centered entire functions (1849); AL.3 isobaric strong multiplicity one (2288); AL.4 WD normalization (2799) and exterior factors (2836). Unramified factor formulas do not supply missing all-place transfer existence. |
| ModularityAndLanglandsExtensions/README.md | §§1.9,1.11,1.13 (670,705,745), automorphic induction, §3.26 (2429): odd finite Artin, tensor/cube transfers and conditional classification. Regular weakly compatible rank-two systems require the separate declared contract. |
| GL2AutomorphicRepresentationsAndTransfer/README.md | R17.5.1,5.4–5.7 and 5.11 (2319–2448): solvable Artin branches and prime-regular character comparison. The nonsolvable A₅ branch uses the distinct odd Artin supplier. |
| AutomorphicGaloisRepresentationsPartII/README.md | AG2.2 (1203) and AG2.5 (1758): twists, base change, polarization and local comparisons with regular algebraic/conjugate self-dual hypotheses. |
| AutomorphicFormsOnReductiveGroups/README.md | §§2.3–2.7 (362–459): normalized real induction, Weil parameters, GL₂ constituents and globalization. The complex norm is squared absolute value. |
| EllipticCurveModularity/README.md | R29.6, three formulations (1791): weight-two modularity over ℚ with exact conductor. |
| EllipticCurveModularityPartIIGL2TypeAbelianVarieties/README.md | GT.3 modularity theorem (833): ℚ-simple GL₂-type, then powers over ℚ; no general quadratic-field modularity is inferred. |
| ShimuraVarieties/README.md | §§1.2,5.0 (358,1281): analytic tower and rational polarized fine charts. Level 2 retains inversion; prime-to-level monodromy is a declared extension. |
| AlgebraicModuliForArithmeticGeometry/README.md | §§3.5,5.2 (1683,8741), polarizedDescentComparison at 1715: actual object and ample-line cocycles, level-preserving automorphisms and rigidification. |
| RelativeJacobiansAndIntegralCurveModels/README.md | §§0.1–0.3 (91–127),2.2 (432),2.4 (475): pointed proper smooth families, section-independent underlying Jacobian and specialization. Unpointed models here acquire a section unramifiedly before applying these statements. |
| AlgebraicCurves/README.md | Layer 10 (918): hyperelliptic/function-field geometry and characteristic-two models. The bounded two-chart equation criterion remains a target here. |
| PolynomialGaloisGroups/README.md | Layers 0 and 4 (442,777): faithful root action and intrinsic resolvents. The specific 40/27-point actions are surface comparisons. |
| EllipticCurves/README.md | Layers 3 and 4 (683,793): Hasse bounds and local elliptic/Tate geometry. Used with actual curves and valid local-field hypotheses. |

The requested mechanical dependency command completed successfully. Its complete output was:

```text
depcheck: 55 roadmaps, 635 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The Needs lists and internal routes do not use a later internal result to construct an earlier prerequisite. References to later applications, such as §0.1 pointing forward to the theorem §0.3, are not prerequisites for its definition.

### Declared gaps

All 19 README gap slugs, named suppliers and needs sentences match design/plan.json exactly; none has supplier none. The reasonableness request no longer duplicates near adequacy. Each remaining contract specifies the additional hypotheses or comparison missing from its supplier, rather than asking for its existing generic construction again.

| Contract group | Slugs and boundary |
| --- | --- |
| Surface structure | surface-open-image; surface-residual-endomorphisms: polarized surfaces, finite-base-change/isogeny invariance and residual-image endomorphism adapters beyond the generic Tate theorem. |
| Image and deformation | near-adequacy-reasonableness; integral-enormity; finite-tate-lift-local-control; unramified-lift-rigidity: eventual cyclotomic conditions, integral characteristic-zero image conditions, prescribed scalar ramification control and nonreduced coefficient algebras. |
| Ordinary geometry | local-neighbourhoods; dyadic-selfdual-polarized-lift; ordinary-polarized-three-model: finite-level/integral persistence and the actual compatible polarized models, not constancy of the whole p-adic representation. |
| Monodromy | genus-two-level-three-monodromy; siegel-prime-to-level-monodromy: prescribed curve families versus the general connected fine Siegel chart; neither is inferred merely from Hilbert irreducibility. |
| Automorphic comparisons | ordinary-spherical-attachment; forward-singular-spin-transfer; all-place-surface-comparison; all-place-exterior-transfers: spherical ordinary choices, singular weight, ramified factors and motivic normalization. |
| Other extensions | dyadic-weight-one-change; odd-rank-two-system-modularity; induced-character-client; strong-odd-symplectic-criterion: respectively the missing prime/weight range, regular compatible systems, the Galois dichotomy before induction, and the explicit symplectic criterion/class count. |

These are precise linked interfaces, not unowned prerequisites. Acceptance does not certify their eventual proofs or turn the supplier proof gates into unconditional theorems. All 19 slugs are recorded in review.json's conditional_gaps.

### Pinned declarations, headlines and Lean

Pins read from lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following declarations were opened at those pins, including their native bodies and relevant hypotheses.

| Pinned declaration | File and line; what it supplies |
| --- | --- |
| Matrix.J; Matrix.symplecticGroup | Mathlib/LinearAlgebra/SymplecticGroup.lean:58,101; block form (0,−I;I,0), submonoid with AJAᵀ=J. No arbitrary multiplier field. |
| Matrix.charpoly | Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132; determinant of the characteristic matrix. No Frobenius-class assignment. |
| Matrix.IsSymm | Mathlib/LinearAlgebra/Matrix/Symmetric.lean:33; transpose equality, not alternation in characteristic 2. |
| alternatingGroup; card_alternatingGroup | Mathlib/GroupTheory/SpecificGroups/Alternating.lean:72,136; sign kernel and half-factorial cardinality, with the nontrivial finite-type hypothesis. |
| alternatingGroup.isSimpleGroup | Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:203; requires at least five letters. |
| MulAction.stabilizer | Mathlib/GroupTheory/GroupAction/Defs.lean:515; the subgroup for the specified action. |
| Representation | Mathlib/RepresentationTheory/Basic.lean:48; monoid homomorphism to linear endomorphisms, with neither continuity nor finite dimension built in. |
| groupCohomology.H1 | Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:965; actual degree-one cohomology. |
| Polynomial.aroots | Mathlib/Algebra/Polynomial/Roots.lean:479; multiset after coefficient extension to a domain, counting multiplicity. |
| TauCeti.AlgebraicGeometry.AbelianVariety | TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95; group scheme over Spec K, properness and geometric integrality. No chosen dimension, polarization or H¹ realization. |
| TauCeti.schurMultiplier | TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:148; H² with coefficients kˣ, distinct from the integral A₅ multiplier. |
| Representation.exists_ne_zero_apply_eq_self_of_forall_pow_eq_one | TauCeti/RepresentationTheory/PGroupInvariants.lean:161; finite group, nontrivial module and p-power-order operators in prime characteristic. |
| TauCeti.IsHyperellipticFunctionField | TauCeti/FieldTheory/FunctionField/Hyperelliptic/Basic.lean:76; genus≥2 and a separable index-two rational subfield, not a polarized genus-two Jacobian. |
| TateModule | TauCeti/Algebra/Module/Torsion/TateModule.lean:115; compatible abstract torsion families, not the required ordinary polarized realization and attachment interfaces. |

By-object searches also distinguished existing polarized Hodge structures from polarized abelian-surface schemes and their finite flat torsion. No native cuspidal GSp₄/GL₄ automorphic carrier, ordinary surface realization, or framed genus-two Jacobian interface was found that would make the headline statements possible with only a few simple definitions.

The README headline list is §0.3 all-place comparison/analytic consequences; §§3.1–3.2 residual and dyadic automorphy; §4.10 exact local realization; §§6.2–6.3 switch and infinite realization; §§7.1–7.6 transfer, fifteen-image modularity, Theorems A/B and good/bad-reduction applications; §8.1 density; §§8.2–8.4 potentially abelian and Galois-type modularity; and §§8.7–8.8 prescribed mod-2 realization and residual modularity. Every one is named in the module docstring, with the missing actual carriers. The finite exceptional isomorphism is owned by A3.12; finite matrix/counting controls are not substituted for these endpoints.

The required lake env lean command was run from the pinned content checkout on packages/AbelianSurfacesModularity/Suggested.lean. It exited 0 with no output and no warnings. The file has one import Mathlib, the required module docstring and namespace, and zero declarations. Consequently the mechanical #check @name binder audit and the one-tactic padding probe each have zero cases. There is no missing TauCeti object file to build, no discarded section hypothesis, no sorry'd data, and no padding to delete. Elaboration is evidence of file form only.

The metadata and eight-entry source manifest parse. No source was fetched under a new key, no existing source entry was rewritten, and no new missing-reference request was needed. The reviewed README, Suggested.lean, metadata, sources and plan were left unchanged.

## Not verifiable

- KIS99 Theorem 5.1, THORNE17 Definition 2.20 and FC90's recorded degeneration locators remain settled uncertified citations. Their texts were neither requested again nor represented as read. The package gives separate supplier contracts for the stronger conclusions it needs.
- Exact 3-torsion resolvent identifications distinguishing 6G from 6H, conductors of the global examples, and the entire finite-subgroup cohomology classification behind Table 6.4.4 were not independently reproduced. Their source statements were read; the table's columns were visually verified. Independent point counts, matrix actions, lift-square controls and the A₅ cohomology computation are recorded above.
- The four additional board-head README requests for OrdinaryAutomorphicFormsAndModularityLiftingPartII at 7e88c38, PELModuliPartII at d4bb48d, ShimuraVarietiesPartII at 57dc0a4 and EndoscopicTransferAndUnitaryTraceComparisonPartII at 78eadae returned HTTP 404. Ownership against those inaccessible board package heads was not checked; this is not evidence that they do not exist. Ownership against the indexed main/open roadmap texts and available local board designs was checked. No supplier-absence finding relies on these failed reads.
- Published BCGP21 journal pagination was not checked; the package explicitly cites the legally read v3 preprint numbering. No published correction to the source issues below was verified.

## Source issues

- **Misprint** in BCGP25 at proof of Lemma 6.4.3, p.150 (line 6822): the source says the cyclotomic image is the intersection with GSp₄; it should be the intersection with Sp₄; affects nothing.
- **Misprint** in BCGP25 at proof of Lemma 9.1.6, p.190 (line 8755): the source says lift squares for 2C and 2D are I and −I; it should give −I and I; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 9.2.7, p.195 (line 8995): the source says vanishing of H² of the natural residual module implies all lifts are unramified; it should use the adjoint no-eigenvalue-ratio obstruction; affects the proof.
- **Error** in BCGP25 at Lemma 9.2.13, pp.196–197 (line 9083): the source says its three hypotheses force purely toric ordinary reduction; it should additionally exclude good nonordinary reduction, for example by requiring bad or semistable ordinary reduction; affects a stated result.
- **Error** in BCGP25 at proof of Lemma 9.2.14, p.197 (line 9111): the source says the split Tate curve's mod-3 representation is trivial; it should be μ₃ plus a trivial line, with dyadic Frobenius values −1 and 1; affects the proof.
- **Error** in BCGP25 at proof of Lemma 9.2.14, pp.197–198 (lines 9152–9172): the source says its diagonal-period action has centralizer 16 and double-transposition type; it should have centralizer 48 and triple-transposition type, fixing no odd theta characteristic; affects the proof.
- **Misprint** in BCGP25 at §9.2.16, p.198 (line 9182): the source says the integer Weil quartic has constant coefficient 1; it should have constant coefficient 4, giving X⁴+2X²+4; affects nothing.
- **Misprint** in BCGP25 at proof of Lemma 9.2.19, p.199 (lines 9232–9234): the source says the known nonsemisimple minimal polynomial and invariant subspaces are on A[3]; it should use Jac(X)[3], the source of the isogeny being factored; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 9.3.7, p.203 (lines 9413–9417): the source says the trivial étale module uses elliptic traces −1 and 2; it should use traces 1 and −2, since the printed pair gives scalar −1; affects the proof.
- **Misprint** in BCGP25 at proof of Lemma 9.3.7, p.203 (lines 9417–9419): the source says the mod-2 Frobenius orders for traces −1 and 2 are 2 and 3; it should give 3 and 2 respectively; affects nothing.
- **Misprint** in BCGP25 at proof of Lemma 9.3.7, p.203 (lines 9423–9439): the source says its two matrices represent (12)(345) and (125346) in the fixed column convention; it should label their inverses (12)(354) and (164352); affects nothing.
- **Misprint** in BCGP25 at the paragraph following Definition 9.2.1, p.192 (line 8869): the source says twisted rationality is BCGP21 Theorem 10.2.3; it should cite v3 Lemma 10.2.4, while Proposition 10.2.3 concerns the untwisted space; affects nothing.
- **Error** in BCGP25 at Lemma 10.3.6's [2,2,2] seed, p.220 (line 10220): the source says the listed seed is 3-distinguished; it should be replaced, since its quartic is (X²+2X+3)²; affects the proof.
- **Misprint** in ZARHIN00 at the opening of §5, p.5 (line 197): the source says A is the index-two subgroup of G even when G=A_n; it should define A as the index-two subgroup of S=Perm(B); affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3e8763d87a6d29ee3d283fcbd1812807e1b13656", "job": "REV-PKG-AbelianSurfacesModularity~4", "model": "gpt-6-astra", "worker": "chris-31"} -->
