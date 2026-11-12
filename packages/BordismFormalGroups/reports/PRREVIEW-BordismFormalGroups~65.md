# Review of BordismFormalGroups (pull request #1807 at c8821a4)

**Verdict:** needs changes

This is an incremental re-review of the 143 lines of `TauCetiRoadmap/BordismFormalGroups/README.md` that changed since `27be4b9`. `Suggested.lean` is unchanged.

- **Previous findings.** All three findings of the review of `27be4b9` are repaired.
- **New findings.** The repairs introduce two P3 defects; neither is blocking.
  - R01: F1.5's rewritten route consumes a non-strict form of Lemma A2.1.26 and of Theorem A2.2.6. No target states that form.
  - R02: the new locator for telescope independence attributes the choice-of-map part to the wrong result in Ravenel.
- **Gate.** The worker's gate passes. My rerun differs only in `outside-folder=26`. Those are the README and `Suggested.lean` of the 13 sibling folders that the brief names as this pull request's own. `git diff --name-only origin/main...HEAD` lists exactly the 14 folders, two files each.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2147 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Lean.** `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 75, 90 and 116) and nothing else.

## R01 (P3) — F1.5's route uses a non-strict Lemma A2.1.26 and Theorem A2.2.6 that no target states

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md`:
- line 631: "Seek f:F→G with f⁻¹(x)=Σ^F_(i≥0) t_i x^(p^i) and t₀ a unit; the law that f transports F to is then p-typical whatever the unit t₀ (Lemma A2.1.26…)";
- line 638: "whose proof holds for t₀≠1";
- line 665: "and Lemma A2.1.26 for a unit t₀, which are route inputs".

**Claim.**
- The route has two inputs, and the README holds both only by citation:
  - p-typicality of the transported law for a unit t₀;
  - Theorem A2.2.6's identity for a non-strict f.
- The p-typical paragraph's API bullet (lines 566–574) states both facts only for strict isomorphisms ("with t₀=1", VT=V[t₁,t₂,…]).
- The *Needs:* line lists Lemma A2.1.26 apart from "the p-typical paragraph above". So by the README's own wording the input is not a target, and a citation is not a supplier.

**Witness.**
- `ravenel-green` line 20333 states Lemma A2.1.26 for "t₀ a unit", but README line 568 restricts the owned bullet to t₀=1.
- Lines 20809–20810 assert the t₀≠1 identity only in passing, inside the proof of Theorem A2.2.12.

**Repair.**
- Append to the bullet at lines 566–574:

  > More generally, if f⁻¹(x)=Σ^F_(i≥0) t_i x^(p^i) with t₀ only a unit, the target of f is p-typical (Lemma A2.1.26, p. 360), and when F and the target are classified by φ,θ:V→R, `Σ^F_(i,j≥0) t_i θ(v_j)^(p^i) x^(p^(i+j)) = Σ^F_(i,j≥0) φ(v_i) t_j^(p^i) x^(p^(i+j))` (Theorem A2.2.6, whose proof holds for t₀≠1: proof of Theorem A2.2.12, p. 367).
- In the *Needs:* at line 665, replace "and Lemma A2.1.26 for a unit t₀" with "including its non-strict form".
- An alternative is to state that x↦cx carries the law classified by φ to the one classified by v_i↦c^(1−p^i)φ(v_i), and to run the route through strict isomorphisms.
- Tested on F classified by v₁↦a (h=1) with f⁻¹(x)=t₀x:
  - the target cF(x/c,y/c), with c=1/t₀, has p-series a·t₀^(p−1)x^p, so θ(v₁)=a·t₀^(p−1);
  - the x^p coefficient of the identity gives t₀θ(v₁)=a·t₀^p, the same value;
  - the scaling formula gives c^(1−p)a, also the same value.

## R02 (P3) — The (7.2.8) locator attributes independence of the chosen map to Theorem 7.2.7

**Location.** `TauCetiRoadmap/BordismFormalGroups/README.md` lines 2783–2785: "their independence in Bousfield class of the chosen map and of the chosen type-n spectrum (Ravenel, *Nilpotence and Periodicity*, the paragraph of (7.2.8), p. 80, from the class invariance Theorem 7.2.7)".

**Claim.**
- The paragraph locator is right, but the clause "from … Theorem 7.2.7" covers only the type-n spectrum.
- In that paragraph, independence of the map comes from the uniqueness of v_n maps, which is Lemma 6.1.3. The README owns that statement as v^a=w^b at lines 2551–2553.

**Witness.**
- `ravenel-orange` line 3049 derives the map independence from 6.1.3, and line 3050 derives the spectrum independence from 7.2.7.
- Lemma 6.1.3, "Uniqueness of v_n-maps", is at line 2233, printed p. 58.

**Repair.** Replace the parenthesis with:

> (Ravenel, *Nilpotence and Periodicity*, the paragraph of (7.2.8), p. 80: of the map by the uniqueness Lemma 6.1.3, p. 58, and of the spectrum by the class invariance Theorem 7.2.7)

Also add "Lemma 6.1.3, p. 58" to that book's References entry. Tested: lines 3049–3052 state exactly these two attributions.

## Previous findings

- R01 — repaired: README 2282–2283, 2357–2359, 2363–2364, 2391, 2398 and 2930–2931 now cite Theorem 7.3.2(f), Proposition 7.2.6(iii), Theorem 7.3.2(c),(a), (b),(d), (d),(b) and (e). Lines 3190–3199 cite Lawson Proposition 9.26, p. 30, for the fracture square, and References list both.
- R02 — repaired: lines 627–647 run the route for two laws classified by φ,θ and give "t₀·θ(v_h)=φ(v_h)·t₀^(p^h)". F_h appears only as the comparison "For F=F_h … these are Ravenel's equations (A2.2.13)". The non-strict input this repair cites is R01 above.
- R03 — repaired: three Checks blocks were added:
  - lines 2420–2433: B(1) against K(1), P(1) against H(BP_*/p), and π_*P(∞);
  - lines 2816–2829: T(0) and L_0^f, powers v^a, and L_1^f on S/p;
  - lines 2887–2904: Γ_0^f, Γ_1^f against the cofiber, and the k=2 cell degrees.

## Verified sound

**Sources checked at the text (the seeded targets in the changed passages).**
- `ravenel-orange`:
  - Proposition 7.2.6(iii), p. 79 (lines 3015–3022);
  - Theorem 7.2.7 and the paragraph of (7.2.8), p. 80 (lines 3028–3052);
  - Theorem 7.3.2(a)–(f), p. 82 (lines 3120–3128): each part states the README identity it is cited for;
  - Lemma 6.1.3, p. 58 (line 2233).
- `lawson-bousfield` (arXiv v1; the manifest records `version_note` and `arxiv = "2002.03888v1"`): Proposition 9.26 is on printed p. 30 (lines 1249–1270). Its hypothesis is L_K L_E X≃0 for all X, and its corner is L_(E∨K).
  - The README's L_(K(n))L_(n−1)≃0 (line 3176) is that hypothesis with E=E(n−1), K=K(n).
  - ⟨E(n−1)⟩∨⟨K(n)⟩=⋁_(i≤n)⟨K(i)⟩=⟨E(n)⟩ by 7.3.2(d).
  - Lawson's two proof steps (locality of the pullback, then detection by E and K) are the README's two steps.
- `ravenel-green`:
  - Lemma A2.1.26, p. 360 (line 20326), states t₀ a unit;
  - Theorem A2.2.6, p. 365 (line 20682);
  - Definition A2.2.11, Theorem A2.2.12 and its proof, with (A2.2.13) and the remark "the proof of Theorem A2.2.6 is still valid if t₀≠1", p. 367 (lines 20786–20817).

**Gate, build and Lean.**
- The gate rerun and the dependency check are as stated above.
- `Suggested.lean` is unchanged since `27be4b9` (`git diff --stat` is empty). The `#check @name` comparison of the review of `27be4b9` therefore still holds. `signatures.md` matches it: the Lean binders of `nonempty_formalGroupIso_iff_height_eq` are the README's (lines 613–618), and nothing is lost.
- The rewritten F1.5 prose keeps the statement's generality: separably closed k, characteristic p, commutative F and G.

**Cross-roadmap citations resolved at this head.**
- TopologicalKTheory, which changed in this round: Conventions `β=[L]−1` with L the tautological O(−1) (lines 271–274); T2 item 5, "Positive Adams operations" (984), with ψᵏ(β_n)=kⁿβ_n (1053).
- F3.2 (1209–1245) defines H_n as Ravenel's F_n and consumes F1.5's classification. This is consistent with the rewritten lines 619–623 and with the Layer 1 Dependencies (710–716).
- F3.3's Check K(n)∧H𝔽_p≃0 (1302) is the input of the new P(1) Check.
- The v^a=w^b input of the new telescope Check is owned at lines 2551–2553.
- L_(−1)^f=0 is defined at line 2851, as the Γ_0^f Check needs.

**Ownership and overlap.**
- `roadmaps grep` for "chromatic fracture" finds GeneralAlgebraicKTheoryPartII §4.8 (#1742, line 782). That is the finite square for T(0)∨⋯∨T(m) and L_n^f, citing BordismFormalGroups F6.1; it is a different object from F6.4's E(n)-local square.
- Overlap lead: the anchor `#f65-local-group-actions-and-completion-comparisons` is cited at GeneralizedCohomology line 46, on main and at #1187. In both, the link is pinned to blob `d525554`, where the anchor exists, so the citation does not break. The previous review passed this text.
- #1808 and #1854 change this folder. The description orders them after this pull request.
- Ownership was checked with `roadmaps grep` on the changed objects only, not over all heads.

**Adversarial pass.** "Prev. k" is row k of the review of `27be4b9`, carried forward because the diff leaves that statement untouched. N-rows cover the changed statements.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Prev. 1–4 `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ/𝔾ₘ; X+Y+uXY; twist over 𝔽_p; imperfect k | heights ⊤/1; u^(p−1)x^p of height 1; X^p ↦ p and pu in ℤ_p; separable t₀ equation | as in the review of 27be4b9 | — |
| Prev. 6–11 `isPrime_and_invariant_iff_eq_heightIdeal` | ⊥, (4), (a₁₁), (2,a₁₁−1), ⊤, p=2 | as in the review of 27be4b9 | holds; `hI` needed | — |
| Prev. 12–16 `IsStarIso`, `lubinTate_universal_deformation` | [1+p] on 𝔾ₘ; h=1; 𝔾ₐ over 𝔽_p[ε]; R=ℤ | as in the review of 27be4b9 | holds; `hF₀` needed | — |
| Prev. 17–33 F1.1–F5.4 targets and Checks | as listed there | as in the review of 27be4b9 | holds | — |
| Prev. 37–38 F6.5, F6.6 | K(n) with trivial C_p; [2] | as in the review of 27be4b9 | holds | — |
| N1. F1.5 route, x^(p^h) coefficient | general h, F,G by φ,θ | left (i,j)=(0,h): t₀θ(v_h); right (h,0): φ(v_h)t₀^(p^h); cross terms have degree ≥2p^h | t₀^(p^h−1)=θ(v_h)/φ(v_h), as stated | — |
| N2. F1.5 route, x^(p^(h+i)), i≥1 | where t_i occurs | only t_iθ(v_h)^(p^i) and φ(v_h)t_i^(p^h) in that degree; d/dT of φT^(p^h)−θ^(p^i)T−c_i is −θ(v_h)^(p^i)≠0 | separable, p^h roots | — |
| N3. i=0 roots | p=2, h=2 | T(φT³−θ): 0 and three nonzero cube roots of θ/φ in 𝔽̄₂ | 4=p^h roots, 3 units | — |
| N4. reduction to (A2.2.13) | φ(v_h)=1 | t₀θ(v_h)=t₀^(p^h), as at `ravenel-green` line 20812 | agrees | — |
| N5. h=1 scaling Check | p=3, a=1, b=2 over 𝔽_3 | c·a(x/c)³=ac^(−2)x³ is G iff c²=2; squares in 𝔽_3^× are {1}; over 𝔽_9, c=i with i²=−1=2. Directly, g=λx+⋯ forces λ²=a/b=2 | not isomorphic over 𝔽_3, isomorphic over 𝔽_9 | — |
| N6. the old equation, in the Check | p=3, a=2, b=1 | t₀θ(v₁)=t₀³ gives c²=1/b=1, so the target is v₁↦ac^(−2)=2≠b | not G, as the Check says | — |
| N7. route input, non-strict f | v₁↦a, f⁻¹=t₀x | target θ(v₁)=a·t₀^(p−1); identity gives t₀θ(v₁)=a·t₀^p; the owned bullet has only t₀=1 | true; not a target | R01 |
| N8. ⟨Z⟩=⟨cofib f⟩∨⟨Tel f⟩ (7.2.6(iii)) | Z=S/p, f=v₁ | K(1)∧cofib=0 (type 2) and K(1)∧Tel≠0; H𝔽_p∧Tel=0 and H𝔽_p∧cofib≠0 | holds; locator right | — |
| N9. 7.3.2 locators | (a)–(f) | lines 3121, 3122, 3123, 3124, 3125 and 3127 match the README identities at 2364, 2391, 2398 and 2931 | right | — |
| N10. (7.2.8) locator | map and spectrum | line 3049 gives 6.1.3; line 3050 gives 7.2.7 | attribution half wrong | R02 |
| N11. fracture square (Lawson 9.26) | n=1, X=S_(p), p odd | π₀: ℚ⊕ℤ_p→ℚ_p onto with kernel ℤ_(p); π₋₁: 0⊕ℤ_p→ℚ_p injective, so π₋₁L₁S=0; π₋₂L₁S=ℚ_p/ℤ_p; K(1)∧Hℚ=0 | true; hypothesis holds | — |
| N12. B(1) Check | degree 2(p²−1) | π B(1) is spanned by v₁^(p+1), v₂ (dimension 2); π K(1) by v₁^(p+1) (dimension 1) | distinct spectra | — |
| N13. P(1) Check | H(BP_*/p) | equal π_*; K(1)∧H(BP_*/p)=0, while K(1)∧P(1)≠0 by ⟨P(1)⟩≥⟨K(1)⟩ | excludes the wrong model | — |
| N14. P(∞) Check | p=2, degree 2 | BP_*/I₁ has v₁; BP_*/I₂=0 there (\|v₂\|=6) | colimit 0 | — |
| N15. T(0)/L₀^f Check | π₃, S/p | π₃S_(p)⊗ℚ=0; S/p∧Sℚ has π_*=0 since p is invertible | holds | — |
| N16. v^a Check | every a-th term | a cofinal subsequence has the same hocolim | holds | — |
| N17. L₁^f Check | S/p, S/(p,v₁) | K(1)_*(S/p)=K(1)_*⊕ΣK(1)_* (p=0), rank 2 and preserved by v₁⁻¹; L₁^f kills the type-2 complex | holds | — |
| N18. Γ₁^f Check | long exact sequence | π₀F=ker(ℤ_(p)→ℚ)=0; π₋₁F=ℚ/ℤ_(p); the cofiber variant has π₀=ℚ/ℤ_(p) | holds | — |
| N19. Γ₂^f Check | p odd, a=(1,1) | D(M) cells 0, −1, −(2p−1), −2p; Σ^(−2p)BP/(p,v₁) cells −2p, −2p+1, −1, 0; a shift of −2 gives cells from −2 | formula matches; −k alone fails | — |

## Not verifiable

- Settled as uncertified and cited by locator only, as in the review of `27be4b9`: Hovey–Strickland, Bousfield 1979, Hopkins–Smith, Devinatz–Hopkins–Smith, Johnson–Wilson, Würgler, Greenlees–Sadofsky, Landweber–Ravenel–Stong, Adams, Wilson II, Quillen 1971, Thom, Toda, James and Symonds. None of them is cited by a changed passage.
- Ravenel 1984 (*Localization with respect to certain periodic homology theories*): Proposition 7.2.6 and Theorem 7.3.2 say they are proved there. The README cites the book's statements, which I read; I did not read the 1984 paper.

## Source issues

- none
