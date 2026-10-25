# Repair report: counting bundles and Hall algebras of curves

## F01 (P1) — applied

In `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md` §4.9, raw coherent rank-one coefficient → coefficient after division by N₀. Added the factor q−1 for Log extraction and the P¹/𝔽₂ witness: raw 4, quotient 1. S16 line 2224 includes the torsion factor; S16 line 2246 cancels it. Recomputed consumers §§2.3, 5.7, 5.9–5.10 and 6.1–6.3; their formulas already agree.

## F02 (P1) — applied

In `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md` §8.10, Ω=2A in characteristic two → Ω=qA for q=2^f. Added E:y²+y=x³: (A,Ω,#H)=(3,6,6) over 𝔽₂ and (9,36,36) over 𝔽₄, with stack masses 6 and 12. MS14 line 582 gives Ω_K=qA. Recomputed §§7.3, 8.8–8.10 and the rank-one worked example; their formulas already agree.

## Verification outcomes

- Elaborated `packages/CountingBundlesAndHallAlgebrasOfCurves/Suggested.lean` with the required `lake env lean` invocation from the content checkout: exit 0. Exactly two expected warnings, at lines 83 and 93, that the declarations use `sorry`. No missing imported object files; no module build was necessary.
- Elaborated one scratch file containing the unchanged acceptance test followed by `#check @name` for all five declarations: exit 0, the same two expected warnings. Compared every elaborated type with §§0.2, 1.4 and 10.4. No lost binder or mismatch; no Lean edit needed.
- Ran the required movable dependency check: exit 0, exact output:

    depcheck: 51 roadmaps, 597 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- Citation resolution against main 6383577 and the indexed open heads found no unresolved cross-roadmap citation or roadmap Lean name. Its external-library lookup was unavailable, so the cited library declarations were checked directly at Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, matching the manifest and dependency HEADs.
- Re-read the cited supplier sections at the main checkout or the indexed new-roadmap heads, including the full-character-ring map, coherent HN and mass formulas, coherent versus bundle Higgs carriers, canonical deformation complex, Adams calculus, monodromy range, duality and compact comparison. The checkout README files used for main citations agree with its main ref; the differing commits concern progress/status files. Read QuiverRepresentations, AlgebraicVectorBundles and SchemeAndStackFoundations for upstream shape.
- Searched objects in the pinned libraries, main/open roadmaps with the roadmap search tool, and board packages. The only pinned “Higgs” hits concern matroids. The coherent Higgs carrier remains owned by EndoscopicTransferAndUnitaryTraceComparison §3.7; bundle Higgs HN/deformation remains AutomorphicSpectralTheory §§6.22c, 6.24. Curve nilpotent-pair masses and the conversion to the absolute bundle invariant remain this roadmap's targets. The board's TopologicalMirrorSymmetryForHitchinSystems consumes this canonical GL geometry and extends it to fixed determinants. No construction, ownership move or declaration was added.
- All eight plan gaps still have matching supplier, section and README contract slugs. The plan, metadata and source manifest are unchanged. Both repairs use the already certified S16/MS14 texts. M20, FH58 and HES81 remain settled locator-only citations; no source request is needed.
- No gate failure was listed in the brief. The two numerical findings required the two README Check repairs above. `git diff --check` passes.

The five mechanically inspected signatures retain the following data.

| Declaration | Elaborated binders compared with README | Outcome |
| --- | --- | --- |
| `bundleDegree` | k, Field k, X, X over Spec k, implicit natural rank r, fixed-rank sheaf E; result ℤ | Agrees; intentionally a total definition before curve hypotheses |
| `IsAbsolutelyIndecomposable` | k, Field k, X, X over Spec k, implicit r, E; result Prop | Agrees; native geometric pullback and nonzero indecomposability |
| `absIndecCount` | k, Field k, X, X over Spec k, natural r, integer d; result ℕ | Agrees; finiteness is a separate curve target |
| `nilpotent_matrix_count` | K, Field K, Finite K, natural n; subtype of nilpotent Fin n matrices | Agrees, including n=0 |
| `absIndecCount_eq_of_degree` | k, Field k, X, X over Spec k, Finite k, proper structure map, smooth relative dimension 1, geometrically connected structure map, natural r, integer d,d′ | Agrees; all geometric and finite-field hypotheses retained |

## Computed adversarial pass

These are computations of witnesses and negative controls, not proofs of the general targets. Every numbered subsection is represented; compound definitions and the repaired Checks have additional rows. Formal reciprocal tuples below are algebraic tests, not asserted curve Weil tuples. The coefficient rings have characteristic zero. The finite-field hypotheses exclude q=1 and the zero ring; smooth curves exclude nodal and square-zero curve models. No generality was narrowed.

| Statement | Instances tried | Values computed on each side or in the wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: denominator domain | q=2,3; Adams indices 1,2; q=1 | q^m−1 gives 1,3 and 2,8; q=1 gives 0 | Actual specializations defined; q=1 excluded | None |
| Conventions: Euler/Hall order | O,O(1) on P¹ | χ(O,O(1))=2; reverse χ=0; Hom dimensions 2,0 | Order distinguished | None |
| Conventions: geometric Frobenius and extension | E/𝔽₄ and extension degree 3 | 1+4−(−2−2)=9; 1+64−(−8−8)=81 | Extension raises all parameters | None |
| Conventions: Adams on coefficients | Formal q=2, α=(−1,−2) | P(1)=6; ψ₂P(1)=1−1−4+4=0; ψ₂(1/(q−1))=1/3 | Fixed coefficients would fail | None |
| Conventions: dimension and twist | Rank one, genus two | D=2; coarse/stack/cone dimensions 4,3,2; compact shift 4 and twist −2 | Agrees | None |
| Conventions: field changes | Identity extension; k[ε]/ε² | Degree 1 remains 1 under identity; ε²=0 with ε≠0 in the thickening | Nonfield base excluded from field-extension assertion | None |
| Supplier: finite groupoid mass | S₃ on three letters; BS₃; empty | 3/6=1/2; 1/6; 0 | Weights differ from class counts | None |
| Supplier: coherent duality | Smooth rational skyscraper; nodal skyscraper | Smooth Ext¹ and Hom dimensions 1,1; nodal dimensions 2,1 | Smooth hypothesis essential to stated contract | None |
| Supplier: strong generation | O(−1) on P¹ generated from O | Ext¹ dimension 0; Hom dimension 0; evaluation rank 0 rather than 1 | Vanishing alone insufficient | None |
| Supplier: character GIT | Diagonal scalar t in dimensions 2,3 | Character t^(2·3−3·2)=1; scalar stabilizer dimension 1 | Effective quotient required | None |
| Supplier: locally free comparison | Line; line plus a skyscraper | Local ranks 1 and 1 with torsion length 1; latter not locally free | Locus distinction retained | None |
| Supplier: complete Adams extension | T and −T | Exp(T): coefficients 1,1,1; Exp(−T): 1,−1,0; ordinary exp(T) has T² coefficient 1/2 | Plethystic convention fixed | None |
| Supplier: Macdonald deformation | Constant regular sequence f_n=1 | f_(n+1)(1,x)=1=f_n(qx); deformation constant coefficient 1 | Compatible specialization | None |
| Supplier: universal density route | g=0; fixed q₀=3, extension degrees 1,2 | q coordinates 3,9; q−3 has values 0,6; normalized multiplier 1,1 | Radial coordinate must remain | None |
| Supplier: monodromy range | g=1, auxiliary ℓ=5 versus 3 | ℓ=5 integral image full; at ℓ=3 a subgroup of index 27 has full mod-3 image | ℓ≥5 choice respects exception | None |
| Supplier: affine compact shift | A¹ and G_m | Compact alternating traces q and q−1; at q=4, 4 and 3 | Degree 2, twist −1 retained | None |
| §0.1 coefficient ring | g=0; g=1,q=6,a=2; Weyl flip a→3 | R₀=ℚ[q±1]; a+q/a=5 before/after; a changes 2→3 | Full invariant ring distinguished | None |
| §0.1 coefficient evaluation | q=2,m=2 | ψ₂((q−1)⁻¹)=1/3 versus naive squared inverse 1 | Adams localization agrees | None |
| §0.2 bundleDegree | O(1),O(−1),O(1)⊕O(−1) on P¹ | 2−1=1; 0−1=−1; 2−2=0 | Riemann–Roch normalization agrees | None |
| §0.2 trivial and zero degree | Genus two, O² and zero | −2−2(−1)=0; 0−0=0 | Zero and higher genus included | None |
| §0.2 degree invariance | Two presentations of O(1); field extension | H⁰,H¹ dimensions (2,0) each; computed degree 1 each | Isomorphism and base-change witness agrees | None |
| §0.2 absolute predicate | O,O²,zero | Nonzero summand counts 1,2,0; projector diag(1,0) has rank 1 | Predicate true,false,false | None |
| §0.2 count versus mass | Single line over 𝔽₃; rank zero | Class contribution 1; mass 1/2; rank-zero count 0 versus zero-object mass 1 | Count carrier agrees | None |
| §0.2 coherent torsion | Rational length-two block; degree-two closed-point simple | Geometric summand counts 1 and 2; only first absolute | Rational and absolute separated | None |
| §0.2 HN field extension | O(2)⊕O(−1), zero, degree-two torsion | Slopes 2,−1 unchanged; empty filtration remains empty; torsion slope +∞ before/after split | Cutoff compatibility agrees | None |
| §0.3 residues | (1−z)⁻¹,(1−z)⁻²,constant 1 | Normalized/differential residues (1,−1),(0,−1),(0,0) | Simple-pole sign and higher-pole limitation agree | None |
| §1.1 additive Hom equivalence | M=O² over 𝔽₂; M=0 | End(M)=M₂(𝔽₂), dimension 4 and cardinality 16; zero corner has one element | Native additive transfer witness | None |
| §1.2 decomposition | 0,O,O² | Summand counts 0,1,2; residue algebra k for O versus M₂(k) for O² | Locality distinguished | None |
| §1.3 radical blocks | N=k[t]/t², M=N² | Radical dimension 4, quotient dimension 4; copying two scalar radicals gives dimension 2 | Repeated block formula agrees | None |
| §1.4 nilpotent matrix enumeration | n=0,1,2, q=2; n=2,q=3 | Counts 1,1,4 and 9; q^(n(n−1)) gives same; GL₂ sizes 6,48 | Enumerated n=2 directly; natural subtraction at zero harmless | None |
| §1.5 nilpotent/unit ratio | 0; O/𝔽₃; O²/𝔽₂; k[t]/t²/𝔽₂ | Ratios 1,1/2,4/6=2/3,2/2=1; quotient formula same | Radical fibres cancel | None |
| §1.6 finite-field bands | G_m/𝔽₃; constant C₂ | H¹ cardinalities 1,2; both H² neutral; G_m Lang z→z² gives only 1 on rational units | H² does not imply H¹ uniqueness | None |
| §1.7 orbit formula | One geometric orbit of length two | Over degrees 1,2 its fixed contributions are 0,2; descended class doubles | Both orbit directions agree | None |
| §1.8 coprime residue | (r,d)=(2,1); algebra k[t]/t² | Residue degree divides 2 and 1, hence 1; End dimension 2, radical dimension 1 | End/rad=k does not force End=k | None |
| §1.9 HN cutoff | Rank one degrees −1,0,1; g=2,r=2,d=3 | Cutoff indicators 0,1,1; threshold 2<3; genus-one gap bound 0 | Strict bound respected | None |
| §1.10 finiteness/twist/dual | P¹ ranks 0,1,2; line degrees ±1 | Counts 0,1,0; twisting/dual preserve line count 1 | Normalizations agree | None |
| §2.1 homotopy-fibre Fubini | BC₂→BS₃; identity BS₃; empty | Fibre mass 3 gives 3/6=1/2; identity fibre mass 1 gives 1/6; empty 0 | Nonabelian and empty cases agree | None |
| §2.2 nilpotent pairs | Line; rational length-two torsion; zero | Line nil count 1 and mass 1/(q−1); t²=0 with t≠0; zero mass 1 | Identity excluded on nonzero line | None |
| §2.3 tower exponential | One line species, q=2, multiplicities 0,1,2 | Euler coefficients 1,1,2/3; exponential coefficient 1/2+1/6=2/3 | Coefficient Adams required | None |
| §2.4 Jordan class | J₂ and θ=0 | J₂ has r₁=0,r₂=1, weighted rank 2; θ=0 has r₁=rank F; unweighted J₂ rank would be 1 | Weighted convention agrees | None |
| §2.5 flags | O⊂O² over 𝔽₂; inserted zero step | Three flags, automorphism group size 6, mass 1/2; zero-step factor 1 | No imposed slope order | None |
| §2.6 Jordan grading | J₂; zero operator | H₁=0,H₂=k; zero operator gives H₁=F; total ranks 1 and rank F | Quotient flag matches Jordan multiplicities | None |
| §2.7 Jordan fibre | Only α₂=O, g=0,1,2,q=2 | d=g−1, d″=0; fibre masses 1/2,1,2 | Signs and marked fibres agree | None |
| §3.1 Hall operations | O,O on P¹/𝔽₂; zero unit | Product coefficient 3v; coproduct coefficient v/2; δ₀ multiplier 1 | Quotient-left convention agrees | None |
| §3.2 Green pairing | Same O,O,O² | (3v)/6=v/2; tensor side v/(2·1·1)=v/2 | Adjunction agrees | None |
| §3.3 characteristics | Length-one torsion; rank-two/torsion degree one | Torsion indicator 1, bundle indicator 0; correction v⁻² rather than v⁻¹ | Torsion/bundle distinction agrees | None |
| §3.4 filtered mass | O⊂O²/𝔽₂ | Direct mass 3/6=1/2; v⁻¹(v/2)=1/2 | Euler correction agrees | None |
| §4.1 Eisenstein series | Rank zero and one, P¹/𝔽₂ | Bundle rank-zero constant 1; coherent z coefficient 3; bundle degree −1 coefficient nonzero | Bilateral and torsion conventions agree | None |
| §4.2 Hecke commutation | q=2,r=0,1,2 | Empty product 1; arguments z/(√2w); z/(2w),z/w | Half-rank shifts agree | None |
| §4.3 coproduct | Rank zero; split 1+1,g=0 | E₀⊗E₀; factor q⁻¹ᐟ²; shifts q¹ᐟ²,q⁻¹ᐟ² | Zero-rank factors retained | None |
| §4.4 residue presentation | r=1,2,g=1 | Rank-one prefactor 1; rank-two prefactor V₂/V₁²; normalized pole residue 1, differential −1 | Correct residue convention | None |
| §4.5 HN relations | O(1)⊕O(−1) on P¹ | χ(negative quotient,positive subobject)=3; total q correction q⁻³ᐟ²v³=1 | Order and shift agree | None |
| §4.6 spherical support | P¹ rank two, degree zero | One class for each O(m)⊕O(−m), m≥0; infinitely many total, one per fixed type | Completion required | None |
| §4.7 HN membership | Types (O,O) and (O(1),O(−1)) | Each indicator has value 1 on its class and 0 on the other | Typewise finite support agrees | None |
| §4.8 universal form | q=2,3 line masses; square generator on P¹/𝔽₂ | V₁=P(1),P(1)/2; norm (3v)²/6=3q/2 | Allowed scalar normalization agrees | None |
| §4.9 zero class and N₀ | P¹/𝔽₂, degree 0,1 | N_(0,0)=1; [z]N₀=3, so N₀=1+3z+O(z²) | Unit coefficient differs from whole torsion series | F01 |
| §4.9 coherent rank-one mass | P¹/𝔽₂, class (1,1) | O(1):1; three split sheaves:2/2 each; total 4; product coefficient 1+3=4 | Corrected raw value | F01 |
| §4.9 torsion quotient | P¹/𝔽₂ | [Tz](N/N₀)=4−3·1=1; P(1)/(q−1)=1 | Corrected coefficient carrier | F01 |
| §4.9 Log normalization | P¹/𝔽₂ and P¹/𝔽₃ | [Tz]Log N=1,1/2; multiplying by q−1 gives 1,1=P(1) | Added missing factor | F01 |
| §4.9 extension-field scalar control | P¹/𝔽₃ | [z]N₀=4/2=2; split nil/aut=3/12; raw 1/2+4·1/4=3/2; quotient 3/2−2·1/2=1/2 | Formula holds beyond 𝔽₂ | None |
| §4.9 rank and Adams indices | T⁰z,Tz; m=2 | ψ₂ gives T⁰z²,T²z², ranks 0,2; no rank 1 term | Log rank-one extraction justified | F01 |
| §5.1 pairing regions | Single slot degrees −1,0,1 | Positive coefficients 0,V₁,V₁; negative coefficients V₁,0,0 | Regions agree | None |
| §5.2 torsion separation | Single rank-one slot, P¹/𝔽₂ | zw coefficient #X/(q(q−1))=3/2; omitted rank shift gives 3 | Total-rank shift retained | None |
| §5.3 bilateral pairing | Single slot; ranks (1,2) | Single degree coefficient V_r; shifts q⁻¹,q¹ᐟ² for the two slots | Order distinguished | None |
| §5.4 expansion separation | 1/(1−z) at 0 and infinity | Coefficients 1 in nonnegative degrees versus −1 in negative degrees; both clear to polynomial 1 | Denominator clearing valid | None |
| §5.5 shuffle formula | s=1,2 | s=1 gives V₁/(1−zw),−V₁/(1−zw); negative-region coefficients +V₁; s=2 sign +1 | Sign and region agree | None |
| §5.6 block residues | Tuples (1),(2),(1,1),g=2 | a(1)=0; a(2)=−1/2,b(2)=0; b(1,1)=1/2 | Prefactors agree | None |
| §5.7 weighted Jordan sum | r₂=1; r₁=r₂=1 | Sizes 2,3; e=(g−1),5(g−1)/2; x₂=z² in first case; x₁=zq¹ᐟ²,x₂=z²q⁻¹ᐟ² in second | Weighted degrees agree | None |
| §5.7 rank-zero tail | P¹/𝔽₂, empty generic bundle partition | Ξ_empty=1+3z+O(z²), not constant 1 | Agrees with corrected §4.9 | None |
| §5.8 positive arms | λ=(1),(2),(1,1),(2,1),(3),(2,2) | Products 1; ζ(q⁻¹z); 1; ζ(q⁻²z); ζ(q⁻¹z)ζ(q⁻¹z²); ζ(q⁻¹z)ζ(q⁻²z) | Arms/legs and empty products agree | None |
| §5.9 kernels | Empty and one box; λ=(2),(1,1) | Empty kernels 1; J₁=q^(1−g)P/(q−1),H₁=1/(1−z); residue counts 0,1 for size-two diagrams | One-box normalization agrees | None |
| §5.10 product and torsion | P¹/𝔽₂, empty/one-box terms | Empty term 1+3z+…; bundle factor 1+z+…; full rank-one coefficient 1+4z+… | Recomputed; agrees with F01 | None |
| §6.1 torsion cancellation | P¹/𝔽₂, rank zero/one | After cancellation T⁰=1; [T]=1/(1−z), giving degree-one coefficient 1 | Recomputed consumer agrees | None |
| §6.2 Fourier residues | (2+3z)/(1−z²), r=2 | Differential residues at 1,−1 are −5/2,1/2; negative Fourier sums give 2,3; char 2 merges roots | Characteristic-zero application safe | None |
| §6.3 partition extraction | Rank one | A₁(z)=P/(1−z); differential residue −P; negative extraction P | Recomputed Log consumer agrees | None |
| §6.4 rank-two formula | q=2; empty tuple; formal (−1,−2) repeated g=1,2 | P=1,6,36; brackets 0,1,36; counts 0,6,1296 | Both genus controls agree | None |
| §6.5 origin extension | Rank-one P; q⁻¹; paired relation | P at origin 1; q⁻¹ denominator 0; α₁α₂=q gives 0=0 | Local evaluation distinguished from torus evaluation | None |
| §6.6 constant formula | g=1,2,3 and ranks 1–4 | Constants (1,1,1,1),(1,2,6,22),(1,3,15,95); rank-one residue −1 gives +1 | Signs and genus polynomials agree | None |
| §7.1 stability and positivity | O,O²; O(−1)→O²→O(1) | Stable truth values true,false; degrees −1,0,1 give positivity false,true,true | Positive exact category need not be abelian | None |
| §7.1 coherent derived comparison | Skyscraper at smooth point, zero field | Higgs Ext dimensions 1,2,1; underived columns give 1,1,0 | Derived torsion terms required | None |
| §7.1 differential convention | Elliptic line pairs (O,0),(O,η) | Id maps to +η; map coefficient +1; isomorphism complex cohomology 0 | Sign witness agrees | None |
| §7.2 dual preservation criterion | k²,W=ke₁; lower-left entries 0,1 | Image in k²/W has coefficient 0 or 1; factorization true or false | Both directions tested | None |
| §7.3 stable coarse moduli | Rank one,g=1,2 | Coarse dimensions 2,4; scalar-stack dimensions 1,3; cone dimensions 1,2; point weight 1/(q−1) | Agrees with F02 mass conversion | None |
| §7.3 Hitchin weights | Rank two, scale field by t=2 in char≠2 | Trace multiplier 2; determinant multiplier 4 | All base weights cannot be 1 | None |
| §7.4 two-line chart | g=2,r=2,d=1,d₁=5,d₂=24 | Hom dimensions 9,47; first summand evaluation has basepoints despite h⁰=1; fixed kernel rank 7, degree −46 | Restricted surjectivity essential | None |
| §7.5 cotangent kernel | Rank-one line, g=1,2; zero covector | Serre-dual fibre dimensions 1,2; moment value 0 | Kernel identified with Higgs fibre | None |
| §7.6 doubled moment | One scalar arrow x=y=1; zero y; char 2 | μ=(1,−1), trace sum 0; zero y gives (0,0); char 2 gives (1,1), sum 0 | Effective target agrees | None |
| §8.1 framing | g=2,r=2,d=1 | B=−3/2; d₁=5,l₁=9,d₂=24,l₂=47; gcd=1,C=423 | Worked dimensions recomputed | None |
| §8.1 kernel generation | Same class; kernel rank 7, degree −46 | Lower slope bound −16; −16+24=8>3; d₂ lower bound 20 and residue 6 mod 9 yield 24 | Strict generation bound agrees | None |
| §8.1 determinant boundary | Dimensions (2,3), proper vectors (1,1),(1,2), zero/full | l₂a₁−l₁a₂=1,−1,0,0; p>6 preserves ±1 | Zero/full must be excluded | None |
| §8.2 character and slope sign | (l₁,l₂)=(2,3); (a₁,a₂)=(1,1),(1,2) | δ=−1,+1; full vector δ=0 | Slope determinant sign agrees | None |
| §8.3 indecomposability criterion | Residue k, End dimension h; proper projector | Contribution (q−1)q^(h−χ)/((q−1)q^(h−1))=q^(1−χ); projector λ=−δ≠0 for p>C | Both criterion directions retained | None |
| §8.4 effective smoothness | Stable scalar stabilizer; split unstable bundle | Effective stabilizer dimensions 0 versus at least 1 | Differential rank drops for split model | None |
| §8.4 small characteristic witness | Elliptic rank-one chart over 𝔽₂ | l₁=2,l₂=7,C=14; generated subspace dimensions 1→5,2→7; test weights at most −3, full 0 | Stability does not need p>C | None |
| §8.4 central restriction | Two-arrow example over 𝔽₃, dimensions (1,2) | μ=(2,−I₂); ambient differential rank 4; line-restricted image dimension 1 | Effective and central targets distinguished | None |
| §8.5 tight stability comparison | r=2,d=1,d₂−d₁=19; line degrees 1,0 | Section dimensions (5,24),(4,23); δ=−19,+19; formula 19(1−2d′) same | Slopes and King weights agree | None |
| §8.6 central deformation | Rank one, genus one; nonzero scalar t | Each fibre qP(1); maps scale y by t and inverse t⁻¹; composition factor 1 | Nonzero-fibre trivialization agrees | None |
| §8.7 BB family count | A¹×A^a over 𝔽_Q, a=0,1 | Total Q,Q²; Q times zero fibre Q,Q²; nonzero fibres 1,Q | Counts and rank drop by one agree | None |
| §8.8 geometric Higgs count | Rank one,g=2; P¹ ranks 1,2 | q²P(1)=q^D A; P¹ gives 1=1 and 0=0 | Large-characteristic theorem unchanged | None |
| §8.9 positive HN integration | Rank one,g=1,q=2,4 | Normalized mass qA/(q−1) gives 2A,4A/3; (q−1)Log coefficient gives 2A,4A | Normalization agrees with F02 | None |
| §8.9 strict slope obstruction | g=2,A=(O(P),0),B=(O,0) | Higgs Ext dimensions 1,3,0; extension mass q³/q=q² | Quotient/subobject order respected | None |
| §8.10 field cardinality | Characteristic two, q=2,4, general coefficient A | qA gives 2A,4A; pA gives 2A,2A | Extension fields distinguish normalizations | F02 |
| §8.10 elliptic curve over 𝔽₂ | E:y²+y=x³ | x=0:2 solutions; x=1:0; infinity:1; A=3; Ω=#H=2·3=6; stack 6/1=6 | Explicit small-field witness agrees | F02 |
| §8.10 elliptic curve over 𝔽₄ | Same equation, nonzero x³=1 | Four x-values, two y-solutions each; A=8+1=9; Ω=#H=4·9=36; stack 36/3=12; 3·12=36 | Old factor gives 18 and fails | F02 |
| §8.10 genus-one coprime rank two | E/𝔽₄, degree 1 | A(2,1)=9; D=1; Ω=#H=36; normalized stable mass 12 | Rank-two consumer also agrees | F02 |
| §9.1 purity and affine shifts | Rank one,g=2; A¹ | m=2,b=0,D=2; compact shift 4,twist −2; A¹ has degree 2, eigenvalue q | Recomputed shift witness agrees | None |
| §9.2 positivity and trace | Rank one,g=1 | A(−α)=1+α₁+α₂+q; diagonal polynomial 1+2t+t², leading coefficient 1 | Signs and grouping agree | None |
| §9.3 signed compact polynomial | Rank one,g=1,2 | t²−2t³+t⁴; t⁴−4t⁵+6t⁶−4t⁷+t⁸; unsigned flips odd signs | Top degrees 4,8 agree | None |
| §9.3 spread-out ranks | Elliptic fibre; unrelated point/two points | Compact ranks in degrees 2,3,4 are 1,2,1; unrelated degree-zero ranks 1,2 | Lisse rank stratum needed | None |
| §9.4 reciprocal trace/components | Rank one on E/𝔽₄; two exchanged components | 4(1+1/2)²=9=P(1); cone top dimension 1; exchanged components dimension 2,trace 0 | q^D prefactor and geometric count agree | None |
| §10.1 Mellit kernel | One box,g=1,q=2,a=−1; empty | H₁(z)=3(z+1), H₁(1)=6=P(1); empty Ω=1,H=0 | z specialization is essential | None |
| §10.2 regular deformation | Empty partition and f_n=1 | f_empty=1; shifted insertion both sides 1; u-constant coefficient 1 | Regular-sequence witness agrees | None |
| §10.3 Laurent conclusion | Same H₁; negative control 1/(1+z) | H₁(1)=6; control value 1/2 at 1 but pole at −1 | Local regularity does not replace global theorem | None |
| §10.4 degree independence | P¹ ranks 0,1,2; genus-one counts; periodic control | Counts 0,1,0 in degrees ±1; genus-one P(1) in all positive ranks; control eventual values 2,3 | True headline survives negative control | None |
| §10.5 all-degree positivity | g=2,r=2,d=0,1 | gcd(2,1)=1; origin count 2 at both degrees | Transfers function, not stable moduli | None |
| §11.1 quasi-parabolic flags | No marks; rank one, two-step flag; repeated steps | Rank-one jumps 0 or 1 give one flag for each fixed type; count P(1) | Unique fixed-type flags agree | None |
| §11.2 localized universality | No marks; rank one; (q−1)⁻¹ | Values ordinary A,P(1); inverse has value 1 at q=2 and pole at q=1 | No denominator-removal inference | None |
| §11.2 parabolic Euler order | P¹, equal-degree lines jumping at steps 1 and 2 | Ordinary Euler 1; ordered correction 1→0; reversed correction 0→1 | Flag-preserving Hom dimensions 0,1 agree | None |
| §11.3 slope cuts and HN type | Rank one at ν=0; genus-two nonzero extension 0→O(P)→E→O→0, P rational | Degrees −1,0 give cutoff 0,P(1); Ext¹(O,O(P)) dimension 1; E has two HN factors and one indecomposable summand | HN grading differs from splitting | None |
| §11.4 universal cuts | Rank-one lower cut at d=−1,0 and dual upper cut at d=1,0 | Values 0,P(1) on both sides | Duality and cutoff signs agree | None |
| §11.5 primitives | Scalar c=1 times unit; primitive x,y | Δ1=1⊗1 versus primitive RHS 2(1⊗1); mixed terms of Δ[x,y] are xy−xy and yx−yx, both 0 | Unit not primitive; bracket closed | None |
| §11.5 Euler limit | (q−1)⁻¹ at q=2 and q=1 | Value 1 versus denominator 0 | Naive finite-field specialization excluded | None |
| §11.6(i) fixed-HN conjecture | Rank-one HN type (1,d) | Only one HN factor; proposed function P(1); origin 1 | Boundary agrees; remains conjectural generally | None |
| §11.6(ii) slope-difference conjecture | Rank one,d=0,ν=0 versus 1 | Lower-cut difference P(1)−0=P(1); signed variables give ∏(1+α_j) | Boundary agrees; no proof asserted | None |
| §11.6(iii) Hall-Lie conjecture | Rank one | Proposed root dimension 1; proved origin/component count 1 | Boundary agrees; finite dimensions still part of conjecture | None |
| §11.6(iv) Hilbert-series conjecture | One primitive species of degree T | Exp(T)=1+T+T²+…; symmetric-algebra dimensions 1,1,1 | Formal boundary agrees; regularity retained as assertion | None |
| §11.6(v) marked integrality conjecture | One length-one mark; rank-one fixed flags | Category/count reduce to ordinary values; rank-one P(1)∈R_g | Boundary agrees; not a premise of theorems | None |
| Worked examples: rank-one conversion | E/𝔽₂ and E/𝔽₄ | #H/q=6/2=3,36/4=9; reciprocal trace 3,9; origin of P is 1 | Both repaired normalizations propagate correctly | None |
| Worked examples: explicit framing | g=2,r=2,d=1 | Lower bound d₂=20, residue 6 mod 9 gives 24; 9·24−47·5=−19; C=423 | Agrees with §§8.1–8.5 | None |
| Worked examples: constants and signs | g=2,3 | Genus-two values 1,2,6,22; genus-three ranks 3,4 give 15,95; rank-one residue −1 extracts +1 | Agrees with §§6.6,9.4 | None |

## Maintainer consequences

Package changes are confined to the two Check blocks in `packages/CountingBundlesAndHallAlgebrasOfCurves/README.md` and this report. No theorem, Lean name, binder, import, supplier contract, gap or merge-order dependency changed. The acceptance test remains the same five declarations. No consumer rename or downstream file edit is required. No commit or external write was made.
