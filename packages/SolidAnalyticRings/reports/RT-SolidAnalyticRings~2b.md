<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/943#issuecomment-6373953331 -->
Red team round 2 pass b (claude) of 5fe94ca

Verdict: changes needed

1. **F01** (P2) Cutoffs bounded by a merely regular cardinal outrun the cited theory and the supplier's construction

   **Location.** `packages/SolidAnalyticRings/README.md:19`: "A cutoff κ means a regular-cardinal bound on the underlying sets of the profinite test spaces"; `:75` and `design/plan.json` gap `light-measure-site-comparison`: "For every pair of regular cutoffs 2^ℵ₀<κ≤λ"; `:777`: "fix regular cutoffs 2^ℵ₀<κ≤λ".

   **Claim.** The gap, and §7.4 under it, ask VS2.1–VS2.2 for solidification units and measure Dirac maps on cardinality-bounded sites at every regular κ>2^ℵ₀. The cited sources bound by cardinality only at uncountable strong limit κ (CS line 116, AG line 2934–2937), because the proofs need κ-small extremally disconnected covers; VS2.2 defines measure objects on extremally disconnected sets. The needs sentence therefore asks for structure that its supplier and sources do not construct.

   **Witness.** κ=(2^ℵ₀)^+ is regular, above 2^ℵ₀; infinite extremally disconnected compacta contain βℕ, of cardinality 2^(2^ℵ₀)≥κ, so none is κ-small. CS line 145–150 needs strong limits; VStackSheavesAndLisseCategories README line 713 defines measures on extremally disconnected sets.

   **Repair.**
   - `README.md:19`: replace "A cutoff κ means a regular-cardinal bound on the underlying sets of the profinite test spaces, with finite jointly surjective covers; in comparisons involving every light test require κ>2^ℵ₀." by "A cutoff κ means an uncountable strong limit cardinal bounding the cardinality of the profinite test spaces, with finite jointly surjective covers (CS line 116; AG line 2934). Every cutoff exceeds 2^ℵ₀, so every light test is admitted."
   - `README.md:75` and the `needs` of `light-measure-site-comparison` in `design/plan.json`: replace "For every pair of regular cutoffs 2^ℵ₀<κ≤λ" by "For every pair of uncountable strong limit cutoffs κ≤λ".
   - `README.md:777`: replace "fix regular cutoffs 2^ℵ₀<κ≤λ" by "fix uncountable strong limit cutoffs κ≤λ".
   - `README.md:795`: replace the Check by "Every uncountable strong limit κ exceeds 2^ℵ₀, so the Cantor light test, of cardinality 2^ℵ₀, is admitted at every cutoff. The regular cardinal (2^ℵ₀)^+ is not a cutoff: its κ-small extremally disconnected sets are finite, since βℕ has cardinality 2^(2^ℵ₀)."

   **Test.** κ=(2^ℵ₀)^+: μ=2^ℵ₀<κ but 2^μ≥κ, so κ is not a strong limit and is excluded. κ=ℶ_ω: for |S|=ℶ_n, |βS|≤ℶ_(n+2)<ℶ_ω, so extremally disconnected covers exist; the Cantor set (ℶ_1) and C (ℵ₀) are admitted. The other two gaps are unchanged (cardinal-interchange concerns κ-filtered index categories, where regular is correct).

2. **F02** (P2) §1.3's larger-universe headline is statable at the pins but declared not statable

   **Location.** `packages/SolidAnalyticRings/Suggested.lean:23–24`: "Above universe zero the marked convergent-sequence carrier and its transport of §1.3 are also missing."; `README.md:81`: "It names the spectral, enhanced monoidal and larger-universe carriers needed for the other headlines."; `README.md:139`: "let C_u be the one-point compactification of ULift ℕ".

   **Claim.** The README itself now builds C_u from native carriers, and the package classes the larger-universe statements as headlines. With two transported instances and one `abbrev`, the internal projectivity of ℤ_u[C_u] for every u is statable at the pins; the docstring's missing-carrier claim is false and a statable headline is absent.

   **Witness.** A scratch file with the block below elaborated against the pinned Mathlib: exit 0, one "declaration uses `sorry`" warning, printing `internallyProjective_free_natUnionInftyU.{u_1} : InternallyProjective ((free (ULift ℤ)).obj (lightProfiniteToLightCondSet.obj natUnionInftyU))`.

   **Repair.** In `Suggested.lean`, add `universe u` after `namespace TauCetiRoadmap.SolidAnalyticRings`, insert after `nullShift`:

   ```lean
   instance : SecondCountableTopology (ULift.{u} (OnePoint ℕ)) :=
     Homeomorph.ulift.secondCountableTopology

   instance : TotallyDisconnectedSpace (ULift.{u} (OnePoint ℕ)) :=
     Homeomorph.ulift.isEmbedding.isTotallyDisconnected_range.mp
       (isTotallyDisconnected_of_totallyDisconnectedSpace _)

   /-- The convergent sequence `C_u` in universe `u`: the lifted one-point compactification of `ℕ`. -/
   abbrev natUnionInftyU : LightProfinite.{u} := LightProfinite.of (ULift.{u} (OnePoint ℕ))

   /-- The free light condensed module over the lifted integers on `C_u` is internally projective,
   in every universe `u` (RC Theorem 2.3.3(3), pp.12–13). -/
   theorem internallyProjective_free_natUnionInftyU :
       InternallyProjective ((free (ULift.{u} ℤ)).obj
         (lightProfiniteToLightCondSet.obj natUnionInftyU.{u})) := by
     sorry
   ```

   and delete the sentence at lines 23–24. In `README.md:139`, after "is internally projective" add "(`internallyProjective_free_natUnionInftyU`, with C_u the `abbrev` `natUnionInftyU`)". In `README.md:81` replace "It names the spectral, enhanced monoidal and larger-universe carriers needed for the other headlines." by "It also states §1.3's internal projectivity of the free convergent-sequence module in every universe, and names the spectral and enhanced monoidal carriers needed for the other headlines."

   **Test.** Elaborated as above at the pins (exit 0). At u=0 the statement is the pinned `LightCondensed.internallyProjective_free_natUnionInfty` (Sequence.lean:302) up to the universe-zero `ULift`; for u>0 the pinned theorem does not apply (its ring is fixed in `Type`, Sequence.lean:20–22), so the declaration is not a one-lemma consequence.

3. **F03** (P3) §6.4 takes the algebra structure of A_p from the headline that its null-family target feeds

   **Location.** `README.md:627`: "For the spectral version put A_p=e_p(𝕊^∧_p), with the coefficient algebra induced by the lax monoidal p-completion inclusion"; `:625`: "the inclusion into all solid spectra is lax monoidal with unit map δ𝕊→e_p(𝕊^∧_p)"; `:633`: "These calculations precede the tensor-closure conclusion."

   **Claim.** The only lax monoidal p-complete inclusion the roadmap states is the headline's (bounded-below objects with ⊗■), which rests on tensor closure, which the proof route derives from this null-family target and the A_p product comparison: a forward reference. The formal input that is actually needed, compatibility of the p-power cofiber-limit reflection with ⊗■, is stated nowhere.

   **Witness.** `README.md:625` gives lax monoidality only after "M⊗■N is p-complete"; `:633` orders the null-family and product comparisons before tensor closure; no target or API bullet of §6.4 (lines 625–645) states L_p(M⊗■N)≃L_p(L_pM⊗■N).

   **Repair.** In `README.md:627` replace "with the coefficient algebra induced by the lax monoidal p-completion inclusion" by "with the commutative algebra structure of the unit of the p-power cofiber-limit reflection L_p of Sp■; L_p(M⊗■N)≃L_p(L_pM⊗■N) because the objects with M/p=0 form a ⊗■-ideal, and this uses no tensor closure". Add to the §6.4 API: "- The p-power cofiber-limit reflection satisfies L_p(M⊗■N)≃L_p(L_pM⊗■N); its unit L_pδ𝕊=e_p(𝕊^∧_p) is a commutative algebra in Sp■, and the inclusion of all p-complete objects is lax monoidal for the completed tensor." Add "EnhancedDerivedSheaves E5:abstract.3" to the *Needs:* line at `README.md:635`.

   **Test.** M=δHℤ[1/p]: M/p=0, so L_pM=0, and for N=δ𝕊, (M⊗■N)/p=(M/p)⊗■N=0, so both sides vanish. M=δH𝔽_p: L_pM=M (tower diag(id,0), limit H𝔽_p), both sides L_p(δH𝔽_p⊗■N). The ideal property: M/p=0 implies (M⊗■N)/p=(M/p)⊗■N=0.

4. **F04** (P3) The generic two-index profile comparison sits under §6.4's Needs and is assigned to its consumer

   **Location.** `README.md:629`: "For every proper h:ℕ×ℕ→ℕ, prove that there are proper f,g:ℕ→ℕ with f(j)+g(k)≤h(j,k) … prove that (f,g)↦f⊞g is final for these profile colimits."; `:809`: "its factorial divisibility, balanced scalar idempotence and two-variable profile estimates remain in that consumer."

   **Claim.** The roadmap now states the generic two-index profile comparison itself, yet assigns two-variable profile estimates to HabiroRings, which states the same lemma as its own target; two owners for one object. The statement is pure profile combinatorics but sits under §6.4's *Needs:* (§4.1, hence gap:cardinal-interchange), so a consumer importing it inherits those edges. This roadmap is earlier in the order and is the owner.

   **Witness.** HabiroRings at its open head bb5d6cb, `TauCetiRoadmap/HabiroRings/README.md:681` (`CountableSolidHabiroTensor.separable_weights`: same hypothesis on h, same conclusion) and `Suggested.lean:120`; `merge-order/ORDER.txt` lists SolidAnalyticRings at line 150, HabiroRings at line 219.

   **Repair.** (a) Move the paragraph at `README.md:629` unchanged, with its locators, into §5.2 after the paragraph ending "records a choice of this data." (line 499), and move the Check at `README.md:665` into §5.2's Checks. (b) In §6.4, in its place write: "Apply the two-index profile comparison of §5.2 to identify the profile colimit of the tensor of two completed sums." (c) At `README.md:809` replace "its factorial divisibility, balanced scalar idempotence and two-variable profile estimates remain in that consumer" by "its factorial divisibility and balanced scalar idempotence remain in that consumer; the generic two-index profile comparison is §5.2, which HabiroRings §2.11 imports in place of its separable-weights statement". Moved ownership: the separable-weights statement of HabiroRings §2.11 becomes a citation of SolidAnalyticRings §5.2 (a consumer-side edit).

   **Test.** h(j,k)=max(j,k): f=g=⌊·/2⌋, at (1,2) 0+1≤2; f(j)=j, g(k)=k: sublevel sets of f⊞g at r=0,1,2 have 0,1,3 elements. §5.2's *Needs:* (§5.1, §3.1, §3.2, §2.4) reach no Layer 6 target, so the move creates no cycle; §6.4 already needs §5.2.

## Round-1 findings at this head

| Earlier finding | Repaired passage at 5fe94ca | Status | Witness |
| --- | --- | --- | --- |
| r1a F01 (P3) zero coefficients in two negative Checks | `packages/SolidAnalyticRings/README.md:589` "For A=δ𝕊, π_(−n)(Σ^(−n)G_A)=∏_ℕℤ≠0, so this family has no common lower bound. For A=0 every term is 0"; `:621` "the tail beyond degree d has π₀=⊕_(n>d)ℤ≠0 … For A=0 every layer and tail is 0." | repaired | A=δ𝕊: π_(−n)Σ^(−n)G=π₀G=∏ℤ≠0 for every n; split realization ⊕_nA has tail ⊕_(n>d)A, π₀=⊕_(n>d)ℤ. A=0: all groups 0. |
| r1b F01 (P2) unstated p-adic null family and two-index profiles | `README.md:627` "colim_(f proper) ∏_j∏_(i∈I_j) p^(f(j))ℤ_p → Λ_p(⊕_j∏_(i∈I_j)ℤ_p) is an isomorphism in SolidAb_light"; `:629` "For every proper h:ℕ×ℕ→ℕ, prove that there are proper f,g"; `:635` Needs adds §3.1, §4.1, §4.2, §5.2 | repaired; the new wording carries S03 and S04 | Sections at C=ℕ∪{∞}: a compatible family in lim_r⊕_j∏C(S,ℤ/p^r) lies in the stage f(j)=min(j, p-adic order of x_j), which is proper. Spectral degree 1 at p=2 recomputed below: both sides ⊕_ℕℤ/2. |
| r1b F02 (P3) §3.4 Needs omits §3.3 | `README.md:405` "*Needs:* §2.2; §3.3; EnhancedDerivedSheaves E5:abstract.2; …" | repaired | §3.3 Needs §3.1, §3.2, E2:towers; no path back to §3.4; depcheck clean. |
| r1b F03 (P3) "common light presentation", "cutoff" undefined; §1.3 universe target | `README.md:19` "A cutoff κ means a regular-cardinal bound on the underlying sets …"; `:139` "For every universe u, let C_u be the one-point compactification of ULift ℕ … ℤ_u[C_u] is internally projective" | repaired; the new cutoff definition introduces S01, and the new C_u makes the docstring claim of S02 false | Terms now defined; see S01, S02. |
| r1b F04 (P3) free universe in `IsFinitelyPresentable` | `packages/SolidAnalyticRings/Suggested.lean:123` "IsFinitelyPresentable.{1} (⟨_, h⟩ : IsLightSolid.FullSubcategory) ∧" | repaired | Elaborated at the pins: `CategoryTheory.IsFinitelyPresentable.{1, 1, 1}`; `isLightSolid_reflective_and_generator` has no universe parameter. |

No round-1 item was marked "not actionable in this package"; nothing is re-raised.

## Verified sound

**Counts.** Declarations read: 7 of 7 (all 136 lines of `Suggested.lean`). Targets read: 27 of 27 subsections §1.1–§7.4, with all 63 API bullets, every proof route, *Needs:* line and Dependencies paragraph, and every other paragraph of the README (829 lines). Locators verified: 33 Mathlib file:line locators read at pin 6b7abb3c (all match the cited declaration); 36 source locators read in the cached texts (RC 13, W 4, MW 2, Q 4, Bosco 2, CS 5, AG 5, HTT 1). Checks tested: 108 of 108, with the values in the declaration table, the adversarial table and the remaining-Checks table below. Sibling citations checked: 41 (EnhancedDerivedSheaves §§0.1–0.3, E0.4, E0.8, E1.3, E2:towers, E2.1–E2.3, E2.6–E2.7, E3.2–E3.3, E4.1, E4.4, E5:abstract.2–.5, E5:presentability.1–.2, E5:spectra-comparison with `symmetricSpectra_towerComparison`, E5:animation.4 with `animatedModules_discrete`, targets `IsReplete.countableProduct_epi`, `IsReplete.milnor`, on main; GeneralizedCohomology G2.1–G2.7, G2.4, G3.8, G3.9 on main; StableHomotopyKTheory §§5.13–5.18 at 00bfbf7; VStackSheavesAndLisseCategories VS2.1 with its three named paragraphs, VS2.2 "Analytic measures and complete modules", "Solid nonarchimedean coefficients" and `ZSolidAnalytification.formalComplement` at 0ca8db7; HabiroRings §§2.8–2.12 and gap:light-solid-spectra at bb5d6cb).

**Mechanical signature check.** All of `Suggested.lean` was copied into one scratch file followed by `#check @name` for the seven declarations (with `pp.universes`) and elaborated once with `lake env lean` against the pinned Mathlib and Tau Ceti: exit 0, exactly two warnings ("declaration uses `sorry`", lines 119 and 129). Elaborated types: `natShift : NatUnionInfty ⟶ NatUnionInfty` (`Quiver.Hom.{0,1}`); `inftyPoint : ↧PUnit.{1} ⟶ NatUnionInfty`; `nullSeq : LightCondAb`; `nullShift : nullSeq ⟶ nullSeq`; `IsLightSolid : ObjectProperty.{1,1} LightCondAb`; `isLightSolid_reflective_and_generator` with `IsFinitelyPresentable.{1, 1, 1}` and no universe parameter; `derivedLightSolid_isRightAdjoint.{u_1}` with explicit `[HasDerivedCategory.{u_1, 1, 1} LightCondAb]`. The free `u_1` is the hom universe of the chosen localization (DerivedCategory/Basic.lean:74); every such localization is equivalent, so the statement does not change with `u_1` and agrees with README:203 "for any chosen ordinary derived category". There are no section variables, so none can be lost. Nothing changed against README §1.5. The S02 repair block was elaborated in a second scratch file (exit 0, one `sorry` warning).

**Declaration table.**

| Declaration (line) | Context | Instances tried | Values on each side | Result |
| --- | --- | --- | --- | --- |
| `natShift` (91) | no variables; universe-zero `ℕ∪{∞}` | 0, 1, ∞; wrong model: identity map | images 1, 2, ∞; the identity also fixes ∞, but gives σ*=id, so 1−σ*=0 is not invertible even on discrete ℤ | correct marked shift |
| `inftyPoint` (97) | none | the point; constant map to 0 | ∞; with 0 marked, the composite with the shift is 1, so the `cokernel.desc` side condition (line 107) fails | correct |
| `nullSeq` (101) | none | value at * | (⊕_(ℕ∪{∞})ℤ)/ℤ·[∞]=⊕_ℕℤ; at the marked singleton the cokernel is 0 | equals P of RC line 548 |
| `nullShift` (105) | none | [0],[1],[∞]; precomposition on e₀,e₁ | [1],[2],0; σ*e₁=e₀, σ*e₀=0 | direction agrees with README:27 |
| `IsLightSolid` (113) | none | B=ℤ, 0, topological ℝ | ℤ: (1−σ*)(e₁+e₀)=e₁, inverse x↦(Σ_(k≥n)x_k)_n; 0: identity of 0; ℝ: b_n=1/(n+1) forces x₀−x_(N+1)=H_(N+1)→∞ against x₀ | positive and negative instances behave |
| `isLightSolid_reflective_and_generator` (119) | none | G=∏_ℕℤ; Q=ℤ_p/δℤ_p; finite S | G(*)=ℤ^ℕ ∋ (1,1,…); Hom(G,ℤ/2)=⊕_ℕ𝔽₂; Q(*)=0 but [p^n]≠0 in Q(C), so ℤ^n (finite S) is no separator | RC Theorem 3.2.4(2),(12) (RC line 757, 773) |
| `derivedLightSolid_isRightAdjoint` (129) | explicit `HasDerivedCategory` | ℤ[1]; ℝ[0]; 0 | H^(−1)ℤ[1]=ℤ solid, in; H⁰ℝ[0]=ℝ, reflection 0 (RC 3.2.4(4)); 0 in | shadow of RC 3.2.4(5)–(6) (RC line 763–765) |

The identity map satisfies the marked-point identity used by `nullShift`, so it is excluded only by the Check at README:215 and the witness (1−σ*)e₁=e₁−e₀ of README:27 (the identity gives 0); both are present.

**Adversarial table (README).**

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| §1.1 free values (README:111) | 𝕊[C] at *, at two points | sheafification at a split cover is the presheaf value: ⊕_Cℤ; (⊕_Cℤ)²; (1,1,…)∉⊕ | holds |
| §1.3 C_u Checks (README:163) | n=0,1,2 | sizes 1,2,3; reduced ranks 0,1,2; P_u(*)=⊕_ℕℤ_u | holds (the "Thus" follows from free evaluation at a split point, not from the ranks) |
| §1.4 Checks (README:183–187) | 0; δ𝕊; N | invertible on 0; π₀=ℤ, π₁=ℤ/2; π₀N(*)=⊕ℤ vs π₀L■N(*)=∏ℤ | holds |
| §1.5 measures, product, flatness (README:219–223) | S=∅,*,2,C; |I|=2,|J|=3; B=ℤ/2 | 0,ℤ,ℤ²,ℤ×∏ℤ; ℤ⁶=ℤ⁶; ×2 on ∏ℤ injective, coker ∏𝔽₂; Tor₁(𝔽₂,𝔽₂)=𝔽₂ | holds; RC 3.2.4(13),(14) |
| §1.5 generator Check (README:227) | Q=ℤ_p/δℤ_p | Q solid (cokernel of solid), Q(*)=0, map C→ℤ_p, n↦p^n not locally liftable | holds |
| §2.2 Check (README:287) | G→δH𝔽₂ | ⊕_ℕ𝔽₂ (countable) vs |Hom_Ab(𝔽₂^ℕ,𝔽₂)|=2^(2^ℵ₀) | holds |
| §2.3 Checks (README:299–303) | unit; H𝔽_p⊗_HℤH𝔽_p, p=2,3; 𝔽₂ symmetric square | Hℤ↔ℤ[0]; [ℤ→ℤ]⊗𝔽_p gives 𝔽_p in degrees 0,1; H_i(BΣ₂;𝔽₂)=𝔽₂ for all i≥0 vs discrete 𝔽₂[x] | holds |
| §2.4 Checks (README:323–329) | π₀G(*); e_n; A=0; φ=(1,0) | ℤ^ℕ ∋ (1,1,…); e_n→0 in product, not in discrete; Mod_0=0; (φe₁₂)e₂₁=(0,1)e₂₁=(1,0)=φe₁₁, φe₂₂=0 | holds |
| §3.4 Checks (README:409–413) | A=𝕊; X=0; A=𝕊[t]; (2^(−n)) | 𝕊⊗■𝕊=𝕊 so both sides X⊗■Y; 0; π₀ ℤ[t₁,t₂]→ℤ[t]; no common denominator in (∏ℤ)⊗ℚ | holds |
| §4.2 Checks (README:451–455) | B_j=ℚ, (1/n!)ℤ; B_j=0; truncations | (1/(j+1)!) in stage α_j=j+1, no diagonal stage; 0=0; projections onto, lim¹=0 | holds; RC 2.3.3(1) gives countable AB6 (RC line 539) |
| §5.1 Checks (README:489–493) | lim δ(𝕊[t]/t^r); A=0; 𝕊/p | stage ranks r, t^r on ∏δ𝕊 is a shift with cofiber 𝕊^r; all 0; π₀=ℤ/p not free | holds |
| §5.1 completeness forces infinite rank | A=δ𝕊 | finite free B_r needs a_r=±1, so lim B_r=0≠A unless A=0 | consistent with §5.2's countable-product claim |
| §5.2 Checks (README:519–529) | f=j; f=0; max(j−k,0); duplication; t^(j+1)→t^j | finite / ℕ sublevel; common target ≤0; {4j,…,4j+3}; inclusion direction | holds |
| §5.2 compact factorization (README:499, 515) | I=ℕ; I finite | ∏_IA≃A⊗■∏_Iδ𝕊=G_A (compact, §2.4); A^n compact | holds |
| §5.3 Checks (README:541–545) | singletons over 𝕊[[t]]; blocks 0,1; I₀=ℕ | (t^j) at f=id, r blocks mod t^r; A² via f(0)=f(1)=0; ∏_ℕA via f(0)=0 | holds |
| §5.4 Checks (README:557–563) | k<0; ηt^j; duplication; fold | 0; survivors η, ηt mod t²; outputs 0–3; Σt^j=(1−t)⁻¹≡1+t, (1−t)(1+t)≡1 | holds |
| §6.1 Checks (README:585–589) | 0; Σ^bG_A; uncountable I; A=δ𝕊, A=0 | realizations 0, Σ^bG_A, ⊕_IΣ^bG_A ≥b; π_(−n)=∏ℤ≠0; all 0 | holds |
| §6.2 statement and Checks (README:593–605) | a_r=1; a=0; Hℤ, 2^r; ideal tower | 0; M⊕ΣM; H(ℤ/2^r) onto, lim ℤ₂, lim¹=0, π₋₁=0; lim 2^rℤ=0, lim¹=ℤ₂/ℤ | holds; bound b from Milnor with surjective π_b transitions |
| §6.3 statement and Checks (README:609–621) | constant M; degree-one layer; tail bound; split Σ^(−n)A | identity Λ_aM; layer ΣM is (b+1)-connective; cofib(|sk_d|→|M|)≥b+d+1 gives π_k iso for k≤b+d−1, i.e. d>k−b; tail π₀=⊕_(n>d)ℤ | holds |
| §6.4 headline (README:625) | e_p adjunction; unit | Map(L_pδX,M)=Map(δX,M)=Map(X,M(*)) for p-complete M; unit X→lim X/p^r=X | holds; W line 455–461 |
| §6.4 integer null family (README:627) | sections at S=C; singleton blocks p=2,3 | lim_r⊕_j∏C(S,ℤ/p^r) = ∪_f∏C(S,p^(f(j))ℤ_p); survivors mod p²: (1,2), (1,3) | holds |
| §6.4 spectral null family, degree k≥1 (README:627, 663) | p=2, singleton blocks | π₁ colim: 2^(f−g) kills coordinates with f(j)>g(j); stage g=max(f−1,0) leaves {f=0}: ⊕_ℕℤ/2. π₁Λ_2(⊕A_2): L₀(⊕ℤ/2)=⊕ℤ/2, L₁(⊕ℤ₂)=0: ⊕_ℕℤ/2 | holds; p=3: π₁=0 both sides |
| §6.4 truncation clause (README:627) | τ_[a,b] | colimits and countable products are t-exact; L₁ of bounded-exponent π_(k−1) vanishes, so truncating A_p or the output gives the same groups | holds |
| §6.4 product comparison (README:627, 661) | I=J=*; sizes 2,3 | A_p⊗■A_p=e_p((𝕊_p⊗𝕊_p)^∧)=A_p; π₀=ℤ_p⁶, π₁=(ℤ/2)⁶ at p=2 | holds (W line 461) |
| §6.4 two-index profiles (README:629, 665) | h=max(j,k); f=j, g=k; finality | ⌊j/2⌋+⌊k/2⌋≤max(j,k); sublevels 0,1,3; joins by pointwise minima under h | holds; ownership is S04 |
| §6.4 H𝔽_p tower (README:655) | p=2,3 | p·id=0 on H𝔽_p; X/p^r=X⊕ΣX; transition X⊕ΣX→X→X⊕ΣX, [ΣH𝔽_p,H𝔽_p]=0, so diag(id,0); limit X | holds; matches EnhancedDerivedSheaves `symmetricSpectra_towerComparison` Check |
| §7.2 Checks (README:723–731) | D=0; ℤ→𝔽₂ pushout; non-pushout; D_B′=0 | unit π₀=0; π₀=π₁=𝔽₂ both paths; H𝔽₂ both paths vs pushout Hℤ; both 0 | holds |
| §7.3 Checks (README:759–773) | f=1; e₁+fe₀; ℚ_p, f=1/p; ε²=0; ℤ[T]; φ=(1,0) | 1−σ* already invertible on solid; (1−fσ*)(e₁+fe₀)=e₁; p^n−p^(n+1)/p=0; (1−εσ*)(1+εσ*)=1; F=∅ vs {T}; (εT)²=0; φe₁₂e₂₁=(1,0), φe₂₂=0 | holds; agrees with RC Example 4.6.4(2) (RC line 2128–2130) and RC Lemma 5.5.5 (RC line 3269) |
| §7.4 Checks (README:785–797) | sizes 0,1,2; ℚ_p; B=ℤ/2; θ over 𝔽₂; C=lim{0,…,n−1,∞}; ×2, ×3 | 0,ℤ,ℤ²; (p^(−n)) unbounded, p^n→0 not locally constant; ∏𝔽₂ static vs Tor₁=𝔽₂; H_*(BΣ₂;𝔽₂)≠0; sizes 1,2,3, ⊕_Cℤ vs ℤ×∏ℤ; cokernels ℤ/2, ℤ/3 | holds; README:795 changes under S01 |
| §7.4 static modules (README:777) | B solid static ring | B⊗■∏ℤ static (flatness), projective generator, Ext^(>0)(∏ℤ,B⊗■∏ℤ)=0, so Mod_B(D(Solid))≃D(Mod_B(Solid)) | holds |
| Conventions (README:21–33) | e₁₂e₂₁; σ*; quotient square | e₁₁; (σ*b)_n=b_(n+1); a_r b_(r,s)=a_s | holds |

**Remaining Checks.**

| Checks | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §1.1 (README:107, 109) | empty cover; two points | M(∅)=0, a constant presheaf X≠0 fails; M(*⊔*)=M(*)², 𝕊[2]=𝕊⊕𝕊 | hold |
| §1.2 (README:131–135) | X=0; 𝕊⊕Σ𝕊; T=ℤ_p | unit 1_0; π₀=ℤ, π₁=ℤ/2⊕ℤ; identity of ℤ_p has infinite image, so not locally constant | hold |
| §1.3 (README:157–161) | marked singleton; e₁; right shift | cofib(id)=0; (1−σ*)e₁=e₁−e₀, inverse e₁↦e₁+e₀; right shift gives e₁−e₂ | hold |
| §2.1 (README:257–261) | ΣHℤ; ℤ in cochain degree 2; 0; 𝕊⊕Σ𝕊 | π₁=ℤ, π₀=0; π₋₂=ℤ; all bounds; π₁=ℤ/2⊕ℤ | hold |
| §2.2 (README:283, 285) | 0; δ𝕊 | L■0=0, 0⊗■M=0; δ𝕊 discrete hence solid, δ𝕊⊗■M=L■M=M | hold |
| §3.1 (README:351–355) | I=∅; 2×3; degree-one swap | 0=0; six spheres, coordinate (1,2) is the tensor of projections; sign (−1)^(1·1)=−1 | hold |
| §3.2 (README:377–381) | zero tower; constant 𝕊; 𝕊^(n+1); ×2 | limits 0, 𝕊; ranks 1,2,3, kernels rank 1; 2b=1 has no integer solution | hold |
| §3.3 (README:393–397) | constant rank one; (m,n)=(1,2); s on 𝕊[t]/(t) | 𝕊⊗■𝕊=𝕊; 2·3=6; s(t·1)=s(0)=0, t·s(1)=t | hold |
| §4.1 (README:435–439) | K=∅; J=*; F(n,k)=Hℤ for k<n; K=* | 0=0; lim_K F both sides; π₀ ⊕_ℕℤ vs ∏_ℕℤ, ℕ not ω₁-filtered; identity | hold |
| §6.4 (README:649–653, 659) | p=2,3; Hℤ_p over Hℤ; H𝔽_p over Hℤ_p; I₀=ℕ | π₀(𝕊^∧_p)=ℤ₂, ℤ₃ vs ℤ, 1↦1; ℤ_p⊗ᴸ■ℤ_p=ℤ_p; Tor₁^(ℤ_p)(𝔽_p,𝔽_p)=𝔽_p; f(0)=0 gives ∏_ℕ on block 0 | hold |
| §7.1 (README:697–701) | D=all; D={0}; perfect Hℤ-modules | L=id; L=0, A→0 invertible iff A=0; π₀(⊕_ℕHℤ)=⊕_ℕℤ not finitely generated | hold |

**Suppliers, gaps and order.** Every cited supplier section exists where cited with the stated content (list in Counts). The three declared gaps carry the same slug, supplier and section in `design/plan.json` and in the README (cardinal-interchange 4 occurrences, light-countable-ab6 4, light-measure-site-comparison 8). No pinned Mathlib file states AB6 (grep at the pin finds none; Light/AB.lean:31–37 gives only countable AB4* and Grothendieck abelianness); EnhancedDerivedSheaves E0.8 and E5:presentability.2 state no interchange theorem. Only S01 bears on a gap (its hypothesis). Depcheck output:

```text
depcheck: 27 roadmaps, 234 edges, 0 problem(s)
```

**Ownership.** Object searches (`roadmaps grep` over main and the 330 open heads; the 26 sibling checkouts; the board packages) for null sequences in the solid sense, solid spectra, `IsLightSolid`, internal projectivity and proper profiles found no earlier owner and no fully qualified name collision; the Banach-space "null sequence" hits (BanachSpaceTheory, AdicSpacesPartII, PadicDifferentialEquationsAndRigidCohomology) are c₀ objects. The only overlap is the consumer HabiroRings (S04). VS2.1 owns the compact-Hausdorff integer theory, a different carrier from the light null-test theory of §1.5. RefinedTraceMethods §6.2 was recorded in round 1 as a consumer-side repointing; it was not re-read this round.

**Policy.** `git diff --stat origin/main...HEAD` touches only `packages/SolidAnalyticRings/` (8 files). No pull-request number, process narrative, `lemma`, `set_option`, extra import, sorry'd data, `True` placeholder or computational algorithm. Every subsection has a locator. Every Lean name appears in README §1.5 and every backticked name of this roadmap is declared. No declaration is padding: each definition is needed by the two theorems, and neither theorem follows in one step from a pinned lemma.

## Not verifiable

- The spectral foundations of §§1.4, 2.1–2.4 and 6.4 rest on recollections (W §2, MW §4.1, Q B.6–B.8) and on unpublished lectures; instances were computed, but no complete written proof of, for example, compactness of the solid null object in Cond(Sp) was available.
- S01 shows that the cited constructions are unavailable at merely regular cardinality cutoffs; it does not prove that no solid theory exists there.
- RC line 790–791 remarks that property (14), flatness of the countable product, fails for solid abelian groups in general (a counterexample of Efimov), while Bosco line 3473–3479 asserts flatness of ∏_Iℤ_p for every set I in the non-light setting; the roadmap uses only the light statement (RC 3.2.4(14)), and whether the two conflict was not resolved, so no source issue is recorded.
- RefinedTraceMethods and HigherHidaAndColemanTheory were not re-read (no API calls); their consumer-side status is as recorded in round 1.
- The AS transcript was not re-read; it supports no target alone.

## Source issues

- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.12: the source writes the map to be lifted with domain ℤ[S] tensored with the natural numbers; it should be ℤ[S] tensored with the null-sequence object P, as the diagram and next sentence use; affects nothing.
- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.13: the source extends a map out of S×ℕ to the compactification; it should be the map out of S′×ℕ given by the retractions r_n; affects nothing.
- **Misprint** in RC at proof of Theorem 2.3.3(3), printed p.12: the source writes the compactification factor as a product of ℕ with the point ∞; it should be the union ℕ∪{∞} (also recorded in round 1); affects nothing.
- **Misprint** in HTT at proof of Proposition 5.3.3.3, printed p.394: the source gives the cofinal map from the nerve of the filtered poset target the ∞-category of spaces; it should be I (also recorded in round 1); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5fe94ca", "job": "RT-SolidAnalyticRings~2b", "model": "opus", "worker": "fable-rt4"} -->
