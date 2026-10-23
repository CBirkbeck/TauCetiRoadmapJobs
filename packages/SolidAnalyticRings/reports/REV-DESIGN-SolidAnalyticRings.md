<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/910#issuecomment-6365269306 -->
Review (claude) of d195541

Verdict: needs_changes

1. **F01** (P1) The light integer solid theory is cited from VS2.1, which does not contain it

   **Location.**
   - `packages/SolidAnalyticRings/design/README.md` line 190 (§2.1): "The homotopy t-structure restricts to the stable full subcategory Sp■, has heart the light realization of SolidAb".
   - Line 240 (§2.3): "Mod_{δHℤ}(Sp■)≃D(SolidAb_light)".
   - Line 242: "Identify the resulting solid localization tests with those of VS2.1".
   - Line 290 (§3.1): "Identify the map on integer-linearization with VS2.1’s derived product tensor".
   - Also lines 9, 11, 40 and 68 (supplier contract) and line 390 (§4.2, "light solid abelian groups").

   **Claim.** The design treats the following as supplied by VStackSheavesAndLisseCategories VS2.1:
   - the integer solid theory on the light site;
   - its derived category `D(SolidAb_light)`;
   - integer solidity of homotopy sheaves on the light site;
   - the light product tensor `(∏_Iℤ)⊗(∏_Jℤ)=∏_{I×J}ℤ`.

   §§2.1–2.4, 3.1 and 4.2 rest on these. No roadmap owns this theory:
   - In `TauCetiRoadmap/VStackSheavesAndLisseCategories/README.md` the word "light" occurs only in its Conventions (line 54) and in one VS2.2 API sentence (line 716).
   - Mathlib's `CondensedMod.IsSolid` (`Mathlib/Condensed/Solid.lean:83`) tests `Profinite` objects, not `LightProfinite` ones.
   - A roadmap-service search for "light solid abelian" and "LightCondAb" finds nothing on main or in any open pull request.

   The light theory is RC Definition 3.2.1, p.16, RC line 732, and RC Theorem 3.2.4, pp.17–18, RC line 754. RC lines 788–792 contrast it with the CS19 construction that VS2.1 follows.

   **Witness.** VS2.1 (open head 0ca8db7), “The abelian category of solid groups”: "Take the existing `CondensedAb` and its integer predicate `CondensedMod.IsSolid`. Define `SolidAb` as the full subcategory on that property." No VS target states light null-test solidity.

   **Repair.** Add a Layer 1 target §1.5 “Light solid abelian groups”, owned here. Its content:
   - Define integer solidity on `LightCondAb`: a group A is solid when `1−σ*` is invertible on internal `Hom(P,A)`, where `P=cofib(ℤ[{∞}]→ℤ[ℕ∪{∞}])`, citing RC Definition 3.2.1.
   - State RC Theorem 3.2.4(1)–(13) for ℤ:
     - Solid is abelian and closed under limits, colimits, extensions and internal Hom from arbitrary objects;
     - it has a reflection;
     - `ℤ■[S]≃lim ℤ[S_n]≅∏_Jℤ` is compact projective, and a generator when S is infinite;
     - `D(Solid)→D(LightCondAb)` is fully faithful onto the complexes with solid cohomology;
     - `(∏_Iℤ)⊗^L■(∏_Jℤ)=∏_{I×J}ℤ` for countable I and J.
   - Give it at least three Checks, including `Hom(P,ℤ)=⊕_ℕℤ` with `(1−σ*)⁻¹e₁=e₁+e₀` (RC lines 806–821).

   Then update the dependent text:
   - Repoint §2.1's heart, §2.3's `D(SolidAb_light)`, §3.1's integer product theorem and §4.2's "light solid abelian groups" to §1.5.
   - Line 40: delete the sentence importing "the equivalence of ordinary integer presentations" from VS2.1.
   - Lines 9, 11 and 68: describe VS2.1 as owning the compact-Hausdorff theory, which is used only through a stated comparison.

   Alternatively, declare `gap:light-solid-abelian` on VS2.1 with that statement as its `needs`, in both plan.json and the README.

   Tested on the instance: with §1.5, the Check "δ𝕊 is solid with π₀=ℤ" (line 174) reads as the discrete ℤ satisfying §1.5's test. That is RC line 812's computation, the same witness as the Conventions line 25 value `e₁+e₀`.

2. **F02** (P2) Both gap `needs` sentences end in an undefined compatibility clause

   **Location.**
   - `packages/SolidAnalyticRings/design/plan.json`, `gaps[0].needs`: "…colim_J in spaces preserves every κ-small limit, with a compatible levelwise stabilization comparison."
   - `gaps[1].needs`: "…independent choices commute with their product, naturally and compatibly with the solid full inclusion."
   - README lines 64 and 70.

   **Claim.** Each `needs` is one precise theorem plus a vague tail. The first tail names no source and no target of the "comparison". The second refers to a light solid full inclusion that VS2.1 does not have (R01). After R01's repair that inclusion would sit in this roadmap, so the supplier would be asked for compatibility with a consumer's object.

   **Witness.** E5:presentability.2 (`spectra`) on main already defines `Sp(C)` as the loop-tower limit, so the stabilization tail names no further statement. HTT line 18705 concerns spaces only. VS2.1 has no light solid inclusion (R01).

   **Repair.**
   - `cardinal-interchange` needs: "For every infinite regular κ, every small κ-filtered ∞-category J and every κ-small simplicial set K, colim_J: Fun(J,C)→C preserves K-indexed limits, for C = Spaces and for C = Sp(Spaces_*) of E5:presentability.2."
   - `light-countable-ab6` needs: "For every countable family of light condensed abelian groups B_j with directed families of subobjects (B_{j,α})_{α∈A_j}, the map colim_{(α_j)∈∏A_j} ∏_j B_{j,α_j} → ∏_j colim_α B_{j,α} is an isomorphism."
   - Restricting the second statement to solid objects becomes §1.5's or §4.2's own one-line consequence (closure under limits and colimits).
   - Use the identical sentence in the README's contract paragraph.

   Tested:
   - For κ=ω₁, J the poset of countable ordinals, K discrete ℕ and `F(α,k)=Hℤ` for k<α (0 otherwise), both sides are `∏_ℕHℤ`.
   - For `B_j=ℚ` and `B_{j,n}=(1/n!)ℤ`, the family `(1/(j+1)!)_j` lies in both sides.

   Optional: since products and filtered colimits of light condensed abelian groups are computed on each light profinite S, AB6 follows directly from AB6 in abelian groups. Owning it here would remove the gap.

3. **F03** (P2) The §6.2 connectivity bound is narrowed, with a false necessity Check and a spurious split hypothesis

   **Location.**
   - `packages/SolidAnalyticRings/design/README.md` line 534: "if M≥b then M/a_r≥b for every r and Λ_a(M)≥b−1. For the free block modules of §5.3 and a complete split datum, improve the bound to Λ_a(F_I)≥0 by split surjectivity".
   - The proof route at line 536, the Check at line 546, and §6.3 at lines 550 and 560.
   - `plan.json` target 6.2, hypothesis "only the improved bound requires the split datum".

   **Claim.** The design says a cofiber tower can lose one degree, so `Λ_a(M)≥b−1`. It says the split datum is what removes the loss, and its Check presents the tower `ℤ←2ℤ←⋯` (with π₋₁=ℤ₂/ℤ) as showing that the b−1 bound is necessary.

   **Witness.** For M≥b, `π_b(M/a_r)=π_bM/a_rπ_bM`, and the transition induced by `(b_{r,s},id)` is surjective. lim¹ of surjections vanishes on the light site (RC Theorem 2.3.3(2), RC line 540), so `π_{b−1}Λ_a(M)=0`.

   **Repair.**
   - State "if M≥b then Λ_a(M)≥b" for every coherent divisibility tower.
   - Delete the split-datum "improvement" sentence and the plan hypothesis; `Λ_a(F_I)≥0` is the case b=0.
   - Replace the Check by: "M=Hℤ, a_r=2^r: the quotients H(ℤ/2^r) have surjective transitions, and Λ_aM=Hℤ₂ has π₋₁=0. The tower ℤ←2ℤ←⋯ is an ideal tower J_r, not a quotient tower."
   - In §6.3, raise the completed tails to ≥b+d+1 and the Check at line 560 to "(b+1)-connective after completion".

   Tested on M=Hℤ, a_r=2^r: `lim ℤ/2^r=ℤ₂` and lim¹=0, so Λ_a(M)≥0=b.

4. **F04** (P3) The finite-output Check tests nothing

   **Location.**
   - `packages/SolidAnalyticRings/design/README.md` line 444: "include the actual coherent factorizations as data".
   - Line 504: "A block mapped simultaneously to every output is excluded by the finite-output condition."

   **Claim.** The Check presents finite output support as a restriction on A-linear maps.

   **Witness.** A datum's A is a countable product of δ𝕊 (§3.2), so `∏_{I_j}A≃A⊗■∏_{I_j}δ𝕊` (§3.1) is compact in Mod_A (§2.4). Every map from it into `⊕_{j′}Y_{j′}` factors through a finite sub-sum.

   **Repair.** Replace the Check with: "the fold map ⊕_jA→A, the identity on each singleton block, has support {0} per block. Its completion sends (t^j)_j to (1−t)^{−1} in ℤ[[t]], which is 1+t modulo t²." Note in §5.2 that the finite-output condition holds automatically for countable-product blocks.

   Tested on A=𝕊[[t]] with f(j)=j: the sum Σt^j is defined only after completion, and the uncompleted ⊕ does not contain the family.

5. **F05** (P3) `*Needs:*` and Dependencies omissions

   **Location.**
   - `packages/SolidAnalyticRings/design/README.md` line 194: §2.1 Needs omits §1.4 and EnhancedDerivedSheaves E2.1–E2.3.
   - Line 84: §1.1 omits E5:abstract.3.
   - Line 17: Conventions, "Choose an essentially small skeleton".
   - Line 570: §6.4.
   - Line 512: Layer 5 Dependencies.

   **Claim.** Inputs that the statements and proof routes use are missing:
   - §2.1 restricts the t-structure to Sp■, which is defined in §1.4.
   - §2.1's route uses replete countable products and the Milnor sequence.
   - §1.1's route uses monoidal localization.
   - §6.4 uses the ordinary p-power tower.

   **Witness.** EnhancedDerivedSheaves on main: E2.1 `IsReplete.countableProduct_epi`, E2.2 `IsReplete.milnor`, E5:abstract.3, and `symmetricSpectra_towerComparison` (same H𝔽_p Check as §6.4). Mathlib: `LightProfinite/Basic.lean:403` (EssentiallySmall) and `LightCondensed.equivSmall` (`Condensed/Light/Small.lean:30`).

   **Repair.**
   - Add §1.4 and EnhancedDerivedSheaves E2.1–E2.3 to §2.1's Needs, and E5:abstract.3 to §1.1's.
   - Add E5:spectra-comparison to §6.4's Needs, and cite `symmetricSpectra_towerComparison` for the ordinary tower.
   - Add EnhancedDerivedSheaves E2:towers to the Layer 5 Dependencies.
   - Cite the two Mathlib declarations for the skeleton in the Conventions and in the Mathlib contract.

6. **F06** (P3) Process narrative

   **Location.** `packages/SolidAnalyticRings/design/README.md`:
   - line 13: "The requests labeled SA.1–SA.4 in consumers do not define sections of this roadmap."
   - line 50: "imported by this design";
   - line 74: "Neither a legal-source status nor an integer comparison is substituted for their proofs.";
   - line 720: "legally read versions".

   **Claim.** These sentences refer to other packages' request labels, to the document's stage and to the source-certification workflow.

   **Witness.** The brief's house style requires the README to be timeless, with no process narrative or references to review artefacts.

   **Repair.**
   - Delete the line 13 and line 74 sentences.
   - Line 50: write "There is no direct Tau Ceti declaration imported."
   - Line 720: write "All locators use the versions recorded in sources.toml."

7. **F07** (P3) Two Checks compute nothing or misstate their diagram

   **Location.**
   - `packages/SolidAnalyticRings/design/README.md` line 102 (§1.1): "The degree-zero integer homotopy sheaves use LightCondAb; an ordinary Category-valued sheaf alone does not encode spectral hyperdescent."
   - Line 652 (§7.2): "retaining Tor in the square ℤ→𝔽₂←ℤ."

   **Claim.** The first is a remark, not a computed test. The second writes a cospan where base change needs the span 𝔽₂←ℤ→𝔽₂.

   **Witness.** Base change is `B′=B⊗_AA′` with A=ℤ and B=A′=𝔽₂, so `π₁(𝔽₂⊗^L_ℤ𝔽₂)=Tor₁^ℤ(𝔽₂,𝔽₂)=𝔽₂`. The line 102 Check computes no value.

   **Repair.**
   - Replace line 102 with a computation, for example: "π₀ of 𝕊[ℕ∪{∞}] at the point is ⊕_{ℕ∪{∞}}ℤ, while its value on a two-point space is two copies."
   - Line 652: write "for the span 𝔽₂←ℤ→𝔽₂ the comparison is 𝔽₂⊗^L_ℤ𝔽₂, with π₁=𝔽₂."

8. **F08** (P3) The kernel-generation hypothesis in §7.2 is not needed for the displayed comparison

   **Location.** `packages/SolidAnalyticRings/design/README.md` line 630: "prove the completed-tensor comparison after applying the target reflector whenever its kernel is the localizing tensor ideal generated by the scalar extensions of the two input kernels".

   **Claim.** The two-path agreement holds only under kernel generation.

   **Witness.** `Map(B′⊗_BK,N)=Map(K,N|_B)=0` for K∈ker L_{D_B} and N∈D_B′. Instance: A=A′=B=B′=Hℤ with D_B′={0} and the others all modules. Kernel generation fails, and both paths give 0.

   **Repair.** Drop the "whenever …" clause from the comparison. If kernel generation is wanted, keep it only as the definition of the induced pushout structure.

The files reviewed are `packages/SolidAnalyticRings/design/README.md`, `packages/SolidAnalyticRings/design/plan.json` and `packages/SolidAnalyticRings/sources.toml`. The design has 7 layers, 26 targets, 83 Checks and two declared gaps. It covers the whole HabiroRings `gap:light-solid-spectra` contract. One unowned foundation and two precision defects block acceptance.

## Verified sound

### Principles

- **No shortcut.** Every endpoint is stated for general data: any prime, general split towers and general analytic structures.
- **No re-planning.** RefinedTraceMethods' generic block is moved down, not duplicated (recorded below).
- **Supply direction.** The suppliers are earlier in the order or on main.
- **No copied passages.** Statements are in the author's own words; I compared §§1.1–1.4, 2.2, 3.1 and 7.1 with W, MW, Q and RC.
- **No algorithms**, and no Lean, so there is no sorry'd data and no `set_option`.

### Sources, seeded sample (15 targets, all verified)

| Target | Locator | Verdict |
|---|---|---|
| 1.1 | RC Def 4.0.1, pp.27–28, RC line 1392 (hypersheaves on light profinite sets; empty value terminal); W 2.1, p.11, W line 437 | correct |
| 1.2 | W 2.1, W lines 439–441 (fully faithful symmetric monoidal left adjoint of evaluation); MW 4.1, p.41, MW line 1748 | correct |
| 1.3 | W line 443 (Null and σ); RC Def 3.2.1, p.16 | correct; the definition is at RC line 732, and line 730 is the shift sentence just before it |
| 2.3 | MW line 1763 (D(ℤ■):=Mod_ℤ(Sp■)); RC Thm 3.2.4(9)–(11), RC line 769 | correct |
| 2.4 | W 2.3, p.12, W line 472 (Null■=∏_ℕ𝕊, compact generator); RC 3.2.4(12), RC line 773 | correct |
| 3.1 | Q proof of B.8, printed p.79, Q lines 3672–3674; RC 3.2.4(13), RC line 777 | correct |
| 3.4 | Q lines 3672 and 3685 (identifying q₁=q₂) | correct |
| 4.1 | HTT Prop 5.3.3.3, printed p.394 (PDF p.412), HTT line 18705; RC Rem 4.0.3, p.28, RC line 1411; Q line 3688 | correct |
| 5.1 | Q lines 3672–3688 (model) | correct |
| 5.2 | Q lines 3693–3705 (profiles f→∞); Bosco Lemma A.4, p.93, Bosco line 3488 | correct |
| 5.4 | Q lines 3688–3705; Bosco line 3510 | correct |
| 6.2 | Bosco Prop A.3 proof, Bosco line 3465; Q line 3688 | correct as models (see R03 for the content) |
| 6.3 | Bosco line 3465 (realization and completion); Q lines 3688–3692 | correct |
| 7.1 | RC Def 4.1.1, p.28, RC line 1431; Rem 4.1.2, p.29, RC line 1457; AG Def 12.1, p.79, AG line 3014 | correct |
| 7.3 | MW 4.2, p.41, MW lines 1764–1775; RC Ex 4.6.4(2),(4), p.44, RC lines 2125–2145 | correct |

Printed and PDF page offsets are correct: Q printed pp.79–80 are PDF pp.124–125, and HTT printed p.394 is PDF p.412. The author flagged no locator as unverified.

### Adversarial table

Every row gives the values computed on each side of the statement.

| Statement | Instances | Values computed (left / right) | Result | Change |
|---|---|---|---|---|
| Conv. σ* | e₁ against ℤ | σ*e₁=e₀; (1−σ*)e₁=e₁−e₀; Σ(σ*)^k e₁=e₁+e₀; right shift gives e₁−e₂ | holds; the right shift is excluded | none |
| Conv. matrix units, signs | e₁₂e₂₁, e₂₁e₁₂; Σ𝕊⊗Σ𝕊 | e₁₁, e₂₂; swap −1; unsuspended reindexing +1 | holds | none |
| Conv. π_k=H^(−k) | ΣHℤ; ℤ in cochain degree 2 | π₁=ℤ, π₀=0; π₋₂=ℤ | agrees with StableHomotopyKTheory §5.15 | none |
| Conv. profiles / H𝔽_p tower | t^(j+1)A→t^jA; H𝔽_p/p^r | inclusion; H𝔽_p⊕ΣH𝔽_p with diag(id,0) ([ΣH𝔽_p,H𝔽_p]=0, so no off-diagonal term), limit H𝔽_p | holds | none |
| 1.1 Cond(Sp) | T=∅, two points; 𝕊[T]⊗𝕊[U] with \|T\|=2, \|U\|=3 | 0 / terminal; X(*)²; 𝕊⁶=𝕊[T×U]; 0⊗𝕊[U]=0=𝕊[∅] | holds | R05, R07 |
| 1.2 δ⊣ev_* | X=0; 𝕊⊕Σ𝕊; lim δH(ℤ/p^r) on T=ℤ_p | δ0=0; π₀=ℤ, π₁=ℤ/2⊕ℤ; id∈C(ℤ_p,ℤ_p) but not locally constant | holds; discrete ≠ completed | none |
| 1.3 N, σ | singleton marked; e₁ | cofib(𝕊[*]→𝕊[*])=0; e₁−e₀ | holds | none |
| 1.4 solidity | M=0, δ𝕊, N | id₀; Hom(P,ℤ)=⊕ℤ with inverse given by partial sums; N(*)π₀=⊕ℤ vs L■N(*)π₀=∏ℤ∋(1,1,…) | holds; N is not solid | none |
| 2.1 t-structure | ΣHℤ; square-zero 𝕊⊕Σ𝕊 | π₁=ℤ; π₀ equals π₀𝕊 but π₁≠ that of 𝕊, so the heart does not determine A | holds | R01, R05 |
| 2.2 L■ | 0; δ𝕊; T=ℕ∪{∞} | L■0=0; δ𝕊; lim δ𝕊[T_n]=δ𝕊⊕∏δ𝕊 (basis e_k−e_∞) | holds | none |
| 2.3 Hℤ comparison | X=Σ^bH𝔽₂; H𝔽_p⊗_{Hℤ}H𝔽_p for p=2,3; free E∞ over 𝔽₂ | π_b: 𝔽₂→π₀(Hℤ∧H𝔽₂)=𝔽₂; Tor₀=Tor₁=𝔽_p; H₁(BΣ₂;𝔽₂)=𝔽₂≠0 vs discrete 𝔽₂[x] | holds | R01 |
| 2.4 G | point; e_n; A=0; Hℤ⊗■G | ∏ℤ∋(1,…); continuous only for the product topology; 0; P■=∏ℤ | holds | none |
| 3.1 ∏⊗∏ | I=∅; 2×3; ℕ×ℕ (integer) | 0=0; 6=6; ∏_{ℕ²}ℤ both sides | holds | R01 (integer input) |
| 3.2 split towers | zero tower; constant 𝕊; 𝕊^(n+1); ×2 | 0; 𝕊; ranks 1,2,3 with kernels of rank 1; 2b=1 has no integer solution | holds; a retract of 𝕊^m is free, since K₀(ℤ)=ℤ and Hurewicz detection applies | none |
| 3.3 independent towers | rank 1 ⊗ rank 1; m=1, n=2; diagonal | 𝕊; 2·3=6; the diagonal ℕ^op→(ℕ^op)² is initial | holds; s(t·1)=0≠t | none |
| 3.4 balancing | A=𝕊; 𝕊[t]; ∏ℤ⊗ℚ; ℛ over ℛ⊗ℛ | X⊗Y both sides; ℤ[t₁,t₂]→ℤ[t]; (2^{−n}) ∉ bounded denominators; cofib(q₁−q₂) is perfect, so it commutes with limits | holds; covers HabiroRings §2.9 | none |
| 4.1 ω₁-interchange | K=∅; J=pt; J=ℕ with F(n,k)=Hℤ[k<n]; J=ω₁ | 0=0; lim F; ⊕ℤ vs ∏ℤ (negative control); ∏Hℤ=∏Hℤ | holds | R02 |
| 4.2 AB6 and towers | B_j=0; ℚ⊃(1/n!)ℤ; ℤ^(n+1) | 0; (1/(j+1)!)_j in the independent colimit, absent from the diagonal one; surjective, lim¹=0 | holds | R02 |
| 5.1 datum | A=0; lim δ(𝕊[t]/t^r); 𝕊/p; a_r=0 for r≥1 | all 0; cofib(t^r)=δ(𝕊[t]/t^r) (the kernel parts are Mittag-Leffler zero), ranks 0,1,2; π₀(𝕊/p)=ℤ/p is not free; 𝕊⊕Σ𝕊 is not unsuspended free | holds; zero scalars excluded | none |
| 5.2 profiles | f(j)=j; f≡0; max(j−k,0); duplication twice | proper; fails at r=1; g≤f_j(j)=0 forces g≡0; {4j,…,4j+3} | holds; filtered but not ω₁-filtered | R04 |
| 5.3 null families | singleton blocks with A=𝕊[[t]]; two blocks; I₀=ℕ | (t^j) with f(j)=j present, (1)_j nonzero mod t at every j; A²=A²; ∏A=∏A | holds; sectionwise on compact S the decay is uniform | none |
| 5.4 all degrees | k<0; π₁𝕊[[t]]; duplication map; fold map | 0; (ℤ/2)[[t]] with ηt^j, survivors η, ηt mod t²; outputs 0–3 mod t²; (1−t)^{−1}=1+t mod t² | holds | R04 |
| 6.1 resolutions | M=0; Σ^bG_A; Σ^{−n}G_A | 0; constant; no common bound | holds | none |
| 6.2 connectivity | a_r=1; zero scalar; M=Hℤ with a_r=2^r; ℤ←2ℤ | 0; M⊕ΣM; Hℤ₂ with π₋₁=lim¹(ℤ/2^r)=0; ℤ₂/ℤ for an ideal tower | statement true but narrowed; Check false as a necessity claim | R03 |
| 6.3 realization | constant; layer ΣM; Σ^{−n}A layers | identity; ≥b+1 before and ≥b+1 after completion (design says b); A in every degree | holds; tails understated | R03 |
| 6.4 p-complete | p=2,3; ℤ_p⊗■ℤ_p; H𝔽_p/p^r | ℤ₂, ℤ₃ with unit ℤ→ℤ_p; ℤ_p; limit H𝔽_p | holds; retains the completed unit | none |
| 7.1 structures | D=all; D={0}; Perf(Hℤ) | L=id, completed; L=0, completed iff A=0; ⊕Hℤ∉Perf | holds; matches RC 4.1.1 with (2′) | none |
| 7.2 tensor and base change | 0; D=0 with A=Hℤ; trivial structures; (ℤ,all)→(ℤ,{0}) | 0; π₀L_DA=0; 𝔽₂⊗^Lℤ𝔽₂ with π₁=𝔽₂; both paths 0 | holds; one hypothesis unused | R07, R08 |
| 7.3 summability | F=∅,{0}; f=1; e₁; ℚ_p with f=1/p for p=2,3; 𝔽₂[ε] | all modules; solidity; (1−fσ*)(e₁+fe₀)=e₁; p^n−p^{−1}p^{n+1}=0 with b₀=1 and p^n→0, so the kernel is nonzero; (1−εσ*)(1+εσ*)=1 | holds; connectivity via the connective E₁ localization of R_A is plausible | none |
| 7.4 measures | finite S with \|S\|=2, ∅, *; (∏O_E)[1/p]; θ over 𝔽₂ | ℤ², 0, ℤ; (p^{−n})_n excluded; not essentially surjective | holds; completed iff B≃μ[*] | none |

### Duplication audit, by object

- **Mathlib at 6b7abb3c, opened at the pin.** Every line number in the README matches:
  - `LightProfinite` (`Topology/Category/LightProfinite/Basic.lean:42`) and `LightProfinite.of` (:56);
  - `LightProfinite.effectiveEpi_iff_surjective` (`EffectiveEpi.lean:28`);
  - `LightCondensed` (`Condensed/Light/Basic.lean:28`);
  - `LightCondMod`, `LightCondensed.free`, `freeForgetAdjunction` and `LightCondAb` (`Condensed/Light/Module.lean:42,68,73,85`);
  - `LightCondensed.discreteUnderlyingAdj` (`Condensed/Discrete/Basic.lean:86`);
  - the `CountableAB4Star` and `IsGrothendieckAbelian` instances (`Condensed/Light/AB.lean:31–37`); Mathlib has no AB6 anywhere;
  - the monoidal instances (`Condensed/Light/Monoidal.lean:41–62`);
  - `Condensed.profiniteFree`, `profiniteSolid`, `profiniteSolidification` and `CondensedMod.IsSolid` (`Condensed/Solid.lean:44,48,69,83`, with the docstring at 74–82);
  - `LocallyConstant.freeOfProfinite` (`Topology/Category/Profinite/Nobeling/Induction.lean:153`);
  - `LightCondensed.internallyProjective_free_natUnionInfty` (`Condensed/Light/Sequence.lean:302`, with `R : Type` at :20);
  - `InternallyProjective.ofRetract` (`CategoryTheory/Preadditive/Projective/Internal.lean:61`);
  - `Submodule.basisOfPid` (`LinearAlgebra/FreeModule/PID.lean:298`).

  The one omission is the essentially-small site (R05).
- **Tau Ceti at a91d3aaf.** It has no condensed, solid or spectral carrier, so citing none is correct.
- **Light condensed and solid spectra.** Roadmap-service searches for "hypersheaves of spectra", "condensed spectra", "Cond(Sp)", "Sp■" and "solid spectra" over main and all open roadmap pull requests find only the HabiroRings consumer. On the board, the only other owner is RefinedTraceMethods §6.2, which this design relocates.
- **Analytic structures.** VS2.2 owns the integer, measure-based analytic rings. The RC-style spectral structures of §§7.1–7.3 are a distinct sphere-linear object, and §7.4 compares the two.
- **Null-family formula.** HabiroRings §2.10 states the Habiro instance and declares it as consumed through `gap:light-solid-spectra`. This roadmap owns the general form.

### Supplier order

Gate output, verbatim:

    candidate: SolidAnalyticRings is not in the merge order yet; checked as if placed after VStackSheavesAndLisseCategories (the intake inserts it when its design is accepted)
    depcheck: 27 roadmaps, 233 edges, 0 problem(s)

There is no UPWARD or CYCLE line.

Every Needs item was resolved:
- **GeneralizedCohomology** on main: G2.1–G2.7 (the numbered items 1–7 of G2) and G3.8–G3.9.
- **EnhancedDerivedSheaves** on main a07e202: §§0.1–0.3, E0.4, E0.8, E1.3, E2:towers, E2.6–E2.7, E3.2–E3.3, E4.1, E4.4, E5:abstract.2–5, E5:presentability.1–2, E5:animation.4 and E5:spectra-comparison. All exist and say what is cited. E0.8 and E5:presentability.2 define cardinal filteredness and spectra but do not state HTT 5.3.3.3; E5:animation.3 uses it only inside a proof route. So `gap:cardinal-interchange` asks for nothing that is already provided.
- **StableHomotopyKTheory** §§5.13–5.18 at head 00bfbf7.
- **VStackSheavesAndLisseCategories** VS2.1 and VS2.2, with their bold-named paragraphs, at head 0ca8db7. VS2.1 lacks the light content (R01).

Consumer citations resolved:
- HabiroRings §§2.6–2.12 at head bb5d6cb;
- HigherHidaAndColemanTheory R23–R24 at board head da88512 (lines 1824 and 1830);
- LocallyAnalyticRepresentationsOfLocalGroups LR.3 (board design, line 776).

The citations lead "RefinedTraceMethods §6.2" resolves to board package RefinedTraceMethods at head 87bc3ff, §6.2, “Light condensed and solid spectra”.

Both gaps name a supplier earlier in the order and are declared with the same slug in `plan.json` and the README; their precision is R02.

**Move recorded.** The generic RefinedTraceMethods §6.2 block (Cond(Sp), discrete embedding, null test, reflection, ⊗■, Null■≃∏𝕊 as compact generator, and the bounded-below p-complete comparison with completed unit and lax inclusion) moves down to this roadmap's §§1.1–2.4 and §6.4. Every clause and Check of that block was matched. Its even-filtration Check about Hom(Null,𝕊) stays in RefinedTraceMethods.

### Coverage of the commissioned contract

Every clause of the HabiroRings `gap:light-solid-spectra` contract (its README lines 66–70 and 86) is covered:

| Contract clause | Design target |
|---|---|
| Hypersheaves of spectra on light profinite sets | §1.1 |
| δ fully faithful, symmetric monoidal, with right adjoint ev_* | §1.2 |
| Null and σ solidity | §§1.3–1.4 |
| Closure under limits and colimits, accessible monoidal L■ | §2.2 |
| Null■≃∏_ℕ𝕊 as compact generator | §2.4 |
| (∏𝕊)⊗■(∏𝕊)≃∏_{ℕ²}𝕊 | §3.1 |
| Split finite free towers | §§3.2–3.3 |
| Derived relative base change | §3.4; ℛ is dualizable over ℛ⊗ℛ, so HabiroRings §2.9 goes through |
| Countable-limit/ω₁-filtered-colimit interchange in Mod_{S_H}(Sp■) | §4.1 |
| Null-family formula in every degree | §§5.3–5.4 (the Habiro tower satisfies §5.1, with ranks d_n=n(n+1)/2) |
| t-structure with uniformly bounded-below resolutions and realization | §§2.1, 6.1, 6.3 |
| Analytic rings beyond VS2.1 | Layer 7 |

### Shape

- The README has the upstream section order, an Examples and a Dependencies section at the end of every layer, and Unicode mathematics without LaTeX.
- There are no target-number tables and no field lists.
- Each of the 11 definitions and constructions has an API list and at least three Checks.
- Each of the 26 targets has a locator and at least three Checks.
- Plan and README agree on all 26 prerequisite lists.

### Lean form and headline theorems

Not applicable at the design stage: no `Suggested.lean` exists. Elaboration is not available (this lane does not elaborate), so no `#check` scratch was run. The mechanical `#check` comparison and the one-tactic padding probe belong to the package stage. At the pins Mathlib has no ∞-category of spectra, so the headline theorems will mostly be named in the docstring as not statable.

### Ownership against open pull requests

Checked through the roadmap service (all 330 open roadmap pull requests at their heads, plus main) and the board packages present or indexed. No sibling checkout with a path was given; the service covered them.

## Not verifiable

- **CS and AS.** These were not in the seeded sample and appear only in References and as context, so I did not open them.
- **MW versions.** I did not check online that the MW author version of 5 February 2026 numbers §4.1 the same way as arXiv 2410.23115; the manifest pins the author version, which is the one I read.
- **Lean.** Elaboration is not available in this lane, and the design stage has no Lean file.

## Source issues

- **Misprint** in RC at Theorem 2.3.3(3), p.12 (RC line 541): the internally projective object is written with a disjoint-union sign; it should be the one-point compactification ℕ∪{∞}, as the proof at RC line 548 uses; affects nothing.
- **Misprint** in RC at the proof of Theorem 2.3.3(3), p.12 (RC lines 555–556): the factor is written as ℕ times the point at infinity; it should be ℕ∪{∞}; affects nothing.
- **Misprint** in RC at the proof of Proposition 3.2.5, item (1), p.18 (RC line 812): the second coordinate of (1−Shift*) applied to a sequence is a₁ minus itself; it should be a₁ minus a₂; affects nothing (the stated inverse is correct).
- **Misprint** in RC at the proof of Proposition 3.2.5, item (7), p.19 (RC lines 874–875): the solid target is introduced as C but written as B in the displayed isomorphism and the conclusion; it should be C throughout; affects nothing.
- **Misprint** in RC at the proof of Proposition 3.2.5, p.19 (RC line 876): it assumes properties (11) and (12), but the argument uses (12) and (13) to deduce (9)–(11); it should read (12) and (13), matching RC line 794; affects nothing.
- **Misprint** in HTT at the proof of Proposition 5.3.3.3, printed p.394 (HTT line 18710): the cofinal map from N(A) is given the ∞-category of spaces as target; it should be the κ-filtered ∞-category I, as the factorization that follows requires; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d195541", "job": "REV-DESIGN-SolidAnalyticRings", "model": "opus", "worker": "fable-rev7"} -->
