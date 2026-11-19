# Review of FuchsianOrbifolds (pull request #2576 at f7bf5f9)

**Verdict:** accepted

**Summary.** Accepted, with no finding, no small correction and no format note. This is an incremental re-review of the 33 lines changed since `090b043`: the two small corrections and the format note of the previous review are repaired, the repairs introduce nothing new, and the pull request's description agrees with this head. Two questions for the author and two for the human reviewers are carried over; none blocks.

## Questions for the author

- §5.1 says the cup-product pairing on `H¹(X; ℚ)` is nondegenerate "by that duality over the field `ℚ`". Besides the cap isomorphism of AlgebraicTopology §6.4 this uses `⟨a ⌣ b, [X]⟩ = ⟨a, b ⌢ [X]⟩`, up to sign, and universal coefficients over ℚ. AlgebraicTopology §6.4 promises field-coefficient corollaries without naming them, and I found no cup–cap adjunction by name in its §§6.2–6.4. Is the nondegenerate pairing one of those corollaries, or should the route name the identity as its own step?
- §§0.1 and 0.2 cite Beardon, Chapters 7–8, and Katok, §§2.1–2.4, for second countability of PSL(2,ℝ) and for the isometric action of the elements of negative determinant. Do those chapters state these facts? Neither text could be opened.

## Previous findings

- The previous review had no finding (no R-numbered remark). Its three non-blocking remarks:
- C01 — repaired: §5.6 (lines 901–906) now states only the Riemann–Hurwitz formula and the multiplicativity of `χ_orb`; Scope (lines 1250–1256) gives the congruence genus formula to ModularForms §10A and records NoncongruenceModularForms §2.3.
- C02 — repaired: "AlgebraicTopology §6.3 turns that orientation into a fundamental class `[X]`" (line 790); §6.3 is in the *Needs:* line (796), the Layer 5 Dependencies (991) and the AlgebraicTopology contract (1541–1542).
- N01 — repaired: no section cites Diamond–Shurman, Theorem 3.1.1 any more, so the References entry "§§2.1–2.4" (lines 1558–1559) covers every locator the text uses.

## Verified sound

| Statement | Instances | Values computed (README side / supplier or computation) | Result |
|---|---|---|---|
| 5.6 Fuchsian Riemann–Hurwitz (cited by the changed Scope sentence) | `Γ(2)`, `Γ₀(11)` in `PSL(2,ℤ)` | `R = 3+4+3 = 10`, `2g−2 = 6·(−2)+10 = −2`, `g=0`; `R = 6+8+10 = 24`, `2g−2 = 0`, `g=1` | holds |
| Scope: genus formula owned by ModularForms §10A | `Γ(2)` `(6,0,0,3)`, `Γ₀(11)` `(12,0,0,2)`, level one `(1,1,1,1)` | `1+1/2−3/2 = 0`; `1+1−1 = 1`; `1+1/12−1/4−1/3−1/2 = 0`; agree with the §5.6 values above | holds; ModularForms README lines 1158–1161 derive it by Riemann–Hurwitz |
| Scope: NoncongruenceModularForms §2.3, every finite-index subgroup | integral form `12g+3ε₂+4ε₃+6ε∞ = 12+n` on `Γ(2)`, `Γ₀(11)` | `0+18 = 12+6`; `12+12 = 12+12`; its README lines 638–655 compare with the genus of §5.1 via §§5.3, 5.5–5.6 | as described |
| 5.1 route through AlgebraicTopology §6.3 | `P¹`, torus, genus 2 | `b₂=b₀=1`, `χ = 2, 0, −2`, `b₁ = 0, 2, 4` even; §6.3 heading "Homological orientation and fundamental classes", smooth–homological bijection at its lines 2284–2288 | holds; supplier states what it is cited for |

The rows for the untouched statements stand as in the previous review, of `090b043`.

- Changed passages read in full: §5.1 route and *Needs:* (lines 788–798), §5.6 (895–912), Layer 5 Dependencies (991–995), Scope "Modular forms" (1249–1261), AlgebraicTopology contract (1539–1548).
- Cross-roadmap citations resolved on main: AlgebraicTopology §§6.3, 6.4, 8.7 (README lines 2189, 2571, 3325); ModularForms §10A (line 1150; its *Needs:* names FuchsianOrbifolds Layers 0–6); NoncongruenceModularForms §2.3 (line 638). All three roadmaps are on main, so no upward edge arises.
- Description against the head: 4 headline theorems in the overview; layer order 0, 1, 2, 3, 4, 5, 4a, 6; 8 Examples and 8 Dependencies subsections; 57 Check bullets; the four supplier headings; References identical to main up to line wrapping; `Suggested.lean` differs from main in comments only (9 declarations, one `export` of 2 names); TeichmullerGeometry and ArithmeticFuchsianGroups named nowhere; the bullets on §6.3 and on the congruence genus formula describe this head. The bullet of the earlier description that put the level-one case of §5.6 under "What it adds" is gone.
- Automatic checks: all passed. Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. Nothing changed outside the folder.
- Elaboration: `Suggested.lean` gives eight `sorry` warnings (lines 58, 74, 84, 98, 110, 118, 129, 138) and nothing else; the file is unchanged since `090b043`, so the one-tactic probes of that review stand.
- Overlap check: read FuchsianOrbifoldsPartII, KleinianGroups, ArithmeticFuchsianGroups, TeichmullerGeometry, GroupActionsOnRiemannSurfaces (open), BallQuotientsAndComplexHyperbolicLattices, NoncongruenceModularForms, ConformalMappingPartII (main), as in the previous review; the third list is empty. Congruence genus formula: owner ModularForms §10A, general finite-index form NoncongruenceModularForms §2.3, now cited and no longer stated here. Area formula, π/21, π/3, topological genus and Riemann–Hurwitz: owned here.

Source independence: changed passages only; 5 passages compared, none carries a source locator or source wording (the one removed sentence held the only locator touched, Diamond–Shurman Theorem 3.1.1); largest share Diamond–Shurman, 20 of 80 locators, text and contents not readable; no layer added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 4a states Siegel's minimal covolume π/21 (Siegel 1945) and §5.7 the signature area formula, which Martin (2013, Theorems 2.1–2.2) presents as the two-dimensional case of the minimal-covolume problem for hyperbolic lattices. Rests on Martin2013 lines 196–227 and the README's references.

## Not verifiable

- Beardon1983, Forster1981, FarkasKra1992, DiamondShurman2005, Serre1973, Stillwell1992 and Siegel1945 are cited by locator only; Katok and Miranda are not in the sources manifest. The changed passages cite none of them, so no sampled locator fell in the change.

Automatic checks set aside as false positives: the citation resolver lists the README's `RiemannSurface.riemannHurwitz` as found nowhere, but `Suggested.lean` declares it through its `export` line (line 151).

## Source issues

- none

## For the human reviewers

- Not tested: Diamond–Shurman (20 of 80 locators, cited by locator only) and Katok (17, not in the manifest) could not be read, so wording and arrangement were compared with Martin2013 alone, in the previous review.
- Licence: Katok and Miranda are cited in `TauCetiRoadmap/FuchsianOrbifolds/README.md` (References, lines 1556–1557 and 1564–1565) but have no entry in the roadmap's sources manifest.
