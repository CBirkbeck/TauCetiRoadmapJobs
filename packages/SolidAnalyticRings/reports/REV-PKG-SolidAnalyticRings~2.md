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

---

<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/943#issuecomment-6371881746 -->
Review (codex) of 3ac1b2b

Verdict: accepted
Conditional on the announced gaps: `cardinal-interchange`, `light-countable-ab6`

1. **F01** (P3) Make the two unboundedness Checks nonzero

   **Location.** `packages/SolidAnalyticRings/README.md:583` and `:615`: “The family Σ^(−n)G_A has no common lower bound”; “the tails never become more connective”.

   **Claim.** These are negative controls for uniform boundedness, in sections allowing the zero algebra.

   **Witness.** Set A=0. Then G_A=0, every shifted generator and every normalized layer is 0, and every tail satisfies every lower bound. The claimed failure of boundedness disappears.

   **Exact repair, tested.** Specify A=δ𝕊 in both Checks. In §6.1, π₋ₙ(Σ^(−n)G)=∏_ℕℤ≠0. In §6.3 use the split simplicial object with normalized term Σ^(−n)δ𝕊: every suspended layer is δ𝕊, so each tail has nonzero π₀. Retain the zero algebra in the theorems. This is the second previous review's F01, still unrepaired; the repair report did not address that review's three findings.

2. **F02** (P3) Restrict the split prime-quotient Check to positive exponents

   **Location.** `packages/SolidAnalyticRings/README.md:643`, also `:31`: “X/p^r=X⊕ΣX with transition identity on X and zero on ΣX”.

   **Claim.** The splitting is written without an exponent restriction, although the package also uses exponent zero.

   **Witness.** At r=0 and X=H𝔽₂ or H𝔽₃, p⁰=1 and X/p⁰=cofib(id)=0. The claimed right side instead has π₀=π₁=𝔽_p.

   **Exact repair, tested.** Add “for r≥1” to both splitting/diagonal-transition descriptions. If r=0 is included, give it value 0 and the unique transition into 0. At r=1,2 the scalars act by zero and the transition is diag(id,0); the positive-tail limit remains H𝔽_p. `TauCetiRoadmap/GeneralizedCohomology/README.md:890` and `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1876` already index the supplied prime tower by r≥1. This is the second previous review's F02, still unrepaired.

3. **F03** (P3) Include the tower comparison among balancing prerequisites

   **Location.** `packages/SolidAnalyticRings/README.md:395` and `:399`: “identify their action on … the projection-induced maps of §3.3”.

   **Claim.** §3.4 promises compatibility with §3.3's comparison but its `*Needs:*` line omits that target.

   **Witness.** For P_m=𝕊^(m+1), Q_n=𝕊^(n+1), the (1,2)-projection has target 𝕊⁶. The map whose compatibility is promised is constructed in §3.3, not among the listed prerequisites.

   **Exact repair, tested.** Add §3.3 to §3.4's `*Needs:*` line. The rank-six projection remains the same six coordinate maps. The edge points from an earlier subsection to a later one and introduces no cycle; generic bar and scalar extension remain imported. This is the second previous review's F03, still unrepaired.

Conditional on the declared supplier contracts `cardinal-interchange` and `light-countable-ab6`. There are three P3 findings and no P1/P2 findings. The four package inputs and the design plan were not changed.

## Verified sound

### Previous findings, checked before the new pass

The supplied previous-review file contains two reviews of the same package revision. The repair report addresses the first review's six findings. I checked all nine findings, distinguishing their repeated identifiers. None was settled as “not actionable in this package”. Quotes below are package wording, not source passages.

| Previous finding | Status | Repaired passage or remaining witness |
| --- | --- | --- |
| First review F01, missing statable light-solid headline | Repaired | README :195: “states this reflection together with solidity, projectivity, preservation of filtered colimits by Hom, and the separator property”; :197 states the ordinary derived reflection. Suggested.lean :115 and :125 now state both. |
| First review F02, ordinary-ring comparison applied to condensed coefficients | Repaired | README :755: “B need not be a discrete condensed ring”; the static comparison is owned there, with ordinary `animatedModules_discrete` restricted to B(*). The same restriction occurs at :65 and :285. |
| First review F03, Huber-pair supply misrouted | Repaired | README :715: “Identify D_F with the complete module category of (R,R⁺)_■”; :785 exports it to HigherHidaAndColemanTheory. The new generator/integral-closure and coefficient-unit claims were checked against RC lines 3269–3287. |
| First review F04, interchange assigned to the wrong step | Repaired | README :581: “constructing this resolution uses no limit–colimit interchange”; §6.1's Needs omits §4.1. At :623 it occurs as “§4.1 (the arbitrary-coproduct passage)”; :783 states the consumer's conditionality. |
| First review F05, filtered counterexample not labelled | Repaired | README :431: “J is filtered but not ω₁-filtered”; “The theorem does not apply and the comparison fails”. Both computed groups remain correct. |
| First review F06, unnecessary pushout premise | Repaired | README :683: “for any coherently commuting square of analytic morphisms”; :697 repeats that scope, :707 computes the non-pushout example. |
| Second review F01, zero-algebra negative controls | Not repaired | README :583 and :615 still allow A=0. See R01. |
| Second review F02, exponent-zero splitting | Not repaired | README :31 and :643 still omit r≥1. See R02. |
| Second review F03, balancing prerequisite | Not repaired | README :399 still omits §3.3. See R03. |

The actual diff against the previously reviewed revision was read. Its changes are confined to the ownership/supplier prose, §1.5 and its seven Lean declarations, §§2.3, 4.1, 6.1, 6.4, 7.2–7.4, consumer prose and RC locators. Every changed mathematical assertion is recomputed below. The two previous computed tables supply evidence only for unchanged assertions, with the sampled sections and changed statements checked again. No earlier bare “sound” summary is used as mathematical evidence.

### Principles and scope

The package develops general light solid spectral coefficients: arbitrary primes, all coherent split coefficient data, empty and infinite countable blocks, connective E₁/commutative coefficients, and all homotopy degrees. It keeps the sphere distinct from Hℤ, absolute tensor distinct from relative tensor, and discrete coefficients distinct from static condensed coefficients. No route-specific arithmetic shortcut, computational algorithm, sorry'd data, option override or copied source passage was found. A ten-word shingle comparison against all nine cached sources found only bibliographic titles and the transcript URL; the statements and routes were also read directly.

The RefinedTraceMethods ownership move is an existing design decision, not a new replanning: `packages/SolidAnalyticRings/reports/REV-DESIGN-SolidAnalyticRings~2.md:264` records moving its spectral foundations to §§1–2 and §6.4 here. At the supplied board head, `packages/RefinedTraceMethods/README.md:2521` still contains that block. Its eventual replacement by imports is a consequence for that consumer, not an upward prerequisite here. Trace classes, nuclearity and even filtrations stay there. VS2.1's compact-Hausdorff integer theory and this package's light null-test theory have distinct carriers; §7.4 owns their specified comparison.

### Sources: all 15 seeded targets

All nine manifest entries are certified, legally cached and readable in the recorded versions. No author locator is flagged unverified, no new source was needed, and no source entry was edited. Printed pages were distinguished from extraction pages, particularly for Q and HTT. A model citation below supports the stated model and proof method; the explicitly broader spectral assertion is this roadmap's target, not falsely attributed to a theorem in the source.

| Target | Locator read | Hypotheses and support checked |
| --- | --- | --- |
| §1.2 | W lines 437–441, paragraph 2.1, p.11; MW lines 1748–1752, paragraph 4.1, p.41 | Light spectral hypersheaves, fully faithful symmetric monoidal discrete left adjoint to point evaluation. No inverse-limit preservation claimed. |
| §1.3 | W lines 443–444, p.11; RC lines 728–747, Definition 3.2.1, p.16 | Reduced marked convergent sequence; shift fixes infinity. Larger-universe transport is a separate target, consistent with the pinned Type 0 theorem. |
| §1.4 | W lines 445–451, p.11; MW lines 1754–1762, p.41 | Internal Hom difference equivalence, not merely a pointwise π₀ test. Tensor–Hom/free evaluation gives the external orthogonality formulation. |
| §1.5 | RC lines 732–787, Definition 3.2.1 and Theorem 3.2.4(1)–(14), pp.16–17; proof lines 795–898 | Light abelian and derived reflection, cohomology criterion, derived tensor, countable projective generator, product tensor and light flatness. Parts (12) and (14) support the added static-module route. |
| §2.2 | W lines 448–451, p.11; RC lines 761–787, Theorem 3.2.4, p.17 | Spectral reflection and tensor compatibility; integer free measures are explicitly a model. Connective preservation and the spectral free-measure formula have their own stated route. |
| §2.3 | MW line 1763, p.41; RC lines 769–772, Theorem 3.2.4(9)–(11), p.17 | Integer module comparison and derived solid theory. The new ordinary animated comparison is limited to its ordinary input, not topological B. |
| §2.4 | W lines 472–475, paragraph 2.3, p.12; RC lines 773–776, p.17 | Solidified null object is the countable sphere product and compact generator; free/forgetful transport gives the module generator. |
| §3.3 | Q lines 3669–3686, proof of Lemma B.8, printed pp.79–80 | The arithmetic proof uses finite sphere stages and product tensor. The package explicitly supplies coherent splitting hypotheses and proves the general independent-tower extension; no claim that Q states that general theorem. |
| §4.1 | HTT lines 18705–18726, Proposition 5.3.3.3, printed p.394; RC lines 1411–1416, Remark 4.0.3, p.28; Q lines 3688–3691 | Regular κ, κ-filtered indexing and κ-small limits. Spectral stabilization and the light-site specialization are kept separate. The ordinary filtered negative control is correctly labelled. |
| §4.2 | RC lines 537–540, Theorem 2.3.3(1)–(2), pp.12–13; Bosco lines 3488–3521, Lemma A.4, p.93 | Countable AB6 and exact products; independent choices, not one diagonal bound. Bosco uses extremally disconnected tests in the non-light integer model. |
| §5.1 | Q lines 3672–3688, proof of B.8, pp.79–80 | Finite free arithmetic stages supply the model. Coherent marked divisibility, sections and completeness are explicit hypotheses of the general datum. Moore spectra are excluded from it. |
| §5.3 | Q lines 3693–3705, p.80; Bosco lines 3488–3521, p.93 | Proper profiles and uniformly decaying blocks. The source's sheaf calculation is not silently transported to the light site; §4.2's declared AB6 input and §2.1's homotopy structure do that work. |
| §6.2 | Bosco lines 3464–3466, proof of A.3, pp.92–93; Q lines 3688–3692; RC line 540, p.12 | The sharp bound is explicitly proved here using bottom quotient surjections and Milnor. No claim that the sources state the general arbitrary-scalar-tower theorem verbatim. |
| §7.2 | RC lines 1489–1521, Proposition 4.1.6, pp.29–30; AG lines 3041–3055, Proposition 12.4/Remark 12.5, p.80 | Monoidal completion and factored scalar adjunction. The commuting-square identity follows from transitivity and target reflection; the revised statement needs no pushout premise. |
| §7.4 | AG lines 1361–1412, Definition 6.12/Proposition 6.14, pp.39–40; lines 3014–3055, pp.79–80; RC lines 773–787; CS lines 1243–1257, Theorem 5.8, pp.35–36 | Condensed coefficients and extremally disconnected measure tests. Site comparison is supplied only on common presentations. Flat light generators justify the added static B-module comparison. |
| Additional repaired §7.3 | MW lines 1764–1775, p.41; RC lines 2125–2145, Example 4.6.4(2),(4), p.44; lines 3236–3239, Definition 5.5.1, p.64; lines 3265–3305, Definition 5.5.4/Lemma 5.5.5/Proposition 5.5.6, pp.65–66 | Discrete animated Huber pairs, integral closure of the ring generated by the tests, and unchanged discrete coefficient algebra. The topological ℚ_p counterexample does not contradict the discrete assertion. |

The seeded list contains 15 numbered subsections; the additional changed §7.3 makes the 16 source-target rows above. Other opened passages include W lines 452–462 (§6.4), CS lines 1578–1603 (derived tensor), and AS lines 9–20 and 39–44 (context and transcript status). No source passage is copied into this report.

### Pinned declarations and ownership by object

The content checkout is main at `a4a8652e46fe27e56355bbcf74579562b503fbc3`. Its manifest and README agree on Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These bodies, hypotheses and universe binders were opened at those pins:

| File and line at the pin | Object actually supplied, and boundary |
| --- | --- |
| `Mathlib/Topology/Category/LightProfinite/Basic.lean:42`, :56, :403 | Native CompHausLike carrier with total disconnectedness/second countability; constructor requires compactness/T2; essentially small. No nonemptiness requirement. |
| `Mathlib/Topology/Category/LightProfinite/EffectiveEpi.lean:28` | Effective epi iff surjective. |
| `Mathlib/Topology/Category/LightProfinite/Sequence.lean:53` | `NatUnionInfty := of (OnePoint ℕ)`, at universe zero. |
| `Mathlib/Condensed/Light/Basic.lean:28`; `Mathlib/Condensed/Light/Small.lean:30` | `LightCondensed` is ordinary coherent-topology sheaves; `equivSmall` is an ordinary sheaf equivalence. |
| `Mathlib/Condensed/Light/Module.lean:36`, :42, :68, :73, :85 | Ring binder; module sheaves, free functor/adjunction, and `LightCondAb := LightCondMod ℤ`. These are not spectral hypersheaves. |
| `Mathlib/Condensed/Discrete/Basic.lean:65`, :72, :79, :86 | Category/HasSheafify binders and ordinary discrete/evaluation adjunction. |
| `Mathlib/Condensed/Light/AB.lean:31`, :35 | CountableAB4Star and Grothendieck abelianness; no independent-union AB6 theorem. |
| `Mathlib/Condensed/Light/Monoidal.lean:33`, :41–62 | CommRing binder, ordinary symmetric closed tensor and monoidal free/sheafification functors. |
| `Mathlib/Condensed/Solid.lean:44`, :48, :69, :83 | Profinite free objects, right Kan extension, comparison and all-profinite inversion predicate. Lines 74–81 warn about general-ring scope; this is not the light null predicate. |
| `Mathlib/Condensed/Light/Sequence.lean:20`, :302 | Internal projectivity with coefficient ring in Type 0. |
| `Mathlib/CategoryTheory/Preadditive/Projective/Internal.lean:41`, :47, :61 | Internal Hom preserves epimorphisms; transport through retracts. It does not assert all section evaluations preserve epis. |
| `Mathlib/Condensed/Light/Epi.lean:104`, :109 | Sequential tower/limit/epi hypotheses and epimorphic projection. |
| `Mathlib/LinearAlgebra/FreeModule/PID.lean:278`, :298 | Finite basis of a submodule of a finite free PID module; spectral lifting remains owned here. |
| `Mathlib/Topology/Category/Profinite/Nobeling/Induction.lean:153` | Freeness of the actual locally constant integer function module, used by the compact-Hausdorff owner. |
| `Mathlib/CategoryTheory/Monoidal/Closed/Basic.lean:242` | `pre (f : B ⟶ A) : ihom A ⟶ ihom B`; contravariant direction matches the difference test. |
| `Mathlib/CategoryTheory/ObjectProperty/FullSubcategory.lean:59` | Actual full-subcategory inclusion, not an unspecified functor. |
| `Mathlib/CategoryTheory/Presentable/Finite.lean:49`; `Mathlib/CategoryTheory/Generator/Basic.lean:545` | Filtered-colimit compactness and faithful Hom/separator property. |
| `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:74`; `Mathlib/Algebra/Homology/DerivedCategory/HomologySequence.lean:33` | Chosen ordinary derived localization and every-integer cohomology functor; not a derived monoidal enhancement. |

Object searches covered both pinned trees, main and the indexed open heads using `roadmaps grep`, and the board packages. Search objects included light solidity/null sequences, spectral hypersheaves, reflection, integer product tensor, AB6/independent unions, cardinal interchange, analytic measures, Huber-pair summability and derived tensor. The pins contain ordinary site/sheaf/derived-category inputs but not the full spectral or enhanced solid monoidal carriers claimed missing in the docstring. No new declaration duplicates a fully qualified declaration at a pin or readable roadmap head. Both theorems are specific reflection/generation assertions, not generic category lemmas under new names.

The board index was read first. All 37 listed heads were queried: 22 package READMEs were available and 15 used their design README at the same head. Those 37 texts and the local packages were searched by object. The only competing spectral foundational block is the commissioned RefinedTraceMethods move; HigherHidaAndColemanTheory is a consumer, and VStack Part II owns its geometric VS6–VS11 extension. Open-head searches used the provided roadmap service/index; no revised existing roadmap was substituted for its main version.

### Resolved cross-roadmap citations and order

Two main-branch shape exemplars were read: GeneralizedCohomology and EnhancedDerivedSheaves. Every supplier citation was resolved anew; the three generated “missing name” leads all name roadmap targets, not pinned declarations.

| Citation | Resolved location and boundary |
| --- | --- |
| GeneralizedCohomology G2.1–G2.7 | `TauCetiRoadmap/GeneralizedCohomology/README.md:213`–:431 on main: pointed simplicial substrate, symmetric spectrum modules, stable/positive-flat models, true π, sphere and HR/HM adapters. |
| GeneralizedCohomology G3.8–G3.9 | Same file :785, :878: coherent fiber-of-difference tower and prime completion, with r≥1 and (p,id) transitions. |
| StableHomotopyKTheory §§5.13–5.18 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:1998`–:2111 at its indexed new-folder head: operadic and HR-module comparisons, unbounded cochains, cellular/connective comparisons. Matrix order and π_k=H^(−k) agree. |
| EnhancedDerivedSheaves §§0.1–0.3, E1.3 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, :441, :455, :549, main: enhanced module sheaves/replacements, tensor/Hom and coherent limits; Grothendieck enhancement. |
| EnhancedDerivedSheaves E0.4, E0.8 | Same file :211, :376: stability and cardinal/accessibility definitions. E0.8 does not supply the declared general interchange. |
| EnhancedDerivedSheaves E2:towers, E2.1–E2.3 | Same file :1294, :1401, :2035, :2083, :2125: coherent limits, pro-zero theory, replete products, Milnor and Postnikov. `IsReplete.countableProduct_epi` is at :2071 and `IsReplete.milnor` at :2097. |
| EnhancedDerivedSheaves E2.6–E2.7 | Same file :2293, :2375: hypercovers and space-valued hypercompletion; no automatic identification of hypercompleteness with Postnikov completeness. |
| EnhancedDerivedSheaves E3.2–E3.3 | Same file :1153, :1203: accessible localization, adjoints, exact colimit calculus and compact generation. |
| EnhancedDerivedSheaves E5:abstract.2–.5 | Same file :1456, :1494, :1512, :1570: module/bar scalar extension, monoidal localization, stable comparisons and monadicity. Generic construction remains there; solid specialization is here. |
| EnhancedDerivedSheaves E5:presentability.1–.2 | Same file :1597, :1624, :1660: compact objects, presentable operations and stabilization. The additional cardinal theorem is explicitly a gap. |
| EnhancedDerivedSheaves E5:spectra-comparison | Same file :1846, :1864, :1876: point-site HR equivalence and concrete spectral/tower adapters; not the light sheaf comparison owned by §2.3. |
| EnhancedDerivedSheaves E5:animation.4 | Same file :1994–:2012: ordinary θ and `animatedModules_discrete`; the latter concerns ordinary B, as the repaired package now says. |
| EnhancedDerivedSheaves E4.1, E4.4 | Same file :2569, :2606, :2703: integer-derived completion, its unit and completed tensor; no general ambient ordinary-tensor closure is imported. |
| VStackSheavesAndLisseCategories VS2.1–VS2.2 | `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md:653`–:706 and :713–:776 at its indexed new-folder head: compact-Hausdorff solidity, measures, static coefficients and common light presentations. The common-presentation boundary is explicit at :53 and :715. |
| VS2.2 `ZSolidAnalytification.formalComplement` | Same file :764: discrete A, underlying-integer-solid modules and derived f-completion. It does not supply arbitrary summability-localization kernels. |
| HabiroRings §§2.6–2.12 | `TauCetiRoadmap/HabiroRings/README.md:525`–:711 at its indexed head; :65–:85 declares this package's light-spectral contract. Its factorial filtration and arithmetic idempotence remain its targets. |
| HigherHidaAndColemanTheory | `packages/HigherHidaAndColemanTheory/design/README.md:1824`, :1830, supplied head: R23–R24 request the broader localization and discrete-adic comparisons. The repaired consumer paragraph correctly separates the structures now supplied from its additional geometric requirements. |
| RefinedTraceMethods | `packages/RefinedTraceMethods/README.md:2521`, supplied head: existing block matches the commissioned downward move; its unit has π₀=ℤ_p. |
| LocallyAnalyticRepresentationsOfLocalGroups LR.3 | `packages/LocallyAnalyticRepresentationsOfLocalGroups/design/README.md:776`: finite E/ℚ_p, strongly inaccessible cutoffs, group-ring and functional-analysis interfaces exceed this light comparison's export. |
| VStackSheavesAndLisseCategoriesPartII | `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md:5`, supplied head: VS6–VS11 geometric continuation. The ambient AB6 continuation is separately named Part III. |

All 27 target `*Needs:*` lines and seven layer dependency summaries were read. R03 is the remaining explicit prerequisite omission. The repaired local dependency closure puts `cardinal-interchange` at §4.1 and the arbitrary-sum step of §6.4, not at free resolution §6.1 or realization §6.3. The independent-union gap feeds §§4.2, 5.3 and 5.4. Neither gap is used by §§7.1–7.4's actual proof routes; the coarse layer summaries do not create extra theorem prerequisites.

Both gap sentences match the top-level `design/plan.json` entries verbatim and have named earlier suppliers. Each is precise and minimal: one cardinal interchange with its stabilization consequence, and one independent directed-union law. Ordinary exact products do not state AB6, and ordinary Type-valued filtered/finite interchange does not supply the enhanced cardinal theorem.

The prescribed dependency command returned exit 0 and exactly:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. In `merge-order/ORDER.txt`, the supplier positions are 4, 19 and 149; SolidAnalyticRings is 150. HabiroRings, RefinedTraceMethods and LocallyAnalyticRepresentationsOfLocalGroups are later, at 219, 220 and 300. No tooling or order file was changed.

### Computed adversarial evidence

The following table records this round's new or expanded calculations. It includes every mathematical addition, every altered hypothesis/interface and all seven Lean declarations. The subsequent two tables retain the previous review's computed assertion and Check rows, with line locators updated by the actual README diff. Sampled and changed assertions were checked again against the sources and calculations above; unchanged rows are retained only because they contain computed values. Finite examples are negative controls and convention witnesses, not substitutes for the source/proof-route audit.


| Statement | Instances tried | Computed values on both sides / defining test | Result | Change |
| --- | --- | --- | --- | --- |
| §1.5 `natShift`, Lean :88 | 0,1,∞ | Images 1,2,∞; a constant-to-0 map gives 0,0,0 and is not this shift. | Correct real body | None |
| §1.5 `inftyPoint`, Lean :94 | Unique point; shift composite | Both maps give ∞; marking 0 instead gives shifted value 1≠0. | Marking commutes | None |
| §1.5 `nullSeq`, Lean :98 | Point sections; finite quotient with n isolated points | Cokernel kills the ∞ basis: π₀P(*)=⊕_ℕℤ; finite reduced rank n versus unreduced rank n+1. | Correct reduced object | None |
| §1.5 `nullShift`, Lean :102 | Basis e₀,e₁; dual coefficient e₁ | Covariant images e₁,e₂; precomposition sends dual e₁ to e₀. | Contravariance correct | None |
| §1.5 `IsLightSolid`, Lean :110 | ℤ,0, topological ℝ | Difference on finite-support sequences has inverse x_n=∑_(k≥n)b_k; at b=e₁ gives e₀+e₁. For ℝ, harmonic partial sums diverge, whereas a null solution's telescoping sums tend to x₀. Zero test is id_0. | Positive and negative objects separated | None |
| §1.5 abelian reflection, README :195 / Lean :115 | ℤ, ℝ,0 | Reflections ℤ,0,0; units id_ℤ, ℝ→0, id_0. | Genuine reflection assertion | None |
| §1.5 compact projective separator, same theorem | G=∏ℕℤ; Q=ℤ_p/δℤ_p; epimorphism ×p onto pG | Q(*)=0 but class of p^n at C is nonzero; Hom(G,Q) therefore detects what Hom(ℤ,Q)=0 misses. The map G→pG sends (a_n) to (pa_n), with inverse on its image. | Infinite generator is substantive | None |
| §1.5 ordinary derived reflection, README :197 / Lean :125 | ℤ in cochain degree 1; ℝ in degree 0; zero | H¹=ℤ passes the image condition; H⁰=ℝ fails; all H^n of zero vanish. Reflection shifts the integer object unchanged and kills ℝ. | Every integer degree retained | None |
| §1.5 new flatness API, README :205 | B=0,ℤ/2,ℤ/3 | Tensor with ∏ℤ gives 0,∏𝔽₂,∏𝔽₃ in degree zero; positive Tor=0. In contrast Tor₁(ℤ/p,ℤ/p)=𝔽_p. | Flat generator does not make every object flat | None |
| §1.5 new marked-map Check, README :209 | Inclusion and shift at ∞; at 0 | ∞→∞ in both composites; 0→1 under shift. | Detects wrong marking | None |
| §1.5 new tensor Check, README :217 | ℤ/2 and zero | π₀=∏𝔽₂ or 0, π₁=0; two torsion factors instead have π₁=𝔽₂. | Source RC(14) applies | None |
| §2.3 revised ordinary θ comparison, README :285 | Ordinary 𝔽₂[t]; topological ℚ_p | θ of polynomial input is static; free commutative derived weight-two homology has H₁(BΣ₂;𝔽₂)=𝔽₂. Section p^n of topological ℚ_p is not a section of δℚ_p. | No ordinary/condensed identification | None |
| §4.1 revised negative control, README :431 | n=0,1,2 and colimit; coordinatewise limit | Stage ranks 0,1,2; colim ranks gives ⊕ℤ, coordinatewise product gives ∏ℤ. The all-one vector is only on the latter side; ℕ has no upper bound in itself. | Outside ω₁-filtered hypotheses | None |
| §6.1 new uncountable free-sum Check, README :581 | u-small uncountable I; constant simplicial P=⊕_IΣ^bG_A | Realization=P on both sides; π_kP=0 for k<b, independently of simplicial degree. | No countable-limit interchange used | None |
| §6.1 old negative control, README :583 | A=0 versus A=δ𝕊 | Original all π=0; repaired π₋ₙΣ^(−n)G=∏ℕℤ≠0. | Check needs nonzero instance | R01 |
| §6.3 old negative control, README :615 | A=0 versus split normalized Σ^(−n)δ𝕊 | Original every tail=0; repaired suspended layers=δ𝕊 and tail π₀ is a nonzero sum of ℤ. | Check needs nonzero instance | R01 |
| §6.4 arbitrary-sum passage, README :621 | Countable subsets J_n of I | ⋃_nJ_n is countable and bounds all J_n; colim_J⊕_JΣ^dG=⊕_IΣ^dG. Empty I yields 0 throughout. | ω₁-filtered use belongs here | None |
| §6.4 quotient boundary, README :31,:643 | p=2,3; r=0,1,2 | r=0 gives cofib(id)=0; positive r gives H𝔽_p⊕ΣH𝔽_p, transition diag(1,0), limit H𝔽_p. | Positive-tail formula correct | R02 |
| §7.2 changed square statement/API, README :683,:697 | A=A′=B=Hℤ, B′=H𝔽₂; M=Hℤ | Left path H𝔽₂, right path H𝔽₂, direct extension H𝔽₂. The algebra pushout of the initial span is Hℤ. | No pushout needed | None |
| §7.2 rewritten derived-square Check, README :705 | A=Hℤ, B=A′=H𝔽₂; derived B′ | Both paths B′, π₀B′=π₁B′=𝔽₂, other groups 0, from the zero differential after mod 2. | Derived tensor preserved | None |
| §7.2 new non-pushout Check, README :707 | Identity initial span, terminal reduction mod 2 | Two composites send 1→1∈𝔽₂, not to the pushout's ℤ. | Coherent square suffices | None |
| §7.2 stronger target Check, README :709 | All algebras Hℤ; target category {0} | Intermediate extension M; both terminal completions 0; target kernel all modules versus intermediate kernels 0. | No kernel-generation premise | None |
| §7.3 discrete animated coefficient unit, README :715 | Discrete R=ℤ[T], f=T; finite-support b=e₂ | Inverse difference is e₂+Te₁+T²e₀; applying 1−Tσ* gives e₂. Every discrete homotopy module has the same finite-support inverse. | A remains complete; unit equivalence | None |
| §7.3 generating sets, README :715,:733 | R⁺=ℤ, F=∅ or {1}; R⁺=ℤ[T], F={T} | Integer tests add no condition; for T and b=e₁ inverse=e₁+Te₀. ℚ_p with T=1/p has nonzero kernel p^n, so the T-test adds a real restriction. | Matches RC Lemma 5.5.5 | None |
| §7.3 polynomial pairs, README :745 | (ℤ[T],ℤ) and (ℤ[T],ℤ[T]) | Same coefficient δHℤ[T]; categories D_∅ and D_F for F={T}. ℚ₂ with T=1/2 belongs only to D_∅. | Algebra alone does not determine structure | None |
| §7.3 polynomial negative control, README :747 | p=2 and p=3 | 2^n−(1/2)2^(n+1)=0 and 3^n−(1/3)3^(n+1)=0; b₀=1 in both cases. | D_F⊂D_∅ for F={T} direction correct | None |
| §7.3 integral closure Check, README :749 | R=𝔽₂[ε]/ε²; εT | (εT)²=0, εT∉R; (1−εTσ*)(1+εTσ*)=1. | Nonreduced constant subring need not be integrally closed | None |
| §7.3 connective-inversion route, README :717 | f=0, ε with ε²=0; right matrix action | Inversions are 1 and 1+εσ*, so coefficient algebra unchanged; (1,0)e₁₂e₂₁=(1,0), but (1,0)e₂₂=0. | Connective local algebra and handedness agree | None |
| §7.4 static condensed B, README :755 | B=ℚ_p with its topology; B=0 | π₀HB=B, π_kHB=0 for k≠0; p^n on C is continuous but not eventually constant. Zero ring has only zero modules. | Static is not discrete | None |
| §7.4 module-generator proof, README :757 | B=ℤ/2,ℤ/3,0 | B⊗ᴸ■∏ℤ=∏B in degree zero, positive Tor=0; Hom_B(B⊗G,M)=Hom(G,UM). At M=B, both point Hom groups are ⊕ℕB. | Flat free generators give the derived comparison | None |
| §7.4 derived tensor Check, README :767 | Two ℤ/2 objects over solid ℤ; tensor over B=ℤ/2 | Over ℤ, π₀=π₁=𝔽₂. Over B the unit B⊗_B B=B has only π₀=𝔽₂. | Base ring retained; no underived replacement | None |
| §7.4 cutoff/free-measure comparison | Finite S=∅,*,2; identity enlargement | Free objects 0,B,B² and their Dirac maps are unchanged under the supplied finite common presentation. | No unrestricted-site equivalence inferred | None |
| Gap declarations and consumer conditionality | κ=ω₁; independent denominators | Countable subsets have a countable union upper bound; independent n_j=j+1 realizes (1/(j+1)!)_j, while no constant n does. The two gap sentences match the plan exactly. | Distinct precise contracts | None |
| R03 prerequisite repair | Growing towers at (1,2) | 2·3=6 coordinates before and after adding the §3.3 dependency; 3.3 precedes 3.4. | Missing edge is noncyclic | R03 |


### Adversarial table: conventions, definitions, targets and API laws

Here π denotes homotopy sheaves unless “at *” is written, Map denotes the mapping spectrum in the stable setting, C=ℕ∪{∞}, P is the integer null object, N its spectral counterpart, and G=L■N. “Keep” means the computed instance supports retaining the statement with its written hypotheses. A row's example does not extend the theorem beyond those hypotheses. README line numbers identify individual assertions, including repeated appearances of the same law.

| Statement and README location | Instances tried | Values computed on the two sides, or defining test and wrong model | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: light site/universes, 17 | ∅; two points; discrete ℕ; uncountable Cantor cube | ∅ and two points satisfy compact/T2/second-countable tests; discrete ℕ fails compactness; an uncountable cube fails second countability. Empty stable product=0, rank 2×3=6. | Keep; no enlargement by an unmarked equivalence. | None |
| Module handedness, 19 | e₁₂,e₂₁ on row (1,0) | ((1,0)e₁₂)e₂₁=(1,0)e₁₁=(1,0); (1,0)e₂₂=(0,0). | Right precomposition order retained. | None |
| Grading, 21 | ΣHℤ; cochain ℤ at 2 | π₁ΣHℤ=ℤ, π₀=0; H²=ℤ gives π₋₂=ℤ, not π₂. | Keep. | None |
| Tensor sign, 21 | Two degree-one classes; two degree-zero classes | Swap acts by (−1)^(1·1)=−1 versus (−1)^0=+1; two swaps give +1. | Keep. | None |
| Coefficient distinction, 23 | 𝕊, Hℤ, weight two over 𝔽₂ | π₁𝕊=ℤ/2 versus π₁Hℤ=0; H₁(BΣ₂; 𝔽₂)=𝔽₂ versus animated polynomial π₁=0. | Keep both distinctions. | None |
| Shift convention, 25 | e₀,e₁ | σ*e₀=0, σ*e₁=e₀; (1−σ*)e₁=e₁−e₀; inverse(e₁)=e₁+e₀. | Keep; right shift gives e₂ and fails. | None |
| Discrete/product comparison, 27 | e_n∈∏_ℕℤ | Every fixed coordinate is eventually 0, so e_n→0 in the product topology; e_n≠0 for all n, so no convergence to 0 in the discrete product. | Keep δ(product)→product(δ), not its inverse. | None |
| Polynomial convention, 29 | 𝕊[t]/t² and constant section | π₀ has basis 1,t, t²=0; s(t·1)=0 whereas t·s(1)=t≠0. | Sphere-linearity only; monoid algebra, not free E∞ algebra. | None |
| Scalar fibers/quotients, 31 | a₀=1; scalar 0 | B₀=cofib(id)=0, J₀=A; cofib(0)=A⊕ΣA. Marked map J₀→A=id, not 0. | Keep. | None |
| Profile/quotient direction, 31 | t²→t; p=2,3 on H𝔽_p | t²x remains t²x in tA; positive quotient transition has π₀=id, π₁=0, tail limit H𝔽_p. At exponent 0 quotient=0. | Keep direction; R02 clarifies positive range. | R02 |
| 1.1 hypersheaf category, 85 | Zero hypersheaf; constant nonzero presheaf | At ∅: 0 satisfies descent, constant Hℤ gives ℤ≠0. On a two-point disjoint union: sections X(*)², not X(*). | Definition discriminates presheaves from sheaves. | None |
| 1.1 stable/presentable/closed construction, 85–87 | id:X→X; finite free inputs | cofib(id)=0=fib(id); Hom(𝕊²,Hℤ³)=(Hℤ)^6 on both tensor–Hom descriptions. | Keep supplied localization route. | None |
| 1.1 limits/colimits, 85 | Constant tower Hℤ; coproduct of two Hℤ | Limit=Hℤ with identity projections; coproduct=Hℤ², with π₀=ℤ²; empty value remains 0. | Keep sectionwise limits and hypersheafified colimits distinct. | None |
| 1.1 hypercover refinement, 85–87 | Identity cover; two-point cover of * | Identity totalization=X(*); Čech degrees have 2^(n+1) points, finitely many at every n and countably many degrees. | Finite matching refinements give the asserted countable shapes. | None |
| 1.1 API free evaluation, 93 | T=∅,* and two points, M=Hℤ | Map from 0,𝕊,𝕊² has π₀=0,ℤ,ℤ², equal to M(T). | Keep. | None |
| 1.1 API detection, 95 | id versus zero on δHℤ | On * the values send 1 to 1 versus 0; id is invertible, zero is not. On all values the zero object has zero groups. | Keep coherent value detection. | None |
| 1.1 API hyperdescent, 97 | Identity hypercover of * | M(*)→Tot(constant M(*)) is id; on Hℤ, π₀ map is 1:ℤ→ℤ. | Keep. | None |
| 1.1 API free tensor, 99 | T two points/U three points; T empty | Left rank 2·3=6=right rank; empty case 0⊗𝕊³=0=𝕊[∅]. | Keep. | None |
| 1.2 δ/adjunction/unit/monoidality, 111 | X=0,𝕊 and ΣHℤ | Unit gives π₀ 0→0, ℤ→ℤ with 1→1; on ΣHℤ gives π₁ ℤ→ℤ. δ𝕊⊗δ𝕊=δ𝕊; zero functor fails the ℤ unit. | Keep fully faithful colimit-preserving embedding. | None |
| 1.2 homotopy and inverse-limit map, 111 | Hℤ; H(ℤ/p^r) tower | π₀δHℤ=discrete ℤ; limit's sections on ℤ_p include id:ℤ_p→ℤ_p, absent from locally constant sections of δHℤ_p. | No unjustified limit equivalence. | None |
| 1.2 API functor/shifts, 119 | ×2 then ×3 on Hℤ; one suspension | δ(×3∘×2) acts by 6=3·2; zero map acts by 0; shift moves ℤ from π₀ to π₁ on both sides. | Keep. | None |
| 1.2 API unit in all degrees, 121 | 𝕊⊕Σ𝕊 | π₀=ℤ and π₁=(ℤ/2)⊕ℤ on both sides; both summands retained by the unit. | Keep. | None |
| 1.2 API tensor coherence, 123 | Ranks 2,3,1 | Both associations have 2·3·1=6 coordinates; unsuspended swap changes (i,j) to (j,i) with +1. | Keep. | None |
| 1.3 N/marked shift and transport, 135–137 | C versus singleton marked point | Point π₀N=ℤ^(ℕ), while the singleton cofiber=0; unreduced free C has an extra ℤ at ∞. ULift preserves these basis labels and σ(e_n)=e_(n+1). | Keep marked construction and separate universe target. | None |
| 1.3 internal-projective retract, 137 | Integer marked inclusion/retraction | On the ∞ generator the composite is 1; reduced summand kills ∞. Over base integers the internal epi test is the pinned theorem, transferred through this idempotent. | No duplicate native proof. | None |
| 1.3 API functoriality, 143 | Shift twice; identity | On point basis e_n, σ²(e_n)=e_(n+2), identity(e_n)=e_n; both maps send marked ∞ to ∞ before quotient. | Keep. | None |
| 1.3 API Hom fiber, 145 | M=δHℤ | Continuous C→ℤ sequences are eventually constant; fiber of limit evaluation consists exactly of eventually zero sequences, ⊕_ℕℤ. | Keep; unreduced Hom includes a constant ℤ. | None |
| 1.3 API precomposition, 147 | b=e₁ | Coefficient at 0 is b₁=1, at 1 is b₂=0; σ*b=e₀. | Keep. | None |
| 1.3 API universe/scalar transport, 149 | Lift of e₀,e₁ over ℤ | Both lifted shift paths send e₀ to e₁; reduction at marked point is 0 on both paths. | Keep comparison on common presentations only. | None |
| 1.4 solidity definition, 161 | 0, δHℤ, topological Hℝ | Tests: 0→0 invertible; finite-support difference invertible by tails; harmonic b_n has no null tail solution in ℝ. | Test excludes a plausible ordinary-topological wrong model. | None |
| 1.4 API internal/external iff, 169 | δHℤ at *; Hℝ harmonic test | Cone-test mapping groups vanish for δHℤ; for Hℝ the harmonic cokernel class is nonzero already at *. | Both directions follow by free-evaluation detection. | None |
| 1.4 API equivalence/inclusion, 171 | id, −id on Hℤ | Both tests conjugate to the same invertible difference; endomorphisms in the full subcategory and ambient category both have π₀=ℤ. | Keep. | None |
| 1.4 API discrete solidity, 173 | δH𝔽₂; δΣHℤ | Tail inverse of e₁ is e₀+e₁, with difference e₁ in either degree; constants at ∞ are removed. | Keep arbitrary spectral shifts. | None |
| 1.5 abelian/derived null categories, 185 | ℤ, ℝ, Σℤ | ℤ passes via finite tail sums; ℝ fails on harmonic sequence; Σℤ has one solid H⁻¹=ℤ. | Definitions have positive and negative models. | None |
| 1.5 API Grothendieck/closure/extensions, 193 | ×2 on ℤ; split ℤ extension; ⊕ℤ and ∏ℤ | ker=0, coker=ℤ/2; middle extension=ℤ²; sum has finite support, product has all-one vector. Both ambient and solid operations give these values. | Keep; extension and colimit laws are RC targets. | None |
| 1.5 API internal Hom, 193 | Hom(ℤ²,ℤ); ℤ target | Internal Hom=ℤ²; each coordinate null test has the same tail inverse. | Keep arbitrary source, solid target condition. | None |
| 1.5 API reflection/tensor/unit/ℝ, 195 | ℤ, ℤ², ℝ | Hom(Lℤ,ℤ)=ℤ=Hom(ℤ,ℤ); ℤ⊗■ℤ²=ℤ²; Lℝ=0. Identity reflector would give ℝ≠0. | Keep. | None |
| 1.5 API derived inclusion/cohomology, 197 | Σℤ versus Σℝ | H⁻¹=ℤ passes; H⁻¹=ℝ fails; all other cohomology is 0. Products and filtered sums retain those degrees. | Both directions tested. | None |
| 1.5 API derived Hom closure, 197 | RHom(ℤ,Σℤ) | Σℤ on both ambient and solid sides, H⁻¹=ℤ and otherwise 0. | Keep. | None |
| 1.5 API derived full faithfulness and left derivation, 199 | ℤ, Σℤ; two torsion factors | End(ℤ)=ℤ, Ext¹(ℤ,ℤ)=0 in both categories; 𝔽₂⊗ᴸ■𝔽₂ has H⁰=H⁻¹=𝔽₂. | Keep derived tensor rather than its heart truncation. | None |
| 1.5 API free measures/projectivity/generation, 201 | S=∅,*,2,C; topological/discrete ℤ_p quotient Q | Measures are 0,ℤ,ℤ²,ℤ×∏ℕℤ. Q(*)=0 while the class of p^n at C is nonzero, so finite S cannot generate. | Infinite hypothesis retained; product basis itself need not be canonical. | None |
| 1.5 API product tensor, 203 | Empty; ranks 2,3; I=J=ℕ | 0=0; ℤ⁶=ℤ⁶; countable product on ℕ² on both sides, higher Tor=0. | Keep countable scope. | None |
| 2.1 null-Hom exactness/colimits, 235 | ×2 on δHℤ; ΣHℤ | Hom(N,δHℤ)(*)=⊕ℕℤ; coker ×2=⊕ℕ𝔽₂, matching Hom(N,δH𝔽₂)(*); suspension moves the same group to degree 1. | Keep internal, not arbitrary sectionwise projectivity. | None |
| 2.1 solidity and complete t-structure, 235 | ΣHℤ, ΣHℝ, 𝕊⊕Σ𝕊 | Solid iff all π are solid: first passes, second fails; third has π₀=ℤ, π₁=(ℤ/2)⊕ℤ. Postnikov tower is eventually fixed in each specified degree. | Keep all homotopy sheaves; heart alone does not determine algebra. | None |
| 2.1 API truncations, 243 | ΣHℤ | τ≤0=0, τ≥1=ΣHℤ; π₁ comparison is ℤ→ℤ, excluded degrees are 0. | Keep. | None |
| 2.1 API heart, 245 | B=ℤ and 0 | π₀HB=B, π_kHB=0 for k≠0; H0=0. | Keep. | None |
| 2.1 API suspension, 247 | Hℤ, b=0 | Before: π₀=ℤ; after: π₁=ℤ, π₀=0; lower bound changes 0→1. | Keep. | None |
| 2.2 reflection/colimit/Hom closure, 259 | N; solid Hℤ; zero | L■N has π₀(*)=∏ℕℤ versus N(*)=⊕ℕℤ; L■Hℤ=Hℤ; Hom(𝕊²,Hℤ)=Hℤ²; L■0=0. | Keep genuine reflection, not identity. | None |
| 2.2 monoidal/connective/module construction, 259 | Σ^b𝕊⊗Σ^c𝕊; A=Hℤ; A=0 | Tensor=Σ^(b+c)𝕊 with first π=ℤ; module heart over Hℤ has π₀ modules; zero algebra admits only zero modules. | Keep arbitrary integer bounds. | None |
| 2.2 free spectral measures, 259 | ∅,*,2 and C | Finite quotient limits give 0,𝕊,𝕊² and 𝕊×∏ℕ𝕊; π₁ of the last is (ℤ/2)×∏ℕℤ/2. | Sphere stems retained. | None |
| 2.2 API adjunction, 267 | Source 𝕊; target δHℤ | Both mapping spectra have π₀=ℤ, π_k=0 otherwise; the unit sends 1→1. | Keep. | None |
| 2.2 API idempotence, 269 | N and 0 | L■N=G=L■G; the two maps G→L■G induce identity on each integer coordinate; at 0 both maps are unique. | Keep units marked. | None |
| 2.2 API closed tensor, 271 | C=𝕊²,D=𝕊³, M=Hℤ | Hom(𝕊⁶,Hℤ)=Hℤ⁶=Hom(𝕊²,Hℤ³); finite coordinates agree. | Keep. | None |
| 2.2 API presentation/naturality, 273 | Two-point set→*; refining its identity presentation | Both free-measure maps send (a,b) to a+b; refined identity partitions leave ℤ² and its two projections unchanged. | Zero map fails the marked unit. | None |
| 2.3 Hℤ equivalence and detection, 285 | Hℤ; Σ^b𝕊; H𝔽_p⊗HℤH𝔽_p | Units both ℤ at degree 0; bottom π_b is ℤ→ℤ identity; torsion tensor gives π₀=π₁=𝔽_p for p=2,3. | Keep bounded-below detection and relative tensor. | None |
| 2.4 generator/product/t-exact mapping, 301 | G; A=Hℤ; A=0 | π₀G(*)=∏ℕℤ, π₁G(*)=∏ℕℤ/2; Hℤ⊗■G has only π₀=∏ℕℤ; G_0=0 and all its modules=0. | Keep, including zero-category generation. | None |
| 2.4 endomorphism ring/right action, 301 | Two-coordinate retract | e₁₂e₂₁=e₁₁; φe₁₁=φ, φe₂₂=0 for φ=(1,0). Endomorphism spectrum has no negative π by mapping t-exactness. | Right action order retained. | None |
| 2.4 API reflection unit/projections, 309 | e₀,e₁∈N(*) | Images in product are coordinate basis e₀,e₁; first two projections are (1,0),(0,1). Zero unit fails both. | Keep specified measure unit. | None |
| 2.4 API homotopy formula, 311 | k=−1,0,1 | Both sides give 0, ∏ℕℤ, ∏ℕℤ/2, respectively. | Keep every degree. | None |
| 2.4 API module adjunction, 313 | A=Hℤ, M=A; A=0 | Both Map_A(A⊗G,A) and Map(G,A) have π₀=⊕ℕℤ; for A=0 both are 0. | Keep. | None |
| 3.1 product comparison/coherence, 337 | I,J empty/finite/ℕ | Empty=0; 2×3 gives six spheres; ℕ×ℕ gives countable product. Coordinate (1,2) sends e₁⊗e₂→1 on both sides. | Keep projection map, not an arbitrary equivalence. | None |
| 3.2 split tower definition, 353 | 0; identity rank one; ×2 on rank one | Sections: unique 0; id; impossible integer b with 2b=1. | Split hypothesis excludes bad tower. | None |
| 3.2 decomposition theorem/spectral lift, 353–355 | Projection ℤ³→ℤ²; retraction matrix diag(1,1,0) | Kernel rank=1, summand ranks 2+1=3; idempotent squared equals itself; lifted sphere decomposition has π₀=ℤ³ and π₁=(ℤ/2)³ on both sides. | Keep finite integer basis and bounded-below detection. | None |
| 3.2 API data, 361 | d(x,y)=x, s_a(x)=(x,ax) | ds_a(x)=x for a=0,1; s_0d≠id on (0,1), so only the stated right-inverse law is imposed. | Keep coherent sections as data. | None |
| 3.2 API equal maps, 363 | Identity tower, stage map ×2 | Both coherently identical maps of limits act by 2 on π₀ℤ. | Keep; no equality from unrelated stage homotopy classes. | None |
| 3.2 API kernel/limit formulas, 365 | P_n=𝕊^(n+1) | P₀ rank 1; first n kernels rank n; total rank n+1; limit coordinates are ∏ℕ𝕊. | Keep. | None |
| 3.2 API choice independence, 367 | s_0 versus s_1 for d(x,y)=x | Presentations use (x,y)↦(x,y) versus (x,y−x); inverse adds x; both retain first projection x. | Keep marked presentation comparison, not equality of coordinates. | None |
| 3.3 independent/diagonal comparison, 379 | Growing towers; constant rank-one | Stage (1,2) rank=6; diagonal stages cover every pair by max(m,n); rank-one limits give 𝕊=𝕊⊗■𝕊. | Keep independent indices and inverse-direction cofinality. | None |
| 3.3 naturality without section preservation, 379 | Shear (x,y)↦(x,y+x) with d(x,y)=x | d∘shear=x=d, but shear∘s_0=s_1; compatible limit maps preserve projection despite changing section. | Keep all coherent tower maps. | None |
| 3.4 balancing/transitivity, 395 | A=𝕊[t], X=Y=A; A=𝕊; X=0 | Absolute π₀=ℤ[t₁,t₂], balancing sends both variables to t, giving ℤ[t]; at unit both tensors=X⊗Y; zero gives 0. | Keep; R03 adds projection prerequisite. | R03 |
| 3.4 dualizable limit comparison, 395 | B=A²; B=Hℚ over Hℤ | Finite free B gives (∏M_i)²=∏(M_i²); rationalization of ∏ℤ has a common denominator, whereas (2⁻ⁿ)∈∏ℚ has none. | Dualizability retained; false arbitrary exchange excluded. | None |
| 4.1 countable interchange, 421 | Empty K; terminal J; ordinary filtered counterexample | Empty limits=0 on both sides; terminal J gives the same limit. With F(n,k)=Hℤ for k<n: π₀ left=⊕ℕℤ, right=∏ℕℤ, distinguished by (1,1,…). | Keep ω₁-filtered hypothesis; gap owns general theorem. | None |
| 4.1 sectionwise hyperdescent/module lift, 421–423 | Identity hypercover; fixed A, zero diagram | Tot of constant X is X, so both sectionwise paths give X; all limits and colimits of zero modules give 0. Countable Čech degrees use the specified cardinal bound. | Keep fixed algebra; no varying-algebra assertion. | None |
| 4.2 independent directed bounds, 437 | B_j=ℚ; B_(j,n)=(1/n!)ℤ | Independent index n_j=j+1 contains (1/(j+1)!)_j on both sides; a diagonal n would require j! divide n! for all j and fails. | Keep independent choices; nonempty directed sets understood in the usual sense. | None |
| 4.2 split tower homotopy/surjectivity, 437 | P_n=𝕊^(n+1), k=0,1,−1 | Limits give ∏ℕℤ, ∏ℕℤ/2, 0; projection to n+1 entries is onto by zero extension; lim¹=0 in each degree. | Keep split rather than arbitrary tower. | None |
| 5.1 coefficient datum, 463 | A=𝕊[[t]], a_r=t^r; A=0; 𝕊/p | B_r has ranks 0,1,2 for r=0,1,2 and limit A; A=0 gives all stages 0; π₀𝕊/p=ℤ/p is not finite free. | Definition has admitted and excluded models. | None |
| 5.1 completion and marked ideals, 463–465 | t^r on 𝕊[[t]] | π₀J_r=t^rℤ[[t]]≅ℤ[[t]]; marked map sends 1 to t^r, not 1; Λ_a(A)=A by completeness. | Keep unmarked isomorphism separate from inclusion. | None |
| 5.1 API data invariance, 471 | Reindex stages by 2r | Quotient ranks become 2r, but compatible power series coefficients and inverse limit remain ℤ[[t]] in degree 0. | Coherent datum, not just quotient isomorphism classes. | None |
| 5.1 API ideal maps, 473 | r=1,s=2, a_r=t^r | J₂→J₁ multiplies abstract A-coordinate by t; composing J₁→A gives t² on both paths. | Keep marking/divisibility. | None |
| 5.1 API natural unit/scalar maps, 475 | ×t:A→A and stage r=2 | Both composites send 1 to t mod t²; identity sends 1 to 1; zero sends it to 0. | Keep. | None |
| 5.1 API cofinality, 477 | All powers versus even powers | Both limits have arbitrary coefficients (c₀,c₁,…); projection to t² returns (c₀,c₁) on both sides. | Keep cofinal coherent reindexing. | None |
| 5.1 API cofiber/tensor, 479 | M=A, a=t; M=H𝔽₂, a=0 | First both quotients are 𝕊; second both are H𝔽₂⊕ΣH𝔽₂, with π₀=π₁=𝔽₂. | No underived quotient or quotient algebra substituted. | None |
| 5.2 profile definition/order/stages, 491 | f(j)=j, f=0; f=j+1→g=j | Sublevel sizes for r=0,1,2 are 0,1,2 versus 0,∞,∞; map t^(j+1)x remains itself in t^jA. | Keep properness and reversed order. | None |
| 5.2 block-map definition, 491–493 | Identity, duplication, attempted infinite column of ones | Supports are {j}, {2j,2j+1}; an image (1,1,…) is not in ⊕ℕA for A≠0, hence is not a map from a singleton free block. | Actual finite-output factorization excludes wrong model. | None |
| 5.2 API profile equality, 501 | f=j and g=j+1 | At j=0 values 0 versus 1, so unequal; replacing f(0) by7 changes only one finite sublevel membership and retains properness. | Keep. | None |
| 5.2 API filtered/not ω₁-filtered, 503 | f=j,g=j+1; f_k=max(j−k,0) | min(f,g)=j; any common target h≤f_k for every k must satisfy h(j)≤f_j(j)=0, hence h=0, not proper. | Keep distinction. | None |
| 5.2 API transition composition, 505 | j+2→j+1→j, t-adic datum | Abstract multipliers t·t=t²; marked element t^(j+2)x unchanged through either path. | Keep. | None |
| 5.2 API block-map composition, 507 | Duplication twice | Support {4j,4j+1,4j+2,4j+3}, cardinal 4; identity support {j}. | Keep finite unions. | None |
| 5.2 API automatic finite factorization, 509 | Block A and block ∏ℕA | A⊗𝕊=A; A⊗■G=∏ℕA. Both are retracts/free images of compact G, so a point of Map into a sum occurs at a finite subsum; identity A→A uses one output. | Keep compactness argument, not pointwise finite columns alone. | None |
| 5.3 spectral null-family equivalence, 527 | A=𝕊[[t]], singleton blocks | (t^j) has r survivors mod t^r on both sides; constant ones has infinitely many survivors already mod t and belongs to neither side. | Keep all homotopy degrees, no profile ω₁ argument. | None |
| 5.3 comparison map/modulo rule, 527–529 | f(j)=j, r=2 | Only j=0,1 contribute, giving 1,t; for j≥2 the marked composite to A/t² is zero by divisibility. | Keep specified nullhomotopies. | None |
| 5.3 mono/lim¹ proof input, 529 | t-adic stages, k=0,1 | Projection of ∏ℕπ_k𝕊 to first r coordinates is onto; π_kJ_r is the tail subgroup; lim¹=0. | Independent bounds plus exact products suffice. | None |
| 5.4 every-degree and naturality, 543 | k=−1,1; duplication and fold | Negative degree=0; degree 1 has (ηt^j), modulo t² gives η,ηt. Duplication gives outputs η,η,ηt,ηt; fold gives η+ηt modulo t². | Keep spectral rather than π₀-only result. | None |
| 5.4 scalar-data maps, 543 | Identity datum; A→0 | Identity preserves every t^r ideal and coefficient; zero datum receives only 0, so both completion paths give 0. | Marked tower compatibility, not arbitrary algebra map. | None |
| 6.1 uniform resolution/comparison, 571 | M=0; M=Σ^bG_A | Zero and constant simplicial resolutions realize to 0 and Σ^bG_A; each term has the same bound b. For A=δ𝕊, the latter has π_b=∏ℕℤ. The identity simplicial map realizes the identity. | Keep one b for all simplicial degrees; R01 fixes non-example. | R01 |
| 6.2 general quotient connectivity/exactness, 587 | a=1, a=0; Hℤ with 2^r | Quotients are 0, M⊕ΣM, H(ℤ/2^r); first nonzero degrees are never below b. In the last tower lim¹=0, π₋₁Λ=0, π₀Λ=ℤ₂. | Keep sharp ≥b without split stages or complete A. | None |
| 6.2 bottom-transition argument, 589 | π_bM=ℤ, a_r=2^r | coker at r is ℤ/2^r; transition sends [x] mod 2^(r+1) to [x] mod 2^r and is onto. At r=0 the target is0. | No ideal-tower substitution. | None |
| 6.3 realization/tail theorem, 603 | Uniform b=0; normalized degree 1 Hℤ | Degree1 layer is ΣHℤ, with π₁=ℤ, π₀=0; tail after d has degrees ≥d+1 on both completed and uncompleted sides. | Keep finite-skeleton proof, not arbitrary limit/realization interchange. | None |
| 6.3 fixed degree bound/bar action, 603–605 | b=0, k=1,d=2; bar over Hℤ on connective modules | Tail≥3 has π₁=0 on both sides; finite-skeleton comparison determines π₁. A-action through X gives a·(x⊗y)=(ax)⊗y=x⊗(ay) after balancing. | Keep specified A-linearity; R01 fixes failing example. | R01 |
| 6.4 prime embedding/tensor/unit, 619 | X=H𝔽_p; p=2,3; completed sphere | Positive quotient tail limit=X, adjunction unit=id; completed sphere π₀(*)=ℤ₂ or ℤ₃ versus ambient ℤ. | Keep completed codomain and all primes. | None |
| 6.4 orthogonality/reflection, 619 | Hℤ_p, Hℤ[1/p] | p-local telescope test into Hℤ_p is0; completion of Hℤ[1/p] is0 since each cofiber of invertible p^r is0. | Both positive and negative completion models tested. | None |
| 6.4 API evaluation unit, 627 | e_pH𝔽_p at * | π₀=𝔽_p, higher π=0, and unit sends 1→1. | Keep. | None |
| 6.4 API bounded tensor/unit, 629 | Two completed sphere units | Tensor in the completed solid category is the same unit, π₀(*)=ℤ_p on both sides. Ambient uncompleted unit would have ℤ. | Keep. | None |
| 6.4 API Hℤ relative comparison, 631 | Hℤ_p⊗HℤHℤ_p; H𝔽_p⊗Hℤ_pH𝔽_p | Solid first tensor=Hℤ_p; second has π₀=π₁=𝔽_p. | Keep absolute, relative and completed operations distinct. | None |
| 6.4 API full reflection tests, 633 | All shifts of p-inverted generator; rational input | Inverted scalar cofibers=0, hence reflector kills rational input; an unshifted π₀-only test cannot see a shifted nonzero rational object. | Keep all shifts and all light free tests. | None |
| 7.1 analytic structure definition, 657 | All modules; {0}; perfect Hℤ-modules | Reflectors id and 0 satisfy closure/connectivity; perfects fail coproduct closure since ⊕ℕHℤ has infinite rank and is not perfect. | Definition admits two valid structures and excludes wrong one. | None |
| 7.1 API data determine structure, 665 | Same A=Hℤ, D=all versus D=0 | Units on A have π₀ maps ℤ→ℤ versus ℤ→0; underlying algebra alone does not determine D. | Keep specified inclusion and unit. | None |
| 7.1 API marked uniqueness, 667 | Two identity reflectors on all modules | Unit comparison sends 1→1; composing it with −1 sends 1→−1 and fails the same unit marking. | Keep uniqueness under units, not unmarked equivalence. | None |
| 7.1 API morphism composition, 669 | Hℤ→H𝔽₂ with full structures; identity | Restriction returns the same underlying 𝔽₂ group; composite with identity equals the reduction map, 1↦1. | Keep. | None |
| 7.1 API completed iff unit iso, 671 | D=all; D=0, A=Hℤ or 0 | id:ℤ→ℤ invertible; ℤ→0 not invertible; 0→0 invertible. | Both directions tested. | None |
| 7.2 complete tensor/unit/algebra, 683 | D=all and D=0 over Hℤ | Tensor units have π₀=ℤ and 0; in D=0 both M⊗hatN and L_D(M⊗N) are 0. | Keep Â distinct from A. | None |
| 7.2 compatible scalar/commuting-square theorem, 683–685 | Identity square with zero target; H𝔽₂←Hℤ→H𝔽₂ | Both completed paths=0 in zero target despite unequal kernels. Trivial-structure pushout has π₀=π₁=𝔽₂ on both paths. | No kernel-generation assumption needed. | None |
| 7.2 API tensor unit, 691 | D=all; D=0 | L_DA=A versus 0; unit tensor sends M to M in each category (only M=0 in second). | Keep. | None |
| 7.2 API scalar adjunction, 693 | A=Hℤ,B=H𝔽₂, M=A,N=B, full structures | Both mapping spectra have π₀=𝔽₂, π_k=0 otherwise; units send 1→1. | Keep. | None |
| 7.2 API composition/coherence, 695 | Hℤ→H𝔽₂→H𝔽₂ and M=Hℤ | Both paths give H𝔽₂ with the same 1; third identity extension changes neither map nor object. | Keep. | None |
| 7.2 API completed square paths, 697 | Same square, all B′-objects killed | Left path 0, right path 0, direct target completion 0; ordinary pushout before completion can be nonzero. | Target reflector retained. | None |
| 7.3 summability/localization/connectivity, 713–717 | F=∅,{0},{1}; A=Hℚ_p,f=p⁻¹ | First three tests give all solid modules. In last test b_n=p^n has b₀=1 and b_n−p⁻¹b_(n+1)=0, so A is not local. | Definition excludes wrong completed-unit claim. | None |
| 7.3 endomorphism-inversion route, 717 | f=0; f nilpotent of square 0 | Inverted endomorphism is 1 or 1−fσ*, with inverse 1 or1+fσ*; the localization is the original connective algebra in both cases. | Keep explicit connective inversion target; general reflection alone would not suffice. | None |
| 7.3 API test/representatives, 723 | f=ε in 𝔽₂[ε]/ε² | (1−εσ*)(1+εσ*)=1−ε²(σ*)²=1; changing to equal scalar class leaves this identity unchanged. | Keep internal test. | None |
| 7.3 API free/local adjunction, 725 | F=∅, C=Hℤ, M=Hℤ | L_FC=C; both Map groups have π₀=ℤ and same 1. | Keep. | None |
| 7.3 API monotonicity, 727 | ∅⊆{p⁻¹} on Hℚ_p | Source has A as an object, target excludes A by b_n=p^n; L_target∘id=L_target. | Nontrivial direction D_F′⊆D_F verified. | None |
| 7.3 API scalar naturality, 729 | Hℤ→H𝔽₂, test f=0 | Both tests are identity; restriction preserves locality and 0 maps to 0. | Keep requirement that scalar tests are carried to target tests. | None |
| 7.3 API nilpotence, 731 | d=1,f=0; d=2,f=ε | Finite geometric inverses are 1 and 1+εσ*; multiplying gives 1 in either case. | Keep characteristic 2 and nonreduced inputs. | None |
| 7.4 common-presentation measure equivalence, 755 | Integer measures at ∅,*,2; zero structure over Hℤ | Free complete objects 0,ℤ,ℤ² agree; zero structure has μ[*]=0, so B→μ[*] is not invertible for B=ℤ and it is uncompleted on both sides. | Keep static coefficients and actual Dirac unit. | None |
| 7.4 completed iff, tensor/Hom/scalar comparisons, 755–757 | Integer structure; H𝔽₂ relative tensor; E=ℚ₂ | Dirac at * = id_ℤ; relative tensor has π₀=π₁=𝔽₂; measure product excludes (2⁻ⁿ), which an unrestricted product includes. | Both completedness directions and denominator boundary tested. | None |
| 7.4 animated/static and cutoff restrictions, 755–757 | B=𝔽₂, finite two-point presentation | For ordinary B=𝔽₂ the point-site comparison gives D(𝔽₂). The static light comparison instead gives D(Mod_B(SolidAb_light)); a finite two-point measure has rank 2 before and after cutoff enlargement. Derived commutative weight-two π₁=𝔽₂ versus animated π₁=0. | Keep comparison only on supplied presentations. | None |


### Adversarial table: every README Check and worked example

Each numbered Check below follows its order within the subsection. Repeated identities are recomputed here so that no Check is certified merely by a count.

| Check (README line) | Instances tried | Computed values / comparison | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1.1 (103) | Empty light space | Sheaf value=0; constant nonzero presheaf value=Hℤ, π₀=ℤ≠0. | Keep. | None |
| 1.1.2 (105) | Disjoint pair | Value M(*)×M(*); free object 𝕊², π₀=ℤ². | Keep. | None |
| 1.1.3 (107) | C at * and at two points | π₀=⊕_Cℤ and (⊕_Cℤ)²; all-one vector has infinite support and is absent. | Keep. | None |
| 1.2.1 (127) | X=0 | δ0=0; unit is the unique identity 0→0. | Keep. | None |
| 1.2.2 (129) | X=𝕊⊕Σ𝕊 | π₀=ℤ⊕0=ℤ; π₁=ℤ/2⊕ℤ. | Keep. | None |
| 1.2.3 (131) | T=ℤ_p, tower ℤ/p^r | Identity is continuous with infinite image; locally constant map from compact T to discrete ℤ_p has finite image. Thus id lies only in the limit's sections. | Keep. | None |
| 1.3.1 (153) | Singleton marked point | cofib(id_𝕊)=0, versus unreduced free object 𝕊. | Keep. | None |
| 1.3.2 (155) | e₁ | Difference=e₁−e₀; inverse=e₁+e₀, since σ*(e₁+e₀)=e₀. | Keep. | None |
| 1.3.3 (157) | Opposite shift | Right shift sends e₁→e₂, versus required e₀. | Keep. | None |
| 1.4.1 (177) | M=0 | Hom(N,0)=0 and its only endomorphism is invertible. | Keep. | None |
| 1.4.2 (179) | δ𝕊 versus δHℤ | π₀ both ℤ; π₁ is ℤ/2 versus 0. | Keep. | None |
| 1.4.3 (181) | N and its reflection | π₀(*)=⊕ℕℤ versus ∏ℕℤ; all-one vector belongs only to latter. Reflection of a local object would be an equivalence. | Keep non-example. | None |
| 1.5.2 (211) | P against ℤ, e₁ | Hom at*=⊕ℕℤ; (1−σ*)(e₁+e₀)=e₁. Wrong shift on e₁ gives e₁−e₂. | Keep. | None |
| 1.5.3 (213) | ∅,*,2,C and reduced P | Measures 0,ℤ,ℤ²,ℤ×∏ℕℤ; reduced measure ∏ℕℤ contains ones, P(*) does not. | Keep. | None |
| 1.5.4 (215) | I,J sizes 2,3; empty; bothℕ | Derived tensor=ℤ⁶; 0; ∏ℕ²ℤ respectively; higher Tor=0 in each case. | Keep. | None |
| 1.5.6 (219) | Σℤ; harmonic b_n in ℝ | H⁻¹Σℤ=ℤ; x₀−x_(N+1) tends to finite x₀ while harmonic partial sums diverge. No null solution; Lℝ=0 by the cited reflection result. | Keep. | None |
| 1.5.7 (221) | Q=topological ℤ_p/discrete ℤ_p | Q(*)=0; p^n has infinite image on C, so is not locally constant, even after a compact surjective cover. Its class at C is nonzero. | Keep finite S non-generator. | None |
| 2.1.1 (251) | ΣHℤ; cochain ℤ at2 | π₁=ℤ,π₀=0; cochain gives π₋₂=ℤ. | Keep. | None |
| 2.1.2 (253) | Zero module | All π_k=0; every upper and lower bound holds. | Keep. | None |
| 2.1.3 (255) | Square-zero 𝕊⊕Σ𝕊 | π₀=ℤ, π₁=(ℤ/2)⊕ℤ; its heart forgets the second summand. | Keep. | None |
| 2.2.1 (277) | Zero | L■0=0; 0⊗■M=0. | Keep. | None |
| 2.2.2 (279) | Discrete sphere unit | L■δ𝕊=δ𝕊; δ𝕊⊗■M=M. At M=Hℤ both have π₀=ℤ. | Keep. | None |
| 2.2.3 (281) | G against δH𝔽₂ | Continuous null coefficients give ⊕ℕ𝔽₂, cardinalℵ₀. Algebraic dual of∏ℕ𝔽₂ has cardinal2^(2^ℵ₀), so abstract Hom is different. | Keep. | None |
| 2.3.1 (293) | Hℤ-module unit | π₀=ℤ maps to H⁰=ℤ; all other groups0. | Keep. | None |
| 2.3.2 (295) | p=2,3, relative Hℤ tensor | Resolution ℤ→pℤ becomes zero differential after mod p: groups 𝔽_p in degrees 0,1, others 0. | Keep. | None |
| 2.3.3 (297) | Weight two over 𝔽₂ | H₁(BΣ₂; 𝔽₂)=𝔽₂; animated polynomial π₁=0. | Keep. | None |
| 2.4.1 (317) | G at* | π₀=∏ℕℤ contains(1,1,…). | Keep. | None |
| 2.4.2 (319) | Coordinate e_n | Each fixed coordinate eventually0; the sequence never equals0 and fails discrete convergence. | Keep. | None |
| 2.4.3 (321) | A=0 | G_A=0; a unital zero-algebra module must have id=0, hence is0. | Keep. | None |
| 2.4.4 (323) | φ=(1,0),matrix units | φe₁₂=(0,1); then e₂₁ gives(1,0); φe₂₂=0. | Keep. | None |
| 3.1.1 (345) | Empty I | Empty product=0; 0⊗■∏J𝕊=0=∏∅𝕊. | Keep. | None |
| 3.1.2 (347) | Sizes2,3 | Six coordinates; projection(1,2) takes e₁⊗e₂ to 1 and other basis pairs to 0. | Keep. | None |
| 3.1.3 (349) | Suspended/unsuspended swap | Two degree-one factors:−1; coordinate permutations on degree-zero bases:+1. | Keep. | None |
| 3.2.1 (371) | Constant0 and rank-one identity towers | Kernels0; limits0 and 𝕊 respectively. | Keep. | None |
| 3.2.2 (373) | P_n=𝕊^(n+1),n=0,1,2 | Ranks1,2,3; rank difference1 at each transition. | Keep. | None |
| 3.2.3 (375) | ×2 on 𝕊 | Any section would give 2b=1 inℤ; no integer b satisfies it. | Keep. | None |
| 3.3.1 (387) | Constant rank-one towers | 𝕊⊗■𝕊=𝕊=limit of constant 𝕊. | Keep. | None |
| 3.3.2 (389) | m=1,n=2 | Rank(2)·rank(3)=6, not diagonal rank 4. | Keep. | None |
| 3.3.3 (391) | Constant section A/(t)→A | s(t·1)=s(0)=0; t·s(1)=t≠0. | Keep. | None |
| 3.4.1 (403) | A=𝕊; X=0 | Both balancing sides=X⊗■Y; with zero X both 0. | Keep. | None |
| 3.4.2 (405) | A=𝕊[t],X=Y=A | Absolute π₀=ℤ[t₁,t₂]; multiplication sends(t₁,t₂)↦(t,t), yielding ℤ[t]. | Keep. | None |
| 3.4.3 (407) | Rationalization of∏ℤ | Each element has some common integer denominator; valuations of2⁻ⁿ are−n, unbounded, so this vector is only in∏ℚ. | Keep. | None |
| 4.1.1 (429) | K empty; J=* | Both sides0 in empty case; both lim_KF in point-index case. | Keep. | None |
| 4.1.2 (431) | F(n,k)=Hℤ for k<n | LHSπ₀=⊕ℕℤ; RHSπ₀=∏ℕℤ; ones missing only on left. ℕ is filtered but notω₁-filtered. | Keep. | None |
| 4.1.3 (433) | K=* | Comparison is id_colimF; on constant Hℤ it sends 1→1. | Keep. | None |
| 4.2.1 (445) | Subgroups(1/n!)ℤ ofℚ | Index n_j=j+1 contains(1/(j+1)!)_j. No fixed n bounds all its denominators. | Keep. | None |
| 4.2.2 (447) | B_j=0; empty family | Product and colimit both 0; empty product in Ab=0. | Keep. | None |
| 4.2.3 (449) | Truncation ℤ^(n+1) | Any tuple lifts by adding zeros; projection onto; difference map on tower products is onto, givinglim¹=0. | Keep. | None |
| 5.1.1 (483) | Spherical t-adic ring | Stages rankr; π_kA=(π_k𝕊)[[t]]; shift multiplication has cokernel π_k𝕊 in every k, so cofiber 𝕊. | Keep. | None |
| 5.1.2 (485) | A=0 | a₀=1=0; J_r=0,B_r=0,Λ=0. | Keep. | None |
| 5.1.3 (487) | 𝕊/p | π₀=ℤ/p≠ℤ^d for every d; finite free condition fails at first positive stage. | Keep. | None |
| 5.2.1 (513) | f=j and f=0 | At r=1 sublevels {0} versus ℕ; at r=2 sizes 2 versus ∞. | Keep. | None |
| 5.2.2 (515) | All I_j empty | Each inner product=0; outer product=0; V_f=0. | Keep. | None |
| 5.2.3 (517) | f_k=max(j−k,0) | Common target h(j)≤f_j(j)=0 forces h=0, whose r=1 sublevel is ℕ. | Keep; natural subtraction correctly handled. | None |
| 5.2.4 (519) | Identity and zero block maps | Supports {j} and ∅; quotient maps id and 0 respectively. | Keep. | None |
| 5.2.5 (521) | Duplication twice | Outputs 4j,4j+1,4j+2,4j+3: four distinct indices. | Keep. | None |
| 5.2.6 (523) | Profile j+1→j | t^(j+1)x∈t^jA; the element t^j is not generally in t^(j+1)A. | Keep direction. | None |
| 5.3.1 (535) | Singleton blocks, t-adic datum | t^j has exactly r surviving blocks mod t^r; ones has infinitely many already mod t. | Keep. | None |
| 5.3.2 (537) | Only blocks 0,1 nonempty | Proper f with f(0)=f(1)=0 gives A²; finite sum already complete, so RHS=A². | Keep. | None |
| 5.3.3 (539) | I₀=ℕ, all other blocks empty | f(0)=0 allows every coordinate of∏ℕA; both sides ∏ℕA, no within-block decay. | Keep. | None |
| 5.4.1 (551) | k<0 | Split ideals and limit have π_k=0; profile colimit also 0. | Keep. | None |
| 5.4.2 (553) | k=1, A=𝕊[[t]] | π₁A=(ℤ/2)[[t]]; mod t² the family is η,ηt,0,… . | Keep. | None |
| 5.4.3 (555) | Duplication of t^j | Mod t² output coefficients at 0,1,2,3 are 1,1,t,t; others 0. | Keep. | None |
| 5.4.4 (557) | Fold(t^j), mod t² | Sum=1+t; (1−t)(1+t)=1−t²=1; full inverse Σt^j exists since constant term 1 is a unit. | Keep; denominator justified. | None |
| 6.1.1 (579) | M=0 | Every term 0; realization 0. | Keep. | None |
| 6.1.2 (581) | M=Σ^bG_A | Constant simplicial realization=M; all terms have the same bound b. | Keep. | None |
| 6.1.3 (583) | A=0; repaired A=δ𝕊 | Original family all 0, thus every bound holds. Repaired π₋ₙ=∏ℕℤ≠0, defeating any fixed bound. | R01. | R01 |
| 6.2.1 (595) | a_r=1 | cofib(id_M)=0 at every r; limit 0. | Keep. | None |
| 6.2.2 (597) | Scalar 0 | Derived cofiber=M⊕ΣM; for M=Hℤ gives π₀=π₁=ℤ, not just π₀. | Keep. | None |
| 6.2.3 (599) | Quotient and ideal 2-adic towers | Quotients:lim ℤ₂,lim¹0. Ideals:lim0,lim¹ℤ₂/ℤ. Hence quotient completion π₋₁=0, ideal derived limit π₋₁=ℤ₂/ℤ. | Keep. | None |
| 6.3.1 (611) | Constant simplicial M | Both sides ΛM; comparison id; on M=Hℤ,2-adic completion sends 1→1 in ℤ₂. | Keep. | None |
| 6.3.2 (613) | Normalized degree 1, b=0, M=Hℤ | Layer ΣHℤ has π₁=ℤ,π₀=0; after 2-completion π₁=ℤ₂,π₀=0. | Keep. | None |
| 6.3.3 (615) | A=0; repaired A=δ𝕊 | Original layers/tails 0, arbitrarily connective. Repaired suspended layers=δ𝕊 and every split tail retains π₀≠0. | R01. | R01 |
| 6.4.1 (637) | p=2 | Completed-unit π₀(*)=ℤ₂; ambient π₀=ℤ. | Keep. | None |
| 6.4.2 (639) | p=3 | Completed-unit π₀(*)=ℤ₃; unit 1↦1. | Keep. | None |
| 6.4.3 (641) | Hℤ_p,H𝔽_p relative tensors | First π₀=ℤ_p, others 0; second π₀=π₁=𝔽_p. Same for p=2,3. | Keep. | None |
| 6.4.4 (643) | r=0,1,2, p=2,3 | r=0 quotient 0. Positive stages H𝔽_p⊕ΣH𝔽_p, transition diag(1,0), limit H𝔽_p. | R02. | R02 |
| 7.1.1 (675) | D=all modules | Reflector id; unit A→A=id; completed. | Keep. | None |
| 7.1.2 (677) | D={0}, A=Hℤ or 0 | Reflector 0; ℤ→0 not iso; 0→0 iso. | Keep both directions. | None |
| 7.1.3 (679) | Perfect Hℤ-modules | ⊕ℕHℤ has π₀=ℤ^(ℕ), infinite rank; cannot be a finite perfect Hℤ-cell object. | Keep closure failure. | None |
| 7.2.1 (701) | Zero input | Both completed tensor and scalar extension give L(0)=0. | Keep. | None |
| 7.2.2 (703) | D=0, A=Hℤ | Unit L_DA=0 has π₀=0, not ℤ. | Keep. | None |
| 7.2.3 (705) | H𝔽₂←Hℤ→H𝔽₂ | Two-term mod 2 resolution has zero differential; π₀=π₁=𝔽₂, others 0. | Keep. | None |
| 7.2.5 (709) | Identity algebra square, zero target structure | Both paths 0; intermediate kernels 0; target kernel all modules. | Keep stronger target, no kernel-generation requirement. | None |
| 7.3.1 (737) | F=∅,{0},{1} | No test; id test; solid difference test already invertible: all three yield all solid modules. | Keep. | None |
| 7.3.2 (739) | e₁+fe₀ | σ*(e₁+fe₀)=e₀; subtracting fe₀ leaves e₁. | Keep every discrete scalar. | None |
| 7.3.3 (741) | b_n=p^n,f=p⁻¹, p=2,3 | b_n→0 p-adically; b_n−p⁻¹b_(n+1)=0; b₀=1≠0. | Keep nonlocal coefficient. | None |
| 7.3.4 (743) | 𝔽₂[ε]/ε² | (1−εσ*)(1+εσ*)=1; inverse exists even though ε≠0. | Keep nilpotent/nonreduced control. | None |
| 7.3.8 (751) | φ=(1,0) | φe₁₂e₂₁=(1,0); φe₂₂=0. | Keep right action. | None |
| 7.4.1 (763) | Integer measures, finite sizes 0,1,2 | Free complete modules 0,ℤ,ℤ². | Keep. | None |
| 7.4.2 (765) | E=ℚ_p and finite extensions | v_p(p⁻ⁿ)=−n; no single p^N makes all entries integral. Uniform-denominator object excludes the vector; ∏E includes it. | Keep supplied finite-extension scope. | None |
| 7.4.4 (769) | Animated polynomial 𝔽₂ input | θ retains its discrete π₀=𝔽₂[t]; free commutative derived weight two π₁=H₁(Σ₂; 𝔽₂)=𝔽₂. | Keep inequivalence. | None |
| Layer1 Examples (225) | Empty and disjoint pair | 0; X(*)×X(*); marked shift sends finite e₁ coefficient to e₀. | Keep. | None |
| Layer2 Examples (327) | Sphere and integer-linear generator | π₁𝕊=ℤ/2; Hℤ⊗G has π₀=∏ℕℤ and π₁=0. | Keep. | None |
| Layer3 Examples (411) | Ranks 2,3; polynomial algebra | Rank 6; two absolute variables map to one balanced variable. | Keep. | None |
| Layer4 Examples (453) | Increasing finite-support vectors | Union ⊕ℕℤ lacks the all-one vector; the product contains it. | Keep. | None |
| Layer5 Examples (561) | r=0,1,2; t^r | Quotient ranks 0,1,2; profile decay is between blocks, not within I_j. | Keep. | None |
| Layer6 Examples (647) | Scalars 1 and 0 | Cofibers 0 and M⊕ΣM; completed unit π₀=ℤ_p. | Keep. | None |
| Layer7 Examples (773) | Trivial structure; Q_p,p⁻¹ | Reflector id; nonzero summability kernel vector(p^n),b₀=1. | Keep. | None |
| Consumer example (781) | Habiro positive indices 1,2 | Degrees of (1−q) and (1−q)(1−q²) are 1,3; constant section still fails A-linearity at q−1. | Keep consumer calculation; no arithmetic theorem imported. | None |


The three tables have 260 computed rows: 34 new or expanded rows, 126 retained assertion rows and 100 retained Check/example rows. The 92 previously present Checks and seven added Checks account for all 99 current Checks; the tables also cover all seven layer examples and the arithmetic consumer example. The assertion rows cover the conventions, 27 targets, their definitions, 63 API bullets and proof-route interfaces. A row that exhibits a counterexample to a Check is recorded under R01 or R02, rather than certified as sound.

The conventions agree across the relevant suppliers: π_k=H^(−k), the degree-one tensor swap is −1, endomorphisms act on the right by precomposition, and prime quotient transitions are induced by (p,id). The positive-index qualification in R02 is the remaining mismatch in their written range. The split-stage sections are sphere-linear, not coefficient-linear; on the constant section, multiplication by t gives 0 on one path and t on the other. All comparisons keep their specified unit or projection maps.

Nonabelian S₃ and Q₈ are excluded by abelian-sheaf carriers; noncommutative E₁ coefficients are admitted where stated and are tested by the two matrix units. No DVR-only assertion is extended to a ramified or equal-characteristic coefficient ring. Characteristic 2, characteristic 3, zero rings, square-zero nilpotents, finite/empty/countable indices and a space outside the second-countability bound are represented above. There is no division by a general scalar a_r. The displayed inverses have their unit justification: p is invertible in ℚ_p, 1−t has constant coefficient 1 in ℤ[[t]], and nilpotence makes the geometric inverse finite.

### Headline inventory and Lean acceptance test

The following are the README's end theorems and substantive intermediate headlines. The five kept definitions have actual bodies on native carriers and are used by the two kept theorems. No free predicate, arbitrary-data replacement or sorry'd operation is used to stand for a missing construction.

| README headline | Treatment in `packages/SolidAnalyticRings/Suggested.lean` | Boundary checked at the pins |
| --- | --- | --- |
| §1.5 abelian reflection and countable-product compact projective generator | Theorem at :115 | Universe-zero native LightCondAb, actual internal null test, actual countable product, full-subcategory inclusion, projectivity, finite presentability and separator. |
| §1.5 ordinary derived reflection | Theorem at :125 | Explicit chosen-derived-category hypothesis; solidity of cohomology in every integer degree. |
| §1.2 discrete spectral embedding and adjunction | Docstring :15 | Concrete stable spectra and enhanced light spectral hypersheaves missing. |
| §1.5 closed abelian tensor, enhanced derived comparison and product tensor | Docstring :18 | Reflection as constructed functor, enhanced solid category and derived monoidal structure missing; larger universes also need marked-sequence transport. |
| §2.1 homotopy criterion and complete t-structure | Docstring :24 | Light spectral hypersheaves, spectral null object and homotopy sheaves missing. |
| §2.2 connective monoidal solidification and free measures | Docstring :27 | Enhanced solid spectral reflection and internal Hom missing. |
| §2.3 Hℤ-linear monoidal comparison and bounded-below detection | Docstring :30 | Solid spectra, spectral Hℤ-modules and enhanced derived light solid category missing. |
| §2.4 sphere-product generator and module generators | Docstring :33 | Sphere, solid spectral tensor and enhanced module categories missing. |
| §3.1 countable product tensor | Docstring :36 | Sphere and solid spectral tensor missing. |
| §3.3 independent tower and diagonal comparisons | Docstring :38 | Coherent spectral towers and solid spectral tensor missing. |
| §3.4 balancing and dualizable scalar change through limits | Docstring :40 | Enhanced spectral algebra/module categories and relative solid tensor missing; generic bar construction remains supplied. |
| §4.1 countable-limit interchange on light sheaves and modules | Docstring :44 | Enhanced sheaf/module carriers and coherent diagrams missing; general cardinal theorem has its declared supplier. |
| §§5.3–5.4 completed block-sum formula, all degrees and naturality | Docstring :47 | Solid spectral coefficients, marked cofiber towers and coherent completion missing. A profile predicate would not state this headline. |
| §6.1 uniformly bounded free resolution | Docstring :52 | Solid spectral modules, compact generator and realization missing. |
| §6.2 sharp connectivity of quotient completion | Docstring :54 | Spectral modules, homotopy and coherent cofiber limits missing. |
| §6.3 realization/completion and skeletal tails | Docstring :57 | Enhanced modules and simplicial realization missing. |
| §6.4 prime-completed embedding, tensor closure and unit | Docstring :60 | Ordinary/light solid spectra and coherent prime completion missing. |
| §7.2 complete tensor, scalar adjunction and commuting-square comparison | Docstring :63 | Reflective enhanced analytic modules and relative solid tensor missing. |
| §7.3 connective summability localization, including the discrete Huber-pair instance | Docstring :66 | Spectral generator, analytic structures and enhanced localization missing. The Huber comparison additionally uses §2.3. |
| §7.4 integer measures, static module realization and common-site comparison | Docstring :69 | Enhanced analytic-measure modules, light Hℤ-linear spectral realization and site/cutoff comparisons missing. |

I ran the prescribed `lake env lean` elaboration of the actual package file from the content checkout. Exit status was 0; the only output was the two expected `sorry` warnings for the theorems at :115 and :125. There is one `import Mathlib` and no Tau Ceti import needing an object-file build. No import, toolchain, manifest or library file was changed.

I also elaborated a scratch copy with `#check @name` for all seven declarations. Every elaborated type matched the README; no binder disappeared and no change was needed:

| Declaration | Elaborated signature property checked |
| --- | --- |
| `natShift` | Endomorphism of the native universe-zero marked convergent sequence. |
| `inftyPoint` | Map from the one-point light profinite object to that sequence, with value ∞. |
| `nullSeq` | A genuine object of LightCondAb, defined by the specified cokernel. |
| `nullShift` | Endomorphism of that same cokernel; the marking equation is proved in its body. |
| `IsLightSolid` | ObjectProperty on LightCondAb; IsIso of the actual internal-Hom difference map. |
| `isLightSolid_reflective_and_generator` | Actual inclusion IsRightAdjoint, plus solidness and the three category properties of the specified product. No arbitrary object substitutes for the product. |
| `derivedLightSolid_isRightAdjoint` | `[HasDerivedCategory LightCondAb]` occurs explicitly; the cohomology test quantifies over n:ℤ, including negative degrees. |

For each of the two sorried theorems, a separate scratch probe tried `simp`, `rfl` and `infer_instance`, requiring each alternative to solve the whole goal. Neither theorem closed. The expected probe failure was separate from the successful package elaboration. The object searches and opened pinned declarations also found no single library lemma proving either reflection/generation assertion: internal projectivity of the unreduced sequence, ordinary sheaf adjunctions and generic localization interfaces do not assert them. There is no padding to delete. No Lean process was left running.

### Shape and completeness

The README has the required title/summary, scope, conventions, supplier contracts, build paragraph, seven ordered layers, 27 numbered topics, seven Examples/Dependencies pairs, consumer section and references. Each definition has an API and at least three discriminating Checks in its defining subsection, with the related marked-map Checks shared with §1.3. All target statements have source locators and local dependencies; R03 corrects the one omitted local prerequisite. The API bullets use a backticked owned name only for one of the seven actual Lean declarations; all seven occur in the README. The Lean file has its module docstring, namespace, layer heading and declaration docstrings, with no `lemma`, `set_option`, admitted example, data admission or foreign-roadmap import. The metadata and nine-entry source manifest are consistent with the package. The source misprints below are corrected in the package's mathematics rather than propagated.

## Not verifiable

No cited mathematical text was unreadable. All 15 seeded source targets, the repaired §7.3 locators and the other proof passages used in this report were opened. The two supplier gaps are declared mathematical contracts, not unreadable sources or findings.

At the supplied board heads, the package README paths for the following 15 entries returned 404. Their design READMEs at the same heads were readable and were searched for ownership, so the limitation is specifically the absent package text. I cannot inspect a package revision that is not at the recorded path:

| Board roadmap | Head | Readable substitute |
| --- | --- | --- |
| ArithmeticLocallySymmetricSpacesPartII | 84a41ac | `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md` |
| CompletedCohomologyAndLocalGlobalCompatibilityPartII | 948c94c | `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/design/README.md` |
| CrystallineCohomologyPartII | 84ea77e | `packages/CrystallineCohomologyPartII/design/README.md` |
| EndoscopicTransferAndUnitaryTraceComparisonPartII | 80a66cc | `packages/EndoscopicTransferAndUnitaryTraceComparisonPartII/design/README.md` |
| HigherHidaAndColemanTheory | da88512 | `packages/HigherHidaAndColemanTheory/design/README.md` |
| LawrenceVenkateshMethod | 9ee7ac3 | `packages/LawrenceVenkateshMethod/design/README.md` |
| OrdinaryAutomorphicFormsAndModularityLiftingPartII | 7e88c38 | `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md` |
| PELModuliPartII | d4bb48d | `packages/PELModuliPartII/design/README.md` |
| PadicHodgeTheoryPartII | 6502997 | `packages/PadicHodgeTheoryPartII/design/README.md` |
| PadicLocalLanglandsForGL2QpPartII | 3e0777d | `packages/PadicLocalLanglandsForGL2QpPartII/design/README.md` |
| RealSurfacePeriodIndex | 875bca4 | `packages/RealSurfacePeriodIndex/design/README.md` |
| SchemeAndStackFoundationsPartII | accb0a0 | `packages/SchemeAndStackFoundationsPartII/design/README.md` |
| ShimuraVarietiesPartII | 57dc0a4 | `packages/ShimuraVarietiesPartII/design/README.md` |
| VStackSheavesAndLisseCategoriesPartII | 0987ba7 | `packages/VStackSheavesAndLisseCategoriesPartII/design/README.md` |
| VectorBundlesAndIsocrystalsPartII | b58d862 | `packages/VectorBundlesAndIsocrystalsPartII/design/README.md` |

## Source issues

- **Misprint** in RC at Theorem 2.3.3(3), printed p.12, RC line 550: the source says the lifting map has a tensor factor named N; it should be the reduced null object P defined just before; affects the proof.
- **Misprint** in RC at Theorem 2.3.3(3), printed p.12, RC lines 555–556: the source says the convergent-sequence carrier is a product of naturals with the singleton infinity; it should be the one-point compactification, using union rather than product; affects the proof.
- **Misprint** in RC at Proposition 3.2.5(1), printed p.18, RC line 812: the source says the second difference coordinate subtracts a₁ from itself; it should be a₁−a₂; affects the proof.
- **Misprint** in RC at Proposition 3.2.5(3),(8), printed p.18, RC lines 824–825: the source says the localization kernels are tensor ideals in the solid target categories; it should be the ambient condensed abelian and derived categories; affects the proof.
- **Misprint** in RC at Proposition 3.2.5(4), printed p.19, RC line 866: the source says the null-sequence identity ranges over integer indices; it should be natural-number indices; affects the proof.
- **Misprint** in RC at Proposition 3.2.5(7), printed p.19, RC lines 874–875: the source says an unbound object B is the solid target of internal Hom; it should be the previously bound solid object C; affects the proof.
- **Misprint** in RC at Proposition 3.2.5, proof of (9)–(11), printed p.19, RC lines 876–898: the source says it assumes properties (11) and (12) before proving (9)–(11); it should be properties (12) and (13), the free-generator and product-tensor inputs actually used; affects the proof.
- **Misprint** in RC at Proposition 4.1.6, printed p.30, RC line 1514: the source says the completion-kernel test object lies in the complete category D(A); it should be the ambient coefficient-module category D(A▷); affects the proof.
- **Misprint** in HTT at Proposition 5.3.3.3, printed p.394, HTT line 18710: the source says the cofinal nerve map has the category of spaces as target; it should be the indexing infinity-category I; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3ac1b2b61f52fe401866b898d1b60f6896acd6d3", "job": "REV-PKG-SolidAnalyticRings~2", "model": "gpt-6-astra", "worker": "chris-3"} -->
