<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/241#issuecomment-6405875893 -->
Review (claude) of ba4c70d

Verdict: accepted
Conditional on the announced gaps: `flat-microlocalisation`, `algebraic-quotient-comparison`, `integral-central-faithfulness`, `generic-cyclic-growth`, `skew-rank`, `canonical-dimension-zero`

1. **F01** (P3) §5.3's route names the SL₂(ℤ) amalgam and its cohomology sequence without a locator or owner

   **Location.** `design/README.md:572`: "The parabolic cohomology Euler characteristic from SL₂(ℤ)=C₄*_{C₂}C₆ and the induced coefficient system computes m(σ)+m(σ^ι)"; the same sentence in `design/plan.json`, node `WM.5/finite-type-dimension`, proof step 2. The locator at line 570 is fgt10 Proposition 4.18 only.

   **Claim.** The decomposition SL₂(ℤ)≅ℤ/4∗_{ℤ/2}ℤ/6 and the cohomology exact sequence of an amalgam (which give dim H¹(SL₂(ℤ),W)=dim W−dim W^{C₄}−dim W^{C₆}+dim W^{Γ} when −I acts trivially) are inputs of the route.

   **Witness.** fgt10 line 1346–1347 (p. 25) names this route without proving it. No roadmap on main or at the 367 open heads states the amalgam ℤ/4∗_{ℤ/2}ℤ/6 (grep for `C₄*_{C₂}C₆`, `ℤ/4 *_{ℤ/2} ℤ/6`, `SL₂(ℤ) … amalgam`); ModularCurvesPartII §15.2 (head of its pull request, lines 4171–4190) owns a different object, the Ihara-type amalgam Γ_N(ℤ[1/p])=Γ(N)∗_{Γ(N)∩Γ₀(p)}A⁻¹Γ(N)A, and itself cites Serre's *Trees* for the tree-action theorem. The brief admits a standard textbook for a standard fact; none is cited here.

   **Exact repair.** This review fetched the legal Numdam copy of Serre, *Arbres, amalgames, SL₂* (Astérisque 46, 1977) through the sources service; it is recorded in `sources.toml` as `serre77` (open repository, certified). In §5.3's locator parenthetical add "serre77, I §1.5.3, p. 20 and I §4.2 Example (c), p. 52 (the amalgam); II §2.8, p. 169 (the cohomology exact sequence of an amalgam)", add the matching bullet to `## References`, and add `serre77` to the plan node's sources. Tested on the instance that pins the route: at N=1, σ=1, k=12, W=V₁₀, the sequence gives dim H¹=11−(11−1)/2−(11−2)/3=11−5−3=3, and 3−dim W^{T}+dim(W*)^{Γ}=3−1+0=2=2·dim S₁₂, as §5.3's Check at line 581 requires; at k=2, W=ℂ: 1−1−1+1=0 and 0−1+1=0=2·dim S₂.

2. **F02** (P3) §5.6's "2∉R" branch of the positivity argument is vacuous

   **Location.** `design/README.md:626`: "If 2∉R, A_F/B_F≥(2/3)·3^s>1; if 2∈R, A_F/B_F≥(5/3)·3^{s−1}>1"; the same sentence in `design/plan.json`, node `WM.5/base-change-linear-count`, proof step 3.

   **Claim.** The case split presents B_F≠0 with 2∉R as a possible case.

   **Witness.** B_F≠0 requires every odd ℓ∈R to be ≡1 mod 4 (line 624). If 2∉R the discriminant is −d with d=∏_{ℓ∈R}ℓ squarefree and −d≡1 mod 4, so d≡3 mod 4; a product of primes ≡1 mod 4 is ≡1 mod 4. Hence B_F≠0 forces 2∈R (ℚ(i): disc −4; ℚ(√−5): disc −20; ℚ(√−65): disc −260). The clause is true but never applies.

   **Exact repair.** Replace the two-case sentence by "B_F≠0 forces 2∈R, since an imaginary quadratic field all of whose odd ramified primes are ≡1 mod 4 has discriminant −4d; then (2^{ν₂}+1)/2≥5/2 and each odd factor (ℓ+1)/2≥3 give A_F/B_F≥(5/3)·3^{s−1}>1." Tested: F=ℚ(i), s=1: A_F/B_F=(5/24)/(1/8)=5/3; F=ℚ(√−5), s=2: A_F=(1/24)(5)(6)=5/4, B_F=1/4, ratio 5≥(5/3)·3=5.

Reviewed at head ba4c70d of the board pull request (the checkout was already at that head; nothing was fetched or changed in the design). Files read: `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md` (767 lines), `design/plan.json` (30 nodes, 6 gaps, 10 source issues, acceptance test), `sources.toml`, the round-3 review and the round-4 repair report. The round-3 finding was checked first at this head; the adversarial pass then covered every passage the repair changed or added (§5.3, §5.6, E10, the plan node `WM.5/finite-type-dimension`), the repaired pattern elsewhere, the fifteen sampled targets, the headlines, and the sections the round-3 table had no computed rows for (§§1.2, 1.3, 2.4, 3.2, 4.4, 5.5, 5.7). Two P3 notes; nothing blocking. Acceptance is conditional on the six declared supplier gaps listed in `review.json`.

## Verified sound

### Round-3 finding, checked at ba4c70d

| Round-3 finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01 (P1) general-σ fixed-type statement on an unowned Lefschetz input and a source formula false for σ≇σ^ι | Repaired | Line 570: "σ of G_N=SL₂(ℤ/Nℤ) with σ^ι≃σ, where ι=diag(−1,1) and σ^ι=σ∘Ad ι; this holds for the restriction to G_N of every representation of GL₂(ℤ/Nℤ)" and the explicit formula "(k−1)dim σ/12−½dim σ^{U_N}+ε_k tr σ(S₄)+μ_k tr σ(S₃)+δ_{k,2}dim σ^{G_N}", ε_k=(−1)^{k/2}/4 (k even), μ_k∈{0,−1/3,1/3} by k mod 3: matches fgt10 lines 1340–1345 (Proposition 4.18, p. 25) and (4.7) lines 1276–1286. Line 572: the sentence "For general σ … the holomorphic Lefschetz … gives m(σ) itself" is gone; the route now says "hence 2m(σ) under the hypothesis σ^ι≃σ … without it the cohomology computes only m(σ)+m(σ^ι)". Line 582: the N=3, k=4 Check is the negative control ("3/12+1/4=½, not an integer, whereas for the ι-stable σ=ω⊕ω̄ it gives 6/12+2/4=1"). Line 583: new N=2 Check. Line 626: §5.6 cites §5.3 and says why the hypothesis holds (tensor products of §5.4 types are restrictions of GL₂(ℤ/Nℤ)-representations; ι∈GL₂(ℤ/Nℤ) has det −1 and τ(ι) intertwines σ and σ^ι). Lines 751–756: E10 recorded as an Error with the N=3 instance. plan.json: node hypotheses now two entries, proof step 2 and acceptance updated, `sourceIssues` E10, fgt10 `cited_for` in plan and manifest "E1, E10". Needs line unchanged (ModularForms §10C; ModularSymbolsPadicLFunctions §0.7), and no unowned input remains except the standard amalgam fact of R01. |

The round-2 items the repair reports settled (`not actionable in this package`) were not re-raised.

### The repaired formula, rederived

I rederived §5.3 independently from the route it names. With W=V_{k−2}⊗σ* (so −I acts trivially under the parity hypothesis), the amalgam sequence gives dim H¹(SL₂(ℤ),W)=dim W−dim W^{C₄}−dim W^{C₆}+dim W^Γ with dim W^{C₄}=(dim W+Re tr_W(S₄))/2 and dim W^{C₆}=(dim W+2Re tr_W(S₃'))/3; the cusp sequence gives dim H¹_par=dim H¹−dim W^{T}+dim(W*)^Γ, dim W^T=dim σ^{U_N} (one Jordan block against the semisimple σ*(T)), and dim W^Γ=dim(W*)^Γ=δ_{k,2}dim σ^{G_N} (Zariski density of Γ(N) for k>2). With tr_{V_{k−2}}(S₄)=−(−1)^{k/2} (k even; 0 for k odd) and tr_{V_{k−2}}(S₃')=1,0,−1 for k≡2,1,0 mod 3, the identity dim H¹_par=m(σ)+m(σ^ι) yields exactly the displayed formula with Re tr σ in place of tr σ; for σ^ι≃σ the traces at S₃ and S₄ are real because ιS₄ι=S₄⁻¹ and ιS₃ι is SL₂(ℤ)-conjugate (by T) to S₃⁻¹. The formula therefore holds for every k≥2, including odd k, under the two stated hypotheses, and the convention g·f=f|_kγ⁻¹ versus f|_kγ does not matter under them (it conjugates the traces and fixes dim σ^{U_N}).

### Source sample

All five previous manifest entries are certified legal copies (arXiv, author pages); the sixth, `serre77`, was added by this review (Numdam, open repository). No locator is flagged unverified; `needs-references.toml` was not needed. Lines are the cached extractions.

| Target | Read | Result |
| --- | --- | --- |
| 1.1 multiplicity and H₀ | fu24 lines 1116–1121 (p. 22) | Hom(M̃,W_k)≅Hom(M̃⊗W_k*,1)≅H₀(G,M̃⊗W_k*)*: matches; the README's continuity and lattice clauses are its own obligations, as declared. |
| 1.4 torsion bound | fu24 lines 1128–1131 (p. 23) | Cyclic subquotients Q̃_i with ℚ_p[[G]]/ℚ_p[[G]]δ_i↠Q̃_i, δ_i generic by Thm 5.1, summed polynomials: matches §§1.3–1.4. |
| 2.1 free approximations | fu24 (33)–(34) lines 1122–1123 (p. 22) | 0→ℚ_p[[G]]^d→M̃→Q̃→0 with Q̃ torsion and 0→Ñ→ℚ_p[[G]]^l→M̃→0: matches; rank Ñ=l−d at line 1142. |
| 2.2 upper estimate | fu24 lines 1131–1139 (p. 23) | Microlocalised (33), W_k-quotient, H⁰≤d∏(k_i+1)+p_Q: matches, and the README's right-exactness-only reading is what the display uses. |
| 2.3 lower estimate | fu24 lines 1140–1142 (p. 23) | "the other side … using rank N̂+rank M̂=l": matches the README's cancellation. |
| 2.5 syzygies | fu24 (35)–(36) lines 1143–1149 (p. 23) | Four-term sequence in degree one, shift for i≥2: matches, including the three-dimension identity. |
| 2.7 finite support | fu24 lines 142–143 (p. 4); aw13 lines 3598–3604 (§10.12) and 3623–3625 (Lemma, p. 77) | d(M)=0 iff finite-dimensional, stated under §10.12's hypotheses "p^{m+1}𝔤=R⊗L_G for some integer m>0", that is the (m+1)-st congruence kernel with m≥1; the first congruence kernel is m=0, which is exactly what the README's gap wording "including deformation index zero" asks the supplier for. |
| 3.3 realizations | fu24 (37) line 1161 (p. 23); marshall12 (7) line 174 (p. 4), (29) line 609, Lemma 11 lines 631–658 (pp. 15–16) | One representation ρ over the Galois closure with ρ⊗_σℂ≅W_d and ρ⊗_𝔭ℚ_p≅V_d: matches. |
| 4.1 cuspidal dimensions | fu24 (2) line 80 (p. 2); marshall12 lines 123–129 (pp. 3–4) | 2^{r₁}dim S_d when dim W_d>1, with Marshall's H^i_c defined as classes vanishing near the cusps: matches E1 and the README's interior reading. |
| 4.2 sharp global bound | fu24 Theorem 1.2 lines 89–90 (p. 2) | dim S_k(K_f)≤_{K_f}(min k_i)^{−1}O(Δ(k)) for F not totally real: matches; the README's "no asymptotic equality" agrees with Corollary 1.3's "∼" being only for compactly supported cohomology (E4). |
| 4.3 parallel weights | fu24 lines 93–94 (p. 3) | O(k^{r−1}): matches. |
| 5.1 cusp torus | fu24 Corollary 1.3 lines 95–98 (p. 3); fgt10 lines 122–129, 146–150 (pp. 3–4) | Boundary components are tori or spheres; Serre's half-dimension; at Γ∩P⊆±U with n+m even the degree-one image has the number of cusps as dimension: supports the README's c,2c,c with image c. |
| 5.2 support bridge | fgt10 (1.2)–(1.6) lines 127–160 and lines 150–152 | Cuspidal = kernel of boundary restriction; degree-two image everything except n=m=0, codimension one: matches the n=0 clause. |
| 5.3 fixed type | fgt10 lines 1340–1349 (Proposition 4.18, p. 25), (4.7) lines 1276–1286 (p. 24) | Formula read; the source states it for every σ with σ(−I)=(−1)^k (E10, re-confirmed below); the source writes "ρ_k" for the order-three coefficient defined as μ_k in (4.7) (Source issues). |
| 5.4 ramified types | fgt10 Definition 4.3 lines 1094–1099 (p. 20); lines 1352–1373 (pp. 25–26); Lemma 4.19 lines 1375–1396 (p. 26); lines 1404–1407 | Every dimension, invariant count, trace and parity of the §5.4 API, both dyadic cases, the (2,2) parity exception and "U_N-invariants only if all components are principal series" match. |
| 5.5–5.6 (route of R02) | fgt10 Propositions 4.10–4.11 lines 1194–1216 (pp. 22–23), Proposition 4.6 lines 1136–1141, L(K) lines 1125–1129, ν_{L,n} lines 1181–1193, Theorem 4.17 lines 1288–1308 (pp. 24–25), lines 1408–1410 | The §5.5 count, the 2^{−|R(π)|} weight (twist classes of size 2^{|R(π)|}), ℒ(F), ν and the principal-component formula match; A_F=(1/24)∏(p^{ν_p}+1) and c₂=2^{|R|−4} under the 1 mod 4 condition match Theorem 4.17. |
| 5.7 restriction and transfer | fgt10 lines 940–945 (§3.2, pp. 16–17) | tr∘res is multiplication by [Γ:H]: matches. |
| gap:integral-central-faithfulness | aw14 lines 491–492 (§4.6 Theorem, p. 11), 742–743 (§5.4 Theorem, p. 16) | Annihilator generated by ker χ_λ when p is very good; affinoid Verma faithful for every R-linear λ: matches the gap as declared. |
| serre77 (R01) | lines 625–627 (§1.5.3, p. 20), 1516–1530 (I §4.2 Example (c), p. 52), 5195–5203 (II §2.8, p. 169), 5354–5357 (II §2.9, p. 174) | SL₂(ℤ)≅ℤ/4∗_{ℤ/2}ℤ/6 with generators S₄ and an element of order 6; the cohomology exact sequence of an amalgam; the Euler–Poincaré formula for an amalgam. |

### Adversarial pass (changed passages, sampled targets, headlines, previously unrowed sections)

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §5.3 formula, N=1, σ=1 | k=2,4,6,8,10,12,14,16,18 | 0; (3−6+3)/12=0; (5−6−3+4)/12=0; (7−6+3−4)/12=0; (9−6−3)/12=0; (11−6+3+4)/12=1; (13−6−3−4)/12=0; (15−6+3)/12=1; (17−6−3+4)/12=1 | agrees with dim S_k(SL₂(ℤ)) at every k |
| §5.3 wrong models at N=1, k=12 | ε_k sign reversed; μ_k sign reversed; +½dim σ^U | (11−6−3+4)/12=½; (11−6+3−4)/12=⅓; 11/12+½+¼+⅓=2 | each excluded by integrality or by the Check at line 581 |
| §5.3, N=2 (G₂≅S₃, ι≡I) | k=2; k=6; k=8; types 1, sgn, std with (dim σ^U, tr S₄, tr S₃)=(1,1,1),(0,−1,1),(1,0,−1) | k=2: 0,0,0; k=6: 0,1,0 (total 1=6/2−2); k=8: 0,0,1 (total 0+0+2·1=2=8/2−2) | agrees; sgn at k=6 is consistent with dim S₆(Γ₀(2))=−5+1+4=0 and std at k=8 with dim S₈(Γ₀(2))=1 |
| §5.3, N=3, even k, ι-stable types 1, ω⊕ω̄, 3-dim (dim σ^U=1,0,1; tr S₄=1,2,−1; tr S₃=1,−1,0) | k=4; k=6; k=8 | k=4: 0, 1, (9−6−3)/12=0 → 1=dim S₄(Γ(3)); k=6: 0, (10−6−4)/12=0, (15−6+3)/12=1 → 3=k−3; k=8: 0, (14+6+4)/12=2, (21−6−3)/12=1 → 2+3=5=k−3 | agrees with dim S_k(Γ(3))=k−3 |
| §5.3, N=3, odd k (σ(−I)=−1): ρ (2-dim, real character; dim ρ^U=0, tr S₃=−1) and ρ⊗ω⊕ρ⊗ω̄ (dim 4, two U-invariants, tr S₃=1) | k=3 (μ₃=1/3); k=5 (μ₅=−1/3) | k=3: ρ gives 4/12+(1/3)(−1)=0, the sum gives 8/12−1+(1/3)(1)=0 (total 0=dim S₃(Γ(3))); k=5: ρ gives 8/12+(−1/3)(−1)=1, the sum gives 16/12−1+(−1/3)(1)=0 (total 2·1+0=2=dim S₅(Γ(3))) | odd-weight case of the formula agrees; ρ⊗ω alone gives (1−ω)/3, non-real, and is excluded by the hypothesis |
| §5.3 negative control | N=3, k=4, σ=ω; σ=ω⊕ω̄ | 3/12+1/4=½; 6/12+2/4=1=m(ω)+m(ω̄) (S₄(Γ(3))=ℂη⁸, T acts by ζ₃) | hypothesis necessary; Check at line 582 correct |
| §5.3 hypothesis for §5.6's types | τ_ℓ a GL₂(ℤ/ℓ^ν)-type; ⊗_ℓ τ_ℓ | ι=diag(−1,1)∈GL₂(ℤ/Nℤ) (det −1); ⊗τ_ℓ(ι) intertwines σ with σ^ι | line 626 correct |
| §5.6 leading coefficients from the §5.3 route | parity-admissible types with weight 2^{−|R(σ)|}dim σ/12; f_ℓ=1+ω_ℓ(−1)ℓ^{ν−1} (odd ℓ), f₂=3ω₂(−1) (ν₂=2), 1+4ω₂(−1) (ν₂=3) | (n+1)[∏(ℓ^ν+1)/24+(−1)^n∏f_ℓ/24]; ℚ(i): f₂=−3 → 5/24+(−1)^{n+1}/8; all odd ℓ≡1 mod 4 and 2∈R: ∏f_ℓ=−3·2^{s−1} → c₂=2^{s−4}; some ℓ≡3 mod 4: ∏f_ℓ=0 | reproduces A_F and B_F of Theorem 4.17 (the summation fgt10 omits) |
| §5.6 positivity | ℚ(i) s=1; ℚ(√−5) s=2; ℚ(√−3) | 5/24−1/8=1/12>0; 5/4−1/4=1>0; A=1/6, B=0 | A_F>B_F≥0; the 2∉R branch never occurs (R02) |
| §5.5 Checks | |R(π)|=2; ℚ(i) n=0,1; ℚ(√−3) n=0,1,2 | 4·¼=1; ν h/2=0, ½; (0,0,½) | agree with fgt10 Proposition 4.6 and lines 1183–1192 |
| §5.4 ℓ=3 | principal series (1,ω) on ℙ¹(𝔽₃); supercuspidal | dim 4; T-orbits {∞} and the three affine points → 2 invariants; S₃ one fixed point, trace 1; S₄ no fixed point, trace 0; supercuspidal dim 2, traces (−1,2), parity −ω₃(−1)=+1, S₄∈Q₈ | match lines 594–596, 605 |
| §5.4 ℓ=5 (not in the Checks) | principal series; supercuspidal | S₄ eigenvalues ±2∈𝔽₅ give two fixed points with ω(2)=2²=−1, trace −2=2(−1)^{(5−1)/4}; S₃: 5≡2 mod 3, trace 0; supercuspidal dim 4, S₃ trace −2, S₄ trace 0, parity −1 | match the API formulas |
| §5.4 ℓ=2 | (2,2); (2,3) | ℙ¹(ℤ/4): orbits of sizes 4,1,1 with χ-values 1,−1,1 → 2 invariants; dims 6,2 and 12,4; S₄ has no fixed point mod 4 | match lines 593–604 |
| §5.4 tensor law | PS(ℓ=3)⊗SC(2,2) | dim 8, invariants 0, S₃ trace 2, parity (−1)(−1)=+1 | multiplicative |
| §5.1 | n=0; n=2; z₁=1, z₂=i | (1,2,1); Koszul (9,18,9), ranks (8,8), cohomology (1,2,1); det(1 1; i −i)=−2i≠0 | Checks correct |
| §5.2 | c cusps, n>0; n=0 | kernel of H¹_c→H¹ has dim c, cokernel of H¹→H¹(∂) has dim c; |dim H_c^i−dim H^i|≤2c≤3c; H³_c≅ℂ, H⁰(∂)=c | safe bound; n=0 clause correct |
| §5.7 | Γ=SL₂(O_F); index r | cor∘res=r·id, r=1 identity | injectivity without neatness |
| §5.8 headline | self-dual E₂; c cusps | dim E₂=9; C(n+1)+3c≤(C+3c)(n+1) | one threshold absorbs the boundary |
| §4.2 headline | (0,1), κ=6; (1,1), κ=(4,6) | D(x)=9≤36, 27≤144; min x=3≥κ/2; Q(x)≤(Σc)D/min x≤2(Σc)Δ/min κ | saving by the smallest place weight |
| §4.3, §4.4 | (1,1) parallel κ=4; κ=6 | 4³/4=16=4²; n=2, dim E₂=9 | exponents right |
| §4.1 | (0,1); (1,0) excluded | 2⁰=1; r₂=0 never used | consistent with fgt10 (3.9) |
| §2.6 headline | M=A², k=(1,2); p=2 | h₀=12=2·6, errors 0; (1−g)(1+g)=0 for g=−I in the first kernel at p=2 | odd p necessary |
| §2.1 | M=A^a; M=A/Aδ; (X,Y)⊂ℚ_p[X,Y] | T=N=0, ℓ=a; a=0, ℓ=1, N=Aδ≅A of rank 1=ℓ−a; rank 1, two generators, Koszul kernel rank 1 | Checks correct |
| §2.2, §2.3, §2.5 on M=A/A(g−1), g=1+pe, m=1 | k arbitrary | dim H₀(M⊗W_k)=dim ker(e on Sym^k)=1, U_M=1; lower bound aD−U_N=0−0=0≤1; dim H₁=D−D+1=1≤U_N+U_M=0+1 | all three inequalities tight or valid |
| §2.4 | M=A^a; m=1 | difference 0; constant deviation | correct |
| §2.7 | M=W_k; W_k⊕W_k; W_k⊕W_j (j≠k) | Hom dims 1,2,1 ≤ lengths 1,2,2 | correct |
| §1.1 | M=A; M=0; W trivial | dim W both sides; 0; dim H₀(G,M) both sides | correct |
| §1.2 | δ=g−1, g=1+pe; δ unit; δ=0 | kernel 1-dimensional for every k; 0; D(k+1) excluded | constant bound at m=1 as claimed |
| §1.3, §1.4 | T=A/(X,Y) over ℚ_p[X,Y]; T=0 | controlled by A/(X) (Hom into W injects); zero coefficients | correct |
| §3.1 | (0,1), κ=6; (1,1), κ=(4,6); κ=(2,…,2) | t=(2,2), dim 9, Δ=36, min x=3; t=(2,2,2), dim 27, Δ=144; t=0, dim 1 | correct |
| §3.2 | ℚ(i), K_f=SL₂(Ô), p=5 | two places above 5, G=G_v×G_{v′} of dimension 6, index fixed before κ varies | correct |
| §3.3 | Bianchi κ=6; L/ℚ_p of degree 2; O→O by p mod p | 9 both sides; ℚ_p-dimension doubles; extra H₁ appears | correct |
| §3.4 | F imaginary quadratic | d=2, K₀ of dimension 6, cutoff 6 | matches CC-II §5.7 applied over ℚ |
| Conventions | highest weight k | ef=k, Δ=½k(k+2); k=0,1 → 0, 3/2 | Casimir normalisation pinned |
| Gaps | plan.gaps, README slugs, node prerequisites | same six slugs in all three places; every supplier named; no `none` | precise, minimal, declared |

### Ownership, suppliers, dependency check

`roadmaps grep` over main (b240a0d) and the 367 open heads, by object: no roadmap states proper-face or multiplicity-free error polynomials, the fixed-type multiplicity Hom_{G_N}(σ,S_k(Γ(N))), the ramified finite types with their S₃/S₄ traces, or the Δ(κ)/min κ bound; ModularityAndLanglandsExtensions §4.26 (head of its pull request) builds a Hecke-equivariant Bianchi Eichler–Shimura for GL₂ at Y₁(𝔫) with ideal-class components, a different object from §4.1's SL₂/F comparison imported from ArithmeticLocallySymmetricSpaces §ALS.5b.5 and AutomorphicFormsOnReductiveGroups; ModularCurvesPartII §15.2 owns the principal-level Ihara amalgam, not the C₄∗_{C₂}C₆ decomposition (R01). The board package index (14 packages) has no overlap. Ownership against the open pull requests named in the brief was checked through `roadmaps grep` only.

Supplier citations resolved this round, at the heads the index gives: ArithmeticLocallySymmetricSpaces (7dca7ea) §§ALS.0.9 (line 1404), 0.10 (1439), 1.1 (1667), 1.6–1.8 (1950–2021), 2.5 (2300), 2.8 (2403), 3.6 (2853), 4.1 (3311), 4.5–4.7 (3458–3556), 5a.2 (3925), 5b.4 (4248), 5b.5 (4324); CompletedCohomologyPartII (92dc4a1) §§3.1 (807), 4.2 (1240), 5.1 (1377), 5.6 (1474), 5.7 (1493, stated for connected semisimple G over a number field, hence for Res_{F/ℚ}SL₂ over ℚ), 6.3 (1598); NoncommutativeAndEquivariantIwasawa (3ec4ff3) §F.1 (lines 23, 415, 424), §0.12 (477), §0.14 `twist_free` (556), §0.15 `IwasawaHomology.freeTwist` and `vanish_above_dim` (583), §1.12 (875); GL2AutomorphicRepresentationsAndTransfer (69bcab7) §R16.2.9 (725), §§R17.4.2–R17.4.6 (1839–1893); AutomorphicFormsOnReductiveGroups (c00e220) §§1.1 (222), 5.2 (740), 5.3 (761); ModularSymbolsPadicLFunctions (62f31bc) §0.7 (1065; the theorem at lines 1141–1146 covers finite-index Γ with every normaliser action, including ι); on main: ModularForms §10C (line 1119), LieHighestWeight Layers 0 and 3 (`TauCetiRoadmap/RepresentationTheory/LieHighestWeight/README.md` lines 319, 405, PBW at 407), Chebotarev Layer 10 (line 410). All are earlier than the candidate's insertion point. `roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere.

Pinned declarations reopened at the manifest pins (Mathlib 6b7abb3c, Tau Ceti a91d3aaf), each at the README's line: `Finset.prod` (Defs.lean:67), `Fintype.prod_equiv` (741, namespace Fintype opens at 705), `Fintype.prod_empty` (753), `Finset.prod_const_one` (391), `Finset.prod_update_of_mem` (Piecewise.lean:247), `Finset.prod_pos` (GroupWithZero/Finset.lean:157), `Finset.powerset` (Powerset.lean:31), `MvPolynomial` (MvPolynomial/Basic.lean:79, an `abbrev` over a `CommSemiring`), `Module.finrank_tensorProduct` and `Module.finrank_baseChange` (Constructions.lean:373, 376), `groupCohomology` (GroupCohomology/Basic.lean:184, the homology of `inhomogeneousCochains A`, no topology), `TauCeti.symPowerRep` (SymmetricPower.lean:59, `(stdRep k n).symmetricPower d` over `CommRing k`), `SymmetricPower.finrank_eq` (Basis.lean:203 with `StrongRankCondition`, `Module.Free`, `Module.Finite`), `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration` (PBW/Basic.lean, line 37 of its header) and `Module.Basis.pbwBasis` (PBW/Basis.lean:93). All as the README describes them.

Dependency check, verbatim:

```text
candidate: ArithmeticLocallySymmetricSpacesPartII is not in the merge order yet; checked as if placed after CompletedCohomologyPartII (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 636 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

Principles and policy: no route-specific shortcut (odd p is forced at p=2 by −I in the first congruence kernel; the global theorem covers every compact open); no re-planned roadmap; no copied passage; no algorithm; no `set_option`, `lemma`, LaTeX delimiter, process word or pull-request number in the README (regex scan of the whole file; the only hits for "removed"/"current" are mathematical uses). Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layers 0–5 each ending with Examples and Dependencies, Downstream consumers, Source corrections, References. Every definition section keeps its API bullets and at least three Checks (§0.1: 8, §0.3: 7, §2.1: 4, §3.1: 5, §3.3: 5, §5.4: 4; each gap: 3); every theorem has hypotheses in the sentence and a locator; every `*Needs:*` line names its inputs item by item. `plan.json` parses; `sources.toml` parses after this review's addition of `serre77`.

Headlines and Lean: the README names §2.6, §4.2 and §5.8 as headlines; `plan.acceptanceTest` states the ordinary H¹/H² Bianchi statement on `groupCohomology` with the actual E_n representation (statable at the pins: `Matrix.SpecialLinearGroup`, `NumberField.RingOfIntegers`, `symPowerRep`, `groupCohomology` all exist there) and names the three nonstatable headlines with their missing carriers. Elaboration: not available (this lane does not elaborate; say so in the report); there is no `Suggested.lean` at the design stage, so no `#check` comparison and no one-tactic padding probe were run.

Manifest: this review added one entry, `serre77` (Serre, *Arbres, amalgames, SL₂*, Astérisque 46, 1977, Numdam, open repository, certified), for R01; no author entry was changed.

## Not verifiable

- Lean elaboration and the padding probe: no `Suggested.lean` exists at the design stage and this lane does not elaborate.
- fgt10's omitted summation in the proof of Theorem 4.17 (lines 1408–1410): the (n+1)-coefficients A_F and c₂ were recomputed above from the type table and the parity restriction; the bounded constants c₃, c₄ and the exact remainder were not.
- The journal paginations of the six sources were not used; every locator refers to the arXiv, author or Numdam version named in `sources.toml`.

## Source issues

- **Error** in fgt10 at Proposition 4.18, printed page 25: the source says the isotypic multiplicity formula holds for every σ of SL₂(ℤ/Nℤ) with σ(−I)=(−1)^k; it should restrict to σ≃σ∘Ad(diag(−1,1)), since the order-three character of SL₂(ℤ/3) at weight 4 gives ½; affects a stated result (recorded in round 3 and as the roadmap's E10; re-verified).
- **Misprint** in fgt10 at Proposition 4.18, printed page 25: the source writes the order-three coefficient as ρ_k, a symbol it never defines; it should be μ_k of equation (4.7) on page 24, as Theorem 4.17's c₃μ_{n+2} confirms; affects nothing.
- **Gap** in fgt10 at the end of the proof of Theorem 4.17, printed page 26: the source says the summation over local-type combinations is omitted; it should supply the parity-restricted summation giving the displayed coefficients; affects the proof (recorded in round 3).
- **Gap** in fu24 at §1, printed page 4: the source says a module of canonical dimension zero is finite-dimensional by aw13 Lemma 10.13 for G the first congruence kernel; it should note that aw13 §10.12 assumes the (m+1)-st congruence kernel with m>0, so the first kernel needs the extension the roadmap declares as gap:canonical-dimension-zero; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "ba4c70d", "job": "REV-DESIGN-ArithmeticLocallySymmetricSpacesPartII~4", "model": "fable", "worker": "fable-rev173"} -->
