# Repair dispositions

The first seven finding sections concern review `r2a`; the final five concern review `r2b`, retaining each review's original finding IDs. The earlier-round verification tables contain no additional findings. All twelve new findings are settled below; none is silently combined with another. The mathematical checks are recorded separately from Lean elaboration.

## F01 (P2) — applied

Missing signatures → `matrixHilbert90`, `specialLinearHilbert90`, `equivariantIcosahedralLift`, with explicit cocycle equations, discrete targets, Krull source topology, projectivization, injectivity, central sign and equivariance. Added the determinant-preserving definition `levelFiveConjugate`. Registered all names in §1.15 and corrected the module docstring. Evidence: SBT line 108 and SBT lines 115–122; the noncommuting matrix Check distinguishes coboundary order.

## F02 (P1) — applied

Integral self-Ext → self-Ext with middle object in `S[3]`. Repaired Conventions, supplier contracts, §§2.5, 2.8, the W3.3 introduction, §§3.6–3.7, 4.4–4.5, 5.6–5.7, and retained higher torsion in the integral categories. `3E[9]=E[3]≠0` excludes it from tangent Ext; dual-number deformations remain included. Evidence: BCDT line 1601; LocalGaloisDeformationRings §8.6.

## F03 (P2) — applied

Owned general BCDT lifting theorems and proof plan → import of GL2ModularityLifting §§5.14–5.15. Updated scope, exact contracts, build explanation, §6.5, its application in §6.8, the §6.9 proof reference and W3.6 dependencies. Hypotheses are preserved. Evidence: those supplier sections, with corrected proof inputs §§5.12–5.13; BCDT lines 719–733 and 767–781.

## F04 (P2) — applied

`M_c` tensored with a characteristic-zero integer ring → `k′⊗_{𝔽₃}M_c`, with `k′=𝔽₃` or `𝔽₉` according to the cubic sign. Updated the W3.3 standing scalars and §3.2, and added both scalar-field Checks. Integral base change remains for group schemes. Evidence: BCDT lines 2957–2959 and 2967–2974; a unital map from characteristic 3 to characteristic zero cannot exist.

## F05 (P2) — applied

Peu defined only for nonsplit extensions → membership in the unit Kummer line, including its zero class. Changed Conventions and §1.1; §3.2 explicitly includes the split parameter. The equivalences in §§3.4 and 5.2 now cover zero consistently. Added the zero, `[4]`, `[3]` test. Evidence: BCDT lines 3727–3729; their values are respectively `(peu,très)=(1,0),(1,0),(0,1)`.

## F06 (P3) — applied

Attribution of weak acceptability to LocalGaloisDeformationRings §3.12 → local definition in Conventions, by a continuous local one-variable power-series surjection or the zero branch. Corrected scope, both supplier descriptions, W3.0 introduction and dependencies. Added the zero branch and the relative-tangent examples of dimensions zero and two. Evidence: BCDT lines 436–439; the supplier's §3.12 supplies type quotients, without this predicate.

## F07 (P3) — applied

Zero-object and repeated semilinearity tests → nonzero operator-module positive tests and a nonzero-Frobenius sign test in §§2.6–2.7. No integral finite-flat lift is inferred. All descent, commutation, semilinearity and ideal relations were evaluated on all 81 vectors. The accepted nonzero-F model has zero failures; the wrong-sign values at `(0,1)` are `(2,0)` versus `(1,0)`.

## F01 (P2) — applied

Unqualified import of the twist over arbitrary `K` → a §1.15 construction for arbitrary paired `G_K` data, including the frame quotient, its functor of pairs, universal family, compactification, field extension and three Checks. ModularCurves §5C and ModularCurvesPartII §5.14 remain the rational-base suppliers. The latter's extension clause starts with `V_ρ/ℚ`; it does not cover arbitrary local representations. Evidence: SBT lines 90–101.

## F02 (P2) — applied

Claim that no native newform carrier exists → the native `HeckeRing.GL2.Newform` formulation `ellipticCurve_modular`. Built its actual pinned module, without a stand-in. Updated §6.13, supplier contracts and the module docstring. The README retains the full conductor and parametrisation theorem. Evidence: Tau Ceti `NumberTheory/ModularForms/Newforms/Newform.lean:84–110`; its eigenvalue field has precisely the coprime-index domain used here.

## F03 (P3) — applied

Identifier remnants → mathematical API prose in §§0.1–0.2, 1.6, 1.11–1.12, 2.1–2.4, 2.6–2.7 and 5.6. Also replaced the undeclared exceptional-isogeny target label in §6.11 by its prose description. The facts and hypotheses stay those of their surrounding numbered statements; no API padding was added to Lean. Each changed API is included in the statement ledger below.

## F04 (P3) — applied

§6.11's CDT range `554–555` → `554–556`; §6.12's `554–556` → `553–556`. Corrected the CDT manifest locator, including Theorem 7.2.4's designation. Evidence: CDT line 1631 (p. 553), CDT line 1658 (p. 554), CDT line 1752 (p. 556), CDT line 1765 (p. 556).

## F05 (P3) — applied

Undefined `R01.5` → ArithmeticGaloisRepresentations Layers 4, 5 and 6 in W3.6 dependencies. Its Layer 5 contains §5.1, density of Frobenius, and §§5.3–5.4, recognition, exactly as the existing supplier contract describes. No declaration or dependency direction changed.

## Verification outcomes

- The prescribed targeted build `lake build TauCeti.NumberTheory.ModularForms.Newforms.Newform`, from the content checkout, exited 0: `Build completed successfully (3653 jobs).` This supplied the missing object file before the acceptance elaboration.
- The prescribed absolute-path `lake env lean` invocation on `packages/EllipticCurveModularityWild3Adic/Suggested.lean`, from the content checkout, exited 0. Exactly ten warnings say `declaration uses 'sorry'`; there are no errors. The file has one `import Mathlib`, one actually used Tau Ceti import, six real-bodied definitions/abbreviations and ten headline theorems. It has no examples, option overrides or admitted data.
- One scratch file containing the acceptance text followed by `#check @name` for all 16 declarations elaborated once, exit 0, with the same ten expected warnings. Every elaborated type was compared with its README statement; no section binder was lost. In particular `1≤n`, continuity, the cocycle equations, `Field K`, `CharZero K`, projective faithfulness/equivariance, rational-fibre ellipticity, positive level, primality, coprimality and the discriminant condition are present. No binder repair was necessary.
- The dependency command requested in the brief exited 0, with the complete output:

```text
depcheck: 34 roadmaps, 314 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No merge-order file was changed.

- Citation resolution reports no missing cross-roadmap citation or Lean name, but its library-name check was unavailable. Library claims were therefore checked directly in the supplied pinned source trees. The initial `BarsottiTate.extend_genericFibre` lead resolves to FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.22, which explicitly states that supplier target; it was not a claim of an existing pinned declaration.
- No gate failures were supplied beyond the review findings and that citation lead. The CDT source record was corrected; the other nine legal-source records retain their keys and statuses. BBM remains uncertified and Serre remains waived. No additional source or missing-reference request was needed.

## Ownership and citation audit

The content main checkout and the two main roadmaps EllipticCurves and ModularCurves were read for shape and ownership. The supplied open checkouts were searched by objects, alongside board packages and main. The roadmap service's object searches and supplier reads were also used. This did not use progress-only changes to an existing roadmap as a supplier. No helper agents were used.

Every named supplier section was resolved against main or its service-provided roadmap text. The relevant contracts are:

| Supplier | Sections and contract checked |
|---|---|
| ClassFieldTheory | §2.6, Layers 5, 7, 8, 11–12: arithmetic reciprocity, Kummer/duality, local and global class field interfaces. |
| LocalGaloisGroups; LocalFieldsRamification | Layer 1 cohomology dimensions; Layers 0, 2, 3 valuation, unramified and Eisenstein theory. |
| EllipticCurves; ModularForms | Layers 2, 4 torsion and reduction; Layers 0, 4, 9 Eisenstein series, primitive forms and twists. |
| ModularCurves | Layers 0D–0E, 2F, 5B–5C: finite étale realization, descent, rigidity, full/fixed-pairing curves and the rational-base twist. |
| ModularCurvesPartII | §§4.10, 5.1–5.5, 5.13–5.15, 6.5: connectedness, coarse models, compactification, rational-base twist and level maps. Its §5.14 starts with a module over `ℚ`. |
| RepresentationTheory/InductionRestriction; Chebotarev | Finite induction/Clifford theory and Layer 7 factor sets and Schur-cover inputs; Frobenius density through ArithmeticGaloisRepresentations §5.1. |
| LocalGaloisDeformationRings | §§1.4, 1.12, 3.12, 8.6: tangent/coefficients, type point-kernel quotients, category quotients and characteristic-residue-field Ext. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory | §§R07.1.20, R07.1.22, R07.1.24–R07.1.25, R07.2.5–R07.2.8, R07.4.18, R07.4.27, R07.4.30–R07.4.35: closure, models, Tate extension, Dieudonné theory, period comparison and tame descent. Its monodromy convention is the opposite of this package's explicitly recorded convention. |
| GL2AutomorphicRepresentationsAndTransfer | Layers R16.2–R16.3 and R17.5: compact/local types, local normalization and the octahedral application. |
| GL2ModularityLifting | §§5.6, 5.9, 5.11–5.15: component patching, ordinary overlap, Kisin lifting and the already-owned general BCDT theorems. |
| ClassicalSerreModularity; OrdinaryAutomorphicFormsAndModularityLifting | §I.1; §5.7: ordinary lifting and its irreducible-residual comparison. |
| InverseGaloisAndArithmeticFundamentalGroups | §IG.2.7: Hilbert points with prescribed local neighbourhoods over number fields; `ℙ¹_ℚ` satisfies the required weak approximation at all finite sets of places. |
| ArithmeticGaloisRepresentations | §§1.8, 4.1–4.3, 4.6, 5.1, 5.3–5.4, 6.1–6.3: residual images, recognition, Tate modules and local factors. |
| AlgebraicModularFormsAndSerreWeights | Layers R15.3, R15.5–R15.6: weight operations, eigenvalue lifting and residual modularity. |
| EllipticCurveModularity | Layers R29.3–R29.6: conditional attachment, conductor, quotient and parametrisation comparisons. Its existence proof is not a proof input here. |
| PadicHodgeTheory; ComplexMultiplicationAndExplicitReciprocity | §§8.3, 9.3 good reduction; the named CM-induction/compatible-system target. |

Matrix Hilbert 90 and the Galois-equivariant level-five lift were already §1.15 targets. The searches found no same-object supplier among main, board packages and the supplied open heads; scalar Hilbert 90 and general Schur-cover infrastructure do not already state these assertions. The arbitrary-field twist is the extension needed to repair §1.15's existing general theorem; its finite étale, fine-moduli and quotient foundations are imported, without replanning them. Thus these targets remain owned here. The general BCDT theorems have the earlier owner identified above and were replaced by imports. No new supplier gap or ownership move to a later roadmap is needed.

The pinned library evidence includes Mathlib `LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:147,187,273`, `LinearAlgebra/Matrix/GeneralLinearGroup/Projective.lean:41,55,100,217`, `LinearAlgebra/Matrix/ProjectiveSpecialLinearGroup.lean:33`, and `FieldTheory/KrullTopology.lean:139`. These give actual groups, coefficient maps, the projective quotients and the Krull group topology. Scalar Hilbert 90, `groupCohomology.H1ofAutOnUnitsUnique`, in Mathlib `RepresentationTheory/Homological/GroupCohomology/Hilbert90.lean:107` concerns units over a finite-dimensional extension, not arbitrary matrices. Artin independence is `linearIndependent_algHom_toLinearMap` in `LinearAlgebra/LinearIndependent/Lemmas.lean:479`; its domain and field hypotheses hold after finite-Galois reduction. Both inputs are now named in the exact contracts and §1.15. Direct object searches in both pins found no matrix-cocycle or wild Breuil/deformation carrier supplying the new headline theorems.

Tau Ceti `NumberTheory/ModularForms/Newforms/Newform.lean:84–110` supplies a nonzero normalized new cusp form, with nebentypus and Hecke eigenvalues only at coprime indices. Mathlib `AlgebraicGeometry/EllipticCurve/Weierstrass.lean:230` supplies change of coefficients and `Affine/Point.lean:477` includes infinity and nonsingular affine points; under nonvanishing reduced discriminant these are the elliptic-curve points. Tau Ceti `AlgebraicGeometry/EllipticCurve/HasseBound.lean:65` uses the same `Nat.card` count. No conductor or Galois attachment has been invented in the Lean statement.

Other directly resolved pinned declarations include Tau Ceti Kummer (`NumberTheory/ClassFieldTheory/MuNRep.lean:270`), duality (`Local/Duality/FiniteModule.lean:260`), Artin reciprocity (`Local/Reciprocity.lean:116`, `Local/Unramified.lean:440`, `LocalExistence/AbelianLayer.lean:114`), the absolute group (`FieldTheory/Galois/AbsoluteGaloisGroup/Basic.lean:312`), Tate action/determinant (`AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean:71`, `Determinant.lean:52`) and Weil equivariance (`Isogeny/MulByInt/WeilPairing/Galois.lean:104`). Their characteristic, coefficient and equivariance hypotheses are preserved.

## Elaborated-declaration ledger

All names have namespace `TauCetiRoadmap.EllipticCurveModularityWild3Adic`. There are no section variables to be implicitly retained.

| Declaration | Instances tried | Computed values | Result / change |
|---|---|---|---|
| `Q3` | Constants 0, 1, 3 | `3≠0`, characteristic 0; residue characteristic 3 | Native abbreviation retained. |
| `Q3bar` | Root of `X²+1` | `j²=−1`; reduction `−1=2` is nonsquare in `𝔽₃` | Algebraic-closure carrier retained. |
| `cubeClass_coordinates` | `1,3,4,12,27,64,1/3`; excluded 0 | Coordinates `(0,0),(1,0),(0,1),(1,1),(0,0),(0,0),(2,0)`; 0 would admit nine pairs | Nonzero binder retained. |
| `cyclicCubicField` | Generator 0; an Eisenstein root | Finranks 1 and 3 | Root equation belongs to theorem, not definition. |
| `nonabelianCubicSplittingField` | Generators `(0,0)`; prescribed roots | Finranks 1 and 6 | Unrestricted adjoining definition retained. |
| `degreeTwelveSplittingField` | All generators 0; prescribed roots | Finranks 1 and 24; adjoining `s=±β²` adds degree 1 | Root hypotheses retained on each theorem. |
| `cyclicCubic_galois` | Two displayed roots and three iterations | Polynomial remainders 0; third iterate minus `π` has remainder 0; discriminant 81 | Exact polynomial calculation, no change. |
| `nonabelianCubic_finrank` | Displayed nonabelian conjugate | Root remainder 0, third-iterate remainder 0; discriminant `−324`; ranks 3 and 6 | `j²=−1` and nonnormality retained. |
| `positiveQuadratic_finrank` | Root valuations and unramified quadratic factor | `v₃(α)=1/3`, `v₃(β)=1/4`; ramification 12, residue degree 2, total 24 | All four equations retained. |
| `negativeQuadratic_finrank` | `α` versus `α−1` | Valuations 0 versus `1/3`; uniformizer valuation `1/12`, total degree 24 | Shifted uniformizer in README retained. |
| `extendedTypeField_finrank` | All indices in `Fin 3` | Cube values 3,12,21; twelfth powers `−3,−768,−7203`; degree 24 each | No out-of-range index admitted. |
| `levelFiveConjugate` | `t=2`, upper unipotent; `t=1`; central element | Upper-right entries 2 versus inverse-action 3; determinant 1; `−I↦−I` | Added native matrix definition. |
| `matrixHilbert90` | Trivial group; `GL₁`; noncommuting complex matrix | `c(1)=I`; for scalar `B=i`, `c(conj)=−1`; for `B=(i,1;0,−i)`, `B⁻¹B̄=(−1,−2i;0,−1)` and `c·c̄=I` | Added general-field signature with explicit discrete continuity. |
| `specialLinearHilbert90` | `n=1`; `B=diag(i,−i)`; determinant adjustment | `SL₁={1}`; `det B=1`, cocycle `−I`; `det(diag(d⁻¹,1)B)=d⁻¹d=1` | Added determinant-one version; `d≠0` since `B` invertible. |
| `equivariantIcosahedralLift` | Identity; centre; diagonal-conjugated unipotent | `b(1)=I`, `b(−I)=−I`, both project to identity; conjugation parameter 2 gives entry 2; globally negated map sends 1 to `−I` | Faithfulness, characteristic zero and equivariance explicit. |
| `ellipticCurve_modular` | Integral `y²=x³−x`; singular excluded model | `Δ=64`; at 3 count 4, eigenvalue 0; at 5 count 8, eigenvalue `−2`; `Δ=0` fails rational ellipticity | Added actual native Newform signature; no stand-in data. |

## Adversarial statement and convention ledger

Each row identifies a statement, definition or convention, with actual values of its tests. These are discriminating instances and algebraic consequences, not proofs of the general existence/classification theorems. The proof inputs remain the named sources and suppliers. `S₉=𝔽₃[u]/(u⁹)` and `S₃₆=𝔽₃[u]/(u³⁶)` in the table.

| Statement | Instances tried | Values computed on the defining laws / both sides | Result | Change |
|---|---|---|---|---|
| Primes, fields and coefficients | `ℓ=2,3`; root fields | Odd-prime condition rejects 2; `v₃(3)=1`, characteristic of `ℚ₃` is 0 | Appropriate domains | None |
| Reciprocity and characters | Uniformizer 3, unit 4; `ω` | Arithmetic Frobenius has valuation character 1, units 0; `ω²=1` | Sign convention fixed | None |
| Peu/très convention | Zero, `[4]`, `[3]` | `(peu,très)=(1,0),(1,0),(0,1)` | Split class must be included | Repaired |
| Matrix-shape convention | Split and characteristic-3 self-extensions | Cocycle 0 gives block diagonal; `3E[9]=E[3]≠0` cannot give a vector-space extension | Integral and tangent objects differ | Repaired |
| Commutative-group convention | Exponent-three upper-unitriangular group | Order 27, exponent 3, commutator `1+E₁₃≠1` | Noncommutative example excluded | None |
| Breuil/Dieudonné signs | Rank one and scalar `j` | `N(ue)=ue`; `V(j)=j³=−j`; `FV=VF=3` | Positive monodromy and semilinearity fixed | None |
| Weak acceptability | `0`, `𝒪`, `𝒪[[X,Y]]` | Zero ring uses the separate branch; nonzero rings have relative tangent dimensions 0,2; a one-variable quotient has dimension ≤1 | Third ring fails | Attribution and definition clarified |
| Modularity conventions | CM curve `y²=x³−x`, weight 2 | At 3 and 5: counts 4,8, coefficients 0,`−2` | Native newform formulation agrees | Added headline |
| 0.1 compact-type definition | `ℓ=3`, scalar and tame conductor-one types | Dimensions 3 and 4; index of `U₀(9)` is 12 | Carriers distinguished | API prose |
| 0.1 independence, irreducibility, multiplicity | Unramified principal series versus a character | Finite invariants `1⊕St`, `dim Hom(St,π)=1`; for one-dimensional character it is 0 | Infinite-dimensional condition used | API prose |
| 0.2 residual representations and admission | `n=0,1,2`, `ℓ=3`; peu/très twist | Dimensions 1,2,3; très admits only `(n,m)=(2,1)`; peu admits `(0,1)` too | Uniqueness distinguishes simple admission | API prose |
| 0.3 cubic types | Units 4 and `1+3j` | Values `(ζ,1)` for the split cubic character and `(1,ζ)` for the unramified-quadratic inducing character | Types distinguished | None |
| 0.4 quadratic types | `−1`, `1+3√−3` | Value at `−1` is `−1`; second value 1 for `τ₋₃`, versus `ζ` for extended types | Unit values distinguish types | None |
| 0.5 extended types | `i=0,1,2`; uniformizer sign | Values `1,ζ,ζ²`; `(ζ−ζ⁻¹)²=−3`; negation leaves units fixed | Full Weil datum retained | None |
| 0.6 cubic simple admission | Très versus peu twist | Unique constituent `σ₂,₁` with multiplicity 1 versus two admitting constituents | Hypothesis necessary | None |
| 0.7 quadratic simple admission | Two equal-character residual constituents | Multiplicities `(1,1)`; only `σ′₀,₀` admits très shape | Simple admission verified | None |
| 0.8 extended simple admission | Quotient Frobenius values `1,−1` | `a=−1,+1` respectively; only first selected constituent has asserted multiplicity 1 | Full group shape necessary | None |
| 1.1 cube classes and ramification | Seven displayed rational inputs; non-Galois cubic | Coordinates as above; `χ(3)=1`, `χ(4)=χ(27)=0`; restriction of `[3]` to `ℚ₃(∛3)` is 0 | Basis, kernel and Galois hypothesis discriminate | Zero class included |
| 1.2 uniformizer correction data | Cubic `G=u²−1`; invariant uniformizer | `−φ(G)=1−u⁶`, constant 1; invariant case `(H,t,f)=(1,0,0)` | Signs and trivial case agree | None |
| 1.3 cyclic cubic construction | Both conjugates; three iterations | Remainders 0; discriminant 81; `G(0)=−1`, `c(0)=1` | Galois order 3 | None |
| 1.4 nonabelian cubic construction | Conjugate and correction ratio | Root remainder 0; `πH(π)−γ₃(π)` remainder 0; conjugation inverts order-three generator; `c(0)=−1` | Nonabelian group and sign | None |
| 1.5 positive quadratic construction | Uniformizer; square of tame generator | `1/3−1/4=1/12`; `γ₄²(β)=−β`; norm 3, constants `(G(0),c(0))=(1,−1)` | Degree 24 and order-two centre | None |
| 1.6 negative quadratic construction | Shifted versus unshifted generator | Valuations `1/12` versus `−1/4`; norm `81/(−27)=−3`; constants `−1,1` | Shift required | API prose |
| 1.7 extended field construction | Three index lifts | `α³=3,12,21`; `π¹²=−3,−768,−7203`; `H=1−u⁶`, `t=−1−u⁶` | Index and correction retained | None |
| 1.8 finite-group assertions | `GL₂(𝔽₃)`, Borel and nonsplit normalizer | Orders 48,12 and 48; `SL₂(𝔽₃)` order 24; `ζ−ζ⁻¹` has square 2 in characteristic 5 | Nonabelian and determinant tests | None |
| 1.9 six tags | Good curve, tags 5 and 6, scalar induction | Wild order 1 in tag 1; unit values 1 versus `ζ`; inducing scalar dimension 2 versus mistaken dimension 4 | Tags and carriers discriminate | None |
| 1.10 exhaustion | Trivial wild image and nontrivial cyclic image | Wild orders 1 or 3; determinant image of Frobenius at 3 is 3 in `𝔽₅` | Tame/wild split preserved | None |
| 1.11 cubic local curves | `b=4,2` in `x³−3x+2b` | `b²−1=15,3`; first cubic discriminant `−1620`, square class `−20≡1 mod3`; second field discriminant `−324` | Abelian/nonabelian cases differ | API prose |
| 1.12 degree-twelve local curves | `x³+3x+2`, `x³+3x+6`, `x³+9x−3` | Quadratic fields `√3`, `√−3`; last discriminant valuation 5, `−1/2≡4 mod9`, family `κ=4` | Representative table agrees | API prose |
| 1.13 general cross-prime comparison | Zero variety; product `E×E` | Ranks 0 and 4; Frobenius polynomials 1 and `(X²−a₃X+3)²` | Dimension generality retained | None |
| 1.13 elliptic specialization | Good curve; Tate curve excluded | Common polynomial `X²−a₃X+3`, monodromy 0; Tate curve has `N≠0` | Potentially good scope used | None |
| 1.14 Frobenius sign | `A=9`, `B=−3,−12,6` | Norm factors modulo `9s`: `s(1−3s)`, `s(7−3s)`, `s(4−3s)`; reduced curve count 1, trace 3; opposite sign gives `−3` | Arithmetic sign determined | None |
| 1.15 matrix Hilbert 90 | Trivial group, scalar and nonscalar complex matrices | `c(1)=I`; scalar `−1`; nonscalar cocycle upper-right `−2i`, reversed order `2i`; `c c̄=I` | Order distinguished | Signature and Check added |
| 1.15 special-linear Hilbert 90 | Rank one and determinant correction | `SL₁={1}`; `det diag(i,−i)=1`; multiplying by `diag(d⁻¹,1)` changes determinant to 1, same cocycle | No zero denominator, since `d∈Kˣ` | Signature added |
| 1.15 diagonal-conjugation definition | Parameters 1,2 and central matrix | Upper-right 1,2 versus inverse-action 3; determinant remains 1; centre `−I` fixed | Wrong inverse and zero map excluded | Definition and API added |
| 1.15 equivariant lift | Identity, central involution, negative candidate | Values `I,−I`; projective values 1,1; globally negating gives wrong identity `−I` | Centre/faithfulness and uniqueness inputs retained | Signature added |
| 1.15 arbitrary-field twist construction | Geometric frames and pairings; `V=E₀[5]` | 480 frames, four primitive pairing values; pairing quotient has one component, unpaired quotient four; universal fibre `E₀` | Free frame action includes special j-values | Construction and Checks added |
| 1.15 rationality theorem | `K=ℚ₃`, `V=E₀[5]`; level 4 comparison | Twisted curve has point `(E₀,id)` and genus 0, compactification degree-one form `ℙ¹`; level-four obstruction can be nonzero | Characteristic-zero level-five theorem retained | Supplier domain repaired |
| 1.16 local companion construction | Cases 2,3,4,5,6 representatives | Wild indices 3,3,12,12,12; très class has nonzero valuation coordinate; case-six uniformizer sign +1 | Pairing transported along actual identification | Arbitrary-field prerequisite repaired |
| 2.1 Breuil-module definition | Rank one, `r=0,e`; monomial `ue` | Multiplicative `F=0`; étale `F` invertible; `N(ue)=ue≠0` | Zero monodromy model excluded | API prose |
| 2.1 classification theorem | Orders 1,3,9 | Ranks 0,1,2; contravariant arrows reverse; finite noncommutative exponent-three group order 27 excluded | Commutativity/rank/exactness conventions retained | API prose |
| 2.2 rank-one and extension definitions | `r=1,2`, `e=3`; inadmissible cross term | Filtrations `uM,u²M`; for `r+s>e`, a unit cross term fails `u^eM⊆M₁` | Defining divisibility discriminates | API prose |
| 2.2 classification, gauge and duality | `M(1,δ)→M(3,δ)`; coefficient `−1` | Exponent `3(3−1)/2=3`; map to weight 2 fails congruence; `−1` nonsquare over `𝔽₃` but `j²` over `𝔽₉` | Base-field and Cartier tests | API prose |
| 2.3 corrected descent definition | Invariant uniformizer; conductor-243 wild generator | Correction 0 versus `t=−1−u⁶≠0`; on `u`, scalar action uses `uH_g` | Wild commuting model excluded | API prose |
| 2.3 descent theorem | Unramified quadratic twist; rank-one wild action | For `H=1`, generator can act by `−1` outside wild inertia; on wild rank zero weight, `H⁰=1` | Wild-inertia hypothesis necessary | API prose |
| 2.4 model, ideal and filtration definitions | Singleton, zero, two copies, `μ₃` | Filtration lengths 0,2; `μ₃` generic character `ω≠1`; on canonical `μ₃`, `γ₄²+1=2` | Filtration and ideal conditions independent | API prose |
| 2.4 closure and weak-to-strong theorem | Cubic constant generic fibre | Two models `G(1,1)`, `G(3,1)` have weights 1 and 3; same generic order 3 | Uniqueness requires hypotheses | API prose |
| 2.5 cubic condition and tangent | Zero, split rank-two, dual numbers, higher torsion | Zero belongs; split `1⊕ω` has no `ρ̄`-filtration; `3=0` on dual numbers but `3H[9]=H[3]≠0` | Tangent middle objects restricted | Added `S[3]` |
| 2.6 quadratic operator ideal | Nonzero zero-F model and wrong involution | All ideal generators 0 on accepted `𝔽₉²`; involution `+1` gives generator 2; `F²=−3` | Three discriminating operator tests | Replaced zero Check |
| 2.7 extended operator ideal | Trivial wild, zero-F unipotent, nonzero-F unipotent | Over 81 vectors: accepted models 0 failed relations; zero-F unipotent fails third relation on 72; at `(0,1)`, correct 2 versus negative 1 | Third generator and sign independent | Replaced weak Checks |
| 2.8 comparison maps | Entry matrices `E₂₁`, `diag(1,−1)`, upper triangular nilpotent | Triples `(1,0,0)`, `(0,−1,1)`, `(0,0,0)`; trace-zero diagonals sum to 0 | Entry maps nonzero; source characteristic 3 | Restricted Ext source |
| 2.9 tangent kernel theorem | Très `[3]` versus peu `[4]` | Unramified duality values 1 versus 0; dimension `2−1=1`; in `𝔽₃`, `2⁻¹=2` | Très and odd characteristic used | None |
| 2.10 cubic factorization | Zero type ring; levels 3 and 9 | Zero point set empty; orders of lattice quotients 9 and 81 | Every torsion level retained | None |
| 2.11 quadratic factorization | `V=−F`, determinant 3 | `F²=−3`, `FV=3`; wrong positive square fails `FV=3` | Integral identities survive quotients | None |
| 3.1 cubic rank-one models | Constant/multiplicative and local-local weights | Weights 3,0 and 1,2; map weight 1→3 multiplies by `u³`, nonzero in `S₉` | Both signs retained | Scalar convention clarified |
| 3.2 cubic peu extensions | `c=0,1`; residue extension degrees 1,2 | Split at 0; `N(e_ω)=u⁶e₁≠0` at 1; for negative sign `γ₂(j)=-j` | Split class peu; descent carrier valid | Repaired base change and zero case |
| 3.3 auxiliary cubic generic descent | Cyclic cubic and split class | Galois order 3; the automorphism group of a one-dimensional `𝔽₃`-space has order 2, so scalar action trivial; generic split group order 9 | Degree-six nonabelian case excluded | None |
| 3.4 cubic très models | `(c,c′)=(0,1),(1,0),(0,0)` | Peu, très, split; respectively special-fibre `F=0,≠0,0`; nine parameter pairs | Parameter dichotomy includes zero | Convention repaired |
| 3.5 diagonal cubic extensions | First parameter 0 or 1 | Unramified at 0; nonzero descent constants are `−bH′(0)`, `−aH′(0)` with the same sign | Both diagonal signs agree | None |
| 3.6 rank-three splitting | `c=1` or 0, `b=1` | At `c=1`, constant divisibility requires `b=0`, so `b=1` fails; at `c=0`, constant product 0 for every `b` | Très hypothesis necessary | Source `S_δ[3]` |
| 3.7 diagonal vanishing | Negative field derivative; positive fixed determinant | `H′(0)=(3−j)/4≡−j≠0`; equation `−a+b=b` gives `a=0`; trace relation gives one diagonal condition | Inertia class killed, unramified class allowed | Characteristic-3 Ext |
| 3.8 cubic tangent bound | Kernel of two comparison maps | Ambient common kernel dimension `2−1=1`, tangent dimension ≤1 | Applies to relative tangent | Characteristic-3 input clarified |
| 3.9 cubic weak acceptability | `𝒪`, `𝒪[[X]]/(X²)`, zero ring | Nonzero tangent dimensions 0,1; zero ring uses the separate exception; singular one-variable quotient allowed | No smoothness asserted | Supplier predicate corrected |
| 4.1 rank-one degree-twelve descent | `r=0,2,4,6,10,12` | Involution values `1,−1,1,−1,−1,1`; at 12 constant eigenvalue 1 | Allowed weights exactly 2,6,10 | None |
| 4.2 adapted bases | Two weight-two summands | Eigenvalues `j,−j`; `γ₂(je)=−je`; division by 2 uses inverse 2 | Residue extension required | None |
| 4.3 unique quadratic residual model | Très versus peu and reversed weights | Très pair `(2,10)` has nonzero F; reversed split class F=0; peu permits `(6,6)` | Nonzero F supplies contradiction downstream | None |
| 4.4 pushout/pullback | Reversed rank-two constant term | Tame equation kills `c′`; nonzero `c` forces a residual model with F=0, contradicting F≠0 | Source middle object killed by 3 | Restricted Ext |
| 4.5 diagonal unramifiedness | `c″=0,1` | Split at 0; equation `a³−a=1` has no solution in `𝔽₉` since trace of 1 is 2≠0; splits in cubic residue extension | Inertia restriction 0 | Restricted Ext |
| 4.6 quadratic tangent bound | Θ common kernel | Dimension `2−1=1`; condition dimension ≤1 | Tangent bound retained | Corrected inputs |
| 4.7 quadratic weak acceptability | Zero and one-variable quotients | Zero is allowed; tangent 0 or 1, without asserting a nonzero type point | Inertial hypothesis suffices here | Supplier predicate corrected |
| 5.1 four families | Zero parameters; `(6,6),c=1,c′=0`; `c′=1` | Split at zero; filtration contains `(1,u⁶)` but not `(0,1)`; wrong `u²` cross term excludes former; `N(e′)=u³⁰e≠0` at `c′=1` | Filtration and monodromy tests discriminate | Zero class compatible |
| 5.2 classification and generic Ext | All nine `(c,c′)` pairs | Type-split line `(0,0),(1,2),(2,1)`; peu line `(0,0),(0,1),(0,2)`; only origin splits over `ℚ₃`; `(1,0)↦(1,1)` | Distinct lines, zero included | Peu convention repaired |
| 5.3 reversed extensions | Three extreme pairs; `(6,6)` zero/nonzero | Ext dimensions 0,0,0 versus 2; zero parameter is split | Reversed exceptional family retained | None |
| 5.4 diagonal extensions | Weights 2,6,10 and `c=0,1` | Image dimensions 1,2,1; at weight 6, `c=1` ramified; at 2 equation `a³−a=1` gives unramified residue degree 3 | Blanket unramifiedness excluded | None |
| 5.5 coefficient actions | `k=𝔽₃,𝔽₉` | Over `𝔽₉`, `k⊗𝔽₉≅𝔽₉×𝔽₉`, not a field; descended scalar rank remains 1 | No disjointness assumption introduced | None |
| 5.6 filtered conditions | Zero, residual, split characters and 9-torsion | Lengths 0,1; split characters have no residual filtration; `3E[9]=E[3]≠0` | Integral condition differs from tangent subcategory | API prose and exclusion Check |
| 5.7 comparison vanishing | Extreme pairs; exceptional coefficient equation | Extreme reverse Ext dimension 0; exceptional `a₂c u²∈u⁶S₃₆` with `c=1` forces `a₂=0` | Ramified diagonal parameter eliminated | Restricted to killed-by-3 extensions |
| 5.8 extended tangent bounds | Four pairs | At least one diagonal map vanishes; common fixed-determinant kernel dimension 1 | Each bound ≤1 | Corrected Ext input |
| 5.9 Artin deformations | `N=1,2`; pair `(2,10)` | `T=0` at 1; at 2, `T≠0`, `T²=T³=0`, coefficient Frobenius sends T to T; cross term `(c+T)u⁸` | Dual numbers remain characteristic 3 | None |
| 5.10 characteristic-three rings | `D=(ℤ/9)²`, `F(x,y)=(-3y,x)` | `F²=-3`, `F(3,0)=(0,3)≠0`; hypothesis on `D[3]` fails and `3D≠0` | Needed stronger hypothesis retained | None |
| 5.11 exceptional type model | Characteristic-zero point; nonexceptional ring | In nonexceptional ring `3=0`, in target field `3≠0`; no unital map; exceptional weights `(6,6)` | Integral higher torsion retained | None |
| 5.12 extended weak acceptability | Each index; nonexceptional versus exceptional | Nonexceptional rings have zero characteristic-zero points; exceptional tangent ≤1; uniformizer sign +1 | Full group hypothesis retained | Supplier predicate corrected |
| 6.1 local constancy | Identity specialization; cubic local families | At `x₀` distance 0 and same torsion; same mod-5 type admits peu and très mod-3 classes, unit versus valuation line | Neighbourhood cannot be whole parameter space | None |
| 6.2 three-torsion cover | Two sign quotients | 48 bases /2 =24; changing only first entry exchanges two pairing values; simultaneous sign leaves two components | Chosen quotient geometrically connected | None |
| 6.3 global companion | Tame and full extended local class | Mod-3 image contains order-24 SL; surjective determinant has order 2, hence image order 48 | Full local module retained | Repaired twist prerequisite |
| 6.4 six 3-adic types | Tags 2–6 | Inertia orders 3,3,12,12,12; extended uniformizer sign +1; sign reversal would give trace −3 | Cross-prime and Frobenius inputs needed | None |
| 6.5 imported lifting hypotheses | `ℓ=3,5`; distinct split local characters | Quadratic parameters `−3,+5`; split centralizer dimension 2>1; an actual lift rules out zero type ring | General theorem supplied earlier | Imported instead of replanned |
| 6.6 mod-3 modularity | Surjective mod-3 companion; reducible `1⊕ω` | Image order 48, conjugation determinant −1; Hasse multiplication changes weight 1 to 3, weight-one Eisenstein multiplication to 2 | Correct weight-one seed retained | None |
| 6.7 modularity comparisons and twists | Quadratic twist at an unramified prime | Character values `±1`; attached trace multiplies by that value and determinant by its square 1 | Conditional comparisons, no conductor invariance | None |
| 6.8 wild lifting | Surjective companion and nonsplit local shape | Quadratic restriction contains SL of order 24; local endomorphisms scalars, dimension 1; type tangent ≤1 | Supplier hypotheses all available | Uses §§5.14–5.15 |
| 6.9 tame modularity | Potentially multiplicative versus good | Tate monodromy rank 1 versus 0; local type tame, conductor exponent ≤2 | Ordinary/PBT branches distinguished | Ownership reference corrected |
| 6.10 mod-5 modularity | Absolutely irreducible versus rational 5-torsion | Determinant of conjugation −1; reducible 5-torsion has invariant line of dimension 1 | Hypotheses maintained | None |
| 6.11 exceptional isogeny theorem | Both reducible; two mixed branches; both irreducible | Borel order 80; exceptional image orders 8 and 16; mixed `(5,3)` branch permits j=0 | Mixed branch retained | Page locator corrected |
| 6.11 explicit modular maps | Two fixed integral models; constant candidate | `(c₄,Δ,j)=(145,−800,−121945/32)` and `(−143,−17576,1331/8)`; constant degree 0 fails nonconstancy | Poles/normalization still required | Identifier remnant corrected |
| 6.11 level-75 cover Check | `(2,−4)`, `(1,−1)` and other rational points | Simple zero, double pole with normalized coefficient −44; other values `17,8,−15,5/4,185/4` nonsquares | Smooth cover used at poles | None |
| 6.12 switch at five | Image in Borel or exceptional 2-group | Orders 80 or 16, both prime to 3; wild 3-image trivial; conductor exponent at 3 ≤2 | Tame reduction conclusion retained | Page locator corrected |
| 6.13 elliptic modularity | CM integral curve; singular rational model | `Δ=64`; coefficients `a₃=0,a₅=−2`; singular Δ=0 excluded | General elliptic headline statable on native newforms | Signature added |

## Maintainer notes

No existing Lean declaration was deleted or renamed. The five added names are `levelFiveConjugate`, `matrixHilbert90`, `specialLinearHilbert90`, `equivariantIcosahedralLift` and `ellipticCurve_modular`; all appear in the README. Other roadmaps retain their ownership and files. The changes are confined to this package's README, acceptance file, CDT manifest locator and this report; metadata and the design plan were untouched. No commit, push, issue or pull-request write was made. This report makes no claim of independent acceptance.
