# Roadmap: quantitative isogenies and uniform integral Tate bounds

**Summary.** Build the quantitative continuation of Faltings finiteness and isogeny theory: Rosati metrics and period estimates give polynomial endomorphism bounds; arithmetic of orders and Hom discriminants removes the polarization from isogeny estimates; a sharper elliptic argument gives the quadratic rate. These estimates feed uniform indices of integral Galois-generated Tate algebras over number fields and every finitely generated characteristic-zero field. The end results include quantitative simple factorization, dimension-only geometric isogeny bounds, and uniform bounds for supported connected adelic images.

## Scope and ownership

FaltingsFinitenessAndIsogenyTheorems reaches R28.6: qualitative finiteness, number-field Tate comparison and semisimplicity, the cyclic non-CM elliptic Hom lattice, and the integral commutant at almost all primes. This Part II owns the quantitative estimates and the finitely generated field extension in Layers 1–8. Its order invariant concerns every full order in every finite-dimensional division ℚ-algebra and both module sides. Its adelic theorem retains every prime, including the finitely many primes with nontrivial local index.

AbelianSchemesAndArithmeticModuli A3.9, A4.1, A5.1–A5.4 and A6.1–A6.14 own the dual, Rosati involution and positivity, Tate modules, complex realization, degree, homogeneous degree law, finite free Hom, simple factors and qualitative reducibility. They are stated by that roadmap and consumed here. Section 1.5 keeps the oriented lattice determinant comparison, which differs from A6.6's intrinsic polynomial law. Section 1.2 takes the norm induced by the supplied positive pairing; it does not introduce a second positivity theorem. Section 8.2 adds preservation of the integral geometric endomorphism ring to NeronModelsAndSemistableAbelianVarieties §6.0's full-image specialization.

ArakelovGeometryAndAbelianHeights §§3.4–3.5, 4.4, 5.9, 6.1–6.2, 6.5 own stable height, its identities and inequalities, elliptic j-height comparison, Zarhin's construction and the dimension-dependent lower bound. GeometryOfNumbersAndQuadraticArithmetic §§0.1–0.3, 1.2, 1.5 own general covolumes, Gram determinants, minima and integral bases. IntegralLattices Layers 0–1 own the integral lattice carriers. These generic objects are not constructed again.

The matrix trace and determinant, finite-dimensional linear trace, semisimple-algebra structure and group indices are already in the library. The generic Frobenius norm product inequality and Gram/covolume identity are library supplies. Tau Ceti's double-centralizer theorem, profinite-integer ring/product decomposition and finiteness of bounded-index open subgroups are already in the library at the pins. SemisimpleAlgebras Layers 2–3 and 6 own their structural assembly and splitting-field theory; ClassFieldTheory Layer 10 owns the cohomological Brauer sequence. QuadraticFormInvariants Layer 7B, milestones 2–3 and 5, owns the all-class crossed-product comparison with continuous H². Section 3.4 consumes their precise arithmetic bridge below. ArithmeticGaloisRepresentations §§5.8, 6.4a, 7.6 own compact matrix-group analytic structure, finite Frattini detection and algebraic monodromy. NeronModelsAndSemistableAbelianVarieties §6.0 owns Serre independence and the torsion specialization comparisons. AutomorphicBundles B4.2, B4.9 and B5.13 own the cusp-form and analytic/algebraic carriers.

AbelianSchemesAndArithmeticModuliPartII's Betti families and counting in isogeny classes are distinct downstream uses. Elliptic and surface open-image theorems, real multiplication images, and density/automorphy results are outside this roadmap.

## Conventions

Use the native field abelian variety, Hom and End, with multiplication in End given by composition: vw means v after w. Algebraic field extensions change the field of definition; coefficient scalar extensions leave it fixed. All number-field and finitely generated field statements have characteristic zero. Unless a section explicitly allows another base, k is a number field, K is finitely generated as a field over ℚ, and abelian varieties and their polarizations are over the displayed ground field. Simplicity and isotypy are relative to that field. Characteristic-zero geometric fields are algebraically closed. Complex embeddings are chosen explicitly. A prime always means a positive rational prime, including 2 and 3. All algebra and module carriers use arbitrary universes admitted by their native definitions; finite coordinate sets are `Fin m`, and module ranks and variety dimensions are natural numbers.

Write D=[k:ℚ], h_F for stable logarithmic Faltings height in the supplier's Faltings normalization, and H(A,k)=max(1,D,h_F(A)). Constants C_g, κ_g are positive real numbers chosen before the varieties and fields, and depend only on g; extra subscripts record every further dependence. Enlarge them to at least 1 when a degree-one example requires it. The height can be negative. A polarization of map-degree δ has Euler characteristic √δ; principalization has degree √δ. Zarhin's variety (A×A∨)⁴ has dimension 8g and height 8h_F(A).

The abelian trace has Tr_A(1)=2g. The regular algebra trace is tr_B(x)=Tr_ℚ(L_x) on the entire algebra B, with tr_B(1)=dim_ℚ B. Reduced trace is used only through an explicitly stated comparison. The Rosati Gram determinant D_λ is positive; the regular discriminant disc is signed; the Hom cross-discriminant is the square of a determinant. For example ℤ[i] has regular discriminant −4 and abelian Rosati Gram determinant 4, while ℤ on a non-CM elliptic curve has these values 1 and 2.

Use P=(I,τ), τ=x+iy, κ(v)P=Pρ(v), ρ=[[a,−b],[−c,d]], κ=a−τc, and ε=[[0,−I],[I,0]]. The Hermitian form is linear in its first argument. Its alternating form on the Gaussian lattice has E(i,1)=1 and E(1,i)=−1, as in the supplier. Realification gives q_λ(v)=2 Re tr(κ(v)y overline(κ(v))ᵀy⁻¹). Thus q(1)=q(i)=2 on the Gaussian elliptic curve. For n=−1 the length is √(2g), fixing the absolute value in ℓ([n])=√(2g)|n|. Each use of these conventions below has a numerical witness.

Normalized subvariety degree is c₁(L)^b[B]/b!, with value 1 on the identity variety of dimension zero. Period estimates use squared Hermitian norms. An integral lattice basis generates the entire ℤ-module. Empty matrices have determinant 1 and trace 0. Equal-dimensional isogeny degree is finite-flat rank, including inseparable degree in the supplied general theory, and is 0 for a nonisogeny; every endomorphism in dimension zero has degree 1. Inequalities dividing by 2g assume g≥1.

The coefficient ring Ẑ is `Additive TauCeti.zHat`, identified with ∏_ℓℤ_ℓ. B(V)=Ẑ[V] always means finite Ẑ-linear combinations, and its closure is denoted separately. Integral centralizers commute with geometric End when it is defined over the ground field. Supported local subgroups act trivially at all other primes; they differ from projections. The additive index is a positive integer when the quotient is finite; a native natural index equal to 0 denotes infinite index and is explicitly excluded in `class_index_bound`.

## Exact supplier contracts

### From Mathlib

Consume `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` from `Mathlib/MeasureTheory/Group/GeometryOfNumbers.lean`, line 65: in a finite-dimensional real normed space with Haar measure and a countable lattice with fundamental domain F, a symmetric convex set of volume greater than 2^dim times the measure of F contains a nonzero lattice point. The strict inequality is retained. Consume `NumberField.absLogHeight₁` from `Mathlib/NumberTheory/Height/NumberField.lean`, line 145, for the absolute logarithmic Weil height of the elliptic j-invariant; its nonalgebraic junk case never occurs over a number field.

Consume `Matrix.trace` from `Mathlib/LinearAlgebra/Matrix/Trace.lean`, `Matrix.det` from `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean`, `LinearMap.trace` from `Mathlib/LinearAlgebra/Trace.lean`, `LinearMap.mulLeft` from `Mathlib/Algebra/Module/LinearMap/Defs.lean`, and `LinearMap.toMatrix` on `Module.Basis`. Trace of left multiplication gives the regular trace also for a noncommutative algebra. `Subring`, `Submodule`, `Module.Finite`, `FiniteDimensional`, tensor products, `Convex`, `Bornology.IsBounded`, `MeasureTheory.volume`, `Real.sqrt` and `Real.rpow` supply the carriers of Layer 3. Lebesgue measure is ordinary real coordinate measure, with value one in dimension zero. `AddSubgroup.index` has the finite/infinite convention of `Mathlib/GroupTheory/Index.lean`. `Submodule.IsLattice` expresses finite integral generation and full rational span; `IsZLattice` expresses a full real lattice, with discreteness stated separately where its interface requires it. Semisimple decomposition uses `isSemisimpleRing_iff_pi_matrix_divisionRing` in `Mathlib/RingTheory/SimpleModule/WedderburnArtin.lean` with its division-ring and finite-dimensional algebra variants; The real matrix inequality, with the library Frobenius norm instance, is `Matrix.frobenius_norm_mul` in `Mathlib/Analysis/Matrix/Normed.lean`, line 657. In the commutative case use `Algebra.discr` from `Mathlib/RingTheory/Discriminant.lean`, line 67; the order discriminant below extends to noncommutative rings.

### From Tau Ceti

Consume `TauCeti.AlgebraicGeometry.AbelianVariety` (`TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean`, line 95), `TauCeti.AlgebraicGeometry.AbelianVariety.End` (`End/Basic.lean`, line 83) and `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` (`Isogeny.lean`, line 61). The carrier bundles a proper geometrically integral group scheme over a field; IsIsogeny means finite and surjective, and End is the additive reindexing of native Hom with composition multiplication.

Consume `TauCeti.Isogeny` and `TauCeti.Isogeny.degree` from `TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/Degree.lean`, line 99, for native affine Weierstrass isogenies and their positive function-field degree, including inseparable degree. The elliptic acceptance statement uses algebraic-closure base change of nonsingular Weierstrass curves.

Consume `ZLattice.covolume_sq_eq_det_gram` from `TauCeti/Algebra/Module/ZLattice/Covolume.lean`, line 42, for a full discrete lattice in a finite-dimensional real inner-product space with its canonical Borel volume. Its Gram determinant is 1 on the zero-dimensional lattice.

For the finite faithful semisimple representation step consume `Subalgebra.centralizer_centralizer_of_isSemisimpleModule` and `AlgHom.centralizer_centralizer_range` from `TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean`, in particular line 293: over a field K and finite K-module N, the image of a semisimple K-algebra in End_K(N) equals its double centralizer. The image, rather than an unfaithful source algebra, is recovered. This applies over ℚ_ℓ and ℤ/ℓ after the stated semisimplicity input.

Consume `TauCeti.zHat.ringEquivPiPadicInt`, its two continuity theorems and `TauCeti.zHat.tendsto_sum_idem` from `TauCeti/Topology/Algebra/Group/Profinite/ZHat/Decomposition.lean`, with the component ring homomorphisms in `ZHat/Ring.lean`. Prime idempotents are 1 in one component and 0 in every other component. For a compact topological group G with continuous multiplication and inverse and a finite set of topological generators, consume `TauCeti.IsTopologicallyFinitelyGenerated.finite_openSubgroup_index_eq` from `TauCeti/Topology/Algebra/Group/OpenSubgroup/TopologicallyFinitelyGenerated.lean`, line 114; the finite union over indices 1,…,d gives finiteness for index at most d. Compactness and topological finite generation remain hypotheses.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

A3.9 gives the rational Rosati anti-involution and its adjoint convention; integral preservation is used under a principal polarization. A3.3–A3.5 give finite-flat quotients, divisibility by torsion and dual isogenies. A4.1 gives the integral Tate module, its finite-level reductions and continuous Galois action. A5.1 gives V/Λ, the rank-2g lattice and Betti–Tate comparison; A5.2–A5.4 give the stated Riemann form and normalized intersection degree. A6.1 and A6.6 give degree, rational degree and its homogeneous law; A6.4–A6.8 give simple Hom spaces, reducibility, finite free Hom and semisimplicity; A6.10–A6.14 give the abelian characteristic polynomial, trace and Rosati positivity. A6.20 defines all geometric Hom over k(A[3],B[3]); A6.22 gives coefficient Hom and its units; A6.25 gives relative Hom rigidity and extension over a normal base.

What AbelianSchemesAndArithmeticModuli must provide (gap:hom-specialization-saturation): For abelian schemes over a connected normal characteristic-zero variety, the cokernel of the A6.25(1) specialization map on geometric Hom is torsion-free, compatibly with every finite étale torsion realization.

### From TauCetiRoadmap.ArakelovGeometryAndAbelianHeights

Sections 3.4–3.5 give stable height, invariance under finite base change, products and duality. Section 4.4 gives |h_F(A)−h_F(B)|≤½log deg f for an isogeny f:A→B. Section 5.9 gives h_F(E)≤h(j(E))/12+3. Sections 6.1–6.2 give Zarhin's principal polarization over k with both multipliers 8; §6.5 gives the dimension-dependent lower height bound used to separate simple-factor heights. These statements apply to the native abelian carriers and use the supplier's Faltings normalization.

Sections 5.7–5.8 give the modular-origin/theta height, its comparison with stable height and Masser’s matrix lemma; §2.7 fixes metric shifts. Section 2.4 below proves the lower bound for a nonzero fixed cusp value from these height inputs.

The following slope conventions use normalized degree and all complex embeddings, counting conjugate embeddings separately (gr14 §3.2, pp. 358–359, gr14 lines 607–639; §6.8, p. 377, gr14 lines 1432–1441; bost95 §4.3, pp. 131–132).

What ArakelovGeometryAndAbelianHeights must provide (gap:hermitian-maximal-slope-existence): For a nonzero Hermitian vector bundle Ē over O_K, μ̂_max(Ē)=max_F deĝ(F̄)/([K:ℚ] rank F), over nonzero saturated subbundles with induced metrics, is attained and invariant under finite scalar extension with pulled-back lattices and metrics; for e∈E_K nonzero, −h_Ē(e)≤μ̂_max(Ē), with h the normalized adelic vector height.

What ArakelovGeometryAndAbelianHeights must provide (gap:hermitian-symmetric-power-slope): For a Hermitian bundle Ē of rank r≥1 and every integer n≥0, with the induced quotient Hermitian norms on SymⁿĒ, μ̂_max(SymⁿĒ)≤n(μ̂_max(Ē)+2 log r).

What ArakelovGeometryAndAbelianHeights must provide (gap:hermitian-morphism-slope): For a nonzero K-linear map φ:E_K→F_K between nonzero Hermitian bundles, μ̂_min(Ē)≤μ̂_max(F̄)+h(φ), where μ̂_min(Ē)=−μ̂_max(Ē∨) and h(φ) is the normalized sum of log operator norms at all places, using the integral lattice norms at finite places.

What ArakelovGeometryAndAbelianHeights must provide (gap:hermitian-metric-rescaling): Multiplying every archimedean squared norm on a nonzero Hermitian bundle by c>0, with the finite lattices fixed, changes μ̂_max by −½ log c.

What ArakelovGeometryAndAbelianHeights must provide (gap:semistable-abelian-tangent-metric): For a polarized abelian variety (A,L)/K, use the integral tangent lattice of its Néron model and the Riemann metric after a finite semistable extension; this Hermitian tangent bundle, its dual and their symmetric powers pull back isometrically under further finite extensions, so their normalized slopes are independent of the chosen semistable extension.

**Checks.**

- The trivial Hermitian line over ℤ has μ̂_max=0 and h(1)=0. Its nth symmetric power has slope 0=n(0+2 log 1), including n=0; the zero bundle is excluded.
- Multiplication by 2 on the trivial line has archimedean operator norm 2 and 2-adic operator norm 1/2, so h(φ)=log 2−log 2=0 and the morphism inequality is 0≤0. A zero map would have no finite logarithmic height and is excluded.
- Rescale squared norms of the trivial line by 4. Its slope becomes −log 2; on the dual it becomes +log 2. Thus L↦L⁴ multiplies tangent lengths by 2 and raises the cotangent slope by log 2, as in §6.3.
- For a rank-two trivial bundle, the n=2 symmetric-power bound is 0≤4 log 2; for a degree-two scalar extension both degree and field degree double, leaving slope 0.
- On the Gaussian elliptic curve with principal Riemann metric, tangent period 1 has length 1. After L↦L⁴ its length is 2 and the cotangent norm is halved. A Néron lattice before semistable extension is not substituted for the pulled-back semistable lattice.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Sections 0.1–0.3 give the Gram/covolume-square identity, Hadamard, integral adapted bases and basis transport. Section 1.2 gives positive successive minima and a genuine integral basis bounded in terms of them; §1.5 gives the upper second-theorem product bound. Finite real dimension, full discreteness and positive interior are used where required. IntegralLattices Layers 0–1 supply the integral-form carrier. In rank zero the empty Gram determinant and product are 1. The norm-body measure in §3.3 uses the ordinary real coordinate normalization, so a complex disk has area π.

### From TauCetiRoadmap.SemisimpleAlgebras

Use the main-branch Layers 2–3 for the block/simple-module dictionary and finite-dimensional density assembly, and Layer 6 for division-algebra representatives, maximal subfields, splitting and index. The precise finite semisimple double-centralizer statement consumed here is the pinned Tau Ceti theorem above. A number-field cyclic maximal subfield has the degree of the division-algebra index, which is stronger than existence of some finite splitter.

### From TauCetiRoadmap.QuadraticFormInvariants

Layer 7B, milestones 2–3 and 5, gives the crossed-product comparison of the algebraic Brauer group with continuous H² of the absolute Galois group with separable-closure units, its group law and restriction compatibility. Use the all-class comparison, including odd torsion, rather than only its quaternion or 2-torsion specialization. The division-algebra index is the algebraic index from SemisimpleAlgebras Layer 6.

### From TauCetiRoadmap.ClassFieldTheory

Use main-branch Layer 10, the global Brauer sequence and sum of local invariants, for every number field and all finite and infinite places. Its cohomological cyclic splitting is combined with the preceding identification.

What ClassFieldTheory must provide (gap:cyclic-maximal-subfield): Every finite-dimensional central division algebra over a number field F has a cyclic maximal subfield E/F of degree equal to its index and a cyclic presentation with a nonzero twisting parameter.

### From TauCetiRoadmap.AutomorphicBundles

B4.2 gives cusp sections; B4.9 and B5.13 identify their algebraic and classical analytic realizations with the Fourier convention. The fixed scalar family below uses determinant weight and rational Fourier coefficients.

What AutomorphicBundles must provide (gap:fixed-siegel-cusp-family): For every g≥1 choose a common positive weight and a finite rational Fourier-normalized scalar Siegel cusp family with no common zero on Siegel space, together with its analytic trivialization and for each 0<δ≤1 positive constants M,c depending only on g,δ and the family such that |u(x+iy)|≤M exp(−c tr y) for every member whenever y≥δdiag(y) and every y_i≥δ.

### From TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

R28.6.6 gives the cyclic non-CM elliptic Hom lattice and its degree law. R28.6.7 gives the integral commutant at almost all primes and its separable-order centralizer reduction; §7.3 specifies a saturation exceptional set and injectivity at every prime, and §7.6 adds uniformity over subgroups of index at most d. R28.4.5–R28.4.6 give semisimplicity of V_ℓ(A) over number fields and the integral Hom Tate comparison for every prime. In §7.4 they are applied over the bounded finite extension associated to an open image subgroup. In §8.1 this is the number-field starting case of the finitely generated field extension, rather than the extension itself.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Section 5.8, Compact subgroup charts, gives the closed-subgroup theorem for compact subgroups of GL_n(E), E/ℚ_ℓ finite, a normal open uniform pro-ℓ subgroup and matrix logarithm/exponential. Such groups are topologically finitely generated. Section 6.4a gives openness of their profinite Frattini subgroup and finite-quotient full-image detection; §7.6 gives Zariski closure and geometric identity components over ℚ_ℓ. These inputs retain finite dimensionality; the infinite product of copies of ℤ/ℓ has no such finite detecting quotient.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

Section 6.0 gives finite-extension Serre independence, with adelic image a product of local groups of connected Zariski closure, and Noot's torsion specialization comparisons over a normal geometrically irreducible model. All finite torsion levels are identified compatibly. A selected auxiliary prime can have full specialized image. InverseGaloisAndArithmeticFundamentalGroups IG.2.4 and IG.2.6 supply Hilbertianity and finite full-group specialization used in that route, including the constant-field part. Section 8.2 adds integral End preservation using §8.1 and the saturation contract.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

IG.2.4 gives Hilbertianity for finitely generated characteristic-zero fields; IG.2.6 gives full-group specialization for connected finite covers, retaining their constant-field part. Use closed points of finite degree on the normal geometrically irreducible model; a rational point is not a hypothesis. The finite compact-image detection used in this route is the Frattini contract above.

## How to read the build

Layer 1 fixes the metric, traces and coordinates. Layer 2 obtains period and endomorphism estimates. Layer 3 supplies the noncommutative order bound. Layer 4 combines it with Hom discriminants to remove polarizations, and Layer 5 finishes factorization and descent of fields of definition. Layer 6 supplies the sharper elliptic rate independently of the coarse exponent. Layer 7 combines residual refinement, centralizer reduction and fixed-prime control; Layer 8 transfers the resulting integral bound through specialization. Each Needs line separates the statement's carriers from the inputs of its indicated proof route. The native-carrier headlines in Suggested.lean are `class_index_bound` and `elliptic_isogeny_j_height_bound`; the missing carriers of the other headlines are recorded in its module docstring.


## Layer 1: Rosati metrics and coordinate bounds

### 1.1 Rational and complex representations

For a polarized complex abelian variety A=V/Λ of dimension g, a ℤ-basis of Λ and a complex basis of V give injective ring representations ρ:End(A)→Mat(2g,Z) and κ:End(A)→Mat(g,C). For a period matrix P their convention is κ(v)P=Pρ(v). In normalized principally polarized coordinates with P=(I,τ), block signs are chosen so that ρ=[[a,−b],[−c,d]] and κ=a−τc. Extend both representations ℚ-linearly to End⁰(A). Changing either basis conjugates the corresponding representation. (mz20, §4 p653, equation(21), and Lemma 4.1 block notation; mz20 line 783).

*Proof route.* Apply the existing complex-lattice functor to each native homomorphism. Choose bases and write the induced lattice map and complex-linear tangent map; the exponential comparison gives κP=Pρ. Injectivity follows because Λ spans V over ℝ; conjugation follows from ordinary basis change.

*Needs:* `TauCeti.AlgebraicGeometry.AbelianVariety`; `TauCeti.AlgebraicGeometry.AbelianVariety.End`; AbelianSchemesAndArithmeticModuli §A5.1; AbelianSchemesAndArithmeticModuli §A5.2–A5.4; AbelianSchemesAndArithmeticModuli §A6.10–A6.12.

The API records the following facts.

- Construct ρ, κ and P from the stated bases and the native lattice realization.

- κ(v)P=Pρ(v), with the displayed block signs.

- Both send composition to matrix multiplication and identity to identity.

- An integral basis change in Λ conjugates ρ by its GL(2g,Z) matrix; a complex basis change conjugates κ.

- The A6 abelian trace is trρ(v)=2 Re trκ(v).

- For native endomorphisms v,w, ρ(v)=ρ(w) iff v=w, and κ(v)=κ(w) iff v=w.

- Both representations send zero to zero and v+w to the sum of the matrices.

- The ℚ-linear extensions agree with the integral representations on native End and send r·v to r times its matrix.

**Checks.**

- For [n], ρ=nI(2g) and κ=nIg.

- For E=C/(Z+iZ), multiplication by i has κ=i and ρ=[[0,−1],[1,0]].

- On E² with its product lattice, [[1,N],[0,1]] gives the same 2×2 complex matrix and its doubled real lattice representation; it is not a scalar matrix.

- For the trivial variety both matrix sizes are zero and both traces are zero.

- For [−2] on an elliptic curve, ρ=−2I₂ and κ=−2, so both sides of κP=Pρ are −2P. Multiplication by i on the Gaussian lattice has matrix [[0,−1],[1,0]] and trace 0; multiplication by √2 fails lattice preservation.

### 1.2 Rosati length

Fix a polarization λ on A. Use the existing involution v†=λ⁻¹v∨λ on End⁰(A). For v∈End⁰(A), set qλ(v)=Tr_A(vv†) and ℓλ(v)=sqrt(qλ(v)), where Tr_A(1)=2g is the A6 abelian trace. This is a norm on the finite-dimensional real scalar extension of End⁰(A). It is not the regular algebra trace and does not require † to preserve the integral order. (mw94-preprint, §2, internal pp 2–4, equation(2.1) and Lemmas2.2–2.3; mw94-preprint line 103).

*Proof route.* Use A6 positivity for the real positive quadratic form. Take its nonnegative square root; derive the norm axioms by the associated inner product. Keep λ explicit; integral adjoint preservation is asserted only for a principal polarization.

*Needs:* AbelianSchemesAndArithmeticModuli §A3.9; AbelianSchemesAndArithmeticModuli §A6.14; AbelianSchemesAndArithmeticModuli §A6.10–A6.12; `TauCeti.AlgebraicGeometry.AbelianVariety.End`.

The API records the following facts.

- ℓλ(v)²=Tr_A(vv†).

- ℓλ(v)=0 iff v=0.

- ℓλ([r])=sqrt(2g)|r| for rational r.

- ℓλ(v+w)≤ℓλ(v)+ℓλ(w), and ℓλ(rv)=|r|ℓλ(v).

- Its polarization is the A6 pairing (v,w)↦Tr_A(vw†), extended to ℝ.

**Checks.**

- For g=1, ℓ(1)=sqrt2, not 1.

- On the square CM elliptic curve with canonical polarization, ℓ(i)=sqrt2.

- On a product-polarized non-CM E², v=[[1,N],[0,1]] has q(v)=2(N²+2) and degree 1.

- ℓ(0)=0, including the dimension-zero carrier.

- For the product-polarized E² shear [[1,1],[0,1]], q=6 and degree=1; the identity has q=4. On E, q(−1)=q(i)=2 and q(0)=0.

### 1.3 Rosati discriminant

For an order O=End_k(A) or End_k̄(A), choose a ℤ-basis e₁,…,e_r of its finite free underlying group and define Dλ(O)=det(Tr_A(e_i e_j†))>0. For rank zero set the empty determinant equal to 1. It is independent of the basis. Under a principal polarization the pairing is integral, hence Dλ(O) is a positive integer. For a nonprincipal λ the same positive rational determinant is allowed; do not assume integral adjoints. For End_k use a k-defined polarization so the rational involution preserves End⁰_k; the geometric order uses a geometric polarization. (mw94-preprint, §1 and §2 Lemma 2.1, internal pp 1–3; mz20, §4 p655, Gram determinant after Lemma 4.1; mw94-preprint line 90).

*Proof route.* Use the imported finite free End lattice. A basis change with determinant±1 preserves the Gram determinant. Positivity and principal integrality follow from A6; the covolume identity is imported from GN.0.

*Needs:* §1.2; AbelianSchemesAndArithmeticModuli §A6.7; Mathlib `Matrix.det`; GeometryOfNumbersAndQuadraticArithmetic §0.1, 0.3.

The API records the following facts.

- Evaluate the determinant on any integral basis of the native End lattice.

- Every ℤ-basis gives the same Dλ(O).

- For a full sublattice O′⊂O of index I, Dλ(O′)=I²Dλ(O), using the restricted form.

- In the Euclidean metric qλ, covol(O)²=Dλ(O).

- Dλ(O)>0; if λ is principal, Dλ(O) is an integer≥1.

**Checks.**

- For End(E)=ℤ and the canonical polarization, Dλ=2.

- For End(E)=ℤ[i] with basis 1,i, Dλ=4.

- Restricting the same elliptic trace form to ℤ[2i] gives 16, four times the full-order determinant.

- For a product-polarized non-CM E², End=M₂(Z) has Dλ=16.

- The zero-rank lattice has D=1.

- On ℤ[i], the Rosati Gram matrix is diag(2,2), with determinant 4. On the index-two suborder ℤ[2i] it is diag(2,8), with determinant 16=2²·4. In rank zero the determinant is 1.

### 1.4 Rosati submultiplicativity

For v,w∈End⁰(A), qλ(vw)≤qλ(v)qλ(w), equivalently ℓλ(vw)≤ℓλ(v)ℓλ(w). (mw94-preprint, Lemma 2.2, internal p3; mw94-preprint line 138).

*Proof route.* In an orthonormal real basis qλ is the squared Frobenius norm of the real representation. Transport Mathlib `Matrix.frobenius_norm_mul` through this representation and square the resulting nonnegative inequality.

*Needs:* §1.2; §1.1; Mathlib `Matrix.trace` and `Matrix.frobenius_norm_mul`.

**Checks.**

- Check q(uv)≤q(u)q(v) for scalar endomorphisms and for a product E² shear; do not claim multiplicativity.

- On E, q([2][3])=72≤8·18=144. For the E² shear S=[[1,1],[0,1]], q(S²)=12≤6·6=36; equality is not multiplicativity.

### 1.5 Degree polynomial in coordinates

Let A,B be complex abelian varieties of the same dimension g, with positively oriented ℤ-bases of their period lattices. For f∈Hom(A,B), prove deg(f)=det ρ(f), using finite-flat degree on isogenies and zero on nonisogenies. Identify the supplied homogeneous degree law with det(∑t_iρ(f_i)) in rational Hom coordinates. For g=0 the empty determinant and constant polynomial have value 1. The comparison is compatible with a number-field complex embedding. (mz20, §4 p656, degree-4g polynomial used in Lemma 4.2; mw94-preprint, §6 internal p12, equation (6.2); mz20 line 917).

*Proof route.* For an isogeny f:V/Λ→W/Λ′, its kernel has order [Λ′:fΛ]=|det ρ(f)|. Complex-linear maps preserve real orientation, so the determinant is nonnegative with the stated oriented bases. Finite isogenies in characteristic zero are étale, so kernel order equals degree. A nonisogeny between equal-dimensional abelian varieties has rank-deficient real representation and determinant zero. The determinant of a 2g by 2g matrix of linear forms is homogeneous of degree 2g. Extend to rational Hom by clearing denominators. Degree and lattice realization commute with the chosen characteristic-zero base change.

*Needs:* AbelianSchemesAndArithmeticModuli §A5.1; AbelianSchemesAndArithmeticModuli §A6.1, A6.6; `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; Mathlib `Matrix.det`.

**Checks.**

- For [n] obtain n^(2g), including negative n.

- For Hom(E²,E²), a diagonal map (1,0) has degree zero; a shear has degree one.

- For g=0 keep degree 1; the positive-dimensional zero-map test must not be applied.

- For g=1, [−2] has determinant 4 and degree 4. The projection diag(1,0) on E² has determinant and degree 0, while a shear has both 1. In g=0 both are 1, including the zero map.

### 1.6 Rosati degree inequality

For g≥1 and v∈End(A), with degree zero on nonisogenies, deg(v)≤(qλ(v)/(2g))^g. The same inequality holds for rational endomorphisms with the A6 rational degree. (mw94-preprint, Lemma 2.3, internal p4; mw94-preprint line 148).

*Proof route.* For an isogeny the determinant of the real representation is its positive degree. Apply AM–GM to the 2g squared singular values and take a square root. The nonisogeny case has degree 0; clear denominators for rational endomorphisms.

*Needs:* §1.2; AbelianSchemesAndArithmeticModuli §A6.1, A6.6; §1.1; Mathlib `Matrix.det`; §1.5.

**Checks.**

- Check equality for [n]: degree=|n|^(2g).

- A degree-one shear has unbounded Rosati length, so no reverse inequality is asserted.

- For [−2] on E², q=16 and degree 16=(16/4)². The shear with N=1 has degree 1≤(6/4)²=9/4; taking g=0 would divide by zero and is excluded.

### 1.7 Coordinate trace formula

In normalized principally polarized coordinates write τ=x+iy in Siegel space and let ε be the standard alternating matrix in the chosen symplectic lattice basis. Then qλ(v)=tr(ρ(v)ερ(v)ᵀε⁻¹)=2 Re tr(κ(v)y overline(κ(v))ᵀy⁻¹). The bilinear Gram entry is 2 Re tr(κ(v)y overline(κ(w))ᵀy⁻¹). In orthonormal real coordinates this becomes tr(MMᵀ). (mz20, §4 p653 equation(22) and p655 Gram determinant following Lemma 4.1, corrected by realification; mz20 line 788).

*Proof route.* Express Rosati as the adjoint for the Riemann form. Compute the rational adjoint matrix and pass to the Hermitian complex matrix. Realify the complex trace; check v=w=1 and v=i on the square CM curve.

*Needs:* §1.1; §1.2; Mathlib `Matrix.trace`; AbelianSchemesAndArithmeticModuli §A5.2–A5.4.

**Checks.**

- For g=1, v=1 the answer is 2.

- For v=w=i the Gram entry is 2, not −2.

- At τ=i and v=i, ρ=[[0,−1],[1,0]] gives rational trace 2 and complex expression 2 Re(i·(−i))=2. Without conjugation the latter is −2; without realification it is 1.

### 1.8 Weak Siegel coordinate bounds

Fix g≥1 and 0<δ≤1. Suppose τ=x+iy, y₀=diag(y₁,…,y_g), δy₀≤y≤δ⁻¹y₀, y_i≥δ, and |x_ij|≤δ⁻¹. For ρ(v)=[[a,−b],[−c,d]], each |a_ij|≤C sqrt(y_i/y_j)ℓ(v), |b_ij|≤C sqrt(y_i y_j)ℓ(v), |c_ij|≤C ℓ(v)/sqrt(y_i y_j), and |d_ij|≤C sqrt(y_j/y_i)ℓ(v), where C=C(g,δ). No ordering of the y_i is needed. (mz20, Lemma 4.1, pp 653–655; mz20 line 817).

*Proof route.* Conjugate the rational adjoint form to a positive Euclidean form. Use δ-comparability and the bound on x to control each block by the Frobenius norm. Retain the reciprocal factors for c and the reversed ratio for d.

*Needs:* §1.7.

**Checks.**

- For τ=it in dimension 1, the b and c scalings are respectively t and t⁻¹.

- Do not use this statement under the weaker hypotheses of the height bound.

- For τ=it, a scalar [1] has a=d=1 and b=c=0. A CM endomorphism with τ=2i and κ=2i has (a,b,c,d)=(0,4,−1,0): the b,c scales are 2 and 1/2, and ℓ=√8. Ordering two independent factors t=2,1 has no role.

### Examples

- For the product-polarized E² shear [[1,1],[0,1]], q=6 and degree=1; the identity has q=4. On E, q(−1)=q(i)=2 and q(0)=0.

- On ℤ[i], the Rosati Gram matrix is diag(2,2), with determinant 4. On the index-two suborder ℤ[2i] it is diag(2,8), with determinant 16=2²·4. In rank zero the determinant is 1.

- At τ=i and v=i, ρ=[[0,−1],[1,0]] gives rational trace 2 and complex expression 2 Re(i·(−i))=2. Without conjugation the latter is −2; without realification it is 1.

- For τ=it, a scalar [1] has a=d=1 and b=c=0. A CM endomorphism with τ=2i and κ=2i has (a,b,c,d)=(0,4,−1,0): the b,c scales are 2 and 1/2, and ℓ=√8. Ordering two independent factors t=2,1 has no role.

### Dependencies

Native abelian Hom and End; AbelianSchemesAndArithmeticModuli A3.9, A5.1–A5.4, A6.1, A6.6–A6.14; GeometryOfNumbersAndQuadraticArithmetic §§0.1–0.3; native matrix calculus.

## Layer 2: Periods and endomorphism estimates

### 2.1 Minimal period subvariety

For a polarized complex abelian variety G defined over ℚ̄ and a period ω∈ker(exp_G), let G_ω be the smallest connected abelian subvariety B⊂G defined over ℚ̄ whose complex tangent space contains ω. Use scheme-theoretic identity components of intersections. Its normalized degree is Δ_L(B)=c₁(L)^(dimB)[B]/(dimB)!; Δ_L(0)=1. (mw94-preprint, §4, internal p6, restatement of MW period theorem; mw94-preprint line 228).

*Proof route.* Intersect the eligible abelian subvarieties and take the identity component; dimension descent gives a finite intersection with the same minimum. The tangent-space condition survives the intersection. Use the imported polarization intersection degree with the displayed factorial convention.

*Needs:* AbelianSchemesAndArithmeticModuli §A5.1; AbelianSchemesAndArithmeticModuli §A6.5; AbelianSchemesAndArithmeticModuli §A5.2–A5.4.

The API records the following facts.

- ω∈Lie(G_ω), and G_ω⊂B for every eligible B.

- G_0 is the zero abelian subvariety.

- An algebraic isomorphism carrying ω to ω′ carries G_ω to G′_ω.

- Δ_L(B) is the Euler characteristic of L|B; the nonnormalized projective degree differs by(dimB)!.

**Checks.**

- ω=0 gives the zero variety and normalized degree 1.

- If G is simple and ω≠0, then G_ω=G.

- For G=E×E and ω=(η,η), η a nonzero period, G_ω is the diagonal elliptic curve, not G.

- For (η,0) on E×E the answer is the first factor.

- For (η,η) in E² with η≠0 a period, the minimal subgroup is the diagonal of dimension 1, whose product-polarization normalized degree is 2. For (η,0) it is the first factor of degree 1; for ω=0 it is the zero variety of degree 1.

### 2.2 Masser–Wüstholz period theorem

For each g≥1 and each normalized polarization degree d=Δ_L(G)≥1 there is κ_g>0 depending only on g and C_(g,d)>0 such that for every polarized G/k of dimension g with L ample and Δ_L(G)=d, D=[k:ℚ], every complex embedding and every period ω, Δ_L(G_ω)≤C_(g,d) max(1,D,h_F(G),q_L(ω))^κ_g. Here q_L is the squared Hermitian period norm, and h_F is stable. Replacing q by its square root changes only the exponent. The field of definition of G_ω need not be k. (mw94-preprint, §4 internal p6, restatement of the MW93 period theorem; bost95, Theorem 2.2 pp119–120; §5.1 pp132–136; gr14 lines 63–68).

*Proof route.* Apply the filtered interpolation estimate of §2.2b to produce a nonzero section with prescribed period jets; its arithmetic degree and jet-norm argument supplies noninjectivity without assuming a separate height bound on that section. The tangent-space height estimate and §2.2a’s multiplicity theorem then bound the smallest algebraic subgroup carrying the period. Normalize its intersection degree and stable height as stated; the zero period is treated separately.

*Needs:* §2.1; the multiplicity and interpolation targets of §§2.2a–2.2b; ArakelovGeometryAndAbelianHeights §§3.4, 5.8 and the semistable tangent-metric and slope contracts; AbelianSchemesAndArithmeticModuli §A5.2–A5.4.

**Checks.**

- For ω=0 the normalized degree is 1 and the right side is≥1 after enlarging C_(g,d).

- For A simple and ω≠0 the bound applies to A itself, with normalized degree d. On an elliptic curve, L of degree 3 gives Δ_L(A)=3 and polarization map-degree 9, whereas a principal line gives Δ_L(A)=1.

- On a principally polarized elliptic curve, every nonzero period has minimal subgroup E and normalized degree 1; the zero period has subgroup 0 and degree 1. Thus both require a right side at least 1.

### 2.2a Multiplicity estimate on an abelian variety

Let A be an abelian variety of dimension g≥1 over an algebraically closed characteristic-zero field, L an ample line bundle, S⊂A a finite subscheme, and s a nonzero global section of L. Write S^[g] for the scheme-theoretic image of Sᵍ under addition. If s restricts to zero on S^[g], prove that some proper connected abelian subvariety B⊊A satisfies length(p(S)) d_L(B)≤d_L(A), where p:A→A/B is the quotient, p(S) is its scheme-theoretic image, and d_L(Y)=c₁(L)^(dim Y)[Y] is the unnormalized intersection degree, with d_L(0)=1. This includes nonreduced S (bost95 Theorem 4.1, p. 128, bost95 lines 381–389).

*Proof route.* Use the intersection-theoretic zero estimate on the successive translated vanishing loci; retain scheme-theoretic multiplicities when passing to the stabilizing connected subgroup. Applied to L^D it gives the corresponding factor D^codim B after cancelling D^dim B.

*Needs:* AbelianSchemesAndArithmeticModuli §§A3.3, A5.2–A5.4, A6.5 for quotients, intersection degree and connected abelian subvarieties; finite subscheme images and intersection multiplicities in the native scheme theory.

**Checks.**

- On an elliptic curve with a degree-two line and a section vanishing on two distinct points, g=1, B=0 and length(S) d_L(0)=2·1=2=d_L(A).
- For L=O_E(2[0]) and the length-two infinitesimal neighbourhood of 0, the canonical section vanishes on S, and again 2·1=2. Replacing scheme length by number of geometric points would give 1 and lose the multiplicity information.
- The zero section would vanish on a length-three subscheme for a degree-two line, giving the false inequality 3≤2 on an elliptic curve. Thus nonzero s is indispensable. With S empty the left side is 0 and B=0 works; dimension zero is excluded because it has no proper abelian subvariety.

### 2.2b Auxiliary sections and interpolation along a period

Let A/k have dimension g≥2, let L be symmetric ample, choose a finite extension k′/k, a k′-rational hyperplane W⊂Lie(A), an embedding σ₀:k′→ℂ, and a primitive nonzero period γ∈W_σ₀. Use the semistable tangent metric from the supplier contract and define h(W) as minus the normalized Arakelov degree of its saturated integral lattice. Put d=[k:ℚ], h=max(1,h_Del(A),log d_L(A),h(W)) and r=max(1,‖γ‖²_L), where h_Del(A)=h_F(A)+(g/2)log π. For Q∈A_σ₀ and i≥0, define V(Q,W,i) by requiring that every translation-invariant W-derivative of total order at most i vanish at Q. Thus V(Q,W,i) has length binomial(g−1+i,g−1), including length 1 at i=0.

The jet API is the following.

- V(Q,W,i) is the translate of V(0,W,i), with its full scheme structure.
- Its restriction maps for i≥j give the usual truncation of W-jets.
- Its degree-i graded piece is Symⁱ(W∨); its cumulative length is the displayed binomial coefficient.

For integers D,M,N≥2 put P=exp(γ/N) and T=V(0,W,2gM)∪⋃_(i=0)^(N−1)V(iP,W,gM). Prove that a constant C_g>0 depending only on g makes the restriction H⁰(A_σ₀,L^D)→H⁰(T,L^D|T) noninjective whenever

    M ≥ C_g D r,
    D^g d_L(A) ≥ C_g M^(g−1),
    M² ≥ C_g N^(2g) D d r (D + M h + log N).

The kernel therefore supplies a nonzero auxiliary section with all the stated jet vanishings. This is a sufficient condition, not a characterization of the kernel (bost95 Lemma 5.4, equations (5.9)–(5.10), pp. 136–137, bost95 lines 598–603; proof §§5.3.1–5.3.4, pp. 139–145). Its proof must cover arbitrary reduction: the potentially good case of §5.3 is extended using the semistable cubist-model argument indicated at bost95 lines 624–628. For the arbitrary ample line in §2.2, symmetrization L⊗[−1]*L and its degree and norm scaling reduce to the symmetric case.

*Proof route.* Filter restriction by W-jets, compare the arithmetic degree of the section module with the sum of the norms of the filtered maps, and estimate these norms by Cauchy and Schwarz bounds. Combine the resulting nonzero section with §2.2a; induction on a proper abelian subvariety and the tangent-height estimate of bost95 Proposition 5.3 give §2.2. The sharp estimate of §6.3 uses the same geometric multiplicity theorem with the different jet metrics and parameter bounds of gr14 §§6.1–6.9; the three inequalities here alone do not give its sharp exponent.

*Needs:* §2.2a; AbelianSchemesAndArithmeticModuli §§A5.1–A5.4 for exponential, periods, line sections and intersection degree; ArakelovGeometryAndAbelianHeights §§1.1–1.6, 2.4, 2.7, 3.4, 5.8 for Hermitian sections, semistable cubist models, height and the matrix lemma; the precise maximal-slope, symmetric-power, morphism and tangent-metric supplier contracts. The filtered jet-norm and section-degree argument is part of the proof of the displayed noninjectivity theorem (bost95 Proposition 4.4 and Lemmas 5.7–5.8). Its tangent-height inputs are targets here with explicit statements: there is c_g>0 depending only on g such that h(Lie B)≤c_g max(1,h_Del(A),log d_L(A),log d_L(B)) for every geometric abelian subvariety B⊂A; and h(F)≥−c_g max(1,h_Del(A),log d_L(A)) for every subspace F⊂Lie(A_k′) over every finite extension k′/k. Both heights use the saturated semistable tangent lattice and the restricted Riemann metrics, and rank-zero height is 0 (bost95 Proposition 5.3(i)–(ii), pp. 134–135, bost95 lines 553–567; proof of (i), Appendix D, pp. 155–157, and of (ii), §5.3.4, pp. 144–145).

**Checks.**

- For g=2 and i=0,1,2 the jet lengths are 1,2,3, respectively. A reduced-point model would return 1 at every order and omit the derivative conditions.
- For g=3 and i=2, the six monomials 1,x,y,x²,xy,y² give length binomial(4,2)=6. Forgetting mixed derivatives would give only 5.
- For the tangent-height inputs, B=0 and F=0 both give h=0, with d_L(0)=1 and log 1=0. Rescaling L to L⁴ raises the height of a rank-b tangent subspace by b log 2 and log d_L(B) by b log 4. A degree-two field extension doubles the unnormalized degree and its denominator, leaving each normalized height unchanged.
- For g=2,M=N=2, primitivity makes P a nonzero 2-torsion point. T has lengths 9 at 0 and 5 at P, hence length 14, rather than 9+5+5=19: the smaller jet at 0 is absorbed by the union. For a principally polarized surface and D=4, h⁰(L⁴)=16, so the restriction has kernel dimension at least 2. The arithmetic inequalities are sufficient, not necessary.

### 2.3 Short period bases

For each g≥1 there are C_g,c_g>0: if A/k is principally polarized of dimension≤g and B⊂A is an abelian subvariety, its period lattice has a ℤ-basis ω₁,…,ω_(2dimB) with q_L(ω_i)≤C_g(D max(1,h_F(A)))^c_g Δ_L(B)². B need not be k-defined. Empty bases are allowed for B=0. (mw93-isog-preprint, §4 Lemmas 4.1–4.2, internal pp5–6; mw94-preprint, §4 internal p7, application to the basis of periods; mw93-isog-preprint line 215).

*Proof route.* Use the restricted-polarization degree/covolume identity. The matrix-height lower bound for a nonzero period and Minkowski’s second theorem bound successive minima; the integral basis theorem then gives a basis of the whole period lattice. The matrix-height estimate follows by reducing the period matrix and combining its imaginary-part bound with the fixed modular-origin height comparison.

*Needs:* AbelianSchemesAndArithmeticModuli §A5.1; GeometryOfNumbersAndQuadraticArithmetic §1.5; GeometryOfNumbersAndQuadraticArithmetic §0.2, 1.2; ArakelovGeometryAndAbelianHeights §3.4; §2.5; ArakelovGeometryAndAbelianHeights §§5.7–5.8 (including Masser’s matrix lemma).

**Checks.**

- The output spans the entire integral period lattice, not merely its rationalization.

- For B=0 the basis is empty; normalized degree remains 1.

- For B=0, the basis has 0 elements and Δ=1. In ℤ², the independent vectors (1,1),(1,−1) have determinant −2 and span index 2, distinguishing independence from an integral basis.

### 2.4 Cusp value height bound

For each g≥1 fix once and for all a weight and a finite ℚ-rational Fourier-normalized family of scalar Siegel cusp forms with no common zero on H_g, and the analytic trivialization used for that Fourier normalization. For a ppav A/k represented by τ, at least one nonzero value u from this fixed family satisfies log max(1,|u(τ)|⁻¹)≤C_g D max(1,h_F(A)). The choice and scaling of the family are part of the theorem, not arbitrary input. (mz20, Lemma 4.3 proof pp656–657, citing MW93 periods Lemmas 8.4 p439 and 8.6 p440, equation (7.4) p436; mz20 line 937).

First prove the arithmetic evaluation estimate: for the fixed rational family and Fourier trivialization, at least one nonzero coordinate u at the origin satisfies log max(1,|u(τ)|⁻¹)≤c_g D max(1,h_Θ(A)), with fixed theta level and coordinate system. This is a target here, with no arbitrary rescaling of u (mw93-periods Lemma 8.4, p. 439, Lemma 8.6, p. 440; mz20 lines 945–952). The comparison h_Θ(A)≤c_g max(1,h_F(A)) is consumed from ArakelovGeometryAndAbelianHeights §5.8.

*Proof route.* Choose the common-weight cusp family once. Compare its modular-origin height with stable height, then apply the arithmetic value estimate to a nonzero coordinate in the chosen Fourier trivialization. The constants include the fixed family and cannot vary with the variety.

*Needs:* the fixed-coordinate arithmetic value estimate in this subsection; ArakelovGeometryAndAbelianHeights §3.4; AutomorphicBundles §B4.2; AutomorphicBundles §B4.9, B5.13; AutomorphicBundles B4.2, B5.13 and its fixed-family contract; ArakelovGeometryAndAbelianHeights §§5.7–5.8.

**Checks.**

- Fix the family and its Fourier scaling before choosing A. Multiplying a form by an arbitrarily tiny transcendental constant is outside the statement.

- The chosen value is nonzero; no logarithm of zero is used.

- For a fixed nonzero value u with |u|=e⁻² the left side is 2; replacing the entire family by e⁻ᴺ times itself makes it N+2, so arbitrary rescaling cannot share the same constant. A zero coordinate is discarded before taking its reciprocal.

### 2.5 Siegel imaginary-part height bound

For each g and 0<δ≤1 there is C_(g,δ)>0. Let τ=x+iy represent a ppav A/k, with y₀=diag(y_i), y≥δy₀ and y_i≥δ. Then every y_i≤C_(g,δ)D max(1,h_F(A)). No bound on x and no upper comparison y≤δ⁻¹y₀ is required. (mz20, Lemma 4.3 pp 656–657; Igusa Lemma 20 p104 as cited there; mz20 line 937).

*Proof route.* Apply the fixed-family decay estimate |u(τ)|≤M exp(−c tr y) in exactly the stated weak region. The nonzero value bound of §2.4 gives tr y≤C D max(1,h_F(A)); positivity gives y_i≤tr y. Real parts do not enter either estimate.

*Needs:* §2.4; AutomorphicBundles B4.2, B5.13 and its fixed-family contract; ArakelovGeometryAndAbelianHeights §§5.7–5.8.

**Checks.**

- For τ=100+it with t≥1 the lower imaginary-part hypotheses equal those for it, and the conclusion is the same bound on t; a real-part restriction would exclude this example.

- For τ=it in g=1, the hypotheses with δ=1 allow t≥1 and tr y=y₁=t. Translating x by 100 changes neither t nor the inequalities. Exponential decay gives ct≤log M+log|u|⁻¹.

### 2.6 Short endomorphism spanning set

For each g≥1 and polarization degree δ there are C_(g,δ),κ_g>0 such that End_k(A)⊗ℚ is spanned over ℚ by integral endomorphisms v with qλ(v)≤C_(g,δ)max(1,D,h_F(A))^κ_g, for A/k of dimension g with a k-defined polarization λ of map-degree δ. For δ=1 the constant depends only on g. This gives a rational spanning set of integral endomorphisms. (mw94-preprint, §§3–5, Proposition in §4 internal pp 6–9 and §5 pp 9–10; mw94-preprint line 245).

*Proof route.* For a subvariety in a power, use orthogonal graph projections to construct bounded endomorphism relations; projection denominators are controlled by its polarization degree (Lemmas3.1–3.2). Apply the period theorem to short periods and induct on a proper image subvariety; the dimension decreases at every failure of spanning. For a general polarization use an isotropic kernel quotient of degree sqrtδ after a field extension of degree≤c(g)Dδ^g; h changes by at most¼logδ. Pull back using a quasi-inverse, then average the rational End span over a bounded endomorphism-definition field. Eq(5.3) makes dependence on D polynomial; q bounds use submultiplicativity.

*Needs:* §2.2; §2.3; §1.4; AbelianSchemesAndArithmeticModuli §A6.20; AbelianSchemesAndArithmeticModuli §A3.3; ArakelovGeometryAndAbelianHeights §4.4.

**Checks.**

- For End_k(A)=Z, the generator 1 has q=2g.

- The output consists of k-defined integral endomorphisms even when geometric End is larger.

- For End_k(E)=ℤ the single integral generator 1 spans End⁰ and has q=2. In ℤ², vectors (1,1),(1,−1) span ℚ² but have integral index 2, so a rational spanning conclusion does not assert a ℤ-basis.

### 2.7 Endomorphism discriminant estimate

For each g≥1 there are C_g,κ_g>0 such that a ppav A/k of dimension g satisfies Dλ(End_k(A))≤C_g max(1,D,h_F(A))^κ_g. The same bound holds for End_k̄(A), after enlarging constants and exponent only in g. Both orders have a ℤ-basis whose qλ-lengths satisfy a bound of this form. (mw94-preprint, Main Theorem internal p1, Lemma 2.1 pp2–3, Lemma 5.1 p10; mz20, Lemma 4.4 p657; mw94-preprint line 346).

*Proof route.* Bound the rank by 4g² and apply the GN integral basis theorem to short rationally independent integral vectors. Hadamard bounds the Gram determinant; replace fixed-rank factors by dimension constants. To obtain geometric End pass to k(A[3]) with degree bounded by D|GL_(2g)(F₃)|; use base-change invariance of stable height.

*Needs:* §2.6; §1.3; GeometryOfNumbersAndQuadraticArithmetic §0.2, 1.2; GeometryOfNumbersAndQuadraticArithmetic §0.1; AbelianSchemesAndArithmeticModuli §A6.20.

**Checks.**

- For a non-CM elliptic curve the determinant is 2, consistent with a positive dimension constant.

- The geometric-End version uses a bounded torsion field and does not claim End_k=End_k̄.

- For a non-CM E, D_λ=2 and the basis squared norm is 2; for Gaussian CM E, the geometric values are D_λ=4 and q(1)=q(i)=2. Over ℚ the curve y²=x³−x has End rank 1, rising to rank 2 over ℚ(i).

### 2.8 Short off-diagonal isogeny

For principally polarized isogenous complex A,B of dimension g, there exist isogenies f:A→B and f̃:B→A such that v∈End(A×B), v(x,y)=(f̃(y),f(x)), has ℓ(v)≤C_g sqrt(D(End(A×B))). No arithmetic height assumption is used here. (mz20, Lemma 4.2 pp 655–656; mz20 line 893).

*Proof route.* For the principal integral positive trace lattice, nonzero integral vectors have norm≥1; Minkowski gives an integral basis of maximum norm≤C_g sqrtD. The product of the two block-degree polynomials is a nonzero polynomial of total degree 4g, since an isogeny and its quasi-inverse exist. A grid with coordinates 0,…,4g contains a nonzero evaluation. Its norm is bounded by a dimension constant times sqrtD. Project the selected endomorphism to its off-diagonal part using the two product idempotents; Rosati submultiplicativity bounds its norm by a dimension constant times the original norm.

*Needs:* §1.3; §1.6; GeometryOfNumbersAndQuadraticArithmetic §1.2, 1.5; GeometryOfNumbersAndQuadraticArithmetic §0.2, 1.2; AbelianSchemesAndArithmeticModuli §A6.1, A6.6; AbelianSchemesAndArithmeticModuli §A6.8; §1.4; §1.5.

**Checks.**

- Both off-diagonal directions must be isogenies; a short diagonal identity is insufficient.

- For A=B=E take f=f̃=1; the off-diagonal swap has q=4 and length 2. End(E²)=M₂(ℤ) has Rosati determinant 16 and square root 4. The diagonal identity has the same degree 1 but both off-diagonal degrees 0.

### 2.9 Polarized rational isogeny estimate

Fix dimension g and map-degreesδ_A,δ_B of k-defined polarizations. There are C_(g,δ_A,δ_B),κ_g>0 such that k-isogenous A,B/k admit a k-isogeny A→B of degree≤C_(g,δ_A,δ_B)max(1,D,h_F(A))^κ_g. The chosen isogeny is not required to preserve the polarizations. (mw94-preprint, §6, internal pp 11–12, equations(6.1)–(6.4); mw94-preprint line 413).

*Proof route.* Extract the Hom(A,B) block from bounded integral endomorphisms of A×B. Use the homogeneous degree polynomial and a finite coefficient grid to choose a nonzero-degree Hom combination; apply the Rosati degree inequality. For a minimal-degree isogeny use |h_F(B)−h_F(A)|≤½log N to obtain N≤C(H+log N)^κ, then absorb the logarithm. Equation(6.4), together with(5.3), retains polynomial dependence on D.

*Needs:* §2.6; §1.6; ArakelovGeometryAndAbelianHeights §4.4; AbelianSchemesAndArithmeticModuli §A6.1, A6.6; AbelianSchemesAndArithmeticModuli §A6.8; §1.5.

**Checks.**

- The bound contains h_F(A) only and the field degree enters polynomially.

- For A=B, the identity has degree 1 and requires C H^κ≥1. A degree-4 multiplication map has height difference 0≤½log4=log2; minimum degree is 1, so absorption must use that minimum.

### Examples

- For (η,η) in E² with η≠0 a period, the minimal subgroup is the diagonal of dimension 1, whose product-polarization normalized degree is 2. For (η,0) it is the first factor of degree 1; for ω=0 it is the zero variety of degree 1.

- For B=0, the basis has 0 elements and Δ=1. In ℤ², the independent vectors (1,1),(1,−1) have determinant −2 and span index 2, distinguishing independence from an integral basis.

- For a non-CM E, D_λ=2 and the basis squared norm is 2; for Gaussian CM E, the geometric values are D_λ=4 and q(1)=q(i)=2. Over ℚ the curve y²=x³−x has End rank 1, rising to rank 2 over ℚ(i).

- For A=B=E take f=f̃=1; the off-diagonal swap has q=4 and length 2. End(E²)=M₂(ℤ) has Rosati determinant 16 and square root 4. The diagonal identity has the same degree 1 but both off-diagonal degrees 0.

### Dependencies

Layer 1; ArakelovGeometryAndAbelianHeights §§3.4–3.5, 4.4, 5.8 and the precise slope and tangent-metric contracts; AbelianSchemesAndArithmeticModuli A3.3–A3.4, A5.1–A5.4, A6.20; the exact cusp-family and value-height contracts; GeometryOfNumbersAndQuadraticArithmetic §§0.2, 1.2, 1.5.

## Layer 3: Order discriminants and class indices

### 3.1 Regular-trace order discriminant

Let B be a finite-dimensional semisimple ℚ-algebra of ℚ-dimension m, and O⊂B a unital full ℤ-lattice subring. Put tr_B(x)=Tr_ℚ(L_x:B→B), the regular trace, and disc(O)=det(tr_B(e_i e_j)) for a ℤ-basis. Retain the sign and use |disc(O)| in inequalities. Division algebras and isotypic matrix algebras are both included. This refines the existing algebra/lattice carriers and creates no second CSA, order or lattice type. The basis-dependent expression is `regularOrderDiscriminant`; the integral left-multiplication trace equals the rational regular trace because the order is full. The definition itself accepts any finite-free integral ring; nondegeneracy is asserted only when its rational algebra is semisimple. For a commutative order it agrees with the supplied algebra discriminant. (mw95, §2 pp 8–9; mw95 line 148).

*Proof route.* Use the existing full lattice and left multiplication linear map. The determinant changes by the square of an integral basis-change determinant. For nondegeneracy, use Artin–Wedderburn block matrices over finite-dimensional division ℚ-algebras. Given a nonzero entry x_ij in one block, choose the single-entry matrix y_ji=x_ij⁻¹ in that block and zero elsewhere. Then tr_B(xy)=n·dim_ℚ(D)≠0 for that n×n block. This proves the regular-trace pairing nondegenerate without importing a reduced-trace theorem.

*Needs:* Mathlib `LinearMap.trace`; Mathlib `Matrix.det`; SemisimpleAlgebras Layers 2–3, 6.

The API records the following facts.

- tr_B(1)=m; this is neither 2 dim A nor generally the reduced trace.

- disc(O) is invariant under GL(m,ℤ) basis changes.

- If O′⊂O has finite index I, disc(O′)=I²disc(O).

- For any ℚ-basis of B, tr_B(x) is Mathlib LinearMap.trace of left multiplication, hence Matrix.trace of its multiplication matrix.

- The regular-trace pairing is nondegenerate and disc(O)≠0; its sign need not be positive.

**Checks.**

- For D=ℚ,O=ℤ, disc=1.

- For D=ℚ(i),O=ℤ[i], disc=−4.

- For O=ℤ[2i]⊂ℚ(i), disc=−16.

- For a non-CM elliptic curve End⁰=ℚ, the order discriminant is 1 whereas its Rosati Gram determinant is 2.

- For ℤ[i] and basis (1,i), the ordinary matrix is diag(2,−2), hence disc=−4. For ℤ[2i], disc=−16; for ℤ⊂ℚ, disc=1 and tr(1)=1.

### 3.2 Order class index

Let D be a finite-dimensional division ℚ-algebra and O⊂D a unital full ℤ-lattice subring. For e≥1 consider finitely generated left O-modules M whose underlying abelian group is ℤ-torsion-free and whose rationalization ℚ⊗_ℤ M is a left D-vector space of dimension e. Let b(M) be the least additive index [M:F] among free left O-submodules F≅O^e of full ℤ-rank. Such F exist by clearing denominators in a D-basis. Define i_e(O)=sup_M b(M) in ℕ∪{∞}; also i_0(O)=1. Finiteness is the class-index theorem, not a defining assumption. (mw95, §2 p8, definition after (2.1); mw95, End of §3 pp13–14, equation (3.11); mw95 lines 157–159).

*Proof route.* Represent M as a lattice in D^e after a rational basis choice. Clear common denominators to embed O^e and take the least positive finite index. Take the supremum in the extended naturals so that the definition does not presuppose Jordan–Zassenhaus finiteness. Transport right modules to left modules over the opposite algebra. For x∈D, the subalgebra ℚ[x] is a field; its left and right actions on D have equal dimension over ℚ[x], so L_x and R_x have equal rational trace. Cyclicity gives tr_D(yx)=tr_D(xy), hence the opposite order has the same regular-trace discriminant.

*Needs:* §3.1; SemisimpleAlgebras Layers 2–3, 6.

The API records the following facts.

- If i_e(O)≤I<∞, every such M contains O^e with index≤I.

- Any uniform upper bound for all b(M) bounds i_e(O).

- i_0(O)=1.

- An O-linear equivalence preserves b(M); an algebra/order equivalence preserves i_e.

- The additive index is exactly the index of the imported full ℤ-lattice, not an O-module cardinality over a field.

- For right O-modules use left Oᵒᵖ-modules and define i′_e(O)=i_e(Oᵒᵖ). The opposite algebra has the same regular-trace order discriminant: disc(Oᵒᵖ)=disc(O).

**Checks.**

- For O=ℤ, i_e=1 for every e≥0.

- For O=ℤ[i], i_e=1 because torsion-free finite modules over this PID are free.

- For O=ℤ[2i], the module M=ℤ[i] has least free rank-one submodule index 2, hence i_1(O)≥2.

- The sole torsion-free rank-zero module is 0 and its index in itself is 1.

- For ℤ[2i] acting on ℤ[i], [ℤ[i]:αℤ[2i]]=2·Norm(α), minimized at α=1 with value 2. For ℤ and ℤ[i] as PID orders every rank has index 1. Rank zero has index 1.

### 3.3 Division-algebra norm body

Let D be a finite-dimensional division ℚ-algebra of ℚ-dimension m≥1. Put N_D(x)=det_ℚ(L_x), extended to D_ℝ. In any full rational lattice basis Λ put p(D)=sqrt(|disc(Λ)|) times the supremum of the coordinate volumes of bounded convex bodies C with nonempty interior, C=−C, and C⊂{x:|N_D(x)|<1}. Symmetry is about zero. Strict interior may be replaced by limiting compact bodies. The product is independent of Λ and the chosen basis; it is a positive finite real number, with upper bound supplied by Minkowski applied to any full order lattice. In rational basis coordinates the regular norm is the determinant of the real scalar extension of left multiplication: its ij entry is ∑_k x_k b_i*(b_k b_j), with b_i* the ith coordinate functional. Use the displayed discriminant-normalized volume supremum on these real coordinates. (mw95, §2 pp 8–9, norm body definition; §3 pp 10–13; mw95 line 170).

*Proof route.* Transform the regular-trace determinant and Lebesgue coordinate volume under the same basis change; their factors cancel. Use a sufficiently small Euclidean ball for positivity. For a full order lattice, every nonzero integral vector has nonzero integral regular norm. Minkowski therefore bounds the volume of any eligible symmetric convex body; this proves finiteness of the supremum.

*Needs:* §3.1; Mathlib `Matrix.det`; Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`.

The API records the following facts.

- N_D is the determinant of left multiplication, a homogeneous polynomial of degree m.

- Changing the full rational lattice or its basis leaves p(D) unchanged.

- A ℚ-algebra isomorphism preserves p(D).

- At a complex place use ordinary two-dimensional real volume and the GN mixed-embedding discriminant normalization.

- The supremum defining p(D) is finite and p(D)>0; division ensures that a nonzero order element has nonzero integral regular norm.

- The coordinate regular norm is homogeneous of degree m, sends 1 to 1 and is multiplicative for the transported real algebra multiplication; a rational change of basis transports the norm region and rescales its coordinate volume by the reciprocal absolute determinant.

**Checks.**

- For D=ℚ, the interval(−1,1) gives p(ℚ)=2.

- For D=ℚ(i), the unit norm body is the Euclidean disk and p(D)=2π.

- For D=ℚ and Λ=2ℤ, sqrt|discΛ|=2 while the coordinate interval has length 1, so p remains 2.

- Using closed norm≤1 bodies through limiting volume gives the same supremum.

- With the rational basis b=2 of ℚ, the coordinate unit is 1/2: N_b(1/2)=1, while N_b(1)=2. Treating the coordinate 1 as the unit would give the wrong normalization.

- For D=ℚ with basis 1, N(x)=x and p=2. With basis 2, N(x)=2x, the discriminant is 4 and the coordinate interval has length 1, giving 2·1=2. For ℚ(i), N(x,y)=x²+y² and p=2π.

### 3.4 Division norm-body bound

Every finite-dimensional division ℚ-algebra D of ℚ-dimension m satisfies p(D)≥2^m. (mw95, §3, Lemmas3.1–3.3 pp 10–13, especially Lemma 3.3 p13; mw95 line 319).

*Proof route.* Over the number-field center use the supplied cyclic maximal subfield and its cyclic-algebra presentation. In these coordinates construct the bounded symmetric convex bodies at every real and complex place, apply Hadamard to their regular norms, and multiply the coordinate volumes with the discriminant factor. The arithmetic bridge in the supplier contracts is part of this route.

*Needs:* §3.3; SemisimpleAlgebras Layers 2–3, 6; ClassFieldTheory Layer 10 and its cyclic-maximal-subfield contract; QuadraticFormInvariants Layer 7B.

**Checks.**

- For ℚ obtain p=2 and equality; for ℚ(i), p=2π≥4.

- Cyclicity is required over the number-field center, not over ℚ when the center is larger.

- For ℚ, p=2=2¹. For ℚ(i), p=2π≥4=2². In the rational Hamilton division algebra, left norm of x is (a²+b²+c²+d²)²; the Lipschitz basis has |disc|=256 and unit-ball volume π²/2, giving p=8π²≥16.

### 3.5 Masser–Wüstholz class-index bound

For every full order O in a finite-dimensional division ℚ-algebra D and e≥1, i_e(O) is finite and i_e(O)≤|disc(O)|^(e/2). In particular no qualitative finiteness theorem for order lattices is assumed in its definition. The same bound holds for the right class index i′_e(O). Equivalently, every full O-stable lattice M⊂Dᵉ contains the injective image of Oᵉ with positive finite additive index bounded by |disc(O)|^(e/2); this is `class_index_bound`. The order basis, full rational spans and finite generation of M are explicit hypotheses. Applying it to Dᵒᵖ gives the right-module conclusion. (mw95, §2 Class Index Lemma and Lemmas 2.1–2.2 pp8–10; §3 pp13–14, equation (3.11); mw95 line 164).

*Proof route.* Minkowski in the regular norm body gives i_1≤2^m sqrt|discO|/p(D). Use p(D)≥2^m to obtain i_1≤sqrt|discO|. Filter a rank-e lattice by a rational D-line; lift a free sublattice of the quotient and combine it with a rank-one sublattice to prove i_e≤i_1 i_(e−1). Apply the same theorem to Oᵒᵖ⊂Dᵒᵖ and use disc(Oᵒᵖ)=disc(O) to obtain the right-module bound, including the rank-one case used in the Hom cross-discriminant argument.

*Needs:* §3.2; §3.4; Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`.

**Checks.**

- In rank one the exponent is 1/2: for the module ℤ[i] over ℤ[2i], the least free index is 2 and the discriminant bound is √16=4. In rank two the evident product sublattice has index 4≤16; replacing e/2 by e would lose the rank-one square-root assertion.

- The nonmaximal Gaussian order test is consistent with 2≤sqrt16.

- For O=ℤ,e=2, index 1≤1^(2/2)=1. For O=ℤ[2i],e=1,M=ℤ[i], the least index is 2≤√16=4. On M=ℤ[i]² the evident index is 4≤16; applying the opposite algebra preserves disc.

### 3.6 Isotypic trace comparison

Let A be isotypic of dimension g≥1 and O=End_k(A) of ℚ-rank m, where the k-isotypic decomposition and its rational endomorphism algebra use the same field. For every k-defined polarization λ, (2g)^m |disc(O)|=m^m Dλ(O), with disc computed using regular trace on End⁰_k(A). The same formula holds geometrically with geometric isotypy and geometric End. No such single proportionality is asserted for arbitrary products of nonisogenous factors. (mw95, Lemma 5.2 p18; mw95 line 485).

*Proof route.* Compare both traces after writing End⁰ as one matrix algebra over a division algebra; the ratio is m/(2g). The Rosati involution is an involutive rational linear map, so its determinant is±1 even if it fails to preserve O. Take determinants of the two bilinear forms and absolute values.

*Needs:* §1.3; §3.1; AbelianSchemesAndArithmeticModuli §A6.4; AbelianSchemesAndArithmeticModuli §A6.8.

**Checks.**

- For a non-CM elliptic curve m=1, obtain 2·1=1·2.

- For a CM elliptic curve m=2, obtain 2²·4=2²·4.

- For a non-CM E, (g,m,|disc|,D_λ)=(1,1,1,2), so 2=2. For Gaussian CM E, (1,2,4,4) gives 16=16. For E² non-CM, (2,4,16,16) gives 4096=4096.

### Examples

- For ℤ[i] and basis (1,i), the ordinary matrix is diag(2,−2), hence disc=−4. For ℤ[2i], disc=−16; for ℤ⊂ℚ, disc=1 and tr(1)=1.

- For ℤ[2i] acting on ℤ[i], [ℤ[i]:αℤ[2i]]=2·Norm(α), minimized at α=1 with value 2. For ℤ and ℤ[i] as PID orders every rank has index 1. Rank zero has index 1.

- For D=ℚ with basis 1, N(x)=x and p=2. With basis 2, N(x)=2x, the discriminant is 4 and the coordinate interval has length 1, giving 2·1=2. For ℚ(i), N(x,y)=x²+y² and p=2π.

- For ℚ, p=2=2¹. For ℚ(i), p=2π≥4=2². In the rational Hamilton division algebra, left norm of x is (a²+b²+c²+d²)²; the Lipschitz basis has |disc|=256 and unit-ball volume π²/2, giving p=8π²≥16.

- For O=ℤ,e=2, index 1≤1^(2/2)=1. For O=ℤ[2i],e=1,M=ℤ[i], the least index is 2≤√16=4. On M=ℤ[i]² the evident index is 4≤16; applying the opposite algebra preserves disc.

- For a non-CM E, (g,m,|disc|,D_λ)=(1,1,1,2), so 2=2. For Gaussian CM E, (1,2,4,4) gives 16=16. For E² non-CM, (2,4,16,16) gives 4096=4096.

### Dependencies

Native rational algebras, modules, traces, determinants and real volume; Mathlib `MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure`; SemisimpleAlgebras Layers 2 and 6; ClassFieldTheory Layer 10 and its cyclic-maximal-subfield contract; QuadraticFormInvariants Layer 7B; Layer 1 and AbelianSchemesAndArithmeticModuli A6.4, A6.8 only for the isotypic comparison.

## Layer 4: Cross-discriminants and polarization removal

### 4.1 Hom cross-discriminant

Let A,B/k be k-simple k-isogenous abelian varieties of dimension g. Put M=Hom_k(B,A), M′=Hom_k(A,B), and D=End⁰_k(A), of ℚ-dimension m. The pairing M×M′→ℚ is (u,v)↦tr_D(u∘v). Define c(M,M′)=det(pairing in ℤ-bases)², a positive rational number independent of bases. It is the square of the determinant, not its absolute value. (mw95, §4 pp 14–16, definition before Lemma 4.2; mw95 line 399).

*Proof route.* The rational Hom spaces are one-dimensional over the appropriate division algebra, so the trace pairing is perfect. Choose integral bases and square its determinant. Independent unimodular changes on either side change only its sign before squaring.

*Needs:* §3.1; AbelianSchemesAndArithmeticModuli §A6.7; AbelianSchemesAndArithmeticModuli §A6.4; Mathlib `Matrix.det`.

The API records the following facts.

- Compute c by the regular-trace composition matrix and then square its determinant.

- The squared determinant is invariant under separate ℤ-basis changes.

- Replacing M,M′ by full sublattices of indices I,J multiplies c by I²J².

- For A=B, c(End A,End A)=disc(End A)².

- Reversing A,B gives the same c after identifying the regular traces through any rational isogeny.

**Checks.**

- For End(E)=ℤ, c(EndE,EndE)=1.

- For End(E)=ℤ[i], c=16, not 4.

- For M=2Z,M′=3Z inside D=Q, c=36.

- A sign change in one basis vector leaves c unchanged.

- For a rational self-Hom pairing c=1. For Gaussian self-Hom, det=−4 and c=16. For the abstract paired sublattices 2ℤ and 3ℤ, the pairing matrix is (6), giving c=36; changing one sign leaves 36.

### 4.2 Product endomorphism discriminants

For a k-isotypic A with D=End⁰_k(A) of ℚ-dimension m, disc(End_k(A²))=(−1)^m 2^(4m) disc(End_k(A))^4. For k-simple k-isogenous A,B, disc(End_k(A×B))=(−1)^m 2^(4m)c(Hom(B,A),Hom(A,B)) disc(End_k(A))disc(End_k(B)). All traces are regular traces of the corresponding whole endomorphism algebra. (mw95, Lemma 5.1 pp 17–18; mw95 line 445).

*Proof route.* Write the four native Hom blocks of End(A×B). Regular trace on the size-two matrix algebra is twice the regular trace on D. Take the determinant of the diagonal and the off-diagonal paired blocks; the latter contributes(−1)^m times the squared cross determinant.

*Needs:* §4.1; §3.1; AbelianSchemesAndArithmeticModuli §A6.8.

**Checks.**

- For D=ℚ,O=Z obtain discM₂(Z)=−16.

- The square-power formula includes isotypic A, so it can be applied repeatedly to (A×A∨)^4. The cross-discriminant formula uses simple A,B.

- For End(E)=ℤ, disc End(E²)=−16=(−1)·2⁴·1⁴. Applying it again with m=4 gives disc M₄(ℤ)=2³². For Gaussian End rank 2, disc M₂(ℤ[i])=2¹⁶, with positive sign.

### 4.3 Simple cross-discriminant isogeny bound

For k-simple k-isogenous A,B of dimension g≥1 there is a k-isogeny B→A of degree≤c(Hom(B,A),Hom(A,B))^g. (mw95, Lemma 4.2 pp 16–17; mw95 line 417).

*Proof route.* Apply the left and right rank-one class-index bounds to the two Hom lattices over the simple End orders, using the opposite-algebra interface for the right action. Use the trace-dual lattice to obtain a composition δ whose squared regular norm is bounded by c. Convert regular norm into abelian degree: deg δ=|N_D(δ)|^(2g/m); select the required factor and use positive integral degrees.

*Needs:* §4.1; §3.5; AbelianSchemesAndArithmeticModuli §A6.1, A6.6.

**Checks.**

- WhenA=B use the identity of degree 1; the positive cross-discriminant bound must allow it.

- The regular norm exponent is 2g/m, and both Hom lattice indices enter the squared determinant.

- For A=B non-CM E, c=1 and the identity has degree 1=1¹. For A=B Gaussian E, c=16 and degree 1≤16; omitting the square would change the exported discriminant.

### 4.4 Stable-power isogeny bound

Let A/k be k-simple of dimension g, O=End_k(A), and let B⊂A^N be a k-abelian subvariety k-isogenous to A^e, e≥1. Then some k-isogeny B→A^e has degree≤i_e(O)^(2ge). The bound is independent of N. (mw95, Lemma 4.1 pp 14–16; mw95 line 364).

*Proof route.* Use the left O-action by postcomposition on Hom(B,A), of rational D-rank e. Choose free rows with additive index I≤i_e. The rows define a rationally invertible map B→A^e. The lattice-index relation and the inclusion B⊂A^N force its kernel into B[I]; bound its order by I^(2dimB).

*Needs:* §3.5; AbelianSchemesAndArithmeticModuli §A6.4; AbelianSchemesAndArithmeticModuli §A3.3; AbelianSchemesAndArithmeticModuli §A3.4.

**Checks.**

- For B=A^e the identity has degree 1.

- The bound depends on e and g but not the ambient power N.

- For A=E with End=ℤ, i_e=1 and B=Aᵉ, degree 1=1^(2e). The diagonal E⊂Eᴺ has a coordinate inverse of degree 1 for every N, so the ambient power does not enter.

### 4.5 Polarization-free discriminant bounds

For each g≥1 there are C_g,κ_g>0 such that for any k-simple A/k of dimension g the absolute regular discriminant of End_k(A) and the cross-discriminant c(Hom_k(A∨,A),Hom_k(A,A∨)) are at most C_g max(1,D,h_F(A))^κ_g. In the cross pairing use the regular trace on End⁰_k(A). No polarization degree enters the constant. (mw95, Lemma 6.1 pp 18–19; mw95 line 514).

*Proof route.* Use the existing principal polarization on Z=(A×A∨)^4 over k, with dimZ=8g and h_F(Z)=8h_F(A). Bound its Rosati discriminant in dimension 8g, then compare with its ordinary discriminant on the isotypic algebra. Apply the block determinant formulas repeatedly and use nonzero integral discriminant factors to bound the individual factors.

*Needs:* §2.7; §3.6; §4.2; ArakelovGeometryAndAbelianHeights §6.1; ArakelovGeometryAndAbelianHeights §6.2; ArakelovGeometryAndAbelianHeights §3.5.

**Checks.**

- No input polarization degree appears in the final constant.

- Zarhin’s dimension and height multipliers are both 8, and all ordinary trace formulas use the full isotypic algebra.

- For non-CM E, ordinary disc=1 and the dual cross-discriminant=1. Zarhin dimension is 8 and its height is 8h_F(E), even if h_F(E)=−1; replacing height by an assumed nonnegative value would break additivity.

### 4.6 Stable subvariety isogeny bound

For each g≥1 there are C_g,κ_g>0. Let A=∏A_i^(e_i) be an actual product over k of pairwise k-nonisogenous k-simple varieties, with dimA=g. If B⊂A^8 is k-defined and k-isogenous to A, some k-isogeny B→A has degree≤C_g max(1,D,h_F(A))^κ_g. (mw95, Lemma 6.2 pp 19–20; mw95 line 533).

*Proof route.* ProjectB into the pairwise nonisogenous simple powers; cross Hom vanishing decomposes its isotypic pieces. Use the stable-power bound and the polarization-free discriminant estimate on each piece. Height additivity and the dimension-dependent lower bound control the heights of the factors by max(1,h_F(A)); multiply at mostg bounds.

*Needs:* §4.4; §4.5; AbelianSchemesAndArithmeticModuli §A6.5; ArakelovGeometryAndAbelianHeights §3.5; ArakelovGeometryAndAbelianHeights §6.5.

**Checks.**

- An actual product decomposition is a hypothesis, not a conclusion smuggled in from quantitative factorization.

- The subvariety lies in A^8 and is isogenous to A, not to an arbitrary power of A.

- For B the diagonal A⊂A⁸, degree of projection B→A is 1. For A=E×E′ with nonisogenous factors, dim A=2 and each multiplicity is 1; an arbitrary isogenous presentation is not an actual product hypothesis.

### 4.7 Small product-dual isogeny

For A an actual product as in the §4.6, there is a k-isogeny A→A∨ of degree≤C_g max(1,D,h_F(A))^κ_g, with constants depending only on g. (mw95, Lemma 6.3 p20; mw95 line 562).

*Proof route.* Apply the simple cross-discriminant isogeny estimate to each simple factor and its dual. Reverse the direction by exchanging A_i,A_i∨ where needed; the cross-discriminant is symmetric. Take products and powers, controlling factor heights by the same additive-height lower-bound argument.

*Needs:* §4.3; §4.5; ArakelovGeometryAndAbelianHeights §3.5; ArakelovGeometryAndAbelianHeights §6.5.

**Checks.**

- The source and target have equal dimension and the constructed product map is an isogeny.

- The height lower bound controls each simple factor without assuming its height nonnegative.

- For A=E×E′ with canonical elliptic dualities, the product map has degree 1·1=1. With formal heights −1 and 2 the total is 1, so the factor bound requires the lower-height constant.

### Examples

- For a rational self-Hom pairing c=1. For Gaussian self-Hom, det=−4 and c=16. For the abstract paired sublattices 2ℤ and 3ℤ, the pairing matrix is (6), giving c=36; changing one sign leaves 36.

- For End(E)=ℤ, disc End(E²)=−16=(−1)·2⁴·1⁴. Applying it again with m=4 gives disc M₄(ℤ)=2³². For Gaussian End rank 2, disc M₂(ℤ[i])=2¹⁶, with positive sign.

- For A=E with End=ℤ, i_e=1 and B=Aᵉ, degree 1=1^(2e). The diagonal E⊂Eᴺ has a coordinate inverse of degree 1 for every N, so the ambient power does not enter.

- For non-CM E, ordinary disc=1 and the dual cross-discriminant=1. Zarhin dimension is 8 and its height is 8h_F(E), even if h_F(E)=−1; replacing height by an assumed nonnegative value would break additivity.

### Dependencies

Layers 1–3; AbelianSchemesAndArithmeticModuli A3.3–A3.4, A6.4–A6.8; ArakelovGeometryAndAbelianHeights §§3.5, 6.1–6.2, 6.5.

## Layer 5: Unpolarized factorization and isogenies

### 5.1 Isogeny to a simple-factor product

Let A/k be an actual product of pairwise nonisogenous k-simple powers, of dimension g, and let A*/k be k-isogenous to A. There is a k-isogeny A*→A of degree≤C_g max(1,D,h_F(A))^κ_g. Only the height of the product target A occurs. (mw95, Lemma 7.1 pp 21–22; mw95 line 593).

*Proof route.* Form Z(A) and Z(A*), both ppav; apply the principal-polarized estimate in the direction with source height 8h_F(A). Use a quasi-inverse and the small A→A∨ isogeny to map Z(A*) to A^8 with controlled finite kernel. Restrict to the embedded A*, obtain its image B⊂A^8, and apply the stable subvariety estimate B→A. Bound the kernel of each restricted map by the finite kernel of its ambient isogeny. Do not assign an isogeny degree to a dimension-changing ambient projection.

*Needs:* §2.9; §4.6; §4.7; ArakelovGeometryAndAbelianHeights §6.1; ArakelovGeometryAndAbelianHeights §6.2; AbelianSchemesAndArithmeticModuli §A3.3.

**Checks.**

- The height in the bound is that of the product target A.

- Every degree used to bound a restriction comes from an equal-dimensional finite map.

- For A=A*=E, the Zarhin varieties each have dimension 8 and the restricted identity has kernel order and degree 1. A projection E²→E has positive-dimensional kernel and cannot supply an equal-dimensional degree.

### 5.2 Quantitative simple factorization

For each g≥1 there are C_g,κ_g>0 such that A/k of dimension g admits a k-isogeny A→∏A_i^(e_i), where the A_i are pairwise nonisogenous k-simple k-abelian subvarieties of A and degree≤C_g max(1,D,h_F(A))^κ_g. The factors are not assumed principally polarized. (mw95, Theorem I p5; proof §7 pp 22–23; final p23; mw95 line 620).

*Proof route.* Use existing qualitative Poincaré reducibility to choose a minimal-degree factorization N:A→A₀. The preceding product-target lemma bounds another map A→A₀ by C max(1,D,h_F(A₀))^κ. Height variation gives h_F(A₀)≤h_F(A)+½log N, so N≤C(H+log N)^κ. Absorb the logarithm for N≥1 and retain polynomial dependence on D from mw94-preprint (5.3), (6.4).

*Needs:* §5.1; AbelianSchemesAndArithmeticModuli §A6.5; ArakelovGeometryAndAbelianHeights §4.4.

**Checks.**

- The minimal N inequality uses the existing qualitative decomposition and the preceding product-target bound, so the proof does not assume quantitative factorization.

- Dimension constants absorb the logarithm and the bounded number of simple factors.

- For A simple, take the single factor A and exponent 1: minimal N=1 and log N=0. For A=E² the exponent is 2 and the product identity has degree 1; quantitative factorization is not assumed in choosing a qualitative minimum.

### 5.3 Unpolarized rational isogeny estimate

For each g≥1 there are C_g,κ_g>0: if A,B/k of dimension g are k-isogenous over a number field of degree D, some k-isogeny A→B has degree≤C_g max(1,D,h_F(A))^κ_g. No polarization is included in the input, and the constants depend only on g. (mw95, Theorem II p6, proof §7 pp 22–23 and final p23; mw95 line 629).

*Proof route.* Factor A into a product A₀ by a polynomial-degree isogeny, controlling h_F(A₀). Apply the product-target lemma to B→A₀. A degree N isogeny has a quasi-inverse of degree≤N^(2g−1), because its kernel is killed by N and the quotient property factors[N]. Compose A→A₀→B and absorb the fixed dimension powers.

*Needs:* §5.2; §5.1; AbelianSchemesAndArithmeticModuli §A3.3; AbelianSchemesAndArithmeticModuli §A3.4; ArakelovGeometryAndAbelianHeights §4.4.

**Checks.**

- The bound depends onh_F(A), not onh_F(B) or any chosen polarization.

- No claim that C_g is explicitly computed as a function ofg is made.

- For A=B=E the least degree is 1. For [2]:E→E, degree 4 and its elliptic dual also has degree 4=4^(2·1−1); in dimension g, a quasi-inverse to degree N has degree N^(2g−1).

### 5.4 Relative-field isogeny estimate

Let k be a number field and k⊂K⊂k̄. For K-isogenous A,B defined over k, there is a K-isogeny of degree≤C_g max(1,[k:ℚ],h_F(A))^κ_g. In particular the bound is independent of[K:k], even when K/k is infinite. For an arbitrary field extension K/k, use Hom rigidity to descend its Hom data to the relative algebraic closure ofk in K and apply the same bounded torsion-field argument. (mw95, Lemma 7.2 and following proof, p22–23; mw95 line 644).

*Proof route.* Set L=k(A[3],B[3]); all geometric Hom is defined over L and[L:k]≤|GL_(2g)(F₃)|². Galois descent identifies Hom_K with Hom_(K∩L). Apply the rational estimate over K∩L and absorb its bounded relative degree into dimension constants.

*Needs:* §5.3; AbelianSchemesAndArithmeticModuli §A6.20; AbelianSchemesAndArithmeticModuli §A6.25.

**Checks.**

- The field degree is[k:ℚ], not[K:ℚ].

- The result applies to infinite K/k by descending all Hom data to K∩k(A[3],B[3]).

- For k=ℚ,K=ℚ̄, [K:k] is infinite but [k:ℚ]=1. All Hom descends to K∩k(A[3],B[3]), of relative degree at most |GL_(2g)(ℤ/3)|²; when g=1 this is 48²=2304.

The relative-field factorization theorem is also a target: for every extension K/k and A/k of dimension g≥1, there is a K-isogeny A→∏A_i^(e_i), with A_i⊂A_K pairwise K-nonisogenous K-simple abelian subvarieties and degree≤C_g max(1,[k:ℚ],h_F(A))^κ_g. The constants do not depend on K (mw95 Theorem I, p. 5, and the relative proof on p. 23, mw95 lines 661–671).

*Proof route for factorization.* For algebraic K take k₁=K∩k(A[3]). Subvariety and Hom descent show that simplicity and nonisogeny over k₁ persist over K; apply §5.2 over the bounded-degree number field k₁. For arbitrary K first descend to the relative algebraic closure of k in K by rigidity, then extend scalars.

*Needs for factorization:* §5.2; AbelianSchemesAndArithmeticModuli §§A6.20, A6.25.

**Checks for factorization.**

- K=k gives §5.2 and a k-simple A has the single factor A with degree 1.
- For K=k̄, all factors are geometrically simple; [K:k] may be infinite, while in dimension 1 the definition field degree is at most |GL₂(𝔽₃)|=48.
- For A=E² over k and K=k(t), a non-CM E remains simple and Hom(E,E)=ℤ, so the factorization has multiplicity 2 and degree 1. An isogeny to two labelled copies does not make them pairwise nonisogenous factors.

### 5.5 Geometric isogeny estimate

For every g≥1 there are C_g,κ_g>0 such that geometrically isogenous dimension-g abelian varieties A,B over the same number field k admit a k̄-isogeny A→B of degree≤C_g max(1,h_F(A),[k:ℚ])^κ_g. The map need not be k-defined or preserve a polarization. The same geometric bound holds after any algebraically closed overfield ofk̄ by rigidity of Hom. (ts18, Theorem 2.3 pp382–383; mw95, Theorem II p6; final field-degree argument p23; mw95 line 688).

*Proof route.* Apply the relative estimate to K=k̄. Use stable-height invariance under finite extension and clamp negative heights with 1. Transport geometric Hom along algebraically closed field extension using the existing relative Hom rigidity interface.

*Needs:* §5.4; ArakelovGeometryAndAbelianHeights §3.4; AbelianSchemesAndArithmeticModuli §A6.25.

**Checks.**

- A nontrivial quadratic twist may be geometrically isogenous without any k-isogeny; the conclusion remains geometric.

- The constants depend only on g and the field-degree dependence is polynomial.

- A non-CM E/ℚ and a quadratic twist by a nonsquare have a geometric isomorphism of degree 1, while their rational Hom is zero when the twisting character is nontrivial. This separates the geometric conclusion from a rational one.

### Examples

- For A simple, take the single factor A and exponent 1: minimal N=1 and log N=0. For A=E² the exponent is 2 and the product identity has degree 1; quantitative factorization is not assumed in choosing a qualitative minimum.

- For k=ℚ,K=ℚ̄, [K:k] is infinite but [k:ℚ]=1. All Hom descends to K∩k(A[3],B[3]), of relative degree at most |GL_(2g)(ℤ/3)|²; when g=1 this is 48²=2304.

- A non-CM E/ℚ and a quadratic twist by a nonsquare have a geometric isomorphism of degree 1, while their rational Hom is zero when the twisting character is nontrivial. This separates the geometric conclusion from a rational one.

### Dependencies

Layers 2 and 4; AbelianSchemesAndArithmeticModuli A3.3–A3.4, A6.5, A6.20, A6.25; ArakelovGeometryAndAbelianHeights §§3.4, 4.4.

## Layer 6: Quadratic elliptic isogeny estimates

### 6.1 Non-CM period graph

Let E₁,E₂/k be geometrically isogenous elliptic curves without CM. Choose period bases(ω₁₁,ω₁₂),(ω₂₁,ω₂₂), and let ω=(ω₁₁,ω₁₂,ω₂₁,ω₂₂) in Lie(E₁²×E₂²). The minimal period subvariety G_ω is, after an extension of degree≤2, isomorphic to E₁×E₂. IfN is the least geometric isogeny degree E₁→E₂, the finite intersection G_ω∩(0²×E₂²) has order N. (gr14, §7.1 Proposition 7.3 and §7.2 Theorem 7.5, pp 383–386; gr14 line 1813).

*Proof route.* Use FaltingsFinitenessAndIsogenyTheorems R28.6.6’s rank-one non-CM Hom lattice to obtain the at-most-quadratic definition field. Choose compatible period bases for a minimal cyclic isogeny and write the graph using it and its dual. The absence of CM excludes a one-dimensional subgroup containing both independent periods; compute the indicated finite intersection.

*Needs:* §2.1; FaltingsFinitenessAndIsogenyTheorems §R28.6.6; AbelianSchemesAndArithmeticModuli §A6.4; AbelianSchemesAndArithmeticModuli §A6.20.

**Checks.**

- For E₁=E₂ and compatible bases, the minimal isogeny degree and the indicated kernel cardinality are 1.

- Two independent periods in the first E₁² exclude an elliptic subgroup only under the non-CM hypothesis.

- For E₁=E₂ non-CM with identical bases, G_ω={(x,y,x,y)} has dimension 2; its intersection with 0²×E² has order 1, equal to minimal degree 1. A one-dimensional graph cannot carry both independent periods without CM.

### 6.2 CM period graph

For geometrically isogenous CM elliptic curves E₁,E₂/k, choose shortest nonzero periodsω₁,ω₂ in their complex period lattices and put ω=(ω₁,ω₂) in Lie(E₁×E₂). Its minimal period subvariety is elliptic after an extension of degree≤12. Its two projections are isogenies of degrees N₁,N₂, and dualizing the first then composing the second gives E₁→E₂ of degree N₁N₂. (gr14, §7.1 Proposition 7.3 and §7.4 Lemmas7.7–7.8, pp 383–384,389–390; gr14 lines 1995–2012).

*Proof route.* Use the rank-two integral Hom action to bound its finite Galois image by 12. The CM relation between shortest periods gives a one-dimensional minimal subgroup. Its nonzero projections to the two elliptic curves are isogenies; the elliptic dual has the same degree.

*Needs:* §2.1; AbelianSchemesAndArithmeticModuli §A6.4; AbelianSchemesAndArithmeticModuli §A3.5.

**Checks.**

- Both shortest periods are nonzero; neither coordinate projection of G_ω is zero.

- The composite degree is N₁N₂, not their sum or maximum.

- For E₁=E₂=ℂ/(ℤ+iℤ) and shortest periods 1,1, G_ω is the diagonal of dimension 1 and both projection degrees are 1, so the composite degree is 1·1=1.

### 6.3 Quadratic elliptic isogeny bound

First construct the following period quantities for any polarized complex abelian variety (X,L) of positive dimension. Let ρ(X,L)>0 be its shortest nonzero period length. For a proper abelian subvariety B⊊X, let δ(X,L,B)>0 be the least distance from a period outside Lie(B) to Lie(B), in the quotient Hermitian metric. Define d_L(B)=c₁(L)^b[B]=b!Δ_L(B), including d_L(0)=1, and x(B)=(d_L(B)/d_L(X))^(1/codim B); put x=min_B x(B). The minimum is attained: degree is a positive integer and there are finitely many possible codimensions, so each nonempty degree set has a least member. These are geometric quantities at the chosen embedding (gr14, Definitions 4.1 and §4.4, pp. 360–363; gr14 lines 692, 729).

Their API consists of the following facts.

- The quotient period lattice has positive shortest length δ; its underlying quotient is by the saturated period lattice of B, and δ is measured perpendicular to Lie(B).
- For B=0, δ=ρ. Isomorphisms carrying L to L′ preserve both quantities and transport the minimizing subvarieties.
- Replacing L by L to the tensor power n≥1 multiplies ρ and δ by √n, d_L(B) by n^b and x by 1/n. The cotangent maximal slope increases by ½log n in the same metric convention.
- The degree d_L is the unnormalized intersection degree, whereas Δ_L elsewhere divides by the factorial. Both are positive; the zero subvariety has both values 1.

Prove the sharp surface estimate. Let X/k have dimension 2, let L be a k-defined polarization, and assume d_L(X)≥10¹⁰. At each complex embedding σ choose a proper B_σ with x(B_σ)=x and put δ_σ=δ(X_σ,L_σ,B_σ), ρ_σ=ρ(X_σ,L_σ). There is an absolute C>0 such that

    D⁻¹ Σ_σ δ_σ⁻² ≤ C x (max(1000, μ̂_max(t_X∨)) + 2 + log d_L(X) + D⁻¹ Σ_σ log max(1,ρ_σ⁻¹)).

Here μ̂_max is the maximum normalized slope of nonzero saturated subbundles of the cotangent bundle with the dual Riemann metric and the integral tangent lattice of a semistable Néron model, computed after finite semistable extension. The normalized averages and this slope convention make the expression independent of that extension. The enlarged constant and additive 2 are a consequence of Proposition 6.9; its printed numerical constants are not part of the export. The low-degree range d_L(X)<10¹⁰ is treated directly in the elliptic application, before invoking this estimate (gr14, §3.2, Proposition 6.9 and its proof, pp. 358–359, 380–381; gr14 lines 607, 1609).

The two preparatory estimates in this subsection are also targets, for every polarized X/k of dimension g≥1 over a number field: there is c_g>0 depending only on g such that D⁻¹Σ_σρ(X_σ,L_σ)⁻²≤c_g max(1,h_F(X),log d_L(X)); and μ̂_max(t_X∨)≤(g+1)(h_Del(X)+½log h⁰(X,L))+2g⁵log 2. The first is the matrix-period bound of gr14 Theorem 1.1, p. 345, gr14 lines 96–103; the second is gr14 Proposition 3.10, p. 359, gr14 lines 668–687, with h⁰(X,L)=d_L(X)/g!. Their proofs use principalization, the supplied matrix lemma, height variation and the morphism slope inequality. These are bounds on the actual period and cotangent objects, with the semistable metric convention fixed above.

*Needs for this input:* §2.1; AbelianSchemesAndArithmeticModuli §§A5.1–A5.4; ArakelovGeometryAndAbelianHeights §§1.1–1.6, 2.7, 4.4 and its maximal-slope, symmetric-power, morphism, metric-rescaling and semistable tangent-metric contracts; the matrix-period and cotangent slope estimates just stated; §§2.2a–2.2b for the multiplicity and interpolation mechanism, with the precise metrics and parameters of gr14 §§6.1–6.9 for the sharp estimate. The auxiliary-section route uses Hermitian norms on symmetric powers, interpolation at jets along the exponential map, a multiplicity estimate for proper algebraic subgroups, and the norm-controlled morphism slope inequality. Its surface specialization retains the same auxiliary construction as §§6.1–6.7 and sharpens the final inequalities of §6.8.

**Checks for the sharp input.**

- On the square Gaussian E² with the principal product line L₀, d_L₀(E²)=2, Δ_L₀(E²)=1, and the diagonal B has d_L₀(B)=2. The period (1,0) has distance 1/√2 from Lie(B), while ρ=1; replacing avoidance length by shortest period changes its inverse square from 2 to 1.
- On E² with L=L₀ to the tensor power a=10⁵, a coordinate factor has d_L(B)=a, d_L(E²)=2a²=2·10¹⁰, x=1/(2a)=5·10⁻⁶, and δ=ρ=√a, so δ⁻²=10⁻⁵. Since log(2·10¹⁰)>23, even the degree term with C=1 exceeds 1.15·10⁻⁴; the displayed bound is consistent. The unscaled product has degree 2 and is excluded from this large-degree assertion.
- Under L↦L⁴ the values are x/4, 2δ, 2ρ, and μ̂_max+log 2; both inverse-square quantities scale by 1/4. Under a degree-two field extension, the embedding sum and D both double. An opposite slope sign or an unnormalized embedding sum fails these equalities.
- For the two preparatory bounds, the square Gaussian product has ρ=1 and embedding average ρ⁻²=1, d_L(X)=2 and h⁰(L)=1. The cotangent bound at g=2 is μ̂_max≤3h_Del(X)+64 log 2. Under L↦L⁴, ρ⁻² becomes 1/4, h⁰(L) becomes 16, and the slope rises by log 2 while its displayed upper bound rises by 6 log 2. These changes fix both the factorial and the slope sign.


There is an absolute C>0 such that geometrically isogenous elliptic curves E₁,E₂/k, D=[k:ℚ]≥1, admit a geometric isogeny of degree≤C D² max(1,h_F(E₁),log D)². Both CM and non-CM cases are included; no k-rationality of the isogeny is asserted. (gr14, Theorem 1.4 p347; §7.2 Theorem 7.5 pp384–386; §7.3 pp386–389 and §7.4 pp389–390; Proposition 6.9 invoked in those proofs; gr14 line 1609).

*Proof route.* First establish the sharp dimension-two period/slope estimate of Gaudron–Rémond Proposition 6.9, with the normalized conormal metric and maximal slope of the cotangent bundle, by its auxiliary-section and multiplicity argument in §§6.1–6.9. For the non-CM graph and the least geometric isogeny degree N≥1, its weighted product polarization and conormal slope estimate give √N≤cD(max(1,h_F(E₁))+2log N). Absorption yields N≤C D² max(1,h_F(E₁),log D)². In the CM graph the shortest-period estimate and height variation bound the product N₁N₂ at the same rate. The Faltings/Deligne height shift is absorbed in the absolute constant.

*Needs:* §6.1; §6.2; ArakelovGeometryAndAbelianHeights §4.4; the sharp slope/period subtarget in this subsection.

**Checks.**

- For D=1 the right side stays positive.

- The proof supplies degree quadratic in D; a dimension-dependent unspecified exponent from the coarse period theorem does not suffice.

- For identical elliptic curves and D=1, N=1 and the bound is C·max(1,h_F,0)²≥1 after C≥1. At D=2 the explicit degree factor is 4; the excluded zero-degree input would make log N undefined.

### 6.4 Elliptic j-height isogeny bound

The headline `elliptic_isogeny_j_height_bound` states that there is an absolute C>0 such that for D=[k:ℚ]≥2, any geometrically isogenous elliptic E₁,E₂/k admit a geometric isogeny of degree≤C D²(log D)²(1+h(j(E₁)))², where h is absolute logarithmic Weil height. For D=1 use C max(1,h(j(E₁)))² instead. (mz20, Lemma 2.2, p. 644; gr14, Theorem 1.4 p347; §7.3 pp386–389 and §7.4 pp389–390; mz20 line 397).

*Proof route.* Substitute the supplier bound h_F(E₁)≤h(j(E₁))/12+3. For D≥2, log D is bounded below by log 2, so max(1,h_F,log D)≤c(log D)(1+h(j)). Treat D=1 separately rather than returning a zero bound.

*Needs:* §6.3; ArakelovGeometryAndAbelianHeights §5.9; `TauCeti.Isogeny.degree`; `NumberField.absLogHeight₁`.

**Checks.**

- For the CM elliptic curve with j=0 over ℚ, the identity has degree 1 and h(j)=0, so the D=1 bound requires C≥1; the D≥2 expression cannot be used at D=1 because log 1=0.

- For j=0,D=1 the bound is C, while the uncorrected D²(log D)² expression is 0. For D=2,j=0 it is 4C(log2)²>0, covering the CM example.

### Examples

- For E₁=E₂ non-CM with identical bases, G_ω={(x,y,x,y)} has dimension 2; its intersection with 0²×E² has order 1, equal to minimal degree 1. A one-dimensional graph cannot carry both independent periods without CM.

- For E₁=E₂=ℂ/(ℤ+iℤ) and shortest periods 1,1, G_ω is the diagonal of dimension 1 and both projection degrees are 1, so the composite degree is 1·1=1.

- For identical elliptic curves and D=1, N=1 and the bound is C·max(1,h_F,0)²≥1 after C≥1. At D=2 the explicit degree factor is 4; the excluded zero-degree input would make log N undefined.

- For j=0,D=1 the bound is C, while the uncorrected D²(log D)² expression is 0. For D=2,j=0 it is 4C(log2)²>0, covering the CM example.

### Dependencies

The minimal period subvariety of §2.1; AbelianSchemesAndArithmeticModuli A3.5, A6.4, A6.20; ArakelovGeometryAndAbelianHeights §§3.4, 4.4, 5.8–5.9 and the precise slope and tangent-metric contracts; FaltingsFinitenessAndIsogenyTheorems R28.6.6; §§2.2a–2.2b; the sharp dimension-two slope/period argument of §6.3. The coarse exponent in §2.2 does not supply this rate.

## Layer 7: Uniform integral Tate bounds over number fields

### 7.1 Integral image algebra

Let A/K in characteristic zero have all geometric endomorphisms defined over K. Put T=∏_ℓT_ℓ(A), E=End_K̄(A), and Z=Cent_End_Ẑ(T)(E). For a closed subgroup V of the adelic Galois image U define B(V)=Ẑ[V], the unital algebra of finite Ẑ-linear combinations of elements of V inside End_Ẑ(T); products stay in that span because V is a group. Also denote its topological closure by B̄(V). The source product comparison is a separate target, not built into this definition. Use the pinned profinite-integer ring and product decomposition. (ry25, §4.6 Theorem 4.7 pp 260–262; ry25 line 456).

*Proof route.* Assemble the supplied primewise modules and actions using the pinned profinite-integer ring. Take the unital finite linear span inside the geometric-End centralizer and retain its closure separately. Surjectivity of each coefficient projection gives the projected finite span. The local span is a finite ℤ_ℓ-module and is closed; compactness of the ambient product shows that projecting the closure yields the same span.

*Needs:* AbelianSchemesAndArithmeticModuli §A4.1; AbelianSchemesAndArithmeticModuli §A5.1; AbelianSchemesAndArithmeticModuli §A6.22; `TauCeti.AlgebraicGeometry.AbelianVariety.End`; pinned Ẑ product and prime-idempotent API.

The API records the following facts.

- B(V) consists of finite sums ∑a_iv_i with a_i∈Ẑ, v_i∈V.

- V⊂W implies B(V)⊂B(W) and B̄(V)⊂B̄(W).

- The action of native End_K̄(A) on T commutes with V, hence B(V)⊂Z.

- The ℓ-projection of B(V) equals Z_ℓ[pr_ℓV]: lift each finite coefficient through the surjective native component map. The local span is a finite Z_ℓ-module, hence closed, so the same equality holds for the projection of B̄(V).

- B({1}) consists exactly of scalar Ẑ multiples of the identity.

- For every unital Ẑ-subalgebra C of the native endomorphism algebra, B(V)⊂C iff V⊂C. In particular V⊂B(V) and finite sums and products stay in B(V).

**Checks.**

- Take T=Ẑ² with E=ℤ acting by scalars. Then B({1}) is the scalar algebra and has infinite additive index in the full matrix centralizer.

- For V=GL_n(Ẑ), n≥2, the algebra is Mat_n(Ẑ): subtracting the identity from elementary unipotents gives off-diagonal matrix units, and their products give diagonal units; in rank one the identity already spans the ring.

- For V⊂Ẑ× acting by scalars, B(V) is exactly the scalar algebra.

- For T=Ẑ and any subgroup V, the unital Ẑ-algebra generated by V is Ẑ, even if V={1}.

- On Ẑ² with scalar End, B({1}) is scalar and has infinite index in M₂(Ẑ). For GL₂, (I+e₁₂)−I=e₁₂ and e₁₂e₂₁=e₁₁ generate matrix units. In rank 1, B({1})=Ẑ.

### 7.2 Adelic algebra product comparison

For the adelic Galois image U of A over a number field with all geometric endomorphisms defined, and every open U′⊂U, B(U′) is closed and equals ∏_ℓ Z_ℓ[pr_ℓU′] inside End_Ẑ(T). Consequently its finite additive index in Z is the product of the local additive indices. This statement includes the distinction between the algebraic and closed generated algebras. (ry25, proof of Theorem 4.7 p261, product formula, ry25 lines 492–497; deligne84, Theorem 2.7, printed p39, deligne84 line 534, supplies the full-Galois commutant theorem; the product formula for every open subgroup is proved by the route below).

*Proof route.* By the imported Serre independence theorem, after a finite number-field extension the image is a product V=∏V_ℓ, open in U. Every open U′⊂U contains an open product W=∏W_ℓ inside V: shrink finitely many local factors in a basic open neighborhood of 1. Each local algebra Z_ℓ[W_ℓ] is a free finite Z_ℓ-module of rank ≤(2g)². Nakayama chooses at most (2g)² generators from W_ℓ itself. Pad with identities and use the product W to assemble that many adelic group elements. They span ∏Z_ℓ[W_ℓ] over Ẑ, so B(W) is this product and is compact. Since [U′:W] is finite, a coset decomposition expresses B(U′) as a finite sum c_jB(W). It is the continuous image of a finite product of compact modules, hence compact and closed. Every closed Ẑ-submodule of ∏End_Zℓ(T_ℓ) equals the product of its coordinate projections: apply the native orthogonal prime idempotents, take finite sums, then take limits. The projections here are exactly Z_ℓ[pr_ℓU′]. Thus the algebraic finite-sum span equals the local product without silently defining brackets as closure.

*Needs:* §7.1; NeronModelsAndSemistableAbelianVarieties §6.0; pinned Ẑ product and prime-idempotent API.

**Checks.**

- The proof uses a product subgroup contained in U′; projecting U′ and taking a product without that argument is insufficient.

- For W product, the number of adelic generators is bounded by (2g)² even though there are infinitely many primes.

- The additive index is the product of local indices when all but finitely many equal 1.

- For a product W, the rank-one scalar algebras have local index 1 and total index 1. Local indices 2 at ℓ=2 and 3 at ℓ=3, and 1 elsewhere, give global index 6. Infinitely many index-2 factors would give infinite index.

### 7.3 Integral centralizer reduction

Choose an embedding K̄→ℂ, L=H₁(A(ℂ),ℤ), E₀=End_ℤ(L), and generators e₁,…,e_r of E=End_K̄(A). Let ψ:E₀→E₀^r be f↦([f,e_i])_i, Z₀=kerψ, and W⊂E₀∨ the lattice spanned by the rows of ψ. Put sat(W)=(W⊗ℚ)∩E₀∨ and M_A=[sat(W):W]. Unlike the separable-order reduction in FaltingsFinitenessAndIsogenyTheorems R28.6.7, this specifies the exceptional set ℓ∤M_A and proves injectivity at every prime. For every prime ℓ the natural Z₀⊗𝔽_ℓ→End_𝔽ℓ(L/ℓL) is injective. For ℓ∤M_A its image equals Cent_End_𝔽ℓ(L/ℓL)(E⊗𝔽_ℓ), and Z₀⊗ℤ_ℓ identifies with the integral Tate centralizer. (ry25, Proof of Theorem 4.7 pp 262–263; ry25 line 542).

*Proof route.* Z₀ is a saturated kernel in the free abelian group E₀, so reduction is injective at every prime. Apply Smith normal form to ψ: outside the prime divisors of the torsion index of its row lattice, kernel formation commutes with reduction. Flat base change to Z_ℓ and the imported Betti–Tate comparison identify the integral kernel. The row lattice lies in E₀∨, not E₀.

*Needs:* AbelianSchemesAndArithmeticModuli §A5.1; AbelianSchemesAndArithmeticModuli §A6.7.

**Checks.**

- Injectivity is not restricted to the good primes; surjectivity is.

- For E=ℤ acting by scalars,ψ=0,M_A=1 and Z₀=E₀.

- For ψ:ℤ→ℤ, ψ(x)=2x, the kernel is 0 and row saturation index 2. Modulo 2 its kernel has dimension 1, so surjectivity fails; modulo 3 both kernels have dimension 0. For ψ=0, M_A=1 and the centralizer is the whole matrix ring.

### 7.4 Fixed-prime uniform index

For A/k over a number field with End_k=End_k̄, fix ℓ and d≥1. There is M_ℓ(A,k,d) such that for every open subgroup V of U_ℓ=ρ_ℓ(G_k) with [U_ℓ:V]≤d, the additive index[Z_ℓ:Z_ℓ[V]] is finite and≤M_ℓ, where Z_ℓ is the integral centralizer of End_k̄(A). (ry25, Theorem 4.7 proof, pp 260–262, fixed-prime paragraph; ry25 line 515).

*Proof route.* Every local open image subgroup is the image of the absolute Galois group of a finite extension. Number-field Tate comparison and semisimplicity, with all geometric End rational, give the full rational centralizer by the pinned double-centralizer theorem. Hence each integral index is finite. Compact matrix-group structure gives topological finite generation, and the pinned bounded-index subgroup theorem gives only finitely many subgroups to consider. Take the maximum of their indices.

*Needs:* FaltingsFinitenessAndIsogenyTheorems §R28.4.5–R28.4.6; §7.1; ArithmeticGaloisRepresentations §5.8; pinned finite-open-subgroup theorem; pinned finite semisimple double-centralizer theorem.

**Checks.**

- The maximum is over finitely many local open subgroups of index≤d, not over infinitely many finite extensions without identifying equal images.

- All geometric endomorphisms are defined over k, so it is unchanged by the extensions used.

- For a rank-one scalar action the unital local algebra is ℤ_ℓ and index 1 for every subgroup. In the additive compact group ℤ_ℓ, open subgroups are ℓⁿℤ_ℓ with index ℓⁿ, giving exactly 1+floor(log_ℓ d) choices at index≤d.

### 7.5 Uniform residual Tate refinement

Let A/k be over a number field with End_k=End_k̄ and d≥1. There is M′(A,k,d) such that for every finite extensionk′/k of degree≤d and every prime ℓ>M′, A[ℓ] is semisimple as an F_ℓ[G_k′]-module and End_Gk′(A[ℓ])=End_k̄(A)⊗𝔽_ℓ inside End_𝔽ℓ(A[ℓ]). The bound is simultaneous in k′ and ℓ. (ry25, Theorem 4.7 proof pp 261–262, invoking MW95 refinements Theorems1–2 and Corollary 1; ry25 line 548).

*Proof route.* Apply the quantitative isogeny method to A and its bounded powers to control both residual splitting and the exact reduction of End. In that argument retain [k′:ℚ]≤d[k:ℚ], so the exceptional-prime bound is simultaneous in both variables. Both conclusions of the residual refinement are required before the double-centralizer step.

*Needs:* §5.3; AbelianSchemesAndArithmeticModuli §A4.1; AbelianSchemesAndArithmeticModuli §A6.7.

**Checks.**

- The same M′ works for every extension of degree≤d.

- The conclusion includes both semisimplicity and the exact integral-End reduction commutant.

- For a non-CM elliptic curve and sufficiently large ℓ with full residual image, the commutant has dimension 1 over ℤ/ℓ, equal to End rank 1. A trivial residual image on (ℤ/2)² has commutant dimension 4; the threshold cannot be discarded.

### 7.6 Large-prime full integral algebra

For A/k and d as above, if ℓ>max(M_A,M′(A,k,d)), then for every open U′⊂U with [U:U′]≤d, Z_ℓ[pr_ℓU′]=Z_ℓ, where Z_ℓ is the integral End centralizer. This extends FaltingsFinitenessAndIsogenyTheorems R28.6.7 by uniformity over subgroups of index at most d. In particular all large-prime local indices are 1. (ry25, Theorem 4.7 proof pp 262–263, finite-field double centralizer and Nakayama step; ry25 line 591).

*Proof route.* The preimage of U′ in G_k has index≤d, so the residual refinement applies. A faithful semisimple module over the residual image algebra satisfies the finite-field double-centralizer theorem; its image algebra is the reduction of Z_ℓ. Apply Nakayama to the finite Z_ℓ-module quotient of Z_ℓ by the generated algebra. The threshold is M′, not the unrelated final adelic bound M.

*Needs:* §7.3; §7.5; FaltingsFinitenessAndIsogenyTheorems §R28.6.7; pinned finite semisimple double-centralizer theorem.

**Checks.**

- The large-prime threshold uses M′ and M_A.

- Nakayama is applied to a finite Z_ℓ-module quotient after equality modulo ℓ is established.

- For scalar geometric End and full residual GL₂(ℤ/ℓ), the generated residual algebra has dimension 4 and equals the centralizer. If the finite ℤ_ℓ quotient Q satisfies Q/ℓQ=0, Nakayama gives Q=0 and local index 1. Use the residual threshold M′.

### 7.7 Uniform integral Tate bound

For A/k over a number field with End_k=End_k̄ and every d≥1 there is M(A,k,d)≥1 such that for all open U′⊂U with [U:U′]≤d, the additive index[Z:B(U′)]≤M. Here T=∏T_ℓ(A), U=ρ(G_k), Z is its geometric-End centralizer, and B denotes the algebraic unital Ẑ-generated algebra defined above. (ry25, Theorem 4.7 pp 260–263, number-field part of proof; ry25 line 456).

*Proof route.* For each exceptional prime use the fixed-prime maximum M_ℓ. For every other prime the local algebra is the whole integral centralizer. The adelic algebra product comparison gives M=∏exceptional M_ℓ. This constant depends on A,k,d, not only on dimension.

*Needs:* §7.2; §7.4; §7.6; FaltingsFinitenessAndIsogenyTheorems §R28.6.7.

**Checks.**

- All but finitely many local indices equal 1.

- M may depend on A,k,d; the dimension-only constants of §5.5 are not asserted here.

- If the exceptional local bounds are 4 and 9 at 2 and 3 and 1 elsewhere, the adelic bound is 36. If U′=U and every local algebra is full, the index and the allowed bound are 1.

### Examples

- On Ẑ² with scalar End, B({1}) is scalar and has infinite index in M₂(Ẑ). For GL₂, (I+e₁₂)−I=e₁₂ and e₁₂e₂₁=e₁₁ generate matrix units. In rank 1, B({1})=Ẑ.

- For a product W, the rank-one scalar algebras have local index 1 and total index 1. Local indices 2 at ℓ=2 and 3 at ℓ=3, and 1 elsewhere, give global index 6. Infinitely many index-2 factors would give infinite index.

- For ψ:ℤ→ℤ, ψ(x)=2x, the kernel is 0 and row saturation index 2. Modulo 2 its kernel has dimension 1, so surjectivity fails; modulo 3 both kernels have dimension 0. For ψ=0, M_A=1 and the centralizer is the whole matrix ring.

- For scalar geometric End and full residual GL₂(ℤ/ℓ), the generated residual algebra has dimension 4 and equals the centralizer. If the finite ℤ_ℓ quotient Q satisfies Q/ℓQ=0, Nakayama gives Q=0 and local index 1. Use the residual threshold M′.

- If the exceptional local bounds are 4 and 9 at 2 and 3 and 1 elsewhere, the adelic bound is 36. If U′=U and every local algebra is full, the index and the allowed bound are 1.

### Dependencies

Layer 5; FaltingsFinitenessAndIsogenyTheorems R28.4.5–R28.4.6, R28.6.7; AbelianSchemesAndArithmeticModuli A4.1, A5.1, A6.7, A6.22; NeronModelsAndSemistableAbelianVarieties §6.0; ArithmeticGaloisRepresentations §5.8; the pinned double-centralizer, profinite-integer and open-subgroup theorems.

## Layer 8: Specialization and finitely generated fields

### 8.1 Tate comparison over finitely generated fields

If K/ℚ is finitely generated as a field, A,B/K are abelian varieties and ℓ is any prime, then Hom_K(A,B)⊗ℤ_ℓ→Hom_GK(T_ℓA,T_ℓB) is an isomorphism, and V_ℓA is semisimple. K need not be a number field. Finite generation as a ℚ-algebra is not the hypothesis. (noot95, Corollary 1.5 proof pp 164–165, citing Faltings–Wüstholz Chapter VI, section 3; noot95 line 164).

The function-field Tate comparison is a target of this subsection: for every finitely generated K/ℚ and every prime ℓ, the natural map Hom_K(A,B)⊗ℚ_ℓ→Hom_GK(V_ℓA,V_ℓB) is bijective. Its algebraicity assertion, that each invariant map is a ℚ_ℓ-linear combination of K-defined homomorphisms, is owned here (fw84 Chapter VI §3, uncertified; the use of that result is explicit in noot95 line 172). It is not inferred from equality of specialized Galois images.

*Proof route.* Spread A and B over a normal geometrically integral finite-type model over a number field, extending to abelian schemes on a dense open. Establish the function-field rational algebraicity theorem just stated, starting from the number-field comparison and the relative Hom scheme and descent of algebraic homomorphisms; this is the substantive function-field step. Independently, specialize A×B at a closed point with full image at the selected ℓ using the torsion specialization and Hilbertian contracts; number-field semisimplicity then transfers to its generic representation. Finally the integral Hom realization is saturated: if the realization of f is divisible by ℓⁿ, f kills A[ℓⁿ], so the quotient property factors f through [ℓⁿ] over K. A saturated inclusion of finite ℤ_ℓ-lattices which becomes bijective over ℚ_ℓ is bijective. None of these steps uses §8.2.

*Needs:* FaltingsFinitenessAndIsogenyTheorems §R28.4.5–R28.4.6; AbelianSchemesAndArithmeticModuli §§A6.25, A6.7, A3.3–A3.4, A4.1; NeronModelsAndSemistableAbelianVarieties §6.0; InverseGaloisAndArithmeticFundamentalGroups §IG.2.4 and §IG.2.6; ArithmeticGaloisRepresentations §§5.8, 6.4a.

**Checks.**

- K=ℚ(t) is included even though it is not finite as a ℚ-algebra.

- For number fields this specializes to the exact parent Tate comparison.

- For A=B=E/K with End_K(E)=ℤ, both equivariant End lattices have rank 1 at every ℓ, including ℓ=2,3. K=ℚ(t) has transcendence degree 1 and is not finite as a ℚ-algebra; it is included by field finite generation.

### 8.2 Endomorphism-preserving specialization

For A/K with K/ℚ finitely generated, after a finite extension making all geometric endomorphisms rational and a normal model over a number field, there is a closed fibre A₀/F such that the generic and special adelic Tate modules are identified, the specialized adelic image U_F embeds in U_K, and specialization identifies End_K̄(A) with End_F̄(A₀). At a chosen auxiliary prime ℓ₀ one may require equality of ℓ₀-adic images; simultaneous equality at every prime is not asserted. (noot95, §1.2, Proposition 1.3 and Corollary 1.5 pp163–165; ry25, Proposition 4.8 and proof pp263–265; noot95 line 130).

*Proof route.* Use compatible finite-étale torsion specialization to identify every Tate module and obtain adelic image inclusion. Full-image specialization at one auxiliary prime is supplied by the finite Frattini quotient and Hilbertianity. After making generic End rational, apply §8.1 to compare generic and special End after tensoring with ℤ_ℓ₀. The specialization cokernel is torsion-free by the exact supplier contract; equality of ranks then gives integral equality. A finite definition extension on the special fibre retains geometric End.

*Needs:* §8.1; NeronModelsAndSemistableAbelianVarieties §6.0; InverseGaloisAndArithmeticFundamentalGroups §IG.2.6; InverseGaloisAndArithmeticFundamentalGroups §IG.2.4; AbelianSchemesAndArithmeticModuli §A6.7; Hom-specialization saturation contract.

**Checks.**

- Preserve End and obtain adelic subgroup inclusion; only the selected ℓ₀ image is asserted equal.

- Integral End equality uses saturation in addition to equality after tensoring with Z_ℓ₀.

- An inclusion 2ℤ⊂ℤ becomes equality after tensoring with ℤ₃ but has cokernel ℤ/2; thus one-prime equality alone cannot prove integral End equality. Saturation excludes exactly this index-2 countermodel. A constant E over ℚ(t) specializes with End rank unchanged.

### 8.3 Supported connected adelic image

For the compact closed adelic Galois image U⊂∏_pGL(T_p), embed GL(T_p) as the subgroup acting trivially at all other primes. Put U_p=U∩GL(T_p), let G_p be its ℚ_p-Zariski closure, U_p⁰=U_p∩G_p⁰(ℚ_p), and W(U)=∏_pU_p⁰⊂U. The final inclusion follows by limits of finite products in the compact closed group U. U_p is a supported subgroup, not the projection pr_pU. (ry25, Proposition 4.8 pp 263–264, definitions preceding its statement; ry25 line 602).

*Proof route.* Intersect U with each single-prime factor and take the algebraic identity component of that factor’s closure. Finite products belong to U; their convergent net yields the full product inclusion. Use the native local Tate modules and ArithmeticGaloisRepresentations §7.6's Zariski-closure and identity-component interface. Its subgroup closure and geometric component conventions apply over ℚ_p. The identity component is the geometric algebraic identity component, evaluated on ℚ_p-points.

*Needs:* §7.1; NeronModelsAndSemistableAbelianVarieties §6.0; ArithmeticGaloisRepresentations §7.6.

The API records the following facts.

- The p-component is U_p∩G_p⁰(ℚ_p), with U_p supported at p.

- W(U) is a compact subgroup contained in U.

- If U=∏V_p and each V_p has connected Zariski closure, W(U)=U.

- If V=∏V_p⊂U and each V_p has connected closure, then V⊂W(U).

- Every element of W(U) commutes with native geometric End whenever End is defined over K.

- Two supported connected product subgroups are equal when every supported local identity-component subgroup agrees; the construction does not depend on an ordering of the primes.

**Checks.**

- For U diagonally equal to{±1} at two primes and trivial elsewhere, each supported U_p is trivial, so W(U)=1 although both projections are nontrivial.

- For U=∏GL_n(Z_p), every local Zariski closure is GL_n and W(U)=U.

- For U supported at one odd prime with local group{±I}, its Zariski identity component is{I}, so W(U)=1.

- W({1})={1}.

- For the diagonal group {(1,1),(−1,−1)} at two distinct primes, both projections have order 2 but each supported subgroup and W have order 1. For a product of GL_n(ℤ_p), connected closures give W=U. A supported {±I} has W={I}.

### 8.4 Uniform supported-image Tate bound

Let K/ℚ be finitely generated, A/K with End_K=End_K̄, U its adelic image and W=W(U). For every d≥1 there is M(A,K,d)≥1 such that for each open W′⊂W with[W:W′]≤d, [Z:B(W′)]≤M, with the same geometric-End centralizer Z. (ry25, Proposition 4.8 proof pp 264–265; ry25 line 620).

*Proof route.* Specialize to A₀/F preserving End and adelic Tate modules. Replace F by a finite extension so its image V is a product of its local projections with connected closures, using NeronModelsAndSemistableAbelianVarieties §6.0. Each local V_p is then supported in U, hence V⊂W. For W′ of index≤d, V∩W′ has index≤d in V. Apply the number-field theorem to V∩W′ and use B(V∩W′)⊂B(W′).

*Needs:* §8.2; §8.3; §7.7; NeronModelsAndSemistableAbelianVarieties §6.0.

**Checks.**

- A specialized product V⊂U has each factor supported in U, hence V⊂W(U).

- The subgroup V∩W′ has index≤d in V.

- For V⊂W and W′ of index 2, the injection V/(V∩W′)→W/W′ gives index at most 2; it is 1 when V⊂W′ and 2 when V maps onto the quotient. For V={1} both sides give 1≤2.

### 8.5 Uniform finitely-generated-field Tate bound

Let K/ℚ be finitely generated, A/K with End_K=End_K̄, U its adelic image and Z its geometric-End centralizer. For every d≥1 there is M(A,K,d)≥1 such that every open U′⊂U with [U:U′]≤d satisfies [Z:B(U′)]≤M. This is the full finitely-generated-field form of ry25 Theorem 4.7. (ry25, Theorem 4.7 p260 and deduction from Proposition 4.8 pp 263–265; ry25 line 652).

*Proof route.* Set W′=W∩U′. It is open in W and [W:W′]≤[U:U′]≤d. Apply the supported-image bound, then use B(W′)⊂B(U′)⊂Z to decrease the additive index.

*Needs:* §8.4; §8.3.

**Checks.**

- W∩U′ is open in W with index≤d even when W is not open in U.

- Generated-algebra inclusion can only decrease the additive index in Z.

- In ℤ with W=2ℤ and U′=3ℤ, W∩U′=6ℤ and [W:6ℤ]=3=[ℤ:3ℤ]. For lattice inclusions 6ℤ⊂3ℤ⊂ℤ, the ambient indices decrease 6→3, fixing the direction used for the generated algebras.

### Examples

- For A=B=E/K with End_K(E)=ℤ, both equivariant End lattices have rank 1 at every ℓ, including ℓ=2,3. K=ℚ(t) has transcendence degree 1 and is not finite as a ℚ-algebra; it is included by field finite generation.

- An inclusion 2ℤ⊂ℤ becomes equality after tensoring with ℤ₃ but has cokernel ℤ/2; thus one-prime equality alone cannot prove integral End equality. Saturation excludes exactly this index-2 countermodel. A constant E over ℚ(t) specializes with End rank unchanged.

- For the diagonal group {(1,1),(−1,−1)} at two distinct primes, both projections have order 2 but each supported subgroup and W have order 1. For a product of GL_n(ℤ_p), connected closures give W=U. A supported {±I} has W={I}.

- For V⊂W and W′ of index 2, the injection V/(V∩W′)→W/W′ gives index at most 2; it is 1 when V⊂W′ and 2 when V maps onto the quotient. For V={1} both sides give 1≤2.

- In ℤ with W=2ℤ and U′=3ℤ, W∩U′=6ℤ and [W:6ℤ]=3=[ℤ:3ℤ]. For lattice inclusions 6ℤ⊂3ℤ⊂ℤ, the ambient indices decrease 6→3, fixing the direction used for the generated algebras.

### Dependencies

Layer 7; AbelianSchemesAndArithmeticModuli A4.1, A6.7, A6.25 with Hom-specialization saturation; NeronModelsAndSemistableAbelianVarieties §6.0; ArithmeticGaloisRepresentations §§6.4a, 7.6; InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6; number-field Tate comparison for the starting case of §8.1.

## Downstream consumers

ComplexMultiplicationAndExplicitReciprocityPartII consumes the geometric dimension-only isogeny estimate and the polarization-free order bounds. Quantitative moduli and unlikely-intersection arguments consume the Rosati discriminant, weak Siegel bounds and quadratic elliptic rate. The uniform integral Tate hypothesis in Richard–Yafaev consumes §7.7 and §§8.4–8.5 with the geometric-End centralizer and the algebraic finite span. A group-image conclusion requires additional subgroup theory; it does not follow from equality of generated algebras.

## Worked examples

The product-polarized square of a non-CM elliptic curve connects the trace and arithmetic layers. End⁰=M₂(ℚ), Tr_A(X)=2tr(X), q(X)=2tr(XXᵀ). The four matrix units are orthogonal with squared length 2, giving D_λ=2⁴=16. The regular trace is 2tr(X), its ordinary Gram determinant is −16, and its absolute value satisfies (2g)^m|disc|=4⁴·16=4⁴·16=m^mD_λ. For S=[[1,N],[0,1]], degree S=1 and q(S)=2N²+4; at N=1 these are 1 and 6. This fixes the failure of a reverse degree-to-length inequality. Passing to the Gaussian order gives ordinary disc −4, Rosati determinant 4 and self-Hom cross-discriminant 16; none of these three invariants is interchangeable.

For a bounded-index subgroup the adelic argument has two independent finite operations. At fixed ℓ, compact matrix-group finite generation bounds the number of local open subgroups of index at most d. Beyond max(M_A,M′), residual semisimplicity, centralizer reduction and Nakayama make the local algebra index 1. If the two exceptional local bounds are 4 and 9, the adelic bound is 36. In a specialization the supported product can be strictly smaller than the projected product: a two-prime diagonal group of order 2 has trivial supported factors. The proof uses the independent specialized product inside the generic image before taking a bounded-index intersection.

## References


- **mw95**: David Masser and Gisbert Wüstholz, [Factorization estimates for abelian varieties](https://www.numdam.org/item/PMIHES_1995__81__5_0.pdf). Publications Mathématiques de l’IHÉS 81 (1995), 5–24.

- **mw94-preprint**: David Masser and Gisbert Wüstholz, [Endomorphism estimates for abelian varieties](https://archive.mpim-bonn.mpg.de/1350/1/preprint_1991_51.pdf). MPI/91-51 author preprint; published Math. Z. 215 (1994),641–653. Locators for the MPI texts use the internal preprint pagination, independently of the published version.

- **mw93-isog-preprint**: David Masser and Gisbert Wüstholz, [Isogeny estimates for abelian varieties, and finiteness theorems](https://archive.mpim-bonn.mpg.de/1497/1/preprint_1991_28.pdf). MPI/91-28 author preprint; published Annals 137 (1993),459–472. Locators for the MPI texts use the internal preprint pagination, independently of the published version.

- **mz20**: David Masser and Umberto Zannier, [Abelian varieties isogenous to no Jacobian](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p07-s.pdf). Annals of Mathematics191 (2020),635–674.

- **ts18**: Jacob Tsimerman, [The André-Oort conjecture for A_g](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p02-p.pdf). Annals of Mathematics187 (2018),379–390.

- **ry25**: Rodolphe Richard and Andrei Yafaev, [Generalised André-Pink-Zannier conjecture for Shimura varieties of abelian type](https://www.numdam.org/item/10.1007/s10240-025-00154-4.pdf). Publications Mathématiques de l’IHÉS141 (2025),249–331.

- **gr14**: Éric Gaudron and Gaël Rémond, [Théorème des périodes et degrés minimaux d’isogénies](https://lmbp.uca.fr/~gaudron/art11.pdf). Commentarii Mathematici Helvetici89 (2014),343–403.

- **noot95**: Rutger Noot, [Abelian varieties—Galois representation and properties of ordinary reduction](https://www.numdam.org/item/CM_1995__97_1-2_161_0.pdf). Compositio Mathematica 97 (1995),161–171.

- **bost95**: Jean-Benoît Bost, [Périodes et isogénies des variétés abéliennes sur les corps de nombres](https://www.numdam.org/item/SB_1994-1995__37__115_0.pdf). Astérisque 237 (1996), exp. 795, pp. 115–161 (1995 lecture).

- **mw93-periods**: David Masser and Gisbert Wüstholz, [Periods and minimal abelian subvarieties](https://annals.math.princeton.edu/1993/137-2/p05). Annals 137 (1993),407–458. Cited by its theorem locators; the period-theorem restatement is mw94-preprint, §4, internal p. 6, mw94-preprint line 228.

- **mw95-refine**: David Masser and Gisbert Wüstholz, [Refinements of the Tate conjecture for abelian varieties](https://www.degruyterbrill.com/document/doi/10.1515/9783110889437.211/pdf). In Abelian varieties, de Gruyter (1995), chapter beginning p211. Cited by Theorems 1–2 and Corollary 1, pp. 211–224; the simultaneous residual application is ry25 lines 483, 548.

- **igusa**: Jun-ichi Igusa, [Theta Functions](https://doi.org/10.1007/978-3-642-65315-5). Springer (1972). Cited by locator as an uncertified publisher source.

- **fw84**: Gerd Faltings and Gisbert Wüstholz, editors, [Rational points, Chapter VI](https://doi.org/10.1007/978-3-322-83918-3). Vieweg (1984), Chapter VI, section 3. Cited by locator as an uncertified publisher source.

- **deligne84**: Pierre Deligne, [Preuve des conjectures de Tate et de Shafarevitch](https://www.numdam.org/item/SB_1983-1984__26__25_0.pdf). Astérisque121–122 (1985), exposé616,25–41.
