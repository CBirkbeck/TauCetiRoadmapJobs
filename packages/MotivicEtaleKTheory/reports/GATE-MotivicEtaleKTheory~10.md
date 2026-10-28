All four outstanding components are substantiated integration defects. The status `answered` below acknowledges the evidence; it does **not** mean that a sibling correction was applied or that the finding is resolved. The authorized edit set contains only `TauCetiRoadmap/MotivicEtaleKTheory/README.md` and `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean`; neither needs a change for these findings, and both remain unchanged at `83b84dfb91b8c5b462d57b390896bff8e5df7e43`.

## H01 (CBirkbeck) — answered

The shared restriction fibers and ordered relativity are still constructed twice: `TauCetiRoadmap/ColemanIntegration/README.md` at `ae078af76fc2ca886eeaa0e171727cefc6953365`, lines 2395–2397, 2415 and 2435–2446, constructs the relative and iterated fibers and gives L3.Fa.2 only L3.Fa.1 as its prerequisite, whereas `TauCetiRoadmap/MotivicEtaleKTheory/README.md:211`, :222–223 and :727 already supplies the shared diagrams and coherent Quillen adapters through SchemeKTheoryOperations §2.5. The sibling must import that construction while retaining `relativeKSpace`, `higherKGroupWithSupports`, `cubeRelK`, `cubeRelK.relativityIso`, the difference values +1 and −1 on (1,0) and (0,1), and the two-loop exchange −1; that sibling edit is outside the authorized files and remains unapplied.

## H02 (CBirkbeck) — answered

`TauCetiRoadmap/SchemeKTheoryOperations/README.md` at `88dbd5a787e63263d086c798f1873d401debe960`, lines 9 and 2403, still assigns multi-relative refinements/constructions to ColemanIntegration, conflicting with the shared ownership already specified in `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`. Its §§2.5, 6.1 and 6.8–6.9 independently construct the ordinary supported comparisons, pairings and operations consumed here, so the necessary sibling correction assigns the shared iterated refinement to MotivicEtaleKTheory §2.0a while leaving Coleman's exact-cube realization/comparison local; it requires no reverse prerequisite and remains unapplied outside the authorized files.

## H03 (CBirkbeck) — answered

`TauCetiRoadmap/ColemanIntegration/README.md` at `ae078af76fc2ca886eeaa0e171727cefc6953365`, lines 2650 and 2659, still constructs reg_∞ without importing the marked character, whereas `TauCetiRoadmap/MotivicEtaleKTheory/README.md:652`, :667 and :729 already specifies reg_∞ = πₚ₋₁ ∘ ch_D,p for p≥2. The projection πₚ₋₁(z)=(z+(−1)ᵖ⁻¹z̄)/2 annihilates ℝ(p), sends 3+4i to 4i for p=2 and 3 for p=3, and is the supplied small-model coordinate (BKK line 4027–4036 and BKK line 4063–4068); the required sibling import leaves its arithmetic pairings, integral-image theorem, determinants and syntomic construction intact and remains unapplied outside the authorized files.

## H04 (CBirkbeck) — answered

The arbitrary-open simultaneous direct sum in `TauCetiRoadmap/ColemanIntegration/README.md` at `ae078af76fc2ca886eeaa0e171727cefc6953365`, lines 2395 and 2437, and the unqualified simultaneous-weight contract in `TauCetiRoadmap/SchemeKTheoryOperations/README.md` at `88dbd5a787e63263d086c798f1873d401debe960`, line 2405, exceed the generalized decomposition actually supplied at `TauCetiRoadmap/MotivicEtaleKTheory/README.md:211`, :213 and :727 (Levine94 line 706–736, Lemma 2.1, pp.258–259). For T=[[2,1],[0,2]], ker(T−2I) has dimension 1 and ker((T−2I)²) dimension 2, so equivariant transport cannot supply the missing semisimplicity theorem; the sibling contract must retain generalized pieces on arbitrary opens or supply that theorem, while keeping the full-cube/product-support simultaneous identification of :223, and this sibling correction remains unapplied.

## Ownership, citations and pinned interfaces

The open-head index identifies the two sibling heads above and the unchanged target head; neither sibling folder is on main. The indexed main is `ce9dea7a6e8c6f35d1d2994a627dd3946a310bd9`; the checkout's `origin/main` and content main are `4f7a4021c5eefb6a254dcd4db450663a5f1aa71d`, and the README/Suggested.lean specifications have no differences between those main commits. Ownership was searched by restriction fibers, multi-relative cubes, Adams weights and Deligne regulators across main, indexed open heads and board packages, including the supplied overlapping open work; it was not inferred from declaration spellings.

SchemeKTheoryOperations §§2.5, 6.1, 6.8–6.9 are the existing owners of the ordinary supported vertices, comparison and operations. MotivicEtaleKTheory §2.0a owns their shared iterated restriction-diagram refinement because that construction is needed before its own cycle-to-K comparison; §§3–7 similarly own the general logarithmic Deligne theory and character consumed by several regulator roadmaps. ColemanIntegration retains its exact-category/cube realizations and arithmetic applications. No ownership or merge-order move was made in this job, and no declaration was given another roadmap's fully qualified name.

The supplier sections were resolved against main or their indexed open heads: GeneralAlgebraicKTheory §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13; SchemeKTheoryOperations §§2.1–2.6, 3.1–3.6, 4.3, 6.1, 6.7–6.9, 7.1–7.3; KTheoryFiniteLocalFields §§3.0a, 6.10; MotivesAndAlgebraicCycles §§4.4, 4.7–4.8a, 4.14, 4.17–4.18; SchemeAndStackFoundations §§2.1–2.2, 4.12, 4.17, 5.1–5.8; ResolutionOfSingularitiesCharacteristicZero §§5–6; EtaleCohomologyFoundations §§G.1–G.3; ComplexComparisonPartII §§C−1.1, C−1.4, C5.1, C5.3–C5.6, C6.0; EnhancedDerivedSheaves §§0.1–0.4, E0.6, E1.4, E2.6; DifferentialGeometry Layers 0–1, 5–9; ComplexKahlerGeometry K1–K2; AlgebraicTopology Stages 2–3, 6 and 8 item 2; Completed/HodgeStructures. Polylogarithms §5.2 and BorelRegulators §6.0a already import the relevant shared target constructions. The two design-only downstream names, ZagierConjecturePolylogarithms and MixedHodgeModulesAndIrregularHodgeTheory, were checked in their package designs, not misidentified as main or open suppliers.

The package checkouts are exactly Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. In particular, Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44 defines a cycle as a locally finitely supported function, without dimension or face-admissibility conditions; :69 gives its weighted quasi-compact pushforward. Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57, :261 and :269 provides the ordinary cone and its summand differential identities; Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167 is an equivalence for an abelian category, not for arbitrary simplicial groups. TauCeti/Geometry/Hodge/Tate/Basic.lean:91, :100 and :111 supplies the linear Tate structure, and TauCeti/Geometry/Hodge/Mixed/Basic.lean:72 and Mixed/Strictness.lean:110 supplies linear mixed-Hodge data and its morphism strictness. These native carriers do not construct the geometric higher-cycle, scheme K or logarithmic Deligne carriers required by the headlines; object searches found no implementation replacing those targets.

The declaration/signature inventory of `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` is empty: one import, one module docstring and an empty namespace. Therefore the requested list of `#check @name` commands is empty, no declaration has an elaborated signature or dropped hypothesis to compare, and no binder changed; the module build elaborated that unchanged file. Its docstring records the unavailable carriers rather than introducing substitute predicates or assumed maps.

No new source was needed. The existing legal source copies suffice for these findings, particularly Levine94 line 655–736, BF line 919–1036 and BKK line 4027–4068; Bloch86 §7 and Beilinson85 remain settled uncertified citations and Levine98 remains waived. No missing-text request or source-manifest change was made.

## Adversarial mathematics pass

The table records explicit finite or local instances, not proofs of the universal theorems. Locations below refer to `TauCetiRoadmap/MotivicEtaleKTheory/README.md`; no mathematical statement was added or changed. A result of “retained” means that the tested value agrees with the existing target, not that a sibling conflict was repaired.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: componentwise dimension (:21) | point disjoint from ℙ¹ | CH¹=0⊕ℤ; rank=(1,1), not 2 in a single summand | retained | none |
| Conventions: integer reindexing (:23) | p=0,a=1 | 2p−a=−1; cycle term=0, not degree-zero ℤ | retained | none |
| Conventions: derived coefficients (:23) | ℤ/2 tensored with ℤ/2; zero coefficient ring | H⁻¹=H⁰=ℤ/2; both groups=0 for R=0 | retained | none |
| Conventions: cube/simplex orientation (:25) | n=0,1,2; mixed (1,1) | J=(1,−1,1); cross coefficients −1+1=0 | retained | none |
| Conventions: pair fiber and shift (:27) | 0→ℝ[0]; identity on ℤ[0] | first fiber has H¹=ℝ; identity fiber ℤ→ℤ has H⁰=H¹=0 | retained | none |
| Conventions: raw versus positive boundary (:27) | graph of t on 𝔸¹ | d(Γ_t,0)=([0],t); raw coefficient −1, adapted coefficient +1 | retained | none |
| Conventions: Tate line and logarithm (:29) | u=2,i,1/2; p=−1 | log abs values log 2,0,−log 2; inverse Tate factor exists since 2πi≠0 | retained | none |
| Conventions: critical differential (:29) | x=abs(z)² | ∂∂̄x=dz∧dbar(z); d_Dx=−2dz∧dbar(z) | retained | none |
| Conventions: orientation and total product (:31) | positive loop; two ordered loops; n=s=1 | periods 2πi,(2πi)²; exchange −1; total factor −1 | retained | none |
| Whitney extension (:87) | Taylor coefficients 1,1,2; zero jet | derivatives 1,1,4; 0 and exp(−1/x²) both have zero jet | retained; excludes uniqueness | none |
| Parametric Whitney extension (:87) | m=2,y=π/2 | (m!)² sin y=4; scalar-only jet data would omit this prescribed value | retained | none |
| Flat-ideal sum (:95) | A=∅,B=U; A=B=U | C∞=C∞+0; 0=0+0 | retained | none |
| Flat-ideal sum versus intersection (:95) | coordinate axes, φ(x)+φ(y) | value at (0,1)=e⁻¹; decomposition into flat summands has the same value | retained; intersection would fail | none |
| Normalized cube definition (:123) | p=0, point; n=0 | normalized groups ℤ,0,0; raw degenerate positive groups would be ℤ | retained | none |
| Native cycle subgroup and pushforward (:123,:132) | doubled point; ℙ¹→point | generator 1, doubled cycle 2; dimension-dropping pushforward 0 | retained | none |
| Cube differential and normalization quotient (:125,:131) | graph Γ_t; square vertex | ∂Γ_t=[0], δΓ_t=−[0]; vertex coefficient 1−1=0 | retained | none |
| Refined subcomplex and remaining-face condition (:127,:136) | Γ_t; cube point 2 | Γ_t remaining face=[0]≠0; point 2 has both faces=0 | retained | none |
| Integral refined retraction (:127) | square Z at :146 | ordinary faces both [3]−[2]; refined faces ([3]−[2])−[3]+[2]=0 | retained | none |
| Retraction identity on refined inputs (:127) | n=0,1 and refined zero chain | r i=id gives identical cycle; homotopy boundary on zero is 0 | retained | none |
| Extra cubical map (:127) | x=0, y=0, x=1, y=1; char 2,3 | x+y−xy gives y,x,1,1 in each characteristic | retained | none |
| Cycle pushforward/flat pullback (:132) | inseparable degree 2 over 𝔽₂(t²) | transfer after restriction sends 1 to 2, not 1 | retained | none |
| Orientation involution/product (:133) | n,m=1,1 | J₁²=1=J₂; J₁J₁=1 | retained | none |
| Coefficient detection (:134) | reduced support and multiplicity-two cycle | native coefficients 1≠2 | retained | none |
| Natural support/refinement transport (:135) | identity and empty support | identity coefficient 1; empty-support homology 0 on both models | retained | none |
| Mixed complex definition and axis maps (:153,:159) | total degrees 0,2 | summand counts 1,3; both degree-zero axis maps send 1 to 1 | retained | none |
| Mixed total differential (:155,:160) | bidegree (1,1) | cross terms −1,+1 sum to 0 | retained | none |
| Mixed orientation (:161) | (1,0),(0,1),(1,1) | multipliers −1,+1,−1; simplex axis stays +1 | retained | none |
| Integral axis comparison (:173) | point,p=0 | H₀ maps ℤ→ℤ by 1; all Hₙ for n>0 are 0→0 | retained | none |
| Supported axis comparison (:173) | Z=∅,X | identity fiber has H=0; full-support fiber equals original complex | retained | none |
| Derived coefficient comparison (:173) | multiplication-by-2 resolution; R=0 | derived reduction has ℤ/2 in degrees −1,0; R=0 gives 0→0 | retained | none |
| Integral operations comparison (:187) | point disjoint from ℙ¹ | CH¹=0⊕ℤ; CH⁰=ℤ² in both models | retained | none |
| Product exchange (:187) | degrees (1,1),(0,1); characteristic 2 base | signs −1,+1 over integral coefficients; −1 is not replaced by +1 just from char k=2 | retained | none |
| Nilpotent invariance (:195) | square-zero thickening of point | integral support generators ℤ→ℤ by 1 | retained | none |
| Supported multi-relative construction (:211,:221) | n=0, full/empty support | K₀(k) class [k²]=2; empty support K₀=0 | retained | none |
| Generalized weights (:211,:213) | T=[[2,1],[0,2]] | (T−2)e₂=e₁; (T−2)²e₂=0; kernel dimensions 1 and 2 | target retained; H04 confirmed | none |
| Integral pointed Adams scope (:211) | rank 1 and stable η over ℚ | ψ²(1)=1, ψ²[−1]=0 but η·1=[−1]≠0 integrally | retained; spectrum-map inference fails | none |
| Relative cycle group (:215) | point,D empty,c=0 | degree-zero rank class 1 maps to 1 in ℚ | retained | none |
| Support-local cycle isomorphism (:215,:219) | 𝔸¹,W={0},c=1 | raw cycle 1 maps to supported generator 1; forgotten K₀ class 1−1=0 | retained | none |
| Positive-degree vanishing endpoint (:215) | c=0 on ℚ; c=1 on 𝔸¹ with origin support | K₁ weight 0=0; supported K₁ weight 1=0, weight 2 contains [2] with valuation 1 | retained; endpoint c+1 fails | none |
| Unique zero-face lift (:215) | V=𝔸²,W=V(x),D=V(y) | restriction ℚ→ℚ is 1↦1; kernel=0 and relative weight-1 K₀=0 | retained | none |
| Splitting/incidence hypotheses (:215) | affine coordinate z; W={z=0} | z+(1−z)=1; codim W=1 in V but 0 on its face | retained; W excluded | none |
| Refined boundary as relative relation (:220) | refined degree-one point 2; Γ_t | point faces=0; Γ_t face=[0]≠0 so it cannot be used as a cycle | retained | none |
| Pullback and support enlargement (:222) | identity; {0}⊂{0,1} | supported coefficient 1↦1 and 1↦(1,0) | retained | none |
| Common-base pairing (:222) | X=Spec ℤ[i], two full one-cubes | product over X is X×□², regular; external self-product over ℤ has local dimension 1, cotangent dimension 2 | retained; regular-product condition necessary | none |
| Adams multiplicativity of pairing (:222) | two unit loops of weight 1 | ψ² product=4{u,v}; product of ψ² factors=2·2{u,v}=4{u,v} | retained | none |
| Ordered full-cube relativity (:223) | n=1; face rank pairs | (1,0)↦1, (0,1)↦−1, (1,1)↦0 | retained; H01 confirmed outside target | none |
| Two-loop exchange (:223) | {u,v} over ℚ(u,v) | ordered consecutive residues +1; exchanged order −1; ψ² eigenvalue 4 | retained | none |
| Full-cube weights (:223) | X=point,unit 2,n=1 | relative class maps to [2]; ψ² gives 2[2] on both sides | retained | none |
| All-prime regular bases (:233) | ℤ₂ and ℤ₃ full one-cubes | K₀ relative=K₁(ℤ_p)=ℤ_p×; face rank differences +1,−1 for both primes | retained | none |
| Arbitrary-open limitation (:233) | ℤ₃ cube with t=2 removed | both retained face ranks of trivial line=1; their difference=0, without asserting full-cube delooping | retained | none |
| Rational weight coefficients (:234) | ℙ²,h³=0 | ψ²(2h+h²)=4h+2h²=2(2h+h²); lattice determinant 2 | retained | none |
| Regular versus smooth scope (:237) | L=𝔽_ℓ(t)[s]/(s^ℓ−t),ℓ=2,3 | CH⁰ and weight-zero K₀ both ℚ, 1↦1; Ω¹_L/k=L ds≠0 | retained | none |
| Relative cycle normalization (:238) | cube point s over L | resulting K₁ class [s] has s-adic valuation +1; zero/inverse give 0/−1 | retained | none |
| Universal Chern operations (:245) | p=0,zero class; p=n=1,unit 2 | c₀,₀=1 while ch(0)=0; c₁,₁[2]=[2], valuation 1 | retained | none |
| Finite-field Chern construction (:245,:249) | 𝔽₂,𝔾_m | c₁,₁[t]=[t], valuation 1; (𝔸¹−{0,1})(𝔽₂) has 0 points | retained | none |
| Degree-zero Whitney versus additivity (:249) | O(1)⊕O(−1) on ℙ² | c₂=−h², ch₂=h²; c₂ of either line separately=0 | retained | none |
| Diagonal Chern factor (:250) | n=1,2,3 | symbol factors 1,−1,2; rational character factors all 1 | retained | none |
| Character Newton coefficient (:251) | p=1,2,3 | coefficients 1,−1,1/2; denominators 1,1,2 are nonzero in ℚ | retained | none |
| Geometric cycle map (:264) | point rank 2; ℙ¹ divisor | 2↦2; h↦1−[O(−1)] with Euler characteristic +1 | retained | none |
| Cycle-map naturality (:270) | empty scheme; two points; identity | 0→0; (2,1)↦(2,1); identity preserves each coordinate | retained | none |
| Refined representative requirement (:278) | square Z and rZ | raw zero-face coefficients (+1,−1)≠0; refined coefficients (0,0) | retained | none |
| Higher character and inverse (:284,:292) | rank 2; unit 2 | ch₀(2)=2, positive rank weights=0; ch₁[2]=[2], valuation 1 | retained | none |
| Adams diagonalization (:284) | weights 0,1,2 | ψ² eigenvalues 1,2,4; projector denominators −1,−3,−2 | retained | none |
| Universal versus geometric inverse (:288) | {2,t} on 𝔾_m | uniformizer-last residue [2], valuation +1 on both maps; raw right-linear boundary −[2] | retained | none |
| Supported rational character (:307) | empty/full support; disconnected scheme | 0≃0; full-support rank components (2,1), CH¹=0⊕ℚ | retained | none |
| Regular imperfect-field comparison (:307) | above L and origin in 𝔸¹_L | rank 1↦1; origin class 1↦1 in supported weight 1 | retained | none |
| Supported boundary transport (:311,:316) | unit t on 𝔸¹ | B[t]=+[O₀]; raw cycle boundary −[0]; negative-raw adapter +[0] | retained | none |
| Supported functoriality (:315) | support {0} enlarged to {0,1}; identity | coefficient 1↦(1,0); identity coefficient +1 | retained | none |
| Smooth character product (:330) | ranks 2,3; ℙ¹ divisor square | ranks give 6=2·3; ξ²=0 and h²=0 | retained | none |
| Leading structure-sheaf character (:330) | projective point; principal affine origin | projective class has coefficient +1; affine K₀ class=1−1=0 and Chow divisor=0 | retained | none |
| Higher Chern coefficient (:330) | p=1,2,3 in positive K-degree | ch/c factors 1,−1,1/2, so ch₂,₂=−c₂,₂ | retained | none |
| Logarithmic image algebra (:356,:364) | empty boundary; empty variety; punctured disk | smooth algebra; zero terms; d log abs(z)²=dz/z+dbar(z)/bar(z) | retained | none |
| Logarithmic growth restriction (:356) | near z=0 | log abs(z)² admitted; abs(z)⁻² has pole growth and is excluded | retained | none |
| Dolbeault identities (:362) | x=abs(z)² | ∂²x=∂̄²x=0; ∂∂̄x=dz∧dbar(z), ∂̄∂x=−dz∧dbar(z) | retained | none |
| Logarithmic pullback (:363) | x=e after boundary blowup | log abs(x) pulls to log abs(e); value at (2,3)=log 2 in either chart description | retained | none |
| Logarithmic identity (:364) | nonempty point and restriction | 1·2=2; pullback 1=1 | retained | none |
| Filtered geometric comparison (:377) | 𝔾_m; point; empty | H¹ type (1,1), weight 1+1=2; point weight 0; empty H=0 | retained | none |
| Refinement invariance and filtration scope (:377) | torus boundary blowup | Betti dimensions 1,2,1 unchanged; residue E₁ diagram gains a boundary component | retained | none |
| Coordinate-division estimate (:379,:383) | exp(−1/abs(z)²)/z²; f=1 | zero jets at 0, value e⁻¹ at 1; 1/z fails smooth extension | retained | none |
| Log-power and combined estimate (:379,:384) | f(z,w) at (−2,1) as :393 | f log abs(z)²/(z bar(w))=−e⁻¹ᐟ⁴ log 4/2; zero jets on both axes | retained | none |
| Deligne cone and small model (:399) | A=ℂ[0],p=0,1,−1 | H⁰(p=0)=ℝ; H¹(p=1)=ℝ; H⁰(p=−1)=ℝ(−1),H¹=0 | retained | none |
| Cone retract (:399,:401) | point,p=1,r real; representative log 2+iθ | projection after inclusion sends r↦r; other composite sends representative to log 2 | retained; equality replaced only by homotopy in existing text | none |
| Cone-arrow transport (:412) | z=3+4i,p=1,2,3 | raw coordinates 3,4i,3; representative negation gives −3,−4i,−3; transported coordinate restores originals | retained | none |
| Comparison naturality/shifts/sums (:405) | zero input; point shifted by 1 | all zero-input maps=0; shifted point degree=−1 cannot retain its sole type (0,0) | retained; no D(A[1]) claim | none |
| Exactness/filtered quasi-isomorphism (:406) | split ℂ⊕ℂ→ℂ on point | real H¹ values ℝ²→ℝ are coordinate projection, kernel ℝ | retained | none |
| Critical-degree jump (:407) | p=1,x=abs(z)² | ordinary degrees 0→2; Deligne degrees 1→2; differential −2dz∧dbar(z) | retained | none |
| Compactification-independent realization (:422) | 𝔾_m² and boundary blowup | loop periods (2πi,0),(0,2πi); product (2πi)² in both choices | retained | none |
| Zariski sheafification requirement (:422) | X=𝔸¹,p=1,Re z | H¹=ℝ; Re z takes 0,1 but pole growth at infinity excludes it | retained | none |
| Refinement cocycle (:428) | identity refinement and repeated same choice | each induced coefficient=1; composite 1·1=1 | retained | none |
| Pullback and finite disjoint unions (:429) | point disjoint from ℙ¹; empty restriction | H_D⁰=ℝ², target under empty restriction 0 | retained | none |
| Finite-open descent (:430) | empty variety; repeated identity cover of point | empty complex=0; Čech first differential r↦(r,r), difference (a,b)↦b−a | retained | none |
| Sheafified colimit universal property (:431) | single compactification and identity cocone | section 1 maps to prescribed 1; any compatible extension has the same value | retained | none |
| Four-case Deligne product (:454) | weight-one log 2,log abs(t); point | product i log 2 darg t; point product of log 2,log 3=0 | retained | none |
| Product Leibniz and symmetry (:460) | x=abs(z)²,y=1 in weight 1 | product −bar(z)dz+z dbar(z); d_D product=−2dz∧dbar(z); swapped product is negative | retained | none |
| Conditional unit (:461) | tℝ[t]; ℝ[t] | coefficient of t in e t is 0 for every e∈tℝ[t], versus 1 in t; 1·t=t in ℝ[t] | retained | none |
| Nonclosed critical formula (:462) | x=abs(z)²,y=1 | four-term value −bar(z)dz+z dbar(z), nonzero without closedness | retained | none |
| Associator homotopy (:475) | even critical Re z,2,3; odd point triple | bracketings 6 Re z,6 Re z and h=0; odd point bracketings both 0 | retained | none |
| Associativity without a unit (:475) | tℝ[t],three copies of t | both bracketings t³; no multiplicative identity in that algebra | retained | none |
| Product/refinement compatibility (:475) | two torus loops and their exchange | period (2πi)² before/after refinement; exchange −(2πi)² in both | retained | none |
| Logarithmic support-fiber definition (:499) | Z=∅,Z=X | identity fiber acyclic; full support equals D_log(X,p) | retained | none |
| Support differential and cone identification (:501) | pair (ω,g); 0→ℝ[0] | second coordinate of d²=res dω−d resω+d²g=0; first nonzero fiber degree=1 | retained | none |
| Support enlargement (:505) | {0}⊂{0,1} | r↦(r,0), not a projection ℝ²→ℝ | retained | none |
| Raw connecting map (:506) | log abs(t) | pair (0,log abs(t)) has divisor coordinate −1 | retained | none |
| Support product (:507) | disjoint V(x),V(x−1); crossing V(x),V(y) | disjoint product 0; transverse intersection coefficient +1 | retained | none |
| Pair cocycle criterion (:508) | (0,−log abs(t)) on punctured line; zero pair | d_D(−log abs(t))=0 on open, hence pair closed; zero pair differential=0 | retained | none |
| Singular-support semipurity (:521,:527) | axes; cusp; origin at weights 1,2 | top ranks 2,1; origin H²(weight1)=0,H⁴(weight2)=ℝ; lower groups 0 | retained | none |
| Codimension hypothesis (:521) | point,p=1,Z=X | actual H¹=ℝ≠0 while 1<2; codimension 0<1 excludes example | retained | none |
| Supported coordinate isomorphism (:528) | axes cycle; doubled divisor; zero cycle | coordinates (1,1),2,0; reverse implication: all zero coordinates gives zero cycle class | retained | none |
| Normalized current criterion, both directions (:521,:529) | f=t,d=p=1 | form factor (2πi)⁻¹, point factor 1; d_D[−log abs(t)]=−δ₀ gives class +1; opposite log gives −1 | retained | none |
| Supported product multiplicity (:536) | crossing lines; doubled first line | local intersection lengths 1,2 equal supported coefficients 1,2 | retained | none |
| Auxiliary support indexing (:543) | point,p=1,n=0; union of two point supports on a curve | only empty support in first case; common support union has two components | retained | none |
| Auxiliary total grading/differential (:543) | (r,n)=(2p,1),(2p−1,1) | degrees 2p−1,2p−2; cube signs +1,−1 | retained | none |
| Good truncation (:543) | ω at :559 | d_Dω evaluated on stated triple=−2i≠0; ω excluded from good top term | retained | none |
| Auxiliary orientation transport (:545) | n=0,1,2 | J=1,−1,1; J₀∂=∂=δJ₁ | retained | none |
| Cycle fundamental-class map (:549) | origin; doubled origin | normalized cycle coefficients 1,2 map to supported coordinates 1,2 | retained | none |
| Projection to top supported cohomology (:550) | point,p=0 | ℝ in degree 0 maps identically to ℝ; positive normalized cube terms 0 | retained | none |
| Forget-support and constant-cube maps (:551) | full support,p=0,point | scalar 1 maps to scalar 1 through both maps | retained | none |
| Colimit equality/empty support (:552) | point,p=1,n=0 | nonzero cochains ℝ→ℝ by 1 in degrees 1,2; H¹=H²=0 | retained; does not assert termwise zero | none |
| Cycle-class isomorphism (:566) | origin cycle and doubled origin | class coordinates 1 and 2 on both sides | retained | none |
| Supported projection quasi-isomorphism (:566) | preceding contractible point column | H¹=0,H²=0; target top supported group=0 | retained | none |
| Affine contraction (:566) | point→𝔸¹,p=1,0 | H_D¹=ℝ→ℝ by 1; H_D⁰=ℝ→ℝ by 1 | retained | none |
| Totalized external-product sign (:568) | n=s=1; n=0 or s=2 | factors −1,+1,+1 | retained | none |
| Universal regulator roof (:590) | point,p=n=0; zero cycle | integer m maps to m∈ℝ; zero maps to 0 | retained | none |
| Support-lift independence (:596) | supported representatives differing by exact pair | cohomological difference=0; point rank m retains value m | retained | none |
| Integral source/torsion (:597) | units −1,i | both regulators log abs=0 | retained | none |
| Degree-zero Chern normalization (:598) | O(1),O(−1) on ℙ¹ | normalized integrals +1,−1; raw periods +2πi,−2πi | retained | none |
| Coherent supported regulator (:610) | empty/full support; identity restriction | map on empty-support cohomology 0; full-support absolute map; identity homotopy 0 | retained | none |
| Fiber-map homotopy sign (:612,:616) | two-term integral example at :621 | correct image (1,1) has D′=(0,0); wrong image (1,−1) has D′=(0,2) | retained | none |
| Supported regulator boundary (:622) | open unit t | regulator log abs(t); raw supported coefficient −1; negative-log representative +1 | retained | none |
| General smooth pullback (:628) | point→ℙ¹ | c₁O(1) pulls to 0; H_D²(point,ℝ(1))=0 | retained | none |
| Compatible embeddings (:628) | unit 2 via ℚ→ℝ→ℂ or ℚ→ℂ | both values log 2 | retained | none |
| Cycle-model independence (:628) | degree-zero point; cube degrees 1,2 | both axes send 1↦1; BF transport −1,+1 on source and targets together | retained | none |
| Independent universal Deligne character (:652) | u=2e^(iθ); u=i | logarithm real parts log 2,0; branch addition 2πi changes quotient by 0 | retained | none |
| Character product/naturality (:658) | ranks 2,3; trivial line | rank character 6=2·3; identity image 1 | retained | none |
| Geometric Chern agreement (:659) | O(a) on ℙ¹,a=−1,0,1 | characters 1−h_D,1,1+h_D with normalized divisor integrals −1,0,1 | retained | none |
| Marked point quotient (:667) | z=3+4i,p=1,2,3 | projection 3,4i,3; adding i^p times a real scalar changes each by 0 | retained; H03 confirmed outside target | none |
| Quotient wrong-parity control (:667) | z=i^p,p=1,2,3 | wrong projection returns i,−1,−i instead of 0 | retained | none |
| Abelian Moore input (:669) | constant ℤ; constant S₃ | ℤ: π₀=H₀=ℤ, positive groups 0; S₃: π₀=S₃ nonabelian | retained; nonabelian case excluded | none |
| Beilinson identification (:675) | rank 2; projective point; unit 2; unit −1 | both maps give 2,h_D,log 2,0 respectively | retained | none |
| Supported Beilinson identification (:675) | empty/full support; origin localization | empty maps 0; full maps absolute; raw boundary coefficient −1 on both cycle/Deligne sides | retained | none |
| Integral-source multiplicativity (:689) | units 2,t on 𝔾_m | product i log 2 darg t; exchanged product negative; periods ±2πi log 2 | retained | none |
| Multiplicative zero/unit tests (:689) | weight-zero 1; empty factor; point units 2,3 | 1 preserves value; empty product=0; point product=0 in degree 2 | retained | none |
| Projective product (:689) | two ruling divisors of ℙ¹×ℙ¹ | intersection coefficient 1; doubled ruling coefficient 2 | retained | none |
| Unit logarithm and additivity (:703) | u,v=2,3; 1,i,1/2 | log 6=log 2+log 3; other values 0,0,−log 2 | retained | none |
| Two-unit representative (:703) | f=2,g=t | representative i log 2 darg t with circle integral 2πi log 2 | retained | none |
| Principal-divisor versus unit sign (:703) | t^a,a=−1,0,1 | Green values −a log abs(t), divisor coefficients a; punctured unit values +a log abs(t) | retained | none |
| Projective acceptance witness (:703) | O(a),a=−1,0,1 | normalized Chern integrals −1,0,1 | retained | none |
| Coleman adapter preservation (:727) | one- and two-loop rank/symbol witnesses | face differences +1,−1,0; double-loop exchange −1 | target retained; H01–H02 confirmed outside target | none |
| Coleman generalized-weight contract (:727) | Jordan matrix above; full product cube unit | arbitrary filtered model dimensions 1 versus 2; full-cube unit weight eigenvalue 2 | target retained; H04 confirmed outside target | none |
| Coleman marked complex regulator (:729) | p=2,3,z=3+4i | π₁(z)=4i,π₂(z)=3; Tate-axis shifts give 0 change | target retained; H03 confirmed outside target | none |
| Borel cone-coordinate contract (:731) | opposite arrow, point representative z | representative changes z↦−z, transported quotient sign changes back, coordinate unchanged | retained | none |

## Build and gate results

No target files changed, so no repair commit was created; nothing was pushed. The four sibling findings remain open despite the successful validation below.

`lake build TauCetiRoadmap.MotivicEtaleKTheory.Suggested` exited 0:

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (2.1s)
Build completed successfully (8976 jobs).
```

The required full gate exited 0; its exact summary line was:

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The required dependency-direction check with `--movable` exited 0 and printed exactly:

```text
depcheck: 51 roadmaps, 582 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line.
