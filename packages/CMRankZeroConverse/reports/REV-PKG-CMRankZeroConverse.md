<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/993#issuecomment-6375366391 -->
Review (claude) of bed9ba8

Verdict: needs changes

1. **F01** (P2) Five statable headlines are omitted from Suggested.lean

   **Location.** `Suggested.lean` lines 24–30: "Congruent-number density one and exact half-density … need the actual twist L-functions. CM twist nonvanishing … need those L-functions, the general CM order interface, and the arithmetic squareclass support-height family." README line 15 says the same.

   **Claim.** README §5.2 (BT Theorem 1.2), §5.3, §5.4, §6.1 (BT Proposition 1.3) and §6.6 are said to be unstatable at the pins.

   **Witness.** The statements below elaborate with default options and only `sorry` warnings, importing Mathlib, the package's two Tau Ceti modules and `TauCeti.FieldTheory.SquareClassGroup.Basic`. Mathlib's `WeierstrassCurve.LSeries` (`LFunction.lean:84`) is the actual Hasse–Weil series, whose entire continuation is unique.

   **Why this is not a stand-in.** `WeierstrassCurve.LSeries` is built from minimal-model local factors (`LFunction.lean:39–79`). The value L(E,1) is stated as "some entire F agrees with `W.LSeries` on Re s>3/2 and F 1≠0". By the identity theorem this F is unique, so this is the actual value. Tau Ceti uses the same device in `HeckeRing.GL2.Newform.analyticRank_eq_analyticOrderNatAt` (`TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:92`).

   The CM hypothesis is stated through the pinned endomorphism ring `TauCeti.Isogeny.Hom`, which the package already uses: over an imaginary quadratic K, an endomorphism ring other than ℤ means CM by an order of K defined over K. The twist index set is `TauCeti.SquareClassGroup` (`TauCeti/FieldTheory/SquareClassGroup/Basic.lean:45`).

   **Repair (tested).** Add these simple definitions and headlines, then rename and add docstrings. All of the following elaborated in that scratch copy. §6.6 is the same statement as §6.1 with `¬ descendsToRat (A.quadraticTwistOf 0 (-u))` added to the numerator. §5.4 is the same shape as §5.3, using the fundamental-discriminant predicate "(d%4=1 ∧ Squarefree d) ∨ ∃ m, d=4m ∧ (m%4=2 ∨ m%4=3) ∧ Squarefree m" over `Finset.Icc (-X) X` with d≠0 and limit 1/2. Add `import TauCeti.FieldTheory.SquareClassGroup.Basic`.

   ```lean
   def LNonvanishingAtOne {K : Type*} [Field K] [NumberField K] (W : WeierstrassCurve K) : Prop :=
     ∃ F : ℂ → ℂ, Differentiable ℂ F ∧ (∀ s : ℂ, 3 / 2 < s.re → F s = W.LSeries s) ∧ F 1 ≠ 0

   def congruentTwist (n : ℤ) : WeierstrassCurve ℚ where
     a₁ := 0
     a₂ := 0
     a₃ := 0
     a₄ := -(n : ℚ) ^ 2
     a₆ := 0

   open scoped Classical in
   theorem congruentNumber_densityOne :
       Tendsto (fun X : ℕ =>
         (((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n ∧ n % 8 ∈ ({1, 2, 3} : Finset ℕ) ∧
             LNonvanishingAtOne (congruentTwist (n : ℤ)))).card : ℝ) /
           ((Finset.Icc 1 X).filter (fun n : ℕ => Squarefree n ∧ n % 8 ∈ ({1, 2, 3} : Finset ℕ))).card)
         atTop (𝓝 1) := by sorry

   noncomputable def squareclassHeight {K : Type*} [Field K] [NumberField K] (t : Kˣ) : ℕ :=
     ∏ᶠ v : IsDedekindDomain.HeightOneSpectrum (𝓞 K),
       if Odd (FractionalIdeal.count K v (FractionalIdeal.spanSingleton (nonZeroDivisors (𝓞 K)) (t : K)))
       then Ideal.absNorm v.asIdeal else 1

   theorem cmTwists_half {K : Type*} [Field K] [NumberField K] [IsTotallyComplex K]
       (hK : Module.finrank ℚ K = 2) (h3 : ¬ (Ideal.span {(3 : 𝓞 K)}).IsPrime)
       (A : WeierstrassCurve K) [A.IsElliptic]
       (hCM : ¬ Function.Surjective (Int.castRingHom (TauCeti.Isogeny.Hom A.toAffine A.toAffine)))
       (ε : ℝ) (hε : 0 < ε) :
       ∀ᶠ X : ℝ in atTop,
         (1 / 2 - ε) * ({c : TauCeti.SquareClassGroup K |
             (squareclassHeight (Additive.toMul c.out) : ℝ) < X}.ncard : ℝ) ≤
           ({c : TauCeti.SquareClassGroup K | (squareclassHeight (Additive.toMul c.out) : ℝ) < X ∧
             LNonvanishingAtOne (A.quadraticTwistOf 0 (-((Additive.toMul c.out : Kˣ) : K)))}.ncard : ℝ) := by
     sorry
   ```

   §5.3 is `congruentNumber_densityOne` with the residue condition dropped and limit `1 / 2`.

   Also:

   - Delete docstring lines 24–30. Rewrite README lines 13 and 15 so that only the Selmer, zeta and regulator headlines are listed as unstatable.
   - Name the new declarations in README §§5.2–5.4, 6.1 and 6.6. Cite `TauCeti.SquareClassGroup`, `FractionalIdeal.count` and `Ideal.absNorm` under the supplier contracts.
   - The same device should make the supporting results §4.4 and §6.5 statable (not elaborated here). Either state them, or stop calling them unstatable in the docstring.
   - `cubeSum_fullCM` and the two-coset theorem are not among the Summary's end theorems. After this repair, the README should say why these two intermediate results stay.

2. **F02** (P2) The newform L-function is at the pins; gap:newform-central-analytic-interface asks for provided objects

   **Location.** README line 47: "Layer 7 … supplies the arithmetic newform L-function, entire continuation and functional equation." Line 49 (gap) asks for "finite central analytic order … with the actual bad-prime factor". `Suggested.lean` lines 18–20 call that L-function missing.

   **Witness.** At the pins: Mathlib `ModularForm.L` (`Mathlib/NumberTheory/ModularForms/LFunction.lean:134`); Tau Ceti `HeckeRing.GL2.Newform.analyticOrderAt_L_ne_top` (`TauCeti/NumberTheory/ModularForms/Newforms/AnalyticInvariants.lean:72`), `analyticRank` (`:80`) and `L_eulerProduct` (`…/LFunction/EulerProduct.lean:217`, with factor (1−a_p p⁻ˢ)⁻¹ at p∣N).

   **Repair.**

   - Cite these declarations under "From Mathlib" and "From Tau Ceti", in place of ModularForms Layer 7 (which they implement). Add also `CuspForm.differentiable_L` (`Mathlib/NumberTheory/ModularForms/LFunction.lean:190`), `HeckeRing.GL2.Newform.analyticRank_eq_zero_iff` (`AnalyticInvariants.lean:107`), `frickeCompletedL_functional_equation` (`…/LFunction/FunctionalEquation.lean:324`) and `CuspForm.conj` (`TauCeti/NumberTheory/ModularForms/Conjugate.lean:298`).
   - Narrow the gap to what is missing: L(f*,h)=conj L(f,h) for `CuspForm.conj` and every coefficient embedding, the removed-Euler-factor identity on all of ℂ, and compatibility with the theta-series L-function.
   - Change docstring lines 18–20 to list only the zeta morphism, the Bloch–Kato Selmer carrier and the CM-newform predicate.

3. **F03** (P2) gap:cm-rational-kato-equality names a supplier whose scope excludes it; an earlier owner plans it

   **Location.** README line 93: "What KatoEulerSystems must provide (gap:cm-rational-kato-equality): … char_A H²_Iw=char_A(H¹_Iw/Z(f)) for the full cyclotomic Kato complex". README §3.3 *Needs* (line 335) and Scope line 11 depend on it.

   **Witness.** KatoEulerSystems (board head 725fd74), "Not in this roadmap": "any main-conjecture equality" and "the CM main conjecture beyond the elliptic-unit input". ModularIwasawaMainConjecturesPartII (merge-order line 215) §CZ.6 plans `cm-kato-main-conjecture` (BT Theorem 2.6), with a dictionary "exported to CMRankZeroConverse".

   **Repair.**

   - Change the gap's `supplier` in `plan.json` to ModularIwasawaMainConjecturesPartII, section CZ.6. Use CZ.4 for the rational equivariant input. Alternatively, cite CZ.6 directly as a supplier section and keep a gap there only for anything CZ.6 lacks (for example conductor factors).
   - Move the paragraph to a "From TauCetiRoadmap.ModularIwasawaMainConjecturesPartII" subsection.
   - Add this owner to Scope line 11 next to the anticyclotomic roadmaps.
   - Rerun the dependency check. Line 215 is earlier than 281, so no UPWARD line appears.

4. **F04** (P2) gap:cube-sum-full-cm asks for Mathlib facts and for this roadmap's own headline

   **Location.** README line 103: "identify the origin-fixing automorphism (X,Y)↦(ζ₃X,Y) of §6.2 with an injective ℤ[ζ₃] action and full CM by that maximal order, with discriminant −3 and ramification of three."

   **Witness.** Mathlib `IsCyclotomicExtension.Rat.discr_odd_prime'` (`Mathlib/NumberTheory/NumberField/Cyclotomic/Basic.lean:56`; value −3 at p=3) and `map_eq_span_zeta_sub_one_pow`, `ramificationIdx_span_zeta_sub_one` (`…/Cyclotomic/Ideal.lean:106,124`) give (3)=(ζ−1)². The rest is `cubeSum_fullCM` on this roadmap's model: two owners.

   **Repair.**

   - Restate the needs generally: "for every elliptic curve with j=0 over a characteristic-zero field containing a primitive cube root of unity, its endomorphism ring over that field is the ring of integers of ℚ(ζ₃), via (x,y)↦(ζx,y) and the characteristic-zero classification of endomorphism rings".
   - Delete the discriminant and ramification clause and cite the Mathlib names, adding `absNorm_span_zeta_sub_one` (`…/Cyclotomic/Ideal.lean:83`, norm 3).
   - Keep `cubeSum_fullCM` as the specialisation in §6.3, through j(cubeSumModel n)=0.

5. **F05** (P2) gap:pointed-cubic-model-comparison bundles two objects, and its second half is at the pin

   **Location.** README line 63: "export the pointed smooth-projective model comparison for the invertible linear substitutions in §6.2 … and the j=0,1728 coefficient classifications over arbitrary characteristic-zero fields". Line 59 claims EllipticCurves Layers 1 and 5 supply them.

   **Witness.** Tau Ceti `WeierstrassCurve.variableChange_a₄_of_isShortNF` and `variableChange_a₆_of_isShortNF` (`TauCeti/AlgebraicGeometry/EllipticCurve/NormalForms.lean:131,140`) scale a₄ by u⁻⁴ and a₆ by u⁻⁶ between short forms, which gives both classifications. EllipticCurves Layer 5 (main) states no explicit sextic or quartic classes.

   **Repair.**

   - Delete the second clause. Cite these two lemmas and `WeierstrassCurve.smul_shortCurve` (`TauCeti/AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean:168`) in "From Tau Ceti" and in §6.4's *Needs*.
   - Correct line 59: EllipticCurves Layer 5 on main states the general pointed-twist classification and quadratic twists only.
   - Restate the first clause generally: an invertible projective linear map that sends a smooth plane cubic with a marked rational point to a Weierstrass cubic, origin to origin, gives a pointed isomorphism. Alternatively, own the explicit §6.2 comparison here, as Scope line 7 already says.

6. **F06** (P2) gap:elliptic-quadratic-analytic-identities asks for Mathlib's additivity of analytic order

   **Location.** README line 55: "…equality of all local factors under isogeny, finite analytic order and its product additivity, and the congruent-number root numbers…".

   **Witness.** Mathlib `analyticOrderAt_mul` and `analyticOrderNatAt_mul` (`Mathlib/Analysis/Analytic/Order.lean:523,528`) state additivity of the order for a product of analytic functions. The needs also bundles four separate theorems.

   **Repair.** Delete "and its product additivity" and cite the two Mathlib names in "From Mathlib" and in §4.4's route. Keep the base-change factorization, the isogeny local factors, finite order and the root numbers.

7. **F07** (P3) A downstream consumer that comes earlier in the merge order

   **Location.** README line 562: "RankOneConverse can use the shared rank-r implication of §0.1". Line 7 makes the same point.

   **Witness.** In `ORDER.txt`, RankOneConverse is at line 251 and CMRankZeroConverse at line 281. The RankOneConverse design never cites this roadmap. The RankZeroOneBSDPartII design (line 282) imports `CMRankZeroConverse:C.0/p-converse-property`.

   **Repair.** Name RankZeroOneBSDPartII as the consumer of §0.1. Drop "shared" for RankOneConverse; keep its rank-one deferral.

8. **F08** (P3) The §6.6 locator overstates the source

   **Location.** README line 546 (§6.6), with the locator "(BT Remark 3.6(ii), p. 7; BT lines 279–282.)".

   **Witness.** BT lines 279–282 claim only that a positive proportion of twists do not descend and have analytic rank zero. The bound of one half comes from this README's §§6.1 and 6.5.

   **Repair.** Append to the locator: "the source states a positive proportion; the one-half bound is derived here from §§6.1 and 6.5".

9. **F09** (P3) `cubeSumModel` restates a pinned carrier

   **Location.** `Suggested.lean` lines 41–47: a five-field structure with a₆ := −27n².

   **Witness.** Tau Ceti `WeierstrassCurve.shortCurve` (`TauCeti/AlgebraicGeometry/EllipticCurve/ShortWeierstrass.lean:109`) is y²=x³+Ax+B. Its coefficient lemmas are proved by `rfl`.

   **Repair.** Use `def cubeSumModel (n : ℤ) : WeierstrassCurve ℚ := WeierstrassCurve.shortCurve 0 (-27 * (n : ℚ) ^ 2)`, add `import TauCeti.AlgebraicGeometry.EllipticCurve.ShortWeierstrass`, and cite the carrier in README §6.2. That module has no object file in the shared build: run the targeted `lake build` of it before elaborating. This repair is not tested here (see Not verifiable).

10. **F10** (P3) gap:theta-induction-arbitrary-cm-curve misdescribes CM §4.2

   **Location.** README line 101: "extend §4.2 from curves over ℚ to actual weight-two theta forms … and full arithmetic factorization L(A/K,s)=L(f_η,s)L(f_η̄,s)".

   **Witness.** In ComplexMultiplicationAndExplicitReciprocity §4.2, `ellipticCMLFactorization` is already stated for A/K with CM over K and every prime, as L(A/K)=L(ψ)L(ψ̄). Only `cmInductionComparison` is for A/ℚ.

   **Repair.** Ask only for weight-two theta newforms f_ψ, f_ψ̄ with L(f_ψ,s)=L(ψ,s) and M_f(1)⊗L=Ind ψ̄, for A that need not descend to ℚ. Cite `ellipticCMLFactorization` for the factorization.

11. **F11** (P3) The list of cyclotomic CM fields omits ℚ(√−2)

   **Location.** README line 89: "for imaginary quadratic K these include ℚ(i) at two and ℚ(√−p) for p≡3 mod 4". §3.3 Checks.

   **Witness.** ζ₈+ζ₈³ = i√2, so ℚ(√−2) ⊂ ℚ(μ₈) is also covered by Kato §15.14 at p=2.

   **Repair.** Add ℚ(√−2) at p=2 to line 89 and as a Check in §3.3.

Scope of this review: `packages/CMRankZeroConverse/README.md`, `Suggested.lean`, `metadata.toml`, `sources.toml`, with `design/plan.json` read for the declared gaps. No previous review exists, so every section was reviewed in full. Eleven findings: six blocking (P2), five P3. No P1.

## Adversarial table

| Statement | Instances tried | Values computed (statement side / test side) | Result | Change |
| --- | --- | --- | --- | --- |
| Conv.: geometric Frobenius polynomial on M_f | k=2, E/ℚ, H¹=V_p^∨ | Kato (14.10.2): det M_f=κ¹⁻ᵏε⁻¹=κ⁻¹. Geometric eigenvalues α,β give X²−a_ℓX+ℓ. Arithmetic Frobenius would give (1−u/α)(1−u/β) | agrees with AGR §1.5 | none |
| Conv.: W′=W^∨(1)=M_f*(h) | k=4, h=2 | 1−k+h=−1=1−h. A twist of h−1 would give M_f^∨(−2) | sound | none |
| Conv.: φ=p⁻¹ on ℚ_p(1) | PHR §0.1 | φ(t)=pt, d₁=t⁻¹⊗v, so φ(d₁)=p⁻¹d₁ | sound | none |
| Conv.: height H(t)<X empty at X≤1 | H≥1 | {H<1}=∅ | sound | none |
| §0.1 rank-r p-converse (def) | (corank, an. rank)=(0,0),(0,1); y²=x³−x | r=0: true, false. r=1 on (0,1): vacuously true. E(ℚ)=(ℤ/2)² gives dim Sel₂≥2 at corank 0 | sound | none |
| §0.2 central sign and projection (def) | k=0,1,2,3,4,6; ℤ₂ swap | ε=1,1,1,1,−1,1. k=0→4 gives 1→−1, so k≥2 is needed for k↦k+4. Pε(1,−1)=(1,0) at k=2, (0,−1) at k=4. Swap: (1,0)↦(½,½)∉ℤ₂² | sound | none |
| §0.3 dictionary Checks | k=2, αβ=ℓ | det M_f(1)=κ. Twisted geometric roots α/ℓ, β/ℓ, product 1/ℓ. Arithmetic Frobenius gives det ℓ | sound | none |
| §0.4 central prime (def) | p=2, h=1,2; p=3, c=4 | ev(σ₋₁)=−1 at h=1 and 1 at h=2; σ₋₁∓1↦0 or ∓2; 4⁻¹=¼∈ℤ₃. Semilinear check: aug(Tw(σ_c x))=c⁻ʰ·aug(Tw x), so the kernel is σ_c−c⁻ʰ (BT line 240). Kato (12.1.4): A_𝔮 is a DVR since p∉𝔮 | sound | none |
| §1.1 H⁰(M_f(r))=0 | V_pE, 1⊕χ | h⁰(V_pE)=0 (torsion finite); h⁰(1⊕χ)=1 is excluded | sound | none |
| §1.2 Selmer zero ⇒ H²=0 | dual sequence for W′ | quotient 2−1=1; Euler 0−h¹+0=−1 gives h¹=1, so H_f(W′)=0 and H²(W)↪H²(ℚ_p,W)=0. Control: quotient 0 would leave kernel 1 | sound (fills BT step, see Source issues) | none |
| §1.3 global line | diag(1,−1); zero rep | dim W^{c=−1}=1 gives h¹=1; zero rep gives 0 | sound | none |
| §1.4 H_g=H_f | good / Steinberg moduli; ℚ_p(1) | p^{(k−1)/2−h}=p^{−½}; p^{(k−2)/2−h}=p^{−1}; at p=2: 0.707, 0.5. ℚ_p(1): h¹=2, h¹_f=1, h¹_g=2 | sound | none |
| §2.1 control with Tor | complex R→R by π | H²=R/π; after ⊗^L R/π, H¹=R/π has length 1 | sound | none |
| §2.2 specialised zeta class (def) | h=1,2 | KES §5.1 z(ιγ)=−σ₋₁z(γ) gives −(−1)ʰ=ε. If cγ=−εγ then −εz=εz, so z=0 | sound | none |
| §2.3 basis | DVR R/π | char(R/π)=(π) is not a unit, so length 0 forces Z_𝔮=H¹_𝔮 | sound | none |
| §2.4 not finite at p | zero vs nonzero class | a nonzero basis class is not in H_f=0 | sound | none |
| §3.1 reciprocity | k=2,4,6; P_p=0 | (2πi)^{h−1}: 1, 2πi, (2πi)², signs +,−,+. P·L≠0 forces L≠0 | sound (Kato 12.5(1) sign at r=h) | none |
| §3.2 / §3.3 converse | ℚ(i), p=2; ℚ(ζ₃), p=3; ℚ(√−7), p=7; ℚ(√−2), p=2 | all in Kato §15.14's case; ℚ(√−2) is unlisted | sound | R11 |
| §4.1 typed comparison | Weil pairing | ηη̄=χ_cyc gives η̄=η^∨(1); det Ind(η⊗χ)=det Ind η·χ² | sound | none |
| §4.2 converse over K | a,b≠0 | ab≠0 | sound | none |
| §4.3 corank doubling | ℤ₂² swap | projector images (1,1),(1,−1); det −2, so index 2 | sound | none |
| §4.4 order doubling | (s−1)ʳu(s), r=0,1,2 | squared orders 0,2,4; Mathlib `analyticOrderAt_mul` | sound | R06 |
| §4.5 converse over ℚ | 2r=0 in ℕ | r=0 | sound | none |
| §5.1 even Goldfeld (def) | ratios 1, 0, 3/4 | each fails the limit ½ | sound | none |
| §5.2 density one | residue counts | odd squarefree 4/π² over 4 classes, even 2/π² over 2, so 1/π² each; #S=3X/π². Smith products −1,2,2 are non-squares | sound; statable | R01 |
| §5.3 exact half | #P=6X/π² | (3/π²)/(6/π²)=½ | sound; statable | R01 |
| §5.4 discriminant ordering | n=1,2,3 | d=1,−4; 8,−8; 12,−3. Weights 5/4+½+5/4=3 out of 4·5/4+2·½=6 (matches ASI §0.1 Check) | sound; statable | R01 |
| §6.1 CM twists | ℚ(i), ℚ(ζ₃) | 3 inert in ℚ(i); height-one classes [1],[i]. BKLOS lines 80–84 height | sound; statable | R01 |
| §6.2 `cubeSumModel` (def) | n=1,−1,3,0; random integer tests | Δ=−314928=−2⁴3⁹; n=3: −25509168; n=0: Δ=0. (1,1)↦(3,0) and (−1,−1)↦(3,0). G∘fwd=108n²F, F∘inv=54nG, composites ×18n (2000 tests). Origin ↦[0:18n:0]. a₆=−432 fails at (3,0) | sound | R09 |
| §6.3 `cubeSum_fullCM` | n=0; field ℚ, ℚ(i) | α³=1, α≠1 gives 1+α+α²=0 in a domain; identity gives 3. End over ℚ or ℚ(i) is ℤ, so base change to ℚ(ζ₃) is needed. n=0: ∃IsElliptic is false, so hn is needed. 7 one-tactic probes fail | true | R04 |
| §6.4 `descendsToRat` (def) | y²=x³−x over ℚ(i); y²=x³+x+(1+i) | C=1 descends; j=6912/(4+54i)∉ℚ, so it does not descend | sound | none |
| §6.4 `descendingTwist_twoCosets` | ℚ(√−2), t=√−2; ℚ(√−3), t=√−3; D=4 in ℚ(√2) | twist a₄=32, which is ≅X³+2X and rational; √−2∉ℚ×K×², so branch 2 is needed. j=0: s³∈ℚ×K×⁶ gives s∈ℚ×K×²; √−3 does not descend. D=4: θ=2∈ℚ, and the √2-twist descends with √2∉ℚ×K×², so the statement would fail; D<0 excludes it. Probes fail | true | none |
| §6.5 O(√X) | ℚ(i) | H([5])=25, H([3])=9, H([2])=1; H≥c·n_out² | sound | none |
| §6.6 non-descending | C√X loss | ½−(C/c)/√X→½; the restricted denominator is ≤ the full one | sound | R08 |
| 13 declared gaps | plan.json vs README | 13/13 slugs agree; all suppliers named and earlier | R02–R06 and R10 raise needs issues | as stated |

## Verified sound

- **Principles.** No route shortcut: the converse is all-prime and the non-CM converse is conditional. No re-planned roadmap. A 7-word-shingle comparison with BT, Kato and BKLOS matched only titles, so no passage is copied. No algorithms, no sorry'd data, no `set_option`. The single `import Mathlib` is followed by two used Tau Ceti modules.
- **Dependency check:** `depcheck: 27 roadmaps, 241 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line.
- **Elaboration.** `lake env lean` on `Suggested.lean` exits 0 in 6.4 s. The only warnings are "declaration uses `sorry`" at lines 53 and 76.
- **Binders.** `#check @` of all four declarations: `descendsToRat` keeps `[Field K] [Algebra ℚ K]`. The two-coset theorem keeps `IsQuadraticExtension`, D<0, θ²=D, `[W.IsElliptic]` and both descent hypotheses. `cubeSum_fullCM` binds n and hn. These match README §§6.2–6.4. Nothing changed.
- **One-tactic probe.** `simp`, `rfl`, `infer_instance`, `trivial`, `norm_num`, `aesop` and `decide` were tried on both theorems. All 14 attempts fail, so there is no padding.
- **Pinned citations (17/17 lines correct).** Weierstrass.lean:76,86,131,230,366,388; NumberField/Basic.lean:101; Cyclotomic/Basic.lean:652; LFunction.lean:79,84; Newform.lean:104; CompletedGroupAlgebra/Basic.lean:145; QuadraticTwist/Basic.lean:169,411,739; Isogeny/Hom/Basic.lean:106; Hom/Ring.lean:174.
- **Cross-roadmap citations resolved.** All cited sections exist at the copy named:
  - AutomorphicGaloisRepresentations §§1.5, 3.15, 4.4–4.8, 6.4, 7.2 (open PR head 81e9d0f).
  - SelmerIwasawaCohomology §§2.4, 2.10–2.12a, 2.19, 2.20, 3.0, 3.7, 3.10, 3.13–3.16, 4.9, 4.26, 4.29.
  - ArithmeticGaloisDuality R02.4.3, R02.4.4, D7.3 (compact Shapiro), D7.5–D7.7.
  - ArithmeticStatisticsPartI §§0.1 (piecewise rescaling, with the 5/4+½+5/4 Check), 0.2, 0.5–0.7, 0.15.
  - ArithmeticStatisticsPartVII §§5.9–5.11.
  - ComplexMultiplicationAndExplicitReciprocity §§1.1–1.2, 4.1–4.2.
  - EllipticCurveModularity R29.6.
  - EllipticCurves Layers 1, 5 and 7, and ModularForms Layer 7 (both on main).
  - KatoEulerSystems §§2.2, 4.4, 4.6, 5.1 (z(ιγ)=−σ₋₁z(γ)), 5.3, 7.2 (board head 725fd74).
  - PadicHodgeRegulators §§0.1, 1.1, 1.4–1.8 (board head 5eff35d).
  - The resolver's two "found nowhere" leads are these two board packages, so both are false leads.
- **Ownership against open work.** Checked by object with `roadmaps grep` over main and the 330 open heads, and in the board designs: p-converse, Goldfeld, cube-sum, descent, rank-zero converse, elliptic units and Johnson-Leung. Two results came up: R03, and the RankZeroOneBSDPartII import in R07. No duplicate Lean name exists.
- **Shape.** Every layer ends with Examples and Dependencies. All seven definitions have API lists and at least three Checks. There is no LaTeX, no process wording and no machine path. All 13 gaps are declared in both `plan.json` and the README.
- **Sources sample (15 targets).** All locators were read and the source supports each statement as written, except §6.6 (R08):
  - 0.1: BT line 33.
  - 0.2: BT line 235 and Kato lines 4053–4071.
  - 0.4: BT line 240.
  - 1.2: BT lines 231–234; Kato lines 4771–4790 and 4832–4849.
  - 1.4: Kato lines 4807–4812.
  - 2.3: BT lines 208–218 and 240–244.
  - 4.1 and 4.2: BT lines 39–42 and 253–259.
  - 4.3 and 4.5: BT lines 260–261.
  - 5.4: BT lines 47–52 and ASI §0.1.
  - 6.1: BT lines 58–60 and 273–275; BKLOS lines 196–198, 654–661 and 831–879.
  - 6.2 and 6.3: BT lines 277–278, with the algebra recomputed.
  - 6.6: BT lines 279–282.
  - No locator was flagged as unverified.

## Not verifiable

- **Kato (14.10.3) and the §14.13 evaluation exponent.** The OCR at Kato lines 4801 and 4864–4865 garbles the exponent on Fr_ℓ and on c. The README's conventions agree with Kato (14.10.2), AGR §1.5, BT line 240 and the semilinear computation above.
- **BT published numbering.** The published Annals numbering was not opened. The manifest uses arXiv v2 throughout, which is consistent.
- **RankZeroOneBSD.** The Summary names it as the base. It is not on main, at the open heads or in the board index. The board's job issues were not searched, to spare the shared REST quota. Nothing is consumed from it.
- **Unbuilt Tau Ceti modules.** ShortWeierstrass, NormalForms, AnalyticInvariants and LFunction/EulerProduct have no object files in the shared build. Their declarations were read in source at the pin, not elaborated, and R09's repair is untested for that reason.

## Source issues

- **Misprint** in BT at proof of Theorem 1.1, p. 6: the source says (line 256) the dual p∞-Selmer group tensored with the number field K matches Selmer groups of V(f), V(f̄) without central twist; it should be a dimension identity over K_λ for V(f)(1) and V(f̄)(1); affects the proof.
- **Gap** in BT at proof of Theorem 3.1, display (3.1), p. 6: the source says (lines 232–234) Selmer vanishing for f gives rational H² vanishing directly from Kato (14.9.3), whose middle term is the dual (f*) Selmer group; it should be preceded by a Poitou–Tate and Euler-characteristic step proving that dual Selmer group vanishes; affects the proof.
- **Gap** in BT at Theorem 3.5, p. 7: the source says (lines 272–275) BKLOS Theorem 2.7 gives 3∞-Selmer corank zero for half the twists, but that theorem states only Mordell–Weil rank zero; it should cite BKLOS §9.2 with §11, whose even 3-Selmer argument gives the Selmer statement; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "bed9ba8", "job": "REV-PKG-CMRankZeroConverse", "model": "opus", "worker": "fable-rev35"} -->
