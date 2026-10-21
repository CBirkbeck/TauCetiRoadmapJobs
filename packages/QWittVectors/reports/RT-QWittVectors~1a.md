<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/81#issuecomment-6308348841 -->
Red team round 1 pass a (codex) of c5fd3cd

Verdict: needs_changes

1. **F01** (P3) Stale theorem numbers and internal Bockstein reference

   Location: `packages/QWittVectors/README.md:1285`, “Theorem 9.1 … Corollary 9.3”; `packages/QWittVectors/README.md:1156`, “with β_m from 9.4”.

   Claim: These locators identify Borger’s étale results and the constructed framed Bockstein.

   Witness: borger line 1995 labels Theorem 9.2; borger line 2095 labels Corollary 9.4. The framed Bockstein is constructed at README:1116 (§9.3); §9.4 constructs a product homotopy.

   Exact repair text: In the Borger reference replace “Theorem 9.1” by “Theorem 9.2” and “Corollary 9.3” by “Corollary 9.4”. In §9.5 replace “with β_m from 9.4” by “with β_m from §9.3”.

2. **F02** (P2) The framed-automorphism headline is missing despite available carriers

   Location: `packages/QWittVectors/Suggested.lean:120` (end of file); `packages/QWittVectors/README.md:979`, “construct unique continuous A[[h]]-algebra automorphisms”.

   Claim: The representative file ends after Layer 1, omitting the Layer 8 existence-and-uniqueness milestone even though its rings, framing and automorphisms are expressible directly at the pin.

   Witness: Mathlib pin: `Algebra.Etale`, `Mathlib/RingTheory/Etale/Basic.lean:205`; `PowerSeries.algebraPowerSeries`, `Mathlib/RingTheory/PowerSeries/Basic.lean:942`; `AlgEquiv`. These suffice for the signature below; no q-Witt, de Rham or completion construction is needed.

   Exact repair text: After closing the existing `BigWitt` namespace, add the following section and target; list `QWitt.framedGamma_existsUnique` under §8.1. Its algebra linearity already implies continuity for the h-adic filtration. Retain the README's commutation and divisibility API.

   ```lean
   namespace TauCetiRoadmap.QWittVectors

   /-! ## Layer 8: Complete framed difference calculus -/

   /-- An étale frame has a unique series-algebra automorphism congruent to the identity
   modulo the series variable and multiplying the chosen coordinate by one plus that variable. -/
   theorem QWitt.framedGamma_existsUnique
       (A : Type*) (R : Type*) [CommRing A] [CommRing R] [Algebra A R]
       (r : ℕ) [Algebra (MvPolynomial (Fin r) A) R]
       [IsScalarTower A (MvPolynomial (Fin r) A) R]
       [Algebra.Etale (MvPolynomial (Fin r) A) R] (i : Fin r) :
       let t : Fin r → R := fun j =>
         algebraMap (MvPolynomial (Fin r) A) R (MvPolynomial.X j)
       ∃! γ : PowerSeries R ≃ₐ[PowerSeries A] PowerSeries R,
         (∀ f : PowerSeries R,
           PowerSeries.constantCoeff (γ f) = PowerSeries.constantCoeff f) ∧
         ∀ j : Fin r, γ (PowerSeries.C (t j)) =
           (if j = i then 1 + PowerSeries.X else 1) * PowerSeries.C (t j) := by
     sorry

   end TauCetiRoadmap.QWittVectors
   ```

   This is a proposed signature, inspected against source declarations; no elaboration was run, as required by the read-only brief.

3. **F03** (P3) A named theorem target states a proof-order observation

   Location: `packages/QWittVectors/README.md:896`, “The proof uses V and d only, so it is available before 7.5.”

   Claim: `QWitt.VPD_noFrobenius` is presented as a theorem to prove.

   Witness: The entire alleged conclusion concerns the proof and its place in the roadmap. The mathematical assertion for every q-V system is already `QWitt.verschiebungPrimeDifferential` at README:890, matching wagner line 1856.

   Exact repair text: Delete the `Prove QWitt.VPD_noFrobenius` API clause. In the construction paragraph retain: “The identity holds in every q-V system; its proof uses only Verschiebung and the differential.” No replacement theorem name is needed.

4. **F04** (P3) Eleven Checks lack a discriminating computation

   Location: `packages/QWittVectors/README.md:218`, `:518`, `:646`, `:692`, `:708`, `:724`, `:740`, `:906`, `:1112`, `:1192`, `:1258`; for example, “No perfect-cover, Noetherian or F-finiteness hypothesis is added to this theorem.”

   Claim: These bullets serve as mathematical Checks.

   Witness: README:692 tests no étale map; :906 sets all V-images to zero or repeats a defining relation; :1192 asserts that dV must be killed without exhibiting dV outside im V; :1258 repeats the proof route.

   Exact repair text: Replace the identified bullets with the following instances, retaining the general cautions in the surrounding prose where needed:

   - §1.6 (:218): “For S={1,2}, R=ℤ and R′=ℤ×ℤ with the diagonal étale map, W_S(R′)=W_S(ℤ)×W_S(ℤ); the F₂ pushout is ℤ×ℤ.”
   - §3.6 (:518): “For R=ℤ, m=n=2, q²−1 acts as zero on Q₂(ℤ)=ℤ[q]/(q²−1); completion at this parameter leaves the ring unchanged.”
   - §4.5 (:646): “The ring map ℤ[T]→ℤ sending T to 2 is not a Λ-map from the toric structure to the canonical one: it sends ψ₂(T) to 4, whereas ψ₂(2)=2.”
   - §5.1 (:692): “At m=1 the quotient ℤ→𝔽₂ is not étale: its target is not flat, since Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂. Thus the étale conclusion cannot extend to arbitrary coefficient maps.”
   - §5.2 (:708): “Take A=R=ℤ, R′=𝔽₂ and m=d=2. Put B=Q₂(ℤ)=ℤ[q]/(q²−1). Here Q₂(𝔽₂)=ℤ/4 with q=1, and the first-ghost target for R is ℤ with q=−1. The periodic resolution with maps q+1 and q−1 gives Tor₁^B(ℤ/4,ℤ)=𝔽₂. The ordinary ghost square therefore fails to be a derived pushout.”
   - §5.3 (:724): “For A=ℤ, R=ℤ/4 and m=1, Q₁(R/A)=ℤ/4 has the nonzero 2-torsion element 2; perfect coverage of A alone does not make the coefficient algebra torsion-free.”
   - §5.4 (:740): “For R=ℤ[T₀,T₁,…] and m=1, Q₁(R)=R is not Noetherian: the ideals (T₀,…,T_n) form a strictly increasing chain.”
   - §7.4 (:906): “Use the {1,2}-truncated q-V system with P₁=P₂=Ω*_{ℤ[T]/ℤ}, q=1, structure maps id and gh₂, and V₂ in degree i equal to multiplication by 2^(i+1). For x=T, dV₂(T²)=4T dT=V₂(T)dV₂(T); reversing the sign gives −4T dT, and omitting V₂(T) gives 2dT.”
   - §9.2 (:1112): “At p=2, α=0, S₀=ℤ₂[[h]]/(h). Tor₁^{ℤ₂[[h]]}(S₀,S₀)=S₀, whereas S₀⊗_{S₀}S₀=S₀ has no negative cohomology. Thus tensoring even the degree-zero terms over the ambient series ring introduces an extra degree.”
   - §9.6 (:1192): “For A=ℤ, R=ℤ[T], m=p=2, dV₂(T) is not in V₂(Ω¹_{R/ℤ}): F₂dV₂(T)=dT, whereas F₂V₂(ω)=2ω and dT is not divisible by 2. Killing im V₂ alone therefore does not produce a differential quotient.”
   - §10.2 (:1258): “For A=R=ℤ, m=2 and degree zero, reduction modulo 2 is 𝔽₂[h]/(h²). Its h-power torsion has bound 2; h≠0 excludes bound 1. The mod-2 bound differs from the bound 1 before reduction.”

## Verified sound

Coverage: all 1,288 README lines and all 120 Suggested.lean lines were read. The inventory contains 53 numbered milestones and 217 leading named target/API clauses, plus the embedded ghost-polynomial definition and the operations introduced alongside their milestone. All seven bold supplier-gap contracts were read. The Lean inventory has nine top-level declarations: one structure, one definition, three admitted theorem signatures and four proved examples. Its three structure fields were also checked.

All 161 Check bullets were inspected: 150 have no false mathematical value identified, and eleven require the discriminating replacements in R04. This is a mathematical inspection count, not a claim that 150 Lean tests ran. Both kept definitions have two proved examples, including positive and negative instances. The three admitted signatures retain their needed hypotheses explicitly and quantify uniqueness only over the truncation set.

Source coverage: 81 distinct explicitly identified source line anchors were inspected across eight legally cached works. The 79 anchors listed below have matching contexts; the two additional Borger anchors expose the stale theorem labels in R01. Counts are distinct line anchors, not repeated citation occurrences or a count of formal proofs. No cited work was unavailable.

| Source | Line anchors inspected, with surrounding statements and hypotheses |
| --- | --- |
| pridham | 371, 506, 635 |
| wagner | 305, 320, 366, 435, 471, 475, 483, 552, 591, 603, 1006, 1083, 1194, 1214, 1332, 1348, 1485, 1504, 1513, 1556, 1565, 1573, 1583, 1621, 1651, 1715, 1822, 1849, 1893, 1956, 2011, 2044, 2053, 2561, 2690, 2692, 2703, 2810, 2830, 2842, 2849, 2858, 2882, 2892, 2950, 3022, 3026, 3033, 3178, 3198, 3459, 3491, 3492, 3584, 3644 |
| scholze | 291, 319 |
| bhatt-scholze | 775, 778, 3898, 4316, 4378 |
| wagner-habiro | 493, 647, 679 |
| hesselholt | 205, 217, 268, 301, 711, 811 |
| borger | 603, 1323, 1995, 2095 |
| langer-zink | 453, 601, 605 |

The conventions checked include the right-hand scalar action in the Adams twist; length a+1 for Div(p^a); the gcd coefficient in FV; first-ghost indexing; q-integer normalization of VF; dF=nFd; degree-dependent ghost factors; q-fixed coefficient Frobenius versus q↦q^p framed Frobenius; the cochain Koszul minus sign; and the positive Bockstein convention. The explicit homotopy in §9.4 supplies a boundary identity rather than importing the stronger, unsupported cochain-commutativity step in wagner line 3033.

The declaration table uses the namespace `TauCetiRoadmap.QWittVectors.BigWitt` throughout. Every declaration is in Layer 1. There are no ambient `variable` or `include` blocks, and no additional standing typeclass assumptions to disappear from the admitted types.

| Declaration and location in Suggested.lean | Explicit variable and instance context | Instances tried; result | Change |
| --- | --- | --- | --- |
| `TruncationSet`, :21 | No parameters; carrier `Set ℕ`; positivity and positive-divisor closure fields | Empty set and Div(6) satisfy the fields; {2} fails because 1 is missing | None |
| `ghostPolynomial`, :28 | `{R : Type*} [CommRing R]`, n and ℕ-indexed coordinates | n=1,2,6; R=0 and F₂; n=0 has a total definition but is not used by positive-index theorems | None |
| `ghost_image`, :33 | R/CommRing; S; ring endomorphisms φ; explicit prime-lift hypothesis hφ; b | Empty S; integer ghosts (1,3) and (0,1); characteristic 2. No commutation or torsion-freeness is needed for existence | None |
| `ghost_injective`, :46 | R/CommRing; S; explicit injectivity of n-multiplication for each n∈S; x,y; equal ghosts on S | Empty S and zero ring; torsion-free integers; failure over F₂ without hS. No equality outside S is claimed | None |
| `ghost_equiv_of_units`, :55 | R/CommRing; S; explicit IsUnit(n) for n∈S; b | Empty S; R=0; rational coefficients; arbitrary coordinates outside S | None |
| First proved `example`, :64 | Closed, with integer-valued empty coordinates | Constructs empty and Div(6) truncation sets and uniqueness of the empty coordinate product | None |
| Second proved `example`, :83 | Closed | Divisor 1 contradicts carrier {2} | None |
| Third proved `example`, :91 | `{R : Type*} [CommRing R]`, x; integer specialization in second conjunct | Computes ghosts 1,2,6 and integer pair (1,3); coefficients and divisor exponents agree | None |
| Fourth proved `example`, :106 | Closed; `ZMod 2` and ℤ | Nonzero second coordinate has zero ghosts over F₂; integer equation 2x=1 rules out ghost pair (0,1) | None |

The following table records the adversarial instances and outcome for every numbered milestone and its named API clauses. “None” means no repair identified by this pass; it does not mean the future theorem has been formalized. Identity and composition laws were checked with their stated domains, as well as against the source context. Claims involving new carriers remain README targets, except for the omitted easy headline in R02.

| Section and all named target clauses | Instances tried and result | Change |
| --- | --- | --- |
| §1.1, README:98: `BigWitt.TruncationSet`; `TruncationSet.ext`; `TruncationSet.div_mem`; `BigWitt.ghostPolynomial_map` | Empty set; Div(6); forbidden singleton {2}; ghosts at 1, 2, 6; zero ring. Divisor closure and positive indexing hold. | None |
| §1.2, README:120: `BigWitt.ghost_image`; `BigWitt.ghost_injective`; `BigWitt.ghost_equiv_of_units` | Empty S; integers with identity prime lifts; ghosts (1,3) versus (0,1); nonzero coordinate with zero ghosts over F₂; units over Q. Existence needs no torsion-freeness; uniqueness is only on S. | None |
| §1.3, README:138: `BigWitt`; `BigWitt.mk_coeff`; `BigWitt.ext`; `BigWitt.map`; `BigWitt.restrict_comp`; `BigWitt.nonunital_unitization` | W_empty; zero ring; Div(1); τ(1)+τ(1)=(2,−1) at level 2; nonunital zero-multiplication ring. Unitization retains the nonunital case. | None |
| §1.4, README:162: `BigWitt.frobenius`; `BigWitt.frobenius_comp`; `BigWitt.frobenius_verschiebung`; `BigWitt.frobenius_verschiebung_gcd`; `BigWitt.projection_formula`; `BigWitt.teichmuller_ghost`; `BigWitt.verschiebung_teichmuller_expansion` | F₁,V₁; level 2; τ(−1)=−τ(1)+V₂τ(1); gcd law at a=b=2 and coprime 2,3. Ghost calculation gives the stated gcd coefficient and domains. | None |
| §1.5, README:188: `BigWitt.pTypicalEquiv`; `BigWitt.pTypicalEquiv_coeff`; `BigWitt.pTypicalEquiv_truncate` | a=0 versus length 0; p=2,a=1; p=3,a=2. Length is a+1, with the indicated shifted F,V maps. | None |
| §1.6, README:206: `BigWitt.etale_baseChange`; `BigWitt.etale_baseChange_natural` | S empty and {1}; diagonal Z→Z×Z; n=1 and 2. Finite truncation is retained in the étale conclusion. | R04 |
| §1.7, README:222: `CommutingEndomorphisms.koszulComplex`; `commutingEndomorphismKoszul_d_sq`; `commutingEndomorphismKoszul_map`; `commutingEndomorphismKoszul_ext`; `commutingEndomorphismKoszul_scalar` | Rank 0, zero module, rank 2; noncommuting endomorphisms on Z². The minus sign gives d²=0 precisely with the commuting hypothesis; the negative control gives u₁. | None |
| §1.8, README:244: `QWitt.arithmeticFracture`; `arithmeticFracture_natural` | N=1; M=Z,N=2; M=Z[1/p]. The localization component is necessary; finiteness is that of the prime divisors of N, not of M. | None |
| §2.1, README:270: `ArithmeticLambdaRing`; `ArithmeticLambdaRing.mk`; `ArithmeticLambdaRing.hom_ext`; `ArithmeticLambdaRing.adams_one_mul`; `ArithmeticLambdaRing.adams_prime_mod`; `ArithmeticLambdaRing.ofFrobeniusLifts`; `ArithmeticLambdaRing.adams_isLambdaHom` | Canonical Z, toric Z[T], zero ring; putative identity Adams maps on F₂. The coalgebra retains torsion data that Adams congruences alone lose. | None |
| §2.2, README:296: `ArithmeticLambdaRing.primeSet`; `LambdaP.restrict`; `LambdaP.free_homEquiv`; `LambdaP.hom_ext`; `LambdaP.singlePrime_wittCoalgebra`; `LambdaP.free_polynomial`; `LambdaP.filteredColimit` | Empty prime set; {2}; free object on no generators; free polynomial Λ-ring. P={2} is the infinite p-typical object, not length two. | None |
| §2.3, README:322: `ArithmeticLambdaRing.perfection`; `LambdaPerfection.lift`; `LambdaPerfection.adamsEquiv`; `LambdaPerfection.idempotent`; `LambdaPerfection.map`; `LambdaPerfection.of` | Z; toric Z[T]; positive rational powers of T; perfection of an already perfect ring. ψ₂ misses T before perfection and is invertible afterward. | None |
| §2.4, README:346: `ArithmeticLambdaRing.IsPerfectlyCovered`; `IsPerfectlyCovered.iff_adams`; `IsPerfectlyCovered.torsionFree`; `IsPerfectlyCovered.polynomial`; `IsPerfectlyCovered.free`; `IsPerfectlyCovered.mk` | Z; toric Z[T] with ranks 2 and 3; dual numbers with ψ_n(ε)=nε. The latter loses flatness modulo 2 and is a negative control for perfect coverage. | None |
| §2.5, README:370: `ArithmeticLambdaAlgebra.IsRelativelyPerfect`; `LambdaAlgebra.linearizedAdams_tmul`; `LambdaAlgebra.twist_comp`; `IsRelativelyPerfect.ofPerfect`; `LambdaAlgebra.twist_hom_ext`; `IsRelativelyPerfect.ofPrimeEquivalences` | R=A with non-surjective ψ_p; Z[T]/Z; perfect R/Z. Right-factor scalar structure makes the base linearization invertible without requiring ψ_p on A to be surjective. | None |
| §3.1, README:404: `QWitt.AbsoluteFVSystem`; `AbsoluteFVSystem.mk`; `AbsoluteFVSystem.hom_ext`; `AbsoluteFVSystem.truncate` | Z[q]/(q^m−1); m=1,2; zero nonunital system. V₂=2 fails VF=1+q; reduction F and geometric-sum V satisfy both laws. | None |
| §3.2, README:424: `QWitt.absolute`; `QWitt.absolute_desc`; `QWitt.absolute_map`; `QWitt.absolute_hom_ext`; `QWitt.F_comp_V_comp`; `QWitt.teichmuller` | m=1; R=0; Q₂(Z), V₂(1)=1+q, F₂V₂(1)=2; q=1. The specialization is not identified with ordinary Witt vectors. | None |
| §3.3, README:448: `QWitt.absoluteGhost`; `QWitt.ghost_quotient`; `QWitt.ghost_F`; `QWitt.ghost_V`; `QWitt.ghost_map` | m=1,2; first ghost evaluates q at −1 at m=2; reduction q=1 versus ordinary restriction on V₂(1). Index orientation and kernel agree. | None |
| §3.4, README:470: `QWitt.absolute_verschiebungResolution`; `QWitt.verschiebungResolution_perm`; `QWitt.verschiebung_injective` | m=1, 2^a, 6; zero R. At m=6 the composite of (−V₃,V₂) and (V₂,V₃) vanishes; no index 2^(−1) occurs. | None |
| §3.5, README:488: `QWitt.absolute_localization_torsion`; `QWitt.absolute_localize`; `QWitt.absolute_boundedTorsion` | Z and F₂ at m=2; m=1 with torsion. V₂(1) witnesses failure of ghost injectivity without the specified prime torsion-freeness. | None |
| §3.6, README:506: `QWitt.absolute_completion`; `QWitt.absolute_completion_natural` | Z,m=2; m=1; n=m; d dividing n, and d/gcd(d,n) with one or multiple prime factors. Discreteness and bounded torsion retain different hypotheses. | R04 |
| §3.7, README:522: `QWitt.absolute_witt_injective`; `QWitt.absolute_pLocalDecomposition` | R=0; m=1; R=F₂,m=2; p-local decomposition at m=6. Witt injectivity is not inferred from ghosts in characteristic 2. | None |
| §4.1, README:548: `QWitt.lambdaComparison`; `QWitt.lambdaCoordinates`; `QWitt.lambdaComparison_expansion`; `QWitt.lambdaComparison_natural` | Z,m=2; toric Z[T],m=2; m=1. The toric image misses T; c_m s_m=ψ_m, not identity for every base. | None |
| §4.2, README:568: `QWitt.RelativeFVSystem`; `RelativeFVSystem.mk`; `RelativeFVSystem.hom_ext`; `RelativeFVSystem.truncate` | R=A and R=0; toric right scalar T at m=2. Relative F fixes T and q; V₂F₂(1)=1+q, not 2. | None |
| §4.3, README:588: `QWitt.relative`; `QWitt.relative_desc`; `QWitt.relative_map`; `QWitt.relative_hom_ext`; `QWitt.relative_teichmuller_F`; `QWitt.relative_truncation` | m=1; zero R; R=A with nonperfect A; the dual-number detector for V₂(TX)⊗1−V₂(X)⊗T. Cross terms in its half-TX coefficient are divisible by 4. | None |
| §4.4, README:612: `QWitt.relativeGhost`; `QWitt.relativeGhost_tmul`; `QWitt.relativeGhost_natural`; `QWitt.relativeGhost_teichmuller` | m=d=1; d=m; toric A=R=Z[T],m=2. Under the right-factor identification a⊗1=1⊗ψ_m(a); the twist is not reversed. | None |
| §4.5, README:632: `QWitt.relative_baseChange`; `QWitt.polynomial_image`; `QWitt.reflexive_coequalizer` | Identity and zero base change; toric polynomial image at m=2; T↦2 as a non-Λ map. No flatness is needed for the actual Λ-base change. | R04 |
| §4.6, README:650: `QWitt.perfectCover_comparison`; `QWitt.perfectBase_absolute`; `QWitt.relativeComparison_natural` | R=A; toric Z[T]/Z; A=Z with torsion R. Comparison uses relative perfection; perfect-base V-injectivity does not assert arbitrary-base V-injectivity. | None |
| §5.1, README:678: `QWitt.etale`; `QWitt.etale_wittBaseChange`; `QWitt.etale_natural` | Identity map; m=1; diagonal étale map; nonflat Z→F₂. Étale flatness justifies replacing the indicated ordinary tensor by derived tensor. | R04 |
| §5.2, README:696: `QWitt.ghost_etalePushout`; `QWitt.ghost_etalePushout_map` | m=d=1; R=A; Z→F₂ at m=d=2. The nonflat negative control has Tor₁=F₂; the étale hypothesis prevents this. | R04 |
| §5.3, README:712: `QWitt.relative_torsion_completion`; `QWitt.relative_completeBaseChange` | A=Z; R=A,m=1; R=Z/4,m=1. Integer torsion hypotheses concern R and are not supplied merely by perfect coverage of A. | R04 |
| §5.4, README:728: `QWitt.finiteType`; `QWitt.polynomial_finite` | Zero variables; m=2 with one variable; infinitely many variables at m=1. Finite type gives Noetherianity; the infinite polynomial case does not. | R04 |
| §6.1, README:754: `QWitt.completedEtaleFrobenius`; `completedEtaleFrobenius_mod`; `completedEtaleFrobenius_natural`; `completedEtaleFrobenius_iterate`; `completedEtaleFrobenius_ordinary` | R=A; p invertible, giving zero completions; Z×Z; smooth Z[T] with T↦T². The latter is not an étale linearized Frobenius equivalence. | None |
| §6.2, README:776: `QWitt.cyclotomicCompletedFrobenius`; `cyclotomicCompletedFrobenius_q`; `cyclotomicCompletedFrobenius_ideals`; `cyclotomicCompletedFrobenius_baseChange` | p=2,d=1; p=3,d=1; R=0; R=A. The ideals have equal radicals but need not be equal; q stays fixed. | None |
| §6.3, README:796: `QWitt.completedGhostFrobenius`; `completedGhostFrobenius_teichmuller`; `completedGhostFrobenius_deformation` | m=p,d=1; Z at p=2; q=1+h. The map sends q to 1+h, distinct from 1+2h+h²; Teichmüller values match r↦r^p. | None |
| §7.1, README:824: `QWitt.DifferentialVSystem`; `DifferentialVSystem.mk`; `DifferentialVSystem.hom_ext`; `DifferentialVSystem.V_d`; `DifferentialVSystem.truncate` | Level 1 exterior algebra; degree-one square in characteristic 2; even generator u with quotient (u²); ideal (T) not stable under d. Strict odd alternation and differential-ideal closure are independent. | None |
| §7.2, README:846: `QWitt.differential`; `QWitt.differential_desc`; `QWitt.differential_hom_ext`; `QWitt.differential_map`; `QWitt.differential_V_monomial` | m=1; R=0; R=A; R=A[T] in characteristic 2. Positive-degree defining relations leave degree zero unchanged and preserve strict alternation. | None |
| §7.3, README:868: `QWitt.DifferentialFVSystem`; `DifferentialFVSystem.mk`; `DifferentialFVSystem.hom_ext`; `DifferentialFVSystem.d_F`; `DifferentialFVSystem.forget` | m=1,2,3 on Z[T], then reduction modulo 3. F(dτ(T))=T^(p−1)dT whereas dF(τ(T))=pT^(p−1)dT; the statement uses dF=nFd. | None |
| §7.4, README:890: `QWitt.verschiebungPrimeDifferential`; `QWitt.VPD_teichmuller`; `QWitt.VPD_add`; `QWitt.VPD_noFrobenius` | p=2; x=0; the ghost q-V test system on Z[T]. γ₂ requires no inverse of 2; the nonzero differential identity evaluates to 4T dT. | R03, R04 |
| §7.5, README:910: `QWitt.frobeniusDifferential`; `QWitt.theta_add_mul`; `QWitt.frobeniusDifferential_monomial`; `QWitt.frobeniusDifferential_unique` | m=p=2 on Z[T]: θ(τT)=T dT, θ(V₂T)=dT, θ((τT)²)=2T³dT. These distinguish the F-semilinear derivation rule from an ordinary one. | None |
| §7.6, README:930: `QWitt.differentialGhost`; `QWitt.differentialGhost_d`; `QWitt.differentialGhost_F`; `QWitt.differentialGhost_natural` | m=1,2; degree 0 and degree 1. V₂ scales the relevant ghost by 2 and 4 respectively; F scales degree i by 2^i. | None |
| §7.7, README:950: `QWitt.differential_baseChange`; `QWitt.differential_etaleDescent`; `QWitt.differential_etaleDifferential` | Identity base change; m=1; localization T↦T with T inverse; square-zero DGA with noncentral degree zero. The extended differential is not s⊗d, and centrality is required. | None |
| §8.1, README:979: `QWitt.framedGamma`; `framedGamma_coordinate`; `framedGamma_inverse`; `framedGamma_natural`; `framedGamma_unique` | Rank 0; γ(T²)=(1+2h+h²)T²; uncompleted polynomial q versus series q=1+h. Formal étaleness gives uniqueness, and flatness makes hT_i regular. | R02 |
| §8.2, README:1001: `QWitt.framedJacksonDerivative`; `framedJacksonDerivative_unique`; `framedJacksonDerivative_zero_one`; `framedJacksonDerivative_commute`; `framedJacksonDerivative_map` | T⁰,T²,T³; q=1 in characteristic 2; T inverse under a nonfinite étale localization. D(T^−1)=−q^−1 T^−2, with no division by 2 or a zero coordinate. | None |
| §8.3, README:1024: `QWitt.framedDifferenceComplex`; `framedDifferenceComplex_d`; `framedDifferenceComplex_wedge`; `framedDifferenceComplex_map`; `framedDifferenceComplex_scalar` | Rank 0, one and two coordinates; dT·T=qT dT; q=1. C specializes to de Rham, H to zero differential; the framed DGA is genuinely skew. | None |
| §8.4, README:1046: `QWitt.framedFrobenius`; `framedFrobenius_unique`; `framedFrobenius_chain`; `framedFrobenius_natural`; `framedFrobenius_injective` | p=2, rank 0; φ(h)=2h+h². H has φ(dT)=T dT and C needs (1+q)T dT; this is distinct from the q-fixed coefficient lift. | None |
| §9.1, README:1078: `QWitt.framedFrobeniusDecomposition`; `framedFrobeniusDecomposition_basis`; `framedFrobeniusDecomposition_d`; `framedFrobeniusDecomposition_zero` | Rank 0; α=0; rank 1,p=2,α=1. Ring basis (1,T) and form basis (T dT,dT) agree with the differential blocks; no empty minimum is used. | None |
| §9.2, README:1098: `QWitt.framedTwoTermCohomology`; `framedTwoTermCohomology_unit`; `framedTwoTermCohomology_tensor` | p=2,α=1,e=0; e=α, including α=0; ordinary versus ambient-derived tensor. The annihilator of h in Z₂[[h]]/(h(h+2)) is (h+2). | R04 |
| §9.3, README:1116: `QWitt.framedBockstein`; `framedBockstein_lift`; `framedBockstein_natural`; `framedBockstein_sign` | Rank 0; m=1; T² at m=2. Positive Bockstein convention gives β₂[T²]=[T dT]≠0, although the quotient differential kills the class. | None |
| §9.4, README:1136: `QWitt.framedProductHomotopy`; `QWitt.framedProductHomotopy_formula`; `QWitt.framedProductHomotopy_coordinate`; `QWitt.framedProductHomotopy_quotient` | Ranks 0 and 1; closed degrees (1,1) on Z[X,Y] and (2,1) on Z[X,Y,Z]. The contraction signs give −XY dX and XZ dX∧dY; the commutators are boundaries, not zero cochains. | None |
| §9.5, README:1156: `QWitt.framedCohomologySystem`; `framedCohomologySystem_degreeZero`; `framedCohomologySystem_modOne`; `framedCohomologySystem_FV` | m=1; rank 0; T versus T² modulo q²−1. T² is a cocycle commuting with dT; T need not be. β₁=d survives the zero quotient differential. | R01 |
| §9.6, README:1176: `QWitt.primePowerSmoothInduction`; `QWitt.primePowerGhostQuotient`; `QWitt.primePowerSmoothInduction_step`; `QWitt.primePowerSmoothInduction_base` | α=0; p=2 and Cartier class T dT; dV₂(T) outside im V₂. The simultaneous induction includes all four assertions, and its Frobenius conclusion is a quasi-isomorphism. | R04 |
| §9.7, README:1196: `QWitt.smoothDeRhamComparison`; `QWitt.smoothDeRhamComparison_primePower`; `QWitt.smoothDeRhamComparison_natural`; `QWitt.differential_pLocalDecomposition` | m=1 and R=0; p=2,m=6 with ψ₂,ψ₆; p=3,m=2 versus p=2,m=2. Cyclotomic factors and scalar twists agree; the intermediate tensor is over C_α. | None |
| §10.1, README:1226: `QWitt.smooth_integerTorsionFree`; `QWitt.smooth_verschiebung_injective`; `QWitt.smooth_torsionFreeInitial` | R=A; m=1; singular Z[x]/(x²). The class x dx is nonzero 2-torsion in the singular case, so smoothness is essential. | None |
| §10.2, README:1244: `QWitt.smooth_boundedDifferenceTorsion`; `QWitt.smooth_degreewiseCompletion`; `QWitt.smooth_completion_complex` | m=1; A=R=Z,m=2 before and after reduction modulo 2; fixed smooth relative dimension. Integer torsion-freeness coexists with h-torsion, and degreewise completion uses bounded h-torsion. | R04 |

The seven gap records in `packages/QWittVectors/design/plan.json` have the same slugs and named suppliers as README:76–88. Their contracts specify actual hypotheses, maps and conclusions. The following boundary checks concern the requested contracts; they do not certify that their suppliers have implemented them.

| Gap statement | Instances tried and result | Ownership/minimality and change |
| --- | --- | --- |
| `cyclotomic-contract`, README:76; plan.json:3200 | m=1 and equal factor indices are expressly excluded; p=2 with d=1,2 still gives equal radicals; m=6 at p=2 has two p-local factors | HabiroCyclotomicCompletions owns the integral ideal/quotient/comaximality interface. Pinned polynomial identities and main-roadmap radical invariance are identified separately; no duplicate target found |
| `ordinary-derham`, README:78; plan.json:3218 | Rank zero; characteristic 2; B=F₂[u] with non-surjective Frobenius; étale localization; noncentral DGA negative control | DerivedDeRhamCohomology owns exterior DGA, étale differential extension and relative Cartier. Existing degree-one Kähler APIs do not provide these conclusions; no repair |
| `cohomology-completion`, README:80; plan.json:3233 | Zero differential on Z[q] in every integer degree; zero complex; degree-dependent torsion bounds. Unboundedness is permitted without asserting a uniform bound | DerivedModuleAlgebra, Part II extends rather than repeats the cited ordinary-module and complete-flatness statements; no repair |
| `prismatic-frobenius`, README:82; plan.json:3244 | α=0 gives empty décalage product and identity; p=2 gives I=(h+2); finite-coordinate localization frames remain permitted | PrismaticCohomology retains q-PD and general décalage ownership; framed Frobenius sends q to q^p; no repair |
| `pd-presentation`, README:84; plan.json:3255 | Identity presentation of the completed base; kernel zero; p=2. Naturality is restricted to δ-compatible maps | PrismaticCohomology owns the multiplicative crystalline Poincaré interface; not supplied by the separate q-PD gap; no repair |
| `dga-bockstein`, README:86; plan.json:3266 | f=g=h; f=h²,g=h; f=0 on a nonzero term violates regularity. From dx=gy, d(ax)=fy gives the claimed Fβ_fV law | DGAInfinity, Part II; existing continuous-group-cohomology Bocksteins have different carriers. No generic DGA substitute found at the pins; no repair |
| `dga-quotient`, README:88; plan.json:3277 | J=0, J=P, (T) and (T,dT) in the exterior de Rham algebra. Only (T) fails differential stability | DGAInfinity, Part II; a DG-category quotient is not a quotient by a homogeneous DGA ideal; no repair |

Sixteen distinct existing supplier section/layer citations were checked on main. The two specified other-author heads were searched for overlapping objects and supplier references; this package cites neither, so the number of direct sibling citations is zero. No declaration was attributed to either sibling by guessing its current name.

| Main supplier | Locators checked in its README | Contract boundary checked |
| --- | --- | --- |
| DerivedModuleAlgebra | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:516`, :626, :1573, :1693, :1733, :1808, :1973, :2006, :2028 | Scalar Koszul complexes; unbounded derived tensor and strict tower limits; finite-ideal completion; bounded-torsion comparison; complete flatness and bounded-base descent. The module-endomorphism Koszul bridge and the declared unbounded cohomology-completion extension are not silently treated as supplied |
| DGAInfinity | `TauCetiRoadmap/DGAInfinity/README.md:263`, :293 | Signed graded carriers, associative DGAs and cohomology multiplication; differential-ideal quotient and regular-parameter Bockstein remain declared extensions |
| EnhancedDerivedSheaves | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:455`, :1436 | Point-site derived operations and the monoidal enhancement/algebra-object interface; no q-Witt animation asserted |
| SchemeAndStackFoundations | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1484`, :1801, :5006 | Étale topological invariance, relative Frobenius and formal étale lifting; characteristic-p perfection is not arithmetic Λ-perfection |

Object searches covered active and completed main roadmaps and the complete Lean source trees at Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The cited p-typical Witt, cyclotomic, Kähler and power-series declarations exist with the stated scope. In particular the p-typical Frobenius equivalence needs characteristic p and perfectness; the adic completeness theorem also needs the specified adic completeness of the coefficient ring. No duplicate big-Witt, arithmetic-Λ or framed-Jackson implementation was found at these pins. R02 uses the existing power-series algebra carrier rather than introducing a completion stand-in.

The prescribed dependency check completed with exit code 0 and this output:

```text
depcheck: 3 roadmaps, 20 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. No ownership move is proposed. The external-supplier issue marked F01 “not actionable in this package” in `packages/QWittVectors/reports/FIX-DESIGN-QWittVectors~4.md:5` is not re-raised: the brief accepts these explicit gap contracts, and repairing the supplier roadmaps is outside this package.

The committed diff against origin/main contains only files under `packages/QWittVectors/`. Suggested.lean has one `import Mathlib`, no `lemma`, no `set_option`, no admitted data or examples, no empty Prop placeholder, no conclusion assumed as a hypothesis, and no forced heavy-carrier headline. No computational algorithm or pull-request/process history was identified in the README or module docstrings. The audit left package content unchanged; only this report and permitted scratch records were written.

## Not verifiable

- Lean elaboration, generated declaration types and proof execution were not run: the brief prohibits Lean builds and supplies no permitted elaboration command. The signature/context audit used the source text and pinned declarations. In particular the proposed R02 signature must be elaborated by the repair worker.
- The three `sorry` theorem bodies and future implementations are not formal proofs. The table records mathematical boundary tests, source/hypothesis comparisons and dependency inspection, rather than certification of unimplemented proofs.
- The seven supplier gaps remain external contracts. Their names, scope, source support and ownership were checked; their future implementation and compatibility proofs cannot be certified from this package. This is a conditional dependency, not a blocking finding under the supplied rules.
- No source-access item remains unresolved; no new missing-reference request is needed.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c5fd3cd2a89e3209819240e33e83f7b0b8d9d898", "job": "RT-QWittVectors~1a", "model": "gpt-6-astra", "worker": "chris-1"} -->
