# Roadmap: gan–gross–prasad restriction and period theory for classical groups

**Summary.** Build the relative representation theory of arbitrary classical pairs, from their flag subgroups and Bessel or Fourier–Jacobi models to explicit root-number characters and global periods. The endpoints are named classical conjecture propositions, proved generic nonarchimedean unitary selection, proved tempered unitary uniqueness across inner forms, endoscopic unitary global nonvanishing, and the all-place unitary refined identity GGP.8 (§8.6). Orthogonal refinement is a conjecture proposition, not an unconditional period theorem.

## Scope and ownership

This roadmap owns relevance of pairs and pure inner triples, relative subgroups and characters, the relative pullback of the oscillator representation, restriction models, their multiplicity assertions, epsilon-character selection, Bessel and Fourier–Jacobi period functionals, relative character comparisons, and the normalized period identities. Arbitrary ambient forms, all allowed codimensions and parities, split quadratic algebras, ramified and dyadic local fields, and archimedean places belong to these constructions. Each theorem keeps its source’s field and category hypotheses. The classical global formulations also include function fields of characteristic different from two; the proved unitary global results concern number fields. Section 6.2a owns the split equal-rank relative central Mellin pairing, distinct from MetaplecticAutomorphicForms §5.8’s regularized dual-pair theta integral; its odd-characteristic function-field extension is a target here, not a theorem attributed to a number-field source.

ReductiveGroups Layers 0, 3, 5 and 7 supply affine group schemes, components, unipotent radicals and parabolics. OrthogonalSpinGroups Layer 0 supplies arbitrary-form orthogonal point groups; Layers 2–3 supply their ℝ/ℚ_p topology and point-group restricted products. The arbitrary-local-field SO scheme/point/topology extension is assigned to ReductiveGroupsPartII below. RestrictedProducts Layers 1–3 supply the generic adelic packaging and rational diagonals. GlobalNumberFields Layers 0, 4–5, 8–9 supply number-field scalar places, adeles, extension norms and Hecke characters. Their objects are imported rather than reconstructed.

The exact contracts below assign general epsilon-Hermitian forms and unitary group schemes to ReductiveGroupsPartII, local representation categories to SmoothRepresentationsOfLocalGroups, automorphic realizations to AutomorphicFormsOnReductiveGroups, harmonic analysis to AutomorphicSpectralTheory, factors to AutomorphicLFunctionsAndLocalFactors, classical parameters and transfer to EndoscopicTransferAndUnitaryTraceComparison, Weil and theta theory to MetaplecticAutomorphicForms, and generic group measures to AdelicAlgebraicGroups. General enhanced theta correspondence, including equal-rank P1, belongs to MetaplecticAutomorphicForms; the relative bridge here consumes only its equal-rank parameter/nonvanishing laws, P2 and seesaw, and proves Fourier–Jacobi selection. The absence of a section binding is a contract gap, not permission to rebuild that subject here.

Already in the pinned libraries are algebraic intertwining maps, continuous intertwining maps, the finite-dimensional continuous/algebraic comparison, invariant sesquilinear forms, quadratic Witt decomposition and cancellation, alternating symplectic bases, constant-form affine group schemes, standard orthogonal and special orthogonal schemes and points, SO base change and low-rank cases, standard symplectic schemes and points with base change, smoothness and geometric connectedness in their stated ranges, the norm-equation Hilbert symbol, and compact standard unitary matrix groups. Their exact declarations are listed below. In particular the standard positive unitary matrix group is not an arbitrary Hermitian local group. The relative model definition specializes these carriers, allows arbitrary smooth inputs before admissibility, and adds the relevant tensor/functional convention; it does not redevelop their generic API.

PeriodsAndSpecialValues consumes GGP.8. SelmerIwasawaCohomologyPartII owns the arithmetic uses of local distinction, diagonal Abel–Jacobi classes, level raising and reciprocity; it consumes these automorphic results. Arithmetic heights, derivative formulas and arithmetic GGP are outside this roadmap. No arithmetic consumer is a proof input.

## Conventions

Use a field F with 2 invertible. The coefficient algebra A is F with identity involution or a quadratic étale F-algebra with its canonical involution, including F × F. Modules are finite free over A. Write B linear in its first argument and conjugate-linear in its second, with B(y,x) = epsilon·conjugate(B(x,y)); epsilon is +1 or −1. Against a Mathlib star-first form H use B(x,y) = H(y,x). For a symmetric form use the unhalved polar form of Q: B(x,x) = 2Q(x). **Witnesses:** on Q(x) = x², B(1,1) = 2; for the alternating plane B(e,f) = 1 and B(f,e) = −1. Characteristic two is excluded, whereas a dyadic characteristic-zero local field is included. A field is never replaced by a zero ring or an inseparable quadratic algebra.

For split GL automorphic realizations fix a unitary central character and take the Petersson norm modulo the split center. Use the full-quotient ordinary period on the convergence domain of §6.2; split positive equal rank uses the meromorphically continued central theta pairing of §6.2a, with its explicit splitting and measure conventions. The full GL adelic quotient is not assumed to have finite measure (ggp §22, ggp line 2908).

The group G(V) is SO(V) in the orthogonal case and the connected isometry group in every other case. The relative embedding has coordinates (n·i(g),g); at zero or one complement dimension this is the diagonal. Pure inner twists retain markings and the complement isometry class. Write Πphi for the disjoint union of the supplier’s Vogan L-packets over the marked pure inner forms of the pair; the relevant subfamily is specified by §1.3. In a Witt decomposition X∨ denotes the conjugate A-dual when the involution is nontrivial, and the ordinary dual when it is trivial; a parameter’s complex representation dual is the ordinary complex dual. On a Hermitian hyperbolic plane scaling e by a scales its partner f by conjugate(a) inverse: for a = i both scale by i. Rank is A-rank, so split-algebra ranks are not doubled by restriction of scalars. On a split line an isometry acts as (a,a⁻¹), which pins the dual direction.

Local representation coefficients are C. At finite places use smooth admissible representations; at real and complex places use irreducible Casselman–Wallach representations, continuous Hom and completed projective tensor products of the nuclear Fréchet spaces. Mathlib ContRepresentation only requires continuous individual operators and supplies no joint smoothness or moderate growth. Multiplicity is cardinal dimension until a finite-dimensional theorem applies. Universe choices follow the underlying vector-space and group carriers, with no finiteness imposed by universe shrinking.

Write Model(pi,nu) = `Hom_H`(pi tensor nu,C), so the elementary character comparison is `Hom_H`(pi,nu∨). Comparing with the source’s `Hom_H`(pi,nu) notation requires its conjugacy/dual equivalence. Do not silently replace a topological dual by an algebraic dual. In a Fourier–Jacobi symplectic model exactly one ambient factor is genuine; its sign cancels nu’s genuine sign. Additive characters are nontrivial continuous unitary characters, globally trivial on rational elements. The unitary splitting character mu restricts to the quadratic character on Fˣ. The parameter twist is mu⁻¹: a two-line tensor with values z and u⁻¹ has value z/u. The local metaplectic character uses N ⊕ 1, whereas the global R uses N itself (§4.4, §6.3).

Geometric Frobenius has norm q⁻¹ and corresponds to a uniformizer in the local reciprocity convention. For an unramified trivial one-dimensional parameter its meromorphic L-factor is (1 − q^(−s))⁻¹; Re(s) > 0 ensures its denominator is nonzero. At q = 2 and s = 1 its value is 2 (§7.5). No formula is evaluated at q = 1 or specialized as an ordinary value at a pole. Hilbert symbols and epsilon factors use the supplier’s exact normalization; §4.2–§4.5 give their change-of-data comparisons. Determinant corrections are used only on their even-dimensional domains.

Inner products in source formulas are linear in the first variable; reverse arguments to compare with Mathlib’s convention. The orthogonal restriction period is integral f1·conjugate(f0), and its local coefficient product has the corresponding conjugation. The unitary period is the diagonal integral of the function on the product group, without adding another conjugation. For a scalar 2i, squared periods and squared norms both scale by 4. All global L-functions in the endpoint formulas are completed, including infinite factors. Euler products at central points are interpreted by analytic continuation, not an asserted absolute product convergence there.

Tamagawa measures include the global normalizing L-values. Local dt_v in GGP.8 factor the diagonal Tamagawa measure; §8 also fixes ambient dg_v factoring the Gh Tamagawa measure for convolution. Both restricted-product measure identities include their convergence and global leading-value factors. In source differential normalization dK_Tam = (Delta_K^*)⁻¹ product_v Delta_K,v dK_v^src for K = Hh,Gh (bpcz §2.3.2–§2.3.3, bpcz line 679–700). Local alpha uses dt_v, whereas sigma_v(fv) uses dg_v. With these product conventions, spherical alpha equals compact volume times the local norm. Reciprocal rescaling of measures at two places preserves the product; rescaling at a single place does not preserve the same factorization. Nonzero vectors are required before dividing by squared norms. Local L-quotients are inverted only after regular nonvanishing is proved. Orthogonal meromorphic expressions at singular points require a regular combined continuation; field division at 0/0 is no substitute. The degree-m generic Hermitian parameter has Asai pole sign (−1)^(m+1) on every cuspidal constituent: ambient degree one gives +, while ambient degree two gives − even for a partition 1+1. The unitary component factor is 2^(−`r_n`−r_(n+1)); the two witnesses are 1/4 and 1/8 for totals two and three.

## Exact supplier contracts

### From Mathlib

At baseline 6b7abb3c7686292736be2955bd3eb9ebf63b456a, consume:

- `Representation.IntertwiningMap`, `Representation.IntertwiningMap.ext`, `Representation.IntertwiningMap.isIntertwining`, and its module structure, in `Mathlib/RepresentationTheory/Intertwining.lean`. The carrier is a linear map with f composed with rho(g) equal to sigma(g) composed with f; it has no local smoothness hypothesis.
- `ContRepresentation`, `ContIntertwiningMap`, `ContIntertwiningMap.toIntertwiningMap`, `ContIntertwiningMap.ext`, and `ContRepresentation.trivial`, in `Mathlib/RepresentationTheory/Continuous/Basic.lean`. Each operator is continuous; the group has no topology requirement in this carrier. The stronger local-category contract remains separate.
- `QuadraticMap.polar`, `QuadraticMap.polarBilin` and `QuadraticMap.polar_self` in `Mathlib/LinearAlgebra/QuadraticForm/Basic.lean` supply unhalved polarization, with `polar_self` stating `polar Q x x = 2 • Q x` for a quadratic map on modules over a commutative ring.
- `LinearMap.IsSymm` and `LinearMap.IsAlt` in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean` for the symmetric and alternating comparisons, and `Matrix.unitaryGroup`, `Matrix.mem_unitaryGroup_iff` in `Mathlib/LinearAlgebra/UnitaryGroup.lean` for the standard-form check. The latter says A·star(A) = 1, not A*J*star(A) = J for arbitrary J.

### From Tau Ceti

At baseline a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, consume `ContRepresentation.intertwiningMapEquiv` and its evaluation laws from `TauCeti/RepresentationTheory/Continuous/Intertwining.lean`. Its finite-dimensional source is Hausdorff over a complete nontrivially normed field, with continuous scalar multiplication; these hypotheses are essential. Consume `Representation.IsInvariantSesqForm` and `Representation.IsInvariantSesqForm.apply` in `TauCeti/RepresentationTheory/InvariantForm/Hermitian.lean` for the star-first invariant-form comparison. Consume `TauCeti.Matrix.isCompact_unitaryGroup` in `TauCeti/Topology/Algebra/UnitaryGroup.lean` only for standard positive groups over an RCLike field, and `Matrix.UnitaryGroup.toLinearEquiv_apply` in `TauCeti/LinearAlgebra/Matrix/UnitaryGroup.lean` for their coordinate action. No arbitrary indefinite or nonarchimedean compactness conclusion follows.


For the quadratic specialization consume `QuadraticForm.exists_equivalent_hyperbolicPresentation_prod` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean`: over a field with 2 invertible, a finite-dimensional nondegenerate Q is equivalent to its Witt-index number of hyperbolic planes plus a nondegenerate anisotropic diagonal form, with the stated rank equation. Consume `TauCeti.equivalent_of_equivalent_prod` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean`: a common finite-dimensional nondegenerate quadratic summand cancels, without nondegeneracy assumptions on the two remaining summands. Consume `TauCeti.hilbertSymbol`, `TauCeti.hilbertSymbolOnSquareClasses` and `TauCeti.hilbertSymbolOnSquareClasses_squareClass` in `TauCeti/NumberTheory/HilbertSymbol/Basic.lean`: the symbol is +1 precisely for the norm equation b = x² − a y² and descends to square classes. Epsilon-factor comparison with this symbol is part of the local-factor contract. These pinned objects supply the quadratic part; the general Hermitian comparison belongs to the classical-form contract.

Consume `TauCeti.ConstantForm.groupScheme`, `TauCeti.ConstantForm.inclusion` and `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff` in `TauCeti/Algebra/AlgebraicGroup/ConstantForm/Basic.lean`: for every commutative ring R, n ≥ 0 and arbitrary constant matrix C, its points are invertible matrices M satisfying M C Mᵀ = C; C need not be nondegenerate, symmetric or alternating. The construction includes the zero ring. No smoothness or connectedness is asserted for arbitrary C.

Consume `TauCeti.Orthogonal.groupScheme` and `TauCeti.Orthogonal.pointsMulEquiv` in `TauCeti/Algebra/AlgebraicGroup/Orthogonal/Basic.lean` for C = 1 and points `Matrix.orthogonalGroup`. Consume `TauCeti.SpecialOrthogonal.definingHopfIdeal`, `TauCeti.SpecialOrthogonal.groupScheme`, `TauCeti.SpecialOrthogonal.inclusion`, `TauCeti.SpecialOrthogonal.pointsMulEquiv` and `TauCeti.SpecialOrthogonal.pointsMulEquiv_mapValue` in `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Basic.lean`: the defining ideal joins the orthogonal ideal with the determinant kernel, and points are `Matrix.specialOrthogonalGroup`, naturally in the value algebra. These constructions work over every commutative ring. Consume `TauCeti.SpecialOrthogonal.coordinateHopfAlgebraBaseChangeIso` in `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/BaseChange.lean` for arbitrary commutative scalar extension; `TauCeti.SpecialOrthogonal.instSmoothCoordinateHopfAlgebra` in `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Smooth.lean` needs `Invertible (2 : R)`. Over a field k with `NeZero (2 : k)`, consume `TauCeti.SpecialOrthogonal.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` in `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Connected.lean` and `TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra` in `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/Reductive.lean`. Consume `TauCeti.SpecialOrthogonal.definingHopfIdeal_zero`, `TauCeti.SpecialOrthogonal.definingHopfIdeal_one` and `TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra_zero` and `TauCeti.SpecialOrthogonal.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra_one` in `TauCeti/Algebra/AlgebraicGroup/SpecialOrthogonal/LowRank.lean`: SO(0) and SO(1) are trivial over every commutative ring and reductive over every field, without a hypothesis on 2. Arbitrary quadratic forms require the constant-form comparison contract below, rather than identifying their Gram matrices with 1.

Consume `TauCeti.Symplectic.groupScheme`, `TauCeti.Symplectic.pointsMulEquiv` and `TauCeti.Symplectic.pointsMulEquiv_mapValue` in `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean`, with points `TauCeti.GLSymplecticFin`, and `TauCeti.Symplectic.schemePointsMulEquiv` in `TauCeti/Algebra/AlgebraicGroup/Symplectic/Scheme.lean`. These use the standard alternating form in dimension m + m over any commutative ring, including m = 0. Consume `TauCeti.Symplectic.coordinateHopfAlgebraBaseChangeIso` in `TauCeti/Algebra/AlgebraicGroup/Symplectic/BaseChange.lean` and `TauCeti.Symplectic.instSmoothCoordinateHopfAlgebra` in `TauCeti/Algebra/AlgebraicGroup/Symplectic/Smooth.lean`, with no hypothesis on 2; over every field consume `TauCeti.Symplectic.geometricallyConnectedCommHopfAlgProperty_coordinateHopfAlgebra` and `TauCeti.Symplectic.reductiveCommHopfAlgProperty_finiteTypeCoordinateHopfAlgebra` in the corresponding `Connected.lean` and `Reductive.lean` files.

Consume `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` and `LinearMap.BilinForm.IsAlt.even_finrank` in `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean`: every finite-dimensional nondegenerate alternating form over any field has standard matrix `Matrix.J` in a suitable basis. On its rank-two plane the basis has B(inr(0),inl(0)) = 1; the roadmap’s plane B(e,f) = 1 is read with inl(0) = f and inr(0) = e. Symplectic occurrences below use this basis to transport the pinned standard scheme and its matrix point topology; over a local field finite-dimensional changes of basis are homeomorphisms. This supplies the alternating specialization without another scheme-construction contract.

Consume `TauCeti.HeisenbergGroup`, `TauCeti.HeisenbergGroup.mul_z` and `TauCeti.HeisenbergGroup.commutatorElement_eq` in `TauCeti/GroupTheory/SpecificGroups/Heisenberg.lean` for the split plane comparison: its matrix central coordinate has product z + zprime + x yprime, and changing to z − xy/2 gives the half-commutator convention. The arbitrary symplectic/oscillator extension remains a supplier gap.

### From TauCetiRoadmap.ReductiveGroups

Layer 0, Layer 3, Layer 5, Layer 7: Affine group schemes and points, components, unipotent radicals and flag parabolics.

### From TauCetiRoadmap.OrthogonalSpinGroups

Layer 0: O and determinant-one SO point groups of nondegenerate quadratic forms over fields with 2 invertible. Layers 2–3: local topology over ℝ or ℚ_p, and restricted products of these point groups with specified compact-open reference data; no affine SO scheme identification is consumed from these layers.

### From TauCetiRoadmap.RestrictedProducts

Layer 1, Layer 2, Layer 3: Eventual componentwise maps, change of factors, away-S decomposition and rational diagonals.

### From TauCetiRoadmap.GlobalNumberFields

Layer 0, Layer 4, Layer 5, Layer 8, Layer 9: Number-field places, scalar adeles, finite extension norms and Hecke characters.

### From TauCetiRoadmap.ReductiveGroupsPartII

What ReductiveGroupsPartII must provide (gap:hermitian-witt): For a field F with 2 invertible and A = F with trivial involution or quadratic étale A/F including F × F, supply nondegenerate epsilon-Hermitian forms on finite projective A-modules, orthogonal sums and complements, conjugate duals, Witt decomposition and cancellation with isometry transport, reusing the pinned quadratic decomposition/cancellation for the symmetric trivial-involution specialization and LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J in TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean for the alternating trivial-involution specialization. Section binding: missing: epsilon-Hermitian operations and Witt comparison.

What ReductiveGroupsPartII must provide (gap:classical-group-points): For finite free nondegenerate epsilon-Hermitian forms over a quadratic étale A/F including split A, with F a field and 2 invertible, supply their smooth connected unitary group schemes, isometry point functors and base changes, and their topological identification with the local isometry groups over every local field of characteristic different from 2, using the pinned symplectic schemes and symplectic-basis theorem for alternating forms with trivial involution instead of rebuilding them. Section binding: missing: unitary schemes and points.

What ReductiveGroupsPartII must provide (gap:orthogonal-scheme-points): For a finite-dimensional nondegenerate quadratic Q over a field F with 2 invertible and chosen Gram matrix C of its unhalved polar form, identify the points of TauCeti.ConstantForm.groupScheme at C and of its determinant-one cut, formed by joining the pinned constant-form Hopf ideal with the pinned determinant kernel as in TauCeti.SpecialOrthogonal.definingHopfIdeal, with OrthogonalSpinGroups Layer 0, compatibly with Gram-matrix changes and scalar extension and as topological groups over every local field of characteristic different from 2, including finite extensions of Q2, explicitly converting the pinned M C Mᵀ = C convention to column isometries by M ↦ (Mᵀ)⁻¹. Section binding: missing: quadratic constant-form point comparison.

What ReductiveGroupsPartII must provide (gap:classical-flags): For the preceding arbitrary nondegenerate classical forms and each complete isotropic flag, supply its parabolic stabilizer, Levi and unipotent radical identified with the explicit form-coordinate subgroups, compatible with scalar extension and with the SO point comparison, including maximal-isotropic SO components and empty flags. Section binding: missing: classical flag stabilizers and radicals.

What ReductiveGroupsPartII must provide (gap:marked-inner-forms): For these connected classical groups over F with 2 invertible, supply the classification of marked pure inner twists by form data with their discriminant, parity and marking restrictions, preserving orthogonal complements and isometries and proving that split GL groups have no nontrivial pure inner twists. Section binding: missing: marked pure twists and forms.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

What SmoothRepresentationsOfLocalGroups must provide (gap:smooth-functors): For every nonarchimedean local field and complex representations of its classical point groups or required finite covers, supply the smooth category with admissible and finite-length subcategories, restriction, smooth contragredient and algebraic tensor functors and their intertwiner comparisons, allowing arbitrary smooth objects in model constructions. Section binding: missing: smooth representation categories and functors.

What SmoothRepresentationsOfLocalGroups must provide (gap:casselman-wallach): For real and complex reductive groups and the Jacobi oscillator extensions used here, supply jointly continuous smooth nuclear Frechet moderate-growth admissible Z-finite representations, continuous contragredients, restriction and completed projective tensors with their jointly continuous bilinear universal property, so the model Hom spaces use continuous functionals. Section binding: missing: Casselman–Wallach tensor topology.

What SmoothRepresentationsOfLocalGroups must provide (gap:induction-jacquet): For nonarchimedean reductive groups and their parabolics, supply unnormalized Ind and compact ind, normalized i_P(rho) = Ind_P(delta_P^(1/2) rho), exact Jacquet functors and reciprocity with each modulus stated, including the mirabolic generic quotient of supercuspidal GL data and the restriction filtrations used in ggp §§15–16. Section binding: missing: induction Jacquet and reciprocity.

What SmoothRepresentationsOfLocalGroups must provide (gap:bernstein-exclusions): For finite-length smooth representations over nonarchimedean local fields of characteristic different from 2, supply inertial Bernstein decomposition, vanishing of Hom and Ext between disjoint blocks, finite Jacquet support and existence of supercuspidal GL data outside the finite forbidden supports with irreducible auxiliary classical induction, including each maximal-isotropic SO orbit. Section binding: missing: Bernstein separation and auxiliary data.

What SmoothRepresentationsOfLocalGroups must provide (gap:distribution-descent): For characteristic-zero local fields, the reductive and Jacobi groups of §§3.1–3.2 and their smooth or Casselman–Wallach categories, supply invariant distribution spaces, Fourier transforms and descent to the relevant linear slices together with the Gelfand–Kazhdan implication from anti-involution invariance to the continuous or smooth multiplicity bound. Section binding: missing: distribution descent and Gelfand–Kazhdan.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:parameter-carriers): For local fields of characteristic different from 2 supply Weil and Weil–Deligne groups, L-groups and actual continuous semisimple classical parameters with selfdual or conjugate-dual pairings and signs, complex centralizers, component groups and determinant-one subgroups with scalar extension and ordinary complex dual conventions. Section binding: missing: Weil and classical parameter carriers.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:enhanced-classification): For the characteristic-zero local unitary groups and their marked pure inner forms used in the proved theorems, supply actual enhanced classification with tempered and generic domains, normalized Langlands induction and component-label laws, contragredient and Whittaker-change laws, satisfying, at nonarchimedean places, bp-refined §7.2 CLL/Stab/TE/TET with its transfer-factor constants and the labeling of §§7.7,8.3 relative to a fixed nu0 ∈ Fˣ with residual-line norm +nu0 when the larger space has even dimension and −nu0 when it has odd dimension as in bp-refined 4.1(1), with mu(G) relative to the same nu0 and these labels identified with ggp p.67 and §4.4, with the real-place stability, transfer and prescribed Whittaker model supplied separately below; in the general classical conjecture propositions these laws remain explicit classification hypotheses. Section binding: missing: enhanced local classification and labeling.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:tempered-stability): For F = R or a finite extension of Qp, quasi-split unitary G, each tempered phi and every marked pure inner G_alpha, supply stability on regular semisimple elements of the sum of characters of the actual packet Pi_G_alpha(phi), including empty packets, as in bp-arch §12.3 STAB. Section binding: missing: tempered STAB law.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:tempered-transfer): For the same characteristic-zero local unitary data, supply transfer of the reference stable packet character multiplied by the Kottwitz sign e(G_alpha) to the stable packet character on each pure inner form, with the source transfer normalization in bp-arch §12.3 TRANS. Section binding: missing: tempered TRANS law.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:tempered-whittaker): For the quasi-split reference unitary group over R or a finite extension of Qp, each tempered phi and each regular nilpotent orbit determining a Whittaker datum, supply exactly one member of Pi_G(phi) with that Whittaker model, as in bp-arch §12.3 WHITT. Section binding: missing: tempered WHITT law.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:global-base-change): For E/F a quadratic number-field extension and actual cuspidal representations of a degree-m unitary group with generic global Arthur parameter (trivial Arthur SL2), supply weak and strong all-place base change and the generic discrete automorphic multiplicity formula. Write BC(sigma) as the full parabolic induction of pairwise distinct conjugate-selfdual cuspidal constituents Pi_i of degrees d_i with sum_i d_i = m; every Pi_i has an Asai sign (−1)^(m+1) pole at 1, independently of d_i. Supply this generic base change for every everywhere-tempered cuspidal sigma and compatibility with its tempered local enhancements; no such decomposition is required for nongeneric Arthur parameters with nontrivial Arthur blocks. For classical conjecture formulations supply parameter domains without assuming unproved global classification (bpcz §§1.1.3–1.1.4, p. 3, bpcz line 93–118; §1.1.6, p. 4, bpcz line 148–151). Section binding: missing: unitary base change and discrete multiplicity.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:trace-distributions): For quadratic number-field extensions and actual linear and unitary Jacquet–Rallis Schwartz spaces supply their geometric and spectral distributions and the trace equality for matching regular orbital integrals with all convergence and regularization domains stated, and the local unitary relative trace expansion on tempered characteristic-zero local groups used in §5. Section binding: missing: Jacquet–Rallis trace distributions.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:finite-smooth-transfer): For every nonarchimedean completion of a quadratic number-field extension including dyadic, ramified and split places, supply smooth transfer between the actual Jacquet–Rallis test spaces matching regular orbital integrals with the specified transfer factor and differential Haar normalization. Section binding: missing: finite-place smooth transfer.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:archimedean-transfer): For real and complex completions supply a dense transferable subspace of the actual Jacquet–Rallis Schwartz spaces with continuous orbital-integral and relative-character distributions, so identities on matching functions extend by continuity in the stated Schwartz topology. Section binding: missing: dense continuous archimedean transfer.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:spherical-base-change): At every unramified hyperspecial place of the quadratic extension where spherical data exist, supply the Jacquet–Rallis unit fundamental lemma and spherical Hecke base-change homomorphism with its Satake eigenvalue relation and compact-volume normalization; this almost-everywhere input does not exclude any local integrals from the endpoints. Section binding: missing: spherical transfer and base change.

What EndoscopicTransferAndUnitaryTraceComparison must provide (gap:relative-character-constants): For tempered unitary sigma_v with actual base change Pi_v and convergent traces, supply on matching test functions the source-differential identity I_Pi_v(fv) = kappa_v J_sigma_v^raw(fhv) with specified kappa_v ∈ Cˣ, product_(v in S) kappa_v = 1 for globally compatible source data as in bpcz §10.3.5 (bpcz line 4939–4941), and its conversion J_v = b_G,v b_H,v Cv⁻¹ J_sigma_v^raw when Cv is finite nonzero and the ambient and diagonal measures are multiplied by b_G,v and b_H,v, including the resulting change of comparison constants. Section binding: missing: normalized local character comparison constants.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

What AutomorphicLFunctionsAndLocalFactors must provide (gap:factor-change-laws): For actual local Weil–Deligne or archimedean parameters supply meromorphic L and epsilon factors with geometric Frobenius q⁻¹, direct-sum/tensor/dual laws, conjugate-dual signs, additive-character scaling by the determinant and absolute-value factors at its stated s, and comparison with the pinned norm-equation Hilbert symbol rather than a second Hilbert symbol. Section binding: missing: local factor laws and character changes.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:tempered-factor-regularity): For every place of a quadratic number-field extension and actual tempered sigma_v of the adjacent unitary pair with actual local base change, supply finiteness and nonvanishing of Cv = product_(i=1 to n+1) L_v(i,eta_v^i) L_v(1/2,Pi_n,v × Pi_n+1,v)/L_v(1,sigma_v,Ad), including dyadic, ramified and archimedean places; give the analogous local analytic inputs on the stated tempered orthogonal domain. Section binding: missing: tempered local quotient regularity.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:global-completed-factors): For actual global parameters on the stated global-field classical domain supply completed Hecke, Rankin–Selberg, Asai and adjoint factors with their meromorphic continuation domains, and for everywhere-tempered cuspidal unitary sigma over number fields prove L(1,sigma,Ad) finite nonzero and identify its base-change Asai quotient using the constituent pole dichotomy, retaining analytic-continuation hypotheses for the general orthogonal conjecture. Section binding: missing: completed factors adjoint and Asai comparison.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

What MetaplecticAutomorphicForms must provide (gap:heisenberg-svn): For any finite-dimensional symplectic F-space over a field with 2 invertible supply the Heisenberg extension with product central term b/2 and commutator b, comparing the split plane to Tau Ceti HeisenbergGroup by z_half = z_matrix − xy/2, and for local F and nontrivial continuous unitary psi supply its irreducible oscillator with central character psi and Stone–von Neumann uniqueness. Section binding: missing: Heisenberg and Stone–von Neumann.

What MetaplecticAutomorphicForms must provide (gap:oscillator-splittings): For symplectic and skew-Hermitian local spaces over F with characteristic different from 2, supply the metaplectic double cover, genuine oscillator and unitary splittings indexed by psi and mu|Fˣ = omega(A/F), their dual and change-of-data laws and mixed-model Jacquet evaluation with exact Levi multipliers, including the dual unitary multiplier mu(det_E)⁻¹ abs(det_E)_E^(1/2) and compatible smaller-space splitting. Section binding: missing: covers splittings and mixed models.

What MetaplecticAutomorphicForms must provide (gap:global-theta): For the global fields of characteristic different from 2 and classical dual pairs of §6.2 with rationally trivial psi and compatible splitting characters, supply the actual Schwartz theta series, rational invariance, normal convergence on compacta and polynomial growth on Siegel sets, including genuine covers and the split algebra. Supply Poisson summation with compatible self-dual measures and the zero-vector and dual zero-vector asymptotics used by §6.2a. Convergence of a theta series at each group element does not assert convergence of its relative period. The central Mellin theta family and its pairing with cusp forms are constructed in §6.2a. Section binding: missing: global theta realization and convergence.

What MetaplecticAutomorphicForms must provide (gap:theta-seesaw): For E/F quadratic with F nonarchimedean characteristic zero and compatible unitary dual pairs, supply Howe duality, irreducibility of nonzero tempered big lifts and the seesaw Hom equivalence of gan-ichino Proposition 1.1 and §1.3 with the same psi, splitting characters and ordinary/smooth dual convention, without using relative GGP selection as a hypothesis. Section binding: missing: Howe duality and tempered seesaw.

What MetaplecticAutomorphicForms must provide (gap:theta-parameter-laws): For E/F quadratic with F nonarchimedean characteristic zero, fix psi, trace-zero delta ∈ Eˣ and chi_V|Fˣ = omega(E/F)^dim V, chi_W|Fˣ = omega(E/F)^dim W; supply equal-rank theta(phi) = phi tensor chi_V⁻¹chi_W with nonzero tower determined by epsilon(1/2,phi tensor chi_V⁻¹,psi composed with Tr(delta·)) = epsilon_V epsilon_W, and almost-equal-rank theta(phi) = (phi tensor chi_V⁻¹chi_W) ⊕ chi_W with P2 enhancement restricting to eta when chi_V is absent and equal to eta on the identified component groups when chi_V occurs, the extra sign fixed by the target inner form, using label character psi_E(x) = psi(Tr(delta x)/2) as in gan-ichino Theorems 4.1,4.4 and §4.6, with no downstream GGP hypothesis. Section binding: missing: equal-rank parameters and enhanced P2.

What MetaplecticAutomorphicForms must provide (gap:generic-standard-modules): For nonarchimedean characteristic-zero unitary groups and a generic parameter in its actual Langlands classification, supply irreducibility of its normalized standard modules on the relevant pure inner forms and the standard-module theta comparison in gan-ichino Propositions 9.1–9.2, with their ordered real exponents and compatible splitting data. Section binding: missing: generic standard-module irreducibility.

### From TauCetiRoadmap.AdelicAlgebraicGroups

What AdelicAlgebraicGroups must provide (gap:adelic-points): For affine classical group schemes over number fields or global function fields of odd characteristic, supply restricted-product adelic points with rational diagonals and functorial subgroup/base-change maps, using integral models outside finitely many places and the general SO scheme/point identification. Section binding: missing: group adeles and rational diagonals.

What AdelicAlgebraicGroups must provide (gap:quotient-integration): For these global groups supply quotient integration by counting measure on rational points, finite covolume for connected reductive groups with anisotropic connected center and finite volume modulo the split center otherwise, and volume one for F-split unipotent quotients with their Tamagawa measure, over both number fields and odd-characteristic global function fields. Section binding: missing: quotient integration and volumes.

What AdelicAlgebraicGroups must provide (gap:tamagawa-factorization): For the same global fields and smooth connected classical groups K, supply invariant rational differential local measures and convergence factors with the exact formula dK_Tam = (Delta_K^*)⁻¹ product_v Delta_K,v dK_v^src, finite-S decomposition and positive local rescalings whose product is dK_Tam, separately for ambient Gh convolution and diagonal Hh integration, identifying the unitary factors used in bpcz §2.3. Section binding: missing: differential measures and Tamagawa products.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

What AutomorphicFormsOnReductiveGroups must provide (gap:cuspidal-tensors): For the global classical groups and covers of §6 over number fields or odd-characteristic global function fields, supply actual irreducible ordinary and genuine cuspidal automorphic realizations with local restricted tensor factorization and almost-everywhere spherical vectors, using a fixed unitary central character and quotient by the split center for split GL norms. Section binding: missing: ordinary and genuine cuspidal tensor realizations.

What AutomorphicFormsOnReductiveGroups must provide (gap:petersson-pairings): For these actual cuspidal realizations supply positive Tamagawa Petersson pairings, modulo the split center when necessary, and their isometric restricted tensor identification with chosen invariant local pairings and norm-one spherical reference vectors, so global orthonormal expansions and local trace contractions use compatible Hilbert structures. Section binding: missing: Petersson pairings and local tensors.

What AutomorphicFormsOnReductiveGroups must provide (gap:period-growth): For the actual cusp and theta inputs of §6.1–§6.2 supply rapid decay modulo the split center and theta growth bounds implying absolute convergence of the Bessel periods and of Fourier–Jacobi periods for nonsplit classical groups, split pairs of unequal ranks and the rank-zero trivial pair. For split positive equal rank supply center-quotient rapid-decay estimates against polynomially bounded automorphic kernels, locally uniformly on regular meromorphic parameter domains; §6.2a applies these estimates to its central theta family. Do not assert convergence of the full-quotient equal-rank theta integral from a fixed unitary central character or a center-quotient Petersson norm. Section 6.2a owns the relative regularization and its comparison, rather than assuming integrability. Section binding: missing: cusp and theta-cusp period estimates.

### From TauCetiRoadmap.AutomorphicSpectralTheory

What AutomorphicSpectralTheory must provide (gap:local-tempered-estimates): For characteristic-zero local adjacent classical pairs supply Harish-Chandra matrix-coefficient and restriction bounds sufficient for the absolute H integrals and trace-integrated convolution in §§7.3,7.6,8.1 for tempered representations, on the actual finite-place or archimedean Schwartz spaces and with no dyadic or ramified exclusion. Section binding: missing: local tempered restriction estimates.

What AutomorphicSpectralTheory must provide (gap:schwartz-trace): For the stated local tempered representations and global actual cuspidal realizations over number fields supply continuous Schwartz convolution, smoothing trace estimates and absolutely convergent K-finite orthonormal-basis expansions for the relative distributions of §8.1, with ambient Haar measure explicit, sufficient for basis changes, spectral summation and local rank-one extraction. Section binding: missing: Schwartz convolution and trace sums.

What AutomorphicSpectralTheory must provide (gap:eisenstein-periods): For actual star-generic Jacquet–Rallis cuspidal data over quadratic number-field extensions supply Eisenstein meromorphic continuation, regularized Rankin–Selberg and Flicker–Rallis periods with their regular parameter domains, generic truncation and continuous functional analysis used in bpcz §§3–9, without assuming the contribution identities proved in §8.2. Section binding: missing: Eisenstein and regularized period interfaces.

What AutomorphicSpectralTheory must provide (gap:endoscopic-isolation): For actual cuspidal spectral data and Hermitian discrete Arthur base changes over quadratic number-field extensions supply Schwartz spectral multipliers and convergent cuspidal isolation separating the required base-change spectrum as in bplzz §§2–3, including endoscopic constituents and with no split-supercuspidal hypothesis. Section binding: missing: cuspidal isolation without supercuspidal restriction.

Each unbound supplier output is an explicit prerequisite; none is assumed from a roadmap name. A number-field-only measure section does not discharge its global function-field contract.

## How to read the build

Layers 1–2 construct the actual relative objects from the imported classical carriers and representation categories. Layer 3 states proved multiplicity bounds at their exact ranges and the general assertion separately. Layer 4 builds the explicit component characters before stating selection within packets. Layer 5 supplies the certified unitary local results. Layer 6 builds ordinary global periods, the split equal-rank meromorphic central theta pairing and their L-representation; Layer 7 gives local normalization and the orthogonal conjecture propositions. Layer 8 compares actual relative distributions and proves the unitary endpoints. Each target’s proof route identifies its mathematical reductions; the Needs line terminates at pinned declarations, named supplier sections, earlier targets or explicit contract gaps. Checks are discriminating mathematical specifications for the definitions; they do not substitute a spherical instance for local analytic theory.

## Layer 1: Relative classical pairs and their subgroups

### 1.1 Relevance of an inclusion

Define `GGP.RelevantPair`. Define a relevant pair as an isometric inclusion W ↪ V with nondegenerate image, complement C, epsilon·(−1)^rank(C) = −1, and a maximal isotropic submodule of C of rank floor(rank(C)/2). An odd complement includes its residual nonisotropic line; the ambient V need not be split. Work with F a field with 2 invertible; A is F with identity involution or a quadratic étale F-algebra with its canonical involution; epsilon ∈ {1,−1}; all form modules are finite free and nondegenerate. (ggp, §2, pp. 5–7; ggp line 179, ggp line 229).

The proof route is as follows. Take the complement through the perfect pairing and apply imported Witt decomposition; retain its isometry class, not merely its dimension.

The interface includes `GGP.RelevantPair.mkOfWittDecomposition`: A decomposition C = X ⊕ X∨ in the skew case, or X ⊕ L ⊕ X∨ in the symmetric case with L nonisotropic, constructs the pair.; `GGP.RelevantPair.ext`: Two witnesses on the same isometric inclusion define the same relevance proposition.; `GGP.RelevantPair.transport`: Isometries of both spaces commuting with the inclusion preserve relevance; identity and composition agree.; `GGP.RelevantPair.codim_parity`: Symmetric pairs have odd codimension and skew pairs have even codimension, including zero.

*Needs:* `gap:hermitian-witt` (ReductiveGroupsPartII), OrthogonalSpinGroups §Layer 0, Mathlib `LinearMap.IsSymm`, Mathlib `LinearMap.IsAlt`, Mathlib `QuadraticMap.polar_self`, Tau Ceti `QuadraticForm.exists_equivalent_hyperbolicPresentation_prod`, Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`.

**Checks.**

- `relevant_symplectic_zero`: For W = V = 0 with epsilon = −1, relevance holds; with epsilon = +1 it fails, detecting an omitted parity condition.
- `relevant_anisotropic_line`: The inclusion 0 ↪ ⟨1⟩ over R is relevant; the real positive plane as complement of 0 fails both odd parity and splitness.
- `relevant_nonsplit_even_complement`: For skew-Hermitian diagonal form i·diag(1,1) over C/R, the inclusion 0 ↪ V has even complement but no isotropic line and is not relevant; parity alone is insufficient.
- `hermitian_conjugate_dual`: On the C/R hyperbolic Hermitian plane with B(e,f) = 1, the isometry e ↦ i e, f ↦ i f preserves B(e,f), whereas using the ordinary inverse f ↦ −i f changes it to −1.
- `polar_unhalved_witness`: For Q(x) = x² over Q, the Mathlib polar form has B(1,1) = 2; using the half-polar form would give 1.
- `alternating_orientation_witness`: On the alternating plane B(e,f) = 1 and B(f,e) = −1; the pinned Matrix.J basis is (f,e), with B(inr(0),inl(0)) = 1. Keeping (e,f) instead gives −Matrix.J and reverses the Heisenberg commutator sign in §2.2.

### 1.2 The flag subgroup and its embedding

Construct `GGP.relativeSubgroup`. For a relevant pair and a complete flag in X in a Witt decomposition of its complement, construct P = stabilizer(flag), N = Ru(P), and H = N ⋊ G(W); construct the closed embedding j(n,g) = (n·i(g),g) into G(V) × G(W), where i(g) acts trivially on the complement and G means the connected isometry group. Work with F a field with 2 invertible; A is F with identity involution or a quadratic étale F-algebra with its canonical involution; epsilon ∈ {1,−1}; all form modules are finite free and nondegenerate; A relevant pair and a complete isotropic flag as in §1.1. (ggp, §2, p. 7; ggp line 244; §12, p. 43; ggp line 1541).

The proof route is as follows. Restrict the imported parabolic Levi action to G(W); prove it normalizes Ru(P). Use the semidirect universal property and projection to prove injectivity.

The interface includes `GGP.relativeSubgroup_apply`: The two coordinate formulas are j(n,g).1 = n·i(g) and j(n,g).2 = g.; `GGP.relativeSubgroup_ker_projection`: The kernel of H → G(W) is N.; `GGP.relativeSubgroup_congr`: A compatible change of Witt flag induces conjugate subgroup embeddings, with identity/composition coherence.

*Needs:* §1.1, ReductiveGroups §Layer 0, ReductiveGroups §Layer 5, ReductiveGroups §Layer 7, `gap:classical-group-points` (ReductiveGroupsPartII, unitary schemes and points), `gap:orthogonal-scheme-points` (ReductiveGroupsPartII), `gap:classical-flags` (ReductiveGroupsPartII), Tau Ceti `TauCeti.Symplectic.schemePointsMulEquiv`, Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, Tau Ceti `TauCeti.ConstantForm.groupScheme`.

**Checks.**

- `relativeSubgroup_codim_one`: For a one-dimensional symmetric complement X = 0, N = 1 and j is the diagonal smaller group; including extra unipotents would fail.
- `relativeSubgroup_codim_zero`: For a zero-dimensional skew complement H = G(W) and j(g) = (g,g), not (g,1).
- `relativeSubgroup_two_coordinates`: For n = 1 in the unipotent radical and any g, j(1,g) = (i(g),g), whereas j(u,1) = (u,1); this distinguishes product from diagonal projections.
- `classical_points_gram_orientation`: Over Q, let C = diag(1,4) and M = [[0,1/2], [−2,0]]. Then det M = 1 and M C Mᵀ = C, but Mᵀ C M = diag(16,1/4). Its column isometry is T = (Mᵀ)⁻¹ = [[0,2], [−1/2,0]], with Tᵀ C T = C; using M itself would fail the arbitrary-Gram comparison.
- `classical_points_low_ranks`: For n = 0 the constant-form point group and its determinant-one cut are trivial. In rank one with C = (a), a ≠ 0, the point equation is u² = 1 and the determinant-one cut forces u = 1; this agrees with pinned SO(0), SO(1) and Sp(0), rather than importing an extra low-rank scheme construction.

### 1.3 Relevance across pure inner forms

Define `GGP.IsRelevantInnerForm`. For a pure inner twist of G(V) × G(W) represented by marked form spaces (V′,W′), define relevance by existence of a nondegenerate isometric inclusion W′ ↪ V′ whose complement is isometric to C = W⊥; equal rank alone does not identify twists. Work with F a field with 2 invertible; A is F with identity involution or a quadratic étale F-algebra with its canonical involution; epsilon ∈ {1,−1}; all form modules are finite free and nondegenerate; The original relevant pair and an actual marked pure inner twist supplied by the marked-form contract. (ggp, Lemma 2.1 and relevance paragraph, pp. 6–7; ggp line 217, ggp line 255).

The proof route is as follows. Use classification of pure twists and Witt cancellation; transport the complement isometry and the subgroup of §1.2.

The interface includes `GGP.IsRelevantInnerForm.refl`: The marked identity twist is relevant.; `GGP.IsRelevantInnerForm.transport`: Isomorphisms of marked twists preserve relevance.; `GGP.IsRelevantInnerForm.complement`: A relevance witness gives an isometry of its complement with the original complement and hence matching discriminants.

*Needs:* §1.1, §1.2, `gap:hermitian-witt` (ReductiveGroupsPartII), `gap:marked-inner-forms` (ReductiveGroupsPartII), Tau Ceti `TauCeti.equivalent_of_equivalent_prod`.

**Checks.**

- `inner_zero_complement`: For C = 0 in an equal-rank skew pair, relevance requires V′ ≅ W′; equal dimensions alone do not suffice.
- `inner_real_complement`: Take W to be a positive real line and V of signature (3,1), with split complement C of signature (2,1). In the pure inner twist V′ of signature (1,3), a positive W′ has negative-definite three-dimensional complement. The dimensions and discriminants of V′,W′ match V,W, but this complement is not isometric to C; relevance fails.
- `inner_split_GL`: For A = F × F, pure inner forms of the GL factors are trivial; counting central simple algebra inner forms as pure twists gives a wrong extra member.

### 1.4 The split quadratic-algebra comparison

Prove `GGP.splitPairEquiv`. For A = F × F with swap involution, identify V with V0 ⊕ V0∨ as an A-module with its evaluation epsilon-form; restriction to V0 identifies G(V) with GL(V0), and identifies j(H) and the relative form constructions with the GL Bessel/Fourier–Jacobi constructions of §13. Its character identification uses generating residual vectors and factorwise nontrivial additive characters as in §2.1, and unimodular Fourier–Jacobi functionals as in §2.2; it does not identify degenerate data with the generic GL model. Work with F is a field with 2 invertible; A is F with identity involution or a quadratic étale F-algebra with its canonical involution; epsilon ∈ {1,−1}; all form modules are finite free and nondegenerate; A = F × F, a chosen split-module decomposition and a relevant pair. (ggp, §2, p. 6; ggp line 203; §13, pp. 53–56; ggp line 1893).

The proof route is as follows. The second factor is forced to be inverse dual by the perfect pairing; evaluate on each idempotent of A. Compute the flag stabilizer and its radical in these coordinates.

*Needs:* §1.2, `gap:hermitian-witt` (ReductiveGroupsPartII), `gap:classical-group-points` (ReductiveGroupsPartII, unitary schemes and points).

**Checks.**

- `split_line_inverse`: For V0 = F and a ∈ Fˣ, the isometry is (a,a⁻¹); taking (a,a) fails preservation for a² ≠ 1.
- `split_rank_zero`: For V0 = 0 both groups are trivial.

### Examples

The hyperbolic symplectic plane, the anisotropic real plane and a split quadratic-algebra line distinguish relevance from ambient quasi-splitness.

### Dependencies

`gap:hermitian-witt` (ReductiveGroupsPartII), OrthogonalSpinGroups §Layer 0, Mathlib `LinearMap.IsSymm`, Mathlib `LinearMap.IsAlt`, Mathlib `QuadraticMap.polar_self`, Tau Ceti `QuadraticForm.exists_equivalent_hyperbolicPresentation_prod`, Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, ReductiveGroups §Layer 0, ReductiveGroups §Layer 5, ReductiveGroups §Layer 7, `gap:classical-group-points` (ReductiveGroupsPartII), `gap:orthogonal-scheme-points` (ReductiveGroupsPartII), `gap:classical-flags` (ReductiveGroupsPartII), Tau Ceti `TauCeti.Symplectic.schemePointsMulEquiv`, Tau Ceti `TauCeti.ConstantForm.groupScheme`, `gap:marked-inner-forms` (ReductiveGroupsPartII), Tau Ceti `TauCeti.equivalent_of_equivalent_prod`.

## Layer 2: Bessel and Fourier–Jacobi models

### 2.1 Bessel characters

Construct `GGP.besselCharacter`. For epsilon = +1 and complement X ⊕ L ⊕ X∨, choose e generating the free residual A-line L (so B(e,e) ∈ Fˣ), a basis v1,…,vr of X and dual vectors v′i. For r > 0 define l(u) = sum(i=1,…,r−1) B(u·v(i+1),v′i) + B(u·e,v′r) and nu(u,g) = psi(l(u)); for r = 0 put nu = 1. Construct this as a unitary character of H; for quadratic algebras use the additive character on A, equivalently its F-linear trace pairing. For quadratic A require psi_A(x) = psi_F(Tr(A/F)(c x)), with c ∈ Aˣ and psi_F nontrivial; equivalently psi_A is nontrivial on each simple factor. Before conjugacy prove that every flag simple-root coordinate, and both residual coordinates in the split GL description, has a nonzero coefficient. Work with F is a field with 2 invertible; A is F with identity involution or a quadratic étale F-algebra with its canonical involution; epsilon ∈ {1,−1}; all form modules are finite free and nondegenerate; F is a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; epsilon = +1, a relevant pair, a Witt flag and the displayed generating vector and factorwise nontrivial character data. (ggp, §12, pp. 44–46; ggp line 1585, ggp line 1624, ggp line 1633).

The proof route is as follows. Compute l on products modulo the radical commutator, show its G(W)-invariance, and extend over the semidirect product. Torus conjugation compares the nonzero coordinates.

The interface includes `GGP.besselCharacter_apply`: nu(u,g) = psi(l(u)), independent of g.; `GGP.besselCharacter_conjugate`: Different admissible flags, generating e and factorwise nontrivial psi_A give conjugate pairs (H,nu); the simple-root coefficients are nonzero before applying torus conjugation.; `GGP.besselCharacter_baseChange`: Isometries commuting with the inclusion transport the character; restriction to local fields agrees with the algebraic l-map.; `GGP.besselCharacter_simpleRoots`: For the displayed admissible data, the flag coordinates and, for A = F × F, both residual GL coordinates carry nontrivial additive characters; in rank-zero flag cases this assertion has no coordinates.

*Needs:* §1.2, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups).

**Checks.**

- `bessel_codim_one`: With r = 0 the empty sum gives nu = 1; accessing v′0 would be undefined.
- `bessel_two_terms`: In split GL coordinates with r = 2 and l(u) = x1 + z, setting (x1,z) = (1,−1) gives nu(u) = 1; using a difference gives psi(2). Choose psi with psi(2) ≠ 1 to make this a negative control.
- `bessel_nonzero_coordinate`: In the same additive quotient, (x1,z) = (t,0) with psi(t) ≠ 1 gives nu ≠ 1; the identically trivial character is excluded for r > 0.
- `bessel_split_vector_rejected`: For A = F × F, e = (1,0)e0 in a free residual line is nonzero but does not generate L; its norm is zero and in the W = 0, rank-A V = 3 model one GL3 simple-root character vanishes.
- `bessel_split_character_rejected`: For A = F × F, psi_A(x,y) = psi_F(x) has trace coefficient c = (1,0), which is not a unit; in the GL3 model it kills one simple-root subgroup even with e = e0.
- `bessel_split_GL3_generic`: For W = 0, rank-A V = 3, e = e0 and psi_A(x,y) = psi_F(x+y), choose root coordinates so nu(u) = psi_F(u12+u23); both coefficients are 1 and both root restrictions are nontrivial.

### 2.2 The relative Heisenberg quotient

Construct `GGP.fourierJacobiQuotient`. For epsilon = −1 and rank X > 0, construct the G(W)-equivariant central quotient N(X) → Heis(W,b0), where b0 = 2B for A = F and b0 = Tr(A/F) B for quadratic A/F. The central map is dual to pullback of Hermitian forms along an A-linear surjection ell : X → A (a unimodular functional), and the vector quotient map is that functional tensor id_W. For X = 0 use the identity Jacobi action of G(W) on Heis(W,b0), with no nonexistent functional on X. In the split algebra both component functionals must be nonzero. Prove that ell tensor id_W is onto W and that the F-linear central map is onto F; consequently the group map is surjective. Work with F is a field with 2 invertible; A is F with identity involution or a quadratic étale F-algebra with its canonical involution; epsilon ∈ {1,−1}; all form modules are finite free and nondegenerate; A relevant skew pair and, when X ≠ 0, an A-linear surjection ell : X → A and a complete isotropic flag whose maximal unipotent fixes ell. (ggp, §12, pp. 47–50; ggp line 1683, ggp line 1703, ggp line 1723, ggp line 1785).

The proof route is as follows. Identify N(X)/Z(X) with X ⊗ W and its center with Hermitian forms. Compute the commutator pairing before applying Stone–von Neumann. Choose x with ell(x) = 1: w maps back to x tensor w. Pullback of the rank-one unit Hermitian form along ell is injective, so its finite-dimensional F-dual is surjective, including for F × F. Lift a vector coordinate and correct the remaining central coordinate to prove group surjectivity.

The interface includes `GGP.fourierJacobiQuotient_center`: The restriction to Z(X) is the dual of pullback along X → A.; `GGP.fourierJacobiQuotient_commutator`: The image of [u,u′] has central coordinate b0(y(u),y(u′)).; `GGP.fourierJacobiQuotient_equivariant`: The map commutes with G(W); transport by an isometry is natural.; `GGP.fourierJacobiQuotient_surjective`: For unimodular ell, both the vector map and central map are surjective, and hence so is N(X) → Heis(W,b0).

*Needs:* §1.2, `gap:heisenberg-svn` (MetaplecticAutomorphicForms), `gap:classical-group-points` (ReductiveGroupsPartII, unitary schemes and points), `gap:classical-flags` (ReductiveGroupsPartII), Tau Ceti `TauCeti.Symplectic.pointsMulEquiv`, Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`.

**Checks.**

- `fj_commutator_two`: For A = F, rank X = 1 and B(e,f) = 1 in W, the images of e and f have commutator central coordinate 2; omitting the polar factor gives 1.
- `fj_zero_W`: For W = 0 the vector quotient is zero and the Heisenberg group is its center, not a nonzero vector group.
- `fj_no_functional_zero_X`: For X = 0 no nonzero functional X → A exists; the codimension-zero construction uses the separate branch.
- `fj_split_idempotent_rejected`: For A = F × F, X = A and ell(x) = (1,0)x, ell is nonzero but not onto; its vector image is (1,0)W and its central map is zero since (1,0)conjugate((1,0)) = 0. This is excluded.
- `fj_split_surjection`: For X = A and ell = id, both components are nonzero, the vector map is id_W, and pullback on Hermitian lines is the identity, so the central map is onto F.

### 2.3 Oscillator restriction and auxiliary data

Construct `GGP.fourierJacobiRepresentation`. Construct nu = pullback(omega_psi) tensor lambda, with lambda(u) = psi(Tr(sum simple flag coordinates)), extended trivially across G(W). For A = F it is a genuine representation of Htilde = N ⋊ Mp(W); use exactly one genuine factor in the ambient product Sp(V) × Mp(W) or Mp(V) × Sp(W). For a quadratic algebra and a splitting character mu with mu|Fˣ = omega(A/F), obtain an ordinary representation of H. For X = 0 set nu equal to the oscillator representation itself. For X ≠ 0 the pullback uses the surjective quotient of §2.2 and its compatible flag, so its Heisenberg central character is nontrivial. Work with F is a field with 2 invertible; A is F with identity involution or a quadratic étale F-algebra with its canonical involution; epsilon ∈ {1,−1}; all form modules are finite free and nondegenerate; F is a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; epsilon = −1; psi nontrivial; mu with the displayed restriction when required. (ggp, §12, pp. 49–52; ggp line 1761, ggp line 1796, ggp line 1823).

The proof route is as follows. Pull back the imported Weil representation and multiply by the flag character; compare covers by fiber product over the diagonal group. The central involution acts by −1 on both nu and the genuine ambient restriction.

The interface includes `GGP.fourierJacobiRepresentation_central`: The nontrivial cover kernel acts by −1; its action on pi tensor nu is +1 for genuine pi.; `GGP.fourierJacobiRepresentation_zero_codim`: For V = W the flag character is 1 and nu = omega.; `GGP.fourierJacobiRepresentation_changeData`: Square rescaling of psi in the symplectic case, norm rescaling in the unitary case, and mu′/mu twists agree with the Weil splitting change; state the induced Hom equivalences.

*Needs:* §2.2, `gap:heisenberg-svn` (MetaplecticAutomorphicForms), `gap:oscillator-splittings` (MetaplecticAutomorphicForms), `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups).

**Checks.**

- `fj_genuineness_sign`: On pi tensor nu the cover involution acts as (−1)(−1) = 1; on a nongenuine pi tensor nu it acts as −1 and there is no invariant functional.
- `fj_equal_rank`: For X = 0 and W nonzero, nu is the restriction of the oscillator representation to the smaller classical group or its cover; its underlying Heisenberg realization has central character psi, but H itself has no Heisenberg subgroup. It is not replaced by 1.
- `fj_zero_small_space`: For W = 0 the oscillator factor is one-dimensional and nu reduces to the generic flag character; no mu is needed.

### 2.4 Restriction functionals and multiplicity

Define `GGP.Model`. Define Model(pi,nu) = `Hom_H`(pi|H tensor nu,C). The functional-space construction allows arbitrary smooth representations before restricting to admissible irreducibles in multiplicity theorems. In the nonarchimedean smooth category use algebraic tensor product and equivariant linear maps; at infinity use completed projective tensor product and continuous linear maps. Define multiplicity as the cardinal dimension over C; under multiplicity one this equals 0 or 1. Never define it by finrank before proving finite dimensionality. Work with F a local field of characteristic different from 2; nonarchimedean representations are smooth complex representations, without an admissibility assumption on this construction; archimedean representations have complete nuclear Fréchet spaces and jointly continuous actions, with the Casselman–Wallach subcategory used in the theorems; pi is a representation of the actual ambient group or its required cover, nu is §2.1 or §2.3. (ggp, §14, pp. 57–58; ggp line 2012, ggp line 2036, ggp line 2051).

The proof route is as follows. Specialize existing intertwiner modules to the trivial target. Use the completed tensor universal property only in the topological branch. Forgetting topology is an equivalence only under the finite-dimensional Hausdorff hypotheses of the pinned comparison.

The interface includes `GGP.Model.mk`: An invariant bilinear form gives a model; archimedean forms must be jointly continuous.; `GGP.Model.ext`: Equality of evaluations on pure tensors determines a model, by density and continuity at infinity.; `GGP.Model.congr`: Representation equivalences and conjugacy of (H,nu) induce linear equivalences of model spaces.; `GGP.Model.algebraicComparison`: If both pi|H and nu have finite-dimensional Hausdorff complex topological vector spaces with continuous scalar multiplication, the completed/algebraic tensor identification and the pinned intertwiner equivalence identify the continuous and algebraic relative models; on pure tensors the map preserves evaluation.; `GGP.Model.nonzero_iff_multiplicity_ne_zero`: Nonzero models are equivalent to nonzero cardinal dimension; after the one-dimensional bound, distinction means dimension one.; `GGP.Model.dualConvention`: For one-dimensional Bessel nu, identify Model(pi,nu) with `Hom_H`(pi,nu∨); comparison with `Hom_H`(pi,nu) uses the source’s conjugacy changing nu to nu∨. For nonarchimedean Fourier–Jacobi models supply the corresponding smooth oscillator-dual Hom identification. No archimedean Hom-to-oscillator equality is inferred from an algebraic dual.

*Needs:* §2.1, §2.3, Mathlib `Representation.IntertwiningMap`, Mathlib `ContIntertwiningMap`, Tau Ceti `ContRepresentation.intertwiningMapEquiv`, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups).

**Checks.**

- `model_trivial`: For H = 1 and pi = nu = C, Model ≅ C and multiplicity = 1.
- `model_zero`: If pi is the zero representation, Model = 0 and multiplicity = 0; an unqualified constant-one definition fails.
- `model_sign_character`: For the rank-zero symplectic pair use the cover Htilde = Mp(0) = C2 and its genuine oscillator nu = sign. Trivial pi has Model = 0, whereas pi = sign has multiplicity 1. This tests the cover sign on actual relative data.
- `model_infinite_dimension`: For H = 1, pi = direct sum of countably many copies of C and nu = C, the algebraic dual is infinite dimensional; finrank would misleadingly return 0.

### Examples

At codimension one the Bessel character is trivial; at codimension zero the Fourier–Jacobi factor is the oscillator representation, rather than a trivial character.

### Dependencies

§1.2, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups), `gap:heisenberg-svn` (MetaplecticAutomorphicForms), `gap:classical-group-points` (ReductiveGroupsPartII), `gap:classical-flags` (ReductiveGroupsPartII), Tau Ceti `TauCeti.Symplectic.pointsMulEquiv`, Tau Ceti `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `gap:oscillator-splittings` (MetaplecticAutomorphicForms), Mathlib `Representation.IntertwiningMap`, Mathlib `ContIntertwiningMap`, Tau Ceti `ContRepresentation.intertwiningMapEquiv`.

## Layer 3: Multiplicity one with precise ranges

### 3.1 Nonarchimedean basic uniqueness

Prove `GGP.basicMultiplicityOneNonarchimedean`. Over a nonarchimedean characteristic-zero field, the model dimension is at most one for codimension-one Hermitian Bessel pairs (including split quadratic algebra), codimension-one SO pairs, and equal-rank symplectic/metaplectic or skew-Hermitian Fourier–Jacobi pairs. In the last two cases pi has the genuineness and nontrivial oscillator central character of §2.3. Also prove the equivalent Sun Jacobi statement: for irreducible admissible smooth piJ of J(W) and piU of U(W), dim `Hom_U`(W)(piJ tensor piU,C) ≤ 1 in the skew-Hermitian setting. Work with F nonarchimedean of characteristic zero, with no restriction on its residue characteristic; The indicated basic pair; both constituent representations are irreducible admissible smooth. (ggp, Theorem 14.1(ii), p. 58; ggp line 2068; waldspurger Theorem 1, p. 1; waldspurger line 10; sun Theorems B–C, pp. 1–3; sun line 31, sun line 102).

The proof route is as follows. Prove the specialized distribution invariance by descent and Fourier support arguments, then apply the imported Gelfand–Kazhdan criterion. Use Waldspurger’s SO anti-involution rather than transferring O uniqueness to SO without proof. Sun’s Jacobi version and oscillator equivalence give the equal-rank cases.

*Needs:* §2.4, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:distribution-descent` (SmoothRepresentationsOfLocalGroups), `gap:heisenberg-svn` (MetaplecticAutomorphicForms), `gap:oscillator-splittings` (MetaplecticAutomorphicForms).

**Checks.**

- `basic_dyadic`: The theorem includes F = Q2; residue characteristic two does not contradict characteristic zero.
- `basic_SO1`: For the SO(1)/SO(0) pair all irreducible representations are trivial and the Hom dimension is one.

### 3.2 Archimedean basic uniqueness

Prove `GGP.basicMultiplicityOneArchimedean`. For G/G′ equal to GL(n+1,R)/GL(n,R), GL(n+1,C)/GL(n,C), U(p,q+1)/U(p,q), SO(p,q+1)/SO(p,q), or SO(n+1,C)/SO(n,C), invariant continuous bilinear forms on irreducible Casselman–Wallach V × V′ form a space of dimension at most one. For J = G′ ⋉ Heis with G′ equal to GL(n,R), GL(n,C), U(p,q), Sp(2n,R) or Sp(2n,C), the same bound holds for an irreducible Casselman–Wallach psi-representation of J and an irreducible Casselman–Wallach representation of G′, with fixed nontrivial unitary psi on the center. Work with n,p,q ≥ 0; archimedean groups in the displayed lists; Casselman–Wallach psi-representation means V0 completed-tensor `omega_psi` with V0 genuine Casselman–Wallach, as in the source. (sun-zhu, Theorems B and C, pp. 2–3; sun-zhu line 55, sun-zhu line 66, sun-zhu line 80, sun-zhu line 94).

The proof route is as follows. Prove the source’s anti-automorphism invariance of distributions using descent and Fourier rigidity, then its continuous Gelfand–Kazhdan criterion. Apply the nuclear tensor universal property to compare the bilinear and §2.4 formulations.

*Needs:* §2.4, `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups), `gap:distribution-descent` (SmoothRepresentationsOfLocalGroups), `gap:heisenberg-svn` (MetaplecticAutomorphicForms), `gap:oscillator-splittings` (MetaplecticAutomorphicForms).

**Checks.**

- `archimedean_zero_rank`: For p = q = n = 0 the Jacobi group is its center; a nontrivial psi-character against the trivial smaller group has a one-dimensional bilinear dual.
- `archimedean_topology`: Dropping continuity enlarges the functional space on an infinite-dimensional Fréchet space; that enlarged space is outside the theorem.

### 3.3 The Bessel open-orbit reduction

Prove `GGP.besselInductionReduction`. For a nonarchimedean field, W⊥ = X ⊕ E ⊕ X∨ with X ≠ 0 and E a nonisotropic line, put Wplus = V ⊥ (−E), Y = X ⊕ span(e+f). Let tau be supercuspidal of GL(Y), piV,piW irreducible smooth, and I = unnormalized `Ind_P`(Y)^G(Wplus)(tau external-tensor piW). If piV∨ is in none of the Bernstein components (GL(Y′) × G(V′), tau external-tensor mu) with dim Y′ = dim Y and mu irreducible, construct a linear isomorphism `Hom_G`(V)(I tensor piV,C) ≅ `Hom_H`(piV tensor piW,nu). This target covers the full O and unitary groups of the cited theorem; no SO variant is inferred. Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; F nonarchimedean; the displayed Bernstein exclusion and supercuspidality; In the symmetric trivial-involution case use O in this reduction, as the source does. (ggp, Theorem 15.1, pp. 60–61; ggp line 2116, ggp line 2152, ggp line 2158).

The proof route is as follows. Use the open/closed orbit restriction filtration, Bernstein exclusion to kill the closed term, Frobenius reciprocity on the open term and the GL Whittaker quotient. The support-avoidance existence needed to choose tau is part of the local-category contract.

*Needs:* §2.1, §2.4, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups).

**Checks.**

- `bessel_no_closed_orbit`: If there is no Y′ of the required isotropic dimension, the Bernstein exclusion is vacuous, rather than an assertion about a nonexistent Levi.
- `bessel_bad_support`: When piV∨ lies in the forbidden component, the closed orbit may contribute; the comparison is not asserted.

### 3.4 The Fourier–Jacobi open-orbit reduction

Prove `GGP.fourierJacobiInductionReduction`. For a nonarchimedean field, W = X ⊕ W0 ⊕ X∨ with X ≠ 0, tau supercuspidal of GL(X), pi0 genuine smooth of Mp(W0), and pi irreducible of Sp(W), form the unnormalized induction Ipsi(tau,pi0) from the inverse image of P(X), using the genuine Levi twist tau tensor `chi_psi`. If pi∨ belongs to none of the Bernstein components (GL(X) × Sp(W0), tau external-tensor mu), construct `Hom_Mp`(W)(Ipsi(tau,pi0) tensor pi,`omega_W`,psi) ≅ `Hom_H`(pi tensor pi0,`nu_W`,W0,psi). Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; F nonarchimedean; tau and the actual Bernstein exclusion as displayed. (ggp, Theorem 16.1, pp. 64–65; ggp line 2282, ggp line 2293).

The proof route is as follows. Use the mixed oscillator model, evaluation at zero and its nonzero-orbit kernel; the exclusion removes the latter. The source writes a Hom-to-oscillator form: construct its comparison to §2.4 using the actual contragredient conventions, not an archimedean algebraic dual.

*Needs:* §2.3, §2.4, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups), `gap:oscillator-splittings` (MetaplecticAutomorphicForms).

**Checks.**

- `fj_reduction_zero_X`: X = 0 is excluded; no supercuspidal tau of a positive-rank GL is manufactured for the basic case.
- `fj_reduction_cover`: The kernel involution acts genuinely on both Ipsi and omega; removing `chi_psi` makes the displayed Hom ill-typed.

### 3.5 The general multiplicity assertion

Define `GGP.MultiplicityOneAssertion`. Define MultiplicityOneAssertion(F,pair,data) as: for every irreducible representation pi in the category of §2.4 with the required genuineness, `dim_C` Model(pi,nu) ≤ 1. This is a named proposition for every permitted classical pair, distinct from a proof. Theorems §3.1–§3.2 inhabit precisely their ranges; larger-codimension conclusions require a proved reduction valid for that group and field. Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; A relevant pair and its auxiliary character data. (ggp, §14, pp. 58–59; ggp line 2064).

The proof route is as follows. Quantify over the actual representation category and models, with cardinal dimension; keep the source’s unresolved formulation logically separate from theorem instances.

The interface includes `GGP.MultiplicityOneAssertion.apply`: An instance gives the dimension bound for each eligible pi.; `GGP.multiplicity_eq_zero_or_one`: Under the assertion, a model dimension is zero or one.; `GGP.distinguished_iff_multiplicity_one`: Under the assertion, Model ≠ 0 iff its dimension is one.

*Needs:* §2.4.

**Checks.**

- `multiplicity_trivial_rank`: For the SO(1)/SO(0) basic pair the assertion holds and its only model has dimension one.
- `multiplicity_not_all_modules`: If irreducibility is omitted, the trivial representation C² of the trivial group has a two-dimensional invariant dual; that stronger assertion fails.
- `multiplicity_zero_model`: An undistinguished irreducible has multiplicity zero, so the assertion does not say all irreducibles occur.

### 3.6 Connected orthogonal Bessel induction

Prove `GGP.specialOrthogonalBesselInductionReduction`. Let W ⊂ V be a relevant quadratic pair over F with V = X ⊕ W ⊕ L ⊕ X∨, rank X > 0, L = Fe and B(e,e) ≠ 0. Put Vplus = V ⊥ (−L), choose f in −L with the opposite norm and Y = X ⊕ F(e+f). Use the parabolic P(Y) in SO(Vplus), Levi GL(Y) × SO(W), irreducible smooth admissible piV of SO(V) and piW of SO(W), and supercuspidal tau of GL(Y). Set I = unnormalized Ind_P(Y)^SO(Vplus)(tau external-tensor piW). If piV∨ avoids every Bernstein inertial class [GL(Yprime) × SO(Vprime), tau external-tensor rho] with Yprime ⊂ V isotropic of rank dim Y and rho arbitrary irreducible smooth on SO(Vprime), interpreting the displayed exclusion by its cuspidal support, prove Hom_SO(V)(I tensor piV,C) ≅ Hom_H(piV tensor piW,nu_B). Here H = N ⋊ SO(W), nu_B is the character of §2.1, and its Hom-to-character convention is compared with Model(piV tensor piW,nu_B∨) by §2.4. Choosing the conjugate dual Bessel data gives the Model convention used in §4.8. Work with F nonarchimedean of characteristic different from 2; quadratic spaces finite-dimensional nondegenerate; the displayed relevant inclusion and positive-rank X; All representations and the simultaneous SO Bernstein exclusions are as displayed; induction and compact induction are unnormalized; no metaplectic splitting occurs. (ggp, §19, pp. 75–77, ggp line 2661–2698; compare §15, Theorem 15.1, pp. 60–63, ggp line 2158 (the O theorem supplies the method, not this SO conclusion)).

The proof route is as follows. Compute SO(V)-orbits on the selected SO(Vplus)/P(Y) component directly, including the maximal-isotropic and SO(0) boundary cases. Identify the open stabilizer as (GL(X) × SO(W)) ⋉ N_V(X) by its determinant-one condition; its image on Y is the mirabolic stabilizing e+f modulo X. Kill all closed strata by their actual SO Jacquet supports, including Ext terms in the disjoint Bernstein blocks. Apply unnormalized reciprocity and the Whittaker derivative of tau. Track modular characters and the nu_B/nu_B∨ conjugacy explicitly. This is an owned extension proof, not restriction of an O theorem.

*Needs:* §3.3, §2.4, `gap:orthogonal-scheme-points` (ReductiveGroupsPartII), `gap:classical-flags` (ReductiveGroupsPartII), `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups), Tau Ceti `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`, Tau Ceti `TauCeti.SpecialOrthogonal.definingHopfIdeal`.

**Checks.**

- `SO_reduction_components`: An irreducible SO(W) representation need not extend uniquely to O(W); no arbitrary O-extension or O restriction is used to define either side.
- `SO_reduction_closed_support`: A piV∨ in one of the displayed closed-orbit Bernstein classes is excluded; for maximal isotropic Yprime inspect each SO-orbit rather than merging O-orbits.
- `SO_reduction_absent_Levi`: If the Witt index of V is less than dim Y there is no such Yprime; the closed-orbit exclusion is empty and the open-orbit calculation still applies.

### 3.7 Skew-unitary Fourier–Jacobi induction

Prove `GGP.skewUnitaryFourierJacobiInductionReduction`. Let E/F be a quadratic field extension, W = X ⊕ W0 ⊕ X∨ a skew-Hermitian space with rank-E X > 0, P(X) ⊂ U(W) with Levi GL_E(X) × U(W0), psi a nontrivial unitary character of F, and mu : Eˣ → Cˣ with mu|Fˣ = omega(E/F). Use the compatible ordinary oscillator splittings omega_W,psi,mu and omega_W0,psi,mu. For supercuspidal tau of GL_E(X), smooth pi0 of U(W0) and irreducible smooth admissible pi of U(W), put I_mu = unnormalized Ind_P(X)^U(W)((tau tensor (mu composed with det_E)) external-tensor pi0). If pi∨ avoids all Bernstein inertial classes [GL_E(X) × U(W0), tau external-tensor rho], for rho with arbitrary irreducible cuspidal support on U(W0), prove Hom_U(W)(I_mu tensor pi,omega_W,psi,mu) ≅ Hom_H(pi tensor pi0,nu_W,W0,psi,mu). Construct the comparison with §2.4 through the smooth oscillator dual; no algebraic archimedean dual is used. Work with F nonarchimedean of characteristic different from 2; E/F quadratic field, all form spaces nondegenerate and all representations as displayed; The displayed Bernstein exclusions, unnormalized induction, and common psi,mu and dual oscillator conventions; H and nu use the unimodular functional of §2.2. (ggp, §19, p. 77, ggp line 2699 (skew-unitary extension target); §16, Theorem 16.1 and mixed-model proof, pp. 64–67, ggp line 2293, ggp line 2311; unitary splitting §12, p. 51, ggp line 1823).

The proof route is as follows. Use the supplied mixed model of omega_W,psi,mu∨, whose evaluation at zero has Levi action (mu⁻¹ composed with det_E) abs(det_E)_E^(1/2) tensor omega_W0,psi,mu∨. The nonzero-vector orbit is the mirabolic orbit over E. Tensor with I_mu: the two mu characters cancel. Bernstein separation kills the zero-evaluation quotient and its Ext terms; unnormalized reciprocity and the generic mirabolic quotient identify the nonzero orbit with the actual H model, including its flag character. Compute the modular factors to retain the displayed abs(det_E)^(1/2) evaluation law. This establishes the omitted unitary argument, rather than substituting U for Mp in a statement.

*Needs:* §3.4, §2.3, §2.4, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups), `gap:oscillator-splittings` (MetaplecticAutomorphicForms), `gap:classical-group-points` (ReductiveGroupsPartII, unitary schemes and points), `gap:classical-flags` (ReductiveGroupsPartII).

**Checks.**

- `unitary_reduction_mu_cancel`: On a Levi element with det_E = a, the inducing multiplier mu(a) cancels the dual oscillator multiplier mu(a)⁻¹; the remaining evaluation modulus is abs(a)_E^(1/2), not a hidden normalized-induction twist.
- `unitary_reduction_wrong_splitting`: Replacing mu on only W0 by muprime changes the open-orbit Hom by the splitting ratio; the comparison with unchanged nu is not asserted.
- `unitary_reduction_zero_X`: For X = 0 use the basic equal-rank model; no positive-rank supercuspidal or mirabolic reduction exists.

### 3.8 Higher-codimension uniqueness supplied by the reductions

Prove `GGP.higherCodimensionMultiplicityOne`. For a nonarchimedean characteristic-zero field, prove dim Model(pi,nu) ≤ 1 for every irreducible smooth admissible representation of a special orthogonal or Hermitian relevant pair of arbitrary odd codimension, or a symplectic/metaplectic or skew-Hermitian relevant pair of arbitrary even codimension; include split quadratic algebras in both unitary cases and require exactly one genuine ambient factor in the symplectic/metaplectic case. The basic cases use §3.1; for nonbasic pairs the auxiliary supercuspidal is chosen so the corresponding induced representation is irreducible and the Bernstein exclusion holds. This choice is part of the proof, not a restriction on pi. Work with F nonarchimedean of characteristic zero, with no restriction on its residue characteristic; The indicated special orthogonal, Hermitian, symplectic/metaplectic or skew-Hermitian pair, actual model data and irreducible smooth admissible pi. (ggp, §§15–16, pp. 60–67, ggp line 2116, ggp line 2158, ggp line 2293; §19, pp. 76–77, ggp line 2661–2700, with the owned SO and skew-unitary reductions §§3.6–3.7; sun Theorems B–C, pp. 1–3, sun line 31, sun line 102; waldspurger Theorem 1, p. 1, waldspurger line 10–18).

The proof route is as follows. Choose a supercuspidal outside the finite supports of pi and its Jacquet constituents, with irreducible auxiliary induction. Apply §3.3 for Hermitian Bessel pairs, §3.4 for symplectic/metaplectic pairs, §3.6 for SO Bessel pairs, and §3.7 for nonsplit skew-unitary pairs; split unitary pairs use the GL versions of §§3.3–3.4. Each Hom reduces to the corresponding basic Hom of §3.1, including Waldspurger’s SO bound and Sun’s unitary oscillator bound. Transport the character and oscillator dual conventions through §2.4.

*Needs:* §3.1, §3.3, §3.4, §3.6, §3.7, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups).

**Checks.**

- `higher_model_basic_boundary`: At codimension one in the Hermitian case and zero in the symplectic case, use §3.1 directly; X is zero and the nonbasic reduction is not applied.
- `higher_no_aux_prime`: The auxiliary representation is chosen over the same local field, including Q2; the theorem imposes no good-prime condition on pi.
- `higher_SO3_SO0`: For V = hyperbolic plane ⊥ L with L nonisotropic and W = 0, the SO(3)/SO(0) Bessel pair has rank X = 1; §3.6 uses Vplus = V ⊥ (−L), split of dimension four, and a maximal-isotropic-plane parabolic with Levi GL(2) × SO(0). The resulting SO(4)/SO(3) basic Hom has dimension at most one by Waldspurger, including both choices of maximal-isotropic component.
- `higher_skew_unitary_plane`: For E/F quadratic field, a skew-Hermitian line W0 and W = W0 ⊥ hyperbolic plane, §3.7 reduces the codimension-two U(W)/U(W0) model using GL_E(1) × U(W0) induction to the equal-rank U(W) oscillator Hom bounded by Sun’s Theorems B–C; use the same psi and mu on both spaces, since changing only one splitting does not give this comparison.

### Examples

Ranks zero and one test the category conventions; no positive-residue-characteristic or larger archimedean assertion is inferred from the nonarchimedean reductions.

### Dependencies

§2.4, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:distribution-descent` (SmoothRepresentationsOfLocalGroups), `gap:heisenberg-svn` (MetaplecticAutomorphicForms), `gap:oscillator-splittings` (MetaplecticAutomorphicForms), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups), §2.1, `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups), §2.3, `gap:orthogonal-scheme-points` (ReductiveGroupsPartII), `gap:classical-flags` (ReductiveGroupsPartII), Tau Ceti `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`, Tau Ceti `TauCeti.SpecialOrthogonal.definingHopfIdeal`, `gap:classical-group-points` (ReductiveGroupsPartII).

## Layer 4: Root-number characters and local selection propositions

### 4.1 Component signs and involutive representatives

Construct `GGP.parameterSignDomain`. For a semisimple selfdual or conjugate-dual WD parameter (M,B), use its pairing-preserving centralizer `C_M` and `A_M` = pi0(`C_M`). Identify the independent signs with irreducible same-sign summands, one sign for each isomorphism class regardless of multiplicity; write `A_M`^+ for the image of det = 1. For each component choose an involutive representative and form its −1 eigenspace M^a. Require invariants used below to descend; no eigenspace assertion is made for an arbitrary unipotent element of `C_M`. Work with F is a local field of characteristic different from 2; M is a finite-dimensional complex WD representation; M has a nondegenerate invariant duality pairing and is semisimple in the WD sense. (ggp, §4, pp. 13–15; ggp line 477, ggp line 495, ggp line 521, ggp line 527).

The proof route is as follows. Decompose the multiplicity spaces into O, Sp and paired GL factors. Use connectedness of Sp and GL and determinant of O; reflections give representatives. This is the WD specialization of the imported component functor.

The interface includes `GGP.parameterSignDomain_generator`: For the reflection generator ai of the multiplicity O-factor of Mi, M^ai ≅ Mi.; `GGP.parameterSignDomain_determinant`: The determinant on a sign vector is the product of its signs raised to the ranks of the corresponding irreducible summands.; `GGP.parameterSignDomain_transport`: Isometric WD equivalences transport component groups and generator labels naturally.

*Needs:* `gap:parameter-carriers` (EndoscopicTransferAndUnitaryTraceComparison), ReductiveGroups §Layer 3.

**Checks.**

- `component_empty`: For M = 0 the centralizer and its component group are trivial, not C2.
- `component_multiplicity_two`: For M = T ⊕ T with T an orthogonal irreducible line, the O(2) multiplicity factor gives one C2 component, not two.
- `component_hyperbolic_pair`: For M = P ⊕ P∨ with P not selfdual the centralizer is connected GL, so the component group is trivial.
- `component_det_kernel`: For two distinct orthogonal odd-dimensional summands, A = C2² and A^+ consists of (1,1),(−1,−1); its order is two.

### 4.2 Conjugate-dual characters

Construct `GGP.conjugateRootCharacter`. For conjugate-dual M,N over a quadratic field extension with signs bM,bN, and nontrivial psi0 on E/F (psi0^c = psi0⁻¹), construct `chi_N` : `A_M` → {±1} by `chi_N`(a) = epsilon(1/2,M^a tensor N,psi0). Prove it descends and is multiplicative. If bM bN = +1 it is trivial. If bM bN = −1 and t represents the nontrivial element of Fˣ/N(Eˣ), replacing psi0 by psi0(t·) multiplies `chi_N`(a) by (−1)^(dim(M^a)·dim N). Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; E/F quadratic field; parameters and character as displayed. (ggp, Theorem 6.1, p. 20; ggp line 726, ggp line 729, ggp line 732).

The proof route is as follows. Compute on irreducible generators. Multiplicativity follows from direct sums; pairs in the identity component contribute trivial conjugate-orthogonal root numbers. Apply the determinant scaling formula to compare psi0 and psi0(t·).

The interface includes `GGP.conjugateRootCharacter_generator`: `chi_N`(ai) is epsilon(1/2,Mi tensor N,psi0).; `GGP.conjugateRootCharacter_sameSign`: For bM bN = +1, `chi_N` = 1.; `GGP.conjugateRootCharacter_changePsi`: For opposite signs the quotient character is a ↦ (−1)^(dim(M^a)·dim N).

*Needs:* §4.1, `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors).

**Checks.**

- `conjugate_character_zero`: For N = 0 every value is epsilon(0) = 1.
- `conjugate_character_two_generators`: If epsilon values on two generators are −1 and +1, the value on their product is −1; constant −1 would fail at the identity.
- `conjugate_change_parity`: When dim(M^a) = dim N = 1 and signs are opposite, a nonnorm scaling reverses the sign; when dim N = 2 it preserves it.

### 4.3 Determinant-corrected selfdual characters

Construct `GGP.selfdualRootCharacter`. For even-dimensional selfdual M,N, restrict a to the determinant-one centralizer and define `chi_N`(a) = epsilon(1/2,M^a tensor N) · det(M^a)(−1)^(dim N/2) · det(N)(−1)^(dim(M^a)/2). Construct a character on `A_M`^+. The exponents are integers since dim(M^a) is even there. Prove independence of the additive character and of the involutive representative. For equal duality signs prove `chi_N`(a) = Hilbert(det(M^a),det N). Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; M,N even-dimensional selfdual WD representations; a belongs to the determinant-one component domain. (ggp, Theorem 6.2, p. 21; ggp line 759, ggp line 774, ggp line 780).

The proof route is as follows. Use even dimensions to make det(M^a tensor N) trivial, then compute the root number and determinant correction on the connected multiplicity factors and generators. The pairing product below cancels the symmetric Hilbert-symbol ambiguity.

The interface includes `GGP.selfdualRootCharacter_apply`: Evaluation is precisely the displayed product of three factors on a determinant-one involutive representative.; `GGP.selfdualRootCharacter_independentPsi`: Any two nontrivial additive characters give the same value.; `GGP.selfdualRootCharacter_sameSign`: For equal signs the value is the specified Hilbert symbol; for two symplectic parameters the product pairing character is trivial.

*Needs:* §4.1, `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), Tau Ceti `TauCeti.hilbertSymbolOnSquareClasses`.

**Checks.**

- `selfdual_zero`: For M = 0 or N = 0 the resulting character is trivial, and the empty determinants equal 1.
- `selfdual_two_symplectic`: With both parameters symplectic every determinant is 1 and the paired character is trivial; an extra arbitrary sign is detected.
- `selfdual_odd_domain_rejected`: Over R choose P = sgn·abs^(it), t ≠ 0, M = P ⊕ P∨ and N = 1. The centralizer GL1 is connected but raw epsilon(M) = −1 and epsilon(0) = 1; dropping the even-N requirement does not give a component character.
- `selfdual_real_correction`: Over R take M = 1 ⊕ sgn, a = −id_M and N = 1 ⊕ 1. The tensor root number is −1, det(M)(−1) = −1 and det(N)(−1) = 1, so chi_N(a) = +1. Omitting the first determinant correction gives −1.

### 4.4 The case-specific distinguished character

Define `GGP.distinguishedCharacter`. Define `chi_phi` on the actual enhancement group by pairing the characters of §§4.2–4.3. For SO use `chi_N` × `chi_M` on `A_M` × `A_N`^+ with M symplectic and N even orthogonal. For the symplectic/metaplectic pair with N odd orthogonal set N1 = N ⊕ 1, form `chi_N1` × `chi_M` on `A_M` × `A_N1`^+, and restrict along the natural component embedding. For Hermitian unitary pairs use the conjugate-dual product with psi0 and the Whittaker datum scaled by −2 times the odd-space discriminant. For skew-Hermitian pairs pair M with N tensor mu⁻¹, using psi(Tr(e·)) when the common dimension is odd and any nontrivial character of E/F when it is even. In the split-algebra case the enhancement group is trivial. Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; A relevant pair, its actual generic parameter, fixed Whittaker and model data; signs and dimensions are those of its L-group. (ggp, §17, pp. 68–70; ggp line 2413, ggp line 2422, ggp line 2440, ggp line 2461, ggp line 2470).

The proof route is as follows. Use the classification of L-group standard parameters to select the correct domain; construct the restriction for N ⊕ 1, not an identification with `A_N1`^+. Compare the unitary signs with gan-ichino §3.2 before transporting its theorems.

The interface includes `GGP.distinguishedCharacter_apply_generators`: Evaluate on each independent component generator by the corresponding root number with the displayed determinant corrections or mu⁻¹ twist.; `GGP.distinguishedCharacter_metaplectic_restrict`: Evaluation agrees with the pullback from N ⊕ 1 along the component embedding.; `GGP.distinguishedCharacter_unitaryConvention`: Under the Whittaker datum of gan-ichino §3.2, the Bessel character uses psiE(−2·), and the odd/even Fourier–Jacobi recipes agree after the specified discriminant and splitting transport.

*Needs:* §4.2, §4.3, §1.4, `gap:parameter-carriers` (EndoscopicTransferAndUnitaryTraceComparison), `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison).

**Checks.**

- `distinguished_trivial_component`: For a split GL pair `A_phi` = 1, `chi_phi` is the unique trivial character.
- `distinguished_extra_line`: For N = the trivial orthogonal line, N1 has dimension two and `A_N1`^+ is trivial; one cannot apply the even-dimensional formula directly to N of dimension one.
- `distinguished_inverse_twist`: On a character eigenline with N(x) = z and mu(x) = u, the twisted tensor factor acts by z/u; replacing mu⁻¹ by mu gives zu and fails when u² ≠ 1.

### 4.5 Compatibility with normalization changes

Prove `GGP.selectionChangeData`. For fixed relevant pair and generic parameter, prove the following commuting comparisons of model functors and enhancement labels. Hermitian psi0 ↦ psi0(t·) for a nonnorm t multiplies chi(a,b) by (−1)^dim(M^a), exactly as the Whittaker enhancement changes. Simultaneous form scaling transports H and nu and preserves the selection assertion. Symplectic psi ↦ psi(c·), with simultaneous change of metaplectic and Whittaker parametrization, transports nu and pi by the corresponding similitude. In skew-Hermitian odd rank nonnorm scaling of psi multiplies the character by (−1)^(dim(M^a)+dim(N^b)) and transports the scaled form pair; in even rank the root character is independent of psi while the enhancement and model transport by similitude. If mu′/mu gives a splitting ratio kappa on H, the tensor identity Model(pi,kappa tensor nu) ≅ `Hom_H`((pi|H tensor kappa) tensor nu,C) and the parameter identity N tensor (mu′)⁻¹ = (N tensor (mu′/mu)⁻¹) tensor mu⁻¹ give the compatible change of label. All comparisons specify their maps and inverses. Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; Nonzero scaling elements; admissible auxiliary characters and actual supplier normalization laws. (ggp, §18, pp. 71–75; ggp line 2488, ggp line 2508, ggp line 2522, ggp line 2584, ggp line 2621).

The proof route is as follows. Combine §4.2’s determinant scaling law with the supplied change-of-Whittaker and Weil splitting maps. Evaluate the maps on pure tensors; check the inverse uses kappa⁻¹. Keep the convention-dependent Hom-to-oscillator comparison explicit.

*Needs:* §2.4, §4.4, `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison), `gap:oscillator-splittings` (MetaplecticAutomorphicForms), `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors).

**Checks.**

- `change_psi_odd`: For dim(M^a) = 1 in the Hermitian case a nonnorm change reverses the label; a declaration of literal independence would fail.
- `change_mu_two_terms`: For a scalar kappa value u and pi value z, tensor reassociation has action zu on either side, whereas an inverse twist gives z/u; this pins the functional convention.
- `change_identity`: Scaling by 1 and mu′ = mu give identity maps on models and labels.

### 4.6 Local selection conjectures as propositions

Define `GGP.LocalSelectionAssertion`. Define LocalSelectionAssertion as the conjunction: for every generic parameter phi, there is exactly one marked representation in Πphi over the relevant pure inner forms with Model ≠ 0, and its Whittaker-normalized enhancement is `chi_phi` of §4.4. Quantification is over the supplier’s actual Πphi and enhancement map. Generic means the parameter has a generic member of Πphi, not that the distinguished member is itself generic. Provide separate existence/uniqueness and character-selection propositions, corresponding to Conjectures 17.1 and 17.3. Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; A relevant classical pair and fixed admissible auxiliary normalization data. (ggp, Conjectures 17.1 and 17.3, pp. 68–70; ggp line 2386, ggp line 2479).

The proof route is as follows. Build propositions from constructed models and `chi_phi`. Separate projections and reformulate as a model nonvanishing iff enhancement equality together with relevance and existence in the actual Πphi.

The interface includes `GGP.LocalSelectionAssertion.unique`: The assertion gives a unique relevant distinguished member of Πphi.; `GGP.LocalSelectionAssertion.enhancement`: Its enhancement equals the explicitly computed `chi_phi`.; `GGP.LocalSelectionAssertion.congrData`: The equivalences of §4.5 transport the assertion without changing its mathematical content.

*Needs:* §1.3, §2.4, §4.4, `gap:parameter-carriers` (EndoscopicTransferAndUnitaryTraceComparison), `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison), §4.5.

**Checks.**

- `selection_singleton`: For a split basic generic GL pair the sole member of Πphi is distinguished and chi = 1, as proved in §4.7.
- `selection_not_fixed_form`: A family Πphi with two members on different inner forms must be searched across relevant forms; uniqueness does not assert distinction on both.
- `selection_nongeneric_excluded`: A nongeneric parameter lies outside the quantifier; no generic criterion is applied to all irreducibles.

### 4.7 Split local selection

Prove `GGP.splitLocalSelection`. For A = F × F, prove the existence/uniqueness part of §4.6 for generic packets when codimension is zero or one over any local field in the source’s category, and for every allowed codimension when F is nonarchimedean. The enhancement character is uniquely trivial. Work with F a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; A = F × F; generic parameter; codimension 0 or 1, or F nonarchimedean. (ggp, Theorem 17.2, p. 68; ggp line 2394, ggp line 2398).

The proof route is as follows. Use the nonzero local Rankin–Selberg functional in the basic cases and singleton GL packets. For larger nonarchimedean codimension use the reductions with a support-avoiding supercuspidal and the corresponding generic parameter induction.

*Needs:* §1.4, §3.3, §3.4, §4.6, `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups).

**Checks.**

- `split_packet_one`: For a generic GL2 × GL1 basic pair Πphi has one member and chi = 1; searching an extra inner form is wrong.

### 4.8 Reduction of packet selection to the basic cases

Prove `GGP.localSelectionReduction`. For nonarchimedean local fields and each of the four classical types, prove that validity of Conjectures 17.1 and 17.3 for all basic pairs of that type implies validity for all relevant pairs of that type. This is an implication about families of actual models and actual packets, using the source’s enhanced Langlands induction laws; it is not a theorem proving the basic assertions. Work with F is a local field of characteristic different from 2; representations are complex smooth admissible nonarchimedeanly or Casselman–Wallach archimedeanly; all additive characters used are continuous unitary and nontrivial; F nonarchimedean; the enhanced packet and standard-module laws of the source; basic assertions for every required smaller pair. (ggp, Theorem 19.1, pp. 75–76; ggp line 2655).

The proof route is as follows. Choose an auxiliary supercuspidal outside all forbidden supports, apply §3.6 for SO, §3.3 for Hermitian U, §3.4 for Sp/Mp and §3.7 for skew-Hermitian U, and compare added parameter summands using root-number multiplicativity and the enhanced induction laws. Convert unnormalized induction through its exact modulus twist before invoking normalized Langlands labeling. The split quadratic-algebra branch is §4.7; the two new connected comparisons do not restrict that branch.

*Needs:* §3.3, §3.4, §4.6, `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison), `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups), §3.6, §3.7, §4.7.

**Checks.**

- `selection_reduction_arch_excluded`: This implication is not applied at R or C, where Bernstein components of this form are unavailable.

### Examples

The empty component group, a connected GL centralizer, a two-generator component group, and the extra trivial parameter line distinguish the character recipe from an existence assertion.

### Dependencies

`gap:parameter-carriers` (EndoscopicTransferAndUnitaryTraceComparison), ReductiveGroups §Layer 3, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups), `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), Tau Ceti `TauCeti.hilbertSymbolOnSquareClasses`, §1.4, `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison), §2.4, `gap:oscillator-splittings` (MetaplecticAutomorphicForms), §1.3, §3.3, §3.4, `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups), §3.6, §3.7.

## Layer 5: Proved generic unitary local selection

### 5.1 Tempered unitary Bessel selection

Prove `GGP.unitaryTemperedBesselSelection`. For E/F quadratic with F nonarchimedean of characteristic zero and a Hermitian relevant pair of any odd codimension, prove that every tempered parameter has exactly one distinguished relevant packet member, and its enhancement is the Bessel chi of §4.4. Work with F is nonarchimedean of characteristic zero, with no restriction on its residue characteristic; E/F quadratic field; Hermitian relevant pair; tempered parameter; Fix nu0 ∈ Fˣ: write d for the even dimension and dprime for the odd dimension, and require the complement of the smaller space to be a sum of hyperbolic planes and a line of norm +nu0 if d > dprime, or −nu0 if dprime > d, as in bp-refined 4.1(1); mu(G), the transfer normalization and the packet labels use this same nu0. Varying nu0 covers every residual-line norm class in Fˣ/N(Eˣ). The enhanced local classification satisfies bp-refined §7.2 (CLL, Stab, TE, TET), and its labels agree with §§7.7 and 8.3 and §4.4 under the specified Whittaker/additive-character normalization. (bp-refined, Theorem 8.5.1, printed p. 71 (extraction p. 72), bp-refined line 2891–2901; setup printed p. 70, bp-refined line 2877; §§7.2, 7.7, 8.3; uniqueness precursor bp-unitary-tempered Theorem 18.4.1, bp-unitary-tempered line 5429; gan-ichino §9.3, gan-ichino line 2494 for the generic reduction; fixed norm and quasi-split sign, §3.1, printed p. 17, bp-refined line 713–719; complement condition §4.1(1), printed p. 20, bp-refined line 806–807; residual form §1.3, printed pp. 9–10, bp-refined line 381–399).

The proof route is as follows. Use the unitary local relative trace formula and its character expansion to identify the distinguished relative multiplicity with the epsilon-character selection. Its foundations are the trace and spectral contracts, not an assumed GGP theorem. The primary epsilon-labelled theorem is bp-refined Theorem 8.5.1, conditional there on §7.2 and its fixed labeling; import those classification and normalization laws as precise supplier inputs. The unlabelled uniqueness precursor alone does not determine chi.

*Needs:* §4.6, `gap:trace-distributions` (EndoscopicTransferAndUnitaryTraceComparison), `gap:local-tempered-estimates` (AutomorphicSpectralTheory), `gap:schwartz-trace` (AutomorphicSpectralTheory), `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison).

**Checks.**

- `unitary_tempered_ramified_two`: A ramified quadratic extension of Q2 is in scope; no odd residual characteristic is used.
- `unitary_norm_even_larger`: For larger even-dimensional V = W ⊥ ⟨a⟩ with a ∈ Fˣ and W odd-dimensional, take nu0 = a; then the residual norm is +nu0. For larger odd-dimensional Vprime = Wprime ⊥ ⟨a⟩ with Wprime even-dimensional, take nu0 = −a; then the residual norm is −nu0. Using +nu0 in both orders changes the prescribed datum whenever −1 is not a norm. For E = Q3(√3), −1 is not a norm: the residue of the norm of a unit is a square in F3, whereas −1 has residue 2.
- `unitary_norm_class_variation`: Scaling a residual generator by t ∈ Eˣ multiplies its norm by N(E/F)(t). A norm multiple preserves the residual-line class; replacing nu0 by a nonnorm multiple changes that class and requires the corresponding mu(G) and packet-label normalization, rather than reusing fixed labels. In particular t = 2 multiplies the norm by 4 and preserves the class.

### 5.2 Unitary standard-module multiplicity reduction

Prove `GGP.unitaryStandardModuleMultiplicity`. Let pi = normalized Ind((external `tensor_i` `tau_i` abs^si) external tensor pi0) on U(Vn), with `tau_i` irreducible tempered GL representations, s1 ≥ … ≥ sr ≥ 0, and pi0 irreducible tempered. Define pi′ on U(V(n+2k+1)) by analogous data tau′j,s′j,pi′0. For the Bessel multiplicities on the relevant inclusions, prove m(pi,pi′) = m(pi0,pi′0). These induced representations need not be assumed irreducible; their multiplicity is the dimension of the actual relative Hom. Work with F nonarchimedean of characteristic zero, with no restriction on its residue characteristic; E/F quadratic field; k ≥ 0; all inducing data as displayed, with normalized induction; Use the compatible reduced relevant pair attached to the tempered remainders by Witt cancellation, exchanging their order if the reduced ranks cross. (gan-ichino, Proposition 9.4, pp. 50–52; gan-ichino line 2502, gan-ichino line 2509).

The proof route is as follows. Apply the two inequalities from the source’s restriction filtrations and supercuspidal support separation, then induction on the ranks of positive-exponent blocks. Keep normalized induction here distinct from the unnormalized induction of §3.3.

*Needs:* §3.3, §2.4, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups).

**Checks.**

- `standard_empty_blocks`: For r = r′ = 0 the equality is the identity m(pi0,pi′0) = m(pi0,pi′0).
- `standard_order_required`: Arbitrary unordered real exponents are not the displayed standard-module data; apply Weyl reordering only through its supplied comparison theorem.

### 5.3 All generic unitary Bessel parameters

Prove `GGP.unitaryGenericBesselSelection`. Under §5.1’s field and pair hypotheses, replace tempered by generic and prove LocalSelectionAssertion for Hermitian pairs U(Vn) × U(V(n+2r+1)), every n,r ≥ 0 and relevant split complement. Work with F nonarchimedean of characteristic zero, with no restriction on its residue characteristic; E/F quadratic field; Hermitian relevant pair; generic parameter; n,r ≥ 0. (gan-ichino, Proposition 9.3, p. 50; gan-ichino line 2491, gan-ichino line 2494).

The proof route is as follows. Generic standard modules are irreducible by the supplied generic standard-module criterion. Reduce their relative Hom by §5.2 to the tempered remainders; the enhancement character comparison follows from §4.2’s direct-sum law and the supplied Langlands labeling.

*Needs:* §5.1, §5.2, §4.8, `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison), `gap:generic-standard-modules` (MetaplecticAutomorphicForms).

**Checks.**

- `generic_not_tempered`: A generic non-tempered standard module is covered through §5.2; its individual constituents are not required to be Whittaker generic on each inner form.

### 5.4 The theta bridge

Prove `GGP.unitaryThetaBesselJacobiBridge`. For nonarchimedean characteristic-zero unitary groups and fixed compatible psi and splitting data, prove the relative implication of families: tempered Bessel selection (B), the supplied equal-rank theta parameter/nonvanishing laws and almost-equal-rank enhanced theta formula (P2), together with the supplied tempered big-theta irreducibility and seesaw identity, imply equal-rank Fourier–Jacobi selection (FJ) with the character of §4.4. General enhanced theta formulas, including P1, remain owned by MetaplecticAutomorphicForms; P1 is neither an output nor an enhancement prerequisite of this bridge. Work with F is nonarchimedean of characteristic zero, with no restriction on its residue characteristic; E/F quadratic field; compatible unitary dual pairs; the supplied P2 formula and tempered Bessel selection. (gan-ichino, Proposition 1.2, p. 3; gan-ichino line 90, gan-ichino line 103, gan-ichino line 116).

The proof route is as follows. Apply the supplied seesaw Hom equivalence. Use the supplied nonzero-lift laws and Howe duality to match the relevant towers, and P2 with §4.4 to identify the FJ enhancement. Take only the FJ conclusion of gan-ichino Proposition 1.2. No equal-rank theta enhancement theorem is proved here and the upstream theta contracts have no dependency on this relative selection theorem.

*Needs:* §5.1, §4.4, `gap:theta-seesaw` (MetaplecticAutomorphicForms), `gap:theta-parameter-laws` (MetaplecticAutomorphicForms), `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison).

**Checks.**

- `theta_zero_lift`: A zero theta lift contributes no nonzero Hom; the argument uses the unique nonzero lift in its Witt tower, not all towers at once.

### 5.5 All generic unitary Fourier–Jacobi parameters

Prove `GGP.unitaryGenericFourierJacobiSelection`. For E/F quadratic with F nonarchimedean of characteristic zero, a skew-Hermitian relevant pair Wn ⊂ W(n+2r), nontrivial psi and mu|Fˣ = omega(E/F), prove LocalSelectionAssertion for every generic parameter, all n,r ≥ 0, with the character of §4.4. Work with F is nonarchimedean of characteristic zero, with no restriction on its residue characteristic; E/F quadratic field; n,r ≥ 0; actual skew-Hermitian pair and admissible psi,mu; parameter generic. (gan-ichino, Theorem 1.3 and Corollary 1.4, pp. 3–4; gan-ichino line 119, gan-ichino line 141; §9; gan-ichino line 2476).

The proof route is as follows. Use the supplier’s P2 and equal-rank parameter laws in §5.4 for the tempered basic case. For generic equal-rank parameters apply the standard-module irreducibility and theta comparison of gan-ichino Propositions 9.1–9.2; §4.8 handles higher even codimension.

*Needs:* §5.3, §5.4, §4.8, `gap:theta-seesaw` (MetaplecticAutomorphicForms), `gap:theta-parameter-laws` (MetaplecticAutomorphicForms), `gap:generic-standard-modules` (MetaplecticAutomorphicForms), `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups).

**Checks.**

- `unitary_fj_mu_condition`: A character with the wrong restriction to Fˣ gives the wrong splitting and is excluded.
- `unitary_fj_residue_two`: A ramified quadratic extension of Q2 with a valid mu satisfies the field hypotheses.

### 5.6 Tempered unitary uniqueness across inner forms

Prove `GGP.unitaryTemperedPacketUniqueness`. Let F be a characteristic-zero local field different from C and E/F a quadratic field extension. For a Hermitian Bessel GGP triple of odd codimension with both G and its smaller reductive group quasi-split, and every tempered parameter phi, prove that the disjoint union of the packets over the relevant pure inner triples indexed by H1(F,H) contains exactly one representation of multiplicity one. Transport this statement to every relevant complement isometry class admitting such a quasi-split reference triple. At a split quadratic-algebra place, use §4.7. This theorem gives existence and uniqueness, not an explicit epsilon-character theorem at real places. The triple uses the scalar Bessel character of §2.1; this is not a Fourier–Jacobi uniqueness theorem. Work with F = R or a finite extension of Qp; E/F quadratic field; a Hermitian Bessel reference triple of odd codimension with G and the smaller reductive group quasi-split, and its relevant pure inner triples; The actual tempered packets satisfy stability, transfer with Kottwitz signs, and uniqueness of the prescribed Whittaker model (the source’s STAB, TRANS, WHITT). (bp-arch, Theorem 12.4.1, pp. 289–290; bp-arch line 11132, bp-arch line 11185, bp-arch line 11200; §12.2, bp-arch line 11119).

The proof route is as follows. Use the local relative trace expansion to express the sum of multiplicities through stable sums of characters over Πphi. Transfer with Kottwitz signs cancels the nonmatching inner terms, and the Whittaker coefficient on the reference form is one. Nonnegative integral multiplicities with total one give a unique member; no explicit enhancement formula is inferred.

*Needs:* §3.1, §3.2, §1.3, §4.7, `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tempered-stability` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tempered-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tempered-whittaker` (EndoscopicTransferAndUnitaryTraceComparison), `gap:trace-distributions` (EndoscopicTransferAndUnitaryTraceComparison), `gap:local-tempered-estimates` (AutomorphicSpectralTheory), `gap:schwartz-trace` (AutomorphicSpectralTheory).

**Checks.**

- `real_inner_forms_many`: Over R more than two pure inner forms may occur; reducing the search to two signs would miss relevant signatures.
- `real_split_place`: For F = C a global quadratic extension splits locally and §4.7 applies; Theorem 12.4.1 is not extended to a nonexistent quadratic field extension of C.

### Examples

Dyadic fields and ramified quadratic extensions are included. Temperedness is used in the initial argument and then replaced by genericity through a separate theorem.

### Dependencies

§4.6, `gap:trace-distributions` (EndoscopicTransferAndUnitaryTraceComparison), `gap:local-tempered-estimates` (AutomorphicSpectralTheory), `gap:schwartz-trace` (AutomorphicSpectralTheory), `gap:enhanced-classification` (EndoscopicTransferAndUnitaryTraceComparison), §3.3, §2.4, `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:induction-jacquet` (SmoothRepresentationsOfLocalGroups), `gap:bernstein-exclusions` (SmoothRepresentationsOfLocalGroups), §4.8, `gap:generic-standard-modules` (MetaplecticAutomorphicForms), §4.4, `gap:theta-seesaw` (MetaplecticAutomorphicForms), `gap:theta-parameter-laws` (MetaplecticAutomorphicForms), §3.1, §3.2, §1.3, §4.7, `gap:tempered-stability` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tempered-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tempered-whittaker` (EndoscopicTransferAndUnitaryTraceComparison).

## Layer 6: Global relative periods and the classical nonvanishing assertion

### 6.1 Adelic Bessel periods

Construct `GGP.globalBesselPeriod`. For a global relevant symmetric pair, global nontrivial additive character of `A_A`/A and its Bessel nu, construct the linear functional Pnu(f) = integral over H(F) quotient H(`A_F`) of f(j(h)) nu(h) dh on cusp forms. Prove absolute convergence, descent from the group to the rational quotient, and H(`A_F`)-invariance of its bilinear version on cusp forms tensor nu. The integration measure is the specified invariant quotient measure, with Tamagawa normalization when used in §7–§8. Work with F a global field of characteristic different from 2, A/F is trivial or quadratic étale, and the pair is relevant; in the orthogonal case neither space is a split plane; epsilon = +1; f is a cusp form in the imported automorphic realization; nu is automorphic and trivial on H(F); For split GL groups use cuspidal realizations with fixed unitary central character, square-integrable modulo the split center; no finite-volume claim is made for the full GL adelic quotient. (ggp, §23, pp. 86–88; ggp line 3036, ggp line 3044, ggp line 3077, ggp line 3086; center convention §22, p. 83; ggp line 2908).

The proof route is as follows. Assemble the subgroup by eventual integral compatibility. Rational triviality gives descent; imported rapid decay on the actual cusp form and finite unipotent quotient volume give integrability. Translate the integral using quotient Haar invariance.

The interface includes `GGP.globalBesselPeriod_add_smul`: Pnu is C-linear on the actual cusp-form space.; `GGP.globalBesselPeriod_equivariant`: The bilinear functional on pi tensor nu is H(`A_F`)-invariant.; `GGP.globalBesselPeriod_transport`: Compatible rational isometries and measure pushforward transport the period; measure rescaling by c multiplies it by c.

*Needs:* §2.1, RestrictedProducts §Layer 1, RestrictedProducts §Layer 2, RestrictedProducts §Layer 3, GlobalNumberFields §Layer 4, GlobalNumberFields §Layer 5, `gap:adelic-points` (AdelicAlgebraicGroups), `gap:quotient-integration` (AdelicAlgebraicGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups), `gap:cuspidal-tensors` (AutomorphicFormsOnReductiveGroups), `gap:petersson-pairings` (AutomorphicFormsOnReductiveGroups), `gap:period-growth` (AutomorphicFormsOnReductiveGroups), `gap:orthogonal-scheme-points` (ReductiveGroupsPartII), Tau Ceti `TauCeti.ConstantForm.groupScheme`.

**Checks.**

- `global_bessel_diagonal`: For codimension one nu = 1 and P is integral of the two restricted cusp forms on the smaller-group quotient.
- `global_bessel_zero_input`: For f = 0, Pnu(f) = 0; a nonzero period means a functional nonzero somewhere, not on every vector.
- `global_bessel_split_plane`: SO of a split plane is Gm, whose full idele quotient has an unbounded norm direction; the source’s finite-volume convention does not apply.
- `global_split_center`: For GL1 over a number field, the full idele class group has an unbounded norm direction. Fixing a unitary central character does not make that full quotient finite volume; the automorphic norm uses the center quotient.

### 6.2 Adelic Fourier–Jacobi periods

Construct `GGP.globalFourierJacobiPeriod`. For a global relevant skew pair construct Pnu(f,phi) = integral over H(F) quotient H(`A_F`) of f(j(h)) `theta_nu`(phi)(h) dh. Use the global Weil theta realization and flag character with compatible local psi and mu, and the rational splitting of the cover when present. Prove absolute convergence for cuspidal f and Schwartz oscillator phi when A is not the split quadratic algebra, or when A = F × F and rank V > rank W, or when V = W = 0. On these domains prove C-bilinearity and the invariant functional property on the completed or restricted tensor representation. For split positive equal rank the full-quotient formula is only an ordinary integral on its actual convergence locus; the period used for general cusp inputs is §6.2a. Work with F a global field of characteristic different from 2, A/F trivial or quadratic étale, and a relevant pair; epsilon = −1; psi a nontrivial automorphic additive character; mu|`A_F`ˣ = omega(A/F) and mu|Aˣ = 1 when required; f cuspidal and phi in the actual oscillator Schwartz space. Split GL realizations have fixed unitary central characters and Petersson norms modulo the split center. (ggp, §23, pp. 88–89, ggp line 3094–3146; split unequal rank: liu-relative, Definition 3.4 and Theorem 3.5, pp. 19, 23, liu-relative line 1179–1189, liu-relative line 1478–1491; the equal-rank distinction is Remark 3.6, pp. 23–24, liu-relative line 1492–1543).

The proof route is as follows. Apply rational invariance and compact normal convergence of theta. For nonsplit classical groups combine polynomial theta growth with cusp decay; for split unequal ranks use the relative flag Fourier coefficient and cusp decay in the remaining norm direction. The zero-rank quotient is a point. Genuine signs cancel; quotient translation gives invariance on the ordinary convergence domain. No equal-rank full-quotient convergence is inferred from the Petersson norm.

The interface includes `GGP.globalFourierJacobiPeriod_bilinear`: On the stated ordinary convergence domains the functional is separately C-linear in f and phi and continuous on the archimedean completed tensor factors.; `GGP.globalFourierJacobiPeriod_invariant`: On those domains simultaneous H(`A_F`) translation of f and the oscillator input preserves the value, by absolute convergence and quotient Haar invariance.; `GGP.globalFourierJacobiPeriod_localization`: On those domains any nonzero global functional gives a nonzero local §2.4 model after fixing vectors at the other places; the regularized split analogue is proved in §6.2a.

*Needs:* §2.3, §6.1, `gap:global-theta` (MetaplecticAutomorphicForms), `gap:cuspidal-tensors` (AutomorphicFormsOnReductiveGroups), `gap:petersson-pairings` (AutomorphicFormsOnReductiveGroups), `gap:period-growth` (AutomorphicFormsOnReductiveGroups), `gap:adelic-points` (AdelicAlgebraicGroups), `gap:quotient-integration` (AdelicAlgebraicGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups).

**Checks.**

- `global_fj_zero_phi`: Pnu(f,0) = 0, detecting a definition that forgot the theta input.
- `global_fj_cover_sign`: The cover kernel multiplies f and theta by −1 each, so their product is unchanged.
- `global_fj_rational_character`: An additive character not trivial on the rational field does not descend to the quotient; it is rejected.
- `global_fj_split_GL1_divergence`: For F = Q, A = Q × Q and V = W a skew-Hermitian line, trivial cusp characters are allowed. With unitary inverse-coordinate oscillator and Gaussian/integral Schwartz input, theta(t) = t^(−1/2) sum_(k in Z) exp(−pi(k/t)^2) ≥ t^(−1/2). On the finite-unit subset of positive measure, the truncated integral from epsilon to 1 is at least 2(epsilon^(−1/2)−1), hence diverges as epsilon tends to zero. In the unnormalized ggp split action the zero term is 1 and already gives logarithmic divergence.

### 6.2a Split equal-rank central theta regularization

Construct `GGP.splitEqualRankFourierJacobiPeriod`. For A = F × F and rank V = rank W = n > 0 construct a meromorphic family Z(s;f,Phi) on the actual cuspidal GL(n) × GL(n) realization. Choose the row Schwartz model of the oscillator occurring in the integrand, Omega(g)Phi(x) = beta(det g) abs(det g)^(1/2) Phi(xg), with beta the actual splitting/dual character transported from §§1.4,2.4. Under Fourier transport of the inverse-coordinate action gamma(det g) abs(det g)^(−1/2) Phi(g⁻¹w), beta = gamma; for the unnormalized inverse action gamma0(det g) Phi(g⁻¹w), beta = gamma0 abs(.)^(1/2). Put chi equal to the product of the two cuspidal central characters. Define ThetaStar(s;g,Phi,chi) = abs(det g)^(s−1/2) integral_[Gm] sum_(x in F^n, x ≠ 0) (Omega(ag)Phi)(x) abs(a)^(n(s−1/2)) chi(a) da, initially in its convergence half-plane. Define Z(s;f,Phi) as the integral of f(g,g) ThetaStar(s;g,Phi,chi) over Z_n(A_F) GL(n,F) quotient GL(n,A_F), by meromorphic continuation. At a regular s = 1/2 define the regularized period as Z(1/2;f,Phi). For unitary beta and cuspidal data prove regularity there for all vectors. For arbitrary automorphic quasicharacter beta retain the meromorphic family and its polar coefficients; the scalar functional is defined on representations where the family is holomorphic at 1/2, and a polar finite part is not automatically invariant. Work with F is a global field of characteristic different from 2; A = F × F; n > 0; actual irreducible cuspidal realizations with fixed unitary central characters and compatible automorphic splitting data; Phi is Schwartz; row-model beta includes every inverse splitting/dual twist, so switching from the ggp inverse-coordinate convention must transport the character as well as the Schwartz function; Fix da on Fˣ quotient A_Fˣ and the center-quotient measure dbar_g compatibly with dh through quotient integration; use the same measures in the ordinary comparison; Writing abs(beta) = abs(.)^b with b real, the central nonzero-vector Mellin integral converges for Re(s)+b > 1; unitary beta has b = 0. The center-quotient cusp pairing converges locally uniformly on compact subsets avoiding poles of the continued theta family. (liu-relative, §3.2, Remark 3.6 and (3.12)–(3.13), pp. 23–24, liu-relative line 1492–1543; model normalization §3.1, p. 17, liu-relative line 1029–1036; number-field construction, with the odd-characteristic function-field analogue an owned extension target).

The proof route is as follows. First compare the actual split oscillator with the row model, retaining its character and half-density. Separate the zero orbit, unfold the nonzero orbit in Re(s)+b > 1, and apply Poisson summation at the other central end to continue ThetaStar and Z. Pair on the center quotient using cusp decay, proving local uniform bounds for continuity and specialization. Check the translation identity before specializing, prove regularity in the unitary cuspidal domain from the possible Rankin–Selberg poles on Re(s) = 0 or 1, and prove the ordinary comparison by the same central decomposition. Track meromorphic polar data under quasicharacter twists; do not replace a pole by a field-division value. Over function fields prove the corresponding rational-in-q^(−s) continuation with the discrete norm measure; the number-field locator is a model for this extension, not its citation as a proved theorem.

The interface includes `GGP.splitEqualRankFourierJacobiPeriod_meromorphic`: ThetaStar has central character chi inverse; Z is meromorphic and bilinear, and simultaneous translation by k satisfies Z(s;R(k)f,Omega(k)Phi) = abs(det k)^(−(s−1/2)) Z(s;f,Phi) as an identity of meromorphic germs.; `GGP.splitEqualRankFourierJacobiPeriod_invariant`: If the family is holomorphic at 1/2 on the representation, its central value is an H(A_F)-invariant bilinear functional, continuous in the archimedean Schwartz and smooth-vector topologies; prove this regularity for unitary beta and cuspidal inputs. A nonzero such functional localizes to each §2.4 model.; `GGP.splitEqualRankFourierJacobiPeriod_agrees`: Whenever the full-quotient ordinary integral in §6.2 is absolutely convergent and the family is regular at 1/2, the continued value equals that integral with the compatible measures; establish this by central unfolding and Poisson summation, including the zero-vector term, rather than replacing the full theta by its nonzero-vector part without comparison.; `GGP.splitEqualRankFourierJacobiPeriod_choices`: The continued germ is independent of the chosen splitting point of the Mellin integral and of bases after transporting the actual Schwartz model, beta and measures. No auxiliary truncation constant is part of the regular value. Rescaling da by c and dbar_g by d multiplies Z by cd; preserving dh requires cd = 1.; `GGP.splitEqualRankFourierJacobiPeriod_polar`: For a simple pole Z(s) = R/(s−1/2)+C+..., simultaneous translation by k fixes R and changes C to C−log(abs(det k)) R. For higher poles give the coefficient law obtained by multiplying the Laurent series by exp(−(s−1/2) log(abs(det k))); no invariant scalar finite part is exported at a pole.

*Needs:* §1.4, §2.3, §2.4, §6.2, `gap:global-theta` (MetaplecticAutomorphicForms), `gap:period-growth` (AutomorphicFormsOnReductiveGroups), `gap:cuspidal-tensors` (AutomorphicFormsOnReductiveGroups), `gap:quotient-integration` (AdelicAlgebraicGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups).

**Checks.**

- `split_fj_GL1_Tate`: For F = Q, n = 1, trivial cusp characters, beta = 1 and Gaussian/integral Phi, central unfolding gives the Tate zeta integral at s = 1/2. Its possible poles are at 0 and 1, so the continued central value is regular although the full theta integral of global_fj_split_GL1_divergence diverges.
- `split_fj_row_transport`: For F = Q and a = 2 at the real place, Fourier transform sends 2^(−1/2) Phi(w/2) to 2^(1/2) Fourier(Phi)(2x). The unnormalized Phi(w/2) instead gives 2 Fourier(Phi)(2x), hence beta(2) = 2^(1/2); dropping that character shift changes the central specialization.
- `split_fj_polar_twist`: For F = Q, n = 1, trivial cusp characters and beta = abs(.)^(−1/2), the same family is the Tate zeta integral at s−1/2, with a nonzero residue at s = 1/2. A determinant-norm translation of size e changes its finite part by −R; using that finite part as an invariant scalar fails.
- `split_fj_zero_constant_terms`: For unitary beta and Phi with Phi(0) = Fourier(Phi)(0) = 0, Poisson summation gives rapid decay at both central ends; the ordinary full-quotient integral converges and equals the regularized value. Subtracting only Phi(0) would leave the other divergent end for a general Phi.
- `split_fj_compensated_measures`: Replacing da by 2 da and dbar_g by dbar_g/2 leaves Z and the ordinary comparison unchanged; rescaling only da doubles Z and breaks the fixed-dh comparison.
- `split_fj_rank_zero`: For n = 0 the group and quotient are a point and §6.2 gives the scalar theta evaluation; no center Mellin integral over Gm is inserted.

### 6.3 The representation defining the central L-value

Construct `GGP.distinguishedLRepresentation`. Construct R of the pair’s L-group as M tensor N for orthogonal and symplectic/metaplectic pairs, Ind from the connected dual subgroup of M tensor N for Hermitian pairs, and the corresponding induction of M tensor (N tensor mu⁻¹) for skew-Hermitian pairs. Prove R is symplectic with these signs; its local standard factors and completed global product are those of the imported L-function theory. Do not add the extra trivial line to the symplectic global R. Work with F a global field of characteristic different from 2, A/F is trivial or quadratic étale, and the pair is relevant; in the orthogonal case neither space is a split plane; Actual standard L-group representations M,N and compatible mu when required. (ggp, §22–§24, pp. 85–90; ggp line 2993, ggp line 3019, ggp line 3151, ggp line 3159; Lemmas 3.4–3.5; ggp line 424).

The proof route is as follows. Tensor the duality pairings and use the sign multiplication law; the skew-Hermitian mu⁻¹ changes the conjugate-dual sign before induction. Identify local factors by their actual L-group maps.

The interface includes `GGP.distinguishedLRepresentation_local`: At each place the associated factor is L(s,R composed with `phi_v`).; `GGP.distinguishedLRepresentation_split`: For A = F × F the global L-function is the product of the Rankin–Selberg function and the contragredient Rankin–Selberg function.; `GGP.distinguishedLRepresentation_changeMu`: Replacing mu by mu′ replaces the tensor factor by the explicit ratio twist (mu′/mu)⁻¹.

*Needs:* §4.4, GlobalNumberFields §Layer 8, GlobalNumberFields §Layer 9, `gap:parameter-carriers` (EndoscopicTransferAndUnitaryTraceComparison), `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors).

**Checks.**

- `global_R_zero`: If M = 0 then R = 0 and L(s,R) = 1.
- `global_R_symplectic_dimension`: For dim M = 2, dim N = 1 in the symplectic/metaplectic case, dim R = 2; using N ⊕ 1 here would give 4.
- `global_R_split_product`: At s = 1/2 for unitary data in the split case, the two Rankin–Selberg values are conjugates and their product is the squared absolute value, not a single value.

### 6.4 Classical global nonvanishing as a proposition

Define `GGP.GlobalNonvanishingAssertion`. For every irreducible everywhere tempered pi realized with multiplicity one in the cuspidal spectrum of a global relevant pair, define the assertion that Pnu is nonzero on pi (and the oscillator input when present) iff every local model Model(`pi_v`,`nu_v`) is nonzero and the completed L(1/2,pi,R) is nonzero. The value is interpreted through the supplier’s continuation, with regularity at the center stated in the assertion’s analytic hypotheses. Include as a separate clause of the conjecture equivalence with nonzero adelic relative Hom together with the same nonzero central value. An unconditional equivalence of arbitrary local models with a nonzero restricted-tensor functional is not asserted; it needs compatible almost-everywhere nonzero reference evaluations. Work with F a global field of characteristic different from 2, A/F is trivial or quadratic étale, and the pair is relevant; in the orthogonal case neither space is a split plane; pi irreducible, cuspidal, everywhere tempered, multiplicity one in the specified realization; The completed R-L-function has the continuation and central value used in the source; For split GL groups use cuspidal realizations with fixed unitary central character, square-integrable modulo the split center; no finite-volume claim is made for the full GL adelic quotient. (ggp, Conjecture 24.1, pp. 89–90; ggp line 3151, ggp line 3175). In the Fourier–Jacobi branch Pnu means §6.2’s ordinary period on its convergence domains and §6.2a’s continued central value for split positive equal rank. In the latter case require holomorphy of the family at 1/2 on the actual representation, proved in §6.2a for unitary beta; at a pole only the Laurent family is exported, not this scalar-period assertion.

The proof route is as follows. Form a proposition with the actual period and actual L-function. The period-to-local-distinction implication is proved by fixing tensor factors; neither local distinction alone nor arbitrary assigned scalar periods are substituted for the conjecture.

The interface includes `GGP.GlobalNonvanishingAssertion.localObstruction`: Under the assertion, vanishing of one local model forces the global period to vanish; the direct period-to-local argument also proves this implication without the conjecture.; `GGP.GlobalNonvanishingAssertion.centralObstruction`: Under the assertion, a zero completed central value forces vanishing of the global functional.; `GGP.GlobalNonvanishingAssertion.adelic`: Assuming this conjecture, extract equivalence of nonzero period with nonzero adelic relative Hom and nonzero central value; its local and adelic conditions are thus equivalent when accompanied by that L-value condition. This does not assert a reference-vector theorem for arbitrary local functionals.

*Needs:* §6.1, §6.2, §6.2a, §6.3, `gap:cuspidal-tensors` (AutomorphicFormsOnReductiveGroups), `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors).

**Checks.**

- `global_no_local_only`: Data with all local models nonzero but central L-value zero fail the nonvanishing side; deleting the L-value condition changes the assertion.
- `global_one_bad_place`: A single zero local model obstructs the period even if the central L-value is nonzero.
- `global_nonzero_functional`: A zero vector may have zero period in a distinguished pi; the predicate asks for existence of a nonzero value.

### 6.5 The adjacent unitary period datum

Define `GGP.UnitaryPeriodDatum`. For the displayed unitary pair define the period datum to consist of the inclusion h ↪ h ⊥ h0 and its diagonal Hh, a specified irreducible cuspidal automorphic subrepresentation sigma of Gh, and the Tamagawa period Ph on that actual realization. The norm line h0 has Hermitian quadratic form x ↦ Norm(E/F)(x), so its bilinear Hermitian value at 1 is 1. Base change is the supplier’s actual weak relation at almost every split place; strong base change is supplied by classification when used. Work with E/F a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally. (bpcz, §§1.1.2–1.1.5, pp. 2–3; bpcz line 81, bpcz line 108, bpcz line 124).

The proof route is as follows. Specialize §1.1 to its norm-line complement, and §6.1 to nu = 1. Keep the cuspidal realization rather than an abstract representation with an arbitrary functional.

The interface includes `GGP.UnitaryPeriodDatum.period_apply`: Ph(f) = integral_[U(h)] f(t,t) dt with Tamagawa measure.; `GGP.UnitaryPeriodDatum.baseChange`: The base-change relation means equality at almost every split place; for everywhere tempered sigma the supplied classification identifies every local factor.; `GGP.UnitaryPeriodDatum.transport`: A rational Hermitian isometry transports Gh,Hh, the realization, base change and Ph compatibly.

*Needs:* §6.1, §1.3, `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:adelic-points` (AdelicAlgebraicGroups), `gap:quotient-integration` (AdelicAlgebraicGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups), `gap:cuspidal-tensors` (AutomorphicFormsOnReductiveGroups), `gap:petersson-pairings` (AutomorphicFormsOnReductiveGroups), `gap:period-growth` (AutomorphicFormsOnReductiveGroups).

**Checks.**

- `unitary_norm_line`: For E = Q(i), h0(1) = 1 and h0(i) = 1, whereas h0(1+i) = 2; replacing the norm line by the negative norm line changes the inclusion.
- `unitary_period_zero`: Ph(0) = 0; the datum does not assert the functional is nonzero.
- `unitary_inner_form_fixed`: Two nonisometric h of the same rank give separate data; existence of a distinguished h does not supply distinction on the other.

### Examples

A codimension-one unitary period is diagonal restriction; a Fourier–Jacobi period has a genuine theta input. The split-plane orthogonal quotient is excluded where finite volume is required.

### Dependencies

§2.1, RestrictedProducts §Layer 1, RestrictedProducts §Layer 2, RestrictedProducts §Layer 3, GlobalNumberFields §Layer 4, GlobalNumberFields §Layer 5, `gap:adelic-points` (AdelicAlgebraicGroups), `gap:quotient-integration` (AdelicAlgebraicGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups), `gap:cuspidal-tensors` (AutomorphicFormsOnReductiveGroups), `gap:petersson-pairings` (AutomorphicFormsOnReductiveGroups), `gap:period-growth` (AutomorphicFormsOnReductiveGroups), `gap:orthogonal-scheme-points` (ReductiveGroupsPartII), Tau Ceti `TauCeti.ConstantForm.groupScheme`, §2.3, `gap:global-theta` (MetaplecticAutomorphicForms), §4.4, GlobalNumberFields §Layer 8, GlobalNumberFields §Layer 9, `gap:parameter-carriers` (EndoscopicTransferAndUnitaryTraceComparison), `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors), §1.3.

## Layer 7: Normalized local forms and refinement propositions

### 7.1 Orthogonal normalization factors

Define `GGP.orthogonalDelta`. For a nondegenerate quadratic space of dimension d ≥ 2 define the meromorphic normalization family Delta_SO(d;s) as product(j=1,…,l) zeta(s+2j) if d = 2l+1, and product(j=1,…,l−1) zeta(s+2j) times L(s+l,chi_disc) if d = 2l. Its scalar normalization Delta_SO(d) is the value at s = 0 only where regular. The even discriminant character comes from the square class (−1)^l det Q; use completed functions globally and matching local factors at every place. The global split plane has a pole at s = 0; it has no scalar Delta_SO(2). The period identities use the larger group of dimension at least three, where this pole does not occur. Work with A global field of characteristic different from 2, or a completion of one; d ≥ 2; nondegenerate Q and its actual discriminant character. (ichino-ikeda, §1, p. 4; ichino-ikeda line 138, ichino-ikeda line 145; analytic-continuation convention, ichino-ikeda line 209).

Form finite products of meromorphic functions using the parity of d and the actual discriminant character; the even empty product is 1. Specialize only on the regular-value domain. The pole of zeta at 1 supplies the split-plane negative control.

The interface includes `GGP.orthogonalDelta_odd`: For d = 2l+1, Delta_SO(d;s) is the stated product of zeta(s+2j), and its regular value at zero is the even-zeta normalization.; `GGP.orthogonalDelta_even`: For d = 2l, the final meromorphic factor is L(s+l,chi_disc); at a regular value s = 0 it is L(l,chi_disc), not zeta(2l).; `GGP.orthogonalDelta_local`: For each place the corresponding meromorphic family is formed from local factors; its regular value at zero is the local normalization, including infinite factors. Global factorization is interpreted by continuation.

*Needs:* `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), `gap:parameter-carriers` (EndoscopicTransferAndUnitaryTraceComparison), OrthogonalSpinGroups §Layer 0.

**Checks.**

- `delta_SO2`: At d = 2 the family is L(s+1,chi_disc), with empty zeta product; for a global nonsplit plane its scalar value is L(1,chi_disc).
- `delta_SO3`: At d = 3, Delta = zeta(2), with no discriminant factor.
- `delta_SO4`: At d = 4, Delta = zeta(2)L(2,chi_disc); using zeta(4) for the last factor fails.
- `disc_hyperbolic_plane`: For Q = diag(1,−1), (−1)^1 det Q = 1; its discriminant character is trivial, not the character of −1.
- `delta_split_plane_pole`: Over a global field the split plane has chi_disc = 1, so Delta_SO(2;s) = zeta(s+1) has a pole at zero; assigning it a finite scalar normalization is rejected.

### 7.2 Orthogonal matrix-coefficient forms

Construct `GGP.orthogonalLocalPeriod`. For a local isometric inclusion V0 ↪ V1 of dimensions n,n+1, n ≥ 2, unitary irreducible admissible `pi_i` and invariant positive Hermitian pairings, define `I_v` as the integral over SO(V0)(Fv) of <pi1(t)f1,f1′> times conjugate(<pi0(t)f0,f0′>). Where this integral is absolutely convergent and the local quotient is finite nonzero, define `alpha_v` = `I_v` / (`Delta_G1`,v · `L_v`(1/2,pi1 tensor pi0) / (`L_v`(1,pi1,Ad)`L_v`(1,pi0,Ad))). Keep the meromorphic normalizing L-quotient distinct from the matrix-coefficient integral. At singular normalizing values this construction supplies no scalar alpha; any continued combined value in §7.4 is an explicit clause of the conjecture, rather than a continuation theorem for arbitrary representations. Work with Fv local of characteristic different from 2; n ≥ 2; forms and inclusion nondegenerate; The ordinary-value alpha requires absolute convergence and regular nonzero normalizing quotient; no scalar alpha or meromorphic family of matrix-coefficient integrals is asserted outside that domain. (ichino-ikeda, §1, pp. 5–6; ichino-ikeda line 209, ichino-ikeda line 223, ichino-ikeda line 231).

The proof route is as follows. Construct the sesquilinear integral from unitary matrix coefficients. Relate its equivariance to the model of pi1 tensor conjugate(pi0). Transport the paper’s first-linear inner product to Mathlib’s convention by reversing arguments.

The interface includes `GGP.orthogonalLocalPeriod_sesquilinear`: I is linear in f1 and conjugate-linear in f1′, conjugate-linear in f0 and linear in f0′ under first-linear source pairings.; `GGP.orthogonalLocalPeriod_scale`: Scaling f1,f0 by a,b multiplies the diagonal value by abs(a)² abs(b)².; `GGP.orthogonalLocalPeriod_measure`: Replacing dt by c dt, c > 0, multiplies I and alpha by c.

*Needs:* §7.1, §2.4, `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), `gap:quotient-integration` (AdelicAlgebraicGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups), `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups), `gap:orthogonal-scheme-points` (ReductiveGroupsPartII), Tau Ceti `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`.

**Checks.**

- `orth_local_zero`: If either vector is zero, I = 0 whenever the integral exists; no normalized vector ratio is formed there.
- `orth_local_conjugate`: Scaling f0 by i and keeping f0′ fixed multiplies I by −i, while scaling f1 by i multiplies it by i; omitting conjugation reverses the wrong factor.
- `orth_local_singular`: A pole or zero of the normalizing quotient is not an invertible scalar at specialization; the ordinary alpha constructor rejects it.

### 7.3 Proved orthogonal local normalizations

Prove `GGP.orthogonalTemperedAndSpherical`. For tempered pi0,pi1 of a local adjacent SO pair as in §7.2, prove absolute convergence of `I_v` and nonnegativity of its diagonal values on Ki,v-finite vectors. At a nonarchimedean place assume U1–U6: both groups unramified, Ki hyperspecial, K0 ⊂ K1, both `pi_i` unramified, each vector Ki-fixed with norm 1, and each Ki has volume 1. If `I_v` converges absolutely, prove `alpha_v` = 1 (with the quotient interpreted as in §7.2). Work with The local data of §7.2; temperedness for the first assertion; For the spherical assertion all six U-conditions and absolute convergence, not merely unramifiedness. (ichino-ikeda, Proposition 1.1 and Theorem 1.2, p. 6; ichino-ikeda line 179, ichino-ikeda line 234, ichino-ikeda line 237).

The proof route is as follows. Integrate Harish-Chandra bounds on the smaller group to prove convergence and positive-definiteness to prove positivity. For spherical vectors use the exact Satake matrix-coefficient integral and compare with §7.1’s factor; no ramified period is defined by this evaluation.

*Needs:* §7.2, `gap:local-tempered-estimates` (AutomorphicSpectralTheory), `gap:tempered-factor-regularity` (AutomorphicLFunctionsAndLocalFactors).

**Checks.**

- `orth_spherical_measure_two`: With the same normalized vectors but twice the local measure, alpha becomes 2; U6 is essential for alpha = 1.

### 7.4 Orthogonal refinement conjectures

Define `GGP.OrthogonalRefinementAssertions`. For a global adjacent SO pair of dimensions n,n+1 with n ≥ 2 and nonsplit V0 if n = 2, cuspidal irreducible `pi_i`, define ALG(`pi_i`) by genericity at almost every place. Under ALG for both and the stipulated meromorphic continuation, define the conjunction of Conjecture 1.4 (every local I converges, is nonnegative on diagonal K-finite vectors, and distinction iff alpha is positive somewhere) and Conjecture 1.5: there exists beta ∈ Z, depending on the representations and normalizations but not vectors or S, such that for all nonzero decomposable vectors satisfying U1–U6 outside finite S, squared period divided by the two Petersson norms equals 2^beta C0 `Delta_G1` L(1/2,pi1 tensor pi0)/(L(1,pi1,Ad)L(1,pi0,Ad)) times product(v in S) `alpha_v`/(norm(f1v)² norm(f0v)²). Here period is integral f1(t) conjugate(f0(t)), and `dTam_0` = C0 product `dt_v`. The scalar quotient at a singular point means the continued combined expression, with cancellation/regularity included in the assertion, never separate 0/0. Define Conjecture 2.1 separately for everywhere tempered `pi_i` with elliptic Arthur parameters `psi_i`: replace 2^beta by 1/(abs(`S_psi1`)abs(`S_psi0`)), with `S_psi` the full centralizer in the dual group, not its quotient by the center. Work with F a global field of characteristic different from 2; all displayed dimension, non-split-plane and ALG hypotheses; `pi_i` are in actual cuspidal realizations; Tamagawa Petersson pairings; compatible local measures and nonzero decomposable K-finite vectors; The analytic continuation stipulated in ichino-ikeda §1 is part of the assertion’s domain; the tempered coefficient uses actual elliptic Arthur parameters. (ichino-ikeda, Conjectures 1.4, 1.5 and 2.1, pp. 6–7, 10; ichino-ikeda line 245, ichino-ikeda line 252, ichino-ikeda line 262, ichino-ikeda line 370, ichino-ikeda line 395).

The proof route is as follows. Form named propositions with separate local, global and Arthur-coefficient projections. Use §7.3 to prove independence of enlarging S under U1–U6, and §7.2 to check pairings and measure choices. No implication ALG → tempered is a theorem here.

The interface includes `GGP.OrthogonalRefinementAssertions.local`: Extract the convergence, positivity and distinction clauses of Conjecture 1.4.; `GGP.OrthogonalRefinementAssertions.global`: Extract the vector-independent beta formula of Conjecture 1.5.; `GGP.orthogonalRefinement_enlargeS`: Adding a spherical normalized place to S multiplies the right side by 1.; `GGP.orthogonalRefinement_measureInvariant`: Rescaling `dt_v` by c changes `alpha_v` by c and C0 by c⁻¹, preserving the formula.

*Needs:* §6.1, §7.3, `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors), `gap:quotient-integration` (AdelicAlgebraicGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups).

**Checks.**

- `orth_beta_not_universal`: For parameter centralizer orders 2 and 4, Conjecture 2.1 predicts 2^beta = 1/8, not a universal 1/4.
- `orth_C0_scale`: Replace `dt_v` by 3 `dt_v`: `alpha_v` becomes 3 `alpha_v` and C0 becomes C0/3, so their product is unchanged.
- `orth_ALG_not_Ramanujan`: ALG records only almost-everywhere genericity; no definition unfolds it to temperedness.
- `orth_zero_vector_excluded`: The ratio of period to Petersson norms is undefined on a zero vector; nonzero vector hypotheses exclude 0/0.

### 7.5 Normalized unitary local forms

Define `GGP.unitaryNormalizedLocalPeriod`. For a local factor of a unitary period datum, put Cv = product(i=1,…,n+1) `L_v`(i,`eta_v`^i) · `L_v`(1/2,`Pi_n`,v × Pi_(n+1),v)/L_v(1,`sigma_v`,Ad). When Cv is finite nonzero and the integral is absolutely convergent define `alpha_v`(f,g) = Cv⁻¹ `integral_Hh`(Fv) <`sigma_v`(t)f,g>_v dt. Pairings are invariant positive first-linear Hermitian forms. Use nonzero local vectors only in the further ratio `alpha_v`(f,f)/<f,f>_v. Work with E/F a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally; A place v, actual local base change, Haar measure and positive invariant pairing; The construction’s ordinary scalar domain requires convergence and Cv finite nonzero; §7.6 supplies these for tempered `sigma_v`. (bpcz, §1.1.6, p. 4; bpcz line 148, bpcz line 159, bpcz line 162).

The proof route is as follows. Specialize the local quotient L(1/2,`sigma_v`) of the source, then integrate its matrix coefficient. Its denominator belongs to the analytic theory; it is not a freely chosen normalization.

The interface includes `GGP.unitaryNormalizedLocalPeriod_sesquilinear`: `alpha_v` is linear in f, conjugate-linear in g, with the first-linear source convention.; `GGP.unitaryNormalizedLocalPeriod_measure`: Rescaling dt by c > 0 multiplies `alpha_v` by c.; `GGP.unitaryNormalizedLocalPeriod_inner`: Rescaling the local invariant pairing by c > 0 multiplies `alpha_v` and the local squared norm by c.

*Needs:* §6.5, `gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), `gap:tempered-factor-regularity` (AutomorphicLFunctionsAndLocalFactors), `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups).

**Checks.**

- `unitary_alpha_zero`: `alpha_v`(0,g) = 0, but `alpha_v`(0,0)/<0,0> is not a vector ratio in the theorem.
- `unitary_alpha_complex_scale`: `alpha_v`(if,ig) = `alpha_v`(f,g); `alpha_v`(if,g) = i `alpha_v`(f,g), fixing the conjugation convention.
- `unitary_C_not_arbitrary`: Replacing Cv by 2Cv divides `alpha_v` by 2 and spoils the spherical formula; Cv is tied to the actual L-factors.
- `unitary_split_factor_two`: At a split finite place with residue cardinality 2, eta_v = 1 and L_v(1,1) = (1 − 1/2)⁻¹ = 2. At s = 0 the same local factor has a meromorphic pole and is not an ordinary scalar value.

### 7.6 All-place tempered convergence and spherical values

Prove `GGP.unitaryLocalConvergenceAndSpherical`. For every place v of a quadratic extension of number fields and every tempered local `sigma_v` in §7.5, prove absolute convergence of its matrix-coefficient integral and that Cv has no zero or pole. For a global everywhere tempered cuspidal sigma and a nonzero decomposable vector f, prove that at almost every finite place, `alpha_v`(fv,fv) = vol(U(h)(`O_v`),`dt_v`) · <fv,fv>_v. Prove that the all-place product of normalized vector ratios is well-defined with the Tamagawa factorization convention, by separating finitely many nonspherical places from the product of local volumes. Work with E/F a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally; `sigma_v` tempered and invariant positive pairing; for the almost-everywhere assertion sigma and its vector have the actual restricted tensor realization; No omission of ramified, dyadic or infinite local integrals. (bpcz, §1.1.6 and equation (1.1.6.1), pp. 4–5; bpcz line 166, bpcz line 168, bpcz line 193; §2.3; bpcz line 685; harris Proposition 2.1, pp. 5–6, harris line 250, and Theorem 2.12, p. 23, harris line 1289 (spherical statement outside its finite S, which includes dyadic places)).

The proof route is as follows. Use the local tempered decay bound for the adjacent unitary spherical pair and the supplied regularity of Cv; calculate the hyperspecial matrix coefficient by the Satake integral. Retain the volume factor in converting to the global measure, rather than forcing all but finitely many ratios to be 1 for arbitrary Haar choices.

*Needs:* §7.5, `gap:local-tempered-estimates` (AutomorphicSpectralTheory), `gap:tempered-factor-regularity` (AutomorphicLFunctionsAndLocalFactors), `gap:tamagawa-factorization` (AdelicAlgebraicGroups), `gap:cuspidal-tensors` (AutomorphicFormsOnReductiveGroups).

**Checks.**

- `unitary_spherical_volume`: At a hyperspecial place with norm-one spherical vector and compact volume 2, `alpha_v` = 2, not 1.
- `unitary_infinite_place`: At a complex split place the statement still asks for the genuine GL(n,C) local integral, with its archimedean factor.

### 7.7 Vector, pairing and measure invariance

Prove `GGP.unitaryNormalizationInvariance`. For the convergent local forms of §7.6, nonzero vectors fv, and av ∈ Cˣ, prove `alpha_v`(av fv,av fv)/<av fv,av fv> = `alpha_v`(fv,fv)/<fv,fv>. The same holds under positive rescaling of the local pairing. For finite rescalings `dt_v` ↦ cv `dt_v` with cv > 0 and product cv = 1, the product of local ratios and the global period formula remain unchanged with fixed Tamagawa measures. For product cv = c ≠ 1, their product changes by c and the local measures no longer factor the same Tamagawa measure. Work with E/F a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally; §7.6 convergence and nonzero vectors; only finitely many local rescalings differ from 1. (bpcz, Theorem 1.1.6.1 and normalization definitions, pp. 4–5; bpcz line 160, bpcz line 181, bpcz line 188).

The proof route is as follows. Use sesquilinearity and positivity of the pairings to cancel abs(av)², which is nonzero. Use linearity of integration in the Haar measure and the finite product relation.

*Needs:* §7.6, §6.5.

**Checks.**

- `unitary_vector_two_i`: fv ↦ 2i fv multiplies numerator and denominator of each ratio by 4; both cancel.
- `unitary_measure_reciprocal`: At two places use c and 1/c; the total local product is unchanged.
- `unitary_single_measure`: Doubling just one local measure doubles the product, so invariance with the same Tamagawa factorization would be false.

### 7.8 The global unitary L-value and endoscopic factor

Define `GGP.unitaryGlobalConstant`. For an everywhere tempered cuspidal unitary datum, let Pi = BC(sigma), with `r_m` distinct cuspidal constituents of its degree-m Hermitian Arthur parameter. Set `S_Pi` = (Z/2Z)^(`r_n`+r_(n+1)) as the group of independent signs of those constituents, Delta_(n+1) = product(i=1,…,n+1) L(i,eta^i), C(sigma) = Delta_(n+1) L(1/2,`Pi_n` × Pi_(n+1))/L(1,sigma,Ad), and c(sigma) = C(sigma)/abs(`S_Pi`). Use completed functions; prove the denominator at 1 is finite nonzero in this setting. The central Rankin–Selberg value may be zero. Work with E/F a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally; sigma irreducible cuspidal and tempered everywhere; its actual Hermitian Arthur base change and constituents. (bpcz, §§1.1.3 and 1.1.6, pp. 3–5; bpcz line 93, bpcz line 103, bpcz line 148, bpcz line 191).

The proof route is as follows. Use uniqueness of the multiplicity-free constituent decomposition up to permutation and the supplied adjoint analytic theorem. Identify the finite sign group’s cardinality as 2 to the total number of constituents.

The interface includes `GGP.unitaryGlobalConstant_card`: abs(`S_Pi`) = 2^(`r_n`+r_(n+1)), independent of ordering of constituents.; `GGP.unitaryGlobalConstant_stable`: If both base changes are cuspidal, the component factor is 1/4.; `GGP.unitaryGlobalConstant_local`: The quotient Cv of §7.5 is the corresponding all-place local factor of C(sigma), with analytic continuation used globally, rather than an unproved convergent Euler product at the center.

*Needs:* §6.5, `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors).

**Checks.**

- `unitary_component_stable`: `r_n` = r_(n+1) = 1 gives abs(`S_Pi`) = 4 and factor 1/4.
- `unitary_component_endoscopic`: `r_n` = 1, r_(n+1) = 2 gives abs(`S_Pi`) = 8 and factor 1/8.
- `unitary_Delta_n_one`: At n = 1, `Delta_2` = L(1,eta)L(2,1); replacing eta^i by eta for every i gives the wrong second factor.
- `unitary_central_zero`: A zero central Rankin–Selberg value makes C(sigma) = 0, not undefined; the adjoint denominator is separately nonzero.

### Examples

All denominators have explicit domains. Orthogonal (ALG) is not treated as temperedness; the unitary theorem uses everywhere temperedness. Local volumes are retained in the spherical normalization.

### Dependencies

`gap:factor-change-laws` (AutomorphicLFunctionsAndLocalFactors), `gap:parameter-carriers` (EndoscopicTransferAndUnitaryTraceComparison), OrthogonalSpinGroups §Layer 0, §2.4, `gap:quotient-integration` (AdelicAlgebraicGroups), `gap:tamagawa-factorization` (AdelicAlgebraicGroups), `gap:smooth-functors` (SmoothRepresentationsOfLocalGroups), `gap:casselman-wallach` (SmoothRepresentationsOfLocalGroups), `gap:orthogonal-scheme-points` (ReductiveGroupsPartII), Tau Ceti `TauCeti.ConstantForm.mem_definingPointsSubgroup_iff`, `gap:local-tempered-estimates` (AutomorphicSpectralTheory), `gap:tempered-factor-regularity` (AutomorphicLFunctionsAndLocalFactors), §6.1, `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors), §6.5, `gap:cuspidal-tensors` (AutomorphicFormsOnReductiveGroups).

## Layer 8: Relative character comparison and the proved unitary endpoints

### 8.1 The actual relative distributions

Construct `GGP.relativeCharacters`. Construct the unitary cuspidal relative distribution J_sigma(f) = sum_e Ph(sigma(f)e) conjugate(Ph(e)), over an orthonormal smooth K-basis, and the sum J_X over cuspidal constituents in a specified spectral subset X. Construct the linear distributions I_P,pi and I_Pi from the actual induced automorphic and Whittaker realizations: I_P,pi(f) = sum_e I(Ind(f)e,0) conjugate(J_eta(e)), and I_Pi(f) = sum_W lambda(Pi(f)W) conjugate(beta_eta(W))/<W,W>_Whitt. Here I(e,0) is the regularized Rankin–Selberg period of its Eisenstein series, J_eta the Flicker–Rallis intertwining period, lambda is the continued Whittaker Rankin–Selberg integral at zero, beta_eta is the mirabolic Flicker–Rallis integral with its Asai residue factor, and the Whittaker norm uses the adjoint residue factor; these forms and their measures are the supplier’s constructed analytic objects. Prove the sums are basis-independent continuous distributions and retain this global construction for all the stated cuspidal data. Separately, for tempered sigma_v in the ordinary normalization domain of §7.5, define J_v(fv) = sum_e alpha_v(sigma_v(fv)e,e), using §7.6 and the local trace estimates for absolute convergence, continuity and Cv finite nonzero. Global cuspidality is not a local temperedness hypothesis. Fix dg_Tam on Gh(A), dt_Tam on Hh(A) and positive local measures with product dg_v = dg_Tam and product dt_v = dt_Tam in the convergent restricted-product convention. Define sigma_v(fv) = integral_Gh(Fv) fv(g)sigma_v(g) dg_v and sigma(f) with dg_Tam, so sigma(tensor fv) = tensor sigma_v(fv). The linear distributions use the source differential and finite-S corrections of §8.3; their convolution measure is fixed as part of that source convention. Work with E/F is a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally; sigma is an actual irreducible cuspidal automorphic subrepresentation; Pi is a relevant generic Hermitian Arthur parameter induced from the actual cuspidal datum; For the linear branch use an actual ∗-generic cuspidal datum; define I_P,pi = 0 if it is irrelevant. I_Pi and its Whittaker realization are needed only for relevant data. Every form and measure is the constructed supplier object; For the normalized local branch, sigma_v is tempered, the §7.5 integral is absolutely convergent, Cv is finite nonzero and the trace-integrated convolution is absolutely convergent as supplied in §7.6 and the trace estimates; the global branch has no local temperedness assumption; For unitary convolution use dg_v and dg_Tam with the displayed compatible ambient factorization, independently of dt_v and dt_Tam for the diagonal subgroup. (bpcz, §§5.1.2–5.1.5, pp. 57–59; bpcz line 2951, bpcz line 2966, bpcz line 3040; §8.1.2–8.1.3, pp. 76–78; bpcz line 4122, bpcz line 4225; §10.1.2, p. 87; bpcz line 4694).

The proof route is as follows. Construct sums on smoothing operators using the imported absolute-convergence and trace estimates. Prove basis independence by the Hilbert pairing of the two continued forms. For the unitary distribution both forms are Ph, and positivity on f* tensor f detects a nonzero period.

The interface includes `GGP.relativeCharacters_basisIndependent`: All these expressions agree under a unitary change of K-basis and refinement of the K-finite decomposition.; `GGP.unitaryRelativeCharacter_nonzero`: J_sigma is nonzero iff Ph is nonzero; test on convolution adjoint squares.; `GGP.relativeCharacters_zeroSpectralSubset`: J_empty = 0 and disjoint absolutely summable spectral unions give sums.; `GGP.localRelativeCharacter_rankOne`: For tempered sigma_v, Cv finite nonzero, and the trace-convergent local domain of §7.6, evaluate the normalized relative trace on the smoothing rank-one operator w ↦ <w,f>f: the result is alpha_v(f,f). A test function realizes that operator only with the displayed dg_v convolution convention; the assertion is about the operator whenever no single such test function is chosen.

*Needs:* §6.5, §7.5, `gap:local-tempered-estimates` (AutomorphicSpectralTheory), `gap:schwartz-trace` (AutomorphicSpectralTheory), `gap:eisenstein-periods` (AutomorphicSpectralTheory), `gap:trace-distributions` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tempered-factor-regularity` (AutomorphicLFunctionsAndLocalFactors), §7.6, `gap:tamagawa-factorization` (AdelicAlgebraicGroups), `gap:petersson-pairings` (AutomorphicFormsOnReductiveGroups).

**Checks.**

- `relative_character_phase`: Replacing one orthonormal basis vector e by i e multiplies the first period by i and its conjugate by −i; the summand is unchanged. Omitting conjugation changes its sign.
- `relative_character_empty`: For X empty the spectral sum is zero, not a presumed distinguished contribution.
- `relative_character_zero_period`: A representation with Ph = 0 has J_sigma = 0 even though its ordinary character can be nonzero.
- `relative_character_divergent_rejected`: At a split place with n = 1, trivial unitary local representations give a constant coefficient on the diagonal Fvˣ, whose multiplicative Haar integral is infinite. Smoothness, unitarity and global cuspidality alone are not local convergence hypotheses.

### 8.2 The relevant linear spectral contribution

Prove `GGP.linearRelativeContribution`. For every ∗-generic linear Jacquet–Rallis cuspidal datum chi represented by (P,pi), prove `I_chi` = 2^(−dim aP) `I_P`,pi. If chi is irrelevant, `I_chi` = 0. If chi is relevant, prove the truncated Rankin–Selberg period is independent of the truncation parameter at regular Eisenstein parameters, the actual Whittaker norm equals the Petersson norm, `J_eta`(e) = `beta_eta`(`W_e`), and the continued Rankin–Selberg form I(e,0) = lambda(`W_e`); hence `I_P`,pi = `I_Pi` and `I_chi` = 2^(−dim aP) `I_Pi`. For a Hermitian Arthur Pi, dim aP = `r_n`+r_(n+1), so the coefficient is abs(`S_Pi`)⁻¹. Work with E/F quadratic number-field extension; n ≥ 1; G = Res(E/F) GL(n) × Res(E/F) GL(n+1); The actual ∗-generic predicate, trace coefficient `I_chi`, regular Eisenstein points, and analytic forms are the trace/spectral supplier objects; f is any Schwartz test function. (bpcz, Proposition 5.1.4.1 and Theorem 5.2.1.1, pp. 57–59; bpcz line 2966, bpcz line 3070; Theorem 8.1.2.1, p. 77; bpcz line 4152; Theorem 8.1.4.1, p. 78; bpcz line 4245; Theorem 9.2.5.1 and Corollary 9.2.5.2, p. 86; bpcz line 4668, bpcz line 4677).

The proof route is as follows. Apply generic truncation and the spectral expansion to the relevant contribution; proper interfering Levi terms vanish by the incompatible consecutive Asai distinction characters. Compare the Eisenstein and Whittaker periods through their meromorphic continuations and compute the Petersson/Whittaker normalization by Rankin–Selberg residues. The functional identities here are proof targets; they are not supplied as a GGP theorem.

*Needs:* §8.1, §7.8, `gap:schwartz-trace` (AutomorphicSpectralTheory), `gap:eisenstein-periods` (AutomorphicSpectralTheory), `gap:trace-distributions` (EndoscopicTransferAndUnitaryTraceComparison), `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors).

**Checks.**

- `linear_component_exponent`: For one constituent in each degree dim aP = 2 and 2^(−dim aP) = 1/4; for three total constituents it is 1/8.
- `linear_irrelevant`: An irrelevant ∗-generic datum has zero trace contribution; there is no nonzero factorization to invert.

### 8.3 Transfer and the isolated endoscopic comparison

Prove `GGP.isolatedRelativeComparison`. Let Pi = `Ind_P`(pi) be a Hermitian Arthur parameter and S0 a finite set containing all infinite places, all places ramified in E, and the ramification of Pi. Let Hcirc be the Hermitian rank-n spaces admitting selfdual lattices outside S0 and let S0prime be the finite places of S0 together with all inert finite places. For h in Hcirc, let Xh consist of cuspidal constituents spherical outside S0 with split local base change `Pi_v` outside S0prime and infinity. For f and fh on the actual Schwartz spaces, assume: their outside-S0 factors are spherical; the inside factors transfer by matching orbital integrals; fh,out is spherical base change of `f_out`; the inside factors are multiplied by the measure factors `Delta_H`^(S0,*) `Delta_Gprime`^(S0,*) and (`Delta_Hh`^(S0,*))² respectively; and `f_out` is compactly supported on the restricted product outside S0prime, times the unit characteristic function at S0prime minus S0. Prove sum_(h in Hcirc) `J_Xh`(fh) = abs(`S_Pi`)⁻¹ `I_Pi`(f). Work with E/F a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally; Pi an actual Hermitian Arthur parameter; all five test-function/measure hypotheses displayed; no split-supercuspidal assumption. (bpcz, Proposition 10.1.6.1, pp. 87–89; bpcz line 4712, bpcz line 4734, bpcz line 4750, bpcz line 4755).

The proof route is as follows. Compare the generic geometric distributions for matching functions. Apply cuspidal spectral isolation and the spherical base-change eigenvalue relation to remove all unwanted data. The surviving linear contribution is §8.2; prove convergence of the sum over h and cuspidal constituents before interchanging it.

*Needs:* §8.2, `gap:trace-distributions` (EndoscopicTransferAndUnitaryTraceComparison), `gap:finite-smooth-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:archimedean-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:spherical-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:schwartz-trace` (AutomorphicSpectralTheory), `gap:endoscopic-isolation` (AutomorphicSpectralTheory), `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tamagawa-factorization` (AdelicAlgebraicGroups).

**Checks.**

- `isolated_enlarge_S`: Enlarging S0 preserves the identity after incorporating the new measure factors and transfer units; simply dropping a factor does not.
- `isolated_zero_functions`: With f = 0 and fh = 0 for all h, both sides are zero.

### 8.4 Unitary global nonvanishing including endoscopy

Prove `GGP.unitaryEndoscopicNonvanishing`. For every quadratic extension E/F of number fields, n ≥ 1, and Hermitian discrete Arthur `Pi_n`,Pi_(n+1), prove that the completed L(1/2,`Pi_n` × Pi_(n+1)) is nonzero iff there exist a nondegenerate n-dimensional Hermitian h and an irreducible cuspidal automorphic subrepresentation sigma of U(h) × U(h ⊥ norm-line), with Pi as its weak base change, such that Ph is a nonzero functional on sigma. Here the source’s degree-m Hermitian discrete Arthur parameter is generic (trivial Arthur SL2): it is the full parabolic induction of pairwise distinct conjugate-selfdual cuspidal constituents of degrees d_i summing to m, each with Asai sign (−1)^(m+1) pole at 1. No temperedness is imposed on this theorem. Work with E/F quadratic field extension of number fields; n ≥ 1; `Pi_n` and Pi_(n+1) actual Hermitian discrete Arthur parameters with the displayed Asai-pole condition. (bpcz, Theorem 1.1.5.1, p. 3; bpcz line 93, bpcz line 124; proof §10.2, p. 90; bpcz line 4835).

The proof route is as follows. Use the Whittaker Rankin–Selberg functional to equate its nonzero relative distribution with nonzero completed central value. Nonzero transfer and §8.3 produce a nonzero cuspidal period on some h. For the converse, use a positive convolution square and matching transfer to force a nonzero linear relative character, hence nonzero central value. Existence and strong uniqueness of base change are genuine supplier results.

*Needs:* §8.3, §6.5, `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors), `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:trace-distributions` (EndoscopicTransferAndUnitaryTraceComparison), `gap:finite-smooth-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:archimedean-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:schwartz-trace` (AutomorphicSpectralTheory), `gap:endoscopic-isolation` (AutomorphicSpectralTheory).

**Checks.**

- `unitary_Asai_signs`: Degree m = 1 uses Asai+, degree m = 2 uses Asai−; a fixed sign for all degrees fails.
- `unitary_Asai_endoscopic_partition`: For ambient m = 2 and partition d1+d2 = 1+1, both distinct conjugate-selfdual degree-one constituents must have an Asai− pole at 1; assigning Asai+ from each constituent degree gives the wrong Hermitian class.
- `unitary_nonvanishing_not_fixed_h`: The conclusion is existential in h and sigma; a fixed unrelated inner form is not asserted to be distinguished.
- `unitary_number_field_only`: A global function field satisfies neither the number-field nor the certified unitary theorem hypotheses; the global classical assertion is separate.

### 8.5 From isolated transfer to factorization

Prove `GGP.unitaryRelativeCharacterFactorization`. For an everywhere tempered irreducible cuspidal sigma in a fixed unitary datum, prove for every decomposable Schwartz f = tensor fv that J_sigma(f) = c(sigma) product_v J_v(fv), where J_v is the normalized local relative trace of §8.1 and c(sigma) is §7.8. The product uses the spherical Hh volumes and both compatible Tamagawa decompositions of §8.1. If some local invariant functional space is zero, both sides vanish. Otherwise the actual nonarchimedean selection and archimedean packet-uniqueness theorems and automorphic multiplicity formula isolate sigma, and all local comparison constants have product 1. Work with E/F is a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally; sigma cuspidal irreducible and tempered at every place; actual all-place base change Pi; factorizable Schwartz test functions; Tamagawa global measures dg_Tam and dt_Tam and positive local dg_v,dt_v with product dg_v = dg_Tam and product dt_v = dt_Tam, including convergence/leading-value normalization; sigma_v(fv) uses dg_v as in §8.1. (bpcz, §10.3.1–§10.3.5, pp. 90–92; bpcz line 4866, bpcz line 4889, bpcz line 4917, bpcz line 4931, bpcz line 4939).

The proof route is as follows. Factor the linear Whittaker relative character into local factors, identify the Asai denominator with the adjoint denominator, and compare each matching local relative trace. At infinity extend the comparison from the dense transfer subspace by continuity. The real-place packet uniqueness is §5.6 and complex split-place uniqueness is §4.7; neither is inferred from multiplicity one alone. Convert source differential measures dK_v^src for K = Gh,Hh by dK_Tam = (Delta_K^*)⁻¹ product_v Delta_K,v dK_v^src (bpcz §2.3.2). Choose positive a_K,v with convergent product a_K,v = (Delta_K^*)⁻¹ and set dK_v = a_K,v Delta_K,v dK_v^src, standard outside a finite set after convergence factors. Write b_G,v = a_G,v Delta_G,v and b_H,v = a_H,v Delta_H,v. The normalized local distribution becomes b_G,v b_H,v Cv⁻¹ times the source unnormalized local trace. At finite S use dK_Tam = dK_S^src × (Delta_K^(S,*))⁻¹ product_(v outside S) Delta_K,v dK_v^src. The source special tensor is (Delta_Hh^(S,*))² times tensor_(v in S) fsrc_v times tensor_(v outside S) 1_KG,v, and its distribution equals abs(S_Pi)⁻¹ L^S(1/2,Pi_n × Pi_n+1)/L^S(1,sigma,Ad) times product_(v in S) J_sigma_v^raw(fsrc_v) (bpcz line 4891–4892); here the superscript S denotes the outside-S factor, with the leading value at zero on Delta. Passing through finite S and its spherical volumes gives the displayed product-normalized identity, rather than discarding the source leading-value factors. For unitary groups identify Delta_Gh Delta_Hh = Delta_(n+1) (Delta_Hh)², locally and globally; this converts the completed c(sigma) and source partial L-ratio with its squared Hh convergence factor into each other. At each finite S track the outside-S convergence factors as measures, not as an asserted absolutely convergent Euler product at the central point.

*Needs:* §8.3, §7.6, §7.8, §5.3, §3.2, `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:finite-smooth-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:archimedean-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:relative-character-constants` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tempered-factor-regularity` (AutomorphicLFunctionsAndLocalFactors), `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors), §5.6, §4.7, `gap:tamagawa-factorization` (AdelicAlgebraicGroups).

**Checks.**

- `factorization_local_obstruction`: If one local model is zero, its relative trace and J_sigma vanish; no local character is divided by a zero period.
- `factorization_transfer_constant`: At two places with comparison constants k and k⁻¹, the global comparison constant is 1; arbitrary independent constants would spoil the formula.
- `factorization_G_single_rescaling`: Keeping every H measure fixed and replacing one dg_v by 2 dg_v doubles sigma_v(fv) and every nonzero J_v(fv), while J_sigma and c(sigma) stay fixed. Such local measures no longer factor dg_Tam and are excluded.
- `factorization_G_compensated`: Replacing dg_v by 2 dg_v and dg_w by dg_w/2 preserves product dg_v, multiplies the two local traces by 2 and 1/2, and leaves their product and the factorization unchanged.

### 8.6 GGP.8: the unitary refined period identity

Prove `GGP.unitaryRefinedPeriod`. For every unitary datum with sigma irreducible cuspidal and tempered everywhere, Pi = BC(sigma), and every nonzero decomposable f = tensor fv in sigma, prove `abs(Ph(f))²/<f,f>_Pet = abs(S_Pi)⁻¹ · Delta_(n+1) · L(1/2,Pi_n × Pi_(n+1))/L(1,sigma,Ad) · product_v (alpha_v(fv,fv)/<fv,fv>_v)`. Global Ph and Petersson pairings use Tamagawa measures on Hh and Gh; the local `dt_v` factor the former. All L-functions are completed. Local pairings may be any positive invariant pairings with the normalization conventions of §7.5–§7.7. No local place is omitted and Pi need not be cuspidal. Work with E/F a quadratic field extension of number fields, n ≥ 1, h is any nondegenerate n-dimensional Hermitian E-space, h0 is the norm line, Gh = U(h) × U(h ⊥ h0), Hh = U(h) diagonally; sigma cuspidal irreducible and tempered at every place; actual base change and `r_m` as in §7.8; f is nonzero and factorizable; all local factors fv are nonzero; the global and local measures satisfy the displayed factorization. (bpcz, Theorem 1.1.6.1, pp. 4–5; bpcz line 179, bpcz line 188; proof §10.3.2, p. 91; bpcz line 4889).

The proof route is as follows. Use smoothing operators and polarization to identify the factorized relative distribution with the square of Ph as a sesquilinear form. Apply rank-one extraction on smooth vectors and continuity at infinity, then divide by the positive Petersson norm and nonzero local vector norms. The analytic local divisions were justified in §7.6, the adjoint division in §7.8; the central L-value is never inverted.

*Needs:* §8.5, §7.7, §7.8, §7.6, §6.5, `gap:schwartz-trace` (AutomorphicSpectralTheory).

**Checks.**

- `GGP8_stable_endoscopic`: The coefficient is 1/4 for two cuspidal base changes and 1/8 for three total constituents; the same formula handles both.
- `GGP8_zero_period`: For a nonzero vector with Ph(f) = 0, the identity is still an equality of zero values; it never cancels Ph(f).
- `GGP8_rescaling`: Replacing f by 2i f multiplies its squared period and global squared norm by 4 and leaves the normalized right side unchanged.

### 8.7 Stable specialization and compatibility

Verify `GGP.stableUnitarySpecialization`. For n > 1 and both `Pi_n` and Pi_(n+1) Hermitian cuspidal, specialize §8.4 to the stable global nonvanishing theorem. For an everywhere tempered cuspidal sigma with these base changes, specialize GGP.8 to the stable constant 1/4. Compare the bplzz convention that the opposite Asai sign is regular at 1 with the bpcz convention that the degree-m sign (−1)^(m+1) has a pole, using factorization of the two Asai functions and the conjugate-selfdual cuspidal pole dichotomy. Work with E/F quadratic number-field extension; n > 1; both actual base changes cuspidal and Hermitian; For the refined specialization sigma is everywhere tempered and all GGP.8 vector and measure hypotheses hold. (bplzz, Definition 1.5 and Theorems 1.8, 1.10, pp. 3–5; bplzz line 127, bplzz line 128, bplzz line 157, bplzz line 185).

The proof route is as follows. Set `r_n` = r_(n+1) = 1; compare the source conventions using the supplied Asai pole dichotomy, not by reversing a sign in the definition.

*Needs:* §8.4, §8.6, §7.8, `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors).

**Checks.**

- `stable_n_one_boundary`: The bplzz version assumes n > 1. The n = 1 case comes from bpcz §8.4/§8.6, not this specialization.

### Examples

The stable component factor 1/4 and an endoscopic factor 1/8 test GGP.8. The nonvanishing theorem ranges over Hermitian forms, whereas GGP.8 concerns a fixed realized sigma.

### Dependencies

§6.5, §7.5, `gap:local-tempered-estimates` (AutomorphicSpectralTheory), `gap:schwartz-trace` (AutomorphicSpectralTheory), `gap:eisenstein-periods` (AutomorphicSpectralTheory), `gap:trace-distributions` (EndoscopicTransferAndUnitaryTraceComparison), `gap:tempered-factor-regularity` (AutomorphicLFunctionsAndLocalFactors), §7.6, `gap:tamagawa-factorization` (AdelicAlgebraicGroups), `gap:petersson-pairings` (AutomorphicFormsOnReductiveGroups), §7.8, `gap:global-completed-factors` (AutomorphicLFunctionsAndLocalFactors), `gap:finite-smooth-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:archimedean-transfer` (EndoscopicTransferAndUnitaryTraceComparison), `gap:spherical-base-change` (EndoscopicTransferAndUnitaryTraceComparison), `gap:endoscopic-isolation` (AutomorphicSpectralTheory), `gap:global-base-change` (EndoscopicTransferAndUnitaryTraceComparison), §5.3, §3.2, `gap:relative-character-constants` (EndoscopicTransferAndUnitaryTraceComparison), §5.6, §4.7, §7.7.

## Downstream consumers

- PeriodsAndSpecialValues receives GGP.8 (§8.6), with §7.5–§7.8’s exact all-place local forms, measure factorization and endoscopic factor. Its contract is the proved everywhere-tempered unitary identity; the classical conjecture propositions are separate exports. No section of this consumer is asserted without its text.
- SelmerIwasawaCohomologyPartII receives §5.3, §5.5, §8.4 and GGP.8 for automorphic local distinction and period nonvanishing. Its arithmetic cycle and Selmer constructions do not enter these proofs.
- Further arithmetic GGP consumers can use §6.4 and §7.4 only as explicitly assumed conjecture propositions. No cycle, height or derivative theorem follows here.

## References

Source IDs, legally read versions, hashes and certification are recorded in `packages/GanGrossPrasadConjecturesForClassicalGroups/sources.toml`. Exact theorem/page/cache-line locators accompany every target; page numbers refer to the recorded preprint or author version, rather than unverified published pagination.

- `ggp`: Gan, Gross and Prasad, *Symplectic local root numbers, central critical L-values, and restriction problems in the representation theory of classical groups*, [arXiv:0909.2999v1](https://arxiv.org/abs/0909.2999v1), §§2, 4–6, 12–19, 22–24.
- `ichino-ikeda`: Ichino and Ikeda, *On the periods of automorphic forms on special orthogonal groups and the Gross–Prasad conjecture*, [60-page author revision](https://www.math.kyoto-u.ac.jp/~ikeda/gp_revised.pdf), §§1–2, Propositions/Theorems 1.1–1.2 and Conjectures 1.4–1.5, 2.1.
- `gan-ichino`: Gan and Ichino, *The Gross–Prasad conjecture and local theta correspondence*, [arXiv:1409.6824v2](https://arxiv.org/abs/1409.6824v2), §3.2, Theorem 1.3, Corollary 1.4, Propositions 9.1–9.4.
- `sun-zhu`: Sun and Zhu, *Multiplicity one theorems: the Archimedean case*, [arXiv:0903.1413v2](https://arxiv.org/abs/0903.1413v2), Theorems B–C.
- `sun`: Sun, *Multiplicity one theorems for Fourier–Jacobi models*, [arXiv:0903.1417v3](https://arxiv.org/abs/0903.1417v3), Theorems B–C.
- `waldspurger`: Waldspurger, *Une variante d’un résultat de Aizenbud, Gourevitch, Rallis et Schiffmann*, [arXiv:0911.1618v1](https://arxiv.org/abs/0911.1618v1), Theorem 1.
- `bp-refined`: Beuzart-Plessis, *Endoscopie et conjecture locale raffinée de Gan–Gross–Prasad pour les groupes unitaires*, [HAL author text](https://hal.science/hal-00761084/document), §§1.3, 3.1, 4.1(1), 7.2, 7.7, 8.3 and Theorem 8.5.1, printed pp. 70–71 (extraction pp. 71–72); its classification hypotheses and labeling are explicit supplier contracts.
- `bp-unitary-tempered`: Beuzart-Plessis, *La conjecture locale de Gross–Prasad pour les représentations tempérées des groupes unitaires*, [arXiv:1205.2987v2](https://arxiv.org/abs/1205.2987v2), Theorem 18.4.1 (unlabelled uniqueness precursor).
- `bp-arch`: Beuzart-Plessis, *A local trace formula for the Gan–Gross–Prasad conjecture for unitary groups: the archimedean case*, [arXiv:1506.01452v3](https://arxiv.org/abs/1506.01452v3), §12.3 and Theorem 12.4.1, pp. 288–290. This is uniqueness across relevant inner forms without the explicit real epsilon-character prediction.
- `harris`: R. Neal Harris, *The refined Gross–Prasad conjecture for unitary groups*, [arXiv:1201.0518v2](https://arxiv.org/abs/1201.0518v2), Proposition 2.1 and Theorem 2.12. Its spherical calculation excludes a finite set including dyadic and infinite places; local convergence and GGP.8 retain all places.
- `bplzz`: Beuzart-Plessis, Liu, Zhang and Zhu, *Isolation of cuspidal spectrum, with application to the Gan–Gross–Prasad conjecture*, [arXiv:1912.07169v3](https://arxiv.org/abs/1912.07169v3), Definition 1.5, Theorems 1.8 and 1.10.
- `bpcz`: Beuzart-Plessis, Chaudouard and Zydor, *The global Gan–Gross–Prasad conjecture for unitary groups: the endoscopic case*, [arXiv:2007.05601v1](https://arxiv.org/abs/2007.05601v1), §§1.1.2–1.1.6, 2.3, 5.1–5.2, 8.1, 9.2 and 10; Theorems 1.1.5.1 and 1.1.6.1.

- `liu-relative`: Liu, *Relative trace formulae toward Bessel and Fourier–Jacobi periods of unitary groups*, [arXiv:1012.4538v1](https://arxiv.org/abs/1012.4538v1), §3.2, Definition 3.4, Theorem 3.5, Remark 3.6 and (3.12)–(3.13), pp. 19, 23–24; row oscillator normalization §3.1, p. 17.
