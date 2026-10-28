# Repair dispositions

The finding identifiers below are reproduced from the reviews; the opening label distinguishes r1a from r1b. All nine findings are settled individually. Overlapping Check repairs were performed once in the README. No additional acceptance declarations were introduced.

## F01 (P3) — applied

**Review r1a.** Constant squareclass Checks → three nonconstant units at the ordered roots (0,2,6): X+1, X+2 and X−1. Their readings are (1,[3],[7]), ([2],1,[2]) and ([−1],1,[5]). The excluded-zero Check remains. The first reading detects every nonidentity coordinate permutation, since its three rational squareclasses are distinct.

## F02 (P3) — applied

**Review r1a.** Unqualified extension title → “elliptic curves, Part II — Legendre models, descent and character interfaces” in both README and module docstring. The introduction retains EllipticCurves Layer 4's reduction boundary and Layer 5's twist ownership. Package identifier, namespace and declaration names are unchanged.

## F03 (P3) — applied

**Review r1a.** Deleted the sentence about supply directions following the merge order. The downstream paragraph now describes mathematical scope and ownership. The overlapping consumer-description issue is settled under r1b F03 below; no submission-process claim remains in the README.

## F04 (P3) — applied

**Review r1a.** The identity-scale, symbolic nonroot-product and symbolic root-product Checks → explicit calculations in §§0.2, 2.5 and 2.7. They distinguish coefficients (−16,48) from (−64,768), product 1 from nonsquare −1 over 𝔽₇, and the corrected root product 144 from an invalid zero representative. These remain README Checks only.

## F01 (P2) — applied

**Review r1b.** Prime-field trace-zero headline → every finite field F with q≡3 mod4, for every u∈F, including u=0. Updated README §5.1, the Lean binders and docstring, trace conventions and the named character input. Added the counts 28 over 𝔽₂₇ and 16 over 𝔽₉, with traces 0 and −6.

Evidence: BS20 lines 462–464 supplies the prime-field instance. Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/Basic.lean:257 gives the cardinality-dependent value at −1. For f(x)=x³−u²x, f(−x)=−f(x), so reindexing the integer character sum negates it; its value is zero. This applies to the singular u=0 equation because TauCeti/AlgebraicGeometry/EllipticCurve/PointCount.lean:73 counts all affine solutions, plus O.

## F02 (P3) — applied

**Review r1b.** Prime-field exact-two-part headline → every finite field with q≡5 mod8. Updated §§3.2, 3.6, 3.7 and their character inputs, the Lean signature and docstring, and the scale-two trace consequence in §5.2. Added the 𝔽₁₂₅ count 104=8·13. The subgroup and descent carriers retain their original generality.

Evidence: BS20 lines 663–672 gives the prime-field proof. Mathlib/NumberTheory/LegendreSymbol/QuadraticChar/GaussSum.lean:37 gives χ(2) from q, and QuadraticChar/Basic.lean:257 gives χ(−1). Thus χ(2)=−1, χ(−1)=1. A square root i of −1 has order 4 and cannot be a square when 8 does not divide q−1. The existing descent proof and finite abelian group argument apply without an extension-degree restriction.

## F03 (P3) — applied differently

**Review r1b.** Assertions of existing downstream consumption → accurate scope and ownership descriptions in “Scope and ownership” and “Downstream consumers”. The suggested wording still said ErdosProgressionPowers “uses” our general statements; its head instead requests interfaces and states extensions. The replacement records that distinction. Coefficient and character-count ownership remains here; cyclic, dynamical and progression applications remain downstream.

Evidence: TauCetiRoadmap/MordellLawrenceVenkatesh/README.md §6.4 states the coefficient model and invariants itself; ArithmeticDynamics §§6.35, 6.111–6.112 gives dynamical applications; ErdosProgressionPowers §2.1 requests LG.0–LG.5 and states the generalizations; ComputationalNumberTheory §3.17 states the count formula itself; EllipticCurveModularityPartII §5.1 defines FullRationalTwo without citing this normalization. These sections were read at the supplied heads or through `roadmaps show`.

Changing those other roadmaps' ownership or citations is outside this package, as already recorded in the preceding repair report. This finding explicitly concerns our descriptions, which are repaired. No supplier gap is appropriate: those roadmaps are consumers, and their repointing supplies no prerequisite needed here.

## F04 (P3) — applied

**Review r1b.** Repeated Check values and copied explanations → distinct computations or merged bullets in §§0.2–0.5, 1.1, 1.4–1.5 and 3.7. The same pattern was repaired in §§0.8, 1.2–1.3, 2.6, 2.8 and 3.1. All eight definition subsections retain at least three discriminating Checks. No Check became a Lean declaration.

## F05 (P3) — applied

**Review r1b.** The library-only parenthesis in §2.1 → BS20 line 658, printed p.370, and S09 §X.1, Proposition 1.4, with an explicit distinction between the descent target and its polynomial-CRT construction. Extended S09's existing manifest `cited_for` range to §§2.1–2.8; its uncertified status is unchanged.

Evidence: BS20 line 658 displays the split squareclass target; it does not state a general-field CRT theorem. The algebra equivalence instead follows from Mathlib/RingTheory/Ideal/Quotient/Operations.lean:325 and Mathlib/RingTheory/Polynomial/Quotient.lean:29, with evaluation at line 37, and Tau Ceti's native root decomposition. The repair does not attribute this construction to the prime-field source.

## Verification and mathematical audit

Read the full README, all nine Lean declarations, the source manifest, both reviews, and the supplied elaborated signatures. Read main-branch LocalGaloisGroups and PadicMeasuresIwasawaAlgebras for roadmap form. The Mathlib and Tau Ceti revisions are respectively 6b7abb3c7686292736be2955bd3eb9ebf63b456a and a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 from the prescribed manifest.

The following tables record calculations, not proofs by enumeration. Field extensions used for the numerical audit are 𝔽₉=𝔽₃[i]/(i²+1), 𝔽₂₇=𝔽₃[z]/(z³−z−1), 𝔽₂₅=𝔽₅[z]/(z²+2), 𝔽₄₉=𝔽₇[z]/(z²+1), and 𝔽₁₂₅=𝔽₅[z]/(z³+z+1). Each quadratic has no root in its base field; the cubics take nonzero values at every base-field element and are therefore irreducible. Counts enumerate y²=f(x) and add one. Doubling uses the ordinary tangent law for y²=x³+a₂x²+a₄x+a₆.

All 232 admissible scaled models over 𝔽₃, 𝔽₅, 𝔽₇, 𝔽₉ and 𝔽₁₃, covering 2,496 affine points, satisfy both directions of the halving criterion; all square-parameter models among them have the required independent order-two and order-four generators. All 9,587 normal-form twist cases over 𝔽₅, 𝔽₇ and 𝔽₉ satisfy the trace identity, including singular equations and scalar zero. The conic witness was tested on 420 admissible triples across 𝔽₅, 𝔽₉, 𝔽₁₃, 𝔽₁₇, 𝔽₂₅, 𝔽₂₉, 𝔽₄₁ and 𝔽₄₉, with no membership or doubling failure. The rational valuation audit covered 5,310 inputs at p=3,5,7, with no failure.

### Targets and definitions

This table includes every numbered target; §5.1's general count formula and symmetric specialization have separate rows. An unchanged result records the mathematical conclusion, not a claim that enumeration proves the target.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| §0.1 `legendre` | ℚ, λ=2,−1,0; 𝔽₃; zero ring; square-zero thickening | λ=2: coefficients (0,−3,0,2,0), cubic at 2 is 0 and at −2 is −24; λ=−1 gives (0,0,0,−1,0). λ=0: Δ=0. Over 𝔽₃, λ=2: Δ=1,c₄=0. In the zero ring Δ=0=1 is a unit. At λ=2+ε over 𝔽₅[ε]/ε², Δ=4+2ε and (4+2ε)(4+3ε)=1. | Ring identities and field boundary agree | None |
| §0.2 `scaledLegendre`, native twist specialization | ℚ, d=0,2,4; λ=1/2,3 | L(2,1/2): (a₂,a₄,Δ)=(−3,2,64); L(4,3): (−16,48), while coordinate dilation by 4 gives (−64,768). Native (0,−1/2) has discriminant 2; (0,−2) has 8. d=0 gives five zero coefficients. | Root scale and coordinate scale differ | Concrete Checks |
| §0.3 six labelled parameters | ℚ, λ=−1,2,1/2,3,0,1 | Tuples respectively (−1,−1,2,1/2,1/2,2), (2,1/2,−1,−1,2,1/2), (1/2,2,1/2,2,−1,−1), (3,1/3,−2,−1/2,3/2,2/3), (0,0,1,1,0,0), (1,1,0,0,0,0). | Repetitions and junk divisions retained | Deduplicated Checks |
| §0.4 invariants and ellipticity | ℚ, λ=2,1/2,−1,3; characteristics 2,3 | (Δ,c₄,j)=(64,48,1728),(1,12,1728),(64,48,1728),(576,112,21952/9); characteristic 2: Δ=0; over 𝔽₃ at λ=2: Δ=1,j=0. | Exact hypotheses include j=0 | Distinct Check instances |
| §0.5 scaled invariants | ℚ, (d,λ)=(2,1/2),(2,3),(0,3) | (Δ,c₄,j)=(64,48,1728),(36864,448,21952/9); d=0 gives Δ=c₄=0 and no field-elliptic j. Ratios to unscaled Δ,c₄ are 64 and 4. | Powers d⁶,d² agree | Split duplicate boundary Check |
| §0.6 ordered-root ratios | Roots (3,5,9), (0,1,−1), (0,0,1) | First tuple (3,1/3,−2,−1/2,3/2,2/3); second (−1,−1,2,1/2,1/2,2); coincident roots give first quotient 1/0=0, excluded. | Six labelled orders agree | None |
| §0.8 split normalization | Roots (3,5,9) over ℚ | (a₂,a₄,a₆)=(−17,87,−135) translates by +3 to (−8,12,0)=L(2,3); new roots (0,2,6). √2 is not rational. | Direction and twist distinction agree | Merged repeated translation computation |
| §0.9 `exists_scaledLegendre_of_full_two_torsion` | y²=x³−x over ℚ and 𝔽₃; y²=x³−2x over ℚ | First doubling kernels have 4 points, with d=1,λ=−1 (λ=2 in 𝔽₃); the latter kernel has only O,(0,0), hence cardinality 2≠4. | Hypothesis separates split and nonsplit cubics | None |
| §0.10 labelled two-torsion | (d,λ)=(2,1/2),(1,3); L(−1)/𝔽₃ | Labels (0,0),(2,0),(1,0); each double O. On L(3), the three root points sum to O. Over 𝔽₃ the full set is O,(0,0),(1,0),(2,0), all killed by 2. | Both directions of exhaustion agree | None |
| §1.1 valuation alternatives | p=3, λ=3,1/3,−2,−1; p=2,λ=2 | (vλ,v(1−λ),vj)=(1,0,−2),(−1,−1,−2),(0,1,−2),(0,0,3). Dyadic control: (1,0,6), so integral j need not force unit λ there. | All three nonunit alternatives and integral-j boundary agree | Deduplicated Checks |
| §1.2 `legendre_units_of_good_reduction` | L(−1) at p=3,5; dilation by 3 | At p=5, parameters −1,2,1/2 and complements all have valuation 0; at p=3, vj=3 while vλ=v(1−λ)=0. Dilated model y²=x³−81x has Δ=64·3¹² and v₃Δ=12; its good minimal representative has v₃Δ=0. | Good reduction concerns the minimal representative | Numeric root-order and nonminimal Checks |
| §1.3 unit good model | λ=3 at p=5,3; residue field 𝔽₂ | Δ=576≡1 mod5; residues λ̄=3,1−λ̄=3. At p=3, v₃Δ=2 and λ̄=0. At p=2, the only nonzero residue is 1 and its complement is 0. | Unit assumptions exclude singular reduction | Merged duplicate Check |
| §1.4 odd character support | λ=3,−1,2,1/2, all four ω | λ=3 gives conductors 12,3,24,24 and odd parts 3; λ=−1 gives 4,1,8,8 and odd parts 1; λ=2 or 1/2 gives 8,8,1,4 and odd parts 1. At λ=3, v₃j=−2 rules out good reduction at 3. | Support agrees, including trivial character | Distinct radicand Checks |
| §1.5 conductor divisibility | L(−1), four ω; λ=3,ω=1 | Four odd character conductors are 1, so 1 divides every positive elliptic conductor, in particular the stated value 32. For λ=3, N=12 and odd part=3; displayed Δ=576 is a different invariant. | Divisibility does not imply nontriviality | Merged duplicate; numerical M=32 limitation below |
| §2.1 ordered CRT | ℚ, roots (0,2,6), h=X+1,X²,1 | Readings (1,3,7),(0,4,36),(1,1,1). Lagrange basis (X−2)(X−6)/12, −X(X−6)/8, X(X−2)/24 evaluates to the three standard basis triples. Repeated roots (0,0,1) instead give denominator 0. | Evaluation and inverse fix the equivalence | Added accurate source locators |
| §2.3 induced squareclass equivalence | Same roots, units X+1,X+2,X−1; excluded constant 0 | Evaluations (1,3,7),(2,4,8),(−1,1,5); classes (1,[3],[7]),([2],1,[2]),([−1],1,[5]). Swapping the last two coordinates changes [3] to [7]. Zero gives three nonunit coordinates. | Ordering and unit domain determined | New discriminating Checks |
| §2.5 nonroot and O descent | L(4)/𝔽₇ at (3,1); L(−1)/𝔽₅ at (2,4); O | Representatives (3,2,6), product 36≡1, signs (−1,1,−1); reversing all differences gives 6=−1, nonsquare. Second triple (2,1,3), product 6≡1=4². O gives (1,1,1). | Sign and affine branch agree | Replaced symbolic Check |
| §2.6 root descent | ℚ, d=2,λ=3; 𝔽₅, d=1,λ=−1; conic d=2,λ=3 | Rational triples (12,−2,−6),(2,−8,−4),(6,4,24), products 144,64,576. Over 𝔽₅ at d=1: raw (4,4,1),(1,2,2),(4,3,2). At d=2: (2,3,4),(2,2,1),(1,4,4). | Root derivatives and labels agree | Deduplicated with explicit conic values |
| §2.7 product condition | T₀ on L(2,3)/ℚ; O; (2,4)/𝔽₅ | 12·(−2)·(−6)=144=12²; uncorrected 0 gives product 0, outside units. O:1·1·1=1; nonroot: [2·1·3]=[1]. | All three branches agree | Concrete root Check |
| §2.8 `scaledLegendre_halving_iff_squares` | T₀ on L(−1) over ℚ,𝔽₅; T₁ over 𝔽₅ | At T₀ the differences are (0,−1,1) over ℚ: false; over 𝔽₅ (0,4,1): true, with four halves. At T₁ the differences (1,0,2) include nonsquare 2 and no half exists. | Both implications hold at root boundaries | Merged duplicate Check |
| §3.1 `legendre_two_by_four_subgroup` | 𝔽₅,𝔽₇,η=2; 𝔽₉,η=i; 𝔽₃ | In 𝔽₅, P=(2,1) doubles to T₀ and T=(1,0) is independent: image size 8. In 𝔽₇, P=(3,1) doubles to (1,0), independent of (0,0): size 8. In 𝔽₉ count=16 and subgroup size=8. Over 𝔽₃ there are 0 admissible η. η=0,±1 gives Δ=0. | Both squareclass branches included | Deduplicated boundary Check |
| §3.2 chosen minus-one half | 𝔽₅, i=2,3; 𝔽₁₇,i=4 | P=(2,4),(3,3); y²=cubic=1,4, denominators 2y=3,1; both double to (0,0) and have order 4. First characters −1,−1; in 𝔽₁₇ χ(4)=1. | Exact order, sign and nonsquareness hypotheses agree | Existence clause generalized |
| §3.6 no order eight | q=5,13,29,125; q=41 control | Counts 8,8,40,104; the four halves of T₀ have first characters (−1,−1,−1,−1). At q=125 their x-coordinates are 2,2,3,3 and point orders are 1,2,4,13,26,52, with no order 8. At q=41, (6,13) has order 8 and count=32. | q≡5 mod8 is sufficient; q≡1 mod4 alone is not | General finite-field target and inputs |
| §3.7 `legendre_minus_one_point_count_v_two` | q=5,13,29,125; abstract C₄×C₄ | Counts 8,8,40,104 are 8·1,8·1,8·5,8·13, hence v₂=3. C₄×C₄ has kernel size 4, exponent 4 and order 16, with all three nonzero two-points divisible; C₂×C₄ has just one such divisible point and order 8. | Precise divisible-root information is necessary | Generalized headline and 𝔽₁₂₅ Check |
| §4.1 conic witness | 𝔽₅,t=v=2,i=3,2; 𝔽₉,t=v=1 | Chosen points (4,3),(3,4), y²=cubic=4,1; doubles both (1,0); slopes 1,2. Third readings 3,2 are nonsquares. In 𝔽₉, P=(1+i,1−i), y²=cubic=i and double=(1,0). Printed (4,4) instead has y²=1≠4. | Corrected sign, membership, order and descent agree | None |
| §5.1 normal-form count and trace | 𝔽₅,λ=3,d=1,2; singular u=0 over 𝔽₃; 𝔽₂ control | Character sums −2,2 give counts 4,8 and traces 2,−2. At u=0 over 𝔽₃ fibres 1,2,0 give count 4 and trace 0. Over 𝔽₂, y²=x³+1 gives count 3 but character expression 4. | Odd-characteristic assumption and singular-inclusive count agree | None |
| §5.1 `scaledLegendre_minus_one_trace_zero` | All u over 𝔽₃,𝔽₇,𝔽₂₇; u=1 over 𝔽₉,𝔽₂₅,𝔽₄₉ | Counts identically 4,8,28 over the first three fields, traces 0. Controls give counts 16,32,64 against q+1=10,26,50 and traces −6,−6,−14. Over 𝔽₇,u=2, character list (0,1,0,1,−1,0,−1) has sum 0. | Cardinality congruence is the correct hypothesis | Generalized headline and extension Check |
| §5.2 `quadraticTwistOf_frobeniusTrace` | 𝔽₅,λ=3,d=2,4,0; λ=0,d=2; normal form over 𝔽₉ | Traces −2=(−1)·2, 2=1·2, 0=0·2. Singular λ=0 gives −1=(−1)·1. Over 𝔽₉, W:y²=x³+x+1 has count16,trace−6; twist by 1+i has count4,trace6=(−1)(−6). | Singular and zero-scalar cases agree | Cardinality-based scale-two sign input |

### Supporting API statements

The numbering in this table is the bullet position in each definition's supporting API. All 34 bullets are included separately.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| §0.1 API 1, equation | ℚ, λ=2,x=2,−2 | Expanded and factored cubics both give 0,−24; y=0 satisfies only the first. | Equivalent predicates | None |
| §0.1 API 2, map | ℤ→𝔽₃, λ=2 | Coefficients (0,−3,0,2,0) map to (0,0,0,2,0), exactly L(2). | Same coefficients | None |
| §0.1 API 3, injectivity | ℚ, λ=2,3; zero ring | a₄=2≠3 separates the models; in the zero ring 0=1 gives equal parameters and equal models. | Both directions | None |
| §0.1 API 4, normal form | ℚ, λ=2,−1 | (a₁,a₃)=(0,0) in each case, even though a₂=−3,0. | No extra a₂ condition | None |
| §0.2 API 1, equation | ℚ,d=2,λ=3,x=1,2 | Expanded and factored cubics both give 5,0. | Same equation | None |
| §0.2 API 2, d=1 | ℚ,λ=3 | Both coefficient tuples (0,−4,0,3,0). | Equal models | None |
| §0.2 API 3, map | ℤ→𝔽₅,d=2,λ=3 | (a₂,a₄)=(−8,12) maps to (2,2), equal to the specialized model. | Equal coefficients | None |
| §0.2 API 4, native twist | ℚ,d=2,λ=1/2; d=0 | Native (t,n)=(0,−1/2) gives D=2 and tuple (0,−3,0,2,0); d=0 gives Δ=0 instead of a field-elliptic twist. | Scalar and ellipticity agree | None |
| §0.3 API 1, labels | ℚ,λ=3 | (3,1/3,−2,−1/2,3/2,2/3) in the specified order. | Exact entries | None |
| §0.3 API 2, admissibility | ℚ,λ=3,0,1 | Six valid entries at 3 avoid 0,1; at 0 and 1 the displayed total tuples contain both 0 and 1. | Hypotheses separate boundaries | None |
| §0.3 API 3, reciprocal pairs | ℚ,λ=3 | 3·1/3=1, (−2)(−1/2)=1, (3/2)(2/3)=1. | All three pairs | None |
| §0.3 API 4, field map | 𝔽₃→𝔽₉,λ=2 | Both tuples have all six entries equal to 2. Identity ℚ→ℚ at λ=3 fixes all six distinct entries. | Transport preserves labels | None |
| §0.10 API 1, coordinates | ℚ,d=2,λ=1/2 | (0,0),(2,0),(1,0), with no O among them. | Labels fixed | None |
| §0.10 API 2, doubling | L(−1)/𝔽₃ | 2(0,0)=2(1,0)=2(2,0)=O. | All labels killed | None |
| §0.10 API 3, distinct/nonzero | ℚ,d=2,λ=1/2; d=0 control | Three distinct x-values 0,2,1, all affine; d=0 instead gives 0,0,0 and Δ=0. | Exact hypotheses | None |
| §0.10 API 4, exhaustion | L(−1)/𝔽₅ | Kernel {O,(0,0),(1,0),(4,0)} has size 4; (2,4) doubles to (0,0)≠O and is outside it. | Both inclusions | None |
| §2.1 API 1, evaluation | ℚ,roots0,2,6 | X+1→(1,3,7), X²→(0,4,36), 1→(1,1,1). | Ordered values | None |
| §2.1 API 2, equality detection | f=X(X−2)(X−6), h=X+1 | h,h+f both read (1,3,7) and have the same quotient class; h+1 reads (2,4,8), a distinct class. | Both directions | None |
| §2.1 API 3, root element | ℚ,roots0,2,6 | θ→(0,2,6), whereas θ+1→(1,3,7). | Shifted wrong model excluded | None |
| §2.1 API 4, units | ℚ,roots0,2,6 | X+1 has nonzero evaluations 1,3,7 and is a unit; X has evaluations0,2,6 and is not a unit. | Both directions | None |
| §2.3 API 1, unit readings | ℚ,roots0,2,6 | X−1 reads ([−1],1,[5]); constant2 reads ([2],[2],[2]). | Unit quotient agrees | None |
| §2.3 API 2, identity | ℚ,constant1,4 | Both read (1,1,1), since 4=2². | Identity and square collapse | None |
| §2.3 API 3, triviality detection | ℚ,u=X+1 and u² | u reads (1,[3],[7])≠1; u² evaluates(1,9,49) and all three classes are1. | Both directions | None |
| §2.3 API 4, product/equivalence | u=X+1,v=X+2 at roots0,2,6 | uv evaluates(2,12,56), with classes([2],[3],[14]), equal to coordinatewise products. The interpolation basis maps back to all three coordinate basis vectors. | Multiplication and inverse agree | None |
| §3.2 API 1, coordinates | 𝔽₅,i=2,3 | Chosen P=(2,4),(3,3); negatives are (2,1),(3,2). | Chosen sign fixed | None |
| §3.2 API 2, double | Same points | Both doubles (0,0), distinct from O. | Native root point | None |
| §3.2 API 3, exact order | Same points | 2P=(0,0)≠O and 4P=O; orders 4,4. | Exact order | None |
| §3.2 API 4, first descent | 𝔽₅,i=2,3; 𝔽₁₇,i=4 | χ(i)=−1,−1,+1 respectively. | Class is [i], not uniformly1 | None |
| §3.2 API 5, field transport | 𝔽₅→𝔽₁₂₅,i=2 | (2,4) maps to the same constant-coordinate point; doubled point (0,0) maps to (0,0). | Source and target compatible | None |
| §4.1 API 1, coordinates | 𝔽₅,t=v=2,i=3 | (4t²+4itv,8itv(t+iv))=(4,3); printed coordinates (4,4) fail 1=4. | Corrected formula fixed | None |
| §4.1 API 2, double | Same input | λ=3,2λ=1 and 2(4,3)=(1,0). | Correct root label | None |
| §4.1 API 3, exact order | Same input | 2P=(1,0)≠O;4P=O. | Order4 | None |
| §4.1 API 4, third class | 𝔽₅,i=3,2 | x−2λ=3,2, equal to4itv; characters−1,−1. | Third reading and sign | None |
| §4.1 API 5, field transport | 𝔽₅→𝔽₁₂₅,t=v=2,i=3 | Coordinates (4,3), parameter3 and double(1,0) map to the same constants. | Native point-map targets agree | None |

### Conventions and boundary controls

| Statement | Instances tried | Computed values on the two sides | Result | Change |
|---|---|---|---|---|
| Field versus general ring ellipticity | Zero ring; 𝔽₃ at λ=2; characteristic2 | Zero-ring Δ=0=1 is a unit; over 𝔽₃ Δ=1 and j=0; characteristic2 Legendre Δ=0. | Nonzero criterion used only over fields; no j≠0 condition | None |
| O versus affine zero | L(−1)/𝔽₅ | O has order1; (0,0) has order2, although its two coordinates are zero. | Native constructors distinguish them | None |
| Squareclass domain and root order | Roots0,2,6, u=X+1 and X | First reading (1,[3],[7]); swapped (1,[7],[3]) differs. X's first evaluation0 is nonunit; as a field element 0=0² is square. | Quotient uses units only | New Checks |
| Coordinate-change direction | Roots3,5,9 and identity map | r=3 sends coefficients(−17,87,−135) to(−8,12,0); r=0,u=1 preserves every coefficient. | New coordinates map to old by x_old=x_new+r | None |
| Twist normalization | d=2 and4 | (0,−d/4) gives D=2,4; alternative (0,−2) gives D=8. Over 𝔽₅ the trace multipliers at2,4 are−1,+1. | Scalar and trace conventions agree | Concrete scaling Check |
| Valuation and minimality | p=3 at3,1/3,0; L(−1) and dilation | v₃=1,−1,0 respectively; zero's value0 is excluded from multiplicative calculations. Discriminant valuations0,12 belong to isomorphic equations. | Total-function and model boundaries retained | Numeric dilation Check |
| Primitive character and odd part | Radicands1,−1,3 | Conductors1,4,12; odd parts1,1,3. Removing only one factor2 from12 would give6, which is even. | Trivial character allowed; full2-part removed | None |
| Trace and Euler signs | L(3),L(2,3) over𝔽₅ | Counts4,8; traces6−4=2,6−8=−2; polynomials1−2T+5T²,1+2T+5T². | Counts and twist signs consistent | Generalq convention |
| Finite abelian input | C₂×C₄, C₄×C₄, C₈; S₃ control | Orders8,16,8; doubling-kernel sizes4,4,2. S₃ has4 elements squaring to1 but order6; squaring is not a homomorphism there. | Native abelian structure is essential; no nonabelian assertion made | None |

### Supplier, source and ownership checks

Every cross-roadmap citation was compared with its cited section, using main for EllipticCurves, ModularCurves and ClassicalArithmeticCompletion, the supplied heads for the five consumers, and `roadmaps show` for NeronModelsAndSemistableAbelianVarieties, ArithmeticGaloisRepresentations and MordellLawrenceVenkatesh. The sections supply precisely the stated inputs:

| Citation | Evidence and boundary |
|---|---|
| EllipticCurves Layer4 | Minimal-equation reduction discussion and complete-DVR potential-good-reduction/integral-j criterion; only the good-reduction implication is used. |
| EllipticCurves Layer5 | Native twist parameters have discriminant t²−4n, invariant weights6,2,3 and point comparisons. No second twist construction here. |
| ModularCurves §§4C,9E | Universal Legendre structure and moduli-level S₃/invariant-ring theory; our targets give coefficient specializations and ordered root ratios. |
| ClassicalArithmeticCompletion §§1.7,1.8,1.51 | Fundamental-discriminant characters, uniqueness for primitive nonzero levels and nontrivial coefficient ring, all six cited squareclass declarations, odd support by valuation parity and squarefree odd conductor. |
| NeronModelsAndSemistableAbelianVarieties §§5.3a,5.3g | Actual Tate-module Artin conductor over complete DVRs with perfect residue field, plus rational bad-prime support and multiplicative exponent1; ℚ_p meets these conditions. |
| ArithmeticGaloisRepresentations Layer3 | Finite-dimensional representations with finite wild image and coefficient characteristic different from residue characteristic; elliptic comparisons assigned to the Néron owner. |
| EllipticCurveModularityPartII §5.1 | FullRationalTwo is rational doubling-kernel cardinality4; no asserted dependency on this package at that head. |
| MordellLawrenceVenkatesh §6.4 | Coefficient model and invariants overlap; cyclic abelian-by-finite family and connection remain there. |
| ArithmeticDynamics §§6.35,6.111–6.112 | Same coefficient equation and its Lattès and torsion-image applications; no dynamical target moved here. |
| ErdosProgressionPowers Layer2,§2.1 | LG.0–LG.5 interface request, with the same scaled coefficients, halving criterion, conic point and trace sign. Its requested extensions are supplied by our general statements. |
| ComputationalNumberTheory §3.17 | Singular-inclusive normal-form character count; this package owns the earlier mathematical input. |

Ownership searches used `roadmaps grep` by objects, the board packages, main and the 51 specifically supplied sibling folders. Broad searches that hit the output limit were narrowed to descent, normalization, character-count and twist-trace objects. The overlapping coefficient model, normal-form count and requested generalizations occur in later consumers; none is an earlier prerequisite to import from those consumers. Generic twists, descent, character construction, moduli theory and conductor comparison remain with their existing owners. No fully qualified declaration name was borrowed from another roadmap. No new foundational construction or supplier gap was needed; design/plan.json and metadata.toml are unchanged.

The pinned definitions were read, rather than inferred from their names. Mathlib/AlgebraicGeometry/EllipticCurve/Weierstrass.lean:76 contains five coefficients, :366 makes ellipticity a unit-discriminant condition, and :388 defines j only with ellipticity. NormalForms.lean:107 requires just a₁=a₃=0, while :166 completes the square with invertible2. Affine/Point.lean:477 includes O and nonsingular affine coordinates. Reduction.lean:323 includes minimality in good reduction. The CRT, quotient-group, rational-valuation, finite-character and finite-abelian inputs were inspected at their pinned files; in particular the general finite-field special-value theorems replace the prime-field laws in the generalized proof routes.

TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/XSubT.lean:164, :276 and :505 fix the cubic, its native AdjoinRoot algebra and unit-square quotient. Its :548, :558 and :566 distinguish corrected root and nonroot representatives; :794 and :961 give the actual homomorphism and kernel. TwoTorsion.lean:57 exports the root count under normal form and ellipticity, rather than the labelled set equality. Affine/Point/VariableChange.lean:177 maps points on C•W back to W. QuadraticTwist/Basic.lean:169 fixes all five coefficient formulas. PointCount.lean:73, :86 and :109 separate total projective counts, elliptic point-group comparison and integer trace. No accepted headline merely restates one of these pinned declarations in one tactic.

The legal BS20 extraction was reread at every cited anchor: lines462–464,513–516,526–546,547–557,568–569,657–662,663–672,703–705,710,715,718–720. Published page numbers366–371 and the manuscript's theorem numbering agree with the README. The generalizations are justified by the explicit arguments and pinned finite-field character laws, not attributed to a stronger printed BS20 theorem. S09 and K84 remain settled uncertified references; neither was requested again. No new source or missing-reference request was needed.

The unchanged numerical value M=32 in the §1.5 Check was not independently certified from a legally available primary-source text in this round. Its four character conductors were computed, and the divisibility Check is valid for every positive M because all four odd parts are1. This numerical verification limit does not enter the conductor theorem or any repair.

### Elaborated-signature check

A scratch file containing the exact revised module followed by `#check @name` for each of its nine declarations elaborated successfully. The output was compared with each README statement. All explicit hypotheses remain; no section binder disappeared.

| Declaration | Effective signature compared with README | Outcome |
|---|---|---|
| legendre | Arbitrary universe, CommRing R, λ:R | Real five-coefficient body; no field hypothesis |
| scaledLegendre | Arbitrary universe, CommRing R, d,λ:R | Real five-coefficient body; no nonzero restriction on the definition |
| exists_scaledLegendre_of_full_two_torsion | Field K, DecidableEq K,2≠0,E.IsElliptic,kernel cardinality4 | All retained, including the relation C•E=L(d,λ) in the conclusion |
| legendre_units_of_good_reduction | Primep,p≠2,elliptic E/ℚ,actual model equality,good reduction on the minimal local equation | All retained |
| scaledLegendre_halving_iff_squares | Field K,DecidableEq K,2≠0,d≠0,λ≠0,1,actual nonsingular affine point | Both implications use the native point and three field-square predicates |
| legendre_two_by_four_subgroup | Field F,Finite F,DecidableEq F,2≠0,η≠0,η²≠1 | All retained |
| legendre_minus_one_point_count_v_two | Field F,Fintype F,card F%8=5 | Replaced prime-field binders; arbitrary universe retained; no DecidableEq needed by statement |
| scaledLegendre_minus_one_trace_zero | Field F,Fintype F,card F%4=3,u:F | Replaced prime-field binders; count and trace conclusions retained, including u=0 |
| quadraticTwistOf_frobeniusTrace | Field F,Fintype F,DecidableEq F,2≠0,W.IsCharNeTwoNF,arbitraryd | No ellipticity or nonzero-scalar assumption added |

The eight headlines remain normalization, good-prime units, odd-conductor divisibility, halving, the two-by-four subgroup, exact two-part eight, symmetric trace zero and normal-form twist trace. Seven have acceptance signatures. Actual elliptic-conductor divisibility still lacks its native conductor carrier at the pins and is explicitly identified in the module docstring. The file remains two real definitions and seven sorry'd theorems, with a single Mathlib import and exactly the two used Tau Ceti imports. No API padding, new example, sorry'd data or set_option was added.

## Check outcomes and maintainer notes

- Required `lake env lean` on packages/EllipticLegendreCharacterInterfaces/Suggested.lean from the prescribed content checkout: **exit0**, seven expected “declaration uses sorry” warnings at lines31,42,55,67,76,85,93; no errors. Both imported Tau Ceti object files were present, so no targeted dependency build was necessary.
- Scratch `#check @name` elaboration from the same checkout: **exit0**, the same seven expected warnings, and all nine effective signatures above. An initial scratch invocation from the board directory could not find a default toolchain; it was rerun from the prescribed content checkout without changing toolchains or project files.
- Required dependency command on the final README: **exit0**, output below. No UPWARD, CYCLE or moved line.

```text
depcheck: 52 roadmaps, 585 edges, 0 problem(s)
```

- `roadmaps resolve` on the revised README: **exit0**, no unresolved cross-roadmap citations and no unresolved Lean names. The service did not check pinned library names; those were inspected locally at the prescribed pins as described above.
- `git diff --check`: **exit0**, no whitespace errors. Definition Check counts are7,4,5,4,4,4,3,5 for §§0.1,0.2,0.3,0.10,2.1,2.3,3.2,4.1 respectively.
- No separate gate failure was listed in the brief. Changes address the nine findings and their repeated patterns. No content outside the permitted package files was edited, and nothing was committed or pushed.

No declaration name changed or disappeared. Consumers of the two generalized headlines must now instantiate the field explicitly if inference cannot determine it; a prime-field call supplies F=ZMod p and rewrites its cardinality to p. Other roadmaps' duplicate coefficient/count targets and ErdosProgressionPowers' requested generalizations still need their owners' external repointing. This package now describes that ownership accurately and adds no reverse supply edge.
