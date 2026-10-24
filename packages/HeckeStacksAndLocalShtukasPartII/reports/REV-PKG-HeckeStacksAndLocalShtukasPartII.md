<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1138#issuecomment-6383845261 -->
Review (claude) of cf9d6fb

Verdict: needs changes

1. **F01** (P1) §5.1 claims λ_w^♭♭ ≤_ℤ λ, false for twisted σ

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/README.md` line 1206: "λ_w^♭♭=(λ−ρ_J∨)−_domη_J∨=λ−_dom(ρ_J∨+η_J∨). Prove it is dominant and ≤_ℤλ." Same claim as API bullet, line 1221: "Dominant and bounded by λ in the stated integral coroot coset."

   **Claim.** For every normal form w = x t^λ y the double-flat coweight satisfies λ − λ_w^♭♭ ∈ ℕα₁∨+…+ℕα_r∨.

   **Witness.** Quasi-split adjoint unitary A₂ (σ swaps s₁,s₂), λ = ρ∨ = ω₁∨+ω₂∨, y = s₁, J = {s₁}: λ−ρ_J∨ = ω₂∨, η_J∨ = ω₁∨, λ^♭♭ = ω₁∨ (2ω₁∨−ω₂∨ = α₁∨). λ−λ^♭♭ = ω₂∨ ∉ Q∨.

   **Note.** The input is in the main theorem's range: w = s₁t^{ρ∨}s₁ is shrunken (its alcove has α₁-, α₂-, θ-values in (0,1), (−3,−2), (−2,−1)) and η_σ(w) = s₂s₁ has full σ-support. With minuscule λ = ω₁∨, y = s₁ one gets λ^♭♭ = ω₂∨, which is not even rationally ≤ ω₁∨. In general λ^♭♭ ≡ λ + (σ⁻¹−1)ρ_J∨ mod Q∨. The source only gives λ^♭♭ ≥_ℤ λ−ρ_J∨−η_J∨ (he21 line 531, §6.4, p. 14).

   **Repair.** Replace "≤_ℤλ" in line 1206 and the bullet at line 1221 with two statements:
   - λ^♭♭ ≥_ℤ λ − ρ_J∨ − η_J∨, and λ^♭♭ has the same image as λ in the σ-coinvariants of P∨/Q∨.
   - λ^♭♭ ≤_ℤ λ whenever ρ_J∨ + η_J∨ ∈ Q∨, in particular when σ acts trivially on the Dynkin diagram. Then ρ_J∨ − w₀ρ_J∨ is a dominant element of Q∨, hence lies in the ℕ-cone, so λ is feasible.

   Add the unitary A₂ instance as a negative-control Check (λ^♭♭ = ω₁∨, λ−λ^♭♭ = ω₂∨ ∉ Q∨). On the witness, the repaired statements hold: ω₁∨ − (ρ∨−2ω₁∨) = α₁∨ ≥_ℤ 0, and ω₁∨ ≡ ρ∨ in the trivial coinvariants of ℤ/3 under −1. No later target uses the deleted inequality: §6.4 uses γ ≥_ℤ λ^♭♭, and §8 uses (λ^♭♭)^♦.

2. **F02** (P1) §7.4 Check asserts that the A₁ reflection is not shrunken; it is shrunken

   **Location.** README line 1544: "For γ=0 and a=s in split A₁, the finite-quotient locus is P¹ minus P¹(𝔽_q), which is nonempty of dimension 1, including q=2. The base reflection is not shrunken."

   **Claim.** s ∈ W₀ (that is, a t^γ with γ = 0) is not shrunken.

   **Witness.** The base alcove has α-values (−1,0), so s·a has α-values (0,1), outside the only critical strip. The README's own §0.3 Check (line 308) says such alcoves "lie outside the A₁ critical strip".

   **Note.** In fact every w ∈ W_a∖{1} of A₁ is shrunken.

   **Repair.** Replace the witness with split A₂, γ = 0, a = s₁s₂ (a Coxeter element with full support). Then (s₁s₂)⁻¹α₂ = α₁ > 0, so s₁s₂·a lies in the α₂-critical strip and s₁s₂ is not shrunken. Yet X_{s₁s₂}(1) ≠ ∅: it contains the classical Coxeter Deligne–Lusztig variety of PGL₃ over the standard vertex, of dimension 2 = (2+2−0)/2 = d_{s₁s₂}(1).

   Keep the q = 2 remark on the A₁ γ = 0 case, but drop its shrunkenness clause. The author's report row "γ=0,a=s … its base alcove is critical" has the same error.

3. **F03** (P2) the Hecke-algebra normalization behind "dimension = degree" is not pinned, and the supplier's normalization gives wrong dimensions

   **Location.** README line 187: "Consume SR.1.5, presentations of the Iwahori–Hecke algebra, over the integral Laurent coefficient ring." Line 508: "expansion T_w=Σ_O f_(w,O)(v−v⁻¹)T_O with nonnegative integral class polynomials". The gap `twisted-affine-cocenter` (line 191) also states no quadratic relation.

   **Claim.** dim X_w(b) = max_O ((ℓw+ℓO+deg f_{w,O})/2 − 〈ν_b,2ρ〉), with T_w the basis supplied by SR.1.5.

   **Witness.** SR.1.5 (#785 head, *iwahori-matsumoto*) uses (T_s−q)(T_s+1) = 0 with q = v². Then T_{s₀}T_{s₁}T_{s₀} ≡ (q−1)T_{s₁s₀} + qT_{s₁} in the cocenter, so f_{w,[s₁]} = v². That gives (3+1+2)/2 = 3, or 5/2 counting in q. The true value is 2 (§1.2 Check).

   **Note.** he14 §2.2 (line 315, p. 374) uses (T_s−v)(T_s+v⁻¹) = 0, and f ∈ ℕ[v−v⁻¹] (line 336).

   **Repair.**
   - In §1.3 and in the SmoothRepresentationsOfLocalGroups contract, state that T_w denotes the normalized basis v^{−ℓ(w)}T_w^{SR.1.5} with q = v². It satisfies T_s² = (v−v⁻¹)T_s + 1, class polynomials lie in ℕ[v−v⁻¹], and deg is the degree in v−v⁻¹ (he14 §§2.2–2.3, pp. 374–375).
   - Add this to the `twisted-affine-cocenter` needs sentence.
   - Add the Check "for s₀s₁s₀ in affine A₁ the normalized coefficient of T_{s₁} is 1, giving 2; the unnormalized coefficient q = v² would give 3".

   Tested on the witness: v⁻³((v²−1)v²T̃_{s₁s₀} + v²·vT̃_{s₁}) = (v−v⁻¹)T̃_{s₁s₀} + T̃_{s₁}, which gives degree 0 and dimension 2.

4. **F04** (P2) §4.6 asserts Newton-stratum closure relations for all local fields; the source says no mixed-characteristic analogue exists

   **Location.** README lines 1136–1138: "In the cell, the closure of each occurring Newton stratum is the union of the occurring strata below it. … the general local-field transfer is the general flag-geometry transfer." Line 1147 adds: "Prove the general mixed-characteristic flag transfer on the specified bounded models."

   **Claim.** The closure relation (and the whole of §4.6) holds for mixed-characteristic flag data via `gap:general-flag-geometry`.

   **Witness.** mv20 Remark 1.3 (PDF p. 3, mv20 lines 150–162) says the proof does not generalize to mixed characteristic and that no analogue of the closure assertions is currently known there.

   **Note.** `gap:newton-cell-purity` covers only "equal-characteristic Iwahori cells", and `gap:general-flag-geometry` supplies no Newton purity. The mixed-characteristic input is therefore unowned. Conversely, the same sentence restricts dim X_w(b) = d_w(b) to equal characteristic, while §7.6 (line 1592) and §8.2 use the dimension equality in general.

   **Repair.** Rewrite §4.6 as follows.
   - Saturation and dim X_w(b) = d_w(b) are stated for every local field. Route: §1.3, whose class-polynomial formula is characteristic-independent (mv20 Remark 1.3; he15 Theorem 2.23).
   - Equidimensionality and the closure relation are stated only in the equal-characteristic setting (mv20 Theorem 3.16(3) and Corollary 3.17, PDF pp. 8–9).
   - Delete the mixed-characteristic clause at line 1147.

5. **F05** (P2) four declared gaps are compound, vague or partly already supplied

   **Location.**
   - Lines 123–125 (`twisted-redmin-demazure`): "The associative extended-affine Demazure product with support union, parabolic minimum comparisons, twisted Red-Min and strong conjugacy, and straight–finite-parabolic decomposition, including the finite-Coxeter basic-class input."
   - Lines 164–166 (`general-flag-geometry`), 109–111 (`unipotent-linearization`) and 147–149 (`newton-cell-purity`). The same wording is in `design/plan.json` gaps.

   **Witnesses.**
   - `twisted-redmin-demazure` bundles five results (gh10 Lemma 2.5.1; hn14 Theorem 2.9/Corollary 2.10; hn14 Proposition 2.7 with he14 Theorem 2.3; he14 Proposition 11.7). "Parabolic minimum comparisons" names no statement. For W₀ the minimal-coset factorization is pinned: `CoxeterSystem.IsMinimalCosetRep` and `CoxeterSystem.existsUnique_isMinimalCosetRep_mul` (TauCeti/GroupTheory/Coxeter/Parabolic.lean:233, 330).
   - `general-flag-geometry` ("for every local-field datum used here") largely restates what GS0 already states for connected reductive G over any nonarchimedean local field (GeometricSatakeAndFusion, Conventions, at #1235):
     - `parahoric-ind-projectivity`: Iwahori flags in both characteristics;
     - `equal-characteristic-schubert-models`: classical models and their perfections;
     - `flag-incidence-correspondences`;
     - `flag-convolution-fibres`: ordinary and Demazure bounds, which "transfer to compatible pfp perfect models".
   - `unipotent-linearization` never says which "exact characteristic hypotheses" apply, or what the "characteristic-independent replacement sufficient for the twisted Lang dimension calculation" asserts.
   - `newton-cell-purity` bundles four results: the chain-length formula, strong topological purity, greatestness on closures, and the cell-to-ADLV comparison.

   **Repair.** Split and state each gap with hypotheses in plan.json and the README, as follows.
   - `twisted-redmin-demazure` becomes four gaps:
     - `demazure-product`: the monoid on W̃ ⋊ 〈σ〉 with associativity, Bruhat monotonicity, supp(u*v) = supp u ∪ supp v, and ℓ(u*v) = ℓu + ℓ(u⁻¹(u*v));
     - `twisted-redmin`: hn14 Theorem 2.9/Corollary 2.10 and he14 Theorem 2.1;
     - `straight-finite-parabolic`: he14 Theorem 2.3;
     - `finite-coxeter-basic-class`: he14 Proposition 11.7.
   - Cite the pinned Tau Ceti minimal-coset API, and state separately any comparison still missing (for example gh10 Lemma 2.6.1 as used in he21 §5.4).
   - For `general-flag-geometry`, either cite the four GS0 targets above and delete the gap, or name the one missing statement with its data.
   - For `unipotent-linearization`, name the replacement statement (for example an M-stable, σ-compatible filtration of N with M-equivariant vector-group quotients, valid for every p) or cite the RG2.3 target that gives it.
   - Split `newton-cell-purity` into its four parts, each with its source.

   Reconciliation note: the RootSystemsPartII design (board, "Independent continuation briefs") routes Demazure products, dominant subtraction, twisted Red-Min, shrunken chambers (He21 /28) and the 2ρ∨ Newton bound (/98) to an unadopted proposal, `RootSystemsPartIIDominanceAndDemazure`. It states that RS2.1 is integral order only. The two gaps addressed to RS2.1 therefore land on a design that disclaims them. This package's §§0.3, 5.2 and 8.4 own items that the same ledger routes to that proposal; record in Scope that this roadmap owns them.

6. **F06** (P3) Needs lines cite suppliers for content that lives in declared gaps or in an uncited section

   **Location.**
   - Line 525 (§1.3) and line 1547 (§7.4) cite "SmoothRepresentationsOfLocalGroups SR.1".
   - Line 816 (§3.3) cites "BunGAndNewtonStrata Layer 1".
   - Line 1518 (§7.3) cites "BunGAndNewtonStrata Layer 1, galois-average".
   - Lines 475 and 501 cite "the RootSystemsPartII Red-Min supplier contract", and lines 1234, 1270 and 1707 cite "RS2.1 and its two supplier extensions".

   **Witness.**
   - SR.1.5 (SmoothRepresentationsOfLocalGroups at #785, section SR.1.5) has split Iwahori–Matsumoto, Bernstein and centre results, but no twisted cocenter or class polynomials.
   - BunGAndNewtonStrata has no "superbasic" statement (`roadmaps grep superbasic`: no match).
   - BunGAndNewtonStrata §1.45 (`general-levi-newton-comparison`) states exactly §7.3's step "λ^♦−ν_M lies in the J-coroot span".

   **Repair.**
   - Add `gap:twisted-affine-cocenter` to lines 525 and 1547.
   - Add `gap:superbasic-classification` to line 816.
   - Add "BunGAndNewtonStrata §1.45, general-levi-newton-comparison" to line 1518.
   - Replace the descriptive gap references with the slugs (`gap:twisted-redmin-demazure`, `gap:dominant-subtraction`).

7. **F07** (P3) §8.3 is narrower than its own cited sources

   **Location.** README lines 1669–1674: "For basic b, shrunken w and the same strict λ-gap, … nonemptiness is equivalent to integral κ equality and full σ-support"; line 1679: "the strict-gap hypothesis … cannot be silently replaced by a non-strict one"; Check, line 1684.

   **Witness.** ghn15 Theorem B (PDF p. 3) and he15 Theorems 2.27 and 2.31 (PDF pp. 37, 39) cover all shrunken w with basic b, without a strict gap. Split adjoint A₂, b = 1, w = w₀: gap fails, locus nonempty of dimension 3 = d_{w₀}(1).

   **Note.** For simple G and basic b, ν_b = 0, so the gap fails only when λ = 0, that is, only for w = w₀ (ghn15 line 579).

   **Repair.**
   - State the basic theorem without the strict gap, citing ghn15 Theorem B, he15 Theorems 2.27/2.31 and he14 Theorem 12.1. Alternatively, keep §8.3 as a corollary of §8.1 and add one clause naming the gap-free theorem.
   - Delete line 1679's warning for basic b.
   - Drop the minuscule sentence of the Check: a nonzero minuscule λ already has a strict gap when b is basic.

8. **F08** (P3) the ReductiveGroupsPartII convention transport has only a sign-blind witness

   **Location.** README lines 105–107: "The chamber and translation orientation is transported … The supplier's SL₂ witness has translation length 2 and left-reflection translation length 3; reversing both the apartment coordinate and chamber gives the same lengths here."

   **Witness.** RG2.4 *dominant-coinvariant-cocharacters* (ReductiveGroupsPartII at #785) has t^λ = λ(ϖ)⁻¹, acting by +λ with κ(t^λ) = −λ; its Check `newton_translation_split_sign` gives κ = −1 for translation (1,0). This README uses κ(t^(1,0)) = 1 (§4.1 Check, line 1021). Lengths in SL₂ cannot detect the sign.

   **Repair.** Add a Check: "this README's t^(1,0) = diag(ϖ,1) is RG2.4's t^(−1,0); it has κ = +1 and ν = (1,0). Reading RG2.4's t^(1,0) literally gives κ = −1 and empties the §4.1 example." Also state that transport means λ ↦ −λ together with Φ⁺ ↦ −Φ⁺.

9. **F09** (P3) pinned declarations used by object but not cited

   **Location.** Line 96: "Right invariance in §0.1 follows by the analogous subgroup factor calculation." Line 236: "Equal double cosets IwI give equal point loci." Lines 1242–1243: "x′ minimal in W₀/W_(J′) … y′ minimal modulo Stab_S γ".

   **Witness.**
   - `DoubleCoset.doubleCoset_eq_of_mem` (Mathlib/GroupTheory/DoubleCoset.lean:51) gives I(i₁wi₂)I = IwI, and with it both invariances.
   - `CoxeterSystem.parabolic`, `CoxeterSystem.IsMinimalCosetRep` and `CoxeterSystem.existsUnique_isMinimalCosetRep_mul` (TauCeti/GroupTheory/Coxeter/Parabolic.lean:101, 233, 330) give the unique factorization u·v with u minimal and v ∈ W_J, with additive lengths.

   **Repair.** Add these to "From Mathlib" and "From Tau Ceti", to the Needs of §0.1 and §5.2, and to R05's split gap.

10. **F10** (P3) policy and style

   **Location and witness.**
   - Forty-seven "Source extraction: <id> line N" pointers (for example line 223, "Source extraction: he21 line 186") and private line locators at lines 131 and 195 index the operator's text extractions. `roadmaps grep 'Source extraction:'` finds them on no other roadmap, and readers cannot resolve them.
   - Line 378 uses the design-stage id "HSD6".
   - Lines 378–380 contain a garbled sentence: "is a separate scope transfer the general flag-geometry transfer".
   - Lines 330–331 give an instruction to a roadmap that does not exist: "The component continuation must give an explicit dictionary to the component continuation's closed-union notation".
   - A blank line at 340 splits §0.4's API list into two lists.

   **Repair.**
   - Delete every "Source extraction" pointer; the theorem and page locators already present suffice.
   - Replace line 131 with "hn14, Proposition 2.7, Theorem 2.9 and Corollary 2.10, PDF pp. 10–11".
   - Change "HSD6" to "§6.3".
   - Rewrite the two sentences.
   - Join the API list.

11. **F11** (P3) two locators

   **Location and witness.**
   - Line 485, "gh10, Proposition 2.5.2 and Corollary 2.5.3, PDF pp. 7–9": Proposition 2.5.2 is stated on PDF p. 6 (gh10 line 224), and the proof of Corollary 2.5.3 ends on p. 10 (gh10 line 395).
   - §4.3 (line 1068) relies on mv20 Lemma 3.2 (PDF p. 5, mv20 line 266) without citing it.

   **Repair.** Write "PDF pp. 6–10", and add "mv20, Lemma 3.2, arXiv v3, PDF p. 5" to §4.3.

Files reviewed: `packages/HeckeStacksAndLocalShtukasPartII/README.md` (1764 lines), `Suggested.lean` (50 lines), `metadata.toml`, `sources.toml` (14 entries). Pins: content main `bec24db`, Mathlib and Tau Ceti as in `lake-manifest.json`. Open heads used: ReductiveGroupsPartII and SmoothRepresentationsOfLocalGroups at #785 `1383569`, BunGAndNewtonStrata #1241 `0d1e747`, GeometricSatakeAndFusion #1235 `0652974`, HeckeStacksAndLocalShtukas #1252 `48d21c7`, TraceFormula #196 `4bd7237`; RootSystems and SchemeAndStackFoundations on main; RootSystemsPartII as the board design package. Eleven findings: two P1, three P2, six P3.

## Verified sound

**Sources (sampled targets, read at the locator).** All 15 seeded targets were checked; there were no author-flagged unverified locators. The table gives what each target was checked against.

| Target | Source checked | Result |
|---|---|---|
| §0.3 | he15 §2.9.4, p. 36 (critical strip {−1<〈α,v〉<0}, line 1464); he21 §2.2, p. 5 (line 217) | ✓ |
| §0.4 | zhu17 §3.1.1 (3.1.1)–(3.1.2), p. 455; Lemma 1.22, p. 428; he21 Theorem 4.4, p. 7; he14 Theorem 7.1, p. 389 | ✓ |
| §1.2 | gh10 §2.4(2), Proposition 2.5.2, Corollary 2.5.3 (closed piece over sws with A¹ fibres, open piece over sw with G_m fibres); he21 Proposition 3.3 | ✓; page nit R11 |
| §1.3 | he14 Theorem 6.1, p. 387, and §2.3 recursion | ✓; normalization R03 |
| §2.4 | vie06 Theorem 4.3, Lemma 4.2, (4.1) definition of V, Proposition 5.2 | ✓ |
| §4.4 | mv20 Definition 3.14, PDF p. 8; he21 line 263 | ✓ |
| §4.5 | he21 §3.3 and line 265 | ✓ |
| §4.6 | mv20 Theorem 3.16, Corollary 3.17 and Remark 1.3 | scope R04 |
| §6.1 | he21 Proposition 5.6; gh10 Proposition 2.5.2 (ordinary ½, Demazure without ½) | ✓ |
| §6.4 | he21 Theorem 5.5 and §5.4, including w = w₁w₂, N₁, N₂ and supp_σ(a) ⊇ supp_σ(η) | ✓ |
| §7.1 | ghn15 §3.3 definition, PDF p. 10; he21 §6.1 | ✓ |
| §7.3 | he21 §6.2; ghn15 Lemma 3.6.3 | ✓; conjugator x confirmed, see Source issues |
| §7.5 | ghn15 Theorem 3.3.1, PDF p. 11 (surjective; injective for strict alcoves; fibres I_M-σ-conjugate) | ✓ |
| §8.2 | he21 Theorem 6.1 and §6.3 | ✓ |
| §8.3 | he21 §6.4; ghn15 Theorem B | narrower, R07 |

Also confirmed:
- §3.1: ghkr06 Proposition 5.3.1, both displayed forms.
- §3.4: ghkr06 Proposition 5.6.1(3) and Corollary 5.4.4.
- §3.6: zhu17 Lemmas 3.5 and 3.7.
- §8.4: he21 Corollary 6.4.
- The ghnerr Propositions 0.0.1 and 0.0.2 and their GL₂ torus counterexample.

**Adversarial table (computed values).**

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, η and normal form | split adjoint A₁, w = s t^{nα∨} | alcove (−1,0)→(2n,2n+1); ℓ = 2n+1; t^{nα∨} is minimal in W₀t^{nα∨} (ℓ 2n vs 2n+1); η = s; d = n+1 | ✓ |
| Conventions, defect | GL₂, μ = (1,0), basic | 〈ρ,μ−ν〉 = 1/4+1/4 = 1/2; defect 2−1 = 1; value 0 | ✓ |
| Conventions, trace | H²_c(A¹) | geometric Frobenius q, arithmetic q⁻¹ | ✓ |
| Conventions, volume | h = 2, A = ℕ versus 1+ℕ | vol = \|ℕ∖A\| − \|A∖ℕ\| gives 0 and 1 (vie06 line 213) | ✓ |
| Conventions, norm order | E/F of degree 3 | (σx)_τ = σ(x_{σ⁻¹τ}), so with τ_i = σ^{−i}τ₀ the norm is b₀σ(b₁)σ²(b₂) | ✓ |
| §0.1 | S₃, I = 1, b = (12), g = (123); commutative H; I = H; I = 1, b = 1 | g⁻¹bg = (13) under Mathlib's ∘ (g(1)=2, b→1, g⁻¹→3); r_b(g) = b for abelian H; one point; locus = H iff w = 1 | ✓ |
| §0.2 | A₁ w = s; GL₂ t^(1,0); GL₂ s t^(1,0) basic; A₂ swap | 1; (1+0)/2−1/2 = 0; (2+1−1)/2 = 1; η = s₁s₁ = 1 versus wrong length 2 | ✓ |
| §0.3 | A₂, λ = 6ω₁∨ | = 4α₁∨+2α₂∨; λ−2ρ∨ = 2α₁∨; 〈α₂,λ〉 = 0, so t^λ·a stays in the α₂-strip | ✓ |
| §0.4 | G_m, b = ϖ, μ = 0; GL₂ X_s(1) fibre | val 1 ≠ 0, empty (expression 0); P¹∖P¹(𝔽_q) of dim 1 versus q+1 points | ✓ |
| §0.5 | split torus b = 1 | X_*(T) ≅ ℤ^r discrete, dim 0; empty locus −∞ | ✓ |
| §0.6 | S₃, b = (12), h = (123) | b′ = hbh⁻¹ = (23); (hg)⁻¹b′hg = g⁻¹bg; with h⁻¹ one gets conjugation by h², sending (12) to (13) | ✓ |
| §1.1 | GL₂ t^(1,0); A₁ s | 1−1 = 0; 1−0 = 1 | ✓ |
| §1.2 | affine A₁, s₀s₁s₀, b = 1 | s₀ws₀ = s₁ (length 1); s₀w = s₁s₀ is a straight translation, so −∞; 1+max(−∞,1) = 2 | ✓ |
| §1.3 | same w | normalized f = 1, giving (3+1+0)/2 = 2; unnormalized q gives 3 or 5/2 | R03 |
| §1.4 | w = v; empty X_v | 0 ≥ 0; no condition imposed | ✓ |
| §2.1 | h = 2, m = 1, A = ℕ | B = {0,1}; μ′₁ = 0, μ′₂ = 1 (b: 0→1→0) | ✓ |
| §2.2 | φ = ⌊(a+1)/2⌋ | φ(a+2) = φ(a)+1; bound max{n: a+1−2n ≥ 0} attained; V = ∅ since φ is monotone | ✓ |
| §2.3 | standard lattice | t^{−n}bσ(e_a) = e_{a+1−2n} ∈ M iff n ≤ (a+1)/2 | ✓ |
| §2.5 | (h,m,μ) = (2,1,(0,1)), (2,1,(−1,2)), (3,4,(0,0,4)) | 1/2−1/2 = 0; 3/2−1/2 = 1; 4−1 = 3 | ✓ |
| §3.1 | GL₂, ν_M = (a,b), a−b = ±2 | min(〈α,ν〉,0) = 0 and −2 = 〈ρ,ν−ν_dom〉; general identity Σ_{α>0}min = 〈ρ,ν−ν_dom〉 checked | ✓ |
| §3.3 | GL₂ ordinary versus basic | J_b/Z(G) = G_m (split rank 1) versus D^×/F^× (rank 0) | ✓ |
| §3.4 | GL₂, M = T; (b,μ,μ_M) = (1,(1,−1),0) and (t^(1,0),(1,0),(1,0)) | 0+1+0−0 = 1 = 〈ρ,μ〉; 0+1+0−1 = 0 = 〈ρ,μ−ν〉 | ✓ |
| §3.6 | U, V over ℤ and 𝔽₂ | UV = [[2,1],[1,1]] ≠ VU = [[1,1],[1,2]]; mod 2 [[0,1],[1,1]] ≠ [[1,1],[1,0]] | ✓ |
| §3.7 | GL₂, (1,0)+(1,0) | fibre over (1,1) is P¹, dim 1 = 〈ρ,(1,−1)〉 | ✓ |
| §3.8 | GL₂, (1,−1) with b = 1; (1,0) with b = 1 | 1; empty although the expression is 1/2 | ✓ |
| §3.9 | affine A₁, s₀s₁s₀ = t^{2α∨}s₁ | ℓ = 0+4−1 = 3; η = s₁; d = (3+1)/2 = 2 = dim | ✓ |
| §4.1 | GL₂, λ = (1,0) | basic: κ 1 = 1 and (1/2,1/2) ≤ (1,0); (2,−1) violates | ✓ |
| §4.4 / §4.7 | GL₂ t^(1,0); s t^(1,0); A₁ s | 1−0 = 1−0; 2−1 = 1−0; 1−1 = 0−0 | ✓ |
| §4.6 | GL₂ s t^(1,0) | ordinary (3/2−1/2) and basic ((2+1−1)/2) both give 1 | ✓ (scope R04) |
| §5.1 | A₁, y = s, λ = 2ω∨; unitary A₂ | 2ω∨ −_dom 2ω∨ = 0; λ^♭♭ = ω₁∨ and λ−λ^♭♭ = ω₂∨ ∉ Q∨ | R01 |
| §5.2 | A₁, x = y = s, λ = 2ω∨ | J′ = ∅; β = γ = 2ω∨; w₁ = s t^{ω∨} (alcove (1,2), ℓ 2); w₂ = t^{ω∨}s (ℓ 0); product t^{−2ω∨} | ✓ |
| §6.1 / §6.3 | u = v = s | ordinary fibre A¹ and Demazure fibre G_m (gh10 §2.4(2)); (1+1−0)/2 = 1 = 1+1−1 | ✓ |
| §7.1 | A₂, x = s₁, y = s₂, λ = 2ρ∨ | t^λs₂s₁ versus t^{−2α₂∨}s₂s₁ (s₁λ = 2α₂∨) | ✓ |
| §7.3 | A₁ t^{nα∨}; A₂ s₂s₁t^λs₁s₂ | b = 1 empty, b = t^λ dim 0; conjugator x = s₂s₁ works (x⁻¹μ dominant), s₁s₂ fails | ✓ |
| §7.4 | A₁ s with γ = 0; A₂ s₁s₂ | s is shrunken; s₁s₂ is not shrunken and nonempty | R02 |
| §7.5 | G_m, q = 2, ζ ∈ 𝔽₄ | (ζ,ζ) ↦ ζ²·ζ⁻² = 1; untwisted (ζ,1) ↦ ζ² ≠ 1 | ✓ |
| §8.1 / §8.2 / §8.4 | PGL₂, s t^{nα∨}, b = 1 | shrunken; λ^♭♭ = nα∨; d = n+1, so 2 at n = 1 (equal to §1.2's s₁s₀s₁) | ✓ |
| §8.3 | A₂, w₀, b = 1 | strict gap fails (λ = 0) yet nonempty, dim 3 = d | R07 |

**Library declarations opened at the pins.**
- Mathlib: `DoubleCoset.doubleCoset` (Mathlib/GroupTheory/DoubleCoset.lean:37), `DoubleCoset.mem_doubleCoset` (:44), `DoubleCoset.doubleCoset_eq_of_mem` (:51), `QuotientGroup.leftRel` (Mathlib/GroupTheory/Coset/Defs.lean:66), `QuotientGroup.leftRel_apply` (:71), `Finset` (Mathlib/Data/Finset/Defs.lean:75).
- Tau Ceti: `DoubleCoset.mul_mem_doubleCoset_iff` (TauCeti/GroupTheory/DoubleCoset/Basic.lean:100) and the Coxeter parabolic file (R09).
- All README backticked names exist with the stated meaning.
- Searches of both pins found no Iwahori subgroup, affine Grassmannian or flag variety, Kottwitz map, Deligne–Lusztig locus, affine Weyl group or Demazure product.

**Cross-roadmap citations resolved (about 45).**
- ReductiveGroupsPartII: RG2.0.4; RG2.1.4; RG2.3 `parahoric-subgroup`, `associated-parahorics`, `lang-theorem`, `lang-for-pro-algebraic-groups`; RG2.4 `iwahori-weyl-group`, `length-and-bruhat-order`, `affine-tits-system`, `iwahori-bruhat-decomposition`, `kottwitz-quotient`, `simple-cell-multiplication`, `dominant-coinvariant-cocharacters`, `translation-length-formula`, `dominant-normal-form`.
- BunGAndNewtonStrata: §§0.5, 0.6, 1.7, 1.8, 1.10, 1.11, 1.13, 1.15, 1.18, 1.21, 1.27, 1.30, 1.43 (ℚ_p scope, matching README §3.2), 1.45.
- GeometricSatakeAndFusion: the second GS0 heading, "Witt bounds…"; `perfect-model-and-etale-comparison`, `equal-characteristic-schubert-models`, `parahoric-ind-projectivity`, `flag-incidence-correspondences`, `flag-convolution-fibres`; GS1 `semi-infinite-affineness`; GS2 `convolution-diagram`, `rational-special-fibre-convolution`.
- SchemeAndStackFoundations §0.7 `fibre_dimension_formula`, §0.9, §§0.23–0.26 and Layer 1.
- TraceFormula Layer 11; SR.1.5; RootSystems Layers 3, 4 and 6; RootSystemsPartII RS2.1 `integral-order`; HeckeStacksAndLocalShtukas HS0–HS4, cited as context only.

The `citations.md` lead "RootSystemsPartII RS2.1 … found nowhere" is a false positive: the roadmap is a board design package and sits at line 26 of the merge order. One cross-supplier inconsistency, not this package's defect: GS0 `flag-incidence-correspondences` takes the Demazure product "from RG2.4", which RG2.4 does not state. Here it is `gap:twisted-redmin-demazure`.

**Dependency check (output).**

    depcheck: 34 roadmaps, 307 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. Every supplier comes earlier in the merge order (RG2 25, RS2 26, SR 27, GS 151, BunG 241; this roadmap 243), is on main (RootSystems, SchemeAndStackFoundations), or is another author's new-folder pull request (TraceFormula #196). The base roadmap HeckeStacksAndLocalShtukas (order 244) is never cited as a supplier.

**Ownership.**
- `roadmaps grep` over main and all 338 open heads, plus a grep of the board packages, searched for ADLV loci (g⁻¹bσ(g)), shrunken chambers, cordial elements, semi-modules, superbasic, class polynomials, virtual dimension, Demazure product and Red-Min.
- No other owner exists. The only hits are reference-list entries and DiamondsAndVStacksPartII's "Uses" mention of GLX.
- This roadmap is the owner of the ADLV-specific objects; see R05 for the RootSystemsPartII routing ledger.
- No `Suggested.lean` name collides with another roadmap's name, since none is declared.

**Supplier gaps.** All eight slugs are present in the README contracts (lines 109–191) and in `design/plan.json`, each with a named supplier; none is unowned. Precision issues are in R05.

**Lean.**
- `lake env lean packages/HeckeStacksAndLocalShtukasPartII/Suggested.lean`, run from the content checkout, exited 0 with no messages after 8 s. There is not even a `sorry` warning, because nothing is declared. No `TauCeti.*` import needed building.
- Form is correct: a single `import Mathlib`, one module docstring with the right title and wording, the right namespace, no `set_option`, no sorry'd data.
- The `#check @name` binder audit is empty: there are no declarations. Padding probe: none.
- All 13 headline groups listed in README lines 208–212 are named in the docstring with the missing carrier. None is statable at the pins: there is no reductive group over a local field, Iwahori subgroup, Iwahori–Weyl group, Kottwitz map or affine flag moduli. A GL_n-only encoding would be a stand-in. The empty file is correct.

**House style.** Every definition has an API list and at least three Checks (§0.1: 5, §0.4: 7, §5.1: 7, §7.5: 3, …). Every layer ends with Examples and Dependencies. There is no LaTeX, no `lemma`, and no pull-request number.

## Not verifiable

- he21 is an OCR text with garbled display lines (for example he21 lines 22, 66–68, 311–312, 340, 353, 481, 502–504). Theorem 6.1's hypotheses were read from line 481 together with Remark 6.2 (line 483) and §6.3 (line 512). The shrunken-chamber definition, lost after line 216, was read in he15 line 1464. The design's he21 issue about roots versus coroots in Proposition 5.1 and Corollary 5.3 could not be checked on the OCR text and is not endorsed here.
- Not opened (outside the sample; their locators were accepted as recorded): ham15, ckv15, vie14, and zhu17 Appendix A. No source was unreadable and no fetch was needed; `needs-references.toml` was not created.

## Source issues

- **Misprint** in he21 at §6.2, p. 13, and §6.5, p. 14: the source calls w a (J, σ⁻¹(y), σ)-alcove element; it should be (J, x, σ), the left normal-form factor (ghn15 Lemma 3.6.3). Split A₂ s₂s₁t^λs₁s₂ works with s₂s₁ and fails with s₁s₂; affects nothing.
- **Gap** in he21 at §6.3, p. 14: the source gets basic nonemptiness of a t^γ from He15 Theorem 2.27, which assumes shrunkenness; a t^γ need not be shrunken (γ = 0, a = s₁s₂ in split A₂); affects the proof.
- **Misprint** in zhu17 at §3.1.3, p. 458: the source sets τ_i = σ^i(τ₀); it should be τ_i = σ^{−i}(τ₀), to match its own maps H⊗_{τ_i}L ≃ H⊗_{τ₀}L and Nm b = b_{τ₀}σ(b_{τ₁})⋯; affects nothing.
- **Misprint** in zhu17 at (3.1.3), p. 455, and Theorem 3.1, p. 456: the source states the dimension formula without requiring a nonempty locus; it should require nonemptiness (GL₂, b = 1, μ = (1,0) is empty but the formula gives 1/2); affects nothing.
- **Gap** in zhu17 at the proof of Proposition 3.3, pp. 459–460: the source applies the fibre bound over ϖ^λ to the preimage of the closed union X_{≤λ}; it should bound each exact stratum X_{λ′} separately, since smaller strata have larger fibres; affects the proof.
- **Error** in ghn15 at Proposition 2.2.1, arXiv PDF p. 6: the source asserts that π₀(Flag) → π₀(Flag_ad) is injective and that Flag → Flag_ad is an immersion; it should give only componentwise isomorphisms, the kernel being the torsion of X_*(T)_Γ; affects a stated result; corrected in print at ghnerr Proposition 0.0.1.
- **Error** in ghn15 at Proposition 3.5.1, arXiv PDF p. 13: the source says [b] ∩ M_J(L) has at most one M_J-class for every [b]; it should be for basic [b] only (GL₂ torus counterexample); affects a stated result; corrected in print at ghnerr Proposition 0.0.2.
- **Misprint** in he14 at Proposition 11.6, p. 399: the source's support condition is written for an undefined v; it should be for x; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cf9d6fb", "job": "REV-PKG-HeckeStacksAndLocalShtukasPartII", "model": "opus", "worker": "fable-rev59"} -->
