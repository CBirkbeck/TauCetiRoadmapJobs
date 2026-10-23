<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/943#issuecomment-6371772908 -->
Review (claude) of 3ac1b2b

Verdict: accepted
Conditional on the announced gaps: `cardinal-interchange`, `light-countable-ab6`

1. **F01** (P3) The compactness conjunct of `isLightSolid_reflective_and_generator` leaves its universe free

   **Location.** `packages/SolidAnalyticRings/Suggested.lean` line 119: "IsFinitelyPresentable (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧". The module docstring, lines 9–10, gives no size: "Compactness in the abelian category means preservation of filtered colimits by Hom."

   **Claim.** The conjunct is RC Theorem 3.2.4(12): ∏_ℕℤ is a compact object of light solid groups, so Hom from it commutes with small filtered colimits.

   **Witness.** At the pins, `#check @` prints the theorem as `.{u_1}` with `IsFinitelyPresentable.{u_1, 1, 1}`. Mathlib/CategoryTheory/Presentable/Basic.lean:50–52 quantifies over every filtered `J : Type u_1`, so every universe is asserted. RC line 775 covers small diagrams only.

   **Repair.** At line 119, write `IsFinitelyPresentable.{0} (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧`. In the docstring, say "filtered colimits indexed by universe-zero categories". I elaborated this variant at the pins in a scratch copy: it gave one `sorry` warning, and `#check` shows the theorem has no universe parameter. Severity is P3 rather than P2 because I believe the statement also holds in larger universes. Hom from ∏_ℕℤ identifies light solid groups with modules over its endomorphism ring, and the cogenerator argument then shows that any filtered colimit that exists is computed on underlying sets. That argument is extra work which RC does not do.

2. **F02** (P3) The §1.5 *Needs:* line omits the pinned declarations that its Lean statements use

   **Location.** `packages/SolidAnalyticRings/README.md` line 189: "*Needs:* §1.3; Mathlib `LightCondAb`; Mathlib `LightCondMod`; Mathlib `LightCondensed.free`; Mathlib `LightCondensed.freeForgetAdjunction`; Mathlib `CategoryTheory.CountableAB4Star`; …"

   **Claim.** The line lists everything that the statement and the route of §1.5 need, item by item.

   **Witness.** `Suggested.lean` lines 88–127 use `LightProfinite.NatUnionInfty`, `MonoidalClosed.pre`, `ObjectProperty.ι`, `IsFinitelyPresentable`, `IsSeparator`, `HasDerivedCategory` and `DerivedCategory.homologyFunctor`. None is on line 189; they appear only in the Mathlib contract, line 46.

   **Repair.** Append the following to line 189: "Mathlib `LightProfinite.NatUnionInfty`; Mathlib `CategoryTheory.MonoidalClosed.pre`; Mathlib `CategoryTheory.ObjectProperty.ι`; Mathlib `CategoryTheory.IsFinitelyPresentable`; Mathlib `CategoryTheory.IsSeparator`; Mathlib `HasDerivedCategory`; Mathlib `DerivedCategory.homologyFunctor`." I tested it: all seven names elaborate with `#check` at the pin.

3. **F03** (P3) The §3.3 locator supports only the Habiro tower, and it is not marked as a model

   **Location.** README line 379. The general statement ("For any two split finite free sphere towers P,Q … Restricting the right side to the diagonal n=m is also an equivalence") is followed by "(Q, Proof of Lemma B.8, printed p.79, Q line 3672)".

   **Claim.** Q proves the independent and diagonal comparisons for arbitrary split finite free sphere towers.

   **Witness.** Q lines 3669–3681 are a proof sketch for the Habiro tower only. Its last display uses the cofinal ideals (q₁^m−1, q₂^m−1), not the diagonal of the same tower. The README's reading guide (line 79) relies on model labels.

   **Repair.** Change the locator to "(Q, Proof of Lemma B.8, printed p.79, Q line 3672–3681 (model: the Habiro tower; the general split-tower statement is this roadmap's))". I checked that the model is an instance of §3.2. The stages ℤ[q^±1]/(q;q)_n are free of ranks 1, 3, 6 for n=1, 2, 3, with split surjective transitions. The independent stage at (m,n)=(1,2) has 1·3=3 summands, and max(m,n) makes the diagonal cofinal.

4. **F04** (P3) Two non-boundedness Checks are vacuous for the admitted zero algebra

   This is finding F01 of the second round-1 review; the repair did not address it.

   **Location.** README line 583: "The family Σ^(−n)G_A has no common lower bound". Line 615: "With normalized term Σ^(−n)A in degree n, its suspended layer is A in every degree; the tails never become more connective".

   **Claim.** These Checks show that the uniform lower bound in §6.1 and §6.3 is necessary.

   **Witness.** §6.1 and §6.3 admit A=0 (any connective E₁ solid algebra). Then G_A=0, and every Σ^(−n)G_A, layer and tail is 0. Zero lies in every connective range, so both sentences are false at A=0.

   **Repair.** In both Checks, write "For A=δ𝕊". I computed both cases. For §6.1, π₋ₙ(Σ^(−n)G)(*)=∏_ℕℤ≠0 for every n, so no integer bounds the family. For §6.3, every suspended layer Σ^nΣ^(−n)δ𝕊=δ𝕊 has π₀=ℤ≠0, so no tail becomes more connective.

5. **F05** (P3) The H𝔽_p quotient-tower Check omits r≥1

   This is finding F02 of the second round-1 review; the repair did not address it.

   **Location.** README line 643: "For X=H𝔽_p, X/p^r=X⊕ΣX with transition identity on X and zero on ΣX." The same description is at line 31.

   **Claim.** The formula describes every stage of the p-power quotient tower.

   **Witness.** At r=0 the scalar is p⁰=1, and cofib(id)=0; line 31 itself sets B₀=0. The displayed X⊕ΣX instead has π₀=π₁=𝔽_p, for p=2 and for p=3.

   **Repair.** At line 643, write "For X=H𝔽_p and r≥1, X/p^r=X⊕ΣX …; the r=0 term is 0." At line 31, add "for r≥1". I computed r=1, 2: p acts by 0 on H𝔽_p, so cofib(0)=X⊕ΣX. The square (p,id) induces diag(id,0), and the limit is X.

6. **F06** (P3) §3.4 uses the §3.3 comparison but its *Needs:* line omits §3.3

   This is finding F03 of the second round-1 review; the repair did not address it.

   **Location.** README line 395: "identify their action on these solid spectral tensors and the projection-induced maps of §3.3". Line 399: "*Needs:* §2.2; EnhancedDerivedSheaves E5:abstract.2; EnhancedDerivedSheaves E5:abstract.3; EnhancedDerivedSheaves E5:abstract.4."

   **Witness.** Take P_m=𝕊^(m+1) and Q_n=𝕊^(n+1). The projection-induced map at (m,n)=(1,2) has target 𝕊⁶, which is an object of §3.3, and §3.3 is not on line 399.

   **Repair.** Add "§3.3" to line 399. I recomputed the local *Needs:* closure: §3.3 needs only §3.1 and §3.2, and §5.1 already needs §3.3 and §3.4. The order stays acyclic, and no gap is added.

7. **F07** (P3) "Discrete-adic Huber-pair" in Scope is not the term that §7.3 defines

   **Location.** README line 13: "The discrete-adic Huber-pair module categories and their coefficient algebras are instances of §7.3."

   **Witness.** §7.3 (line 715) defines "discrete animated Huber pair" after RC Definition 5.5.1 (RC line 3236). "Discrete-adic" occurs nowhere else in the package, and it is neither RC's term nor Mathlib's.

   **Repair.** Replace the sentence with: "The module categories and coefficient algebras of discrete animated Huber pairs (RC Definition 5.5.1) are instances of §7.3." I checked the repaired wording against the two instances that the §7.3 Check at line 745 computes, (ℤ[T],ℤ) with F=∅ and (ℤ[T],ℤ[T]) with F={T}.

Accepted on condition of the two declared supplier gaps, `gap:cardinal-interchange` and `gap:light-countable-ab6`. There are seven findings, all P3; none is P1 or P2. All six findings of the first round-1 review are repaired. The three P3 findings of the second round-1 review were not addressed by the repair; they are carried over here as R04–R06.

## Verified sound

### Repairs of the previous round

The previous review file contains two reviews of head 2e18779. The first has six findings, F01–F06; the second has three P3 findings. The repair report covers F01–F06. I compared the README at the repair commit with 2e18779 hunk by hunk.

| Finding | Repaired passage (quoted) | Status |
| --- | --- | --- |
| F01 (P2) statable §1.5 headline | `Suggested.lean` lines 115–128 state `isLightSolid_reflective_and_generator` (reflection; ∃ h : IsLightSolid (∏ᶜ … ℤ), Projective ∧ IsFinitelyPresentable ∧ IsSeparator) and `derivedLightSolid_isRightAdjoint`. The docstring at lines 18–23 now lists only the abelian solid tensor, the derived comparison and product tensor, and universes above 0 as not statable. | Repaired (universe precision: R01) |
| F02 (P2) E5:animation.4 cited for condensed rings | Line 755: "For every static condensed commutative ring B whose underlying light condensed group is solid, the symmetric monoidal equivalence of §2.3 identifies HB-modules in Sp■ with the enhanced derived category D(Mod_B(SolidAb_light))". Line 65 restricts E5:animation.4 "only at point values B(*)". | Repaired |
| F03 (P2) HigherHida misrouted | Line 785: "Section 7.3 supplies the module category and coefficient algebra of a discrete animated Huber pair (R,R⁺)_■ by a generating set of R⁺". §7.3 (line 715) states the identification; line 13 names VS2.2 for formal complements. | Repaired (vocabulary: R07) |
| F04 (P3) spurious §6.1→§4.1 edge | Line 575: "*Needs:* §2.2; §2.4; EnhancedDerivedSheaves E3.3; EnhancedDerivedSheaves E5:abstract.2; StableHomotopyKTheory §5.17." Line 623 adds "§4.1 (the arbitrary-coproduct passage)", and line 783 states the conditionality. | Repaired |
| F05 (P3) unlabelled negative control | Line 431: "As a negative control … J is filtered but not ω₁-filtered: its countable subset ℕ has no upper bound." | Repaired |
| F06 (P3) unused pushout | Line 683: "for any coherently commuting square of analytic morphisms A→B→B′ and A→A′→B′". Line 707 adds the non-pushout Check. | Repaired |
| Second review F01–F03 (P3) | Lines 583, 615, 643, 31, 399 are unchanged from 2e18779. | Not repaired: R04, R05, R06 |

I searched the rest of the package for each repaired pattern:
- **F01, missing statable headline.** All 18 docstring bullets were re-derived below, and only the §1.5 parts are statable.
- **F02, supplier cited outside its setting.** All 32 backticked Mathlib names and the 5 supplier names were checked in their settings.
- **F03, consumer routing.** I re-read the HabiroRings, RefinedTraceMethods and LocallyAnalyticRepresentationsOfLocalGroups paragraphs.
- **F04, unused gap edges.** I recomputed the Needs closure.
- **F05, unlabelled controls.** I found the §6.1 and §6.3 controls (R04).
- **F06, unused hypotheses.** I re-read §3.4's base change and §7.4's completedness criterion.

### Principles

Every principle holds:
- **No route-specific shortcut.** The package keeps all primes (p=2 and 3 are computed), the sphere rather than Hℤ, general split coefficient data, and arbitrary discrete animated Huber pairs.
- **No re-planned roadmap.** The RefinedTraceMethods §6.2 block is moved down, as the accepted design commissioned.
- **No upward or cyclic supply** (see the dependency check below).
- **No copied passages.** An 8-word shingle comparison of the README and `Suggested.lean` against all nine source texts matches only titles, URLs and one generic clause ("let J be a small … filtered category").
- **No computational algorithm.**
- **Clean Lean form.** No sorry'd data, no `set_option`, no `lemma`, and only `import Mathlib`.

### Sources: the seeded sample and the repaired citations

No locator is flagged unverified. I read all of these at the cited line in the recorded versions.

| Target | Locator read | Number, page, hypotheses, support |
| --- | --- | --- |
| 1.2 | W line 437–441, ¶2.1, p.11; MW line 1748–1752, ¶4.1, p.41 | Fully faithful symmetric monoidal left adjoint to point evaluation; W line 453 says δ does not commute with limits, which matches "no general equivalence". |
| 1.3 | W line 443–444; RC line 729–732 (shift, Def 3.2.1, p.16) | Null object as the cofiber of the marked point and the induced shift; matches. |
| 1.4 | W line 445–447; MW line 1754–1758 | Solidity is invertibility of 1−σ* on the internal Hom from Null; matches. |
| 1.5 | RC Def 3.2.1, line 732, p.16; Thm 3.2.4(1)–(14), lines 754–787, p.17 | Light setting (line 737). Parts (2) and (12) give the first Lean theorem, (5)–(6) the second, and (14) flatness. RC line 788–791 confines (14) to the light case. |
| 2.2 | W line 448–451; RC (5)–(8) line 761, (12) line 773 | Reflection, the tensor identity and the solid tensor; the integer and free-measure models are labelled. |
| 2.3 | MW line 1763; RC (9)–(11) line 769 | MW defines solid integer complexes as Hℤ-modules in Sp■; the sheafwise equivalence is a target here. |
| 2.4 | W ¶2.3, line 472–475, p.12; RC line 773 | Null■ is the countable sphere product and a compact generator, with module generators; matches. |
| 3.3 | Q line 3669–3681, printed p.79 | Habiro-tower instance only (R03). |
| 4.1 | HTT Prop 5.3.3.3, line 18705, printed p.394 (PDF p.412); RC Rem 4.0.3, line 1411, p.28; Q line 3688–3690 | κ regular; κ-filtered if and only if colimits preserve κ-small limits in spaces. RC and Q are context. |
| 4.2 | RC Thm 2.3.3(1)–(2), line 537–540, p.12; Bosco Lemma A.4 proof, line 3504–3522, p.93 | Countable AB4* and AB6, and surjective sequential limits; Bosco is non-light, labelled as a model. |
| 5.1 | Q line 3672–3688, pp.79–80 | Model for finite free split stages; labelled. |
| 5.3 | Q line 3688–3705, p.80; Bosco line 3504–3522 | Q's colimit over f with f(n)→∞, which is properness here; Q says blocks of size 1 suffice notationally. |
| 6.2 | Bosco line 3462–3466, pp.92–93; Q line 3688; RC line 540 | Connectivity step of the resolution argument; lim¹ vanishing from RC (2). |
| 7.2 | RC Prop 4.1.6 with proof, line 1491–1521, pp.29–30; AG Prop 12.4, Rem 12.5, line 3041–3055, p.80 | Unique completed tensor and factorization of scalar extension; the proof's kernel argument is the README route. |
| 7.4 | AG Def 6.12 and Prop 6.14, lines 1361 and 1384, pp.39–40; AG Def 12.1, line 3014, p.79; RC line 773 and 787; CS Thm 5.8, line 1243, pp.35–36 | Extremally disconnected (non-light) measure models; light flatness (14); compact-Hausdorff theory through VS2.1. |
| 7.3 (repaired) | MW ¶4.2, line 1764–1776, p.41; RC Def 5.2.1, line 2399; Def 5.5.1, line 3236, p.64; Def 5.5.4, Lemma 5.5.5, Prop 5.5.6, line 3265–3325, pp.65–66; RC Ex 4.6.4(2), line 2125–2133, p.44 | The test 1−T·Shift* matches 1−fσ*. Discrete Huber pairs have R⁺ integrally closed in π₀R. Generators give the same structure. RC line 3286–3287 shows the discrete coefficient ring is complete. |

### Adversarial table

These rows cover the passages the repair changed or added, the seven Lean declarations and the seeded targets. For text the repair did not touch, I rely on the two round-1 tables, which have 39 and about 226 rows, all with computed values. All 27 targets carried computed rows there.

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `natShift` | 0, 1, ∞; wrong model: constant 0 | Images 1, 2, ∞. Composite with `inftyPoint` is ∞, the Lean `h : inftyPoint ≫ natShift = inftyPoint` closes by `ext x; rfl`. The constant model sends the point to 0 ≠ ∞. | holds | none |
| `inftyPoint` | the point; wrong model: point to 0 | ∞. With the point sent to 0, the shift sends it to 1 ≠ 0, so the shift would not descend to the cokernel. | holds | none |
| `nullSeq` = P | value at *; marked singleton | P(*)=ℤ[ℕ∪{∞}]/ℤ[∞]=⊕_ℕℤ (RC line 808); coker(id_ℤ)=0 | holds | none |
| `nullShift` | e₀, e₁ | σe₀=e₁, σe₁=e₂; precomposition sends e₁ to e₀ and e₀ to 0 | holds | none |
| `IsLightSolid` | B=0, δℤ, ℝ, P | 0: identity of 0 is invertible. δℤ: Hom(P,ℤ)(*)=⊕ℤ and (1−σ*)(e₁+e₀)=e₁. ℝ: for b_n=1/(n+1), x₀−x_(N+1) is the harmonic sum H_(N+1)→∞ while the left side tends to x₀. P: π₀P■=∏ℤ ∋ (1,1,…) ∉ ⊕ℤ. | δℤ is solid; ℝ and P are not | none |
| Separator conjunct | Q=ℤ_p/δℤ_p, p=2, 3 | Hom(ℤ,Q)=Q(*)=0, but Hom(∏ℤ,Q)=ker(Q(C)→Q(*)) contains the class of (2^n), resp. (3^n), which is nonzero | ∏ℤ detects Q where ℤ does not | none |
| Projective conjunct | epimorphism δℤ→δ(ℤ/2) | Hom(∏ℤ,−)=Hom(P,−) at *: ⊕ℤ→⊕𝔽₂ is onto | holds | none |
| Compact conjunct | ⊕_ℕδℤ = colim ℤ^n | a null sequence in discrete ⊕ℤ is eventually 0, so it lies in some ℤ^n: colim Hom(P,ℤ^n)=Hom(P,⊕ℤ) | holds; universe free | R01 |
| `derivedLightSolid_isRightAdjoint` | ℤ[1]; ℝ[0]; 0 | H⁻¹=ℤ is solid, so in the subcategory. H⁰=ℝ is not, and its reflection is 0 (RC (4)). 0 stays 0. The ∞-reflection RC (5) gives the homotopy-category adjoint on π₀ of mapping spaces. | holds | none |
| §1.5 flatness | B=ℤ/2; B=0; ℤ/2⊗ℤ/2 | cofib(2 on ∏ℤ)=∏𝔽₂ with Tor₁=ker 2=0; 0; Tor₁(ℤ/2,ℤ/2)=𝔽₂ | the generator is flat, but not every object is | none |
| §2.3 ordinary animated B | B=𝔽₂ | θ𝔽₂=H𝔽₂. At *, Hom(∏𝔽₂,𝔽₂) is ⊕𝔽₂ (countable) against an abstract dual of cardinality 2^(2^ℵ₀), so point values are not fully faithful. | "not ordinary D(B)" holds | none |
| §7.4 static B | B=ℚ_p; ℤ/2; 0 | (p^n) at C is not eventually constant, so it is absent from δℚ_p(C). ℤ/2⊗ᴸ∏ℤ=∏𝔽₂ is static while ℤ/2⊗ᴸℤ/2 has Tor₁=𝔽₂. 0 gives the zero category. | static, not discrete | none |
| §7.4 module route | B=ℤ/2 | Hom_B(B⊗∏ℤ,M)=Hom(∏ℤ,M): projective and compact, with static endomorphisms, so D(Mod_B) ≃ Mod_B(D(Solid)) | holds | none |
| §7.3 Huber identification | (ℤ[T],ℤ) with F=∅; (ℤ[T],ℤ[T]) with F={T}; M=ℚ_p with T=1/p, p=2, 3 | F=∅ gives all modules. For (2^n): 2^n−2^(n+1)/2=0 with b₀=1; for (3^n) likewise. So M lies in D_∅ but not in D_F. | the two structures differ | none |
| §7.3 coefficient unit | A=δθR discrete | Hom(P,δX)(*) has finite support, so the inverse Σ f^kσ*^k terminates: Â_F=A (RC line 3286) | holds | none |
| §7.3 integral closure | R=𝔽₂[ε]/ε², εT | (εT)²=0; (1−εTσ*)(1+εTσ*)=1−ε²T²σ*²=1 | adds no test (RC Lemma 5.5.5) | none |
| §7.3 generators against all of R⁺ | (ℚ,ℚ) against (ℚ,ℤ) | generators {1/p}: ℚ_p fails the 1/p test, so the structure differs from F=∅ | consistent | none |
| §7.2 commuting square | A=A′=B=Hℤ, B′=H𝔽₂; A=Hℤ, B=A′=H𝔽₂ with B′ the derived pushout; target D={0} | Both paths give H𝔽₂, whereas the pushout is Hℤ. The derived pushout has π₀=π₁=𝔽₂. With D={0}, both paths give 0. | the pushout is unnecessary | none |
| §6.1 uncountable sum | I uncountable | the constant resolution realizes ⊕_IΣ^bG_A, with π_k=0 for k<b | no interchange | none |
| §6.4 coproduct passage | I uncountable; I=ℕ | a countable union of countable subsets is countable, so it is an upper bound (ω₁-filtered); for I=ℕ the top element is I | §4.1 is genuinely used | none |
| §4.1 control | J=ℕ, F(n,k)=Hℤ for k<n | left π₀=colim ℤ^n=⊕ℤ; right ∏ℤ ∋ (1,1,…) | fails outside ω₁ | none |
| §6.1 and §6.3 Checks | A=0; A=δ𝕊 | everything 0, against π₋ₙ=∏ℤ and π₀=ℤ | vacuous at 0 | R04 |
| §6.4 Check | r=0, 1, 2; p=2, 3 | 0 against 𝔽_p⊕Σ𝔽_p; diag(id,0); limit 𝔽_p | false at r=0 | R05 |
| §3.4 *Needs:* | stage (1,2) | target 𝕊⁶, a §3.3 object | omission | R06 |
| 1.2 δ | X=0; 𝕊⊕Σ𝕊; lim H(ℤ/p^r) on T=ℤ_p | 0; π₀=ℤ, π₁=ℤ/2⊕ℤ; the identity of ℤ_p is a section that is not locally constant | holds | none |
| 1.3 N | marked singleton; e₁ | 0; (1−σ*)e₁=e₁−e₀ with inverse e₁+e₀; the right shift gives e₂ | holds | none |
| 1.4 | 0; δ𝕊; N | trivial; π₁δ𝕊=ℤ/2; ⊕ against ∏ | N is not solid | none |
| 2.2 | 0; δ𝕊; T=∅, *, 2, C | L■0=0; L■δ𝕊=δ𝕊; measures 0, δ𝕊, δ𝕊², δ𝕊×∏δ𝕊 | holds | none |
| 2.4 | G at *; A=0; φ=(1,0) | π₀=∏ℤ, π₁=∏ℤ/2; G_A=0; φe₁₂e₂₁=(1,0)=φe₁₁ and φe₂₂=0 | holds | none |
| 3.3 | constant rank one; m=1, n=2; Habiro stages | 𝕊⊗■𝕊=𝕊; 2·3=6; ranks 1, 3, 6, split | holds | R03 (locator) |
| 4.2 | ℚ with subgroups (1/n!)ℤ; B_j=0; ℤ^(n+1) | (1/(j+1)!)_j lies in the independent colimit but not the diagonal one; 0; lim¹=0 | holds | none |
| 5.1 | 𝕊[[t]]; A=0; 𝕊/p; δ𝕊 with all a_r=1 | ranks r and cofib(t)=𝕊; all 0; ℤ/p is not free; lim B_r=0≠δ𝕊, so excluded | holds | none |
| 5.3 | singleton blocks; blocks 0 and 1; I₀=ℕ | (t^j) is included and (1)_j is not; A²; ∏_ℕA | holds | none |
| 6.2 | a=1; a=0; Hℤ with 2^r | 0; M⊕ΣM; lim ℤ₂ and lim¹=0, against the ideal tower with lim¹=ℤ₂/ℤ | holds | none |
| gap cardinal-interchange | κ=ω₁; control J=ℕ | HTT 5.3.3.3 read; ℕ has no bound for its own countable subset | precise, minimal | none |
| gap light-countable-ab6 | ℚ with subgroups (1/n!)ℤ | independent against diagonal, as above; no AB6 anywhere at the pins | precise, minimal | none |

### Duplication audit, by object

- **Mathlib at the pin.** There is no light solid predicate, no shift of `NatUnionInfty`, no null-sequence cokernel, no AB6, no spectra and no monoidal `DerivedCategory`. Searches covered Mathlib/Condensed/Light/*, Mathlib/Algebra/Homology/DerivedCategory/* and the whole tree for AB6 and spectra. `CondensedMod.IsSolid` (Mathlib/Condensed/Solid.lean:83) is the compact-Hausdorff measure test, a different object.
- **Tau Ceti at the pin.** No condensed or solid objects exist; the only "Solid" hits are solid tori.
- **Roadmaps.** `roadmaps grep` over main and all 330 open heads for `IsLightSolid|nullSeq|natShift|nullShift|inftyPoint`, light solid, the null-sequence object, f-solid / Huber-solid, AB6 and HTT 5.3.3.3 found only HabiroRings (a consumer, with no overlapping declaration in its `Suggested.lean`). IgusaVarietiesAndTorsionConcentration builds its own non-light solid Λ-modules, which are not this object. The board packages give the same picture.
- **Ownership against the open heads.** Checked as above. This roadmap owns the light null-test theory, because VS2.1 owns only the compact-Hausdorff theory.

### Supplier order and citations

`tauceti-roadmap … gate --depcheck … --name SolidAnalyticRings --order …/ORDER.txt --movable` exited 0 with:

    depcheck: 27 roadmaps, 234 edges, 0 problem(s)

There is no UPWARD, CYCLE or moved line. The positions are StableHomotopyKTheory 4, EnhancedDerivedSheaves 19, VStackSheavesAndLisseCategories 149, SolidAnalyticRings 150, HabiroRings 219, RefinedTraceMethods 220 and LocallyAnalyticRepresentationsOfLocalGroups 300; GeneralizedCohomology is on main. All 27 *Needs:* lines point backward. In the closure, §§6.1 and 6.3 are gap-free, §6.4 reaches gap:cardinal-interchange through §4.1, §§4.2 and 5.3–5.4 reach gap:light-countable-ab6, and §§7.1–7.4 reach no gap. `roadmaps resolve` reports no unresolved citation.

| Citation | Where it resolves |
| --- | --- |
| EnhancedDerivedSheaves §§0.1–0.3, E0.4, E0.8, E1.3 (main) | README lines 429–455, 211, 376, 549; E0.8 defines `IsKappaFiltered` and presentability, with no interchange |
| EnhancedDerivedSheaves E2:towers, E2.1–E2.3, E2.6–E2.7, E3.2–E3.3, E4.1, E4.4 | lines 1290, 2035, 2083, 2125, 2293, 2375, 1153, 1203, 2569, 2703; `IsReplete.countableProduct_epi` at 2071, `IsReplete.milnor` at 2097 |
| EnhancedDerivedSheaves E5:abstract.2–.5, E5:presentability.1–.2, E5:spectra-comparison, E5:animation.4 | lines 1456–1570, 1597, 1624, 1842; `symmetricSpectra_towerComparison` at 1876 (r≥1, (p,id)); `animatedModules_discrete` at 2012 (discrete B); θ is an equivalence over ℚ only (line 1996), which matches README line 23 |
| GeneralizedCohomology G2.1–G2.7, G2.4, G3.8, G3.9 (main) | items at lines 213–405, 271, 785, 878 |
| StableHomotopyKTheory §§5.13–5.18 (open head) | lines 1999–2099 |
| VStackSheavesAndLisseCategories VS2.1, VS2.2 (open head) | VS2.1 at line 604, with "The abelian category of solid groups" 654, "Solidification as a reflection" 662, "Solid tensor and internal Hom" 670; VS2.2 at 710, with "Analytic measures and complete modules" 714, "Solid nonarchimedean coefficients" 749, `ZSolidAnalytification.formalComplement` 765; cutoff convention at 54 |
| HabiroRings §§2.6–2.12 (open head) | lines 526–692; gap:light-solid-spectra (lines 66 and 86) maps onto §§1.1–1.4, 2.1–2.4, 3.1–3.4, 4.1, 5.3–5.4, 6.1, 6.3 |
| HigherHidaAndColemanTheory R23–R24 (board head da88512, one REST read) | design README lines 1824–1834. The discrete Huber pairs are routed to §7.3 and scalar change to §7.2. The idempotent-kernel, triangle, nilpotent-annihilation and universe items are declared not supplied here; that consumer must find their owner. |
| RefinedTraceMethods (board head 87bc3ff, unchanged since round 1) | Its §6.2 still builds the moved block; that is the consumer's repair. |

### Gaps

Both gaps have a named earlier supplier. Each `needs` sentence matches `design/plan.json` word for word (checked mechanically) and sits in the supplier's subsection in the required shape (README lines 67 and 73). Each is a single statement with its hypotheses. Neither is provided at the pins: Mathlib/Condensed/Light/AB.lean:31–36 gives only `CountableAB4Star` and `IsGrothendieckAbelian`, and E0.8 states no interchange. So each gap is precise, minimal and declared.

### Shape and Lean

- **Shape.** 7 layers and 27 targets, 63 API bullets and 99 Checks; every target has at least 3 Checks (§1.5 has 7, §7.3 has 8). Every layer ends with Examples and Dependencies. The headings follow the upstream form. There is no LaTeX, no machine path and no process word apart from "proposed" in the gap contracts, which comes from the plan.
- **Elaboration.** `lake env lean packages/SolidAnalyticRings/Suggested.lean`, run from the content checkout at the pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf; both verified against the checkouts), exited 0 in 15 s with exactly two warnings, "declaration uses `sorry`", at lines 115 and 125. No Tau Ceti import is used.
- **`#check @` comparison.** One scratch file checked all seven declarations: `natShift : ℕ∪{∞} ⟶ ℕ∪{∞}`, `inftyPoint : ↧PUnit ⟶ ℕ∪{∞}`, `nullSeq : LightCondAb`, `nullShift : nullSeq ⟶ nullSeq`, `IsLightSolid : ObjectProperty LightCondAb`, and the two theorems. There are no section variables, so no binder was lost. `HasDerivedCategory` is explicit. The only difference from the README is the free universe in R01. I changed nothing.
- **Mathlib names.** All 32 backticked Mathlib names elaborate in one `#check` file. The 34 cited file:line locations were opened at the pin and all match.
- **One-tactic probe.** I tried `simp`, `rfl`, `infer_instance`, `exact inferInstance`, `simp_all`, `decide` and `aesop` on both theorems in a scratch copy, and all 14 attempts fail. Neither theorem restates a definition, mirrors a Check or treats a boundary case, so there is no padding.
- **Headline list.**
  - Stated in Lean: §1.5 reflection, generator and derived reflection.
  - Named as not statable, each with its missing carrier: §§1.2, 1.5 (tensor, enhanced derived comparison, product tensor, larger universes), 2.1, 2.2, 2.3, 2.4, 3.1, 3.3, 3.4, 4.1, 5.3–5.4, 6.1, 6.2, 6.3, 6.4, 7.2, 7.3, 7.4. Each needs spectra, a derived monoidal structure or enhanced categories, none of which exist at the pins.
  - Considered and not raised: the triangulated shadow of RC (9). Abelian structure on `IsLightSolid.FullSubcategory` exists at the pin only through four closure instances (Mathlib/CategoryTheory/Abelian/Subcategory.lean:59–61), and those instances are themselves theorems of this roadmap.

## Not verifiable

- Q Lemma B.8 is a proof sketch (Q line 3669). The general spectral statements of §§3.1–3.4 and 5.1–5.4 are this roadmap's proof obligations; I checked them on computed instances, not against a written proof.
- The sheaf-level step of §5.3 (one proper profile dominating local bounds via AB6) was checked on global sections only.
- AS is used only as context; it was not read beyond its identification lines.
- That `IsFinitelyPresentable` holds in universes above 0 (R01) is argued, not formalised.
- RefinedTraceMethods' consumer head was not re-read. The index head is unchanged since round 1, so I relied on round 1's reading.

## Source issues

- **Misprint** in RC at Theorem 2.3.3(3), proof, printed p.12 (RC line 550): the source says the map g is defined on Z[S] tensored with N; it should be Z[S] tensored with P; affects the proof.
- **Misprint** in RC at Theorem 2.3.3(3), proof, printed p.12 (RC lines 555–556): the source says the parameter space is S times the product of N with the point at infinity; it should be S×(N∪{∞}); affects the proof.
- **Misprint** in RC at Proposition 3.2.5, proof of (1), printed p.18 (RC line 812): the source says the second coordinate of (1−Shift*)a is a₁ minus a₁; it should be a₁−a₂; affects the proof.
- **Misprint** in RC at Proposition 3.2.5, proof of (3) and (8), printed p.18 (RC lines 824–825): the source says the kernels of solidification are tensor ideals in the solid categories; it should be in CondAb and D(CondAb); affects the proof.
- **Misprint** in RC at Proposition 3.2.5, proof of (4), printed p.19 (RC line 866): the source says the identity x_n=x_(2n+1) holds for integer n; it should be for natural numbers n; affects the proof.
- **Misprint** in RC at Proposition 3.2.5, proof of (7), printed p.19 (RC lines 874–875): the source names the solid target B, which is unbound there; it should be C, the solid complex introduced; affects the proof.
- **Misprint** in RC at Proposition 4.1.6, proof, printed p.30 (RC line 1514): the source takes the object killed by completion in the complete category D(A); it should be in the ambient category D(A▷); affects the proof.
- **Misprint** in RC at Proposition 5.5.6, proof, printed p.66 (RC line 3311): the source lets M range over finite B-submodules of R⁺; it should be finite B-submodules of R, as in RC lines 3319 and 3323; affects the proof.
- **Misprint** in RC at Proposition 5.5.6, proof, printed p.66 (RC line 3312): the source places the subalgebra generated by T inside R⁺ before proving that T lies in R⁺; it should be a subalgebra of R; affects the proof.
- **Misprint** in HTT at Proposition 5.3.3.3, proof, printed p.394 (HTT line 18710): the source writes the cofinal map from N(A) as landing in spaces; it should land in the indexing ∞-category I; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "3ac1b2b", "job": "REV-PKG-SolidAnalyticRings~2", "model": "opus", "worker": "fable-rev26"} -->
