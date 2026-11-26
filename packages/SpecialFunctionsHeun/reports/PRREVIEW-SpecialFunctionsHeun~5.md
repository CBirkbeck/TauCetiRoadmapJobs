# Review of SpecialFunctionsHeun (pull request #2540 at 20f6bc1)

**Verdict:** accepted

**Summary.** Accepted: the 53 changed lines repair the small correction and both format notes of the previous review, and the one statement they add, the cubic reduction 31.7.4 at a sixth root of unity, holds as stated in the README and in `Suggested.lean` (recomputed at five points and a second parameter set; the radius `1/7` keeps the Gauss argument below `0.9412`). There are no findings, no small corrections and no format notes. Two items remain for the human reviewers: the declared reuse of the author's own prior formalization, and the main book source, which could not be read.

## Previous findings

- C01 — repaired: the Layer 7 Examples now give the spheroidal equation "only after a change of the unknown", `w = e^{κz}(z(1 − z))^{μ/2} v`, `κ² = −4c²`, with `γ = δ = μ + 1`, `ε = 2κ`; Downstream consumers reads "(Layer 7, Examples)".
- N01 — repaired: the module docstring lists the prose headlines section by section, and 31.7.4 is stated as `heunLocal_sixthRoot_eq_ordinaryHypergeometric`, with the same hypotheses as the README's bullet.
- N02 — repaired: Scope and ownership reads "The numbers are those of the layers above"; the Summary reads "Iwasaki–Kimura–Shimomura–Yoshida".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 8.2, 31.7.4 (README bullet and `heunLocal_sixthRoot_eq_ordinaryHypergeometric`) | `(α, β) = (0.3, 1.1)` at `z = 0.13`, `−0.14`, `0.05 − 0.12i`, `0.1 + 0.1i`, `0.3`; `(−0.7 + 0.2i, 2.3)` at `0.1 − 0.08i`; `α = 0` | both sides `1.0276950269 − 0.0170858224i` at `0.13`; differences `≤ 2.3·10⁻¹⁵` everywhere; `α = 0`: both sides `1` | holds | none |
| 8.2 radius for 31.7.4 | `r = 1/7`, `|b| = √3`; Gauss argument at the sample points | `3√3r + 9r² + 3√3r³ = 0.94113 < 0.95`; `|1 − (1 − bz)³| = 0.553, 0.893, 0.701, 0.575`; at `z = 0.3`: `0.970` | holds | none |
| 8.2 negative control (conjugate root) | `a = ½ − i√3/2`, `q`, `b` unchanged, `z = 0.13` | difference `0.0579309` against the README's `0.0579` | holds | none |
| 8.2 hypothesis on `γ` | `(α + β + 1)/3 = −n` | `R_n = a(n + 1)(n + γ) = 0`: the recurrence divides by zero, as in the siblings 31.7.2 and 8.1; the hypothesis is in the README and in Lean | needed, present | none |
| Layer 7 Examples, Mathieu | `z = cos² x` by the chain rule | `4z(1 − z)w″ + (2 − 4z)w′ + (a + 2q − 4qz)w`; `f = ½/z + ½/(z − 1)`, `g = (qz − (a + 2q)/4)/(z(z − 1))` | holds | none |
| Layer 7 Examples, spheroidal | `w = e^{κz}(z(1 − z))^{μ/2}v`, by hand with `s = κ + μ/(2z) + μ/(2(z − 1))` | `2s + p = 2κ + (μ + 1)(1/z + 1/(z − 1))`; `1/z²` terms cancel; `κ² + 4c² = 0`; rest `(2κ(μ + 1)z − κ(μ + 1) − λ + μ(μ + 1))/(z(z − 1))` | holds | none |
| Layer 7 Examples, behaviour at `∞` without the exponential | coefficients as `z → ∞` | `f → 0`, `g → 4c²`; characteristic equation `X² + 4c² = 0`, roots `±2ic` | holds | none |
| 2.3 Check, Kummer's 24 solutions | Maier's count at `n = 3`; DLMF §31.3(iii) | `2n = 6` classes of `2^{n−2}(n − 1)! = 4`; DLMF31-3 lines 553–555 has 4 sets of 6 | holds | none |

The rows of the previous review, of `0274267`, stand for every statement the change does not touch.

- Source locators checked against the text: 3 (DLMF31-7 line 145 for 31.7.4, every parameter and the argument of `F`; DLMF31-12 lines 98–100 for the spheroidal and Mathieu special cases; DLMF31-3 lines 553–555 for the closing sentence of §31.3(iii)).
- Library declarations: all pinned names at the end of `Suggested.lean` elaborate; the new theorem uses only Mathlib's `ordinaryHypergeometric` and `Real.sqrt` and the file's own `heunLocal`.
- Cross-roadmap citations: the change adds none; SpecialFunctionsLame (open) cites this roadmap's 2.4, 4.1–4.3 and 6.2, none of which the change renumbers.
- Dependency check: `depcheck: 106 roadmaps, 1216 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: exit 0, 37 `sorry` warnings and no other. The elaborated type of the new theorem was compared with the README bullet (`(α + β + 1)/3 ≠ −n` for every natural `n`, `‖z‖ < 1/7`, the root as `1/2 + ↑√3/2 · I`): they agree; the file has no `variable` block.
- One-tactic probe on a copy: `simp` and `rfl` both fail on the new theorem.
- Pull request text against this head: the description gives 37 theorems, the reductions 31.7.1–31.7.4, the docstring's list of prose headlines, the change of the unknown for the spheroidal equation and the Check of 2.3 on Kummer's 24 solutions; the head agrees with each.
- Headline theorems: as in the previous review, with 31.7.4 now stated in Lean.

Overlap check: read SpecialFunctionsLame, SpecialFunctionsMathieu (open) and SpecialFunctionsHypergeometric, SpecialFunctionsLegendre, SpecialFunctionsConfluent (main); nothing shared. SpecialFunctionsLame owns Lamé functions, Lamé polynomials and ellipsoidal harmonics and consumes the Lamé bullet of 2.4, the polynomial criterion and the double orthogonality from this roadmap, which lists Lamé function theory as outside; the supply runs one way.

Source independence: changed passages only; 3 passages compared with 1 source (DLMF Chapter 31, §§31.3, 31.7, 31.12), none shared beyond the formula 31.7.4 and standard names; largest share DLMF Chapter 31, as in the previous review (167 of about 288 locators); the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: Maier (2007), Theorems 4.3 and 4.7, proves the automorphism group and the split of the 192 solutions stated in 2.3, and Maier (2005), Theorems 3.7–3.8, the reductions of 8.2; the README's consumers section names PainleveEquations, whose 7.2 cites Heun-class equations. Rests on the two Maier texts read and on the README.

## Not verifiable

- Kristensson §8.6.2, pp. 160–161, with its factor `(1 − x²)^{μ/2}` and form (8.18), cited in the changed spheroidal example: paywalled; the example was checked by computation and against DLMF §31.12 instead.
- Maier (2005), Theorems 3.7–3.8, for 31.7.4: not reopened in this round; the identity was checked against DLMF 31.7.4 and numerically.
- The values of the new Check of 8.2 are confirmed to `2·10⁻¹⁶` (double precision), not to the `10⁻⁴⁰` the README gives.
- Ronveaux, Kristensson, Haraoka, Iwasaki–Kimura–Shimomura–Yoshida, Olver, Whittaker–Watson and the 2010 printed Handbook: as in the previous review; the change adds no locator into them except the one above.

Automatic checks set aside as false positives: the section comment at the end of `Suggested.lean` with no declaration under it introduces the `#check` lines that pin library declarations, which are allowed there.

## Source issues

- **Error** in DLMF Chapter 31 at §31.3(iii), closing sentence (release 1.2.8; DLMF31-3 lines 553–555): the source says Kummer's 24 solutions are equivalent in 4 sets of 6; it should be 6 sets of 4, one set for each of the six local solutions; affects nothing.
- **Error** in DLMF Chapter 31 at equation 31.10.8 (release 1.2.8): the source says the coefficient of the `φ`-derivative is `(1 − 2δ) cot φ − (1 − 2ε) tan φ`; it should be `(2δ − 1) cot φ − (2ε − 1) tan φ`, the form equivalent to its own 31.10.3; affects a stated result.

## For the human reviewers

- **Licence.** The README's "Prior formalization" section says the roadmap reuses the design of the author's own `lean-DLMF` (Apache-2.0), including the definitions behind six declaration names of `Suggested.lean`; the repository was not opened in this round.
- **Not tested.** Ronveaux (ed.), the main book source (56 locators, second after DLMF), could not be read: wording and arrangement were compared with DLMF Chapter 31 and Maier only.
