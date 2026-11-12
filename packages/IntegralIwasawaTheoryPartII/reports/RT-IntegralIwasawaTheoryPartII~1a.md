<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13146#issuecomment-6787294380 -->
Red team round 1 pass a (codex) of 1ccbef4

Verdict: needs_changes

1. **F01** (P1) The reversed odd-prime Eisenstein family has no supplier contract

   **Location:** `packages/IntegralIwasawaTheoryPartII/README.md:442`: “When `R′ = ∅` use also `E(χ, 1)`”. The scope and supplier contract attribute the fractional ordinary Eisenstein families to NoncommutativeAndEquivariantIwasawa §F.5.

   **Claim:** The reversed Λ-adic family, including its weight-one specialization, is already supplied for odd primes and characters unramified above them.

   **Witness:** `TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2565` constructs only `ℰ(1,χ)`. OrdinaryAutomorphicFormsAndModularityLifting §2.12(a) supplies classical pairs. For χ₄, p=5, k=5, ℓ=3, the two eigenvalues are −80 and 80; these are different families.

   **Exact repair text:** Add under the §F.5 supplier contract, and add the same slug to `design/plan.json`'s gaps: “What NoncommutativeAndEquivariantIwasawa must provide (gap:reversed-ordinary-eisenstein-family): For odd p and a totally odd finite-order χ of conductor prime to p with χ(𝔮)=1 for every 𝔮|p, the fractional ordinary coefficient family E(χ,1) in the §F.5 module, whose weight-k specialization for k≥2 is the ordinary stabilization of E_k(χ,ω^(1−k)), whose good-prime eigenvalue is χ(𝔩)+ε(𝔩), whose U_𝔮-eigenvalue is 1 for 𝔮|p, and whose regular weight-one specialization is E_1(1,χ_S); its standard constant at λ is zero if cond(χ)≠1 and is 2^(−[F:ℚ])χ⁻¹(λ)ℒ_(χ⁻¹) if cond(χ)=1, with regularity at all k≥2 and at k=1 (DKV16 §3.1 and §3.4).” Cite this gap in §2.2. Retain the existing dyadic contract. This supplies the reversed eigenvalue −1+3⁴=80 in the witness instead of importing 1−3⁴=−80.

2. **F02** (P1) Reducedness after completion uses an uncited owner

   **Location:** `packages/IntegralIwasawaTheoryPartII/README.md:652`: “completion of an excellent reduced local ring is reduced”.

   **Claim:** The proof of §4.1 can pass from the supplier's reduced local ring A to its reduced completion using the listed inputs. Neither excellence of A nor the reduced-completion theorem is among those inputs.

   **Witness:** `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1566–1582` supplies exactly `regular_map_completion` and `excellent_examples` in §0.21. The cited PadicFamilies §§5.12–5.13 supply reducedness and quotient fields before completion, not this preservation theorem.

   **Exact repair text:** Add “SchemeAndStackFoundations §0.21 (`excellent_examples`, `regular_map_completion`): complete Noetherian local rings and finite-type/localized algebras over them are excellent; the completion map of a local G-ring is regular, and regular maps between Noetherian rings preserve reducedness.” Add this owner to §4.1's Needs. Replace the unexplained step by “Λ is complete Noetherian local and hence excellent; T is finite over Λ and A is a localization of T, so A is excellent. Its completion map is regular and Â is reduced.” On the nodal example already in §4.1 this gives a reduced completion with two minimal primes, not a domain; the repair preserves that distinction.

3. **F03** (P2) The statable homological edge theorem is absent from the acceptance file

   **Location:** `packages/IntegralIwasawaTheoryPartII/README.md:263` and `packages/IntegralIwasawaTheoryPartII/Suggested.lean:8–33`: “the natural map ... is an isomorphism for every `n`”; the Lean file contains no declarations.

   **Claim:** No promised headline is currently statable. The deep edge isomorphism explicitly owned in the scope and proved in §0.7 is an exception: it needs no missing arithmetic carrier.

   **Witness:** Pinned `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:864` defines `groupHomology.coinfNatTrans`; `Mathlib/RepresentationTheory/Coinvariants.lean:442` defines its quotient representation. `Rep.res`, `Representation.asModule`, `Module.Free`, and `Multiplicative (Fin r → ℤ)` express all hypotheses.

   **Exact repair text:** Add the §0.7 edge isomorphism as a headline theorem with `sorry`, using `U = G × Multiplicative (Fin r → ℤ)`, `S = ker (MonoidHom.fst G _)`, a representation `M : Rep ℂ_p U`, and an explicit hypothesis that its restriction to S is free over `MonoidAlgebra ℂ_p S`. Assert `IsIso ((groupHomology.coinfNatTrans S n).app M)` for every n. Identify U/S with G by the native quotient equivalence if desired. Add its Lean name to the README and a Layer 0 section comment; describe it in the module docstring, and explicitly name Ventullo’s §2.3 existence theorem among the non-statable family results. No replacement of the arithmetic headlines is needed. For G=ℤ, r=1 and the regular T-module with trivial G action, source and target H₁ are both ℂ_p; for the excluded trivial T-module they are ℂ_p² and ℂ_p, so the freeness binder is essential.


4. **F04** (P1) The classical weight-one Hilbert Eisenstein input is outside the cited ranges

   **Location:** `packages/IntegralIwasawaTheoryPartII/README.md:442–444` and `:499`: the partially depleted classical forms `E_1(1,χ_J)` and the product with `𝒢^♭` are used as existing Hilbert forms.

   **Claim:** The cited classical form spaces, expansion principles and Eisenstein series supply these weight-one objects for every totally real field.

   **Witness:** NoncommutativeAndEquivariantIwasawa §F.5 starts at k≥2 (line 2522); PadicFamilies §5.9a starts at k≥2 (line 2851); OrdinaryAutomorphicFormsAndModularityLifting §2.12(a), line 368, also restricts its classical Eisenstein construction to k≥2. ModularForms §0.1 covers only F=ℚ.

   **Exact repair text:** Declare `gap:classical-hilbert-weight-one-eisenstein` at OrdinaryAutomorphicFormsAndModularityLifting §2.12(a): “For totally odd finite-order η and every modulus divisible by its conductor, construct the classical holomorphic Hilbert Eisenstein form E₁(1,η) with coefficients Σ_{𝔯|𝔞}η(𝔯), including imprimitive η extended by zero at the modulus primes, and the standard constants of DKV16 §3.1 (pp. 847–848, footnote 6), including its two-term modulus-one formula.” Include the weight-one ambient space and its expansion comparison, using the existing Hilbert geometry of IntegralIwasawaTheory §9.3 and the §F.5 form infrastructure. Put the same slug in the plan and README and consume it in §2.2. Prove the specialization and U identities there as already planned. This supplies E₁(1,χ_R) as an actual form even when R is empty and R′ is nonempty; it also supplies partially depleted forms with J≠S, which the weight-one eigenfamily congruence in PadicFamilies §5.13 does not construct. Test over F=ℚ with χ₄ and p=5: coefficients at 1 and 5 of E₁(1,χ₄) are 1 and 2, whereas those of E₁(1,(χ₄)_S) are 1 and 1; their U₅−1 difference has coefficient 1 at 1, as required.

5. **F05** (P2) Baker–Brumer is applied to a list that need not be rationally independent

   **Location:** `packages/IntegralIwasawaTheoryPartII/README.md:797`: “a vanishing would give a `ℚ`-linear relation ... which the character relations and `ord ... ≠ 0` exclude”.

   **Claim:** The conjugate norm logarithms used in the character projector have no rational relation when the projected unit has nonzero valuation. This is not the hypothesis the arithmetic provides.

   **Witness:** Take H=ℚ(i), p=5 and u₀=(2+i)/(2−i). The two logarithms are λ and −λ, with rational relation λ+(−λ)=0, while ord_P(eχu₀)=1. Their χ-weighted half-sum is λ, not zero.

   **Exact repair text:** Replace the inference by “Choose a ℚ-basis of the span of the conjugate norm logarithms, express the χ-weighted sum in that basis, and prove that its algebraic coefficient vector is nonzero. This requires identifying the rational relation space using the algebraic logarithm kernel and the valuations of the chosen p-unit; nonzero valuation does not assert that the original list is independent. Apply Baker–Brumer to the chosen independent basis.” Expand that arithmetic relation-space argument as a named intermediate target of §5.8, with a precise source locator or an explicit proof, rather than asserting the missing independence. Add the displayed quadratic example as a negative-control Check: the original relation space is span(1,1), the χ-vector is (1,−1)/2, and its image in the quotient is nonzero. Baker–Brumer then applies to the one-element basis λ in this example. The rank-one theorem itself is not refuted.

6. **F06** (P2) The measure cocycle loses its smaller group domain

   **Location:** `packages/IntegralIwasawaTheoryPartII/README.md:221`: “Define the cocycle of measures `μ_ℓ(A, Q, v)` ... prove it is a homogeneous cocycle”. Only Γ and Γ_ℓ have been defined.

   **Claim:** The measure construction and its cocycle law are available on the preceding domain Γ_ℓ, without an additional restriction or a new coefficient action.

   **Witness:** CD14 lines 1063–1089 defines Γ_{ℓ,p}=Γ_ℓ∩GL_n(ℤ[1/p]), takes A∈Γ_{ℓ,p}ⁿ, and states Proposition 4.1 on that group. For n=1, ℓ=5, p=3, (2)∈Γ_ℓ but (2)∉GL₁(ℤ[1/3]).

   **Exact repair text:** Insert “Put Γ_{ℓ,p}=Γ_ℓ∩GL_n(ℤ[1/p]). For A∈Γ_{ℓ,p}ⁿ, Q∈𝒬 and v∈ℚⁿ define μ_ℓ(A,Q,v) on v+ℤ_pⁿ. Its coefficient module is the module of measure families with the p-scaling relation and Γ_{ℓ,p}-action in CD14 §4.1; Proposition 4.1 is the cocycle law on Γ_{ℓ,p}.” State that multiplication matrices of the units and exceptional-prime generators used in §0.8 belong to Γ_{ℓ,p}. The n=1 matrix (3) is admitted and (2) excluded at (ℓ,p)=(5,3). Keep the original larger group for the rational Eisenstein cocycle. This changes no arithmetic application and avoids claiming an unspecified extension of the measure action.

## Verified sound

Read all 870 README lines and all 38 Suggested.lean lines. The declaration inventory is **0 definitions, 0 instances, 0 theorems, 0 examples**. There is no section-variable context to elaborate, no padding declaration, no sorry-valued data and no duplicated fully qualified Lean name. The only import is `Mathlib`. No Lean process was run: the read-only instruction forbids builds, and there are no names for the requested `#check @name` experiment. R03 concerns a missing acceptance theorem, not elaboration of existing code.

The mathematical inventory contains **52 numbered target sections**, plus the conventions and five bold worked examples. **88 Check bullets** were read and tested; the computed record below distinguishes formal algebra tests from realized arithmetic examples. Such tests do not prove the general theorems. Zero rings, characteristic-p coefficient fields, inseparable number-field extensions and noncompact absolute Galois groups fail the standing hypotheses; they are not silently admitted instances. Arithmetic coefficients are characteristic zero also when p=2. Artin algebra tests always retain r≥1, s≥r and a≠0. No actual arithmetic realization is claimed for the formal higher-order or w=−1 fibres.

The five declared gap slugs agree between the README and `design/plan.json`. Their named suppliers are earlier; their specified dyadic, p-ramified and representation extensions were treated as declared contracts, not missing implementations. No settled “not actionable” finding was re-raised. The latest repair report marked its repairs applied.

The dependency check returned exactly:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The read-only diff stat confines the changes to `packages/IntegralIwasawaTheoryPartII/`. The prose has no pull-request number, no computational algorithm target and no source-chapter layer title.

### Headline inventory

The acceptance headlines are the all-prime lower bound (§0.8), the cohomological regulator identity (§1.9), the three Hecke-image identifications (§§3.8–3.10), the Gross–Stark leading-term identity including rank zero (§§5.5–5.6), the exact-order criterion (§5.7), and rank-one nonvanishing (§5.8). The module docstring names their missing arithmetic carriers. The reusable homological edge theorem (§0.7) has native carriers and is the omitted statable result in R03. Ventullo's auxiliary-family existence (§2.3) is another deep result: it has no pinned Hilbert-family carrier and should also be named explicitly among the docstring's non-statable results. No scalar determinant or tiny quotient-ring identity is proposed as a substitute for these headlines.

### Complete target and computed-instance ledger

In this table λ means log₅((2+i)/(2−i)) at P=(2+i); the valuation is 1. O and L in formal matrix tests denote the unsigned valuation and logarithm matrices. “Consistent” means that the displayed test passes, not that a missing proof input is waived. Every row retains the README's standing context; there are no Lean binders to compare.

| Target and location in README | Instances and computed values on both sides | Result / change |
|---|---|---|
| 0.1, line 134: Gross–Stark data | χ₄ over ℚ: p=2 gives χ(p)=0, r=0 and ramification; p=3 gives −1, r=0 and inertia; p=5 gives 1, r=1 and two split primes. χ⁻¹=χ in these cases. | Both directions of splitting criterion agree. Trivial/even χ is excluded. |
| 0.2, line 152: components and maps | C₂ acts on u by u↦−u additively: ((1−c)/2)u=u, applying it twice gives u. Root of unity maps to (ord,log)=(0,0). At split p=5, u has valuations (1,−1), signed logs (−λ,λ). At inert p=3 the odd divisor part is 0. | Equivariance and χ⁻¹ convention consistent, including rational dyadic projector. |
| 0.3, line 170: valuation isomorphism | ℚ(i), p=5: source and target χ-parts have dimension 1, u↦(1,−1), determinant 1. At p=2 or 3 both χ-parts are 0, and det of the empty map is 1. Integral torsion i≠1 maps to zero, so the integral analogue is not injective. | Rationalization is essential and present. |
| 0.4, line 176: regulator | Empty matrices: 1/1=1. O=(2), L=(3): det(−LO⁻¹)=−3/2. O=diag(2,3), L=diag(5,7): both expressions 35/6; basis scale diag(4,1) gives 140/24=35/6. Repeated log rows give 0. | Sign, coordinate direction and denominator consistent. |
| 0.5, line 198: analytic invariants | f=D at r=0 gives 1; f=6Ds² at r=2 gives f''/(2D)=12D/(2D)=6; f=Ds³ at r=2 gives 0 versus first coefficient 1. At p=3, χ₄ gives D=(1−(−1))/2=1. | Distinguishes rank coefficient from first nonzero coefficient. |
| 0.6, line 217: cocycles/measures | ℚ, conductor 1, p=3, smoothing 2, full weight −1: (1−4)(1−3)(−1/12)=−1/2; principal branch value 0. χ₄, p=2, smoothing 3: factor at 0 is 4, at 1 is 0. n=1 matrices 2 and 3 at (ℓ,p)=(5,3) distinguish Γℓ from Γℓ,p. | Interpolation and pole cancellation consistent; R06 fixes measure domain. |
| 0.7, line 256: cap product and edge theorem | T=ℤ, regular module: H₁=0, H₀=ℂp; trivial module: H₁=ℂp, so edge to H₁(1,ℂp)=0 fails. G=ℤ and regular T-module with trivial G-action: H₁ on both sides ℂp. For r=2 successive rings are ℂp[t₂±¹], ℂp. | Freeness and distinct augmentation generators discriminate correctly; R03. |
| 0.8, line 280: lower bound | r=1,k=0: (1−π)1_O has values 1 on O\πO and 0 on πO. Two-place example: 52¹⁰=100 mod121, log₁₁52=22 mod121, c=88 mod121. At (π₁,1) corrected identity gives c−c=0; at (1,12) it gives 11 mod121. | Cross-coordinate correction is necessary and now included. |
| 0.9, line 308: order boundary | f=Dsʳ: normalized r-coefficient 1 and order r; f=Dsʳ⁺¹: coefficient 0 and order r+1. Empty regulator is 1. | Both directions of iff pass; no higher-rank exact-order claim. |
| 1.1, line 324: restricted H¹ | Trivial ℤp action on E: inclusion has value 1 at 1; with discrete E every continuous hom has finite image, hence value 0. Coboundary with χ=−1 and v=1 is −2, but has zero class; at exceptional decomposition groups it is the zero function. | Correct topology and restriction on classes. |
| 1.2, line 342: Kummer local condition | A root of unity maps to 0 after tensoring with E; a split p-unit with valuation 1 maps to a nonzero valuation Kummer component. Pairing an unramified class with a local unit gives 0; with a uniformizer gives ±1, with swapped order ∓1. | Unit condition differs from unrestricted Kummer condition; universal sign cancels. |
| 1.3, line 348: duality orthogonality | r=1 formal local data x=−3,y=2,o=2,ℓ=3: evaluation −6+6=0. r=0 gives empty sum 0. Coordinates (v₁,v₂) give (0,0). | Scalar and vector forms agree. |
| 1.4, line 354: reciprocity orthogonality | Principal idele u gives Art(u)=1, so additive evaluation 0. In C₂ χ-projection the sum over two conjugate primes is 2 times the selected component equation; dividing by 2 in E gives 0 also at p=2. | Profinite reciprocity and rational division retained. |
| 1.5, line 360: inertia injection | R empty: source must be 0 and product target is 0. A finite class-group element of order m maps to v with mv=0, hence v=0 in E. | All exceptional inertia groups, not just one, are retained. |
| 1.6, line 366: cyclotomic classes | Local 2o+3ℓ has coordinates (2,3), not (3,2); zero has (0,0). A global class with all y=0 has all inertia restrictions 0 and is 0. | Coefficient extraction and kernel consistent. |
| 1.7, line 383: dimension | r=1, O=2,L=3: annihilator of (2,3) in E² is span(−3/2,1); y-coordinate maps it isomorphically to E. r=0 gives 0→0. r=2 with invertible O gives kernel dimension 4−2=2. | No rank-one iteration needed. |
| 1.8, line 389: Greenberg invariant | X=2,Y=3 gives 2/3; empty gives 1; diag(2,5),diag(3,7) gives 10/21 and simultaneous row scale gives 40/84=10/21. | Basis and permutation invariance consistent. |
| 1.9, line 405: regulator comparison | X=−3,Y=2,O=2,L=3: XO+YL=0 and X/Y=−3/2=−L/O. Empty case: 1=1. | No extra sign. |
| 2.1, line 423: weight coordinate | ε(σ)=1+Lπ+O(π²); ν₁(π)=0 and first derivative in k is 1. p=2 uses u=5; at complex conjugation principal part 1 gives ε(c)=1. | Correct first-order normalization. |
| 2.2, line 440: Eisenstein dictionary | χ₄,p=5,k=5,ℓ=3 gives 1−81=−80 and −1+81=80. At weight one coefficients of E₁(1,χ₄) at 1,5 are (1,2); p-depleted coefficients (1,1), hence (U₅−1) coefficient at 1 is 1. | R01 and R04: supplier ranges do not supply all these objects. |
| 2.2a, line 446: Eisenstein complement | Weight 4 level8 coefficient columns at 1,2,4,8 give upper triangular diagonal (1,1,1,1), determinant1. At level25 the pair ξ,ξ has T₂=−9 versus9, T₁₁=1332 on both; disagreement density1/2. At level6,p=2 ordinary tame translates have coefficient determinant1 and dimension2. | Independence, sharp density and tame translates pass. Weight2 F≠ℚ source uncertified. |
| 2.3, line 469: auxiliary family | Constant-one family has each cλ(0)=1 and ν₀G=1. Doubling gives constants2 and fails; zero gives0 and fails. If denominator vanishes to order d>0, a cusp correction must cancel all d principal-part coefficients, not only its constant. | Normalization is discriminating; cited V15 construction avoids Leopoldt. |
| 2.4, line 485: case division | s=t gives W(0)=a/b≠0; s=t+1 gives W(0)=0 and W/π constant −a/b≠0. Swapping s<t exchanges the two characters. w=−1 remains admitted. | Covers equal and unequal orders without dividing by 1+w. |
| 2.5, line 497: semi-cusp family | Case1 ν₁F̃=E₁; Case2 ν₁F̃=(1+w)E₁, so w=−1 gives0; Case3 W(0)=0 gives E₁. Standard constants cancel C−C=0, while nonstandard constants are not thereby forced0. | Distinguishes semi-cuspidality from cuspidality; R04 affects input. |
| 2.6, line 516: normalized projection | T₂ on M₂(Γ₀(11)): eigenvalues3 and−2; T₂−3 gives0 and−5. Normalizing a separator with residual scalar c≠0 by c⁻¹ gives residual1; operator0 has residual0 and is excluded. | Normalization survives the published omission. |
| 3.1, line 534: W₁ | r=s=1: ε=aπ, dim2. r=1,s=2: ε=−aπ²≠0, cotangent class0. r=2,s=3: ε₁ε₂=aπ³≠0 despite εᵢ²=0. | Nonzero a and r≥1 retained. |
| 3.2, line 551: W₂ | r=s=1,w=1: y=π/2, ε=aπ/2. w=−1: π=0, ε=−ay, z=−y≠0. Relation πˢ−yˢ=yˢ/w remains valid at w=−1. | No illicit cancellation of w+1. |
| 3.3, line 568: W₃ | r=t=1,s=2: y=−(a/b)π², ε=−aπ²=by, dim3. Changing c to a/b gives by=+aπ², contradicting ε=−aπ² in characteristic0. | Inverse-character sign passes. |
| 3.4, line 585: W₁ normal form | r=2,s=3 basis {1,π,π²,ε₁,ε₂,ε₁ε₂}, dimension6; m³=Eπ³, and π² mod m³≠0. r=s=1 gives m²=0, π≠0. | Count uses2ʳ, not2ˢ. |
| 3.5, line 591: W₂ normal form | r=2,s=3 dimension4+6−2=8. z²=π²−2πy+y²=π²−y². At w=−1, zˢ=−yˢ≠0 although πˢ=0. | Top line survives exceptional w. |
| 3.6, line 597: W₃ filtrations | r=t=1,s=2: y=cπ² has m/m² class0 but spans yW/y²W, dimension1. m·yW=0=y²W. | Two filtrations correctly distinguished. |
| 3.7, line 603: orbit and Y | χ(q)=−1, L=log⟨Nq⟩≠0: denominator residue −(−2)L=2L, a unit; χ(q)=1 gives0. In noncommuting 2×2 matrices, B=diag(0,1) kills e₁ but B(Ae₁)=e₂ for A swapping e₁,e₂. | Commutativity is essential for killing an orbit. |
| 3.8, line 620: Case1 image | r=s=1: U_q↦1+aπ, so (U_q−1)²=a²π²=0 but U_q−1≠0. Good prime image at π=0 is1+χ, level-prime image1. | Relations match W₁; family prerequisites R01/R04 remain. |
| 3.9, line 626: Case2 image | w=1,r=s=1: y=π/2, tame U_l↦1+(log⟨Nl⟩/2)π, distinct from1. Separation equations with w=1 have coefficient determinant1, so α=β=0. w=−1 uses y rather thanπ. | Correct tame operator and degenerate fibre. |
| 3.10, line 632: Case3 image | r=t=1,s=2: Y=y=cπ², Y²=0, YF=cπ²F. No Yⁱ basis terms with1≤i<t; basis is1,π,π². | Last-order argument handles t=1. |
| 4.1, line 650: actual representations | Complex conjugation eigenvalues±1, trace0, det−1 even at p=2. Node completion has two minimal primes and quotient fields E((T))², though the original family ring is a domain. | Product-field convention passes; R02 supplies completion theorem. |
| 4.2, line 662: good Galois element | diag(1,−1) has two eigenlines; line span(1,1) is neither, and both comparison coordinates are1. Restriction to an open subgroup of index2 followed by corestriction multiplies by2≠0 in E. | Uses all p-places and rational coefficients. |
| 4.3, line 668: adapted class | χ(g)=−1,χ(h)=1,b(g)=2,b(h)=3 gives b(gh)=5; κ(gh)=−5=−2+(−1)3. Untwisted b gives5 versus2−3=−1. Coboundary at τ gives −2v=0⇒v=0. B=(x,y) has residue dimension2. | Twist and module generality pass. |
| 4.4, line 688: substituted characters | With independent square-zero y,z and ε(X)=(1+LX)², product difference is2L²yz≠0. In W₂,W₃, yz=0 makes it0; at identity both characters1, at y=0 pair(1,ε). | Nonlinear negative control passes. |
| 4.5, line 704: diagonal entries | At τ residues1,−1, the two trace equations have determinant−2, a unit even in E/ℚ₂. The pair (a,d)=(2,3) is uniquely recovered from sums5 and−1. | Residual trace alone would not determine pair. |
| 4.6, line 710: local coefficients | Matrix [[2,1],[0,3]] preserves span(1,1), eigenvalue3: A/C=1 gives b=3−2=1; C/A=1 gives c=3−3=0. Eigenline span(1,0) has C=0 and makes division invalid. | Line avoidance supplies exactly the nonzero factors. |
| 4.7, line 716: restricted ramification | Local χ=−1 and α=2 give κ=(1−χ⁻¹)α=4, the coboundary of−2. A finite-order element m maps to v with mv=0⇒v=0. Pro-ℓ compact image in a p-adic lattice is0 for ℓ≠p. | Local triviality is cohomological, not zero cocycle. |
| 4.8, line 722: inertia generation | If quotient residue class is coboundary and zero at τ with χ(τ)=−1, its parameter satisfies−2v=0 and is0. Thus Q/mQ=0; finite Q implies Q=0. Nonfinite Q=E((t))/E[[t]] has Q/tQ=0 but Q≠0, excluded. | Finite generation is necessary and present. |
| 4.9, line 726: second-order bound | A=E[[t]], m=(t), α=t⁻¹: αm=A and αm²=tA; mB=tA when B=A. Requiring α∈A would incorrectly exclude this example. | Products in K, not A, are correct. |
| 5.1, line 740: exact determinant | Weights(2,3), columns(3t,−2t),(6t,−4t): weighted column sums0 and determinant−12t²+12t²=0. An error column in m² contributes order≥r+1. | Determinant taken after lifting to exact weighted relation. |
| 5.2, line 746: upper leading term | r=2, O=diag(2,3), L=diag(5,7): 35z²−6a z²=0 forces a=35/6 when s=r. For s>r top product is0 in grʳ and forces detL=0. | Leading coefficient and sign agree. |
| 5.3, line 752: lower class | χ(g)=−1,χ(h)=1,c(g)=2,c(h)=3 gives c(gh)=−1=2−3. Upper cocycle needs a twist; lower one already has left-action χ. | Distinct convention correct. |
| 5.4, line 769: y-line comparison | r=t=1,s=2, O⁻=2,L⁻=3: (3+2b)y=0 with y≠0 forces b=−3/2. Replacing yW/y² by m/m² gives 0=0 and loses b. | Filtration choice is essential and correct. |
| 5.5, line 775: rank zero | χ₄,p=2: f(0)=1/2=D·1. p=3: f(0)=1=D·1. Empty determinant1, not0. | Ramified and inert boundary cases pass. |
| 5.6, line 781: Gross–Stark | χ₄,p=5: f'(0)=−λ/2, D·R=(1/2)(−λ). For r=2 formal D=1,O=diag(2,3),L=diag(5,7), formula f''/2=35/6 requires f''=35/3. | Normalization consistent; general theorem relies on findings' inputs. |
| 5.7, line 791: exact order | f=Dsʳ gives order r and regulator1; f=Dsʳ⁺¹ gives order r+1 and regulator0 under leading identity. | Both directions pass without an exact-order assumption. |
| 5.8, line 795: rank one | χ₄,p=5: logarithm list(λ,−λ) has relation(1,1); projected valuation1; χ-weighted sumλ. λ=0 would force u^N=ζ5ᵐ, giving valuation pairs(N,−N)=(m,m), impossible for N>0. | The theorem survives this example; R05 fixes the claimed independence inference. |

### Conventions and all Check bullets

The following supplements the target rows with the remaining explicit Checks. Within each row the entries follow the order of the Check bullets, so the count is reproducible.

| Check block (count) | Computed tests, including negative controls |
|---|---|
| 0.1 (4) | χ₄ at2:0/r0; at5:1/r1; at3:−1/r0. Nontrivial even χ: L(χ,0)=0 and no odd component. |
| 0.2 (4) | Torsion→(0,0); (1−c)/2 acts by1 on minus space and0 on plus, even over ℚ₂; split unit coordinates(1,−1); nontrivial decomposition character projector on invariant vector gives0. |
| 0.4 (5) | Values1, −3/2, 35/6=140/24, 0, and −λ/1=(+λ)/(−1). |
| 0.5 (5) | Values1,6 (wrong factorial12), coefficient0 versus leading1, ω₂(−1)=−1/principal part1/log0, D at3 equal1 rather than1/2. |
| 0.6 (7) | ℓ=3 smoothing of ζ at0 gives(1−3)(−1/2)=1; unsmoothed Bernoulli values B₁(3⁻ⁿ)=3⁻ⁿ−1/2 have 3-adic valuation−n, unbounded below; χ₄ factor at0 gives4 and at1 gives0; full weight−1 gives−1/2 versus principal0; empty Q tuple gives divergent harmonic absolute sum and m=0, excluded; dyadic principal part of−1 is1; x+√2y=0 with rational x,y forces x=y=0, so one form suffices for n=2. |
| 0.7 (5) | Regular Laurent module H₁0,H₀ℂp versus trivial H₁ℂp; rank2 successive quotient leaves t₂ then scalar field, repeated generator gives0 and fails regularity; edge ℂp→0 fails for nonfree module; regular module with G=ℤ gives ℂp→ℂp; contragredient balancing at scalar action2 gives λ(m)/2 on both sides, wrong dual gives2λ(m). |
| 0.8 (3) | Shell indicator1/0; cross shift88 mod121; corrected evaluation0 and11 mod121 at the two specified points. |
| 1.1 (4) | Zero class restricts0; χ=−1 coboundary−2 has class0; continuous ℤp→E sends1↦1 but discrete version sends1↦0; ord(ϖ)=1,ord(unit)=0, log(1+p²)≠0, inverse Artin gives−1. |
| 1.6 (3) | Zero has all coefficients0; all y=0 gives inertia0 then class0; 2o+3ℓ extracts(2,3). |
| 1.8 (3) | 2/3; empty1; 10/21=40/84, whereas scaling only X gives40/21. |
| 2.1 (3) | At p=2, u=5∈1+4ℤ₂ and 3∉1+4ℤ₂; ε(c)=1. dπ/dk at1=1 versus dT/dk=log_p(u). f(s)=as²+bs³ gives leading π² coefficient a, while cs gives−cπ. |
| 2.2a (8) | Level8 determinant1; level11 weight2 Eisenstein dimension1 and total2; level p² count p+1 (at p=2 gives3); level25 agreement2/4 and eigenvalues±9,1332; level6 ordinary dimension2 and determinant1; χ₄ weight3 T₃ eigenvalues−8,+8 and U₂ eigenvalues1,4; weight4 U₂ roots1,8 with valuations0,3; T₂−3 acts0 on Eisenstein and−5 on cusp. |
| 2.3 (3) | At weight0, positive coefficients0 and constant1, whereas zero family has constant0. With two narrow-class components the tuple(1,0) fails the required(1,1). At p=5,u=6, shift at T=0 gives−5/6=ν₀(T), not0=ν₁(T). |
| 2.4 (3) | Orders(s,t)=(2,1) give ord W=1 and ord W⁻¹=−1. Equal orders give w=a/b; χ₄ at5 gives W=w=1. w=−1 is still a unit and Case2, despite1+w=0. |
| 2.5 (3) | Case1 leadingE₁≠0; equal-order leading(1+w)E₁ becomes0 at w=−1; correction coefficients are−aπE₁ for s=1 and+aπ²E₁ for s=2. |
| 3.1 (4) | ε=aπ,dim2; ε=−aπ²,cotangent0; ε₁ε₂=±aπˢ≠0; arithmetic rank0 has s=0,a=1 and the would-be empty relation2=0 gives zero ring, hence excluded. |
| 3.2 (3) | w=1 gives y=π/2,ε=aπ/2; w=−1 gives πˢ=0,zˢ=−yˢ≠0; top difference yˢ/w survives. |
| 3.3 (3) | Basis1,π,π²; y-line dimension1 despite cotangent0; c=−a/b gives by=−aπ² whereas wrong sign gives+aπ². |
| 3.7 (3) | Commuting killing operators kill the orbit; swapping matrix example shows failure without commutation; quotient kills πˢ⁺¹ but notπˢ; denominator residues0 versus2L for χ=1 versus−1. |
| 4.1 (3) | Eisenstein residue sends T↦0,T_l↦1+χ(l),U↦1; at χ=−1,p=2 values1,−1 coincide modulo2 but differ in E. Complex conjugation det−1,trace0. Node completion factors into two distinct branches, total quotient two fields. |
| 4.3 (3) | Twisted identity−5=−2−3 versus false untwisted5=−1; normalized coboundary−2v=0⇒v=0; (x,y)/(x,y)² has basis x,y and dimension2. |
| 4.4 (3) | Identity value1 versus false0 if constant omitted; y=0 gives(1,ε); independent square-zero variables yield discrepancy2L²yz, killed by yz=0. |
| 5.3 (3) | Lower identity−1=2−3; incorrectly twisting the lower entry gives f(gh)=1, right-action value−2+3=1 but left-action value−2−3=−5. On inertia ε−d=Ly can be nonzero despite cotangent class0. For r=t=1,s=2, yW=E·cπ²≠0. |

Additional convention tests: over ℚ₅, rec(2) acts by exponent2 on μ₅ and Art(2) by inverse exponent3; over ℚ₂, Art(2) acts by2 on μ₅ and rec(2) by3. In S₃, the contragredient rule works because (gh)⁻¹=h⁻¹g⁻¹; the proposed non-inverse dual would reverse the required composition. For C₂ at p=2, 2 is a unit of E but not of its integer ring. For the identity group r=0 the augmentation edge map and the 0-dimensional determinant both equal their identity values.

The five bold worked examples reproduce, respectively, f(0)=1/2; f(0)=1; regulator−λ; W₂=E[y]/y² with π=0; and W₃=E[π]/π³ with y=−(a/b)π². The last is a formal ring test; after rank-one nonvanishing is proved it is not an actual rank-one arithmetic case.

### Supplier, ownership and pinned-carrier ledger

**11 named supplier-contract groups** were resolved against the available main copies or current open heads. The problematic range extensions are R01/R04; the newly identified existing owner is R02. Section labels, including the former ClassFieldTheory §2.6 mapping, were resolved rather than treated as missing from a text search.

| Supplier | Address and comparison |
|---|---|
| ClassFieldTheory | Main Layers7,11–13 contain unit reciprocity, principal-idèle triviality and Hilbert class-field maximality. README line267 maps former §2.6 to Conventions C.6; line1248 states the all-finite-ℚp-algebra unit normalization. The old citation is preserved by the mapping. |
| Chebotarev | `Completed/Chebotarev/README.md:416,686` has `hasDirichletDensity_frobeniusPrimeSet`, Layer10. Auxiliary finite sets may be avoided; degree-one primes suffice since higher-degree primes have Dirichlet density0. |
| LFunctions | Main Layer5 begins line929, Layer7 line1440. Primitive functional equation and nonvanishing, with imprimitive Euler factors, support Dχ≠0. The source-side Hecke L-function is not missing. |
| ModularForms | Main §0.1, line353, handles elliptic weight1/2 and the corrected E₂ series. It does not supply Hilbert weight1 over arbitrary F. |
| IntegralIwasawaTheory | Current Conventions and §§0.1,0.4,4.2,6.0,6.3,9.3 retain the named inputs. `algebraicLog_kernel` and `bakerBrumer_algebraicNumbers` are at lines707,709; numerator/interpolation at915–917; Hilbert geometry and lifts at1307ff. Algebraic-log independence is over ℚbar, not arbitrary ℚp coefficients. |
| ArithmeticGaloisDuality | Current §§R02.1.3,R02.2.3,R02.3.3,R02.4.2,R02.4.3,D7.6,D7.7 exist, beginning lines701,1402,2295,3119,3437,6019,6223. Their rationalized lattice and dual-condition forms are the relevant inputs, not finite discrete cohomology alone. |
| DirichletPadicLFunctions | Current §0.6 includes the complete finite-extension and ℂp Iwasawa logarithms, norm–trace law and dyadic logarithmic ball. Lines277–283 distinguish README construction targets from the two light Lean predicates; absence of those construction names at the pin is not supplier drift. |
| IntegralHeckeAndGaloisDeterminants | Current §§1.3,1.4 at2271,2445 provide GMA/extension inputs; §4.1 line3259 explicitly has `Determinant.eq_of_charpoly_frobenius`. The resolver's one missing-name lead is therefore not a finding. Here 2! is invertible in E. |
| NoncommutativeAndEquivariantIwasawa | Current §F.5, lines2520–2579, supplies the two lattices, operators, ordinary control, full Hecke images and E(1,χ). Its k≥2/odd-prime/tame-character ranges were compared with the five gaps; see R01/R04 for the uncovered imports. |
| PadicFamilies | Current §§5.9a–5.13, lines2849–2957, provide expansion comparison, coefficient families, Fourier injection, reducedness at minimal tame level and the total quotient fields. Weight-one congruences do not assert general weight-one classicality. |
| OrdinaryAutomorphicFormsAndModularityLifting | Current §2.12(a), line368, gives classical two-character forms only for k≥2. Its representation clause is supplemented by the explicit all-degree/all-prime gap. It supplies no general Λ-adic two-character construction. |

Ownership searches used the roadmap index, current-head grep and the board packages, by the objects Sczech cocycle, Spiess homology, Gross–Stark regulator, Eisenstein families and Greenberg invariant. The nearby modular main-conjecture and congruence roadmaps concern elliptic/CM Selmer and Greenberg–Stevens invariants, not this totally-real Gross regulator. PadicHodgeRegulators owns K-theory/period regulators; SelmerIwasawaCohomologyPartII owns its unitary arithmetic application. AutomorphicPadicLFunctionsPartII owns CM Eisenstein–Kronecker classes, not the Sczech cocycle. No second owner of the new Gross–Stark theorem or its three finite Hecke-image computations was identified. Generic Hilbert families remain §F.5's, geometric/dual cohomology remains the named suppliers', and generic excellent completion is SchemeAndStackFoundations §0.21's. No later roadmap is proposed as a supplier.

Pinned declarations actually inspected include:

| Pinned file | Declaration or definition content |
|---|---|
| `Mathlib/NumberTheory/Padics/Complex.lean:137` | `PadicComplex`, native completion carrier ℂ_[p]; no new coefficient field needed for R03. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Basic.lean:226` | Native group homology carrier. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/Functoriality.lean:864` | Coinflation natural transformation to quotient-group homology with coinvariant coefficients. |
| `Mathlib/RepresentationTheory/Coinvariants.lean:442` and `Rep/Res.lean:43` | Quotient coinvariant representation and restriction. |
| `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean:141`, `Matrix/NonsingularInverse.lean:422`, `LinearAlgebra/Determinant.lean:203` | Multiplicativity, determinant of nonsingular inverse, and determinant-to-matrix comparison. |
| `Mathlib/NumberTheory/NumberField/ClassNumber.lean:59`, `Units/DirichletTheorem.lean:462` | Finite class group and unit rank; suitable rationalized inputs for §0.3. |
| `Mathlib/RingTheory/Henselian.lean:154`, `Localization/FractionRing.lean:744` | Adic completeness gives henselianity with its hypotheses; FractionRing localizes at nonzerodivisors and need not be a field. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:829,1057` | Continuous cocycle quotient and the trivial-action comparison, not a discrete-coefficient substitute. |
| `TauCeti/NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114`, `Local/Cyclotomic.lean:205` | Absolute Artin map and the Q₂ fifth-root normalization. |
| `TauCeti/RingTheory/KoszulComplex/Basic.lean:219,399`, `Regular.lean:140`, `Tensor.lean:340` | Native Koszul complex, H₀ quotient, regular-sequence exactness and concatenation tensor equivalence. The group-algebra augmentation adapter is additional work. |
| `TauCeti/NumberTheory/ModularForms/EisensteinSeries/Independence.lean:128`, `Dimension.lean:204` | Elliptic primitive-pair independence and cusp complement for k≥3; correctly imported rather than rebuilt in that range. |
| `TauCeti/NumberTheory/LFunctions/Hecke/Basic.lean:74` | Presented Hecke continuation; existence of the presentation is not automatic from the totalized definition. |

### Source locator ledger

**40 locator groups** were compared with the legal cached texts below. A group can contain several adjacent equations or jointly used results; this is not a claim of 40 independent proofs. DKV locators use the published page numbering, CD14 the dated author-copy pages, V15 and Lin12 their declared arXiv versions. The preprint normalization was checked separately under the same DKV16 key. All source descriptions here are paraphrases.

| No. | Locator and cached line evidence | Comparison |
|---|---|---|
| 1 | DKV16 §1, (1)–(6), pp.834–836; lines45–133 | Character components, exceptional primes, valuation and logarithm normalization. |
| 2 | DKV16 Theorem1/Remark1.1, p.837; lines156–175 | Leading term, order distinction and regulator endomorphism correction. |
| 3 | DKV16 §1.1 (7)–(8), pp.837–838; lines176–206 | Chosen split completions and determinant ratio. |
| 4 | DKV16 §1.2, pp.838–839; lines207–257 | Cyclotomic space and algebraic invariant. |
| 5 | DKV16 §1.3, p.841; lines286–323 | First-order Hecke formulas and branch normalization. |
| 6 | DKV16 Proposition2.1, Proof1 (19)–(22), pp.843–844; lines403–426 | Kummer and local/global orthogonality, with order-of-pairing sign handled consistently. |
| 7 | DKV16 Proposition2.1, Proof2 (23)–(24), pp.844–845; lines429–474 | Reciprocity proof; profinite completion is needed. |
| 8 | DKV16 Proposition2.2, p.845; lines477–501 | Product of inertia restrictions. |
| 9 | DKV16 §3.1 (25)–(27), pp.846–847; lines513–580 | Weight coordinate, families and constants; classical weight-one input differs from cited supplier ranges. |
| 10 | DKV16 Lemma3.1, p.848; lines589–600 | Ventullo family and weight shift. |
| 11 | DKV16 §3.2 (28)–(31), pp.848–849; lines600–640 | Semi-cusp construction and equal/unequal-order division. |
| 12 | DKV16 Theorem3.2, p.849; lines644–645; preprint p.16, lines559–560 | Published omission versus normalized preprint statement. |
| 13 | DKV16 Theorem3.3, pp.850–852; lines664–738 | Case1 quotient, squarefree products and independence. |
| 14 | DKV16 §3.4 (40)–(49), pp.853–854; lines785–836 | Auxiliary Y, Case2 relations and corrected dimension. |
| 15 | DKV16 proof of Theorem3.6 and Remark3.7, pp.854–855; lines837–897 | w=−1 case and tame U normalization. |
| 16 | DKV16 Theorem3.8, pp.855–856; lines898–939 | Unequal-order quotient. |
| 17 | DKV16 §4 and Theorem4.1, pp.856–858; lines940–1032 | Eigenfamilies and ordinary Galois representations. |
| 18 | DKV16 Lemmas4.2–4.3, pp.858–860; lines1033–1113 | Stabilizers and simultaneous good element, with reversed-entry twist. |
| 19 | DKV16 §4.2 (63)–(69), pp.860–862; lines1114–1178 | Completion, adapted entries and class. |
| 20 | DKV16 §4.3 (70)–(78), pp.862–863; lines1179–1236 | Substituted cyclotomic characters and diagonal comparison. |
| 21 | DKV16 Remark4.5, p.863; lines1237–1249 | Proposed scalar Artin quotient obstruction, excluded by package. |
| 22 | DKV16 Lemma4.6/(79)–(80), pp.863–864; lines1254–1297 | Nonzero local comparison coordinates and division in product fields. |
| 23 | DKV16 Lemmas4.7–4.9, pp.864–865; lines1298–1334 | Local triviality, generation and second-order bound; compact-image qualification needed. |
| 24 | DKV16 §5.1 (82)–(87), pp.865–867; lines1339–1434 | Exact lifted determinant and upper leading coefficient. |
| 25 | DKV16 §5.2, Lemma5.1/(88)–(89), pp.867–868; lines1435–1487 | Lower class, y-adic filtration and inverse-character coefficient. |
| 26 | CD14 Theorems2–3/(3), pp.3–4; lines98–149 | Full weight versus principal branch and all-prime lower bound. |
| 27 | CD14 (4)–(10), pp.5–6; lines163–228 | Distribution module, action, integrality and factor1/m. |
| 28 | CD14 §1.1 (15)–(17), Theorem1.1, pp.8–9; lines305–351 | Nonempty summation tuples and Sczech's cocycle. |
| 29 | CD14 (11) and Theorem3.1, pp.7,22; lines235–241,1048–1051 | Smoothed evaluations; refined version is credited there to the companion work. |
| 30 | CD14 (61), Proposition4.1, p.22–23; lines1063–1089 | Measure domain restriction, R06. |
| 31 | CD14 Theorem4.2/(62)–(63), p.23; lines1093–1100 | Moment recovery, with full change-of-variable factors. |
| 32 | CD14 Proposition4.3/(74), p.26; lines1265ff | Norm prefactor and full-weight interpolation. |
| 33 | CD14 (79)–(83), pp.28–29; lines1330–1419 | Integral as cap pairing and function-module support. |
| 34 | CD14 Theorems5.1–5.2, Lemma5.3/(87)–(88), pp.30–32; lines1426–1530 | Freeness, corrected homological degree and augmentation induction. |
| 35 | DDP11 Proposition1.4/Lemma1.5, pp.455–456; lines687–735 | Rank-one Kummer/duality model, generalized in package by its stated higher-rank route. |
| 36 | DDP11 Lemma2.9/Corollary2.10, pp.469–470; lines1313–1356 | Separation operators and nonzero weight-one action. |
| 37 | DDP11 Propositions3.3–3.4/Lemma3.5, pp.472–474; lines1453–1524 | Original Leopoldt-dependent construction; package replaces the relevant family using V15. |
| 38 | V15 Theorem2/§4.1, pp.14–16; lines568–610 | Unconditional normalized family and descent from a small weight neighbourhood. |
| 39 | V15 Lemmas3–4/§4.2, pp.19–20; lines728–792 | Congruence form, dyadic exponent and final family construction. |
| 40 | Lin12 §2, Proposition3.2/(5), Theorem3.3, pp.5–7; lines206–273 | Translates, weight≥3 basis, agreement density strictly greater than1/2. Primary AL13 remains uncertified. |

## Not verifiable

- Sc93 Theorem4, W86 Proposition1.5, Br82 Chapter V §3 and VII §6, and AL13 Proposition3.11/Theorem3.6 remain the four settled **uncertified works**. They were not requested again. Sczech's assertion and the weight≥3 newform statements could be compared with their explicit restatements in CD14 and Lin12; that does not certify the unread originals. In particular, the general Hilbert weight-two complement attributed to W86 was not checked against its original text.
- No Lean elaboration or build was run. The current acceptance file has zero declarations; the proposed R03 signature still requires the repair worker's elaboration check after it is added.
- The arithmetic prerequisites in the five declared gaps are contracts, not implemented theorems at the current heads. Acceptance remains conditional on their eventual supply. Their absence was not reported as a defect.
- The table tests local identities and boundary cases; it does not certify every line of the long cited proofs. CD14's refined cocycle/evaluation proofs refer to companion work; the theorem statements were verified in CD14, not independently reproved from that companion text.
- Open work was searched through the supplied index/current-head tools and the identified relevant sibling files. No claim is made about unlisted private work or open requests unavailable through those inputs. The ownership search found no conflicting fully qualified name because the acceptance file declares none.

## Source issues

- **Misprint** in DKV16 at Remark 1.1, printed page 837 (DKV16 line 169): the source says the displayed logarithm-after-inverse-valuation composite acts on Uχ; it should be an endomorphism of Xχ; affects a stated result.
- **Misprint** in DKV16 at equation (13), printed page 841 (DKV16 line 296): the source says the good-prime first-order eigenvalue has constant term 1; it should be 1+χ(𝔩), with the displayed first-order term retained; affects a stated result.
- **Misprint** in DKV16 at §1.3, display after (14), printed page 841 (DKV16 line 321): the source says the derivative uses the χ branch; it should be the χω branch used in the interpolation convention; affects a stated result.
- **Misprint** in DKV16 at §1.4, rank-one outline, printed page 842 (DKV16 line 360): the source says the un-specialized class has the displayed scalar local formula; it should be the scalar-specialized class κφ; affects the proof.
- **Gap** in DKV16 at §1.4, equation (16), printed pages 842–843 (DKV16 lines 374–385): the source says the quotient-valued determinant can immediately be scaled into the desired error quotient; it should be lifted to an exact weighted relation before discarding second-order errors, as in §5.1; affects the proof.
- **Error** in DKV16 at §1.4, after (16), printed page 843 (DKV16 line 385): the source says the relevant maximal-ideal power is always a one-dimensional line; it should be only the selected degree-r leading line; for s>r, independent powers πʳ through πˢ remain; affects the proof.
- **Misprint** in DKV16 at Proposition 2.1, equations (21)–(22), printed page 844 (DKV16 lines 416–426): the source says the same local pairing has opposite argument orders in adjacent displays; it should be consistently ordered, with the degree-one interchange sign transported; affects the proof.
- **Error** in DKV16 at Proposition 2.1, equation (24), printed page 844 (DKV16 lines 441–445): the source says the uncompleted idèle quotient is the Galois group; it should be its profinite reciprocity quotient; affects the proof.
- **Gap** in DKV16 at §3.1, Hecke generators, printed page 847 (DKV16 line 545): the source says only the listed good-prime and p-dividing operators generate the algebra being used; it should include tame level-dividing U operators, used subsequently in (42); affects the proof.
- **Misprint** in DKV16 at footnote 6, printed page 847 (DKV16 line 579): the source says the general η-series constant uses χ in the second term; it should use η⁻¹ consistently with that series; affects a stated result.
- **Error** in DKV16 at §3.2, regularity assertion, printed page 849 (DKV16 line 626): the source says the unprojected product construction is already ordinary; it should be regular in the full family module, becoming ordinary after applying e; affects the proof.
- **Misprint** in DKV16 at §3.2, case division, printed page 849 (DKV16 line 629): the source says the final compared order is again that of χ; it should be that of χ⁻¹; affects the proof.
- **Gap** in DKV16 at Theorem 3.2, printed page 849 (DKV16 lines 644–645): the source says only that some Hecke operator produces a cusp family; it should also fix E₁(1,χS) at weight one, excluding the zero operator; affects the proof.
- **Misprint** in DKV16 at §3.3, after the Fourier embedding, printed page 850 (DKV16 line 657): the source says the analytic quantities are defined by (2); it should refer to §1.3's p-adic quantities; affects nothing.
- **Misprint** in DKV16 at equations (41)–(42), printed page 853 (DKV16 lines 797,802): the source says the reduction modulus is printed with the final plus-one outside the exponent; it should be π^(s+1); affects a stated result.
- **Misprint** in DKV16 at equation (48), printed page 854 (DKV16 line 824): the source says every factor uses the same unindexed prime; it should use the i-th exceptional prime in the i-th factor; affects a stated result.
- **Misprint** in DKV16 at proof of Theorem 3.6, printed page 854 (DKV16 line 833): the source says the dimension is 2ˢ+2s−2; it should be 2ʳ+2s−2, giving 8 when r=2,s=3; affects a stated result.
- **Misprint** in DKV16 at proof of Theorem 3.6, printed page 854 (DKV16 line 836): the source says the product indexed by j uses εᵢ in each factor; it should use εⱼ; affects nothing.
- **Error** in DKV16 at Remark 3.7, printed page 855 (DKV16 lines 894–896): the source says the first-order map uses T without its logarithmic normalization and sends tame U to 1; it should use π=T/log_p(u) and retain 1+(w/(1+w))log_p⟨N𝔩⟩π; affects a stated result.
- **Misprint** in DKV16 at §4.1 after (53) and §4.2 before (66), printed pages 858,861 (DKV16 lines 1001,1159): the source says different prime indices occur within one Frobenius characteristic-polynomial identity; it should use the same prime throughout; affects nothing.
- **Gap** in DKV16 at proof of Lemma 4.2, printed page 860 (DKV16 line 1093): the source says the reversed lower entry itself is the required left-action cocycle; it should be multiplied by χ⁻¹ in the reversed eigenvalue order; affects the proof.
- **Gap** in DKV16 at §4.1 before Lemma 4.3, printed page 860 (DKV16 line 1096): the source says the line-avoidance list runs only over exceptional primes; it should include all primes above p, as required for the local divisions at nonexceptional primes; affects the proof.
- **Misprint** in DKV16 at equation (63), printed page 860 (DKV16 line 1127): the source says the representation is indexed by one eigenfamily; it should be the product representation ρ over the coefficient fields; affects a stated result.
- **Misprint** in DKV16 at §4.2 after (64), printed page 861 (DKV16 line 1138): the source says the unramified local character loses its prime subscript; it should retain one η𝔮 for each prime above p; affects nothing.
- **Misprint** in DKV16 at §4.3 before (70), printed page 862 (DKV16 line 1191): the source says the substituted character series starts with index 1; it should start with index 0 and constant coefficient 1; affects a stated result.
- **Error** in DKV16 at Remark 4.5, printed page 863 (DKV16 lines 1237–1243): the source says the full localized Hecke algebra has the displayed scalar truncated-power-series quotient; it should retain the Artin algebra: at r=s=2, πεᵢ=0 forces scalar images into (π²), contradicting ε₁ε₂=−aπ²; affects the proof.
- **Error** in DKV16 at proof of Lemma 4.7, printed page 864 (DKV16 line 1307): the source says local units away from p form a pro-ℓ group; it should separate finite residue-field torsion from the pro-ℓ principal units; affects the proof.
- **Gap** in DKV16 at proof of Lemma 4.7, printed page 864 (DKV16 lines 1307–1311): the source says the whole finite-dimensional p-adic coefficient space is pro-p; it should place the compact inertia image in a p-adic lattice before using pro-p structure; affects the proof.
- **Misprint** in DKV16 at §5.1 before (85), printed page 866 (DKV16 line 1407): the source says each row sums to zero; it should say each column sums to zero in the displayed i,j indexing; affects the proof.
- **Misprint** in DKV16 at equations (85)–(86) and their §5.2 analogue, printed pages 866,868 (DKV16 lines 1416–1417,1474): the source says the determinant display has duplicated opening delimiters; it should have one correctly delimited matrix determinant; affects nothing.
- **Misprint** in DKV16 at §5.2, lower-entry multiplication, printed page 867 (DKV16 line 1441): the source says the first product is c(σ)a(σ); it should be c(σ)a(σ′); affects the proof.
- **Misprint** in DKV16 at §5.2 after (89), printed page 868 (DKV16 line 1482): the source says the leading-term equality at t=r concerns χ; it should concern χ⁻¹, whose order is t; affects the proof.
- **Misprint** in CD14 at equation (3), author-copy page 4 (CD14 line 121): the source says the smoothed p-adic L-function takes values in ℂp×; it should take values in ℂp, since its value at zero vanishes in positive exceptional rank; affects a stated result.
- **Misprint** in CD14 at proof of Theorem 5.1, author-copy page 31 (CD14 line 1469): the source says the free coefficient module has homological dimension one; it should be projective, of projective dimension zero, so every positive-degree homology group vanishes; affects the proof.
- **Misprint** in V15 at §4.2, final proof sentence, arXiv page 20 / printed page 961 (V15 line 792): the source says the constructed family completes Theorem 1; it should refer to Theorem 2; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "1ccbef4c2b370f801a1c6751951be8729f9d2c73", "job": "RT-IntegralIwasawaTheoryPartII~1a", "model": "gpt-6-astra", "worker": "chris-3"} -->
