# Review of SpecialFunctionsMotionGroupsBessel (pull request #2933 at 699011d)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 58 lines changed since `f3fd2c3`: the four small corrections and two format notes of the previous review are all repaired, the new statement `IsCircleRealization.nonempty_intertwiner_iff` is true and elaborates, and the changed Check values were recomputed and agree. There is one small correction (the new theorem holds without its two hypotheses `R, R' ≠ 0`) and one format note, neither blocking. The five books still could not be read from a legal place, so their locators and the comparison of wording and arrangement with them are left to the human reviewers.

## C01 — The classification of the `T_R` holds without `R ≠ 0` and `R' ≠ 0`

The new bullet of 1.1 (README lines 180–183) and `IsCircleRealization.nonempty_intertwiner_iff` (`Suggested.lean` line 433) assume `R, R' ≠ 0`, so a reader concludes that `T_0` has to be excluded. It does not. For `R = R' = 0` the two realizations agree on every vector and the identity intertwines them, and `0 = 0`. For `R = 0 ≠ R'` the right side `R'² = 0` fails, and so does the left: `T_0` is trivial on translations, so `A T_0((a, 1)) = T_{R'}((a, 1)) A` with `A` invertible would force `T_{R'}((a, 1)) = 1`, whereas it multiplies the constant function by `e^{iR'⟨a, e(ψ)⟩}`; the README's own route says the same, since `R a_{n+1} = R' a_n` with `R = 0` gives `a_n = 0` for all `n`. The case `R' = 0 ≠ R` is symmetric. Either drop the two hypotheses from the Lean statement and the bullet, or keep them and say in the bullet that the statement extends to `R = 0`, where `T_0` is a class by itself.

## N01 — In the `m = 0` Check of 3.3 (line 446), "for `J` the series converges for every `λ`" is DLMF's remark for `J` with the upper signs of 10.23.1 (the ones used here); with the lower signs and non-integer `ν` the restriction `|λ² − 1| < 1` is needed. Adding "with the upper signs" makes the parenthesis exact.

## Previous findings

The previous review, of `f3fd2c3`, had no finding (no R-numbered remark); its small corrections and format notes are accounted for here.

- C01 (three-Bessel worked example and Hankel inversion) — repaired: "the integral is improper, `lim_{T→∞} ∫₀^T`. The general case follows from 2.2 by the pointwise Hankel inversion theorem … which 5.2 does not contain".
- C02 (10.23.1 cited outside the supplier's range) — repaired: "here `|λ² − 1| > 1`, outside the range `|λ² − 1| < 1` in which SpecialFunctionsBessel 4.2 states it … so the Check does not use that statement" (see N01 for the parenthesis).
- C03 (one wrong digit in 5.2) — repaired: the Check reads `−0.41081 82347 − 1.05668 67887 i`.
- C04 (10.7.3–10.7.4 for `Yₙ` at `0`) — repaired: "10.7.1 for `n = 0`, 10.7.4 for `n ≥ 1` and 10.7.5 for `n ≤ −1`", and the supplier contract lists 10.7.1, 10.7.4–10.7.5.
- N01 (5.1 "for integrable `f`") — repaired: "for every `f` … (for a non-integrable `f` both sides are `0`, since `f ∘ g⁻¹` is then not integrable either)", which matches the Lean statement.
- N02 (classification had no Lean statement) — repaired: `IsCircleRealization.nonempty_intertwiner_iff` is declared and named in 1.1 (see C01).

## Verified sound

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| 1.1 `nonempty_intertwiner_iff`, `R' = −R` | half-turn, `R = 0.6+0.9i`, `g = ((0.8,0.4), k_{1.1})`, `ψ = 0.37`, `f = e₂ + 0.3 e₋₁` | `−1.5718189504 − 2.1618944162 i` on both sides of `T_{−R}(g) S = S T_R(g)` | holds |
| 1.1 `nonempty_intertwiner_iff`, converse | `A e_n = a_n e_n`; derivative at `β = 0, π/2` | `R a_{n+1} = R' a_n`, `R a_{n−1} = R' a_n`; `a_{n+1}/a_n = R'/R = R/R'`, so `(R'/R)² = 1` | holds |
| 1.1 same, `R = 0` or `R' = 0` (C01) | `(0, 0)`; `(0, R' ≠ 0)` | identity intertwines, `0 = 0`; `a_n = 0` for all `n`, no invertible `A`, `R'² ≠ 0` | holds without the hypotheses |
| 3.3 route, `Yₙ` at `0` | `n = 0`; `n ≥ 1`; `n ≤ −1` | `(2/π) ln z`; `−Γ(n)(z/2)^{−n}/π`; `−cos(nπ)Γ(|n|)(z/2)^{−|n|}/π`, `cos(nπ) = ±1` | unbounded in each case |
| 3.3 Check, `m = 0` | `x = 0.9`, `t = 0.6` | `λ² − 1 = 3.7037`; series `0.2516855588`, `J₀(√(x² + 2x/t)) = 0.2516855588` | holds; upper signs of 10.23.1 |
| 5.1 `fourier_comp_motionApply` for every `f` | non-integrable `f` | `f ∘ g⁻¹` not integrable (the action preserves Lebesgue measure); both Bochner integrals `0` | holds |
| 5.2 angular-mode Check | `n = 2`, `b = 0.7π`, `ψ = 0.6` | `2π(−i)² e^{1.2i}(b²/8)e^{−b²/4} = −0.4108182347 − 1.0566867887 i`; README the same | holds |
| Worked example, three Bessel functions | `(1.3, 0.7, 1.5)`, `m = n = 0`; change of variable in 2.2 | `(2/π)/√Δ = 0.3500500923 = 1/(2πA)`; `dφ = 2r dr/√Δ`; integrand `O(R^{−1/2})`; `1/√Δ` integrable, `1/Δ` not | holds as now stated |

The rows of the previous review for the untouched statements stand as in that review, of `f3fd2c3`.

- Source locators checked against the text: DLMF 10.7.1, 10.7.3, 10.7.4, 10.7.5 and 10.23.1 with its remark on `J` and the upper signs, re-read this round; all as the changed passages cite them. No book locator.
- Cross-roadmap citations resolved: SpecialFunctionsBessel 2.2 (covers 10.7.1–10.7.7) and 4.2 (10.23.1 "for `|λ² − 1| < 1`") on main; SpecialFunctionsLegendre §3.2 on main (the new link resolves there); SpecialFunctionsBessel lists Hankel transforms only under its Beyond section, so the pointwise inversion theorem has no owner to cite.
- Elaboration of `Suggested.lean`: `sorry` the only warning, 59 of them. `#check @` of the new theorem compared with 1.1: same hypotheses and conclusion.
- One-tactic probe on the new theorem (`rfl`, `simp`, `infer_instance`, `simp` with the definition unfolded, `constructor <;> simp_all`): none closes it.
- Duplication: no other roadmap, open or on main, states the equivalence classes of the `T_R`; no Mathlib or Tau Ceti declaration about `ContRepresentation` of a motion group.
- Dependency check: `depcheck: 106 roadmaps, 1217 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- The pull request's title and description agree with this head: 59 targets, 52 proved in the prior formalization, seven not, the equivalence classes among them; suppliers as in the README.

Overlap check: read SpecialFunctionsGroupModels, SpecialFunctionsSU2MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsSU11MatrixElements, SpecialFunctionsAffineHeisenbergGroups, SpecialFunctionsBessel, LaguerreJacobi (as in the previous review; the change adds no object any of them owns); the equivalence classes of the circle models for complex `R` are owned here, and SpecialFunctionsGroupModels §2.6 owns the unitary inequivalence for real `R > 0`, which 1.1 cites.

Source independence: changed passages only; 5 formulas compared with 1 source (DLMF), each forced by the mathematics, no prose shared; the five books could not be read legally; largest share VK1, 47 of about 130 locators, its contents not read; the diff adds, removes and reorders no layer.

Research link: the headline targets are the classical theory of motion-group representations and Bessel functions of Vilenkin–Klimyk (1991, 1993), Miller (1968) and Dieudonné (1980), with the Hankel transform and the spherical functions of `(M(n), SO(n))` used in harmonic analysis on `ℝⁿ`; this rests on the README's sources, not on a text read here.

## Not verifiable

- VK1, VK2, KV, M, D: no legal copy was read (as in the previous review); every locator into them is unverified, including [VK1, §4.4.2 (8), pp. 197–198] in the changed worked example.
- The pointwise Hankel inversion theorem named in the changed worked example carries no locator and is owned by no layer or supplier; its classical statement (absolute integrability against `r^{1/2} dr`, bounded variation near `r`) is as I know it, not read in a source this round.
- The nine misprints of the sources that the README reports: what the sources print was not seen.

Automatic checks set aside as false positives: the section comment in `Suggested.lean` that heads the five `#check` lines pinning library declarations was reported as a heading with no declaration under it; pinning library declarations is what that block is for.

## Source issues

- none

## For the human reviewers

- Not tested: VK1 has the largest share of the locators (47 of about 130); its text and table of contents could not be read, so wording and arrangement were not compared with it, nor with VK2, KV, M or D.
- Licence: the README ("Prior formalization") says the Lean names are those of lean-SFVK (github.com/bjbraams/lean-SFVK, Apache-2.0, by the pull request's author), which proves 52 of the 59 targets; that repository was not opened.
- Sources: the README corrects nine formulas of its sources (References, last list); none could be checked against the printed text.
