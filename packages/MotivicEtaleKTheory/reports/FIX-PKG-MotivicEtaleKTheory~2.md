# Repair findings for MotivicEtaleKTheory

## F01 (P2) — applied

Unconditional abstract unit → specified real type-(0,0) identity, with identity-preserving maps. Corrected §§4.1–4.2, made the geometric constant explicit in §3.1, and aligned the Lean docstring. Added nonunital multiplication and associativity Checks. BKK Definition 5.13, pp.113–114, BKK line 4121–4128 imposes no identity; Definition 5.14 and Proposition 5.15 retain the general product.

## F02 (P1) — not actionable in this package: companion BorelRegulators edits are outside the permitted files

Verified BorelRegulators e39a3c4 §6.0a constructs the same general theory. Scope and downstream wording now specify the required imports from §§3.3–3.4, 4.1–4.2 and 7.1, without claiming completion. Added the cone-sign Check in §3.3. Consumer calibration and arithmetic targets remain distinct. Only editing BorelRegulators can remove its duplicate construction.

## F03 (P1) — not actionable in this package: companion ColemanIntegration and SchemeKTheoryOperations edits are outside the permitted files

Verified ColemanIntegration ae078af §L3.Fa.2 and SchemeKTheoryOperations 88dbd5a, Scope and Downstream consumers. Scope and downstream wording now require the common §2.0a import. Its supported, common-base and general regular-base statements remain intact. ColemanIntegration must retain localizations, spectral sequence, injectivity and symbols; SchemeKTheoryOperations must correct both downstream ownership sentences. This package cannot make those edits.

## F04 (P1) — not actionable in this package: companion Polylogarithms edits are outside the permitted files

Verified Polylogarithms 4696a1a §5.2 reconstructs the shared auxiliary diagram and abstract supported regulator. Corrected scope, §5.3 and downstream wording to require imports from §§5.1–5.4 and 6.1–6.3. Added the Jₙ chain calculation. Kept the section-label dictionary and the additional D_AH, β and current/cone comparisons. Only a consumer edit can complete this transfer.

## F05 (P3) — applied

Broad criterion citation → immediate normalization locators: BKK equation (5.38), p.122, BKK line 4395–4408, and Definition 5.41, p.123, BKK line 4450–4462. Retained Proposition 5.58 for the iff. Updated §5.2, References and the existing BKK manifest entry; recomputed the d=p=1 Check. Neither formula nor source key changed.

## Check outcomes

- Required elaboration of packages/MotivicEtaleKTheory/Suggested.lean, using `lake env lean` from the content checkout: exit 0, no output. No Tau Ceti module import or targeted build was required.
- Mechanical signature audit: after removing comments, there are zero declarations and therefore zero `#check @name` commands. Elaborated the regenerated signature scratch file once: exit 0, no output. There are no implicit binders to lose or README signatures to reconcile. No Lean name was added, removed or renamed.
- The supplied failed signature artifact appended `#check @lack`. This came from prose containing the adjacent words “structure lack”, not an actual declaration. Reworded that docstring sentence to “data require”; the headline and missing carrier are unchanged. The updated Layer 4 docstring also records that the unit conclusion requires unital input. No placeholder theorem was introduced.
- Required dependency check with `--movable`: exit 0; complete output:

```text
depcheck: 29 roadmaps, 259 edges, 0 problem(s)
```

- Citation resolution: exit 0; no unresolved cross-roadmap citations and no unresolved Lean names. The resolver says it did not inspect pinned Lake packages, so the native declarations were independently inspected at the supplied pins below.
- Final validation: sources.toml and metadata.toml parse successfully; all 10 source keys are unique (7 certified, 1 waived, 2 uncertified). Both plan gaps match exact README contracts, and design/plan.json is unchanged. The README retains 7 layers, each with Examples and Dependencies. The adversarial table contains 122 computed rows. Machine-path and former-unconditional-unit/completed-import wording scans pass. `git diff --check` exits 0 with no output. Only README.md, Suggested.lean, sources.toml and this required report differ; metadata.toml and all other files remain unchanged.

## Evidence and ownership boundaries

The content checkout is main 66576b61d0440aec1f04a10b179f7e7163140b96. The open-roadmap index is dated 2026-10-24T01:48:48Z; `roadmaps list`, `roadmaps show` and object searches resolve the four relevant heads to the commits in the finding sections. Read Regularity and ComplexTori on main for repository shape. The package's layers, target order and scopes were retained.

| Evidence | Exact location and conclusion |
| --- | --- |
| Nonunital Dolbeault input | BKK Definition 5.13, pp.113–114, BKK line 4121–4128 gives an associative graded-commutative type-compatible product without an identity. |
| Product and homotopy | BKK Definition 5.14, p.114, BKK line 4129–4140 and Proposition 5.15, BKK line 4142–4158 apply to that input; the odd-critical formula is BKK line 4176–4180. |
| Geometric identity | The algebra contains smooth coefficients, hence 1, by BKK Definition 5.20, p.116, BKK line 4217–4221; the image-algebra construction is Burgos94 §2, pp.65–67, Burgos94 line 155–190. Pullback of 1 is 1. |
| Form and cycle currents | Equation (5.38), p.122, BKK line 4395–4408 uses test form before the represented form and factor (2πi)⁻ᵈ. Definition 5.41, p.123, BKK line 4450–4462 uses factor (2πi)⁻ᵉ on an e-dimensional cycle. |
| Current criterion | Proposition 5.58, p.133, BKK line 4841–4847 gives both directions with those normalizations. |
| General Deligne overlap | TauCetiRoadmap/BorelRegulators/README.md:13,724,726 at e39a3c4 claims and constructs arbitrary-twist Deligne theory on smooth varieties and universal classifying-space Chern realization. These are not only number-field specializations. |
| Cube overlap | TauCetiRoadmap/ColemanIntegration/README.md:2435,2437–2440,2446 at ae078af constructs the cube carrier and ordered relativity map, with local L3.Fa.1 input. TauCetiRoadmap/SchemeKTheoryOperations/README.md:9,2403 at 88dbd5a assigns multi-relative ownership there. Both ownership sentences need companion correction. |
| Auxiliary overlap | TauCetiRoadmap/Polylogarithms/README.md:826–843 at 4696a1a constructs the abstract supported map, D_A, D_A,Z, Hᵖ and both arrows. The additional shifted D_AH differential and β are different targets. |
| Supply order | SchemeKTheoryOperations is position 40, this package 87, ColemanIntegration 155, BorelRegulators 167 and Polylogarithms 225. This package supplies the shared constructions to those consumers; the earlier supplier's downstream ownership wording does not create an import from its consumers. |

Searched by the objects in the content roadmaps, board packages and indexed open heads, including the sibling set named in the brief. The object search confirms the three shared constructions above; it does not establish that their ownership transfers are complete. No new generic carrier or competing namespace was introduced. The general constructions stay here because the required shared theory precedes its consumers and the package already develops it; consumer-specific calibration and comparisons stay with the consumers.

F02–F04 require external edits, not a missing input supplied to this package. Creating supplier gaps for these consumers would invent reverse prerequisites. Accordingly no gap was added and design/plan.json was not changed. The two existing DifferentialGeometry gaps, smooth-whitney-extension and flat-ideal-regular-situation, still match the README's exact contracts.

## Citation and pinned-library audit

Every supplier section was resolved at main or its indexed new-roadmap head, and the relevant headings and mathematical inputs were inspected:

| Supplier | Resolved contract |
| --- | --- |
| GeneralAlgebraicKTheory | §3.12 plus/Q; §§4.6,4.8,4.14 resolution, dévissage, localization; §6.3 Waldhausen fibration; §§7.4–7.7 pairings/transfers; §§8.12–8.13 valuation and right/left boundary signs. |
| SchemeKTheoryOperations | §§2.1–2.6 perfect K and vector-bundle comparison; §§3.1–3.6 supports/boundaries; §4.3 descent; §6.1 tensor products; §§6.7–6.9 operations and bounded rational weights; §§7.1–7.3 the degree-zero character. |
| KTheoryFiniteLocalFields | §3.0a motivicCycles and motivicToK supply the actual integral simplicial source and operations; §6.10 diagonalChernMilnor has coefficient (−1)ⁿ⁻¹(n−1)!. |
| MotivesAndAlgebraicCycles | §§4.7–4.8 shared cycles; §4.8a relative specialization; §4.14 equidimensional transfers; §§4.17–4.18 categorical comparisons with their hypotheses. |
| SchemeAndStackFoundations | §§2.1–2.2 cohomology; §§4.12,4.17 domination/SNC; §§5.1–5.8 cycles, refined intersection and Chern theory. |
| ResolutionOfSingularitiesCharacteristicZero | §§5.1–5.6 resolution preserving the open and initial boundary; §§6.1–6.4 projective closure, quasi-projective SNC compactification and coordinates. |
| EtaleCohomologyFoundations | §§G.1–G.3 compactifications and coherent common refinements; no étale coefficient theorem imported here. |
| ComplexComparisonPartII | §§C−1.1,C−1.4 analytification/charts; §§C5.1,C5.3–C5.6 geometric de Rham, properPureHodge, relativeHodgeBundles, currents and regularSingularDeRhamComparison; §C6.0 compatible algebraic stratification. |
| EnhancedDerivedSheaves | §§0.1–0.4 enhancements, replacements, tensor and coherent functors; §§E0.6,E1.4,E2.6 nerve, tensor and descent. |
| DifferentialGeometry | Layers 0–1 and 5–9 forms, differential, integration and de Rham inputs. Whitney extension and the flat-ideal sum remain explicit gaps rather than inferred imports. |
| ComplexKahlerGeometry | K1–K2 complex orientation, types and Dolbeault calculus on finite-dimensional Hausdorff second-countable complex manifolds. |
| AlgebraicTopology | Stages 2–3, Stage 6 items 1–4 and Stage 8 item 2: relative theory, products/duality, simplicial-group Kan and abelian Moore comparison. |

The downstream locators Polylogarithms §§5.2,5.3,5.9–5.10,5.13,5.17, ColemanIntegration §§L3.Fa.1–L3.Fa.3,L3.Fc.1 and BorelRegulators §§6.0a–6.2 resolve to the inspected heads. Their existence does not certify the unperformed companion edits. The label dictionary still points Polylogarithms' Layer 4, §9.1 and §12.2 to this package's actual sections.

The existing consumer-only mentions ZagierConjecturePolylogarithms M.8 and MixedHodgeModulesAndIrregularHodgeTheory were also searched in the main checkout, indexed open heads and board packages. Those roadmap folders are absent from these copies; no supplier prerequisite relies on them. Their unchanged prospective consumer labels are outside F01–F05. Completed/HodgeStructures is present and its linear scope agrees with the pinned Hodge structures.

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, as recorded in lake-manifest.json. Inspected Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,55,69: AlgebraicCycle is locally finitely supported point coefficients, and map uses explicit weights, residue degree and quasi-compactness; the carrier contains no face-admissibility condition. Inspected Mathlib/AlgebraicGeometry/Scheme.lean:40, Mathlib/Algebra/Category/ModuleCat/Basic.lean:56, Mathlib/Algebra/Homology/HomologicalComplex.lean:59,72, Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87 and Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167. These supply the ordinary carriers and equivalence claimed by the contracts.

Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,261,269 gives the source-shift-first cone and both differential formulas. TauCeti/Algebra/Homology/GradedCochainComplex.lean:59 supplies the graded-complex construction. TauCeti/Geometry/Hodge/Structure.lean:62, Morphism.lean:69, Tate/Basic.lean:91,100,111 and Mixed/Basic.lean:72, Mixed/Strictness.lean:110 supply the linear Hodge structures, ordinary unscaled lattice, Tate filtration and strictness. Their fields do not contain the geometric logarithmic, support, higher-cycle or scheme K-spectra needed by the headlines. Object searches at both pins found no real Dolbeault/Deligne carrier, face-admissible higher Chow complex or scheme multi-relative K-spectrum that would make an omitted headline statable by a few simple definitions.

All cited works already have one manifest key. The seven certified texts are present in the supplied legal cache. Levine98 is waived; Bloch86 and Beilinson85 are uncertified and remain cited only at their settled locators. The changed mathematics uses BKK and Burgos94, read at the lines above. No new source, duplicate key or missing-text request was needed. No source passage was copied into the package.

## Adversarial mathematics record

Each row tests a statement in its actual mathematical setting. P denotes a point, h the positive Chow generator on projective space. Scalar coordinates in support groups use the specified oriented component bases. The computations test signs, hypotheses and normalization; they are not proofs of the general comparison theorems. API numbers refer to the bullets within the indicated section.

| Statement | Instances tried | Values computed on each side | Result and change |
| --- | --- | --- | --- |
| Convention: components and universe | ∅; P⊔ℙ¹ | 0 components; CH⁰=ℤ² and CH¹=0⊕ℤ | Componentwise statement retained. |
| Convention: integer reindexing | p=0,a=1; p=1,a=1 | 2p−a=−1,1; groups 0,k× | Negative degree stays zero. |
| Convention: derived coefficients | ℤ/2 resolved by ℤ --2→ ℤ; R=0 | Reduced differential 0; H⁻¹=H⁰=ℤ/2; zero coefficients give 0 | No underived replacement. |
| Convention: cube orientation | n=0,1,2; Γ_t | J=1,−1,1; ∂Γ_t=[0], δΓ_t=−[0] | Same transport throughout. |
| Convention: mixed total | (n,m)=(1,1) | Cross coefficients −1,+1; sum 0 in ℤ | Integral cancellation retained. |
| Convention: shifted pair fiber | A=0,B=ℝ[0]; Γ_t lift | Fiber degree 1; d(Γ_t,0)=([0],t), so raw(t)=−[0] | Adapter −raw gives +[0]. |
| Convention: Tate lines | p=−1,0,1,2,3 | Underlying real lines iℝ,ℝ,iℝ,ℝ,iℝ; (2πi)⁻¹=−i/(2π) | Negative powers have nonzero base. |
| Convention: critical differential | x=z z̄; x=1 | ∂∂̄x=dz∧dz̄; d_Dx=−2dz∧dz̄; constant gives 0 | Sign unchanged. |
| Convention: orientation and product | Ordered circles; n=s=1 | ∮dz/z=2πi; ordered two-residue +1, exchanged −1; total product sign −1 | Same witnesses in all layers. |
| Whitney gap: prescribed jet | A={0}, coefficients 1,1,2 and n! | Derivatives 1,1,4 and (n!)²; n! power series radius 0 | Smooth, not analytic extension requested. |
| Whitney gap: parameters | ∂ₓᵐf(0,y)=(m!)² sin y | m=2,y=π/2 gives 4 | Scalar-only Borel theorem insufficient. |
| Whitney gap: empty/full and uniqueness | A=∅; A=U; zero jet at 0 | 0 constraints; extension f; 0 and exp(−1/x²) both have jet 0 but values 0,e⁻¹ at 1 | No uniqueness asserted. |
| Flat-ideal gap | A=B={0}; ∅,U; U,U | I=I+I; C∞=C∞+0; 0=0+0 | All degenerate pairs agree. |
| Flat-ideal gap: wrong intersection | Two coordinate axes; φ(x)+φ(y) | Zero jet at origin, value e⁻¹ at (0,1); intersection ideal would vanish there | Sum distinguished from intersection. |
| §1.1 definition | P,p=0,n=0,1,2 | Raw ℤ,ℤ,ℤ; normalized ℤ,0,0 | Degenerate cubes excluded. |
| §1.1 API 1 | Degree-one constant cube | Infinity face 1↦1; kernel 0; quotient ℤ/ℤ=0 | Normalization agrees. |
| §1.1 API 2 | ℙ¹→P; inseparable degree-two point map | Fundamental one-cycle ↦0; on CH⁰, 1↦2 | Dimension drop and residue degree retained. |
| §1.1 API 3 | Cube degrees 1+1,1+2 | J₂=1=(−1)(−1); J₃=−1=(−1)(1) | Product orientation agrees. |
| §1.1 API 4 | Reduced/double point; p=−1 | Same generator 1, multiplicity 2; negative-codimension group 0 | Multiplicity distinct from support. |
| §1.2 definition | Total degrees 0,2; bidegree (1,1) | 1 and 3 summands; d² cross contribution −T+T=0 | Direct-sum total unchanged. |
| §1.2 API 1 | Point generator on both axes | [P]↦[P] in degree 0, coefficient 1 | Neither axis is zero. |
| §1.2 API 2 | Three degree-two components with values 2,3,5 | Total value 10=2+3+5; all zero components give 0 | Components determine the map. |
| §1.2 API 3 | (1,0),(0,1),(1,1) | Multipliers −1,+1,−1 | Simplex axis stays unchanged. |
| §1.3 absolute comparison | P over 𝔽₂,p=0 | All models H₀=ℤ,Hₙ>₀=0; H₀ map 1↦1 | No characteristic division. |
| §1.3 supported comparison | Z=∅ and Z=X | fib(id)=0 and fib(C→0)=C on both sides | Empty/full fibers agree. |
| §1.3 coefficient extension | ℤ/2⊗ᴸℤ/2; R=0 | Two ℤ/2 groups in degrees −1,0; zero complexes for R=0 | Integral assertion not narrowed. |
| §1.4 maps | 𝔽₂(t)/𝔽₂(t²); P⊔ℙ¹ | res/transfer sends 1↦2; CH⁰=ℤ²,CH¹=0⊕ℤ | Inseparable and disconnected cases retained. |
| §1.4 products/support transport | Degrees (1,1),(0,1); square-zero thickening | Exchange signs −1,+1; unchanged cycle generator ℤ; identity coefficient +1 | No K-theory nil-invariance inferred. |
| §2.0a carrier | n=0, full and empty support | K₀(k)=ℤ,[k²]=2; empty support 0 | Supported carrier retained. |
| §2.0a generalized weights | L=[[2,1],[0,2]] | (L−2I)e₂=e₁≠0, square 0; generalized piece ℚ² versus eigenspace ℚe₁ | Generalized pieces remain for arbitrary opens. |
| §2.0a API 1 | ∅⊂X, n=0 | 0→K₀(X) sends 0↦0; full-support rank-two class ↦2 | Support maps keep their domains. |
| §2.0a API 2: common-base pairing | X=Spec ℤ_(2),ℤ_(3); unit loops | ψ²[u]·ψ²[v]=(2[u])(2[v])=4{u,v}=ψ²{u,v} | Every prime remains included. |
| §2.0a external domain | ℤ[i]⊗ℤℤ[i] at ramified point | v(v+2i)=0; local dimension 1, cotangent dimension 2 over 𝔽₂ | Singular external product excluded; common-base cube regular. |
| §2.0a ordered relativity | One full cube over ℚ or ℤ_p | Difference sends (1,0),(0,1),(1,1) to 1,−1,0; π₀ΩK=K₁ | Same shared object as consumer. |
| §2.0a unit and Adams witness | Relative class of 2 over ℚ | Relativity gives [2]; ψ¹ gives [2],ψ² gives 2[2] | No rescaling in transfer of ownership. |
| §2.0a two-loop order | {u,v} over ℚ(u,v) | Last-slot residues give +1; loop exchange gives −1; ψ² multiplier 4 | Ordered sign retained. |
| §2.0a non-full open | Remove t=2 over ℤ₃ | Trivial line face ranks (1,1), difference 0 | No full-cube equivalence asserted for this open. |
| §2.0a rational decomposition | ℙ²,h³=0 | ψ²h=2h−h²; eigenvectors 2h+h²,h² have determinant 2 in basis h,h² | Only rational direct sum asserted. |
| §2.0b construction | Zero K-class; unit 2 | c₀,₀(0)=1,ch(0)=0; c₁,₁[2]=[2] has valuation 1 | Ordinary Chern not assumed additive. |
| §2.0b API 1 | O(1)⊕O(−1) on ℙ² | Total Chern 1−h²; c₂=−h², while separate c₂ values are 0+0 | Whitney law distinct from additivity. |
| §2.0b API 2 | Milnor degrees 1,2,3 | (−1)ⁿ⁻¹(n−1)!=1,−1,2 | Supplier diagonal normalization agrees. |
| §2.0b API 3 | Same degrees; O(1) on ℙ² | Character factors 1,−1,1/2 yield diagonal 1,1,1; ch₂=h²/2,c₂=0 | Factorials nonzero only rationally inverted. |
| §2.1 construction | P; ℙ¹; ∅; two points | ch(k²)=2; ch O(±1)=1±h; 0; ranks (2,1) | Actual carriers and finite support retained. |
| §2.1 API | O(1)+O(−1); unit 2 | ch=2; ch₁,₁[2] has valuation 1 | Character distinguished from total Chern and zero map. |
| §2.2 isomorphism/Adams | Weights 0,1,2, operation ψ² | Eigenvalues 1,2,4; differences −1,−3,−2; ψ¹ multiplier 1 | Distinct projectors have nonzero denominators. |
| §2.2 inverse/universal identification | [O_point] on ℙ¹; unit 2 | Both leading classes h; both unit values [2] with valuation 1 | Same map, not merely degree-zero agreement. |
| §2.2 degree-two transport | {2,t} at t=0 | Last-slot residue [2], valuation 1; native right boundary −[2], valuation −1 | Degree-two adapter −1 restores +[2]. |
| §2.3 construction | ∅,X,V(xy)⊂𝔸² | 0≃0; absolute comparison; component coordinates (1,1) | Singular support not replaced by K(Z). |
| §2.3 API 1 | {0}⊂{0,1} and identity | 1↦(1,0); identity 1↦1 | Support direction retained. |
| §2.3 API 2 | Γ_t lift in the pair fiber | d(Γ_t,0)=([0],t); raw(t)=−[0], B[t]=+[O₀] | ch B=−δ_raw ch agrees. |
| §2.4 products | Ranks 2,3; ξ=1−O(−1) on ℙ¹ | ch₀ product 6=2·3; ξ²=0,h²=0,so ch(ξ²)=0=ch(ξ)² | Product formula retained. |
| §2.4 degree zero/higher coefficient | O(a),O_point; p=1,2,3,n>0 | ch O(a)=1+ah; ch O_point=h; coefficients 1,−1,1/2 | Existing map compared, not rebuilt. |
| §3.1 definition/chart independence | z↦2z,z↦z² | log\|2z\|²=log\|z\|²+log4; log\|z²\|²=2log\|z\|² | Image algebra admits exactly smooth-coefficient logarithmic generators. |
| §3.1 API 1 | log\|z\|² and \|z\|² | dlog=dz/z+dz̄/z̄; ∂∂̄\|z\|²=dz∧dz̄, reverse=−dz∧dz̄ | Bidegree and anticommutation agree. |
| §3.1 API 2 | Power maps 2 then 3; constant 1 | dlog multiplier 2·3=6, composite multiplier 6; pullback 1=1 | Geometric identity made explicit. |
| §3.1 API 3 | D=∅; W=∅; z=e⁻ᴺ | Smooth forms; 0; log\|z\|²=−2N versus pole \|z\|⁻²=e²ᴺ | Constant unit present, arbitrary poles excluded. |
| §3.1 orientation | Circle and ordered double residue | Period 2πi; residues +1 and −1 on exchange | Complex orientation fixed. |
| §3.2 filtered comparison/weight | P and 𝔾_m | Weight(P)=0; dlog weight=1+1=2,type (1,1) | Shifted cohomological weight retained. |
| §3.2 refinements/degeneration | Boundary blowup of (ℙ¹)² | Betti dimensions (1,2,1) unchanged; boundary components 4→5 | F comparison not unshifted W invariance. |
| §3.2 local division, API 1 | exp(−1/\|z\|²)/z²; 1/z² | First has all jets 0 at 0 and value e⁻¹ at 1; second diverges | Flatness essential. |
| §3.2 logarithms, API 2 | exp(−1/\|zw\|²) log\|z\|²/(z w̄) | All axis jets 0; value at (−2,1) is −e⁻¹ᐟ⁴ log4/2; exponents 0 recover f | Combined estimate retained. |
| §3.3 cone/small definition | P,p=0,1,−1 | (H⁰,H¹)=(ℝ,0),(0,ℝ),(ℝ(−1),0) in both models | All integer twists retained. |
| §3.3 API 1, deformation retract | P,p=1; z=log2+iθ | Projection after inclusion r↦r; other composite z↦log2, difference iθ is boundary | Homotopy not strict equality in both orders. |
| §3.3 shifted comparison/sums | A=ℂ[0]; P⊔P | A[1] in degree −1, no integer r with 2r=−1; H¹=ℝ² | No spurious shifted Dolbeault structure. |
| §3.3 API 2, exactness | Split type-(0,0) sequence ℝ→ℝ²→ℝ | At p=1: a↦(a,0), (a,b)↦b; kernel=image=ℝ×0 | Real/type compatibility respected. |
| §3.3 API 3 | p=1,\|z\|² and 1 | d_D gives −2dz∧dz̄ and 0; ordinary degree jump 0→2 | Critical operator retained. |
| §3.3 opposite cone | d_+=(dr,df,f−r−dω), Tω=−ω | Third coordinates of T d_+ and d_- T both r−f+dω | T is a chain isomorphism. |
| §3.3 opposite point coordinates | z=3+4i,p=1,2,3 | Raw quotients 3,4i,3; T sends them to −3,−4i,−3; transported coordinate restores 3,4i,3 | New Check tracks the minus sign on quotient representatives. |
| §3.4 construction | P; ∅; 𝔾_m² refinement | H⁰(P,ℝ(0))=ℝ; empty 0; periods (2πi,0),(0,2πi) in either model | Canonical maps constrained by periods. |
| §3.4 API 1 | Identity and composed refinements | On P all maps send 1↦1; inverses/composites give 1↦1 | Cocycle law has fixed normalization. |
| §3.4 API 2 | z↦z² then z↦z³ | Pullback dlog multiplier 6=2·3 | Map direction and composition agree. |
| §3.4 API 3 | P⊔ℙ¹; two-open cover | H_D⁰=ℝ²; Čech difference (a,b)↦a−b has kernel diagonal ℝ | Disjoint sums and descent consistent. |
| §3.4 API 4 | One-object identity diagram; skeleton change | Colimit inclusion sends 1↦1; induced comparison also 1↦1 | Zero comparison excluded by universal property. |
| §4.1 abstract definition | tℝ[t],d=0,type (0,0) | D⁰(A,0)=A; t•t=t²≠0 | Nonunital product preserved. |
| §4.1 low/low and mixed formula | log2,log\|t\|; log2 with (1,1)-form α | Product i log2 darg t; mixed below cutoff gives log2·α | Source formulas and nonzero normalization retained. |
| §4.1 API 1, symmetry/Leibniz | Odd logarithms; x=\|z\|²,y=1 at p=q=1 | Swapped product changes sign; d_D(x•y)=−2dz∧dz̄=d_Dx•y | Same identity without closedness. |
| §4.1 API 2, conditional unit | e∈tℝ[t]; ℝ[t] with 1 | Coeff_t(et)=0≠1=coeff_t(t); 1•t=t and d1=2d1 imply d1=0 | Missing hypothesis repaired. |
| §4.1 API 2, maps | Inclusion tℝ[t]→ℝ[t]; geometric pullback | t²↦t²=(image t)²; geometric 1↦1 | Multiplicative maps need not supply a source unit. |
| §4.1 API 3, four-term formula | x=\|z\|²,y=1; point constants | −z̄dz+z dz̄; log2•log3=0 | Ordinary d would give the wrong form. |
| §4.2 associator | Even critical x=Re z,2,3 | Both bracketings 6Re z, value 6 at z=1; h_a=0 although dx≠0 | No closedness added to vanishing. |
| §4.2 nonunital cohomology | t,t,t in tℝ[t] | (t•t)•t=t•(t•t)=t³; no e has et=t | Multiplication general; unit conditional. |
| §4.2 geometric compatibility | Point constants 2,3,5; boundary blowup torus | Bracketings 30; torus period (2πi)² in both choices, exchange negative | Geometric unital conclusion retained. |
| §5.1 definition | ∅,X; fib(0→ℝ[0]) | fib(id)=0; fib(C→0)=C; ℝ in degree 1 | Shift retained. |
| §5.1 API 1 | {0}⊂{0,1}⊂𝔸¹ | r↦(r,0); direct composite has same coordinates | Support enlargement points forward. |
| §5.1 API 2 | Pair differential and raw boundary | Second coordinate of d² is res(dω)−d(resω−dg)=0; b↦(0,b) | Raw connecting sign explicit. |
| §5.1 API 3 | V(x),V(y); V(x),V(x−1) | Intersection products have coefficient 1 at origin and 0 for disjoint support | Support intersection retained. |
| §5.2 semipurity | Crossing divisor, cusp; origin in 𝔸² | H²=ℝ² and ℝ; origin at p=1 gives H²=0,at p=2 H⁴=ℝ | Singular supports included. |
| §5.2 codimension hypothesis | P,p=1,full support; p=0,Z=X | H¹(P,ℝ(1))=ℝ≠0 if codimension omitted; at p=0 H⁰=ℝ | Negative control excludes missing hypothesis. |
| §5.2 API 1 | Oriented normal disks, p=1,2 | Local Betti top ℝ in degree 2,4; lower groups 0 | Pure component type (p,p). |
| §5.2 API 2 | Reduced crossing, double divisor, zero coefficients | Coordinates (1,1),2,0; class zero iff all coordinates 0 | Both directions checked in basis. |
| §5.2 normalized current pairing | d=p=1,point at 0 | [α](η)=(2πi)⁻¹∫ηα; δ₀(η)=η(0) | Exact locators added, factors unchanged. |
| §5.2 API 3 and iff | f=t,t²,constant 1 | d_D[−log\|t\|]=−δ₀; t² gives −2δ₀; 1 gives 0; pair coordinates +1,+2,0 | Replacing −log by +log gives −1,−2,0. |
| §5.3 definition | (r,n)=(2p,1),(2p−1,1) | Total degrees 2p−1,2p−2; cube signs +1,−1 | Grading and differential agree. |
| §5.3 orientation transport | Cube degrees 0,1,2 | J=1,−1,1; J₀∂=∂=(−∂)(−1)=δJ₁ | Added witness identifies shared consumer diagram. |
| §5.3 good truncation | Re(z₁) dz₂∧dz̄₂ on ℂ² | dω=(dz₁+dz̄₁)∧dz₂∧dz̄₂/2 has value −2i on ∂ₓ₁,∂ₓ₂,∂ᵧ₂ | Noncycle excluded from top degree. |
| §5.3 API 1 | Origin cycle and its double | Class coefficients 1 and 2 in the supported line | Zero class map excluded. |
| §5.3 API 2 | Top degree 2p and a lower-degree term | Top closed class maps to [ω]; lower term maps to 0; target degree 2p−n | Projection and shift consistent. |
| §5.3 API 3 | Full/empty support; constant cube at P,p=0 | Full forget-support identity, empty map 0; constant 1↦1 | Shared arrows remain specified. |
| §5.3 API 4 | Supports {0},{1},union | Coordinates (2,0),(0,3) give (2,3) on union; empty contributes (0,0) | Common support, not intersection, detects equality. |
| §5.4 comparisons | Origin on 𝔸¹; p=0,1; normalized point cubes | Class 1↦1; H⁰(p=0)=ℝ,H¹(p=1)=ℝ before/after affine pullback; positive cube cohomology 0 | Three comparison maps keep normalization. |
| §5.4 total products | n=s=1; n=0 or s=2 | Koszul factors −1,+1,+1 | Separate from Jₙ. |
| §6.1 roof construction | P,p=n=0; p=0,n>0 | Every forward/backward comparison acts by 1 on H₀; m↦m; positive source 0 | Roof fixed, not arbitrary realization. |
| §6.1 API 1 | Two lifts differing by dη | Forget-support classes differ by d(forget η); difference in cohomology 0 | Lift independence has value 0. |
| §6.1 API 2 | Torsion units −1,i; zero cycle | log\|−1\|=log\|i\|=0; zero↦0 | Integral source retained. |
| §6.1 API 3 | O(1),O(−1) on ℙ¹ | Normalized integrals 1,−1; raw periods 2πi,−2πi | Geometric unit does not change scale. |
| §6.2 restriction/fiber construction | Z=∅,X; identity restriction | 0 map, absolute regulator; identity h=0 | Coherent fibers agree with absolute case. |
| §6.2 API, homotopy sign | A=A′=ℤ[0],B=0,B′=(ℤ --1→ ℤ),r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong (1,−1) has (0,2) | Plus ha necessary. |
| §6.2 divisor boundary | t on punctured 𝔸¹ | Unit maps to +log\|t\|; raw connecting coefficient −1; Green pair coefficient +1 | Same signs as §§2.3,5.2. |
| §6.3 pullback | Point→ℙ¹, O(1) | Chow and Deligne first classes both pull back to 0 | General derived pullback, not literal cycle inverse image. |
| §6.3 embedding/model transport | Unit 2 via ℚ→ℝ→ℂ and ℚ→ℂ; both axes | Both values log2; point generator 1; J₁=−1,J₂=1 on source and target | Common map retained. |
| §7.1 construction | u=2eⁱθ and i | Re(log u)=log2; added 2πi gives same class; i gives 0 | Exponential normalization independent of branch. |
| §7.1 API 1 | Unit multiplication 2·3; zero class | log6=log2+log3; zero↦0 | Additivity agrees. |
| §7.1 API 2 | O(a),trivial line,∅ | ch=1+ah_D with integral(h_D)=1; trivial line 1; empty 0 | Distinguishes unit from zero character. |
| §7.1 point projection | z=3+4i,p=1,2,3 | πₚ₋₁(z)=3,4i,3; adding ℝ(p) changes result by 0 | Opposite parity would not descend. |
| §7.1 Dold–Kan scope | Constant simplicial ℤ and S₃ | Abelian π₀=H₀=ℤ,positive groups 0; nonabelian π₀=S₃ | Abelian comparison not applied to S₃. |
| §7.2 Beilinson identification | Rank 2; O_point; unit 2; empty/full support | Both composites give 2,h_D,log2,0/absolute map | Same actual K-theory maps. |
| §7.2 weight/boundary signs | p=2; (𝔸¹,{0}) | Higher coefficient −1; raw boundary(log\|t\|)=−cl([0]) | Same dictionary as earlier layers. |
| §7.3 multiplicativity | Units 2,t and swapped order | Representatives ±i log2 darg t; periods ±2πi log2 | Integral-source product preserved. |
| §7.3 unit/zero/projective product | Weight-zero 1; empty factor; two rulings | r(1·α)=r(α); zero product 0; ruling product normalized 1, doubled divisor 2 | Geometric identity used legitimately. |
| §7.4 logarithm theorem | u=1,i,2,1/2; uv=6 | Values 0,0,log2,−log2; log6=log2+log3 | No sign or rescaling change. |
| §7.4 unit versus Green sign | tᵃ,a=−1,0,1 | Unit on open a log\|t\|; Green −a log\|t\|; divisor coefficients −1,0,1 | Distinct signs agree with boundary adapter. |
| §7.4 projective theorem | O(a),a=−1,0,1 | Normalized Chern integrals −1,0,1 | Positive complex orientation retained. |

The unit proof uses the derivation law: d1_A=d(1_A·1_A)=2d1_A, hence d1_A=0. Inserting this type-(0,0) element into either mixed product formula reduces the type projection to the original input; in the high/high range it is ordinary multiplication. Thus the conditional assertion holds in all degrees and twists, not only in the polynomial Check.

For the opposite cone, negating the third coordinate also negates the raw quotient representative. Identifying the *same* real-part coordinate requires transporting that quotient identification. The added Check records this detail rather than claiming that negation fixes Re(3+4i). This qualification does not distinguish two owned Deligne theories or change the F02 verdict.

## Maintainer consequences

F01 and F05 are repaired locally. F02–F04 remain external ownership conflicts requiring the named companion edits; this report does not certify a completed single-owner arrangement. No upward import was added. No Lean declaration cited by another roadmap changed. The consumer-specific arithmetic, symbols, D_AH, β, normalized-current dictionary and concrete comparison theory remain with their owners. No commit, push, pull-request edit or message was made.
