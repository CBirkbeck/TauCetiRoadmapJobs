<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1273#issuecomment-6444923176 -->
Red team round 2 pass a (codex) of 704be9a

Verdict: needs_changes

1. **F01** (P3) Remaining Checks restate the target or proof

   **Location:** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:1002`: “For W product, the number of adelic generators is bounded by (2g)² even though there are infinitely many primes.”

   **Claim:** This is a discriminating Check of §7.2.

   **Witness:** README:996 already asserts exactly this bound for every product W. The bullet specifies neither W nor computed generators, and also accepts the wrong bound (2g)²+100.

   A second instance is README:642: “Using closed norm≤1 bodies through limiting volume gives the same supremum.” It repeats the convention already stated at line 614, without evaluating a body.

   **Exact repair:** Delete the bullets at lines 642 and 1002; keep the mathematical assertions in the definition/proof paragraphs. Section 3.3 retains more than three numerical Checks. Section 7.2 is a theorem, not a new definition requiring three Checks. Correct its remaining index test as in S02.

   **Repair test:** For the scalar action on Ẑ², one generator 1 suffices; for GL₂(Ẑ), four matrix units span. The generator sentence distinguishes neither value (1 versus 4), while the existing §7.1 examples do. For the norm-body convention the open and closed unit disks both have area π, hence p(ℚ(i))=2π; that numerical example remains.

   This is the remaining instance of round-1 review a F06; that repair is partly complete.

2. **F02** (P3) Infinitely many local index-2 factors are impossible here

   **Location:** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:1004`, repeated at line 1076: “Infinitely many index-2 factors would give infinite index.”

   **Claim:** This supplies a negative-control instance for the product of local additive indices.

   **Witness:** A finite quotient of two full ℤ_ℓ-lattices has ℓ-power order. Index 2 is possible only at ℓ=2; there cannot be infinitely many such prime-indexed factors.

   **Exact repair:** Replace that sentence at both locations with: “For the abstract product of orders O_ℓ={[[a,b],[ℓc,d]] : a,b,c,d∈ℤ_ℓ}⊂M₂(ℤ_ℓ), every local additive index is ℓ. The product quotient is ∏_ℓ 𝔽_ℓ and is infinite; this is a control for the product-index calculation, not a Galois image satisfying the theorem.”

   **Repair test:** Each O_ℓ is a unital subring, with quotient detected by the lower-left entry modulo ℓ. At 2 and 3 the indices are 2 and 3 and their product is 6. Arbitrarily large finite products of distinct primes divide the cardinality of the full quotient, so that quotient is infinite.

3. **F03** (P1) Geometry-of-numbers supplier sections have moved

   **Location:** `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:88`: “Sections 0.1–0.3 give the Gram/covolume-square identity, Hadamard … Section 1.2 gives positive successive minima … Section 1.5 gives the upper second-theorem product bound.” The same section citations occur in Layer 2 Needs and Dependencies.

   **Claim:** Those current sections of GeometryOfNumbersAndQuadraticArithmetic supply the general real-lattice statements needed here.

   **Witness:** `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:27–28` transfers general minima to SuccessiveMinima. Its headings omit §§0.1,1.5; §1.2 concerns squared integral minima. `TauCetiRoadmap/SuccessiveMinima/README.md` §§0.1,1.5,1.11,3.3 contain the replacement targets.

   **Exact repair:** Replace the supplier sentence with: “Consume SuccessiveMinima §0.1 for Gram–Hadamard, Layer 1 (in particular §§1.5 and 1.11) for simultaneous attainment and integral minimum flags, and §3.3 for the coordinate upper product bound; transport the latter along a lattice basis and the corresponding Haar-volume determinant to obtain the general upper product bound. GeometryOfNumbersAndQuadraticArithmetic §§0.2–0.3 supply adapted integral bases and projection covolumes. The full short-basis bound remains HeightsAndUnits §2.1.” Replace the obsolete §0.1/§1.2/§1.5 supply in the Scope, Needs and Dependencies consistently. Cite SuccessiveMinima on main; do not claim its newer library imports exist at this package's older pin.

   **Repair test:** For L=2ℤ×3ℤ and K=[−2,2]×[−1,1], the real minima are 1,3, volume 8 and covolume 6: 1·3·8=24=2²·6. After basis transport K becomes [−1,1]×[−1/3,1/3], and §3.3 gives 1·3·(4/3)=4. The squared-norm integral-lattice API alone is not this statement.

## Verification of the earlier findings

All references in this section are to `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md` unless otherwise specified. The two previous reports use overlapping F-identifiers, so the pass letter is retained.

| Earlier finding | Status and repaired passage | Witness at this head |
|---|---|---|
| a F01, missing degree-one elliptic headline | Repaired. §6.1: “for every number field k of degree D=[k:ℚ]≥1”; `Suggested.lean:74–77` uses `max 1 (Real.log …)` with no D≥2 binder. | D=1,j=0 gives RHS C and identity degree 1; D=2 gives 4C. The supplied elaborated signature has exactly these quantifiers. |
| a F02, unowned principalization | Repaired. README:53: “A3.11 bounds no degree of that field of definition; §2.8 states that bound.” README:473 names quantitative principalization, with A3.11 and A3.6 in Needs. | A3.11 supplies the quotient, not its field bound. mw94-preprint lines 348–350 give the latter. For map-degree δ=4, quotient degree 2, three candidate order-2 subgroups, and height increase ¼log4=½log2 agree. The whole-kernel degree-4 quotient fails λ=u∨λ₁u for δ=4. |
| a F03, determinant locator | Repaired. README:255 cites “Lemma 2.3 proof, internal p4” and “§6, internal p11, lines 433–438”. | mw94-preprint line 149 gives the lattice determinant; lines 433–438 give the polynomial. Equation (6.2) is a projection identity and is no longer cited for this. |
| a F04, equality of unlike elliptic bounds | Repaired. README:942: “Replacing H by its general upper bound 3 weakens it to 36C₀”. | With D=2,j=0 and negative stable height, H=1; 4C₀≤36C₀=4C for C=9C₀. |
| a F05, Layer 2 forward references | Repaired. Current headings include “2.2 Multiplicity estimate on an abelian variety”, “2.3 Auxiliary sections and interpolation along a period”, and “2.4 Masser–Wüstholz period theorem”. | §2.4 needs §§2.2–2.3; §2.6 needs §2.5; §2.8 needs §§2.4,2.7; §2.11 needs §§2.9–2.10. These are earlier subsections. |
| a F06, non-discriminating Checks | Partly repaired. README:1118 now tests “The inclusion ℤ→ℤ², n↦(n,0), is saturated”, and line 1116 the Legendre fibre λ=−1. | Cokernel ℤ and ranks 1,2 show that saturation alone is insufficient; generic/fibre geometric End ranks 1,2 show full-image selection is needed. The residual non-instances at lines 642 and 1002 are S01. |
| b F01, Hilbertian supplier attribution | Repaired. README:124 and 128 name “number-field Hilbertianity” and attribute the finitely generated extension to NeronModelsAndSemistableAbelianVarieties §6.0. | Neron §6.0 explicitly includes transcendental permanence and Noether normalization. The current InverseGaloisAndArithmeticFundamentalGroups version also contains rational-function permanence; the stated supply is valid. |
| b F02, all-genus Fourier expansion attributed to genus one | README repaired; immutable plan metadata remains settled. README:106: “B5.1a … in every genus”; “B5.13 … applies only for g=1.” | AutomorphicBundles B5.1a is the scalar Fourier–Jacobi expansion; B5.13 is the Tate/rank-one comparison. The repair report reserves the old plan section string for the maintainer under the append-only restriction. |
| b F03, duplicate metric-rescaling law | README repaired; immutable plan wording remains settled. README:71: “only this μ̂_max consequence is requested, the degree law being §1.3's.” | ArakelovGeometryAndAbelianHeights §1.3 already owns `HermitianBundle.arakelovDegree_rescale`. Squared-norm factor 4 changes tangent slope by −log2 and dual slope by +log2. |
| b F04, finite generation wrongly imported | Repaired. README:120: “It does not state topological finite generation; §7.4 deduces it in one step”. | ArithmeticGaloisRepresentations §5.8 supplies an open uniform subgroup. Its generators plus finitely many coset representatives generate the compact group. For odd ℓ, 1+ℓℤ_ℓ has index ℓ−1 in ℤ_ℓ×. |

The append-only-plan reasons in the repair reports are valid. Historical G1–G8 and the superseded broad slope contract are not re-raised as new unowned mathematical work. The active README contracts and their matching plan slugs are audited below. No repair introduced a false mathematical headline.

## Verified sound

Read all 1,233 README lines and all 79 Lean lines, both repository rule files, the previous findings and repairs, the source manifest, and the active gap entries. The inventory is **3 Lean declarations**, **50 numbered README target sections**, the embedded principalization, jet, tangent-height, coordinate-height, relative-factorization and rational Tate subtargets, and **9 active supplier contracts**. The README has no additional bold mathematical target headings: its other bold items are Summary, Checks and reference keys. All **143 Check bullets** were inspected and their instances recomputed; S01 identifies two non-instance bullets, and S02 identifies an impossible clause (also repeated in Examples). Repeated Checks and Examples are consolidated in the tables below.

The two Lean theorems are substantive acceptance targets. Neither is a one-tactic consequence, definition restatement, or boundary example. The sole definition is needed by the class-index statement. There are no sorry'd data, arbitrary Prop fields, weakened substitute theorems, extra API lemmas, forbidden options, or nonpermitted imports. Both theorem names and the definition appear in the README. No collision of their fully qualified names was found in the pinned libraries, main roadmaps, board packages, or available sibling Lean files.

The reviewed pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No Lean command was run: the supplied three elaborated signatures were compared, binder by binder, with the file and README. There are no ambient section variables, so none disappears through elaboration.

### Lean declaration/context ledger

Names below have namespace `TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheoremsPartII`. Line numbers refer to `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean`.

| Declaration and section | Entire variable/instance context | Computed instances and both sides | Result/change |
|---|---|---|---|
| `regularOrderDiscriminant`, line 35, Layer 3 / README §3.1 | Arbitrary universe D; Ring D; unital Subring O; m:ℕ; actual ℤ-basis b:Fin m→O. No semisimplicity is required merely to define the determinant. | ℤ: matrix (1), det 1. ℤ[i]: diag(2,−2), det −4. ℤ[2i]: diag(2,−8), det −16. Dual numbers: diag(2,0), det 0. Zero ring, m=0: empty det 1. | Body is meaningful at this wider definitional generality; the README's nonvanishing theorem separately assumes semisimplicity. No change. |
| `class_index_bound`, line 45, Layer 3 / §3.5 | D:DivisionRing with ℚ-algebra and finite ℚ-dimension; O,b as above; spanℚ(O)=D; e:ℕ with 0<e; M:O-submodule of D^e; Module.Finite ℤ M; spanℚ(M)=D^e. Conclusion includes injectivity and index≠0. | O=ℤ,e=2,M=ℤ²: index 1≤1^(2/2)=1. O=ℤ[2i],e=1,M=ℤ[i]: minimum index 2≤√16=4; e=2, product sublattice index 4≤16. Multiplication by α gives index 2·Norm(α). Zero ring, zero M with e>0, and infinite lattice ℚ are excluded by explicit hypotheses. | Signed discriminant is absolutized before real power; exponent uses real division, not natural division. Right modules follow via opposite algebra. No binder loss or change. |
| `elliptic_isogeny_j_height_bound`, line 66, Layer 6 / §6.1 | ∃C>0 precedes all k:Type u, Field k, NumberField k, two Weierstrass curves and both IsElliptic instances. Geometric isogeny hypothesis and conclusion both use AlgebraicClosure k; degree is native function-field degree; height is absolute logarithmic height. | D=1,j=0: RHS C, identity degree 1. D=2,j=0: RHS 4C=36C₀ with C=9C₀. D=3: log3≈1.098612, RHS 9C(log3)². Quadratic twist: geometric degree 1, rational Hom 0. Singular cubic fails IsElliptic. | Constant cannot depend on k or either curve; no D=1 omission, source-height substitution is an inequality, all CM cases included. No change. |

### README statement ledger

Each row covers the numbered target's definition, displayed identities and API, with embedded subtargets separated where they introduce different mathematical data. E denotes an elliptic curve; “Gaussian” means its lattice is ℤ+iℤ. Bounds with unspecified constants are tested for forced lower limits, dependence and normalization, not assigned invented numerical constants. Zero-dimensional cases are included only where the statement admits them. Number fields exclude positive characteristic, inseparable base fields and the zero ring; the order theorem excludes nonfinite integral modules. These exclusions are hypotheses, not untested claims of generality.

| Statement / README line | Instances and computed values on each side | Result / change |
|---|---|---|
| Conventions, 19–29: composition, trace, degree, metric | On E², e₁₂e₂₁=e₁₁ while e₂₁e₁₂=e₂₂. Tr_E(1)=2, regular tr_ℚ(1)=1. E(i,1)=1, E(1,i)=−1. Multiplication by −1 has length √2, not −√2. Zero-dimensional trace 0, determinant/degree 1. | Conventions determine order, sign and realification. |
| 1.1, 137: lattice and complex representations | Gaussian i: κP=(i,−1)=P[[0,−1],[1,0]], both traces 0. Scalar −2: both sides −2P. Shear S_N has complex trace 2 and real trace 4. √2 sends period 1 outside ℤ+iℤ. Rank zero: both matrices empty. | Lattice preservation excludes arbitrary complex matrices; no defect. |
| 1.2, 175: q and length | On E, q(1)=q(i)=q(−1)=2, q(0)=0, lengths √2,√2,√2,0. On product E², q(S_N)=2N²+4, q(identity)=4, deg S_N=1. | Degree-one automorphisms need not have bounded length; no reverse inequality. |
| 1.3, 207: Rosati determinant | Non-CM E: det(2)=2. Gaussian basis (1,i): det diag(2,2)=4. Suborder (1,2i): det diag(2,8)=16=2²·4. M₂(ℤ) on E²: four squared norms 2, determinant 16. Rank zero: 1. | Index factor is squared, rational positivity retained for nonprincipal polarizations. |
| 1.4, 241: submultiplicativity | Scalars 2,3: q(6)=72≤8·18=144. S=[[1,1],[0,1]]: q(S²)=12≤6²=36. Zero map: 0≤0. | Strict inequalities refute multiplicativity; native Frobenius estimate is the input. |
| 1.5, 253: oriented degree polynomial | [−2] on E: lattice determinant 4=degree 4. On E², [−2] gives 16; diag(1,0) gives det=degree=0; shear gives 1=1. In dimension zero, empty determinant=degree=1, even for the unique zero map. | Correct degree 2g and orientation; repaired locator verified. |
| 1.6, 271: degree versus q | [−2] on E²: degree 16=(16/4)². Shear N=1: 1≤(6/4)²=9/4. Rational scalar 1/2 on E: degree 1/4=q/2 with q=1/2. | g≥1 prevents 0/0; equality on scalars and strict shear control. |
| 1.7, 287: complex/rational trace and Gram formula | τ=i,v=w=i: rational trace 2=2Re(i·conj(i)); omit conjugation: −2; omit factor 2: 1. Gaussian Gram on 1,i is diag(2,2), determinant 4; the un-realified complex Gram has determinant 0. | Corrects the cited source, including the mixed Gram formula. |
| 1.8, 303: weak Siegel coordinate bounds | τ=it: b-scale t, c-scale t⁻¹. At τ=2i, κ=2i gives a=d=0,b=4,c=−1, q=8; scales 2,1/2. Identity has a=d=1,b=c=0. Product y=diag(2,1) satisfies the same conditions despite reversed ordering. | Hypotheses retain both y comparisons and x bound; no hidden ordering. |
| 2.1, 333: minimal connected period subvariety | E² with period (η,η): diagonal dimension 1, normalized degree 2. Period (η,0): first factor dimension 1, degree 1. Zero period: zero subgroup dimension 0, degree 1. Simple E/nonzero period: E. | Minimality excludes ambient E² in the diagonal example. |
| 2.2, 363: multiplicity/zero estimate | Degree-two line on E: two distinct zeros give 2·1=2; length-two thickening also 2·1=2 although only one geometric point. Zero section on length-three scheme would force 3≤2; empty scheme gives 0≤2. | Nonzero section, scheme length, g≥1 and proper subgroup retained. |
| 2.3, 377: tangent height and W-jets | g=2, orders 0,1,2: lengths 1,2,3. g=3, order 2: length 6 from 1,x,y,x²,xy,y²; graded degree 2 has dimension 3. Reduced-point model gives 1 and omitting xy gives 5. | Jet order is cumulative, maps are truncations, source and target explicit. |
| 2.3, 387: auxiliary noninjectivity | g=2,M=N=2: T has lengths 9 at 0 and 5 at the other 2-torsion point, total 14, not 19. Principal L,D=4: source dimension 16, target 14, kernel≥2. Type (1,2): source 32, kernel≥18. | Union absorbs the repeated zero jet. Sufficient arithmetic inequalities need not hold for every dimension-count example. |
| 2.3, 397: both tangent-height inputs | B=F=0: degree 0, normalized height 0, d_L(0)=1 and log1=0. L→L⁴ on rank b: height increases b log2 and log d_L(B) increases b log4. Degree-two scalar extension: degree and denominator both multiply by 2. | Sign, rank-zero convention and finite-extension normalization match Bost Prop. 5.3. |
| 2.4, 407: period theorem | L degree 3 on E: Δ(E)=3, polarization map-degree 9. Principal L/nonzero period: Δ(E)=1; zero period: Δ(0)=1. Symmetrization: q→2q and Δ(B)→2^bΔ(B). | Constant must be ≥1 and depends on polarization degree as stated; no use of the coarse bound for the sharp exponent. |
| 2.5, 423: fixed-family cusp-value height bound | Fixed evaluation modulus e⁻² gives log max(1,1/|u|)=2. Rescaling family by e⁻ᴺ gives N+2. Zero evaluation is discarded before reciprocal. | Fixed family and normalization are essential. Primary analytic input remains conditional on the declared cusp contract. |
| 2.5, 427: coordinate-height/analytic trivialization comparison | Rescaling a projective coordinate family leaves projective height unchanged but adds N to the inverse evaluation above. | The analytic trivialization and fixed Fourier normalization prevent precisely this false model; not an arbitrary homogeneous-coordinate claim. |
| 2.6, 437: imaginary-part height bound | τ=it and τ=100+it have y=t≥1 and tr y=t. Decay |u|≤Mexp(−ct) yields ct≤log M+log|u|⁻¹ for both. | No x restriction has been smuggled into the weak-region theorem. |
| 2.7, 451: short integral period basis | B=0: no basis vectors, Δ=1. In ℤ², vectors (1,1),(1,−1) have determinant −2/index 2; a genuine integral basis has determinant ±1. | Conclusion is a basis, not just independent periods. Supplier update needed: S03. |
| 2.8, 465: short End rational spanning set | End_k(E)=ℤ: q(1)=2. Pair (1,1),(1,−1) spans ℚ² while its integral index is 2. | Rational spanning is the promised output; the later lattice-basis step is separate. S03 affects its generic lattice inputs. |
| 2.8, 473: quantitative principalization | δ=1: identity degree 1 and unchanged height. δ=4: degree 2, at most three order-2 subgroup choices, height change≤½log2. Full kernel gives [2] of degree 4 and pullback map-degree 16≠4. δ=9: degree 3 and four subgroup choices. | Original unowned step repaired; √δ, δ^g field allowance and ¼logδ height change agree. |
| 2.9, 492: End discriminant/basis bound | Non-CM E: determinant 2, basis q=2. Gaussian geometric End: determinant 4, both basis q=2. y²=x³−x has rational End rank 1 and geometric rank 2 after ℚ(i). | Rational/geometric End are not conflated; field-definition input handles the latter. S03 for lattice supply. |
| 2.10, 506: short off-diagonal isogeny | A=B=E: swap q=4, length 2≤C√16=4C. Diagonal identity has degree 1 but both off-diagonal maps degree 0. | Nonzero degree polynomial must be tested on the off-diagonal subspace. S03 for minima product supply. |
| 2.11, 518: polarized rational isogeny | A=B: minimum degree 1 and log1=0. [2] has degree 4 but equal source/target height, 0≤½log4. | Logarithmic absorption uses a least isogeny, not an arbitrary growing-degree endomorphism. |
| 3.1, 546: regular order trace/discriminant | ℤ: 1; ℤ[i]: −4; ℤ[2i]: −16; M₂(ℤ): −16. Dual-number basis (1,ε): diag(2,0), discriminant 0. Empty ring/basis: determinant 1. | Nondegeneracy requires semisimple rational algebra; source error is corrected here. |
| 3.2, 578: class index, minimum and opposite | PID orders ℤ,ℤ[i]: i_e=1, including e=0. For O=ℤ[2i], M=ℤ[i], [M:Oα]=2Normα≥2 with equality at α=1. Opposite Gaussian order has the same determinant −16. | Finite generation and full rank make the minimum finite; supremum may initially be ∞. |
| 3.3, 612: norm polynomial and normalized volume | ℚ,b=1: N(x)=x, interval volume 2, p=2. b=2: N(x)=2x, coordinate unit 1/2, disc 4, volume 1, product 2. ℚ(i): N=x²+y², sqrt|disc|=2, disk area π, p=2π. | Change-of-basis factors cancel. Closed/open disk both have area π; replace the abstract Check as S01. |
| 3.4, 648: norm-body lower bound | ℚ: p=2=2¹. ℚ(i): 2π≥4. Hamilton ℚ-algebra: left norm=(a²+b²+c²+d²)², |disc|=256, ball volume π²/2, p=8π²≥16. Index-3 division algebra has dimension 9 and requires bound 512. | Odd-index example excludes a quaternion-only Brauer comparison; depends on the named cyclic-subfield contract. |
| 3.5, 664: class-index bound | Nonmaximal Gaussian rank 1: minimum 2≤16^(1/2)=4; rank 2 product submodule: index 4≤16. ℤ rank 2: 1≤1. | Correct exponent and explicit finite-index guard in Lean; not padding. |
| 3.6, 680: isotypic trace identity | (g,m,|disc|,Dλ)=(1,1,1,2): 2=2; Gaussian (1,2,4,4): 16=16; non-CM E² (2,4,16,16): 4096=4096. | Same field of End on both sides; not a reduced-trace formula. |
| 4.1, 716: Hom cross-discriminant | Self-Hom ℤ: pairing det 1, c=1. Gaussian: det −4,c=16. Abstract 2ℤ×3ℤ: pairing (6), c=36; negating one basis gives det −6, same c. | The determinant is squared; simple/isogenous hypotheses ensure matching ranks and nondegeneracy. |
| 4.2, 748: product End discriminants | Starting from ℤ: disc M₂ℤ=−16=(−1)·2⁴·1⁴. Repeat with m=4: disc M₄ℤ=2³². Gaussian m=2: disc M₂ℤ[i]=2¹⁶>0. | Sign and powers agree; not the reduced discriminant −1 of M₂ℤ. |
| 4.3, 762: simple cross-discriminant bound | A=B non-CM E: identity degree 1=1¹; Gaussian: degree 1≤16¹. | Direction B→A and square convention consistent. |
| 4.4, 776: stable-power bound | B=A^e over End(A)=ℤ: identity degree 1=1^(2ge). Diagonal E⊂E^N has coordinate inverse degree 1 for every N. | Ambient N does not enter the bound; e>0 retained. |
| 4.5, 790: polarization-free discriminant bounds | Non-CM E: ordinary disc 1 and dual cross-discriminant 1. Zarhin variety dimension 8g; at g=1 and h_F=−1, height −8. | Stable height is not truncated before product additivity. |
| 4.6, 802: stable subvariety bound | Diagonal A⊂A⁸ projects with degree 1. A=E×E′ nonisogenous: dimension 2, multiplicities 1,1. | Actual simple-factor product is a hypothesis, not inferred from an isogeny class. |
| 4.7, 814: small product-dual isogeny | Product of canonical elliptic dualities: degree 1·1=1. Formal summand heights −1 and 2 sum to 1. | Lower height bound is needed to control individual factor heights from the sum. |
| 5.1, 842: isogeny to product | A=A*=E: Zarhin source/target dimensions 8; restricted identity kernel order 1=degree. Projection E²→E has one-dimensional kernel. | Finite-kernel/equal-dimension step cannot use the projection countermodel. |
| 5.2, 854: quantitative factorization | Simple A: one factor, multiplicity 1, minimum degree N=1, logN=0. E²: one simple isogeny class, multiplicity 2, degree 1. | A qualitative minimum can be chosen before the quantitative bound. |
| 5.3, 866: unpolarized rational isogeny | [2] on E: degree N=4; quasi-inverse with composite [4] also degree 4=4^(2·1−1). Identity minimum 1. General degree relation N·N^(2g−1)=N^(2g). | Source-only height bound and direction survive quasi-inversion and factorization. |
| 5.4, 878: relative extension, including infinite | k=ℚ,K=ℚ̄: [K:k]=∞ but base D=1. |GL₂(𝔽₃)|=(9−1)(9−3)=48; two torsion fields give ≤48²=2304. | Bound uses base degree, not [K:k]; finite definition field obtained by intersection. |
| 5.4, 890: relative simple factorization | K=k: original factorization. K=k̄, E: one geometric factor with degree 1, torsion definition field ≤48. E² over k(t): same simple E, multiplicity 2, identity degree 1. | Transcendental and infinite algebraic extensions do not invalidate finite definition. |
| 5.5, 902: geometric dimension-only bound | Non-CM E and nontrivial quadratic twist: geometric isomorphism degree 1; rational Hom=0. | Geometric conclusion cannot be silently strengthened to rational. |
| 6.1, 928: j-height conversion and constants | C₀=10⁷·989²=9,781,210,000,000. D=1,h_F=−1: original 10⁷·985²=9,702,250,000,000≤C₀. D=2,j=0: 4C₀≤36C₀=4C. log²2≈0.480453; log3≈1.098612. | C=9C₀ works; separate D≥2 form uses C/(log2)². No equality of the two different intermediate bounds. |
| 7.1, 958: algebraic image algebra | Trivial group on Ẑ²: scalar rank 1 inside matrix rank 4, infinite additive index. GL₂: (I+e₁₂)−I=e₁₂ and e₁₂e₂₁=e₁₁ give all four units. Rank one: unital algebra=Ẑ even for trivial group. | Full image algebra does not mean full image group; algebraic span and closure are distinguished. |
| 7.2, 992: product comparison | Scalar local indices all 1: product 1. Indices 2 at 2 and 3 at 3: 6. Abstract orders in S02: local quotient 𝔽_ℓ, infinite product quotient infinite. | S01/S02 correct the two defective Checks. Finiteness for each Galois subgroup also follows from parent R28.6.7 applied to its finite definition extension. |
| 7.3, 1006: commutator kernel and reduction | Scalar End: ψ=0,M_A=1. Gaussian: ψ(f)=[[b+c,d−a],[d−a,−b−c]], saturated row lattice generated by b+c,d−a; rank(kernel)=2 and mod-2 kernel dimension 2. ψ=×2 on ℤ: integral kernel 0, mod-2 kernel dimension 1, mod-3 kernel 0. | Row lattice belongs to E₀∨; saturation controls the exceptional primes, including 2. |
| 7.4, 1022: fixed-prime uniformity | Additive ℤ₂, d=4: subgroups of indices 1,2,4, count 3=1+floor(log₂4). Odd ℓ: 1+ℓℤ_ℓ procyclic, index ℓ−1. ∏ℕC_ℓ: infinitely many coordinate kernels of index ℓ. | Compact matrix structure yields finite generation; compactness alone does not. |
| 7.5, 1036: simultaneous residual comparison | Full residual GL₂: commutant dimension 1=non-CM End rank. Trivial action on 𝔽₂²: commutant dimension 4. | Threshold is uniform in extensions of degree≤d; deleting it fails. Primary proof remains waived. |
| 7.6, 1048: large-prime integral equality | Full residual GL₂ generates dimension-4 matrix algebra. For finite ℤ_ℓ-module Q, Q/ℓQ=0 gives Q=0, quotient cardinality/index 1. | Both residual semisimplicity and exact End reduction needed; threshold is max(M_A,M′), not final M. |
| 7.7, 1060: uniform number-field index | Exceptional bounds 4,9 at primes 2,3: product 36. No exceptional deficit: index 1, bound 1. | Dependence on A,k,d retained, all primes included. |
| 8.1, 1090: integral/rational finitely-generated Tate and semisimplicity | Non-CM E over ℚ(t): both End realization modules rank 1 at 2 and 3. A full sublattice ℓℤ_ℓ⊂ℤ_ℓ becomes rational equality but index ℓ; torsion divisibility supplies saturation. | Field finite generation is the correct hypothesis. Rational algebraicity is a separately owned deep target, not deduced from specialization alone. |
| 8.2, 1104: End-preserving specialization | 2ℤ⊂ℤ becomes equality over ℤ₃ but has cokernel C₂. ℤ⊂ℤ² is saturated but has ranks 1,2. Legendre λ=−1 has j=1728 and End rank 2 against generic rank 1. Constant non-CM family retains rank 1. | Both full-image selection and saturation needed. Apply §8.1 over every finite definition extension to compare geometric, not just rational, End ranks. |
| 8.3, 1120: supported connected product | Diagonal C₂ at two primes: both projection orders 2, both supported orders 1, W=1. Product GL_n(ℤ_p): connected closures, W=U. Supported ±I: identity component {I}, W=1. Trivial U gives W=1. | Supports cannot be replaced by projections. |
| 8.4, 1154: supported index bound | V⊂W and index[W:W′]=2: index[V:V∩W′] is 1 or 2; trivial V gives 1≤2. | Specialized independent product embeds in supported image before index comparison. |
| 8.5, 1166: full finitely-generated index bound | W=2ℤ,U′=3ℤ in ℤ: intersection 6ℤ and index[W:6ℤ]=3=[ℤ:3ℤ]. Algebra lattice enlargement 6ℤ⊂3ℤ⊂ℤ reduces ambient indices 6→3. | Direction of both subgroup and additive-algebra inequalities is correct. |

### Active gap contracts and computed controls

Each of these nine slugs occurs in both the README supplier subsection and `design/plan.json`. The contracts have named suppliers and specify the additional mathematics; absence of their implementations is not a finding. The historical broad contracts and append-only metadata exceptions are accounted for in the earlier-findings table.

| Slug / named supplier | What is additionally required; computed control | Audit result |
|---|---|---|
| hom-specialization-saturation / AbelianSchemesAndArithmeticModuli A6.25 | Torsion-free geometric-specialization cokernel, compatible with all finite torsion. Index-2 inclusion 2ℤ⊂ℤ has cokernel C₂, while ℤ⊂ℤ² has torsion-free cokernel ℤ but unequal ranks. | A6.25's existing injection/relative Hom are recognized; saturation is the additional contract. Historical redundant injection wording is settled. |
| hermitian-maximal-slope-existence / ArakelovGeometryAndAbelianHeights §§1.1–1.6 | Attained maximum over saturated nonzero subbundles, scalar-extension invariance and −h(e)≤μmax. Trivial line: −h(1)=0=μmax; degree-two extension doubles both degree and denominator. | Nonzero rank and normalized field degree present. |
| hermitian-symmetric-power-slope / same | Quotient norms on Symⁿ and the stated 2log r loss. Rank 1: slope 0 for every n, including 0. Standard rank 2, n=2: monomial squared norms 1,1/2,1, μmax=(log2)/2≤4log2. | Metric convention discriminates against unit-norm monomials. |
| hermitian-morphism-slope / same | Nonzero K-linear map and adelic operator height. Scalar ×2 on the trivial line: log2+log(1/2)=0, hence 0≤0; zero map has no finite logarithmic height. | Finite places and the nonzero hypothesis are indispensable. |
| hermitian-metric-rescaling / same §1.3 | The maximum-slope consequence of the supplied degree law. Squared-norm multiplier 4 means μmax shifts by −log2; dual by +log2. | Degree law is already owned and cited; residual plan text is settled. |
| semistable-abelian-tangent-metric / same §§2.4,3.4 | Isometric pullback of the lattice after semistable extension. Gaussian tangent period length 1 becomes 2 under L⁴; cotangent norm becomes 1/2. Further degree-two field extension leaves the normalized height unchanged. | Does not substitute the pre-semistable Néron lattice. |
| cubist-model-symmetric-ample / same §5.8 | Extends a principal-line construction to arbitrary symmetric ample L with all specified metric compatibilities. Type (1,2) on E₁×E₂: χ=2,c₁²=4,map-degree=4; nth section rank 2n², slope difference from principal case ¼log2. | A coherent model/comparison contract, not an attempt to obtain a nonprincipal case by taking powers. |
| cyclic-maximal-subfield / ClassFieldTheory Layer 10 | Cyclic degree-index splitter and presentation, beyond the current cohomological Brauer sequence. Local invariants ±1/3 give order/index 3; doubling them is nonzero, and a cyclic cubic splitter is required. | All indices are included; a 2-torsion comparison would not supply this. |
| fixed-siegel-cusp-family / AutomorphicBundles B4.2,B4.9,B5.1a | Fixed rational Fourier family with no common zero and weak-region exponential decay. At g=1, τ=it and 100+it have the same y; arbitrary rescaling by e⁻ᴺ adds N to inverse-value logarithms. | Additional nonvanishing/normalization/decay supply is explicit. Old plan section string is settled pending maintainer synchronization. |

### Suppliers, ownership and pinned interfaces

**13 supplier citation families** were resolved against main or the current open-head text, with their specific consumed sections read. GeometryOfNumbersAndQuadraticArithmetic is the failed attribution in S03. Two further object-ownership comparisons (PELModuli and AbelianSchemesAndArithmeticModuliPartII) and the replacement owner SuccessiveMinima were read. Ownership searches used `roadmaps grep` over main/open heads and `rg` over board packages and the supplied sibling checkouts; new constructions were searched by their mathematical objects, not just proposed Lean names.

| Supplier | Sections and result of the comparison |
|---|---|
| AbelianSchemesAndArithmeticModuli | A3.3–A3.6, A3.9, A3.11; A4.1; A5.1–A5.4; A6.1, A6.4–A6.8, A6.10–A6.14, A6.20,A6.22,A6.25. Quotients, Rosati, degree, Hom, rational/geometric definition fields and realizations match. A3.11 supplies no quantitative field bound; ownership of the added bound here is correct. |
| ArakelovGeometryAndAbelianHeights | §§1.1–1.6,2.4,2.7,3.4–3.5,4.4,5.7–5.9,6.1–6.2,6.5. In particular §1.3 degree rescaling, §5.8 principal cubist model, §5.9 h_F≤h(j)/12+3, stable product/base-change identities and the lower bound. The missing strengthened slope and nonprincipal-model statements are declared contracts. |
| GeometryOfNumbersAndQuadraticArithmetic | Current §§0.2–0.3 exist and supply the adapted-basis/projection statements. The old §§0.1,1.2,1.5 attribution is S03. Current §1.2 concerns squared integral minima, and the Scope imports general minima from SuccessiveMinima. |
| HeightsAndUnits | Main Layer 2 §2.1: a full integral basis with b_i∈max(1,(i+1)/2)λ_iK, stronger than a flag alone. In ℤ² the adapted shear basis has second length √(N²+1), while both minima are 1. |
| IntegralLattices | Active main Layers 0–1 and Completed Layer 1: full integral carriers, forms and finite freeness. A rank-zero empty Gram determinant is 1; a lower-rank submodule is transported to its own rational span. |
| SemisimpleAlgebras | Main Layers 2–3 and 6: Wedderburn assembly, density, division representatives, maximal subfields and finite splitting. They do not assert cyclicity over number fields; the explicit contract supplies that extra conclusion. |
| ClassFieldTheory | Main Layer 10, especially README:1596–1608: global Brauer exact sequence and local invariant coordinates. This is cohomological supply, not an unrecorded all-class algebraic cyclicity theorem. |
| AutomorphicBundles | B4.2,B4.9,B5.1a,B5.13: general cusp/analytic comparison and scalar Fourier–Jacobi expansion, with B5.13 only rank one. The gap adds fixed no-common-zero family and analytic decay. |
| FaltingsFinitenessAndIsogenyTheorems | R28.4.5–R28.4.6: number-field semisimplicity/integral Tate; R28.6.7: almost-all-prime integral commutant. The finitely generated field extension and bounded-extension uniformity are additional here. |
| EllipticCurveModularityPartII | Supplied open head §6.0f, quantitative-elliptic-isogeny (README:129,712): all D≥1, CM and non-CM, geometric isogeny, stable height, 10⁷D²(max(h_F,985)+4logD)². This is the sharp-exponent supplier, not the coarse period theorem here. |
| ArithmeticGaloisRepresentations | §§5.8,6.4a,7.6: open uniform subgroups, finite Frattini detection, monodromy/identity component. Topological finite generation is correctly deduced in §7.4. |
| NeronModelsAndSemistableAbelianVarieties | §6.0: finite-extension independence, compatible torsion specialization, auxiliary-prime full image, and finitely generated Hilbertian extension. No End-preservation theorem is falsely attributed to it. |
| InverseGaloisAndArithmeticFundamentalGroups | IG.2.4 and IG.2.6: Hilbertianity/permanence and full-group finite-cover specialization including constant fields. Closed points need not be rational points. |

PELModuli M0.3's discriminant uses **reduced** trace: on M₂(ℤ) it is −1, while this roadmap's **regular** trace gives −16. This is not duplication of the class-index invariant. AbelianSchemesAndArithmeticModuliPartII's Betti-family/counting and finite-characteristic realization work does not own the quantitative number-field targets here. No new ownership move is required apart from repointing the obsolete supply in S03.

Pinned declarations were read, not inferred from a newer library. Relevant exact witnesses are:

| Pinned file and declaration | Scope and discriminating value |
|---|---|
| `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:65`, `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` | Finite-dimensional real normed space, Borel/Haar measure, countable lattice and actual fundamental domain; convex symmetry; strict volume inequality. In ℝ, interval (−1,1) has volume 2=2·covol(ℤ), and contains no nonzero integer, so strictness cannot be removed. |
| `Mathlib/NumberTheory/Height/NumberField.lean:145`, `NumberField.absLogHeight₁` | Defined for characteristic-zero fields, with junk 0 for nonalgebraic elements. NumberField makes the elliptic statement algebraic; h(0)=0 and D≥1. |
| `Mathlib/Analysis/Matrix/Normed.lean:657`, `Matrix.frobenius_norm_mul` | Frobenius norm instance; shear q(S²)=12≤36 demonstrates submultiplicativity. |
| `Mathlib/RingTheory/Discriminant.lean:67`, `Algebra.discr` | Requires a commutative ambient ring. It covers ℤ[i] but not M₂(ℤ), explaining the small noncommutative definition in Lean. |
| `Mathlib/Algebra/Module/LinearMap/Defs.lean:1018`, `LinearMap.mulLeft`; matrix/linear traces, determinants and basis matrices | Left multiplication acts on the entire finite free order. In M₂ℚ its trace is 2tr, not tr. |
| `Mathlib/Algebra/Module/Lattice.lean:67`, `Submodule.IsLattice` | Fields are finite generation and full scalar span. Discreteness is not a field of this class. The real-volume consumer separately requires discrete topology. |
| `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:244`, `isSemisimpleRing_iff_pi_matrix_divisionRing` | General finite matrix-block decomposition; no cyclic-number-field conclusion. Dual numbers are not semisimple and have regular discriminant 0. |
| `Mathlib/GroupTheory/Index.lean`, additive index API | Infinite quotient has natural index 0. The Lean class-index theorem excludes 0 explicitly; the free submodule cannot win the bound through the junk value. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`, `AbelianVariety` | Bundles proper geometrically integral group scheme. Smoothness/commutativity are derived; it does not bundle a polarization, Faltings height or integral Tate realization. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/End/Basic.lean:83`, `AbelianVariety.End`; `Isogeny.lean:61`, `IsIsogeny` | Additive reindexing of native Hom with composition; finite and surjective scheme map. Generic isogeny carrier alone does not supply the missing abelian degree/height API. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:99`, `TauCeti.Isogeny.degree` | Source function-field dimension over target pullback, finite and positive. Identity degree 1; it is not only separable kernel cardinality. |
| `TauCeti/Algebra/Module/ZLattice/Covolume.lean:42`, `ZLattice.covolume_sq_eq_det_gram` | Finite-dimensional real inner-product space, Borel structure, full discrete lattice. Empty basis gives 1²=1; basis 2 of 2ℤ gives 2²=4. |
| `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:293`, `AlgHom.centralizer_centralizer_range`, and `Subalgebra.centralizer_centralizer_of_isSemisimpleModule` | Recovers the image, with finite module and semisimplicity hypotheses. Scalars on a 2-space centralize to M₂; their double centralizer is scalars again. |
| `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Ring.lean:69`; `Component.lean:70,121,136`; `Decomposition.lean:162,182,187,320` | Ring on Additive zHat; continuous surjective components; continuous product equivalence and inverse; finite sums of prime idempotents tend to 1. At each fixed prime the sum is eventually 1, and elsewhere 0 before that prime enters. |
| `TauCeti/Topology/Algebra/Group/OpenSubgroup/TopologicallyFinitelyGenerated.lean:114`, `TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq` | Compact topological group with finite topological generation. Index-zero family is empty; indices 1,2,4 in ℤ₂ give three subgroups of index≤4. |

Searches for native polarized complex abelian realizations, stable Faltings height, general abelian isogeny degree, and abelian integral Tate representations did not find the carriers required for the omitted headlines. The module docstring identifies the period/End-discriminant family, polarized and polarization-free isogeny/factorization families, and the product/residual/number-field/finitely-generated/specialization/supported-index Tate families. The two statable endpoint families—class-index bound and elliptic j-height bound—are present. A generic Tate module or a bare abelian-variety carrier is not substituted for these missing structured realizations.

### Source locator ledger

**40 locator groups** in **10 readable source records** were compared with the target statements. The grouping is explicit below; multiple adjacent lemmas are one group where the roadmap consumes their combined argument. Source text was read only from the supplied legal cache. Critical formulas lost by extraction were inspected in rendered pages, including mw95 pp. 8–10 and bost95 pp. 134–137. No source passage is reproduced here.

| Source | Locator groups verified and source-line anchors | Result / scope |
|---|---|---|
| mw95 (10 groups) | §2 discriminant/class-index definition and lemma, lines 145–169; norm body with Lemmas 2.1–2.2, lines 170–224; §3 Lemma 3.3, lines 304–334; opposite-module (3.11), lines 335–345; Lemma 4.1, line 364; Lemma 4.2, in lines 405–445; Lemmas 5.1–5.2, in lines 446–500; Lemmas 6.1–6.3, lines 507–568; Lemmas 7.1–7.2, lines 593–647; Theorems I–II and final relative-field argument, lines 45–74,655–671. | Class-index exponent e/2, relative K including infinite extensions, isogeny directions and source-only height dependence agree. The generic-ring nondegeneracy mistake is listed below. |
| mw94-preprint (7 groups) | Lemma 2.1, lines 90–99; Lemma 2.2, lines 138–147; Lemma 2.3, lines 148–151; §4 period input, line 228 onward; §5 principalization, lines 348–350; §5 End estimate/height change, lines 351–368; §6 determinant polynomial/corollary, lines 433–470. | Correct MPI internal numbering; no confusion with published page numbers. |
| mw93-isog-preprint (1 group) | Lemma 4.2, lines 215–245, internal pp. 5–6. | Actual period basis, not merely independent vectors; principal polarization and matrix-height input identified. |
| mz20 (7 groups) | Equations (21)–(22), lines 783–796; Gram formula, lines 882–888; Lemma 4.1, lines 817–870; Lemma 4.2, lines 893–931; Lemma 4.3, lines 937–958; Lemma 4.4, lines 961–965; Lemma 2.2, lines 397–404. | Weak region and off-diagonal statements match. Realification, absolute value and the two proof misprints are corrected by the roadmap. Cusp/height proof inputs are separately declared or settled unavailable. |
| bost95 (5 groups) | Theorem 4.1, lines 381–397; Theorem 4.2 and arbitrary-reduction qualification, lines 398–453; Proposition 4.4, lines 477–499; Proposition 5.3, lines 553–567; Lemma 5.4, lines 580–603. | Finite scheme length, symmetric ample model, normalized tangent height, jet union and all three noninjectivity inequalities agree. The general-reduction model is an explicit contract, not claimed proved by this survey's good-reduction text. |
| gr14 (3 groups) | Theorem 1.4, lines 177–195; §3.2 semistable slope convention, lines 607–666; §6.8 symmetric-power slope inequality, lines 1432–1442. | Quadratic D dependence is the imported elliptic theorem; semistable-extension and quotient-metric conventions are retained. |
| ry25 (3 groups) | Theorem 4.7 and number-field argument, lines 456–566; centralizer saturation/Nakayama argument, lines 567–598; Proposition 4.8 and supported-image specialization, lines 601–665. | Uniformity in bounded-index subgroups, algebraic finite span, supported factors and product comparisons match. Two source slips are corrected. |
| noot95 (2 groups) | Proposition 1.3, lines 130–152; Corollary 1.5 and proof, lines 164–194. | Full auxiliary-prime image and use of Tate comparison over finite extensions support geometric End preservation. |
| ts18 (1 group) | Theorem 2.3, lines 154–162, pp. 382–383. | Geometric isogeny exponent depends only on dimension; the roadmap also cites/proves the primary MW reduction. |
| deligne84 (1 group) | Theorem 2.7, lines 534–543, p. 39. | Full-Galois commutant and almost-all-prime equality; the roadmap gives its own open-subgroup finite-span product argument rather than falsely attributing it directly to this theorem. |

### Mechanical dependency and policy checks

The prescribed dependency command was run on the unchanged README with `--movable`. Its output was:

```text
moved: FaltingsFinitenessAndIsogenyTheoremsPartII moved in the merge order from #47 to #228, right after its last supplier AutomorphicBundles (ArithmeticGaloisRepresentations, InverseGaloisAndArithmeticFundamentalGroups, NeronModelsAndSemistableAbelianVarieties, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems, EllipticCurveModularityPartII also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 149 roadmaps, 1011 edges, 0 problem(s)
```

There is no UPWARD or CYCLE output. The allowed move is not a finding. The gate verifies roadmap names and ordering, not the obsolete section-level attribution found in S03. Its repair imports a roadmap already on main and requires no upward edge.

The read-only comparison `git diff --stat origin/main...HEAD` lists nine changed files, all inside this package folder. The two deliverable files contain no pull-request numbers, process narrative, forbidden `set_option`, `lemma` declaration, or computational algorithm target. Historical review/repair reports and design metadata are separate from the README and Lean acceptance file. No board file other than this requested report was edited. Source renders and work notes stayed in scratch. No source was copied into the report or package. No instruction-bearing untrusted text was acted upon.

## Not verifiable

- `mw93-periods` remains waived. The main theorem, Lemma 5.3, theta-value/height Lemmas 8.4 and 8.6, equation (7.4), and matrix-height proof were not read from that paper. Readable MW preprints, Bost and MZ confirm the applications and stated reductions, not every missing primary proof step.
- `mw95-refine` remains waived. The precise residual theorem's application was checked in ry25; the primary quantitative proof of simultaneous residual semisimplicity and End comparison over bounded extensions was not read. No renewed request was made.
- `igusa` remains uncertified. The weak-region cusp-decay proof was not directly read. Its additional precise supply is the named fixed-cusp-family contract; MZ's statement about the proof is not substituted for the proof itself.
- `fw84` remains uncertified. The function-field rational Tate theorem is explicitly a target of §8.1; its primary proof in Chapter VI §3 was not read. Noot's use of it was verified. No renewed request was made.
- Declared supplier contracts are commitments to future results, not completed implementations. Their exact hypotheses, normalization and ownership were checked; this review does not certify future proofs.
- The read-only instruction forbids new Lean elaboration. The supplied elaborated signatures were examined and no source change was made, but this reviewer did not rerun them or a build.
- Open-work ownership was searched across the tool's available main/open index and the supplied sibling checkouts. Unavailable files and unindexed work are not certified absent. No independently discovered private pull request was used as a supplier.

## Source issues

- **Error** in mw95 at §2, printed p. 8, mw95 lines 145–155: the source says every finite free integral ring has separable rational algebra and nonzero trace discriminant; it should be restricted to semisimple rational algebras, since ℤ[ε]/(ε²) has discriminant zero; affects a stated result.
- **Misprint** in mz20 at equation (22), printed p. 653, mz20 line 788: the source says the complex matrix trace equals the real lattice trace; it should be twice the real part of the complex trace; affects a stated result.
- **Error** in mz20 at the Gram determinant following Lemma 4.1, printed p. 655, mz20 lines 882–888: the source says the complex Hermitian Gram determinant equals the real Rosati discriminant; it should realify each pairing before taking the determinant, giving 4 rather than 0 for the Gaussian basis; affects a stated result.
- **Misprint** in mz20 at the scalar-length remark after Lemma 4.1, printed p. 655, mz20 line 873: the source says integer multiplication has length proportional to the signed integer; it should use its absolute value; affects a stated result.
- **Misprint** in mz20 at Lemma 4.2 proof, printed p. 656, mz20 line 921: the source says the off-diagonal construction is equation (50); it should refer to equation (27); affects the proof.
- **Misprint** in mz20 at Lemma 4.2 proof, printed p. 656, mz20 lines 926–927: the source says the Rosati length input is multiplicativity; it should say submultiplicativity, which suffices for the estimate; affects the proof.
- **Misprint** in ry25 at Theorem 4.7 proof, printed p. 263, ry25 line 590: the source says the row-lattice saturation intersects the original endomorphism lattice; it should intersect its dual, where the rows live; affects the proof.
- **Misprint** in ry25 at Theorem 4.7 proof, printed p. 263, ry25 line 591: the source says the residual step uses the final adelic bound M; it should use the previously established residual threshold M′; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "704be9acf8674cdea40b7fa81a786a2b0aa0567b", "job": "RT-FaltingsFinitenessAndIsogenyTheoremsPartII~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
