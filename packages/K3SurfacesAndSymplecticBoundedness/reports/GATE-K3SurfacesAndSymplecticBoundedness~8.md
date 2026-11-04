# Human review response

## H01 (CBirkbeck) — applied differently

The implicit proper-base specialization is now an explicit restriction of the same genus-one carrier, with unchanged morphism, generic fibre, schematic fibres and localized model, three interface laws and three discriminating Checks in `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:752`; the ownership and export clauses at lines 15 and 1385 identify every shared companion stage. The companion at `e974688` still independently constructs these objects and contains no reference to this supplier, so the requested companion-side transfer remains unresolved: its files are outside this job's authorized edits, and the local adapter does not discharge that integration finding.

## H02 (CBirkbeck) — applied differently

The existing contracts now explicitly distinguish direct from transitive suppliers and display IndexTheory I7.3 → K3Surfaces K1 → K2 and the topological suppliers → ComplexComparisonPartII C6.1 → C6.3 → C6.6 in `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md:72` and line 186. The live description still omits K3Surfaces, IndexTheory, TopologicalSheafCohomology and CharacteristicClasses and incorrectly says that other authors' proposals enter only transitively; correcting that description and its integration plan remains unresolved because neither is an authorized edit here.

### Integration evidence and remaining corrections

Commit `8bc8863` changes only `TauCetiRoadmap/K3SurfacesAndSymplecticBoundedness/README.md`; `Suggested.lean` is unchanged. No companion, pull-request description, merge-order file or remote comment was modified, and nothing was pushed. Both approval-blocking integration findings remain open.

The shared owner remains the generic prefix of §6.0b, ending before “Rank-five K3 pencils” at line 831. Its generic assertions require no K3 hypothesis; §§1.5 and 4.2 appear only to explain the subsequent K3 specialization. Making the companion a supplier would reverse the required direction. Its excellent-DVR extensions beyond curve localizations, arithmetic and rational-surface applications, and additional characteristic-two refinements remain there.

| Shared object | Owner here | Companion construction still requiring reuse at `e974688` |
| --- | --- | --- |
| Arbitrary-field genus-one fibration, minimality, localization, field change | §6.0b, lines 735–740; proper-base adapter, lines 752–764 | `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarietiesPartII/README.md:3799`, §2.1: replace its independent carrier by the proper-base restriction, retaining the same native model |
| Geometric Kodaira realization | §6.0b, line 776, using EllipticCurves Layer 4 `ReductionSymbol` | Companion §§2.3 and 2.5: specialize the supplied realization and classification |
| Wild canonical formula and intrinsic torsion-free quotient | §6.0b, line 791 onward | Companion §4.1, line 8862: specialize the supplied formula, retaining wild torsion and no chosen splitting |
| Hodge-line degree | §6.0b canonical-formula API | Companion §4.2, line 8884: specialize deg L = −χ(O) − length(T) |
| Quasi-elliptic Picard group and regular completion | §6.0b quasi-elliptic and Jacobian constructions | Shared part of companion §4.16, lines 9230–9242 |
| Regular minimal Jacobian with zero section | §6.0b Jacobian construction | Curve-base shared part of companion §4.17, lines 9272–9283; retain its additional excellent-DVR generality |

The adapter is the restriction by properness of C→Spec k, not a second bundle of geometric data. Properness of X follows from composition with f; all other objects are formed from the unchanged f. The supporting source is enriques-one line 17405 through line 17431, §4.1, p.362, with the common canonical and Jacobian statements at enriques-one line 17528 and line 18320. No new literature or source-manifest entry is needed.

Ownership was searched by object in main, the indexed open roadmap heads, the supplied sibling checkouts and the board packages. StableReduction's smooth-generic DVR models and EllipticCurves' symbol type remain imported; neither supplies this entire arbitrary-field global carrier with its proper-base restriction and regular nonsmooth Jacobians. The board package `packages/EnriquesSurfacesAndIntegralNonexistence/README.md` at `9db3d35`, lines 63 and 71, retains an older SchemeAndStackFoundations Part II transfer contract for the shared geometry, rather than independently constructing it; that external ownership wording also needs alignment with §6.0b, and was not changed here. This roadmap owns the shared prefix because it is required before its K3 applications and precedes the companion in the given order; there is no reciprocal premise.

The following is the verified minimum for correcting the live prerequisite description, not certification of the complete transitive closure:

| Proposal and verified indexed head | Classification and required edge | Checkable evidence |
| --- | --- | --- |
| K3Surfaces, #1285, `43784f8`, author kim-em | Direct: Conventions, K0, K0.A and K1–K2 → this roadmap | Own README lines 68–74; `TauCetiRoadmap/K3Surfaces/README.md`, Conventions, K0, K0.A, K1 and K2 |
| IndexTheory, #1077, `819f43f` | Transitive: I7.3 → K3Surfaces K1 → K2 → this roadmap | `TauCetiRoadmap/K3Surfaces/README.md:52`; `TauCetiRoadmap/IndexTheory/README.md`, I7 item 3, actual Dolbeault symbol and Todd-index normalization |
| TopologicalSheafCohomology, #973, `f06755a` | Transitive: TS3.1–TS3.3 and TS3.7 → ComplexComparisonPartII C6.1 → C6.3/C6.6 → §3.1 here | `TauCetiRoadmap/ComplexComparisonPartII/README.md:4109`, C6.1 Needs; C6.3 Needs at line 4209 and C6.6 Needs at line 4377 |
| CharacteristicClasses, #896, `d077cb4` | Transitive: C1.2/S0–S5 → the same C6.1 → C6.3/C6.6 chain | The same C6.1 Needs and its support/CW comparison paragraph; the shared-domain and controlled-collar hypotheses remain present |

ComplexComparisonPartII was read at indexed head `2d50a88`. All four omitted roadmap folders are absent from both active and completed roadmaps at audited main `eafdde47e47e067afa9c64faddc70703a69c7c56`; their indexed proposals are new roadmaps. The live description was read and still names neither those four proposals nor their stage edges, while calling the direct suppliers “ours” and every other non-main README-named roadmap a consumer. K3Surfaces is a direct prerequisite regardless of authorship; no Lean import is needed for a mathematical supplier contract to count. NoncommutativeAndEquivariantIwasawa #1307 remains correctly scoped to §0.1, including its first-congruence-subgroup Check, and contributes no later Iwasawa arithmetic premise.

### Signature, citation and pinned-library checks

Every actual declaration was checked together in one fresh scratch elaboration with `#check @name`, then compared with its README statement. All nine signatures agree and retain their explicit field, scheme morphism and K3 hypotheses; none changed. The supplied extraction's tenth entry, `group`, comes from the words “class group” in a docstring and is not a declaration. The fresh elaboration also resolves both newly cited properness instances.

| Declaration | README agreement of the elaborated type |
| --- | --- |
| `differentialForms` | §1.1: explicit k, Field k, X, f and exterior degree p; native sheaf exterior power |
| `IsK3` | §1.1: the same f supplies relative dimension 2, properness, geometric integrality, existential canonical triviality and zero H¹(O) |
| `isK3_fieldExtension_iff` | §1.2: both fields and Algebra k K remain; both directions use the actual pullback |
| `IsK3.noVectorFields` | §2.3: explicit IsK3 hypothesis; zero H⁰(Ω¹), H⁰((Ω¹)∨) and H²((Ω¹)∨) |
| `IsK3.hodgeNumbers` | §2.4: explicit IsK3, p and q; finite-dimensionality and the entire diamond, including all other indices |
| `geometricPicardRank` | §4.3: integral finrank of native line-bundle classes on the algebraic-closure pullback |
| `IsK3.picardGroup_finiteFree` | §4.2: both freeness and finite generation of the native Picard group |
| `IsK3.picardRank_bounds` | §4.4: positive arithmetic rank ≤ geometric rank ≤22 and characteristic-zero bound ≤20 |
| `IsK3.boundedPicardDescent` | §4.6: intermediate field, finite-dimensionality, separability, explicit GL₂₂(𝔽₃) bound and equality of ranks |

The actual package checkouts match Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Relevant definitions and supplied facts were read at these pins:

| Native object | Exact location and what it supplies |
| --- | --- |
| Properness | `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean:41`: separated, universally closed, locally finite type; composition instance at line 57 and base-change instance at line 71. Properness of the base is a separate hypothesis |
| Geometric integrality | `Mathlib/AlgebraicGeometry/Geometrically/Integral.lean:40`: all field fibres are integral, so nonempty; it asserts neither smoothness nor properness |
| Relative differentials and exterior powers | `TauCeti/AlgebraicGeometry/Modules/Differentials/Basic.lean:85` and `TauCeti/Algebra/Category/ModuleCat/Sheaf/ExteriorPower.lean:49`; sheaf operations precede global sections |
| Cohomology and its scalar action | `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean:61` and `TauCeti/AlgebraicGeometry/Cohomology/Module/Base.lean:45`; finite-dimensionality is a theorem conclusion, not part of this carrier |
| Native Picard carrier | `TauCeti/AlgebraicGeometry/LineBundle/Class.lean:50`; no independent Picard group is introduced |
| DVR model | `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/Basic.lean:44`: flat, finitely presented model with specified generic-fibre isomorphism; separate `Model.IsProper` at line 72. It includes neither regularity, minimality nor generic smoothness |
| Model change of coefficients | `TauCeti/AlgebraicGeometry/Curves/StableReduction/Model/BaseChange.lean:66`: the finite-DVR-extension operation and its specified generic-fibre comparison |

The refreshed citation resolver finds no unresolved cross-roadmap citations or local acceptance-test identifiers. Its outside-library search was unavailable in that invocation, so the new Mathlib names were independently confirmed at the pin and by elaboration; the supplied original six leads are five declarations of this roadmap and the real supplier target `Crystalline.wittCohomology_V_complete` in CrystallineCohomology CR.4.7, not missing pinned declarations. The supplier contracts were checked against main or the indexed new-roadmap heads, including the exact stage edges above. Main-branch shape examples read were `Completed/EffectiveBounds/README.md`, `TauCetiRoadmap/SymplecticGeometry/README.md` and `TauCetiRoadmap/RepresentationTheory/README.md`.

### Adversarial mathematics record

Rows give evaluated witnesses or explicit conditional numerical tests, not proofs from an admitted Lean build. Retained hypotheses were compared with all nine elaborated signatures; the added adapter has no Lean stand-in because its genus-one carrier is unavailable at the pins. In the table, “retained” means the calculated value agrees with the stated boundary, with no mathematical change to that target.

| Statement | Instances tried | Computed values on each side | Result and change |
| --- | --- | --- | --- |
| Fixed-universe, nontrivial-field and geometric-fibre conventions | Empty scheme; Spec field; nonreduced thickening | Empty has 0 points and is not integral; a field has 1≠0; a square-zero element ε has ε²=0 with ε≠0 | Nonemptiness and integrality exclude the junk carriers; retained |
| Nonnegative exterior degrees and zero higher forms | Rank-two frame, p=0,1,2,3 | Exterior ranks 1,2,1,0; tensor-cube rank 8 | Exterior convention retained |
| Bilinear versus half-norm convention | Quartic H; rational curve C | B(H,H)=4=2·2; B(C,C)=−2=2·(−1) | Sign and factor 2 retained |
| Signature and signed determinant | Diagonal real signature (1,21) | 21 negative eigenvalues give determinant sign (−1)²¹=−1 | Negative rank-22 discriminant retained |
| Positive cup trace and Tate twist | Quartic H and geometric point | tr(c₁(H)²)=4; point trace=1; opposite pairing gives −4 | Positive pairing retained |
| Pullback direction | Automorphisms f,g | (f∘g)*=g*f*; ((f∘g)⁻¹)*=(f⁻¹)*(g⁻¹)* | Inverse pullback is the left action; retained |
| Contraction normalization | σ(e₁,e₂)=1, then 2σ over ℂ and characteristic 2 | e₁↦e₂*, e₂↦−e₁*; rescaling gives 2e₂*,−2e₁*; in characteristic 2, −1=1 | Chosen form is input to contraction only; retained |
| Mathieu action retains the fixed letter | Identity; involution | Fixed-letter counts 24 and 8; involution cycles give 8+8=16 orbits | 24-letter convention retained |
| Polarization normalization | d=1,2; cubic power | L²=2,4; h⁰(L³)=11,20; projective dimensions 10,19 | Positive d and cubic conventions retained |
| §1.1 differentialForms | Local rank-two cotangent frame | ∧⁰=k, ∧¹=k², ∧²=k, ∧³=0 | Definition agrees with pinned sheaf functor; retained |
| §1.1 IsK3 | Quartic; E×E; ℙ²; empty scheme | Quartic h¹=0 and K=0; E×E h¹=2; K_ℙ²=−3H; empty nonempty flag=false | Positive and negative models distinguish all relevant conditions; retained |
| §1.1 dualizing/canonical comparison | Rank-two smooth chart | det Ω¹ has basis dx∧dy and rank 1, same as ω | Relative smoothness retained |
| §1.2 field invariance in both directions | K=k; nonzero canonical-form rescaling | Both predicates equal the original; 2σ≠σ over ℂ but both canonical-triviality propositions=true | No chosen form is stored; retained |
| §1.3 projective specialization adapter | Smooth complex quartic | Underlying f unchanged; hyperplane square 4→4 under the algebraization counit | Same-object adapter retained |
| §1.4 coherent invariants | O and quartic H | h⁰(O)=h²(O)=1; χ(O)=2; 2χ(O)=4; 2χ(H)=8=4+4 | Integer RR works at p=2; retained |
| §1.5 numerical kernel | O; rational (−2)-curve | O pairs to 0; C·C=−2≠0 | Kernel contains exactly the trivial class; retained |
| §1.6 quartic polynomial and Fermat smoothness | t=0,1,−1; p=2 | χ=2,4,4; in characteristic 2, Σxᵢ⁴=(Σxᵢ)⁴ and all first derivatives=0 | Nonreduced Fermat excluded; retained |
| §2.1 relative Picard tangent and torsion | Geometric K3 point; a nonreduced candidate identity | Tangent dimension h¹(O)=0; k[ε]/ε² has tangent dimension 1 | Nonreduced identity excluded, relative flatness not presumed; retained |
| §2.1a nonzero Witt-kernel witness | Zero versus a nonzero kernel vector | d(0)=0 with 0≠0=false; d(x)=0 and x≠0 contradict injectivity | Nonzero-witness requirement retained |
| §2.1a unirational-surface rank calculation | Conditional vector-field branch | c₂=12·2=24; b₂=24−1−1=22 | Does not consume later K3 lattice theorem; retained |
| §2.2 closedness | Zero one-form, including characteristic 2 | d(0)=0; no division by 2 | All-characteristic route retained |
| §2.3 three vanishing groups | K3; abelian surface | K3 dimensions (0,0,0); abelian surface has h⁰(T)=2 | IsK3 hypothesis excludes the countermodel; retained |
| §2.4 Hodge numbers | (p,q)=(0,0),(1,1),(2,2),(3,0),(0,3) | Dimensions 1,20,1,0,0; Euler sum 1+22+1=24 and χ(Ω¹)=−20 | Finite-dimensionality and out-of-range zeros retained |
| §2.4 integral crystalline torsion | Hypothetical W/p in M² or M⁰ | M²[p] or M⁰[p] has k-dimension 1, versus H¹_dR=0 or H⁻¹_dR=0 | Universal-coefficient endpoints exclude both; ranks (1,0,22,0,1) retained |
| §2.5 marked deformation space | Dual numbers; finite unmarked automorphism | Tangent dimension 20, obstruction dimension 0; an involution has order 2 despite zero tangent | Marked functor distinguished from global groupoid; retained |
| §2.6 line deformation locus | L=O; L=M^p; good-prime polarization | O imposes 0 equations, dimension 20; c₁,dR(M^p)=p c₁,dR(M)=0; nonzero linear equation cuts 20 to19 | Nontriviality and primitive crystalline normalization retained |
| §2.7 compatible polarized tower | O(1) at levels 0,1; O(1) then O(2) | Compatible degrees 1=1; incompatible degrees 1≠2 | Actual line representatives required; retained |
| §2.7 smoothness of algebraization | Smooth tower; Spec R/(π) | In bad model π·1=0 with 1≠0, hence not R-flat, despite smooth closed point | Smooth-level hypothesis retained |
| §3.1 integral étale invariants | ℓ≠char k; quartic H | Ranks 1,0,22,0,1; 1+22+1=24; square 4→4 | ℓ=char k excluded; retained |
| §3.1 Chern normalization | Positive loop exp(2πit); O(1) on ℙ¹ | Logarithmic increment +1; degree +1 | Orientation retained |
| §4.1 Picard field pullback | Identity extension; two conjugate skew lines on real quartic | Identity sends [L] to [L]; two line squares −2 and mutual pairing0 give difference square−4≠0 | Arithmetic and geometric ranks distinguished; retained |
| §4.1 specialization | Constant quartic family | Hyperplane square 4→4 and generic rank≤special rank | No unwarranted surjectivity; retained |
| §4.1 rational versus integral descent | Purely inseparable degree pⁿ | A cokernel class multiplied by pⁿ becomes0; tensoring ℚ kills it | Rank descent distinguished from line descent; retained |
| §4.2 Picard finite freeness and geometric realization | Rank-one quartic lattice; O; rational curve | Gram [4], determinant4; O square0; C square−2 | Native Picard carrier and geometric pairing retained |
| §4.2 arithmetic intersection base change | ℙ² real line and complex line | Pulled-back square1=1; pushforward of complex line is twice real line, so 2·1=2 | Residue-degree normalization retained |
| §4.3 geometricPicardRank | Real Fermat quartic then ℂ; algebraically closed field | Geometric ranks20=20; nontrivial conjugation gives arithmetic rank<20; closed-field arithmetic=geometric | Definition is not h¹¹; retained |
| §4.4 rank bounds | Rank-one polarized K3; characteristic-3 supersingular example | 1≤1≤22; 22≤22 but 22≤20=false outside characteristic-zero domain | Characteristic qualifier retained |
| §4.4 saturated cycle map | Multiplication by ℓ on ℤ_ℓ | Equal ranks1=1 but cokernel ℤ/ℓ has torsion; index ℓ≠1 | Saturation is essential; retained |
| §4.5 odd congruence injection | GL₀; −1 at ℓ=3 and2 | GL₀ order1; −1 mod3=2≠1; −1 mod2=1 and order2 | Odd-prime condition retained |
| §4.5 unipotent negative model | I+3E₁₂ | E₁₂²=0; (I+3E₁₂)^m=I+3mE₁₂≠I for m>0 | No positive finite order in kernel; retained |
| §4.6 boundedPicardDescent | Algebraically closed k; rank-zero ambient GL control | Required extension degree1; GL₀(𝔽₃) order1 and GL₁(𝔽₃) order2; rank padding embeds the trivial action | Bounded rank, not unconditional integral descent; retained |
| §5.1 symplectic subgroup | id; scalar −1; rescaled generator bσ | id scalar1; (−1)bσ=−bσ; in characteristic2 −1=1 | Generator independence and characteristic boundary retained |
| §5.2 polarized stabilizer | Wehler deck involution σ₁ | σ₁*H₁=H₁; σ₁*H₂=4H₁−H₂≠H₂; canonical scalar−1 | Neither full Aut nor scalar-enlarged stabilizer fits; retained |
| §5.2 power stabilizer | n=1,2; n=0 | n(f*L−L)=0 and torsion-free Pic give f*L=L for n>0; L⁰=O for all L | Positive-power hypothesis retained |
| §5.3 finite étale polarized automorphisms | An involution, including characteristic2 | Nonidentity order2 point; tangent dimension0 | Finite étale does not mean trivial; retained |
| §5.4 Wehler infinite action | Displayed 2×2 matrices | Both SᵢᵀGSᵢ=G; det G=−12; S₂S₁=[−1,−4;4,15], trace14, determinant1 | Infinite-order witness and reversed composition agree; retained |
| §5.4 symplecticity | Two deck transformations | (−1)(−1)=1 | Product symplectic, factors not; retained |
| §6.0 supersingular discriminant | p=3, σ=1,2; forbidden σ=0,11 | −3²=−9; −3⁴=−81; signature difference1−21=−20 is not divisible by8 | Sign, parity and range retained |
| §6.0a finite height bound | h=1,10,11 | 22−2h=20,2,0; h=11 conflicts with ρ≥1 | Infinite height not inserted as an integer; retained |
| §6.0b genus-one carrier | E×ℙ¹ and ℙ¹×ℙ¹ over ℙ¹ | Generic (h⁰,h¹)=(1,1) versus (1,0) | Genus-zero countermodel excluded; retained |
| §6.0b minimality | Product; blowup at a fibre point | Relative canonical degree0 versus exceptional degree−1 | Separate minimality condition retained |
| §6.0b localization | E×ℙ¹ at t=0 | Total E×Spec k[t]_(t), generic E_k(t), closed fibre E; generic h⁰=h¹=1 | Native model and identification preserved; retained |
| §6.0b inseparable fibre change | t²−a after b²=a in characteristic2 | t²−a=(t−b)²; scheme length2 versus reduced length1 | Schematic divisor retained |
| §6.0b regular versus smooth generic curve | y²=x³+t after t=u² | (y−u)²=x³; both first partial derivatives vanish at cusp | Arbitrary function-field change is not a constant-field theorem; retained |
| NEW §6.0b proper-base restriction definition | E×ℙ¹; E×A¹ | Both generic cohomology pairs (1,1); proper-base flags true,false; H⁰ on E×A¹=k[t] of infinite dimension | Added restriction and positive/negative Checks |
| NEW §6.0b add/forget laws | Proper product and its identity map | Underlying morphism f↦f↦f; identity remains id and fibre multiplicity1→1 | Added same-data inverse laws on the restricted collection |
| NEW §6.0b model, fibre and minimality compatibility | Proper product at0; its fibre blowup | Both presentations give generic h¹=1, closed fibre E and canonical degree0; blowup gives −1 in both | Added comparisons without an independent carrier |
| NEW §6.0b field-change compatibility | E×ℙ¹ over 𝔽₂(a), then b²=a | Properness true→true; pulled-back divisor length2→2 through forgetting; reduction length1≠2 | Added field-change law and negative reduction Check |
| NEW §6.0b inherited coherent and Picard objects | Elliptic product over ℙ¹ | R¹f_*O=O, χ=0, deg L=0, section square0 and r(C₀)=0 in both presentations | Added inheritance through unchanged f, not a second construction |
| §6.0b quasi-elliptic characteristic restriction | Geometric cusp δ=1 at p=3,5 | (p−1)/2=1,2; 1 divides1 but2 does not | p=2,3 alternatives retained |
| §6.0b quasi-elliptic ruled map | Base ℙ¹; genus-one base | Ruled source has base genus0 or1 respectively | Rationality asserted only for base ℙ¹; retained |
| §6.0b multiplicity and primitive divisor | Full double fibre 2Fbar | gcd of component coefficients=2; primitive gcd=1 | Multiplicity not reduction; retained |
| §6.0b geometric Kodaira realization | I₂ versus III; I₃ versus IV | Two nodes of length1 versus one tangency of length2; three distinct nodes versus one triple point | Graph-only model rejected; retained |
| §6.0b full radical quotient | I₀* coefficient vector (2,1,1,1,1) | Primitive null vector nonconstant; vector (1,1,1,1,1) is not null | Full integral radical required; retained |
| §6.0b canonical formula | E×ℙ¹; Jacobian K3 over ℙ¹ | χ=0 gives L=O and ω=f*O(−2); χ=2 gives L=O(−2) and ω=O | Both base canonical and inverse Hodge line retained |
| §6.0b wild Hodge degree | χ=2, torsion length t=0,1 | deg L=−2,−3; omitting torsion gives wrong −2 when t=1 | Wild term retained |
| §6.0b tame multiple-fibre coefficient | m=1,2 | a=m−1=0,1 with 0≤a<m | Constant zero or a=m rejected; retained |
| §6.0b Jacobian has no multiple fibre | Section C₀ meeting full fibre mFbar | 1=C₀·mFbar=m(C₀·Fbar), hence m=1 | Section belongs to Jacobian, not arbitrary torsor; retained |
| §6.0b Euler comparison | Torsion kernel/cokernel lengths t=0,1,2 | 0−0=1−1=2−2=0 | χ(X)=χ(J) retained, with proper C |
| §6.0b generic Jacobian type | Quasi-elliptic group; elliptic product | After geometric extension [p] on G_a=0; elliptic generic curve remains proper of dimension1 | Additive and elliptic cases retained |
| §6.0b Picard restriction kernel | E×C with positive-genus C | Pullback of nontrivial Pic⁰(C) has degree0 and generic restriction0, yet is not generated by one fibre | Whole vertical Pic(C) contribution retained |
| §6.0b section–fibre plane | χ=0,1,2 | Matrices [−χ,1;1,0] all have determinant−1; section squares0,−1,−2 | Unimodular plane and parity distinctions retained |
| §6.0b numerical quotient law | Bielliptic example with MW=E[2] | MW order4; N=MW; Num/V=0=MW/N; quotient order q=1 | Quotient target retained |
| §6.0b degree-normalized restriction | C₀, F, section C_P | r(C₀)=0, r(F)=0, r(C_P)=P; bielliptic section difference numerically0 but r=P≠0 | No map Num→MW without quotient; retained |
| §6.0b restriction sign | y²+y=x³, P=(0,0) | Tangent intersection3 gives order3; −P=(0,−1)≠P | r(C_P)=P fixes sign; retained |
| §6.0b determinant law | A₈⊂E₈ of index3; bielliptic example | 9=3²·1; bielliptic1=1²·1 while4²·1=16≠1 | Square index and quotient order retained |
| §6.0b finite MW hypothesis | E×ℙ¹ over algebraic closure of finite field | MW is infinite torsion, rank0; no finite cardinal m | Rank0 does not imply finiteness; retained |
| §6.0b K3 determinant specialization | Conditional rank18, two II* fibres | R=E₈(−1)², d_R=1; q²·abs(disc Pic)=1 forces q=1 and abs(disc Pic)=1 | Conditional test does not assert existence; retained |
| §6.0b rank-five pencil | Rank-one positive [4]; isotropic primitive F versus2F | 4x²=0 only for x=0; F²=(2F)²=0 but2F has divisibility2 | Rank threshold and primitivity retained |
| §6.0c height/pencil alternatives | Finite height1; putative rank21 | Finite-height bound20; ρ=21 would force a pencil and thenρ=22 | Rank21 excluded without assuming every pencil smooth; retained |
| §6.0c K3 Jacobian recognition | χ=2 on ℙ¹ | R¹j_*O=O(−2); ω=O; h¹(J,O)=h¹(ℙ¹,O)+h⁰(ℙ¹,O(−2))=0+0=0 | Geometric recognition retained |
| §6.1 tame quotient | G=1; tame involution | Exceptional rank0 and determinant1; 8A₁ determinant2⁸=256 | Identity and prime-to-p restrictions retained |
| §6.1a cyclic Euler identity | n=2 and4 | 24=8·3; 72=4·15+2·2·3; square fixes4+2·2=8 points | Stabilizer multiplicities retained |
| §6.1a excluded numerical candidates | n=11,14,15 | Root ranks20; determinants121,196,225, all squares | Euler arithmetic alone insufficient; retained |
| §6.1a order14 subgroup tests | a₂=a₇=a₁₄=1 | 21+96+195=312=24·13; order7 gives3·48=144; order2 gives8·3=24 | Candidate retained until discriminant exclusion; retained |
| §6.2 tame fixed-point table | Orders2,7,8; id | Counts8,3,2; order2 H² trace8−2=6; id fixes dimension2 surface | Nonidentity condition retained |
| §6.2a wild divisor inequality | D²=2,d=1 | N=2; N−d−1=0; left side0 and right side2 | Division by0 excluded; retained |
| §6.2a fixed-cycle geometry | ADE exceptional cycle versus whole fibre | Negative-definite matrix has kernel0; fibre matrix has radical rank1 | Distinct Kodaira-dimension branches retained |
| §6.3 free Enriques branch | Free order2 action in characteristic2 | e(Y)=24/2=12; b₂(Y)=12−2=10, versus22 for X | No Picard-rank substitution; retained |
| §6.3a wild refinements | p=11 exceptional branch; p=13 with invariant pencil | 11≤11; 13≤11=false | Exceptional reduction and prime bound retained |
| §6.4 wild prime bound | p=13; p=2 | Finite subgroup with p-divisible order at13 would require13≤11=false; 2≤11=true | No unnecessary symplectic hypothesis; retained |
| §6.4a Picard faithfulness | Identity; characteristic-zero rank-one double-plane involution | Identity kernel element1; deck fixes one ample class but has order2 | Whole Picard action and rank22 remain essential; retained |
| §6.5 étale faithfulness | Identity; free Enriques quotient branch | Identity H² trace22; free branch invariant dimension10≠22 | Characteristic2 branch retained |
| §6.6 universal group bound | Trivial group; char k=3 | abs(G)=1; auxiliary prime5≠3 | All finite subgroups included; retained |
| §6.7d involution deformation | Tame symplectic involution | (22+6)/2=14 invariant H² dimensions, minus2=12 invariant tangent dimensions | Pair locus uses the correct fixed space; retained |
| §6.7d lifted involution | [x:y]↦[−x:y] on ℙ¹ tower | Square=id; at odd residue characteristic −1≠1, at characteristic2 −1=1 | Exact-order reduction test retained |
| §6.7d Picard-rank consequence | Anti-invariant space plus invariant ample class | (22−6)/2=8 and8+1=9≥5 | Pencil follows without invalid mod2 identity inference; retained |
| §6.8 Artin-invariant-one definition | p=3 with disc−9,−81,+9; rank20 | −9=−3² passes at rank22; −81=−3⁴ givesσ=2; +9 wrong sign; rank20 fails | Both defining conditions retained |
| §6.8 realized Fermat boundaries | p=3,7,5 | Rank22 with discriminants−9,−49 at3,7; height1 gives rank≤20 at5 | Characteristic and sign distinctions retained |
| §6.8a invariant lower bound | G=1; C₇; nonabelian group order21 | 24; (24+6·3)/7=6; (24+14·6+6·3)/21=6 | Exceptional transfer hypotheses not imposed on the two order cases; retained |
| §6.8a trace at a quotient singularity | Tame involution on k[x,y] | Generic rank2 over invariants; origin fibre basis1,x,y has dimension3 | Finite-flat trace unavailable there; proper coherent trace retained |
| §6.9 Mathieu function | n=0,1,2,3,4,5,6,7,8 | ε(0)=0 by total division; remaining values24,8,6,4,4,2,3,2 | n>0 retained for element orders |
| §6.10 characteristic-zero sharp bound | Trivial action; 1⁸2⁸; 23-cycle plus fixed letter | Orbit counts24,16,2; the last fails≥5 | Bound960 retains its hypotheses |
| §6.11 tame exceptional branch | Four-invariant candidate; tame characteristic2 group | Orbit count4; characteristic2 forces odd abs(G) | No universal five-orbit or960 assertion; retained |
| §7.1 geometric primitivity | 0, e,2e in rank-one lattice | 0=2·0; e has no integer root n>1;2e=2·e | Zero and multiples excluded; retained |
| §7.1 squarefree degree test | λ=nµ and even µ²=2e | 2d=n²·2e, so d=n²e | Squarefree positive d excludes n>1; retained |
| §7.2 root-locus boundary | [0],[3]; F,2F,0 | [0] constant; [3] kernel0; F²=0,F·C=1; 2F has rootF;0=2·0 | n>0, square-zero and zero cases retained |
| §7.3 polarized families | Actual ample class; d=0; scalar line-isomorphism | Ample square>0; d=0 gives square0; multiplying a line-isomorphism by2 does not change f | Actual surface arrows and Picard sections retained |
| §7.4 Hilbert polynomial | d=2,m=1,2,3,0,−1 | h⁰=4,10,20 for positive m; H²(O) dimension1; χ(L⁻¹)=4 | Vanishing restricted to m>0; retained |
| §7.5 separation bounds | 2L and3L, d≥1 | (2L)²≥8 and0<2L·D<2 has no integer solution;3L forces D²=1, incompatible with evenness | All-characteristic argument retained |
| §7.5 cubic embedding polynomial | d=1,2 | Projective dimensions10,19; polynomials9t²+2,18t²+2 | Rank9d+2 and dimension9d+1 retained |
| §7.6 K3 Hilbert locus | Smooth quartic versus singular degeneration | Cubic quartic polynomial18t²+2 in both; smoothness true versus false | Hilbert polynomial alone insufficient; retained |
| §7.6 canonical equality locus | ω_ℙ² and O_ℙ² | Both rank1 but classes−3H and0 differ | Scheme-theoretic Picard equality required; retained |
| §7.7 projective frames | Quartic coordinate swap | x₀³↦x₁³≠x₀³; same Hilbert point may have nontrivial stabilizer | Prescribed-family identification retained in torsor |
| §7.7 Brauer–Severi descent | Real quaternion obstruction α of order2 | 3α=α≠0, so neither L nor L³ has global representative | Projective bundle, not vector bundle, descends; retained |
| §7.7 change of representative | L↦L⊗f*N | Section bundle tensors with N³; projectivization unchanged | Scalar cocycle vanishes after projectivization; retained |
| §8.1 polarized stack | Polarized involution | Stabilizer contains nonidentity element of order2 while tangent dimension0 | Stack not a fine scheme; retained |
| §8.2 unique trait extension | Generic identity | Extension=id and id∘id=id | Extends isomorphisms of given families, not all families; retained |
| §8.3 coarse space | Object with involution | Two automorphisms1,g map to the same coarse point | Coarse universal property does not retain stabilizers; retained |
| §8.4 smooth open base | d=1; p dividing2d | Base ℤ[1/2]; polarized tangent dimension19 at good primes | No assertion at excluded primes; retained |
| §8.5 finite-field forms | Fixed finite k and d; actual cubic frame | Br(k)=0 kills obstruction; frame dimension9d+2 is finite; H_d(k) finite | All k-forms represented, not merely coarse rational points; retained |
| Proper-surface supplier boundary | Smooth quartic versus higher-dimensional claim | Quartic dimension2; each test application remains dimension2 | No projectivity claim for all proper varieties; retained |
| Complete-intersection connectedness contract | V(x₀x₁) in ℙ¹×ℙ² and in ℙ¹ | Bidegree(2,0) gives2 disjoint surfaces, not ample; degree2 divisor inℙ¹ gives2 points, dimension0 | Both ampleness and positive dimension retained |
| Surface arithmetic projection formula contract | Real/complex projective line class | [ℂ:ℝ]·1=2=(H·2H)_ℝ | Degree factor in correct position; retained |
| Polarized descent projectivity contract | Disjoint union of ℙⁿ over disjoint point bases | Component dimensions0,1,2,… have no fixed upper N | ℙ(E)-projective distinguished from fixed ℙᴺ; retained |
| Formal algebraization supplier contract | π-adic O(1) tower; incompatible line levels | Restriction degrees1=1 versus1≠2; ideal generator count1 | Actual compatible ample line retained |
| Rational finite-torsor descent contract | C₂, ℓ=2, rational coefficients | Projector(1+g)/2 satisfies e²=e overℚ₂;1/2 is not inℤ₂ | No integral invariants equality claimed; retained |
| Proper tame Lefschetz and local index | Complex eigenvalues−1,−1 | det_ℝ(1−dg)=abs(det_ℂ(2I))²=16>0, local index+1 | Tame/nondegenerate domain retained |
| Integral topology torsion comparison | n=4,i=2 | n−i+1=3; H² torsion pairs with H³ torsion through duality | Degree shift retained |
| Formal-Brauer finite-height separation | Finite h=1 versus additive height∞ | Finite-height Dieudonné rank1; additive [p]=0 | Height alternatives not equated; retained |
| Automorphism realization contract | Nontrivial unipotent2×2 matrix | Characteristic polynomial(t−1)² but matrix≠I | Finite order needed before semisimple identity inference; retained |
| Finite SL₂ classification contract | A₄ versus binary tetrahedral group | A₄ has3 involutions; SL₂ has unique nonidentity involution−I; binary order24 | Binary groups retained |
| Mathieu permutation-model contract | Stated prime factorization and index | 2⁷·3²·5·7·11·23=10200960; times24=244823040 | Orders retained |
| Mathieu subgroup-recognition domain | Trivial group versus23-cycle | Invariant dimensions24 and2 respectively | Five-invariant premise retained; no classification from order alone |
| NEW explicit prerequisite chains | Three minimal directed routes | I7.3<K1<K2<application; TS3<C6.1<C6.3<C6.6<§3.1; CC C1.2/S0–S5<C6.1 | Direct/transitive classification made explicit; no reversed edge |

### Build and gate outcomes

Targeted command: `lake build TauCetiRoadmap.K3SurfacesAndSymplecticBoundedness.Suggested`.

Exit status 0. Exact completion: `Build completed successfully (9040 jobs).` The only warnings are six “declaration uses sorry” warnings at `Suggested.lean` lines 96, 108, 122, 146, 155 and 167. Fresh scratch signature elaboration printed all nine actual declarations and both properness instances without errors; no missing section binder or signature change was found.

The first precommit full gate declined only `dirty=1`; after commit `8bc8863` the final full gate exits 0 and the worktree is clean. The separate dependency-direction check exits 0 with this complete output, containing no UPWARD, CYCLE or moved line:

```text
depcheck: 33 roadmaps, 306 edges, 0 problem(s)
```

That mechanical check does not certify the live description or transfer the companion's ownership; those unresolved external corrections are documented above.

Final gate summary:

```text
gate K3SurfacesAndSymplecticBoundedness: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```
