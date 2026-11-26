# Review of ArithmeticGaloisDuality (pull request #3184 at f9dd6d6)

**Verdict:** accepted

**Summary.** An incremental re-review of 0 changed lines since `f9dd6d6`: the folder is as the previous review accepted it, and this round read the pull request's title and description against the head. Every sentence of both agrees with the change (two added statements, in §D7.3 and §R02.4.4; the three Checks and the *Needs:* entry that leave *Nakamura cochain tensor comparisons* are now named as moved; `README.md` only). No finding and no small correction; one format note carried over, not blocking. Nothing is left for a human to decide.

## N01 — *Uniform vanishing of cocycles of bounded exponent* (§R02.4.4, README line 3083) carries no source locator

The proof sketch is complete from the cited targets, so nothing is unsupported, but its neighbours each end with a locator. The number-field input, finiteness of `Hom_cont(G_{L,S}, ℤ/m)`, is Milne, *Arithmetic Duality Theorems*, I §4, Lemma 4.9 and its proof, p. 56, the locator *Finiteness of `H¹(G_{K,S}, M)`* already has; a parenthesis naming it, and saying that the uniform form and the function-field argument are the roadmap's own, would let a reader place the statement.

## Previous findings

- The previous review, of this same head, had no finding (no R01).
- Its C01 — repaired: the description now reads "its Checks for `M = A` and `M = A/I`, its example of a non-surjective degree-one map for `M = ℤ_p[[T]]` … and its use of *Adic continuous-map flatness* move to the new statement".
- Its N01 — not repaired: the statement at README line 3083 still ends its proof sketch with the *Needs:* line and no locator. Written again as N01 above.

## Verified sound

| Statement | Instance | Computed: one side | Computed: other side | Result |
|---|---|---|---|---|
| Uniform vanishing, number field (§R02.4.4; description's second paragraph) | `K = ℚ`, `S = {3, ∞}`, `m = 3`, `U = G_S`, `B = ℤ/3` | `G_S^ab = ℤ₃^× ≅ ℤ/2 × ℤ₃`; mod 3: `ℤ/3`, so `Hom_cont(G_S, ℤ/3)` has order 3 | compositum is the cubic field `ℚ(ζ₉)⁺`; `N = Gal(ℚ_S/ℚ(ζ₉)⁺)`, index 3, normal, kills both nontrivial characters | holds; "inflated from the finite group `G_S/N`" correct |
| Same, function field, `m` prime to the characteristic | `F = 𝔽₃(t)`, `S = {∞}`, `m = 2` | `C_S(F) = F_∞^×/𝔽₃^× ≅ ℤ × (1 + 𝔪_∞)`, mod 2: `ℤ/2` (the pro-3 part is 2-divisible) | quadratic extensions unramified outside `∞`: only `𝔽₉(t)`; `Hom` has order 2 | finite, as the description says |
| Same, `m` divisible by the characteristic (description: "fails otherwise") | `F = 𝔽₃(t)`, `m = 3`, `y³ − y = t^j`, `j = 1, 2` | `c₁t + c₂t² = g³ − g`: `g` polynomial, right side of degree `3·deg g` | left side of degree 1 or 2 unless zero; so `g` constant, `c₁ = c₂ = 0` | independent characters, infinitely many over all `j`; fails as stated |
| Cochain tensor comparison (§D7.3; description's `C₂` sentence) | `G = C₂`, `A = 𝔽₂[ε]/(ε²)`, `σ = 1 + ε`, `M = 𝔽₂` | `(1 + ε)² = 1 + 2ε + ε² = 1`; `Hⁿ(C₂, A) = ker ε/im ε = 0` for `n ≥ 1`, so `H¹` of the derived tensor is `0` | degreewise: `A^{2ⁿ} ⊗ 𝔽₂ = 𝔽₂^{2ⁿ}`, and `H¹(C₂, 𝔽₂) = Hom(C₂, 𝔽₂) = 𝔽₂` | degreewise isomorphism holds, derived base change fails: description agrees with the Check |
| "Before, this was stated only for `G_{ℚ,Σ}` and `G_{ℚ_ℓ}`" | README at the merge base, *Nakamura cochain tensor comparisons* | merge base: degreewise isomorphism and flatness inside that paragraph, for those two groups | head: paragraph cites the new statement (line 5074 on), same hypotheses otherwise | description correct |
| "Every section named on the new *Needs:* lines exists and comes earlier" | nine targets | §R02.4.4 (line 3083) names lines 1402, 1539, 1638, 1696, 1807 and ProfiniteCohomology Layer 5 on main | §D7.3 statement (line 5001) names lines 4556, 4728, 4786 | all exist, all earlier |

The rows of the previous review for the untouched statements stand as in that review, of `f9dd6d6`.

- Title and description read sentence by sentence against the diff of the folder against `main` (192 lines, `README.md` only; 0 headings and 0 Lean declarations added or removed; the same 8 layers): 14 statements of fact checked, 0 contradicted. The two section numbers of the title are the headings at README lines 3081 and 4726.
- The description's sentence that a second reading applied "five corrections" describes the drafting, not the head, and was not checked.
- Internal and cross-roadmap citations resolved again: 10 (the nine above and *Exponent-two ramification fields*, line 2232).
- Source locators: none reopened this round (no changed passage); the three of the previous review stand.
- Dependency check: `depcheck: 94 roadmaps, 1066 edges, 0 problem(s)`; no UPWARD or CYCLE line. The automatic checks all pass.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ArithmeticGaloisDuality/Suggested.lean` gives 12 `sorry` warnings and nothing else; the file is unchanged against `main`, so the one-tactic probe and the `#check` comparison were not rerun.
- Other open pull requests changing this folder: #3177 merges cleanly with this head; #3027 is placed after this one by the description's merge-order block. No id is dropped on either side.

Overlap check: read SelmerIwasawaCohomology (main, #3177, #3187), NoncommutativeAndEquivariantIwasawa and InverseGaloisAndArithmeticFundamentalGroups (main); nothing shared. Both new statements are owned here only; SelmerIwasawaCohomology cites them.

Source independence: changed passages only; no passage changed since the previous review, whose comparison stands: 4 passages compared with 2 sources, none shared; largest share MilneADT, 86 of about 190 source mentions; contents not compared again, since the change adds, removes and reorders no layer.

Research link: §D7.3 is the degreewise base change beneath Nekovář's Selmer complexes (2006, §3.4) and Nakamura's comparisons for rank-two universal deformations (arXiv 2006.13647, Appendix B); the roadmap's Poitou–Tate and Greenberg–Wiles formulas are the duality inputs of Taylor–Wiles patching. Rests on the README's summary and on Nekovář §3.4 as read.

## Not verifiable

- Neukirch–Schmidt–Wingberg, VIII §1 and §3, the locators of the three function-field targets the new proof cites: no text in the sources cache. Those statements are untouched.

## Source issues

- none

## For the human reviewers

- none
