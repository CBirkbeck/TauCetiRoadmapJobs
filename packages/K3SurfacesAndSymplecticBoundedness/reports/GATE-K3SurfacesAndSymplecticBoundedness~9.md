## H01 (CBirkbeck) — answered

The shared genus-one carrier, geometric Kodaira realization, canonical/Hodge formulas, quasi-elliptic Picard completion and regular Jacobian are still independently constructed in `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md` §§2.1, 2.3/2.5, 4.1–4.2 and 4.16–4.17 at e974688, without a reference to K3SurfacesAndSymplecticBoundedness, confirming the overlap with `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:735`–829. The proper-base restriction at lines 752–764 and export boundary at line 1385 already preserve the same morphism, schematic fibres and localized model; replacing the companion’s shared constructions with these imports remains necessary and unapplied because the companion is outside this job’s editable files, so this finding remains open.

## H02 (CBirkbeck) — answered

The live description at head 8bc8863 still omits direct supplier K3Surfaces (43784f8, by kim-em) and transitive suppliers IndexTheory (819f43f), TopologicalSheafCohomology (f06755a) and CharacteristicClasses (d077cb4), contradicting the explicit prerequisite chains in `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:70`–74 and 184–186; all four are new open roadmaps absent from both active and completed directories on main fe540017. The description’s direct-supplier authorship and blanket consumer claims, its displayed merge order and the integration-order file remain unchanged because this job forbids those edits; the verified minimum corrections below are outstanding, and this finding remains open.

---

**Outstanding integration changes, not completed repairs.**

| Companion sections | Required replacement at the shared geometric domain |
| --- | --- |
| §2.1 | Import §6.0b’s carrier with its proper-base restriction, relative-minimality predicate, full fibres, localization and field-change laws. |
| §§2.3 and 2.5 | Import §6.0b’s geometric realization and classification using EllipticCurves Layer 4’s existing ReductionSymbol. |
| §§4.1–4.2 | Import §6.0b’s canonical formula, intrinsic Hodge quotient, wild torsion and degree formula. |
| Shared portion of §4.16 | Import the characteristic restriction and twisted-additive generic Picard group with regular completion. |
| Shared portion of §4.17 | Import the regular minimal Jacobian and distinguished zero section on the curve-base domain. |

The common prefix ends before “Rank-five K3 pencils” at line 831. Its dependencies at lines 742, 758, 768, 782, 799 and 819 contain no K3-specific premise; §§1.5 and 4.2 enter its K3 specialization at line 817, not the generic restriction or determinant law. The companion retains its additional excellent-DVR, characteristic-two, arithmetic and rational-surface results. No reciprocal supplier edge or new local ownership transfer was introduced.

| Minimum prerequisite correction | Verified edge and locator |
| --- | --- |
| Direct: K3Surfaces | Conventions, K0, K0.A and K1–K2 → this roadmap’s §1.3 and complex/Betti applications; K3Surfaces 43784f8, Conventions and K0–K2. |
| Transitive: IndexTheory | I7.3 → K3Surfaces K1 → K2 → the consumed complex/Betti package; K3Surfaces README line 52 and IndexTheory I7 item 3, lines 750–756. |
| Transitive: TopologicalSheafCohomology | TS3.1–TS3.3 and TS3.7 → ComplexComparisonPartII C6.1 → C6.3/C6.6 → §3.1 here; ComplexComparisonPartII 2d50a88, lines 4086–4113, 4208 and 4375. |
| Transitive: CharacteristicClasses | C1.2/S0–S5 on the stated support and CW domains → the same C6.1 → C6.3/C6.6 route; the same comparison locators and CharacteristicClasses d077cb4, C1.2/C1.2a. |
| Preserved direct prefix: NoncommutativeAndEquivariantIwasawa | §0.1’s odd-prime first-congruence torsion-freeness → §4.5 → §§4.6 and 6.6; supplier 3ec4ff3, lines 145–165. No later Iwasawa arithmetic is a premise. |

These are stage-level ordering constraints and a verified minimum list, not a certification of every supplier’s complete transitive closure. The four omitted roadmaps are also absent from the inspected integration-order file; the passing local dependency check below does not perform these outstanding integration changes.

**Source and ownership evidence.**

The common carrier and localization agree with enriques-one line 17390 and line 17424 (§4.1, pp.361–362); the canonical formula with its torsion term is Theorem 4.1.6, enriques-one line 17528. The Jacobian and section are Proposition 4.3.1, enriques-one line 18320; the Jacobian canonical formula is Proposition 4.3.7, enriques-one line 18462; the Euler and nonmultiple-fibre comparisons are Proposition 4.3.14 and Theorem 4.3.20, enriques-one line 18646 and line 18799. These locators support the existing common interface rather than a K3-only substitute.

Ownership searches covered main fe540017, the supplied sibling checkouts, the indexed open roadmap heads and the board’s EnriquesSurfacesAndIntegralNonexistence package at 9db3d35. The companion overlap is confirmed; the board’s Enriques package also refers to the shared interface, so this report does not claim that downstream citations have all been reconciled. No new construction or Lean name was introduced. The citation resolver found no unresolved cross-roadmap citation; the planned Crystalline.wittCohomology_V_complete is present in CrystallineCohomology CR.4.7, line 6583, and the five other names flagged in the supplied citation list are this roadmap’s own theorems.

The library check used Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the manifest. At the Mathlib pin, IsProper extends separatedness, universal closedness and local finite type (`Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41`); its composition and base-change instances are at lines 57 and 71. Tau Ceti’s native model records a scheme, structure map, flatness, finite presentation and a specified generic-fibre isomorphism (`TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44`); properness is separate at line 72, and regularity, minimality and generic smoothness are not fields. Its finite-DVR-extension comparison is `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/BaseChange.lean:103`; it does not assert arbitrary constant-field base change on its own.

No new source was cited or requested. The existing waived Rudakov–Shafarevich, Matsusaka–Mumford and Nygaard vector-field citations, and uncertified Shioda-transcendental and Arapura citations, retain their settled status; their full proofs were not independently recertified here.

**Elaborated-signature comparison.**

One scratch file imported the built module and elaborated `#check @name` for every actual declaration, successfully, with no lost binders or README/Lean mismatch; no signature needed changing. There are nine declarations (three definitions and six theorems): the supplied transcript’s tenth entry, “group”, came from “class group” in a docstring and is not a Lean declaration.

| Declaration in TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness | README locator | Elaborated domain and conclusion |
| --- | --- | --- |
| differentialForms | §1.1, line 228 | Field k, native X and its structure map, exterior degree p; sheaf exterior power. |
| IsK3 | §1.1, line 226 | Field k and structure map; all five geometric/cohomological conditions. |
| isK3_fieldExtension_iff | §1.2, line 255 | Both fields and Algebra k K retained; iff on the actual pullback. |
| IsK3.noVectorFields | §2.3, line 396 | IsK3 hypothesis retained; the three specified cohomology spaces are subsingletons. |
| IsK3.hodgeNumbers | §2.4, line 410 | IsK3, p, q and the base scalar action retained; finite-dimensionality plus the exact diamond. |
| geometricPicardRank | §4.3, line 545 | Rank of native line-bundle classes on base change to AlgebraicClosure k. |
| IsK3.picardGroup_finiteFree | §4.2, line 520 | IsK3 retained; integral freeness and finite generation of native Pic(X). |
| IsK3.picardRank_bounds | §4.4, line 567 | IsK3 retained; positive arithmetic rank, geometric bound 22, and characteristic-zero bound 20. |
| IsK3.boundedPicardDescent | §4.6, line 596 | IsK3 retained; finite separable intermediate field of bounded degree with rank equality. |

**Adversarial mathematics record.**

The computations below test the unchanged definitions, conventions, supplier interfaces and headline targets. They are boundary and consistency checks, not proofs of the admitted theorems or independent certification of waived/uncertified texts. No mathematical statement was added or changed.

| Statement | Instances tried | Computed values on the two sides or negative control | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: universes and fields | Empty scheme; zero ring; field identity | Empty: geometric integrality false; zero ring: Field unavailable; identity base change: X→X | Boundaries explicit | None |
| Conventions: intersection, half-norm and sign | Quartic H; rational curve C | B(H,H)=4=2·2; B(C,C)=−2=2·(−1); rank-22 signature gives (−1)^21=−1 | Normalizations agree | None |
| Conventions: Tate twist and trace | Quartic H; geometric point | tr(c₁(H)²)=4=H²; point trace=1 | Positive trace retained | None |
| Conventions: contraction and composition | σ(e₁,e₂)=1; f∘g | e₁↦e₂*, e₂↦−e₁*; det=1; (f∘g)*=g*f* | Inverse pullback has correct order | None |
| Conventions: tameness and Mathieu action | Identity; involution; characteristic two | χ(1)=24; χ(g₂)=8; tame group order at p=2 is odd | Identity excluded from finite fixed-set table | None |
| Conventions: polarization degree | d=1,2 | L²=2,4; h⁰(L³)=11,20; projective dimensions=10,19 | Degree positive | None |
| Supplier projectivity | Smooth quartic; regular surface over imperfect field | Quartic dimension=3−1=2; Fermat in p=2 has differential 0 | Relative smoothness retained | None |
| Supplier tame deformation | C₂ at p=3 versus p=2 | 1/2=2 in F₃; 2=0 in F₂ | No averaging in wild characteristic | None |
| Supplier complete intersections | (1,1),(2,2); bidegree (2,0) | 4−2=2-dimensional Wehler surface; V(x₀x₁) has 2 disjoint components | Ampleness and dimension conditions retained | None |
| Supplier numerical base change | Real line and its complex pullback | H²=1 over both fields; pushforward complex line=2H, giving 2·1=H·2H | Residue-weighted projection formula | None |
| Supplier quotient resolution | Trivial group; tame C₂ | Quotient by 1=X; local A₁ matrix=[−2], determinant magnitude=2 | No wild coherent vanishing inserted | None |
| Supplier quotient transcendental comparison | G=1; rational quotient | T²(X)^1=T²(X); rational resolution has T²=0 | Rational coefficients retained | None |
| Supplier birational two-forms | Ruled surface; K3 | H⁰(P¹,O(−2))=0; h⁰(K3,ω)=1 | Non-ruledness has witness | None |
| Supplier polarized trait extension | Identity isomorphism | Identity extends to identity; number of prescribed extensions=1 | Extension concerns given families | None |
| Supplier unirational cohomology | Rational surface P²; K3 rank calculation | b₂(P²)=ρ(P²)=1; K3: c₂−2=24−2=22 | No characteristic restriction added | None |
| Supplier adjoint positivity | 2L and 3L with L²=2 | (2L)²=8; (3L)²=18; impossible obstruction square=1 is odd | Full separation hypotheses retained | None |
| Supplier polarized scheme descent | Disjoint union of Pⁿ; Picard section | Embedding dimensions n are unbounded; a scalar ambiguity acts as identity on projectivization | Local/global projectivity distinguished | None |
| Supplier formal algebraization | O(1) at successive levels; O(1),O(2) | Restriction degree 1=1; incompatible pair has 1≠2 | Actual compatible line sheaves required | None |
| Supplier congruence torsion | Rank 0; −1 at primes 3 and 2 | GL₀ order=1; −1 mod 3=2≠1; −1 mod 2=1 with order 2 | Odd-prime domain retained | None |
| Supplier rational torsor descent | C₂ with rational versus integral 2-adic coefficients | Averaging scalar=1/2 in Q₂; 1/2 is not in Z₂ | No integral invariants equality | None |
| Supplier exponential Chern class | Positive loop exp(2πit) | Logarithmic increment=1−0=+1; degree O(1)=+1 | Integral normalization retained | None |
| Supplier Witt/formal Brauer operations | Additive group; finite height h=1 | [p] on additive formal group=0; finite-height p-series is nonzero, Dieudonné rank=1 | No infinite height used as integer | None |
| Supplier supersingular parity | σ=0,11; signature (1,21) | Signature difference=−20≡4 mod 8, so even unimodular candidates fail | Dyadic parity input retained | None |
| Supplier cross-realization | Finite-order versus unipotent action | [[1,1],[0,1]] has characteristic polynomial (T−1)² but differs from I | Finite-order semisimplicity retained | None |
| Supplier finite linear groups | A₄ versus binary tetrahedral group | A₄ has 3 involutions; SL₂(C) has only one nonidentity involution; binary group order=24 | Binary classification retained | None |
| Supplier Mathieu permutation model | Orders 1,2; M₂₃ order | Fixed letters=24,8; 2⁷·3²·5·7·11·23=10200960; 24 times this=244823040 | Fixed letter retained | None |
| Supplier quaternion/recognition domain | Trivial group; order-23 cycle | Trivial group has 24 invariants; 23-cycle plus fixed point has 2 orbits<5 | Recognition hypotheses not replaced by order | None |
| §1.1 differentialForms | Rank-two free cotangent frame, p=0,1,2,3 | Exterior ranks=1,2,1,0; tensor-cube rank=8 | Ordinary definition; no change | None |
| §1.1 IsK3 | Smooth quartic; E×E; P²; empty scheme | Quartic h¹=0 and canonical degree=0; E×E h¹=2; P² canonical=−3H; empty fails integrality | Five conditions distinguish intended surface | None |
| §1.2 field/isomorphism invariance | Identity; purely inseparable extension; canonical rescaling | Identity fixes X; h¹=0 tensors to 0; nonzero scalar times σ stays nonzero | Both directions retain proper base-change descent | None |
| §1.3 projectivity and specialization adapter | Quartic over C; σ↦2σ | Hyperplane square=4 before and after adapter; contraction values double to 2e₂*,−2e₁* | Underlying structure map fixed | None |
| §1.4 coherent invariants and RR | O; quartic H | 2χ(O)=4=4+0; 2χ(H)=8=4+4 | Integer identity includes p=2 | None |
| §1.4 contraction | σ=1; σ=0; characteristic two | Matrix [[0,−1],[1,0]] has determinant 1; zero form gives determinant 0; in p=2 determinant still 1 | Nonzero form is an input | None |
| §1.5 numerical and torsion kernel | O; rational curve; hypothetical nontrivial numerical-zero L | O square=0; C square=−2; nontrivial L would give χ≤0 and χ=2 | Kernel argument excludes torsion including p-torsion | None |
| §1.6 quartic construction | t=0,1,−1; Fermat in p=2 | χ=2,4,4; Fermat polynomial=(Σxᵢ)⁴ and all partials=0 in p=2 | Nonreduced case excluded by smoothness | None |
| §2.1 relative Picard representative | Identity component; rank-jumping family; actual line class | Tangent dimension=h¹(O)=0; zero component dimension=0; obstruction to representing section can be nonzero | Unramified does not assert relative étaleness | None |
| §2.1a Witt kernel theorem | Nonzero x; zero x | d(0)=0 gives no contradiction; x≠0 and injectivity force x=0, contradiction | Nonzero witness retained; waived lemma not reproved | None |
| §2.2 closedness | Zero form; infinite-height Witt-kernel argument | d(0)=0; dx=0 forces x∈∩Vⁿ=0 under assumed nonzero d on H²(O) | No division by 2 | None |
| §2.3 IsK3.noVectorFields | K3; abelian surface | K3 dimensions H⁰(Ω¹),H⁰(T),H²(T)=0,0,0; abelian surface h⁰(T)=2 | K3 hypothesis excludes negative control | None |
| §2.4 IsK3.hodgeNumbers | (p,q)=(0,0),(1,1),(2,2),(3,0) | Dimensions=1,20,1,0; Euler sum=24; χ(Ω¹)=0−20+0=−20 | Finite-dimensionality explicit | None |
| §2.4 integral crystalline freeness | Potential W/p in M⁰ or M² | dim M⁰[p] would be≥1 although H⁻¹_dR=0; dim M²[p] would be≥1 although H¹_dR=0 | Endpoint −1 prevents hidden degree-zero torsion | None |
| §2.5 formal deformation space | Dual numbers; marked versus unmarked object | Tangent dimension=20; automorphism tangent=0; obstruction dimension=0 | Marking is required for prorepresentation | None |
| §2.6 line deformation divisor | O; nontrivial ample L; L=M^p | Trivial class locus dimension=20; nonzero obstruction cuts 20−1=19; c₁,dR(M^p)=p c₁,dR(M)=0 | Integral normalization retained | None |
| §2.7 polarized lift | Compatible O(1) tower; closed-fibre-only lift | Degrees 1=1 at levels 0,1; R/(π) has π·1=0 and fails flatness at next level | Smooth tower and algebraization required | None |
| §3.1 integral étale invariants | ℓ≠p; quartic; point class | Ranks=1,0,22,0,1; Euler=24; H square=4; point trace=1 | Twists and invertible-prime condition retained | None |
| §4.1 Picard pullback and descent | Identity; real Fermat conjugate lines | Identity class↦same class; each conjugate line square=−2, mutual intersection=0, so classes differ | No integral fixed-class descent assumption | None |
| §4.1 specialization | Constant quartic family | H_generic²=4=H_special²; zero class specializes to zero | Injectivity does not assert surjectivity | None |
| §4.2 IsK3.picardGroup_finiteFree and lattice | Quartic rank-one class; rational curve | Gram [4] determinant=4; B(C,C)=−2, Q(C)=−1; O pairs to 0 | Native class carrier; nondegeneracy supplied geometrically | None |
| §4.3 geometricPicardRank | Algebraically closed base; real Fermat | Closed-base arithmetic rank=geometric rank; real Fermat geometric rank=20, nontrivial conjugation gives arithmetic rank<20 | Closure versus arithmetic rank distinguished | None |
| §4.4 IsK3.picardRank_bounds | Rank 1; characteristic-p rank 22 | 1≤1≤20≤22 in characteristic-zero rank-one case; rank 22 allowed in positive characteristic | Characteristic-zero binder explicit | None |
| §4.4 saturated cycle map | Multiplication by ℓ versus saturated equal-rank map | Z_ℓ/ℓZ_ℓ has ℓ elements and torsion; saturated rank-22 quotient has rank 0 and no torsion, hence 0 | Injective equal-rank alone is insufficient | None |
| §4.5 congruence injectivity | GL₀; −1; I+3E₁₂ | Orders/reductions=1; −1 mod3=2; (I+3E₁₂)^m=I+3mE₁₂≠I for m>0 | Odd-prime hypothesis essential | None |
| §4.6 IsK3.boundedPicardDescent | Closed base; lower rank; integral index example | Closed-base extension degree=1; block padding preserves order; 2Z⊗Q=Z⊗Q though index=2 | Rank equality, not unconditional integral equality | None |
| §5.1 symplectic predicate and subgroup | id; −1; generator bσ | id scalar=1; −1≠1 in C and equals 1 in F₂; f*(bσ)=abσ | Generator independent inverse-pullback kernel | None |
| §5.2 polarized stabilizers | id; positive powers; Wehler σ₁ | id fixes L; n(f*L−L)=0 implies f*L=L; σ₁*H₂=4H₁−H₂≠H₂ | Torsion-freeness and actual class action retained | None |
| §5.3 finite étale polarized automorphisms | Identity; polarized involution | Tangent dimension=0 at both points; involution has order 2 rather than becoming identity | Zero tangent is not trivial group | None |
| §5.4 infinite Wehler action | S₁,S₂ and Gram [[2,4],[4,2]] | SᵢᵀGSᵢ=G; S₂S₁=[[-1,−4],[4,15]], trace=14, determinant=1; eigenvalues 7±4√3 | Composition and pairing witnesses agree | None |
| §6.0 supersingular discriminant | σ=1; σ=11 | p=3, σ=1 gives −9; σ=11 would force even unimodular signature difference −20≢0 mod8 | All-characteristic parity condition retained | None |
| §6.0a height inequality | h=1,10,11 | 22−2h=20,2,0; h=11 contradicts ρ≥1 | Infinite height is not substituted | None |
| §6.0b genus-one carrier | E×P¹; P¹×P¹ | Generic (h⁰,h¹)=(1,1) versus (1,0) | Arithmetic genus distinguishes carrier | None |
| §6.0b localization | E×A¹ at 0 | Generic fibre E_k(t); closed fibre E; H⁰(total)=k[t] has infinite dimension | Native local model keeps specified generic fibre | None |
| §6.0b relative minimality | Product; one fibre-point blowup | Relative canonical degree=0 on product fibre; exceptional square and degree=−1,−1 | Separate minimality excludes blowup | None |
| §6.0b field change and full fibres | F₂(a), b²=a, t²−a=0 | Pullback equation=(t−b)²; length=2 versus reduced-point length=1 | Inseparable fibre structure retained | None |
| §6.0b regular generic curve boundary | y²=x³+t; t=u² in characteristic two | Equation becomes (y−u)²=x³; both partials vanish at cusp | Unrestricted function-field regularity claim excluded | None |
| §6.0b proper-base restriction | E×P¹ versus E×A¹ | Generic (h⁰,h¹)=(1,1) in both; C proper=true,false; forgetting and re-adding properness fixes f | Restriction is not all fibrations | None |
| §6.0b quasi-elliptic restriction and ruled map | p=3,5; base genera 0,1 | Delta=1 divisible by (3−1)/2=1 but not (5−1)/2=2; genus-zero ruled source rational | No rationality conclusion over genus-one base | None |
| §6.0b geometric Kodaira realization | I₂/III; I₃/IV | Root determinants=2/2 and 3/3; incidence points=2/1 and 3/1 | Symbol/root lattice alone does not determine fibre scheme | None |
| §6.0b multiplicities and root radical | I₀* | Primitive vector=(2,1,1,1,1); matrix product=0; all-ones gives (2,−1,−1,−1,−1) | Primitive is not reduced | None |
| §6.0b root sublattice determinant | 2Z inside Gram [−2]; rank-zero root lattice | Index=2, determinant magnitude=8=2²·2; rank-zero determinant=1 | Square-index direction correct | None |
| §6.0b regular Jacobian and zero section | Elliptic product; quasi-elliptic generic group | Elliptic generic group is proper; twisted additive group has [p]=0; section intersection 1=m(C₀·Fbar) forces m=1 | Both generic types retained | None |
| §6.0b canonical/Hodge line formula | Product over P¹; Jacobian K3; formal χ=2,t=1 input | Product: L=O, canonical=O(−2); K3: L=O(−2), canonical=O; formal degree=−2−1=−3 | Inverse and torsion sign correct | None |
| §6.0b tame coefficients | m=1,2 | a=m−1=0,1; a=m violates 0≤a<m | Nonmultiple and double-fibre boundaries | None |
| §6.0b Euler and nonmultiple-fibre comparison | Torsion length t=0,1,2; fibre multiplicity m=1,2 | Kernel minus cokernel lengths=0−0=1−1=2−2=0; actual-fibre isomorphism requires m=1 | No smooth-generic-only shortcut | None |
| §6.0b Picard restriction kernel | E×C with g(C)>0 versus C=P¹ | Nontrivial Pic⁰(C) gives vertical degree 0; Pic(P¹) rank=1 | One fibre cannot generate every vertical class | None |
| §6.0b section–fibre plane | χ=0,1,2 | Matrices [[−χ,1],[1,0]] all have determinant −1; χ=2 basis shift gives [[0,1],[1,0]] | Unimodular plane and parity distinguished | None |
| §6.0b numerical quotient law | Bielliptic example; product E×P¹ | Bielliptic: MW order=4, N=MW, q=1; product: N=E(C)=MW, both quotients=0 | No direct Num→MW map asserted | None |
| §6.0b numerical determinant law | Bielliptic; index-3 A₈⊂E₈ | Bielliptic: q²·|disc Num|=1²·1=1=d_R; full-order replacement gives 16≠1; A₈ determinant=9=3²·1 | Numerical kernel quotient required | None |
| §6.0b sign of degree-normalized restriction | y²+y=x³, P=(0,0) | r(C₀)=r(F)=0; r(C_P)=P; −P=(0,−1)≠P; tangent intersection at P=3 | Restriction is not its inverse | None |
| §6.0b K3 determinant specialization | Conditional ρ=18 and two II* fibres | Root rank=16; V rank=18; d_R=1; q²·disc=1 forces q=disc=1 | Conditional test does not assert existence | None |
| §6.0b rank-five pencils | Gram [4]; primitive fibre F and 2F | 4x²=0 only at x=0; F²=(2F)²=0, but |2F| has generic composite degree 2 | Rank threshold and primitivity retained | None |
| §6.0c infinite height and Jacobian K3 | Finite h=1; quasi-elliptic; Jacobian over P¹ | Finite h=1 gives ρ≤20; quasi-elliptic unirational case gives ρ=22; L=O(−2) yields ω_J=O, h¹=0 | Rank-21 exclusion uses both pencil alternatives | None |
| §6.1 tame quotient/root lattice | G=1; involution | Root ranks=0,8; determinants=1,2⁸=256 | Tameness not dropped | None |
| §6.1a cyclic quotient arithmetic | n=2,4,14 | 24=8·3; 72=4·15+2·2·3; 312=21+96+195 | Order 14 survives arithmetic until discriminant test | None |
| §6.1a forbidden rank-20 candidates | n=11,14,15 | Ranks=20,20,20; determinants=11²,14²,15²=121,196,225 | Square-discriminant exclusion retained | None |
| §6.2 tame element table | Orders 2,7,8; identity | Fixed points=8,3,2; order-2 H² trace=8−2=6; id fixes dimension-2 X | Identity excluded | None |
| §6.2a wild fixed loci and inequality | Empty locus; N=2,d=1 | Empty branch p=2; p(N−d−1)=0≤2N−2=2 for every p | Zero denominator gives no prime bound | None |
| §6.3 wild quotient alternatives | Free C₂ in characteristic two | Euler quotient=24/2=12; b₂=12−2=10≠22 | No Picard-rank substitution in Enriques branch | None |
| §6.3a refinements | p=11,13; quasi-elliptic p=2,3 | 11≤11; 13>11 excludes invariant pencil in that case; 2,3≤11 | Elliptic p-torsion theorem retains K3 and p>7 | None |
| §6.4 wild-prime bound | Finite group divisible by 13; p-torsion scalar | Order-13 element would give 13≤11, false; (a−1)^p=a^p−1=0 forces a=1 | Symplectic subgroup assumption unnecessary | None |
| §6.4a rank-22 Picard faithfulness | Identity; degree-two characteristic-zero deck involution | Identity kernel element=1; deck involution order=2 fixes one ample class | Full-Picard rank-22 condition retained | None |
| §6.5 cohomological faithfulness | Identity; free wild involution; K3 quotient branch | Identity trace=22; free wild invariant dimension=10; strict rank increase would require 22>22 | Wild branches included | None |
| §6.6 uniform group bound | G=1; characteristic three | |G|=1≤|GL₂₂(F₃)|,|GL₂₂(F₅)|; at p=3 use ℓ=5≠3 | No good-primes restriction on X | None |
| §6.7d equivariant polarized lift | Symplectic involution; p=2 boundary | Invariant rank=(22+6)/2=14; tangent=14−1−1=12; +1=−1 at p=2 | Odd-characteristic domain retained | None |
| §6.7d involution pencil | Order-two action; swapped integral basis | Anti-invariant dimension=(22−6)/2=8; plus ample class gives 9; swap matrix mod2≠I | Lift/specialization route avoids false mod-2 inference | None |
| §6.8 Artin-invariant-one predicate | p=3; rank/discriminant pairs (22,−9),(22,−81),(20,−9) | Predicate=true,false,false; −9=−3², −81=−3⁴ | Rank and signed bilinear discriminant both required | None |
| §6.8 Fermat examples | p=3,7,5 | Rank22 cases have discriminants −9,−49; p=5 has h=1 hence ρ≤20 | Characteristic follows the field | None |
| §6.8a invariant dimension and formal tangent | G=1,C₇,nonabelian order21; tame A₁ quotient | Invariants=24,(24+18)/7=6,(24+84+18)/21=6; local generic rank=2 but origin fibre length=3 | Proper coherent trace used instead of finite-flat trace at singularity | None |
| §6.9 Mathieu function/character | n=0,1,2,7 | ε=0,24,8,3; denominator at 0 is 0, total-field division gives 0 | Geometric uses require positive element order | None |
| §6.10 characteristic-zero bound | Trivial group; involution; 23-cycle | Orbits=24,8+8=16,1+1=2; last fails ≥5; maximal listed order=960 | Containment does not assert converse realization | None |
| §6.11 positive-characteristic exceptional branch | Four-orbit case; p=2 tame action | 4<5 so 960 implication unavailable; general M₂₃ bound=10200960; p=2 forces odd order | Exceptional qualification retained | None |
| §7.1 geometric primitivity | 0,e,2e in rank-one lattice | 0=2·0 nonprimitive; e primitive; 2e divisible by 2; squarefree d forbids n²|d for n>1 | Zero and multiples excluded | None |
| §7.2 root loci and primitive openness | n=0,3; classes F,2F,0 | [0] collapses Pic; [3] injective even at p=3; F·C=1 forbids roots; 2F and 0 have roots | Square-zero branch uses ample intersection | None |
| §7.3 polarized families | d=0; scalar change of representative | Ample square>0 excludes d=0; scalar b has trivial action on Picard class | Arrows retain surface isomorphism only | None |
| §7.4 polynomial and positive-power vanishing | d=2, m=0,1,2,3,−1 | h⁰ positive powers=4,10,20; χ(L⁻¹)=4; h²(O)=1 excludes m=0 | No vanishing for nonpositive powers | None |
| §7.5 embedding and relative sections | d=1,2; dual-number base | Rank=11,20; projective dimension=10,19; polynomials=9t²+2,18t²+2; dual-number section rank remains 11 or 20 | Arbitrary base change retained | None |
| §7.6 K3 Hilbert locus | Smooth cubic-embedded quartic; wrong canonical comparison | Polynomial=18t²+2; P² has rank ω=rank O=1 but [ω]=−3H≠0 | Equality of Picard sections, not ranks | None |
| §7.7 covering family and projective frames | Tensor L by base line; real quaternion obstruction | Sections tensor by N³ but projectivization unchanged; 3α=α≠0 for order-two α | Brauer–Severi bundle avoids assumed vector-bundle descent | None |
| §8.1 polarized stacks | Polarized involution; d=1 at p=2 | Stabilizer contains element of order 2; cubic ambient projective dimension=10 also at p=2 | Stack not a fine scheme; all primes retained | None |
| §8.2 separation | Generic identity; fixed pair of smooth families | Identity extension=identity; uniqueness count=1; ruled surface has h⁰(ω)=0 versus K3 value 1 | No existence statement for arbitrary punctured family | None |
| §8.3 coarse spaces | Object with involution | Stack automorphism group has at least 2 elements; coarse point forgets this group | Geometric bijection does not identify arbitrary k-forms | None |
| §8.4 smooth arithmetic open | d=1; one nonzero obstruction | Base=Z[1/2]; tangent dimension=20−1=19 | No smoothness claim at p|2d | None |
| §8.5 finite-field finiteness | Fixed finite field, d=1,2; forms | Cubic section ranks=11,20; Br(k)=0 makes obstruction 0; distinct forms remain distinct k-isomorphism classes | Finite-type k-points argument includes forms | None |

**Repository outcome.** Neither authorized roadmap file required a further local edit for these two integration findings. The worktree is unchanged at 8bc8863; no commit was created and nothing was pushed. Both requested integration actions remain unapplied.

**Build and gates.**

`lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested` exited 0: `Build completed successfully (9040 jobs).` The only warnings were the six headline theorem declarations using `sorry`; the fresh nine-declaration signature elaboration also exited 0.

Dependency-direction output (exit 0; no UPWARD or CYCLE line):

```text
depcheck: 33 roadmaps, 305 edges, 0 problem(s)
```

Gate command exited 0; exact summary:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
