# MotivicEtaleKTheory design repair

## F01 (P2) — applied

Field-only full cubes → supported cubes on open Y⊂X×□ⁿ for regular Noetherian separated finite-dimensional X with an ample family. Only the cycle-map clause retains field hypotheses. README conventions, §2.0a, its plan hypotheses/API/Checks, Scope and consumer contracts agree. ColemanIntegration §L3.Fa.2 consumes this construction; L3.Fa.1 retains its ordinary Quillen package.

Evidence: SchemeKTheoryOperations §§2.5, 6.7–6.9 give the regular-base vertices and operations; ColemanIntegration §§L3.Fa.1–L3.Fa.2 use precisely this domain. Levine94 line 407 defines iterated fibers; Levine94 line 655 defines their supported version. The finite-filtration argument at Levine94 line 719–736 applies to the supplied regular-base vertex weights without extending the field-only cycle theorem. The delooping API now explicitly requires the full cube Y=X×□ⁿ; at n=0 an arbitrary open gives K^S(Y), not K^S(X). The new DVR/open-cube Check includes p=2,3.

## F02 (P3) — applied

An unqualified generalized weight decomposition → a decomposition on Kₘ^S(Y;∂□ⁿ)⊗ℚ, in both README and plan. Added the projective-plane index-two negative control to §2.0a. The existing rational projector API and §2.2 rational absolute comparison retain their coefficients.

Evidence: Levine94 line 706–718 uses rational groups. For h=1−[O(−1)] on ℙ², ψ²(2h+h²)=2(2h+h²), ψ²h²=4h², and the three integral weight generators have determinant 2 in the basis 1,h,h². Rationally h=(2h+h²)/2−h²/2.

## F03 (P3) — applied

§2.1's premature universal-class identification → only the inverse-cycle construction. Deleted its duplicate API bullet and the plan label TauCeti.MotivicRealization.higherChernUniversalClass. The identification remains solely in §2.2, including its existing levineUniversalChernAgreement plan API. All four §2.1 Checks remain unchanged and were recomputed.

Evidence: Levine94 line 1210–1217 gives the cycle-to-K comparison; BF line 961–997 describes the separate universal-class construction. Its identification in §2.2 still explicitly cites uncertified Bloch86 §7. No new assertion about that unread source was introduced.

## F04 (P3) — applied

Degree-zero/one identification Checks → an additional degree-two Check in §2.2 and its plan tests. Both characters send {2}·{t} on 𝔾_{m,ℚ} to the ordered graph product, with regulator i log 2 darg t and nonzero positive-circle period 2πi log 2. No Lean declaration was added.

Evidence: §2.4 supplies character multiplicativity; BF Proposition 5.13/Corollary 5.14, BF line 1619–1632, supplies the product-cycle realization. Substitution in the four-term formula at BKK line 4176–4180 gives (log 2)(dt/t−dt̄/t̄)/2. Reversing the two odd factors negates this form. The nonzero imaginary period also survives quotienting by the real periods of ℝ(2).

## F05 (P3) — applied

Incomplete Dependencies paragraphs → the suppliers explicitly used by Layers 2, 5 and 7. Layer 2 also includes the previously omitted SchemeKTheoryOperations §4.3 and §6.7. No new prerequisite was invented: these were already in the corresponding Needs lines and plan prerequisite lists.

Verified locators: MotivesAndAlgebraicCycles §4.8a; SchemeAndStackFoundations §§5.3–5.8; EnhancedDerivedSheaves §§0.1–0.4, E0.6, E2.6; KTheoryFiniteLocalFields §6.10; ComplexKahlerGeometry K1–K2; AlgebraicTopology Stages 2–3, Stage 6 items 1–4, Stage 8 item 2. The last supplies simplicial-group Kan and the abelian Moore/homotopy comparison, rather than an assertion for nonabelian simplicial groups.

## F06 (P3) — applied

The fixed-compactification F-filtered comparison → the (W,F)-bifiltered comparison in README §3.2 and its plan statement. The torus Check now specifies dz/z∈W₁∖W₀ on both complexes. Refinement remains only F-filtered; the boundary-blowup negative control is unchanged.

Evidence: Burgos94 Theorem 2.1, Burgos94 line 181–192, is bifiltered. DeligneHodgeII Theorem 3.2.5, DeligneHodgeII line 1142–1148, gives the cohomological shift. Thus logarithmic index 1 plus cohomological degree 1 gives weight 2 on H¹(𝔾_m), without claiming invariance of residue complexes under blowups.

## F07 (P3) — applied

Ownership-change narrative → timeless owner/import statements for Aₚ, Aₚ,S, Hₚ and the Green-current criterion/pairing. Deleted the sentence about the present status of PeriodsAndSpecialValues' construction. Repaired both README occurrences and the corresponding plan consumer descriptions; the mathematical allocation is unchanged.

The shared auxiliary support complexes are §5.3, and the criterion/pairing is §5.2; Polylogarithms §5.2 retains its additional shifted comparison complex and current adapters. ColemanIntegration's consumer wording was also synchronized under F01.

## Verification and gates

The requested dependency command exited 0, with this complete output:

```text
candidate: MotivicEtaleKTheory is not in the merge order yet; checked as if placed after MotivesAndAlgebraicCycles (the intake inserts it when its design is accepted)
depcheck: 28 roadmaps, 244 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No gate failures were supplied in the brief.

Additional checks:

- JSON parsing passed. Revised §2.0a, §2.1, §2.2 and §3.2 statements and every Check agree between README and plan; revised §2.0a and §2.1 API entries also agree. The unchanged §2.2 API is a prose restatement, not a verbatim duplicate.
- Across all seven layers, every roadmap named in a Needs line is named in its Dependencies paragraph. The Layer 2 additions cover all the reviewed sections, including E0.6/E2.6 and §6.10.
- Searches across the whole package's design found no remaining premature universal-class bullet, removed API label, field-only cube hypothesis, ownership-move wording or claim that §2.0a supplies L3.Fa.1. §2.2's genuine absolute eigenweight claim explicitly retains §2.1's field-base scope.
- Citation resolution against main dfdf9a3 and the index of 331 open heads reports no unresolved cross-roadmap citations and no unresolved Lean names. That tool expressly excludes native library names; those were checked separately at the actual pins.
- Mathlib HEAD equals 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti HEAD equals a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the content manifest. Object searches of both pinned trees found no higher-Chow, multi-relative Adams or logarithmic Deligne carriers under the corresponding object terms. Native AlgebraicCycle is locally finite coefficient data without a dimension condition (Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44); its weighted map is at :69. Native Dold–Kan is an equivalence of abelian simplicial objects and chain complexes (Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167), without the topological homotopy comparison imported from AlgebraicTopology.
- The cited mapping-cone definition and summand differentials resolve at Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57, :261, :269. The cited Tau Ceti graded-complex, pure/mixed-Hodge and strictness declarations resolve at the files/lines in the supplier contract. In particular Geometry/Hodge/Tate/Basic.lean:91, :100, :111 uses type (−p,−p) with its unscaled lattice; the geometric 2πi factor remains explicit.
- No Suggested.lean exists in this design package or its design folder. Consequently there are no local Lean declarations whose elaborated binders could be compared with #check @name, and no authorized Lean elaboration command or editable Lean file was supplied. No Lean command ran, and no elaboration success is claimed. Headline statability and the eventual acceptance file remain design-to-package work.
- Existing cached legal source entries suffice. sources.toml is unchanged; Bloch86/Beilinson85 remain uncertified and Levine98 remains waived. No source was requested again and no source text was copied into the package.
- git diff --check passed. Only the two permitted design files and this report changed; no commit was made.

## Ownership and citation audit

Read the main-branch AlgebraicTopology and ComplexKahlerGeometry roadmaps for their format and their actual supplied objects. Checked the named supplier headings at their available main copies or indexed open heads, including GeneralAlgebraicKTheory, SchemeKTheoryOperations, KTheoryFiniteLocalFields, MotivesAndAlgebraicCycles, SchemeAndStackFoundations, ResolutionOfSingularitiesCharacteristicZero, EtaleCohomologyFoundations, ComplexComparisonPartII, EnhancedDerivedSheaves, DifferentialGeometry, ComplexKahlerGeometry and AlgebraicTopology. The newly mentioned sections are actual supplier targets, not inferred names. In particular SchemeKTheoryOperations §§6.7–6.9 expressly have the regular finite-dimensional Noetherian ample-family domain.

Searched objects, rather than just proposed names, in main, indexed open heads with roadmaps grep, and board packages: supported multi-relative cubes, universal higher Chern classes, smooth logarithmic Dolbeault/Deligne complexes, flat ideals and Whitney/Borel extension. ColemanIntegration §L3.Fa.2 and Polylogarithms §5.2 are the overlapping consumer constructions. This package owns their shared foundational objects because it supplies the general cycle/Deligne realization in the earlier direction; their arithmetic symbols, exact-cube comparisons, explicit regulator forms and concrete current adapters retain their existing owners. KTheoryFiniteLocalFields §6.10 owns the field-diagonal Chern map, and the existing agreement clause remains here. No external declaration's fully qualified name was introduced here. The generic differential extension inputs remain the two existing DifferentialGeometry supplier gaps; this repair neither duplicates nor closes them.

Open-work ownership was checked through the supplied indexed heads and available sibling packages, including Polylogarithms. No additional remote pull requests were sought. The index now uses main dfdf9a3; the review's a4a8652 is not this round's main. ColemanIntegration and SchemeKTheoryOperations are readable at their indexed heads. Some unchanged downstream labels cannot be independently re-certified from the available copies: PeriodsAndSpecialValues PS.3.2a and KatoEulerSystems §12.1 have no roadmap file on this main or indexed open heads, and their board folders contain only sources/reports. BorelRegulators likewise has a target description rather than a readable roadmap. The citation resolver's empty result does not certify those unavailable consumer sections. They are downstream descriptions, not proof inputs; no supplier gap or new dependency was fabricated for them. ZagierConjecturePolylogarithms' M.8 requests and MixedHodgeModulesAndIrregularHodgeTheory's N/logarithmic-filtration target are readable in their board designs.

Maintainer consequences: ColemanIntegration §L3.Fa.2 should consume §2.0a's now sufficiently general construction; L3.Fa.1's Quillen and exact-cube package remains separate. Its existing file still describes a local cube construction, and SchemeKTheoryOperations' downstream prose still attributes multi-relative refinements there: adopting the shared import requires edits outside this package. The same external synchronization applies to Polylogarithms §5.2's auxiliary complexes. No supplier direction was reversed and no existing target section was renumbered. The only deleted plan API label is TauCeti.MotivicRealization.higherChernUniversalClass; its theorem is already represented by §2.2's levineUniversalChernAgreement. A fixed-name search found no reference to the deleted label on main or indexed open heads. No declared Lean name changed.

## Adversarial mathematics pass

The following are explicit computations, not evidence from a sorry build. “Retained” means that the stated values agree and no repair was necessary. API numbers follow each section's prose bullet order. The table covers every target, every API statement, the standing mathematical conventions and the supplier-gap definitions; additional rows isolate the changed construction's new witnesses and proof input.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Universe and geometric scope | ∅; Spec k⊔ℙ¹; Spec ℤ₂ | Empty component set gives 0; dimensions 0,1 give CH¹=0⊕ℤ; ℤ₂ is regular of dimension 1 but not a field-base variety | Domains distinguish the examples | Explicit §2.0a exception |
| Dimension grading and integer degrees | d=0,p=1,a=3 | 2p−a=−1 gives cycle term 0; CH¹(point,0)=0 on both conventions | No natural subtraction | Retained |
| Derived coefficients | ℤ/2, R=0 | ℤ/2⊗ᴸℤ/2 has groups ℤ/2 in degrees −1,0; ordinary tensor gives only degree 0; R=0 gives 0 | Derived convention discriminates | Retained |
| Cube/simplex orientation | n=0,1,2; mixed (1,1) | J=1,−1,1; ∂Γ_t=[0], δΓ_t=−[0]; mixed cross coefficients −1,+1 sum to 0 | Signs agree | Retained |
| Shift and pair fiber | 0→ℝ[0]; Γ_t lift | Fiber has H¹=ℝ, H⁻¹=0; d(Γ_t,0)=([0],t), so raw [t]=−[0], adapted boundary=+[0] | Shift and adapter distinct | Retained |
| Tate, exponential and critical differential | p=−1,0,1; u=2,i; x=z z̄ | (2πi)^p is nonzero; log absolute values log 2,0; −2∂∂̄x=−2dz∧dz̄ | No zero denominator or omitted twist | Retained |
| Residues and product normalization | Two circles; O(1); units 2,t | Ordered residues +1, exchanged −1; normalized Chern integral 1; odd product period 2πi log 2, exchanged negative | Orientation fixed | Retained |
| Whitney-jet gap | A={0}, A=∅, A=U | Coefficients 1,1,2 give derivatives 1,1,4; coefficients n! give (n!)² with radius 0; empty imposes 0 conditions; full set gives original function | Existence does not imply uniqueness | Existing gap retained |
| Relative Borel gap | x=0, ∂ₓᵐf=(m!)²sin y | m=2,y=π/2 gives 4; zero and exp(−1/x²) both have zero jets at 0 | Parameter dependence retained | Existing gap retained |
| Flat-ideal gap | A=∅; A=B; analytic coordinate axes | I∞(∅)=C∞; I∞(A)+I∞(A)=I∞(A); for axes a flat function at the origin splits into functions flat on each axis | Analytic-pair domain matches source | Existing gap retained |
| §1.1 cubical definition | Point p=0,n=0,1; Γ_t; double point | Normalized groups ℤ,0, versus raw ℤ,ℤ; boundary [0]; double cycle coefficient 2 | Degeneracy quotient and multiplicities fixed | Retained |
| §1.1 API 1 normalization | Point p=0,n=1 | Kernel of infinity face is 0; degeneracy quotient ℤ/ℤ=0; degree-zero map is 1↦1 | Both models agree | Retained |
| §1.1 API 2 geometric maps | ℙ¹→point; purely inseparable degree 2 | Dimension-dropping pushforward 0; transfer after pullback on CH⁰ is 2, not 1; codimension shift 0+0−1=−1 has zero target | Dimensions and multiplicities retained | Retained |
| §1.1 API 3 J | n=m=1; n=0 | J₂=1=J₁J₁; J₀=1; applying J twice gives 1 | Involution and product transport | Retained |
| §1.1 API 4 native coefficients | One reduced point and twice that point | Native coefficients 1 and 2 differ; projector at n=0 fixes both; degeneracy in n=1 projects to 0 | No collapse of multiplicity | Retained |
| §1.2 mixed definition | (1,1), total N=0,2 | Cross terms −1+1=0; summand counts 1 and 3 | Direct-sum total is finite on a diagonal | Retained |
| §1.2 API 1 axes | n=m=0, cycle m[point] | Both inclusions give m[point], hence coefficient m on either axis | Same augmentation | Retained |
| §1.2 API 2 total maps | Three components in total degree 2 | Components (a,b,c) give image f₂₀(a)+f₁₁(b)+f₀₂(c); all three zero gives 0 | Universal sum determines map | Retained |
| §1.2 API 3 orientation transport | (1,0),(0,1),(1,1) | Correct signs −1,+1,−1; proposed (−1)ⁿ⁺ᵐ would give −1,−1,+1 | Simplex axis must stay fixed | Retained |
| §1.3 integral comparison | Point p=0; empty/full support; R=0 | H₀=ℤ→ℤ is 1; Hₙ=0 for n>0; support fibers 0,C; zero coefficients give 0→0 | Integral and degenerate cases agree | Retained |
| §1.4 shared operations | 𝔽₂(t)/𝔽₂(t²); two odd factors | Composite on ℤ is ×2; odd exchange −1, even exchange +1; square-zero thickening preserves generator coefficient 1 | No characteristic-zero shortcut | Retained |
| §2.0a supported cube definition | n=0 open Y; n=1 over ℤ₂,ℤ₃; S=∅ | n=0 gives K^S(Y); full one-cube gives π₀=K₁(ℤ_p)=ℤ_p×; empty support gives 0 at every vertex | General base and open allowed | Repaired scope |
| §2.0a finite-filtration route | Extension with ψ matrix ((2,1),(0,2)) | (ψ−2)(e₂)=e₁≠0, (ψ−2)²=0; both graded quotients have eigenvalue 2 | Generalized weights necessary for extensions | Added explicit route and locator |
| §2.0a API 1 n=0/supports | Y=X; arbitrary open; S=∅ | K^S(Y)=K^S(X) only for Y=X; zero support is 0; support-forgetting zero class maps to 0 | Open ambient retained | Corrected ambient |
| §2.0a API 2 diagrams/weights | Rank 2 and unit 2; identity restriction | ψ²(rank 2)=2=1·2; ψ²[2]=2[2]; both compositions with identity give these values | Vertex actions and functorial maps agree | Rational coefficients explicit |
| §2.0a API 3 ordered delooping | n=0,1,2 full cubes | Ω⁰K=K; difference (1,0)↦1,(0,1)↦−1,(1,1)↦0; two loops give Ω²K and exchange −1 | Full-cube hypothesis needed | Added Y=X×□ⁿ |
| §2.0a localized open Check | ℤ₃, remove t=2 | 2≠0 and 1−2=−1 is a unit; face restrictions of O_Y have ranks (1,1) | Both induced faces survive | Added Check |
| §2.0a rational-weight Check | K₀(ℙ²), h³=0 | ψ²h=2h−h²; ψ²h²=4h²; weight generators have determinant 2; h=(2h+h²)/2−h²/2 over ℚ | Integral direct sum fails | Added negative control |
| §2.0b universal Chern construction | Zero class; unit 2; O(1) on ℙ² | c₀,₀(0)=1 but ch(0)=0; c₁,₁(2)=[2], v₂=1; c₂(O(1))=0 but ch₂=h²/2 | Chern classes distinguished from character | Retained |
| §2.0b API 1 stabilization/Whitney | O(1)⊕O(−1) | (1+h)(1−h)=1−h²; c₁=0,c₂=−h², unchanged after adding a trivial line | Stabilization preserves operations | Retained |
| §2.0b API 2 diagonal map | n=1,2,3 | (−1)ⁿ⁻¹(n−1)!=1,−1,2 | Matches supplied field diagonal | Retained |
| §2.0b API 3 Newton character | p=1,2,3 on positive-degree diagonal | Coefficients 1,−1,1/2 multiplied by diagonal factors 1,−1,2 give 1,1,1 | Factorials nonzero only divided in ℚ | Retained |
| §2.1 inverse-cycle character | Rank 2; O(±1) on ℙ¹; ∅; unit 2 | ch₀=2; exp(h)+exp(−h)=2 since h²=0; c_total=1; empty groups 0; v₂(ch₁,₁(2))=1 | Four Checks survive deleted identification | Duplicate assertion deleted |
| §2.1 API 1 components | Spec k⊔Spec k, ranks (2,1) | p=0 projection is (2,1), not 3; all p>0 components of these ranks are 0 | Componentwise naturality | Retained |
| §2.2 weights/isomorphism | Weights 0,1,2; unit u; O(1) on ℙ² | ψ² eigenvalues 1,2,4; differences −1,−3,−2; ψᵃ[u]=a[u]; ch₂=h²/2 | Projectors rational and denominators nonzero | Retained |
| §2.2 API 1 universal identification | [O_point] on ℙ¹; 2 on Spec ℚ; {2}·{t} | Both maps give h,[2],[Γ₂]×[Γ_t]; valuations 1 in degree 1; degree-2 regulator period 2πi log 2 versus −2πi log 2 under reversed order | Degree 2 distinguishes delooping sign | Added Check |
| §2.3 supported character | Z=∅,X; (𝔸¹,{0}); crossing xy=0 | Fibers 0,absolute; d(Γ_t,0)=([0],t); B[t]=+[O₀], raw class −[0]; crossing multiplicities (1,1) | No singular K(Z) substitution | Retained |
| §2.3 API 1 pair maps | {0}⊂{0,1}⊂𝔸¹ | Coordinate 1 maps to (1,0); identity preserves 1; composite through same inclusion still (1,0) | Direction of support map fixed | Retained |
| §2.3 API 2 boundary dictionary | Uniformizer t in degree 1; degree 2 | Right-linear B(t)=1; raw δ(t)=−1; adapter gives −(−1)=1; left-linear factor (−1)ⁿ⁻¹=1,−1 | Distinct boundaries remain marked | Retained |
| §2.4 products/degree zero | Rank 2×3; O_point; p=1,2,3 | Rank 6=2·3; ch(1−O(−1))=h; higher coefficients 1,−1,1/2 | Multiplicative normalization | Retained |
| §3.1 log algebra | Punctured disk; empty D; ∅ | d log|z|²=dz/z+dz̄/z̄; period 2πi; D=∅ gives smooth forms; ∅ gives 0; |z|⁻² is excluded | Image algebra determined | Retained |
| §3.1 API 1 Dolbeault operators | f=z z̄ | ∂∂̄f=dz∧dz̄; ∂̄∂f=−dz∧dz̄; sum 0; ∂²f=∂̄²f=0 | Anticommutation sign | Retained |
| §3.1 API 2 pullback | z=w² on punctured disks | Pullback dz/z=2dw/w, log|z|²=2log|w|²; derivative gives 2(dw/w+dw̄/w̄) on either route | Preserves log algebra and d | Retained |
| §3.1 API 3 injection | log|z|² and 0 at z=2; D=∅ | Values log 4 and 0 differ; equality in the subalgebra is inherited; empty boundary gives all smooth forms | Wrong zero quotient excluded | Retained |
| §3.2 fixed-pair bifiltered comparison | 𝔾_m⊂ℙ¹; point; boundary blowup of torus | dlog has W-index 1 on both sides, H¹-weight 1+1=2; point weight 0; torus Betti dimensions 1,2,1 before/after, with extra boundary component | Fixed pair is bifiltered; refinement claim stays F-filtered | Strengthened (W,F) |
| §3.2 API 1 flat division | f=e^(−1/|z|²); nonflat f=1 | f/z² has every jet 0 at 0 and value e⁻¹ at 1; 1/z has no finite limit at 0 | Flatness excludes pole | Retained |
| §3.2 API 2 flat log powers | f=e^(−1/|zw|²); all exponents 0 | f log|z|²/(zw̄) at (−2,1) is −e⁻¹ᐟ⁴log 4/2, with zero axis jets; zero exponents give f; log|z|² alone tends to −∞ | Combined denominator and extension fixed | Retained |
| §3.3 Deligne models | Point p=0,1,−1; A=0 | H⁰=ℝ,H¹=0 for p=0; H⁰=0,H¹=ℝ for p=1; H⁰=ℝ(−1),H¹=0 for p=−1; A=0 gives 0 | Negative twist included | Retained |
| §3.3 API 1 deformation retract | Point p=1 | Projection sends log 2+iθ to log 2; inclusion then projection sends real r to r; complementary imaginary direction contributes cohomology 0 | Retraction normalization | Retained |
| §3.3 API 2 exactness | Split sequence 0→ℂ→ℂ²→ℂ→0 at p=1 | H¹ sequence 0→ℝ→ℝ²→ℝ→0 is inclusion r↦(r,0), projection (r,s)↦s; all other groups 0 | Type-compatible sequence | Retained |
| §3.3 API 3 critical jump | p=1,x=z z̄ | Ordinary degree 0, Deligne degree 1; −2∂∂̄x=−2dz∧dz̄ has ordinary/Deligne degree 2 | Two-form jump and sign | Retained |
| §3.4 compactification-independent realization | Point⊔ℙ¹; torus boundary blowup | H_D⁰(−,ℝ(0))=ℝ²; torus periods (2πi,0),(0,2πi), product (2πi)² in either model | Same geometric comparison | Retained |
| §3.4 API 1 refinement/cocycle | Identity and two identity refinements at point | Maps on H⁰ are 1,1; composite 1·1=1; inverse of 1 is 1 | Comparison marked by identity | Retained |
| §3.4 API 2 pullbacks | t↦t² then t↦t³ | dlog pulls back by 2 then 3, giving 6dlog; composite t↦t⁶ also gives 6dlog | Contravariant composition | Retained |
| §3.4 API 3 descent/empty | Empty X; two opens covering connected ℙ¹ in weight 0 | Empty gives 0; Čech H⁰ kernel of (a,b)↦a−b is diagonal ℝ, agreeing with H⁰(ℙ¹)=ℝ | Gluing, not unmarked isomorphism | Retained |
| §3.4 API 4 colimit/skeleton | Constant point diagram, duplicate index objects | Compatible maps 1↦r induce 1↦r on either colimit; duplicate indices do not give ℝ² | Universal map, not arbitrary sections | Retained |
| §4.1 full product | x=log 2,y=log|t|; point log 2,log 3 | Product (log 2)(dt/t−dt̄/t̄)/2=i log 2 darg t; point product 0 because one-form degree is 0 | Four-term normalization | Retained |
| §4.1 API 1 Leibniz/symmetry | Odd x=log 2,y=log|t|; x=z z̄,y=1 | Exchange gives negative; nonclosed example has d_D(x•1)=−2dz∧dz̄=d_Dx•1 | Correct differential sign | Retained |
| §4.1 API 2 unit/high degrees | Point 1 and log 2; ruling classes | 1•log 2=log 2; h₁•h₂=h₁∧h₂ with normalized integral 1 | Unit not zero map | Retained |
| §4.1 API 3 nonclosed critical product | x=z z̄,y=1 in weight 1 | −∂x+∂̄x=−z̄dz+z dz̄; d_D gives −2dz∧dz̄; formula without closedness still agrees | Critical formula holds on forms | Retained |
| §4.2 associativity/coherence | Constants 2,3,5; Re z,2,3 in weight 0; odd point classes | Both bracketings 30; both functions 6Re z, value 6 at z=1 despite dx≠0; odd products 0 | No closedness needed for even triple | Retained |
| §5.1 support definition | Z=∅,X; 0→ℝ[0] | Fib(id)=0; fib(C→0)=C; fib(0→ℝ[0]) has ℝ in degree 1; d² second coordinate res(dω)−d(res ω−dg)=0 | Fiber shift fixed | Retained |
| §5.1 API 1 enlargement | {0}⊂{0,1} | Class 1↦(1,0), not (1,1); forget-support composites preserve this value | Arrow direction | Retained |
| §5.1 API 2 raw boundary | Open t and log|t| | Raw cycle boundary class −[0]; raw Deligne boundary −cl([0]); adapted boundaries both +1 | Raw maps agree before adapters | Retained |
| §5.1 API 3 products/supports | Disjoint supports; V(x),V(y) in 𝔸² | Disjoint product support ∅ gives 0; coordinate divisors intersect at origin with multiplicity 1; external support is their product | Intersection versus union | Retained |
| §5.1 API 4 pair cocycles | Zero pair; divisor pair (0,−log|t|) | Zero has d=(0,0); on punctured line ∂∂̄log|t|=0, so second differential 0; doubling pair doubles divisor coefficient 1→2 | Pair data determines operation | Retained |
| §5.2 semipurity/criterion | Crossing, cusp, origin; p=0; point p=1 | Degree-2 groups ℝ²,ℝ,0; origin at p=2 gives H⁴=ℝ; p=0 full support gives H⁰=ℝ per component; missing codimension would allow H¹(point,ℝ(1))=ℝ | Singular support and lower bound | Retained |
| §5.2 normalized current pairing | d=p=1, c₁O(1) and one point | Form period 2πi times (2πi)⁻¹ gives 1; point current has factor (2πi)⁰=1; both normalized classes have degree 1 | Form/cycle Tate markings agree | Retained |
| §5.2 API 1 Betti support | Normal complex disk, p=1,2 | Relative cohomology is ℝ in degrees 2,4 respectively, zero below; complex orientations give coefficient +1 | Pure type (p,p) | Retained |
| §5.2 API 2 multiplicity/zero iff | 2V(x), V(x)+V(y), zero cycle | Coordinates 2,(1,1),(0,0); only last is zero, with no cancellation between distinct components | Both directions of zero criterion | Retained |
| §5.2 API 3 divisor sign | f=t,t⁻¹ | −log|t| gives +1; −log|t⁻¹|=+log|t| gives −1; normalized current differential is respectively −δ₀,+δ₀ | Unit and Green signs distinct | Retained |
| §5.3 auxiliary complexes | (r,n)=(2p,1),(2p−1,1); point p=0 | Total degrees 2p−1,2p−2; cube signs +1,−1; point normalized support has ℝ only in degree 0 | Totalization pinned | Retained |
| §5.3 API 1 cycle classes | Origin cycle and twice it | Supported coefficients 1 and 2; face boundary of Γ_t gives +[0] and supported boundary coefficient +1 | Integral multiplicity survives ℝ | Retained |
| §5.3 API 2 top projection | Top cocycle; nonclosed ω=Re(z₁)dz₂∧dz̄₂ | Closed class m[V] projects to m; nonclosed ω has dω(∂ₓ₁,∂ₓ₂,∂ᵧ₂)=−2i≠0 and is excluded by good truncation | No brutal-truncation class | Retained |
| §5.3 API 3 forget support/constants | Empty support; point p=0,n=0 | Empty map sends 0→0; constant inclusion sends real r to r; positive normalized constant cube has value 0 | Specified comparison maps | Retained |
| §5.3 API 4 filtered colimit | Supports {0},{1},{0,1},∅ | Coordinates (1,0),(0,1) sum to (1,1) on union; empty contributes (0,0); unequal coordinates do not become equal on that union | Equality tested on common support | Retained |
| §5.4 support resolution/affine contraction | Point→𝔸¹, p=0,1; total product n=s=1 | H_D⁰=ℝ at p=0 and H_D¹=ℝ at p=1 on both; positive normalized columns 0; product factor −1 versus +1 when n=0 or s=2 | Contraction and Koszul sign | Retained |
| §6.1 universal roof | Integer point cycle m; O(±1); zero cycle | m↦m∈ℝ; Chern integrals ±1; zero maps 0; degree a=2p−n and shift 2p has sign +1 | Roof and integral source fixed | Retained |
| §6.1 API 1 lift/forget support | Point p=0, lift of m | Support projection m, forgotten form m, final class m; adding a boundary changes class by 0 | Roof independent of lift | Retained |
| §6.1 API 2 torsion | Units −1,i and infinite-order 2 | Regulator values 0,0,log 2; rationalization is not replacing the integral source definition | Torsion killed, map nonzero | Retained |
| §6.1 API 3 degree-zero geometry | O(1),O(−1),O on ℙ¹ | Normalized first-Chern integrals 1,−1,0; restrictions agree with these classes | Geometric orientation | Retained |
| §6.2 coherent supported realization | Identity; empty/full support; specified two-term square | Identity h=0; empty 0/full absolute; (1,1) maps under D′ to (0,0), wrong (1,−1) to (0,2) | Homotopy correction plus sign | Retained |
| §6.2 API 1 pair-map formula | f′r−r′f=dh+hd; same two-term square | Correct defect (f′r−r′f−dh−hd)a=0; wrong sign gives 2(dh+hd)a, value 2 for a=1 | Explicit square excludes minus correction | Retained |
| §6.3 pullback/base change/models | point→ℙ¹; ℚ→ℝ→ℂ; cube n=1,2 | Chern class pulls to 0 in both theories; unit 2 gives log 2 by either embedding; J values −1,+1 on both source and target | No raw inadmissible pullback | Retained |
| §7.1 independent Deligne character | u=2eⁱθ,i; O(a); S₃ constant simplicial group | Real logarithms log 2,0; character 1+a h_D; abelian constant ℤ has π₀=H₀=ℤ and πₙ=Hₙ=0 for n>0; S₃ has nonabelian π₀=S₃ | Abelian Moore comparison has correct domain | Retained |
| §7.1 API 1 additivity/products/base change | Units 2,3; ranks 2,3 | Unit sum/product in K₁ maps to log 6=log 2+log 3; degree-zero rank product maps to 6=2·3; embedding preserves log 2 | Universal character normalization | Retained |
| §7.1 API 2 geometric/exponential classes | O(1); branches log 2+2πik; quotient parity | Chern integral 1; every branch projects to log 2; at z=3+4i, p=1,2,3 project to 3,4i,3; adding ℝ(p) projects to 0 | Branch and twist fixed | Retained |
| §7.2 equality of regulators | Rank 2; point sheaf; unit 2,−1; degree-two witness | Values 2,h_D,log 2,0 on both maps; degree-two product period 2πi log 2 on both routes | Comparison tested beyond K₀ | New §2.2 Check supplies degree 2 |
| §7.3 integral-source multiplicativity | Units 2,t; point units 2,3; ruling divisors | Odd product periods ±2πi log 2; point degree-two value 0; ruling product integral 1, doubled divisor gives 2 | No rational-only shortcut | Retained |
| §7.4 logarithm/projective witnesses | 2,3,6,1,i,1/2; tᵃ; a=−1,0,1 | Values log 2,log 3,log 6,0,0,−log 2; divisor multiplicities a and normalized Chern integrals −1,0,1; curve product period 2πi log 2 | Signs and scale all fixed | Retained |

Every changed mathematical statement has a nonempty example and a negative or degenerate control above. The broad regular-base construction uses no finite-coefficient prime restriction; the cycle and universal-class theorems retain all fields, including characteristic 2, and no source's infinite-field moving hypothesis was dropped. Later product/regulator witnesses in §§4.1, 7.3–7.4 and the Conventions recompute the same odd-product sign used by the new §2.2 Check. The unchanged worked examples agree with these values.
