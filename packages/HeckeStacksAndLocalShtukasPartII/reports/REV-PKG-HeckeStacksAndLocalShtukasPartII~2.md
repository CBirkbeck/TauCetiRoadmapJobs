<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1138#issuecomment-6394543798 -->
Review (claude) of 08e5f4f

Verdict: needs changes

1. **F01** (P2) three cited "continuation" roadmaps exist nowhere

   **Location.** `packages/HeckeStacksAndLocalShtukasPartII/README.md`, lines 16, 28–37 and 1704–1710. Lines 28–30 read: "HeckeStacksAndLocalShtukasComponentsPartII owns rational strata, centralizer actions on component sets, parahoric and very-special reductions, Hodge–Newton irreducible component theorems and comparison with integral specialization." Line 1705 adds, of the component continuation: "Its notation dictionary distinguishes exact strata from closed unions."

   **Claim.** The README says three roadmaps own the excluded topics and consume §§0.1, 0.4–0.6 and 3.8. They are HeckeStacksAndLocalShtukasComponentsPartII, HeckeStacksAndLocalShtukasIntegralPartII and HeckeStacksAndLocalShtukasKottwitzPartII.

   **Witness.** None of the three names occurs anywhere I checked:
   - `roadmaps list` and `roadmaps grep` over main `bfaaff1` and the 353 open heads;
   - the board's `origin/main` package tree;
   - the board-packages index;
   - the merge order.

   **Note.** This is the F10 pattern again. F10's instance in §0.4 was rewritten, but the same assertion about the component continuation's notation survives at line 1705.

   **Repair.**
   - Delete the three names, line 16's "belongs to the integral continuation", and the claims about each continuation in Downstream consumers.
   - In Scope, state the excluded topics as a plain boundary, for example: "not treated here: connected and irreducible components of these loci, integral parahoric shtuka models and local-model comparisons, fixed-point and Kottwitz-character applications". Name an owner only where one exists on main, in an open roadmap pull request or as a board package.
   - In Downstream consumers, describe the use without naming nonexistent roadmaps. For example: "component and integral-model constructions use §§0.1, 0.4–0.6 and 3.8".

   **Test.** After the edit, a grep of the README for `ComponentsPartII|IntegralPartII|KottwitzPartII|continuation` returns nothing, and every excluded topic is still named in Scope.

2. **F02** (P2) gap:newton-cell-adlv-dimension asks an earlier roadmap for a theorem about this roadmap's own object

   **Location.**
   - README line 170: "What BunGAndNewtonStrata must provide (gap:newton-cell-adlv-dimension): For every nonempty Newton stratum N_[b],w in an equal-characteristic Iwahori cell, dim X_w(b)=ℓw−〈2ρ,ν_b〉−codim(N_[b],w,IẇI)…"
   - The same gap is used in §4.3 Needs (line 1076) and in the §4.6 route and Needs (lines 1131, 1140).
   - It is also the `design/plan.json` entry under the same slug.

   **Claim.** BunGAndNewtonStrata supplies the dimension formula and the equidimensionality criterion for the affine Deligne–Lusztig variety X_w(b).

   **Witness.** X_w(b) is constructed in this roadmap (§§0.1 and 0.5, line 376). BunGAndNewtonStrata (merge-order line 241, head `0d1e747`) has no affine Deligne–Lusztig, affine-flag or Iwahori-cell object. In mv20 the comparison is built from X_x(b) itself (mv20 line 358–362, Theorem 3.10).

   **Why blocking.** The assigned supplier, which comes earlier in the merge order, cannot state this contract. To state it there would need either a second construction of X_w(b), giving two owners, or a supply edge from this roadmap back to BunGAndNewtonStrata, giving a cycle. The result is this roadmap's own target.

   **Repair.**
   - Delete `gap:newton-cell-adlv-dimension` from the BunGAndNewtonStrata contract (line 170) and from the `gaps` list of `design/plan.json`.
   - Add a Layer 4 target here, for example at the start of §4.3. In equal characteristic it states: for every nonempty N_[b],w, dim X_w(b)=ℓw−〈2ρ,ν_b〉−codim(N_[b],w), using minimal component codimension, and X_w(b) is equidimensional iff N_[b],w is (mv20, Theorem 3.10 and Corollaries 3.11–3.12, arXiv v3, PDF pp. 7–8). It also states the numerical form in either characteristic (he15, Theorem 2.23, PDF p. 34).
   - Its Needs: §0.5; GeometricSatakeAndFusion GS0, parahoric-ind-projectivity; SchemeAndStackFoundations §0.7. From BunGAndNewtonStrata it needs only the Newton stratification of bounded admissible Iwahori-cell models and their completions. Fold that into gap:newton-cell-greatest, or declare it as a new BunGAndNewtonStrata gap that states exactly that.
   - Repoint §4.3 and §4.6 to the new target.

   **Test.** For GL₂, w=s t^(1,0): the new target gives basic codimension 2−0−1=1 and ordinary codimension 2−1−1=0. These agree with the §4.6 Check, and both sides are formed after §0.5 has constructed X_w(b).

3. **F03** (P2) the last clause of gap:twisted-affine-cocenter is vague and duplicates §7.4's own proof obligation

   **Location.**
   - README line 208: "…their degree recursion, and the nonzero twisted-Coxeter coefficient with σ-saturated support."
   - §7.4, lines 1522–1529, including: "The proof constructs the twisted induction with σ-saturated support and the shifted reflection index throughout."
   - §7.4 Needs, lines 1537–1538.

   **Claim.** SmoothRepresentationsOfLocalGroups supplies "the nonzero twisted-Coxeter coefficient", while §7.4 proves the same twisted induction (he14 Proposition 11.6 at J=S) here.

   **Witness.**
   - The clause names no element, class or hypothesis. Proposition 11.6 needs x∈W_J with σ-support J, y a twisted Coxeter element of W_(S−J), μ≠0 and t^μy∈^SW̃ (he14 line 1244–1248).
   - Its induction multiplies by Demazure products x₁*δ(u) (he14 line 1258–1262; Lemma 11.2, line 1184–1186).

   **Repair.** Give the result one owner, in one of two ways:
   - (a) Delete the final clause from the gap (README line 208 and `plan.json`). §7.4 then owns the corrected Proposition 11.6 at J=S.
   - (b) Restate the clause with Proposition 11.6's hypotheses at J=S, and delete the two "constructs the twisted induction" sentences from §7.4.

   In either case, add `gap:demazure-product` to §7.4's Needs.

   **Test.** In affine A₁ take a=s and γ=α∨, so w has length 3. The normalized relation T_w≡zT_(s₁s₀)+T_(s₁) gives the nonzero coefficient 1 at the minimal Coxeter class. After the repair this statement has exactly one owner.

4. **F04** (P3) gap:parabolic-root-length does not cite the pinned inversion-set API it builds on

   **Location.** README lines 142–144: "…if wα is negative for every positive α with y⁻¹α negative, then ℓ(wy)=ℓw−ℓy (gh10, Lemma 2.6.1, PDF p. 10)."

   **Witness.** Tau Ceti at the pin has:
   - `TauCeti.inversions` (TauCeti/LinearAlgebra/RootSystem/Inversions/Basic.lean:50);
   - `TauCeti.isLeast_ncard_inversions`, length equals the inversion count (Inversions/Length.lean:148);
   - `TauCeti.ncard_inversions_mul_le` (Inversions/Length.lean:172).

   The cancellation lemma itself is not pinned.

   **Repair.**
   - Add these three declarations to "From Tau Ceti".
   - State in the paragraph at line 144 that the gap is asked for the pinned `RootPairing.weylGroup`, with ℓ given by the inversion count.
   - Keep the gap.

   **Test.** In A₂ with w=w₀ and y=s₁s₂, the inversion set of y⁻¹=s₂s₁ is {α₁, α₁+α₂}. It lies inside the inversion set of w₀, and ℓ(w₀s₁s₂)=1=3−2.

5. **F05** (P3) the §8.3 route relies on an "irreducible root system" that an F-simple group need not have

   **Location.** README line 1661: "If λ≠0, a nonzero dominant coweight in the irreducible root system has positive coefficients on every simple coroot".

   **Witness.** Take G=Res_(E/F)PGL₂ with E/F unramified quadratic. It is F-simple, and over L its root system is A₁×A₁ with σ swapping the factors. λ=(α∨,0) is nonzero and dominant but has coefficient 0 on the second simple coroot. Its average λ^♦=(α∨/2,α∨/2) is positive on both, so the conclusion still holds.

   **Repair.** Replace the sentence with: "If λ≠0 then λ^♦ is a nonzero σ-invariant dominant coweight; since G is F-simple, σ permutes the irreducible components transitively, so λ^♦ has positive coefficients on every simple coroot."

   **Test.** For the witness above, λ^♦−ν_b=(α∨/2,α∨/2) gives the strict gap.

6. **F06** (P3) style

   **Location and repair.**
   - `packages/HeckeStacksAndLocalShtukasPartII/Suggested.lean` line 39 has 112 characters. It was introduced by the round-1 repair. Wrap it below 100 characters.
   - README line 921 cites "GS2:correspondences/rational-special-fibre-convolution". Write "GeometricSatakeAndFusion GS2, rational-special-fibre-convolution", the form used everywhere else.
   - README line 148 repeats the hn14 locators already given at line 130. Delete line 148.

   **Test.** `awk 'length>100'` on the Lean file returns nothing, and a grep for `GS2:` in the README returns nothing.

Six findings: three blocking (P2) and three P3. Ten of the eleven round-1 findings are repaired. F10 is only partly repaired: the same kind of claim is still made at another location (see R01). Pins used: content main `bfaaff1`, Mathlib `6b7abb3`, Tau Ceti `a91d3aa` (from `lake-manifest.json`). Open heads used: ReductiveGroupsPartII and SmoothRepresentationsOfLocalGroups at `1383569`, BunGAndNewtonStrata at `0d1e747`, GeometricSatakeAndFusion at `0652974`, HeckeStacksAndLocalShtukas at `48d21c7`, TraceFormula at `4bd7237`. RootSystemsPartII is read as the design package on the board's main branch.

## Verified sound

### Repair check of round 1 (by finding)

| Round-1 id | Repaired passage (quoted) | Status |
|---|---|---|
| F01 | §5.1, line 1190: "Prove it is dominant, λ_w^♭♭≥_ℤλ−ρ_J∨−η_J∨, and its image in the σ-coinvariants of P∨/Q∨ equals that of λ. If ρ_J∨+η_J∨∈Q∨, also prove λ_w^♭♭≤_ℤλ". Also API line 1207 and Checks 1219–1220 | repaired |
| F02 | §7.4, line 1533: "Its alcove has α-values (0,1), so it is shrunken." Also the A₂ s₁s₂ Check at line 1534 | repaired |
| F03 | §1.3, line 515: "Use the normalized basis T_w=v^(−ℓw)U_w with q=v², so T_s²=(v−v⁻¹)T_s+1". Also the SR contract (line 206), the gap (line 208) and the Check (line 530) | repaired |
| F04 | §4.6, line 1129: "For every supported local field, if w is cordial … In equal characteristic, also prove that every such ADLV is equidimensional and … the closure of N_[b],w…" | repaired |
| F05 | Gaps split into demazure-product, twisted-redmin, straight-finite-parabolic, finite-coxeter-basic-class, parabolic-root-length, newton-poset-length, newton-cell-strong-purity, newton-cell-greatest and newton-cell-adlv-dimension. GS0 is cited for the flag geometry (line 185); unipotent-linearization is precise (line 118); local ownership is recorded (line 22) | repaired; the split created R02 |
| F06 | Gap slugs added to the Needs of §1.3 (line 533), §7.4 (line 1538), §3.3 (line 821, "gap:superbasic-classification") and §7.3 (line 1507, "BunGAndNewtonStrata §1.45") | repaired |
| F07 | §8.3, line 1659: "No strict λ-gap is required." Also the A₂ w₀ Check at line 1666 | repaired |
| F08 | Line 110: "Transport the translation parameter by λ↦−λ and the positive-root choice by Φ⁺↦−Φ⁺". Checks at lines 114–116 | repaired |
| F09 | Lines 84–101 and the Needs of §0.1 (line 261) and §5.2 (line 1261) | repaired |
| F10 | No "Source extraction" pointer remains (grep). HSD6 became §6.3 (line 391). The garbled sentence and the §0.4 instruction are rewritten (lines 345, 391). The API list is joined | partly repaired: line 1705 (R01) |
| F11 | Line 495, "PDF pp. 6–10"; line 1066, "mv20, Lemma 3.2, arXiv v3, PDF p. 5" | repaired |

### Seeded source sample (15 targets, all read at the locator)

| Target | Checked against | Result |
|---|---|---|
| 0.2 | he21 line 199–208 (§2.2, p. 5): normal form, (2.1), η_σ=σ⁻¹(y)x, F-rank defect, d_w | ✓ |
| 0.3 | he21 line 217 (p. 5); he15 line 1464 (§2.9.4, PDF p. 36); he21 Theorem 6.1, line 480 (p. 13), and Corollary 6.4, line 535 (p. 14) | ✓ |
| 0.6 | he14 line 213–215 (p. 372, J_b action); proof of Theorem 4.8, line 618–620 (pp. 382–383, framing transport); he21 line 501 (p. 13, κ obstruction) | ✓ |
| 1.1 | he21 Theorem 3.2, line 231 (p. 6); he14 Theorem 4.8, line 610 (p. 382) | ✓ |
| 1.2 | gh10 Proposition 2.5.2, line 224 (PDF p. 6), and Corollary 2.5.3, line 300 (p. 9, proof to p. 10); he21 Proposition 3.3, line 236 (p. 6) | ✓ |
| 1.3 | he14 line 315 (quadratic relation (T_s−v)(T_s+v⁻¹)=0) and line 336 (ℤ[v−v⁻¹], nonnegative); Theorem 6.1, line 777 (p. 387); Corollary 6.2, line 829 (p. 388); mv20 Remark 1.3, line 150–162; he15 Theorem 2.23, line 1373 | ✓ |
| 2.3 | vie06 line 69–99 (§2, PDF pp. 2–3: b(e_i)=e_(i+m), central shift, π shift); line 200–222 (§4, PDF p. 5: A(M), φ(M), vol 0 ⇒ normalized, finite paving); zhu17 line 2296–2297 (p. 460) | ✓ |
| 3.4 | ham15 Definition 2.7, Lemma 2.8 and Proposition 2.9, lines 178–206 (PDF p. 5); ghkr06 Proposition 5.6.1, line 1360 (p. 29), and Theorem 5.8.1, line 1446 (p. 31) | ✓ |
| 3.8 | zhu17 Theorem 0.5, line 297 (p. 410); (3.1.3), line 2123; Theorem 3.1, line 2137 (p. 456); proof of Proposition 3.3 to line 2297 (p. 460); ham15 Theorem 1.1, line 48 (PDF p. 2, assumes nonemptiness) | ✓; see Source issues |
| 4.1 | he21 Theorem 4.4, line 283 (p. 7); he14 Theorem 7.1, line 877 (p. 389) | ✓ |
| 4.3 | he21 line 262–264 (§4.1, p. 7); he15 line 1373–1375 (PDF p. 34); mv20 Lemma 3.2, line 266–267 (PDF p. 5) | ✓ |
| 4.7 | he21 Theorem 4.2, line 273, proof line 286–293 (p. 7); §4.4, line 296–302 (p. 8) | ✓ |
| 6.3 | he21 line 425–473 (pp. 10–12): N₁ (line 429–430), statement (a) (line 433), N₂ (line 459), final identity (line 463–473) | ✓ |
| 6.4 | he21 Theorem 5.5, line 352–355 (p. 9), proved in §5.4 | ✓; the added κ equality follows from w⇒_σ a t^γ |
| 8.4 | he21 line 529–533 and Corollary 6.4, line 535–537 (p. 14) | ✓; the README's averaged hypothesis is weaker, and the proof uses only it |

There are no author-flagged unverified locators. The new manifest entry ham17 was checked at Definition 2.1(3) (ham17 line 182–184, PDF p. 4). The gap contracts were also read at their sources:
- gh10 Lemma 2.5.1 (line 219) and Lemma 2.6.1 (line 414);
- he14 Theorems 2.1 and 2.3 (lines 304, 369) and Propositions 11.6–11.7 (lines 1244, 1289);
- he21 Proposition 5.1 and Corollaries 5.3–5.4 (lines 307, 325, 333);
- mv20 Definition 3.1, Corollary 3.12 and the proof of Theorem 3.16 (lines 247, 378, 426–448);
- ghkr06 (5.3.4) (line 924, PDF p. 21, built over ℤ in every characteristic);
- ckv15 Lemma 3.1.1 (line 931);
- vie14 setting (line 21–31, both characteristics).

### Adversarial table (values computed)

| Statement | Instances | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: normal form, η, d | split adjoint A₁, s t^(nα∨), n=1,2 | alcove (−1,0)→(2n,2n+1); ℓ=2n+1 (walls α=0,…,2n); η=s; d=(2n+2)/2: 2 and 3 | ✓ | none |
| Conventions: defect | GL₂, μ=(1,0), ν=(1/2,1/2) | ⟨ρ,μ−ν⟩=1/2; defect 2−1=1; value 0 | ✓ | none |
| Conventions: volume | h=2, A=ℕ versus 1+ℕ | vol 0 and \|{0}\|−0=1; π has matrix [[0,t],[1,0]] with det valuation 1 | ✓ | none |
| Conventions: Frobenius | H²_c(A¹) | geometric q, arithmetic q⁻¹, H¹_c=0 | ✓ | none |
| RG2.4 transport | diag(ϖ,1) and its inverse | RG2.4 representative λ(ϖ)⁻¹, so diag(ϖ,1) is RG2.4's t^(−1,0); κ=−(−1,0)→+1, ν=(1,0); inverse κ=−1, ν=(0,−1) | ✓ | none |
| RG2.4 transport, second term | diag(ϖ²,1) | κ=2, ν=(2,0); inverse κ=−2 | ✓ | none |
| §0.1 | S₃, I=1, b=(12), g=(123); commutative H; I=H; I=1, b=1 | g⁻¹bg=(13) (1→3, 3→1); r_b(g)=b; IwI=H; r_1=1, so the locus is H iff w=1 | ✓ | none |
| §0.2 | A₁ s, b=1; GL₂ t^(1,0); GL₂ s t^(1,0) basic; unitary A₂ x=s₁, y=s₂ | (1+1)/2=1; (1+0)/2−1/2=0; (2+1−1)/2=1; η=s₁s₁=1 versus yx=s₂s₁ of length 2, which shifts d by 1 | ✓ | none |
| §0.3 | A₁ base and reflected alcoves; A₂ λ=6ω₁∨ | (−1,0) rejected, (0,1) accepted; 6ω₁∨=4α₁∨+2α₂∨, and subtracting 2ρ∨=2α₁∨+2α₂∨ leaves 2α₁∨; ⟨α₂,λ⟩=0, so the alcove stays in the α₂-strip | ✓ | none |
| §0.4 | G_m with b=ϖ, μ=0; GL₂ with b=1, μ=(1,−1); k[ε]/ε² | valuation 1≠0, so empty; identity at 0≤_ℤμ (difference α∨) but ≠μ; ε≠0 with ε^p=0, so not perfect | ✓ | none |
| §0.6 | S₃, b=(12), h=(123) | hbh⁻¹=(23); with h⁻¹ one gets h⁻¹bh=(13); (hg)⁻¹b′(hg)=g⁻¹bg | ✓ | none |
| §1.1 | GL₂ t^(1,0); A₁ s; κ mismatch | 1−1=0; 1−0=1; −∞ | ✓ | none |
| §1.2 | s₀s₁s₀ with b=1 and b=t^(α∨) | s₀ws₀=s₁ (ℓ 3−2); s₀w=s₁s₀ straight; 1+max(−∞,1)=2; 1+max(0,−∞)=1 | ✓ | none |
| §1.3, normalized | s₀s₁s₀ | v⁻²((q−1)U_s+q)=zT_s+1; T_s₀T_s₁T_s₀≡T_s₁T_s₀²=zT_(s₁s₀)+T_s₁; basic (3+1+0)/2=2; nonbasic (3+2+1)/2−2=1 (equal to the §1.2 value) | ✓ | none |
| §1.3, wrong normalization | U-basis coefficient q | (3+1+2)/2=3 and 5/2, versus the true value 2 | control holds | none |
| §1.4 / §4.5 | D_w=3, D_v=2, d_w=4, d_v=3 | −1=−1; reflexivity 0≥0 | ✓ | none |
| §2.1–2.2 | h=2, m=1, A=ℕ; evens; ∅ | B={0,1}, ΣB=1; type (0,1); φ=⌊(a+1)/2⌋ attains max{n: a+1−2n∈ℕ}; V=∅ (φ monotone); evens fail +1; ∅ has no basis | ✓ | none |
| §2.3 | standard lattice; ϖb | ϖ^(−n)bσ(e_a)=e_(a+1−2n), so n≤(a+1)/2; ϖb adds 1 to φ | ✓ | none |
| §2.5 | (2,1,(0,1)), (2,1,(−1,2)), (3,4,(0,0,4)) | 1/2−1/2=0; 3/2−1/2=1; ρ=(−1,0,1), 4−1=3 | ✓ | none |
| §3.1 | GL₂ ν_M=(2,0), (0,2); GL₃ unipotent | min(2,0)=0 and min(−2,0)=−2, equal to ⟨ρ,ν−ν_dom⟩=0 and −2; [1+E₁₂,1+E₂₃]=1+E₁₃ (also in characteristic 2); quotients G_a², G_a | ✓ | none |
| §3.2 | GL₂→PGL₂ | ℤ→ℤ/2 sends 0 and 2 to 0 | ✓ | none |
| §3.3 | GL₂ with m=1, 2; ordinary versus basic | gcd(1,2)=1, defect 1; m=2 gives b=ϖ·1 in the torus Levi; J_b/Z of rank 1 versus 0 | ✓ | none |
| §3.4 | GL₂, M=T, (b,μ,μ_M)=(1,(1,−1),0) and (t^(1,0),(1,0),(1,0)) | d=1, total 0+1=1=⟨ρ,μ⟩; d=⟨ρ,(2,0)⟩=1, correction 1−⟨(1,−1),(1,0)⟩=0, total 0 | ✓ | none |
| §3.6 | U, V over ℤ and 𝔽₂ | UV=[[2,1],[1,1]] versus VU=[[1,1],[1,2]]; mod 2: [[0,1],[1,1]] versus [[1,1],[1,0]] | ✓ | none |
| §3.7 | GL₂, (1,0)+(1,0) | endpoint (2,0): a point; endpoint (1,1): P¹ of dimension 1=⟨ρ,(1,−1)⟩ | ✓ | none |
| §3.8 | GL₂ μ=(1,0) basic; μ=(1,−1), b=1; b=1, μ=(1,0) | 0; 1; empty (κ 0≠1) although the expression is 1/2 | ✓ | none |
| §3.9 | GL₂ t^(1,0); A₁ s | 0=(1+0)/2−1/2, with a plus sign 1; 1 | ✓ | none |
| §4.1 | GL₂, λ=(1,0) | ν=(1/2,1/2): λ−ν=α∨/2≥0 and κ 1=1; ν=(2,−1): λ−ν=−α∨ | ✓ | none |
| §4.2–4.3 | τ; t^(1,0); A₁ s | generic [τ] and [t^λ]; 1−1=0; 1−0=1 | ✓ | none |
| §4.4 | 1; GL₂ t^(1,0); A₁ s | 0=0; 1−0=1−0; 1−1=0−0 | ✓ | none |
| §4.6 | GL₂ s t^(1,0) | ordinary (2+1)/2−1/2=1; basic (2+1−1)/2=1; chain (1+1−0)/2=1; codimension 0 and 1 | ✓ | none |
| §4.7 | GL₂ x=s, λ=(1,0); A₁ x=s, λ=0 | 2−1=1−0; 1−1=0−0 | ✓ | none |
| §5.1, split | A₁ y=s, λ=2ω∨ and ω∨ | 2ω∨−_dom2ω∨=0; 0−_domω∨=ω∨ (odd coset) | ✓ | none |
| §5.1, unitary | λ=ρ∨, y=s₁ | ρ_J∨=ω₁∨, η_J∨=dom(−ω₂∨)=ω₁∨; ω₂∨−_domω₁∨=ω₁∨ (2ω₁∨−ω₂∨=α₁∨); λ−λ^♭♭=ω₂∨∉Q∨; lower difference α₁∨; (ℤ/3)_σ=0 | ✓ | none |
| §5.1, minuscule unitary | λ=ω₁∨, y=s₁ | λ^♭♭=ω₂∨; λ−λ^♭♭=(α₁∨−α₂∨)/3; lower difference α₁∨+α₂∨ | ✓ | none |
| §5.2, split | A₁ x=y=s, λ=2ω∨ | η=1; β=γ=2ω∨; ℓ(s t^ω∨)=2, ℓ(t^ω∨s)=0; product t^(−2ω∨) of length 2 | ✓ | none |
| §5.2, unitary | x=y=s₁, λ=ρ∨ | J′={s₁}, x′=s₂, z=s₁; β=ω₂∨+s₂ω₂∨=ω₁∨; w₁=t^ω₂∨, w₂=t^(s₁ω₁∨); product t^α₂∨=t^(s₁ρ∨); lengths 2+2=4; a=s₂*s₂=s₂ | ✓ | none |
| §6.1 | u=v=s; twisted A₂ | A¹ (1=(1+1−0)/2) and G_m (1=1+1−1); vσ(u)=s₂s₂=1 versus vu=s₂s₁ | ✓ | none |
| §6.3 | split and unitary data | split N₁=N₂=0; unitary ℓB=0+2−1=1, N₁=(1+2−3)/2=0, N₂=1+1−1=1, d_w−d_(at^γ)=(6−4)/2=1 | ✓ | none |
| §7.1 | A₂ x=s₁, y=s₂, λ=2ρ∨ | t^λs₂s₁ versus t^(s₂s₁λ)s₂s₁=t^(−2α₂∨)s₂s₁ | ✓ | none |
| §7.2 / §7.5 | GL₂ torus; G_m, q=2, ζ∈𝔽₄ | κ_T (1,0), (0,1) over κ_G=1; (ζ,ζ)∼(1,1) with image ζ²ζ⁻²=1; untwisted (ζ,1) has image ζ²≠1 | ✓ | none |
| §7.3 | A₁ t^(nα∨) with b=1 and b=t^(nα∨) | gap nα∨ with η=1: empty; gap 0: dimension 2n−2n=0 | ✓ | none |
| §7.4 | A₁ s with γ=0; A₂ s₁s₂ | alcove (0,1), shrunken; s₂s₁α₂=α₁, so α₂-values in (−1,0): not shrunken; d=(2+2)/2=2 | ✓ | none |
| §7.6 / §8.1 | GL₂ a=s, γ=(1,0); PGL₂ s t^(nα∨) versus t^(nα∨) | basic ≤ ordinary, both of dimension 1; supports {s} and ∅: nonempty versus empty | ✓ | none |
| §8.2 | PGL₂ n=1, 2; unitary A₂ | 2, 3; ⟨ρ∨,2ρ⟩=4, so ℓw=4; ℓη=2; (ω₁∨)^♦=ρ∨/2≥0; d=3 | ✓ | none |
| §8.3 | A₂ w₀; λ=0 with w≠w₀; Res_(E/F)PGL₂ | (3+3)/2=3 with values in (0,1); some α>0 with w⁻¹α>0 leaves a value in (−1,0); λ=(α∨,0), λ^♦=(α∨/2,α∨/2) | ✓ | R05 wording |
| §8.4 | A₁ λ=α∨; unitary J={s₁} | 2ρ∨=α∨ meets the bound with dimension 2; 2ρ∨−ρ_J∨−η_J∨=2ω₂∨ is dominant | ✓ | none |
| gap:demazure-product | A₁ s*s; adjoint A₁ τ*s₁ | ℓ=1=1+0; τ*s₁=s₀τ has support {s₀} (transported) | ✓ | none |
| gap:twisted-redmin / straight-finite-parabolic | s₀s₁s₀; adjoint s₀ versus s₁ | 3→1 by s₀-conjugation; s₁=τs₀τ⁻¹ with ℓ(τs₀)=0+1 | ✓ | none |
| gap:finite-coxeter-basic-class | adjoint A₁, τ=1, w=s₁, μ=0 and α∨ | minima s₁ and t^(α∨)s₁=s₀, not linked by simple conjugations | ✓ (dependence on μ needed) | Source issue |
| gap:parabolic-root-length | A₂ w=w₀, y=s₁s₂ | N(s₂s₁)={α₁,α₁+α₂}⊂N(w₀); 1=3−2 | ✓ | R04 |
| gap:dominant-subtraction | A₁ | (2ω∨−_domω∨)−_domω∨=0=2ω∨−_dom2ω∨ | ✓ | none |
| gap:newton-poset-length | GL₂ basic ≤ ordinary | (1+1−0)/2=1 | ✓ | none |
| gap:newton-cell-adlv-dimension | GL₂ s t^(1,0) basic | 1=2−0−1; statement mentions X_w(b) from §0.5 | supplier cannot state it | R02 |
| gap:levi-intersection-dimension | GL₂ M=T, μ=(1,−1), μ_M=0; M=G | 1=⟨ρ,μ⟩ (ham15 Lemma 2.8, line 186–188); 0=⟨ρ,2μ⟩−⟨2ρ,μ⟩ | ✓ | none |
| gap:unipotent-linearization | GL₃ Borel, p=2, 3 | quotients G_a², G_a; ghkr06 (5.3.4) built over ℤ | ✓ | none |
| gap:twisted-affine-cocenter | final clause | no hypotheses; §7.4 also proves it | two owners | R03 |

### Library declarations opened at the pins

- Mathlib/GroupTheory/DoubleCoset.lean:37 `DoubleCoset.doubleCoset` (s * {a} * t), :44 `DoubleCoset.mem_doubleCoset`, :51 `DoubleCoset.doubleCoset_eq_of_mem` (stated for subgroups H, K).
- Mathlib/GroupTheory/Coset/Defs.lean:66 `QuotientGroup.leftRel`, :71 `QuotientGroup.leftRel_apply` (x⁻¹y∈s).
- TauCeti/GroupTheory/DoubleCoset/Basic.lean:100 `DoubleCoset.mul_mem_doubleCoset_iff` (b∈H).
- TauCeti/GroupTheory/Coxeter/Parabolic.lean:
  - :101 `CoxeterSystem.parabolic`;
  - :233 `CoxeterSystem.IsMinimalCosetRep` (ℓu≤ℓ(uv) for all v in the parabolic, as the README says);
  - :280 `CoxeterSystem.length_mul_of_isMinimalCosetRep`;
  - :330 `CoxeterSystem.existsUnique_isMinimalCosetRep_mul`.
- TauCeti/LinearAlgebra/RootSystem/Inversions/Basic.lean:50 and Inversions/Length.lean:148, :172 (R04).
- Neither pin contains a Demazure product, Iwahori subgroup, affine flag variety, Kottwitz map or affine Deligne–Lusztig locus (grep).

### Cross-roadmap citations resolved

- **ReductiveGroupsPartII** (head `1383569`):
  - RG2.0.4;
  - RG2.1 with apartments (RG2.1.4);
  - RG2.3: parahoric-subgroup, associated-parahorics, lang-theorem, lang-for-pro-algebraic-groups;
  - RG2.4: iwahori-weyl-group, affine-tits-system, length-and-bruhat-order, kottwitz-quotient, iwahori-bruhat-decomposition, simple-cell-multiplication, translation-length-formula, dominant-normal-form, dominant-coinvariant-cocharacters (t^λ=λ(ϖ)⁻¹ and κ(t^λ)=−λ, as the transport says).
  - No Demazure product and no unipotent height filtration.
- **SmoothRepresentationsOfLocalGroups** SR.1.5 iwahori-matsumoto: (T_s−q)(T_s+1)=0, and the generic algebra over ℤ[v,v⁻¹] with q=v². No twisted cocenter.
- **BunGAndNewtonStrata** (head `0d1e747`): §§0.5, 0.6, 1.7, 1.8, 1.10, 1.11, 1.13, 1.14, 1.15, 1.18, 1.21, 1.27, 1.30, 1.43, 1.45 are all present under the cited names. It has no chain-length, superbasic, Iwahori-cell or ADLV statement, so those gaps ask for nothing already provided.
- **GeometricSatakeAndFusion** (head `0652974`):
  - the GS0 heading "Witt bounds, determinant lines and projective models";
  - GS0 targets perfect-model-and-etale-comparison, equal-characteristic-schubert-models, parahoric-ind-projectivity, flag-incidence-correspondences, flag-convolution-fibres;
  - GS1 semi-infinite-affineness (Borel case ⟨ρ,μ+λ⟩ only, so the general-Levi gap is not supplied there);
  - GS2 convolution-diagram and rational-special-fibre-convolution.
- **TraceFormula** (head `4bd7237`): Layer 11 and its geometric Frobenius convention.
- **On main:** RootSystems Layers 3, 4 and 6; SchemeAndStackFoundations §§0.7 (`fibre_dimension_formula`), 0.9, 0.23–0.26 and Layer 1.
- **RootSystemsPartII:** a design package on the board's `origin/main` (merge-order line 26). RS2.1 `integral-order` is present. The `citations.md` lead is therefore a false positive.
- **HeckeStacksAndLocalShtukas** (head `48d21c7`, merge order 244): read for context only, never a supplier. It plans no affine Deligne–Lusztig loci, so nothing is planned twice.
- Two cross-supplier observations that are not this package's defects:
  - GS0 flag-incidence-correspondences takes the Demazure product "from RG2.4", which RG2.4 does not state. Here it is gap:demazure-product.
  - The RootSystemsPartII design routes the affine items (He21 /9–/81) to an unadopted proposal. The six RootSystemsPartII gaps therefore need RS2's acceptance or a maintainer reassignment. The repair report records this as a maintainer decision, and it is not raised here.

### Dependency check

    depcheck: 49 roadmaps, 558 edges, 0 problem(s)

There is no UPWARD, CYCLE or `moved:` line. The cycle in R02 is invisible to the tool because it sits inside a declared gap. The gap audit found all 14 slugs identical in README and `design/plan.json` (texts compared with whitespace normalized), each with a named supplier, and every `gap:` reference declared.

### Ownership and duplication

- `roadmaps grep` over main and the 353 open heads, and a grep of the board packages, were run by object: affine Deligne–Lusztig loci, g⁻¹bσ(g), cordial, shrunken, semi-module, class polynomial, virtual dimension, Demazure product and superbasic.
- Only references, and different objects, turned up: CM class polynomials; isocrystal change of trivialization in EndoscopicTransferAndUnitaryTraceComparison; GLX in a "Uses" line of DiamondsAndVStacksPartII; a Demazure-product mention in the SchubertGeometry revision, a roadmap that is not new and whose main copy has none.
- So this roadmap owns the ADLV objects. No Suggested.lean name can collide, since none is declared.

### Lean

- `lake env lean packages/HeckeStacksAndLocalShtukasPartII/Suggested.lean`, run from the content checkout, exited 0 with no messages in 3.4 s. No `TauCeti.*` import is used.
- The binder audit is vacuous: there are zero declarations, so the `#check @name` list is empty and nothing changed.
- The padding probe has nothing to probe.
- Form is correct: one `import Mathlib`, one module docstring with the right title and wording, the right namespace, no `set_option`, no sorry'd data.
- All 13 headline groups in README lines 223–227 are named in the docstring with the missing carrier. I agree that none is statable at the pins: there are no ADLV loci, Iwahori–Weyl or Kottwitz interface, or Newton-stratified cells. The combinatorial semi-module bound is an input lemma, so stating it would be padding.

### House style

- Every definition has an API list and at least three Checks (§0.1: 5, §0.4: 7, §5.1: 9, §7.5: 3).
- Every layer ends with Examples and Dependencies.
- There is no LaTeX, no `lemma`, no pull-request number and no machine path.
- The only process-like word, "removed" (lines 306, 314, 324), is mathematical: the removed critical strips.

## Not verifiable

- he21 is an OCR text with garbled display lines (for example lines 311–318, 340, 502–504). Theorem 6.1's hypotheses were read from line 481, Remark 6.2 and §6.3. The §6.2 hypothesis (line 500) was read from its use at line 505.
- Not re-opened in this round, so their locators are accepted as recorded:
  - zhu17 Appendix A (pp. 471–481) and §3.1.2;
  - ghnerr;
  - ckv15 Proposition 3.3.1;
  - vie14 Proposition 5.5 and Corollary 5.6.
- The round-1 zhu17 τ_i misprint was not re-checked.
- He–Yang, Theorem 1.1, the source He14 cites for Proposition 11.7, is not in the manifest and was not fetched. The Source issue below concerns He14's printed statement only.
- No text was unreadable and no fetch was needed, so `needs-references.toml` was not created.

## Source issues

- **Error** in he14 at Proposition 11.7, p. 400: the source says one pair (J,c) serves every μ with κ(t^μ)=κ(τ) under its simple-reflection reduction; it should be a pair depending on μ and w, since in adjoint affine A₁ with τ=1 the inputs μ=0 and μ=α∨ reach distinct minima s₁ and s₀; affects a stated result.
- **Misprint** in he14 at Proposition 11.6, p. 399: the source says the support condition holds for an undefined element v; it should be the element x of W_J; affects nothing.
- **Misprint** in he21 at §6.2, p. 13: the source says w is an alcove element with conjugator σ⁻¹(y); it should be the left normal-form factor x, as in ghn15 Lemma 3.6.3; affects nothing.
- **Gap** in he21 at §6.3, p. 14: the source says basic nonemptiness of a t^γ follows from He15 Theorem 2.27, which assumes shrunkenness; it should be argued without it, since a t^γ need not be shrunken (A₂, γ=0, a=s₁s₂); affects the proof.
- **Misprint** in zhu17 at (3.1.3), p. 455, and Theorem 3.1, p. 456: the source says the dimension formula holds without requiring a nonempty locus; it should be assumed nonempty (GL₂, b=1, μ=(1,0) is empty, yet the formula gives 1/2); affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "08e5f4f", "job": "REV-PKG-HeckeStacksAndLocalShtukasPartII~2", "model": "opus", "worker": "fable-rev97"} -->
