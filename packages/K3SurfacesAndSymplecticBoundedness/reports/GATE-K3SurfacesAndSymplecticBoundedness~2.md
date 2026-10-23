## H01 (CBirkbeck) — applied differently

The supplied head already assigns the common algebraic and analytic foundations to K3Surfaces Conventions/K0/K0.A/K1/K2 and gives the same-scheme specialization equivalence in `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:259`; retaining that existing owner makes this an arbitrary-field/all-characteristic Part II with a single K3Surfaces → Part II supply direction, and the acceptance-file explanation agrees at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/Suggested.lean:15`.
The remaining reference to deleted §3.4 is now §3.1 at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:555`, so the rank-22 argument names its actual integral cohomology input; the specialization identifies existential canonical triviality without choosing a volume form (huybrechts line 135, line 147 and line 420).

## H02 (CBirkbeck) — applied differently

The supplied head's contract at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:139` explicitly makes NoncommutativeAndEquivariantIwasawa §0.1 a prerequisite of §§4.5, 4.6 and 6.6; the supplier includes torsion-freeness in uniformity and supplies first-congruence uniformity for odd primes, while −1 modulo 2 is a counterexample to dropping oddness.
For the worker's PR-description update, add NoncommutativeAndEquivariantIwasawa §0.1 (#1307) to the prerequisite list and before this roadmap in the merge plan; only its group-theoretic prefix is consumed, and no separate prefix owner or supplier-file change is asserted here because PR text and other roadmaps are outside this job's edit scope.

## H03 (CBirkbeck) — applied differently

The supplied head's contract at `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:177` records the verified chain TopologicalSheafCohomology TS3.1–TS3.3/TS3.7 and CharacteristicClasses C1.2/S0–S5 → ComplexComparisonPartII C6.0–C6.2 → C6.3/C6.6 → §3.1, retaining the suppliers' support and CW hypotheses.
For the worker's PR-description update, replace the assertion of no other-author prerequisites with these two transitive prerequisites (#973 and #896, both kim-em), as well as the direct K3Surfaces prerequisite (#1285, kim-em); PR-description changes are not part of this repository commit.

**Verification and ownership.** Commit `6627d12` contains the residual citation repair; supplied commit `09964b1` already contains the ownership and prerequisite revisions described above. The three findings split the first numbered review finding and the two independent points of its second numbered finding; the comment asks no separate question. Ownership was checked against main `a07e202`, the supplied sibling folders, the board packages and the indexed open roadmap heads. K3Surfaces `43784f8` is the common-foundation owner; the arbitrary-field predicate, its adapter and characteristic-2 extension stay here because they extend its stated domain, while ArithmeticDynamics' K3 example concerns divisor heights. No declaration adopts another roadmap's fully qualified name, no supplier is moved down, and no reciprocal dependency is introduced.

Cross-roadmap resolution reports no missing citations. The reviewed live supplier cuts are K3Surfaces `43784f8`, NoncommutativeAndEquivariantIwasawa `2ee5358`, ComplexComparisonPartII `2d50a88`, TopologicalSheafCohomology `f06755a` and CharacteristicClasses `d077cb4`; in particular the Iwasawa head differs from the older head quoted by the review but retains the required §0.1 contract. The Mathlib and Tau Ceti checkouts match both manifests: `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The resolver skips external library names, so the 31 named library contracts were located directly at those pins. For example, `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41` includes separatedness, universal closedness and local finite type; `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40` quantifies integral field fibres, hence excludes empty fibres; `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50` is the skeleton of invertible sheaves and does not assume finite freeness. No new source is cited; waived and uncertified references retain their settled status.

A scratch file with `#check @name` for every actual declaration elaborated once with exit 0. All nine signatures agree with their README statements: the three definitions retain the field and structure morphism, field-extension invariance retains both fields and their algebra structure, and the five remaining theorems retain the K3 hypothesis. Hodge finite-dimensionality and the characteristic-zero conditional rank bound are present; bounded Picard descent retains finite-dimensionality, separability and the degree bound. No binder or signature changed. The original ten-entry listing counted the word “group” in a docstring as a declaration; there are three definitions and six theorems, with no such tenth declaration.

**Mathematical adversarial pass.**

The entries record finite controls and countermodels, not proofs of the admitted theorems. “Retained” means the stated hypotheses exclude the displayed countermodel; source and supplier checks supply the general argument. Section references are to `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md`.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Field/universe convention | Zero ring; one universe lift | Zero ring has 0=1, contradicting the field convention; a lift preserves dimension 2 | Excluded / invariant | Retained |
| Exterior degree convention | Rank-two free cotangent space, degrees 0,1,2,3 | Exterior ranks 1,2,1,0; tensor-cube rank 8 | Distinguishes exterior powers | Retained |
| Intersection and half-norm convention | Quartic H; rational curve C; zero class | B(H,H)=4, 2Q(H)=4; B(C,C)=−2, 2Q(C)=−2; B(0,0)=Q(0)=0 | Signs and factor agree | Retained |
| Signed discriminant convention | Rank-one [4]; signature (1,21) | det[4]=4; 21 negative directions give determinant sign −1 | Signed determinant differs from group order | Retained |
| Integer Riemann–Roch convention | O and quartic H in characteristic 2 | 2χ(O)=4=4+0; 2χ(H)=8=4+4 in ℤ | No division in the field | Retained |
| Tate/cup-trace convention | Quartic H and point | tr(c₁(H)²)=4=B(H,H); tr([point])=1 | Positive trace fixed | Added explicit pairing-negative control |
| Contraction convention | σ(e₁,e₂)=1, characteristic 0 and 2 | Matrix [[0,−1],[1,0]] has det 1; at 2 it is [[0,1],[1,0]], still det 1 | Both characteristics invertible | Retained |
| Pullback composition convention | Wehler σ₁,σ₂ | (σ₁∘σ₂)*=S₂S₁=[[-1,−4],[4,15]], whereas S₁S₂=[[15,4],[−4,−1]] | Order matters | Retained |
| Mathieu orbit convention | Identity; involution; 23-cycle | Fixed letters 24,8,1; orbit counts 24,16,2 on 24 letters | Stabilized letter retained | Retained |
| Cubic embedding convention | d=1,2 | Section ranks 11,20; projective dimensions 10,19 | Rank differs by one from dimension | Retained |
| Shared K3 algebraic presentation | Smooth complex quartic; empty scheme; E×E | Quartic (dim,h¹,ω)=(2,0,O); empty has nonemptiness 0; E×E has h¹=2 | Same predicate on common domain | K3Surfaces Conventions/K0 imported |
| Shared analytic predicate | Quartic analytic surface; complex two-torus; empty manifold | Quartic dimℂ=2 and h¹=0; torus h¹=2; empty nonemptiness=0 | No second predicate required | Duplicate definition deleted |
| Shared complex equivalence | Quartic H and 2σ | Counit pulls H back to H, H²=4; image of 2σ is twice image of σ | Specified isomorphism, rather than equality of chosen algebraizations | Imported K3Surfaces K1 |
| Shared Hodge/Chern–Picard comparison | O, O(1) on a projective line; quartic H | c₁(O)=0, degree c₁(O(1))=+1; H cup square=4 | Normalization survives specialization | Imported K3Surfaces K1 |
| Shared integral cup lattice | Complex K3 Betti groups | Ranks (1,0,22,0,1), Euler 24; H² signature (3,19), determinant −1 | Integral, rather than rational-only, input | Imported K3Surfaces K2 |
| Iwasawa §0.1 congruence contract | n=0,1; ℓ=3 and 2 | Uniform dimensions 0,1; −1 mod 3=2 but −1 mod 2=1 and (−1)²=1 | Odd-prime hypothesis essential | Prefix dependency made explicit |
| Comparison support contract | Open interval and a point; finite coefficients ℤ/2 over ℤ/4 | Extension-by-zero endpoint stalk=0; point H⁰=ℤ/2 and H¹=0 | Support bridge does not require projective coefficient modules | Transitive owners recorded |
| Comparison connecting convention | Oriented interval pair | Boundary [1]−[0], endpoint coefficients (+1,−1); negative convention gives (−1,+1) | Supplied support/CW domain and sign retained | Transitive owners recorded |
| §1.1 differentialForms definition | Local frame of rank 2; p=0,1,2,3 | Ranks 1,2,1,0 | Native sheaf exterior power passes | Retained |
| §1.1 IsK3 definition | Quartic; E×E; ℙ²; empty scheme | Quartic true; E×E h¹=2; ωℙ²=O(−3); empty not integral | Positive and negative witnesses | All-field extension retained |
| §1.1 canonical triviality | σ and 2σ over ℂ; zero form | Two nonzero forms give the same existential truth value 1; zero contraction has determinant 0 | Choice is additional input | Specialization law explicit |
| §1.2 field-extension equivalence, both directions | Identity; purely inseparable field extension | For a quartic: true↔true, H¹=0⊗K=0; for E×E: false↔false, dim H¹=2 on both sides | No separability restriction | Retained |
| §1.2 identity/tower transport | k→k and k→K→L | Id on a local 2-frame is I₂; I₂I₂=I₂, exterior-square scalar 1 | Identities preserve specified f | Retained |
| §1.3 projectivity | Smooth quartic over k; empty scheme | O(1) square 4>0; empty fails IsK3 before application | Hypotheses hold for the positive witness | Retained general surface input |
| §1.3 algebraic specialization equivalence | Complex quartic; E×E; ℙ² | Both conditions respectively true,true; false,false (h¹=2); false,false (ω=O(−3)) | Both implications tested | Added adapter on the same f |
| §1.3 adapter inverse/composition laws | Identity scheme map and σ↦2σ | Algebraic composite on a local frame I₂I₂=I₂; contraction scales from (e₂*,−e₁*) to (2e₂*,−2e₁*) | Carrier fixed; chosen form not fixed | Added explicit laws and Checks |
| §1.3 analytic counit | Smooth complex quartic H | Pullback class H and square 4 on both sides | Equality only after specified counit transport | Added counit formulation |
| §1.4 coherent invariants | O; quartic H | (h⁰,h¹,h²)(O)=(1,0,1), χ=2; H²=4, χ(H)=4 | Same integer invariants | Geometric calculation imported; arbitrary-field extension retained |
| §1.4 contraction/base change | Frame, a=2 over ℂ; characteristic 2 | det contraction=1; after scaling det=4; at characteristic 2 unscaled det=1 | Nonzero scalar and alternating sign retained | Shared-stage compatibility added |
| §1.5 numerical kernel | O; rational curve C; hypothetical nontrivial numerically zero L | O has intersections 0; C²=−2; hypothetical L gives χ(L)=2 and χ(L)≤0 | Only O survives | Retained |
| §1.5 torsion kernel | nL=0, n=2 and p | n(L·H)=0 in ℤ implies L·H=0 for n>0, even at char p | No cancellation in characteristic p needed | Retained |
| §1.6 quartic polynomial | t=0,1,−1 | 2t²+2=2,4,4 | Matches RR and duality | Retained |
| §1.6 Fermat smoothness | Characteristic 0,3,2 | Partials 4xᵢ³; coefficient mod 3=1; mod 2=0 and equation=(Σxᵢ)⁴ | Characteristic 2 Fermat excluded | Retained |
| §2.1 relative Picard tangent | K3; abelian surface | Tangent dimensions h¹(O)=0 and 2 | K3 identity component reduced; abelian control excluded | Retained |
| §2.1 Picard rational-point injection | Trivial class; real quaternion-obstructed class | Obstructions 0 and α≠0 with 2α=0 | Injection does not imply surjection | Retained |
| §2.1a Witt kernel reduction | x=0; nonzero kernel witness; V-adic separated element | d(0)=0; required witness x≠0; ∩VⁿH={0} | Zero is insufficient; nonzero witness contradicts forced intersection | Retained, no odd-prime duplicate vanishing proof |
| §2.1a unirational rank computation | Hypothetical vector-field branch | χ(O)=2, c₂=24, b₀=b₄=1, b₁=b₃=0 imply b₂=24−2=22 | No use of later K3 rank theorem | Retained |
| §2.2 closedness | p=3 supplied vanishing; p=2 Witt route | At p=3 domain H⁰Ω¹=0, so d=0; at p=2 a nonzero dual map k→H²Ω¹ would have kernel 0 | Distinct routes keep same all-prime conclusion | Odd branch imported |
| §2.3 one-form vanishing | Complex quartic; char-3 K3; char-2 K3; abelian surface | K3 dim H⁰Ω¹=0 in each branch; abelian surface dim=2 and h¹(O)=2 | Correct exclusion; all fields kept | K0.A/K1 plus characteristic-2 extension |
| §2.3 vector-field/obstruction vanishing | Same K3 witnesses | Contraction sends dimension 0 to 0; Serre dual gives dim H²T=0 | All three conclusions on actual native sheaves | Imported branch plus descent |
| §2.4 Hodge diamond | (p,q)=(0,0),(1,1),(2,2),(3,0),(0,3) | Formula gives 1,20,1,0,0; Euler 1+22+1=24 | Exterior/coherent out-of-range cases vanish | All-field extension retained |
| §2.4 Noether and Ω¹ RR | Characteristic 2 and 3 | c₂=12·2=24; χΩ¹=4−24=−20=0−20+0 | Integer arithmetic independent of characteristic | Shared c₂ calculation imported on common domain |
| §2.4 crystalline torsion/freeness | M² containing W/p; M⁰ containing W/p | M²[p] would contribute dimension 1 to H¹dR=0; M⁰[p] dimension 1 to H⁻¹dR=0 | Both torsion controls excluded | Retained |
| §2.4 integral crystalline ranks | i=0,1,2,3,4 | Dimensions mod p and free ranks both (1,0,22,0,1) | Universal coefficients includes odd and p=2 | Retained |
| §2.5 marked formal deformation | Tangent first order; identity marking | h¹(T)=20; automorphism tangent h⁰(T)=0; obstruction h²(T)=0 | Marked statement, not a universal unmarked family | Retained |
| §2.6 pair locus | L=O; ample L with p∤2d; L=M^p | Dimensions 20 for O and 19 for nontrivial pair; c₁,dR(M^p)=p c₁(M)=0 | Nontriviality and integral normalization essential | Retained |
| §2.6 smoothness condition | d=1, p=3 and 2 | 2d mod 3=2≠0; 2d mod 2=0 | Smoothness only in first case; flatness in both | Retained |
| §2.7 polarized lift | Unramified or ramified trait | Base residue degree fixed; ramification e can exceed 1; section square remains 2d | No e=1 restriction | Retained |
| §3.1 integral étale ranks | ℓ=2 in char 3; ℓ=3 in char 2 | Both give ranks (1,0,22,0,1), Euler 24 | Invertibility, not oddness, controls this theorem | Rewired to shared Betti owner |
| §3.1 cup-trace perfection | Quartic H; identity pullback | H cup square=4 and tr(c₁(H)²)=4; identity scalar=1 | Positive normalization agrees | Added negative pairing control −4 |
| §3.1 exponential normalization | t↦exp(2πit), t=0,1 | Lift endpoints 0,1, difference +1; degree c₁(O(1))=+1 | Distinguishes Chern-class sign from its square | Kept winding Check with new section number |
| §4.1 Picard pullback | Identity; ℝ→ℂ Fermat quartic | H↦H and H²=4; conjugate skew lines have squares −2, pairing 0 | Injection, not all geometric classes | Retained |
| §4.1 purely inseparable comparison | Degree p and identity degree 1 | Cokernel killed by p; identity cokernel=0 killed by 1 | Rationalization removes p-primary obstruction | Retained |
| §4.1 Galois rank descent | Conjugation on two skew line classes | Swap matrix [[0,1],[1,0]] has invariant dimension 1<2 | Arithmetic and geometric ranks can differ | Retained |
| §4.1 specialization | Constant quartic family | H_η²=H_s²=4; zero specializes to zero | Intersection preserved; no surjectivity implied | Retained |
| §4.2 finite free Picard group | Generic complex quartic rank 1; rank-22 geometric K3 | Free ranks 1,22; torsion ranks 0,0 | No abstract lattice classification used as geometry | Retained |
| §4.2 lattice realization | H, C and O | Gram [4], Q(H)=2, disc=4; C²=−2,Q(C)=−1; Q(O)=0 | Integral pairing, not unimodularity | Retained |
| §4.2 normalized base-change pairing | Real line and its complex pullback | Squares 1=1; pushforward complex line=2 real lines, projection formula 2·1=2 | No extension-degree factor on two pulled-back divisors | Retained |
| §4.3 geometricPicardRank | Algebraically closed base; ℝ→ℂ Fermat quartic | Geometric rank ρ on closed base; Fermat geometric rank 20 on both fields | Does not mean arithmetic rank | Retained |
| §4.4 rank bounds | Rank-one quartic; rank-22 positive-characteristic K3 | 1≤1≤1≤20≤22; 22≤22 with char-zero branch inapplicable | Char-zero qualifier essential | Betti input rewired; stale §3.4 reference corrected to §3.1 |
| §4.4 saturation | Map ×ℓ on ℤ_ℓ versus saturated equal-rank cycle map | ×ℓ cokernel ℤ/ℓ≠0; saturated equal-rank cokernel=0 | Injective/equal rank alone insufficient | Retained |
| §4.5 finite-subgroup reduction | GL₀; ±1 at ℓ=3,2 | GL₀ order 1; residues 1,2 distinct at 3; residues 1,1 coincide at 2 | Odd-prime premise excludes failure | Retained supplied kernel theorem |
| §4.5 unipotent kernel | I+3E₁₂, m=1,2,3 | Upper entries 3,6,9, all nonzero in ℤ₃ | Infinite order, unlike reduction modulo 9 | Retained |
| §4.6 bounded rank descent | Closed base; conjugation image C₂ | Degree 1, respectively 2≤GL₂₂(𝔽₃) cardinal; geometric rank unchanged | Separable rank descent does not assert integral equality | Retained |
| §5.1 symplectic predicate | Identity; scalar −1 in char 0 and 2 | Canonical scalars 1,−1,1 respectively | Generator-independent kernel | Retained |
| §5.1 rescaling and composition | f*σ=aσ and σ′=bσ, b≠0 | f*σ′=abσ=aσ′; identity a=1 | Nonzero generator matters | Retained |
| §5.2 polarized stabilizer | Wehler σ₁ on H₁,H₂ | σ₁*H₁=H₁; σ₁*H₂=4H₁−H₂≠H₂ since Gram det=−12 | Gives a member and a nonmember | Retained |
| §5.2 powers/scalar isomorphisms | n=1,2; line-isomorphism scalars 1,2 | n(f*L−L)=0 implies f*L−L=0; both scalars give one surface automorphism | No G_m stabilizer added | Retained |
| §5.3 finite étale stabilizers | Identity tangent; nontrivial polarized involution | Tangent dimension 0; group can contain at least 2 geometric points | Étale does not mean trivial or rationally split | Retained |
| §5.4 Wehler matrices | S₁,S₂, Gram B | S₁ᵀBS₁=S₂ᵀBS₂=B=[[2,4],[4,2]]; det B=−12 | Column convention passes | Retained |
| §5.4 infinite symplectic product | S₂S₁ and canonical scalars | Product=[[-1,−4],[4,15]], trace 14, det 1; (−1)(−1)=1; eigenvalue 7+4√3>1 | Infinite symplectic group witnessed | Retained |
| §6.0 discriminant/Artin invariant | p=3, σ=1,2,0,11 | Discs −9,−81; σ=0 or rescaled σ=11 would require 8∣−20, false | Range 1≤σ≤10 excludes both endpoints | Retained |
| §6.0a finite-height inequality | h=1,10,11 | 22−2h=20,2,0; h=11 contradicts ρ≥1 | Infinite height is not a natural-number substitution | Retained |
| §6.0b isotropic pencil | Rank-one [4]; F; 2F | 4x²=0 forces x=0; F²=(2F)²=0 but multiplicities 1,2 | Rank and primitivity both needed | Retained |
| §6.0c infinite-height/pencil implication | h=1; hypothetical rank 21 | h=1 gives ρ≤20; rank 21 forces infinite height and pencil then ρ=22 | Elliptic hypothesis alone not sufficient | Retained |
| §6.0c Jacobian calculation | K3 pencil, χ=2, base ℙ¹ | deg R¹j_*O=−2, ω base degree −2; −2−(−2)=0; section/fibre Gram det=−1 | K3 canonical class and χ match | Retained |
| §6.1 tame resolution | Trivial G; involution | Root rank 0, det 1; eight A₁ give rank 8, det 2⁸=256 | Identity and nontrivial cases distinguished | Retained |
| §6.1 rank-20 nonsquare claim | Candidate orders 11,14,15 | Root ranks 20; determinants 11²=121,14²=196,15²=225 | Violates nonsquare conclusion | Retained |
| §6.1a quotient Euler identity | n=2,a₂=8; n=4,a₄=4,a₂=2 | 24=8·3; 72=4·15+2·2·3 | Both sides agree | Retained |
| §6.1a subgroup fixed counts | n=4 and n=14 | For square in C₄:4+2·2=8; C₁₄ counts (1,1,1) give 21+96+195=312=24·13 | Order 14 needs discriminant exclusion | Retained |
| §6.1a forbidden prime powers | n=9,16,25,49,121,28 | n=9 forces 6=2+3a₃; n=16 forces 2=1+2a₈; ε=4/5,3/7,2/11,1/2 for last four | Integral orbit counts fail | Retained |
| §6.2 tame fixed-point table | n=2,3,4,5,6,7,8 | Counts 8,6,4,4,2,3,2; H² traces 6,4,2,2,0,1,0 | Identity is outside finite table | Shared Betti references updated |
| §6.2a wild divisor inequality | D²=2,d=1 | N=2; p(N−d−1)=0≤2N−2=2 | Cannot divide by zero denominator | Retained |
| §6.2a fixed-divisor types | ADE A₁; fibre I₂ matrix | [−2] determinant −2; [[−2,2],[2,−2]] determinant 0 | Negative definite differs from fibration radical | Retained |
| §6.3 free Enriques quotient | Free C₂ action, char 2 | e(Y)=24/2=12; b₂(Y)=12−2=10≠22 | Excludes cohomologically trivial free action | Betti reference updated |
| §6.3 quotient algebraic/transcendental dimensions | Rational resolution; K3 resolution with nonzero exceptional root | Rational T² dimension 0; exceptional rank increment at least 1 | No integral averaging asserted | Retained |
| §6.3a refined wild bounds | p=11,13; quasi-elliptic p=2,3 | 11≤11; 13>11 excludes invariant pencil; 2,3≤11 | No p>3 assumption inserted | Retained |
| §6.3a p-torsion sections | p=11, elliptic K3 with section | p>7, torsion subgroup order 1 | Does not apply to all elliptic surfaces | Retained |
| §6.4 wild prime bound | p=2 and p=13 | 2≤11; 13>11 forces 13∤G order | Cauchy element scalar obeys x^p−1=(x−1)^p | Retained |
| §6.4a Picard faithfulness | Identity; degree-two deck involution fixing an ample class | Identity kernel order 1; deck has order 2 while fixing one class | Full rank-22 Picard action required | Retained |
| §6.5 cohomology faithfulness | Identity; tame involution; free char-2 quotient | H² trace 22,6; invariant rank 22 versus 10 in free branch | Nonidentity controls cannot act trivially | Shared complex inputs rewired |
| §6.6 universal finite-subgroup bound | G=1; char 3 and 5 | G order 1; use ℓ=5 at char 3 and ℓ=3 at char 5; GL₂₂ cardinal digit counts 339,231 | Coefficient prime always invertible and odd | Retained |
| §6.7d invariant deformation dimensions | Tame involution, trace 6 | H² invariant rank (22+6)/2=14; anti-invariant rank 8; tangent rank 14−2=12 | Distinguishes invariant deformation from rank 20 | Betti references rewired |
| §6.7d lifted canonical scalar | p odd; p=2 | Roots ±1 reduce distinctly at odd p; at p=2, +1=−1 | Lift assertion excludes p=2 | Retained |
| §6.7d rank/pencil deduction | Nonidentity tame involution; identity | Anti-invariant algebraic rank 8 plus ample rank 1 gives ≥9; identity anti-invariant rank 0 | Identity does not force rank ≥9 | Source of (1,1) comparison updated |
| §6.8 exceptional predicate | (p,ρ,disc)=(3,22,−9),(3,22,−81),(3,20,−9) | Truth values 1,0,0; σ=1,2 in first two | Rank and signed discriminant both needed | Retained |
| §6.8 realized Fermat controls | p=3,7,5 | Discs −9,−49 at rank 22 for 3,7; h=1 and ρ≤20 at 5 | Characteristic is read from actual field | Retained |
| §6.8a formal-Brauer quotient tangent | Tame local involution on k[x,y] | Generic quotient degree 2; origin fibre dimension 3; trace on pulled-back two-form multiplies by 2≠0 | Proper coherent trace used instead of unavailable flat trace | Retained |
| §6.8a total invariant dimensions | G=1,C₇,C₇⋊C₃ | 24; (24+6·3)/7=6; (24+14·6+6·3)/21=6 | Exceptional transfer not needed for orders 7,21 | Betti reference updated |
| §6.9 Mathieu function including junk value | n=0,1,2,7 | ε=0,24,8,3 | Zero division total value is not an element order | Retained |
| §6.9 tame character/invariant bound | Identity; involution; exceptional branch | Total trace 24,8; involution invariant dimension (24+8)/2=16; exceptional allowed 4 | No universal five-invariant claim in exceptional branch | Betti reference updated |
| §6.10 Mukai bound/orbits | Trivial G; involution; 23-cycle | Orbits 24,16,2; first two ≥5, last <5; maximum group order 960 | Only necessity, not realization | Retained |
| §6.11 positive-characteristic tame bound | Exceptional/nonexceptional; char 2 | Bounds 10200960 and 960; at char 2 tame order odd | Four-orbit exception retained | Retained |
| §7.1 primitivity | 0,e,2e in ℤ | 0=2·0 nonprimitive; e not divisible by n>1; 2e=2·e nonprimitive | Native divisibility distinguishes all three | Retained |
| §7.1 squarefree criterion | d=1,2 and λ=nµ | n² divides 1 or 2, hence n=1 | Evenness needed to divide 2 from squares | Retained |
| §7.2 closed root loci/open primitive locus | n=0,3 in char 3; F and 2F | [0] image rank 0; [3] injective; F²=0,F·C=1; 2F has root F | No division by characteristic | Retained |
| §7.2 zero-square bounded roots | λ=0; F·H=m>0 | d=m=0 gives primitive locus empty; for F, n must divide positive m | n²∣0 alone gives no finite root bound | Retained |
| §7.3 polarized family definition | d=0; actual ample L; base scalar on representative | Ample L²=2d>0 excludes d=0; scalar changes one representative, number of surface arrows unchanged | Picard section, not a universal bundle | Retained |
| §7.4 Hilbert polynomial | d=2,t=0,1,2,3 | Values 2,4,10,20 | Matches quartic sections at positive powers | Retained |
| §7.4 ample-power vanishing | m=0,1,−1 | H²(O) dimension 1; positive m higher dimensions 0; h²(L⁻¹)=d+2>0 | Positivity of m essential | Retained |
| §7.5 basepoint/very-ample inequalities | 2L and 3L at d=1 | (2L)²=8; possible 0<2L·D<2 has no integer solution; (3L)²=18, failure D²=1 contradicts evenness | Includes characteristic 2 | Retained |
| §7.5 cubic family ranks | d=1,2; square-zero base thickening | Rank 11,20; tensoring a rank-r free module with dual numbers keeps rank r | Base-change statement not restricted to reduced bases | Retained |
| §7.6 K3 Hilbert locus | Cubic quartic; ℙ²; singular degeneration | Polynomial 18t²+2; canonical ℙ² class −3H≠0 despite rank 1; singular point fails smoothness | Canonical equality is equality of classes | Retained |
| §7.7 root/frame atlas | Cubic section λ; frame change swapping x₀³,x₁³ | 3λ=[O(1)]; two different ordered frames can give the same stabilized Hilbert point | Source identification retained in frame torsor | Retained |
| §7.7 Brauer–Severi descent | Quaternion obstruction α of order 2; twist N | 3α=α≠0; section bundle changes by N³ but its projectivization is unchanged | Does not assert a descended vector bundle | Retained |
| §8.1 quotient DM stacks | Polarized involution; d=1 | Stabilizer has ≥2 points, tangent rank 0; cubic frame group PGL₁₁ | Stack retains arrows | Retained |
| §8.2 trait uniqueness | Generic identity; scalar choice of line isomorphism | Surface identity extends to identity; two line scalars give one surface isomorphism | Proper Isom problem, not arbitrary family extension | Retained |
| §8.3 coarse spaces | Object with C₂ stabilizer | One geometric coarse point but two automorphisms | Coarse points do not encode arrows or all rational forms | Retained |
| §8.4 smooth open base | d=1,p=2,3 | 2d=2; base ℤ[1/2] contains char 3 and excludes char 2; tangent dimension 19 | No bad-prime smoothness promise | Retained |
| §8.5 finite-field finiteness | Fixed q,d; twisted forms | H²_fppf(k,G_m)=0, so obstruction=0; cubic section rank 9d+2; finite set H_d(𝔽_q) maps onto forms | Counts forms using actual frames | Retained |

**Build and gates.** The required module build exited 0, with the six expected admitted-theorem warnings and the exact final line:

```text
Build completed successfully (9040 jobs).
```

The required full gate exited 0; its exact summary is:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required dependency gate exited 0; its complete output is:

```text
depcheck: 26 roadmaps, 231 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The worktree is clean; nothing was pushed.
