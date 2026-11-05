# Repair report

## F01 (P3) — applied

The unsupported sign and projective Deligne-comparison citations → Kato §8.4 and the supplied ordered Chern product, with the unused comparison deleted. All four occurrences, including §3.4's Needs and Layer 3 Dependencies, are gone. Kato2004 line 2583 supplies the cup-product normalization. MotivicEtaleKTheory now has an open roadmap, but its relevant layers are 6–7, not §§12.1–12.2.

## F02 (P2) — applied

The API catalogue → two admitted headline theorems: ellipticCyclotomicFiniteGeneration for every m ≥ 1, including CM curves, and ellipticRationalPoints_finite under an entire continuation nonzero at 1. Both explicitly retain nonsingularity and q-expansion modularity. README §7.9 states identical hypotheses. The module docstring identifies unstated headlines and missing carriers. Evidence: Kato2004 line 4609 and line 4630; native carriers elaborate at the pins.

## F03 (P2) — applied

The conditional criticalBadReductionComparison target → a Scope deferral to ModularSymbolsPadicLFunctions §3.3. Section 6.5 retains precise domain restrictions and critical/supercuspidal negative controls. The unsupported vector-comparison promise is deleted in both §§6.2 and 6.5. The supplier requires a jointly analytic arithmetic section; §6.4 supplies equality of specializations, not its construction. Kato2004 line 5978 and line 5994 require the strict slope inequality.

## F04 (P2) — applied

Owned boundary nonvanishing → AutomorphicLFunctionsAndLocalFactors AL.3, rs-boundary-nonvanishing, with GL2AutomorphicRepresentationsAndTransfer §R16.5.3's complete L-function dictionary. Added both contracts, Scope ownership, §4.2 Needs and Layer 4 Dependencies. Rohrlich and the derived twisted nonvanishing remain targets. The shift sends k = 3, r = 2 to the unitary boundary 1; unequal ranks exclude the pole exception.

## F05 (P3) — applied

All former definitions, small theorems and computed examples → README targets and Checks only. This includes both finite-support theorems of §4.5, not just the examples enumerated by the review. Suggested.lean now has exactly two headline theorems, no definitions or examples. No deleted statement was proved in place; the substantive general-library targets remain in the README.

## F06 (P3) — applied

Backticked undeclared package API identifiers → plain prose throughout Layers 0–7 and their consumers. Deleted the proposed-name exemption. Only the two actual headline declarations retain identifier backticks. Supplier declarations and mathematical expressions retain code formatting. The gate reports zero readme-ids-missing findings; every remaining declaration is described with matching generality in §7.9.

## F07 (P3) — applied differently

All three stale names → ModularForm.eisensteinSeriesMF. The review's proposed EisensteinSeries.eisensteinSeriesMF is also absent: the pinned Basic.lean enters namespace ModularForm at line 27 and defines eisensteinSeriesMF at line 35. A scratch #check of the corrected qualified name succeeds; the proposed namespace fails. The carrier requires N nonzero and weight at least three, as §3.2 does.

## F08 (P3) — applied

Missing manifest → 23 unique works with bibliographic and locator fields, fetched through the sources service or recorded as paywalled. Restored FontaineMessing1987's waiver and completed metadata the service omitted. The inaccessible historical Momose citation → Loeffler's already-cited, readable general theorem; no mathematical target changes. All remaining References are represented. Source validation reports zero problems and no unresolved source request remains.

## F09 (P3) — applied differently

Kato's locators → §13.9 starting on p. 229 and proof §2.11 on p. 131. Added Nakamura Remark A.6 and §3.1.2. Rather than infer published pagination, every Nakamura2023 locator now explicitly uses the fetched arXiv v2, including §§2.2–2.3, 5.4–5.6, 7.2 and References. Evidence: Kato2004 lines 583 and 4356; Nakamura2023 line 1334 and line 3853.

## F10 (P3) — applied

The unrealizable α = 2 → the CM curve y² = x³ − x at 3. Its reduction has four points, so a₃ = 0; α² = −3 has slope 1/2. Both Euler factors equal 1 + α/3; their product is 2/3 + 2α/3. The excluded α = 2 remains a negative control, forcing the nonintegral trace 7/2.

## F11 (P3) — applied

Added ArithmeticGaloisDuality §R02.4.4 to §4.4's Needs, its supplier contract and Layer 4 Dependencies. Added EulerSystemsAndKolyvaginSystems §2.5 to §7.3's route, Needs and Layer 7 Dependencies. The latter constructs finite-order twists; §4.6 remains the distinct cyclotomic twist. Both supplier sections were opened and their stated hypotheses retained.

## F12 (P3) — applied differently

RankZeroOneBSD → RankZeroOneBSDPartII, with “can use” because the merge order establishes its identity but no readable consumer statement establishes actual use. Deleted EllipticRegulators. Added HeegnerPointEulerSystems §6.9, whose explicit Kato dependencies are §§6.6, 7.4, 7.7. The other two named consumers remain. No dependency on a downstream consumer was introduced.

## Gate failure: missing sources.toml

Added packages/KatoEulerSystems/sources.toml, schema tauceti-roadmap-sources/v1: 23 unique works, 13 certified, nine uncertified paywalled works, one waived work. Every entry has id, authors, title, year, locator_scheme, locator, cited_for, licence_class and status. Existing lifetime keys were retained, including Rubin2000 for the 1999 draft. Publication and preprint metadata share one entry with version notes. No fetched source or extraction is stored in the package.

The source service does not infer bibliographic metadata for several direct PDF URLs; those fields were completed from the cited works. FontaineMessing1987 remains waived. Image-only Serre and Ribet scans were fetched but their unextracted contents are not asserted as fresh textual evidence: the unchanged image assertions have readable Loeffler, Rubin and Kato support. The redundant historical Momose work was replaced by Loeffler Theorems 2.2.2 and 2.3.1, which state the same general image input used by §4.1.

## Checks and exact outcomes

- Suggested.lean elaboration from the content checkout: exit 0; exactly two “declaration uses sorry” warnings, at the two headline declarations; no errors. No TauCeti module build was needed.
- Scratch #check @ dump: exit 0 after correcting F07's namespace. Both package declarations retain W.IsElliptic, the complete existential modularity hypothesis, and all explicit hypotheses. The tower theorem retains m and 1 ≤ m. The finite-points theorem retains F, complex differentiability, agreement on Re(s) > 3/2 and F(1) ≠ 0. Neither loses a section binder; no binder repair was necessary.
- Pinned carrier checks: WeierstrassCurve.LFunction and LSeries, Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:79,84; baseChange, EllipticCurve/Weierstrass.lean:235; nonsingular Point, EllipticCurve/Affine/Point.lean:475; UpperHalfPlane.qExpansion, ModularForms/QExpansion.lean:171. The native Point includes the point at infinity; IsElliptic rules out singular cubics. The native LSeries supplies a total sum, not critical continuation. ContinuousCohomology.tateShafarevich, Homological/ContCohomology/Sha.lean:71, takes supplied topological Galois modules and local field data; it does not construct the elliptic Galois module.
- Sources check: `packages/KatoEulerSystems/sources.toml: 0 problem(s)`; exit 0.
- Dependency command, with the required merge order and movable flag: exit 0. Exact output:

```text
depcheck: 44 roadmaps, 454 edges, 0 problem(s)
```

- No UPWARD, CYCLE or moved line was emitted.
- Citation resolver: no missing cross-roadmap citations and no unresolved Lean names. Its notice that it did not inspect pinned Lake packages was handled by direct pin searches and the successful scratch #check dump.
- Content gate: exit 0, ok = true, every count zero, notes empty and details empty. The content-layout CLI expects TauCetiRoadmap rather than packages; it was run on a scratch Git view with a read-only symlink to this package. Its Git cleanliness is the view's cleanliness, not a claim that the authorized board edits were committed. The worker must run its package submission gate on the board.
- Diff whitespace check: exit 0. Changes are confined to the permitted package files and this report. No commit, push or external message was made.

## Supplier and ownership audit

Read the main-branch EllipticCurves, ModularForms and PadicMeasuresIwasawaAlgebras roadmaps for shape. Reopened the cited available suppliers at main or their indexed new-roadmap heads, including the modular curves and coefficient systems, K-theory transfers and symbol sign, Galois realizations, Selmer/twist and duality contracts, Euler-system bounds, modular symbols, completed homology and abelian Mordell–Weil. Ownership searches used both the roadmap service and the board packages, by objects (cyclotomic finite generation, arithmetic family sections, boundary nonvanishing and regulator constructions), not just proposed names.

The two Lean headlines specialize this roadmap's existing §7.9 endpoints. EllipticCurves Layer 6 supplies Mordell–Weil over number fields, not finite generation over an infinite cyclotomic tower or the L-value implication. ModularSymbolsPadicLFunctions §3.3 and AutomorphicLFunctionsAndLocalFactors AL.3 retain the generic comparison and nonvanishing results. No fully qualified name of another roadmap was assigned here.

PadicHodgeRegulators could not be opened at main, the indexed open heads, or the supplied board package index. Its substantial pre-existing contract is therefore exposed as gap:kato-padic-regulators under Exact supplier contracts and in the plan's top-level gaps list. That is the only plan data added; no supplier theorem or new construction is invented. The supplier is earlier in the supplied merge order. Its authors must settle the supply; this package cannot implement their roadmap. The other supplied open heads were searched through the roadmap service; no unprovided pull-request head was fetched separately.

## Adversarial mathematics pass

The rows give explicit computations or separating instances. Linear and finite-module models test laws and hypotheses, not the truth of deep arithmetic theorems by analogy; those theorems also retain their cited source and supplier hypotheses. “Retain” means the mathematical statement was preserved; identifier typography alone is not a new theorem.

| Statement | Instances and values computed on the two sides | Result | Change |
|---|---|---|---|
| Frobenius convention | k = 2, ℓ = 3, a = 2: geometric polynomial 1 − 2u + 3u²; inverse-root arithmetic polynomial 1 − 2t/3 + t²/3 | Different polynomials; inversion is essential | Retain |
| Twist convention | 2 − r + (k − 2): (k,r) = (2,1) gives 1; (4,1) gives 3 | Both equal k − r | Retain |
| Dyadic coefficient convention | In ℚ × ℚ, (1,0)(0,1) = 0; both factors nonzero; 1/2 is not integral in ℤ₂ | Regular-scalar torsion and rational projectors required | Retain |
| Ordered Chern sign | With Kummer classes a,b, ch({u,v}) = a cup b; swapping slots gives b cup a = −a cup b | c₂,₂ = −ch has opposite sign | Replace unused attribution |
| Critical sign | (k,r,χ(−1)) = (2,1,1),(2,1,−1),(4,2,1) give 1,−1,−1 | Weight and character parity both matter | Retain |
| Admissibility | Upper unipotent parameter 1 has kernel of σ−1 spanned by e₁; parameter 0 gives dimension 2 | Identity fails dimension-one condition | Retain |
| 0.1 theta norm direction | At c = 5, a = 2, a nonzero 2-torsion point has coefficient 0 in 25[0]−E[5], 24 in 25E[2]−E[10] | Pullback and norm cannot be reversed | Retain |
| 0.1 rational Siegel unit | Fixed index, c = 5,7 gives smoothings 24g,48g; dividing by 24,48 gives g,g | Integral smoothings differ; rational result agrees | Retain in README |
| 0.1 auxiliary identity | 48(24g) = 1152g = 24(48g) | Auxiliary normalization agrees | Retain |
| 0.1 pullback | Identity sends u = 2 to 2 and u⁻¹ = 1/2 to 1/2 | Constant-one replacement gives 1,1 and fails | Retain |
| 0.2 row action | (1/5,0) times upper shear = (1/5,1/5); times lower shear = (1/5,0) | Transposed action fails | Retain in README |
| 0.2 determinant | diag(2,1) at N = 5 sends ζ₅ to ζ₅²; identity sends ζ₅ to ζ₅ | Constants and pairing component transform | Retain |
| 0.2 simultaneous distribution | A = 1,2,4 gives 1,4,16 roots of a nonzero pair; A = 0 has no preimage of it | Two-coordinate count is A² | Retain |
| 0.3 leading exponent | B₂(0)/2 = 1/12; B₂(1/2)/2 = −1/24; B₂(2/5)/2 = −11/300 | Missing square instead gives −23/300 at 2/5 | Retain in README |
| 0.3 reflection and cusp order | B₂(3/5)/2 = −11/300; width 5 multiplies this exponent to −11/60 in q^(1/5) | Reflection agrees; width changes valuation | Retain |
| 0.3 nonzero torsion index | (a,b) = (0,0) gives first factor 1−1 = 0; (0,1) at N = 5 gives 1−ζ₅ ≠ 0 | Zero pair excluded | Retain |
| 0.4 degeneracy product | A = 1,2,4 gives 1,2,4 second-coordinate roots, versus 1,4,16 simultaneous roots | Distinct from 0.2 | Retain |
| 1.1 level prime sets | (2,3) → (6,9): combined sets both {2,3}, first sets {2} versus {2,3} | Separate index hypotheses fail | Correct locator only |
| 1.1 projection formula norm | For 2+i in ℚ(i), norm = (2+i)(2−i) = 5; trace = 4; identity extension norm(2) = 2 | Norm, not trace, is required | Retain |
| 1.2 auxiliary Euler operator | At ℓ = 3, identity dual operators give 1−1+3 = 3 unramified, 1−1 = 0 ramified | Quadratic term absent in ramified branch | Retain |
| 2.1 evaluated Euler polynomial | k = 2,r = 1,ℓ = 3,a = 2: coefficients (1,−2/3,1/3); a = 0 gives (1,0,1/3) | Arithmetic/twist normalization fixed | Retain in README |
| 2.1 constant term | X = 0 gives 1 in both cases; repeated conductor prime gives identity, not value P(1) = 2/3 | Constant term and trace branch distinct | Retain in README |
| 2.1 conductor domain | With Σ containing p, m = 1 has empty intersection, m = p has intersection {p}, m = pq with q in Σ fails | Quantified domain has the required p-factor | Retain |
| 2.2 literal dual | For rank two, Sym² has monomial and divided-power middle terms differing by 2; 2 is a unit over ℚ, not over ℤ₂ | Integral dual identification needs factorial invertibility | Retain |
| 2.2 dual Hecke eigenvalues | k = 2,ℓ = 3 gives S′ eigenvalue ε(3); multiplying by ℓ gives 3ε(3), the coefficient of X² | Twist-one polynomial recovered | Versioned locator |
| 2.3 full-level operator | T = S = σ = 1 gives ℓ; σ = 0 gives 1; at ℓ = 3 values 3,1 | Zero projection cannot replace the operator | Retain in README |
| 3.1 filtration branches | k = 4, i = 0,1,2,4 gives D,M,M,0; gr¹ = M/M = 0 | Filtration step is not associated graded | Retain in README |
| 3.1 endpoint and monotonicity | k = 2 gives D at 0, M at 1, 0 at 2; D ⊇ M ⊇ 0 | Endpoints and decreasing direction agree | Retain in README |
| 3.1 restricted dual exponential | Range restriction followed by inclusion sends value m to m, including m ≠ 0, rather than 0 | Actual map is unchanged | Retain |
| 3.2 Eisenstein normalization | Weight 4 gives constant 1/120; omitting prefactor gives 2ζ(4) = π⁴/45 | Normalized and raw sums differ | Correct native name |
| 3.2 Fourier transform | At N = 3,k = 3: 3^(1)·3^(−3)·3² = 1; wrong forward normalization gives 3⁴ = 81 | Inverse normalization fixed | Retain |
| 3.2 dlog and smoothing | Fixed index, c = 5 gives 25−1 = 24; c = 7 gives 49−1 = 48; dlog(g) = −F² has opposite sign from F² | Sign and smoothing agree | Retain |
| 3.2 small weights | k = 1 gives forward and inverse factors N⁻¹; k = 2 excludes F² at zero index | Weight-one equality does not extend to forbidden weight-two input | Retain |
| 3.3 Eisenstein product branches | r = r′ = k−1 gives M^(−1)N^(1−k), (k−2)! denominator and E¹ = F¹ in both formulas | Endpoint formulas agree | Retain |
| 3.3 period map | per(0) = 0; per(2ω) = 2per(ω); nonzero period excludes zero map | Not an arbitrary affine map | Retain |
| 3.3 smoothing critical values | k = 2,r = 1,c = 5,d = 7,χ = 1: factors 25−5 = 20,49−7 = 42; product 840 | Unit-smoothing product 24·48 = 1152 would be wrong | Retain |
| 3.4 operator zeta | Z(0) = 0; if first Taylor coefficient is A, lim Z(s)/s = A | Value 0 cannot replace derivative A | Delete unused comparison |
| 3.4 real regulator | On 𝔾_m, η(2,z) = i log(2)dθ; integral 2πi log(2); swapping slots gives its negative; η(2,2) = 0 | Ordered sign and logarithm necessary | Retain |
| 3.4 minus projection | ι(v⁺,v⁻) = (v⁺,−v⁻): (v−ιv)/2 = (0,v⁻); plus gives (v⁺,0) | Distinct projections; 1/2 not integral dyadically | Retain |
| 4.1 split and division images | Upper unipotent 2 has fixed dimension 1; diag(1,−1) over ℚ has dimension 1; d−1 invertible in a division algebra gives dimension 0 for d ≠ 1 | Unipotence is sufficient, not necessary | Retain in README |
| 4.1 integral quotient | Parameter 1 gives cokernel ℤ_p; parameter p gives ℤ/p ⊕ ℤ_p | Rational dimension 1 does not imply free lattice quotient | Retain |
| 4.2 boundary shift | k = 3,r = 2 gives 2−(3−1)/2 = 1; k = 4,r = 3 gives 3−3/2 = 3/2 | Boundary and strict half-plane both supplied | Import owner |
| 4.2 central nonvanishing | k = 2,r = 1 is central; value 0 is permitted for the trivial character; k = 3,r = 2 is boundary | Rohrlich's finite exception is necessary | Retain |
| 4.2a strict kernel | A map H² → H²_loc equal to identity has kernel 0; a zero map has kernel all of H² | Global and strict H² cannot be identified indiscriminately | Retain |
| 4.3 finite-order twists | If τ fixes cyclotomic roots, η(τ) = 1 and τ on V⊗η⁻¹ equals τ on V | Fixed dimension and quotient unchanged | Retain |
| 4.3 residual parity | A pro-3 action on two lines is trivial since 3-power image order divides 2; a pro-2 image can have order 2 and exchange them | Oddness restriction retained | Retain |
| 4.3 bound ideal | Zero class in rank-one Λ gives J = 0; generator gives J = Λ and quotient length 0 | Nonvanishing required for useful finite bound | Retain |
| 4.4 module structure | Zero module has rank 0; Λ has rank 1; ℚ×ℚ has two idempotent components each rank 1 over itself | H² torsion alone does not fix H¹ rank | Add Euler-characteristic input |
| 4.5 pseudo-null finite support | ℤ₃[[T]]/(3,T) has cardinal 3 and localizes to 0 at height ≤ 1; ℤ₃[[T]]/(3) = 𝔽₃[[T]] is infinite with nonzero localization at (3) | Separates pseudo-null from height-one torsion | Keep README only |
| 4.5 regular annihilator | μ = 3: R/μR has 3·1 = 0 with 1 ≠ 0; μ = T: R/TR = ℤ₃ has injective multiplication by 3 | Missing regularity would allow infinite R/(3) | Keep README only |
| 4.6 twist–localization square | κ(γ) = 4,j = 1 gives scalar 1/4 globally and locally; inverse j = −1 multiplies by 4; composite scalar 1 | Opposite convention would give 4 instead of 1/4 | Retain |
| 4.7 cyclotomic image | Determinant on [[1,x],[0,1]] is 1 for all x; x = 0 gives rank(σ−1) = 0, x ≠ 0 gives 1 | Open determinant-one subgroup supplies nonzero parameters | Retain |
| 5.1 canonical map/conjugation | z(0) = 0; for z(v) = w, z(ιv) = −σ₋₁w; applying conjugation twice gives w | Minus sign and involutions consistent | Correct locator |
| 5.1 zeta span | On a one-dimensional model, span{0} has rank 0, span{1} has rank 1 | Membership does not establish non-torsion | Retain |
| 5.2 finite index | 2ℤ ⊂ ℤ has quotient cardinal 2; equality after tensoring ℚ gives ℚ = ℚ | Rational equality alone does not give integral equality | Retain |
| 5.3 critical interpolation | γ⁺ = 1,γ⁻ = 0: plus projection 1, minus 0; γ = 0 gives both 0 | Parity selects the correct component | Retain |
| 5.4 twist-one morphism | (1−k)+k = 1 for k = 2,4; (−id)z(−v) = z(v) by linearity | Two sign changes cancel | Add exact source |
| 5.4 conductor relations | Repeated-prime factor 1; new-prime polynomial with ℓ = 3,k = 2,a = 0,ε = 1 is 1+3X² | Same inverse-Frobenius variable, different twist from 2.1 | Add Remark A.6 |
| 5.5 parabolic torsion-freeness | Λ⊕Λ/(T) → Λ is generically an isomorphism, yet sends (0,1) to 0 | Generic injectivity needs torsion-free source | Versioned locator |
| 5.6 parabolic characterization | Over ℚ, (x,y) ↦ (x,0) squares to itself; (1/2,0) is allowed rationally; no integral halving map on ℤ₂ | Splitting is rational; uniqueness also needs injectivity | Versioned locator |
| 6.1 de Rham domain | V = ℚ_p(1): dual twist ℚ_p has Dcris = Fil⁰ = ℚ_p; V = ℚ_p: dual twist ℚ_p(1) has Dcris dimension 1, Fil⁰ dimension 0 | Second input fails inclusion | Retain |
| 6.1 ramified Gauss sum | Modulo 3 quadratic χ gives G = ζ₃−ζ₃² = i√3; G⁻¹ = −i/√3; G² = −3 | Inverse and original differ | Retain |
| 6.1 unramified factor | r = 1,φ eigenvalue 2 gives 1−1/2 = 1/2; at p = 3 the unscaled inverse gives 1−3/2 = −1/2 | Factor p⁻¹ on inverse operator is needed | Retain |
| 6.2 normalized scalar | Pairing 〈ω,η〉 = 1; ω ↦ 2ω makes η ↦ η/2; γ ↦ 3γ gives scalar 3/2 | Requires nonzero normalization | Delete unsupported vector promise |
| 6.3 period dictionary | k = 2,r = 1 gives Kato power 1 and modular-symbol power (2πi)⁻¹; ratio 2πi | Period conversion absorbs ratio | Retain |
| 6.4 multiplicative factors | k = 2,r = 1,ε = 0: α = 1 gives (1−1)·1 = 0; α = −1 gives (1+1)·1 = 2, nonunit at 2 | Trivial zero and dyadic nonunit preserved | Keep README only |
| 6.4 actual supersingular example | y²=x³−x mod 3: points ∞,(0,0),(1,0),(2,0), hence a₃=4−4=0; α²=−3, v₃(α)=1/2 | Actual good-reduction root | Replace impossible input |
| 6.4 product and negative control | (1+α/3)² = 1+2α/3−1/3 = 2/3+2α/3; α=2 would give β=3/2, trace 7/2 | Formula evaluated within geometric domain | Correct Check |
| 6.5 critical uniqueness | k = 2: log_p(1)=0 but log_p(γ)≠0, while torsion characters give log_p(ζ)=0 | Classical values do not determine critical distribution | README control only |
| 6.5 absent crystalline line | Supercuspidal a_p=ε(p)=0 gives X², only root 0; inverse Frobenius on Dcris has no 0-eigenline | No scalar comparison asserted | Remove promise |
| 6.6 local lattice | Odd p: dual of pℤ_p under multiplication has lattice p⁻¹ℤ_p; at p=2, t=2u gives 2u+2u² ≡0 mod 4 | Cannot impose odd-prime lattice at 2 | Retain |
| 7.1 non-torsion | Multiplication by 1 on Λ has nonzero generic image; multiplication by 0 has generic image 0 | Ambient rank one alone insufficient | Retain |
| 7.2 corrected bound | Lengths (H²,H¹/Z,local)=(2,1,1) give 2≤2; (2,1,0) give 2≤1 false; (0,0,0) give 0≤0 | Local term and direction retained | Retain |
| 7.3 rank stabilization/descent | ℤ[1/3] has rational rank 1,torsion 0, but denominators 3ⁿ are unbounded; a homomorphism Γ→T₀ with exponent e is zero on eΓ | Uniform descent, not rank alone, proves finite generation | Add finite-order twist input |
| 7.4 ordinary divisibility | Split α=1 gives Coleman factor 0; nonsplit α=−1 gives 2; good ordinary unit factor remains squared | Augmentation ideal cannot be dropped in split case | Retain |
| 7.5 norm modules | On a p-primary reduction group ℤ/9 at p=3: multiplication twice by 3 is 0; on a prime-to-p part tensor ℤ_p is 0 | Reduction contribution to p-adic inverse limit vanishes | Retain |
| 7.6 no finite submodule | Λ/(3,T) has cardinal 3 and is torsion; Λ has no nonzero finite submodule | Torsionness is insufficient | Retain |
| 7.7 ordinary local error | For unit α and β=p/α, (1−α)(1−β)=#Ẽ; 1−β is a unit. Thus v_p(#Ẽ²)=2v_p(1−α⁻¹); v_p(1−α⁻¹)=1 gives error p² | Nonunit error remains on both sides | Retain |
| 7.8 rank-zero upper bound | v_p(correction)=2 and v_p(L/Ω)=3 gives bound 5 before control and 3 after subtracting 2; p=2 makes excluded product even | Cancellation and upper-bound direction fixed | Retain |
| 7.9 critical twists | k=2: critical set {1}, all central; k=3: {1,2}, neither equals 3/2 | L-value hypothesis occurs precisely centrally | Retain |
| 7.9 χ-component | For C₂ acting by (x,y)↦(x,−y), trivial part is {(x,0)}, sign part {(0,y)} | Finiteness of one part does not imply the other | Retain |
| 7.9 admissibility over K | On the subgroup fixing K, finite character ψ takes value 1; twisting preserves σ−1 and its kernel dimension 1 | Finite-order twist transport valid | Retain |
| 7.9 abelian local condition | At v not dividing p, pro-ℓ finite-index group has zero tensor ℚ_p and zero tensor ℚ_p/ℤ_p; at p the Kummer line has dimension dim A | Distinguishes away-p and p conditions | Retain |
| 7.9 rational index | R=ℤ₃,z=1/3: choose c=3,y=1, [R:Ry]=1,[R:3R]=3, index=1/3 | A positive group order ≤1/3 impossible | Retain |
| Headline tower at m=1 | mⁿ=1, so x^(mⁿ)=1 iff x=1; adjoin_ℚ{1}=ℚ | Precisely Mordell–Weil base case | Add signature |
| Headline tower at composite m | m=6: 6⁰=1,6¹=6,6²=36; each divides the next; ζ₆^6=1,ζ₃₆^36=1 | Adjoin equals nested cyclotomic union | Add signature |
| Headline nonsingularity | y²=x³ has Δ=0; nonsingular group ≅(ℚ,+), containing 1/n for every n≥1 | IsElliptic excludes singular infinite-generation model | Explicit hypothesis |
| Headline modularity | Native LFunction has coefficients a₀=0,a₁=1; zero cusp form has a₁=0 | Zero form cannot witness modularity | Explicit full q-expansion hypothesis |
| Headline continuation | Entire F₁,F₂ agreeing on the open half-plane have difference 0 there, hence identically 0; F₁(1)−F₂(1)=0 | Continued value is uniquely determined | Explicit continuation hypothesis |
| Headline finite rational points | Nonzero analytic central value forces rank 0 by Corollary 14.3; finitely generated rank-0 group is its finite torsion subgroup; rank≥1 would give rational tensor dimension≥1 | Exact elliptic endpoint, including CM | Add signature |

## Maintainer consequences

The two new acceptance names are ellipticCyclotomicFiniteGeneration and ellipticRationalPoints_finite. All 21 former named declarations were removed from Suggested.lean; their mathematics stays as README targets. Consumers should use the supplied library APIs when implemented, not import this acceptance file. criticalBadReductionComparison is no longer an owned target. The new supplier gap asks only for the regulator inputs the roadmap already consumed. No merge-order file, supplier roadmap, tooling, pin or pull-request text changed.

Removed acceptance declarations by layer (the README retains their mathematical content):

| Layer | Names |
|---|---|
| 0 | rationalSmoothing; torsionIndexAction; siegelLeadingExponent; siegelLeadingExponent_eq_bernoulli |
| 2 | katoEulerPolynomial; katoEulerPolynomial_eval_zero; fullLevelEulerOperator |
| 3 | modularFiltration; modularFiltration_nonpositive; modularFiltration_critical; modularFiltration_endpoint; modularFiltration_antitone; criticalSign |
| 4 | upperUnipotent; HasOneDimFixedSpace; upperUnipotent_hasOneDimFixedSpace_iff; diag_hasOneDimFixedSpace; ker_sub_one_eq_bot_of_division; finite_of_pseudoNull; finite_of_regular_annihilator |
| 6 | ordinaryEulerFactor |
