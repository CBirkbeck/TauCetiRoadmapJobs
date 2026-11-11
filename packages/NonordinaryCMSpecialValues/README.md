# Roadmap: nonordinary CM special values

**Summary.** Let `K` be an imaginary quadratic field, `p` an odd prime inert in `K`, and `φ` a conjugation-equivariant Hecke character of `K` of ideal infinity type `(1,0)`, realised by a CM elliptic curve over the Hilbert class field `H`. This roadmap builds the complex and `p`-adic special-value theory of the anticyclotomic twists `φ̄νχ` at such a nonordinary prime, where no ordinary `p`-adic period exists. From the native Hecke characters of Tau Ceti, the CM theory of ComplexMultiplicationAndExplicitReciprocity and the local factors of AutomorphicLFunctionsAndLocalFactors it constructs: Kato's elliptic zeta elements and his reciprocity law for CM characters; the integral class of Burungale–Kobayashi–Ota normalised by a Néron differential; the torsion and ring-class towers with their CM Lubin–Tate comparison at the parameter `π = −p`; the root numbers of the twists and the central zeros they force; Finis's divisibility theorem for weight-one anticyclotomic `L`-values; and Jia's nonvanishing theorem for arbitrary class number, with Rohrlich's Diophantine lattice count. The end theorems are the BKO unit theorem — for an auxiliary split prime `l`, almost every normalised value `Ω⁻¹ L_f(φ̄ν, 1)`, `ν` of `l`-power order, is a `p`-adic unit — and the parity dichotomy: in the `p`-anticyclotomic family, values of one conductor parity vanish and all but finitely many of the other parity do not.

## Scope and ownership

This roadmap owns:

- the carriers of the anticyclotomic family on Tau Ceti's `HeckeCharacter` (Layer 0): conjugation-equivariant characters of type `(1,0)`, anticyclotomic characters, the `p`-anticyclotomic family, primitive Euler factors and central values;
- the integral CM period of a good Néron differential, the auxiliary split prime and the auxiliary characters `X_l` (Layer 0);
- the root-number formulas of the twists and the forced central zeros (Layer 1);
- the CM refinement `_aθ_E` of Kato's theta function for an ideal `a` of an arbitrary imaginary quadratic `K`, with its comparison `_{(c)}θ_E = _cθ_E` to the normalised theta unit, its cocycle and its isogeny law; the standard elliptic units `_az_f = _aθ_E(α)⁻¹` of the canonical CM pairs, the inverses of the theta values; Kato's elliptic zeta element and the theta-value zeta element, its negative; Kato's realisation `V(ψ)`, `S(ψ)`, `per_ψ`, the height-one explicit reciprocity law in the form applied by Kato, Kato's reciprocity law for CM characters (Kato 2004, Proposition 15.9), the integral BKO class, its direct-character reciprocity, its twist comparison and period laws (Layer 2). The normalised theta unit `_cθ_E` itself, for `c` prime to `6` and invertible on the base, is PadicFamilies §4.0.1, imported here (KatoEulerSystems imports it from there as well, for modular curves). NoncommutativeAndEquivariantIwasawa §4.3 constructs elliptic units of ray class fields for a CM elliptic curve over `Q` (so `h_K = 1`) at a split ordinary prime, as products of Siegel-function values in their `12N`-th power normalisation; it covers neither `h_K > 1` nor Kato's normalisation through `_aθ_E` and the canonical CM pair, which Layer 2 needs at an inert prime, so Layer 2 states those here and does not use the Siegel-function construction. Sections 2.1–2.6 are stated in Kato's generality, for every prime `p` and every imaginary quadratic `K`, separately from the BKO restrictions of §§2.7–2.10; the CM continuations of ModularIwasawaMainConjecturesPartII consume §§2.1–2.6 from here;
- the torsion and ring-class composita, their disjointness, the semilocal splitting, the inert Frobenius and the CM application of the Honda–Lubin–Tate comparison (Layer 3);
- Finis's divisibility theorem in weight one, both for split and for nonsplit valuation primes, with its proof through primitive theta functions, Shintani operators, integral theta functions and the nonvanishing of theta functions in characteristic `ℓ` (Layer 4). No earlier roadmap states Finis's theorem; its higher-weight split case (Finis, Theorem 1.1(1) with `k > 1`) follows from weight one by Katz's two-variable measure, and belongs with that measure;
- the specialisation of Finis's theorem to the canonical family, the unit witness, the unramified coefficient field and the scalar/tensor kernel comparison (Layer 5);
- Rohrlich's lattice-point count, Jia's Galois-average limit, the Galois stability of central vanishing, central nonvanishing and the parity dichotomy (Layer 6).

It consumes, by section:

- ComplexMultiplicationAndExplicitReciprocity §1.2 (CM period and de Rham pairings, with the period-lattice comparison of the ideal twists `ℂ/aΛ`), §2.2 (Normalized idele and torsion dictionary), §3.2 (Exact ray-level field and generation criterion), §4.1 (The algebraic Hecke character of a CM abelian variety; One-dimensional CM components of the Tate module; Frobenius and infinity-type identities), §4.2 (Full elliptic CM L-factorization, including bad primes; CM induction and compatible-system comparison), §4.3 (`IsCanonicalGrossCharacter`, `canonicalGrossExistence`, Canonical Gross good reduction away from the discriminant). The existence of canonical characters and their curves is imported, never reconstructed.
- AutomorphicLFunctionsAndLocalFactors, Layer AL.1 (local epsilon factors and Gauss sums, completed Hecke functions, the Hecke functional equation) and Layer AL.5 (finite Euler corrections, central-sign vanishing).
- LubinTateFormalModulesAndQuasiCanonicalLifts §2.1 (Finite-height torsion), §2.2 (The π-adic Tate module), §2.3 (Lubin–Tate division fields), §2.4 (The Lubin–Tate character), §4.3 (The unramified Honda–Lubin–Tate comparison) and §4.4 (The supersingular elliptic comparison). Lubin–Tate theory is applied, not rebuilt, and only to connected formal groups.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.8 (Tate modules of `p`-divisible groups), §R07.1.9 (the connected–étale sequence) and §§R07.1.12–R07.1.14 (connected `p`-divisible groups as formal Lie groups, dimension), for the prime components of the CM `p`-divisible group at every place above `p` (§2.5).
- SelmerIwasawaCohomology §§0.8–0.11 (Kummer identifications, cup products and Shapiro), §3.6 (semilocal cohomology), §3.7 (twisting Iwasawa cohomology).
- PadicHodgeRegulators §1.4 (Kato's dual exponential), §1.7 (twists, restriction, corestriction), §1.11 (semilocal Bloch–Kato maps).
- ModularSymbolsPadicLFunctions §1.2 (algebraicity of critical values) and §4.3 (coefficient embeddings); GL2AutomorphicRepresentationsAndTransfer R17.4.16 (quadratic automorphic induction and CM theta series).
- DiophantineApproximationAndTranscendence §2.1 (the `p`-adic subspace theorem) and §2.3 (`p`-adic approximation of algebraic numbers).
- PadicFamilies §4.0.1 (the normalised theta unit `_cθ_E`).
- NeronModelsAndSemistableAbelianVarieties §5.1 (Néron–Ogg–Shafarevich).
- GlobalNumberFields Layers 9–11, ClassFieldTheory Layer 13, Chebotarev Layer 10, LocalFieldsRamification Layers 2–3, EllipticCurves Layers 1–3, ArithmeticDirichletSeries Layer 5.

The ordinary CM `p`-adic period, the Katz and Rubin `p`-adic `L`-functions, the primitive elliptic-unit coordinate, the signed local decomposition, the `Δ`-projection of the elliptic class and its derivatives are outside this roadmap: AnticyclotomicLocalUnits owns the local projections and InertAnticyclotomicCMMainConjecture the Rubin function. The normalised values here define no Iwasawa function by interpolation.

## Conventions

**Fields and embeddings.** `K` is imaginary quadratic with ring of integers `O_K`, fundamental discriminant `−D`, quadratic character `κ_K`, class number `h_K`, unit order `w_K`, Hilbert class field `H` and complex conjugation `c`. Fix embeddings `ι_∞ : Q̄ → ℂ` and `ι_p : Q̄ → C_p` that agree on `K`; `ι : K → ℂ` is the restriction of `ι_∞`. Sections 2.1–2.6 hold for every prime `p` (split, inert or ramified, including `2` and `3`) and every imaginary quadratic `K`, in Kato's generality. Everywhere else the prime `p` is odd and inert in `K`, `Φ = K_p` is the unramified quadratic extension of `Q_p` with integers `O_Φ = W(F_{p²})`, and `π = −p`; in §§2.7–2.10 and Layers 3 and 5, moreover `p ≥ 5` and `p ∤ h_K` (the BKO setting).

**Characters.** Artin reciprocity sends uniformizers to arithmetic Frobenius. A Hecke character is a continuous character of the idele class group, Tau Ceti's `HeckeCharacter`. Its ideal character is `HeckeCharacter.idealCharacter`, defined on fractional ideals prime to `HeckeCharacter.finiteConductor`, and its local conductor exponents are `HeckeCharacter.conductorExponent`. Ideal infinity type `(1,0)` for `ι` means `φ((x)) = ι(x)` for `x ≡ 1` modulo the conductor; at the idele level the archimedean component is `z ↦ z⁻¹` (idelic type `(−1,0)`). Kato writes `ψ` of type `(−r,0)` for the same normalisation, and Finis writes type `(k,j)` for `λ_∞(x) = x^{−k} x̄^{−j}`; so our `φ` is Kato's `ψ` with `r = 1`, and `φ̄ν/N` has Finis type `(−1,0)`.

**L-functions.** `L(η, s) = Σ_a η(a) N(a)^{−s}`, the sum over integral ideals prime to the conductor of `η`: the primitive `L`-function. For a finite set `S` of primes, `L_S(η, s)` removes the Euler factors at `S` (only the support of a modulus matters for deletion). A character `η = φρ` with `ρ` of finite order has weight one, its Euler product converges for `Re s > 3/2`, its central point is `s = 1`, and after the unitary normalisation `η|·|^{1/2}` the centre is `1/2`. Root numbers `W(η)` are those of AutomorphicLFunctionsAndLocalFactors AL.1 for the standard additive character `ψ_K = ψ_Q ∘ Tr_{K/Q}`; changing `ψ_v` to `ψ_v(−·)` multiplies a local central epsilon factor by `η_v(−1)`, and the product of these changes over all places is `1`.

**Indices.** For an anticyclotomic character `ν` of exact order `l^r`, `r ≥ 1`, with `l` split, `l ∤ h_K`, `l ≥ 5`, the field layer is `L[r]` (degree `l^r`) and the conductor is `l^m O_K` with `m = r + 1`; for `ν = 1`, `r = m = 0`. For a `p`-anticyclotomic `χ` of exact order `p^n`, `n ≥ 1`, and `p ∤ h_K`, the conductor is `p^c O_K` with `c = n + 1`; the trivial character has `c = 0`. When `p | h_K` the family contains unramified characters of order `p` (with `c = 0`), and statements are made in terms of the conductor exponent `c`, never of the order. Order indices and conductor indices are never identified.

**Towers and periods.** `F_n = H(E[p^{n+1}])`, `Φ_n` its completion at the place above `p` fixed by `ι_p`, of degree `(p² − 1)p^{2n}` over `Φ`; `Φ_0 ≠ Φ`. Arithmetic Frobenius on the covariant Tate module of the reduction at a place above `p` is `[−p]`, and a compatible `π`-power basis differs from a `p`-power basis by the sign `(−1)^n` at level `n`. A period datum `(E, ω, Ω)` consists of a CM curve `E/H` with good reduction above `p`, a Néron differential `ω` at the place above `p`, and `Ω ∈ ℂ×` with period lattice of `ω` equal to `Ω O_K`; `Ω` is determined up to `O_K×`.

**Duals and twists.** `T_φ` is the rank-one `p`-adic realisation of `φ` over the integers `R` of a finite extension of `Φ` containing its values; `T_φ^∨(1) = Hom_R(T_φ, R)(1)`. Kato's `V(ψ)` carries the inverse action, so `V(ψ)(1) = T_φ^∨(1)[1/p]`, and its de Rham line is generated by `ω`. The normalised Betti vector is `γ = per_φ(ω)/Ω`. The standard elliptic unit is the inverse `_aθ_E(α)⁻¹` of a theta value; the Kummer map is a homomorphism from multiplicative unit groups to additive cohomology, so the theta values and the standard units have Kummer classes of opposite sign. Group-algebra evaluation of a character `ν` sends `[g]` to `ν(g)` (Mathlib's `MonoidAlgebra.lift`), never to `ν(g)⁻¹`.

## Exact supplier contracts

### From Mathlib

- `NumberField.RingOfIntegers`, `NumberField.classNumber`, `NumberField.IsCMField` and `NumberField.IsCMField.complexConj`, `Algebra.IsQuadraticExtension`: the field, its integers, class number and conjugation. For a degree-two CM field the maximal real subfield is `ℚ`, so `IsCMField` with `IsQuadraticExtension ℚ K` is exactly an imaginary quadratic field.
- `FractionalIdeal`, `IsDedekindDomain.HeightOneSpectrum`, `Ideal.absNorm`: ideals, finite primes and norms.
- `MonoidAlgebra.lift` and `MonoidAlgebra.lift_single` (Mathlib/Algebra/MonoidAlgebra/Basic.lean): evaluation `[g] ↦ ν(g)`, without inversion.
- `Subalgebra.linearDisjoint_iff_injective` (Mathlib/RingTheory/LinearDisjoint.lean): linear disjointness is injectivity of the multiplication map.
- `DirichletCharacter.LFunction_apply_one_ne_zero` (Mathlib/NumberTheory/LSeries/Nonvanishing.lean): `L(1, κ) ≠ 0` for a nontrivial Dirichlet character of nonzero modulus.
- `PadicInt`, `Padic`, `IsAlgebraic`, `Set.ncard`, `HasProd`, `Differentiable`: the carriers of the Lean statements.

### From Tau Ceti

- `TauCeti.GlobalNumberFields.HeckeCharacter` (`ContinuousMonoidHom (IdeleClassGroup (𝓞 K) K) ℂˣ`), with `HeckeCharacter.IsFiniteOrder`, `HeckeCharacter.finiteConductor`, `HeckeCharacter.finiteConductor_ne_bot`, `HeckeCharacter.conductorExponent`, `HeckeCharacter.finiteComponent` and `HeckeCharacter.idealCharacter` (TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean and Ideal.lean). `idealCharacter_apply_prime` identifies the ideal value at a prime with the local component at any uniformizer; `idealCharacter_apply_toPrincipalIdeal` identifies the value at `(x)`, `x ≡ 1`, with the inverse of the archimedean components. The carrier includes non-unitary characters; finite order is a separate predicate.
- `TauCeti.GlobalNumberFields.Modulus`, `idealsPrimeTo`, `IsCongrOne`, `IsCongrOne.toPrincipalIdeal_mem_idealsPrimeTo`, `toPrincipalIdeal`: moduli, ideals prime to a modulus and multiplicative congruence. `IsCongrOne` is a condition on `Kˣ`, so zero is excluded.
- `TauCeti.ClassFieldTheory.ringClassField` (for an order `O : NumberFieldOrder K`, an `IntermediateField K (SeparableClosure K)`), with `ringClassArtinEquiv : Pic O ≃* Gal(ringClassField O / K)`, `finrank_ringClassField`, `isUnramifiedAt_ringClassField` (unramified at primes not dividing the conductor of `O`), the splitting law `isArithFrobAt_ringClassArtinEquiv_picClass` and the splitting criterion `ncard_primesOver_ringClassField_eq_finrank_iff` (a prime of `O_K` prime to the conductor splits completely exactly when it is generated by an element of `O`) (TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean). These carry the ring class fields of Layers 0 and 3; what Layer 3 lacks at the pins is the CM elliptic curve attached to `φ` with its torsion fields `H(E[p^{n+1}])`, and Lubin–Tate formal modules.

### From TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocity

- §4.3 `IsCanonicalGrossCharacter`: conjugation equivariance, principal values `±α`, conductor primes ramified in `K`; `canonicalGrossExistence`: existence exactly for `D ≠ 3` with `D` odd or `8 | D`, and the attached CM curve over `H`; Canonical Gross good reduction away from the discriminant: good reduction above every rational prime not dividing `D`. Assumed: the attached curve realises `φ ∘ N_{H/K}` and is an `H`-isogeny class of `Q`-curves.
- §4.1 The algebraic Hecke character of a CM abelian variety (Frobenius values at good primes, principal law), One-dimensional CM components of the Tate module (rank-one coefficient summands, arithmetic Frobenius value `j(ψ(v))`), Frobenius and infinity-type identities (`π_v π̄_v = q`; at an inert good prime the Frobenius is `−p` of norm `p²`).
- §4.2 Full elliptic CM L-factorization, including bad primes (all-prime factorisation `L(E/H, s)` through `ψ` and `ψ̄`, ramified factors `1`) and CM induction and compatible-system comparison (the weight-two theta-series realisation).
- §1.2 CM period and de Rham pairings, with its period-lattice comparison: the ideal-twist curve `ℂ/aΛ` of a CM curve, its `O_K`-action and the period pairing `ω_{E/ℂ} × H₁(E(ℂ), Z) → ℂ`.
- §2.2 Normalized idele and torsion dictionary and §3.2 Exact ray-level field and generation criterion: the action of `Aut(ℂ/K)` on CM torsion and the ray-class field generated by torsion values.

### From TauCetiRoadmap.AutomorphicLFunctionsAndLocalFactors

- AL.1.3.1 the local epsilon factors `ε(s, ω, ψ)`; AL.1.3.5 Explicit local ε-factors (the unramified and ramified formulas); AL.1.3.4 The local Gauss sum; AL.1.1.1 Local quasi-characters, unramified characters and the conductor exponent; AL.1.5.2 Normalization of the supplied completed Hecke function; AL.1.6.2 Hecke continuation and functional equation, `Λ_H(ω, s) = W_H(ω) Λ_H(ω⁻¹, 1 − s)`, whose root number `W_H(ω)` is the product of the local constants (AL.1.6.2 takes it from ArithmeticGaloisRepresentations §2.7, Root-number product formula).
- AL.5.1.1 Finite Euler corrections at critical points (`L^S = E_S L`, orders add) and AL.5.3.2 The functional-equation sign at the centre (sign `−1` at the centre forces a zero).
- What AutomorphicLFunctionsAndLocalFactors must provide (gap:al-local-frohlich-queyrut): the local Fröhlich–Queyrut theorem in AL.1's local epsilon factors — for a quadratic extension `E/F` of local fields, a quasi-character `χ` of `E×` trivial on `F×` and `ψ_E = ψ_F ∘ Tr_{E/F}`, `ε(1/2, χ, ψ_E) = χ(Δ)` for every `Δ ∈ E×` with `Δ² ∈ F×` and `Δ ∉ F`.

### From TauCetiRoadmap.LubinTateFormalModulesAndQuasiCanonicalLifts

- §2.1 Finite-height torsion and §2.2 The π-adic Tate module (for a formal `O`-module of `O`-height `h` over the integers of a finite extension, the Tate module is free of rank `h` with continuous `O`-linear Galois action); §2.3 Lubin–Tate division fields (the `π^m`-division field is totally ramified of degree `(q − 1)q^{m−1}` and generated by any primitive point); §2.4 The Lubin–Tate character (the Galois action on the Tate module of a Lubin–Tate module is a character onto `O×` factoring through the division tower).
- §4.3 The unramified Honda–Lubin–Tate comparison (over `O = W(F_{p²})`, a formal group with `q`-Frobenius `[sp]`, `s = ±1`, is strictly isomorphic to the Lubin–Tate group for `sp`) and §4.4 The supersingular elliptic comparison (an elliptic curve over `O` with `a_{p²} = 2sp`, that is `#Ē(F_{p²}) = p² + 1 − 2sp`, has `q`-Frobenius `[sp]` and Lubin–Tate parameter `sp`). The sign convention `a_{p²} = −2p ↔ π = −p` is the one fixed there.
- Assumed: §§2.1–2.2 are applied only to connected components, which are formal; an étale `p`-divisible group, such as a CM component at a split prime (§2.5), is outside their scope and is handled through FiniteFlatGroupsAndIntegralPadicHodgeTheory.

### From TauCetiRoadmap.FiniteFlatGroupsAndIntegralPadicHodgeTheory

- §R07.1.8 The Tate module of a `p`-divisible group over a mixed-characteristic base: over a henselian local domain with fraction field of characteristic `0`, the Tate module of a `p`-divisible group of height `h` is free of rank `h` over `Z_p` with continuous Galois action, for connected and étale groups alike.
- §R07.1.9 The connected–étale sequence of a `p`-divisible group over a henselian local base: `0 → G^0 → G → G^{ét} → 0` with heights adding, functorial in `G`.
- §R07.1.12 Commutative formal Lie groups, their dimension and `p`-divisibility, §R07.1.13 Connected `p`-divisible groups are `p`-divisible formal Lie groups (over a complete noetherian local ring with residue characteristic `p`), and §R07.1.14 The dimension of a `p`-divisible group (the dimension of the formal Lie group of `G^0`, so `0` for an étale group, and `dim A[p^∞] = dim A` for an abelian scheme). Assumed: applied to the components `G(v, 𝔭)` of the `p`-divisible group of the Néron model of a CM elliptic curve over the integers `O_v` of a finite extension of `Q_p` (§2.5).

### From TauCetiRoadmap.PadicFamilies

- §4.0.1 Geometric classes, moments and norm relations: the normalised theta unit `_cθ_E` of an elliptic curve `E` over a base on which `c` is invertible, `c` prime to `6`, with divisor `c²(0) − E[c]`, invariance `N_b(_cθ_E) = _cθ_E` under the norm along multiplication by every integer `b` prime to `c`, base change, the Tate `q`-expansion with Kato's normalisation of the leading coefficient, and the isogeny norm. Assumed: the isogeny norm is applied only to isogenies of degree prime to `c`, the range in which it holds (Kato 2004, Proposition 1.3(4), p.122, KATO04 line 238); the complex specialisation of the `q`-expansion is Kato's product formula (Kato 2004, Proposition 1.3(3), p.122).

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

- §5.1 Néron–Ogg–Shafarevich: over a henselian discrete valuation ring with residue field `k`, and for a prime `ℓ ≠ char k`, an abelian variety has good reduction if and only if inertia acts trivially on its `ℓ`-adic Tate module. Assumed: it is applied to an elliptic curve over the completion of a number field at a finite place, with `ℓ` prime to the residue characteristic.

### From TauCetiRoadmap.SelmerIwasawaCohomology

- §0.8 and §0.9: the `p`-adic and `S`-unit Kummer identifications `H¹(G_{F,S}, Z_p(1)) ≅ Z_p ⊗ O_{F,S}×`, compatible with restriction and with corestriction against the norm. §0.11: cup products and Shapiro under Kummer. §3.6: semilocal cohomology and descent. §3.7: the cyclotomic twist isomorphism of Iwasawa cohomology.
- What SelmerIwasawaCohomology must provide (gap:sic-character-twist): the twist isomorphism of §3.7 for a finite free `O`-module `T` whose `G_K`-action factors through `Gal(F_∞/K)` for a `p`-adic Lie tower `F_∞/K` (here `F_∞ = K(fp^∞)` and `T = T_φ^∨`), identifying `lim_cor H¹(F_n, Z_p(1)) ⊗ T` with `lim_cor H¹(F_n, T(1))` equivariantly for the diagonal action, compatibly with localisation and corestriction, with the finite-`S` Kummer completion retained.

### From TauCetiRoadmap.PadicHodgeRegulators

- §1.4 Kato's dual exponential `exp* : H¹(K, V) → Fil⁰ D_dR(V)`, its kernel `H¹_g` and its adjunction with `exp`. §1.7 compatibility with twists, restriction and corestriction. §1.11 semilocal Bloch–Kato maps `exp*_{A,V}` on `A = F ⊗ Q_p`, componentwise and compatible with Shapiro.

### From TauCetiRoadmap.ModularSymbolsPadicLFunctions and GL2AutomorphicRepresentationsAndTransfer

- ModularSymbolsPadicLFunctions §1.2: twisted Mellin formula and algebraicity of normalised critical values of newforms; §4.3: a field embedding `σ` carries the algebraic normalised critical coordinates of `f` to those of `f^σ`. No transport of complex periods is assumed.
- GL2AutomorphicRepresentationsAndTransfer R17.4.16: quadratic automorphic induction of an algebraic Hecke character of `K`; for `η` of type `(1,0)` and finite-order twist it gives a weight-two newform `θ_η` with `L(θ_η, s) = L(η, s)`.

### From TauCetiRoadmap.DiophantineApproximationAndTranscendence

- §2.1: the subspace theorem with finitely many places (`S` containing `∞` and finitely many primes, independent algebraic forms at each place); in two variables, solutions of the product inequality lie on finitely many lines. §2.3: Ridout's `p`-adic approximation theorem for algebraic targets.

### From the Tau Ceti roadmaps on main

- GlobalNumberFields Layer 9 (Hecke and ray class characters, local components, finite conductor), Layer 10 (infinity types, norm twists), Layer 11 (orders, conductors, Picard groups).
- ClassFieldTheory Layer 13 (Hilbert and ray class fields, ring class fields of quadratic orders with `Gal ≅ Pic(O)`, and Artin symbols of principal ideals; the anticyclotomic `Z_l` and `Z_p` quotients of the ring-class towers are derived here in §§0.2 and 0.6).
- Chebotarev Layer 10 (Dirichlet-density Chebotarev, infinitely many primes in a Frobenius class after finite exclusions).
- LocalFieldsRamification Layer 2 (unramified extensions, unit-root extensions `X^d − u`, `p ∤ d`) and Layer 3 (ramification; a totally ramified and an unramified extension meet in the base).
- EllipticCurves Layer 1 (invariant differential, formal group), Layer 2 (torsion, Weil pairing, faithful Tate realisation of endomorphisms), Layer 3 (Frobenius polynomial over finite fields).
- ArithmeticDirichletSeries Layer 3 (local factors and Euler products) and Layer 5 (polynomial bounds for ideal counts and partial summation).

## How to read the build

Layer 0 fixes the carriers (anticyclotomic characters, the `p`-anticyclotomic family, Euler factors and central values) and the data (the integral period, the auxiliary prime and characters). Layer 1 computes root numbers and the zeros they force; it needs only Layer 0 and the local factors. Layer 2 constructs elliptic units and proves Kato's reciprocity law for CM characters, then the BKO integral class and its reciprocity. Layer 3 builds the torsion and ring-class towers and applies Lubin–Tate theory at `π = −p`. Layer 4 proves Finis's theorem in weight one, independently of Layers 1–3. Layer 5 specialises Finis to the canonical family to obtain the unit theorem and the coefficient descent; it uses Layers 0, 1, 2 and 4. Layer 6 proves Rohrlich's lattice count, Jia's average and the nonvanishing and parity theorems; it uses Layers 0 and 1. The Lean acceptance test states the parity dichotomy (Layer 6) and Rohrlich's two bounds (Layer 6).

## Layer 0: CM data, characters and central values

### 0.1 Conjugation-equivariant characters of type (1,0)

Define `IsEquivariantTypeOneZero ι φ`, for a Hecke character `φ` of an imaginary quadratic `K` and an embedding `ι : K → ℂ`, by two conditions on the ideal character modulo the finite conductor (`conductorModulus φ`, the conductor ideal with no real places): `φ((x)) = ι(x)` for every `x ∈ K×` with `x ≡ 1` modulo the conductor, and `φ(ā) = conj φ(a)` for every fractional ideal `a` prime to the conductor. The first condition fixes the archimedean component `z ↦ z⁻¹`: the elements `x ≡ 1` form a subgroup of `K×` whose image under `ι` is dense in `ℂ×`, by weak approximation imposing the finitely many congruence conditions at the primes dividing the conductor together with closeness at the complex place, and the archimedean component is continuous; so the character is algebraic of ideal type `(1,0)` for `ι`. That subgroup has infinite index in `K×`, since its elements have valuation `0` at every prime dividing the conductor; density, not finite index, is what the argument uses. Prove that such a `φ` satisfies `φ((n)) = κ_K(n) n` for every rational integer `n` prime to the conductor, and conversely that this rational-principal law together with type `(1,0)` gives equivariance (Jia, Property 1, pp.3–4; JIA24 line 126). Prove that the conductor `f` is stable under conjugation and that `φ φ̄ = N` on ideals prime to `f`. *Needs:* Tau Ceti `HeckeCharacter.idealCharacter`, `idealCharacter_apply_toPrincipalIdeal`; GlobalNumberFields Layers 9–10.

API:

- The rational-principal law: for `n ∈ Z` prime to `f`, `φ((n)) = κ_K(n) n`; in particular `φ((p)) = −p` for an inert `p ∤ f`.
- Norm relation: `φ(a) conj φ(a) = N(a)` for `a` prime to `f`, so `|φ(a)| = N(a)^{1/2}`.
- Conjugation stability: `f̄ = f`.
- Twists: if `ρ` is an anticyclotomic character of finite order, `φρ` satisfies the conjugation law `φρ(ā) = conj(φρ(a))` on ideals prime to its conductor, and `L(φ̄ρ, s) = L(φρ⁻¹, s)` by `a ↦ ā`.
- Canonical characters: an `IsCanonicalGrossCharacter` of ComplexMultiplicationAndExplicitReciprocity §4.3 satisfies the predicate.

**Checks.**

- For `y² = x³ − x` over `K = Q(i)`, the character with `φ((−1 + 2i)) = −1 + 2i` at the prime of norm `5` and `φ((7)) = −7` at the inert prime `7` satisfies the rational-principal law: `κ_K(7) = −1`, and `−7 = κ_K(7)·7`. The wrong sign `+7` is the law of the inverse quadratic character and fails.
- The inverse character `φ⁻¹` has archimedean component `z ↦ z` and fails the first condition: `φ⁻¹((x)) = ι(x)⁻¹`, not `ι(x)`.
- Agreement with Tau Ceti: at a prime `v ∤ f`, the ideal value equals `φ.finiteComponent v (ϖ_v)` for any uniformizer `ϖ_v`, by `idealCharacter_apply_prime`; a definition through `ϖ_v⁻¹` gives `φ(v)⁻¹`, of absolute value `N(v)^{−1/2}`.
- The norm character `N` itself has `N((x)) = x x̄`, not `ι(x)`; it is excluded.
- For `K = Q(i)` and conductor `(1 + i)³`, the elements `(1 + i)^n`, `n ∈ Z`, lie in pairwise distinct cosets of the congruence subgroup (their valuations at `(1 + i)` are `n`), so the subgroup has infinite index in `K×`; it is still dense in `ℂ×`, which is all the archimedean-type conclusion needs.

### 0.2 Anticyclotomic characters and the p-anticyclotomic family

Define `IsAnticyclotomic χ` by `χ(ā) = χ(a)⁻¹` for every fractional ideal `a` prime to the conductor of `χ`. Define `IsPAnticyclotomic p v χ`, for the prime `v` of `K` above an inert `p`, by: `χ` has finite order, a power of `p`; `χ` is anticyclotomic; `χ` is unramified at every finite prime other than `v`. Prove that an anticyclotomic character of odd finite order is trivial on the ideles of `Q`, hence a ring class character, and that for `p` odd and inert, the characters of the family are exactly the characters of finite order of the maximal anticyclotomic pro-`p` extension of `K` unramified outside `p`; when `p ∤ h_K` this is the anticyclotomic `Z_p`-extension (ClassFieldTheory Layer 13; Jia, Introduction, p.1, JIA24 line 18). Prove the conductor formula: if `p ∤ h_K` and `χ` has exact order `p^n`, `n ≥ 1`, then `conductorExponent v χ = n + 1`; the trivial character has exponent `0`. *Needs:* Tau Ceti `HeckeCharacter.IsFiniteOrder`, `HeckeCharacter.conductorExponent`; ClassFieldTheory Layer 13; GlobalNumberFields Layer 11.

API:

- The family is closed under products and inverses, and `c(χ⁻¹) = c(χ)`.
- An anticyclotomic character of odd order is trivial on every conjugation-stable ideal prime to its conductor: `χ(b) = χ(b̄) = χ(b)⁻¹` and `χ(b)` has odd order.
- For `p ∤ h_K`, the `p`-part of `Gal(K[p^∞]/K)` is `Z_p` and the characters of exact order `p^n` have conductor `p^{n+1}`.
- An odd-order anticyclotomic character unramified at `p` satisfies `χ((p)) = 1`: the ideal `(p)` is then prime to the conductor and conjugation-stable, so the previous bullet applies. For a character ramified at `p`, `(p)` lies outside the domain of `HeckeCharacter.idealCharacter` and no value is asserted.
- With no class-number hypothesis, every `c ≥ 2` is the conductor exponent of a member of the family: for `p` odd and inert and `O_{p^c}` the order of conductor `p^c`, `#Pic(O_{p^c}) = p · #Pic(O_{p^{c−1}})` when `c ≥ 2`, so a character of `p`-power order of `Pic(O_{p^c})` that does not factor through `Pic(O_{p^{c−1}})` exists; it is anticyclotomic, unramified outside `p`, and has conductor exactly `p^c O_K`. Both parities of `c` therefore occur infinitely often.

**Checks.**

- For `K = Q(√−7)`, `p = 5`: the ring class group of conductor `5^{m}` has `5`-part of order `5^{m−1}`, so a character of order `5` first appears at conductor `25` (`c = 2`), and one of order `25` at conductor `125` (`c = 3`). Assigning `c = n` would give conductor `5` to an order-`5` character, but the ring class group of conductor `5` has order `(5 + 1)/1 = 6`, prime to `5`.
- A character of `5`-power order of the cyclotomic `Z_5`-extension (factoring through the norm to `Q`) satisfies `χ(ā) = χ(a)` and is not anticyclotomic unless trivial.
- A character ramified only at one of the two primes above a split `l` is not anticyclotomic: conjugation exchanges the primes and would force equal conductor exponents.
- The trivial character belongs to the family with `c = 0`; the formula `c = n + 1` is not applied to it.
- `p ∤ h_K` is needed for `c = n + 1`: `K = Q(√−31)` has the reduced forms `(1, 1, 8)`, `(2, ±1, 4)`, so `h_K = 3`, and `3` is inert since `−31 ≡ 2` is a nonsquare modulo `3`. A nontrivial character of the class group has order `3`, is anticyclotomic (`a ā = (N(a))` is principal) and unramified everywhere, so it lies in the `3`-anticyclotomic family with `c = 0`, not `n + 1 = 2`; its sign factor in §1.3 is `(−1)^0 = 1`.
- The value at `(p)` needs `χ` unramified at `p`: the character of order `5` of `K = Q(√−7)` in the `5`-anticyclotomic family has conductor `25 O_K`, so `(5)` is not prime to its conductor and the ideal character has no value there; extending the ideal character by zero would assign `0`, not `1`. For `ν ∈ X_l` (unramified at `p`, odd order) the bullet applies: `ν((p)) = ν((p))⁻¹` has odd order, so `ν((p)) = 1`.

### 0.3 Primitive Euler factors and central values

Define `conductorModulus η` as the finite conductor of `η` with no real places. Define `eulerFactor η ϖ v s`, for uniformizers `ϖ`, as `(1 − η(ϖ_v) N(v)^{−s})⁻¹` when `η` is unramified at `v` and `1` otherwise. Define `HasCentralValue η ϖ z` by: there is an entire function `F` with `HasProd (v ↦ eulerFactor η ϖ v s) (F s)` for `Re s > 3/2` and `F 1 = z`. Prove that for `η = φρ` with `φ` as in §0.1 and `ρ` of finite order, `HasCentralValue η ϖ z` holds for exactly one `z`, namely the value at `1` of the analytic continuation of `L(η, s)`, which is entire: the completed function is entire by the Hecke functional equation (AL.1.6.2 Hecke continuation and functional equation), `η` is not a norm power, and the archimedean factor has no zeros. Prove that for a finite set `S` of primes, `L_S(η, 1) = E_S(1) L(η, 1)` with `E_S(1) ≠ 0`: at an unramified prime the deleted polynomial is `1 − η(v)N(v)^{−1}`, of parameter of absolute value `N(v)^{−1/2} < 1` (AL.5.1.1 Finite Euler corrections at critical points). *Needs:* Tau Ceti `HeckeCharacter.finiteComponent`, `HeckeCharacter.conductorExponent`; AL.1.5.2 Normalization of the supplied completed Hecke function, AL.1.6.2 Hecke continuation and functional equation; AL.5.1.1 Finite Euler corrections at critical points; ArithmeticDirichletSeries Layer 3.

API:

- The Euler factor is independent of the uniformizer at unramified primes and equals `(1 − η(v)N(v)^{−s})⁻¹` with the ideal value `η(v)`.
- Absolute convergence: for `|η(v)| = N(v)^{1/2}` the product converges absolutely and unconditionally for `Re s > 3/2`.
- Uniqueness: two entire functions agreeing with the product on `Re s > 3/2` agree everywhere, so `HasCentralValue η ϖ z` and `HasCentralValue η ϖ z'` give `z = z'`.
- Nonvanishing transfers between primitive and deleted values; vanishing transfers from primitive to deleted values for every `S`.

**Checks.**

- At a ramified prime the factor is `1`, not `(1 − 0)⁻¹` computed from an extended-by-zero value of a wrong modulus; for `η` ramified at both primes above `l`, the `l`-factors are `1` (§5.3).
- For `φ` of the curve `y² = x³ − x` at the inert prime `7`, `eulerFactor` at `s = 1` is `(1 − (−7)/49)⁻¹ = (1 + 1/7)⁻¹ = 7/8`; using `+7` gives `7/6`.
- The trivial `p`-character with the `p`-factor deleted: `E_{{p}}(1) = 1 − φ((p))/p² = 1 + 1/p`, which is nonzero but has `v_p = −1`; deletion at `p` is harmless for nonvanishing and changes valuations.
- Without the entire-function clause the value would not be determined: take `F` equal to the Euler product on `Re s > 3/2` and assign it an arbitrary value at `s = 1`; this gives both `0` and `1` as candidate central values. Requiring `F` entire excludes such assignments, so `HasCentralValue η ϖ z` holds for at most one `z`, and `HasCentralValue η ϖ z` with `z ≠ 0` asserts nonvanishing.

### 0.4 The integral CM period

Construct the period datum: for a CM curve `E/H` attached to `φ ∘ N_{H/K}` with good reduction at every place above the inert `p`, choose a smooth integral Weierstrass model at the place above `p` fixed by `ι_p` and its Néron differential `ω`. After replacing `E` by a conjugate in its ideal-class orbit, choose `Ω ∈ ℂ×` with period lattice of `(E, ω)` equal to `Ω O_K`. Define the normalised value `A_S(η; E, ω, Ω) = Ω⁻¹ L_S(η, 1) ∈ ℂ`. Its algebraicity for `η = φ̄χ`, `χ` of finite order, and hence its `p`-adic avatar under `ι_p`, is a consequence of Kato's reciprocity law (§2.6), not part of this construction; no map `ℂ → C_p` is used (BKO, §3.0.2, p.951). *Needs:* ComplexMultiplicationAndExplicitReciprocity §1.2 CM period and de Rham pairings (with its period-lattice comparison), §4.3 `canonicalGrossExistence` and Canonical Gross good reduction away from the discriminant; AL.1.5.2 Normalization of the supplied completed Hecke function.

API:

- The integration image of `H₁(E(ℂ), Z)` against `ω` is `Ω O_K`.
- Changing `Ω` to `εΩ`, `ε ∈ O_K×`, multiplies `A_S` by `ε⁻¹` and preserves every valuation.
- Changing `ω` to `vω` with `v ∈ H×` a unit at the place above `p` changes `Ω` to `vΩ` and `A_S` to `v⁻¹A_S`.
- `A_S(η) ≠ 0` if and only if `L_S(η, 1) ≠ 0`.
- Extending the algebraic coefficient field carries `A_S` to the same value under the extended embedding.

**Checks.**

- Scaling `ω` by `2` at `p ≥ 5` gives `A_S/2`, still a `p`-unit when `A_S` is.
- Scaling `ω` by `p` destroys Néron normalisation and lowers `v_p(A_S)` by one; it is not an allowed change.
- For `K = Q(√−5)` (`h_K = 2`) and the nonprincipal ideal `a = (2, 1 + √−5)`, the lattice `a` is not `Ω O_K` for any `Ω`, since `a` would be principal; the conjugate-curve step is required.
- If `L_S(η, 1) = 0` then `A_S = 0`; the nonzero period creates no unit.
- At an inert `p` the ordinary `p`-adic period of a CM curve does not exist (the formal group has height two), while `Ω` is defined.

### 0.5 The auxiliary split prime

Prove: for `K` imaginary quadratic, `p ≥ 5` inert in `K` and a finite set `S` of rational primes, there are infinitely many primes `l ∉ S` with `l ≥ 5`, `l` split in `K` and `l ≢ 1 mod p`; in particular `p ∤ (l − 1)` (BKO, §3.0.2, p.951, the hypotheses before (3.3)). Proof route: `p` is unramified in `K`, so `K` is not the quadratic subfield of `Q(μ_p)` and the two fields are linearly disjoint; take the Frobenius class `(1, a)` with `a ≢ 1 mod p` in `Gal(K(μ_p)/Q)` and apply Dirichlet-density Chebotarev. *Needs:* Chebotarev Layer 10; ClassFieldTheory Layer 13.

**Checks.**

- `K = Q(√−7)`, `p = 5`: `l = 23` splits (`−7 ≡ 16 = 4²` mod `23`) and `23 ≡ 3 mod 5`; `l = 11` splits (`−7 ≡ 4` mod `11`) but `11 ≡ 1 mod 5` is excluded.
- `l = 13`: `−7 ≡ 6 mod 13`, and the nonzero squares modulo `13` are `1, 3, 4, 9, 10, 12`, so `(−7/13) = −1` and `13` is inert in `Q(√−7)`; it is not an auxiliary prime although `13 ≢ 1 mod 5`.
- For `p = 3` the statement requires `l ≡ 2 mod 3`; the BKO setting `p ≥ 5` is kept.

### 0.6 The auxiliary anticyclotomic characters

Define `X_l`, for a prime `l ≥ 5` split in `K` with `l ∤ h_K N(f)` and `p ∤ (l − 1)`, as the set of characters of finite order of the anticyclotomic `Z_l`-extension `K_l^{ac}/K`, viewed as Hecke characters through the arithmetic Artin map, with values embedded by `ι_∞` and `ι_p`. For `ν ≠ 1` of exact order `l^r` write `L[r]` for its field layer and `l^m O_K`, `m = r + 1`, for its conductor; for `ν = 1`, `m = 0` (BKO, §3.0.2, pp.951–953; the published text uses one letter for order, layer and conductor). Prove that the depth-`m` anticyclotomic principal-unit quotient has order `l^{m−1}` since `l ∤ h_K` and `l ∤ #O_K×`. *Needs:* ClassFieldTheory Layer 13; GlobalNumberFields Layers 9–11; Mathlib `MonoidAlgebra.lift`.

API:

- `X_l` is an abelian group, the Pontryagin dual of `Gal(K_l^{ac}/K) ≅ Z_l`, isomorphic to `Q_l/Z_l`; `ν⁻¹ = ν ∘ c`.
- A character of exact order `l^r` factors through `L[r]` and no smaller layer, and its conductor is `l^{r+1} O_K` for `r ≥ 1`.
- Every element of `X_l` satisfies `IsAnticyclotomic`, has odd order and is unramified at `p`.
- Group-algebra evaluation is `MonoidAlgebra.lift` applied to `ν`: `[g] ↦ ν(g)`.
- Any embedding of the value field transports evaluation, order and conductor.

**Checks.**

- For `r = 1` the field layer has degree `l` and the conductor is `l²`.
- `ν = 1` has `m = 0`; the rule `m = r + 1` is not applied.
- For `ν(g) = ζ_l`, `[g]` evaluates to `ζ_l`, which differs from `ζ_l⁻¹` for `l ≥ 5`.
- A cyclotomic `l`-power character is not in `X_l` unless trivial.

### Examples

For `K = Q(√−7)`, `p = 5`, `l = 23`: `X_23` has characters of exact order `23` with conductor `23² O_K`; each is anticyclotomic, odd and unramified at `5`. The character of `y² = x³ − x` over `Q(i)` is equivariant of type `(1,0)` with `φ((7)) = −7`.

### Dependencies

Mathlib; Tau Ceti `HeckeCharacter` and the ray-class carriers; GlobalNumberFields Layers 9–11; ClassFieldTheory Layer 13; Chebotarev Layer 10; ArithmeticDirichletSeries Layer 3; AL.1, AL.5; ComplexMultiplicationAndExplicitReciprocity §§1.2, 4.3.

## Layer 1: Root numbers and forced central zeros

### 1.1 The root number of a canonical character

Prove: if `φ` is a canonical Gross character (`IsCanonicalGrossCharacter`) of `K` with odd fundamental discriminant `−D` (so `D ≡ 3 mod 4` and, canonical characters existing, `D ≠ 3`), then `W(φ) = W(φ̄) = (2/D)`, the Jacobi symbol. Corollary, used in Layer 5: `W(φ) = +1` exactly when `D ≡ 7 mod 8`, that is, exactly when `2` splits in `K`; for `D ≡ 3 mod 8` (`2` inert) `W(φ) = −1`. Proof route: at an odd ramified `q` the conductor and different have exponent one; in the standard additive character the archimedean factor is `−i` and the factor at `q` is `i^{δ_q}(2/q)∏_{r ≠ q}(q/r)`, `δ_q = 0` or `1` as `q ≡ 1` or `3 mod 4`; quadratic reciprocity collapses the product to `(2/D)` (Rohrlich, Root numbers, Proposition 1.5, p.14, and Lecture 2 §5.2, (2.44)–(2.49), pp.35–36; BKO, proof of Theorem 3.4, p.953). Conjugation reindexes the ideal series, so `φ̄` has the same sign. *Needs:* ComplexMultiplicationAndExplicitReciprocity §4.3; AL.1.3.5 Explicit local ε-factors, AL.1.6.2 Hecke continuation and functional equation with its root number `W_H(ω)`.

**Checks.**

- `K = Q(√−7)` (`D ≡ 7 mod 8`, `2` split): `(2/7) = +1`. `K = Q(√−23)` (`23 ≡ 7 mod 8`): `(2/23) = +1`.
- `K = Q(√−11)` (`D ≡ 3 mod 8`, `2` inert): `(2/11) = −1`; `K = Q(√−19)`: `(2/19) = −1`. These are instances of the theorem with negative sign, so the split corollary of Layer 5 selects only the first two.
- For `8 | D` the sign is not a function of `D`: exactly `h_K` of the `2h_K` canonical characters have each sign (Rohrlich, Root numbers, Proposition 1.6, p.15); the formula `(2/D)` is not asserted there, and `D` odd is a hypothesis of the theorem.
- Converting from Rohrlich's additive character to AL.1's by `ψ_v ↦ ψ_v(−·)` changes local factors by `φ_v(−1)` whose product is `1`; changing only the archimedean factor to `+i` would give `−(2/D)`.

### 1.2 Auxiliary twists preserve the root number

Prove: for `φ` as in §0.1 with `p ∤ f`, and every `ν ∈ X_l`, `W(φν) = W(φ)` and `W(φ̄ν) = W(φ̄)`. Proof route: at the two primes over `l` the components of `ν` are inverse to each other under conjugation, with equal conductor exponents; pair their Gauss sums by `ε(ν_λ)ε(ν_λ⁻¹) = ν_λ(−1) = 1`, and the unitary values of `φ` at the two primes multiply to `φ((l))/l = κ_K(l) = 1`. At every other place `ν_v` is unramified and the ratio of local root numbers is `ν_v` at `ϖ_v^{a(φ_v) + n(ψ_v)}`; the product is `ν(f 𝔡_K)`, the conductor times the different, a conjugation-stable ideal, on which an odd-order anticyclotomic character is `1` (BKO, §3.0.2, p.951; Greenberg, §1, pp.246–247; Rohrlich, Root numbers, Lecture 2 §5.1, (2.39)–(2.43), pp.34–35; Finis, proof of Corollary 2.3, p.778). *Needs:* §§0.1, 0.6; AL.1.1.1 Local quasi-characters, unramified characters and the conductor exponent, AL.1.3.5 Explicit local ε-factors, the root number `W_H(ω)` of AL.1.6.2.

**Checks.**

- `ν = 1`: both sides agree trivially.
- A character ramified at only one prime over `l` is not in `X_l`; for it the pairing step fails.
- The odd-order hypothesis is used: a genus character of a field with even class number is anticyclotomic of order `2`, and can take the value `−1` on a ramified prime dividing `f𝔡_K`, so the ratio `ν(f𝔡_K)` can be `−1`.

### 1.3 The p-anticyclotomic conductor sign

Prove: let `p` be odd and inert, `φ` as in §0.1 with `p ∤ f`, `ν` anticyclotomic of odd finite order unramified at `p`, and `χ` in the `p`-anticyclotomic family with `c = conductorExponent v χ`. Then `W(φνχ) = (−1)^c W(φν)`, and the same with `φ̄`. For `χ ≠ 1` of exact order `p^n` and `p ∤ h_K`, `c = n + 1`. Proof route: at `p`, `φν` is unramified with unitary uniformizer value `φ((p))ν((p))/p = −1` (§0.1, §0.2) and `n(ψ_p) = 0`; the local root number of `χ_p` is `χ_p(Δ)` for `Δ ∈ Φ×` with `Δ² ∈ Q_p×` by the local Fröhlich–Queyrut theorem, and equals `1` because `χ_p` is trivial on `Q_p×` and of odd order; the unramified twist contributes `(−1)^c`. At every other place the ratio is `χ` on the conjugation-stable ideal `f(φν)𝔡_K`, hence `1` (Greenberg, p.247, where `w(Ψρ) = (−1)^{n+1} w(Ψ)` in the supersingular case and `w(ρ) = +1` is attributed to Fröhlich–Queyrut; Queyrut 1974, p.135, QUEYRUT74 line 86; BKO, proof of Proposition 3.3(3), p.953). *Needs:* §§0.1, 0.2, 1.2; AL.1.3.5 Explicit local ε-factors, AL.1.3.4 The local Gauss sum, the root number `W_H(ω)` of AL.1.6.2; the local Fröhlich–Queyrut theorem (gap:al-local-frohlich-queyrut).

**Checks.**

- `c = 2` preserves the sign and `c = 3` reverses it; when `p ∤ h_K` these are the characters of order `p` and `p²`. When `p | h_K` an unramified character of order `p` has `c = 0` and preserves the sign (§0.2, `K = Q(√−31)`, `p = 3`).
- The trivial `χ` has `c = 0` and keeps `W(φν)`; the formula `c = n + 1` would assign it `c = 1` and reverse the sign.
- At `p` the unitary value is `−1` because `p` is inert; for a split prime the same twist has two ramified places and no parity factor.

### 1.4 Wrong-sign central values vanish

Prove: with the hypotheses of §1.3, if `(−1)^c W(φν) = −1` then `L(φνχ, 1) = 0` and `L_S(φνχ, 1) = 0` for every finite `S`; likewise for `φ̄νχ`. Proof route: `η = φνχ` satisfies `η η̄ = N`, so its dual is `η̄`, and `η̄(a) = η(ā)`, so `L(η̄, s) = L(η, s)` (Jia, p.2, JIA24 lines 42–61); the completed function satisfies `Λ(s) = W(η)Λ(2 − s)`, and sign `−1` gives `Λ(1) = 0`; the archimedean factor at the centre is finite and nonzero; the Euler deletion polynomial is entire (AL.5.3.2 The functional-equation sign at the centre, AL.5.1.1 Finite Euler corrections at critical points; BKO, Proposition 3.3(3) and its proof, p.953). No converse is asserted from sign `+1`. *Needs:* §1.3; AL.1.6.2 Hecke continuation and functional equation; AL.5.3.2 The functional-equation sign at the centre, AL.5.1.1 Finite Euler corrections at critical points.

**Checks.**

- `W(φν) = +1`, `c = 2`: no zero is supplied; `c = 3`: a zero is forced.
- `χ = 1` with `W(φν) = −1`: `L(φν, 1) = 0`.
- A deleted value at a prime where the polynomial vanishes at `s = 1` would also vanish; the argument never divides by it.

### Examples

For `K = Q(√−7)`, `p = 5`, `φ` canonical: `W(φ) = +1` (§1.1); for `ν ∈ X_23`, `W(φν) = +1` (§1.2); for `χ` of order `5`, `c = 2` and `W = +1`; for order `25`, `c = 3`, `W = −1` and `L(φνχ, 1) = 0`.

### Dependencies

Layer 0; ComplexMultiplicationAndExplicitReciprocity §4.3; AL.1, AL.5 and the local Fröhlich–Queyrut theorem in AL.1.

## Layer 2: Elliptic units and Kato's reciprocity law for CM characters

### 2.1 The CM refinement of Kato's theta function

The normalised theta unit `_cθ_E` of PadicFamilies §4.0.1 (divisor `c²(0) − E[c]`, invariance under the norms `N_b` along multiplication by integers `b` prime to `c`, base change, Tate `q`-expansion, and the isogeny norm for isogenies of degree prime to `c`, Kato 2004, Proposition 1.3, pp.121–122) is used here only over fields of characteristic `0` containing `K`, where every `c` is invertible, so the supplier's range suffices and Layer 2 needs no extension to non-invertible `c`. For a field `K'` containing `K`, an elliptic curve `E/K'` with `End(E) ≅ O_K`, normalised so that `O_K` acts on `Lie(E)` through the inclusion, and an ideal `a` of `O_K` prime to `6`, construct the unique `_aθ_E ∈ O(E ∖ E[a])×` with divisor `N(a)(0) − E[a]` and `N_b(_aθ_E) = _aθ_E` for integers `b` prime to `a`; prove `_{(c)}θ_E = _cθ_E`, the cocycle relation between `a` and `b`, and the isogeny law: for an isogeny `h : E → E'` of such curves (automatically `O_K`-linear, both actions being normalised on `Lie` in characteristic `0`) whose kernel meets `E[a]` trivially, equivalently whose kernel has annihilator prime to `a`, the norm along `h`, from `O(E ∖ h⁻¹(E'[a]))×` to `O(E' ∖ E'[a])×`, sends `_aθ_E` to `_aθ_{E'}` (Kato 2004, §15.4, (15.4.1)–(15.4.4), pp.252–253). The printed (15.4.2), KATO04 lines 5254–5255, states the isogeny law without the kernel condition, which is necessary (see the Checks); for `a = (c)` the condition is the degree condition of Kato 2004, Proposition 1.3(4), KATO04 line 238, since a finite kernel meets `E[c]` trivially exactly when its order is prime to `c`. For an isogeny whose kernel meets `E[a]` nothing is asserted. *Needs:* PadicFamilies §4.0.1; EllipticCurves Layer 1; ComplexMultiplicationAndExplicitReciprocity §1.2 (the period-lattice comparison).

API:

- Uniqueness: two units with the same divisor and the norm invariance agree.
- Isogeny law: for an isogeny `h : E → E'` of curves with normalised CM by `O_K` whose kernel meets `E[a]` trivially, the norm along `h` sends `_aθ_E` to `_aθ_{E'}`; the divisor identity behind it is `h_*(N(a)(0) − E[a]) = N(a)(0) − E'[a]`, since `h` maps `E[a]` bijectively onto `E'[a]`.
- Cocycle: `(_bθ_E)^{N(a)} · (pr_1^* {}_bθ_{E/aE})^{−1} = (_aθ_E)^{N(b)} · (pr_2^* {}_aθ_{E/bE})^{−1}`.
- Comparison: `_{(c)}θ_E` is the supplier's `_cθ_E`; for `a = (c)`, `b = (d)` the cocycle gives Kato's distribution relation in `c` and `d` on CM curves.

**Checks.**

- `a = (c)`: the CM refinement is Kato's `_cθ_E`; its divisor `c²(0) − E[c]` has degree `c² − c² = 0`.
- For `a` of norm `5` in `Z[i]`, `E[a]` has `5` points and the divisor `5(0) − E[a]` has degree `0`; a divisor `(0) − E[a]` has nonzero degree and is not principal.
- Without the norm invariance, `ζ·_aθ_E` for a root of unity `ζ` has the same divisor; the invariance `N_b(ζθ) = ζ^{b²}N_b(θ)` excludes `ζ ≠ 1` for suitable `b`.
- The kernel condition is necessary: for `E = ℂ/Z[i]`, `a = (5)` and `h = [5]`, the kernel `E[5]` is all of `E[a]`, and `h_*(25(0) − E[5]) = 25(0) − 25(0) = 0`, so the norm of `_aθ_E` is constant, while `_aθ_E` has the nonzero divisor `25(0) − E[5]`. For `h = [2]`, with kernel `E[2]` of annihilator `2` prime to `5`, `[2]` permutes `E[5]`, the pushed divisor is again `25(0) − E[5]`, and the law holds.
- The condition is on the kernel, not on the degree: for `a = (2 − i)` and `h : E → E/E[2 + i]`, of degree `5 = N(a)`, the kernel meets `E[2 − i]` trivially and the law holds; for `a = (2 + i)` and the same `h`, the kernel is `E[a]` and `h_*(5(0) − E[a]) = 0`.

### 2.2 Canonical CM pairs and standard elliptic units

Construct, for an ideal `f` with `O_K× → (O_K/f)×` injective, the canonical CM pair `(E, α)` of modulus `f` over the ray class field `K(f)`: a CM curve with the normalised `O_K`-action and a torsion point with annihilator `f`, isomorphic over `ℂ` to `(ℂ/f, 1 mod f)`; prove its uniqueness up to unique isomorphism, its universality, and that the Artin symbol of `a` carries `(E, α)` to `(E/E[a], α mod E[a])` (Kato 2004, §15.3, (15.3.1)–(15.3.3), pp.251–252). Define the standard elliptic unit `_az_f = _aθ_E(α)⁻¹ ∈ K(f)×`, the inverse of the theta value at the canonical point, for `a` prime to `6f` (Kato 2004, §15.5, p.253, KATO04 lines 5271–5275); prove norm compatibility in the tower `K(p^n f)` for `a` prime to `6pf`, by the isogeny law of §2.1 applied to the canonical isogeny from the canonical curve of modulus `p^{n+1}f` to that of modulus `p^n f` (over `ℂ`, `ℂ/p^{n+1}f → ℂ/p^n f`), whose kernel `p^n f/p^{n+1}f` is killed by `p` and so meets `E[a]` trivially; and prove that `_az_f` is a `𝔭`-unit for primes `𝔭 ∤ f`, a unit when `f` has two prime divisors (Kato 2004, §15.5, p.253). *Needs:* §2.1; ComplexMultiplicationAndExplicitReciprocity §2.2 Normalized idele and torsion dictionary, §3.2 Exact ray-level field and generation criterion; ClassFieldTheory Layer 13.

API:

- Base change: a CM pair over a field `K'` is the base change of the canonical pair along a unique `K(f) → K'`.
- Norm compatibility: for `a` prime to `6pf` and `n ≥ 1` with `O_K× → (O_K/p^n f)×` injective, the norm from `K(p^{n+1}f)` to `K(p^n f)` sends `_az_{p^{n+1}f}` to `_az_{p^n f}` (Kato 2004, §15.5, p.253, deduced there from (15.4.2); the kernel condition of §2.1 holds here).
- Kronecker's limit formula: `Σ_σ χ(σ) log|σ(_az_f)| = (N(a) − χ(a)⁻¹) · lim_{s→0} s⁻¹ L_{K,f}(χ, s)` for characters `χ` of `Gal(K(f)/K)` (Kato 2004, (15.5.1), p.253). The theta value `_aθ_E(α) = (_az_f)⁻¹` satisfies the same formula with the opposite sign: `_aθ_E` vanishes to order `N(a) − 1` at the origin, so `log|_aθ_E|` is minus the regularised lattice-sum derivative `N(a) E^{(0)}(z) − Σ_{P ∈ E[a]} E^{(0)}(z − P)`, `E^{(0)}(z) = ∂_s Σ_{w} |z + w|^{−s} |_{s=0}`, which tends to `+∞` at the origin. The sign is fixed by the order of vanishing at the origin, whatever normalisation of the Eisenstein series is used, and the inverse in the definition of the unit gives the positive formula.

**Checks.**

- `K = Q(i)`, `f = (3)`: `O_K× = {±1, ±i}` injects into `(Z[i]/3)×` of order `8`, so the canonical pair exists over `K(3)`, of degree `2` over `K`. For `f = (2)` the units `1` and `−1` have the same image in `(Z[i]/2)×`, so the map is not injective and the hypothesis fails.
- The Artin symbol of a principal `a = (λ)`, `λ ≡ 1 mod f`, acts trivially and `(E/E[a], α mod E[a]) ≅ (E, α)` via multiplication by `λ`, from `ℂ/λ⁻¹f` to `ℂ/f`; multiplication by `λ⁻¹` is the reverse isomorphism. For `K = Q(i)`, `f = (3)`, `λ = 4`: the quotient is `ℂ/(3/4)Z[i]`, multiplication by `4` sends `3/4` to `3 ≡ 0` and the marked point `1` to `4 ≡ 1 mod 3`, while multiplication by `1/4` sends `3/4` to `3/16`, nonzero modulo `3Z[i]`, so it is not defined on the quotient.
- Sign of the unit: `K = Q(i)`, `f = (3)`, `a = (5)`, `χ = 1`. Here `3` is inert of norm `9`, `L_{K,f}(1, s) = ζ_K(s)(1 − 9^{−s})`, `ζ_K(0) = −1/4`, so `lim_{s→0} s⁻¹ L_{K,f}(1, s) = −(1/4) log 9 = −(log 3)/2`, and the right side of Kronecker's formula is `24 · (−(log 3)/2) = −12 log 3`. The standard units `_az_f = _aθ_E(α)⁻¹` give `Σ_σ log|σ(_az_f)| = −12 log 3`; the theta values give `+12 log 3`, so the definition without the inverse contradicts the formula by a nonzero amount.
- `f = (𝔮^k)` with a single prime divisor: `_az_f` need not be a unit at `𝔮`.

### 2.3 The elliptic zeta element and its smoothing

Define, for `G = Gal(K(p^∞f)/K)` and `Λ = Z_p[[G]]`, the element `z_{p^∞f} = (N(a) − σ_a)⁻¹ (_az_{p^n f})_n` of `H¹_{p^∞f}(Z_p(1)) ⊗_Λ Q(Λ)`, for any `a` prime to `6pf` with `a ≠ O_K`, where `σ_a` is the Artin symbol and `Q(Λ)` the total quotient ring; prove independence of `a` by the cocycle relation, and that `(N(a) − σ_a) z_{p^∞f}` lies in `H¹_{p^∞f}(Z_p(1)) = lim H¹(O_{K'}[1/p], Z_p(1))` for every `a` prime to `6pf` (Kato 2004, §15.6, (15.6.3), p.254). Prove that the ideal of `Λ` generated by all `N(a) − σ_a` is the unit ideal at every height-one prime, and that the image `z_{K'}` at a finite layer lies in `(O_{K'}[1/p]×) ⊗ Q` with the logarithmic Kronecker formula (Kato 2004, (15.6.4)–(15.6.5), pp.254–255). The unsmoothed element is not integral in general. Define the theta-value zeta element `z^θ_{p^∞f} = −z_{p^∞f}`: it is built in the same way from the theta values `(_aθ_{E_n}(α_n))_n = ((_az_{p^n f})⁻¹)_n`, `(E_n, α_n)` the canonical pair of modulus `p^n f`, since the Kummer map turns inversion of units into negation of classes. Kato's reciprocity law (§2.6) and the integral class (§2.7) are stated for `z^θ_{p^∞f}`. *Needs:* §2.2; SelmerIwasawaCohomology §§0.8–0.9.

API:

- Integrality of smoothed elements: `(N(a) − σ_a) z_{p^∞f} ∈ H¹_{p^∞f}(Z_p(1))`.
- Independence of the smoothing ideal.
- Specialisation at a finite layer `K'` through the localisation at non-zero-divisors whose images in `Q_p[Gal(K'/K)]` are invertible.

**Checks.**

- If `N(a) − σ_a` maps to a nonunit on a component (for instance `σ_a` acting by `N(a)` there), the unsmoothed component cannot be read off integrally; the smoothed one can.
- Membership in `H¹ ⊗ Q(Λ)` or in `H¹[1/p]` does not imply membership in `H¹`.
- Changing `a` to `b` multiplies the smoothed element by `(N(b) − σ_b)/(N(a) − σ_a)` and leaves `z_{p^∞f}` unchanged.
- Units against theta values: at the finite layer `K(3)` of `K = Q(i)` with `a = (5)`, the archimedean logarithms of the standard units sum to `−12 log 3` and those of the theta values to `+12 log 3` (§2.2); correspondingly `z^θ_{p^∞f} + z_{p^∞f} = 0`, and the smoothing factors `N(a) − σ_a` and every integrality statement apply to both elements alike, negation preserving `H¹_{p^∞f}(Z_p(1))`.

### 2.4 Kato's realisation, de Rham line and period map

Construct, for a Hecke character `ψ` of type `(−r, 0)`, `r ≥ 1`, with value field `L ⊂ ℂ` generated over `K` by the values `ψ(a)` of `ψ` on the finite ideles `a ∈ K̂×` (a finite extension of `K`, Kato 2004, §15.7, p.256; `ψ` is trivial on the principal ideles `K× ⊂ ℂ× × K̂×`, so their values generate nothing), and for `f` contained in the conductor of `ψ` with `O_K× → (O_K/f)×` injective and `(E, α)` the canonical CM pair over `K(f)`: the `L`-line `V_L(ψ) = H¹(E(ℂ), Q)^{⊗_K r} ⊗_K L`, where `K` acts on the one-dimensional `K`-space `H¹(E(ℂ), Q)` through `K ≅ End(E) ⊗ Q` and the tensor powers are over `K`; the Galois action on `V_{L_λ}(ψ) = V_L(ψ) ⊗_L L_λ` by which the Artin symbol of `a` prime to `pf` acts as `ψ(a)⁻¹`; the descent action of `Gal(K(f)/K)` on `coLie(E)^{⊗ r} ⊗_K L`, the tensor power taken over `K(f)`, in which `σ = (a, K(f)/K)`, `a` prime to `f`, acts as the composite of `σ ⊗ 1 : coLie(E)^{⊗ r} ⊗_K L → coLie(E^{(σ)})^{⊗ r} ⊗_K L` and `η_ψ = ψ(a)⁻¹ (η_a^*)^{⊗ r} : coLie(E^{(σ)})^{⊗ r} ⊗_K L → coLie(E/E[a])^{⊗ r} ⊗_K L = coLie(E)^{⊗ r} ⊗_K L`, where `η_a : (E/E[a], α mod E[a]) ≅ (E^{(σ)}, σ(α))` is the isomorphism of §2.2 and the last identification is pullback along the canonical isogeny `E → E/E[a]`; the action is semilinear over `K(f)` (`σ(bx) = σ(b)σ(x)` for `b ∈ K(f)`) and `η_ψ` does not depend on the ideal `a` representing `σ` (Kato 2004, §15.8, p.257, KATO04 lines 5425–5436); the `L`-line `S(ψ) ⊂ coLie(E)^{⊗ r} ⊗_K L` of invariants of this action, with `S(ψ) ⊗_K K(f) = coLie(E)^{⊗ r} ⊗_K L`; the period map `per_ψ : S(ψ) → V_L(ψ) ⊗_L ℂ` induced by the de Rham–Betti period map `coLie(E) → H¹(E(ℂ), Q) ⊗_Q ℂ`; and the de Rham isomorphism `S(ψ) ⊗_L L_λ ≅ D^j_dR(K ⊗ Q_p, V_{L_λ}(ψ))`, the same for every `1 ≤ j ≤ r`, independent of `f` (Kato 2004, §15.7–15.8, pp.255–257, KATO04 lines 5383–5453). Prove the dictionary with this roadmap's conventions, for the period datum of §0.4 at the inert `p`: for `ψ = φ` (`r = 1`), `V(φ)(1) = T_φ^∨(1)[1/p]`, the de Rham line at every prime above `p` is generated by `ω`, `γ = per_φ(ω)/Ω`, and the analytic character in §2.6 is `φ̄` times the direct finite character (Kato 2004, §15.8 and Proposition 15.9, pp.256–258; BKO, §3.0.2, p.951 and (3.4), p.952). *Needs:* §2.2; ComplexMultiplicationAndExplicitReciprocity §4.1 One-dimensional CM components of the Tate module and Frobenius and infinity-type identities; PadicHodgeRegulators §1.4.

API:

- The Artin symbol of `a` prime to `pf` acts on `V_{L_λ}(ψ)` as `ψ(a)⁻¹`; through the reciprocity map, a finite idele `a ∈ K̂×` acts as multiplication by `a_v^r ψ(a)⁻¹`, with `v` the place of `K` under `λ`, `a_v ∈ K_v ⊂ L_λ` its `v`-component and `ψ(a)` the value of `ψ` at `a` (Kato 2004, §15.8, p.256, KATO04 lines 5414–5417).
- Descent: the rule `σ ↦ (σ ⊗ 1) followed by η_ψ` is an action of `Gal(K(f)/K)`, independent of the representing ideals, because two ideals with the same Artin symbol differ by a principal `(λ)`, `λ ≡ 1 mod f`, whose isomorphism (multiplication by `λ`, §2.2) pulls `ω^{⊗ r}` back to `λ^r ω^{⊗ r}`, while `ψ((λ)) = λ^r`.
- `S(ψ)` is one-dimensional over `L`, `per_ψ` is injective, and `per_ψ` takes values in the `ℂ`-line `V_L(ψ) ⊗_L ℂ`; the vector `γ ∈ V_L(ψ)` of §2.6 is an element of that line, not a scalar. With `β^{⊗(−1)}` the `K`-linear dual of a basis `β` of `H₁(E(ℂ), Q)`, `per_ψ(ω^{⊗ r}) = (∫_β ω)^r β^{⊗(−r)}`.
- Hodge filtration: `D⁰_dR(K ⊗ Q_p, V_{L_λ}(ψ))` has `L_λ`-dimension `2`, `D^j_dR` is the line `S(ψ) ⊗_L L_λ` for `1 ≤ j ≤ r`, and `D^{r+1}_dR = 0`; the line is the `ι`-eigenpart `coLie(E)^{⊗ r}`, the conjugate eigenpart `H¹(E, O)^{⊗ r}` lies in `D⁰` only.
- At a good prime `a`, arithmetic Frobenius on `T_φ^∨(1)` is `N(a)/φ(a)`.

**Checks.**

- Dual and twist: on `T_φ` arithmetic Frobenius at `a` is `φ(a)`; on the dual it is `φ(a)⁻¹`, and the Tate twist multiplies by `N(a)`: `N(a)/φ(a)`. Omitting the twist gives `φ(a)⁻¹`, of absolute value `N(a)^{−1/2}` instead of `N(a)^{1/2}`.
- Normalisation of the descent action: `K = Q(i)`, `f = (8)` (the units `±1, ±i` are distinct modulo `8`), `ψ` of type `(−2, 0)` with conductor dividing `f`, `r = 2`, `a = (9)`. Since `9 ≡ 1 mod 8`, `σ_a = 1`; the isomorphism `E/E[a] → E` is multiplication by `9`, which pulls `dz^{⊗ 2}` back to `81 dz^{⊗ 2}`, and `ψ((9)) = 9² = 81`, so `η_ψ` acts by `81/81 = 1`, as the identity must. Omitting the factor `ψ(a)⁻¹` makes the identity act by `81`, which is not an action; a one-dimensionality statement alone does not exclude such a twist.
- The analytic character is `φ̄χ`, and the convention is pinned at the character, not at the value. For `y² = x³ − x` over `Q(i)` at `𝔮 = (−1 + 2i)`, `φ̄(𝔮) = φ(𝔮̄) = conj φ(𝔮) = −1 − 2i`, while the conjugation-free model `φχ` uses `φ(𝔮) = −1 + 2i`; and at a prime with `χ(𝔮) = ζ_25` the inverse model `φ̄χ⁻¹` uses `ζ_25⁻¹ ≠ ζ_25`. The `L`-values of different models may coincide: `L(φ̄χ⁻¹, s) = L(φχ, s)` identically (§0.1), and for `K = Q(√−7)`, `p = 5`, `χ` of order `25` (`c = 3`) the central values of `φχ` and `φχ⁻¹` are both `0` (§1.4).
- `r = 1`: `H¹` has Hodge pieces `(1, 0)` and `(0, 1)`, so over the two coefficient embeddings `D⁰_dR` has `L_λ`-dimension `2` and `D¹_dR = S(φ) ⊗ L_λ` has dimension `1`; identifying `D⁰_dR` with the line would be wrong already at `r = 1`, and the dual exponential of §2.6 lands in `D⁰_dR(V(ψ)(1)) = D¹_dR(V(ψ)) ⊗ t⁻¹`.
- Cohomology, not homology: for `y² = x³ − x` over `Q(i)` (`r = 1`, `ψ = φ`) at the inert prime `7`, arithmetic Frobenius acts on the line `H¹` by `φ((7))⁻¹ = −1/7`, and on its Tate twist by `49 · (−1/7) = −7 = N(a)/φ(a)`; on homology `H₁` it acts by `−7` before any twist, which is `φ(a)`, not the required `ψ(a)⁻¹`.
- The exponent `r` in the local scalar: for `x ∈ K×`, viewed as a finite idele, `ψ(x) = ψ_∞(x)⁻¹ = x^r`, so `x_v^r ψ(x)⁻¹ = 1`, as the reciprocity map requires; the formula `x_v ψ(x)⁻¹ = x^{1 − r}` is not trivial on `K×` for `r ≥ 2`, and at `r = 2`, `a_v = 6` it differs from the correct scalar by the factor `6` (`36` against `6`, times `ψ(a)⁻¹`).

### 2.5 The height-one explicit reciprocity law

Prove, in the form applied by Kato. Let `p` be a prime, `f` a nonzero ideal of `O_K`, `f_0` the smallest ideal dividing `f` and prime to `p`, and `g = p^m f_0` with `m ≥ 1`, `g ⊂ f` and `O_K× → (O_K/g)×` injective; let `K' = K(g)`, `(E, α)` the canonical CM pair over `K(g)` (§2.2), `a` an ideal of `O_K` prime to `6pf`, `r ≥ 1` and `ω` a `K'`-basis of `coLie(E)`. Let `β ∈ H₁(E(ℂ), Q)` be the image of `1 ∈ K` under the `K`-isomorphism `K ≅ H₁(ℂ/g, Q)` induced by `g ≅ H₁(ℂ/g, Z)`; it is a rational class, not an integral one, since `1 ∉ g`. The image `ξ` of `p^m β` in `H₁(E(ℂ), Q_p) = T_pE ⊗ Q` is an `O_K ⊗ Z_p`-basis of `T_pE`, with components `ξ_n ∈ E[p^n]`. For `n ≥ 0` let `α_n ∈ E(K(p^n f_0))` be the image of `p^{m−n} β` in `H₁(E(ℂ), Q/Z) ≅ E(ℂ)_tor`, so that `α = α_m`; put `ν_n = ξ_n − α_n`, a point of `E(K')` killed by `f_0`, and `θ_n(z) = {}_aθ_E(z − ν_n)`. Then `θ_n(ξ_n) = {}_aθ_E(α_n)`, `N_p(θ_{n+1}) = θ_n` (as `p ν_{n+1} = ν_n` and `N_p({}_aθ_E) = {}_aθ_E`), and the image of `ξ^{⊗(−r)} ⊗ (θ_n(ξ_n))_n ∈ (T_pE)^{⊗(−r)} ⊗ lim_n H¹(O_{K(p^n f)}[1/p], Z_p(1))` in `lim_n H¹(O_{K(p^n f)}[1/p], (T_pE)^{⊗(−r)}(1))`, then in `H¹(K' ⊗ Q_p, (T_pE)^{⊗(−r)}(1))`, then under the dual exponential to `coLie(E)^{⊗ r} ⊗ Q_p`, is `p^{−mr} (r − 1)!⁻¹ ((d/ω)^r log θ_m)(ξ_m) ⊗ ω^{⊗ r} = p^{−mr} (r − 1)!⁻¹ ((d/ω)^r log {}_aθ_E)(α_m) ⊗ ω^{⊗ r}`, the two evaluations agreeing because translation by `ν_m` commutes with the invariant derivation `d/ω` (Kato 2004, proof of Proposition 15.9, pp.258–259, KATO04 lines 5478–5527, applying the height `h = 1` case of Kato's generalised explicit reciprocity law to the `𝔭`-divisible groups `G(v, 𝔭)` of the Néron model of `E`, one for each place `v | p` of `K'` and prime `𝔭 | p` of `O_K`). Kato's printed definition translates by `+ν_n`; with `ν_n = ξ_n − α_n` that gives `θ_n(ξ_n) = {}_aθ_E(2ξ_n − α_n)`, so the translation is by `−ν_n`. For `n ≥ m`, the pair `(E, α_n)` is the canonical pair of modulus `p^n f_0` (over `ℂ`, multiplication by `p^{n−m}` carries `(ℂ/g, p^{m−n})` to `(ℂ/p^n f_0, 1)`), so `θ_n(ξ_n) = (_az_{p^n f_0})⁻¹`: the input is the system of theta values, the inverse of the standard-unit system of §2.2. Since `ξ^{⊗(−r)} = p^{−mr} β^{⊗(−r)}`, the image of `β^{⊗(−r)} ⊗ (θ_n(ξ_n))_n` is `(r − 1)!⁻¹ ((d/ω)^r log {}_aθ_E)(α_m) ⊗ ω^{⊗ r}`: the factor `p^{−mr}` belongs to the basis `ξ` and cancels only in this conversion to `β`. The curve `E` has good reduction at every finite place of `K'`: by `g ⊂ f`, for every prime `ℓ` the action of `Gal(K^{ab}/K')` on `T_ℓE` is unramified at the finite places of `K'` not above `ℓ` (Kato 2004, p.258), and Néron–Ogg–Shafarevich applies at each place with `ℓ` prime to its residue characteristic. Each `G(v, 𝔭)` is a `p`-divisible group over `O_v` with an `O_𝔭`-action whose Tate module is free of rank one over `O_𝔭` (relative height one), since `T_pE = ⊕_𝔭 T_p G(v, 𝔭)` is free of rank one over `O_K ⊗ Z_p = ∏_𝔭 O_𝔭`; it is not formal in general (Kato 2004, pp.258–259, KATO04 lines 5495–5503, applies the law to `p`-divisible groups). Which components are connected is read off from the tangent space: `O_K` acts on `Lie(E ⊗ O_v)` through `O_K → O_v`, so on the formal group of `E` at `v` every `x ∈ O_K` outside the prime `𝔭_v` below `v` acts with a unit tangent scalar, hence invertibly. If `p` is inert or ramified, `𝔭` is the only prime above `p` and `G(v, 𝔭) = E[p^∞]`; the Tate module of its connected part is an `O_𝔭`-submodule of the free rank-one `O_𝔭`-module `T_pE`, so it has `Z_p`-rank `0` or `2`, and it is nonzero because `dim E[p^∞] = dim E = 1`; hence `E[p^∞]` is connected of dimension one, a formal `O_𝔭`-module of `O_𝔭`-height one (relative Lubin–Tate), and the reduction is supersingular. If `p = 𝔭𝔭̄` splits and `v` lies above `𝔭`, take `x` a generator of `𝔭̄^{h_K}`, so `x ∈ 𝔭̄ ∖ 𝔭`: each finite level of the connected part of `G(v, 𝔭̄)` is killed by a power of `x`, while `x` acts injectively on the formal group, so that connected part is zero and `G(v, 𝔭̄)` is étale of dimension zero; then the connected part of `G(v, 𝔭)` has dimension `dim E[p^∞] − 0 = 1`, so it is nonzero, and `G(v, 𝔭)`, of height one, is connected of dimension one: the reduction at `v` is ordinary. The law is applied to every component. On an étale component `G(v, 𝔭̄)` both sides vanish: the right side lies in `coLie(G(v, 𝔭̄))^{⊗ r} ⊗ Q_p = 0`, and on the left the Galois action on `T_p G(v, 𝔭̄)` is unramified, so `V = T_p G(v, 𝔭̄)^{⊗(−r)}(1) ⊗ Q_p` has `Fil⁰ D_dR(V) = 0` and the dual exponential is zero. The formula is therefore carried by the connected components, and Lubin–Tate theory is applied to those only. *Needs:* §§2.1–2.4; NeronModelsAndSemistableAbelianVarieties §5.1 Néron–Ogg–Shafarevich; PadicHodgeRegulators §§1.4, 1.7, 1.11; SelmerIwasawaCohomology §0.11; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.8 The Tate module of a `p`-divisible group over a mixed-characteristic base, §R07.1.9 The connected–étale sequence of a `p`-divisible group over a henselian local base, §§R07.1.12–R07.1.14 (formal Lie groups, connected `p`-divisible groups as formal Lie groups, dimension); ComplexMultiplicationAndExplicitReciprocity §4.1 One-dimensional CM components of the Tate module; LubinTateFormalModulesAndQuasiCanonicalLifts §2.1 Finite-height torsion, §2.2 The π-adic Tate module (on the connected components).

**Checks.**

- Torsion data, `K = Q(i)`, `p = 7`, `m = 1`, `f_0 = (8)`, `g = (56)`, `E = ℂ/56Z[i]`, `a = (5)`: `T_7E = g ⊗ Z_7 = 7(Z[i] ⊗ Z_7)`, so `β = 1` is not in it while `7β` is a basis. At level one, `α_1 = 1 mod 56`; `ξ_1 = 56/7 = 8 mod 56` (the element `56` of `g` is `≡ 7` modulo `49 (Z[i] ⊗ Z_7)`); `ν_1 = 7`, killed by `8`. The translation by `−ν_1` sends `ξ_1` to `1 = α_1`; the printed `+ν_1` sends it to `15`, and translating by `+ν_1` but evaluating at `α_1` gives `8`. These are three distinct torsion points, and differences of order `4` or `8` are not in `E[5]`, so the three translates of `_aθ_E` have different divisors.
- Scalars: for `r = 1` the retained factor is `p^{−m} = 1/7`; the factorial `(r − 1)!⁻¹` is `1` for `r = 1, 2` and `1/2` for `r = 3`.
- `r = 1`: the right side is `p^{−m}(d log θ_m/ω)(ξ_m)·ω = p^{−m}(d log {}_aθ_E/ω)(α_m)·ω`, the logarithmic derivative of the theta function at the torsion point.
- For an inert `p`, there is one prime `𝔭 = pO_K` and the formal group of `E` at `v` has height two over `Z_p` and height one over `O_𝔭`; the law is applied over `O_𝔭`.
- Split `p`, where one component is étale: `K = Q(i)`, `p = 5 = (2 − i)(2 + i)`, `f = (8)`, `m = 1`, `g = (40)`. The canonical curve over `K(40)` has `j = 1728` and good reduction at every place `v | 5`; its reduction is geometrically that of `y² = x³ − x`, which has `#E(F_5) = 8` and trace `5 + 1 − 8 = −2 ≢ 0 mod 5`, so it is ordinary. At the place `v` above `(2 − i)`, where `i ≡ 2`, the element `2 + i` acts on the tangent space by `4`, a unit, so the order-five kernel `E[2 + i]` is étale, with five geometric points in the special fibre, while `2 − i` acts by `0` and `E[2 − i]` is connected, with one. Hence `G(v, (2 + i))` is étale of dimension `0` and `G(v, (2 − i))` connected of dimension `1`, both of height one over `O_𝔭 = Z_5`; at a place above `(2 + i)` the roles exchange. Treating both components as formal would give the formal group of `E` at `v` height two, the supersingular case, which the trace `−2` excludes; on the étale component both sides of the law are `0`, since `coLie(G(v, (2 + i))) = 0`.
- Changing `ω` to `uω`, `u ∈ K'×`, multiplies `(d/ω)^r log θ_m` by `u^{−r}` and `ω^{⊗ r}` by `u^r`; the right side is independent of `ω`, as the left side is.

### 2.6 Kato's reciprocity law for elliptic units

Prove: let `p` be a prime, `r ≥ 1`, `ψ` of type `(−r, 0)`, `f` a nonzero ideal contained in the conductor of `ψ`, `K'` a finite extension of `K` inside `K(p^∞f)` and `γ ∈ V_L(ψ)`. The image of the theta-value zeta element `z^θ_{p^∞f}` of §2.3 under `H¹_{p^∞f}(Z_p(1)) → H¹(O_{K'}[1/p], V_{L_λ}(ψ)(1))` (cup product with `γ`), the semilocal dual exponential and the de Rham isomorphism of §2.4 lies in `S(ψ) ⊗_K K'`, and for every character `χ : Gal(K'/K) → ℂ×`, `Σ_{σ ∈ Gal(K'/K)} χ(σ) per_ψ(σ(·)) = (−1)^{r−1} L_{pf}(ψ̄, χ, r) · γ`, with `L_{pf}(ψ̄, χ, s) = Σ_a ψ̄(a)χ(a)N(a)^{−s}` over ideals prime to `pf`. Equivalently, Kato's element `z_{p^∞f} = −z^θ_{p^∞f}`, built from the standard units, satisfies the identity with the sign `(−1)^r`. For `r = 1`, the case used in this roadmap, the theta-value element gives `+L_{pf}(ψ̄, χ, 1) · γ` (Kato 2004, Proposition 15.9 and its proof, pp.258–260). Kato states the identity with the sign `+` for `z_{p^∞f}`; his proof applies the height-one law to the theta values (§2.5), which are the inverses of his standard units (§2.2), and his evaluation (15.9.1) of the period of `(r − 1)!⁻¹ (d/ω)^r log {}_aθ_E` carries no factor `(−1)^{r−1}`, which the `(r − 1)`-fold derivative produces in the normalisation `per_ψ(ω^{⊗ r}) = (∫_β ω)^r β^{⊗(−r)}` of §2.4; both signs are carried here. Proof route: by traces reduce to `K' = K(g)` as in §2.5 and, by `K`-linearity, to `γ = β^{⊗(−r)}`. By §2.5, the image of `β^{⊗(−r)} ⊗ (θ_n(ξ_n))_n` is `_aw = (r − 1)!⁻¹ ((d/ω)^r log {}_aθ_E)(α) ⊗ ω^{⊗ r}`. With `ω` the differential `dz` of `ℂ/g` and `E_r(z) = Σ_{w ∈ g} (z + w)^{−r} |z + w|^{−s} |_{s=0}` the Eisenstein–Kronecker series, `(d/ω) log {}_aθ_E = N(a) E_1(z) − Σ_{P ∈ E[a]} E_1(z − P)`, the additive constant being `0` by the norm invariance of §2.1 and the sign fixed by the residue `N(a) − 1` of `dlog {}_aθ_E` at the origin; differentiating, `(r − 1)!⁻¹ (d/ω)^r log {}_aθ_E = (−1)^{r−1} (N(a) E_r(z) − Σ_{P ∈ E[a]} E_r(z − P))`. With `per_ψ(ω^{⊗ r}) = β^{⊗(−r)}` (§2.4) and the reindexing of the lattice sums by ideals in ray classes (Kato 2004, proof of (15.9.1), p.260), `Σ_σ χ(σ) per_ψ(σ(_aw)) = (−1)^{r−1} (N(a) − ψ(a)χ(a)⁻¹) L_{pf}(ψ̄, χ, r) β^{⊗(−r)}`, and dividing by the smoothing factor `N(a) − ψ(a)σ_a` as in (15.9.2) gives the identity for `z^θ_{p^∞f}`. *Needs:* §§2.1, 2.3–2.5; PadicHodgeRegulators §§1.4, 1.11.

API:

- Algebraicity: `Ω⁻¹ L_{pf}(φ̄χ, 1)` for `χ` of finite order factoring through `K(p^∞f)` is algebraic and lies in the field generated by `L`, `K'` and the coefficients of the chosen model.
- Smoothed form: the smoothing factor becomes `N(a) − ψ(a)σ_a` after the twist by `V(ψ)`.
- Trace compatibility in `K'`.
- Sign: the theta-value and standard-unit elements give opposite signs, and the derivative contributes `(−1)^{r−1}`; at `r = 1` the theta-value element gives `+L`.

**Checks.**

- `χ = 1`, `r = 1`: the deleted value `L_{pf}(φ̄, 1)` contains the `p`-factor `1 − φ̄((p))/p² = 1 + 1/p`, nonzero and of valuation `−1`.
- Orientation of `χ`: replacing `χ` by `χ⁻¹` replaces the weights `χ(σ)` by `χ(σ)⁻¹` (for `χ(σ) = ζ_25` these are `ζ_25` and `ζ_25⁻¹`, unequal since `ζ_25² ≠ 1`) and the right side by `L_{pf}(ψ̄, χ⁻¹, r)`. The two values need not differ: for `K = Q(√−7)`, `p = 5`, `ψ = φ` canonical and `χ` of order `25` (`c = 3`), `L(φ̄χ, 1) = L(φχ⁻¹, 1)` and `L(φ̄χ⁻¹, 1) = L(φχ, 1)` both vanish (§1.4). The convention is tested on the weights.
- The smoothing factor for `a = (α)` with `α ≡ 1 mod f`: `N(a) − ψ(a) = α ᾱ − α^r`, which for `r = 1` is `α(ᾱ − 1)`.
- Sign at the origin, `a = (5)` in `Z[i]`: `dlog {}_aθ_E` has leading term `24 dz/z` (order of vanishing `N(a) − 1 = 24`), matching `N(a)E_1 − Σ_{P ∈ E[a]} E_1(· − P) ∼ 25/z − 1/z`; at `r = 2`, `(d/ω)^2 log {}_aθ_E ∼ −24/z²` against `N(a)E_2 − Σ E_2(· − P) ∼ +24/z²`, the factor `(−1)^{r−1} = −1`. A model with the opposite overall sign would give `−24 dz/z`, the logarithmic derivative of a function with a pole of order `24` at the origin; the divisor `N(a)(0) − E[a]` excludes it.
- Units against theta values, `K = Q(i)`, `f = (3)`, `a = (5)`: Kronecker's formula gives `−12 log 3` for the standard units and `+12 log 3` for the theta values (§2.2); the two zeta elements differ by the sign `−1`, so at most one of them can satisfy the identity with the sign `+`.

### 2.7 The integral normalised class

Construct, for the period datum `(E, ω, Ω)` and `γ = per_φ(ω)/Ω`, the norm-compatible family `z_a ∈ H¹(K(a), T_φ^∨(1))` for admissible moduli `a` divisible by `f` and supported on `f`, `p` and the auxiliary `l`, whose rationalisation is the class `z^θ_a(γ)` of §2.6, the image of the theta-value zeta element (the negative of the class built from Kato's standard units); the transition maps are corestriction, with the arithmetic-Frobenius Euler factors at newly introduced primes retained (BKO, §3.0.2, pp.951–952). Integrality is a theorem here, not a consequence of §2.6, which is a statement after inverting `p`. Proof route for the component used later (the `ν`-evaluation, the augmentation over `Gal(H/K)` and the `Δ`-invariant projection): under the twist the smoothing factor is `N(a) − φ(a)σ_a` (Kato 2004, (15.9.2), p.259); take `a = (α)` with `α ≡ 1 mod 6 f l^{m+1}` and `α ≡ 2 mod p`; on that component `σ_a` acts through `ν(a) = 1` and a pro-`p` element, so the factor is congruent to `N(a) − φ(a) = α(ᾱ − 1)`, a `p`-adic unit, hence invertible in the local Iwasawa algebra, and Kato's (15.6.3) gives integrality of the projected element. The full lattice statement needs the Betti lattice: `γ` generates `T_φ^∨` integrally, including the prime-to-`p` comparison between the curve over `H` and the canonical CM pair over `K(f)`. *Needs:* §§0.4, 2.3, 2.4, 2.6; SelmerIwasawaCohomology §§0.9, 0.11.

API:

- Rationalisation: `z_a ⊗ Q = z^θ_a(γ)`; with this sign the reciprocity law of §2.8 holds with `+Ω⁻¹L`, as §2.6 gives `+L` for the theta-value element at `r = 1`.
- Corestriction: at fixed prime support, `cor(z_{ap}) = z_a`.
- A new good prime `q` introduces the Euler operator of arithmetic Frobenius at `q`.
- Flat coefficient extension `R → R'` carries `z_a` to the class of the same normalisation.
- For `ε ∈ O_K×`, replacing `Ω` by `εΩ` multiplies `γ` and `z_a` by `ε⁻¹`.

**Checks.**

- `α = 2` modulo `p` with `ᾱ ≡ 2`: `α(ᾱ − 1) ≡ 2` is a unit; a choice `α ≡ 1 mod p` gives `ᾱ − 1 ≡ 0` and a nonunit factor.
- Two successive `p`-levels after `p` divides the modulus: corestriction gives the previous class with no extra Euler factor.
- Changing `Ω` to `−Ω` negates `γ` and the class; changing `ω` and `Ω` together by `2` fixes both.

### 2.8 Direct-character reciprocity at an inert prime

Prove: for the integral class at level `K(gp^n)`, `g` divisible by `f`, and a character `χ` of finite order of `Gal(K(gp^n)/K)`, `Σ_σ χ(σ) exp*_p(loc_p(z^σ)) = Ω⁻¹ L_{pg}(φ̄χ, 1) · ω` in the common coefficient-tensor-de Rham line, the sum taken over the semilocal places with the trace of the native localisation (BKO, (3.4), p.952; Kato 2004, Proposition 15.9 and (15.9.1)–(15.9.2), pp.258–260). `L_{pg}` deletes the primes dividing `pg`; for `g = f` it is `L_{pf}`, and for auxiliary `ν` take `g = f l^m` with the actual conductor exponent `m`. Only `φ` is conjugated. Equality of integral classes is not inferred from this rational identity. *Needs:* §§2.4, 2.6, 2.7; PadicHodgeRegulators §§1.4, 1.11; AL.5.1.1 Finite Euler corrections at critical points.

**Checks.**

- `χ = 1`: the inert `p`-factor `1 + 1/p` is retained.
- Inverse characters: replacing `χ` by `χ⁻¹` replaces the weights `χ(σ)` by `χ(σ)⁻¹` (`ζ_25` against `ζ_25⁻¹` for `χ(σ) = ζ_25`) and the right side by `Ω⁻¹L_{pg}(φ̄χ⁻¹, 1) = Ω⁻¹L_{pg}(φχ, 1)`. The two values may coincide: when `c = 3` in the example of §1.4 both are `0`. The convention is tested on the weights, not on the values.
- `g = f l^m` with `ν ≠ 1`: the `l`-factors of `L_{pg}` are `1` (§5.3), so `L_{pg}(φ̄ν, 1) = L_{pf}(φ̄ν, 1)`.

### 2.9 Twisting the norm-compatible Kummer tower

Prove: over `F_∞ = K(fp^∞)`, on which the action on `T_φ` factors, the Kummer identification gives an `R`-linear isomorphism `(lim_cor H¹(F_n, Z_p(1))) ⊗ T_φ^∨ ≅ lim_cor H¹(F_n, T_φ^∨(1))`, equivariant for the diagonal action of `Gal(F_∞/K)` (the coefficient factor transforms by `φ⁻¹`), compatible with localisation and corestriction, with the `p`-completed `S`-unit groups and the finite-`S` Kummer correction retained (BKO, (3.5), p.952). Proof route: work modulo `p^k` on cofinal levels where `T_φ/p^k` is trivial, apply the character twist of SelmerIwasawaCohomology §3.7 and pass to limits; finite freeness makes tensoring commute with the limits. *Needs:* §§2.4, 2.7; SelmerIwasawaCohomology §§0.8–0.11; the character twist of SelmerIwasawaCohomology §3.7 (gap:sic-character-twist).

**Checks.**

- Changing the basis of `T_φ` multiplies both sides by the same unit.
- Without triviality of the action on `F_∞`, the untwisted Kummer map gives no such identification.
- The comparison commutes with corestriction, so it may be applied before any semilocal projection.

### 2.10 Period changes

Prove: for fixed `ω`, replacing `Ω` by `uΩ` and `γ` by `u⁻¹γ`, `u` an allowed lattice unit, multiplies `z_a` and both sides of §2.8 by `u⁻¹`; replacing `ω` by `vω` and `Ω` by `vΩ`, with `v ∈ H×` a unit at the place above `p`, leaves `γ` and `z_a` unchanged, multiplies the normalised scalar by `v⁻¹`, and leaves its product with the generator `vω` unchanged (BKO, §3.0.2, p.951, and (3.4), p.952). The `p`-unit property of the normalised value is independent of the allowed choices. *Needs:* §§0.4, 2.7, 2.8.

**Checks.**

- `v = 2`: the class is fixed and the scalar halves.
- `u = −1`: class and scalar both change sign.
- `v = p` is not allowed: `pω` is not a Néron differential.

### Examples

For `K = Q(√−7)`, `p = 5`, `f` the canonical conductor, `a = (α)` with `α ≡ 1 mod 6f·23²` and `α ≡ 2 mod 5`: the twisted smoothing factor is congruent to `2(2 − 1) = 2`, a `5`-adic unit. For `χ = 1` the deleted factor at `5` is `6/5`.

### Dependencies

Layers 0–1; PadicFamilies §4.0.1; NeronModelsAndSemistableAbelianVarieties §5.1; EllipticCurves Layer 1; ComplexMultiplicationAndExplicitReciprocity §§1.2, 2.2, 3.2, 4.1; ClassFieldTheory Layer 13; SelmerIwasawaCohomology §§0.8–0.11, 3.6, 3.7 and its character twist; PadicHodgeRegulators §§1.4, 1.7, 1.11; FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.9, R07.1.12–R07.1.14; LubinTateFormalModulesAndQuasiCanonicalLifts §§2.1–2.2; AL.5.

## Layer 3: Torsion towers and the CM Lubin–Tate comparison

### 3.1 The torsion and ring-class compositum

Construct, for `n ≥ 0`, `r ≥ 0`, the fields `F_n = H(E[p^{n+1}])` and `M_{n,r} = F_n L[r]` inside `Q̄`, the corestriction maps between their continuous Kummer cohomologies induced by the field inclusions, and `Φ_n`, the completion of `F_n` at the place fixed by `ι_p`. For `ν` of exact order `l^r`, `r ≥ 1`, prove `M_{n,r} ⊂ K(f l^{r+1} p^{n+1})`; for `ν = 1`, `M_{n,0} = F_n` (BKO, p.952 and the corestriction arrows on pp.952–953). *Needs:* §0.6; ComplexMultiplicationAndExplicitReciprocity §4.1 The algebraic Hecke character of a CM abelian variety, §3.2 Exact ray-level field and generation criterion; ClassFieldTheory Layer 13; SelmerIwasawaCohomology §0.11; LubinTateFormalModulesAndQuasiCanonicalLifts §2.3 Lubin–Tate division fields.

API:

- The `n` and `r` inclusions commute and induce transitive corestrictions.
- `Φ_n` is the Lubin–Tate `π^{n+1}`-division field after §3.5.
- `L[0] = K`, `M_{n,0} = F_n`.
- Localisation commutes with corestriction through the sum over places above the chosen prime.

**Checks.**

- `n = 0`: `[Φ_0 : Φ] = p² − 1`, so `Φ_0 ≠ Φ`.
- An order-`l` character uses `L[1]` and ray modulus `l²`.
- `l | (p + 1)` is allowed: no coprimality of degrees is assumed.

### 3.2 Ramification proves linear disjointness

Prove: `F_n` and `L[r]` are linearly disjoint over `K`, so `F_n ⊗_K L[r] → M_{n,r}` is an isomorphism, including when `l | p² − 1`. Proof route: the intersection is abelian of `l`-power degree, unramified above `l` (good reduction of `E` there) and unramified away from `l` (`L[r]/K` is ramified only above `l`); with no real places it lies in the Hilbert class field and is trivial since `l ∤ h_K` (BKO, p.953). *Needs:* §3.1; ClassFieldTheory Layer 13; LocalFieldsRamification Layers 2–3; ComplexMultiplicationAndExplicitReciprocity §4.1 One-dimensional CM components of the Tate module; Mathlib `Subalgebra.linearDisjoint_iff_injective`.

**Checks.**

- `K = Q(√−7)`, `p = 5`, `l = 3` would divide `p² − 1 = 24`; the argument still applies when `l ∤ h_K = 1` (the BKO hypotheses exclude `l = 3` for other reasons).
- If `l | h_K`, the Hilbert class field contains a cyclic `l`-extension that may lie in both fields; the hypothesis is used.
- The disjointness is of Galois extensions of `K`; a coprime-degree argument would fail for `l | (p² − 1)p^{2n}`.

### 3.3 Splitting and the semilocal character factors

Prove: `pO_K` splits completely in `H` and in every ring class field of conductor prime to `p`, including `L[r]`. After compatible choices of places, `F_n ⊗_K Φ ≅ ∏_{Gal(H/K)} Φ_n` and `M_{n,r} ⊗_K Φ ≅ ∏_{Gal(H/K) × Gal(L[r]/K)} Φ_n`; finite-level Kummer cohomology acquires the corresponding regular group-algebra factors, evaluation of the second factor sends `[g]` to `ν(g)`, and forgetting the `H`-factor is its augmentation; these identifications commute with the transition maps (BKO, pp.952–953). Proof route: `p` lies in every order of conductor prime to `p` and generates a principal proper ideal, whose Artin class is trivial; combine with §3.2 and the local torsion ramification. *Needs:* §§3.1–3.2; Tau Ceti `TauCeti.ClassFieldTheory.ncard_primesOver_ringClassField_eq_finrank_iff`; ClassFieldTheory Layer 13; LocalFieldsRamification Layer 2; SelmerIwasawaCohomology §§0.11, 3.6; LubinTateFormalModulesAndQuasiCanonicalLifts §2.3 Lubin–Tate division fields; Mathlib `MonoidAlgebra.lift_single`.

**Checks.**

- For nonreal `ν` the coefficient of `[g]` is `ν(g)`, not `ν(g)⁻¹`.
- Augmentation over `Gal(H/K)` differs from keeping one place without its conjugates: for `h_K = 2` the augmentation of `(x, y)` is `x + y`, the single place gives `x`.
- A ring class field of conductor divisible by `p` need not split `p`.

### 3.4 The inert Frobenius is multiplication by −p

Prove: for `φ` as in §0.1 and `p ∤ f` inert, `φ((p)) = −p`; at a place of `H` above `p` the residue field is `F_{p²}`, and the arithmetic Frobenius of the reduction of `E` is the endomorphism `[−p]`; its characteristic polynomial is `(X + p)²` and `a_{p²} = −2p` (Rubin 1987, Lemma 3.1 and its proof, p.409, RUBIN87 line 191; Jia, Property 1, pp.3–4). Proof route: `κ_K(p) = −1` and §0.1; `p` splits in `H/K`; identify Frobenius through the CM Hecke realisation and conclude equality of endomorphisms by faithfulness of the Tate realisation. *Needs:* §0.1; ComplexMultiplicationAndExplicitReciprocity §4.1 Frobenius and infinity-type identities, §4.2 Full elliptic CM L-factorization, including bad primes; §3.3; EllipticCurves Layers 2–3.

**Checks.**

- The sign is negative though the residue field has `p²` elements: `y² = x³ − x` at `7` has Frobenius `−7` over `Q(i)`, local factor `(1 + 7T)²`.
- Equal traces do not give equal endomorphisms; faithfulness of the Tate realisation is used.
- At a split rational prime no height-two conclusion is asserted.

### 3.5 Apply the Honda comparison at π = −p

Prove: the formal completion of the good model of `E` at the place above `p`, with the differential `ω`, is a height-two formal group over `O_Φ` and is strictly isomorphic over `O_Φ`, with the CM tangent embedding, to the Lubin–Tate `O_Φ`-module for `π = −p`; the isomorphism matches invariant differentials and compatible Tate bases; the completion of `H(E[p^{n+1}])` is the `π^{n+1}`-division field `Φ_n`, totally ramified of degree `(p² − 1)p^{2n}`; and `μ_{p^{n+1}} ⊂ Φ_n` by the Weil pairing on `E[p^{n+1}]` (BKO, §2, p.947 and §3.0.2, p.953; Rubin 1987, §3, pp.409–410). Compatible points with `[p]P_{n+1} = P_n` are converted to the `[−p]` convention by the sign `(−1)^n`. *Needs:* §§3.1, 3.4; LubinTateFormalModulesAndQuasiCanonicalLifts §4.4 The supersingular elliptic comparison, §4.3 The unramified Honda–Lubin–Tate comparison, §2.2 The π-adic Tate module, §2.3 Lubin–Tate division fields, §2.4 The Lubin–Tate character; EllipticCurves Layer 2.

**Checks.**

- The parameter is `−p`: `a_{p²} = −2p` corresponds to `s = −1` in LubinTateFormalModulesAndQuasiCanonicalLifts §4.4; `s = +1` would require `a_{p²} = 2p`.
- `n = 0`: degree `p² − 1`; for `p = 5`, `24`.
- The Weil pairing puts `μ_{p^{n+1}}` in `Φ_n`; `[Φ_n : Φ]` is divisible by `[Φ(μ_{p^{n+1}}) : Φ] = (p − 1)p^n`, consistent with `(p² − 1)p^{2n}`.

### Examples

For `p = 5`: `Φ_0/Φ` has degree `24`, `Φ_1/Φ` degree `600`; the inert Frobenius is `[−5]` with polynomial `(X + 5)²`.

### Dependencies

Layers 0 and 2 (the class field `K(f)` and torsion fields); ComplexMultiplicationAndExplicitReciprocity §§3.2, 4.1, 4.2; ClassFieldTheory Layer 13; LocalFieldsRamification Layers 2–3; EllipticCurves Layers 2–3; SelmerIwasawaCohomology §§0.11, 3.6; LubinTateFormalModulesAndQuasiCanonicalLifts §§2.2–2.4, 4.3–4.4.

## Layer 4: Finis's divisibility theorem in weight one

Throughout this layer, following Finis, the *tower prime* is a prime split in `K` and the *valuation prime* `ℓ` is an odd prime different from it. In the application of Layer 5 the tower prime is the auxiliary `l` and the valuation prime is the inert `p`.

### 4.1 Finis's local invariants

Define, for a Hecke character `λ` of `K` with Finis type `(k, j)` (`λ_∞(x) = x^{−k}x̄^{−j}`) and dual `λ*(x) = λ(x̄)⁻¹|x|_{A_K}`: `λ` is anticyclotomic in Finis's sense when `λ = λ*` (then `k + j = −1` and `λ|_{A_Q×} = ω_{K/Q}|·|`); the local Gauss sum `G(d_q, λ_q)` with respect to `e_K = e_Q ∘ Tr`; the local root numbers `W_q(λ) = N(q)^{−e(q)}G(−δ, λ_q)` at nonsplit `q` and `W_ℓ(λ)` at the valuation prime; the set `W` of sign systems `(w_q)` over nonsplit primes with almost all `w_q = 1` and `∏ w_q = 1`, and `w(λ) ∈ W` for `W(λ) = +1`; for an inert `q` and a character `χ_q` of `K_q×`, `μ_ℓ(χ_q) = 0` if `χ_q` is unramified and `min_{x ∈ O_{K_q}×} v_ℓ(χ_q(x) − 1)` otherwise; and `b_ℓ(χ_ℓ, w) ∈ Q` for `ℓ` inert or ramified, by Finis's equation (14), with `b_ℓ(χ_ℓ, w) = 0` for `ℓ` split (Finis, §1, pp.768–769, FINIS06 lines 61–99; §3, Proposition 3.4, p.786, and equation (14) with the vanishing of `b_ℓ`, p.788, FINIS06 lines 893–917). Through the isomorphism `Q_{>0}/N(K×) ≅ W`, `r ↦ (ω_{K/Q,q}(r))_q`, `b_ℓ(χ_ℓ, w)` is equally indexed by positive rationals `r` with `W_ℓ(χ_ℓ) = ω_{K/Q,ℓ}(r)` (Finis, p.788, FINIS06 lines 889–893). Prove `W_q(λ) = ±1` for nonsplit `q`, `W_q(λ) = (−1)^{v_q(f_λ)}` for inert `q`, and `W(λ) = ∏_q W_q(λ)` for type `(−k, k − 1)`, `k ≥ 1` (Finis, p.769; proof of Corollary 2.3, p.778). Prove `b_ℓ(χ_ℓ, w) = 0` when `χ_ℓ` is unramified (`ℓ` inert) or of minimal conductor (`ℓ` ramified) (Finis, p.769 and Proposition 3.4, p.786). *Needs:* AL.1.3.4 The local Gauss sum, AL.1.3.5 Explicit local ε-factors; Tau Ceti `HeckeCharacter`.

API:

- `μ_ℓ` depends only on the restriction to local units, and `μ_ℓ(χ_q) = 0` when that restriction is trivial.
- `μ_ℓ(χ_q χ'_q) = μ_ℓ(χ_q)` when `χ'_q` is unramified.
- `η ↦ η̄/N`, with `η̄ = η ∘ c` and `N` the norm character, carries `η = φρ`, `φ` equivariant of ideal type `(1,0)` and `ρ` anticyclotomic of finite order, to the Finis-anticyclotomic character `φ̄ρ̄/N = φ̄ρ⁻¹/N` of Finis type `(−1, 0)`: its archimedean component is `z̄⁻¹ · z z̄ = z` (§5.1, with `ν = ρ⁻¹`). Without the conjugation, `φρ/N` has archimedean component `z⁻¹ · z z̄ = z̄`, Finis type `(0, −1)`.

**Checks.**

- `χ_q` of conductor `q` with values `ζ_ℓ` on units: `μ_ℓ = v_ℓ(ζ_ℓ − 1) = 1/(ℓ − 1)` in the normalisation `v_ℓ(ℓ) = 1`; for values of order prime to `ℓ`, `μ_ℓ = 0`.
- Type `(−1, 0)` gives `k + j = −1`; type `(1, 0)` gives `k + j = 1` and is not Finis-anticyclotomic.
- Conjugation in the norm twist, evaluated at `z = i`: the archimedean component of `φ̄/N` is `z̄⁻¹ · z z̄ = z`, value `i`, Finis type `(−1, 0)`; that of `φ/N` is `z⁻¹ · z z̄ = z̄`, value `−i`, Finis type `(0, −1)`, outside the family `(−k, k − 1)`, `k ≥ 1`, of Finis's theorem.
- For inert `q` with `v_q(f_λ) = 1`, `W_q = −1`; with `v_q(f_λ) = 0`, `W_q = 1`.

### 4.2 Primitive theta functions, Shintani operators and Yang's formula

Theta functions here are scalar valued (Finis's case `ν = 0`), the case of Finis type `(−1, 0)` that weight one needs (Finis, §3, p.781, FINIS06 lines 630–633). Let `δ ∈ O_K` be the square root of `−D` with `ι_∞(δ)` in the upper half-plane (Finis, §1, p.768), and for a lattice `b ⊂ K` and a positive rational `r` with `rN(b) ∈ Z` put `ψ(l) = (−1)^{rD l l̄}` for `l ∈ b`, an integer power since `l l̄ ∈ N(b)Z`.

Define, for a positive rational `r` and a fractional ideal `a` with `rN(a) ∈ Z`, the theta space `T_{r,a}` of entire functions `ϑ : ℂ → ℂ` with `ϑ(w + l) = ψ(l) e^{−2πi r δ l̄ (w + l/2)} ϑ(w)` for every `l ∈ a`; the operators `(A_l ϑ)(w) = e^{2πi r δ l̄ (w + l/2)} ϑ(w + l)` for `l ∈ ℂ`; and the scalar product `⟨ϑ_1, ϑ_2⟩ = (2/(√D N(a))) ∫_{ℂ/a} conj((A_u ϑ_1)(0)) (A_u ϑ_2)(0) du`, antilinear in the first variable (Finis, §2, (3)–(5), pp.771–772, FINIS06 lines 187–219).

API:

- `dim T_{r,a} = rDN(a)`.
- For `l ∈ a* = (rN(a)D)⁻¹ a` the operator `A_l` preserves `T_{r,a}` and is unitary; it acts by the scalar `ψ(l)` for `l ∈ a`; `A_{l_1} A_{l_2} = e^{πi r Tr(δ l_1 l̄_2)} A_{l_1 + l_2}`; the resulting representation of the Heisenberg group `G_{r,a}`, an extension of `a*/a` by `ℂ×`, is irreducible.
- For `b ⊇ a` with `rN(b) ∈ Z`, `T_{r,b} ⊆ T_{r,a}`, and the inclusion `i` is an isometry for the scalar products of the two spaces: for `ϑ ∈ T_{r,b}` the integrand `|(A_u ϑ)(0)|²` is `b`-periodic, so its integral over `ℂ/a` is `[b : a]` times its integral over `ℂ/b`, while `N(a) = [b : a] N(b)`. For `l ∈ b`, a subset of `a*` because `b = ac⁻¹` with `c` integral and `N(c) | rN(a)`, so that `rN(a)D ∈ c`, the operators `ψ(l) A_l` give a unitary action of the finite group `b/a` on `T_{r,a}` whose invariants are exactly `T_{r,b}`. The trace `t_b = Σ_{l ∈ b/a} ψ(l) A_l : T_{r,a} → T_{r,b}` therefore satisfies `t_b ∘ i = [b : a] · id`, the operator `[b : a]⁻¹ t_b` is the orthogonal projection onto `T_{r,b}`, and the adjoint of the inclusion is `i* = [b : a]⁻¹ t_b`, not `t_b`. In particular `t_b` is onto and `ker t_b` is the orthogonal complement of `T_{r,b}`. The Shintani operators below use the trace `t_b` itself, without the factor `[b : a]⁻¹`; Finis calls this trace the adjoint (Finis, §2, p.772, FINIS06 lines 238–240), which holds only up to that factor.

**Checks.**

- Dimensions for `K = Q(√−7)`: `T_{1,O_K}` has dimension `7`, `T_{25,O_K}` dimension `175`, `T_{25,(5)⁻¹}` dimension `25 · 7 / 25 = 7`.
- The trace is not the adjoint of the inclusion. For `K = Q(√−7)`, `r = 25`, `a = O_K`, `b = (5)⁻¹O_K` (so `rN(b) = 1` and `[b : a] = 25`) and `h ∈ T_{25,b}` with `⟨h, h⟩_b = 1`: both `⟨h, h⟩_b` and `⟨ih, ih⟩_a` equal `(50/√7) ∫_{ℂ/b} |(A_u h)(0)|² du`, so `⟨ih, ih⟩_a = 1`; every summand `ψ(l) A_l` fixes `h`, so `t_b(ih) = 25h` and `⟨h, t_b(ih)⟩_b = 25 ≠ 1`. The adjoint `i* = t_b/25` gives `⟨h, i*(ih)⟩_b = 1 = ⟨ih, ih⟩_a`. The factor changes no kernel: `ker t_b = ker i*`, so the primitive space below keeps dimension `175 − 7 = 168`.
- Orientation of `δ`: with `ι_∞(δ) = i√D` the automorphy factor is `e^{πH(l, w + l/2)}` for the hermitian form `H(x, y) = 2r√D x̄ y`, positive definite; the area of `ℂ/a` is `N(a)√D/2`, so the degree is `2r√D · N(a)√D/2 = rDN(a)`, the dimension. With `−δ` in place of `δ` the form is negative definite and the only entire solution is `0`.
- The semi-character cannot be dropped. For `K = Q(√−7)`, `a = O_K`, `r = 1`, `l = 1` and `l′ = (1 + √−7)/2`, the factors at `l`, `l′` and `l + l′` are compatible only if `ψ(l + l′) = ψ(l) ψ(l′) e^{πi Im H(l, l′)}`, and `Im H(1, l′) = 2√7 · √7/2 = 7`, so `ψ(l + l′) = −ψ(l)ψ(l′)`. The norms of `l`, `l′`, `l + l′` are `1`, `2`, `4`, giving `ψ = −1, 1, 1`, and indeed `1 = −(−1)(1)`; the trivial semi-character would need `1 = −1`, and with it the space is `0`.

Define, for a positive integer `d`, the space `T_d` of families `(t_a)` indexed by the fractional ideals `a`, with `t_a ∈ T_{d/N(a),a}` and `t_{λa}(λw) = t_a(w)` for `λ ∈ K×`, with the scalar product `⟨ϑ, ϑ′⟩ = Σ_{a ∈ A} ⟨ϑ_a, ϑ′_a⟩` over a set `A` of representatives of the ideal classes; restriction to `A` identifies `T_d` with `⊕_{a ∈ A} T¹_{d/N(a),a}`, `T¹_{r,a}` the functions with `ϑ(εw) = ϑ(w)` for `ε ∈ O_K×`. For a class `C ∈ N(I_K)/N(K×)` (genus theory), `V_{d,C} ⊆ T_d` keeps the components at ideals `a` with `N(a) ∈ C`. Define the primitive subspace `T^{prim}_{r,a} = ⋂ ker t_b ⊆ T_{r,a}`, over the lattices `b ⊋ a` with `rN(b) ∈ Z`, and `T^{prim}_d`, `V^{prim}_{d,C}` as the families with every component primitive (Finis, §2, p.772, FINIS06 lines 220–251).

API:

- `T^{prim}_{r,a}` is the orthogonal complement of the images of the inclusions `T_{r,b} ⊆ T_{r,a}`, `b ⊋ a`, `rN(b) ∈ Z`; equivalently the intersection of the kernels of `t_{ac⁻¹}` over integral `c ≠ O_K` with `N(c) | rN(a)`.
- The value `t_a(0)` of a family depends only on the ideal class of `a`, since `t_{λa}(0) = t_a(0)`.

**Checks.**

- Primitive against full, `K = Q(√−7)` (`5` inert), `d = 25`, `a = O_K`: the only integral `c ≠ O_K` with `N(c) | 25` is `(5)`, so `T^{prim}_{25,O_K} = ker t_{(5)⁻¹}`, and `t_{(5)⁻¹}` is onto `T_{25,(5)⁻¹}`, so the primitive space has dimension `175 − 7 = 168`, not `175`. For `d = 5` no integral ideal has norm `5`, and `T^{prim}_{5,O_K} = T_{5,O_K}`, of dimension `35`.
- The compatibility `t_{λa}(λw) = t_a(w)` is what makes `T_d` finite-dimensional; for `K = Q(√−7)` (`h_K = 1`, `O_K× = {±1}`) it identifies `T_d` with the even functions in `T_{d,O_K}`, while independent components at all ideals would form an infinite product.
- Spectrum: for `d = 25` in `Q(√−7)` the full space `V_{25,C}` also carries characters of conductor `(25/t) D 𝔡⁻¹` with `t = 25 = N((5))`, prime to `5`, which the primitive subspace excludes (Proposition 2.2 below).

Define the Shintani operators. For a norm-one ideal `b`, write `b = c̄c⁻¹` with `c` integral and `c + c̄ = O_K`, and let `E(b) : T_{r,a} → T_{r,ab}` be the inclusion `T_{r,a} ⊆ T_{r,ac̄}` followed by the trace `t_{ac̄c⁻¹}`. Write a fractional ideal `c` as `c · c′` with `c ∈ Q_{>0}` and `c′` integral and divisible by no rational prime, set `γ_d(c) = N(c)⁻¹ c ω_{K/Q}(c)` for `c` prime to `dD`, extended to every `c` through its prime-to-`dD` part, and define `F*(c) = γ_{rN(a)}(c) E(cc̄⁻¹) : T_{r,a} → T_{r,acc̄⁻¹}` for `cc̄⁻¹` prime to `rN(a)`, and, for `z ∈ K×` with `z/z̄` prime to `rN(a)`, `F*(z) = γ_{rN(a)}((z)) E((z/z̄))` followed by the identification `T_{r,(z/z̄)a} ≅ T_{r,a}`, `ϑ ↦ ϑ((z/z̄) ·)`. The operators `F*(c)` on `V_{d,C}`, `cc̄⁻¹` prime to `d`, form the Shintani representation (Finis, §2, pp.773–774, FINIS06 lines 254–287).

API:

- `E(b⁻¹) E(b) = N(c)` for `b` prime to `rN(a)`; `F*` is multiplicative and preserves `V^{prim}_{d,C}`.
- `F*(z)` is multiplication by `z⁻¹` on `T_{r,a}` for `z ∈ K×`, `z ≡ 1 mod rN(a)D` (Finis, p.783, FINIS06 lines 718–719); more generally `F*(z)⁻¹ = F*_∞(z) ∏_{p | rN(a)D} F*_p(z)` for `z ∈ K× ∩ Λ_{rN(a)D}`, with `F*_∞(z) = z` on scalar theta functions and `F*_p` trivial on `1 + rN(a)D O_{K_p}` (Finis, (6), p.777, and p.788, FINIS06 lines 454–466, 894–897).
- Decomposition (Finis, Proposition 2.2 and Corollary 2.3, p.778, with `ν = 0`): a Hecke character `λ` with `λ|_{A_Q×} = ω_{K/Q}|·|` occurs in `V^{prim}_{d,C}` if and only if it has Finis type `(−1, 0)`, conductor `dD𝔡_λ⁻¹` with `𝔡_λ` a squarefree product of ramified primes, and `W_q(λ) = ω_{K/Q,q}(d/c)` at every `q | D` for a representative `c ∈ Q×` of `C`; it then occurs with multiplicity one. On `V_{d,C}` the conductor condition becomes `(d/t) D 𝔡_λ⁻¹` with `t | d` the norm of an integral ideal, and multiplicities can exceed one. A character occurs in some `V^{prim}_{d,C}` exactly when it has type `(−1, 0)` and `W(λ) = +1`, and then in exactly one.

**Checks.**

- Normalisation by `γ`, `K = Q(√−7)`, `rN(a)` odd, `c` a prime above the split prime `2`, `b = c̄c⁻¹`: `E(b⁻¹)E(b) = N(c) = 2`, while `F*(c)F*(c̄) = γ(c)γ(c̄)N(c) = (1/2)(1/2) · 2 = 1/2`, equal to `F*((2)) = γ((2)) = N((2))⁻¹ · 2 · ω_{K/Q}(2) = 1/2` and to the value `λ((2)) = ω_{K/Q}(2)/2` of every eigencharacter; without `γ` the composite would be `2`, not a character value.
- Infinity type: `F*(z) = z⁻¹` for `z ≡ 1 mod rN(a)D` says that every eigencharacter has `λ((z)) = z⁻¹ = λ_∞(z)⁻¹` with `λ_∞(x) = x`, Finis type `(−1, 0)` as in §4.1; the operator `z` in its place would give type `(1, 0)`, which is not anticyclotomic.
- The factorisation (6) is of `F*(z)⁻¹`: at `z ≡ 1 mod rN(a)D` the finite factors are trivial and `F*(z)⁻¹ = F*_∞(z) = z`, agreeing with `F*(z) = z⁻¹`; read as a factorisation of `F*(z)` it would give `F*(z) = z`.

Define the functional `l : T_d → ℂ` by `l(ϑ) = Σ_{a ∈ A} ϑ_a(0)`, `A` a set of representatives of the ideal classes (Finis, (9), p.780, FINIS06 line 559).

API:

- `l` does not depend on `A`, since `t_{λa}(0) = t_a(0)`.
- `l` takes algebraic values on arithmetic and `ℓ`-integral values (under `ι_ℓ ∘ ι_∞⁻¹`) on integral families (§4.3; Finis, p.784, FINIS06 lines 720–723).

**Checks.**

- For `h_K = 1` (`K = Q(√−7)`), `l(ϑ) = ϑ_{O_K}(0)`; for `K = Q(√−23)` (`h_K = 3`) it is the sum of three component values, and keeping one component only changes the left side of Yang's formula.
- Rescaling: `5l` is linear with the same kernel and the same eigenspaces, but at `ℓ = 5` it raises `v_5(l(ϑ)/w_K)` from `0` to `1` and multiplies the left side `|l(ϑ)|²/⟨ϑ, ϑ⟩` of Yang's formula by `25`; the definition, with coefficient `1` at each class, excludes it.
- A character with `W(λ) = −1` occurs in no `V^{prim}_{d,C}`, consistent with `L(0, λ) = 0`; for `W(λ) = +1` and `L(0, λ) ≠ 0`, Yang's formula forces `l(ϑ_λ) ≠ 0`, so `l` is not identically zero on `V^{prim}_{d,C}`.

Prove Yang's formula: for a positive integer `d` and a Shintani eigenfunction `ϑ ∈ V^{prim}_{d,C}` with character `λ`, `|l(ϑ)|²/⟨ϑ, ϑ⟩ = (w_K² √D / 4πh_K) ∏_{p|d}(1 − ω_{K/Q}(p)p⁻¹)⁻¹ L(0, λ)`, the product over the rational primes dividing the integer `d` (Finis, Proposition 2.4, p.780, FINIS06 line 564, reformulating Yang's theta-lifting formula). By the decomposition above, the characters appearing in `T^{prim}_{d_0 p^m}` are exactly those with restriction `ω_{K/Q}|·|` to `A_Q×`, type `(−1, 0)`, root number `+1` and conductor `d_0 p^m D 𝔡⁻¹` with `𝔡` a squarefree product of ramified prime ideals (Finis, Proposition 2.2, and the description recalled on p.796). *Needs:* §4.1; ComplexMultiplicationAndExplicitReciprocity §1.2 (the period-lattice comparison); AL.1.5.2 Normalization of the supplied completed Hecke function.

**Checks.**

- The constant `w_K²√D/(4πh_K)` for `K = Q(√−7)`: `w_K = 2`, `h_K = 1`, giving `4√7/(4π) = √7/π`.
- A character with `W(λ) = −1` does not appear, consistent with `L(0, λ) = 0` and `l(ϑ) = 0`.
- The correction factor at `p | d` with `ω_{K/Q}(p) = 0` (ramified) is `1`.

### 4.3 Integral theta functions and the valuation identity

Define the antilinear map `ϑ ↦ ϑ†`, `ϑ†(w) = conj(ϑ(w̄))`, from `T_{r,a}` to `T_{r,ā}`; the bilinear form `b(ϑ_1, ϑ_2) = ⟨ϑ_1†, ϑ_2⟩` on `T_{r,ā} × T_{r,a}`, and on `V_{d,C}` the symmetric form obtained by summing over representatives of the ideal classes; for `aā⁻¹` prime to `rN(a)`, the symmetric form `b′(ϑ_1, ϑ_2) = b(F*(ā)ϑ_1, ϑ_2)` on `T_{r,a}`; and the arithmetic forms `b_ar = (Ω/2π) b` and `b′_ar = (Ω/2π) b′`, `Ω` the period of the pair `(E, ω)` fixed below (Finis, §3, pp.784 and 786, FINIS06 lines 724–734 and 813–814).

API:

- `b(ϑ†, ϑ) = ⟨ϑ, ϑ⟩`; `b` and `b′` are nondegenerate.
- For a Shintani eigenfunction `ϑ`, `ϑ† = γϑ` with `|γ| = 1`, and `⟨ϑ, ϑ⟩ = (h_K/2^{ν(D)−1})⟨ϑ_a, ϑ_a⟩` for `N(a) ∈ C` (Finis, Lemma 3.5, p.787, FINIS06 lines 854–861).
- Arithmeticity and integrality (Finis, Proposition 3.4, p.786, FINIS06 lines 815–821): `b_ar` takes algebraic values on arithmetic theta functions, and `(dD)^{5/2} D^{1/4} b_ar(ϑ_1, ϑ_2)` is `ℓ`-integral for `ℓ`-integral `ϑ_1, ϑ_2`, `d = rN(a)`; the same holds for `b′_ar` when `aā⁻¹` is prime to `d`, the integrality when moreover `a` is prime to `𝔩̄`.

**Checks.**

- Bilinear, not hermitian: `b(iϑ_1, ϑ_2) = ⟨(iϑ_1)†, ϑ_2⟩ = ⟨−iϑ_1†, ϑ_2⟩ = i · b(ϑ_1, ϑ_2)`, while the scalar product gives `⟨iϑ_1, ϑ_2⟩ = −i⟨ϑ_1, ϑ_2⟩`.
- Nonvanishing: for a nonzero eigenfunction with `ϑ_λ† = γϑ_λ`, `b(ϑ_λ, ϑ_λ) = ⟨γϑ_λ, ϑ_λ⟩ = γ⁻¹⟨ϑ_λ, ϑ_λ⟩ ≠ 0`, the denominator of (13) below.
- Period scaling: replacing `Ω` by `εΩ`, `ε ∈ O_K×`, multiplies `b_ar` by `ε` and preserves valuations; replacing `Ω` by `ℓΩ` raises `v_ℓ(b_ar)` by `1`, and the good-reduction normalisation of `(E, ω)` excludes it.

Define the arithmetic theta functions `T^{ar}_{r,a}` as the `ϑ ∈ T_{r,a}` whose values `(A_xϑ)(0)`, `x ∈ K`, are all algebraic, and the integral ones `T^{int}_{r,a}` as those whose values are moreover integral under `ι_ℓ ∘ ι_∞⁻¹` (Finis, Lemma 3.1, p.783, FINIS06 lines 687–691, characterising the sections of the rigidified line bundle `L_{r,a}` on a CM curve `E_a` with period lattice `Ω_a a` and good reduction at `ℓ`, p.782, FINIS06 lines 642–668); extend componentwise to `T_d` and `V_{d,C}`. An integral `ϑ` is normalised when `γϑ` is integral exactly for `γ ∈ ι_∞(ι_ℓ⁻¹(O))`, `O` the integers of `C_ℓ` (Finis, p.788, FINIS06 lines 882–884).

API:

- `A_x` for `x ∈ a*`, and `F*(c)` for `cc̄⁻¹` prime to `rN(a)` and `c` prime to `𝔩`, preserve the integral theta functions (Finis, pp.783–784).
- For the standard basis `(g′_j)` of `T_{r,a}` and its `ι_∞(ι_ℓ⁻¹(O))`-span `G`, `G ⊆ T^{int}_{r,a} ⊆ (rDN(a))⁻¹ G` (Finis, Lemma 3.3, p.785).
- `l(ϑ)` is `ℓ`-integral for `ϑ ∈ T^{int}_d`.
- On a one-dimensional eigenspace the integral elements form a free module of rank one over `ι_∞(ι_ℓ⁻¹(O))`, and the normalised elements are its generators, unique up to units.

**Checks.**

- `ℓ = 5`, `ϑ` normalised: `5ϑ` is integral but not normalised, since `5⁻¹ · 5ϑ = ϑ` is integral and `5⁻¹ ∉ O`; it generates a proper submodule, raises `v_5(l(ϑ)/w_K)` by `1` and `v_5(b′_ar(ϑ, ϑ))` by `2`.
- If `rDN(a)` is prime to `ℓ`, `T^{int}_{r,a} = G`; for `K = Q(√−7)`, `r = 1`, `a = O_K` and `ℓ = 7` (ramified) only `G ⊆ T^{int}_{1,O_K} ⊆ 7⁻¹ G` holds.
- Integrality gives the lower bound of §4.6: `l(ϑ) ∈ O` yields `v_ℓ(l(ϑ)/w_K) ≥ 0` when `ℓ ∤ w_K`, that is, for odd `ℓ` except `ℓ = 3` with `K = Q(√−3)`.

Prove the arithmetic form of Yang's formula. Let `d` be a positive integer, `𝔡` a squarefree product of ramified prime ideals, and `λ` anticyclotomic of type `(−1, 0)` with `W(λ) = +1` and conductor `dD𝔡⁻¹`; let `ϑ_λ` be a nonzero element of the one-dimensional Shintani eigenspace of `λ` in `V^{prim}_{d,C}`, `C` the class determined by `λ`, `a` a fractional ideal with `N(a) ∈ C`, and `ϑ_{λ,a}`, `ϑ_{λ,ā}` the components of `ϑ_λ` on the lattices `a` and `ā`. The value `b_ar(ϑ_{λ,ā}, ϑ_{λ,a})` is a nonzero multiple of `⟨ϑ_λ, ϑ_λ⟩ > 0`, hence nonzero, and `Ω⁻¹ L(0, λ) = 2^{ν(D)} D^{−1/2} ∏_{q|d}(1 − ω_{K/Q}(q)q⁻¹) b_ar(ϑ_{λ,ā}, ϑ_{λ,a})⁻¹ (l(ϑ_λ)/w_K)²` (13), with `ν(D)` the number of primes dividing `D` and the product over the rational primes dividing `d`; for `a` prime to `dD`, `b_ar(ϑ_{λ,ā}, ϑ_{λ,a}) = λ(ā)⁻¹ b′_ar(ϑ_{λ,a}, ϑ_{λ,a})` (Finis, Proposition 3.6, (13), p.787, FINIS06 lines 862–868; the discriminant stands in the denominator, as Yang's formula and `b_ar = (Ω/2π) b` force). Prove the valuation of the pairing term: for `a` prime to `dD𝔩̄`, `𝔩` the prime above `ℓ` fixed by `ι_ℓ`, and a normalised integral Shintani eigenfunction `ϑ ∈ T^{prim}_{d/N(a),a}` with local eigencharacters `λ_q`, `v_ℓ((W̃ / (D^{1/4} b′_ar(ϑ, ϑ))) · ∏_{q|d}(1 − ω_{K/Q}(q)q⁻¹)) = Σ_{q | d inert, q ≠ ℓ} μ_ℓ(λ_q) + b_ℓ(λ_ℓ, dN(a)⁻¹)` (15), the pairing standing in the denominator, where, with `m = v_ℓ(d)`, `W̃ = g(λ_𝔩, μ) = Σ_{k mod ℓ^m} λ_𝔩(k)μ^k` is the Gauss sum of `λ_𝔩` on `O_{K_𝔩}× = Z_ℓ×`, viewed as a Dirichlet character modulo `ℓ^m`, at a root of unity `μ` of order `ℓ^m` when `ℓ` splits in `K` and divides `d`, and `W̃ = 1` otherwise (Finis, the Gauss sum before Proposition 3.7, p.788, and Proposition 3.7, (15), p.789, FINIS06 lines 918–940). Deduce, for `λ` of type `(−1, 0)` with `W(λ) = +1` and conductor `dD𝔡⁻¹` as above and a normalised integral element `ϑ_λ` of its eigenspace, `v_ℓ(Ω⁻¹ W̃ D^{1/4} L(0, λ)) = Σ_{q ≠ ℓ inert} μ_ℓ(λ_q) + b_ℓ(λ_ℓ, w(λ)) + 2 v_ℓ(l(ϑ_λ)/w_K)`, with `W̃` the Gauss sum just defined for this `d`: by (13), `v_ℓ(Ω⁻¹ L(0, λ)) = −v_ℓ(D)/2 + v_ℓ(∏) − v_ℓ(b′_ar) + 2 v_ℓ(l(ϑ_λ)/w_K)`, and by (15), `v_ℓ(∏) − v_ℓ(b′_ar) = (Σ μ_ℓ + b_ℓ) − v_ℓ(W̃) + v_ℓ(D)/4`. For nonsplit `ℓ`, `W̃ = 1`. For split `ℓ`, `b_ℓ = 0` (§4.1), `D^{1/4}` is an `ℓ`-adic unit and `v_ℓ(W̃) = v_ℓ(W_ℓ(λ))`, so the identity reads `v_ℓ(Ω⁻¹ W_ℓ(λ) L(0, λ)) = Σ_{q inert} μ_ℓ(λ_q) + 2 v_ℓ(l(ϑ_λ)/w_K)` (Finis, proof of Theorem 1.1, p.794, FINIS06 lines 1134–1148). The period is that of a pair `(E, ω)` with good reduction at the `ℓ`-adic place and `ω` reducing to a nonvanishing differential (Finis, p.768). *Needs:* §§4.1–4.2; ComplexMultiplicationAndExplicitReciprocity §1.2 CM period and de Rham pairings (with its period-lattice comparison).

**Checks.**

- `v_ℓ(l(ϑ_λ)/w_K) ≥ 0` gives the lower bound `v_ℓ(Ω⁻¹ W̃ D^{1/4} L(0, λ)) ≥ Σ μ_ℓ + b_ℓ`, except possibly for `K = Q(√−3)`, `ℓ = 3`.
- Position of the pairing in (15): with `v_ℓ(W̃) = v_ℓ(D) = 0`, `v_ℓ(b′_ar) = 3/4` and `v_ℓ(∏) = 1`, the left side is `0 − 0 − 3/4 + 1 = 1/4`; the product `W̃ D^{1/4} b′_ar ∏` would give `7/4`. This tests the transcription, not the existence of a character with these valuations. The definition (14) of `b_ℓ` as minus the least valuation of `D^{1/4} b_ar` agrees with the pairing in the denominator: Finis's proof computes the least valuation of `b′_ar` on the `ℓ`-part as `−v_ℓ(D^{1/4}) − b_ℓ` (p.791, FINIS06 line 1043), which is (15) when `W̃ = 1`, `v_ℓ(∏) = 0` and there is no inert ramification.
- Position of the discriminant in (13): combining (13) and (15) as above gives `D^{1/4}`, Finis's normalisation on p.794; with `√D` in the numerator of (13) the same computation would give `D^{−3/4}`, which differs at a ramified `ℓ` (`v_ℓ(D) = 1`) by `1`.
- Split `ℓ = 11` in `K = Q(√−7)` (`−7 ≡ 4 = 2²` modulo `11`) with `11 ∤ d`: `W̃ = 1`, `v_11(W̃) = 0` and `b_11 = 0`; leaving `W̃` unspecified would allow the value `11`, which shifts the left side by `1` with the right side unchanged. The nonsplit case at `ℓ = 5` (inert in `Q(√−7)`) with `λ_5` unramified has `W̃ = 1` and `b_5 = 0`.
- Replacing `ω` by `ℓω` changes `Ω` by `ℓ` and the left side by `−1`; the good-reduction normalisation excludes it.
- `D^{1/4}` is an `ℓ`-adic unit for `ℓ ∤ D` and must be kept when `ℓ | D`.

### 4.4 Torsion points on subvarieties in characteristic ℓ

Prove, in the form used by Finis: let `E` be an elliptic curve over `F̄_ℓ` with CM by `O_K`, `p` a prime with `ℓ ≠ p`, `r ≥ 1`, and `B ⊂ E^r` an irreducible closed subvariety such that `B ∩ E^r[p^∞]` is Zariski dense in `B`. Then `B` is a translate of its stabiliser, an algebraic subgroup of `E^r` (Boxall 1992, Theorem 1, pp.1063–1066, as applied in Finis, proof of Lemma 4.5, p.803, FINIS06 line 1587). Deduce Finis's Lemma 4.5: for `β_ν ∈ O_{K_p}` and an infinite subset `M ⊂ E[p^n p̄^∞]`, the Zariski closure of `(⟦β_ν⟧P)_ν` contains a translate of the abelian subvariety cut out by the `O_K`-relations among the `p̄`-components `α′_ν` of the `β_ν = (α_ν, α′_ν)` (Finis, Lemma 4.5, p.803, FINIS06 lines 1571–1584). *Needs:* EllipticCurves Layers 1–2; ComplexMultiplicationAndExplicitReciprocity §1.2 (the period-lattice comparison).

**Checks.**

- `r = 1`: an irreducible curve `B = E` is a translate of `E`; a finite `B` with dense torsion is a torsion point, a translate of the trivial subgroup.
- The diagonal in `E²` contains all `(P, P)` with `P ∈ E[p^∞]` and is a subgroup; the graph of `[2]` likewise.
- A curve in `E²` of genus at least two contains only finitely many `p`-power torsion points; it is not a translate of a subgroup and its torsion is not dense.

### 4.5 Nonvanishing of theta functions modulo ℓ

Prove: let `ℓ ≠ p` be primes, `p` odd and split in `K`, and `d_0` a positive integer prime to `p`. For `m` large enough, for every character `λ` appearing in the Shintani representation on `T^{prim}_{d_0 p^m}` there is an `ℓ`-integral representative `ϑ` of the `λ`-eigenspace with `v_ℓ(l(ϑ)/w_K) = 0` (Finis, Theorem 4.1, p.795, FINIS06 line 1221). Proof route: fix the restriction of `λ` to `Λ_{d_0D}` and write the eigenfunctions explicitly (Lemma 4.2); assuming infinitely many eigenspaces with `v_ℓ(l(ϑ)/w_K) > 0`, reduce modulo `ℓ` and apply Galois conjugation to place infinitely many `p`-power torsion points on a subvariety `D_{n_1} ⊂ E^r` in characteristic `ℓ` (Lemmas 4.3–4.4); §4.4 gives a translate of an explicit abelian subvariety inside `D_{n_1}`, contradicted for large `n_1` (Lemmas 4.6–4.7, pp.795–807). *Needs:* §§4.2–4.4.

**Checks.**

- The statement is for all `λ` at sufficiently large level `m`; at small level a single eigenspace may have `v_ℓ > 0`.
- `ℓ = p` is excluded: the reduction argument uses `p`-power torsion in characteristic `ℓ ≠ p`.
- The unit `w_K` is invertible at `ℓ` unless `ℓ | w_K`, which occurs only for `ℓ = 3`, `K = Q(√−3)` or `ℓ = 2`.

### 4.6 Finis's theorem in weight one

Prove: let `d` be a positive integer, `p` an odd prime split in `K` (the tower prime), `ℓ` an odd prime different from `p` (the valuation prime), and `Ω` the period of a pair `(E, ω)` as in §4.3. For all but finitely many anticyclotomic Hecke characters `λ` of `K` of conductor dividing `dDp^∞`, Finis type `(−1, 0)` and `W(λ) = +1`:

- if `ℓ` splits in `K`, `v_ℓ(Ω⁻¹ W_ℓ(λ) L(0, λ)) = Σ_{q inert} μ_ℓ(λ_q)`;
- if `ℓ` is inert or ramified in `K`, `v_ℓ(Ω⁻¹ D^{1/4} L(0, λ)) = Σ_{q ≠ ℓ inert} μ_ℓ(λ_q) + b_ℓ(λ_ℓ, w(λ))`;

and for every such `λ` (finite exception set or not) the left side is at least the right side, except possibly for `K = Q(√−3)`, `ℓ = 3`. The values `Ω⁻¹L(0, λ)` are algebraic in this normalisation (Finis, Theorem 1.1 with `k = 1`, p.769, FINIS06 lines 101–122; proof, pp.793–795). Proof route: §4.3's identity reduces the equality to `v_ℓ(l(ϑ_λ)/w_K) = 0` for almost all `λ`, which is §4.5. *Needs:* §§4.1–4.5.

**Checks.**

- `W(λ) = −1`: `L(0, λ) = 0` by the functional equation and the theorem says nothing.
- If `λ` is unramified at every inert prime, the right side of the split case is `0` and almost all normalised values are `ℓ`-units.
- The tower prime must be split: with `p` inert the family of conductor `dDp^∞` is not the one of Theorem 4.1.

### Examples

For `K = Q(√−7)` (`D = 7`), tower prime `23`, valuation prime `5`: `D^{1/4} = 7^{1/4}` is a `5`-adic unit; for `λ` unramified at every inert prime, the nonsplit identity reads `v_5(Ω⁻¹ 7^{1/4} L(0, λ)) = b_5(λ_5, w(λ))`, and `b_5 = 0` when `λ_5` is unramified.

### Dependencies

AL.1; ComplexMultiplicationAndExplicitReciprocity §1.2; EllipticCurves Layers 1–2; Tau Ceti `HeckeCharacter`.

## Layer 5: Unit values in the canonical family

From here on `φ` is a canonical Gross character (`IsCanonicalGrossCharacter`), `−D` is odd with `2` split in `K`, `p ≥ 5` is inert with `p ∤ h_K D`, and `l` is the auxiliary prime of §0.5.

### 5.1 The weight-one Finis family

Construct `λ_ν = φ̄ν/N` for `ν ∈ X_l`: on ideals prime to the conductor, `λ_ν(a) = φ̄(a)ν(a)/N(a) = φ(a)⁻¹ν(a)`; at the idele level, multiply `φ̄ν` by the norm absolute value, so the archimedean component is `z`. Prove: `λ_ν` has Finis type `(−1, 0)`, is anticyclotomic in Finis's sense (`λ = λ*`), has conductor dividing `dDl^∞` for a fixed `d`, `L(0, λ_ν) = L(φ̄ν, 1)`, and `W(λ_ν) = +1`; the family is injective in `ν` (Finis, §1, p.768; Theorem 1.1, p.769; proof of Corollary 2.3, p.778; BKO, p.954). The period is that of the same pair `(E, ω)` as §0.4, which has good reduction at the valuation prime `p`. *Needs:* §§0.4, 0.6, 1.1, 1.2, 4.1; ComplexMultiplicationAndExplicitReciprocity §4.3; AL.1.5.2 Normalization of the supplied completed Hecke function.

API:

- `λ_ν(a) = φ̄(a)ν(a)/N(a)` on prime-to-conductor ideals.
- Self-duality from `φφ̄ = N` and `ν^c = ν⁻¹`.
- `L(0, λ_ν) = L(φ̄ν, 1)`, with matching primitive Euler factors.
- `λ_ν = λ_{ν'}` if and only if `ν = ν'`.
- Algebraic embeddings of the value field transport the family and its normalised values.

**Checks.**

- On a prime of norm `Q`, `λ_ν(a) = φ̄(a)ν(a)/Q`; the opposite twist `Qφ̄(a)ν(a)` shifts the central point to `s = −1`.
- Euler denominators: `1 − φ̄(a)ν(a)Q^{−s}·Q^{−1}` at `s = 0` equals the `φ̄ν` denominator at `s = 1`.
- Finis's tower prime set to the inert `p` violates the split hypothesis of §4.6.
- `ν = 1` belongs to the family with sign `+1`; the almost-all theorem need not make its value a unit.

### 5.2 All inert correction terms vanish

Prove: for `λ_ν` in the canonical family, `μ_p((λ_ν)_q) = 0` for every inert `q ≠ p` and `b_p((λ_ν)_p, w(λ_ν)) = 0`: the canonical conductor is supported on ramified primes, `ν` is ramified only above the split `l`, the norm twist is unramified, and `p ∤ fl`, so `λ_ν` is unramified at every inert prime, including `p` (Finis, pp.768–769; BKO, p.954). *Needs:* §§4.1, 5.1; ComplexMultiplicationAndExplicitReciprocity §4.3 Canonical Gross good reduction away from the discriminant.

**Checks.**

- An extra inert prime in the conductor would contribute `μ_p ≥ 0` and is excluded by the canonical support condition.
- Changing the depth of `ν` at `l` changes no inert term.
- At `p` the character is unramified, the branch where `b_p = 0`.

### 5.3 The deleted auxiliary factors equal one

Prove: for `ν ≠ 1` of exact order `l^r` and conductor `l^m`, `m = r + 1`, the conductor of `φ̄ν` is `f l^m`; both primes above `l` are ramified for `φ̄ν`, so the local factors there are `1` and `L_{f l^m}(φ̄ν, 1) = L_f(φ̄ν, 1)`. This fails for `ν = 1`. Deleting the inert `p`-factor at the trivial `p`-character gives `1 + 1/p`, not a unit (BKO, (3.6)–(3.9), pp.953–954). *Needs:* §§0.3, 0.6, 3.4; AL.1.1.1 Local quasi-characters, unramified characters and the conductor exponent; AL.5.1.1 Finite Euler corrections at critical points.

**Checks.**

- `ν = 1`: the factors at `l` are `(1 − φ̄(λ)/l)` for the two primes `λ | l`, nontrivial in general.
- A ramified rank-one local representation has no inertia invariants, so its factor is `1`.
- `p` and `l` deletions are separate: `L_{p f l^m}(φ̄ν, 1) = (1 + 1/p)L_f(φ̄ν, 1)` for `ν ≠ 1`.

### 5.4 Almost all normalised auxiliary values are p-units

Prove: for the canonical `φ` and the auxiliary `l`, all but finitely many `ν ∈ X_l` satisfy `v_p(Ω⁻¹ L_f(φ̄ν, 1)) = 0`; the value is algebraic in the normalisation of §0.4, hence a unit in the integers of every finite extension of `Φ` containing it (BKO, (3.9), p.954). Proof route: apply §4.6 in the nonsplit case with tower prime `l` and valuation prime `p` to `λ_ν`; its right side is `0` by §5.2; `D^{1/4}` is a `p`-adic unit since `p ∤ D`; transport by §5.1 and §5.3; injectivity of `ν ↦ λ_ν` keeps the exceptional set finite. *Needs:* §§0.4, 4.6, 5.1–5.3.

**Checks.**

- The finite exceptional set may contain `ν = 1`.
- Positive root number alone gives no unit statement; Finis's theorem is the input.
- Dropping `D^{1/4}` before checking its valuation would be wrong if `p | D`; here `p ∤ D`.

### 5.5 A nontrivial unit-value witness

Prove: there is `ν ∈ X_l`, `ν ≠ 1`, with `Ω⁻¹L_f(φ̄ν, 1)` a `p`-adic unit, and such `ν` have arbitrarily large conductor (BKO, proof of Theorem 3.4, pp.953–954). Proof route: for each `r ≥ 1` choose a primitive character of order `l^r`, conductor `l^{r+1}`; remove the finite exceptional set of §5.4. *Needs:* §§0.6, 5.4.

**Checks.**

- No claim is made for `ν = 1`.
- The characters for distinct `r` are distinct since their conductors differ.
- The witness uses neither a signed decomposition nor a primitive Iwasawa coordinate.

### 5.6 Unramified coefficients for the canonical family

Prove: for canonical `φ` with `p ∤ h_K D` and `ν ∈ X_l`, the field `Φ(φ, ν)` generated over `Φ` by the values of `φ` on ideals prime to `f` and of `ν` is finite unramified; `T_φ` and the evaluation at `ν` are defined over its integers `W`; and `A_ν = Ω⁻¹L_f(φ̄ν, 1)` lies in a finite unramified extension of `Φ`, so valuation zero makes it a unit of the integers of any unramified coefficient field containing it. Proof route: for a class representative `a` of order `d | h_K`, `a^d = (α)` with `α` prime to `pf` and `φ(a)^d = ±α`; since `p ∤ d`, `X^d ∓ α` generates an unramified extension; the values of `ν` have `l`-power order; for the value, apply §2.8 at level `g = f l^m` with `ν` trivial on the `p`-part, so the weighted sum is invariant under `Gal(K(gp^n)/K(g))` and lies in `W[1/p] ⊗ coLie(E) ⊗_K K(g)`, with `K(g)/K` unramified above `p`; the `p`-factor `1 + 1/p` is rational and the `l`-factors are `1` for `ν ≠ 1` (BKO, p.954; Kato 2004, Proposition 15.9, p.258). *Needs:* §§0.6, 2.8, 3.3, 5.3; ComplexMultiplicationAndExplicitReciprocity §4.3; LocalFieldsRamification Layer 2; GlobalNumberFields Layer 10.

**Checks.**

- `p | h_K`: `X^p − u` can be ramified, and the proof fails.
- A rescaling of `Ω` by a ramified unit preserves valuations but leaves the unramified normalisation.
- `ν = 1` uses level `f` and keeps `1 + 1/p` separate.

### 5.7 Scalar and tensor character kernels

Prove: let `F = Φ_n` and `U = Frac(W)` as in §5.6. The multiplication map `F ⊗_Φ U → C_p` is injective; hence for `χ` of the finite anticyclotomic quotient with values in `F` and `x_σ ∈ F ⊗_Φ U`, `Σ_σ χ(σ)x_σ = 0` if and only if its image in `C_p` is `0`; the same holds for the integral tensor after its flat injection (BKO, §2, pp.948–949, and §3.0.2, pp.953–954). Proof route: a common subextension of the totally ramified `Φ_n` and the unramified `U` is `Φ`; linear disjointness follows and is equivalent to injectivity (`Subalgebra.linearDisjoint_iff_injective`). For a ramified coefficient field this fails, and no statement is made for it. *Needs:* §§3.5, 5.6; LocalFieldsRamification Layers 2–3; Mathlib `Subalgebra.linearDisjoint_iff_injective`.

**Checks.**

- `U = F` with `F ≠ Φ` ramified: `a ⊗ 1 − 1 ⊗ a` for `a ∉ Φ` is nonzero with image `0`.
- `n = 0`, `U = Φ(ζ_{l})` unramified: `Φ_0 ⊗_Φ U` is a field of degree `24·[U : Φ]` for `p = 5`.
- `χ` of order `p^n` takes values in `μ_{p^n} ⊂ Φ_n` by §3.5.

### Examples

For `K = Q(√−7)`, `p = 5`, `l = 23`: `D^{1/4} = 7^{1/4}` has `v_5 = 0`; for `ν` of order `23`, the factors at the two primes above `23` are `1`; almost all `Ω⁻¹L_f(φ̄ν, 1)` are `5`-adic units. These are hypothesis and normalisation checks; no particular value is asserted to lie outside the exceptional set.

### Dependencies

Layers 0, 1, 2, 3 and 4; ComplexMultiplicationAndExplicitReciprocity §4.3; AL.1, AL.5; LocalFieldsRamification Layers 2–3; GlobalNumberFields Layer 10.

## Layer 6: Nonvanishing of central values

### 6.1 Rohrlich's lattice-point count

Define `rohrlichCount P α β q t`, for a finite set `P` of primes, `α_p, β_p ∈ Z_p`, a positive integer `q` and `t > 0`, as the number of `(u, v) ∈ Z²` with `|u|, |v| ≤ t` such that for every `p ∈ P`, `uβ_p − vα_p` is nonzero and lies in `qZ_p` (Rohrlich 1984, §3, p.401, ROHRLICH84 line 763). Prove, for `α_p, β_p` algebraic over `Q` and not both `0`:

- `rohrlichCount_eq_zero`: for every `c < 1/2`, `M(q, q^c) = 0` for all sufficiently large `q` divisible only by primes of `P` (Rohrlich 1984, §3, Proposition 1, p.401–402);
- `rohrlichCount_lt`: for every `d` and `s` with `1/2 < d < 3/5` and `5d/2 − 1 < s < 1/2`, `M(q, q^d) < q^s` for all sufficiently large such `q` (Rohrlich 1984, §3, Proposition 2 and its proof, pp.402–407, ROHRLICH84 lines 896–900).

Proof route: Ridout's inequality `∏_{p ∈ P}|u − vγ_p|_p > k·max(|u|, |v|)^{−κ}` for algebraic `γ_p`, `κ > 2`, from DiophantineApproximationAndTranscendence §2.3 (or §2.1 in two variables), extended from coprime pairs to all pairs; part one with `γ_p = α_p(β_p + jα_p)⁻¹` and `c < 1/κ < 1/2`; part two by covering the box with squares of side `q^c`, part one, the rational-line case and a Dirichlet-principle subdivision along a line. Jia's restatement prints the modulus `Z_p` instead of `qZ_p` and the box bound `q⁻¹` instead of `q^c` (Jia, §4, pp.18–20); Rohrlich's text is the reference. *Needs:* DiophantineApproximationAndTranscendence §§2.1, 2.3; Mathlib `PadicInt`, `Set.ncard`.

API:

- Invariance under rescaling `(α_p, β_p) ↦ (γ_pα_p, γ_pβ_p)` with `γ_p ∈ Z_p×`.
- Monotonicity in `t` and in the divisibility of `q`.
- The set counted is finite (a bounded box).

**Checks.**

- `P = {p}`, rational direction `(a, b) ∈ Z²`: `|ub − va|` is a nonzero integer divisible by `q`, so it is at least `q`, while `|ub − va| ≤ (|a| + |b|)q^d`; hence `M(q, q^d) = 0` for any fixed `d < 1` and large `q`.
- With modulus `Z_p` in place of `qZ_p`, every pair in the box off the direction line counts, `M(q, q^c)` grows like `q^{2c}`, and part one fails.
- `c < 0` and `q > 1`: `t = q^c < 1`, the box contains only `(0, 0)`, excluded by the nonvanishing condition, so `M(q, q^c) = 0`. At `c = 0` the box is the nine-point square `{−1, 0, 1}²` and the count need not vanish for every `q`: for `P = {5}`, `α_5 = 5`, `β_5 = 0`, the form is `uβ_5 − vα_5 = −5v`, so `q = 5` counts the six pairs `(u, ±1)`, `u ∈ {−1, 0, 1}`, while `q = 25` counts none. The quantifier "for all sufficiently large `q`" is needed.
- `d = 11/20`, `s = 7/16`: `5d/2 − 1 = 3/8 < 7/16 < 1/2`, an admissible pair.

### 6.2 The Galois-average limit

Prove: let `K` be imaginary quadratic, `φ` as in §0.1, `P` a finite set of primes, `L_P` the union of the ring class fields of conductor divisible only by primes of `P`, and `ρ` ranging over the characters of finite order of `Gal(L_P/K)` with `W(φρ) = +1`. Partition by the rational support `R` of the conductor and write `η = φρ`, `f(η) = (N cond η)^{1/2}`, `κ_R` the quadratic character induced to a modulus containing `R`, extended by zero on `R`. As `f(η) → ∞` within a fixed support, the average of `L(1, η^σ)` over the `K`-embeddings `σ` of the value field tends to `2L(1, κ_R) ≠ 0`; there are finitely many supports (Jia, Theorem 1 p.2; §2, (2.20)–(2.29), pp.6–7; Propositions 1–2, pp.7–8; Main Lemma 2, pp.13–14; Lemma 3, pp.17–18; Proposition 5, pp.18–20; Rohrlich 1984, §1, pp.386–392, and §4, p.407). Proof route: the sign-positive approximate functional equation with `A = √|disc K|/(2π)`; the rational-ideal part tends to `2L(1, κ_R) = 2L(1, κ_K)∏_{q ∈ R}(1 − κ_K(q)/q)`; each `η^σ` has the same conductor and root number (Jia, (2.13)–(2.18), pp.5–6); the non-conjugation-stable ideals with nonzero averaged character are counted through the trace-of-roots-of-unity criterion, the class-group reduction with `a_0^h = (w_0)` and the retained `h`-th root, and §6.1, giving `N_η(f^a) = 0` for `a < 1` and `N_η(f^b) < f^r` for some `b > 1`, `r < 1/2`; choose `2r < a < 1`, bound the middle sum by `O(f^{r − a/2})` and the tail by ideal counting and the cutoff `exp(−N(a)/(Af))`. Jia's printed tail bound has the wrong sign in the exponent (Jia, (2.43), p.10) and the inverse `n⁻¹` in the rational-principal law before (2.1), p.4; the correct forms are used. *Needs:* §§0.1, 0.3, 6.1; AL.1.6.2 Hecke continuation and functional equation, AL.1.3.5 Explicit local ε-factors; ArithmeticDirichletSeries Layer 5; GlobalNumberFields Layers 9–10; ClassFieldTheory Layer 13; Mathlib `DirichletCharacter.LFunction_apply_one_ne_zero`.

**Checks.**

- `K = Q(√−7)`, support `{5}`: the rational term omits multiples of `5` and the limit is `2L(1, κ_K)(1 + 1/5)`; the unrestricted constant `2L(1, κ_K)` is wrong.
- For `h_K > 1` the `h`-th roots and the coset directions survive; no class-number-one hypothesis is used.
- The estimates are ineffective: no conductor bound for the exceptions is part of the statement.

### 6.3 Galois stability of central vanishing

Prove: for `η = φρ` as in §6.2 and `σ ∈ Aut(ℂ/K)`, `L(η, 1) = 0` implies `L(η^σ, 1) = 0`, where `η^σ(a) = σ(η(a))`. Proof route: let `θ_η` be the weight-two newform with `L(θ_η, s) = L(η, s)` (GL2AutomorphicRepresentationsAndTransfer R17.4.16; ComplexMultiplicationAndExplicitReciprocity §4.2 CM induction and compatible-system comparison); its coefficient conjugate is `θ_{η^σ}`; the algebraic normalised critical value `L(θ_η, 1)/Ω^+` is carried by `σ` to that of `θ_{η^σ}` (ModularSymbolsPadicLFunctions §§1.2, 4.3), so vanishing is preserved (Jia, p.3, JIA24 lines 96–100, citing Shimura). *Needs:* §0.1; ModularSymbolsPadicLFunctions §§1.2, 4.3; GL2AutomorphicRepresentationsAndTransfer R17.4.16.

**Checks.**

- `σ = id` fixes `K` and gives `η^σ = η`. For `K = Q(√−7)` (`h_K = 1`, so the canonical `φ` takes values in `K`), `ν = 1`, `χ` of order `25` and `σ ∈ Aut(ℂ/K)` with `σ(ζ_25) = ζ_25²`: `η^σ = φχ²`, and `χ²` again has order `25` and conductor exponent `3`, so both values vanish by §1.4, as the statement requires.
- Complex conjugation is not in `Aut(ℂ/K)`: for `K = Q(i)` it sends `i` to `−i`. The identity `L(η̄, 1) = L(η, 1)`, `η̄ = conj ∘ η = η ∘ c` by equivariance, is a separate compatibility of the two complex embeddings, proved by reindexing ideals `a ↦ ā` (§§0.1, 1.4), not an instance of this theorem.
- Nonvanishing is not transported by a transcendental period alone; the algebraic normalisation is essential.
- `η` and `η^σ` have the same conductor, so the family of §6.2 is stable under `σ`.

### 6.4 Correct-sign central values are almost always nonzero

Prove: for `φ` as in §0.1 and a fixed anticyclotomic `ν` of odd finite order, all but finitely many `χ` in the `p`-anticyclotomic family with `W(φνχ) = +1` satisfy `L(φνχ, 1) ≠ 0`, and then `L_S(φνχ, 1) ≠ 0` for every finite `S`; the same holds for `φ̄νχ` (Jia, Theorem 1, p.2, JIA24 line 66; BKO, §6.0.1, p.961). Proof route: `ρ = νχ` runs over characters of `Gal(L_P/K)` with `P = {p} ∪` the primes below the conductor of `ν`; if `L(η, 1) = 0` then by §6.3 every term of the Galois average vanishes, contradicting §6.2 for large conductor; finitely many `χ` have bounded conductor; §0.3 passes to deleted values; `L(φ̄νχ, s) = L(φν⁻¹χ⁻¹, s)` (§0.1). *Needs:* §§0.1, 0.3, 6.2, 6.3; AL.5.1.1 Finite Euler corrections at critical points.

**Checks.**

- Agboola–Howard, proof of Proposition 3.1 and Remark 3.2, p.4 (AH05 lines 141–152): for a CM curve over `Q` and a primitive `χ` of order `p^n`, `n > 0`, `W(χψ) = (−1)^{n+1}W(ψ)`, a forced zero for one parity and Rohrlich's almost-all nonvanishing for the other; the formula fails for the trivial character, which has `c = 0`.
- Wrong-sign characters have value `0` (§1.4); the quantifier ranges over the correct-sign family only.
- The theorem makes no assertion about derivatives.

### 6.5 The parity dichotomy

Prove `centralValue_parity_dichotomy`: let `K` be imaginary quadratic, `ι : K → ℂ`, `p` an odd prime with `pO_K` prime (inert), `v` the prime `pO_K`, `φ` with `IsEquivariantTypeOneZero ι φ` unramified at `v`, and `ν` an anticyclotomic character of odd finite order unramified at `v`; fix uniformizers `ϖ`. There is `ε ∈ {±1}` such that for every `χ` with `IsPAnticyclotomic p v χ` and `c = conductorExponent v χ`: if `(−1)^c = −ε` then `HasCentralValue (φνχ) ϖ 0`; and the set of `χ` with `(−1)^c = ε` for which no nonzero central value exists is finite. Here `ε = W(φν)`. Proof route: §1.3 gives `W(φνχ) = (−1)^c W(φν)`; §1.4 gives the zeros; §6.4 gives the nonvanishing; §0.3 identifies `HasCentralValue` with the continued value. The sign `ε` is determined, because the family contains infinitely many characters of each parity of `c` (§0.2, with no class-number hypothesis). By `L(φ̄νχ, s) = L(φν⁻¹χ⁻¹, s)` the statement holds verbatim for the characters `φ̄νχ` used in BKO §§3 and 6. No hypothesis `p ∤ h_K` or `p ≥ 5` is needed. *Needs:* §§0.1–0.3, 1.3, 1.4, 6.4.

**Checks.**

- `K = Q(√−7)`, `p = 5`, `φ` canonical, `ν = 1`: `ε = +1`; `χ` of order `5` (`c = 2`) has almost always nonzero value; `χ` of order `25` (`c = 3`) has value `0`.
- `p = 3`, `K = Q(√−7)` (`3` inert since `(−7/3) = (2/3) = −1`): the statement applies; `p = 2` is excluded since the family would contain characters of even order.
- If `φ` were ramified at `p`, the unitary value at `p` is undefined and the parity factor can change; the hypothesis `φ` unramified at `v` is used.
- Taking `ε` of the wrong sign makes both clauses fail: all `χ` of parity `ε` would need nonzero values while they vanish.

### Examples

Worked parity table for `K = Q(√−7)`, `p = 5`, canonical `φ`, `ν ∈ X_{23}`: `W(φ) = W(φν) = +1`; orders `1, 5, 25, 125` of `χ` have `c = 0, 2, 3, 4` and signs `+1, +1, −1, +1`; the `c = 3` values vanish and almost all others do not.

### Dependencies

Layers 0 and 1; DiophantineApproximationAndTranscendence §§2.1, 2.3; ArithmeticDirichletSeries Layer 5; AL.1, AL.5; ModularSymbolsPadicLFunctions §§1.2, 4.3; GL2AutomorphicRepresentationsAndTransfer R17.4.16; ComplexMultiplicationAndExplicitReciprocity §4.2; GlobalNumberFields Layers 9–10; ClassFieldTheory Layer 13.

## Downstream consumers

AnticyclotomicLocalUnits consumes the integral class and its reciprocity (§§2.7–2.10), the towers, splitting and Lubin–Tate comparison (Layer 3), the forced zeros (§1.4), the unit theorem and witness (§§5.4–5.5) and the scalar/tensor comparison (§5.7); it owns the `ξ_ν` projection, the `Δ`-averaging, derivatives and signed kernels, and must compare its native derivative with the scalar value. InertAnticyclotomicCMMainConjecture consumes the central nonvanishing and parity dichotomy (§§6.4–6.5) and the period laws (§2.10). The CM continuations of ModularIwasawaMainConjecturesPartII consume the CM refinement of Kato's theta function, the canonical CM pairs, the standard elliptic units, the zeta elements, Kato's realisation and the reciprocity law (§§2.1–2.6), all stated for every prime `p`; at that interface the standard units are the inverses of the theta values (§2.2), and the reciprocity law of §2.6 carries the resulting sign. The scalar/tensor comparison applies only with unramified coefficients (§5.7).

## Worked examples

Take `K = Q(√−7)`, `p = 5`, the canonical character with conductor supported at `7`, and `l = 23`. The prime `2` splits and `(−7/5) = −1`, so `5` is inert, `h_K = 1`. An auxiliary character of order `23` has field layer of degree `23` and conductor `23²`, ramified at both primes over `23`, so both local factors are `1`. The inert Frobenius at `5` is `[−5]`, and `Φ_0/Φ` has degree `24`. Finis's discriminant factor `7^{1/4}` has `5`-adic valuation `0`. A `p`-character of order `5` has `c = 2` and sign `+1`; of order `25`, `c = 3`, sign `−1` and central value `0`. Group-algebra evaluation sends `[g]` with `ν(g) = ζ_23` to `ζ_23`, not `ζ_23⁻¹`. Changing `ω` by `2` fixes the class and halves the scalar; `pω` is not allowed. The `p`-deleted trivial-character factor `6/5` has valuation `−1`. For scalar/tensor descent, `Φ_n` totally ramified and `U` unramified meet in `Φ`, so `Φ_n ⊗_Φ U` embeds in `C_5`; for `U = Φ_n` it does not.

## References

- **BKO21**: Ashay A. Burungale, Shinichi Kobayashi and Kazuto Ota, [Rubin’s conjecture on local units in the anticyclotomic tower at inert primes](https://authors.library.caltech.edu/records/8svwt-jn031/files/annals.2021.194.3.8.pdf?download=1), Annals of Mathematics 194 (2021), 943–966. §2, pp.947–949; §3.0.2, pp.951–953, (3.3)–(3.7); Proposition 3.3, p.953; §3.0.3, Theorem 3.4 and its proof, (3.8)–(3.9), pp.953–954; §6.0.1, p.961.
- **KATO04**: Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/article/AST_2004__295__117_0.pdf), Astérisque 295 (2004), 117–290. Proposition 1.3, pp.121–122; §3.8, pp.138–140; §15.3–15.9, pp.251–260, including (15.3.3), §15.5, §15.8 and the proof of Proposition 15.9.
- **FINIS06**: Tobias Finis, [Divisibility of anticyclotomic L-functions and theta functions with complex multiplication](https://annals.math.princeton.edu/wp-content/uploads/annals-v163-n3-p02.pdf), Annals of Mathematics 163 (2006), 767–807. §1, pp.767–770; Proposition 2.4, p.780; Corollary 2.3, p.778; §2, (3)–(5), pp.771–772, Shintani operators, pp.773–774, Propositions 2.2 and 2.4 and (9), pp.778–780; Lemmas 3.1–3.3, pp.782–785; Propositions 3.4, 3.6, 3.7 and Lemma 3.5, pp.786–789; proof of Theorem 1.1, pp.793–795; Theorem 4.1 and Lemmas 4.2–4.7, pp.795–807.
- **BOXALL92**: J. Boxall, Autour d’un problème de Coleman, Comptes Rendus de l’Académie des Sciences de Paris, Série I, 315 (1992), 1063–1066. Theorem 1.
- **JIA24**: Haijun Jia, [On L-functions of Hecke characters and anticyclotomic towers](https://arxiv.org/abs/2412.05867v1), arXiv:2412.05867v1 (2024); published in Acta Arithmetica 224 (2026), 99–116. Locators refer to arXiv v1.
- **ROHRLICH84**: David E. Rohrlich, [On L-functions of elliptic curves and anticyclotomic towers](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0075/LOG_0028.pdf), Inventiones Mathematicae 75 (1984), 383–408. §1, pp.386–392; §3, pp.401–407; §4, p.407.
- **ROHRLICH-NOTES**: David E. Rohrlich, [Root numbers](https://math.bu.edu/people/rohrlich/pcmi.pdf), Park City lecture notes. Propositions 1.5–1.6, pp.14–15; Lecture 2 §§5.1–5.2, pp.34–36.
- **GREENBERG83**: Ralph Greenberg, [On the Birch and Swinnerton-Dyer conjecture](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0072/LOG_0016.pdf), Inventiones Mathematicae 72 (1983), 241–265. §1, pp.246–247.
- **QUEYRUT74**: Jacques Queyrut, [Sur l’équation fonctionnelle des séries L d’Artin pour des caractères réels](https://www.numdam.org/item/MSMF_1974__37__133_0.pdf), Mémoires de la SMF 37 (1974), 133–135. The theorem and local formula on p.135.
- **RUBIN87**: Karl Rubin, [Local units, elliptic units, Heegner points and elliptic curves](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0088/LOG_0026.pdf), Inventiones Mathematicae 88 (1987), 405–422. Lemma 3.1, p.409; §3, pp.409–410.
- **AH05**: Adebisi Agboola and Benjamin Howard, [Anticyclotomic Iwasawa theory of CM elliptic curves II](https://arxiv.org/abs/math/0401124), Mathematical Research Letters 12 (2005), 611–621; arXiv:math/0401124. Proposition 3.1 and Remark 3.2, p.4 of the arXiv version.
