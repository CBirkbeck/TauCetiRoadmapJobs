<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/118#issuecomment-6313845874 -->
Review (claude) of d61989c

Verdict: needs_changes

1. **F01** (P2) Annihilator classes have no finite condition at ℓ, but the rank proofs use one

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md` line 707 (also line 713 and `design/plan.json` target 7.3, statement and third hypothesis). Quote: "loc_w(c₁) nonsingular for w outside Σ⁺min∪Σ⁺ℓ∪{p}" and "nonsingular localizations outside Σ⁺min∪Σ⁺ℓ∪{p₁,p₂}".

   **Claim.** §8.1 (line 755) and §7.3 (line 717) conclude that in the sum-zero relation "all other terms are killed by π^mdif", so that only the detecting places survive.

   **Witness.** ltxzz lines 6646–6649 and 6907–6910: at w above ℓ the source bounds ⟨s,c⟩_w by the different "By (8.5), Lemma 2.2.7 and (L1)"; Lemma 2.2.7 (ltxzz lines 620–623) applies only to a pair of classes both in H¹_ns(F_w,·) (torsion crystalline, Definition 2.2.5, lines 600–604). (8.5) and (8.14) (lines 6637–6638, 6891–6892) are stated for every w not above Σ⁺∪{p} resp. Σ⁺∪{p₁,p₂}, which includes w|ℓ because Σ⁺min avoids ℓ by L2. The design excludes Σ⁺ℓ from both conclusions, cites no owner for the finite condition of c₁, c₂ at ℓ, and gap `purity-crystalline-regulator` (line 194) is used by §4.4 only and speaks of the rational class and its lattice, not of the torsion congruence-level class pushed through the lattice map.

   **Exact repair.** In §7.3 add to `onePlaceAnnihilator` and `twoPlaceAnnihilator` the conclusion: for every w of F above ℓ, loc_w(c_i) lies in the integral finite (torsion crystalline) submodule H¹_ns(F_w,R̄⁽ᵐ⁾,c) of SelmerIwasawaCohomology §4.10 (ltxzz Definition 2.2.5), and record that L1 (ℓ>4n) puts the Hodge–Tate range [−n,n−1] of R inside the bound 2n−1≤(ℓ−2)/2 of ltxzz Lemma 2.2.7, so that SelmerIwasawaCohomology §4.11 bounds the pairing with the reduced Selmer class by the different. Own the new conclusion: c_i is the image under the Oλ[ΓF]-linear lattice map of the Abel–Jacobi class of the extending graph cycle on Sh′_n₀×Sh′_n₁, which has smooth hyperspecial models at every w|ℓ by L1, L2 and PELModuli §§M2.8, M4.3; the statement that the integral cycle class of a smooth-reduction variety is torsion crystalline at w|ℓ, compatibly with the quotient by (n₀,n₁) and with Oλ[ΓF]-linear maps, is a supplier obligation: extend the `needs` sentence of gap `purity-crystalline-regulator` (README line 194 and the plan's gap entry) to "…and the torsion crystalline nonsingularity at every w|ℓ of good smooth reduction of the integral Abel–Jacobi class of a cycle, compatible with Hecke quotients and Oλ[ΓF]-linear maps", add §7.3 to its `Used by`/`neededBy`, cite it in §7.3's *Needs*, and synchronize the 7.3 statement, hypotheses and the §§8.1–8.2 proof chains in `plan.json`. Add a Check to §7.3: a class unramified at every w∤ℓ but with arbitrary localization at w|ℓ pairs with a finite Selmer class at ℓ to an element not controlled by the different (ltxzz Lemma 2.2.7 needs both arguments in H¹_ns), so the sum-zero contradiction needs the ℓ-adic clause.

2. **F02** (P3) Citation of AG2.5 names no subsection

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md` line 719 (§7.3 *Needs*) and line 745; `design/plan.json` target 7.3 prerequisites. Quote: "AutomorphicGaloisRepresentationsPartII AG2.5 (local–global compatibility)".

   **Claim.** The unramified Frobenius-to-Satake identification used by `rigid_of_levelRaisingSpecial` is supplied by a subsection of AG2.5 called "local–global compatibility".

   **Witness.** AG2.5 of AutomorphicGaloisRepresentationsPartII at its pull-request head has subsections "Unramifiedness and the good-prime polynomial", "Published RACSDC comparison specializations" and sixteen others; none is titled "local–global compatibility". The supplier-contract paragraph (line 102) cites "AG2.5 (Published RACSDC comparison specializations)".

   **Exact repair.** Replace the parenthetical by the actual subsection, "AG2.5 (Unramifiedness and the good-prime polynomial; Published RACSDC comparison specializations)", in §7.3 *Needs*, the Layer 7 Dependencies and the plan's prerequisite string.

3. **F03** (P3) Page range of §2.2 starts one page early

   **Location.** `packages/SelmerIwasawaCohomologyPartII/design/README.md` line 281; `design/plan.json` target 2.2 locator. Quote: "Definitions 4.3.1–4.3.4 and Theorem 4.3.5, pp. 38–41".

   **Claim.** Definition 4.3.1 is on p. 38.

   **Witness.** ltxzz line 1788 (Definition 4.3.1) lies after the page-39 marker at line 1782; p. 38 ends at line 1781 with Lemma 4.2.4 and Remark 4.2.5.

   **Exact repair.** Write "pp. 39–41".

One P2 finding and two P3 notes. None re-raises a settled finding. All five round-3 findings are repaired on the design side (table below; the two the repair report marked not actionable are repaired as far as this package can repair them, with the supplier work declared as gaps). The seeded sample verifies against the cached texts, including the one convention I had to check on the rendered page (the potential map of §5.4). The dependency gate reports no problem. No duplication of Mathlib, Tau Ceti, a roadmap on main or an open roadmap pull request was found. The remaining blocking defect is one place where the rank theorems consume a local condition at ℓ that the annihilator theorem of §7.3 does not state and no layer or gap owns.

## Verified sound

### Round-3 findings, checked one by one

Quotations are from `packages/SelmerIwasawaCohomologyPartII/design/README.md` at the reviewed head.

| Finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| R01 (P2) nonsingularity away from p | repaired on the design side; supplier work declared | Line 713: "For every finite place w of F whose restriction to F⁺ lies outside Σ⁺min∪Σ⁺ℓ∪{p} for c₁ … require that C_m is unramified at w. This includes every other place above the rational primes p, p₁ and p₂." Line 166 (gap `native-shimura`) now requires the Lemma 4.2.4 specialization isomorphisms at every nondetecting w and the Remark 5.2.8 models above Σ⁺_p∖{p}; §§8.1–8.2 *Needs* carry PELModuli §§M2.8, M4.3, EtaleCohomologyFoundations §§F.2.1–F.2.3, F.4.1, F.4.6 and the gap. Check `system_other_place_above_p1` (line 726) is the requested negative control. ltxzz lines 1744–1754 (smooth model, L≃RΨL, nonproper case by [LS18]), 2754–2768 (proper smooth reduction above Σ⁺_p∖{p} for F⁺≠ℚ), 6700–6701 and 6901–6902 verified. The repair report's "not actionable" refers only to the supplier's side; what round 3 asked of the design is in place. The ℓ-adic places, which round 3 did not raise, are R01 above. |
| R02 (P2) rigidity at p₁ | repaired | Line 709: `rigid_of_levelRaisingSpecial` with hypotheses "rigid for (Σ⁺min,Σ), p special inert outside Σ⁺min∪Σ∪Σ⁺ℓ with ℓ∤p(p²−1), Pα(Π_p) modulo λ level-raising special". Recomputed: Proposition 3.2.4(2) (ltxzz lines 1211–1217) gives arithmetic Frobenius eigenvalues α⁻¹q_w^{−(N−1)/2}=α⁻¹p^{1−N} at the degree-two place w (q_w=p²); the simple pair {p,p⁻¹} (Definition 3.1.5(3), Remark 3.1.6(3), lines 1048–1057) gives {p^{−N},p^{2−N}} once, matching Definition 6.3.4(2) (line 5627) and §6.4 (lines 5660–5661). Checks: N=2, p=3, λ|11: P=(T−3)(T−4) is reciprocal (12≡1), P′(3)=−1, pair {3⁻²,1}={5,1}; N=4, p=3, λ|19: 3·13≡1, P=((T−3)(T−13))², P′(3)=0, pair {4,17} twice. Invoked at line 711 and in §8.2 line 765 before the p₂ edge. |
| R03 (P2) membership at ℓ | repaired | Line 501: "λ|ℓ satisfying L1 (ℓ>4n and ℓ unramified in F) and L2 (Σ⁺min∩Σ⁺ℓ=∅), AJλ(Δ) belongs to H¹_f(F,Wλ). H(n),H(n+1) enter the multiplicity realization in 4.5". ltxzz lines 6794–6800 (proof of Theorem 8.3.2 under admissibility, using Lemma 8.1.6 and (L2)) and 6370–6371 (L1, L2) verified. Check `selmer_ramified_coefficient_prime` (line 509) is the negative control; it correctly refrains from asserting nonexistence of every smooth model. |
| R04 (P3) concentration owner | repaired on the design side; supplier work declared | Line 484: "AG2.1b on its compact ST/END domain and gap diagonal-concentration on the full native domain, including F⁺=ℚ … with A7.1.1 … for the nonproper boundary-cohomology comparison"; §4.3 *Needs* (line 490) now cite AG2.1b (Weight separation into the middle degree; The archimedean packet multiplicity), gaps `diagonal-concentration` and `boundary-cohomology`. Both AG2.1b subsection titles exist at the supplier's head. ltxzz lines 6767–6772 verified. Check `aj_nonproper_boundary_domain` separates the two domains. |
| R05 (P3) loss-constant notation | repaired | Line 690: "when the supplier proves c=𝔣(r)·d_R, with d_R the reducibility depth of EulerSystemsAndKolyvaginSystems §1.3 (ltxzz r_R), use 𝔣(1)=1 and 𝔣(2)=4". Supplier §1.3 names `reducibilityDepth` and writes d_R for ltxzz's r_R; §1.15 has 𝔣(1)=1, 𝔣(2)=4. |

### Principles

Part II of SelmerIwasawaCohomology; the base's §§0.12–0.13, 2.6–2.7, 4.9–4.11, 4.24–4.25 are imported by section and nothing of the base is re-planned. The general statements keep every CM F/F⁺, F⁺=ℚ, both parities, ramified coefficient fields, positive detection loss and nonproper models; the uniform span premise is an explicit hypothesis, not a silent restriction. No copied passage, computational algorithm, `set_option`, Lean `lemma`, sorry'd data, LaTeX delimiter, process word, pull-request number or machine path was found by scan (the only hits of the word "lemma" are theorem citations, and "packet" is the mathematical word). No source text contained instructions. No upward or cyclic citation (gate output below).

### Seeded sample

Every locator was read in the cached text; page numbers were checked against the `=== page N ===` markers (ltxzz-published markers are PDF pages, offset 106 from the journal pagination, so its PDF page 41 is journal p. 147 and PDF page 197 is p. 303, as cited).

| Target | Text checked | Result |
| --- | --- | --- |
| 1.5 specialInertPlace | ltxzz-published lines 1533–1556 (Definitions 3.3.1–3.3.4, Remark 3.3.3, p. 147) | Inert, odd unramified p, F⁺_v=ℚ_p, very special = splits completely in F⁺rflx; reflexive closure by the intersection of reflex fields; F⁺rflx/F⁺ Galois, so "one place with completion ℚ_p" is equivalent. Check `special_Qi_3` recomputed (F_rflx=ℚ(i), residue field 𝔽₉). |
| 2.2 unitaryBasicCorrespondence | ltxzz lines 1788–1800, 1871–1890 (Definition 4.3.1, Theorem 4.3.5, pp. 39–41) | Tangent Hom(ωA∨,τ∞, ker α*/ωA∨), normal Hom(ωA∨,τ∞, im α*), fibre DL(V_s,{,},⌈(N+1)/2⌉), dimension ⌊(N−1)/2⌋, codimension ⌊N/2⌋, κ any field containing the residue field. Page range off by one (R03). |
| 2.3 unitarySemistableStrata | ltxzz lines 2653–2665, 2823–2835, 2898–2912, 2985–3012 (Theorems 5.2.5, 5.3.4, 5.4.4, Corollary 5.3.5) | Model and semistability imported from the gap; balloon B°≃ℙ(V_s), link DL(V_s,N−1) in the balloon fibre, O(p+1) and dual O(−(p+1)) normals, ground fibres DL• over perfect κ. `strata_normal_sign` recomputed (quartic in ℙ², degrees ±16). |
| 2.5 unitaryIncidenceWeightComplex | ltxzz lines 4020–4092, 4108–4182, 4213–4224 (Constructions 5.9.1, 5.9.4; Lemmas 5.9.2–5.9.3) | Columns and d₁ signs, odd matrix [[1,0,0],[0,−(p+1)²,T°•],[0,T•°,T•]], even matrix with its N=2 corner variant, three-step filtration, monodromy induced by the identity, singular sequence with Frobenius invariants when p²−1 is a unit, ∇₁/∇₀ combinations. `incidence_scalar` and `singular_invariants_not_coinvariants` recomputed. |
| 3.5 evenSingularComparison | ltxzz lines 5634–5654 (Theorem 6.3.5 and (4), p. 116) | Hypotheses (a)–(d) plus 6.1.4, 6.1.6, H(N); ∇₀/n isomorphism onto Oλ[Sh°]/n and the Lemma 5.9.3(6) map an isomorphism onto H¹sing; quotient n, not an eigen-submodule. |
| 3.7 oddSpecialLevelChange | ltxzz lines 6489–6515 (Lemma 8.1.7, pp. 133–134) | H(n₁), self-dual level away from Σ⁺min, finite P with distinct rational supports coprime to Σ⁺min, intertwining genericity at each p∈P, cohomological genericity; isomorphism in every degree with every special maximal level at P. |
| 4.5 diagonalMultiplicityRealization | ltxzz lines 1259–1277, 745–751, 6805–6809 | H(N) with the c-conjugate; Lemma 2.4.5 conjugation isomorphism; the map to R^c is chosen, not canonical. Page markers: line 745 on p. 17. |
| 5.4 diagonalCycleBoundaryComparison | ltxzz lines 5097–5126 (page 105, read on the rendered page), 6018–6034 (Proposition 7.2.7); liu-cubic lines 297–330, 538–540 | B^r, B_r, kernel/cokernel of the tautological map, potential map and its localization match. The rendered page settles the convention the extraction flattens: C_r=(B_{r,0})^{Gal} (invariants) and C^r=(B^r_0)_{Gal} (coinvariants), so Δ^r goes from invariants to coinvariants exactly as the README states, and Check `potential_invariants_coinvariants` is right; Liu 2019 Definition 2.5 and (2.5) agree. H¹sing≃coker Δⁿ at the localization (m₀,m₁) with ∂AJ_Q(Qη_sp) the image of cl(Q_sp) matches. |
| 5.5 firstExplicitReciprocity | ltxzz lines 6035–6050 (Theorem 7.2.8, p. 124) | Image of ∇∘Δⁿ in n₀·(…), ∇_m₁/n₀ isomorphism, pairing value (p+1)φΠ₀(I°)φΠ₁(T°)∑f(s,sh°↑(s)). `first_normalization` recomputed at p=3. |
| 6.2 secondGeometricReciprocity | ltxzz lines 2488–2521 (Construction 4.6.1, Theorem 4.6.2, pp. 53–54) | loc′_p = localization, pullback along (4.2), L≃RΨL; identity T⋆(id×π)!(id×ι)*loc′_p[Δ] = (id×π)!(id×ι)*inc⋆⋆!(1_Δ⋆) in H²ʳ⁰_𝔗(M_n₀×S_n₁,L(r₀)) in the special subcategory. |
| 6.4 secondExplicitReciprocity | ltxzz lines 6255–6261, 6303–6315 (Assumption 7.3.2, Lemma 7.3.3, Theorem 7.3.4, pp. 128–129) | Hypotheses 7.1.1, 7.3.2, H(n), H(n+1); exponent inequality with the absolute localized class on the left and the pushed-forward characteristic function on the right. |
| 7.3 rankinSelbergLevelRaisingSystem | ltxzz lines 196–210, 6633–6701, 6875–6926, 1044–1057, 1204–1217, 1744–1754, 2754–2768, 5623–5632, 5660–5661 | (8.4)–(8.5), (8.13)–(8.14) with 4rR replaced by c, the pairing computation and thresholds match; rigidity transport verified (table above). The ℓ-adic clause of (8.5)/(8.14) is dropped (R01). |
| 7.4 eventualAdmissibilityFamilies | ltxzz lines 6400–6447, 6459–6463 (Lemmas 8.1.3–8.1.5, pp. 131–133) | Family A (F⁺≠ℚ, E=ℚ, nonisogenous curves with End=ℤ, symmetric powers at every ℓ) and Family B (very special inert p with Steinberg and unramified-with-1-once factors, a supercuspidal place for each factor, F⁺≠ℚ) match; the characteristic bound 2n(n+1)−1 matches Lemma 8.1.5. |
| 8.1 rankinSelbergSelmerRankZeroOfPeriod | ltxzz lines 6548–6583, 6640–6663 (Lemma 8.2.1, Theorem 8.2.2, pp. 134–136) | Definite witness with levels hyperspecial away from Σ⁺min and transferable at Σ⁺min, mper as the valuation of the diagonal sum, threshold m>mper+mlat+mΣ+rR+mdif with c for rR; the term at ℓ uses (8.5) (R01). |
| 8.3 rankTheoremsTotallyRealBase | ltxzz lines 1273–1277, 130–139, 188–199, 6740–6745 (Proposition 3.2.11, Theorems 1.1.5, 1.1.9, Remark 1.1.10, Corollary 8.2.5) | H(N) for N≤3 and for N>3 when F⁺≠ℚ; the published theorems assume F⁺≠ℚ; the L6/L7-free n=2 remark has no proof; the families need F⁺≠ℚ. |

Also read: ltxzz lines 575–629 (Definitions 2.2.2, 2.2.4, 2.2.5, Lemmas 2.2.3, 2.2.6, 2.2.7), 711–735 (Definitions 2.4.1–2.4.4, Lemma 2.4.3), 6365–6382 (Definition 8.1.1), 6760–6772 (rational concentration and the Hochschild–Serre coboundary), 6790–6800, 4728–4761 (Lemmas 5.11.2–5.11.3: the trivial ℙ¹-bundle Q††→P†† and the component blowups used in §2.6), 9842 (the [Liu19] entry); ltxzz-published lines 7745–7752 and 7688, 7989 (the published proof uses (8.5)/(8.14) at ℓ in the same way); ltxzz-deformation lines 1444–1456, 1761–1767, 1880–1896 (D0–D4, Corollary 4.1.2, Theorem 4.2.6, matching the gap texts); liu-cubic lines 315–330, 335–357, 429–432, 447–453, 530–540. The Liu 2019 text was fetched through the sources service (arXiv 1511.08268v2, open repository) and recorded in `packages/SelmerIwasawaCohomologyPartII/sources.toml` as `liu-cubic`, cited for §5.4; the five entries the author recorded are unchanged and certified at legal origins. No `needs-references.toml` entry was needed.

### Adversarial pass

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| Conventions: rank, twist, weight, Frobenius, hγ, coboundary | n=2; inert degree-one p=3; γ=(I,−1)c; sign action on ℤ | Ranks 2,3, tensor rank 6, twist r₀+r₁=2, weight (n₀−1)+(n₁−1)−2n=−1; arithmetic Frobenius 9 on Eλ(1), geometric 1/9; c(I,−1)c⁻¹=(−I,−1) so γ²=(−I,1); coboundary −2 | None |
| `satake_reflect_sign`, `hecke_rank2`, `hecke_rank3` | T−1, T²−3T+1; r=1, q=3, a=3; r=1, q=3, a=2 | reflect 1 gives −(T−1), reflect 2 fixes T²−3T+1; even formulas S(I)=q^{r²}∏(μ+2)=3·(10/3+2)=16 and S((q+1)R−I)=−3·(10/3−3−1/3)=0; odd formulas S(T)=q^{r²+r}∏(μ−2)=9·(5/2−2)=9/2 and S(I)=9·(5/2+3+1/3)=105/2, read from SmoothRepresentationsOfLocalGroups §SR.4.4 | None |
| 1.5 specialInertPlace | ℚ(i) at 3, 5, 2; local degree two | 3 very special inert (F_rflx=ℚ(i)); 5 split, 2 even and ramified; degree-two completion excluded by F⁺_v=ℚ_p | None |
| 1.6 rankinSelbergAdmissible | ℓ=3, 11; ξ=±1; identity scalar; basis change | L1 fails for ℓ≤8 at n=2; ξ²−1≠0 excludes ±1; branch (a) of L5-1 needs a nontrivial scalar; conjugation preserves all seven clauses | None |
| 2.1 unitaryLevelRaisingDatum | m=0; Σ⁺lr=∅; infinite Σ⁺; residual-only congruence | m≥1; empty raising set allowed; finiteness essential for Chebotarev; P(p)≡0 mod λ only is an m=1 datum | None |
| 2.2 unitaryBasicCorrespondence | N=2, 3; empty source | Fibre dimensions 0, 1, codimension 1 in special fibres of dimension 1, 2; empty B over empty S | None |
| 2.3 unitarySemistableStrata | N=2 node; N=3, p=3; p inverted | Two reduced branches x=0, y=0; quartic link with normals of degree ±16; smooth generic fibre | None |
| 2.4 unitaryLinkAndIntersection | ⌊N/2⌋−j=1; ℓ∣p+1; two-point C₂-orbit over 𝔽₂ | p+1 index points and ℙ⁰ fibres; restriction isomorphism not exported; orbit trace 1 versus total trace 0 | None |
| 2.5 unitaryIncidenceWeightComplex | Node; p=3; Frobenius 4 on ℤ₃; N=2 | Alternating restriction a−b; entries −16 and 4; invariants 0, coinvariants ℤ/3; corner-only N=2 matrix matches ltxzz lines 4172–4174 | None |
| 2.6 unitaryProductResolution | n=2; empty centre; exceptional point | Dimensions 3 and 1; Q=P off the centre; image ideal 0 at an exceptional point, so the Cartier lifting property is one-way; Q††→P†† trivial ℙ¹-bundle is ltxzz line 4759 | None |
| 3.1–3.7 even/odd comparisons | A6.1.4 alone; zero localization; unipotent Frobenius; place in S_FL | Surjectivity of ∇₁ needs only the datum; eigenvalue and coinvariant claims need A6.1.6 and H(N); roots {pα^{±1}}∖{1,p²}; oldform comparison off the S_FL domain is the declared gap | None |
| 4.1–4.2 datum and graph | Source-only refinement of degree d; zero cycle; point graph | Square commutes but is not Cartesian; pushforward dΔ; class 1 with trace 1 | None |
| 4.3 projectedDiagonalAbelJacobi | ℙ¹ point; F⁺=ℚ with reducible residual system | No edge without concentration; rational domain through gap `diagonal-concentration`, integral nonproper domain needs A7.1.1 | None |
| 4.4 rankinSelbergPurityAndSelmer | ℓ ramified in F; w∤ℓ bad; HT range | L1 fails and no smooth hyperspecial model is supplied; away from ℓ purity of weight −1 with both H⁰ vanishings; [−n,n−1] has length 2n−1<ℓ−2 under L1 | None |
| 4.5–4.6 multiplicity and naturality | μ=2; non-Cartesian square; degree-2 cover | A nonzero tuple has a nonzero coordinate, no canonical one; pullback uses all of Z; trace 2AJ | None |
| 5.1 firstReciprocityDatum | 𝔽₁₁, q=2, even roots {2,6}, odd roots {1,4,3} | 2·6≡1, 4·3≡1; P_even(−1)=10, P_odd′(1)=6, P_odd(−2)=9 are units; tensor products {2,8,6,6,2,7} contain 2 twice, so PI7 fails while PI4, PI5 hold | None |
| 5.2–5.3 first geometric law and concentration | Singleton graph at p=3; torsion factor | (p+1)²=16 and the three fibre-sum descriptions; freeness needed to kill Tor | None |
| 5.4 potential map | Node curve (n=1 toy); F=[[1,1],[0,1]] over 𝔽₃ | Invariants-to-coinvariants map zero on the unipotent block although both have dimension 1; source invariants, target coinvariants as on the rendered source page | None |
| 5.5–5.6 explicit law and exponent equality | p=3, one graph pair; nonunit Hecke scalar | Value 4a₀a₁; equality needs the units from PI2, PI4, PI5 | None |
| 6.1–6.4 second law | O/π²→O/π; both parities; zero right-hand class | Exponent 2→1 shows strict inequality; zero right side forces zero left side; T⋆ retained | None |
| 7.1 admissibleImageLift | m=1; ξ²=1 | Base case L5-2; (a) fails for ξ=±1 | None |
| 7.2 auxiliaryPlaceDetection | D=[[π,1],[0,π]], C=[[π,−1],[0,π]] over A₅; c≥k | DC=CD=π²I, det C=π² not a unit; t=(−1,π) has D₁t=0, exp D₂t=3; C=0 when c≥k | None |
| 7.3 rigid_of_levelRaisingSpecial | N=2, p=3 mod 11; N=4, p=3 mod 19; p²≡1 | Simple pair {5,1} once; double pair {4,17} twice fails; p≡p⁻¹ would merge the pair, so ℓ∤p²−1 is needed | None |
| 7.3 annihilators | w above p₁ other than p₁, F⁺≠ℚ; w above ℓ | Proper smooth models of Remark 5.2.8 supply the first; nothing supplies the finite condition at ℓ that Lemma 2.2.7 needs | R01 |
| `perfect_pairing_exponent` | A₅: π, π², pairing πxy | Exponents 4, 3, product 2=max(0,4+3−5); nonperfect pairing gives 1; zero gives 0 | None |
| 7.4 families | CM curve; isogenous curves; F⁺=ℚ | Each violates a family hypothesis; no universal claim | None |
| 8.1–8.2 rank theorems | c=0 and c>0; AJ=0; m small | Thresholds m>m₀+c+mper+mlat+mdif and m>m₀+mper+2c+mlat+mdif; AJ=0 gives only the lower bound's failure; the ℓ-adic term is the only uncontrolled one | R01 |
| 8.3–8.4 domains | n=2, F⁺=ℚ; n≥3, F⁺=ℚ | H(2), H(3) discharged; H(4) at F⁺=ℚ not discharged, consistent with ltxzz line 1273 | None |
| 8.5 Hilbert precursor | g even; LIInd absent | Outside the stated domain; supplier gap only | None |

### Duplication and supplier audit

Pinned Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were read from the local checkouts at exactly those commits. Present with the stated roles: `Polynomial.reflect`, `coeff_reflect`, `Module.torsion_by_prime_power_decomposition`, `Module.free_iff_isTorsionFree`, `continuousCohomology`, `TopRep.homogeneousCochains`, `ContinuousCohomology.map_comp`, `reesAlgebra`, `mem_reesAlgebra_iff`; `TauCeti.AlgebraicGeometry.affineBlowupι`, `opensRange_affineBlowupι`, `iSup_opensRange_affineBlowupι`, `affineBlowupι_toSpecZero`; `TauCeti.ContCohomology.d0`, `H1`, `subsingleton_H1_of_subsingleton`, `subsingleton_H1_of_subsingleton_coefficients`, `nsmul_H1_eq_zero`. A grep of both libraries for Selmer groups, level raising, Abel–Jacobi classes on Shimura varieties, special inert places, Rankin–Selberg representations, potential maps and weak semisimplicity finds only the curve-level Abel–Jacobi and Mordell–Weil files of Tau Ceti, which are unrelated carriers. No pinned object is restated.

Supplier sections were read at the pull-request heads recorded in the project's pull-request index (EulerSystemsAndKolyvaginSystems `4fb7ae99`, SelmerIwasawaCohomology `17f6056`, SmoothRepresentationsOfLocalGroups `0d37c3f`, ArithmeticGaloisDuality `5b7027c`, AutomorphicGaloisRepresentationsPartII `c4cc6a1`, EndoscopicTransferAndUnitaryTraceComparison `f8f8c2b`, IgusaVarietiesAndTorsionConcentration `55adf55`, PELModuli `2d82d07`, GlobalGaloisDeformations `29e415c`, LocalGaloisDeformationRings `e189846`) and on main for EtaleCohomologyFoundations (§§F.0.3, F.2.1–F.2.7, F.3a, F.4.0–F.4.6, 0.9–0.11, F.6, F.7 all present; F.4.0 is "Stable lattices and integral models", consistent with the repair's remark), SchemeAndStackFoundations (§2.15 with `hochschildSerre_galois_covering`), StableReduction (Layer 4), ProfiniteCohomology and Chebotarev. Every cited heading exists: PELModuli §§M0.25, M0.26, M2.8, M2.12–M2.14, M4.3, M4.5–M4.9 with `cmModuli_galois` and `torusTrace`; EulerSystems §§1.2, 1.3, 1.6, 1.11, 1.15, 4.4 with `reducibilityDepth`, `scaled_inverse` and 𝔣; Smooth §§SR.4.1, SR.4.4 with the three predicate names and both formula blocks; AG2.1b, AG2.2, AG2.5, AG2.6, AG2.7 and the two AG2.1b subsections cited in §4.3 (the AG2.5 parenthetical is R02); Selmer §§0.12, 0.13, 2.6, 2.7, 4.9, 4.10, 4.11, 4.24, 4.25; Duality §§R02.4.2, R02.4.3, D7.4, D7.7; GlobalGaloisDeformations §§3.3–3.8, 5.2; Endoscopic §§6.14, 9.1, 11.2–11.4, 12.12–12.15, 13.1, 13.5–13.9; Igusa §§IG.7.2, IG.7.5, IG.7.7. LocalGaloisDeformationRings and GlobalGaloisDeformations mention rigidity only as inertia-rigid rings, so `rigid_of_levelRaisingSpecial` duplicates nothing and gap `rigidity` is genuinely new. The board siblings ArithmeticLevelRaisingAndBipartiteEulerSystems (the intake target this roadmap realizes) and GanGrossPrasadConjecturesForClassicalGroups (period nonvanishing only) overlap as the Scope paragraph records. The open pull requests QWittVectors, ErdosProgressionPowers and ArithmeticDynamics contain no level raising, Selmer, Abel–Jacobi or unitary Shimura material.

All 21 gaps have a named supplier earlier in the merge order, a section or explicit new obligation, a one-sentence `needs` identical in README and plan, and `neededBy` lists equal to the targets whose prerequisites cite them (checked mechanically). None asks for what Mathlib, Tau Ceti, a roadmap on main or an earlier roadmap already provides.

### Dependency command

The command in the brief names `packages/SelmerIwasawaCohomologyPartII/README.md`, which does not exist at the design stage; it fails with a file-not-found error. Run with the candidate `packages/SelmerIwasawaCohomologyPartII/design/README.md`, exit 0, complete output:

```text
candidate: SelmerIwasawaCohomologyPartII is not in the merge order yet; checked as if placed after IgusaVarietiesAndTorsionConcentration (the intake inserts it when its design is accepted)
depcheck: 4 roadmaps, 42 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Nothing in the tooling or the merge-order file was edited.

### Shape and completeness

README: title, Summary, Scope and ownership, Conventions (8 Checks), Exact supplier contracts per supplier with the 21 gap obligations and their `What <Supplier> must provide` lines, How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References. Plan: 8 layers, 40 targets, 46 API entries, 65 Checks, 21 gaps; every target has a locator; every definition and construction has at least three Checks; every API and Check name appears in the README; every target prerequisite points backwards; no dangling gap. `sources.toml` parses with six certified entries (five recorded by the author, one added by this review). Mathematics is in Unicode; no LaTeX delimiters, process words, round labels, pull-request numbers or machine paths occur.

## Not verifiable

- Lean elaboration: not available. This design package has no `Suggested.lean` and the brief supplies no elaboration command for the design stage; no Lean process was started.
- Fulfilment of the 21 declared supplier gaps is not certified; they are contracts. The two the repair report marked not actionable (`native-shimura`, `diagonal-concentration`) ask their suppliers for extensions whose provability is the supplier's decision.
- The extraction of ltxzz flattens super- and subscripts and renders "⩾" as ">"; the affected statements (ltxzz lines 4021, 4152, 4177, 5115–5117, 6260) were checked on the rendered page or against their proofs rather than read from the flattened symbols.
- The EulerSystemsAndKolyvaginSystems formula c=𝔣(r)·d_R and the SmoothRepresentationsOfLocalGroups Hecke identities were taken from the supplier texts and only their displayed instances were recomputed; the suppliers' proofs were not reviewed.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d61989c0cdeb4507981d586d051ec277bcc60e97", "job": "REV-DESIGN-SelmerIwasawaCohomologyPartII~4", "model": "fable", "worker": "chris-f"} -->
