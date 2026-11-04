<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/163#issuecomment-6399812275 -->
Review (codex) of 0590194

Verdict: needs_changes

1. **F01** (P1) Finite-layer twisting needs finite coefficients

   **Location.** packages/KatoEulerSystems/README.md:1388–1394, §4.6: “specialization at ℚ(ζ_(p^n)) after φ_j equals cup product with ζ_(p^n)^(⊗j) after specialization, at every n.”

   **Claim.** This is stated for integral lattice cohomology, with no reduction of T modulo p^n.

   **Witness.** For p = 3, n = j = 1 and F = ℚ₃(ζ₃), H⁰(F,ℤ₃(1)) = 0 but H⁰(F,μ₃) has three elements. The proposed integral cup-product coefficient does not exist.

   An element fixing F can have cyclotomic character 4. Invariance of a putative integral Tate generator t would give 4t = t, hence 3t = 0 and t = 0. Modulo 3 the same calculation gives 4 = 1 and permits the nonzero generator. Rubin2000 line 6657, Appendix B, Lemma 3.1, pp. 153–154, uses the diagonal limit of H¹(F_n,T/p^nT). The current supplier explicitly makes this distinction: TauCetiRoadmap/SelmerIwasawaCohomology/README.md:1479–1485, §3.7. The package's own §5.3, line 1547, also warns against finite-layer integral twisting.

   **Exact repair.** State the finite-level identity after coefficient reduction, in H¹(F_n,(T/p^nT)(j)), using the invariant generator of (ℤ/p^n)(j); use its dual for negative j. Obtain the integral Iwasawa twist from the diagonal inverse limit with corestriction and coefficient reduction, then use its genuine integral projection. Retain the localization square, proved with the completed induced coefficient modules. Do not assert a G_Fn-equivariant integral trivialization of the Tate line.

   **Repair test.** At p = 3, n = 1 the corrected coefficient is μ₃ and 4 acts as 1. The integral coefficient has invariant submodule zero, so the repaired statement no longer asserts the impossible map. This retains every prime and every integer twist.

2. **F02** (P2) The scalar regulator omits the coefficient extension containing α

   **Location.** packages/KatoEulerSystems/README.md:1748–1755, §6.2: “there is η in the φ = α line of D_crys(V(f*)(k)*(1)) with ⟨ω, η⟩ = 1”.

   **Claim.** The coefficient field remains E = F_λ, but α is an arbitrary noncritical Euler root.

   **Witness.** The package's own §6.4 example, y² = x³ − x at p = 3, has E = ℚ₃ and α² = −3. Its roots have valuation 1/2 and are not in ℚ₃.

   Thus the displayed eigenvector equation cannot be an equation in the asserted E-vector space. Kato2004 line 5978, Theorem 16.6(1), p. 271, places η in F_λ(α) ⊗ D_crys; lines 5986–5995 perform the pairing argument after that extension. TauCetiRoadmap/AutomorphicGaloisRepresentations/README.md:2369, §5.2, also specifies a splitting coefficient extension.

   **Exact repair.** Choose a finite extension L/E containing the chosen α. Base change the crystalline and de Rham realizations, the zeta class and the regulator to L, put η in L ⊗_E D_crys, and state the scalar distribution's L-coefficient target. Carry the extension through §§6.3–6.5 and extend again when evaluating characters whose values require it. Do not repair this by requiring α ∈ E.

   **Repair test.** For the cited CM example, L = ℚ₃(√−3) contains both roots. Each has slope 1/2 < 1; the chosen eigenspace is one-dimensional and the strict-slope pairing argument applies. The existing factor 2/3 + 2α/3 then belongs to the stated coefficient field.

3. **F03** (P2) Critical-slope witness uses an unspecified, shifted character coordinate

   **Location.** packages/KatoEulerSystems/README.md:1859–1863, §6.5: “∏_(j=0)^(k−2) log_p(γ^(−j)s) vanishes at every classical interpolation point”.

   **Claim.** This witness is used for the regulator interpolation of §6.4, whose characters are κ^rχ⁻¹ for 1 ≤ r ≤ k−1.

   **Witness.** Set p = 3, γ = 4, k = 2, χ = 1. The §6.4 character has s = 4. The displayed product is log₃(4), of valuation 1, not zero.

   The cited supplier uses the modular-symbol coordinate: TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:2158–2167, §3.2, interpolates exponents 0 through weight−2. Section 6.3 already recognizes the shift between that coordinate and Kato's. Section 6.5 does not transport it or define s as a shifted coordinate.

   **Exact repair.** Define s explicitly. In the unshifted Kato coordinate s = θ(γ), use ∏_(r=1)^(k−1) log_p(γ^(−r)s). Alternatively retain the displayed product but define s = (κ⁻¹θ)(γ) and explicitly apply §6.3's transport. State the witness on each tame component, with γ ∈ 1+4ℤ₂ at p = 2.

   **Repair test.** In the unshifted version at k = 2, the value at the interpolation point s = 4 is log₃(1) = 0; at s = 1 it is −log₃(4) ≠ 0. The witness now establishes the claimed nonuniqueness for precisely the interpolation points under discussion.

4. **F04** (P1) Integer-lattice Eisenstein comparison loses N^k

   **Location.** packages/KatoEulerSystems/README.md:934–937, §3.2: “E^(k)_(a/N,b/N) is (−1)^k (k−1)!(2πi)^(−k) times the full lattice sum over the class of (a,b) modulo N”.

   **Claim.** The shifted rational lattice sum is identified with the corresponding integer congruence-class sum without a dilation factor.

   **Witness.** At N = 3, k = 4, (a,b) = (0,0), the asserted right side has constant term 1/9720. The left side has constant term 1/120, as the next Check states.

   Write C_k = (−1)^k(k−1)!(2πi)^(−k). Substituting u = a+Nm, v = b+Nn into the correctly stated formula at line 916 gives
   E^(k)_(a/N,b/N) = C_k N^k Σ′_(u,v ≡ a,b mod N)(uτ+v)^(−k).
   The integer summand is the pinned one: Mathlib/NumberTheory/ModularForms/EisensteinSeries/Defs.lean:183. Kato2004 line 921, §3.8, pp. 138–140, uses the shifted lattice.

   **Exact repair.** Insert N^k in the integer-lattice comparison. Define the full integer congruence-class sum explicitly, retaining the separate passage from full sums to Mathlib's primitive sums. Add a level-dependent Check; the existing level-independent E₄/120 check alone missed this error.

   **Repair test.** At N = 3, k = 4 the corrected constant is 81/9720 = 1/120. For the nonzero class (0,1), the shifted summand (1/3)^−4 = 81 equals 3⁴ times the integer summand 1. Both zero and nonzero congruence classes detect the missing factor.

5. **F05** (P1) Multiplication by p does not kill the whole reduction-group inverse limit

   **Location.** packages/KatoEulerSystems/README.md:2116–2118, §7.5: “the norm acts on E/E₁ ≅ Ẽ(𝔽_p) as multiplication by the degree, so the limit of these finite groups is zero”.

   **Claim.** The inverse limit of the whole finite reduction group under multiplication by p is zero.

   **Witness.** For p = 5 and E: y² = x³ + x, Ẽ(𝔽₅) = {∞,(0,0),(2,0),(3,0)}. Multiplication by 5 is the identity. Its inverse limit has order four, not one.

   The curve has discriminant −64 and a₅ = 2, so it is in the good ordinary domain. The following Checks correctly mention finite p-groups; the proof sentence instead names the full reduction group. The tensor/completion in the first displayed equality must also be interpreted before taking this quotient.

   **Exact repair.** State the first inverse system using p-adic completions E(F_n)^∧_p, and pass to the finite p-primary reduction quotient Ẽ(𝔽_p)[p^∞]. Explain that multiplication by p is nilpotent on that quotient, hence its inverse limit is zero. Keep the formal-group identification and rank-one result under their actual hypotheses. Add the prime-to-p example as a negative control for the unreduced assertion.

   **Repair test.** For this curve, Ẽ(𝔽₅)[5^∞] = 0, so the corrected inverse limit is zero. On a nonzero finite p-group of exponent p^a, a successive norm maps multiply by p^a = 0; the same conclusion holds without excluding anomalous primes.

6. **F06** (P3) Definition APIs remain name catalogues, and Checks are not allocated per definition

   **Location.** packages/KatoEulerSystems/README.md:1757–1760, §6.2: “The API is katoScalarRegulator_def, katoScalarRegulator_linear, katoScalarRegulator_scale and katoScalarRegulator_projection_add.” The same pattern occurs at lines 723, 809, 876, 1483 and 1573.

   **Claim.** These paragraphs are offered as the definitions' API lists. Several entries supply only names, rather than the required bullets stating the mathematics with hypotheses and conclusions.

   **Witness.** The line 1757 list does not state the projection-additivity law. At lines 815–827 the separately defined Euler operator has only two explicit operator Checks; the other Checks test the full-level zeta/moment construction.

   **Exact repair.** Convert each definition's API into prose bullets giving the actual law, its domain and hypotheses. Make the Check allocation explicit for each definition and supply at least three discriminating Checks per definition. In §2.3, a third operator Check can use ℚ, T′ = 2 id, S′ = 0, σ = id and ℓ = 3: the operator sends 1 to −1, whereas the wrong plus sign sends it to 3. For §6.2 state projection additivity for normalized vectors with a common coefficient field, using R02's extension. Keep these API facts and Checks in the README, not Suggested.lean.

   **Repair test.** The proposed operator Check computes 1−2+0 = −1 versus 1+2+0 = 3 and distinguishes the missing sign case. A projection-additivity bullet must compare ℒ_(η₁+η₂)(x) with ℒ_η₁(x)+ℒ_η₂(x) on their common allowed domain; it must not say that the sum remains normalized against ω.

Six findings: three P1, two P2 and one P3; five blocking. All eight previous findings are repaired. These findings concern different claims, not a rejection of those repairs. The package is repairable without changing its ownership or general scope.

## Verified sound

The four package inputs were read: 2,558 README lines, 73 Lean lines, the metadata and the source manifest. The pass covered the eight layers, their conventions, formulas, APIs, Checks, proof inputs and dependency lists. Unchanged passages were rechecked where the previous report lacked computed values; its computed cases were also recomputed where they entered a sampled target or a changed passage. The 61-row table below records the sampled targets, headlines, every finding and the principal tests across the remaining layers. Computed examples test the assertions and conventions; they are not proofs of the general theorems.

### Previous findings, checked before the new pass

| Previous finding | Repaired passage in this package | Verification and status |
|---|---|---|
| F01, modularity binder | README:2321: “No modularity hypothesis is made”; Suggested.lean:11–12: “every elliptic curve over ℚ is modular” | Both remaining signatures omit hmod. Current EllipticCurveModularity R29.6 supplies unconditional modularity. **Repaired.** |
| F02, adelic group | README:1116–1122: “the image of H under (ρ_f, κ̂) is open in Loeffler's group” | Loeffler2017 lines 128, 282–289 specify the group of pairs. Local square indices 4 and 8 do not imply adelic openness in the larger group. **Repaired.** |
| F03, admissibility | README:1648–1657 attaches the constituent admissibility condition to uniqueness; README:1748: “Let (f,λ) be admissible.” | Nakamura2023 lines 1941–1962 give existence independently; (19), line 2037, and the §5.5 injection give uniqueness with the stated condition. Contragredient invariants on the cyclotomic kernel have the same dimension. §§6.2, 6.4 and the §6.5 reference retain the proviso. **Repaired.** |
| F04, rational-point padding | README:2321–2324 describes the m = 1 case in prose | The redundant declaration is absent. For m = 1, I_χ = 0 and the character part is all rational points. **Repaired.** |
| F05, dyadic CM field | README:1319: “K = ℚ(i) or ℚ(√−2)”; Check at 1346 | ζ₈+ζ₈³ = i√2, while ζ₈+ζ₈⁻¹ = √2 is real. **Repaired.** |
| F06, Lean names in Checks | README:894: “the restricted modular dual exponential”; README:2424: “the Tamagawa bound of part (3)” | The four cited occurrences now name mathematical objects. Checks were searched for repeats of the identifier pattern. **Repaired.** |
| F07, locator/manifest drift | README:1653: “(19), p. 46”; References:2492 onward include 8.4, 8.12, 15.23 and 17.2 | Read Kato2004 lines 2548, 2715, 5833, 6040 and Nakamura2023 lines 2037, 2120. Rohrlich1984 now records §7.9. **Repaired.** |
| F08, Selmer-carrier description | Suggested.lean:22–23: “lacks the p^∞-Selmer group of E over K”; “selmerGroup₂ is the 2-Selmer group” | Opened the pinned definition at TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104. It is a square-class subgroup, not the p-primary Selmer group required here. **Repaired.** |

No finding in the repair report was marked “not actionable in this package”; none is re-raised here.

### Seeded source verification

All fifteen sampled sections were checked against the available cached legal texts, including their surrounding hypotheses. There are no author-flagged unverified locator entries requiring a new fetch. Settled unavailable texts are listed separately below. Source passages have not been copied into this report.

| Sampled target | Source, locator and extraction witness | Outcome |
|---|---|---|
| 0.2 Galois action and two-coordinate distribution | Kato2004 lines 271–301, §§1.6–1.7, p. 123 | Row action, simultaneous root-of-unity action, A ≠ 0 and both torsion coordinates agree. |
| 0.3 Analytic product, cusp order and integral descent | Kato2004 lines 228–239, §1.3(3), p. 122; lines 321–330, §1.9, p. 124 | Product and excluded zero section agree; the package correctly repairs the Bernoulli misprint. Integral descent additionally uses the named modular-curve charts, not merely the analytic formula. |
| 2.3 Full-level Hecke-linear zeta classes | Nakamura2023 lines 1659–1742, §§3.1.3–3.1.4, pp. 38–40, with Lemma 2.10, pp. 29–31 | Literal dual, moment map, unspecialized Hecke action and 1−T′σ⁻¹+ℓS′σ⁻² agree. |
| 3.2 Kato's Eisenstein series | Kato2004 lines 766–1019, §§3.2–3.11, pp. 135–142 | Fourier powers, smoothing, weight-two regularization and dlog sign agree. Integer-lattice conversion fails: R04. |
| 3.3 Eisenstein zeta forms and Betti periods | Kato2004 lines 1030–1062, §4.2, pp. 142–143; lines 1750–1846, §§6.3–6.6, pp. 161–163 | Branches, factorial range, smoothing powers, dual form and projected period identity agree, subject to the extraction limitation for some displayed typography below. |
| 4.6 Twist/specialization/localization | Rubin2000 lines 6657–6667, Appendix B, Lemma 3.1, pp. 153–154 | Supports finite-coefficient diagonal limits; does not support the integral finite-layer cup product: R01. |
| 5.2 Smoothed integral span | Kato2004 lines 4096–4102, Theorem 12.6, p. 222; §§13.10–13.12, pp. 230–232 | Both generating families and their auxiliary restrictions are present; finite quotient, not equality, is the conclusion. |
| 5.5 Parabolic Iwasawa cohomology | Nakamura2023 lines 2058–2088, Lemma 3.4 and Remark 3.5, pp. 46–47 | Parabolic coefficients and the separate torsion-freeness/injectivity clauses agree. The package retains its extra admissibility condition for the proof route it owns. |
| 6.1 Perrin-Riou's de Rham map | Kato2004 lines 5932–5966, Theorem 16.4 and Remark 16.5, p. 270; Colmez1998 lines 306–312, Theorem 7; Nakamura2014 lines 194–206, Theorem 1.5 | Filtration containment, η-domain, r ≥ 1 and the unsimplified exceptional Euler factors are retained. The package corrects the auxiliary-vector misprint. |
| 6.2 Period-normalized scalar regulator | Kato2004 lines 5970–5997, Theorem 16.6(1) and proof, p. 271 | Noncritical pairing argument is supported; scalar extension has been omitted: R02. |
| 6.4 Noncritical equality | Kato2004 lines 5902–5927, Theorem 16.2 and Remark 16.3, p. 269; lines 5973–6004, Theorem 16.6, p. 271 | Equality and strict slope threshold agree, with R02's coefficient repair. One sign in the OCR is not independently legible; see below. |
| 6.5 Critical/bad-reduction domains | Kato2004 lines 5932–5997, §§16.4–16.6, pp. 270–271; current ModularSymbolsPadicLFunctions §3.2 | Bad-reduction/eigenline restrictions agree. The logarithmic nonuniqueness witness needs character-coordinate transport: R03. |
| 6.6 Elliptic lattice/period | Rubin2000 lines 2190–2209, Proposition III.5.1, p. 48; lines 2244–2255, Theorem III.5.3, p. 49 | Pairing and Euler-system period formula agree. The package correctly distinguishes total/primitive periods and repairs the dyadic logarithm problem. |
| 7.2 Cohomological upper bound | Kato2004 lines 4077–4095, Theorem 12.5(3)–(4), p. 222; lines 4518–4558, §§13.13–13.14, pp. 233–234 | Inequality direction, length-one exceptional term, integral image and odd-prime/full integral-image hypotheses agree. |
| 7.7 Trivial-character control | Rubin2000 lines 2474–2476, proof of III.5.18, p. 54; Greenberg1999 lines 1480–1488, Theorem 4.1, p. 35 | The finite-Selmer proviso and reduction-group square factor agree. Perrin-Riou1990 and Schneider1985 remain settled uncertified secondary inputs. R05 affects the cited norm argument, not this numerical factor. |

### Adversarial computations

“Retain” means this particular computation found no defect, not that a toy example proves the general assertion. “Repair” refers to the numbered findings. No package mathematics was edited during the review.

| Statement/target | Instances tried | Computed values on the two sides or against the wrong model | Result/change |
|---|---|---|---|
| Conventions: cyclotomic action and twists | σ₂ on ζ₅; κ(γ)=4 | σ₂ζ₅=ζ₅², inverse convention gives ζ₅³; φ₁(γx)=(1/4)γφ₁(x), opposite convention gives 4γφ₁(x) | Retain action/semilinearity; finite specialization separately R01 |
| 0.1 smoothing and auxiliary independence | c=5,d=7 | c²−1=24, d²−1=48; products 24·48=48·24=1152 | Retain |
| 0.2 row action | (1/5,0), upper/lower shear | Upper shear gives (1/5,1/5); lower gives (1/5,0). A diagonal determinant 2 sends ζ₅ to ζ₅² | Retain |
| 0.2 two-coordinate distribution | A=2, A=−2, A=0 | Nonzero ±2 have four preimages in the two torsion coordinates; one-coordinate product has two. A=0 has no such finite fiber | Retain A≠0 and two-coordinate domain |
| 0.3 Bernoulli exponent | a/N=0,1/2,2/5 | B₂(x)/2 = 1/12, −1/24, −11/300; the printed linear last term gives −23/300 at 2/5 | Retain correction |
| 0.3 cusp order | c=11, (0,1/5), width 5 | (121−1)/12=10; order 5·10=50, versus 10 if cusp width is dropped | Retain |
| 0.4 degeneracy versus two-coordinate product | A=4 | One-coordinate fiber has 4 terms; multiplication-by-4 torsion fiber has 16 | Retain distinction |
| 1.1 ordered K₂/Chern sign | Ordered torus basis mod 3 | {x,y} maps to 1; {y,x} to −1=2; {1,y} to 0 | Retain |
| 1.1 transfer | 2+i over ℚ(i)/ℚ | Norm=5, trace=4; the proposed transfer uses 5. For 1+i both equal 2 and fail to discriminate | Retain discriminating example |
| 1.2 and 2.1 Euler polynomial | k=2,r=1,ℓ=3,a=2,ε=1 | Moment polynomial 1−(2/3)X+(1/3)X²; K₂ quadratic coefficient 3, not 1/3; value at X=0 is 1 | Retain |
| 2.2 literal dual | Sym² basis at p=2 | Pairing anti-diagonal −2,1,−2 has determinant −4, not a 2-adic unit; inverting 2 changes the integral problem | Retain literal dual |
| 2.2 diamond transport | k=4,ℓ=3 | The weight shift contributes 3²=9; untransported diamond scalar differs by factor 9 | Retain |
| 2.3 full-level operator | T′=S′=σ=id,ℓ=3; σ=0 | 1−1+3=3 versus 1 with missing ℓ; at σ=0 both nonconstant terms vanish, value 1 | Retain; third Check R06 |
| 2.3 linear construction | Literal-dual zero and identity on ℚ | Zero input maps to 0; identity functional evaluated at 1 maps to 1, whereas zero moment gives 0 | Retain |
| 3.1 filtration | k=4,k=2, zero space | k=4: F¹=F²=M, gr¹=0, F⁴=0; k=2: F¹=M; zero M gives all pieces 0 | Retain |
| 3.2 Fourier inverse | N=3,k=3 | Double finite transform multiplies by 9; inverse composition (1/27)·3·9=1; wrong forward power gives 3·3·9=81 | Retain |
| 3.2 weight-four constant | E^(4)_(0,0) | 3!·2ζ(4)/(2πi)⁴=1/120 | Retain shifted-lattice formula |
| 3.2 integer-lattice comparison | N=3,k=4, zero/nonzero class | Constant 1/120 versus 1/9720; term 81 versus 1; repaired dilation N^k=81 reconciles both | R04 |
| 3.2 smoothing/dlog | k=2,c=5; a/N=0 | Smoothed F constant multiplier 25−1=24; product logarithmic constant 1/12 equals −F² constant, not F² constant | Retain |
| 3.3 two formula branches | r=r′=k−1 | Both coefficients equal (−1)^(k−1) M⁻¹N^(1−k)/(k−2)!; k=2 denominator 0!=1 | Retain |
| 3.3 smoothing and sign | k=2,r=1,c=5,d=7, even χ; k=4,r=2 | (25−5)(49−7)=840, not (25−1)(49−1)=1152; signs respectively +1 and −1 | Retain |
| 3.4 regulator and divided limit | Loop with log 2; Z(s)=sA+O(s²) | Ordered integral 2πi log 2, swapped negative; lim Z(s)/s=A while Z(0)=0 | Retain |
| 4.1 rational/integral rank-one quotient | Unipotent parameter 2; parameter 0 | Over ℚ₂ nonzero parameter gives cokernel dimension 1; over ℤ₂ gives ℤ₂⊕ℤ/2; zero gives rank 2 | Retain separation |
| 4.1 repaired adelic group | k=3, odd p and p=2 | Square-class indices in ℚ_p^× are 4 and 8, finite; unit square index 2 at infinitely many odd p gives infinite adelic index in the larger group | F02 repaired |
| 4.2 nonvanishing boundary | (k,r)=(3,2),(4,3) | Shift r−(k−1)/2 gives 1 and 3/2; finite exceptional twists does not force the trivial twist nonzero | Retain boundary hypotheses |
| 4.2a strict local kernel | T=ℤ_p(2) | Global rational invariants in the relevant dual vanish; on the cyclotomic local subgroup the dual becomes trivial and local H² contributes ℤ_p | Retain distinction from full H² |
| 4.3 rational versus integral image | Unipotent parameter 1 versus p | Integral cokernels O versus O⊕O/p; rational cokernel dimension 1 in both | Retain free-quotient requirement |
| 4.4 CM contained fields | ζ₈; odd cyclotomic prime | ζ₈²=i; ζ₈+ζ₈³=i√2; ζ₈+ζ₈⁻¹=√2. Imaginary fields at 2 are ℚ(i),ℚ(√−2) | F05 repaired |
| 4.4 full dyadic algebra | Rational C₂ component | ℚ₂[C₂]≅ℚ₂×ℚ₂; neither rational component disappears. Calling the full integral algebra a domain would fail | Retain componentwise formulation |
| 4.5 finite support | R=ℤ_p[[T]], M=R/(p,T); R/(p) | First module has p elements and all height-one localizations zero; second is 𝔽_p[[T]], infinite, supported at height one | Retain |
| 4.5 dimension/regular quotient | R=ℤ_p; μ=p | ℤ/p has height-one support in dimension one; R/(p) has p-torsion, so the required p-torsion-free quotient condition fails | Retain hypotheses |
| 4.6 integral versus reduced twist | F=ℚ₃(ζ₃),j=1 | Integral invariants 0; mod-3 invariants have order 3; 4t=t forces t=0 integrally but 4=1 mod 3 | R01 |
| 4.7 dyadic group cohomology | G=GL₂(ℤ/4), natural (ℤ/4)² | Enumerated group order 96, 32 cocycles, 16 coboundaries, H¹ order 2. Explicit cocycle below remains nontrivial after inflation to ℚ₂/ℤ₂ coefficients | Retain; previous uncomputed case resolved |
| 5.1 canonical zeta map | Zero input, generator, conjugation | z(0)=0; prescribed nonzero generator value excludes zero map; z(ιγ)=−σ₋₁z(γ) differs by sign in characteristic zero | Retain |
| 5.2 finite smoothed quotient | Quotient 𝔽₂ over ℤ₂[[T]] | Cardinality 2 but every height-one localization 0; finite index does not imply equality | Retain |
| 5.3 critical interpolation sign | Even χ, (k,r)=(2,1),(4,2) | (−1)^(k−r−1)χ(−1)=+1,−1; twist exponents k−r=1,2 | Retain; apply corrected R01 construction |
| 5.4 twist-one/conjugation | k=2 and general k | (1−k)+k=1; Kato's minus times Tate signs (−1)^(1−k+k) is +1 | Retain; period scalar remains uncertified below |
| 5.5 torsion-free hypothesis | Λ⊕Λ/(T)→Λ | Rational generic kernel 0 but actual kernel Λ/(T)≠0; torsion-freeness is essential to upgrade generic injectivity | Retain |
| 5.6 repaired uniqueness | Difference d; zero cusp space | per(ω_m(d))=0 gives ω_m(d)=0 by (19), then d=0 by §5.5. Zero cusp space yields zero parabolic module; no contradictory exceptional case | F03 repaired |
| 6.1 filtration domain | V=ℚ_p(1) and V=ℚ_p | Dual-twist Fil⁰ dimensions respectively 1 and 0; crystalline dimensions 1 in both. Containment holds only in the first test | Retain |
| 6.1 Gauss/Euler factors | Quadratic χ mod 3; r=1 | G=i√3, G⁻¹=−i/√3; unramified factor 1−φ⁻¹. Replacing exponent r−1 by r introduces an extra p | Retain |
| 6.2 scaling/eigenline | ω→2ω,γ→3γ; CM example at 3 | Regulator scale 3/2; over ℚ₃ the roots of X²+3 are absent; over ℚ₃(√−3) each eigenspace has dimension 1 | R02 |
| 6.3 period dictionary | k=2,r=1; χ mod 3 | Powers (2πi)^0 and (2πi)^−1 have ratio 2πi; G²=−3=χ(−1)·3 | Retain |
| 6.4 analytic/arithmetic local factors | Split/nonsplit multiplicative; CM p=3 | α=1 gives 0; α=−1 gives 2. CM α²=−3 gives (1+α/3)²=2/3+2α/3 | Retain over R02's field |
| 6.5 critical witness | p=3,γ=4,k=2 | Original at Kato's s=4 is log₃4≠0, valuation 1; repaired is log₃1=0; repaired s=1 gives −log₃4≠0 | R03 |
| 6.5 bad supercuspidal domain | a_p=ε(p)=0 | Euler polynomial X² has only root 0; no nonzero crystalline α-eigenline is asserted | Retain |
| 6.6 total period | Two real components, r⁺=3,Ω⁺=2 | r/Ω=6/4=3/2=r⁺/Ω⁺; v₃(2)=0, v₂(2)=1 | Retain |
| 6.6 dyadic formal logarithm | y²+xy=x³+1, t=2u | Δ=−433 is odd; log(t)≡2u+2u²≡0 mod 4; on 4ℤ₂ logarithm is onto 4ℤ₂. Dual lattice (1/4)ℤ₂ differs from (1/2)ℤ₂ | Retain correction to Rubin |
| 7.1 non-torsion headline | Rank-one ambient module; zero candidate | Zero image has rank 0 versus required rank 1; geometric reciprocity/nonvanishing is needed, not merely the ambient rank calculation | Retain construction-based proof |
| 7.2 cohomological bound headline | Exceptional local length 1 | 2≤1+1 holds; dropping the local term would give 2≤1, false. Nonexceptional local length is 0 | Retain exceptional correction |
| 7.3 cyclotomic finite generation | Abstract rank-one group ℤ[1/p] | Rank 1 and torsion subgroup 0 do not imply finite generation; ℤ[1/p] needs unbounded denominators. The package includes finite-layer descent, not only a rank count | Retain |
| 7.4 divisibility headline | Nonsplit multiplicative p=5 | α=−1,β=−5: (1−α⁻¹)/(1−β⁻¹)=2/(6/5)=5/3; split α=1 gives zero at the exceptional character | Retain local multiplier |
| 7.5 universal norms | y²=x³+x over 𝔽₅ | Reduction group order 4; [5]=id; whole inverse limit order 4, p-primary inverse limit order 1 | R05 |
| 7.6 no finite submodule headline | Λ/(p,T) | Nonzero module of order p is torsion and finite; torsionness alone does not imply the headline. Good ordinary odd-p criterion remains required | Retain |
| 7.7 trivial-character control | p=5, Frobenius polynomial X²−X+5 | #Ẽ=5. Unit root α≡21 mod25, inverse≡6; v₅(1−α⁻¹)=1. Squared correction has p-part 25 on both descriptions | Retain numerical local factor |
| 7.8 rank-zero p-part bound headline | Anomalous local valuation a | Interpolation and control both contribute 2a; cancellation gives 2a−2a=0. Omitting control leaves the wrong extra term 2a | Retain |
| 7.9 χ-part definition | Quadratic G=C₂, χ(σ)=−1 | Iχ generated by 1+σ. A fixed point of order 3 gives 2P≠0 and is excluded; fixed 2-torsion gives 2P=0 and is included | Retain integral annihilator, not a rational projector |
| 7.9 character theorem headline | m=1; imprimitive local factor at 5 | χ=1, Iχ=0, part=E(ℚ). For good a₅=1 deleted factor at s=1 is 1−1/5+1/5=1; split/nonsplit factors 4/5,6/5, all nonzero | Retain continuation-based statement |
| 7.9 tower headline | m=0,1,6 | m=0 and n≥1 gives x^0=1 for all x, adjoining ℂ; m=1 gives ℚ. For m=6 the union contains ζ₄ and ζ₉ since 4,9 divide 6² | Retain m≥1 and full fixed tower |
| 7.9 Tamagawa headline | O rank one, z=p⁻¹ | Fractional index [O:z]=1/#(O/pO)<1 while #H²≥1; integrality of z is essential to the asserted bound | Retain integral hypotheses |
| R06 extra operator Check | T′=2id,S′=0,σ=id,ℓ=3 | Correct 1↦−1; wrong plus sign 1↦3 | Add README Check only |

For the §4.7 finite computation, use generators S=(0,1;−1,0), U=(1,1;0,1), D=(−1,0;0,1), modulo 4. A cocycle takes values f(S)=(0,0), f(U)=(0,2), f(D)=(2,2). Extending by f(gh)=f(g)+g f(h) gives all 96 group elements consistently. After dividing values by 4 and inflating to GL₂(ℤ₂), a coboundary vector v in (ℚ₂/ℤ₂)² would satisfy (S−1)v=0, hence v=(a,a), 2a=0. But (U−1)v=(a,0) cannot equal (0,1/2). This also checks the continuous nonvanishing assertion left uncomputed in the prior round.

### Headline inventory and Lean acceptance test

The README's headline results are the canonical zeta morphism (§5.1), twist-one and parabolic characterizations (§§5.4, 5.6), noncritical regulator equality (§6.4), canonical non-torsion and cohomological upper bound (§§7.1–7.2), cyclotomic finite generation and classical finiteness (§7.3), ordinary/multiplicative divisibility (§7.4), absence of finite submodules (§7.6), rank-zero p-primary bound (§7.8), and §7.9's Bloch–Kato finiteness, modular-abelian Selmer/Mordell–Weil finiteness, cyclotomic finite generation and Tamagawa bound. The finite-index comparison, critical reciprocity and parabolic cohomology (§§5.2, 5.3, 5.5), and trivial-character control (§7.7), supply the constructions and proofs of those headlines; their carriers have the same exclusions.

The two elliptic Mordell–Weil headlines statable at these pins are present. Their one simple definition is the genuine integral annihilator subset of the native elliptic point group. The unavailable constructions are covered by the module docstring's grouped carrier exclusions at lines 14–26: Iwasawa and modular Galois realizations, the constructed zeta class and analytic p-adic L-function, the p-primary Selmer module, modular abelian varieties, and the topological elliptic Galois module. This review found no missing statable headline and no replacement theorem built from a free predicate.

Elaboration was run from the pinned content checkout with lake env lean and the absolute path supplied by the job. Exit status 0; exactly two warnings, both “declaration uses sorry,” at Suggested.lean:36 and :60. The Tau Ceti import's object file was available; no build was needed. A separate scratch copy with #check @ for all three declarations elaborated in one run. The resulting types retain W.IsElliptic, m≥1 for the tower theorem, and Field, DecidableEq, Algebra, NeZero m, IsCyclotomicExtension, χ, differentiability, continuation and F(1)≠0 for the character theorem. There is no lost section binder and no README/signature mismatch.

A scratch one-tactic probe using simp, rfl and infer_instance did not close either headline. Direct inspection found no single pinned theorem furnishing either conclusion; the native finite-point theorem concerns finite fields, not these fields. Neither headline is a definition restatement or a boundary case. The m=1 specialization remains only a README Check. No padding finding is made.

Imports are one import Mathlib and the used individual Tau Ceti Galois-action module. There is one real-bodied noncomputable definition, two sorried theorems, no sorried data, no set_option, no admitted examples and no foreign-roadmap imports.

### Pinned library declarations opened

Mathlib pin: 6b7abb3c7686292736be2955bd3eb9ebf63b456a. Tau Ceti pin: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. These are the revisions in the content lake-manifest.json.

| Native object | File and line at the pin | What its definition supplies or does not supply |
|---|---|---|
| WeierstrassCurve.pointGaloisAction | TauCeti/AlgebraicGeometry/EllipticCurve/Affine/Point/Galois.lean:47 | Coordinate action on actual elliptic points over a field extension; it does not itself supply the topological Galois representation needed for Sha. |
| IsCyclotomicExtension | Mathlib/NumberTheory/Cyclotomic/Basic.lean:74 | Primitive roots and generation by roots of unity; the theorem separately imposes characteristic-zero base, field and m≠0. |
| IsCyclotomicExtension.autEquivPow | Mathlib/NumberTheory/Cyclotomic/Gal.lean:77 | Automorphism maps a chosen primitive root to its exponent power, agreeing with σ_aζ=ζ^a. |
| Polynomial.cyclotomic.irreducible_rat | Mathlib/RingTheory/Polynomial/Cyclotomic/Roots.lean:190 | Irreducibility needs 0<n; supplied by NeZero m in the headline. |
| MonoidAlgebra.lift | Mathlib/Algebra/MonoidAlgebra/Basic.lean:232, coefficient formula :239 | Ring evaluation of the actual group algebra, with its finite coefficient sum. No division by the group order. |
| WeierstrassCurve.localPolynomial, LFunction, LSeries | Mathlib/AlgebraicGeometry/EllipticCurve/LFunction.lean:44, :79, :84 | Minimal local factors and the associated formal coefficients/total Dirichlet series. The theorem supplies an entire continuation explicitly. |
| ContinuousCohomology.tateShafarevich | Mathlib/RepresentationTheory/Homological/ContCohomology/Sha.lean:71 | Intersection of localization kernels for a supplied TopRep and maps. The elliptic E(ℚ̄) instance is not supplied by this definition. |
| WeierstrassCurve.Affine.selmerGroup₂ | TauCeti/AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean:104 | Norm-kernel square classes with local conditions, under the displayed field/Dedekind hypotheses. It is not p^∞-Selmer. |
| eisSummand and eisensteinSeries | Mathlib/NumberTheory/ModularForms/EisensteinSeries/Defs.lean:183, :202 | Integer-pair summand and primitive congruence-class sum; no hidden N^k normalization. |
| ModularForm.eisensteinSeriesMF | Mathlib/NumberTheory/ModularForms/EisensteinSeries/Basic.lean:35 | Packages that normalized primitive series as a modular form; does not identify it with Kato's shifted sum without the comparison of R04. |

Object searches also covered the Iwasawa/Selmer/Kato carriers, not just these proposed theorem names. The pins do not provide the constructed Kato classes or the elliptic p-primary Iwasawa Selmer module used by the omitted headlines.

### Ownership and supplier order

The board package index was read before the absence searches. Ownership searches used roadmaps grep over the current open heads and main, plus the board packages and pinned libraries. They included theta and Siegel units, K₂ transfer/Chern classes, literal-dual moments, Kato zeta morphisms, Perrin-Riou and Coleman maps, cyclotomic finite generation, integral character annihilators and finite support. No second declaration with any of this package's three fully qualified Lean names was found.

The ownership split is substantive: PadicFamilies §4.0.1 constructs geometric zeta classes and §4.0.3 bounds their span; this package constructs the canonical morphism and relates its span to those classes. CompletedCohomologyAndLocalGlobalCompatibility §2.6 supplies the moment map, whose integral existence is distinct from its rational isomorphism. PadicHodgeRegulators supplies the regulator infrastructure; §§6.1–6.4 specialize and normalize it on the Kato classes. The character tensor quotient in EulerSystemsCyclotomicMainConjecture differs from this package's integral annihilator subset. NoncommutativeAndEquivariantIwasawa §7.9 and PeriodsAndSpecialValues Layer PS.5 concern determinant zeta-isomorphism predicates, not this rank-two geometric construction.

The current ModularIwasawaMainConjectures head, README:91–97 and :423–464, consumes KatoEulerSystems and declares its additional extension contracts. Those are downstream contracts, not reverse suppliers to this package. No dependency was introduced on them. Serre's elliptic open-image target here is earlier than the later imaginary-quadratic modularity use; no earlier owner of this exact target was found in the searches.

Every named supplier section and every Needs line was checked again this round. The following is the resolution record; paths in this table are under TauCetiRoadmap/<supplier>/README.md. Section numbers refer to main where the roadmap already exists, and to the supplied current new-roadmap head otherwise.

| Supplier | Resolved sections/targets consumed | Opened location anchors and result |
|---|---|---|
| PadicFamilies | §§4.0.1–4.0.3 | :2353, :2369, :2382; geometric classes, explicit reciprocity and geometric bounds are present. |
| ModularCurves | §§0A,2A,2D,2E,5B | :238, :601, :751, :831, :1313; level moduli, actions and curve foundations present. |
| ModularCurvesPartII | §§3.13–3.15; 4.5,4.8; 5.8,5.11–5.12,5.15–5.16; 6.1–6.3; 8.1–8.5; 9.1–9.2,9.12; 14.1–14.4,14.8–14.9a,14.11–14.12; 16.2 | :1314, :1515, :1961, :2253, :2590, :2726, :3741, :4418. Tate charts are in §5.11; quotient flatness and coefficient restrictions were retained. |
| SchemeKTheoryOperations | §§2.2–2.4,3.6,6.1 | :443, :499, :547, :820, :1627; products, transfers and projection formula present. |
| K2SymbolsBrauer | §§6.4,6.7–6.9,8.1 | :900, :961, :975, :989, :1307; ordered symbol/Chern normalization checked, including its normalization correction. |
| ModularForms | Layers 0,7,9 | :259, :708, :971; Eisenstein and newform L-function inputs present. Integer-lattice normalization still requires R04 here. |
| AutomorphicGaloisRepresentations | §§1.2,1.5–1.6,4.5,4.8,5.1–5.2,6.1,7.2–7.3,7.5 | :1005, :1095, :1190, :1916, :1971, :2310, :2367, :2441, :2918–2959. §5.2 explicitly requires the coefficient extension omitted here, R02. |
| SelmerIwasawaCohomology | §§0.7–0.11; 2.7–2.8a,2.12–2.12a,2.15,2.19–2.21; 3.0–3.3,3.5–3.7,3.9–3.11,3.13,3.15,3.18–3.21; 4.9,4.26 | :211–267, :492–546, :645–845, :1317–1641, :1773–1833, :1907, :2323. The §3.7 finite-coefficient restriction is the concrete supplier mismatch in R01. |
| EulerSystemsAndKolyvaginSystems | §§2.1,2.2,2.4–2.5,4.3,4.17,8.2–8.3,8.6–8.7,8.16,8.37–8.39 | :1598, :1657, :2789, :3257, :4544, :4719, :5114, :5812–5848; carrier, bounds and normalization adapters present. |
| ArithmeticGaloisDuality | R02.1.2, R02.2.1–R02.2.3, R02.4.2–R02.4.4, D7.3–D7.4 | :554, :1126–1327, :3005–3393, :4910, :5220; finite coefficients, compact Shapiro and duality domains checked. |
| PadicMeasuresIwasawaAlgebras | §§4.1–4.6 | :2361, :2409, :2485, :2530, :2620, :2710; full cyclotomic components, pseudo-null and characteristic-ideal inputs present. |
| PadicHodgeRegulators | §§1.4,1.7,1.11,8.8,8.13–8.16,8.18,8.20–8.22,9.31–9.36 | :507, :556, :623, :1697, :1786–1933, :2435–2521; general regulator and actual elliptic Coleman domains checked. No use of an odd-prime Coleman theorem at two. |
| ModularSymbolsPadicLFunctions | §§0.2,0.7–0.8,1.1–1.3,2.5,3.0,3.2–3.3 | :473, :1064, :1210, :1303–1461, :1742, :1849, :2158, :2183; period dictionary exists; §3.2's coordinate needs the transport in R03. |
| CompletedCohomologyAndLocalGlobalCompatibility | §2.6 | :828–848; integral moment map, rational isomorphism, literal dual. |
| EllipticCurveModularity | R29.4–R29.6 | :1249, :1464, :1598, especially :1793–1809; full Tate realization, isogeny and unconditional modularity. |
| EllipticCurves | Layers 1,4,4.5b,6,7 | :1013 and :1303–1318 for local minimal differential and total real period; main copy checked. |
| HeightsRationalPointsAndObstructions | §1.7 | :614; Mordell–Weil finite generation for abelian varieties over number fields. |
| AutomorphicLFunctionsAndLocalFactors | AL.3, boundary nonvanishing | :2261; unitary boundary Re(s)≥1 retained. |
| GL2AutomorphicRepresentationsAndTransfer | R16.5.3 | :1171; shift by (k−1)/2 checked before applying boundary nonvanishing. |

The citation resolver returned no missing cross-roadmap citations or Lean-name leads. It reported its external-library scan unavailable, so that part was not used as evidence; pinned files were opened directly as above.

Dependency-check output, verbatim:

    depcheck: 52 roadmaps, 597 edges, 0 problem(s)

There was no UPWARD, CYCLE or moved line. No gaps are declared in the package's plan/README; no conditional-gap acceptance is asserted. No ownership cycle, replanning, duplicate carrier, computational-algorithm target, route-specific good-prime shortcut, source copying or untrusted instruction was identified. Main-roadmap shape was compared with ModularForms, EllipticCurves and PadicMeasuresIwasawaAlgebras. The package has the requested sections and layer endings; R06 records the remaining definition-API/Check defect.

## Not verifiable

- Rohrlich1984, Rohrlich1988, Ribet1980, PerrinRiou1990, PerrinRiou1994, Schneider1985, BlochKato1990 and DiamondShurman2005 remain settled uncertified texts. Their recorded locators were retained; their inaccessible contents were not guessed. FontaineMessing1987 remains waived. JacquetShalika1976 has a settled manifest entry but is not used as a new body citation. No text was requested again.
- Nakamura2023 was read in the cached arXiv v2, the version expressly cited by this package. Published-version numbering was not independently checked or substituted.
- The exact sign typography in Kato2004 line 5913, Theorem 16.2(i), is garbled in the extraction. The package's sign was cross-checked using the explicit §12.5 convention and the character dictionary, but this particular printed display was not independently certified.
- The additional Betti scalar (2πi)^(1−k) in §5.4 remains uncertified as a comparison with Nakamura's Appendix A notation. Lemma A.3 and Definition A.4 (Nakamura2023 lines 3814–3836) certify the twists; Corollary A.5 (lines 3840–3852) suppresses the Betti identification needed to settle that scalar. The full-level factor in (17)/(20) is explicit and was checked separately. This limitation from the previous round is not silently treated as a verified equality.
- Some Kato display typography in the OCR is degraded, particularly the multi-line period formula. The readable prose, branch definitions and independent numerical checks above support the recorded checks; they do not constitute a fresh transcription certification of every symbol in those damaged displays.

All checks not depending on these limitations were completed. No new source fetch or manifest mutation was required, and there is no new missing-text request.

## Source issues

- **Misprint** in Kato2004 at §1.9, printed p. 124: the source says the last contribution to the q-exponent is linear in a; it should be a²/(2N²), giving B₂(a/N)/2; affects nothing.
- **Error** in Kato2004 at Remark 12.8, (12.8.2), printed p. 223: the source says every coefficient place of a non-CM form has an open SL₂ subgroup in its image; it should restrict this conclusion to split places of Momose's quaternion algebra; affects a stated result.
- **Misprint** in Kato2004 at Theorem 16.4(ii), printed p. 270: the source says the auxiliary vector is in the crystalline space of the modular form's representation; it should lie in D_crys(V*(1)), like η; affects nothing.
- **Misprint** in Kato2004 at Theorem 12.5(4), printed p. 222: the source says the displayed length inequality uses rational coefficient modules; it should use H²(T) and H¹(T)/Z(f,T) for the integral assertion, as in §13.14; affects a stated result.
- **Misprint** in Kato2004 at Theorem 14.5(3), printed p. 236: the source says condition (12.5.1) from Theorem 12.5(4) is required; it should refer to the integral image condition (12.5.2); affects nothing.
- **Error** in Rubin2000 at Proposition III.5.1 and proof, draft p. 48: the source says the formal logarithm sends E₁(ℚ_p) onto pℤ_p without a dyadic restriction; it should exclude p=2 or use the actual logarithm lattice, which is 4ℤ₂ for y²+xy=x³+1; affects a stated result.
- **Misprint** in Nakamura2023 at proof of Corollary 3.6, arXiv v2 p. 48: the source says uniqueness follows using Lemma 3.4(1); it should invoke the injectivity statement in Lemma 3.4(2); affects nothing.
- **Misprint** in Nakamura2023 at proof of Theorem 5.2, arXiv v2 pp. 75–76: the source says the stronger integral result is Kato Theorem 12.4(4); it should refer to Kato Theorem 12.5(4); affects nothing.
- **Misprint** in Nakamura2023 at Appendix A, conductor-n smoothing display, arXiv v2 p. 87: the source says the second smoothing factor starts with d; it should start with d², consistently with conductor one and the geometric construction; affects a stated result.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "05901946c882bb9eded68437430f6036a53b31d3", "job": "REV-PKG-KatoEulerSystems~4", "model": "gpt-6-astra", "worker": "chris-30"} -->
