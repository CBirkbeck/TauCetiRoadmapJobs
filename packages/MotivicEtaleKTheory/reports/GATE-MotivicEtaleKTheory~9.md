The review has four distinct findings. All four are correct and remain unresolved in sibling specifications: “answered” below records the response, not completion of a repair. Neither permitted roadmap file was changed.

## H01 (CBirkbeck) — answered

ColemanIntegration §§L3.Fa.1–L3.Fa.2 still construct restriction fibers and their iterates (`TauCetiRoadmap/ColemanIntegration/README.md:2395`, lines 2397 and 2435), and line 2446 still lists only L3.Fa.1 as the latter section's dependency. `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`, lines 211–223 and 727 already supply the shared diagrams and ordered relativity through SchemeKTheoryOperations §2.5, preserving relativeKSpace, higherKGroupWithSupports, cubeRelK, cubeRelK.relativityIso and their face/open/support/pairing/sign comparisons; the necessary ColemanIntegration import and adapter correction remains outside the permitted edit files.

## H02 (CBirkbeck) — answered

SchemeKTheoryOperations still assigns multi-relative refinements and constructions to ColemanIntegration (`TauCetiRoadmap/SchemeKTheoryOperations/README.md:9`, line 2403), whereas `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15` already assigns the shared iterated restriction-fiber construction to §2.0a. The sibling ownership clauses must distinguish that construction from Coleman's exact-cube realization and Adams comparison, while keeping SchemeKTheoryOperations' earlier vertex models independent of this refinement; the conflict remains unresolved because the sibling is outside the permitted edit files.

## H03 (CBirkbeck) — answered

ColemanIntegration §L3.Fc.1 still requests construction of reg_∞ and omits this roadmap from its Needs clause (`TauCetiRoadmap/ColemanIntegration/README.md:2650`, line 2659), while `TauCetiRoadmap/MotivicEtaleKTheory/README.md:17`, lines 652–667 and 729 already specify the marked specialization reg_∞=πₚ₋₁∘ch_D,p for p≥2. The required sibling correction is to import that character and its point identification, retaining Coleman's arithmetic pairings, integral-image theorem, determinants and syntomic regulator; no authorized local edit can complete that correction.

## H04 (CBirkbeck) — answered

ColemanIntegration still claims simultaneous eigenspace decompositions for relative groups on arbitrary opens (`TauCetiRoadmap/ColemanIntegration/README.md:2395`, line 2437), and SchemeKTheoryOperations line 2405 retains an undifferentiated simultaneous-weight comparison, whereas `TauCetiRoadmap/MotivicEtaleKTheory/README.md:211`, lines 213, 223, 235 and 727 already distinguish generalized pieces from simultaneous eigenspaces. Levine94 Lemma 2.1, pp.258–259 (Levine94 line 706–736), supplies generalized characteristic spaces: for the displayed Jordan operator the ordinary and generalized kernels have dimensions 1 and 2, respectively, so the siblings must use generalized pieces on arbitrary opens or supply a separate semisimplicity theorem; that proof-plan correction remains unresolved outside the permitted files.

### Ownership, citations and pinned interfaces

- The supplied index identifies ColemanIntegration at ae078af and SchemeKTheoryOperations at 88dbd5a, matching the reviewed heads; both are new roadmap folders. The line numbers above refer to repository files, excluding the display heading added to their read-only presentations.
- The merge order has SchemeKTheoryOperations at position 37, MotivicEtaleKTheory at 83 and ColemanIntegration at 150. Ownership of the shared refinement remains here because it supplies the relative construction used by the geometric cycle-to-K comparison and then by Coleman; its ordinary supported vertices, operations and pairings come from the earlier SchemeKTheoryOperations §§2.5, 6.1 and 6.8–6.9. No construction was moved and no supplier was added.
- Object searches covered indexed main/open roadmaps, board package READMEs and the supplied overlapping open specifications. Polylogarithms §5.2 imports the auxiliary support diagram and abstract regulator; BorelRegulators §6.0a imports the universal character and marked point model; EllipticKTheory's supplier contract and PeriodsAndSpecialValues' supplier contract import the regular cycle-to-K and higher Chern comparisons. These consumers do not repair the ColemanIntegration/SchemeKTheoryOperations conflicts. No declaration was introduced, so there is no competing fully qualified declaration name.
- Supplier section locators were re-resolved against main or the indexed new-roadmap heads: GeneralAlgebraicKTheory §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13; SchemeKTheoryOperations §§2.1–2.6, 3.1–3.6, 4.3, 6.1, 6.7–6.9, 7.1–7.3; KTheoryFiniteLocalFields §§3.0a/6.10; MotivesAndAlgebraicCycles §§4.4, 4.7–4.8a, 4.14, 4.17–4.18; ComplexComparisonPartII §§C−1.1/C−1.4/C5.1/C5.3–C5.6/C6.0; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6/6.1–6.4; and the cited SchemeAndStackFoundations, EtaleCohomologyFoundations, EnhancedDerivedSheaves, DifferentialGeometry, ComplexKahlerGeometry and AlgebraicTopology sections. The Whitney and flat-ideal supplier extensions remain explicit requested inputs, rather than assumed existing results.
- Citation resolution reports no missing cross-roadmap citation or Lean name against indexed main e98875d and the 363 indexed open heads. Content main is 794d0fc; the intervening commits only update GeometricTopology and RealAlgebraicGeometry progress reports, leaving these supplier specifications unchanged. The downstream-only ZagierConjecturePolylogarithms M.8 and MixedHodgeModulesAndIrregularHodgeTheory references could not be inspected in main or the indexed open roadmaps; no finding or supply dependency relies on them. Ownership against accessible open pull requests was checked, without treating revisions of existing main roadmaps as new suppliers.
- Mathlib 6b7abb3 and Tau Ceti a91d3aa match the supplied manifest and package revisions. The native cycle is the locally finitely supported coefficient carrier in `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`; its map at line 69 requires quasi-compactness and explicit weights and supplies no face-admissibility condition. The mapping-cone declaration and its two summand differential identities occur in `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57`, lines 261 and 269. Dold–Kan in `Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167` is an equivalence in an abelian category; it does not supply geometric K-spaces.
- The other cited native Scheme, ModuleCat, HomologicalComplex and DerivedCategory declarations, graded-complex construction and Hodge/Tate/mixed-Hodge declarations were inspected at the README's pinned file/line locators. In particular, `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:110` requires an actual mixed-Hodge morphism, and `TauCeti/Algebra/Homology/GradedCochainComplex.lean:59` requires a degree-one square-zero endomorphism. Object searches found no higher-Chow, supported scheme K-spectrum or geometric Deligne carrier replacing the missing headline objects.
- `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` contains no named declarations and only imports Mathlib. The per-declaration `#check @name` inventory is therefore empty; the required build elaborated the entire module, with no retained binder or signature to change. Its missing-carrier account remains consistent with the README, and no substitute headline or assumed regulator was added.
- The legal source passages supporting the findings were read directly: Levine94 line 655–736 for supported iterated fibers and generalized weights; BF line 919–1002 for the smooth complex universal character; BKK line 3965–3990 and BKK line 4027–4062 for the unit class, real projection and Deligne models; and WeibelKBook line 15979 for the stable-Hopf obstruction to integral spectrum Adams maps. The normalization and auxiliary-complex checks also use BF line 395–459, BF line 705–778, BKK line 4121–4180 and BKK line 4841–4874. No new source was needed; the settled Bloch86/Beilinson85 uncertified and Levine98 waived citations remain settled.

### Adversarial mathematics pass

The following finite computations test the specifications and their convention transports; they are not proofs of the general targets. No roadmap statement was added or changed. “Retain” means the existing local statement survives that instance; it does not mean a sibling conflict is resolved.

| Statement | Instances tried | Values computed on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Small skeleton convention | Reindex a one-object diagram | Both colimits ℝ, marked element 1↦1 | Retain | None |
| Componentwise grading | Spec k ⊔ ℙ¹ | CH⁰=ℤ²; CH¹=0⊕ℤ; rank (2,1) stays (2,1) | Retain | None |
| Integer motivic degree | p=0, a=1 | 2p−a=−1; cycle term 0 | Retain | None |
| Derived coefficients | ℤ/2⊗ᴸℤ/2; zero ring | H⁻¹=H⁰=ℤ/2; zero coefficients give 0 | Retain | None |
| Cube/BF orientation | Graph Γ_t; degrees 0,1,2 | ∂Γ_t=[0]; δΓ_t=−[0]; J=(1,−1,1) | Retain | None |
| Multiplicativity of J | Two degree-one factors | J₂=1=(−1)(−1)=J₁J₁ | Retain | None |
| Mixed differential | Bidegree (1,1) | Cross coefficients −1,+1 sum to 0 | Retain | None |
| Shifted pair fiber | 0→ℝ[0]; id on ℤ[0] | First fiber ℝ in degree 1; second ℤ→ℤ has H⁰=H¹=0 | Retain | None |
| Localization boundary adapters | t; ordered symbol {2,t} | B[t]=+1, raw cycle boundary −1; B{2,t}=−[2], last-slot residue +[2] | Retain | None |
| All integer Tate twists | Point, p=−1,0,1 | H⁰=ℝ(−1), ℝ, 0 respectively; H¹=0,0,ℝ | Retain | None |
| Point projection | z=3+4i; p=1,2,3 | πₚ₋₁(z)=3,4i,3; πₚ₋₁(iᵖ)=0 | Retain | None |
| Wrong projection parity | Same p and kernel element iᵖ | Opposite projection sends iᵖ to i,−1,−i, all nonzero | Excludes wrong quotient map | None |
| Complex orientation | One loop; two ordered loops | ∮dz/z=2πi; normalized double residue +1, exchanged −1 | Retain | None |
| Totalized product sign | (n,s)=(1,1),(0,1),(1,2) | (−1)ⁿˢ=−1,+1,+1 | Retain | None |
| Whitney coefficient convention | Taylor coefficients 1,1,2 | Derivatives 1,1,4; coefficient n! gives derivative (n!)² | Retain | None |
| Whitney parameter dependence | m=2,y=π/2 | (m!)² sin y=4 | Retain | None |
| Whitney extension existence versus uniqueness | Zero jet at 0 | Both 0 and exp(−1/x²) have zero jets; values at 1 differ by e⁻¹ | Retain existence only | None |
| Flat-ideal sum | A=∅,B=U; A=B=U | C∞=C∞+0; 0=0+0 | Retain | None |
| Flat-ideal sum versus intersection | Coordinate axes; φ(x)+φ(y) | Flat at origin; value e⁻¹ at (0,1) | Excludes intersection model | None |
| §1.1 normalized cycle carrier | Point, p=0; doubled point | Normalized terms ℤ,0,0; coefficients 1 and 2 remain distinct | Retain | None |
| §1.1 square-zero boundary | Square in characteristics 2 and 3 | Each integral vertex coefficient +1−1=0 | Retain integral coefficients | None |
| §1.1 dimension-shifted pushforward | ℙ¹→point, fundamental cycle | Image dimension drops; target codimension −1 and class both 0 | Retain | None |
| §1.1 refined cycle condition | Γ_t; degree-one point 2 | Remaining zero face [0]≠0 for Γ_t; both faces 0 for point 2 | Separates chains and cycles | None |
| §1.1 refined retraction | Z=[x+y=3]−[x=2]−[y=2] | Each zero face [3]−[2]; after retraction ([3]−[2])−[3]+[2]=0 | Retain | None |
| §1.1 homotopy orientation | Same Z | rZ−Z=−[x+y−xy=3]+[x+y−xy=2]=−∂h₂Z | Retain integral class | None |
| §1.1 extra cubical map | x or y equal 0 or 1 | h(0,y)=y; h(x,0)=x; h(1,y)=h(x,1)=1, also mod 2 and 3 | Retain | None |
| §1.1 restriction/support transport | Empty and full supports on a point | Empty homology 0 on both sides; full H₀=ℤ on both | Retain | None |
| §1.2 direct-sum total | Total degrees 0 and 2 | Numbers of summands 1 and 3 | Retain | None |
| §1.2 axis maps | Degree-zero generator | Both axes send 1↦1 | Retain marking | None |
| §1.2 component determination | Degree-zero component multiplies by 2 | Total map sends 1↦2 | Retain | None |
| §1.2 mixed orientation | Bidegrees (1,0),(0,1),(1,1) | J multipliers −1,+1,−1 | Retain simplex axis | None |
| §1.3 integral axis comparison | Point, p=0 | H₀=ℤ on each axis, map 1↦1; positive homology 0 | Retain | None |
| §1.3 supported comparison | Z=∅ and Z=X | fib(id) has zero homology; fib(C→0)=C | Retain | None |
| §1.3 coefficient comparison | Derived mod 2 and R=0 | Two ℤ/2 groups in degrees −1,0; all groups 0 for R=0 | Retain | None |
| §1.4 multiplicity under transfer | 𝔽₂(t)/𝔽₂(t²) | Pullback then transfer sends 1↦2 in both models | Retain inseparable degree | None |
| §1.4 products and identity | Degrees (1,1),(0,1); identity map | Exchange factors −1,+1; identity coefficient +1 | Retain | None |
| §1.4 nilpotent invariance | Square-zero thickening of a point | Integral cycle group ℤ, generator 1 on both supports | Retain | None |
| §2.0a supported total fiber | n=0 over a field; empty support | Rank-two class 2; empty-support groups 0 | Retain | None |
| §2.0a support/face interchange | Identity face restriction | Either fiber order gives contractible fiber, π₀=0 | Retain | None |
| §2.0a generalized weights | T=[[2,1],[0,2]], N=T−2I | Ne₂=e₁; N²=0; dim ker N=1, dim ker N²=2 | Sibling gap persists | None |
| §2.0a equivariant transport | Same T, identity comparison | Ordinary kernel dimension stays 1; generalized dimension stays 2 | Cannot infer semisimplicity | None |
| §2.0a commuting operations | T and identity on same block | T(e₂)=e₁+2e₂ stays in generalized piece but is not 2e₂ | Preservation is not scalar action | None |
| §2.0a rational decomposition | ℙ², h³=0 | ψ²h=2h−h²; ψ²h²=4h²; eigenlattice index 2 | Rational coefficients necessary | None |
| §2.0a integral Adams domain | Spec ℚ; stable η on rank 1 | η·1=[−1]≠0; ψ²[−1]=0, ψ²1=1 | Excludes integral spectrum-map claim | None |
| §2.0a support-local cycle map | W={0}⊂𝔸¹, c=1 | Supported class 1; forgetting support gives 1−1=0 | Retain support distinction | None |
| §2.0a vanishing endpoint | V=Spec ℚ,c=0; W={0}⊂𝔸¹,c=1 | K₁^(0)(ℚ)=0; K₀^(0)=ℚ; supported K₁^(1)=0, weight 2 contains [2] of valuation 1 | Retain a>0,b≤c | None |
| §2.0a unique relative lift | V=𝔸²,W=V(x),D=V(y),c=1 | Face obstruction weight 1 is 0; K₀ support restriction ℚ→ℚ is 1↦1, kernel 0 | Retain endpoint needed for injection | None |
| §2.0a ordered difference | Face ranks (1,0),(0,1),(1,1) | Differences 1,−1,0; reversed order −1,1,0 | Retain | None |
| §2.0a one-loop Adams compatibility | Unit 2 over ℚ | ψ²[2]=2[2], valuation 2; ψ¹[2]=[2], valuation 1 on both models | Retain | None |
| §2.0a two-loop exchange | {u,v} over ℚ(u,v) | Consecutive ordered residues +1; exchanged −1; ψ² multiplier 4 | Retain | None |
| §2.0a mixed-characteristic scope | X=Spec ℤ_p,p=2,3, full one-cube | K₀(relative)=K₁(ℤ_p)=ℤ_p×; rank differences +1,−1 | Retain every prime | None |
| §2.0a arbitrary open versus full cube | 𝔸¹_ℚ minus 2, faces 0,1 | Unit z−2 restricts to (−2,−1), whose ratio is 2 | Full diagonal argument unavailable on this open | None |
| §2.0a common-base pairing | Rank 2 and rank 3; units u,v | Rank product 6; ψ²{u,v}=4{u,v}=2[u]·2[v] | Retain | None |
| §2.0a external regularity condition | ℤ[i]⊗ℤℤ[i] at ramified prime | Local dimension 1, cotangent dimension 2; v(v+2i)=0 | Excludes singular external product | None |
| §2.0a regular versus smooth | L=𝔽_ℓ(t)[s]/(s^ℓ−t),ℓ=2,3 | Local dimension 0; Ω¹_L/k=L ds≠0; cycle/K₀ map 1↦1 | Retain regular domain | None |
| §2.0a relative-cycle incidence | W={z=0} in one cube | Codimension 1 in cube, 0 in zero face | Excluded by proper incidence | None |
| §2.0b integral Chern operations | Unit 2; zero K-class | c₁,₁[2]=[2], valuation 1; c₀,₀(0)=1 but character of 0 is 0 | Retain distinction | None |
| §2.0b finite-field route | 𝔽₂,𝔸¹ minus {0,1}; unit t | Open has 0 rational points; Tate unit class has valuation 1 | Retain functorial Tate route | None |
| §2.0b Chern versus character | O(1),O(1)⊕O(−1) on ℙ² | c₂=0,−h²; ch₂=h²/2,h² | Retain | None |
| §2.0b diagonal normalization | n=1,2,3 | Integral symbol composite factors 1,−1,2; rational character factor 1 each | Retain | None |
| §2.1 geometric cycle map | Point rank 2; point in ℙ¹ | 2↦2; point↦1−O(−1), Euler characteristic +1 | Excludes zero/inverse maps | None |
| §2.1 representative independence | Z and rZ from refined square | Difference −∂h₂Z; refined face coefficients all 0 | Retain | None |
| §2.2 total character | O(1),O(−1) on ℙ¹ | 1+h,1−h; sum 2 | Retain | None |
| §2.2 weight projectors | ψ² weights 0,1,2 | Eigenvalues 1,2,4; distinct differences −1,−3,−2 | Denominators nonzero | None |
| §2.2 Adams character formula | Rank and unit; a=1,2 | Rank multiplier 1; unit multipliers 1,2 | Retain | None |
| §2.2 universal inverse equality | Point divisor; {2,t} | Leading h on both maps; last-slot residue +[2], swapped −[2] | Retain higher sign witness | None |
| §2.3 supported comparison | Empty support; regular inseparable field point | 0≃0; full degree-zero ℚ≃ℚ sends 1↦1 | Retain | None |
| §2.3 singular support | V(xy)⊂𝔸² | Leading support coordinates (1,1), with two independent components | Does not replace support by K(Z) | None |
| §2.3 localization sign | d(Γ_t,0)=([0],t) | Raw class [(0,t)]=−[0]; adapted value +[0]=B[t] | Retain | None |
| §2.3 support enlargement | {0}⊂{0,1} in 𝔸¹_L | 1↦(1,0); identity coefficient +1 | Retain | None |
| §2.4 character products | Bundles of ranks 2,3; ξ=1−O(−1) on ℙ¹ | 6=2·3; ch(ξ²)=0=h² | Retain | None |
| §2.4 leading class can vanish | Origin in 𝔸¹ | [O₀]=1−1=0; divisor(t)=0 | Retain 0=0 | None |
| §2.4 higher Newton coefficient | p=1,2,3 | Factors 1,−1,1/2; ch₂,₂=−c₂,₂ | Retain rational denominators | None |
| §3.1 logarithmic image algebra | Punctured disk; empty boundary | dlog|z|²=dz/z+dz̄/z̄; empty boundary gives ordinary smooth forms | Retain | None |
| §3.1 Dolbeault identities | Function z z̄ | ∂∂̄ gives dz∧dz̄; ∂̄∂ gives −dz∧dz̄ | Retain square-zero sum | None |
| §3.1 chart change | z↦2z | Logarithmic difference log 4; derivative difference 0 | Retain | None |
| §3.1 algebra size and identity | log|z|²,|z|⁻²; constant 1 | First has logarithmic growth; second order-two pole; d1=0,1·1=1 | Excludes arbitrary poles | None |
| §3.2 shifted Hodge weights | 𝔾_m; point | dlog z in residue W₁ and H¹ weight 2; point H⁰ weight 0 | Retain degree shift | None |
| §3.2 refinement invariance | Boundary blowup of 𝔾_m² | Betti dimensions 1,2,1 before/after; dlog periods unchanged | Retain F comparison | None |
| §3.2 flat coordinate division | f=exp(−1/|z|²); f=1 | f/z² has zero jets and value e⁻¹ at 1; 1/z diverges at 0 | Retain flatness | None |
| §3.2 logarithmic flat extension | f=exp(−1/|zw|²), (z,w)=(−2,1) | f log|z|²/(z w̄)=−e⁻¹ᐟ⁴ log4/2; jets on axes 0 | Retain combined estimate | None |
| §3.3 small/cone comparison | Point, twists 0,1,−1 | H⁰=ℝ,0,ℝ(−1); H¹=0,ℝ,0 | Retain | None |
| §3.3 deformation retract | Point, log2+iθ | Projection/inclusion gives log2; difference iθ lies in real-twist image | Homotopy, not identity | None |
| §3.3 critical differential | x=|z|²,p=1 | d_Dx=−2dz∧dz̄ | Retain degree jump | None |
| §3.3 cone-arrow transport | Point coordinate 3+4i in twists 1,2,3 | Raw negated coordinates −3,−4i,−3; transported markings restore 3,4i,3 | Retain | None |
| §3.3 shift limitation | One-dimensional type (0,0) shifted by 1 | Total degree −1 would require conjugate integral types of equal halves −1/2 | No shifted Dolbeault carrier asserted | None |
| §3.4 Zariski logarithmic realization | 𝔸¹,p=1; Re z | H¹=ℝ constants; Re z takes 0,1 but has pole growth at infinity | Excludes analytic sheafification | None |
| §3.4 marked refinement pullback | x=e,y=eu, point (2,3) | Pullback log|x|=log|e| has value log2; log|y| instead log3 | Retain | None |
| §3.4 descent and finite unions | Point ⊔ ℙ¹; empty open | H_D⁰(weight 0)=ℝ²; restriction target for empty open 0 | Retain | None |
| §4.1 critical product | log2,log|t| on 𝔾_m | Product i log2 darg t; reversed negative; period 2πi log2 | Retain twist/sign | None |
| §4.1 point product and unit | log2,log3; identity 1 | Odd product 0; 1·log2=log2 | Retain | None |
| §4.1 nonunital domain | tℝ[t]; ℝ[t] | Coefficient of t in et always 0 in first; coefficient of t in 1·t is 1 in second | Unit requires specified identity | None |
| §4.1 Leibniz witness | x=|z|²,y=1,p=q=1 | Product −z̄dz+zdz̄; d_D product −2dz∧dz̄=d_Dx·1 | Retain | None |
| §4.2 associator and critical vanishing | Re z,2,3 in weight 0; point 2,3,5 | Both bracketings 6 Re z, value 6 at z=1; point bracketings 30; h_a=0 | Closedness unnecessary at critical degree | None |
| §4.2 refinement product sign | Ordered torus loops, before/after blowup | Period (2πi)²; exchanged −(2πi)² in both models | Retain | None |
| §5.1 pair-fiber differential | General pair and identity restriction | Second coordinate of d² is res(dω)−d(resω−dg)=0; identity fiber H=0 | Retain | None |
| §5.1 support direction | {0}⊂{0,1}; disjoint divisors | r↦(r,0); disjoint support product cohomology 0 | Retain | None |
| §5.2 singular-support semipurity | Crossing,cusp,origin in 𝔸² | Crossing top group ℝ², class (1,1); cusp ℝ, class 1; origin weight-1 H²=0, weight-2 H⁴=ℝ | Retain codimension | None |
| §5.2 codimension negative control | Point,p=1,full support | H¹=ℝ≠0 despite 1<2; support codimension 0<1 | Hypothesis necessary | None |
| §5.2 multiplicity and product | V(x),V(y); double V(x) | Intersection length 1, doubled length 2; support coordinates 1,2 | Retain | None |
| §5.2 current criterion in both directions | f=t and f=t² | d_D[−log|f|]=−δ₀,−2δ₀; divisor coordinates +1,+2 | Retain negative Green representative | None |
| §5.3 auxiliary totalization | (r,n)=(2p,1),(2p−1,1) | Total degrees 2p−1,2p−2; cube signs +1,−1 | Retain | None |
| §5.3 good truncation | Re(z₁)dz₂∧dz̄₂, p=1 | d_D evaluates to −2i on (∂ₓ₁,∂ₓ₂,∂ᵧ₂), so top term excluded | Excludes brutal truncation | None |
| §5.3 empty-support colimit | Point,p=1,n=0 | Column ℝ→ℝ by id in degrees 1,2; H¹=H²=0, cochains nonzero | Retain acyclicity wording | None |
| §5.3 colimit and class maps | Origin with coefficients 1 and 2; union support | Class coordinates 1,2; enlargement sends 1↦(1,0) | Retain | None |
| §5.4 class/projection comparisons | Origin; point,p=0 | Cycle/support class 1↦1; normalized point support complex ℝ,0,0 | Retain | None |
| §5.4 affine contraction | Point→𝔸¹, p=0,1 | H⁰(weight0)=ℝ and H¹(weight1)=ℝ on each; positive normalized cube cohomology 0 | Retain | None |
| §6.1 specified regulator roof | Point integer m; ℙ¹ lines O(±1) | m↦m; Tate-normalized integrals ±1, raw periods ±2πi | Retain | None |
| §6.1 integral source and torsion | Units −1,i | Log absolute values 0,0 | Retain | None |
| §6.2 homotopy correction sign | A=A′=ℤ[0], B=0, B′=(ℤ→ℤ),r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong (1,−1) gives (0,2) | Retain +ha | None |
| §6.2 support boundary | t on punctured line | Raw Deligne connecting coefficient −1; negative logarithm representative coefficient +1 | Retain separate adapter | None |
| §6.3 pullback | Point→ℙ¹; O(1) | Both c₁ and Deligne H² pullback 0 | Retain moving domain | None |
| §6.3 embeddings/model comparison | Unit 2; two axes in degree 0 | Either embedding route gives log2; either axis sends 1↦1 | Retain | None |
| §7.1 independent character | 2eⁱθ,i; O(a) on ℙ¹ | Quotient values log2,0; character 1+a h_D | Retain | None |
| §7.1 Dold–Kan boundary | Constant simplicial ℤ and S₃ | ℤ gives π₀=H₀=ℤ, higher groups 0; S₃ has nonabelian π₀=S₃ | Abelian comparison restricted correctly | None |
| §7.2 regulator comparison | Rank2; unit2; point divisor | Both maps give 2,log2,h_D respectively | Retain markings | None |
| §7.3 integral-source products | Units2,t; units2,3 at point | First product i log2 darg t, swapped negative; point product 0 | Retain odd sign | None |
| §7.3 divisor products | Two rulings of ℙ¹×ℙ¹ | Product point has normalized degree 1; doubling a ruling gives 2 | Retain | None |
| §7.4 logarithm law | 2,3,6,1,i,1/2 | Values log2,log3,log6=log2+log3,0,0,−log2 | Retain | None |
| §7.4 projective/divisor marking | a=−1,0,1; tᵃ | Chern integrals −1,0,1; Green −a log|t|, unit +a log|t| | Retain | None |
| Coleman marked specialization | p=2,3; z=3+4i | 2p−(2p−1)=1; point projections 4i,3 | Local contract exact; sibling import absent | None |

### Validation

`lake build TauCetiRoadmap.MotivicEtaleKTheory.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (11s)
Build completed successfully (8976 jobs).
```

The required gate exited 0, with its exact summary line:

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required movable dependency check exited 0, with its complete output:

```text
depcheck: 51 roadmaps, 582 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The worktree is clean at 83b84df; no roadmap edit required a commit, and nothing was pushed. Passing these checks does not close any of H01–H04.
