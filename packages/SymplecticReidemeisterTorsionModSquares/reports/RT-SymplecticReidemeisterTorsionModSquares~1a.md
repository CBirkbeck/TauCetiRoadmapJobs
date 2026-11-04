<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1576#issuecomment-6398576491 -->
Red team round 1 pass a (codex) of b1efe60

Verdict: needs_changes

1. **F01** (P1) The symplectic volume disagrees with the specified Lagrangian volume

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:458`: “The associated square class agrees with the vector-space Lagrangian construction.” See also §§1.3, 1.7–1.8 and §2.1's proof route.

   **Claim:** The ordered Darboux wedge and the adjoint-quotient Lagrangian volume have the same square class.

   **Witness:** Over ℚ take ω(e,f)=1 and L=ℚe. The quotient sends f↦−e*. Rank-one reverse-wedge duality has sign +1, so ν_L=−e∧f and the Darboux volume is e∧f. Their ratio [−1] is nontrivial.

   **Exact repair text:** “With the adjoint quotient q(w)(l)=ω(w,l) and the reverse-wedge identification of §1.3, the vector-space Lagrangian volume is (−1)^r times the ordered Darboux volume in rank 2r. Its square class therefore differs by [(−1)^r].” Replace the equality API bullet and the proof-route comparison accordingly, and add §1.8 to §2.1’s Needs. Add the rational symplectic-plane computation as a negative-control Check. Keep the ordered Darboux normalization used by cellular torsion. For r=1 the repaired comparison reads −e∧f=−(e∧f); for r=0 both volumes are 1.

2. **F02** (P2) Projective coefficient systems do not give standard symplectic group labels

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:698`: “For ρ on M, `N_R(rho_*[M]) = ...`”; the standing family scope at lines 7 and 19 allows finite projective fibres.

   **Claim:** Every permitted symplectic R-local system supplies a class in H₃(BSp₂ᵣ(R);ℤ)/2.

   **Witness:** Take R=ℝ[x,y,z]/(x²+y²+z²−1), P=ker((x,y,z):R³→R), and ω(v,w)=det((x,y,z),v,w). P is symplectic projective of rank two but nonfree: a basis would trivialize TS². Its constant local system has no symplectic frame.

   **Exact repair text:** “The evaluation formula on B_r(R) applies to local systems equipped with a fibre identification with the standard free symplectic module R^{2r}; changing that symplectic frame conjugates the representation and leaves its homology class unchanged. The arbitrary finite-projective family invariant is the separate construction of §3.5.” Keep §3.5 at its stated generality. The witness then belongs to §3.5 and has normalized constant-system value 1, while no undefined standard-group label is asserted. If the full projective-family evaluation is intended, add its symplectic-module groupoid classifier and comparison as named targets instead.

3. **F03** (P1) The Gaussian witness lacks the geometric realization input

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:843`, “Take the twists T₁ …”; its proof route at line 845 and Needs line 853 only invoke cocycle/matrix calculations and the mapping-torus formula.

   **Claim:** The displayed word substitutions produce an orientation-preserving smooth genus-two mapping class and hence the manifold used for the nonsquare witness.

   **Witness:** AV-v1 lines 4047–4066 explicitly use surface-group realization by mapping classes. Neither §4.7 nor §4.6 proves it: §4.6 assumes a diffeomorphism. Matrix intertwining alone gives no such diffeomorphism.

   **Exact repair text:** Add to the exact contracts and plan gaps: “What GeometricTopology must provide (gap:marked-surface-twists): For marked closed smooth oriented surfaces, provide the compatibility between orientation-preserving Dehn twists and their induced automorphisms of marked fundamental-group presentations, including basepoint-path conjugation and preservation of the oriented relator.” Use supplier GeometricTopology, Layer 3. Add this gap to §4.8's Needs and add the local target: “Realize T₁,…,T₅ by these twists with the displayed based word actions; verify the relator is carried to a conjugate of itself, with exponent +1.” The target then constructs the mapping torus before evaluating its torsion. For R=[a₁,b₁][a₂,b₂], the nontrivial control is T₃(R)=(a₂⁻¹a₁⁻¹)R(a₁a₂), so the repaired orientation test gives +1. Import any already-owned general realization theorem instead of constructing it again if an eligible earlier owner is identified.

4. **F04** (P3) The boundary Check supplies a pairing of the wrong dimension

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:561`: “Take C=K² in degree zero with a symplectic form and j=1.”

   **Claim:** This is an instance of §2.7's skew-symmetric dimension-four complex.

   **Witness:** C⊗C is concentrated in degree 0; K[−4] is concentrated in degree 4. Every degree-zero map between them is zero. A nondegenerate symplectic form on C⁰ cannot be that dimension-four pairing.

   **Exact repair text:** “Take C=K² concentrated in degree zero, equipped with the zero skew-symmetric dimension-four pairing, and j=1.” The cone still has rank two in degrees −1 and 4, χ(C)=2, χ₁/₂(D)=−2 and r≡0, so the remainder of the Check is unchanged and now tests an admissible input. Alternatively put C in degree two with its genuine symplectic pairing; that different Check has acyclic boundary and r≡1.

5. **F05** (P3) Local-coefficient cochains are cited to the wrong topology stage

   **Location:** `packages/SymplecticReidemeisterTorsionModSquares/README.md:55`: “Stages 2 and 4: finite cellular local-coefficient cochains …; crossed homomorphisms modulo principal ones in degree one.” Related Needs lines: 487, 501 and 839.

   **Claim:** AlgebraicTopology Stages 2 and 4 supply these cochain and degree-one comparison results.

   **Witness:** `TauCetiRoadmap/AlgebraicTopology/README.md:1011` places local-system cellular cochains and their comparison in Stage 6.1. Stages 2/4 concern chains. That main README contains no crossed-homomorphism/principal-cocycle comparison.

   **Exact repair text:** “AlgebraicTopology Stage 2 supplies local systems, Stage 4 supplies cellular chains, and Stage 6.1 supplies local-system cellular cochains and their singular comparison. Section 4.7 proves its presentation-specific crossed-homomorphism description from that cellular model.” Add Stage 6.1 to the affected Needs lines and remove the unsupported crossed-homomorphism supplier assertion. If the proof uses group cohomology, also cite native groupCohomology.cocyclesOfIsCocycle₁, groupCohomology.H1π and groupCohomology.H1Iso after verifying the chosen comparison. In the genus-two rank-two example the corrected cellular/cocycle comparison has cocycle dimension 6, principal dimension 2 and H¹ dimension 4.

## Verified sound

Read all 1,233 README lines and all 57 Suggested.lean lines: **1 Lean declaration, 60 numbered targets, 87 additional API statements, 185 subsection Checks and 9 introductory Checks**. Sampled computations appear below; the exhaustive target, API and Check ledgers are omitted from this report. Verified the **60 numbered targets' source-locator groups in all 3 cached legal sources**, including the JRV primary decomposition and Thom's coefficient groups. The 87 API consequences use their parent locators. The source refinements are not all verbatim source theorems: the odd-characteristic extension and corrected family normalization require the displayed new arguments. Source errors are separated below from package findings.

Checked **12 named roadmap supplier groups** and both pinned-library contracts. Nine declared gap slugs and their exact needs sentences match between `design/plan.json` and the README. Each names an owner and a coherent missing comparison; none is reported merely because the supplier has yet to implement it. Acceptance of those parts remains conditional on their declared contracts.

The checked head is b1efe60. The six paths in `git diff --stat origin/main...HEAD` are inside this package. No Lean command, build, Git write or external post was run. No package source was changed. The supplied elaborated signature was read and compared with §4.1; it retains every required binder. The report and scratch calculations are the only review outputs.

Dependency gate output:

```text
depcheck: 51 roadmaps, 586 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The mathematical missing edge in R03 is not detectable from the existing written Needs lines.

### Acceptance-test review

The full orthogonal Zassenhaus formula (§4.1) is the sole native-carrier headline stated in Lean. The module docstring names the remaining headlines and the missing carriers for each.

The one-tactic probe finds no padding: existing reflection lemmas compute individual reflections, but do not identify the spinor norm with the stable-primary Gram/determinant product. No other theorem is replaced by a free predicate, scalar stand-in or sorry'd data. The file contains one `import Mathlib`, one used Tau Ceti module, one namespace, one layer comment, one documented theorem and its honest `sorry`; no definitions, instances, admitted examples, `lemma` or `set_option`.

| Lean declaration and location | Section, variable and instance context | Computed instances and both sides | Result / change |
|---|---|---|---|
| `TauCetiRoadmap.SymplecticReidemeisterTorsionModSquares.zassenhaus_primary_formula`; Suggested.lean:40 | Layer 4; independent universe variables for K,V; Field K; Invertible (2:K); AddCommGroup V; Module K V; FiniteDimensional K V; Q, Q.Nondegenerate; A in the full orthogonal group; N=finrank V; arbitrary basis of ker(t^N); hU says t preserves range(t^N). No ambient section variable can disappear. | V=0: both determinants1, D=1, θ(id)=1. Rank1, A=−1, Q(x)=3x²: Vminus=V,U=0,D=3,θ=[3]. Q=I₂,A=rotation: Vminus=0,U=V,D=1/2,θ=[2]=[1/2]. Hyperbolic plane,A=−I:D=−1,θ=[−1]. Change primary basis by2 multiplies Gram determinant by4, leaving its class unchanged. | Agrees with README's full O generality and JRV line 782. N=dim is sufficient by Fitting stabilization. The arbitrary hU is ordinary invariant-subspace data, not a spinor conclusion. hD is a proved nonvanishing assertion, not an assumption. Retain. |

### Supplier and ownership register

File locations below refer to the content roadmap or library repository; sibling citations use the supplied open head. Searches by object covered main, Completed, board packages and the supplied sibling folders; the roadmap search tools were also used. Matches for generic determinants, ordinary based torsion, Lagrangians, spinor norms, Chern classes and bordism were distinguished from the signed nonacyclic adapters retained here. No duplicate fully qualified name for the sole Lean declaration was found.

| Supplier | Resolved location and scope | Instance / compatibility result |
|---|---|---|
| KTheoryLowDegrees §§14.1–14.4 | `TauCetiRoadmap/KTheoryLowDegrees/README.md:1301`; integer graded lines, projective/perfect determinants and parity comparison | Grades1,1 commute by−1; supplied determinant object is reused, not replanned. |
| PadicMeasuresIwasawaAlgebras §5.1 | `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md:3172`; determinant, acyclic, dual, shift and base-change maps | Moving d=2 from degrees−1,0 to0,1 inverts the determinant scalar; based/acyclic becomes2 in the package convention. |
| AlgebraicTopology Stages2,4,5,6 | `TauCetiRoadmap/AlgebraicTopology/README.md:1011` owns cochains; Stage5 Wang/transfer at lines868–904 | Index3 becomes1 modulo2; interval endpoints−1,+1. R05 corrects the cochain and crossed-homomorphism citation. Boundary cone is a declared gap. |
| GeometricTopology Layers1,11 | `TauCetiRoadmap/GeometricTopology/README.md`; smooth cell comparison is explicitly a gap; Layer3 starts at line357 | Elementary even-rank pair det I₂=1. R03 records the additional missing marked-twist input. |
| TangentialBordism B1–B3.1 | `TauCetiRoadmap/TangentialBordism/README.md:170`, B2.1–5; coefficient table at line266 | Ω₀=ℤ, Ω₁=Ω₂=Ω₃=0, Ω₄=ℤ; labelled circle over Bℤ maps to1. The ≤3 orientation comparison is the local consequence, not a second bordism construction. |
| StableHomotopyKTheory §§1.17,1.30,1.32 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:289`, :441, :466; colimits and classifying/bar comparisons | Bar circle generator1 stays1; integral quotient remains distinct from mod-two homology when H₂[2]≠0. |
| SchemeAndStackFoundations §§0.9,0.21,2.9,2.11 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:848`, :1394, :3582, :3656; approximation, finite normalization, étale coefficient/Kummer interfaces | 1+s is an étale unit torsor at(s), s is ramified; root line Picard class can be nonzero. Generic full faithfulness is the declared gap. |
| KTheoryFiniteLocalFields §§1.5,1.8–1.9 | `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:305`, :335; standard Chern slant, finite-rank comparison and finite-field restriction/transfer | q=3,5 restriction multipliers10,26 even; SL₂(F₉) H₂=ℤ/3 has no2-torsion. Witt lift and real comparison are declared gaps. |
| K3BlochGroups §§2.4–2.5,6.7 | Supplied current sibling `TauCetiRoadmap/K3BlochGroups/README.md:471`, :504, :2253 | ℚ: K₃→K₃ind is ℤ/48→ℤ/24, kernel2; stable Hurewicz uses indecomposables. Unstable/dyadic additions are gaps, not assumed present. |
| Chebotarev Layers7,11.3,13 | `TauCetiRoadmap/Chebotarev/README.md`; cyclotomic disjointness and weighted number-field Chebotarev | C₂ nonsplit fraction1/2; affine-line arithmetic-scheme total constant1/2. Arithmetic-scheme detection is explicitly a gap. |
| RepresentationTheory/LieGroups Layer5 | `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:358`; universal covering groups | Positive-rank Sp has requested ℤ→ℤ/2 kernel; rank0 has0 and is excluded. Specific symplectic identification is a gap. |
| MetaplecticAutomorphicForms §2.4b | `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md:477`; real double cover and kernel normalization | Central generator maps1→1 modulo2; integral lifting yields Bockstein0. Real Chern identification stays in its declared gap. |

Native definitions were checked against the manifest revisions: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant witnesses are `Mathlib/Algebra/Homology/HomologicalComplex.lean:157` (bare cochains impose neither boundedness nor projectivity), `Mathlib/Algebra/Homology/ShortComplex/HomologicalComplex.lean:89` (homology), `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:228`, `Mathlib/GroupTheory/Sylow.lean:54`, `Mathlib/LinearAlgebra/SymplecticGroup.lean:385` (determinant one), `TauCeti/FieldTheory/SquareClassGroup/Basic.lean:45`, :72, :83 (additive carrier, multiplicative wrapper and square criterion), `TauCeti/FieldTheory/SquareClassGroup/Multiplicative.lean:149` (coefficient map), `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean:180`, and `TauCeti/LinearAlgebra/CliffordAlgebra/Spin/SpinorNorm/Basic.lean:96`, :121, :143, :149. Reflection with Q(v)=2 has [2], not [−2]. These native objects are cited rather than redeclared.

The closest separate torsion owner is `TauCetiRoadmap/MorseNovikov/README.md:219`–N4: ordinary based-complex torsion and determinant/cohomology comparison. It does not supply the nonacyclic self-dual square root, the boundary sign, or the Chern comparison. The general determinant inputs here already have the KTheoryLowDegrees/PadicMeasures owners. The real subspace Lagrangian in Tau Ceti is not the finite-projective shifted-dual exact subcomplex. No ownership move to a later roadmap is required by the retained targets. R03 requests the missing based-word-action compatibility from an earlier geometric supplier. The board’s `packages/MappingClassGroupsAndCanonicalRepresentations/design/README.md:11` imports generic surface twists from MordellLawrenceVenkatesh LV.5; that design is not itself a new owner for the compatibility needed here, and does not discharge §4.8’s uncited geometric step.

### Sampled adversarial computations

The following 21 rows retain computed witnesses across all nine layers, including the findings and sign, specialization, characteristic, rank and density controls. They are stress tests, not proofs of universal claims. All fields have characteristic different from two unless an excluded-input test says otherwise. Empty determinants equal 1; negative degrees and half-sign exponents are integers.

| README target and line | Variable/hypothesis context | Instances and computed values | Result / change |
|---|---|---|---|
| §0.1 Cochain, shift, dual and cone conventions; README.md:130; AV-v1 line 2832 | bounded finite projective; commutative R, 2 invertible | a=2: d=2, shifted d=−2 in degrees −1,0. C=K[0]: Cone(id) has differential 1 and H=0; Cone(0) has H dimensions (1,1). Dual-shift coefficients at q=0,1 are +1,−1: the chain equation is (−1)·2=−2·1. | No refuting instance; retain |
| §0.6 Parity and local constancy; README.md:221; AV-v1 line 3057 | strict symmetric dimension1 over K; local strictification over R | Ranks (1,1),d=0: χ≤0=1 and lower term rank=1. Ranks (2,2),d=J: χ≤0=0, lower term rank=2, difference=rank J=2. d=sJ: generic χ=0 and special χ=2; residues modulo 2 both 0. Over F₂, d=1, cross value 1: χ=0, lower rank=1, unequal modulo 2; excluded by invertible 2. | No refuting instance; retain |
| §1.3 Reverse-wedge determinant duality; README.md:316; AV-v1 line 3254 | finite dimension; signed determinant/shift adapter | n=0,1,2,3,4: exponents 0,0,1,3,6 and signs +,+,−,−,+. n=2: dual order f₂∧f₁=−f₁∧f₂, scalar −1. m=n=1: correction at m+n is −1, product of separate corrections +1, cross factor −1. | No refuting instance; retain |
| §1.6 Determinant versus cohomology; README.md:374; AV-v1 line 3494 | bounded finite-dimensional K-cochains | d=0: cycles=C, boundaries=0; determinant comparison coefficient 1. d=2 in degrees 0,1: acyclic volume coefficient 1/2; based/acyclic=2. Shift of that pair: based/acyclic=1/2, inverse of 2. | No refuting instance; retain |
| §2.1 The symplectic determinant volume; README.md:447; AV-v1 line 3753 | finite-projective symplectic R-module rank2r | Ordered Darboux volume is e∧f; adjoint-quotient Lagrangian volume is −e∧f (R01). r=0: Λ⁰(0)=R and generator 1. r=3 over F₃: Darboux wedge coefficient 1; 3!=0. | R01: sign comparison false |
| §2.7 Three volumes on an algebraic boundary; README.md:552; AV-v1 line 3629 | strongly even skew dimension4j, j≥1; cone boundary | C=0: χC=χhalfD=0, r=0, a=b=c=1. The written nonzero degree-zero symplectic pairing cannot land in K[−4] (R04). With zero dimension-four pairing: χC=2, χhalfD=−2, r≡0. Middle alternating rank two: det J=1, but νterm/νcohom=[−1], r=1. | R04: one inadmissible Check |
| §3.1 Low-dimensional oriented bordism and homology; README.md:590; AV-v1 line 623; Thom line 2527 | small CW Y; labelled oriented bordism, d=0,1,2,3 | Y=point,d=0: positive/negative points map to +1/−1. Y=point,d=1,2,3: source=0,target=0. Y=Bℤ,d=1: circle generator 1→1; d=4,Y=point: source ℤ, target 0. | No refuting instance; retain |
| §3.5 Normalized torsion in families; README.md:654; AV-v1 line 4014 | normal nonzero domain; projective symplectic3-manifold system | Constant S³ plane: [−1]·[−1]=1 in every field fibre. Circle family: hgeneric=2, hspecial=4; normalized generic [1+s] maps to1, normalized special1. Root basis a→3a multiplies the square-trivialization representative by9; its class is unchanged. | No refuting instance; retain |
| §3.6 The étale Chern transformation; README.md:675; AV-v1 line 644 | standard Sp₂r over normal domains; integral H₃/2 | Zero integral cycle has c_et(0)=0 additively, torsor1 multiplicatively. Sp₂(F₃) degree3 quotient generator maps to [−1]≠1. C₂×C₂ has integral H₂=C₂ and H₂[2]=C₂, so full mod2 H₃ has a nonzero extra quotient. | No refuting instance; retain |
| §3.7 The normalized torsion transformation; README.md:696; AV-v1 line 618 | same standard group; labelled representatives; R02 on projective scope | A labelled boundary represents0: normalized boundary torsion1. 2x maps to N(x)²=1. Constant free label on S³ maps to0 in H₃(point); normalized torsion1 despite raw [−1]. | R02: qualify the group label |
| §4.1 Zassenhaus determinant formula; README.md:727; AV-v1 line 3822; JRV line 782 | finite-dimensional nondegenerate Q; every orthogonal A; field,2 invertible | V=0,N=0: t⁰=id on0; both determinants1 and θ(id)=1. Rank1,A=−1: B=2 gives D=2,θ=[2]; B=3 gives D=3,θ=[3], unlike unrestricted plus formula [2]. Rotation on I₂: D=1/2, class[2]; −I on hyperbolic plane: D=−1,θ=[−1]. S₃ 3-cycle: det((1+A)/2)=1/4, class1=[2]²; Q₈ commutator −I₄: disc(I₄)=1. | No refuting instance; retain |
| §4.7 A genus-two cocycle model; README.md:820; AV-v1 line 4142 | surface presentation; b₁−1 invertible; chosen t,M; determinant denominator nonzero | ρ(g)=−I,φ(g)=v: inverse value v; φ(gg⁻¹)=−v+v=0. φ_v(g)=ρ(g)v−v: M⁻¹φ_v(tg)=ρ(g)M⁻¹v−M⁻¹v=φ_(M⁻¹v)(g). V dimension2,b₁−1 invertible: cocycles6, principal2, quotient4. | Values correct; R05 corrects supplier |
| §4.8 A nonsquare Gaussian torsion class; README.md:841; AV-v1 line 4196 | explicit genus2 data overℚ(i); geometric realization prerequisite R03 | Both relators I₂ and four intertwining residuals0. Reversed first order: b₂ residual [[1−i,1−i],[−1−i,1+i]]≠0. First char6=x⁶+x⁴+x²+1, principal char2=x²+1; quotient x⁴+1, ratio4/2=2,h=0. Second char6=x⁶+3x⁴+3x²+1; quotient(x²+1)², ratio8/2=4, square class1. | Matrix values correct; R03 supplies geometry |
| §5.5 Weighted density and controlling extensions; README.md:934; AV-v1 line 866 | number field; X≥1; nonempty conjugacy subset; bad upper limit0 | Empty S: \|S\|/\|G\|=0 and no positive-density controlling witness. Residue degree≥2: p≤√X, at most [L:ℚ] primes per p; weighted total O(√X log X), divided by X tends0. Upper limits0+0 bound union by0; alternating dominating blocks give each lower limit0 but union limit1. | No refuting instance; retain |
| §5.7 Composita of controlling extensions; README.md:969; AV-v1 line 903 | two Galois extensions; union subset nonempty; no linear disjointness | E₁=E₂ quadratic: group order2, product order4, image diagonal size2. Disjoint quadratics: union has3 elements in group of4, fraction3/4. S₁=∅,S₂≠∅: union is inverse image of S₂; both empty: union size0. | No refuting instance; retain |
| §6.2 Multiquadratic controlling extensions; README.md:1021; AV-v1 line 973 | liftable subspace W, positive dimension; fixed quadratic class excluded as specified | dim W=1,W≠〈α〉: \|W*\|=2,nonidentity1. dim W=2: \|W*\|=4,nonidentity3; β and α+β are a basis avoiding α. dim W=0: \|W*\|=1,nonidentity0,excluded. | No refuting instance; retain |
| §6.4 The cubic density improvement; README.md:1049; AV-v1 line 992 | positive missing fraction δ; degree/rank bounds and independent quotients | δ=1/2:h=8,N=4; gain(1/2−1/16)/8=7/128≥1/128=δ³/16. δ=1/4:h=12,N=6; gain(1/4−1/64)/12=5/256≥1/1024. δ=0: no finite h has 2^(−h/4)≤0; excluded, target density already1. | No refuting instance; retain |
| §7.1 Comparison in characteristic zero; README.md:1087; AV-v1 line 1108 | normal integral finite-type characteristic0 domain; positive rank | Spec ℤ[1/2]:d=1, weighted total~Q; quadratic nonsplit~Q/2. Spec ℤ[1/2,t]:degree1 weight Σp≤Q p logp~Q²/2, normalized limit1/2. Bad weight o(Q): bound Q^(d−1)o(Q)=o(Q^d); higher powers give Q^(d−1/2)log²Q=o(Q^d). | No refuting instance; retain |
| §7.2 Lifting finite-field homology through Witt vectors; README.md:1101; AV-v1 line 1132 | odd finite field; positive rank; homology modulo2 | \|Sp₂(F₃)\|=24,\|Syl₂\|=8,index3; transfer composite=3≡1 mod2. In F₃,8≡2 and 8⁻¹=2 since 8·2≡1. In F₂,8=0 so averaging undefined; x=0 has lifted cycle0. | No refuting instance; retain |
| §8.1 The real Chern component and the metaplectic cover; README.md:1181; AV-v1 line 230 | real symplectic positive rank, discrete group; standard Chern normalization | Positive rank:ℤ→ℤ/4→ℤ/2 sends1→1→1; lifted extension has β=0. Rank0:π₁=0,notℤ; excluded. C₂:H²(C₂;ℤ)=ℤ/2 maps nonzero to H²(C₂;F₂); its Z/4 lift exists, so β(t²)=0. | No refuting instance; retain |
| §8.2 Vanishing of the real degree-three Chern component; README.md:1195; AV-v1 line 233 | same; full mod2 homology, not merely integral quotient | H*(C₂;F₂)=F₂[t]:β(t)=t²≠0,an isomorphism in degrees1→2. Hypothetical c₃₁=t gives β=t²≠0,whereas β_group(c₂₂)=0; contradiction. Zero cycle gives0; for C₂×C₂ the additional H₂[2]=F₂ shows integral-cycle vanishing alone is insufficient. | No refuting instance; retain |

Additional boundary controls: a finite field has q≥2, and the finite-field targets require odd q, so q=1 and F₂ are outside their domains. For F₃(t)→F₃(u), t↦u³, the inseparable scalar extension sends [t] to [u³]=[u], since u³/u=u²; no separability is needed in the square-class adapter. In degree zero the zero-ring module is zero and Λ⁰ has its unique unit; the normal-family and field assertions exclude this ring. Empty covers, unit-ideal localizations and empty manifolds give empty products 1, not a positive-rank inference. For the Lean theorem Fin 0 is empty, its Gram determinant is 1, and t⁰ is identity on the zero space. There are no divisions by dimensions, natural-degree subtraction, or zero-polynomial degree evaluations in its signature.

## Not verifiable

- No new Lean elaboration was run, as required by the read-only review. The worker-supplied elaborated type in `signatures.md` was compared with the sole declaration and README. Consequently this report does not claim a fresh build or a newly generated `#check` transcript.
- The nine declared supplier gaps are contracts, not implemented proofs. Their slugs, ownership, hypotheses and compatibility requirements were checked; the promised geometric, étale, dyadic, Witt and real comparison proofs remain conditional. R03 identifies a further prerequisite that is not among those nine.
- The source locators and the mathematical stress tests do not constitute formal proofs of the universal torsion or Chern constructions. No completed formal carrier for those constructions exists in the inspected pinned modules. In particular the corrected base-change argument is not certified by merely citing AV-v1's erroneous raw-naturality assertion.
- Ownership was checked against main, Completed, board packages and the supplied sibling heads, with the roadmap tools used to resolve named suppliers and search by object. Other open pull requests without supplied files were not exhaustively reviewed. No claim is made about unpublished work or changes after these heads.
- No source is missing: all three works in `sources.toml` were legally readable from the supplied cache. No new reference request or change to the manifest was necessary. No correction in a later published edition is asserted below.

## Source issues

- **Misprint** in AV-v1 at §1.5, printed p. 8 (AV-v1 line 331): the source says the same-half pairings in the standard symplectic basis equal one; it should be zero for both same-half blocks; affects a stated result.
- **Error** in AV-v1 at A.6.1, printed p. 66 (AV-v1 line 3076): the source says the middle differential's cokernel carries the induced perfect alternating pairing; it should be C⁰/ker(d⁰), of dimension rank(d⁰); affects the proof.
- **Misprint** in AV-v1 at B.3 shift convention, printed p. 70 (AV-v1 line 3261): the source says to invert the positive-shift map for n≤1; it should be to invert for negative shifts and use identity for zero; affects the proof.
- **Misprint** in AV-v1 at (B.14), printed p. 74 (AV-v1 line 3450): the source says the quotient of successive brutal truncations is Cʳ[−r]; it should be Cʳ⁻¹[1−r]; affects the proof.
- **Misprint** in AV-v1 at B.6 item (a), printed p. 78 (AV-v1 line 3666): the source says C is the cone's distinguished Lagrangian; it should be C∨[−n] in the cone convention used there; affects the proof.
- **Misprint** in AV-v1 at B.6 decomposition argument, printed p. 79 (AV-v1 line 3699): the source says D₂ is acyclic and assigns the middle-block sign to D₂; it should be D₁ for the acyclic block, consistently exchanging the subsequent proof labels; affects the proof.
- **Error** in AV-v1 at (B.20) and its Euler-count justification, printed pp. 78–80 (AV-v1 line 3736): the source says half the middle rank equals (χ(C)+χhalf(D))/2 as an integer; it should be congruence modulo two, as in (B.23); C=K² in degree three gives 0 versus −2; affects the proof.
- **Misprint** in AV-v1 at the calculation preceding (B.23), printed p. 80 (AV-v1 line 3745): the source says the cone's degree-i rank is cᵢ+cₙ₋₁₋ᵢ; it should be cₙ₋ᵢ+cᵢ₊₁ for its declared cone; affects the proof.
- **Misprint** in AV-v1 at B.9.2 before (B.34), printed p. 83 (AV-v1 line 3907): the source says the acyclic N-map has the same unshifted Jordan vectors as source and target; it should be their N-images in the target; affects the proof.
- **Misprint** in AV-v1 at (B.34), printed p. 84 (AV-v1 line 3913): the source says the second Jordan-chain wedge ends with a vector generated from e₁; it should be the corresponding vector generated from e₂; affects the proof.
- **Misprint** in AV-v1 at (B.36), printed p. 84 (AV-v1 line 3941): the source says the first transposition of M puts Me in the second pairing slot; it should be Mf; affects the proof.
- **Error** in AV-v1 at B.9.2 after (B.30), printed p. 85 (AV-v1 line 3979): the source says raw boundary-circle torsion is trivial for commutator monodromy; it should be normalized torsion; the constant orthogonal plane has raw class [−1] and normalized class 1; affects the proof.
- **Error** in AV-v1 at §2.3.3, printed p. 13 (AV-v1 line 573): the source says raw torsion commutes with every normal-domain base change; it should be the half-semi-characteristic-normalized invariant; the orthogonal circle family specializes raw [−(1+s)] to [−1] instead of its actual value 1; affects a stated result.
- **Gap** in AV-v1 at B.10 functoriality argument, printed p. 86 (AV-v1 line 4033): the source says the root line directly represents raw torsion after specialization; it should be accompanied by the middle-rank correction, whose variation must be canceled in the normalized invariant; affects the proof.
- **Error** in AV-v1 at (C.2), printed p. 87 (AV-v1 line 4083): the source says the discriminant factor is restricted to the ordinary fixed space; it should be the generalized one-eigenspace; for hyperbolic diag(U,U⁻ᵀ) with nontrivial unipotent U over ℚ, the ordinary restriction is zero; affects a stated result.
- **Misprint** in AV-v1 at (C.8), printed p. 89 (AV-v1 line 4171): the source says the cocycle is precomposed with the cohomology operator T; it should be precomposed with the surface-group automorphism t; affects the proof.
- **Misprint** in AV-v1 at the sentence before (C.9), printed p. 89 (AV-v1 line 4183): the source says the relevant T acts on the mapping torus's H¹; it should be the surface's H¹; affects a stated result.
- **Gap** in AV-v1 at (C.9), printed p. 89 (AV-v1 line 4184): the source says absence of fixed vectors on the quotient suffices to divide the two determinants; it should be assumed separately that det(1−M⁻¹)≠0, or the identity should be cross-multiplied; affects the proof.
- **Error** in AV-v1 at Lemma 2.7.1, printed p. 16 (AV-v1 line 698): the source says finite-field symplectic H₂ vanishes without exception; it should be odd-order for the mod-two argument; SL₂(𝔽₉) has H₂=ℤ/3; affects a stated result.
- **Error** in AV-v1 at §2.7 before Definition 2.7.1, printed p. 17 (AV-v1 line 746): the source says a nonsquare raw torsion value forces the normalized transformation to be nonzero; it should be a nonsquare normalized value; the constant symplectic plane on S³ over 𝔽₃ has raw [−1] but normalized 1; affects the proof.
- **Error** in AV-v1 at §2.8, printed p. 18 (AV-v1 line 754): the source says the closed-point Frobenius elements are dense for every permitted affine scheme; it should be qualified in dimension zero; Spec 𝔽₃ has one Frobenius element, not a dense subset of ℤ̂; affects a stated result.
- **Misprint** in AV-v1 at §2.9 definition of a lift, printed p. 18 (AV-v1 line 764): the source says x is a homology element lifting x under the Chern map; it should be x lifting the square class α, as its following equation specifies; affects nothing.
- **Error** in AV-v1 at Definition 2.11.1 and Lemma 2.11.2, printed pp. 20–21 (AV-v1 line 870): the source says exceptional sets of lower weighted density zero can be combined by union; it should be upper density zero, since alternating dominating prime blocks give two lower-zero sets with full union; affects the proof.
- **Error** in AV-v1 at the proof of Lemma 2.11.1, printed p. 21 (AV-v1 line 898): the source says normalized homology evaluation equals the specified raw torsion witness; it should be the normalized witness; the constant symplectic plane on S³ has evaluation 1 but raw value [−1]; affects the proof.
- **Error** in AV-v1 at Lemma 2.11.2, printed p. 21 (AV-v1 line 909): the source says the compositum Galois group surjects onto the product; it should be that each projection is surjective; equal quadratic extensions give a two-element diagonal in a four-element product; affects the proof.
- **Error** in AV-v1 at Lemma 2.12.2, printed p. 22 (AV-v1 line 974): the source says every finite-dimensional W distinct from ⟨α⟩ yields a controlling nonidentity subset; it should be required that dim W≥1; W=0 gives the empty subset; affects a stated result.
- **Error** in AV-v1 at §2.14 counting argument, printed p. 25 (AV-v1 line 1122): the source says the total logarithmically weighted closed-point count normalized by Qᵈ tends to one; it should be replaced by a positive Qᵈ-order lower bound; Spec ℤ[1/2,t] has limit 1/2; affects the proof.
- **Gap** in AV-v1 at §2.15, printed p. 26 (AV-v1 line 1139): the source says the Sylow argument lifts an arbitrary integral homology class; it should be a class modulo two, since odd-index transfer only gives the required localized or mod-two surjectivity; affects the proof.
- **Error** in JRV at §5 before Theorem 5.1, printed p. 16 (JRV line 773): the source says every nondegenerate quadratic space of dimension at least two has surjective spinor norm; it should be qualified by represented square classes, for example a hyperbolic plane; positive-definite ℝ² has image {1}; affects a stated result.
- **Misprint** in JRV at §6 discriminant convention, printed p. 17 (JRV line 847): the source says the dimension sign uses n while declaring d=dim V; it should be (−1)^(d(d−1)/2); affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b1efe60c8970713a414677f16eae9fe1b2da99eb", "job": "RT-SymplecticReidemeisterTorsionModSquares~1a", "model": "gpt-6-astra", "worker": "chris-16"} -->
