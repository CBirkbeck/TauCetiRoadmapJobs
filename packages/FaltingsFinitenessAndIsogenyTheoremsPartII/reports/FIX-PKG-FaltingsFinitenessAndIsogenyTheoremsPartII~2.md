# Repair report

## F01 (P1) — applied

Unresolved named consumer → explicit scope exclusion. Deleted its proposed layers and all six consumer boundary Checks. The geometric-twist Check remains in §5.5, where it tests this package’s theorem. The roadmap index and ownership search supplied no such consumer; the repaired README contains zero occurrences of its name.

## F02 (P1) — not actionable in this package: legacy gap retirement requires a maintainer edit

Repaired the mathematics: §§2.2a–2.2b own the scheme-theoretic zero estimate and Bost’s exact interpolation noninjectivity theorem; §§2.3–2.4 name matrix-height and arithmetic evaluation inputs; §6.3 owns its sharp proof. G5 already has owned inputs. Existing G1/G2/G4/G5 cannot be retired here. Evidence: bost95 lines 381–389, 598–628; mz20 lines 945–952; gr14 lines 1432–1441.

## F03 (P1) — applied

Unspecified specialization extension → an explicit rational function-field Tate algebraicity target in §8.1, followed by separately justified semisimplicity and integral saturation steps. Added Néron specialization, Hilbertian and finite full-image inputs. The argument never uses §8.2. Evidence: noot95 line 172 invokes fw84 VI §3, whose uncertified status is retained. G7 retirement remains a maintainer edit.

## F04 (P1) — not actionable in this package: duplicate legacy gaps require maintainer retirement or reassignment

G3’s mathematical request is already gap:cyclic-maximal-subfield, ClassFieldTheory Layer 10. G8’s analytic and Frattini inputs are already consumed from ArithmeticGaloisRepresentations §§5.8, 6.4a; both contain the claimed targets. Changing existing G3/G8 is outside this package-stage repair. No second supplier target or replacement dependency was invented.

## F05 (P1) — applied

Incorrect §1.1 Minkowski supply → pinned Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`, with its strict volume inequality. Repaired the Mathlib contract, geometry-of-numbers contract, Scope, §§3.3/3.5 Needs and Layer 3 Dependencies. GeometryOfNumbersAndQuadraticArithmetic §§1.2, 1.5 remain the minima/basis and product supplies. Pin: `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:65`.

## F06 (P2) — applied

Part I stopping at R28.5 → R28.6. Added R28.6.6 to §6.1; R28.6.7 to the supplier contract, §§7.6–7.7 and Layer 7 Dependencies. Section 7.3 expressly adds a saturation exceptional set and every-prime injectivity; §7.6 adds bounded-index uniformity. Part I’s R28.6.7 explicitly includes the separable-order centralizer-reduction auxiliary, so it is acknowledged rather than claimed anew without distinction.

## F07 (P2) — applied

Unstatable §6.4 → `elliptic_isogeny_j_height_bound` on native nonsingular Weierstrass curves, geometric isogenies and absolute j-height. Added its single Tau Ceti import and README name. The module docstring restricts the missing stable-height carrier to §6.3. Used universe-polymorphic fields and retained D≥2. Evidence: mz20 lines 397–404; gr14 lines 177–182; pinned degree and height definitions.

## F08 (P2) — applied

Deleted `regularNormCoordinates`, `divisionNormBody` and `division_norm_body_lower_bound` from Suggested.lean. Kept the norm-body construction and lower bound as prose targets in §§3.3–3.4, removing their Lean-name claims and updating How to read the build. The class-index acceptance theorem and its discriminant definition remain. Evidence: mw95 lines 232–234 and Lemma 3.3, mw95 line 319.

## F09 (P2) — not actionable in this package: G6 retirement is a maintainer edit

The requested ring/product/idempotent supply is already native at the pin and already contracted in the README. Verified `ringEquivPiPadicInt`, its continuity theorems and `tendsto_sum_idem` in `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.lean:162`, lines 182, 187, 320. G6 explicitly describes inventory work, not missing mathematics. Its deletion cannot be done under the additive-only design-gap constraint.

## F10 (P2) — applied differently

Compound slope request → five explicit supplier contracts and matching appended gaps: maximal-slope existence/vector inequality, symmetric powers, morphisms, squared-metric rescaling, and semistable tangent metrics. Added numerical sign/rank/degree Checks and updated §6.3/Layer 6 dependencies. Squared norms, not lengths, scale by c. Evidence: gr14 lines 607–639, 1432–1441; bost95 §4.3. The original coarse design gap awaits maintainer retirement.

## F11 (P3) — applied

Repeated specialization injectivity → request only torsion-free cokernel of A6.25(1), with torsion-realization compatibility. The ambient connected normal characteristic-zero base remains explicit. A6.25(1)’s rigidity already gives injectivity; §§8.1–8.2 distinguish realization saturation from specialization saturation. The immutable earlier design entry still contains the redundant injectivity clause; no additional mathematical supply is inferred from it.

## F12 (P3) — applied

Principal-only period theorem → arbitrary ample polarization with constant depending on normalized degree and exponent depending only on dimension; recomputed elliptic degrees 1/3 and map-degrees 1/9. Added relative-K simple factorization beside §5.4, with torsion-field descent and three Checks. Evidence: bost95 lines 151–157; gr14 lines 63–68; mw95 lines 45–50, 661–671.

## F13 (P3) — applied

Corrected all five locators: class index after (2.1), mw95 lines 157–159; non-CM graph, gr14 line 1813; CM graph, gr14 lines 1995–2012; product formula, ry25 lines 492–497 with Deligne’s different contribution identified; coordinate trace, mz20 line 788. Updated the corresponding source-manifest class-index locator too. Checked equations in the cached legal sources, including rendered Bost pages where text extraction lost formulas.

## F14 (P3) — applied

Design identifiers → mathematical locators: QI.5 becomes §5.5, MW94 becomes mw94-preprint, RY25 becomes ry25. All manifest cited_for entries now name README layers/sections. Preserved every source key, certification/waiver, digest and legal retrieval record. No process identifiers of these forms remain in the README or manifest.

## Verification outcomes

- `lake env lean` on `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean`, run from the content checkout: exit 0. Exactly two warnings, both “declaration uses `sorry`”, at lines 47 and 66. The imported degree module’s object file already exists; no build was needed. No Lean process remains running.
- Elaborated one scratch copy of the final file with `#check @name` for all three declarations: exit 0, the same two expected warnings. Compared every elaborated type with the README. The discriminant retains Ring and its integral basis; class_index_bound retains DivisionRing, Algebra ℚ, finite dimension, both full spans, e>0 and integral finite generation; the elliptic theorem retains Field, NumberField, both nonsingularity instances, D≥2 and geometric isogeny existence. No binder disappeared. The new field quantifier is universe-polymorphic.
- Final dependency-direction command: exit 0; output:

    depcheck: 50 roadmaps, 583 edges, 0 problem(s)

  No UPWARD, CYCLE or moved line.
- Citation resolver: no cross-roadmap citations found nowhere; no Lean names found nowhere. It inspected main bedeeb4 and the supplied open-head index. Its library-name scan is unavailable on this host, so the used declarations were opened separately at the exact pins.
- Pin verification: Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039; Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, matching lake-manifest.json. No pin files changed.
- `git diff --check`: exit 0. JSON and both TOML files parse. Only the five precise supplier gaps were appended to design/plan.json; every previous gap and every other top-level value is unchanged.
- No gate failures beyond the supplied findings were listed. No missing-reference request was necessary. Waived mw93-periods/mw95-refine and uncertified igusa/fw84 remain settled under their original keys.

## Ownership and maintainer consequences

Used the roadmap tool’s main/open-head object searches for multiplicity, auxiliary sections, interpolation, matrix-height, Hom specialization, slopes and commutants, and searched the board packages and pinned libraries by object. No existing general abelian zero/interpolation owner was found; these are the missing proof steps of this package’s period theorem, now §§2.2a–2.2b. The function-field Tate comparison remains here because Part I’s contract is over number fields. No supplier owns its extension merely by supplying torsion specialization. Generic Hermitian theory is requested from ArakelovGeometryAndAbelianHeights instead of constructed here.

Read the main-branch ComplexTori and Isoperimetry roadmaps for shape. Resolved the cited supplier sections through the supplied roadmap index and opened their actual statements, especially AbelianSchemesAndArithmeticModuli A5.1–A5.4, A6.20/A6.25; ArakelovGeometryAndAbelianHeights §§1.1–1.6, 2.7, 5.8–5.9; Part I R28.6.6–R28.6.7; ArithmeticGaloisRepresentations §§5.8, 6.4a; NeronModelsAndSemistableAbelianVarieties §6.0; InverseGaloisAndArithmeticFundamentalGroups IG.2.4/IG.2.6; SemisimpleAlgebras Layers 2–3/6; QuadraticFormInvariants Layer 7B; ClassFieldTheory Layer 10; AutomorphicBundles B4.2/B4.9/B5.13; GeometryOfNumbersAndQuadraticArithmetic §§0.1–0.3, 1.2/1.5. The open-head search includes the named sibling roadmaps; no unprovided external pull request was fetched.

Maintainer decisions remain: retire G1/G2/G4/G5/G7 as proof work owned here, G3 in favor of cyclic-maximal-subfield, G8 in favor of its existing analytic supplier, and G6 as inventory-only narrative. Retire the old hermitian-maximal-slope gap in favor of the five precise new gaps, and narrow the old hom-specialization-saturation entry to match the README’s nonredundant request. These are existing-entry edits, not silently performed here.

No external roadmap’s declaration was renamed. Removed acceptance-only names are regularNormCoordinates, divisionNormBody and division_norm_body_lower_bound; their mathematics remains in the README. New acceptance name: elliptic_isogeny_j_height_bound. New external requirements are the five exact Arakelov supplier gaps; their supplier’s files were not edited. No commit or network write was made.

## Adversarial mathematics record

Each row identifies a statement or independently used convention. Symbolic constants remain symbolic: evaluating a bound with an unspecified C is a boundary check, not a numerical proof of the theorem. The new zero/interpolation inequalities were read in the legal cached PDF, including the scheme structures and field/height parameters. Elementary determinant, index, binomial, scale and logarithm values below were independently recomputed.

| Statement | Instances tried | Values computed on the two sides or competing models | Result | Change |
|---|---|---|---|---|
| End composition convention | E², e₁₂ and e₂₁ | e₁₂e₂₁=e₁₁; reversed product=e₂₂ | Order matters | None |
| Field versus coefficient extension | Gaussian E over ℚ and ℚ(i) | End ranks 1 and 2; tensoring rank-one End with ℚ keeps rank 1 | Different operations | None |
| Stable height clamping | D=1, h_F=−1 | max(1,1,−1)=1; h_F itself=−1 | No sign assumption | None |
| Polarization degree convention | Elliptic line of degree 3 | Euler characteristic 3; map-degree 9; principalization degree 3 | Square root correct | General period target |
| Zarhin convention | g=1, formal h_F=−1 | dimension 8; height −8=8h_F | Both multipliers 8 | None |
| Abelian versus regular trace | Non-CM E; E² | Tr_A(1)=2,4; regular trace(1)=1,4 | Traces differ | None |
| Hermitian alternating sign | Gaussian lattice | E(i,1)=1; E(1,i)=−1 | Alternation fixed | None |
| Empty determinant, trace, degree | Dimension 0 | det=1, trace=0, degree=1 | Zero-map degree exception retained | None |
| Positive-rank denominators | g=0 versus g=1 | 2g=0 versus 2; degree formula at g=0 would use 0/0 | g≥1 required | None |
| Prime convention | ℓ=2,3 | Both positive primes; local factors may be 4,9 | Exceptional primes retained | None |
| §1.1 representations | [−2] on E; Gaussian i | κP=−2P=Pρ; ρ(i)=[[0,−1],[1,0]], trace 0 | Signs agree | Locator unchanged |
| §1.1 injectivity/lattice preservation | Multiplication by √2 | √2·1∉ℤ+iℤ; zero matrices give zero map | Wrong model excluded | None |
| §1.2 Rosati norm | E: 0,−1,i; E² shear | q=0,2,2; q(shear)=6 and degree=1 | Norm and degree differ | None |
| §1.2 homogeneity/triangle | [2],[3] on E | q(2)=8, q(3)=18; ℓ(5)=5√2=2√2+3√2 | Absolute scaling | None |
| §1.3 discriminant | ℤ[i], ℤ[2i], rank 0 | det diag(2,2)=4; det diag(2,8)=16=2²·4; empty=1 | Index square correct | None |
| §1.3 basis/covolume | Swap Gaussian basis | det remains 4; covolume=2, square=4 | Basis independence | None |
| §1.4 submultiplicativity | E scalars; E² shear S | q(6)=72≤8·18=144; q(S²)=12≤36 | Not multiplicative | None |
| §1.5 degree determinant | [−2] on E; projection on E²; zero dimension | 4=4; 0=0; 1=1 | All three cases consistent | None |
| §1.6 degree inequality | [−2] and shear on E² | 16=(16/4)²; 1≤(6/4)²=9/4 | No reverse bound | None |
| §1.7 complex trace | Gaussian i | 2 Re(i·(−i))=2; missing conjugation gives −2, missing factor gives 1 | Realification necessary | Locator corrected |
| §1.8 coordinate scales | τ=2i, κ=2i | (a,b,c,d)=(0,4,−1,0); b-scale=2, c-scale=1/2, ℓ=√8 | Reciprocal factors distinct | None |
| §2.1 minimal subgroup | E² periods (η,η),(η,0),0 | Dimensions 1,1,0; normalized degrees 2,1,1 | Minimum not whole E² | None |
| §2.2 arbitrary polarization | Elliptic principal line and degree-3 line | Nonzero-period degrees 1 and 3; zero-period degree 1 in both | d-dependence necessary | Generalized |
| §2.2 degree scaling | L→L⁴ on dimension g, subgroup dimension b | Δ_L(G)→4^gΔ; Δ_L(B)→4^bΔ; q→4q | No universal principal constant substituted | Generalized |
| §2.2a multiplicity | Degree-two line, two reduced points on E | length·d_L(0)=2·1=2=d_L(E) | Equality example | New target |
| §2.2a nonreduced test | Length-two thickening at 0 on E | Scheme length gives 2≤2; point count gives 1 | Scheme structure necessary | New Check |
| §2.2a zero/empty tests | Zero section; empty S | Zero section would force 3≤2; empty length gives 0≤2 | Nonzero section needed | Explicit hypotheses |
| §2.2a tensor power | L^D, dim B=b | D^b·length·d_L(B)≤D^g d_L(A), hence D^(g−b) | Codimension exponent | New target |
| §2.2b jet definition | dim W=1; orders 0,1,2 | Lengths 1,2,3 versus reduced model 1,1,1 | Derivatives present | New definition |
| §2.2b symmetric graded piece | dim W=2, order 2 | Cumulative length 6; homogeneous piece dimension 3, not 2 | Mixed term retained | New API |
| §2.2b scheme union | g=2,M=N=2 | Length 9+5=14; double-counted origin gives 19 | Union, not disjoint sum | New Check |
| §2.2b restriction map | Principal surface, D=4, preceding T | h⁰=16; target length=14; kernel dimension≥2 | Sufficient conditions need not be necessary | New Check |
| §2.2b arithmetic parameters | r=h=d=1, N=2, g=2 | Conditions become M≥CD, D²d_L(A)≥CM, M²≥16CD(D+M+log2) | Field, norm and height factors retained | Source equations read |
| §2.2b height convention | g=2 | h_Del−h_F=log π; Hodge squared metric multiplied by π⁻² | Correct normalization | Explicit shift |
| §2.2b tangent-height upper bound | B=0; rank-b tangent, L→L⁴ | h(0)=0, log d_L(0)=0; height shift b log2 versus degree-log shift b log4 | Zero and scaling conventions consistent | Exact input stated |
| §2.2b subspace-height lower bound | F=0; degree-two extension | 0≥−c_g H; degree/field degree scales 2/2 | All finite extensions included | Exact input stated |
| §2.3 integral basis | 0 lattice; (1,1),(1,−1) in ℤ² | Empty size 0, Δ=1; determinant −2 and index 2 | Independent need not be basis | Matrix lemma cited |
| §2.4 arithmetic evaluation | Fixed value e⁻²; rescaled by e⁻ᴺ | log max(1,|u|⁻¹)=2 versus N+2 | Fixed Fourier scaling essential | Exact input stated |
| §2.5 weak Siegel bound | τ=it and 100+it, δ=1 | Both have tr y=t; ct≤log M+log|u|⁻¹ | No real-part bound used | None |
| §2.6 short span | Non-CM E; independent index-two vectors | q(1)=2; rational span rank 2 but integral index 2 | Spanning not basis | None |
| §2.7 End determinant | Non-CM E; Gaussian E | Determinants 2,4; Gaussian rational/geometric ranks 1,2 over ℚ | Geometric field extension needed | None |
| §2.8 off-diagonal isogenies | Swap and identity on E² | Swap off-diagonal degrees 1,1 and q=4; identity off-diagonal degrees 0,0 | Nonzero product polynomial required | None |
| §2.9 polarized isogeny | E→E, [2] | Minimum N=1, log N=0; [2] degree 4 and height difference 0≤log2 | Absorption uses minimum | None |
| §3.1 regular discriminant | ℤ; Gaussian and nonmaximal orders | 1; −4; −16 | Signed invariant distinct from Rosati | None |
| §3.1 semisimplicity boundary | ℚ[ε]/ε² with basis 1,ε | Regular-trace Gram diag(2,0), discriminant 0 | Nondegeneracy needs semisimplicity | Existing scope retained |
| §3.2 class index | PID orders; ℤ[2i] on ℤ[i]; rank 0 | 1; min 2Norm(α)=2; rank-zero index 1 | Nonfree lattice admitted | Locator fixed |
| §3.2 right modules | Gaussian order and opposite | Ordinary discriminants −4 and −4 | Same bound on both sides | None |
| §3.3 norm body | ℚ basis 1 and basis 2 | 1·2=2 and 2·1=2; coordinate unit 1 versus 1/2 | Basis factors cancel | Lean scaffolding deleted |
| §3.3 volume normalization | Gaussian field | N=x²+y²; sqrt|disc|=2; disk area π; p=2π | Real area retained | None |
| §3.3 nondivision boundary | M₂(ℚ), e₁₂ | e₁₂≠0, determinant norm 0 | Division used in Minkowski bound | Pinned theorem cited |
| §3.4 lower bound | ℚ, ℚ(i), rational Hamilton algebra | 2=2¹; 2π≥4; sqrt256·π²/2=8π²≥16 | All hold | Kept in README |
| §3.5 class-index theorem | ℤ,e=2; Gaussian suborder ranks 1,2 | 1≤1; 2≤√16=4; evident index 4≤16 | Exponent e/2 retained | Only headline kept |
| §3.6 isotypic comparison | Non-CM E, Gaussian E, non-CM E² | 2=2; 16=16; 4096=4096 | Correct whole-algebra trace | None |
| §4.1 Hom cross-discriminant | Self-Hom and paired 2ℤ,3ℤ | 1; (−4)²=16; 6²=36 | Square, not absolute determinant | None |
| §4.1 lattice/basis changes | Negate one basis; index-two first lattice | 36 remains 36; c multiplied by 2² | Independent changes correct | None |
| §4.2 block determinant | ℤ, M₂(ℤ), Gaussian order | disc M₂(ℤ)=−16; disc M₄(ℤ)=2³²; Gaussian M₂ disc=2¹⁶ | Parity and dimensions agree | None |
| §4.3 simple Hom bound | A=B non-CM and Gaussian E | Degree 1≤1¹; degree 1≤16¹ | Identity fits | None |
| §4.4 stable power | Diagonal E⊂Eᴺ, End E=ℤ | i₁=1; coordinate inverse degree 1≤1² | No N dependence | None |
| §4.5 polarization removal | Non-CM E and Zarhin variety | Ordinary disc and cross-disc 1; dim=8, height=8h_F | Isotypic use consistent | None |
| §4.6 subvariety bound | Diagonal A⊂A⁸ | Projection inverse degree 1; dim B=dim A | Actual-product premise retained | None |
| §4.7 product dual | E×E′ | Product degree 1·1=1; heights −1 and 2 sum to 1 | Lower bound on factor heights needed | None |
| §5.1 product-target bound | A=A*=E; E²→E | Restricted identity degree 1; projection kernel dimension 1 | No degree of dimension-changing projection used | None |
| §5.2 factorization | Simple A; E² | Minimum N=1; multiplicities 1 and 2 | Qualitative choice precedes estimate | Citation key fixed |
| §5.3 rational bound | [2] on elliptic E | Degree N=4; dual degree 4=4^(2·1−1) | Quasi-inverse exponent correct | None |
| §5.4 relative Hom descent | k=ℚ,K=ℚ̄,g=1 | GL₂(𝔽₃) order 48; joint field bound 48²=2304 | Infinite K allowed | None |
| §5.4 relative factorization | K=k; K=k̄; K=k(t), A=E² | Identity degree 1; factor field bound 48; End rank 1 and multiplicity 2 over k(t) | Simplicity relative to K | New target |
| §5.5 geometric isogeny | Non-CM E and nonsquare quadratic twist | Geometric degree 1; rational Hom rank 0 | Geometric conclusion necessary | Scope preserved |
| §6.1 non-CM graph | Identical E and period bases | G={(x,y,x,y)}, dimension 2; indicated intersection order 1 | Rank-one Hom used | Part I imported |
| §6.2 CM graph | Gaussian E, periods 1,1 | Diagonal dimension 1; projection degrees 1,1; product 1 | Different graph dimension | Locator fixed |
| §6.3 avoidance length | Gaussian E², diagonal B | dist((1,0),Lie B)=1/√2; inverse square 2 versus ρ⁻²=1 | Avoidance differs from shortest period | None |
| §6.3 degree and x | Gaussian E²,L₀^a,a=10⁵ | d_X=2·10¹⁰, d_B=10⁵, x=1/200000; δ⁻²=1/100000 | Factorial retained | None |
| §6.3 sharp inequality | Same scaled example | Degree contribution x log d_X≈0.000118595 versus LHS 0.00001 | Consistent for C≥1 | Recomputed |
| §6.3 rescaling/averaging | L→L⁴; degree-two extension | x→x/4, δ→2δ, ρ→2ρ; μ∨→μ∨+log2; embedding sum and D both double | Metric sign and averaging fixed | New supplier law |
| §6.3 matrix-period input | Square Gaussian product; L→L⁴ | Mean ρ⁻²=1→1/4; d_L=2→32 | Weakened source bound consistent | Exact target stated |
| §6.3 cotangent slope input | g=2,h⁰(L)=1→16 | Bound 3h_Del+64log2 rises by 6log2; slope rises by log2 | h⁰=d_L/2 necessary | Exact target stated |
| §6.3 stable-height elliptic bound | Identity, D=1 and D=2 | N=1≤C max(1,h_F,0)²; explicit degree factor 1→4 | D=1 positive | None |
| §6.4 j-height headline | j=0,D=1,2 | D=1 expression 0 fails; D=2 expression 4C(log2)²≈1.921812C; separate D=1 bound C | D≥2 retained in Lean | Headline added |
| §7.1 algebraic image span | Trivial group on Ẑ²; full GL₂ | Scalar rank 1 versus matrix rank 4; (I+e₁₂)−I=e₁₂, e₁₂e₂₁=e₁₁ | Group and algebra distinguished | None |
| §7.1 universal property | Rank-one T; identity subgroup | Span of 1 is all Ẑ; smallest unital algebra has rank 1 | Unital definition fixed | None |
| §7.2 product comparison | Local additive indices 2,3,1 elsewhere | Product 6; infinitely many nontrivial factors give infinite index | Closure proved before product | Attribution repaired |
| §7.3 centralizer reduction | ψ(x)=2x; ψ=0 | M_A=2; kernel mod2 dimensions 0→1, mod3 0→0; zero ψ gives M_A=1 | Injectivity versus surjectivity separated | Variant distinguished |
| §7.4 fixed-prime bound | ℤ_ℓ, d=ℓ² | Open subgroups indices 1,ℓ,ℓ²: three choices | Finite maximum | Existing analytic supply |
| §7.5 residual refinement | Non-CM E full GL₂; trivial action on 𝔽₂² | Commutant dimensions 1 versus 4 | Threshold cannot vanish | Owned residual target |
| §7.6 large-prime algebra | Full residual GL₂ | Residual generated algebra dimension 4; Q/ℓQ=0 gives Q=0 and index 1 | Nakayama applies to finite quotient | Uniform variant identified |
| §7.7 global bound | Local bounds 4 at 2,9 at 3 | 4·9=36; indices elsewhere 1 | All primes retained | Parent citation added |
| §8.1 rational algebraicity | Constant non-CM E/ℚ(t) | Hom⊗ℚ_ℓ and equivariant Hom dimensions both 1 | Field, not algebra finite generation | Explicit target owned |
| §8.1 integral saturation | Multiplication [ℓⁿ] on E | Degree ℓ^(2n); divisible Tate action factors via [ℓⁿ] | Native torsion quotient used | Route decomposed |
| §8.2 specialization saturation | 2ℤ⊂ℤ and ℓ₀=3 | Tensor equality over ℤ₃; integral cokernel ℤ/2≠0 | One-prime equality insufficient alone | Cokernel contract narrowed |
| §8.3 supported connected image | Diagonal C₂ in two primes; supported ±I | Projections order 2, supported factors order 1; W=1 in both finite examples | Projection substitution false | None |
| §8.3 product/image functoriality | Product GL_n; trivial image | W(U)=U; W(1)=1; finite supported products stay in U | Closure gives full product | None |
| §8.4 supported bound | V⊂W, [W:W′]=2 | [V:V∩W′]=1 or 2; V=1 gives 1≤2 | Index direction correct | None |
| §8.5 full image bound | W=2ℤ,U′=3ℤ in ℤ | Intersection 6ℤ; [W:6ℤ]=3; ambient indices 6→3 | Algebra enlargement decreases index | None |
| Maximal-slope existence/vector inequality | Trivial Hermitian line, e=1 | μ̂_max=0; −h(1)=0; degree-two extension 0/2=0 | Normalization stable | Precise gap added |
| Symmetric-power slope | Rank one,n=0,2; rank two,n=2 | 0=0; 0≤4log2 | Zero exponent allowed; rank zero excluded | Precise gap added |
| Morphism slope | φ=[2] on trivial line | hφ=log2+log(1/2)=0; inequality 0≤0 | All-place height required | Precise gap added |
| Metric-rescaling slope | Squared metric factor 4 | μ changes 0→−log2, dual 0→+log2 | Factor 1/2 and sign correct | Precise gap added |
| Semistable tangent metric | Gaussian tangent period 1, L→L⁴ | Period length 1→2, dual norm 1→1/2 | Further extension uses same pulled-back lattice | Separate gap added |
| Minkowski strict inequality | ℤ⊂ℝ, symmetric interval | (−1,1) volume 2=2·covolume, no nonzero point; (−2,2) volume 4>2 contains ±1 | Strict threshold necessary | Native theorem imported |
| Cyclic-maximal-subfield contract | ℚ algebra; rational Hamilton division algebra | Index/field degree 1/1 and 2/2; ℚ(i) cyclic quadratic splitter | Center and nonzero twist retained | Existing gap used |
| Finite Frattini detection | ℤ_ℓ and infinite product C_ℓ | Quotient order ℓ in first case; infinitely many free coordinates in second | Finite-dimensional hypothesis essential | Existing supplier verified |
| Profinite idempotents | Two distinct prime components | e_p²=e_p, e_pe_q=0; projected finite sum is 1 once prime included | Product topology limit correct | Native supply verified |
| Worked trace example | Four matrix units in End(E²) | Squared lengths 2,2,2,2; Gram det 16; regular det −16 | All layer invariants agree | None |
| Worked adelic example | Exceptional bounds at 2,3; diagonal C₂ | Global bound 36; supported diagonal subgroup order 1 versus projections 2 | Both finite operations distinct | None |
