<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13089#issuecomment-6788497636 -->
Review (codex) of 50ea837

Verdict: needs_changes

1. **F01** (P1) The Finis pairing is in the denominator

   **Location.** packages/NonordinaryCMSpecialValues/README.md:539: “`v_ℓ(W̃ D^{1/4} b′_ar(ϑ, ϑ) ∏`”.

   **Claim.** Proposition 3.7 computes the valuation of the product of the Gauss correction, discriminant factor and pairing.

   **Witness.** FINIS06 line 928, Proposition 3.7(15), printed p.789, has W̃ divided by D^(1/4)b′_ar, then multiplied by the Euler product. The page image confirms the fraction lost by extraction.

   **Repair.** Replace the argument by `(W̃ / (D^{1/4} b′_ar(ϑ,ϑ))) · ∏_{q|d}(1−ω(q)/q)`, with the already stated nonzero pairing. Retain the final L-value identity, which agrees with FINIS06 lines 1134–1142, p.794. As a valuation diagnostic, set v(W̃)=v(D)=0, v(b′)=3/4 and v(product)=1: the printed formula gives 1/4; the package gives 7/4. The repaired expression gives 1/4. This diagnostic tests the algebraic transcription, not the existence of a specified global character with these assigned valuations.

2. **F02** (P1) The height-one reciprocity input uses the wrong torsion points

   **Location.** packages/NonordinaryCMSpecialValues/README.md:358: “basis … coming from the Betti class of `1 ∈ K`” and “`ξ^{⊗(−r)} ⊗ (θ_n(α_n))_n`”; line 362 repeats evaluation at α_m.

   **Claim.** These are Kato's integral Tate basis and translated norm-compatible input, with the stated p^(−mr) factor.

   **Witness.** KATO04 lines 5482–5491 and 5505–5527, pp.258–259: ξ=p^mβ is integral; the input and translated derivative are evaluated at ξ_n and ξ_m, respectively. Printed pages were inspected.

   **Repair.** Define β as the rational Betti class of 1, ξ=p^mβ, and α_n as the image of p^(m−n)β. Require g⊂f and injectivity of units modulo g as in KATO04 lines 5478–5481; state the auxiliary ideal's coprimality. Supply the good-reduction step through NeronModelsAndSemistableAbelianVarieties §5.1 (Néron–Ogg–Shafarevich), in the contract and Needs line, rather than leaving only the parenthetical theorem name. With ν_n=ξ_n−α_n, use θ_n(z)=aθ_E(z−ν_n), so θ_n(ξ_n)=aθ_E(α_n). Evaluate both translated expressions at ξ, retain p^(−mr), and distinguish the later conversion to β^(−r). Kato's printed plus sign with this definition of ν is itself a misprint, recorded below.

   Test: K=Q(i), p=7, m=1, f0=(8), g=(56), E=C/56Z[i]. Here β=1 is outside T7E=7O7, while 7β is a basis. At level 1, α1=1 and its 7-primary part ξ1=8 modulo 56; ν1=7. The corrected translation sends ξ1 to 8−7=1. The printed plus translation sends ξ1 to 15; the package's plus translation evaluated at α1 sends it to 8. These are distinct torsion points. For smoothing ideal (5), translation differences of order 4 or 8 are not in E[5], so the translated divisors differ. For r=1 the retained scalar is 1/7; for r=3 the factorial is 1/2.

3. **F03** (P2) The de Rham invariants do not specify their descent action

   **Location.** packages/NonordinaryCMSpecialValues/README.md:339: “the `L`-line `S(ψ) ⊂ coLie(E)^{⊗ r} ⊗_K L` of `Gal(K(f)/K)`-invariants”.

   **Claim.** This determines Kato's de Rham line and its period map.

   **Witness.** KATO04 lines 5425–5436, p.257, takes the coLie tensor power over K(f) and explicitly defines the ψ(a)⁻¹-normalized semilinear isogeny action before taking invariants. Neither datum is specified here.

   **Repair.** State that tensor base, the source and target of conjugation and isogeny pullback, the factor ψ(a)⁻¹, and independence of the ideal representing σ. Define S only after that action. Add an identity-representative Check: for a=(9), f=(8), r=2, σ_a=1 and pullback on the tensor differential is 9²=81; division by ψ(a)=81 gives 1. Omitting the normalization makes the identity act by 81. The one-dimensionality assertion alone does not exclude a different descent twist.

4. **F04** (P2) The canonical sign theorem is narrowed to the application

   **Location.** packages/NonordinaryCMSpecialValues/README.md:236–238: “The canonical root number at a split dyadic prime” and “and `2` split in `K`”.

   **Claim.** The library target is only the split-dyadic, sign-positive case.

   **Witness.** ROHRLICH-NOTES lines 666–671, Proposition 1.5, printed p.14, gives W(φ)=(2/D) for canonical characters with odd D. The same derivation is used here, but the nonsplit case is relegated to a Check.

   **Repair.** State the theorem for every existing canonical character with odd fundamental discriminant −D; retain `2` split as the corollary used in Layer 5. Rename the heading accordingly. Test D=7 and D=11: the full theorem gives +1 and −1; the split application selects only +1. This repairs the binding general-library requirement without changing the BKO application's hypotheses or adding a Lean stand-in.

5. **F05** (P3) The character-orientation Checks claim unequal values that can coincide

   **Location.** packages/NonordinaryCMSpecialValues/README.md:351: “for nonreal `χ` the four values … differ”; line 380: “a different number”; line 408 repeats the distinction as a scalar-value test.

   **Claim.** Nonreal χ guarantees that changing conjugation or χ to χ⁻¹ gives a different central number.

   **Witness.** README:127 itself gives L(φ̄χ⁻¹,s)=L(φχ,s). For canonical K=Q(√−7), p=5 and order-25 χ, both χ and χ⁻¹ have c=3 and both relevant central values are 0.

   **Repair.** Delete the assertion of numerical inequality. Pin the convention at the character evaluation or group-algebra map: for χ(g)=ζ25, direct evaluation is ζ25 and inverse evaluation is ζ25⁻¹, which are unequal because ζ25²≠1. Explicitly allow equal resulting L-values, including the forced-zero example 0=0. Keep these as README Checks, not Lean padding.

6. **F06** (P3) The principal CM-pair isomorphism has the inverse direction

   **Location.** packages/NonordinaryCMSpecialValues/README.md:318: “`(E/E[a], α mod E[a]) ≅ (E, α)` via multiplication by `λ⁻¹`”.

   **Claim.** Multiplication by λ⁻¹ maps the quotient curve back to the original curve.

   **Witness.** For E=C/3Z[i], λ=4≡1 mod 3, the quotient is C/(3/4)Z[i]. Its zero representative 3/4 maps to 3/16, nonzero modulo 3Z[i]; multiplication by 4 maps it to 3=0.

   **Repair.** Use multiplication by λ in the displayed quotient-to-original direction; λ⁻¹ is the reverse isomorphism. In the witness, the marked point 1 maps to 4≡1 mod 3, so the corrected map also preserves the CM pair. This is the lattice realization of KATO04 (15.3.3), lines 5234–5241, pp.251–252.

7. **F07** (P2) An ideal-character value is asserted outside its domain

   **Location.** packages/NonordinaryCMSpecialValues/README.md:148: “An odd-order anticyclotomic character satisfies `χ((p)) = 1`.”

   **Claim.** This is an ideal-character identity for all such characters, including those ramified at p.

   **Witness.** TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120 restricts idealCharacter to ideals prime to the conductor. The order-5 character of K=Q(√−7), conductor 25, has no ideal-character value at (5).

   **Repair.** Add “unramified at p” to this ideal-value assertion. Alternatively formulate a separate local-component value on the rational uniformizer, with its explicit domain. Extending the ideal character by zero would give 0, not 1, in the witness. The use in §1.3 remains valid: ν there is explicitly unramified at p, and odd order together with x=x⁻¹ gives x=1.

8. **F08** (P3) The Boxall dependency is missing its settled primary-source entry

   **Location.** packages/NonordinaryCMSpecialValues/README.md:550 cites “Finis, proof of Lemma 4.5 … applying Boxall's theorem”; packages/NonordinaryCMSpecialValues/sources.toml has no BOXALL92 entry, and References omits it.

   **Claim.** The primary theorem needed for the characteristic-ℓ torsion step is fully recorded through the Finis citation.

   **Witness.** FINIS06 line 1587 explicitly invokes Boxall [B, Theorem 1]; its bibliography at line 1742 identifies the 1992 C. R. paper, pp.1063–1066. The brief settles access to this work as waived under BOXALL92.

   **Repair.** Cite BOXALL92, Theorem 1, pp.1063–1066, alongside the precise Finis application and add the single waived entry and reference under that existing lifetime key. Do not fetch it again, invent a replacement key or request access. Finis's diagonal example still gives the diagonal subgroup of E²; this is a provenance repair, not a changed torsion claim.

9. **F09** (P2) The theta-function constructions do not determine their normalized objects

   **Location.** packages/NonordinaryCMSpecialValues/README.md:529: “Construct the spaces of primitive theta functions … the Shintani operators”; line 539: “Construct integral theta functions”.

   **Claim.** These sentences supply the spaces, operators, functional l, pairings and integral normalization used in the exact identities and §4.5's unit assertion.

   **Witness.** FINIS06 lines 187–245 defines the theta transformation law and primitive trace kernels; lines 557–567 defines l; lines 643–655 and 882–885 fixes integral structures. The README supplies none of these definitions or their normalization laws.

   **Repair.** Define the theta spaces by their transformation law, the primitive subspaces, each operator's source/target and normalization, l by its component evaluations, the pairings, and the integral lattice/primitive-generator condition. Give their APIs and at least three discriminating Checks per definition. Cite the exact formulas on pp.771–772,780,782 and 788, in original wording. For example, replacing l by 5l preserves linearity and eigenspaces but changes v5(l(ϑ)/w_K) from 0 to 1 and multiplies the Yang numerator by 25. Replacing a primitive integral generator by 5ϑ likewise remains integral but ceases to generate the lattice. The definitions must exclude these wrong normalizations before invoking the deep identities, not use the desired conclusion as the definition. A dimension/trace-kernel Check must also distinguish the primitive space from the full theta space. The present section-level Checks about constants do not provide those APIs or distinguish those objects.

10. **F10** (P2) A second board package still owns the same CM foundations

   **Location.** packages/NonordinaryCMSpecialValues/README.md:12: “The CM continuations of ModularIwasawaMainConjecturesPartII consume Layer 2 from here”; the downstream paragraph at line 758 repeats the intended supply.

   **Claim.** The shared theta, canonical-pair, zeta and realization constructions already have one owner, with ModularIwasawaMainConjecturesPartII consuming this package.

   **Witness.** packages/ModularIwasawaMainConjecturesPartII/README.md:285,303,317,348,380,413 constructs the CM theta, canonical pair, units, zeta element, realization and reciprocity law itself; no NonordinaryCMSpecialValues citation occurs there.

   **Repair.** Establish one earlier owner for the shared general Kato material and make the later package import it by section. ORDER.txt:345 places this package before ModularIwasawaMainConjecturesPartII at line 378: retain the common material here, make its general Kato hypotheses explicit separately from the BKO restrictions, and coordinate the later package's deletion/import of the duplicated targets. Preserve any genuinely broader downstream extensions as such. Do not add an upward supplier edge to solve the overlap. Record the reciprocal convention correction in R11 in that shared interface.

   For E=C/Z[i], a=(5), both constructions prescribe divisor 25[0]−E[5] and the same norm invariance. The quotient of two candidates is a constant u with u³=u⁸=1, hence u=1: these are the same object, not independent constructions. This overlap is with the readable board package. The supplied board index and roadmap-head tools expose no PR number for it, so none is invented; the mechanical open-PR overlap report cannot detect this board-only conflict.

11. **F11** (P1) The standard elliptic unit is the reciprocal of Kato's

   **Location.** packages/NonordinaryCMSpecialValues/README.md:307: “`_az_f = _aθ_E(α)`”; line 313 retains Kato's positive logarithmic formula. Line 12 repeats the definition, and §2.3 uses it to define the zeta element.

   **Claim.** The theta value itself is Kato's standard unit and satisfies (15.5.1) with the displayed sign.

   **Witness.** KATO04 lines 5271–5285, §15.5, printed p.253, defines a z_f=aθ_E(α)⁻¹. The printed page was inspected because OCR omits the formula. Its logarithmic identity is for that reciprocal.

   **Repair.** Define the standard unit as aθ_E(α)⁻¹, update the scope and every subsequent Kummer/zeta identification, and explicitly distinguish theta values used in the differential calculation from standard units. Carry inversion as negation through additive Kummer classes; verify the sign when converting §2.5 to §2.6 instead of silently identifying the two systems. Retain the positive Kronecker formula for Kato's unit.

   Test K=Q(i), f=(3), a=(5), χ=1. The imprimitive zeta function is ζ_K(s)(1−9^(−s)); ζ_K(0)=−1/4, so its derivative at 0 is −(log 3)/2. The right side of (15.5.1) is (25−1)·(−log 3/2)=−12 log 3. The theta value gives +12 log 3, its reciprocal gives −12 log 3. Thus this is a nonzero sign discrepancy, not a distinction hidden by a vanishing L-value.

Eleven findings, eight blocking (P1/P2). The scope is repairable. The Lean acceptance test passes, but the README has incorrect reciprocity data, a reversed Finis fraction and an inverted elliptic-unit convention. No package source file was changed.

## Previous findings, checked first

The round-2 findings and round-3 repair report were read before the new pass. None was marked not actionable. “Repaired” below concerns the particular earlier finding, not blanket approval of its section.

| Earlier finding | Repaired passage in packages/NonordinaryCMSpecialValues/README.md unless indicated | Status and verification |
| --- | --- | --- |
| R01, unrestricted theta norm | Line 288: “whose kernel meets `E[a]` trivially”; line 293 repeats the restriction. | Repaired. For a=(5), [5] pushes 25[0]−E[5] to 0; [2] preserves that divisor. The new split-ideal example at line 303 correctly distinguishes coprimality of the kernel annihilator from coprimality of the degree. |
| R02, wrong realization, field, exponent and filtration | Line 339: “`H¹(E(ℂ), Q)^{⊗_K r} ⊗_K L`”; line 343: “`a_v^r ψ(a)⁻¹`”; line 345 gives dimensions 2,1,0. | Repaired as requested: finite-idele value field, cohomology, coefficient tensors and period target agree with KATO04 lines 5385–5453. At r=2 the local numerator is 36, not 6; at inert 7 the inverse eigenvalue −1/7 becomes −7 after twisting. A different missing descent action is new R03 below. |
| R03, ordinary theta ownership | Line 288: “The normalised theta unit `_cθ_E` of PadicFamilies §4.0.1”; line 12 distinguishes the Siegel-function construction. | Repaired for those two suppliers. PadicFamilies §4.0.1 and NoncommutativeAndEquivariantIwasawa §4.3 were opened again. The additional live-board overlap is R10. |
| R04, finite index | Line 119: “That subgroup has infinite index in `K×`”; line 137 tests powers of 1+i. | Repaired. Their valuations are all integers; the congruence subgroup has valuation 0. Weak approximation, not finite index, gives complex density. |
| R05, missing conjugation in the Finis conversion | Line 518 uses the conjugated character divided by N; line 524 tests z=i. | Repaired. The corrected archimedean component is i; the old one was −i. |
| R06, class-number qualification | Line 40: “and `p ∤ h_K`”; line 157 gives the unramified order-3 example. | Repaired. For K=Q(√−31), h=3 and inert p=3, order 3 can have c=0. The new Picard-order argument at line 149 still supplies both conductor parities without the class-number restriction. |
| R07, boundary count and holomorphy Check | Line 175 allows arbitrary 0 and 1 without entire continuation; line 703 separates c<0 from c=0. | Repaired. P={5}, α=5, β=0, c=0 gives six pairs at q=5 and zero at q=25. |
| R08, conjugation not a K-automorphism | Line 722 uses the identity and a cyclotomic coefficient automorphism; line 724 separates complex conjugation. | Repaired. σ(ζ25)=ζ25² fixes K=Q(√−7), preserves order 25 and c=3; conjugation sends i to −i in Q(i), so is outside Aut(C/K). |
| R09, stale Lubin–Tate identifiers | Lines 77–79 cite “§2.1 Finite-height torsion”, “§2.2 The π-adic Tate module”, “§2.3 Lubin–Tate division fields”, §§2.4,4.3,4.4. | Repaired. All resolve in packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md, lines 605,635,657,688,1066,1101. Applications at §§2.5,3.1,3.3,3.5 use these sections. |
| R10, native ring class fields | Suggested.lean:36–39: “Ring class fields themselves are native”; README:62 lists their pinned API. | Repaired. TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111 is the carrier; the CM attachment and torsion comparison remain missing. |
| R11, unspecified split-prime terms | Line 539 defines W̃ by a Gauss sum and line 544 fixes W̃=1, b11=0 in the unramified split example. | Partly repaired. The formerly free terms and nonzero pairing are supplied, but the new intermediate valuation formula reverses the pairing fraction (R01), and the underlying theta/integral structures still lack definitions (R09). |

## Verified sound

### Extent, principles and shape

Read all 43 numbered targets, their API bullets and Checks, all seven layers, the summary, conventions, supplier contracts, references, metadata and complete Lean file. Rechecked all eleven prior repairs first. Earlier computed rows were used only for unchanged instances; all changed passages were read again, including the new isogeny-kernel example, finite-idele field, filtration, class-number-free Picard argument and split Gauss data. The new inverse-unit error illustrates why the earlier blanket “sound” labels were not inherited.

The mathematical organization is dependency-driven: character data feeds signs and reciprocity; the torsion tower and independent theta branch feed units; lattice estimates and Galois averages feed nonvanishing. It does not reproduce a source's chapter order. Compared the house shape with Completed/Chebotarev/README.md, Completed/ArithmeticDirichletSeries/README.md and TauCetiRoadmap/ClassFieldTheory/README.md. Each layer has Examples and Dependencies. The deficient constructions in R03/R09 and false Checks are exceptions to completeness, not excused by counting three bullets per section. No computational algorithm, copied source passage, forbidden supplier, machine path, PR narrative or set_option occurs in the roadmap/Lean text. The good-prime restriction in R04 and ownership conflict R10 remain binding-principle findings.

Ten source entries were read; the omitted, already-waived eleventh work is R08. There was no author-flagged unverified locator to fetch. No source entry was rewritten, and no new missing-source request was made. No claim is made that a finite list of numerical tests proves the general theorems.

### Seeded source sample

Every selected target was checked at the printed locator against the cached legal text. Ambiguous formulas on Kato pp.253,258–259 and Finis p.789 were inspected as page images as well.

| Target | Source and locator read | Result |
| --- | --- | --- |
| 0.6 Auxiliary characters | BKO21 lines 388–395,435–438, §§3.0.2–3.1, pp.951–952 | Odd split auxiliary prime, finite exclusions and finite-order characters agree. The package correctly separates order l^r from conductor l^(r+1). |
| 1.1 Canonical root number | ROHRLICH-NOTES lines 666–671, Proposition 1.5 p.14; lines 1653–1728, (2.44)–(2.49), pp.35–36 | Sign and local normalization correct, but generality unnecessarily restricted: R04. |
| 2.4 Realization | KATO04 lines 5385–5453, §15.8, pp.256–257 | Repaired H¹, field and local power correct. Missing de Rham descent action: R03. False scalar Check: R05. |
| 2.5 Height-one reciprocity | KATO04 lines 5478–5527, proof of Proposition 15.9, pp.258–259 | Relative height one is correct. Integral basis, torsion evaluation and translation require R02. |
| 3.1 Torsion/ring-class compositum | BKO21 lines 435–466, §§3.1–3.2, pp.952–953 | Tower and conductor indices agree after separating r from m; native ring-class carrier correctly reused. |
| 3.2 Disjointness by ramification | BKO21 lines 460–461, proof of Proposition 3.3, p.953 | Argument is at the stated CM tower, with unramified intersection and l∤h_K. It does not infer coprime tower degrees merely from l≠p. |
| 3.4 Inert Frobenius | RUBIN87 lines 191–200, Lemma 3.1 p.409; JIA24 lines 126–155, Property 1 pp.3–4 | Arithmetic-Frobenius sign −p and norm p² consistent with the character law and local comparison. |
| 4.4 Torsion closure | FINIS06 lines 1571–1592, Lemma 4.5 and proof p.803 | The p-bar component relations match the source. Boxall primary access is waived; missing citation/entry is R08. |
| 4.5 Theta nonvanishing | FINIS06 lines 1221–1225, Theorem 4.1 p.795; proof pp.795–807 | Quantifiers “all characters for sufficiently large level”, odd split tower prime and distinct valuation prime agree. Definitions needed to interpret the integral representative: R09. |
| 4.6 Finis weight one | FINIS06 lines 101–122, Theorem 1.1 p.769; lines 1134–1148, proof p.794 | Both split and nonsplit valuation primes, discriminant factor and exceptional lower-bound case retained. Intermediate formula needs R01. |
| 5.1 Canonical Finis family | FINIS06 lines 61–69, p.768; BKO21 lines 491–508, pp.953–954 | λ=φ̄ν/N, type (−1,0), shift L(0,λ)=L(φ̄ν,1) and sign condition agree. |
| 5.6 Unramified coefficients | BKO21 lines 501–508, p.954; KATO04 Proposition 15.9, lines 5463–5478 p.258 | BKO alone does not state the entire descent claim; package supplies the additional prime-to-p root and trace argument. It requires p∤h_K and the good Néron period, both retained. |
| 6.3 Galois stability | JIA24 lines 96–100, p.3; supplier modular-symbol algebraicity/transport | The theorem concerns zeros, not arbitrary automorphisms of transcendental periods. Corrected automorphism Checks are valid. |
| 6.4 Almost-all nonvanishing | JIA24 Theorem 1, lines 18–39,66–70, pp.1–2; AH05 lines 141–152, Proposition 3.1/Remark 3.2 p.4 of arXiv v2 | Arbitrary class number and conductor formulation preserved; the trivial character is separated from n>0. |
| 6.5 Parity dichotomy | JIA24 Theorem 1; GREENBERG83 lines 317–333, p.247; QUEYRUT74 lines 86–97, p.135 | Wrong-sign zeros and almost-all correct-sign nonzeros combine as stated. The general local FQ formula remains the declared gap, not falsely attributed to Queyrut's global statement alone. |

Also rechecked the two Rohrlich bounds against ROHRLICH84 lines 763–775 (p.401),821–823 (p.402),896–904 (p.404); Kato's theta/refinement and units against KATO04 lines 212–239 and 5242–5351; Finis's normalization against FINIS06 lines 854–940. The standard-unit discrepancy R11 was found in that additional source pass.

### Computed adversarial table

Rows cover the seeded sample, all headline theorem groups, each finding and the changed constructions. Values are direct computations or algebraic consequences of the cited formula; “excluded” identifies the exact hypothesis, rather than treating an out-of-domain value as a successful test.

| Statement | Instance | Computed sides or competing models | Result/change |
| --- | --- | --- | --- |
| 0.1 character type, norm, finite-index repair | Q(i), inert 7; powers of 1+i | φ((7))=−7, product with conjugate=49=N((7)); inverse has norm 1/49. Congruence valuations=0 versus coset valuations n∈Z. | Norm/type and density repair sound. |
| 0.2 conductor/order and new class-number-free step | Q(√−7), p=5; Q(√−31), p=3; Q(i), p=3 | Ring-class orders at c=1,2,3: 6,30,150; 12,36,108; 2,6,18. Successive ratio=p. Unramified order-3 character has c=0, versus false n+1=2. | Correct qualified order rule and both conductor parities. |
| 0.2 rational-prime value | Order-5 character of conductor 25 | Ideal value at (5) undefined; zero extension=0 versus asserted 1. For an unramified odd-order value, x²=1 and odd order imply x=1. | R07. |
| 0.3 Euler factor and central-value definition | Gaussian CM, inert 7; arbitrary continuation without holomorphy | Correct factor (1+1/7)⁻¹=7/8; wrong sign gives 7/6. Without entire continuation F(1)=0 and F(1)=1 both compatible with half-plane data. | Definition excludes the wrong models; no 0/0. |
| 0.4 and 2.10 period scaling | ω→2ω, Ω→2Ω; Ω→pΩ | A→A/2; per(2ω)/(2Ω)=γ. Scaling by p changes v_p(A) by −1 and makes the differential non-Néron. | Unit normalization and dependence correct. |
| 0.5–0.6 auxiliary family | K=Q(√−7), l=23 | Order 23 has conductor 23²=529 and field degree 23; trivial character has conductor 1, degree 1. | BKO order/conductor distinction sound. |
| 1.1 canonical sign | D=7 and D=11 | (2/7)=1; (2/11)=−1. Switching only the archimedean −i to +i reverses each product. | Sign computation sound; restore nonsplit theorem, R04. |
| 1.2–1.4 and 6.5 conductor sign | Base W=1; c=0,2,3,4 | (−1)^c W=1,1,−1,1. At c=3, Λ(1)=−Λ(1) gives 2Λ(1)=0 and L(1)=0. Odd χ gives χ(Δ)²=1 and χ(Δ)=1. | Sign/zero direction valid; no positive-sign converse used. |
| 2.1 repaired theta norm | E=C/Z[i], a=(5), h=[5] and [2] | [5]_* divisor=25[0]−25[0]=0; [2]_* divisor=25[0]−E[5]. For a=(2−i), kernel E[2+i] intersects it in 0 although both degrees are 5. | Kernel condition correctly repaired. |
| 2.2 canonical pair | f=(3) and f=(2) in Z[i] | Unit injection: 4 distinct images in F9× of size 8 gives ray degree 2; modulo 2, 1=−1. | Existence/uniqueness hypotheses discriminating. |
| 2.2 principal isomorphism | f=3, λ=4 | Source zero 3/4 maps by λ⁻¹ to 3/16≠0; by λ to 3=0; marked 1 maps to 4≡1. | R06. |
| 2.2–2.3 standard unit and zeta sign | Q(i), f=3, a=5, χ=1 | ζ_K(0)=−1/4; L_f′(0)=−log3/2; factor=24; prescribed log sum=−12log3, direct theta=+12log3. | R11; inversion restores −12log3. |
| 2.3 smoothing | Scalar component σ_a=1, N(a)=25 | Smoothing factor=24; at p=3 this has v3=1, so 1/24 is not integral. At a component σ_a=N(a), factor=0 and inversion is unavailable. | Localization and “not automatically integral” are necessary. |
| 2.4 realization/filtration | Gaussian inert 7; r=1,2 | H¹ eigenvalue −1/7; twist 49·(−1/7)=−7. Filtration dimensions r=1: 2,1,0; r=2: 2,1,1,0. | Previous dual/filtration repair sound. |
| 2.4 descent | Principal a=(9), f=(8), r=2 | Unnormalized identity pullback=81; normalized=81/ψ((9))=81/81=1. | R03 specifies missing action. |
| 2.5 translated reciprocity | p=7, g=56, level 1 | β=1∉7O7; ξ=7β∈7O7 is a basis. α1=1, ξ1=8, ν1=7. Corrected θ1(8)=aθ(1); printed plus gives aθ(15); package evaluates aθ(8). | R02. |
| 2.5 differential scaling | r=3, ω→2ω | Factorial=1/2; differential factor 2⁻³=1/8 times tensor factor 2³=8 gives 1. | Scaling cancels; no missing factorial in this Check. |
| 2.6/2.8 orientation | Nonreal χ of order 25 at inert 5 | χ(g)=ζ25≠ζ25⁻¹; nevertheless L(φ̄χ⁻¹)=L(φχ), and at c=3 both direct/inverse central values are 0. | R05 replaces false scalar discrimination. |
| 2.7–2.9 integral class/twist | Smoothing principal α≡2 mod p, p≥5 | α(ᾱ−1)≡2·1=2 mod p, a unit; at p=2 it is 0. Direct group-algebra evaluation of [g] is ν(g), not ν(g)⁻¹. | BKO range and chosen component invertibility retained; full integral lattice remains a named target. |
| 3.1–3.3 towers, disjointness, semilocal splitting | p=5, n=0,1; auxiliary l∤h | Degrees 24,600; μ25 degree 20 divides 600. Intersection degree divides both l^r and h, hence 1. With h=2 there are 2l^r components, and augmentation sends (x,y) to x+y. | Correct finite/totally ramified factors and corestriction direction. |
| 3.4–3.5 Frobenius and LT comparison | p=5, arithmetic Frobenius [−5] | Norm=25, trace=−10, #E(F25)=25+1−(−10)=36; parameter −5. Wrong +5 gives trace +10 and 16 points. | Source and Lubin–Tate supplier conventions agree. |
| 4.1 and 5.1 Finis conversion | z=i, k=1 | Conjugated η divided by N has component i; unconjugated gives −i. Weight-one factorial=0!=1 and period-power correction exponent=0. | Previous conjugation repair and central shift valid. |
| 4.2–4.3 theta normalization | l→5l; primitive ϑ→5ϑ | Linear/eigen relations survive; l-value valuation 0→1; Yang numerator multiplies by 25. Generator ϑ spans lattice, 5ϑ spans proper sublattice. | R09, definitions must distinguish these. |
| 4.3 pairing valuation | vW=vD=0, vb′=3/4, vEuler=1 | Source: 0−3/4+1=1/4; package: 0+3/4+1=7/4. | R01; diagnostic of the transcription. |
| 4.4 torsion component relations | β0=(1,1), β1=(2,1) | Bar-component relations R={(x,−x)} give diagonal dim1; relations on full pairs give R=0 and E² dim2. For r=1, α′=0 gives subgroup {0}. | The repaired component convention matches Lemma 4.5. Primary provenance R08. |
| 4.5–4.6 theta nonvanishing/Finis | Primitive integral l-value a unit; K=Q(√−7), valuation 5, all inert local characters unramified | v5(l/w_K)=0; all μ=0, b5=0, v5(7^(1/4))=0; final normalized L-value valuation=0+0+2·0=0. | The deduction is sound once R01/R09 are repaired; large-level quantifier not claimed at every small level. |
| 5.2–5.5 BKO unit and witness | Auxiliary l=23, valuation p=5, ν≠1 | Ramified l-Euler factors=1; deleted inert p-polynomial=1+1/5=6/5 has v5=−1; prime-to-p good-period corrections have valuation 0. Infinitely many orders 23^r minus a finite exception set remain infinite. | No ordinary p-adic period is substituted; unit witness follows from finite exceptions. |
| 5.6 coefficient descent | u a p-adic unit, d∣h with p∤d; l-power roots | Derivative d·x^(d−1) at a unit root has valuation 0; for d=p it has valuation 1. Roots of unity of order prime to p lie in unramified extensions. | Exact coprimality supports unramified coefficients; no arbitrary ramified descent. |
| 5.7 tensor comparison | F totally ramified, U unramified; compare F=U nontrivial | In the allowed case [FU:Φ]=[F:Φ][U:Φ], so multiplication has kernel 0. For F=U and a∉Φ, a⊗1−1⊗a maps to 0 and is nonzero. | Hypotheses exclude the wrong tensor model. |
| 6.1 Rohrlich vanishing headline | P={5}, α=β=1, q=25, c=2/5 | t=25^(2/5)≈3.624, box integers −3…3. u−v multiple of 25 forces u=v, excluded: count=0. | Consistent with eventual vanishing; quantitative theorem is not a small-value claim. |
| 6.1 Rohrlich bound headline | Same data, d=11/20, s=7/16 | t≈5.873, |u−v|≤10<25, count=0; 5d/2−1=3/8<7/16<1/2; 0<25^(7/16)≈4.09. | Correct strict exponent range. |
| 6.1 changed boundary Check | P={5}, α=5, β=0, c=0 | At q=5: u=−1,0,1 and v=±1 give count6; at q=25 no nonzero −5v is divisible by25, count0. P empty admits only supported q=1, excluded by threshold Q=2. | Repaired Check; no empty-product counterexample to eventual statement. |
| 6.2 Galois average | K=Q(√−7), support {5} | Stated limit=(12/5)L(1,κ), nonzero; a Galois orbit of identically vanishing central values has average 0. | Supplies the nonvanishing contradiction using named Dirichlet nonvanishing. |
| 6.3–6.5 Galois stability and parity headline | σ(ζ25)=ζ25² fixing K; class-number-three unramified character | Order25→25, c3→3, zeros 0→0. Unramified order3 has c0 and sign multiplier1. Both c even and odd occur unboundedly. | General class-number scope survives; existential sign is constrained by both infinite parity classes. |
| Ownership overlap | Two CM theta candidates, a=(5) | Same divisor makes ratio u constant; norm tests give u³=u⁸=1, gcd(3,8)=1, hence u=1. | Same object in both packages, R10. |

### Lean headlines, binder audit and padding

The summary's end results are the BKO almost-all unit theorem and parity dichotomy. Its other named deep deliverables are Kato reciprocity and integral class, the torsion/Lubin–Tate and disjointness comparison, root-number formulas, Finis's weight-one theorem, and Jia's average/nonvanishing with Rohrlich's estimates.

- `centralValue_parity_dichotomy`, `rohrlichCount_eq_zero` and `rohrlichCount_lt` are stated on native carriers in Suggested.lean:130,140,166.
- The module docstring names the remaining headline groups and the specific missing CM-period, cohomology, regulator, attached-curve/torsion, Lubin–Tate, root-number and coefficient-transport interfaces. It correctly distinguishes native ring class fields from the missing CM attachment. No additional statable headline or weakened substitute was found.
- The ten public declarations (seven definitions and three theorems) are all mentioned in the README. Backticked imported names were resolved; mathematical expressions such as X_l and aθ are notation, not purported Lean declarations. The local `factPrime` instance is simple support, not an admitted theorem.

Ran the prescribed `lake env lean` on packages/NonordinaryCMSpecialValues/Suggested.lean from the pinned content checkout. Exit 0; the only diagnostics are the three expected `sorry` warnings at lines 130,140,166. Both individual TauCeti imports resolve; no object-file build was needed. No bare build, update or cache command was run.

On a scratch copy, appended `#check @name` for each of the ten public declarations and checked the local `factPrime` in scope. Exit 0, only the same three warnings. The supplied signature listing's apparent extra names from prose were extraction artifacts; the fresh checks concern actual declarations. No type lost a standing binder. In particular the parity theorem retains the quadratic-CM hypotheses, odd inert prime, unramified base character and odd unramified finite twist, and normalized uniformizers; `factPrime` has the explicit Nat.Primes parameter. The family predicates themselves are allowed on CM fields, while the headline explicitly restricts to quadratic extensions, as the prose does.

On a separate scratch copy ran, at each of the three admitted proofs, a closing probe with `simp`, `rfl`, `infer_instance` and `exact?` (each simple branch required to solve its goal). All three remained unproved; the final diagnostics were “could not close the goal.” Inspected their native definitions and library near-matches as well: none is a definition restatement, a boundary theorem, a Check, or a one-lemma library restatement. No padding finding. This probe establishes only the absence of the tested trivial proof routes, not truth of the admitted statements.

### Pinned library evidence and duplication by object

The following definitions/declarations were opened at the supplied pins; names found by searches were not accepted from search summaries alone.

| Pinned file and line | Object and relevant limitation |
| --- | --- |
| Mathlib/NumberTheory/NumberField/Basic.lean:102; ClassNumber.lean:65 | RingOfIntegers is the integral closure of Z; classNumber is the finite cardinal of its class group. |
| Mathlib/NumberTheory/NumberField/CMField.lean:70,142,154 | IsCMField, complexConj and its embedding compatibility. CM alone does not assert degree two over Q. |
| Mathlib/LinearAlgebra/Dimension/StrongRankCondition.lean:666 | IsQuadraticExtension supplies the separate rank-two condition. |
| Mathlib/RingTheory/FractionalIdeal/Basic.lean:83; DedekindDomain/Ideal/Lemmas.lean:490; Ideal/Norm/AbsNorm.lean:262 | Fractional ideals, height-one primes and absolute norm; the zero ideal is not silently a finite prime. |
| Mathlib/Algebra/MonoidAlgebra/Basic.lean:231,250 | lift and lift_single evaluate a singleton coefficient b at a as b•F(a), with no character inversion. |
| Mathlib/RingTheory/LinearDisjoint.lean:233 | Subalgebra.linearDisjoint_iff_injective is already supplied and is cited, not replanned. |
| Mathlib/NumberTheory/LSeries/Nonvanishing.lean:412 | DirichletCharacter.LFunction_apply_one_ne_zero requires a nontrivial Dirichlet character; it is not a theorem about these Hecke twists. |
| Mathlib/NumberTheory/Padics/PadicIntegers.lean:71; PadicNumbers.lean:545 | Native p-adic integers/numbers with primality carried by the declarations. |
| Mathlib/RingTheory/Algebraic/Defs.lean:45; Data/Set/Card.lean:643 | Algebraicity and ncard; ncard uses encard.toNat, so the finite box, not a total cardinal's junk value, justifies the count. |
| Mathlib/Topology/Algebra/InfiniteSum/Defs.lean:107; Analysis/Calculus/FDeriv/Defs.lean:172 | HasProd is convergence of finite products; Differentiable supplies the complex entire-function condition. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Basic.lean:70,80 | HeckeCharacter is a ContinuousMonoidHom of the idele class group to C×; finite order is separate, and unitarity is not built in. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/FiniteComponent.lean:85,181,230,254,270 | finiteComponent, conductorExponent, inverse-conductor compatibility, finiteConductor and nonzero conductor. |
| TauCeti/NumberTheory/NumberField/Global/HeckeCharacter/Ideal.lean:120,155,200 | idealCharacter, prime/uniformizer compatibility and principal-congruence law; the prime-to-conductor domain is essential to R07. |
| TauCeti/NumberTheory/NumberField/Global/RayClass/Modulus.lean:98,316,498 | Modulus, IsCongrOne on K× and idealsPrimeTo; principal ideal membership follows from the named congruence API. Zero is not a congruence unit. |
| TauCeti/NumberTheory/ClassFieldTheory/ClassFields/RingClass/Field.lean:111,155,178,214,222,251 | Native ringClassField, unramifiedness away from conductor, Artin/Pic equivalence, Frobenius, degree and complete-splitting criterion. These do not construct the CM curve/torsion attachment. |

Object searches covered theta units/divisors, canonical CM pairs, elliptic units/zeta classes, de Rham realizations, height-one reciprocity, ring-class and Lubin–Tate fields, Finis/Shintani invariants, torsion-closure arguments, Hecke central values and Rohrlich counts in the pins, main, readable board packages and the supplied open-head tooling. The supplied Loogle/LeanSearch candidates were inspected against the pin: Dirichlet L-functions, ordinary multiplicative-character inversion, and interval cardinality lemmas do not prove the three headlines. No same fully qualified public declaration was found in another readable roadmap. Ownership of the distinctive Finis and Rohrlich developments remains here; general native objects are imports. R10 is an object overlap even though there is no Lean name collision.

### Resolved roadmap citations and supplier order

Used `roadmaps show`/`roadmaps grep` against the available heads, read the board index first, and opened the cited sections rather than relying on the resolver. The one resolver lead, LubinTateFormalModulesAndQuasiCanonicalLifts §2.1, resolves in its board package. The open-PR overlap report has no conflicting head, dropped cited id or revision-only id for this package. Its closest roadmaps were read for ownership; absence of an overlap-tool warning did not override R10.

| Supplier checked | Current section evidence and outcome |
| --- | --- |
| ComplexMultiplicationAndExplicitReciprocity, PR #1254 | TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocity/README.md:354 (§1.2),453 (§2.2),595 (§3.2),639–646 (§4.1),669–674 (§4.2),688–703 (§4.3). Periods, dictionary, CM components, all-prime factors and canonical existence resolve. The general theta-series use additionally has GL2 induction; the inert general Frobenius argument is made in this package, not assumed from the rational-curve-only example. |
| AutomorphicLFunctionsAndLocalFactors, PR #924 | TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md:25–27 explicitly forwards former AL.1.5.2/1.6.2 to AnalyticNumberTheoryPartI §2.3a. AL.1.1.1,1.3.1/4/5 and AL.5.1.1/5.3.2 remain. This is a valid old-to-new map, not drift. |
| ArithmeticGaloisRepresentations, PR #856 | TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:2398, §2.7 root-number product. Changing every local additive character by −1 has product of multipliers 1; changing only infinity would not. |
| SelmerIwasawaCohomology, PR #869 | TauCetiRoadmap/SelmerIwasawaCohomology/README.md §§0.8–0.11 at lines 222–264, §§3.6–3.7 at 1468–1492. Kummer completions, finite-S units, cup products, semilocal cohomology and cyclotomic twisting resolve. General character twisting is correctly a gap. |
| NeronModelsAndSemistableAbelianVarieties, PR #852 | TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3109, §5.1, supplies good reduction iff the prime-to-residue-characteristic Tate representation is unramified over a henselian DVR. This is the missing named input to the good-reduction step corrected in R02; ORDER.txt:67 places it earlier. |
| PadicHodgeRegulators, PR #1498 | TauCetiRoadmap/PadicHodgeRegulators/README.md §§1.4,1.7,1.11, lines 523,572,646: Fil⁰ dual exponential, trace/twist compatibility and semilocal maps. |
| ModularSymbolsPadicLFunctions, PR #968; GL2AutomorphicRepresentationsAndTransfer, PR #931 | TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1380 (§1.2),2520 (§4.3); TauCetiRoadmap/GL2AutomorphicRepresentationsAndTransfer/README.md:2692 (R17.4.16). Algebraic critical coordinates and their transport, plus quadratic induction. No arbitrary transport of transcendental periods is asserted. |
| PadicFamilies, PR #1019; NoncommutativeAndEquivariantIwasawa, PR #1307 | TauCetiRoadmap/PadicFamilies/README.md:2366 (§4.0.1); TauCetiRoadmap/NoncommutativeAndEquivariantIwasawa/README.md:2062 (§4.3). Integer theta unit imported; ordinary rational-CM Siegel normalization distinguished. KatoEulerSystems, PR #1804, README:68–75 imports the same earlier theta owner. |
| LubinTateFormalModulesAndQuasiCanonicalLifts | packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:605,635,657,688,1066,1101. All six section citations resolve. No separately indexed PR number is available for this package. |
| Main: DiophantineApproximationAndTranscendence | TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:953,1035 (§§2.1,2.3), finite-S subspace/Ridout estimates. |
| Main: class fields and local fields | Completed/GlobalNumberFields/README.md:508,531,571 (Layers 9–11); TauCetiRoadmap/ClassFieldTheory/README.md:1924 (Layer 13),2128 (native ring-class interface); Completed/Chebotarev/README.md:410 (Layer 10); Completed/LocalFieldsRamification/README.md:576,724 (Layers 2–3). |
| Main: elliptic curves and analytic inputs | TauCetiRoadmap/EllipticCurves/README.md:423,647,683 (Layers 1–3); Completed/ArithmeticDirichletSeries/README.md:190,237 (Layers 3,5); TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1356 (§2.3a). |
| Nearby consumers | AnticyclotomicLocalUnits, PR #1692; CMRankZeroConverse, PR #1744; ModularIwasawaMainConjectures, PR #1499; KatoEulerSystems, PR #1804: scopes distinguish local projections, converse, main conjectures and modular-curve classes. Old NCM design-stage consumer labels were not newly dropped by this package; no new renumbering finding is inferred from them. The readable PartII board overlap is separately R10. |

Read every Needs line and its supplier contract. The requested dependency command, with movable placement and the supplied main/order, produced:

```text
depcheck: 236 roadmaps, 2141 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This coarse check cannot prove correct formulas or unique ownership. The repair of R10 must preserve the current earlier-to-later direction.

Both declared gaps match packages/NonordinaryCMSpecialValues/design/plan.json:1892 and the README contracts: `al-local-frohlich-queyrut` (AutomorphicLFunctionsAndLocalFactors AL.1) and `sic-character-twist` (SelmerIwasawaCohomology §3.7). Each has a named earlier supplier, explicit hypotheses and a single missing comparison theorem. Searches did not find the same general statement already provided; the available cyclotomic twist is narrower. Finite-S Kummer completion remains explicit. These are contracts, not findings. Because this verdict needs changes, conditional acceptance is not recorded.

## Not verifiable

- BOXALL92, Theorem 1, pp.1063–1066: primary text was not read; access is explicitly waived. Finis's exact invocation and component-relation application were checked. No access request is reopened; R08 concerns only the missing primary citation and manifest entry.
- JIA24's published Acta Arithmetica version was not read. All checked locators refer to arXiv v1, as the manifest explicitly says. AH05 was checked in the recorded arXiv v2; no claim of matching published page numbers is made.
- BKO extraction sometimes loses conjugation bars; character orientation was cross-checked with Kato's displayed formulas and the package's native conventions. Ambiguous Kato/Finis formulas named above were checked in page images.
- Ownership was checked against the provided main, board files and available open heads. No inaccessible or unnamed branch was searched for; no PR number is asserted for the two board packages without one in the supplied index. The board-only overlap needs coordination by the fix workflow.
- Lean elaboration and the padding probe do not prove the three admitted analytic/arithmetic theorems. No fresh source request remains outstanding.

## Source issues

- **Error** in KATO04 at (15.4.2), printed p.252: the source says every CM isogeny norm preserves the smoothing function; it should require the kernel to meet the smoothing torsion trivially; affects a stated result.
- **Misprint** in KATO04 at the proof of Proposition 15.9, printed p.258: the source sets ν_n=ξ_n−α_n but translates by plus ν_n; it should translate by minus ν_n, or reverse ν_n, to obtain θ_n(ξ_n)=aθ(α_n); affects the proof.
- **Misprint** in BKO21 at §3.0.2, printed p.952: the source uses l^m for both character order and ray conductor; it should use conductor l^(m+1) for a nontrivial character of order l^m; affects a stated result.
- **Misprint** in JIA24 at the rational-principal formula before (2.1), p.4: the source writes κ(n)n⁻¹ for the ideal character; it should be κ(n)n; affects the proof.
- **Misprint** in JIA24 at (2.43), p.10: the source gives a positive exponential in the tail bound; it should be exp(−N(a)/(Af)); affects the proof.
- **Misprint** in JIA24 at §4 before Proposition 5, p.18: the source takes the congruence modulo Z_p; it should be modulo qZ_p; affects a stated result.
- **Misprint** in JIA24 at (4.9), p.20: the source bounds the box by q⁻¹; it should be q^c; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "50ea8373c4731a27c7f92e0f668e461f7f2184d1", "job": "REV-PKG-NonordinaryCMSpecialValues~3", "model": "gpt-6-astra", "worker": "chris-8"} -->
