# Review of BordismFormalGroups (pull request #1807 at 3af9fd1)

**Verdict:** accepted

This is an incremental re-review of the 84 lines of `TauCetiRoadmap/BordismFormalGroups/README.md` that changed since `c8821a4`. `Suggested.lean` is unchanged.

- **Previous findings.** Both findings of the review of `c8821a4` are repaired, and neither repair introduces a new problem.
- **New findings.** None. The changed passages are:
  - the AlgebraicTopology supplier contract (§8.8c);
  - F1.5's isomorphism bullet, the new identity bullet, the route that uses them, its *Needs:* line and the h=1 Check;
  - F6.3's v_n self-map locators and its (7.2.8) locator;
  - the References entry for *Nilpotence and Periodicity*.

  I checked each of them against its source, its supplier or a computed instance (table below).
- **Gate.** The worker's gate at this head passes every check, including `build=0`. My rerun differs only in `outside-folder=23`. Those 23 files are the README and `Suggested.lean` of the sibling folders that the brief names as this pull request's own (ComplexKahlerGeometry contributes only its README). `git diff --stat origin/main...HEAD` with all 13 folders excluded is empty.
- **Dependency check.** Output: `depcheck: 236 roadmaps, 2148 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Lean.** `lake env lean` on `Suggested.lean` gives three `sorry` warnings (lines 75, 90 and 116) and nothing else.

## Previous findings

- R01 — repaired: README 567–593 now say an isomorphism out of a p-typical law has p-typical target exactly when f⁻¹=Σ^F t_i x^(p^i), t₀ a unit. They prove the identity "for every isomorphism of p-typical laws, strict or not" from f⁻¹([p]_G(x))=[p]_F(f⁻¹(x)). The *Needs:* at 685–687 cites "the isomorphism bullet and its identity, both for a unit t₀".
- R02 — repaired: README 2810–2813 now read "the paragraph of (7.2.8), p. 80: of the map by the uniqueness of v_n maps, Lemma 6.1.3, p. 58, and of the spectrum by the class invariance Theorem 7.2.7". The References entry (line 3800) adds Lemmas 6.1.1, 6.1.3 and 6.1.4, p. 58.

## Verified sound

**The R01 repair, line by line (README 567–593, 650–661, 683–688, 712–720).**
- The p-typicality criterion matches `ravenel-green`:
  - lines 20326–20333 (Lemma A2.1.26, p. 360) state it for t₀ a unit;
  - lines 20354–20387 (the proof, pp. 360–361) give the unique expansion Σ^F_(i>0) c_i x^i with c₁ a unit, and show that the target is p-typical exactly when c_(qi)=0 for every prime q≠p. That is the README's "c_i=0 for every i that is not a power of p".
- The strict clause cites "the paragraph after Lemma A2.1.26 and Theorem A2.1.27, p. 361", which is lines 20390–20407: VT=V[t₁,t₂,…] because t₀=1, and (iv) gives η_R(ℓ_n). Theorem A2.2.6 is at line 20682, p. 365.
- The new identity bullet proves the non-strict identity itself, so it no longer rests on the remark in the proof of Theorem A2.2.12 (line 20809, p. 367). I checked each step:
  - The left side is f⁻¹ applied to [p]_G(x)=Σ^G θ(v_j)x^(p^j), which is (A2.2.4), line 20571, pushed forward along θ. Since f⁻¹ turns G-sums into F-sums, each term becomes Σ^F_i t_i θ(v_j)^(p^i) x^(p^(i+j)).
  - The right side is [p]_F applied to Σ^F_j t_j x^(p^j). It needs [p]_F to be an endomorphism of F, which holds because the bullet assumes F commutative.
  - Both pinned inputs exist in `TauCeti/RingTheory/FormalGroup/NSMul/Basic.lean` at the pin: `TauCeti.FormalGroupHom.subst_nsmulSeries` (line 418; for a homomorphism f from F to G, f([n]_F(T))=[n]_G(f(T))) and `FormalGroup.nsmulHom` (line 195, under `[F.IsComm]`).
  - The *Needs:* line's "the pinned n-series (F1.1)" covers them. F1.1 (lines 313–350) names `nsmulHom` and the module `NSMul.Basic`, but not `subst_nsmulSeries` by name. This is a remark only: the input exists at the pin.
- F1.5's route now says why satisfying the identity gives G. The coefficient of x^(p^n) on the left is t₀·θ′(v_n) plus terms in θ′(v_j) for j<n, so the identity determines the transported law's classifying map θ′ recursively.
  - For n<h both sides vanish at x^(p^n) in characteristic p: every nonzero term has j≥h on the left and i≥h on the right.
  - For n=h+i the equations are the ones the route solves. So θ′=θ follows by induction, and the argument is complete.
- `nonempty_formalGroupIso_iff_height_eq` keeps its generality: separably closed k, characteristic p, commutative F and G. The README lines 632–637 and the elaborated type agree.
- Downstream citations still resolve: F3.1 (1200–1208), F3.2 (1237, 1254) and F5.1 (1675) cite F1.5's V, (V,VT) and "its right-unit formulas". Those formulas are still in the strict bullet at 575–579.

**Seeded sample, where the changed passages touch it.**
- F6.3 (`ravenel-orange`):
  - Lemma 6.1.1 (line 2228) gives "some power of v_n" on K(n)_*;
  - Lemma 6.1.3, "Uniqueness of v_n-maps" (line 2233), gives f^i=g^j;
  - Lemma 6.1.4, "Extended uniqueness" (lines 2235–2251), covers any h:X→Y and reduces to 6.1.3 when h is the identity;
  - all three are on printed p. 58 (line 2211 is that page's running head);
  - (7.2.8) and Theorem 7.2.7 are on printed p. 80 (line 3024). Line 3049 attributes the map independence to 6.1.3 and line 3050 attributes the spectrum independence to 7.2.7.
  - The README defines a v_n self-map by nilpotence at the other heights, whereas Ravenel (lines 2180–2182) requires K(m)_*(f)=0. The lemmas still apply, because some power of the README's map satisfies Ravenel's condition. For 2(p^m−1) larger than d plus the cell range, the Atiyah–Hirzebruch spectral sequence collapses, so K(m)_*(f)=H_*(f;𝔽_p)⊗K(m)_*. That map is nilpotent with an exponent independent of m. The finitely many remaining m are nilpotent by hypothesis.
- F2.2 and the new AlgebraicTopology contract (README 214–220):
  - At this head AlgebraicTopology §8.8c, "Functorial abelian Eilenberg–MacLane models" (its README line 4316), builds K(A,n) for n≥2 as the realization of the simplicial abelian group Γ(A[n]), and proves ΩK(A,n)≃K(A,n−1).
  - F2.2 consumes both: line 836 takes "G a simplicial-group model of K(ℤ/p,n−1)", and line 814 uses the path–loop fibration K(ℤ/p,n−1)→P→K(ℤ/p,n).
  - AlgebraicTopology line 5346–5348 names BordismFormalGroups as a consumer of "§§8.8c–8.10's Eilenberg–MacLane models".
  - On main, AlgebraicTopology has no §8.8c (its §8.8 heading is at line 3682). The section is introduced by this pull request's own revision of AlgebraicTopology, so the citation is valid when the two merge together.
- The other sampled targets lie outside the changed passages. They were verified in earlier rounds and are not re-read here.

**Gate, build and Lean.**
- The gate and the dependency check are as stated above.
- `Suggested.lean` is unchanged since `c8821a4`. I still elaborated `#check @name` for its four declarations from a scratch file importing the built module:
  - `nonempty_formalGroupIso_iff_height_eq`, `isPrime_and_invariant_iff_eq_heightIdeal`, `IsStarIso` and `lubinTate_universal_deformation`;
  - each elaborated type equals the one in `signatures.md` and the README statement, and no binder is lost.
  - The "line 133" parse error in `signatures.md` comes from that tool's transcript, not from the file. `lake env lean` on the file reports only the three `sorry` warnings.

**Cross-roadmap citations, ownership and overlap.**
- AlgebraicTopology §§8.8, 8.8c and 8.10 resolve at this head, at lines 4226, 4316 and 4573.
- `roadmaps grep` for "A2.1.26", "A2.2.6" and "A2.2.12" across main and the open heads finds only this pull request's folders, #1808, #1854 and one source citation in ArithmeticKTheory (#1418, line 5050). That citation is a reference entry, not a second owner.
- No changed passage introduces a new object. The v_n and telescope edits add locators to targets that were already owned here.
- Overlap lead `#f65-local-group-actions-and-completion-comparisons`:
  - Main's GeneralizedCohomology line 46 pins the link to blob `d525554`, where the heading "F6.5. Local group actions and completion comparisons" exists (line 1508 of that blob).
  - At this head GeneralizedCohomology no longer carries the link. Nothing breaks.
- #1808 and #1854 also change this folder. The description's merge-order block orders them after this pull request (line 68). The description's paragraph on BordismFormalGroups still matches the head.

**Adversarial pass.**
- "Prev. k" rows are carried forward from the review of `c8821a4`, which itself carried the review of `27be4b9`; the diff leaves those statements untouched.
- Rows M1–M14 cover the changed statements, with the values computed here.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Prev. 1–4 `nonempty_formalGroupIso_iff_height_eq` | 𝔾ₐ/𝔾ₘ; X+Y+uXY; twist over 𝔽_p; imperfect k | as in the review of c8821a4 (heights ⊤/1; u^(p−1)x^p; Frobenius ↦ p, pu in ℤ_p) | holds | — |
| Prev. 6–11 `isPrime_and_invariant_iff_eq_heightIdeal` | ⊥, (4), (a₁₁), (2,a₁₁−1), ⊤, p=2 | as in the review of c8821a4 | holds; `hI` needed | — |
| Prev. 12–16 `IsStarIso`, `lubinTate_universal_deformation` | [1+p] on 𝔾ₘ; h=1; 𝔾ₐ over 𝔽_p[ε]; R=ℤ | as in the review of c8821a4 | holds; `hF₀` needed | — |
| Prev. 17–33, 37–38: F1.1–F5.4, F6.5, F6.6 | as listed there | as in the review of c8821a4 | holds | — |
| Prev. N4, N8, N9, N11–N19 (c8821a4): (A2.2.13), 7.2.6(iii), 7.3.2, fracture square, B(1), P(1), P(∞), T(0), v^a, L₁^f, Γ_k^f Checks | as listed there | as in the review of c8821a4 | holds | — |
| M1. p-typical target criterion (567–573) | F=𝔾ₐ over ℤ_(p); f⁻¹=t₀x+t₁x^p; f⁻¹=x+x², p odd | log_G=t₀⁻¹f⁻¹=x+(t₁/t₀)x^p, so p-typical; log_G=x+x² has x²-coefficient 1≠0 and c₂=1, so not p-typical | iff holds both ways | — |
| M2. identity, non-strict, characteristic 0 (580–593) | F classified by v₁↦a over ℤ_(p), f⁻¹=t₀x, p odd | [p]_G=px+_G a t₀^(p−1)x^p, so θ(v₁)=at₀^(p−1); left pt₀x+_F at₀^p x^p; right pt₀x+_F at₀^p x^p | equal as series | — |
| M3. identity, universal strict case | coefficient of x^p | left η_R(v₁)+p^p t₁; right v₁+pt₁; the only degree-1 summand is px, so no cross term in degree p | η_R(v₁)=v₁+(p−p^p)t₁, matching the Check at 615–618 | — |
| M4. pinned inputs of M2's proof | f⁻¹∘[p]_G=[p]_F∘f⁻¹; [p]_F additive | `TauCeti.FormalGroupHom.subst_nsmulSeries` (NSMul/Basic.lean 418); `FormalGroup.nsmulHom` (195, `[F.IsComm]`) | present at the pin | — |
| M5. route: identity determines the transported law (654–661) | coefficient of x^p, characteristic 0; x^(p^n), n<h, characteristic p | t₀θ′(v₁)+p^p t₁ = φ(v₁)t₀^p+pt₁, so θ′(v₁) is fixed (t₀ a unit); for n<h both sides 0 | θ′=θ by induction | — |
| M6. route, x^(p^h) coefficient | general h | left t₀θ(v_h); right φ(v_h)t₀^(p^h); cross terms have degree ≥2p^h | t₀^(p^h−1)=θ(v_h)/φ(v_h) | — |
| M7. h=1 Check, new sentence (715–720) | p=3, a=1, b=2 over 𝔽_3 and 𝔽_9 | x³: left 2t₀+27t₁=2t₀, right t₀³+3t₁=t₀³, so t₀²=2; squares in 𝔽_3^× are {1}; in 𝔽_9, t₀=i with i²=2 | not isomorphic over 𝔽_3, isomorphic over 𝔽_9 | — |
| M8. h=1 Check, the F=F₁ equation | p=3, a=2, b=1 | t₀·1=t₀³ gives c²=1; target v₁↦ac^(−2)=2≠b | not G, as stated | — |
| M9. Lemma 6.1.1 normalization (2572–2575) | Adams maps at p=2 and p odd | 8=2·4·(2−1), a=4; 2p−2=2·1·(p−1), a=1; degree id=2a(p^n−1) with d>0 forces a>0 | matches `ravenel-orange` line 2228 | — |
| M10. Lemma 6.1.3 (2576–2578) | S/p, p odd, v=α (d=2p−2), w=α² (e=4p−4) | a=2, b=1: ad=4p−4=be and α²=w | holds; line 2233 | — |
| M11. Lemma 6.1.4 (2578–2580) | h=id; h=p·id on S/p, p odd | the first reduces to 6.1.3 (line 2250); the second is the zero map and commutes trivially | holds | — |
| M12. README's definition against Ravenel's | S/p, v₁ map of degree d=2p−2 | for 2(p^m−1)>d+1, K(m)_*(f)=H_*(f)⊗K(m)_*=0, since H_*(f)=0 (d>1) | a power satisfies Ravenel's definition | — |
| M13. (7.2.8) attribution (2810–2813) | map and spectrum | line 3049: 6.1.3; line 3050: 7.2.7; p. 80 at line 3024 | right | — |
| M14. AlgebraicTopology §8.8c contract (218) | A=0; A=ℤ/p, n=1 and n≥2 | K(0,n) is a point (8.8c Check); n=1 is the bar model of ℤ/p; n≥2 is \|Γ(ℤ/p[n])\|, a simplicial abelian group, as F2.2 line 836 requires | supplied; consumer named at AlgebraicTopology 5346 | — |

## Not verifiable

- Settled as uncertified and cited by locator only, as in the earlier reviews: Hovey–Strickland, Bousfield 1979, Hopkins–Smith, Devinatz–Hopkins–Smith, Johnson–Wilson, Würgler, Greenlees–Sadofsky, Landweber–Ravenel–Stong, Adams, Wilson II, Quillen 1971, Thom, Toda, James and Symonds. No changed passage cites any of them.
- In the `ravenel-green` extraction, Lemma A2.1.26 reads "if" (line 20328), and the proof's equivalence word is missing (line 20387), probably a lost "ff" ligature. I did not see the print. The README's "exactly when" follows from the proof's argument, which gives both directions.

## Source issues

- **Gap** in ravenel-green at the proof of Theorem A2.2.12, p. 367: the source says the proof of Theorem A2.2.6 stays valid for t₀≠1, but that proof uses Theorem A2.1.27(iv), stated with t₀=1, and logarithms, which are unavailable in characteristic p; it should replace (iv) by t₀η_R(ℓ_n)=Σℓ_i t_(n−i)^(p^i), run the argument over the torsion-free ring classifying non-strict isomorphisms, then specialize; affects nothing.
