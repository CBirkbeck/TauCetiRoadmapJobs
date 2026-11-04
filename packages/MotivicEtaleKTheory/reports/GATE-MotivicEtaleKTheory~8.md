# Human-review response

The review's single integration finding has four concrete corrections, numbered in their order of appearance. All four remain unresolved in sibling specifications; neither authorized roadmap file needs another wording change, and neither was changed.

## H01 (CBirkbeck) — answered

ColemanIntegration §§L3.Fa.1–L3.Fa.2 at ae078af still construct restriction fibers, their iterates and ordered relativity, with §L3.Fa.2 depending only on §L3.Fa.1; `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15`, §2.0a (lines 211–223) and line 727 already assign the shared construction here and specify the face/support/pairing comparisons through SchemeKTheoryOperations §2.5. The required correction is to import that construction while retaining Coleman's public Quillen adapters and signs; this remains unresolved because ColemanIntegration is outside the two permitted edit files.

## H02 (CBirkbeck) — answered

SchemeKTheoryOperations at 88dbd5a still assigns multi-relative refinements to ColemanIntegration in “Scope and ownership” and “Downstream consumers,” whereas `TauCetiRoadmap/MotivicEtaleKTheory/README.md:15` assigns the shared iterated restriction-fiber construction to §2.0a and imports only the earlier vertex models, pairings and operations. Its downstream ownership clauses need correction while retaining Coleman's exact-cube realization and Adams comparison; editing that sibling is outside the permitted scope, so this component remains unresolved.

## H03 (CBirkbeck) — answered

ColemanIntegration §L3.Fc.1 at ae078af still requests construction of reg_∞ and its Needs clause omits the shared character, while `TauCetiRoadmap/MotivicEtaleKTheory/README.md:17` and line 729 already supply reg_∞=πₚ₋₁∘ch_D,p for p≥2, with the point projection fixed in §§7.1/7.4. The sibling must import that marked specialization and retain its arithmetic pairings, integral-image theorem and determinants; this required sibling edit remains outside the permitted scope.

## H04 (CBirkbeck) — answered

ColemanIntegration §§L3.Fa.1–L3.Fa.2 at ae078af still claims a simultaneous eigenspace direct sum on arbitrary open cubes, and SchemeKTheoryOperations' downstream comparison clause still promises simultaneous weight summands without the generalized distinction; Levine94 Lemma 2.1 defines generalized characteristic spaces (Levine94 line 706–729), as already specified in `TauCetiRoadmap/MotivicEtaleKTheory/README.md:211`, line 235 and line 727. An equivariant comparison preserves the ordinary and generalized kernels separately: the displayed Jordan example gives dimensions 1 and 2, so the sibling decomposition must use generalized pieces on arbitrary opens or prove a separate semisimplicity theorem; that correction remains unresolved outside the permitted files.

### Ownership and citation evidence

- The indexed open heads are ColemanIntegration ae078af and SchemeKTheoryOperations 88dbd5a, matching the reviewed heads; both are new roadmap folders, absent from content main 86e155c, so their indexed specifications are the relevant copies. The added heading in the displayed copies was excluded when interpreting repository line numbers.
- Shared construction ownership is assigned here because §2.0a supplies the cycle-to-K construction and precedes ColemanIntegration in the merge order (positions 83 and 150); SchemeKTheoryOperations is earlier (position 37) and supplies the vertex models. Changing its downstream ownership description must not add a dependency from its ordinary construction to this roadmap. No ownership was moved or new supplier introduced in this response.
- SchemeKTheoryOperations §2.5 explicitly compares Quillen vector-bundle and supported perfect models on the regular ample-family domain, including restriction fibers, boundaries and tensor pairings. Sections 6.1 and 6.8–6.9 provide the vertex pairings and operations; they do not make a general filtered representation semisimple. Levine94 line 719–736 proves the finite-filtration argument with powers of the weight operator.
- The construction and weight patterns were searched by object across indexed main/open roadmaps, the supplied sibling checkouts and board package READMEs. Polylogarithms §5.2, BorelRegulators §6.0a, EllipticKTheory's supplier contracts and PeriodsAndSpecialValues' supplier contracts already consume the shared cycle/Deligne constructions; they do not cure the two sibling discrepancies above. Ownership against the supplied open pull requests was checked; no new construction was added here.
- All supplier roadmap section references were re-resolved against their main or indexed open copies: GeneralAlgebraicKTheory §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13; SchemeKTheoryOperations §§2.1–2.6, 3.1–3.6, 4.3, 6.1, 6.7–6.9, 7.1–7.3; KTheoryFiniteLocalFields §§3.0a/6.10; MotivesAndAlgebraicCycles §§4.4, 4.7–4.8a, 4.14, 4.17–4.18; SchemeAndStackFoundations §§2.1–2.2, 4.12, 4.17, 5.1–5.8; ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6/6.1–6.4; EtaleCohomologyFoundations §§G.1–G.3; ComplexComparisonPartII §§C−1.1/C−1.4/C5.1/C5.3–C5.6/C6.0; EnhancedDerivedSheaves §§0.1–0.4/E0.6/E1.4/E2.6; DifferentialGeometry's named layers; ComplexKahlerGeometry K1–K2; AlgebraicTopology's named stages and Stage 8 item 2. Whitney/Borel and flat-ideal supplier extensions remain explicitly specified requirements, rather than assumed implementations.
- Citation resolution against the indexed main 8888d45 and 363 open heads reports no missing cross-roadmap citation or Lean name. Its library-name check was unavailable, so pinned declarations were inspected separately. The downstream-only ZagierConjecturePolylogarithms M.8 and MixedHodgeModulesAndIrregularHodgeTheory references could not be independently inspected in the available copies; their names occur in the merge order, and no supplier or verdict here relies on them.
- Mathlib 6b7abb3 and Tau Ceti a91d3aa match both manifests and the inspected package revisions. The ordinary cycle carrier is `Function.locallyFinsupp` in `Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44`; its map at line 69 requires quasi-compactness and explicit weights, with no built-in face-admissibility or dimension grading. The mapping cone at `Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57` and its summand differential identities at lines 261/269 give the stated fiber transport. Dold–Kan at `Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167` concerns an abelian category, without itself supplying geometric K-spaces or their Moore/homotopy comparison.
- Native Hodge structures and Tate pieces were inspected in `TauCeti/Geometry/Hodge/Structure.lean`, `Morphism.lean`, `Tate/Basic.lean:91`, `Mixed/Basic.lean:72` and `Mixed/Strictness.lean:110`; they are linear data, and strictness requires an actual mixed-Hodge morphism. `TauCeti/Algebra/Homology/GradedCochainComplex.lean:59` requires a genuine degree-one square-zero endomorphism. Object searches found no supplied face-admissible higher-cycle complex, supported scheme K-spectrum or geometric Deligne complex replacing the missing headline carriers.
- `TauCetiRoadmap/MotivicEtaleKTheory/Suggested.lean` has zero named declarations, 56 lines and the single import Mathlib. Thus the required per-declaration `#check @name` inventory is empty; the specified target build elaborated the entire module once, and there is no declaration signature or retained hypothesis to compare or change. No assumed regulator, data admission or scalar substitute was introduced.
- The review-relevant source passages were read in the supplied legal extractions: Levine94 line 655–736 (supported fibers and generalized weights), BF line 919–1002 (smooth complex universal characters), BKK line 3965–3990 and BKK line 4030–4060 (the exponential/Chern normalization and real projection), and WeibelKBook line 15979 (the integral stable-Hopf obstruction). No source text was copied, no new source was needed, and Bloch86/Beilinson85 remain uncertified and Levine98 waived as settled in the source manifest.

### Adversarial mathematics pass

These are finite witness computations, not proofs of the general targets. Each result preserves the existing statement and its hypotheses; no roadmap statement was added or changed. The table includes the defining operations and their API laws, with source/target and convention checks where relevant.

| Statement | Instances tried | Computed values on the relevant sides | Result | Change |
| --- | --- | --- | --- | --- |
| Universe/skeleton convention | One-object compactification diagram; reindex its sole object | Both colimits are ℝ; comparison sends 1 to 1 | Same marked object | None |
| Dimension/component convention | Spec k ⊔ ℙ¹ | CH⁰=ℤ²; CH¹=0⊕ℤ; rank (2,1) stays (2,1) | Component grading retained | None |
| Integer motivic degree | p=0, a=1 | 2p−a=−1; cycle term 0, rather than degree-zero ℤ | Negative degree handled | None |
| Derived coefficients | ℤ/2 tensor-derived ℤ/2; zero coefficient ring | H⁻¹=H⁰=ℤ/2; with zero ring both groups 0 | Ordinary homology tensor would lose H⁻¹ | None |
| Cube boundary and BF transport | Graph of t; n=0,1,2 | ∂Γ=[0], δΓ=−[0]; J=(1,−1,1) | Orientation fixed | None |
| Multiplicativity of J | n=m=1 | J₂=1=J₁J₁=(−1)(−1) | Same source/target transport | None |
| Mixed totalization | Bidegree (1,1) | Cross coefficients −1 and +1; sum 0 | Differential squares to zero | None |
| Cochain shift/fiber convention | 0→ℝ[0]; identity ℤ[0]→ℤ[0] | First fiber has ℝ in degree 1; second is ℤ→ℤ with H⁰=H¹=0 | Shift and contractibility agree | None |
| Localization suspension convention | t at origin; symbol {2,t} | B[t]=+1, raw cycle boundary=−1; in degree 2 B{2,t}=−[2], last-slot adapter=+[2] | Both degree signs retained | None |
| All integer Tate twists | Point, p=−1,0,1 | H⁰ at p=−1 is ℝ(−1); H⁰ at p=0 is ℝ; H¹ at p=1 is ℝ | Negative twist is meaningful | None |
| Point quotient projection | z=3+4i, p=1,2,3 | πₚ₋₁(z)=3,4i,3; πₚ₋₁(ℝ(p))=0 | Quotient map well-defined | None |
| Complex orientation/residues | Two ordered coordinate loops | ∮dz/z=2πi; ordered normalized residue +1; exchanged −1 | Orientation and parity agree | None |
| Totalized product convention | (n,s)=(1,1),(0,1),(1,2) | Factors −1,+1,+1 | Koszul factor retained | None |
| Whitney jet extension requirement | Taylor coefficients 1,1,2 at 0 | Derivatives 1,1,4; coefficient n! gives derivative (n!)² | Factorials distinguished | None |
| Whitney transverse parameters | ∂ₓᵐf(0,y)=(m!)²sin y, m=2,y=π/2 | Prescribed derivative 4 | Parameter-dependent input retained | None |
| Whitney nonuniqueness | Zero jet at 0 | Both 0 and exp(−1/x²) have zero jets; values at 1 are 0 and e⁻¹ | Extension is not unique | None |
| Flat-ideal sum requirement | A=B=U; A=∅,B=U | 0=0+0; C∞=C∞+0 | Both extremes consistent | None |
| Flat-ideal sum versus intersection | Coordinate axes; φ(x)+φ(y) | At (0,1) value e⁻¹; flat on intersection, not on both axes | Sum distinguished from intersection | None |
| §1.1 raw and normalized cycles | Point, p=0; double point, n=0 | Normalized terms ℤ,0,0; reduced generator 1, doubled cycle 2 | Degeneracies and multiplicities separated | None |
| §1.1 boundary identity | Square over fields of characteristic 2 and 3 | Each integral codimension-two coefficient is +1−1=0 | Coefficients remain integral | None |
| §1.1 refined subcomplex | Graph Γ_t; point cycle 2 | Γ_t has remaining face [0]≠0; point 2 has all faces 0 | Refined chain versus cycle distinguished | None |
| §1.1 refined retraction | Z=[x+y=3]−[x=2]−[y=2] | Zero faces of Z are [3]−[2]; those of rZ are ([3]−[2])−[3]+[2]=0 | Facewise vanishing obtained | None |
| §1.1 refined homotopy sign | Degree-two Z and elementary adjacent-coordinate homotopy | rZ−Z=−[x+y−xy=3]+[x+y−xy=2]=−∂h₂Z | Elementary sign agrees with transport | None |
| §1.1 extra cubical map | h(x,y)=x+y−xy at x=0,1 and y=0,1 | y,1,x,1, also modulo 2 and 3 | Required faces preserved | None |
| §1.1 normalization/quotient isomorphism | Point, p=0, n=1 | Raw degeneracy generator 1 maps to 0; normalized group 0 | Quotient matches kernels | None |
| §1.1 proper pushforward dimension shift | ℙ¹→point, fundamental cycle | Image drops dimension, hence 0; negative codimension target 0 | No spurious point generator | None |
| §1.1 flat pullback and proper transfer | Purely inseparable field extension of degree 2 | Pullback generator 1; transfer returns 2 | Integral multiplicity retained | None |
| §1.1 native coefficients detect equality | Double-point support | Generator coefficients 1 and 2 differ | Nilpotent multiplicity not collapsed | None |
| §1.1 restriction/refinement/support transport | Empty and full support | Empty homology 0 before/after; full point H₀=ℤ before/after | Homotopy equivalence agrees at extremes | None |
| §1.2 mixed complex | Total degrees 0 and 2 | Numbers of summands 1 and 3 | Direct-sum indexing finite | None |
| §1.2 axis maps | Degree-zero point generator | i□(1)=iΔ(1)=1 | Same marked source | None |
| §1.2 component maps determine total map | Degree-zero map multiplying by 2 | Only component sends 1 to 2; total sends 1 to 2 | No independent axis normalization | None |
| §1.2 mixed J transport | (1,0),(0,1),(1,1) | Multipliers −1,+1,−1 | Simplex axis fixed | None |
| §1.3 integral comparison | Point, p=0 | Each H₀=ℤ, positive H=0; map 1↦1 | Integral rather than rational witness | None |
| §1.3 supported comparison | Z=∅ and Z=X | fib(id) has H=0; fib(C→0)=C | Both endpoints agree | None |
| §1.3 coefficient comparison | Derived mod-2 reduction; R=0 | Two ℤ/2 groups in degrees −1,0; all groups 0 for R=0 | Tor term preserved | None |
| §1.4 restriction/pushforward/pullback compatibility | 𝔽₂(t)/𝔽₂(t²) | Transfer after restriction multiplies 1 by 2 in both models | Inseparable degree preserved | None |
| §1.4 products | Homological degrees (1,1),(0,1) | Exchange signs −1,+1 | Graded symmetry agrees | None |
| §1.4 support/nilpotent/identity compatibility | Square-zero thickening; identity | Same integral cycle generator 1; identity coefficient +1 | Cycle theory does not acquire a nilpotent generator | None |
| §2.0a supported total-fiber definition | n=0, field, rank two; empty support | K₀ class 2; empty-support groups 0 | Correct vertex and zero endpoint | None |
| §2.0a support/face limits commute | Identity restriction and empty support | Both orders produce contractible fiber with π₀=0 | Same support diagram | None |
| §2.0a generalized weight decomposition | Jordan matrix [[2,1],[0,2]] | (T−2)e₂=e₁, (T−2)²e₂=0; kernel dimensions 1 and 2 | Semisimplicity does not follow | None; sibling correction unresolved |
| §2.0a commuting operations preserve generalized pieces | Same Jordan block, operator identity or T | Each maps span(e₁,e₂) to itself; T(e₂)=e₁+2e₂ | Preservation differs from scalar action | None |
| §2.0a rational coefficient necessity | ℙ², h³=0 | ψ²h=2h−h²; ψ²h²=4h²; eigenlattice index 2 | Integral direct-sum claim excluded | None |
| §2.0a integral Adams spaces versus spectra | Spec ℚ, ψ², stable η | η(1)=[−1]≠0; ψ²[−1]=0 although ψ²(1)=1 | No integral spectrum-endomorphism assertion | None |
| §2.0a support-local cycle map | 𝔸¹, W={0}, c=1 | Supported 1↦[O₀]=1; forget support gives 1−1=0 | Supported and absolute maps differ | None |
| §2.0a relative-cycle incidence condition | V=𝔸², W=V(x), D=V(y) | Restriction ℚ→ℚ sends 1↦1; kernel and relative zero-face cycles both 0 | Incidence/vanishing condition effective | None |
| §2.0a positive-degree vanishing endpoint | c=0 at point; c=1 at supported origin | K₁^(0)=0 versus K₀^(0)=ℚ; supported K₁^(1)=0, K₁^(2) contains [2] of valuation 1 | a>0 and b≤c exact | None |
| §2.0a forget-face injectivity | Same transverse affine divisor | Obstruction K₁ weight 1=0; degree-zero kernel=0 | Boundary obstruction excluded | None |
| §2.0a relative splitting/moving hypotheses | z and 1−z on affine cube | z+(1−z)=1; W={z=0} has face codimension 0 instead of 1 | Bad support excluded | None |
| §2.0a refined cycles as relative inputs | Square Z and rZ | Original face coefficients (+1,−1); refined face coefficients (0,0) | Relative input is determined before forgetting support | None |
| §2.0a support maps and pullback | {0}⊂{0,1}; identity | 1↦(1,0), then unchanged; identity 1↦1 | Direction and composition agree | None |
| §2.0a common-base pairing and Adams | Units u,v over ℤ_(p), p=2,3 | ψ²{u,v}=4{u,v}=(2[u])(2[v]) | Product weight adds | None |
| §2.0a regular external-product domain | ℤ[i] self-product over ℤ | Local dimension 1, cotangent dimension 2; common-base cube remains regular | Singular external base excluded | None |
| §2.0a ordered one-loop relativity | Full cube, face ranks | (1,0)↦1, (0,1)↦−1, (1,1)↦0 | Difference is zero minus infinity | None |
| §2.0a Adams-equivariant full-cube relativity | Unit 2 over ℚ | ψ²[2]=2[2], ψ¹[2]=[2] on both sides | Full-cube weight one fixed | None |
| §2.0a two-loop exchange | {u,v} over ℚ(u,v) | Ordered last-slot residues +1; exchange −1; ψ² factor 4 | Loop orientation retained | None |
| §2.0a mixed characteristic and localized opens | Full cube over ℤ₂,ℤ₃; remove t=2 over ℤ₃ | K₀ relative=ℤ_p×; localized trivial line has face ranks (1,1), difference 0 | No full-cube equivalence asserted on arbitrary open | None |
| §2.0a regular nonsmooth field input | L=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2,3 | Local dimension 0; Ω¹_L/k=L ds≠0; rank cycle 1↦1 | Smoothness not substituted for regularity | None |
| §2.0b universal Chern operation/rank | Zero K-class; unit 2 | c₀,₀(0)=1, positive c=0, ch(0)=0; c₁,₁[2]=[2] of valuation 1 | Chern operation differs from character | None |
| §2.0b finite-field Tate construction | 𝔾_m over 𝔽₂ | c₁,₁[t]=[t], valuation 1; (𝔸¹∖{0,1})(𝔽₂) has 0 points | Rational specialization shortcut excluded | None |
| §2.0b stabilization/naturality/Whitney | O(1)⊕O(−1) on ℙ² | Total c=(1+h)(1−h)=1−h²; adding trivial line leaves positive classes | Required universal identities discriminating | None |
| §2.0b diagonal Milnor factor | Degrees n=1,2,3 | Integral multipliers 1,−1,2; rational character multipliers 1,1,1 | Factorial and sign retained | None |
| §2.0b Newton-polynomial character | O(1) on ℙ²; p=1,2,3 in positive K-degree | c₂=0, ch₂=h²/2; higher coefficients 1,−1,1/2 | Denominators nonzero in ℚ | None |
| §2.1 geometric cycle map | Point rank 2; point divisor on ℙ¹ | 2↦2; h↦1−[O(−1)] of Euler characteristic 1 | Zero/inverse model excluded | None |
| §2.1 map on actual carriers | Empty and two-component schemes | 0↦0; (2,1)↦([k²],[k]) | Components not summed | None |
| §2.1 refined representative independence | Square Z replaced by rZ | Boundary difference −∂h₂Z; each refined face 0 | Same homology class, valid relative input | None |
| §2.1 flat/general smooth naturality | Unit 2 and identity map | Cube unit and K₁ unit both have valuation 1; identity preserves 1 | Actual class retained | None |
| §2.2 weightwise and total comparison | ℙ¹, O(±1) | ch=1±h; their sum=2 | Same finite weight decomposition | None |
| §2.2 rational projectors | Weights 0,1,2 | ψ² eigenvalues 1,2,4; differences −1,−3,−2 | All projector denominators nonzero | None |
| §2.2 Adams compatibility | Unit u and rank; a=1,2 | [u²]=2[u]; rank eigenvalues 1,1; ψ¹=id | Weight one and zero separated | None |
| §2.2 universal inverse identification | [O_point]; {2,t} | Leading h on both sides; last-slot residue [2] on both, reversed order −[2] | Positive-degree normalization tested | None |
| §2.3 supported comparison/full support | Empty support; nonsmooth regular Spec L | Empty 0≃0; full rank ℚ≃ℚ sends 1↦1 | General regular domain retained | None |
| §2.3 singular support versus K(Z) | Crossing V(xy) in 𝔸² | Leading supported coefficients (1,1); support has 2 components | No regular dévissage of singular Z asserted | None |
| §2.3 boundary transport | (𝔸¹,{0}), t | d(Γ_t,0)=([0],t); [(0,t)]=−[([0],0)]; adapted coefficient +1 | Raw and K-boundaries distinguished | None |
| §2.3 support enlargement/flat naturality | 𝔸¹_L, {0}⊂{0,1} | Divisor 1↦(1,0); identity coefficient 1 | Purity weight 1 retained | None |
| §2.4 products/internal formula | Rank-2 and rank-3 bundles; ξ on ℙ¹ | Rank product 6=2·3; ξ²=0 maps to h²=0 | Character multiplicative | None |
| §2.4 degree-zero leading class | Origin in 𝔸¹ and point in ℙ¹ | Affine class 1−1=0 and divisor class 0; projective leading class +h | Leading class may vanish | None |
| §2.4 higher Chern normalization | p=1,2,3 | Factors 1,−1,1/2; ch₂,₂=−c₂,₂ | No integral factorial division | None |
| §3.1 logarithmic image algebra | Punctured disk; empty boundary | dlog\|z\|²=dz/z+dz̄/z̄; D=∅ gives ordinary smooth forms | Both logarithmic generators required | None |
| §3.1 Dolbeault identities | Function z z̄ | ∂∂̄=dz∧dz̄; ∂̄∂=−dz∧dz̄; sum 0 | Anticommutation fixed | None |
| §3.1 pair pullback/chart independence | Change z↦2z | log\|2z\|²−log\|z\|²=log 4; dlog(2z)=dlog z | Difference smooth, marked derivative unchanged | None |
| §3.1 injectivity/size/unit | \|z\|⁻² and 1; empty W | Arbitrary pole excluded; d1=0; empty section spaces 0 | Wrong larger algebra excluded | None |
| §3.2 geometric logarithmic comparison/weight shift | 𝔾_m⊂ℙ¹ | H¹ dimension 1, period 2πi, log W₁ plus degree 1 gives weight 2 | Shifted weight rather than 1 | None |
| §3.2 degeneration and point/empty cases | Point; empty variety | Point H⁰,⁰=ℂ, weight 0; all empty components 0 | Filtration endpoints agree | None |
| §3.2 compactification refinement | Blowup of torus boundary crossing | H⁰,H¹,H² dimensions 1,2,1 before/after | No unshifted residue-W invariance inferred | None |
| §3.2 coordinate division estimate | f=e^(−1/\|z\|²), quotient f/z²; nonflat f=1 | All quotient jets at 0 vanish; value e⁻¹ at 1; 1/z has pole | Flatness indispensable | None |
| §3.2 logarithm/combined estimate | f=e^(−1/\|zw\|²), f log\|z\|²/(z w̄) | Axial jets 0; at (−2,1), −e⁻¹ᐟ⁴ log4/2 | Combined denominator and sign fixed | None |
| §3.3 Deligne cone/small model | Point p=0,1,−1; A=0 | H⁰(0)=ℝ; H¹(1)=ℝ; H⁰(−1)=ℝ(−1); all terms 0 for A=0 | All integer twists coherent | None |
| §3.3 cone-arrow transport | z=3+4i, opposite arrow | Raw quotient values 3,4i,3 negate to −3,−4i,−3; transported markings restore 3,4i,3 | Marked arrow identification required | None |
| §3.3 inclusion/projection/contraction | Point weight 1 | r↦(0,0,r)↦r; log2+iθ projects to log2 | One composite identity, other homotopic | None |
| §3.3 exactness and finite sums | Split sequence ℂ→ℂ²→ℂ at point | At weight 1, cohomology is ℝ→ℝ²→ℝ with inclusion/projection | Real/type-compatible exactness | None |
| §3.3 critical differential | p=1, x=\|z\|² | d_Dx=−2dz∧dz̄; ordinary degree jumps 0→2 | Sign and degree match | None |
| §3.3 cochain shift versus Dolbeault shift | Point A[1] | Sole dimension 1 lies in degree −1; conjugate off-diagonal types would require dimension at least 2 | Only comparison maps shifted | None |
| §3.4 Zariski-sheafified colimit | 𝔸¹, p=1; Re z | H¹_D=ℝ constants; Re z takes 0 and 1 yet has pole growth at infinity | Analytic sheafification wrong | None |
| §3.4 refinement and choice cocycle | Torus boundary blowup x=e,y=eu | Pullback log\|x\|=log\|e\|; at (2,3) value log2 in both choices | Marked open form preserved | None |
| §3.4 functorial pullback | Identity and coordinate exchange on 𝔾_m² | log\|x\| unchanged by id; exchange gives log\|y\|, values log2 versus log3 | Pullback map determined | None |
| §3.4 finite-open descent/empty/sums | Point ⊔ℙ¹; empty cover of empty object | H⁰_D(ℝ(0))=ℝ²; empty object 0 | Finite components and empty object correct | None |
| §3.4 colimit/skeleton universal property | Two identical point choices and identity transitions | Marked generator 1↦1 on each; induced colimit map 1↦1 | No arbitrary rescaling | None |
| §4.1 full product/critical formula | log2 and log\|t\|, p=q=1 | Product (log2)(dt/t−dt̄/t̄)/2=i log2 darg t | Four-term formula fixes twist | None |
| §4.1 Leibniz | x=\|z\|², y=1, weight one | x•y=−z̄dz+z dz̄; d_D(x•y)=−2dz∧dz̄=d_Dx•1 | Nonclosed input tested | None |
| §4.1 graded symmetry | Two degree-one logarithms | Swapped representative −i log2 darg t | Odd sign −1 | None |
| §4.1 unital/nonunital distinction | A=ℝ[t] and tℝ[t] | 1•t=t; coefficient of t in e t is 0 for every e∈tℝ[t], versus 1 in t | Unit requires specified identity | None |
| §4.1 high degree/naturality | Weight-zero constants 2,3; inclusion tℝ[t]→ℝ[t] | 2•3=6; t•t=t² in source and target | Wedge/product and nonunital map agree | None |
| §4.2 associator homotopy | Three point constants 2,3,5; odd logarithms | Both bracketings 30; odd point products 0 | Associator difference 0 | None |
| §4.2 even-critical vanishing without closedness | x=Re z, y=2,z=3 in weight zero | Both bracketings 6Re z, value 6 at z=1; dx≠0, h_a=0 | Closedness not needed | None |
| §4.2 choice compatibility | Product torus periods before/after blowup | (2πi)² in both; exchanged −(2πi)² | Same product and orientation | None |
| §4.2 cohomology ring/unit | tℝ[t] versus ℝ[t] | (t²)t=t(t²)=t³; only latter has 1·t=t | Associativity does not imply a unit | None |
| §5.1 pair-fiber definition/differential | 0→ℝ[0]; arbitrary pair | ℝ occurs in degree 1; second coordinate of d² is res(dω)−d(resω−dg)=0 | Shift and square-zero law | None |
| §5.1 enlargement and composition | {0}⊂{0,1} | r↦(r,0); identity leaves (r,0) fixed | Correct support direction | None |
| §5.1 triangle/raw connecting map | Unit t on punctured line | δ_raw(log\|t\|) has divisor coefficient −1 | Raw triangle not rewritten | None |
| §5.1 support products | V(x),V(x−1) versus V(x),V(y) in 𝔸² | Disjoint product 0; transverse product origin coefficient 1 | Intersection support correct | None |
| §5.1 cocycle criterion both ways | Map id:ℤ[0]→ℤ[0]; pair (a,0) | Differential second coordinate a; closed iff a=0 | Both defining equations necessary | None |
| §5.2 Betti/Deligne semipurity | Crossing, cusp, origin in 𝔸² | At p=1: top ℝ²,ℝ,0; at p=2 origin top ℝ; lower groups 0 | Codimension determines range | None |
| §5.2 codimension hypothesis | Point, p=1, full support | H¹_D=ℝ≠0 while 1<2p | Hypothesis cannot be dropped | None |
| §5.2 component classes/injectivity | Crossing divisor; double divisor | Coefficients (1,1); doubling gives 2 versus 1 in same component line | Multiplicity and zero criterion effective | None |
| §5.2 normalized current criterion both signs | t on 𝔸¹, d=p=1 | Form factor (2πi)⁻¹, point factor 1; d_D[−log\|t\|]=−δ₀ | Criterion gives divisor coefficient +1 | None |
| §5.2 principal-divisor class | tᵃ for a=−1,0,1 | Green representative −a log\|t\|; supported coefficient a | Positive unit log kept separate | None |
| §5.3 directed supports | Two disjoint point supports | Union coordinates (1,0)+(0,1)=(1,1) | Common finite-union support computes equality | None |
| §5.3 Hₚ and real cycle class map | Point p=0; origin cycle and its double | Normalized H₀=ℝ, higher cube terms 0; coefficients 1 and 2 | Real cycle basis retained | None |
| §5.3 Aₚ/Aₚ,S totalization | (r,n)=(2p,1),(2p−1,1) | Total degrees 2p−1,2p−2; cube signs +1,−1 | Reindex and differential agree | None |
| §5.3 good truncation | ω=Re(z₁)dz₂∧dz̄₂, p=1 | dω on (∂x₁,∂x₂,∂y₂)=−2i≠0 | ω excluded from top truncation | None |
| §5.3 projection and forget-support | Origin on affine line | Top support class 1; forgetting support maps class to 0 | Different arrows distinguished | None |
| §5.3 filtered colimit/empty support | Point p=1, n=0 | Empty-support cochains ℝ→ℝ by id in degrees 1,2; H¹=H²=0 | Acyclic does not mean zero complex | None |
| §5.4 cycle-class complex isomorphism | Origin and double on affine line | Cycle coefficients 1,2 map to support coefficients 1,2 | Zero map excluded | None |
| §5.4 projection quasi-isomorphism | Same column; empty column | Surviving degree-2p class coefficient 1; empty column cohomology 0 | Semipurity/truncation alignment | None |
| §5.4 affine contraction | point→𝔸¹, p=0,1 | H⁰_D(0)=ℝ and H¹_D(1)=ℝ on both; positive normalized columns have H=0 | Correct affine invariance | None |
| §5.4 product comparison | n=s=1 and s=2 | Extra factors −1 and +1 | Totalized comparison retains sign | None |
| §6.1 specified regulator roof | Point rank m, origin class | m↦m; origin cycle coefficient 1 survives in supported model | Maps fixed by fundamental classes | None |
| §6.1 lift independence | Replace top support representative by a boundary | Boundary changes cohomology by 0; marked coefficient remains 1 | No free choice of regulator | None |
| §6.1 integral source/torsion | Units −1 and i | log\|−1\|=log\|i\|=0 | Torsion killed by real target | None |
| §6.1 degree-zero geometric class | O(1),O(−1) on ℙ¹ | Normalized integrals +1,−1; raw periods ±2πi | Geometric Chern normalization | None |
| §6.2 enhanced restriction/fiber endpoints | Identity restriction; full support | h=0; empty support regulator 0; full support absolute map m↦m | Coherent diagram endpoints | None |
| §6.2 pair map with homotopy | A=A′=ℤ[0], B=0, B′=(ℤ→ℤ), r=f′=h=1 | Correct image (1,1) has differential (0,0); wrong (1,−1) gives (0,2) | +ha sign forced | None |
| §6.2 localization compatibility | (𝔸¹,{0}), t | Raw Deligne coefficient −1; negative-log pair coefficient +1 | Same suspension dictionary | None |
| §6.3 general smooth pullback | Point→ℙ¹ and c₁O(1) | CH¹(point,0)=0=H²_D(point,ℝ(1)) | Derived pullback avoids bad raw intersection | None |
| §6.3 embedding/base change | Unit 2 via ℚ→ℝ→ℂ and ℚ→ℂ | Both values log2 | Compatible embeddings agree | None |
| §6.3 cycle-model independence | Point degree 0; cube degrees 1,2 | Both axes send 1↦1; BF transports −1,+1 on source and target | Same derived map | None |
| §7.1 independent universal character | Rank-2 trivial bundle and zero K-class | Character 2 and 0; trivial line 1 | Universal map not zero | None |
| §7.1 higher coefficient | p=1,2,3, n>0 | 1,−1,1/2 times universal higher Chern class | Newton normalization retained | None |
| §7.1 additivity/products/naturality | O(1)⊕O(−1) on ℙ¹; ranks 2,3 | Character sum 2; tensor rank 6=2·3 | Ordinary and higher normalization consistent | None |
| §7.1 exponential normalization | u=2e^(iθ),i and branch addition 2πi | Real values log2,0; branch addition changes value by 0 | Logarithm coset descends | None |
| §7.1 degree-zero Chern class | O(a) on ℙ¹, a=−1,0,1 | ch=1+a h_D; normalized c₁ integrals −1,0,1 | Positive generator fixed | None |
| §7.1 point specialization | p=2,3, z=3+4i | πₚ₋₁ values 4i,3; added ℝ(p) projects to 0 | Coleman marked target fixed | None |
| §7.1 Dold–Kan/Moore domain | Constant simplicial ℤ versus S₃ | Abelian π₀=H₀=ℤ and positive groups 0; S₃ has nonabelian π₀=S₃ | Nonabelian input excluded | None |
| §7.2 actual K-group comparison | Point rank 2; unit 2; unit −1 | Both composites 2,log2,0 | Degree zero and positive degree tested | None |
| §7.2 geometric/supported comparison | [O_point] on ℙ¹; empty support | Both images h_D of integral 1; empty maps 0 | Same class and support | None |
| §7.2 higher sign and boundary | Weight 2, degree 2; boundary of log\|t\| | Character factor −1; raw supported coefficient −1 | Both normalizations retained | None |
| §7.3 integral external/internal product | Units 2,t on 𝔾_m | Representative i log2 darg t; positive-circle period 2πi log2 | Integral-source product has correct twist | None |
| §7.3 graded exchange/unit/zero | Swap degree-one units; weight-zero 1; empty factor | Period −2πi log2; unit preserves value; empty product 0 | Koszul and unit checks agree | None |
| §7.3 point and projective product | Units 2,3 at point; ruling divisors on ℙ¹×ℙ¹ | Point product regulator 0; ruling intersection 1, doubled ruling 2 | Target dimensions and multiplicities | None |
| §7.4 logarithm/additivity | u=2,3,6,1,i,1/2 | log2+log3=log6; remaining values 0,0,−log2 | Sign and multiplicativity determined | None |
| §7.4 two-unit differential formula | f=2,g=t | i(log\|f\|darg g−log\|g\|darg f)=i log2 darg t | Factor i required | None |
| §7.4 divisor/unit distinction | tᵃ on affine/punctured line, a=−1,0,1 | Green values −a log\|t\|; unit values +a log\|t\| | Opposite representatives have distinct roles | None |
| §7.4 projective normalization | c₁O(a), a=−1,0,1 | Normalized integrals −1,0,1 | No rescaling of character allowed | None |

### Validation

Exact target build outcome (exit 0):

```text
✔ [8976/8976] Built TauCetiRoadmap.MotivicEtaleKTheory.Suggested (2.3s)
Build completed successfully (8976 jobs).
```

Exact gate summary:

```text
gate MotivicEtaleKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Exact dependency-check output:

```text
depcheck: 50 roadmaps, 580 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The worktree remains at 83b84dfb91b8c5b462d57b390896bff8e5df7e43 with no tracked changes; no commit or push was made. Passing these checks does not resolve H01–H04's sibling integration requirements.
