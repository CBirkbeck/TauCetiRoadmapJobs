# Repair report: quantitative isogenies and uniform integral Tate bounds

## RT-FaltingsFinitenessAndIsogenyTheoremsPartII~2a/F01 (P3) — applied

Two assertions presented as Checks → deleted from §§3.3 and 7.2. The limiting-body convention remains in §3.3’s definition; the generator bound remains in §7.2’s proof route. The numerical disk and scalar/matrix examples remain. No Lean padding was added. Open and closed unit disks both have area π; scalar and full matrix spans on Ẑ² have ranks 1 and 4.

## RT-FaltingsFinitenessAndIsogenyTheoremsPartII~2a/F02 (P3) — applied

“Infinitely many index-2 factors” → explicit local orders of index ℓ, in §7.2 and Layer 7 Examples. Reduction of the lower-left entry gives the additive quotient 𝔽_ℓ; the quotient is not asserted to be a ring. Indices at 2 and 3 multiply to 6. The all-prime quotient is infinite and explicitly excluded as a Galois-image example.

## RT-FaltingsFinitenessAndIsogenyTheoremsPartII~2a/F03 (P1) — applied differently

Stale geometry supply → SuccessiveMinima §§0.1–0.2, 1.5, 1.11; GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3, 1.3; pinned Gram/covolume identity. This also settles review b/F01. The suggested transport through SuccessiveMinima §3.3 is valid but unnecessary: GeometryOfNumbersAndQuadraticArithmetic §1.3 explicitly owns the general upper inequality. Scope, §1.3’s proof/Needs, §§2.7, 2.9, 2.10 and Layers 1–2 Dependencies now agree.

## RT-FaltingsFinitenessAndIsogenyTheoremsPartII~2b/F01 (P2) — applied

The same supplier defect as review a/F03 is repaired once, throughout the README. SuccessiveMinima’s main-branch §§0.1, 0.2.1, 1.5, 1.11 supply Hadamard, flags and attainment; GeometryOfNumbersAndQuadraticArithmetic §1.3 supplies positivity and the general upper product bound. Its §1.2 concerns squared integral minima. HeightsAndUnits §2.1 retains ownership of short integral bases. A transported rectangle Check distinguishes these notions.

## RT-FaltingsFinitenessAndIsogenyTheoremsPartII~2b/F02 (P3) — applied

Néron §6.0 “extends Hilbertianity” → imports Hilbertianity from InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and owns the Noether-normalization/full-image closed-point bridge. Both supplier paragraphs changed. The supplier head confirms this division; IG.2.4 explicitly contains rational-function Hilbertianity and finite-extension permanence. Added Checks compute transcendence/extension degrees and connected versus split quadratic fibres. No new prerequisite or supplier gap is needed.

## RT-FaltingsFinitenessAndIsogenyTheoremsPartII~2b/F03 (P3) — applied

Degree definition locator 99 → 94 at pinned Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. The adjacent carrier citation now separately identifies `TauCeti.Isogeny` in `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Basic.lean`, line 139. `degree_pos` is at Degree.lean line 148. No other occurrence of the stale degree locator remains; no theorem signature changed.

## Evidence and ownership

The edited files are `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md`, `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean` and this report. `Suggested.lean` adds only the `module` header required to eliminate the repeated import warning. Metadata, source manifest and design plan are unchanged. There are no renamed or deleted Lean declarations for consumers to update.

The cited suppliers were inspected through `roadmaps show`, and main-branch copies were used for SuccessiveMinima, HeightsAndUnits, IntegralLattices, RepresentationTheory/SemisimpleAlgebras, ClassFieldTheory and Completed/ProfiniteArithmetic. The shape was compared with main-branch SuccessiveMinima, HeightsAndUnits and SemisimpleAlgebras. Specific evidence:

- `TauCetiRoadmap/SuccessiveMinima/README.md`: §0.1 states Gram–Hadamard; §0.2.1 gives prescribed integral flags; §1.5 gives simultaneous witnesses; §1.11 gives integral minimum flags; §3.3 states the coordinate flag upper inequality. Its descriptions of newer Tau Ceti modules are not evidence that those modules exist at this package’s pins. They are not imported or advertised here as pinned supplies.
- GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3 state adapted bases and projection covolumes. Section 1.3.3 explicitly states the arbitrary-Haar-measure upper product inequality on the real body-minimum carrier. Sections 0.1 and 1.5 are absent at that head; §1.2 is the squared-norm comparison. Thus both geometry findings have a valid witness, but no transported substitute theorem needs ownership here.
- HeightsAndUnits §2.1 gives the general gauge basis estimate and its minima form. A prescribed flag alone imposes no uniform vector-length bound.
- NeronModelsAndSemistableAbelianVarieties §6.0 explicitly imports Hilbertianity, names IG.2.4’s two permanence inputs, and keeps the closed-point bridge and torsion specialization. IG.2.8 uses the same transcendence-basis deduction inside its normal-subgroup target; the needed ingredients themselves are all in IG.2.4. IG.2.6 retains the constant-field part of full-group specialization.
- Pinned `TauCeti/Algebra/Module/ZLattice/Covolume.lean` lines 37–44 include finite real dimension, an inner product, Borel volume, discreteness and fullness, and equate squared covolume with the Gram determinant. The two empty quantities are 1. This supplies the §1.3 identity directly.
- ry25 lines 492–497 give the product algebra assertion; mw95 lines 170–187 give the norm-region volume and discriminant normalization. The deleted bullets repeated these constructions without testing them. noot95 lines 130–162 give the full-image specialization argument; lines 170–179 use rational Tate comparison and a torsion-free quotient for integral End preservation. These sources support the surrounding targets; the local-order control is established by the calculation below.

All cross-roadmap citations were searched again. AbelianSchemesAndArithmeticModuli A3.3–A3.6, A3.9, A3.11, A4.1, A5.1–A5.4, A6.1, A6.4–A6.8, A6.10–A6.14, A6.20, A6.22 and A6.25 have the stated objects. ArakelovGeometryAndAbelianHeights §§1.1–1.6, 2.4, 2.7, 3.4–3.5, 4.4, 5.7–5.9, 6.1–6.2 and 6.5 have the stated normalizations and estimates. Its §1.3 explicitly states `HermitianBundle.arakelovDegree_rescale`; this is a supplier’s planned declaration, not a claim that it exists in Mathlib. AutomorphicBundles B4.2, B4.9, B5.1a and B5.13 distinguish general scalar expansion from the rank-one comparison. FaltingsFinitenessAndIsogenyTheorems R28.4.5–R28.4.6 and R28.6.7 retain the number-field comparison, semisimplicity and almost-all-primes commutant. ArithmeticGaloisRepresentations §5.8 supplies a uniform open subgroup, §6.4a finite Frattini detection and §7.6 algebraic components. EllipticCurveModularityPartII §6.0f supplies the geometric quadratic estimate with its stable-height normalization.

The nine active supplier-gap slugs remain declared in both the README and the plan. None of these six findings needs another roadmap to add a statement. No design-plan entry or merge-order edit is warranted. Historical plan entries and findings settled outside this package are not reopened.

Ownership was searched by object using the mandated `roadmaps grep` over main and open heads, and by declaration name in the board packages and pinned libraries. The repair introduces no construction or foundational target: it consumes existing owners and changes prose Checks. No external fully qualified declaration name is reused. The original quantitative order, isogeny and uniform-index targets retain this roadmap’s ownership. Open work beyond the supplied sibling folders was searched through the mandated index; it was not independently inspected beyond that index. No fetched text was treated as an instruction.

## Pinned acceptance test and context

Pins: Mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2`; Tau Ceti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`, from the worker content manifest.

The headline inventory remains §§2.4, 2.8–2.9, 2.11, 3.5, 4.5, 5.2–5.5, 6.1, 7.2, 7.5, 7.7, 8.1–8.2 and 8.4–8.5. At these pins the abelian carrier, native End and IsIsogeny exist, but its polarized lattice, stable Faltings height and abelian Tate-module action interfaces needed by the other headlines do not. The module docstring identifies them. The two statable headlines are stated. The definition of regular discriminant is the sole extra definition and is used by the class-index headline. Neither theorem is a one-tactic library consequence. No substitute predicates, data admissions, boundary declarations or examples were added.

A scratch copy containing `#check @name` for every declaration was elaborated once. Each printed type was compared with the README:

| Declaration | Retained binders and comparison | Result |
| --- | --- | --- |
| `regularOrderDiscriminant` | Arbitrary universe; Ring D; Subring O; natural m; actual ℤ-basis indexed by Fin m. No semisimplicity needed for the definition; the README separately restricts nonvanishing. | All binders retained; no change. |
| `class_index_bound` | DivisionRing D, ℚ-algebra, finite rational dimension, actual basis of full O, positive e, O-stable M, finite integral generation, full rational span. Conclusion gives an injective O-linear map, nonzero native index, and real exponent e/2. | All binders retained; matches §3.5. |
| `elliptic_isogeny_j_height_bound` | Absolute positive C precedes arbitrary number field k and both elliptic curves and ellipticity instances; geometric isogeny hypothesis; conclusion uses geometric function-field degree and source j-height. | All binders retained; includes D=1 and both CM cases; matches §6.1. |

There are no ambient section variables. All three names appear in the README. Searches found no declaration collision on main, open heads, other board packages or pinned libraries. Imports remain exactly `Mathlib` and the used Tau Ceti Degree module; no options or sorry-valued data occur.

## Adversarial mathematics ledger

Rows cover the definitions, assertions, conventions and proof inputs of each numbered subsection; distinct embedded targets and changed supplier assertions receive separate rows. Repeated Examples use the same computations. Unspecified dimension constants are tested by necessary lower bounds and dependence, not assigned invented values. Number fields exclude characteristic p, equal characteristic, inseparable fields and zero rings. The division-algebra hypotheses exclude the zero ring from the class-index theorem; the discriminant definition itself permits it.

| Statement | Instances tried and computed values on both sides | Result; change |
| --- | --- | --- |
| Composition convention | On E², e₁₂e₂₁=e₁₁; reversing gives e₂₂. | Composition order determined; unchanged. |
| Abelian versus regular trace | Non-CM E: Tr_A(1)=2, tr_ℚ(1)=1; Gaussian CM: regular trace 2, abelian trace 2. | They cannot be interchanged; unchanged. |
| Riemann-form sign and realification | Gaussian periods: E(i,1)=1, E(1,i)=−1; H(1,1)=1; q(i)=2 Re(i·conj(i))=2, whereas omitting conjugation gives −2 and omitting 2 gives 1. | Sign, conjugation and factor fixed; unchanged. |
| Height, principalization and Zarhin conventions | Formal h_F(A)=−1 gives h_F(Z(A))=−8 and dim Z=8g; map-degree δ=4 gives quotient degree 2 and Euler characteristic 2. | Negative height and square roots retained; unchanged. |
| Zero dimension and index conventions | Empty trace 0, determinant 1, degree 1; [0:0]=1; an infinite quotient has native index 0. | Positive-index condition excludes infinite index; unchanged. |
| General lattice upper product supply | L=2ℤ×3ℤ, K=[−2,2]×[−1,1]: minima 1,3, volume 8, covolume 6; 24=24. | Correct real minima and general supplier; repaired. |
| Lattice-basis transport | Coordinate body widths 2 and 2/3 give volume 4/3; 1·3·(4/3)=4. Multiplying volume by covolume 6 recovers 24. | Determinant direction fixed; added Check. |
| Gram–Hadamard supply | Orthogonal columns (2,0),(0,3): det Gram=36=4·9; columns (1,0),(1,1): det Gram=1<1·2; duplicate columns give 0. | Supplied by SuccessiveMinima §0.1; repaired citation. |
| Short-basis versus flag supply | Standard disk: minima 1,1 and short basis bound 1,1; (e₁,2e₁+e₂) has lengths 1,√5 and determinant 1. | Flags alone fail; HeightsAndUnits retained. |
| Lattice degenerate cases | Dimension 0: product 1, volume 1, Gram determinant 1. ℤ×{0} in ℝ²: second threshold set empty, hence real-infimum junk value 0 rather than positive attainment. | Fullness retained; added boundary Check. |
| Hilbertian permanence supply | ℚ: transcendence degree 0; ℚ(t): degree 1; ℚ(t,√(t³+1))/ℚ(t): algebraic degree 2, since t³+1 has a simple zero over its splitting field and is not a rational square. | IG.2.4 supplies all three cases; attribution repaired. |
| Full-group closed-point bridge | Y²=T at 2 gives ℚ(√2), degree 2 and group order 2; at 1 gives ℚ×ℚ, dimension 2 and two components. | Degree alone is insufficient; Néron ownership retained. |
| Maximal slope and vector-height contract | Trivial ℤ-line: slope 0, h(1)=0, so −h(1)=0≤0; field degree 2 doubles degree and denominator. | Nonzero bundles and normalization retained. |
| Symmetric-power slope contract | Trivial line, n=0,1,2: slopes 0 and upper bounds 0. Standard rank 2 at n=2: monomial squared norms 1,1/2,1 give maximal slope (log 2)/2≈0.3466≤4 log 2≈2.7726. | Quotient metric, including n=0, retained. |
| Morphism slope contract | Scalar 2 on trivial line: local logs log 2 and −log 2 sum to 0; inequality 0≤0. Zero map has log norm −∞. | Nonzero map hypothesis retained. |
| Metric-rescaling contract | Squared norm factor 4 gives tangent slope −log 2 and dual slope +log 2; factor 2 gives −(log 2)/2. | Consistent with Arakelov §1.3; unchanged. |
| Semistable tangent metric contract | Gaussian period 1 has length 1; L⁴ gives length 2, cotangent norm 1/2. | Further scalar extension keeps normalized values; unchanged. |
| Cubist-model contract | Type (1,2) on E²: χ=2, intersection 4, polarization degree 4; nth section rank 2n² versus principal n²; normalized degree increment (log 2)/4. | Nonprincipal input cannot use principal-only model; existing gap retained. |
| Hom specialization saturation contract | 2ℤ⊂ℤ has index 2, becomes equal over ℤ₃ but has cokernel ℤ/2; ℤ⊂ℤ² has torsion-free cokernel ℤ and ranks 1,2. | Both saturation and rank equality required; unchanged. |
| Cyclic maximal-subfield contract | Invariants ±1/3 have order/index 3; doubled invariants ±2/3 are nonzero; division-algebra rational dimension 9 and cyclic degree 3. | Quaternion-only input insufficient; existing gap retained. |
| Fixed cusp family contract | Rescaling a nonzero evaluation e⁻² by e⁻ᴺ changes inverse log from 2 to N+2; fixed normalization forbids this model. | Family dependence retained; unchanged. |
| §1.1 lattice/complex representations | Gaussian i gives κP=(i,−1)=P[[0,−1],[1,0]]; [−2] gives −2P on both sides; √2 sends 1 outside ℤ+iℤ. | Lattice preservation and injectivity supported; unchanged. |
| §1.1 addition, composition, scalar extension | κ(1+i)=1+i; matrices I+[[0,−1],[1,0]]; i²=−1 gives ρ(i)²=−I. Rational scalar 1/2 gives half the matrices. | Ring and rational-linear extensions consistent; unchanged. |
| §1.1 basis changes, traces, zero | Reversing Gaussian lattice basis conjugates i’s matrix to its negative; both traces remain 0. Rank zero gives empty matrices and trace 0. | Basis dependence separated from intrinsic trace; unchanged. |
| §1.2 Rosati norm | E: q(0)=0, q(±1)=q(i)=2; lengths 0,√2. E² shear N=1: q=6, identity q=4, both degrees 1. | Positivity and failure of reverse degree bound; unchanged. |
| §1.2 norm API | On E: length(1+i)=2≤2√2; length(−2)=2√2=2 length(1); length zero=0. | Triangle, homogeneity and zero laws consistent; unchanged. |
| §1.3 Rosati determinant | Gaussian basis 1,i: diag(2,2), det 4; basis 1,2i: diag(2,8), det 16=2²·4; M₂(ℤ): four orthogonal squared norms 2, det 16; empty det 1. | Index square retained; covolume attribution repaired. |
| §1.3 basis/covolume API | Replacing i by −i preserves det 4; covolume of Gaussian order in q-metric is 2, square 4. | Uses pinned full/discrete real lattice theorem; repaired. |
| §1.4 submultiplicativity | On E: q(6)=72≤q(2)q(3)=8·18=144; E² shear S: q(S²)=12≤6²=36; zero factor 0≤0. | Multiplicativity would be false; unchanged. |
| §1.5 degree polynomial and orientation | [−2] on E: det 4=degree 4; on E²: 16=16; diag(1,0): det=degree=0; shear det=degree=1; dimension 0: 1=1. | Degree 2g and oriented positive determinant correct; unchanged. |
| §1.6 degree/length | [−2] on E²: 16=(16/4)²; shear: 1≤(6/4)²=9/4; rational 1/2 on E: degree 1/4=q/2 with q=1/2. | g≥1 avoids 0/0; unchanged. |
| §1.7 trace and Gram identity | τ=i and v=w=i: rational trace 2=2 Re(i·conj(i)); Gaussian real Gram determinant 4, complex un-realified rank-one Gram determinant 0. | Realification essential; unchanged. |
| §1.8 coordinate bounds | τ=2i, κ=2i gives (a,b,c,d)=(0,4,−1,0), q=8; b grows with t, c shrinks with t, since b=−ct². Identity has a=d=1,b=c=0. | Block scaling directions retained; unchanged. |
| §2.1 minimal period subvariety | In E²: (η,η) gives diagonal, dimension 1 and normalized degree 2; (η,0) gives first factor, degree 1; 0 gives dimension 0, degree 1. | Ambient E² fails minimality; unchanged. |
| §2.2 multiplicity estimate | Degree-two line on E: two points give length 2 and 2≤2; a length-two thickening also gives 2≤2; zero section on length 3 would give false 3≤2. | Scheme length and nonzero section retained; unchanged. |
| §2.3 jet definition/API | g=2, i=0,1,2: lengths 1,2,3; g=3,i=2: 1,x,y,x²,xy,y² give 6, graded degree 2 gives 3; omitting mixed term gives 5. | Cumulative jets and truncation fixed; unchanged. |
| §2.3 auxiliary section | g=2,M=N=2: zero jet length 9, other jet length 5; union length 14, not 19. D=4 principal surface: 16 sections, kernel dimension ≥2. | Repeated zero jet absorbed; unchanged. |
| §2.3 nonprincipal sections | Type (1,2), D=4: h⁰=2·4²=32, same target length 14, kernel ≥18. | Model and degree normalization consistent; unchanged. |
| §2.3 tangent-height upper input | B=0: height 0 and d_L(B)=1; L⁴ on rank b raises height b log 2 and log intersection degree b log 4. | Correct sign and rank-zero convention; unchanged. |
| §2.3 tangent-height lower input | F=0: height 0≥−c_g H with H≥1; scalar extension degree 2 multiplies numerator and denominator by 2. | All finite extension choices remain covered; unchanged. |
| §2.4 period theorem | Principal E, nonzero period: minimal subgroup degree 1; zero period: degree 1. Degree-three elliptic line gives normalized degree 3 and map-degree 9. | Constants ≥1 and line/map degrees distinguished; unchanged. |
| §2.4 symmetrization route | L↦L⊗[−1]*L gives q↦2q and Δ(B)↦2^bΔ(B); b=1 degree 3 becomes 6, not map-degree 18. | Symmetric reduction consistent; unchanged. |
| §2.5 fixed cusp-value bound | Modulus e⁻² gives inverse log 2; scaled family e⁻ᴺ gives N+2; zero is discarded before inversion. | Nonzero evaluation and fixed family necessary; unchanged. |
| §2.5 arithmetic-coordinate input | Projective coordinates scaled by e⁻ᴺ have unchanged projective height, but inverse evaluation log increases by N. | Analytic/Fourier trivialization is part of target; unchanged. |
| §2.6 imaginary-part bound | τ=it and 100+it, t≥1: y=t in both; |u|≤M e⁻ᶜᵗ gives ct≤log M+log |u|⁻¹. | No real-part restriction introduced; unchanged. |
| §2.7 period basis estimate | B=0: zero vectors, Δ=1; (1,1),(1,−1) in ℤ² have det −2 and index 2, whereas whole-lattice basis has index 1. For 2b minima each ≥a and product ≤P, each ≤P/a^(2b−1). | General real product and integral-basis supplies repaired. |
| §2.8 integral rational spanning | End(E)=ℤ: q(1)=2; independent pair (1,1),(1,−1) spans ℚ² but has integral index 2. | Rational spanning is weaker than a basis; unchanged. |
| §2.8 quantitative principalization | δ=1: degree 1, no height change; δ=4: three order-2 subgroups, degree 2, height allowance (log 2)/2=(log 4)/4; δ=9: four order-3 subgroups, degree 3. | mw94-preprint lines 348–350 supply field bound; unchanged. |
| §2.8 principalization negative control | Full E[2] quotient has degree 4; [2] pulls principal λ to 4λ, map-degree 16 rather than 4. Splitting over isotropic subgroup has a character torsor of size 2 at δ=4. | Whole-kernel quotient excluded; unchanged. |
| §2.9 endomorphism discriminant/basis | Non-CM E: rank 1, q=2, determinant 2; Gaussian E: rank 2, q-basis 2,2, determinant 4. ℚ→ℚ(i) has degree 2 and geometric End rank rises 1→2. | Short basis uses HeightsAndUnits; Hadamard citation repaired. |
| §2.10 short off-diagonal isogeny | A=B=E: swap q=4,length 2; discriminant 16, square root 4; diagonal identity has off-diagonal degrees 0. | Degree polynomial total degree 4g; grid side 4g+1 exceeds degree; supplies repaired. |
| §2.11 polarized rational estimate | A=B: least degree N=1, log N=0; [2] has degree 4 and height difference 0≤(log 4)/2. | Minimal degree used for absorption; unchanged. |
| §3.1 regular discriminant definition | ℤ: matrix (1), det 1; ℤ[i]: diag(2,−2), det −4; ℤ[2i]: diag(2,−8), det −16; dual numbers: diag(2,0), det 0; zero ring rank 0: det 1. | Definition broader than nonvanishing theorem; unchanged. |
| §3.1 basis/index API | Index-two Gaussian suborder: −16=2²(−4); sign flip of one basis vector leaves determinant −4. | Signed discriminant and index square correct; unchanged. |
| §3.1 nondegeneracy route | In M_n(D), x_ij≠0 and y=x_ij⁻¹E_ji give regular trace n dim_ℚ D, e.g. M₂(ℚ) gives 2≠0; dual numbers give determinant 0. | Semisimplicity cannot be omitted; unchanged. |
| §3.2 class index definition | ℤ and Gaussian PID orders: index 1 in each rank; ℤ[2i] on ℤ[i]: index 2 Norm(α), least 2; rank 0: [0:0]=1. | Infimum is over finite free sublattices; no finiteness assumed; unchanged. |
| §3.2 opposite trace/API | Hamilton left and right multiplication by 1 have trace 4; by i both have trace 0; tr(i²)=−4 on both. Gaussian index remains 2 under opposite action. | Right/left transport preserves discriminant; unchanged. |
| §3.3 norm body definition | ℚ basis 1: N(x)=x, interval length 2, discriminant 1, p=2. Basis 2: N(x)=2x, coordinate unit 1/2, interval length 1, discriminant 4, p=2. | Reciprocal volume factor correct; unchanged. |
| §3.3 complex volume and boundary convention | ℚ(i): N=x²+y², sqrt absolute disc=2; open/closed unit disks have area π, p=2π≈6.283185. | Numerical example retained; non-instance bullet deleted. |
| §3.3 norm polynomial API | Gaussian N(1+i)=2 and N((1+i)²)=N(2i)=4=2²; N(−x)=N(x) in dimension 2, while ℚ has N(−1)=−1 and absolute norm 1. | Regular determinant, homogeneity and absolute norm region consistent; unchanged. |
| §3.4 division norm-body bound | ℚ: 2=2¹; ℚ(i): 2π≥4; Hamilton: |disc|=256, ball volume π²/2, p=8π²≈78.9568≥16; index-3 example requires bound 512. | All indices, including odd, retained; unchanged. |
| §3.5 class-index theorem | ℤ,e=2: 1≤1; ℤ[2i],e=1: least index 2≤√16=4; e=2 product index 4≤16; opposite algebra has same −16. | Real half-rank exponent and nonzero index retained; unchanged. |
| §3.6 isotypic trace identity | Non-CM E: 2=2; Gaussian E: 16=16; non-CM E²: 4⁴·16=4⁴·16=4096. | Same field/isotypy assumptions required; unchanged. |
| §4.1 cross-discriminant definition | Gaussian self-pairing det −4 gives c=16; abstract 2ℤ×3ℤ pairing matrix (6) gives c=36; reverse sign gives (−6)²=36. | Square rather than absolute determinant; unchanged. |
| §4.1 sublattice/reversal API | Multiplying first and second lattice indices by 2 and 3 scales c by 2²3²=36; transpose pairing keeps determinant. | Separate basis changes and reversed factors correct; unchanged. |
| §4.2 block discriminants | M₂(ℤ): −16; M₄(ℤ): 2³²=4294967296; M₂(ℤ[i]): 2¹⁶=65536. Off-diagonal block determinant sign (−1)^m. | Regular trace multipliers and parity correct; unchanged. |
| §4.3 simple cross-bound | Non-CM E self-map identity: 1≤1; Gaussian: 1≤16. For Gaussian multiplication by 1+i, regular norm 2 and exponent 2g/m=1 give degree 2. | Direction B→A and exponent correct; unchanged. |
| §4.4 stable powers | End(E)=ℤ: i_e=1, degree 1≤1^(2e); diagonal E in Eᴺ has coordinate inverse degree 1 for every N. | Ambient power absent from bound; unchanged. |
| §4.5 polarization-free discriminants | Non-CM E: disc 1 and dual cross-discriminant 1; Zarhin dimension 8 and height 8h_F, even for formal h_F=−1. | Dimension-only constants can absorb factor 8; unchanged. |
| §4.6 stable subvariety estimate | Diagonal A⊂A⁸ has projection degree 1; E×E′ with nonisogenous factors has two multiplicities 1. | Actual-product assumption retained; unchanged. |
| §4.7 small product-dual estimate | E×E′ canonical dual map has degree 1·1=1; formal heights −1 and 2 sum to 1. | Lower-height bound needed for factor control; unchanged. |
| §5.1 product-target isogeny | A*=A=E: restricted identity kernel has order 1; source/target height equal, degree 1. | Target-product height correctly used; unchanged. |
| §5.2 quantitative factorization | Simple E: one factor, exponent 1, N=1, log N=0; E²: multiplicity 2, degree 1. | Qualitative choice of minimum is not quantitative assumption; unchanged. |
| §5.3 unpolarized rational estimate | E self-isogeny least degree 1; [2] has degree 4, quasi-inverse degree 4=4^(2·1−1). In dimension g, deg([N])/N=N^(2g−1). | Quasi-inverse exponent correct; unchanged. |
| §5.4 relative isogeny | k=ℚ,K=ℚ̄: infinite extension degree but finite torsion definition allowance; |GL₂(𝔽₃)|=(9−1)(9−3)=48 and squared allowance 2304. | Bound uses base degree, not [K:k]; unchanged. |
| §5.4 relative factorization | K=k(t), A=E² non-CM: End(E)=ℤ, one simple type of multiplicity 2 and identity degree 1; k̄ definition allowance in dimension 1 is 48. | Labelled copies cannot become distinct nonisogenous types; unchanged. |
| §5.5 geometric estimate | Nonsquare quadratic twist of non-CM E: geometric isomorphism degree 1, rational Hom rank 0. | Geometric versus rational conclusion distinguished; unchanged. |
| §6.1 absolute j-height bound | D=1,j=0: RHS C and identity degree 1; D=2: 4C; D=3: 9C(log 3)² with log 3≈1.098612. | Degree-one case and absolute constant retained; unchanged. |
| §6.1 constant/height conversion | C₀=10⁷·989²=9781210000000; C=9C₀=88030890000000. D=2,h_F<0,j=0: imported 4C₀, weakened 36C₀=4C; 36(log 2)²≈17.2963. | Inequality is not equality of original bounds; unchanged. |
| §7.1 finite generated algebra definition | Scalar action on Ẑ²: rank 1 span and infinite index in rank 4 matrices; GL₂: (I+e₁₂)−I=e₁₂ and e₁₂e₂₁=e₁₁, giving all four units. Rank 1 gives Ẑ. | Finite sums and closure kept distinct; unchanged. |
| §7.1 algebra universal property | V={1}: unital scalar span ẐI; V⊂scalar C implies span⊂C. GL₂ is not contained in scalar C, since e.g. I+e₁₂ is nonscalar. | Both directions of containment criterion tested; unchanged. |
| §7.2 adelic assembly | Scalar local algebras need one generator 1; full M₂ local algebras need four module generators, e.g. I,I+e₁₂,I+e₂₁,[[0,−1],[1,1]], whose coordinate determinant is a unit. | Bound 4 for 2g=2 is compatible; non-instance Check deleted. |
| §7.2 local-order control | Mod ℓ the order is upper triangular, of size ℓ³ in ambient size ℓ⁴. ℓ=2: 16/8=2; ℓ=3: 81/27=3; ℓ=5: 625/125=5. | Local index is ℓ, not constant 2; both occurrences repaired. |
| §7.2 closure and infinite quotient control | Products of two orders have lower-left entry ℓ(ca′+dc′), identity has c=0. Two exceptional factors give quotient size 2·3=6; five give 2·3·5·7·11=2310, and arbitrarily long finite quotients grow unboundedly. | Unital subring and infinite product quotient justified; added control. |
| §7.3 centralizer kernel | Gaussian i: commutator [[b+c,d−a],[d−a,−b−c]], rank-2 kernel and saturated two-row span; mod 2 kernel dimension 2. | M_A=1 includes prime 2; unchanged. |
| §7.3 exceptional index | ψ(x)=2x: integral kernel 0, row saturation index 2; mod 2 kernel dimension 1, mod 3 dimension 0. ψ=0: index 1 and full matrix kernel. | Injection at every prime, equality outside torsion primes; unchanged. |
| §7.4 fixed-prime uniformity | Additive ℤ_ℓ subgroups ℓⁿℤ_ℓ have index ℓⁿ; at d=ℓ² there are 3. Rank-one unital algebra index 1. For odd ℓ, [ℤ_ℓ×:1+ℓℤ_ℓ]=ℓ−1. | Compact matrix finite generation route valid; unchanged. |
| §7.4 finiteness negative control | ∏_ℕℤ/ℓ has coordinate kernels of index ℓ for every coordinate, hence infinitely many; ℤ_ℓ at that index has exactly 1. | Finite generation cannot be dropped; unchanged. |
| §7.5 residual Tate refinement | Full residual GL₂ gives scalar commutant dimension 1; trivial action on 𝔽₂² gives commutant dimension 4. | Uniform threshold necessary; unchanged. |
| §7.6 large-prime integral fullness | Full residual GL₂ generates dimension-4 algebra; quotient Q/ℓQ=0 gives Q=0 by Nakayama, local index 1. A quotient ℤ/ℓ has reduction dimension 1 and fails premise. | Threshold M′ and centralizer reduction retained; unchanged. |
| §7.7 number-field uniform integral bound | Exceptional bounds 4 and 9 give total 36; all local indices 1 give total 1, including U′=U. | Every prime retained; unchanged. |
| §8.1 finitely generated Tate comparison | Constant non-CM E over ℚ(t): algebraic End and equivariant End lattices rank 1 for ℓ=2,3; transcendence degree 1, infinite algebra generation required for the field. | Field finite generation, not algebra finite generation; unchanged. |
| §8.1 rational-to-integral step | 2ℤ₂⊂ℤ₂ becomes equality rationally but has index 2 and torsion cokernel; a saturated finite-rank equal-dimensional inclusion has index 1. | Saturation plus rational algebraicity needed; unchanged. |
| §8.2 selected End specialization | Legendre at λ=−1: j=1728, geometric End rank 2 versus generic rank 1. Constant E: rank 1 on both sides; 2ℤ⊂ℤ and ℤ⊂ℤ² give indices 2 and infinite rank discrepancy respectively. | Arbitrary fibre, one-prime equality alone, and saturation alone all fail; unchanged. |
| §8.3 supported connected image | Diagonal C₂ at two primes: projection orders 2,2, supported orders 1,1, W order 1; product GL_n has W=U; supported {±I} gives W={I}; trivial group gives W=1. | Supported subgroups differ from projections; unchanged. |
| §8.3 nonabelian/product API | S₃ embedded by its faithful permutation matrices at two primes has diagonal order 6 but supported factors order 1; product full matrix groups contain each supported factor and finite products. | Definition also works for nonabelian groups; compactness supplies limits, unchanged. |
| §8.4 supported uniform bound | V⊂W, [W:W′]=2: intersection index is 1 if V⊂W′ and 2 if V surjects onto cosets; V=1 gives 1≤2. | Correct inequality and algebra inclusion; unchanged. |
| §8.5 full finitely generated bound | In ℤ, W=2ℤ,U′=3ℤ: intersection 6ℤ and [W:6ℤ]=3=[ℤ:3ℤ]; larger generated lattice changes ambient index 6→3. | Intersection and index direction correct; unchanged. |

The matrix discriminants and local order reductions at 2, 3 and 5 were also recomputed with exact rational/integer arithmetic. No numerical Check or changed statement contradicted the target it tests. The scalar/matrix generator comparison above tests generation as a module; it does not demand that the four matrix units themselves are invertible group elements.

## Check outcomes

- Targeted prerequisite build: `lake build TauCeti.AlgebraicGeometry.EllipticCurve.Isogeny.Degree`, from the pinned content project: exit 0, “Build completed successfully (2627 jobs).” This repairs the missing imported object file reported by the worker; no package source or pin was changed.
- Acceptance elaboration after adding `module`: the prescribed `lake env lean` invocation on `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean`, from the pinned content project: exit 0. Exactly two expected “declaration uses sorry” warnings, at lines 47 and 68; no import warning or errors.
- Scratch elaboration with `#check @name` for all three declarations: exit 0; the same two expected warnings and all three printed types. The complete binder comparison is recorded above; no disappearing hypothesis and no signature change.
- Citation resolver: exit 0, no cross-roadmap citation or own Lean name found nowhere. Its notice that it did not inspect pinned packages was supplemented by direct pinned-source inspection, including the corrected Degree and Basic locations.
- Final static checks: six qualified finding sections; all nine active supplier-gap slugs present in the plan; both TOML files parse; no stale supplier sections, impossible index-2 clause, machine paths or whitespace errors. `git diff --check` exits 0. Only the README, the `Suggested.lean` module header and this required report are changed.
- Required dependency command with `--movable` and the supplied moved order: exit 0. Complete output:

    depcheck: 186 roadmaps, 1219 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. No merge-order change is requested.

The repeated gate warning about importing Mathlib without the module system is resolved by the leading `module` command. No mathematical statement, hypothesis or proof body changed. Acceptance elaboration and the dependency check were rerun with the outcomes above. No source access is unresolved for these findings: the cached legal texts suffice, and the existing waived entries mw93-periods/mw95-refine and uncertified igusa/fw84 remain settled. No new external source was introduced. No source extraction or machine path is included in this deliverable. A fresh independent review remains the acceptance authority; this report records repairs and verification, not self-acceptance.
