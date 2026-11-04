<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1547#issuecomment-6403572106 -->
Review (claude) of fe88ef7

Verdict: accepted
Conditional on the announced gaps: `artinian-almost-de-rham`, `artinian-b-pairs`, `partial-de-rham-cohomology`, `dominant-trianguline-semistability`, `selective-modification`, `general-character-spaces`, `completed-normalization-injectivity`, `rigid-normal-cm-openness`, `rigid-flat-openness`, `all-constituent-triangularity`, `constituent-conventions`, `unrestricted-trianguline-variety`

1. **F01** (P3) Scope bullet narrows the owner's injectivity statement

   **Location.** `packages/TriangulineVarietyAndItsLocalModel/README.md` line 19: "for an absolutely irreducible two-dimensional de Rham V that is not trianguline, every nonzero P(∇) is injective on D_rig(V) and ∂=t⁻¹∇ is bijective on N_rig(V)".

   **Claim.** The bullet restates what PadicLocalLanglandsForGL2QpPartII GR.1/nontrianguline-differential-control owns.

   **Witness.** The owner's design README at its current board head 642e432 (`packages/PadicLocalLanglandsForGL2QpPartII/design/README.md`, §1.2, line 245) states P(∇)-injectivity for absolutely irreducible two-dimensional nontrianguline V with no de Rham hypothesis, and adds de Rham only for the bijectivity of ∂ on N_rig(V); the target id `GR.1/nontrianguline-differential-control` is still the plan id at that head (`design/plan.json`). The repair report cited the earlier head 3e0777d, where both assertions carried de Rham; the owner has since moved.

   **Repair.** Reword line 19 to: "for an absolutely irreducible two-dimensional V over ℚₚ that is not trianguline, every nonzero P(∇) is injective on D_rig(V), and when V is moreover de Rham ∂=t⁻¹∇ is bijective on N_rig(V)". Test: the trianguline unit line R has ∇(1)=0, so P=X has kernel E, and nontriangulinity remains the operative hypothesis for injectivity; the owner's §1.2 Checks (lines 249–251) use the same instance. Nothing in this roadmap consumes the statement, so no other line changes.

2. **F02** (P3) A §9.4 Check names the wrong dimension as ambient

   **Location.** `packages/TriangulineVarietyAndItsLocalModel/README.md` line 1231: "For n=2,d=1 each cycle has ambient dimension 3 and codimension 5."

   **Claim.** For n=2, d=1 the conjectural cycles C_(r,Π) have codimension dn(n+1)/2+n=5.

   **Witness.** The ambient framed ring has dimension n²+dn²=8 (§9.1 Check, line 1169; §9.4 Check, line 1237: "8−(3+2)=3"); the cycle has dimension 3. Read literally, the sentence asserts an ambient dimension 3, which contradicts the same section's fourth Check.

   **Repair.** Replace by "For n=2,d=1 each cycle has dimension 3 in the ambient framed ring of dimension 8, hence codimension 5." Test: 8−5=3 and 5=1·2·3/2+2.

Reviewed at the pull request's current head fe88ef7 (the checkout was at that head; no fetch was needed). All five findings of round 2 are repaired; the repaired passages pass the adversarial pass; the rest of the package was read in full, the fifteen sampled targets were verified at their locators, and the headline, gap, supplier-order and Lean checks are clean. Two non-blocking notes remain (P3), for the next stage to apply. The four input files were not changed; no manifest entry was added.

## Verified sound

**Repairs of round 2, finding by finding.** Each repaired passage was opened at head fe88ef7 and checked against the witness the repair cites.

| Finding | Repaired passage (file and line) | Status |
|---|---|---|
| F01 (P2, two owners of the P(∇) obstruction) | README line 19 names PadicLocalLanglandsForGL2QpPartII GR.1/nontrianguline-differential-control as owner; §§4.6–4.7 are gone (Layer 4 runs §4.1–§4.5, lines 489–601, then Examples at 603); Summary line 3 ends "supply local inputs to eigenvariety arguments"; Layer 4 Examples line 605 has no P(∇) sentence; the gaps `rank-one-saturation` and `polynomial-connection-finiteness` are absent from the README (12 `gap:` slugs) and from `design/plan.json` (12 entries, same slugs, `needs` verbatim); DLB17 is absent from References (lines 2251–2257, seven works) and from `sources.toml` (seven entries); `Suggested.lean` docstring lists fifteen headline groups, the two Layer-4 bullets removed. The owner's current head 642e432 still plans the statement (its §1.2, plan id unchanged) | repaired; hypothesis drift at the owner's new head is R01 |
| F02 (P3, unconsumed contracts) | The PadicFunctionalAnalysis and PadicMeasuresIwasawaAlgebras contract sections are gone (contract headings at lines 41–115 list eleven suppliers); the principal-subgroup clause sits in the PhiGamma §4.0 paragraph, line 67; the ModularityAndLanglandsExtensions contract (line 113) states only the NT-ordered regular condition with an ordered witness and the a=0 case; §4.1 `*Needs:*` (line 497) and the Layer 4 Dependencies (line 609) name ModularityAndLanglandsExtensions §4.3. Mechanically: every `### From TauCetiRoadmap.X` is named by at least one `*Needs:*` line (counts 30, 29, 9, 21, 4, 10, 6, 5, 6, 1), LocallyAnalyticRepresentationsOfLocalGroups through its two gaps (4 lines); the Layer 4 Dependencies line equals the union of the `*Needs:*` lines of §§4.1–4.5. ModularityAndLanglandsExtensions README at its open head (#1180) §4.3 states the condition "δ_i/δ_j not a nonnegative embedding monomial for i<j" and the Check on excluded ratio 1 | repaired |
| F03 (P3, "algebraic unit weight") | README line 995: "whose unit restriction ω(x)=`delta\|_((O_K^*)^n)` is an algebraic character", with ω(x′)=δ_(k′) defined inline; locator BHS19 line 2939; §8.4 heading line 1043 and proof line 1049 say "unit restriction is algebraic". BHS19 lines 2937–2944: δ₀ algebraic means the restriction to O_K× of an algebraic character of K×, and Definition 4.1.3 assumes ω(x) algebraic; BHSsmooth17 lines 255–265 define δ_k and strict dominance | repaired |
| F04 (P3, Colmez's definition) | The sentence was deleted with §4.6. "Colmez" now occurs only at §4.5 (line 589) and in References (line 2254); no passage attributes coefficient extension to Colmez's definition | repaired (moot) |
| F05 (P3, Mathlib line numbers) | README line 43: `Module.length` "line 30", `AlgebraicGeometry.AlgebraicCycle` "line 44". At the pinned Mathlib 6b7abb3c: `def Module.length : ℕ∞ :=` is Mathlib/RingTheory/Length.lean:30 and `abbrev AlgebraicCycle (X : Scheme.{u}) (R : Type*) [Zero R] :=` is Mathlib/AlgebraicGeometry/AlgebraicCycle/Basic.lean:44; the other six locators (Prod.lean:95, Range.lean:57, Ker.lean:59, FiniteDimensional/Lemmas.lean:173 and 53, AdicCompletion/Basic.lean:171) re-checked exact | repaired |

Pattern search for each repaired pattern in the rest of the package: no other section cites a statement that a board design also plans (the ownership sweep below); no other contract is unconsumed; "algebraic weight" versus "algebraic unit restriction" occurs correctly in §8.3's proof (line 1027, "algebraic unit restrictions z^(k_i)") and nowhere else ambiguously; no other Mathlib locator is cited.

**Principles.** All 2257 lines of the README, the Lean file, `metadata.toml` and `sources.toml` were read. No route-specific restriction (every p, every finite K, p=2 handled in Conventions line 25 and the character-space contract line 67), no re-planned roadmap (every imported object is cited by roadmap and section; the round-2 overlap is removed), no upward or cyclic supply (depcheck below), no copied passage (every sampled statement is a paraphrase of the passage at its locator), no algorithm, no sorry'd data, no `set_option`, no `lemma`, no LaTeX delimiters, no process words, pull-request numbers or local paths (grep over README and Lean for each class: 0 hits).

**Seeded source sample.** All seven manifest works are certified copies in the cache; no locator is flagged unverified, uncertified or waived. Every sampled target was opened at its locator; theorem number, page, hypotheses and statement were compared.

| Target | Source read | Outcome |
|---|---|---|
| 1.1 | BHS19 Prop 3.1.1, Cor 3.1.2 (lines 1257–1295); X_W and X_W^□ definitions and Remark 3.1.5 (lines 1365–1402) | objects (A,W_A,ι_A), framed version adds α_A over α; forgetting α_A is formally smooth; exactness of D_pdR and its quasi-inverse; statement as written |
| 4.3 | NT21 Definition 2.9 (lines 1276–1281) | increasing integral labelled weights; strict inequality v_p((δ₁⋯δ_i)(p)) < wt_τ(δ_{i+1})−wt_τ(δ_i) for every τ and i<n; p the rational prime |
| 6.1 | BHS19 Prop 3.5.1 (line 2256), Remark 3.5.2 (lines 2292–2298), fibre products (lines 2304–2318) | X_D ≅ X_M ×_{X_W} X_{W⁺}; flag version X_{D,M•} ≅ X_{W⁺} ×_{X_W} X_{M,M•} (line 2356); the flag deformed only on D[1/t]; free Robba lattice from a free positive period lattice |
| 6.2 | BHS19 Lemma 3.5.3, Cor 3.5.4, Lemma 3.5.5 (lines 2321–2368) | standing assumption of a parameter in T₀ⁿ from line 2321; four relatively representable morphisms, the last two by base change; finite tangent dimension via dim H¹(R(δ)[1/t]) for δ∈T₀; wt−wt(δ) formally smooth of relative dimension n |
| 7.5 | BHS19 Cor 3.7.10 (line 2879), Remark 3.7.9 hypotheses (lines 2888–2893) | normal, hence irreducible, and Cohen–Macaulay at x; the neighbourhood form in the README rests on the declared openness gap, as its proof route says |
| 8.2 | BHS19 Def 4.1.3 (lines 2939–2945); BHSsmooth17 δ_k (lines 255–265) | ω(x) algebraic; conditions (i)–(iii) as restated; accumulation in the Bellaïche–Chenevier sense |
| 8.3 | BHSsmooth17 Lemma 2.10 and proof (lines 617–656) | hypothesis ω(x)=δ_k with gaps exceeding e·v_p(prefix); saturated and semistable; T_regⁿ gives crystalline, strictly dominant, noncritical; the README's added prefix bound closes the proof's use of the misprinted inequality (recorded in round 2) |
| 8.6 | BHSsmooth17 §2.2 (2.4)–(2.8), Lemmas 2.2–2.4 (lines 350–468); BHS19 proof of Thm 4.2.3 (lines 3046–3075) | refined space as fibre product over T^rig/S_n; reduced (Lemma 2.2); smooth dense loci of distinct eigenvalues (Lemma 2.4(i)); W̃ with ratios avoiding 1 and p^f and the smooth Hodge-flag map h (BHS19 lines 3054–3066); (2.4)–(2.5) a closed embedding into X_tri |
| 10.6 | Ding25 Props 2.7–2.8 (lines 599–616) | Hom bound ≤2 and rank-drop criterion for the modified endpoints; [ι_{D_σ}]^⊥ = E[D_σ] for every K, the kernel computed as a one-dimensional positive-period quotient |
| 10.7 | Ding25 Example 2.9 (lines 617–656) | n=3, K unramified, D crystalline; top lines e₁+e₂ and e₁+a e₂+e₃ with a∉{0,1}; C₁,σ's top line e₁+a e₂; ι reads a from the relative position |
| 11.2 | Ding25 (2.11)–(2.12) and Prop 2.10 (lines 660–694) | Ext¹_w as successive extensions of φ_{w⁻¹(i)}z^{h_i}(1+ψ_iε); κ_w the ordered derivative; Ext¹_g the preimage of smooth derivatives |
| 11.4 | Ding25 (2.14)–(2.16) (lines 741–774) | Ext¹₀ = ker κ_w independent of w, inside Ext¹_g, dimension n(n−1)d/2+1−n; quotient isomorphisms; dim barExt¹ = n(n+1)d/2+n |
| 12.2 | Ding25 Lemma 2.16, Prop 2.17, Cors 2.18–2.19 (lines 928–983) | dim Ext¹_σ = 1+(d−1)n(n−1)/2+n²; paraboline dimension and surjective graded map; refinement and rank-one identifications; the partial-cohomology input is Ding19 Cor A.4 (line 931), as the README's gap says |
| 13.4 | Ding25 (2.36), Cor 2.31 (lines 1224–1232) | I_ι the set of pairs (ι⁻M, −ι⁺M); I_ι=I_ι′ iff ι′=aι; ℚₚ gives D≅D′ |
| 13.7 | Ding25 Cor 2.33 and proof (lines 1263–1271) | intersection 1+(n²−2n+2)d; paraboline dimension 1+(n²−n+1)d; kernel of κ_F of dimension −1+(n−1)d; sum equals 1+n²d |

Further passages opened for the repairs, the adversarial rows and the non-sampled sections reviewed in full this round: BHS19 lines 1250–1300, 1330–1420, 2250–2318, 2870–2900, 2930–2996, 3035–3075; BHSsmooth17 lines 250–265, 350–470, 612–660; NT21 lines 1078–1125, 1180–1300; Ding25 lines 480–560, 595–668, 675–800, 925–990, 1218–1275.

**Adversarial pass (computed values).** A=E[ε]/ε² in infinitesimal rows. Rows marked (r2) carry the values of the round-2 table, which this round re-ran where the repair touched the statement; the other rows are new, covering the sampled targets, the headlines, the sections the earlier table summarised without values, and both findings.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Scope line 19 owner bullet (R01) | unit line R; owner's §1.2 at 642e432 | ∇(1)=0, P=X has kernel E: nontriangulinity essential; owner states injectivity without de Rham (line 245) and bijectivity of ∂ with de Rham | hypothesis drift; R01 |
| MALE contract line 113, NT-regular | n=1; n=2,d=1 with δ₁/δ₂=τ and τ⁻¹; a=0 | vacuous; τ excluded, τ⁻¹ allowed; ratio 1 excluded so R⊕R never NT-regular; against §4.2's H⁰: t^k∈R(x^(−k)) invariant, so H⁰(R(δ))≠0 iff δ=∏τ^(−a), which the condition excludes for i<j | sound |
| 1.1 X_W groupoid | A=E; A=E[ε], rank one | X_W(E): the single object (E,W,id), automorphisms compatible with ι are 1; ν=ε has ν²=0 and charpoly X−ε≠X | sound (r2 values confirmed) |
| 1.2 full Lie-algebra completion | n=1, A=E[ε] | ν=ε admitted; nilpotent cone completion would need charpoly X | sound |
| 2.1 lattice filtration | W⁺=B_dR⁺; t^aB_dR⁺ | Fil^i=K for i≤0, 0 for i>0; unique jump −a | sound (r2) |
| 4.1 ordinary and NT-regular | n=2 valuations (1,−1) and (0,0) | sum 0 but (1,−1) not ordinary; NT21 lines 1083–1091 define ordinary by δ_i(ϖ)∈O× and regular by δ_i/δ_j≠x^a, i<j, a≥0 | sound |
| 4.2 strictness | n=1; R⊕R | i=0: H⁰(R(δ₁)δ₁⁻¹)=E, dimension 1; i=n would name δ_{n+1} (NT21 line 1105 writes 0≤i≤n: misprint below); R⊕R: H⁰ of dimension 2 | sound |
| 4.3 numerical noncriticality | one embedding (0,3), slopes 2,3; gaps (3,1) | 2<3 passes, 3<3 fails; slope 2 fails 2<1 at the second embedding; n=1 vacuous | sound |
| 4.4 WD criterion = numerical noncriticality | general i | v_p((δ₁⋯δ_i)(p)) = v_p((χ₁⋯χ_i)(p)) − Σ_τ Σ_{j≤i} k_{τ,j}; substituting into Definition 2.9 gives k_{τ,i+1}+Σ_{τ′≠τ}k_{τ′,i}+Σ_{τ′}Σ_{j<i}k_{τ′,j}, the displayed bound; NT21 line 1245 normalises by 1/d and 1/f, which agree since v_p(χ(p))=e·v_p(χ(ϖ)) for a smooth χ | sound |
| 5.2 finite shift versus localization | ℚ₃, δ=unr(2)x², k=1,2,∞ | ranks 1, 0, 0; dim H¹=d=1 | sound (r2) |
| 6.1 gluing | rank one; lattice t·W⁺; identification 1+ε | D changes, D[1/t] fixed; the fibre product retains the gluing 1+ε≠1 | sound |
| 6.2 relative tangent | n=2,d=2; δ=1 | 6−4=2=n; δ=1 has localized H⁰ of dimension 1, outside T₀ | sound |
| 6.3–6.4 dimensions | n=2,d=2; n=1,d=1; n=1,d=2 | d(n²+n(n+1)/2)=14; rigidified 2+6=8 and 8+8−2=14; dim X=dn²=8 plus dn(n+1)/2=6 gives 14; n=1,d=2: 2+2=4; n=d=1: 2 | sound |
| 6.7 Cartan graph | w=(123), z=(ε,2ε,3ε) | (w⁻¹z)_i=z_{w(i)}: (2ε,3ε,ε); wz=(3ε,ε,2ε); s on (ε,2ε) gives (2ε,ε) | sound |
| 6.8–6.9 Galois components | n=2,d=2; n=1,d=2 | dim R_{r,F}=4+6=10; 10+8=14+4; n=1,d=2: 1+2=3; tangent 4−8+6+8=10 | sound |
| 7.3 root matching | roots ε and 2+3ε; roots 0,0 | X²−(2+4ε)X+2ε; X²=(X−ε)(X+ε) | sound |
| 7.4 local model | n=2,d=2; n=1,d=2 | 10+8=18=8+(4+6); 3+2=5=2+(1+2) | sound |
| 7.5 normality (sampled) | n=1; n=2,d=1 | dimension d+1 smooth; 7; a normal singular point keeps tangent dimension > Krull dimension (8.5 rows) | sound |
| 8.1 flatness | n=2,d=1 | fibres 7−4=3 and 7−2=5; E[t]→E[x,y], t↦xy flat with a singular fibre | sound |
| 8.2 accumulation (sampled) | p=2 and p odd, weights (a+(p−1)p^m, b−(p−1)p^m); ramified finite-order χ; sign character over ℚ₂ | gap a−b+2(p−1)p^m→∞, p-adic distance →0; wt(χ)=0 with χ\|O×≠1, not algebraic, excluded | sound (r2 values confirmed) |
| 8.3 prefix bound and induction (sampled) | f=(δ₁⋯δ_i)(ϖ_K) on U_tri; d=2,e=1,n=2,(0,2),v=−3; e=2,v=1,(4,1); n=1 unr(p) | v_p(f)≥0 on U_tri by saturation in ∧^i of an étale module, extended to X_tri by dimension; −2>−3 each and −3≥−4 allow w=s, prefix bound excludes v=−3; 3>2 passes, gap 2 fails; v=1 not étale | sound (r2) |
| 8.5 tangent bound | n=2,d=1,w=s,w_x=e; n=3,d=1,w=w₀,w_x=e; w=w₀ general | BHS19 line 2971: bound dim X_tri−d_{ww_x⁻¹}+ℓ(w_xw₀)+dim T U_w−dn(n−1); for w=w₀, dim U_{w₀}=dn(n−1) cancels the last terms (Remark 4.1.6); d_s=1, ℓ(s)=1: 7−1+1=7; d_{w₀}=3−dim{(a,b,a)}=1, ℓ=3: 15−1+3=17 | sound |
| 8.6 refined crystalline space (sampled) | n=1; n=2 distinct α,β; α=β | ι_k: r↦(r,z^k unr(φ)); ordered-root fibre 2 reduced points; at α=β one point of length 2, off the distinct locus; relative dimension of the Hodge map onto (G/B)^rig is smooth not étale; a critical refinement lands in X_tri∖U_tri | sound |
| 8.7 companion points | S₂, w_x=e and s; S₃ s₁≤s₁s₂, s₂≰s₁ | {e,s} and {s}; product Bruhat order distinguished from enumeration | sound |
| 9.1 weight-fibre cycles | n=1,d=2; n=2,d=1; n=2,d=2 | codim dn(n+1)/2: 2, 3, 6; fibre dims 3−2=1, 8−3=5, 12−6=6 | sound |
| 9.2 KL identity | S₂; N=[[0,1],[0,0]]; N=0 | P_{e,s}(1)=P_{e,e}(1)=1 gives C_e+C_s; N≠0: unique stable line, w_x=e, C_s=Z_s=0; N=0 both nonzero | sound (r2) |
| 9.4 cycle dimensions (R02) | n=2,d=1; n=2,d=2 | ambient 8, codim 3+2=5, cycle dim 3; 12−(6+2)=4; line 1231 says "ambient dimension 3" | R02 |
| 9.6 full-character cycles | n=1; n=2,d=1; n=2,d=2 | n²+dn²−dn(n+1)/2−n = n²−n+dn(n−1)/2: 0, 3, 4; weight minus full-character fibre = n not dn | sound |
| 10.1 refinement labels | w=(123); n=2 transposition | φ_{w⁻¹(i)}: (φ₃,φ₁,φ₂); (φ₂z^{h₁},φ₁z^{h₂}) | sound |
| 10.2–10.3 endpoints and pencil | n=2; n=3, h=(3,1,0); n=4, K=ℚₚ | D₁ weights (3,1), C₁ (1,0), both rank 2; (D₁)^{r_i} and (C₁)_{r_i} both have weights (h₂,…,h_{n−1}); dim Hom ≤2, equal to 2 at n=3 and at n=4 over ℚₚ (Ding25 Remark 2.3, line 529) | sound |
| 10.4 annihilator | d=1; d=2; a∈E× | kernel of the cup with ι_D is a positive-period quotient of dimension d (Ding25 line 550); d=1 forces E[D]; aι has the same annihilator | sound |
| 10.5 modification endpoints | n=3, off-σ (3,1,0) | weights (0,0,0); both endpoints (0,0), not (1,1) | sound (r2) |
| 10.6 modified annihilator (sampled) | d=1; d=2 | d=1: D_σ=D, both dimensions 1; d=2: original 2, modified 1 since off-σ endpoint weights coincide | sound |
| 10.7 rank-three parameter (sampled) | a=2; a=1; a=0 | normal of span((1,1,0),(1,2,1)) is (1,−1,1), dot (1,2,1)=0; a=1: normal (1,−1,0), plane contains e₃, so the refinement with e₃ first is critical; a=0: line (1,0,1)⊂span(e₁,e₃), critical | sound |
| 10.8 surjectivity of T_σ | d=1; d=2 | identity; two transverse off-σ flags give one D_σ | sound (r2) |
| 11.1 rank-one derivatives | ψ=v_K; ψ=log_σ; d=2 | 1+ε at ϖ, 1 on units; dims 1,2,3 | sound |
| 11.2 refinement spaces (sampled) | scalar twist D⊗R(1+εψ), ψ unramified and logarithmic | in every Ext¹_w with κ_w=(ψ,…,ψ); de Rham iff ψ smooth | sound |
| 11.3 Weyl transport | w₁=e, w₂=(123); S₂ | (wψ)(a)=ψ(a_{w(1)},…) gives coefficient tuple (ψ₃,ψ₁,ψ₂); consistent with labels φ_{w⁻¹(i)}; (1,2)↦(2,1) | sound |
| 11.4 zero-parameter quotient (sampled) | n=2,d=1; n=3,d=1 | dim Ext¹₀=1−n+dn(n−1)/2: 0, 1; dim barExt¹ = 1+n²d−dim Ext¹₀ = dn(n+1)/2+n: 5, 9; n=3,d=1 supplied dims 10,4,7 with target 6 give kernel 1 | sound |
| 11.5 g′ space | n=2,d=1 | 1+d(n(n−1)/2+1)=3 versus de Rham 2 | sound |
| 11.6–11.7 paraboline | n=3,d=1 blocks (2,1); B; G | dim P=4+2+1=7, Ext¹_F=8, quotient 7=dim(B∩L)+n=4+3; B: 3d+3; G: 6d+3=dn(n+1)/2+n | sound |
| 11.8 blockwise g′ | n=3,d=2 blocks (2,1) | n+rd=3+4=7; (log,log,0) allowed, (log,0,0) excluded | sound |
| 12.1 partial condition | d=1; d=2 rank one | no τ≠σ condition; dim Hom_σ=2 versus d+1=3 | sound |
| 12.2 partial dimensions (sampled) | n=3,d=2 full and blocks (2,1) | 1+3+9=13; 1+3+7=11; Ext¹₀ dim 4, quotient 7=5+2 with the rank-two block 6−1=5 and rank-one 2 | sound |
| 12.3 modified module | n=2,d=2 | full 9, de Rham 2, κ_w⁻¹(Hom_sm) 1+2=3; partial 1+4=5; partial B 1+3=4 | sound |
| 12.5 kernel of T_σ | n=3,d=2 | (d−1)n(n−1)/2=3; 7→4, 13→10, full 19→16 | sound |
| 12.6 modified zero kernel | n=2,d=2; n=3 | 1−2+1=0 versus full refinement kernel 1−2+2=1; n=3: 1 | sound (r2) |
| 13.1–13.2 images | ι=0, id, aι; n=3,d=1,2; n=4,d=1 | images 0, full, unchanged; (n−1)(n−2)d, (n−1)(n−3)d+d−1, 1+n(n−2)d: (2,0,4), (4,1,7), (6,3,9), each sum = a+b−c | sound |
| 13.3 rigidity | n=3,d=2 | injective image 1+2·1·2=5, pencil image 4, zero 0 | sound |
| 13.4 signed relation (sampled) | f=g=0; f=g=id_E; scaling by 2 | {0}; anti-diagonal {(a,−a)} containing (1,−1), excluding (1,1) and (1,0); unchanged | sound |
| 13.6 exchanged κ_G | n=3,d=1 scalar twist | targets (2,5) versus (5,2); κ_G(D⊗R(1+εψ))=(C₁⊗R(1+εψ),ψ) | sound (r2) |
| 13.7 spanning (sampled) | n=3,d=2; n=2,d=1 | 15,15,11: 15+15−11=19=1+9·2; 4,4,3: 5; the kernel −1+(n−1)d is 3 and 0 | sound |
| 13.10 recovery sequence | n=3,d=1; n=2,d=1 | V=2(5+2)=14, target 9, L=5; V=8, target 5, L=3 | sound |
| 13.11 partial images | n=3; n=2 | 1+(n−1)(n−2): 3, 1 | sound |
| 13.13–13.15 single-embedding | n=3,d=2; n=2,d=2 | V_σ=2(5+2)=14, target 10−1=9, L_σ=5; original 13−4=9 and modified 10−1=9; n=2,d=2 endpoint quotients 5−0 | sound |
| 13.16 partial generation | n=2,d=2 | original 6,5,4 with 2+1+1=4 and 5+5−4=6; modified 5,4,3 with 2+1+0=3 and 4+4−3=5 | sound |
| gap unrestricted-trianguline-variety | (n,d)=(2,1),(2,2),(1,d) | relative dimension n²+dn(n−1)/2−n: 3, 4, 0 | sound (r2) |
| gap general-character-spaces | finite-order χ; ℤₚ disc | wt=0 iff locally constant on compact units; d log(1+T)/dT a unit | sound (r2) |
| PhiGamma §4.0 principal subgroup | p=2,3,5 | ℤ₂×={±1}×(1+4ℤ₂); 1+2ℤ₂ contains −1 so is not a disc coordinate; ℤ₅×=μ₄×(1+5ℤ₅) | sound |
| Mathlib `AlgebraicCycle` contract line 43 | X=Spec E[[x]] | the function with value 1 at both points is locally finitely supported, a cycle of mixed dimension, so codimension is imposed separately | sound |

**Gaps.** Twelve gaps; the same twelve slugs with identical `needs` and suppliers in `design/plan.json` and the README (compared mechanically, each `needs` sentence verbatim in the README's "What <Supplier> must provide" line); none has supplier `none`; each is used by at least one `*Needs:*` line (counts 10, 7, 6, 6, 6, 5, 5, 5, 4, 4, 4, 2 mentions). Each `needs` is single-purpose with its hypotheses and asks for nothing already provided: PhiGamma §4.0 at head #1310 constructs the character spaces but states neither étaleness of wt nor Zariski accumulation; CompletedCohomologyAndLocalGlobalCompatibility §5.2a retains its global setting; RigidAnalyticGeometry on main has no openness of the normal, CM or flat loci; PadicHodgeTheory §4.5 does not reach Artinian coefficients or partial de Rham dimension formulas; the two LocallyAnalyticRepresentationsOfLocalGroups gaps ask for the all-family triangular system and the lower-Borel conventions that its LR.4/LR.5 targets do not state.

**Library declarations opened at the pins** (Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a, Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039, the revisions of the content checkout's `lake-manifest.json`): the eight Mathlib declarations at the lines listed under F05 above. Tau Ceti at the pin has no Robba ring, (φ,Γ)-module, B_dR, D_cris or trianguline carrier (whole-word grep over `TauCeti/**/*.lean`: 0 files for each), so the docstring's fifteen "not statable" verdicts hold.

**Cross-roadmap citations resolved** (roadmap service, main a759420, open heads of 2026-10-25T21:09Z; the resolver lists no unresolved citation and no unresolved Lean name): ModularityAndLanglandsExtensions #1180 §4.3 (NT-ordered regular condition and the Check on ratio 1); PhiGammaModulesAndIwasawaCohomology #1310 §4.0 (`compactCharacterSpace`, `localMultiplicativeCharacterSpace`, principal-subgroup disc coordinates, `K×≃ϖ^ℤ×O_K×`) and §7.3 (`CharacterWeights`); the round-2 resolutions of PadicHodgeTheory #1062, LocalGaloisDeformationRings #923, CompletedCohomologyAndLocalGlobalCompatibility #1270, DeformationAndDerivedPatchingAlgebra #1034, SchemeAndStackFoundations, RigidAnalyticGeometry, AdicSpacesPartII (main) and the board designs SpringerResolutionAndCharacteristicCycles and LocallyAnalyticRepresentationsOfLocalGroups stand (no repair touched them and the resolver still finds every cited section). The Downstream consumer PadicHodgeParametersInLocallyAnalyticRepresentations is a board design (its `design/README.md` has TR1–TR5, each headed with this roadmap's name). The owner cited at Scope line 19 was resolved at its current head 642e432 (R01).

**Ownership.** By object, across main and the 367 open roadmap heads (`roadmaps grep`): "higher intertwining" and "accumulation property" match nowhere; "local model for the trianguline" matches only the BHS19 reference entries of LocalGaloisDeformationRings and PhiGammaModulesAndIwasawaCohomology. Across the nineteen board packages of the index, each fetched at its listed head (the design READMEs under `design/README.md` where the package README does not exist): "trianguline variety", "local model for the trianguline", "higher intertwining", "accumulation property", "companion point", "double-flag" and "crystabelline" match only CompletedCohomologyAndLocalGlobalCompatibilityPartII (777a863), whose hits are its own crystabelline-lift density statements, not this roadmap's objects. PadicLocalLanglandsForGL2QpPartII (642e432) plans only the P(∇) statements this package deferred to it. The round-2 overlap is resolved and no new one exists.

**Supplier order.** The dependency check, run as prescribed after reading the head:

```text
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

Exit 0; no UPWARD, CYCLE or moved line. Every `*Needs:*` line was read (91 targets, exactly one `*Needs:*` line each); internal references point to earlier sections (§11.7 defers the alternative spanning argument to after §13.8; §13.8 proves spanning from §13.7, not from itself); each Layer's Dependencies line is the union of its `*Needs:*` lines.

**Shape.** Summary, Scope and ownership, Conventions, Exact supplier contracts (Mathlib, Tau Ceti, eleven roadmaps), How to read the build, thirteen layers each ending with Examples and Dependencies, Downstream consumers, Worked examples, References (seven works, matching the seven manifest entries). Thirty definition sections (those with a reusable-interface list) have at least four Checks each; every one of the 91 targets has a locator and a `*Needs:*` line; no target has zero Checks.

**Lean.** `lake env lean` on `packages/TriangulineVarietyAndItsLocalModel/Suggested.lean`, run from the content checkout: exit 0, no output (9.4 s wall). Single `import Mathlib`, one module docstring, an empty namespace `TauCetiRoadmap.TriangulineVarietyAndItsLocalModel`; no declaration, no `sorry`, no `lemma`, no `set_option`, no `#eval`/`#print`/`#synth`, no `TauCeti.*` import (nothing to build). The docstring names fifteen headline groups with the carrier each lacks; none is statable at the pins (no period, Robba or trianguline carrier exists there), and no stand-in is written. With no declaration the `#check @name` comparison and the one-tactic probe have no cases; there is no padding to delete. No Lean process was left running.

## Not verifiable

- Nothing in the sampled targets or the repaired passages was inaccessible: all seven manifest texts are in the cache and every locator opened. No `needs-references.toml` request was needed.
- Ownership against open pull requests outside the roadmap service's index and the board index was not checked (the brief gives no other files).

## Source issues

- **Misprint** in NT21 at the proof of Lemma 2.4, printed p. 29: the source says the strictness condition runs over 0≤i≤n, where i=n names a parameter δ_{n+1} that does not exist; it should be 0≤i≤n−1; affects nothing.
- **Misprint** in BHS19 at Theorem 1.9, printed p. 305, Conjecture 4.3.4, p. 381, (4.12), p. 382, and the proofs of Proposition 4.3.7 and Theorem 4.3.8, pp. 383–385: the source says the full-character cycles have codimension [K:ℚₚ]n(n+3)/2 in the framed deformation space; it should be [K:ℚₚ]n(n+1)/2+n, the two agreeing only for K=ℚₚ; affects a stated result.
- **Misprint** in Ding25 at the definition preceding Corollary 2.38, printed p. 31: the source says the relation is indexed by the endpoints D_{1,σ} and D_{2,σ}; it should be D_{1,σ} and C_{1,σ}, as in (2.42) and Proposition 2.39; affects nothing.
- **Misprint** in BHSsmooth17 at the proof of Lemma 2.10, printed p. 15: the source says the prefix product of the saturated parameter at ϖ_K has absolute value at least one; it should be at most one (valuation at least zero), which is what its inequality (2.13) uses; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "fe88ef7", "job": "REV-PKG-TriangulineVarietyAndItsLocalModel~3", "model": "fable", "worker": "fable-rev144"} -->
