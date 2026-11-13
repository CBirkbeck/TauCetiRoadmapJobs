<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13140#issuecomment-6849435342 -->
Review (claude) of de023d8

Verdict: needs_changes

1. **F01** (P2) The summary misstates where the base roadmap stops; `Rf_!` on smooth stacky maps has two constructions with no stated agreement

   **Location:** README.md line 5: “it constructs no exceptional pushforward Rf_! for non-representable maps such as [S/G_S] → S for a geometric point S and a nontrivial locally pro-p group G”. Also line 61 (contract for §VS0.2) and line 691 (VS7.8).

   **Claim:** The base roadmap has no exceptional pushforward for the structure map of a classifying stack.

   **Witness:** `VStackSheavesAndLisseCategories` at its open head, §VS0.2 “Exceptional pullback for smooth stacky maps”: descent supplies “the stacky left adjoint on this smooth class”, with the API bullet `Map(f_!B,A)=Map(B,f!A)`. For S = Spd C and G = C₂ the chart q : S → [S/C₂] is separated and smooth and f ∘ q = id_S, so f is in that class. By VS10.9 every G of VS10.6 gives a smooth f.

   **Exact repair:**
   1. Line 5: replace the clause by “it constructs the left adjoint of exceptional pullback only for cohomologically smooth maps of Artin v-stacks (its §VS0.2), and no exceptional pushforward for non-smooth non-representable maps, such as [T_S/G_S] → S for a geometric point S, T = Z_p with trivial action and G = C₂ (fine, not cohomologically smooth; VS10.10 and the VS7.9 Check)”.
   2. Line 61: add “the stacky left adjoint f_! of f^! on the smooth class” to what §VS0.2 supplies.
   3. Line 691 (VS7.8), after the agreement of the twisted pullback: “hence, for smooth fine f, Rf_! of VS7.5 is the base roadmap's stacky left adjoint, both being left adjoint to the same Rf^!”.

   **Repair tested:** S = Spd C, G = C₂, Λ = F₃. VS10.9 gives Rf_!M = M_G (Haar ≅ Λ). For M trivial: M_G = F₃ and Hom(F₃, A) = Hom_G(F₃, A) = A. For M = sign: M_G = F₃/(σ − 1)F₃ = F₃/(−2)F₃ = 0 and Hom_G(sign, A) = 0 for trivial A. Both sides of `Map(f_!B,A)=Map(B,f!A)` agree. The new example T_S × [S/C₂] → S has a C₂ stabiliser (not representable) and dualizing object Dist-sheaf ⊠ Haar(C₂)^∗, not invertible for Λ = F_ℓ (germ dimension ≥ 2), so it lies outside the base roadmap's smooth class.

2. **F02** (P3) One Check still has the pattern repaired in round 5: no hypothesis on S

   **Location:** README.md line 739 (VS7.9 Checks): “For T = Z_p as a profinite set and Λ ≠ 0 (for instance Λ = F_ℓ), K_(T_S/S) is not invertible: H^0(T_S, K) = Dist(Z_p, Λ)”.

   **Claim:** Non-invertibility and the value of H^0 hold for the S of the subsection, a decent v-stack.

   **Witness:** S = ∅: T_S = ∅, D_ét(∅, Λ) = 0 and K = 0 is the invertible unit (the Check itself says so for Λ = 0). S = Spd C ⊔ Spd C: H^0 = Dist(Z_p, Λ)², not Dist(Z_p, Λ). Line 36 makes S a geometric point only where a Check says so.

   **Exact repair:** Begin the Check with “For S a geometric point (Spd C or Spd k), T = Z_p as a profinite set and Λ ≠ 0 …”, and append “for S = ∅ the category is zero and K = 0 is invertible”.

   **Repair tested:** S = Spd C, Λ = F_ℓ: by VS10.4, H^0 = Dist(Z_p, F_ℓ), and the stalk at 0 contains the independent germs δ₀ and ν of the VS7.4 Check (values (1,0) on U_n and (0,1) on W_n), so rank ≥ 2 ≠ 1.

3. **F03** (P3) “Representable in nice diamonds” and “nice diamond” are used 25 times and never defined

   **Location:** README.md line 332 (first use); hypotheses at lines 1209 (VS9.3), 1302 (VS9.6), 1503 (VS10.4), 1555 (VS10.6), 1911 (VS11.10): “Let X be a nice diamond over S with an action …”.

   **Claim:** The term is available to the reader.

   **Witness:** No definition and no locator in the README (no occurrence of “4.1.3”). The term is HKW22 line 1082 (Definition 4.1.3, p. 22): compactifiable, representable in locally spatial diamonds, locally of finite dim.trg. That is exactly “eligible” of `DiamondSixOperations` §S0.4, a name the README also uses (lines 308, 462, 674) with no bridge.

   **Exact repair:** Add to Conventions: “A map of small v-stacks is representable in nice diamonds (Hansen–Kaletha–Weinstein, Definition 4.1.3, p. 22) if it is compactifiable, representable in locally spatial diamonds and locally of finite dim.trg; these are the eligible maps of DiamondSixOperations §S0.4. A nice diamond over S is an X with X → S representable in nice diamonds.” In line 1209 delete “and representable in nice diamonds” (a proper nice map is one by VS6.7 (iv)).

   **Repair tested:** The infinite-dimensional perfectoid ball of the VS6.6 Check is representable in locally spatial diamonds but has infinite dim.trg: not nice, as intended, whereas “proper nice” read by analogy (VS6.11) would only ask for representability. T_S → S is locally proper of dim.trg 0: nice, as VS10.4 says.

4. **F04** (P3) The hypothesis “f ∘ c′ perfectly proper” of VS9.8 uses a map the README never defines

   **Location:** README.md lines 1356 and 1358 (VS9.8): “with c₁ and f ∘ c′ perfectly proper”; line 1060 (VS8.10): “H^0(C, Δ′_∗c′^!K_(X/S))”.

   **Claim:** c′ and Δ′ are defined.

   **Witness:** They are the projections of the Cartesian square of HKW22 lines 2301–2309 (p. 47): c′ : Fix(c) → X and Δ′ : Fix(c) → C. The README defines only Fix(c) = C ×_(X ×_S X) X (line 35). Without c′ the reader cannot tell that the hypothesis makes Fix(c), hence every clopen β, proper over k, which VS9.4 requires for loc_β.

   **Exact repair:** In Conventions (line 35) add “with projections Δ′ : Fix(c) → C and c′ : Fix(c) → X”. In VS9.8 write “c₁ and f ∘ c′ : Fix(c) → Spec k perfectly proper (so every clopen β ⊂ Fix(c) is perfectly proper over k)”.

   **Repair tested:** With X = Spec k, c = id: Fix(c) = Spec k, f ∘ c′ = id is proper and loc_β is defined, as the first VS9.8 Check uses. For X the perfection of A¹ and c = id, Fix(c) = X is not proper and the hypothesis correctly fails.

5. **F05** (P3) VS10.1 writes an unsubscripted tensor product that is false under the README's own convention

   **Location:** README.md line 1399 (VS10.1): “1_U·M ≅ C(U, Λ)⊗M is a C(T, Λ)-module”.

   **Claim:** 1_U·M is C(U, Λ) ⊗ M.

   **Witness:** Elsewhere unsubscripted ⊗ is over Λ (“C_c(G, Λ) ⊗ M”, “C_c(T, Λ) ⊗ Haar(G, Λ)”). Take T = {a, b}, U = T, M = C(T, Λ) = Λ²: 1_U·M = M has rank 2, while C(U, Λ) ⊗_Λ M has rank 4.

   **Exact repair:** “1_U·M ≅ C(U, Λ) ⊗_(C(T,Λ)) M, a C(U, Λ)-module and, through multiplication by 1_U, a C(T, Λ)-module” (HKW22 lines 3581–3584, p. 73).

   **Repair tested:** Same instance: C(T, Λ) ⊗_(C(T,Λ)) M = M, rank 2. For U = {a}: C({a}, Λ) ⊗_(C(T,Λ)) M = 1_a·M, rank 1.

6. **F06** (P3) The modulus δ_SR is attributed to the supplier for a general group; the supplier defines it only for P = M ⋉ N

   **Location:** README.md line 37: “*Smooth representations of local groups* §SR.2.2 uses δ_SR(g) = μ(Eg⁻¹)/μ(E), so χ_G = δ_SR⁻¹”; lines 1525, 1532 and 1540 (VS10.5).

   **Claim:** §SR.2.2 supplies a character δ_SR of an arbitrary locally profinite G with χ_G = δ_SR⁻¹.

   **Witness:** `SmoothRepresentationsOfLocalGroups` §SR.2.2 (*modulus-character*) defines δ_P := mod_N, the conjugation modulus of N, for P = M ⋉ N, equal to the modular character only for unimodular M; its Check: “For P = G (N = 1), δ_P = 1”. For the affine group read as P = G, N = 1 this gives 1, while χ_G(diag(p,1)) = p.

   **Exact repair:** Line 37: “Write δ_SR(g) = μ(Eg⁻¹)/μ(E) for the modular character of G (an index ratio of compact open subgroups, hence a power of p and a unit of Λ when G is locally pro-p); χ_G = δ_SR⁻¹. For G = P = M ⋉ N with M unimodular this δ_SR is the δ_P of *Smooth representations of local groups* §SR.2.2; for other presentations (N = 1) that δ_P is the conjugation modulus and differs.” In VS10.5 step 2 (line 1540) cite §SR.1.1 (*a-valued-haar-measure*, uniqueness) for “g·μ is a multiple of μ”, and §SR.2.2 only for the comparison in the case P = M ⋉ N.

   **Repair tested:** Affine group, M = ℚ_p^×, N = ℚ_p, g = diag(p, 1): conjugation scales N by |p| = p⁻¹ = δ_P(g) (the supplier's own value δ_B(diag(p,1)) = p⁻¹), μ(Eg) = |p|·|p|⁻²·μ(E) = pμ(E), so χ_G(g) = p = δ_P(g)⁻¹. With N = 1 the supplier's value 1 ≠ p⁻¹, and the repaired sentence excludes that reading.

7. **F07** (P3) VS7.2 uses the cohomological dimension of spectral spaces by name; its owner is not cited

   **Location:** README.md line 529 (VS7.2, step 3): “via Scheiderer's theorem for spectral spaces whose generizations form chains”; *Needs:* line 537.

   **Claim:** Every input of the route is a target, a supplier section or a pinned declaration.

   **Witness:** GHW22 lines 739–740 (Lemma 3.8, p. 15) use the bound “a spectral space of Krull dimension ≤ d has cohomological dimension ≤ d”. It is `DiamondEtaleCohomology` §C8.44 (“Spectral-space cohomological dimension”, `spectralCohomologicalBound`), merge-order line 76, earlier than this roadmap. The README never names that roadmap.

   **Exact repair:** Step 3: “… by the Krull dimension of the spatial X₀: the spectral-space bound is DiamondEtaleCohomology §C8.44, and for a spectral space whose generizations form chains the cohomology of the maximal Hausdorff quotient is that of the space (GHW22 Lemma 3.8, proved here)”. Add “DiamondEtaleCohomology §C8.44” to the VS7.2 *Needs:* line, to the Layer VS7 Dependencies and as a `From TauCetiRoadmap.DiamondEtaleCohomology` contract. Re-run the dependency check.

   **Repair tested:** §C8.44's statement (spectral X, `topologicalKrullDim X ≤ d`, any abelian sheaf, vanishing for i > d) is the input at S = |X| in GHW22 line 739; the chain condition is used only for the comparison with |X|^h (GHW22 lines 735–738), which stays a part of VS7.2.

8. **F08** (P3) Page range of the Künneth theorem starts two pages early

   **Location:** README.md line 1892 (VS11.9): “Theorem 4.5.3, equation (4.5.2) and proof, pp. 36–41”.

   **Claim:** The statement, (4.5.2) and the proof are on pp. 36–41.

   **Witness:** HKW22 line 1836 ((4.5.2)) and line 1840 (Theorem 4.5.3) are on p. 38 (page marker at line 1823); the proof is at lines 1960–1998, pp. 40–41. Pages 36–37 hold Definition 4.5.1 and Lemma 4.5.2, cited separately by VS11.5 and VS11.6.

   **Exact repair:** “Theorem 4.5.3 and equation (4.5.2), p. 38, and proof, pp. 40–41”.

   **Repair tested:** Against the page markers at HKW22 lines 1823, 1934 and 1985.

Eight findings: one P2 and seven P3. The round-5 finding is repaired. No theorem statement is refuted; the P2 is a false statement about where the base roadmap stops, with a missing agreement clause for an object both roadmaps construct. All line numbers are those of `packages/VStackSheavesAndLisseCategoriesPartII/README.md` at the reviewed head.

## Verified sound

### The round-5 finding, checked first

| Finding | Status and repaired passage | Values computed |
|---|---|---|
| F01, VS6.1 Check without hypotheses on S and G | **Repaired**, line 176: “For S = Spd C with C an algebraically closed perfectoid field and G = C₂ … For S = ∅ … f = id_∅, which is representable”. | S = Spd C: Aut of the trivial torsor has order 2 against 1 for a v-sheaf; q has 2 sheets, finite étale; the square (q, id_S) has top map id_S of dim.trg 0; Isom of two torsors is a C₂-torsor over the test object, so the diagonal is representable. S = ∅: G_S = ∅ and f = id_∅. |

The repair report lists 20 further passages scoped the same way (summary, Conventions, VS6.2, 6.3, 6.6, 6.8, 6.10, 6.11, VS7.5–7.8, 7.10, 7.11, VS8.6, 8.11 and two Examples lists). Each was read at the head. Each is correct as a Check; the summary sentence fails for another reason (R01). The pattern survives once, in VS7.9 (R02). The other Checks about `T_S`, `[S/G]` or `B(C_n)` were searched: lines 828, 829, 1084, 1117, 1138, 1825, 1923, 1954 hold for every S, including ∅, or name a geometric point.

### Principles, shape, policy

- All 65 numbered targets, their hypotheses, API lists, Checks, proof sketches, *Needs:* lines and the six Dependencies paragraphs were read in full this round.
- 28 definition or construction blocks carry an API list; each has at least three Checks (the smallest, VS8.1, has three).
- The six Dependencies paragraphs were compared item by item with the *Needs:* lines of their layers: every supplier section in a *Needs:* line appears, apart from the missing one of R07.
- Layer order is forced by the dependency lines: VS10 needs only VS6–VS7, VS8.1–VS8.5 need nothing geometric, VS11 needs VS8–VS10. No layer is named after a source chapter and the README does not say it follows a source.
- No LaTeX delimiters, pull-request numbers, dates, machine paths, `lemma`, `set_option` or sorry'd data. The former-numbering table (lines 131–137) maps the layer ids of `design/plan.json` to the README's and is of the permitted form.
- No computational algorithm, no route-specific shortcut: coefficients stay arbitrary prime-to-p torsion rings (Z/9, Z/6, F_ℓ[t] all appear as controls), and p = 2 is used in the witnesses.

### Seeded sources

All fifteen sampled targets were opened in the cached texts. No locator is flagged unverified by the author.

| Target | Text opened | Result |
|---|---|---|
| 6.7 Permanence of fine morphisms | GHW22 lines 1158–1190 (Proposition 4.8, p. 23 onward); HKW22 line 1163 (p. 24), footnote 4 at lines 1376–1377 (p. 28) | (o)–(iv) as stated; (iv) asks for separated and representable in locally spatial diamonds, as the README does. |
| 7.1 Prespatial diamonds | GHW22 lines 623–658 (Definitions 3.1, 3.3, Lemmas 3.2, 3.4, p. 13), 681 (Proposition 3.6, p. 14), 719–725 | Definitions, the six sanity checks and the compactification statement agree; the Hausdorff-quotient Check is line 719. |
| 7.3 Weakly compactifiable maps | GHW22 lines 786–832 (Definition 3.11, Lemma 3.12, Scholium 3.13, p. 16) | (i)–(iv) are left to the reader there, which the README says; Rf_! = h_! ∘ Rp_* ∘ j_! at line 832. |
| 8.6 Correspondences | HKW22 lines 1357–1408 (Definition 4.3.3, pp. 28–29); LZ22 lines 659–668, 694–698 (Remark 2.7, Lemma 2.9, pp. 13–14) | Objects, 2-morphism equivalence β_i = (id ∗ γ) ∘ α_i, tensor and unit agree; unit by the diagonal and counit by f as in Lemma 2.9. |
| 8.9 Dualizable = ULA | HKW22 lines 1511–1516 (p. 31); FS21 lines 4801–4812 (Theorem IV.2.23, pp. 124–125), 4841 (IV.2.24, p. 125), 4972 (IV.2.32, p. 129) | FS (ii) is the map of VS8.8; HKW cite “IV.2.24”, the README correctly IV.2.23. |
| 8.10 Trace class | HKW22 lines 1533–1556 (p. 32, footnote 5); LZ22 line 856 (Notation 2.20, p. 18) | The chain (P5), dualizability, α, evaluation, (BC2) is the README's. |
| 9.7 Diamondification | HKW22 lines 2371–2395 (p. 49) | Finite limits, representability, full faithfulness, the two comparison maps and u^♢ agree. |
| 10.1 Smooth and complete modules | HKW22 lines 3579–3598 (pp. 73–74) | Definition B.2.1 and Lemmas B.2.2–B.2.3 agree; R05 concerns the README's notation only. |
| 10.2 Sheaves as smooth modules | HKW22 lines 3599–3622 (Lemmas B.2.4–B.2.5, p. 74) | Surjectivity, 1_U·F(S) ≅ F(U), F(S) = lim, F_M(S) = M^c agree. |
| 10.3 Distributions | HKW22 lines 1215–1228 (Example 4.2.1, p. 25), 1306–1319 (p. 27) | H^0(T_S, f^!Λ) = Dist(T, Λ) and (4.2.1) agree. |
| 10.9 Structure map of a classifying stack | HKW22 lines 1294–1305 (Example 4.2.4, p. 27) | The four functors and K = Haar^∗ agree, with the same argument f ∘ q = id. |
| 11.6 Trivialisation over the inertia | HKW22 lines 1802–1829 (Lemma 4.5.2, pp. 37–38) | Both smoothness hypotheses present; the three-step proof is the source's. |
| 11.9 Künneth formula | HKW22 lines 1830–1843 (p. 38), 1960–1998 (pp. 40–41) | Hypotheses and formula agree; page range is R08. The misprint In_S(T₁) is at line 1990. |
| 11.10 Inertia of a quotient stack | HKW22 lines 2000–2046 (§4.6, pp. 41–42) | c, the G-action h(x, g) = (h(x), hgh⁻¹), c̃, Fix(c̃) ≅ Fix(c) and the Cartesian square agree. |
| 11.13 Étale locus | HKW22 lines 2133–2143 (p. 44), 2434 (p. 50) | The source asserts étaleness from isolated fixed points; the README's added hypothesis is justified by the computation below. |

All eight cited works have manifest entries with readable texts; no source was fetched or added.

### Adversarial computations

| Statement | Instances | Values on each side | Result / change |
|---|---|---|---|
| Summary, base boundary | S = Spd C, G = C₂, Λ = F₃ | Base §VS0.2 gives f_! with Map(f_!B, A) = Map(B, f^!A); VS10.9 gives M_G: F₃ for trivial M, 0 for sign; Hom_G into trivial A: A and 0. | Same functor in both roadmaps: R01. |
| VS6.1 Check (repaired) | S = Spd C; S = ∅ | Automorphism group of order 2 against 1; id_∅. | Holds. |
| VS6.9 labels and α_g | H = S₃, h = (123), f₂(t) = (12) | f₁(t) = h(12)h⁻¹ = (23); h⁻¹f₁(t) = (13) = f₂(t)h⁻¹; hf₁(t) = (12) ≠ (23) = f₂(t)h; (12)(123) = (23), (123)(12) = (13). | Direction and left action correct. |
| VS6.11 (a)⇔(b)⇔(c) | Spd Z_p; (P¹)^♢ | Spd Z_p has 2 points, open point hit through Spd C_p, closed point not hit; it is no diamond. P¹ is a spatial diamond. | Spatiality alone does not give (a). |
| VS7.1, 7.3 | infinite disjoint union of points; infinite-dimensional ball | Not quasicompact; dim.trg = ∞ at every point. | Negative controls hold. |
| VS7.2 | proper prespatial curve | Bound 3·1 = 3 = 2 (fibres over the Hausdorff quotient) + 1 (Krull dimension). | Holds; owner of the second summand is R07. |
| VS7.4 Check | T = Z₂, U_n = 2ⁿZ₂, W_n = 2ⁿ + 2^(n+2)Z₂ | 3·2ⁿ − 2ⁿ = 2^(n+1) ∉ 2^(n+2)Z₂, so y_n ∉ W_n; (δ₀, ν)(U_n) = (1, 0), (δ₀, ν)(W_n) = (0, 1). | Independent germs: holds. |
| VS7.7 | q : S → B(C₂), Λ = F₃; B(C₃), p = 2 | Swap on Λ[C₂], −1 on sign; H^(-1)(Rf_!Λ) = H₁(C₃, F₃) = F₃ against H^(-1)(Rf_*Λ) = 0. | Properness needed; 2-morphisms not trivial. |
| VS7.9 Check 4 | S = Spd C; ∅; Spd C ⊔ Spd C | Germ rank ≥ 2; K = 0 invertible; H^0 = Dist². | R02. |
| VS8.2 Check 3 | X = P¹, C = ∅, X′ = C′ = S | f ∘ e = (X ← ∅ → S), e′ ∘ f = (X ← X → S); 2-cell ∅ → X; traces 0 and tr(0) = 0. | Direction correct. |
| VS8.4 | Λ = Z/6, P = 3Λ; Λ ⊕ Λ[1] | 3·3 = 9 ≡ 3; |P| = 2 ≠ 6ⁿ so P is not free; tr_proj = 3, `LinearMap.trace` = 0; 1 − 1 = 0. | Projective trace needed; Koszul sign fixed. |
| VS8.5 | Λ = Z/ℓ, M = Λ^(ℕ) | dim M countable, dim M^∗∗ uncountable. | Non-finitely generated modules are not reflexive. |
| VS8.9 | point, A = F₃²; A = Λ^(ℕ) | 4 = 4; the image of 𝔻A ⊗ A consists of finite-rank maps and misses id. | Both directions discriminate. |
| VS8.10 | fold S ⊔ S → S, u = (1, 2), Λ = F₅ | Fix(c) = C, class (1, 2), integral 3. | Class and scalar distinguished. |
| VS9.1–9.3 | P¹, z ↦ az; closed disc, T ↦ T + p | 1 + 1 = 2 on H⁰ ⊕ H²; Fix = ∅ against trace 1 on RΓ = Λ. | Properness retained. |
| VS9.7 | perfection of A¹, x ↦ x + 1 | x = x + 1 forces 0 = 1: Fix = ∅ on both sides. | Holds. |
| VS9.8 | X = Spec k; X = perfection of A¹, c = id | f ∘ c′ = id proper; Fix(c) = X not proper. | Hypothesis discriminates once c′ is defined: R04. |
| VS10.1 | T = {a, b}, U = T, M = Λ² | Rank 2 against rank 4 over Λ; rank 2 over C(T, Λ). | R05. |
| VS10.2 | T = {a, b}, stalks F₃², F₃; T = ℕ | 2 + 1 = 3; ⊕Λ against ∏Λ. | Inverse functors as stated. |
| VS10.3 | T = Z_p, Λ = F_ℓ | μ(a + pⁿZ_p) = p⁻ⁿ ≠ 0 on all pⁿ cosets; a finite Dirac sum vanishes on all but finitely many. | Dist is larger than the Dirac span. |
| Conventions, VS10.5 | affine group, g = diag(p, 1) | Left Haar |a|⁻² da db; μ(Eg) = |p|·|p|⁻²μ(E) = pμ(E); χ_G(g) = p; supplier δ_P(g) = p⁻¹ for N = ℚ_p and 1 for N = 1. | Convention right; attribution scoped in R06. |
| VS10.9 | G finite of invertible order; G = Z_p | M_G ≅ M^G by averaging; Hⁱ(Z_p, Λ) = 0 for i > 0. | Holds. |
| VS10.10 | G = 1, T a point, Λ = Z/9 | μ₀ ↦ identity; 2μ₀ ↦ bijection; 3μ₀ ↦ image and kernel {0, 3, 6}. | Generator needed. |
| VS11.2 | G = S₃, c = (12), y = (123) | φ(y) = y⁻¹cy = (13); the left-torsor formula gives (23). | Right-torsor convention correct. |
| VS11.3 | affine group over ℚ₂, Λ = F₅ | 2·μ(Kg⁻¹) = 2·2⁻¹ = 2·3 = 6 ≡ 1; other direction 2·2 = 4. | Invariance in the stated direction only. |
| VS11.4 | C₂, sign over F₃ | Character (1, −1) = trace distribution on 1_{1}, 1_{σ}. | Holds. |
| VS11.5, 11.7 | closed ball over Spd C; A′₁ = 0 | Λ(2)[4] against Λ(1)[2]: H^(−4) is Λ against 0; both 0 for zero input. | Twist needed; degenerate case stated. |
| VS11.9 | T = S a point, ranks 2 and 3 | 2·3 = 6. | Holds. |
| VS11.10 | trivial action; X = S | Fix(c) = X ×_S G, quotient X ×_S [G//G]; Fix(c) = G. | Holds. |
| VS11.11, 11.12 | C₂ swapping {a, b} | Fixed pairs (a, 1), (b, 1), none over σ; values (1, 1). | Holds. |
| VS11.13 | z ↦ az + b on P¹ | In w = 1/z: w(bw + a − 1) = 0; double root at a = 1, b ≠ 0; linear coefficient a − 1. | Added étaleness hypothesis is necessary. |

### Pinned declarations and the Lean file

- `lake env lean` on the package's `Suggested.lean`, run from the content checkout: exit 0, no output, no warning.
- The file has one import (`Mathlib`), one module docstring, an empty namespace: zero declarations. The one-tactic padding probe and the `#check @name` audit therefore have no inputs.
- A scratch file with `#check @…` for the 23 Mathlib names the README cites elaborated with all names found: `CategoryTheory.MonoidalCategory`, `SymmetricCategory`, `ExactPairing` with `coevaluation` and `evaluation`, `HasRightDual`, `Bicategory`, `Bicategory.Adjunction`, `Pseudofunctor`, `LocallyConstant`, `LocallyConstant.charFn`, `TopologicalSpace.CompactOpens`, `Module.Dual`, `Module.Dual.eval`, `Module.IsReflexive`, `Module.instIsReflexiveOfFiniteOfProjective`, `Module.instFiniteDimensionalOfIsReflexive`, `IsDiscreteValuationRing`, `IsLocalRing.maximalIdeal`, `Module.Finite`, `LinearMap.trace`, `FGModuleCat`, `DerivedCategory`.
- Opened at the pin: `Mathlib/LinearAlgebra/Dual/Lemmas.lean:262` and `:284` (the two instances), `Mathlib/LinearAlgebra/Dual/Defs.lean:203` (`IsReflexive`), `Mathlib/Algebra/Category/FGModuleCat/Basic.lean:265` (`rightRigidCategory`), `Mathlib/CategoryTheory/Bicategory/Adjunction/Mate.lean` (the mates VS8.2 names), `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean` (`TauCeti.IsSmoothDiscrete`), `TauCeti/AlgebraicGeometry/AdicSpace/PreAdicSpace/Basic.lean:40`.
- The docstring's library claims hold: `Mathlib/RingTheory/Perfectoid/` has `Untilt.lean`, `FontaineTheta.lean`, `BDeRham.lean`; Tau Ceti has `RingTheory/Perfectoid/` and `AlgebraicGeometry/AdicSpace/`; neither library has a monoidal bicategory, perfectoid spaces, a v-site or diamonds.
- Headlines from the summary: VS7.5, VS8.9, VS9.1, VS9.2, VS11.4, VS11.9, VS11.12 (and VS9.3, VS9.6, VS9.8 in the docstring). Each is named in the docstring with its missing carrier; none is statable at the pins, and none is replaced by a stand-in.
- No backticked name in the README is presented as a declaration of this roadmap.

### Suppliers, gaps, duplication

Each cited supplier was read at its current head (open heads through the roadmap service, main in the content checkout).

| Supplier | Resolved |
|---|---|
| `VStackSheavesAndLisseCategories` (open) | §VS0.1, §VS0.2 (including the Check that the point of `[*/ℤ_p]` is no smooth atlas), §VS1.1, §VS1.2, §VS4.2 (“Sheaves and smooth representations”), §VS5.2 (“Torsion ULA and perfect invariants”); all eleven slugs found. |
| `DiamondSixOperations` (open) | §§S0.1, S0.2, S0.4, S1.1–S1.5, S2.3, S2.4, S3.1–S3.4, S4.1–S4.5, S5.4, S5.5 exist under those headings. |
| `DiamondsAndVStacks` (open) | §§D4.1, D4.6, D4.7, D4.10, D5.1, D5.2, D5.5, D5.11, D5.12, D5.14, D6.4, D6.5 and their eleven slugs. |
| `SmoothRepresentationsOfLocalGroups` (open) | §§SR.0.3, SR.0d.2, SR.1.1, SR.2.1, SR.2.2 and all fourteen slugs; `HaarMeasureWithValues` in §SR.1.1. |
| `EtaleDualityAndPerverseSheaves` (open) | §§6.1–6.3; `CohCorr.pullbackAlong`, `CohCorr.restrictOpen`; same leg convention u : c₁^*F₁ → c₂^!F₂; finite ℓ-power coefficient range as the README says. |
| `AdicCoefficientsAndComparisons` (open) | The two L1 and four L3 targets. |
| `EnhancedDerivedSheaves`, `SchemeAndStackFoundations`, `PivotalSpherical`, `DGAInfinity`, `AdicSpacesPartIII` (main) | §§E1.4, E2.6, E3.2, E3.4, E5:abstract.1; §§0.23a, 0.24 with `perfection_universalHomeomorphism`; Layers 2 and 7; Layer 5; §R3.8 with both slugs. |

- The six gap slugs of `design/plan.json` equal the six contracts of the README, each with its supplier and section. Each `needs` sentence is one statement with hypotheses. None asks for what an earlier roadmap provides: the Liu–Zheng restricted-nerve theorems are also planned by `AnalyticStacks` §0.3, which is at line 332 of the merge order, later than this roadmap (line 129), so it cannot be consumed here.
- By object, the open roadmaps and main were searched for decent v-stacks, prespatial diamonds, `CoCorr`, Lefschetz–Verdier, inertia stacks, trace distributions, symmetric monoidal 2-categories and Haar modules. `EtaleDualityAndPerverseSheaves` §§6.2–6.3 defines scheme correspondences and Varshavsky-style trace maps, not the categorical trace of Lu–Zheng §1; `AutomorphicSpectralTheory` owns complex trace distributions, not the torsion-valued ones of VS11.3. No second owner of a target of this roadmap was found, apart from the smooth-class `Rf_!` of R01.
- `Suggested.lean` declares nothing, so no fully qualified name can collide.
- Overlaps file: no other pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision.

Dependency check, complete output (exit 0; no UPWARD, CYCLE or moved line):

```text
depcheck: 206 roadmaps, 1902 edges, 0 problem(s)
```

The citation resolver reports no unresolved cross-roadmap citation and no unknown Lean name.

Overlap check: read DiamondSixOperations, VStackSheavesAndLisseCategories, HeckeStacksAndLocalShtukas, AdicCoefficientsAndComparisons, AnalyticStacks, EnhancedDerivedSheaves; shared objects: the left adjoint of f^! for smooth stacky maps — owner VStackSheavesAndLisseCategories §VS0.2 (R01); the restricted-nerve theorems of Liu–Zheng — required of EnhancedDerivedSheaves §E3.4 by declared gap, also planned by the later AnalyticStacks §0.3, not owned here; eligible maps (“representable in nice diamonds”) — owner DiamondSixOperations §S0.4 (R03).

## Not verifiable

- No cited source was unreadable; no missing-reference request is made.
- Whether every proper fine map is cohomologically proper is not settled by the sources. VS7.7 says so and restricts every later use to cohomologically proper maps; this review certifies the restricted statements only. The matter was settled in an earlier round and is not re-raised.
- The headline signatures cannot be elaborated until their carriers exist; the six supplier gaps are contracts, not results.
- The entries of the README's *Corrections to the sources* that concern HKW22 Theorem 4.1.8, Example 4.1.1, Example 4.3.10, Definition 4.3.4 and Lemma B.1.1 were not re-opened this round; the earlier rounds report them.

## Source issues

- **Error** in HKW22 at the closing remark of §4.6, printed p. 44: the source says isolated fixed points of the elements of U make the restricted inertia étale over [U//G]; it should be an explicit étaleness hypothesis, since w(bw + a − 1) = 0 has a double root at a = 1; affects a stated result.
- **Error** in HKW22 at Example 4.2.5 after (4.2.1), printed p. 27: the source says any chosen Haar measure identifies the twisted invariant distributions with Dist(T, Λ)^G for unimodular G; it should be a generator of Haar(G, Λ); affects a stated result.
- **Misprint** in HKW22 at the paragraph after Proposition 4.3.5, printed p. 31: the source says the ULA criterion for nice maps is FS Theorem IV.2.24; it should be FS (arXiv v4) Theorem IV.2.23, printed pp. 124–125; affects nothing.
- **Misprint** in HKW22 at footnote 4, printed p. 28, and Example 4.2.5, printed p. 27: the source says the permanence of fine maps is GHW Propositions 4.10 and 4.11; it should be GHW (arXiv v1) Proposition 4.8 (i), (iii), (iv); affects nothing.
- **Misprint** in HKW22 at the proof of Theorem 4.5.3, printed p. 41: the source says the fibre product of inertia stacks is over In_S(T₁); it should be over In_S(T); affects nothing.
- **Misprint** in HKW22 at §5.3, printed p. 48: the source says the trace map is described before Definition 4.3.5; it should be before Definition 4.3.6, 4.3.5 being a proposition; affects nothing.
- **Gap** in HKW22 at equations (4.5.8)–(4.5.9), printed p. 40: the source says functoriality and monoidality of the fibre product over a base are straightforward and omits them; it should be proved, since Theorems 4.5.3 and 4.6.1 use them; affects the proof.
- **Gap** in GHW22 at Lemma 3.12 (i)–(iv), printed p. 16: the source says the permanence of strongly and weakly compactifiable maps is left to the reader; it should be proved from compactifiability and prespatial permanence; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "de023d8197fded8eb8c377b3f2bd5272a0c37ea9", "job": "REV-PKG-VStackSheavesAndLisseCategoriesPartII~6", "model": "fable", "worker": "chris-x56"} -->
