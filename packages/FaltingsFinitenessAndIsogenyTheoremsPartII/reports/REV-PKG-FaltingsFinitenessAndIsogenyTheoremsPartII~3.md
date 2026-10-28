<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1273#issuecomment-6399468339 -->
Review (codex) of b4df225

Verdict: accepted
Conditional on the announced gaps: `hom-specialization-saturation`, `hermitian-maximal-slope-existence`, `hermitian-symmetric-power-slope`, `hermitian-morphism-slope`, `hermitian-metric-rescaling`, `semistable-abelian-tangent-metric`, `cubist-model-symmetric-ample`, `cyclic-maximal-subfield`, `fixed-siegel-cusp-family`

No findings. Acceptance is conditional on the nine operative supplier contracts listed below. The four settled source-access limitations and fifteen unreadable board heads are recorded under Not verifiable. Neither the package inputs nor their source manifest were changed.

## Verified sound

### Previous findings checked first

All six findings in the preceding review are repaired. The following quotations are from the repaired package, not from sources. Line references in this table are to `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md` unless another file is named.

| Previous finding | Status and repaired passage | Witness independently checked |
|---|---|---|
| F01: general symmetric ample cubist model missing | **Repaired**, lines 75, 417: “the cubist-model contract for the symmetric ample line L”. The same new slug occurs in `packages/FaltingsFinitenessAndIsogenyTheoremsPartII/design/plan.json`. | The contract specifies the model, rigidified cubist metric, probability-Haar section metric, rank, degree identity, semistability and extension compatibility. Type (1,2) on E₁×E₂ has χ=2, intersection 4 and map-degree 4; its fourth-power section rank is 32 rather than 16. Bost's general symmetric ample setup is at bost95 line 399; the arbitrary-reduction extension is indicated at bost95 lines 450–453 and 624–628. The general model remains a declared supplier contract, not a claim that the principal-only supplier already proves it. |
| F02: bounded integral basis attributed to flag theorem | **Repaired**, lines 92, 431, 495, 511: “a ℤ-basis with b_i∈max(1,(i+1)/2)λ_i(L,K)·K”. | Opened `TauCetiRoadmap/HeightsAndUnits/README.md:250` and :270 on main. For the Euclidean ℤ² lattice, minima and chosen basis lengths are 1,1; a same-flag basis (e₁,Ne₁+e₂) has lengths 1,√(N²+1). All three affected routes now cite the owner of the quantitative basis theorem. |
| F03: duplicated sharp elliptic proof | **Repaired**, lines 11, 116, 977: “EllipticCurveModularityPartII §6.0f owns the quadratic elliptic isogeny estimate”. | Opened `TauCetiRoadmap/EllipticCurveModularityPartII/README.md:129` and :710–722 at its supplied open head. Its all-number-field CM/non-CM geometric bound gives C₀=10⁷·989²=9,781,210,000,000. The old graph and sharp-surface targets are absent; Layer 6 keeps the distinct j-height consequence. The Lean docstring agrees. |
| F04: incorrect symmetric-square slope Check | **Repaired**, line 82: “μ̂_max(Sym²)=−½ log ½=(log 2)/2≈0.3466”. | The mixed monomial's shortest tensor lift has squared norm 1/2; the other two monomials have squared norm 1. Thus the maximum slope is 0.3465735903, below 4 log 2=2.7725887222. Degree-two extension leaves the normalized slope unchanged. |
| F05: wrong profinite component file | **Repaired**, line 49: “TauCeti.zHat.component” in “ZHat/Component.lean”. | Opened `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Component.lean:70`, :121 and :136 at the pin. The ring homomorphism, continuity and surjectivity are there. Components preserve 0,1,6; reducing 6 modulo either 2 or 3 gives 0. |
| F06: all-class restriction inferred from 2-torsion supply | **Repaired**, lines 100, 657: “Only this algebraic presentation is consumed, for every index n, odd or even”. | The QuadraticFormInvariants supplier and Needs entries are gone. The cyclic-maximal-subfield contract directly supplies E/F and uⁿ=a≠0. A class with local invariants ±1/3 has order/index 3, requires a cubic maximal subfield, and has nonzero double; no 2-torsion naturality assertion is used. |

I searched the rest of the package for each repaired pattern. The bounded-basis correction reaches §§2.3, 2.7 and 2.8; the cubist contract reaches §2.2, §2.2b and Layer 2 dependencies; the height/metric scalings agree in the contracts and interpolation Checks; the imported elliptic theorem has no retained graph or sharp-surface duplicate; no separate all-class cohomological restriction supply remains. The source-file correction retains the distinct ring and product-decomposition locators.

The repair report's earlier maintainer-only housekeeping is settled, not re-raised: G1–G8, the superseded coarse hermitian-maximal-slope entry, and the redundant injectivity wording in the older specialization plan entry cannot be rewritten under the append-only design-gap rule. The live README contracts identify the mathematical supply actually consumed. This is not a fresh acceptance of an unowned prerequisite hidden in those historical entries.

### Coverage and principles

Read all 50 numbered README subsections, all 51 Needs lines, the eight layer Examples/Dependencies endings, the conventions, contracts and worked examples, both TOML files, the three Lean declarations, and all 18 plan-gap entries. For unchanged material, the previous review's computed adversarial rows were used as permitted; rows about the deleted sharp-elliptic development or superseded repairs were not reused. The table below recomputes the seeded targets, headlines and changed mathematical passages. Each retained definition has a mathematical API and at least three discriminating Checks, counting individual computed cases in the jet and convention blocks.

This is a quantitative continuation of the parent's qualitative number-field theorems. It retains arbitrary polarization in the period theorem, arbitrary reduction through a named model contract, both module sides for the order bound, arbitrary relative field extensions, and every prime in the final Tate bounds. Exceptional-prime reduction is an intermediate step, followed by separate fixed-prime control. The coefficient-grid argument is a mathematical existence proof, not an executable algorithm. No copied source passage, sorry'd data, `set_option`, route-only carrier, conclusion-as-hypothesis, admitted example or source instruction was found. The namespace, imports, declaration docstrings and layer ordering satisfy the acceptance-file form. Main's `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/Isoperimetry/README.md` were read for repository shape.

### Seeded source verification

All fifteen seeded targets were compared with the accessible source text at their locators. Four settled primary texts remain inaccessible, as specified below; secondary corroboration is distinguished from reading those primary proofs. There are fourteen manifest works, ten with readable cached text. No additional work needed fetching, and no key or existing entry was altered. I also rendered the cached PDF pages containing Bost's section-degree and interpolation formulas, the short-period bound, the class-index exponent, and Richard–Yafaev's reduction/supported-image formulas where extraction lost mathematical notation. The MPI citations use internal preprint pages, as their manifest version notes require.

| Seeded target | Source and locator read | Hypotheses and comparison |
|---|---|---|
| §2.2b Auxiliary sections and interpolation | bost95 lines 587–603, Lemma 5.4, (5.9)–(5.10), printed pp.136–137; lines 624–743, §5.3; lines 398–453, Theorem 4.2 | D,M,N≥2, primitive period in the displayed hyperplane, the jet union, all three inequalities and noninjectivity agree with the rendered formulas. The field-degree term concerns the original field; the torsion point's definition degree is bounded by N^(2g)d at line 693. The arbitrary-reduction extension is explicitly indicated, with the missing model assigned to the new contract. |
| §2.3 Short period bases | mw93-isog-preprint lines 215–245, Lemma 4.2, internal pp.5–6; mw94-preprint §4, internal p.7 | The rendered bound is q(ω_i)≤c(dh)^(2m−1)Δ², m=dim B. The package permits a dimension-only exponent and separately handles m=0. The source's conversion from independent vectors to a generating basis is at lines 227–228; HeightsAndUnits now supplies that conversion. |
| §2.4 Cusp value height | mz20 lines 943–952, Lemma 4.3 proof, pp.656–657 | Fixed common-weight rational cusp family, a nonzero coordinate, D⁻¹ log max(1,|u|⁻¹), and comparison with stable height agree. The cited MW93 Lemmas 8.4/8.6 and (7.4) are waived primary locators, not independently certified here. |
| §2.8 Short off-diagonal isogeny | mz20 lines 893–928, Lemma 4.2, pp.655–656 | Both off-diagonal blocks are isogenies; the length bound is C_g√D. The polynomial degree is 4g and the grid is 0,…,4g. Principal integrality supplies the minimum-length lower bound. |
| §3.5 Class-index bound | mw95 lines 164–166, Class Index Lemma, p.8; lines 189–234, pp.9–10; lines 335–345, (3.11), pp.13–14 | The PDF confirms exponent e/2. The package explicitly requires finite lattices, excludes the infinite-index junk value, and obtains every right rank via the opposite algebra. The source's displayed right-rank-one consequence is not mistaken for a new restriction on the theorem. |
| §3.6 Isotypic trace comparison | mw95 lines 355–362 and 480–492, (4.1), Lemma 5.2, pp.14,18 | Same-field isotypy and full regular trace give (2g)^m|disc|=m^mDλ. The rational involution has determinant ±1; integral preservation is unnecessary. |
| §4.4 Stable-power bound | mw95 lines 364–391, Lemma 4.1, pp.14–15 | Simple A, B⊂A^N isogenous to A^e, direction B→A^e, exponent 2ge and independence of N agree. Inclusion in the ambient power is used to kill the kernel by the lattice index. |
| §4.6 Stable subvariety bound | mw95 lines 528–558, Lemma 6.2, pp.19–20 | “Product” is an actual product of mutually nonisogenous simple powers. The source uses B⊂A⁸ isogenous to A and lower bounds on factor heights; the package retains all three requirements. |
| §5.3 Unpolarized rational estimate | mw95 lines 70–83, Theorem II, p.6; lines 629–639, p.22; lines 688–692, p.23 | No polarization input, source-height dependence, and polynomial field-degree dependence agree. Reversing the intermediate map uses a quasi-inverse with a fixed dimension power. |
| §5.5 Geometric estimate | ts18 lines 152–163, Theorem 2.3, pp.382–383; mw95 lines 655–671 and 688–692, p.23 | The conclusion is geometric, not rational. Constants depend only on dimension after absorbing field-degree dependence. The added max with 1 accommodates negative heights and normalization shifts. |
| §7.7 Uniform integral Tate bound | ry25 lines 456–514, Theorem 4.7 and number-field proof, pp.260–261; lines 515–597, pp.261–263 | M depends on A,k,d and works for every open subgroup of index≤d. End is geometric and rational over k. Local finite indices, the large-prime threshold and the finite product are separate steps. |
| §8.1 Finitely generated field Tate comparison | noot95 lines 164–179, Corollary 1.5 and proof, p.165; fw84 Chapter VI §3, uncertified | Noot explicitly invokes the finitely generated field integral comparison at line 172. The package owns its rational algebraicity step and then uses torsion divisibility/saturation. The inaccessible primary chapter is not represented as read. |
| §8.2 End-preserving specialization | noot95 lines 130–179, Proposition 1.3, Corollary 1.5, pp.163–165; ry25 lines 620–649, p.264 | Full image at one selected prime, compatible torsion identifications, finite definition extensions and torsion-free specialization cokernel are retained. Simultaneous equality of all local images is not claimed. |
| §8.3 Supported connected image | ry25 lines 602–607, Proposition 4.8, p.263; lines 638–647, p.264 | U_p is the intersection with the single-prime factor, not the projection. Its algebraic identity-component subgroup is used before taking the product. |
| §8.4 Uniform supported-image bound | ry25 lines 620–665, proof of Proposition 4.8, pp.264–265 | The specialized independent connected product lies inside W(U); intersecting with an index≤d subgroup preserves that upper bound. The identified End rings give the same centralizer. |

The additional changed constants agree with gr14 lines 177–190, Theorem 1.4, printed p.347, and mz20 lines 397–404, Lemma 2.2, p.644. The semistable tangent convention is explicit in gr14 lines 607–639; the symmetric-power slope inequality appears at gr14 lines 1432–1441. Bost's normalized section-degree identity was read directly on printed p.129, (4.4), beside bost95 line 423.

### Computed adversarial record

These are tests and competing models, not a claim that finite samples prove the general theorems. Symbols C and κ retain the dependencies in the statement. Characteristic-p, zero-ring and arbitrary-DVR inputs are excluded by the number-field/division-algebra hypotheses where applicable; no ℤ_p-only statement is substituted for a general coefficient claim. Unchanged API cases not repeated here retain the preceding review's numerical evidence, rather than its uncomputed summaries.

| Statement | Instances tried | Values computed on each side / competing model | Result | Change |
|---|---|---|---|---|
| Cubist model, rank and degree (line 75) | Principal product line and type (1,2), n=1,4 | χ=1 versus 2; intersection=2 versus 4; map-degree=1 versus 4; section ranks=1,16 versus 2,32; slope difference=¼log2≈0.17328680 | Nonprincipal input requires the declared extension | None |
| Cubist normalization | g=1; Deligne/Faltings metrics | Squared Hodge metric ratio=π⁻¹; height shift=½logπ≈0.57236494; section slope uses −½h_Del | Correct sign and normalization | None |
| Symmetrization in §2.2b | L→L⊗[−1]*L; dim B=b | Riemann form and squared norms ×2; Δ(B)×2^b; tangent slope shifts −½log2; for degree-one elliptic L, degree becomes 2 | General ample reduction preserves the asserted scales | None |
| Metric-rescaling contract | Trivial line, squared norm ×4 | Slope 0→−log2; dual 0→+log2; rank-b tangent height rises b log2 | Tangent/cotangent directions distinguished | None |
| Maximal-slope/vector-height contract | Trivial line, vector 1; degree-two extension | −h(1)=0=μ_max; normalized degree becomes 0/2=0 | Nonzero/rank hypotheses retained | None |
| Symmetric-power contract | Rank-one n=0,1,2; standard rank-two n=2 | Rank-one slopes and bounds all 0. Rank-two squared norms 1,1/2,1 give μ_max=0.34657359≤2.77258872; unit-monomial convention gives wrong value 0 | Repaired quotient metric discriminates | None |
| Morphism-slope contract | Multiplication by 2 on trivial line | Log operator heights log2−log2=0; inequality 0≤0; zero map would require log0 | All places and nonzero map necessary | None |
| Semistable tangent convention | Gaussian period 1; L→L⁴ | Tangent length 1→2; dual norm 1→1/2; further degree-two extension doubles degree and denominator | Matches the declared extension convention | None |
| §1 metric and trace conventions | Gaussian i; shear S on E² | q(i)=2 Re(i·(−i))=2, whereas no conjugate gives −2 and no factor 2 gives 1; q(S)=6 while deg S=1 | No sign, realification or degree substitution | None |
| §2.2 period headline | Elliptic lines of degree 1 and 3; zero period | Nonzero-period minimal varieties have Δ=1,3; zero-period Δ=1; L⁴ multiplies Δ(B) by 4^b and q by 4 | General polarization and zero case agree | None |
| §2.2b jet definition | g=2,i=0,1,2; g=3,i=2 | Lengths 1,2,3; two-variable cumulative length 6 and degree-two piece 3; omitting xy gives 5 and 2 | Full infinitesimal structure determined | None |
| §2.2b restriction | g=2,M=N=2,D=4 | T length=9+5=14, not 19; principal h⁰=16 gives kernel≥2; type (1,2) h⁰=32 gives kernel≥18 | Correct scheme union and repaired model example | None |
| §2.2b inequalities and heights | g=2,r=h=d=1,N=2; rank b, L⁴ | M≥CD; D²d_L(A)≥CM; M²≥16CD(D+M+log2); height shifts b log2 while log d_L(B) shifts b log4; zero rank gives 0 | Matches source's three scales and tangent normalization | None |
| Bounded-basis replacement | Euclidean ℤ²; (e₁,Ne₁+e₂) | λ₀=λ₁=1; supplied lengths≤1,1; competing flag-basis second length √(N²+1) | Quantitative supplier is essential | None |
| §2.3 short period basis | B=0; dim B=1,2 | Empty basis has 0 members and Δ=1; basis factors in real rank 4 are 1,1,3/2,2≤dim B=2 | Bounds a generating basis, not just independent vectors | None |
| §2.4 cusp value | |u|=e⁻²; rescale whole family by e⁻ᴺ | Reciprocal logarithm 2→N+2, with unchanged zero set | Fixed Fourier scaling excludes the wrong family | None |
| §2.5 weak Siegel region | τ=it and 100+it, δ=1,t≥1 | tr y=y₁=t in both; decay/value combination gives ct≤log M+log|u|⁻¹ | No unwarranted bound on the real part | None |
| §2.6 short End span | Non-CM E; independent vectors (1,1),(1,−1) | q(1)=2; vector determinant −2 and integral index 2 despite rational span ℚ² | Spanning is not an integral-basis claim | None |
| §2.7 End discriminant | Non-CM E, Gaussian E, non-CM E² | Dλ=2,4,16; basis loss max(1,r/2)=1 for r=1 and 2 for r=4 | Correct trace and replacement basis constants | None |
| §2.8 off-diagonal extraction | Swap and identity on E²; scalar t on swap | Swap q=4, length 2; √D=4; both off-diagonal degrees=1. Identity has off-diagonal degrees 0. P(t)=t⁴ has P(0)=0,P(1)=1 | Nonzero grid value is required | None |
| §2.9 polarized rational bound | E→E and [2] | Least degree N=1 gives logN=0; [2] degree 4 gives height difference 0≤½log4=log2 | Log absorption uses the minimum | None |
| §3.1 discriminant definition | ℤ, ℤ[i], ℤ[2i], dual numbers, zero ring | Signed determinants 1,−4,−16,0,1 respectively; suborder law −16=2²(−4); empty determinant=1 | Semisimplicity only required for nondegeneracy; division theorem excludes zero ring | None |
| §3.2 class-index definition | ℤ[2i] acting on ℤ[i]; rank zero | [ℤ[i]:αℤ[2i]]=2Norm(α), minimum 2; zero module has index 1 | Least index, not an arbitrary bound, is specified | None |
| §3.3 norm-body conventions | ℚ bases 1 and 2; ℚ(i) | Products 1·2=2 and 2·1=2; N_b(1/2)=1 for b=2; Gaussian p=2π | Coordinate unit and real volume fixed | None |
| §3.4 cyclic presentation | ℚ, Hamilton algebra, order-three Brauer class | Index/field degrees 1/1,2/2,3/3; Hamilton u²=−1; p=2,8π²≈78.9568≥16; index-three m=9 gives bound 512 and 2α≠0 | Odd-index case reached directly by named contract | None |
| §3.5 Lean headline | O=ℤ,e=2; O=ℤ[2i],M=ℤ[i]^e,e=1,2 | Indices 1≤1; least rank-one index 2≤√16=4; product rank-two witness index 4≤16 | Half-rank exponent and finite index agree | None |
| §3.5 finiteness guard | M=ℤ[1/2] versus full finite lattice | Every cyclic quotient of the former has infinite cardinality and native index 0; a full finite lattice has positive index≥1 | Finite generation and index≠0 retained in elaborated type | None |
| §3.6 isotypic trace | Non-CM E, Gaussian E, non-CM E² | (2g)^m|disc| and m^mDλ are respectively 2=2,16=16,4096=4096 | Normalization agrees across layers | None |
| §3.6 excluded nonisotypic case | E_nonCM×E_CM | Central idempotent regular traces 1,2; abelian traces 2,2 | A single ratio would fail; isotypy retained | None |
| §4.4 stable-power bound | Diagonal E⊂E^N, End E=ℤ; B=E² | Projection inverse degree 1≤i₁(ℤ)²=1; identity on E² has degree 1≤i₂(ℤ)^4=1 | No ambient-power dependence | None |
| §4.5 polarization-free discriminants | Non-CM E and Zarhin product | End disc=1, dual cross-disc=1; dim Z(E)=8 and h_F(Z(E))=8h_F(E) | Both multipliers are eight; negative height allowed | None |
| §4.6 stable subvariety | Diagonal A⊂A⁸, A=E×E′ nonisogenous | dim A=2, multiplicities 1,1; inverse projection degree 1 | Actual product premise and direction retained | None |
| §5.2 quantitative factorization | Simple E; E² | Single factor multiplicities 1,2; identity degree N=1 and logN=0 | Qualitative choice does not assume quantitative conclusion | None |
| §5.3 rational isogeny | [2] on E, N=4 | Quasi-inverse [2] degree 4=N^(2g−1); composite [4] degree 16=4·4 | Correct reversal exponent | None |
| §5.4 relative isogeny/factorization | K=k,k̄,k(t); E² | GL₂(𝔽₃) size=(9−1)(9−3)=48; joint definition bound=2304; E² identity degree=1 for all three K | Infinite K does not enter field-degree constant | None |
| §5.5 geometric isogeny | Non-CM E/ℚ and nontrivial quadratic twist | Geometric isomorphism degree 1; rational Hom rank 0 | Geometric conclusion genuinely wider | None |
| Imported elliptic bound | d=1,h_F=−1; H=max(1,h_F,log d) | B=9,702,250,000,000≤C₀=9,781,210,000,000; 10⁷·989²=C₀ | Import supplies former quadratic endpoint | None |
| §6.1 Lean j-height headline | j=0,D=1,2 | D=1 logarithmic expression=0, excluded; separate bound=C. D=2: C₀·4·9=36C₀=352,123,560,000,000=4C(log2)² for C=9C₀/(log2)² | D≥2 guard and quantifier order essential | None |
| §7.1 image algebra | Scalar identity on Ẑ²; GL₂; rank zero | Scalar span rank 1 versus centralizer rank 4; elementary unipotent minus I gives e₁₂, and e₁₂e₂₁=e₁₁; zero module gives the zero ring and index 1 | Finite unital span fixed on actual action | None |
| §7.2 product headline | Local indices 2 at 2,3 at 3,1 elsewhere | Product/global index=6; infinitely many nontrivial factors give unbounded finite-product indices | Product proof includes closure before index calculation | None |
| §7.3 exceptional set | ψ(x)=2x and ψ=0 | First kernel 0, row index 2; mod2 kernel rank 1, mod3 rank 0. Zero map gives M_A=1 and full kernel | Injection every prime; equality outside saturation divisors | None |
| §7.4 fixed-prime control | ℤ₂,d=5; infinite product C₂ | First indices≤5 are 1,2,4, three subgroups; second has infinitely many coordinate kernels of index 2 | Finite generation cannot be discarded | None |
| §7.5 residual headline | Full GL₂ versus trivial image on 𝔽₂² | Commutant dimensions 1 versus 4; full matrix generated algebra dimension 4 | Exceptional threshold is substantive | None |
| §7.6 Nakayama | Finite quotient Q with Q/ℓQ=0; ℚ_ℓ/ℤ_ℓ | Finite case Q=0,index 1; divisible torsion example has same reduction 0 but Q≠0 | Finite quotient hypothesis retained | None |
| §7.7 integral Tate headline | Exceptional indices bounded by 4,9 | Total bound 4·9=36; full local algebras everywhere give 1 | Small primes retained | None |
| §8.1 rational/integral Tate | Constant non-CM E over ℚ(t),ℓ=2,3; [ℓ^n] | Both rational End dimensions=1 and integral ranks=1; degree [ℓ^n]=ℓ^(2n), quotient factor [1] degree=1; transcendence degree=1 | Field finite generation and saturation distinguished | None |
| §8.2 specialization headline/contract | 2ℤ⊂ℤ at ℓ₀=3; constant E | Tensor equality over ℤ₃ but integral cokernel order 2; torsion-free finite cokernel must have order 1; constant End rank 1→1 | One-prime equality alone is insufficient | None |
| §8.3 supported image | Diagonal C₂ at two primes; supported ±I; product GL_n | Projection orders 2,2 but supported orders 1,1 and W=1; finite ±I identity component has order 1; product GL_n gives W=U | Support and geometric identity component both necessary | None |
| §8.4 supported bound | S₃,H=C₂,V=C₃; V=1 | V∩H=1 and [V:1]=3=[S₃:H]; trivial V gives 1≤3 | Coset injection works without normality or commutativity | None |
| §8.5 full finitely generated bound | W=2ℤ,U′=3ℤ⊂ℤ | W∩U′=6ℤ; [W:6ℤ]=3=[ℤ:3ℤ]; enlarging algebras follows ambient index direction 6→3 | Intersection and index monotonicity correct | None |

### Library and ownership audit

The pins read from `lake-manifest.json` are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following native declarations were opened, including their hypotheses and actual definitions rather than relying on names alone.

| File at the pin | Declaration and relevant boundary |
|---|---|
| `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean:65` | `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`: finite real dimension, Borel/Haar measure, countable lattice, fundamental domain, symmetric convex set, strict volume inequality. For ℤ⊂ℝ, (−1,1) has volume 2 and no nonzero lattice point; (−2,2) has volume 4 and contains ±1. |
| `Mathlib/LinearAlgebra/Matrix/Trace.lean:43`; `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:63` | `Matrix.trace` is the finite diagonal sum; `Matrix.det` is alternating determinant. Empty values are 0 and 1. |
| `Mathlib/LinearAlgebra/Matrix/ToLin.lean:582`; `Mathlib/Algebra/Module/LinearMap/Defs.lean:1018` | `LinearMap.toMatrix` uses specified source and target bases; `LinearMap.mulLeft` is actual left multiplication and permits noncommutative orders. |
| `Mathlib/LinearAlgebra/Trace.lean:75`; `Mathlib/RingTheory/Trace/Defs.lean:70`; `Mathlib/RingTheory/Discriminant.lean:67` | Linear trace has a zero fallback without a finite basis; the acceptance theorem supplies a basis. `Algebra.discr` requires a commutative algebra, so it does not replace the noncommutative invariant. |
| `Mathlib/Analysis/Matrix/Normed.lean:657` | `Matrix.frobenius_norm_mul` uses the Frobenius norm instance, not an unspecified matrix norm. |
| `Mathlib/Algebra/Module/Lattice.lean:67`; `Mathlib/Algebra/Module/ZLattice/Basic.lean:433` | `Submodule.IsLattice` has finite generation and full span. `IsZLattice` has a `DiscreteTopology` parameter and full span; it does not turn arbitrary subgroups into discrete lattices. |
| `Mathlib/GroupTheory/Index.lean:55` | `AddSubgroup.index` is the additive translation of `Nat.card` of the quotient and returns 0 at infinite index. The Lean headline excludes this value. |
| `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean:244` | `isSemisimpleRing_iff_pi_matrix_divisionRing` provides the structural decomposition, not number-field cyclic maximal subfields. |
| `Mathlib/NumberTheory/Height/NumberField.lean:145` | `NumberField.absLogHeight₁` is the logarithm of the absolute multiplicative height. Every j-invariant in the statement lies in a number field. |
| `TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean:95`; `End/Basic.lean:83`; `Isogeny.lean:61` in the same directory | `AbelianVariety` bundles properness and geometric integrality of a group scheme over a field; smoothness is derived. End is additive native Hom with composition. Isogeny is finite and surjective. |
| `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean:99` | `TauCeti.Isogeny.degree` is function-field extension degree; positivity and finiteness are proved in that module. It includes inseparable degree. |
| `TauCeti/Algebra/Module/ZLattice/Covolume.lean:42` | `ZLattice.covolume_sq_eq_det_gram` assumes a full discrete lattice in a finite-dimensional real inner-product space with Borel measure. |
| `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean:260`, :293 | `Subalgebra.centralizer_centralizer_of_isSemisimpleModule` and `AlgHom.centralizer_centralizer_range` recover the represented image, with the stated finite-module/semisimplicity hypotheses. |
| `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Ring.lean:69`; `Component.lean:70`, :121, :136 in the same directory | Ring structure, prime component, continuity and surjectivity; the component has an explicit positive-prime instance. |
| `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.lean:162`, :182, :187, :320 | `ringEquivPiPadicInt`, its continuity in both directions and `tendsto_sum_idem`. For distinct primes e₂²=e₂ and e₂e₃=0; finite sums eventually have value 1 in each fixed component. |
| `TauCeti/Topology/Algebra/Group/OpenSubgroup/TopologicallyFinitelyGenerated.lean:114` | `finite_openSubgroup_index_eq`: compact topological group and finite topological generation. A finite union gives index≤d. |
| `TauCeti/Algebra/Module/Torsion/TateModule.lean:115` | Generic additive-group Tate-module construction. It does not supply the missing general abelian-variety lattice, polarized period, stable-height or geometric-End realization interfaces. Native elliptic Tate modules do not state the general abelian headlines. |

Object searches covered the pinned libraries, main, the 363-head roadmap index, local board packages/designs and the readable separately indexed board heads. Search objects included cubist models, period bases and minima, Rosati and regular traces, class indices/norm bodies, Hermitian slopes, Hom specialization, residual semisimplicity, centralizers, supported adelic images and height-dependent isogenies. `roadmaps grep` found no fully qualified declaration collision for the three acceptance-file names. `roadmaps resolve` found no unresolved cross-roadmap citation; its library scan is unavailable, so all cited native declarations were checked directly as above.

The quantitative division-order and general isogeny targets are this Part II's continuation; main's commutative discriminant and the parent's qualitative Tate statements do not supply them. The sharp elliptic theorem and its proof now have only the cited supplier owner. Local `packages/EllipticModularityEffectiveComparisons/design/README.md:2702` requests an isogeny supplier rather than owning another general proof. The downstream name ComplexMultiplicationAndExplicitReciprocityPartII is present in the merge order and in `packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/README.md:70`, :1015; its absence from `roadmaps show` is not evidence of nonexistence. AbelianSchemesAndArithmeticModuliPartII's open head develops distinct Betti-family and isogeny-class applications.

### Resolved supplier citations

Every supplier was reread at main or its supplied open head this round. The numbers below are repository line numbers; the extra header printed by `roadmaps show` is excluded. These are contract resolutions, not source-paper substitutes.

| Supplier README | Sections and lines opened | Resolution |
|---|---|---|
| `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md` | A3.3–A3.5 at 1414,1440,1453; A3.9 at 1626; A4.1 at 1765 | Quotients, torsion divisibility, duality, rational Rosati and abelian Tate realization. Integral adjoints require a principal polarization. |
| Same | A5.1–A5.4 at 2439,2486,2539,2570 | Period lattice and Betti–Tate comparison, linear-first Hermitian convention, χ=∏d_i, intersection=g!χ and polarization-map degree=χ². |
| Same | A6.1 at 2744; A6.4–A6.8 at 2801–2894; A6.10–A6.14 at 2927–3001 | Degree, simple Hom, qualitative reducibility, finite free Hom, homogeneous law, semisimple blocks, abelian trace and positivity. The package's oriented determinant comparison and quantitative estimates remain distinct. |
| Same | A6.20 at 3241; A6.22 at 3267; A6.25 at 3350 | Torsion-field definition, coefficient Hom, rigidity and normal-base extension. Coefficient Hom changes coefficients, not definition field. The specialization gap requests only the additional cokernel assertion in the live README. |
| `TauCetiRoadmap/ArakelovGeometryAndAbelianHeights/README.md` | §§1.1–1.6 at 155–317; §2.4 at 762; §2.7 at 841; §§3.4–3.5 at 1028,1061; §4.4 at 1205 | Hermitian carriers/degrees, Hodge lattices, height normalization and stable-height identities. Maximal-slope and tangent-bundle extensions are explicitly contracted. |
| Same | §§5.7–5.9 at 1549,1582–1588,1624; §§6.1–6.2,6.5 at 1659,1677,1738 | Theta/matrix-height supply, principal-only cubist model, j-height comparison, Zarhin construction and lower height bound. The arbitrary symmetric ample model is not attributed to the existing principal-only statement. |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` | §§0.1–0.3 at 238–369; §1.2 at 452–458 and its flag API; §1.5 at 701 onward | Gram/covolume, adapted flags, minima and product estimates; no bounded integral-basis claim is imported from flags. |
| `TauCetiRoadmap/HeightsAndUnits/README.md` | §2.1 at 250–274, main | Both the general gauge bound and the minima-form integral basis exist, with zero-based factor max(1,(i+1)/2). |
| `TauCetiRoadmap/IntegralLattices/README.md` | Layers 0–1 at 507,590, main | Integral lattice, dual and discriminant carriers, with finite generation/full span and form hypotheses. |
| `TauCetiRoadmap/RepresentationTheory/SemisimpleAlgebras/README.md` | Layers 2,3,6 at 212,233,293, main | Block/simple-module structure, density, division representatives, maximal subfields, splitting and index. No assertion of number-field cyclicity is silently inferred. |
| `TauCetiRoadmap/ClassFieldTheory/README.md` | Layer 10 at 1552 onward, main | Cohomological global Brauer sequence including infinite places. The algebraic cyclic maximal-subfield consequence is a declared extension, consumed directly. |
| `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheorems/README.md` | R28.4.5–R28.4.6 at 1812,1840; R28.6.7 at 2645 | Number-field semisimplicity/integral Tate and almost-all-prime commutant. Explicit saturation exceptional set, bounded-index uniformity and the finitely generated field extension remain distinct here. |
| `TauCetiRoadmap/EllipticCurveModularityPartII/README.md` | Contract at 129; §6.0f at 710–722 | All-number-field CM/non-CM geometric quadratic bound and its period-graph/sharp-surface proof. No reverse supply from this package. |
| `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md` | §5.8 at 3309; §6.4a at 3935,3955; §7.6 at 4431 | Compact matrix-group charts, normal uniform subgroup, finite Frattini quotient/detection, and geometric monodromy identity component. |
| `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md` | §6.0 at 3538–3559 | Finite-extension independence, compatible torsion specialization, full image at one prime, and the closed-point/Hilbert bridge. |
| `TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md` | IG.2.4 at 1881 and permanence paragraphs; IG.2.6 at 2115 and its Frattini specialization paragraph | Hilbertianity, connected finite-cover specialization retaining constants, closed specialized image and finite-quotient detection. The regular-cover statement is not confused with the following general connected-cover application. |
| `TauCetiRoadmap/AutomorphicBundles/README.md` | B4.2 at 3840; B4.9 at 4060; B5.13 at 5002 | Cusp sections and analytic/algebraic/Fourier interfaces. Rank-one q-expansion does not supply the general weak-region decay; that is explicitly in the fixed-family contract. |

### Gaps and supplier order

The nine operative slugs occur in both the README's supplier subsections and the plan's gap list:

- `hom-specialization-saturation` — AbelianSchemesAndArithmeticModuli A6.25;
- `hermitian-maximal-slope-existence`, `hermitian-symmetric-power-slope`, `hermitian-morphism-slope`, `hermitian-metric-rescaling` — ArakelovGeometryAndAbelianHeights §§1.1–1.6 and the stated metric convention;
- `semistable-abelian-tangent-metric` — ArakelovGeometryAndAbelianHeights §§2.4,3.4;
- `cubist-model-symmetric-ample` — ArakelovGeometryAndAbelianHeights §5.8;
- `cyclic-maximal-subfield` — ClassFieldTheory Layer 10;
- `fixed-siegel-cusp-family` — AutomorphicBundles B4.2,B5.13.

Their rank, characteristic, field, metric, nonzero-map, index and weak-region hypotheses are specified. Each asks for a mathematical extension of the named owner. The cubist model's several compatibility assertions describe one model interface required by the filtered section argument; they do not outsource the interpolation theorem. The precise live specialization request excludes already supplied injectivity. The older plan wording and superseded entries have the settled status explained above.

The required dependency check returned exit 0, with this exact output:

```text
moved: FaltingsFinitenessAndIsogenyTheoremsPartII moved in the merge order from #47 to #228, right after its last supplier AutomorphicBundles (ArithmeticGaloisRepresentations, InverseGaloisAndArithmeticFundamentalGroups, NeronModelsAndSemistableAbelianVarieties, GeometryOfNumbersAndQuadraticArithmetic, ArakelovGeometryAndAbelianHeights, FaltingsFinitenessAndIsogenyTheorems, EllipticCurveModularityPartII also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 52 roadmaps, 591 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The movable placement is expressly permitted by the brief; no order file was edited. This output, not the preceding repair report's output from its checkout, is the result for this review's supplied checkout.

### Headlines, signatures and padding

The README's headlines are: the period theorem; short integral-endomorphism spanning and discriminant bounds; polarized rational isogeny estimate; division-order class-index bound; polarization-free discriminant bounds; quantitative simple factorization, including its relative-field form; unpolarized rational, relative and geometric isogeny estimates; elliptic j-height estimate; adelic generated-algebra product comparison; uniform residual and integral number-field Tate bounds; finitely generated field Tate comparison and semisimplicity; End-preserving specialization; supported-image and full finitely generated field index bounds. The sharp elliptic stable-height theorem is now an imported endpoint, not an owned target.

`packages/FaltingsFinitenessAndIsogenyTheoremsPartII/Suggested.lean` states both statable headlines, `class_index_bound` and `elliptic_isogeny_j_height_bound`. Its only definition, `regularOrderDiscriminant`, has a real body on native rings, subrings and bases and is needed by the first theorem. The docstring identifies the other headlines and missing polarized period/height or abelian Tate/End-action interfaces. There is no weakened matrix or free-predicate replacement. The D=1 elliptic boundary treatment stays in the README; it is not padding in the acceptance file.

Elaborated the exact package file with the prescribed `lake env lean` command from the pinned content checkout: exit 0, only the expected two “declaration uses sorry” warnings, at lines 45 and 64. The imported elliptic degree module's object file was available; no build was needed. A single scratch copy with `#check @name` for all three declarations also elaborated, and its expanded types were compared against the README and the supplied signature ledger:

- The definition retains the ring, integral basis and finite index set.
- The class-index theorem retains division, the central ℚ-algebra structure, finite rational dimension, both full-span hypotheses, e>0, finite integral generation and the nonzero finite-index guard.
- The elliptic theorem retains NumberField, D≥2, both nonsingularity instances and the geometric isogeny hypothesis; the positive absolute C is quantified before the field and curves.

No binder disappeared and no change was needed. On a second scratch copy, replacing each `sorry` by the single tactic `simp` left both substantive existential goals unsolved. Reading the definitions and the pinned library search also rules out reflexivity, instance synthesis or a single existing isogeny-height/class-index theorem as a proof. Neither theorem restates a definition or computes a Check. All Lean commands completed; none was left running.

## Not verifiable

- **mw93-periods**, waived: main theorem pp.407–409, (7.4) p.436, Lemmas 8.4/8.6 pp.439–440 and the matrix-height input. Its primary proof/numbering was not available. The accessible restatements and the precise combination in mz20 were read; they do not certify the unavailable pages.
- **mw95-refine**, waived: Theorems 1–2 and Corollary 1, pp.211–224. The simultaneous bounded-extension application is explicit at ry25 lines 483–484 and 548–560; the chapter itself was not read.
- **igusa**, uncertified: Lemma 20, p.104. The weak-region decay argument was not available. The package's declared fixed-family contract retains the weak region instead of substituting a stronger fundamental-domain hypothesis.
- **fw84**, uncertified: Chapter VI §3. Noot's use of the finitely generated field Tate theorem at noot95 line 172 was checked; the primary chapter proof was not read.
- **General-reduction cubist-model proof:** bost95 lines 450–453 and 624–628 indicate the extension and refer elsewhere for precise construction. This review verifies the stated good-reduction formula and the need for the precise declared supplier extension, not a completed proof of that extension. No additional primary text is cited as read.
- **Separate board heads returning HTTP 404:** ArithmeticLocallySymmetricSpacesPartII; CompletedCohomologyAndLocalGlobalCompatibilityPartII; CrystallineCohomologyPartII; EndoscopicTransferAndUnitaryTraceComparisonPartII; HigherHidaAndColemanTheory; LawrenceVenkateshMethod; OrdinaryAutomorphicFormsAndModularityLiftingPartII; PELModuliPartII; PadicHodgeTheoryPartII; PadicLocalLanglandsForGL2QpPartII; RealSurfacePeriodIndex; SchemeAndStackFoundationsPartII; ShimuraVarietiesPartII; VStackSheavesAndLisseCategoriesPartII; VectorBundlesAndIsocrystalsPartII. Their README paths were attempted at the exact heads in the supplied board index. Ownership against those unreadable copies is not certified. AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory were readable and searched by object, with no overlapping owner found. The supplied open-roadmap index and local board packages were searched separately.

No settled citation was requested again. No missing-reference entry was needed, and no author manifest entry was removed, rewritten or duplicated.

## Source issues

- **Error** in mw95 at §2, order/lattice definition, printed p.8, mw95 lines 146–154: the source says the rational algebra of every finite-free unital order is separable; it should require semisimplicity before asserting nonzero discriminant; affects nothing.
- **Misprint** in mw95 at §2, class-index definition after (2.1), printed p.8, mw95 lines 157–161: the source says all torsion-free modules of the given rational rank have bounded free-submodule index; it should require finitely generated order lattices; affects nothing.
- **Misprint** in mz20 at (22), printed p.653, and the Gram formula, printed p.655, mz20 lines 788 and 885–888: the source says the complex matrix trace equals the rational representation trace; it should use twice the real part of the complex Hermitian trace; affects nothing.
- **Misprint** in mz20 at Lemma 4.2 proof, printed p.656, mz20 line 921: the source says formula (50) constructs the block endomorphism; it should refer to formula (27); affects nothing.
- **Misprint** in mz20 at Lemma 4.2 proof, printed p.656, mz20 lines 926–927: the source says the Rosati length law used is multiplicativity; it should say submultiplicativity; affects nothing.
- **Misprint** in ry25 at proof of Theorem 4.7, saturation index after (8), printed p.263, ry25 lines 586–590: the source says saturate the row lattice inside E₀; it should use E₀∨, the ambient dual containing those rows; affects nothing.
- **Misprint** in ry25 at proof of Theorem 4.7, threshold before Nakayama, printed p.263, ry25 line 591: the source says the threshold uses the final M(A,K,d); it should use the residual threshold M′(A,K,d) defined earlier; affects nothing.

The first two source defects are witnessed by ℤ[ε]/ε², whose regular-trace Gram determinant is 0, and ℤ[1/2], whose quotient by any nonzero cyclic subgroup is infinite. The trace defect gives 1 versus 2 already on an elliptic identity. The package uses the corrected versions of all seven source slips; they are source errata, not package findings.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b4df2253e7261a14b3cbf18ad4b2a81ca63b6c29", "job": "REV-PKG-FaltingsFinitenessAndIsogenyTheoremsPartII~3", "model": "gpt-6-astra", "worker": "chris-10"} -->
