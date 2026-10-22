## H01 (CBirkbeck) — applied

The acceptance file replaces twelve catalogue declarations with six geometric headline theorems and three definitions on native schemes: field-extension invariance, one-form/vector-field vanishing, Hodge numbers, Picard finite freeness, Picard-rank bounds and bounded separable rank descent (`TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/Suggested.lean:69`). Congruence torsion-freeness is consumed from the earlier NoncommutativeAndEquivariantIwasawa §0.1, whose uniform-group requirement already includes every odd prime and matrix size, rather than planned twice (`TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:129`, §4.5 at line 600).

## H02 (CBirkbeck) — applied

The module docstring identifies the remaining geometric headlines by README section and names their missing carriers, including intersection numbers, crystalline/étale realizations, relative Picard spaces and polarized moduli (`TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/Suggested.lean:18`). Native sheaf exterior powers and coherent cohomology do permit the actual K3 predicate and Hodge statements, so those headlines are stated rather than incorrectly classified as unavailable.

## H03 (CBirkbeck) — applied

All six computed Lean examples, the rank-zero and unipotent identities, the Wehler evaluation declarations, the Mathieu evaluation declarations and their unneeded definitions are deleted. Their mathematical Checks remain in README §4.5, §5.4 and §6.9 (`TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:600`, line 700 and line 1026); the finite-subgroup reduction consequences remain prose deductions from the supplied general theorem.

## H04 (CBirkbeck) — applied

Own API identifiers and Check labels throughout the README become mathematical prose and section references, while its nine acceptance-test names exactly match the nine declarations (`TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:203`, §2.3–§2.4 and §4.2–§4.6). Interface facts remain separate bullets, and the Wehler pullbacks and Mathieu formula retain their values, hypotheses and source locators.

**Signature audit.** A single scratch copy containing `#check @name` for every final declaration was elaborated through the prescribed targeted build, and each of the nine resulting types was compared with its README statement. No required binder was lost: fields, the specified structure morphism, every K3 hypothesis, finite-dimensionality, separability and the characteristic-zero implication remain; the tangent dual explicitly specifies the base sheaf to preserve arbitrary universes without an option override.

| Declaration | Retained mathematical scope |
| --- | --- |
| differentialForms | Field k, actual scheme X, specified f:X→Spec k, exterior degree p; real native exterior-power body |
| IsK3 | Field k and f; relative smooth dimension 2, properness, geometric integrality, existence of canonical triviality, H¹(O)=0 |
| isK3_fieldExtension_iff | Both fields and their algebra map; equivalence in both directions, with no separability assumption |
| IsK3.noVectorFields | Field, structure morphism and K3 hypothesis; all three vanishings, with the native cotangent dual |
| IsK3.hodgeNumbers | Field, structure morphism, K3 hypothesis, p and q; finite-dimensionality as well as the complete dimension formula |
| geometricPicardRank | Field and structure morphism; actual scheme pullback to AlgebraicClosure k and native line-bundle classes |
| IsK3.picardGroup_finiteFree | Field, structure morphism and K3 hypothesis; both freeness and finite generation over ℤ |
| IsK3.picardRank_bounds | Field, structure morphism and K3 hypothesis; arithmetic/geometric inequalities and the explicit characteristic-zero restriction |
| IsK3.boundedPicardDescent | Field, structure morphism and K3 hypothesis; an intermediate field, finite-dimensionality, separability, degree bound and the rank equality |

**Pinned definitions and sources.** The checked revisions are main `0ed4485`, Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The native exterior power is `SheafOfModules.exteriorPower` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:48`; its body sheafifies sectionwise exterior powers. The native internal-Hom dual is `SheafOfModules.dual` in `TauCeti/Algebra/Category/ModuleCat/Sheaf/TensorProduct/Closed.lean:104`; relative differentials are `AlgebraicGeometry.Scheme.relativeDifferentials` in `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85`. Native coherent cohomology is in `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61`, its base-ring action in `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:46`, and the line-bundle-class carrier in `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50` is the skeleton of invertible sheaves. These definitions do not assert K3 vanishings, finite-dimensionality or Picard finite generation.

The K3 predicate agrees with huybrechts line 133 through line 156, including relative smoothness over imperfect fields. The vanishing input is lang-nygaard line 63, line 76 and line 99, with the dual tangent vanishing also at deligne-lift line 36; the complete Hodge diamond is deligne-lift line 29 and huybrechts line 376. Picard freeness, geometric rank and its bounds are huybrechts line 13945, line 13964, line 13987, line 13994 and line 14001; bounded descent is huybrechts line 14038 through line 14054, with rational Galois descent at line 14011. Sources were read from the supplied legal cached extractions; no additional work was cited and settled waived/uncertified citations were not reopened.

**Ownership and citation audit.** Searches covered main, the twelve supplied open-roadmap directories, indexed open heads and board-package READMEs. The congruence ownership transfer uses NoncommutativeAndEquivariantIwasawa §0.1, including its first-congruence-group Check, and replaces the duplicated local construction and power-depth API. Its uniform predicate explicitly includes torsion-freeness; its dimension is n², with level 4 required at 2. The finite-subgroup reduction deduction remains here and applies also when the subgroup order is divisible by the residue prime. K3Surfaces K0.A separately specifies vanishing over algebraically closed fields of characteristic greater than two; it is absent from the permitted earlier supplier list and merge order. The general theorem over every field, including characteristic two, is owned here, with that narrower statement a specialization; no premise from K3Surfaces is added. ArithmeticDynamics §1.26 concerns canonical heights rather than this geometric construction. No new declaration has a fully qualified name belonging to another roadmap.

The supplier contracts were resolved against main where the roadmap exists there and against the open heads for AlgebraicModuliForArithmeticGeometry, ComplexComparisonPartII, CrystallineCohomology and NoncommutativeAndEquivariantIwasawa. In particular, the relative Picard contracts, crystalline perfectness and `Crystalline.wittCohomology_V_complete` occur at the cited sections. Resolution found no missing cross-roadmap citation or roadmap declaration; the separately checked pinned imports elaborate. No source or supplier beyond the permitted direction was added.

**Adversarial mathematics record.** The following rows record numerical, local algebra and small-object tests; they distinguish the native statements from the plausible wrong models. Formatting-only changes elsewhere preserve the original hypotheses and conclusions.

| Statement | Instances tried | Values on the two sides or competing models | Result | Change |
| --- | --- | --- | --- | --- |
| differentialForms | Rank-two cotangent frame; exterior degrees 0,1,2,3 | Exterior ranks (1,2,1,0); tensor-cube rank 8 rather than 0 | Exterior, not tensor, powers | New native definition |
| Canonical exterior sign | e₁∧e₂ and e₂∧e₁; characteristics 0 and 2 | Coefficients 1 and −1; in characteristic 2, −1=1, while e₁∧e₁=0 | Alternating convention retained at 2 | Three discriminating form Checks |
| IsK3 | Smooth quartic, empty scheme, P², E×E | Quartic: dimension 2, canonical O, h¹=0; empty: geometric integrality false; P²: canonical O(−3); E×E: h¹=2 | Positive and negative models separated | New native predicate |
| IsK3 on nonreduced objects | Fermat quartic in characteristic 2 | Σxᵢ⁴=(Σxᵢ)⁴; all derivatives 0, so smoothness false | Nonreduced model excluded | Predicate retains smoothness |
| Field-extension equivalence | Fermat quartic over 𝔽₃(t)→𝔽₃(t^(1/3)); P² under the same extension | Quartic: dimension 2, h¹=0 and canonical triviality before and after, true↔true; P²: O(−3) before and after, false↔false | Both directions include inseparable extension | Headline added |
| One-form/vector-field vanishing | Geometric Fermat quartic in characteristic 3; E×E | K3 dimensions (h⁰Ω¹,h⁰T,h²T)=(0,0,0); abelian surface (2,2,2), with h¹O=2 | K3 hypothesis excludes the countermodel | Headline added |
| Hodge numbers | (p,q)=(0,0),(1,1),(2,2),(3,0),(0,3) | Dimensions 1,20,1,0,0, matching the formula; E×E instead has h¹¹=4 and h¹⁰=2 | Full formula and outside-range zeros agree | Headline added, finite-dimensionality explicit |
| Hodge Euler sum | All nine positions 0≤p,q≤2 | Nonzero contributions 1+1+20+1+1=24; Ω¹ Euler characteristic 0−20+0=−20 | Signs and indices agree | Native Hodge statement |
| geometricPicardRank | Fermat over ℂ and over 𝔽̄₃; zero module as total-rank control | Geometric ranks 20 and 22; finrank of the zero module 0, so a rank-zero model fails 1≤ρ | Rank is geometric and not h¹¹=20 | New native definition |
| Picard finite freeness | The same Fermat examples | Groups ℤ²⁰ and ℤ²²: free=true, finitely generated=true, torsion subgroup=0 | Both conclusions needed | Headline added |
| Picard-rank inequalities | Fermat over ℂ and over 𝔽̄₃ | 1≤20≤20≤22, with 20≤20 in characteristic 0; 1≤22≤22≤22 in characteristic 3 | The bound 20 cannot be imposed at every characteristic | Headline added |
| Bounded rank descent | Algebraically closed ℂ and 𝔽̄₃; identity subextensions | Degree 1, separable=true, ranks 20=20 and 22=22; B has 231 decimal digits and 1≤B | Quantifier order is ∀X ∃K, with finite/separable conditions present | Headline added |
| Supplied uniform congruence groups | n=0,1,2 at odd residue prime | Uniform dimensions n²=0,1,4; GL_n(𝔽₃) cardinalities 1,2,48 | Rank zero included | Import replaces duplicate ownership |
| First-level dyadic control | −1 in GL₁(ℤ₂); level 4 | Modulo 2: −1↦1 and (−1)²=1; modulo 4: −1↦3≠1 | First-level torsion-freeness fails at 2 | Negative Check retained |
| Finite p-adic reduction injectivity | S₃ permutation matrices and its C₃ subgroup at ℓ=3 | Six distinct matrices remain six mod 3; the C₃ subgroup remains three, although 3 divides its order | No prime-to-order restriction added | Prose consequence of supplier |
| Finite integral reduction injectivity | GL₀(ℤ); {±1}⊂GL₁(ℤ) | One element maps to one; residues 1 and 2 are distinct in 𝔽₃ | Empty rank and nontrivial cyclic case agree | Prose consequence retained |
| Unipotent Check | U=I+3E₁₂, m=0,1,2,3 | E₁₂²=0; upper-right entries 0,3,6,9 equal 3m; none with m>0 vanishes in ℤ₃ | Infinite-order witness agrees | Lean mirror removed |
| RR convention, §1.4 | O and a quartic hyperplane H | 2χ(O)=4=4+0; 2χ(H)=8=4+4 | Integral identity also meaningful in characteristic 2 | Prose retained |
| Contraction convention, §1.4 | σ(e₁,e₂)=1 | e₁↦e₂*, e₂↦−e₁*; σ(e₁,e₁)=σ(e₂,e₂)=0 | Order of arguments and sign fixed | Prose retained |
| Numerical kernel, §1.5 | O and a rational curve C | O²=0 and O=0 in Pic; C²=−2≠0 | Zero class accepted, curve excluded | Identifier removed |
| Quartic polynomial, §1.6 | t=−1,0,1,2,3 | 2t²+2 gives 4,2,4,10,20; χ(O)=2 differs from h⁰(O)=1 | Euler characteristic not replaced by h⁰ | Identifier removed |
| Relative Picard tangent, §2.1 | K3 fibre versus abelian surface | Tangent dimensions h¹O=0 versus 2 | Unramified K3 model excludes positive-dimensional identity component | API in prose |
| Infinite-height kernel, §2.1a | Proposed witness x=0 | d(0)=0 but x≠0 is false; zero never witnesses the asserted nonzero kernel | Nonzero witness requirement preserved | API in prose |
| Closedness, §2.2 | Zero one-form; characteristic-two local exterior algebra | d(0)=0; e₁∧e₁=0 even when −1=1 | No division by 2 introduced | Identifier removed |
| Integral crystalline ranks, §2.4 | Ranks (1,0,22,0,1); hypothetical W/p in degree 2 | Euler sum 24; hypothetical M²[p] has residue dimension 1 but H¹_dR dimension 0 | Torsion summand contradicted by universal coefficients | Coherent headline separated from crystalline theorem |
| Formal deformations, §2.5 | Dual numbers and trivial marking | Tangent dimension 20, obstruction dimension 0; no vector fields gives automorphism tangent 0 | Marked functor distinguished from global groupoid | Identifier removed |
| Pair deformation divisor, §2.6 | L=O; good-degree ample L; L=M^p | Trivial line locus dimension 20 rather than 19; nonzero obstruction cuts 20→19; dR class of M^p is p c₁(M)=0 | Nontriviality and good-degree smoothness restriction retained | Identifier removed |
| Polarized lift, §2.7 | Characteristic 2 and a ramified trait | p=2 is allowed; no assertion ramification index=1 or bad-prime tangent dimension=19 | Lift existence does not imply smoothness of every pair locus | Identifier removed |
| Analytic predicate, §3.1 | Quartic, complex two-torus, empty space | h¹O=0,2,0 respectively; empty has nonempty=false; quartic complex dimension 2, real dimension 4 | Nonemptiness and complex dimension essential | API in prose |
| GAGA comparison, §3.2 | Structure sheaf and rescaled volume form | H¹(O)=0 on both sides; σ↦σ_an implies 2σ↦2σ_an | Degree and scalar conventions agree | Identifier removed |
| Integral Betti theorem, §3.3 | K3 ranks and quartic H | 1−0+22−0+1=24; ∫c₁(H)²=4 | Integral ranks and positive orientation agree | Identifier removed |
| Exponential normalization, §3.3 | exp(2πit), t from 0 to 1 | Logarithmic increment 1; c₁(O(1)) on ℙ¹ has degree +1 | A sign reversal gives −1 and fails | Check label removed |
| Étale ranks and trace, §3.4 | Degree 0 and geometric point class | H⁰ rank 1; trace of degree-one point class in H⁴(2) is 1 | Twist and trace normalization retained | Identifier removed |
| Picard pullback, §4.1 | Identity extension; conjugate skew lines on real Fermat | Identity sends [H]↦[H]; each line has square −2, mutual intersection 0; distinct classes stay distinct | Arithmetic Picard group not identified with all geometric classes | Identifier removed |
| Picard specialization, §4.1 | Constant quartic family | H↦H_s, square 4↦4; rank cannot decrease | Identity and pairing compatibility agree | Identifier removed |
| Picard lattice pairing, §4.2 | Quartic H, rational curve C, zero | (B,Q)=(4,2),(−2,−1),(0,0); each satisfies 2Q=B(x,x) | Bilinear and half-norm conventions distinct | API in prose |
| Arithmetic intersection normalization, §4.2 | Line class on ℙ² over ℝ and ℂ | Squares 1 and 1; projection formula 2·1=2 for pushed complex line | Base change does not multiply pulled-back intersection by degree | Check label removed |
| Cycle-map saturation, §4.4 | Rank-22 map versus multiplication by ℓ on ℤ_ℓ | Saturated equal-rank cokernel 0; multiplication-by-ℓ cokernel ℤ/ℓ has order ℓ | Injection alone insufficient | API in prose |
| Symplectic subgroup, §5.1 | Identity, scalar −1 over ℂ, generator 2σ | Canonical scalars 1,−1; rescaling σ preserves either scalar; (−1)⁻¹=−1 | Actual canonical action, not an unrelated representation | API in prose |
| Polarization stabilizer, §5.2 | Wehler σ₁ with H₁ and H₂ | σ₁*H₁=H₁; σ₁*H₂=4H₁−H₂≠H₂; canonical scalar −1 | Stabilizer and symplectic intersection differ | API in prose |
| Polarized automorphism schemes, §5.3 | Identity and a polarized involution | At least two geometric points can coexist with tangent dimension 0 | Finite étale does not mean trivial | Identifier removed |
| Wehler pairings, §5.4 | S₁,S₂ and Gram G | Both SᵢᵀGSᵢ=G=[[2,4],[4,2]]; det G=−12 | Column convention preserved | Bare matrix definition and value declarations removed |
| Wehler product, §5.4 | f=σ₁∘σ₂ | f*=S₂S₁=[[-1,−4],[4,15]], trace 14, determinant 1; characteristic polynomial t²−14t+1 | Reversed pullback order fixed; eigenvalue 7+4√3>1 | Geometric theorem retained in prose |
| Wehler symplecticity, §5.4 | Deck involutions and their product | Scalars −1,−1, and (−1)(−1)=1 | Infinite symplectic group is compatible with finite-subgroup bounds | Check retained |
| Supersingular discriminant, §6.0 | p=3, σ=1,2; signature (1,21) | Determinants −9,−81; negative sign from 21 negative directions | Signed determinant not discriminant-group order | Identifier removed |
| Artin-invariant endpoints, §6.0 | σ=0 and rescaled σ=11 case | Signature difference 1−21=−20, with remainder 4 modulo 8 | Even unimodular endpoint models impossible | Checks retained |
| Height inequality, §6.0a | h=1,10,11 | 22−2h=20,2,0; h=11 contradicts ρ≥1 | Infinite height cannot be substituted as a natural number | Identifier removed |
| Rank-five pencil, §6.0b | Rank-one Gram [4]; primitive F versus 2F | 4x²=0 forces x=0; F²=(2F)²=0 but coefficients 1 and 2 have different primitivity | Rank and primitive nef conditions distinguish the construction | Identifier removed |
| Infinite-height pencil, §6.0c | Hypothetical rank 21 and the finite-height branch | At h≥1 rank≤20; rank 21 instead forces the pencil and rank 22 | Rank 21 excluded without discarding characteristics 2,3 | Identifier removed |
| Genus-one Jacobian, §6.0c | K3 pencil over ℙ¹ | χ=2, R¹j_*O=O(−2); ω_J=O(−2)⊗O(2)=O | Canonical and Euler comparisons give the actual K3 Jacobian | API in prose |
| Tame quotient, §6.1 | G=1 and involution | Root ranks 0 and 8; determinants 1 and 2⁸=256 | Trivial group and eight A₁ singularities distinguished | Identifier removed |
| Cyclic Euler identity, §6.1a | n=2 with a₂=8; n=4 with a₄=4,a₂=2 | 24=8·3; 72=4·15+2·2·3; order-2 fixed count 4+2·2=8 | Identity and stabilizer multiplicities agree | API in prose |
| Extra cyclic candidates, §6.1a | Orders 11,14,15 | Root ranks 20; determinants 121=11²,196=14²,225=15²; at n=14, 21+96+195=312=24·13 | Euler arithmetic alone does not exclude these | API in prose |
| Tame fixed-point table, §6.2 | Orders 2,7,8 and identity | Counts 8,3,2; identity fixes dimension-2 surface | Nonidentity restriction essential | Identifier removed |
| Wild fixed-divisor inequality, §6.2a | D²=2, d=1 | N=2, N−d−1=0, inequality 0≤2 | Division by N−d−1 invalid | Check retained |
| Wild quotient alternatives, §6.3 | Free characteristic-2 C₂ quotient | e=24/2=12; b₂=12−2=10, rather than 22 | Betti number, not unproved Picard identification | Identifier removed |
| Wild refinements, §6.3a | p=11 and p=13 | 11≤11 is true; 13≤11 false; quasi-elliptic primes 2,3 satisfy the bound | Exceptional p=11 branch and small characteristics retained | API in prose |
| Wild-prime theorem, §6.4 | p=13 | An order divisible by 13 would require 13≤11, false | Every finite subgroup is tame in that characteristic | Identifier removed |
| Rank-22 Picard faithfulness, §6.4a | Identity action and rank-one control | Kernel at rank 22 has order 1; rank-one equality of one polarization does not assert the kernel has order 1 | Rank-22 hypothesis retained | API in prose |
| Étale faithfulness, §6.5 | Identity and free characteristic-2 involution | Identity trace on H² is 22; free involution has invariant rank 10 and trace 2·10−22=−2 | Free involution cannot act identically | Identifier removed |
| Universal finite-subgroup bound, §6.6 | Trivial subgroup and p=3 | Order 1≤B; at p=3 choose ℓ=5 rather than ℓ=3 | Uniform argument keeps an invertible odd residue prime | Identifier removed |
| Tame involution lift, §6.7d | Trace 6 on H², p odd; p=2 control | Invariant rank (22+6)/2=14; tangent 14−2=12; at p=2 the averaging denominator is 0 | Tameness and tangent dimension correct | Identifier removed |
| Involution pencil, §6.7d | Trace 6; integral swap matrix | Anti-invariant rank (22−6)/2=8, plus ample class gives 9; [[0,1],[1,0]]≠I mod 2 | Lifting argument avoids the invalid mod-2 inference | Identifier removed |
| Artin-invariant-one predicate, §6.8 | (p,ρ,disc)=(3,22,−9),(3,22,−81),(3,20,−9) | Predicate true,false,false; σ=1,2, and rank condition false | Both rank and signed discriminant required | API in prose |
| Realized Artin controls, §6.8 | Fermat p=3,7,5 | At p=3,7: (ρ,disc)=(22,−9),(22,−49); at p=5 finite height gives ρ≤20 | Characteristic is read from the field | Checks retained |
| Brauer tangent for tame quotient, §6.8a | Involution local model (x,y)↦(−x,−y) | Generic quotient degree 2, origin fibre dimension 3; coherent trace after pullback is scalar 2 | Finite-flat trace cannot be used at the singular point | API in prose |
| Invariant dimensions, §6.8a | G=1,C₇ and nonabelian group of order 21 | 24; (24+6·3)/7=6; (24+14·6+6·3)/21=6 | Nonabelian average agrees; no spurious transfer assumption | API in prose |
| Mathieu function, §6.9 | n=0,1,2,3,4,5,6,7,8 | Values 0,24,8,6,4,4,2,3,2 | n=0 has no element-order interpretation | Numerical declarations removed |
| Mathieu prime formula, §6.9 | q=2 and q=7 | 24/(2+1)=8 and 24/(7+1)=3 | Prime denominator normalization correct | Evaluation API stays prose |
| Mukai orbit bound, §6.10 | Trivial action, involution, 23-cycle plus fixed letter | Orbit counts 24,8+8=16,1+1=2 | Last model fails the five-orbit condition | Identifier removed |
| Tame exceptional branch, §6.11 | Four-invariant exceptional candidate; characteristic 2 | Orbit count 4 is allowed; tame groups at p=2 have odd order | Universal five-orbit claim not introduced | Identifier removed |
| Primitive class, §7.1 | 0, generator e and 2e in ℤ | 0=2·0 is nonprimitive; e primitive; 2e divisible by 2 | Both definition directions separated | API in prose |
| Primitive saturation, §7.1 | ℤe and ℤ(2e) in ℤ | Quotients 0 and ℤ/2; torsion subgroup orders 1 and 2 | Saturation agrees with primitivity for nonzero vector | API in prose |
| Root loci, §7.2 | Fibre F with F·C=1, 2F and 0 | Squares all 0; intersections with section 1,2,0; primitive constant loci whole base, empty, empty | Square-zero and zero cases not omitted | Identifier removed |
| Polarized family, §7.3 | Actual ample line; zero degree; change of representative | Degree 2d>0 versus 0; L↦L⊗f*N leaves fibre degree 2d | Picard section does not require a global representative | API in prose |
| Ample-power cohomology, §7.4 | d=2, m=0,1,2,3 | χ=2,4,10,20; at m=0, h²(O)=1 | Positive-power restriction essential | Identifier removed |
| Uniform embedding, §7.5 | d=1,2 | Cubic section ranks 11,20; projective dimensions 10,19; polynomials 9t²+2,18t²+2 | Projective dimension is rank minus one | Identifier removed |
| Hilbert K3 locus, §7.6 | Smooth quartic cube versus singular same-polynomial degeneration | Polynomial 18t²+2 on both; smoothness true versus false | Hilbert polynomial alone does not define K3 locus | API in prose |
| Finite-type atlas, §7.7 | Scalar changes of line representative | Section bundle changes by N³; projective scalar [aI]=1 in PGL | Vector bundle need not descend, projectivization does | API in prose |
| Nonsplit atlas control, §7.7 | Quaternion class α of order 2 | 3α=α≠0 | Cubing does not remove the Brauer obstruction | Check retained |
| Polarized stack, §8.1 | Polarized involution | Stabilizer order at least 2; tangent dimension 0 | Stack retains nontrivial finite inertia | API in prose |
| Trait extension, §8.2 | Generic identity between two fixed families | Number of identity extensions 1 | Extending an isomorphism does not assert existence of a smooth limit family | Identifier removed |
| Coarse space, §8.3 | Two forms becoming isomorphic after algebraic closure | Two possible k-isomorphism classes map to one geometric class | Geometric-point bijection does not identify all k-forms | Identifier removed |
| Smooth moduli base, §8.4 | d=1; p=2 and p=3 | Base ℤ[1/2]; 2 is excluded, 3 included; relative dimension 19 | Finite type at 2 does not imply smoothness there | Identifier removed |
| Finite-field finiteness, §8.5 | Fixed q,d and cubic frame | Section rank 9d+2; each object has at least one frame after Br(k)=0 | Finiteness counts forms through the atlas, not just coarse points | Identifier removed |

Commit: `bf90a62` — `K3SurfacesAndSymplecticBoundedness: review repairs (state native K3 headlines and import congruence theory)`. Only the two authorized roadmap files are committed; the worktree is clean and nothing was pushed.

Build: `lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested` exited 0. Exact final outcome: `Build completed successfully (9040 jobs).` Six expected warnings identify the six headline theorems using `sorry`; there are no elaboration errors.

Dependency check output, in full:

```text
depcheck: 13 roadmaps, 100 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The final gate exited 0, with this exact summary:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
