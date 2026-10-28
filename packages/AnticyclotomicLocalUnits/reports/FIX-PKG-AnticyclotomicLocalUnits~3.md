# Repair report: AnticyclotomicLocalUnits

## F01 (P1) — applied

Implicit scheme Riemann–Hurwitz input → explicit SchemeAndStackFoundations §3.2 import in ownership, supplier contracts, §5.5 and Layer 5 dependencies. Specified finite generically étale maps of smooth proper geometrically connected good fibres; retained genus comparison and modular genus/index input. Added Frobenius exclusion and tame-different Checks. Evidence: supplier README §3.2; BKO21 line 590 and line 615.

## F02 (P2) — applied

Repeated one-variable request → the two-variable coordinate, its ring properties, twisting and plus-quotient compatibility relative to the supplied one-variable coordinate. Updated ownership and exact imports from §§1.7, 4.2–4.5; narrowed the same gap’s needs in both files. Added explicit level-zero and generator-change values. Evidence: PadicMeasuresIwasawaAlgebras README §§1.7, 4.3–4.5; Suggested.lean, `TauCeti.Iwasawa.exists_completedCoordinate`.

## F03 (P3) — applied

Three Checks also satisfied by the zero pairing → three arithmetic finite-comparison Checks with compatible nonzero π- and π²-order values, multiplication by π, and unramified coefficient trace. Explained preservation of the primitive base classes in the tower. No Lean padding. Evidence: Rubin87 line 306–317; BKO21 line 516–526; the defining finite pairing is §2.1’s connecting-map/Cartier evaluation pairing.

## Verification and scope

The content repository is main commit `8888d45eea61a0573e32d9b39a00c833f844fc44`, also identified as main by the roadmap service. The installed Mathlib and Tau Ceti commits agree with its manifest: `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read the main PadicMeasuresIwasawaAlgebras, SchemeAndStackFoundations and LocalGaloisGroups roadmaps for their form and ownership.

The new scheme contract is already owned, so it is imported rather than added as a supplier gap or a new generic theorem. Its exact source is `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4673`, §3.2. Its different uses lengths of relative differentials and includes wild multiplicities. The one-variable contract is `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:2627`, §4.5, including inverse continuity and coefficient preservation; its signature is in that roadmap’s Suggested.lean at line 650. Section 1.7’s finite-free coefficient extension and §§4.3–4.4’s ring theory are separate existing inputs. Only the additional two-variable compatibility and properties remain requested.

Pattern search covered the whole README, Suggested.lean and plan. F01 also changes the ownership paragraph and Layer 5 dependency summary; the numerical uses in §§5.6–5.9 and the worked examples remain valid and were recomputed. F02 also changes the ownership paragraph and Layer 0 example; §0.5 already consumes the matching gap. F03’s normalization agrees with the finite comparison in §2.1, inverse twist in §0.4, descended pairing in §2.4 and trace formula in §2.5. No other occurrence requires a changed theorem or sign. The design file’s target records are outside the permitted edits; only its top-level gap needs changed.

Mechanically compared parsed plan objects before and after deleting their top-level gaps lists: they are identical. Among all nine gaps, only `quadratic-coefficient-coordinates.needs` changed. Its wording is identical to the README contract. No names were added to or removed from Suggested.lean; no consumer needs a name migration.

## Citation, ownership and pinned-library audit

Roadmap-service object searches covered scheme ramification and the different, completed coordinates, height-two Coleman/Kummer comparisons and Cartier evaluation, across main and the indexed open roadmap heads. The same objects were searched in the board packages and both pinned libraries. SchemeAndStackFoundations and PadicMeasuresIwasawaAlgebras retain generic ownership. This package retains the arithmetic formal Kummer comparison and its Checks, not another Cartier-duality or coordinate construction.

Cross-roadmap references were resolved again, and their cited sections were inspected in the following copies:

| Roadmap copy | Contracts compared with this README |
|---|---|
| Main: LocalFieldsRamification; ProfiniteArithmetic | Layers 0–3; §1.3, respectively: native local fields, principal groups and continuous p-adic powers |
| Main: PadicMeasuresIwasawaAlgebras | §§1.7, 4.2–4.5, 5.2: coefficient extension, one-variable algebra and module structure, compact limits and Nakayama |
| Main: SchemeAndStackFoundations | §3.2: scheme Riemann–Hurwitz with the different |
| New-roadmap head: IntegralIwasawaTheory | §7.1’s Frobenius-normalized multiplicative interpolation; §7.2 is the named location of the existing norm-control gap, not an assertion that it already states the requested general theorem |
| New-roadmap head: ColemanPowerSeries | Layer 1’s rank-p determinant norm/evaluation refinements |
| Board: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md` | LT.0–LT.2, LT.4–LT.9, including every named field, neighbor and sign comparison |
| Main: ClassFieldTheory | §§2.5–2.6, Layers 5–8: arithmetic reciprocity, ordered finite duality, norm/restriction and local invariant |
| New-roadmap head: ArithmeticGaloisDuality | §§R02.1.2–R02.1.3: inverse limits with lim¹ and actual torsion-coefficient transitions |
| Board: `packages/NonordinaryCMSpecialValues/design/README.md` | NCM.0–NCM.5, including unramified coefficients and scalar-to-tensor comparison |
| New-roadmap head: PadicHodgeRegulators | §§1.4, 1.7: positive ordered adjunction, kernel H¹_g and trace compatibility |
| Main: EllipticCurves | Layers 1, 3–5: isogenies, Frobenius, reduction and twists; extra trace-class assertions remain a gap |
| Main: ModularCurves | Layers 5, 8–9: fine point level, cyclic subgroups and coarse stabilizers |
| New-roadmap head: ModularCurvesPartII | §§3.2, 3.9, 5.2–5.3, 9.9–9.11, 12.1, 13.2, 13.7, 16.6; good models and the weighted mass retain their distinct roles |
| Main: ModularForms | Layer 10B: the modular genus/index formula; this is not the positive-characteristic scheme theorem |
| New-roadmap head: EllipticCurveModularity | R29.5–R29.6: genuine quotient parametrization and unconditional modularity at the conductor |
| Main: ImaginaryQuadraticClassNumber | H1.3, H2.1–H2.3: forms, quadratic characters and class-number constants; additional upper bound remains a gap |
| Board: `packages/InertAnticyclotomicCMMainConjecture/design/README.md` | Explicit ALU imports in its ownership section match the asserted consumer list |
| New-roadmap heads: HeegnerPointEulerSystems; SelmerIwasawaCohomologyPartII | Their scopes do not establish actual use of this package; the README continues to label these uses prospective |

The service has no main/open copy of the three board design packages; they were read at the repository-relative paths above rather than reported missing. Other open-head ownership was searched through the supplied roadmap service; no additional heads were sought outside that index. None of the eight existing additional gaps is silently claimed supplied.

Pinned declarations were opened, not inferred from the resolver. The important carrier boundaries are:

| Pinned file and locator | Evidence and boundary |
|---|---|
| Mathlib/RingTheory/FormalGroup/Basic.lean:56, 74, 126, 184 | FormalGroup, separate commutativity, power-series-valued Point and coefficient map; no specified arithmetic maximal-ideal Lubin–Tate tower |
| Mathlib/RingTheory/PowerSeries/Basic.lean:76, 139; Derivative.lean:49; Inverse.lean:109 | Coefficients, constant coefficient, formal derivative and unit criterion; no analytic torsion-point evaluation supplied by these definitions |
| Mathlib/FieldTheory/Galois/NormalBasis.lean:120, 127 | Normal basis and its Galois action, with finite-dimensional Galois hypotheses |
| Mathlib/RingTheory/LocalRing/Module.lean:299 | Finite flat modules over a commutative local ring are free |
| TauCeti/NumberTheory/LocalField/UnitFiltration/Basic.lean:99, 192 | Congruence-kernel filtration and depth-one principal-unit equality; field, valued topology and nonarchimedean local-field hypotheses retained |
| TauCeti/Topology/Algebra/Group/Profinite/ProP/PadicPow.lean:454, 473 | Module and continuous scalar action on compact totally disconnected abelian pro-p groups |
| TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean:145; Module.lean:344, 387; PowerSeries.lean:350, 409 | Finite-quotient compatible-family carrier; compact-module action; procyclic ℤ_p coordinate and generator change. The carrier itself assumes no compactness of arbitrary coefficients and the coordinate here has coefficients ℤ_p |
| TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/AdicCompletion.lean:273, 292; Range.lean:158; KerReduction.lean:79, 87 | Actual point homomorphism, injection, valuation range and reduction-kernel equivalence; requires the height-one completion realization retained in the supplier gap |
| TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:271, 331 | Finite locally free affine Cartier duality over a commutative ring; not a self-duality assertion for F[π^k] |
| TauCeti/RepresentationTheory/Homological/TateCohomology/LowDegree.lean:151, 284; Periodic.lean, `Rep.FiniteCyclicGroup.periodicIso`; HerbrandQuotient.lean:105, 196, 206, 380 and its finite-kernel/cokernel theorem | Low Tate groups, cyclic periodicity and the exact imported quotient API; multiplicativity retains finite outer degree-minus-one groups and totalization remains distinct from the finite ratio |

No arithmetic Lubin–Tate, anticyclotomic, Coates–Wiles or signed Kummer carrier was found in the pinned source object searches. The generic carriers above do not identify these arithmetic objects. Suggested.lean therefore correctly keeps the headline inventory and its missing-carrier explanations without a replacement theorem.

The legal source extractions used for the repairs were Rubin87 line 286–317 and BKO21 line 514–528, line 543–549, line 590–620. These confirm the actual Kummer comparison and the modular ramification argument. The existing source manifest already records these works. Wiles78 and Kato93 remain settled as uncertified at their recorded locators; neither was requested again. No additional source or missing-reference request was necessary.

## Computed adversarial mathematics pass

Unless specified otherwise, p=5, O is the unramified quadratic integer ring, π=−5, and Λ=O[[T]]. Fractions in pairing rows are classes modulo O; scalar traces land modulo ℤ₅. These are mathematical checks of the roadmap statements, not claims of completed formal proofs. Separate rows distinguish identities and interfaces that need different witnesses.

| Statement | Instances tried | Values on the two sides or competing models | Result; change |
|---|---|---|---|
| Standing prime and characteristic hypotheses | p=2,3,5; equal-characteristic 5; zero ring | 1728 reduces to 0,0,3 respectively; 5=0 in equal characteristic and 1=0 in the zero ring, whereas the stated field has characteristic 0 and 1≠0 | Exclusions retained |
| Coefficient DVR versus field, ramified and nonreduced rings | Φ, O; O[ε]/ε²; residue 𝔽₂ | Φ/5Φ=0 versus O/5O of size 25; ε²=0 with ε≠0 violates being a domain; residue size 2≠25 | Native unramified field/integer-ring scope retained |
| π-adic Tate sign | Levels 0 and 1 | [−5](−w₁)=w₀ versus [−5]w₁=−w₀ | Sign retained |
| Reciprocity direction and inverse twist | Artin unit 2 | Tate factor 1/2; inverse-twist factor 2; product 1 | Sign retained |
| Quadratic directions and field degrees | u∈Γ⁻; n=0,1,2 | u·cuc⁻¹=u·u⁻¹=1; Θ degrees 1,25,625; Ψ degrees 1,5,25; tame degrees 24 and 6 | Distinct towers retained |
| Discrete point topology | Compact group to torsion-free discrete lattice | Finite image has torsion-free finite subgroup {0}; image size 1, cocycle restriction value 0 | Discrete hypothesis retained |
| Abelian and infinite group scope | S₃, trivial Γ; finite level zero | (12)(23)≠(23)(12), so S₃ fails Γ≃ℤ₅²; trivial Γ has rank 0≠2; level-zero quotient has size 1 while infinite Γ retains rank 2 | Excluded models identified |
| Unramified trace pairing | O=ℤ₅[z], z²=2; ramified z²=5 | Gram determinants 2·4=8≡3 and 2·10=20≡0 modulo 5 | Perfectness only in stated unramified case |
| Existing one-variable coordinate | γ; level zero; scalar 3 | γ↦1+T; T↦0 at level zero; C(3)↦3 | Existing supplier imported explicitly |
| Coordinate generator change | a=1,6,5 | Parameters T, 6T+15T²+20T³+15T⁴+6T⁵+T⁶, 5T+10T²+10T³+5T⁴+T⁵; linear coefficients 1,6,5 | First two units, third not; F02 |
| Two-variable coordinate and quotient | S=0; vector (S,T); basis e₁,e₂ | Specialization gives (0,T); O[[S,T]]²/(S)=O[[T]]²; both e₁,e₂ survive | Genuine remaining gap; F02 |
| Twisting the plus relation | σ has untwisted eigenvalue κ(σ) | κ(σ)⁻¹κ(σ)−1=0; untwisted σ−1 instead gives κ(σ)−1 | Compatibility retained in narrowed gap |
| §0.1 conductor definition | Orders 1,5,25 | c=0,2,3; conductor ideals O,25O,125O; first nontrivial order-5 level is 1 | Boundary retained |
| §0.1 parity partition, inversion and embeddings | Same characters and their inverses | Even membership true,true,false; odd false,false,true; intersections empty; inverse order-25 character still has c=3 | Both directions retained |
| §0.2 principal subgroup | 1,1+ϖ, Teichmüller 2 | Residues 1,1,2; first two belong, third does not | Native subgroup retained |
| §0.2 norm inverse limit and additive zero | Identity family; fixed base unit a; pure tensor | N(1)=1; N(a)=a²⁵; N(u⊗b)=N(u)⊗b | Multiplicative coordinate 1 represents additive 0 |
| §0.2 omega projector | ω-vector, different η-vector, zero | (1/24)Σ1=1; Σ(η/ω)=0; e² eigenvalues 1²=1 and 0²=0; e(0)=0 | Correct normalization retained |
| §0.2 constructors, equality and action | Compatible family; difference with every coordinate zero | Reconstructed projection u_n=u_n; all zero coordinates give zero difference; N(gu)=gN(u), eN=Ne termwise | Actual limit API retained |
| §0.3 rank-two freeness | n=0,1 | O-ranks 2·25ⁿ=2,50 agree with free Λ₂² coinvariants | Rank retained |
| §0.3 exceptional tame component | ω and cyclotomic character | Exponents 1 and 6 modulo 24 differ; trivial ℤ₅ norm cokernel projects to 0 on nontrivial ω | Norm hypotheses retained |
| General norm-control contract | Cyclotomic tower; trivial and nontrivial tame components | Z(Φ)/NZ(F′)≃ℤ₅≠0; its trivial component is ℤ₅ and its ω-component is 0; finite ω ranks 2,50 | No unconditional norm-surjectivity claim |
| §0.4 evaluation and its inverse | h(v)=b; −v; 5v | Values b,−b,5b; reconstruction takes v to b; evaluation at 5v misses 1 in O | Basis hypothesis retained |
| §0.4 diagonal action and functoriality | κ(g)=2; scalar maps 2 then 3 | Evaluation of g·h is (1/2)g(b); composition sends b to 6b, identity to b | Inverse action retained |
| §0.5 quotient universal property and equality | Difference Se₁; proposed functional Se₁↦1 | q(Se₁)=0; proposed functional gives 1≠0 and cannot descend | Closed-relation condition retained |
| §0.5 generator independence and action | σ′=σ⁶; κ=1 for coordinate witness | Ratio constant 6κ⁵, hence 6 when κ=1; q(σx)=q(x); commuting Γ⁻ acts on both sides equally | Unit ratio retained |
| §1.1 norm/interpolation definition | Identity family; height-two reduction | Product of 25 values 1 is 1; f(v_n)=1; [π]X mod π=X²⁵ gives scalar rank 25, not 5 | Arithmetic target retained |
| §1.1 multiplication and uniqueness | Families f,g; zero series | (fg)(v_n)=u_n w_n; zero series evaluates to 0≠1 and is not a unit | Required interpolation and norm laws retained |
| §1.1 basis, coordinate and coefficient transport | b=−1; Z=X+X²; embedding ι | f([−1]v′)=f(v); inverse begins −Z+2Z², not −Z; (ιf)(ιv)=ιu | Transport API retained |
| §1.2 derivative definition and denominators | f=1; f=0; base point | 0/(1·λ′)=0; λ′(0)=1; f=0 would divide by 0 and is excluded by f∈O[[X]]× | Nonvanishing retained |
| §1.2 coordinate and basis independence | Coordinate derivative 2; basis −v | (2h)/(2λ′)=h/λ′; (−a)(−h)=ah | Both cancellation factors retained |
| §1.2 linearity, augmentation and trace | f g; r=γ−1,2; next level | (fg)′/(fg)=f′/f+g′/g; δ((γ−1)x)=0; δ(2x)=2δ(x); Tr δ_(n+1)=−5δ_n | Distinct formal trace and LT factors retained |
| §1.3 character sum and covariance | χ(g)=ζ₅; n=0,1 | δχ(gx)=ζ₅⁴δχ(x), not ζ₅δχ(x); factors −1/5 and 1/25 | Inverse-character convention retained |
| §1.3 level and coefficient independence | Next weighted numerator −5A; embedding ι | (−5A)/25=−A/5; ιΣχgA=Σι(χ)ι(gA); value at zero 0 | Exact normalization retained |
| §1.4 trivial factor and descent | δ=1,0; χ trivial on Γ⁺ | δ₁=6/5,0; χ(σ)⁻¹−1=0 | Euler factor and quotient descent retained |
| §1.5 signed kernels and inclusion | ξ* with δ=1; minus point of unit module; zero | δ₁(ξ*)=6/5≠0; minus derivative 0; zero derivative 0 at both parities | Opposite-parity unit convention retained |
| §1.5 finite-free tensor API | W=O²; W=O[ζ₅] | Tensor derivative (δx,δy) vanishes iff both entries do; ζ⊗1−1⊗ζ maps to 0 despite being nonzero before multiplication | Tensor/scalar distinction retained |
| §2.1 Kummer exactness | k=1,2; primitive Q; π^kQ | Base quotient sizes 25,625; Q has nonzero class; π^kQ has zero class | Actual connecting map retained |
| §2.1 torsion transitions | k=1→2 | Q mod π↦πQ mod π², nonzero; reduction of πQ modulo π is 0 | Inclusion and multiplication not interchanged |
| §2.1 field and Cartier comparisons | Degree-5 extension; coefficients 1,3,z | Cor res Q=[5]Q; identity gives Q; traces 2,1,0 modulo 5 | Actual coefficient trace retained |
| §2.2 norm depth | n=0,1,2,3,4 | Identity trace at zero has image depth 1; positive formula gives 1,2,2,3 | No evaluation of n−1 at zero |
| §2.2 limit quantifiers and height restriction | Every fixed finite base and depth a; height-one control | Shrinking images meet in ⋂𝔪^a=0; multiplicative cyclotomic norm cokernel sizes 1,5,25 at finite levels | Extra ramified-base estimate remains a target |
| §2.3 actual finite pairing | Primitive Q; one compatible Cartier/Kummer dual x | Values on Q⊗π⁻¹, Q⊗π⁻² are −1/5,1/25, both nonzero; zero pairing gives 0,0 | F03 replaces nondiscriminating Checks |
| §2.3 base saturation used by the Check | [π]R fixed over Φ; g∈Gal(Θ∞/Φ) | [π](gR−R)=0; absence of tame-fixed π-torsion gives gR−R=0; denominator classes have exact π-annihilator exponents 1 and 2 | Orders justified without a new target |
| §2.3 scalar action and adjunction | Same Q,x; identity extension | (−5)(1/25)=−1/5; (−5)(−1/5)=1=0 modulo O; identity restriction/norm sides both −1/5 | F03 |
| §2.3 trace normalization | Coefficients 1,3 modulo 5 | Tr(1)=2, Tr(3)=6≡1; Tr(1/5)=2/5, Tr(3/5)=6/5≡1/5; identity scalar map gives 1/5,3/5 | F03 distinguishes trace from identity |
| §2.3 equivariance and biduality | Eigenfactors a,a⁻¹; zero/nonzero finite class | Product 1; finite class Q/π detected by −1/5≠0, while zero class evaluates to 0 | Actual pairing, not arbitrary lattice duality |
| §2.4 descent and zero annihilator | σ-eigenvalue κ; nonzero torsion class | κ⁻¹κ−1=0; value π⁻¹≠0 detects the class | Pairing normalization consistent |
| §2.5 trace formula | Adjacent admissible m; k=0; zero point | πA/π^(m+2+k)=A/π^(m+1+k); at m=k=0 both −A/5; y⊗1=0 forces integral trace; zero input gives 0 | Sign and denominator retained |
| §3.1 character logarithm | Base logarithm a; trivial and order-5 χ | λ₁=a=5a/5; Σζ^i a/5=0; covariance factor ζ versus derivative factor ζ⁴ | Direct-character point convention retained |
| §3.2 signed points and constructors | n=0,1,2; nonzero base logarithm | Minus/plus ranks (1,0),(5,0),(5,20); base point has λ₁=a≠0 and fails plus | Same-parity condition retained |
| §3.2 saturation and tensor inclusion | a≠0; comparison 5O⊂O | aλχ=0 implies λχ=0; unsaturated comparison has tensor kernel 5⁻¹O/O of size 25 | Saturation hypothesis retained |
| §3.2 trace and field API | Base logarithm a under degree 5 | Inclusion keeps a; trace gives 5a; zero remains 0 under both maps | Same-sign functoriality retained |
| §3.3 rational Fourier lattice | n=0,1,2 | Orbit dimensions (1),(1,4),(1,4,20); denominators divide 1,5,25 | Rational normal basis not called integral |
| §3.4 signed sum and rank growth | n=2,3,4 | Minus ranks 5,105,105; plus 20,20,520; clearing denominator 25 at n=2 gives integral sum | Both unbounded; no directness inferred here |
| §3.5 finite-level saturation | [π]z fixed; unsaturated model | [π](gz−z)=0⇒gz−z=0; 5O⊂O instead has quotient and tensor defect of size 25 | Native inclusion retained |
| §3.6 annihilator in both signs | Order-25 plus-point component; trivial minus-point component | Plus-unit derivative on former 0, so λχδχ=0; minus-unit δ₁ on latter 0 | Pairing signs consistent |
| §3.7 disjointness/rank | Rank-two V; n=2,3 minus points | Two quotient ranks ≥1 force signed ranks ≤1; coranks 5→105 contradict finite O-corank | Positive-rank route retained |
| §4.1 auxiliary discriminants and classes | D=−7,−15,−31 | Reduced forms (1,1,2); (1,1,4),(2,1,2); (1,1,8),(2,−1,4),(2,1,4); counts 1,2,3 | Complete worked forms recomputed |
| §4.1 small-prime splitting/inertness | p=5,7,11,13,17,19,23,29,31,37,41,43,47 | Chosen D≡1 mod 8; Euler values D^((p−1)/2) mod p=4,6,10,12,16,18,22,28,30,36,40,42,46, each −1; chosen h never divisible by p | All small primes included |
| §4.1 large-prime upper bound | p=47,53 | Upper expressions 48.9434676>47 and 52.7611868<53; logarithmic derivative of ratio is −log(8p)/(2p(2+log(8p)))<0 | Threshold 53 retained |
| §4.2 CM projection | Exact order l; [1],[g],[h]; zero class | Conductor l²; values 1,ν(g),1; tame average 1/24 versus 1/6; zero projects to 0 | Projection order and actions retained |
| §4.3 dual-exponential comparison | n=0,1; trivial representation | Coefficients −1/5,1/25; normalized exp*(log χ_cyc)=1 | Positive ordered normalization retained |
| §4.4 CM values and signs | χ=1, order 5, order 25 | Euler factor 1−(−5)/25=6/5; signs +,+,−; last central value 0 | Same factor as §§1.4,8.3 |
| §4.4 tensor descent | Unramified W versus W=O[ζ₅] | Disjoint unramified/totally ramified fields give injective tensor multiplication; ramified test kills nonzero ζ⊗1−1⊗ζ | NCM.5 hypotheses retained |
| §4.5 unit-coordinate argument | All basis derivatives in 5O; a unit derivative | Sum lies in 5W and has valuation ≥1; unit has valuation 0 | At least one actual coordinate is a unit |
| §5.1 trace-zero curves | j=0 at p=5,11; j=1728 at p=7 | Counts 6,12,8; (p+1)−count=0 in each case | Small-prime curves recomputed |
| §5.2 good-prime separability | t+t² and t⁵ in characteristic 5 | Derivatives at 0 are 1 and 0; good optimal Manin valuation 0 | Separable good reduction retained |
| §5.3 scalar Frobenius and descent | Traces ±10; subgroup orders 6,7 | Scalars ±5 give counts 16,36; −5≡1 mod 6 and 2 mod 7 | Subgroup stability differs from fixing points |
| §5.4 mass | p=5,7,47 | Masses 1/3,1/2,23/6 equal (p−1)/12; integer relations 4=4,6=6,46=36+4+6 | Weighted ownership retained |
| §5.4 trace-class counts | p=5,7,47 | (N(2p),N(p),N(0))=(1,2,0),(1,0,2),(5,2,2); same for negative traces | Twists not conflated with geometric invariants |
| §5.5 imported scheme formula | Genus-one target, map of degree d | d(2·1−2)=0, hence deg different=2g_N−2 | F01 supplies missing theorem |
| §5.5 numerical bounds | N=27,32; identity on genus one | μ=36,48; deg different=0≤6,8; identity different 0 | F01; original numerical values unchanged |
| §5.5 hypotheses and different | Relative Frobenius in characteristic 5; tame t↦t² | Frobenius degree 5 and differential 0, excluded; tame different order ord(2t)=1=e−1 | F01 boundary Check |
| §5.6 generic count | p=5,13,23,29,47 | m=0,1,1,2,3 gives 0,μ,μ,2μ,3μ; latter four exceed μ/6; weaker expression at 47 is 0 | Consumers of bound recomputed |
| §5.7 exceptional fibres | (p,N)=(5,27),(7,32); p=13 | 36/3=12>6; 48/2=24>8; at 13 both exceptional indicators 0 | Consumers of bound recomputed |
| §5.8 fine-level lift | p=5,7 | M=6,8; φ(M)=2,4; −p≡1 mod M; Mφ(M)=12,32 prime to respective p | Fine-level/tame hypotheses retained |
| §5.9 primitive modular formal point | λ(Q)=5u; multipliers 36,5 | Valuation 1 stays 1 under 36≡1 mod 5 and rises to 2 under 5; differentials 1 versus 0 modulo 5 | Unit scaling and Honda sign retained |
| §6.1 quasi-canonical modular images | s=0,1,2 | Field degrees 1,6,30; at s=2 quotient-unit size (24·25)/(4·5)=30; C₀=0, x₀=Q | Zero level separate |
| §6.2 tame trace | s=0,1,2 | Primed degrees 6,30,150 divided by 6 give 1,5,25; y=6Q primitive while y₀=0 | Shift and tame group retained |
| §6.3 lattice/Hecke correspondence | s=1, 𝔽₅² | Five distinct lines (1,a) and inward (0,1); determinant b−a≠0 for distinct a,b; removing θ leaves one line | Actual p+1 orbit retained |
| §6.4 optimal traces | First and second wild steps | Tr y₁=−6Q, Tr y₂=−y₀=0; y₀=0 | Initial −y is not −y₀ |
| §6.5 parity and total trace | n=1,3,5; y₂ | Total traces −y,5y,−25y; total trace of y₂ is 0 | Sign recurrence retained |
| Imported Herbrand totalization | Zero module; trivial group; infinite trivial 𝔽₅-vector space under C₅ | First two ratios 1/1=1; infinite defining Tate groups have Nat.card 0, giving totalized 0/0=0 | Finite-ratio hypotheses retained |
| Imported cyclic restriction | Trivial ℤ-module for S₃ and C₅ | S₃ has low Tate ratio 6 but H²/H¹ cardinal ratio 2; for C₅ both are 5 | Periodicity requires cyclicity |
| Imported multiplicativity/invariance | 0→5O→O→O/5O→0, trivial C₅ action | h(5O)=25, h(O)=25, h(O/5O)=25/25=1; 25=25·1 | Finite outer Tate groups retained |
| §7.1 minus Herbrand quotient | Odd n=1,3,5 | 1; 5⁴·5⁻²=25; 5⁸·5⁻⁴=625, agreeing with 5^(n−1) | Residue degree two retained |
| §7.2 cohomology vanishing | n=3; primitive and nonprimitive y | Primitive norm contains 5Oy, so Tate-zero size ≤25; h=25 forces H¹ size 1; y=5y′ would only give bound 625 | Primitivity used at correct stage |
| §7.3 divisible invariants | Base lattice 5O; k=1,2 | Base divisible module has π^k-torsion sizes 25,625; map induced by unsaturated 5O⊂O instead has kernel size 25 | Actual base-point inclusion retained |
| §7.4 quotient/kernel freeness | Rank-one quotient; torsion control Λ/(T) | Both have residual dimension 1 and 25 residual elements; Λ-ranks 1 and 0 differ | Positive-rank assumption retained |
| §8.1 augmentation generation | f=1+5T,5+T,T | Constants 1,5,0; unit statuses true,false,false; coefficient-of-T sends T to 1 but augmentation to 0 | Actual derivative must be augmentation-linear |
| §8.2 integral decomposition | Signed basis; columns e₁,e₁+5e₂ | Determinants 1,5; cokernels 0,Λ/5Λ; latter has independent 1,T and quotient by T of size 25 | Infinite power-series cokernel retained |
| §8.3 all-character nonvanishing | χ=1 and order 25 | Optimal unit gives δ₁=6δ/5≠0; order-25 orbit has dimension 25−5=20 and a sufficiently divided nonzero class | Actual pairing detects both cases |
| §8.4 signed generators | χ=1, order 25; v₊→−v₊ | Trivial plus valuation 0, minus value 0; order-25 plus value 0, minus nonzero; sign change negates value and preserves valuation | Matching-parity conclusion retained |
| §8.5 finite signed Kummer images | n=0,2; identity and degree-5 trace | Base plus corank 0, minus 1; at n=2 coranks 20+5=25; primitive Q/π≠0; trace logarithm 5a, not −5a | Export agrees with revised pairing witness |
| Worked examples across layers | p=5,N=27; p=7,N=32; p=47 | (μ,fibre,different bound,M,multiplier)=(36,12,6,6,36),(48,24,8,8,64); at 47 mass 46=36+4+6 and generic count 3μ>μ/6 | Recomputed; no consumer change |

The changed finite-pairing Check is conditional on a primitive generator, not a new primitive modular-point existence theorem. Its normalization is obtained through the existing actual finite comparison. Since the base lattice stays saturated in the tame-fixed tower, its class with denominator π² remains nonzero; perfectness extends the finite dual coordinate to the compact unit dual. This neither assumes the signed decomposition nor adds a dependency from Layer 2 to Layer 5. The coefficient-trace witness agrees with §2.1 and the ClassFieldTheory contract; it does not use an identity identification of O/5O with ℤ/5ℤ.

## Exact check outcomes

- `lake env lean` on `packages/AnticyclotomicLocalUnits/Suggested.lean`, from the content repository: exit 0, no output, no warnings. No TauCeti import or missing object file requires a targeted build. No Lean process remains running.
- Mechanical declaration/binder audit: zero theorem, def, abbrev, instance, opaque, structure or class declarations. Thus the list for the scratch `#check @name` comparison is empty, and no hypotheses can disappear from declaration signatures. The single import is `import Mathlib`; zero `set_option` occurrences. Suggested.lean is unchanged and its module docstring inventories the missing arithmetic carriers.
- Required dependency direction command, with `--movable`: exit 0; exact output:

```text
depcheck: 51 roadmaps, 589 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line for this package.

- Roadmap citation resolver: exit 0. Cross-roadmap citations found nowhere: None. Lean names found nowhere: None. Its separate warning says it did not inspect external Lean names because its own host has no pinned Lake packages; the pinned-source inspection above supplies that check.
- `git diff --check`: exit 0, no output.
- Parsed-plan scope check: all non-gap content identical; only the coordinate gap’s needs changed; nine gaps retained. README/plan coordinate-contract strings equal.
- No gate failures were listed in the brief. No source manifest, metadata, tooling, merge order, other package or pull-request text changed. Changes are confined to this README, the allowed plan gap and this report. No commit was made.

## Maintainer consequences

The existing SchemeAndStackFoundations dependency is now explicit at the point of use. PadicMeasuresIwasawaAlgebras is asked only for the additional two-variable compatibility, with no new slug. All three findings are settled in this package; none requires a human scope or merge-order decision. No declaration names or headline theorems changed, and no other roadmap requires an edit for these repairs. Independent review remains the acceptance step.
