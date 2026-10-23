# Roadmap: archimedean regulators, primitive periods and arithmetic volumes

**Summary.** Build the Chern-normalized Borel regulator on the actual higher Quillen groups of every number field, its integral image lattice and its zeta covolume. The proof passes through rational-gauge arithmetic volumes and compact primitive periods, retains the empty determinant, and identifies the number-field target with real Deligne cohomology and the universal Beilinson regulator. The arithmetic ranks and stable comparison, general K-theory, universal Chern realization, differential geometry and adelic measures are supplied by their own roadmaps.

## Scope and ownership

This roadmap owns the embedding Tate lattice, the specified arithmetic regulator and its real isomorphism, the point realization and Borel–Beilinson comparison, the classical division-algebra volume input, and the primitive-period determinant and zeta covolume. The number-field regulator block is the shared input of PeriodsAndSpecialValues PS.3.2a; that roadmap retains its determinant and fundamental lines, general conjectural special-value predicates, and mixed Tate applications. The type-A norm-one theorem is the input used by EndoscopicTransferAndUnitaryTraceComparison §6.2; its general simply connected semisimple Tamagawa theorem and endoscopic proof remain there. Section 3.1 supplies the period–index input of HeightsRationalPointsAndObstructions §3.6.

ArithmeticKTheory §§3.2–3.4 owns finite generation, the actual rational localization and order equivalences, the stable arithmetic and relative-Lie comparison and Borel ranks. These theorems are inputs here, independent of regulator values. GeneralAlgebraicKTheory §3.12 and §§7.4–7.8 owns Quillen groups, the plus/Q comparison and transfers; StableHomotopyKTheory §§3.37,4.14 owns the finite-type rational H-space comparison and stable GL plus multiplication. CharacteristicClasses C5a/C6 and TopologicalKTheory T4/T7 own compact transgression, characteristic classes and Bott theory. Section 4.3 computes their specific rational Lie-algebra-to-compact period for restriction of scalars of SL, rather than another compact-Lie cohomology theory.

MotivicEtaleKTheory owns the universal motivic Chern character, cycle-model comparisons and Deligne regulator for varieties. Section 6.1 owns its explicit point/embedding-space identification and §6.2 its Borel comparison. The universal supplier is an explicit gap below, not a construction assumed from a section title in a consumer. Polylogarithms §§2.3,3.7–3.8,4.4 owns explicit symbol comparisons and their factorial/Hurewicz and π^(n−1) calibrations. None supplies an input to this proof. Higher symplectic arithmetic stability and KSp are outside this number-field SL regulator contract; their natural owner is ArithmeticKTheory, Part II.

The pinned definitions of embeddings, discriminant, module quotients, determinants, discrete full lattices and covolume are used directly. Tau Ceti’s TauCeti.Hodge.tate in TauCeti/Geometry/Hodge/Tate/Basic.lean:91 is a Hodge structure with the ordinary unscaled inclusion of ℤ into ℂ as its lattice map. The coefficient lattices here instead specify multiplication by (2πi)^k and the embedding involution; they introduce no second Hodge-structure carrier. The degree-one unit lattice and Dirichlet regulator are already in Mathlib and the completed NumberFieldArithmetic roadmap. At weight one the unit regulator lies in the sum-zero hyperplane; the whole group Fˣ has no finite-rank lattice theorem. No positive-characteristic global-field regulator, nonpositive-weight value theorem or integral Lichtenbaum torsion formula is asserted here. All number fields, finite primes, ramification and both parities occur in the higher-weight theorem.

## Conventions

A number field F has O_F its full ring of integers, Σ_F all embeddings into ℂ, N=[F:ℚ]=r₁+2r₂, and Δ_F=|disc F|>0. Groups are actual connective Quillen groups, written additively; tensor products of their underlying ℤ-modules use the scalar-tower identifications of their suppliers. The main higher-weight hypotheses are n≥2; the elementary Tate target and point quotient are also defined at n=1. All finite extensions carry their specified algebra structure. Universes are arbitrary within the native field and category carriers; Σ_F is finite without a choice of a universe-sized enumeration.

The real and integral Tate lines are ℝ(k)=(2πi)^kℝ and ℤ(k)=(2πi)^kℤ. Conjugation acts simultaneously on the embeddings and coefficients. In the selected coordinates one divides by (2πi)^(n−1), taking all real embeddings in odd weight and one representative of each complex pair in either parity. Real coordinates at fixed embeddings vanish in even weight. Thus dₙ=r₁+r₂ for odd n and dₙ=r₂ for even n. A complex representative change has sign (-1)^(n−1). Rows index the selected embeddings and columns index K-basis elements. The coordinate lattice has covolume one. Ordered determinants are signed; covolumes are positive absolute determinants. An empty exterior generator, empty determinant and zero-dimensional normalized covolume are all 1.

Write x∈ℚˣ·y to mean that x=qy for some nonzero rational q, and x∈ℚ_>0·y for a positive rational q. This notation does not assign meaning to a quotient by zero. Every use below proves the two quantities nonzero. Powers with possibly negative exponent, such as π^(dₙ−Nn), are integer powers over ℝ, never natural subtraction. Continued zeta values and leading coefficients refer to the analytic germ supplied by LFunctions Layer 3; no out-of-convergence value of the raw series or totalized Gamma value is used.

The cohomological comparison in degree q is jℝ=i^q μ for the identical complex extension μ of invariant forms. Its primitive determinant has zeta exponent −Nn. The Tate-divided renormalized regulator has exponent dₙ−Nn. The two are linked by §5.2, not identified. The compact generator is εₙ=(-1)^n clutch(u^n) for the ordered complex suspension and TopologicalKTheory’s u=O(-1)−1. Its character is -v at the Bott coefficient, so u² and -u³ have character coordinates +1 and +1 in their respective weights. The integral calibration contract proves that εₙ pairs suspended chₙ to (2πi)^n. In this suspended Chern convention r_Bo=2r_Be. This is a comparison of two independently constructed maps.

At finite places q_v=#k_v≥2, additive mass of O_v is 1, and at infinity the coordinate measures are dx and 2dxdy. Borel’s infinite measure for a dimension-h group is Δ_F^(−h/2) times the infinite product of local gauges. Its finite product has no second discriminant scalar. Left and right quotient conventions are identified by inversion for these unimodular groups; counting measure on discrete arithmetic subgroups fixes finite-index volume changes. One nonzero global rational form fixes every local gauge. A complex coordinate chart change uses the squared complex absolute value.

**Checks.**

- A weight-two imaginary pair has divided coordinates (t,-t); a weight-three pair has (t,t). A real weight-two coordinate is 0. The weight-three Tate generator is -4π² and its divided coordinate is 1.
- The degree-one and degree-two correction factors multiply to i·(-1)=-i=i³. In degree five the correction is i. For ℚ in weight 3 the final determinant phase exponent is 2, giving -1, which belongs to ℚˣ.
- On a one-dimensional test lattice tℤ, covolume is |t|. The sublattice 2tℤ has covolume 2|t|. In dimension zero the value is 1 in both conventions.
- Over ℚ a form scaling by 2 multiplies the infinite and finite measures by 2 and 1/2, whose product is 1. At a complex place the local scalar multiplier is |2|²=4. For F=ℚ(i), h=3 the factor 4^(−3/2)·2³ equals 1 relative to ordinary complex coordinate Lebesgue measure.

## Exact supplier contracts

### From Mathlib

The baseline is mathlib commit 6b7abb3c7686292736be2955bd3eb9ebf63b456a. The following are the precise native inputs.

- `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`, in Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean:474, states r₁+2r₂=finrank ℚ F for a number field. The complex-embedding and infinite-place carriers in that file supply conjugation and the finite indexing set; §1.1 adds the twisted fixed submodule.
- `NumberField.discr` and `NumberField.discr_ne_zero`, in Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:35 and :41, use the ring-of-integers basis. They ensure Δ_F>0.
- `Submodule.mkQ` and `Submodule.mkQ_surjective`, in Mathlib/LinearAlgebra/Quotient/Defs.lean:227 and :236, give the native module quotient and its surjective projection. The quotient requires no topology. Sections 4.1 and 6.1 specify the submodules being quotiented.
- `IsZLattice`, in Mathlib/Algebra/Module/ZLattice/Basic.lean:433, has a separate discrete-subtype-topology parameter and a field-span-equals-top field. Both must be established. It is not merely finite generation or abstract freeness.
- `ZLattice.covolume`, `ZLattice.covolume_pos` and `ZLattice.covolume_eq_det`, in Mathlib/Algebra/Module/ZLattice/Covolume.lean:72, :98 and :125, measure an actual discrete spanning ℤ-submodule. The positivity and determinant theorems require a finite-dimensional real normed space, Borel measurable structure, and an additive Haar measure as specified there. The determinant version uses the standard coordinate space and its volume; §1.1 transports precisely that measure.
- `NumberField.dedekindZeta`, in Mathlib/NumberTheory/NumberField/DedekindZeta.lean:49, is the ideal-count L-series. `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` in the same file:77 is a one-sided residue theorem at 1; it is not the functional equation. `Matrix.det_fin_zero`, in Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:798, sets the empty determinant to 1. `riemannZeta_two` and `riemannZeta_four`, in Mathlib/NumberTheory/LSeries/HurwitzZetaValues.lean:226 and :232, give ζ(2)=π²/6 and ζ(4)=π⁴/90 as complex equalities.

### From Tau Ceti

The baseline is Tau Ceti commit a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. `TauCeti.exists_differentiableOn_eq_dedekindZeta_sub`, in TauCeti/NumberTheory/NumberField/DedekindZeta.lean:158, supplies a holomorphic remainder on Re(s)>1−1/N agreeing with ζ_F(s)−ρ/(s−1) on Re(s)>1. It does not provide the global continuation or functional equation. The LFunctions supplier identifies its continuation with this local germ and with Mathlib’s convergent function.

### From TauCetiRoadmap.GeneralAlgebraicKTheory

§3.12, §§7.4–7.8 supplies actual Quillen groups, the specified plus/Q comparison and finite-projective transfer with naturality.

### From TauCetiRoadmap.StableHomotopyKTheory

§3.37, §4.14 supplies stable GL plus H-space and rational primitive Hurewicz only for path-connected H-spaces with finite-type rational homology.

### From TauCetiRoadmap.ArithmeticKTheory

§3.2, §3.3, §3.4 supplies finite generation for number rings and finite S; actual rational localization; stable arithmetic invariant-form comparison, primitive generators and Borel ranks, independent of regulator values.

### From TauCetiRoadmap.ArithmeticLocallySymmetricSpaces

ALS.F.5, ALS.0.4–ALS.0.9, ALS.5b.1 supplies relative CE cochains, actual symmetric spaces and arithmetic quotients, manifold and finite-stabilizer comparisons, de Rham identification.

### From TauCetiRoadmap.AutomorphicFormsOnReductiveGroups

§§1.1–1.3 supplies differentiable and continuous cochains on the native carriers and the finite-dimensional coefficient van Est comparison with full compact subgroup.

### From TauCetiRoadmap.AdelicAlgebraicGroups

§1.4, §§2.2–2.5, §3.4, §4.2 supplies scalar restriction, quotient integration, gauges and Tamagawa normalization, SL₁(D), anisotropic compactness and simply connected strong approximation.

### From TauCetiRoadmap.ClassFieldTheory

Layer 5, Layer 10 supplies normalized local Brauer invariants, restriction multiplied by local degree, finite support and exact number-field Brauer invariant sequence.

### From TauCetiRoadmap.ArithmeticGaloisDuality

§R02.4.5b, §R02.4.6 supplies grunwald–Wang with its dyadic exceptional class, used only through the additional full-local-degree contract.

### From TauCetiRoadmap.LFunctions

Layer 3 supplies the continued Dedekind function, its germ regularity, completed functional equation and agreement with the pinned convergent function.

### From TauCetiRoadmap.CharacteristicClasses

C5a.3–C5a.5, C6 items 2–3 supplies actual compact-Lie primitive/transgression comparisons and rational universal Chern characters; integral homotopy calibration is separately a gap.

### From TauCetiRoadmap.TopologicalKTheory

T4, T7 item 1 supplies complex Bott and real coefficient maps, including complexification and realification, with fixed generators.

### From TauCetiRoadmap.DifferentialGeometry

Layers 5–6, Layer 8 supplies oriented integration, Stokes and multiplicative de Rham/period comparison.

### From TauCetiRoadmap.SchemeKTheoryOperations

§6.8 supplies actual higher Adams operations and their affine Quillen comparison for regular Noetherian finite-dimensional schemes with ample family.

### From TauCetiRoadmap.AlgebraicTopology

Stage 5 item 5 supplies the native bundle Serre filtration, its monodromy and Leray–Hirsch applications; the missing multiplicative cohomological comparison is a separate contract.

### Required extensions and unwritten contracts

Each item is represented by a gap prerequisite in the data plan. A named supplier retains ownership of its extension; a missing section is not treated as an existing one.

**ArithmeticKTheory — stable-finite-range.** ArithmeticKTheory §3.4 owns the stable arithmetic and relative-Lie comparison and its primitive generators, but does not state the finite-stage bound used here. Supply actual invariant-form comparison maps, stabilization and rational finite-index restriction; for Res SL_a over F the range a−1>4Nq must imply isomorphism through degree q. Finite-type is used only on the arithmetic plus H-space, not on GL(ℂ) with its discrete topology. Supply the map-level finite-stage comparison and the conservative bound a−1>4Nq. Required location: §3.4, explicit finite-stage form of the stable comparison.

**CharacteristicClasses — integral-chern-calibration.** CharacteristicClasses C5a/C6 supplies rational primitive transgression and the Chern character; TopologicalKTheory T4/T7 item 1 supplies Bott classes and real/complex coefficient maps. The exact bridge to π_(2n−1)SU, its integral Hurewicz image, and the SO\SU-to-SU index is not stated in those contracts. Require suspended chₙ(Hur ε)=(2πi)^n and the indices 1 in degree 1 mod8 and 2 in degree 5 mod8, with εₙ=(-1)^n clutch(u^n) for the supplier’s u=O(-1)−1. Its character is -v; the ordered suspension/clutching comparison is part of this bridge. This is a characteristic/topological K-theory extension, not permission to renormalize by an arbitrary real scalar. Supply the integral Bott-to-suspended-Chern bridge and real-place homotopy indices with fixed orientations. Required location: C6 items 2–3 extension, coordinated with TopologicalKTheory T4 and T7 item 1.

**ArithmeticGaloisDuality — cyclic-local-degrees.** ArithmeticGaloisDuality R02.4.5b–R02.4.6 retains the exact exceptional class for fixed character prescriptions. Supply the consequence used in Poonen’s proof: for any a≥1 and finite set of finite places, a cyclic degree-a extension may be chosen with local degree a at those places, with the local extensions allowed to vary, and with selected real places complex when a is even. No assertion of arbitrary prescribed unramified dyadic extensions is made. Supply cyclic splitting extensions with full local degrees while retaining Wang’s obstruction for fixed prescriptions. Required location: §R02.4.6, variable-local-extension corollary.

**AdelicAlgebraicGroups — inner-type-a-structure.** AdelicAlgebraicGroups §3.4 explicitly constructs SL₁(D), its semisimplicity and quotient compactness. Strong approximation in §4.2 additionally needs absolute almost simplicity and simple connectedness. Supply these properties by base change to SL_a for every central division algebra of degree a≥2; no new group carrier is needed. Supply absolute almost simplicity and simple connectedness of the existing SL₁(D) carrier. Required location: §3.4 norm-one construction, structure extension.

**AdelicAlgebraicGroups — adelic-rational-masses.** AdelicAlgebraicGroups §2.4 gives smooth integral-model masses and gauge scaling. It does not assert rationality of the mass of every compact open for every rational invariant form at an arbitrary finite place. Require that result for smooth affine algebraic groups over nonarchimedean characteristic-zero local fields with finite residue field, using the fixed coordinate Haar normalization. Include finite-index comparison and compatibility with a single global rational gauge; a hyperspecial-only theorem cannot discharge the ramified factors. Supply positive rational local gauge masses for all compact opens, including ramified finite places. Required location: Part II, rational gauge masses extending §2.4.

**BorelRegulators — classical-tamagawa-proof.** Section 3.4 states the numerical theorem. Weil §3.3 Theorem 3.3.1 is waived, and Borel invokes it without its proof. Neither the waived text nor the general later trace-formula proof certifies the prerequisite closure of the classical adelic norm-one argument. A source-certified decomposition of that classical argument is needed to replace this proof-route gap; it may introduce adelic integration and norm-fibre comparison lemmas, but must name and state them rather than assume the desired number. This gap is not a hypothesis of the theorem and not a request to reopen the waived source. Provide a legally checked decomposition of the classical norm-one Tamagawa proof into independently stated inputs. Required location: §3.4 proof route.

**ArithmeticKTheory — order-finite-generation.** ArithmeticKTheory §3.4 explicitly supplies the rational inclusion equivalence for every order. The integral image being a lattice also needs finite generation, not only a rational dimension. Supply finite generation of K_m(R) for every full ℤ-order R in a number field and m≥2, or an equally strong finite-index image theorem. Number-ring and finite-S finite generation in §3.3 cannot silently be applied to a singular nonmaximal order. Supply finite generation or a finite-index integral comparison for higher K-groups of all number-field orders. Required location: Part II, integral order comparison extending §§3.2–3.4.

**MotivicEtaleKTheory — universal-deligne.** The universal-realization prefix requires a designed section of MotivicEtaleKTheory. It must provide actual real Deligne cohomology and rational Chern regulators, including the point, finite disjoint unions, real descent, universal bundle class and maps from actual Quillen K-theory, naturality for embeddings and finite transfers, and chₙψ^a=a^n chₙ. Its prefix is independent of the Borel zeta-value and explicit polylogarithm comparisons. Consumer references to Layer 4 or §§9.1,12.2 are not treated as existing sections. Supply the independent universal Chern/Deligne regulator and its point, transfer and Adams compatibility. Required location: No designed section; early universal-realization prefix.

**MotivicEtaleKTheory — infinitesimal-classifying-comparison.** Burgos Chapter 8, Propositions 8.9,8.10,8.14 and the proof of Theorem 10.9 compare normalized cosimplicial functions/forms on the first infinitesimal classifying nerve with CE and Weil complexes. No consumed roadmap states this precise comparison with its cone and coefficient normalizations. It must be provided independently of the factor-two conclusion, over the actual universal classifying model, with evaluation into continuous cohomology. This is an extension of the universal-realization prefix, not a new local regulator defined to make the equation true. Supply normalized infinitesimal classifying-space CE/Weil comparisons with the Deligne cone projection. Required location: No designed section; classifying-space realization comparison.

**Acceptance signatures — pinned-headline-carriers.** Make native supplier carriers available for the acceptance signatures without placeholder data or theorem-shaped hypotheses. The native higher K and Deligne objects must be available before these signatures can be expressed with only simple transparent definitions.

**CharacteristicClasses — graded-indecomposable-api.** CharacteristicClasses C5a.2 already constructs the invariant-polynomial augmentation quotient and its coefficient and generator changes. Its generalization to every connected nonnegative graded commutative algebra, needed for cohomology of arithmetic quotients and compact duals, belongs to its Part II. Supply Q(A)=A₊/(A₊)², the homogeneous quotient, quotient universal property, map and base-change laws, and the exterior-generator comparison. Section 4.1 constructs only the cohomological determinant adapters, not a second generic augmentation quotient. Supply one generic graded indecomposable functor extending the existing invariant-polynomial construction. Required location: Part II, general graded quotient API extending C5a.2.

**DGFloer — multiplicative-serre-comparison.** AlgebraicTopology Stage 5 item 5 calls for the cohomological counterparts and multiplicative local-pairing API of DGFloer Layer 1 item 2. That item on main states CW approximation and the homological sequence but not the needed multiplicative cohomological construction. Supply its characteristic-zero cohomological sequence, naturality, convergence and comparison with the filtration on relative Lie cochains used for K→G→G/K and the corresponding arithmetic bundle. The edge restriction and the identity on the common compact fibre must be preserved; an abstract ring isomorphism is insufficient. Supply the multiplicative cohomological Serre machinery and its invariant-form filtration comparison. Required location: Part II, cohomological Serre comparison extending Layer 1 items 2–3.

## How to read the build

Layer 1 fixes the embedding target, trace and analytic leading coefficient. Layer 2 constructs and identifies the actual regulator using the independent arithmetic comparison. Layer 3 develops the division-algebra, gauge and volume input. Layer 4 extracts primitive arithmetic periods by compact cycles and lower-degree exterior ideals. Layer 5 cancels the common compact-fibre determinant, converts the homotopy lattice to Tate coordinates, and proves the integral zeta covolume and localization statements. Layer 6 identifies the point Deligne realization and compares the independently supplied Beilinson map, with its Adams consequence. Layer 7 isolates the totally real even-weight consequence so that a consumer must import its volume proof even when the final regulator rank is zero. Every proof route lists its own direct inputs; the Deligne comparison is not a prerequisite of the volume or zeta theorem.

## Layer 1: Tate coordinates, trace and leading coefficients

### 1.1 The embedding space and its integral coordinates

For every n≥1, define Vₙ(F) as the real subspace of Σ_F → ℂ consisting of functions taking values in (2πi)^(n−1)ℝ and satisfying v(conj σ)=conj(v(σ)). Define Cₙ(F) by requiring these values to lie in (2πi)^(n−1)ℤ. Selection of all real embeddings when n is odd and one embedding per nonreal conjugate pair identifies Vₙ(F) with ℝ^dₙ and Cₙ(F) with ℤ^dₙ, where dₙ=r₁+r₂ for odd n and r₂ for even n. Give Vₙ the transported finite-dimensional norm and coordinate Haar measure of covolume one on Cₙ. (burgos2002, Proposition 9.22 and Corollary 9.23, p.85, lines 3650–3709.)

A proof route is to divide by the nonzero scalar (2πi)^(n−1). Conjugation becomes v(conj σ)=(-1)^(n−1)v(σ) on real coordinates. Fixed real embeddings therefore contribute only in odd weight; each nonreal pair contributes once. Construct both inverse coordinate maps explicitly.

The interface requires the following facts.

- Two vectors are equal if their values at every embedding agree; selected surviving coordinates already suffice.
- Coordinate evaluation divided by (2πi)^(n−1) is a real linear equivalence carrying Cₙ onto the standard integer lattice.
- The real dimension is dₙ; the inherited lattice is discrete and spans.
- The coordinate equivalence and its inverse are continuous for the native subspace topology from Σ_F→ℂ. The transported norm has this topology; normalized covolume uses the coordinate Haar measure.
- Permuting selected embeddings gives a permutation matrix. Replacing a complex representative by its conjugate multiplies that coordinate by (-1)^(n−1); these changes preserve coordinate Haar measure.

**Checks.**

- For F=ℚ, n=2 the equation t=-t gives t=0 and dimension 0; n=3 allows every t and has dimension 1. Reversed parity fails both.
- For ℚ(i), n=2 the divided pair is (t,-t), and n=3 it is (t,t); both spaces have dimension 1, not 2.
- The selected value (2πi)^(n−1) has coordinate 1; in weight 3 the value is -4π² and still has coordinate 1. An untwisted coordinate would give -4π².
- For a totally real field in even weight, Cₙ=Vₙ={0}; the standard fundamental domain is a point of mass 1.
- At weight 2 an imaginary pair with divided coordinate 1 has ambient product sup norm 2π and coordinate norm 1. At weight 3 a real Tate generator has native norm 4π² and coordinate norm 1. The topologies agree, but no unscaled isometry is asserted.

*Needs:* Mathlib `NumberField.InfinitePlace.card_add_two_mul_card_eq_rank`; Mathlib `IsZLattice`; Mathlib `ZLattice.covolume`.

### 1.2 Restriction and sum over embeddings

For a finite extension E/F, define R:Vₙ(F)→Vₙ(E) by (Rv)_τ=v_(τ|F), and T:Vₙ(E)→Vₙ(F) by (Tw)_σ=Σ_(τ|σ)w_τ, summing over all embeddings extending σ. Both preserve the coordinate lattices, commute with conjugation, and satisfy T∘R=[E:F]·id. Restriction and trace compose in towers. (burgos2002, Proposition 9.21, p.85, lines 3628–3645; embedding assembly in Definition 10.8, p.94, lines 4091–4106.)

A proof route is to partition the embeddings over each σ into fibres. Separability of number fields gives [E:F] points in each fibre. Check that conjugation sends one fibre bijectively onto the conjugate fibre. This is the target-space map used by K-theoretic transfer.

The interface requires the following facts.

- The displayed coordinate formulas determine the two real linear maps uniquely.
- T(R(v))=[E:F]v for every v.
- For L/E/F, T_L/F=T_E/F∘T_L/E and R_L/F=R_L/E∘R_E/F; identity extensions give identity maps.

**Checks.**

- For ℚ(i)/ℚ in weight 2, T(t,-t)=0 in the zero target; averaging only the selected coordinate would give t.
- For ℚ(i)/ℚ in weight 3, R(t)=(t,t) and T(R(t))=2t. A trace divided by two fails this law.
- For a real quadratic extension in odd weight T(a,b)=a+b and R(t)=(t,t); the identity extension gives T(t)=t.

*Needs:* §1.1; GeneralAlgebraicKTheory §§7.4–7.8.

### 1.3 The analytic leading coefficient

Using LFunctions Layer 3’s continued Dedekind function, define ζ_F*(1−n) to be the coefficient of (s−(1−n))^dₙ in its analytic germ at 1−n. Prove that the germ has order exactly dₙ, this coefficient is real and nonzero, and it is the punctured limit ζ_F(s)/(s−(1−n))^dₙ. Prove ζ_F*(1−n)∈ℚˣ·√Δ_F·π^(dₙ−Nn)·ζ_F(n), with ζ_F(n)>0 and equal to the pinned convergent value. (borel1977, §1.4, p.616, lines 127–139; §6.4, p.633, lines 600–615.)

A proof route is to apply the supplied completed functional equation at n and 1−n. Count the simple gamma poles at real and complex places and evaluate their nonzero residues; there are exactly dₙ. The remaining factorials and powers of two are nonzero rational factors. Real coefficients give conjugation symmetry; the positive Dirichlet series at n fixes nonvanishing. Use an analytic germ, never the totalized value of Gamma at a pole.

The interface requires the following facts.

- The punctured complex limit is the real leading coefficient embedded in ℂ; at dₙ=0 it is the analytic value.
- For every n≥2 the coefficient is nonzero and the order is dₙ.
- Its ratio to √Δ_F π^(dₙ−Nn) ζ_F(n) is a nonzero rational number.

**Checks.**

- At F=ℚ,n=2, d=0 and ζ*(-1)=-1/12, whereas ζ(2)/π²=1/6; their ratio is -1/2.
- At F=ℚ,n=3, d=1 and ζ*(-2)=ζ′(-2)=-ζ(3)/(4π²); the analytic value ζ(-2)=0 is the wrong leading coefficient.
- At F=ℚ,n=4, d=0 and ζ*(-3)=1/120; dividing by ζ(4)/π⁴=1/90 gives 3/4.
- At n=1, ζ_F has order r₁+r₂−1 at 0, not the odd-weight formula r₁+r₂. For ℚ the two numbers are 0 and 1.

*Needs:* §1.1; LFunctions Layer 3; Mathlib `NumberField.dedekindZeta`; Mathlib `NumberField.discr_ne_zero`.

### Examples

For ℚ the coordinate dimensions in weights 2 and 3 are 0 and 1. For an imaginary quadratic field both are 1. A real quadratic field has dimensions 0 and 2.

### Dependencies

Pinned embedding and lattice linear algebra; LFunctions Layer 3 for the continued zeta germ.

## Layer 2: Primitive classes and the specified arithmetic regulator

### 2.1 The Chern-normalized continuous class

For n≥2 and matrix size b≥2n+1, construct the class Boₙ,b in H_cont^(2n−1)(GL_b(ℂ),ℝ(n−1)). It is the image of the suspended twisted Chern character chₙ under restriction to U(b), invariant-form identification with the compact dual, identity inside the complexified relative cochains, and inverse van Est. Its restrictions along trailing-identity block inclusions agree. Use the ordered complex suspension and εₙ=(-1)^n clutch(u^n), where u=O(-1)−1 is TopologicalKTheory’s chosen Bott class. Prove that suspended chₙ evaluates on εₙ to (2πi)^n. (burgos2002, Definition 9.24, p.86, lines 3733–3753; Proposition 9.22, p.85, lines 3670–3688.)

A proof route is to use the actual universal Chern class and cohomological suspension, then the indicated cochain maps. Check compatibility with conjugation and stabilization before passing to the limit. Construction uses ordinary Hurewicz when evaluated on algebraic K-theory; it needs no finite-type rational primitive isomorphism for the discrete group GL(ℂ).

The interface requires the following facts.

- Restriction from b+1 to b preserves Boₙ,b.
- Complex conjugation on matrices and ℝ(n−1) together fixes the class.
- Suspended chₙ evaluates on the specified compact homotopy generator εₙ=(-1)^n clutch(u^n) to (2πi)^n; replacing chₙ by the zero class or twice chₙ fails this equation.

**Checks.**

- In weight 2 the suspended character evaluates to (2πi)²=-4π²; after dividing by that Tate generator the value is 1.
- In weight 3 the value is (2πi)³=-8π³i and its Tate coordinate is 1; replacing ch₃ by c₃ changes the generator by the factorial 2.
- Adding an identity block preserves the reduced universal bundle class and hence adds 0 to the positive-degree character, rather than multiplying its value by the matrix size.

*Needs:* CharacteristicClasses C5a.3–C5a.5 and C6 items 2–3; AutomorphicFormsOnReductiveGroups §§1.1–1.3; the exact supplier contract integral-chern-calibration.

### 2.2 The regulator on actual Quillen groups

Construct r_Bo:K_(2n−1)(O_F)→Vₙ(F) by mapping to each K_(2n−1)(ℂ), applying the plus/Q comparison and ordinary Hurewicz, and evaluating Boₙ. Use the inverse of the actual rational inclusion K_(2n−1)(O_F)⊗ℚ→K_(2n−1)(F)⊗ℚ to define r_Bo,ℚ on field K-theory. This rational map agrees with the direct embedding construction. (burgos2002, Definition 9.19 and Proposition 9.21–Corollary 9.23, pp.84–85, lines 3577–3709.)

A proof route is to preserve the actual maps from Q-theory to the plus model and into discrete group homology. Evaluation of the primitive stable class is additive. Its conjugation law lands in Vₙ. Rational localization is used by its specified inverse, so extension of the field map cannot be chosen up to an unrelated scalar.

The interface requires the following facts.

- At every σ the coordinate is precisely the Boₙ evaluation of σ_*(x).
- The integral map is additive and annihilates every torsion element.
- For x in the integral K-group, r_Bo,ℚ(j_*(x)⊗1)=r_Bo(x); this property uniquely determines the rational field map.

**Checks.**

- r(0)=0 and m x=0 with m>0 implies m r(x)=0, hence r(x)=0 in a real vector space.
- On a nonzero rational K₅-class over ℚ, direct evaluation and integral rational localization both give t; an arbitrarily doubled inverse gives 2t.
- An imaginary-quadratic class has divided coordinates (t,-t) in weight 2 and (t,t) in weight 3, exactly as in §1.1.

*Needs:* §1.1; §2.1; GeneralAlgebraicKTheory §3.12; StableHomotopyKTheory §4.14; ArithmeticKTheory §§3.3–3.4.

### 2.3 Real isomorphism and functoriality

The real scalar extension K_(2n−1)(O_F)⊗ℝ→Vₙ(F) of the specified regulator is a real linear isomorphism, and r_Bo,ℚ is injective. For every finite extension E/F, r_E∘res=R∘r_F and r_F∘tr=T∘r_E, integrally where defined and after rational localization. Its kernel on the integral group is precisely torsion. (burgos2002, Corollary 9.8, p.78, lines 3140–3150; Proposition 9.21 and Corollary 9.23, p.85; deligne_goncharov2005 §1.6, (1.6.3)–(1.6.10), pp.7–9, lines 320–428.)

A proof route is to dualize the supplied stable arithmetic invariant-form comparison on indecomposables and use the finite-type arithmetic plus H-space rational Hurewicz theorem. The character calibration identifies this particular map with the comparison. Tensoring a finite free quotient over ℤ gives injectivity over ℚ. Extension and transfer follow from naturality and the trace of the finite free complex representation obtained after splitting E⊗_Fℂ into embeddings.

The interface requires the following facts.

- An integral class maps to zero if and only if it has finite order.
- The displayed restriction square uses R, with no averaging.
- The displayed transfer square uses the full sum T over extensions of each embedding.

**Checks.**

- For ℚ, n=2 the source and target dimensions are 0; n=3 gives 1 and 1. The first equality alone proves no zeta value.
- For ℚ(i), n=2 and n=3 each give dimensions 1 and 1. For a real quadratic field n=3 gives 2 and 2.
- For ℚ(i)/ℚ at n=3, tr∘res acts by 2 and the target composite sends t to 2t; at n=2 the target sends (t,-t) to 0.

*Needs:* §1.2; §2.2; ArithmeticKTheory §§3.2–3.4; StableHomotopyKTheory §3.37; GeneralAlgebraicKTheory §§7.4–7.8; the exact supplier contract stable-finite-range; the exact supplier contract integral-chern-calibration.

### Examples

The free rational K₃ of ℚ has dimension 0; K₅ has dimension 1. The regulator kills torsion, including any torsion present when the rational source is zero.

### Dependencies

Layer 1; GeneralAlgebraicKTheory §3.12 and §§7.4–7.8; StableHomotopyKTheory §§3.37,4.14; ArithmeticKTheory §§3.2–3.4; AutomorphicFormsOnReductiveGroups §§1.1–1.3; CharacteristicClasses C5a/C6 and its integral calibration contract.

## Layer 3: Division algebras, rational gauges and arithmetic volume

### 3.1 The global period–index input

For every Brauer class α over a number field F, its period and index equal the least common multiple of the denominators of its finitely supported local invariants (including real invariants). In particular α of period a has a central division representative of dimension a². The zero class has period and index 1. (poonen2017, Theorem 1.5.36(iv) and proof of (iii), p.26, lines 1396–1446.)

A proof route is to the invariant exact sequence computes the period. Choose a cyclic degree-a splitting extension with full local degree at the finite support and complexify real places with invariant 1/2. Local invariants then vanish after restriction. Injectivity of the Brauer localization map splits the class globally, and period divides index divides the degree of a splitting field. The local extensions are allowed to vary; this is not unrestricted prescribed Grunwald data.

The interface requires the following facts.

- The denominator lcm computes the degree of the division representative.
- All local invariants vanish if and only if α=0.
- A class of period dividing a has a central simple representative of degree a by taking a matrix algebra over its division representative.

**Checks.**

- The empty lcm is 1 and the representative is F of dimension 1, not a division algebra of degree 0.
- Invariants 1/2 at two finite places sum to 1=0 in ℚ/ℤ; period=index=2 and dimension is 4.
- Invariants 1/3 and -1/3 have lcm 3, index 3 and dimension 9. Keeping only the first invariant gives sum 1/3 and no global class.
- The requested index 8 means dimension 64. A fixed unramified degree-eight dyadic prescription over ℚ is obstructed; permitting different local cyclic extensions is essential.

*Needs:* ClassFieldTheory Layers 5 and 10; ArithmeticGaloisDuality §R02.4.6; the exact supplier contract cyclic-local-degrees.

### 3.2 Division algebras in every degree

For every number field F and a≥2, construct a central division F-algebra D of dimension a² split at every infinite place. More precisely any finitely supported admissible family of local invariants of denominator lcm a and zero sum is realized by such a division algebra when all infinite invariants are zero. (borel1977, Lemma 2.2, pp.617–618, lines 165–195.)

A proof route is to choose distinct finite places and invariants 1/a,-1/a, with zero elsewhere. Apply the invariant exact sequence and §3.1. Existence uses all finite places without a restriction on residue characteristic; no particular algebra is built into later theorems.

The interface requires the following facts.

- The representative realizes each supplied local invariant.
- Its dimension over F is exactly a².
- At every real or complex completion it is isomorphic to M_a of that completion.

**Checks.**

- Over ℚ, invariants 1/2 at 2 and 3 and 0 at infinity give degree 2, dimension 4, and a split real factor.
- Invariants 1/3,-1/3 at two finite places give degree 3 and dimension 9, with every infinite invariant 0.
- The Hamilton algebra over ℚ has invariant 1/2 at infinity and dimension 4, but fails the infinite splitting hypothesis; the theorem does not identify it with the constructed indefinite quaternion algebra.

*Needs:* §3.1; ClassFieldTheory Layer 10.

### 3.3 Borel’s rational gauge and its transport

Let H/F be a connected semisimple group of dimension h and let ω be a nonzero F-rational invariant top form. Define m∞=Δ_F^(−h/2)·∏_(v|∞)|ω|_v, with dx over ℝ and 2dxdy over ℂ and normalized squared complex absolute value. Let m_f=∏_(v finite)|ω|_v in the convergent semisimple gauge product. The product m∞·m_f is precisely the supplied Tamagawa measure. Transport to unscaled product measure multiplies an archimedean quotient volume by Δ_F^(h/2); replacing 2dxdy by dxdy additionally multiplies it by 2^(−hr₂). (borel1977, §1.6, p.617, lines 153–163, equations (1)–(2).)

A proof route is to this is a specialization of the supplied gauge measures, with the full discriminant scalar placed at infinity. Compare scalar restriction and local charts. Under ω↦cω, the infinite factor changes by ∏_(v|∞)|c|_v and the finite factor by its reciprocal, using the product formula.

The interface requires the following facts.

- m∞ is the displayed scalar multiple of the actual product of local gauge measures, not an arbitrary Haar measure.
- For c∈Fˣ, replacing ω by cω scales m∞ by the product of its infinite absolute values.
- The infinite and finite factors multiply to the Tamagawa measure with zero geometric character lattice.
- A further linear chart change A multiplies coordinate density by |det A| with the local normalized absolute value; the stated discriminant and 2-power factors are retained.

**Checks.**

- Over ℚ, multiplying a top form by 2 multiplies m∞ by 2 and its 2-adic factor by 1/2; the global product multiplier is 1, regardless of h.
- For F=ℚ(i), Δ=4 and h=3, the discriminant factor is 1/8 and the complex coordinate factor is 2³=8. Their product against dxdy in three coordinates is 1.
- For h=0 and ω=1 the point has mass 1. With ω=2 over ℚ its infinite mass is 2 and its finite product is 1/2; the total mass remains 1.
- ω=0 gives zero measure, so its quotient volume is 0 and cannot be in ℚ_>0·∏ζ; the nonzero hypothesis excludes it.

*Needs:* Mathlib `NumberField.discr_ne_zero`; AdelicAlgebraicGroups §§2.4–2.5.

### 3.4 The classical norm-one theorem

For every number field F, every a≥2 and central division F-algebra D of dimension a² split at all infinite places, the group H=SL₁(D), constructed on the supplied algebraic-group carrier, has Tamagawa number 1 with the gauge product of §3.3. (weil1961, §3.3, Theorem 3.3.1, invoked in borel1977 p.619, line 227; waived locator.)

A proof route is to the proof obligation is the classical adelic norm-one calculation with compatible gauges. Its prerequisite closure must be supplied by the classical-proof contract below; no inner-form invariance, simple trace formula or endoscopic stabilization is an input. Borel’s invocation identifies the required theorem, while the waived source does not certify a decomposition of its proof.

The interface requires the following facts.

- The value 1 is unchanged when a single global invariant top form is rescaled.
- Restriction of scalars preserves the same normalized number.
- The quotient mass is finite, strictly positive and equal to 1, not merely rational or finite.

**Checks.**

- For a quaternion division algebra over ℚ ramified at two finite primes and split over ℝ, h=3 and the normalized adelic mass is 1.
- For a degree-three division algebra split at infinity, h=8 and the normalized adelic mass is 1; matrix size does not multiply this mass by 3.
- For ω↦2ω over ℚ the product multiplier is 2·(1/2)=1, so the two predicted masses are both 1.
- The norm-one torus of ℚ(i)/ℚ has dimension 1 and geometric character lattice ℤ, whereas the degree-two central division input has norm-one group dimension 3 and character lattice 0. The torus is excluded from this theorem.

*Needs:* §3.3; AdelicAlgebraicGroups §§2.4–2.5 and §3.4; the exact supplier contract inner-type-a-structure; the exact supplier contract classical-tamagawa-proof.

### 3.5 Every finite factor and the Euler product

For H=SL₁(D) as in §3.4, ω≠0 and a product compact open U=∏U_v, choose a finite S containing every nonsplit place, every nonintegral gauge place and every place with nonstandard level. At v∉S, |ω|_v(U_v)=∏_(j=2)^a(1−q_v^(−j)). At v∈S its mass is a positive rational. Define c_S(U,ω)=∏_(v∈S)(|ω|_v(U_v)/∏_(j=2)^a(1−q_v^(−j))). Then m_f(U)=c_S(U,ω)·∏_(j=2)^aζ_F(j)^(−1), with c_S positive rational and independent of enlarging S. (borel1977, Proposition 2.4 proof, p.619, lines 229–236.)

A proof route is to use the supplier’s smooth integral group mass and SL_a finite-field count at every standard place. Use rationality of gauge masses at each remaining compact open, without applying a smooth reductive model at a ramified place. Multiply absolutely convergent Euler products at j≥2. A general compact open contains a product open of finite index and is recovered by that index.

The interface requires the following facts.

- Every denominator is a product of positive numbers 1−q_v^(−j); c_S is positive and rational.
- Adding a standard place multiplies c_S by 1.
- If U′⊂U has finite index m then m_f(U′)=m_f(U)/m, including the finite exceptional factors.

**Checks.**

- At a standard q=2 place, #SL₂(𝔽₂)/2³=6/8=3/4=1−2^(−2). A unit local mass fails this normalization.
- At q=2, #SL₃(𝔽₂)/2⁸=168/256=21/32=(3/4)(7/8).
- If an exceptional q=2 SL₂ level has gauge mass b, its correction is 4b/3. Deleting this place loses the factor 4b/3.
- At q=1 the putative factor 1−q^(−2) is 0 and its totalized inverse is 0; residue fields here have q≥2, so this value is excluded.

*Needs:* §3.3; AdelicAlgebraicGroups §§1.2,2.4; LFunctions Layer 3; the exact supplier contract adelic-rational-masses.

### 3.6 The arithmetic quotient and the exact adelic identity

For H=SL₁(D) as in §3.4 and every arithmetic Γ⊂H(F), the quotient H∞/Γ is compact and vol_m∞(H∞/Γ)∈ℚ_>0·∏_(j=2)^aζ_F(j). If U is sufficiently small that Γ_U=H(F)∩(H∞×U) is torsion-free, the exact identity is τ(H)=vol_m∞(H∞/Γ_U)·m_f(U)=1. For any arithmetic Γ compare with Γ_U through their finite-index intersection. For the unscaled product archimedean gauge, the volume gains Δ_F^((a²−1)/2). (borel1977, §2.3 and Proposition 2.4, pp.618–619, lines 196–236.)

A proof route is to division makes H anisotropic over F and gives compactness through the supplied reduction theorem. Infinite splitting and a≥2 give noncompactness of H∞, so the supplied simply connected strong approximation makes the adelic double-coset set a singleton. The level quotient is a principal U-bundle when Γ_U is torsion-free; quotient integration gives the identity. Insert §§3.4–3.5 and then use finite-index covolume multiplication for arbitrary Γ.

The interface requires the following facts.

- For sufficiently small U the displayed equality uses the actual subgroup Γ_U and measures derived from one ω.
- For Γ₀⊂Γ of index m, vol(H∞/Γ₀)=m·vol(H∞/Γ), with counting measure on discrete subgroups.
- The discriminant and coordinate Jacobians are precisely those of §3.3.

**Checks.**

- If U′ has index 3 in U, its finite mass is m_f(U)/3 and its infinite volume is 3 vol∞; both products equal 1.
- The Hamilton quaternion group has compact real points and is outside infinite splitting. A single principal-level fibre formula from strong approximation away from infinity cannot be assumed for it.
- For D=M₂(ℚ), SL₂(ℝ)/SL₂(ℤ) has finite volume but is noncompact; this algebra is not division. Division is essential for compactness.
- For F=ℚ(√5), a=2 the unscaled product volume is 5^(3/2) times Borel’s volume; dropping that factor changes a rational multiple of ζ_F(2) to a different normalization.

*Needs:* §3.3; §3.4; §3.5; AdelicAlgebraicGroups §§2.2–2.4,3.4,4.2; the exact supplier contract inner-type-a-structure.

### Examples

Two finite invariants 1/a and -1/a give an algebra of degree a split at infinity. At q=2 the split SL₂ gauge volume is 3/4, so finite factors are neither all one nor all unramified.

### Dependencies

ClassFieldTheory Layers 5 and 10; ArithmeticGaloisDuality R02.4.5b–R02.4.6 with the local-degree contract; AdelicAlgebraicGroups §§1.4,2.2–2.5,3.4,4.2; LFunctions Layer 3. The classical Tamagawa proof contract is independent of regulator values.

## Layer 4: Invariant forms and primitive periods

### 4.1 Cohomological indecomposables and their determinant lines

For the connected nonnegative cohomology algebras over ℚ, ℝ or ℂ used here, form the degree-q indecomposable space using the supplied quotient Q(A)=A₊/(A₊)². For a finite-dimensional degree-q quotient construct its rational determinant line ∧^dim Q^q(A); in dimension zero its specified generator is 1. Apply this construction to compact dual, compact group, arithmetic group and invariant-form cohomology, retaining the maps on their actual quotient carriers. (borel1977, §1.3, p.616, lines 122–126; §6.1, p.631, lines 567–570.)

A proof route is to use the generic graded augmentation quotient supplied by the CharacteristicClasses extension below. Its homogeneous denominator is the span of A^i·A^j with i,j>0 and i+j=q; it is not a choice of complement. Apply the native exterior-power functor to these cohomological quotients. The polynomial-invariant quotient of CharacteristicClasses C5a.2 and these cohomological quotients must use the same general construction.

The interface requires the following facts.

- For quotient dimension d the top exterior power has dimension 1, and ∧⁰0 has its specified generator 1.
- Every actual comparison induces its determinant map; the identity and composite induce the identity and composite determinant maps.
- The specified rational determinant line realifies and complexifies to the corresponding line of the scalar-extended quotient, preserving the empty generator.

**Checks.**

- In Λ(x₃,x₅), H⁸ has basis x₃x₅ and dimension 1 but Q⁸ has dimension 0; taking all cohomology would give 1 instead of 0.
- For Λ(x₃), Q³=k·[x₃] has dimension 1 and Q⁶=0, since x₃²=0 in characteristic zero.
- For A=k concentrated in degree 0, Q=0 in every degree and its determinant is k with empty generator 1.
- For k[u₂], Q²=k·[u₂] while Q⁴=0 although u₂²≠0. The quotient construction is not restricted to exterior algebras.

*Needs:* Mathlib `Submodule.mkQ`; CharacteristicClasses C5a.4–C5a.5; the exact supplier contract graded-indecomposable-api.

### 4.2 The actual invariant-form comparison

Let G=Res_(F/ℚ)SL_a, K its standard connected maximal compact subgroup, X=G(ℝ)/K, Xᵘ its compact dual and Γ a torsion-free arithmetic subgroup. Construct the graded invariant-form comparison jℝ:H*(Xᵘ,ℝ)→H*(Γ,ℝ) and its maps on Q^q and determinant lines. Before real correction let μ be the complex comparison induced by identical extensions of forms to the complex tangent space; in degree q set jℝ=i^q μ. Construct also α:H*(Lie(G)_ℂ,ℂ)→H*(Gᵘ,ℂ) and β:H*(Lie(G)_ℂ,ℂ)→H*(G(ℝ)/Γ,ℂ). (borel1977, §§3.3–3.5, pp.621–622, lines 289–337; §5.2, pp.626–627, lines 440–461.)

A proof route is to evaluate invariant forms at the identity, identify relative cochains, and descend to the quotient. Specify the source and target of every map. The Cartan identification gives the power i^q; multiplicativity follows from i^(p+q)=i^p i^q. Pullback under finite covers and stabilization supplies naturality. The maps exist outside the stable range; isomorphism there is a separate supplier theorem.

The interface requires the following facts.

- On each invariant form the comparison is the indicated identical complex extension followed by multiplication by i^q.
- The degree-zero constant 1 maps to 1.
- The comparison commutes with compatible block inclusions and arithmetic subgroup inclusions, hence induces the corresponding determinant maps.
- The corrected comparison has real values on real compact-dual classes; it is not obtained by forgetting an i-factor.

**Checks.**

- At q=0, i⁰=1 and jℝ(1)=1; the zero graded map fails this value.
- For degree-one and degree-two factors the correction scalars are i and -1; their product is -i=i³, the degree-three correction.
- At q=5 the correction is i⁵=i, whereas at q=3 it is -i. Using a constant -i in every odd degree fails weight 3.
- A C₂ stabilizer at a point has higher cohomology over 𝔽₂ in every nonnegative degree; plain point cohomology has only degree 0. Quotient-manifold descent here assumes torsion-free Γ and characteristic-zero coefficients.

*Needs:* §4.1; ArithmeticLocallySymmetricSpaces ALS.F.5 and ALS.0.4–ALS.0.9 and ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3; DifferentialGeometry Layers 5–6 and 8.

### 4.3 The compact period and the discriminant

For n≥2 and a≥n, the degree-(2n−1) primitive cohomology of Lie(Res_(F/ℚ)SL_a) and of its compact group Gᵘ has dimension N. Relative to their rational determinant lines, the absolute determinant of α lies in ℚ_>0·π^(Nn)·Δ_F^(−(2n−1)/2). This statement concerns α on the specified rational Lie algebra and compact cohomology structures. (borel1977, Proposition 4.3, pp.623–625, lines 347–402; §5.3 and Proposition 5.4, pp.627–628, lines 462–480.)

A proof route is to for split SL_a compare the torus character lattice with integral H¹ through integration on its oriented loops, and commute the rational transgression with this comparison. Each degree-(2n−1) primitive contributes a power π^n modulo rational factors. Over F take all N embeddings and compare their wedge with a rational field basis: the embedding determinant gives the displayed discriminant power. Work with absolute determinants here; the real correction is made only in §5.1.

The interface requires the following facts.

- Rational basis changes multiply the determinant by a nonzero rational absolute value.
- The rational-line comparison commutes with restriction along a↦a+1 once the primitive degree survives.

**Checks.**

- For F=ℚ,n=2 the compact period class is π²·ℚ_>0; the degree-three suspended Chern generator pairs to -4π², with absolute ratio 4.
- For F=ℚ,n=3 the compact determinant class is π³·ℚ_>0, rather than π²·ℚ_>0.
- For F=ℚ(i), Δ=4,n=2, the discriminant scalar is 4^(−3/2)=1/8 and the power is π⁴; it is nonzero, so cancelling the compact determinant is legitimate.

*Needs:* §4.1; §4.2; CharacteristicClasses C5a.3–C5a.5; Mathlib `NumberField.discr_ne_zero`.

### 4.4 Compact period cycles and the lower-degree ideal

For j≥1 choose D/F of degree j+1 split at infinity, and an odd a>(4N(j+1)²) large enough for its left regular representation D→M_a(F). For a torsion-free arithmetic Γ⊂Res SL_a, form Z_j=Res SL₁(D)(ℝ)/(Γ∩Res SL₁(D)(ℝ)) inside Y_a=G(ℝ)/Γ. It is a compact connected oriented manifold of dimension N(j²+2j). For the wedge η_j of all N rational primitive forms in degrees 3,5,…,2j+1, prove its restriction to Z_j is nonzero and |∫_(Z_j)β(η_j)|∈ℚ_>0·∏_(s=1)^jζ_F(s+1). Prove that wedging with η_(j−1) kills the ideal generated by the earlier primitive forms. (borel1977, Theorem 5.5 proof, pp.629–630, lines 499–551, especially equations (5)–(11).)

A proof route is to the left regular representation becomes j+1 copies of the standard representation after splitting D. A primitive generator restricts as j+1 times the standard one, so the wedge has nonzero factor (j+1)^j at each embedding. The restricted top form is a nonzero rational gauge up to the scalar-restriction factor of §3.3; the quotient volume theorem evaluates its absolute period. Exterior multiplication by the earlier complete wedges annihilates every earlier generator, eliminating decomposable terms in the induction. Use ordinary singular periods of the actual compact cycle, not an asserted rationality of an unspecified integral.

The interface requires the following facts.

- The group and compact cycle dimension is N((j+1)²−1)=N(j²+2j).
- At one embedding the top primitive wedge restriction factor is (j+1)^j; at all embeddings it is (j+1)^(jN), and is nonzero.
- For every earlier generator x, η_(j−1)∧x=0. Thus changing primitive lifts by elements of the lower-generator ideal does not change the extracted period determinant.

**Checks.**

- For F=ℚ,j=1, dim Z=3 and the restriction factor is 2¹=2; its nonzero absolute period is a rational multiple of ζ(2).
- For F=ℚ,j=2, dim Z=8, restriction factor 3²=9, and the period class is ζ(2)ζ(3)·ℚ_>0. Dividing by the first period isolates ζ(3).
- For N=2,j=1 the dimension is 6 and the restriction factor is 2²=4, not 2.
- In Λ(x₃,x₅), x₃∧x₃=0, so wedging with η₁=x₃ kills the ideal generated by x₃. A product with no repeated earlier generator cannot be dropped merely for having positive degree.

*Needs:* §3.2; §3.6; §4.1; §4.2; CharacteristicClasses C5a.4–C5a.5; DifferentialGeometry Layers 5–6 and 8; the exact supplier contract stable-finite-range.

### 4.5 Arithmetic periods before cancelling the compact fibre

For n≥2 and a−1>4N(2n−1), let Γ⊂Res SL_a be torsion-free arithmetic and Y_a=G(ℝ)/Γ. In degree 2n−1 its indecomposable space has dimension N. The absolute determinant of β on the rational Lie determinant line into the rational determinant line of Q^(2n−1)H*(Y_a,ℚ) belongs to ℚ_>0·ζ_F(n). The assertion is compatible with stabilization and every commensurable arithmetic subgroup. (borel1977, Theorem 5.5, p.628, lines 481–494; determinant induction, pp.629–630, lines 499–551.)

A proof route is to first enlarge a to an odd size satisfying §4.4. Express each primitive image as its indecomposable matrix plus terms in the ideal generated by earlier degrees. Wedge with the earlier complete primitive wedges to remove those terms. The nonzero periods on Z_j make the successive cumulative determinants rational multiples of the successive products of zeta values. Divide consecutive nonzero determinants. Rational transfer for finite-index subgroups and restriction of stable classes return the original a.

The interface requires the following facts.

- Restriction between finite-index arithmetic subgroups identifies the rational determinant lines in the stable range.
- Compatible matrix block inclusions identify the stated line comparison, including its nonzero determinant.

**Checks.**

- The cumulative products at j=0 and j=1 are 1 and ζ_F(2), so their quotient is ζ_F(2), not 0.
- At j=2, ζ_F(2)ζ_F(3)/ζ_F(2)=ζ_F(3); ζ_F(2)>0 supplies the nonzero denominator.
- For F=ℚ,n=2, the compact-dual primitive rank d is 0 but the full-group primitive rank N is 1. The ζ(2) period survives on this full line.

*Needs:* §4.1; §4.2; §4.4; CharacteristicClasses C5a.4–C5a.5; the exact supplier contract stable-finite-range.

### 4.6 The common compact-fibre line

For F,n≥2, odd a with a−1>4N(2n−1), and torsion-free arithmetic Γ⊂Res SL_a, put q=2n−1 and Y=G(ℝ)/Γ. Construct the rational exact sequences 0→Q^qH*(Xᵘ,ℚ)→Prim H^q(Gᵘ,ℚ)→Prim H^q(K,ℚ)→0 and 0→Q^qH*(Γ,ℚ)→Q^qH*(Y,ℚ)→Prim H^q(K,ℚ)→0, with dimensions dₙ,N,N−dₙ. Their induced determinant-line decompositions are compatible, after complexification, with μ=β∘α⁻¹ and the identity on the compact-fibre factor. Their determinant identifications do not depend on choices of rational lifts. (borel1977, §5.2, pp.626–627, lines 440–461; Theorem 6.2 proof, p.632, equations (3)–(4), lines 581–585.)

A proof route is to odd a gives surjectivity of compact-group cohomology onto fibre cohomology. The invariant-form comparison and its relative-cochain filtration carry this property to the arithmetic bundle in the stable range. Choose rational lifts, prove Leray–Hirsch using the supplied cohomological Serre comparison, and pass to indecomposables. Changing lifts adds base terms; the determinant block is triangular with fibre diagonal 1, making the determinant identification intrinsic. Keep the actual bundle and relative-cochain comparison, so its rightmost map is the identity, not an unspecified scalar.

The interface requires the following facts.

- The kernel of restriction to the fibre is the base indecomposable image in the displayed stable degree.
- For each exact sequence det(full)=det(base)⊗det(fibre), and the comparison on det(fibre) is precisely the identity.
- Adding a base lift changes a splitting by a block-unipotent matrix, with determinant 1.

**Checks.**

- For F=ℚ,n=2 the ranks are d=0,N=1,N−d=1. Cancelling the common rank-one fibre leaves the identity on ∧⁰0.
- For F=ℚ,n=3 the ranks are 1,1,0. The fibre determinant is the empty determinant 1.
- For F=ℚ(i), in either parity the ranks are 1,2,1; the full determinant has two generators and the base has one.
- The splitting change [[1,2],[0,1]] has determinant 1; replacing the fibre identity by multiplication by 2 would have determinant 2 and is excluded.

*Needs:* §4.1; §4.2; ArithmeticKTheory §3.4; CharacteristicClasses C5a.4–C5a.5; AlgebraicTopology Stage 5 item 5; the exact supplier contract stable-finite-range; the exact supplier contract multiplicative-serre-comparison.

### Examples

In Λ(x₃,x₅), degree 8 contains x₃x₅ but its indecomposable quotient is zero. In the degree-two division-algebra cycle the dimension over ℚ is 3, and the regular representation repeats a primitive class twice.

### Dependencies

Layers 2–3; CharacteristicClasses C5a for compact primitive/transgression theory; ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–ALS.0.9 and ALS.5b.1; DifferentialGeometry Layers 5–6 and 8; ArithmeticKTheory §3.4 for the stable arithmetic comparison, with its finite-range contract.

## Layer 5: Primitive determinant and the integral regulator lattice

### 5.1 The primitive-period determinant in its cohomological convention

For every F,n≥2,a−1>4N(2n−1) and torsion-free arithmetic Γ⊂Res SL_a, let Lᵘ=∧^dₙQ^(2n−1)H*(X_aᵘ,ℚ) and LΓ=∧^dₙQ^(2n−1)H*(Γ,ℚ). The actual real comparison induced by jℝ sends Lᵘ to c·LΓ for c∈ℚˣ·√Δ_F·π^(−Nn)·ζ_F(n). The determinant statement includes dₙ=0, with the actual empty comparison equal to 1. It is stable in a and compatible with passage to commensurable Γ. (borel1977, Theorem 6.2 and proof, pp.631–632, lines 567–589; Remark 6.3, lines 590–594.)

A proof route is to for odd large a, the compact fibre K_a is totally nonhomologous to zero in both Gᵘ and Y_a. Use the rational Leray–Hirsch/primitive determinant decomposition of Borel §5.2 and its compatible relative-cochain filtration: the two full determinant lines split into compact-dual/arithmetic lines and the same compact-fibre line. Cancel this common line using the identity comparison on it. Apply §§4.3 and 4.5, then the factor i^((2n−1)dₙ) from §4.2. The phase exponent is even, and Δ_F^(n−1) is rational; hence the displayed real rational class. Even a follows by stable restriction. This cancellation is an additional comparison proved here, not a dimension argument.

The interface requires the following facts.

- If dₙ=0, both determinant lines are ℚ with empty generator 1 and the induced map sends 1 to 1.
- The actual induced determinant map commutes with stable restriction and finite-index arithmetic restriction.
- After the determinant correction the exponent E=r₂+(2n−1)dₙ−Nn equals (n−1)r₁ for odd n and -nr₁ for even n, hence is even.

**Checks.**

- For ℚ,n=2, d=0 and the comparison determinant is 1, while √Δπ^(−2)ζ(2)=1/6. Their quotient is 6∈ℚˣ.
- For ℚ,n=3, N=d=1, the raw determinant class is ζ(3)/π³ and E=2 gives i^E=-1. The renormalized regulator class has one additional π.
- For ℚ(i), N=2,r₁=0,r₂=1, E=0 for n=2 and n=3. The raw classes are 2ζ_F(2)/π⁴ and 2ζ_F(3)/π⁶, respectively.
- For a real quadratic F,n=2, N=2,d=0,E=-4 and i^E=1. Its empty determinant 1 enforces √Δζ_F(2)/π⁴∈ℚˣ.

*Needs:* §4.3; §4.5; §4.2; ArithmeticKTheory §3.4; the exact supplier contract stable-finite-range; §4.6.

### 5.2 The homotopy and Tate lattice conversion

Let R′_Bo be Burgos Definition 9.10’s covolume relative to the compact-dual homotopy lattice, and R_Bo the covolume after the character identification with Cₙ(F). Then R_Bo=(2π)^dₙ·ε(F,n)·R′_Bo, where ε(F,n)=2^r₁ when n≡3 mod4 and ε(F,n)=1 otherwise. The compact real-place homotopy generator maps with index 1 in degree 1 mod8 and index 2 in degree 5 mod8; a complex place contributes one conjugate pair. (burgos2002, Lemma 9.18, Definition 9.19 and Remark 9.20, p.84, lines 3546–3614.)

A proof route is to apply the supplied real/complex Bott coefficient maps to SO→SU→SU/SO and compare the compact twins under complexification. Evaluate suspended chₙ on the homotopy generators, with the integral normalization of §2.1. Each surviving coordinate contributes 2π from the twist shift; the real-place index contributes precisely in n≡3 mod4. Record these indices before passing to a rational class.

The interface requires the following facts.

- At a surviving real place the integral index is 1 for n≡1 mod4 and 2 for n≡3 mod4.
- Each complex place contributes one factor 2π, with no second independent embedding coordinate.
- For dₙ=0 the factor is 1, since n is even and ε=1.

**Checks.**

- For ℚ,n=2, d=0 and ε=1, giving R_Bo/R′_Bo=1.
- For ℚ,n=3, d=1 and ε=2, giving R_Bo/R′_Bo=4π, not 2π or 8π.
- For ℚ,n=5, d=1 and ε=1, giving R_Bo/R′_Bo=2π.
- For an imaginary quadratic field, d=1,r₁=0 in either parity, so the ratio is 2π in both weights 2 and 3.

*Needs:* §2.1; §5.1; the exact supplier contract integral-chern-calibration; TopologicalKTheory T4 and T7 item 1.

### 5.3 The integral image and its positive covolume

Let A=K_(2n−1)(O_F). Define Λₙ(F)=r_Bo(A) as a ℤ-submodule of Vₙ(F). The map A/A_tors→Λₙ is an isomorphism, Λₙ is discrete and spans Vₙ, and hence is an IsZLattice over ℝ. Define R_Bo(F,n)=ZLattice.covolume Λₙ for the coordinate Haar measure of §1.1. It is strictly positive and equals the absolute determinant of the regulator on any ordered ℤ-basis of A/A_tors. If dₙ=0 it is 1. (burgos2002, Definition 9.19, p.84, lines 3577–3606; Corollary 9.8, p.78, lines 3140–3150.)

A proof route is to finite generation supplies a free finite-rank torsion quotient. Extend a ℤ-basis over ℝ and use the actual real regulator isomorphism to transport the standard lattice. Its image is exactly Λₙ; discreteness does not follow from finite generation of an arbitrary subgroup of ℝ. Apply the pinned covolume determinant theorem with the normalized measure, including dimension zero.

The interface requires the following facts.

- v∈Λₙ if and only if there exists an integral K-class x with r_Bo(x)=v.
- The integral regulator factors through A/A_tors and induces the specified isomorphism onto its image.
- The submodule has discrete subtype topology and its real span is the whole Vₙ.
- Its covolume is positive and is the absolute determinant in the §1.1 coordinates; unimodular changes of free basis preserve it.

**Checks.**

- For ℚ,n=2 the free group is 0, Λ={0} in {0}, and the empty determinant and covolume are both 1, not 0.
- If x generates the free quotient and has coordinate t≠0, Λ=tℤ and R=|t|. Using 2x gives sublattice 2tℤ of index 2 and covolume 2|t|.
- The finitely generated subgroup ℤ+√2ℤ⊂ℝ is not discrete although it spans. Its source has rank 2 and real extension cannot be an isomorphism to the rank-one target.
- If d=1, the rational image is tℚ: t/m→0 with t/m≠0 for m≥1, so this image is not the integral lattice tℤ.

*Needs:* §2.3; §1.1; ArithmeticKTheory §§3.2–3.4; Mathlib `IsZLattice`; Mathlib `ZLattice.covolume_pos`; Mathlib `ZLattice.covolume_eq_det`.

### 5.4 The zeta covolume and every rational basis

For every F and n≥2, R_Bo(F,n)∈ℚˣ·ζ_F*(1−n) and R_Bo(F,n)∈ℚ_>0·√Δ_F·π^(dₙ−Nn)·ζ_F(n). The rational regulator image is exactly the ℚ-span of Λₙ. For any ordered rational K-basis, its signed determinant in Tate-divided coordinates is in ℚˣ·√Δ_F·π^(dₙ−Nn)·ζ_F(n); its absolute determinant differs from R_Bo by a positive rational. (burgos2002, Theorem 9.12, p.80, lines 3253–3259; Remark 9.20, p.84, lines 3607–3614; borel1977 §6.4, p.633, lines 600–615.)

A proof route is to pair the primitive cohomology determinant of §5.1 with rational primitive homology, and compare integral homotopy generators with the free K-basis. This identifies its absolute determinant class with the original homotopy-lattice regulator. Apply §5.2 to obtain the extra π^dₙ and the explicit rational 2-factor, then §1.3. Rational localization identifies the rational span; rational basis change multiplies the determinant by det A∈ℚˣ. Rank zero is inherited from §5.1’s volume argument.

The interface requires the following facts.

- There exists q∈ℚˣ with R_Bo=q·ζ_F*(1−n); the sign of q can be negative.
- The ratio to √Δ_F π^(dₙ−Nn) ζ_F(n) is a strictly positive rational.
- The image of K_(2n−1)(F)⊗ℚ equals span_ℚ Λₙ as a subset of Vₙ.
- Replacing rational basis columns by A multiplies the signed determinant by det A, and the absolute determinant by |det A|.

**Checks.**

- For ℚ,n=2, R=1 and ζ*(-1)=-1/12, so the leading-term rational factor is -12. The positive-integer factor is 6 since ζ(2)/π²=1/6.
- For ℚ,n=3 the exponent d−Nn is -2, so R is a nonzero rational multiple of ζ(3)/π²; using the unconverted cohomology determinant would give exponent -3.
- For ℚ(i), √Δ=2 and d=1. The classes are 2ζ_F(2)/π³ at n=2 and 2ζ_F(3)/π⁵ at n=3.
- In dimension 2, swapping two rational basis columns has determinant -1, so signed determinant changes sign while R is unchanged. Multiplying one basis column by 2 doubles its absolute determinant.

*Needs:* §1.3; §5.1; §5.2; §5.3; Mathlib `Matrix.det_fin_zero`.

### 5.5 S-integers and orders with every finite prime

For finite S, transport the regulator through ArithmeticKTheory’s actual equivalence K_(2n−1)(O_F)⊗ℚ≃K_(2n−1)(O_(F,S))⊗ℚ. The images of the two integral groups are equal full lattices in Vₙ, and their covolumes are equal. For any full ℤ-order R⊂F, transport through the actual rational inclusion into F; its integral image is a full lattice commensurable with Λₙ and its covolume has positive rational ratio to R_Bo. All extension, transfer and S-enlargement squares use the supplied maps and the §1.2 target maps. (borel1977, §6.4, pp.632–633, lines 595–615; arithmetic localization import from ArithmeticKTheory §§3.3–3.4.)

A proof route is to use the supplier’s finite kernel and cokernel and finite generation for S-integers, and rational order comparison. In degree 2n−1≥3 the finite-S localization map is surjective, so the integral regulator images are equal. For orders, finite generation gives full-rank free quotients; the two rationally invertible inclusion maps identify their images as commensurable lattices. Lattice index gives the covolume ratio. This is a transport of regulator structure, not another arithmetic rank or localization proof.

The interface requires the following facts.

- S-enlargement and composition agree with the actual localized K-map; in higher odd degree they preserve the integral image and its covolume exactly.
- A sublattice of index m has covolume m times the larger lattice’s covolume.

**Checks.**

- At S=∅ the transported map is r_Bo and the covolume ratio is 1.
- For S containing a prime above 2 and n=2 or 3 the rational rank remains dₙ. No factor is deleted merely because its residue characteristic is 2.
- For ℤ→ℤ[1/2] in degree 1, the unit ranks are 0 and 1, so the transported finite-rank equivalence asserted for 2n−1≥3 cannot be extended to K₁.
- For two lattices with common sublattice indices 2 and 3, their covolume ratio is 3/2 in the corresponding order; rational commensurability does not imply equality.

*Needs:* §2.3; §5.3; §5.4; ArithmeticKTheory §§3.3–3.4; GeneralAlgebraicKTheory §§7.4–7.8; the exact supplier contract order-finite-generation.

### Examples

For ℚ in weight 3 the compact-dual cohomology determinant class is ζ(3)/π³, while the Tate-divided regulator class is ζ(3)/π². The exact conversion of the corresponding covolumes is 4π.

### Dependencies

Layers 1–4; ArithmeticKTheory §§3.2–3.4; CharacteristicClasses and the integral Chern/Bott calibration contract; pinned IsZLattice and covolume theorems.

## Layer 6: Point Deligne realization and the Beilinson comparison

### 6.1 The point quotient and the real embedding model

For n>0 define the real vector-space model Dₙ(F)=(∏_(σ∈Σ_F)ℂ/ℝ(n))^conj. Define P_(n−1)(z)=(z+(-1)^(n−1)conj z)/2. It annihilates ℝ(n), induces ℂ/ℝ(n)≃ℝ(n−1), and gives Dₙ(F)≃Vₙ(F). Identify this concrete model with H¹_D(Spec(F)×_ℚℝ,ℝ(n)) through the supplier’s Deligne point computation and finite-disjoint-union and real-descent maps. (burgos2002, Examples 10.4–10.5 and Remark 10.6, p.91, lines 3955–4008.)

A proof route is to split ℂ as the direct sum of the two real Tate axes. Check both inverse maps: P has kernel ℝ(n), and the inclusion of ℝ(n−1) followed by quotient has inverse induced by P. Apply this to all embeddings and commute with simultaneous conjugation. The concrete point quotient is owned here; Deligne cohomology for general varieties is imported.

The interface requires the following facts.

- The map from a coset [z] is P_(n−1)(z), independent of the representative.
- The inverse sends a vector of ℝ(n−1) to its coset in ℂ/ℝ(n); both composites are identities.
- The natural point integral structure is carried to Cₙ, with selected generator (2πi)^(n−1) having coordinate 1.
- Restriction and trace on points become exactly R and T of §1.2.

**Checks.**

- For n=2, P₁(1)=0 and P₁(i)=i; the nonzero class of i survives modulo ℝ(2)=ℝ.
- For n=3, P₂(1)=1 and P₂(i)=0; projection onto the imaginary axis would reverse these values.
- For n=2, z=1+i has P₁(z)=i and z-P₁(z)=1∈ℝ(2); for n=3 it has P₂(z)=1 and difference i∈ℝ(3). Both quotient inverse identities hold.
- At F=ℚ,n=2 the conjugation-fixed quotient is 0; at n=3 it is one-dimensional. Taking invariants on embeddings alone would give a false weight-two real direction.

*Needs:* §1.1; Mathlib `Submodule.mkQ`; the exact supplier contract universal-deligne.

### 6.2 Comparison with the universal realization

Let r_Be be the independently constructed universal Beilinson regulator on K_(2n−1)(F), with suspended Chern-character normalization and target identified by §6.1. On O_F and on rationalized field K-theory, r_Bo=2r_Be. For the same ordered rational K-basis and embedding coordinates det(r_Bo)=2^dₙdet(r_Be), including the empty determinant. The maps commute with restriction and the full embedding trace for transfers. (burgos2002, Definitions 10.7–10.8, p.94, lines 4087–4106; Theorem 10.9 and proof, pp.95–97, lines 4133–4245.)

A proof route is to pull back the universal Chern class along the discrete classifying nerve. Apply the source’s normalized infinitesimal comparison with the Chevalley–Eilenberg and Weil complexes, preserving the cone projection of §6.1. Compare the resulting Beilinson cocycle with Boₙ of §2.1 in relative Lie cohomology: its coefficient is one half. This proves the class equality and hence evaluation on K-theory; it does not define one regulator as a scalar multiple of the other. Take determinants and use localization and the naturality of the universal map.

The interface requires the following facts.

- Equality holds on the actual universal regulator after the explicit point target identification.
- The determinant ratio is exactly 2^dₙ for the same basis and coordinate order.
- The images of the same integral free quotient have covolumes related by R_Bo=2^dₙ R_Be; arbitrary unrelated lattices are not compared.

**Checks.**

- For ℚ,n=2 both determinant maps send 1 to 1 and 2⁰=1; the comparison supplies no ζ(2) value by itself.
- For ℚ,n=3 or any imaginary quadratic F in weight 2 or 3, d=1 and the ordered determinant ratio is 2.
- For a real quadratic F,n=3, d=2 and the ratio is 4, not 2.
- In a rank-one example the real regulator is an isomorphism with determinant t≠0, so r_Be=0 would give 2·0=0≠t. The independent Chern normalization also excludes a rescaling of r_Be.

*Needs:* §2.1; §2.2; §6.1; §5.3; CharacteristicClasses C5a.3–C5a.5 and C6 items 2–3; the exact supplier contract universal-deligne; the exact supplier contract infinitesimal-classifying-comparison.

### 6.3 The rational Adams weight

For every F,n≥2 and integer a≥1, the supplied Adams operation ψ^a acts on K_(2n−1)(F)⊗ℚ as a^n·id. The same holds on rationalized O_F K-theory through localization, and the determinant of ψ^a on that space is a^(ndₙ). (deligne_goncharov2005, Published §1.6, p.9, lines 429–440, after equation (1.6.10).)

A proof route is to use the universal identity chₙψ^a=a^n chₙ and its realization through the actual Beilinson regulator. Apply its injectivity from §2.3 and §6.2. No weight projector or conclusion is included among the hypotheses; the Adams/Chern compatibility is a supplier contract.

The interface requires the following facts.

- The actual regulator intertwines ψ^a with multiplication by a^n.
- The determinant is a^(ndₙ), with value 1 on the zero space.

**Checks.**

- At F=ℚ,n=3,a=2, ψ² acts by 8 and its determinant is 8 on the rank-one rational K₅.
- At a real quadratic F,n=3,a=2, ψ² acts by 8 on two coordinates, so its determinant is 8²=64.
- At F=ℚ,n=2,a=2 the space is 0 and its determinant is 2^(2·0)=1, not 4.
- At a=1 the scalar and determinant are both 1 for every dₙ. The theorem makes no claim for a=0.

*Needs:* §2.3; §6.2; SchemeKTheoryOperations §6.8; the exact supplier contract universal-deligne.

### Examples

At a complex point, weight 2 projects 1 to 0 and i to i; weight 3 projects 1 to 1 and i to 0. The regulator determinant ratio is 1 at rank zero, 2 at rank one and 4 at rank two.

### Dependencies

Layers 1–2 and 5; CharacteristicClasses C5a/C6; SchemeKTheoryOperations §6.8 for the actual Adams operations; the independent universal Deligne and Chern-character contracts of MotivicEtaleKTheory.

## Layer 7: The empty determinant and the totally real theorem

### 7.1 The totally real even-weight theorem

For every totally real number field F and every even integer n≥2, dₙ=0 and √Δ_F·π^(−nN)·ζ_F(n)∈ℚ_>0. The comparison of §5.1 on the actual zero-dimensional indecomposable determinant sends 1 to 1 and proves this nonzero rationality. Equivalently its reciprocal π^(nN)/(√Δ_F ζ_F(n)) is positive rational. The same theorem gives the even-weight leading coefficient relation when dₙ=0. (borel1977, Remark 6.3, p.632, lines 590–594; Theorem 6.2 and equations (3)–(5), lines 571–589.)

A proof route is to the compact-fibre cancellation in §5.1 leaves the identity on the empty determinant line. Its scalar 1 is a nonzero rational multiple of √Δ_F π^(−nN)ζ_F(n). Positivity of the zeta series, Δ_F and π makes the rational number positive. This route retains the full-group periods and quotient volume from Layers 3–4 even though the final primitive rank is zero.

The interface requires the following facts.

- The empty determinant is 1 and the empty lattice covolume is 1.
- The displayed positive rational has a positive rational reciprocal; no division by the rank or by a vanished determinant occurs.

**Checks.**

- For ℚ,n=2 the rational number is 1/6, with reciprocal 6. Multiplying the comparison scalar class by 6 gives the empty determinant 1.
- For ℚ,n=4 it is 1/90, with reciprocal 90; the formula is not restricted to weight 2.
- For r₁=N,r₂=0 and n=2k≥2, d=0 and the exponent is -2kN. In a real quadratic field this is -4k and the empty comparison is 1.
- For ℚ(i), r₂=1 and d=1 in even weight, so the determinant has one row. Treating it as empty would replace its nonzero regulator determinant by 1 without justification.

*Needs:* §5.1; §1.3; Mathlib `Matrix.det_fin_zero`; Mathlib `riemannZeta_two`; Mathlib `riemannZeta_four`.

### Examples

For ℚ, ζ(2)/π²=1/6 and ζ(4)/π⁴=1/90. For a real quadratic field, every positive even weight has zero regulator rank but still has a nontrivial rational zeta relation.

### Dependencies

§5.1 with its complete volume proof; §1.3 for equivalent leading coefficients. The positive even values over ℚ are the pinned riemannZeta_two and riemannZeta_four witnesses.

## Downstream consumers

- **Polylogarithms.** §§2.3,3.7–3.8,4.4 consume §§2.1–2.3,5.2–5.4 and 6.2; §4.7 consumes §7.1. Its explicit factorial and Hurewicz calibration and π^(n−1) conversion stay there.
- **PeriodsAndSpecialValues.** PS.3.2a imports the relocated §§2.1–2.3 and 6.1–6.3; PS.9.8–PS.9.10 use §5.4 in fundamental-line and mixed Tate applications.
- **EndoscopicTransferAndUnitaryTraceComparison.** §6.2 imports the classical norm-one theorem §3.4; its general simply connected semisimple Tamagawa theorem and trace comparison keep their owner.
- **HeightsRationalPointsAndObstructions.** §3.6 imports the number-field period–index theorem §3.1 in its PGL descent comparison.
- **HabiroNahmSeries.** §1.5 uses the embedding rational-image theorem indirectly through Polylogarithms; no Habiro-symbol or torsion assertion is a premise here.

The number-field contracts are §§2.1–2.3, 5.1–5.5, 6.1–6.3 and 7.1, rather than a generic uncalibrated regulator structure. A polylogarithmic consumer converting each row by λₙπ^(n−1), with λₙ∈ℚˣ, obtains its determinant exponent from §5.4 by adding (n−1)dₙ. Constructing and calibrating those polylogarithmic rows belongs to that consumer. Neither the source of its symbols nor their every-family image assertion follows from the Borel lattice alone.

## References

All locators use the stated edition. Source line numbers refer to the manifest’s legal extraction. Mathematical statements and proof routes above are paraphrases; the manifest stores provenance rather than source text.

- **borel1974:** Armand Borel, *Stable real cohomology of arithmetic groups*, Ann. Sci. ENS 7 (1974), pp.235–272. [Numdam](https://www.numdam.org/item/ASENS_1974_4_7_2_235_0/). Theorem 7.5, p.259, borel1974 line 934; §11.4, p.267, borel1974 line 1246; Proposition 12.2, p.271, borel1974 line 1377. These locate the arithmetic supplier’s comparison and rank input.
- **borel1977:** Armand Borel, *Cohomologie de SLₙ et valeurs de fonctions zêta aux points entiers*, Ann. Scuola Norm. Sup. Pisa 4 (1977), pp.613–636. [Numdam](https://www.numdam.org/item/ASNSP_1977_4_4_4_613_0/). §1.6, p.617, borel1977 line 153; Lemma 2.2, pp.617–618, line 177; Proposition 2.4, pp.618–619, line 213; §§3.3–3.5, lines 289–337; Proposition 4.3, line 369; §§5.3–5.5, pp.627–630, lines 462–551; Theorem 6.2, pp.631–632, line 571; Remark 6.3, p.632, line 590; §6.4, pp.632–633, line 595. The source’s m equals n−1 here; its matrix n is denoted a here.
- **burgos2002:** José Ignacio Burgos Gil, *The Regulators of Beilinson and Borel*, CRM Monograph 15 (2002). [Author copy](https://www.icmat.es/miembros/burgos/files/brbr.pdf). Corollary 9.8, p.78, burgos2002 line 3140; Definition 9.10 and Theorem 9.12, pp.79–80, lines 3222 and 3256; Lemma 9.18/Definition 9.19/Remark 9.20, p.84, lines 3546,3577,3607; Proposition 9.22/Corollary 9.23, p.85, lines 3681,3689; Definition 9.24, p.86, line 3733; Examples 10.4–10.5, p.91, line 3973; Definitions 10.7–10.8, p.94, line 4087; Theorem 10.9, pp.95–97, line 4139. For its infinitesimal comparison read Chapter 8, Propositions 8.9,8.10,8.14 and the proof at lines 4172–4190. The PDF page index is six greater than the printed page.
- **poonen2017:** Bjorn Poonen, *Rational Points on Varieties* (2017), unofficial author edition. [Author copy](https://math.mit.edu/~poonen/papers/Qpoints.pdf). Theorem 1.5.36(iii)–(iv), p.26, poonen2017 lines 1396–1446. The local cyclic extensions in that proof may vary; fixed unramified dyadic prescriptions are not asserted.
- **deligne_goncharov2005:** Pierre Deligne and Alexander B. Goncharov, *Groupes fondamentaux motiviques de Tate mixte*, Ann. Sci. ENS 38 (2005), pp.1–56. [Published open text](https://www.numdam.org/item/ASENS_2005_4_38_1_1_0/). Published §1.6, pp.6–9, equations (1.6.1)–(1.6.10), deligne_goncharov2005 lines 282–428; Adams consequence on p.9, lines 429–440. The published numbering differs from arXiv:math/0302267v2; these are the published locators.
- **weil1961:** André Weil, notes by Michel Demazure and Takashi Ono, *Adeles and Algebraic Groups* (1961), §3.3, Theorem 3.3.1, invoked at borel1977 line 227. This locator is waived; its proof text is not certified.
- **beilinson1985:** A. A. Beilinson, *Higher regulators and values of L-functions*, J. Soviet Math. 30 (1985), pp.2036–2070, §§1–2. [DOI](https://doi.org/10.1007/BF02105861). This historical universal-regulator reference is uncertified and cited by locator only; the number-field factor-two theorem uses the read Burgos text.
