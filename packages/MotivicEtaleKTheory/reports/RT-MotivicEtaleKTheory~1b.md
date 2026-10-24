<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1047#issuecomment-6379965907 -->
Red team round 1 pass b (claude) of 1064583

Verdict: needs changes

1. **F01** (P2) §2.1 constructs the inverse of a map whose invertibility is proved only in §2.2

   **Location.** packages/MotivicEtaleKTheory/README.md:247: "The construction is the rational inverse of the geometric cycle-to-K map on its Adams weight. Construct the character on the classifying-space/descent diagrams … before passing to homotopy groups." The *Needs:* line at README.md:262 does not list §2.2.

   **Claim.** §2.1 defines chₚ,ₙ as an inverse of Levine's geometric cycle map, and also as a map of classifying-space diagrams.

   **Witness.** The bijectivity of that map is proved in §2.2 ("Prove the geometric cycle-to-K map is an isomorphism on each weight …", README.md:268), and §2.2's *Needs:* line (README.md:284) lists §2.1, so the two targets depend on each other. Levine's map is defined only on homotopy groups: it is the K₀ class of relative cubes (Levine94 line 1210–1214). No space-level inverse exists to construct. The only space-level construction in the roadmap is §2.0b's universal-class character.

   **Repair.** In §2.1, replace the two quoted sentences with: "Construct the geometric weight-p cycle map cyc_{p,n}:CHᵖ(X,n)⊗ℚ→Kₙ(X)^(p) on the supplied carriers. It sends a codimension-p cycle to its coherent structure-sheaf class in §2.0a's cube model, followed by the weight-p projector and the cube delooping. Moving makes it independent of representatives (Levine94, Theorem 3.1 and its construction, pp.275–277)."
   - Make the API bullet at README.md:253 read "cyc_{p,n} is rationally additive, natural for flat morphisms, and natural for all morphisms of smooth quasi-projective schemes through §1.4."
   - After the isomorphism in §2.2 (README.md:266), add: "Define chₚ,ₙ as cyc_{p,n}⁻¹ composed with the weight-p projector, and the total character as their finite sum. §2.0b's universal-class character is its space-level model with open-restriction naturality, by the identification below."
   - Restate the Checks at README.md:257 and :260 for cyc, or move them to §2.2.

   **Test on the instance.** Take X=Spec ℚ, p=n=1. Then cyc_{1,1} sends the point 2 of □ to [2]∈K₁(ℚ)^(1)=ℚ^×⊗ℚ. After the repair, ch₁,₁[2]=[2] is defined in §2.2, once ℚ^×⊗ℚ→K₁(ℚ)^(1) is known to be bijective. No target then uses a later one.

2. **F02** (P2) §2.0b claims integral Chern operations over every field, but gives no route over finite fields

   **Location.** README.md:229: "For every field k … use moving over purely transcendental extensions and specialization to define pullback on the shared cycle complexes." No clause treats finite k.

   **Claim.** The integral operations cₚ,ₙ:Kₙ(X)→CHᵖ(X,n) exist for every field.

   **Witness.**
   - Specialization needs a k-point of a dense open U⊂𝔸ᵐ. Levine reduces to infinite k first (Levine94 line 1595–1602).
   - Over k=𝔽₂, U=𝔸¹∖{0,1} has no rational point.
   - BF performs this step over ℂ (BF line 980–990), and the arbitrary-field source, Bloch86, is uncertified.

   §§2.2 and 2.4 (README.md:270–274, :311) inherit the gap.

   **Repair.** Add after the specialization sentence in README.md:229: "This specialization needs k infinite: over 𝔽₂ the dense open 𝔸¹∖{0,1} has no rational point. For finite k, which is perfect, construct cₚ,ₙ from the universal classes on complexes that are functorial for all morphisms of smooth k-schemes: the Tate complexes of MotivesAndAlgebraicCycles §4.4, identified with the shared cycle complexes by the perfect-field comparisons of MotivesAndAlgebraicCycles §§4.17–4.18 and KTheoryFiniteLocalFields §3.0a. Over infinite perfect fields, prove that the two constructions agree."
   - Add "MotivesAndAlgebraicCycles §§4.4, 4.17–4.18" to README.md:243.
   - Add the Check: "Over 𝔽₂ and on X=𝔾_m, c₁,₁[t]=[t]∈CH¹(𝔾_m,1). It is obtained from the finite-field clause, because a rational specialization point in 𝔸¹∖{0,1} does not exist."
   - Alternative repair: restrict §2.0b, the universal-class identification of §2.2 and the coefficient formula of §2.4 to infinite k.

   **Test on the instance.** For k=𝔽₂ and X=𝔾_m, the repaired route defines c₁,₁ without a specialization point. The value [t] matches the field diagonal of KTheoryFiniteLocalFields §6.10, which has coefficient (−1)⁰0!=1.

3. **F03** (P3) the cited Mathlib name `CategoryTheory.DerivedCategory` does not exist at the pin

   **Location.** README.md:33: "and `CategoryTheory.DerivedCategory` from Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87".

   **Witness.** At Mathlib 6b7abb3, that file declares `def DerivedCategory` at line 87 at top level. The file only has `open CategoryTheory` (line 67), and its first `namespace` is `DerivedCategory` at line 90. The fully qualified name is `DerivedCategory`.

   **Repair.** Replace `CategoryTheory.DerivedCategory` with `DerivedCategory` in README.md:33.

4. **F04** (P3) Checks without a discriminating input

   **Location.**
   - README.md:259: "For X=Spec k⊔Spec k ranks remain a pair (2,1), rather than their sum 3."
   - README.md:301: the same wording for Spec k⊔ℙ¹.
   - README.md:415: "An identity refinement acts as 1 on H⁰ of a point and as 0 on the zero complex".

   **Witness.**
   - Lines 259 and 301 name no K-class, so the value (2,1) cannot be evaluated. The class [O_X] gives (1,1).
   - Line 415 holds for every functor, including a wrong refinement comparison. §3.4 is left with two discriminating Checks (lines 416–417), fewer than three.

   **Repair.**
   - Line 259 becomes: "For X=Spec k⊔Spec k and x=([k²],[k])∈K₀(X)=ℤ², ch₀,₀(x)=(2,1), not 3. The class [O_X] gives (1,1)."
   - Line 301 becomes: "For X=Spec k⊔ℙ¹ and x=([k²],[O_ℙ¹]), the weight-zero degree-zero component is (2,1), and CH¹(X,0)⊗ℚ=0⊕ℚ."
   - Replace line 415 with: "On 𝔾_m², let W′ be the blowup of (ℙ¹)² at (0,0), with chart x=e, y=eu. The comparison sends log|x| to log|e|, which is logarithmic along the exceptional divisor. Both restrict to log|x| on 𝔾_m², with value log 2 at (2,3). A comparison by the swap log|x|↦log|y| would give log 3."

5. **F05** (P3) process narrative and an incomplete crosswalk of consumer labels

   **Location.**
   - README.md:709: "The requested M.8 motivic character and number-field Deligne normalization are …".
   - README.md:713–721: "The requested interface labels have the following mathematical meanings; …", followed by the table.

   **Witness.** The table exists only because consumers cite sections that do not exist here:
   - TauCetiRoadmap/Polylogarithms/README.md:37 at 4696a1a cites "MotivicEtaleKTheory §4.2", and line 121 cites "Layer 4", "§9.1" and "§12.2".
   - The table is already incomplete: packages/KatoEulerSystems/README.md:153 and :1013 at 725fd74 cite "§12.1" and "§12.2", which are absent from it.

   **Repair.**
   - Delete README.md:713–721.
   - In README.md:709, replace "The requested M.8 motivic character and number-field Deligne normalization are" with "The motivic character and number-field Deligne normalization used by ZagierConjecturePolylogarithms M.8 are".
   - Add the consumer bullet: "**KatoEulerSystems.** Its §3.4 uses §2.4 (ch₂,₂=−c₂,₂) and §§7.2 and 7.4 on smooth projective curves."
   - The consumers re-point their citations to §§1.1–1.4, 2.1–2.4, 6.1–6.3, 7.2 and 7.4.

## Verified sound

**Counts.**
- Declarations read: 0. Suggested.lean has a module docstring, `namespace TauCetiRoadmap.MotivicEtaleKTheory` and nothing else.
- Targets read: 27 (§§1.1–7.4), plus the two declared gap contracts.
- Locators verified against the cached texts: 81 (Levine94 17, BF 21, BFT 8, BKK 18, Burgos94 9, DeligneHodgeII 7, KLM 1).
- Pinned declarations checked at the pins: Mathlib 11 (10 correct, R03), Tau Ceti 8 (all correct at the cited lines).
- Checks read: 114 (≥3 per section). 92 recomputed with values (table below); the rest are boundary or convention statements, checked for mutual consistency.
- Supplier and consumer citations checked: 74 sections or named exports across 14 roadmaps, at main 6f49035 (the content checkout) or at the open heads in the index of 2026-10-24.

**Suggested.lean.**
- With zero declarations, the `#check @name` audit is vacuous. No Lean was run: the brief gives no Lean command for this pass, and the file has nothing to elaborate.
- The docstring names 14 headline groups as not statable, each with the missing carrier. None is stated through a stand-in.
- I probed whether the most algebraic headlines (§3.3 BKK Proposition 5.12; §4.1 Leibniz and graded commutativity) are statable. They need a Dolbeault-complex carrier and D(A,p) as a cochain complex whose d²=0 must be proved, including the −2∂∂̄ critical degree. That is not a simple definition, so the docstring's classification holds.
- There is no `set_option` and no `lemma`. The file imports only Mathlib.

**Dependency check (verbatim).**

```text
depcheck: 29 roadmaps, 261 edges, 0 problem(s)
```

There are no UPWARD, CYCLE or moved lines. Every supplier precedes position 87 of ORDER.txt, and every consumer (ZagierConjecturePolylogarithms 116, ColemanIntegration 155, BorelRegulators 167, MixedHodgeModulesAndIrregularHodgeTheory 181, Polylogarithms 225) follows it.

**Supplier sections confirmed to exist with the cited content.**
- KTheoryFiniteLocalFields §3.0a (`motivicCycles`, `motivicToK`) and §6.10 (`diagonalChernMilnor`, coefficient (−1)^(n−1)(n−1)!).
- MotivesAndAlgebraicCycles §§4.7, 4.8, 4.8a, 4.14, 4.17, 4.18.
- SchemeKTheoryOperations §§2.1–2.6, 3.1–3.6, 4.3, 6.1, 6.7–6.9 (Riou several-variable uniqueness at its line 2106), 7.1–7.3.
- GeneralAlgebraicKTheory §§3.12, 4.6, 4.8, 4.14, 6.3, 7.4–7.7, 8.12–8.13. §8.13 gives ∂(x·y)=∂x·y and δₙ=(−1)^(n−1)∂ₙ, which matches B{2,t}=−[2] with uniformizer-last value [2].
- SchemeAndStackFoundations §§2.1–2.2, 4.12, 4.17, 5.1–5.8.
- ResolutionOfSingularitiesCharacteristicZero §§5.1–5.6, 6.1–6.4 (`sncCompactification`); §5.5 covers non-quasi-projective finite type.
- EtaleCohomologyFoundations §§G.1–G.3.
- ComplexComparisonPartII §§C−1.1, C−1.4, C5.1, C5.3–C5.6, C6.0 (`regularSingularDeRhamComparison`, `properPureHodge`, `relativeHodgeBundles`).
- EnhancedDerivedSheaves §§0.1–0.4, E0.6, E1.4, E2.6.
- DifferentialGeometry Layers 0–1 and 5–9.
- ComplexKahlerGeometry K1–K2.
- AlgebraicTopology Stages 2–3, Stage 6 items 1–4, and Stage 8 item 2 (`simplicialGroupKan`, `simplicialGroupMooreHomotopyIso`).
- ComplexManifolds Milestones 1–2.

Consumer sections also exist: Polylogarithms §§5.2–5.18, ColemanIntegration L3.Fa.1–3 and L3.Fc.1, BorelRegulators §§6.0a–6.2.

**Ownership.**
- The duplicate constructions are in BorelRegulators §6.0a, ColemanIntegration L3.Fa.2 (`cubeRelK`, which SchemeKTheoryOperations README line 2403 assigns to ColemanIntegration) and Polylogarithms §5.2 (D_A, D_{A,Z}, Hᵖ). They were settled as F02–F04, not actionable in this package, and that reason still holds: all three roadmaps come later in the order, and this README already states the supply direction.
- Siblings searched by object (Deligne complex, higher Chow, cubical, multi-relative, semipurity, Chern character): only BorelRegulators and Polylogarithms overlap, as above.
- Board packages searched by object: PeriodsAndSpecialValues, EllipticKTheory, PadicHodgeRegulators and GrossZagierAndArithmeticHeights have no overlap. KatoEulerSystems is a consumer (R05).

**Declared gaps.**
- Both slugs match between design/plan.json and README.md:83 and :91.
- Each `needs` sentence is precise. smooth-whitney-extension defines its Whitney condition; flat-ideal-regular-situation names the real-analytic hypothesis of Burgos94 Theorem 3.5.
- Neither is already provided: the pinned trees contain only Mathlib/Geometry/Manifold/WhitneyEmbedding.lean and Tau Ceti's WeakWhitney.lean (a topology on spaces of smooth maps), and DifferentialGeometry on main has no Whitney extension.

No suspicious instructions were found in any fetched text.

### Adversarial record (one row per statement)

| Statement | Instances | Values computed (both sides) | Result |
| --- | --- | --- | --- |
| Conventions: ∂□, mixed totalization, Jₙ | bidegree (1,1); n=0,1,2 | cross terms −∂□∂Δ+∂Δ∂□=0; J=1,−1,1; T∘(∂□+(−1)ⁿ∂Δ)=(−1)^(n−1)∂□+∂Δ=(δ+(−1)ⁿ∂Δ)∘T | sound |
| Pair fiber vs Mathlib cone | general f; 0→ℝ[0] | Mathlib (inl_v_d, line 261) d(f,g)=(−df,φf+dg); after [−1]: (df,−φf−dg); conjugating by (f,g)↦(f,−g) gives (df,φf−dg); fiber in degree 1 | sound |
| 1.1 normalized cubical cycles | X=𝔸¹,p=1; Spec k,p=0; ℙ¹→pt | ∂□Γ_t=[0]−0, δΓ_t=−[0]; normalized ℤ,0,0,…, unnormalized Hₙ=ℤ for all n; codimension 0+0−1=−1 ↦ 0; BF line 389, 632 normalize by ker δ¹ (the ∞ face) | sound |
| 1.2 mixed complex | (1,1); total degrees 0, 2 | coefficients −1, +1; 1 and 3 summands; multiplier −1,+1,−1 | sound |
| 1.3 integral comparison | p=0 point; ℤ/2⊗ᴸℤ/2; Z=∅, X | BFT line 961 (integral, quasi-projective equidimensional); Tor₁ in degree −1; fib(id)=0, fib(C→0)=C | sound |
| 1.4 operations | 𝔽₂(t)/𝔽₂(t²); Spec k⊔ℙ¹ | f₊f*=[𝔽₂(t):𝔽₂(t²)]=2; CH¹=0⊕ℤ, CH⁰=ℤ²; exchange sign (−1)^(1·1)=−1 | sound |
| 2.0a cube K-theory | ℙ² at n=0; ℤ[i]⊗ℤ[i]; z=t/(t−1); ℤ_p; ℤ₃ with t=2 | ψ²h=2h−h², ψ²h²=4h²; eigenvector h+h²/2, lattice index det[[2,1],[0,1]]=2; v(v+2i) with (1+i)²=2i ⇒ relation in m², cotangent dimension 2 > dimension 1; t=0,∞,1 ↦ z=0,1,∞; π₀fib(K→K⊕K)=K₁(ℤ_p)=ℤ_p^×; 2∈ℤ₃^× ⇒ faces untouched; ψ²{u,v}=4{u,v} | sound |
| 2.0b motivic Chern classes | ℙ², O(1)⊕O(−1); Milnor degrees 1–3; k=𝔽₂ | c₂=h·(−h)=−h², ch₂=(h²+h²)/2=h²; (−1)^(n−1)(n−1)!=1,−1,2 ⇒ ch_{n,n}=1; specialization point missing in 𝔸¹∖{0,1} over 𝔽₂ | R02 |
| 2.1 character | ℙ¹ O(1)⊕O(−1); Spec ℚ, unit 2 | ch=(1+h)+(1−h)=2, c=1−h²=1; inverse needs §2.2's bijectivity | R01 |
| 2.2 weights | ψ² eigenvalues; {2,t} on 𝔾_m | differences −1,−3,−2; tame residue of {2,t} (uniformizer last) = 2; ∂({t}{2})=[2] ⇒ ∂{2,t}=−[2], δ₂=−∂₂ gives [2] | sound |
| 2.3 supports, regular X | L=𝔽_ℓ(t)[s]/(s^ℓ−t), ℓ=2,3; (𝔸¹,{0}); V(xy) | d(s^ℓ−t)=ℓs^(ℓ−1)ds=0 ⇒ Ω¹=L ds≠0; L⊗L=L[ε]/ε^ℓ; d(Γ_t,0)=([0],Γ_t\|U), so (0,t)+([0],0) is a boundary; −δ_raw(t)=+[0]=ch_Z(B[t]); Levine94 line 1405 states Theorem 3.4 for regular X | sound (source gap recorded) |
| 2.4 products | p=1,2,3; ℙ¹ | (−1)^(p−1)/(p−1)!=1,−1,1/2; ch(1−O(−1))=1−e^(−h)=h; ξ²=0=h² | sound |
| 3.1 log Dolbeault algebra | punctured disk | d log\|z\|²=dz/z+dz̄/z̄; BKK line 4217 generators log z z̄, dz/z, dz̄/z̄; Burgos94 line 163 image of the tensor map | sound |
| 3.2 filtered comparison | 𝔾_m⊂ℙ¹; blown-up (ℙ¹)²; f log\|z\|²/(zw̄) | weight of dz/z = 1+1 = 2 (W[n]_m=W_(m−n), DeligneHodgeII line 1147); dimensions 1,2,1; at (−2,1): e^(−1/4)·log 4/(−2) | sound |
| 3.3 Deligne model | A=ℂ, p=0,1,−1; x=\|z\|²; z=3+4i | D¹(A,1)=A_ℝ⁰(0)=ℝ; fib(ℝ(−1)⊕ℂ→ℂ): H⁰=ℝ(−1), H¹=0; ∂∂̄(z z̄)=dz∧dz̄; quotients 3, 4i, 3; ψ(0,0,log 2+iθ)=Re=log 2; ϕ, ψ, h agree with BKK line 4063–4111 | sound |
| 3.4 compactification independence | 𝔾_m² two compactifications; pt⊔ℙ¹ | periods (2πi,0),(0,2πi), product (2πi)²; H⁰_D=ℝ² | sound except Check 415 (R04) |
| 4.1 product | log 2•log\|t\|; \|z\|²•1; 1•log 2; tℝ[t] | r_p(x)=∂x−∂̄x since conj ∂x=(−1)^(p−1)∂̄x; (log 2/2)(dt/t−dt̄/t̄)=i log 2 darg t; −z̄dz+z dz̄, d_D=−F^(1,1)d=−2dz∧dz̄=1•d_D x; F^(0,0)(log 2)=log 2; e·t has no t-term | sound |
| 4.2 associativity | Re z·2·3; 2·3·5 | 6 Re z = 6 at z=1; 30; BKK line 4145 vanishing without closedness | sound |
| 5.1 support fibers | 0→ℝ[0]; d² | degree 1; second coordinate res dω−d(res ω−dg)=0 | sound |
| 5.2 semipurity | 𝔸² with V(xy), cusp, origin; f=t | H^a_Z=0 for a<2·codim ⇒ H^a_{D,Z}=0; ℝ², ℝ; p=1: 0, p=2: ℝ; ∂∂̄[log\|t\|²]=(2πi)⁻¹(−2πi)δ₀=−δ₀ ⇒ (0,−log\|t\|) has m=1 (BKK line 4847) | sound |
| 5.3 auxiliary complexes | ω=Re z₁ dz₂∧dz̄₂ | conj(dz∧dz̄)=−dz∧dz̄ ⇒ ω∈A_ℝ(1); dω=−2i dx₁∧dx₂∧dy₂ ⇒ −2i; BF line 210, 584 canonical truncation | sound |
| 5.4 class map, contraction | point→𝔸¹; (−1)^(ns) | H¹_D(𝔸¹,ℝ(1))=ℂ/ℝ(1)=ℝ; n=s=1 ⇒ −1 | sound |
| 6.1 regulator roof | ℙ¹ O(±1); point | H²_D(pt,ℝ(1))=0 (ℝ(1)→ℂ injective, F¹=0); log\|−1\|=log\|i\|=0 | sound |
| 6.2 restriction homotopies | A=A′=ℤ[0], B′=(ℤ→ℤ), r=f′=h=1 | (1,0)↦(1,1), D′(1,1)=(0,1−1)=(0,0); (1,−1) gives (0,2); defect (f′r−r′f−dh−hd)a | sound |
| 6.3 pullback, embeddings | point→ℙ¹; ℚ→ℂ | H²_D(pt,ℝ(1))=0; log 2 both routes | sound |
| 7.1 Beilinson character | π_(p−1) at 3+4i; S₃ | 3, 4i, 3; w∈ℝ(p) ⇒ π_(p−1)w=0; N₁=1 ⇒ π₀=S₃ | sound |
| 7.2 identification | BF Theorem 3.5 | proof assumes smooth quasi-projective (BF line 919), as README.md:655 says | sound (source issue recorded) |
| 7.3 multiplicativity | units 2,3 at a point; 𝔾_m | H²_D(pt,ℝ(2))=0 (F²=0, ℝ(2)→ℂ injective); periods ±2πi log 2 | sound |
| 7.4 witnesses | u=2,3,1/2,i | log 6=log 2+log 3; −log 2; 0 | sound |
| gap smooth-whitney-extension | A={0}; hyperplane x=0 | k!·(1,1,2)=(1,1,4); (2!)² sin(π/2)=4; exp(−1/x²) has zero jet | sound, declared |
| gap flat-ideal-regular-situation | A={x=0}, B={y=0} | φ(0)+φ(1)=e⁻¹, not in I∞(A)∩I∞(B) | sound, declared |

## Not verifiable

- Bloch86 §7 (uncertified): the arbitrary-field universal Chern construction cited by §§2.0b and 2.2. R02 therefore relies on the read texts (Levine94, BF).
- Beilinson85 (uncertified) and Levine98 (waived): cited as references only.
- KTheoryFiniteLocalFields §6.10 builds "the integral motivic projective-bundle/splitting construction of Chern classes" from K-book V.11.11–11.14. That text was not read, so I could not decide whether it is the same universal-class construction as §2.0b, which would make two owners.
- Burgos94: the text extraction drops displayed formulas, including Proposition 4.1's estimate and the displays of Theorems 3.1 and 3.3–3.5. The README's form of the estimates was checked only against the prose at Burgos94 line 372–389.
- Levine94 line 1769: the OCR repeats a previous display in place of Theorem 4.7's. The statement was read through BFT Proposition 6.12 (BFT line 961).
- Ownership against board packages under review on other pull requests: only the five packages named above were read.

## Source issues

- **Misprint** in BF at Proposition 1.26, printed p.10: the source says the associativity homotopy h takes values in Deligne degree r+s+t; it should be degree r+s+t−1, as its own boundary identity forces; affects nothing.
- **Error** in BF at Theorem 3.5, printed p.20: the source says the Chern-character comparison holds for every equidimensional complex algebraic scheme; it should be for smooth quasi-projective X, as its proof assumes and BFT Theorem 4.7 restates; affects a stated result.
- **Gap** in Levine94 at Theorem 3.4, printed pp.283–284: the source says the supported isomorphism holds for regular X over any field, but its argument needs Theorem 3.1, stated only for smooth X, whose input Theorem 2.7 needs an infinite field; it should be supplemented by Theorem 3.1's proof for regular X and a finite-field descent; affects the proof.
- **Gap** in Levine94 at Corollary 4.8, printed p.297: the source says the inclusion is a quasi-isomorphism for regular X, citing Corollary 3.2, stated only for smooth varieties; it should be supported by the regular form of Theorem 3.1's argument; affects the proof.
- **Misprint** in BKK at Notation 5.8, printed p.111: the source says the projection F^(k,k′) is defined for k,k′≥0, though Definition 5.10 uses it with k=n−p<0; it should be defined for all integers, as the full projection when the indices are ≤0; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "1064583", "job": "RT-MotivicEtaleKTheory~1b", "model": "opus", "worker": "fable-rt7"} -->
