# Roadmap: unitary Bessel models and the Gan–Gross–Prasad period formula

**Summary.** Build the relative restriction library for unitary groups from Hermitian geometry, local representation categories, actual enhanced Langlands correspondences and automorphic analysis. The endpoints are multiplicity one for every relevant odd codimension, the tempered nonsplit local theorem with its epsilon-factor enhancement, adjacent global period nonvanishing including endoscopy, and the completed Tamagawa-normalized identity **GGP.8**. The fixed-pair global assertion in arbitrary odd codimension and the split archimedean higher-codimension prediction are named propositions with their conjectural status retained. Every analytic theorem includes all permitted bad and infinite places.

## Scope and ownership

This roadmap owns relevant Hermitian pairs, their relative Bessel subgroups and characters, model spaces and transport, relative distribution symmetry and multiplicity, relative tempered forms and geometric multiplicities, the Bessel calculation over Langlands packets, global Bessel periods, relative normalizers and the adjacent period theorems. It includes rank-zero smaller spaces and split local algebras; the final global adjacent theorems have n≥1. It makes no quasi-split, CM, totally-real, unramified, odd-residue-characteristic or auxiliary-supercuspidal restriction on the library.

Mathlib already supplies `LinearMap.Nondegenerate`, `Submodule.orthogonalBilin`, algebraic representations, tensor representations and `Representation.IntertwiningMap`. Tau Ceti already supplies `TauCeti.HopfAlgebra.pointsFunctor`. The relative definitions below use these carriers rather than parallel generic form, representation, intertwiner or points-functor structures. Mathlib’s `Matrix.unitaryGroup` is the identity-Gram-matrix group, not arbitrary U(h). Its definition is used as a compatibility witness for the requested Hermitian supplier, not as a substitute for it.

ReductiveGroups Layers 0, 3, 5 and 8 own the general algebraic-group dictionaries, subgroup representability, unipotent radicals and parabolics. GlobalNumberFields Layers 4–6 and 8 own the arithmetic adelic carriers. Completed RestrictedProducts Layers 0–3 own the generic restricted-product maps and rational diagonals. RepresentationTheory/ClassicalGroups Layer 6 states finite-dimensional GL branching; it does not supply a local admissible category or the arbitrary-form unitary correspondence. OrthogonalSpinGroups owns orthogonal groups and spinor arithmetic; none of its orthogonal endpoints is a prerequisite here. RepresentationTheory/LieGroups owns general real Lie-group constructions. None of these directions is planned again.

The general Hermitian/unitary realization, enhanced local and global classification, smooth and Casselman–Wallach categories, ordinary endoscopy, L-functions, general spectral analysis, Weil/theta theory and Tamagawa measures retain the named owners in the contracts below. Their unavailable primary contracts are registered gaps, not substituted axioms. General Schwartz multipliers belong to the AutomorphicSpectralTheory continuation; general Jacquet–Rallis geometric comparison and all-place transfer belong to an EndoscopicTransferAndUnitaryTraceComparison continuation. This roadmap owns the relative spectral contribution after those inputs, not their general theories.

Orthogonal, symplectic/metaplectic and Fourier–Jacobi GGP endpoints belong to GanGrossPrasadUnitaryGroups, Part II; its scope begins after the unitary Bessel interfaces here. Arithmetic cycles, heights, derivative identities, Selmer ranks and local level optimization remain with their arithmetic owners. Microlocal asymptotics remain with QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups. The period-witness premise in SelmerIwasawaCohomologyPartII §8.1 is not an input here and its rank theorem is not a consequence asserted by this roadmap.

## Conventions

Algebraically F is a field of characteristic different from 2 and E is a quadratic étale F-algebra with involution c. Modules are finite projective of constant E-rank, hence free in this field/étale setting. Forms satisfy h(ax,by)=a c(b)h(x,y) and h(y,x)=c(h(x,y)); nondegeneracy is explicit. The hyperbolic plane has Gram matrix [[0,1],[1,0]], so its basis satisfies h(e,e)=h(f,f)=0 and h(e,f)=h(f,e)=1. The line <a> has h(e,e)=a∈F×. A relevant complement is H^r orthogonal-sum <a>, of rank 2r+1. Over C/R the complements of signatures (r+1,r) and (r,r+1) are both present. Split E means F×F with coordinate swap; hermitian rank n becomes GL_n(F), not GL_(2n)(F).

Local analytic fields have characteristic zero: finite extensions of Q_p, R or C. All primes, including 2 and 3, are included. At finite places use smooth admissible complex representations; at infinity use Casselman–Wallach representations and continuous functionals on completed projective tensors. The smooth dual on the smaller factor is essential when comparing a bilinear Bessel model with an older restriction-Hom convention. A character ψ of split E must be nontrivial on each field factor. Distinguish this Bessel additive character from the epsilon-factor character ψ_E, which is nontrivial on E and trivial on F. The epsilon character uses the actual Whittaker normalization of GGP §17, transported with the complement reference and, over R, Xue §2.1; freezing a label while changing the reference is not permitted.

Use right translations, H=N⋊U(W) mapped by (u,g)↦(u i(g),g), and m=dim Hom_H(π_V tensor π_W,ν). Thus P(f)=∫_[H]f(h)ν(h)⁻¹dh transforms by ν. The linear-first pairing B(x,y) corresponds to Mathlib’s conjugate-first inner product with slots exchanged. In particular B(i,1)=i, whereas Mathlib’s inner product of i with 1 is -i. Matrix coefficients, duals and polarization all use this convention. For upper B in GL₂, δ_B(diag(a,1))=|a|; normalized induction inserts |a|^(1/2), while §2.4 uses the explicitly unnormalized induction.

Parameters of degree m have conjugate-dual sign (-1)^(m-1). Component generators count distinct appropriate-sign irreducibles; the central element counts their multiplicities modulo two. The global Hermitian constituent has an Asai pole with sign (-1)^(m+1); the adjoint uses the opposite sign (-1)^m. In degree 1 the former sign is + and the latter is -. All global L-functions include infinite factors. Local class field theory sends geometric Frobenius to a uniformizer, with |Frob|=q⁻¹ (ggp §3, p. 8, ggp line 272–276). An arithmetic-Frobenius supplier is compared by inversion. For two unramified one-dimensional eigenvalues a,b the direct-sum L-factor is ((1-aq⁻ˢ)(1-bq⁻ˢ))⁻¹; replacing geometric Frobenius by its inverse changes the eigenvalues to a⁻¹,b⁻¹. Global H and G quotient measures are Tamagawa measures including global convergence factors, with local H measures factoring the fixed global measure. Local pairings can be scaled independently. Product-one local Haar rescalings preserve the identity; arbitrary changes of the global H measure do not.

All vector spaces and groups live in a common universe u; complex coefficient spaces may use max(u, universe of C), and the functor-of-points test-algebra universe is recorded by the native Tau Ceti lift. No finite-dimensionality or completeness instance is inferred from a mere algebraic representation. Natural-number multiplicities are used only after finite-dimensionality. Quotients by vector norms require nonzero vectors; C_v is inverted only after local regularity and nonvanishing; the global central value is never inverted.

**Checks.**

- The two hyperbolic basis vectors have zero norm and mutual pairing 1; the diagonal form diag(1,1) over C/R fails this test.
- Over split E a rank-one unitary group is F×. Replacing the constant rank by F-dimension would give the wrong GL₂.
- U(2) standard weights 1,0 pair bilinearly with U(1) weights -1,0. Weight 1 is a negative control for the dual convention.
- If ν(h)=i, P(R(h)f)=iP(f). Weighting the integral by ν gives -i instead.
- In degrees 2 and 1, changing ψ_E by a nonnorm changes the one-dimensional even-side generator sign by -1 and leaves the odd-side label unchanged; two such changes cancel.
- For W=C, x=-1, the moving-space norm determinant is 4; its reciprocal is the wrong geometric discriminant ratio.
- Constituent counts (1,1) and (2,1) give coefficients 1/4 and 1/8. A fixed 1/4 loses endoscopic cases.
- Scaling f by c≠0 multiplies both |P(f)|² and its Petersson norm by |c|²; scaling one local pairing by 2 cancels in q_v. Haar factors 2 and 1/2 at two places cancel; a global H Haar factor 2 multiplies |P|² by 4.

## Exact supplier contracts

The baseline is Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. A contract labeled `gap:` is required mathematics, not a declaration available for use. It must be discharged before a dependent target is implemented as a theorem; the target’s final hypotheses do not acquire an arbitrary package of its desired conclusions.

### From Mathlib

- `LinearMap.Nondegenerate`, in `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean`, means both left and right separation of the sesquilinear map. `Submodule.orthogonalBilin` and `Submodule.mem_orthogonalBilin`, in `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean`, give the orthogonal submodule by vanishing against every member of the first submodule. The complement definition must respect this chirality.
- `Representation.IntertwiningMap`, `Representation.IntertwiningMap.ext` and `Representation.IntertwiningMap.isIntertwining`, in `Mathlib/RepresentationTheory/Intertwining.lean`, give the algebraic equivariant-map carrier and evaluation. They supply no continuity or admissibility.
- `Representation.tprod` and `Representation.tprod_apply`, in `Mathlib/RepresentationTheory/Basic.lean`, give the diagonal tensor action over a commutative semiring; use their complex specialization for finite-place algebraic tensors. `Representation.dual` uses the inverse action on the algebraic dual; it is not by itself a smooth contragredient.
- `Matrix.unitaryGroup`, in `Mathlib/LinearAlgebra/UnitaryGroup.lean`, is the unitary submonoid of matrices over a commutative star ring. The requested arbitrary-form group must agree with it on the identity Gram matrix, including size zero.

### From Tau Ceti

`TauCeti.HopfAlgebra.pointsFunctor`, in `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean`, sends a commutative R-algebra A to the convolution group on H→ₐ[R]A for a Hopf R-algebra H, and algebra maps act by postcomposition. Its coefficient and Hopf hypotheses are retained; it is not the group-like-elements functor. Apply it to the coordinate Hopf algebra of the relative subgroup constructed through ReductiveGroups.

### From TauCetiRoadmap.ReductiveGroups

Layers 0, 3, 5 and 8 supply the affine Hopf/scheme/point dictionaries, closed subgroup constructions, unipotent radicals and flag parabolics. Use those sections to prove representability of the concrete flag stabilizer and relative embedding in §1.2. Their generic reductive structure does not choose a Hermitian form.

### From TauCetiRoadmap.GlobalNumberFields

Layers 4–6 and 8 supply finite/full adeles, rational embeddings, completion maps and extension/base-change maps. Use these in §4.1 and localizing its rational Bessel character. Quotient measures on group points are the separate AdelicAlgebraicGroups contract.

### From TauCetiRoadmap.RestrictedProducts

Completed Layers 0–3 supply compact-open reference families, coordinate maps, reference change, finite-place decomposition and eventually integral rational diagonals. Use these to assemble the adelic relative group and identify its local factors. They do not assert a Tamagawa product.

### From TauCetiRoadmap.ReductiveGroupsPartII

What ReductiveGroupsPartII must provide (`gap:hermitian-unitary`): Supply Hermitian forms on finite projective constant-rank modules over quadratic étale algebras, complements, Witt extension/cancellation, hyperbolic bases, and representable reductive U(h), with arbitrary-form, scalar-extension and local-inner-form comparisons. At fields of characteristic ≠2 include split étale coefficients, zero rank, both real signatures, and nonsplit local forms. Matrix.unitaryGroup represents only the identity Gram matrix; ClassicalGroups Layer 0 does not supply this generality. This is a requested upstream contract, not an asserted import. The section contract is requested extension of §RG2.4; primary section unavailable. Needed by §1.1, §1.3, §3.4.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

What SmoothRepresentationsOfLocalGroups must provide (`gap:local-categories`): Supply smooth admissible complex representation categories, smooth duals, tensor/induction/Jacquet adjunctions, Bernstein blocks, generic supercuspidal auxiliaries, mirabolic restriction and their exact characteristic-zero statements. Need unnormalized/normalized induction conversion by δ_P^(1/2), generic irreducibility choices avoiding finite Bernstein supports, GL genericity of tempered representations, spherical Satake and normalized test vectors, including dyadic fields and split products. No endpoint assumes π_V or π_W supercuspidal. The section contract is requested §SR.0–SR.5 contract; primary sections unavailable. Needed by §2.1, §2.3, §2.4, §2.5, §3.3, §3.10, §3.11, §5.2, §5.3.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

What AutomorphicFormsOnReductiveGroups must provide (`gap:archimedean-estimates`): Supply Casselman–Wallach globalization, nuclear completed projective tensors, smooth contragredients, generic induction irreducibility and uniform seminorm estimates for the stated real reductive groups. Need exact continuous bilinear/smooth-dual comparison, parameter families with a common half-plane on a finite-dimensional space of functionals, matrix-coefficient bounds and Cartan integration. This is not supplied by finite-dimensional ClassicalGroups branching or the LieGroups exponential map. The section contract is requested §AF.1 extension; primary section unavailable. Needed by §2.1, §2.2, §2.5, §2.7, §3.3.

What AutomorphicFormsOnReductiveGroups must provide (`gap:automorphic-realization`): Supply adelic Schwartz and cusp spaces, right regular actions, cuspidal rapid decay, continuous period estimates and restricted smooth tensor factorizations. Need all number fields and arbitrary unitary inner forms, pure-tensor density, Petersson positive pairings, local invariant unitary structures, and the general finite-rank/smoothing operator bridge. Uniform estimates along the relevant flag are applied in target 4.1, not assumed as its conclusion. The section contract is requested §§AF.0–AF.3; primary sections unavailable. Needed by §4.1, §4.2, §6.1.

### Unassigned general foundation

What the general distribution foundation must provide (`gap:distribution-gk`): Supply test/distribution spaces, equivariant semisimple descent, Fourier uncertainty/support theorems and the Gelfand–Kazhdan multiplicity criterion at all characteristic-zero local fields. This contract contains no unitary relative-distribution symmetry or GGP multiplicity conclusion. Those are targets 2.2–2.6. No verified earlier owner supplies the mixed nonarchimedean/archimedean general theorem; ownership is explicitly unassigned. The section contract is general local-distribution foundation required by target 2.2. Needed by §2.2, §2.3.

### From TauCetiRoadmap.AutomorphicSpectralTheory

What AutomorphicSpectralTheory must provide (`gap:local-harmonic-analysis`): Supply Harish–Chandra Schwartz and quasi-character spaces, regular nilpotent germs, Fourier orbital measures, semisimple descent, tempered Plancherel and the analytic regularized Fourier-integral extension theorem. Need the fixed/moving-space centralizer quotients and germ estimates for all nonsplit characteristic-zero local unitary forms, normalized parabolic induction, distribution characters and their independence. The relative form, relative torus integral and local trace formula remain targets 3.3–3.5. The section contract is requested local-analysis extension of §§AS.0–AS.2; primary sections unavailable. Needed by §2.7, §3.3, §3.4, §3.5.

What AutomorphicSpectralTheory must provide (`gap:automorphic-spectrum`): Supply actual cuspidal support decompositions, normalized Eisenstein/intertwiner families, Arthur truncation asymptotics and nuclear spectral-kernel pairings on the specified Schwartz spaces. Need canonical regularized Eisenstein Rankin–Selberg periods and Flicker–Rallis intertwining periods with convergence, parameter regularity and norm leading coefficients. No abstract complex of arbitrary distributions replaces actual automorphic kernels. The star-generic relative contribution is target 6.3. The section contract is requested §§AS.0–AS.4; primary sections unavailable. Needed by §6.1, §6.2, §6.3.

What AutomorphicSpectralTheory must provide (`gap:spectral-isolation`): Supply normalized Schwartz multipliers isolating a prescribed GL cuspidal datum and the unitary cuspidal base-change classes, preserving transfer and the exact local support conditions. The board design AutomorphicSpectralTheoryPartII owns this theory; it is not an eligible primary-section import here. This gap requests the contract from the earlier base owner and requires that continuation to be placed before this roadmap before it can discharge the gap. No duplicate multiplier, interpolation, counting or isolation targets occur here. The section contract is proposed Part II §§SM.0–SM.5; placement and primary import contract required. Needed by §6.4.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

What ModularityAndLanglandsExtensions must provide (`gap:enhanced-packets`): Supply the actual tempered enhanced LLC for all pure inner forms of characteristic-zero local unitary groups, its component groups, central restrictions and Whittaker normalization with every property used here proved. Need conjugate-dual signs (-1)^(m-1), multiplicities in z_φ, STAB/TRANS/WHITT, ordinary and twisted endoscopic character identities as in bp-refined §7.2, local factor compatibility, smooth duals, determinant twists, tempered induction, additive-character and scaling transport. Real enhancement labels must be compared with Xue §2.1 after choosing the complement reference. Do not assume GGP, a relative period identity or an arbitrary labeling of Langlands packets. The section contract is requested §ML.4 unitary classification contract; primary section unavailable. Needed by §3.1, §3.2, §3.6, §3.7, §3.8, §3.9, §3.10, §4.3.

What ModularityAndLanglandsExtensions must provide (`gap:global-parameters`): Supply actual Hermitian discrete Arthur parameters, constituent uniqueness, global packets and cuspidal multiplicity, strong base change and its comparison with split-almost-everywhere weak base change. Need the distinct constituent definition and Asai pole sign (-1)^(m+1), actual local compatibility at all places, the constituent sign group S_Π=(Z/2)^(r_n+r_(n+1)), and existence of the relevant actual base changes for everywhere-tempered cuspidal σ. This contract proves classification and does not assert nonzero relative periods or GGP.8. The section contract is requested §ML.4 global extension; primary section unavailable. Needed by §4.3, §4.4, §5.1, §6.4, §6.5, §7.1, §7.3, §7.4.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

What EndoscopicTransferAndUnitaryTraceComparison must provide (`gap:ordinary-endoscopy`): Supply ordinary and twisted unitary transfer factors, stable character identities and Whittaker-normalized transfer constants for the actual packets. Used to transfer the geometric multiplicity integral and derive the Fourier identity for Langlands packets. It must not import a GGP conclusion. Ordinary endoscopy is separate from the Jacquet–Rallis contract below. The section contract is requested ordinary-transfer sections; primary section unavailable. Needed by §3.6.

What EndoscopicTransferAndUnitaryTraceComparison must provide (`gap:relative-trace`): Supply the general geometric Jacquet–Rallis trace comparison, Schwartz extensions, smooth transfer at all finite places, dense archimedean transfer, fundamental lemmas, and all-place local relative-character comparison with product-one global constants. Need actual GL and unitary trace distributions, their cuspidal-support contributions, canonical quotient measures, all-inner-form matching tests and enough transfer to detect nonzero distributions, with all bad places in a finite exceptional set and no exclusion from the final formulas. For matching tests on actual tempered base changes require I_(Π_v)(f_v)=κ_v J_(σ_v)(f_(h,v)), κ_v≠0 and ∏κ_v=1 in bpcz §10.3.5’s conventions. The proposed Part II begins where ordinary endoscopy ends; it must not assume the global identity or nonvanishing theorem. The section contract is proposed Part II: relative comparison; no supplied section. Needed by §6.1, §6.2, §6.3, §6.4, §6.5.

### From TauCetiRoadmap.MetaplecticAutomorphicForms

What MetaplecticAutomorphicForms must provide (`gap:real-theta`): Supply the real oscillator representation, mixed Schwartz models and decay, nonzero small theta lifts and their enhanced-parameter and determinant-twist formulas in equal and adjacent ranks. Need the precise splitting characters and ψ(x)=exp(-2πix) convention used in Xue §3, with Hermitian/skew-Hermitian conversion V=-iV′. Integrated seesaw requires continuity and absolute convergence, not big-theta irreducibility. The Bessel-specific count-reducing seesaw is target 3.8. The section contract is requested real-local theta sections; primary section unavailable. Needed by §3.8.

### From TauCetiRoadmap.AdelicAlgebraicGroups

What AdelicAlgebraicGroups must provide (`gap:adelic-measures`): Supply adelic group points and rational quotients, compatible Haar disintegration, Tamagawa measures including global L convergence factors, and their local-volume products. For arbitrary number fields and all unitary inner forms supply the formulas of bpcz §2.3.2: dh=(Δ_H^*)⁻¹∏_v Δ_(H,v)|ω_H|_v, its partial measure factors and the product-formula independence. Need convergence/nonzero of the volume tail for any local factorization of this measure, unipotent rational quotient mass 1, and compatibility with diagonal inclusions; GlobalNumberFields and RestrictedProducts explicitly stop before these claims. The section contract is requested §§AA.2–AA.3; primary sections unavailable. Needed by §4.1, §5.4, §5.5, §6.1, §6.4, §7.3, §7.4.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

What AutomorphicLFunctionsAndLocalFactors must provide (`gap:l-factors`): Supply local/global completed factors with induction, dual, tensor and change-of-character identities, general Rankin–Selberg and mirabolic distinction theory, and the stated regularity/nonvanishing theorems. Need ε(1/2,conjugate-orthogonal,ψ_E)=1, epsilon lift-independence identities, all local tempered C_v regular nonzero, global central regularity and opposite-parity adjoint/Asai value at 1 finite nonzero for distinct Hermitian constituents, Whittaker norm leading coefficients, and nonzero normalized RS test vectors. Include archimedean gamma factors, p=2 and split E. The doubling extension of this owner is not presumed to provide missing signed-Asai or generic norm inputs. Use geometric Frobenius with norm q⁻¹ as in ggp §3, line 272–276, and invert any arithmetic-Frobenius input. The section contract is requested §§AL.1, AL.3–AL.5 and signed-Asai extension; primary sections unavailable. Needed by §3.1, §3.2, §3.11, §4.3, §4.4, §5.1, §5.3, §6.1, §6.5, §7.2.

## How to read the build

Layer 1 fixes algebraic relative data and transport. Layer 2 builds the actual local Hom space, proves distribution symmetry and multiplicity one, and establishes adjacent tempered integrability before it is used in Layer 3. Layer 3 constructs the epsilon character, regularized forms and geometric multiplicity, then proves the nonsplit tempered theorem for Langlands packets and separates the certified split range from its remaining prediction. Layer 4 defines global periods and the general fixed-pair conjecture. Layer 5 supplies all local normalizers, scaling laws and the all-place product. Layer 6 computes the relative spectral contribution and assembles it through the specified comparison contracts. Layer 7 states and proves the two adjacent global endpoints, with GGP.8 as the precise period/L-value export. Source identifiers and line locators refer to the versions in the manifest. A proof uses only its listed targets, pinned declarations or recorded supplier gaps.

## Layer 1: Relative Hermitian geometry and Bessel data

### 1.1 `RelevantHermitianPair`

For the algebraic hypotheses below, define `RelevantHermitianPair`(W,V,r,L) to mean an isometric inclusion i:W→V together with the property that i(W)⊥ is isometric to H^r orthogonal-sum L, where H has Gram matrix [[0,1],[1,0]] and L=<a> with a∈F×. A framed pair additionally chooses such an isometry, a hyperbolic basis and a nonzero vector of L; relevance itself forgets the frame. (ggp, §2, pp. 5–7; ggp line 229; line 255).

The hypotheses are F is a field of characteristic different from 2; E is a quadratic étale F-algebra with its nontrivial involution c; All Hermitian E-modules are finite free of constant rank and their forms are nondegenerate; n=rank_E W, r≥0 and L is a nondegenerate rank-one space.

The proof uses the following chain. Use the upstream orthogonal-complement decomposition and Witt extension theorem to relate the embedding, complement and frame descriptions. Extend scalars on the actual forms, rather than on a chosen signature.

The public interface includes:

- `RelevantHermitianPair.mk`: A complement isometry constructs relevance; a framed witness maps to the unframed predicate.

- `RelevantHermitianPair.rank`: rank_E V=rank_E W+2r+1.

- `RelevantHermitianPair.isometryCongr`: Isometries intertwining i preserve relevance and compose, with identity transport the identity.

- `RelevantHermitianPair.baseChange`: Scalar extension of fields, including splitting E, preserves the embedding and the displayed complement.

- `RelevantHermitianPair.frame_ext`: Two framed witnesses with the same embedding, complement isometry and chosen basis vectors are equal; relevance itself is a proposition and does not retain those choices.

*Needs:* Mathlib `LinearMap.Nondegenerate`; contract gap `hermitian-unitary`.

**Checks.**

- `relevant_zero_line` (degenerate): W=0,V=<1>,r=0 is relevant; a definition requiring positive rank W fails.

- `relevant_hyperbolic_plane` (computation): For W=0,V=H orthogonal-sum <1>,r=1 the rank is 3 and the maximal isotropic subspace has rank 1; a codimension-r convention fails.

- `relevant_real_line_sign` (non-example): A positive definite real Hermitian 3-space has no complement H orthogonal-sum L for W=0,r=1; both indefinite signatures (2,1) and (1,2) do.

This interface is used by all Bessel constructions and pure-inner-form indexing.

### 1.2 `besselDatum`

For a framed relevant pair construct the flag parabolic P stabilizing 0<X₁<⋯<X_r, its unipotent radical N, H=N⋊U(W), and the closed embedding (u,g)↦(u·i(g),g) into U(V)×U(W). For r>0 put b(u)=Σ_(j=1..r-1) h(u v_(j+1),v_j*)+h(u e,v_r*). Prove b:N→Res_(E/F) Ga is additive and U(W)-invariant. For a continuous additive ψ of E nontrivial on every field factor put ν(u,g)=ψ(b(u)); for r=0 use N=1,b=0,ν=1. (ggp, §12, pp. 44–46; ggp line 1593; line 1603; line 1624; line 1634).

The hypotheses are F is a field of characteristic different from 2; E is a quadratic étale F-algebra with its nontrivial involution c; All Hermitian E-modules are finite free of constant rank and their forms are nondegenerate; A frame as in 1.1 is fixed; the character clause assumes F local and ψ nontrivial.

The proof uses the following chain. Apply the algebraic parabolic and unipotent-radical contracts to the flag, then check the simple coordinates of a product. Their abelianization kills all cross terms. U(W) fixes the line and the flag, hence b. Representability and closedness use ReductiveGroups, not a set-theoretic subgroup argument.

The public interface includes:

- `besselDatum_embed`: The embedding has first coordinate u·i(g) and second coordinate g, and is injective.

- `besselLinearForm_mul`: b(u u′)=b(u)+b(u′); b(gug⁻¹)=b(u).

- `besselCharacter_mul`: ν is a unitary character extending ψ∘b and trivial on U(W).

- `besselDatum_r_zero`: In codimension one H is the diagonal U(W) and ν=1.

- `besselCharacter_eq_of_coordinates`: Characters with the stated values on N and U(W) agree.

*Needs:* this roadmap §1.1; ReductiveGroups §Layer 0; ReductiveGroups §Layer 3; ReductiveGroups §Layer 5; ReductiveGroups §Layer 8; Tau Ceti `TauCeti.HopfAlgebra.pointsFunctor`.

**Checks.**

- `bessel_empty_flag` (degenerate): r=0 gives the diagonal subgroup, not the whole U(V)×U(W).

- `bessel_two_root_coordinates` (computation): For r=2 a unipotent with simple coordinates (x,z) has b=x+z; the character of a product with coordinates (x′,z′) is ψ(x+z+x′+z′). Omitting either coordinate fails.

- `bessel_split_rank_three` (compatibility): For E=F×F,W=0,r=1, H is the maximal upper unipotent of GL₃ under the split identification, with two simple-root contributions encoded by b∈E. Taking only Tr(b) with an arbitrary fixed character loses the independent generic coordinates.

This interface is used by local models, global rational characters, relative trace distributions.

### 1.3 `besselTransport`

An isometry of framed pairs induces an isomorphism of the embedded (H,ν) data. Changing flag, hyperbolic frame, line generator or generic additive data on a fixed pair gives a conjugate embedded model, with the induced intertwining maps on Hom spaces. Simultaneous scaling h_V,h_W by a∈F× preserves the underlying unitary groups and transports the relative data; over R, a=-1 exchanges the two line signs. The transports respect identity and composition. (ggp, §12, p. 46; §18, pp. 71–72; ggp line 1637; line 2503).

The hypotheses are F is a field of characteristic different from 2; E is a quadratic étale F-algebra with its nontrivial involution c; All Hermitian E-modules are finite free of constant rank and their forms are nondegenerate; The two frames lie on isometric relevant pairs; local characters are nondegenerate on the indicated additive coordinates.

The proof uses the following chain. Use Witt extension to conjugate flags and the diagonal Levi to scale simple coordinates. Pull back characters and representation actions along this explicit conjugacy. Scaling the form cancels in its preservation equation.

The public interface includes:

- `besselTransport_refl`: Identity data induce identity group and model maps.

- `besselTransport_trans`: Transport along a composite equals composite transport.

- `besselTransport_character`: ν′∘transport=ν when characters are transported with the frame.

- `besselTransport_neg_real`: U(p,q)=U(q,p) as the matrix groups for a form and its negative; the complement line changes sign.

*Needs:* this roadmap §1.2; contract gap `hermitian-unitary`.

**Checks.**

- `bessel_transport_identity` (degenerate): An unchanged frame acts identically, not by taking duals.

- `bessel_neg_two_forms` (computation): diag(1,-1) and diag(-1,1) have the same stabilizer equations; their distinguished final lines have opposite signs.

- `bessel_wrong_character` (non-example): Keeping a changed additive character while freezing its coordinates does not give equality of characters; the assertion supplies a conjugacy, not literal equality.

This interface is used by normalisation independence in the local theorem and both real line signs.

### Examples

The zero smaller space, the split algebra F×F, and the real complements of signatures (r+1,r) and (r,r+1) exercise the same constructions. Rank zero is allowed algebraically; it is not added to a theorem whose source assumes n≥1.

### Dependencies

Mathlib `LinearMap.Nondegenerate`; contract gap `hermitian-unitary`; ReductiveGroups §Layer 0; ReductiveGroups §Layer 3; ReductiveGroups §Layer 5; ReductiveGroups §Layer 8; Tau Ceti `TauCeti.HopfAlgebra.pointsFunctor`.

## Layer 2: Local Bessel models, multiplicity one and tempered integrability

### 2.1 `besselModel`

For local data of 1.2 define `besselModel`(π_V,π_W) as Hom_H(π_V|H tensor π_W|H,ν). At finite places this is the subspace of algebraic linear functionals satisfying ℓ(π_V(u i(g))v tensor π_W(g)w)=ν(u,g)ℓ(v tensor w). At infinity use continuous linear functionals on the completed projective tensor product. Define besselMultiplicity as its complex vector-space dimension, initially a cardinal; finite-dimensionality precedes its natural-number form. (ggp, §14, pp. 57–58; ggp line 2020; line 2051; line 2060; xue-real §2.2, p. 1000, line 196).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places.

The proof uses the following chain. Use the native intertwiner and tensor representation carriers; impose continuity as supplied by the analytic category. The completed tensor universal property gives the archimedean bilinear description. Schur theory is not used to assert multiplicity here.

The public interface includes:

- `besselModel_mk`: A linear functional satisfying the displayed equivariance, continuous at infinity, belongs to the model.

- `besselModel_ext`: Equality on pure tensors determines a model functional, using density at infinity.

- `besselModel_congr`: Intertwining isomorphisms and 1.3 transport induce linear equivalences of models.

- `besselModel_curry`: For r=0, currying identifies the model with intertwiners π_V→π_W^∨ in the supplied smooth dual category; at infinity require the corresponding continuous bilinear/smooth-dual adapter.

- `besselMultiplicity_eq_finrank`: Once finite-dimensional, the cardinal dimension is the cast of Module.finrank ℂ.

*Needs:* this roadmap §1.2; this roadmap §1.3; Mathlib `Representation.IntertwiningMap`; Mathlib `Representation.tprod`; contract gap `local-categories`; contract gap `archimedean-estimates`.

**Checks.**

- `bessel_model_trivial` (degenerate): For H=1 and both spaces ℂ, evaluation zw gives a one-dimensional model.

- `bessel_model_weights` (computation): On U(1), weights 1 and -1 pair to ℂ, while weights 1 and 1 have zero invariant bilinear forms; omitting the dual fails.

- `bessel_model_library` (compatibility): At a finite place the defining equations coincide with Representation.IntertwiningMap into the one-dimensional representation ν, not Hom into the trivial representation when ν≠1.

This interface is used by Every multiplicity statement; global local obstruction and period comparisons.

### 2.2 `adjacentInvariantDistribution_symmetry`

For an adjacent unitary pair U(W)⊂U(V) over a characteristic-zero local field with quadratic étale coefficients, construct an algebraic anti-involution ι of U(V) preserving U(W) such that every distribution on U(V) invariant under conjugation by U(W) is invariant under pullback by ι. For nonsplit coefficients an orthogonal basis gives ι(g)=c₀g⁻¹c₀, where c₀ is coefficient conjugation; in the split GL realization use the corresponding transpose anti-involution. Include the representation/contragredient identities needed by the Gelfand–Kazhdan criterion. (agrs, Theorem 2′, p. 3, agrs line 80–95; sun-zhu Theorem A, pp. 1–2, line 49–54).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; r=0; distributions are continuous duals of the supplied compactly supported locally constant or smooth test spaces, with generalized functions at infinity.

The proof uses the following chain. Linearize equivariant distributions near semisimple strata. Decompose the centralizer action into lower-rank classical models, then use Fourier support and the nilpotent descent argument to kill anti-invariant distributions. The distribution-gk contract supplies only the general descent, Fourier uncertainty and criterion; the relative symmetry itself is this target.

The public interface includes:

- `adjacentAntiInvolution_square`: ι(ι(g))=g and ι(gg′)=ι(g′)ι(g).

- `adjacentAntiInvolution_subgroup`: ι preserves the embedded smaller unitary group.

*Needs:* this roadmap §1.3; contract gap `distribution-gk`; contract gap `archimedean-estimates`.

**Checks.**

- `distribution_rank_one` (degenerate): In rank 1, coefficient conjugation sends a norm-one z to z⁻¹, hence c₀g⁻¹c₀=g; inversion alone would be wrong.

- `distribution_transpose_two_terms` (computation): On split GL₂, ι([[1,x],[0,1]])=[[1,0],[x,1]]; the order of a product is reversed.

- `distribution_identity_map` (non-example): The identity is not an anti-automorphism of a noncommutative rank-2 group.

This interface is used by the adjacent multiplicity bound.

### 2.3 `besselMultiplicity_adjacent_le_one`

For local data under the hypotheses below, with r=0, `besselModel` is finite-dimensional and its finrank is at most 1, for split and nonsplit E and all inner forms. (agrs, Theorem 1′, p. 2, agrs line 59; sun-zhu Theorem B, p. 2, line 66; ggp Theorem 14.1(ii), p. 58, line 2071).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; r=0.

The proof uses the following chain. Apply the symmetry theorem 2.2 and its contragredient identities to the supplier’s general Gelfand–Kazhdan criterion, then use the tensor/smooth-dual adapter of 2.1. This proves finite-dimensionality and the bound without a temperedness assumption.

*Needs:* this roadmap §2.1; contract gap `distribution-gk`; contract gap `local-categories`; this roadmap §2.2.

**Checks.**

- `adjacent_rank_zero` (degenerate): U(0)⊂U(1) gives finrank 1 for a character.

- `adjacent_dyadic` (compatibility): A ramified quadratic extension of Q₂ is within the finite-place statement.

- `adjacent_split_real` (compatibility): GL₂(R)↓GL₁(R) lies in the same theorem; compactness is not an assumption.

This interface is used by the reductions 2.4–2.6.

### 2.4 `besselHom_nonarchimedean_reduction`

Over a nonarchimedean characteristic-zero F, let W′=V orthogonal-sum (-L), with maximal isotropic Y of rank r+1 and Levi GL_E(Y)×U(W). For a supercuspidal τ of GL_E(Y), use unnormalized I(τ,π_W). If π_V^∨ belongs to none of the Bernstein components [GL_E(Y′)×U(V′),τ⊠μ] with rank Y′=r+1 and μ irreducible, there is a linear equivalence Hom_(U(V))(I(τ,π_W) tensor π_V,ℂ)≃`besselModel`(π_V,π_W). Moreover τ can be chosen with this exclusion and I irreducible. (ggp, Theorem 15.1 and Corollary 15.2, pp. 60–63; ggp line 2152; line 2158; line 2217; line 2233).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; F is nonarchimedean; r≥1.

The proof uses the following chain. Mackey restricts I to open and closed orbits. The Bernstein exclusion kills the closed orbit; the mirabolic restriction of τ, induction in stages and Frobenius reciprocity give the open-orbit model. The generic choices of supercuspidal twists avoid the finite supercuspidal supports and reducibility locus. These generic induction/Bernstein facts are explicitly included in local-categories.

The public interface includes:

- `besselReduction_openOrbit`: The open-orbit compact induction is induction from H of π_W tensor ν⁻¹.

- `besselReduction_naturality`: The Hom equivalence commutes with intertwiners of π_V and π_W.

*Needs:* this roadmap §2.1; contract gap `local-categories`.

**Checks.**

- `reduction_r_one` (computation): r=1 uses GL₂(E) auxiliary data and a rank-2 isotropic Y; GL₁ would have the wrong dimensions.

- `reduction_exclusion_required` (non-example): If the forbidden Bernstein component occurs, the closed-orbit quotient need not vanish; no unconditional Hom equivalence is asserted.

- `reduction_no_supercuspidal_endpoint` (compatibility): Only τ is chosen supercuspidal; π_V and π_W remain arbitrary irreducible admissible representations.

- `unnormalized_induction_witness` (computation): For GL₂ with upper B and diag(a,1), δ_B=|a|. Normalized induction inserts |a|^(1/2); target 2.4 uses unnormalized induction, so silently inserting this factor changes its stated representation.

This interface is used by nonarchimedean multiplicity one and split generic nonvanishing.

### 2.5 `besselHom_archimedean_injection`

For archimedean local data under the stated hypotheses and r≥1, given π_V,π_W and any finite-dimensional subspace S of `besselModel`(π_V,π_W), there are auxiliary generic GL_(r+1)(E) data and a complex induction parameter s such that the adjacent-pair induced representation is irreducible Casselman–Wallach and the Jiang–Sun–Zhu integral gives an injective linear map from S to its adjacent-pair invariant bilinear forms. The parameter is allowed to depend on S. (jsz-bessel, Theorem A and §3, Propositions 3.3–3.4; pp. 1–2, 6–8; jsz-bessel line 24; line 215; line 260–283).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; F is R or C; r≥1.

The proof uses the following chain. Use Propositions 3.3 and 3.4 on a finite basis of S to choose a common half-plane, then Proposition 3.1 to choose an irreducible inducing parameter. The integral is nonzero on every nonzero functional in S. Only finite-dimensional S is embedded; no uniform half-plane for the full Hom space is assumed.

The public interface includes:

- `besselArchIntegral_equivariant`: The integral defines an invariant continuous bilinear functional.

- `besselArchIntegral_injective`: For every finite-dimensional S there is a common right half-plane of convergence; a generic irreducible parameter there gives an injective map on S.

*Needs:* this roadmap §2.1; contract gap `local-categories`; contract gap `archimedean-estimates`.

**Checks.**

- `arch_rank_one_reduction` (computation): The first higher-codimension case r=1 uses an auxiliary GL₂ and an adjacent-rank pair.

- `arch_two_line_signs` (compatibility): Negating both forms transports the source convention q≥r+1 to the other line sign.

- `arch_not_arbitrary_s` (non-example): No injection at every complex s or at a pole of the inducing integral is claimed.

This interface is used by all archimedean odd-codimension multiplicity bounds.

### 2.6 `besselMultiplicity_le_one`

For every local pair and representation pair under the stated hypotheses, `besselModel` is finite-dimensional and besselMultiplicity≤1, without temperedness or supercuspidality assumptions on π_V,π_W. (ggp, Corollary 15.2, p. 63, ggp line 2229; jsz-bessel Theorem A, pp. 1–2, line 24).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places.

The proof uses the following chain. Use 2.3 directly for r=0. At finite places choose τ in 2.4 and apply 2.3 to I. At infinity apply 2.5 to any finite-dimensional subspace S of the model; 2.3 gives dim S≤1. A two-dimensional subspace would therefore be impossible, proving finite-dimensionality and the claimed bound.

*Needs:* this roadmap §2.3; this roadmap §2.4; this roadmap §2.5; this roadmap §1.3.

**Checks.**

- `multiplicity_whittaker` (degenerate): W=0 gives the generic Whittaker uniqueness bound.

- `multiplicity_both_signs` (compatibility): Both real complement signs satisfy the bound by 1.3.

- `multiplicity_not_existence` (non-example): The U(2) standard representation paired with U(1) weight 1 has multiplicity 0, so ≤1 cannot be replaced by =1.

This interface is used by local packets; period factorization; unitary Bessel descents.

### 2.7 `adjacentTemperedIntegral_converges`

For any characteristic-zero local F, quadratic étale E/F, nondegenerate adjacent pair W⊂V, unitary tempered irreducible π_V,π_W, and smooth vectors v,w in their tensor representation σ, the integral I(v,w)=∫_(U(W)(F)) <σ(t)v,w> dt converges absolutely. Prove the stronger basic estimate ∫_(U(W)(F)) Ξ_(U(V))(t) Ξ_(U(W))(t)(1+lognorm(t))^d dt<∞ for every fixed d≥0 with compatible special maximal compact subgroups and the source proper log-norm. (harris, Proposition 2.1 and proof, pp. 5–8; harris line 230–250; bpcz §1.1.6, p. 4, line 166).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; r=0; both representations are unitary tempered; inner products are positive definite invariant and linear in the first argument.

The proof uses the following chain. Apply matrix-coefficient bounds by Ξ times powers of the proper logarithmic norm. In relative Cartan coordinates the adjacent root exponents are strictly negative at infinity after the Haar Jacobian, so polynomial log factors remain integrable. Split, real and nonarchimedean root calculations belong to this theorem; the individual group bounds and integration formula are upstream.

*Needs:* this roadmap §1.2; contract gap `archimedean-estimates`; contract gap `local-harmonic-analysis`.

**Checks.**

- `integral_compact_rank_one` (computation): For W of rank 1 over C/R and inverse weights, I(1,1)=vol(U(1)).

- `integral_split_noncompact` (compatibility): GL_n(F) inside GL_(n+1)(F) requires the decay of both factors; neither Haar finiteness nor compactness is used.

- `integral_non_tempered_control` (non-example): For split GL₂×GL₁ with both representations trivial, I(1,1)=∫_(F×)1 dt diverges; temperedness cannot be dropped.

This interface is used by Normalized local forms, local relative characters and the unitary portion of the microlocal G8 obligation.

### Examples

For compact U(2)↓U(1), the standard representation restricts with weights 1 and 0. Pairing it bilinearly with weight -1 or 0 gives dimension 1; pairing with weight 1 gives 0. The rank-one group over the zero smaller space gives dimension 1 for every one-dimensional representation.

### Dependencies

this roadmap §1.2; this roadmap §1.3; Mathlib `Representation.IntertwiningMap`; Mathlib `Representation.tprod`; contract gap `local-categories`; contract gap `archimedean-estimates`; contract gap `distribution-gk`; contract gap `local-harmonic-analysis`.

## Layer 3: Root-number characters and the tempered local theorem

### 3.1 `ggpEpsilonCharacter`

For the stated tempered parameter data construct χ=(χ_W,χ_V):A_(φ_V)×A_(φ_W)→{±1}. If s is represented by an involution in the parameter centralizer, set χ_W(s)=ε(1/2,φ_V^(s=-1) tensor φ_W,ψ_E), and interchange V,W for χ_V. Prove independence of lift and conjugate-dual form and the character law. On the generator for a distinct appropriate-sign irreducible ρ this is ε(1/2,ρ tensor φ_W,ψ_E), with one copy of ρ, not its full multiplicity. The central element z_φ is the image of -Id and includes the multiplicities modulo two. (ggp, Theorem 6.1, pp. 20–21, ggp line 728; Hermitian clause of §17, p. 69, line 2425; bp-refined §8.1, pp. 64–65, line 2626).

The hypotheses are E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or C/R; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); The actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; Pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L.

The proof uses the following chain. Decompose the centralizer into orthogonal, symplectic and general linear factors. Multiplicativity of epsilon factors and the conjugate-orthogonal sign identity kill changes inside the identity component and changes of involution lift. The remaining orthogonal component coordinates give the asserted character.

The public interface includes:

- `ggpEpsilonCharacter_generator`: The two sets of generator values are the epsilon factors just displayed.

- `ggpEpsilonCharacter_mul`: χ(s+s′)=χ(s)χ(s′) in additive component notation.

- `ggpEpsilonCharacter_ext`: Equality of all appropriate-sign generator values implies equality of characters.

- `ggpEpsilonCharacter_central`: χ_W(z_(φ_V))=χ_V(z_(φ_W))=ε(1/2,φ_V tensor φ_W,ψ_E).

*Needs:* contract gap `enhanced-packets`; contract gap `l-factors`.

**Checks.**

- `epsilon_empty_parameter` (degenerate): φ_W=0 gives χ_W=1; tensoring with the zero parameter has epsilon 1.

- `epsilon_two_generators` (computation): A character with generator values -1 and +1 has value -1 on their sum and +1 on twice either generator.

- `epsilon_multiplicity_two` (non-example): An appropriate-sign summand of multiplicity 2 still contributes one generator; z_φ has zero coordinate there. Squaring the generator value in its definition loses possible sign -1.

This interface is used by the enhancement formula in §3.6 and normalisation transport in §3.2.

### 3.2 `ggpEnhancement_transport`

For the stated tempered parameter data, replace ψ_E by ψ_E(t·), t∈F×. On each component s of A_(φ_V) the distinguished character is multiplied by det(φ_V^(s=-1) tensor φ_W)(t), and likewise on W. Under the corresponding change of Whittaker datum the actual labeling of Langlands packets changes by exactly these characters; simultaneous scaling of the two Hermitian forms and transport of their Whittaker data gives the same represented Bessel pair under 1.3. (ggp, Theorem 6.1(3), p. 20, line 732; §18, pp. 71–72, ggp line 2503–2519).

The hypotheses are E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or C/R; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); The actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; Pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L.

The proof uses the following chain. Apply the epsilon change-of-additive-character formula at s=1/2 and the supplier’s Whittaker-change theorem, then use 1.3. This is an assertion about that correspondence, not about an arbitrary bijection of finite sets.

*Needs:* this roadmap §1.3; this roadmap §3.1; contract gap `enhanced-packets`; contract gap `l-factors`.

**Checks.**

- `transport_two_dimensional_sign` (computation): For dim φ_V=2, dim φ_W=1 and an appropriate one-dimensional summand on V, t in the nonnorm class changes its enhancement sign by -1; the W label is unchanged.

- `transport_norm_class` (compatibility): For t a norm from E×, the label change is trivial.

- `transport_real_negative` (compatibility): For C/R, t=-1 realizes the nonnorm change. The model transport and the relabeling must be applied together.

This interface is used by Choice-independent local theorem, real line-sign conversion.

### 3.3 `temperedBesselForm`

For any relevant nonsplit characteristic-zero local pair and a finite-length unitarizable tempered representation π of U(V)×U(W), construct the continuous relative sesquilinear form L_π(v,w) by the regularized H-integral of the matrix coefficient times ν⁻¹ in the linear-first convention. For r=0 it is the ordinary absolutely convergent integral. For arbitrary r it is the stable/continuous extension of the Fourier-cutoff integrals of bp-arch §7.1, not an unqualified Haar integral. Prove L_π≠0 iff Hom_H(π,ν)≠0; normalized tempered induction from a Levi preserves this nonvanishing after deleting its GL factors. (bp-arch, §§7.1–7.4; Theorem 7.2.1, p. 181, bp-arch line 6804; Proposition 7.4.1, p. 192, line 7140; xue-real Propositions 2.3–2.4, p. 1001, line 238).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; π is finite-length unitarizable tempered; the last assertion uses actual normalized induction and the residual GGP Levi pair; E/F is a quadratic field extension; the split model is handled separately.

The proof uses the following chain. Build the regularized integral using the Fourier extension and polynomial bounds, identify its image in the distributional model, then unfold normalized induction and use the supplied Plancherel theorem to prove the converse. The induction statement is for the entire induced representation, not every constituent individually.

The public interface includes:

- `temperedBesselForm_equivariant`: L_π(π(h)v,w)=ν(h)L_π(v,w), with the conjugate law in w.

- `temperedBesselForm_congr`: Intertwining unitary equivalences and isometries transport the form with the supplied measures.

- `temperedBesselForm_rank`: For irreducible π the associated map to the distribution dual has rank at most 1 and is nonzero exactly when m(π)=1.

- `temperedBesselForm_adjacent`: For r=0, L_π(v,w)=∫_(U(W)) <π(t)v,w> dt in the source linear-first pairing.

*Needs:* this roadmap §2.6; contract gap `local-categories`; contract gap `archimedean-estimates`; contract gap `local-harmonic-analysis`; this roadmap §2.7.

**Checks.**

- `tempered_form_trivial_H` (degenerate): For H=1 of Haar mass a>0, L(v,w)=a<v,w>; forgetting the measure fails.

- `tempered_form_compact_character` (computation): For U(1) of mass 1 and two characters with sum weight k, L(1,1)=1 when k=0 and 0 when k≠0.

- `tempered_form_not_raw_higher_integral` (non-example): For r>0 the definition requires regularization; it does not assert absolute convergence of the full H-integral.

This interface is used by Higher-codimension real reduction, local trace formula and microlocal unitary relative forms.

### 3.4 `besselGeometricMultiplicity`

For a relevant nonsplit local pair define Γ(G,H) to be the semisimple U(W)-conjugacy classes x for which U(im(x-1))_x is an anisotropic torus. Write W=ker(x-1) orthogonal-sum im(x-1). Give Γ the torus quotient measure with each anisotropic torus of mass 1 and rational Weyl-group divisor. Set D_G(x)=|det(1-Ad(x) on g/g_x)|, D_H analogously and Δ=D_G D_H⁻². For a Harish–Chandra quasi-character θ, let c_θ(x) be the average regular-nilpotent germ coefficient, normalized by the supplied Fourier orbital measures. Define m_geom(θ)=lim_(s→0+) ∫_Γ D_G(x)^(1/2)c_θ(x)Δ(x)^(s-1/2) dx. Prove convergence for Re(s)>0, existence of the limit, continuity, semisimple descent, and compatibility with normalized parabolic induction. (bp-arch, §§11.1–11.3; Proposition 11.2.1, pp. 265–266, bp-arch line 10202; line 10248; Lemma 11.3.1, p. 272, line 10525).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; θ is a quasi-character in the supplied Harish–Chandra space; all discriminants are on the indicated centralizer quotients; E/F is a quadratic field extension; the split model is handled separately.

The proof uses the following chain. Stratify by the fixed and moving Hermitian spaces. The germ estimates and determinant power integrability establish absolute convergence; semisimple descent reduces the limit to smaller dimension, with Lie-algebra Fourier descent at identity. General germ/Fourier theory is the local-harmonic-analysis gap.

The public interface includes:

- `besselGeometricMultiplicity_linear`: m_geom is a continuous complex-linear functional on quasi-characters.

- `besselGeometricMultiplicity_delta`: Δ(x)=|N_(E/F)det(1-x on im(x-1))|; the determinant of a zero-dimensional quotient is 1.

- `besselGeometricMultiplicity_descent`: Descent near a semisimple x carries the torus measure and discriminant Jacobian to those of its residual GGP triple.

- `besselGeometricMultiplicity_induction`: For a Levi L=L_GL×G̃, m_geom(i_L^G(θ_GL tensor θ̃))=c_(θ_GL)(1)m_geom(θ̃).

*Needs:* this roadmap §1.2; contract gap `local-harmonic-analysis`; contract gap `hermitian-unitary`.

**Checks.**

- `geometric_identity_discriminant` (degenerate): At x=1 the zero moving-space determinant is 1, not det(1-x on all W)=0.

- `geometric_delta_minus_one` (computation): For W=C of rank 1 and x=-1, |N_(C/R)(1-x)|=4. Reversing the determinant ratio gives 1/4.

- `geometric_zero_quasicharacter` (compatibility): m_geom(0)=0; torus masses alone cannot be the integrand.

This interface is used by Geometric multiplicity and stable cancellation across Langlands packets.

### 3.5 `besselLocalTraceFormula`

For every relevant nonsplit local pair, the relative trace distribution J(f)=∫_(H(F)\G(F)) K_f(x,x)dx, with K_f(x,y)=∫_H^* f(x⁻¹hy)ν(h)⁻¹dh, on strongly cuspidal Harish–Chandra Schwartz functions has geometric expansion J(f)=m_geom(θ_f), and its spectral expansion in tempered characters has coefficient besselMultiplicity. Consequently m(π)=m_geom(θ_π) for every irreducible tempered π. Include the Lie-algebra identity J_Lie(f)=m_geom,Lie(θ_f) for strongly cuspidal Lie Schwartz f. (bp-arch, Theorems 11.4.1–11.4.3, p. 273, bp-arch line 10542; bp-unitary-tempered Theorem 17.1.1, p. 100, line 5003).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; π_V and π_W are tempered; f is strongly cuspidal in the stated Schwartz space; E/F is a quadratic field extension; the split model is handled separately.

The proof uses the following chain. Define J by integrating the relative Schwartz kernel on H\G with the source truncation. Use the supplied Plancherel expansion and 3.3 for its spectral expression. Semisimple descent, Lie Fourier inversion and induction on dim G give the geometric expression. Compare coefficients using elliptic tempered character independence, treating proper-Levi inductions with 3.4. Generic analytic facts end at local-harmonic-analysis; the relative trace and its equality are owned here.

*Needs:* this roadmap §3.3; this roadmap §3.4; contract gap `local-harmonic-analysis`.

**Checks.**

- `local_trace_rank_zero` (degenerate): W=0 leaves the regular Whittaker germ contribution; no torus of positive dimension is forced.

- `local_trace_noncompact` (compatibility): Real indefinite groups require the regularized trace and Schwartz estimates, not compact-group traces.

- `local_trace_induction` (compatibility): Normalized induction matches the factor c_(θ_GL)(1) of 3.4.

This interface is used by uniqueness within Langlands packets and the nonarchimedean epsilon criterion.

### 3.6 `besselPacketFourierIdentity`

For the stated nonarchimedean tempered parameter data, let G₀ be the even-dimensional member and G₁ the odd-dimensional member of the relevant pair. Let μ∈{±1} be the pure-inner-form invariant in the compatible quasi-split reference, ε=ε(1/2,φ₀ tensor φ₁,ψ_E). For s∈A_(φ₀),t∈A_(φ₁), prove Σ_(η₀,η₁ in the actual packets on this pair) η₀(s)η₁(t)m(π_(η₀),π_(η₁))=χ₁(s)χ₀(t)(1+με)/2. The labeling and μ are those transported from the classification, including its central restrictions. (bp-refined, §8.6, equation (1), pp. 71–72; bp-refined line 2880–2908).

The hypotheses are E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or C/R; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); The actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; Pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L; F is nonarchimedean; μ refers to the fixed relevant pair, not an independently chosen sign.

The proof uses the following chain. Transfer the quasi-character multiplicity integral under endoscopy using the supplier’s stable/twisted character identities. Separate the ± eigensummands; use the epsilon comparison and Whittaker normalization to compute the transfer constants. This produces the Fourier formula. Finite character inversion then recovers multiplicities; the supplier contract does not assume this formula.

*Needs:* this roadmap §3.1; this roadmap §3.5; contract gap `enhanced-packets`; contract gap `ordinary-endoscopy`.

**Checks.**

- `packet_wrong_inner_form` (computation): If μ=-ε the Fourier transform is identically zero.

- `packet_right_inner_form` (computation): If μ=ε its value at (0,0) is 1.

- `packet_fourier_order_two` (compatibility): On A=Z/2, the values (1,-1) recover the delta mass at the nontrivial enhancement, not the trivial one.

This interface is used by nonarchimedean refined local theorem.

### 3.7 `besselTemperedPacket_nonarchimedean`

For the stated nonarchimedean tempered parameter data the union of Cartesian products of the actual Langlands packets over all pure inner forms with the fixed complement contains exactly one isomorphism class with m=1. It is the pair whose enhancements are (χ_W,χ_V) of 3.1; all other pairs have m=0. The enhancements restricted to z_(φ_V),z_(φ_W) equal the classification invariants of precisely the relevant inner forms. (bp-refined, Theorem 8.5.1, pp. 70–71, bp-refined line 2855–2879; bp-arch Theorem 12.4.1, p. 290, line 11200).

The hypotheses are E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or C/R; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); The actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; Pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L; F is nonarchimedean.

The proof uses the following chain. Apply Fourier inversion to 3.6. Central character restrictions identify which pair carries the resulting enhancement. In rank zero use the supplier’s Whittaker normalization rather than inventing a second inner form of the zero space. Properties of Langlands packets assumed in the older papers are theorems required in enhanced-packets.

*Needs:* this roadmap §2.6; this roadmap §3.6; contract gap `enhanced-packets`.

**Checks.**

- `padic_packet_W_zero` (degenerate): For W=0 the one relevant odd space is fixed by the complement; its distinguished member is the normalized generic one.

- `padic_packet_dyadic` (compatibility): The theorem includes ramified extensions of Q₂ and Q₃.

- `padic_packet_enhancement` (non-example): A different enhancement of the same L-parameter has m=0.

This interface is used by local obstruction in global period identities; explicit selection within Langlands packets.

### 3.8 `besselRealThetaReduction`

For adjacent C/R pairs with the source-compatible line sign, let a,b count with multiplicity the appropriate-sign conjugate-self-dual characters in φ_V,φ_W. Then a+b is odd. If a+b>1, the tempered intertwining and two-step theta seesaw construction gives a lower pair for which a+b decreases by 2, preserves the equivalence m=1, and preserves the assertion that both enhancements equal 3.1. If a+b=1 the component characters are trivial and m=1. The reduction uses actual nonzero small theta lifts and integrated pairings; it does not require the big theta lift to be irreducible. (xue-real, §2.4 and §§3–4, pp. 1002–1029; xue-real line 267–307; §3.1, line 329–341).

The hypotheses are E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or C/R; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); The actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; Pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L; E/F=C/R; r=0; the fixed line sign is the one in Xue §2.2.

The proof uses the following chain. Use the supplier’s mixed oscillator model, small theta parameter formula and decay estimates. Construct the two nonzero consecutive theta lifts after determinant twists. Absolute convergence permits the integrated seesaw identity; compare the epsilon labels under the parameter formulas. If b≥2, first add a non-self-dual character by tempered induction, then apply the other case. The induction decreases the self-dual count, not dimension alone.

*Needs:* this roadmap §3.1; this roadmap §3.3; contract gap `real-theta`; contract gap `enhanced-packets`.

**Checks.**

- `real_theta_base` (degenerate): a+b=1 is the base case, even when extra non-self-dual paired summands make the ranks larger.

- `real_theta_two_step` (computation): From (a,b)=(2,1) a double theta step changes the count to (0,1), dropping the odd induction measure by 2.

- `real_theta_big_lift` (non-example): No replacement of the integrated seesaw by an assumed irreducibility of the big theta lift is permitted; the source explicitly avoids that premise.

This interface is used by the real enhancement theorem without extrapolating nonarchimedean calculations.

### 3.9 `besselTemperedPacket_real`

For the stated tempered parameter data with E/F=C/R, for every relevant odd codimension and both line signs, m(π_V,π_W)=1 iff their actual enhancements equal (χ_W,χ_V). Over all relevant pure inner forms there is exactly one such pair and every other pair has multiplicity 0. Central restrictions and Whittaker normalization are part of this statement. (xue-real, Theorem 2.2, p. 1000, xue-real line 213; Propositions 2.3–2.4 and Corollary 2.5, p. 1001, line 238–266; line-sign conversion, p. 999, line 179).

The hypotheses are E/F is a quadratic field extension of nonarchimedean characteristic-zero local fields, or C/R; dim V=n+2r+1 and dim W=n, n,r≥0; φ_V and φ_W are tempered parameters of signs (-1)^(dim V-1) and (-1)^(dim W-1); The actual enhanced correspondence uses the compatible Whittaker datum and a nontrivial additive ψ_E trivial on F; Pure inner forms are indexed by Hermitian spaces and restricted to the fixed complement H^r orthogonal-sum L; E/F=C/R.

The proof uses the following chain. For r=0 apply induction using 3.8. For r>0 use 3.3 with an auxiliary tempered GL_(r+1)(C) principal series induced from non-conjugate-self-dual characters, so its paired added summands do not change the component group. This is Xue’s higher-codimension reduction. Apply 1.3 and 3.2 to reverse line signs. Uniqueness across the actual Langlands packets also follows by the stable character cancellation of 3.5 and the supplier’s STAB/TRANS/WHITT properties.

*Needs:* this roadmap §2.6; this roadmap §3.2; this roadmap §3.3; this roadmap §3.8; this roadmap §1.3; contract gap `enhanced-packets`.

**Checks.**

- `real_compact_interlacing` (computation): For U(2) highest weight (1,0), U(1) weight -1 has dual weight 1 and interlaces; weight 1 has dual -1 and fails interlacing.

- `real_line_negative` (compatibility): Simultaneous negation of a compact pair gives the same restriction multiplicity for the opposite line sign, with its transported labels.

- `real_all_ranks` (degenerate): For W=0,r=0 every U(1) character has a one-dimensional model; the actual enhancement under the Langlands correspondence equals the trivial distinguished character in this dimension.

This interface is used by Tempered local GGP across all nonsplit characteristic-zero places.

### 3.10 `splitTemperedBesselPrediction`

For E=F×F, n,r≥0 and irreducible tempered representations of GL_(n+2r+1)(F) and GL_n(F), define `splitTemperedBesselPrediction` to be the proposition m=1 for the split model of 1.2. The corresponding GL Langlands packets are singletons. Keep this proposition distinct from a proof in the ranges of 3.11. (ggp, Conjecture 17.1 and discussion before Theorem 17.2, p. 68; ggp line 2386–2400).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; E=F×F; both representations are tempered.

The proof uses the following chain. Specialize the relevant prediction for singleton Langlands packets to the split algebra and use the supplier’s genericity of tempered GL representations only in the ranges proved next.

The public interface includes:

- `splitTemperedBesselPrediction_unfold`: The proposition unfolds to finite-dimensionality and finrank 1 for the constructed split model.

- `splitTemperedBesselPrediction_congr`: Isomorphic representations and conjugate frames give equivalent propositions.

- `splitTemperedBesselPrediction_packet`: There is no component-character choice because the GL Langlands packets are singletons.

*Needs:* this roadmap §2.1; contract gap `local-categories`; contract gap `enhanced-packets`.

**Checks.**

- `split_prediction_rank_zero` (degenerate): GL₁(F)×GL₀(F) reduces the proposition to dim Hom_1(ℂ,ℂ)=1.

- `split_prediction_adjacent` (compatibility): For GL₂×GL₁, 3.11 proves the proposition.

- `split_prediction_status` (non-example): For archimedean r>0 this definition is a proposition without an exported proof; theorem 17.2(i) cannot supply it.

This interface is used by Honest split-local contract for all odd codimensions.

### 3.11 `besselSplitGeneric_nonvanishing`

For E=F×F and irreducible generic representations of GL_(n+2r+1)(F) and GL_n(F), m=1 if F is nonarchimedean, or if r=0 and F is archimedean. In these ranges this proves `splitTemperedBesselPrediction` for tempered representations. (ggp, Theorem 17.2, p. 68; ggp line 2394–2405).

The hypotheses are F is a local field of characteristic zero; E/F is quadratic étale; W embeds isometrically in V, with V/W isometric to H^r orthogonal-sum L for r≥0 and a nondegenerate line L; The representations are irreducible smooth admissible complex representations at finite places and irreducible Casselman–Wallach representations at infinite places; E=F×F; the two representations are generic; F is nonarchimedean or r=0.

The proof uses the following chain. The local Rankin–Selberg integral supplies a nonzero adjacent functional; normalized local theory removes possible poles. Over finite places use the supercuspidal reduction 2.4 to reach all odd codimensions. Combine nonzero with 2.5.

*Needs:* this roadmap §2.6; this roadmap §2.4; this roadmap §3.10; contract gap `l-factors`; contract gap `local-categories`.

**Checks.**

- `split_adjacent` (computation): GL₂(F)×GL₁(F) has a nonzero Rankin–Selberg functional at every characteristic-zero local F.

- `split_large_gap_finite` (compatibility): GL₄(F)×GL₁(F), r=1, is covered at a finite place.

- `split_large_gap_infinite` (non-example): GL₄(R)×GL₁(R), r=1, has no proof exported by this target; neither are nongeneric arbitrary parameters covered.

This interface is used by All-place adjacent period formula and the split specialization of local GGP.

### Examples

The empty W-parameter gives the trivial distinguished character on the V component group. In a product of two order-two component groups the values (-1,+1) multiply to -1 on their sum. Compact U(2)↓U(1) with highest weights (1,0) and -1 has multiplicity 1; replacing -1 by 1 gives 0.

### Dependencies

contract gap `enhanced-packets`; contract gap `l-factors`; this roadmap §1.3; this roadmap §2.6; contract gap `local-categories`; contract gap `archimedean-estimates`; contract gap `local-harmonic-analysis`; this roadmap §2.7; this roadmap §1.2; contract gap `hermitian-unitary`; contract gap `ordinary-endoscopy`; contract gap `real-theta`; this roadmap §2.1; this roadmap §2.4.

## Layer 4: Global Bessel periods and the fixed-pair conjecture

### 4.1 `globalBesselPeriod`

For the stated global data choose a nontrivial continuous additive character ψ:A_E/E→S¹ that is nondegenerate on each local simple coordinate and form ν=ψ∘b on H(A), extended trivially over U(W). Prove H is unimodular, ν|H(F)=1 and absolute convergence of P(f)=∫_(H(F)\H(A)) f(h)ν(h)⁻¹ dh for every cusp form f on U(V)×U(W). Construct P as a continuous linear functional on the supplied cuspidal smooth realization. Prove P(R(h)f)=ν(h)P(f) and compatibility with localization and 1.3. (ggp, §23, pp. 86–88; ggp line 3036; line 3077–3093; inverse-character translation of the source convention).

The hypotheses are E/F is a quadratic extension of number fields; W⊂V is a nondegenerate relevant Hermitian pair of ranks n and n+2r+1, n,r≥0; The global Bessel character is trivial on H(F); Cusp forms and right translations use the supplied automorphic realization and quotient measures.

The proof uses the following chain. Use the supplied adelic points and rational quotient construction. Rationality of b makes ν trivial on H(F); unitary determinant action gives unimodularity. Cuspidal rapid decay, the relative flag coordinates and unipotent compact quotient give convergence and continuity. Change variables y=xh to get the character direction.

The public interface includes:

- `globalBesselPeriod_add`: P is complex-linear and continuous in the cuspidal topology.

- `globalBesselPeriod_rightTranslate`: P(R(h)f)=ν(h)P(f) for h∈H(A).

- `globalBesselPeriod_r_zero`: For r=0, P(f_V tensor f_W)=∫_[U(W)] f_V(t)f_W(t)dt.

- `globalBesselPeriod_transport`: A rational pair isometry transports the rational quotient, Haar measure and period.

*Needs:* this roadmap §1.2; this roadmap §1.3; GlobalNumberFields §Layers 4–6; GlobalNumberFields §Layer 8; RestrictedProducts §Layers 0–3; contract gap `adelic-measures`; contract gap `automorphic-realization`.

**Checks.**

- `period_inverse_character` (computation): If ν(h)=i, right translation multiplies P by i, whereas the integral weighted by ν would multiply by -i.

- `period_adjacent` (degenerate): For r=0 the empty unipotent integral contributes 1 and ν=1.

- `period_nonrational_character` (non-example): A character nontrivial on H(F) does not descend to [H]; that datum is rejected before integration.

This interface is used by Fixed-pair conjecture, adjacent period and relative characters.

### 4.2 `globalPeriod_localObstruction`

For the stated global data and an irreducible cuspidal subrepresentation π with supplied restricted tensor factorization, P|π≠0 implies every local `besselModel`(π_v)≠0. If P|π≠0, choose a pure tensor f⁰ with P(f⁰)≠0. Partial evaluation gives local model functionals ℓ_v normalized by ℓ_v(f⁰_v)=1, and P(⊗f_v)=P(f⁰)∏_v ℓ_v(f_v) whenever f_v=f⁰_v almost everywhere. Changing f⁰ gives the expected reciprocal scalar changes. (ggp, §23 and Conjecture 24.1(ii)–(iii), pp. 87–90; ggp line 3050; line 3175).

The hypotheses are E/F is a quadratic extension of number fields; W⊂V is a nondegenerate relevant Hermitian pair of ranks n and n+2r+1, n,r≥0; The global Bessel character is trivial on H(F); Cusp forms and right translations use the supplied automorphic realization and quotient measures; π is irreducible cuspidal and its smooth realization has the supplier’s restricted completed tensor factorization.

The proof uses the following chain. Continuity and density of pure tensors produce f⁰. Partial evaluation is an equivariant local functional. Multiplicity one identifies every other partial evaluation with its scalar multiple and gives the finite product formula. This does not claim a canonical normalization or that arbitrary local models create an automorphic period.

*Needs:* this roadmap §2.6; this roadmap §4.1; contract gap `automorphic-realization`.

**Checks.**

- `period_zero_obstruction` (non-example): One zero local model forces P|π=0; the converse is not deduced without an L-value theorem.

- `period_two_factors` (computation): Replacing f⁰ at two places v,w by vectors with ℓ_v=2 and ℓ_w=3 multiplies P by 6.

- `period_reference_scalar` (compatibility): Multiplying one chosen reference vector by a≠0 divides that normalized local functional by a and multiplies P(f⁰) by a.

This interface is used by Eulerian period structure and the distinction between local and global nonvanishing.

### 4.3 `unitaryTensorLRepresentation`

For ranks a=n+2r+1 and b=n use the finite-Galois L-group (GL_a(C)×GL_b(C))⋊Gal(E/F), with the standard unitary action of Gal(E/F). Define R by inducing Std_a tensor Std_b from its index-two connected dual; inflate R along the natural map from the Weil L-group when using Weil parameters. Prove its dimension is 2ab and that its Weil pullbacks are the induced tensor parameters. For actual strong base change, prove completed L_F(s,π,R)=L_E(s,BC(π_V)×BC(π_W)), including split, ramified and infinite factors. (ggp, §22 table, p. 86, ggp line 3026; §24, pp. 89–90, line 3151–3173; split specialization line 3184).

The hypotheses are E/F is a quadratic extension of number fields; W⊂V is a nondegenerate relevant Hermitian pair of ranks n and n+2r+1, n,r≥0; The global Bessel character is trivial on H(F); Cusp forms and right translations use the supplied automorphic realization and quotient measures; The L-group, its standard representations and actual strong local base change are the supplied ones; The connected dual has index two in the finite-Galois L-group, not in the full Weil L-group.

The proof uses the following chain. Use the general induction construction on the actual index-two L-subgroup, then Artin formalism and the supplier’s LLC/base-change compatibility for local factors. Completed Euler products give the equality where convergent and meromorphic continuation extends it.

The public interface includes:

- `unitaryTensorLRepresentation_restrict`: On the connected dual subgroup R restricts to the tensor representation plus its conjugate translate.

- `unitaryTensorLRepresentation_isometry`: Changing Hermitian form changes only the inner twist, not this L-representation.

- `unitaryTensorLRepresentation_local`: The global equality is induced by equality of every local factor.

*Needs:* contract gap `enhanced-packets`; contract gap `global-parameters`; contract gap `l-factors`.

**Checks.**

- `tensorL_zero_rank` (degenerate): b=0 gives a zero-dimensional representation and L(s)=1.

- `tensorL_split_two_terms` (computation): At a split place the factor is the product of the two conjugate-dual Rankin–Selberg factors; at the center the unitary factors give |L(1/2,π_V×π_W)|².

- `tensorL_dimension` (computation): Ranks (2,1) give dim R=4, not 2; omitting index-two induction fails.

This interface is used by the general global conjecture’s R and its adjacent Rankin–Selberg specialization.

### 4.4 `globalBesselConjecture`

For the stated global data and an irreducible everywhere tempered π occurring with multiplicity one in the cuspidal spectrum, define `globalBesselConjecture`(π,W,V) as the proposition P|π≠0 iff (for every place v, `besselModel`(π_v)≠0) and the completed L_F(1/2,π,R) is nonzero. The value at 1/2 uses the supplied regularity theorem in this tempered generic-parameter range. This target defines a conjecture; it exports no proof for general r. (ggp, Conjecture 24.1, p. 90; ggp line 3175–3182).

The hypotheses are E/F is a quadratic extension of number fields; W⊂V is a nondegenerate relevant Hermitian pair of ranks n and n+2r+1, n,r≥0; The global Bessel character is trivial on H(F); Cusp forms and right translations use the supplied automorphic realization and quotient measures; π is irreducible everywhere tempered and occurs with multiplicity one in the cuspidal spectrum; The L-function is the completed function for R of 4.3.

The proof uses the following chain. Package the precise GGP equivalence on the constructed period and actual local representations. No theorem is manufactured by assuming this proposition; the adjacent global results have independent proofs in Layers 6–7.

The public interface includes:

- `globalBesselConjecture_unfold`: The proposition unfolds to exactly the displayed conjunction and equivalence.

- `globalBesselConjecture_transport`: Rational isometry and consistent auxiliary-data transport preserve the proposition.

- `globalBesselConjecture_localFailure`: Under this proposition, failure of any local model implies the global period is zero; 4.2 proves this implication independently.

*Needs:* this roadmap §4.1; this roadmap §4.2; this roadmap §4.3; contract gap `l-factors`; contract gap `global-parameters`.

**Checks.**

- `global_conjecture_zero_W` (degenerate): With W=0 the L-factor is 1 and the proposition asks for the generic Fourier coefficient, not an empty period condition.

- `global_conjecture_not_local_only` (non-example): The definition keeps L(1/2)≠0 even when all local models exist.

- `global_conjecture_fixed_form` (characterisation): The proposition concerns the specified W⊂V; it does not replace that pair by an existentially chosen inner form.

This interface is used by the global Bessel conjecture interface, distinct from GGP.8.

### Examples

Right translation by h multiplies the period by ν(h). Inverting ν in the integral is essential: replacing it by ν gives ν(h)⁻¹. For r=0 the character disappears and the period is the diagonal integral of the product of the two cusp forms.

### Dependencies

this roadmap §1.2; this roadmap §1.3; GlobalNumberFields §Layers 4–6; GlobalNumberFields §Layer 8; RestrictedProducts §Layers 0–3; contract gap `adelic-measures`; contract gap `automorphic-realization`; this roadmap §2.6; contract gap `enhanced-packets`; contract gap `global-parameters`; contract gap `l-factors`.

## Layer 5: Adjacent local integrals and all-place normalization

### 5.1 `unitaryPeriodNormalizer`

For any characteristic-zero local adjacent unitary pair and its actual unitary tempered σ_v, define C_v=(∏_(i=1..n+1)L_v(i,η_v^i)) L_v(1/2,BC(σ_v)_n×BC(σ_v)_(n+1))/L_v(1,σ_v,Ad), and prove it regular and nonzero. For the stated adjacent global data define Δ_(n+1)=∏_(i=1..n+1)L_F(i,η^i) and C(σ)=Δ_(n+1)L_E(1/2,Π_n×Π_(n+1))/L_F(1,σ,Ad). All factors are completed. The global adjoint denominator is finite and nonzero; the global central value is finite and may vanish. Define the quotient only after proving denominator nonvanishing. (bpcz, §1.1.6, p. 4, bpcz line 148–167; harris Remark 1.4, p. 3, line 149–157).

The hypotheses are Local assertion: F_v is any characteristic-zero local field, E_v/F_v is quadratic étale, n≥1, and σ_v is an actual irreducible unitary tempered representation of an adjacent unitary pair, with no globalization premise; Global assertion: E/F is a quadratic number-field extension, n≥1, h is nondegenerate of rank n, G_h=U(h)×U(h orthogonal-sum <1>), and σ is an irreducible everywhere-tempered cuspidal subrepresentation with actual strong base change Π.

The proof uses the following chain. Use local tempered bounds and the nonvanishing of local L-factors, with the gamma-factor argument at infinity. Globally the opposite-parity Asai factors and distinct constituents yield regular nonzero adjoint values. The exact all-place and endoscopic assertions are included in l-factors, rather than assumed from Harris’s stable illustration.

The public interface includes:

- `unitaryPeriodNormalizer_local`: C_v= (∏_(i=1..n+1)L_v(i,η_v^i)) L_v(1/2,Π_n,v×Π_(n+1),v)/L_v(1,σ_v,Ad).

- `unitaryPeriodNormalizer_nonzero_local`: C_v≠0, including ramified, dyadic, split and archimedean places.

- `unitaryPeriodNormalizer_central_zero`: C(σ)=0 iff the completed central Rankin–Selberg value is 0.

- `unitaryPeriodNormalizer_baseChange`: The adjoint denominator equals the appropriate opposite-parity Asai function of the actual base change.

*Needs:* contract gap `l-factors`; contract gap `global-parameters`.

**Checks.**

- `normalizer_n_one` (computation): n=1 gives Δ₂=L_F(1,η)L_F(2,1), not L_F(1,1)L_F(2,η); η is globally nontrivial.

- `normalizer_split_place` (compatibility): η_v=1 at a split place, so the local Δ is ∏_(i=1..n+1)ζ_v(i), each finite for q_v>1.

- `normalizer_central_zero` (non-example): A zero global central value makes C=0 while every local C_v remains nonzero; no Euler product convergence at the central point is claimed.

This interface is used by local α_v and the completed constant in GGP.8.

### 5.2 `normalizedLocalBesselPeriod`

For an adjacent characteristic-zero local Hermitian pair, actual unitary tempered σ_v, invariant positive inner product B_v, Haar measure dt_v and C_v of 5.1, define α_v(x,y)=C_v⁻¹∫_(U(W)(F_v))B_v(σ_v(t)x,y)dt_v. Define q_v(x)=α_v(x,x)/B_v(x,x) only for x≠0. Give the associated continuous invariant sesquilinear form on the smooth vectors, separately from any positivity assertion. (bpcz, §1.1.6, p. 4, bpcz line 159–169; harris local pairings, pp. 2–3, line 92–111).

The hypotheses are F_v is a characteristic-zero local field, E_v/F_v is quadratic étale and W⊂V is a nondegenerate adjacent pair of ranks n,n+1 with n≥1; σ_v is an actual irreducible unitary tempered representation of U(V)×U(W); B_v is a positive definite invariant inner product, dt_v a Haar measure, and C_v the proved regular nonzero local factor of 5.2; x≠0 when q_v(x) is formed.

The proof uses the following chain. Apply 2.7 and divide by the proved nonzero local factor. Invariant measure changes variables to prove the two invariances. Continuity follows from the supplied tempered seminorm bounds. Compare with the ordinary r=0 form of 3.3.

The public interface includes:

- `normalizedLocalBesselPeriod_sesq`: α_v is linear in x and conjugate-linear in y, and invariant under independent diagonal U(W) translations.

- `normalizedLocalBesselPeriod_ext`: A sesquilinear form agreeing on pure tensors agrees everywhere on the completed smooth tensor carrier.

- `normalizedLocalBesselPeriod_nonzero_iff`: α_v is nonzero iff the local Bessel model is nonzero, by 3.3 and C_v≠0.

- `normalizedLocalBesselPeriod_source`: Its value is the source’s P_h,σ_v^natural with the same pairing and Haar measure.

*Needs:* this roadmap §2.7; this roadmap §5.1; this roadmap §3.3; contract gap `local-categories`.

**Checks.**

- `local_alpha_compact` (computation): With U(1) mass a, inverse weights and B(1,1)=1, α(1,1)=a/C_v and q(1)=a/C_v.

- `local_alpha_zero_vector` (degenerate): α(0,0)=0; q is not formed on 0, avoiding 0/0.

- `local_alpha_rescale_vector` (compatibility): For c≠0, q(cx)=q(x); α(cx,cx)=|c|²α(x,x).

This interface is used by the local factors exported in GGP.8.

### 5.3 `normalizedLocalBesselPeriod_spherical`

At a finite place outside a finite set containing dyadic places, archimedean places and all ramified group, extension, representation, additive-data and level places, suppose E/F is unramified or split, the groups admit the chosen compatible hyperspecials, σ_v is spherical and x_v is a nonzero hyperspecial-fixed tensor. Then ∫B_v(σ_v(t)x_v,x_v)dt_v=C_v·vol(K_(H,v))B_v(x_v,x_v), hence q_v(x_v)=vol(K_(H,v)). (harris, §2 hypotheses (1)–(7), pp. 4–5, harris line 170–190; Theorem 2.12, p. 23, line 1289; bpcz equation (1.1.6.1), p. 4, line 168).

The hypotheses are E/F is a quadratic extension of number fields; n≥1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; The displayed good-place spherical hypotheses hold at v; only the local hypotheses are used in this theorem.

The proof uses the following chain. Use the supplier’s spherical matrix coefficients and Satake parameters in the local integral. Sum the relative Cartan coordinates to the local L-quotient. The Haar volume and vector norm multiply the normalized unit-vector result; keep split factors separately, with the same completed normalization.

*Needs:* this roadmap §5.2; contract gap `l-factors`; contract gap `local-categories`.

**Checks.**

- `spherical_unit_volume` (computation): If vol(K_H)=1 and B_v(x_v,x_v)=1, α_v(x_v,x_v)=1.

- `spherical_scaled_measure` (computation): If dt is multiplied by 2, α_v/B_v is 2vol(K_H), not 1.

- `spherical_bad_places` (non-example): This evaluation is not asserted at a ramified or dyadic place; 5.2 still defines its convergent local integral.

This interface is used by Existence of the all-place product.

### 5.4 `unitaryPeriod_rescaling`

With the hypotheses of 5.2, replacing B_v by b_v B_v, b_v>0, leaves q_v unchanged; replacing dt_v by a_vdt_v, a_v>0, multiplies q_v by a_v. For finitely many Haar rescalings with ∏a_v=1 the product of q_v is unchanged. For a nonzero global factorizable f, replacing f by cf multiplies |P(f)|² and the Petersson norm by |c|². Rescaling the global H Haar by a>0 multiplies |P|² by a², so GGP.8 requires its stated Tamagawa measure rather than invariance under an arbitrary global Haar change. (bpcz, §1.1.6, pp. 4–5, bpcz line 160–188; §2.3.2, p. 15, line 679).

The hypotheses are E/F is a quadratic extension of number fields; n≥1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; All scalars for pairings and measures are positive real; vector scalars are nonzero complex; local Haar changes have finite support.

The proof uses the following chain. Use linearity of integration and sesquilinearity. Factorized local H Haar measures have a fixed global product; only product-one rescalings preserve it. The independent global Petersson pairing fixes the scale on G, so changing global H measure is a different theorem datum.

*Needs:* this roadmap §4.1; this roadmap §5.2; contract gap `adelic-measures`.

**Checks.**

- `pairing_rescale_two` (computation): B_v→2B_v doubles α_v and B_v(x,x), leaving q_v unchanged.

- `haar_two_places` (computation): Haar changes 2 at v and 1/2 at w multiply the local product by 1.

- `global_haar_negative_control` (non-example): Multiplying the global H measure by 2 multiplies the squared period by 4; it is not an invariance of the fixed-normalization identity.

This interface is used by Choice-independent form of the exported identity.

### 5.5 `allPlaceBesselProduct`

For the stated adjacent global data, nonzero factorizable f=⊗_v f_v, arbitrary invariant local pairings and local H Haar measures factoring its Tamagawa measure, construct ∏_v q_v(f_v) as the unordered product of a finite modification of the hyperspecial-volume product. Prove the latter product is convergent and nonzero under the supplier’s Tamagawa convergence factors, and the resulting product is independent of enlarging the exceptional finite set. Do not define it by a central Euler product of C_v. (bpcz, Equation (1.1.6.1) and Theorem 1.1.6.1, pp. 4–5, bpcz line 168–193; §2.3.2, p. 15, line 679).

The hypotheses are E/F is a quadratic extension of number fields; n≥1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; Each f_v≠0 and f_v is the chosen hyperspecial-fixed reference vector almost everywhere; The reference Haar volume product and Tamagawa factorization satisfy adelic-measures.

The proof uses the following chain. Take the finite-exceptional expression from 5.3, multiply by the absolutely convergent volume tail supplied with Tamagawa normalization, and prove coherence under adding a good place. This construction permits zero q_v and never divides by a period.

The public interface includes:

- `allPlaceBesselProduct_finiteModification`: For a finite S containing all exceptional places, the product is ∏_(v∈S)q_v times the convergent volume product outside S.

- `allPlaceBesselProduct_enlarge`: Moving a good place into S does not change the value.

- `allPlaceBesselProduct_localZero`: If a local q_v vanishes, the product vanishes; a finite zero factor is retained.

- `allPlaceBesselProduct_pairing`: Changing arbitrary local inner-product scales leaves the product unchanged.

*Needs:* this roadmap §5.3; this roadmap §5.4; contract gap `adelic-measures`.

**Checks.**

- `product_all_spherical` (compatibility): For volume-one reference measures almost everywhere, only finitely many q_v differ from 1.

- `product_one_zero` (degenerate): A single q_v=0 yields product 0, not an undefined inverse.

- `product_change_exceptional_set` (computation): A good place of volume 2 contributes 2 on either side when moved into S.

This interface is used by the product on the right side of GGP.8.

### Examples

For compact U(1) of Haar mass a and paired weights k,-k, the unnormalized local integral on unit vectors is a. Rescaling a local pairing by b>0 scales that integral by b. The ratio α_v(f_v,f_v)/<f_v,f_v> is unchanged. A spherical ratio is vol(K_v), which equals 1 only when the local Haar measure gives K_v volume 1.

### Dependencies

contract gap `l-factors`; contract gap `global-parameters`; this roadmap §2.7; this roadmap §3.3; contract gap `local-categories`; this roadmap §4.1; contract gap `adelic-measures`.

## Layer 6: Relative characters and the endoscopic spectral calculation

### 6.1 `globalWhittakerRelativePeriods`

For the stated Hermitian Arthur data let G′=Res_(E/F)(GL_n×GL_(n+1)), H′=Res_(E/F)GL_n diagonally, G_R=GL_n/F×GL_(n+1)/F, N its compatible maximal unipotent over E, P_m the mirabolic and N_m its upper unipotent. On the actual global Whittaker model define λ(W)=Z_RS(0,W), where Z_RS(s,W)=∫_(N_(H′)(A)\H′(A))W(h)|det h|_E^s dh continued from Re(s)≫0. Define β_η and the invariant Whittaker norm by the finite-S mirabolic integrals with the leading Asai and Rankin–Selberg coefficients and Tamagawa convergence factors of bpcz §8.1.2. Prove independence of S, nonzero β_η, λ≠0 iff L_E(1/2,Π_n×Π_(n+1))≠0, and equality of the Whittaker norm with the normalized induced Petersson norm. (bpcz, §8.1.2 and Theorem 8.1.2.1, pp. 76–77, bpcz line 4122–4154; §10.2.1, p. 90, line 4835–4845).

The hypotheses are E/F is a quadratic extension of number fields and n≥1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); Each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; The actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew.

The proof uses the following chain. Use general Rankin–Selberg continuation/local test-vector theory, mirabolic distinction and the leading-coefficient norm formula required in the supplier contracts. Factor the Eisenstein Whittaker coefficient along constituent blocks; compare the cross terms in its norm with the adjoint Euler factors. These are genuine relative constructions on the supplied parameters, not arbitrary functionals chosen to satisfy a period formula.

The public interface includes:

- `globalWhittakerPeriods_lambda`: The integration variable s=0 corresponds to the Rankin–Selberg central argument 1/2.

- `globalWhittakerPeriods_beta`: For large S, β_η=(Δ_(G_R)^(S,*))⁻¹ L^(S,*)(1,Π_n,As^((-1)^(n+1)))L^(S,*)(1,Π_(n+1),As^((-1)^n)) times the integral over N_R(F_S)\P_R(F_S) of W(p)η_(G_R)(p).

- `globalWhittakerPeriods_norm`: The squared norm is (Δ_(G′)^(S,*))⁻¹ L^(S,*)(1,Π_n×Π_n^∨)L^(S,*)(1,Π_(n+1)×Π_(n+1)^∨) times ∫_(N(F_S)\P(F_S))|W(p)|²dp; polarize for mixed vectors.

- `globalWhittakerPeriods_eta`: η_(G_R)(g_n,g_(n+1))=η(det g_n)^(n+1)η(det g_(n+1))^n.

- `globalWhittakerPeriods_enlarge`: Enlarging S inserts exactly the local unramified factor removed from the leading coefficient.

*Needs:* contract gap `l-factors`; contract gap `automorphic-realization`; contract gap `automorphic-spectrum`; contract gap `adelic-measures`; contract gap `relative-trace`.

**Checks.**

- `whittaker_two_blocks` (computation): For n=1, the two Asai signs in β are + on Π₁ and - on Π₂; reversing the signs selects the wrong distinction.

- `whittaker_zero_vector` (degenerate): λ(0)=β(0)=0 and the norm of 0 is 0; no normalized quotient is formed on 0.

- `whittaker_central_zero` (characterisation): If the central L-value is zero, λ is the zero functional even though β_η and the Whittaker model are nonzero.

This interface is used by GL relative character, its central-value nonvanishing and Euler factorization.

### 6.2 `unitaryGlobalRelativeCharacter`

For a cuspidal automorphic realization σ define J_σ(f)=Σ_e P(σ(f)e)conj(P(e)) over an orthonormal basis for the actual Petersson pairing. For the stated Hermitian Arthur data define I_Π(f)=Σ_W λ(Π(f)W)conj(β_η(W))/<W,W>_Whitt over an orthogonal smooth K-basis. Prove convergence, basis independence and continuity on the supplied adelic Schwartz algebra. Define the induced relative character I_(P,ρ) by the same pairing of the canonically regularized Rankin–Selberg period of E(φ,0) with the Flicker–Rallis intertwining period; both are the supplied canonical periods, not arbitrary extensions. (bpcz, §2.8; §5.1.5 and Proposition 5.1.5.1, p. 59, bpcz line 3040–3058; §8.1.3, p. 78, line 4225–4233).

The hypotheses are E/F is a quadratic extension of number fields and n≥1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); Each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; The actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew; For J_σ, σ is cuspidal; temperedness is required only for its local integral realization; f belongs to the supplied adelic Schwartz algebra; orthogonal basis elements are nonzero.

The proof uses the following chain. Use the supplier’s nuclear trace-kernel and continuous period pairing theorem to prove convergence and independence. This applies to the actual λ and β of 6.1 and the actual P of 4.1. Positivity follows by writing the global relative character on a convolution square as a sum of absolute squares; it is not inferred from an archimedean local positivity conjecture.

The public interface includes:

- `unitaryGlobalRelativeCharacter_basis`: Changing orthonormal or orthogonal bases leaves the distributions unchanged.

- `unitaryGlobalRelativeCharacter_positive`: J_σ(f*f*)≥0 and J_σ is nonzero iff P|σ≠0, using the source convolution adjoint.

- `unitaryGlobalRelativeCharacter_local`: For tempered σ_v the local relative character is J_(σ_v)(f_v)=∫_(H_v)Tr(σ_v(t)σ_v(f_v))dt.

- `unitaryGlobalRelativeCharacter_congr`: Equivariant unitary identifications of the actual automorphic realizations transport the relative characters.

*Needs:* this roadmap §4.1; this roadmap §6.1; contract gap `automorphic-spectrum`; contract gap `relative-trace`.

**Checks.**

- `relative_character_rank_one` (computation): For a one-dimensional realization, J_σ(f)=σ(f)|P(e)|²/<e,e>.

- `relative_character_zero_period` (degenerate): P|σ=0 gives J_σ=0 even if σ(f) is nonzero.

- `relative_character_basis_rescale` (compatibility): Replacing an orthogonal basis vector by ce multiplies numerator and norm by |c|² and does not change I_Π.

This interface is used by Spectral comparison and conversion back to pure-vector period norms.

### 6.3 `starGenericRelativeContribution`

For the stated Hermitian Arthur data, let χ=[M_P,ρ] be its actual cuspidal datum and r_total=r_n+r_(n+1) its constituent count. For every adelic Schwartz f, the χ-contribution I_χ to the Jacquet–Rallis trace distribution satisfies I_χ(f)=2^(-r_total)I_(P,ρ)(f)=2^(-r_total)I_Π(f). More generally the contribution is zero for a star-generic datum which is not relevant. A star-generic datum consists of pairwise distinct constituents within each degree with no two distinct constituents in the same degree conjugate-contragredient; relevance adds the individual conjugate-self-duality and prescribed Asai distinction. These are predicates on the actual cuspidal support. (bpcz, §5.1.3; Theorem 5.2.1.1, p. 59, bpcz line 3066–3083; Theorem 8.1.4.1, p. 78, line 4243–4254; equation (10.1.5.2), p. 88, line 4749).

The hypotheses are E/F is a quadratic extension of number fields and n≥1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); Each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; The actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew; I_χ is the actual spectral contribution of the general Jacquet–Rallis trace distribution supplied by relative-trace; dim a_P=r_total includes the full split centre.

The proof uses the following chain. Unfold the truncated spectral kernel along H′ and G_R. The general Arthur truncation estimates from automorphic-spectrum justify taking its constant term. The Flicker–Rallis intertwining calculation leaves the factor 2^(-dim a_P); the canonical Rankin–Selberg continuation identifies the second period. Equivalently use the Whittaker expansion with 6.1. The specialized truncation-period computation is owned here; general Eisenstein, intertwiner and polynomial-exponential asymptotics are imported.

*Needs:* this roadmap §6.1; this roadmap §6.2; contract gap `relative-trace`; contract gap `automorphic-spectrum`.

**Checks.**

- `spectral_stable_factor` (computation): r_n=r_(n+1)=1 gives coefficient 1/4.

- `spectral_endoscopic_factor` (computation): r_n=2,r_(n+1)=1 gives coefficient 1/8.

- `spectral_wrong_datum` (non-example): Repeated cuspidal constituents are excluded; the star-generic calculation is not a formula for arbitrary residual Arthur parameters.

This interface is used by Endoscopic comparison and variable component-group constant.

### 6.4 `isolatedUnitaryRelativeComparison`

For the stated Hermitian Arthur data choose finite S containing infinite and all bad places, and H° the finite set of rank-n Hermitian forms unramified outside S. Let f on G′(A) and f_h on G_h(A), h∈H°, be factorizable Schwartz tests with the source Tamagawa convergence factors, matching relative orbital integrals at S, spherical base-change transfer away from S, and finite-place support compact at split places and the hyperspecial unit at inert places outside S. Then Σ_(h∈H°) J_(h,BC=Π)(f_h)=2^(-r_total)I_Π(f). Here J_(h,BC=Π) is the sum over the actual cuspidal realizations with this base change and the chosen level, not a single arbitrary representation. Include enough matched tests to detect every nonzero I_Π and every nonzero global J_σ, in the continuous archimedean topology. (bpcz, Proposition 10.1.6.1, pp. 88–89, bpcz line 4755–4767; proof line 4775–4831; detection in §10.2, p. 90, line 4850–4864).

The hypotheses are E/F is a quadratic extension of number fields and n≥1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); Each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; The actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew; The test functions satisfy matching and support as stated, including compatible convergence factors; The multiplier theorem preserves those matching and support conditions.

The proof uses the following chain. Apply the general geometric Jacquet–Rallis comparison from relative-trace. Use the supplier’s Schwartz multipliers and split-place strong multiplicity one to isolate χ on the GL side and the entire base-change class on each unitary side while preserving transfer. Then insert 6.3. Dense archimedean transfer plus exact finite-place transfer and positivity of the global J on convolution squares give detection. No individual representation is isolated by assuming GGP.8.

The public interface includes:

- `isolatedRelativeComparison_measure`: Writing S for S₀, use f=(Δ_H′^(S,* )Δ_(G_R)^(S,*)) f_S tensor f^S and f_h=(Δ_(H_h)^S)² f_(h,S) tensor f_h^S, with the supplier’s partial/leading measure factors; matching uses its local quotient measures.

- `isolatedRelativeComparison_enlarge`: Enlarging S preserves the same global distributions, by the fundamental lemma and spherical transfer.

*Needs:* this roadmap §6.3; contract gap `relative-trace`; contract gap `spectral-isolation`; contract gap `global-parameters`; contract gap `adelic-measures`.

**Checks.**

- `relative_comparison_no_auxiliary_supercuspidal` (compatibility): Isolation uses Schwartz multipliers without a supercuspidal local component of Π.

- `relative_comparison_zero_other_forms` (degenerate): When transfer at S vanishes on all other forms, only the designated form remains in the sum, but all cuspidal realizations with that base change remain.

- `relative_comparison_center_count` (computation): For three constituents the isolated GL term is I_Π/8; replacing it by I_Π/4 fails.

This interface is used by Adjacent nonvanishing and the period identity.

### 6.5 `temperedRelativeCharacterEulerIdentity`

For the stated adjacent global data, let S contain infinite and all bad places and choose factorizable f_h=(Δ_(H_h)^S)²(⊗_(v∈S) f_(h,v)) tensor (⊗_(v∉S)1_(G_h(O_v))) with the source partial measure factors. Then J_σ(f_h)=|S_Π|⁻¹ L_E^S(1/2,Π_n×Π_(n+1))/L_F^S(1,σ,Ad) ·∏_(v∈S)J_(σ_v)(f_(h,v)), where S_Π is the supplier’s product of constituent sign groups. The local comparison constants for matching tests are nonzero and their global product is 1; they are supplied by relative-trace with this exact measure and additive-character convention. (bpcz, §10.3, pp. 90–92; equations (10.3.2.1), (10.3.3.2), (10.3.5.4); bpcz line 4889–4892; line 4918–4946).

The hypotheses are E/F is a quadratic extension of number fields; n≥1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; All local factors and test functions use the normalization of 5.2–5.4 and 6.4.

The proof uses the following chain. Uniqueness within local Langlands packets in Layer 3 and the actual global multiplicity formula collapse the sum of 6.4 to σ whenever every local model exists. Otherwise 4.2 and 5.2 make both sides zero. Use the supplier’s local relative-character comparison and its product-one constants, then 6.1’s Whittaker factorization and the adjoint/Asai identification. The coefficient is 2^(-dim a_P)=|S_Π|⁻¹.

*Needs:* this roadmap §3.7; this roadmap §3.9; this roadmap §3.11; this roadmap §4.2; this roadmap §5.3; this roadmap §6.4; contract gap `relative-trace`; contract gap `global-parameters`; contract gap `l-factors`.

**Checks.**

- `euler_zero_local` (degenerate): A place with no local model makes both global and local relative characters zero; the proof must not divide by that relative character.

- `euler_kappa_product` (compatibility): Local constants κ_v may be nontrivial, but their product is 1; setting every κ_v=1 without transport is not asserted.

- `euler_endoscopic_order` (computation): With constituent counts 2 and 1, |S_Π|⁻¹=1/8. The identity uses the inverse group order, not the order.

This interface is used by the pure-vector formula GGP.8.

### Examples

A cuspidal parameter on each GL factor has two constituents in total and coefficient 2⁻²=1/4. With two constituents on one side and one on the other, the coefficient is 2⁻³=1/8. The dimension in this calculation is that of a_P including the split centre, not a_P/a_G.

### Dependencies

contract gap `l-factors`; contract gap `automorphic-realization`; contract gap `automorphic-spectrum`; contract gap `adelic-measures`; contract gap `relative-trace`; this roadmap §4.1; contract gap `spectral-isolation`; contract gap `global-parameters`; this roadmap §3.7; this roadmap §3.9; this roadmap §3.11; this roadmap §4.2; this roadmap §5.3.

## Layer 7: Global adjacent theorems and the GGP.8 export

### 7.1 `unitaryAdjacentGlobalNonvanishing`

For the stated Hermitian Arthur data, the completed L_E(1/2,Π_n×Π_(n+1)) is nonzero iff there exist a nondegenerate rank-n Hermitian space h, an irreducible cuspidal automorphic subrepresentation σ of U(h)×U(h orthogonal-sum <1>) with actual weak (equivalently strong) base change Π, and a cusp vector f in σ with P_h(f)≠0. No temperedness or auxiliary-supercuspidal-place hypothesis is imposed. (bpcz, Theorem 1.1.5.1, p. 3, bpcz line 124–134; proof §10.2, p. 90, line 4835–4864).

The hypotheses are E/F is a quadratic extension of number fields and n≥1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); Each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; The actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew.

The proof uses the following chain. By 6.1 the central value is nonzero exactly when I_Π is nonzero. The detection statement of 6.4 equates this with a nonzero unitary relative character on some h. By 6.2 that character is nonzero exactly when its actual cusp period is nonzero. Weak/strong base-change comparison is supplied in global-parameters and does not follow from local multiplicity one.

*Needs:* this roadmap §4.1; this roadmap §6.1; this roadmap §6.2; this roadmap §6.4; contract gap `global-parameters`.

**Checks.**

- `global_nonvanishing_n_one` (degenerate): n=1 is in the theorem; no n>1 restriction is inherited from the stable source.

- `global_nonvanishing_inner_form` (non-example): The conclusion quantifies over h; it is not a theorem about every h with that rank.

- `global_nonvanishing_endoscopic` (compatibility): Several distinct cuspidal constituents are allowed on either degree, subject to the stated Hermitian Arthur conditions.

This interface is used by PeriodsAndSpecialValues; possible period witnesses for arithmetic applications.

### 7.2 `unitaryStableGlobalNonvanishing`

For any quadratic number-field extension E/F, n>1 and Hermitian cuspidal Π_n,Π_(n+1) of GL_n(A_E),GL_(n+1)(A_E), the equivalence of 7.1 holds. Hermitian means conjugate-self-dual with L(s,Π_m,As^((-1)^m)) regular at s=1, equivalently the opposite signed Asai factor has a pole there in this cuspidal range. No split supercuspidal place is required. (bplzz, Definition 1.5, p. 3, bplzz line 128; Theorem 1.8, p. 4, line 157–174).

The hypotheses are E/F is a quadratic extension of number fields and n≥1; Π_m, for m=n,n+1, is the full normalized induction of distinct conjugate-self-dual cuspidal constituents Π_(m,j); Each constituent has a pole of L(s,Π_(m,j),As^((-1)^(m+1))) at s=1; The actual induced representations are the supplier’s Hermitian discrete Arthur parameters; their constituent and base-change uniqueness are supplied, not postulated anew; n>1; each degree has a single cuspidal constituent.

The proof uses the following chain. Specialize 7.1 and use the supplier’s signed-Asai factorization to identify the two definitions of Hermitian cuspidal parameters. This uses the proof of 7.1 rather than replanning BPLZZ’s spectral-isolation theory.

*Needs:* this roadmap §7.1; contract gap `l-factors`.

**Checks.**

- `stable_counts` (computation): The total constituent count is 2.

- `stable_bad_places` (compatibility): Ramified, dyadic and infinite places remain part of the theorem.

- `stable_n_one_boundary` (non-example): The source’s n>1 stable formulation is not used to prove n=1; that case is supplied separately by 7.1.

This interface is used by Stable-base-change applications and verification of the former auxiliary-place restriction.

### 7.3 `harrisRefinedUnitaryConjecture`

For the stated adjacent global data define `harrisRefinedUnitaryConjecture`(σ) as the proposition that for every nonzero factorizable f, |P_h(f)|²/<f,f>_Pet = |S_Π|⁻¹ C(σ)·∏_v q_v(f_v), using the Tamagawa normalization and local product of 5.6. The group S_Π is (Z/2)^(r_n+r_(n+1)), with r_m counting the distinct actual cuspidal constituents. Also give its polarized mixed-vector period identity P(f)conj(P(g)) after local pairings are chosen to multiply to the Petersson pairing. The polarized version uses <x,y> linear in x and is equivalent by polarization, not an assumption in 7.4. (harris, Conjecture 1.3, p. 3, harris line 132–144; pairings pp. 2–3, line 75–111; completed formulation bpcz §1.1.6, pp. 4–5, line 148–193).

The hypotheses are E/F is a quadratic extension of number fields; n≥1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; Both global quotient measures are Tamagawa, and the local H Haar measures factor its Tamagawa measure.

The proof uses the following chain. State Harris’s refined assertion on the already constructed carriers and compare its Δ and adjoint conventions with 5.1 and BPCZ. Polarization applies to the Hermitian period norm after vector-norm denominators are cleared; no division by a zero mixed pairing is used.

The public interface includes:

- `harrisRefinedUnitaryConjecture_unfold`: The proposition quantifies over nonzero pure tensors with exactly the displayed factors.

- `harrisRefinedUnitaryConjecture_polarize`: With product-compatible pairings its mixed-vector version is obtained by polarization on each finite set of modified tensor factors.

- `harrisRefinedUnitaryConjecture_rescale`: Vector and local-pairing rescaling follow 5.4; product-one Haar rescaling preserves it.

*Needs:* this roadmap §4.1; this roadmap §5.1; this roadmap §5.2; this roadmap §5.5; contract gap `global-parameters`; contract gap `adelic-measures`.

**Checks.**

- `harris_stable_coefficient` (computation): r_n=r_(n+1)=1 gives 1/4.

- `harris_endoscopic_coefficient` (computation): r_n=2,r_(n+1)=1 gives 1/8, not 1/4.

- `harris_zero_domain` (non-example): The zero global vector is excluded before forming its Petersson quotient; zero period on a nonzero vector is allowed.

This interface is used by A precise conjecture interface with its proof delivered by GGP.8.

### 7.4 `ggp8UnitaryPeriodIdentity`

GGP.8. For the stated adjacent global data, with both global integrals measured by Tamagawa measures and arbitrary positive invariant local inner products, choose local H Haar measures whose product is its Tamagawa measure. For every nonzero factorizable f=⊗_v f_v, prove |P_h(f)|²/<f,f>_Pet = 2^(-(r_n+r_(n+1))) · (∏_(i=1..n+1)L_F(i,η^i)) · L_E(1/2,Π_n×Π_(n+1))/L_F(1,σ,Ad) · ∏_v (α_v(f_v,f_v)/<f_v,f_v>_v). Here α_v=C_v⁻¹ times the local diagonal matrix-coefficient integral. Every L-function is completed, local normalizers are regular nonzero, and the product is the one of 5.6. Endoscopic, ramified, dyadic, split and infinite places are all included. (bpcz, Theorem 1.1.6.1, pp. 4–5, bpcz line 179–193; measures §2.3.2, p. 15, line 679–699; proof §10.3, pp. 90–92, line 4865–4946).

The hypotheses are E/F is a quadratic extension of number fields; n≥1 and h is any nondegenerate rank-n Hermitian E-space; G_h=U(h)×U(h orthogonal-sum <1>), with diagonal subgroup H_h=U(h); σ is an irreducible cuspidal automorphic subrepresentation of G_h(A_F), tempered at every place; Π=BC(σ) is its actual strong Hermitian discrete base change; The two global quotient measures and the local Haar factorization are as stated; f≠0 is a pure restricted tensor; consequently every f_v≠0; The proposition `harrisRefinedUnitaryConjecture` is defined in 7.3; its truth is not a hypothesis.

The proof uses the following chain. First prove the denominator-cleared polarized vector identity by applying 6.5 to smoothing rank-one tensors and using continuity/density in the supplied nuclear category. 2.6 and 4.2 identify the period factors, 5.3 supplies the unramified tail, and the source’s Tamagawa convergence factors restore Δ_(n+1). Divide only by the positive Petersson norm of f and the positive local vector norms. The component coefficient comes from 6.3, not an assumed refined formula.

The public interface includes:

- `ggp8UnitaryPeriodIdentity_harris`: The theorem proves `harrisRefinedUnitaryConjecture`; it does not assume it.

- `ggp8UnitaryPeriodIdentity_stable`: If both base changes are cuspidal, the coefficient is 1/4; for n>1 this is BPLZZ Theorem 1.10, p. 4, bplzz line 185.

- `ggp8UnitaryPeriodIdentity_export`: PeriodsAndSpecialValues consumes the declaration together with all local, measure, convergence and component-count hypotheses under the stable label GanGrossPrasadUnitaryGroups:GGP.8.

*Needs:* this roadmap §2.7; this roadmap §5.1; this roadmap §5.2; this roadmap §5.3; this roadmap §5.4; this roadmap §5.5; this roadmap §6.5; this roadmap §7.3; contract gap `adelic-measures`; contract gap `global-parameters`.

**Checks.**

- `ggp8_vector_pairing_scaling` (compatibility): f→cf cancels |c|² on the left; B_v→2B_v cancels on the right.

- `ggp8_measure_scaling` (compatibility): Local Haar changes by 2 and 1/2 at two places preserve both sides; an arbitrary change of the global Tamagawa normalization is excluded.

- `ggp8_endoscopic_count` (computation): For actual Π with counts (2,1) the coefficient is 1/8. Counts (1,1) give 1/4.

- `ggp8_central_zero` (degenerate): If the central value is 0 the right side is 0 with all local terms defined, hence the period of every such vector is 0.

This interface is used by the exact GGP.8 downstream export.

### Examples

The existential nonvanishing theorem chooses an inner form; it does not assert a period on a prescribed h. The refined theorem applies to each prescribed h carrying an everywhere-tempered cuspidal σ. Constituent counts (1,1) and (2,1) give respectively 1/4 and 1/8.

### Dependencies

this roadmap §4.1; this roadmap §6.1; this roadmap §6.2; this roadmap §6.4; contract gap `global-parameters`; contract gap `l-factors`; this roadmap §5.1; this roadmap §5.2; this roadmap §5.5; contract gap `adelic-measures`; this roadmap §2.7; this roadmap §5.3; this roadmap §5.4; this roadmap §6.5.

## Downstream consumers

- **PeriodsAndSpecialValues** consumes **GanGrossPrasadUnitaryGroups:GGP.8**, §7.4, with the complete measures, local convergence, spherical normalization and variable component-group constant. Its consumer section is not assigned by this roadmap.
- **TwistedAutomorphicDescents** consumes the unitary Bessel subgroup, multiplicity and Langlands correspondence interfaces in §§1.2, 2.6, 3.7 and 3.9, and the period identity in §7.4. Its orthogonal and Fourier–Jacobi requirements belong to the named Part II and retain their other owners.
- **QuantitativeOrbitMethodAndMicrolocalAnalysisOnLieGroups**, G8, consumes the unitary multiplicity theorem §2.6, adjacent Ξ estimate §2.7, relative form §3.3 and factorization §§4.2, 7.4. This does not supply its mixed orthogonal requirements, moment-map geometry, upper-semicontinuity or full induced-component positivity.

The period-witness premise in SelmerIwasawaCohomologyPartII §8.1 has an arithmetic owner. Applying §7.1 to fill that premise requires a continuation after this roadmap, together with an independent argument selecting its required definite form and integral test vector. The existential inner-form theorem alone does not supply those extra requirements, and the arithmetic roadmap supplies no premise to GGP.8.

## References

The manifest `packages/GanGrossPrasadUnitaryGroups/sources.toml` records the exact legal copies. The following identifiers govern the locators above; preprint numbering is not silently replaced by publication numbering.

- **xue-real**: Hang Xue, [Bessel models for real unitary groups: the tempered case](https://par.nsf.gov/servlets/purl/10476094), 2023. Theorem 2.2, published p. 1000; Sections 2.1-2.3, pp. 997-1001; Corollary 2.5, p. 1001.

- **ggp**: Wee Teck Gan, Benedict H. Gross, Dipendra Prasad, [Symplectic local root numbers, central critical L-values, and restriction problems in the representation theory of classical groups](https://arxiv.org/abs/0909.2999v1), 2009. Sections 2, 6, 12, 14-15, 17-19, 23-24; Theorems 6.1, 14.1(ii), 15.1, 17.2; Conjectures 17.1, 17.3, 24.1; arXiv v1 pp. 5-7, 20-21, 58-63, 68-76, 86-91.

- **agrs**: Avraham Aizenbud, Dmitry Gourevitch, Steve Rallis, Gérard Schiffmann, [Multiplicity one Theorems](https://arxiv.org/abs/0709.4215v1), 2007. Theorem 1 prime (1'), arXiv v1 p. 2.

- **sun-zhu**: Binyong Sun, Chen-Bo Zhu, [Multiplicity one theorems: the Archimedean case](https://arxiv.org/abs/0903.1413v2), 2009. Theorem B and Casselman-Wallach conventions, arXiv v2 p. 2.

- **bp-unitary-tempered**: Raphaël Beuzart-Plessis, [La conjecture locale de Gross-Prasad pour les représentations tempérées des groupes unitaires](https://arxiv.org/abs/1205.2987v2), 2012. Theorem 17.1.1, arXiv v2 p. 100; Section 18.1, pp. 106-107; Theorem 18.4.1, p. 110.

- **bp-arch**: Raphaël Beuzart-Plessis, [A local trace formula for the Gan-Gross-Prasad conjecture for unitary groups: the archimedean case](https://arxiv.org/abs/1506.01452v3), 2015. Theorem 12.4.1, arXiv v3 pp. 289-290; Sections 12.2-12.3.

- **bp-refined**: Raphaël Beuzart-Plessis, [Endoscopie et conjecture locale raffinée de Gan-Gross-Prasad pour les groupes unitaires](https://arxiv.org/abs/1212.0951v2), 2012. Theorem 8.5.1, arXiv v2 pp. 70-71; Sections 7.2, 7.7, 8.1, 8.3; introduction Theorem 1, pp. 3-4.

- **harris**: R. Neal Harris, [The Refined Gross-Prasad Conjecture for Unitary Groups](https://arxiv.org/abs/1201.0518v2), 2012. Conjecture 1.3, arXiv v2 p. 3; pairings and normalized local periods, pp. 2-3; Proposition 2.1, p. 5; Theorem 2.12, p. 23; Section 2 spherical-data assumptions.

- **bplzz**: Raphaël Beuzart-Plessis, Yifeng Liu, Wei Zhang, Xinwen Zhu, [Isolation of cuspidal spectrum, with application to the Gan--Gross--Prasad conjecture](https://arxiv.org/abs/1912.07169v3), 2019. Definition 1.5, arXiv v3 p. 3; Theorems 1.8 and 1.10, p. 4.

- **bpcz**: Raphaël Beuzart-Plessis, Pierre-Henri Chaudouard, Michał Zydor, [The global Gan-Gross-Prasad conjecture for unitary groups: the endoscopic case](https://arxiv.org/abs/2007.05601v1), 2020. Sections 1.1.2-1.1.6, arXiv v1 pp. 2-5; Theorems 1.1.5.1 and 1.1.6.1; Section 2.3.2, p. 15.

- **jsz-bessel**: Dihua Jiang, Binyong Sun, Chen-Bo Zhu, [Uniqueness of Bessel models: the archimedean case](https://arxiv.org/abs/0908.1728v2), 2009. Theorem A, arXiv v2 pp. 1-2; Sections 2.1-2.2.
