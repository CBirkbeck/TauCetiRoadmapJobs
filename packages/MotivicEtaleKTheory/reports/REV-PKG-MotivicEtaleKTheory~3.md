<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1047#issuecomment-6379552932 -->
Review (codex) of 1064583

Verdict: accepted
Conditional on the announced gaps: `smooth-whitney-extension`, `flat-ideal-regular-situation`

No package findings: 0 P1, 0 P2 and 0 P3. Acceptance is conditional on the two declared supplier contracts, `smooth-whitney-extension` and `flat-ideal-regular-situation`. The last review's regular-nonsmooth omission is repaired. The three previously settled companion-roadmap edits remain outside this package; they are recorded below without being re-raised.

## Previous findings and repair verification

The immediately preceding review has one finding, F01 (called R01 in its narrative). Its repair report marks it applied. I checked the repair before the remainder of the review.

| Finding | Repaired passage and status | Independently checked witness |
| --- | --- | --- |
| Round-2 F01: regular nonsmooth supported comparison omitted | **Repaired.** packages/MotivicEtaleKTheory/README.md:288 begins “For every field k, regular quasi-projective finite-type X/k, closed subset Z⊂X and n,p≥0”. Line 200 gives the regular relative-cycle input; line 204 states both splitting/moving hypotheses. | Levine94 line 1101–1117, Theorem 2.7, pp.272–273, and line 1399–1437, Theorem 3.4, pp.283–284, have the regular scope. For L=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2,3, dim=embdim=0 but dim Ω¹_L/k=1. Both full-support comparison groups are ℚ and 1 maps to 1. |
| F01: route, support API and full-support specialization | **Repaired.** README:290 says “This route establishes the general comparison independently of the universal-class construction”; :288 says “Full support gives CHᵖ(X,n)⊗ℚ≃Kₙ(X)^(p)”. Line 296 distinguishes regular flat pullback from arbitrary smooth-scheme pullback. | On 𝔸¹_L supported at u=0, both weight-one groups are ℚ; the generator maps to [O₀] with coefficient +1. B[u]=+1, raw pair boundary=−1, minus raw=+1. Enlarging support sends 1 to (1,0). |
| F01: scope and acceptance description | **Repaired.** README:9 says “Section 2.3 owns the geometric supported cycle-to-K comparison for regular quasi-projective schemes over every field”; Suggested.lean:16–20 distinguishes this comparison from its smooth universal-class identification and smooth product theorem. | Conventions at README:17, the build paragraph at :113, Examples at :326 and the Levine94 reference at :727 agree. Sections 2.0b–2.2, 2.4 and the complex realization layers retain their appropriate smooth hypotheses. |

The changed relative-cycle definition at README:204 and API at :208 were also checked, not merely the theorem header. Its relations use a homotopy vanishing at 1 and restrict it at 0. The support-local map has pure codimension and componentwise proper-face hypotheses. The two conditions of Theorem 2.7 are explicit: a unit-ideal finite cover with split face cubes, and admissible pure-codimension support enlargement with split complements. Levine94 line 739–752, line 777–889 and line 1006–1037 supply those ingredients. The proof steps at Levine94 line 1223–1269 use coordinate projections and retractions over the regular base; they do not require that base to be smooth over its field. For a finite field, regular finite-type schemes are smooth, so the supplied finite-field moving/transfer route applies on its stated domain. No argument assumes that regularity survives algebraic closure over an imperfect field.

I searched the same repaired pattern throughout the package: the wider regular comparison is consistently separated from the smooth universal-class/product claims, including the support API and the Layer 7 consumer. No remaining smooth-only replacement of the supported theorem was found.

The preceding review also carried forward the following older dispositions. I checked their passages and the external heads again.

| Older finding | Present passage and status | Witness and disposition |
| --- | --- | --- |
| F01: unconditional abstract unit | **Repaired.** README:433 says “without a unit requirement”; :440 says “If A has a specified real multiplicative identity 1_A of type (0,0)”; :454 conditions the cohomological unit. | In tℝ[t], coeff_t(et)=0 for every e; in ℝ[t], coeff_t(1·t)=1. BKK line 4121–4128 permits nonunital input. The geometric unit and its pullback are separately supplied in §3.1. |
| F02: Borel generic Deligne ownership | **Partly repaired globally; settled as not actionable here.** README:13 and :707 say “BorelRegulators §6.0a must import these constructions”. | TauCetiRoadmap/BorelRegulators/README.md:13,724,726 at e39a3c4 still claims/constructs the core. Only a companion edit removes it; the package states the correct consumer direction and does not claim completion. |
| F03: Coleman cube ownership | **Partly repaired globally; settled as not actionable here.** README:13 says “ColemanIntegration §L3.Fa.2 must import that construction and its ordered relativity equivalence”; :705 gives the same direction. | TauCetiRoadmap/ColemanIntegration/README.md:2435–2446 at ae078af and TauCetiRoadmap/SchemeKTheoryOperations/README.md:9,2403 at 88dbd5a still need the external ownership update. This is not an incoming prerequisite. |
| F04: Polylogarithms auxiliary objects | **Partly repaired globally; settled as not actionable here.** README:524 says “The shared diagram and the abstract supported regulator of §6.2 must be imported there”; :703 agrees. | TauCetiRoadmap/Polylogarithms/README.md:826–843 at 4696a1a still constructs them. Its D_AH, β and explicit current adapters are distinct additions. J₀∂=δJ₁=∂ verifies the transport. |
| F05: current normalization locator | **Repaired.** README:500 cites “BKK equation (5.38), p.122” and “BKK Definition 5.41, p.123”; :731 and the manifest agree. | BKK line 4395–4408 and line 4450–4462 give form factor (2πi)⁻¹ and point factor 1 when d=p=1. Proposition 5.58 is the iff criterion, not the defining normalization. |

The reasons for treating the three companion edits as settled are still correct. They require edits outside the authorized package, and their direction is outgoing supply. They are not disguised missing supplier contracts. The abstract-unit qualification, current normalization and cone/cube transports were searched across all other uses and remain consistent.

## Verified sound

The review covers all 27 numbered targets, every definition, API, Check and theorem statement in them, the conventions, both supplier gaps, 27 target-specific Needs lines and seven layer dependency summaries. The computed record has 146 rows: 100 recomputed for this round and 46 retained computed rows for unchanged assertions. The 15 seeded sections were checked against their readable source passages. Finite instance calculations test the assertions; they are not proofs of the general theorems.

The package keeps integral cycle coefficients over arbitrary fields, zero and derived coefficients, singular supports, disconnected dimensions, negative twists and regular nonsmooth schemes. The regular-base cube construction includes primes 2 and 3. I found no route-specific prime restriction, computational algorithm, copied source passage, re-planned generic carrier, incoming cyclic supply, sorry'd data or forbidden Lean option. Ordinary cycles, K-theory, linear Hodge theory and current calculus remain imports. The frozen design narrative was not treated as a second package acceptance statement; only its gap contracts were compared with the package.

### Adversarial computation record

P denotes a point; h is the positive hyperplane class. Juxtaposed differentials denote wedges. API numbers refer to prose bullets in the present README; the three older cube API numbers were advanced after the inserted relative-cycle API bullet. “Retained r2” explicitly identifies an unchanged statement whose prior review contains the displayed computed values. No prior uncomputed summary is counted as evidence. “Recomputed” covers all seeded targets, changed mathematical assertions and the regular-scope controls. Each row reports its actual instance values and the applicable result; no repair is requested by a passing row.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Recomputed: Conventions: universe and components | Empty scheme; P⊔ℙ¹ | Components 0 and 2; CH⁰(P⊔ℙ¹)=ℤ², CH¹=0⊕ℤ | Pass; a single rank 3 loses (2,1) |
| Recomputed: Conventions: degree | p=0, a=1; p=1, a=1 | Homological degrees −1 and 1; groups 0 and k× | Pass; natural subtraction would incorrectly use degree 0 |
| Recomputed: Conventions: coefficients | ℤ/2⊗ᴸℤ/2; R=0 | Reduction of [ℤ --2→ ℤ] is [ℤ/2 --0→ ℤ/2]; H⁻¹=H⁰=ℤ/2; R=0 gives 0 | Pass |
| Recomputed: Conventions: cube sign | n=0,1,2; graph t | J=(1,−1,1); ∂Γ_t=[0], δΓ_t=−[0]; J₀∂Γ=δJ₁Γ=[0] | Pass |
| Recomputed: Conventions: mixed square | (n,m)=(1,1) | Cross coefficients −1,+1 sum to 0 | Pass |
| Recomputed: Conventions: fiber and boundary | A=0, B=ℝ[0]; (𝔸¹,{0}) | fib has H¹=ℝ; d(Γ_t,0)=([0],t), so raw(t)=−[0], −raw(t)=+[0] | Pass |
| Recomputed: Conventions: Tate and critical differential | p=−1,0,1; x=z barz | ℝ(−1)=iℝ, ℝ(0)=ℝ, ℝ(1)=iℝ; d_Dx=−2 dz dbarz | Pass; 2πi≠0 |
| Recomputed: Conventions: orientation and totalization | Ordered two disks; n=s=1 | Residues +1 and −1 after exchange; product sign −1; circle period of i log 2 darg t is 2πi log 2 | Pass |
| Retained r2: Whitney gap: extension | Jet at 0 with coefficients 1,1,2 | Required derivatives (1,1,4); f=1+x+2x² has these values | Pass |
| Retained r2: Whitney gap: arbitrary order and parameters | Coefficients n!; normal derivative m=2 at y=π/2 | Derivatives (n!)²; required transverse value 4 sin(π/2)=4 | Pass; analytic radius is 0 for n! |
| Retained r2: Whitney gap: degeneracy and uniqueness | A=∅, A=U; 0 and exp(−1/x²) at 0 | Empty jet imposes 0 conditions; full-set extension equals f; both jets are 0 but values at 1 are 0 and e⁻¹ | Pass; uniqueness is correctly excluded |
| Retained r2: Flat-ideal gap: equality | A=B={0}; A=∅,B=U; A=B=U | I=I+I; C∞=C∞+0; 0=0+0 | Pass |
| Retained r2: Flat-ideal gap: sum versus intersection | Coordinate axes, φ(x)+φ(y) | Jets at (0,0) are 0; value at (0,1)=e⁻¹, whereas every element of I(A)∩I(B) vanishes there | Pass; excludes the wrong intersection |
| Recomputed: 1.1 definition | P, p=0, n=0,1,2 | Raw groups ℤ,ℤ,ℤ; infinity kernels give ℤ,0,0, matching degeneracy quotients | Pass |
| Recomputed: 1.1 API 1 | Normalization of degree-one constant cube | Infinity face sends 1↦1, so kernel=0; degeneracy quotient ℤ/ℤ=0 | Pass |
| Recomputed: 1.1 API 2 | ℙ¹→P; inseparable extension degree 2 | Fundamental one-cycle pushes to 0; field pullback sends 1↦1 and transfer sends 1↦2 | Pass; dimensions and generic lengths matter |
| Recomputed: 1.1 API 3 | Degrees 1+1 and 1+2 | J₂=1=(−1)(−1); J₃=−1=(−1)(1) | Pass |
| Recomputed: 1.1 API 4 | Reduced and double point; p=−1 | Generator coefficient 1 versus multiplicity 2; negative-codimension group 0 | Pass; support alone does not encode multiplicity |
| Recomputed: 1.2 definition | Total degree N=0,2 | Diagonals contain 1 and 3 summands; in (1,1), d² cross term is −T+T=0 | Pass |
| Recomputed: 1.2 API 1 | Both axes at (0,0) | [V]↦[V] with coefficient 1 on each axis | Pass |
| Recomputed: 1.2 API 2 | Three summands in degree 2 | Component values (2,3,5) determine total image 2+3+5=10; zero components give 0 | Pass |
| Recomputed: 1.2 API 3 | Bidegrees (1,0),(0,1),(1,1) | Multipliers −1,+1,−1; (−1)ⁿ⁺ᵐ would give −1 on the simplex axis | Pass |
| Recomputed: 1.3 absolute comparison | P over 𝔽₂, p=0 | Both H₀=ℤ, higher H=0; comparison 1↦1 | Pass integrally |
| Recomputed: 1.3 support comparison | Z=∅ and Z=X | fib(id)=0 on both sides; fib(C→0)=C on both sides | Pass |
| Recomputed: 1.3 coefficient comparison | Multiplication-by-2 resolution; R=0 | Both sides retain ℤ/2 in degrees −1,0; both become 0 for R=0 | Pass |
| Retained r2: 1.4 direct maps | 𝔽₂(t)/𝔽₂(t²) | Degree 2, and res then transfer sends 1 to 2 on both cycle models | Pass; inseparability does not change the degree formula |
| Retained r2: 1.4 smooth products/pullbacks | Degrees (1,1),(0,1); P⊔ℙ¹ | Exchange factors −1,+1; CH¹=0⊕ℤ and CH⁰=ℤ² on both sides | Pass |
| Retained r2: 1.4 support/orientation transport | Identity; square-zero thickening | Identity coefficient +1; reduced and thickened cycle generators both ℤ | Pass; no K-theory nil-invariance is inferred |
| Recomputed: 2.0a definition | n=0, full/empty support over k | K₀(k)=ℤ, [k²]=2; empty support=0 | Pass; external ownership disposition below |
| Recomputed: 2.0a generalized weights | L=[[2,1],[0,2]] on ℚ² | (L−2I)e₂=e₁≠0, (L−2I)²=0; generalized piece ℚ², eigenspace ℚe₁ | Pass; generalized is not silently replaced by ordinary |
| Recomputed: 2.0a rationality | K₀(ℙ²), h³=0 | ψ²h=2h−h²; ψ²(2h+h²)=2(2h+h²), ψ²h²=4h²; eigenlattice determinant 2 | Pass; integral direct sum would fail |
| Recomputed: 2.0a API 2 | n=0; support ∅⊂X | Groups 0→K₀(X), 0↦0; full support rank-two class maps to 2 | Pass |
| Recomputed: 2.0a API 3 | Two unit loops over ℤ_(2), ℤ_(3) | ψ²[u]·ψ²[v]=(2[u])(2[v])=4{u,v}=ψ²{u,v} | Pass on the stated common base |
| Recomputed: 2.0a external domain | ℤ[i]⊗ℤℤ[i] at ramified point | Relation v(v+2i)=0; local dimension 1, cotangent dimension 2; common-base cube stays regular | Pass; singular external product excluded |
| Recomputed: 2.0a API 4 | n=1 over ℚ and ℤ_p | Difference (1,0)↦1, (0,1)↦−1, (1,1)↦0; K₀(relative)=K₁(base) | Pass at p=2,3 as well |
| Recomputed: 2.0a ordered double loop | {u,v} over ℚ(u,v) | Two last-slot residues +1; swapped loop −1; ψ² multiplier 4, ψ¹ multiplier 1 | Pass |
| Recomputed: 2.0a open non-full cube | Remove t=2 over ℤ₃ | Induced face ranks of O are (1,1); difference 0; no full-cube equivalence asserted for this Y | Pass |
| Retained r2: 2.0b definition | Zero K-class; unit 2 | c₀,₀(0)=1 but ch(0)=0; c₁,₁[2]=[2] has valuation 1 | Pass; universal all-field source remains uncertified |
| Retained r2: 2.0b API 1 | O(1)⊕O(−1) on ℙ² | (1+h)(1−h)=1−h²; c₂=−h², not c₂(O(1))+c₂(O(−1))=0 | Pass; degree-zero Chern is not additive |
| Retained r2: 2.0b API 2 | Diagonal degrees 1,2,3 | (−1)ⁿ⁻¹(n−1)! gives 1,−1,2, the supplier's coefficients | Pass |
| Retained r2: 2.0b API 3 | Same three degrees; line on ℙ² | Character coefficients 1,−1,1/2 cancel 1,−1,2 to 1,1,1; ch₂(O(1))=h²/2 versus c₂=0 | Pass; factorial denominators 1,1,2≠0 |
| Recomputed: 2.1 construction | P, ℙ¹, empty, two points | ch(k²)=2; ch(O(±1))=1±h; empty=0; ranks (2,1) retained | Pass; finite weight support |
| Recomputed: 2.1 API | Addition O(1)+O(−1); unit 2 | Character 2, versus total Chern 1; valuation of ch₁,₁[2] is 1 | Pass; excludes zero in positive degree |
| Recomputed: 2.2 isomorphism and Adams | Weights 0,1,2; a=1,2 | ψ² eigenvalues 1,2,4; differences −1,−3,−2; ψ¹ acts by 1 | Pass; distinct projector denominators nonzero |
| Recomputed: 2.2 universal-class equality | O_point on ℙ¹; unit 2 | Both leading classes h; both degree-one classes [2], valuation 1 | Pass instances; all-field proof text unread |
| Recomputed: 2.2 degree-two sign | {2,t}, t-adic boundary | Last-slot residue [2], valuation 1; native right boundary −[2], valuation −1; adapter −B restores +[2] | Pass; same sign as K supplier |
| Recomputed: 2.3 supported construction | ∅, X, nodal divisor V(xy) | 0≃0; absolute comparison; leading coordinates (1,1) on two components | Pass; singular K(Z) not substituted |
| Recomputed: 2.3 API 1 | {0}⊂{0,1} in 𝔸¹; identity | Coefficient 1↦(1,0); identity 1↦1 | Pass |
| Recomputed: 2.3 API 2 | Lift Γ_t | d(Γ_t,0)=([0],t); raw boundary −[0], B[t]=+[O₀], so ch B=−δ_raw ch | Pass |
| Recomputed: 2.4 higher products | Ranks 2,3; ξ=1−O(−1) on ℙ¹ | Rank product 6=2·3; ch(ξ²)=0=h²=ch(ξ)² | Pass |
| Recomputed: 2.4 degree zero | O(a), O_point | ch(O(a))=1+ah on ℙ¹; 1−exp(−h)=h, leading coefficient +1 | Pass; imported map is compared |
| Recomputed: 2.4 higher Newton coefficient | p=1,2,3, n>0 | 1,−1,1/2; specifically ch₂,₂=−c₂,₂ | Pass |
| Recomputed: 3.1 definition and chart independence | z↦2z; z↦z² | Logarithms change by log 4 and multiply by 2 respectively; logarithmic derivatives change by 0 and multiply by 2 | Pass; generated image fixes the actual subalgebra |
| Recomputed: 3.1 API 1 | log abs(z)²; z barz | d log abs(z)²=dz/z+dbarz/barz; ∂∂̄(z barz)=dz dbarz and ∂̄∂(z barz)=−dz dbarz | Pass; anticommutator 0 |
| Recomputed: 3.1 API 2 | Identity; power maps 2 then 3 | dlog maps to dlog and 6 dlog, respectively; composite power 6 also gives 6 dlog | Pass |
| Recomputed: 3.1 API 3 | Empty boundary; empty W; z=e⁻ᴺ on punctured disk | Native smooth algebra; zero algebra; log abs(z)²=−2N whereas abs(z)⁻²=e²ᴺ | Pass; no arbitrary-pole scalar is introduced |
| Recomputed: 3.1 orientation | Circle; ordered two-disk residue | Integral 2πi; residues 1 and −1 on exchanging the disks | Pass |
| Recomputed: 3.2 comparison and weight | Point; 𝔾ₘ | Point weight 0; H¹(𝔾ₘ) has residue degree 1 plus cohomological degree 1, hence weight 2 and type (1,1) | Pass; unshifted weight would be 1 |
| Recomputed: 3.2 degenerations and refinement | Boundary blowup of (ℙ¹)² compactifying 𝔾ₘ² | Betti dimensions (1,2,1) stay (1,2,1); boundary-component count changes 4→5 | Pass; F comparison does not assert invariant residue graded complexes |
| Recomputed: 3.2 local estimates/API 1 | f=exp(−1/abs(z)²), extended by 0; f=1 | All jets of f/z² at 0 are 0; value at 1 is e⁻¹. For f=1, 1/z² diverges | Pass; flatness is essential |
| Recomputed: 3.2 local estimates/API 2 | exp(−1/abs(zw)²) log abs(z)²/(z barw) | All axis jets are 0; value at (−2,1) is −e⁻¹ᐟ⁴ log 4/2; all exponents 0 recover f | Pass; simultaneous flatness handles the combined expression |
| Recomputed: 3.3 cone and small model | Point, p=0,1,−1 | (H⁰,H¹)=(ℝ,0),(0,ℝ),(ℝ(−1),0), respectively, in both models | Pass; negative twists retained |
| Recomputed: 3.3 comparison maps/API 1 | Point, p=1; A=0 | Projection-inclusion sends r↦r; other composite sends log 2+iθ↦log 2, difference iθ is a cone boundary; A=0 gives 0 | Pass; strict equality only in the stated order |
| Recomputed: 3.3 shifts and sums | A=ℂ[0]; direct sum of two points | Ordinary A[1] has degree −1; no integer r with 2r=−1; two points give H¹=ℝ² | Pass; no nonexistent shifted Dolbeault structure |
| Recomputed: 3.3 exactness/API 2 | Split sequence ℝ→ℝ²→ℝ in type (0,0), p=1 | Deligne H¹ dimensions 1→2→1; maps a↦(a,0), (a,b)↦b; kernel=image=ℝ×0 | Pass |
| Recomputed: 3.3 differential/API 3 | p=1, x=z barz; constant x=1 | −2∂∂̄x=−2 dz dbarz; constant gives 0; ordinary degrees 0→2 | Pass |
| Retained r2: 3.4 definition and API 1 | Identity refinement; torus blowup | Point class 1↦1; two loop periods (2πi,0),(0,2πi) stay fixed and three-choice composites preserve both | Pass; external ownership disposition below |
| Retained r2: 3.4 pullback/API 2 | t↦t² followed by t↦t³ | Period multiplier 2·3=6 agrees with composite t⁶; identity multiplier 1 | Pass |
| Retained r2: 3.4 descent/API 3 | Cover of P by P,P; empty; P⊔ℙ¹ | Equalizer of (a,b)↦a−b is diagonal ℝ; empty gives 0; disjoint union H⁰=ℝ² | Pass |
| Retained r2: 3.4 colimit/API 4 | Two copies of identity compactification | Both send 1↦1; compatible pairs (r,r) determine the same value r after sheafification or skeleton replacement | Pass; does not identify every presheaf section with a sheaf section |
| Retained r2: 4.1 low-low branch | x=log 2, y=log abs(t), weights 1,1 | Product i log 2 darg t; reverse −i log 2 darg t; circle periods ±2πi log 2 | Pass |
| Retained r2: 4.1 mixed branch below cutoff | x=z barz in D¹(1), y=dw dbarw in D²(1) | Product z barz dw dbarw; both sides of Leibniz equal −2 dz dbarz dw dbarw | Pass |
| Retained r2: 4.1 mixed branch above cutoff | Same x; y=i dw dbarw in D²(0) | Product i(barz dz−z dbarz)dw dbarw; both differentials −2i dz dbarz dw dbarw | Pass |
| Retained r2: 4.1 high-high branch | dz dbarz and dw dbarw in D²(1) | Product dz dbarz dw dbarw; reversed product the same, both differentials 0 | Pass |
| Retained r2: 4.1 Leibniz/API 1 | x=z barz, y=w barw in D¹(1) | Both sides equal −2 abs(w)² dz dbarz+2 abs(z)² dw dbarw | Pass; both inputs may be nonclosed |
| Retained r2: 4.1 unit/API 2 | A=tℝ[t] versus A=ℝ[t], type (0,0) | In the ideal, coefficient of t in et is 0 for every e; in ℝ[t], 1·t=t has coefficient 1 | Pass; unit is asserted only for the second input |
| Retained r2: 4.1 naturality/high even API 2 | Pullback z↦2z, w↦w | Pullback of the four-form is 4 dz dbarz dw dbarw; product of pullbacks has the same factor 4 | Pass |
| Retained r2: 4.1 critical/API 3 | x=z barz, y=1, both weight 1 | Product −barz dz+z dbarz; its Deligne differential −2 dz dbarz equals d_Dx•1 | Pass; ordinary d would give +2 dz dbarz |
| Retained r2: 4.1 point checks | log 2, log 3; weight-zero unit | Product 0 because there are no one-forms; 1•log 2=log 2 | Pass |
| Recomputed: 4.2 homotopy and critical vanishing | Re z,2,3 in even critical degree 0 | Both bracketings 6 Re z, value 6 at z=1; h_a=0 although d(Re z)≠0 | Pass; no closedness hypothesis needed |
| Recomputed: 4.2 associative cohomology | Point constants 2,3,5; three odd point classes | Both bracketings 30; both odd bracketings 0 | Pass; conditional unit now explicit |
| Recomputed: 4.2 non-strict associativity control | x=2,y=3 in D¹(1), z=Re w in D⁰(0) | (x•y)•z=0; x•(y•z)=3(dw−dbarw); associator −3(dw−dbarw) | Pass as a homotopy assertion; excludes identically zero associativity homotopy |
| Recomputed: 4.2 choice compatibility | Boundary blowup and circle exchange | Product period (2πi)² in both choices; exchanged period −(2πi)² in both | Pass |
| Retained r2: 5.1 definition | General pair; 0→ℝ[0] | d² second component=res da−d res a=0; fiber of 0→ℝ[0] has H¹=ℝ, H⁻¹=0 | Pass; matches the shifted native cone |
| Retained r2: 5.1 API 1 | {0}⊂{0,1}; identity | Coordinate r↦(r,0); identity r↦r and direct composite agrees | Pass |
| Retained r2: 5.1 API 2 | Z=∅, Z=X; unit t on 𝔾ₘ | fib(id)=0; fib(A→0)=A; raw connecting (0,log abs(t)) has coefficient −1 | Pass; positive valuation uses the stated opposite adapter |
| Retained r2: 5.1 API 3 | V(x),V(x−1); V(x),V(y) | First product lands in zero fiber; second has origin coefficient 1 | Pass |
| Retained r2: 5.1 API 4 | (0,−log abs(t)) on complement; (0,z barz) | First satisfies d_Dg=0 there; second gives −2 dz dbarz≠0 and fails the cocycle test | Pass; pair equations exclude the wrong representative |
| Recomputed: 5.2 semipurity | Nodal V(xy); cusp V(y²−x³), p=1 | Groups below 2 are 0; degree 2 coordinates (1,1) in ℝ² versus 1 in ℝ | Pass; singular support is included |
| Recomputed: 5.2 codimension bound | Origin in 𝔸², p=1,2; point with p=1 | Origin H² at p=1 is 0, H⁴ at p=2 is ℝ; full point H¹(ℝ(1))=ℝ violates the conclusion without the bound | Pass |
| Recomputed: 5.2 current criterion both directions | f=t, t², t⁻¹ | d_D[−log abs(f)] has coefficients −1,−2,+1; supported class coefficients are 1,2,−1; opposite log reverses each | Pass; normalization locators agree |
| Recomputed: 5.2 API 1 | Normal p-disk for p=0,1,2 | Betti top degree 0,2,4 respectively has ℝ, lower degrees 0; top types (0,0),(1,1),(2,2) | Pass |
| Recomputed: 5.2 API 2 | Axis classes (a,b); double axis | Zero iff a=b=0, checked on both generic axes; reduced/double coefficients 1,2 | Pass; multiplicity is not support alone |
| Recomputed: 5.2 API 3 | Divisors of t and t⁻¹ | Green functions −log abs(t), +log abs(t) give +[0],−[0], respectively | Pass |
| Recomputed: 5.2 intersections and extremes | Axes and double axis; p=0 full/empty support | Intersection lengths 1,2; full H⁰=ℝ per component and negative H=0; empty H=0 | Pass |
| Recomputed: 5.2 normalization | (d,p)=(1,1),(2,1) | Form/current factors ((2πi)⁻¹,1), ((2πi)⁻²,(2πi)⁻¹); their ratio is (2πi)⁻¹ in both | Pass; no dimension-dependent sign drift |
| Recomputed: 5.3 support system | Two axes; empty support | Union contains both classes with coordinates (1,1); empty contributes 0 | Pass; external ownership disposition below |
| Recomputed: 5.3 total and good truncation | (r,n)=(2p,1),(2p−1,1); ω=Re z₁ dz₂ dbarz₂ | Total degrees 2p−1,2p−2 and cube signs +1,−1; dω on (∂x₁,∂x₂,∂y₂) is −2i | Pass; brutal truncation admits a false cocycle |
| Recomputed: 5.3 API 1 | Origin and double origin; point at p=0 | Class coefficients 1,2; normalized point groups ℝ,0,0 in cube degrees 0,1,2 | Pass |
| Recomputed: 5.3 API 2 | n=0,1,2 | Hₚ[−2p] degrees 2p,2p−1,2p−2 equal top total degrees; 3[V] projects to 3[V] | Pass |
| Recomputed: 5.3 API 3 | Origin support in 𝔸¹, p=1; constant point p=0 | Forget-support sends ℝ→H_D²(𝔸¹,ℝ(1))=0; constant-cube map sends 1↦1 | Pass |
| Recomputed: 5.3 API 4 | Classes on the two axes, enlarged to union | Representatives become (1,0),(0,1); sum (1,1); zero stays (0,0) | Pass; finite-union colimit relation fixes maps |
| Recomputed: 5.4 class isomorphism/projection | Point p=0; codimension-one supported column | ℝ→ℝ is 1↦1; after truncation the column has only degree 2 group ℝ, lower groups 0 | Pass |
| Recomputed: 5.4 affine contraction | Point→𝔸¹, p=0,1 | H_D⁰(ℝ(0)) is ℝ→ℝ; H_D¹(ℝ(1)) is ℝ→ℝ; positive normalized columns have 0 cohomology | Pass |
| Recomputed: 5.4 product signs | (n,s)=(1,1),(0,1),(1,2) | (−1)ⁿˢ=−1,+1,+1, separately from Jₙ=−1,+1,−1 | Pass; the two sign factors are not conflated |
| Retained r2: 6.1 specified roof | Point m=0,1,2; zero cycle | Composite sends m↦m through each class/projection arrow; zero↦0; shift by 2p has sign +1 | Pass; arrows exclude the zero-map substitute |
| Retained r2: 6.1 API 1 | Two lifts differing by d(Γ_t,0) | Difference ([0],t) is a boundary; resulting regulator classes differ by 0 | Pass |
| Retained r2: 6.1 API 2 | Units −1,i and 2 | Log absolute values 0,0,log 2; torsion killed, non-torsion witness nonzero | Pass |
| Retained r2: 6.1 API 3 | O(1),O(−1) on ℙ¹ | Normalized integrals 1,−1; raw periods 2πi,−2πi | Pass |
| Recomputed: 6.2 homotopy formula/API | A=A′=ℤ[0], B=0, B′=(ℤ --1→ ℤ), r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong sign gives (1,−1) with differential (0,2) | Pass; both sides of the chain-map equation computed |
| Recomputed: 6.2 support/coherence | Identity, empty/full support; t on 𝔾ₘ | h=0 for identity; empty map 0, full map absolute; raw(log abs t)=−[0], negative Green function gives +[0] | Pass |
| Retained r2: 6.3 pullback | Point→ℙ¹ applied to O(1) | CH¹(point,0)=0 and H_D²(point,ℝ(1))=0; both images 0 | Pass; raw badly positioned cycles are not pulled back |
| Retained r2: 6.3 embeddings | Unit 2 under ℚ→ℝ→ℂ and ℚ→ℂ | Both values log 2 | Pass |
| Retained r2: 6.3 cycle models and motivic reformulation | Cube degrees 0,1,2; k=𝔽₂(t) | Both diagrams transport by 1,−1,1; cycle H¹(k,ℤ(1))=k×, with t nontrivial; categorical perfect-field claim is not applied to this k | Pass |
| Retained r2: 7.1 independent definition | Unit 2eⁱᶿ; different logarithm branches | Re(log 2+iθ+2πik)=log 2 for every integer k | Pass; independent exponential normalization fixes the map |
| Retained r2: 7.1 API 1 | O(a) on ℙ¹; zero K-class and trivial line | ch_D=1+ah; ch_D(0)=0, ch_D(O)=1 | Pass |
| Retained r2: 7.1 API 2 | Projection of 3+4i, p=1,2,3 | πₚ₋₁ gives 3,4i,3; added elements of ℝ(p) project to 0 | Pass; odd and even twists distinguished |
| Retained r2: 7.1 classifying-space route | Constant simplicial ℤ; constant simplicial S₃ | Abelian case π₀=H₀=ℤ and higher groups 0; S₃ has nonabelian π₀ of order 6, excluded from Dold–Kan | Pass; group completion and abelianization are not conflated |
| Retained r2: 7.2 regulator equality | Rank 2; O_point on ℙ¹; unit 2 | Both values 2; both degree-two coefficients 1; both logarithms log 2 | Pass |
| Retained r2: 7.2 coefficients/support | p=2 higher character; full/empty support; t boundary | Both Newton coefficients −1; full absolute map, empty 0; raw boundary coefficient −1 on both sides | Pass |
| Recomputed: 7.3 products | Unit 2 and t, degrees 1,1 | Period +2πi log 2; swapped −2πi log 2; parity of (2p−n)(2q−m) equals nm, so both exchange signs are −1 | Pass |
| Recomputed: 7.3 units and intersections | Weight-zero unit; two ruling divisors on ℙ¹×ℙ¹ | 1·x=x; intersection degree 1, or 2 for a doubled ruling | Pass on geometric unital algebras |
| Recomputed: 7.3 point odd product | Units 2 and 3 | Product lies in H_D²(point,ℝ(2))=0 on both sides | Pass; does not replace the nonzero curve test |
| Retained r2: 7.4 logarithm law | u=2,v=3; 1,i,1/2 | log abs(6)=log 2+log 3; values 0,0,−log 2 | Pass; inverse and torsion distinguished |
| Retained r2: 7.4 two-unit representative | f=2,g=t | i(log abs(f)darg g−log abs(g)darg f)=i log 2 darg t, period 2πi log 2 | Pass; same normalization as §4.1 |
| Retained r2: 7.4 divisor and projective witnesses | tᵃ; O(a), a=−1,0,1 | Green function −a log abs(t) gives coefficient a; projective integrals −1,0,1 | Pass; positive unit logarithm and negative divisor Green function remain distinct |
| Recomputed: 3.1 geometric unit and pullback | A=E_log(W); W=∅; t↦t² | 1·ω=ω; pullback(1)=1; on ∅ the sole section has 0=1 | Pass; geometric input supplies the identity required in §4.1 |
| Recomputed: 3.3 opposite cone adapter | d₊ third=f−r−dω; T negates third coordinate | T d₊ third=r−f+dω=d₋ T third; inverse T² third=ω | Pass; a sign change on the third coordinate is essential |
| Recomputed: 3.3 point quotient with cone adapter | 3+4i in twists 1,2,3 | Raw quotient coordinates 3,4i,3; T gives −3,−4i,−3; transported coordinate gives 3,4i,3 | Pass; raw and transported coordinates are distinguished |
| Recomputed: 4.2 nonunital associativity | A=tℝ[t], d=0, type (0,0) | (t·t)·t=t³=t·(t·t); no e has et=t since coefficients are 0 versus 1 | Pass; multiplication/associativity survive without a unit |
| Recomputed: 5.3 J transport Check | Cube degree 1, total bidegree (r,−1) | J₀∂=∂; δJ₁=(−∂)(−1)=∂; total coefficients both (−1)^r | Pass; applies to support and forget-support arrows too |
| Recomputed: 2.0a/2.3 regular nonsmooth scope | k=𝔽_p(t), L=k[s]/(s^p−t), p=2,3; X=Spec L | Local dimension=embedding dimension=0; dim_L Ω¹_L/k=1; K₀(L)ℚ=CH⁰(L,0)ℚ=ℚ with 1↦1 | Pass; the repaired regular scope now includes X |
| Recomputed: 2.3 regular supported repair | X=𝔸¹_L, Z={u=0}, same p=2,3 | Supported weight-one groups ℚ→ℚ, 1↦1; B[u]=+1, δ_raw[u]=−1, −δ_raw[u]=+1 | Pass; repaired scope preserves the boundary convention |
| Recomputed: 2.0a relative-cycle definition | V=Spec L, D empty, c=0, L=𝔽_ℓ(s), ℓ=2,3 | Raw cycles ℤ[V]; a degree-zero homotopy m[V×𝔸¹] restricts to m[V] at 1, so vanishing forces m=0; quotient ℤ, rationally ℚ | Pass; relation does not kill the rank generator |
| Recomputed: 2.0a relative-cycle API 1 | W=V=Spec L, D empty, c=0 | Raw generator 1 maps to [L] of rank 1 in K₀(L)^(0)=ℚ; 0 maps to 0 | Pass; zero map excluded |
| Recomputed: 2.0a nonzero relative degree one | V=□_L, D its faces, point with cube coordinate s | Class maps to [s]∈L×⊗ℚ with s-adic valuation +1; inverse and zero models give −1 and 0 | Pass; no smoothness over 𝔽_ℓ(t) is used |
| Recomputed: 2.0a cover and split face hypotheses | z=t/(t−1); opens D(z), D(1−z) | z+(1−z)=1; at the two faces values are (0,1),(1,0); each open retains one face and its constant retraction | Pass; the required cover is finite and generates 1 |
| Recomputed: 2.0a incidence negative control | W={z=0} in the one-dimensional cube | Ambient codimension 1, codimension inside its zero face 0 | Pass; the proper-incidence hypothesis excludes W |
| Recomputed: 2.0a support-local flat naturality | Spec L→Spec k, c=0, empty divisor and full support | Flat pullback sends cycle coefficient 1 to 1 and rank-one [k] to rank-one [L] | Pass; the same square commutes |
| Recomputed: 2.3 regularity versus smoothness, ℓ=2 | k=𝔽₂(t), L=k[s]/(s²−t) | v_t(t)=1 is not divisible by 2; dim=embdim=0; dim Ω¹=1; L⊗ₖL has basis 1,ε with ε²=0 and ε≠0 | Pass; regular input with nonreduced geometric base change is included |
| Recomputed: 2.3 regularity versus smoothness, ℓ=3 | k=𝔽₃(t), L=k[s]/(s³−t) | v_t(t)=1 is not divisible by 3; dim=embdim=0; dim Ω¹=1; L⊗ₖL has basis 1,ε,ε² with ε³=0 and ε≠0 | Pass; the repair is not specific to characteristic 2 |
| Recomputed: 2.3 coordinate-retraction route | X=Spec L or 𝔸¹_L in the preceding two examples | At coordinate origins, dim=embdim=n on Spec L×□ⁿ and n+1 on 𝔸¹_L×□ⁿ; restriction after section sends 1 to 1 | Pass; products are smooth over X, though X need not be smooth over k |
| Recomputed: 2.3 finite-field descent | Extension degrees d=2 and d=3 | Transfer after restriction sends rank 1 to 2 or 3; multiplying rationally by 1/2 or 1/3 restores 1 | Pass; neither integral division nor imperfect-field regularity descent is asserted |
| Recomputed: 2.3 supported identity and enlargement on nonsmooth inputs | X=𝔸¹_L, Z={0}⊂{0,1}, ℓ=2,3 | Identity sends 1 to 1; enlargement sends 1 to (1,0); divisor and resolved sheaf have the same coordinates | Pass; enlarged regular scope retains the support API |
| Recomputed: 2.3 full support and disconnected grading | Spec L⊔ℙ¹_L, full support, rank vector (2,1) | CH⁰⊗ℚ=ℚ² and K₀^(0)=ℚ² with (2,1)↦(2,1); CH¹⊗ℚ=0⊕ℚ | Pass; full support does not merge component ranks |
| Recomputed: 2.3 smooth universal-class restriction | Spec ℚ with unit 2; ℙ¹ with O_point | Geometric inverse and universal character give [2] with 2-adic valuation 1, and h with normalized degree 1 | Pass; the additional identification remains in its smooth scope |

### Source verification

All ten works already have unique lifetime keys in sources.toml. Seven certified cached extracts were read. Levine98 remains waived; Bloch86 and Beilinson85 remain uncertified. No work required a fetch, no entry was added or rewritten, and no settled request was reopened. BF, BFT, BKK and KLM citations refer to the versions identified by the manifest; their preprint numbering is not presented as the later journal numbering. Article pagination is retained for Levine94, Burgos94 and DeligneHodgeII.

| Seeded target | Locator read | Hypotheses, numbering and result |
| --- | --- | --- |
| 1.1 Normalized cubical cycles | BF line 381–391, §1.6, p.8; BF line 610–650, §2.1, pp.13–14 | Infinity-face kernels and degeneracies agree. Equidimensional quasi-projective schemes over a field suffice; the adapter is δ=−∂, Jₙ=(−1)ⁿ. The earlier review's §1.4 label for BF p.8 was inaccurate; the source section is §1.6. This was a review-label issue, not a package finding. |
| 1.2 The mixed complex and its axes | BFT line 943–963, §6.4, Proposition 6.12, pp.19–20 | Arbitrary field and equidimensional quasi-projective X; normalization only in the cube direction. Both axes are integral quasi-isomorphisms. The subsequent projective complex explicit-current construction is not substituted for this scope. |
| 1.3 Integral comparison and supports | Levine94 line 1740–1779, Lemma 4.6 and Theorem 4.7, pp.295–296; BFT line 961–963 | Cubical/simplicial integral comparison has the required field scope. Restriction fibers and derived coefficient change are obtained from the comparison and supplied exact derived algebra, retaining torsion. |
| 2.1 The actual higher character | Levine94 line 1197–1269, Theorem 3.1 and proof, p.276 onward; BF line 961–997, §3.2, pp.21–22 | Smooth quasi-projective input in this target. The structure-sheaf geometric map is distinguished from the universal-class character, which is explicitly constructed in BF over ℂ. Its arbitrary-field universal-class source is the settled unread Bloch86 §7. |
| 2.2 Weights and the higher comparison | Levine94 line 1210–1269, Theorem 3.1, p.276 onward; BF line 905–919 and line 961–997, Theorem 3.5 and proof, pp.20–22 | Smooth scope, rational eigenweights and universal-class comparison are separated. BF's wider header is not copied. Projector denominators 2ⁱ−2ʲ are used only for i≠j. The unread arbitrary-field portion is not certified by the ℂ proof. |
| 2.4 Products and degree-zero agreement | Levine94 line 2195–2255, Theorem 5.2, pp.312–313; BF line 961–997, pp.21–22 | Smooth products, rational comparison and degree-zero normalization agree. The package supplies the higher tensor/universal-class comparison route rather than attributing all its details to the degree-zero statement. |
| 3.1 The smooth logarithmic Dolbeault algebra | Burgos94 line 155–192, §2, pp.65–67; BKK line 4217–4232, Definition 5.20, pp.116–117 | Smooth forms with logarithmic generators along SNC boundary are the generated image in forms on the complement. BKK gives readable generators where scan displays drop out. Smooth scalar 1 supplies the geometric identity. |
| 3.2 Geometric filtered comparison | Burgos94 line 181, Theorem 2.1 and Corollary 2.2, p.67; DeligneHodgeII line 1044, Proposition 3.1.8, p.33; line 1142–1171, Theorem 3.2.5, pp.35–36; line 1213–1255, refinement discussion and Corollary 3.2.13, pp.37–38 | Shifted weight W[n], Hodge E₁ and weight E₂ degeneration agree. Proper nonprojective geometric Hodge input is explicitly supplied by ComplexComparisonPartII §C5.3. Refinement does not assert invariance of every residue graded complex. The closed-jet contracts remain declared gaps. |
| 3.3 The Deligne functor on Dolbeault complexes | BKK line 3999–4112, Definitions 5.7–5.10 and Proposition 5.12, pp.110–113 | Bounded-below real Dolbeault complexes and every integer twist; cone map f−a, small model, exactness and specified deformation retract agree. Opposite cone convention is transported by negating its third coordinate, not silently identified. |
| 4.2 Associativity and choice compatibility | BKK line 4142–4158, Proposition 5.15, p.114; BF line 506–514, Proposition 1.26, p.10 | Natural degree −1 homotopy; even-critical vanishing requires no closedness. BF's codomain-degree typo is corrected in the package. Unit conclusions remain conditional on unital input. |
| 5.2 Semipurity with singular support | BF line 530–552, equation (1.30) and Proposition 1.31, p.11; BKK line 4795–4874, Proposition 5.58, pp.132–133; BKK line 4395–4408, equation (5.38), p.122; line 4450–4462, Definition 5.41, p.123 | Codim Z≥p, arbitrary singular support, vanishing below 2p and top component classes are supported. Both directions of the current criterion agree. Test forms precede the represented form; cycle dimension d−p supplies its factor. |
| 5.3 The auxiliary support resolution | BF line 705–774, §§2.4–2.5, pp.15–17; BFT line 253–275, Proposition 4.3, p.7 | Good truncation, support colimit and simple total complex agree. Jₙ transports d_D+(−1)^rδ to the package's chosen cube differential and applies to support/forget-support arrows. |
| 5.4 Cycle classes and affine contraction | BF line 720–735, Proposition 2.8, p.15; line 741–744, Corollary 2.9, p.16; line 753–757, Lemma 2.11, p.16; line 766–785, Proposition 2.13, pp.16–17; BFT line 266–275 | The class map, top projection and affine contraction have the stated directions. Proposition 2.8 concerns ordinary normalization; Corollary 2.9 concerns the refined normalization. They are not conflated. |
| 6.2 Restriction homotopies and supported realization | BF line 199–206, p.5; line 315–322, p.7; line 877–885, Proposition 3.3, p.19 | Pair differential and restriction naturality agree. The supplied enhancement provides coherent inverses/diagrams. For a nonzero restriction homotopy, +ha yields differential (0,0), whereas −ha yields (0,2). |
| 7.3 Multiplicativity of the universal map | BF line 1440–1464, §5.1, p.31; line 1535–1628, §5.2, pp.33–35, especially Proposition 5.13 and Corollary 5.14, p.35 | Integral higher-cycle source and real target, product homotopies and derived-diagram comparison agree. The total-complex sign is (−1)ⁿˢ, separate from Jₙ. The p+q target is correct in the package despite the BF typo listed below. |

For the repaired regular input, Levine94 Lemmas 2.2 and 2.5, Theorems 2.7 and 3.4 were read at line 777–889, line 1006–1037, line 1101–1117 and line 1399–1437 respectively. The regular proof step inside Theorem 3.1 was separately read at line 1223–1269; its smooth theorem header alone was not used to justify the repair.

Additional source checks covered BKK Definitions 5.13–5.14 and the critical product formula (BKK line 4121–4140 and line 4176–4180, pp.113–115), its compactification comparisons (BKK line 4239–4316, pp.117–119), the regulator roof (BF line 862–895, p.19; BFT line 277–304, p.7), and the positive real logarithm after projection (BKK line 3965–3990, p.110; KLM line 546–560, §5.3, p.13). Burgos94 line 316,337,345,358 locates Theorems 3.1,3.3–3.5, pp.72–74, and line 379–381 locates Proposition 4.1, p.75. Missing scan-display glyphs are disclosed below. The author-flagged unread locators remain explicitly uncertified or waived.

### Pinned declarations and duplication by object

The content checkout is origin/main 6f49035bfffd3beed70feb15cf2f01db30a471be. The roadmap service's main snapshot is 1c3cc07; its roadmap README diff against this checkout's origin/main is empty. The stale local branch named main was not used. The manifest and actual library checkouts agree on Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

The following declarations and their defining fields were opened at those pins. In particular, the native cycle body is `Function.locallyFinsupp X R`, a Scheme extends `LocallyRingedSpace`, and the derived-category construction carries `HasDerivedCategory`. None supplies the additional geometric hypotheses implicitly.

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

TauCeti/Geometry/Manifold/ContMDiffMap/WeakWhitney.lean:87 additionally defines weakWhitneyJet by differentiating an existing smooth map. It does not extend arbitrary closed-set jets or prove the real-analytic flat-ideal sum. Object searches in both pinned trees covered higher Chow/Bloch cycles, face conditions, perfect scheme K-spectra, multi-relative spectra, real Dolbeault/Deligne complexes, Whitney extension and flat ideals. They found the native prerequisites above, but no native replacement making a missing headline statable with only a few simple definitions.

Ownership searches used roadmaps list, grep and show on main and the 332 open roadmap heads indexed at 2026-10-24T03:32:32Z, including the named sibling set in the brief. Existing-roadmap progress branches were not substituted for main suppliers. The board package index was read before making any absence claim; 22 indexed head READMEs were retrieved and searched and 15 returned HTTP 404. The local package/design tree was also searched. The ownership conclusion is limited by those 15 unavailable files, listed below.

| Object searched | Existing owner / result | Disposition |
| --- | --- | --- |
| Scheme cycle carrier, modules, complexes, cones, Dold–Kan | Exact pinned files above | Imported; no duplicate acceptance declarations. |
| Simplicial higher cycles, moving, localization and motivic-to-K tower | KTheoryFiniteLocalFields §3.0a; MotivesAndAlgebraicCycles §§4.7–4.8 | Cubical/mixed adapters here use the same source. This is a genuine extension, not replanning the higher-cycle library. |
| Perfect scheme K, Adams operations and degree-zero character | SchemeKTheoryOperations §§2–3,6–7; GeneralAlgebraicKTheory cited targets | Generic operations remain imports; higher character extends their actual map. |
| Supported multi-relative cube carrier and full-cube relativity | ColemanIntegration §L3.Fa.2 at ae078af | External F03 is settled in this package; the consumer still requires the recorded import. |
| Ordinary forms, currents, holomorphic log complex, proper Hodge theory | DifferentialGeometry; ComplexKahlerGeometry; ComplexComparisonPartII | Retained variant here is the smooth image logarithmic algebra, filtered geometric comparison, real Deligne functor and support theory; these are not native current replacements. |
| Generic compactification-independent real Deligne cohomology and universal character | BorelRegulators §6.0a at e39a3c4 | External F02 is settled here. The companion scope includes general smooth varieties and BGL; it has not yet imported the shared core. |
| Supported auxiliary complexes and abstract regulator roof | Polylogarithms §5.2 at 4696a1a | External F04 is settled here: same objects after Jₙ; its additional current adapters remain separate. |
| Number-field regulator specialization | packages/PeriodsAndSpecialValues/README.md:747 at 9f14c68 | Arithmetic specialization uses the same ℂ/ℝ(p) projection. It is downstream of the general normalization, not an earlier generic supplier. |
| Syntomic regulators and finite-coefficient arithmetic | packages/PadicHodgeRegulators/README.md:806 at 5eff35d; HabiroNumberFields at da336a9; EllipticKTheory at fd76424 | Different coefficients or arithmetic consumers; no justification for duplicating the real Deligne core. |
| Requested M.8 character/normalization | packages/ZagierConjecturePolylogarithms/design/README.md:1491–1495 | The requested label exists in the available design; this package's lines 717–721 map it to §§2.1–2.2,7.1,7.4. It is a consumer, not a supplier. |
| Irregular logarithmic filtration at zero function | packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:1534–1564 | At f=0 its pole divisor is 0 and it recovers ordinary filtered log forms. Exponential/pole-order constructions remain there; no reverse dependency is introduced. |

The object searches also separated real Deligne constructions from syntomic/p-adic regulators, smooth Whitney extension from Stiefel–Whitney classes, and the shared face-vanishing relative cycles here from MotivesAndAlgebraicCycles §4.8a's finite/equidimensional specialization theory. No new common owner was found among the accessible sources. There are no fully qualified declaration collisions from this package: its acceptance namespace is empty.

### Supplier contracts and direction

Every supplier citation was re-resolved and its cited statement read at main or the supplied new-roadmap head. The resolver returned no unresolved cross-roadmap citation or Lean name; its omission of pinned Lake trees was covered by the direct declaration audit above. The following table gives the concrete locations, not remembered section names.

| Supplier and version | Resolved file / section locations | Contract checked |
| --- | --- | --- |
| GeneralAlgebraicKTheory, e0552fe | TauCetiRoadmap/GeneralAlgebraicKTheory/README.md:627,795,827,925,1333,1623,1651,1669,1687,1938,1950; §§3.12,4.6,4.8,4.14,6.3,7.4–7.7,8.12–8.13 | Actual K-models, exactness, pairings and DVR sign. At n=1, B[t]=+1; at n=2 the last-slot adapter is −B, matching §§2.2–2.3 here. |
| SchemeKTheoryOperations, 88dbd5a | TauCetiRoadmap/SchemeKTheoryOperations/README.md:373–596,663–820,1102,1627,1979–2106,2225–2280; §§2.1–2.6,3.1–3.6,4.3,6.1,6.7–6.9,7.1–7.3 | Supported perfect K, external pairing, actual classifying objects/stability, regular-base A¹ representability, finite weights and existing degree-zero Chern character. Line 2106 supplies the several-variable uniqueness needed by §2.0a. Downstream ownership at line 2403 remains the settled external F03 item. |
| KTheoryFiniteLocalFields, afe02e8 | TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:478–501,1468–1472; §3.0a and §6.10 | Shared integral simplicial cycles, moving including finite fields, tower and diagonal Chern. Boundary [1]−[0] and coefficients 1,−1,2 in degrees 1,2,3 agree. The general scheme character is an extension/comparison, not a second field-diagonal theorem. |
| MotivesAndAlgebraicCycles, 79b02f6 | TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md:675,690,710,813,858,872; §§4.7–4.8a,4.14,4.17–4.18 | Shared-cycle adapters, relative-cycle specialization and perfect-field/resolution-dependent motive comparisons. Those extra hypotheses do not leak into the arbitrary-field cycle theorem. |
| SchemeAndStackFoundations, main | TauCetiRoadmap/SchemeAndStackFoundations/README.md:3265,3309,5613,6075,6567–7107; §§2.1–2.2,4.12,4.17,5.1–5.8 | Scheme cohomology, Chow domination, SNC predicate, cycles, Chern classes, intersection and degree-zero K/Chow theory. No second ordinary Chow or c₁ carrier is proposed here. |
| ResolutionOfSingularitiesCharacteristicZero, bf45c86 | TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:672–728,758–802; §§5.1–5.6,6.1–6.4 | Resolution/principalization preserving the open and boundary; projective compactification for quasi-projective input. General separated input instead uses Nagata before resolution. |
| EtaleCohomologyFoundations, main | TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57,105,139; §§G.1–G.3 | Dense compactification, Nagata existence and finite-diagram proper common refinements. No étale coefficient theorem is needed here. |
| ComplexComparisonPartII, 2d50a88 | TauCetiRoadmap/ComplexComparisonPartII/README.md:699,856,2337,2895,2974,2994,3018,3401,3743,3850,3990; §§C−1.1,C−1.4,C5.1,C5.3–C5.6,C6.0 | Analytification, currents, holomorphic logarithmic forms, proper algebraic Hodge theory, stratified topology and regular-singular comparison. For the trivial connection all residues are 0, satisfying “not a positive integer.” Finite CW type is not incorrectly replaced by compactness. |
| EnhancedDerivedSheaves, main | TauCetiRoadmap/EnhancedDerivedSheaves/README.md:259,429–492,580,2293–2340; §§E0.6,0.1–0.4,E1.4,E2.6 | Enhancement, replacements, tensor, coherent diagram inversion and descent; point-site specialization supplies module complexes. Ordinary DerivedCategory alone would not supply these coherences. |
| DifferentialGeometry, main | TauCetiRoadmap/DifferentialGeometry/README.md:268,311,503,782,806,816,862; Layers 0–1,5–9 | Form calculus, integration, Stokes and duality. The two Whitney/flat-ideal extensions are declared gaps, not falsely attributed to these sections. |
| ComplexKahlerGeometry and ComplexManifolds, main | TauCetiRoadmap/ComplexKahlerGeometry/README.md:96,193, K1–K2; TauCetiRoadmap/ComplexManifolds/README.md:172,197, Milestones 1–2 | Finite-dimensional Hausdorff second-countable calculus and transported orientation. Complex basis order (e₁,ie₁,…); one complex disk has positive orientation and exchanges of two one-dimensional residue directions give −1. |
| AlgebraicTopology, main | TauCetiRoadmap/AlgebraicTopology/README.md:326,471,946,1654–1678; Stages 2–3, Stage 6 items 1–4, Stage 8 item 2 | Relative cohomology, excision, products, manifold local duality; Kan/Moore comparison with the abelian hypothesis for the chain-complex statement. |
| Completed/HodgeStructures, main | Completed/HodgeStructures/README.md:104,271, pure/mixed structure milestones | Linear Hodge theory is imported through the exact pinned declarations above. No geometric logarithmic assertion is attributed to the completed linear theory. |

Downstream citations were resolved too: TauCetiRoadmap/Polylogarithms/README.md:772,852,1028,1062,1153,1320 (§§5.2–5.3,5.9–5.10,5.13,5.17); TauCetiRoadmap/ColemanIntegration/README.md:2393,2433,2456,2648 (§§L3.Fa.1–L3.Fa.3,L3.Fc.1); TauCetiRoadmap/BorelRegulators/README.md:722,746,765,788 (§§6.0a–6.2). The design labels at packages/ZagierConjecturePolylogarithms/design/README.md:1495 and the zero-function specialization at packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:1534–1564 were read locally. Their references are consumer mappings, not Needs edges.

All 27 Needs lines and seven layer dependencies were read. The incoming regular-base spectrum/Adams operations are in SchemeKTheoryOperations, its several-variable A¹ uniqueness is explicitly at §6.9, and coherent restriction diagrams are in EnhancedDerivedSheaves. These inputs are not inferred from a bibliographic citation or from the desired regulator theorem. No local target-order cycle was found. The required dependency command with --movable completed with exit 0 and this entire output:

```text
depcheck: 29 roadmaps, 261 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The merge order and tooling were not changed.

The gap slugs and their needs match packages/MotivicEtaleKTheory/design/plan.json and README:83,91. Both name DifferentialGeometry, Part II: Whitney jets and flat functions. The first asks for infinite-order compatible finite-dimensional real jets on a relatively closed subset of an open Euclidean set, including its parametric hyperplane instance. The second asks for one flat-ideal equality for relatively closed real-analytic sets. They are precise, minimal contracts. The native weak Whitney topology and the supplier's manifold calculus do not provide either result. The coordinate-division and logarithmic-power estimates remain local targets in §3.2. Acceptance is conditional on those two contracts, as permitted by the brief.

### Shape, headline coverage and Lean

The main-branch TauCetiRoadmap/ComplexTori/README.md and Completed/HodgeStructures/README.md were read for repository shape. This package has the required title, Summary, scope, conventions, supplier subsections, reading paragraph, seven layers, Examples, Dependencies, consumers and references. All 27 numbered targets retain prose APIs where definitions are made and at least three Checks: counts range from 3 to 9, with 9 at §2.0a and 5 at §2.3. Hypotheses and source locators accompany the theorem statements. Mathematical uses of “current” refer to current theory. No process narrative, local machine path, own undeclared backticked target, algorithm, prohibited option or copied source block was found in the package. metadata.toml and sources.toml parse; the metadata topic is math.AG.

These are the README's 13 headline groups and their acceptance-docstring coverage:

| Headline | README | Missing carrier named in Suggested.lean |
| --- | --- | --- |
| Integral cubical/simplicial comparison with supports, coefficients and operations | §§1.3–1.4 | Face-admissible higher-cycle complexes and shared higher Chow groups |
| Adams-compatible ordered relativity and supported multi-relative pairings | §2.0a | Scheme perfect K-spectra, supported face diagrams and Adams operations |
| Universal integral motivic Chern operations | §2.0b | Scheme higher K, higher Chow and stabilized classifying-sheaf models |
| Regular supported rational cycle/K comparison and full support; smooth universal-class identification and products | §§2.1–2.4 | Supported scheme K-groups and cycle restriction fibers; the actual universal character |
| Bifiltered logarithmic comparison and shifted mixed-Hodge data | §3.2 | Geometric logarithmic sheaves, residue filtration and Betti/de Rham comparison |
| Small Deligne complex and cone deformation retract | §3.3 | Real Dolbeault-complex carrier, type projections and Deligne construction |
| Compactification-independent Deligne realization, pullback and descent | §3.4 | SNC compactification diagrams and filtered logarithmic Deligne complexes |
| Deligne product, natural associativity homotopy and conditional unit | §§4.1–4.2 | Real Dolbeault algebras and Deligne complexes |
| Singular-support semipurity and normalized current criterion | §5.2 | Geometric Deligne support cohomology and form/cycle-current comparison |
| Supported cycle resolution and affine contraction | §5.4 | Good-position support diagrams and truncated Deligne total complexes |
| Universal derived regulator with restrictions, pullback and model independence | §§6.1–6.3 | Both actual motivic and Deligne carriers and enhanced restriction diagrams |
| Independent Beilinson character and equality with regulator composed with the higher character | §§7.1–7.2 | Scheme higher K, universal geometric Deligne classes and both realization maps |
| Integral-source multiplicativity of the universal regulator | §7.3 | Higher Chow, Deligne cohomology, products and the constructed regulator |

All thirteen are explicitly named in the module docstring. None is already statable at the pins with only a few simple native definitions: constructing their absent geometric carriers is substantial mathematical work. Section 7.4's scalar and projective witnesses fix the normalization of those maps; scalar versions alone would be stand-ins. The empty acceptance namespace is therefore justified, not missing a statable headline.

The required lake env lean invocation on packages/MotivicEtaleKTheory/Suggested.lean was run from the content checkout: **exit 0, empty output, no errors and no warnings**. The file contains one import Mathlib, one module docstring and the required namespace. It has zero definitions, theorems, instances, examples, TauCeti imports, sorry terms or set_option commands. No targeted Tau Ceti build was needed.

For the mechanical binder audit, comments were stripped and every declaration inventoried: there are zero names and consequently zero #check @name lines to append. The scratch copy prepared for that audit was elaborated once as requested: **exit 0, empty output, no warnings**. There are no disappearing section variables or signature changes. The one-tactic padding probe has zero sorried declarations to try. No Lean process from this review remains running.

## Not verifiable

- **Bloch86 §7:** settled uncertified/paywalled. The arbitrary-field universal integral Chern construction and universal-class equality in §§2.0b and 2.2 were not text-certified. BF supplies the readable complex-field construction, and Levine94 independently supplies the geometric rational comparison. The general source was not guessed or requested again.
- **Beilinson85 §§1–2:** settled uncertified/paywalled historical source. Its text was not read. The explicit comparison route was checked in BF.
- **Levine98:** settled waived, at its manifest locators Part I, Chapter II §§2–3, Chapter III §1 and Chapter V §2. No finer proof assertion from that text was certified.
- **Scan displays:** portions of Burgos94's Whitney/Borel/flat-ideal and Proposition 4.1 displays, and portions of Levine94's diagrams, lose glyphs in extraction. Their numbered surrounding hypotheses were readable; BKK supplies readable logarithmic generators. No available local PDF renderer supplied the missing glyphs, so full display-level certification of those portions is not claimed. The independent computed tests and declared contracts do not substitute for reading a missing display.
- **Fifteen indexed board heads:** README contents requests returned HTTP 404 for ArithmeticLocallySymmetricSpacesPartII@84a41ac; CompletedCohomologyAndLocalGlobalCompatibilityPartII@948c94c; CrystallineCohomologyPartII@84ea77e; EndoscopicTransferAndUnitaryTraceComparisonPartII@80a66cc; HigherHidaAndColemanTheory@da88512; LawrenceVenkateshMethod@9ee7ac3; OrdinaryAutomorphicFormsAndModularityLiftingPartII@7e88c38; PELModuliPartII@d4bb48d; PadicHodgeTheoryPartII@6502997; PadicLocalLanglandsForGL2QpPartII@3e0777d; RealSurfacePeriodIndex@875bca4; SchemeAndStackFoundationsPartII@accb0a0; ShimuraVarietiesPartII@57dc0a4; VStackSheavesAndLisseCategoriesPartII@0987ba7; VectorBundlesAndIsocrystalsPartII@b58d862. Ownership against these package READMEs was not checked. The other 22 indexed head READMEs were retrieved and searched; no claim of global absence rests on the failed requests.

There is no new missing-reference request. The three unread works retain their settled keys/statuses. No source text was copied into the repository. The author's README.md, Suggested.lean, metadata.toml and sources.toml remain unchanged; only the two required review deliverables were written in the package.

## Source issues

- **Misprint** in BF at Proposition 1.26, printed p.10 (BF line 508): the source says the associativity homotopy lands in degree r+s+t; it should be degree r+s+t−1, so its differential has the associator's degree; affects a stated result.
- **Error** in BF at Proposition 2.7, printed p.15 (BF line 689–704): the source says the internal product applies to every quasi-projective algebraic scheme; it should be stated for smooth quasi-projective schemes, as required by the preceding diagonal-pullback construction; affects a stated result.
- **Error** in BF at Theorem 3.5, printed p.20 (BF line 905–919): the source says the K-to-higher-Chow comparison applies to every equidimensional complex algebraic scheme; it should be scoped to the smooth quasi-projective setting used in the proof; affects a stated result.
- **Misprint** in BF at proof of Theorem 3.5, printed p.22 (BF line 1006–1011): the source says the universal bundle on k-planes in ℂᴺ has rank N and classifies through BGL_N; it should be rank k and BGL_k for that Grassmannian convention, or consistently reversed indices; affects the proof.
- **Misprint** in BF at proof of Lemma 5.1, printed p.31 (BF line 1453): the source says the input forms have twists n and m; it should be twists p and q on X×□ⁿ and Y×□ᵐ, respectively; affects the proof.
- **Misprint** in BF at §5.2 support notation, printed p.32 (BF line 1508): the source says the X-support indexed by n is obtained from supports indexed by m; it should be indexed by n consistently with X×□ⁿ; affects nothing.
- **Misprint** in BF at §5.2 forget-support maps, printed p.34 (BF line 1566–1567): the source says forgetting support lands in the complex of twist p; it should be twist p+q, matching the source complex and the product; affects a stated result.

The first six source issues persist from the preceding review and were checked at their lines; the seventh was found in this round's product-diagram reading. For the product issue, BF line 689 uses a smooth diagonal pullback before the broader proposition header. For the K-comparison issue, Spec ℂ[ε]/(ε²) has rational K₁ classes 1+εℂ, whereas cycles are nilpotent-invariant. The package retains smoothness where needed and keeps the correct homotopy degree, twist and support index. No published correction was established. These source errata are not package findings.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1064583686e6fc7de5bd3c3c648d490a62c5b3c1", "job": "REV-PKG-MotivicEtaleKTheory~3", "model": "gpt-6-astra", "worker": "chris-3"} -->
