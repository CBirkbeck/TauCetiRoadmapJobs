# MotivicEtaleKTheory repair findings

Identifiers are preserved in review order: the first F01–F02 belong to RT-MotivicEtaleKTheory_r1a; the following F01–F05 belong to RT-MotivicEtaleKTheory_r1b. The reviews have no duplicate mathematical findings.

## F01 (P1) — applied

Review r1a. Integral spectrum Adams maps → coherent pointed-space operations. Updated scope, supplier contract, §2.0a construction, pairing, relativity, Checks, downstream contract and Lean docstring. Kept integral spectra and spectrum pairings. The witness computes ψ²(η·1)=0≠[−1]=η·ψ²(1); WeibelKBook line 15979 and Levine94 line 655–705 verify the distinction. No rational spectral construction is needed by these targets.

## F02 (P2) — applied

Review r1a. “First nonzero component” → vanishing below codimension and equality in that codimension, allowing zero. Updated §2.4 and §2.0a’s related Check. Added {0}⊂𝔸¹: [O₀]=1−1=0 and [{0}]=div(t)=0. On ℙ¹ the class remains h with coefficient +1. SchemeKTheoryOperations §7.2 supplies the leading-class identity without nonvanishing.

## F01 (P2) — applied

Review r1b. Circular inverse construction → geometric cycle map in §2.1, isomorphism then inverse in §2.2. Kept classifying-space character and coherent restriction construction in §2.0b; updated §2.3’s reference. Converted §2.1’s Checks and moved character evaluations to §2.2. Levine94 line 1210–1269 constructs the cycle map on groups, before an inverse is available; BF line 974–997 supplies the separate universal-class route.

## F02 (P2) — applied differently

Review r1b. Unqualified specialization → infinite-field specialization plus perfect-field functorial Tate construction, agreeing on infinite perfect fields. Updated scope, supplier contract, §2.0b, §2.2’s route and Layer 2 dependencies. Added the 𝔽₂ torus Check. MotivesAndAlgebraicCycles §§4.4,4.17 suffice; §4.18’s resolution-dependent representability is unnecessary. MVW line 5827–5842 proves the integral smooth perfect-field comparison without resolution; all fields remain covered.

## F03 (P3) — applied

Review r1b. `CategoryTheory.DerivedCategory` → `DerivedCategory` in the Mathlib contract. At the pinned Mathlib, Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:67 opens CategoryTheory; :87 defines DerivedCategory at the root; its namespace starts at :90. Searched the whole package’s README and acceptance file for the erroneous qualification; no other occurrence remains.

## F04 (P3) — applied

Review r1b. Unspecified ranks → x=([k²],[k]) in §2.2 and x=([k²],[O_ℙ¹]) in §2.3; §2.1 now tests the cycle map on (2,1). The structure sheaf gives (1,1). Replaced §3.4’s identity-only Check with actual blowup pullback x=e,y=eu: log∣x∣ maps to log∣e∣ and gives log 2, whereas swapping coordinates gives log 3.

## F05 (P3) — not actionable in this package: correcting consumer citations requires companion edits

Review r1b. Deleted the obsolete-label crosswalk and made the Zagier consumer sentence timeless. Polylogarithms §§Conventions,5.2 and its supplier contract still cite Layer 4, §4.2, §9.1 and §12.2; only that consumer can correct them. KatoEulerSystems’ cited README and §3.4 are absent from main, the indexed open heads and this board; its proposed consumer citation cannot be certified or added here.

## Checks and acceptance-file audit

Ran the prescribed `lake env lean` command on packages/MotivicEtaleKTheory/Suggested.lean from the content checkout: exit 0, empty stdout/stderr. The file imports Mathlib only, has its required namespace and one module docstring, and has zero declarations, variables, instances, options or examples. No Tau Ceti object build was needed.

The declaration inventory for the requested `#check @name` comparison is empty: there is no declaration signature or implicit binder to elaborate in a scratch audit. The acceptance file’s missing-carrier list was compared with the changed README headlines. Its §2.0a description now distinguishes spectrum pairings from pointed-space Adams operations. No headline became statable, and no stand-in, padding declaration or admitted data was added.

Dependency command outcome: exit 0, with exact output:

```text
depcheck: 29 roadmaps, 262 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Supplier direction is unchanged. No gate failure was supplied in the brief. `git diff --check` exits 0 with empty output.

The roadmap citation resolver, against main 6f49035 and the supplied indexed open heads, reports no cross-roadmap citation or Lean name found nowhere. Its pinned-library warning is not a declaration check; the actual pins were inspected separately below. This resolver does not repair other roadmaps’ obsolete citations.

## Sources, ownership and suppliers

The new legal texts were fetched with the prescribed source service and recorded under unique keys MVW and WeibelKBook. MVW’s initial URL failed; its institutional author copy subsequently resolved, and its resolved entry was removed from the missing-text request. No missing text remains. Bloch86 and Beilinson85 retain their settled uncertified status; Levine98 remains waived. None was requested again. No source passage was copied.

| Evidence | Exact locator and verified content |
| --- | --- |
| Unstable supported operations | Levine94 line 655–705, §2, pp.257–258: supported and iterated-relative K-spaces and induced operations on their groups. |
| Stable obstruction | WeibelKBook line 15979, Exercise IV.1.12(a), p.274: the stable Hopf class has image [−1]. Since every spectrum map commutes with the sphere action, fixing 1 forces it to fix η·1. |
| Cycle-map order | Levine94 line 1197–1269, Theorem 3.1, pp.275–277: relative-cycle homology maps to relative K₀, then ordered cube relativity identifies higher K. |
| Specialization limitation | Levine94 line 1595–1608, Lemma 4.3, p.290: finite fields are first treated by coprime towers; the rational-point specialization argument then assumes the field infinite. |
| Universal classifying construction | BF line 961–997, §3.2, pp.21–22: the read construction is over ℂ and uses moving and specialization. Bloch86 §7 remains the settled uncertified reference for its general universal construction and inverse identification. |
| Tate coefficients | MVW line 1054–1073, Definition 3.1 and Lemma 3.2, p.21: actual complexes of transfer presheaves and Zariski sheaves, hence pullback is available for all morphisms between smooth test schemes, including non-flat maps. |
| Weight-one normalization | MVW line 1204–1216, Theorem 4.1 and Corollary 4.2, p.25: H¹,¹(X,ℤ)=O(X)× and H²,¹(X,ℤ)=Pic(X). |
| Finite-field comparison | MVW line 5827–5842, Theorem 19.1, p.159: smooth separated schemes over a perfect field; the sheaf comparison supplies the cycle identification. Resolution enters a different singular/Borel–Moore result, not this theorem. |
| Logarithmic refinement | BKK line 4263–4316, formula (5.23) through Corollary 5.31, pp.117–119, and Burgos94 line 155–190: the comparison is actual logarithmic pullback; in the boundary blowup chart x=e it carries log∣x∣ to log∣e∣. |
| Existing geometric conventions | BF line 506–552, BKK line 3999–4180 and BKK line 4395–4462,4841–4847: cone, products, current normalization and divisor signs used in the recomputations below. |

All direct supplier locators were resolved afresh with the roadmap service, then read at main or the indexed new-roadmap head. Main examples read for shape were DifferentialGeometry, ComplexKahlerGeometry, ComplexManifolds and Completed/HodgeStructures. The following contracts retain their actual hypotheses:

| Supplier | Sections inspected and consumed |
| --- | --- |
| GeneralAlgebraicKTheory | §3.12 plus/Q; §§4.6,4.8,4.14 resolution, dévissage, localization; §6.3 fibration; §§7.4–7.7 spectrum pairings, symmetry, units and transfer; §§8.12–8.13 B(π)=1 and uniformizer-last adapter (−1)ⁿ⁻¹B. |
| SchemeKTheoryOperations | §§2.1–2.6 perfect models and pullback; §§3.1–3.6 support and localization; §4.3 descent; §6.1 spectrum products; §§6.7–6.9 pointed models, unstable operations, several-variable uniqueness and finite rational weights; §§7.1–7.3 degree-zero character and γ theory. Its §6.9 explicitly avoids integral spectral Adams maps. |
| KTheoryFiniteLocalFields | §3.0a’s motivicCycles, motivicToK, arbitrary-field moving and coprime-degree descent; §6.10’s diagonalChernMilnor with coefficient (−1)ⁿ⁻¹(n−1)!. That section’s Chern construction is the field-diagonal map consumed here; this roadmap supplies the smooth-scheme universal comparison, not a second field diagonal. |
| MotivesAndAlgebraicCycles | §4.4 functorial Tate complexes; §§4.7–4.8 shared cycles; §4.8a relative specialization; §4.14 equidimensional-cycle transfers; §4.17 perfect-field smooth higher-Chow comparison, without resolution; §4.18 representability in the separately stated scope. |
| SchemeAndStackFoundations | §§2.1–2.2 site cohomology; §§4.12,4.17 domination/SNC; §§5.1–5.8 Chow maps, intersection, Chern classes and degree-zero geometry. |
| ResolutionOfSingularitiesCharacteristicZero | §§5.1–5.6 resolution preserving the prescribed open and boundary; §§6.1–6.4 projective closure, quasi-projective SNC compactification and coordinates. The non-quasi-projective route retains Nagata compactification. |
| EtaleCohomologyFoundations | §§G.1–G.3 compactifications, existence and coherent finite-diagram common refinements; no coefficient-theoretic theorem is consumed. |
| ComplexComparisonPartII | §§C−1.1,C−1.4 analytification/charts; §§C5.1,C5.3–C5.6 comparisons, arbitrary smooth-proper Hodge theory, currents and residue-zero logarithmic comparison; §C6.0 stratified topology. |
| EnhancedDerivedSheaves | §§0.1–0.4 enhanced complexes, replacements, tensor and coherent functors; §§E0.6,E1.4,E2.6 dg nerve, derived tensor and hypercover descent. |
| DifferentialGeometry | Layers 0–1 and 5–9 native differential forms, integration, Stokes, real de Rham and duality. The two Whitney/flat-ideal extension gaps remain explicit. |
| ComplexKahlerGeometry and ComplexManifolds | K1–K2 types, orientation and Dolbeault calculus, with ComplexManifolds Milestones 1–2 supplying the shared realification/orientation. Finite dimension, Hausdorffness and second countability are retained. |
| AlgebraicTopology | Stages 2–3; Stage 6 items 1–4; Stage 8 item 2: relative theory, products, duality, simplicial-group Kan and abelian Moore/homotopy comparison, including components. |

Object searches used the roadmap service, the main and Completed trees, board packages, and all 28 sibling folders explicitly supplied in the brief. The objects searched were universal Chern classes, cycle-to-K comparisons, Tate complexes, multi-relative cubes and logarithmic Deligne theory. The finite-field repair imports the existing Tate and cycle comparisons; it introduces no competing foundational carrier. No fully qualified Lean declaration was introduced.

The existing BorelRegulators §6.0a, ColemanIntegration §L3.Fa.2 and Polylogarithms §5.2 ownership overlaps are the external dispositions in packages/MotivicEtaleKTheory/reports/FIX-PKG-MotivicEtaleKTheory~2.md, F02–F04. They were verified, not reopened: the common constructions still belong to this earlier package and require the same companion consumer edits. No consumer is made a supplier. Polylogarithms’ outdated labels were verified directly in its supplied head, at TauCetiRoadmap/Polylogarithms/README.md:37,121,826,843,1044.

ZagierConjecturePolylogarithms M.8 and MixedHodgeModulesAndIrregularHodgeTheory N/logarithmic-filtration are design consumers, confirmed in their board design plans. KatoEulerSystems has only sources and an earlier report on this board; the cited README is absent, and the roadmap service finds no main or indexed open roadmap. Consequently this repair does not invent its §3.4 citation. Ownership against the explicitly supplied open folders was checked; no unspecified open head was sought.

The top-level design gaps and README contracts still agree on smooth-whitney-extension and flat-ideal-regular-situation, both assigned to DifferentialGeometry, Part II: Whitney jets and flat functions. No new supplier gap is needed: MotivesAndAlgebraicCycles §§4.4,4.17 already state precisely the finite-field inputs. Correcting a later consumer’s citation is not a prerequisite of this package and creates no supplier gap.

## Pinned-library and statement audit

The lake manifest pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Inspected the declarations at the following pinned files and lines:

| Native declarations | File and lines; scope verified |
| --- | --- |
| AlgebraicGeometry.AlgebraicCycle, AlgebraicCycle.map | Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44,55,69: locally finitely supported point coefficients; map tests equality of dimension weights and uses residue degree with quasi-compactness. No face-admissibility or pure-dimension condition is built in. |
| AlgebraicGeometry.Scheme, ModuleCat | Mathlib/AlgebraicGeometry/Scheme.lean:40; Mathlib/Algebra/Category/ModuleCat/Basic.lean:56: native carriers, not higher Chow or scheme K-theory. |
| HomologicalComplex, d_comp_d | Mathlib/Algebra/Homology/HomologicalComplex.lean:59,72: square-zero complexes, not a motivic realization. |
| DerivedCategory | Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:67,87,90: root-level localization of cochain complexes; no coherent-diagram enhancement is asserted. |
| CochainComplex.mappingCone and both summand differential formulas | Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean:57,261,269: source-shift-first cone; after shifting and negating its second coordinate, the pair differential is (da,f(a)−db). |
| CategoryTheory.Abelian.DoldKan.equivalence | Mathlib/AlgebraicTopology/DoldKan/Equivalence.lean:167: abelian simplicial objects versus natural chain complexes; no nonabelian Moore-chain claim. |
| TauCeti.gradedCochainComplex | TauCeti/Algebra/Homology/GradedCochainComplex.lean:59: actual graded submodules and a square-zero homogeneous differential. |
| TauCeti.Hodge.HodgeStructureOn and IsMorphism | TauCeti/Geometry/Hodge/Structure.lean:62; Morphism.lean:69: linear filtration and conjugation compatibility. |
| TauCeti.Hodge.tate, tate_F, tate_piece | TauCeti/Geometry/Hodge/Tate/Basic.lean:91,100,111: type (−p,−p), ordinary lattice inclusion, so geometric Tate scaling needs its separate marking. |
| TauCeti.Hodge.MixedHodgeStructure and Hom.range_inf_F_eq_map_F | TauCeti/Geometry/Hodge/Mixed/Basic.lean:72; Mixed/Strictness.lean:110: actual rational/complex structures and strict morphisms; no geometric logarithmic complex. |

Object searches at both pins find no face-admissible higher Chow complex, supported scheme cube K-theory or real Dolbeault/Deligne carrier making any listed headline statable by a few simple definitions. Filtration and linear Hodge declarations are insufficient substitutes. Every changed target retains its explicit field, regularity, smoothness, dimension, support, coefficient and nonnegative homotopy-degree hypotheses. Rational projectors require distinct weights and nonzero denominators; no integral inversion or prime exclusion was introduced.

## Adversarial mathematics record

Each row tests one statement or named API assertion; multi-clause rows give a value for every clause tested. These computations test the actual constructions and conventions, not hypothetical free maps, and are not proofs of the general theorems. P is a point; h is the positive hyperplane class. “Retained” means the values agree and no edit was required.

| Statement | Instances tried | Computed values on both sides | Result; change |
| --- | --- | --- | --- |
| Universe and finite component convention | P⊔ℙ¹; empty scheme | Two components; CH⁰=ℤ², CH¹=0⊕ℤ; empty groups 0 | Retained. |
| Motivic degree convention | p=0,a=1; p=1,a=1,2 | Cube indices −1,1,0; groups 0,CH¹(X,1),CH¹(X,0) | Integer grading retained. |
| Derived coefficients | ℤ/2 against ℤ/2; R=0 | Tor₁=ℤ/2 and tensor=ℤ/2 in degrees −1,0; zero coefficient gives 0 | Retained. |
| Cube and simplex boundaries | Γ_t on 𝔸¹; simplex path 0→1 | ∂□Γ_t=[0], δΓ_t=−[0]; ∂Δ path=[1]−[0] | Retained. |
| Orientation transport J | n=0,1,2 and concatenating two 1-cubes | 1,−1,1; J₂=1=(−1)(−1) | Retained. |
| Mixed differential sign | Bidegree (1,1) | Cross coefficients −1,+1 sum to 0 | Retained. |
| Shift and fiber convention | 0→ℝ[0]; shift by −1 | ℝ occurs in degree 1; differential factor −1 | Retained. |
| Raw versus positive boundary | Γ_t on (𝔸¹,{0}) | d(Γ_t,0)=([0],t); raw t gives −[0], its negative gives +[0] | Retained. |
| Tate convention | p=−1,0,1 | (2πi)⁻¹,1,2πi are nonzero; quotient weight 1 has real coordinate | Retained. |
| Deligne arrow and critical differential | Point weight 1; x=z z̄ | Quotient Re(log 2)=log 2; −2∂∂̄x=−2dz∧dz̄ | Retained. |
| Complex orientation and product sign | Positive circle and ordered product torus | ∮dz/z=2πi; ordered residue 1, exchanged residue −1 | Retained. |
| Whitney gap: arbitrary closed jets | Coefficients 1,1,2 at 0; coefficients n! | Derivatives 1,1,4; derivatives (n!)², including 4 at n=2 | Retained explicit gap. |
| Whitney gap: parameters and nonuniqueness | ∂ₓᵐf(0,y)=(m!)²sin y; zero jet | At m=2,y=π/2 value 4; both 0 and exp(−1/x²) have all zero jets | Retained explicit gap. |
| Flat-ideal gap | A=B=U; A=∅,B=U; coordinate axes | 0=0+0; C∞=C∞+0; φ(0)+φ(1)=e⁻¹ excludes ideal intersection | Retained analytic-set hypothesis. |
| §1.1 normalized carrier | P,p=0, n=0,1,2 | Normalized groups ℤ,0,0; unnormalized raw groups ℤ,ℤ,ℤ | Retained. |
| §1.1 normalization API | P,p=0 | Inclusion/projection sends 1↦1 at n=0, 0↦0 at n=1 | Retained. |
| §1.1 pushforward/flat API | ℙ¹→P; degree-two field extension | Dimension-drop pushforward 0 at codimension −1; flat then transfer sends 1↦2 | Retained. |
| §1.1 orientation API | Γ_t and a square | −1·∂□Γ_t=−[0]; opposite vertex contributions 1−1=0 | Retained. |
| §1.1 generator/extensionality API | Double point | Reduced generator coefficient 1, scheme cycle coefficient 2; neither is 0 | Retained. |
| §1.2 mixed carrier | Total degrees 0,2 | One summand and three summands | Retained. |
| §1.2 axes API | Cycle [V] in degree 0 | Both inclusions have coefficient 1 on [V] | Retained. |
| §1.2 totalization API | Bidegree (1,1) | d² cross coefficient −1+1=0 | Retained. |
| §1.2 orientation API | (1,0),(0,1),(1,1) | Multipliers −1,+1,−1; (−1)ⁿ⁺ᵐ would give −1 on the simplex axis | Retained. |
| §1.3 axis comparison | P,p=0 | Both sides H₀=ℤ,Hₙ>₀=0; map 1↦1 | Retained. |
| §1.3 support comparison | Z=∅ and Z=X | fib(id)=0; fib(C→0)=C on each model | Retained. |
| §1.3 coefficient comparison | ℤ/2 derived coefficient triangle; zero ring | Both sides retain groups ℤ/2 in degrees −1,0; R=0 gives 0 | Retained. |
| §1.4 map compatibility | 𝔽₂(t)/𝔽₂(t²) | Restriction/transfer composite sends 1↦2 in both models, not 1 | Retained inseparable scope. |
| §1.4 products | Degrees (1,1),(0,1) | Exchange signs −1,+1 in both models | Retained. |
| §1.4 nilpotents/localization | Square-zero point; empty/full support | Integral cycle group ℤ unchanged; fibers 0/C | Retained. |
| §2.0a spectrum carrier | n=0 full/empty support; n=1 full cube | K₀(P)=ℤ with [k²]=2; empty group 0; π₀ full relative fiber=K₁(k) | Retained spectrum construction. |
| §2.0a Adams carrier | P over ℚ, a=2 | ψ²1=1; ψ²[−1]=[1]=0; stable sphere compatibility would give [−1]≠0 | Repaired to pointed operations. |
| §2.0a rational obstruction | Same torsion unit after tensor ℚ | [−1]⊗1=0, so both candidate images are 0 | No integral spectral map inferred. |
| §2.0a generalized weights | ℙ², h=1−O(−1) | ψ²h=2h−h²; ψ²h²=4h²; ψ²(2h+h²)=2(2h+h²) | Rational weights retained. |
| §2.0a rational lattice | Lattice generated by 1,2h+h²,h² | Index 2; h=(2h+h²)/2−h²/2 over ℚ | No integral decomposition asserted. |
| §2.0a relative-cycle definition | □ with z=t/(t−1); D={0,1} | z+(1−z)=1; W={z=0} has codimension 1 in V but 0 in its face | Incidence hypothesis retained. |
| §2.0a support-local map | V=Spec L, D empty,c=0; L purely inseparable over k | Both groups ℚ; 1↦[L]=1 | Regular non-smooth scope retained. |
| §2.0a split/moving comparison | V=□_L, cycle s | Relative class has s-adic valuation 1; zero/inverse give 0/−1 | Retained hypotheses and sign. |
| §2.0a support API | n=0,Y=X,S=∅ or X | Groups 0 or K₀(X); enlargement 0↦0 | Retained. |
| §2.0a pullback API | Identity and coordinate sections | Identity sends rank 2 to 2; two face ranks of the line are (1,1) | Retained pointed naturality. |
| §2.0a pairing API | Units u,v over ℤ_(2),ℤ_(3) | ψ²([u][v])=4[u][v]=(2[u])(2[v]) | Pointed/group Adams identity retained. |
| §2.0a external-product domain | ℤ[i]⊗ℤℤ[i] at dyadic point; same-base cube | Relation v(v+2i)=0 lies in m²; local dimension 1, cotangent dimension 2; same-base cube remains regular | Regular product hypothesis retained. |
| §2.0a ordered relativity API | Face ranks (1,0),(0,1),(1,1); n=2 | Differences 1,−1,0; two loop exchanges give factor −1 | Adams equivariance scoped to pointed equivalence. |
| §2.0a prime/degree boundaries | ℤ_p,p=2,3; ℤ₃ cube deleting t=2 | π₀ relative fiber=ℤ_p×; face ranks (1,1); deleted section meets neither face | All primes retained. |
| §2.0b Chern operation and c₀ | Zero K-class; unit 2 | c₀,₀=1, positive cₚ,₀=0, character 0; valuation of c₁,₁[2] is 1 | Retained Chern/character distinction. |
| §2.0b finite-field construction | 𝔽₂; X=𝔾_m | #(𝔸¹∖{0,1})(𝔽₂)=0; H¹,¹(X,ℤ)=𝔽₂[t,t⁻¹]×=t^ℤ; c₁,₁[t] has valuation 1 | Added Tate route. |
| §2.0b agreement of routes | Infinite perfect ℚ; unit 2 and O(1) | Both give unit valuation 1; both first Chern classes h | Added overlap identification target. |
| §2.0b stability/naturality API | Trailing trivial summand; point pullback | c(O(1)⊕1)=1+h=c(O(1)); h pulls back to 0 on point | Retained universal normalization. |
| §2.0b Whitney/nonadditivity API | O(1)⊕O(−1) on ℙ² | c₂=−h², whereas c₂(O(±1))=0 individually | Retained nonadditive degree-zero clause. |
| §2.0b diagonal API | Milnor degrees 1,2,3 | Signed factorials 1,−1,2; multiplied by character coefficients 1,−1,1/2 give 1,1,1 | Retained integral diagonal owner. |
| §2.0b Newton character API | O(1) on ℙ²; positive-degree p=1,2,3 | c₂=0 but ch₂=h²/2; higher coefficients 1,−1,1/2 | Space model stays in §2.0b. |
| §2.0b classifying/restriction maps | π₁ weight-one at ℚ and its identity open | Both maps send [2] to [2], valuation 1; identity restriction sends it to itself | Retained coherent diagram target. |
| §2.1 cycle-map construction | P,p=n=0, cycle 2; ℙ¹,cycle h | 2↦[k²]=2; h↦1−[O(−1)] with Euler characteristic 1 | Replaced premature inverse. |
| §2.1 higher-degree construction | ℚ,p=n=1, cube point 2 | Image [2], v₂=1; zero/inverse images have valuations 0/−1 | Recomputed forward direction. |
| §2.1 naturality/additivity API | P⊔P cycle (2,1); empty X | Images ([k²],[k])=(2,1), and 0; fundamental cycle maps to (1,1) | Explicit inputs supplied. |
| §2.2 isomorphism/inverse definition | ℚ weight 1; P⊔P weight 0 | cyc([2])=[2], inverse([2])=[2]; x=([k²],[k]) maps to (2,1) | Inverse follows isomorphism. |
| §2.2 finite sum/weights | Weights 0,1,2 | Eigenvalues 1,2,4; distinct differences −1,−3,−2; projector on its weight 1 and other weights 0 | Retained nonzero denominators. |
| §2.2 Adams identity | Unit u, a=1,2; rank | [uᵃ]=a[u]; rank eigenvalue a⁰=1 | Retained all positive indices. |
| §2.2 universal inverse identification | O_point on ℙ¹; unit 2; {2,t} | Both maps give h,[2],ordered cycle product; adapted residue [2] with v₂=1 | Retained all-degree comparison; finite-field route explicit. |
| §2.2 higher sign control | {2,t} and reversed factors | Native B gives −[2], degree-two adapter gives +[2]; reversal gives −[2] | Recomputed unchanged sign. |
| §2.3 supported carrier | Z=∅ and Z=X | Groups 0 and absolute groups, respectively | Retained. |
| §2.3 support comparison | V(xy)⊂𝔸² | Leading supported components (1,1) in ℚ², not an assertion of regular dévissage on Z | Retained singular support. |
| §2.3 regular non-smooth comparison | L=𝔽_ℓ(t)[s]/(s^ℓ−t),ℓ=2,3 | dim L=0, embedding dimension 0; Ω¹_L/k=L ds≠0; L⊗L=L[ε]/ε^ℓ; comparison 1↦1 | Retained wider regular scope. |
| §2.3 support boundary transport | X=𝔸¹_L,Z={u=0} | Both support groups ℚ; B[u]=+1, raw cycle class −1, adapted class +1 | Retained. |
| §2.3 flat/general pullback API | Identity and enlargement {0}⊂{0,1} | 1↦1 and 1↦(1,0) | Retained. |
| §2.3 component Check | X=P⊔ℙ¹,x=([k²],[O_ℙ¹]) | Weight-zero (2,1); CH¹⊗ℚ=0⊕ℚ | Supplied missing class. |
| §2.4 external/internal multiplicativity | Ranks 2,3; ξ=1−O(−1) on ℙ¹ | Character rank 6=2·3; ξ²=0 and h²=0 | Retained. |
| §2.4 ordinary character agreement | O(1)⊕O(−1) on ℙ¹ | (1+h)+(1−h)=2; total Chern class (1+h)(1−h)=1 | Retained. |
| §2.4 leading-class formula | V={0} in 𝔸¹ versus V=point in ℙ¹ | Affine [O_V]=1−1=0,[V]=0; projective ch(1−O(−1))=h | Repaired nonvanishing. |
| §2.4 higher coefficient | p=1,2,3;n>0 | Factors 1,−1,1/2; ch₂,₂=−c₂,₂ | Retained. |
| §3.1 logarithmic carrier | Punctured disk; empty boundary; pole | d log∣z∣²=dz/z+dz̄/z̄; empty boundary gives native forms; ∣z∣⁻² diverges faster than log powers | Retained image-algebra definition. |
| §3.1 Dolbeault API | x=z z̄ | ∂∂̄x=dz∧dz̄; ∂̄∂x=−dz∧dz̄; sum 0 | Retained. |
| §3.1 pullback API | z=e on blowup; identity | log∣z∣² pulls back to log∣e∣²; identity coefficient 1 | Retained. |
| §3.1 inclusion/unit API | Constants 0,1; empty W | Injected values 0,1; d1=0; empty groups 0 | Retained. |
| §3.2 geometric comparison | 𝔾_m⊂ℙ¹ with residue-zero connection | H¹=ℂ·dz/z and period 2πi in both models | Retained. |
| §3.2 shifted Hodge weights | dlog z; point | Residue filtration index 1 plus degree 1 gives weight 2,type (1,1); point weight/type 0 | Retained. |
| §3.2 degeneration/refinement | 𝔾_m² before/after boundary blowup | Betti dimensions 1,2,1 in degrees 0,1,2; extra boundary changes residue diagram, not these dimensions | Retained F-filtered claim. |
| §3.2 flat division API | f=exp(−1/∣z∣²), denominator z² | All zero jets at 0; value e⁻¹ at 1; f=1 gives pole 1/z | Retained flatness hypothesis. |
| §3.2 flat logarithm API | f log∣z∣²; combined f(z,w) log∣z∣²/(zw̄) | Zero jets; at (−2,1) combined value −e⁻¹ᐟ⁴ log4/2 | Retained fixed finite exponents. |
| §3.3 cone carrier | Point,p=0,1,−1; A=0 | H⁰(p=0)=ℝ; H¹(p=1)=ℝ; H⁰(p=−1)=ℝ(−1),H¹=0; zero input gives 0 | Retained all twists. |
| §3.3 small-model differential | x=z z̄,p=1 | Degree 1→2; −2∂∂̄x=−2dz∧dz̄ | Retained. |
| §3.3 deformation retract | Point,p=1 | r↦(0,0,r)↦r; log2+iθ projects to log2, so other composite differs by iθ | Retained homotopy versus equality. |
| §3.3 naturality/shift API | Point A and shift A[1] | Concentration changes 0→−1; one-dimensional conjugation-stable Dolbeault type cannot have odd total degree | Cochain comparison shift only. |
| §3.3 exactness/quasi-isomorphism API | A=0; split sum ℂ⊕ℂ in degree 0 | Deligne groups 0 and ℝ² in weight-one degree 1; inclusion/projection are coordinate maps | Retained exact-compatible-type scope. |
| §3.3 cone-arrow comparison | z=3+4i,p=1,2,3 | Quotient coordinates 3,4i,3; negation gives −3,−4i,−3; transported quotient restores 3,4i,3 | Retained normalization. |
| §3.4 compactification colimit | 𝔾_m², boundary blowup x=e,y=eu | log∣x∣ pulls back to log∣e∣; at (2,3) both values log2, coordinate swap log3 | Replaced nondiscriminating Check. |
| §3.4 refinement/cocycle API | Three refinements on ordered torus classes | dlog x periods (2πi,0), dlog y periods (0,2πi); composites give same pairs | Retained actual-map comparison. |
| §3.4 pullback API | Torus blowup chart | dlog x=dlog e, dlog y=dlog e+dlog u; wedge pulls back to dlog e∧dlog u | Retained. |
| §3.4 descent/empty API | P⊔ℙ¹; empty open | H_D⁰(weight 0)=ℝ²; empty restriction target 0 | Retained. |
| §3.4 colimit universal property API | Fixed log∣x∣ along refinements | Every compatible map has value log2 at (2,3), including after changing skeleton | Retained marking. |
| §4.1 product construction | p=q=1,x=log2,y=log∣t∣ | x•y=(log2/2)(dt/t−dt̄/t̄)=i log2 darg t | Retained. |
| §4.1 Leibniz API | x=z z̄,y=1 in weight 1 | x•y=−z̄dz+z dz̄; d_D(x•y)=−2dz∧dz̄=d_Dx•y | Retained critical sign. |
| §4.1 graded-commutativity API | Same two degree-one inputs | y•x=−i log2 darg t; exchange factor −1 | Retained. |
| §4.1 unit/naturality API | ℝ[t] and tℝ[t] | 1•t=t; for e∈tℝ[t], coefficient of t in et is 0 versus 1 in t | Retained conditional identity. |
| §4.1 critical four-term API | Weight-one constant log2 and log∣t∣ | Two derivatives of constant vanish; remaining terms give i log2 darg t, period 2πi log2 | Retained. |
| §4.2 associator homotopy | Weight-zero 2,3,5; odd point triple | Both bracketings 30; both odd products 0 | Retained. |
| §4.2 critical vanishing without closedness | x=Re z, y=2,z=3 in weight 0 | Both bracketings 6 Re z, value 6 at z=1; dx≠0; h_a=0 and dh_a+h_ad=0 | Retained no closedness hypothesis. |
| §4.2 refinement/product coherence | Positive torus before/after blowup | Ordered product periods (2πi)²; swapped periods −(2πi)² | Retained. |
| §5.1 pair-fiber carrier | Z=∅,X and 0→ℝ[0] | fib(id)=0; full fiber=D_log; ℝ occurs in degree 1 | Retained. |
| §5.1 support maps API | {0}⊂{0,1} | r↦(r,0); r=2 gives (2,0) | Retained direction. |
| §5.1 connecting/excision API | Unit log∣t∣ on punctured affine line | Raw class coefficient −1; negative raw coefficient +1 | Retained. |
| §5.1 support-product API | V(x),V(x−1) in 𝔸² | Intersection empty, product in group 0; V(x),V(y) instead give origin coefficient 1 | Retained. |
| §5.1 cocycle/extensionality API | Pair (ω,g) | d² second coordinate res(dω)−d(resω−dg)=0; zero pair has both coordinates 0 | Retained. |
| §5.2 semipurity vanishing | Origin in 𝔸²,p=1 and p=2 | H_D,{0}²(weight 1)=0; H_D,{0}⁴(weight 2)=ℝ | Retained codimension condition. |
| §5.2 top component basis | V(xy), cusp and double divisor | Groups ℝ²,ℝ,ℝ; cycle coordinates (1,1),1,2 respectively | Retained multiplicities. |
| §5.2 normalized current criterion | f=t,d=p=1 | Form factor (2πi)⁻¹, point factor 1; d_D[−log∣t∣]=−δ₀=0−δ₀ | Retained both directions and scale. |
| §5.2 Betti API | Complex normal p-disk,p=0,1,2 | One oriented class in degrees 0,2,4 respectively; lower groups 0 | Retained. |
| §5.2 cycle-coordinate API | Divisors with coefficients (2,0),(0,0) | Supported classes have the same coordinates; second is zero, first nonzero | Retained iff. |
| §5.2 principal divisor API | tᵃ,a=−1,0,1 | Green −a log∣t∣ has supported coefficients −1,0,1; positive log reverses them | Retained. |
| §5.2 boundary hypotheses | P,p=1,Z=P versus p=0 | H¹(weight 1)=ℝ violates vanishing without codimension; H⁰(weight 0)=ℝ | Retained. |
| §5.3 Hₚ/support diagram | Point,p=0 | Normalized groups ℝ in degree 0,0 in positive cube degree | Retained. |
| §5.3 total objects Aₚ,Aₚ,S | (r,n)=(2p,1),(2p−1,1) | Total degrees 2p−1,2p−2; cube coefficients +1,−1 | Retained. |
| §5.3 good truncation | ω=Re z₁ dz₂∧dz̄₂ | dω evaluates to −2i on (∂ₓ₁,∂ₓ₂,∂ᵧ₂); top good truncation excludes ω | Retained. |
| §5.3 cycle-class API | Reduced and double origin cycles | Fundamental-class coordinates 1,2 | Retained. |
| §5.3 top projection API | Closed top class m[V] | Projection gives m[V]; at m=0,2 gives 0,2 | Retained. |
| §5.3 forget-support/constant API | Point,p=0,constant 2 | Supported→absolute and constant-cube map both retain value 2 | Retained. |
| §5.3 colimit/normalization API | Supports {0},{1},union; J₀,J₁,J₂ | Representatives (2,0),(0,3) give (2,3) at union; J=1,−1,1 | Retained. |
| §5.4 class isomorphism | Origin cycle and double | Both complexes have values 1,2 under comparison | Retained. |
| §5.4 support projection | Point,p=0 | H₀ map ℝ→ℝ sends 1↦1; other normalized groups 0 | Retained. |
| §5.4 affine contraction | P→𝔸¹,p=0,1 | H⁰(weight 0)=ℝ and H¹(weight 1)=ℝ on both sides; positive normalized columns have cohomology 0 | Retained. |
| §5.4 product compatibility | n=s=1; n=0 or s=2 | Totalization factors −1,+1,+1 | Retained independent Koszul sign. |
| §6.1 specified regulator roof | P,p=n=0, input 2 | All comparison arrows act by identity; resulting value 2∈ℝ | Retained. |
| §6.1 lift independence API | Two lifts differing by dη | Images differ by d(forget η), so cohomology difference 0 | Retained. |
| §6.1 integral-source API | Torsion units −1,i; zero cycle | log∣−1∣=log∣i∣=0; zero↦0 | Retained. |
| §6.1 ordinary class API | O(1),O(−1) on ℙ¹ | Normalized integrals 1,−1; raw periods 2πi,−2πi | Retained. |
| §6.2 coherent supported map | Z=∅,X; identity | Maps zero,absolute regulator; identity homotopy 0 | Retained. |
| §6.2 homotopy-sign API | A=A′=ℤ[0],B=0,B′=(ℤ→ℤ),r=f′=h=1 | Correct image (1,1) has D′=(0,0); wrong (1,−1) gives (0,2) | Retained +ha. |
| §6.2 localization compatibility | Unit t on (𝔸¹,{0}) | Raw Deligne boundary of log∣t∣ is −cl([0]); negative Green pair is +cl([0]) | Retained. |
| §6.3 general pullback | Point→ℙ¹,c₁O(1) | Both Chow and Deligne pullbacks are 0 | Retained derived pullback. |
| §6.3 compatible embeddings | 2 via ℚ→ℝ→ℂ and ℚ→ℂ | Both regulators log2 | Retained. |
| §6.3 model independence | Point cycle; n=1,2 cube transport | Both axes give 1; J factors −1,+1 apply to both source and target | Retained. |
| §7.1 independent character | u=2eⁱθ and i | Re(log u)=log2, adding 2πi changes it by 0; i gives 0 | Retained exponential normalization. |
| §7.1 additive/product API | Units 2,3; zero K-class | log6=log2+log3; zero↦0 | Retained. |
| §7.1 degree-zero/unit API | O(a) on ℙ¹; trivial line; empty scheme | ch=1+a h_D with normalized ∫h_D=1; trivial line 1; empty 0 | Retained. |
| §7.1 point quotient | z=3+4i,p=1,2,3 | πₚ₋₁z=3,4i,3; adding ℝ(p) gives increment 0 | Retained Tate parity. |
| §7.1 Moore comparison scope | Constant simplicial ℤ and S₃ | π₀=H₀=ℤ,positive groups 0; nonabelian π₀=S₃ | Retained abelian hypothesis. |
| §7.2 equality of actual maps | Rank 2, point sheaf, unit 2, torsion −1 | Both composites give 2,h_D,log2,0 | Retained. |
| §7.2 supported equality | Empty/full support; (𝔸¹,{0}) | 0/absolute map; raw log∣t∣ boundary coefficient −1 | Retained diagram comparison. |
| §7.3 integral multiplicativity | Units 2,t and reversed order | Representatives ±i log2 darg t; periods ±2πi log2 | Retained. |
| §7.3 unit/zero products | Unit cycle 1; empty factor; point units 2,3 | Identity on regulator; 0; point product in H_D²(weight 2)=0 | Retained. |
| §7.3 geometric product | Two rulings on ℙ¹×ℙ¹; double one ruling | Point class normalized degree 1; doubled result 2 | Retained multiplicity. |
| §7.4 logarithm formula | u=1,i,2,1/2; product 2·3 | Values 0,0,log2,−log2; log6=log2+log3 | Retained. |
| §7.4 curve product formula | f=2,g=t | i(log2 darg t−log∣t∣·0)=i log2 darg t; period 2πi log2 | Retained. |
| §7.4 Green/projective signs | tᵃ and O(a),a=−1,0,1 | Green −a log∣t∣ versus unit +a log∣t∣; normalized Chern integrals −1,0,1 | Retained. |

The negative controls in the changed sections exclude respectively an integral spectral lift, a false nonvanishing assertion, a premature inverse, a nonexistent specialization point, collapsing component ranks, and swapping refinement coordinates. The finite-field Tate construction uses no rational averaging, no inverted characteristic and no resolution assumption. The regular non-smooth examples, p=2,3 and the zero coefficient ring remain in scope.

## Maintainer consequences

Changed only packages/MotivicEtaleKTheory/README.md, Suggested.lean, sources.toml and this report. metadata.toml and design/plan.json are unchanged. No Lean declaration name changed, because the acceptance file declares none. The prose section §2.1 now constructs the forward geometric map; §2.2 owns its inverse character. Consumers referring to the character should cite §2.2, and the universal classifying-space model is §2.0b.

F05 remains external to this package: Polylogarithms must replace its obsolete labels with §§1.1–1.4,2.1–2.4,6.1–6.3,7.2,7.4 as appropriate. No KatoEulerSystems locator is certified from unavailable text. The earlier external ownership dispositions remain for human/companion-roadmap action. No consumer correction is claimed completed by this repair. No commit, push, pull-request edit or external message was made.
