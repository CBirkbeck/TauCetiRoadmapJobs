# Repair findings for ComplexMultiplicationAndExplicitReciprocityPartII

The finding identifiers are local to their respective reviews. All eight findings were verified independently; none overlap mathematically. Edits affect `packages/ComplexMultiplicationAndExplicitReciprocityPartII/README.md`, `packages/ComplexMultiplicationAndExplicitReciprocityPartII/sources.toml`, and only the top-level gaps in `packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/plan.json`. The acceptance file and metadata are unchanged.

# Review r1a

## F01 (P3) — applied

Order two in E_v×/F_v× → order two in its valuation quotient by integral units. Corrected §1.2, Layer 1 Examples and the worked example. For π=√3(1+√3), π²=12+6√3∉ℚ₃, while π²/3=4+2√3 is a unit. Thus the original claim fails; the integral-unit exclusion remains valid.

## F02 (P3) — applied

An unnamed quadratic period relation → [C] §0.6, pp. 632–633 (C lines 339–370), with Theorem 0.3(ii) (C line 297) for height conversion. Updated §4.6, References and the existing C manifest entry. Added the ℚ(i) gamma-value Check; C lines 327–338 explain why Theorem 0.5 alone leaves a log 2 ambiguity.

## F03 (P1) — applied

Unassigned use of Chebotarev → import of Chebotarev Layer 9 in Exact supplier contracts, §7.1 Needs and Layer 7 Dependencies. Its abelian density theorem gives density 1/2 for the nontrivial quadratic Frobenius class. Added the 3,7 inert-prime and finite-exclusion Check. No density theorem or supplier gap is duplicated here.

## F04 (P2) — applied

Unquantified joint balancing/reduction obligation → separate Siegel matrix and hermitian bounds. Retained the old slug for Siegel reduction; added matching `quantitative-hermitian-lattice-balancing` gaps in README and plan. §13.3 now supplies N, computes the trace-form determinant and retains finite index. Four Checks test metric scaling, lattice scaling, nonunimodularity, positivity, translations and inversion. Evidence: PT lines 213–284, 353–385.

## F05 (P3) — applied

A repetition of base-extension invariance → the concrete normalization calculation 6 log 2/3=12 log 2/6=2 log 2 in §7.2. Holding the numerator fixed gives log 2 and fails. The Check explicitly does not claim these numbers construct a CM point. The denominator and metric agree with Y lines 154–165.

# Review r1b

## F01 (P3) — applied

Implicit arithmetic reading of geometric reciprocity → explicit substitution s↦s⁻¹ in Conventions, the ShimuraVarieties contract and §1.3. Recomputed the unit-2 Check: geometric action 2 becomes arithmetic action 3 modulo 5. ShimuraVarieties §4.1 defines the geometric map; GrossZagierAndArithmeticHeights §0a.4 already makes this conversion. The arithmetic Lubin–Tate contract is unchanged.

## F02 (P3) — applied

Supplier contracts omitting consumed sections → inclusion of ShimuraVarieties §§6.1–6.2 and MetaplecticAutomorphicForms Layers 4–7. The former supply Hodge-type canonical models; the latter supply covers, Weil representations, theta kernels and Siegel–Weil/see-saw input. Their sections exist at the supplier heads and agree with the existing §4.2–§4.2c Needs lines. The geometric-Artin correction is retained.

## F03 (P3) — applied

Layer 8 numbering 8.1,8.3 → 8.1,8.2. Updated both consumers in §9.1 and Layer 9 Dependencies. The height statement and proof route are unchanged. Searches of main, open roadmap heads and board packages found no external citation of this package's old §8.3. Source locators such as A §8.3 remain unchanged.

# Mathematical verification of the repairs

The local quotient is determined by the valuation sequence. For a ramified quadratic extension v_E(F×)=2ℤ and the kernel of E×/F×→ℤ/2ℤ is precisely the unit image. That image is compact, and the quotient has two elements, so E×/F× is compact. Compactness does not give order two for each uniformizer class. In the counterexample v_E(π)=1 and v_E(π²)=2; the valuation classes are 1 and 0.

The new hermitian contract is a quantitative supplier obligation, not a claim that the supplier already states it. It is mathematically supported by the following extension of PT's independent-vector argument. Put m=2nr. An integral positive trace form has shortest squared length at least 1 and positive integer determinant. Successive minima and bounded lattice bases in fixed rank give a ℤ-basis of L with q-lengths polynomial in det Gram(q). Select r E-independent vectors from it. Positivity at every embedding bounds each diagonal hermitian value by q(v,v)/N, and Cauchy–Schwarz bounds the off-diagonal entries. A bounded integral basis of R, with bounds in |disc R|, gives a ℤ-basis of ΣRv_i with polynomial q-lengths. Hadamard and

`[L:sum Rv_i]^2 * det Gram_L(q) = det Gram_(sum Rv_i)(q)`

then bound its finite index. This does not assert that the selected vectors form an R-basis of L.

For the CM application, central idempotents multiplied by the center-order index preserve the original lattice. Their block sublattices therefore have polynomial total index. Restricting a principal alternating form to that product sublattice multiplies its determinant by the index squared; orthogonality of different isotypic blocks makes every block determinant a positive integer bounded by that product. Write its block form as ψ=Tr H_ψ. Choosing the indicated ζ and N gives q(x,y)=ψ(x,Nζy), hence integrality and the exact determinant factor N^(2nr)|Nm ζ|^r. Bounded conjugates of nonzero integral ζ also bound their reciprocals by the norm product. These facts supply the D bound required in §13.3 without assuming a bounded metric from the rank alone.

For the quadratic normalization, β(s)=4^(−s)(ζ(s,1/4)−ζ(s,3/4)) has β(0)=1/2 and β′(0)/β(0)=−log 4+2 log(Γ(1/4)/Γ(3/4)). Substitution into §4.6 gives −log(Γ(1/4)/Γ(3/4))−log π/2, approximately −1.6571065162, on both sides. Theorem 0.3 and the exact §0.6 calculation, rather than a formula modulo ℚ log 2, are the relevant inputs.

# Computed adversarial pass

Every numbered target has a row below. A scalar substitution into a height or intersection formula tests its algebra and normalization; it does not assert existence of a CM object with arbitrary assigned heights. Finite tests supplement the proof routes and source verification, and do not establish the general theorems. Field rows retain characteristic zero, positive degree and separability. Local rows retain full lattices and the stated DVR and splitting hypotheses. Zero rings and inseparable number fields are excluded by those hypotheses; empty partitions and rank-zero representations are tested where allowed.

| Statement | Instances tried and computed values on both sides | Result; change |
| --- | --- | --- |
| Conventions: metrics | Square torus integral 2; squared metrics 2,1,1/π. Relative to the middle height, shifts are −log 2/2 and +log π/2. The shift from the first to the third is +log(2π)/2. | Compatible; no metric change. |
| Conventions: Artin | In (ℤ/5ℤ)×, 2·3=1. Geometric unit action 2; geometric action at 2⁻¹ is 3, equal to arithmetic action at 2. The uniformizer acts by 1 on torsion. | Added the explicit conversion and recomputed its Check. |
| Conventions: degree and discriminant | 2a/(2d)=a/d; replacing the denominator by 2d alone gives a/(2d). For ℚ(i), 4=1²·4; conductor 2 gives 2²·4=16. | Consistent. |
| 0.1 Class functions | C₂ overlap (1,0), product (2,0). On C₂×S₃ the transposition overlaps are (6,2,2), averaging 10/3; conjugate complements (0,4,4), averaging 8/3; their sum is 6. Constant 1 has value 1 at c, while overlaps have 0. | Consistent; averaging and the proper span are essential. |
| 0.2 Linearity | For every generator a, (ht+t ev_c)(a)=ht(a)+t·0. On the constant function the difference is t·1=t. An induced degree-two type multiplies overlap and product height by 2. | Uniqueness is restricted to H_CM. |
| 0.3 Average character | d=1 gives (1+χ)/2 with values (1,0). At identity for d=3, the left side is 8·3/6=4 and the right side is 2(1+3/3)=4. | All types and the factor 1/(2d) agree. |
| 0.4 Conjecture predicate | On C₆, complementary sums of (0,1,1,0,−1,−1) are 0, but inversion gives 1 versus −1. On ℚ², x and y agree at (1,1), both 1, but give 1 and 0 at (1,0). | An average equality cannot identify the two linear maps. |
| 1.1 Torus | d=1: dimension 2, scalar kernel μ₁. d=2: dimension 3, diagonal −1 has norm 1 and gives μ₂. A single embedding has pair sums 1,0, while a type has 1,1. | Consistent character lattice and diagonal kernel. |
| 1.2 Integral level | π=√3(1+√3): v=1, square 12+6√3, square valuation 2. Unit-image quotient classes 1 and 0; π²∉ℚ₃. At unramified 2 for ℚ(√−3), 1 has valuation 0 and 2 has valuation 1. | Corrected order-two claim; unit exclusions unchanged. |
| 1.3 CM model | Maximal unit level kills the inertia coset: image 1. A cyclotomic level retaining (ℤ/5ℤ)× instead retains inertia order 4. Inverting reciprocity preserves both image subgroups. | Added conversion; no false smaller-level étaleness. |
| 1.4 Integral family | On ℤ[i], twice a principal alternating form has elementary divisor 2 and polarization degree 2²=4; the identity has degree 1. | Integrality does not mean unimodularity. |
| 1.5 Total reflex pair | Quadratic: degree 2, dimension 1. ℚ(i,√2): orbit sizes 2+2, algebra degree 4 and family dimension 2. d=3: degree 8, dimension 4. Changing ξ to −ξ reverses each sign. | Product algebra and positive polarization retained. |
| 1.6 Total reflex height | d=3 identity overlap: 8 types times 3 divided by 6 gives 4. Replacing 1/6 by 1/8 would give 3. Quadratic coefficient 1/2 on two equal heights gives that height. | Consistent. |
| 2.1 Crystalline representations | Trivial rank-one inertia 1, slope 0. Lubin–Tate unit 2 acts by 3 modulo 5; the unconverted geometric value is 2. | Conversion in Conventions and §1.3 supplies the same local character. |
| 2.2 Kisin comparison | For M=𝔖, φ=1: φ*M/u=W and φ*M/E(u)=O, both rank 1. For rank zero both specializations have rank 0. | Frobenius pullback and actual local polynomial retained. |
| 2.3 Tensor torsor | Identity tensor maps to identity. A scalar 2 sends a pairing value 1 to 4, so its multiplier is 4 rather than 1. | Similitude torus, not an isometry group. |
| 2.4 Bundles and crystals | Elliptic homology rank 2 and Hodge ranks 1,1; its dual exchanges the filtration roles. Zero representation gives ranks 0,0. | Consistent duality; global crystal remains confined to the étale locus. |
| 2.5 Integral actions | On ℂ/ℤ[i], [2] has degree 4 and identity degree 1. The scalar 1/2 sends 1 outside ℤ[i]. | Rational quasi-isogenies are not integral endomorphisms. |
| 2.6 Standard quadratic line | f₁²=1, f_i²=i·(−i)=1, while linear multiplication by i squares to −1. For z=(1,i), B(z,z̄)=4, so the positive metric gives 4. | Consistent semilinearity and metric sign. |
| 2.7 Tautological crystal | At split 5 for ℚ(i), the two local factors each have rank 1, total 2; at inert 3 one quadratic factor has ℚ₃-rank 2. | Factorwise reciprocity, not simultaneous local conjugation. |
| 2.8 Nonsplit criterion | Gaussian elliptic curve: at 5 slopes 0,1, hence not supersingular; at 3 slopes 1/2,1/2, hence supersingular. | Correct distinction between split and nonsplit. |
| 3.1 Determinant | d=1 gives exponent 1; d=3 gives 4. diag(π,1,1,1) has determinant π and length 1. Over k[ε]/ε², determinant ε is nonzero but annihilated by ε. | Cartier assertion uses the regular CM base. |
| 3.2 Partition quotient | Empty part gives 0. For A×A the singleton evaluation kernels sum to the whole module, quotient 0. For ℤ₃[√3] the quotient is C/(2√3), length 1. | Consistent. |
| 3.3 Partition length | In that quadratic example v_C(2√3)=1; half-discriminant valuation is v_C(3)/2=1, within-part sums 0. Both formulas give 1; reversed sign gives −1. | Positive sign retained. |
| 3.4 Conductor functional | Trivial exponent 0; tame quadratic exponent 1. At the first differing digit N in the displayed ℤ_p expansion, the remaining tail is at most (p−1)/(2p−1) of one digit step, strictly less than 1. | Continuous infinite-image functions remain outside the finite-quotient domain. |
| 3.5 Conductor/length | In ℚ₃(√3), e=2, diagonal conductor values 1/2,1/2 and off-diagonal −1/2. Singleton formula gives (2/2)(1/2+1/2)=1; empty partition gives 0. | Agrees with the actual module length. |
| 3.6 Trace volume | r=1: trace-one period has absolute value 2π. Dual determinant contributes −log(2π) per complex embedding and the primal +log(2π); 2d embeddings give 2d·2^(d−1)=2^d d. | Period exponent and metric sign agree. |
| 3.7 Local total reflex | With d=3 and local half-degree 1, the restriction fiber has 2^(3−1)=4 types. d=2 and different valuation 1 give 2^(2−2)·1=1 for the local length. | Consistent multiplicity and valuation normalization. |
| 3.8 Total reflex degree | At d=2, summing the real different over E doubles log D_F, giving degree 2 log D_F=2^(d−1)log D_F. Solving Δ+rω₀−2Ω for the mean gives coefficient 1/4 on ω₀. | Consistent; no second metric shift. |
| 4.1 Auxiliary data | d=1, ξ=−1 gives signature (0,2). A positive sign at all d places gives (2d,0), not (2d−2,2). A local valuation 1 fails the unit condition 0. | Discriminating sign and goodness tests. |
| 4.2 GSpin data | Negative plane z=(1,i): B(z,z̄)=−4, metric 4. Zero modular form gives divisor and Green function 0. Stabilizer order 2 contributes 1/2; a double cover gives 1. | Positivity, nonzero later denominators and stack weights agree. |
| 4.2a Borcherds support | Odd discriminant valuation 1 satisfies p²∤D and error 0; valuation 2 fails that test. Constant coefficient 2 gives weight 2 and constant 2 log(4π exp γ). n=5 gives lattice rank 7; n=3 gives rank 5. | No unsupported low-rank or dyadic vanishing. |
| 4.2b Big-CM degree | f=0 gives numerator 0 and quotient 0, with Λ(0)≠0. Weakly holomorphic f has shadow 0. A double level cover gives 2a/(2d)=a/d. | Formula includes the shadow and weighted denominator. |
| 4.2c Hodge identity | With error 0, −2(ℓ+log Q/2−d log(4π exp γ)/2)−d log(4π exp γ)=−2ℓ−log Q. In ⟨1⟩ the nontrivial dual coset has norm 1/4. Scaling f by 2 multiplies numerator and constant by 2. | Analytic cancellation, denominator cosets and error quotient agree. |
| 4.2d Hodge adapter | For F=ℚ, log D_F=0. At split p=5 with a=(2+i), ξ=−1/5, valuation vector of a is (1,0), while ξO_E has (−1,−1). | Degree comparison uses filtered lines, not equality of full lattices. |
| 4.3 Error in the mean | Formal normalization c=2, degree 3, error degree 24 gives 24/(4·2·3)=1. Doubling f gives 48/(4·4·3)=1; deleting 1/4 gives 4. | Correct coefficient and scaling. |
| 4.4 Good data | For E=ℚ(i), F=ℚ, a=O_E, ξ=−1, ξ Nm(a)d_F is the unit ideal, local valuation 0 at 2 and 3. The sign is negative at the sole real place. | Finite-set goodness includes dyadic primes; the d=1 height endpoint is separate. |
| 4.5 Prime elimination | Clearing denominators in a log 2+b log 3=0 gives 2^m3^n=1; valuations at 2 and 3 give m=0 and n=0. A forbidden norm-1 complement vector paired with coefficient 1 yields obstruction 1, not 0. | Independent primes alone do not remove unsupported vertical error. |
| 4.6 Quadratic endpoint | ℚ(i): ℓ(0)≈0.7831887854. The height formula and gamma expression both give −1.6571065162; adding log 2 would instead give −0.9639593356. | Added exact locator and numerical negative control. |
| 5.1 Component invariance | Identity ideal isogeny has component cokernel lengths 0 and 0; height change 0. At split 5 the two ℚ₅ embeddings are each fixed by the local decomposition group, not exchanged. | Identity case and invalid simultaneous-conjugation model distinguished. |
| 5.2 Height decomposition | In degree two each selected/complementary reflex algebra has rank 1, relative discriminant norm 1. Correction −log(1·1)/(4·2)=0 equals −log D_ℚ/4=0. | Degree-one boundary agrees with the type average. |
| 5.3 Nearby types | g=1,2,3 give (vertices,edges)=(2,1),(4,4),(8,12). Opposite vertices for g=2 differ at four embeddings, not two. | Unordered edge convention is correct. |
| 5.4 Nearby average | Endpoint values 2,4 on a g=1 edge give edge height 3 and total component sum/2=3. For g=2, the edge coefficient 2^(1−2)=1/2 multiplies half the endpoint sum, giving endpoint sum/4. | Factor two agrees. |
| 6.1 Graph datum | Unit different gives torsion 0, graph 0 and identity quotient. On a 3-element torsion group an isomorphism graph has 3 elements, while the product kernel has 9. | Arbitrary multiplication kernels are excluded. |
| 6.2 Torsion comparison | For π²=3, π−π̄=2π=0 modulo the different. For π²=2 the same difference is 2π, of valuation 3, again 0 modulo the different. Contraction thresholds for e=1 and 5 are 2 and 5. | Includes the dyadic case and actual ramification threshold. |
| 6.3 Integral self-duality | Unit different: both projections have image 0, graph kernel 0, Cartier dual 0. Conjugation differs from identity by 2π, which is 0 modulo (2π). | Consistent boundary and conjugation-trivial quotient. |
| 6.4 Nearby identity | Formal component heights 2 and 4 give edge mean 3; the product component height is 6, whose half is 3. An arbitrary unrelated isogeny kernel need not be the required graph of size 3 instead of 9. | Statement remains restricted to the actual graph datum. |
| 6.5 Quaternionic graph | At an unramified quadratic division place δ=1 and quotient length 0. At ramified split quadratic π²=3 the two projection quotients each have length 1 and size 3; their graph has size 3. | Integral-order and graph requirements retained. |
| 7.1 Auxiliary primes | ℚ(i): X²+1 has no root mod 3 or 7, both unramified; |S|=2 gives 1+2=3. g=2,3 give 2+1=3 and 3+0=3. Switching a real place leaves count 2. | Added density supplier, finite-exclusion Check and all dependency occurrences. |
| 7.2 Point height | 6 log 2/3=2 log 2 and 12 log 2/6=2 log 2; unchanged numerator gives log 2. At z=i and 1+i, ‖dz‖=2. Absolute rather than relative denominator with [F:ℚ]=2 gives half the height. | Replaced repeated API assertion by concrete Check. |
| 7.3 Hodge comparison | At z=i, L has norm 2 and L² norm 4, not 2. Opposite-eigenvalue quotient for ℚ₂(√2) has length v(2√2)=3, not 0. | Metric square and ramified determinant input retained. |
| 7.4 Quaternionic bridge | For g=1, F=ℚ and S={3,7}, d_𝔹=21. Substituting h_L=−ℓ+log(21/4)/2 gives h_L/2−log21/4=−ℓ/2−log4/4. | Auxiliary quaternion discriminant cancels. |
| 8.1 Modified intersection | With the same discriminants, i₀/e=ℓ+log(4/21)/2. At e=2 the actual i₀ is 2ℓ+log(4/21), not ℓ+log(4/21)/2. | Unit multiplicity is retained. |
| 8.2 Quaternionic height | Negating the previous value gives −ℓ+log(21/4)/2=h_L. Both expressions add to 0. | Renumbered from §8.3; mathematics unchanged. |
| 9.1 Averaged Colmez | At ℚ(i), the quaternionic bridge yields −ℓ(0)/2−log4/4; subtracting log(2π)/2 gives −1.6571065162, equal to §4.6. | Two routes and the single metric shift agree. |
| 10.1 Relative class number | ℚ(i) and ℚ(√−3) have ratios 1/1=1. At ε=1/8, C=4^(−1/8) gives lower sides 1 and 0.9646786300. At degree 6 the regulator ratio is 4/Q_E, hence 4 or 2. | Native regulator ratio and positive denominator retained. |
| 10.2 Distant isogenies | Gaussian identity degree 1, [2] degree 4, ideal (1+i) degree 2. For class number 1, B=A and minimum 1 meets lower sides 1 and 0.9646786300 above. Multiplication [0] has positive-dimensional kernel and is not finite. | Actual isogeny, dimension and full-endomorphism hypotheses exclude wrong carriers. |
| 10.3 Individual heights | Values (−1,3) have mean 1 and lower bound −1; upper expression 2·1−(−1)=3. Functional equation substitution changes −ℓ(0)/2−log Q/4−g log(2π)/2 into ℓ(1)/2+log Q/4−gγ/2−g log(2π). | Negative lower constants and analytic sign agree. |
| 11.1 Definition field | g=1 bounds 2·3⁴=162 and 4·3⁸=26244. Unit (1+√2)^8=577+408√2 is 1 mod 3, but its norm under CM conjugation is its square, not 1. For [2], g₀=id gives g₀f=[2]. | Polarized descent and transported polarization are necessary. |
| 11.2 Exponents | κ=2, δ=1/16, a=3/16, ε=1/32 give δκ=1/8<3/16<1/4 and εκ=1/16<3/16. | Strict inequalities and choice order agree. |
| 11.3 Primitive orbit | Gaussian j=1728 has coarse degree and orbit cardinality 1; 1≥c4^δ holds for c≤4^(−δ). A field defining the object may have larger degree than 1. | Coarse orbit, not a chosen definition field. |
| 12.1 Center order | For ℤ+2ℤi, J=2 and D=2²·4=16. Center of M₂(E) is E once, of degree [E:ℚ], whereas E×E has twice that degree. | Full order and distinct isotypic factors retained. |
| 12.2 Reciprocity image | Quadratic ℚ(i): class group image size 1, polarized orbit 1, positive real unit/norm obstruction 1≤2. If a norm cokernel has order 2, an image of size 6 can shrink to size 3, matching division by 2. | Bounded loss is retained. |
| 12.3 Compact index | For the conductor-2 Gaussian order, local maximal units modulo 2 have size 2, order units size 1, hence I=2 and J=2. With P=4, J=2≤I·P=8. At p=2, the first accepted exponential depth is 2, not 1. | Order index is distinct from the discriminant identity; no shallow dyadic exponential. |
| 12.4 General reduction | Scalar loss test B=1/2, I=2, P=4, η=1/3 gives B=1/2=(IP)^(−η). Omitting B replaces 1/2 by 1. At I=P=1 the power equals 1. | Bad-prime loss must be absorbed with constants, not discarded. |
| 12.5 General orbit | Gaussian conductor 1: D=4 and j=1728 has orbit 1. Conductor 2: D=16 and j(2i)=287496 has orbit 1. Thus the bounded-range constant must cover 16 as well as 4. | Full center-order invariant is essential. |
| 13.1 Coordinate degree | Safe bounds 2(2g)! equal 4 and 48 for g=1,2. For Z=i, real and imaginary coordinates are 0 and 1 of degree 1. Adjoining i has degree at most 2 over the complex coordinate field. | No false degree-2g bound. |
| 13.2 CM basis | ℤ[i] covolume 1; 2ℤ[i] has index 4 and covolume 4=2^(−1)√4·4. For R=ℤ+2ℤi, 2O_E⊂R⊂O_E and [O_E:R]=2≤2². | Order index and square root of discriminant retained. |
| 13.3 CM reduction | h_m on ℤ[i]: m=1,2,10 give trace determinants 4,16,400 and entry m. On 2ℤ[i], determinant 64, entry 4 and R-span index 1. In ℤ[i], vector 2 gives index 4. For ψ=Im(x̄y), ζ=i, trace Gram is I₂, determinant 1=|Nm i|detψ; ζ=−i gives −I₂. | Added D,N and index bounds; positivity is required even though det(−I₂)=1. |
| 13.4 Lift height | Z=i has H_abs(i)=H_abs(0)=H_abs(1)=1, with D_x=4. All entries satisfy 1≤4^a for a>0, and analytic h₀(i)=1. | Absolute height at zero is 1; analytic size is a different object. |
| 13.5 Bounded degree | At N=1 the two rational CM points j=1728 and 287496 are distinct and satisfy degrees 1,1. Repeating either point arbitrarily often still gives one distinct moduli point. Bounded discriminant gives bounded coordinate degrees and heights, the two Northcott bounds. | Counts points, not multiplicity of parameters. |
| Siegel supplier gap | At Z=2+i, translation ((1,−2),(0,1)) gives i, h₀=√5 and largest entry 2. At Z=i/3, inversion ((0,−1),(1,0)) gives 3i, h₀=3 and largest entry 1. Both determinants are 1. | Precise existential matrix bound; retained original slug. |
| Hermitian supplier gap | m=1 and r=1 above give D=4, entry 1 and index 1. m=10 gives D=400 and entry 10. L=2ℤ[i] gives D=64 and entry 4, index 1. | D measures metric and lattice together; new matching gap only. |
| Polarization supplies D | In R=L=ℤ+2ℤi, ψ=Im(x̄y), ζ=i and N=2, Gram ψ=((0,2),(−2,0)) has determinant 4. Gram q=diag(2,8) has determinant 16=2²·1·4. | New determinant formula includes the N power exactly. |

The repeated uniformizer statements, Artin witnesses, height bridges and period-coordinate consumers were all included in this pass. The independent-vector and determinant arguments above justify the new generality; the finite rows by themselves do not.

# Citations, ownership and acceptance signatures

Read main-branch ComplexTori and Chebotarev as shape comparisons, and the base ComplexMultiplicationAndExplicitReciprocity at its roadmap head. All nine manifest sources have certified legal cached extractions. No new work required fetching and no source is missing. The C key is reused, including its original access metadata. Primary passages for the changes are C lines 297–305, 327–370; PT lines 213–284 and 310–385; Y lines 144–165; and the local level setup A line 1050. No source passage was copied into the package.

Resolved cross-roadmap citations against main or the available heads; the resolver reports no missing roadmap citation or Lean name. Checked supplier section headings against those copies, including the new Chebotarev Layer 9, ShimuraVarieties §§4.1,6.1–6.2, MetaplecticAutomorphicForms Layers 4–7 and GrossZagierAndArithmeticHeights §0a.4. Also checked the unchanged contracted section ranges for ComplexMultiplicationAndExplicitReciprocity, AbelianSchemesAndArithmeticModuli, ArakelovGeometryAndAbelianHeights, AnalyticNumberTheoryPartI, AutomorphicLFunctionsAndLocalFactors, AutomorphicBundles, FiniteFlatGroupsAndIntegralPadicHodgeTheory, NeronModelsAndSemistableAbelianVarieties, ReductiveGroups, ReductiveGroupsPartII, ShimuraData, PELModuli, ClassFieldTheory, IntegralIwasawaTheory, GlobalNumberFields, GeometryOfNumbersAndQuadraticArithmetic, HilbertModularVarietiesAndShimuraCurves, HeightsRationalPointsAndObstructions and DiophantineApproximationAndTranscendence. The two earlier board designs supply the named LT.2 reciprocity and QI.5 geometric isogeny contracts; their absence from `roadmaps show` is not absence of the supplied board design.

Object searches used `roadmaps grep` on main/open heads, the board packages, all 53 specifically supplied sibling folders, and the pinned libraries. The hermitian carrier remains owned by GeometryOfNumbersAndQuadraticArithmetic §2.7, with minima and covolumes in §§0.1–0.3,1.2,1.5. General Siegel reduction and bounded independent vectors are supplier obligations; this package owns the CM polarization-to-size-parameter application. Adelic reduction and p-adic canonical-subgroup results found by the searches do not state this bound. No new generic construction was claimed here and no Lean declaration was added or renamed. Open work outside the provided heads/index was not examined.

Checked the pins from the content manifest: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Native declarations inspected include `Mathlib/NumberTheory/NumberField/CMField.lean` lines 69,141,163,372,438; `Mathlib/NumberTheory/NumberField/ClassNumber.lean` lines 64,69,77; `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean` lines 88,201,231; `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean` lines 95,118,171; and `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean` line 61. The CM class supplies total complexity and quadraticity, not finite degree by itself; NumberField supplies the latter. IsIsogeny supplies finiteness and surjectivity; smooth characteristic-zero isogenies supply flatness mathematically. No matching general hermitian balancing bound was found at the pins. The acceptance statements require substantial class-number and CM-isogeny arguments; they are not immediate library restatements.

Mechanically elaborated a scratch copy of the unchanged acceptance file with `#check @TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII.relative_class_number_growth` and `#check @TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII.distant_cm_isogenies`. Compared both elaborated types with README §§10.1–10.2. Both keep g, g>0, ε, ε>0, Field, NumberField, IsCMField and the degree equation. The second also keeps A, its dimension equation and ι; the existential B,κ and the actual intertwining and all-isogenies conclusions match the README. No binder was lost and no signature changed. Unstatable headlines remain identified with their missing carriers in the module docstring; no Check was added as Lean padding.

# Check outcomes and maintainer notes

- Acceptance elaboration: `lake env lean` on `packages/ComplexMultiplicationAndExplicitReciprocityPartII/Suggested.lean` from the pinned content checkout exited 0. Exactly two warnings: line 49:8 and line 71:8, each “declaration uses `sorry`”. No missing Tau Ceti object file or targeted prerequisite build was needed.
- Explicit signature probe: exited 0, printed both full types, and produced the same two expected sorry warnings.
- Citation resolver after edits: no cross-roadmap citations found nowhere; no Lean names found nowhere. Its library lookup was supplemented by the direct pinned-file inspections above.
- Gap consistency: all nine gaps match the README contract sentences exactly. Comparing the plan before and after with `gaps` excluded gives equality; the diff changes only that top-level list.
- `git diff --check`: exited 0 after removing trailing whitespace on the edited proof-route line.
- No gate failures were supplied in the brief. No tooling, merge-order file, other roadmap or pull-request text was edited. No commit was made.

The required dependency command, on the supplied merge order with `--movable`, exited 0. Complete final output:

```text
depcheck: 55 roadmaps, 633 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The exact output differs from the reviews' earlier graph counts because it reflects the repaired README and supplied order.

GeometryOfNumbersAndQuadraticArithmetic must supply the newly precise balancing gap; its construction was not silently added to this package or asserted to exist elsewhere. The existing Siegel gap keeps its slug but now requests only its matrix bound. Both supplier obligations retain the same earlier owner. Chebotarev adds a main-branch dependency. The only changed section locator consumers may need is §8.3→§8.2; no external use was found and neither Lean name changed. These repairs do not constitute the required fresh independent review.
