# EllipticKTheory repair report

The first ten finding sections refer to review a; the final two refer to review b. Their overlapping model-signature finding has one shared repair, described separately for each review. All file references are repository-relative.

## F01 (P2) — applied

Review a. “Genus interface missing” → real marked-model definitions and three admitted headlines: exists_minimalRegularProperModel, locallyMinimal_terminal and minimal_unique. README §§6.1, 6.3, 6.6–6.7 and the acceptance summary agree. The terminal statement uses outgoing minimality, equivalent to local minimality. Evidence: TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:75; conrad line 342, line 362; stacks line 219788.

## F02 (P2) — applied

Review a. Locally owned geisserLevine and geisserLevine_filteredColimit → KTheoryFiniteLocalFields §5.17, geisserLevine_fieldComparison and geisserLevine_motivicConcentration. Deleted both duplicate proof plans; repaired scope, §§5.5–5.6 and Layer 5 dependencies. The supplier quantifies over every characteristic-p field, n≥0 and ν≥1, with naturality, torsion freeness and uniquely p-divisible kernel/cokernel.

## F03 (P2) — applied

Review a. gap:k3-field-inputs and gap:arithmetic-dedekind-inputs → direct contracts from K3BlochGroups §§2.1–2.2, 2.5 and ArithmeticKTheory §§1.1, 2.1, 2.4, 3.2–3.4. Removed both plan entries and every corresponding gap annotation. The supplied heads contain the complete requests. This uses new supplier evidence, not a demand to extend another roadmap. The distinct function-field homology gap remains.

## F04 (P2) — applied

Review a. Compound requests reconstructing shared motivic foundations → direct KTheoryFiniteLocalFields §§3.0, 3.0a, 5.17 contracts. Narrowed both motivic gaps and their plan entries to weight-one-model/field-limit and Adams/rational/étale-descent compatibilities. Updated consumers throughout §§4.5–4.6, 5.5–5.9 and dependencies. MotivesAndAlgebraicCycles §§4.4, 4.7–4.8 confirms the ownership boundary. The regular imperfect-field curve adapter remains here.

## F05 (P2) — applied

Review a. Owned abstract exists_regularProperModel → imported RelativeJacobiansAndIntegralCurveModels §5.1. The retained target, weierstrassModel_resolution, resolves a specified integral equation, preserves its regular locus and marking, and compares models through §6.4. Updated scope, supplier contracts, build description and Layer 6 dependencies. excellentSurfaceResolution retains its additional general excellent-surface domain; existence does not depend on the subsequent comparison.

## F06 (P2) — applied

Review a. Independently planned K0Elliptic.addEquiv → imported KTheoryLowDegrees §12.4 and retained K0Elliptic.weierstrassCompatibility. Updated summary, ownership, supplier contract, §2.7 and dependencies. The new assertion identifies the supplied point coordinate with the concrete Weierstrass divisor-class map. Its sign witness is P=(2,1) over 𝔽₅: 2P=(0,0), −P=(2,4)≠P.

## F07 (P3) — applied

Review a. Separated dimension-one hypothesis justified by a higher-dimensional example → connected nonempty regular noetherian dimension-at-most-one supplier statement, without separatedness. Added doubled-line and doubled-plane boundary values in §2.1; qualified the supplier contract by nonemptiness. Evidence: weibel line 8197 explicitly assumes n≥2; KTheoryLowDegrees §§12.1–12.2, 12.4 supplies the wider curve theorem and doubled-line calculation.

## F08 (P3) — applied

Review a. “Coefficient table has a missing bar” → the table uses X̄ correctly; the e-invariant source in the proof on p. 504 requires X̄. Evidence: weibel line 30699, line 30701, line 30724. Kept the ℙ¹/𝔽₂ negative control and recomputed it with ℓ=3: arithmetic K₁=0, geometric coefficient K₂=(ℚ₃/ℤ₃)².

## F09 (P3) — applied

Review a. Five restatements → explicit inputs and outputs in §§2.5, 3.4, 5.2, 6.4 and 7.8. Values are respectively nonzero real two-torsion descent, [0]−[∞]→[0]→0, (1,0,O)→(9,0,O)/(2,0,P_f), identity versus involution marking, and res(2)=2/N(2)=4 with res(Nβ)={x²−2,y}. These remain prose Checks; no Lean padding was added.

## F10 (P2) — applied

Review a. Unrestricted procyclic coinvariant formula → continuous discrete torsion, finitely generated ℤ_ℓ with its ℓ-adic topology, or finite-dimensional continuous ℚ_ℓ coefficients. Updated both scope and exact contract, qualified the §5.8 application, and added coefficient Checks. SelmerIwasawaCohomology §2.7 explicitly has these restrictions. Discrete trivial ℤ gives H¹=0 but coinvariants ℤ.

## F01 (P2) — applied differently

Review b. Shares review a F01’s marked-model repair. The requested abstract regular-existence theorem belongs to RelativeJacobiansAndIntegralCurveModels §5.1 (review a F05), so it is imported rather than redeclared. Three separate minimal-model headlines replace the proposed combined admission. Hom.id and Hom.subsingleton remain README API targets: neither is needed to state the headlines. No genus placeholder or sorried model data remains.

## F02 (P3) — applied

Review b. Backticked undeclared local names with arguments → prose target names. Fixed toLocalModel, SymbolCertificate, blochClassLift and blochClass throughout §§6.3, 7.2, 7.7; the pattern search also corrected eulerChar, pushforwardToBase, riemannRoch, weightComponent, SymbolCandidate.toK2 and Hom.id. Restored RegularProperModel names legitimately remain backticked because the acceptance file declares them. Mathematical formulas retain their notation.

## Verification outcomes

- Pinned elaboration of packages/EllipticKTheory/Suggested.lean from the content repository: exit 0; seven warnings, all `declaration uses 'sorry'`, for the seven headline theorems. No errors or other warnings. A subsequent `git diff --check` also exited 0 with no output. All six imported Tau Ceti modules had object files; no build was needed.
- A scratch copy with `#check @name` for all 15 explicit declarations elaborated once: exit 0, the same seven admission warnings, and 15 signatures. Compared each signature with the README. No binder was lost. In particular all model definitions retain O, F, their algebra structure, C and toField; each arithmetic headline retains NumberField, finite S and W.IsElliptic; terminality retains M.IsMinimal; marked uniqueness retains both minimality hypotheses. The original eight signatures keep their field, coefficient, support, annihilator and divisor hypotheses.
- Dependency command from the brief: exit 0. Exact output:

```text
depcheck: 34 roadmaps, 328 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Citation resolver: exit 0; cross-roadmap citations found nowhere: None; Lean names found nowhere: None. It also says that non-roadmap names were not checked because its host lookup has no pinned Lake packages. Those names were inspected directly in the specified pinned checkouts. The four initial leads are resolved: KGroup.ofRing_colimit is exported by GeneralAlgebraicKTheory §3.2; Scheme.K.pushforward_affine and Scheme.cartan_isEquiv_of_regular by SchemeKTheoryOperations §§2.3, 2.6; GenusOne is an existing Tau Ceti module, not a declaration.
- No gate failures were listed separately in the brief. The two obsolete gaps are deleted; the other four have matching README obligations and plan entries. Only the top-level gaps list changed in design/plan.json. metadata.toml is unchanged. The Geisser–Levine manifest key is retained, with its consumer locator updated; no source was renamed or newly fetched.

## Source and ownership verification

Read the main AlgebraicCurves and JacobianChallenge roadmaps and the supplier descriptions before editing. Ownership searches used roadmaps grep/show over the indexed heads and main, the board packages, and the supplied sibling checkouts. No helpers performed mathematical work. The supplied MotivicEtaleKTheory head explicitly imports the shared cycle/tower contracts and excludes finite-coefficient étale descent from its scope; no new dependence on it was introduced.

| Contract | Evidence read | Mathematical boundary retained |
| --- | --- | --- |
| General field K₃ | TauCetiRoadmap/K3BlochGroups/README.md §§2.1–2.2, 2.5 | Integral Milnor injectivity, actual cokernel, rational rank r₂; not the torsion-free quotient. |
| Arithmetic Dedekind inputs | TauCetiRoadmap/ArithmeticKTheory/README.md §§1.1, 2.1, 2.4, 3.2–3.4 | General criterion has finite Picard group and Steinberg homology hypotheses; its supplied homology proof is for number rings. |
| Shared characteristic-p comparisons | TauCetiRoadmap/KTheoryFiniteLocalFields/README.md §§3.0, 3.0a, 5.17 | All fields, inseparable norms, integral/derived coefficients; positive invertible coefficients for the étale norm-residue comparison. |
| Weight-one model | TauCetiRoadmap/MotivesAndAlgebraicCycles/README.md §§4.4, 4.7–4.8 | The Suslin–Tate complex is supplied; identification with the imported Bloch model is the residual request. |
| Regular-model existence | TauCetiRoadmap/RelativeJacobiansAndIntegralCurveModels/README.md §5.1 | Excellent Dedekind base, smooth proper geometrically connected generic curve, fixed marking; not a canonical resolution of a specified equation. |
| Pointed elliptic K₀ | TauCetiRoadmap/KTheoryLowDegrees/README.md §§12.1–12.4 | Nonempty rank–determinant statement; pointed Picard decomposition; concrete Weierstrass compatibility retained here. |
| Procyclic H¹ | TauCetiRoadmap/SelmerIwasawaCohomology/README.md §2.7 | Coefficient topology and torsion assumptions, and chosen Frobenius generator. |
| Other cited scheme K inputs | GeneralAlgebraicKTheory §§2.4–2.5, 3.2, 4.6, 4.8, 4.14; SchemeKTheoryOperations §§1.7, 2.2–2.6, 3.3–3.7, 4.5, 5.1–5.5, 6.8–6.11, 7.6 | Proper perfect K-pushforward versus proper G-pushforward, Tor-independent base change, support boundaries, regular ample-family Adams scope. |
| Point/divisor/isogeny inputs | Main ModularCurves Layers 1A–1D, 2A–2D; EllipticCurves Layers 0–3; AlgebraicCurves Layer 12; JacobianChallenge Layers A–B, D | Same marked curve, rational origin and actual function-field maps; zero morphism outside isogenies. |
| Local models and reduction | StableReduction Layers 4–5; NeronModelsAndSemistableAbelianVarieties §§1.8, 2.7, 6.5 | DVR-local constructions versus global surface targets; smooth Néron locus need not be proper. |
| Finite-field cohomology | StableHomotopyKTheory §§7.1–7.4, 7.8, 7.25–7.29; EtaleDualityAndPerverseSheaves §§0.3, 0.5; WeightsInEtaleCohomology R34.2; ArithmeticGaloisDuality R02.2, D7; ProfiniteCohomology Layers 10–11; DeligneWeightsAndPurity DWP.0–1 | Derived coefficients, invertible Kummer coefficients, arithmetic/geometric variance and permitted continuous modules. |
| Curve K₀ dimension boundary | weibel line 8197 | Doubled affine n-space example assumes n≥2. |
| Geometric coefficient source | weibel line 30699; weibel line 30724 | Correct table; incorrect proof source lacks its bar. |
| Outgoing minimality | conrad line 342 | Every outgoing marked morphism is an isomorphism. |
| Minimal existence/terminality | conrad line 362; stacks line 219761; stacks line 219788 | Positive genus; maps go from arbitrary regular models to the minimal one. |
| Native scheme and marking | TauCeti/AlgebraicGeometry/EllipticCurve/Scheme/ProjModel.lean:75; Mathlib/RingTheory/DedekindDomain/SInteger.lean:65 | Projective model and S-integer subalgebra exist without a generic genus encoding. |
| Native local model boundary | TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44 | Requires a DVR, so it cannot itself be the global S-integer bundle. |
| Native genus | TauCeti/AlgebraicGeometry/WeilDivisor/Scheme/GenusOne.lean:83 | The native genus interface exists; it is unnecessary in these Weierstrass signatures. |
| Morphism uniqueness input | Mathlib/AlgebraicGeometry/Morphisms/Separated.lean:288 | Reduced source, dominant comparison map, separated target over the fixed base. |
| Flatness input | Mathlib/RingTheory/Flat/TorsionFree.lean:137 | Dedekind domain; torsion-free modules are flat. |
| Residue unit and norm | TauCeti/FieldTheory/FunctionField/Place/Residue.lean:113, :140 | Nonzero function with order zero; actual residue-field norm, not a product without inseparable multiplicity. |
| Torsion principal functions | TauCeti/AlgebraicGeometry/EllipticCurve/Affine/FunctionField/TorsionDivisor.lean:42 | Integer annihilator and nP=0; no canonical choice of function. |

No source text was copied. Sources were read from the supplied legal extractions. Bloch and Young remain waived; Geisser–Levine and Grayson remain uncertified and are cited by the settled locators, with the K-book statements available. No additional missing text or human decision is needed. The residual gaps are requests to their named suppliers, not assertions that those extensions are already supplied.

## Adversarial mathematics pass

Each row records a statement or construction and an evaluated witness. Equal values are given explicitly; a counterexample is recorded where it fixes the intended boundary. “Retain” means the computed witness requires no mathematical edit, not that elaboration proves truth. The small arithmetic and point counts were recomputed using exact integer/rational arithmetic; geometric and cohomological witnesses were evaluated from the definitions and stated source hypotheses.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Curve and closed-point convention | ℙ¹_ℚ, point t²+1; generic point | Residue degree 2; closed stalk dimension 1; generic stalk dimension 0 | Distinct kinds of point | Retain |
| Regular versus smooth | F=𝔽₂(t), (y−x)²=t | Coordinate ring F(√t)[x] regular; after adjoining √t, ε²=0 | Regular need not be smooth | Retain |
| Weierstrass origin convention | [0:1:0] | Y=1, Z=0, cubic value 0 | Origin in Y-chart | Retain |
| K versus G convention | Point and doubled point | Cartan rank-one class has lengths 1 and 2 respectively | Regularity needed | Retain |
| Tame sign convention | {2,t}, {t,2}, {t,t} at t=0 | 2, 1/2, −1 | Inverse convention distinguished | Retain |
| Residue norm convention | i∈ℚ(i), −1∈ℚ(√2) | N(i)=1, N(−1)=1 although i,−1≠1 | Norm is weaker | Retain |
| Frobenius and twist | q=3, trace 0, twist 2 | det V=3; det H¹_arith=1/3; det H¹_geom=3; twisted det=81/3=27 | Correct dual and twist | Retain |
| S-integer convention | F=ℚ, S=∅ and {2,3} | ℤ and ℤ[1/6] | Inverts places in S | Direct supplier |
| Coefficient convention | ℙ¹/𝔽₂, ℓ=3 | Integral K₁=0; geometric coefficient K₂=(ℚ₃/ℤ₃)² | Groups differ | Correct proof locator |
| Field K₃ quotient | ℚ | ℤ/48→ℤ/24; kernel order 2, rational dimensions 0→0 | Not torsion-free quotient | Direct supplier |
| Field K₃ rank | ℚ, ℚ(i) | dim=0=r₂, dim=1=r₂ | Complex pairs counted once | Direct supplier |
| Dedekind finite generation | Rank-one lattice over ℤ | Aut={±1}, St=ℤ; H₀=ℤ, positive odd homology ℤ/2 | Criterion includes rank one | Separate function-field gap retained |
| Field motivic diagonal | n=0,1 | H⁰(F,ℤ(0))=ℤ=K₀ᴹ; H¹(F,ℤ(1))=F×=K₁ᴹ | Same carriers | Direct supplier |
| Field above-weight vanishing | Weight 1, a=2; weight 0, a=1 | Cycle degrees 0 and −1; codimension-one cycles on Δ⁰=0; negative chain group=0 | Both groups 0 | Direct supplier |
| Inseparable diagonal norm | 𝔽ₚ(t)/𝔽ₚ(tᵖ) | N(t)=tᵖ; N(res(tᵖ))=t^(p²) | Degree p retained | Direct supplier |
| Bloch–Gabber–Kato | 𝔽₂(s,t), n=2; perfect field | dlog s∧dlog t=(st)⁻¹ds∧dt≠0; positive forms over perfect field=0 | No perfect-field restriction | Direct supplier |
| Geisser–Levine coefficients | 𝔽₂,n=0; 𝔽₂(s,t),n=2,ν=1 | ℤ/2^ν=ℤ/2^ν; {s,t} detected by nonzero two-form | Correct general field input | Direct supplier |
| Weight-one model gap | Any F, weight 1 | Bloch H¹=F×; units[-1] H¹=F×, H⁰=0 | Identification must preserve this map | Narrow gap |
| Field-limit gap | Union of finite fields | Kₙᴹ(𝔽̄ₚ)=0 for n≥2, because each symbol descends to a finite stage with value 0 | Same colimit map required | Narrow gap |
| Adams/rational residual gap | ℙ¹, z=1−O(−1) | ψ²(1)=1; ψ²(z)=2z; CH⁰=ℚ, CH¹=ℚ | Weights 0,1 | Narrow gap |
| Étale descent residual gap | ℙ¹/𝔽̄₂, n=3 versus n=2 | H²(μ₃)=ℤ/3; H²(μ₂)=0≠ℤ/2 | Invertible coefficients required | Narrow gap |
| Procyclic H¹ formula | Trivial ℤ/3, compact ℤ_ℓ, discrete ℤ | H¹ and coinvariants: ℤ/3=ℤ/3; ℤ_ℓ=ℤ_ℓ; 0≠ℤ | Last coefficient excluded | Qualify everywhere |
| §1.1 chart comparison | Z=1 | Y²+a₁XY+a₃Y−X³−a₂X²−a₄X−a₆=0 | Affine equation recovered | Retain |
| §1.1 cover | Y=Z=0 in characteristics 2,3 | Cubic=−X³=0 implies X=0; no projective point | Missing-chart model rejected | Retain |
| §1.1 zeroSection_mem | O | Coordinates (0,1,0); residue degree 1 | Correct closed origin | Retain |
| §1.2 geometric integrality | Cusp y²=x³; field extensions | Possible polynomial-root degrees are ≤2 or ≥4, never 3 | Integral, including cusp | Retain headline |
| §1.2 dimension | Plane cubic | dim ambient=2, one equation gives dim=1 | Not dimension 3 | Retain |
| §1.2 cohomology | Smooth cubic and cusp | h⁰=1,h¹=1,χ=0; normalization of cusp has h¹=0 | Arithmetic genus retained | Retain |
| §1.3 isRegular | Smooth point versus cusp | Closed smooth stalk (dim,edim)=(1,1); cusp=(1,2) | Ellipticity needed | Retain |
| §1.3 DVR interface | t=0 on ℙ¹; generic point | ord(t)=1; generic stalk field, dimension 0 | Only codimension-one stalks are DVRs | Retain |
| §1.4 closedPointEquivPlace_compat | x²+2x+4=0,y=3 on 36a1 | x³=8, y²=9, degree=2; O has degree 1, ord(x)=−2 | Residue degree retained | Retain |
| §1.4 divisor transport | div(t) on ℙ¹ | Coefficients +1 at 0, −1 at ∞ on both sides | Sign fixed | Retain |
| §1.5 pointsDivisor_compat | E:y²=x³−x/𝔽₅ | 7 affine points+O=8; 2(2,1)=(0,0) on point and divisor sides | Same group law | Retain |
| §1.5 singular boundary | Cusp/𝔽₅ | 5 affine scheme points+O=6; nonsingular group points=5 | Ellipticity not dropped | Retain |
| §1.6 degree comparison | id,[3], Frobenius in char 3 | Degrees 1,9,3 | Generic rank agrees | Retain |
| §1.6 differential comparison | [3]/ℚ; Frobenius/𝔽₃ | Pullback factors 3 and 0 | Separability distinguished | Retain |
| §1.6 kernel comparison | [2] in char 0; Frobenius | Scheme ranks 4,p; geometric cardinalities 4,1 | Scheme rank is not point count | Retain |
| §1.6 divisor conorm | t=s² at zero | e=2,f=1; pullback[0]=2[0], ef=2 | Ramification kept | Retain |
| §1.6 zeroHom | Constant O versus constant P≠O | O maps to O versus P; pulled line classes both 0 | Pointing determines zero map | Retain |
| §2.1 rank–determinant | [O],[O_x],Spec F | (1,O),(0,O(x)); Pic(Spec F)=0, K₀=ℤ | Dimension 0 included | Broaden supplied scope |
| §2.1 rankDet_natural | t=s² | O(1) pulls to O(2); (1,1)→(1,2) | Correct pullback | Retain |
| §2.1 nonseparated boundary | Doubled line and plane | Pic line=ℤ, K₀=G₀=ℤ²; plane K₀(VB)=ℤ,G₀=ℤ² | Dimension matters | New Check |
| §2.1 doubled origins sign | div(t) | [0′]+[0″]=0; classes +1 and −1 in Pic=ℤ | Both origins retained | New Check |
| §2.2 eulerChar | ℙ¹, O(−1),O,O_∞ | χ=0,1,1; 0+1=1 in the exact sequence | Additivity | Retain |
| §2.2 pushforwardToBase | ℙ¹ O(2); elliptic O | 3=2+1; 0=1−1 | Euler, not rank | Retain |
| §2.2 Riemann–Roch constants | ℙ¹_𝔽₄ over 𝔽₂ | χ(O)=2; deg+1−g=1 | H⁰=base required | Retain |
| §2.3 classGroupEquivPic_functionField | ∞ and div(t) on ℙ¹ | O(∞) degree +1; O(0−∞) trivial | Correct sign | Retain |
| §2.3 open boundary | ℙ¹ and 𝔸¹ | Cl=ℤ and 0; ∞ absent on 𝔸¹ | Centres of places required | Retain |
| §2.4 picardDecomposition | O(P),O(O),O(P−O) | (1,P),(1,O),(0,P) | Both inverse maps recover coordinates | Retain |
| §2.4 origin boundary | Real anisotropic conic | Degree image 2ℤ; geometric degree image ℤ | Pointed splitting not generalized | Retain |
| §2.5 lineBundleDescent_injective | Real two-torsion P=(0,0) | O(P−O)≠0 before and after ℂ; twice=0 | Nonzero class retained | Concrete Check |
| §2.5 lineBundleDescent_of_rationalPoint | Real elliptic versus real conic | Elliptic invariant class descends to P; conic invariant degree 1 has no preimage | Point hypothesis detected | Concrete Check |
| §2.6 rankDet_ringEquiv | (0,1,O)² and (1,0,O)·(r,d,P) | (0,0,O) and (r,d,P) | Square-zero product | Retain |
| §2.6 derived point product | [O_x]² | Two-term resolution gives [k]−[k]=0 | No underived tensor substitution | Retain |
| §2.7 Weierstrass compatibility | P=(2,1)/𝔽₅ | [O_P]−[O_O]→(0,0,P); −P=(2,4)≠P | Concrete sign compatibility | Replace duplicate theorem |
| §3.1 curveLocalisation | div(t²+1),[O] | Divisor degrees 2−2=0; generic rank 1 | Exact tail normalized | Retain |
| §3.1 all closed points | {t,t²+1} | Residues (1,i,1), N(i)=1 but i≠1 | Rational-only sum fails | Retain |
| §3.2 curveBoundary_two_eq_tame | {2,t},{t,2} | 2 and 1/2; inverse boundaries reverse them | Same kernel/image, different values | Retain |
| §3.3 curveBoundary_one_eq_div | t²+1 | [V(t²+1)]−2[∞] | Valuation multiplicity matches | Retain |
| §3.3 curveTransfer_zero | Rational closed point | [x]→[O_x]→(0,O(x)) | Rank zero, determinant positive | Retain |
| §3.3 curveGenericRank | [O],[O_x] | 1 and 0; determinant degree of O is 0 | Rank replacement would fail | Retain |
| §3.4 curveLocalisation_restrict | ℙ¹→𝔸¹→𝔾_m | [0]−[∞]→[0]→0 | Residue projection | Concrete Check |
| §3.5 curveLocalisation_pullback | t=s²,{2,t} | Tame 2→4=2²; divisor[0]→2[0] | Exponent e correct | Retain |
| §3.6 curveLocalisation_transfer | ℚ(√2)/ℚ | N(√2)=−2,N(2)=4; degree on K₀=2 | Norm rather than restriction | Retain |
| §3.7 K2_curve_injective_rat | ∞_*{−1,−1} on ℙ¹_ℚ | Nonzero order 2, generic image 0, rational image 0 | Integral version false | Retain |
| §3.8 K2_curve_injective_finite | ℙ¹/𝔽₂ and quadratic residue | K₂=0; θ∈𝔽₄× has order 3, Nθ=θ³=1 | Residue sum not zero | Retain |
| §4.1 curveK1Image | Constant 2 and ∞-supported unit on ℙ¹_ℚ | Generic determinants 2 and 1 | Field-unit image | Retain |
| §4.1 curveSK1 definition | ℙ¹_𝔽₃,𝔸¹_𝔽₃ | Kernel orders 2 and 1 | Global versus affine distinguished | Retain |
| §4.1 curveSK1_eq_range_pushforward | ∞_*2 on ℙ¹_ℚ | Generic image 1, norm pushforward 2 | Supported summand detected | Retain |
| §4.1 curveSK1_eq_coker | ℙ¹_𝔽₃ | Cokernel=𝔽₃× of order 2=SK₁ | Correct quotient | Retain |
| §4.1 curveSK1_split | ℙ¹_𝔽₃ | K₁=C₂⊕C₂, determinant projection first C₂ | Splitting not identification | Retain |
| §4.1 curveSK1_norm | Degree-two point, u=i | N(i)=1 | Residue norm necessary | Retain |
| §4.1 affine stable SK₁ comparison | 𝔽₃[t] | Both kernels=0; units=C₂ inject into 𝔽₃(t)× | Same determinant kernel | Retain |
| §4.2 basePoint_pushforward | P=∞ on ℙ¹ | π_*P_*2=2; degree-two norm of i=1 | Identity versus norm | Retain |
| §4.2 basePoint_split | ℙ¹ | SK₁=∞_*F×, V=0 | Correct second summand | Retain |
| §4.2 basePoint_pullback_zero | P=x and P≠x | Self-intersection factor 1−1=0; disjoint fibre=∅ gives 0 | Both cases | Retain |
| §4.3 coniveauPage | Spec F; regular curve | Columns {0}; {0,1}; no possible d₂ target | Degeneration by index range | Retain |
| §4.3 coniveauFiltration | ℙ¹_ℚ,𝔸¹_ℚ,n=3 | F¹=C₄₈ and 0; F²=0 in both | Filtration not erased | Retain |
| §4.3 left cokernel | ℙ¹_ℚ,n=3 | coker ∂₄=C₄₈=F¹ | Correct left term | Retain |
| §4.3 quotient kernel | ℙ¹_ℚ,n=3 | K₃/F¹=C₄₈=ker ∂₃ | Not entire K₃ | Retain |
| §4.4 curveK3_extension | ℙ¹_ℚ | 0→C₄₈→C₄₈²→C₄₈→0 | Both ends nonzero | Retain |
| §4.4 elliptic base contributions | 37a1/ℚ | Pullback/pushforward cross terms 0, diagonal composites id; C₄₈² embeds | Not just K₃ind(ℚ)=C₂₄ | Retain |
| §4.5 weightComponent | ℙ¹,K₀,ψ² | ψ²(1)=1,ψ²(z)=2z | Weights 0,1 | Retain |
| §4.5 weightProjector | Same basis | π₀=(2−ψ²): values (1,0); π₁=ψ²−1: (0,1) | Idempotents sum to id | Retain |
| §4.5 weight bound | n=0; j>n+1 | Allowed j=0,1; codimension>dim Δⁿ×X gives 0 cycles | Bound matches dimensions | Retain |
| §4.5 weightComponent_motivic | ℙ¹,n=0 | Weight spaces ℚ,ℚ equal CH⁰,CH¹ tensored ℚ | Same geometric degrees | Retain |
| §4.5 regularCurveMotivicTower | (y−x)²=t over 𝔽₂(t) | Original ring regular; extension ring L[x,ε]/ε² not regular | Adapter domain retained | Retain |
| §4.5 tower layers | ℙ¹, weight 0,1 in K₀ | Layers CH⁰=ℤ,CH¹=ℤ; higher codimension groups 0 | Layer indexing | Retain |
| §4.5 tower convergence | Same K₀ | Two nonzero graded terms, reconstruction ℤ⊕ℤ | Finite filtration witness | Retain |
| §4.5 tower Adams compatibility | Same layers | ψ² acts by 1 and 2 | Correct layer action | Retain |
| §4.5 smoothComparison | ℙ¹ over perfect field | Support and cycle models both give rank 1 and degree 1 generators | Same generator normalizations | Import shared owner |
| §4.5 finiteCoeff generalized weights | 0→ℤ/5→ℤ/25→ℤ/5→0, ψ=12 | Endpoints=2, middle ψ−2=10≠0, square=100=0 | Squared kernel needed | Retain |
| §4.5 pullback on singular base change | Regular inseparable example above | Pullback preserves ψ² equations; new nilpotent ε²=0 | No regular decomposition asserted after extension | Retain gap |
| §4.5 rational denominator | ℙ²,z=1−O(−1) | ψ²z=2z−z²; eigenvector 2z+z²; index 2 lattice | Integral eigensplitting fails | Retain |
| §4.6 K3ind_eq_weight_two | ℚ,ℚ(i) | Weight-two dimensions 0,1; rational Milnor part 0 | Agrees with r₂ | Direct supplier inputs |
| §4.6 K3_curve_weights | ∞_*K₃(F) on ℙ¹ | Field weights 2,3 become 3,4 | Gysin shifts by 1 | Retain |
| §5.1 KPullback | Generic restriction and id | [O]→1; identity sends each class to itself | No properness needed | Retain |
| §5.1 KPushforward | π:ℙ¹→point | O(−1)→0,O(2)→3 | Euler transfer | Retain |
| §5.1 functorial composites/base change | Two degree-two field extensions | K₀ transfer composite 2·2=4; identity base change preserves 4 | Correct variance | Retain |
| §5.1 KPushforward_eq_transfer | ℚ(√2)/ℚ,K₁ | 2→4,√2→−2 | Actual field norm | Retain |
| §5.1 isogeny_finiteFlat | [2] in char 2; zero map | Finite-flat rank 4; zero map has positive-dimensional fibre | Zero map excluded | Retain |
| §5.1 improper pushforward boundary | 𝔸¹→ℙ¹ | j_*O permits all pole orders at ∞, unbounded; O has pole bound 0 | Coherent pushforward unavailable | Retain |
| §5.2 isogeny_pushPull | [3]/ℚ; separable degree 2 | (1,0,O)→(9,0,O); →(2,0,P_f≠O) | Integral determinant detected | Concrete Check |
| §5.3 pushforwardStructureSheaf_class | Degree d elliptic isogeny | rank=d; determinant degree χ(E′)−dχ(E)=0−0=0 | Pic⁰ coordinate | Retain |
| §5.3 rankDet_action | Input (1,0,O), then rank 0 | (d,0,P_f); rank-zero input (0,e,P)→(0,de,dP) | Both iff directions witnessed | Retain |
| §5.3 separable determinant | Nontrivial double cover | L²=O but L≠O; L⊗ℚ=0 | Rational scalar action only | Retain |
| §5.3 odd multiplication | m=1,3 | gcd(m,2)=1; determinants trivial; degrees 1,9 | Exact scalar action | Retain |
| §5.3 degree-two obstruction | E:y²=x³−x→y²=x³+4x | h⁰(L)=1−1=0; trivial line would give 1 | L nontrivial | Retain |
| §5.4 projectiveLine_K | O(−1),O,O(1) | Coordinates (0,1),(1,0),(2,−1); inverse returns degree −1,0,1 | Basis sign fixed | Retain |
| §5.4 projectiveLine_finiteField | q=2,i=1,2 | K₂=0,K₁=0,K₃=C₃² | Correct finite field computation | Retain |
| §5.4 elliptic_K0_generated_iff | #E(𝔽₂)=5 versus 1 | Residual summand C₅ versus 0 | Both directions | Retain |
| §5.5 closedPoints_coprimeDegrees | ℙ¹/𝔽₂,degrees 2,3 | Counts 1 and 2; gcd(2,3)=1 | No rational-point requirement | Retain |
| §5.5 degreeOneZeroCycle | z=[x₃]−[x₂], and zero cycle | Degrees 3−2=1 and 0 | Signed coefficients necessary | Retain |
| §5.5 zeroCycle_splitting | Same z | Transfer composite 3−2=1; one degree-two point gives 2 | Retraction normalized | Retain |
| §5.5 zeroCycle_SK1_section | Unit u, same z | Norm exponents 3−2=1, output u | Correct section | Retain |
| §5.5 BMS_functionField | 𝔽₃[t,t⁻¹] | SK₁=0,K₁=C₂×ℤ | Not finite K₁ | Retain |
| §5.5 curveFiniteGeneration | Same ring; ℙ¹ | Affine K₁=C₂×ℤ fg; projective K₁=C₂² finite | Uses independent homology input | Retain gap |
| §5.5 reciprocitySequence_exact | q=3, degrees 2,3 | gcd(8,26)=2=q−1; for q=2 target order 1 | Extra injectivity input needed | Retain |
| §5.5 tameKernel_finite | ℙ¹/F_q | K₂=0, order 1, multiplication by p bijective | Empty kernel allowed | Retain |
| §5.6 constantFieldReduction | ℙ¹_𝔽₄ over 𝔽₂ | Exact constants 𝔽₄; K₁=C₃², order 9 rather than 1 | Base-field replacement necessary | Retain |
| §5.6 harder | Above and disjoint union with ℙ¹_𝔽₂ | Orders 9 and 1·9=9 | Disconnected case retained | Supplier comparison input |
| §5.7 curveEInvariant | Finite-field summand | u∈K₁(F_q) maps to u, not u^q or 1 | Specified section | Retain |
| §5.7 curveCoefficientEdge_split | q=3,ℓ=2,i=1 | Frobenius sends 1/4→3/4=−1/4 in each section summand | Nontrivial action retained | Retain |
| §5.7 curveEInvariant_naturality | Constant extension degree 2, q=3 | F²(1/4)=9/4=1/4 | Correct arithmetic power | Retain |
| §5.7 geometricK_galoisModule | q=2,ℓ=3 | Integral K₁ geometric has two divisible summands; arithmetic K₁=0 | Bar essential | Correct locator |
| §5.7 coefficient twist | i=1 | Coefficient K₁ is J[ℓ∞](0); integral K₂ is J[ℓ∞](1) | Twists differ by 1 | Retain |
| §5.8 cohomologyDescent | ℙ¹,q=3,j=2 | Rational eigenvalues 9,3 in degrees 0,2; F−1=8,2 | Invertible operators | Retain |
| §5.8 j=0 boundary | Spec F_q,ℚ_ℓ | H¹=Hom_cont(Ẑ,ℚ_ℓ)=ℚ_ℓ≠0 | No unrestricted invariants formula | Retain |
| §5.8 elliptic duality witness | q=3,a=0,j=2 | Determinants 3,1/3,3,27 as above | Supplier variance agrees | Retain |
| §5.9 Ktheory_descent | n=1 and n=0 over 𝔽₃ | K₁=C₂² maps to invariants C₂²; K₀ includes ℤ² and is infinite | Positive-degree finiteness only | Retain |
| §5.10 twistedFrobeniusKernel | Zero and rational order-two P/𝔽₃,i=1 | qP=3P=P; zero killed by m=1 | Nontrivial and zero members | Retain definition |
| §5.10 subgroup addition | Annihilator orders 2 and 5, p=3 | Product 10 coprime to 3; 10(P+Q)=0 | Closure | Retain |
| §5.10 subgroup negation | 2P=0,qP=P | 2(−P)=0,q(−P)=−P | Closure | Retain |
| §5.10 baseChange_mem iff | Rational order-two P/𝔽₃,i=1 | (3−1)P=2P=0 | Equation agrees | Retain |
| §5.10 map/equiv functoriality | Identity field map, P=(0,0) | P→P, order 2 and 3P=P preserved | Uses pointed group maps | Retain |
| §5.10 characteristic torsion exclusion | (0,1) on ordinary E/𝔽₂ | Order 2; no positive odd annihilator | Not in B₀ despite Frobenius fixing P | Retain |
| §5.11 finiteFieldK_odd | q=2,i=1,2; q=3,i=1 | Orders 1,9,4 = (q^i−1)² | Correct q=2 boundary | Retain |
| §5.11 finiteFieldK_even | q=2,a=−2,i=1 | det(1−2π)=13, lattice kernel 0, torsion kernel order 13 | Cokernel, not lattice kernel | Retain |
| §5.11 card_twistedFrobeniusKernel | (q,a)=(2,−2),(2,2),(3,0) | D₁=13,5,28; D₂=41,25,244 | Same computed polynomial | Retain headline |
| §5.11 positivity and p exclusion | Same examples | Positive orders; 13,41,5,25≡1 mod2;28≡1 mod3 | Differential 1, separable | Retain |
| §5.11 i=0 boundary | Ordinary E/𝔽₂ with #E=4 | B₀ prime-to-2 part has order 1; D₀=#E=4 | i≥1 needed | Retain hypothesis |
| §6.1 RegularProperModel | Smooth 37a1/ℤ[1/37]; point blow-up | Both have marked generic E; exceptional fibre of blow-up has dimension 1 | Both are models | Real bundle restored |
| §6.1 generic marking over F | F=ℚ(s), automorphism s↦s+1 | Identity triangle sends s→s; twisted triangle sends s→s+1 | Absolute iso insufficient | Real equality retained |
| §6.1 fibre/components/multiplicity | Local π=u t^m, m=1,2 | ord_Cπ=1,2; fibre lengths 1,2 | Nonreduced fibre allowed | Retain |
| §6.1 weierstrassModel_regular_iff | 37a1 and 11a1 | F(5,18)=222=6·37 not 37²-divisible; F(5,5)=0,F_x=−55,F_y=11 | First regular, second singular | Retain |
| §6.1 nonminimal equation | y²=x³−81x at 3 | Every defining term in (3,x,y)²; edim 3 versus dim 2 | Good generic reduction insufficient | Retain |
| §6.1 Néron comparison | 37a1 over ℤ and ℤ[1/37] | Nodal fibre torus dimension 1 nonproper; inverted model smooth proper | Properness required | Retain |
| §6.2 excellentSurfaceResolution | Spec ℤ[t]; xy=z² at vertex | Identity modification; singular vertex edim 3,dim 2, regular complement fixed | Specified regular locus | Retain |
| §6.2 weierstrassModel_resolution | 37a1,11a1 | Identity versus nonidentity over 11; same marked generic fibre | Additional assertion differs from existence | Replace duplicate ownership |
| §6.2 comparison to supplied model | Model and its point blow-up | Common model=blow-up; maps blow-down,id | No chosen-resolution equality | Add comparison |
| §6.3 genericFibreInclusion | Identity marking | i followed by base map equals C→Spec F→Spec O | Both send scalar a to a | Real definition restored |
| §6.3 Hom | 37a1 id versus involution | Generic (0,0)→(0,0) versus (0,−1) | Only id has fixed marking | Real bundle restored |
| §6.3 Hom.ext | Identical underlying scheme map | Data fields agree; proof fields carry no additional choices | One model map | README API only |
| §6.3 Hom.subsingleton | Marked maps to separated model | Agree on dense E, hence same total map; endomorphism set has 1 element | Density essential | README API only |
| §6.3 IsMinimal | Minimal M; Bl_PM | Outgoing maps from M are iso; Bl_PM→M has ℙ¹ fibre | Blow-up rejected | Real predicate restored |
| §6.3 isomorphism invariance | Identity-marked M≅N | Outgoing f transports to composite of 3 isomorphisms | Minimality preserved | Retain |
| §6.3 toLocalModel/Hom/totalIso | ℤ→ℤ_(37)→ℚ | Both generic base changes give ℚ and same E, id marking | Native local model | Prose names |
| §6.4 regularModels_linked | M and Bl_PM | Common X=Bl_PM, maps (blow-down,id) | Correct arrow directions | Concrete marking Check |
| §6.5 globalExceptionalContraction | Blow-up of Spec ℤ[t] at (2,t) | Exceptional ℙ¹_𝔽₂ normal O(−1); contraction recovers original | Regular target | Retain |
| §6.5 exists_locallyMinimal | One blow-up and smooth model | Exceptional-component counts 1→0 and 0→0 | Finite contractions | Retain |
| §6.5 smooth-fibre control | Smooth elliptic fibre | Normal degree 0, not −1 | No false contraction | Retain |
| §6.6 globalBlowdownFactorisation | Constant map on exceptional curve; its identity | Image dimensions 0 versus 1 | First factors, second excluded | Retain |
| §6.6 locallyMinimal_terminal | Bl_PM and M minimal | Exactly one marked Bl_PM→M; exactly one M→M=id | Terminal form matches Lean | Headline restored |
| §6.6 minimality_local_criterion | Minimal 37a1; its point blow-up | Conditions (i),(ii),(iii) all true versus all false | Both directions distinguished | Retain |
| §6.6 exists_minimalRegularProperModel | S=∅ and S={37} | Regular nodal 37a1 and smooth 37a1 are minimal | Finite S includes empty | Headline restored |
| §6.6 genus-zero boundary | ℙ¹ over DVR with markings id and diag(π,1) | det valuation 1 cannot be made 0 by scalar (changes by 2v(c)) | Unique marked comparison fails | Retain ellipticity |
| §6.7 minimal_unique | Same marked M twice; involution | Unique allowed iso=id; involution sends (0,0)→(0,−1) | Marked uniqueness | Headline restored |
| §6.7 minimal_localisation | Invert 37; S=S′ | Nodal fibre removed; identity comparison when sets equal | Direction preserved | Retain |
| §6.8 integralPart/integralPartS | Zero class, S=∅,{2} | 0 in both images; S=∅ image equals integralPart | Definitions agree | Retain |
| §6.8 image monotonicity | S={2}⊆{2,3} | A class with nonzero residue only at 3 excluded before, permitted after inversion | Inclusion direction | Retain |
| §6.8 finite_S_exhaustion | Class descending over ℤ[1/6] | Lies in S={2,3}; zero already in S=∅ | Finite support | Retain |
| §6.8 integralPart_le_unramified | Certified horizontal symbol | All horizontal tame values=1, hence rational residues 0 | Correct kernel | Retain |
| §6.8 model independence | Point blow-up f and generic inclusion | Generic pull/push comparison both id; image inclusions both ways | Regular Cartan maps needed | Retain |
| §6.9 goodPrime_no_condition | Good residue 𝔽₂,𝔽₃ | K₁ fibre orders 1 and 4; rational groups both 0 | Integral surjectivity only automatic in first test | Retain |
| §6.10 integralPart_iff_vertical | Constant {−1,3}, multiplicity m | Residue (−1)^m has order ≤2, rational residue 0 | Literal value 1 not necessary rationally | Retain |
| §6.10 vertical obstruction | 1/w∈𝔽₃(w)× | div((1/w)^m)=m([∞]−[0])≠0 for m≠0 | Infinite order | Retain |
| §7.1 tameValue | f=2t²,g=3t³ | ord quotient 2·3−3·2=0, value 8/9 | No undefined residue | Retain |
| §7.1 tameValue_eq_leading | Replace t by 5t | (2/25)³/(3/125)²=8/9 | Uniformizer independent | Retain |
| §7.1 tameValue_of_ord_eq_zero | Unit residues 2,3 | 2⁰/3⁰=1 | Unit case | Retain |
| §7.1 multiplicativity | {2·3,t} | 6=2·3 | Correct first-variable product | Retain |
| §7.1 tameValue_swap | {2,t} versus {t,2} | 2·(1/2)=1 | Inversion | Retain |
| §7.1 tameValue_one_sub | {t,1−t} at 0,1,∞ | Values 1,1,(−1)(−1)=1 | Both sign factors needed | Retain |
| §7.1 SymbolCandidate | Empty and Steinberg singleton | Empty support,0 image; coefficient 1≠0 but Steinberg image 0 | Formal carrier distinct | Retain |
| §7.1 SymbolCandidate.tame | Coefficients 1,−1; equal symbols | Values 2/3; equal-symbol cancellation gives 1 | Negative exponents | Retain |
| §7.1 toK2 comparison | Steinberg singleton | K₂ image 0, every tame value 1 | Map factors through quotient | Prose name |
| §7.2 SymbolCertificate | Empty candidate; {2,t} | Empty support succeeds; residue 2 at 0 excludes certificate | Both directions of existence iff | Prose name |
| §7.2 tame_eq_one_everywhere | 11a3 candidate | (−1,−1,1,1)²=(1,1,1,1) | Local data cover all poles | Retain |
| §7.2 sound | Same candidate | Generic boundary tuple (1,1,1,1), hence class in kernel/image | Correct localisation use | Retain |
| §7.2 norm-only counterexample | 36a1,{x−1,−1} | Degree-two value −1≠1, norm 1 | No certificate | Retain |
| §7.3 IntegralCertificate | 11a3,S′={11} | Vertical orders x=y=0, tame 1; corrected horizontal values 1 | All codimension-one places covered | Retain |
| §7.3 IntegralCertificate.sound | Unit constants c,d | Horizontal orders 0; vertical orders 0; tame 1 | Integral class | Retain |
| §7.3 empty-prime boundary | Nodal model, S′=∅ | Nodal fibre not smooth | Empty set cannot certify smoothness | Retain |
| §7.4 tame_last_point | 11a3, last point O | Other residues all 1, norm at O identity, final residue 1 | Degree 1 matters | Retain headline |
| §7.4 higher-degree boundary | Degree-two point on 36a1 | Residue −1, norm (−1)²=1 | Stronger conclusion false | Retain |
| §7.4 inseparable multiplicity | {s,t²−s} over 𝔽₂(s) | Values s,s⁻²; norms s²s⁻²=1, unweighted product s⁻¹ | Norm multiplicity required | Retain |
| §7.5 blochRho | Full rational E[2]; C=1 | div(1/y)=3O−P₀−P₁−P₋₁; C=1 divisor 0 | Degree and point sum 0 | Retain |
| §7.5 torsionFunction_divisor_compat | P=(0,0) on y²=x³−x | div(x)=2P−2O; P−O nonprincipal | Annihilator C required | Retain |
| §7.5 uniqueness/base change | Scale ρ by c≠0 | div(cρ)−div(ρ)=0; after extension still 0 | Choices differ by constants | Retain |
| §7.5 characteristic torsion boundary | Ordinary E/𝔽₂,C=2 | Geometric E[2] has 2 points, sum nonzero P | Not full (ℤ/2)² | Retain prime-to-characteristic hypothesis |
| §7.6 blochCorrection | C=3,c=2 at P and O | 8·1/8=1 at P; inverse products give 1 at O | Wrong correction order gives 64 | Retain headline |
| §7.6 finite trivial subgroup | T={O},S=∅ | Principal divisors supported only at O have degree 0, hence 0; tame 1 | No nonempty-family assumption | Retain |
| §7.7 blochClassLift | Formal corrected A=3[s]+[t] | A/3 has coefficients 1,1/3; multiplying by 3 gives 3,1 | Division retained | Prose name |
| §7.7 blochClass quotient | Constant {s,t} over ℚ(s,t) | t-residue s infinite order; class becomes 0 only in quotient | Actual lift not canonical | Prose name |
| §7.7 correction/function independence | Change correction by {h,ζ}, ζⁿ=1 | n{h,ζ}={h,1}=0; constants also killed by Q | Difference 0 in quotient | Retain |
| §7.7 blochClass_eq_Bloch | C=3 on formal A | 3(A/3)=A, not 3A | Source normalization respected | Retain waived locator |
| §7.7 C=2 obstruction | {1/y,x} on y²=x³−x | Values −1,1,−1,1; doubling quartic at ±1 gives 4,4≠0 | Unscaled obstruction nonzero | Retain |
| §7.7 corrected C=2 lift | 2{1/y,x}+{x,−1}+{x+1,−1} | Every local value 1; lift=A/2 | Division in tame kernel | Prose name |
| §7.7 three-point relation | Orders 2,3,6 | lcm 6, ratios 3,2,1, gcd 1 | Primitive span rank at most 1 | Retain |
| §7.8 transfer_tame | Quadratic constant extension, β={x−√2,y} | Nβ={x²−2,y}; at degree-two point (1/4)(2x₀)=x₀/2=1/x₀ | Norm-residue square | Retain |
| §7.8 transfer composite | Same extension, K₁ input 2 | res(2)=2,N(2)=4=2²; res(Nβ)=β+σβ | Degree and conjugates | Concrete Check |
| §7.9 galoisDescent | Quadratic and identity extensions | Nres=2, resN=1+σ; identity case both 1 | Rational inverse N/2 | Retain |
| §7.9 integral boundary | Constant a={−1,−1},order 2 | Nres(a)=2a=0 | Integral injectivity not inferred | Retain |
| §7.9 quotient descent | Two lifts differing by {s,t} | Difference nonzero before quotient, 0 after quotient; averaging factor 1/2 | Independent quotient class | Retain |
| §7.9 descent/integrality distinction | DGJK class u=1/3 defined over ℚ | G-invariant, residue 1/w of infinite order | Descent does not imply integrality | Retain |
| §8.1 E₄ equation/torsion | x=4,y=±20; x=−4,y=±12 | Equation differences 0; each doubles to (0,0) | Order-four points present | Retain |
| §8.1 discriminant | u=4 | 16·4⁴·15²=921600; fourth power would give 207360000 | Squared factor correct | Retain |
| §8.1 divisor v | E₄ | Orders at −16,0,−1,O: +1,−1,−1,+1; sum 0 | Full support | Retain |
| §8.1 divisor w | E₄ | Numerator intersection (x+1)(16−x²)=0; cancelled −1, zeros (4,20),(−4,−12), opposite poles | No omitted points | Retain |
| §8.1 divisor h | E₄ | Orders at (−1,0),(4,−20),(−4,−12),O: +1,+1,−1,−1 | Degree 0 | Retain |
| §8.1 example_certificate_E4 | Ordered eight-point support | Both symbols give (−1,1,−1,1,1,−1,1,−1); products all 1 | Certificate | Retain |
| §8.1 example_E4_not_constant | P=(0,0),Q=(−16,0) | h(P)=1,h(Q)=5; specializations 0,{−1,5}; 5-adic tame −1≠1 | Nonconstant class | Retain |
| §8.2 example_degree_two_residue | 36a1,{y−3,x} | Values 1/2,1/x₀,−2,−4,1; N(1/x₀)=1/4; product 1 | All closed points necessary | Retain |
| §8.2 unnormed comparison | x₀=−1+√−3 | Product 4/x₀=−1−√−3≠1 | Raw product wrong | Retain |
| §8.3 example_bad_fibre(a) | 11a3 at 11 | ord_D(x)=ord_D(y)=0, vertical tame 1; S′={11} | Integral certificate | Retain |
| §8.3 example_bad_fibre(b) | u=1/3,V=0 component | 4vw=−3(v²−1)(w²−1), ord(v)=1,ord(w)=0, residue 1/w | Infinite-order obstruction | Retain |
| §8.3 multiple/denominator boundary | m≠0 versus 0; u=4 versus 1/3 | div(w^−m)=m([∞]−[0])≠0 versus 0; 4u=16 versus 4/3 | 2α integral only in stated positive example | Retain |

## Maintainer consequences

The acceptance file has seven headlines and eight real definitions/structures/abbreviations; it contains no examples, API admissions, sorried data, options or additional imports. The model structure uses native schemes because Tau Ceti’s supplied Model is DVR-local. Its broader excellent-Dedekind statements remain in the README rather than a weakened Lean encoding.

No layer or merge-order change is needed. Four supplier gaps remain: field-motivic-comparisons, motivic-k-comparisons, function-field-steinberg-homology and general-scheme-adams-pullback. The first two requests are strictly narrower. Suppliers must settle the remaining requests in their own files; this report does not assert acceptance of those contracts.

Downstream readers of K0Elliptic.addEquiv should import KTheoryLowDegrees §12.4 and use K0Elliptic.weierstrassCompatibility for the concrete Weierstrass diagram. Readers of the locally owned geisserLevine/geisserLevine_filteredColimit should instead use KTheoryFiniteLocalFields §5.17. General exists_regularProperModel is the RelativeJacobiansAndIntegralCurveModels §5.1 theorem; the retained equation-specific target is weierstrassModel_resolution. No Bloch-class normalization or downstream class name changed. No commit, push, issue or pull-request write was made.
