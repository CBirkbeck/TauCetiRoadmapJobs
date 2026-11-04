<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/163#issuecomment-6481292649 -->
Red team round 2 pass a (codex) of 9a2ec7c

Verdict: needs_changes

1. **F01** (P2) The full theta phase does change cusp orders

   **Location:** `packages/KatoEulerSystems/README.md:581`, “The phase `(−t)^((c−c²)/2)` changes no cusp order.”

   **Claim:** The phase in the unreduced theta formula can be omitted when computing orders.

   **Witness:** At N=4, (α,β)=(1/2,0), c=5, t=q^(1/2), the phase is q^(−5). Omitting it changes the q-exponent from −1 to 4, and the q^(1/4)-order from −4 to 16.

   **Exact repair text:** “The full factor `(−t)^((c−c²)/2)` contributes to the cusp order when α≠0 and must be retained before reduction of torsion indices. After extracting all q-powers and reducing the indices, the remaining discrepancy from the Bernoulli-normalized smoothed product is a root of unity and has order zero.” Add the preceding N=4 example as a negative-control Check. The corrected calculation is `2−5+2=−1`, hence cusp order −4, agreeing with §0.1.

2. **F02** (P1) The repaired path class still has the wrong conductor domain and target

   **Location:** `packages/KatoEulerSystems/README.md:1257`, “`c-δ_(N,n)(k,v)` as its push-forward to `H¹(Y(M)(ℂ), V^*_(k/ℤ))(1) ⊗ ℤ[Gal(ℚ(ζ_n)/ℚ)]`”.

   **Claim:** This constructs the path class used at level N and conductor np^m in §5.6.

   **Witness:** N=3, n=5, p=7 is admitted in §5.6. The proposed push-forward requires 5 dividing 3 and lands at M instead of N. Nakamura2023 lines 1903–1927 define the arbitrary-conductor class separately, with σ_c in both smoothing factors.

   **Exact repair text:** “For N≥3, n≥1, c≥2 and (c,6Nnp)=1 define c-δ_(N,n)(k,v_j) in H¹(Y(N)(ℂ),V*_(k/ℤ))(1)⊗ℤ[Gal(ℚ(ζ_n)/ℚ)] by
   `(c²−c^(k−j)diag(c,1)^*⊗σ_c)(c²−c^j diag(1,c)^*⊗σ_c)(δ_N(k,v_j)⊗1)`.
   Extend linearly in the specified integral coefficient basis. If M and n divide L, then the push-forward from level L is c-δ_(M,n); this is a compatibility theorem, not the definition for arbitrary n.” Also impose M|N on the push-forward at line 1249 and distinguish the operators at source level N and target level M. At N=3,n=5,c=11,p=7 the formula is defined on Y(3); c=11 is prime to 630 and σ_11 is defined modulo 5. The missing carrier in the former repair is now supplied.

3. **F03** (P2) Conductor-level interpolation omits the necessary Tate twist

   **Location:** `packages/KatoEulerSystems/README.md:1762`, “the dual exponential of the m-th specialization lies in `S(f) ⊗ ℚ(ζ_(np^m))`”.

   **Claim:** Direct specialization of the untwisted zeta class followed by the dual exponential gives the stated edge critical period.

   **Witness:** At k=2, untwisted V(f) has F⁰D=D of dimension two, whereas S(f)=F¹D is a line. Nakamura2023 lines 3708–3717 explicitly twist by r before specialization; Theorem A.1 uses exp*_(m,1), not the untwisted map.

   **Exact repair text:** “For every m≥0 first apply φ₁ to z^Ka_n(γ), then specialize, localize at p and apply exp*. The resulting exp*_(m,1) lies in S(f)⊗ℚ(ζ_(np^m)); its χ-weighted period is L_({p},n)(f*,χ,k−1)γ^±.” Make the same twist explicit after undoing φ_k in §5.4 and its nonzero Check. At k=2 the corrected target is F⁰D(V(f)(1))=F¹D(V(f)), of dimension one; at general k it is the r=1 case of Nakamura's exp*_(m,r).

4. **F04** (P2) Rational Iwasawa cohomology is replaced by an unbounded inverse limit

   **Location:** `packages/KatoEulerSystems/README.md:1753`, “`H¹_Iw(…, V_E(f)) = lim_m H¹(…, V_E(f))`”.

   **Claim:** One may invert p separately at every finite level before forming the norm limit.

   **Witness:** `TauCetiRoadmap/SelmerIwasawaCohomology/README.md:27` and §3.7 require bounded denominators. For Γ_m=C_(p^m), e_m=p^(−m)Σ_g[g] is projection-compatible in ℚ_p[Γ_m], but its coefficients have valuations −m, so (e_m) is not in ℤ_p[[Γ]][1/p].

   **Exact repair text:** “For a stable lattice T⊂V_E(f), define the rational target as `(lim_m H¹(ℤ[1/Σ_f n,ζ_(np^m)],T))⊗_O E`, independently of T. Its map into the inverse limit of rational finite-level cohomology retains a uniform denominator bound; no equality with that unrestricted inverse limit is asserted.” Remove the displayed unrestricted equality. In the group-ring test, the bounded target excludes (e_m), whereas every integral norm-compatible sequence and every single fixed p-denominator multiple remains admitted. This restores the actual supplier carrier used by the rank and denominator-removal arguments.

5. **F05** (P2) The new uniqueness proof creates an internal dependency cycle

   **Location:** `packages/KatoEulerSystems/README.md:1766`, “uniqueness through the injectivity of the dual exponential on this Iwasawa cohomology (as in 5.5)”.

   **Claim:** All of §5.1, including conductor-level uniqueness, is proved before §§5.2–5.5.

   **Witness:** §5.1→§5.5 at line 1766; §5.5→§5.3 at lines 1953–1954; §5.3→§§5.1–5.2 at lines 1873–1874. This directed cycle is internal and is not tested by the cross-roadmap depcheck.

   **Exact repair text:** “In §5.1 construct the conductor-n maps, prove bounded-denominator membership and auxiliary independence, and retain uniqueness from prescribed spanning-generator values. State interpolation after this construction. Move uniqueness from dual-exponential specializations to a separate target after §5.5, using its injectivity.” Prove the n-level injectivity needed there explicitly, with its conductor-n constituents, rather than merely citing the conductor-one rank formula. The resulting order is construction → interpolation → injectivity → specialization uniqueness, and the cycle disappears already for n=1.

6. **F06** (P1) The crystalline chart comparison loses its domain restriction

   **Location:** `packages/KatoEulerSystems/README.md:384`, “for θ of conductor `p^n`”; also lines 2070–2071.

   **Claim:** The supplier provides the chart-regulator comparison for all conductor strata.

   **Witness:** `TauCetiRoadmap/PadicHodgeRegulators/README.md:2654` restricts to n>m(Δ) and θ in B(η⁻¹,N(D)), equivalently U_D. At n=0, θ=1, the global distribution is defined but this chart regulator is not supplied.

   **Exact repair text:** “For z∈N_rig(D)^(ψ=1) with (1−φ)z in the stated Amice range, import Λ_(D,z)(θ)=φ^(−n)𝔐_z(θ) only for θ∈U_D of conductor p^n, with n>m(Δ) and the chart-radius conditions of PadicHodgeRegulators §§9.31–9.35. At low conductor use the independently constructed Kato map, not Λ_(D,z).” Retain this domain in the supplier contract, §6.1 and the rank-one Check. The θ=1 instance now evaluates only the global 𝔐_z, without applying an unavailable chart map.

7. **F07** (P2) The critical-slope explanation asserts an unproved exact growth rate

   **Location:** `packages/KatoEulerSystems/README.md:2211`, “both sides have growth of order exactly `k − 1`, outside `ℋ_(k−1,L)`”.

   **Claim:** Equality of the Frobenius slope with k−1 forces both candidate distributions to have exact growth k−1.

   **Witness:** §6.1 supplies only membership for h strictly above the slope; it gives no lower growth bound. Its zero input has zero output of every growth order. §§6.2–6.4 do not even construct the normalized scalar at critical slope.

   **Exact repair text:** “At slope k−1, the stated growth estimates no longer place both candidates in ℋ_(k−1,L), and the noncritical normalization of §6.2 is not established. Even when critical candidates are separately constructed with growth at most k−1, interpolation alone cannot distinguish their difference from the nonzero logarithmic product of §6.5.” At k=2,p=3 that product is zero at s=4 and −log₃4≠0 at s=1; the explanation needs no false lower bound on a particular class.

8. **F08** (P3) The identity-pullback Check does not test torsion evaluation

   **Location:** packages/KatoEulerSystems/README.md:521–523: “a constant-one torsion evaluation fails the first.”

   **Claim:** Identity pullback rejects replacement of the evaluated theta unit by 1.

   **Witness:** For the replacement evaluation e(P)=1, id*e(P)=1=e(P), and f*(e(P)⁻¹)=1=(f*e(P))⁻¹. Both stated laws still hold.

   **Exact repair text:** “Identity pullback and compatibility with inversion test the pullback operation, not the torsion evaluation. The nonzero cusp order in the second Check rejects constant-one evaluation.” The replacement has order 0, whereas the c=5 level-four unit has order −4.

9. **F09** (P2) The abelian Tate-module adapter omits conjugation of the eigenform

   **Location:** `packages/KatoEulerSystems/README.md:2709`: “`V_p(A_f)` is the sum over `λ | p` of the `V_λ(f)(1)`”.

   **Claim:** This is the coefficient-preserving decomposition supplied by AutomorphicGaloisRepresentations §6.1.

   **Witness:** Twist the level-11 form (a₂=−2) by a cubic θ with θ(2)=ζ₃. At ℓ=2 the supplied arithmetic determinant is 2ζ₃²; packages/KatoEulerSystems/README.md:137–138 gives determinant 2ζ₃ for V(f)(1). These differ.

   **Exact repair text:** “With the coefficient action of AutomorphicGaloisRepresentations §6.1, the λ-factor of V_p(A_f) is the arithmetic representation V_λ(f*) (1), equivalently V_λ(f)^*. If we instead write V(f)(1), transport the coefficient action and the place λ through complex conjugation explicitly. Apply the Bloch–Kato result to the resulting conjugate constituents.” Add the cubic-twist test with p=5: f=g⊗θ has a₂=−2ζ₃ and ε(2)=ζ₃²; V(f*)(1) has trace −2ζ₃ and determinant 2ζ₃², exactly the arithmetic factor. The original V(f)(1) has trace −2ζ₃² and determinant 2ζ₃. For rational-coefficient elliptic forms f=f*, so the elliptic signatures need no change. The supplier explicitly preserves the K_f-action (`TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:2443–2450`); an unlabeled ℚ_p-linear reindexing alone does not supply that identification.

## First-round repair verification

IDs below are those in the prior reports and repair report; they are not new findings. All quoted passages refer to this head. “Repaired” assesses the specific earlier defect, not every assertion surrounding the repair.

| Earlier finding | Status | Repaired passage and witness |
|---|---|---|
| r1a F01, torsion coordinates | repaired | packages/KatoEulerSystems/README.md:473: “along the torsion section `ae₁ + be₂`”. At N=7,(1/7,0), a=1,b=0 gives e₁; adding 7 to a changes nothing. Kato2004 line 247. |
| r1a F02, m=1 Check | repaired | packages/KatoEulerSystems/README.md:858: “`m = 1` is outside the conductor domain”. The intersection is ∅; the ℚ-class is now Cor(c̃_p). |
| r1a F03, scalar spans | repaired | packages/KatoEulerSystems/README.md:1816: “the Λ-span and the `Λ_ℚ`-span of all values coincide”. E-linearity gives p⁻¹z(v)=z(p⁻¹v). Restricting to lattice inputs gives a finite generated nonzero Λ-module, which cannot be p-divisible. |
| r1a F04, K₂ norm | repaired differently | packages/KatoEulerSystems/README.md:704: “asserted only when `SK₁(R) = 0`”. The real and étale realizations use trace; the rotation example retains nonzero K₁ transfer and zero determinant class. No integral general norm replacement survives. |
| r1a F05, global regulator supplier | partly repaired | packages/KatoEulerSystems/README.md:382: “only the global `D_cris`-valued distribution `𝔐_z`”; chart/global distinction is restored and 2^(−n)d≠d retained. The supplier's additional high-conductor chart domain is still omitted; see S06 below. |
| r1a F06, conductor/field distinction | repaired | packages/KatoEulerSystems/README.md:807: “The raw modular class is the conductor component”. For odd m, c̃_(2m)=P₂c̃_m while the field evaluation is unchanged; supplier §2.4(a) agrees. |
| r1a F07, c invertible | repaired | packages/KatoEulerSystems/README.md:476: “first a unit … over `ℤ[1/Nc]`”. N=7,c=5 uses ℤ[1/35]; §0.3 now owns extension over 5. The cited Kato §1.10 proves general-base theta existence, not the newly proposed cusp proof; the latter also needs every vertical component to meet a controlled cusp. |
| r1a F08, missing phase | partly repaired | packages/KatoEulerSystems/README.md:578 includes `(−t)^((c−c²)/2)`. N=7,α=0,c=5 gives ζ₇⁴ as required; the new assertion that this full factor never affects orders is S01. |
| r1a F09, conductor-n construction | partly repaired | packages/KatoEulerSystems/README.md:1750: “construct katoZetaMapConductor n”. The target is now present over ℚ(ζ_n), but its new formulation has S03–S05. |
| r1a F10, coefficient zeta and path | partly repaired | packages/KatoEulerSystems/README.md:1239: “define operatorZetaCoefficient”; packages/KatoEulerSystems/README.md:1251: “Define pathClassCoefficient”. Coefficients at k=4 have rank 3, not 1; the path's conductor construction is still incomplete (S02). |
| r1a F11, toy identity Checks | repaired as to removal | packages/KatoEulerSystems/README.md:959,1923,2136 replace the three identity-map models by actual period/reciprocity tests. Nonzero C·L·γ distinguishes zero. The twist in the §5.4 Check still needs S03. No numeric eigenform/period example is supplied by those existential tests. |
| r1a F12, open-image headline | repaired | packages/KatoEulerSystems/Suggested.lean:47 now states `serre_openImage` on the actual Tate-module representation. Non-CM is the surjectivity of ℤ→End(W over ℚ̄); the CM i-automorphism fails it. All-prime finite index and almost-all full image both occur. |
| r1a F13, duplicate twisting | repaired | packages/KatoEulerSystems/README.md:1628: “That section also supplies its global finite-coefficient description”. Only localization and local compatibility remain local targets; the supplier §3.7 has the stated diagonal formula. |
| r1a F14, Hecke linearity | repaired | packages/KatoEulerSystems/README.md:932: “`ℤ_p`-linear in the literal-dual input”. At k=2 a rank-one input no longer claims a scalar Hecke action covering distinct target eigenspaces. |
| r1a F15, finite ramification | repaired | packages/KatoEulerSystems/README.md:792: “finite set of rational primes”; packages/KatoEulerSystems/README.md:1469: “finite set Σ of places”. The all-primes counterexample is excluded; §3.3 also requires finite S. |
| r1a F16, unavailable headlines | repaired | packages/KatoEulerSystems/Suggested.lean:17–33 names the regulator, structure, finite-index, interpolation and Perrin-Riou targets with their missing carriers. No stand-in theorem replaces them. |
| r1a F17, eta ownership | repaired | packages/KatoEulerSystems/README.md:1277: “closed form of `Polylogarithms` §5.13”. The supplier has exactly the curve form and rational Chern comparison; iη integrates to 2πi log 2 on (2,z). |
| r1a F18, auxiliary Check | repaired | packages/KatoEulerSystems/README.md:515: “q-exponents `−1` and `−2`”. Division by 24 and 48 gives −1/24 in both cases; zero gives 0. |
| r1a F19, division-place scope | not repaired; settled | packages/KatoEulerSystems/README.md:185: “assume admissibility” remains. Repair report marks this not actionable because it requires an additional unsourced argument. This pass does not claim such an argument or re-raise the settled scope decision. Fixed dimensions in the division subgroup remain 0 and 2. |
| r1a F20, regulator page range | repaired | packages/KatoEulerSystems/README.md:1297 and packages/KatoEulerSystems/sources.toml:20 now say “pp. 163–179”. Kato2004 lines 2429–2450 contain the final deduction on p.179. |
| r1b F01, adapter domain | repaired | packages/KatoEulerSystems/README.md:826–829 explicitly gives ℚ and ℤ_p-layer corestrictions. For odd p, ℚ₁ has conductor p² and comes from c̃_(p²), not a non-existent m=1 conductor component. |
| r1b F02, growth space | repaired for noncritical theorem | packages/KatoEulerSystems/README.md:2206: “uniqueness in `ℋ_(k−1,L)`”. At k=2 and slope 1/2 the ambient space is ℋ₁. The new claim of exact critical growth is not justified: see S07. |
| r1b F03, strict-kernel locator | repaired | packages/KatoEulerSystems/README.md:1473–1474 cites Rubin I.7.3, II.3.7 and Kato 13.13. Rubin2000 lines 923 and 1442 locate the duality statements. |

## Computed statement register

The register covers the named targets in all 42 numbered subsections (including 4.2a), their defining formulas and the associated API assertions. The README does not format these target names in bold; its bold items are labels such as “Checks” and “Admissible pairs”. Definitions share the explicit standing context of their numbered subsection. A computed control is not a proof of the general theorem; source and supplier limitations are recorded separately. “Retain” means this instance gives no additional finding. The zero ring, inseparable fields and non-elliptic cubics are excluded by the characteristic-zero field/ellipticity assumptions where those assumptions apply; they are not purported arithmetic examples.

| Statement and context | Instances and computed values on the two sides | Result / change |
|---|---|---|
| Conventions: geometric/arithmetic Frobenius, k≥2 | k=2,a₃=2,ε=1: geometric 1−2u+3u²; arithmetic 1−(2/3)t+(1/3)t²; substituting u=t/3 matches. | Retain distinct conventions. |
| Conventions: row action and ordered K₂ twist | (a,b)·[[1,1],[0,1]]=(a,a+b), versus column (a+b,b); k=4,r=2 gives 2−2+(4−2)=2=k−r. | Retain. |
| Admissible pair (packages/KatoEulerSystems/README.md:179), non-CM or CM | Nonzero unipotent in split M₂ has fixed dimension 1; in a division algebra g−1 is invertible unless g=1, giving dimensions 0 or 2. | Scope restriction remains settled r1a F19. |
| 0.1 rationalSiegelUnit | N=4,α=1/2,c=5,7: orders −4/24=−1/6 and −8/48=−1/6 in q^(1/4); rational q-order −1/24 both. | Retain; genuine nonzero control. |
| 0.1 auxiliary independence / rationalSmoothing | g=1, gc=g: c=5 gives 25−1=24; c=7 gives 49−1=48; normalized values both 1. c instead of c² gives 4/24≠6/48. | Retain. c=±1 excluded. |
| 0.1 torsion coordinate evaluation | N=7,α=1/7,β=0 gives e₁; α+1 gives (1+7)e₁=e₁. The old direct fractional multiple was undefined. | Repaired. |
| 0.1 siegelPullback / smoothing compatibility | Identity gives g=g; inverse gives f*(g⁻¹)=(f*g)⁻¹. Constant-one evaluation gives 1=1 in both tests. | S08. |
| 0.2 torsionIndexAction / siegelGaloisDistribution | A=1 has one preimage; A=2 has four; A=0 has no finite degree-4 formula. Shear sends (1/3,0) to (1/3,1/3), not (1/3,0). | Retain A≠0 and row action. |
| 0.2 Galois/composition laws | For row (a,b), matrices M₁,M₂ give ((a,b)M₁)M₂=(a,b)(M₁M₂); identity fixes both coordinates. | Retain; noncommuting shears distinguish reversed order. |
| 0.3 theta analytic product / phase | c=5,t=q^(1/2): q²·q⁻⁵·q²=q⁻¹; dropping phase gives q⁴. For α=0,β=1/7 phase is ζ₇⁴, order zero. | S01: only residual constant phase preserves order. |
| 0.3 siegelLeadingExponent and Bernoulli identity | B₂(0)/2=1/12; B₂(1/2)/2=−1/24; B₂(1/5)/2=1/300. The α=1/5 smoothed c=7 value is 49/300−B₂(2/5)/2=1/5. | Retain Bernoulli formula; reduce cα modulo 1. |
| 0.3 siegelCuspOrder | N=4,α=1/2,c=5: 4·(25−1)·(−1/24)=−4; c=7 gives −8. Ignoring phase would give 16 for c=5. | Retain formula with S01 correction. |
| 0.3 siegelIntegralDescent | N=7,c=5 starts over ℤ[1/35] and ends over ℤ[1/7]; the generic unit stays the same. Zero/constant-one cannot have the prescribed nonzero horizontal cusp orders. | General descent proof requires all vertical components controlled; no counterexample asserted. |
| 0.4 siegelDegeneracyProduct | A=1 gives g=g. A=2 at α=0: constant orders 2/12=1/6, equal to order of g(q²); the two-coordinate A² product would have four factors. | Retain distinct one-coordinate formula. |
| 1.1 k2NormProjection | Repeated level primes: M→M′ with same prime sets gives identity factor 1; (2,3)→(6,9) adds 3 in first coordinate and is excluded. Identity transfer gives {u,v}={u,v}. | Retain. |
| 1.1 K₁ transfer projection law | Rotation over real circle: determinant 1 has unit class 0, but SK₁ class has order 2 and is nonzero. Full K₁ transfer retains it. | Repaired; no general determinant-only K₂ assertion. |
| 1.1 transferNormRealization, Chern | Mod 3, exchanging two degree-one Kummer classes multiplies cup product by −1=2; class paired with 1 gives 0. | Retain ordered cup convention. |
| 1.1 transferNormRealization, real | w²=z and η(w,2)=−log(2)darg(w): sum over two branches is −log(2)darg(z)=η(z,2). | Retain trace formula. |
| 1.2 k2AuxiliaryEulerFactor | Identity repeated-prime branch gives 1. New good prime gives 1−T′diamond+ℓdiamond; new bad prime lacks the quadratic term. Setting T′=2,S′=1,ℓ=3 gives 1−2X+3X². | Retain with moment factors in 2.1. |
| 2.1 katoEulerPolynomial | k=2,r=1,ℓ=3,a=2: 1−2X/3+X²/3; k=4,r=2: 1−2X/9+X²/3. Untwisted 1−2X+3X² differs. | Retain. |
| 2.1 katoEulerAdapter conductor indexing | m=1: p∤m, so no raw c̃₁; extension is Cor(c̃_p). For odd m, fields at m and 2m coincide, but raw classes obey c̃₂ₘ=P₂c̃ₘ. | Repaired; keep adapter. |
| 2.1 field adapter / ℤ_p layers | For odd p first ℤ_p-layer has conductor p² and degree p; at p=2 the first layer is real conductor 8, degree 2. Corestriction gives field-labelled class. | Retain conductor versus field distinction. |
| 2.2 heckeDualTwistDictionary | k=2: V′(−1)=V(f*), so V′(1)=V(f*)(2); k=4 gives twist −3. S′ scaling changes by ℓ² in weight four. | Retain. |
| 2.2 literal integral dual | Sym² pairing has anti-diagonal −2,1,−2, determinant −4; invertible over ℚ₂, not over ℤ₂. Rank at k=2 is 1. | Retain literal dual at p=2. |
| 2.3 fullLevelZeta | z(0)=0 and z(x+y)=z(x)+z(y); a rank-one coefficient input cannot carry multiple distinct target Hecke eigenvalues by one scalar. Reciprocity with nonzero Lγ gives nonzero image. | Repaired ℤ_p-linearity; nonzero test is conditional on a nonzero period. |
| 2.3 fullLevelEulerOperator, arbitrary commutative R and module M | T=S=σ=id,ℓ=3 gives 1−1+3=3; σ=0 gives id; T=2,S=0,σ=id gives −id; M=0 gives the unique zero endomorphism on both sides. | Retain including zero ring/module. |
| 3.1 modularFiltration | k=4: F⁰=D,F¹=F²=F³=M,F⁴=0; gr¹=0. k=2: F¹=M,F²=0. | Retain filtration, not associated graded. |
| 3.1 modularDualExp | Restriction to F¹ keeps exp* values in M; zero maps to 0, sums map to sums. At twist zero F⁰ has dimension 2 versus dimension-1 cusp line. | Retain restricted map; S03 for its later misuse. |
| 3.2 katoEisensteinE/F and Fourier normalization | E₄ constant 1/120; level N=3 gives 3⁻⁴/120=1/9720; incorrect unscaled series gives 1/120. F scaling is 3²=9. | Retain. |
| 3.2 weight-one/weight-two exclusions | E¹=F¹; F²_(0,0) excluded; regularized E² has its nonholomorphic correction. Smoothed F² at c=5,7 has factors 24,48. | Retain low-weight branches. |
| 3.2 action, distribution, dlog | At A=1 factor 1; distribution has A^k, e.g. A=2,k=4 gives 16. dlog(g)=−F² changes sign upon inversion; dlog(1)=0. | Retain minus sign. |
| 3.3 periodMap | Zero differential gives 0; twice a differential gives twice its period. Reversing integration 1→2 changes value I to −I. | Retain chosen orientation. |
| 3.3 archimedeanEisensteinZeta | At r=r′=k−1 the branches coincide. At k=2,c=5,d=7 smoothing edge factors are 25−5=20 and 49−7=42, product 840. | Retain overlap and smoothing. |
| 3.3 archimedeanCriticalValues | k=2,r=1: (2πi)^0=1; sign χ(−1). k=4,r=1: exponent 2 and (2πi)²=−4π²; r=3 gives exponent 0. | Retain. |
| 3.4 operatorZeta | T₂=3, S₂=1 gives factor 1−3·2⁻ˢ+2·2⁻²ˢ=(1−2⁻ˢ)(1−2¹⁻ˢ). Zero-input operator gives zero value. | Retain weight-two convergence Re(s)>2. |
| 3.4 operatorZetaCoefficient | Weight 4 Eisenstein factors ζ(s)ζ(s−3): pole at s=4; at s=1 pole×trivial zero is removable. Weight-k coefficient rank k−1 gives 3 at k=4. | Retain widened pole and convergence domain. |
| 3.4 pathClassCoefficient / pushforward | N=3,n=5 satisfies later conductor assumptions but 5∤3, so no class from the stated divisor recipe; coefficient group ring has rank φ(5)=4. | S02. |
| 3.4 Beilinson regulator / eigenform specialization | η(2,z)=log(2)darg(z); ∮iη=2πi log(2); swapped pair gives −2πi log(2); (z,z) gives 0. | Retain iη convention and imported owner. |
| 4.1 modularImagePair / integralImage_almostAll | k=3 determinant squares have index 2 at each odd p; product has infinite index without the cyclotomic coordinate. Split rank-two representation permits nontrivial unipotents. | Retain pair rather than unrestricted adelic GL₂. |
| 4.1 irreducible_cyclotomic | Standard SL₂ representation has no common invariant line: upper unipotent fixes e₁, lower fixes e₂, intersection 0. Division case also has no invariant line over its defining subfield. | Retain precise image input. |
| 4.1 upperUnipotent / HasOneDimFixedSpace / iff | x=0: kernel(U−1)=E², dimension 2; x=2 over ℚ₂: kernel=Ee₁, dimension 1. Over ℤ₂ cokernel has ℤ/2 plus free rank one. | Retain x≠0; not integral primitivity. |
| 4.1 diagonal and division controls | diag(ζ,1),ζ≠1 has fixed dimension 1; ζ=1 has 2. In division algebra d≠1 yields inverse of d−1, fixed dimension 0. | Retain. |
| 4.2 analyticTwistNonvanishing | k=3,r=2 is unitary boundary s=1; k=4,r=3 gives s=3/2; k=2,r=1 is central and trivial χ may have L=0. | Retain finite-exception central statement. |
| 4.2a strictKernel_eq_dualSelmer | T=ℤ_p(2): dual twist at cyclotomic infinity has invariants ℚ_p/ℤ_p, dual ℤ_p, while base invariants can be 0. T=ℤ_p(1) gives cyclotomic class-group limit. | Retain strict local conditions; rank-one tests illustrate duality outside the modular rank-two specialization. |
| 4.3 katoHypotheses_to_rubin | Nonzero upper unipotent gives rank-one rational cokernel; mod p it may become identity, giving rank-two cokernel. Integral criterion consequently needs a unit entry. | Retain separate rational/integral hypotheses. |
| 4.3 modularEulerSystemBound | J=(1): length Λ/J=0, hence strict H² length 0. Lengths 2≤3 satisfy the bound; reversing 3≤2 fails. J=0 is not a finite-index input. | Retain direction. |
| 4.4 rationalIwasawaStructure | Full dyadic ring: (1−σ)(1+σ)=0 for σ²=1; ordinary nonzero-element torsion would kill free summands incorrectly. After rational idempotents, each rank is 1. | Retain regular-scalar torsion and componentwise rank. |
| 4.4 CM/integral clauses | CM Q(√−2) at p=2 is retained; integral freeness requiring p odd is not applied there. For zero module rank is 0, so it cannot represent the asserted rank-one H¹. | Retain rational/integral separation. |
| 4.5 finite_of_pseudoNull | R=ℤ_p[[T]],M=R/(p,T): length 1, cardinal p, support height 2. M=R/(p)=𝔽_p[[T]] infinite with height-one support. R=ℤ_p,M=ℤ/p finite but not pseudo-null. | Retain implication, not converse in dimension 1. |
| 4.5 finite_of_regular_annihilator | μ=T gives R/μ=ℤ_p, p-torsion-free; μ=p gives R/μ=𝔽_p[[T]], violating that hypothesis. M=R/(p,T) obeys away-p support condition and is finite of size p. | Retain. |
| 4.6 twist_loc_comm / finite local diagonal | p=3,κ(σ)=4,j=1 gives φ(σx)=¼σφ(x); untwisted commuting would give coefficient 1. ζ₉³=ζ₃; inverse convention gives ζ₃⁻¹. | Retain semilinearity and roots direction. |
| 4.7 serre_openImage and almost-all surjectivity | Non-CM endomorphism ring ℤ gives rank-one ring; E:y²=x³−x has i-endomorphism, not n for any integer n, so fails hypothesis. Every prime ℓ has Tate-module rank 2; ℓ=0,1 are excluded. | Retain native Lean headline. |
| 4.7 Hyp and cyclotomic torsion | SL₂ has no common fixed vector (upper/lower kernels intersect 0), giving no infinite ℓ-primary torsion; small exceptional primes can retain finite torsion. | Retain “finite”, not uniformly zero. |
| 5.1 katoZetaMap / defining generators | E-linearity gives z(0)=0 and z(p⁻¹v)=p⁻¹z(v); for a generator with nonzero reciprocity value C·L·γ, zero construction gives 0≠C·L·γ. | Retain generator characterization; uniqueness dependency S05. |
| 5.1 katoZetaMapConductor: rational carrier | In the group-ring tower, e_m=p⁻ᵐΣg projects to e_(m−1); coefficient valuations are −m, not uniformly bounded. Integral-limit rationalization excludes this sequence. | S04. |
| 5.1 conductor interpolation | k=2: untwisted F⁰D=D has dimension 2, while S(f) has dimension 1; twisting by 1 gives F¹D=S(f). n=5 keeps ℚ(ζ_(5p^m)), not ℚ(ζ_(p^m)). | S03. |
| 5.1 uniqueness via exp* | Dependency edges 5.1→5.5→5.3→5.1 form a length-3 directed cycle; generator uniqueness needs no return through 5.5. | S05. |
| 5.1 smoothing μ | j=k−1 gives second exponent j+1=k and first exponent 2; at k=2,j=1,d=7 the second scalar begins at d²=49, not 7. | Retain squared scalar. |
| 5.1 katoZetaSubmodule / span / conjugation | E-linear image x gives p⁻¹x in the image. Λ-span of all E-inputs equals Λ_ℚ-span; E-span{x} need not contain (γ−1)x. Lattice span of nonzero finite generated module cannot equal its p-inversion. | Repaired span distinction. |
| 5.2 integralZetaFiniteIndex | Finite quotient ℤ/p has cardinal p and vanishes after rationalization; Λ/(p) is infinite and cannot be certified just by vanishing away from p. | Retain use of 4.5's extra support conditions. |
| 5.3 zetaCriticalInterpolation | k=4,r=3: twist k−r=1, period exponent k−r−1=0. k=4,r=1: twist 3, exponent 2, sign (−1)^0χ(−1). | Retain twist before specialization. |
| 5.4 twistedKatoZeta / conjugation | Input twist 1−k followed by output k gives total 1. Two conjugation minus signs give (−1)²=1. At k=2,ℓ=3 norm polynomial is 1−2X+3X². | Retain twist-one definition; S03 for exp* use. |
| 5.4 extensionality | If maps agree at each γ, their difference is zero at each γ; no converse surjectivity is asserted. | Ordinary API stays in README. |
| 5.5 parabolicIwasawa_torsionFree / exp injectivity | Parabolic rank r=0 gives zero module and injective zero-domain map. Boundary rank b>0 cannot be replaced by this zero conclusion. On admitted rank-one eigenspaces nonzero specialization excludes zero map. | Retain hypotheses; S05 order. |
| 5.6 parabolicFullLevelCharacterisation | Rational splitting s_N has pr∘s_N=id, so difference in the boundary has parabolic projection 0. Integral denominator p gives s_N(v)∉integral lattice. N=3,n=5 requires S02's independent conductor. | Retain rational scope; S02/S03 upstream. |
| 6.1 perrinRiouMap filtration hypothesis | V=ℚ_p(1): V*(1)=ℚ_p, D_cris⊂F⁰ holds; V=ℚ_p gives V*(1)=ℚ_p(1), whose F⁰=0, so hypothesis fails. | Retain twist in hypothesis. |
| 6.1 ramified interpolation / Gauss factor | Quadratic χ mod 3: G(χ)=i√3, inverse=−i/√3. For φη=2η,p=5,n=2,r=1, (5⁻¹φ)⁻² gives 25/4, not 25. | Retain inverse Gauss and φ factor. |
| 6.1 unramified interpolation | r=1 gives 1−φ⁻¹. If φ=1, this is 0, distinguishing exceptional zero from a nonzero generic factor. | Retain condition η=(1−p⁻ʳφ)η′. |
| 6.1 chart/global relation | φd=2d: n=1 gives φ⁻¹d=d/2, n=2 gives d/4. At n=0 the global value exists, but the supplier does not supply a chart value there. | S06. |
| 6.1 growth | Zero input has image 0 in every ℋ_h; positive-slope estimate supplies h>slope, not equality of minimal growth order. | S07 for later lower-bound overclaim. |
| 6.2 katoScalarRegulator / normalization | η↦aη,γ↦bγ changes period-normalized value by a⁻¹b; a=2,b=1 gives half the old value. η+(−η)=0 gives zero. | Retain dependence on choices. |
| 6.2 coefficient field / slope | E:y²=x³−x at p=3 has a₃=0, α²=−3, slope 1/2<1; α∉ℚ₃ but α∈ℚ₃(√−3). Zero root cannot be divided by. | Retain extension L and α≠0. |
| 6.3 katoPeriodDictionary | Gauss product for odd quadratic χ mod 3 is (i√3)²=−3=χ(−1)·3. At weight 2 the Mellin shift remains κ; omitting it evaluates at adjacent integer. | Retain sign and variable shift. |
| 6.4 noncriticalAnalyticArithmeticComparison | Split multiplicative α=1 gives 1−α⁻¹=0; nonsplit α=−1 gives 2. Supersingular p=3,α²=−3 gives (1−α⁻¹)²=2/3+2α/3. | Retain exceptional-zero and coefficient-extension cases. |
| 6.4 uniqueness / critical discussion | At k=2,slope=1/2 choose h=1 in ℋ₁; at slope=1 the strict h>slope condition never gives h=1. | Noncritical repair holds; S07. |
| 6.5 critical logarithmic obstruction | k=2,p=3,κ(γ)=4: log₃(s/4) is 0 at s=4, −log₃4≠0 at s=1. At all finite-character multiples of 4 it vanishes. | Retain interpolation alone is insufficient. |
| 6.5 bad-reduction domains | Supercuspidal local factor with a_p=0 can have no nonzero D_cris eigenline; α=0 makes α⁻¹ meaningless. | Retain exclusion from scalar-eigenline construction. |
| 6.6 ellipticLocalLattice | Odd p logarithm on E₁ has pℤ_p image, yielding the p⁻¹ factor in the dual lattice. For y²+xy=x³+1 at p=2, Δ=−433 and the stated log image is 4ℤ₂, not 2ℤ₂. | Retain odd-prime lattice restriction; dyadic control rejects extension. |
| 6.6 Kato period / Euler constants | E:y²=x³−x has two real components, so Ω=2Ω⁺ and r=2r⁺; y²=x³+x has one component, Ω=Ω⁺. | Retain total-real-period normalization. |
| 7.1 canonicalNonTorsion / quotient torsion | In rank-one Λ_ℚ component, nonzero z gives generic span dimension 1, quotient generic rank 0; z=0 leaves quotient rank 1. | Retain nonzero on every component. |
| 7.2 cohomologicalUpperBound | Local H²=0 gives length(H²)≤length(H¹/Z). Exceptional local length 1 changes right side by +1. Split multiplicative weight 2 supplies the possible exceptional character κ⁻²χ; nonsplit does not force it. | Retain necessary condition, not an iff. |
| 7.2 integral membership and bound | Z⊂H¹ and image SL₂ at odd p preserve integral height-one information. Replacing H²(T) by H²(V) would erase p-power torsion, e.g. ℤ/p→0. | Retain corrected integral version. |
| 7.3 ellipticCyclotomicFG, non-CM preliminary route | Bounded rank alone allows ℤ[1/p], infinite generated; adding finite torsion T₀ of exponent e makes differences σP−P killed by e. Open e-power subgroup fixes all points. | Retain descent, not rank-only inference. |
| 7.3 rank-zero Selmer / Sha | Positive-rank point contributes ℚ_p/ℤ_p, infinite; nonzero L at 1 is needed. Finite p-primary groups for every p alone allow ⊕_pℤ/p infinite; 7.8 eliminates almost all. | Retain separate full-Sha step. |
| 7.4 ordinary/multiplicative divisibility | Bound char(X) divides pᵗL differs from exact divisibility by a possible p-power; t=0 gives exact version. At split multiplicative augmentation, L and Coleman image vanish, so augmentation factor is retained. | Retain hypotheses for stronger version. |
| 7.5 formalGroupUniversalNorms | Good ordinary p=5,a_p=2: #Ẽ(𝔽₅)=4; p-completion of reduction is 0. A finite p-primary reduction group under repeated norm multiplication by p has inverse limit 0. | Retain completed-point comparison; uncompleted reduction can survive prime-to-p. |
| 7.5 freeness | Formal norm module Λ has rank 1; zero module has rank 0. At p=2 this subsection uses the ℤ₂-extension and its procyclic Γ, not the full cyclotomic Γ with sign torsion. | No additional counterexample; deep freeness uses cited local theory. |
| 7.6 noFiniteSelmerSubmodule | Λ/(p,T) is finite of size p and nonzero, so torsion alone is insufficient; supplied criterion uses residual/global vanishing and local conditions. | Retain separate theorem. |
| 7.7 ellipticOrdinaryControl | αβ=p: 1−β is a unit and v_p(1−α)=v_p(1−α⁻¹). Cokernel p-order therefore carries twice this valuation. If α≡1 mod p it is positive. | Retain squared local factor and torsion assumptions. |
| 7.8 rankZeroShaUpperBound | If v_p(L/Ω)=0, upper bound forces #Sha[p∞]≤1, hence trivial. If valuation=2, bound permits size p², not p⁴. | Retain upper, not equality. |
| 7.9 SelBK / χ-part | k=2 has only r=1=k/2; off-central branch has no r. k=3,r=1,2 are both off-central. Finite-place local condition is image of H¹_f(V), not all H¹(V). | Retain cases and local condition. |
| 7.9 blochKatoSelmer_finite / almost-all vanishing | Central L=0 with rank-one elliptic points gives ℚ_p/ℤ_p inside Selmer, so cannot be finite. Trivial and quadratic χ can have different ranks. | Retain componentwise nonvanishing; division-place scope settled. |
| 7.9 abelianBlochKatoComparison and Tate adapter | A=0 gives local/global groups 0; Kummer quotient is the image defining the torsion local condition. For f=g⊗θ,θ(2)=ζ₃, arithmetic determinant is 2ζ₃², versus 2ζ₃ for V(f)(1); V(f*)(1) restores 2ζ₃². | Retain Kummer comparison; coefficient adapter S09. |
| 7.9 modularAbelianVariety_selmer_finite | Product of finite point groups of orders 5 and 7 has order 35; zero abelian quotient has order 1. Rank-zero plus Mordell–Weil gives finite, whereas ℚ/ℤ is rank zero and infinite. | Retain finite-generation input. |
| 7.9 ellipticCharacterPart | Trivial G: I=0, all P qualify. C₂ sign: I=(1+σ); fixed order-3 P gives 2P≠0 and fails, fixed order-2 P gives 2P=0 and passes. | Real-body definition preserves torsion. |
| 7.9 ellipticCharacterPart, order-four convention | χ(2)=i modulo 5: 1+σ₂² evaluates 0; coefficient at 2 is ia₂, coefficient at 5 is 0. Inverse convention would give −ia₂. | Retain Gal→power direction. |
| 7.9 ellipticCharacterPoints_finite | m=1 yields K=ℚ and original elliptic coefficients; m=5,trivial χ,a₅=1 removes factor 1−1/5+1/5=1. Split/nonsplit factors 4/5,6/5 stay nonzero. | Retain imprimitive characters and entire continuation. |
| 7.9 modularAbelianVariety_cyclotomicFG / elliptic version | m=1: x^(1ⁿ)=1 iff x=1, field ℚ. m=6: ζ₆ⁿ has both 2- and 3-power parts, fields nested by divisibility. m=0 would give all x at n=1 via x⁰=1, so is correctly excluded. | Retain hm≥1. |
| 7.9 nonsingular curve / analytic continuation controls | Singular y²=x³ has group ℚ⁺ with elements 1/n, not finite generated; ellipticity excludes it. Entire difference vanishing on Re(s)>3/2 is identically 0, so F(1) is fixed. | Retain both hypotheses. |
| 7.9 katoTamagawaBound / normalized index | M=O,z=p⁻¹: choose y=1,c=p, index 1/#(O/p)<1; choose y=p,c=p² gives #(O/p)/#(O/p²), same value. A positive H² cardinal cannot obey this bound, forcing integrality under (3). | Retain denominator and nonzero z. |

### Suggested.lean declaration contexts

There are no section `variable` or `include` blocks: every needed assumption is in the declaration itself. Universe-polymorphic K occurs only in the last two declarations. This is a static source audit, not an elaboration result.

| Declaration, layer and line | Explicit variables / instances | Computed boundary and negative controls | Outcome |
|---|---|---|---|
| serre_openImage, 4, line 47 | W over ℚ, IsElliptic, DecidableEq ℚ̄; hW: every geometric isogeny endomorphism is an integer; ℓ with Fact Prime in both clauses | ℓ=0,1 excluded; ℓ=2,3 included. CM i has square −1 and cannot equal integer n since n²≠−1. Rank T_ℓW=2, not rank 0. | Matches 4.7; hW explicitly retained. |
| ellipticCyclotomicFiniteGeneration, 7, line 64 | W over ℚ, IsElliptic; m:ℕ, hm:1≤m | m=1 field ℚ; m=2 full dyadic tower; m=6 mixed tower; m=0 would give ℂ by x⁰=1 and is excluded. | Matches 7.9, including CM; not an existing Mordell–Weil one-lemma consequence for m>1. |
| ellipticCharacterPart, 7, line 72 | W, IsElliptic; K:Type u, Field, DecidableEq, Algebra ℚ K; ψ:Aut_ℚ(K)→*ℂ | P=0 gives each sum 0; trivial group I=0; C₂ sign gives (1+σ)P=0 with order-2 torsion retained. Nonabelian groups are allowed by definition; ψ kills commutators and the ideal action remains meaningful. | Real body on native carriers; no finite-extension hypothesis needed for definition. |
| ellipticCharacterPoints_finite, 7, line 88 | W, IsElliptic; m:ℕ, NeZero; K:Type u, Field, DecidableEq, Algebra, IsCyclotomicExtension {m}; χ; entire F, equality on half-plane, F(1)≠0 | m=1 as above; m=3 order-3 fixed point fails sign part; m=5 inverse χ changes ia₂ to −ia₂; F=0 cannot satisfy F(1)≠0. | Matches continued L-value theorem; does not assume its finiteness conclusion. |

## Supplier, ownership and locator register

The local main copies, supplied open heads and the pinned libraries were searched by object as well as by proposed declaration name. The cross-roadmap resolver's sole lead, `ClassicalAlgebraic.finiteTrace`, is not a finding: `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:582` declares it in §0.8. It is a planned supplier target, not a claim of a pinned Lean declaration. The package declares no gaps and its plan has an empty gaps list.

| Supplier contract audited | Resolution and convention check |
|---|---|
| PadicFamilies §4.0.1–§4.0.3 | Theta/Siegel/symbol construction, modular moments and reciprocity are owned there; lines 2355 onward. Current §4.0.1 has c invertible, ordered cup, explicit Euler factors; no duplicate construction is added here. The admissibility qualification remains the settled issue above. |
| ModularCurves §§0A,2A,2D,2E,5B; ModularCurvesPartII §§3.13–3.15,4.5,4.8,5.8,5.11–5.12,5.15–5.16,6.1–6.3,8.1–8.5,9.1–9.2,9.12,14.1–14.4,14.8–14.12,16.2 | Current full-frame, trace, cusp, literal coefficient and parabolic targets resolve. §14.11 needs factorial invertibility for symmetric self-duality, as retained in §2.2. The full-level pairing component and unrestricted full curve remain different objects. |
| SchemeKTheoryOperations §§2.2–2.4,3.6,6.1; K2SymbolsBrauer §§6.4,6.7–6.9,8.1 | Proper perfect/finite flat transfer scope, full K₁ projection and product-normalized comparison resolve. Raw Hopf comparison has sign −1; product-normalized θ₂♮ has sign +1. No determinant-only general transfer survives. |
| ModularForms Layers 0,7,9 | Native/roadmap Eisenstein normalization, continuation and primitive associates of twists resolve on main. Kato's exact E/F normalization and operator zeta are not supplied by these generic statements. |
| AutomorphicLFunctionsAndLocalFactors AL.3; GL2AutomorphicRepresentationsAndTransfer R16.5.3 | Boundary nonvanishing anchor is at README:2293; unitary/classical shift is at README:1215. GL₂×GL₁ has no equal-rank pole exception. For weight 3 at r=2 the shifted real part is 1. |
| AutomorphicGaloisRepresentations §§1.2,1.5–1.6,4.5,4.8,5.1–5.2,6.1,7.2–7.3,7.5 | Current realization, integral lattice, irreducibility, comparison and image targets resolve. §7.5 preserves the inner-twist/quaternion restriction. Its arithmetic coefficient action in §6.1 is the mismatch S09. |
| SelmerIwasawaCohomology §§0.7–0.11,2.7–2.8a,2.12–2.12a,2.15,2.19–2.21,3.0–3.7,3.9–3.21,4.9,4.26 | The named local conditions, twist and comparison interfaces resolve. Rational Iwasawa cohomology has uniform denominators: S04. The global twist finite-coefficient construction is imported, with only localization compatibility added here. |
| ArithmeticGaloisDuality R02.1.2,R02.2.1–R02.2.3,R02.4.2–R02.4.4,D7.3–D7.4 | Finite-ramification restriction/corestriction, Tate duality and Poitou–Tate interfaces are the stated dependencies; real dyadic terms are not discarded. |
| EulerSystemsAndKolyvaginSystems §§2.1–2.2,2.4–2.5,4.3,4.17,8.2–8.3,8.6–8.7,8.16,8.37–8.39 | Conductor presentation is not the field-indexed system; current §2.4 supplies the adapter. Kato's separate hypotheses are not renamed Rubin's, and §4.3 owns their implication here. |
| PadicMeasuresIwasawaAlgebras §§4.1–4.6 | Main §4.1, README:2379, is a normal local domain theorem, so §4.5's non-domain finite-support statement is a genuine extension. Characteristic ideal calculations still use their separate normal-domain/component hypotheses. |
| PadicHodgeRegulators §§1.4,1.7,1.11,8.8,8.13–8.16,8.18,8.20–8.22,9.31–9.36 | Odd-prime crystalline and Coleman scopes stay distinct from the de Rham chart. The lost chart domain is S06; the map at low conductor must use the independently constructed global map. |
| ModularSymbolsPadicLFunctions §§0.2,0.7–0.8,1.1–1.3,2.5,3.0,3.2–3.3 | Periods and rational splitting resolve. Supplier weight is symmetric degree k, so classical weight here is k+2; its slope bound k+1 becomes classical-weight-minus-one. Rescaling eigenline bases rescales the measure, not its inverse. |
| CompletedCohomologyAndLocalGlobalCompatibility §2.6 | README:843–868 supplies the integral map and rational isomorphism with literal dual and the extra Tate twist. It expressly does not supply an integral symmetric-power self-duality. |
| EllipticCurveModularity R29.4–R29.6; EllipticCurves Layers 1,4,4.5b,6,7 | Actual elliptic modularity and Tate/quotient comparison resolve. Main EllipticCurves supplies the formal logarithm, number-field Mordell–Weil and real periods. Finite generation over an infinite cyclotomic tower is not its Mordell–Weil theorem. |
| EtaleCohomologyFoundations §0.8; Polylogarithms §5.13 | Finite trace resolves on main; current Polylogarithms README:1262–1264 supplies η, tame symbol and rational Chern comparison. Kato uses iη, giving the explicit 2πi log 2 test above. |
| HeightsRationalPointsAndObstructions §1.7 | README:614–616 supplies finitely generated A(K) for a number field, not for an arbitrary infinite cyclotomic extension. |

Ownership searches also found the later `EllipticCurveModularityPartII` §6.0e claiming the common theta/symbol construction and modular rank-zero application. This package already imports the earlier PadicFamilies owner for the geometric construction, and does not acquire a reverse dependency on that later roadmap. That sibling's competing ownership claim does not justify moving a supplier edge upward here. `HeegnerPointEulerSystems` declares a gap requesting general number-field adelic open image from ArithmeticGaloisRepresentations; its current §6.4 defines genericity but does not prove Serre's non-CM theorem. The rational-field theorem here is a consequence of this package's stronger modular image target, not a duplicate of a current declaration in that supplier. No identical fully qualified Lean declaration was found in the searched main, completed, pinned or open Lean sources.

The required dependency command, run read-only against this README and the supplied order, returned:

```text
depcheck: 171 roadmaps, 1196 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. This does not detect the internal cycle S05. No order file was changed.

### Source text checks

These 27 locator groups were resolved against the supplied legal numbered extractions. A group can contain several adjacent numbered results; it is counted once. No claim of certifying an unread paywalled proof is made.

| Source and locator group | Direct text witness and result |
|---|---|
| Kato2004 §§1.3–1.10, pp.121–125 | Lines 212–370: torsion-coordinate, auxiliary theta and product comparison; S01 distinguishes the full phase from a residual root of unity. |
| Kato2004 §2.11, p.131 | Lines 584–603: repeated-level-prime argument; its unrestricted ring norm assertion is not retained by the package. |
| Kato2004 §§3.1–3.11, pp.134–142, Eisenstein normalization | Lines 800–960: exceptional weight-two series, Fourier scaling and distribution. Values 1/120 and 1/9720 separate normalizations. |
| Kato2004 §7.20, p.179 | Lines 2429–2450: final deduction of the regulator formula; confirms repaired end page 179. |
| Kato2004 Theorems 12.4–12.6, pp.221–223 | Lines 4030–4102: lattice-first rationalization, structure, canonical morphism, finite quotient; supports S04 and the integral/rational distinction. |
| Kato2004 §12.8, pp.223–224 | Lines 4130–4144: almost-all integral image and overbroad all-place split-image claim; admissibility repair remains explicit. |
| Kato2004 Theorem 13.4, pp.225–226 | Lines 4160–4261: distinct modular hypotheses and cohomological bound, not an identification of records by name. |
| Kato2004 §13.13, pp.233–234 | Lines 4517–4558: local H² support and integral deduction; exceptional rank one, not a universal vanishing assertion. |
| Kato2004 §§14.1–14.5, pp.234–237 | Lines 4566–4661: χ-part is killed by the integral group-ring ideal; elliptic points and cyclotomic finite generation, rank-one index normalization. |
| Kato2004 §§16.2–16.6, pp.269–271 | Lines 5860–6018: Perrin-Riou interpolation and strict noncritical growth comparison. Does not supply an exact lower growth order for every class. |
| Kato2004 §§17.2–17.4, pp.272–273 | Lines 6040–6084: ordinary Selmer and rational away-p/integral all-height-one bounds with additional hypotheses. |
| Nakamura2023 §3.1.5, v2 pp.38–43 | Lines 1740–1940: coefficient operator, k-dependent pole and independently defined arbitrary-conductor smoothed path. S02. |
| Nakamura2023 Appendix A, v2 pp.86–89 | Lines 3650–3865: exp*_(m,r), conductor-n map, input/output twists and conjugation. S03. The d versus d² source slip is not propagated. |
| Nakamura2014 Theorem 1.5 (=3.10), v2 | Lines 190–227: big exponential for de Rham (φ,Γ)-modules, distinct from a weight-space chart extrapolation. |
| Colmez1998 Theorem 7 and Remark 8 | Lines 300–327: de Rham local Iwasawa construction; normalization must still be fixed by the stated interpolation. |
| Weibel2013 III Example 1.5.4, pp.6–7 | Lines 295–312: the rotation matrix detects nonzero SK₁ despite determinant one. |
| Weibel2013 III Corollary 1.7.1, pp.8–9 | Lines 395–413: full K₁ transfer for finite projective extension, and its field-norm specialization. |
| Rubin2000 I.7.3 and II.3.7, pp.17,29 | Lines 923 and 1442: duality/strict-local input; repaired locator is not the rank hypothesis II.3.1. |
| Rubin2000 III.5.15–5.18, pp.52–54 | Lines 2409–2476: Coleman equality, p-power ambiguity, augmentation factor, finite-submodule criterion and trivial-character cokernel. |
| Rubin2000 Appendix B Lemma 3.1, pp.153–154 | Lines 6652–6667: inverse limit with integral coefficients and diagonal finite-coefficient description. |
| Loeffler2017 Remark 1.2.4 and Theorems 2.2.2,2.3.1, pp.5–6 | Lines 198–202,254–289: adelic determinant obstruction, quaternion image and open image of the pair. |
| GhateGonzalezQuer2005 Corollary 4.7, p.714 | Lines 641–643: possible ramification only above discriminant, 2N or infinity; not a claim that every such place ramifies. |
| Serre1972 Théorèmes 2–3, pp.294,299 and Corollary 1, p.300 | Lines 1421–1425,1625–1637: residual surjectivity, adelic openness and almost-all full factors. Supports the strengthened Lean statement. |
| BurungaleTian2025 Theorems 2.3–2.4, v2 pp.4–5 | Lines 179–198: rationalization of lattice cohomology and nonzero zeta map. A secondary restatement does not repair the image issue in Kato's proof. |
| Greenberg1999 Theorem 4.1 | Lines 1480–1495: squared ordinary reduction factor and finite Selmer hypotheses; anomalous primes retain a nontrivial factor. |
| Ribet1981 Appendix Theorem 1 | Lines 20–48: torsion of A over the cyclotomic extension is finite, used with the separate rank/descent argument. |
| Ribet1985 §§3–4, pp.190–193 | Lines 220–334: inner-twist fixed field, quaternion centralizer, almost-all split integral image and Papier's coset description. General all-place split image does not follow. |

## Verified sound

- Read all 2968 lines of `packages/KatoEulerSystems/README.md` and all 101 lines of `packages/KatoEulerSystems/Suggested.lean`; reviewed 23 previous findings individually. The computed register has 100 README statement/convention rows covering all 42 numbered subsections, plus four Lean declaration rows. All 49 Checks blocks (170 bullets) were inspected; numerical, symbolic and wrong-model evaluations are grouped in the register rather than repeated per bullet. This is not a proof of the deep theorems.
- The locator register records 27 directly inspected source-locator groups across all 13 available source texts. The supplier register records 16 cross-roadmap contract groups, with the source/target, coefficient and normalization qualifications noted there. S02–S06 and S09 record the discrepancies; no upward supplier edge was found.
- The headline results are the Beilinson regulator identity (§3.4), rational/integral Iwasawa structure (§4.4), Serre open image (§4.7), canonical and twist-one zeta morphisms with interpolation and uniqueness (§§5.1–5.6), the general de Rham Perrin-Riou map and noncritical equality (§§6.1–6.4), non-torsion and the cohomological inequality (§§7.1–7.2), cyclotomic finite generation and rank-zero finiteness (§7.3), ordinary/multiplicative divisibility (§7.4), the finite-submodule/control route to the rank-zero upper bound (§§7.5–7.8), and abelian-field Selmer/point finiteness, general cyclotomic finite generation and the Tamagawa bound (§7.9). The three statable elliptic headlines are present. The main nonstatable families are identified by missing carriers in the module docstring. The technical formal-norm/control steps share the missing Iwasawa/Selmer carriers, rather than justifying surrogate Lean statements.
- The four Lean declarations use actual carriers and have no section-variable loss visible in the source. Pinned `TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:42–59` gives the exact coordinate action; `Mathlib/NumberTheory/Cyclotomic/Gal.lean:44–77` fixes the automorphism-to-power direction; `Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:68–85` is the formal Euler-product coefficient function, not its analytic continuation. The continuation hypothesis is therefore necessary. `Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:62–72` still requires a supplied topological representation and all local field data. A bare subgroup constructor is not the missing arithmetic comparison.
- The one-tactic probe leaves no padding finding: the three theorems are not consequences of the kept definition or a pinned lemma; the one definition is needed to state the character-part theorem. The m=1 cases are controls, not separately admitted theorems. No `lemma`, `set_option`, sorry'd data, `True` stand-in, extra roadmap import, evaluation command or process narrative was found in the two reviewed files.
- The read-only diff check lists 10 changed files, all under `packages/KatoEulerSystems/`, with 4438 inserted lines. The package files were not edited and no Lean command was run. The only new deliverables of this pass are this report and scratch notes.

## Not verifiable

- Elaborated signatures are unavailable. The supplied signature capture failed before producing types because a Tau Ceti object file was missing. The explicit read-only/no-Lean instruction was followed; no `#check` scratch elaboration or build was run. All type/context conclusions above are source-level, not claims of successful elaboration at the pins (Mathlib f6090c7095e1e56b3464c1daba5f24631f1290d2; Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a).
- FontaineMessing1987 is waived. Schneider1985, JacquetShalika1976, Rohrlich1988, Rohrlich1984, Ribet1980, PerrinRiou1994, PerrinRiou1990, BlochKato1990 and DiamondShurman2005 are settled uncertified sources. Their locators remain citations without text certification; none was requested again. In particular, the strongest integral local-lattice/formal-norm results are not independently re-proved here from the inaccessible primary texts.
- Some displayed formulas in the Kato extraction are visibly corrupted, notably the exact numerator module in line 4094. Those glyphs alone cannot certify a new printed erratum; the report relies instead on the readable lattice/rational definitions and ensuing proof. No unavailable OCR was run.
- The division-place generalization remains the settled r1a F19 issue. This report does not turn a lack of the split-image proof into a counterexample to Kato's final finiteness/structure conclusions, or claim a new proof at those places.
- The numerical nonzero-period Checks at §§2.3,5.4,6.2 are existential tests using a character supplied by nonvanishing; no exact numerical eigenform period was computed. The nonzero product versus zero test is conditional on those named theorem inputs.

## Source issues

- **Misprint** in Kato2004 at §1.9, printed p.125 (line 330): the source says the quadratic cusp-exponent term is a/(2N²); it should be a²/(2N²); affects a stated result.
- **Error** in Kato2004 at §2.11, printed p.131 (lines 584–588): the source says determinant norm can replace K₁ transfer in a general finite-flat symbol projection; it should be full K₁ transfer, with determinant replacement under an additional SK₁-vanishing condition; affects the proof.
- **Error** in Kato2004 at (12.8.2), printed p.223 (lines 4138–4141): the source says every non-CM coefficient place contains an open split SL₂ subgroup; it should be the quaternion norm-one group, split only at split places; affects the proof.
- **Misprint** in Kato2004 at Theorem 14.5(3), printed p.236 (line 4647): the source says the required image hypothesis is numbered 12.5.1; it should be 12.5.2; affects a stated result.
- **Misprint** in Kato2004 at §14.13, printed p.242 (lines 4857–4860): the source says the period is L_({p})(f,k−r)γ±; it should be (2πi)^(r−1)L_({p})(f*,k−r)γ± in the conventions of 12.5(1); affects the proof.
- **Misprint** in Nakamura2023 at §3.1.5, v2 printed p.41 (lines 1812–1818): the source says the general-weight operator is holomorphic except at k=2 and excludes s=2; it should be possible pole s=k and comparisons away from that pole; affects a stated result.
- **Misprint** in Nakamura2023 at proof of Theorem A.1, v2 printed p.87 (line 3785): the source says the conductor-n second smoothing factor begins with d; it should begin with d², consistently with conductor one; affects the proof.
- **Misprint** in Loeffler2017 at proof of Lemma 1.1.4, preprint p.3 (line 113): the source says both degree-two central simple algebra classes are unramified; it should distinguish the split and division classes; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "9a2ec7c832901df0bfb00a8ee1460bc143bbb2c1", "job": "RT-KatoEulerSystems~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
