# CMRankZeroConverse repair report

## F01 (P2) — not actionable in this package: KatoEulerSystems must export the full-range zeta contract

Unrestricted attribution → gap:all-coefficient-places-zeta in README and plan, propagated through Conventions and Layers 2–3. No coefficient place is excluded. Kato lines 4039–4071 support the full range, but the cited supplier revision is unavailable here. Exporting its missing cases requires its owner; this package cannot establish that export. The new scalar-rescaling Check distinguishes equality from normalized reciprocity.

## F02 (P3) — applied

Unnamed rational equality → ModularIwasawaMainConjectures §0.7 KMC_rational in §§2.3, 3.2, Scope and Layer 2–3 dependencies. Added the §§0.6–0.7 contract, including rational lattice independence and the dyadic restriction. Verified that supplier's definitions at its indexed head, and Kato Conjecture 12.10 at Kato lines 4165–4168. Updated the existing Kato manifest entry and reference locator.

## F03 (P3) — applied

“Native specialization” → an explicit restatement of ArithmeticStatisticsPartI §0.5's squareclassHeight on the same carrier for every number field. Updated Scope, Conventions, §6.1 and the Lean definition's docstring. The local definition remains solely for the headline signatures, which cannot import a proposed roadmap. Recomputed the rational, Gaussian, inverse-valuation and height-one Checks; added [2]=[i] explicitly.

## F04 (P3) — applied

Imaginary-quadratic-only definition prose → every field with a specified ℚ-algebra structure, matching the existing signature. Its API has that same generality; the coset and counting applications remain imaginary quadratic. The binder audit confirms Field and Algebra ℚ, with no NumberField assumption. The rational base-change, nonrational-j and square-multiple Checks still discriminate descent.

## F05 (P3) — applied

Unqualified attribution of all-prime corank invariance → explicit qualification by gap:isogeny-corank-all-primes in Scope and Layer 4 Dependencies. The gap already exists in both contracts and remains unchanged. EllipticCurves on main, Layer 7, states the classical Selmer construction and the ℚ BSD-quotient stretch goal, rather than this general corank export. The §4.3 and §6.1 routes already name the gap.

## Mathematical verification

The table records substitutions and calculations, not proofs of the headline theorems. Where a hypothesis excludes an instance, the failed hypothesis is recorded. Statistical finite counts below count the residue-class candidate sets, not numerically evaluated L-values. All API clauses and worked examples were compared with their defining objects; the changed height and zeta conventions were recomputed in their consumers.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Standing field and coefficient domains | ℚ, ℚ(i), 𝔽₂, zero ring | Degrees 1 and 2 over ℚ; characteristic 2 admits no ℚ-algebra; zero ring fails Field's nontriviality | General height and descent admit ℚ; CM headlines require degree 2 and total complexity | F03–F04 prose |
| §0.1 rank-r p-converse definition and transport | (corank, analytic rank)=(0,0),(0,1),(1,0); r=0,1 | Rank-zero implication: true,false,true; rank-one implication: true,true,false; equal input pairs have identical truth values | Both directions of the defining equivalence agree; no forward BSD assumption | None |
| §0.1 finite versus infinite Selmer antecedents | Full rational two-torsion, corank zero | Rational torsion dimension 2 gives dim Sel₂≥2 while p∞ corank=0 | Finite Sel₂=0 cannot replace corank zero | None |
| `ellipticLNonvanishingAtOne` and its analytic API | Congruent n=1 and n=5; F,2F,0 | n=1 has F(1)≠0; n=5 has F(1)=−F(1)=0; first Dirichlet coefficients 1,2,0 | Agreement fixes the actual continuation and rules out rescaling and zero | None |
| Same predicate, model independence | y²=x³−x and y²=x³−16x | Δ=64 and 262144; variable scaling (x,y)↦(4x,8y); native local polynomial uses the minimal model | Different displayed discriminants do not change the Euler factors | None |
| §0.2 central sign | k=0,1,2,3,4,6,7 | ε=1,1,1,1,−1,1,1; ε²=1 in each case; for k=2,4,6, ε(−1)ʰ=−1 | Arithmetic identity excludes k=0, where product=1 | None |
| §0.2 rational projection and API | c=diag(1,−1), v=(1,−1); coordinate swap on (1,0) | P₊v=(1,0), P₋v=(0,−1), sum=v; swap projection=(1/2,1/2) | Idempotence/eigenvalue laws hold; integral ℤ₂ preservation fails | None |
| §0.3 realization, conjugate dual and Frobenius conventions | k=2, ℓ=5, a₅=2; k=4 | Geometric roots 1±2i have product 5; after central twist product=1/5; arithmetic determinant becomes 5; at k=4,1−k+h=−1=1−h | Dual and twist directions match Kato lines 4793–4812 | None |
| §0.4 central evaluation and kernel definition | p=3,h=1,c=4; σ₋₁ at h=1,2; p=2 | ev(σ₄)=1/4; ev(σ₋₁)=−1,+1; ev(σ₋₁+1)=0,2; ev(p)=p≠0 | Twisting then augmentation gives inverse power; finite part must remain until rationalization | None |
| Corank, Kummer Tate module and dyadic convention | M=ℚ_p/ℤ_p and M=ℤ/p; real correction ℤ/2 | Dual rational ranks 1,0; rational Tate-module dimensions 1,0; (ℤ/2)⊗ℚ₂=0 | Typed dimensions agree; finite errors disappear rationally | None |
| §1.1 global invariant vanishing | Irreducible standard S₃ representation; reducible cyclic sign representation 1⊕sign | Fixed dimensions 0 and 1 | Irreducibility is essential to this route; the reducible case is excluded | None |
| §1.2 duality deduction | h⁰=h²=0, local h¹=2,h_f¹=1; hypothetical zero quotient | Euler gives h¹=1; finite kernel dimension 1−(2−1)=0; with quotient 0 it would be 1 | Two uses of duality are necessary; dual Selmer zero is derived | None |
| §1.3 global line | Rank-two odd involution; zero representation | 0−h¹+0=−1 gives h¹=1; zero representation gives 0=0 | Rank-two and oddness exclude zero-module counterexample | None |
| §1.4 geometric equals finite | Central crystalline eigenvalues at p=2,3; V=ℚ_p(1) | Moduli 1/√2,1/2,1/√3,1/3 are below 1; dim H_g−dim H_f=0 centrally, but 2−1=1 for ℚ_p(1) | Central statement holds at bad and small primes; arbitrary de Rham version fails | None |
| §2.1 central derived control | R→R, differential π, degrees 1,2; then H²=0 | H¹=0,H²=R/π; specialization H¹ has dimension 1=dim Tor₁(R/π,R/π); after H²=0 Tor₁=0 | Retains the degree-one correction and degree-two amplitude input | Full-range twist contract named |
| §2.2 central zeta definition and API | γ=0, wrong/correct sign at h=1,2; nonzero z and 2γ | z(0)=0; wrong sign gives z=−z hence 0; surviving signs +,−; z(2γ)=2z(γ), z(γ/2)=z(γ)/2 | Correct source, target, linearity and sign; no arbitrary generator substituted | Full-range supplier gap |
| §2.3 basis from KMC_rational | Local DVR quotients 0,R/π; zero projection | Lengths 0,1; characteristic ideals (1),(π); reduction of a unit generator is nonzero, reduction of zero is zero | Equality forces the required zero length; divisibility alone does not | Named supplier proposition |
| §2.4 nonfinite localization | Basis 1 of E; zero vector; an away-p ramified class | 1∉{0}; 0∈H_f at every place; a failed away-p condition keeps the ramified class out of global H_f | Contradiction applies to the constructed basis with all away-p conditions | Inherits §2.3 contract |
| §3.1 reciprocity and completed coefficients | k=2,4,6; F-rational basis; Euler factor 0 | Period exponents 0,1,2 and signs +,−,+; a nonzero E-linear map cannot kill both basis vectors; 0·L=0 | Formula used before completion; nonzero product needs no division by Euler factor | Full-range interpolation gap |
| §3.2 conditional converse and normalization Check | z↦2z over A, including p=2; localized quotient lengths 0,1 | A·z=A·2z since 2 is a unit; lengths unchanged; nonzero period value b changes to 2b≠b | Equality does not fix normalized reciprocity; all coefficient places retained | Gap plus KMC attribution |
| §3.3 all-prime CM converse | ℚ(i),p=2; ℚ(√−2),p=2; ℚ(ζ₃),p=3; ℚ(√−7),p=7 | i²=−1; (ζ₈+ζ₈³)²=−2; disc ℚ(ζ₃)=−3; quadratic Gauss sum at 7 has square −7 | Contained-cyclotomic-field cases remain included | No theorem restriction |
| §4.1 typed CM Selmer comparison | Two rank-one components; weight two; nonmaximal order at p=2 | dim V_pA=1+1=2; η̄=η∨(1); removing twist changes induced determinant by χ_cyc² | Rational coefficient extension and Tate-module comparison have matching types | None |
| §4.2 CM elliptic converse over K | p=2,3 and p dividing order index; central factors a,b≠0 | H_f summand dimensions 0+0=0; over ℂ, a·b≠0 | No good-prime or maximal-order restriction; no Sha-size conclusion | None |
| §4.3 corank doubling | Rational coranks 0,1; swapped ℤ₂² lattice | Doubled coranks 0,2; lattice spanned by (1,1),(1,−1) has determinant −2 and index 2 | Rational, rather than integral, doubling; isogeny step remains a supplier gap | F05 dependency qualification |
| §4.4 analytic-order doubling | (s−1)ʳu(s),u(1)≠0, r=0,1,2 | Product orders 0,2,4; leading units u(1)²≠0 | Matches finite analytic-order multiplication | None |
| §4.5 ℚ converse | p=2,3; 2r=0 in ℕ | r=0 gives 0; r=1 gives 2≠0 | Arithmetic is not reduction modulo p | None |
| §5.1 even Goldfeld definition and API | Limiting proportions 0,1/2,3/4,1; finite changes | Only 1/2 satisfies equality; changing one value changes ratio by 1/N→0 | Lower bound and exact limit distinguished | None |
| `congruentTwist` and model API, §5.2 | n=−1,0,1,2,3 | a₄=−1,0,−1,−4,−9; Δ=64,0,64,4096,46656; n=2 with wrong a₄=−2 gives Δ=512 | Sign symmetry, n² and ellipticity boundary agree | None |
| `congruentNumber_densityOne`, §5.2 | Positive family at X=0,1,300000 | Empty cutoff denominator 0; at 1 denominator 1; at 300000 permitted denominator 91180; leading term 3X/π²≈91189.0653 | Positive eventual denominator; finite empty cutoff does not affect limit 1 | None |
| `congruentNumber_half_positive`, §5.3 | Six squarefree residues; X=300000 | Residue counts (1,2,3,5,6,7)=(30393,30390,30397,30397,30403,30398); candidate ratio 91180/182378; asymptotic weights 3/6=1/2 | Density-one input and root-number upper bound give exact half | None |
| `congruentNumber_half_discriminants`, §5.4 | n=1,2,3; d=0,4,9; X=300000 | Signed pairs (1,−4),(8,−8),(12,−3); filter rejects 0,4,9; allowed candidate count 91169/182370; leading weights 3/6=1/2 | Both signs and nonuniform cutoffs retained | None |
| §5.4 twist scaling | d=8 versus n=2 | a₄=−64 versus −4; −4·2⁴=−64; a₆=0·2⁶=0 | Same pointed elliptic twist after scaling | None |
| `squareclassHeight` and representative independence | ℚ: [2],[1/2],[8]; ℚ(i): [5],[20] | Valuations 1,−1,3 all odd give 2; H([5])=25=H([20]), with extra valuations even | Negative odd valuations included; multiplication by squares invisible | F03 generality and attribution |
| Height positivity and trivial/unit API | ℚ: [1],[−1]; ℚ(i): [1],[i],[2] | Empty odd support product=1; (1+i)²=2i and −i·2i=2; all listed heights=1 | Height one permits nontrivial unit classes | Added Gaussian [2] witness |
| Height finiteness and cutoff API | ℚ at X=1,2,3; Gaussian height-one set | Counts 0,2,4 over ℚ (±1 then ±2); Gaussian [1],[i] already give two classes at X=2 | Strict cutoff and finite fibres agree for general number fields | Prose applies to every number field |
| `cmTwists_nonvanishing_lowerHalf`, §6.1 | K=ℚ(ζ₃),ℚ(√−2),ℚ(i); ε=1 | O_K/(3) respectively 𝔽₃[e]/(e²),𝔽₃×𝔽₃,𝔽₉, so h3=true,true,false; at ε=1 left bound is −N/2≤0 | Split and ramified included, inert excluded, negative lower bound harmless | Height consumer rechecked |
| CM predicate in both Lean proportion headlines | y²=x³−x over ℚ(i) and over ℚ(√−2) | End_K ranks 2 and 1; ℤ→End_K is nonsurjective and surjective respectively | Predicate names full base-defined CM, not merely geometric CM | None |
| §6.1 maximal-order route | Norm-three CM isogeny; even Selmer ranks with mean ≤1 | Global ratio 3·(1/3)=1 for K; nonzero even rank is ≥2, so its proportion ≤1/2 | Lower corank-zero half follows; transfer to other orders uses rational isogeny corank | Gap remains explicit |
| §6.2 cube-sum definition and invariant API | n=−1,0,1,3 | a₆=−27,0,−27,−243; Δ=−314928,0,−314928,−25509168; c₄=0 gives j=0 only when Δ≠0 | n², singular boundary, sign symmetry and base change agree | None |
| §6.2 forward map | (x,y,z)=(1,2,1), n=−1,0,1,3 | F=11,9,7,3; G(forward)=1188,0,756,2916=108n²F | Expansion holds off the cubic as well as on it | None |
| §6.2 inverse map | (X,Y,Z)=(2,3,1), n=−1,0,1,3 | G=28,1,28,244; F(inverse)=−1512,0,1512,39528=54nG | Both polynomial directions verified | None |
| §6.2 composites, origins and uniformizer | n=1,−1,0; marked [1:−1:0] | Composite scalar 18,−18,0; origin maps to [0:18n:0]; (1,1) at n=1 maps to (3,0); X/Y pulls back to 2z/(3(x−y)), a unit times z at origin | Pointed comparison holds for n≠0 and fails at 0 | None |
| §6.3 full cube-sum CM | α(X,Y)=(ζ₃X,Y); identity; base field ℚ | α³=1, α≠1, 1+α+α²=0; identity would give [3]≠0; End over ℚ has rank 1; disc(T²+T+1)=−3 | Primitive root and coefficient field hypotheses discriminate full CM | None |
| `descendsToRat` and its API | Rational model over ℚ and ℚ(i); singular model; nonrational-j model | Identity change C=1 witnesses descent of rational model; singular Δ=0 cannot come from elliptic E; nonrational j=(6912−93312i)/733, Δ=−64−864i≠0 | Any ℚ-algebra field admitted; pointed changes preserve descent in both directions | F04 prose |
| Descent under square-multiple twists | t versus 4t; t=0 | Short coefficients scale by 16 and 64, a fourth/sixth-power change with u=1/2; t=0 has twist discriminant 0 | Squareclasses, rather than arbitrary scalars, index elliptic twists | None |
| §6.4 descent-coset theorem | j=0 exponent-two quotient; j=1728, K=ℚ(√−2); t=t₀ | [u]³=[u]; (√−2)²=−2; native a₄=−(4√−2)²=32 scales to 2; first branch at t=t₀ has q=u=1 | One coset at j=0; second coset necessary at 1728, with no descent hypothesis on A itself | Definition generality does not broaden theorem |
| §6.5 descent height count | ℚ(i), rational primes 5,3,2 | H([5])=25,H([3])=9,H([2])=1; outside ramification H([ℓ])=ℓ²; at X=10⁶ square-root scale is 1000 | Finite exceptional support and two cosets give O(√X), not linear order | Height consumer recomputed |
| `cmTwists_nondescending_nonvanishing_lowerHalf`, §6.6 | c=C=1, X=10⁶; starting proportions 1/2,3/4; empty descent set | Removed ratio ≤1000/1000000=1/1000; lower ratios ≥0.499,0.749; empty descent set loses 0; restricted denominator ratio tends to 1 | Same lower half, with no exact-density claim | Broader definition leaves headline hypotheses unchanged |

### Supplier-gap boundary checks

These computations test the requested statements' boundaries; they do not mark any supplier gap as fulfilled.

| Contract | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| gap:all-coefficient-places-zeta | h=1,2; z↦2z; p=2 | Surviving signs +1,−1; generated A-module unchanged, period value b↦2b; 2∈A× | Requires actual normalized map at every λ, independently of ideal equality | Added in both permitted locations |
| KMC_rational contract | H²=0,Z=H¹; H²=R/π,Z=H¹; finite lattice quotient at p=2 | Ideal pairs (1),(1) and (π),(1); (O/2O)[1/2]=0 | First equality holds, second fails; rational lattice independence permits dyadic finite errors | Supplier attribution added |
| gap:newform-central-analytic-interface | Euler factor 0 and full value b; coefficient conjugation b=1+i | Product=0·b=0; conjugate value 1−i | No division by a zero bad-prime factor | Unchanged |
| gap:elliptic-quadratic-analytic-identities | Product (s−1)·(s−1); positive n=1,5 | Orders add to 2; signs +1,−1 | Full factors and actual positive-parameter root numbers required | Unchanged |
| gap:isogeny-corank-all-primes | Degree 2 at p=2 on rational Tate modules | Composites become multiplication by 2, invertible over ℚ₂; rational ranks agree | Coprimality to p unnecessary | Attribution qualified |
| gap:pointed-cubic-model-comparison | n=1; correct and incorrect marked points | [1:−1:0]↦[0:18:0]; (1,1)↦(3,0)≠origin | Marks are part of comparison | Unchanged |
| gap:kato-rational-duality | Rank-two odd W; ℤ/2 error | Euler RHS=−1; real error rational dimension=0 | Rational Euler/amplitude contract distinct from finite-coefficient duality | Unchanged |
| gap:central-jstar-control | Differential π on a two-term DVR complex | H²=R/π and degree-one Tor dimension=1 | Exact Kato-complex control must retain this correction | Unchanged |
| gap:central-finite-conditions-and-descent | Quadratic restriction/corestriction at p=2 | Both composites [2], invertible after tensoring with ℚ₂ | Rational finite conditions at bad places remain required | Unchanged |
| gap:central-modular-local-dimensions | k=2,r=1; c=4 in 1+3ℤ₃ | h¹=2,h_f¹=1; κ⁻¹(c)=1/4 versus κ⁻²(c)=1/16; equality would require finite character value 4 | Critical range excludes the weight-two local exception | Unchanged |
| gap:theta-induction-arbitrary-cm-curve | A/K without descent; split coefficient field | Two rank-one summands induce rank-two representations; central twist is 1 | ℚ-descent cannot be an input to the arbitrary-A/K comparison | Unchanged |
| gap:cube-sum-full-cm | k=ℚ(ζ₃) versus ℚ | End ranks 2 versus 1; order-three generator present versus absent | Descent of geometric endomorphisms needs ζ₃ in k | Unchanged |
| gap:smith-unconditional-positive-corank | Positive squarefree permitted residues; full two-torsion | Three of six residue classes; corank-zero can coexist with dim Sel₂≥2 | Requires unconditional corank law, not finite-Sel₂ vanishing | Unchanged |
| gap:cm-three-selmer-unconditional | Norm-three maximal-order isogeny over K | Ratio 1; mean even rank ≤1 forces zero-rank proportion ≥1/2 | Windowed counting assumption still must be discharged by owner | Unchanged |

## Sources, ownership and citation audit

Read the legal cached extractions of all three cited works. The new source use is Kato Conjecture 12.10, p. 224, Kato lines 4165–4168; its work already has the unique manifest key Kato. No new source was fetched or needed, no source was renamed, and no missing-reference request was created. BT continues to mean the seven-page arXiv v2; BKLOS locators mean its author version. The general zeta statement is Kato Theorem 12.5(1), p. 221, Kato lines 4039–4071; the non-CM conditional-converse generality is independently stated at BT line 251. BKLOS line 80 gives the height for arbitrary number fields; the even-Selmer argument and nonmaximal-order passage were reread at BKLOS lines 654–661 and 831–879.

The content checkout HEAD equals origin/main at e98875dbbea872d0496e323bc880e2b7fd00beb9. Its manifest pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Read LocalGaloisGroups and PadicMeasuresIwasawaAlgebras on main as form examples before editing.

Used `roadmaps list`, `roadmaps grep` by object and `roadmaps show` for indexed suppliers, supplemented by the readable main and board copies. The resolver still gives two leads: KatoEulerSystems and ModularIwasawaMainConjecturesPartII. The latter has its complete named CZ.4–CZ.6 target list in its board design. The former has no readable README in this checkout, no indexed open roadmap, and its quoted a3ba9c5 revision is not a local Git object. Therefore this round does not certify that head's admissibility definition or section contents. It instead records the full-range contract as an external requirement supported directly by Kato. Existing numbered KatoEulerSystems interfaces remain owner contracts, not claims of library implementation. No unavailable supplier target was invented.

The resolver's header describes its indexed main as 1ce5c4f and says it has no pinned Lake packages; that is not the content checkout or the library audit used here. Main citations and pinned declarations were checked directly against the paths supplied in the brief. Ownership against indexed open heads was checked; ownership against any open pull-request files not provided or exposed by that index was not checked.

| Roadmap citation | Copy and exact content checked |
| --- | --- |
| ModularForms | Main Layer 7, L-functions, completion and analytic rank; no duplicate theta construction introduced |
| EllipticCurves | Main Layers 1,5,7; Layer 7's Selmer construction and ℚ-only Cassels stretch do not assert the requested general p∞ corank theorem |
| AlgebraicCurves | Main Layer 10, plane-curve function fields, degree-one places and Weierstrass point–place dictionary |
| AutomorphicGaloisRepresentations | Indexed head §§1.5,3.15,4.4–4.8,6.4,7.2; actual realization, CM predicate, all-λ irreducibility, local compatibility and purity |
| ArithmeticGaloisDuality | Indexed head R02.4.3–R02.4.4,D7.3,D7.5–D7.7; finite duality, compact Shapiro and rational/local-condition versions; j_* specialization remains its named gap |
| SelmerIwasawaCohomology | Indexed head §§2.4,2.10–2.12a,2.19–2.20,3.0,3.7,3.10,3.13–3.16,4.9,4.26,4.29; corank/Kummer, completed algebra, twists, derived control, j_* corrections and parity |
| PadicHodgeRegulators | Indexed head §§0.1,1.1–1.8; φ=p⁻¹, finite/geometric conditions, kernel of exp*, dimension formulas and finite-condition Shapiro |
| ModularIwasawaMainConjectures | Indexed head e954663 §§0.6–0.7; same Kato complex and zeta module, KMC_rational, KMC.changeLattice and dyadic height-one restriction |
| ModularIwasawaMainConjecturesPartII | Board design §§CZ.4–CZ.6, all five cited target identifiers; all-prime CM equality and normalization |
| GL2AutomorphicRepresentationsAndTransfer | Indexed head R17.4.16 quadraticInduction; all-place induction and full L-identity |
| ComplexMultiplicationAndExplicitReciprocity | Indexed head §§1.1,1.2,4.1–4.2; complex End/Aut, self-twist, components, all-prime factors; arbitrary-A/K theta realization remains its gap |
| EllipticCurveModularity | Indexed head R29.6, “Continuation and the functional equation”; agreement on Re(s)>3/2 including bad factors |
| ArithmeticStatisticsPartI | Indexed head 3b1a24f §§0.1–0.2,0.5–0.7,0.15; identical squareclass height, piecewise rescaling, six residue counts and positive squareclass denominator |
| ArithmeticStatisticsPartVII | Indexed head §§5.9–5.11; Smith-law implication and CM numerator retaining C; both unconditional gaps remain necessary |
| RankOneConverse, RankZeroOneBSDPartII | Board design ownership/consumer sections; neither supplies this deduction |
| NonordinaryCMSpecialValues, InertAnticyclotomicCMMainConjecture | Board designs; anticyclotomic theories are mentioned to delimit ownership, not substituted for the cyclotomic equality |

Object searches on main, indexed open heads, board packages and pinned libraries distinguish the CM converse/application ownership from existing statistical and general cohomological theories. In particular ArithmeticStatisticsPartVII §5.9 assigns the analytic converse downstream. KMC_rational and the height keep their existing owners. No new theorem, carrier, duplicate fully qualified declaration name or proof theory was added here. No ownership was moved to a later supplier.

The 42 library locators opened include every declaration cited in Exact supplier contracts: Mathlib Weierstrass.lean:76,86,131,230,366,388; EllipticCurve/LFunction.lean:44,79,84; ModularForms/LFunction.lean:134,190; Analytic/Order.lean:523,528; Analytic/Uniqueness.lean:234; DedekindDomain/Factorization.lean:309,596; Ideal/Norm/AbsNorm.lean:258; NumberField/Basic.lean:101; Cyclotomic/Basic.lean:652; NumberField/Cyclotomic/Basic.lean:56 and Ideal.lean:83,106,124. Tau Ceti: SquareClassGroup/Basic.lean:45,66; Newforms/AnalyticInvariants.lean:72,80,107; LFunction/EulerProduct.lean:217; LFunction/FunctionalEquation.lean:324; ModularForms/Conjugate.lean:298; ShortWeierstrass.lean:109,168; NormalForms.lean:131,140; QuadraticTwist/Basic.lean:169,411,739; Isogeny/Hom/Basic.lean:106 and Ring.lean:174; Newforms/Newform.lean:104; CompletedGroupAlgebra/Basic.lean:145.

The native squareclass quotient is Additive Kˣ modulo squares, so its representatives cannot be zero. FractionalIdeal.count sets the zero ideal's valuation to zero, but that branch cannot occur here. Ideal.absNorm is the quotient cardinality, not a norm of a chosen field element. Weierstrass IsElliptic is invertibility of Δ. QuadraticTwistOf has no ellipticity hypothesis and uses t²−4n, giving 4a at (0,−a); its ellipticity theorem requires this parameter nonzero. The native generic twist-classification theorem excludes j=0,1728, while the roadmap treats these by the supplied short-form coefficient transformations. These actual definitions justify the computed negative controls.

Object searches in the pinned elliptic/modular directories find finite two-descent Selmer carriers at Tau Ceti MordellWeil/SelmerGroup.lean:104 and SelmerGroupA.lean:129, not the classical p∞ or modular Bloch–Kato Selmer carrier. Newforms/Newform.lean:104 bundles an eigenform and newspace/normalization data, not a modular Galois realization or zeta morphism. The module docstring's unstatable converse headlines therefore still have no permitted native statement; no scalar stand-in or extra API theorem was introduced.

## Mechanical checks and maintainer consequences

- Acceptance elaboration: `lake env lean` on `packages/CMRankZeroConverse/Suggested.lean`, from the content checkout, exited 0. Exactly five warnings, each “declaration uses sorry”, at lines 55,67,78,106,132. All four imported Tau Ceti module objects were available; no build was needed and no process remains running.
- Binder audit: elaborated a scratch copy with `#check @name` for all nine declarations, exited 0 with the same five warnings. The three finite-count limits have no extra binders. Both CM headlines retain Field, NumberField, IsTotallyComplex, degree two, non-primality of (3), ellipticity, non-scalar endomorphisms, ε and ε>0. The height retains Field and NumberField; descent retains Field and Algebra ℚ. Every elaborated type was compared with the README. No binder was lost; F03–F04 change the prose to match existing types, with no signature changes.
- Form and consistency: one `import Mathlib` and the same four used Tau Ceti imports; five headline theorems with sorry and four real definitions. No set_option, sorry'd data, admitted examples or new padding. All nine names occur in the README. The height docstring alone changed in Lean. All 13 gap slugs/suppliers/needs match the plan verbatim, with one new gap. A structural comparison confirms every top-level plan field except gaps is unchanged. TOML parses; all edited deliverables use repository-relative paths. `git diff --check` passed.
- No gate failures were listed separately in the brief. Both resolver leads and their verification limits are recorded above. No tooling, merge-order, pull-request, other-package or content-checkout file was edited.

The dependency check on the final README exited 0, with this exact output:

```text
depcheck: 52 roadmaps, 594 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The new named supplier ModularIwasawaMainConjectures and the zeta-gap owner KatoEulerSystems both precede this package in the supplied merge order. No declaration was renamed or removed, so consumers need no Lean-name migration. The general conditional converse still requires the external full-range Kato export; this report does not certify an unavailable supplier head or discharge that prerequisite. The CM theorem and downstream applications retain every prime, coefficient place and CM order.
