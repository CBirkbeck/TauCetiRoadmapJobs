<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1047#issuecomment-6378140121 -->
Review (codex) of 18a7b4d

Verdict: needs_changes

1. **F01** (P2) The abstract Dolbeault product needs a conditional unit assertion

   **Location:** packages/MotivicEtaleKTheory/README.md:422,429,442. The API says “The closed constant 1 in D⁰(A,0) is a two-sided unit.”

   **Claim:** Every real Dolbeault algebra in the cited generality has this unit, and its Deligne cohomology is unital.

   **Witness:** BKK line 4121–4128, Definition 5.13, pp.113–114, does not require a unit. Take A=tℝ[t] in type (0,0), d=0. For every e∈A, the t-coefficient of et is 0; that of t is 1.

   **Exact repair:** Keep the product and associativity assertions for general Dolbeault algebras. Make the unit conclusion conditional on a specified multiplicative identity in A⁰,⁰, preserved by the relevant algebra maps. State that the geometric logarithmic algebras have their constant unit. Apply the same qualification to the abstract cohomology-ring conclusion in §4.2. Add the nonunital ideal as a negative-control Check. On tℝ[t], the repaired statement still supplies multiplication but asserts no unit; on ℝ[t], 1·t=t verifies the unit clause. A zero algebra does not detect this omission.

2. **F02** (P1) BorelRegulators still owns the same general Deligne construction

   **Location:** packages/MotivicEtaleKTheory/README.md:7,13,391,617,694. The scope calls BorelRegulators “the consumer direction”.

   **Claim:** This package is the single owner of compactification-independent real Deligne cohomology and the universal Deligne Chern character; BorelRegulators only specializes them arithmetically.

   **Witness:** TauCetiRoadmap/BorelRegulators/README.md:724,726 at head e39a3c4 constructs both objects for smooth varieties, including arbitrary twists and classifying-space evaluation. Its line 13 expressly claims ownership. These are not restricted number-field constructions.

   **Exact repair:** Reconcile the two roadmaps at their heads. Keep the general logarithmic/Deligne construction and universal character here, the earlier owner (merge-order positions 87 and 167). Replace BorelRegulators §6.0a's duplicate constructions with imports of §§3.3–3.4, 4.1–4.2 and 7.1 here; retain its topological calibration, conjugation/transfer interfaces, infinitesimal comparison and arithmetic theorems as additional targets. Record the ownership transfer explicitly in the scope contracts. Do not add an upward supplier edge here. This requires a coordinated consumer change, not merely an assertion in this README that the consumer already imports it.

   **Repair test:** Borel's arrow r−f is identified with this package's f−r by (r,f,ω)↦(r,f,−ω). For a point at weight 1 both give H¹=ℂ/iℝ and the same real-part coordinate; at weights 2 and 3 the quotient lines are iℝ and ℝ. Thus the opposite cone convention does not distinguish two owned theories.

3. **F03** (P1) The cube K-theory ownership transfer is not reflected in ColemanIntegration

   **Location:** packages/MotivicEtaleKTheory/README.md:13,200,208,692. The scope says the shared construction “supplies ColemanIntegration §L3.Fa.2”.

   **Claim:** ColemanIntegration imports the common cube carrier and ordered relativity equivalence from this package.

   **Witness:** TauCetiRoadmap/ColemanIntegration/README.md:2435,2437–2440 at head ae078af constructs cubeRelK and relativityIso itself; its Needs at 2446 is L3.Fa.1. TauCetiRoadmap/SchemeKTheoryOperations/README.md:2403 at 88dbd5a also assigns multi-relative constructions to ColemanIntegration.

   **Exact repair:** Complete the move to §2.0a here, preserving its supported, common-base and general regular-base statements. ColemanIntegration should import that carrier, its ordered equivalence and operations, then retain special-unit localization, its spectral sequence, injectivity results and symbols. Correct SchemeKTheoryOperations' downstream ownership sentence accordingly. Retain the one-way supply from position 87 to position 155; an upward import is not a repair. The companion changes must exist before the claimed single-owner arrangement is ready.

   **Repair test:** At one full cube over ℚ, both constructions use (a,b)↦a−b: (1,0)↦1 and (0,1)↦−1, with K₀ of the relative cube identified with K₁(ℚ). The proposed import preserves these values and the same class of the unit 2. Adding arbitrary supports is a legitimate extension, but does not give the shared full-cube construction two owners.

4. **F04** (P1) Polylogarithms reconstructs the claimed shared auxiliary complexes

   **Location:** packages/MotivicEtaleKTheory/README.md:13,510,512,690. The scope says “Polylogarithms §5.2 imports them.”

   **Claim:** Aₚ, Aₚ,S and Hₚ, with their projection and forget-support arrows, have one owner here; Polylogarithms only adds D_AH, β and concrete adapters.

   **Witness:** TauCetiRoadmap/Polylogarithms/README.md:834 at head 4696a1a constructs D_A, D_A,Z, Hᵖ, g₁ and ρ. Lines 826–843 also reconstruct the abstract supported regulator rather than explicitly importing §6.2's map.

   **Exact repair:** At the consumer head replace those shared constructions by imports of §§5.1–5.4 and 6.1–6.3, transported through the stated Jₙ orientation. Keep its genuinely additional D_AH differential, β, full current dictionary and concrete current/cone comparison. Resolve its old Layer 4/§9.1/§12.2 labels to the actual sections using this package's mapping at lines 702–708. Record the ownership move here without claiming that the unchanged consumer already performs it.

   **Repair test:** At cube degrees 0,1,2 the transport is 1,−1,1. On bidegree (r,−1), J₀∂□=∂□ and δJ₁=(−∂□)(−1)=∂□. The two total complexes therefore agree after transport; a changed differential is not a distinct auxiliary construction. D_AH and β remain additional objects, so the repair does not delete the consumer's comparison theory.

5. **F05** (P3) Give the exact locator for the normalized form-current pairing

   **Location:** packages/MotivicEtaleKTheory/README.md:488. The pairing (2πi)⁻ᵈ∫η∧α is followed by a citation to BKK §5.6, pp.132–133.

   **Claim:** That locator specifies both the form-current and cycle-current normalization used in the iff criterion.

   **Witness:** The form-current definition is BKK line 4395–4408, equation (5.38), p.122. The cycle-current definition is BKK line 4450–4462, Definition 5.41, p.123. Proposition 5.58 at line 4841 uses those previously fixed conventions.

   **Exact repair:** Add these two locators immediately to the normalization sentence, retaining Proposition 5.58 for the iff criterion. No formula changes. For d=p=1 the factors are (2πi)⁻¹ on forms and 1 on the point current; the normalized identity remains d_D[−log abs t]=−δ₀.

Five findings: three P1 ownership conflicts, one P2 missing hypothesis, and one P3 locator correction. The mathematical scope can be retained; rejection and replanning are unnecessary. No earlier review or settled repair finding applies. The four author files were left unchanged.

## Verified sound

The review covered all 27 numbered target sections, their API bullets, the conventions, both supplier-gap contracts, and all README Checks. There are seven layers, each with Examples and Dependencies, and 27 target-specific Needs lines. The seeded sample has 15 targets; the source table below records what supports each one and the limits of the available text. The 126 adversarial rows record concrete values, not a claim that elaboration proves the mathematics.

The algebraic theory retains every field and integral cycle coefficients; realization explicitly requires an embedding into ℂ. Finite-field descent uses coprime degrees, not division by the characteristic. Singular supports, nilpotent cycle invariance, disconnected dimensions, integer reindexing, zero coefficients and negative Deligne twists are all retained. No computational algorithm, copied source passage, route-specific prime restriction, sorry'd data or set_option was found in the package. Ordinary K-theory, simplicial higher cycles, linear Hodge structures, analytic currents and geometric Chern classes are named imports rather than new carriers. The ownership conflicts R02–R04 remain blocking despite the correct intended direction.

### Adversarial computation record

In this table, P denotes a point, h the positive hyperplane class, and dz dbarz denotes the wedge product. “Pass” means the computed instance agrees with the assertion; universal source support and unread portions are recorded separately. A numbered API row refers to its bullet in the stated subsection. The repeated values deliberately check the same convention at every layer that uses it. All computations were made in the stated carriers, not in a stand-in Lean theorem.

| Statement and location | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Conventions: universe and components, 17 | Empty scheme; P⊔ℙ¹ | Components 0 and 2; CH⁰(P⊔ℙ¹)=ℤ², CH¹=0⊕ℤ | Pass; a single rank 3 loses (2,1) |
| Conventions: degree, 19 | p=0, a=1; p=1, a=1 | Homological degrees −1 and 1; groups 0 and k× | Pass; natural subtraction would incorrectly use degree 0 |
| Conventions: coefficients, 19 | ℤ/2⊗ᴸℤ/2; R=0 | Reduction of [ℤ --2→ ℤ] is [ℤ/2 --0→ ℤ/2]; H⁻¹=H⁰=ℤ/2; R=0 gives 0 | Pass |
| Conventions: cube sign, 21 | n=0,1,2; graph t | J=(1,−1,1); ∂Γ_t=[0], δΓ_t=−[0]; J₀∂Γ=δJ₁Γ=[0] | Pass |
| Conventions: mixed square, 21 | (n,m)=(1,1) | Cross coefficients −1,+1 sum to 0 | Pass |
| Conventions: fiber and boundary, 23 | A=0, B=ℝ[0]; (𝔸¹,{0}) | fib has H¹=ℝ; d(Γ_t,0)=([0],t), so raw(t)=−[0], −raw(t)=+[0] | Pass |
| Conventions: Tate and critical differential, 25 | p=−1,0,1; x=z barz | ℝ(−1)=iℝ, ℝ(0)=ℝ, ℝ(1)=iℝ; d_Dx=−2 dz dbarz | Pass; 2πi≠0 |
| Conventions: orientation and totalization, 27 | Ordered two disks; n=s=1 | Residues +1 and −1 after exchange; product sign −1; circle period of i log 2 darg t is 2πi log 2 | Pass |
| Whitney gap: extension, 83 | Jet at 0 with coefficients 1,1,2 | Required derivatives (1,1,4); f=1+x+2x² has these values | Pass |
| Whitney gap: arbitrary order and parameters, 83 | Coefficients n!; normal derivative m=2 at y=π/2 | Derivatives (n!)²; required transverse value 4 sin(π/2)=4 | Pass; analytic radius is 0 for n! |
| Whitney gap: degeneracy and uniqueness, 89 | A=∅, A=U; 0 and exp(−1/x²) at 0 | Empty jet imposes 0 conditions; full-set extension equals f; both jets are 0 but values at 1 are 0 and e⁻¹ | Pass; uniqueness is correctly excluded |
| Flat-ideal gap: equality, 91 | A=B={0}; A=∅,B=U; A=B=U | I=I+I; C∞=C∞+0; 0=0+0 | Pass |
| Flat-ideal gap: sum versus intersection, 97 | Coordinate axes, φ(x)+φ(y) | Jets at (0,0) are 0; value at (0,1)=e⁻¹, whereas every element of I(A)∩I(B) vanishes there | Pass; excludes the wrong intersection |
| 1.1 definition, 119 | P, p=0, n=0,1,2 | Raw groups ℤ,ℤ,ℤ; infinity kernels give ℤ,0,0, matching degeneracy quotients | Pass |
| 1.1 API 1, 125 | Normalization of degree-one constant cube | Infinity face sends 1↦1, so kernel=0; degeneracy quotient ℤ/ℤ=0 | Pass |
| 1.1 API 2, 126 | ℙ¹→P; inseparable extension degree 2 | Fundamental one-cycle pushes to 0; pullback/transfer on CH⁰ sends 1↦2 | Pass; dimensions and generic lengths matter |
| 1.1 API 3, 127 | Degrees 1+1 and 1+2 | J₂=1=(−1)(−1); J₃=−1=(−1)(1) | Pass |
| 1.1 API 4, 128 | Reduced and double point; p=−1 | Generator coefficient 1 versus multiplicity 2; negative-codimension group 0 | Pass; support alone does not encode multiplicity |
| 1.2 definition, 142 | Total degree N=0,2 | Diagonals contain 1 and 3 summands; in (1,1), d² cross term is −T+T=0 | Pass |
| 1.2 API 1, 148 | Both axes at (0,0) | [V]↦[V] with coefficient 1 on each axis | Pass |
| 1.2 API 2, 149 | Three summands in degree 2 | Component values (2,3,5) determine total image 2+3+5=10; zero components give 0 | Pass |
| 1.2 API 3, 150 | Bidegrees (1,0),(0,1),(1,1) | Multipliers −1,+1,−1; (−1)ⁿ⁺ᵐ would give −1 on the simplex axis | Pass |
| 1.3 absolute comparison, 162 | P over 𝔽₂, p=0 | Both H₀=ℤ, higher H=0; comparison 1↦1 | Pass integrally |
| 1.3 support comparison, 162 | Z=∅ and Z=X | fib(id)=0 on both sides; fib(C→0)=C on both sides | Pass |
| 1.3 coefficient comparison, 162 | Multiplication-by-2 resolution; R=0 | Both sides retain ℤ/2 in degrees −1,0; both become 0 for R=0 | Pass |
| 1.4 direct maps, 176 | 𝔽₂(t)/𝔽₂(t²) | Degree 2, and res then transfer sends 1 to 2 on both cycle models | Pass; inseparability does not change the degree formula |
| 1.4 smooth products/pullbacks, 176 | Degrees (1,1),(0,1); P⊔ℙ¹ | Exchange factors −1,+1; CH¹=0⊕ℤ and CH⁰=ℤ² on both sides | Pass |
| 1.4 support/orientation transport, 176 | Identity; square-zero thickening | Identity coefficient +1; reduced and thickened cycle generators both ℤ | Pass; no K-theory nil-invariance is inferred |
| 2.0a definition, 200 | n=0, full/empty support over k | K₀(k)=ℤ, [k²]=2; empty support=0 | Pass; R03 ownership remains |
| 2.0a generalized weights, 200–202 | L=[[2,1],[0,2]] on ℚ² | (L−2I)e₂=e₁≠0, (L−2I)²=0; generalized piece ℚ², eigenspace ℚe₁ | Pass; generalized is not silently replaced by ordinary |
| 2.0a rationality, 216 | K₀(ℙ²), h³=0 | ψ²h=2h−h²; ψ²(2h+h²)=2(2h+h²), ψ²h²=4h²; eigenlattice determinant 2 | Pass; integral direct sum would fail |
| 2.0a API 1, 206 | n=0; support ∅⊂X | Groups 0→K₀(X), 0↦0; full support rank-two class maps to 2 | Pass |
| 2.0a API 2, 207 | Two unit loops over ℤ_(2), ℤ_(3) | ψ²[u]·ψ²[v]=(2[u])(2[v])=4{u,v}=ψ²{u,v} | Pass on the stated common base |
| 2.0a external domain, 217 | ℤ[i]⊗ℤℤ[i] at ramified point | Relation v(v+2i)=0; local dimension 1, cotangent dimension 2; common-base cube stays regular | Pass; singular external product excluded |
| 2.0a API 3, 208 | n=1 over ℚ and ℤ_p | Difference (1,0)↦1, (0,1)↦−1, (1,1)↦0; K₀(relative)=K₁(base) | Pass at p=2,3 as well |
| 2.0a ordered double loop, 214 | {u,v} over ℚ(u,v) | Two last-slot residues +1; swapped loop −1; ψ² multiplier 4, ψ¹ multiplier 1 | Pass |
| 2.0a open non-full cube, 215 | Remove t=2 over ℤ₃ | Induced face ranks of O are (1,1); difference 0; no full-cube equivalence asserted for this Y | Pass |
| 2.0b definition, 223 | Zero K-class; unit 2 | c₀,₀(0)=1 but ch(0)=0; c₁,₁[2]=[2] has valuation 1 | Pass; universal all-field source remains uncertified |
| 2.0b API 1, 227 | O(1)⊕O(−1) on ℙ² | (1+h)(1−h)=1−h²; c₂=−h², not c₂(O(1))+c₂(O(−1))=0 | Pass; degree-zero Chern is not additive |
| 2.0b API 2, 228 | Diagonal degrees 1,2,3 | (−1)ⁿ⁻¹(n−1)! gives 1,−1,2, the supplier's coefficients | Pass |
| 2.0b API 3, 229 | Same three degrees; line on ℙ² | Character coefficients 1,−1,1/2 cancel 1,−1,2 to 1,1,1; ch₂(O(1))=h²/2 versus c₂=0 | Pass; factorial denominators 1,1,2≠0 |
| 2.1 construction, 241 | P, ℙ¹, empty, two points | ch(k²)=2; ch(O(±1))=1±h; empty=0; ranks (2,1) retained | Pass; finite weight support |
| 2.1 API, 247 | Addition O(1)+O(−1); unit 2 | Character 2, versus total Chern 1; valuation of ch₁,₁[2] is 1 | Pass; excludes zero in positive degree |
| 2.2 isomorphism and Adams, 260 | Weights 0,1,2; a=1,2 | ψ² eigenvalues 1,2,4; differences −1,−3,−2; ψ¹ acts by 1 | Pass; distinct projector denominators nonzero |
| 2.2 universal-class equality, 264,268 | O_point on ℙ¹; unit 2 | Both leading classes h; both degree-one classes [2], valuation 1 | Pass instances; all-field proof text unread |
| 2.2 degree-two sign, 276 | {2,t}, t-adic boundary | Last-slot residue [2], valuation 1; native right boundary −[2], valuation −1; adapter −B restores +[2] | Pass; same sign as K supplier |
| 2.3 supported construction, 282 | ∅, X, nodal divisor V(xy) | 0≃0; absolute comparison; leading coordinates (1,1) on two components | Pass; singular K(Z) not substituted |
| 2.3 API 1, 288 | {0}⊂{0,1} in 𝔸¹; identity | Coefficient 1↦(1,0); identity 1↦1 | Pass |
| 2.3 API 2, 289 | Lift Γ_t | d(Γ_t,0)=([0],t); raw boundary −[0], B[t]=+[O₀], so ch B=−δ_raw ch | Pass |
| 2.4 higher products, 301 | Ranks 2,3; ξ=1−O(−1) on ℙ¹ | Rank product 6=2·3; ch(ξ²)=0=h²=ch(ξ)² | Pass |
| 2.4 degree zero, 301 | O(a), O_point | ch(O(a))=1+ah on ℙ¹; 1−exp(−h)=h, leading coefficient +1 | Pass; imported map is compared |
| 2.4 higher Newton coefficient, 301–303 | p=1,2,3, n>0 | 1,−1,1/2; specifically ch₂,₂=−c₂,₂ | Pass |
| 3.1 definition and chart independence, 326–328 | z↦2z; z↦z² | Logarithms change by log 4 and multiply by 2 respectively; logarithmic derivatives change by 0 and multiply by 2 | Pass; generated image fixes the actual subalgebra |
| 3.1 API 1, 332 | log abs(z)²; z barz | d log abs(z)²=dz/z+dbarz/barz; ∂∂̄(z barz)=dz dbarz and ∂̄∂(z barz)=−dz dbarz | Pass; anticommutator 0 |
| 3.1 API 2, 333 | Identity; power maps 2 then 3 | dlog maps to dlog and 6 dlog, respectively; composite power 6 also gives 6 dlog | Pass |
| 3.1 API 3, 334 | Empty boundary; empty W; z=e⁻ᴺ on punctured disk | Native smooth algebra; zero algebra; log abs(z)²=−2N whereas abs(z)⁻²=e²ᴺ | Pass; no arbitrary-pole scalar is introduced |
| 3.1 orientation, 338,341 | Circle; ordered two-disk residue | Integral 2πi; residues 1 and −1 on exchanging the disks | Pass |
| 3.2 comparison and weight, 347 | Point; 𝔾ₘ | Point weight 0; H¹(𝔾ₘ) has residue degree 1 plus cohomological degree 1, hence weight 2 and type (1,1) | Pass; unshifted weight would be 1 |
| 3.2 degenerations and refinement, 347 | Boundary blowup of (ℙ¹)² compactifying 𝔾ₘ² | Betti dimensions (1,2,1) stay (1,2,1); boundary-component count changes 4→5 | Pass; F comparison does not assert invariant residue graded complexes |
| 3.2 local estimates/API 1, 349,353 | f=exp(−1/abs(z)²), extended by 0; f=1 | All jets of f/z² at 0 are 0; value at 1 is e⁻¹. For f=1, 1/z² diverges | Pass; flatness is essential |
| 3.2 local estimates/API 2, 349,354 | exp(−1/abs(zw)²) log abs(z)²/(z barw) | All axis jets are 0; value at (−2,1) is −e⁻¹ᐟ⁴ log 4/2; all exponents 0 recover f | Pass; simultaneous flatness handles the combined expression |
| 3.3 cone and small model, 369 | Point, p=0,1,−1 | (H⁰,H¹)=(ℝ,0),(0,ℝ),(ℝ(−1),0), respectively, in both models | Pass; negative twists retained |
| 3.3 comparison maps/API 1, 371,375 | Point, p=1; A=0 | Projection-inclusion sends r↦r; other composite sends log 2+iθ↦log 2, difference iθ is a cone boundary; A=0 gives 0 | Pass; strict equality only in the stated order |
| 3.3 shifts and sums, 375 | A=ℂ[0]; direct sum of two points | Ordinary A[1] has degree −1; no integer r with 2r=−1; two points give H¹=ℝ² | Pass; no nonexistent shifted Dolbeault structure |
| 3.3 exactness/API 2, 376 | Split sequence ℝ→ℝ²→ℝ in type (0,0), p=1 | Deligne H¹ dimensions 1→2→1; maps a↦(a,0), (a,b)↦b; kernel=image=ℝ×0 | Pass |
| 3.3 differential/API 3, 377 | p=1, x=z barz; constant x=1 | −2∂∂̄x=−2 dz dbarz; constant gives 0; ordinary degrees 0→2 | Pass |
| 3.4 definition and API 1, 391,397 | Identity refinement; torus blowup | Point class 1↦1; two loop periods (2πi,0),(0,2πi) stay fixed and three-choice composites preserve both | Pass; R02 ownership remains |
| 3.4 pullback/API 2, 398 | t↦t² followed by t↦t³ | Period multiplier 2·3=6 agrees with composite t⁶; identity multiplier 1 | Pass |
| 3.4 descent/API 3, 399 | Cover of P by P,P; empty; P⊔ℙ¹ | Equalizer of (a,b)↦a−b is diagonal ℝ; empty gives 0; disjoint union H⁰=ℝ² | Pass |
| 3.4 colimit/API 4, 400 | Two copies of identity compactification | Both send 1↦1; compatible pairs (r,r) determine the same value r after sheafification or skeleton replacement | Pass; does not identify every presheaf section with a sheaf section |
| 4.1 low-low branch, 422 | x=log 2, y=log abs(t), weights 1,1 | Product i log 2 darg t; reverse −i log 2 darg t; circle periods ±2πi log 2 | Pass |
| 4.1 mixed branch below cutoff, 422 | x=z barz in D¹(1), y=dw dbarw in D²(1) | Product z barz dw dbarw; both sides of Leibniz equal −2 dz dbarz dw dbarw | Pass |
| 4.1 mixed branch above cutoff, 422 | Same x; y=i dw dbarw in D²(0) | Product i(barz dz−z dbarz)dw dbarw; both differentials −2i dz dbarz dw dbarw | Pass |
| 4.1 high-high branch, 422 | dz dbarz and dw dbarw in D²(1) | Product dz dbarz dw dbarw; reversed product the same, both differentials 0 | Pass |
| 4.1 Leibniz/API 1, 428 | x=z barz, y=w barw in D¹(1) | Both sides equal −2 abs(w)² dz dbarz+2 abs(z)² dw dbarw | Pass; both inputs may be nonclosed |
| 4.1 unit/API 2, 429 | A=tℝ[t] versus A=ℝ[t], type (0,0) | In the ideal, coefficient of t in et is 0 for every e; in ℝ[t], 1·t=t has coefficient 1 | Fail: R01; condition the unit clause |
| 4.1 naturality/high even API 2, 429 | Pullback z↦2z, w↦w | Pullback of the four-form is 4 dz dbarz dw dbarw; product of pullbacks has the same factor 4 | Pass |
| 4.1 critical/API 3, 430 | x=z barz, y=1, both weight 1 | Product −barz dz+z dbarz; its Deligne differential −2 dz dbarz equals d_Dx•1 | Pass; ordinary d would give +2 dz dbarz |
| 4.1 point checks, 435 | log 2, log 3; weight-zero unit | Product 0 because there are no one-forms; 1•log 2=log 2 | Pass |
| 4.2 homotopy and critical vanishing, 442 | Re z,2,3 in even critical degree 0 | Both bracketings 6 Re z, value 6 at z=1; h_a=0 although d(Re z)≠0 | Pass; no closedness hypothesis needed |
| 4.2 associative cohomology, 442 | Point constants 2,3,5; three odd point classes | Both bracketings 30; both odd bracketings 0 | Pass; unital assertion still subject to R01 |
| 4.2 non-strict associativity control, 442 | x=2,y=3 in D¹(1), z=Re w in D⁰(0) | (x•y)•z=0; x•(y•z)=3(dw−dbarw); associator −3(dw−dbarw) | Pass as a homotopy assertion; excludes identically zero associativity homotopy |
| 4.2 choice compatibility, 442,450 | Boundary blowup and circle exchange | Product period (2πi)² in both choices; exchanged period −(2πi)² in both | Pass |
| 5.1 definition, 466 | General pair; 0→ℝ[0] | d² second component=res da−d res a=0; fiber of 0→ℝ[0] has H¹=ℝ, H⁻¹=0 | Pass; matches the shifted native cone |
| 5.1 API 1, 472 | {0}⊂{0,1}; identity | Coordinate r↦(r,0); identity r↦r and direct composite agrees | Pass |
| 5.1 API 2, 473 | Z=∅, Z=X; unit t on 𝔾ₘ | fib(id)=0; fib(A→0)=A; raw connecting (0,log abs(t)) has coefficient −1 | Pass; positive valuation uses the stated opposite adapter |
| 5.1 API 3, 474 | V(x),V(x−1); V(x),V(y) | First product lands in zero fiber; second has origin coefficient 1 | Pass |
| 5.1 API 4, 475 | (0,−log abs(t)) on complement; (0,z barz) | First satisfies d_Dg=0 there; second gives −2 dz dbarz≠0 and fails the cocycle test | Pass; pair equations exclude the wrong representative |
| 5.2 semipurity, 488 | Nodal V(xy); cusp V(y²−x³), p=1 | Groups below 2 are 0; degree 2 coordinates (1,1) in ℝ² versus 1 in ℝ | Pass; singular support is included |
| 5.2 codimension bound, 488 | Origin in 𝔸², p=1,2; point with p=1 | Origin H² at p=1 is 0, H⁴ at p=2 is ℝ; full point H¹(ℝ(1))=ℝ violates the conclusion without the bound | Pass |
| 5.2 current criterion both directions, 488 | f=t, t², t⁻¹ | d_D[−log abs(f)] has coefficients −1,−2,+1; supported class coefficients are 1,2,−1; opposite log reverses each | Pass; R05 adds exact normalization locators |
| 5.2 API 1, 494 | Normal p-disk for p=0,1,2 | Betti top degree 0,2,4 respectively has ℝ, lower degrees 0; top types (0,0),(1,1),(2,2) | Pass |
| 5.2 API 2, 495 | Axis classes (a,b); double axis | Zero iff a=b=0, checked on both generic axes; reduced/double coefficients 1,2 | Pass; multiplicity is not support alone |
| 5.2 API 3, 496 | Divisors of t and t⁻¹ | Green functions −log abs(t), +log abs(t) give +[0],−[0], respectively | Pass |
| 5.2 intersections and extremes, 500–504 | Axes and double axis; p=0 full/empty support | Intersection lengths 1,2; full H⁰=ℝ per component and negative H=0; empty H=0 | Pass |
| 5.2 normalization, 488 | (d,p)=(1,1),(2,1) | Form/current factors ((2πi)⁻¹,1), ((2πi)⁻²,(2πi)⁻¹); their ratio is (2πi)⁻¹ in both | Pass; no dimension-dependent sign drift |
| 5.3 support system, 510 | Two axes; empty support | Union contains both classes with coordinates (1,1); empty contributes 0 | Pass; R04 ownership remains |
| 5.3 total and good truncation, 510 | (r,n)=(2p,1),(2p−1,1); ω=Re z₁ dz₂ dbarz₂ | Total degrees 2p−1,2p−2 and cube signs +1,−1; dω on (∂x₁,∂x₂,∂y₂) is −2i | Pass; brutal truncation admits a false cocycle |
| 5.3 API 1, 516 | Origin and double origin; point at p=0 | Class coefficients 1,2; normalized point groups ℝ,0,0 in cube degrees 0,1,2 | Pass |
| 5.3 API 2, 517 | n=0,1,2 | Hₚ[−2p] degrees 2p,2p−1,2p−2 equal top total degrees; 3[V] projects to 3[V] | Pass |
| 5.3 API 3, 518 | Origin support in 𝔸¹, p=1; constant point p=0 | Forget-support sends ℝ→H_D²(𝔸¹,ℝ(1))=0; constant-cube map sends 1↦1 | Pass |
| 5.3 API 4, 519 | Classes on the two axes, enlarged to union | Representatives become (1,0),(0,1); sum (1,1); zero stays (0,0) | Pass; finite-union colimit relation fixes maps |
| 5.4 class isomorphism/projection, 531 | Point p=0; codimension-one supported column | ℝ→ℝ is 1↦1; after truncation the column has only degree 2 group ℝ, lower groups 0 | Pass |
| 5.4 affine contraction, 531 | Point→𝔸¹, p=0,1 | H_D⁰(ℝ(0)) is ℝ→ℝ; H_D¹(ℝ(1)) is ℝ→ℝ; positive normalized columns have 0 cohomology | Pass |
| 5.4 product signs, 535,539 | (n,s)=(1,1),(0,1),(1,2) | (−1)ⁿˢ=−1,+1,+1, separately from Jₙ=−1,+1,−1 | Pass; the two sign factors are not conflated |
| 6.1 specified roof, 555 | Point m=0,1,2; zero cycle | Composite sends m↦m through each class/projection arrow; zero↦0; shift by 2p has sign +1 | Pass; arrows exclude the zero-map substitute |
| 6.1 API 1, 561 | Two lifts differing by d(Γ_t,0) | Difference ([0],t) is a boundary; resulting regulator classes differ by 0 | Pass |
| 6.1 API 2, 562 | Units −1,i and 2 | Log absolute values 0,0,log 2; torsion killed, non-torsion witness nonzero | Pass |
| 6.1 API 3, 563 | O(1),O(−1) on ℙ¹ | Normalized integrals 1,−1; raw periods 2πi,−2πi | Pass |
| 6.2 homotopy formula/API, 575–581 | A=A′=ℤ[0], B=0, B′=(ℤ --1→ ℤ), r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong sign gives (1,−1) with differential (0,2) | Pass; both sides of the chain-map equation computed |
| 6.2 support/coherence, 575 | Identity, empty/full support; t on 𝔾ₘ | h=0 for identity; empty map 0, full map absolute; raw(log abs t)=−[0], negative Green function gives +[0] | Pass |
| 6.3 pullback, 593 | Point→ℙ¹ applied to O(1) | CH¹(point,0)=0 and H_D²(point,ℝ(1))=0; both images 0 | Pass; raw badly positioned cycles are not pulled back |
| 6.3 embeddings, 593 | Unit 2 under ℚ→ℝ→ℂ and ℚ→ℂ | Both values log 2 | Pass |
| 6.3 cycle models and motivic reformulation, 593 | Cube degrees 0,1,2; k=𝔽₂(t) | Both diagrams transport by 1,−1,1; cycle H¹(k,ℤ(1))=k×, with t nontrivial; categorical perfect-field claim is not applied to this k | Pass |
| 7.1 independent definition, 617 | Unit 2eⁱᶿ; different logarithm branches | Re(log 2+iθ+2πik)=log 2 for every integer k | Pass; independent exponential normalization fixes the map |
| 7.1 API 1, 623 | O(a) on ℙ¹; zero K-class and trivial line | ch_D=1+ah; ch_D(0)=0, ch_D(O)=1 | Pass |
| 7.1 API 2, 624 | Projection of 3+4i, p=1,2,3 | πₚ₋₁ gives 3,4i,3; added elements of ℝ(p) project to 0 | Pass; odd and even twists distinguished |
| 7.1 classifying-space route, 619 | Constant simplicial ℤ; constant simplicial S₃ | Abelian case π₀=H₀=ℤ and higher groups 0; S₃ has nonabelian π₀ of order 6, excluded from Dold–Kan | Pass; group completion and abelianization are not conflated |
| 7.2 regulator equality, 640 | Rank 2; O_point on ℙ¹; unit 2 | Both values 2; both degree-two coefficients 1; both logarithms log 2 | Pass |
| 7.2 coefficients/support, 640,646–648 | p=2 higher character; full/empty support; t boundary | Both Newton coefficients −1; full absolute map, empty 0; raw boundary coefficient −1 on both sides | Pass |
| 7.3 products, 654 | Unit 2 and t, degrees 1,1 | Period +2πi log 2; swapped −2πi log 2; parity of (2p−n)(2q−m) equals nm, so both exchange signs are −1 | Pass |
| 7.3 units and intersections, 654 | Weight-zero unit; two ruling divisors on ℙ¹×ℙ¹ | 1·x=x; intersection degree 1, or 2 for a doubled ruling | Pass on geometric unital algebras |
| 7.3 point odd product, 660 | Units 2 and 3 | Product lies in H_D²(point,ℝ(2))=0 on both sides | Pass; does not replace the nonzero curve test |
| 7.4 logarithm law, 668 | u=2,v=3; 1,i,1/2 | log abs(6)=log 2+log 3; values 0,0,−log 2 | Pass; inverse and torsion distinguished |
| 7.4 two-unit representative, 668 | f=2,g=t | i(log abs(f)darg g−log abs(g)darg f)=i log 2 darg t, period 2πi log 2 | Pass; same normalization as §4.1 |
| 7.4 divisor and projective witnesses, 668,674–676 | tᵃ; O(a), a=−1,0,1 | Green function −a log abs(t) gives coefficient a; projective integrals −1,0,1 | Pass; positive unit logarithm and negative divisor Green function remain distinct |

### Source verification

All ten cited works have exactly one manifest key. Seven cached legal extracts were read. The three settled unread entries retain their recorded status; none was requested again. BF, BFT, BKK and KLM locators were checked against their specified arXiv versions, not substituted publication numbering. For BKK, printed page 114 is PDF page 115. No fetched source text was copied into the repository.

| Seeded target | Text opened and exact locator | Hypotheses and outcome |
| --- | --- | --- |
| 1.3 Integral comparison and supports | BFT line 948–963, §6.4, Proposition 6.12, pp.19–20; Levine94 line 1735–1779, Theorem 4.7, pp.295–296 | Integral axis quasi-isomorphisms for equidimensional quasi-projective schemes over a field. Supports and arbitrary derived coefficients follow by applying the same natural diagrams to fibers and derived tensor; they are not asserted to be separate printed theorems. |
| 2.0a Supported multi-relative cube K-theory | Levine94 line 407–420, p.247; line 539–547, Theorem 1.10, p.252; line 625–642, Corollary 1.11, p.256; line 655–736, §2, pp.257–259; line 1101–1117, Theorem 2.7, pp.272–273; line 1210–1269, pp.276–278 | Regular faces, the regular-double/split hypotheses and generalized weights were retained. Theorem 2.7 has an infinite-field hypothesis. The package explicitly supplies its general regular-base route from scheme K-theory and A¹ representability; it does not claim that this theorem alone proves that larger scope or integral Adams multiplicativity. R03 concerns ownership. |
| 2.0b Universal motivic Chern classes | BF line 961–997, §3.2, pp.21–22; Bloch86 §7, uncertified | Read construction is over ℂ and uses universal classes and specialization. The arbitrary-field construction and its exact universal identification cannot be certified from the unread Bloch86 text. The package labels that boundary explicitly. |
| 2.2 Weights and the higher comparison | Levine94 line 1210–1217, Theorem 3.1, p.276; BF line 905–997, Theorem 3.5/proof, pp.20–22; Bloch86 §7, uncertified | Rational comparison is for smooth quasi-projective schemes. BF's proof starts with that scope although its theorem header is broader. Package retains the narrower valid hypotheses and separates the unread all-field universal-class identification. |
| 2.4 Products and degree-zero agreement | Levine94 line 2203–2240, Theorem 5.2, pp.312–313; BF line 974–997, pp.21–22 | Levine supplies the rational cycle product. The package does not miscite it as a higher-character multiplicativity theorem: it specifies a universal tensor-pairing route with named inputs. Degree-zero agreement and Newton coefficients are consistent with the read construction. |
| 3.1 Smooth logarithmic Dolbeault algebra | Burgos94 line 155–192, §2, pp.65–67; BKK line 4213–4232, Definition 5.20, pp.116–117 | SNC local generators and image-algebra interpretation match. BKK supplies readable formulas where the Burgos extraction drops displayed mathematics. |
| 3.3 Deligne functor | BKK line 3999–4030, Definitions 5.7–5.10, pp.110–111; line 4035–4111, Remark 5.11/Proposition 5.12, pp.112–113 | Real type decomposition, arbitrary twists, both degree ranges, the critical differential, explicit comparison and contraction match. Exactness applies to Dolbeault-compatible exact sequences, not arbitrary filtered sequences. No arbitrary shifted Dolbeault structure is claimed. |
| 4.1 Full Dolbeault product | BKK line 4121–4140, Definitions 5.13–5.14, pp.113–114; line 4167–4180, p.115; BF line 499–505, p.10 | All four branches, graded symmetry and Leibniz signs match the computed table. Source definition does not require an identity: R01. |
| 4.2 Associativity and choice compatibility | BKK line 4142–4158, Proposition 5.15, p.114; BF line 506–514, Proposition 1.26, p.10 | BKK gives vanishing on every even critical triple, without closedness. BF's homotopy codomain has the omitted degree shift recorded below; README uses the correct degree −1. Refinement compatibility is via the named natural contraction. |
| 5.2 Semipurity with singular support | BF line 530–552, equation (1.30)/Proposition 1.31, p.11; BKK line 4795–4829, §5.6, p.132; line 4841–4874, Proposition 5.58, p.133 | Codimension bound, vanishing, multiplicity basis and the current iff criterion match. Normalization itself is defined earlier: BKK line 4395–4408, equation (5.38), p.122, and line 4450–4462, Definition 5.41, p.123. R05 requests those locators. |
| 6.2 Restriction homotopies and supported realization | BF line 199–206, p.5; line 315–322, p.7; line 877–885, Proposition 3.3, p.19; BFT line 277–295, §4, p.7 | Read roof and naturality support the construction. Coherent diagram inversion uses EnhancedDerivedSheaves, not a claim that the articles formalize an enhancement. The pair-homotopy formula was computed independently on the nonzero ℤ example. |
| 6.3 Pullback, embeddings and cycle models | BF line 827–852, Proposition 2.19, p.18; line 877–885, Proposition 3.3, p.19; BFT line 948–963, Proposition 6.12, pp.19–20 | Smooth quasi-projective graph-good-position pullback and integral cycle-model comparison match. Perfect-field/resolution conditions are retained only for the separate motivic-category reformulation. |
| 7.1 Independently normalized Deligne character | BF line 919–960, pp.20–21; line 1006–1050, pp.22–23; BKK line 3965–3990, p.110 | Actual classifying-space/Dold–Puppe construction and reduction to universal geometric classes are present. Exponential normalization is positive log absolute value. The Grassmannian rank inconsistency is a source misprint, recorded below. |
| 7.3 Multiplicativity of universal map | BF line 1440–1463, §5.1, p.31; line 1497–1542, §5.2, pp.32–33; line 1571–1587, p.34; line 1619–1632, Proposition 5.13/Corollary 5.14, p.35 | Totalization sign (−1)ⁿˢ, supported product and compatibility of the regulator roof are present. Integral cycle source followed by real coefficients is preserved. |
| 7.4 Logarithm/projective witnesses | BKK line 3965–3990, p.110, and line 4176–4180, p.115; BF line 550–552, p.11; KLM line 546–560, §5.3, p.13 | Degree-one logarithm, critical product and negative principal-divisor Green function agree after the declared Tate/current normalization. The package does not import KLM's projective explicit-current theorem for arbitrary quasi-projective schemes. |

Additional source work covered §3.2, not merely the seeded list: DeligneHodgeII line 1044–1079, Proposition 3.1.8, p.33; line 1142–1168, Theorem 3.2.5, pp.35–36; and line 1216–1252, refinement argument and Corollary 3.2.13, pp.37–38. These distinguish smooth proper from projective compactifications, put the cohomological weight shift in the correct direction and support E₁/E₂ degeneration. Burgos94 line 316, 337, 345, 358 and 379–381 locate the Whitney/Borel, flat-ideal and local-estimate inputs. Their extraction limitations are recorded below rather than concealed as complete formula verification.

### Pinned-library audit

The pins were checked in lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Each following declaration was opened at that pin. Searches used objects and hypotheses, including higher Chow/Bloch cycles, Dolbeault, Deligne cohomology, Beilinson regulator, multi-relative K-theory, Whitney jets, flat functions, type filtrations and mapping-cone summands. No geometric higher-cycle, scheme K-spectrum or Deligne carrier needed by these headlines was found; an Alexander–Whitney construction is not smooth Whitney extension.

| Native object / declaration | File and line at the pin | What it provides, and what it does not |
| --- | --- | --- |
| AlgebraicGeometry.AlgebraicCycle | Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44 | Locally finitely supported coefficient functions on scheme points; no dimension or face-admissibility condition. |
| AlgebraicCycle.mapCoeff, map, map_id | Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:55,69,74 | Dimension weights and residue degrees; map assumes QuasiCompact, not properness. Existing identity theorem is imported, not a new headline. |
| AlgebraicGeometry.Scheme | Mathlib/AlgebraicGeometry/Scheme.lean:40 | Locally affine locally ringed space; no implicit separatedness, finite type or smoothness. README states them. |
| ModuleCat | Mathlib/Algebra/Category/ModuleCat/Basic.lean:56 | Modules, without an implicit finite-generation condition. |
| HomologicalComplex; d_comp_d | Mathlib/Algebra/Homology/HomologicalComplex.lean:59,72 | Actual differentials and square-zero law, not a free condition standing for a cycle model. |
| CategoryTheory.DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74,87 | Integer cochain localization, with HasDerivedCategory universe condition; not coherent restriction diagrams. |
| CochainComplex.mappingCone | Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57 | Source-shift-first summands F[i+1]⊕G[i]. |
| mappingCone.inl_v_d; mappingCone.inr_f_d | Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:261,269 | Differential components (−d_F,f) and d_G. Shift −1 and second-coordinate negation give (da,fa−db). |
| CategoryTheory.Abelian.DoldKan.equivalence | Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 | Simplicial objects in an abelian category versus ℕ-chain complexes; no standalone simplicial-group homotopy theorem. |
| TauCeti.gradedCochainComplex | TauCeti/Algebra/Homology/GradedCochainComplex.lean:59 | Construction uses a specified degree-one endomorphism and its square-zero proof. |
| TauCeti.Hodge.HodgeStructureOn | TauCeti/Geometry/Hodge/Structure.lean:62 | Bounded opposed linear Hodge filtration data; no geometric logarithmic forms. |
| HodgeStructureOn.IsMorphism | TauCeti/Geometry/Hodge/Morphism.lean:69 | Conjugation equivariance and filtration preservation are actual fields. |
| tateLatticeMap; tate; tate_F; tate_piece | TauCeti/Geometry/Hodge/Tate/Basic.lean:44,91,100,111 | Native lattice is ordinary ℤ→ℂ; weight −2p, F-index ≤−p, unique piece at −p. Geometric (2πi)ᵖ is an extra marking, correctly retained. |
| MixedHodgeStructure | TauCeti/Geometry/Hodge/Mixed/Basic.lean:72 | Rational weight filtration, complex Hodge filtration and pure graded pieces, not a geometric realization theorem. |
| MixedHodgeStructure.Hom.range_inf_F_eq_map_F | TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110 | Strictness for actual mixed-Hodge morphisms. An arbitrary filtered linear map is not enough; §3.2 supplies the geometric structure first. |

### Cross-roadmap and supply audit

The main checkout was 66576b61d0440aec1f04a10b179f7e7163140b96. Open-head searches used the supplied 2026-10-24 index, with 332 open entries, through roadmaps grep/show. The board index was read before searching its 37 listed package heads. Supplier sections were read at main or the indicated head, not inferred from their titles. In the next table, a path ending in README.md identifies the roadmap text; section locators disambiguate long ranges.

| Supplier and version | Resolved file / section locations | Contract checked |
| --- | --- | --- |
| GeneralAlgebraicKTheory, e0552fe | TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:627,795,827,925,1333,1623,1651,1669,1687,1938,1950; §§3.12,4.6,4.8,4.14,6.3,7.4–7.7,8.12–8.13 | Actual K-models, exactness, pairings and DVR sign. At n=1, B[t]=+1; at n=2 the last-slot adapter is −B, matching §§2.2–2.3 here. |
| SchemeKTheoryOperations, 88dbd5a | TauCetiRoadmap/SchemeKTheoryOperations/README.md:373–596,663–820,1102,1627,1979–2106,2225–2280; §§2.1–2.6,3.1–3.6,4.3,6.1,6.7–6.9,7.1–7.3 | Supported perfect K, external pairing, actual classifying objects/stability, regular-base A¹ representability, finite weights and existing degree-zero Chern character. Line 2106 supplies the several-variable uniqueness needed by §2.0a. Downstream ownership at line 2403 needs R03's coordination. |
| KTheoryFiniteLocalFields, afe02e8 | TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:478–501,1468–1472; §3.0a and §6.10 | Shared integral simplicial cycles, moving including finite fields, tower and diagonal Chern. Boundary [1]−[0] and coefficients 1,−1,2 in degrees 1,2,3 agree. The general scheme character is an extension/comparison, not a second field-diagonal theorem. |
| MotivesAndAlgebraicCycles, 79b02f6 | TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:675,690,710,813,858,872; §§4.7–4.8a,4.14,4.17–4.18 | Shared-cycle adapters, relative-cycle specialization and perfect-field/resolution-dependent motive comparisons. Those extra hypotheses do not leak into the arbitrary-field cycle theorem. |
| SchemeAndStackFoundations, main | TauCetiRoadmap/SchemeAndStackFoundations/README.md:3265,3309,5613,6075,6567–7107; §§2.1–2.2,4.12,4.17,5.1–5.8 | Scheme cohomology, Chow domination, SNC predicate, cycles, Chern classes, intersection and degree-zero K/Chow theory. No second ordinary Chow or c₁ carrier is proposed here. |
| ResolutionOfSingularitiesCharacteristicZero, bf45c86 | TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:672–728,758–802; §§5.1–5.6,6.1–6.4 | Resolution/principalization preserving the open and boundary; projective compactification for quasi-projective input. General separated input instead uses Nagata before resolution. |
| EtaleCohomologyFoundations, main | TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57,105,139; §§G.1–G.3 | Dense compactification, Nagata existence and finite-diagram proper common refinements. No étale coefficient theorem is needed here. |
| ComplexComparisonPartII, 2d50a88 | TauCetiRoadmap/ComplexComparisonPartII/README.md:699,856,2337,2895,2974,2994,3018,3401,3743,3850,3990; §§C−1.1,C−1.4,C5.1,C5.3–C5.6,C6.0 | Analytification, currents, holomorphic logarithmic forms, proper algebraic Hodge theory, stratified topology and regular-singular comparison. For the trivial connection all residues are 0, satisfying “not a positive integer.” Finite CW type is not incorrectly replaced by compactness. |
| EnhancedDerivedSheaves, main | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:259,429–492,580,2293–2307; §§E0.6,0.1–0.4,E1.4,E2.6 | Enhancement, replacements, tensor, coherent diagram inversion and descent; point-site specialization supplies module complexes. Ordinary DerivedCategory alone would not supply these coherences. |
| DifferentialGeometry, main | TauCetiRoadmap/DifferentialGeometry/README.md:268,311,503,782,806,816,862; Layers 0–1,5–9 | Form calculus, integration, Stokes and duality. The two Whitney/flat-ideal extensions are declared gaps, not falsely attributed to these sections. |
| ComplexKahlerGeometry and ComplexManifolds, main | TauCetiRoadmap/ComplexKahlerGeometry/README.md:96,193, K1–K2; TauCetiRoadmap/ComplexManifolds/README.md:172,197, Milestones 1–2 | Finite-dimensional Hausdorff second-countable calculus and transported orientation. Complex basis order (e₁,ie₁,…); one complex disk has positive orientation and exchanges of two one-dimensional residue directions give −1. |
| AlgebraicTopology, main | TauCetiRoadmap/AlgebraicTopology/README.md:326,471,946,1654–1678; Stages 2–3, Stage 6 items 1–4, Stage 8 item 2 | Relative cohomology, excision, products, manifold local duality; Kan/Moore comparison with the abelian hypothesis for the chain-complex statement. |
| Completed/HodgeStructures, main | Completed/HodgeStructures/README.md, pure/mixed structure milestones | Linear Hodge theory is imported through the exact pinned declarations above. No geometric logarithmic assertion is attributed to the completed linear theory. |

Every one of the 27 Needs lines and all seven layer dependency paragraphs was read. Statements and sketched proof inputs run forward: integral moving is a supplier input, universal classes precede comparison, geometric strictness precedes compactification independence, the product precedes supported products, and semipurity precedes the roof. No unowned prerequisite was found beyond the three conflicting ownership claims R02–R04. In particular a source citation was not treated as ownership of Whitney extension or enhanced diagram inversion.

The prescribed dependency check completed with exit 0 and exactly this output:

```text
depcheck: 29 roadmaps, 259 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The citation resolver reported no missing cross-roadmap names or backticked Lean names. Its own output said it did not check native library declarations on its host; the pinned audit above performed that separate check. The mechanical success does not detect the conflicting consumer ownership in R02–R04.

Both declared gaps are precise and minimal. packages/MotivicEtaleKTheory/design/plan.json and README.md:83,91 contain the same slugs and the named DifferentialGeometry Part II supplier. The first asks for finite-dimensional real Whitney extension, with parameter-dependent Borel extension as a specialization; it asserts existence, not uniqueness. The second asks only for the flat-ideal sum for relatively closed real-analytic sets. The local coordinate-division/logarithmic estimates remain §3.2 targets here. Neither extension was found in the pinned libraries, the cited main supplier or the searched open owners. These valid contracts are not findings: smooth-whitney-extension and flat-ideal-regular-situation. Because this verdict has blocking findings, they are not entered as accepted conditional_gaps.

### Duplication by mathematical object

| Object searched | Existing owner / result | Disposition |
| --- | --- | --- |
| Scheme cycle carrier, modules, complexes, cones, Dold–Kan | Exact pinned files above | Imported; no duplicate acceptance declarations. |
| Simplicial higher cycles, moving, localization and motivic-to-K tower | KTheoryFiniteLocalFields §3.0a; MotivesAndAlgebraicCycles §§4.7–4.8 | Cubical/mixed adapters here use the same source. This is a genuine extension, not replanning the higher-cycle library. |
| Perfect scheme K, Adams operations and degree-zero character | SchemeKTheoryOperations §§2–3,6–7; GeneralAlgebraicKTheory cited targets | Generic operations remain imports; higher character extends their actual map. |
| Supported multi-relative cube carrier and full-cube relativity | ColemanIntegration §L3.Fa.2 at ae078af | R03: the later text still constructs the common object. Move shared ownership here and import it there. |
| Ordinary forms, currents, holomorphic log complex, proper Hodge theory | DifferentialGeometry; ComplexKahlerGeometry; ComplexComparisonPartII | Retained variant here is the smooth image logarithmic algebra, filtered geometric comparison, real Deligne functor and support theory; these are not native current replacements. |
| Generic compactification-independent real Deligne cohomology and universal character | BorelRegulators §6.0a at e39a3c4 | R02: scope there includes general smooth varieties and BGL, not just number fields. |
| Supported auxiliary complexes and abstract regulator roof | Polylogarithms §5.2 at 4696a1a | R04: same objects after Jₙ; its additional current adapters remain separate. |
| Number-field regulator specialization | packages/PeriodsAndSpecialValues/README.md:747 at 9f14c68 | Arithmetic specialization uses the same ℂ/ℝ(p) projection. It is downstream of the general normalization, not an earlier generic supplier. |
| Syntomic regulators and finite-coefficient arithmetic | packages/PadicHodgeRegulators/README.md:806 at 5eff35d; HabiroNumberFields at da336a9; EllipticKTheory at fd76424 | Different coefficients or arithmetic consumers; no justification for duplicating the real Deligne core. |
| Requested M.8 character/normalization | packages/ZagierConjecturePolylogarithms/design/README.md:1491–1495 | The requested label exists in the available design; this package's lines 702–708 map it to §§2.1–2.2,7.1,7.4. It is a consumer, not a supplier. |
| Irregular logarithmic filtration at zero function | packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:1534–1564 | At f=0 its pole divisor is 0 and it recovers ordinary filtered log forms. Exponential/pole-order constructions remain there; no reverse dependency is introduced. |

The available named open-roadmap collection was searched through the supplied head index by object, including BorelRegulators, ColemanIntegrationPartII, Polylogarithms, ArithmeticKTheory, the Habiro roadmaps and CohomologyComparisonsPartII. Positive matches were opened. This is distinct from claiming that every unrelated roadmap file was read line by line. The additional board-head retrieval limits are listed below. Suggested.lean declares no fully qualified names, so it cannot collide with another roadmap's declaration namespace.

### Shape, headlines and Lean acceptance test

The README has the required title/summary, scope, conventions, per-supplier contracts, reading paragraph, seven layers with Examples/Dependencies, consumers and references. Every numbered definition has its prose API and at least three Checks; the table above computes their discriminating examples. No target-number catalogue, source-copy block, process narrative, algorithm, local-machine path or forbidden Lean option was found. metadata.toml contains the mathematical topic math.AG. The main-branch shape references were TauCetiRoadmap/ComplexTori/README.md and Completed/HodgeStructures/README.md.

The deep headline list is: integral cubical–simplicial comparison with operations/supports/coefficients (§§1.3–1.4); Adams-compatible multi-relative K relativity (§2.0a); universal motivic Chern operations (§2.0b); rational and supported higher Chern isomorphisms and products (§§2.1–2.4); geometric bifiltered logarithmic comparison (§3.2); small Deligne-model deformation retract (§3.3); compactification-independent realization/descent (§3.4); full product and associativity homotopy (§§4.1–4.2); singular-support semipurity/current criterion (§5.2); supported resolution and affine contraction (§5.4); universal restriction-natural regulator (§§6.1–6.3); independent Beilinson character and identification (§§7.1–7.2); integral-source regulator multiplicativity (§7.3). Section 7.4 gives normalization witnesses for those maps, not independent scalar-algebra headlines.

All these headlines are named in the module docstring with their missing carriers. The native Scheme, cycle function, complex and linear Hodge structures do not make the missing geometric complexes or maps a few simple definitions. In particular the abstract fiber-homotopy identity and log-additivity Check would be padding substitutes for the actual regulator statements. The docstring-only file is justified at these pins.

Ran lake env lean on packages/MotivicEtaleKTheory/Suggested.lean from the content checkout, using the absolute tool argument required by the brief. It completed with **exit 0, no errors and no warnings**. There is one import Mathlib, one module docstring and the correct empty namespace. There are zero theorems, definitions, instances, examples, TauCeti imports or sorry terms. Consequently the declaration-by-declaration elaborated-signature comparison and one-tactic padding probe have zero cases; no fabricated #check file or proof probe was needed. The earlier supplied “Unknown identifier lack” message was not reproduced by elaborating the actual file. No library build was necessary, and no Lean process remains running.

## Not verifiable

- **Bloch86 §7:** settled uncertified/paywalled. The arbitrary-field universal motivic Chern construction and its inverse-cycle-map identification in §§2.0b and 2.2 were not text-verified. BF supplies only the read complex-field construction, and Levine94 supplies the geometric rational comparison. This is an explicitly recorded access limit, not a newly alleged ownership gap.
- **Beilinson85 §§1–2:** settled uncertified/paywalled historical citation. No claim of reading this text; the package's comparison route was checked in BF.
- **Levine98 specified chapters:** settled waived background. No finer theorem locator or proof detail was certified or requested.
- **Burgos94 and some Levine94 display formulas:** the available extracted text omits parts of the scanned mathematics. The surrounding numbered results were readable; BKK's readable Definition 5.20 and DeligneHodgeII corroborate the log-model assertions. Complete glyph-by-glyph verification of Burgos94's Whitney/Borel/flat-ideal and Proposition 4.1 displays was unavailable. No PDF renderer was available in the worker environment. Their declared contracts and the package's local estimates were tested mathematically as recorded above.
- **Fifteen board package heads:** the supplied contents endpoints returned HTTP 404, so ownership against their package READMEs was not verified. The affected name/head pairs are ArithmeticLocallySymmetricSpacesPartII@84a41ac; CompletedCohomologyAndLocalGlobalCompatibilityPartII@948c94c; CrystallineCohomologyPartII@84ea77e; EndoscopicTransferAndUnitaryTraceComparisonPartII@80a66cc; HigherHidaAndColemanTheory@da88512; LawrenceVenkateshMethod@9ee7ac3; OrdinaryAutomorphicFormsAndModularityLiftingPartII@7e88c38; PELModuliPartII@d4bb48d; PadicHodgeTheoryPartII@6502997; PadicLocalLanglandsForGL2QpPartII@3e0777d; RealSurfacePeriodIndex@875bca4; SchemeAndStackFoundationsPartII@accb0a0; ShimuraVarietiesPartII@57dc0a4; VStackSheavesAndLisseCategoriesPartII@0987ba7; VectorBundlesAndIsocrystalsPartII@b58d862. The other 22 indexed package READMEs were retrieved and searched. No conclusion that any of these fifteen objects “exists nowhere” is drawn.

There is no new missing source request. The unread works already have settled manifest keys, and the partial scan extraction does not justify renaming or refetching those works under new keys. The two consumer designs identified above were found locally even though roadmaps show has no package-stage entry for them.

## Source issues

- **Misprint** in BF at Proposition 1.26, printed p.10 (BF line 508): the source says the associativity homotopy lands in degree r+s+t; it should be degree r+s+t−1, so its differential has the associator's degree; affects a stated result.
- **Error** in BF at Theorem 3.5, printed p.20 (BF line 905–919): the source says the K-to-higher-Chow isomorphism applies to any equidimensional complex algebraic scheme; it should be scoped to the smooth quasi-projective setting used in the proof; affects a stated result.
- **Misprint** in BF at proof of Theorem 3.5, printed p.22 (BF line 1006–1011): the source says the universal bundle on k-planes in ℂᴺ has rank N and classifies through BGL_N; it should be rank k and BGL_k for that Grassmannian convention, or consistently reversed indices; affects the proof.
- **Misprint** in BF at proof of Lemma 5.1, printed p.31 (BF line 1453): the source says the two input forms have twists n and m; it should be twists p and q on X×□ⁿ and Y×□ᵐ, respectively; affects the proof.
- **Misprint** in BF at §5.2 support notation, printed p.32 (BF line 1508): the source says the X-support indexed by n is obtained from supports indexed by m; it should be indexed by n consistently with the X×□ⁿ factor; affects nothing.

For the second source issue, X=Spec ℂ[ε]/(ε²) is a concrete obstruction: K₁ contains the nonzero additive group 1+εℂ after rationalization, while higher-cycle groups are invariant under this nilpotent thickening. The README correctly avoids that broad theorem header. No published correction to these preprint issues was established in this review.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "18a7b4d7056c6e7f88aa9f634dac7c55278ad1b3", "job": "REV-PKG-MotivicEtaleKTheory", "model": "gpt-6-astra", "worker": "chris-3"} -->
