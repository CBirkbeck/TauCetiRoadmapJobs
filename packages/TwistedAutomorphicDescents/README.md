# Roadmap: twisted automorphic descents and cuspidal automorphic modules

**Summary.** Construct rational Bessel Fourier images of leading Eisenstein residues for special orthogonal and unitary groups over number fields. Starting with a specified relevant inclusion of classical spaces and generic global parameter data, the library unfolds Bessel–Eisenstein integrals, compares their all-place factors, proves reciprocal period nonvanishing, and recovers a prescribed cuspidal module up to its permitted even-orthogonal outer orbit. The endpoints include the period-to-central-value implication, its weak-Fourier-support converse, and regular and subregular recovery. Generic Summand, weak Fourier support and the exact local assertion on distinguished members retain their stated logical status; no conjecture is installed as an axiom (JZ2020, Theorems 5.3, 5.7, 6.10 and 7.1, pp.786–808; JZ2020 line 2067, line 2296, line 2991, line 3118).

## Scope and ownership

This roadmap owns the coordinate comparisons for prescribed rational embeddings, the particular Fourier images and tower identities, the Bessel–Eisenstein unfolding and local integrals, the residue-to-period comparison and the critical-module recovery. It treats every rational inner form and all characteristic-zero local places, including residue characteristics 2 and 3. Spherical computations are intermediate targets within an all-place theory.

The classical-group carriers, reflections and quadratic Witt theorems are already in the library in the Tau Ceti modules specified below. ReductiveGroups Layers 0, 3 and 7 and OrthogonalSpinGroups, Layers 0–2, own algebraic groups, orthogonal isometries and their local structure; Completed RestrictedProducts, Layers 0–3, owns restricted-product maps and rational diagonals. RepresentationTheory/ClassicalGroups Layer 6 concerns finite-dimensional branching, not admissible Bessel models. ClassicalGroupsPartII, Layers CG.0–CG.3, concerns rational GSp representations and their characters; it does not duplicate this descent.

GanGrossPrasadUnitaryGroups §§1.1–1.3, 2.1–2.6 and 4.1–4.4 owns unitary relevant pairs, Bessel data, local uniqueness and global period definitions. Its §3.9 supplies the nonsplit tempered theorem on distinguished members and §3.11 its specified split range; §3.10 is a proposition outside the proved range. Import these without assuming a generic global period theorem. The orthogonal relative definitions and uniqueness comparisons required here are the orthogonal branches of §§0.1–0.3 and 1.4; their assertion on distinguished members remains the explicit hypothesis of §7.2. The broader orthogonal GGP endpoints assigned to GanGrossPrasadUnitaryGroups, Part II supply no input to this roadmap.

AutomorphicFormsOnReductiveGroups §§2.3, 2.6–2.7, 3.4–3.5 and 4.1–4.3 owns real induction, globalization, restricted tensors, constant terms and cuspidal-realization comparisons. SmoothRepresentationsOfLocalGroups SR.0–SR.4 owns the smooth category, normalized induction, Jacquet theory and Satake. AutomorphicLFunctionsAndLocalFactors AL.3–AL.4 owns general tensor factors, functional equations and factor operations: §3.5 below is their shifted-integral application, not another construction of these theories. Generic rational Fourier-support theory is a supplier continuation, whereas the special tower calculations stay here.

AutomorphicSpectralTheory §§0.15, 2.4–2.14 and 4.1–4.4 owns meromorphic operators, Eisenstein continuation, normalized intertwiners, Laurent calculus and the residual-spectrum criterion. In particular its §2.13 owns Jiang–Zhang intertwiner holomorphy; there is no second proof target here. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 owns the shared carriers for unitary local and global packets and pairings. ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23–3.25 supplies parameter/classification comparisons and generic standard modules on these carriers. Its §5.4 states classical GRS descent, including split odd-orthogonal irreducibility; §§6.3 and 7.3 below retain the comparison with the specified rational coefficient and induction, not a duplicate generic descent theorem. The rank, sign and determinant verification of §5.1 specializes the shared parameter constructor to this residual family.

LieHighestWeightPartII N0 and N2, respectively nilpotent-orbit and classical-partitions, own geometric nilpotent orbits and the orthogonal partition/very-even classification. Rational descent and dominance supplements are exact supplier contracts, not repetitions of that classification. Generic Hermitian complement and Witt geometry belongs to ReductiveGroupsPartII RG2.4; GeometryOfNumbersAndQuadraticArithmetic §2.9 supplies field-form data and adjoints, while GanGrossPrasadUnitaryGroups §1.1 supplies the field/split slot comparisons.

## Conventions

Let F be a number field. For orthogonal groups E=F; for unitary groups E/F is quadratic, with quadratic étale localization, including split E_v=F_v×F_v. Spaces are finite-dimensional, forms nondegenerate, embeddings isometric. G_V means SO(V) or U(V), and H_W means the group on W; H in a decomposition denotes a hyperbolic plane. Write d=dim_E V>0, m=dim_E W≥0 and V≃H^j orthogonal-sum Ee orthogonal-sum W, so d=m+2j+1. The actual Witt index r, label floor(d/2), and standard-dual dimension N are distinct: N=d−1 for odd SO, N=d otherwise. A nonsplit quasi-split SO_(2n) has r=n−1 (JZ2020, §2.1 pp.748–750 and §2.2 pp.750–754; JZ2020 line 408, line 490).

Hermitian forms are linear first: h(ax,by)=a c(b)h(x,y). Transport a conjugate-first supplier by swapping slots. For the local hyperbolic witness h(e,f)=h(f,e)=1, h(e,e)=h(f,f)=0. In the paper's quadratic normalization retain the Gram matrix of (2.1); converting a bilinear form to its quadratic map explicitly includes the factor of 2. Fix ψ_F on F\A_F, trivial on F and unitary; in the quadratic field branch fix δ∈E× of trace zero and ψ_E(x)=ψ_F(Tr_(E/F)(x/δ)/2). A split localization of δ is (t,−t), t≠0, so this character is nontrivial on both field factors. Fix rational flags, an actual anisotropic vector, the orbit, and quotient measures; geometric partitions alone supply none of these (JZ2020, (2.1), (2.11)–(2.14), pp.748,757–759; JZ2020 line 408, line 779, line 799).

Use right translations and B_ψ f(h)=∫_[N]f(nh)ψ(n)⁻¹dn, where [N]=N(F)\N(A_F) has volume 1. The bilinear period is P_ψ(f,g)=∫_[H]B_ψ f(h)g(h)dh; the Hermitian period is Q_ψ(f,g)=∫_[H]B_ψ f(h)conj(g(h))dh. Thus a bilinear pairing against π detects π∨ in the image. Complex conjugation identifies a unitary automorphic representation with its ordinary contragredient; conjugate self-duality over E/F does not identify it with that ordinary dual (JZ2020, (4.7), (5.6), pp.766,785; JZ2020 line 1141, line 2042; the complete comparison is §4.1).

Induction is normalized: I_s=Ind_(P_a)^(H_X),norm(τ|det|_E^s tensor σ), with section law δ_(P_a)^(1/2)|det|_E^s(τ tensor σ). Put X=H^a orthogonal-sum W. The critical data use a=N and j<a, k₀=a−j−1. The stabilizer is identified with the prescribed V, the ambient partition is [2k₀+1,1^d] of size 2a+m, and the even-SO inducing twist is t=Ad(w_q^k₀), t²=1. Inducing from σ^t gives σ in the inner period. All residual theorems require actual positive-rank inducing data and j<a; the general geometric definitions still include SO₁ and zero-dimensional W (JZ2020, (4.30)–(4.34), (5.7)–(5.9), pp.774–775,785–786; JZ2020 line 1532, line 2054).

For r_τ distinct cuspidal blocks, the residual form is the coefficient lim_(s→1/2)(s−1/2)^(r_τ)E(f_s,s). This is a single-variable Laurent coefficient. Some sections can give zero. The critical Fourier image may also vanish when the residual module is nonzero. A cuspidal Hilbert image uses a fixed unitary central character or a verified split-center quotient; quotienting by a center on which the function is not equivariant is undefined (JZ2020, Proposition 5.2, §6.1, pp.784,792; JZ2020 line 1998, line 2310; §1.1 supplies the image comparison).

All representations are complex; global inputs are unitary. Finite-place categories are smooth admissible, infinite-place categories Casselman–Wallach with continuous functionals and completed projective tensors. No algebraic representation is silently given a Hilbert or smooth topology. Vector and group universes may differ; constructions use the maxima of the supplier universes. Arithmetic and geometric Frobenius are compared by inversion before taking factors: with geometric norm q⁻¹ the eigenvalue factor is (1−αq^(−s))⁻¹; the arithmetic eigenvalue is α⁻¹. Actual finite residue sizes satisfy q≥2. All global factors are completed, including infinity; an incomplete product displays its omitted finite set S (JZ2020, §4.6 and (5.10)–(5.12), pp.780–787; JZ2020 line 1815, line 2090; AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison).

For even SO use the determinant-one group and the rational orthogonal normalizer's outer action. Count distinct representation classes: an outer-fixed class occurs once, a two-element orbit twice. Zero modules and trivial smaller groups are admitted where the defining geometry permits; an anisotropic vector must have nonzero norm. There is no assertion in positive characteristic or for degenerate forms.

**Checks.**

- On a Hermitian line h(i,1)=i and h(1,i)=−i; slot swapping the conjugate-first form gives these values, while reusing it gives −i at (i,1). For hyperbolic e,f, h(e+f,e+f)=2 and h(e−f,e−f)=−2.
- On a volume-one anisotropic U₁, a character χ with χ² nontrivial has Q(χ,χ)=1 and P(χ,χ)=0; P(χ,χ∨)=1. Changing the second vector by i multiplies P by i and Q by −i.
- With N trivial, B_ψ f(h)=f(h). For a two-term C₃ character sum, ψ(1)=ζ, f=(1,i), conjugation changes the sum 1+iζ⁻¹ to 1−iζ, fixing the inverse-character convention.
- For upper B in GL₂ and |a|=4, δ_B(diag(a,1))^(1/2)=2, not 1/2. At q=2, s=1 and eigenvalues 1,−1, the determinant polynomial is (1−T)(1+T)=1−T² and its L-value is 4/3.
- The data d=5,m=2,j=1,a=4 give k₀=2 and 2a+m−2k₀−1=5. Data a=1,j=2 give truncated k₀=0 but 2a+m−1=m+1, differing from m+5; the hypothesis j<a excludes them.
- SO₁ has N=0 and an index-zero geometric coefficient, but cannot satisfy a=N>j≥0 for the residual construction. Split SO₂ has no proper parabolics, yet the constant function has ∫_(R_+)1 dt/t=∞; vacuous constant-term vanishing does not give its Hilbert carrier.

## Exact supplier contracts

A contract marked gap: specifies mathematics required of its named owner before dependent theorems are proved. These contracts do not become arbitrary hypotheses containing the desired descent conclusion. The generic analytic/classification inputs precede applications to residual packets; no normalization proof uses the residual conclusion it is intended to establish.

### From Mathlib

Use `Nat.Partition` in `Mathlib/Combinatorics/Enumerative/Partition/Basic.lean`: its multiset has positive parts and prescribed sum; it carries no form, flag or rational orbit. Use `Representation.IntertwiningMap` in `Mathlib/RepresentationTheory/Intertwining.lean` only as an algebraic intertwiner carrier, with no built-in continuity, admissibility or analytic Bessel theory. Use `MeromorphicOn` in `Mathlib/Analysis/Meromorphic/Basic.lean` for normed-target meromorphic germs; it does not construct locally convex Eisenstein families. Their automorphic and locally convex comparisons are supplied below.

### From Tau Ceti

Use `TauCeti.RegularFormClass.wittDecomposition` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Decomposition.lean`, for regular finite-dimensional quadratic forms over a field with 2 invertible. It is a form-class decomposition; an isometry of a prescribed embedded complement is additional data. Use `TauCeti.QuadraticMap.specialOrthogonalGroup` and `TauCeti.QuadraticMap.det_reflection` in `TauCeti/LinearAlgebra/QuadraticForm/OrthogonalGroup/Basic.lean`: the first is the subgroup of linear equivalences preserving Q with determinant 1; the second requires a finite free module and a vector of invertible quadratic value and gives determinant −1. These declarations do not construct a Hermitian group or an automorphic realization.

Use `QuadraticMap.IsometryEquiv.exists_extension` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Extension.lean`, for an isometry of subspaces with nondegenerate restricted form in a finite-dimensional ambient quadratic space over a field with 2 invertible. Use `TauCeti.equivalent_of_equivalent_prod` in `TauCeti/LinearAlgebra/QuadraticForm/Witt/Cancellation.lean`: the cancelled quadratic summand is finite-dimensional and nondegenerate. The extension theorem does not require the ambient quadratic form to be nondegenerate, although this roadmap applies it to nondegenerate classical spaces. Both uses preserve the specified forms; neither replaces rational coordinates by abstract group isomorphisms.

### From TauCetiRoadmap.ReductiveGroupsPartII

Consume RG2.4, parabolics and Levi decompositions, only with its actual field and reductivity hypotheses. The Hermitian supplement excludes another form-carrier or adjoint construction.

What ReductiveGroupsPartII must provide (gap:hermitian-witt-complements): Supply Witt decomposition, extension and cancellation for nondegenerate finite-dimensional Hermitian spaces over every characteristic-zero field with quadratic étale coefficients, with prescribed complement isometries, arbitrary-form unitary groups and scalar-extension compatibility. The section contract is RG2.4.

### From TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic

Consume §2.9 field Hermitian forms and adjoints on finite-dimensional modules. The carrier and adjoint apply over any commutative field with involution; its odd-residue classification results are not used. GanGrossPrasadUnitaryGroups §1.1 performs the linear-first slot comparison and the split quadratic-étale comparison.

### From TauCetiRoadmap.LieHighestWeightPartII

Consume N0, nilpotent-orbit, and N2, classical-partitions, over their algebraically closed characteristic-zero fields. Base change to a closure does not recover rational conjugacy. Very-even O-orbits retain both SO labels.

What LieHighestWeightPartII must provide (gap:rational-nilpotent-orbits): Extend the geometric orbit carrier to rational classical nilpotent orbits and localization, distinguishing geometric, Galois-stable and rational conjugacy and retaining the two very-even SO labels. The section contract is N0, nilpotent-orbit.

What LieHighestWeightPartII must provide (gap:classical-dominance): Supply dominance and special-expansion comparisons for the regular and subregular partitions in the ranks of Section 7.4, without inferring rational or automorphic nonvanishing from geometric admissibility. The section contract is N2, classical-partitions.

### From TauCetiRoadmap.GanGrossPrasadUnitaryGroups

Consume §§1.1–1.3 for framed relevant Hermitian pairs, relative subgroups, characters and transport; §§2.1–2.6 for model spaces, continuous dual comparison and all-odd-codimension uniqueness; §§4.1–4.4 for periods, convergence and coherent parameter comparisons. The local theorem on distinguished members in §3.9 is nonsplit tempered; the split theorem is §3.11 in its exact stated range. An application outside those ranges retains the §7.2 local proposition as a mathematical hypothesis. The identity Q(f,g)=P(f,conj g) uses the supplier's right action and dual convention; the U₁ witness in Conventions applies on both sides. No global GGP endpoint is a premise of recovery.

### From TauCetiRoadmap.SmoothRepresentationsOfLocalGroups

Consume SR.0.1–SR.0.4 for smooth categories and contragredients, SR.2.1–SR.2.3 for normalized induction, Jacquet filtrations and character coinvariants, SR.3.1–SR.3.3 for support/temperedness, SR.4.1–SR.4.4 for Satake and unramified unitary groups. Restriction to a Bessel subgroup and the character quotient use these actual actions. The ordinary Jacquet filtration does not by itself compute the twisted quotient needed in §§5.4 and 5.7.

What SmoothRepresentationsOfLocalGroups must provide (gap:twisted-jacquet-filtration): Compare the geometric lemma and induction in stages with character-twisted Jacquet quotients for determinant-one orthogonal and split or nonsplit unitary groups over every finite extension of Q_p. The section contract is SR.2.2, geometric-lemma.


What SmoothRepresentationsOfLocalGroups must provide (gap:spherical-whittaker-normalization): Supply hyperspecial Satake, spherical Whittaker and Cartan-volume formulas with normalized induction and specified Haar measures for every residue characteristic, including split unitary GL groups and unramified nonsplit forms. The section contract is SR.4.1–SR.4.4.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

Consume §§2.3, 2.6 and 2.7 for real normalized induction, the archimedean generic unitary-dual theorem, Casselman–Wallach globalization and Dixmier–Malliavin; §§3.4–3.5 for restricted tensors and spherical lines; §§4.1–4.3 for constant-term transitivity, cuspidal realizations, Petersson pairings and GL Whittaker models. Its §4.2 adapters retain the supplied fixed-central-character or split-center-quotient spectrum. This roadmap must show its own images lie there; split SO₂ is the negative control in §1.1.

What AutomorphicFormsOnReductiveGroups must provide (gap:rational-fourier-support): Supply generalized rational-nilpotent Fourier maps, root exchange, support and maximal-support carriers on actual automorphic realizations, with continuous constant-term comparisons and the topology for a verified cuspidal Hilbert closure. The section contract is 4.1–4.2, rational Fourier continuation.

What AutomorphicFormsOnReductiveGroups must provide (gap:bessel-restriction-growth): Supply convergence and continuity of cuspidal Bessel periods against moderate-growth forms and restriction estimates into fixed-central-character or split-center-quotient Hilbert carriers, with all archimedean and split-torus cases. The section contract is 4.1–4.2, restriction and cuspidal realization.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

Consume AL.3, whittaker-model, rs-global-poles, rs-global-functional-equation, rs-boundary-nonvanishing and isobaric-strong-multiplicity-one; AL.4, l-group-local-factor, local-parameter-comparison and satake-factor-operations. GL tensor and supplied parameter equalities retain the source hypotheses. A general Satake determinant is not ramified LLC. For ρ=∧², the pair (x,y) gives xy; for ρ=Sym² it gives x²,xy,y². The local signed-Asai and completed-type supplements below supply exactly the additional all-place assertions. No arbitrary functorial transfer is inferred from a factor identity.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:all-place-signed-factors): Supply all-place tensor and signed Asai factors, tempered positive-half-plane regularity and standard-module multiplicativity with archimedean Gamma shifts and the actual unipotent-radical L-representation for the induction used here. The section contract is AL.4, local-parameter-comparison.

What AutomorphicLFunctionsAndLocalFactors must provide (gap:type-poles-and-cross-factor): Supply the self-dual and conjugate-self-dual type-pole dichotomy, the distinct-block cross-factor regularity and the completed normalizer-factor identity in the bilinear conventions of Section 4.1. The section contract is AL.3–AL.4, poles and factor operations.

### From TauCetiRoadmap.AutomorphicSpectralTheory

Consume §0.15 continuous Laurent coefficient operators after common-denominator regularization; §§1.1–1.5 for induced Hilbert data; §§2.4–2.7 for continued Eisenstein families and constant terms; §2.8 Shahidi normalization; §§2.9–2.13 generic standard-module and normalized-intertwiner results; §2.14 isobaric realization; §§4.1–4.4 residual-spectrum and square-integrability criteria. In §2.8 the convention is N_v=β_v M_v with β_v=L_v(1+s,τ×σ)L_v(1+2s,τ,ρ)ε_v(s,τ×σ)ε_v(2s,τ,ρ)/(L_v(s,τ×σ)L_v(2s,τ,ρ)). Both epsilon factors multiply in the numerator. At unramified SO₃ with q=2, trivial GL₁ data and s=1/2, M's spherical scalar is 3/2 and β=2/3, hence N has scalar 1. In the unitary case §4.1 must identify the actual cross-factor representation before this symbolic formula is used. Nonzero individual factors of an operator composition are insufficient: diag(1,0) and diag(0,1) have zero product.

What AutomorphicSpectralTheory must provide (gap:isobaric-eisenstein-continuation): Supply the Eisenstein continuation and constant-term formulas for unitary generic isobaric GL inducing data and the moderate-growth noncuspidal smaller datum permitted by the unfolding, with holomorphic smooth sections. The section contract is 2.4–2.7 and 2.14.

What AutomorphicSpectralTheory must provide (gap:all-place-intertwiner-comparison): Supply the holomorphic nonzero normalized intertwiner on Re(s) at least one half for the exact inner-form components, including archimedean and split unitary cases and a nonzero composition argument independent of the conclusions about residual packets. The section contract is 2.8–2.13.

### From TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison

Consume §§11.2–11.4 for tempered and positive-exponent local unitary packets with inner-twist pairings and the interface for generic global packets. Keep every classification-input and Whittaker-normalization premise. The generic global theorem there is for CM extensions and pure inner twists; it does not prove an all-number-field or nongeneric statement. The extended local construction retains the actual induced module, possibly reducible, until a separate irreducibility theorem applies. At split places the ordinary pure-inner forms used here are split GL groups; no division-algebra form is inserted into a Hermitian pair. GanGrossPrasadUnitaryGroups makes the relative normalization comparison; ModularityAndLanglandsExtensions supplies its stated classification theorems and the additional residual/general-field contract below. No second carrier for these packets is constructed here.

### From TauCetiRoadmap.ModularityAndLanglandsExtensions

Consume §§3.3–3.4 type/pole comparisons, §3.8 actual global Arthur parameters, §§3.12 and 3.16 unitary classification, §3.15 local packets, §3.17 quasi-split multiplicity, §3.18 orthogonal Vogan packets, §3.23 generic inner-form multiplicity and §3.25 generic standard modules. Every classification premise, local intertwining condition and coherent inner form is retained. Consume §5.4 classical GRS descent with its exact group and genericity scope. Comparing that module with this normalized residual coefficient is a new comparison, not an invocation of almost-everywhere transfer as a concrete-module proof.

What ModularityAndLanglandsExtensions must provide (gap:nongeneric-residual-packets): Supply membership in nongeneric residual packets and the necessary cuspidal-support and irreducibility theorems for the parameter built from two-dimensional SL₂ blocks on the specified inner forms, separately for the constructed residue and every discrete member of those packets. The section contract is 3.8, 3.12, 3.15–3.18, 3.22–3.25.

What ModularityAndLanglandsExtensions must provide (gap:coherent-classical-parameters): On the shared carriers for packets, prove comparisons of coherent generic global packets, generic discrete-member cuspidality, standard base change and its almost-everywhere uniqueness for all relevant orthogonal and unitary inner forms with the exact classification premises and dual or outer transport. The section contract is 3.8, 3.12, 3.15–3.18, 3.23.

## How to read the build

Layer 0 identifies the rational form, flag, orbit and prescribed embedding. Layer 1 constructs the actual Fourier images and proves their first-occurrence and multiplicity properties. Layer 2 unfolds both index regimes; Layer 3 constructs all-place local integrals and establishes their Euler and spherical formulas. Layer 4 applies the exact dual dictionary and single-variable Laurent theory to reciprocal periods and central values. Layer 5 constructs the critical descent and proves its conditional cuspidal structure; Layer 6 supplies support witnesses and period existence; Layer 7 recovers the specified cuspidal module under Generic Summand and the exact local hypothesis on distinguished members. Suggested.lean records only headline theorems statable on the pinned carriers, with missing carriers identified in its module docstring. Arithmetic dimension identities and the Checks below belong to this roadmap's specification, not to that acceptance file.

## Layer 0: Rational Bessel coordinates

### 0.1 Classical-group coordinate comparison

For V=H^r ⊥ V_an of dimension d over E, identify the paper’s matrix group with SO(V) or U(V) from the shared relevant-pair interface. Here r is the actual Witt index, n=floor(d/2) is only a label, and the standard-dual dimension is N=d−1 for odd SO and N=d otherwise. Transport the flag parabolics and their Levi factors `Res_(E/F)(GL_j) x Isom(V_(j))^0` with their normalized induction modulus. The quasi-split nonsplit even orthogonal group has r=n−1. All group identifications are over F and commute with localization. (JZ2020, §2.1, pp.748–750; §4.1, pp.764–765; JZ2020 line 408).

For the orthogonal branch define a framed relevant pair to be the actual isometric embedding W→V together with an isometry of its perpendicular to H^j orthogonal-sum Ee, q(e)≠0. Use SO(V) rather than O(V). The unitary framed pair and these transport operations are imported from GanGrossPrasadUnitaryGroups §1.1. The orthogonal framed pair has the following API.

- Forgetting the frame retains the actual isometric embedding and the odd-dimensional complement condition.
- Scalar extension sends both the embedding and its chosen complement isometry to the corresponding local pair, including dimension zero on W.
- A specified isometry of pairs intertwines the two stabilizer embeddings; equality of dimensions alone supplies no transport.

A proof route is as follows. Use the supplied quadratic Witt decomposition and the supplied hermitian analogue, with the specified linear-first/antilinear-first conversion. Write the block isometry equations in a dual isotropic basis and compare to the determinant-one quadratic group. Compute the modulus using the action on the unipotent Lie algebra.

*Needs:* GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); `TauCeti.RegularFormClass.wittDecomposition`; `TauCeti.QuadraticMap.specialOrthogonalGroup`; GeometryOfNumbersAndQuadraticArithmetic §2.9 (field-form data); ReductiveGroupsPartII RG2.4 (gap:hermitian-witt-complements); GanGrossPrasadUnitaryGroups §1.1 (slot and split comparison).

**Checks.**

- A quasi-split nonsplit SO₄ has Witt index 1, not 2.
- For SO₅ the standard transfer is to GL₄; for U₅ it is to GL₅.
- For a split rank-zero smaller space, dim W=0 and H_W is trivial; a relevant line has d=1 and j=0. A zero-dimensional V cannot contain the required anisotropic vector.

### 0.2 Bessel partition

For natural numbers d, ℓ with 2ℓ+1≤d, set p_ℓ(d)=[2ℓ+1,1^(d−2ℓ−1)] as a Nat.Partition d. Its admissibility for a chosen classical form additionally requires a flag of length ℓ and an anisotropic vector in its nonzero middle space. These data are not inferred from floor(d/2). For ℓ=0 the partition is [1^d]; the chosen Bessel subgroup remains the orthogonal complement of the chosen anisotropic vector. (JZ2020, §2.3, equation (2.9), pp.755–756; §2.4, pp.757–759; JZ2020 line 694).

The construction has the following API.

- The parts multiset is {2ℓ+1} plus d−2ℓ−1 ones.
- The sum of the parts is d.
- The number of parts is d−2ℓ.
- At ℓ=0 the partition is the existing partition of d into ones; the geometric Bessel coefficient is separately restriction to the chosen subgroup.

A proof route is as follows. Construct the multiset with one odd part and d−2ℓ−1 copies of 1. Its sum is d and every part is positive. Use the shared flag and anisotropic-vector datum for relevance; do not equate an orbit’s full Levi stabilizer with the chosen Bessel subgroup.

*Needs:* `Nat.Partition`; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); §0.1.

**Checks.**

- The ones exponent is d−2ℓ−1.
- Validity excludes ℓ=d/2 in split even dimension.
- d=5, ℓ=1 gives [3,1,1], of size 5 and length 3.
- d=3, ℓ=0 gives [1,1,1]; its stabilizer defining space has dimension 2, although the nilpotent is zero. The algebraic group SO₂ has dimension 1 and U₂ has dimension 4.
- d=4, ℓ=2 is not admissible: the proposed leading part 5 exceeds 4.

### 0.3 Rational Bessel orbit comparison

For each Bessel datum (isotropic flag, anisotropic w in the middle space), compare its explicit unipotent character with the generalized Fourier character attached to a rational nilpotent orbit of geometric partition p_ℓ(d). Give the F-rational conjugacy equivalence and its localization; distinguish a geometric orbit, a Galois-stable geometric orbit and an orbit of G(F). On unitary groups use `psi_E(x) = psi_F(Tr_(E/F)(x/delta)/2)` for E=F(δ), δ²∈F× and Tr(δ)=0, as in (2.12) and the chosen Hermitian convention. At ℓ=0 the general nilpotent coefficient is restriction of the form before restricting its group action to Isom(w⊥)°. (JZ2020, §2.3, pp.754–756; §2.4, (2.11)–(2.13), pp.757–758; JZ2020 line 775).

For the orthogonal branch form the flag-fixing unipotent N_ℓ and its character from the adjacent flag coordinates and the final pairing with w, evaluated by ψ_F; at ℓ=0 put N₀=1 and use restriction. The corresponding unitary datum and character transport are imported from GanGrossPrasadUnitaryGroups §§1.2–1.3. The geometric orbit of zero has the full ambient stabilizer, while the chosen index-zero Bessel subgroup is an additional restriction; they are distinct constructions. The orthogonal datum has the following API.

- Its pointwise flag-and-vector stabilizer acts on the coefficient through its specified embedding in the middle classical group.
- An actual rational conjugation transports the unipotent, character and stabilizer action together.
- Localization preserves the embedding, character and rational orbit map, including index zero.

A proof route is as follows. Use the supplied rational nilpotent/generalized Fourier interface, not the algebraically closed classification alone. Write the character as the sum of adjacent flag coordinates and the last pairing with w, evaluated by the specified additive character. Verify compatibility with the generalized-character construction and conjugation.

*Needs:* §0.2; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); LieHighestWeightPartII N0, nilpotent-orbit (gap:rational-nilpotent-orbits); LieHighestWeightPartII N2, classical-partitions; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth).

**Checks.**

- A single partition can have several rational orbits.
- The two very-even SO geometric orbits are not silently merged, nor assumed individually F-stable.
- For E=F(δ), x=δ gives Tr(x/δ)/2=1, whereas x=1 gives trace 0. Thus ψ_E(δ)=ψ_F(1)=1 globally, and on a local coefficient tδ its value is ψ_F(t); the untwisted trace would interchange these coordinates.
- For d=4,ℓ=1 with fixed hyperbolic middle plane q(x,y)=2xy, vectors (1,1/2) and (1,−1/2) have values 1 and −1; over R their perpendicular lines have opposite signatures even though the ambient partition [3,1] is the same.

### 0.4 Anisotropic-vector normal form

For ℓ<r, every anisotropic w in V_(ℓ) is carried by an F-rational isometry of V_(ℓ) to `e_r + (-1)^(d+1) kappa/2 * e_(-r)` for some κ∈F×, using the basis and form normalization of (2.1). In the SO case the isometry can be chosen proper by composing with a reflection in a nonisotropic vector perpendicular to the image. The image has the same form value as w; the assertion does not choose a square root in F. The boundary ℓ=r uses the actual anisotropic kernel instead of this hyperbolic normal form. (JZ2020, Lemma 2.4 and its proof, pp.758–759; JZ2020 line 848).

A proof route is as follows. Extend the isometry between the nondegenerate lines by Witt extension; the Hermitian extension is supplied under gap:hermitian-witt-complements by ReductiveGroupsPartII RG2.4. In the quadratic case adjust determinant using a reflection fixing the image vector. The middle space has dimension at least 2 here, so its nondegenerate perpendicular contains such a vector.

*Needs:* §0.1; `QuadraticMap.IsometryEquiv.exists_extension`; `TauCeti.QuadraticMap.det_reflection`; GeometryOfNumbersAndQuadraticArithmetic §2.9 (field-form data); ReductiveGroupsPartII RG2.4 (gap:hermitian-witt-complements); GanGrossPrasadUnitaryGroups §1.1 (slot and split comparison).

**Checks.**

- κ/2 is division by 2, not a subscript or an exponent.
- No hyperbolic vector normal form is asserted for an anisotropic middle space.
- In the sign-+ branch on a hyperbolic plane with q(xe+yf)=2xy, y_κ=e+(κ/2)f has q(y_κ)=κ and its perpendicular generator e−(κ/2)f has value −κ. For κ=2 these values are 2 and −2.
- For the anisotropic real line q(x)=x² there is no hyperbolic pair; ℓ=r=0 must use the kernel, not the displayed hyperbolic normal form.

### 0.5 Bessel stabilizer and Witt index

For V=H^ℓ ⊥ V_(ℓ) and anisotropic w∈V_(ℓ), the chosen Bessel subgroup is H=Isom(V_(ℓ)∩w⊥)°, embedded by fixing the flag and w; its defining space has dimension d−2ℓ−1. If ℓ<r and w=y_κ in the normal form, the new anisotropic part is the anisotropic part of V_an ⊥ `E y_(-kappa)`. Its Witt index is r−ℓ when E y_κ is represented in V_an and r−ℓ−1 otherwise. At ℓ=r it is the corresponding perpendicular in V_an. For U(V) this H is the subgroup fixing the flag vectors, not the full character stabilizer inside the Levi, which also has a norm-one central torus. (JZ2020, §2.4, (2.13)–(2.14), Proposition 2.5, pp.758–759; JZ2020 line 856).

A proof route is as follows. Split off the hyperbolic planes and the line Ew and apply Witt cancellation. For the Witt index increase, V_an ⊥ `E y_(-kappa)` is isotropic exactly when V_an represents the value of y_κ. Check the sign by the equation `q(v) + q(y_(-kappa)) = 0`. Compare the pointwise flag-and-vector stabilizer with the matrix embedding; retain the extra unitary central stabilizer rather than identifying it with H.

*Needs:* §0.4; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); `TauCeti.equivalent_of_equivalent_prod`; GeometryOfNumbersAndQuadraticArithmetic §2.9 (field-form data); ReductiveGroupsPartII RG2.4 (gap:hermitian-witt-complements); GanGrossPrasadUnitaryGroups §1.1 (slot and split comparison).

**Checks.**

- For V_(ℓ) a hyperbolic plane, its anisotropic-line perpendicular has Witt index 0.
- The representation criterion uses y_κ rather than `y_(-kappa)`.
- With real anisotropic kernel <1> and κ=1, <1> orthogonal-sum <−1> has Witt index 1; with κ=−1 the sum <1,1> has index 0. This rejects the reversed representation sign.
- For unitary flag length 1, scalar −1 centralizes every unipotent element but sends its flag vector e to −e; full character stabilization does not imply pointwise flag fixation.

### 0.6 Ambient datum for a prescribed relevant pair

Given a specified relevant pair W⊂V with V≅H^j ⊥ Ee ⊥ W, choose a>j and set X=H^a ⊥ W and k=a−j−1. Construct a rational Bessel datum of index k in Isom(X)° and an F-isometry of its stabilizer space with V, compatible with the given inclusion W⊂V. Its dimension is 2a+dim W−2k−1=dim V. Export the induced coordinate maps, the rational orbit, localizations and the even-SO normalizer action t=Ad(w_q^k), with w_q²=1. The chosen input on W is σ^t, so that the unfolded inner period has σ. (JZ2020, Proposition 2.6, p.759; §4.4, (4.30)–(4.34), pp.774–775; §5.2, (5.7)–(5.9), pp.785–786; JZ2020 line 867).

The construction has the following API.

- The specified stabilizer-space isometry intertwines its W-inclusion with the original one.
- Localization gives the same relevant-pair datum over each F_v, with the same character and normalizer.
- t² acts trivially on representation isomorphism classes and the inner-period datum from σ^t has σ.

A proof route is as follows. Use k hyperbolic planes of X for the flag and the remaining j+1 planes to place a line whose perpendicular is H^j ⊥ Ee. Supply a coordinate isometry realizing the original embedding. Record the normalizer element in that coordinate isometry; transport σ only once by t. Proposition 2.6 alone gives occurrence, so the compatibility with a prescribed embedding must be checked as part of this construction.

*Needs:* §0.5; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal).

**Checks.**

- For dim V=5, dim W=2, j=1, a=4, k=2 the stabilizer dimension is 5.
- Composing the outer twist twice restores the original datum.
- d=5,m=2,j=1,a=4 gives ambient dimension 10, k=2 and leading part 5.
- a=j+1 gives k=0 and ambient dimension d+1, with the stabilizer its prescribed anisotropic-line complement.
- An isomorphism of abstract stabilizer groups without matching W⊂V does not satisfy the constructor contract.

### Examples

Dimensions d=5,m=2,j=1,a=4 give ambient size 10, critical index 2 and partition [5,1^5]. At a=j+1 the index is 0 and the ambient dimension is d+1; the complement is the specified line, not a canonically chosen group.

### Dependencies

This layer uses GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); `TauCeti.RegularFormClass.wittDecomposition`; `TauCeti.QuadraticMap.specialOrthogonalGroup`; GeometryOfNumbersAndQuadraticArithmetic §2.9 (field-form data); ReductiveGroupsPartII RG2.4 (gap:hermitian-witt-complements); GanGrossPrasadUnitaryGroups §1.1 (slot and split comparison); `Nat.Partition`; LieHighestWeightPartII N0, nilpotent-orbit (gap:rational-nilpotent-orbits); LieHighestWeightPartII N2, classical-partitions; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); `QuadraticMap.IsometryEquiv.exists_extension`; `TauCeti.QuadraticMap.det_reflection`; `TauCeti.equivalent_of_equivalent_prod`. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 1: Fourier images and first occurrence

### 1.1 Bessel Fourier module

For a specified automorphic embedding C_π of an irreducible representation and a rational Bessel datum O, let B_O(C_π) be the image of C_π under the shared Fourier map f↦[h↦∫_[N] f(nh)ψ(n)^(−1)dn], with its right H(A)-action. Its algebraic span is a right H(A)-module of smooth, left H(F)-invariant functions of moderate growth. Central equivariance and finiteness under the center of the archimedean enveloping algebra are additional properties to prove when a consumer requires them. When the image is cuspidal and lies in a specified cuspidal L² carrier, also form its Hilbert closure there (the image/carrier comparison in §1.1 specifies the central-character issue); distinguish this closure from the smooth image. Record Fourier support p(C_π) by existence of a nonzero rational-orbit coefficient of each relevant geometric partition, and its maximal elements p^m(C_π) in dominance order, using the supplied general Fourier-support interface. (JZ2020, §2.3, (2.8)–(2.10), pp.754–756; §6.2, (6.9), p.802; JZ2020 line 664).

The image/carrier comparison has a precise target: prove central equivariance and square integrability for every image to which the discrete decomposition is applied. For a split-torus stabilizer, if one central character does not contain the whole image, construct its direct integral and the Mellin transform on a specified dense smooth test domain. Prove that the convergent period is evaluation at the prescribed unitary character and is continuous for that test topology; a singleton of the continuous spectrum is not asserted to have a nonzero orthogonal projection. Prove that these character evaluations suffice for the period-witness steps, and independently place every critical image used for module recovery in a verified fixed-character carrier or a justified sum of such carriers. No assertion of a discrete sum for a non-equivariant unrestricted image follows from vanishing constant terms. A positive split-center direction uses dt/t, so the constant function has infinite squared norm.

The construction has the following API.

- The Fourier map C_π→B_O(C_π) is surjective onto the smooth image.
- For h∈H(A), B_O(R(h)f)=R(h)B_O(f).
- B_O(C_π)=0 exactly when every coefficient of vectors in that realization is zero.
- In a verified cuspidal L² carrier, the smooth image is dense in its Hilbert closure with the inherited right unitary action; a central quotient requires actual equivariance.

A proof route is as follows. Take the image of the specified equivariant linear map; transport its action through the explicit stabilizer identification. Use the supplied support/dominance interface for arbitrary partitions. Take the Hilbert closure only after cuspidality and square-integrability are established.

*Needs:* GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); gap:bessel-restriction-growth; §0.3; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth).

**Checks.**

- The module depends on its realization when a representation has multiple automorphic copies.
- Changing a rational orbit requires a specified conjugation map, not just equality of partitions.
- At ℓ=0, N=1 and B_O(f) is f restricted to H(A); it is not an integral over the whole ambient group.
- Replacing ψ by ψ^(−1) gives `B_(psi^(-1))(conj f) = conj(B_psi(f))`.
- Two embeddings of the same abstract π are retained as different inputs; equality of π alone cannot identify their support.

### 1.2 First occurrence index

For a nonzero irreducible cuspidal realization C_π⊂L²_cusp(G), define ℓ₀(C_π) to be the largest valid Bessel index ℓ for which some rational datum has B_O(C_π)≠0. Valid means the datum exists, in particular 2ℓ+1≤d and ℓ≤r. The set is nonempty: at ℓ=0 a right translate of a nonzero form has nonzero restriction to the chosen H. Select the index, not a canonical rational orbit. Keep every rational first-occurrence datum as a separate argument. (JZ2020, Proposition 2.2, pp.756–757; JZ2020 line 715).

The construction has the following API.

- There exists a rational datum at ℓ₀ with a nonzero coefficient.
- For every valid ℓ>ℓ₀ and every rational datum at ℓ, B_O(C_π)=0.
- An intertwining equality of the actual automorphic embeddings and orbit data preserves ℓ₀; an abstract isomorphism alone is insufficient.

A proof route is as follows. The finite valid-index set contains 0 by right translation of a nonzero form. Take its maximum. This construction uses no genericity of π, and does not assert a realization-independent index.

*Needs:* §1.1; §0.2.

**Checks.**

- First occurrence is maximal in the paper’s index convention.
- The zero automorphic subspace has empty nonzero support and no largest supported index; the nonzero irreducible realization hypothesis excludes it.
- Zero coefficients at indices above ℓ₀ are quantified over all rational data.
- If r=0 and d>0 then ℓ₀=0.
- A support set of Bessel indices {0,2} gives ℓ₀=2, not 0.
- For a split 4-dimensional quadratic space, ℓ=2 cannot occur even though its Witt index is 2.

### 1.3 First-occurrence cuspidality

For any cuspidal realization C_π and every rational first-occurrence Bessel datum O at ℓ₀(C_π), B_O(C_π) is cuspidal on its chosen H: each constant term along every proper F-parabolic of H vanishes. If the image lies in the required L² carrier, its Hilbert closure is nonzero for a datum witnessing first occurrence. This additional spectral condition is the image/carrier comparison in §1.1 in the split-center case. This assertion includes inner forms and unitary groups with the given character conventions. (JZ2020, Proposition 2.2, p.756, citing Ginzburg–Rallis–Soudry Theorem 7.3; JZ2020 line 715).

A proof route is as follows. Expand every proper rational constant term by the supplied root-exchange and Fourier-expansion comparisons. Identify the resulting terms as higher-index coefficients or ambient cuspidal constant terms, hence zero. Prove this tower calculation on every inner form and at index zero, with the smooth archimedean topology. The general template is GRS2011, Theorem 7.3; the inner-form and unitary calculation is part of this theorem.

*Needs:* §1.2; AutomorphicFormsOnReductiveGroups §4.1 (constant-term comparison); AutomorphicFormsOnReductiveGroups §4.2 (cuspidal realization and supplied decay); gap:bessel-restriction-growth; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth).

**Checks.**

- A nonmaximal Bessel coefficient need not be cuspidal.
- Every proper rational parabolic is covered, not just the Siegel parabolic.
- For a torus, the family of proper parabolics is empty, so every constant-term condition is vacuous; the split SO₂ constant function has infinite dt/t norm.

### 1.4 Multiplicity-free Bessel decomposition

If a Bessel image of a single irreducible automorphic realization lies in the supplied discrete cuspidal Hilbert spectrum with compatible central-character data, its Hilbert closure is a Hilbert direct sum of irreducible cuspidal H(A)-representations with each isomorphism class occurring at most once. The smooth module embeds densely in this decomposition. The statement concerns the image, not all copies of those constituents in L²_cusp(H). (JZ2020, §2.3, equation (2.10), p.756; Theorem 6.6, pp.799–800; JZ2020 line 731).

In addition, For a split SO₂ stabilizer, prove the central-character/discrete-spectrum comparison the image/carrier comparison in §1.1; constant-term cuspidality alone does not supply it.

Establish the orthogonal local input on the same character datum: for every characteristic-zero local field and every relevant orthogonal pair with irreducible admissible complex representations, the Bessel Hom space is finite-dimensional of dimension at most 1; at infinity use Casselman–Wallach representations and continuous completed-tensor Hom. Prove the determinant-one comparison rather than replacing SO by O. At finite places use AGRS2010, Theorem 1′, with the higher-codimension induction reduction; at infinity JSZ2010, arXiv v2 Theorem A, PDF pp.1–2, JSZ2010 line 24, states the O-group case, whose restriction/extension comparison to SO is an additional step. Unit conditions, rational characters and duals persist in this reduction. This local theorem is independent of the global assertion on distinguished members in §7.2.

A proof route is as follows. Apply the imported discrete cuspidal spectral decomposition to the closed image. A repeated constituent would give two independent global Bessel maps. Factor at one place using fixed vectors elsewhere and local uniqueness, with the continuous archimedean tensor product topology.

*Needs:* §1.1; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); SmoothRepresentationsOfLocalGroups SR.2.2; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; AutomorphicFormsOnReductiveGroups §4.2 (fixed-central-character discrete carrier); §1.1 (image comparison); AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensors).

**Checks.**

- The sum is a Hilbert sum, not an asserted finite algebraic sum.
- No multiplicity-one assertion for the full even-SO automorphic spectrum is used.
- If a putative closed image is σ⊕σ, its two coordinate projections give two independent Bessel maps, contradicting dimension at most 1; σ⊕ρ with σ not isomorphic to ρ has one map to each and is allowed.

### 1.5 Generic Summand proposition

For a cuspidal isomorphism class π with a G-relevant generic discrete global parameter φ, the Generic Summand proposition for π is the proposition that there exist an automorphic realization C_π, a rational first-occurrence datum O at ℓ₀(C_π), a cuspidal σ on H_O with a relevant generic discrete global parameter, a realization C_σ, and vectors f∈C_π,g∈C_σ with Q_O(f,g)=∫_[H_O] B_O(f)(h)conj(g(h))dh≠0. It is an existence proposition (Conjecture 2.3), not an axiom or a theorem for all generic packets. (JZ2020, Conjecture 2.3, pp.756–757; §7.1, pp.807–808; JZ2020 line 743).

The construction has the following API.

- A proof supplies C_π,O,σ,C_σ,f,g with the stated first-occurrence and nonvanishing properties.
- Using first-occurrence cuspidality and the verified discrete Hilbert carrier of the image/carrier comparison in §1.1, a witness gives a nonzero projection onto the σ-isotypic subspace.
- Q_O(f,g)=P_O(f,conj g), so its local bilinear models involve σ∨, not automatically σ.

A proof route is as follows. Form the quantified proposition using the actual automorphic embeddings and Hermitian branch of the shared period. Theorems proving particular cases must supply these witnesses. Relating it to the paper’s bilinear unfolding requires the pairing dictionary in Layer 4.

*Needs:* §1.2; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- Generic parameter does not mean the representation has a Whittaker model.
- The choice is existential in C_π; no assertion is made for every copy.
- For a nonquadratic character χ of an anisotropic U₁, ∫χ·conjχ is its positive volume, while ∫χ·χ=0.
- A generic constituent at an index strictly below ℓ₀ is not a witness.
- One witnessing realization suffices even when the cuspidal multiplicity is two; the definition is not universal in realizations.

### Examples

An anisotropic input has r=0, first occurrence 0 and restriction as its coefficient. An abstract support set {0,2} has maximal index 2; it selects no rational orbit. On a volume-one U₁ character the Hermitian projection has value 1 while its self-bilinear period is 0.

### Dependencies

This layer uses GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; §0.3; AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); §0.2; AutomorphicFormsOnReductiveGroups §4.1 (constant-term comparison); AutomorphicFormsOnReductiveGroups §4.2 (cuspidal realization and supplied decay); gap:bessel-restriction-growth; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; AutomorphicFormsOnReductiveGroups §4.2 (fixed-central-character discrete carrier); §1.1 (image comparison); AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensors); ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison). The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 2: Bessel–Eisenstein unfolding

### 2.1 Bessel–Eisenstein zeta integral

Let X=H^a⊥W with dim W=m, H_X=Isom(X)°, and P_a its flag parabolic with Levi `Res_(E/F)(GL_a) x H_W`. For an irreducible unitary generic isobaric τ on GL_a(A_E) and an irreducible automorphic σ on H_W with a specified realization, use normalized induction `I_s = Ind_(P_a(A))^(H_X(A))(tau |det|_E^s tensor sigma)`, including `delta_(P_a)^(1/2)`. Let E(f_s,s) be the meromorphic Eisenstein family, defined from the isobaric inducing data through the imported continuation theory. For a valid rational Bessel datum of index ℓ on H_X, with stabilizer G and cuspidal realization C_π on G, put `Z(s,f_s,v) = P_ell(E(f_s,s),v) = integral_[G] B_ell(E(f_s,s))(g) v(g) dg`. This is the bilinear period. Normalize the compact unipotent quotient to volume 1 and retain a compatible Haar measure on [G]. (JZ2020, §4.1, (4.1)–(4.10), pp.764–767; JZ2020 line 1092).

The construction has the following API.

- For fixed s in the convergence region, Z is linear in both the section and the cuspidal vector.
- The global map belongs to `Hom_(G semidirect N)(I_s, pi^vee tensor psi)` with the bilinear convention.
- For holomorphic sections Z is meromorphic; it is holomorphic wherever this Eisenstein family is holomorphic.

A proof route is as follows. Use the existing normalized induced representation and Eisenstein family; σ need not be cuspidal for the geometric unfolding, but the applications in Layers 4–7 impose cuspidality. Compose the Eisenstein Fourier map with the imported convergent period functional; use cuspidal decay on the Bessel subgroup to extend it meromorphically.

*Needs:* §0.6; AutomorphicSpectralTheory §§1.1–1.5 and §2.4 (normalized induced family); AutomorphicSpectralTheory §2.14 (isobaric automorphic realization); AutomorphicSpectralTheory §§2.4–2.7 (gap:isobaric-eisenstein-continuation); GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and gap:bessel-restriction-growth; AutomorphicSpectralTheory §§2.4–2.14 (gap:isobaric-eisenstein-continuation).

**Checks.**

- The π argument is not conjugated in Z.
- Restriction to a Bessel subgroup has its own decay theorem; ambient rapid decay is not by itself its proof.
- Removing δ_P^(1/2) changes the s-shift in the Euler factor, so does not give this integral.
- At ℓ=0 the Fourier map is restriction and Z is the bilinear integral of restricted E times v.
- Multiplying v by i multiplies Z by i, whereas replacing the bilinear period by a Hermitian pairing in that argument gives −i.

### 2.2 Bessel functional factorization

For factorizable global data and s where each relevant local induced module is irreducible, the local spaces `Hom_(G_v semidirect N_v)(I_(s,v), pi_v^vee tensor psi_v)` have dimension at most 1. If Z is nonzero, fix nonzero local functionals and normalized unramified vectors. Then `Z = c * product_v l_v(f_(s,v),v_v)` for one nonzero scalar c depending on those choices. The explicit Euler integrals give its meromorphic continuation in s. Absorbing c into one ramified functional is permitted only when recorded. No uniqueness assertion for every reducible `I_(s,v)` is made. (JZ2020, §4.1, (4.11)–(4.13), pp.766–767; §4.3, pp.769–770; JZ2020 line 1165).

A proof route is as follows. Use local uniqueness at generic irreducible parameters and restricted tensor product factorization. Evaluate the global functional on a reference pure tensor to identify c; compare the explicit unfolded factors on the common convergence chamber and continue the resulting identity.

*Needs:* §2.1; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensors); SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration).

**Checks.**

- A zero global functional is not normalized to a nonzero product.
- The scalar cannot disappear merely because the local Hom spaces have dimension one.
- For local scalar values 2 and 3 and global value 30, the factorization scalar is 5; uniqueness alone gives no reason to replace 30 by 6.

### 2.3 Relative Bruhat cells

For the parabolics P_a,P_ℓ of H_X, construct the relative Bruhat decomposition needed for P_a(F)\H_X(F)/(G(F)N_ℓ(F)). Its coarse Weyl representatives `epsilon_(alpha,beta)` have 0≤α≤β≤a and a≤ℓ+β−α≤a+r_W; refine each coarse cell by its residual rational stabilizer orbits. Give the actual block permutation, the intersection unipotents and the compatible quotient measures. In type D retain the determinant-one exceptional Weyl branches; the inequalities alone are not a complete uniform indexing theorem for SO. (JZ2020, Proposition 4.1 and (4.14)–(4.16), pp.767–768; §4.7, pp.781–782; JZ2020 line 1190).

A proof route is as follows. Compute relative isotropic intersection dimensions and choose adapted bases to obtain the block representatives. Compute the stabilizer in each representative and separate SO from O; the cited generalized Bruhat calculation needs its full inner-form proof (the cell comparisons in §§2.3–2.6).

*Needs:* §0.1; §0.3; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration).

**Checks.**

- The inequalities filter valid cells but do not replace the residual orbit quotient.
- The a=ℓ and a=ℓ+1 boundaries give the indicated open representatives.
- For a=1,ℓ=0,r_W=0 the inequalities give only (α,β)=(0,1); for a=1,ℓ=1,r_W=0 they give (0,0) and (1,1). The open representative changes from β=1 to β=0.

### 2.4 Open-cell reduction

In the absolute-convergence chamber, expansion of B_ell(E(f_s,s)) followed by the cuspidal π-period kills every α>0 cell by its nontrivial character, and every remaining nonopen stabilizer cell by a proper constant term of π. The surviving coarse representative has α=0, β=max(a−ℓ,0), with the residual open representative η and its explicit stabilizer. When a>ℓ it yields the inner Bessel period on (π,`sigma^(Ad(w_q^ell))`); when a≤ℓ it yields the inner period on (σ,π) of index ℓ−a. The outer character and every quotient measure are transported through the representative. (JZ2020, §4.2–4.5, pp.768–779; Corollaries 4.4 and 4.6, pp.775,779; JZ2020 line 1256).

A proof route is as follows. First integrate a character-nontrivial root subgroup in α>0 cells. For the other nonopen terms identify a proper F-parabolic in G whose constant term occurs. Cuspidality kills it. Identify the surviving η-stabilizer and its character; the cited omitted matrix and root-exchange details are the cell comparisons in §§2.3–2.6.

*Needs:* §2.3; §2.1; AutomorphicFormsOnReductiveGroups §4.1 (constant-term transitivity).

**Checks.**

- The case a≤ℓ is included, although the residue application uses a>ℓ.
- Vanishing of the appropriate inner period forces Z=0 for all data.
- On a volume-one C₂ root quotient, the nontrivial-character integral is (1−1)/2=0 and the trivial-character integral is 1; deleting the character would retain a forbidden cell.

### 2.5 Whittaker induction transform

For a>ℓ, β=a−ℓ, put τ in its Whittaker model with the character determined by the open cell. On a convergent section f_s define `J_s(f_s)(g) = integral_(U^-_(a,eta)(A)) f_s(u epsilon_beta eta g) psi_(a+m+ell,a-ell)(u) du`. The root subgroup `U^-_(a,eta)` is the intersection appearing in (4.32); its coordinate-free definition is the open-cell unipotent quotient from relative-bruhat. The value is in `sigma^(Ad(w_q^ell))` and the resulting function transforms under `R_(beta-1)` by `psi_(beta-1,y_(-kappa))^(-1)` and that representation. Provide the local transform on smooth nonarchimedean and Casselman–Wallach archimedean sections, and its meromorphic continuation as an operator-valued family. (JZ2020, §4.4, (4.28)–(4.39), pp.774–776; Appendix A (A.4)–(A.5), pp.811–812; JZ2020 line 1520).

The construction has the following API.

- J_s is a G-equivariant map to the smooth induced `R_(beta-1)`-model with the specified inverse character and σ-twist.
- With compatible measures, the global transform of a pure section factors into its local transforms in the convergence chamber.
- A section supported compactly in the open cell is evaluated by precisely the displayed U^- integral, retaining the inducing modulus.

A proof route is as follows. Take the GL_a Whittaker coefficient, then the indicated open-cell unipotent integral. Its source is the smooth normalized I_(s,v); its target is the smooth induced R_(β−1)-model with σ^t-valued functions, using continuous Casselman–Wallach spaces at infinity. Prove equivariance by changes of variables, retaining the inverse character, twist and modulus. Supply the cell-integral estimates for meromorphic continuation as a continuous operator family, both nonarchimedean and archimedean; continuation is a theorem about this constructed operator.

*Needs:* §2.4; AutomorphicLFunctionsAndLocalFactors AL.3, whittaker-model; AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization); AutomorphicSpectralTheory §0.15 (common-denominator Laurent operators).

**Checks.**

- The representation in the target is the twisted σ, not a scalar.
- At β=1 the inner Bessel index β−1 is 0 and the transformation law becomes restriction.
- a=ℓ+1 gives an index-zero inner model, not an index-one Fourier coefficient.
- Replacing inducing σ by `sigma^(Ad(w_q^ell))` makes the output inner coefficient take values in σ because the normalizer has square 1.
- A scalar-valued Fourier transform cannot replace J_s when σ has dimension greater than 1.

### 2.6 Inner Bessel datum and period comparison

In the a>ℓ open cell, identify the unipotent subgroup `N_ell^eta`, its reductive stabilizer `H_W^(Ad(w_q^ell))` and its inverse character with the shared Bessel datum of index β−1 on G, β=a−ℓ. The stabilizer space is the given W with the transported embedding, not an abstract group of the same dimension. For a≤ℓ identify the corresponding datum of index ℓ−a on H_W and its character. Thus the two inner integrals are exactly P(π,σ^t) and P(σ,π), respectively, with no extra dual suppressed. The special application induces from σ^t so that the first inner period is P(π,σ). (JZ2020, Propositions 4.2–4.3, (4.30)–(4.36), pp.774–776; (4.42)–(4.46), pp.778–779; §4.7, pp.781–782; JZ2020 line 1610).

A proof route is as follows. Compute the open-cell stabilizer’s action on the middle form and character. Use the explicit isometry from prescribed-ambient-datum to match the relevant pair and compare its Hermitian convention before identifying functionals.

*Needs:* §2.5; §0.6; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2.

**Checks.**

- The exponent of the outer twist is the ambient Bessel index.
- The a>ℓ inner index is a−ℓ−1, with no off-by-one shift.
- For a=3,ℓ=2, β−1=0; for a=ℓ=2, ℓ−a=0. The two formulas meet different ambient models even though both inner indices are zero.
- If t exchanges two labels σ₁,σ₂, inducing σ₁ gives inner σ₂ and inducing σ₂ gives inner σ₁; applying t twice gives the original label.
- An abstract SO₂ isomorphism matching dimensions but replacing its norm-one torus over R by the split R× torus changes compactness and fails the prescribed-embedding contract.

### Examples

At a=ℓ+1 the inner index is 0; at a=ℓ the second branch also has index 0. For a=1,ℓ=0,r_W=0 the only coarse cell is (0,1), but residual rational data are still part of the cell label.

### Dependencies

This layer uses §0.6; AutomorphicSpectralTheory §§1.1–1.5 and §2.4 (normalized induced family); AutomorphicSpectralTheory §2.14 (isobaric automorphic realization); AutomorphicSpectralTheory §§2.4–2.7 (gap:isobaric-eisenstein-continuation); GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; AutomorphicSpectralTheory §§2.4–2.14 (gap:isobaric-eisenstein-continuation); GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; AutomorphicFormsOnReductiveGroups §§3.4–3.5 (restricted tensors); SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); §0.1; §0.3; AutomorphicFormsOnReductiveGroups §4.1 (constant-term transitivity); AutomorphicLFunctionsAndLocalFactors AL.3, whittaker-model; AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization); AutomorphicSpectralTheory §0.15 (common-denominator Laurent operators). The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 3: Local integrals and Euler factors

### 3.1 Local Bessel zeta integral

Over k=F_v fix a nonzero continuous local Bessel functional b_v for the inner datum. If a>ℓ define `Z_v(s,f_s,v) = integral_(R_(beta-1)(k)\G(k)) b_v(pi_v(g)v,J_(s,v)(f_s)(g)) dg` with β=a−ℓ and inducing σ^t. If a≤ℓ define `Z_v = integral_(N_ell^eta(k)\N_ell(k)) b_v(R(n)f_s,v) psi_ell(n)^(-1) dn`, where b_v is the functional on the GL_a-Whittaker realization with the (ℓ−a)-Bessel functional of σ as in (4.45). Define these first in an absolute-convergence half-plane and then by meromorphic continuation. At archimedean v use jointly continuous functionals on the completed smooth tensor product; algebraic Jacquet coinvariants alone do not define this integral. (JZ2020, §4.4, (4.40)–(4.41), pp.776–777; §4.5, (4.45)–(4.46), p.779; Appendix A (A.1)–(A.3), pp.810–811; JZ2020 line 1650).

The construction has the following API.

- Z_v is linear in the section and π-vector and in the chosen inner functional.
- The integrand descends to R\G in the first case, or to N^η\N in the second, by the exact inverse-character cancellation.
- For a holomorphic smooth section, Z_v is a meromorphic scalar function of s; no holomorphy at all s is asserted.

A proof route is as follows. Check quotient invariance using the two equivariance laws, including the inverse outer character. Use decay estimates for the Whittaker section and the inner functional to prove convergence and meromorphic continuation; the unrestricted local continuation is the local analytic theorems in §§2.5 and 3.1–3.4.

*Needs:* §2.6; §2.5; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization).

**Checks.**

- Rescaling b_v rescales Z_v by the same scalar.
- The two cases have different quotient domains.
- Replacing b_v by 2b_v doubles the local integral.
- At a=ℓ the second formula uses an index-zero Bessel functional on σ.
- A discontinuous linear functional on the algebraic archimedean tensor product is not an admissible b_v.

### 3.2 Euler product of the zeta integral

On factorizable data and for Re(s) sufficiently large, Z=c∏_v Z_v, provided the appropriate inner global period is nonzero. For a>ℓ the inner pair is (π,σ^t), and for a≤ℓ it is (σ,π); zero inner period implies Z≡0 for all data. The identity continues meromorphically wherever the local integrals do. The scalar c is determined by the global-to-local period normalization; normalize one factor explicitly to make c=1 if desired. (JZ2020, Theorems 4.5 and 4.7, Corollaries 4.4 and 4.6, pp.775–779; JZ2020 line 1670).

A proof route is as follows. Insert the identified inner period into the open-cell formula. Factor the Whittaker transform and inner Bessel functional; use absolute convergence for Fubini in the chamber. Use uniqueness of meromorphic continuation, keeping the same fixed normalization scalar.

*Needs:* §2.2; §2.4; §3.1.

**Checks.**

- A global zero-period case is stated separately.
- The formula includes the case a≤ℓ and its actual character.
- For local values 2 and 3 with scalar 5, Z=30; if the inner global functional is zero, Z=0 for all sections, and division by it cannot define normalized local data.

### 3.3 Standard local L-ratio

For π,σ with relevant generic global parameters, define the (4.47) local ratio ℒ_v(s;τ,π,σ)=L_v(s+1/2,τ×φ_π∨)/(L_v(s+1,τ×φ_σ)L_v(2s+1,τ,ρ)). The published numerator uses the complex conjugate of the unitary representation π, whose parameter is φ_π∨. Also record the distinct (5.13) candidate `Lcal_v^(13)`, with φ_π in place of φ_π∨. These agree for self-dual orthogonal standard parameters; no such equality is assumed for unitary parameters. Here ρ=∧² if H_X is even orthogonal, ρ=Sym² if it is odd orthogonal, and `rho = Asai^((-1)^m)` for U(X), where m=dim_E W. Use standard local parameters for ramified and archimedean factors, not a gcd definition. the dictionary in §4.1 must reconcile the two printed candidates with the actual bilinear integral, its argument order, the normalizer and the descent output. (JZ2020, §4.6, (4.47), p.780; (4.48), p.781; §5.1, (5.3)–(5.4), p.783; §5.3, (5.13), p.787; JZ2020 line 1815).

The construction has the following API.

- At a spherical place these parameter factors agree with the Satake determinant factors.
- Tensor factors multiply over τ=⊞τ_i; the ρ factor also includes the cross terms prescribed by ρ.
- O-conjugate even-SO standard parameters yield equal meromorphic ratios.
- By the parameter duality identifications, `Lcal_v^(13)(s;tau,pi,sigma) = Lcal_v(s;tau,pi^vee,sigma)`. This changes the representation argument; it does not assert equality for fixed π.

A proof route is as follows. Apply tensor, exterior, symmetric and signed-Asai operations to the imported local parameters. Define the meromorphic quotient after identifying the absolute-value and local reciprocity conventions. The missing ramified Asai/tempered-factor exports are requested from AutomorphicLFunctionsAndLocalFactors AL.4.

*Needs:* AutomorphicLFunctionsAndLocalFactors AL.4, l-group-local-factor; AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); ModularityAndLanglandsExtensions §3.15; ModularityAndLanglandsExtensions §3.12; ModularityAndLanglandsExtensions §3.16; AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison (gap:all-place-signed-factors); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- No generic local-integral gcd theorem is assumed at ramified places.
- Outer-conjugating even-SO σ preserves the standard parameter up to O-conjugacy and hence this ratio.
- A two-eigenvalue parameter (x,y) contributes xy to ∧² and x²,xy,y² to Sym²; these cannot be interchanged.
- For m=1 use the negative Asai sign and for m=2 the positive sign; using floor(m/2) gives the wrong sign at m=1.
- For a nonquadratic conjugate-self-dual U₁ base-change character χ and τ=χ, the (4.47) numerator is χ×χ∨ while the (5.13) numerator is χ×χ. They must not be identified merely from conjugate self-duality.

### 3.4 Unramified Bessel integral calculation

At each unramified finite place with a hyperspecial fixed vector, conductor-zero additive character, hyperspecial mass 1, spherical Whittaker value 1, normalized section and inner Bessel value 1, prove Z_v(s)=ℒ_v(s). Include every unramified orthogonal form and split and nonsplit unitary groups in both index regimes; no spherical assertion is made for a ramified form without the specified hyperspecial datum. In the unitary case the exact argument labels are transported by §4.1. The chosen ℒ is the (4.47) quotient, kept separate from the (5.13) candidate. (JZ2020, Theorem 4.8 and (4.48), p.781; [43], bibliography p.823; Zhang2022, Theorem 1.1, PDF pp.2–3; §§3–5, PDF pp.4–7; JZ2020 line 1869).

A proof route is as follows. Use the supplied spherical Whittaker and Cartan-volume formulas to evaluate the Weyl-character series. Compare with the descent-integral and Whittaker–Shintani route of Zhang2022, Theorem 1.1, PDF pp.2–3, and §§3–5, PDF pp.4–7, Zhang2022 line 87, line 166. Establish all needed cell estimates and the split GL calculation directly: a statement restricted to nonsplit places does not supply this uniform evaluation.

*Needs:* §3.3; §3.1; SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization).

**Checks.**

- The normalization of b_v is an extra choice, not a consequence of a spherical vector value.
- The leading term in the Euler series is 1.
- In a two-eigenvalue factor with x=1,y=−1 and T=1/2, the determinant denominator is 3/4 and the L-factor 4/3; its constant coefficient is 1.
- A ramified representation with zero hyperspecial fixed space has no vector with spherical Bessel value 1, so it does not meet the hypotheses.

### 3.5 Tempered local factors and ramified normalizers

For the standard modules of the actual generic unitary global inputs to §3.3, apply the supplied tempered-factor regularity and strict complementary-exponent theorem to prove that the shifted local numerator L_v(1,τ×π∨) and denominators L_v(3/2,τ×σ)L_v(2,τ,ρ) are finite and nonzero at s=1/2. Keep the separate numerator L_v(1,τ×π) for ℒ¹³. Include all archimedean Gamma shifts, ramified factors and split unitary parameters. This is the shifted-integral comparison; the general tempered theorem and unitary-dual classification are supplied, not constructed here. (JZ2020, §5.3, proof of Proposition 5.6, pp.789–790; Appendix B (B.5)–(B.7), p.819; JZ2020 line 2223).

A proof route is as follows. For every factor in the supplied standard-module decomposition list its shifted tempered argument. With paired exponents α,β strictly less than 1/2, the smallest numerator argument 1−α−β is strictly positive; the denominator arguments are at least 3/2−α−β and 2−2α. Apply the supplied all-place regularity at these exact arguments; a boundary theorem valid only in an open half-plane is never applied at zero.

*Needs:* §3.3; ModularityAndLanglandsExtensions §3.25; AutomorphicFormsOnReductiveGroups §2.6 (archimedean generic unitary dual); AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison (gap:all-place-signed-factors); AutomorphicSpectralTheory §2.9 (generic standard modules and strict GL exponents).

**Checks.**

- A theorem for Re(z)>0 cannot be used at z=0.
- Strict exponents α<1/2 are retained at the boundary s=1/2.
- With α=1/3,β=1/4 the smallest numerator argument is 5/12, the cross-denominator argument is 11/12 and the type-denominator argument is 4/3; all are positive. At α=β=1/2 the first becomes 0, outside the supplied regularity range.

### 3.6 Open-cell local nonvanishing

Let a>ℓ and b_v be a nonzero admissible local inner Bessel functional with b_v(v_π,v_σ)≠0. For every s₀∈C there exists a holomorphic smooth section f_s in the Whittaker induction from σ^t such that Z_v(s,f_s,v_π) is regular and nonzero at s₀. It may be chosen with compact support modulo P_a inside the open cell, using smooth archimedean rather than necessarily K-finite sections. Prove this for all characteristic-zero local fields, including split unitary groups. This asserts regularity for the constructed section, not for every local integral. (JZ2020, Proposition A.1, pp.811–817; (A.6), p.812; Proposition 5.5, pp.788–789; JZ2020 line 3292).

A proof route is as follows. Construct a compactly supported open-cell section with inducing value W_τ tensor v_σ. Since b_v(v_π,v_σ)≠0, choosing W_τ(1)=1/b_v(v_π,v_σ) is legitimate. In (A.12)–(A.14), type every rectangular block and carry the corrected identity C E₂=(I−g)E₁+YY′E₂ through the quotient parameterization, its Jacobian and the open-cell section evaluation. Here C is the upper-right coefficient before g*. The term need not vanish even on actual isometries fixing the chosen vector; it cannot be discarded merely by the displayed slice choice. At finite places use small compact-open supports. Over R,C prove continuity and use smooth approximate identities and Dixmier–Malliavin, retaining the prescribed vectors. Treat split GL cells separately. These steps establish regularity for the selected section at the prescribed s₀, not universal holomorphy.

*Needs:* §3.1; §2.5; AutomorphicFormsOnReductiveGroups §2.7 (Dixmier–Malliavin); AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization); AutomorphicLFunctionsAndLocalFactors AL.3, whittaker-model.

**Checks.**

- The prescribed v_π and v_σ are retained.
- Nonzero at s₀ means the constructed meromorphic integral is actually regular there.
- For b_v(v_π,v_σ)=2, the chosen Whittaker value is 1/2, giving pairing value 1; a zero inner functional admits no such choice.
- Over Q let J=[[0,0,1],[0,1,0],[1,0,0]], p=[[1/2,1,−1],[0,1,−2],[0,0,2]], and u=[[1,0,0],[1,1,0],[−1/2,−1,1]]. Both have determinant 1 and preserve J, and pu fixes w=(1,0,1) of norm 2. Their blocks have g=1/2, Y=−1, Y′=1, E₁=E₂=1 and C=−1/2. The corrected equation gives −1/2=1/2−1; dropping YY′E₂ gives the false −1/2=1/2. This is an actual orthogonal-group negative control, not arbitrary rectangular data.

### Examples

For two eigenvalues x=1,y=−1, exterior weight −1 differs from symmetric weights 1,−1,1. At q=2 the two nontrivial signs give different Euler denominators. A ramified local integral is retained even where no spherical vector exists.

### Dependencies

This layer uses §2.6; §2.5; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); AutomorphicFormsOnReductiveGroups §2.7 (Casselman–Wallach globalization); §2.2; §2.4; AutomorphicLFunctionsAndLocalFactors AL.4, l-group-local-factor; AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); ModularityAndLanglandsExtensions §3.15; ModularityAndLanglandsExtensions §3.12; ModularityAndLanglandsExtensions §3.16; AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison (gap:all-place-signed-factors); SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization); ModularityAndLanglandsExtensions §3.25; AutomorphicFormsOnReductiveGroups §2.6 (archimedean generic unitary dual); AutomorphicSpectralTheory §2.9 (generic standard modules and strict GL exponents); AutomorphicFormsOnReductiveGroups §2.7 (Dixmier–Malliavin); AutomorphicLFunctionsAndLocalFactors AL.3, whittaker-model. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 supplies the carriers for unitary packets used by the indicated targets. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 4: Leading residues and reciprocal periods

### 4.1 Pairing and contragredient dictionary

For every relevant pair prove Q_ψ(f,g)=P_ψ(f,conj g), `conj(P_psi(f,g)) = P_(psi^(-1))(conj f,conj g)`, and the corresponding local Hom identifications with smooth contragredients. For the actual Eisenstein induction compute, from its L-group action on the unipotent radical, which standard parameter or dual occurs in the cross factor of the normalizer. Match that computation to the argument order in Z, its spherical formula, the residue pairing and the parameter of the critical module. Orthogonal standard parameters are self-dual, with representation duality retained up to the appropriate even-SO outer action. In the unitary case construct a fully commuting dictionary: a bilinear pairing with π detects π∨ in the Fourier module, and the (4.47) numerator L(s,τ×BC(π)∨) has the full self-pair pole when τ≅BC(π), whereas the (5.13) candidate L(s,τ×BC(π)) requires τ≅BC(π)∨ for the same full pole. A Hermitian statement must track conjugation of its second argument explicitly; (5.6) and Theorem 5.3 display conjugates inside Hermitian brackets, producing bilinear periods, and are not examples of wholly omitted conjugation. Establish whether the printed unitary chain is obtained by these transports or needs a corrected induction and dual output; this comparison is the dictionary in §4.1, not an assumed identity χ=χ∨. (JZ2020, §4.1, (4.7)–(4.12), pp.766–767; (4.47), p.780; (5.6), p.785; Theorem 5.3, p.786; (5.13), p.787; §5.5 and Theorem 5.7, p.791; §6.2, pp.801–803; §7.1, pp.807–808; JZ2020 line 2042).

In the split U₃≃GL₃ L-group witness with diagonal block characters χ₁,μ,χ₂⁻¹, the two cross-root weights are χ₁μ⁻¹ and μχ₂. For χ₁=2,χ₂=3,μ=5 as torus coordinates they are 2/5 and 15, not 10 and 3/5. In the two-candidate comparison, a one-dimensional nonselfdual parameter z=i gives z z⁻¹=1 and z²=−1. Establish which cross representation occurs before transporting the self-pair pole and output module; changing a single numerator label alone proves no recovery statement.

A proof route is as follows. Derive the two scalar period identities directly using conjugation of the defining integral and unitarity of ψ. Identify complex conjugate unitary automorphic representations with their contragredients and compute the parameter duality. For split U₃≅GL₃, calculate the two root spaces of its block Levi: the GL₁ characters give χ_1 μ^(−1) and μ χ_2. Use this test to resolve the printed cross-factor convention and then track it through the full descent diagram.

*Needs:* §3.3; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; AutomorphicSpectralTheory §2.8 (Shahidi normalization); ModularityAndLanglandsExtensions §3.15; ModularityAndLanglandsExtensions §3.12; AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison (gap:all-place-signed-factors); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- The printed formula alone does not settle the unitary cross-factor argument.
- The L-function of a nonselfdual character with itself is not its self-pair L-function.
- For a volume-one U₁ character χ with χ² nontrivial, P(χ,χ)=0, Q(χ,χ)=1, P(χ,χ∨)=1; the comparison requires conjugating the second argument.
- In split U₃ with torus coordinates (2,5,1/3), the two cross weights are 2/5 and 15; replacing both by products with μ gives the wrong first weight.
- For z=i, the self-pair tensor z z⁻¹=1 and z²=−1 give factors (1−T)⁻¹ and (1+T)⁻¹, respectively, so the two printed numerator candidates disagree.

### 4.2 Leading Eisenstein residue

Let `tau = boxplus_(i=1)^r tau_i` with pairwise distinct irreducible unitary cuspidal blocks of the required self-dual or conjugate-self-dual type, and let σ be cuspidal with relevant generic parameter of opposite parity. With the normalized family E(f_s,s), define `R_(tau,sigma)` as the automorphic module spanned by `R(f) = lim_(s -> 1/2) (s-1/2)^r E(f_s,s)`, after proving pole order at most r. Retain the chosen realization of σ, the inducing section and the ambient form. The one-variable leading Laurent coefficient is zero when the actual pole order is less than r. This definition is not a successive one-variable residue and does not assert nonzero for every section. (JZ2020, §5.1, Proposition 5.2, pp.782–784; §6.1, p.792; JZ2020 line 1998).

The construction has the following API.

- A holomorphic section gives its order-r Laurent coefficient as an automorphic form.
- The coefficient map commutes with right H_X(A)-translation.
- If the family has pole order less than r for every section, `R_(tau,sigma)`=0.
- The residual module remembers the ambient form and the actual automorphic realization of σ.

A proof route is as follows. Apply the supplied normalized-intertwiner and completed type-factor theorems to bound the order by r_τ. AutomorphicSpectralTheory §0.15 gives continuous coefficient operators after a common-denominator regularization; its Eisenstein continuation supplies the automorphic setting. Take this coefficient and its right-translation span in the specified inducing realization.

*Needs:* §2.1; AutomorphicSpectralTheory §0.15 (common-denominator Laurent operators); AutomorphicSpectralTheory §§2.4–2.7 (automorphic Laurent calculus); AutomorphicSpectralTheory §2.13 (gap:all-place-intertwiner-comparison); AutomorphicLFunctionsAndLocalFactors AL.3, rs-global-poles; AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison (gap:all-place-signed-factors).

**Checks.**

- One variable with an order-r pole is not r successive residues in that variable.
- Nonzero module means existence of one section with nonzero leading coefficient.
- For E(s)=A/(s−1/2)^2+B/(s−1/2)+C and r=2, the coefficient is A, not B.
- For an order-one pole and r=2, the coefficient is zero.
- A section in the kernel of the coefficient map can give zero even when the residual module is nonzero.

### 4.3 Maximal pole and central L-value

With the distinct-block data of §4.2, suppose every type factor L(s,τ_i,ρ) has a simple pole at 1, the cross factors for distinct blocks are regular and nonzero there, and the completed normalizing denominator is regular and nonzero at s=1/2. Use the holomorphic nonzero normalized local operators of AutomorphicSpectralTheory §§2.4–2.14. Then E has pole order at most r; it has order r for some section, equivalently `R_(tau,sigma)`≠0, exactly when the actual cross L-function in its scalar normalizer is nonzero at 1/2. In the orthogonal convention this is L(1/2,τ×φ_σ). The full unitary identification uses the verified root-factor dictionary, not self-duality in place of conjugate self-duality. (JZ2020, Proposition 5.2 and its preceding calculation (5.1)–(5.4), pp.782–784; JZ2020 line 1998).

A proof route is as follows. Apply the supplied completed type-pole theorem: r_τ distinct type poles give order r_τ and the other specified factors are regular and nonzero. The normalized operator has a nonzero value, and a pure tensor section detects it; prove the global operator is nonzero using compatible spherical tails. Compare the leading constant term with the Eisenstein Laurent coefficient. The analytic normalization proof is AutomorphicSpectralTheory §2.13 with gap:all-place-intertwiner-comparison; it does not use this conclusion about residual packets.

*Needs:* §4.2; §4.1; AutomorphicSpectralTheory §§2.4–2.7 (Eisenstein constant terms); AutomorphicSpectralTheory §2.13 (gap:all-place-intertwiner-comparison); AutomorphicLFunctionsAndLocalFactors AL.3, rs-global-poles; AutomorphicLFunctionsAndLocalFactors AL.3, rs-boundary-nonvanishing; §3.5; ModularityAndLanglandsExtensions §3.3–3.4; AutomorphicLFunctionsAndLocalFactors AL.3, Poles, functional equations and the closed boundary (gap:type-poles-and-cross-factor); AutomorphicSpectralTheory §§2.4–2.14 (gap:isobaric-eisenstein-continuation).

**Checks.**

- Repeated τ_i are excluded.
- The criterion concerns the actual cross factor; it cannot be transported to an undualized unitary factor without the dictionary in §4.1.
- With t=s−1/2, type numerator t⁻² and cross factor 3 give leading coefficient 3 and order 2; cross factor t gives order 1 and leading coefficient 0 at order 2.

### 4.4 Normalized bad-place zeta product

Let S contain all archimedean and ramified places of the datum. Put Z_v^*(s)=Z_v(s)/ℒ_v(s) as a meromorphic quotient and `Z_S^*(s) = product_(v in S) Z_v^*(s)`. With the spherical calculation and the chosen global scalar c, the identity is Z=c·Z_S^*(s)ℒ(s), where ℒ is the complete product of the stated local ratios, with the unitary convention comparison required. A meromorphic quotient is defined even at an apparent zero or pole by its meromorphic germ; its regular value is asserted only by an analytic theorem. (JZ2020, §4.6, (4.49), p.781; §5.3, (5.10)–(5.12), pp.786–787; JZ2020 line 2090).

The construction has the following API.

- Z=c·Z_S^*·ℒ on the chamber, then as meromorphic families.
- Adding a spherical place with Z_v=ℒ_v multiplies Z_S^* by 1.
- The quotient is the meromorphic germ; pointwise division by a zero is not its definition.

A proof route is as follows. Divide each local meromorphic integral by its nonzero meromorphic standard ratio. Separate the finite bad-place product and keep the global normalization scalar.

*Needs:* §3.2; §3.4; §3.3.

**Checks.**

- Holomorphy of a finite product does not prove holomorphy of each factor.
- Changing S across a normalized spherical place leaves Z_S^* unchanged.
- If Z_v=1/(s−1/2) and ℒ_v=2/(s−1/2), then Z_v^*(1/2)=1/2 after removing the singularity.
- If every place in S is normalized spherical, Z_S^*=1.
- The product of s and 1/s is regular at 0 although one factor is not; product regularity cannot be assigned to both factors.

### 4.5 Holomorphy at the critical point

Assume a=N, k=a−j−1 for the prescribed relevant pair, τ=⊞τ_i distinct, a nonzero inner bilinear period P(π,σ), and the self-pair pole condition that L(s+1/2,τ×BC(π)∨) has order r at s=1/2. In particular this condition is met by τ≅BC(π), using the (4.47) ratio ℒ. Using the different (5.13) candidate would instead require the dual transfer in this pole calculation. Then for factorizable holomorphic smooth sections, Z_S^*(s) is holomorphic at s=1/2. There exist such data, retaining prescribed nonzero inner-period vectors after the allowed local choices, for which Z_S^*(1/2)≠0 and the inner global period is nonzero. The full statements require the actual spherical/root-factor convention bridge in the unitary case. (JZ2020, Propositions 5.4–5.6, pp.787–790; (5.11)–(5.19); JZ2020 line 2112).

A proof route is as follows. Compare the order bound r for Z from E with the exact order r of ℒ to prove holomorphy of the finite product. Factor the given nonzero inner period, choose local sections with nonzero Z_v at 1/2, and use finite nonzero normalizing factors to retain nonzero normalized factors. At archimedean places keep the holomorphic smooth section class and the continuous functional throughout.

*Needs:* §4.4; §4.3; §3.6; §3.5; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth.

**Checks.**

- For the (4.47) numerator the second tensor argument is BC(π)∨ and the full self-pair choice is τ=BC(π); for (5.13) the choice is τ=BC(π)∨. Neither convention can be substituted without the dictionary in §4.1.
- The local choices produce a single global restricted tensor section and a nonzero inner period.
- For r_τ=2, Z=6t⁻²+3t⁻¹ and ℒ=2t⁻², the quotient is 3+(3/2)t and its central value is 3. A numerator of order 1 would not force this quotient regularity.

### 4.6 Reciprocal nonvanishing of Bessel periods

For a prescribed relevant pair (G,H), cuspidal realizations C_π,C_σ with generic parameters, j=(d−m−1)/2, a=N, and k=a−j−1≥0, induce from τ⊗σ^t with t=Ad(w_q^k). Suppose τ has the required distinct blocks and type, `R_(tau,sigma^t)`≠0, and the numerator self-pair pole condition in normalized-holomorphy. Assume the actual local/global integral and normalizer comparisons of Layers 3–4. Then there are vectors with `P_k(R_(tau,sigma^t),pi)`≠0 if and only if there are vectors with P_j(π,σ)≠0, with the explicitly transported characters. In the orthogonal case τ is the standard transfer of π; with ℒ from (4.47), the self-pair choice is also τ=BC(π) in the unitary case. Compatibility of this choice with the bilinear period, actual normalizer and output parameter is the dictionary in §4.1; the distinct (5.13) candidate would give the dual choice and is not identified with ℒ. The forward implication does not need the self-pair pole condition; the reverse uses it and proves a nonzero residual coefficient as well. (JZ2020, Theorem 5.3, p.786; proof in §5.4, p.790; JZ2020 line 2067).

A proof route is as follows. A nonzero leading-coefficient period implies the meromorphic global Z is not identically zero; unfolding gives the inner period. For the reverse choose normalized data with nonzero critical product. The self-pair L-pole and the complete zeta identity force an order-r pole, whose leading period is nonzero. Keep bilinear and Hermitian versions separate via the dictionary; in a bilinear pairing the residual module is detected against π and contains its dual.

*Needs:* §0.6; §4.5; §4.2; §2.4; §4.1.

**Checks.**

- Do not remove the stated R≠0 hypothesis when citing the equivalence; the stronger reverse-direction construction explains how it can be obtained.
- The even-SO input twist is k, not the smaller index j.
- In Z=c Z_S* ℒ with c=2, Z_S*(0)=3 and leading ℒ coefficient 5, the leading period is 30, hence nonzero; replacing any one of these three nonzero scalar factors by 0 kills this inference.

### 4.7 Nonzero period implies nonzero central value

For cuspidal π,σ on a coherent relevant inner-form pair with generic discrete global parameters, a nonzero bilinear Bessel period P(π,σ) implies that the corresponding standard tensor L(s,φ_π×φ_σ) is holomorphic and nonzero at 1/2. Equivalently the Hermitian period Q(π,σ) gives the dual-second-parameter value L(1/2,φ_π×φ_σ∨)≠0. This extends the adjacent unitary implication of GanGrossPrasadUnitaryGroups §7.1 to all the orthogonal and unitary odd-codimension data here; its residue/period comparison is the construction-specific assertion. No Whittaker genericity or cuspidal multiplicity-one hypothesis is imposed. Prove the orthogonal specialization through the residue construction. The full unitary specialization is an exact target with required convention proof the dictionary in §4.1, not a consequence of identifying φ_σ with φ_σ∨. (JZ2020, Theorem 5.7 and proof, pp.790–791; JZ2020 line 2296).

A proof route is as follows. Apply the reverse reciprocal construction with the necessary dual data and transported inverse character. The resulting nonzero residue forces its actual scalar cross factor to be nonzero at 1/2. Use the tensor duality functional equation at the center, with its nonzero epsilon factor, to express the answer in the stated bilinear convention. The unitary root-factor step remains the dictionary in §4.1.

*Needs:* §4.6; §4.3; §4.1; AutomorphicLFunctionsAndLocalFactors AL.3, rs-global-functional-equation; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth.

**Checks.**

- For a Hermitian period the second parameter is dualized.
- Even-SO multiplicity two is handled by specifying C_π and C_σ.
- The U₁ witness gives Q(χ,χ)=1 but P(χ,χ)=0, so the Hermitian tensor uses χ×χ∨, with weight 1, rather than χ×χ, with a nontrivial squared weight.

### Examples

For E(s)=A/t²+B/t+C, t=s−1/2, the order-two leading coefficient is A. Choosing A=0 makes it 0 despite a nonzero order-one residue. With c=2, normalized product value 3 and leading complete L-ratio coefficient 5, the residual period is 30.

### Dependencies

This layer uses §3.3; GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; AutomorphicSpectralTheory §2.8 (Shahidi normalization); ModularityAndLanglandsExtensions §3.15; ModularityAndLanglandsExtensions §3.12; AutomorphicLFunctionsAndLocalFactors AL.4, local-parameter-comparison (gap:all-place-signed-factors); §2.1; AutomorphicSpectralTheory §0.15 (common-denominator Laurent operators); AutomorphicSpectralTheory §§2.4–2.7 (automorphic Laurent calculus); AutomorphicSpectralTheory §2.13 (gap:all-place-intertwiner-comparison); AutomorphicLFunctionsAndLocalFactors AL.3, rs-global-poles; AutomorphicSpectralTheory §§2.4–2.7 (Eisenstein constant terms); AutomorphicLFunctionsAndLocalFactors AL.3, rs-boundary-nonvanishing; §3.5; ModularityAndLanglandsExtensions §3.3–3.4; AutomorphicLFunctionsAndLocalFactors AL.3, Poles, functional equations and the closed boundary (gap:type-poles-and-cross-factor); AutomorphicSpectralTheory §§2.4–2.14 (gap:isobaric-eisenstein-continuation); §3.2; §3.4; §3.6; §0.6; §2.4; AutomorphicLFunctionsAndLocalFactors AL.3, rs-global-functional-equation. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 supplies the carriers for unitary packets used by the indicated targets. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 5: Critical descent and its cuspidal structure

### 5.1 Residual Arthur parameter

For the compatible ambient datum with a=N, cuspidal σ of generic parameter φ_σ and τ=⊞τ_i of the opposite required parity, form `psi_(tau,sigma) = boxplus_i (tau_i boxtimes nu_2) boxplus phi_sigma` for H_X. Verify the dimension of its standard representation, its self-dual or conjugate-self-dual sign after tensoring by the 2-dimensional SL₂ representation, and the determinant character of H_X. Here ν_2 is the irreducible 2-dimensional SL₂ representation, not two copies of a trivial representation. If the data fail a parameter condition, the constructor is not available. Membership of an actual residue in the corresponding Arthur packets is a separate theorem. (JZ2020, §6.1, p.792; (6.3), p.795; §6.3, pp.803–804; JZ2020 line 2353).

The construction has the following API.

- The standard dimension is 2a plus the standard-dual dimension of H_W.
- Tensoring the form of τ_i with the alternating form of ν_2 gives the required ambient sign.
- Conjugating even-SO σ transports ψ by the corresponding outer action, retaining its determinant data.

A proof route is as follows. Specialize the global parameter constructor of ModularityAndLanglandsExtensions §3.8 after checking the rank, form sign and determinant conditions. For odd SO the standard dimension is one less than the form dimension. This comparison does not construct another parameter carrier.

*Needs:* ModularityAndLanglandsExtensions §3.8; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §4.2; AutomorphicLFunctionsAndLocalFactors AL.3, Poles, functional equations and the closed boundary (gap:type-poles-and-cross-factor); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- In odd ambient SO the dimension is 2a+(m−1).
- The two-dimensional SL₂ factor reverses the sign of the corresponding form.
- For a=6 and H_W=SO₃, the form dimension is 15 and ψ has standard dimension 12+2=14.
- Replacing τ_i⊠ν_2 by two copies of τ_i⊠ν_1 has the same dimension but a different SL₂ action and is not the parameter.
- A choice with the wrong ambient quadratic determinant character is rejected even if dimensions match.

### 5.2 Residual square integrability and membership in Arthur packets

If `R_(tau,sigma)`≠0 in the special data, it is square-integrable and its irreducible constituents belong to the Arthur packets associated with `psi_(tau,sigma)`, with the actual inner form and automorphic realization. The negative-exponent criterion and the residual constituent’s local Langlands quotients must be proved. Retain every hypothesis of the applicable global classification: quasi-split classical groups, or the supplied nongeneric inner-form extension and local intertwining statements. The nonzero nongeneric residue is not assigned to inner-form Arthur packets by the generic multiplicity formula alone. Irreducibility of R, as used in the source via Mœglin, is a distinct required input when needed, not a consequence of square integrability. (JZ2020, Proposition 6.1, pp.792–793; §6.3, p.804, citing Mœglin Theorem B; JZ2020 line 2366).

A proof route is as follows. Compute the exponents of this Laurent coefficient and apply the supplied square-integrability criterion. Identify its local Langlands constituents and parameter within the exact classification scope. The all-inner-form membership, irreducibility and all-member support exports are gap:nongeneric-residual-packets. Prove the application to the constructed residue separately from the assertion for every member of the residual packets.

*Needs:* §5.1; §4.3; AutomorphicSpectralTheory §§4.1–4.4 (residual spectrum and square-integrability criterion); ModularityAndLanglandsExtensions §3.17 and 3.23; ModularityAndLanglandsExtensions §3.12; ModularityAndLanglandsExtensions §3.16; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23–3.25 (gap:nongeneric-residual-packets; gap:coherent-classical-parameters); EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- A nonzero Eisenstein Laurent coefficient is not automatically in L².
- Generic parameter cuspidality cannot be applied to `psi_(tau,sigma)`, which has nontrivial ν_2 blocks.
- For an exponent t^λ on a positive split-center direction with measure dt/t, ∫₁∞t^(2λ)dt/t=−1/(2λ) when λ<0; λ=−1/2 gives 1, λ=0 gives divergence. A Laurent coefficient alone supplies no negative exponent.

### 5.3 Critical descent index

For a relevant pair of dimensions d,m with d=m+2j+1, a=N and j<a, define k₀=a−j−1. Its ambient Bessel partition is [2k₀+1,1^d], of size 2a+m; its chosen stabilizer is the prescribed G of dimension d. For comparison with the paper’s p^1, 2k₀+1=a+m−1 when H_W is even SO and 2k₀+1=a+m otherwise. The flag and rational orbit are the ones constructed for the prescribed pair, not chosen from dimension alone. (JZ2020, §5.2, (5.8)–(5.9), p.785; §6.2, (6.9), p.802; §6.3, p.804; JZ2020 line 2054).

The construction has the following API.

- The critical stabilizer dimension is 2a+m−2k₀−1=d.
- The critical Nat.Partition is [2k₀+1,1^d], with total 2a+m.
- If a=j+1 then k₀=0; the original d-dimensional form is a line complement in dimension d+1.

A proof route is as follows. Calculate 2a+m−2(a−j−1)−1=m+2j+1=d using j<a to justify natural-number subtraction. Use a=d−1 for odd SO and a=d otherwise to compare with the p^1 leading part.

*Needs:* §0.6; §0.2.

**Checks.**

- The arithmetic identity includes the nonnegativity hypothesis.
- The even-small-SO branch has leading part a+m−1, not a+m.
- d=5,m=2,j=1,a=4 gives k₀=2 and the ambient partition [5,1,1,1,1,1].
- d=6,m=1,j=2,a=6 gives k₀=3 and partition [7,1,1,1,1,1,1].
- a=1,j=2 is outside the domain; truncated natural subtraction must not manufacture a critical-index identity.

### 5.4 Vanishing above the critical index

Let Σ be an actual discrete automorphic member of `psi_(tau,sigma)` on H_X, within the classification scope in §5.2. Every Bessel coefficient of Σ at a valid index k>k₀ vanishes, for every rational orbit of that index. To prove it, identify one unramified finite local component at which the corresponding twisted Jacquet module is zero. Include inert and split unitary places and the determinant-one orthogonal cases; no global period is assumed. (JZ2020, Proposition 6.2 and proof, pp.793–794; JZ2020 line 2386).

A proof route is as follows. Use the geometric lemma and character coinvariants to compute the unramified residual constituent at one appropriate finite place for each rational datum. List every surviving term, with the determinant-one branches and both split and inert unitary calculations. Above k₀ each term has an incompatible rank or a nontrivial character acting on a trivial quotient. The resulting local Hom space is zero, so a global nonzero coefficient would contradict localization. GRS2011, Theorems 5.1, 5.4 and 5.6, gives the classical calculation template; the complete comparison on these forms is proved here.

*Needs:* §5.3; §5.2; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization).

**Checks.**

- The vanishing is for all rational orbits, not one selected orbit.
- A single verified good local place suffices for each global coefficient.
- If a local quotient acts trivially and the character takes value −1, its coinvariant relation is v=−v, hence v=0 over C; in characteristic 2 the relation would give no vanishing, explaining the coefficient choice.

### 5.5 Cuspidality at the critical index

For `R_(tau,sigma)`≠0 the critical module `B_(k_0,O)(R_(tau,sigma))` is cuspidal for every rational critical datum. Prove each constant term is zero using the tower calculation, higher-index vanishing and the cuspidal support of this specific residue. The stronger source assertion for every discrete `Sigma in Pi_(psi_(tau,sigma))` is a separate target: it requires the residual-support argument for every such Σ, not just the minimal support of `R_(tau,sigma)`. Neither assertion claims the critical module is nonzero. (JZ2020, Proposition 6.3, pp.794–795; JZ2020 line 2426).

The constructed-residue theorem uses only the actual cuspidal support of that residue. The all-member theorem requires support for every discrete Σ in the relevant packets, including noncuspidal Σ; gap:nongeneric-residual-packets states that export. The two quantifiers are separate and the zero Fourier image satisfies constant-term cuspidality.

A proof route is as follows. Expand every proper constant term using §1.3 and the supplied constant-term comparisons. Higher Fourier terms vanish by §5.4; eliminate the other terms using the actual cuspidal support of the constructed residue. For arbitrary discrete members of those packets first apply the independent all-member support theorem of gap:nongeneric-residual-packets and then prove the same vanishing calculation.

*Needs:* §5.4; §5.2; AutomorphicFormsOnReductiveGroups §4.1 (constant-term transitivity); AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23–3.25 (gap:nongeneric-residual-packets; gap:coherent-classical-parameters).

**Checks.**

- Zero critical modules are allowed.
- The proof for one constructed residue is not silently generalized to all residual members.
- A zero critical image has every constant term 0 even if the residue contains a nonzero vector; nonzero residue is therefore insufficient for the nonvanishing conclusion.

### 5.6 Outer stability of critical Bessel modules

For an actual discrete automorphic realization C_Σ, the critical Bessel module is invariant up to the transported action of the rational outer normalizer of its SO stabilizer: if π occurs, so does π^⋆ with the same image multiplicity. In the other classical cases the relevant outer orbit in this statement is a singleton. Prove the action on the actual realization without assuming its discrete multiplicity is one. The normalizer may send w to −w; compensate on the isotropic flag so that it preserves the Fourier character. In the odd ambient SO case extend to the corresponding O action by letting central −I act trivially as required by the construction. (JZ2020, Proposition 6.4, pp.795–797; JZ2020 line 2503).

A proof route is as follows. Construct the rational isometry normalizing the Bessel subgroup and compute its action on every character coordinate. Use rational left invariance to express its effect as right translation of C_Σ; that preserves the chosen realization even when the ambient spectrum has multiple copies.

*Needs:* §5.3; §1.1; §0.6.

**Checks.**

- Fixing the anisotropic line is different from fixing its vector.
- An orbit of size two is not replaced by a single constituent.
- For a two-element orbit {π,π⋆}, the involution exchanges the basis labels and squares to the identity; on a fixed orbit {π} its cardinal is 1.
- On a hyperbolic plane diag(−1,−1) sends e+(κ/2)f to its negative; a second sign change in the flag character is needed to recover the same ψ.

### 5.7 Unramified parameter of the critical module

At each good finite place, every irreducible unramified constituent of the critical twisted Jacquet module of Σ has standard Satake parameter equal to that of τ_v, up to the even-SO outer orbit. In the orthogonal case retain the determinant constraint and the corrected torus index k₀=a/2+r_W when W is split odd orthogonal and the output G is split orthogonal. For unitary groups compute both inert and split places; at a split place the two GL_a inducing factors must be handled separately. The result is equality of standard parameters, not uniqueness of an SO conjugacy class. (JZ2020, Lemma 6.5, pp.797–799, especially (6.6); Proposition 6.2, pp.793–794; JZ2020 line 2563).

A proof route is as follows. Compute the surviving Jacquet term and all its torus weights using the supplied geometric lemma. Correct the orthogonal index by the dimension equation and retain the final unitary weight in (6.6). At split unitary places compute both GL_a inducing factors, rather than inferring them from inert places. Prove the equality at every good place needed for the almost-everywhere standard transfer. Compare the classical cases with GRS2011, Theorems 5.1, 5.4 and 5.6.

*Needs:* §5.4; §5.3; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization); ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- The full list of a unitary inducing characters is retained.
- Even-SO standard transfer determines only the relevant outer orbit.
- For d=a=6 and split W of dimension 1, r_W=0 gives k₀=a/2+r_W=3 and 2a+m−2k₀−1=6; k₀=2 would give 8.
- Two unitary torus coordinates μ₁=2,μ₂=3 give (1−2T)(1−3T)=1−5T+6T²; omitting μ₂ drops the degree to 1. These are L-group test coordinates, not bounded unitary Frobenius eigenvalues.
- With odd-unitary W of dimension 1 and a=4, j=1 gives k₀=2 and the output has dimension 2a+1−2k₀−1=4, so it is U₄ rather than U₅. With a=5,m=0 the five standard weights are μ₁,μ₂,1,μ₂⁻¹,μ₁⁻¹; retaining μ₂ keeps degree 5.
- For a=6,m=1 the same dimension equation forces k₀=3 for either split or nonsplit even-orthogonal output. A nonsplit orbit with determinant character −1 cannot occur when the transferred determinant is 1.

### 5.8 Structure of the critical cuspidal module

For every nonzero critical Bessel module of an irreducible actual Σ in the scoped Arthur packets associated with `psi_(tau,sigma)`, assuming §5.5 and the compatible discrete cuspidal Hilbert carrier of the image/carrier comparison in §1.1 for that Σ, its Hilbert closure is an outer-stable multiplicity-free Hilbert direct sum of cuspidal representations whose generic global standard parameter is φ_τ, up to even-SO outer orbit. Apply this in particular to `R_(tau,sigma)` after proving the irreducibility required in §5.2, or the separate cross-constituent multiplicity comparison. This retains the reducible-residue assertion as an explicit additional target. Genericity of the parameter is deduced from the full good-place calculation and the applicable classification; it is not deduced from local Bessel nonvanishing. This theorem does not assert global nonvanishing. (JZ2020, Theorem 6.6, pp.799–800; JZ2020 line 2702).

A proof route is as follows. For an irreducible actual Σ use critical cuspidality and §1.4 to decompose the verified closed image. Identify its global parameter from every good-place standard parameter and the supplied almost-everywhere transfer uniqueness. Apply the rational normalizer to obtain the complete outer orbit. For a reducible residual realization apply this argument constituent by constituent; asserting multiplicity freeness for their sum additionally requires the irreducibility or cross-constituent comparison in §5.2.

*Needs:* §5.5; §5.6; §5.7; §1.4; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- Nonzero R does not imply nonzero critical Bessel module.
- There is no claim of strong multiplicity one for classical groups.
- An outer-fixed constituent has orbit cardinal 1 and multiplicity 1; two inequivalent outer conjugates give two summands, each of multiplicity 1. A zero image gives no constituent at all.

### 5.9 Twisted automorphic descent

For the specified residual datum, rational critical orbit O, stabilizer isometry with G and actual realization of σ, define `D_O(tau;sigma) = B_(k_0,O)(R_(tau,sigma))` with its smooth image and, when it lies in the verified cuspidal L² carrier, its Hilbert closure. The normalizer twist of σ is part of the datum and is displayed whenever comparing an inner period. No irreducibility or nonvanishing is included in the definition. A bilinear functional against π detects a π∨ constituent in this module; the Hermitian formulation uses the dictionary explicitly. (JZ2020, §6.2, diagrams (6.7)–(6.8), p.801, definition (6.9), p.802, and Conjecture 6.7, pp.802–803; JZ2020 line 2833).

The construction has the following API.

- Each residual section has its critical Fourier coefficient in D_O(τ;σ).
- D_O=0 exactly when the critical coefficient of every residual vector vanishes.
- A specified rational conjugacy and stabilizer isometry transport D equivariantly, with the character and inducing realization.
- Section 5.5 and the verified carrier of the image/carrier comparison in §1.1 place the Hilbert closure in L²_cusp(G); neither is built into the definition.

A proof route is as follows. Compose the leading-residue map with the critical Bessel map and the specified stabilizer transport. Keep the induced action, image topology and realization dependence from the two component constructions.

*Needs:* §4.2; §5.3; §1.1.

**Checks.**

- The same τ may have descents on different rational inner forms.
- A zero module is a valid value of the construction.
- R=0 gives D=0.
- For d=5,m=2,a=4,j=1 the coefficient used is the [5,1^5] coefficient on the 10-dimensional ambient form.
- Equality of geometric partitions without a rational stabilizer isometry does not identify two descents.

### Examples

For a=6 and W=SO₃ the ambient form has dimension 15 and the residual standard parameter has dimension 14. For d=6,m=1,j=2,a=6 the critical partition is [7,1^6] of size 13. A nonzero residual coefficient can have zero critical image.

### Dependencies

This layer uses ModularityAndLanglandsExtensions §3.8; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §4.2; AutomorphicLFunctionsAndLocalFactors AL.3, Poles, functional equations and the closed boundary (gap:type-poles-and-cross-factor); §4.3; AutomorphicSpectralTheory §§4.1–4.4 (residual spectrum and square-integrability criterion); ModularityAndLanglandsExtensions §3.17 and 3.23; ModularityAndLanglandsExtensions §3.12; ModularityAndLanglandsExtensions §3.16; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23–3.25 (gap:nongeneric-residual-packets; gap:coherent-classical-parameters); §0.6; §0.2; GanGrossPrasadUnitaryGroups §§2.1–2.6 (unitary); §1.4 (orthogonal); SmoothRepresentationsOfLocalGroups SR.2.2; SmoothRepresentationsOfLocalGroups SR.2.1–SR.2.3 (gap:twisted-jacquet-filtration); SmoothRepresentationsOfLocalGroups SR.4.1–SR.4.4 (gap:spherical-whittaker-normalization); AutomorphicFormsOnReductiveGroups §4.1 (constant-term transitivity); AutomorphicFormsOnReductiveGroups §§4.1–4.2 (gap:rational-fourier-support; gap:bessel-restriction-growth); §1.1; §1.4. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 supplies the carriers for unitary packets used by the indicated targets. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 6: Fourier support and period existence

### 6.1 Residual Fourier-support partitions

For a=N≥2 and a relevant parameter pair with smaller form dimension m, define `p_(phi,phi_prime)` as the partition with parts (a+m−1,a+1) for even SO H_W, (a+m,a−1,1) for odd SO H_W, and (a+m,a) for unitary H_W. Define `p^1_(phi,phi_prime)` as (a+m−1,1^(a+1)) in the even-SO branch and (a+m,1^a) otherwise. Reorder the multisets if necessary; every total is 2a+m. Keep admissibility and existence of rational Fourier data separate. Under the critical dimension relations p^1 is exactly `p_(k_0)(2a+m)`. The stronger upper-support statement that every support partition of every such residue is ≤`p_(phi,phi_prime)` is a separately named conjectural proposition, not a theorem used by the weak-support argument. (JZ2020, §6.3, pp.803–804, definitions preceding Conjecture 6.8; JZ2020 line 2907).

The construction has the following API.

- Each of p and p^1 has total 2a+m.
- For the special relevant pair, p^1 equals [2k₀+1,1^d].
- the upper-support proposition for (φ,φ′) quantifies over every relevant σ and every support partition; it asserts a dominance upper bound, not nonvanishing.

A proof route is as follows. Build the finite multisets and check their sums, positivity and parity in the relevant cases. Substitute d=m+2j+1 and the standard-dual dimension a to compare the critical partition. The general support and dominance constructions are supplied under the exact contracts above.

*Needs:* §5.3; §0.2; `Nat.Partition`; §1.1; LieHighestWeightPartII N2, classical-partitions; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance).

**Checks.**

- p^1 and p are different partitions.
- Geometric admissibility alone does not produce a rational orbit on every inner form.
- a=4,m=2 gives p=[5,5] and p^1=[5,1,1,1,1,1], both of size 10.
- a=6,m=1 gives p=[7,5,1] and p^1=[7,1,1,1,1,1,1], both of size 13.
- An empty support set satisfies the universal upper-bound condition but does not satisfy membership of p^1.

### 6.2 Weak Fourier-support proposition

Fix relevant generic discrete parameters (φ,φ′), τ attached to φ, a=N, the ambient type and the paper-convention central nonzero hypothesis L(1/2,φ×φ′)≠0. the weak Fourier-support proposition for (φ,φ′) is the proposition that there exist a coherent relevant inner form H_W, a cuspidal σ with parameter φ′, its realization C_σ, and a rational nilpotent datum of partition `p^1_(phi,phi_prime)` such that its coefficient on `R_(tau,sigma)` is nonzero. It quantifies over σ and its inner form, rather than asserting this for every σ. It is the explicit hypothesis of Conjecture 6.8. Its use in the unitary period implications requires the actual cross-factor and dual-parameter comparison the dictionary in §4.1; the printed central hypothesis is not silently equated with that cross factor. (JZ2020, Conjecture 6.8 and preceding hypotheses, pp.803–804; JZ2020 line 2976).

The construction has the following API.

- A proof supplies H_W,σ,C_σ and a nonzero rational coefficient of p^1.
- The partition comparison transports the witness to a nonzero critical descent on its stabilizer inner form.
- The quantifier is existential over automorphic members of the coherent global packets.

A proof route is as follows. Form the stated existential proposition with the actual residue and rational Fourier coefficient. Separate it from the stronger universal upper-support conjecture; neither proposition is introduced as an axiom.

*Needs:* §6.1; §5.2; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §4.1.

**Checks.**

- The central nonzero hypothesis is part of its scope.
- The witness includes a global coherent form, not an arbitrary collection of local forms.
- One witnessing automorphic σ suffices even when a different member of those packets has zero coefficient.
- Knowing all support is bounded by p does not supply a p^1 witness.
- The zero residual module has no witness; a tuple of merely local members of the packets does not circumvent this.

### 6.3 Known Fourier-support cases

Prove the comparison of the supplied classical m=0 GRS descent witness with the rational p¹ coefficient and normalized residue used here, for every group and parameter parity in the supplier theorem. Prove the anisotropic SO₂ support case with actual smaller form dimension 2 and ambient form SO_(2n+2,2n), of dimension 4n+2. JLXXZ2016, arXiv v2 Theorem 1.2(3),(6), PDF p.5, assumes cuspidal τ on GL_(2n) and gives the nonzero coefficient; the distinct-isobaric extension required by JZ2020 Proposition 6.9 is a separate assertion to prove. No unspecified unitary analogue is asserted. (JZ2020, Proposition 6.9, p.805, citing [23] and [40]; §7.2, p.809; JZ2020 line 2985).

A proof route is as follows. Import ModularityAndLanglandsExtensions §5.4 for the classical generic descent itself and compare its rational orbit, character, section and group embedding with §§0.6 and 5.9. For anisotropic SO₂ use the actual witness in JLXXZ2016 Theorem 1.2(3),(6), JLXXZ2016 line 189, line 1025, then establish the distinct-isobaric extension by an explicit residual/support argument with its classification inputs; a theorem assuming cuspidal τ alone does not imply this extension.

*Needs:* §6.2; §5.8; §4.6; ModularityAndLanglandsExtensions §5.4 (classical GRS descent); gap:nongeneric-residual-packets (distinct-isobaric support extension).

**Checks.**

- The label m=1 in the paper is not form dimension 1.
- No unsupported unitary-even empty-datum assertion is made.
- For n=1 and anisotropic smaller SO₂, the ambient signature dimensions are (4,2), total 6; a=2,k₀=1 gives critical [3,1,1,1] of size 6.
- An isobaric GL₄ input τ₁ boxplus τ₂ is not a cuspidal GL₄ input; the cuspidal premise of JLXXZ2016 Theorem 1.2 does not hold for it.

### 6.4 Central value produces a global period

For a coherent relevant parameter pair (φ,φ′), with a=N and L(1/2,φ×φ′)≠0 in the bilinear convention, suppose Weak Fourier support holds for the parameter pair with the prescribed even-SO normalizer twist on φ′. Assume the scoped inputs for residual packets, critical structure and the pairing dictionary. Then some coherent relevant inner-form pair has cuspidal realizations (π,σ) of the required parameters and a nonzero bilinear Bessel period. In the Hermitian formulation dualize the second parameter and the corresponding support input. The assertion is existence, not global uniqueness, and does not assume local GGP. (JZ2020, Theorem 6.10 and proof, pp.805–806; JZ2020 line 2991).

A proof route is as follows. Choose the weak-support witness and identify its partition with the critical Bessel partition. Take a nonzero irreducible cuspidal summand of the critical module; identify its parameter up to outer orbit. Use its nonzero projection, the explicit pairing dictionary and the forward unfolded-period implication to produce the smaller-period witness. Undo the normalizer twist to return to φ′.

*Needs:* §6.2; §6.1; §5.8; §4.6; §4.1; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- The chosen inner forms come from a single rational relevant datum.
- Local uniqueness is not used to invent an automorphic member of arbitrary coherent local packets.
- A support witness of size 10 with critical [5,1^5] has stabilizer dimension 5; a tuple of local groups lacking a global rational orbit supplies no such 5-dimensional coherent embedding.

### 6.5 Odd orthogonal–torus period criterion

Let `G* = SO_(2n+1)` be F-split and H* an anisotropic SO₂ over F, with generic relevant parameters φ,φ′. Among the pairs in their global coherent Vogan packets there exists a cuspidal pair with nonzero Bessel period exactly when L(1/2,φ×φ′)≠0, using the bilinear convention (equivalently the corresponding dual-second-parameter Hermitian convention). The weak-support hypothesis is discharged by the anisotropic SO₂ case, while the analytic and source-comparison obligations of the construction remain. This does not assert that the selected π lies on the split inner form itself. (JZ2020, Corollary 6.11, pp.806–807; JZ2020 line 3077).

A proof route is as follows. Use the rank-one orthogonal weak-support witness for the forward construction. Apply the period-to-central-value theorem for the converse, with the actual dual convention if the pairing is Hermitian.

*Needs:* §6.3; §6.4; §4.7.

**Checks.**

- Anisotropic SO₂ has a compact automorphic quotient; split SO₂ needs a separate central quotient.
- The conclusion is over the coherent packets, not over all inner forms independently.
- For the norm-one torus of C/R, |z|=1; for split SO₂ the positive component has norm parameter t>0 and ∫₁∞dt/t=∞. The compact-quotient assertion uses F-anisotropy.

### Examples

At a=4,m=2, the upper-support partition [5,5] and critical [5,1^5] both have size 10. At a=6,m=1 they are [7,5,1] and [7,1^6], both of size 13. The empty support set satisfies every universal upper bound and supplies no existential witness.

### Dependencies

This layer uses §5.3; §0.2; `Nat.Partition`; §1.1; LieHighestWeightPartII N2, classical-partitions; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance); §5.2; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §4.1; §5.8; §4.6; §4.7. The individual Needs lines separate the statement inputs from the indicated proof route.

## Layer 7: Recovery of cuspidal modules

### 7.1 Cuspidal module recovery proposition

For cuspidal π of a G-relevant generic discrete global parameter φ_τ, the concrete-module proposition for π is the proposition that there exist a smaller relevant group H, a cuspidal σ of generic parameter, chosen automorphic realizations, an ambient residual datum and a rational critical orbit with stabilizer identified with the specified G, for which the Hilbert twisted descent is isomorphic to the direct sum of the distinct isomorphism classes in the allowed outer orbit of π, each once. This is π for a singleton orbit and π⊕π^⋆ for a two-element even-SO orbit. Every conjugation and dual transport follows the pairing dictionary, and σ is displayed with the required normalizer twist. Principle 1.1 motivates this precise proposition; it is not an unconditional construction principle. (JZ2020, Principle 1.1, pp.743–744; Conjecture 6.7, pp.801–803; §7.1, p.807; JZ2020 line 2865).

The construction has the following API.

- A proof supplies σ, its realization, the ambient datum, rational orbit and equivariant module isomorphism.
- For an outer-fixed π the conclusion is one copy of π.
- For π not isomorphic to π^⋆ in the even-SO case the conclusion has exactly these two summands, each once.

A proof route is as follows. Form an existential proposition about actual residual and Fourier modules and a G(A)-equivariant Hilbert isomorphism. Keep one copy per distinct outer isomorphism class; an outer-fixed π must not be counted twice.

*Needs:* §5.9; §5.6; §4.1; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison).

**Checks.**

- The result concerns the specified inner form G.
- A stable parameter alone is not a concrete module.
- If π≅π^⋆, π⊕π is not the required module.
- If π≇π^⋆, a lone π is not the required outer-stable module.
- A module on a different rational inner form with the same transfer parameter is not a witness without a stabilizer isometry to G.

### 7.2 Cuspidal module recovery theorem

Let π be cuspidal of a G-relevant generic discrete global parameter. Assume the Generic Summand proposition for π, and assume the exact local GGP proposition on distinguished members at every localization of its resulting relevant parameter pair (with even-SO outer labels retained). Assume the analytic, convention, classification, spectral and tower inputs specified in Layers 0–5. Then the concrete-module proposition for π holds. There is one summand when its allowed outer orbit is a singleton and two distinct summands in the even-SO two-element case. No Whittaker genericity or global cuspidal multiplicity-one hypothesis is imposed. (JZ2020, Theorem 7.1 and proof, pp.807–808; JZ2020 line 3118).

Define the exact local proposition on distinguished members as follows: for each localization of the relevant generic parameter pair, over the disjoint union of its relevant pure inner forms, the set of pairs with nonzero Bessel Hom consists of one distinguished pair, modulo the prescribed even-SO outer equivalence. Its labels for packets, enhancements, characters, duals and relevance are those of this datum. Its API is the following.

- A proof supplies a nonzero local Bessel model for one distinguished relevant pair.
- Every other nonzero-model pair has that distinguished pair's labels, modulo the specified even-SO outer action.
- Transport of the entire framed pair, character and enhancement carries the distinguished orbit to the corresponding transported orbit.

 In a proved range import the supplier theorem with those labels; otherwise this is the explicit local hypothesis, not an assertion of a correspondence for arbitrary unlabelled representations. Generic Summand remains the existential proposition of §1.5. Neither premise contains the desired concrete residual module.

A proof route is as follows. Choose the Generic Summand witnesses and build the ambient datum with the prescribed stabilizer G. Convert its Hermitian nonvanishing to the appropriate bilinear dual-and-inverse-character statement. Apply reciprocal nonvanishing with the self-pair numerator to obtain a nonzero critical module; this conversion is essential in the unitary case (the dictionary in §4.1). Every constituent has the same standard parameter up to outer orbit and, by the forward unfolded implication, a nonzero compatible smaller period. At every place local GGP identifies the distinguished constituent up to the permitted outer action. Restricted tensor factorization identifies the global isomorphism class. Multiplicity-free decomposition and outer stability give exactly the stated orbit module.

*Needs:* §7.1; §1.5; §4.6; §5.8; §0.6; GanGrossPrasadUnitaryGroups §§3.9–3.11 (proved unitary ranges); GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 (shared unitary packets and normalization premises).

**Checks.**

- The exact local GGP theorem is an explicit hypothesis at every place; only its proved cases may discharge it.
- No dependency on the generic global GGP conclusion is used to prove its own construction.
- For distinguished local class sets {a_v} at every v, any surviving constituent must have exactly those labels modulo the allowed outer orbit; allowing {a_v,b_v} at even one place destroys that identification.
- If the allowed outer action fixes π, the sum over distinct classes has one copy; a forced second copy contradicts the multiplicity bound of §1.4.

### 7.3 Recovery from a regular Fourier coefficient

For a quasi-split classical G and a Whittaker-generic cuspidal π with relevant generic parameter, construct the Generic Summand witnesses from the regular Fourier coefficient and deduce the concrete-module proposition for π under the same exact local GGP hypotheses and scoped analytic inputs. Pin the smaller form: odd SO and odd U use dimension 0; even SO uses dimension 1 with trivial SO₁; even U uses dimension 1 with an actual U₁ character occurring in the coefficient. Thus the even-unitary ambient form has dimension 2N+1 and its inducing character is not an empty datum. The comparison with ModularityAndLanglandsExtensions §5.4 identifies its actual GRS module with this rational critical coefficient; the supplier theorem retains its exact group and parameter scope. (JZ2020, §7.2 and Corollary 7.2, p.809; §6.2, (6.8), pp.801–802; JZ2020 line 3190).

A proof route is as follows. Compute the regular Bessel partition and stabilizer in each type. In even U choose the actual nonzero U₁ character projection; do not replace its rank-one datum by an empty group. Import ModularityAndLanglandsExtensions §5.4 for classical GRS nonvanishing in its stated scope, compare its normalized residue, character and rational stabilizer with this module, and apply §7.2. The even-unitary comparison retains the nonempty inducing character and ambient dimension 2N+1.

*Needs:* §7.2; §1.5; §6.3; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); AutomorphicLFunctionsAndLocalFactors AL.3, whittaker-model; ModularityAndLanglandsExtensions §5.4 (classical GRS descent and its irreducibility scope).

**Checks.**

- For U₄, the smaller group is U₁ and the ambient form dimension is 9, not 8.
- For SO₄, the regular partition is [3,1] and its stabilizer is the trivial SO₁.
- For U₃ the regular Bessel partition [3] has smaller dimension 0; for U₄ the regular partition [3,1] has smaller dimension 1 and ambient dimension 9.
- SO₅ has regular [5], smaller dimension 0 and standard-dual dimension 4; SO₄ has regular [3,1], smaller dimension 1 and trivial SO₁.

### 7.4 Generic summand from subregular support

Let C_π be a cuspidal realization with relevant generic parameter and p^m(C_π)={p_subregular}. For SO_(2n) with n≥3 and the other displayed types with n≥1, construct a rational first-occurrence datum with a generic cuspidal summand as follows: for `SO_(2n)`, n≥3, p_subregular=[2n−3,3], j=n−2 and the smaller group is split SO₃; for `SO_(2n+1)`, p_subregular=[2n−1,1,1], j=n−1 and the smaller group is a form of SO₂; for `U_(2n)`, p_subregular=[2n−1,1], j=n−1 and the smaller group is U₁; for `U_(2n+1)`, p_subregular=[2n,1], j=n−1 and the smaller group is a form of U₂. Use first-occurrence cuspidality and show the smaller constituent has a generic parameter. In the SO-even and U-odd cases prove the required orbit-raising/collapse implication, rather than inferring it solely from the partition sizes. (JZ2020, Proposition 7.3 and its case analysis, pp.809–810, citing Jiang–Liu–Savin Theorem 11.2; JZ2020 line 3217).

A proof route is as follows. For torus smaller groups, take an actual nonzero character projection in the verified carrier and use its generic parameter. In even SO, prove that the Bessel coefficient with split SO₃ stabilizer is nonzero, then construct its generic-parameter constituent. JLS2016, arXiv v2 Theorem 11.2, PDF pp.21–22, JLS2016 line 830, line 855, gives special expansion for O, Sp and metaplectic groups; its Proposition 8.4 and rational-orbit refinements, followed by the O-to-SO comparison, are needed for the split-stabilizer claim. In odd U prove the independent unitary orbit-collapse and U₂ generic-summand statement; the orthogonal special-expansion theorem supplies neither assertion.

*Needs:* §1.5; §1.3; §0.3; §1.4; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance); ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §1.1 (torus carrier comparison); LieHighestWeightPartII N2, classical-partitions.

**Checks.**

- For U₅ the subregular partition [4,1] is not the Bessel partition [3,1,1].
- A nonzero smaller coefficient alone does not establish a generic parameter.
- For SO₆, [3,3] and its Bessel [3,1,1,1] both have size 6 but stabilizer extraction gives dimension 3; a split SO₃ datum needs a rational argument.
- For U₅, [4,1] and the Bessel [3,1,1] differ; both have size 5 and only the latter comes directly from index j=1 with smaller dimension 2.
- For SO₃ with n=1, the subregular partition is [1,1,1], j=0 and smaller dimension 2; its torus projection requires the verified central-character carrier.

### 7.5 Recovery from subregular support

If π has a relevant generic discrete global parameter and some cuspidal realization has p^m containing the valid subregular partition in the cases of §7.4, then the concrete-module proposition for π follows under the exact local GGP hypotheses and the scoped construction inputs. In these classical partition posets every nonregular admissible partition is dominated by the subregular one; since the latter is maximal in the support, regular support is excluded and p^m is its singleton. Prove this partition comparison, including the distinct very-even SO orbit labels, before applying the singleton-support theorem. (JZ2020, Corollary 7.4, p.810; paragraph starting §7.3, p.809; JZ2020 line 3246).

A proof route is as follows. Check dominance of the listed classical partitions: every nonregular admissible partition lies below the specified subregular one in these rank ranges. Maximality of the subregular support excludes the regular partition and any other maximal partition. Apply §7.4 and then the recovery theorem with all hypotheses retained.

*Needs:* §7.4; §7.2; LieHighestWeightPartII N2, classical-partitions; §1.1; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance).

**Checks.**

- Contains a subregular partition in support is weaker than contains it in maximal support; the theorem needs the latter.
- The unitary orbit-collapse proof is required.
- For SO₈, [5,3] dominates the two very-even [4,4] labels, since prefix sums are (5,8) versus (4,8). Regular [7,1] dominates [5,3], so support containing regular cannot have subregular maximal.
- For U₅, [4,1] dominates [3,2] with prefix sums (4,5) versus (3,5), but membership of [4,1] in a set also containing [5] does not make it maximal.

### Examples

U₄ regular recovery retains a U₁ character and ambient dimension 9. SO₆ subregular [3,3] needs the Bessel [3,1^3] and a split SO₃ comparison. U₅ subregular [4,1] needs a different Bessel [3,1,1] and a genuine U₂ generic-summand proof.

### Dependencies

This layer uses §5.9; §5.6; §4.1; ModularityAndLanglandsExtensions §§3.8, 3.12, 3.15–3.18 and 3.23 (gap:coherent-classical-parameters); GanGrossPrasadUnitaryGroups §§4.3–4.4 (unitary comparison); §1.5; §4.6; §5.8; §0.6; §7.2 (exact local proposition on distinguished members); GanGrossPrasadUnitaryGroups §§3.9–3.11 (proved unitary ranges); GanGrossPrasadUnitaryGroups §§4.1–4.4 (unitary); §1.1 and §2.1 (orthogonal); gap:bessel-restriction-growth; §6.3; GanGrossPrasadUnitaryGroups §§1.1–1.3 (unitary); §§0.1–0.3 (orthogonal); AutomorphicLFunctionsAndLocalFactors AL.3, whittaker-model; §1.3; §0.3; §1.4; LieHighestWeightPartII N2, classical-partitions (gap:classical-dominance); LieHighestWeightPartII N2, classical-partitions; §1.1. EndoscopicTransferAndUnitaryTraceComparison §§11.2–11.4 supplies the carriers for unitary packets used by the indicated targets. The individual Needs lines separate the statement inputs from the indicated proof route.

## Downstream consumers

The resulting library supplies concrete cuspidal models to applications requiring an actual rational inner form and a specified automorphic realization, together with their bilinear/Hermitian period transport. It supplies period-to-central-value nonvanishing without local GGP, period existence under weak Fourier support, and concrete recovery under Generic Summand and the exact local premise on distinguished members. Further GGP period formulas consume these outputs after their own analytic inputs; none of those formulas is used to construct this module.

## References

- **JZ2020.** Dihua Jiang and Lei Zhang, [Arthur parameters and cuspidal automorphic modules of classical groups](https://annals.math.princeton.edu/2020/191-3/p02), Annals of Mathematics 191 (2020), 739–827, DOI 10.4007/annals.2020.191.3.2. Locators use the published journal pages, with line numbers from its publisher-open extraction. Theorem and proof locators throughout distinguish supplied statements from the additional comparison targets.
- **Zhang2022.** Lei Zhang, [Note on the unramified computation of Rankin–Selberg integrals for quasi-split classical groups of Bessel model case](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/2230-10.pdf), RIMS Kôkyûroku 2230, note on the 2022 conference. Theorem 1.1, PDF pp.2–3, Proposition 2.1, PDF p.4, §§3–5, PDF pp.4–7. This route concerns nonarchimedean unramified calculations and does not assert all-place continuation.
- **AGRS2010.** Avraham Aizenbud, Dmitry Gourevitch, Stephen Rallis and Gérard Schiffmann, [Multiplicity one theorems](https://arxiv.org/abs/0709.4215v1), arXiv v1, Theorem 1′; published Annals of Mathematics 172 (2010), 1407–1434. The cited numbering is that of the version read.
- **JSZ2010.** Dihua Jiang, Binyong Sun and Chen-Bo Zhu, [Uniqueness of Bessel models: the archimedean case](https://arxiv.org/abs/0908.1728v2), arXiv v2 (2009), Theorem A, PDF pp.1–2, JSZ2010 line 24; published Geometric and Functional Analysis 20 (2010), 690–709. The O-group statement requires the SO comparison in §1.4.
- **JLXXZ2016.** Dihua Jiang, Baiying Liu, Bin Xu and Lei Zhang, [The Jacquet–Langlands correspondence via twisted descent](https://arxiv.org/abs/1501.00506v2), arXiv v2 (2015), Theorem 1.2(3),(6), PDF p.5, JLXXZ2016 line 189, and Proposition 3.3, line 1025; published International Mathematics Research Notices 2016, 5455–5492, DOI 10.1093/imrn/rnv312. The witness cited here retains its cuspidal GL input.
- **JLS2016.** Dihua Jiang, Baiying Liu and Gordan Savin, [Raising nilpotent orbits in wave-front sets](https://arxiv.org/abs/1412.8742v2), arXiv v2 (2015), Theorem 11.2, PDF pp.21–22, JLS2016 line 830, line 855, and Proposition 8.4. Orthogonal, symplectic and metaplectic special expansion is distinguished from the unitary comparison in §7.4.
- **GRS2011.** David Ginzburg, Stephen Rallis and David Soudry, [The descent map from automorphic representations of GL(n) to classical groups](https://doi.org/10.1142/9789814304993), World Scientific, 2011. This book is cited by locator alone, without certification of its proof text. Theorems 5.1, 5.4, 5.6 and 7.3 are the classical calculation and tower locators cited by JZ2020, pp.756,793–799, JZ2020 line 713, line 2399, line 2439, line 2560. The additional all-inner-form and unitary comparisons are targets here, not claims about those theorem statements.
