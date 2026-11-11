<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13146#issuecomment-6785278355 -->
Review (codex) of 1ccbef4

Verdict: accepted
Conditional on the announced gaps: `dyadic-hilbert-coefficient-families`, `dyadic-hilbert-hida-localization`, `hida-family-representations-all-degrees`, `p-ramified-hilbert-coefficient-families`, `p-ramified-hilbert-hida-localization`

No findings. Acceptance is conditional on the five declared supplier contracts listed below. This is an independent review of the four package inputs, not an application of the repair report. None of those inputs was edited, and no source-manifest entry was added or rewritten.

## Verified sound

### Previous findings checked first

All five findings of the preceding review are repaired. The following quotations are from the repaired package, not from a source.

| Previous finding | Status | Repaired passage and independent witness |
| --- | --- | --- |
| F01, strict disagreement density | Repaired | `packages/IntegralIwasawaTheoryPartII/README.md:453`: “density at least `1/2`”. At level 25, weight 4, the pairs (1,1) and (ξ,ξ), ξ quadratic modulo 5, disagree on exactly two of four invertible residue classes. At 2 their eigenvalues are 9 and −9; at 11 both are 1332. The finite joint-character quotient gives the asserted density. |
| F02, tame ordinary multiplicity | Repaired | README:454: “For each fixed `𝔱₀` the ordinary contribution is one-dimensional; different tame translates are retained.” At level 6, weight 4, p=2, g=E₄−8E₄(2z) and g(3z) have coefficient columns (1,28), (0,1), determinant 1, and both U₂ eigenvalues 1. README:518 separately uses minimal tame conductor: n≤a+b≤n−t forces t=0. |
| F03, logarithmic cross shifts | Repaired | README:287: “contains only monomials of total degree below `|n|`”. The displayed identity at :290–292 includes both correction terms. At the second 11-adic place of ℚ(√5), 48²≡5, 52¹⁰≡100, log₁₁(52)≡22, and c≡88 modulo 121. At (π₁,1), the corrected expression is 88−88=0; at (1,12), it is 11−0=11. The source's degree induction is restored. |
| F04, substitution negative control | Repaired | README:702: “their difference is `2L²y′z′ ≠ 0`”. In E[y′,z′]/(y′²,z′²), the quadratic series gives cross coefficients 4L² and 2L², respectively. Their difference is 2L², not 4L². Imposing y′z′=0 makes it zero. |
| F05, branch-state residue | Repaired | README:31–32 retain “ClassFieldTheory, Layers 7, 11–13” and “Chebotarev, Layer 10”. Both “on main” parentheticals are gone. A renewed search found no branch-state, review-round, handoff, pull-request-number or machine-path residue in README or Suggested.lean. |

The repair changes were checked beyond their original witnesses. For F01, equal-character-product and k≥2 make equality of the two prime eigenvalues equivalent to equality of the character values: the otherwise nonzero differences have equal absolute value, whereas N𝔩^(k−1)>1. Agreement is a proper subgroup in the finite character quotient, so disagreement has density at least 1/2. Equal pairs give disagreement 0 and are excluded. Reversed character pairs in weight 1 can agree and are outside this assertion.

For F02, local U-polynomials retain one unit root per fixed tame translate; if the first character is ramified at p there is no unit root. The level-4, weight-3 pairs (1,χ₄) and (χ₄,1) give U₂ eigenvalues 1 and 4, hence ordinary dimensions 1 and 0. The general-level basis, the minimal-level application, and both suppliers' projectors now agree.

For F03, the new function-space definition, stability, auxiliary boxes, degree bound and support assertions were all checked. For g=ℓ² and ℓ=5,c=2, Dg=25−9=16=2cℓ−c². In an inner box the identity gives 16−16+0=0; on the shell it gives 25−16+16=25. With degree 2 and three exceptional factors the correction degree 1 is less than #J₀=2. The degree-zero case gives shell/interior values 1−0=1 and 1−1=0. Logarithmic factors are supported away from the corresponding zero coordinates, so both primitives belong to the stated function space. Searching the remaining uses found no uncorrected single-difference assertion.

### Principles, scope and shape

All 52 numbered targets, their API bullets, Checks, worked examples, and six layer dependency paragraphs were read. Each definition has an API and at least three discriminating Checks; each theorem has stated hypotheses and a source locator or the explicit imported contract used by its route. The title, summary, ownership, conventions, supplier contracts, build explanation, Examples/Dependencies endings, consumers and references have the required shape. ClassFieldTheory, LFunctions and ModularForms on main were read as shape comparisons.

The package extends IntegralIwasawaTheory at its stated boundary. It preserves all primes, including 2, all totally real degrees, and p-ramified characters. It does not assume the open higher-rank exact-order conjecture. Rank zero is handled by interpolation; positive-rank Artin constructions do not pretend to cover it. Rational minus projectors do not assert integral division by 2. No computational algorithm, copied source passage, sorry-defined data, set_option, cyclic proof route, or unowned prerequisite was found.

The layer order is forced by the mathematical inputs: regulator and lower bound → cohomology/families → actual Hecke image → actual representations → determinant comparison. The cohomology and family branches join in the final determinant. No source-chapter heading or assertion that a source's exposition determines the plan occurs. The source corrections are mathematical qualifications, not process instructions.

### Seeded source sample and repaired source claims

Page numbers below follow the versions explicitly recorded in sources.toml. Each cited range was opened. The four settled uncertified works are separately disclosed under Not verifiable; none was treated as read.

| Target | Text at the locator | Verification |
| --- | --- | --- |
| 0.1 Gross–Stark data | DKV16 lines 45–104, §1, pp. 834–835 | Totally real F, totally odd finite-order χ, every p, faithful CM quotient, and the exceptional/nonexceptional partition agree. Splitting equivalence uses faithfulness and the explicit ramified value 0. |
| 0.2 odd units and divisors | DKV16 lines 102–147, pp. 835–836; lines 1336–1358, p. 865 | Minus modules, χ⁻¹-eigenspaces, equivariant valuation and signed logarithm agree. The package makes scalar extension and source/target explicit. |
| 0.3 valuation and rank | DKV16 lines 102–124, (5)–(6), pp. 835–836; lines 181–201, pp. 837–838 | Rational valuation isomorphism and dimension r agree. The unit/class-group proof supports the rational statement, not an integral isomorphism. |
| 0.6 cocycle and measures | CD14 lines 158–232, (4)–(5), Theorem 4, pp. 5–6; lines 302–353, Theorem 1.1, p. 9; lines 1045–1105, Theorem 3.1, Proposition 4.1, Theorem 4.2, pp. 22–23; lines 1235–1272, Proposition 4.3, p. 26 | Variable-length nonempty tuples, refined versus symmetrized integrality, measure moments and full-weight interpolation agree. The principal branch is distinguished correctly. Sc93's original theorem remains uncertified; its stated specialization was read in CD14. |
| 1.2 Kummer local condition | DKV16 lines 390–448, Proposition 2.1 proof, (19)–(22), pp. 843–844; DDP11 lines 678–739, Proposition 1.4 and Lemma 1.5, pp. 455–456 | Inverse limit before rationalization, local units as the orthogonal condition, and a uniform cup-product sign agree. DDP's rank-one statement is not silently promoted to all ranks: the package gives the rational duality argument. |
| 2.1 coordinate/character | DKV16 lines 508–550, (25)–(27), p. 846 | Weight-one T, π=T/log_p(u), principal cyclotomic character and leading-coefficient normalization agree. The dyadic generator is 5. |
| 2.5 semi-cusp family | DKV16 lines 600–640, (28)–(31), pp. 848–849 | Both case-dependent combinations and their constant cancellation agree. Standard-cusp vanishing is distinguished from full cuspidality. The ambient nonordinary family space corrects the source's overstatement. |
| 3.4 Case 1 normal form | DKV16 lines 700–735, proof of Theorem 3.3, pp. 851–852; lines 1420–1434, p. 867 | Squarefree products, the top relation, dimension 2^r+s−1 and nonzero degree-r class agree, including s>r. |
| 4.1 actual representations | DKV16 lines 940–1009, Theorem 4.1, pp. 857–858; lines 1120–1150, (63)–(64), pp. 860–861 | Irreducibility in each family field, determinant χε, ordinary local shape and Λ-adic continuity agree. The completion/closedness adapter is explicitly proved, not presumed from density. |
| 4.2 good element | DKV16 lines 1010–1120, Lemmas 4.2–4.3, pp. 858–860; lines 1290–1317, p. 864 | Stabilizer argument and simultaneous line avoidance support the statement. The package corrects the reversed-order cocycle twist and includes every prime over p needed later. |
| 4.3 adapted extension | DKV16 lines 1151–1189, (65)–(69), pp. 861–862 | The upper entry must be multiplied by χ⁻¹. Finite off-diagonal module and normalized coboundary arguments agree with the named GMA inputs. |
| 4.4 infinitesimal characters | DKV16 lines 1187–1223, (70)–(74), p. 862 | Constant term 1, πy=y², yz=0, and the product character agree. The printed lower summation index is corrected. |
| 4.8 inertia generation | DKV16 lines 1318–1334, Lemma 4.8, pp. 864–865 | Vanishing of the quotient class, τ-normalization, finite generation and Nakayama are all retained. |
| 5.1 exact determinant | DKV16 lines 1336–1420, (81)–(86), pp. 865–866 | The maximal-ideal error is absorbed before taking determinants. Cancellation occurs in the total quotient ring, then the zero identity returns to Â before specialization. |
| 5.3 lower entry | DKV16 lines 1436–1475, §5.2 and Lemma 5.1, pp. 867–868 | Untwisted lower entry has χ-action; exceptional inertia lands in the inverse image of yW. The finer ideal survives even when y vanishes modulo 𝔪². |
| Repaired 0.8 | CD14 lines 1400–1523, Theorems 5.1–5.2, Lemma 5.3, (87)–(88), pp. 29–32 | Freeness and the logarithmic-degree induction support the repaired proof. Both cross-coordinate shifts and lower-degree corrections are present. |
| Repaired 2.2a/2.6 | Lin12 lines 198–310, §2, Proposition 3.2, Theorem 3.3 and (5), pp. 5–7; DKV16 lines 644–664, Theorem 3.2, pp. 849–850 | Lin12's k≥3 strict agreement criterion is stated correctly; the package's k≥2 separation proof is independently supplied. Ordinary tame translates are preserved. Normalization is verified in DKV16 preprint lines 559–560, Theorem 3.2, p. 16. |
| Auxiliary family | V15 lines 568–579, Theorem 2, pp. 14–15; lines 728–748 and 773–792, §§4.1–4.2, pp. 18–20 | Constant specialization, dyadic case and removal of auxiliary tame level agree. The final theorem-number slip is corrected. |

Nine distinct works occur in the references and nine distinct keys in the manifest. The published DKV article and its normalized preprint share DKV16. CD14 author-copy pagination and V15/Lin12 version pagination are declared. No unrecorded source or new missing-reference request was needed.

### Computed adversarial evidence

This table covers the seeded targets, all headlines, repaired assertions and the surrounding identities on which they depend. For unchanged text, the preceding review's computed rows were re-evaluated against the present definitions; conclusory summaries without values were not used as evidence. Formal ring examples test algebraic claims, not existence of Hida families with arbitrarily prescribed analytic orders. All coefficient fields E have characteristic zero; a zero ring or characteristic-p coefficient ring is outside those signatures.

| Statement | Instances tried | Computed values on the two sides | Result; change |
| --- | --- | --- | --- |
| Conventions; 0.1 | χ₄, H=ℚ(i), p=2,3,5 | χ(p)=0,−1,1 and r=0,0,1; χ⁻¹ gives the same partition | Sound; none. |
| Reciprocity | μ₅ over ℚ₂; unit 2 over ℚ₅ | Over ℚ₂, Art(2) exponent 2, rec(2) exponent 3, 2·3≡1 mod 5; over ℚ₅, rec(2) exponent 2, Art(2) exponent 3 | Sound inverse convention; none. |
| 0.2 projector and maps | C₂ over ℚ₂; u=(2+i)/(2−i) at p=5 | ((1−c)/2)²=(1−c)/2; divisor (1,−1); torsion gives zero valuation and logarithm | Sound rational projector; none. |
| 0.3 rank/isomorphism | Same unit; r=0 | Valuation matrix (1), rank 1; zero-space map 0→0 has empty determinant 1 | Sound; none. |
| 0.4 regulator | O=(2),L=(3); O=diag(2,3),L=diag(5,7); repeated L rows | Ratios −3/2, 35/6; common basis change gives 140/24=35/6; repeated rows give 0; empty ratio 1 | Sound sign, invariance and permitted vanishing; none. |
| 0.5 analytic invariants | f=6Ds², f=Ds³, zero series | f''/(2D)=6; rank-two coefficient of Ds³ is 0, first leading coefficient 1; zero-series order is ⊤ and is excluded by the nonzero-germ claim | Sound; none. |
| 0.6 tuple domain | Empty versus singleton in n=1; X₁+√2X₂ versus X₁ in n=2 | Empty cutoff has divergent absolute harmonic sum; singleton cutoff finite; irrational form's rational kernel {0}; X₁(0,1)=0 | Sound domain; none. |
| 0.6 interpolation | F=ℚ,p=3,c=2,k=1 | Full-weight moment (−3)(−2)(−1/12)=−1/2; principal branch has dense even-integer values 0, hence value 0 at −1 | Sound distinction; none. |
| 0.6 smoothing | χ₄,p=2,c=3; unsmoothed ζ at 0 | h(0)=4, h(1)=1+3/(−3)=0; (1−3)ζ(0)=1 | Unit only as germ at 0; none. |
| 0.7 cap convention | Scaling action by 2, m=6; S₃ action with (123), e₂, e₁* | Balanced inverse evaluation 3=3, wrong action 12; permutation inverse value 1 versus direct value 0 | Sound also for nonabelian action; none. |
| 0.7 homology | Free group algebra, ranks 0,1,2; trivial module | Rank-one free H₁=0,H₀=ℂ_p; trivial H₁=ℂ_p; rank-two quotients ℂ_p[π₂±1], ℂ_p; rank-zero edge identity | Freeness essential; none. |
| 0.7 regularity | Repeated (1−π₁,1−π₁) | Second multiplication is 0 on the nonzero first quotient, hence has nonzero kernel | Correct negative control; none. |
| 0.8 degree induction | ℓ=5,c=2,g=ℓ²; degree 2 with #J=3 | Dg=25−9=16; inner identity 16−16=0; shell identity 25−16+16=25; correction degree 1<2 | Repaired identity sound; none. |
| 0.8 arithmetic shift | F=ℚ(√5),p=11,H=F(√−2) | π₁=761+336√5, π₁π₂=11⁴, both ≡1 mod 8; −2≡3² mod 11; log₁₁(52)≡22, c≡88 mod 121 | r=2 and nonzero cross shift; none. |
| 0.8 augmentation/lower bound | (π₁,1), (1,12); r=1,k=0; r=0 | Corrected values 88−88=0 and 11−0=11; shell indicator 1−0=1, inner 1−1=0; rank-zero bound imposes no zero coefficient | All-prime route sound; none. |
| 0.9 order boundary | Ds^r, Ds^(r+1) | Orders r,r+1; normalized rank-r coefficients 1,0 | Both directions; none. |
| 1.1 topology | ℤ_p with trivial E action; discrete replacement | Continuous inclusion sends 1 to 1; discrete-coefficient continuous homomorphism has finite torsion image, so sends 1 to 0 | Correct topology; none. |
| 1.2 Kummer | Local uniformizer/unit; finite class group C_p | Rationalized local coordinates E⊕E; unramified evaluation 1 on uniformizer, 0 on unit; C_p⊗ℚ_p=0 whereas C_p/pC_p=C_p | Limit and rationalization order sound; none. |
| 1.3 orthogonality | x=−3,y=2,O=2,L=3; r=0 | −6+6=0, reversed cup order 6−6=0; empty sum 0 | Uniform sign suffices; none. |
| 1.4 reciprocity proof | C₂ acting on a minus unit | Conjugate contribution (−1)κ(−u)=κ(u); 2κ(u)=0 implies κ(u)=0 also over ℚ₂ | Sound; none. |
| 1.5 inertia injection | Finite class group of order m; empty R | m f(g)=f(g^m)=0 forces f(g)=0 in E; H¹_∅=0 | Sound; none. |
| 1.6 coordinates | 2o+3ℓ; all y_j=0 | Coordinates (2,3), not (3,2); all inertia values then 0 and global class 0 | Sound; none. |
| 1.7 dimension | r=0,1,2, invertible O | Kernel dimensions 0,2−1=1,4−2=2; O=2,L=3 gives x=−3y/2 uniquely | Sound arbitrary rank; none. |
| 1.8 invariant | X=2,Y=3; diagonal (2,5),(3,7); empty | 2/3; 10/21=40/84 under common scaling; empty ratio 1 | Sound; none. |
| 1.9 regulator headline | O=diag(2,3),L=diag(5,7),Y=I | X=diag(−5/2,−7/3), XO+YL=0; both determinant ratios 35/6 | Sound sign and matrix order; none. |
| 2.1 coordinate | First-order variation; f(s)=cs or as²; p=2 | dπ/dk=1 versus dT/dk=log_p(u); coefficients −c and a; principal part of −1 is 1 | Sound; none. |
| 2.2 Eisenstein coefficients | Unstabilized exceptional prime at weight 1 | Prime-power coefficients j+1; stabilization gives 1; (U−1) first coefficient 1 and its square 0 | Sound; none. |
| 2.2a primitive basis | Level 8, weight 4 | Raised-series coefficient matrix is triangular with diagonal (1,1,1,1), determinant 1; imprimitive duplicate is E−9B₂E+8B₄E | Primitive indexing excludes duplication; none. |
| 2.2a density | Level 25 quadratic twist; identical pair | Eigenvalues (9,−9) at 2 and (1332,1332) at 11; disagreement 2/4=1/2; identical pair disagreement 0 | Repaired bound and distinctness sound; none. |
| 2.2a ordinary part | Level 6,k=4,p=2; level 4,k=3,p=2 | Coefficient columns (1,28),(0,1), determinant 1, two eigenvalues 1; ramified-character order reversal gives U₂=1 versus 4 and ordinary dimensions 1 versus 0 | Tame multiplicity retained; none. |
| 2.3 auxiliary family | Shift weight 0 to 1 | Shifted coordinate u⁻¹−1 equals ν₀(T); standard constants 1, positive coefficients 0; auxiliary denominator (q+1)/q≠0 | Sound; none. |
| 2.4 cases | s−t positive, negative, zero; w=−1 | Inversion changes s−t to t−s; valuation 0 and w=−1 is still Case 2 with unit w | Exhaustive orientation; none. |
| 2.5 semi-cusp | Standard constant; w=−1; s=1,2 | 2^(−d)ℒ−2^(−d)Dℒ/D=0; specialization (1+w)E₁=0 at −1; subtracted-product leading terms −aπ,+aπ² | Sound; none. |
| 2.6 separation | Level 11 T₂; minimal tame exponents | T₂−3 gives 0 on Eisenstein and −5 on cusp; normalization tE₁=E₁ excludes t=0; n≤a+b≤n−t gives t=0 | Sound application of general basis; none. |
| 3.1/3.4 W₁ | r=s=1; r=2,s=3 | Dual numbers with ε=aπ; second basis has 6 elements, π²≠0 modulo 𝔪³; 2²+3−1=6 | Sample normal form sound; none. |
| 3.2/3.5 W₂ | r=s=1,w=1 or −1; r=2,s=3 | At 1, y=π/2; at −1, π=0,z=−y,ε=−ay; dimensions 2 and 8=2²+6−2 | No division by 1+w; none. |
| 3.3/3.6 W₃ | r=t=1,s=2,c=−a/b | y=cπ², ε=−aπ²=by; dimension 3; y mod 𝔪²=0 but yW/y²W has dimension 1 | Distinct filtrations sound; none. |
| 3.7 Y/orbit | χ(q)=1 versus −1 | Denominator residues 0 versus 2log_p⟨Nq⟩≠0; Y²−πY=0 | Denominator hypothesis retained; none. |
| 3.8 Hecke-image headline | r=s=1, Case 1 | W₁ has dimension 2; U_p=1+aπ and ε=aπ | Image and normal form agree; none. |
| 3.9 Hecke-image headline | r=s=1,w=−1 or 1 | At −1, z=−y≠0 although π=0; at 1 tame U=1+(log_p⟨Nℓ⟩)π/2 | Correct tame correction; none. |
| 3.10 Hecke-image headline | r=t=1,s=2 | Dimension 3, Y=cπ²; elimination order 2s−t=3=s+1 | Correct truncation; none. |
| 4.1 representation | Complex conjugation; p=2 | det=−1, trace=0, eigenvalues ±1; distinct in E but identical modulo a dyadic uniformizer | Correct height-one residue field; none. |
| 4.1 completion | y²−T²(T+p), √p∈E | Integral order prime-chain length 2; localized dimension 1; completed equation (y−Ts)(y+Ts), two fraction fields | Completion can split one family field; none. |
| 4.2 good element | diag(1,−1), ordinary line (1,1) | Eigenvalue difference −2≠0 in E; both coordinates 1; either coordinate axis fails avoidance | Sound simultaneous condition; none. |
| 4.3 upper cocycle | χ(g)=−1,χ(h)=1,b(g)=2,b(h)=3 | b(gh)=5; κ(gh)=−5=−2−3; untwisted left expression is −1 | Twist necessary and present; none. |
| 4.4 substitution | yz=0; square-zero y′,z′ with y′z′≠0 | (1+3y)(1+3z)=1+3π; quadratic-series cross coefficients 4L² and 2L² differ by 2L² | Main law and repaired negative control sound; none. |
| 4.5 diagonals | Residual τ=diag(1,−1) | Two-trace linear system determinant −2; trace alone cannot distinguish (a+t,d−t) | Second trace essential; none. |
| 4.6 local entries | Matrix ((2,1),(0,3)), line (1,1) | b=3−2=1; c=3−3=0 | Comparison orientation sound; none. |
| 4.7 ramification | ℓ≠p; χ(g)=−1,v=2 | Torsion-free finite image 0; compact pro-ℓ/pro-p image 0; (1−χ⁻¹)v=4 is coboundary of −2 | Compact image, not discrete E; none. |
| 4.8 inertia generation | Quotient coboundary, χ(τ)=−1 | −2v=κ(τ)=0 gives v=0; finite quotient modulo 𝔪 is 0, so Nakayama gives quotient 0 | Sound; none. |
| 4.9 second order | Â=E[[t]], α=t⁻¹ | α𝔪=E[[t]], α𝔪²=tE[[t]]; multiplying the inclusion by 𝔪 gives the latter bound | No integral-α assumption; none. |
| 5.1 exact determinant | Weights 2,3; columns (3t,−2t),(6t,−4t) | Weighted sums 0,0; determinant −12t²+12t²=0 before specialization | Correct exact identity; none. |
| 5.2 graded comparison | r=s=2,O=diag(2,3),L=diag(5,7) | 35z²+6(−35z²/6)=0; ratio 35/6; when s>r, top product has graded value 0 | Sound sign and cancellation; none. |
| 5.3 lower class | χ(g)=−1,c(g)=2,c(h)=3; Case 3 | c(gh)=2−3=−1; ε−ε_z=ε_y−1; r=t=1,s=2 leaves nonzero line E·cπ² | Correct χ-action and ideal; none. |
| 5.4 inverse determinant | r=t=1,s=2,O⁻=2,L⁻=3 | (3+2b)y=0 with y≠0 gives b=−3/2=R_p(χ⁻¹) | Correct inverse-character coefficient; none. |
| 5.5 rank-zero headline | χ₄,p=2 and 3 | D=f(0)=1/2 and 1; normalized coefficient 1 equals empty regulator; order 0 | Includes dyadic pole branch at 0; none. |
| 5.6 leading-term headline | χ₄,p=5,u=(2+i)/(2−i) | D=1/2,o(u)=1; theorem gives f'(0)=−log₅(u)/2, hence normalized coefficient −log₅(u) | Source theorem and signed regulator agree; none. |
| 5.7 exact-order headline | Ds^r versus Ds^(r+1) | Orders r,r+1; normalized coefficients 1,0 | Both directions, no unconditional higher-rank nonvanishing; none. |
| 5.8 rank-one headline | Same u, algebraic logarithm kernel | Valuations of u^N are (N,−N); u^N=ζ5^k would force N=k and −N=k, hence N=0, impossible for N≥1 | Concrete nonvanishing; general proof uses algebraic Baker–Brumer; none. |

### Pinned library and duplication audit

The pins read were Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declarations were opened at those pins, not inferred from the resolver. File names below are library-relative.

| Declarations | File and line | Actual scope checked |
| --- | --- | --- |
| Matrix; Matrix.det; det_mul | `Mathlib/LinearAlgebra/Matrix/Defs.lean:55`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63,141` | Matrix is a function type; determinant requires finite square index and commutative ring. Empty determinant is 1. |
| det_nonsing_inv; LinearMap.det; det_toMatrix | `Mathlib/LinearAlgebra/Matrix/NonsingularInverse.lean:422`; `Mathlib/LinearAlgebra/Determinant.lean:164,203` | Ring inverse requires the intended nonzero determinant; LinearMap.det has fallback 1 outside finite free scope, which the roadmap avoids by proving finite rank. |
| FreeAbelianGroup; TensorProduct; MvPolynomial | `Mathlib/GroupTheory/FreeAbelianGroup.lean:96`; `Mathlib/LinearAlgebra/TensorProduct/Defs.lean:72`; `Mathlib/Algebra/MvPolynomial/Basic.lean:80` | Free abelian group is additive abelianization; tensor product imposes bilinear relations; polynomial carrier is a monoid algebra. These supply carriers, not the arithmetic comparisons. |
| Class-group finiteness; unit rank | `Mathlib/NumberTheory/NumberField/ClassNumber.lean:59`; `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:462` | Number-field class group and ordinary unit rank; not an existing odd p-unit valuation isomorphism. |
| IsTotallyReal; IsCMField | `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:48`; `Mathlib/NumberTheory/NumberField/CMField.lean:70` | Real infinite places; totally complex quadratic extension of the maximal real subfield. Number-field finiteness comes from the standing hypotheses. |
| PowerSeries.coeff, X, order | `Mathlib/RingTheory/PowerSeries/Basic.lean:77,155`; `Mathlib/RingTheory/PowerSeries/Order.lean:50` | Formal coefficients and N∞ order, with zero order ⊤; no analytic p-adic L-function supplied. |
| HenselianRing; IsAdicComplete.henselianRing | `Mathlib/RingTheory/Henselian.lean:81,154` | Specified ideal, Jacobson containment and adic completeness are retained. |
| FractionRing; IsReduced | `Mathlib/RingTheory/Localization/FractionRing.lean:744`; `Mathlib/Algebra/GroupWithZero/Basic.lean:191` | Nonzerodivisor localization need not be a field; reduced means no nonzero nilpotents, not a domain. |
| IsWeaklyRegular; groupHomologyIso; indIso | `Mathlib/RingTheory/Regular/RegularSequence.lean:136`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:254`; `Mathlib/RepresentationTheory/Homological/GroupHomology/Shapiro.lean:65` | Weak regularity does not include nonzero final quotient; projective-resolution and induction tools do not construct this roadmap's cap product/augmentation adapter. |
| H1; H1EquivOfSmulEqSelf | `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:829,1057` | Additive continuous cocycle quotient; trivial-action equivalence requires its action hypothesis. No claim that its quotient topology supplies the arithmetic coefficient topology. |
| artinMap; density; continuity; norm law | `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114,188,248,345` | Absolute local Artin map with dense range, not an uncompleted surjectivity assertion. |
| localArtinMap_Q2_zeta5 | `TauCeti/NumberTheory/ClassFieldTheory/Local/Cyclotomic.lean:205` | Arithmetic exponent 2, hence inverse-Artin exponent 3. |
| koszulComplex; homologyZeroEquivSpan | `TauCeti/RingTheory/KoszulComplex/Basic.lean:219,399` | Complex of a linear functional with exterior-power terms; quotient H₀. |
| exactAt_of_isWeaklyRegular; tensorIso; tensorIsoAppend | `TauCeti/RingTheory/KoszulComplex/Regular.lean:140`; `TauCeti/RingTheory/KoszulComplex/Tensor.lean:319,340` | Positive exactness and signed tensor differential already supplied; README imports them rather than owning them again. |
| heckeLFunctionC | `TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74` | Presented complex continuation for every number field, with zero fallback when no continuation exists. Not the missing Deligne–Ribet branch. |
| CharIndex; linearIndependent_inCharSpace; isCompl_eisensteinSubspace_range_cuspToModFormCharSpace | `TauCeti/NumberTheory/ModularForms/EisensteinSeries/Subspace.lean:81`; `TauCeti/NumberTheory/ModularForms/EisensteinSeries/Independence.lean:128`; `TauCeti/NumberTheory/ModularForms/EisensteinSeries/Dimension.lean:204` | Primitive pairs, parity, level raises, k≥3 and fixed nebentypus. The elliptic case is imported; the general totally-real complement is the extension here. |

Object searches used the prescribed roadmap grep/show tools, the supplied board-package index and the board packages, as well as both pinned libraries. Searches covered Gross–Stark regulators, Sczech cocycles/measures, Hilbert Eisenstein decomposition, ordinary tame translates, continuous extensions, cap products, free-abelian augmentation sequences and determinant uniqueness. No duplicate owned construction was found. Singular-topology cap products are different objects from the discrete-group dual-coefficient adapter; the native Koszul substrate is explicitly imported. No fully qualified declaration collision is possible in Suggested.lean, which declares none.

### Cross-roadmap citations, overlaps and supplier order

All supplier citations were resolved anew. Main/completed files were read on the content checkout; new open suppliers were read through the prescribed head tools. The supplied overlap facts were checked: no competing head changes this package, no cited id is dropped, and no cited id requires an unnamed revision. The closest open roadmaps were inspected by object and ownership, not merely their titles.

| Supplier | Resolved repository location and consumed contract |
| --- | --- |
| ClassFieldTheory, main | `TauCetiRoadmap/ClassFieldTheory/README.md:1204,1781,1834,1924`, Layers 7,11–13. Former §2.6 is mapped to C.6 at :267; inverse unit-norm convention appears at :543/:1230. Global reciprocity, ray-class correspondence and Hilbert class field are present. |
| Chebotarev, completed/main | `Completed/Chebotarev/README.md:410,416`, Layer 10 and hasDirichletDensity_frobeniusPrimeSet, value #C/#G over every number field. |
| LFunctions, main | `TauCetiRoadmap/LFunctions/README.md:929,1440`, Layers 5 and 7: finite-order Hecke continuation/functional equation and nonvanishing for the nontrivial characters used here. |
| ModularForms, main | `TauCetiRoadmap/ModularForms/README.md:353`, §0.1: corrected weight-two series and cusp–Eisenstein complement. |
| IntegralIwasawaTheory, open #1306 | `TauCetiRoadmap/IntegralIwasawaTheory/README.md:63,97,704,857,912,1302,1322`, §§0.1,0.4,4.2,6.0,6.3,9.3. Cyclotomic coordinate, algebraic Baker–Brumer, Deligne–Ribet interpolation and all-prime Hilbert geometry/Hasse lifts. No Gross–Stark proof is re-planned. |
| ArithmeticGaloisDuality, open #858 | `TauCetiRoadmap/ArithmeticGaloisDuality/README.md:700,1401,2294,3118,3436,6018,6222`, the seven cited R02/D7 sections. Lattice/rational descent, Kummer/Picard term, dual-first pairing, Poitou–Tate and dyadic corrections. |
| DirichletPadicLFunctions, open #1039 | `TauCetiRoadmap/DirichletPadicLFunctions/README.md:268`, §0.6: normalized global logarithm, finite-extension form, norm law and angular coordinate. |
| IntegralHeckeAndGaloisDeterminants, open #1689 | `TauCetiRoadmap/IntegralHeckeAndGaloisDeterminants/README.md:2270,2444,3258`, §§1.3,1.4,4.1. GMA, extensions and continuous determinant uniqueness. The resolver lead Determinant.eq_of_charpoly_frobenius is a supplied roadmap target at :3258, not a missing native declaration. |
| NoncommutativeAndEquivariantIwasawa, open #1307 | `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2519,2533,2537`, §F.5. Classical/family forms, fractional Eisenstein families and projector using only primes over p. The existing odd-p, prime-to-p-conductor bounds explain the two extension gaps. |
| PadicFamilies, open #1019 | `TauCetiRoadmap/PadicFamilies/README.md:2848,2876,2880,2914,2928,2942`, §§5.9a–5.13. Hida presentation, p-ordinary projector, Fourier injection, minimal-tame reducedness and eigenfamily fields. |
| OrdinaryAutomorphicFormsAndModularityLifting, open #1066 | `TauCetiRoadmap/OrdinaryAutomorphicFormsAndModularityLifting/README.md:365,367,369`, §2.12(a,b). Two-character Hilbert series and family representation interface. It does not provide the general primitive-pair complement claimed here. The ClassicalSerreModularity application it cites is narrower and does not create a second owner of §2.2a. |
| EulerSystemsCyclotomicMainConjecture, open #1311 | Scope and §0.18 inspected through its head. Cyclotomic main-conjecture/eigensubmodule infrastructure does not own the general Gross–Stark regulator comparison, Sczech lower bound or the three Hecke-image constructions. It is an overlap comparison, not an added dependency. |

The five gaps have identical slugs in `packages/IntegralIwasawaTheoryPartII/design/plan.json` and README:110,112,118,120,126. Each names an existing earlier owner and extends a coherent interface at explicit missing hypotheses. None asks for a construction already supplied here or at the pins:

- `dyadic-hilbert-coefficient-families`: NoncommutativeAndEquivariantIwasawa §F.5, p=2 with u=5 and dyadic character/level conventions.
- `p-ramified-hilbert-coefficient-families`: the same owner, finite character conductor above p retained and the full level/ordinary Eisenstein interface specified.
- `dyadic-hilbert-hida-localization`: PadicFamilies §§5.10–5.13 on the dyadic coefficient families.
- `p-ramified-hilbert-hida-localization`: the same owner on the p-ramified families, with minimal tame conductor and explicit residual Hecke congruences.
- `hida-family-representations-all-degrees`: OrdinaryAutomorphicFormsAndModularityLifting §2.12(b), all totally real degrees and primes, the actual coefficient fields/topology, determinant and local ordinary shape.

Every Needs line and supplier paragraph was checked for direction and availability, including the declared-gap qualifications. The prescribed dependency command completed with exit code 0 and output:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. No merge-order edit was made.

### Headline coverage, Lean elaboration and padding

The README's acceptance headlines are: the all-prime lower bound (§0.8); the cohomological regulator formula (§1.9); the three actual Hecke-image identifications (§§3.8–3.10); rank-zero interpolation and the Gross–Stark leading-term theorem (§§5.5–5.6); the exact-order criterion and rank-one consequence (§§5.7–5.8).

Each is explicitly named in the module docstring of `packages/IntegralIwasawaTheoryPartII/Suggested.lean:8–29`, with the missing carriers: the Deligne–Ribet function, normalized global logarithm/arithmetic local adapters, integral Sczech construction, or ordinary Hilbert family/Hecke carriers. Searches at the pins confirmed these gaps in the available carriers. The complex Hecke function, continuous H¹ and local Artin map do exist and are correctly acknowledged. Adding generic scalar determinant identities or arbitrary Prop-valued conditions would not state these headlines. No statable headline was found absent.

Suggested.lean has 38 lines, a single import Mathlib, one module docstring, the prescribed namespace and zero declarations. It has zero sorried theorems, zero definitions, zero instances, zero opaque declarations and zero examples. The exhaustive one-tactic probe and @signature audit therefore have empty input sets; there is no padding, erased binder or fabricated replacement theorem to test. README attributes no undeclared backticked Lean name to this roadmap; supplier names were resolved separately above.

The prescribed `lake env lean` elaboration of this exact Suggested.lean, run from the pinned content project, exited 0 with empty output: no errors and no warnings, including no sorry warning. No TauCeti module build was needed because none is imported. No bare build, update or cache command was run. Nothing was left running.

## Not verifiable

The following four manifest entries are settled as uncertified; their original full texts were not available in the supplied legal cache. They were not re-requested or relabelled:

- Sc93, Theorem 4: original text not read. The specialized statement used here was checked in CD14 Theorem 1.1, p. 9.
- W86, Proposition 1.5: original text not read. DDP11 and Lin12's attribution and the accessible decomposition statements were checked; this does not certify the original locator's full hypotheses.
- AL13, Proposition 3.11 and Theorem 3.6: original text not read. Lin12's precise restatement/attribution was checked; original pagination/hypotheses remain uncertified.
- Br82, Chapter V §3 and Chapter VII §6: original text not read. The actual cap-product convention and free-module/edge argument were tested algebraically, and the relevant CD14 argument was read.

No other requested sample was unreadable. Acceptance retains these explicitly permitted source-status limits and the five supplier contracts; it does not certify proofs that the roadmap proposes to formalize.

## Source issues

These are source defects already corrected or avoided by the package, not findings requiring a package change. Source quotations are not reproduced.

- **Misprint** in DKV16 at Remark 1.1, p. 837 (line 169): the source says the displayed composite acts on U_χ; it should be an endomorphism of X_χ, or the conjugate composite on U_χ; affects a stated result.
- **Misprint** in DKV16 at the analytic invariant after (14), p. 841 (line 321), and §5.1, p. 867: the source says the numerator uses the χ branch; it should be the χω branch fixed by interpolation; affects a stated result.
- **Misprint** in DKV16 at §1.4, rank-one comparison, p. 842 (line 360): the source says the local formula concerns the unspecialized class; it should be the scalar-specialized class; affects the proof.
- **Gap** in DKV16 at §1.4, (16), pp. 842–843 (lines 373–384): the source says the determinant error scales directly into the required power; it should be absorbed by the exact weighted-row construction of §5.1 before specialization; affects the proof.
- **Error** in DKV16 at the outline after (16), p. 843 (lines 384–385): the source says the relevant maximal-ideal power is always a one-dimensional space; it should be only the nonzero line generated by z^r in the appropriate graded piece; affects the proof.
- **Misprint** in DKV16 at Proposition 2.1 proof, (21)–(22), p. 844 (lines 417–422): the source says the two formulas use opposite pairing orders without adjustment; it should be one order throughout, with its universal cup-product sign; affects the proof.
- **Misprint** in DKV16 at §3.1, footnote 6, p. 847 (line 579): the source says the constant uses χ while discussing general η; it should be the expression with η and η⁻¹; affects a stated result.
- **Gap** in DKV16 at §3.1, Hecke generators, p. 847 (line 545): the source says only primes over p supply U-operators; it should be every prime dividing 𝔫p for the algebra used later; affects the proof.
- **Error** in DKV16 at §3.2, regularity, p. 849 (line 626): the source says the semi-cusp combination is already ordinary; it should be a regular unrestricted family, made ordinary by the projector; affects a stated result.
- **Misprint** in DKV16 at §3.2, case division, p. 849 (line 629): the source says the last comparison uses χ again; it should be the order for χ⁻¹; affects the proof.
- **Gap** in DKV16 at Theorem 3.2, p. 849 (line 644): the source says merely that some Hecke operator produces a cusp family; it should be normalized to fix the specified weight-one Eisenstein specialization; affects a stated result.
- **Misprint** in DKV16 at §3.3, after the Fourier embedding, p. 850 (line 657): the source says the analytic invariants refer to display (2); it should be the invariants of §1.3; affects nothing.
- **Misprint** in DKV16 at (41)–(42), p. 853 (line 802): the source says the modulus without the required exponent grouping; it should be π^(s+1); affects the proof.
- **Misprint** in DKV16 at (48), p. 854 (line 824): the source says the U-operator without its varying prime index; it should be U_{𝔮_i} in the i-th factor; affects the proof.
- **Misprint** in DKV16 at Theorem 3.6 proof, p. 854 (lines 833–836): the source says the dimension uses 2^s and misindexes the squarefree product; it should be 2^r+2s−2 and the product over j∈J; affects the proof.
- **Error** in DKV16 at Remark 3.7, p. 855 (lines 894–896): the source says the tame U-image is 1 and uses the unnormalized coordinate; it should be 1+(w/(1+w))log_p⟨N𝔩⟩π with π=T/log_p(u); affects a stated result.
- **Misprint** in DKV16 at after (53), p. 858 (line 1001), and before (66), p. 861 (line 1159): the source says mismatched prime labels in Frobenius and Hecke terms; it should be the same prime throughout; affects nothing.
- **Error** in DKV16 at Lemma 4.2 proof, p. 860 (line 1093): the source says the reversed-order lower entry is already the required left cocycle; it should be multiplied by χ⁻¹ in that order; affects the proof.
- **Gap** in DKV16 at the list before Lemma 4.3, p. 860 (line 1096): the source says line avoidance is imposed only at exceptional primes; it should be imposed at every prime over p used in the local comparisons; affects the proof.
- **Misprint** in DKV16 at (63), p. 860 (line 1127): the source says a single eigenfamily representation on the left; it should be the product representation; affects nothing.
- **Misprint** in DKV16 at after (64), p. 861 (line 1138): the source says the unramified character without the local prime consistently attached; it should be η_𝔮 for each local representation; affects nothing.
- **Misprint** in DKV16 at before (70), p. 862 (line 1191): the source says the substituted series starts at degree 1; it should be degree 0 with constant coefficient 1; affects a stated result.
- **Error** in DKV16 at Remark 4.5, p. 863 (lines 1237–1243): the source says the required quotient map to E[π]/(π^(s+1)) is available generally; it should be restricted to circumstances permitting that factorization, absent in general rank at least two; affects a stated result.
- **Error** in DKV16 at Lemma 4.7 proof, p. 864 (lines 1307–1309): the source says local units and the coefficient field have incompatible pro-group descriptions; it should be finite torsion plus pro-ℓ principal units, with compact coefficient images in lattices; affects the proof.
- **Misprint** in DKV16 at (85)–(86), p. 866 (line 1416), and the determinant on p. 868 (line 1474): the source says a malformed nested determinant expression; it should be one determinant of the displayed matrix; affects nothing.
- **Misprint** in DKV16 at the lower-entry identity, p. 867 (line 1441): the source says the first diagonal factor uses σ twice; it should be c(στ)=c(σ)a(τ)+d(σ)c(τ); affects the proof.
- **Misprint** in DKV16 at the sentence after (89), p. 868 (line 1482): the source says t=r identifies the leading coefficients for χ; it should be those for χ⁻¹; affects the proof.
- **Misprint** in CD14 at Theorem 5.1 proof, author-copy p. 31 (line 1469): the source says the free module has homological dimension one; it should be projective, with positive group homology zero; affects the proof.
- **Misprint** in V15 at §4.2, final proof sentence, preprint p. 20 (line 792): the source says the construction finishes Theorem 1; it should be Theorem 2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1ccbef4c2b370f801a1c6751951be8729f9d2c73", "job": "REV-PKG-IntegralIwasawaTheoryPartII~4", "model": "gpt-6-astra", "worker": "chris-6"} -->
