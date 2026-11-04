# Port report: CountingBundlesAndHallAlgebrasOfCurves

Branch: `roadmap/counting-bundles-and-hall-algebras-of-curves`.
Head: `51072a40ff91f2da18ec5962196ce06dca97bf55`.
Base: `bbed953`; the initial working tree was empty.

Only `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/README.md`, `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/Suggested.lean` and `TauCetiRoadmap/CountingBundlesAndHallAlgebrasOfCurves/metadata.toml` enter the commit. The package files, merge order, pins, infrastructure and roadmap index were not edited.

## Validation

Exact module-build outcome:

```text
Build completed successfully (9034 jobs).
```

Warning count: **2**, both `declaration uses sorry`, at the two headline theorems. There were no other warnings. All three Tau Ceti imports were built at the manifest pin; no missing object-file issue remains. No Lean process was left running.

Exact push-gate summary:

```text
gate CountingBundlesAndHallAlgebrasOfCurves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean worktree. Before the commit its only finding was the three staged additions (`dirty=3`); its content, import, metadata, scope and dependency checks were already zero. The final gate was run against the clean commit.

Exact dependency-check output:

```text
depcheck: 54 roadmaps, 612 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line, and no merge-order move was requested.

The citation resolver found no missing roadmap citations or names against main `bbed953` and the indexed open heads. Its notice that it did not inspect pinned Lake packages was handled by inspecting the actual local Mathlib and Tau Ceti source files and elaborating the module.

## Draft pull request body

This roadmap develops the counting theory of absolutely indecomposable vector bundles on smooth projective curves over finite fields, from coherent nilpotent pairs and spherical Hall algebras to partition residue formulas and degree-independent universal counts. It connects these counts to stable canonical Higgs moduli in every characteristic, their pure cohomology and nilpotent-cone components, and includes parabolic refinements and constructible Hall theory.

The supplier contracts distinguish the cited sections from the additional interfaces required by the accepted mathematical scope. The five final Hall and HN conjectures remain conjectures. AI assistance: Codex (GPT-6) performed this port, source and supplier checks, elaboration and the computed mathematical pass.

## Dependencies that are still new-roadmap pull requests

The direct named suppliers in this category are ArtinAlgebras, ClassicalGroupsPartII, FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands, WeilConjectures, AlgebraicModuliForArithmeticGeometry, EndoscopicTransferAndUnitaryTraceComparison, AutomorphicSpectralTheory, ReductiveGroupsPartII, HabiroNahmSeries, SchemeKTheoryOperations, HabiroCyclotomicCompletions, QSeriesPartitionsAndMockModularForms, DeligneWeightsAndPurity, ArithmeticStatisticsPartVIII, EtaleDualityAndPerverseSheaves, CohomologicalPointCounting, ComplexComparisonPartII, CompactSupport, EllAdicRealization, TraceFormula and FrobeniusGeometry.

AlgebraicVectorBundles, SchemeAndStackFoundations and RepresentationTheory/QuiverRepresentations were read on main. In particular, the QuiverRepresentations revision in the open work was not used as a dependency. ArtinAlgebras is a new roadmap folder in that author's open work and supplies the categorical results separately.

## Port changes and upstream mathematics pass

- Applied the accepted non-blocking variable note: the rank and degree series in §§2.3 and 4.9 now use T and z, matching their Checks and §6.1.
- Added the missing statable headline `nilpotent_matrix_count`. The actual package Lean file contained only the degree-independence theorem, although its README and accepted review also identify nilpotent enumeration as a headline. The statement uses native matrices, nilpotence and natural cardinality, including n=0.
- Moved the numerical framing estimate from §8.1 to §7.3a, ahead of the two-line chart that consumes it. Its proof needs §7.1 and earlier material, so this removes the cross-layer forward dependency. Source section numbers remain those of their papers.
- Corrected the generic regular-sequence condition in the Macdonald supplier contract from q-scaling to t-scaling. M20 line 435 (published HTML, Definition 5.1) gives the latter; M20 line 420 identifies the variable exchange. Curve §10.2 correctly retains q-scaling. The added nonconstant witness gives 15 on both sides, while the incorrect generic q-scaling gives 10.
- Added a third Check for the origin constant-series definition in §6.6: genus-one constants 1,1,1,1 and genus-three constants 1,3,15,95 through rank four. Recomputed these from the partition series and plethystic logarithm, rather than only substituting in the displayed genus polynomials.
- Clarified the difference between material actually in the supplier sections and required supplier extensions. Replaced process gap labels by mathematical contract titles, preserving their hypotheses and accepted ownership decisions. The unresolved extensions are recorded below.
- Restricted §7.2 to its Higgs-invariance application; the general coherent Ext–Hom isomorphism remains the named supplier contract. §§1.2–1.3 similarly consume categorical decomposition, uniqueness and radical blocks instead of restating them as new general targets.
- Removed certification-history language from the references; exact source locators remain. M20's published full text is accessible and was read for §§3–5, including the deformation proof and Theorem 5.2. This does not change the read-only package source manifest.

No statement moved from Lean into the README: the package's three simple native definitions and its degree-independence headline already meet the acceptance-test rule. All were retained, and the matrix-count headline was added. There are no API lemmas, admitted examples, stand-in carriers or admitted data.

## Signature audit

A scratch module imported the built target and elaborated `#check @name` for **every declaration**: `bundleDegree`, `IsAbsolutelyIndecomposable`, `absIndecCount`, `nilpotent_matrix_count`, and `absIndecCount_eq_of_degree`. Each elaborated type was compared with README §§0.2, 1.4 and 10.4.

The three definitions retain k, its field instance, X and its structure map; the first two retain the implicit fixed rank. The matrix theorem retains the field and finite-type assumptions and n. The curve theorem retains finiteness of k, properness, smooth relative dimension one and geometric connectedness, together with r,d,d′. No standing binder disappeared; no signature repair was required after adding the missing headline. Rank-zero curve bundles are excluded by the nonzero clause of native indecomposability, rather than a hidden r>0 assumption.

## Supplier and duplication audit

Object searches used the roadmap tool across main and all indexed open heads, the board package READMEs, and the pinned libraries. Search families covered coherent decomposition and radicals, nilpotent matrices, Jordan filtrations, rank and degree, finite groupoid mass, curve Hall convolution, HN completion, reciprocal tori, Adams series, Macdonald admissibility, stable Higgs geometry, Quot frames, moment maps, BB strata and constructible Hall convolution. The supplied sibling heads were included in the open-head searches; relevant matches and exact cited sections were read. Ownership against open pull requests was checked.

The general categorical decomposition, uniqueness and radical block description belong to ArtinAlgebras Layer 0. Their restatements were replaced by consumption of that section; the finite-field residue and nilpotence applications remain here. General coherent Ext–Hom duality belongs to the specified SchemeAndStackFoundations extension; only its invariant-subsheaf criterion is a local target. These replacements are also recorded in Scope and ownership. The full degree API, bundle/torsion masses, Lang theorem, groupoid mass, Young diagrams and arm/leg lengths retain their existing owners. No new carrier or duplicate API was introduced for them.

NilpotentOrbits treats complex Jordan/orbit geometry, not the finite-field nilpotent cardinality. The BB constructions on flag varieties, minuscule spaces and period domains have different carriers from these Higgs strata. No other owner of the two native headlines, the coherent nilpotent Jordan mass calculation, curve shuffle kernels, or their counting/cohomological comparisons was found. These are the reasons this roadmap retains them. No local declaration is given another roadmap's fully qualified name.

Pinned source revisions: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The imports and native definitions were checked directly at those pins.

| Supplier | Exact section or pinned source inspected | Contract boundary |
| --- | --- | --- |
| Mathlib matrix cardinality | Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Card.lean line 120 | `Matrix.card_GL_field`; finite field, empty product 1. |
| Mathlib radical theory | Mathlib/RingTheory/Artinian/Ring.lean line 54; Mathlib/RingTheory/Artinian/Module.lean line 641 | Associative Artinian ring; nilpotent Jacobson radical and semisimple criterion. |
| Mathlib finite division rings | Mathlib/RingTheory/LittleWedderburn.lean line 176 | Finite ring with a domain instance. |
| Mathlib categorical carriers | Mathlib/CategoryTheory/Limits/Shapes/BinaryBiproducts.lean line 1096; Mathlib/CategoryTheory/Skeletal.lean line 74; Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean line 39 | Indecomposability includes nonzeroness; skeleton counts isomorphism classes. |
| Mathlib Young diagrams | Mathlib/Combinatorics/Young/YoungDiagram.lean lines 66 and 186 | Finite lower-closed diagrams and transpose; cell membership is retained. |
| Tau Ceti fixed-rank sheaves | TauCeti/AlgebraicGeometry/VectorBundle/FixedRank.lean lines 69 and 104 | Fixed rank at every point, full subcategory and pullback. |
| Tau Ceti Euler degree inputs | TauCeti/AlgebraicGeometry/Cohomology/EulerCharacteristic.lean line 105; TauCeti/AlgebraicGeometry/LineBundle/Basic.lean line 131 | Truncated finrank sum has no finiteness baked in; trivial line is native. |
| Tau Ceti arms and legs | TauCeti/Combinatorics/Young/HookLength/Basic.lean lines 136 and 140 | Natural subtraction is total; actual cells enter every product. |
| AlgebraicVectorBundles | Layers L0A–L0C, L1–L2B, on main | Bundles, determinant, tensor, dual and base change. |
| QuiverRepresentations; ArtinAlgebras | Main Layers 1–2; new ArtinAlgebras Layer 0 Recognition, Uniqueness, Indecomposables, radical paragraph | Distinguishes finite-length modules from Hom-finite coherent categories. |
| SchemeAndStackFoundations | Main §§1.18–1.21, 2.6, 2.18, 2.20, 3.3, 3.6–3.7, 4.1, 4.5, 4.14 | Its §3.3 Ext–Hom theorem has locally free first input; coherent/coherent smooth-curve extension is explicit. |
| ClassicalGroupsPartII | CG.0.4–0.5, CG.2.4–2.6 | Full Weyl-fixed character ring, not the positive tensor subring. |
| FunctionFieldArithmetic | §§0.2–0.3, 5.1–5.4 | Integer divisor of degree one; exact constants, reciprocal zeta polynomial, Picard comparison. |
| GlobalShtukasAndFunctionFieldLanglands | §§0.1, 0.5–0.6, 0.13 | Fixed-central-degree HN bounds, coherent heredity, masses, Harder residual input. |
| WeilConjectures | WC.1, Finite groupoid mass | Finite isomorphism classes and automorphism groups; Fubini is additional here. |
| EndoscopicTransferAndUnitaryTraceComparison | §§3.6–3.7 | Weyl-order characteristic restriction in 3.6; all-field coherent Higgs and good frames in 3.7, with stated chart correction. |
| AutomorphicSpectralTheory | §§6.22c, 6.24 | Bundle Higgs HN, coprime stability and bundle deformation complex; coherent derived columns are additional here. |
| ReductiveGroupsPartII | RG2.3.7 | Smooth connected finite-type group for Lang; disconnected bands use a separate neutrality theorem. |
| SchemeKTheoryOperations | §§6.2.1–6.2.2 | Special λ-rings and Newton Adams operations, positive index. |
| HabiroNahmSeries; HabiroCyclotomicCompletions | §5.1; §1.1 | Ordinary augmentation exp/log and elementary plethystic operations; complete coefficient-parameter extension remains explicit. |
| QSeriesPartitionsAndMockModularForms | §§2.4, 3.5 | Formal q-binomial/Euler and partition adapters; not modified Macdonald admissibility. |
| DeligneWeightsAndPurity | §§0.10, 0.12, 0.16–0.18, 1.7, 7.12, 7.15, 8.8–8.11, 10.5 | Characteristic-zero reconstruction, no diagonalizability assumption; proper smooth purity and degree-fibre equidistribution. |
| ArithmeticStatisticsPartVIII | §5.17, named symplectic monodromy and integral lift targets | Odd characteristic and auxiliary ℓ≥5 include genus one. |
| EtaleDualityAndPerverseSheaves | §§0.4, 0.6–0.7 | Rational duality/trace; affine bundle comparison is an explicit extension. |
| CohomologicalPointCounting and its named children | The combined endpoint; CompactSupport Layers 6–8, EllAdicRealization Layers 7–9, TraceFormula Layers 11–12 | Common spread-out, constructibility, compact base change and Frobenius convention. |
| ComplexComparisonPartII | C6.3–C6.6 | Finite/integral/rational compact comparison for separated finite-type complex schemes, bounded coefficient systems. |

## Computed adversarial mathematics pass

The rows test statements and their defining/API laws, including every numbered subsection and the supplier conventions. These computations test truth on the indicated instances; they do not replace proofs of the general targets. For nonstatable headlines the computations concern the README mathematics, not a surrogate Lean encoding. All verdicts and edits were performed by the port agent; no helper agents were used.

Exact arithmetic recomputed the origin series through rank four by enumerating partitions, expanding the geometric denominator factors, forming ordinary logarithmic coefficients and applying the Möbius Adams correction. Coefficients z^100 through z^104 were respectively constant at (1,1,1,1), (1,2,6,22), (1,3,15,95) for genera 1,2,3. The finite-matrix enumeration directly checked trace=determinant=0 in dimension two over F₂,F₃,F₅. The F₄ elliptic calculation used F₂[w]/(w²+w+1). Other rows show their direct scalar, categorical or geometric witness calculations.

| Statement | Instances tried | Values computed on each side or in the competing model | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Euler order | P¹, O and O(1) | χ(O,O(1))=2; χ(O(1),O)=0; symmetric sum 2 | agrees | none |
| Conventions: finite-field tower | y²+y=x³ over F₂,F₄,F₆₄ | #E=3,9,81; F₄ eigenpair (−2,−2) cubed gives (−8,−8), 65+16=81 | agrees | none |
| Conventions: Adams on coefficients | formal q=2, pair (−1,−2) | P(1)=6; ψ₂P=1−1−4+4=0; ψ₂(1/(q−1))=1/3 | agrees | none |
| Conventions: residues | h⁻¹,h⁻², h=1−z | normalized coefficients 1,0; differential residues −1,−1 | agrees | none |
| Conventions: dimensions and twists | genus 2, rank 1 | D=2; coarse/stack/core dimensions 4,3,2; compact shift 4 and twist −2 | agrees | none |
| 0.1 reciprocal coefficient ring | g=0; g=1,a=3,q=2 | R₀=Q[q±1]; a+q/a=11/3 before/after flip; a changes 3 to 2/3 | agrees | none |
| 0.1 specialization domain | q=1 versus q=2 | q−1=0 versus 1; at Adams index 2 denominator q²−1=3 | agrees | none |
| 0.2 bundleDegree | P¹ O(1), O(1)⊕O(−1); genus-two O² | 2−1=1; 2−2=0; −2−2(−1)=0 | agrees | native specialization retained |
| 0.2 absolute predicate | O, O², zero | local geometric end ring k̄: indecomposable; diag(1,0): split; zero fails nonzeroness | agrees | none |
| 0.2 unweighted count | one line over F₃; ranks 0,1,2 on P¹ | count 1 versus mass 1/2; counts 0,1,0 at every degree | agrees | none |
| 0.2 decorated torsion count | rational length-two block; degree-two-point simple | absolute indicators 1 and 0; second splits into 2 geometric supports | agrees | none |
| 0.2 HN extension | O(2)⊕O(−1), torsion, zero | slopes (2,−1) unchanged; torsion ∞ unchanged despite 2 supports; zero has 0 factors | agrees | none |
| 0.3 residue linearity and order | 2/(1−z), regular 1 | normalized residues 2,0; differential −2,0 | agrees | none |
| 1.2 coherent decomposition application | zero, line, two copies; local dual-number end ring | 0,1,2 summands; t²=0; (1+t)²=1 over F₂; residue cardinality 2 | agrees | categorical theorem consumed |
| 1.3 radical blocks | N=F₂[t]/t², M=N² | radical dimension 4; semisimple quotient cardinality 16; copywise-only model gives dimension 2 | agrees | radical description consumed |
| 1.4 nilpotent count | n=0,1; n=2 over F₂,F₃,F₅ | 1,1; enumerated 4,9,25 = Q²; n=0 exponent 0 gives 1 | agrees | missing headline added |
| 1.5 radical fibre cancellation | zero; line/F₃; O²/F₂; dual-number block/F₂ | ratios 1,1/2,4/6=2/3,2/2=1; quotient formula same | agrees | none |
| 1.6 neutrality versus uniqueness | G_m, C₂, S₃ over a finite field | G_m H¹ has 1 class; constant C₂ has 2, S₃ has 3 conjugacy classes; neutral H² does not change these counts | agrees | none |
| 1.7 descent orbits | one orbit of length 2; extension degrees 1,2 | fixed summands 0,2; divisor expression 0,2; descended class 2α | agrees | none |
| 1.8 coprime residue | rank 2, degree 1; k[t]/t² | e divides gcd(2,1)=1; scalar quotient dim 1, full algebra dim 2; c+bt decomposition unique | agrees | none |
| 1.9 slope bound | rank 1 degrees −1,0,1; genus2 rank2 | cutoff indicators 0,1,1; threshold 2 and d=3>2; genus-one gap 0 | agrees | none |
| 1.10 normalization | P¹, twist O(1), dual | line count 1; higher-rank count 0; degrees d→d+r and d→−d | agrees | none |
| 2.1 homotopy Fubini | BS₃ identity, BC₂→BS₃, B(C₂²)→BC₂ | 1/6=1/6; 1/2=3/6; 1/4=(1/2)(1/2) | agrees | none |
| 2.2 pair groupoids | zero, line/F₃, torsion block | masses 1,1/2; Id on line not nilpotent; multiplication by t has square 0 | agrees | none |
| 2.3 exponential | one species, q=2, multiplicity2 | 1/2+1/6=2/3, equal to 4/6 | agrees | T,z notation aligned |
| 2.4 Jordan classes | zero endomorphism; size2 block | α₁=[F]; size2 has r₁=0,r₂=1 and weighted rank 2; torsion α₂ degree1 gives degree2 | agrees | none |
| 2.5 filtered groupoids | O(−1)⊂O² and O(1)⊂O(1)⊕O(−1) | total minimum slopes 0 and −1; cutoff indicators 1,0; O,O flag mass 3/6=1/2 | agrees | none |
| 2.6 grading functors | O(−1)² with one Jordan block; torsion length2 | H₁=0,H₂=H; cutoffs false/false and true/true; torsion degrees F=2,H=1 | agrees | none |
| 2.7 fibre masses | one step; α₂=O on P¹/F₂ | exponents (0,0,0) give masses1; (d,d′,d″)=(−1,−1,0) give 1/2,1/2,1 | agrees | none |
| 3.1 Hall operations | O,O on P¹/F₂ | product at O²=3v; coproduct coefficient v/2; unit factor1 | agrees | none |
| 3.2 Green compatibility | same object | pairing 3v/6=v/2, matching coproduct divided by |Aut O|²=1 | agrees | none |
| 3.3 characteristics | rank2 plus length1 torsion | v²v⁻²=1; bundle characteristic on positive-length torsion=0; negative torsion-degree support empty | agrees | none |
| 3.4 flag masses | O⊂O² over F₂ | three subobjects/6 automorphisms=1/2=v⁻¹(v/2) | agrees | none |
| 4.1 Eisenstein distributions | O⊕k_x; O(−1); O(1)⊕O(−1) | vv⁻¹z=z; unrestricted z⁻¹ vs positive0; full degree-zero characteristic1 vs positive0 | agrees | none |
| 4.2 Hecke shifts | ranks0,1,2 at q=2 | factors:1; ζ(z/(√2w)); ζ(z/(2w))ζ(z/w); each constant1 | agrees | none |
| 4.3 coproduct | rank0; split1+1,g=0 | E₀⊗E₀; multiplier q⁻¹ᐟ² with shifts q¹ᐟ² and q⁻¹ᐟ² | agrees | none |
| 4.4 Eisenstein residues | rank1; rank2 simple pole | V₁⁻¹V₁=1; normalized residue1 vs differential−1 | agrees | none |
| 4.5 HN factorization | O(1)⊕O(−1) on P¹ | quotient-left Euler exponent3; q⁻¹ᐟ²q⁻¹q³ᐟ²=1 | agrees | none |
| 4.6 spherical algebra | O²/F₂, rational torsion, unstable family | generator square3√2 vs characteristic1; torsion generator takes1 on k_x,0 on O; infinitely many O(m)⊕O(−m) have value1 | agrees | none |
| 4.7 HN strata | P¹ types ((2,0)),((1,1),(1,−1)), equal-slope two-step | class counts1,1,0; last is not an HN type | agrees | none |
| 4.8 generic coefficients | one line mass at q=2,3 | P/(q−1)=P,P/2; a single-step normalized Euler factor1 | agrees | none |
| 4.9 truncated universality | P¹/F₂, ranks0,1, degree1 | N₀=1+3z+…; [T]N=1+4z+…; quotient coefficient4−3=1 | agrees | T aligned |
| 4.10 density | q=3,9,27, normalized multipliers | original q=3,9,27 vs normalized1; (q−3)/t²=0,2/3,8/9→1 | agrees | theorem remains local target |
| 5.1 pairing series | one slot at w=0,∞ | V/(1−zw) has positive coefficients V; −V/(1−zw) has negative coefficients V; wrong region gives −V | agrees | none |
| 5.2 torsion separation | P¹/F₂, rank1 | first torsion factor3/2; full degree1 mass1+3/2=5/2 | agrees | none |
| 5.3 unrestricted pairing | ranks1,2 | shifts q⁻¹,q¹ᐟ²; at q=4 these are 1/4,2; single rank returns V_r | agrees | none |
| 5.4 distribution rationalization | (1−z)⁻¹ at0 and∞ | (1−z)Σ_(n≥0)z^n=1; (1−z)(−Σ_(n<0)z^n)=1 | agrees | none |
| 5.5 shuffle sign | one slot; two slots | positive V/(1−zw), negative −V/(1−zw); sign at s=2 is +1 | agrees | none |
| 5.6 block residues | block1; block2,g=2 | no residue/prefactor1; a=−1/2,b=0 in the two normalizations | agrees | none |
| 5.7 weighted Jordan sum | only r₂=1,deg α₂=1 | weighted monomial T²z²; incorrect unweighted model Tz | agrees | none |
| 5.8 positive arms | partitions(1),(2),(1,1),(3) | 1,ζ(q⁻¹z),1,ζ(q⁻¹z)ζ(q⁻¹z²) on both sides | agrees | none |
| 5.9 partition kernels | empty,(1),(2) | empty1; one-box P/((q−1)(1−z)); H_(2) coefficients at z,z²=0,1 vs H_(1)=1,1 | agrees | none |
| 5.10 Jordan product | P¹/F₂, empty and one-box types | torsion factor1+3z+…; multiplied one-box factor gives1+4z+… | agrees | none |
| 6.1 partition exponential | ranks0,1 | constants1 and P/((q−1)(1−z)); multiplying Log by q−1 gives P/(1−z) | agrees | none |
| 6.2 residue Fourier extraction | (2+3z)/(1−z²) over Q | differential residues −5/2,+1/2; negative Fourier sums2,3; in char2 denominator(1−z)² | agrees | none |
| 6.3 bundle residue formula | rank1; rank2 on P¹ and elliptic/F₂ | residues−P→P; 0,0→0; −3,0→3 in both parities | agrees | none |
| 6.4 rank-two formula | g0,q2; formal g1,q2; g1,q5,a=2/3; g2,q3,a=2,b=−1/2 | counts0,6,−13/6,294; genus1 values equal P | agrees | none |
| 6.5 regular origin | one-box count; q⁻¹; paired relation | value1; q⁻¹ undefined at0; α₁α₂=0=q | agrees | none |
| 6.6 constant partition series | genera1,2,3; ranks1–4 | eventual coefficients (1,1,1,1),(1,2,6,22),(1,3,15,95); rank1 differential residue−1→1 | agrees | third Check added |
| 7.1 exact positive category | O(−1)⊂O²; zero fields on L,L² | min slopes−1,0; quotient O(1) positive; L stable, L² has equal-slope line so not stable | agrees | none |
| 7.1 coherent derived comparison | rational torsion skyscraper | Higgs Ext dimensions1,2,1 vs naive Hom-column1,1,0 | agrees | none |
| 7.1 differential sign | elliptic (O,0)→(O,η) | Id maps to +η; coefficient+1 vs sign-reversed−1; complex cohomology0 | agrees | none |
| 7.2 invariant-subsheaf criterion | W=ke₁⊂k², lower-left entry0 or1 | preservation true/false; restriction factors through W exactly for0 | agrees | duality consumed |
| 7.3 stable canonical geometry | rank1,g2; elliptic rank2,char2; dual-number scalar | dimensions4,3,2; t²+a² gives fibre a²=0, reduction a=0; ε²=0 but coefficient−ε≠0 | agrees | none |
| 7.3a framing choice | g1,r1,d0; g2,r2,d1 | (d₁,l₁,d₂,l₂,C)=(2,2,7,7,14),(5,9,24,47,423) | agrees | moved before chart |
| 7.3a kernel bound | g2,r2,d1, fixed source rank9 | kernel rank7,degree−46; μ_min≥−16, hence μ_min+24≥8>3 | agrees | none |
| 7.3a generation boundary | P¹, O and O(−1), L=O | slopes0>−1 gives evaluation onto; slope−1 at equality has H¹=0 but evaluation0 | agrees | none |
| 7.3a dimension determinant | l=(3,10), vector(1,0) | determinant10 becomes0 in char2 and remains10 in char31; zero/full vectors0 | agrees | none |
| 7.4 chart and frame torsor | genus-two nonspecial degree2 factor; elliptic fixed source | Hom dim1+8=9,Ext¹=0 yet basepoints; second Hom20+27=47; elliptic kernel rank1,degree−4 | agrees | none |
| 7.5 cotangent exact sequence | line, zero covector, genus g | kernel dimension g; moment value0; Higgs fibre dimension g | agrees | none |
| 7.6 doubled moment map | scalar x=2,y=3; x=y=1 in F₂ | (6,−6), sum0; (1,1), sum0; y=0 gives(0,0) | agrees | none |
| 8.2 King character and slope | l=(2,3), vectors(1,1),(1,2); framed sublines | δ=−1,+1; genus-two d′=1,0 gives−19,+19 | agrees | none |
| 8.3 central fibre criterion | End dimension h, indecomposable; proper projector | (q−1)q^(h−χ)/((q−1)q^(h−1))=q^(1−χ); projector λ=−δ≠0 for p>C | agrees | none |
| 8.4 framed smooth open | elliptic/F₂ with l=(2,7) | minimal pair(1,5) has δ=3; (0,a₂) has δ=2a₂>0 despite p<C | agrees | none |
| 8.4 frame vanishing obligation | g2,r2,d1,F=L₁⊕B,deg B6 | h⁰=11,h¹=2, frame dimension9; destabilizer(8,29) gives261−376=−115 | agrees | separate target retained |
| 8.4 moment differential target | F₃ two-arrow dimension(1,2) | μ=(2,−I₂); effective ambient dimension4, restricted central image dimension1 | agrees | none |
| 8.5 two stability directions | sublines of degrees1,0 in class(2,1) | slopes1,0 vs1/2; δ19(1−2)=−19 and19(1−0)=19 | agrees | none |
| 8.6 central deformation | rank1,g2; nonzero parameter t | every fibre has q²P points; inverse scaling t⁻¹t=1; noncentral value changes under conjugation | agrees | none |
| 8.7 BB comparison | A¹×A² over F₃ | total27=3·9; fibres9,9; 9+(3−1)9=27 | agrees | none |
| 8.8 geometric count | rank1,g2; P¹ ranks1,2 | q²P=q^D A; 1=1; 0=0 | agrees | none |
| 8.9 normalized Higgs integration | q2,g1 rank1; q2,g2 rank1 | 6=Ω; q⁻¹q²P/(q−1)=2P, wrong reciprocal normalization8P | agrees | none |
| 8.9 slope-zero and Adams | elliptic/F₂ rank2 degree0 | mass30; Log coefficient30−18−6=6; ψ₂ rank-one mass12 contributes6 | agrees | none |
| 8.9 cutoff and strict separation | rank1 degree−1; self-pair vs strict slopes | ordinary Ω6 vs positive coefficient0; self Ext² dim1 vs separated0 | agrees | none |
| 8.10 all-characteristic endpoint | elliptic over F₂,F₄ | A3,9; Ω6,36; coarse counts6,36; masses6,12; pA over F₄ would be18 | agrees | none |
| 9.1 BB cohomological shifts | rank1,g2; char2 elliptic core | (m,b,D)=(2,0,2), shift4/twist−2; (1,0,1), core Pic¹, thickening has same étale cohomology | agrees | none |
| 9.2 positive invariant class | rank1,g1; g2,r2 | (1+α₁)(1+α₂)=1+α₁+α₂+q; top degree10, not divisible by4; q⁵ has two positive representatives | agrees | none |
| 9.3 compact polynomial | rank1,g1,g2 | signed t²(1−t)² and t⁴(1−t)⁴; unsigned plus signs; top degrees4,8 | agrees | none |
| 9.3 spread-out restriction | point vs two points; elliptic compact stalks | H_c⁰ dimensions1,2 cannot share lisse rank; elliptic dimensions1,2,1 in degrees2,3,4 | agrees | none |
| 9.4 reciprocal trace/components | rank1,g2; two permuted components | q²∏(1−α⁻¹)=P; top dim1; permutation matrix on2 components has trace0 but dimension2 | agrees | none |
| 10.1 Mellit coefficient | formal q2,a=−1 and−2; actual elliptic/F₂ | 3(z+1),2(z+2); values at1 both6, at0 3,4; actual value3; empty Log0 | agrees | none |
| 10.2 regular deformation | constant sequence; nonconstant generic witness | constant1 satisfies1=1; f₂(1,5)=15=f₁(3·5), wrong q_M scaling10 | agrees after correction | generic contract t_M shift fixed |
| 10.3 global Laurentness | rank1; 1/(1+z) | polynomial H₁ regular; control value1/2 at1 but pole−1 | agrees | none |
| 10.4 degree independence | P¹ ranks0,1,2; periodic control | 0,1,0 in all degrees; control(2+3z)/(1−z²) gives2,3 and forbidden−1 pole | agrees | none |
| 10.5 transfer to all degrees | g2,r2,d0,1 | gcd(2,1)=1; origin values2=2 and top degree10 in both classes | agrees | none |
| 11.1 parabolic indecomposability | P¹ O² with flags e₁,e₂,e₁+e₂ | first two force diagonal dimension2, third forces scalar dimension1; absolute indicators0,1 | agrees | none |
| 11.2 parabolic universality | trivial flags; two-step mark; localized control | rank1 countP; Euler values0 and1 in opposite jump orders; (q−1)⁻¹ at2=1, at1 undefined | agrees | none |
| 11.3 HN-refined counts | genus2 nonzero extension O by O(P); split extension | Ext¹ dim1; μ=1/2,min0, cutoff≥1/2 indicator0; absolute indicators1,0 for nonsplit/split | agrees | none |
| 11.4 slope-cut universality | rank1,ν0,d=−1,0 and dual d=1,0 | lower counts0,P; upper dual counts0,P | agrees | none |
| 11.5 Euler Hall Lie algebra | scalar unit; torsion and line on P¹_C | c=2c forces0; two convolution orders2,0, commutator2; q−1 limit denominator0 | agrees | none |
| 11.6(i) fixed-type conjecture | rank1,d0 | sole HN type, universal valueP and origin1 | consistent instance | remains conjectural |
| 11.6(ii) slope difference conjecture | rank1,d0,i0 andi1 | A≥0−A≥1=P−0=P; next difference0−0=0; P(−α)=∏(1+α) | consistent instance | remains conjectural |
| 11.6(iii) primitive multiplicity conjecture | rank1,genus2 | proposed multiplicity1=origin constant1=one cone component | consistent instance | remains conjectural |
| 11.6(iv) Hilbert-series conjecture | unit and one primitive species | constant coefficient1; Exp(T) coefficientT²=1, ordinary exp gives1/2 | consistent instance | remains conjectural |
| 11.6(v) marked integrality conjecture | one mark of length1; rank1 flags | no flag choice, countP∈R_g, origin1 | consistent instance | remains conjectural |
| Supplier degree/Quot conventions | line at genus2; fixed source rank9 | χ(O)=−1 but degree0; fixed kernel rank7,degree−46, extra source changes both | agrees | no duplicate general degree |
| Supplier full character ring | g1,q2,a3; scalar representation | flip sends3→2/3; invariant sum11/3; multiplier q=2 remains a unit | agrees | none |
| Supplier groupoid mass | S₃ acting on3 letters vs BS₃ | masses3/6=1/2 and1/6; empty groupoid0 | agrees | none |
| Supplier Lang and bands | G_m/F₃, constant C₂ | geometric Lang z↦z² onto; rational map values only1; H¹(C₂) has2 classes | agrees | none |
| Supplier λ and Adams | binomial integer2; line variable a | ψ₂(2)=2 vs power4; ψ₂(a)=a²; λ²(2)=1 | agrees | none |
| Supplier ordinary/plethystic series | log(1+uv), Exp(T), Exp(−T) | uv coefficient1,u²v²−1/2; T² coefficients1,0 vs ordinary exp1/2 | agrees | conditional extension retained |
| Supplier Macdonald regularity | q_M2,t_M3,x5 | f₂(1,5)=3(1+5−1)=15=f₁(15), not f₁(10) | agrees after correction | t_M replaces q_M |
| Supplier Frobenius trace and duality | A¹, G_m, P¹ at q3 | compact traces3,2,4; twist(−1) eigenvalue3; inverse convention1/3 fails | agrees | none |
| Supplier affine shift | affine rank1 over point at q3 | only H_c² has dimension1 and eigenvalue3; degree0 model trace1 fails | agrees | extension retained |
| Supplier density and monodromy | genus1,ℓ5; excludedℓ3 | multiplier q3→normalized1; ℓ3 countergroup order24 and index27, so ℓ5 route avoids it | agrees | local density theorem retained |
| Supplier complex comparison | E×A¹ | compact dimensions1,2,1; signed t²−2t³+t⁴ on a common lisse stratum | agrees | none |

## Unresolved contracts and source limits

The accepted review is conditional on eight named interfaces. This port preserves that decision; it does not claim that the following extensions have appeared in their suppliers. Seven required-extension paragraphs remain explicit:

1. SchemeAndStackFoundations: coherent/coherent natural Ext–Serre duality on smooth curves. Its cited main theorem only has locally free first input.
2. AlgebraicModuliForArithmeticGeometry: reductive character GIT. Its §4.19 is affine-gerbe factorization, not this theorem.
3. EndoscopicTransferAndUnitaryTraceComparison: the locally free canonical Higgs stack and comparison across the stated characteristic range.
4. The same supplier: the two-Hom-frame versus first-evaluation epimorphism distinction, and the restricted cotangent quotient. This is an additional explicit correction contract in the accepted package beyond the eight review slugs.
5. HabiroNahmSeries: complete filtered coefficient-parameter Adams/Exp/Log calculus.
6. QSeriesPartitionsAndMockModularForms: modified Macdonald/HLV admissibility and regular-sequence deformation. The variable convention in this contract is now corrected against M20.
7. EtaleDualityAndPerverseSheaves: the Frobenius-equivariant affine-bundle compact comparison with its localization compatibility.

Of the accepted review's other labels, degree-only strong generation is an explicit target and proof in §7.3a, and universal curve Weil density is an explicit target and proof in §4.10. They were not silently attributed to a supplier or omitted. Fixed-source good lines are handled by the numerical target together with the supplier's bounded chart, retaining the locally free comparison contract above.

No theorem uses the five conjectures as a supplier. The small-characteristic all-field counting endpoint remains separate from the large-characteristic deformation route.

M20's published Definitions 5.1 and Theorem 5.2 and the relevant proof were read directly at the [publisher's full text](https://link.springer.com/article/10.1007/s00222-020-00950-1). The scaling correction uses M20 line 435; the curve-variable correspondence uses M20 line 420; Laurentness and equality at the specialization use M20 lines 572 and 575. S16 and MS14 were opened at their published/versioned primary sources for the counting and framing comparisons. FH58 and HES81 retain exact locators but their full primary proofs were not independently inspected in this port; the matrix formula is also stated in S16 Corollary 2.5. General geometric and conjectural assertions are not proved by the numerical table or the sorry build.

No suspicious instruction in fetched material was acted on. No network write, push, issue, comment or pull-request operation was performed.


Pull request: #1547 (roadmap/counting-bundles-and-hall-algebras-of-curves at 51072a4)
