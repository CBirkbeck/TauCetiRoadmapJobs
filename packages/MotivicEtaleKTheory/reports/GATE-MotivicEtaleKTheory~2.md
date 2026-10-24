## H01 (CBirkbeck) — answered

The shared restriction fibers and cube relativity remain duplicated in ColemanIntegration §§L3.Fa.1–L3.Fa.2 at ae078af, whereas `TauCetiRoadmap/MotivicEtaleKTheory/README.md` lines 15 and 727 already assign them to §2.0a and preserve Coleman's public adapters through SchemeKTheoryOperations §2.5, with differences +1,−1 and loop-exchange sign −1. This coordination finding is accepted and remains open: changing Coleman's construction clauses and §L3.Fa.2's dependency list requires a separate edit outside this job's two authorized content files.

## H02 (CBirkbeck) — answered

`TauCetiRoadmap/SchemeKTheoryOperations/README.md` at 88dbd5a still assigns multi-relative refinements to ColemanIntegration in its scope and downstream contracts, conflicting with the §2.0a ownership in `TauCetiRoadmap/MotivicEtaleKTheory/README.md` line 15. The required correction is to attribute the shared iterated restriction fibers to MotivicEtaleKTheory while preserving SchemeKTheoryOperations §2.5's vertex comparison and Coleman's exact-cube operations comparison; that sibling correction remains open and was not represented as completed here.

## H03 (CBirkbeck) — answered

The marked point specialization is already `reg_∞ = π_(p−1) ∘ ch_D,p` in `TauCetiRoadmap/MotivicEtaleKTheory/README.md` line 729, with π₁(3+4i)=4i and π₂(3+4i)=3, consistent with BorelRegulators §6.0a and the Deligne projection in BKK line 4030. ColemanIntegration §L3.Fc.1 at ae078af still constructs that complex map without importing §§7.1/7.4, so this accepted consumer-import correction remains open; its arithmetic pairings, integral-image theorem and determinants retain their existing owner.

## H04 (CBirkbeck) — applied differently

`TauCetiRoadmap/MotivicEtaleKTheory/README.md` line 727 now explicitly supplies generalized pieces on arbitrary open cubes, including special-unit localizations, and transports simultaneous kernels separately; the new Check at line 235 computes generalized/eigen dimensions 2/1 for T(e₁)=2e₁, T(e₂)=e₁+2e₂, showing precisely why equivariance alone is insufficient (Levine94 line 706 and Levine94 line 719–735). This repairs the local interface without inventing a semisimplicity theorem or claiming a counterexample on a special-unit localization; ColemanIntegration's stronger open-cube decomposition still requires the coordinated correction identified in H01.

## H05 (CBirkbeck) — applied

`TauCetiRoadmap/MotivicEtaleKTheory/README.md` line 215 changes “below weight c” to the explicit rational vanishing K_a^W(V;D)^(b)=0 for a>0 and b≤c, and explains how its weight-c face term gives injectivity and the unique supported lift (Levine94 line 795, equation (2.1), printed p.261, and Levine94 line 862–889, printed p.264). Checks at lines 228–229 compute the endpoint group as 0, the excluded a=0 group as ℚ, a nonzero weight-(c+1) unit of valuation 1, and the transverse-face restriction 1↦1 with kernel 0.

**Repair and ownership record.** Commit `83b84dfb91b8c5b462d57b390896bff8e5df7e43` changes only `TauCetiRoadmap/MotivicEtaleKTheory/README.md`; no push or external reply was made. H01–H03 and the corresponding consumer side of H04 remain unresolved; a passing local gate does not close them.

Ownership was searched by object in main fe54001, the board packages, the 32 supplied sibling checkouts and the indexed new-roadmap heads, including ColemanIntegration ae078af and SchemeKTheoryOperations 88dbd5a. Neither of those two folders exists on main, and both index entries are new roadmaps; the supplied BorelRegulators 0faed68b §6.0a and Polylogarithms 1ef12b02 §§5.2/5.9 already consume the shared constructions. The merge order places SchemeKTheoryOperations before MotivicEtaleKTheory before ColemanIntegration, so importing the shared construction back from Coleman would reverse supply; §2.0a remains the local owner and no new supplier or ownership move was added. Main-roadmap shape was compared against EtaleCohomologyFoundations, ComplexKahlerGeometry and Completed/HodgeStructures.

**Source and citation record.** Every cross-roadmap citation was resolved again against main or the available new-roadmap heads; the cited section headings and the operative SchemeKTheoryOperations §§2.5, 6.1, 6.8–6.9 contracts were inspected. The relevant Levine94 Lemma 2.1 argument is at Levine94 line 706–735, and the endpoint and lifting proof at Levine94 line 777–889; the cached scan's printed equation (2.1) visibly has ≤ although the extraction at Levine94 line 795 loses the equality stroke. No new work or source key was introduced, and the settled Bloch86/Beilinson85 uncertified and Levine98 waived references remain settled.

**Pinned APIs and signature audit.** The manifests and library heads agree at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Searches by object did not locate the face-admissible higher-Chow, supported scheme K-diagram or geometric Deligne carriers; the native `AlgebraicGeometry.AlgebraicCycle` is a locally finitely supported coefficient function without a dimension condition (Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44), and its weighted map requires quasi-compactness rather than properness (:69). The cited native cone, Dold–Kan, graded-complex, Hodge and Tate declarations were checked at their pinned files and locators; linear Hodge data and ordinary complexes do not supply the missing geometry.

`TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` remains unchanged: its module docstring identifies the missing carriers for the headline theorems, including §2.0a. Mechanical declaration enumeration finds zero definitions, instances or theorem declarations, so the list of required `#check @name` signatures is empty and there are no erased section hypotheses or elaborated types to change; the prescribed module build elaborated this unchanged acceptance file once. Adding the proof-plan vanishing lemma to Lean would require the same missing supported K-carrier rather than a simple native definition.

**Adversarial mathematics record.** Each row records an evaluated statement or defining law; these instances test the specifications and do not replace their cited proofs. “Retained” means the stated hypotheses survived these instances, not that a Lean proof was supplied.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: componentwise grading | Spec k disjoint from ℙ¹ | Degree-zero ranks (2,1), not scalar 3; codimension-one groups 0⊕ℤ | Consistent | Retained |
| Conventions: integer cohomological reindexing | p=0, a=1; p=1, a=0 | 2p−a=−1 gives zero, not cube degree 0; second value is 2 | Correct junk-degree treatment | Retained |
| Conventions: derived coefficients | ℤ/2 against ℤ/2; zero coefficient ring | Tor₁=ℤ/2 and tensor=ℤ/2; with coefficient 0 both are 0 | Underived replacement fails | Retained |
| Conventions: cube orientation | Graph Γ_t; n=0,1,2 | ∂Γ_t=[0], δΓ_t=−[0]; J=(1,−1,1) | Signs distinguished | Retained |
| Conventions: mixed differential | Bidegree (1,1) | Cross coefficients −1 and +1 sum to 0 | Square zero | Retained |
| Conventions: pair-fiber shift | 0→ℝ[0] | B¹=ℝ, every other fiber term 0; shift −1 gives degree +1 | Correct direction | Retained |
| Conventions: localization dictionary | Unit t at the origin | B[t]=+1; raw cycle connecting coefficient −1; minus raw coefficient +1 | Both directions distinguished | Retained |
| Conventions: twists and point quotient | p=1,2,3; z=3+4i | Projections 3,4i,3; added ℝ(p) projects to 0 | Quotient descends | Retained |
| Conventions: critical differential | p=1, x=z z̄ | ∂∂̄x=dz∧dz̄; d_Dx=−2dz∧dz̄ | Sign and factor fixed | Retained |
| Conventions: normal orientation | Ordered z,w disks; exchanged disks | Ordered residue +1, exchanged −1; dz/z period 2πi | Orientation fixed | Retained |
| Conventions: total product sign | (n,s)=(1,1),(0,1),(1,2) | (−1)^(ns)=−1,+1,+1 | Separate from J | Retained |
| Whitney jet extension input | Coefficients 1,1,2 at 0; transverse derivative order 2 | Derivatives 1,1,4; at y=π/2 prescribed derivative 4 | Parameter and factorial conventions fixed | Retained |
| Whitney extension nonuniqueness | Zero jet of 0 and exp(−1/x²) | All derivatives at 0 equal 0; values at 1 are 0 and e⁻¹ | Existence does not imply uniqueness | Retained |
| Real-analytic flat-ideal sum | A=∅, B=U; A=B=U | C∞=C∞+0; 0=0+0 | Boundary cases hold | Retained |
| Flat-ideal sum versus intersection | Coordinate axes, φ(x)+φ(y) | All jets at origin 0; value at (0,1) is e⁻¹, not 0 | Intersection replacement excluded | Retained |
| §1.1 normalized cycle complex | Point, p=0; graph Γ_t | C₀=ℤ, Cₙ=0 for n>0; graph boundary [0] | Degeneracies and faces distinguished | Retained |
| §1.1 dimension and multiplicity predicates | Double point; ℙ¹→point | Integral generator 1, doubled cycle 2; dimension-dropping pushforward 0 | Native cycle weights respected | Retained |
| §1.1 refined complex predicate | Γ_t; point 2; square Z | Remaining faces [0],0,[3]−[2] respectively | First is not a refined cycle; last needs refinement | Retained |
| §1.1 refined retraction | Square Z and rZ | Each zero face of rZ is ([3]−[2])−[3]+[2]=0; infinity faces 0 | Separate face vanishing obtained | Retained |
| §1.1 extra cubical map | h(x,y)=x+y−xy at x=0,y=0,x=1,y=1, also in characteristics 2,3 | Values y,x,1,1 in each characteristic | Required face identities hold | Retained |
| §1.1 normalization versus degeneracy quotient | Positive cube degree, point, p=0 | Quotient and infinity-kernel both 0; raw group ℤ | Wrong raw model excluded | Retained |
| §1.1 pushforward dimension shift | ℙ¹→point, fundamental cycle | Image dimension 0<1 gives 0, agreeing with codimension −1 term 0 | Totalized convention valid | Retained |
| §1.1 J chain and product law | n,m=1,1 | J₂=1=J₁J₁; δJ₁=(−∂)(−1)=∂=J₀∂ | Both equalities evaluated | Retained |
| §1.1 native coefficients detect equality | Double-point cycle versus reduced generator | Coefficients 2 versus 1 | Distinct elements retained | Retained |
| §1.1 refinement and restriction | Square rZ restricted to each face | Every restriction is 0 on either route | Restriction compatibility witness | Retained |
| §1.1 refined cycle criterion | Γ_t and cube point 2 | ∂₁⁰Γ_t=[0]≠0; ∂₁⁰[2]=0 | If and only if tested both ways | Retained |
| §1.2 mixed total and axes | Total degrees 0,2; fundamental cycle | Summand counts 1,3; both axis maps send 1 to 1 | Degree and axis conventions agree | Retained |
| §1.2 total-map component law | Degree 2 components (1,2,3) | Sum-map value 1+2+3=6 from both descriptions | Finite diagonal tested | Retained |
| §1.2 mixed J transport | Bidegrees (1,0),(0,1),(1,1) | Multipliers −1,+1,−1 | Simplex sign remains +1 | Retained |
| §1.3 integral axis comparisons | Point p=0 | Both H₀ maps 1↦1; positive homology groups 0 | Integral normalization tested | Retained |
| §1.3 supported comparison | Z empty or full; C=ℤ[0] | Empty fiber ℤ→ℤ has kernel=cokernel=0; full fiber H⁰=ℤ | Acyclic is not termwise zero | Retained |
| §1.3 coefficient comparison | ℤ/2 derived reduction, R=0 | Nonzero groups at −1,0 both ℤ/2; zero ring gives 0 | Derived rather than homology tensor | Retained |
| §1.4 transfer compatibility | 𝔽₂(t)/𝔽₂(t²) | Pullback-transfer composite on rank-one cycle is 2, not 1 | Inseparable degree retained | Retained |
| §1.4 components and nilpotents | Point disjoint from ℙ¹; square-zero thickening | CH⁰=ℤ², CH¹=0⊕ℤ; reduced support generator remains 1 | Neither scalar summation nor extra generators | Retained |
| §1.4 product exchange | Degrees (1,1),(0,1) | Signs −1,+1 | Odd/even cases distinguished | Retained |
| §2.0a total supported restriction fiber | n=0, full and empty support | Full K₀(k)=ℤ, [k²]=2; empty group 0 | Base and empty cases valid | Retained |
| §2.0a generalized weight definition | T(e₁)=2e₁, T(e₂)=e₁+2e₂ | (T−2)e₂=e₁≠0; (T−2)²e₂=0 | Generalized dimension 2 versus eigen dimension 1 | Added README Check |
| §2.0a vertex scalar filtration | Flag 0⊂ℚe₁⊂ℚ² with that T | T acts by 2 on each one-dimensional quotient; T−2 nonzero on total space | Filtration proves only generalized decomposition | Added distinction witness |
| §2.0a integral Adams carrier | K₀(ℚ) generator, stable η | ψ²(1)=1, ψ²[−1]=0; a spectrum map fixing 1 would retain [−1]≠0 | Unstable requirement essential | Retained |
| §2.0a relative-cycle quotient | V=𝔸², W=V(x), D=V(y) | Restriction m[W]↦m[(0,0)], zero exactly for m=0 | Raw zero-face condition tested both ways | Added Check |
| §2.0a support-local leading class | V=𝔸¹, W={0}, c=1 | Raw 1 maps to supported 1∈ℚ; forget-support value 1−1=0 | Supported and absolute groups distinguished | Retained |
| §2.0a positive-degree endpoint vanishing | V=Spec ℚ, W=V, c=b=0, a=1 | K₁(ℚ) weight 0 is 0; at a=0 the same weight is ℚ | a>0 indispensable | Explicit endpoint and Check |
| §2.0a endpoint vanishing in codimension 1 | V=𝔸¹_ℚ, W={0}, a=b=c=1 | K₁ with support, weight 1 equals field K₁ weight 0, both 0 | Equality case included | Explicit endpoint and Check |
| §2.0a upper bound on vanishing | Same support, b=c+1=2 | Field unit 2 lies in supported weight 2; its valuation is 1≠0 | Extension to b>c false | Added negative control |
| §2.0a forget-face K₁ obstruction | V=𝔸², W=V(x), D=V(y), c=1 | W∩D has codimension 1 in D; obstructing K₁ weight 1 is 0 | Endpoint kills left exact-sequence term | Added explicit argument |
| §2.0a injectivity and unique lift | Same transverse lines | Degree-zero restriction ℚ→ℚ is 1↦1; kernel 0 and relative group 0 | Zero cycle has exactly one lift | Added Check |
| §2.0a support-map naturality | Identity; support {0} enlarged to {0,1} | Supported coordinates 1↦1 and 1↦(1,0); compositions unchanged | Direction and zero coordinates fixed | Retained |
| §2.0a refined boundaries as relations | Refined boundary ∂₁⁰b; affine z=t/(t−1) | Original infinity face becomes z=1; its restriction is 0 | Relation parameter endpoint correct | Retained |
| §2.0a splitting incidence hypotheses | W={z=0} in the one-cube | Codimension in V is 1, in its zero face 0 | Wrong support excluded | Retained |
| §2.0a full-cube relativity | n=1, rank pairs (1,0),(0,1),(1,1) | Differences +1,−1,0; opposite ordering −1,+1,0 | Ordered sign fixed | Retained |
| §2.0a two-loop relativity | Symbol {u,v}, then exchange | Consecutive last-slot residue +1; exchanged value −1 | Loop exchange sign fixed | Retained |
| §2.0a Adams equivariance of relativity | Unit 2; symbol {u,v}, a=1,2 | Eigenvalues (1,2) and (1,4) on both sides | Weights 1 and 2 distinguished | Retained |
| §2.0a common-base product | Two one-cubes over Spec ℤ_(p), p=2,3 | Product degree 2; ψ²{u,v}=4{u,v}=(2[u])(2[v]) | No good-prime restriction | Retained |
| §2.0a external-product regularity | Spec ℤ[i] self-product | Dimension 1, cotangent dimension 2 at residue characteristic 2 | Product excluded by existing hypothesis | Retained |
| §2.0a integral versus rational weights | ℙ², h=1−O(−1) | ψ²h=2h−h²; ψ²h²=4h²; determinant of (1,2h+h²,h²) is 2 | Integral decomposition fails | Retained |
| §2.0a arbitrary open cubes | ℤ₃ one-cube with t=2 removed | Both face rank restrictions of 1 remain (1,1), difference 0 | Construction valid without full-cube equivalence | Retained |
| §2.0a regular versus smooth scope | L=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2,3 | Local dimension=embedding dimension=0; Ω¹=L ds≠0; rank class 1↦1 | Regular nonsmooth input retained | Retained |
| §2.0a open-cube weight adapter | Equivariant identity on the Jordan example; zero space | Generalized kernel dimension 2↦2; simultaneous kernel 1↦1; zero space 0↦0 | Adapter does not equate the kernels | Clarified downstream contract |
| §2.0b Chern operations versus character | Zero class; O(1) and O(1)⊕O(−1) on ℙ² | c₀(0)=1 but ch(0)=0; c₂(O(1))=0 versus ch₂=h²/2; for sum c₂=−h², ch₂=h² | Different operations distinguished | Retained |
| §2.0b finite-field pullback route | 𝔾_m over 𝔽₂ | Unit t has valuation 1; (𝔸¹ minus {0,1})(𝔽₂) has 0 points | Rational-point specialization cannot replace Tate pullback | Retained |
| §2.0b diagonal Chern factor | Milnor degrees 1,2,3 | Chern factors 1,−1,2; character factors after rationalization 1,1,1 | Signs and factorial tested | Retained |
| §2.0b factorial denominator | p=1,2,3 | (p−1)!=1,1,2, all nonzero in ℚ | Division legitimate | Retained |
| §2.1 geometric cycle map | Point rank 2; point divisor on ℙ¹ | Images 2 and 1−O(−1); divisor Euler characteristic 1 | Zero and inverse maps excluded | Retained |
| §2.1 disconnected and empty input | Two points, coefficients (2,1); ∅ | Map (2,1)↦(2,1); empty map 0↦0 | Component generality preserved | Retained |
| §2.1 raw versus refined input | Square Z from §1.1 | Face coefficients (+1,−1) at 3,2 before refinement; (0,0) afterward | Support-local input is defined after refinement | Retained |
| §2.2 character and weight inverse | Rank 2; O(±1) on ℙ¹; unit 2 | Values 2, 1±h, unit valuation 1; ch(O(1)⊕O(−1))=2 | Inverse and universal normalizations agree on witnesses | Retained |
| §2.2 rational weight projectors | Weights 0,1,2 for ψ² | Eigenvalues 1,2,4; pairwise differences −1,−3,−2 | Distinct-weight denominators nonzero | Retained |
| §2.2 higher ordered residue | {2,t} on 𝔾_m | Uniformizer-last residue [2] has valuation +1; native right-linear B gives valuation −1 | Degree-two adapter factor −1 needed | Retained |
| §2.3 supported comparison | Empty and full Z | 0≃0; full rank class 1↦1 in ℚ | Scope matches relative construction | Retained |
| §2.3 purity shift | Point support in 𝔸¹ | Codimension-one class has weight 1, not field rank weight 0 | No unshifted K(Z) identification | Retained |
| §2.3 cycle boundary transport | Graph Γ_t | d(Γ_t,0)=([0],t); raw class coefficient −1, B coefficient +1 | Declared minus adapter correct | Retained |
| §2.3 singular and inseparable support | Crossing axes; inseparable L; {u=0}⊂𝔸¹_L | Leading components (1,1); full rank 1↦1; divisor coefficient +1 | No extra smoothness or regular-support restriction | Retained |
| §2.3 support enlargement/pullback | Identity; {0}⊂{0,1} | 1↦1; 1↦(1,0) | Arrow direction fixed | Retained |
| §2.4 product character | Bundle ranks 2,3; ξ=1−O(−1) on ℙ¹ | ch₀ product 6=2·3; ξ²=0 and h²=0 | Multiplicativity witnesses agree | Retained |
| §2.4 leading class may vanish | Origin in 𝔸¹ | Resolved class 1−1=0; Chow divisor div(t)=0 | Leading-class equality 0=0 allowed | Retained |
| §2.4 positive-degree Newton coefficient | p=1,2,3 | Factors 1,−1,1/2 | Sign is not an integral factorial inversion | Retained |
| §3.1 logarithmic image algebra | Punctured disk; empty boundary; empty scheme | d log∣z∣²=dz/z+dz̄/z̄; empty-boundary algebra=smooth forms; empty groups 0 | Image and conjugate terms fixed | Retained |
| §3.1 injectivity and wrong growth model | log∣z∣² versus ∣z∣⁻² | First has admitted logarithmic growth; second has pole order 2 | Arbitrary-pole replacement excluded | Retained |
| §3.1 pullback and residue order | Identity; ordered and exchanged dlogs | Pullback coefficient 1; residues +1,−1 | Naturality and sign witness | Retained |
| §3.2 filtered geometric comparison | 𝔾_m, dlog z; point | W-index 1 plus cohomological degree 1 gives weight 2; point weight 0 | Shift required | Retained |
| §3.2 compactification refinement | Blowup of boundary crossing of (ℙ¹)² | H⁰,H¹,H² dimensions (1,2,1) on both sides; periods unchanged | Unshifted residue diagrams need not agree | Retained |
| §3.2 monomial division | f=exp(−1/∣z∣²), divide by z² | All jets at 0 vanish; value at 1=e⁻¹; for f=1, pole at 0 | Flatness essential | Retained |
| §3.2 logarithmic flat extension | Same f; two-variable f log∣z∣²/(z w̄) | Jets at boundary 0; at (−2,1) value −e⁻¹ᐟ⁴ log(4)/2 | Actual denominator and extension fixed | Retained |
| §3.3 Deligne cone and small model | Point, p=0,1,−1 | (H⁰,H¹)=(ℝ,0),(0,ℝ),(ℝ(−1),0) | Negative twists retained | Retained |
| §3.3 deformation retract | Point, p=1; log 2+iθ | Projection-inclusion returns real coordinate log 2; complementary difference iθ | One composite equality, other homotopy | Retained |
| §3.3 cone arrow transport | z=3+4i, p=1,2,3 | Raw negated values −3,−4i,−3; transported coordinates 3,4i,3 | Sign changes must include marking | Retained |
| §3.3 critical differential law | p=1, x=∣z∣² | Output −2dz∧dz̄ in degree 2, not ordinary dx in degree 1 | Critical degree jump fixed | Retained |
| §3.3 shift scope | Point complex shifted by 1 | Only total degree −1 remains; one-dimensional conjugation-stable integral type would require 2r=−1 | No arbitrary shifted Dolbeault claim | Retained |
| §3.3 exactness and zero object | Zero Dolbeault complex | Cone, small complex, both maps and homotopy all 0 | Degenerate case consistent | Retained |
| §3.4 Zariski logarithmic realization | 𝔸¹, p=1, Re z | Retained H¹=ℝ constants; Re z takes 0,1 at 0,1 but has disallowed pole growth | Analytic sheafification replacement excluded | Retained |
| §3.4 refinement pullback | x=e,y=eu boundary chart | Pullback log∣x∣=log∣e∣; at (2,3) value log 2 on both sides | Coordinate, not unmarked class, transported | Retained |
| §3.4 cocycle and product periods | Torus before/after boundary blowup | dlog periods (2πi,0),(0,2πi); product (2πi)² | Two-choice witnesses compatible with composition | Retained |
| §3.4 finite disjoint unions and empty open | Point disjoint from ℙ¹; restriction to ∅ | H_D⁰ weight 0=ℝ²; restriction target 0 | Components and empty value fixed | Retained |
| §4.1 odd critical product | f=2,g=t on 𝔾_m | Product i log 2 darg t; exchange gives its negative; period 2πi log 2 | Four-term sign and twist fixed | Retained |
| §4.1 unit conditionality | tℝ[t] versus ℝ[t] | For e∈tℝ[t], coefficient of t in et=0 versus t coefficient 1; in ℝ[t], 1·t=t | Nonunital domain admitted | Retained |
| §4.1 differential Leibniz | x=∣z∣²,y=1, p=q=1 | Product −z̄ dz+z dz̄; d_D product=−2dz∧dz̄=d_Dx•1 | Critical formulas compatible | Retained |
| §4.1 zero odd point product | Point logarithms log 2,log 3 | Both derivative terms vanish, product 0; weight-zero unit times log 2=log 2 | Zero product is degree-specific | Retained |
| §4.2 associativity and homotopy | Even critical x=Re z, y=2,z=3 | Both bracketings 6 Re z, value 6 at z=1; associator 0 and homotopy 0 | Closedness not required here | Retained |
| §4.2 odd and nonunital cases | Three point logarithms; t in tℝ[t] | Both point bracketings 0; both nonunital bracketings t³ | Associativity without unit valid | Retained |
| §4.2 orientation under product comparison | Ordered/exchanged two circles | Periods (2πi)² and −(2πi)² in both compactifications | Exchange sign retained | Retained |
| §5.1 support fiber and cocycle condition | Identity restriction; 0→ℝ[0] | Identity fiber has H=0; second fiber has H¹=ℝ; d² second coordinate res(dω)−d(res ω−dg)=0 | Shift, zero and cocycle equations agree | Retained |
| §5.1 enlargement and forget-support | {0}⊂{0,1} | r↦(r,0); forget-support composites have same first coordinate | Arrow direction correct | Retained |
| §5.1 product support | Disjoint divisors x=0,x=1 | Intersection ∅, product cohomology class 0 | Wrong union support excluded | Retained |
| §5.1 raw connecting map | Closed open form b=log∣t∣ | Pair (0,b) has coefficient −1 at origin | Raw versus positive valuation distinguished | Retained |
| §5.2 support semipurity | Axes, cusp, origin in 𝔸² | Degree-2 groups ℝ²,ℝ,0 for p=1; origin degree 4 gives ℝ for p=2 | Codimension, not smooth support, governs result | Retained |
| §5.2 codimension hypothesis | Point with full support, p=1; p=0 | H¹(point,ℝ(1))=ℝ≠0, violates premise; weight-zero H⁰=ℝ | Hypothesis cannot be deleted | Retained |
| §5.2 component coordinates iff | Multiplicities (1,1),(0,0); double divisor | Coordinates identical to multiplicities; zero iff both 0; doubled coefficient 2 | Both directions and multiplicity tested | Retained |
| §5.2 supported intersection product | V(x),V(y); 2V(x),V(y) | Local lengths 1,2; resulting origin coordinates 1,2 | No missing multiplicities | Retained |
| §5.2 normalized current criterion | f=t on 𝔸¹, d=p=1 | Form factor (2πi)⁻¹; point factor 1; (0,−log∣t∣) coefficient +1, opposite log coefficient −1 | Sign and Tate normalization fixed | Retained |
| §5.3 support colimit and normalization | Point p=0; finite-union support | H₀=ℝ, positive normalized cycle degrees 0; enlargement 1↦(1,0) | Correct colimit directions | Retained |
| §5.3 auxiliary total differential | (r,n)=(2p,1),(2p−1,1) | Total degree 2p−1 first case; cube coefficients +1,−1 | Totalization fixed | Retained |
| §5.3 good truncation | ω=Re(z₁)dz₂∧dz̄₂ on ℂ² | dω on (∂x₁,∂x₂,∂y₂)=−2i≠0 | ω excluded from truncated degree 2 | Retained |
| §5.3 empty-support contribution | Point p=1,n=0 | Pair cochains ℝ→ℝ by 1 in degrees 1,2; ker=0,coker=0 | Nonzero cochains, zero cohomology | Retained |
| §5.3 maps to top support classes | Origin cycle and its double | Projected top classes 1,2; forget-support absolute classes 0,0 on 𝔸¹ | Projection distinct from forgetting support | Retained |
| §5.3 J transport of diagram | Cube degree 1 | J₀∂=∂=δJ₁; J₁d_D=d_DJ₁ | Whole diagram sign transported | Retained |
| §5.4 cycle-class isomorphism | Origin and doubled origin | Cycle coefficients 1,2 map to support coordinates 1,2 | Zero and rescaled maps excluded | Retained |
| §5.4 supported projection quasi-isomorphism | Empty-support two-term column | H¹=H²=0, matching projected class group 0 | Strict-zero substitution unnecessary | Retained |
| §5.4 affine contraction | Point→𝔸¹, p=0,1 | H_D⁰ weight 0: ℝ→ℝ, 1↦1; H_D¹ weight 1 same; positive normalized column H=0 | Algebraic affine invariance witness | Retained |
| §5.4 product diagram sign | n=s=1; n=0 or s=2 | Multipliers −1,+1 | Leibniz sign separate from orientation | Retained |
| §6.1 specified regulator roof | Point rank m; zero cycle; ℙ¹ O(±1) | Values m,0 and normalized integrals ±1; shift sign (−1)^(2p)=+1 | Roof normalization fixed | Retained |
| §6.1 lift independence and integral source | Torsion units −1,i; empty input | Values 0,0 and 0; unit 2 gives log 2≠0 | Torsion kills without zeroing regulator | Retained |
| §6.2 fiber-map homotopy sign | A=ℤ[0], B=0, B′=(ℤ→ℤ), r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong (1,−1) gives (0,2) | Plus homotopy term forced | Retained |
| §6.2 empty/full supported realization | Z=∅,X | Empty map cohomology 0→0; full rank map 1↦1 | Consistent with absolute roof | Retained |
| §6.2 supported divisor map | Unit t and negative Green representative | Raw logarithm boundary coefficient −1; (0,−log∣t∣) coefficient +1 | Signs retained through regulator | Retained |
| §6.3 arbitrary smooth pullback | Point→ℙ¹ applied to c₁O(1) | Chow and Deligne outputs both 0 | Raw incidence pullback need not exist | Retained |
| §6.3 embeddings | Unit 2 through ℚ→ℝ→ℂ and ℚ→ℂ | Both outputs log 2 | Compatible embedding scope witnessed | Retained |
| §6.3 cube/simplex model independence | Point generator; cube degrees 1,2 | Degree-zero values 1,1; transported multipliers −1,+1 on source and target | Same realization, marked signs | Retained |
| §7.1 independent character and exponential class | 2e^(iθ),i; logarithm branch shift 2πi | Real values log 2,0; branch difference projects to 0 | Marked character fixed | Retained |
| §7.1 degree-zero geometric Chern agreement | O(a) on ℙ¹, a=−1,0,1 | Character 1+a h_D; normalized top integrals −1,0,1 | Orientation and scaling fixed | Retained |
| §7.1 additivity/product unit | Zero K-class and trivial line | Character 0 and 1 respectively; product with 1 fixes log 2 | Nonzero character and unit distinguished | Retained |
| §7.1 Dold–Kan scope | Constant ℤ; constant S₃ | π₀=H₀=ℤ, positive groups 0; S₃ has nonabelian π₀ of order 6 | Abelian hypothesis essential | Retained |
| §7.2 Beilinson equality | Rank 2; [O_point] on ℙ¹; unit 2,−1 | Both maps yield 2, normalized 1, log 2,0 | Degree-zero and positive-degree normalization agree | Retained |
| §7.2 restriction-fiber equality | Full/empty support; t at origin | Absolute value 1, empty 0; raw boundary coefficient −1 on both sides | Diagram signs agree | Retained |
| §7.3 integral-source multiplicativity | Units 2,t; units 2,3 at point | Ordered form i log 2 darg t, reverse negative; point product 0 | Odd sign retained on integral source | Retained |
| §7.3 unit/zero/product multiplicity | Weight-zero unit, zero factor; rulings on ℙ¹×ℙ¹ | Unit preserves log 2; zero gives 0; ruling products integrate to 1 and 2 after doubling | Product scales correctly | Retained |
| §7.4 logarithm law | u=2,v=3; 1,i,1/2 | log 6=log 2+log 3; values 0,0,−log 2 | Unit, torsion and inverse cases distinguished | Retained |
| §7.4 curve product representative | Constant 2 and t | i log 2 darg t; positive period 2πi log 2 | Factor i required by twist | Retained |
| §7.4 projective and Green signs | a=−1,0,1; rational t^a | Chern integrals −1,0,1; Green −a log∣t∣ yields divisor coefficient a | Separate positive unit and negative Green signs | Retained |
| Coleman relative adapter ownership and signs | One-cube comparison; two loop exchange | Zero-minus-infinity outputs +1,−1; exchange −1 | Local interface agrees; duplicate external construction persists | H01 remains open externally |
| SchemeKTheoryOperations ownership boundary | Ordinary vertex versus iterated fiber | Vertex field rank 1; one-cube relative unit [2] has valuation 1 in K₁, not rank group | Different stage of construction required | H02 remains open externally |
| Coleman marked complex regulator | z=3+4i, p=2,3 | π₁(z)=4i, π₂(z)=3; adding real/imaginary kernel changes value by 0 | Point specialization mathematically determined | H03 remains open externally |
| Borel/Polylogarithms interfaces | Opposite cone arrows; J₁,J₂ | Negated third coordinate plus negated marking restores 3,4i; cycle factors −1,+1 | Their supplied-head imports agree | Retained |

**Build outcome.** `lake build TauCetiRoadmap.MotivicEtaleKTheory.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (10s)
Build completed successfully (8976 jobs).
```

**Dependency direction.** The prescribed movable dependency check exited 0, with no UPWARD or CYCLE line:

```text
depcheck: 33 roadmaps, 305 edges, 0 problem(s)
```

**Gate outcome.** The prescribed gate against origin/main exited 0 after the commit; the worktree is clean. Exact summary:

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
