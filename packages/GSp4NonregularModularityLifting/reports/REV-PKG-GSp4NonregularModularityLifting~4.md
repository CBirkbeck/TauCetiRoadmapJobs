<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1219#issuecomment-6406423102 -->
Review (claude) of 0ed82c5

Verdict: needs changes

1. **F01** (P1) The dyadic Check now asserts h³ = 0 against the supplier and against the complex

   **Location.** `packages/GSp4NonregularModularityLifting/README.md` line 172: "the supplier's polarized strict-conjugacy deformation complex with local classes µ_v has h³=0 and h² equal to the dimension of its dual H¹ Selmer group".

   **Claim.** For T ≠ ∅ the degree-three cohomology of Thorne's complex vanishes at p = 2 (the round-4 repair of F01, following BCGP25 line 5567).

   **Witness.** The named supplier's accepted design, `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md` on the board's main, §1.2 item 2 (line 170): "h³_{𝒮,T} = h⁰(F(S)/F⁺, ad r̄(1)) = 1"; its route (line 175): j acts on Lie GL_n by X ↦ −ᵗX = ᵗX in characteristic 2, so the scalars are G_{F⁺}-invariant in ad r̄(1); its Check (line 179): n = 2, #T = 3, q = 5, h² = 1 gives h¹ = 5 = g with h³ = 1 and 6 = g + 1 with h³ = 0; its "Corrections to the sources" (line 715) records BCGP25 §5.4 p. 123 as an error on exactly this point.

   Recomputed: in every version of the complex the terms in degrees ≥ 2 are H^i(G_{F⁺,S}, ad r̄) and ⊕_{v∈S} H^i(F⁺_v, ad r̄) (the µ_v only modify degrees 0 and 1), so H³_{S,T} = coker(H²(G_{F⁺,S}, ad r̄) → ⊕_{v∈S} H²(F⁺_v, ad r̄)) ⊕ ker(H³(G_{F⁺,S}, ad r̄) → ⊕_{v∈S∞} H³(F⁺_v, ad r̄)); the kernel is 0 (Tate, degrees ≥ 3 at p = 2) and the cokernel is H⁰(G_{F⁺,S}, ad r̄(1))^∨ by Poitou–Tate. At p = 2, ad r̄(1) = ad r̄ (BCGP25 line 5549), −I₂ = I₂, so I₂ is invariant and h⁰ = 1 when r̄|G_F is absolutely irreducible. Hence h³_{S,T} = 1. BCGP25 line 5569–5571 justifies h⁰ = 0 and h^{≥4} = 0 and never justifies h³ = 0; the odd-p value 0 comes from ζ_p ∉ F, which fails at p = 2. The round-3 witness for F01 (supplier design line 125 at its then head) is superseded by the accepted design.

   **Exact repair.** Replace the first two sentences of the bullet by: "At p=2, n=2 and #T=3 the supplier's polarized strict-conjugacy deformation complex with local classes µ_v has h⁰=0, h^i=0 for i≥4, h²=h¹ of its dual Selmer group and h³=h⁰(F(S)/F⁺, ad r̄(1))=1: ad r̄(1)=ad r̄ at p=2 and j acts on ad r̄ by X↦−Xᵗ=Xᵗ, so I₂ is invariant (OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.2). With h²=1 and q=5 the Euler count gives h¹=h²−h³−χ=1−1−(1−3−5+2)=5 generators, where h³=0 would give 6." Keep "Transpose fixes I₂, but Tr(I₂I₂)=Tr(I₂)=1+1=0, so the scalar-class pairing is zero" and the survival sentence; cite BCGP25 §5.4 and Lemma 5.5.3 with the note that the printed vanishing outside degrees 1 and 2 omits the degree-three scalar invariant (BCGP25 line 5569). Apply the same reading wherever the dyadic Euler count is used (only this bullet; grep "h³" finds no other).

   **Repair test.** On the original instance (n = 2, #T = 3, q = 5, h² = 1): h³ = 1 and the scalar line I₂ ∈ H⁰(ad r̄) witness it; the pairing Tr(I₂I₂) = 0 is unchanged; the generator count 5 agrees with the supplier's presentation R^loc⟦X₁,…,X_g⟧ ↠ R^T_{𝒮_Q} with g = q + #T − 1 − dn(n−1)/2 = 5 + 3 − 1 − 2 = 5.

2. **F02** (P2) Supplier drift: every OrdinaryAutomorphicFormsAndModularityLiftingPartII section cited does not exist at the accepted design

   **Location.** `README.md` lines 13, 160, 162, 164, 166, 1569, 1571, 1581, 1583, 1627, 1633 ("OL.1–OL.3", "OL.4–OL.5", "OL.3/dyadic-ordinary-finiteness", "OL.3/dyadic-ordinary-r-equals-t", "OL.4/ordinary-seed-datum", "OL.4/selected-ordinary-problem", "OL.4/gsp4-hida-galois-representation", "OL.5/symplectic-ordinary-finiteness", "OL.5/symplectic-ordinary-r-equals-t"); `Suggested.lean` lines 10–12; `design/plan.json` lines 3809–3810 and 3815–3816 (`section` and `needs` of the two gaps).

   **Claim.** The supplier states these layers and targets.

   **Witness.** The supplier's design was accepted and merged (pull request 383, head 61b5fc9, 2026-10-26T00:30Z) and is identical on the board's main: `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md` has Layers 1–6 with numbered subsections and no `OL.` label or slash-named target anywhere (grep: 0 hits). Its "Downstream consumers" (line 710) says this roadmap consumes 4.7–4.8 (finiteness and reduced R = T at p = 2), 6.3–6.4 (the p > 2 branch), 1.3 (near adequacy) and 5.2 (GSp₄-reasonable residual representations). The board's main merge order places it at line 264, before this roadmap at 269: supply direction is downward, so the drift is in the labels only.

   **Exact repair.** Repoint, keeping both gaps (the supplier is a design without a package): `gap:dyadic-ordinary-support` → sections 2.1–2.2 (ordinary Hecke algebra and Hida theory at p = 2), 3.2 (dimension bound), 4.7 (finiteness) and 4.8 (reduced R = T), with needs "Supply §§2.1–2.2, 3.2 and 4.7–4.8 at p=2, including …" (rest unchanged); `gap:symplectic-ordinary-component-support` → 5.4 (ordinary GSp₄ seed data), 5.5 (selected ordinary problems S₁ and S_{1,π}), 5.6 (Galois representation over the GSp₄ Hida–Hecke algebra), 6.3 (reduced R = T) and 6.4 (finiteness), with needs "Supply §§5.4–5.6 and 6.3–6.4, including …". Rewrite README lines 13, 160, 164, 1569, 1571, 1581, 1583, 1627, 1633 and `Suggested.lean` lines 10–12 with these numbers and titles (e.g. "4.7 finiteness and 4.8 reduced R=T at p=2; 6.3 reduced R=T and 6.4 finiteness at p>2"); update the plan's `section` fields to "2.1–2.2, 3.2, 4.7–4.8" and "5.4–5.6, 6.3–6.4". The supplier's Theorem 5.7.14 hypotheses listed at README line 160 and the q_v ≡ 1 mod 9 condition at line 164 match its 4.7–4.8 and 6.3 statements and stay.

   **Repair test.** After the edit `grep -c 'OL\.'` on README, Lean and plan.json is 0 and every cited section number resolves to a heading of the accepted design (lines 227, 254, 324, 488, 502, 582, 601, 618, 672, 686).

3. **F03** (P2) One gap asks ArithmeticGaloisRepresentations for predicates three accepted earlier designs own

   **Location.** `README.md` line 44 and `design/plan.json` line 3723: "What ArithmeticGaloisRepresentations must provide (gap:integral-enormity-and-oddness): Provide BCGP25 integral enormousness, near adequacy, strongly residual oddness and GSp₄-reasonableness …"; consumed at §11.2 (line 1540 "Nearly adequate, reasonable and tidy are separate imported predicates with definition-level supplier requests") and §11.4.

   **Claim.** No earlier roadmap owns near adequacy, strong residual oddness or GSp₄-reasonableness.

   **Witness.** `packages/OrdinaryAutomorphicFormsAndModularityLiftingPartII/design/README.md` §1.3 "Weak adequacy with the full adjoint, and near adequacy" (line 186) and §5.2 "GSp₄-reasonable residual representations" (line 548), whose consumer line 710 names this roadmap for both; `packages/PotentialAutomorphyInfrastructurePartII/design/README.md` (board main, merge order line 86) PL.4 "Strong residual oddness at a real place (p = 2)" (line 1793, Thorne 2017 Definition 3.3). ArithmeticGaloisRepresentations §§7.9–7.12 at its open head contain none of the three terms (grep: 0 hits), so the gap is not minimal and creates two owners for each predicate.

   **Exact repair.** Narrow the gap to what no earlier roadmap owns: "What ArithmeticGaloisRepresentations must provide (gap:integral-enormity-and-oddness): Provide BCGP25 integral enormousness (Definition 7.1.1) with its exact adjoint condition, coefficient field and restriction behavior, without identifying it with CG big image or ACC enormousness." Cite near adequacy from OrdinaryAutomorphicFormsAndModularityLiftingPartII §1.3, GSp₄-reasonableness from its §5.2 and strong residual oddness from PotentialAutomorphyInfrastructurePartII PL.4 in the §11.2 and §11.4 *Needs* lines and in the contracts section (add a `From TauCetiRoadmap.PotentialAutomorphyInfrastructurePartII` subsection naming PL.4); keep "tidy" with its present supplier. Update the plan's `needs` for this slug to the narrowed sentence.

   **Repair test.** Each predicate of §11.2 (A2 near adequacy, A4 strong residual oddness, B2 GSp₄-reasonable) resolves to exactly one supplier section earlier in the merge order; integral enormousness still has its gap.

4. **F04** (P3) §8.3 attributes the neatness witness to the wrong assumption

   **Location.** `README.md` line 1163: "Neatness may be deduced from CG Assumption 4.1(H1) with its explicit scalar witness".

   **Claim.** H1 supplies a scalar element of the image.

   **Witness.** CG20 line 521: H1 is "the field Q(ad⁰ r̄) does not contain ζ_p"; the neatness remark at CG20 line 532–536 (p. 813) uses surjectivity of r̄ onto GSp₄(F_p) for p ≥ 5, whose scalar λ ≠ ±1 gives q = ν(σ) = λ² ≢ 1.

   **Exact repair.** Replace by "Neatness follows for p≥5 when r̄ is surjective onto GSp₄(F_p), from a scalar λ≠±1 in the image (CG20 p.813, line 532); otherwise Assumption 4.2 remains a hypothesis." Test: for the induced example of CG20 Example 4.11(1) the image is SL₂(F_p)²⋊Z/2 (line 756), not surjective, and the sentence then correctly keeps Assumption 4.2.

5. **F05** (P3) The printed hypothesis of CG20 Theorem 7.11 is dropped

   **Location.** `README.md` line 1028 ("In the source range use p>a−2, with the stronger p−1>a imposed in the final theorem") and §7.3 (line 1073–1077), which cites Theorem 7.11 without a bound.

   **Claim.** The balance theorem's source range is p > a − 2.

   **Witness.** CG20 line 2058 (p. 853) prints Theorem 7.11 with "p − 2 > a"; the setup at line 1998 (p. 851) uses "our bound p > a − 2" for (Sym^{a−2})^∨ ≅ Sym^{a−2} ⊗ det^{2−a}, and the proof (lines 2067–2111) uses nothing else; Theorem 9.1 (line 3001, p. 878) applies it for a < p − 1, so a = p − 2 is inside Theorem 9.1 but outside the printed range of Theorem 7.11.

   **Exact repair.** In §7.3 add: "CG20 prints Theorem 7.11 with p−2>a; its proof uses only p>a−2 (CG20 line 1998), which is what the a=p−2 case of §§8.2–8.3 needs." Record the discrepancy as a source issue (below). Test: at (p,a) = (7,5): p − 2 > a is false, p > a − 2 and p − 1 > a are true, and Theorem 9.1 includes a = 5.

6. **F06** (P3) The AutomorphicBundles contract names B3.HT.1–3 for objects in B3.HT.4–8

   **Location.** `README.md` line 50: "Layers B3–B5; B3.HT.1–3. Use … its rational Hodge–Tate tower and period torsor in the characteristic-zero interpolation route."

   **Witness.** AutomorphicBundles at its open head: B3.HT.1–3 are shared small-Hasse canonical subgroups, anticanonical affinoids and bounded extension (lines 3226, 3307, 3366); the full-level Siegel minimal tower and period map, the rational Hodge–Tate Levi torsor and finite-level cohomology are B3.HT.4, B3.HT.7 and B3.HT.8 (lines 3449, 3648, 3698).

   **Exact repair.** Write "Layers B3–B5; B3.HT.4, B3.HT.7–B3.HT.8" at line 50 (the §2.3 *Needs* line already cites "B3.HT" as a whole). Test: each object named in the sentence then has a heading at the cited number.

7. **F07** (P3) Layer 10 numbering skips §10.5

   **Location.** `README.md` lines 1403–1427: "### 10.4 Characteristic-zero auxiliary Hecke image" is followed by "### 10.6 Deformation action on the higher-Hida modules"; no §10.5 exists and nothing cites one.

   **Exact repair.** Renumber 10.6–10.8 to 10.5–10.7 in the headings and in every reference (README lines 1465–1481 internal cross-references, line 1633 "§10.8"; `Suggested.lean` line 35 "§10.8"). Test: the Layer 10 subsection list reads 10.1–10.7 without gaps and `grep '§10.8'` finds nothing.

Reviewed at the pull request's head 0ed82c5 (confirmed equal to the pull request's current head before reading). Files read in full: `packages/GSp4NonregularModularityLifting/README.md` (1651 lines), `Suggested.lean` (44 lines), `metadata.toml`, `sources.toml`, `design/plan.json` (gaps), the round-3 review and the round-4 repair report. Pins: Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf` (both equal to `lake-manifest.json`); roadmap main `ff983be2`; board main `7681325`.

Seven findings: one P1, two P2, four P3. R01 reverses the round-3 finding F01 on the strength of the supplier's accepted design and a computation; R02 and R03 are consequences of that supplier's design being accepted and merged on the board (2026-10-26T00:30Z, after the round-4 repair), which renamed every section this package cites and took ownership of three of the predicates one gap requests elsewhere.

## Verified sound

**Previous findings (round 3) checked at head 0ed82c5.**

| Prior finding | Repaired passage | Status |
| --- | --- | --- |
| F01 (P1) dyadic Check h³ | README line 172 now "h³=0 … h² equal to the dimension of its dual H¹ … Tr(I₂I₂)=Tr(I₂)=1+1=0 … survives in the dual H¹" | Applied as instructed; the instruction's witness is superseded and the resulting statement is false: R01. The Tr(I₂)=0 and survival sentences are correct (BCGP25 lines 5640–5667, Lemma 5.5.3 p. 125). |
| F02 (P2) multiplicity one over E | Conventions line 17 ("a closed arithmetic fiber is a vector space over its residue field E′=κ(q′), finite over E"); §11.3 lines 1546–1556 (dim_{E′}(M_w ⊗_RS E′)=1, extension L/E, quadratic witness); §11.5 lines 1591–1597; §11.6 lines 1609, 1613; Layer 11 example line 1623; `Suggested.lean` lines 35–36 | **Repaired.** BCGP25 line 8085 (q′ = ker(RS→O)) and 8096–8098 (dim_E(M/q′M)[1/p] = 1) are the O-valued case; the README's base change (M⊗_RS E′)⊗_{E′}L has L-dimension equal to the E′-dimension; restriction of scalars gives [E′:E]·1. |
| F03 (P3) two locators | README line 152 and plan line 3772 ("proof of BCGP25 Lemma 7.5.8, pp.176–177, especially p.177 (BCGP25 line 8119), invoking BCGP21 Propositions 2.4.24 and 2.4.26, pp.26–27"); line 1338 ("Definition 7.1.1, Lemma 7.1.2 and Hypothesis 7.1.3, pp.153–154") | **Repaired.** BCGP25 line 8119–8126 is on p. 177 and cites BCGP21 Prop. 2.4.24, 2.4.26 (BCGP21 lines 1283 p. 26 and 1338 p. 27); lines 6927, 6933, 6959 are Definition 7.1.1, Lemma 7.1.2, Hypothesis 7.1.3 on p. 153; Lemma 7.5.2 (line 8026, p. 175) is conductor constancy and is still cited for that in §11.3. `sources.toml` BCGP21 and BCGP25 locators extended accordingly. |

The repaired patterns were searched in the rest of the package: no other E-dimension claim at a non-E-rational point remains (grep "dimE", "dim_E": lines 58, 1554–1556, 1595, 1613, 1623 only, each now qualified); no other "Definitions 7.1.1–7.1.2" or "Lemma 7.5.2" misuse; the only dyadic Euler statement is line 172.

**Principles.** No route-specific shortcut: the CG branch keeps its exact ranges, the BCGP branch keeps p = 2, the P12 branch keeps its own image conditions. No re-planning of a main-branch roadmap (all 118 main-branch roadmaps listed; none overlaps). No copied passages, computational algorithms, `set_option`, `lemma`, LaTeX delimiters, process words, pull-request numbers or machine paths (grep over README and Lean: 0 hits; the two regex hits are "packets" and "five-lemma"). Supply direction: depcheck exited 0 with exactly

```text
depcheck: 56 roadmaps, 657 edges, 0 problem(s)
```

(no UPWARD, CYCLE or moved line). The board's main merge order (324 lines) places both accepted designs this review relies on before this roadmap (PotentialAutomorphyInfrastructurePartII at 86, OrdinaryAutomorphicFormsAndModularityLiftingPartII at 264, this roadmap at 269, its consumer AbelianSurfacesModularity at 270). The pull-request branch's ORDER.txt (315 lines) predates that insertion; nothing in it is upward either.

**Source sample.** All seven manifest texts were read from the legal cache. No author-flagged unverified locator exists. CG20 page n of the file is printed page 800 + n. The fifteen seeded targets:

| Target | Read | Result |
| --- | --- | --- |
| 0.5 Klingen TW refinements | CG20 lines 719–729 (Prop. 4.10, p. 818), 1632–1639 (Assumption 6.12(2), p. 841), 1843–1855 (Thm 7.2 and pr_x, p. 847) | #Q = q = h¹ of the dual Selmer group, x ≡ 1 mod p^N, four distinct roots, isotropic plane labelling α_xδ_x = β_xγ_x all present; the extra separation αβ ≠ γδ is the README's own requirement for R_x, consistent with the three factors at line 1852. |
| 1.2 joint root selectors | CG20 lines 1642–1651 (p. 841), 1777–1782 (p. 845) | The printed e_β = lim((T−β̃)(Q−α̃β̃))^{n!} is the projector onto the summand where both factors are units, not the β-part; the README's product of complementary idempotents is the intended object (Theorem 8.13 line 2536 "summand where U−β and Q₂−αβ are nilpotent"). Source misprint recorded. |
| 3.1 Hasse shifts | CG20 lines 1435–1437 (Def. 6.1, p. 835), 1458–1479 (Def. 6.3, Lemma 6.4, pp. 836–837) | A lifts h^r; t = rs(p−1) ≥ N(μ) with p^{m−1} \| s; equivariance only for T_{x,i} and U_{x,i}, as the README states; p-operator equivariance is separate (Lemma 6.2(2) is for h with b ≥ 3). |
| 3.4 regular Hecke representation | CG20 lines 1625, 1652–1681 (Thm 6.13, pp. 841–842) | a ≥ b ≥ 3; multiplier χ_{μ,0}ε^{−(a+b−3)}; diagonal exponents 0, −(b−2), −(a−1), −(a+b−3); d_{p,1} ≡ β, d_{p,2} ≡ α; square-root twist gives Definition 4.6 (2)–(5). The p-polynomial identity (3) is correctly withheld. |
| 5.2 singular minimal deformation | CG20 lines 1768–1797 (Assumption 6.16, Thm 6.17, p. 845) | Hypotheses p − 1 > a, Katz modularity, labelled Q, root condition; conclusion a minimal deformation outside Q over T(Q)^{αβ}_m. The README's exclusion of a = 3 is forced by §8 (line 2256), not by this statement; see source issues. |
| 6.1 Klingen projector | CG20 lines 1843–1855 (p. 847) | R_x has the three printed factors; pr_x is printed with an undefined R′_x, as the README notes; m contains xU_{x,2} − α′β′ and U_{x,1} − α′ − β′. |
| 6.3 descent through strata | CG20 lines 1881–1950 (Lemmas 7.4–7.5, pp. 848–850), 1953–1970 (Lemma 7.6) | Cocartesian h^t squares; the secondary Hasse invariant of weight (p²−1, p²−1) on the nonordinary locus, vanishing to order 2 on the one-dimensional EO stratum; H¹ by reverse induction. The parenthetical "smooth (and in particular irreducible)" at line 1908 is the gap the README repairs componentwise. |
| 7.2 H² vanishing | CG20 lines 1997–2020 (Assumption 7.7, Remark 7.8, Lemma 7.9, pp. 851–852), 931–940 (Thm 5.1, p. 822), 3028–3029 and 3039 (Thm 9.1(6), p. 878) | Vanishing ⇒ divisibility of H¹(E/O) ⇒ torsion-free H¹(L); Theorem 7.11's proof (line 2092) uses Lemma 7.9 at X₀(Q) only, as the README says; Thm 5.1(2) with b = 2 gives 4 ≤ a ≤ p, matching "p ≥ a ≥ 4" at line 3039. |
| 8.3 a ≥ 4 theorem | CG20 lines 76–81 (Thm 1.2, p. 803), 2999–3039 (Thm 9.1, pp. 878–879), 529–536 (Assumption 4.2, p. 813) | Hypotheses (1)–(6) retained; the neatness remark is misattributed (R04). |
| 8.5 classical modularity | CG20 lines 38–53 (Thm 1.1, p. 802) | Ordinary with HT [0,0,j−1,j−1], p − 1 > j ≥ 4, D_cris unit roots, residual modularity; the README's explicit "crystalline" and its restriction of Euler-factor equality to proved local comparisons are stricter than the source's L(r,s) = L(F,s). |
| 9.1 P12 admissibility | P12 lines 639–676 (§3.2, Def. 3.2, pp. 13–14), 684–687 (Def. 3.3, p. 14), 954–990 (Def. 5.1–5.3, pp. 19–20), 1140–1147 (H1–H3, pp. 23–24), 1768–1785 (§7.1, pp. 35–36) | p ≥ 5, K neat or p ≥ 7; irreducible (README: absolutely irreducible, flagged); SYMP; H1–H3 as listed; χ_ℓ/ε₂/ε/TR with the printed levels Π⁺(ℓ), Π(ℓ), I(ℓ); Def. 3.2 uses r > r′ and (FOR) r < r′, and the exponent sign iκ versus −iκ is as the README's conventions state. |
| 10.2 four modules | BCGP25 lines 7683–7733 (Def. 7.4.1–7.4.5, pp. 167–168) | r > 5, unramified, regular semisimple, ordering (α_{r,1}, α_{r,2}, rα_{r,2}⁻¹, rα_{r,1}⁻¹); S = {r} ∪ Ram(ρ); K_r = Iw₁(r); Iw(l), Iw₁(l) at Q_N; the torus diamond is two-dimensional per prime. |
| 10.7 projective Satake | BCGP25 lines 7869–7880 (Lemma 7.4.11, p. 172), 7925–7945 (proof of 7.4.12) | M_G = [G]_H M_H on projective modules; [GSp₄(Z_q)] = Σ_w w inverts pr_w with no division by 8. |
| 11.4 support | BCGP25 lines 8035–8049 (Prop. 7.5.3, p. 175), 8129–8231 (Prop. 7.5.10 and proof, pp. 177–179) | (A1)–(A5), (B1)–(B5) as listed; dyadic preparation (split above S, F/F⁺ unramified, ρ̄ trivial above 2, [F_v:Q₂] > 7) then Theorem 5.7.14 and Prop. 7.5.3(2); odd p: q_v ≡ 1 mod p, mod 9 at p = 3, Theorem 6.3.4 and Prop. 7.5.3(3). |
| 11.5 rank one | BCGP25 lines 8232–8240 (p. 179) | Rank at the generic point, dense R-regular points, Lemma 7.5.8; the README's free-neighbourhood route is a valid rearrangement; the source's application of the O-valued Lemma 7.5.8 at a closed point is the gap F02 repaired (source issue). |

**Adversarial values** (sampled targets, headlines, repaired passages and every target a finding touches; the other targets keep the round-3 and round-4 rows, which carry computed values and were spot-recomputed where they enter below).

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| Line 172 dyadic complex (R01) | p=2, n=2, r̄\|G_F absolutely irreducible; #T=3, q=5, h²=1 | ad r̄(1)=ad r̄; j·I₂=−I₂ᵗ=I₂ so h⁰(ad r̄(1))=1; Poitou–Tate cokernel dimension 1; h³ = 1 versus README 0; Euler count h¹ = 1−1−(1−3−5+2) = 5 versus 6 | Fails: R01 |
| Line 172 pairing | I₂ in characteristic 2 | Tr(I₂I₂)=Tr(I₂)=0; n odd would give 1 | Sound |
| Conventions/§11.3 fibre field (F02) | E=ℚ₇, point (t²−3) | squares mod 7 = {0,1,2,4} ∌ 3, so [E′:E]=2; E′-dim 1, E-dim 2; zero fibre 0/0 | Sound |
| §11.3 base change | L ⊇ E′ | dim_L((M⊗_RS E′)⊗_{E′}L) = dim_{E′}(M⊗_RS E′); restriction: dim_E = [E′:E]·dim_{E′} | Sound |
| §11.3 local lines | p (BCGP21 2.4.24/2.4.26), r (Iwahori, regular semisimple), ℓ≠p,r (newvector, Lemma 7.5.2) | 1·1·1 = 1; a doubled p-line gives 2 | Sound |
| §11.5 rank one | free rank d near q, regular q′ in that neighbourhood with κ(q′)-fibre 1 | d = 1; four chambers: E′-sum 4, E-sum 8 at [E′:E]=2; rank-0 module: fibre 0 | Sound |
| §11.6 isotypy | four graded E-dimensions 1 | 4n = 4 ⇒ n = 1; Sen block [[a,1],[0,a]] nilpotent rank 1 versus 0 | Sound |
| §11.1 R-regular | R=3: (−4,−1), (0,3), (−1,−4) | gaps (3,3), (3,−5), (−3,9); Def. 7.5.7 line 8095 reads h₂−h₁, 1−2h₂ ≥ R | Sound |
| §11.4 seeds | n=4,[F⁺:ℚ]=1; n=2; p=3, q_v=7,19; E×E, M=E×0; E[ε]/ε² | 4≡0, 2≢0 mod 4; 7≡1 mod 3 but 7 mod 9 = 7, 19 mod 9 = 1; fibres 1,0; ann = (ε) ≠ 0 | Sound |
| §10.1 neat prime | p=2, r=7,13 | 7 mod 4 = 3 admissible, 13 mod 4 = 1 rejected; both ≡ 1 mod 2 | Sound; Def. 7.4.1 line 7685 misprint recorded |
| §10.2 torus diamond | one prime, p-part order p^N | #Δ = p^{2N} versus Klingen p^N; Iw₁(l) = ker(T(Z_l)→T(F_l)) (line 7725) | Sound |
| §10.3 freeness | rank d over Λ[Δ], d=0; p=2 | Λ-rank d·p^{2N}; 0 stays 0; 8 ∉ O^× | Sound |
| §10.7 norm | k[C₂] regular and trivial, char 2 | [1] ↦ 1+g ≠ 0; trivial: 1+1 = 0; Σ_w w inverts pr_w (line 7929) | Sound |
| §10.8 cofinal ideals | (1+t)^{2^N}−1; E[[x]]→E[[x]]/(x²) | t-coefficient 2^N ≠ 0; Ω = 0 but kernel (x²) ≠ 0 | Sound |
| §0.1 roots | F₁₁: (2,3), (2,6), (1,3) | 3·8·(−1)·35 = −840 ≡ 7; 2·6 ≡ 1 so α²β²−1 = 0; α²−1 = 0 | Sound |
| §0.5 refinement | F₁₃ (2,4,11,9); x=29, p=7, N=2 | αδ = 18 ≡ 5 = 44 ≡ βγ; αβ = 8 = 99 ≡ γδ, rejected; 28 ≢ 0 mod 49 | Sound |
| §1.2 selector | T=diag(c,c+1), Q=diag(d+1,d); Jordan block | e(T,c)e(Q,d) = diag(1,0)diag(0,1) = 0; 1−lim(product)^{n!} = 1; printed lim(product)^{n!} kills a β-eigenvector; ker N, ker N² dims 1, 2 | Sound; source misprint |
| §2.2 Steinberg | x=3: (2,2), (4,2), (3,3) | exponents −1, 0, 0; 3⁻¹ has valuation −1 | Sound |
| §2.3 polynomial | diag(1,2,3,6) | 1−12X+47X²−72X³+36X⁴; constant 1 | Sound |
| Layer 2 example dual spin | HT {0,0,1,1}, multiplier ε⁻¹ | dual {0,0,−1,−1}, +3 ⇒ {3,3,2,2}; ε·ε⁻⁶ = ε⁻⁵ | Sound |
| §2.7 exponents | w=0, w=2; χ₂(u)=ζ₃ | (−1,−1,−2,−2), (−2,−2,−3,−3); ζ₃⁻¹ ≠ ζ₃ | Sound |
| §3.1 congruence | p=5, m=3; p=2, ϖ²=2 | s ≡ 0 mod 25; (1+ϖ)²−1 = ϖ²(1+ϖ); (b+ϖc)^p ≡ b^p mod ϖ² needs p ∈ ϖO | Sound |
| §3.3 central character | diag(1,2,3,4) in F₇ | trace 3, det 3; pair products (4,6), (3,1), (2,5) | Sound |
| §3.4 exponents | (4,3); b=2 | 0,−1,−3,−4 with pair sums −4 (w = 4); b = 2 repeats 0 | Sound |
| §4.2 theta ranges | p=7: (2,2), (4,2), (6,2), k=8 | degrees −2, 0, 2; injectivity 4<6 true, 6<6 false; 8·15 = 120 ≡ 1 | Sound; a = 3 excluded by CG20 line 2256 (source gap) |
| §4.4 scalar Z₂ | c=6, c=1 in F₁₁ | 210 ≡ 1; 0 | Sound |
| §4.7 inverse | β=3 in F₁₁ | 3·4 = 12 ≡ 1 | Sound |
| §6.2 trace inverse | q=11, p=5, δ²=−43 (GL₂ model) | αβ = 44/4 = 11; tr∘pr_α∘i = (qα−β)/(α−β) = (5+6δ)/δ = 6−5δ/43 ≡ 1 mod 5; d_Q⁻¹·that = 1/2−5δ/516 ≡ 3 ≠ 1 | Sound; CG20 Thm 7.3 inverse is a source error |
| §6.2 Klingen degree | x ≡ 1 mod p | 1+x+x²+x³ ≡ 4; the block constant itself is the supplier gap's deliverable | Sound as a contract |
| §6.3 nonzerodivisors | k×k; k[x,y]/(xy) | (1,0)(0,1) = 0; x·y = 0 | Sound |
| §7.1 duality | ω(k₁,k₂)^∨ = ω(−k₂,−k₁); a=4 | ω(3,3)⊗ω(a−3,−1) = ω(a,2); L = ω(1,−1); Hom(E/O,O) = 0 versus compact dual O | Sound |
| §7.1/7.3 source bound (R05) | (p,a) = (7,5) | p−2>a false; p>a−2 true; p−1>a true | Dropped printed hypothesis: R05 |
| §7.3 defects | S=O[C_p]: S, k, S⊕k | 1−0 = 1; 1−2 = −1; 0 | Sound |
| §8.3 ranges | (7,4), (5,4); Thm 5.1(2) at b=2 | 4<6; 4<4 false; 4 ≤ a ≤ p | Sound |
| §8.3 neatness (R04) | H1 = ζ_p ∉ Q(ad⁰ r̄); surjective image | H1 gives no scalar; λ² ≢ 1 for a scalar λ ≠ ±1 in GSp₄(F_p) | Misattributed: R04 |
| §8.4 six points | W = even-weight F₂⁶ / all-ones; (12); (123) | 2⁵/2 = 16; (q⁴−1)q³(q²−1)q at q=2 is 15·8·3·2 = 720 = 6!; (12) fixes x₁=x₂: 16/2 = 8 classes, dim 3; (123) fixes x₁=x₂=x₃: 8/2 = 4 classes, dim 2 | Sound |
| §8.5 weights | a=4, ℓ=3 | HT 0,0,3,3; ε⁻³(Frob₃) = 27; det 729 | Sound |
| §9.1 conventions | κ=(2,2); k′=3 | iκ = (0,0,−1,−1) from (0,−a₂−1,−a₁−2,−w) with (a₁,a₂) = (k₁−3,k₂−3); (0,−1,−2,−3); deformation middle ratio ε^{2−1} = ε versus automorphic ε⁻¹ | Sound |
| §9.3 weights | (4,2), (2,2), (1,1) | (0,0,−3,−3), (0,0,−1,−1), (0,1,0,1) | Sound |
| Gap minimality (R03) | near adequacy, GSp₄-reasonable, strong residual oddness, integral enormousness | owners: Ordinary Part II §1.3, §5.2; PAI Part II PL.4; none (AGR §§7.9–7.12: 0 hits) | Not minimal: R03 |
| Supplier labels (R02) | "OL." in package versus accepted design | 11 README lines + 3 Lean lines + 4 plan lines versus 0 headings | Drift: R02 |
| Other 18 gaps | G7, SR.4.5, IHG §1.7, AGR §6.4, IC.4, IC.8, LGDR §6.29, §§6.3/6.27, F8 | 0 hits for CG Selmer presentation, paramodular/newvector/Steinberg/Klingen/monodromy, GSp₄ reconstruction, Weil-restriction image, T_{p,1}/Q_{p,2} in degree one, selected inequality | Minimal and declared in both plan and README |

**Pinned library.** Opened at the pins: `Mathlib/Data/ZMod/Defs.lean:138` (`def ZMod : ℕ → Type`), `Mathlib/LinearAlgebra/Eigenspace/Basic.lean:71` (`genEigenspace` as the supremum of kernels of powers, over a commutative ring, no semisimplicity) and `:89` (`mem_genEigenspace_nat`), `Mathlib/Algebra/Group/Idempotent.lean:37` (`a * a = a` with only `[Mul M]`), `TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean:712` (`abbrev H1 := Z1 ⧸ B1.addSubgroupOf Z1` under `[Monoid G] [TopologicalSpace G] [AddCommGroup M] [TopologicalSpace M] [IsTopologicalAddGroup M] [DistribMulAction G M] [ContinuousSMul G M]`, whose docstring itself says the inherited quotient topology need not be discrete; `DiscreteH1` at line 721). The README's `From Mathlib` and `From Tau Ceti` descriptions match these and claim nothing more.

**Suppliers resolved** (every citation, at the copy named): on the roadmap repository's main none of the cited suppliers exists (118 roadmaps, 12 completed); all were read at their open heads through the roadmap service: ArithmeticGaloisRepresentations (#856: §5.11 line 3417, §6.4 3896, §7.3 4183, §7.6 4430 with "Semisimplicity criteria" 4641, §7.9 4752, §7.12 4996), GlobalGaloisDeformations (#920: R04.3–R04.6 at 399, 686, 1062, 1462; G7 at 1948), IntegralHeckeAndGaloisDeterminants (#785: §0.7 1156, §1.1 1865, §1.5 2538 with `symplectic_coefficient_descent` at 2580 and `p > 2` at 2582, §1.6 2596, §1.7 2658, §2.1 2830, §2.3 2955), LocalGaloisDeformationRings (#923: §2.7 1857 with `GSp4RamType`, §2.17 2037, §2.25 2183 with `GSp4.MinimalAt` 2189, §6.3 3118, §6.14 3391 with `GSp4.SiegelOrdinary` 3397, §6.26 3613, §6.27 3623, §6.29 3684), SmoothRepresentationsOfLocalGroups (#785: SR.2.1 1834, SR.2.3 2123, SR.4.1 3084, SR.4.5 3490), DeformationAndDerivedPatchingAlgebra (#1034: §3.1 527, §3.3 593, §5.1 1020, §5.5 1087, §5.6 1114, §5.8 1165, §5.9 1189, §6.1 1214, §6.7 1293, §7.6 1451, §7.10 1526), EndoscopicTransferAndUnitaryTraceComparison (#999: §11.1 4154, §13.2 4784), ModularityAndLanglandsExtensions (#1180: §3.2 1832, §3.5 1945 citing Gan–Takeda parts (i)–(vii), §3.9 2041, §3.26 2430, "GSp4ClassificationInputs" 189), PadicHodgeTheory (#1062: §3.2 660, §3.6 748, §4.4 888, §5.3 1021, §5.4 1049), ShimuraCompactifications (#1053: C3.9 1677, C3.10 1697, C5.13 2498, C5.18 2630), ShimuraData (#1038: §5.9 1337, §5.10 1361, §5.18 1536), HodgeTateAndCanonicalSubgroups (#1084: §0.2 197, §0.5 271, §0.14 453, §0.15 479), FiniteFlatGroupsAndIntegralPadicHodgeTheory (#879: R07.1 520, R07.2 2986), AutomorphicGaloisRepresentationsPartII (#1006: AG2.P 235, AG2.5 1759, AG2.6 2037 with the two cited subsections at 2827 and 2837), AutomorphicLFunctionsAndLocalFactors (#924: AL.4 2759), PotentialModularityAndCompatibleSystems (#1075: §8.3 1615, rank two), AutomorphicBundles (#1069: B3 1703, B3.HT 3200 with B3.HT.1–8 at 3226–3698, B4 3782, B5 4506), OverconvergentAutomorphicForms (#1422: §8.6 1463, §8.7 1495). Board designs: AutomorphicBundlesPartII (`design/README.md`: IC.1–IC.8 at 69, 253, 381, 719, 850, 1175, 1384, 1528), PadicFamiliesPartII (`design/README.md`: K2 329, E6/four-pieces 1057, S7/sen-cousin 1151, S7/de-rham-classicality 1189, F8 summary 55), OrdinaryAutomorphicFormsAndModularityLiftingPartII and PotentialAutomorphyInfrastructurePartII (board main, as in R02–R03). AbelianSurfacesModularity (board design) cites this roadmap as its supplier (its `design/README.md` lines 139–140), consistent with "Downstream consumers". The citation resolver reported no unresolved citation or Lean name.

**Gaps.** All 20 slugs occur in `design/plan.json` `gaps` and in the README with identical supplier and needs sentences (script comparison: 0 mismatches); none has supplier `none`; each needs sentence is one precise statement. Minimality holds for 19 (table above) and fails for `integral-enormity-and-oddness` (R03); the sections of two are stale (R02).

**Shape.** 12 layers, 61 numbered targets, each with hypotheses, locators and a *Needs* line; 65 `**Checks.**` blocks with 3–7 bullets each (57 with exactly three); every layer ends with `### Examples` and `### Dependencies`; summary, scope, conventions, contracts, build order, downstream consumers and references present. Lean names: the README backticks only pinned declarations and supplier targets; `Suggested.lean` declares nothing, so no name of this roadmap's own is claimed.

**Headline theorems and `Suggested.lean`.** The README's headlines are minimal R = T with positive freeness (§8.2), the a ≥ 4 theorem (§8.3), classical modularity (§8.5), variable-weight R = T and p-adic lifting (§§9.2–9.4), local freeness (§10.8), multiplicity one, support, rank one and classical weight-two lifting (§§11.3–11.6), with the constructions of §§1.1, 2.3–2.8, 3.1a, 3.4, 4.2, 4.8, 5.2, 6.4, 7.4. None is statable at the pins: their carriers (integral genus-two Siegel moduli and coherent Hecke images, higher-Hida modules, symplectic deformation rings, Siegel Hida families) exist neither in Mathlib nor in Tau Ceti (object searches for Siegel/GSp₄ coherent cohomology, Hida modules, deformation rings and pseudocharacters found only the elementary carriers opened above). The module docstring names each missing carrier per headline group. `lake env lean` on `Suggested.lean` from the content checkout: exit 0, no output (5 s); one `import Mathlib`, no Tau Ceti import needed, no `set_option`, no declarations. The `#check @name` pass and the one-tactic padding probe have empty domains; the README/Lean generality comparison is vacuous. No padding and no stand-in.

## Not verifiable

- Ownership against open roadmap pull requests whose files the brief names without paths was checked only through the roadmap service's index (367 open heads) and `roadmaps grep`; those not carrying a folder with a cited name were not opened.
- The 20 supplier contracts are future obligations; their declaration, ownership and minimality were checked, their proofs were not.
- The constant 1/4 in the §6.2 Check (the residual Klingen block's contribution to tr∘pr_Q∘i) was recomputed only in the GL₂ model; the GSp₄ value is the deliverable of `gap:gsp4-klingen-level-comparison`.
- The conditional theorems of Layers 8–11 are not certified by the finite controls; the declaration-free Lean file checks only form.
- Whether BCGP25's downstream use of its printed h³ = 0 (Lemma 5.7.7's relation count) is repaired exactly as the supplier's design says was not re-derived here; the supplier's correction and R01 need only h³ = 1.

## Source issues

- **Error** in BCGP25 at §5.4, printed page 123 (line 5567–5571): the source says the cohomology of Thorne's complex vanishes outside degrees 1 and 2 when T is nonempty; it should be h³ = h⁰(F(S)/F⁺, ad r̄(1)) = 1 at p = 2, the scalar line; affects a stated result.
- **Gap** in BCGP25 at Proposition 7.5.10, proof, printed page 179 (line 8238–8240): the source says Lemma 7.5.8, stated for O-valued points, finishes the rank-one step at a closed point of a dense set; it should extend coefficients to that point's residue field first; affects the proof.
- **Misprint** in BCGP25 at Definition 7.4.1, printed page 167 (line 7685): the source says r ≢ 1 mod p and r ≢ 1 mod 4 when p = 2; it should be r ≢ 1 mod p for odd p, r ≢ 1 mod 4 for p = 2; affects a stated result.
- **Error** in CG20 at Theorem 7.3, printed page 847 (line 1863–1866): the source says the inverse of pr_Q∘i is the trace divided by the covering degree d_Q; it should be the trace divided by the unit tr∘pr_Q∘i, which is ≡ 1, not ≡ d_Q, modulo m when x ≡ 1 mod p; affects a stated result (the isomorphism itself stands).
- **Misprint** in CG20 at §6.4, definition of e_β, printed page 841 (line 1645), and of e_{α,β}, printed page 845 (line 1777–1780): the source says the idempotent is the limit of factorial powers of the product of the two shifted operators; it should be the product of the two complementary idempotents 1 − lim(T_{p,1}−β̃)^{n!} and 1 − lim(Q_{p,2}−α̃β̃)^{n!}, which select the summand where both are nilpotent; affects a stated result.
- **Gap** in CG20 at Theorems 8.13 and 9.1, printed pages 864 and 878 (lines 2526 and 3001): the source says the weight range is p − 1 > a ≥ 2; its §8 argument assumes j ≥ 4 or j = 2 (line 2256–2264), so a = 3 is not covered; affects a stated result.
- **Gap** in CG20 at Lemma 7.4, proof, printed page 849 (line 1908): the source says smoothness of X and X₀(Q) over k makes them irreducible, hence h injective on H⁰; it should argue on each connected component with h nonzero there; affects the proof.
- **Misprint** in CG20 at Theorem 7.11, printed page 853 (line 2058): the source says p − 2 > a; the setup (line 1998) and the proof use p > a − 2, and Theorem 9.1 applies the theorem for a < p − 1; affects a stated result.
- **Error** in CG20 at Theorem 9.1, proof item (a), printed page 879 (line 3063): the source says auxiliary inertia acts through diag(1,1,⟨u⟩,⟨u⟩); with the multiplier fixed this must be twisted to diag(χ,χ,χ⁻¹,χ⁻¹) with χ⁻² = ⟨u⟩; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "0ed82c5", "job": "REV-PKG-GSp4NonregularModularityLifting~4", "model": "fable", "worker": "fable-rev178"} -->
