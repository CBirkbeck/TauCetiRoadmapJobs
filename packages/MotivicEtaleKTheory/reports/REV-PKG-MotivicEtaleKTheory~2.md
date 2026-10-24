<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1047#issuecomment-6378871950 -->
Review (codex) of 217be4b

Verdict: needs_changes

1. **F01** (P2) Preserve the regular nonsmooth supported comparison

   **Location:** packages/MotivicEtaleKTheory/README.md:282, with the inherited hypothesis at :241 and the relative-cycle clause at :200. The supported theorem begins “For X/k as in 2.1 and every closed subset Z⊂X”. Section 2.1 requires smooth quasi-projective X/k.

   **Claim:** The package develops the general supported rational cycle/K comparison available from its cited source. Its actual target omits regular quasi-projective schemes that are not smooth over the ground field. This is an omission, not a counterexample to the stated smooth theorem.

   **Witness:** Levine94 line 1405, Theorem 3.4, printed pp.283–284, assumes regular quasi-projective X. For k=𝔽₂(t) and L=k[s]/(s²−t), Spec L is regular but Ω¹_L/k=L ds≠0, so it is not smooth over k.

   **Exact repair:** Add the regular quasi-projective form of the supported weight comparison, for every field k, closed Z⊂X and n,p≥0, on the same support fibers: CHᵖ_Z(X,n)⊗ℚ ≃ Kₙᶻ(X)^(p), with its localization-sequence compatibility. Its full-support specialization must also be available. Supply its geometric cycle-map route at this generality, rather than routing the entire assertion through §2.1's smooth universal-class construction. In particular, retain the regular, infinite-field generality of Levine94 Theorem 2.7, pp.272–273, in the relative-cycle input used for this result; keep its moving/splitting hypotheses. Identify the inverse with the universal-class character in the smooth scope already justified by §§2.0b–2.2. Smooth product and complex-realization assertions need no blanket widening. Adjust the scope and the headline docstring to distinguish the general supported comparison from that additional identification. Add the following regular-but-not-smooth negative control.

   **Repair tested on the witness:** L is a field, so its local dimension and embedding dimension are both 0. The geometric base change L⊗ₖL=L[ε]/(ε²) has a nonzero nilpotent. With X=Spec L and Z=X, the degree-zero weight-zero comparison sends 1∈CH⁰(L,0)⊗ℚ=ℚ to [L]=1∈K₀(L)⊗ℚ=ℚ. With X=𝔸¹_L viewed over k and Z={u=0}, the weight-one supported groups are both ℚ, and the generator maps 1↦1. The boundary of u is +1 in the supplied K convention, −1 in the raw pair-fiber convention, and +1 after the declared adapter. Replacing 2 by 3 gives L⊗ₖL=L[ε]/(ε³) and the same values. Thus the repair includes the omitted objects and preserves the package's normalization. No identification with K(Z) for singular Z is introduced.

One new P2 scope omission; no new P1 or P3 findings. The package is repairable without replanning. The two in-package findings from the previous review are repaired. The three companion-roadmap findings remain only partly repaired globally, but are settled as not actionable in this package under the supplied review rule.

## Verified sound

The review covered all 27 numbered target sections, their APIs and Checks, the standing conventions, the two gap contracts, all seven layer dependency summaries, and all 27 target-specific Needs lines. The seeded sample contains 15 targets; all readable locators were checked against the cached texts. The computed table below contains 133 rows. A passing test is evidence for the stated instance, not a proof of a general theorem.

The package retains integral cycle coefficients over arbitrary fields, singular closed supports, disconnected dimensions, negative twists, zero coefficients and derived coefficient change. The regular-base cube construction includes p=2 and p=3. No computational algorithm, copied source passage, sorry'd data, set_option, replacement K/higher-Chow carrier or route-specific prime restriction was found. The regular nonsmooth comparison omitted in R01 is the new generality defect.

### Previous findings, checked first

| Previous finding | Current passage and status | Verification |
| --- | --- | --- |
| F01: unconditional abstract unit | **Repaired.** README:423 says “without a unit requirement”; :430 says “If A has a specified real multiplicative identity 1_A of type (0,0)”. README:444 makes the cohomological unit conditional too. | BKK Definition 5.13, pp.113–114, BKK line 4121–4128 permits nonunital input. In tℝ[t], coeff_t(et)=0 for all e; in ℝ[t], coeff_t(1·t)=1. The new Check at :437 distinguishes them. Geometric 1 and pullback preservation are explicit at :334; the Layer 4 docstring agrees. |
| F02: Borel generic Deligne ownership | **Partly repaired globally; settled here.** README:13 says “BorelRegulators §6.0a must import these constructions”; :697 gives the same obligation. | BorelRegulators e39a3c4 still constructs them at TauCetiRoadmap/BorelRegulators/README.md:724,726 and claims ownership at :13. The repair report's reason is correct: only companion edits can remove these statements. The package no longer claims that transfer is completed. The new cone-sign Check at :382 was recomputed. |
| F03: Coleman cube ownership | **Partly repaired globally; settled here.** README:13 says “ColemanIntegration §L3.Fa.2 must import that construction and its ordered relativity equivalence”; :695 restates the required import. | ColemanIntegration ae078af, README:2435,2437–2440,2446, still constructs the carrier/equivalence. SchemeKTheoryOperations 88dbd5a, README:9,2403, still assigns ownership there. These edits are outside this package. The common-base, supported and regular-base statements here remain intact. |
| F04: Polylogarithms auxiliary objects | **Partly repaired globally; settled here.** README:514 says “The shared diagram and the abstract supported regulator of §6.2 must be imported there”; :693 specifies the same direction. | Polylogarithms 4696a1a, README:826–843, still constructs the shared diagram and abstract map. The reason for non-actionability is correct. D_AH, β and concrete current adapters remain distinct; J₀∂=δJ₁=∂ on degree one verifies the new Check at :525. |
| F05: current normalization locator | **Repaired.** README:490 now cites “BKK equation (5.38), p.122” and “BKK Definition 5.41, p.123”; :721 and the BKK manifest entry agree. | Read BKK line 4395–4408 and line 4450–4462. For d=p=1 the form factor is (2πi)⁻¹ and the point factor is 1. Proposition 5.58 remains the iff locator, not the defining normalization locator. |

The reasons settling F02–F04 were checked against the unchanged external heads, rather than assumed from the repair report. They are not re-raised. These are consumer coordination obligations, not missing prerequisites supplied to this package; inventing supplier gaps for them would reverse the supply direction. The repaired unit qualification was also searched throughout the scope, geometric algebra, product, associativity, downstream multiplicativity and Lean docstring. General associative multiplication and geometric unital multiplication remain distinguished.

### Adversarial computation record

P denotes a point, h the positive hyperplane class, and juxtaposed differentials denote wedges. API numbers count the prose bullets in the named subsection. Current section headings, rather than obsolete line numbers, locate the rows. “Now” marks a recomputation in this review, including every seeded target and every changed mathematical passage. “Retained” marks a computed row from the previous review for an unchanged assertion, re-read and checked for applicability; no uncomputed earlier summary is treated as evidence. Repeated signs are checked in each consuming layer. The new regular-base rows show the scope defect separately from passing smooth examples.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| Now: Conventions: universe and components | Empty scheme; P⊔ℙ¹ | Components 0 and 2; CH⁰(P⊔ℙ¹)=ℤ², CH¹=0⊕ℤ | Pass; a single rank 3 loses (2,1) |
| Now: Conventions: degree | p=0, a=1; p=1, a=1 | Homological degrees −1 and 1; groups 0 and k× | Pass; natural subtraction would incorrectly use degree 0 |
| Now: Conventions: coefficients | ℤ/2⊗ᴸℤ/2; R=0 | Reduction of [ℤ --2→ ℤ] is [ℤ/2 --0→ ℤ/2]; H⁻¹=H⁰=ℤ/2; R=0 gives 0 | Pass |
| Now: Conventions: cube sign | n=0,1,2; graph t | J=(1,−1,1); ∂Γ_t=[0], δΓ_t=−[0]; J₀∂Γ=δJ₁Γ=[0] | Pass |
| Now: Conventions: mixed square | (n,m)=(1,1) | Cross coefficients −1,+1 sum to 0 | Pass |
| Now: Conventions: fiber and boundary | A=0, B=ℝ[0]; (𝔸¹,{0}) | fib has H¹=ℝ; d(Γ_t,0)=([0],t), so raw(t)=−[0], −raw(t)=+[0] | Pass |
| Now: Conventions: Tate and critical differential | p=−1,0,1; x=z barz | ℝ(−1)=iℝ, ℝ(0)=ℝ, ℝ(1)=iℝ; d_Dx=−2 dz dbarz | Pass; 2πi≠0 |
| Now: Conventions: orientation and totalization | Ordered two disks; n=s=1 | Residues +1 and −1 after exchange; product sign −1; circle period of i log 2 darg t is 2πi log 2 | Pass |
| Now: Whitney gap: extension | Jet at 0 with coefficients 1,1,2 | Required derivatives (1,1,4); f=1+x+2x² has these values | Pass |
| Now: Whitney gap: arbitrary order and parameters | Coefficients n!; normal derivative m=2 at y=π/2 | Derivatives (n!)²; required transverse value 4 sin(π/2)=4 | Pass; analytic radius is 0 for n! |
| Now: Whitney gap: degeneracy and uniqueness | A=∅, A=U; 0 and exp(−1/x²) at 0 | Empty jet imposes 0 conditions; full-set extension equals f; both jets are 0 but values at 1 are 0 and e⁻¹ | Pass; uniqueness is correctly excluded |
| Now: Flat-ideal gap: equality | A=B={0}; A=∅,B=U; A=B=U | I=I+I; C∞=C∞+0; 0=0+0 | Pass |
| Now: Flat-ideal gap: sum versus intersection | Coordinate axes, φ(x)+φ(y) | Jets at (0,0) are 0; value at (0,1)=e⁻¹, whereas every element of I(A)∩I(B) vanishes there | Pass; excludes the wrong intersection |
| Now: 1.1 definition | P, p=0, n=0,1,2 | Raw groups ℤ,ℤ,ℤ; infinity kernels give ℤ,0,0, matching degeneracy quotients | Pass |
| Now: 1.1 API 1 | Normalization of degree-one constant cube | Infinity face sends 1↦1, so kernel=0; degeneracy quotient ℤ/ℤ=0 | Pass |
| Now: 1.1 API 2 | ℙ¹→P; inseparable extension degree 2 | Fundamental one-cycle pushes to 0; field pullback sends 1↦1 and transfer sends 1↦2 | Pass; dimensions and generic lengths matter |
| Now: 1.1 API 3 | Degrees 1+1 and 1+2 | J₂=1=(−1)(−1); J₃=−1=(−1)(1) | Pass |
| Now: 1.1 API 4 | Reduced and double point; p=−1 | Generator coefficient 1 versus multiplicity 2; negative-codimension group 0 | Pass; support alone does not encode multiplicity |
| Now: 1.2 definition | Total degree N=0,2 | Diagonals contain 1 and 3 summands; in (1,1), d² cross term is −T+T=0 | Pass |
| Now: 1.2 API 1 | Both axes at (0,0) | [V]↦[V] with coefficient 1 on each axis | Pass |
| Now: 1.2 API 2 | Three summands in degree 2 | Component values (2,3,5) determine total image 2+3+5=10; zero components give 0 | Pass |
| Now: 1.2 API 3 | Bidegrees (1,0),(0,1),(1,1) | Multipliers −1,+1,−1; (−1)ⁿ⁺ᵐ would give −1 on the simplex axis | Pass |
| Retained: 1.3 absolute comparison | P over 𝔽₂, p=0 | Both H₀=ℤ, higher H=0; comparison 1↦1 | Pass integrally |
| Retained: 1.3 support comparison | Z=∅ and Z=X | fib(id)=0 on both sides; fib(C→0)=C on both sides | Pass |
| Retained: 1.3 coefficient comparison | Multiplication-by-2 resolution; R=0 | Both sides retain ℤ/2 in degrees −1,0; both become 0 for R=0 | Pass |
| Retained: 1.4 direct maps | 𝔽₂(t)/𝔽₂(t²) | Degree 2, and res then transfer sends 1 to 2 on both cycle models | Pass; inseparability does not change the degree formula |
| Retained: 1.4 smooth products/pullbacks | Degrees (1,1),(0,1); P⊔ℙ¹ | Exchange factors −1,+1; CH¹=0⊕ℤ and CH⁰=ℤ² on both sides | Pass |
| Retained: 1.4 support/orientation transport | Identity; square-zero thickening | Identity coefficient +1; reduced and thickened cycle generators both ℤ | Pass; no K-theory nil-invariance is inferred |
| Now: 2.0a definition | n=0, full/empty support over k | K₀(k)=ℤ, [k²]=2; empty support=0 | Pass; external F03 settled here |
| Now: 2.0a generalized weights | L=[[2,1],[0,2]] on ℚ² | (L−2I)e₂=e₁≠0, (L−2I)²=0; generalized piece ℚ², eigenspace ℚe₁ | Pass; generalized is not silently replaced by ordinary |
| Now: 2.0a rationality | K₀(ℙ²), h³=0 | ψ²h=2h−h²; ψ²(2h+h²)=2(2h+h²), ψ²h²=4h²; eigenlattice determinant 2 | Pass; integral direct sum would fail |
| Now: 2.0a API 1 | n=0; support ∅⊂X | Groups 0→K₀(X), 0↦0; full support rank-two class maps to 2 | Pass |
| Now: 2.0a API 2 | Two unit loops over ℤ_(2), ℤ_(3) | ψ²[u]·ψ²[v]=(2[u])(2[v])=4{u,v}=ψ²{u,v} | Pass on the stated common base |
| Now: 2.0a external domain | ℤ[i]⊗ℤℤ[i] at ramified point | Relation v(v+2i)=0; local dimension 1, cotangent dimension 2; common-base cube stays regular | Pass; singular external product excluded |
| Now: 2.0a API 3 | n=1 over ℚ and ℤ_p | Difference (1,0)↦1, (0,1)↦−1, (1,1)↦0; K₀(relative)=K₁(base) | Pass at p=2,3 as well |
| Now: 2.0a ordered double loop | {u,v} over ℚ(u,v) | Two last-slot residues +1; swapped loop −1; ψ² multiplier 4, ψ¹ multiplier 1 | Pass |
| Now: 2.0a open non-full cube | Remove t=2 over ℤ₃ | Induced face ranks of O are (1,1); difference 0; no full-cube equivalence asserted for this Y | Pass |
| Retained: 2.0b definition | Zero K-class; unit 2 | c₀,₀(0)=1 but ch(0)=0; c₁,₁[2]=[2] has valuation 1 | Pass; universal all-field source remains uncertified |
| Retained: 2.0b API 1 | O(1)⊕O(−1) on ℙ² | (1+h)(1−h)=1−h²; c₂=−h², not c₂(O(1))+c₂(O(−1))=0 | Pass; degree-zero Chern is not additive |
| Retained: 2.0b API 2 | Diagonal degrees 1,2,3 | (−1)ⁿ⁻¹(n−1)! gives 1,−1,2, the supplier's coefficients | Pass |
| Retained: 2.0b API 3 | Same three degrees; line on ℙ² | Character coefficients 1,−1,1/2 cancel 1,−1,2 to 1,1,1; ch₂(O(1))=h²/2 versus c₂=0 | Pass; factorial denominators 1,1,2≠0 |
| Retained: 2.1 construction | P, ℙ¹, empty, two points | ch(k²)=2; ch(O(±1))=1±h; empty=0; ranks (2,1) retained | Pass; finite weight support |
| Retained: 2.1 API | Addition O(1)+O(−1); unit 2 | Character 2, versus total Chern 1; valuation of ch₁,₁[2] is 1 | Pass; excludes zero in positive degree |
| Retained: 2.2 isomorphism and Adams | Weights 0,1,2; a=1,2 | ψ² eigenvalues 1,2,4; differences −1,−3,−2; ψ¹ acts by 1 | Pass; distinct projector denominators nonzero |
| Retained: 2.2 universal-class equality | O_point on ℙ¹; unit 2 | Both leading classes h; both degree-one classes [2], valuation 1 | Pass instances; all-field proof text unread |
| Retained: 2.2 degree-two sign | {2,t}, t-adic boundary | Last-slot residue [2], valuation 1; native right boundary −[2], valuation −1; adapter −B restores +[2] | Pass; same sign as K supplier |
| Now: 2.3 supported construction | ∅, X, nodal divisor V(xy) | 0≃0; absolute comparison; leading coordinates (1,1) on two components | Pass; singular K(Z) not substituted |
| Now: 2.3 API 1 | {0}⊂{0,1} in 𝔸¹; identity | Coefficient 1↦(1,0); identity 1↦1 | Pass |
| Now: 2.3 API 2 | Lift Γ_t | d(Γ_t,0)=([0],t); raw boundary −[0], B[t]=+[O₀], so ch B=−δ_raw ch | Pass |
| Retained: 2.4 higher products | Ranks 2,3; ξ=1−O(−1) on ℙ¹ | Rank product 6=2·3; ch(ξ²)=0=h²=ch(ξ)² | Pass |
| Retained: 2.4 degree zero | O(a), O_point | ch(O(a))=1+ah on ℙ¹; 1−exp(−h)=h, leading coefficient +1 | Pass; imported map is compared |
| Retained: 2.4 higher Newton coefficient | p=1,2,3, n>0 | 1,−1,1/2; specifically ch₂,₂=−c₂,₂ | Pass |
| Now: 3.1 definition and chart independence | z↦2z; z↦z² | Logarithms change by log 4 and multiply by 2 respectively; logarithmic derivatives change by 0 and multiply by 2 | Pass; generated image fixes the actual subalgebra |
| Now: 3.1 API 1 | log abs(z)²; z barz | d log abs(z)²=dz/z+dbarz/barz; ∂∂̄(z barz)=dz dbarz and ∂̄∂(z barz)=−dz dbarz | Pass; anticommutator 0 |
| Now: 3.1 API 2 | Identity; power maps 2 then 3 | dlog maps to dlog and 6 dlog, respectively; composite power 6 also gives 6 dlog | Pass |
| Now: 3.1 API 3 | Empty boundary; empty W; z=e⁻ᴺ on punctured disk | Native smooth algebra; zero algebra; log abs(z)²=−2N whereas abs(z)⁻²=e²ᴺ | Pass; no arbitrary-pole scalar is introduced |
| Now: 3.1 orientation | Circle; ordered two-disk residue | Integral 2πi; residues 1 and −1 on exchanging the disks | Pass |
| Now: 3.2 comparison and weight | Point; 𝔾ₘ | Point weight 0; H¹(𝔾ₘ) has residue degree 1 plus cohomological degree 1, hence weight 2 and type (1,1) | Pass; unshifted weight would be 1 |
| Now: 3.2 degenerations and refinement | Boundary blowup of (ℙ¹)² compactifying 𝔾ₘ² | Betti dimensions (1,2,1) stay (1,2,1); boundary-component count changes 4→5 | Pass; F comparison does not assert invariant residue graded complexes |
| Now: 3.2 local estimates/API 1 | f=exp(−1/abs(z)²), extended by 0; f=1 | All jets of f/z² at 0 are 0; value at 1 is e⁻¹. For f=1, 1/z² diverges | Pass; flatness is essential |
| Now: 3.2 local estimates/API 2 | exp(−1/abs(zw)²) log abs(z)²/(z barw) | All axis jets are 0; value at (−2,1) is −e⁻¹ᐟ⁴ log 4/2; all exponents 0 recover f | Pass; simultaneous flatness handles the combined expression |
| Now: 3.3 cone and small model | Point, p=0,1,−1 | (H⁰,H¹)=(ℝ,0),(0,ℝ),(ℝ(−1),0), respectively, in both models | Pass; negative twists retained |
| Now: 3.3 comparison maps/API 1 | Point, p=1; A=0 | Projection-inclusion sends r↦r; other composite sends log 2+iθ↦log 2, difference iθ is a cone boundary; A=0 gives 0 | Pass; strict equality only in the stated order |
| Now: 3.3 shifts and sums | A=ℂ[0]; direct sum of two points | Ordinary A[1] has degree −1; no integer r with 2r=−1; two points give H¹=ℝ² | Pass; no nonexistent shifted Dolbeault structure |
| Now: 3.3 exactness/API 2 | Split sequence ℝ→ℝ²→ℝ in type (0,0), p=1 | Deligne H¹ dimensions 1→2→1; maps a↦(a,0), (a,b)↦b; kernel=image=ℝ×0 | Pass |
| Now: 3.3 differential/API 3 | p=1, x=z barz; constant x=1 | −2∂∂̄x=−2 dz dbarz; constant gives 0; ordinary degrees 0→2 | Pass |
| Now: 3.4 definition and API 1 | Identity refinement; torus blowup | Point class 1↦1; two loop periods (2πi,0),(0,2πi) stay fixed and three-choice composites preserve both | Pass; external F02 settled here |
| Now: 3.4 pullback/API 2 | t↦t² followed by t↦t³ | Period multiplier 2·3=6 agrees with composite t⁶; identity multiplier 1 | Pass |
| Now: 3.4 descent/API 3 | Cover of P by P,P; empty; P⊔ℙ¹ | Equalizer of (a,b)↦a−b is diagonal ℝ; empty gives 0; disjoint union H⁰=ℝ² | Pass |
| Now: 3.4 colimit/API 4 | Two copies of identity compactification | Both send 1↦1; compatible pairs (r,r) determine the same value r after sheafification or skeleton replacement | Pass; does not identify every presheaf section with a sheaf section |
| Now: 4.1 low-low branch | x=log 2, y=log abs(t), weights 1,1 | Product i log 2 darg t; reverse −i log 2 darg t; circle periods ±2πi log 2 | Pass |
| Now: 4.1 mixed branch below cutoff | x=z barz in D¹(1), y=dw dbarw in D²(1) | Product z barz dw dbarw; both sides of Leibniz equal −2 dz dbarz dw dbarw | Pass |
| Now: 4.1 mixed branch above cutoff | Same x; y=i dw dbarw in D²(0) | Product i(barz dz−z dbarz)dw dbarw; both differentials −2i dz dbarz dw dbarw | Pass |
| Now: 4.1 high-high branch | dz dbarz and dw dbarw in D²(1) | Product dz dbarz dw dbarw; reversed product the same, both differentials 0 | Pass |
| Now: 4.1 Leibniz/API 1 | x=z barz, y=w barw in D¹(1) | Both sides equal −2 abs(w)² dz dbarz+2 abs(z)² dw dbarw | Pass; both inputs may be nonclosed |
| Now: 4.1 unit/API 2 | A=tℝ[t] versus A=ℝ[t], type (0,0) | In the ideal, coefficient of t in et is 0 for every e; in ℝ[t], 1·t=t has coefficient 1 | Pass after F01: unit is asserted only for the second input |
| Now: 4.1 naturality/high even API 2 | Pullback z↦2z, w↦w | Pullback of the four-form is 4 dz dbarz dw dbarw; product of pullbacks has the same factor 4 | Pass |
| Now: 4.1 critical/API 3 | x=z barz, y=1, both weight 1 | Product −barz dz+z dbarz; its Deligne differential −2 dz dbarz equals d_Dx•1 | Pass; ordinary d would give +2 dz dbarz |
| Now: 4.1 point checks | log 2, log 3; weight-zero unit | Product 0 because there are no one-forms; 1•log 2=log 2 | Pass |
| Now: 4.2 homotopy and critical vanishing | Re z,2,3 in even critical degree 0 | Both bracketings 6 Re z, value 6 at z=1; h_a=0 although d(Re z)≠0 | Pass; no closedness hypothesis needed |
| Now: 4.2 associative cohomology | Point constants 2,3,5; three odd point classes | Both bracketings 30; both odd bracketings 0 | Pass; conditional unit now explicit |
| Now: 4.2 non-strict associativity control | x=2,y=3 in D¹(1), z=Re w in D⁰(0) | (x•y)•z=0; x•(y•z)=3(dw−dbarw); associator −3(dw−dbarw) | Pass as a homotopy assertion; excludes identically zero associativity homotopy |
| Now: 4.2 choice compatibility | Boundary blowup and circle exchange | Product period (2πi)² in both choices; exchanged period −(2πi)² in both | Pass |
| Retained: 5.1 definition | General pair; 0→ℝ[0] | d² second component=res da−d res a=0; fiber of 0→ℝ[0] has H¹=ℝ, H⁻¹=0 | Pass; matches the shifted native cone |
| Retained: 5.1 API 1 | {0}⊂{0,1}; identity | Coordinate r↦(r,0); identity r↦r and direct composite agrees | Pass |
| Retained: 5.1 API 2 | Z=∅, Z=X; unit t on 𝔾ₘ | fib(id)=0; fib(A→0)=A; raw connecting (0,log abs(t)) has coefficient −1 | Pass; positive valuation uses the stated opposite adapter |
| Retained: 5.1 API 3 | V(x),V(x−1); V(x),V(y) | First product lands in zero fiber; second has origin coefficient 1 | Pass |
| Retained: 5.1 API 4 | (0,−log abs(t)) on complement; (0,z barz) | First satisfies d_Dg=0 there; second gives −2 dz dbarz≠0 and fails the cocycle test | Pass; pair equations exclude the wrong representative |
| Now: 5.2 semipurity | Nodal V(xy); cusp V(y²−x³), p=1 | Groups below 2 are 0; degree 2 coordinates (1,1) in ℝ² versus 1 in ℝ | Pass; singular support is included |
| Now: 5.2 codimension bound | Origin in 𝔸², p=1,2; point with p=1 | Origin H² at p=1 is 0, H⁴ at p=2 is ℝ; full point H¹(ℝ(1))=ℝ violates the conclusion without the bound | Pass |
| Now: 5.2 current criterion both directions | f=t, t², t⁻¹ | d_D[−log abs(f)] has coefficients −1,−2,+1; supported class coefficients are 1,2,−1; opposite log reverses each | Pass; F05 locators now present |
| Now: 5.2 API 1 | Normal p-disk for p=0,1,2 | Betti top degree 0,2,4 respectively has ℝ, lower degrees 0; top types (0,0),(1,1),(2,2) | Pass |
| Now: 5.2 API 2 | Axis classes (a,b); double axis | Zero iff a=b=0, checked on both generic axes; reduced/double coefficients 1,2 | Pass; multiplicity is not support alone |
| Now: 5.2 API 3 | Divisors of t and t⁻¹ | Green functions −log abs(t), +log abs(t) give +[0],−[0], respectively | Pass |
| Now: 5.2 intersections and extremes | Axes and double axis; p=0 full/empty support | Intersection lengths 1,2; full H⁰=ℝ per component and negative H=0; empty H=0 | Pass |
| Now: 5.2 normalization | (d,p)=(1,1),(2,1) | Form/current factors ((2πi)⁻¹,1), ((2πi)⁻²,(2πi)⁻¹); their ratio is (2πi)⁻¹ in both | Pass; no dimension-dependent sign drift |
| Now: 5.3 support system | Two axes; empty support | Union contains both classes with coordinates (1,1); empty contributes 0 | Pass; external F04 settled here |
| Now: 5.3 total and good truncation | (r,n)=(2p,1),(2p−1,1); ω=Re z₁ dz₂ dbarz₂ | Total degrees 2p−1,2p−2 and cube signs +1,−1; dω on (∂x₁,∂x₂,∂y₂) is −2i | Pass; brutal truncation admits a false cocycle |
| Now: 5.3 API 1 | Origin and double origin; point at p=0 | Class coefficients 1,2; normalized point groups ℝ,0,0 in cube degrees 0,1,2 | Pass |
| Now: 5.3 API 2 | n=0,1,2 | Hₚ[−2p] degrees 2p,2p−1,2p−2 equal top total degrees; 3[V] projects to 3[V] | Pass |
| Now: 5.3 API 3 | Origin support in 𝔸¹, p=1; constant point p=0 | Forget-support sends ℝ→H_D²(𝔸¹,ℝ(1))=0; constant-cube map sends 1↦1 | Pass |
| Now: 5.3 API 4 | Classes on the two axes, enlarged to union | Representatives become (1,0),(0,1); sum (1,1); zero stays (0,0) | Pass; finite-union colimit relation fixes maps |
| Now: 5.4 class isomorphism/projection | Point p=0; codimension-one supported column | ℝ→ℝ is 1↦1; after truncation the column has only degree 2 group ℝ, lower groups 0 | Pass |
| Now: 5.4 affine contraction | Point→𝔸¹, p=0,1 | H_D⁰(ℝ(0)) is ℝ→ℝ; H_D¹(ℝ(1)) is ℝ→ℝ; positive normalized columns have 0 cohomology | Pass |
| Now: 5.4 product signs | (n,s)=(1,1),(0,1),(1,2) | (−1)ⁿˢ=−1,+1,+1, separately from Jₙ=−1,+1,−1 | Pass; the two sign factors are not conflated |
| Now: 6.1 specified roof | Point m=0,1,2; zero cycle | Composite sends m↦m through each class/projection arrow; zero↦0; shift by 2p has sign +1 | Pass; arrows exclude the zero-map substitute |
| Now: 6.1 API 1 | Two lifts differing by d(Γ_t,0) | Difference ([0],t) is a boundary; resulting regulator classes differ by 0 | Pass |
| Now: 6.1 API 2 | Units −1,i and 2 | Log absolute values 0,0,log 2; torsion killed, non-torsion witness nonzero | Pass |
| Now: 6.1 API 3 | O(1),O(−1) on ℙ¹ | Normalized integrals 1,−1; raw periods 2πi,−2πi | Pass |
| Now: 6.2 homotopy formula/API | A=A′=ℤ[0], B=0, B′=(ℤ --1→ ℤ), r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong sign gives (1,−1) with differential (0,2) | Pass; both sides of the chain-map equation computed |
| Now: 6.2 support/coherence | Identity, empty/full support; t on 𝔾ₘ | h=0 for identity; empty map 0, full map absolute; raw(log abs t)=−[0], negative Green function gives +[0] | Pass |
| Retained: 6.3 pullback | Point→ℙ¹ applied to O(1) | CH¹(point,0)=0 and H_D²(point,ℝ(1))=0; both images 0 | Pass; raw badly positioned cycles are not pulled back |
| Retained: 6.3 embeddings | Unit 2 under ℚ→ℝ→ℂ and ℚ→ℂ | Both values log 2 | Pass |
| Retained: 6.3 cycle models and motivic reformulation | Cube degrees 0,1,2; k=𝔽₂(t) | Both diagrams transport by 1,−1,1; cycle H¹(k,ℤ(1))=k×, with t nontrivial; categorical perfect-field claim is not applied to this k | Pass |
| Retained: 7.1 independent definition | Unit 2eⁱᶿ; different logarithm branches | Re(log 2+iθ+2πik)=log 2 for every integer k | Pass; independent exponential normalization fixes the map |
| Retained: 7.1 API 1 | O(a) on ℙ¹; zero K-class and trivial line | ch_D=1+ah; ch_D(0)=0, ch_D(O)=1 | Pass |
| Retained: 7.1 API 2 | Projection of 3+4i, p=1,2,3 | πₚ₋₁ gives 3,4i,3; added elements of ℝ(p) project to 0 | Pass; odd and even twists distinguished |
| Retained: 7.1 classifying-space route | Constant simplicial ℤ; constant simplicial S₃ | Abelian case π₀=H₀=ℤ and higher groups 0; S₃ has nonabelian π₀ of order 6, excluded from Dold–Kan | Pass; group completion and abelianization are not conflated |
| Now: 7.2 regulator equality | Rank 2; O_point on ℙ¹; unit 2 | Both values 2; both degree-two coefficients 1; both logarithms log 2 | Pass |
| Now: 7.2 coefficients/support | p=2 higher character; full/empty support; t boundary | Both Newton coefficients −1; full absolute map, empty 0; raw boundary coefficient −1 on both sides | Pass |
| Retained: 7.3 products | Unit 2 and t, degrees 1,1 | Period +2πi log 2; swapped −2πi log 2; parity of (2p−n)(2q−m) equals nm, so both exchange signs are −1 | Pass |
| Retained: 7.3 units and intersections | Weight-zero unit; two ruling divisors on ℙ¹×ℙ¹ | 1·x=x; intersection degree 1, or 2 for a doubled ruling | Pass on geometric unital algebras |
| Retained: 7.3 point odd product | Units 2 and 3 | Product lies in H_D²(point,ℝ(2))=0 on both sides | Pass; does not replace the nonzero curve test |
| Now: 7.4 logarithm law | u=2,v=3; 1,i,1/2 | log abs(6)=log 2+log 3; values 0,0,−log 2 | Pass; inverse and torsion distinguished |
| Now: 7.4 two-unit representative | f=2,g=t | i(log abs(f)darg g−log abs(g)darg f)=i log 2 darg t, period 2πi log 2 | Pass; same normalization as §4.1 |
| Now: 7.4 divisor and projective witnesses | tᵃ; O(a), a=−1,0,1 | Green function −a log abs(t) gives coefficient a; projective integrals −1,0,1 | Pass; positive unit logarithm and negative divisor Green function remain distinct |
| Now: 3.1 geometric unit and pullback | A=E_log(W); W=∅; t↦t² | 1·ω=ω; pullback(1)=1; on ∅ the sole section has 0=1 | Pass; geometric input supplies the identity required in §4.1 |
| Now: 3.3 opposite cone adapter | d₊ third=f−r−dω; T negates third coordinate | T d₊ third=r−f+dω=d₋ T third; inverse T² third=ω | Pass; a sign change on the third coordinate is essential |
| Now: 3.3 point quotient with cone adapter | 3+4i in twists 1,2,3 | Raw quotient coordinates 3,4i,3; T gives −3,−4i,−3; transported coordinate gives 3,4i,3 | Pass; raw and transported coordinates are distinguished |
| Now: 4.2 nonunital associativity | A=tℝ[t], d=0, type (0,0) | (t·t)·t=t³=t·(t·t); no e has et=t since coefficients are 0 versus 1 | Pass; multiplication/associativity survive without a unit |
| Now: 5.3 new J transport Check | Cube degree 1, total bidegree (r,−1) | J₀∂=∂; δJ₁=(−∂)(−1)=∂; total coefficients both (−1)^r | Pass; applies to support and forget-support arrows too |
| Now: 2.0a/2.3 regular nonsmooth scope | k=𝔽_p(t), L=k[s]/(s^p−t), p=2,3; X=Spec L | Local dimension=embedding dimension=0; dim_L Ω¹_L/k=1; K₀(L)ℚ=CH⁰(L,0)ℚ=ℚ with 1↦1 | R01: source includes X; current smooth-only cycle/comparison clause excludes it |
| Now: 2.3 regular supported repair | X=𝔸¹_L, Z={u=0}, same p=2,3 | Supported weight-one groups ℚ→ℚ, 1↦1; B[u]=+1, δ_raw[u]=−1, −δ_raw[u]=+1 | R01 repair tested; no change of boundary convention |

### Seeded sources and repaired locators

All seven certified extracts were read at their numbered lines. The manifest uses ten unique lifetime keys: seven certified, Levine98 waived, and Bloch86/Beilinson85 uncertified. No additional work needed fetching and no manifest entry was changed. BF, BFT, BKK and KLM locators use the explicitly identified preprint versions; Levine94 and DeligneHodgeII use printed article pagination. In particular, BKK's preprint numbering is not represented as its later journal numbering.

| Seeded target | Locator read | Scope, statement and outcome |
| --- | --- | --- |
| 1.1 Normalized cubical cycles | BF line 381–391, §1.4, p.8; BF line 610–663, §§2.1–2.2, pp.13–14 | Infinity-face kernels, degeneracies and normalized differential agree after δ=−∂ and Jₙ=(−1)ⁿ. Equidimensional quasi-projective schemes over any field; no smoothness needed for the underlying cycle complex. |
| 1.2 Mixed complex and axes | BFT line 943–963, §6.4, Proposition 6.12, pp.19–20 | Normalization is in the cubical direction. Both axes give integral quasi-isomorphisms for the same equidimensional quasi-projective X over a field. The simplex axis is not multiplied by J in its own degree. |
| 2.0a Supported multi-relative cube K-theory | Levine94 line 407–423, p.247; line 539–547, Theorem 1.10, p.252; line 625–642, Corollary 1.11, p.256; line 655–736, Lemma 2.1, pp.257–259; line 1101–1117, Theorem 2.7, pp.272–273 | Iterated fibers, regular faces, split/regular-double hypotheses and generalized weights are present. Theorem 2.7 requires an infinite field and regular quasi-projective X. The README retains the infinite-field proof-step restriction and supplies finite-field descent separately; its smooth-only relative-cycle clause needs the regular extension used by R01. The wider general-base product route is supplied by SchemeKTheoryOperations §6.9, not attributed solely to Levine. |
| 2.3 Closed supports and boundary transport | Levine94 line 1399–1425, Theorem 3.4, pp.283–284 | The fiber definition, arbitrary closed support and supported weight isomorphism are present. X is regular quasi-projective, not necessarily smooth over k: R01. The additional purity statement requires regular support of pure codimension; the README correctly does not identify arbitrary singular K(Z) with supported K. The boundary sign is an explicitly transported convention, independently computed above. |
| 3.1 Smooth logarithmic Dolbeault algebra | Burgos94 line 155–192, §2, pp.65–67; BKK line 4217–4232, Definition 5.20, pp.116–117 | The smooth log algebra is the generated image inside forms off an SNC divisor. BKK provides readable generators where the scan drops displays. Smooth coefficients include the real constant 1; this supports the new geometric unit assertion. |
| 3.4 Compactification-independent realization | BKK line 4239–4316, Theorem 5.22, equation (5.23), Proposition 5.29 and Corollary 5.31, pp.117–119 | Smooth separated finite-type varieties, smooth proper SNC choices, directed refinement and real/F comparisons are supported. The sheafification warning is retained; a presheaf colimit is not simply identified with every sheaf section. Hyperdescent additionally uses the enhanced supplier, and the bounded geometric complexes satisfy its required bounds. |
| 4.1 Full Dolbeault product | BKK line 4121–4140, Definitions 5.13–5.14, pp.113–114; line 4176–4180, p.115 | All four branches and the critical formula agree. Definition 5.13 imposes no unit. Conditional unitality now matches that domain, while multiplication, naturality and Leibniz still cover nonunital inputs. |
| 4.2 Associativity and choice compatibility | BKK line 4142–4158, Proposition 5.15, p.114; BF line 506–514, Proposition 1.26, p.10 | Homotopy has degree −1. Its even-critical vanishing needs no closedness assumption. The source typo in BF's codomain is not copied. Natural contraction supplies compatibility under changing log models. |
| 5.2 Singular-support semipurity | BF line 530–552, equation (1.30), Proposition 1.31, p.11; BKK line 4795–4874, §5.6 and Proposition 5.58, pp.132–133; line 4395–4408, equation (5.38), p.122; line 4450–4462, Definition 5.41, p.123 | Codim Z≥p, arbitrary singular closed support, vanishing below 2p, component classes and both directions of the current criterion agree. The newly adjacent normalization locators are exact. Test forms precede the represented form; cycle normalization uses its dimension d−p. |
| 5.3 Auxiliary support resolution | BF line 705–774, §§2.4–2.5, pp.15–17; BFT line 253–275, Proposition 4.3, p.7 | Good truncation, supported colimit and total differential are present. The cochain/cube sign d_D+(−1)^rδ transports to the declared ∂ by Jₙ. The new degree-one Check computes that transport for the same auxiliary diagram. |
| 5.4 Cycle classes and affine contraction | BF line 720–735, Proposition 2.8, p.15; line 741–744, Corollary 2.9, p.16; line 753–757, Lemma 2.11, p.16; line 766–785, Proposition 2.13, pp.16–17; BFT line 266–275, Proposition 4.3, p.7 | Affine contraction, supported class map and top projection are supported. Corollary 2.9 uses the refined normalization; the package uses Proposition 2.8 for its ordinary normalized comparison rather than conflating them. |
| 6.1 Specified regulator roof | BF line 862–895, equations (3.1)–(3.2), §3.1, p.19; BFT line 277–295, §4, p.7 | The class, top-projection inverse, forget-support and affine-contraction inverse arrows have the stated directions. BF supplies the quasi-projective roof; BFT's explicit projective current construction is not used as a general open-variety theorem. The degree-zero open comparison additionally uses restriction/naturality. |
| 6.2 Restriction homotopies and support realization | BF line 199–206, p.5; line 315–322, p.7; line 877–885, Proposition 3.3, p.19; BFT line 277–295, p.7 | Pair differential and restriction naturality agree. Coherent inverses are obtained in the supplied enhanced diagram category, not claimed as an article's formalization. The +ha fiber formula passes the nonzero homotopy test; −ha produces (0,2). |
| 7.2 Identification on supplied K-groups | BF line 905–1053, Theorem 3.5 and §3.2 proof, pp.20–23; BFT line 296–304, Theorem 4.7, p.7 | BF's proof uses smooth quasi-projective X, universal classes and Grassmannian/classifying constructions. The README correctly retains these hypotheses instead of the overly broad header. It separately names the universal-class identification, including its settled unread all-field source. |
| 7.4 Logarithm and projective witnesses | BKK line 3965–3990, p.110; line 4176–4180, p.115; BF line 550–552, p.11; KLM line 546–560, §5.3, p.13 | Positive unit log absolute value, negative divisor Green function, the critical two-unit form and positive Tate-normalized O(1) integral agree. KLM's logarithm is used after its real projection, not as an assertion that its projective current construction applies to every open variety. |

The repaired cone Check in §3.3 was also compared with BKK Definitions 5.7–5.10 and Proposition 5.12, pp.110–113, BKK line 3999–4111. The coordinate map negates the third cone component; raw quotient coordinates change sign and the transported identification restores the declared positive logarithm.

For §3.2, DeligneHodgeII line 1142–1168 (Theorem 3.2.5, pp.35–36) and line 1216–1253 (Corollary 3.2.13 and refinement discussion, pp.37–38) verify the shifted cohomological weight, E₁/E₂ degeneration and refinement comparison. In H¹(𝔾_m), residue weight 1 becomes cohomological weight 2. This does not assert invariance of each residue graded complex under boundary blowup. Burgos94 Theorems 3.1, 3.3–3.5, pp.72–74, at Burgos94 line 316,337,345,358, locate the two declared closed-jet inputs; Proposition 4.1, p.75, at Burgos94 line 379 locates the locally owned estimates. The scan-display limitations are recorded below.

Every author-flagged unread locator was accounted for: Bloch86 §7 in §§2.0b and 2.2, Beilinson85 §§1–2 in the references, and Levine98's chapter-level background. Their settled statuses were preserved; none was silently certified or requested again.

### Library and ownership audit at the supplied versions

The content checkout is main 66576b61d0440aec1f04a10b179f7e7163140b96. Both lake-manifest.json and the actual library checkouts identify Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following native declarations and their surrounding fields were opened at those pins, not inferred from a recent online library.

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

Additionally, TauCeti/Geometry/Manifold/ContMDiffMap/WeakWhitney.lean:87 defines weakWhitneyJet by taking derivatives of an already supplied smooth map. It does not extend arbitrary closed-set Whitney data. Object searches for higher-cycle groups, face-admissible cycles, scheme perfect K-spectra, multi-relative spectra, real Dolbeault/Deligne carriers and smooth-flat-ideal extension found no native replacement for the missing headline carriers. Ordinary algebraic flatness is a different object. The nonexistence assertion here is limited to the searched pinned library trees; it is not an assertion about inaccessible board heads.

The ownership searches used roadmaps list/show/grep at the supplied 2026-10-24T02:20:19Z index (332 open roadmap pull requests), main, the local board package tree and the separate board-head index. The named sibling set in the brief was included in these object searches. A progress pull request was not treated as a supplier replacing an existing roadmap on main. Twenty-two board package READMEs were retrieved at their indexed heads and searched; fifteen returned HTTP 404, listed below. The two relevant design-only folders were found locally, so absence of a package-stage README was not mistaken for absence of a planned object.

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
| Requested M.8 character/normalization | packages/ZagierConjecturePolylogarithms/design/README.md:1491–1495 | The requested label exists in the available design; this package's lines 707–711 map it to §§2.1–2.2,7.1,7.4. It is a consumer, not a supplier. |
| Irregular logarithmic filtration at zero function | packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:1534–1564 | At f=0 its pole divisor is 0 and it recovers ordinary filtered log forms. Exponential/pole-order constructions remain there; no reverse dependency is introduced. |

MotivicEtaleKTheory owns the cubical/mixed adapters and higher extensions on the already shared simplicial and K-theory carriers, and the smooth logarithmic/Deligne construction that supplies the later regulator consumers. Ordinary Chow theory, scheme K-theory, general current calculus and linear Hodge theory remain named imports. The three external overlap dispositions are those explicitly settled by the brief; they are not evidence that the companion texts have changed. No declaration-name collision can arise from this package's empty namespace.

### Supplier resolution and direction

Every cross-roadmap supplier citation was re-resolved at main or the indexed new-roadmap head. The cited sections, mathematical hypotheses and object supplied were read. The current locations below agree with the package's contracts. The resolver reported no unresolved roadmap citations or Lean names; its exclusion of pinned Lake sources was compensated by the direct library audit above.

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

The downstream citations were also resolved: Polylogarithms §§5.2–5.3,5.9–5.10,5.13,5.17; ColemanIntegration §§L3.Fa.1–L3.Fa.3,L3.Fc.1; BorelRegulators §§6.0a–6.2. Polylogarithms' old Layer 4/§9.1/§12.2 names are explicitly mapped to this package's present sections in README:707–710. The M.8 labels requested by ZagierConjecturePolylogarithms are present in packages/ZagierConjecturePolylogarithms/design/README.md:1495, and mapped here at :711. The f=0 specialization of packages/MixedHodgeModulesAndIrregularHodgeTheory/design/README.md:1534 recovers ordinary filtered log forms; its exponential/pole-order extension has a different object. Neither consumer is used as a supplier.

The relevant merge-order positions are SchemeKTheoryOperations 40, MotivicEtaleKTheory 87, ColemanIntegration 155, BorelRegulators 167 and Polylogarithms 225. All target Needs lines and all supplier citations were read, including enhanced diagrams used to invert the regulator roof and the regular-base several-variable A¹ uniqueness used for total-fiber Adams multiplicativity. Source citations alone were not counted as suppliers. The target-level build order has no detected backward dependency. The dependency command required by the brief, with --movable, completed with exit 0 and this complete output:

```text
depcheck: 29 roadmaps, 261 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line and no moved line. The command and citation resolver operate on the package's unchanged README; the review did not edit the merge order or tooling.

The two declared gap slugs, smooth-whitney-extension and flat-ideal-regular-situation, match design/plan.json and README's exact DifferentialGeometry contracts. Their needs specify open U, relatively closed sets, finite-dimensional real-valued jets, and the real-analytic condition for the flat-ideal sum. The first is one smooth extension theorem including its parametric hyperplane instance; the second is one ideal identity. Their finite-dimensional complex cases follow componentwise. Neither generic theorem is supplied by the native weak Whitney topology nor the supplier's manifold-calculus layers. Coordinate division and logarithmic-power estimates remain owned in §3.2, keeping the gaps minimal. These are legitimate conditional supplier contracts, not findings. Since this verdict has R01, review.json does not use the accepted-only conditional_gaps field.

### Shape, headlines and Lean acceptance test

Read TauCetiRoadmap/ComplexTori/README.md and Completed/HodgeStructures/README.md on main for shape. The package has the required title/summary, scope, conventions, per-supplier contracts, reading paragraph, seven layers with Examples and Dependencies, downstream consumers and references. Each of the 27 numbered targets has at least three Checks (3–6 each); definitions retain prose APIs. Mathematical uses of the word “current” are current theory, not process narration. No forbidden local path, algorithm, target-number catalogue, own-declaration name without a declaration, copied source block or forbidden Lean option was found. metadata.toml parses and contains topic math.AG.

The README's 13 headline groups, each explicitly named in the module docstring, are:

1. Integral cubical/simplicial comparison with supports, coefficients and operations (§§1.3–1.4).
2. Adams-compatible ordered relativity and pairings for supported multi-relative K-theory (§2.0a).
3. Universal integral motivic Chern operations (§2.0b).
4. Rational higher Chern isomorphism, universal-class identification, support comparison and products (§§2.1–2.4).
5. Geometric bifiltered logarithmic comparison and shifted mixed-Hodge data (§3.2).
6. Small Deligne model and cone deformation retract (§3.3).
7. Compactification-independent Deligne realization, pullback and descent (§3.4).
8. Full Dolbeault product, natural associativity homotopy and conditional unit (§§4.1–4.2).
9. Singular-support semipurity and normalized current criterion (§5.2).
10. Supported cycle resolution and affine contraction (§5.4).
11. Universal derived regulator, coherent restrictions, pullback and model independence (§§6.1–6.3).
12. Independent Beilinson character and equality on actual K-groups (§§7.1–7.2).
13. Integral-source regulator multiplicativity (§7.3).

Section 7.4 fixes the normalization of those maps; its scalar identities and small projective values are Checks, not additional scalar-algebra headlines. Every headline lacks a native carrier named in the docstring: higher cycles, scheme K-spectra/classifying models, geometric logarithmic sheaves, Deligne complexes, support diagrams or the actual realization maps. Native Scheme, modules, complexes, derived localization and linear Hodge structures do not supply those constructions through a few simple definitions. A theorem about arbitrary linear maps or scalar logarithms would be a stand-in. The short acceptance file is justified at these pins; R01 asks only that its stated scope account for the added regular supported comparison.

Ran the required lake env lean command on packages/MotivicEtaleKTheory/Suggested.lean from the content checkout. Result: **exit 0, no output, no errors and no warnings**. The file has one import Mathlib, one module docstring and namespace TauCetiRoadmap.MotivicEtaleKTheory. It has zero definitions, theorems, instances, examples, TauCeti imports, sorry terms or set_option commands. No targeted library build was needed.

For the requested mechanical binder audit, comments were stripped before inventorying declarations: there are zero names and hence zero #check @name commands to append. An exact scratch copy was nevertheless elaborated once: **exit 0, no output and no warnings**. No section variable or hypothesis can silently disappear from a declaration here. The one-tactic padding probe also has zero cases. No Lean process remains running.

## Not verifiable

- **Bloch86 §7:** settled uncertified/paywalled. The arbitrary-field universal integral Chern construction and equality with the inverse geometric cycle map in §§2.0b and 2.2 were not text-certified. The read BF construction is over ℂ; Levine94 independently supplies the geometric rational comparison. The access limit is not an unowned prerequisite.
- **Beilinson85 §§1–2:** settled uncertified/paywalled historical source. Its text was not read; the explicit comparison route was checked in BF.
- **Levine98:** settled waived, at the manifest's Part I, Chapter II §§2–3, Chapter III §1 and Chapter V §2 locators. No finer proof assertion from this text was certified.
- **Scan displays:** Burgos94's extraction omits displayed mathematics in parts of the Whitney/Borel/flat-ideal and Proposition 4.1 passages; parts of Levine94's diagrams also have OCR loss. Their numbered surrounding statements were readable, and BKK supplied the readable logarithmic generators. No available local PDF renderer could supply the missing glyphs. Complete display-level verification of those portions is not claimed. The two gap formulations and local estimates were independently tested in the table; neither that nor a source status substitutes for reading a missing display.
- **Fifteen indexed board heads:** contents requests returned HTTP 404 for ArithmeticLocallySymmetricSpacesPartII@84a41ac; CompletedCohomologyAndLocalGlobalCompatibilityPartII@948c94c; CrystallineCohomologyPartII@84ea77e; EndoscopicTransferAndUnitaryTraceComparisonPartII@80a66cc; HigherHidaAndColemanTheory@da88512; LawrenceVenkateshMethod@9ee7ac3; OrdinaryAutomorphicFormsAndModularityLiftingPartII@7e88c38; PELModuliPartII@d4bb48d; PadicHodgeTheoryPartII@6502997; PadicLocalLanglandsForGL2QpPartII@3e0777d; RealSurfacePeriodIndex@875bca4; SchemeAndStackFoundationsPartII@accb0a0; ShimuraVarietiesPartII@57dc0a4; VStackSheavesAndLisseCategoriesPartII@0987ba7; VectorBundlesAndIsocrystalsPartII@b58d862. Ownership against these package READMEs was not checked. The other 22 indexed board READMEs were retrieved and searched. No claim that an object exists nowhere is based on these failures.

There is no new missing-text request: all works already have their lifetime keys and the three unread works have settled access statuses. No source was copied into the repository. Author README.md, Suggested.lean, metadata.toml and sources.toml were left unchanged; only the required review deliverables were written in the package.

## Source issues

- **Misprint** in BF at Proposition 1.26, printed p.10 (BF line 508): the source says the associativity homotopy lands in degree r+s+t; it should be degree r+s+t−1, so its differential has the associator's degree; affects a stated result.
- **Error** in BF at Proposition 2.7, printed p.15 (BF line 689–704): the source says the internal product applies to every quasi-projective algebraic scheme; it should be stated for smooth quasi-projective schemes, as required for the preceding diagonal-pullback construction; affects a stated result.
- **Error** in BF at Theorem 3.5, printed p.20 (BF line 905–919): the source says the K-to-higher-Chow comparison applies to every equidimensional complex algebraic scheme; it should be scoped to the smooth quasi-projective setting used in the proof; affects a stated result.
- **Misprint** in BF at proof of Theorem 3.5, printed p.22 (BF line 1006–1011): the source says the universal bundle on k-planes in ℂᴺ has rank N and classifies through BGL_N; it should be rank k and BGL_k for that Grassmannian convention, or consistently reversed indices; affects the proof.
- **Misprint** in BF at proof of Lemma 5.1, printed p.31 (BF line 1453): the source says the input forms have twists n and m; it should be twists p and q on X×□ⁿ and Y×□ᵐ, respectively; affects the proof.
- **Misprint** in BF at §5.2 support notation, printed p.32 (BF line 1508): the source says the X-support indexed by n is obtained from supports indexed by m; it should be indexed by n consistently with X×□ⁿ; affects nothing.

For the product issue, the source's own construction at BF line 689 assumes smoothness before taking diagonal pullback; that construction supplies no such morphism for an arbitrary singular X. For the K-comparison issue, Spec ℂ[ε]/(ε²) has nonzero rational K₁ classes 1+εℂ, whereas cycle groups are nilpotent-invariant. The package retains smoothness in both places and does not copy those overbroad headers. No published correction to these preprint issues was established.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "217be4bafd5b150a5f947154cb9647053db96fcf", "job": "REV-PKG-MotivicEtaleKTheory~2", "model": "gpt-6-astra", "worker": "chris-3"} -->
