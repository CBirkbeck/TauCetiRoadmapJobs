# Repair report: AbelianSurfacesModularity

## F01 (P1) — applied

Diagonal product periods → coupled symmetric periods in §4.7, with explicit norm-minus-one cube, torsion basis, Weil pairing and theta count. The diagonal twist becomes a negative control. Added gap:polarized-toric-algebraization at NeronModelsAndSemistableAbelianVarieties §3.14. The full table (§4.10), switch (§§6.1–6.2), Layer 7 endpoints and Worked examples retain class 2C through this seed. Evidence: BCGP25 line 9163; calculations below.

## F02 (P2) — applied

The former §2.3 target and reverse supply claims → ownership by NeronModelsAndSemistableAbelianVarieties §6.13. Removed both consuming Needs references. Kept the two order-48 parabolics as a Check of §2.1. Updated Scope and Layer 2 Dependencies. Supplier §6.13 explicitly includes the order-eight intersection and native fixed-vector argument; BCGP25 line 8825 supplies the source comparison.

## F03 (P2) — applied

The former §6.1 target → consumption of InverseGaloisAndArithmeticFundamentalGroups IG.2.5 and IG.2.7 in the switch, infinity theorem and mod-2 realization. Removed gap:projective-thin-count from README and plan, and the approximation headline from Suggested.lean. IG.2.7 supplies weak approximation with Hilbert conditions; its complement formulation follows from IG.2.5. Section 8.1 retains only the integral-box count.

## F04 (P2) — applied differently

“All non-isogenous elliptic products fail BCGP21 modularity” → some products fail it, in both §0.1 occurrences. BCGP25 line 758 supports existence; BCGP21 line 12064 imposes cuspidality without general type. The suggested Yoshida example is unnecessary for this repair and is not promoted to an additional theorem without its own source verification.

## F05 (P3) — applied

Nonexistent §7.9(c)/(a) labels → §7.9 (adequacy)/(weak adequacy) in §§1.5 and 2.5. ArithmeticGaloisRepresentations §7.9 defines both predicates without lettered items; its adequacy comparison retains the distinct adjoint and adjoint-quotient conventions. No mathematical hypothesis changed.

## F06 (P3) — applied

“R17.5.1–R17.5.7” → “R17.5.1 and R17.5.4–R17.5.7” in the supplier contract and §8.2 Needs. The supplier's headings contain those sections and omit R17.5.2 and R17.5.3. The solvable Artin input is unchanged.

## F07 (P3) — applied

Integral-model attribution to AlgebraicCurves Layer 10 → RelativeJacobiansAndIntegralCurveModels §§0.1–0.3 and 2.4, in Scope, contracts and consumers. Added the two-chart weighted-projective smoothness target, its characteristic-two and odd-characteristic forms, API and four Checks in §4.4. Updated §§5.1 and 8.1. Recomputed smooth counts 768 and 1296 and the affected finite-field examples below.

## F08 (P3) — applied

Two identical fixed-vector supplier paragraphs → one, under From Tau Ceti. Deleted the copy under AbelianSchemesAndArithmeticModuli. The retained paragraph matches the pinned theorem at TauCeti/RepresentationTheory/PGroupInvariants.lean:161.

## F09 (P3) — applied

Deleted the two self-dependencies and §5.2's dependency on §5.3. Ordered the class classification before its application, odd-theta moduli before local realization, and the type dictionary before automorphy. Renumbered affected sections and synchronized references, Suggested.lean and source metadata. The direct 6G proof also removes its parametrization dependency. The local Needs graph has no self-edge, forward edge or cycle.

## F10 (P3) — applied

All seven uses of “corrected” → timeless names. Section 4.6 states that BCGP25 Lemma 9.2.13 omits hypothesis (4); §8.7 states that the source's [2,2,2] curve is not 3-distinguished. Examples, Dependencies and References now use the mathematical objects' names. Evidence: BCGP25 line 9083 and line 10220; the numerical counterexamples are recorded below.

## F11 (P3) — applied

Large C★ coefficients and the precision comparison → the directly established small curve of Lemma 9.2.17, now §4.9, with three recomputed Checks. Deleted the dataset-census target and all scope/build promises of that target. The conductor-1982 boundary example remains attached to the bad-reduction theorem. Evidence: BCGP25 line 9214 and §10.1, Table 10.1.1.

## F12 (P3) — applied

The overbroad strong-oddness gap → only the translation to ψ(c_v)J, nonzero-diagonal test and symplectic involution-class count, identically in README and plan. PL.4's Strong residual oddness at a real place already includes the general even-rank alternating/nonalternating dichotomy through its proposed complexConjugation_dichotomy. Evidence: that API item; BCGP25 line 5334 and line 5348.

## F13 (P3) — applied

The duplicated, incorrect BCGP21 cited_for entries → one entry naming Conventions, §0.1, §§1.4 and 7.1, §4.8 and §8.3 in the final numbering. Added Definition 10.2.2 to its locator. Evidence: BCGP21 line 9681, line 12056, line 12064, line 12166, line 12966, line 12991 and line 13038.

## Mathematical audit

Section numbers below are the final README numbers. The rows test statements and their hypotheses, rather than purporting to prove deep modularity theorems by finite examples. All automorphy conclusions retain the README's named lifting, classification and comparison premises. In particular the new algebraization prerequisite is a supplier gap, not a claim that the supplier already states its converse.

For the 2C calculation, use basis (e₁,e₂,f₁,f₂), S=((0,1),(1,0)), K₀=((0,I),(I,0)), K₁=((0,I),(I,S)). The diagonal-period Frobenius is M₀=((S,S),(0,S)); the coupled-period Frobenius is M₁=diag(S,S). Quadratic refinements are evaluated on all 16 vectors. Odd refinements have six zeros. Enumeration of form-preserving matrices gives 720 matrices for either Gram matrix. These calculations use the pairing determined by the actual periods.

| Statement | Instances tried | Computed values on the two sides | Result / change |
| --- | --- | --- | --- |
| Frobenius and Euler conventions | Trace 1 over 𝔽₃; product | Q=X²−X+3; denominator=1−T+3T²; product=(1−T+3T²)² | Degrees 2 and 4 agree; inverse Frobenius would give constant 1/3. |
| Cyclotomic and scalar conventions | Geometric Frob₂ modulo 3; ±I | ε(F)=2⁻¹=2=−1; ν(±I)=1 | Scalars cannot be outer Frobenius lifts. |
| Alternating-form convention | e₁,e₄; e₂,e₃; e₁,e₂ | Pairings 1,1,0; integral alternating 2×2 block squares to −I | Matches J after the stated basis/sign change. |
| Hodge–Tate and analytic normalization | Duality; twist by ε⁻³; s=0,1,2 | {0,0,1,1}→{0,0,−1,−1}→{3,3,2,2}; 0↔2, 1↔1 | Weight and centre conventions agree. |
| §0.1 modularity definition | Two modular elliptic factors | Dimensions 2+2=4; r=2; denominator degrees 2+2=4 | Products admitted, including equal factors; stronger modularity failure is existential. |
| §0.1 isogeny invariance | Identity and an isogeny of degree 3 | Rational H¹ dimension 4 on both sides; multiplication by 3 kills A[3] but is an isomorphism rationally | Rational system, not integral torsion, is compared. |
| §0.1 uniqueness of normalized isobaric support | Cuspidal GL₄ versus elliptic product | Supports have respectively 1 and 2 cuspidal constituents, total rank 4 in each | Rank equality alone cannot identify the supports. |
| §0.1 higher exterior powers | A rank-four H¹ system | Exterior ranks 1,4,6,4,1 in degrees 0–4 | The explicit all-place exterior-transfer gap remains necessary. |
| §0.2 distinguishedness definition and criterion | E×E versus traces −1,2 at 3 | Repeated Q_E² versus Q₋=X⁴−X³+4X²−3X+9; Q₋(1)=10 | Repeated unit roots fail; unequal traces give distinct unit roots. |
| §0.2 residual distinction | Same trace pair; unramified quadratic twist | Both traces are 2 modulo 3; reduced Q=X²(X+1)², while Q is nonsquare; twist gives Q₊(1)=18 | Characteristic-zero distinction does not imply residual distinction; common twist preserves inequalities. |
| §0.3 transfer normalization | GL₄ witness; GL₂ constituent; product | (1−4)/2=−3/2; (1−2)/2=−1/2; product system splits 2+2 | Absolute irreducibility excludes the product from a cuspidal GL₄ conclusion. |
| §0.3 functional equation | s=0,1,2; two elliptic factors | s↦2−s gives 2,1,0; two Γ_ℂ(s) factors | Centre 1 and degree-four archimedean factor agree. |
| §1.1 class partition | All ten listed class sizes | 36+540+540+1620+1440+1440+4320+6480+5184+4320=25920 | Exactly half of projective similitude order 51840. |
| §1.1 polynomial versus class | 2C/6G/6H; 4C/4D | First three share X⁴+2X²+1; second pair has 40-point type 4¹⁰, but 27-point fixed counts 1 and 5 | Neither polynomial nor the 40-point action alone suffices. |
| §1.2 projective class and quadratic twist | g and −g; 2C and 2D | (−g)²=g²; lift squares −I and I respectively | Projectivization forgets precisely the scalar sign. |
| §1.2 forbidden quartics | Both signs | (X²+X+2)²=(1,2,2,1,1); opposite sign=(1,1,2,2,1) modulo 3 | Both directions of the forbidden-polynomial criterion retain the two classes. |
| §1.3 regular semisimplicity | Order 5 versus class 4C | X⁴+X³+X²+X+1 has derivative gcd 1; a squared quadratic has gcd of degree 2 | Four distinct roots versus two repeated roots. |
| §1.4 image classification | Full group; the two order-64 examples | Full order 103680, symplectic order 51840, index 2; 25=15+10 and 10=4+3+3 | Embedded subgroup and cyclotomic kernel remain part of the data. |
| §1.5 non-adequacy | First-order versus reduced deformation | Dual numbers have ε²=0, ε≠0; adjoint dimensions 16=10+6; specialization ε↦0 loses the first-order class | Cohomological obstruction is not replaced by irreducibility. |
| §2.1 basis/generator dictionary | Two involutions and the five-cycle | Orders 2,2,5; ranks of M−I for the involutions 2 and 1; group orders 720=720 | Matrix normalization retains the supplied exceptional isomorphism. |
| §2.1 parabolic boundary Check | Triple-transposition centralizer; point-stabilizer intersection; transposition centralizer | Orders 48,8,48; first is S₄×S₂ and intersection is the nonabelian order-eight group | Equal order does not identify Siegel versus Klingen; target remains with the supplier. |
| §2.2 rational branch-point criterion | Trivial image, full S₅(b), full S₅(a) | Fixed letters 6,1,0 respectively; trivial action has 15 nonzero 2-torsion vectors | Both directions use a fixed letter, not containment in an arbitrary S₅ embedding. |
| §2.3 strong oddness | I, transvection, double and triple transpositions | rank(g−I)=0,1,2,2; diag(gJ)=0000,1000,1100,0000 in the displayed representatives | Identity and triple transpositions fail; equal rank 2 does not settle oddness. |
| §2.4 A₅ representations | Order 3; order 5 | On V, eigenvalues 1,1,ω,ω⁻¹ have Brauer trace 1; four distinct fifth roots have sum −1 | The alternative repeated order-three spectrum would have trace −2. |
| §2.5 near adequacy versus adequacy | Four-dimensional A₅ module in characteristic 2 | H¹(A₅,k)=0, H¹(A₅,ad)=0 but H¹(A₅,ad/k) has dimension 1; 2 divides 4 | Distinct cohomology carriers retained; citations now name the right predicates. |
| §2.6 CM restriction | Index at most two in A₅; identity and nonidentity conjugation | Potential subgroup orders 30 or 60; no quotient C₂ leaves order 60; oddness diagonals 0000 versus 1100 | CM restriction preserves image; nonidentity real-place hypothesis is necessary. |
| §3.1 residual A₅ automorphy | Full S₅(b) and A₅(b); quadratic sign character | Orders 120→60 and 60→60; double-transposition sign +1 | Solvable base change can kill the sign without killing A₅. |
| §3.2 2-adic modularity | Double versus identity conjugation; elliptic product | Orders 2 versus 1; product has two geometric idempotents versus scalar endomorphisms | Product and identity controls do not meet the residual A₅ and real-place hypotheses. |
| §4.1 ordinary Weil predicate | X⁴−X²+4; (X²+2)²; zero polynomial | b=−1 odd versus b=4 even; constants 4,4,0 | Absolute root size alone does not imply ordinarity; zero is excluded. |
| §4.1 reciprocity and division | Q=X⁴−X²+4, p=2, x=1 and 0 | Q(2)=16=4Q(1); at 0 total division would give 0 versus 16; cancelled polynomial gives 16=16 | Field-valued formula keeps x≠0; formal identity needs no division. |
| §4.1 product and root bounds | Traces −1,2 at p=3 | b=(−1)·2+6=4; Q(1)=10; total degree 4 | Agrees with product formula and two unit roots. |
| §4.2 dyadic quartic classification | Row multiplicities and opposite middle coefficients | 3+1+4+2+2+4=16; b=±3 both reduce to 0 modulo 3 | Integral quartics remain distinguished from their reductions. |
| §4.3 three dyadic Jacobians | C₁,C₂,C₃ over 𝔽₂ and 𝔽₄ | Point-count pairs (5,7),(3,7),(3,3); (a,b)=(2,3),(0,1),(0,−1); Q(1)=14,6,4 | All recomputed from the displayed generalized equations. |
| §4.4 smoothness, characteristic 2, affine chart | h=1,f=x⁵; h=x³+1,f=x²+x; h=f=0 | Gcds 1,1,0 respectively; second eliminant x⁶+x⁵+1 | Unit-ideal condition includes the zero-polynomial case correctly. |
| §4.4 smoothness, characteristic 2, infinity | h=1 and f=x⁵ versus x⁶ | h₃=0 in both; h₂²f₆+f₅²=1 versus 0 | First smooth, second singular; an affine-only criterion fails. |
| §4.4 smoothness, odd characteristic | h=0, f=x⁵−x versus x⁴−1 over 𝔽₃ | Both affine gcds 1; infinity multiplicities 1 versus 2 in reversed degree-six forms | First smooth genus two, second excluded. Completing the square uses 2 invertible. |
| §4.4 geometric genus | Smooth double-cover model | π_*O=O⊕O(−3); χ=1+(−2)=−1; g=1−χ=2 | The two charts cover the equation: the ambient point [0:1:0] gives Y²=1, not 0. |
| §4.4 dyadic equation census | All 16 h and 128 f | 2048 total, 768 smooth, 384 ordinary, 384 nonordinary; ordinary class counts 32+16+48+96+192=384 | Smoothness and ordinary counts independently recomputed; source class labels retained. |
| §4.4 marked-class exclusion and twists | Q mod 2=X²(X²+X+1); twist by √5 | Q(1)=1 modulo 2; twist a↦−a, b↦b | Odd point count conflicts with rational 2-torsion; both scalar lifts remain available. |
| §4.5 good-reduction exclusions | Q=X⁴+X³−X²+2X+4; reference 6H/6I | Q(1)=7; reference Q(1)=4,6 | S₅(b) ordinary hypothesis excludes the odd-point-count case. |
| §4.5 eigenvalue-ratio argument | α a root of X²+X+2 modulo 3 | If −α were also a root, subtracting equations gives 2α=0; α=0 would give constant 2≠0 | Ratio −1 cannot occur, including repeated-root lifts. |
| §4.6 toric rank | Good nonordinary Y; positive toric rank 1 or 2 | Y: counts (3,9), Q=X⁴+2X²+4, b=2, Q(1)=7, t=0; X²+1 takes values 1,2,2 on 𝔽₃ | Retains missing bad-or-ordinary hypothesis; no invariant line leaves t=2,a=0. |
| §4.7 product seeds | X×Y, Y×Y′, X×X′ | Mod-3 polynomial for first=(1,1,1,2,1); second integer quartic X⁴+3X²+4; third (X²−1)² | Classes 8A,4D,2D; product 2-torsion is trivial and fixes all 6 odd characteristics. |
| §4.7 norm-minus-one cube | u²−u−1=0; t=u³ | σu=1−u; N(u)=−1; t=2u+1, t²=8u+5, N(t)=−1, σt=−t⁻¹ | Explicit unit and cube exist in the unramified quadratic field. |
| §4.7 period lattice and descent | λ₁=(q,t²), λ₂=(t²,q) | φλ₁=λ₂; φλ₂=(q⁻¹,t⁻²)=λ₁⁻¹; period matrix equals its transpose | R acts on both period and character lattices; polarization datum descends. |
| §4.7 period positivity | q=8000, q=5, q=64 | v₂(q)=6,0,6; valuation Gram matrices 6I,0,6I; 8000=20³=5·40², whereas 64 has square class 1 | Zero valuation is excluded; the product seed's q=64 cannot replace the 2C square class. |
| §4.7 period halves and their pairing | a=√q, f₁=(a,t), f₂=(−t,−a) | f₁²=λ₁, f₂²=λ₂; φ²f₁=f₁⁻¹; e₂(f₁,f₂)=t/(−t)=−1 | Additive pairing is 1, not 0; toric-period block is I. |
| §4.7 diagonal-period negative control | (K₀,M₀) | M₀²=I, rank(M₀−I)=2; centralizer=48; odd refinements=6, fixed=0 | Triple transposition; the former S₅(b) assertion is false. |
| §4.7 coupled-period marking | (K₁,M₁) | M₁²=I, rank(M₁−I)=2; centralizer=16; odd refinements=6, fixed=2 | Double transposition; realizes the marked local class. |
| §4.7 theta parity and wrong pairing | Invariant refinements on K₁; change K₁ to K₀ with M₁ fixed | Basis values 1100 and 1111 give 6 zeros each; with K₀ fixed-odd count is 0 | The cross-pairing, not just the linear involution, determines the six-point action. |
| §4.7 3-torsion and multiplier | q=20³, t=u³; period thirds (20,u²) and (u²,20) | φ interchanges the thirds with inverse on the second step; M₃=diag(−R,R), M₃²=−I, charpoly=(X²+1)², ν=−1 | Class 2C; replacing −R by R in the toric block would give multiplier +1. |
| §4.7 distinguishedness | Ordinary values {1,α},{α,−α},{1,−1},{i,−i} | Q_Y(1)=4≠0; α≠0; 1−(−1)=2≠0; i−(−i)=2i≠0 | Four pairs remain unequal in characteristic zero; signs cannot be reduced modulo 2 first. |
| §4.8 odd-theta moduli and covers | Full level two, odd theta, trivial subgroup, full S₅ | Degrees 720, 6=720/120, 120,1; fixed letters for full S₅(b)/S₅(a) are 1/0 | Only proper subgroup covers have degree >1 and enter the thin exceptional set. |
| §4.8 dense Torelli boundary | Product principal polarization; nearby marked curve | Product theta has 2 elliptic components, smooth genus-two theta has 1 irreducible component | Product seed requires a local-neighbourhood passage into the dense open. |
| §4.9 direct 6G seed | Small Lemma 9.2.17 curve versus good Y | Conductor exponents 2 versus 0; toric ranks 2 versus 0; ordinary quotient values ±i, difference 2i≠0 | The source's small-curve local target suffices; no global representation comparison remains. |
| §4.10 exact local table | All ten projective classes | Good ordinary distinguished count 4; semistable ordinary distinguished count 8; excluded count 2 | 2C retained through its coupled seed with 2 fixed odd characteristics. |
| §5.1 triadic equation census | All 3⁷ coefficient tuples | 2187 total, 1296 smooth, 864 ordinary, 10 ordinary squares, 854 distinguished | Independently recomputed; completing the square preserves generalized-equation proportions. |
| §5.1 repeated-root counts | Q squares for elliptic traces ±1,±2 | Multiplicities 4,4,1,1; 4+4+1+1=10; scalar-+1 congruence total 4+24+1+8+48+8+48=141 | Reduced characteristic polynomial alone is not a scalar-action test. |
| §5.2 product fibres and signs | Traces −1,2 and their twists 1,−2 | Q₋=(1,−1,4,−3,9), Q₊=(1,1,4,3,9); Q₋(1)=10, Q₊(1)=18; scalar signs −1,+1 | Both nonsquare; neither product with scalar étale torsion is a smooth genus-two Jacobian over 𝔽₃. |
| §5.3 four nonscalar seeds | Four listed quintics over 𝔽₃ and 𝔽₉ | Counts (7,15),(7,11),(3,13),(5,11); (a,b)=(3,7),(3,5),(−1,2),(1,1) | Recomputed quartics agree with all four rows. |
| §5.3 scalar versus Jordan modules | I and a nontrivial 2×2 Jordan block | Fixed dimensions 2 and 1; nonzero fixed vectors 8 and 2 over 𝔽₃; six polynomials give eight conjugacy classes | A characteristic-polynomial-only construction is insufficient. |
| §6.1 local equivalence at 2 | 2C,2D,4D versus 4C,12C | Distinguished ordinary seeds 1,1,1 versus 0,0; good seeds respectively 0,0,1 | Both directions pass through the full marked table; no triadic assumption enters the local criterion. |
| §6.2 switch and real open | x(x²+1)(x²+2) | Finite real roots 1; with infinity fixed letters 2 and exchanged pairs 2; sign (−1)²=+1 | Double transposition and required real framing. |
| §6.2 thin-cover avoidance | Proper subgroup and full subgroup | [S₅:G]≥2 versus 1; S₅ and A₅ orders 120 and 60 | IG.2.7 replaces the duplicate approximation theorem; full group cover is excluded from thin data. |
| §6.3 infinity of curve classes | One fixed curve, marked points and level framings | At most 6·103680=622080 markings; a finite excluded set is zero-dimensional in a threefold | Infinitely many marked points cannot all represent one curve. |
| §7.1 ordinary modularity transfer | p=3; trivial rank-four image; node xy=0 | Weights {0,0,1,1}; trivial image has 1 eigenvalue rather than 4; node has 2 components versus the supplier's unique seed component | Matching residual data alone does not imply the lifting theorem. |
| §7.2 fifteen-image modularity | Full image; E×E; repeated triadic Q | Full image label 1.1.1, order 103680; product has 2 geometric idempotents; Q_E² has 2 repeated unit roots | End=ℤ and distinguishedness hypotheses remain necessary to the stated route. |
| §7.3 Theorem A | Forbidden signs; full residual image | Forbidden coefficient tuples (1,2,2,1,1)/(1,1,2,2,1); indices 1 in GSp and 2 for its symplectic kernel | Neither scalar twist nor kernel is confused with surjectivity. |
| §7.4 good ordinary curve modularity | Dyadic curve classes and triadic non-distinguished locus | Five allowed curve classes, 0 in {4C,12C}; 10 ordinary triadic equations fail distinction | Good curve reduction supplies the dyadic exclusion, not triadic distinction alone. |
| §7.5 Theorem B | Squarefree quintic; repeated-root quintic | Branch counts 5+1=6 versus discriminant 0; the 10 exceptional ordinary triadic equations have 0 rational branch points | Rational marking specializes and gives the required triadic distinction. |
| §7.6 bad-at-2 modularity | Positive toric rank 1 and 2 | Rank 1 would require an 𝔽₃-root of X²±X+2, none exists; finite lattice orders 1,2,3,4,6 have no order-eight eigenvalue | Bad reduction excludes the forbidden polynomial; 2C needs no exception. |
| §8.1 coefficient density | Counts at 2,3 and an 11-dimensional box | 624/2048=39/128; 854/2187; product 5551/46656; thin/box ratio O(log H/√H)→0 | New smoothness criterion preserves the density and its denominator. |
| §8.2 potentially abelian automorphy | ab=4; finite system and scalar twist | (a,b)=(4,1),(2,2),(1,4); finite twist has one Hodge–Tate value versus surface's two | b=1 and finite-up-to-twist cases remain excluded; oddness is separate. |
| §8.3 type dictionary | Product versus quadratic Weil restriction | Geometric algebra dimension 2 in both; fixed real-algebra dimensions 2 versus 1; systems split 2+2 versus induced rank 4 | Forgetting the action would merge distinct types. |
| §8.4 32-type modularity | Type A and B[C₂]; finite twist | 34−2=32; surface Hodge–Tate distinct-value count 2 versus 1 | Uses the preceding dictionary and separate rank-two modularity contract. |
| §8.5 parameter-space definition | K=F⁶; θ=(0,1,2,3,4,5); θ=0 | Removed hyperplanes C(6,2)=15; first discriminant nonzero, second polynomial T⁶ with discriminant 0 | Distinct-conjugate open and zero exclusion agree. |
| §8.5 twist and base-change API | c=1 and nonsquare c=d | Six branch points and all 16 2-torsion points unchanged; infinity equation changes from y²=1 to y²=d | The G_m factor is required to retain every local quadratic twist. |
| §8.6 obstruction at 3 | Trivial residual action; ordinary elliptic product | Required branch points 6 versus #ℙ¹(𝔽₃)=4; Hasse interval [1,7] has unique positive multiple of 4, namely 4, trace 0 | Neither good curve nor ordinary elliptic product can supply that seed. |
| §8.7 replacement [2,2,2] seed | E/𝔽₉:y²=x(x−1)(x−t), t²=−1 | #E=8, trace=2; Q_Res=X⁴−2X²+9; derivative common-root candidates 0,±1 give Q=9,8,8 | Ordinary and four distinct roots; product swap has 0 fixed odd characteristics, partition [2,2,2]. |
| §8.7 source [2,2,2] negative control | Repeated source quartic | (X²+2X+3)²=X⁴+4X³+10X²+12X+9; each quadratic root has multiplicity 2 | Source curve is not 3-distinguished; discrepancy stated at the claim. |
| §8.7 dyadic reference models | Étale orders 1,2,3 | Counts (3,3),(5,7),(6,6); (a,b)=(0,−1),(2,3),(3,5); Q(1)=4,14,19 | Recomputed using generalized integral equations; middle case cannot have 4 rational étale points since 4∤14. |
| §8.7 prescribed integral W | Étale order 5 versus ordinary height-four model | Order of underlying generic group 16; rank-two étale automorphism group has order card GL₂(𝔽₂)=6, with no element of order 5 | Generic finite flatness alone does not give the prescribed ordinary self-dual model. |
| §8.8 ordinary residual modularity | Images S₆,A₆; level prime to 6 | Image orders 720,360; local spherical primes 2 and 3 | Image size alone supplies neither W nor nonidentity triadic Frobenius. |
| Worked switch chain | Class 2C and real quintic | Local fixed odd count 2; M₃²=−I; real fixed branch count 2; auxiliary image order 120 | All eight permitted dyadic classes remain in the chain, subject to named supplier contracts. |
| Worked residual-mod-2 chain | Weil restriction seed and quadratic-in-X² discriminant | #E=8; b=−2; discriminant (−2)²−36=−32, constant 9≠0 | Same polynomial, ordinarity and distinction as §8.7. |
| New algebraization supplier gap | Rank 0; rank 1 Tate curve; rank 2 coupled periods | Rank-zero quotient has dimension 0; q=64 gives valuation form (6); coupled form diag(6,6) has determinant 36>0; q=5 gives determinant 0 | General converse is requested, not reconstructed or assumed supplied by the forward uniformization target. |
| Narrowed strong-oddness gap | Symplectic ranks n=0,1,2,3 | n+1+floor(n/2)=1,2,4,5; rank-two matrix examples give 2 odd and 2 non-odd classes | Count and symplectic translation remain requested; symmetric-form dichotomy is consumed. |
| Integral-model supplier contract | Smooth curve versus product Jacobian fibre | Smooth genus-two Jacobian has dimension 2; product special fibre has 2 elliptic theta components although curve fibre cannot be smooth | Good curve reduction implies good Jacobian reduction; the converse is not imported. |

The nine triadic curves in §8.7 were also recomputed over 𝔽₃ and 𝔽₉. Their ordered point-count pairs, in the README's partition order, are (4,6), (5,13), (6,10), (6,10), (5,13), (5,7), (6,14), (4,12), (6,16). The corresponding (a,b) are (0,−2), (1,2), (2,2), (2,2), (1,2), (1,−1), (2,4), (0,1), (2,5). All nine reduced equations have degree 5 or 6 and polynomial/derivative gcd 1. Their Hasse–Witt determinants, in that order, are 1,2,2,2,2,2,1,1,2 modulo 3. Every b is prime to 3; none gives a square Weil quartic. These finite checks corroborate ordinary distinguished reduction; they do not replace the required full torsion and local-family comparisons.

## Ownership, sources and pins

Read main's AlgebraicCurves, PolynomialGaloisGroups and EllipticCurves for format. Used the roadmap service to search main and open heads by the relevant objects, and to read the cited suppliers. In particular:

- NeronModelsAndSemistableAbelianVarieties §6.13 owns the removed finite-group target. Its §3.14 gives the torsion cone, evaluation pairing and unramified descent, but starts with an abelian variety. The inverse algebraization needed for the new seed is therefore declared as a gap, not attributed to an existing target.
- InverseGaloisAndArithmeticFundamentalGroups IG.2.5 and IG.2.7 own thin-set avoidance with all finite local conditions. IG.2.7's weak-approximation hypothesis covers smooth rational varieties. No projective-height estimate is needed by this package after removing the duplicate.
- ArithmeticGaloisRepresentations §7.9, GL2AutomorphicRepresentationsAndTransfer R17.5 and the PL.4 design API were opened at their available heads/design. The amended locators match their actual items. AlgebraicCurves Layer 10 was checked on main: its integral-model exclusion is explicit.
- RelativeJacobiansAndIntegralCurveModels §§0.1–0.3 and 2.4 provide integral-model/specialization machinery. The bounded equation-specific two-chart test and the coupled 2C specialization are this roadmap's arithmetic targets. Object searches found no competing occurrence of either test/construction at the available open heads; generic period-lattice theory remains with the named Néron supplier.

The source text was read from the numbered legal extractions. No extraction was copied into the repository. FC90 was fetched through the sources service and settled as uncertified, DOI 10.1007/978-3-662-02632-8; its locators are recorded without claiming to have read the paywalled text. KIS99 and THORNE17 remain settled as uncertified. No unsettled missing reference remains and no new reference request is required.

The content manifest and actual package checkouts agree: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Opened the native declarations at these pins: Matrix.J and Matrix.symplecticGroup (Mathlib/LinearAlgebra/SymplecticGroup.lean:58,101), Matrix.charpoly (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132), Matrix.IsSymm (Mathlib/LinearAlgebra/Matrix/Symmetric.lean:33), alternatingGroup and its cardinality (Mathlib/GroupTheory/SpecificGroups/Alternating.lean:72,136), simplicity (Mathlib/GroupTheory/SpecificGroups/Alternating/Simple.lean:203), MulAction.stabilizer (Mathlib/GroupTheory/GroupAction/Defs.lean:515), Representation (Mathlib/RepresentationTheory/Basic.lean:48), groupCohomology.H1 (Mathlib/RepresentationTheory/Homological/GroupCohomology/LowDegree.lean:965), Polynomial.aroots (Mathlib/Algebra/Polynomial/Roots.lean:479), TauCeti.AlgebraicGeometry.AbelianVariety (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95), TauCeti.schurMultiplier (TauCeti/RepresentationTheory/ProjectiveRepresentation/SchurMultiplier.lean:148), and the fixed-vector theorem (TauCeti/RepresentationTheory/PGroupInvariants.lean:161).

The abelian-variety structure's actual fields are an underlying group scheme, properness and geometric integrality; they do not provide a polarization, surface dimension or H¹ realization. Representation is a module-endomorphism monoid homomorphism, without continuity or finite-dimensionality. Matrix.symplecticGroup fixes multiplier one and is a submonoid. Searches of both pinned libraries found no genus-two Jacobian, GSp automorphic-representation, thin-set or odd-theta-family carriers that would make the omitted headlines statable; elliptic “Jacobian” hits are coordinate systems, not genus-two Jacobian varieties. Suggested.lean therefore gains no stand-in declaration.

## Required checks

- `lake env lean` on packages/AbelianSurfacesModularity/Suggested.lean, run from the content checkout: exit 0, empty stdout and stderr. No TauCeti import is used, so no module build was needed. No Lean process remains running.
- Mechanical declaration scan: zero declarations, zero definitions and zero instances. Thus the requested `#check @name` binder comparison has zero inputs and no dropped hypothesis; the successful elaboration covers the empty acceptance module. No examples, data placeholders, options or new imports were added.
- Final dependency check, with the required configuration, order and movable flag: exit 0, exact stdout:

```text
depcheck: 48 roadmaps, 559 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Neither merge order nor tooling was edited.

- Citation resolution against main b41e47b and the indexed open heads: no missing cross-roadmap citations and no missing Lean names. The service reports that it cannot check external library names on its own host; those declarations were checked directly in the pinned local packages as detailed above.
- README/plan gap audit: 21 slugs match exactly, with identical supplier and needs text. Removed projective-thin-count, narrowed strong-odd-symplectic-criterion and added polarized-toric-algebraization. All plan data outside the top-level gaps list is unchanged.
- Local Needs audit: all internal target references resolve; no self-reference, forward reference or cycle remains. Section numbering is increasing within each layer. No C★ coefficient block, precision-comparison target, dataset-census target, nonexistent adequacy label, continuous R17.5.1–R17.5.7 range, duplicate fixed-vector paragraph or “corrected” wording remains.
- No separate gate failure was supplied in the brief. The review findings above are the complete repair list.

## Maintainer consequences

The local table and modularity endpoints retain their full stated class range. Their 2C branch now depends explicitly on gap:polarized-toric-algebraization. The supplier must supply the general converse with its torsion pairing; this package neither edits that roadmap nor claims that the forward target suffices. FC90's paywalled text is not independently certified.

No Lean declaration was added, renamed or deleted. Citation numbers changed as follows: old 1.1→1.2 and 1.2→1.1; old 2.3 is consumed from the Néron supplier, and old 2.4–2.7→2.3–2.6; old 4.10→4.8, 4.8→4.9 and 4.9→4.10; old 6.1 is consumed from IG.2.7 and old 6.2–6.4→6.1–6.3; the old dataset §8.2 is deleted, old 8.3→8.2 and old 8.9→8.3. Other sections keep their numbers. Cross-roadmap source section numbers were preserved. Consumers citing section numbers must use this mapping; the immutable design node identifiers and all non-gap design data remain unchanged.
