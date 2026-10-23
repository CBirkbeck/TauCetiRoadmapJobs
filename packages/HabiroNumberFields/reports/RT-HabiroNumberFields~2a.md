<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/155#issuecomment-6362089775 -->
Red team round 2 pass a (codex) of da336a9

Verdict: needs_changes

1. **F01** (P2) The arithmetic gap includes targets already supplied

   **Location:** `packages/HabiroNumberFields/README.md:47`: “global finiteness of K₂(O_F), Tate invariants w_r(F)”; “the Keune injection”. Also `packages/HabiroNumberFields/design/plan.json:10`.

   **Claim:** These are missing inputs to be supplied through gap:arithmetic-k-inputs.

   **Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md:957` (§3.4), `:1179` (§4.1), and `:2729` (§6.13) already own these targets. Section 6.13 explicitly converts its tensor coinvariants to σb−χ(σ)⁻¹b and allows every odd p.

   **Exact repair text:** “Import finiteness of K₂(O_F) from ArithmeticKTheory §3.4, Tate invariants from §§4.1–4.4, and cyclotomicPicardInjection with its inverse-character identification from §6.13. Use these supplied results in §§0.2–0.7.” Delete the clauses asking for finiteness of K₂(O_F), Tate invariants, and the Keune injection from the README and plan gap needs, retaining only the separately specified unsupplied comparison/compatibility contracts. Also import the odd-primary K₃ structure from §5.3 rather than requesting that structure again. Any residual gap sentence must name its actual coefficient or restriction diagram, not repeat these supplied theorems. At F=ℚ, p=5, χ(σ)=2, the supplier's relation 2σb−b gives σb=3b, exactly the required inverse weight.

   **Earlier disposition:** The absence of the three suppliers is not re-raised. The newly supplied ArithmeticKTheory head makes part of the registered gap nonminimal. The round-one F02 remedy remains valid for genuinely missing contracts.

2. **F02** (P2) The Bott construction already has an earlier owner

   **Location:** `packages/HabiroNumberFields/README.md:319`: “construct `bott ζ ∈ K₂(B;ℤ/N)` from the positive root cycle”.

   **Claim:** Construction, Bockstein, root scaling and naturality of this coefficient Bott class are targets here.

   **Witness:** `TauCetiRoadmap/KTheoryFiniteLocalFields/README.md:216`, §1.2, constructs the Moore-space Bott class, fixes ∂β=[ζ], and gives root changes and naturality, without assuming N invertible. Its §1.8 supplies the Chern comparison.

   **Exact repair text:** “Import the coefficient Bott class and its Bockstein, root-change and naturality laws from KTheoryFiniteLocalFields §1.2, and its Chern normalization from §1.8. For a noncommutative B, transport the class from ℤ[C_N] by t↦ζ. Prove that the positive bar-cycle comparison above yields this supplied class.” Keep the positive-chain comparison as the new target; remove the second construction. For B=ℤ[ζ₃], N=3, the imported class already exists before inverting 3 and has Bockstein [ζ₃].

3. **F03** (P2) A nontrivial root need not have a nonzero K₁ class

   **Location:** `packages/HabiroNumberFields/README.md:319`: “For a ring containing primitive ζ_N”; `:324`: “For nontrivial ζ, ∂bott=ζ rules out a lift from K₂(B)/N”.

   **Claim:** A nontrivial root always gives a nonzero Bockstein, so its Bott class cannot come from integral K₂/N.

   **Witness:** Let B=M₃(ℚ(ζ₃)) and ζ=ζ₃I. This central unit has order three, but its K₁ class has determinant ζ₃³=1. The Bockstein is zero; coefficient exactness places every such lift in the integral image.

   **Exact repair text:** “The Bockstein is [ζ]∈K₁(B). A lift from K₂(B)/N is excluded only when [ζ]≠0. For commutative B, determinant makes this follow from ζ≠1; the étale Chern assertion additionally requires B commutative and N invertible.” Retain the general Bott construction through functoriality. Add the matrix-ring negative control: [ζ₃I]=0 and an integral lift exists, whereas for B=ℚ(ζ₃), [ζ₃]≠0 and none exists.

4. **F04** (P3) The cubic nontriviality Check has no fixed power-class field

   **Location:** `packages/HabiroNumberFields/README.md:198`: “At n=3 and x=1 the cube power class is ζ, not 1.”

   **Claim:** The order-three normalization has a nontrivial cubic class under the stated field generality.

   **Witness:** In B=ℚ(ζ₉), choose ζ=ζ₉³. Then D_ζ(1)=ζ(1−ζ)³=(ζ₉(1−ζ))³, so both [D_ζ(1)] and [ζ] equal 1.

   **Exact repair text:** “In ℚ(ζ₃)ˣ/(ℚ(ζ₃)ˣ)³, D_ζ₃(1)=ζ₃(1−ζ₃)³ has nontrivial class [ζ₃]. After extension to ℚ(ζ₉), that class becomes trivial.” Apply the same ambient-field qualification to the nontriviality assertion at README:264. The identity of classes remains general; only the nontriviality Check is scoped. The displayed cube verifies the negative control.

5. **F05** (P3) The order-five eta Check depends on the primitive root

   **Location:** `packages/HabiroNumberFields/README.md:311`: “At n=5 it is `[∞]+2[0]+2[−φ]`, φ=(1+√5)/2.”

   **Claim:** This is the displayed eta sum for the arbitrary primitive ζ of §1.7.

   **Witness:** For ζ=exp(4πi/5), each k=±2 term is 1−(sin(4π/5)/sin(8π/5))²=1/φ, not −φ. The source formula changes by the root action.

   **Exact repair text:** “For ζ=exp(2πi/5), the sum is [∞]+2[0]+2[−φ]. For ζ², it is [∞]+2[0]+2[1/φ]; its Bloch class is 4η(ζ) modulo five.” The two numerical arguments are −(1+√5)/2 and (√5−1)/2, respectively. Keep both as the root-scaling Check.

6. **F06** (P1) The residue field 𝔽₂ is outside the declared Bloch contract

   **Location:** `packages/HabiroNumberFields/README.md:41`: “for fields with at least four elements”; `:369`: “for every prime ℓ≡−1 mod n”.

   **Claim:** The supplied finite-field Bloch calculation and reduction comparison support every local regulator isomorphism of §§1.11–1.12.

   **Witness:** F=ℚ, n=3, ℓ=2 satisfies every local hypothesis, including v₃(ℓ+1)=1. Its residue field has two elements. CGZ line 1048 explicitly assumes an odd residue prime; the declared ≥4 supplier contract also excludes this case.

   **Exact repair text:** “The finite-field part of gap:bloch-foundations includes 𝔽₂: supply B_old(𝔽₂)/3≃ℤ/3 with generator [0], its positive cyclic/K₃ comparison, and the reduction square at residue characteristic two. The configuration results requiring at least four field elements keep that separate hypothesis.” Add this precise exceptional contract to the matching plan needs, and consume it in §§1.11–1.12. Retain the all-prime theorem. Add the Check: “In 𝔽₄, ζ²+ζ+1=0 gives D_ζ(1)=ζ and R_ζ([0])=ζ²; cubes in 𝔽₄ˣ are {1}, so this map is nonzero and hence an isomorphism of groups of order three.”

   Re-raised: F02 (review a), only its missing small-finite-field comparison. Registration repairs the general ownership problem, but its ≥4 qualification does not cover this actual input. No absence of a declared, in-scope supplier result is being reported.

7. **F07** (P2) Completed Frobenius is already supplied by QWittVectors

   **Location:** `packages/HabiroNumberFields/README.md:442`: “For existence, lift the p-power map … by formal smoothness”; also the ownership claims at :11 and :59.

   **Claim:** Constructing the semilocal unramified Frobenius, its uniqueness, bijectivity and field naturality is new work here.

   **Witness:** `TauCetiRoadmap/QWittVectors/README.md:789`, §6.1, supplies exactly the unique continuous completed Frobenius for étale R over a perfectly covered Λ-ring, its invertible linearization and naturality. Specialize A=ℤ, R=O_K[1/Δ]. QWittVectors is earlier in the supplied order.

   **Exact repair text:** “Import completed Frobenius, uniqueness, bijectivity and naturality from QWittVectors §6.1 with A=ℤ and R=O_K[1/Δ]. Identify its factors with Tau Ceti's local Frobenius and deduce order lcm_(v∣p) f_v. Define the two extensions to the full cyclotomic algebra from this supplied automorphism.” Remove the duplicate lifting proof and amend the supplier/ownership paragraphs. At K=ℚ(i), p=3 this gives i↦−i; at p=5 it gives identity on both ℤ₅ factors; at an inverted p it gives the sole endomorphism of zero. These are exactly the existing Checks, with all factors retained.

8. **F08** (P3) The local intersection target precedes its image theorem

   **Location:** `packages/HabiroNumberFields/README.md:490`: “each p-adic untwist belongs to the classical all-order local Taylor image”.

   **Claim:** The intersection characterization is part of §2.5, whose listed inputs are §2.4 and convergent re-expansion.

   **Witness:** README:519–521 only establishes that classical image in §2.7, using seed reconstruction from §2.5. The earlier generic re-expansion contract gives compatibility, not this arithmetic image equivalence.

   **Exact repair text:** Move the intersection-characterization paragraph from §2.5 to immediately after §2.7's untwistedTaylorImage_iff and add: “Needs: §2.5's seed reconstruction and untwisting, §2.7's all-order image theorem, and coefficient intersection in the full cyclotomic basis.” Keep only seed reconstruction and untwisting in the early §2.5. At p=2, the seed equal to one at order1 and zero at the other odd orders first reconstructs a glued family; §2.7 then identifies it with a classical completion element; the intersection theorem can now use that identification without a forward input.

9. **F09** (P2) Picard eigen-obstruction vanishing is already an exported corollary

   **Location:** `packages/HabiroNumberFields/README.md:117`: “Apply the finite criterion … to prove picardEigenObstruction_vanishes”.

   **Claim:** Vanishing of the χ⁻¹ part of Pic(O_(Fζ_(pᵃ))[1/p])[pᵃ], under the stated K₂ coprimality, is a new arithmetic theorem here.

   **Witness:** `TauCetiRoadmap/ArithmeticKTheory/README.md:2767`–:2773 explicitly proves that invariant-vanishing corollary under p∤|K₂(O_F)|, following the identical inverse-character quotient at :2759. Its scope even permits ramified odd p.

   **Exact repair text:** “Import the χ⁻¹ Picard invariant-vanishing corollary from ArithmeticKTheory §6.13 under p∤|K₂(O_F)|, and use it in §0.6's eigenclass lift. The elementary finite-endomorphism argument is background explaining why quotient vanishing suffices, not a second construction of that arithmetic corollary.” Remove picardEigenObstruction_vanishes as a new target and replace its downstream references with the supplier section. At p=5, χ(σ)=2, the supplied diagonal twist is 2·3=1 on the inverse-character component; its zero coinvariants force that component to be zero. At p=3,a=2 the p-part argument avoids dividing by |G|=6, as required here.

## Earlier-finding verification

All quotations in this table are from the repaired head. “Repaired” evaluates the earlier defect, not the unproved roadmap theorem. No old request to add acceptance padding is carried forward.

| Earlier finding | Status; repaired passage | Witness at this head |
|---|---|---|
| a F01 nonlinear global definition | Repaired. README:708: “its **entire** p-adic image equals E_(p,ξ) of that restriction”; :712: “no converse or alternative membership criterion is asserted”. | The old f₂=−1, other f_m=1 witness fails the explicit 2→10 equation −1=1. Addition is now in a linear equalizer. §§3.7,3.9,3.10,3.14,3.19 use this datum. The new extension/descent theorems are not proved by this repair; their limitations are recorded below. |
| a F02 undeclared suppliers | Partly repaired; settled conditional contracts remain accepted. README:41,47,55 now each say “must provide (gap:…)”, matching all three plan slugs. | Matching registration removes the old general absence finding. S01 records already-owned arithmetic inputs; S06 identifies the specific 𝔽₂ input outside the new contract. The latter is expressly re-raised with its reason. |
| a F03 reciprocal Bloch dependency | Repaired. README:864: “the finite-coefficient étale Bloch and regulator comparisons are owned by §§1.6 and 1.13 here”. | K3BlochGroups supplies foundations only, and the plan explicitly requires their independence from these comparisons. No reverse Needs edge remains; depcheck has zero problems. |
| a F04 missing finite-endomorphism milestone | Repaired differently. README:115: “if A is a finite abelian group … A=f(A)+nA, then ker(f)∩A[n]=0, including n=0”. | The theorem remains in the README, outside the declared headline list. For A=ℤ/9,f=2,n=9 the kernel is {0}; for A=ℚ/ℤ,f=3,n=3 it is C₃. The binding acceptance-test rule does not require this auxiliary finite-group signature. |
| a F05 missing two Lean names | Repaired. README:185 names cyclicDilog_quasiPeriodicity; :193 names cyclicDilog_one_pow_twentyFour. | Both exact names occur at Suggested.lean:43,50, with the same field/order/root hypotheses. |
| a F06 terminal catalogue | Repaired. Suggested.lean:6: “The roadmap is README.md; this file is not the roadmap.” Lines 11–17 name omitted headlines and missing carriers. | All 84 lines read: no terminal catalogue, empty layer, orphan definition or example remains. |
| a F07 missing source manifest | Repaired. sources.toml:1: schema “tauceti-roadmap-sources/v1”. | Eight keys record eight works, with both CGZ versions under CGZ. Published and preprint hashes differ and match the cached versions read. The source-service retrieval of the published copy succeeded in this pass. |
| a F08 missing Lean mirrors of Checks | Repaired differently. README:216: “n=0 gives zero and n=1 gives one”; :219 explicitly gives the singular total sum 1 versus geometric sum 2. | Boundary calculations remain prose; six elementary Lean examples and the unused half-shift definition were removed. This follows the binding no-padding rule. |
| a F09 Pochhammer residue sign | Repaired. README:627: “its residue is −p Li₂^(p)(ζ)”. | The t coefficient is −p/x. For p=5, ζ³=1, the depleted value mod5 is 1+2ζ≠0, so ± residues differ mod25. README:649 propagates the cancellation −pLi₂^(p)/(m²h)+pLi₂^(p)/(m²h)=0. |
| a F10 too few Checks for grouped definitions | Repaired. README:481–483 gives γ=1, γ=2 and the retained-edge criterion; :536 gives “a becomes −ζ₃a”; :537–540 lists N=0,1,2,4. | γ=2 removes 1→2; (−ζ₃⁻¹)(−ζ₃a)=a; weighted sets are ∅,∅,{(1,0)}, and the five listed pairs. These discriminate the relevant omissions and inequality direction. |
| a F11 étale Bloch locator | Repaired. README:295: “Theorem 1.7 … Definition 6.1 and (35)–(38)”. | CGZ lines 218 and 1439–1519 contain the exact sequence and cohomological construction; line699 is correctly separated as regulator factorization. |
| a F12 eta outside good-order comparison | Repaired. README:381: “finiteRegulator_compare_eta … with no coprimality assumption on M_F₀”. | The eta equality is now its own target, before scalar reading. At n=5, disc(F₀)=5 still violates the ordinary-unit premise; the new proof instead uses reduction injective on ⟨ζ₅⟩ at ℓ=19. At149 the reduced root class is1, as the negative control says. |
| b F01 odd-only KMS | Repaired. README:224: “n≥1 invertible in B”; Suggested.lean:71–74 has 0<n and no parity premise. | 8,238 independently computed admissible KMS triples pass, including even n and characteristics2 and3. The n=2 quadratic example gives the stated common value. |
| b F02 unowned radial asymptotic | Repaired. README:239: “Prove pochhammer_rootOfUnity_asymptotic”; :241: “This leading-term target is owned here”. | The q-series supplier now supplies only its actual annulus/summation/eta targets. The repaired −n/2 exponent is correct: at n=1,x=−1 normalized products approach1/√2, not√2. |
| b F03 supplier stage labels | Repaired for the cited available owners. README:43 names StableHomotopyKTheory §§7.2–7.4,7.33 and GeneralAlgebraicKTheory §§2.1–2.4,3.2,7.4–7.8; :51,59,62 give numbered contracts. | These sections were resolved and read at the available main/open copies. The three explicit gaps use descriptive sections rather than claiming nonexistent target numbers. S01 concerns unnecessary gap contents, not an obsolete stage label. |
| b F04 temporal library qualifiers | Repaired. README:13: “Tau Ceti also supplies the Kummer isomorphism”; :442 names TauCeti.frobeniusAlgEquiv. | No “current”/“pinned” timing qualifiers remain in the README. Actual pin files supply Kummer, inner conjugation and local Frobenius with the hypotheses recorded below. |
| b F05 lost CharZero binder | Repaired. README:658: “For a field define … using total field division”; the unused Lean definition is absent. | H(z,r)=0 in characteristics2 and3 and at r=0 or z=1. The asymptotic use explicitly excludes those values; none of the six remaining signatures loses a required binder. |

## Verified sound

Read all 877 README lines, all 84 Suggested.lean lines, all 17 earlier findings, the complete repair report, both repository rule files, the manifest and design. The inventory below covers all 54 numbered target sections and their definitions, theorem paragraphs and conventions; this README uses bold emphasis and bold “Checks”, rather than bold target headings. All six Lean declarations were compared with the supplied elaborated signatures. Four are headline theorems, two are real definitions used by them. No declaration lost a binder, and no new Lean elaboration or build was run. The supplied signature extraction is evidence about types, not proofs.

The tables record computed instances, not proofs of universal assertions. “Retain” means these instances did not refute the statement. “Conditional” marks computations on the supplied mathematical model or a stated descent contract; it does not certify construction of that model. Results requiring missing declared contracts remain conditional. Counts: 6 Lean declarations; 113 README target/convention rows spanning all 54 numbered sections; 26 source-locator groups verified; 232 Check bullets read, with computed instances or countermodels for 231 and the configuration-map Check left conditional; 10 supplier citation groups resolved and 24 named sibling heads searched. Every Check block contains at least three bullets. These are instance-test counts, not claims that the roadmap theorems have been proved.

### Lean declaration inventory and one-tactic probe

Here `u` is arbitrary; no declaration silently specializes to characteristic zero. Sections are CyclicDilog for the first definition and FiniteIdentities for the other five. All are in namespace TauCetiRoadmap.HabiroNumberFields, Layer 1. The six fully qualified names have no second declaration in the searched roadmaps or pins.

| Declaration; README section | Complete variable/instance context | Computed instances and values | Result/change |
|---|---|---|---|
| cyclicDilog, Suggested.lean:33; §1.1 | `{R : Type u} [CommRing R]`, n:ℕ, ζ,x:R | n=0,1: empty/asymmetric product=1; n=2,ζ=−1: 1+x; x=0:1; zero ring:1=0; ℤ[e]/e², n=2,ζ=−1,x=e:1+e | Native body, necessary to four identities; retain. |
| cyclicDilog_quasiPeriodicity, :43; §1.1 | `{K : Type u} [Field K]`, n,s:ℕ, ζ,x:K; n>0, primitive n-th root, s≤n | n=2,s=1,ζ=−1,x=2: (1−4)(1−2)=3; (1+2)(1−2)²=3. s=0: D=D. x=1,s=1:0=0. 2,095 finite-field instances | Retain. Not a definitional equality or one pinned library lemma. |
| cyclicDilog_one_pow_twentyFour, :50; §1.1 | Field context; n>0, primitive ζ, (n:K)≠0 | n=1:1=1; n=2:D(1)=2, 2²⁴=2²⁴; n=3:D(1)²=−27ζ², hence D²⁴=3³⁶; all n=1,…,16 remainder zero mod Φ_n | Retain. The exponent law is a substantive phase theorem, not a small-value Check. |
| cyclicHypergeom, :56; §1.2 | Field context; n:ℕ, ζ,x,y,z:K; no hidden root or nonzero conditions | n=0:0; n=1:1; n=2,ζ=−1,(2,3,5):1+4·5/3=23/3; x=y=−1,z=1:1+0/0=1, versus geometric sum2 | Necessary native finite sum; retain. Singular values are intentionally total. |
| cyclicHypergeom_shift, :62; §1.2 | Field context; n>0, primitive ζ, xⁿ≠1,yⁿ≠1, (1−yⁿ)zⁿ=1−xⁿ | n=1,(x,y,z)=(2,3,1/2):1/2=2−3/2. n=3,x=y=0,z=ζ: f=0 and both sides0. 18,425 finite-field instances | Retain. Denominator guards imply all finite denominators nonzero. |
| kms, :71; §1.3 | Field context; n>0,(n:K)≠0, primitive ζ; x,y,z≠0; xⁿ,yⁿ≠1; xⁿ≠yⁿ; hypersurface equation | n=1:1=1; n=2,ζ=−1,(x,y,z)=(1/2,1/3,3√6/8): both −2/9−4√6/27; 8,238 finite-field instances, including 358 in characteristic2 and 496 in characteristic3 | Retain. No parity restriction, arbitrary field embedding or hypothesis containing the conclusion. |

The one-tactic probe found no padding among the four theorems. The definitions are used by the headline statements. No `example`, sorry'd data, free proposition field, imported roadmap module, `lemma`, `set_option`, or type-only substitute occurs. The single import is Mathlib; each theorem ends in sorry. Boundary computations stay in the README.

The README headlines are the four finite identities; the ordinary-unit Chern theorem (§0.9); regulator/Chern comparison (§§1.13–1.14); arithmetic/classical Habiro comparison (§2.9); local freeness (§3.6); effective descent (§3.10); tensor equivalences and Picard character (§3.11); field scalar equivalence (§3.16); and multiplicative transfer (§3.19). Suggested.lean:11–17 names the omitted classes and missing K-theory, Bloch, completion, root-line and module carriers, plus the analytic proof-route carriers. Pin searches found no native implementations of those particular missing constructions. Picard groups alone do not make the indexed lines statable. No statable missing headline was identified.

### Computed conventions and target inventory

References in the first column are to `packages/HabiroNumberFields/README.md`. For definitions the listed valid and invalid models also test whether their laws determine the intended object. All arithmetic fields are characteristic zero unless another field is explicitly named. Number fields exclude the zero ring and inseparable extensions; the finite-identity definitions and local zero completions are tested separately.

| Statement/location | Instances tried; computed values on the two sides | Result/change |
|---|---|---|
| Conventions: completion versus tensor, :19 | R=ℤ[1/6],p=3: every R/3ᵃ=0, inverse limit0; R⊗ℤ₃=ℚ₃≠0. For p=5 both completion and tensor are ℤ₅ | Retain. |
| Full cyclotomic algebra, :21 | K=ℚ(i),m=4: K⊗ℚ(i)=K×K, dimension2 over K; chosen compositum has dimension1. Zero coefficient ring gives zero algebra | Retain full tensor. |
| Power classes, χ and Kummer sign, :23 | n=5,χ(σ)=2: χ⁻¹=3, not2. For αⁿ=a, δ(a)(σ)=σα/α; replacing α by ζα changes by σζ/ζ, a coboundary | Retain positive Kummer convention. |
| Bloch and coefficient order, :25 | B_old(𝔽₁₁) has order6, B_new order3; odd quotient C₃=C₃. n=1 power quotient={1}; n=0 would be U itself, so excluded | Retain with declared comparison. |
| Chern normalization and ε, :27 | In C₃, c=ζ, c_raw⁻¹=ζ²; c²=ζ², (c⁻¹)²=ζ, unequal. Thus squaring does not remove inversion | Retain unresolved normalization as an explicit target. |
| x,h,u and half power, :29 | m=2,ζ=−1: x=u; h=−x−x²/2+…; exp(mh/2) has constant1 while q^(m/2)=q has constant−1 | Retain. |
| §0.1 weight equations / exactness obstruction, :70–74 | G=1: whole quotient. Regular ℤ/9[C₆] eigenvector augmentation has image6ℤ/9={0,3,6}, missing1; after inverting6 projector average gives identity on eigenvectors | Retain; no division by nonunit6. |
| §0.1 representative versus class / inverse weight | In ℚˣ/(ℚˣ)², 2 and8 have same class since8/2=4. For n=5 the D(2) valuations over31 are1,2,3,4, permuted with inverse weight3. At n=7 unit inverse-weight dimension0; ζ₇ has weightχ | Retain distinct representatives and characters. |
| §0.2 excluded integers, :84 | ℚ:6·1·2=12,2·1·2=4; ℚ(i):6·4·1=24,2·4·1=8. gcd(1,M)=1; gcd(2M,M)=M. n=3 passes M′; n=9 fails separate9∤n | Retain formulas; S01 supplier repair. |
| §0.3 finite Chern / Tate untwisting, :93 | r=1 root-change factor k⁰=1. r=2,n=5,k=2 gives factor3. t_(ζ²)=2t_ζ, inverse untwisting=3. At n=1 all maps0; G=1 over ℚζ₃ still defines the map | Conditional native K-theory supply; retain full positive-order scope. |
| §0.3 additivity, fields and order reduction, :95 | Multiplicative target: c(a+b)=c(a)c(b); zero maps1. 25→5 uses ζ₂₅⁵; identity embedding fixes ζ and all coefficients. K₂[n]≠0 leaves a nonzero UCT quotient, not an identification K₃/n=K₃(;n) | Retain distinct coefficient arrows. |
| §0.4 Sah and H¹ restriction, :104 | G=1, scalar1: a−1=0, hence0H¹=0 supplies no invertible annihilator. C₂ acting by−1 on ℤ/3: a−1=1 mod3, hence H¹=0 | Retain. |
| §0.4 finite Chern injectivity, :106 | ℚ,n=3: no p² divides n, premise true despite3 dividing w₂=24. n=9:3² divides9 and3 divides24, premise false | Retain squarefree generality. |
| §0.5 finite endomorphism criterion, :115 | A=C₉,f=2,n=9: f(A)=A, ker={0}; f=0,n=3: f(A)+3A={0,3,6}≠A, A[3]={0,3,6}. n=0: A[0]=A, finite surjection has kernel0. A=0:0=0 | Retain finiteness and zero modulus. |
| §0.5 negative control and Picard criterion, :115–117 | A=ℚ/ℤ,f=3,n=3: f onto but ker∩A[3]={0,1/3,2/3}. In C₉, γ=1,a=2 gives f=−1, quotient0 and eigenkernel0. Inclusion C₃→C₉ sends quotient-by3 to zero but is an isomorphism on3-torsion, ruling out a natural identification of these two functors | Retain actual torsion/coinvariant maps; S01 supplied injection, S09 supplied arithmetic vanishing. |
| §0.6 exact unique lift, :128 | U=3ℤ→ℤ→ℤ/3, character trivial: class6 has unique lift6∈3ℤ, class1 has nonzero image and no lift. If injection replaced by ℤ→0, lift of0 is not unique | Retain injectivity, image=kernel. |
| §0.6 cyclotomic prime description, :130 | ℚ,3²: degree=e=φ(9)=6,f=1; ℚ(∛2),p=5: e=4 over each unramified local factor. At ramified F=ℚζ₃,p=3 the degree is1, not2, and the hypothesis fails | Retain. |
| §0.6 valuation lattice and ordinary lift, :130–132 | D=3ℤ,n=3: class3 nonzero in3ℤ/9ℤ maps0 inℤ/3. Trivial χ fixes all D/n; χ=−1 at odd p makes χ−1=−2 a unit and gives eigenpart0 | Retain D itself; no saturation assumption. |
| §0.7 finite S and avoidance, :142 | n=1:S=∅. In ℚ, 2 is a {2}-unit with v₂=1, while an ordinary unit ±1 has v₂=0. ℚ→ℚ(∛2) sends noncube[2] to1 | Retain finite S depending on n, no extension injectivity. |
| §0.7 ordinary-unit CRT, :144 | n=35: coefficient quotient ℤ/35≃ℤ/5×ℤ/7; roots ζ₃₅⁷ and ζ₃₅⁵ have orders5,7. Both components zero for ℚ; using one coefficient field without extension arrows has different domains | Conditional natural diagrams; retain. |
| §0.8 equivariant unit multiplicity, :153 | ℚζ₃/ℚ: free rank0 and odd multiplicity0; ℚ(√−7)ζ₅/ℚ(√−7): odd character multiplicity1. S₃ splitting field of x³−2 overℚ: sign-character multiplicity0, unit representation is the two-dimensional standard representation | Retain actual one-dimensional odd character. |
| §0.8 rank versus mod-p dimension, :155 | ℚ,p=3: r₂=0, roots contribute1, dimension1; p=5,7: χ≠χ⁻¹, dimension0. ℚ(∛2),p=3: free odd multiplicity1 despite ζ₃ in Galois closure | Retain torsion correction. |
| §0.9 unit theorem, :164 | ℚ,n=5: K₃/5=0, inverse-weight units0. n=3 under M′: both have order3. n=35: product0×0; n=25 hypotheses give injectivity, no general-surjectivity conclusion | Conditional K-theory comparison; retain. |
| §0.9 naturality / sign, :166 | ζ versus ζ⁻¹ invert every value; image subgroup and kernel are unchanged. Zero class has representatives1 and uⁿ, so uniqueness of a unit itself is false | Retain quotient uniqueness. |
| §1.1 product, polynomial, coefficient maps, :185 | n=0,1:D=1; n=2:1+x; n=3:(1−ζx)(1−ζ²x)²; x=0:1; x=ζ⁻¹,n>1:0. Reduction ℤ→𝔽₂ sends1+x to1+x | Retain. |
| §1.1 quasi-periodicity and nonvanishing, :187–192 | n=2,s=1,x=2 gives3=3; s=n gives (1−xⁿ)ⁿD=D(1−xⁿ)ⁿ. If xⁿ≠1 all factors nonzero. If x=ζ⁻¹ then xⁿ=1 and D=0 | Retain cleared identity. |
| §1.1 phase and power class, :192–193 | n=3:D(1)²=−27ζ²; D(1)=ζ(1−ζ)³. n=9: classζ³. n=1,…,16 exact phase-free remainder0. ℚζ₉ at n=3: classζ=1 | S04: qualify nontriviality, retain identity. |
| §1.2 finite sum and denominator guard, :204–211 | n=0:0,n=1:1; n=2,(2,3,5):23/3; x=y=−1: sum1 versus geometric2. Each forbidden denominator gives xⁿ=1 | Retain total definition with guarded cancellation. |
| §1.2 periodicity, shift and diagonal, :212 | Term n / term0=(1−Y)Z/(1−X)=1 on hypersurface. At x=y=0,z=ζ₃, f=1+ζ+ζ²=0. Shift test n=1 above gives1/2=1/2 | Retain. |
| §1.3 KMS and specialization, :224–228 | Exact finite-field and n=2 radical values in Lean table. X=Y forces Z=1 and D(ζ/z)=0; divided expression has zero denominator. Nonzero n in characteristic p excludes p dividing n | Retain no good-characteristic shortcut beyond necessary invertibility. |
| §1.3 Gaussian center/tails, :234 | X=1/5,Y=2,Z=−4/5: 1/10<4/5<1 and S=(4/5)(−1)/(−9/5)=4/9; prefactor √(2π/n)·2/3. At X=9/10,Y=2:9/20>1/10, wrong annulus | Retain center; uniform tail theorem remains analytic proof obligation. |
| §1.3 phase match, :237 | n=1:s=0,D=1,μ=1. n=2:s(1,2)=0,D=2,μ²=1=2/2. n=3:s(1,3)=1/18,D=3√3 exp(πi/6), μ³=exp(−πi/6) | Retain complex phase, not absolute value alone. |
| §1.3 radial asymptotic, :239 | n=1,x=−1: normalized values .704166632495,.705635175514,.706370595120 approach1/√2=.707106781187. x=0:1=1 for all n; xⁿ=1 excluded | Retain repaired negative half exponent. |
| §1.3 dilogarithm and Landen, :243–245 | At center Abel inputs4/9,1/9 sum5/9; a=1/2,b=1/5,c=1/10. (1−Z)/(1−X/(YZ))=(9/5)/(9/8)=8/5=−YZ. Five-Li remainder=½log²(8/5)=.1104517, not0. Landen at0:0=0 | Retain required logarithmic terms and separate Landen target. |
| §1.3 integral descent, :247 | n=2 coordinate equation x²−1+z²−y²z² is monic in x, free basis1,x. Characteristic2 with n=3 uses basis1,x,x²; no embedding intoℂ. Ramified/nonreduced test does not affect monic freeness | Retain general specialization route. |
| §1.4 Kummer values / root independence, :260 | n=1:P=1. n=3:P₀=D₁⁻¹,P∞=D₁, product1. For x→ζx, D ratio=(1−x)ⁿ/(1−X); adjoining a root of1−X makes that ratio an n-th power. 4,377 finite-field lift changes agree | S04 qualification also at :264; retain definition. |
| §1.4 inversion and boundary, :260–262 | 217 finite-field inversion products have class1. [32] at n=5 has boundary5(2∧−31), whereas [3] overℚ has v₂∧v₃ boundary1. Trivial finite Φ gives H¹=0 while [2] inℚˣ/(ℚˣ)³≠1 | Retain universal-extension restriction and boundary guard. |
| §1.5 unique regulator / five-term, :273 | Ordinary zero class→1. n=1 target={1}. Over ℚζ₃,n=3, ξ=0: both1 and[2] lift1, and v_(2)(2)=1 forbids a cube | Retain coprimality; powered variant is a set. |
| §1.5 powered lift ambiguity, :275 | In the same field w_F=6; P(0)^6=1 and kernel contains[2]. With root-free coprime condition the eigenkernel=0, hence one allowed lift rather than a chosen representative | Retain explicit ambiguity group. |
| §1.5 distribution, root and field maps, :279–281 | 15→3 uses ζ₁₅⁵,15→5 uses ζ₁₅³. Over𝔽₃₆₁,n=5,X=3, basis t²=2: class P=(7,9); root changeζ² gives(2,7), its cube, not square(2,12). 25→5:147 equal quotient values | Retain inverse exponent and arrow direction. |
| §1.6 étale Bloch exactness/comparison, :293–295 | ℚ,[32]:32∧(1−32)=5(2∧−31), tame symbol of{2,−31} at31 is2 of order5; valuations1,2,3,4 cannot be ordinary-unit values. n=1 all groups0 | Retain étale versus ordinary distinction; comparisons conditional on supplied K₂ theory. |
| §1.7 eta construction and root action, :305–307 | n=3:[∞]+2[0]=[0], using[∞]=−[0]. n=5,ζ=e^(2πi/5): two nondegenerate arguments−1.61803398875; ζ² gives+.61803398875. ζ⁻¹ leaves each squared argument unchanged; 2²=4 mod5 | S05 correct the root-dependent Check. Configuration-map normalization is separately conditional. |
| §1.8 positive chains, :317 | C₃: ∂([t∣t]+[t²∣t])=3[t]; ∂([t∣t∣t]+[t∣t²∣t])=0 by cancellation. N=1 normalized chains0 and H₃=0 | Retain positive comparison, no sign inferred from abstract isomorphism. |
| §1.8 Bott and Chern, :319 | Commutative ℚζ₃: ∂β=[ζ₃]≠0; M₃(ℚζ₃): determinantζ₃³=1, ∂β=0. ℤζ₃ permits β before3 inversion; étale assertion waits. Root inverse gives−β | S02 import owner; S03 qualify K₁ nonvanishing. |
| §1.9 bar eta / diagonalizer, :330–334 | A diag(ζ⁻¹,ζ) has columns(1,ζ⁻¹),(1,ζ); tA gives the same. det A=ζ−ζ⁻¹=d; scaling first column by d⁻¹ makes determinant1. n=3 Bloch image[0] | Conditional supplied configuration comparison; retain SL correction. |
| §1.9 product and restriction, :334 | (ζ^k)β(ζ^k)=k²ζβ(ζ); mod5 res/cor multiplies by2 and inverse is3. Mod2 multiplication by2 is0, so this injectivity argument fails | Retain odd hypothesis. |
| §1.10 signed product and normalization, :344–348 | a=1:δ=0, value1. In𝔽₇ˣ/cubes, cubes={1,6}, [2]≠[4]=[2]⁻¹; squaring interchanges these rather than identifying them | Retain conditional c_fixed comparison. |
| §1.11 finite local maps, :358 | n=3,ℓ=5: exponent3 permutesC₄; e.g. root of2 is3 since3³=2. ℓ=7: cubes inC₆ have order2, so no unique root. v_𝔮(u)=1 cannot be reduced as a residue unit | S06 addℓ=2 supplier case; retain stated congruence. |
| §1.12 eta generator and all-prime isomorphism, :367–369 | n=3,ℓ=5: v₃(6)=1 and root class has order3. ℓ=17:v₃(18)=2 and order-three root class is1 in quotient by cubes, although quotient has order3. F₂ case: B_old=C₃ and R([0])=ζ²≠1 in𝔽₄ˣ | S06; keep higher-order argument. |
| §1.12 valuation witness and finite eta evaluation | One factor at k=1 with valuation1 gives v(τ)=1 modp; k=0 would give0. 52 computations for odd n=3,…,27 and four eligible exact-valuation primes each give [R(eta)]=[ζ²]≠1 | Retain as Checks, not proof of universal calibration. |
| §1.13 detection product, :379 | Cyclic C₅ values1,2 have identical zero sets and generate the same subgroup; no unique generator follows. A nonzero Frobenius class has positive density, hence infinitely many nonzero coordinates. F containingζ has no split primes withℓ≡−1 modn | Retain product and disjointness. |
| §1.13 eta bridge and scalar comparison, :381–383 | n=5,F₀=ℚ√5: disc5 fails good-order premise; ℓ=19 gives root class order5 and detects exponent. ℓ=149 has v₅(150)=2, so [ζ₅]=1 locally. γ=2 and γ=3 are distinguishable at19, not149 | Retain separate non-good-order eta bridge; conditional normalization. |
| §1.14 image/calibration, :392–394 | c(eta)=ζ^b,R(eta)=ζ^a with b unit gives γ=ab⁻¹. a=2,b=1 gives2; a=2,b=−1 gives−2. ℚ,n=5 has source0 and cannot identifyγ from that source. At n=9,b=3,a=3 both γ=1 and4 solve bγ=a. At n=5,k=2, the combined root/eta exponent is 2·3·4=4 mod5, exactly (ζ²)² | Retain conditional calibration; no reverse Nahm edge. |
| §1.15 all-order Chern torsors, :405 | m=1:ε₁=1, line=A₁. ℚ,m coprime6: K₃=ℤ/48 has quotient0. ℚζ₃,m=3 still defined. Representative u→uv^m rescales root byv; ξ→−ξ invertsε | Conditional all-order Chern supply; no odd-only regulator substitute. |
| §1.15 line/coherence data, :407 | For trivial torsor A[T]/(T^m−1), weight-one line has rank1; tensor weight1+1=2 and inverse weight−1 pair to weight0. m=25→5 uses T↦T⁵ and ζ₂₅↦ζ₂₅⁵, not an arbitrary fifth root | Retain coherence as construction obligation, not automatic from class equality. |
| §2.1 compatible roots/order maps, :428 | m=6: ζ₂ζ₃=exp(5πi/3), whereas independently chosen exp(2πi/6)=exp(πi/3). At p=2,m=3 the CRT exponent is2 mod2 and1 mod3, hence4 mod6, giving ζ₆⁴=ζ₃ | Retain explicit CRT transport. |
| §2.1 root-difference valuation, :430 | p=2,m=1: c=−2,v₂(c)=1=1/φ(2). p=3,m=1: v₃(ζ₃−1)=1/2. At m=3,p=3 the root difference has valuation1/φ(9)=1/6. For(p,m)=(2,5), e=6,c=−2ζ₅,v₂=1; for(3,4),v₃=1/2. Independent roots giveω₆−ω₃=1, valuation0 | Retain convergent shift, not zero-constant substitution. |
| §2.2 coefficient algebra/completion, :440 | K=ℚ(i),m=4: basis1,ζ₄ gives rank2; e=(1−i⊗ζ₄)/2 has e²=e and e≠0,1. p=5 gives ℤ₅×ℤ₅; p=3 gives the unramified quadratic ring; p=2 inverted gives0 | Retain all factors. |
| §2.2 unramified Frobenius, :442 | Onℤ₃ φ(2)=2 while2³=8, difference6∈3ℤ₃. Onℤ₃[i], φ(i)=−i, order2; onℤ₅×ℤ₅ φ=id. x³−2 mod5=(x−3)(x²+3x+4), discriminant of quadratic=3 nonsquare, so degrees1,2 and order2, not3 | S07 import completed construction. |
| §2.2 coefficient versus cyclotomic actions, :444 | K=ℚ,p=2,m=3: coefficient action fixesζ; cyclotomic sendsζ→ζ². K=ℚ(i),p=3,m=4: coefficient φ sends e=(1−i⊗ζ₄)/2 to1−e while fixing the single base factor | Retain distinct actions; factor permutations remain. |
| §2.3 re-expansion/convergence, :460 | x↦x+c; x²↦x²+2cx+c²; geometric series at c=p gives constantΣpʲ=1/(1−p), not1. c=1 gives partial sumsN+1, not a Cauchy sequence inℤ_p | Retain complete target and topological nilpotence. |
| §2.3 ring/composition laws, :462 | rex_d(rex_c x²)=x²+2(c+d)x+(c+d)²=rex_(c+d)x². Coefficient φ fixes c, so φ(x+c)=x+c; geometric c=p respects multiplication by1−x | Retain imported generic theorem specialization. |
| §2.4 arithmetic ring/Taylor evaluation, :471 | Constant i forℚ(i),p=3 gives i≠−i; constants0,1 give0=0,1=1. Polynomial q² at m=1 has1+2x+x², evaluation1. Sign-supported order2 violates2→10 by−1≠1 | Retain Frobenius direction. |
| §2.4 away-from-γ restriction/descent, :475 | γ=1 keeps all; γ=2 retains odd m and removes1→2; retained edge criterion p∤γ and gcd(m,γ)=1. Full A₄(ℚ(i)) has two embeddings; choosing one loses e or1−e | Retain full-algebra Galois descent. |
| §2.4 worked re-expansions | Kontsevich–Zagier edge1→2 has shift−2, constant3 and linear11; edge1→3 constant5−ζ₃; edge2→4 constant8−3ζ₄. Finite truncations sufficient for these root values, whereas re-expanding only a finite Taylor jet is insufficient | Retain source-compatible values. |
| §2.5 local product / seed reconstruction, :488 | At p=2 seeds at1,3 are independent; seed(1)=1, all other odd seeds0 gives value1 exactly on2-power orders. p∣Δ gives all coefficient rings0, so product zero | Retain product, no claimed automatic p-completion. |
| §2.5 untwisting, :488 | ℚ(i),p=3: f₁=i,f₃=−i,f₉=i; φ^v₃(m) produces i,i,i. At p²d the exponent is2. For an unramified factor of residue degree3, φ⁻²≠φ² in general | Retain forward untwist and inverse reconstruction. |
| §2.5 integral intersection, :490 | Inℚ, a=1/2 is integral at every odd p but not2; it belongs toℤ[1/2], notℤ. A seed c∈ℤ_p\ℚ cannot be a rational global coefficient. Coordinate intersection over full basis excludes it | S08: move after the classical image theorem in §2.7. |
| §2.6 local chart, :501–503 | m=1:q→1+x gives(p,q−1)→(p,x). m=3:Φ₃(ζ+x)=(2ζ+1)x+x² and(2ζ+1)²=−3. At p=3 source completion reduces to domain𝔽₃[[x]], target has nilpotent t−1≠0 | Retain p∤m and separability; maps are mutual inverses. |
| §2.6 p-chain mixed-adic comparison, :505 | p=2,m=1, quotient(4,q+1):q−1=−2≠0, square4=0; mod2 chain factor q+1=q−1. Scalar2 is not in(q+1) although2∈(2,q−1) | Retain double inverse limit; raw ideals not cofinal. |
| §2.7 Taylor splitting, :519 | p=11,m=5: roots3,4,5,9 in𝔽₁₁, four linear factors and rank4; chosen root rank1. p=2,m=3:Φ₃ irreducible, rank2 | Retain every factor and reject printed irreducibility claim. |
| §2.7 all-order image, :521 | q² at order1 has coefficients1,2,1,0; zero has all0; the single seed at1 reconstructs the2-power-chain idempotent, with order3 value0. Prime-to-p restriction and reconstruction compose to the same seed | Conditional completion comparison; no extra equation between seeds. |
| §2.8 coordinate conversion, :531 | m=1:a₁→−a₁,a₂→a₂; m=2:x=u; m=3:a→−ζ₃a and inverse multiplies−ζ₃⁻¹, product1 | Retain coefficient indexℓ−1. |
| §2.8 weighted jets, :531 | N=0,1:∅; N=2:{(1,0)}; N=4:{(1,0),(1,1),(1,2),(2,0),(3,0)}. Full basis dimension atN=4 is3+1+2=6; nonstrict cutoff adds equality-weight components | Retain strict inequality. |
| §2.9 rational Habiro comparison, :544 | Δ=1 polynomial1−q has jets−x at1 and2−x at−1. Finite (q;q)_n products give order-one coefficients1,−1,2,−5,15,−53,217 and order-two3,11,72 | Retain actual Taylor image. |
| §2.9 localization order, :546 | Δ=2 odd-order indicator has values1 at1,0 at2 and square itself. H_ℤ[1/2] is a domain, hence only idempotents0,1; completion after localization has this third idempotent | Retain distinction. |
| §2.10 order components/idempotents, :555 | Δ=1 all indices component1. Δ=6:5,35→1;10→2;18→18. Indicators e_d e_e=0 for d≠e, e_d²=e_d | Retain infinite product. |
| §2.10 domains / internal idempotents, :557–562 | ℚ(i),d=4 fails K∩ℚζ₄=ℚ. Its e_m=(1−i^(m′)⊗ζ₄)/2 at m=4m′ has e_m²=e_m≠0,1. At p=3 both i and m′ change sign, so φ₃(e_(3m))=e_m | Retain disjointness, no blanket component-domain assertion. |
| §2.11 abelian scalar/tensor comparison, :566 | ℚζ₅,p=2: scalar at m=2 isζ₅³, φ₂ givesζ₅⁶=ζ₅; wrong exponent2 givesζ₅⁴. ℚ(i) uses i,−i,i along1,3,9. ℚ specializes to constant scalars | Retain inverse Artin convention. |
| §2.11 constant-family iff, :570 | Forℚ(i),a+b i fixed by inert φ₃ iff2bi=0, hence b=0, exactlyℤ[1/Δ]. ℚ(∛2) has global automorphism group1 but nontrivial quadratic local Frobenius; no global φ model | Retain Chebotarev fixed-field argument. |
| §3.1 invertible local section / completed log, :589–596 | ξ=0,f=1:shape constant1, defect0. (1+x)^(1/p):defect0 but linear1/p nonintegral. For ξ≠0 polar coefficient ζ(φD−p²D)/(pm²); φ^s=id would force (p^(2s)−1)D=0 if that pole vanished | Retain corrected shape and allowed simple pole. |
| §3.1 module span/trivializations, :600 | s generates; ps has leading coefficientp, zero has0, neither a unit though both are module elements. Atp=5,f=1+x/5 log defect has coefficient8/5 atx², not in5ℤ₅ | Retain module versus generator distinction. |
| §3.2 Dwork iff, :611 | f=1:quotient1, coefficient0 integral. f=(1+x)^(1/p):quotient1 but first coefficient1/p, excluding false reverse implication. f=(1+x) integral, quotient1. Ramified p need not be a uniformizer; equal-characteristic p=0 makes S[1/p]=0 | Retain unramified complete torsion-free assumptions. |
| §3.2 exponential corollary, :615 | Atp=5,g=5 constant: exp(g)∈1+5ℤ₅. Atp=2,g=2: terms2^k/k! have valuation s₂(k), equal1 for k=2^a, so terms do not tend0 | Retain p>2 and small constant. |
| §3.3 depleted series, :625 | s=0:t/(1−t)−t^p/(1−t^p) has coefficient1 when p∤k,0 otherwise. s=2 coefficients at1,p are1,0; wrong subtraction p² gives coefficientp⁻²−p²≠0. s=−1 coefficients k at p∤k remain integral | Retain all integer weights. |
| §3.3 Pochhammer defect / specialization, :627 | coefficient t is p/(1−q)=−p/x. For p=5,ζ³=1, reduction Li₂^(5)=1+2ζ≠0 sinceζ≠2 in𝔽₂₅; +5 and−5 residues differ mod25. ζ=1 has denominator0; primitive p-th root is ramified | Retain repaired negative sign. |
| §3.4 regularized factor, :638–647 | Empty presentation givesU=1. m even: exp(mh/2) constant1, q^(m/2) can be−1. Laurent log pole +Li₂/(m²h) cancels the explicit negative exponential | Retain formal asymptotic interpretation. |
| §3.4 defect/change of presentation, :649 | Unregularized pole −pLi₂^(p)/(m²h) plus regularizer +pLi₂^(p)/(m²h)=0; B₁(1/2)=0. A zero relation yields a local-unit ratio, not necessarily identical generators | Conditional integral presentation; retain independent defect theorem. |
| §3.5 rational first-jet function, :658 | H(−1,1)=1/48; H(2,1)=1/12; H(−1,2)=1/96; H(−1,−1)=−1/48. Atz=1,r=0,or characteristic2,3 total H=0, whereas asymptotic formula is unavailable | Retain total definition only in README. |
| §3.5 Bernoulli expansion, :660 | B₂(1/2)=−1/12 gives coefficient−Li₀(ζ)/24 in h; h=x/ζ_m+… gives−ζ/(24ζ_m(1−ζ)). m=2,ζ_m=−1 flips the order-one sign | Retain coordinate factor. |
| §3.5 integral jet, :669 | Atp=5,ζ=−1,ζ_m=1 coefficient1/48 is integral; dividing presentation coefficient by5 gives1/240, valuation−1. Atp=2 or3,24 is nonunit | Retain finite integral presentation and p>3. |
| §3.6 local freeness and ratios, :679 | ξ=0,s=1 gives ring module. s→2s atp=5 gives unit ratio2 and inverse1/2; s→5s has ratio5 nonunit. Quotient of equal-degree completed poles is D−D=0 | Conditional existence; retain Dwork proof route. |
| §3.6 local tensor and zero degree, :681 | s⊗t mapsst, coefficient1·1=1 in chosen bases; inverse sendsast toas⊗t. Rescaling s byu cancels with u⁻¹ on coefficient a | Retain local isomorphism, no global freeness inference. |
| §3.7 phase cocycle/normalization, :690–692 | α_σ=c(σ−σ⁻¹): σ′α_σ+σ⁻¹α_σ′=c(σσ′−(σσ′)⁻¹). Atp=5,ω=2 gives3/2 a unit; atp=3 it has valuation1; mod2 no unit with nonzeroω−ω⁻¹ | Retain p≥5 normalization. |
| §3.7 linear extension, :694–698 | Atξ=0,i seed atp=3 reconstructs i,−i,i. Replacing s by2s changes a→a/2 and (a/2)·2ŝ=aŝ. E(0)=0; E((a+b)s)=(E(a)+E(b))ŝ. Zero cocycle α=0 givesβ=0, no independent sign | Retain repaired generator-independent linear datum; existence/coherence remains a theorem. |
| §3.8 global linear equalizer, :708 | f₂=−1,other f_m=1: local prime-to-p units but edge2→10 gives−1≠1; zero and one satisfy0=0,1=1. Equalizer sum obeys E(a+b)=E(a)+E(b) | Retain rejection of old false model. |
| §3.8 nonlinear consequence, :710 | Sign family individually passes square-type tests; adding1 gives0 at2 and2 at10, so γ=1 product gives0 versus4. f=1−q,γ=2 gives(1−q²)²(1−q⁻¹) overℤ[1/2], not a quotient modulo2 | Retain consequence only; no converse or use in defining addition. |
| §3.9 zero degree and multiplication, :723–725 | E₀=φ⁻¹rex rewrites f_pm=φ⁻¹rex f_m into rex f_m=φf_pm. Degree sumξ+(−ξ)=0; zero times any section0; e²=e in degree0 | Retain exact ring identification, not nonlinear reconstruction. |
| §3.10 effective descent, :734–736 | ξ=0 candidateH_R has rank1 on every chart. Over ringA×A, moduleA×0 has ranks(1,0), so fails rank-one condition. The lattices p^kℤ all rationalize toℚ, but their intersection over k≥0 is0. Also ℚ∩∏_p p⁻¹ℤ_p contains1/p for every prime p and has no finite denominator bound, so is not finitely generated overℤ | Conditional new descent theorem, not inferred from these tests. |
| §3.11 tensor equivalences, :746 | M₀⊗Mξ maps1⊗f↦f; exponent0 givesH_R. For a nonprincipal invertible ideal I, I⊗I⁻¹≃A but no single pairxy=1: such a pair would make I principal. Finite sumΣx_i y_i=1 suffices | Conditional descent; retain finite-sum inverse. |
| §3.11 Picard character, :750 | [M₀]=0; [Mξ]+[M−ξ]=0; tensor square2[Mξ]=[M₂ξ]. Rescaling generators by units is an isomorphism, hence class difference0 even when transition matrices change | Retain existing Picard API. |
| §3.12 power substitution, :761 | (ζ+x)⁻¹=ζ⁻¹−ζ⁻²x+…; applying it twice givesζ+x. γ=2,m=2 sends root−1→1, reducing order2→1. γ=0 would require evaluation at a different center, unavailable for arbitrary series | Retain nonzero integers and order change. |
| §3.12 degree/involution consequences, :763 | τ:ξ→−ξ; τ² returnsξ. f=1−q,γ=2 gives at1 −2x−x² and atζ₃ 1−ζ₃²−2ζ₃x−x². Root-one inversion substitutes−x/(1+x), not−x alone | Conditional torsor maps; retain localization away fromγ. |
| §3.13 pairing/proportionality, :774 | a=gτg,b=fτg: af=gτg f=bg. g=0 gives a=b=0. InA×A with τ=id, f=(1,0),g=(0,1) gives b=0,a=g and both products0 | Retain no division or nonzero coefficients. |
| §3.14 vanishing, :783 | E(0)=0 along retained edges. Δ=2: odd-order indicator is1 at1,0 at2; no1→2 constraint. f=1−q at1 has constant0 but full series−x≠0 | Retain full-series hypothesis. |
| §3.14 integral constants, :785 | ξ=0 evaluation f_m(0) is the usual Taylor constant. A noncubeu inK(ζ₃) has a root-line generator represented byu^(1/3) outside that field; replacing line target byK(ζ₃) loses it | Conditional intersection and root-line model; retain gcd(m,Δ)=1. |
| §3.15 invertible versus free, :795 | Integral H_ℤ is a domain: (1−q)f=0 impliesf=0, but evaluationq=1 gives0≠1, so multiplication not onto. Zero multiplication sends1→0; unit1 acts identically | Retain no universal abelian-field generator. |
| §3.16 pullback, :804 | ℚ→ℚ(i),p=5: a→(a,a), rank2 coefficient target. Identity fixes every coefficient andζ. Successive embeddings fix the same abstract root, so both composites sendζ→ζ | Conditional Chern/Coleman naturality; retain all factors. |
| §3.16 scalar equivalence, :806 | Degree0: H_S⊗_(H_R)H_R→H_S sendsb⊗a↦bι(a), inverse b↦b⊗1. An R-tensor would need constant i inH_R, already refuted by i≠−i | Conditional effective base change, correct tensor base. |
| §3.17 coefficient Galois action, :819 | ℚ(i): coefficient conjugation sendsi→−i, abstractζ₄→ζ₄; square fixesi andζ₄. At split5 it exchanges the two base factors. ξ not fixed maps to degreeσξ, not toξ | Retain whole graded-family action. |
| §3.18 determinant norm / trace log, :829 | Split rank2 series(1+ax,1+bx) has norm1+(a+b)x+abx². For a=1,b=2:1+3x+2x²; coefficientwise norm would start1+2x. log norm has first coefficient3=trace(1,2) | Retain whole-series norm. |
| §3.18 torsor/degree norm diagrams, :831 | Base scalarc in rank2: normc=c², tracec=2c; transferred restriction degree is2ξ. Forξ=0 completed pole0, norm of normalized integral units stays integral | Conditional named regulator/finite-Chern diagrams; no Picard norm inferred. |
| §3.19 global multiplicative transfer, :844–846 | Identity extension has degree1 and normf=f. Quadratic norm of2=4 while norm1+norm1=2, so not additive. Norm0=0,Norm1=1; tower degrees2 and3 yield(f²)³=f⁶ | Conditional full-order compatibility/descent; retain multiplicative type. |

### Finite computation evidence

The computations used exact polynomial/finite-field arithmetic, with total inverse of zero matching Lean. For each displayed finite field and fixed primitive root, every admissible triple was enumerated. Small fields with no admissible KMS triple are explicitly distinguished from nonvacuous tests.

| Field/order | Quasi-periodicity cases | Shift cases | KMS cases | First admissible KMS value on both sides |
|---|---:|---:|---:|---|
| 𝔽₂,n=1 | 4 | 1 | 0 | No admissible triple |
| 𝔽₃,n=1,2 | 15 | 6 | 0 | No admissible triple |
| 𝔽₅,n=1,2,4 | 50 | 30 | 6 | n=1,(2,3,3):1=1; none for n=2,4 |
| 𝔽₁₁,n=2,ζ=10 | 33 | 82 | 32 | (2,4,3):2=2 |
| 𝔽₁₉,n=3,ζ=7 | 76 | 282 | 108 | (2,10,5):5=5 |
| 𝔽₁₇,n=4,ζ=4 | 85 | 324 | 128 | (3,6,6):6=6 |
| 𝔽₃₁,n=5,ζ=2 | 186 | 1230 | 500 | (3,11,7):30=30 |
| 𝔽₃₇,n=6,ζ=11 | 259 | 2094 | 864 | (2,5,9):11=11 |
| 𝔽₄₃,n=7,ζ=4 | 344 | 3290 | 1372 | (3,7,6):39=39 |
| 𝔽₇₃,n=9,ζ=2 | 730 | 9486 | 4374 | (3,25,25):18=18 |
| 𝔽₁₆=𝔽₂[t]/(t⁴+t+1),n=3 | 64 | 219 | 108 | ζ=t+t²,(x,y,z)=(t,1+t,t):t²+t³ on both sides |
| Same field,n=5 | 96 | 605 | 250 | ζ=t³,(x,y,z)=(t,t²,t):t²+t³ on both sides |
| 𝔽₉=𝔽₃[t]/(t²+1),n=2 | 27 | 50 | 16 | ζ=2,(x,y,z)=(1+t,2+t,2+t):2+t on both sides |
| Same field,n=4 | 45 | 100 | 0 | No admissible triple |
| 𝔽₂₇=𝔽₃[t]/(t³+2t+1),n=2 | 81 | 626 | 480 | ζ=2,(x,y,z)=(t,1+t,2t+t²):2+t+t² on both sides |
| Total | 2095 | 18425 | 8238 | No failure |

Exact cyclotomic quotient arithmetic gave remainder zero for D(1)²⁴−n^(12n), n=1,…,16. The regulator tests used quadratic residue fields 𝔽_(ℓ²) and compared power classes by raising to (ℓ²−1)/n. At orders 5,7,9,15,25 with ℓ=19,13,17,29,149, respectively, all 4,377 changes of a chosen n-th root and all 217 inversion products gave the claimed classes. Order25→5 agreed for all147 admissible base-field arguments over𝔽_(149²).

For eta, 52 computations returned [ζ²]≠1: n=3 at ℓ=5,11,23,29; n=5 at19,29,59,79; n=7 at13,41,83,139; n=9 at17,71,89,179; n=11 at43,109,131,197; n=13 at103,181,233,311; n=15 at29,59,239,389; n=17 at67,101,271,373; n=19 at37,113,151,227; n=21 at41,83,167,419; n=23 at137,229,367,643; n=25 at149,199,349,449; n=27 at53,107,269,431. These computations do not establish the unconditional Nahm calibration; that remains downstream.

The small-field repair has a direct group-presentation check. For 𝔽₂ write a=[0],b=[1],c=[∞]. The six admissible ordered distinct pairs in the projective five-term relation give b=0, c=2a, a=2c and a+c=0. Thus the presentation is ℤ/3 on a. In𝔽₄, 1−ζ=ζ² and1−ζ²=ζ, so D(1)=ζ²·ζ²=ζ and R(a)=ζ². This verifies S06's requested value independently of a ≥4 configuration comparison.

### Sources and locators

All eight works were available legally as the service's extracted texts; both CGZ versions use one manifest key. The nine cached PDF hashes match the manifest, including the separately recorded published CGZ hash. The published CGZ copy was retrieved through the source service in this pass. No source text was copied into the package or report. The following 26 locator groups were read and checked; “extension” means the README correctly labels its stronger claim as its own target, not a theorem already printed in the source.

| Locator group / package targets | Text evidence | Scope/sign result |
|---|---|---|
| CGZ published introduction; §§0.2,0.9,1.13 | CGZ line115, line157, line170 (published version) | Published Remark1.4 and Theorems1.5–1.6; distinct numbering from v3; M and M′ variant retained. |
| CGZ Bloch definitions and conventions | CGZ line74; CGZ line381 (published version) | Degenerate symbols and odd comparison checked; small field contract defect is S06. |
| CGZ eigenclasses and Kummer descent; §§0.1,1.4 | CGZ line380, line418, line521 | Universal Kummer extension matters; no unique powered lift when μ_n lies in F. |
| CGZ order, root and field compatibility; §1.5 | CGZ line640, line673, line686, line699 | Inverse root exponent and explicit coefficient arrows; source itself notes failure of extension injectivity. |
| CGZ unit multiplicities; §0.8 | CGZ line747 | Roadmap replaces the source's Galois-closure assumption step with the actual one-dimensional character calculation; torsion correction retained. |
| CGZ restriction and S-units; §§0.4–0.7 | CGZ line830, line866, line882, line901 | Squarefree/repeated-prime distinction, finite S and class-group input checked; S01 updates ownership. |
| CGZ detection; §1.13 | CGZ line1004 | Product target corrects finite-support issue; disjointness kept. |
| CGZ reduction and finite Bloch groups; §1.11 | CGZ line1048, line1128 | Printed finite-field argument assumes odd residue prime; S06 covers omittedℓ=2. |
| CGZ eta and local isomorphism; §§1.7,1.12 | CGZ line1197, line1228, line1236, line1260 | Exact valuation and higher-order argument differ; no Nahm evaluation is an input. |
| CGZ étale Bloch group; §1.6 | CGZ line218, line1439, line1443, line1519 | Exact-sequence locator repaired; cohomological comparison has stronger root/Tate assumptions. |
| CGZ calibration; §1.14 | CGZ line1742 | Numerical eta value is downstream; the early roadmap uses only a conditional scalar reading. |
| H2024 positive cyclic chains; §1.8 | H2024 line57 | Positive Bockstein normalization checked at C₃; abstract H₃ alone does not fix it. |
| H2024 finite Chern sign; §1.10 | H2024 line187, line296 | Product theorem explicitly commutative; negative cup sign retained and not silently erased by tensor identification. |
| H2024 Bott/eta comparison; §§1.8–1.9 | H2024 line262, line353 | Coefficient Bott versus integral K₂ distinguished; S02 and S03 correct ownership and arbitrary-ring inference. |
| H2013 configuration map | H2013 line1506 through line1588 | Configuration and repeated-vertex comparison is supplier work; its actual normalization is not independently constructed here. |
| GZ KMS statement / branches; §§1.2–1.3 | GZ line830 through line960 | Source statement has no odd-order restriction; analytic-to-algebraic extension remains a target. |
| GZ Pochhammer expansion | GZ line129, line331, line868 | Expansion gives negative half exponent; the printed positive exponent is not copied. |
| GSWZ arithmetic ring definition | GSWZ line260 through line320 | Gluing direction, compatible root choices and omitted inverted-prime conditions checked. |
| GSWZ local/global modules and tensor claims | GSWZ line380 through line485 | Linear definition/effective descent are declared refinements; source does not prove the newly required full descent contract. |
| GSWZ depleted functions/defect | GSWZ line792 through line888 | Coefficient t gives−p/x, correcting printed positive residue. |
| GSWZ Dwork, phase and local generators | GSWZ line2015 through line2240 | Integral first coefficient, p≥5 phase denominator, half-shift and local freeness read with their hypotheses. |
| GSWZ substitution/vanishing/constants | GSWZ line2285 through line2297 | Global functorial transfer is not claimed to be printed here; full-series versus constant vanishing distinguished. |
| GSWZ Taylor coordinates / arithmetic assembly | GSWZ line2964 through line3055; line3292 through line3380 | Shiftℓ−1, weighted cutoff, full factors, source's completion-versus-tensor caveat and KZ values checked. |
| Wagner thesis local charts | W-thesis line1313; line1400 through line1464 | Relative Frobenius owner is QWittVectors; false irreducibility step replaced by separability. |
| Wagner Q local charts | Q line647; line734 through line797 | Same irreducibility misprint at line781; Φ₅ mod11 splits four ways, as the roadmap records. |
| BG tame-kernel value | BG line1242 through line1268 | Discriminant−4 is in the unstarred trivial-K₂ table; M_(ℚ(i))=24,M′=8. |

### Supplier and pin audit

Ten supplier citation groups were resolved against their actual available versions: the nine cited groups below and QWittVectors, found by object search. All 24 explicitly supplied sibling heads were searched, as were active/completed main roadmaps and board packages. The roadmap tool's object grep and citation resolver were used as leads; findings use the read files, not absence inferred from the resolver. The 24-head search included the unrelated number-theory/geometry siblings rather than only the Habiro names. No duplicate fully qualified Lean declaration was found.

| Supplier citation group | Resolved sections and checked contract |
|---|---|
| StableHomotopyKTheory | §§7.2–7.4 finite coefficients, Bockstein and UCT; §7.33 retains vanishing hypotheses for its special product theorem. The package instead uses mixed integral/coefficient products from the finite-Chern supplier where required. |
| GeneralAlgebraicKTheory | §§2.1–2.4 exact-category models; §3.2 ring functoriality; §§7.4–7.8 products, transfer and base change. Commutativity required for internal products; finite-resolution/finite-free conditions kept. |
| ArithmeticKTheory, supplied head | §§3.4,4.1–4.4,5.3,6.13 include actual finiteness/Tate/odd-K and cyclotomic Picard targets. The gap now asks for several supplied items: S01; its already-owned invariant-vanishing corollary is S09. |
| KTheoryFiniteLocalFields | §§1.2,1.8,2.1,3.0a,6.5a–6.6,7.1–7.4. Universal Chern map precedes rigidity. Local/global edges are distinguished; odd global cohomological dimension conditions do not restrict the all-order ordinary Chern construction. Bott duplication: S02. |
| ColemanIntegration | L2.16–L2.18 supply branch-sensitive functions and root-of-unity values; L3.Fa.2–L3.Fa.4 supply rational de Jeu complexes with their special-unit and vanishing hypotheses. They do not supply the integral completed local K₃ presentation. |
| HabiroCyclotomicCompletions | §§1.2–1.5, Layers3–4, §§5.2–5.4 supply generic completion, convergent re-expansion, integral Taylor detection and disconnected CRT. They do not supply §2.7's full arithmetic local image theorem; S08 orders that input correctly. |
| PolylogarithmFunctions | §§1.1–1.7,3.2,3.4 supply principal Li₂, derivative, value at1, inversion and Abel identity with exactly the stated domains. Landen is proved here, not attributed to an absent supplier target. |
| QSeriesPartitionsAndMockModularForms, supplied head | §§1.2–1.6,2.3,2.5,5.2 supply finite prefixes, reciprocal domain, convergence, bilateral summation and eta multiplier. No radial asymptotic is claimed supplied after repair. |
| Chebotarev on main | Layer10, README:410–423: prescribed conjugacy classes have positive density, infinitude and invariance after deletion of a finite set. |
| QWittVectors, supplied head | §6.1, README:789–809 supplies completed Frobenius and naturality, including zero inverted-prime completions: S07. |

K3BlochGroups, ArithmeticKTheory and PadicHodgeRegulators have matching gap slugs in the README and plan. K3BlochGroups and PadicHodgeRegulators remain conditional suppliers, not absence findings. Their requested configurations and completed integral regulator are different objects from rational de Jeu complexes and Bloch–Wigner regulators. S06 isolates a stated hypothesis mismatch; S01 isolates the unnecessary part of the arithmetic gap. No unnamed `supplier:none` occurs.

HabiroRings, HabiroNahmSeries and HabiroCohomologyFoundations were read at the supplied heads for overlap. HabiroRings:87–93 consumes the number-field ring, effective indexed lines, integral first fibre and naturality; :1179 uses the inverse tensor certificate for evaluation. HabiroNahmSeries:155 imports ArithmeticKTheory's K₂ finiteness directly, reinforcing S01; :1613–1620 consumes the finite Chern normalization and indexed module contract. The regulator's construction and comparison up to a unit do not consume its later Nahm calibration. The number-field arithmetic assembly, first-jet correction and coherent indexed modules belong here; relative/derived Habiro foundations belong to the earlier cohomology owner or later relative-ring extension. QWittVectors' completed coefficient Frobenius is the exception already isolated in S07.

The library pins were checked from lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Representative exact declarations and the hypotheses that matter are:

| Pin file/declaration | Read hypothesis/content |
|---|---|
| `Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean:784`, IsPrimitiveRoot.autToPow; :821, autToPow_spec | NeZero n; root exponent sends μ to its automorphism image. |
| `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean:212`, modularCyclotomicCharacter | NeZero n and root-count hypothesis; not an arbitrary root-free character. |
| `Mathlib/RepresentationTheory/Homological/Resolution.lean:429`, Rep.barResolution | Native representation/projective-resolution carrier. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/FiniteCyclic.lean:122`, groupHomologyIsoOdd | Generator hypothesis and odd degree; no positive named-chain normalization. |
| `Mathlib/RepresentationTheory/Homological/GroupHomology/LowDegree.lean:191`, d₃₂ | First face acts by g₁⁻¹, so a sign/convention comparison is required. |
| `Mathlib/RepresentationTheory/Homological/GroupCohomology/Functoriality.lean:402`, H1InfRes_exact | Existing ordinary group cohomology exact sequence; continuous version must use the continuous carriers. |
| `Mathlib/NumberTheory/NumberField/Units/DirichletTheorem.lean:358`, Units.rank; `Units/Basic.lean:174`, torsionOrder | Rank is number of infinite places minus1; torsion has its separate cardinality. |
| `Mathlib/RingTheory/DedekindDomain/SelmerGroup.lean:231`, fromUnitLift_injective | Fact(0<n); ordinary unit classes inject. |
| `Mathlib/RingTheory/Polynomial/Cyclotomic/Eval.lean:41`, eval_one_cyclotomic_prime_pow | Prime p, exponent k+1; no assertion for the zero polynomial/order. |
| `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:191`, not_dvd_discr_iff_isUnramifiedIn | Integral closure and prime; discriminant gives the needed unramified condition. |
| `Mathlib/RingTheory/Smooth/Fiber.lean:245`, Etale.of_formallyUnramified_of_flat | Finite presentation and flatness as well as formal unramifiedness. The localized integer algebra has these, not merely unramifiedness. |
| `Mathlib/RingTheory/Smooth/AdicCompletion.lean:94`, exists_mkₐ_comp_eq_of_isAdicComplete | Formal smoothness and complete target. |
| `Mathlib/RingTheory/Unramified/Basic.lean:161`, ext_of_iInf | Formal unramifiedness and intersection of ideal powers zero. |
| `Mathlib/RingTheory/PicardGroup.lean:484,494,502`, mk_eq_mk_iff, mk_eq_one_iff_free, mk_tensor | Genuine invertible modules and linear equivalences; local rank alone is not an instance. |
| `TauCeti/Algebra/Group/PowerClassGroup.lean:48,52`, powerClassQuotient, powerClassHom | Quotient of a commutative group by powers, with a real quotient map. |
| `TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:341,360,370,384,537` | Kummer class, injection, surjection, isomorphism and transport require n invertible; transport requires equivariance as well as a coefficient equivalence. |
| `TauCeti/RingTheory/DedekindDomain/SInteger/SelmerGroup/Basic.lean:186,269,296` | S-unit injection and kernel; range/class-group torsion statement additionally needs NeZero n. |
| `TauCeti/RepresentationTheory/Homological/ContCohomology/InnerConjugation.lean:297` | Locally compact group context and smooth discrete coefficients; induced inner map is identity. |
| `TauCeti/LinearAlgebra/Eigenspace/JointEigenvector/Basic.lean:368` | Finite commutative group, domain, enough roots and invertible group order for Fourier decomposition. |
| `TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean:164,178,197,237` | Finite nonarchimedean local-field context, unramified Frobenius, inertia-degree order, residue congruence and uniqueness. Semilocal general construction has QWittVectors as owner. |

The read-only dependency command, with the supplied order and `--movable`, returned:

```text
depcheck: 25 roadmaps, 215 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The coarse check does not examine the within-roadmap forward input of S08. The later §3.12 input to §3.8's nonlinear consequence is explicitly identified and excluded from descent; it can be proved after substitution without a dependency cycle. No later roadmap is used to construct a supplier's own input.

Git's origin/main...HEAD diff contains only this package: README.md, Suggested.lean, design/plan.json, metadata.toml, the preceding repair report, review.json and sources.toml. The reviewed source files were left unchanged. The report is the only added repository file; computation scripts and reading notes are scratch files. No git-writing command, Lean build or external post was run.

## Not verifiable

- No fresh elaboration was run: the read-only instruction forbids Lean builds. All six supplied elaborated types were compared with the complete source and README; this checks retained binders but does not prove the four admitted theorems.
- The universal statements behind the 232 Check bullets are not all computations. The configuration-map multiset Check at README:313 depends on the declared repeated-point specialization and its chosen cross-ratio convention. The eta arguments and positive bar boundaries were computed, but the missing supplier comparison was not constructed. It is not counted as a certified configuration-map test.
- The local K₃ integral presentation, its p²-valued regulator and transfer diagram remain declared supplier contracts. No claim is made that the ordinary Bloch–Wigner or rational de Jeu theorem proves them. The in-scope portions of the Bloch foundation gap likewise remain conditional.
- Effective global descent, generator-independent full-order extension, tensor conservativity, scalar equivalence and global norm membership are new proof obligations. Their boundary models and dependency types were audited; source-local freeness does not certify these global theorems. No full proof of these proposed extensions is supplied by this review.
- The uniform Gaussian tail bound, integral descent from the analytic KMS identity, and global conditional normalization diagram were checked for domains and explicit test values, not formally proved. The finite computations do not replace those proofs.
- Ownership against unspecified, unprovided open work was not independently certified. The 24 sibling heads named in the brief were searched, along with main/completed content, board packages and the available supplier index. No additional unprovided pull-request head was fetched for a speculative ownership search.
- No cited text is missing or awaiting an alternative legal copy. No new needs-references request is outstanding.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "da336a9fc0e83b2c23a13b37c4a25d06be5a9ba6", "job": "RT-HabiroNumberFields~2a", "model": "gpt-6-astra", "worker": "chris-4"} -->
