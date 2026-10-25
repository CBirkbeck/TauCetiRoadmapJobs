# Roadmap: relative endoscopy for unitary Friedberg–Jacquet periods

**Summary.** This Part II develops relative endoscopy for the infinitesimal symmetric space of (U(W1⊕W2), U(W1)×U(W2)), from signed contractions and ordinary unitary endoscopy to cyclic spherical transfer and the unramified lattice-unit fundamental lemma in every residue characteristic. It builds the Hermitian spherical module, regularized germs and local reductions needed to connect an independent Jacquet–Rallis comparison to that theorem.

## Scope and ownership

EndoscopicTransferAndUnitaryTraceComparison supplies ordinary unitary Lie-algebra endoscopy in §§1.17, 2.12 and 4.4–4.7 and stops before symmetric-space endoscopy. This Part II owns the relative symmetric-space geometry and transfer relation, the Hermitian spherical module on X_n, the germ/descent reductions, the Friedberg–Jacquet unit theorem and the Fourier-defined full-module operator. The Jacquet–Rallis inputs consumed here are the explicit supplier gaps below; their allocation to a separate continuation requires an ownership decision and is not assumed.

Signed Hermitian carriers and integral lattice duals belong to GeometryOfNumbersAndQuadraticArithmetic §§2.7 and 2.9; its §3.2 owns general representation densities. The finite self-dual-overlattice count and its normalization against that density are the relative adapter of Layer 4. Quotient measures belong to AdelicAlgebraicGroups §2.2, spherical Satake and determinant-twisted Levi descent to SmoothRepresentationsOfLocalGroups §§SR.4.1 and SR.4.3, and Weil operators and the Weil index to MetaplecticAutomorphicForms §§2.1 and 2.5. None is constructed a second time. The matrix Hermitian-product and characteristic-polynomial identities used for coordinates are already in the pinned Mathlib and remain background facts here.

Unrestricted relative smooth transfer is open in Leslie19 Conjecture 4.4, p. 15, and full-module orbital transfer with augmented factors is open in Leslie25 Remark 3.7, p. 27; neither is a target. Layer 5 constructs the precisely defined Fourier operator alone. Exchanging contractions requires an explicit transport of nonisometric form data and is not an additional theorem of this roadmap.

## Conventions

F is a nonarchimedean local field of characteristic zero. Layers 0–1 allow a quadratic étale algebra E/F with involution z↦z̄, including F×F; later local germ theory allows every quadratic field extension. Only the spherical parts of Layers 2–5 and the Lie-descent application assume an unramified quadratic field extension. The spaces W1,W2 are nondegenerate Hermitian E-modules of the same finite rank n; forms are conjugate-linear in the first variable. All carriers lie in fixed universes, and test functions are complex-valued locally constant functions with compact support in their stated domain.

The adjoint X^τ:W1→W2 satisfies h1(Xv,w)=h2(v,X^τw). The block representation is δ(X)=[[0,X],[−X^τ,0]], with action (g1,g2)X=g1Xg2⁻¹. Its contractions are r1(X)=−XX^τ and r2(X)=−X^τX. Herm(W) denotes self-adjoint endomorphisms, rather than the skew-adjoint Lie algebra; multiplication by a chosen nonzero trace-zero element of E identifies these representations for ordinary endoscopy. In rank one with Wi=⟨ai⟩, X^τ=(a1/a2)z̄ and r_i(z)=−(a1/a2)N(z). For E=F×F, norm is (u,v)↦uv and U(W)=GL_n; there is one form class, and no proper elliptic block datum with a,b>0. The symmetric pair is then (GL_(2n),GL_n×GL_n), the linear Friedberg–Jacquet setting.

Haar measures are fixed before quotient integration. Regular centralizers have maximal compact subgroup of volume one, transported through the specified stabilizer isomorphisms. Quotients use integration in stages, so scaling a torus Haar measure by c>0 scales either orbital integral by c⁻¹. For unramified E/F write π for a common uniformizer, q=#k_F≥2, V_n=(E^n,I_n), Λ_n=O_E^n and K_n,E=GL_n(O_E); hyperspecial volumes are one. Thus q_E=q² and |π|_E=q⁻². No spherical theorem excludes residue characteristic two. Proper endoscopic decompositions have a,b>0 and n=a+b; rank zero enters as GL_0=U_0={1} at n=1 in the adjacent-rank comparison.

The quadratic character is η=η_E/F (trivial for split E). In the cyclic determinant factor use ordered columns v,xv,…,x^(n−1)v and block volume form Ωa∧Ωb. Set D_ab=∏(λa−λb); disjoint spectra make D_ab≠0. The general cyclic ratio is η((−1)^(ab)D_ab); unramified η(−1)=1 removes the sign in the spherical application. Weil transforms use a conductor-O_F additive character ψ and self-dual measures for the trace pairing: the Hermitian kernel is ψ(Tr_E/F h(u,w)); the linear kernel is ψ(v*w+w*v). The raw regularized germ has no finite-Fourier averaging built into it.

**Checks.**

- With standard rank-one forms X=1, δ²=−I and r_i(1)=−1. A unit c with N(c)=−1 gives r_−(c)=1=r_+(1); the pinned norm theorem supplies c even at p=2.
- For a=b=1 and λa−λb=π, the unramified nice-match factor is η(π)|π|=−q⁻¹. Reversing the ordered cyclic columns instead contributes η(−1), which can be −1 for ramified E.
- For q=2, q_E=4 and |π|_E=1/4; rescaling the stabilizer measure from 1 to 2 changes a unit orbital value from 1 to 1/2. These distinguish the field and measure normalizations.

## Exact supplier contracts

### From Mathlib

The pin is 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Consume `Matrix.conjTranspose` (Mathlib/LinearAlgebra/Matrix/ConjTranspose.lean:43), `Matrix.IsHermitian`, `Matrix.isHermitian_mul_conjTranspose_self`, and `Matrix.isHermitian_conjTranspose_mul_self` (Mathlib/LinearAlgebra/Matrix/Hermitian.lean:44,285,289), `Matrix.charpoly` and `Matrix.charpoly_mul_comm` (Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean:132,271), `MvPolynomial.hsymm` (Mathlib/RingTheory/MvPolynomial/Symmetric/Defs.lean:312) and `MvPolynomial.bind₁` (Mathlib/Algebra/MvPolynomial/Monad.lean:67). Conjugate transpose transposes and applies star; Hermitian means Aᴴ=A and imposes no arithmetic or measure structure. The square product charpoly theorem is over a commutative ring. `HasStrictFDerivAt.implicitFunction` (Mathlib/Analysis/Calculus/Implicit.lean:464) applies to a strict derivative of full range with complemented kernel; finite-dimensional smooth torsor coordinates provide these hypotheses.

### From Tau Ceti

The pin is a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Consume `TauCeti.map_normUnits_unitFiltration` and `TauCeti.mem_normGroup_iff_dvd_normalizedValuation` (TauCeti/NumberTheory/LocalField/Norm/Unramified/Basic.lean:126,158): they require a finite-dimensional unramified extension of nonarchimedean local fields with compatible valuations and assert norm surjectivity at every unit-filtration depth and the valuation criterion for norms. At depth zero this gives N(O_E×)=O_F×; it supplies no ramified-unit norm assertion.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §1.1 (crossed-module and nonabelian Galois cohomology), §1.5 (abelianized cohomology), §1.14 (rational classes in a stable class), §1.17(a)–(c) (unitary matching, inv across pure forms and its norm coordinates), §1.4 with §1.17(c) (local unitary elliptic data), §3.3 (characteristic-coefficient quotient), §§2.1 and 2.4 (convergence, normalized ordinary orbital integrals, stable and κ sums and basepoint change), §§2.9 and 2.11 (Lie factors and ordinary transfer including unmatched vanishing), §4.7 (ordinary Lie smooth transfer for any residue characteristic), and §4.9(b) (unramified spherical base change). Split E uses the GL_n specializations, not a two-form unitary classification. The local unitary factor formula in §2.12 is restricted to unramified E and odd p; its larger scope is a gap, not an import.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-local-comparison): Part II relative comparison continuation (local Jacquet–Rallis theory): Supply the augmented and block/group Jacquet–Rallis invariant quotients, regular matching across all pure forms, η(det)-twisted orbital distributions, the cyclic factors (4.1) and (4.6), local smooth transfer with partial Fourier compatibility, and the product-to-conjugation identities (7.5)–(7.7), with the measures and unmatched-zero clauses of Leslie25 §§4.1 and 7.1–7.2.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-weil-descent): Part II relative comparison continuation (Weil descent): Descend the Weil operators supplied by MetaplecticAutomorphicForms §§2.1 and 2.5 to the linear and unitary orbital-image spaces and prove agreement on their intersection, with self-dual trace-pairing measures as in BP21 Proposition 1, p. 7.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:jr-product-base-change): Part II relative comparison continuation (product-group spherical comparison): Prove Leslie25 Theorem 11.1, p. 78, for GL_m×GL_(m+1) in every m≥0 with its factor Ω, spherical base change and all nonreference-form zero components, from an independent spectral proof that does not assume the Friedberg–Jacquet unit theorem.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:unitary-factor-all-quadratic): §2.12 (extension of its ordinary unitary factor formula): For every quadratic extension of characteristic-zero p-adic fields, including p=2 and ramified E, identify the §2.9 factor for U(V_a)×U(V_b) with κ(inv(δ,δ′))η(D(δ))|D(δ)|_F in the normalization of Leslie25 (2.7), p. 19.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §2.7 `IntegralHermitianLattice.ofCarrier` and `IntegralHermitianLattice.dual`, §2.9 `SignedHermitianSpace` and its finite-dimensional adjoint, and §3.2 for local Hermitian representation densities. The carrier/adjoint is general over a field with involution; §2.9's local classification does not include dyadic fields. Generic densities do not by themselves supply the congruence-orbit or unit-vector transitivity contracts below.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:hermitian-field-classification): §2.9 (local classification beyond odd residue characteristic): Classify nondegenerate Hermitian spaces over every quadratic extension of characteristic-zero local fields by dimension and discriminant, including dyadic and ramified extensions, as used in Xiao18 §2.2, p. 5, and Leslie19 Lemma 4.6, p. 16.

**Checks.**

- At rank zero the discriminant is 1 and there is a single form, not two.
- At positive rank one, ⟨1⟩ and ⟨ε⟩ have distinct discriminants in F×/N(E×), so they cannot be identified even when their unitary groups are isomorphic.
- Over F×F the norm (u,v)↦uv is onto and there is one Hermitian class in each rank; a two-class field statement must not be applied there.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:unramified-hermitian-lattice-orbits): §2.7 (unramified integral Hermitian isometry classes): For unramified quadratic E/F in every residue characteristic prove the unique dominant-integral congruence representatives K_n,E∗π^λ of Leslie25 (3.7), p. 26, including that every self-dual rank-n lattice is integrally isometric to O_E^n with Gram I_n.

**Checks.**

- In rank one the classes π^jOF× for j=0,1,−1 have distinct valuations and none may be dropped.
- A self-dual rank-one lattice has unit Gram determinant; Gram π has dual quotient of O_E-length 1 and is not self-dual.
- At residue cardinality q=2, N(F₄×)=F₂× and Tr(F₄/F₂) is onto; division by 2 is unavailable integrally and is not used.

What GeometryOfNumbersAndQuadraticArithmetic must provide (gap:unramified-unit-vector-transitivity): §2.7 (unit vectors in unramified self-dual lattices): For unramified quadratic E/F in every residue characteristic prove U(Λ_n) transitive on {w∈Λ_n:h(w,w)=1}, including n=1 and p=2, as used in BP21 §2, Lemma 1, pp. 4–5.

**Checks.**

- In rank one any norm-one unit w is taken to 1 by multiplication by w⁻¹∈U(Λ1).
- For h(w,w)=1 the integral projector p(v)=w h(w,v) has p(w)=w and p²=p, including residue characteristic two.
- The vector 0 has norm 0, so it is excluded; enlarging the claim to all vectors would put it in the orbit of a unit vector, which is impossible.

### From TauCetiRoadmap.AdelicAlgebraicGroups

Consume §2.2, quotient-measure, Weil's formula for integrable functions and quotient measures in stages. The groups are second countable, locally compact Hausdorff, subgroups closed, and restricted modular characters agree. Local reductive groups and their regular centralizer tori are unimodular; these hypotheses give the quotient measures used here. Local sections and surjectivity on compact test functions are proved in Layer 0.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume §SR.4.1, satake-isomorphism, and §SR.4.3, parabolic-descent. For unramified E/F the latter supplies normalized GL_n(E) descent with twists |det m1|_E^(b/2)|det m2|_E^(a/2) and Satake substitution Z_i↦q⁻ᵇX_i, Z_j↦q⁻ᵃY_j. Its F-version uses q⁻ᵇ/² and q⁻ᵃ/². These group-theoretic maps are inputs; Layer 3 constructs additive Lie descent and compares it to them.

### From TauCetiRoadmap.SchemeAndStackFoundations

Consume §1.24, affine Galois descent of the split-coordinate equivariant coordinate-algebra isomorphisms. The invariant-ring proof in Layer 0 is given directly and invokes no unassigned Igusa criterion.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume RG2.0, smooth-group-analytic-charts, for characteristic-zero analytic coordinates on smooth local group points. Together with the explicit smooth contraction torsor and the pinned implicit function theorem this supplies local sections; smoothness alone does not assert surjectivity on all rational points.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

Consume §2.1 `weilIndex` and §2.5 `weil_generators`, retaining the specified Weyl element, Weil scalars and self-dual polar-pairing measures. The quadratic spaces here have even F-dimension and are the hyperbolic linear form q(v,v*)=v*v and the Hermitian norm form q(w)=h(w,w). Agreement after descent to orbital images remains gap:jr-weil-descent, rather than a second construction of their Weil operators.

## How to read the build

Layer 0 constructs contractions, quotients and fibre integration, then proves the orbital comparison. Layer 1 pulls back the supplied ordinary endoscopic data and proves transfer away from the singular support. Layer 2 builds the full spherical module and compares Satake substitutions. Layer 3 proves the germ and Lie-descent implications and acts on the sum of orbital-image spaces. Layer 4 uses the independent product-group comparison, then the augmented and cyclic results, and finally compact determinant grades to prove the relative lattice-unit theorem. Layer 5 transports the full spherical operator through Hironaka's transform. Supplier gaps are prerequisites of the individual consumers; the product-group proof must not consume the relative lattice-unit theorem.

## Layer 0: the symmetric representation and contraction

Construct the off-diagonal representation, its invariant quotients and stabilizer identifications; establish local sections and compact fibre integration, then compare relative and ordinary orbital integrals.

### 0.1 The off-diagonal unitary representation

For nondegenerate Hermitian E-spaces W1,W2 of the same dimension n, put W=W1 ⊕ W2 and θ=Ad(1,-1). Identify the (-1)-eigenspace in Lie U(W) with Hom_E(W2,W1) by X mapping to the block matrix [[0,X],[-X^τ,0]], where h1(Xv,w)=h2(v,X^τ w). Its fixed-group action is (g1,g2).X=g1 X g2⁻¹. For split E=F×F, write each Hermitian module as M_i⊕M_i* with pairing h((v,ℓ),(w,m))=(ℓ(w),m(v)). Its unitary group is GL(M_i), and a Hom map is represented by paired maps A:M2→M1 and B:M1→M2; the adjoint exchanges the paired maps. This supplies the split model directly from finite-dimensional duality; the field-valued SignedHermitianSpace carrier is used only in the nonsplit case.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Section 2.1, pp. 13–14; Section 1.2, pp. 3–4).

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §2.9; Mathlib `Matrix.conjTranspose`.

A proof route solves the skew-adjoint block equations using the field adjoint for nonsplit E and the displayed dual-pair model for split E. Transport the fixed-group conjugation action through the block identification.

The construction has the following API.

- Send X to [[0,X],[-X^τ,0]] in Lie U(W).
- The top-right projection and the block embedding are inverse F-linear maps between the (-1)-eigenspace and Hom_E(W2,W1).
- The formula (g1,g2).X=g1 X g2⁻¹ defines an F-linear algebraic representation.
- The adjoint of g1 X g2⁻¹ is g2 X^τ g1⁻¹.

**Checks.**

- For standard rank one, X=1 gives δ=[[0,1],[−1,0]] and δ* = −δ; using a positive lower-left entry would give δ*=δ.
- In the split model X=(u,v), the two GL_n actions become (gAh⁻¹,hBg⁻¹); for n=1, (g,h)=(2,1) sends (A,B)=(1,1) to (2,1/2), preserving AB=1.
- For n=2, standard X=diag(1,π) gives δ²=diag(−1,−π²,−1,−π²); the nonsigned off-diagonal model gives the opposite square.

Its direct consumers are FJ.0/contractions, FJ.1/relative-datum.

### 0.2 The two signed contractions

Define r1(X)=-X X^τ in Herm(W1) and r2(X)=-X^τ X in Herm(W2). Here Herm(Wi) is the space of self-adjoint endomorphisms for hi. Both are F-polynomial maps. r1 is equivariant for U(W1) and invariant under U(W2); r2 has the opposite equivariance. In standard Gram coordinates the formulas use Matrix.conjTranspose, not plain transpose.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Section 2.1, equation (2.1), p. 14).

*Needs:* §0.1 (FJ.0/symmetric-representation); Mathlib `Matrix.IsHermitian`; Mathlib `Matrix.isHermitian_mul_conjTranspose_self`; Mathlib `Matrix.isHermitian_conjTranspose_mul_self`.

One proof route is the following. Apply the adjoint to both products, using the involution and reversed multiplication. Use adjoint_action to verify the two transformation laws.

The construction has the following API.

- r1(X)=-X X^τ; with standard Gram matrix this is -(X * X.conjTranspose).
- r2(X)=-X^τ X; with standard Gram matrix this is -(X.conjTranspose * X).
- r1(g1 X g2⁻¹)=g1 r1(X) g1⁻¹; the right version is analogous.
- r2(X)=r1(X^τ) when W1 and W2 are exchanged.
- Both contractions send zero to zero.
- In standard Gram coordinates, r1(X) is Matrix.IsHermitian.
- In standard Gram coordinates, r2(X) is Matrix.IsHermitian.
- For a square standard-coordinate X over a commutative star ring, the two signed contractions have the same Matrix.charpoly, by Matrix.charpoly_mul_comm applied to -X and X*.

**Checks.**

- For standard rank-one forms, r1(1)=−1; the positive Gram map would give 1.
- For W1=⟨1⟩ and W2=⟨ε⟩ with ε a nonnorm, r1(1)=−ε⁻¹ and the nonzero image is −ε⁻¹N(E×), the other norm class from −N(E×).
- For standard X=diag(1,π), both contractions are diag(−1,−π²), with characteristic polynomial (T+1)(T+π²).
- For split E=F × F and X=(u,v) in rank one, X^τ=(v,u) and both contractions are −uv; (1,0) maps to zero and is singular.

Its direct consumers are FJ.0/quotients, FJ.0/regular-invertible, FJ.1/relative-datum, FJ.4/contraction-sign-comparison.

### 0.3 Invariant quotients of the symmetric representation

The morphism r1 realizes Hom_E(W2,W1)//U(W2) as Herm(W1), equivariantly for U(W1). Taking the quotient by both unitary groups gives affine n-space: the quotient map is the n nonleading coefficients of charpoly(r1(X)). These are categorical quotients of F-varieties, not assertions that every F-point has a preimage.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Proposition 2.1 and Lemma 2.2, p. 14).

*Needs:* §0.2 (FJ.0/contractions); SchemeAndStackFoundations §1.24; Mathlib `Matrix.charpoly`; EndoscopicTransferAndUnitaryTraceComparison §3.3.

One proof route is the following. Over a splitting field write the representation as (A,B), with the second GL_n acting by (Ah⁻¹,hB) and signed contraction −AB. On det(B)≠0, invariance gives P(A,B)=P(AB,I) for every invariant polynomial P. Both sides are polynomials, so density extends the identity to all pairs; conversely every polynomial in AB is invariant. The section Z↦(−Z,I) makes pullback injective. This directly identifies the invariant coordinate ring without using Igusa’s criterion. Take the remaining conjugation quotient by EndoscopicTransferAndUnitaryTraceComparison §3.3 and descend the equivariant coordinate-ring isomorphisms by SchemeAndStackFoundations §1.24.

**Checks.**

- For rank-one forms ⟨a1⟩,⟨a2⟩, χ(z)=−(a1/a2)N(z). Thus ⟨1⟩,⟨ε⟩ sends 1 to −ε⁻¹, rather than −1.
- Over the split algebra in rank one, (A,B)=(0,1) and (1,0) have the same invariant 0 but different orbits: a categorical quotient need not classify singular orbits.
- In rank two the section Z↦(−Z,I) gives −AB=Z, and charpoly(diag(1,π))=(T−1)(T−π); retaining only determinant would lose the trace 1+π.

### 0.4 Regular semisimplicity excludes singular Hom maps

For the symmetric representation, regular semisimple means a closed geometric orbit of maximal dimension. An element X is regular semisimple exactly when r1(X) is an invertible regular semisimple Hermitian endomorphism. In particular X is invertible and the stabilizer in U(W1) × U(W2) is a rank-n torus. The off-diagonal block has characteristic polynomial charpoly(r1(X))(T^2).

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Section 2.1 before Proposition 2.1 and Lemma 2.4, pp. 13–15).

*Needs:* §0.2 (FJ.0/contractions); §0.3 (FJ.0/quotients); EndoscopicTransferAndUnitaryTraceComparison §1.17; Mathlib `Matrix.charpoly_mul_comm`.

One proof route is the following. In split coordinates identify closed regular orbits with separable nonzero eigenvalues of the product. Compute the block characteristic polynomial by a Schur-complement identity; a zero product eigenvalue produces a repeated zero block root. Descend the criterion and use the centralizer description from EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.14, 1.17.

**Checks.**

- In rank one, r=−N(z) and charpoly δ=T²+N(z); z=0 gives T² and is not regular semisimple.
- For standard X=diag(1,π), charpoly r=(T+1)(T+π²) and charpoly δ=(T²+1)(T²+π²); both eigenvalues of r are distinct and nonzero.
- In the split rank-two model A=diag(1,0), B=I gives charpoly δ=T²(T²+1). Although −AB has distinct eigenvalues, its zero eigenvalue prevents symmetric regular semisimplicity.

### 0.5 The contraction torsor and rational-class kernels

On invertible Hom maps, r1 is a U(W2)-torsor as a morphism of F-varieties over Herm(W1)^invertible. On F-points its image is the open-and-closed norm-form component Ω(W1,W2); no rational surjectivity onto all invertible Hermitian endomorphisms is asserted. At X, projection (g1,g2) to g1 identifies H_X with T_r1(X); its inverse sends t to (t,X⁻¹tX). For regular semisimple X it induces D(H_X,U(W1) × U(W2);F) isomorphic to D(T_r1(X),U(W1);F), compatibly with inv and the rational orbits inside a stable class.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Lemma 2.3, p. 15; Leslie19 Lemmas 3.6 and 3.9, pp. 12–13; Leslie19, Lemmas 3.6 and 3.9, pp. 12–13).

*Needs:* §0.4 (FJ.0/regular-invertible); EndoscopicTransferAndUnitaryTraceComparison §1.1; EndoscopicTransferAndUnitaryTraceComparison §1.5; EndoscopicTransferAndUnitaryTraceComparison §1.17; EndoscopicTransferAndUnitaryTraceComparison §1.14; gap:hermitian-field-classification.

One proof route is the following. Check the geometric fibers are free transitive right U(W2)-orbits, then descend the torsor. Solve tX=Xg2 to obtain the inverse stabilizer map. Use the determinant description of unitary H1 to identify the two kernel conditions; the two component obstruction maps agree on H1(H_X).

**Checks.**

- For unramified standard rank one, −N(E×) consists of even valuations: −1 has a lift and −π does not, though the algebraic quotient is surjective after separable closure.
- For rank one with W2=⟨ε⟩, r(1)=−ε⁻¹. The fibre is the translate of U(1), and the inverse stabilizer map t↦(t,t) projects back to t.
- In the split rank-one case, r(u,v)=−uv and the fibre over T≠0 is {(u,−T/u):u∈F×}; the action of F× is free and transitive.

### 0.6 Local sections, fibre integration and invariant cutoffs

For the contraction torsor r:Iso_E(W2,W1)(F)→Ω(W1,W2), every point of Ω has a neighbourhood admitting an analytic section, and integration over the right U(W2)(F)-fibres maps compact locally constant tests onto C_c^∞(Ω). For every closed regular orbit O and every f in C_c^∞(Hom_E(W2,W1)), there is a compact nonsingular test equal to f on an open neighbourhood of O.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Section 2.1, p. 16, before Lemma 2.5; Leslie19, Appendix A, Proposition A.3, pp. 25–26).

*Needs:* §0.5 (FJ.0/torsor); §0.3 (FJ.0/quotients); §0.4 (FJ.0/regular-invertible); ReductiveGroupsPartII §RG2.0 (smooth-group-analytic-charts); Mathlib `HasStrictFDerivAt.implicitFunction`; AdelicAlgebraicGroups §2.2 (quotient-measure).

One proof route is the following. In smooth local coordinates the torsor projection has surjective differential; choose a linear complement to its kernel and apply the implicit function theorem. This constructs local analytic sections on the F-point image, including the split algebra. Cover the compact support of a target test by finitely many compact open trivializing sets; refine to disjoint compact open pieces. On each product chart lift using a compact open fibre subgroup J and the test 1_J/vol(J). Haar measure gives 0<vol(J)<∞, so the fibre integral is exactly the target test. Let χ be the full invariant quotient and choose a compact open B containing χ(O) inside the locus where the contracted characteristic polynomial is separable with nonzero constant coefficient. Then U=χ⁻¹(B) is clopen, lies in the nonsingular locus by regular-invertible, and f·1_U is the required compact test. U itself need not be compact.

**Checks.**

- For unramified standard rank one, f=1_OE and B=OF× on the scalar invariant base give U=OE× and f·1_U=1_OE×. Its fibre integral is 1_OF× when vol U(1)=1.
- On a product chart B×J, the lift h(b)1_J(u)/vol(J) integrates to h(b)vol(J)/vol(J)=h(b); omitting the denominator rescales the answer if vol(J)=2.
- With the same rank-one f, cutting by determinant a unit removes 0 and retains the entire orbit r=−1. The uncut support OE is not compact as a subset of E× because it contains 0.

### 0.7 Relative orbital integrals

For f in C_c^∞(Hom_E(W2,W1)), regular semisimple X, Haar measures dh1,dh2 and dt on H_X, define RO(f,X)=integral over the left coset space of H_X in U(W1) × U(W2) of f(h1⁻¹ X h2) with quotient measure determined by dt and dh1 dh2. The integral is absolutely convergent. The torus measure is identified with the contraction centralizer measure through the specified projection.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Equation (2.3), p. 15; Section 1.5.4, pp. 11–12).

*Needs:* §0.5 (FJ.0/torsor); AdelicAlgebraicGroups §2.2 (quotient-measure); AdelicAlgebraicGroups §2.2 (Weil-integrable); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; §0.6 (FJ.0/fibre-integration).

One proof route is the following. Form the invariant quotient measure using the imported modular condition and specify dt. Obtain convergence from the closed regular orbit and compact support; transport the regular-orbit measure, using EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.9, 2.11.

The construction has the following API.

- The displayed quotient integral with the supplied Haar measures.
- RO is a complex-linear functional in f.
- Replacing X by g1 X g2⁻¹, and transporting its centralizer measure, leaves RO unchanged.
- Rescaling dh1,dh2,dt by c1,c2,cT rescales RO by c1*c2/cT.

**Checks.**

- For unramified standard rank one and unit X, RO(1_OE,X)=1 with vol U(1)=1; the zero functional would give 0.
- Keeping group Haar measures fixed and doubling the stabilizer measure changes that value from 1 to 1/2.
- In the same example, multiply the two group measures by 2 and 3 and the stabilizer measure by 4: the value becomes 6/4=3/2.

Its direct consumers are FJ.0/orbital-comparison, FJ.1/kappa-orbital-integral.

### 0.8 Orbital pushforward along contraction

For T=r1(X) in Ω(W1,W2), set r_!f(T)=integral over U(W2) of f(Xu) du. It is independent of X and is zero off Ω in the invertible Hermitian locus. For f supported compactly in the invertible Hom locus, r_!f is a compactly supported locally constant function on that locus. For arbitrary f on all Hom maps it is only locally constant on the invertible locus with relatively compact support in the ambient Hermitian space; it need not be compactly supported within the invertible locus. The map on compact nonsingular tests is onto C_c^∞(Ω).

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Equation (2.4) and discussion, p. 16; Leslie19 Section 3.2, pp. 12–13; Leslie19, Section 3.2, pp. 12–13; Leslie19, Appendix A, Proposition A.3, pp. 25–26).

*Needs:* §0.5 (FJ.0/torsor); AdelicAlgebraicGroups §2.2 (quotient-measure); AdelicAlgebraicGroups §2.2 (Weil-integrable); §0.6 (FJ.0/fibre-integration).

One proof route is the following. Use the torsor to compare two lifts by right multiplication and Haar invariance. Use local analytic sections and a compact partition of unity to prove local constancy and surjectivity on Ω. For arbitrary f use an orbitwise compact cutoff before applying the nonsingular assertion; apply fibre-integration.

The construction has the following API.

- Integrate over the right-unitary fiber and extend by zero outside its F-point image.
- At T=r1(X), the value is integral_U(W2) f(Xu) du, independently of the chosen lift.
- Fiber integration is complex-linear.
- For compact nonsingular support, support(r_!f) is contained in r1(support f), a compact subset of the invertible locus.
- Every compact locally constant function on Ω has a compact nonsingular lift.

**Checks.**

- For unramified rank one and f=1_OE, r_!f(t)=1 if v_F(-t) is even and nonnegative, and is zero otherwise, with vol U(1)=1.
- That rank-one pushforward is not compactly supported in F^×; its support accumulates at zero in F.
- For rank one and f=1_OE^×, the pushforward is the indicator of OF^×, since -1 is an integral norm in the unramified case.

Its direct consumers are FJ.0/orbital-comparison, FJ.1/nonsingular-transfer, FJ.4/contraction-sign-comparison, FJ.4/spherical-pushforward, FJ.4/contracted-lattice-function.

### 0.9 Contraction preserves the orbital integral

For regular semisimple X and every compact locally constant f on the full Hom space, RO(f,X)=Orb(r_!f,r1(X)), with the torus measure transported by the stabilizer projection. The right integral converges even when r_!f is not compactly supported on the entire invertible locus. The comparison extends termwise to stable and κ sums via the kernel bijection.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Lemma 2.5, p. 16).

*Needs:* §0.8 (FJ.0/pushforward); §0.7 (FJ.0/relative-orbital-integral); §0.5 (FJ.0/torsor); AdelicAlgebraicGroups §2.2 (quotient-measures-in-stages); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; §0.6 (FJ.0/fibre-integration).

One proof route is the following. Apply quotient integration in stages through the right-unitary fiber and the projected centralizer. For an arbitrary f choose a compact nonsingular cutoff with the same values on the regular orbit in question. Use the kernel comparison for the finite stable-class sums.

**Checks.**

- For unramified standard rank one and unit X, RO(1_OE,X)=1=Orb(r_!1_OE,−N(X)).
- At X=π⁻¹ both sides for 1_OE are 0, since v(N(X))=−2; at X=π both sides are 1.
- Doubling the transported torus measure makes both unit-orbit values 1/2; keeping only one of the two torus measures unchanged would give 1/2≠1.

### Examples

For standard rank one, X=1 gives δ=[[0,1],[−1,0]] and δ* = −δ; using a positive lower-left entry would give δ*=δ. The other subsections compute the corresponding boundary cases and normalization witnesses.

### Dependencies

GeometryOfNumbersAndQuadraticArithmetic §2.9; Mathlib `Matrix.conjTranspose`; Mathlib `Matrix.IsHermitian`; Mathlib `Matrix.isHermitian_mul_conjTranspose_self`; Mathlib `Matrix.isHermitian_conjTranspose_mul_self`; SchemeAndStackFoundations §1.24; Mathlib `Matrix.charpoly`; EndoscopicTransferAndUnitaryTraceComparison §3.3; EndoscopicTransferAndUnitaryTraceComparison §1.17; Mathlib `Matrix.charpoly_mul_comm`; EndoscopicTransferAndUnitaryTraceComparison §1.1; EndoscopicTransferAndUnitaryTraceComparison §1.5; EndoscopicTransferAndUnitaryTraceComparison §1.14; gap:hermitian-field-classification; ReductiveGroupsPartII §RG2.0 (smooth-group-analytic-charts); Mathlib `HasStrictFDerivAt.implicitFunction`; AdelicAlgebraicGroups §2.2 (quotient-measure); AdelicAlgebraicGroups §2.2 (Weil-integrable); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; AdelicAlgebraicGroups §2.2 (quotient-measures-in-stages).

## Layer 1: relative endoscopic data and transfer

Transport ordinary endoscopic data through contraction, keeping form labels, characters, rational-orbit corrections and unmatched vanishing. Existence is proved for compact support in the invertible Hom locus.

### 1.1 Relative endoscopic data and symmetric spaces

For n=a+b with a,b positive, a relative datum Xi consists of an ordinary elliptic endoscopic datum (U(Va) × U(Vb),s,ξ) for U(W1), together with Hermitian forms alpha on E^a and beta on E^b. Its symmetric representation is Hom_E(V_alpha,Va) ⊕ Hom_E(V_beta,Vb), with acting group (U(Va) × U(V_alpha)) × (U(Vb) × U(V_beta)). The reference spaces Va,Vb and the varying spaces V_alpha,V_beta are retained separately even if their unitary groups happen to be isomorphic. For split E=F × F there is one Hermitian isometry class in each rank, U(W)=GL_n, and no proper elliptic datum of this block shape with a,b>0; the algebraic construction is interpreted only for an existing ordinary datum.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second. An ordinary elliptic datum of the displayed block shape exists; a,b>0.

(Leslie25, Section 2.3, p. 20).

*Needs:* §0.1 (FJ.0/symmetric-representation); §0.2 (FJ.0/contractions); EndoscopicTransferAndUnitaryTraceComparison §1.4; gap:hermitian-field-classification; EndoscopicTransferAndUnitaryTraceComparison §1.17.

One proof route is the following. Import the ordinary datum and local Hermitian isometry classes. Apply symmetric-representation separately in ranks a and b; use the product contraction r_alpha,beta.

The construction has the following API.

- Construct Xi from the ordinary datum and representatives alpha,beta of Hermitian isometry classes.
- The associated representation is Hom(V_alpha,Va) ⊕ Hom(V_beta,Vb).
- Return (r1(δ_a),r1(δ_b)) in Herm(Va) ⊕ Herm(Vb).
- Isometries of alpha or beta induce equivariant linear isomorphisms of the symmetric representations and preserve contraction.

**Checks.**

- For a=b=1 over a quadratic field extension, the labels (1,1),(1,ε),(ε,1),(ε,ε) give four pairs in (F×/N(E×))².
- At reference labels the target is End(Va)⊕End(Vb). At a=b=1 and β=ε its second contraction at 1 is −ε⁻¹, so replacing the form label by the abstract group loses data.
- For E=F×F there is one form class and U(W)=GL_n. The centre of GL_a×GL_b has dimension 2, while that of GL_n has dimension 1; hence a,b>0 gives no elliptic block datum.

Its direct consumers are FJ.1/matching-factor.

### 1.2 Relative matching and the pullback factor

Regular semisimple δ and (δ_a,δ_b) match for Xi exactly when r1(δ) and (r1(δ_a),r1(δ_b)) match under the ordinary Hermitian endoscopic relation. Define Δ_rel by evaluating the EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.9, 2.11 normalized factor on that contracted pair, and zero on nonmatching pairs. The associated character κ on D(H_δ/F) is the pullback, through the contraction kernel isomorphism, of the ordinary character trivial on a-components and nontrivial on b-components.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Section 2.3, p. 20; Sections 2.2.2–2.2.3, pp. 18–19).

*Needs:* §1.1 (FJ.1/relative-datum); §0.5 (FJ.0/torsor); EndoscopicTransferAndUnitaryTraceComparison §1.17; EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; gap:unitary-factor-all-quadratic.

One proof route is the following. Use the ordinary matching and factor exported by EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.14, 1.17 and EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.9, 2.11. Pull back the factor along the pair of contractions and the character along torsor. For nicely matching contractions the reference factor is η(resultant)*absolute-value(resultant), with the EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.9, 2.11 inv correction otherwise.

The construction has the following API.

- Relative matching is ordinary matching of the two contractions, with source regularity and cross-block disjoint spectra.
- Δ_rel(δ_H,δ)=Delta(r_alpha,beta(δ_H),r1(δ)).
- Pull back the EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.14, 1.17 endoscopic character to D(H_δ/F).
- Changing the source rational orbit multiplies the factor by the ordinary κ(inv) correction, in the fixed EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.9, 2.11 orientation.

**Checks.**

- For a=b=1 with distinct nonzero contracted scalars x,y and a nice match, Δ=η(x−y)|x−y|_F. If E/F is unramified and x−y=π, this is −q⁻¹, including q=2.
- For two blocks whose characteristic polynomials do not multiply to the source polynomial, matching fails and Δ=0 even if each block is separately regular.
- For x−y a unit in the unramified case, Δ=1; for x=y the cross-resultant is zero and the pair is outside the G-regular domain, so the nonzero formula is not invoked.

Its direct consumers are FJ.1/kappa-orbital-integral, FJ.1/smooth-transfer.

### 1.3 Stable and weighted relative orbital sums

For a regular semisimple δ in the fixed symmetric representation and a character κ of D(H_δ/F), set RO^κ(f,δ)=sum over rational orbits δ_prime in its stable class of κ(inv(δ,δ_prime))*RO(f,δ_prime). Use inv transported from contraction with the EndoscopicTransferAndUnitaryTraceComparison §§1.1, 1.14, 1.17 orientation. SRO is the case κ=1. The sum ranges over the fixed symmetric space, not over all pure inner forms.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Section 2.3.1, p. 20).

*Needs:* §0.7 (FJ.0/relative-orbital-integral); §0.5 (FJ.0/torsor); EndoscopicTransferAndUnitaryTraceComparison §1.14; §1.2 (FJ.1/matching-factor); EndoscopicTransferAndUnitaryTraceComparison §2.4.

One proof route is the following. Use the rational-class kernel to index the finite sum. Transport the centralizer measure consistently to each class and use ordinary inv functoriality.

The construction has the following API.

- Sum RO over the finite D(H_δ/F)-torsor with the character weights.
- Set κ to the trivial character.
- The weighted sum is complex-linear in the test function.
- Transport the basepoint-change law from EndoscopicTransferAndUnitaryTraceComparison §2.4 through the contraction kernel isomorphism: a shift d₀ multiplies the weighted sum by κ(d₀)⁻¹.

**Checks.**

- For κ=1 the sum equals SRO.
- For a stable class with D=C2 and RO-values A,B, the nontrivial character gives A-B.
- In the same C2 example, changing the base orbit interchanges A,B and changes the weighted sum to B-A.

Its direct consumers are FJ.1/smooth-transfer.

### 1.4 The relative smooth-transfer relation

A compact locally constant source function f and a compact locally constant target function f_Xi are transfers if SRO(f_Xi,δ_H)=Δ_rel(δ_H,δ)*RO^κ(f,δ) for every matching regular pair, and SRO(f_Xi,δ_H)=0 for every target regular orbit having no source match. This is a relation on functions and a well-defined correspondence of orbital-integral classes; no preferred representative is selected.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Definition 2.10, p. 21).

*Needs:* §1.2 (FJ.1/matching-factor); §1.3 (FJ.1/κ-orbital-integral); §0.9 (FJ.0/orbital-comparison).

One proof route is the following. Use the finite orbital sums and the transported factor; prove the identity is independent of source rational representative. Retain the unmatched clause as a separate quantified condition.

The construction has the following API.

- The relation is the conjunction of the matching equality and the unmatched vanishing condition.
- Adding two transfer pairs gives a transfer pair.
- Scaling both members by a complex scalar preserves the relation.
- Changing the target by a function with all stable relative orbital integrals zero preserves the relation.

**Checks.**

- At one matching orbit with Δ=−q⁻¹ and source κ-integral A, the target stable integral must be −A/q; using A gives a different relation whenever A≠0.
- At an unmatched target orbit a target stable integral 1 violates transfer of the zero source, since the required value is 0.
- For the same source, target orbital values B and B+C with C=0 at every target regular orbit define the same transfer class; a nonzero C at one such orbit changes the class.

Its direct consumers are FJ.1/nonsingular-transfer, FJ.3/augmented-to-endoscopic, FJ.4/graded-transfer, FJ.4/unit-fundamental-lemma.

### 1.5 Transfer for tests supported on invertible maps

If f has compact support contained in the invertible Hom locus, then for every relative datum Xi of §1.1 of §1.1 there exists a compact locally constant target transfer supported in the invertible target Hom locus. On the ordinary endoscopic side choose a transfer of r_!f, restrict it to the image of the target contraction, and lift it through target fiber integration. This theorem concerns support away from the singular locus and does not prove general relative transfer.

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic étale F-algebra (a field extension or F × F). Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Definition 2.10 and the following discussion, p. 21; Leslie19 Proposition 1.3 and Proposition 4.5, pp. 4, 15; Leslie19, Proposition 1.3, p. 4, and Proposition 4.5, p. 15).

*Needs:* §0.8 (FJ.0/pushforward); §0.9 (FJ.0/orbital-comparison); §1.4 (FJ.1/smooth-transfer); EndoscopicTransferAndUnitaryTraceComparison §4.7; §0.6 (FJ.0/fibre-integration).

One proof route is the following. Push f to the ordinary Hermitian space and extend it by zero from the invertible locus. Apply EndoscopicTransferAndUnitaryTraceComparison §4.7. Multiply the ordinary target transfer by a compact open cutoff on the common characteristic-coefficient base, equal to one on the source invariant support and zero near determinant zero. This preserves every transfer equality and gives compact support away from singular endomorphisms. Restrict to the stable invariant norm-form component of each target contraction and lift by fibre-integration; orbital-comparison proves matching and unmatched vanishing.

**Checks.**

- In unramified rank one, 1_OE× has compact nonsingular support and pushes to 1_OF×; the full 1_OE includes 0 and does not satisfy the support hypothesis.
- In that example, 1_OE pushes to a function equal to 1 at π^(2j) for every j≥0. These points approach 0, so this is not a compact test on F× and cannot be used in the ordinary transfer theorem without a cutoff.
- On a target chart choose vol(J)=2 and h=1_B: the lift (1/2)1_(B×J) pushes to 1_B. A lift 1_(B×J) would give 2·1_B and the wrong orbital identity.

### Examples

For a=b=1 over a quadratic field extension, the labels (1,1),(1,ε),(ε,1),(ε,ε) give four pairs in (F×/N(E×))². The other subsections compute the corresponding boundary cases and normalization witnesses.

### Dependencies

§0.1 (FJ.0/symmetric-representation); §0.2 (FJ.0/contractions); EndoscopicTransferAndUnitaryTraceComparison §1.4; gap:hermitian-field-classification; EndoscopicTransferAndUnitaryTraceComparison §1.17; §0.5 (FJ.0/torsor); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; gap:unitary-factor-all-quadratic; §0.7 (FJ.0/relative-orbital-integral); EndoscopicTransferAndUnitaryTraceComparison §1.14; §0.9 (FJ.0/orbital-comparison); §0.8 (FJ.0/pushforward); EndoscopicTransferAndUnitaryTraceComparison §4.7; §0.6 (FJ.0/fibre-integration).

## Layer 2: Hermitian spherical functions and base change

Keep every dominant integral coweight and both Hermitian field-form classes. The Hironaka transform identifies the full module; its cyclic base-change submodule is strictly smaller in positive rank.

### 2.1 The spherical module on all invertible Hermitian matrices

Let Xn={y in GL_n(E): y*=y}, with g*y=g y g*. Retain both GL_n(E)-orbits of Hermitian forms. Define H(Xn)=C_c^∞(Xn)^(K_n,E), where K_n,E=GL_n(OE), as an H(GL_n(E))-module by (φ*f)(y)=integral φ(g⁻¹)*f(g*y) dg. Its basis consists of the indicators e_lambda of K_n,E*π^lambda under congruence, for dominant integral lambda, including negative entries. Write e_0 for the integral unimodular orbit indicator. No convolution on Xn is implicit in this definition.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Section 3.2, equation (3.7), p. 26).

*Needs:* GeometryOfNumbersAndQuadraticArithmetic §2.9; gap:hermitian-field-classification; gap:unramified-hermitian-lattice-orbits; SmoothRepresentationsOfLocalGroups §SR.4.1 (satake-isomorphism); AdelicAlgebraicGroups §2.2 (Weil-integrable).

One proof route is the following. Use local integral Hermitian diagonalization to classify K_n,E-orbits by dominant integral tuples. Every compact invariant test meets only finitely many such open orbits. Obtain the module laws by group convolution and Fubini, with vol K_n,E=1.

The construction has the following API.

- The complex vector space of compact locally constant K_n,E-invariant functions on all Xn.
- For dominant lambda in Z^n, e_lambda is the indicator of the congruence orbit of π^lambda.
- The e_lambda are a basis, so each element has a unique finite expansion.
- The displayed integral is a unital H(GL_n(E))-module action.
- Extend by zero to Herm(Vn); compact support in Xn makes this a compact locally constant Hermitian test.

**Checks.**

- For n=1, e_(1) is nonzero and belongs to the other GL_1(E)-orbit from e_(0).
- For n=1, e_(-1) is the indicator of π⁻¹*OF^× and is a valid compact test.
- The Hecke unit 1_K acts as the identity on every e_lambda.
- Distinct dominant lambda have disjoint supports; in particular e_(0) and e_(1) are linearly independent in rank one.

Its direct consumers are FJ.2/spherical-fourier, FJ.3/weil-orbital-sum, FJ.3/group-to-augmented, FJ.4/spherical-pushforward, FJ.4/product-group-contraction, FJ.4/contracted-lattice-function, FJ.4/degree-hecke-identities.

### 2.2 Quadratic base change commutes with the twisted Levi map

Define ξ_F on spherical GL_n(F) by the same formula as ξ_E with |.|_F in both twists and in normalized descent. Then BC_(a,b) composed with ξ_E equals ξ_F composed with BC_n. On normalized Satake coordinates, BC_n sends each E-variable Z_i to the square T_i^2; ξ_F scales T_i by q^(−b/2) or q^(−a/2), so both composites substitute q^(−b)*X_i^2 or q^(−a)*Y_i^2. The equality does not imply that base change has support only on individually even coweights.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Proof of Proposition 4.8, p. 39; Lemma 3.2, p. 24).

*Needs:* SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent); EndoscopicTransferAndUnitaryTraceComparison §4.9; SmoothRepresentationsOfLocalGroups §SR.4.1 (satake-isomorphism).

One proof route is the following. Use the unramified GL base-change Satake formula of EndoscopicTransferAndUnitaryTraceComparison §4.9(b). Compute both composites on Laurent variables and descend to symmetric Laurent polynomials by injectivity of Satake. Use the rank-two counterexample to rule out the source proof’s asserted support shortcut.

**Checks.**

- For a=b=1 the first Satake variable maps by either composite to q⁻¹X²: (q⁻¹/²X)²=q⁻¹X².
- The central monomial Z1Z2 maps under ξ_E to q⁻²XY. At q=2 the coefficient is 1/4, excluding untwisted Levi restriction.
- For n=2, BC(T_(1,0),E)=T_(2,0),F−(q−1)T_(1,1),F. At q=2 the odd central coweight coefficient is −1, although the Satake substitution squares variables.

### 2.3 Hironaka’s normalized spherical Fourier isomorphism

Fix the invariant measure dμ(y)=C|det y|_F^(−n)dy on all X_n, where dy is additive Haar measure on Herm_n(E) with integral lattice volume one, and C>0 makes μ(K_n,E∗I_n)=1. The normalizing mass is positive because this orbit is nonempty compact open. Use Hironaka’s normalized spherical functions Y_z(y)=ω(y;z)/ω(I_n;z), as rational functions of the spectral variables, and the transform f↦∫_(X_n)f(y)Y_z(y⁻¹)dμ(y). The denominator is a nonzero rational function by Hironaka’s explicit formula. Identify its symmetric Laurent-polynomial image with the F-Satake algebra; this fixes H_n on every congruence orbit, including the nonreference form. Normalize the spherical Fourier transform to obtain a complex-linear isomorphism H_n:H(Xn) → H(GL_n(F)) such that H_n(e_0)=1_Kn and H_n(φ*f)=BC_n(φ)*H_n(f). It transports the GL_n(F) convolution algebra to an algebra structure on H(Xn). As an H_n,E-module H(Xn) is free of rank 2^n. The cyclic map φ → φ*e_0 is injective, but for n>0 is not surjective.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Proposition 3.4 and Remarks 3.6–3.7, pp. 26–27; Hironaka99 Theorem 2, p. 571; Hironaka99, Section 2, Theorem 2, p. 571; normalization on pp. 570–571).

*Needs:* §2.1 (FJ.2/hermitian-spherical-module); §2.2 (FJ.2/base-change-compatibility); SmoothRepresentationsOfLocalGroups §SR.4.1 (satake-isomorphism); EndoscopicTransferAndUnitaryTraceComparison §4.9.

One proof route is the following. Use the normalized spherical functions and Fourier image in Hironaka Theorem 2, matching q and the reference orbit. Identify the image with the F-Satake algebra and normalize the reference orbit to the unit. The symmetric Laurent algebra is free of rank 2^n over its squared-variable subalgebra, yielding freeness and cyclic injectivity.

The construction has the following API.

- The normalized isomorphism H_n between the full Hermitian module and the F-Hecke algebra.
- H_n(e_0)=1_Kn.
- H_n(φ*f)=BC_n(φ)*H_n(f).
- The inverse sends BC_n(φ) to φ*e_0, and both composites with H_n are identities on the full spaces.
- φ → φ*e_0 is injective and its image under H_n is exactly the base-change subalgebra.

**Checks.**

- H_1(e_(0))=1_OF^×.
- The π^d OE^× Hecke indicator sends e_(0) to e_(2d), and H_1(e_(2d)) is the π^(2d) OF^× Hecke indicator.
- In rank one e_(1) lies outside the image of φ → φ*e_(0).
- For f=e_(1), H_1⁻¹(H_1(f))=f; the inverse identity includes the noncyclic part.
- In rank one H_1(e_j)=1_(π^j O_F×) for every j∈ℤ; j=1 fixes the noncyclic normalization rather than allowing an independent rescaling of the other form.

Its direct consumers are FJ.3/augmented-to-endoscopic, FJ.4/product-group-contraction, FJ.4/cyclic-endoscopic-transfer, FJ.5/full-spherical-extension.

### Examples

For n=1, e_(1) is nonzero and belongs to the other GL_1(E)-orbit from e_(0). The other subsections compute the corresponding boundary cases and normalization witnesses.

### Dependencies

GeometryOfNumbersAndQuadraticArithmetic §2.9; gap:hermitian-field-classification; gap:unramified-hermitian-lattice-orbits; SmoothRepresentationsOfLocalGroups §SR.4.1 (satake-isomorphism); AdelicAlgebraicGroups §2.2 (Weil-integrable); SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent); EndoscopicTransferAndUnitaryTraceComparison §4.9.

## Layer 3: local comparison reductions

Use the imported orbit torsor and the declared local Jacquet–Rallis interface to derive normalized finite inversion, descent and the spherical implications. The general germ statements allow ramified extensions; the spherical applications retain unramified hypotheses.

### 3.1 The orbit torsor across both Hermitian forms

Use the all-pure-form orbit torsor and inv map of EndoscopicTransferAndUnitaryTraceComparison §1.17(b). For a fixed regular semisimple x with F[x]=∏Fi, put Ei=E⊗F Fi and S1={i:Ei is a field}. Prove that matching (x,v,v*ζ) to (yζ,wζ), for a cyclic reference triple, gives a bijection F[x]×/N(E[x]×)→S, equivariant for the imported H¹(F,T_y)-action. In these coordinates κ_Σ(ζ)=∏_(i∈S1\Σ)η_Ei/Fi(ζ_i).

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic field extension. Hermitian forms are conjugate-linear in the first variable and linear in the second.

(Leslie25, Proposition 4.5, Lemma 4.6 and the definition of κ_Σ, pp. 35–36; Xiao18, Proposition 3.8, pp. 11–12, and Lemma 4.6, pp. 19–20).

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §1.17; EndoscopicTransferAndUnitaryTraceComparison §1.14; EndoscopicTransferAndUnitaryTraceComparison §1.1; gap:hermitian-field-classification; gap:jr-local-comparison.

One proof route is the following. Import the orbit torsor from EndoscopicTransferAndUnitaryTraceComparison §1.17(b). Use equality of the cyclic Gram invariants to identify each factor form with its norm class. Nondegeneracy and cyclicity make the resulting coordinate map injective and surjective. Evaluate the complementary-coordinate characters; no second torsor or inv map is constructed.

**Checks.**

- For rank one over a field extension, S has the two norm classes 1,ε; on a fixed Hermitian form it has one orbit. The coordinate bijection therefore has size 2, not 1.
- If S1 is empty, the norm quotient has size 1 and every κ_Σ takes value 1.
- For two nonsplit factors write ζ=(ε,1) and Σ={1}. The complementary-coordinate character gives κ_Σ(ζ)=1, while Σ={2} gives −1; interchanging Σ with its complement fails this check.

### 3.2 Regularized generalized nilpotent orbital distributions

Fix regular semisimple x in gl_n(F), cyclic v and v*, F[x]=product Fi and S1 as in pure-form-orbit-torsor. Let T=F[x]^× and T1=product_(i in S1) Fi^×. Set v_Σ to v_i for i in Σ and zero otherwise; v*_(S1\Σ) is analogous, with every S2 component zero. Define G_Σ(f) by integrating over GL_n(F)/T the value at s=0 of the meromorphic continuation of the T1 integral of f(gxg⁻¹,g t v_Σ,v*_(S1\Σ)t⁻¹g⁻¹)*η(det t)*η(det g)*product_(i in Σ)|t_i|^s*product_(i in S1\Σ)|t_i|^(−s). Use maximal-compact-volume-one multiplicative measures and their quotient measures. This is the raw regularized integral, with finite-Fourier averaging supplied by germ inversion.

F is a nonarchimedean local field of characteristic zero; E/F is any quadratic field extension, including ramified extensions and residue characteristic two. All torus maximal compact subgroups have volume one; quotient measures are transported through the fixed stabilizer identifications.

(Leslie25, Section 4.2, p. 36; Xiao18 Section 2.1, equation (2) and Lemma 2.1, pp. 3–5; Xiao18, Section 2.1, equation (2), Lemma 2.1, pp. 3–5; Section 4.1, p. 15).

*Needs:* §3.1 (FJ.3/pure-form-orbit-torsor); AdelicAlgebraicGroups §2.2 (quotient-measure); AdelicAlgebraicGroups §2.2 (Weil-integrable); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; gap:jr-local-comparison.

One proof route is the following. Factor compact locally constant functions into finite sums of ⊗ products locally on the regular semisimple x-orbit. Apply Tate continuation in each nonsplit factor; the nontrivial quadratic character removes the pole at zero. At s=0 the value descends under changing the T-coset representative; compactness on GL/T gives a well-defined outer integral.

The construction has the following API.

- The displayed regularized integral for x,Σ and the chosen cyclic reference data.
- It is a complex-linear functional on the augmented linear test space.
- Conjugating the triple by g changes the distribution by η(det g) with the chosen action convention.
- For i in Σ scale the surviving v_i by c_i, and for i in S1\Σ scale the surviving v_i* by d_i, with all scalars nonzero. Changing variables in the regularized torus integral multiplies its value at s=0 by ∏_(i∈Σ)η_i(c_i) ∏_(i∈S1\Σ)η_i(d_i), where η_i=η_E/F∘N_Fi/F.

**Checks.**

- In the unramified rank-one specialization, for n=1, Σ={1}, x fixed and the vector test 1_OF^×, the raw Tate integral is 1.
- In the unramified rank-one specialization, for n=1 and vector test 1_(π OF^×), the raw integral is η(π)=-1.
- In the unramified rank-one specialization, for n=1 and vector test 1_OF, the Tate expression is 1/(1+q^(−s)), so its raw value at zero is 1/2, not 1.

Its direct consumers are FJ.3/germ-inversion, FJ.3/factor-descent-comparison.

### 3.3 Germ inversion with an explicit finite-Fourier normalization

Suppose f and the family {f_V} are augmented Jacquet–Rallis transfers for the cyclic-vector factor ω and volume-one measures. For regular semisimple x with r=card S1, matching reference data (y,w), and Σ subset S1, the identity is ω(x,v,v*)*G_Σ(f)=2^(−r)*sum_(zeta in S) κ_Σ(zeta)*Orb_U(V_zeta)(f_V_zeta(-,0),y_zeta). Equivalently define the Fourier-normalized germ as 2^r*G_Σ. The orbit sum includes both Hermitian forms.

F is a nonarchimedean local field of characteristic zero; E/F is any quadratic field extension, including ramified extensions and residue characteristic two. All torus maximal compact subgroups have volume one; quotient measures are transported through the fixed stabilizer identifications.

(Leslie25, Theorem 4.7, p. 36; Xiao18 Theorem 4.7 and its preceding inversion, pp. 20–21; Xiao18, Sections 4.1–4.5, pp. 15–21, especially Theorem 4.7).

*Needs:* §3.1 (FJ.3/pure-form-orbit-torsor); §3.2 (FJ.3/generalized-nilpotent-integral); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; gap:jr-local-comparison.

One proof route is the following. Use Xiao18 (7), p. 19: for each norm-class coordinate ζ the ordinary orbital integral equals ω × the character-weighted sum of the raw germs. Lemma 4.6 identifies all these coordinates with the imported orbit torsor. For A=(Z/2)^r, compute ∑_(ζ∈A)κ(ζ)κ′(ζ)=2^r if κ=κ′ and zero otherwise. Invert the forward identities with 2⁻ʳ. Use the maximal-compact-volume-one centralizer measures of Leslie25 §1.5.4, p. 12, in both expansions and transport those measures through the cyclic-coordinate identification; the averaging factor comes solely from the finite character table.

**Checks.**

- In unramified rank one with the augmented lattice unit and v=v*=1, ω=1, raw G=1/2 and the pure-form orbital values are (1,0). Thus 1/2=(1/2)(1+0), whereas the unaveraged sum is 1.
- With v=π and v*=π⁻¹ in the same regular reference triple, ω=−1 and raw G=−1/2. Again ωG=1/2=(1/2)(1+κ·0); the sign changes on both linear factors.
- For r=2 the character table has H Hᵗ=4I, so the inverse is Hᵗ/4. On the vector (1,0,0,0), each inverse coefficient is 1/4, rather than 1; r=0 gives coefficient 1.

### 3.4 Additive parabolic descent on augmented linear tests

For n=a+b and an augmented linear test f(x,v,v*), define f_p(m1,m2,v,v*) as integral over Lie N_(a,b)(F) and K_n of f(k*[[m1,u],[0,m2]]*k⁻¹,k v,v* k⁻¹) dk du. Here du is additive, Lie N(OF) and K_n have volume one, and no δ_P^(1/2) occurs in the definition. With L_n=OF^n ⊕ (OF^n)*, the descent of φ ⊗ 1_Ln equals ξ_F(φ) ⊗ 1_(La × Lb) for spherical φ on GL_n(F), extended by zero to gl_n(F).

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Definition 4.9, p. 38, and the Jacobian calculation in Proposition 4.8, p. 39).

*Needs:* SmoothRepresentationsOfLocalGroups §SR.4.1 (satake-isomorphism); SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent); AdelicAlgebraicGroups §2.2 (quotient-measure); AdelicAlgebraicGroups §2.2 (Weil-integrable); §2.2 (FJ.2/base-change-compatibility).

One proof route is the following. Define the integral on the additive nilpotent block and the compact K average. Use K-stability of L_n to factor out the vector-lattice indicator. Change u=m1*u_prime; its Jacobian is |det m1|_F^b. Compare with δ_P^(1/2) and the two half-power twists to identify ξ_F.

The construction has the following API.

- The additive Lie N and compact K double integral above.
- It is a complex-linear map between the augmented test spaces.
- For φ spherical on GL_n(F), (φ ⊗ 1_Ln)_p=ξ_F(φ) ⊗ 1_(La × Lb).
- On invertible Levi matrices the additive integral is |det m1|_F^b × unnormalized group descent; after δ_P normalization this is ξ_F.

**Checks.**

- For n=2,a=b=1, the descent of 1_M2(OF) ⊗ 1_L2 is 1_OF ⊗ 1_OF ⊗ 1_L1 ⊗ 1_L1.
- If a vector coordinate has negative valuation, the descended lattice-vector test is zero even when both Levi matrices are integral.
- For a=b=1 and m1=π, replacing u by m1*u multiplies additive measure by q⁻¹; omitting this factor fails ξ_F compatibility.

Its direct consumers are FJ.3/factor-descent-comparison, FJ.3/augmented-to-endoscopic.

### 3.5 Cyclic determinant factors and the descent Jacobian

Let x=diag(xa,xb) with separable disjoint block spectra, v=(va,vb) cyclic in each block and Ω=Ωa∧Ωb the ordered volume form. Put D_ab=∏_(λa,λb)(λa−λb). For ω=η(det[v,xv,…,x^(n−1)v]/Ω), prove ω_n=η((−1)^(ab)D_ab)ω_aω_b. For the unramified generalized nilpotent distribution at the truncated arguments u=(va,0), u*=(0,u_b*), where u_b* is cyclic on the b-block, additive parabolic descent satisfies G_n(f)=|D_ab|_F⁻¹G_(a,b)(f_p), with the compact average, Haar measures and surviving cyclic coordinates of lie-parabolic-descent. Thus in the unramified endoscopic diagram the reciprocal descent Jacobian and the cyclic factor yield η(D_ab)|D_ab|_F; the rational-class correction is the imported κ(inv).

F is a nonarchimedean local field of characteristic zero; E/F is a quadratic field extension for the determinant identity. For the integral descent identity E/F is unramified, the surviving vector/covector blocks satisfy the generalized nilpotent support conditions, and all additive integral lattices and compact groups have volume one. The spectra of xa and xb are disjoint, hence D_ab≠0; every displayed cyclic determinant is nonzero. The vector v=(va,vb) in the determinant identity is the full cyclic reference vector; u and u* in the regularized distribution are its separately specified singular arguments.

(Xiao18, Lemma 5.1, pp. 21–22; proof of Theorem 6.1, p. 24).

*Needs:* §3.2 (FJ.3/generalized-nilpotent-integral); §3.4 (FJ.3/lie-parabolic-descent); §3.1 (FJ.3/pure-form-orbit-torsor); §3.3 (FJ.3/germ-inversion); gap:jr-local-comparison; gap:unitary-factor-all-quadratic.

A proof route factors the ordered Vandermonde determinant with cross factors λb−λa. Factoring out the two block determinants gives (−1)^(ab)D_ab. Apply η; in the unramified case η(−1)=1. On the off-block matrix space the map u↦xa u−u xb has determinant D_ab. Changing additive variables gives |D_ab|⁻¹. The unramified character is trivial on K, so the compact average agrees with lie-parabolic-descent. Combine this identity with germ-inversion and the cyclic-coordinate characters; use the ordinary factor from gap:unitary-factor-all-quadratic for the normalization comparison.

**Checks.**

- For a=b=1, va=vb=1 and x=diag(xa,xb), the cyclic determinant is xb−xa=−D_ab. Over an unramified extension η(−1)=1, so ω_n=η(D_ab)ω_aω_b.
- For F=Q₃, E=Q₃(√3), xa=0 and xb=1, D_ab=−1, η(−1)=−1 and ω_n=η(1)=1. The corrected formula gives η((−1)D_ab)=1; the unsigned formula gives −1.
- In the unramified a=b=1 descent with xa−xb=π, the off-block linear map is multiplication by π. Its modulus is q⁻¹ and the raw orbital integral acquires q=|D_ab|⁻¹; in the reversed comparison the ordinary factor is η(π)|π|=−q⁻¹.

### 3.6 From augmented Jacquet–Rallis to cyclic endoscopic transfer

Assume in every positive rank m that, for each φ in H_m,E, the augmented tests BC_m(φ) ⊗ 1_Lm and {(φ*e_0) ⊗ 1_Λ_m,0} are Jacquet–Rallis transfers. Then for every n=a+b and φ in H_n,E, the functions φ*e_0 and ξ_E(φ)*e_0 are ordinary endoscopic transfers on Herm(Vn) and Herm(Va) ⊕ Herm(Vb), with the EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.9, 2.11 factor and unmatched-zero clause. The hypothesis is for all ranks needed by the two Levi blocks, not only rank n.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Proposition 4.8, pp. 37–39).

*Needs:* §1.4 (FJ.1/smooth-transfer); SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent); §2.2 (FJ.2/base-change-compatibility); §2.3 (FJ.2/spherical-fourier); §3.1 (FJ.3/pure-form-orbit-torsor); §3.3 (FJ.3/germ-inversion); §3.4 (FJ.3/lie-parabolic-descent); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; EndoscopicTransferAndUnitaryTraceComparison §4.9; §3.5 (FJ.3/factor-descent-comparison); gap:jr-local-comparison; gap:unitary-factor-all-quadratic.

One proof route is the following. Use F=(φ*e_0) ⊗ 1_Λ_n; evaluation at zero is φ*e_0, correcting the mistyped upper test in the source. Apply germ-inversion to source κ and target stable sums. The character counts satisfy r_n=r_a+r_b, so the finite averaging factors cancel. Use lie-parabolic-descent and base-change-compatibility to identify the descended linear test. Apply factor-descent-comparison and the ordinary factor contract. Only the reference/reference lower-rank test is nonzero; no general signed four-form operator is used.

**Checks.**

- For F[x]=F×F with a=b=1 and unramified E, r_n=2 and r_a=r_b=1. The source averaging coefficient is 1/4=(1/2)(1/2), so no factor 2 remains.
- For a=b=1 and x−y=π, the factor comparison produces −q⁻¹; omitting the descent modulus would produce −1.
- The nonreference lower-rank tests have value 0, so the four-form combination is the reference/reference contribution plus three zero terms. The implication uses no sign choice for those zero terms.

### 3.7 The Weil action on the sum of orbital-image spaces

Let I_GL and I_U be the images of the augmented linear and reference-unitary test spaces as locally constant functions on their common regular invariant base A^rss(F); include the cyclic-vector factor ω in I_GL and extend the unitary image by zero off its matching image. Import the descended SL_2(F) Weil actions and their agreement on I_GL intersection I_U. There is then a unique action on I_GL+I_U extending both actions: W(g)(A+B)=W_GL(g)A+W_U(g)B. For the spherical defect D=O_U((φ*e_0) ⊗ 1_Λ)-O_GL(BC(φ) ⊗ 1_L), use this sum, rather than assuming D belongs to the intersection.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two. psi has conductor OF; Fourier transforms use self-dual additive measures.

(Leslie25, Proposition 5.1, p. 41; proof of Proposition 5.2, p. 43; Beuzart-Plessis21 Proposition 1, p. 7; BP21, Section 3, equations (4)–(5), pp. 5–6, and Proposition 1, p. 7).

*Needs:* §2.1 (FJ.2/hermitian-spherical-module); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; AdelicAlgebraicGroups §2.2 (quotient-measure); MetaplecticAutomorphicForms §2.1 (weilIndex); MetaplecticAutomorphicForms §2.5 (weil_generators); gap:jr-weil-descent; gap:jr-local-comparison.

One proof route is the following. Use the local Jacquet–Rallis invariant-base and orbital-image contracts. If A+B=A_prime+B_prime, their difference lies in the intersection; agreement of the actions proves independence of decomposition. Check the group law and uniqueness on the two generating subspaces.

**Checks.**

- If A+B=A′+B′ and C=A−A′=B′−B lies in the intersection, the two proposed images differ by W_GL(g)C−W_U(g)C=0.
- If the intersection is zero and A,B are both nonzero, A−B belongs to the sum, while its membership in the intersection would force A=B=0; the defect must be acted on in the sum.
- At u=w=w′=1, Tr(h(u,w+w′))=Tr(2)=4 equals Tr(h(u,w))+Tr(h(u,w′))=2+2. Norm gives N(2)=4 whereas N(1)+N(1)=2, so a norm kernel fails additivity in characteristic zero.

### 3.8 The Weil reduction from rank-shifted to augmented transfer

Fix n≥1 and φ in H_n,E. Suppose BC_n(φ) and {φ*e_0,0} match for the conjugation action of GL_(n-1)(F) on GL_n(F), against U(V_(n-1)) on the invertible part of Herm(V_(n-1) ⊕ Ee0), in the block Jacquet–Rallis sense. Then BC_n(φ) ⊗ 1_Ln and {(φ*e_0) ⊗ 1_Λ_n,0} are augmented Jacquet–Rallis transfers in rank n, including the nonreference-form zero clause.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Proposition 5.2, pp. 42–43; Beuzart-Plessis21 Sections 2–3, pp. 3–8; BP21, Section 2, Lemma 1, pp. 4–5, and Section 3, Proposition 1 and proof, pp. 5–8).

*Needs:* §3.7 (FJ.3/weil-orbital-sum); §2.1 (FJ.2/hermitian-spherical-module); gap:unramified-hermitian-lattice-orbits; GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.ofCarrier); GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.dual); MetaplecticAutomorphicForms §2.1 (weilIndex); MetaplecticAutomorphicForms §2.5 (weil_generators); gap:jr-weil-descent; gap:unramified-unit-vector-transitivity; Tau Ceti `TauCeti.map_normUnits_unitFiltration`; gap:jr-local-comparison.

A proof route uses the lattice indicators vanish when |q(a)|>1. For |q(a)|=1, use TauCeti.map_normUnits_unitFiltration at depth zero to rescale to norm one, then use gap:unramified-unit-vector-transitivity. The projection v↦w h(w,v)/h(w,w) splits an integral unit-norm line; its denominator is a unit. The complement is self-dual and has the reference isometry type by gap:unramified-hermitian-lattice-orbits. This gives the rank-(n−1) reduction in both forms, without division by 2. The lattice indicators are Fourier self-dual for the trace and hyperbolic pairings. On the orbital-image sum, the defect is fixed by the Weyl element. Since the defect is supported where q(a) is in the maximal ideal, every upper unipotent with t in π⁻¹OF fixes it. These and the Weyl element generate SL_2(F). For q(a)≠0 choose t with psi(t q(a))≠1, forcing the defect to zero. Local constancy and density of this locus finish the proof.

**Checks.**

- For an integral unit-norm vector w, the projection p(v)=w h(w,v)/h(w,w) satisfies p(w)=w and p²=p; no factor 1/2 occurs, including over Z₂.
- For q(a)=π and t∈π⁻¹OF, ψ(tq(a))=1. If q(a) is a unit, some t∈π⁻¹OF instead has ψ(tq(a))≠1; these conditions distinguish the supported defect from an arbitrary orbital image.
- The Weyl element and N(π⁻¹OF) generate diagonal diag(π⁻¹,π), whose conjugation scales N by π⁻². The union of the resulting π^(−1-2j)OF is F, so all upper unipotents occur.

### Examples

For rank one over a field extension, S has the two norm classes 1,ε; on a fixed Hermitian form it has one orbit. The coordinate bijection therefore has size 2, not 1. The other subsections compute the corresponding boundary cases and normalization witnesses.

### Dependencies

EndoscopicTransferAndUnitaryTraceComparison §1.17; EndoscopicTransferAndUnitaryTraceComparison §1.14; EndoscopicTransferAndUnitaryTraceComparison §1.1; gap:hermitian-field-classification; gap:jr-local-comparison; AdelicAlgebraicGroups §2.2 (quotient-measure); AdelicAlgebraicGroups §2.2 (Weil-integrable); EndoscopicTransferAndUnitaryTraceComparison §2.1; EndoscopicTransferAndUnitaryTraceComparison §2.4; EndoscopicTransferAndUnitaryTraceComparison §2.9; EndoscopicTransferAndUnitaryTraceComparison §2.11; SmoothRepresentationsOfLocalGroups §SR.4.1 (satake-isomorphism); SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent); §2.2 (FJ.2/base-change-compatibility); gap:unitary-factor-all-quadratic; §1.4 (FJ.1/smooth-transfer); §2.3 (FJ.2/spherical-fourier); EndoscopicTransferAndUnitaryTraceComparison §4.9; §2.1 (FJ.2/hermitian-spherical-module); MetaplecticAutomorphicForms §2.1 (weilIndex); MetaplecticAutomorphicForms §2.5 (weil_generators); gap:jr-weil-descent; gap:unramified-hermitian-lattice-orbits; GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.ofCarrier); GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.dual); gap:unramified-unit-vector-transitivity; Tau Ceti `TauCeti.map_normUnits_unitFiltration`.

## Layer 4: the unit fundamental lemma

Use the independent product-group theorem through its supplier gap, then derive the adjacent-rank and augmented comparisons and cyclic endoscopy. Compact determinant grades recover the full relative lattice indicator.

### 4.1 The sign convention for the lattice pushforward

In the unramified setting choose c in OE^× with Nm_E/F(c)=-1. Define r_plus(X)=X X* and r_minus(X)=-X X* in the reference coordinates. Then r_minus(cX)=r_plus(X); multiplication by c preserves every integral Hom lattice and its test indicator, all group actions and stabilizer measures. Consequently the signed-contraction pushforward of the lattice unit equals its positive-contraction pushforward. The same comparison applies separately in each endoscopic block.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Equation (2.1), p. 14, compared with equation (3.8) and Lemma 3.11, pp. 28–30).

*Needs:* §0.2 (FJ.0/contractions); §0.8 (FJ.0/pushforward); Tau Ceti `TauCeti.map_normUnits_unitFiltration`.

One proof route is the following. Apply TauCeti.map_normUnits_unitFiltration (F,E,0) to the unit −1; it gives c∈O_E× with N(c)=−1 in every residue characteristic. Compute -(cX)(cX)*=-Nm(c)XX*=XX*. Use the invariant lattice indicator and unchanged fiber measures to identify the two pushforwards.

**Checks.**

- For unramified rank one, N(c)=−1 gives r_−(c)=−N(c)=1=r_+(1), and cOE=OE even in residue characteristic two.
- For X=diag(1,π), r_−(cX)=diag(1,π²)=r_+(X); replacing c by a norm-one unit would instead leave diag(−1,−π²).
- For E=Q₃(√3), −1 is not a norm of a unit (its residue 2 is not a square). Thus no such c exists and the sign comparison is not extended to arbitrary ramified extensions.

### 4.2 The cyclic embedding is contraction pushforward

For every compact spherical φ on GL_n(E), viewed as a compact nonsingular matrix test, the positive-contraction pushforward r_plus,!φ equals φ*e_0 on all Xn, with zero on the other GL_n(E)-orbit of Hermitian forms. The signed pushforward gives the same function because multiplication by the unit c with norm -1 preserves a K_n,E-biinvariant φ.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Lemma 3.11, pp. 29–30).

*Needs:* §0.8 (FJ.0/pushforward); §2.1 (FJ.2/hermitian-spherical-module); §4.1 (FJ.4/contraction-sign-comparison).

One proof route is the following. Compute r_plus,!(1_K)=e_0 by vol U(Λ_n)=1 and the unimodular Hermitian orbit description. Prove r_plus,!(φ*φ1)=φ*r_plus,!φ1 by quotient Fubini. Set φ1=1_K. For the signed comparison, c I_n belongs to K_n,E.

**Checks.**

- In rank one, the Hecke shell 1_(π^d OE×) pushes to e_(2d), with coefficient vol U(1)=1; d=1 gives e_2.
- The shell d=−1 pushes to e_−2, so spherical pushforward allows compact tests with negative valuation, unlike the full integral lattice unit.
- At valuation 1 in F×, the same shell pushes to 0 since norm valuations are even; an unsigned shift by d would give a false nonzero value.

### 4.3 Contraction of the spherical product-group test

Set m=n-1 and embed GL_m in GL_n by h → diag(h,1). For φ in H_n,E take Phi=1_Km,E ⊗ φ on GL_m(E) × GL_n(E). Its left-H contraction tilde(Phi)(g)=integral_GL_m(E) Phi(h⁻¹,diag(h⁻¹,1)g) dh equals φ. The corresponding Hermitian contraction at the reference pair (I_m,I_n) equals φ*e_0. The F-linear contraction of BC_(m,n)(Phi) equals BC_n(φ), and the product transfer factor Ω(gamma) is ω(diag(gamma1⁻¹,1)gamma2). With compatible quotient measures, product relative orbital integrals become the rank-shifted GL_m and U(V_m) orbital integrals.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Section 11.2, p. 86; equations (7.5)–(7.7) and Definition 7.4, pp. 50–51; Leslie25, Equations (7.5)–(7.7), Definition 7.4, pp. 50–51).

*Needs:* §2.3 (FJ.2/spherical-fourier); §2.1 (FJ.2/hermitian-spherical-module); AdelicAlgebraicGroups §2.2 (quotient-measures-in-stages); EndoscopicTransferAndUnitaryTraceComparison §4.9; §4.2 (FJ.4/spherical-pushforward); gap:jr-local-comparison; gap:jr-product-base-change.

One proof route is the following. Apply the supplier product-group orbital contraction formulas, with n there replaced by n-1. For the unit ⊗ lift, K-invariance and vol K_m,E=1 give tilde(Phi)=φ. Use r_!φ=φ*e_0 from the spherical pushforward identity for the Hermitian contraction. Base change preserves the two units; factor compatibility is the cyclic determinant formula.

**Checks.**

- For Φ=1_Km⊗φ and h∈K_m, φ(diag(h⁻¹,1)g)=φ(g). Thus the contraction is vol(K_m)φ(g)=φ(g); vol(K_m)=2 would give 2φ(g).
- For n=1, m=0 and GL_0=U_0={1}, both contractions are their rank-one tests, with no additional volume factor.
- For γ1=I_m, the contracted γ is γ2 and Ω(γ1,γ2)=ω(γ2). At rank one this is η(det[e_1])=η(1)=1.

### 4.4 Spherical rank-shifted Jacquet–Rallis comparison

For n≥1, φ in H_n,E and X in GL_n(F) regular semisimple under GL_(n-1)-conjugation, ω(X)*Orb_GL_(n-1),η(BC_n(φ),X) equals Orb_U(V_(n-1))(φ*e_0,Y) when X matches Y in Xn for the reference block Hermitian form. It is zero when X matches a different (n-1)-dimensional Hermitian form. Here ω(X)=η(det[e_n,Xe_n,..,X^(n-1)e_n]); regularity makes this determinant nonzero.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Theorem 5.3, p. 43, proved in Section 11.2, p. 86, using Theorem 11.1, p. 78).

*Needs:* §4.3 (FJ.4/product-group-contraction); gap:jr-local-comparison; gap:jr-product-base-change.

One proof route is the following. Import the precise product-group base-change fundamental lemma in ranks (n-1,n), including all nonreference-form vanishing. Apply it to Phi=1_K_(n-1),E ⊗ φ. Use product-group-contraction and Ω=ω after taking matching lifts; transport the reference split forms to identity forms by integral isometries.

**Checks.**

- For n=1 and φ=1_(π^d OE×), GL_0 is trivial, ω=1, and both sides are 1_(π^(2d)OF×).
- For n=1 at an odd valuation in F×, BC(φ)=0 and φ*e0=0; a base-change map shifting by d would fail.
- In the nonreference block form the asserted target orbital function is 0, including orbits with equal characteristic invariants; matching only the reference form cannot establish this zero clause.

### 4.5 Augmented spherical Jacquet–Rallis transfer

In every positive rank n and for every φ in H_n,E, the test BC_n(φ) ⊗ 1_Ln transfers to the family {(φ*e_0) ⊗ 1_Λ_n,0} in the augmented Jacquet–Rallis comparison of gl_n(F) × F^n × (F^n)* with Herm(V) × V. The zero entry is the other Hermitian isometry class.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Proposition 5.2 and Theorem 5.3, pp. 42–43).

*Needs:* §4.4 (FJ.4/rank-shifted-fundamental-lemma); §3.8 (FJ.3/group-to-augmented).

One proof route is the following. Apply group-to-augmented in each rank using rank-shifted-fundamental-lemma. Retain the same self-dual vector lattices and all reference/nonreference form labels.

**Checks.**

- For φ=1_K in unramified rank one, the augmented reference unit has normalized regular orbital value 1 on the norm-unit component, with the other form test equal to 0.
- For the same lattice test the raw germ at v=1 is 1/2; augmented transfer does not identify that singular-vector regularization with the unaveraged value 1.
- For n=1 and φ=1_(πOE×), the matrix argument of the Hermitian cyclic test has valuation 2, matching BC(φ); a valuation-one matrix gives 0 on both spherical tests.

### 4.6 The cyclic spherical endoscopic fundamental lemma

For n=a+b with a,b positive and φ in H_n,E, the Hermitian functions φ*e_0 and ξ_E(φ)*e_0 are ordinary smooth endoscopic transfers with the EndoscopicTransferAndUnitaryTraceComparison §§2.1, 2.4, 2.9, 2.11 matching and factor. The notation on the target means the ⊗ of the cyclic embeddings in ranks a,b, extended linearly; φ need not be a simple ⊗ after applying ξ_E. This theorem covers the cyclic H_n,E-submodule of H(Xn), not all of H(Xn).

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Theorem 3.5, p. 27; final paragraph of Section 5.2, p. 43).

*Needs:* §4.5 (FJ.4/augmented-fundamental-lemma); §3.6 (FJ.3/augmented-to-endoscopic); §2.3 (FJ.2/spherical-fourier); SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent); gap:unitary-factor-all-quadratic.

One proof route is the following. Use augmented-fundamental-lemma in all three ranks in augmented-to-endoscopic. For a finite ⊗ expansion of ξ_E(φ), apply the target cyclic embeddings termwise. Check unmatched vanishing by the corresponding ordinary-transfer clause.

**Checks.**

- For φ=1_K the two cyclic functions are e0 and e0⊗e0; the unit is preserved by ξ_E.
- For n=2,a=b=1 and φ=c_(2,1), the target is e2⊗e0+e0⊗e2; the two degree distributions each have coefficient 1.
- In rank one e1 is nonzero but is outside the span of the e_(2d). Thus the cyclic theorem cannot be applied to an arbitrary full-module vector such as e1.

### 4.7 The contracted lattice unit and its determinant grades

Put Phi_n=r_minus,!1_End(Λ_n), equivalently r_plus,!1_End(Λ_n). For integer d let Xn,d={T in Xn:v_F(det T)=d} and Phi_n,d=Phi_n*1_Xn,d, where this star denotes pointwise multiplication only. Each Phi_n,d is a compact spherical function. It is zero if d<0 or d is odd. For d≥0, Phi_n,2d=sum_(lambda dominant,nonnegative,sum lambda=2d) m0(π^lambda)*e_lambda, where m0(T) is the finite number of self-dual integral overlattices of the lattice with Gram matrix T, and is zero if no such overlattice exists. Identify this count with the normalized square-rank representation density of GeometryOfNumbersAndQuadraticArithmetic §3.2 (density divided by the reference self-density). Phi_n itself is only almost compact: it has infinitely many nonzero grades. The reference self-density is ∏_(j=1)^n(1−(−q)^(−j))>0 for q≥2, so this division is defined; the empty product is 1.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Equation (3.8), Lemma 3.8 and Remark 3.9, pp. 28–29).

*Needs:* §0.8 (FJ.0/pushforward); §4.1 (FJ.4/contraction-sign-comparison); §2.1 (FJ.2/hermitian-spherical-module); GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.ofCarrier); GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.dual); gap:unramified-hermitian-lattice-orbits; GeometryOfNumbersAndQuadraticArithmetic §3.2.

One proof route is the following. Integral Gram matrices have nonnegative elementary divisors; their determinant has even valuation for the reference norm component. Fixing the determinant grade leaves finitely many nonnegative dominant tuples, giving compactness. For T=xx*, put L=x*Λ_n. Cosets h U(Λ_n) with xh integral correspond to self-dual L′ with L⊆L′⊆L∨ by L′=hΛ_n; finiteness follows from the finite module L∨/L. Use gap:unramified-hermitian-lattice-orbits for self-dual transitivity. Identify this count with the reference-normalized square-rank density of GeometryOfNumbersAndQuadraticArithmetic §3.2; no generic density construction is repeated.

The construction has the following API.

- The fiber integral of the full integral Hom indicator, defined on Xn.
- Restrict Φ_n to determinant valuation d.
- The support is contained in integral Hermitian matrices of determinant valuation d, and is empty for negative or odd d.
- For nonnegative even d, the e_λ coefficient is m0(π^λ), the finite self-dual-overlattice count just defined; it is the supplied square-rank density divided by its reference self-density.
- Each grade is a finite basis expansion in H(Xn), although the total function is not in H(Xn).

**Checks.**

- Phi_1,2=e_(2), with coefficient one.
- Phi_1,1=0 even though e_(1) is a nonzero spherical Hermitian function.
- Phi_n,d=0 for d<0.
- Phi_1 has value one at π^(2d) for every d≥0, so it is not compactly supported within X1=F^×.

Its direct consumers are FJ.4/degree-hecke-identities, FJ.4/graded-transfer.

### 4.8 Determinant-degree identities in the spherical Hecke algebra

For d≥0 let c_n,d be the indicator of integral invertible E-matrices with v_E(det)=d, equivalently the sum of 1_K π^lambda K over nonnegative dominant lambda with sum d. Its normalized Satake polynomial is q^(d(n-1))*h_d(Z1,..,Zn), where h_d is Mathlib’s complete homogeneous symmetric polynomial. Then Phi_n,2d=c_n,d*e_0 and ξ_E(c_n,d)=sum_(da+db=d) c_a,da ⊗ c_b,db. All sums here are finite.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Proposition 3.12, equations (3.9)–(3.10), pp. 30–31).

*Needs:* SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent); §2.1 (FJ.2/hermitian-spherical-module); §4.2 (FJ.4/spherical-pushforward); §4.7 (FJ.4/contracted-lattice-function); SmoothRepresentationsOfLocalGroups §SR.4.1 (satake-isomorphism); Mathlib `MvPolynomial.hsymm`.

One proof route is the following. Use the Iwasawa decomposition in SR.4 to count upper-unipotent entries; for a diagonal valuation tuple m the measure is q^(sum 2(i-1)m_i). The normalized Satake modulus combines with that count to give the uniform coefficient q^(d(n-1)). Apply the two scalings of ξ_E and split total monomial degree between the a and b blocks. For the pushforward, determinant valuation doubles under the Gram map; apply spherical-pushforward to c_n,d.

**Checks.**

- For n=2,d=1, Sat(c_(2,1))=q(Z1+Z2), and ξ_E substitutes q⁻¹X,q⁻¹Y, giving X+Y.
- For d=0, c_(n,0)=1_K and Φ_(n,0)=e0, so the degree identity is 1↦1⊗1.
- For a=b=1,d=2 the target degree pairs are (2,0),(1,1),(0,2). Both Satake expressions are X²+XY+Y²; the middle term excludes a two-term-only splitting.

### 4.9 The lattice theorem is equivalent to compact graded transfer

The relative unit fundamental lemma for a fixed datum Xi is equivalent to the following family of compact ordinary endoscopic transfer identities: for every d≥0, Phi_n,2d transfers to sum_(da+db=d) Phi_a,2da ⊗ Phi_b,2db for the reference pair (I_a,I_b), and the corresponding target contribution for every other form pair is zero. Matching preserves the product of characteristic polynomials and hence determinant valuation, so each regular matching orbit tests exactly one total grade.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Corollary 3.10, p. 29; Lemma 2.5, p. 16).

*Needs:* §0.9 (FJ.0/orbital-comparison); §1.4 (FJ.1/smooth-transfer); §4.7 (FJ.4/contracted-lattice-function); §4.1 (FJ.4/contraction-sign-comparison).

One proof route is the following. Compare relative and ordinary orbital integrals through orbital-comparison. A regular orbit has one fixed determinant valuation; use the compact grade corresponding to that valuation. For other form pairs the relevant contraction images do not intersect the reference norm components in at least one block; record the resulting zero condition.

**Checks.**

- For a=b=1 and total grade 2, the target is e2⊗e0+e0⊗e2. At block valuations (2,0) it is 1; at (1,1) it is 0.
- If total determinant valuation is odd or negative, the source grade and every target grade product vanish, giving 0=0.
- On a fixed matching pair, d_n=d_a+d_b. At (d_a,d_b)=(2,4), exactly total grade 6 contributes, so the orbital integral tests one grade rather than an infinite sum.

### 4.10 The unitary Friedberg–Jacquet fundamental lemma

Let n=a+b with a,b positive, Vn=(E^n,I_n), Λ_n=OE^n=Λ_a ⊕ Λ_b and W1=W2=Vn. Fix a relative elliptic datum Xi=(U(Va) × U(Vb),s,ξ,alpha,beta), using the unramified ordinary transfer normalization and hyperspecial Haar volumes one. The source test 1_End(Λ_n) transfers, in the relation of §1.4, to 1_End(Λ_a) ⊗ 1_End(Λ_b) if (alpha,beta)=(I_a,I_b), and to the zero target test for every other pair of Hermitian isometry classes. The theorem holds for every characteristic-zero F, including residue characteristic two.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Theorem 2.12, p. 21; Proposition 3.12, pp. 30–31; Section 11.2, p. 86).

*Needs:* §1.4 (FJ.1/smooth-transfer); §4.6 (FJ.4/cyclic-endoscopic-transfer); §4.8 (FJ.4/degree-hecke-identities); §4.9 (FJ.4/graded-transfer); GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.ofCarrier); gap:unramified-hermitian-lattice-orbits; gap:unitary-factor-all-quadratic.

One proof route is the following. Apply cyclic-endoscopic-transfer to each determinant-shell test c_n,d. Use degree-hecke-identities to identify the transferred compact grade pair. Apply graded-transfer and the sign comparison to recover the full relative lattice indicators. Use the nonreference-form clause throughout, with the same datum labels and factor normalization.

**Checks.**

- For a=b=1 the target tests are the ⊗ unit at (I1,I1) and 0 at each of (I1,ε),(ε,I1),(ε,ε). The last pair has the same total discriminant as the reference pair but must still receive 0.
- At an unramified dyadic place with x−y=π and a nice regular match, the factor is −q⁻¹; at q=2 it is −1/2, which the positive resultant alone would get wrong.
- For total grade 2 and a=b=1, contraction gives the two terms e2⊗e0 and e0⊗e2 with coefficient 1; a single ungraded compact unit on X1 would omit e2.

### Examples

For unramified rank one, N(c)=−1 gives r_−(c)=−N(c)=1=r_+(1), and cOE=OE even in residue characteristic two. The other subsections compute the corresponding boundary cases and normalization witnesses.

### Dependencies

§0.2 (FJ.0/contractions); §0.8 (FJ.0/pushforward); Tau Ceti `TauCeti.map_normUnits_unitFiltration`; §2.1 (FJ.2/hermitian-spherical-module); §2.3 (FJ.2/spherical-fourier); AdelicAlgebraicGroups §2.2 (quotient-measures-in-stages); EndoscopicTransferAndUnitaryTraceComparison §4.9; gap:jr-local-comparison; gap:jr-product-base-change; §3.8 (FJ.3/group-to-augmented); §3.6 (FJ.3/augmented-to-endoscopic); SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent); gap:unitary-factor-all-quadratic; GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.ofCarrier); GeometryOfNumbersAndQuadraticArithmetic §2.7 (IntegralHermitianLattice.dual); gap:unramified-hermitian-lattice-orbits; GeometryOfNumbersAndQuadraticArithmetic §3.2; SmoothRepresentationsOfLocalGroups §SR.4.1 (satake-isomorphism); Mathlib `MvPolynomial.hsymm`; §0.9 (FJ.0/orbital-comparison); §1.4 (FJ.1/smooth-transfer).

## Layer 5: the full spherical operator

Construct the full-module operator through the fixed Hironaka transform, with the transported algebra structure and its precise restriction to the cyclic submodule.

### 5.1 The Fourier-defined extension to the full spherical module

For n=a+b with a,b positive, define ξ_X=(H_a⁻¹ ⊗ H_b⁻¹) composed with ξ_F composed with H_n on all H(Xn), using the normalized Hironaka isomorphisms. For the algebra structures transported by H, this is a unital complex algebra homomorphism. On the cyclic submodule it satisfies ξ_X(φ*e_0)=ξ_E(φ)*e_0. This specifies the extension as an operator.

F is a nonarchimedean local field of characteristic zero; E/F is an unramified quadratic field extension, with common uniformizer π and q=card(k_F). Use the reference Hermitian space Vn=(E^n,I_n), Λ_n=OE^n, and hyperspecial Haar volumes one. This includes residue characteristic two.

(Leslie25, Remark 3.7 and Remark 3.6, p. 27; the ξ_F diagram in Proposition 4.8, p. 39).

*Needs:* §2.3 (FJ.2/spherical-fourier); §2.2 (FJ.2/base-change-compatibility); SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent).

One proof route is the following. Transport ξ_F across the three isomorphisms H_n,H_a,H_b. Use their cyclic normalization and the BC/ξ commuting square to identify the cyclic restriction. Algebra laws follow from the transported convolutions and ξ_F; no orbital transfer claim is needed to construct this map.

The construction has the following API.

- The composite (H_a inverse ⊗ H_b inverse) after ξ_F after H_n.
- ξ_X(φ*e_0)=ξ_E(φ)*e_0.
- ξ_X(e_0)=e_0 ⊗ e_0.
- It preserves the convolution algebras transported by H.
- (H_a ⊗ H_b)(ξ_X(f))=ξ_F(H_n(f)) for every full spherical f.

**Checks.**

- ξ_X(e_0)=e_0 ⊗ e_0.
- For n=2,a=b=1 and f=c_2,1*e_0, ξ_X(f)=e_(2) ⊗ e_(0)+e_(0) ⊗ e_(2).
- For the noncyclic f=H_n⁻¹(1_K_F diag(π,1,..,1) K_F), applying H_a ⊗ H_b to ξ_X(f) gives ξ_F of that F-double-coset indicator; it is not forced to zero.
- On f=1_(π K_n,E)*e_0, the image is q^(−2ab) × the two central cyclic indicators.

Its direct consumers are .

### Examples

ξ_X(e_0)=e_0 ⊗ e_0. The other subsections compute the corresponding boundary cases and normalization witnesses.

### Dependencies

§2.3 (FJ.2/spherical-fourier); §2.2 (FJ.2/base-change-compatibility); SmoothRepresentationsOfLocalGroups §SR.4.3 (parabolic-descent).

## Downstream consumers

GanGrossPrasadUnitaryGroups consumes the relative comparison continuation through its own exact supplier contracts. The local results here provide symmetric-space transfer, the all-residue-characteristic unramified unit theorem and the explicitly normalized reductions; its global geometric and archimedean relative comparison gaps require their named supplier and are not consequences of the lattice theorem.

## Acceptance-test boundary

The headline theorems are Leslie25 Theorem 2.12 (relative lattice-unit transfer), Theorem 3.5 (cyclic spherical transfer), Theorem 5.3 (adjacent-rank Jacquet–Rallis comparison) and Hironaka99 Theorem 2 (the spherical Fourier isomorphism). The acceptance module has namespace TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparisonPartII and a single import Mathlib. None of these four headlines is statable at the pins: Theorem 2.12 lacks local Hermitian unitary groups equipped with Haar and quotient measures, relative and κ-orbital integrals and rational stable-class carriers; Theorem 3.5 lacks local spherical GL_n(E) Hecke algebras, the X_n module and ordinary transfer; Theorem 5.3 lacks Jacquet–Rallis matching and orbital-integral carriers; Hironaka's isomorphism lacks local spherical Hecke algebras with normalized Satake. Its module docstring names these missing carriers and states that README.md is the roadmap, that the Lean file is not the roadmap, and that it records headline signatures against the pins. There are no substitute matrix theorems, admitted examples or data definitions.

Tau Ceti's HeckeRing.GLn (TauCeti/NumberTheory/HeckeRing/GLn/PolynomialRing/Basic.lean:13–31) concerns the arithmetic p-local Hecke ring over ℤ. It does not provide the local spherical analytic carriers required by these headlines.

## Source corrections

The following corrections use the exact versions listed in References.

**E01 (misprint), Leslie arXiv:1911.07907v3, Lemma 1.8, p. 12.** The centralizer is labeled using U(W), although the surrounding datum is V. Use U(V). The lemma begins with δ in Herm(V), and the proof and cohomology map use that same V.

**E02 (misprint), Leslie arXiv:1911.07907v3, Section 2.2.3, transfer-factor paragraph after Remark 2.8, p. 19.** The endoscopic triple changes its embedding symbol to η in this display. Retain ξ for the embedding in the fixed endoscopic datum. Eta is already the quadratic extension character; the definition transports the same datum fixed earlier.

**E03 (misprint), Leslie arXiv:1911.07907v3, after Theorem 2.12, p. 22.** The reduction points to an unresolved proposition reference. The first reduction is Proposition 3.12, pp. 30–31. Its statement is exactly the implication from the spherical theorem to Theorem 2.12.

**E04 (misprint), Leslie arXiv:1911.07907v3, Section 4.1.2, p. 32.** The Hermitian invariant formula uses powers of the linear-side variable. Use powers of the Hermitian variable y in h(w,y^i w). The invariant is a function on Herm(V) × V; no linear-side x is in its argument.

**E05 (misprint), Leslie arXiv:1911.07907v3, Section 4.1.4, p. 33.** The upper-left block of the Hermitian embedding is labeled x. The block is y. The embedding takes the Hermitian pair (y,w); x labels the different linear-side pair.

**E06 (misprint), Leslie arXiv:1911.07907v3, Remark 4.4, p. 35.** The surname of the characteristic-zero transfer contributor is misspelled. Use Julia Gordon. The bibliography reference is to Gordon’s transfer appendix.

**E07 (misprint), Leslie arXiv:1911.07907v3, Proposition 4.8 proof, p. 38.** The chosen augmented upper test is written as φ ⊗ the vector-lattice indicator and its zero evaluation as φ. Use (φ*e_0) ⊗ 1_Λ_n, whose zero evaluation is φ*e_0. Phi belongs to the GL_n(E) Hecke algebra; the upper test must be a function on Herm(Vn) × Vn. The surrounding hypothesis and desired orbital integral both use its cyclic image.

**E08 (error), Leslie arXiv:1911.07907v3, Section 5.1 Hermitian Fourier formula, p. 40.** The character kernel is formed from the norm of a Hermitian pairing. Use psi(Tr_E/F h(u,w)) with the self-dual measure and keep the Hermitian matrix argument y fixed, as in Beuzart-Plessis arXiv:1901.02653v3, pp. 5–6. A norm is quadratic, so the displayed kernel is not a bilinear additive Fourier pairing. The trace is the polar form of h(w,w); it remains valid in residue characteristic two.

**E09 (misprint), Leslie arXiv:1911.07907v3, Lemma 3.1, modular-character display, p. 23.** The E-parabolic modular character has F absolute-value subscripts on E-valued determinants. Use |det m1|_E^b*|det m2|_E^(−a); the F-group formula on p. 39 correctly uses |.|_F. The E-parabolic acts on the E-vector space Mat_(a,b)(E), so its additive Jacobian uses the normalized E absolute value. The adjacent twists and Lemma 3.2 then give q_E=q^2 powers.

**E10 (error), Leslie arXiv:1911.07907v3, Proposition 4.8 proof, p. 39.** The justification of BC/ξ commutativity asserts support only on double cosets with every coweight entry even. Prove commutativity by normalized Satake substitutions, without that support assertion. For n=2, BC(T_(1,0),E)=T_(2,0),F-(q-1)T_(1,1),F: Sat_E(T_(1,0))=q(Z1+Z2), while Sat_F(T_(2,0))=q(T1^2+T2^2)+(q-1)T1*T2. Thus an odd (1,1) coset occurs. Squaring variables nevertheless commutes with the two Levi scalings.

**E11 (error), Leslie arXiv:1911.07907v3, Theorem 4.7, p. 36; Xiao arXiv:1802.07624v1, inversion preceding Theorem 4.7, pp. 20–21.** The raw regularized germ is equated to a finite character sum without averaging. For volume-one measures the finite inversion requires 2^(−card S1), or an explicitly rescaled germ. The forward identity and transported centralizer measures are inverted in §3.3. In unramified rank one, choose the integral augmented unit with x a fixed unit scalar, cyclic v=v*=1 and vol OF^×=vol U(1)=1. It transfers to the reference unit and zero on the other form. The Σ={1} raw germ is the continuation of sum_(k≥0)(-q^(−s))^k, equal to 1/2 at zero, while the unaveraged unitary sum at w=0 is 1. The C2 character table inverse also has coefficient 1/2. Endoscopic block exponents add, so this does not by itself refute the final FJ theorem.

**E12 (gap), Leslie arXiv:1911.07907v3, Proposition 4.8 four-form sum, p. 38; Xiao arXiv:1802.07624v1, Theorem 6.1 construction, p. 23.** The displayed four-form signs differ between the cited construction and its use. Supply an explicit conversion between the ordinary/Jacquet–Langlands transfer-factor conventions before using the general four-form operator. Xiao’s written signs depend on the second form, while Leslie’s depend on the parity of the two split-form labels. Different conventions might explain this, but the conversion is not supplied. The special spherical reduction has only the reference/reference term nonzero. This is a normalization gap, not a claim that the two final theorems contradict each other.

**E13 (gap), Leslie arXiv:1911.07907v3, proof of Proposition 5.2, p. 43.** The defect is subjected to the common Weil action on the intersection of the two orbital-image spaces. Extend the agreeing actions from the intersection to the sum, then apply the action to the defect there. Before transfer is proved, the two orbital images need not coincide. Their difference belongs to the sum. Independence of a decomposition follows because its ambiguity lies in the intersection, where the actions agree.

The sum-space construction is explicit in Beuzart-Plessis arXiv:1901.02653v3, Section 4, p. 8; this repairs the stated location of the defect.

**E14 (ordered determinant sign), Xiao18, proof of Theorem 6.1, p. 24.** With Ω=Ωa∧Ωb and D_ab=∏(λa−λb), the ordered cyclic determinant has cross product ∏(λb−λa)=(−1)^(ab)D_ab. The formula is η((−1)^(ab)D_ab)ω_aω_b over a ramified extension. Over an unramified extension η(−1)=1, giving the form used in the spherical comparison. The rank-two calculation in §3.5 distinguishes the general formula.

## References

- **Leslie25:** Spencer Leslie, *The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods*, Annals of Mathematics 201 (2025), 551–645. All locators here use [arXiv:1911.07907v3](https://arxiv.org/abs/1911.07907v3), with its own printed pagination.
- **Leslie19:** Spencer Leslie, *Endoscopy for unitary symmetric spaces*, [arXiv:1910.09685v2](https://arxiv.org/abs/1910.09685v2), 2020 version.
- **Xiao18:** Jingwei Xiao, *Endoscopic transfer for unitary Lie algebras*, [arXiv:1802.07624v1](https://arxiv.org/abs/1802.07624v1), 2018.
- **Hironaka99:** Yumiko Hironaka, *Spherical functions and local densities on Hermitian forms*, Journal of the Mathematical Society of Japan 51 (1999), 553–581, [publisher scan](https://www.jstage.jst.go.jp/article/jmath1948/51/3/51_3_553/_pdf/-char/en), Theorem 2, p. 571.
- **BP21:** Raphaël Beuzart-Plessis, *A new proof of Jacquet–Rallis’s fundamental lemma*, Duke Mathematical Journal 170 (2021). All locators here use [arXiv:1901.02653v3](https://arxiv.org/abs/1901.02653v3), with its own printed pagination.
