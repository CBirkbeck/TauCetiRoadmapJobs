<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18047#issuecomment-6911641371 -->
Red team round 1 pass b (claude) of 61666d4

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 0.1: "colimit" of the tower CAlg(nPr) is not the colimit of ∞-categories; the roadmap's own Check refutes that reading

   **Location.** `packages/RationalAnalyticPrismatization/README.md:213`: "Define the ∞-category StRing of Stefanich rings as the colimit of CAlg(Ani) → CAlg(1Pr) → CAlg(2Pr) → ⋯ along these embeddings, equivalently the limit along D ↦ End_D(1)"; and, same line, "an equivalence from Stefanich A-algebras to the colimit of CAlg(A_1) → CAlg(A_2) → ⋯".

   **Claim.** StRing (resp. `StRing_{A/}`) is the colimit of the tower of fully faithful embeddings.

   **Witness.** Gest line 960 and Gest line 1713 take the colimit in presentable ∞-categories ("colim^pres", "colim_1Pr"), equal to the limit in CAT∞ along the right adjoints (Gest line 1714, Gest line 1751). The colimit in ∞-categories of fully faithful embeddings is their union, so every A-algebra would be n-affine for some n. README:253 exhibits ⋃_n A^n, "not n-affine for any n": it lies in the limit and not in the union.

   **Repair.** At README:213 replace the first passage by: "Define the ∞-category StRing of Stefanich rings as the colimit, formed in κ-presentable ∞-categories and colimit-preserving functors, of CAlg(Ani) → CAlg(1Pr) → CAlg(2Pr) → ⋯ along these embeddings; equivalently, and this is the description used below, the limit of ∞-categories along the right adjoints D ↦ End_D(1). It is not the union of the CAlg(nPr): a Stefanich ring need not be n-affine over the unit for any n (third Check of 0.2)." Replace the second by: "… is an equivalence from Stefanich A-algebras to the limit of CAlg(A_1) ← CAlg(A_2) ← ⋯ along B ↦ End_B(1), which is the colimit of CAlg(A_1) → CAlg(A_2) → ⋯ formed in κ-presentable ∞-categories". Tested on ⋃_n A^n over D(k): its relative algebras (B/A)_n exist at every level, so it is an object of the limit; it is in no CAlg(A_{n+1}), consistent with README:253.

2. **F02** (P2) 0.5 and 2.2: 0-affineness of [X]_D needs the Künneth formula on the slice over X; the clause has no locator and its route does not prove it

   **Location.** README:304: "and that if moreover f: X → ∗ has f^* inducing D(X) ≅ `Mod_{f_*1}(D(∗))`, then [X]_D is 0-affine over [∗]_D with relative algebra f_*1"; the law at README:316; the use at README:548 ("maps of affinoid Gelfand stacks are 0-affine by the Künneth case of 0.5").

   **Claim.** Künneth for products X × Y in C, plus D(X) ≅ Mod_{f_*1}(D(∗)) for the one object X, gives 0-affineness of [X]_D.

   **Witness.** 0-affine forces O([X]_D)_2 = `K_{D,X}` ≅ Mod_{D(X)}(1Pr). By Gest Proposition 9.3 (Gest line 3028–3030) applied to the slice C_{/X} (Gest line 3041), this holds if and only if D(Y) ⊗_{D(X)} D(Z) ≅ D(Y ×_X Z) for all Y, Z over X. The stated hypothesis is the formula over ∗ only; the proof route (README:306, last sentence) treats [∗]_D only.

   **Repair.** At README:304 replace the clause by: "and that if moreover the formalism on the slice C_{/X} satisfies the Künneth formula, D(Y) ⊗_{D(X)} D(Z) ≅ D(Y ×_X Z) for all Y, Z over X, and f: X → ∗ has f^* inducing D(X) ≅ `Mod_{f_*1}(D(∗))`, then `K_{D,X}` ≅ Mod_{D(X)}(1Pr) (Gest Proposition 9.3 for C_{/X}, Gest line 3020, Gest line 3041) and [X]_D is 0-affine over [∗]_D with relative algebra f_*1; the slice condition is necessary, by the same proposition." Add the slice hypothesis to the law at README:316. Add to the route at README:306: "For the last statement apply Proposition 9.3 to C_{/X} and propagate to higher levels by Gest Example 3.12 as before." At README:548 write "by the Künneth case of 0.5, whose slice hypothesis is AnalyticStacks §2.3(7), D(B ⊗_A C) ≅ D(B) ⊗_{D(A)} D(C)". Tested on the instance of README:321: for affinoid analytic stacks the relative formula is AnalyticStacks §2.3(7), so [AnSpec R]_D stays 0-affine.

3. **F03** (P2) 2.1: the restriction GelfStk → GelfStk^qfd is the direct image, not the inverse image

   **Location.** README:536: "GelfStk and GelfStk^qfd are ∞-topoi, and the restriction GelfStk → GelfStk^qfd is the inverse image of a geometric morphism."

   **Claim.** Restriction to qfd rings is left exact and colimit-preserving.

   **Witness.** ABLB line 2269–2271: the geometric morphism GelfStk → GelfStk^qfd has as left adjoint the left exact colimit-preserving functor GelfStk^qfd → GelfStk sending GSpec(A) to itself; ALRS line 661–669 writes it α^*: GelfStk^qfd → GelfStk. README:525 itself states this direction.

   **Repair.** Replace the law by: "GelfStk and GelfStk^qfd are ∞-topoi; the geometric morphism GelfStk → GelfStk^qfd has inverse image the left exact colimit-preserving functor GelfStk^qfd → GelfStk that sends GSpec(A), A separable qfd, to GSpec(A), and direct image the restriction to qfd rings; the inverse image is not known to be fully faithful (ALRS line 670)." Tested against README:525 and ABLB line 2270: same direction.

4. **F04** (P2) Suggested.lean: two headline statements in the module docstring are stronger than the README targets

   **Location.** `packages/RationalAnalyticPrismatization/Suggested.lean:44–46`: "for a Berkovich space with a continuous action of a p-adic Lie group, `X/G^cont → |X|^Betti/G^la` is 0-proper with fully faithful pullback"; `Suggested.lean:50–51`: "for a rigid smooth map of relative dimension `d`, `f^{Div¹,!} O ≅ O{d}[2d]`".

   **Claim.** (a) h^* is fully faithful; (b) the dualizing complex formula holds for every rigid smooth map.

   **Witness.** (a) README:1759 and README:1879 assert full faithfulness only on `Mod_{O^la_X}(D(|X|^Betti/G^la))`; README:1775: for X = ℤ_p^cont with translation, D(X/G^cont) = D(ℚ_p) while the target "carries more quasi-coherent sheaves", so h^* is not fully faithful. (b) README:2126 part (3) and ALRS line 8881 assume X smooth partially proper rigid over ℚ_p.

   **Repair.** `Suggested.lean:45–46`: "`X/G^cont → |X|^Betti/G^la` is 0-proper, with pullback fully faithful on modules over `O^la_X = h_* O`, and". `Suggested.lean:50–51`: "for a rigid smooth map `f : Y → X` of pure relative dimension `d` the base change of `f^{Div¹}` to `FF_{X^⋄}` has dualizing complex `O{d}[2d]`, and `f^{Div¹,!} O ≅ O{d}[2d]` when `X` is a smooth partially proper rigid space over `ℚ_p`;". Tested on X = ℤ_p^cont: the repaired (a) is README 10.6 and holds there.

5. **F05** (P3) 4.7 Check: the two closed unit discs are not an analytic cover of P¹

   **Location.** README:963: "The analytic projective line P¹, glued from two closed unit discs with coordinates T and 1/T along the annulus |T| = 1 … the gluing is the content of the statement".

   **Witness.** README:619 requires a strict closed cover, "one refined by an open cover". Every open neighbourhood of the Gauss point of P¹ contains points with |T| < 1 and with |T| > 1, so none lies in {|T| ≤ 1} or in {|T| ≥ 1}. GSpec(ℚ_p⟨T⟩) is moreover not a †-rational subspace (README:637).

   **Repair.** "The analytic projective line P¹ is covered by the †-rational subspaces {|T| ≤ p} and {|1/T| ≤ p}, whose interiors {|T| < p} and {|T| > 1/p} cover it, overlapping in the annulus 1/p ≤ |T| ≤ p; its cotangent complex is the line bundle Ω¹ glued from O·dT and O·d(1/T) with transition `d(1/T) = −T^{−2} dT`, of degree −2; on each piece it is the solid cotangent complex of 4.5 of the overconvergent disc algebra, and the gluing is the content of the statement for a Berkovich space that is not affinoid."

6. **F06** (P3) supplier contracts: sections that *Needs:* lines use are missing from the "Sections consumed" lists

   **Location.** README:90 (EnhancedDerivedSheaves) against README:217 and README:331; README:86 (AnalyticStacks) against README:41.

   **Witness.** README:217 needs EnhancedDerivedSheaves §E0.8, §E5:presentability.1, §E5:presentability.2; none is in the list at README:90 (mechanical comparison of all 93 *Needs:* lines with the lists: these three are the only misses). README:41 uses "CondAni is AnalyticStacks §2.1"; §2.1 is not in the list at README:86.

   **Repair.** README:90: add "κ-filtered diagrams, accessibility and presentability (§E0.8), compact generation and Ind-completion (§E5:presentability.1), presentable categories and their limits (§E5:presentability.2)" to the sentence and "§E0.8, §E5:presentability.1, §E5:presentability.2" to "Sections consumed". README:86: add "§2.1"; add to README:603 the edge "AnalyticStacks §2.1".

7. **F07** (P3) PrismaticCohomologyPartII §3.9 is cited for statements made in its §3.8 and §3.11

   **Location.** README:1593: "the integral Breuil–Kisin twist of PrismaticCohomologyPartII §3.9, built as a limit of I_k/I_k² along transition maps divided by p"; README:1607: "matching [p]_q·φ(e) = e of PrismaticCohomologyPartII §3.9"; README:200.

   **Witness.** PrismaticCohomologyPartII at its open head: §3.9 defines the twist of any prism as a colimit over transversal prisms and says "`A{1}` has no canonical generator even when I is principal; a generator is extra structure (§3.11)"; the divided inverse limit is "### 3.8 Breuil–Kisin twist of a transversal prism"; `φ(e_A)=[p]_q^−1e_A` is in "### 3.11".

   **Repair.** README:1593: "of PrismaticCohomologyPartII §§3.8–3.9, built for transversal prisms as a limit of I_k/I_k² along transition maps divided by p (§3.8)". README:1607: "matching φ(e_A) = `[p]_q^{-1}e_A` of PrismaticCohomologyPartII §3.11 and the Frobenius φ^*A{1} ≅ I^{-1} ⊗ A{1} of §3.9". README:200: "Breuil–Kisin twists of prisms (§§3.8–3.9) and their generator on the q-de Rham prism (§3.11)". README:1641: add §3.8, §3.11.

8. **F08** (P3) 9.8/9.9 normalization Checks leave a factor p between the rational and the integral generator

   **Location.** README:1630: "log_Δ(q) = log(q) = (q − 1)·e for the generator e of 9.8 … compare PrismaticCohomologyPartIII §6.10, where (q − 1)e_A = log_Δ(q^p) integrally."

   **Witness.** Additivity gives log_Δ(q^p) = p·log_Δ(q) = p(q − 1)e, so the two formulas agree only if e_A = p·e. The Frobenius identity of README:1607 does not see this: φ(pe) = `[p]_q^{-1}`·pe. As written the "normalization Check" (README:201) pins e only up to p^ℤ.

   **Repair.** Append to README:1630: "Since log_Δ(q^p) = p·log_Δ(q) = p(q − 1)e, the two formulas agree exactly when the integral generator is e_A = p·e; the Frobenius identity φ(e) = `[p]_q^{-1}e` of 9.8 holds for both and does not distinguish them, so the comparison of generators is this relation, to be proved with the comparison of the two logarithms and not assumed." Tested: with e_A = p·e, (q − 1)e_A = p(q − 1)e = log(q^p).

9. **F09** (P3) terms used without a definition or a locator

   **Location and witness.** "bounded affinoid ℚ_p-algebra" (README:476, README:843): 1.1 defines only "bounded solid ℚ_p-algebra" (ABLB line 1828 uses the source's synonym). "weakly representable in arc-diamonds" (README:969, README:978): defined at ALRS line 10104–10106, not here. "smoothoid" (README:1542, README:1564): no definition, no locator. "pro-Berkovich-étale" (README:2086, README:2094, README:2101): no definition (ALRS line 8652 uses it without one).

   **Repair.** README:476 and README:843: write "bounded solid ℚ_p-algebra (1.1)". README:969: after "weakly representable in arc-diamonds" insert "(some arc-cover X′ → X by a perfectoid space has Y ×_X X′ admitting a quasi-pro-étale surjection from a perfectoid space; ALRS line 10104)". README:1542: define the term at its first use, "for a smoothoid X over an affinoid perfectoid D, that is, a rigid space X with a rigid smooth map X → D (4.2), the setting of 11.4" (ALRS line 3687 uses the word without a definition), and keep it at README:1564. README:2086, README:2094, README:2101: either define "pro-Berkovich-étale" at README:2086 with its hypotheses, or delete the three mentions and let the Check at README:2101 read "An open immersion of Berkovich spaces is †-formally étale (4.2) with perfectoidization an open immersion, hence Δ-!-able by (1)"; the term is the source's example (ALRS line 8652) and no other target uses it.

10. **F10** (P3) the plan's `gaps` list and the README's contracts disagree

   **Location.** `packages/RationalAnalyticPrismatization/design/plan.json`, top-level `gaps`; README:35–201.

   **Witness.** `gaps` has 21 entries. Two (`gestalten-affine-proper`, `gestalten-transmutation`) have `supplier: none`, although README Layer 0 (0.2–0.5) now states their content as targets. Eighteen name AnalyticStacks, but README states none of them in the form `What AnalyticStacks must provide (gap:<slug>): …`; only `gap:proetale-v-comparison` (README:160) is declared in both places. All eighteen cited AnalyticStacks sections exist at its open head with the cited content (checked item by item, see Verified sound).

   **Repair.** Remove the two `supplier: none` entries from `gaps` (their `needs` are targets 0.2–0.5 of this roadmap), and remove the eighteen AnalyticStacks entries (each is now a citation of an existing section), leaving `proetale-v-comparison`; or, if the plan must keep them, state each in README under "From TauCetiRoadmap.AnalyticStacks" in the contract form with the same slug. A `supplier: none` gap must not survive in either file.

Four P2 findings (R01–R04) and six P3 findings (R05–R10). No P1. The whole of
`packages/RationalAnalyticPrismatization/README.md` (2235 lines) and of
`packages/RationalAnalyticPrismatization/Suggested.lean` (67 lines) was read.

## Adversarial pass: record

| Statement | Instance | Values computed | Result |
|---|---|---|---|
| 0.1 StRing as colimit | ⋃_n A^n over D(k) | in lim of CAlg(A_n); in no CAlg(A_{n+1}) (README:253) | fails for colimit in Cat∞: R01 |
| 0.1 Check, End of unit | C = D(k), A_2 = Mod_{D(k)}(1Pr) vs 1Pr | End = D(k) vs Fun^L(Ani, Ani) = Ani | sound |
| 0.2/0.4 empty Gestalt | absolute base; base D(k) | 0-th terms ∗ = ∗ so not 0-affine; over D(k) relative algebra 0 | sound (Gest line 2522–2527) |
| 0.4 affine line not 0-suave | M ↦ M ⊗ k[x] on ∏ | (∏M_i) ⊗ ⊕k ≠ ∏(M_i ⊗ ⊕k) | sound |
| 0.5 0-affine clause | level 2 of [X]_D | needs K_{D,X} = Mod_{D(X)}(1Pr) ⇔ slice Künneth | R02 |
| 1.2 Checks | ℚ_p⟨T⟩; Σ p^{−n²}T^n; Σ p^nT^{n²} | A_{≤p^{−k}} = p^kℤ_p⟨T⟩; p^{n²}r^n → ∞; p^{−n}s^{n²} → ∞ | sound |
| 1.2 ideal property | ℚ_p((T)) | T ∈ Nil†, T unit, 1 ∉ Nil†; p^nT^{−1} ↦ Σ p^{k(n+1)}T^{−k} | sound, bounded needed |
| 1.3 unit criterion | 0; ℚ_p[ε]/ε² | A^u = 0 ⇒ 0 unit ⇒ A = 0; 1 + ε ↦ 1 | sound |
| 1.5 normalization | bounded multiplicative seminorm | \|p\| ≤ p^{−1}, \|p^{−1}\| ≤ p ⇒ \|p\| = p^{−1} | sound |
| 1.6 empty localization | f = 1, g = p on ℚ_p | pT − 1 unit on radius < p | zero ring, sound |
| 2.1 law on restriction | ABLB line 2270 | inverse image is GelfStk^qfd → GelfStk | R03 |
| 2.3 D^+ vs Nuc | ∏_ℕ ℤ_p[1/p]; ⊕ ℚ_p[−n] | compact, not dualizable; π_{−n} ≠ 0 all n | sound |
| 3.6 divisors on a point | s ∈ ℚ_p | s ≠ 0: empty; s = 0: ℚ_p ⊕ ℚ_p[1] | sound |
| 4.5 Checks | A = ℤ_p ⊗_{ℤ_p[x]} ℤ_p | L = A[1], π_1 = π_2 = ℤ_p | sound |
| 4.6 square-zero Check | A = M = ℚ_p | π_0 extension of ℚ_p by ℚ_p: ℚ_p[ε]/ε² | sound |
| 4.7 P¹ Check | Gauss point | no open neighbourhood inside one closed disc | R05 |
| 5.1 weights | A¹; ∅ | special fibre BG_a(−1); ∅^cone = G_m/G_m | sound; matches AnalyticStacks §1.7 weight −1 |
| 6.1 radius | untilt C; φ | κ = 1; κ∘φ = pκ; κ^{−1}(0) = {p = 0}; Tau Ceti bound v([ϖ])^b ≤ v(p)^a ⇔ a/b ≤ κ | sound |
| 6.3 twist | P¹ | f_*O = O ⊕ O(−1)[−2], ω = O(1)[2] | sound |
| 8.4/9.7 BK ideal on X_cyc | log q/(q − 1) | zeros: primitive p^{n+1}-th roots, n ≥ 0; log q: all of ⊔_{n∈ℤ} | sound |
| 8.5 reciprocal radius | D at n-th copy | radius p^n in 𝒳_T, κ = p^{−n} on X^Δ; (1, ∞) avoids them | sound |
| 9.8 Frobenius of e | cyclotomic prism | φ(log q/(q−1)) = p[p]_q^{−1}·, φ(e⟨1⟩) = p^{−1}; φ(e) = [p]_q^{−1}e | sound |
| 9.9 generator | log_Δ(q^p) | p(q − 1)e vs (q − 1)e_A | factor p: R08 |
| 10.1 | ℤ/2 on ℚ_p × ℚ_p | M_2(ℚ_p) vs ℚ_p⁴ | sound (p = 2 included) |
| 10.4 criterion | (1 + p)^a; Σ p^k binom(a, p^k); g(a, b) | c_n = p^n, r < p; p^{−k}r^{p^k} → ∞; α_1 fails | sound |
| 10.4 Legendre bounds | v_p(⌊α_i/p^h⌋!) | between α_i/(p^h(p−1)) − 2 − log_p(\|α\|+1) and α_i/(p^h(p−1)) | sound |
| 10.4 \|p\|_ϖ | ℚ_p(p^{1/2}), ϖ = p^{1/2}; ℚ_p, ϖ = p² | 1/4; 2^{−1/2} | sound |
| 10.8 π_{−1} | G = ℤ_p, A = Λ° | killed by ϖ^ϵ iff 2^{−ϵ}r^{w(γ)} ≤ 1 | sound |
| 10.6/Lean docstring | X = ℤ_p^cont | D(ℚ_p) vs D(ℤ_p^sm/ℤ_p^la) | h^* not fully faithful: R04 |
| 11.1 twisted form | K = ℚ_{p²} | untwisted: 2, 4, 0; RΓ(Gal_K, ℚ_p): 1, 3, 0 | README right; source wrong (Source issues) |
| 11.2 | C_p(n) | n ≠ 0: 0; n = 0: K, K, 0 | sound |
| 11.7 | K of degree n | dim H¹ = n + 1; χ = −n | sound |
| 12.1 cusp | R = ℚ_p⟨x, y⟩/(y² − x³) → k | L = k²[1] ⊕ k[2] | sound |
| 12.2 modulus | mirabolic, a = p, K = ℤ_p ⋊ (1 + pℤ_p) | [pℤ_p : ℤ_p] = p^{−1} (HM line 4927) | README sound |
| 12.2 ω_{A¹/G_m} | I[1] ⊗ O[−1] | I | sound |
| 12.4/12.5 | P¹ | f_*O = O ⊕ O{−1}[−2]; dual O ⊕ O{1}[2] | sound |

## Dependency check

    depcheck: 256 roadmaps, 2452 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. All 93 *Needs:* lines were also compared mechanically with the section numbering: no forward or self reference.

## Verified sound

- **Suggested.lean.** 0 declarations, one module docstring, `import Mathlib` only, no `set_option`, no `sorry`'d data. The `#check` scratch elaboration was not run: there is no declaration to check. Seven headline theorems are listed (README 11.6 with 11.1 and 11.4; 11.7; 11.2, 11.5, 11.8; 10.12 with 11.9–11.10; 12.2–12.4; 12.5; 12.6), the same seven as the README Summary. Each needs Gelfand stacks, which the pins lack (no analytic rings, six-functor formalisms or analytic stacks in the pinned Mathlib or Tau Ceti; `TauCeti.FarguesFontaine.spaX` is a topological space), so none is statable and none is missing. No padding.
- **Targets.** 93 numbered sections read in full; every one has a *Needs:* line, a locator and at least three Checks (372 Checks in all; about 70 recomputed, 35 rows above).
- **Locators.** 585 line locators. 441 labelled ones checked mechanically (label within three lines of the cited line, page within one): 413 pass; the other 28 were read at the cited line and are sub-item or mid-proof pointers inside the cited item. Statements of ALRS Theorems 6.3.1, 6.5.4, 6.5.8, Propositions 4.2.13, 6.5.10, 6.6.7, 6.7.1, Corollary 6.5.11, Theorem 4.7.2, Lemma 5.2.10, Construction 2.1.2, Remarks 2.1.3–2.1.4; Gest Definitions 3.13, 6.1, 6.5, 6.9, 6.12, Propositions 6.2, 6.13, 6.14, 6.21, 7.9, 9.3, 9.5, Corollary 9.8, Remark 9.6, Warning 6.7, §§8.1, 8.2, 8.6, 8.8; ABLB Definitions 2.1.1, 4.2.14, 4.3.1, Lemma 4.2.7, Proposition 3.3.5, Theorem 6.3.1; HM Example 5.3.21 were compared with the README's hypotheses and agree, apart from the findings.
- **Pinned declarations.** 23 checked at the cited file and line (10 Mathlib, 13 Tau Ceti); all exist as described.
- **Sibling citations.** 34 roadmaps, 134 section ids: every id resolves to a heading on main, at the open head, or (MotivesAndAlgebraicCyclesPartII) in the board package. Item-level content checked for AnalyticStacks §2.3(1), (7), §4.2, §4.3(1), §4.4(1), (3)–(6), §4.5, §6.3(1), §6.5(3)–(4), §7.3, §7.5, §7.7, §1.7 (weight −1, differential raising weight), its scope note on Gestalten and its consumer note; PadicHodgeTheory §7.1 (M(E[1]) = tM(E)); PrismaticCohomologyPartII §4.13 (Θ = n); PrismaticCohomologyPartIII §6.10; FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.P7.2 (HT(χ_p) = +1); TropicalAndBerkovichArithmetic §0.30 (closed subdisc quasi-étale, not étale); LocallyAnalyticDistributionsPartII §1.5; EnhancedDerivedSheaves `isDescendable_colimit_of_uniformIndex`; the quoted headings of VectorBundlesAndIsocrystals and FarguesFontaineDiamonds; MotivesAndAlgebraicCyclesPartII §§0.2–0.4, 0.6.
- **Ownership.** `roadmaps grep` for Gestalt, Stefanich, Gelfand stack, twistor stack, analytic prismatization: only AnalyticStacks mentions them, and it places them outside its scope. No second owner; no declaration name to collide.
- **Gap.** `gap:proetale-v-comparison`: the same slug in plan and README, precise; DiamondsAndVStacks §D6.5 on main is the étale-site comparison only, and no roadmap on main or at an open head states the pro-étale/v comparison.
- **Policy.** The pull request changes only the package folder; no pull-request numbers, process words, `lemma` or `set_option` in README or Lean.
- **Wording.** Longest runs of nine or more words shared with ALRS, ABLB, Gest, HM and RCSolid computed for the whole README and Lean file: apart from formulas and bibliographic titles the longest is 14 words (the statement of Gest Remark 9.6(4), README:304), a forced statement; README 1.1 was put beside ABLB line 609–621 and 10.3 beside ALRS line 5137–5146 by hand.

Source independence: whole README and Lean file compared with 5 sources (ALRS, ABLB, Gest, HM, RCSolid) by shared word runs, plus 8 passages by hand, none shared; largest share ALRS, 378 of 585 line locators; contents compared with ALRS (ALRS line 15–67): independent at the level of layers (13 layers against 6 chapters and an appendix: Layer 0 from Gest, Layer 1 from ABLB, Appendix A inside Layer 4, §3.1 inside Layer 5, §4.7 split between 8.7 and 9.3, §5.1 last as 10.12, 11.3 from §4.10); inside Layers 7, 9, 10 and 12 the subsections 7.1, 7.4–7.6 ↔ §§3.3, 3.5–3.7, 9.7–9.9 ↔ §§4.8–4.10, 10.6–10.11 ↔ §§5.3–5.8, 12.5–12.6 ↔ §§6.6–6.7 run in the source's order, which the *Needs:* chains 7.1 → 7.2 → 7.3 → 7.4, 7.2 → 7.5 → 7.6, 9.7 → 9.8 → 9.9 and 10.6 → 10.7 → 10.9 → 10.10 → 10.11 force.

## Not verifiable

- ALRS Remark 6.5.5 (ALRS line 8819) against README:2122: which of |a|_p and |a|_p^{−1} the modulus of the mirabolic takes depends on the action convention; the README's value follows HM line 4927 and AnalyticStacks' Check for the Borel, but I did not settle whether the source's remark is a slip or another convention.
- README:1781 (ALRS Remark 5.4.4 citing "Lemma 3.2.8") and README:76 (ALRS citing RC26a "Theorem 3.2.27"): the claimed mis-citations in the source were not opened.
- About 300 of the 372 Checks, and the proof routes of Layers 10–12, were read for consistency but not recomputed.
- MotivesAndAlgebraicCyclesPartII is neither on main nor in an open roadmap pull request; its Layer 0 was read in the board checkout (`packages/MotivesAndAlgebraicCyclesPartII/README.md`), whose last review is "needs_changes". Its section numbers may still move.
- Ownership against the 206 open roadmap pull requests whose files the brief does not list by path was checked only through `roadmaps grep`, not by reading them.
- Whether a formalism with Künneth over ∗ and failing it over an "affine" X exists (a strict counterexample for R02) was not constructed; R02 rests on the equivalence in Gest Proposition 9.3.

## Source issues

- **Error** in ALRS at Remark 6.1.5, p. 145: the source says that for K/ℚ_p unramified the twistor stack of GSpec(K) is the plain product GSpec(K) × Div¹; it should be the Frobenius-twisted quotient (GSpec(K) × Div¹~)/(σ × φ)^ℤ, since H⁰ must be ℚ_p and not K; affects a stated result.
- **Misprint** in ALRS at Proposition 3.7.4(2), p. 56: the source's displayed square has the de Rham stack of G_a in its lower left corner; it should be B(G_a^an ⊗ D_{−λ}), as its proof and the deduced extension say; affects nothing.
- **Misprint** in ALRS at Theorem 6.5.8(3), p. 164: the source applies the upper shriek of f^{Div¹} to the structure sheaf of the twistor stack of Y; it should be the structure sheaf of the twistor stack of X; affects nothing.
- **Misprint** in ALRS at Example A.2.12, p. 181: the source reduces to affinoid X "by Example A.2.12", citing itself; it should cite Lemma A.2.11; affects nothing.

## For the human reviewers

- **Scope.** 378 of 585 line locators point into ALRS, a 2026 preprint on an author page; Layer 0 rests on Gest, lecture notes on an author page (73 locators); ABLB and RCSolid are arXiv preprints of 2025–2026. No refereed source states the headline theorems.
- **Licence.** `sources.toml` records ALRS with `licence_class = "author-page"`; Gest and Sch24 are likewise author-page copies of unpublished texts.
- **Scope.** The supplier MotivesAndAlgebraicCyclesPartII (README:96) is a board package under review, not on main and not an open roadmap pull request; it is the entry just before this roadmap in the merge order.
- **Arrangement.** Layers do not map one to one onto ALRS chapters, but 15 subsections (7.1, 7.4–7.6, 9.7–9.9, 10.6–10.11, 12.5–12.6) each match one ALRS section in the same order; earlier reviews and this one judged the order forced by dependencies.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "61666d4c52d2232c64a38114afc72f6c5dace9e5", "job": "RT-RationalAnalyticPrismatization~1b", "model": "fable", "worker": "chris-x26"} -->
