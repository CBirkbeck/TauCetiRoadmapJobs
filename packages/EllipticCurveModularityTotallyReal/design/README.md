# Roadmap: modularity of elliptic curves over totally real fields

**Summary.** Every elliptic curve over every totally real number field is modular, with its
entire compatible system and every local factor. This roadmap builds the totally real branch of
the geometric prime switch. The cyclic covers of a family of quadratic twists, their integral
regular-module lattices, their character systems and the integral congruences between them are
imported from EllipticCurveModularityImaginaryQuadratic, which states them over arbitrary
number fields. Over a totally real base those character systems live only over the CM field
`M = K(μ_{3p})`. Twisting the cover by its reflection descends them to totally odd rank-two
systems over the real subfield `L = K(ζ_{3p} + ζ_{3p}⁻¹)`, with the same lattices and the same
congruences. The modularity lifting theorems over totally real fields, which need no local
matching at the lifting prime, then carry modularity along the chain
`W_η ≡_p W_χ ≡_3 W_ψ ≡_p W_1`. The chain starts from an auxiliary elliptic curve made modular by
the Freitas–Le Hung–Siksek mod-five criterion and ends at a quadratic twist of the original
curve. Descent along the abelian extension `L/K` and removal of the two quadratic twists finish
the argument.

The endpoint is the **totally real modularity theorem** (§4.4): for every totally real number
field K and every elliptic curve E/K there is a cuspidal automorphic representation `π_E` of
`GL₂(𝔸_K)` of parallel weight two (type `(2,0)`) with trivial central character, unique up to
isomorphism, whose attached representation is `H¹_ét(E_K̄, ℚ̄_ℓ)` for every ℓ and every
coefficient isomorphism. At every finite place `v∤ℓ` the Frobenius-semisimple Weil–Deligne
representation of `H¹(E)` is `rec(π_{E,v} ⊗ |det|_v^{−1/2})`, monodromy included. At `v|ℓ` the
same holds for the potentially semistable Weil–Deligne representation. Consequently
`L(E/K,s) = L(π_E, s−1/2)`, and the Hilbert newform of `π_E` has rational Hecke eigenvalues and
exact level the conductor of E. Geometrically CM curves are included. Their CM field is never
contained in K, and `π_E` is the cuspidal quadratic automorphic induction from KT. This is
[LeHung26](#references), Theorem 1.1, p.2 (LeHung26 line 86), with the geometric inputs proved
by the imported layers rather than assumed.

## Scope and ownership

**Owned here.** Layer 1: the real cyclotomic subfield over an arbitrary base and its quadratic
character, the reflection twist of the covers, the descended character systems with their
determinant, Hodge, compatibility and oddness properties, their integral lattices and
congruence chain, and the two elliptic endpoints. Layer 2: the change of coefficient prime for
rank-two systems over totally real fields, the application of the totally real weight-two
lifting theorem to rank-two summands of abelian varieties
([LeHung26](#references), Proposition 3.1), the 3–5 switch curve over a number field, and the
mod-three and mod-five elliptic seeds over a totally real field ([FLHS15](#references),
Corollary 5.1 and Theorem 3). Layer 3: one specialization satisfying every residual condition
over L, the auxiliary seed over L and the three lifts. Layer 4: descent to the original curve,
the all-place comparison over a totally real base, the CM branch over a totally real base, and
the endpoint.

**Imported from EllipticCurveModularityImaginaryQuadratic.** Layers 1–4 (the parameter open
`switchParameterOpen`, the covers `cyclicCover m` with rotations and reflection, both
degenerations, the integral regular-module marking `integral_regular_module_etale`, the
character systems `characterSystem θ` with `character_system_properties`, the quotient
realizations `character_order_quotient`, `trivial_character_twist`, `auxiliaryEllipticCurve`
and `cubic_character_elliptic`, the lattices `characterLattice θ` and
`prime_switch_congruences`); §5.1 `nonCM_elliptic_large_residual_primes`; §7.1
`character_geometric_irreducibility`; §7.4 `simultaneous_specialization`, which is stated
there for an arbitrary number field; §0.2 `fixed_pairing_twist` and
`fixed_pairing_twist_rational`, the fixed-pairing twisted modular curves at three and five over
an arbitrary number field. Its CM lifting theorems (§§0.1, 5.2–5.3), its local prescription
(Layer 6) and its CM descent and endpoint (Layer 8) are not used. The totally real lifting
theorem needs no matching of local types at the lifting prime ([LeHung26](#references), §3.1,
LeHung26 line 234), so no local parameter open is imposed here.

**Kept variants.** Section 2.1 is the change-of-prime argument of
EllipticCurveModularityImaginaryQuadratic §8.1 `character_automorphy_change_prime`, stated here
for systems over a totally real field and the Hilbert attachment rather than for `V_θ` over a CM
field. Section 4.2 replaces that roadmap's CM-field comparison (§0.3
`modular_elliptic_all_coefficients`, §8.5) by the totally real Hilbert local–global
compatibility, which holds at every finite place without a separate monodromy argument.
Section 4.3 is the totally real counterpart of its §8.6: over a totally real base the CM field is
never contained in the base, so only the cuspidal induced branch occurs.

**Supplied elsewhere.** The Hilbert attachment, its determinant, oddness and irreducibility and
its local–global compatibility at every finite place are AutomorphicGaloisRepresentations
§§3.10–3.14, 4.4 and 4.7. Soluble base change and descent over totally real fields, with all-place
local compatibility, are PotentialAutomorphyInfrastructure §2.3. Quadratic automorphic
induction, local Langlands, conductors, newvectors and strong multiplicity one are
GL2AutomorphicRepresentationsAndTransfer R16.2–R16.4 and R17.4.16. Hilbert irreducibility with
local conditions is InverseGaloisAndArithmeticFundamentalGroups IG.2. The compatible-system
carrier is SmallRamificationAndAbelianVarietyBaseCases §5.0d with the predicates of
AutomorphicGaloisRepresentationsPartII AG2.P and PotentialModularityAndCompatibleSystems §1.6.
The general weight-two lifting theorem over totally real fields belongs to GL2ModularityLifting.
Residual modularity of solvable totally odd representations belongs to
GL2AutomorphicRepresentationsAndTransfer R17.5. The two sections these roadmaps must add are
specified under [Exact supplier contracts](#exact-supplier-contracts).

**Outside this roadmap.** CM base fields (EllipticCurveModularityImaginaryQuadratic and its
Part II), number fields that are neither totally real nor CM, abelian varieties of higher
dimension and computational questions. The rational case K = ℚ is a Check of the general
statement, not a new proof of EllipticCurveModularity's endpoint.

**Statability at the pins.** Mathlib has totally real and CM fields, maximal real subfields and
cyclotomic extensions; Tau Ceti has the elliptic Tate representation, its cyclotomic determinant
and quadratic twists. Neither has cuspidal automorphic representations of `GL₂` over a number
field or the Hilbert attachment, so the headline theorems are stated on the supplier carriers
named below. The field statement of §1.1 is the one result here that the pins already express.

## Conventions

- Number fields carry fixed algebraic closures and `G_F` is the absolute Galois group. An
  elliptic curve E is a smooth proper genus-one curve with origin O, presented in
  characteristic zero as `y² = h(x)` with h a separable cubic; local reduction types are read on
  local minimal models (EllipticCurves Layer 4.5a). No global minimal model is assumed.
- `H¹(X)` means `H¹_ét(X_F̄, ℚ̄_ℓ)`. The cyclotomic character `ε_ℓ` has Hodge–Tate weight `−1`,
  so `det H¹(E) = ε_ℓ⁻¹` and `H¹(E)` has labelled weights `{0,1}`. The rational Tate module
  `V_ℓ(E) = H¹(E)^∨` has determinant `ε_ℓ`, which is Tau Ceti's
  `TauCeti.det_tateModuleGaloisRepresentation` transported by duality.
- Frobenius is geometric and local class field theory sends a uniformizer to geometric
  Frobenius. At a good place `H¹(E)` has Frobenius polynomial `X² − a_vX + q_v` and Euler factor
  `(1 − a_v q_v^{−s} + q_v^{1−2s})⁻¹`.
- Automorphic representations follow AutomorphicGaloisRepresentations' Conventions: a cuspidal
  π of `GL₂(𝔸_F)`, F totally real, has infinity type `(k,w)`, and `ρ_{π,ι}` is its attached
  representation (AutomorphicGaloisRepresentations §3.10) for a coefficient isomorphism
  `ι : ℚ̄_ℓ ≅ ℂ`, with good geometric Frobenius polynomial `X² − t_vX + q_vs_v` and determinant
  `χ_{π,ι}ε_ℓ⁻¹`. Type `(2,0)` is parallel weight two with discrete series `D_{2,0}` at every real
  place and finite-order central character. The local parameter is
  `rec(π_v ⊗ |det|_v^{−1/2})` and the cohomological local factor is `L(s−1/2, π_v)`.
- **Modular.** For F totally real, a continuous semisimple `r : G_F → GL₂(ℚ̄_ℓ)` is *modular* if
  `r ≅ ρ_{π,ι}` for a cuspidal π of type `(2,0)`; for semisimple r this is the attachment
  predicate `IsAttached` of AutomorphicGaloisRepresentationsPartII AG2.0, read through the
  Hilbert-member identification of AG2.P. An elliptic curve E/F is modular if `H¹(E)` is
  modular for one ℓ and ι, equivalently for all (§2.1). A residual `r̄ : G_F → GL₂(𝔽̄_ℓ)` is
  *residually modular* if `r̄^ss` is the semisimplified reduction of `ρ_{π₀,ι}` for a cuspidal
  `π₀` of some cohomological type `(k,w)`, all `k_τ ≥ 2`.
- Fix `n ≥ 3` odd. The abstract coefficient field is `M₀ = ℚ(μ_n)` with embeddings
  `j : M₀ → ℂ` and `j_ℓ : M₀ → ℚ̄_ℓ` satisfying `ι ∘ j_ℓ = j`. A character
  `θ : μ_n → M₀^×` acts through pullback: `u^*x = j_ℓ(θ(u))x`. Changing ℓ keeps θ; labels are
  never re-chosen at one prime.
- The conductor of E is `𝔫_E = ∏_v 𝔭_v^{f_v}`, with `f_v` the Artin conductor exponent of
  `WD(H¹(E)|G_{K_v})` for any ℓ prime to v (ArithmeticGaloisRepresentations Layer 3); it does not
  depend on ℓ. Its comparison with the exponent of Tate's algorithm (EllipticCurves Layer 4) is not
  used.
- `≡_ℓ` means isomorphic semisimplified reductions of stable lattices over a common finite
  coefficient extension; only this is lattice-independent.
- For the real cyclotomic data of §1.1 write `δ = (−1)^e` with `e : G_L → ℤ/2`, so that
  `g(ζ) = ζ^{δ(g)}` for `ζ ∈ μ_n`. A twist of a variety X by a cocycle `a` is a variety X′ with
  an isomorphism `φ : X′_{L̄} → X_{L̄}` such that `φ ∘ ᵍφ⁻¹ = a_g`; Galois then acts on `X(L̄)` by
  `g ⋆ x = a_g(gx)` and on `H¹(X)` by `a_g^* ∘ ρ(g)`.
- Matrices act on columns.

**Convention witnesses.**

- For 11a1 over ℚ, `π` of type `(2,0)` has `t₃ = a₃ = −1` and `s₃ = 1`, so
  `ρ_{π,ι}(Frob₃)` has polynomial `X² + X + 3`, that of `H¹(E)`. The Tate module `V_ℓ(E)` instead
  has determinant `ε_ℓ` and equals `ρ_{π⊗|det|,ι}`, of type `(2,−2)`; fixing type `(2,0)` rejects
  it.
- At 11a1 and q = 3, `α + β = −1` and `αβ = 3`; the unitary Satake roots `α/√3, β/√3` have
  product one, and `L(s−1/2, π₃) = (1 + 3^{−s} + 3^{1−2s})⁻¹`, the Euler factor of E. Reversing
  the half-shift gives `(1 + 3^{−s−1} + 3^{−2s−1})⁻¹` instead.
- For k = ℚ and n = 3, δ is the character of `ℚ(√−3)`: `δ(Frob₇) = 1` because 7 ≡ 1 mod 3, and
  `δ(Frob₂) = −1` because Frobenius at 2 inverts `ζ₃`.
- For `E: y² = x³ − x + 1` over `𝔽₅` there are 8 points, so `a₅ = −2`; its quadratic twist by the
  nonsquare 2, `y² = 3(x³ − x + 1)`, has 4 points and `a₅ = 2`. A quadratic twist multiplies the
  trace by the character value, here `(2/5) = −1`.

## Exact supplier contracts

### From Mathlib

At `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`:
`NumberField.IsTotallyReal` and `NumberField.IsTotallyComplex`
(`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean`: every infinite place
real, respectively complex); `NumberField.maximalRealSubfield`, the subfield of elements fixed by
complex conjugation under every complex embedding, with the instance
`NumberField.isTotallyReal_maximalRealSubfield` and the maximality statement
`NumberField.IsTotallyReal.le_maximalRealSubfield` (same file);
`NumberField.IsCMField`, `NumberField.IsCMField.ofCMExtension` and
`NumberField.CMExtension.eq_maximalRealSubfield`, which identifies a totally real subfield E with
K/E quadratic and K totally complex as the maximal real subfield
(`Mathlib/NumberTheory/NumberField/CMField.lean`); `IsCyclotomicExtension`
(`Mathlib/NumberTheory/Cyclotomic/Basic.lean`) and `IsCyclotomicExtension.Rat.isCMField`
(nontrivial cyclotomic extensions of ℚ are CM). These supply the Checks of §1.1; the relative
statements of §1.1 over an arbitrary base are proved here.

### From Tau Ceti

At `2fd255d997f47c0b5d834ee416c7015d55444ce5`: `WeierstrassCurve.tateModuleGaloisRepresentation`
(`TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean`), the integral Tate
representation of an elliptic curve; `TauCeti.det_tateModuleGaloisRepresentation`
(`.../TateModule/Determinant.lean`), its determinant is the cyclotomic character for a
separably closed extension in which ℓ is invertible; `WeierstrassCurve.quadraticTwistOf`,
`WeierstrassCurve.quadraticTwist`, `WeierstrassCurve.quadraticTwistPointEquiv` and
`WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`
(`.../QuadraticTwist/Basic.lean`): the twist by a separable quadratic extension, its point
isomorphism over a splitting field, and Galois equivariance up to the quadratic character. The
last is consumed in §§1.2 and 1.6 through the Tate module and duality.

### From TauCetiRoadmap.ModularCurves (on main)

§0E, effective descent of projective relative curves with a compatibly descended relatively ample
line bundle, and of finite group actions. Used in §1.2 to descend the twisted covers, with the
canonical bundle as the polarization. Layers 3 and 5B, Drinfeld level structures and the
fixed-pairing full-level curves `Y(N,ζ)` for `N ≥ 3`, used in §2.3 at levels 5 and 15.

### From TauCetiRoadmap.EllipticCurves (on main)

Layer 4.5a (curve, equation and local minimal model comparisons) and Layer 5 (quadratic twists
and their Galois action). Used in §§1.2, 1.6, 4.1 and 4.2.

### From TauCetiRoadmap.JacobianChallenge (on main)

Layers D–F: the Jacobian `Pic⁰` of a smooth proper curve without a rational point and its
abelian-variety structure. Used for `J^δ_n = Pic⁰(C^δ_n)` in §§1.3–1.4.

### From TauCetiRoadmap.EllipticCurveModularityImaginaryQuadratic

The targets named under Scope and ownership, with their hypotheses: Layers 1–4 over an arbitrary
number field k and `t ∈ U(k)`; §5.1 over an arbitrary number field with geometric non-CM and its
finite exceptional set; §7.1 for the pairs `(m,ℓ) = (3,p), (3,5), (p,3)`; §7.4 for an arbitrary
number field k, a prime `p > max{100, 2[k:ℚ]+1}` outside the exceptional set of §5.1 over the
normal closure, a finite set of places containing those above 3p and nonempty local opens there,
with conclusions over `F = k(μ_{3p})`; §0.2 for every number field and `p ∈ {3,5}`.

### From TauCetiRoadmap.AutomorphicGaloisRepresentations

§3.10 `ρ_{π,ι}` with its good polynomials, twist formula
`ρ_{π⊗(χ∘det),ι} ≅ ρ_{π,ι} ⊗ χ_ι` for algebraic Hecke characters, coefficient conjugation and
uniqueness; §3.13 geometric characters and algebraic Hecke characters; §3.14 determinant, total
oddness and absolute irreducibility; §4.4 full Frobenius-semisimple Weil–Deligne comparison with
monodromy at every finite `v∤ℓ`, for every π of type `(k,w)`; §4.7 potential semistability and
the full Weil–Deligne comparison at every `v|ℓ`, without residual hypotheses.

### From TauCetiRoadmap.AutomorphicGaloisRepresentationsPartII

AG2.0: `IsAttached` and its uniqueness, twist and dual rules; the ℓ-adic character `r_{l,ι}(χ)`
of an algebraic Hecke character. AG2.P: the weak and strict predicates on the shared carrier, and
“Independent classical and Hilbert members”, identifying the Hilbert member normalized by
`X² − t_vX + q_vs_v` with the AG2 member.

### From TauCetiRoadmap.PotentialAutomorphyInfrastructure

§2.3 `soluble_base_change_and_descent`, part (2): for F totally real, `E/F` finite Galois soluble
with E totally real, a continuous `ρ : G_F → GL_n(ℚ̄_p)` with `ρ|G_E` irreducible and
`ρ|G_E ≅ r_ι(Π)` for a cuspidal regular algebraic Π of weight λ descends to a cuspidal regular
algebraic `π_F` of weight `λ_F` with `ρ ≅ r_ι(π_F)`, with all-place local compatibility. Used in
§4.1 with n = 2 and λ = 0.

### From TauCetiRoadmap.GL2AutomorphicRepresentationsAndTransfer

R16.2–R16.3 local Langlands for `GL₂`, newvectors, conductors (R16.3.5), Steinberg monodromy
(R16.3.2) and archimedean factors (R16.3.6); R16.4.4 strong multiplicity one; R16.6.3–R16.6.4
the conversion between Hilbert cohomological weights and the weight λ of AG2.0; R17.4.16
quadratic automorphic induction with its local parameters, central character, cuspidality
criterion and twisting; R17.5.14 solvable residual modularity over totally real fields in
parallel weight one.

### From TauCetiRoadmap.ArithmeticGaloisRepresentations

Layers 1–3 (continuous representations, stable lattices, Weil–Deligne representations, Artin
conductors); §4.1 complex conjugations and `GaloisRep.IsOdd`; §5.3 recognition by Frobenius
polynomials on a density-one set, `GaloisRep.iso_of_frobenius_charpoly_eq`; §§6.1–6.2 Tate
modules, Weil pairing and determinant, including `TateModule.residualRep`.

### From TauCetiRoadmap.InverseGaloisAndArithmeticFundamentalGroups

IG.2.4 Hilbert subsets and Hilbert irreducibility over number fields; IG.2.6 full-group
specialization; IG.2.7 Hilbert points with weak approximation. Used in §2.3.

### From TauCetiRoadmap.ModularCurvesPartII

§4.10 `fixedPairingGeometricConnectedness`: for `N ≥ 3` the fixed-pairing curve `Y(N,ζ)` is
geometrically connected. Used in §2.3 with N = 15.

### From TauCetiRoadmap.SmallRamificationAndAbelianVarietyBaseCases

§5.0d, the shared raw compatible-system carrier over an arbitrary number field and rank. The
systems of §1.3 populate it.

### From TauCetiRoadmap.PotentialModularityAndCompatibleSystems

§1.1 the comparison of the weak-family predicate with its specializations; §1.6 the automorphy
predicate of a system by good Frobenius polynomials. Used in §2.1.

### From TauCetiRoadmap.AbelianSchemesAndArithmeticModuli

A4.1 the integral Tate module and its specialization at good reduction; A6 endomorphism actions on
realizations, in particular A6.11, the characteristic polynomial of an endomorphism on the Tate
module has integer coefficients independent of ℓ. Used in §§1.4, 2.2 and 4.3.

### From TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties

§3.10 semistable reduction after a finite extension; §5.1 Néron–Ogg–Shafarevich; §5.3 the
`p`-adic comparison at the residue prime; §5.6 the local Euler polynomial at bad places; §6.10 the
compatible system of an abelian variety. Used in §§1.4, 2.2 and 4.2.

### From TauCetiRoadmap.FaltingsFinitenessAndIsogenyTheorems

R28.4 semisimplicity of the rational Tate representation of an abelian variety over a number
field. Used in §1.4.

### From TauCetiRoadmap.ShimuraVarieties

§5.3 CM abelian varieties with their algebra action, and the field of definition of CM
endomorphisms. Used in §4.3.

### From TauCetiRoadmap.EtaleCohomologyFoundations

§0.11 the trace and duality of a smooth proper curve, giving the cup-product pairing into
`H² ≅ ℚ̄_ℓ(−1)`. Used in §1.4.

### Required of GL2ModularityLifting: the Breuil–Diamond weight-two lifting theorem

GL2ModularityLifting §5.7 needs strong residual modularity, matching ordinary components and
residue field `𝔽_p` at its nonordinary places; §5.10 needs every place above p nonordinary with
residue field `𝔽_p`. Both need potentially Barsotti–Tate representations, so neither covers
potentially multiplicative places above p or mixed local types. Layer 5 of GL2ModularityLifting
must add, after §5.10, the following theorem, used in §2.2. Let F be totally real, ℓ an odd prime
and `r : G_F → GL₂(ℚ̄_ℓ)` continuous and unramified outside finitely many places, with
`det r = ε_ℓ⁻¹ψ` for a finite-order ψ and with r potentially semistable of labelled Hodge–Tate
weights `{0,1}` at every `v|ℓ`. Suppose `r̄` is residually modular and `r̄|G_{F(ζ_ℓ)}` is
absolutely irreducible. When ℓ = 5, suppose also either that the projective image of
`r̄(G_{F(ζ₅)})` is not `PSL₂(𝔽₅)`, or that `det r̄ = ε̄₅⁻¹`. Then r is modular. No condition
relates the local types of r at places above ℓ to those of the residual witness.
This is the universal modularity conclusion of [BD14](#references), Théorème 3.2.2, pp.36–37
(BD14 line 2144 and line 2171), proved from Gee's prescribed-type lifts and the ordinary lifts of
[BLGG12](#references), Theorems 6.1.5 and 6.1.8 (BLGG12 line 2024 and line 2198), and
[BLGG13II](#references), Theorems 2.1.2 and 3.1.2 (BLGG13II line 82 and line 149), with
[Kisin09](#references), Theorem (3.5.5) (Kisin09 line 3976). The cyclotomic-determinant clause at
five is [FLHS15](#references), §2, pp.5–6 (FLHS15 lines 241–265): if the projective image were
`PSL₂(𝔽₅)` with `ζ₅` in the projective kernel field, the determinant would force `√5 ∈ F`, and
`Gal(F(ζ₅)/F)` of order two would be a quotient of the simple group `A₅`. Skinner–Wiles'
residually reducible theorems ([SW99](#references), Theorem A, and Theorem B under Hypothesis H)
do not supply this statement.

### Required of GL2AutomorphicRepresentationsAndTransfer: solvable residual modularity in cohomological weight

R17.5.14 produces a parallel-weight-one witness and states that weight-two lifts are separate
inputs. R17.5 must add, after R17.5.14, the following statement, used in §2.4. Let F be totally
real, p an odd prime and `r̄ : G_F → GL₂(𝔽̄_p)` continuous, absolutely irreducible and totally odd
with solvable image. Then `r̄` is residually modular in the sense of the Conventions: it is the
semisimplified reduction of `ρ_{π₀,ι}` for a cuspidal `π₀` of a cohomological type, all `k_τ ≥ 2`.
A route passes from the Langlands–Tunnell weight-one witness of R17.5.14 to an ordinary
parallel-weight-two form after a soluble totally real base change unramified above p, by Hida
theory, as in the proof of [BLGG13II](#references), Theorem 3.1.1, p.3 (BLGG13II lines 126–145);
the elliptic case is [FLHS15](#references), Theorem 6, p.9 (FLHS15 line 404).

## How to read the build

Layer 1 works over an arbitrary number field k and a parameter `t ∈ U(k)`. It constructs the real
cyclotomic subfield L, the reflection twist of the imported covers over L, the descended
character systems `W_θ`, their integral lattices and congruences, and their two elliptic
endpoints. Layer 2 proves the totally real tools: change of coefficient prime, the weight-two
lifting theorem for rank-two summands of abelian varieties, and the elliptic seeds at three and
five. Layer 3 fixes a non-CM curve over a totally real K, chooses one auxiliary prime p and one
parameter t satisfying every residual condition over L, makes the cubic piece modular through
the seed, and lifts three times. Layer 4 descends to K, removes the twists, compares all local
factors, adds the CM branch and states the endpoint. Each target lists in its *Needs:* line what
its statement and its route use.

## Layer 1: Reflection descent over the real cyclotomic subfield

### 1.1 The real cyclotomic subfield over a base

For a number field k and an integer `n ≥ 3`, choose a primitive n-th root of unity ζ in `k̄` and
define the **real cyclotomic data** `(M, L, δ)` of `(k, n)`: `M = k(μ_n)`, `L = k(ζ + ζ⁻¹)`, and
`δ : G_L → {±1}` the character with `g(ζ) = ζ^{δ(g)}`. Prove the following.

- L does not depend on the choice of ζ: for a unit a modulo n, `ζ^a + ζ^{−a}` is a polynomial with
  integer coefficients in `ζ + ζ⁻¹`.
- `M = L(ζ)` and `[M:L] ≤ 2`, since ζ is a root of `X² − (ζ+ζ⁻¹)X + 1`. Every `g ∈ G_L` acts on
  all of `μ_n(k̄)` by `x ↦ x^{δ(g)}`; δ is the character of `M/L` and is trivial exactly when
  `M = L`.
- `M/k` and `L/k` are abelian.
- If k is totally real, then L is totally real, `[M:L] = 2`, M is a CM field with
  `L = maximalRealSubfield M`, and `δ(c) = −1` for every complex conjugation `c ∈ G_L`.
- If k is totally real and ℓ is an odd prime dividing n, then `L(μ_ℓ) = M`.

([LeHung26](#references), §3.2, p.6, LeHung26 line 237.)

*Needs:* Mathlib `NumberField.IsTotallyReal`, `NumberField.maximalRealSubfield`,
`NumberField.IsCMField.ofCMExtension`, `NumberField.CMExtension.eq_maximalRealSubfield`,
`IsCyclotomicExtension`.

**API.**

- The data are unchanged when ζ is replaced by another primitive root.
- δ is trivial on `G_M` and factors through `Gal(M/L)`.
- For a finite extension `k′/k` the data of `(k′, n)` are the composita `k′L` and `k′M`, and δ
  restricts.
- For d dividing n, the data of `(k, d)` are subfields of those of `(k, n)`, and the two
  characters agree on `G_L` where both are defined.
- For k totally real, L agrees with Mathlib's maximal real subfield of M and M is CM in Mathlib's
  sense.

**Checks.**

- For k = ℚ and n = 3: `ζ₃ + ζ₃⁻¹ = −1`, so L = ℚ and `M = ℚ(√−3)`, with δ the character of
  `ℚ(√−3)`. Defining L as `k(ζ)` would give L = M and trivial δ.
- For k = ℚ and n = 9, `2cos(2π/9)` is a root of `x³ − 3x + 1` and L is cubic; for n = 15,
  `[L:ℚ] = φ(15)/2 = 4` and L contains `√5`.
- Degenerate case: for `k = ℚ(√−3)` and n = 3, `M = L = k` and δ is trivial; the fourth item
  needs k totally real.
- Non-example: for `k = ℚ(i)` and n = 3, L = `ℚ(i)` while the maximal real subfield of
  `M = ℚ(ζ₁₂)` is `ℚ(√3)`, which does not contain k. Outside the totally real case L is not the
  maximal real subfield.
- For n = 1 or 2, `ζ + ζ⁻¹ = ±2` and `L = M = k`; the hypothesis `n ≥ 3` is needed for
  `[M:L] = 2`.

### 1.2 The reflection twist

Fix a number field k, an elliptic `E: y² = h(x)` over k, an odd `n ≥ 3`, a parameter
`t ∈ U(k)` for EllipticCurveModularityImaginaryQuadratic §1.1 `switchParameterOpen`, and the real
cyclotomic data of §1.1. For `m|n` with `m > 1`, let `C_m = C_m(t)` be §1.3 `cyclicCover m` of that
roadmap, with reflection w defined over k and rotations `u_ζ` defined over `k(μ_m) ⊆ M`,
satisfying `w² = 1` and `w u_ζ w = u_{ζ⁻¹}`. Construct the **reflection twist** `C^δ_m`: the twist
of `C_m ⊗_k L` by the cocycle `g ↦ w^{e(g)}`. It is a smooth proper geometrically connected curve
of genus m over L with an isomorphism `φ : C^δ_m ⊗_L M → C_m ⊗_k M` satisfying `φ ∘ ᵍφ⁻¹ = w^{e(g)}`.
For m = 1 put `C^δ_1 = B^δ_t`, the quadratic twist of `B_t ⊗_k L` by δ. Prove:

1. `g ↦ w^{e(g)}` is a cocycle, because w is k-rational and `w² = 1`; the twist exists and is
   unique up to unique isomorphism compatible with φ. The descent datum on `C_m ⊗ M` relative to
   `M/L` is effective because the canonical bundle is ample (genus `m ≥ 3`) and every
   automorphism carries a canonical isomorphism of it.
2. The transported rotations `u′_ζ = φ⁻¹u_ζφ` and reflection `w′ = φ⁻¹wφ` are defined over L and
   satisfy the same relations. Indeed `ᵍu′_ζ = φ⁻¹ w^{e(g)} u_{g(ζ)} w^{e(g)} φ = u′_ζ`.
3. The quotient maps `C_n → C_m` twist to L-morphisms `C^δ_n → C^δ_m` compatible with rotations
   and reflection.
4. `C^δ_m/⟨u′⟩ ≅ B^δ_t` over L, because w induces `[−1]` on `B_t`; and
   `C^δ_3/⟨w′⟩ ≅ D_t ⊗_k L` for `D_t = C_3(t)/⟨w⟩`, because w acts trivially on that quotient.
5. For every prime ℓ, `φ^*` is an isomorphism `H¹(C_{m,L̄}, ℤ_ℓ) → H¹(C^δ_{m,L̄}, ℤ_ℓ)` carrying
   `u_ζ^*` to `u′_ζ^*` and `w^*` to `w′^*`, under which `g ∈ G_L` acts on the source by
   `(w^*)^{e(g)}ρ(g)`.

([LeHung26](#references), §3.2, (9) and Lemma 3.2 with proof, p.6, LeHung26 lines 237–240 and
line 245.)

*Needs:* §1.1; EllipticCurveModularityImaginaryQuadratic §§1.1–1.3; ModularCurves §0E;
EllipticCurves Layer 5; Tau Ceti `WeierstrassCurve.quadraticTwist`; JacobianChallenge Layers D–F.

**API.**

- If δ is trivial, the twist is `C_m ⊗_k L` with `φ` the identity.
- Formation commutes with finite extensions `L′/L`, transporting φ.
- The twisted quotient maps compose as in EllipticCurveModularityImaginaryQuadratic §1.3, with
  `d | m | n`.
- The Jacobian `J^δ_m = Pic⁰(C^δ_m)` is an abelian variety over L of dimension m on which
  `u′` and `w′` act by L-endomorphisms.
- Base change of `C^δ_m` to M is identified with `C_m ⊗ M` through φ, compatibly with rotations,
  reflection and quotients.

**Checks.**

- Matrix witness of the descent identity: `R = [[0,−1],[1,−1]]` has order three and
  `W = [[0,1],[1,0]]` has `WRW = [[−1,1],[−1,0]] = R⁻¹`. Hence `WR⁻¹W = R`: conjugating the
  Galois image `R⁻¹` of a rotation by the reflection returns R. Without the twist the Galois image
  `R⁻¹ ≠ R` shows the rotations are not L-rational.
- For `k = ℚ(√−3)` and n = 3, δ is trivial and the twist is `C_3 ⊗ L` itself.
- A cocycle with values in the rotations cannot replace w: rotations commute, so conjugating
  `u_{ζ⁻¹}` by a rotation leaves `u_{ζ⁻¹}`, and the rotations stay non-rational over L.
- On `H¹(B_t)` the reflection acts by `[−1]^* = −1`, so the m = 1 case is the quadratic twist.
  The convention witness for `y² = x³ − x + 1` at 5, traces `−2` and `2`, fixes the sign rule.

### 1.3 The descended character systems

For a character `θ : μ_n → M₀^×` and a prime ℓ, define the **descended character system**
`W_{θ,ℓ} ⊆ H¹(C^δ_{n,L̄}, ℚ̄_ℓ)` as the θ-eigenspace of the L-rational rotations:
`u′^*_ζ x = j_ℓ(θ(ζ))x` for all ζ. It is `G_L`-stable. Populate the shared raw carrier of
SmallRamificationAndAbelianVarietyBaseCases §5.0d over L with coefficient field `M₀`, the finite
set S of places of L where `J^δ_n` has bad reduction together with the places above n, the good
polynomials of §1.4, and these members.

([LeHung26](#references), Lemma 3.2, p.6, LeHung26 line 241.)

*Needs:* §1.2; EllipticCurveModularityImaginaryQuadratic §4.1 `characterSystem θ`;
SmallRamificationAndAbelianVarietyBaseCases §5.0d.

**API.**

- `φ^*` restricts to a `G_M`-equivariant isomorphism from `V_{θ,ℓ}` of
  EllipticCurveModularityImaginaryQuadratic §4.1, at t over `F = M`, onto `W_{θ,ℓ}|G_M`.
- `w′^*` maps `W_θ` onto `W_{θ⁻¹}` and is `G_L`-equivariant, so `W_θ ≅ W_{θ⁻¹}` over L.
- `W_θ` is the image of the idempotent `e_θ = n⁻¹ Σ θ(ζ)⁻¹ u′^*_ζ` of `M₀[U′] ⊆ End_L(J^δ_n) ⊗ M₀`,
  hence a summand of `H¹` of an abelian variety over L.
- For `d | n` and θ of order dividing d, pullback along `C^δ_n → C^δ_d` identifies the θ-part of
  `H¹(C^δ_d)` with `W_θ`, rationally.
- Coefficient extension and change of the embedding `j_ℓ` transport the eigenspace with the fixed
  label θ.

**Checks.**

- For n = 3, `H¹(C^δ_3)` has dimension six, split into three two-dimensional pieces `W_1`,
  `W_η`, `W_{η⁻¹}`.
- θ = 1 gives `W_1 = H¹(B^δ_t)`, of rank two, not a trivial or one-dimensional representation.
- Non-example: inducing `V_θ` from `G_M` to `G_L` gives a rank-four representation; the twist is
  what produces a rank-two `G_L`-representation.
- For ℓ dividing n the eigenspace is still taken with characteristic-zero coefficients; the
  integral statement is §1.5 and uses no integral projector.

### 1.4 Determinant, weights, compatibility and total oddness

Prove: for every θ and ℓ, `W_{θ,ℓ}` is a semisimple two-dimensional representation of `G_L` with
`det W_{θ,ℓ} = ε_ℓ⁻¹`, potentially semistable at every `v|ℓ` with labelled Hodge–Tate weights
`{0,1}`, and crystalline at every `v|ℓ` outside S. Outside S and away from ℓ it is unramified, and
the characteristic polynomial of geometric Frobenius is `j_ℓ(P_{θ,v})` for a polynomial
`P_{θ,v} ∈ M₀[X]` independent of ℓ; the system satisfies the weak predicate of
AutomorphicGaloisRepresentationsPartII AG2.P. If k is totally
real, `W_θ` is totally odd: `det W_θ(c) = −1` for every complex conjugation c.

For the determinant use `[x,y]_θ = ⟨x, w′^*y⟩`, with `⟨,⟩` the cup product into
`H²(C^δ_{n,L̄}) ≅ ℚ̄_ℓ(−1)`. Rotations preserve the cup product, so it pairs `W_θ` perfectly with
`W_{θ⁻¹}`; w′ and the cup product are L-rational, so `[,]_θ` is a perfect `G_L`-equivariant
pairing, alternating since `⟨y, w′^*x⟩ = ⟨w′^*y, x⟩ = −⟨x, w′^*y⟩`. Weights and potential
semistability are unchanged by restriction to the open subgroup `G_M` and hold there by
EllipticCurveModularityImaginaryQuadratic §4.1 `character_system_properties`. Semisimplicity
holds for `H¹(J^δ_n)` by Faltings and passes to the summand. For the polynomials, at `v ∉ S` the
traces of `Frob_v ∘ u′^*_ζ` on `H¹` are those of an endomorphism of the reduction of `J^δ_n`, hence
integers independent of ℓ. Oddness is `ε_ℓ⁻¹(c) = −1`.

([LeHung26](#references), Lemma 3.2 and proof, p.6, LeHung26 lines 241–242 and 247–248;
[OpenAI26](#references), Proposition 5.1 and proof, pp.12–13, OpenAI26 line 480.)

*Needs:* §1.3; EtaleCohomologyFoundations §0.11; EllipticCurveModularityImaginaryQuadratic §4.1
`character_system_properties`; FaltingsFinitenessAndIsogenyTheorems R28.4;
AbelianSchemesAndArithmeticModuli A4.1 and A6.11; NeronModelsAndSemistableAbelianVarieties §§5.1
and 5.3; AutomorphicGaloisRepresentationsPartII AG2.P; ArithmeticGaloisRepresentations §4.1.

**Checks.**

- The cup product alone pairs `W_θ` with itself to zero when `θ² ≠ 1`, as for θ of order 3 or p;
  inserting `w′` is what makes the pairing on `W_θ` perfect.
- `W_1 ≅ H¹(B_t)|G_L ⊗ δ` (§1.6) has determinant `ε_ℓ⁻¹δ² = ε_ℓ⁻¹`, value `−1` at c: the
  quadratic twist does not spoil oddness.
- For `k = ℚ(√−3)` there are no real places and oddness is vacuous; the statement asserts it
  only for totally real k.
- A member with determinant `ε_ℓ` (Tate-module convention) or weights `{0,2}` is excluded; the
  cup-product target has weight one, matching `0 + 1`.

### 1.5 Integral lattices and the congruence chain

Fix ℓ and a finite extension of `ℚ_ℓ` whose integers O contain `j_ℓ(M₀)`, with maximal ideal 𝔪
and residue field `κ`. Define `T^δ_θ = H¹(C^δ_{n,L̄}, ℤ_ℓ) ⊗_{ℤ_ℓ[U′], θ} O`. Prove that `T^δ_θ`
is a free O-module of rank two, stable under `G_L`, whose rationalization is `W_{θ,ℓ}`; and that if
θ and θ′ have equal reductions as characters `μ_n → κ^×`, then `T^δ_θ/𝔪 ≅ T^δ_{θ′}/𝔪` as
`κ[G_L]`-modules. This includes ℓ dividing n. Consequently, for n = 3p with `p > 3` prime, η of
order 3, ψ of order p and `χ = ηψ`,

```text
W_η ≡_p W_χ ≡_3 W_ψ ≡_p W_1     over L,
```

and also `W_η ≡_3 W_1`. Freeness is §1.2(5) applied to
EllipticCurveModularityImaginaryQuadratic §3.1 `integral_regular_module_etale`; `G_L` acts
`ℤ_ℓ[U′]`-linearly because the rotations are L-rational, so it acts on the evaluation quotient.

([LeHung26](#references), Lemma 3.2, (10) and proof, p.6, LeHung26 line 243 and lines 246–247;
[OpenAI26](#references), Lemma 5.3, p.13, OpenAI26 line 547, and Corollary 5.4, p.14, OpenAI26
line 571.)

*Needs:* §§1.2–1.4; EllipticCurveModularityImaginaryQuadratic §3.1
`integral_regular_module_etale`, §4.3 `characterLattice θ`, §4.4 `prime_switch_congruences`;
ArithmeticGaloisRepresentations Layer 1.

**Checks.**

- At ℓ = 3 dividing n = 3p the group ring `ℤ₃[μ_{3p}]` is not semisimple modulo 3; freeness comes
  from the regular module and no division by 3 occurs.
- Modulo 3 the cubic character reduces to 1, so `W_η ≡_3 W_1`, that is
  `H¹(A_t) ≡ H¹(B_t) ⊗ δ` modulo 3 over L. This agrees with the source's remark that `H¹(A_t)` is
  always congruent modulo 3 to a quadratic twist of E (LeHung26 lines 136–138), and is why three
  cannot be the seed prime.
- Reversing the primes fails: modulo 3, `χ̄ = ψ̄ ≠ 1 = η̄`, so `W_χ ≡_3 W_ψ` and not `W_η`.
- On the untwisted lattice `H¹(C_n) ⊗_θ O` the group `G_L` does not act, since it permutes θ and
  `θ⁻¹`; the twist is what makes the lattice `G_L`-stable.

### 1.6 The two elliptic endpoints

Prove: for every order-three η and every ℓ, `W_η ≅ H¹(A_t)|G_L`, where `A_t` is
EllipticCurveModularityImaginaryQuadratic §4.2 `auxiliaryEllipticCurve`, the elliptic curve
`Pic⁰(D_t)` over k; and `W_1 ≅ H¹(B_t)|G_L ⊗ δ`. Since `B_t: h(t)y² = h(x)` is the quadratic twist
of E by `h(t)`, `H¹(E)|G_L ≅ W_1 ⊗ δ ⊗ χ_{h(t)}` with `χ_{h(t)}` the character of `k(√h(t))/k`.
These isomorphisms are rational and compatible with the coefficient embeddings.

For the first, pull back along `C^δ_n → C^δ_3`, take `w′`-invariants of `H¹(C^δ_3)`, identify them
with `H¹(D_t ⊗ L)` by §1.2(4), and project `x + w′^*x ↦ x` onto the η-part, which is
`G_L`-equivariant. For the second, `W_1 = H¹(C^δ_n/U′) = H¹(B^δ_t)`, and the quadratic twist by δ
multiplies the Galois action by δ.

([LeHung26](#references), Lemma 3.2, (11) and proof, p.6, LeHung26 line 244 and lines 248–249;
[OpenAI26](#references), Proposition 5.2, p.13, OpenAI26 line 521.)

*Needs:* §§1.2–1.4; EllipticCurveModularityImaginaryQuadratic §4.2 `character_order_quotient`,
`trivial_character_twist`, `auxiliaryEllipticCurve`, `cubic_character_elliptic`; EllipticCurves
Layer 5; Tau Ceti `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map`;
ArithmeticGaloisRepresentations §6.1.

**Checks.**

- `H¹(C^δ_3)^{w′}` has dimension two: `W_1` contributes nothing because `w′ = −1` there, and the
  four-dimensional `W_η ⊕ W_{η⁻¹}` contributes two.
- At a place v of L inert in `M/L`, `δ(Frob_v) = −1` and the traces of `W_1` and `H¹(B_t)` at
  `Frob_v` differ by sign. Omitting δ would make Layer 4 produce the twist of E by δ rather than E.
- Pullback followed by norm is multiplication by the degree, 3 or p; the comparisons are
  rational, and the congruences of §1.5 are applied only after semisimplification.
- `W_η ≅ W_{η⁻¹}` through `w′^*`, consistent with both being `H¹(A_t)|G_L`.

### Examples

For K = ℚ and p = 101, n = 303 and `L = ℚ(ζ₃₀₃)⁺` has degree `φ(303)/2 = 100`; M is the full
cyclotomic field. The four systems `W_η, W_χ, W_ψ, W_1` are totally odd over this totally real
field, while `V_η, V_χ, V_ψ, V_1` live only over M. The quotient exponents of the tower are as in
EllipticCurveModularityImaginaryQuadratic §1.3: `C_303 → C_3` by `Y ↦ Y^{101}` and `C_303 → C_101`
by `Y ↦ Y³`; they are twisted by the same cocycle.

### Dependencies

EllipticCurveModularityImaginaryQuadratic Layers 1–4 supply the covers, the integral marking and
the untwisted systems. ModularCurves §0E supplies descent of the twisted curves; JacobianChallenge
Layers D–F the Jacobians; EllipticCurves Layer 5 and Tau Ceti the quadratic twists;
EtaleCohomologyFoundations §0.11 the cup product; FaltingsFinitenessAndIsogenyTheorems R28.4,
AbelianSchemesAndArithmeticModuli A4.1 and A6.11 and NeronModelsAndSemistableAbelianVarieties §5.1
semisimplicity and compatibility; SmallRamificationAndAbelianVarietyBaseCases §5.0d and
AutomorphicGaloisRepresentationsPartII AG2.P the carrier and its predicate; Mathlib the field
statements.

## Layer 2: Totally real lifting and the elliptic seed

### 2.1 Change of coefficient prime

Let F be totally real and R a weakly compatible rank-two system over F on the shared carrier, with
coefficient field `M₀`, embeddings `j, j_ℓ` and semisimple members `R_ℓ`. Prove: if
`R_{ℓ₀} ≅ ρ_{π,ι₀}` for one prime `ℓ₀`, a coefficient isomorphism `ι₀` with `ι₀ ∘ j_{ℓ₀} = j` and a
cuspidal π of type `(2,0)`, then `R_ℓ ≅ ρ_{π,ι}` for every ℓ and every ι with `ι ∘ j_ℓ = j`.
In particular modularity of an elliptic curve over F does not depend on ℓ, and the systems `W_θ`
of §1.3 are modular at one prime exactly when they are modular at every prime, with fixed labels.

At almost every v, `j(P_v) = X² − t_vX + q_vs_v` by the hypothesis at `ℓ₀`; both `R_ℓ` and
`ρ_{π,ι}` then have this polynomial after ι, and recognition on a density-one set with
semisimplicity gives the isomorphism. Equivalently R is automorphic in the sense of
PotentialModularityAndCompatibleSystems §1.6.

([LeHung26](#references), §2.4, p.5, LeHung26 lines 221–224.)

*Needs:* §1.4 (for the application to `W_θ`); AutomorphicGaloisRepresentations §§3.10 and 3.14;
ArithmeticGaloisRepresentations §5.3 `GaloisRep.iso_of_frobenius_charpoly_eq`;
PotentialModularityAndCompatibleSystems §§1.1 and 1.6; SmallRamificationAndAbelianVarietyBaseCases
§5.0d.

**Checks.**

- Semisimplicity is needed: a nonsplit extension of `ε_ℓ⁻¹` by 1 and the sum `1 ⊕ ε_ℓ⁻¹` have the
  same Frobenius polynomials and are not isomorphic.
- For 11a1 the polynomial `X² + X + 3` at 3 is the same for every `ℓ ≠ 3`, matching
  `t₃ = −1, s₃ = 1`.
- Labels: for p ≥ 5, replacing ψ by `ψ²` at one prime changes the system to a Galois conjugate and
  breaks the comparison, whereas replacing ψ by `ψ⁻¹` is harmless because `W_ψ ≅ W_{ψ⁻¹}` over L
  (§1.3).

### 2.2 Weight-two lifting for summands of abelian varieties

Let L be totally real, ℓ an odd prime, A/L an abelian variety, and e an idempotent of
`End_L(A) ⊗_ℤ ℚ̄`, acting on `H¹(A_L̄, ℚ̄_ℓ)` through a fixed embedding `ℚ̄ → ℚ̄_ℓ`. Suppose
`r = e·H¹(A_L̄, ℚ̄_ℓ)` has dimension two, determinant `ε_ℓ⁻¹` and labelled Hodge–Tate weights
`{0,1}` at every embedding. Prove: if `r̄` is residually modular and `r̄|G_{L(ζ_ℓ)}` is absolutely
irreducible, then r is modular. No condition at places above ℓ is imposed, and ℓ = 5 is allowed
because `det r̄ = ε̄₅⁻¹`. The case A = E elliptic and e = 1 is [FLHS15](#references), Theorem 2.

The representation r is continuous and `G_L`-stable because e commutes with `G_L`; it is
unramified outside the places of bad reduction and those above ℓ by Néron–Ogg–Shafarevich; it is
potentially semistable at every `v|ℓ` as a subrepresentation of `H¹` of an abelian variety, which
acquires semistable reduction after a finite extension. Apply the Breuil–Diamond theorem required
of GL2ModularityLifting.

([LeHung26](#references), Proposition 3.1, p.6, LeHung26 line 231; [FLHS15](#references),
Theorem 2, p.3, FLHS15 line 116, and §2, pp.5–6, FLHS15 lines 221–265; [BD14](#references),
Théorème 3.2.2, pp.36–37, BD14 line 2144.)

*Needs:* GL2ModularityLifting, Layer 5, the Breuil–Diamond weight-two lifting theorem required
above; NeronModelsAndSemistableAbelianVarieties §§3.10, 5.1, 5.3 and 6.10;
AbelianSchemesAndArithmeticModuli A6; AutomorphicGaloisRepresentations §3.10.

**Checks.**

- ℓ = 2 is excluded: the residual determinant is 1 at complex conjugations and cannot detect
  oddness, and the supplied theorem needs `p > 2`.
- A potentially multiplicative place above ℓ is allowed, together with ordinary and supersingular
  places; GL2ModularityLifting §5.7 would instead need a potentially Barsotti–Tate r, a matching
  ordinary witness and residue field `𝔽_ℓ` at nonordinary places.
- The five-adic clause: `A₅ ≅ PSL₂(𝔽₅)` is simple of order 60 and has no quotient of order two, so a
  cyclotomic determinant excludes the exceptional case.
- Non-example: a summand with determinant `ε_ℓ⁻¹ψ` for a nontrivial finite-order ψ is outside this
  statement, though inside the supplier's theorem; a weight-one Artin representation, with weights
  `{0,0}`, is outside both.

### 2.3 The 3–5 switch curve over a number field

Prove: for every number field K and every elliptic E/K there is an elliptic E′/K with a
`G_K`-equivariant isomorphism `E[5] ≅ E′[5]` compatible with the Weil pairings, such that the
image of `G_K` on `E′[3]` contains `SL₂(𝔽₃)` in any basis. The j-invariants of such E′ form an
infinite set.

Let Y be the fixed-pairing twisted curve of `E[5]` from EllipticCurveModularityImaginaryQuadratic
§0.2 `fixed_pairing_twist`: its K-points classify pairs `(C, α)` with α a symplectic isomorphism
`E[5] ≅ C[5]`. The pair `(E, id)` is a K-point, and the completion is `ℙ¹_K` by
`fixed_pairing_twist_rational`. Since 5 ≥ 3 the moduli problem is fine, so Y carries a universal
elliptic curve, and the frames of its 3-torsion form a finite étale `GL₂(𝔽₃)`-torsor P → Y. Over
`K̄`, the frames of a fixed pairing value form the fixed-pairing curve of level 15, which is
connected; so geometric monodromy acts transitively on them and equals `SL₂(𝔽₃)`. A connected
component `P₀` of P is integral and finite étale over Y with group `H ⊇ SL₂(𝔽₃)`. Hilbert
irreducibility over K gives infinitely many `t ∈ Y(K)` whose fibre in `P₀` is connected; for them
`G_K` acts on `E_t[3]` through all of H. Take `E′ = E_t`.

([FLHS15](#references), Lemma 6.1 and its proof, p.10, FLHS15 line 421 and lines 430–452.)

*Needs:* EllipticCurveModularityImaginaryQuadratic §0.2 `fixed_pairing_twist` and
`fixed_pairing_twist_rational`; ModularCurves Layers 3 and 5B (level structures and the
Chinese-remainder splitting of full level 15); ModularCurvesPartII §4.10
`fixedPairingGeometricConnectedness`; InverseGaloisAndArithmeticFundamentalGroups IG.2.4, IG.2.6
and IG.2.7; ArithmeticGaloisRepresentations §6.2.

**Checks.**

- `|SL₂(𝔽₃)| = 24` divides neither the order 12 of a Borel subgroup of `GL₂(𝔽₃)` nor the orders 8
  and 16 of the normalizers of split and nonsplit Cartan subgroups: E′ has irreducible mod-3
  representation and is not CM.
- Over a field containing `ζ₃`, such as `ℚ(√−3)`, the determinant is trivial and the image is at
  most `SL₂(𝔽₃)`; asking for `GL₂(𝔽₃)` would be false.
- The cover of all frames of `E[3]` has `φ(3) = 2` geometric components; it is not an integral
  Hilbert datum. A component is used.
- Genus zero alone does not give a rational point; here `(E, id)` is one, so the completion is a
  projective line rather than an anisotropic conic.

### 2.4 The mod-three seed over a totally real field

Prove: let K be totally real and E/K elliptic. If `E[3]` is absolutely irreducible as a
representation of `G_{K(ζ₃)}`, then E is modular.

The residual representation `r̄` of `H¹(E)` modulo 3 is the dual of `E[3]`. It is absolutely
irreducible, totally odd because its determinant `ε̄₃⁻¹` is `−1 ≠ 1` at complex conjugations,
and has image in the solvable group `GL₂(𝔽₃)`. The solvable residual modularity required of
GL2AutomorphicRepresentationsAndTransfer makes it residually modular, and §2.2 with A = E, e = 1
and ℓ = 3 proves E modular.

([FLHS15](#references), Theorem 6 and Corollary 5.1, p.9, FLHS15 line 404 and line 411.)

*Needs:* §2.2; GL2AutomorphicRepresentationsAndTransfer R17.5.14 and the solvable residual
modularity in cohomological weight required above; ArithmeticGaloisRepresentations §§4.1 and
6.1–6.2.

**Checks.**

- Since the determinant is cyclotomic, the image of `G_{K(ζ₃)}` is the image of `G_K` intersected
  with `SL₂(𝔽₃)` ([FLHS15](#references), Proposition 4.1, p.8, FLHS15 line 343).
- If `E[3]` is irreducible over K but reducible over `K(ζ₃)`, the image lies in a Cartan
  normalizer (FLHS15 Lemma 4.2, FLHS15 line 355) and this statement does not apply.
- `GL₂(𝔽₃)` is solvable: `GL₂(𝔽₃) ⊃ SL₂(𝔽₃) ⊃ Q₈ ⊃ {±1} ⊃ 1`, of orders 48, 24, 8, 2, 1, with
  abelian quotients.

### 2.5 The mod-five seed over a totally real field

Prove: let K be totally real and E/K elliptic. If `E[5]` is absolutely irreducible as a
representation of `G_{K(ζ₅)}`, then E is modular.

Take E′ from §2.3. Its mod-three image on `G_{K(ζ₃)}` is the image on `G_K` intersected with
`SL₂(𝔽₃)`, which is `SL₂(𝔽₃)`; this group acts absolutely irreducibly, since the stabilizer in it
of a line over `𝔽̄₃` has order 6 for an `𝔽₃`-rational line and order dividing 4 otherwise, both
less than 24. By §2.4 E′ is modular, at every prime by §2.1, in particular at
five; the residual representation of `H¹(E)` modulo 5 is that of `H¹(E′)`, hence residually
modular. Apply §2.2 with A = E, e = 1 and ℓ = 5.

([FLHS15](#references), Theorem 3, p.3, FLHS15 line 127, and its proof for p = 5, p.10, FLHS15
lines 426–429.)

*Needs:* §§2.1–2.4.

**Checks.**

- 11a1 has a rational point of order five, so its mod-five representation is reducible and this
  statement says nothing about it; the theorem has no hypothesis at three.
- The seed is applied at five exactly once in this roadmap, in §3.2; the lifts of Layer 3 are at 3
  and `p > 100`.
- Over a totally real K, `ζ₅ ∉ K`; the cyclotomic-determinant argument of §2.2 therefore replaces
  any projective-image exclusion at five.

### Examples

Over a real quadratic field the three statements of §§2.3–2.5 are [FLHS15](#references), Lemma 6.1,
Corollary 5.1 and Theorem 3. Over ℚ, §2.5 with §2.3 is Wiles' 3–5 switch. The lifting statement
§2.2 is applied below to `A = J^δ_n` with `e = e_θ`, a summand that is not an elliptic curve.

### Dependencies

Layer 1 for the application of §2.1 to `W_θ`. GL2ModularityLifting supplies the lifting theorem
required of it; GL2AutomorphicRepresentationsAndTransfer R17.5.14 and the section required of it
supply solvable residual modularity. EllipticCurveModularityImaginaryQuadratic §0.2, ModularCurves
Layers 3 and 5B, ModularCurvesPartII §4.10 and InverseGaloisAndArithmeticFundamentalGroups IG.2
supply the switch curve. AutomorphicGaloisRepresentations §§3.10 and 3.14, ArithmeticGaloisRepresentations
§5.3 and PotentialModularityAndCompatibleSystems §§1.1 and 1.6 supply the change of prime.

## Layer 3: One specialization and three lifts over L

### 3.1 One parameter with every residual condition

Let K be totally real of degree d and E/K geometrically non-CM. Let `p > max{100, 2d+1}` be a
prime outside the finite exceptional set of EllipticCurveModularityImaginaryQuadratic §5.1 for E
over the normal closure of K, put n = 3p, and let `(M, L, δ)` be the data of §1.1 for `(K, n)`.
Prove that there is `t ∈ U(K)` such that, for the systems of §1.3 at t:

1. for every order-three η, `W̄_{η,p}` is absolutely irreducible on `G_{L(ζ_p)}`;
2. for every order-p ψ, `W̄_{ψ,3}` is absolutely irreducible on `G_{L(ζ₃)}`;
3. `W̄_{1,p}` is absolutely irreducible on `G_{L(ζ_p)}`;
4. the mod-five representation of `A_t` is absolutely irreducible on `G_{L(ζ₅)}`;
5. `A_t` is geometrically non-CM.

Apply EllipticCurveModularityImaginaryQuadratic §7.4 `simultaneous_specialization` with k = K,
S the places above 3p and `Ω_v = U(K_v)`, nonempty because U is a nonempty Zariski open of the
affine line. It gives these statements for `V_θ` on `G_{M(ζ_ℓ)}`, with M = `K(μ_{3p})`. Restriction
to `G_M` identifies `W_θ` with `V_θ` (§1.3); `L(ζ_ℓ) = M` for ℓ ∈ {3, p} (§1.1); and
`G_{M(ζ₅)} ⊆ G_{L(ζ₅)}`, while absolute irreducibility on a subgroup implies it on the group.

([LeHung26](#references), §3.3, pp.6–7, LeHung26 lines 250–260; [OpenAI26](#references),
Proposition 8.4, p.23, OpenAI26 line 990.)

*Needs:* §§1.1, 1.3 and 1.6; EllipticCurveModularityImaginaryQuadratic §5.1
`nonCM_elliptic_large_residual_primes`, §7.1 `character_geometric_irreducibility` and §7.4
`simultaneous_specialization`.

**Checks.**

- For the pair `(3,5)` the coefficient `c(λ) = 2 − λ − λ⁻¹` at a primitive cube root λ is 3, nonzero
  modulo 5; for `(p,3)` a failure would put λ of order p > 100 in `𝔽_{3^a}` with `a ≤ 4`, whose
  unit groups have order at most 80.
- `p > 100` excludes 3 and 5, so the three primes 3, 5 and p are distinct.
- Item 3 needs no condition on t: `E[p]` has image containing `SL₂(𝔽_p)` on the normal closure,
  `SL₂(𝔽_p)` is perfect for `p > 3`, and the abelian extension `K(μ_{15p})/K` preserves it; the
  quadratic twists by `h(t)` and δ change both eigenvalues by the same sign.
- Without the normal-closure choice of p, an image hypothesis over K alone does not give the joint
  conditions used by §7.4 for the d conjugate factors.

### 3.2 The auxiliary seed over L

Prove: at the parameter of §3.1, `A_t ⊗_K L` is modular, and `W_{η,ℓ}` is modular for every
order-three η and every ℓ.

By §3.1(4) and §2.5 over L, `A_t ⊗ L` is modular; §2.1 makes `H¹(A_t)|G_L` modular at every prime,
and §1.6 identifies it with `W_η`.

([LeHung26](#references), §3.4, p.7, LeHung26 line 264; [FLHS15](#references), Theorem 3, p.3,
FLHS15 line 127.)

*Needs:* §§1.6, 2.1, 2.5 and 3.1.

**Checks.**

- The seed is used over L, not over K: residual irreducibility of `A_t[5]` is only known on
  `G_{L(ζ₅)}`.
- Five plays no role in the chain: the congruences of §1.5 are at 3 and p.
- `W_η` and `W_{η⁻¹}` are both `H¹(A_t)|G_L`, so the two cubic characters give the same seed.

### 3.3 The three lifts

Prove: at the parameter of §3.1, `W_χ`, `W_ψ` and `W_1` are modular over L for every order-three η
and order-p ψ, with `χ = ηψ`. Apply §2.2 to `A = J^δ_n` and `e = e_θ` (§1.3), with the
determinant and weights of §1.4, changing the coefficient prime by §2.1 after each row:

| Source, modular | Prime | Target | Residual modularity | Cyclotomic irreducibility |
|---|---|---|---|---|
| `W_η` (§3.2) | p | `W_χ` | `W̄_χ ≅ W̄_η` by §1.5 | §3.1(1) |
| `W_χ` | 3 | `W_ψ` | `W̄_ψ ≅ W̄_χ` by §1.5 | §3.1(2) |
| `W_ψ` | p | `W_1` | `W̄_1 ≅ W̄_ψ` by §1.5 | §3.1(3) |

Each target's residual representation is absolutely irreducible, so its semisimplification is
itself and is the residual representation of the source's automorphic realization at a prime above
the row's prime.

([LeHung26](#references), §3.4 and its table, p.7, LeHung26 lines 264–269.)

*Needs:* §§1.3–1.5, 2.1, 2.2, 3.1 and 3.2.

**Checks.**

- The middle lift is at 3, not at the seed prime 5; omitting the change of prime after the first row
  would leave no modular realization at 3.
- No local condition at places above 3 or p is checked: supersingular, ordinary and multiplicative
  places above the lifting prime may occur in any combination.
- The prime 5 does not occur among the lifting primes, so the five-adic clause of §2.2 is not used
  here.

### Examples

For K a totally real quartic field containing `√5`, such as `ℚ(ζ₁₅)⁺`, nothing changes: the lifts
are at 3 and p, and the five-adic seed is over L with the cyclotomic-determinant argument.

### Dependencies

Layers 1 and 2; EllipticCurveModularityImaginaryQuadratic §§5.1, 7.1 and 7.4 for the parameter.

## Layer 4: Descent, all places, CM curves and the endpoint

### 4.1 Descent to the original curve

Prove: for K totally real and E/K geometrically non-CM, E is modular.

Choose p and t by §3.1. By §3.3 `W_1` is modular over L; twisting by the finite-order character δ
(AutomorphicGaloisRepresentations §3.10 twist formula) makes `H¹(B_t)|G_L` modular. Its residual
representation is absolutely irreducible on `G_M ⊆ G_L` by §3.1(3), so `H¹(B_t)|G_L` is
irreducible. `L/K` is abelian, hence Galois with soluble group, and both fields are totally real;
PotentialAutomorphyInfrastructure §2.3(2) descends to a cuspidal regular algebraic `π_K` over K of
weight zero with `H¹(B_t) ≅ r_ι(π_K)`, which is `ρ_{π_K,ι}` for type `(2,0)` by the AG2.P member
identification and the weight conversion R16.6.3–R16.6.4. Finally `H¹(E) ≅ H¹(B_t) ⊗ χ_{h(t)}`
(§1.6), so `π_K ⊗ (χ_{h(t)} ∘ det)` realizes `H¹(E)`.

([LeHung26](#references), §3.4, p.7, LeHung26 lines 270–271, and Lemma 5.1, p.9, LeHung26
lines 357–360.)

*Needs:* §§1.6, 3.1 and 3.3; PotentialAutomorphyInfrastructure §2.3
`soluble_base_change_and_descent`; AutomorphicGaloisRepresentationsPartII AG2.0 `IsAttached` and
AG2.P; AutomorphicGaloisRepresentations §3.10; GL2AutomorphicRepresentationsAndTransfer
R16.6.3–R16.6.4.

**Checks.**

- Descent needs irreducibility of the restriction: a representation induced from a quadratic
  subextension of `L/K` would have reducible restriction and several descents.
- At a quadratic step the two descents differ by the quadratic character; PotentialAutomorphyInfrastructure
  §2.3 selects the one matching `H¹(B_t)` itself, not merely its restriction.
- Twisting twice by `χ_{h(t)}` is the identity since `h(t) ≠ 0`; when `h(t)` is a square in K the
  character is trivial and `B_t ≅ E`.

### 4.2 All coefficient primes and all finite places

Let K be totally real, E/K elliptic and π a cuspidal representation of `GL₂(𝔸_K)` of type `(2,0)`
with `ρ_{π,ι₀} ≅ H¹(E)` for one `(ℓ₀, ι₀)`. Prove:

1. π has trivial central character and is unique up to isomorphism.
2. For every ℓ and every ι, `ρ_{π,ι} ≅ H¹(E_K̄, ℚ̄_ℓ)`.
3. For every finite `v∤ℓ`, `ι WD(H¹(E)|G_{K_v})^{F-ss} ≅ rec(π_v ⊗ |det|_v^{−1/2})`, monodromy
   included.
4. For every `v|ℓ`, `H¹(E)|G_{K_v}` is potentially semistable and its potentially semistable
   Weil–Deligne representation satisfies the same identity.
5. Every finite Euler factor agrees: `L_v(E,s) = L(s−1/2, π_v)` at good, multiplicative and
   additive places, and `L(E/K,s) = L(π, s−1/2)`; at each real place `π_τ` is the discrete series
   `D_{2,0}` and the archimedean factors agree, `Γ_ℂ(s)` on both sides.
6. The conductor exponent of `π_v` is the Artin conductor exponent of `WD(H¹(E)|G_{K_v})`, so the
   newvector of π has exact level the conductor `𝔫_E`.
7. At good v, `t_v = a_v(E) = q_v + 1 − #Ẽ(k_v) ∈ ℤ` and `s_v = 1`; the Hilbert newform has
   rational Hecke eigenvalues and π has field of rationality ℚ.
8. At a place of multiplicative reduction, monodromy is nonzero and `π_v` is the Steinberg
   representation twisted by an unramified character of order at most two, trivial exactly in the
   split case; at a place of additive potentially multiplicative reduction `π_v` is a ramified
   quadratic twist of Steinberg; at every additive place the local factor is 1.

The determinant `χ_{π,ι}ε_ℓ⁻¹ = ε_ℓ⁻¹` forces `χ_{π,ι} = 1`. Item 2 is §2.1 for the system of E,
with integer polynomials `X² − a_vX + q_v`. Items 3 and 4 are AutomorphicGaloisRepresentations
§§4.4 and 4.7 transported along item 2. Items 5–8 read off local Langlands, conductors and
newvectors.

([LeHung26](#references), §5, p.9, LeHung26 lines 361–363; [FLHS15](#references), §1, p.2,
FLHS15 lines 66–77.)

*Needs:* §2.1; AutomorphicGaloisRepresentations §§3.10, 3.14, 4.4 and 4.7;
AutomorphicGaloisRepresentationsPartII AG2.0; GL2AutomorphicRepresentationsAndTransfer R16.2,
R16.3.2, R16.3.5, R16.3.6 and R16.4.4; ArithmeticGaloisRepresentations Layers 2–3 and §6.2;
NeronModelsAndSemistableAbelianVarieties §§5.6 and 6.10.

**Checks.**

- 11a1 at 11: `a₁₁ = 1`, split multiplicative, `π₁₁` is the Steinberg representation with
  conductor exponent 1 and Euler factor `(1 − 11^{−s})⁻¹`; comparing only semisimplified Weil
  representations would lose N.
- `y² = x³ − x + 1` has discriminant `−368 = −2⁴·23` and `c₄ = 48`, a unit at 23, so it is
  multiplicative at 23 with nonzero N. Over `ℚ(√5)` the prime 23 is inert, since 5 is not a
  square modulo 23, and the reduction at the place of norm 529 is split.
- `y² = x³ − x` has conductor 32 and additive potentially good reduction at 2: local factor 1,
  conductor exponent 5. A good place has a degree-two factor, a multiplicative place degree one.
- The archimedean witness: `D_2` in unitary normalization has factor `Γ_ℂ(s + 1/2)`, and the shift
  `s ↦ s − 1/2` gives `Γ_ℂ(s)`, the Hodge factor of `H¹` with `h^{1,0} = h^{0,1} = 1`.

### 4.3 CM curves over a totally real field

Let K be totally real and E/K geometrically CM, with CM field T. Prove that `T ⊄ K`, that the
endomorphisms are defined over the CM field KT, and that `H¹(E)|G_{KT} = ψ_ι ⊕ ψ^c_ι` for an
algebraic Hecke character θ of KT with `ψ_ι = r_{ℓ,ι}(θ)` and `ψ ≠ ψ^c`. Then
`H¹(E) ≅ Ind_{G_{KT}}^{G_K} ψ_ι`, and the quadratic automorphic induction
`π_E = AI_{KT/K}(θ)`, unitarily normalized, is cuspidal of type `(2,0)` with trivial central
character and `ρ_{π_E,ι} ≅ H¹(E)`. In particular §4.2 applies.

T is imaginary quadratic and K has only real embeddings. The eigenspaces of `T ⊗ ℚ̄_ℓ` on `H¹` over
KT are finitely ramified de Rham characters, hence avatars of algebraic Hecke characters. At each
embedding of KT the two characters have different Hodge–Tate weights, 0 and 1, so `ψ ≠ ψ^c` and
the induction is cuspidal. The good polynomials of `AI(θ)` and of `Ind ψ` agree, and recognition
identifies the representations.

([LeHung26](#references), §5, p.9, LeHung26 lines 364–366.)

*Needs:* ShimuraVarieties §5.3; AbelianSchemesAndArithmeticModuli A6;
AutomorphicGaloisRepresentations §§3.10 and 3.13; AutomorphicGaloisRepresentationsPartII AG2.0;
GL2AutomorphicRepresentationsAndTransfer R16.2.13 and R17.4.16; ArithmeticGaloisRepresentations
§5.3; §4.2.

**Checks.**

- `y² = x³ − x` over ℚ has CM by `ℚ(i)`. At 3, inert, there are 4 points over `𝔽₃` and `a₃ = 0`,
  the trace of an induced representation at an inert Frobenius. At 5, split, there are 8 points,
  `a₅ = −2 = ψ + ψ̄` with `ψ = −1 ± 2i` of norm 5.
- `y² = x³ + 1` has CM by `ℚ(√−3)`; at 5, inert, there are 6 points and `a₅ = 0`.
- Over `K = ℚ(√2)` the curve `y² = x³ − x` uses induction from `ℚ(√2, i) = ℚ(ζ₈)`; over a totally
  real base the isobaric-sum branch never occurs. Over `ℚ(i)`, outside this roadmap, the same curve
  gives an isobaric sum.

### 4.4 The endpoint

Prove: for every totally real number field K and every elliptic curve E/K there is a cuspidal
automorphic representation `π_E` of `GL₂(𝔸_K)` of type `(2,0)`, with trivial central character
and unique up to isomorphism, such that `ρ_{π_E,ι} ≅ H¹_ét(E_K̄, ℚ̄_ℓ)` for every ℓ and every ι,
and all the local statements of §4.2 hold. In particular `L(E/K,s) = L(π_E, s−1/2)`, and the
Hilbert newform of `π_E` has rational Hecke eigenvalues and exact level `𝔫_E`. If E is
geometrically CM, `π_E` is the cuspidal induction of §4.3.

For non-CM E use §4.1, for CM E use §4.3, and then §4.2.

([LeHung26](#references), Theorem 1.1, p.2, LeHung26 line 86, with the geometric inputs proved by
EllipticCurveModularityImaginaryQuadratic Layers 1–4 and §7.4.)

*Needs:* §§4.1–4.3.

**Checks.**

- K = ℚ recovers [BCDT01](#references), Theorem A (BCDT01 line 15), and the endpoint of
  EllipticCurveModularity; the route here uses neither.
- Every real quadratic field ([FLHS15](#references), Theorem 1, FLHS15 line 87), every totally real
  cubic and quartic field, including quartic fields containing `√5`, and fields of every degree are
  covered without exclusions.
- A curve over `ℚ(√29)` with good reduction everywhere has `𝔫_E = (1)` and a level-one parallel
  weight-two Hilbert newform; this is the shape required by HilbertModularForms §11.3.

### Examples

For `E: y² = x³ − x + 1` over `K = ℚ(√5)`: j = `−6912/23` is not integral, so E is not CM, and the
route of §4.1 applies with any admissible p and t; the place above 23 is split multiplicative with
Steinberg `π_v`. For `y² = x³ − x` over the same K the route is §4.3.

### Dependencies

Layers 1–3; PotentialAutomorphyInfrastructure §2.3; AutomorphicGaloisRepresentations §§3.10–3.14,
4.4 and 4.7; AutomorphicGaloisRepresentationsPartII AG2.0 and AG2.P;
GL2AutomorphicRepresentationsAndTransfer R16.2–R16.6 and R17.4.16; ShimuraVarieties §5.3;
AbelianSchemesAndArithmeticModuli A6; NeronModelsAndSemistableAbelianVarieties §§5.6 and 6.10.

## Downstream consumers

- HilbertModularForms §11.3, the elliptic-curve interface, asks for a parallel-weight-two newform
  of exact level `𝔫_E`, trivial central character, rational coefficients and equality of every
  local factor, and names the real quadratic case as its existence input. Section 4.4 supplies this
  for every totally real field.
- ModularityAndLanglandsExtensions and its Part II consume elliptic modularity in their
  compatible-system, L-function and symmetric-power applications; §4.4 removes degree
  restrictions on the base field there.
- EllipticCurveModularityImaginaryQuadraticPartII treats CM bases with the same parent; the two
  roadmaps together cover every totally real and every CM field.
- The descended systems of Layer 1 and the summand lifting statement §2.2 apply to other families of
  covers with a reflection over a totally real field.

## Worked examples

- K = ℚ, p = 101: L = `ℚ(ζ₃₀₃)⁺` of degree 100; the chain runs over this field and descends along
  an abelian extension of degree 100.
- Over `ℚ(√5)` and over `ℚ(ζ₁₅)⁺` no √5-exclusion arises: five occurs only as the seed prime over
  L, where §2.2's cyclotomic-determinant clause applies.
- Additive, multiplicative and good places: `y² = x³ − x` at 2 (factor 1), 11a1 at 11
  (`(1 − 11^{−s})⁻¹`), and 11a1 at 3 (`(1 + 3^{−s} + 3^{1−2s})⁻¹`).

## References

All statements above are in our own words. Locators refer to the versions recorded in the sources
manifest; line references are to its line-numbered extractions.

- **LeHung26.** Bao V. Le Hung, *A geometric prime switch for elliptic curves over totally real
  and CM fields*, discussion draft, 7 October 2026, hexagon:2610.00156v1. Theorem 1.1, p.2;
  conventions, p.4; §§2.1–2.4, p.5; §3.1 Proposition 3.1, §3.2 Lemma 3.2 with (9)–(11), §3.3,
  pp.6–7; §3.4, p.7; §5 Lemma 5.1 and the compatibility and CM paragraphs, p.9. Its Theorem 1.1
  assumes the geometric inputs of OpenAI26; here they are the imported proved layers.
- **OpenAI26.** OpenAI, *Modularity of elliptic curves over imaginary quadratic fields*, 4 October
  2026, revision `adc7f1241b42e322a6451854ab7e4b4c146bf78a`. Proposition 5.1, p.12;
  Proposition 5.2 and Lemma 5.3, p.13; Corollary 5.4, p.14; Proposition 8.4, p.23. Used through
  EllipticCurveModularityImaginaryQuadratic.
- **FLHS15.** Nuno Freitas, Bao V. Le Hung and Samir Siksek, *Elliptic curves over real quadratic
  fields are modular*, arXiv:1310.7088v4 (Invent. Math. 201 (2015), 159–206). Theorem 1, p.2;
  Theorems 2–3, p.3; §2, pp.5–6; Proposition 4.1 and Lemma 4.2, p.8; Theorem 6 and Corollary 5.1,
  p.9; Lemma 6.1 and the proof of Theorem 3 for p = 5, p.10. Page numbers are those of v4.
- **BD14.** Christophe Breuil and Fred Diamond, *Formes modulaires de Hilbert modulo p et valeurs
  d'extensions galoisiennes*, arXiv:1208.5367v3 (Ann. Sci. ÉNS 47 (2014), 905–974). Théorème 3.2.2,
  pp.36–37, of v3.
- **Kisin09.** Mark Kisin, *Moduli of finite flat group schemes, and modularity*, Ann. of Math. 170
  (2009), 1085–1180. Theorem (3.5.5), p.1170; Theorem (3.5.7), p.1172.
- **BLGG12.** Thomas Barnet-Lamb, Toby Gee and David Geraghty, *Congruences between Hilbert modular
  forms: constructing ordinary lifts*, arXiv:1006.0466v1 (Duke Math. J. 161 (2012)). Theorem 6.1.5,
  pp.41–42; Theorem 6.1.8, p.44, of v1.
- **BLGG13II.** The same authors, *Congruences between Hilbert modular forms: constructing ordinary
  lifts, II*, arXiv:1205.4491v1 (Math. Res. Lett. 20 (2013)). Theorem 2.1.2, p.2; Theorems 3.1.1–3.1.2,
  pp.3–4, of v1.
- **BCDT01.** Christophe Breuil, Brian Conrad, Fred Diamond and Richard Taylor, *On the modularity of
  elliptic curves over Q: wild 3-adic exercises*, author version. Theorem A, p.1. A Check of the
  endpoint over ℚ.
- **SW99.** Christopher Skinner and Andrew Wiles, *Residually reducible representations and modular
  forms*, Publ. Math. IHÉS 89 (1999). Theorem A, §4.5, p.74; Theorem B, p.75, under Hypothesis H.
  Named in the supplier contracts as not supplying the totally real weight-two lifting theorem.
