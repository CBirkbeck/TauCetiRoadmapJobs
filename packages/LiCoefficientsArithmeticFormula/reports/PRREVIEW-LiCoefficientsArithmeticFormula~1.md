# Review of LiCoefficientsArithmeticFormula (pull request #2858 at f2afb5d)

**Verdict:** accepted

**Summary.** Accepted: no finding. The closed form for `λₙ`, the arithmetic limit for `η_j` and the local positivity statement were each rederived and recomputed, and they agree with the text and with `Suggested.lean`; the locators into Lagarias's paper are exact, including the sign misprint the README reports in his (4.13). There is one small correction and there are two format notes, none blocking. One thing is left for a human: Bombieri's 2000 paper could only be found on a host the project's source service does not classify, so the locators of 4.1 (Theorem 12, pp. 226–227, p. 184) were not checked against its text.

## C01 — The supplier contract places the smoothness of a convolution in a Mathlib file that does not contain it

In "From Mathlib" (README line 418) `HasCompactSupport.contDiff_convolution_left` is listed under `Mathlib/Analysis/Convolution.lean`. At the pin that file has no such declaration; it is at `Mathlib/Analysis/Calculus/ContDiff/Convolution.lean`, line 428. An implementer who opens the cited file finds nothing. Replace the path; the name and its use in 4.1 are right (a compactly supported smooth function convolved with a locally integrable one is smooth).

## N01 — A Check of 1.1 names the software rather than the computation

Line 98 says the values come "from mpmath's Stieltjes constants by series division". "From the Stieltjes constants `γ₀, …, γ₈` by series division of `ζ₁`" says the same and stays readable when the tool is forgotten.

## N02 — Mathlib already has the derivative of `Γℝ` at `1`

`hasDerivAt_Gammaℝ_one` (`Mathlib/NumberTheory/Harmonic/GammaDeriv.lean`, line 215) states `Γℝ'(1) = −(γ + log 4π)/2`, which with `Complex.Gammaℝ_one` is the `m = 0` gamma coefficient of 2.1 directly. The route through `Complex.digamma_one_half` and ZerosOfLFunctions 1.4 is also correct; the `*Needs:*` line of 2.1 would do well to name this lemma as well.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 definition of `η_j` (`zetaLogDerivCoeff`) | `j = 0, 1`; wrong model: Stieltjes sign | `η₀ = −ζ₁'(1)/ζ₁(1) = −γ = −0.5772157`; `η₁ = γ² + 2γ₁ = 0.33318 − 0.14563 = 0.1875462`; Stieltjes model gives `+γ` | agrees with Lagarias (4.5), (4.12); the proved `example` excludes the wrong sign | none |
| 1.1 Checks, `η₂ … η₇` and ratios | Cauchy integral of `log ζ₁` on `|s − 1| = 1/2`, 256 nodes | `−0.0516886, 0.0147517, −0.0045245, 0.0014468, −0.0004715, 0.0001552`; ratios `−0.31977, −0.32592, −0.32909` | equal to the README's values | none |
| 2.1 closed form, `n = 1, 2` | by hand | `n = 1`: `1 − 1.5541200 + 0.5772157 = 0.0230957`; `n = 2`: `1 − 3.1082399 + 1.2337006 + 1.1544313 − 0.1875462 = 0.0923457` | equal | none |
| 2.1 closed form against Li's derivative formula | `n = 1 … 8`; Taylor coefficients of `log ξ` at `1` computed independently | both: `0.0230957, 0.0923457, 0.2076389, 0.3687905, 0.5755427, 0.8275660, 1.1244601, 1.4657557` | equal to 7 digits | none |
| 2.1 hypothesis `1 ≤ n` | `n = 0` | left `liCoeff 0 = 0` (both brackets vanish); right `1 − 0 + 0 − 0 = 1` | hypothesis needed, and present in Lean | none |
| 2.1 sign of the finite-prime part | (4.13) as printed, `n = 2 … 8` | `0.4674382, 1.3329163, 2.6488486, …, 14.1149078` against the true `0.0923457, …` | the misprint is real; README uses (4.8) | none |
| 2.1 route: Leibniz step and gamma coefficients | `k = 0, 1`; `m = 0, 1` | `dⁿ s^(n−1) = 0`; `d^(n−1) s^(n−1) = (n−1)!`; `m = 0`: `½(−γ − 2 log 2) − ½ log π`; `m = 1`: `½ · (π²/2)/2 = ¾ ζ(2)` | consistent with the statement | none |
| 2.1 Lean signature | sums at `n = 1` | `Finset.Icc 2 1 = ∅`; `range 1` gives `C(1,1) η₀`; `riemannZeta` evaluated only at `j ≥ 2` | Lean equals README | none |
| 3.1 arithmetic limit, normalisation `(−1)^j j!` | sieve to `10⁶`, `j = 0, 1, 2` | raw at `10⁶`: `−0.577618, −0.193115, −0.180443`; minus boundary term: `−0.577205, −0.187403, −0.101538`; limits `−0.577216, −0.187546, −0.103377` | equal to README; `R(10⁶) = −413.40` | none |
| 3.1 route: Abel identity and limit | `j = 0`, `j ≥ 1` | boundary term `f_j(1) = [j = 0]`; `−∫ R f_j' = (−1)^j (F^(j)(1) + j F^(j−1)(1))`; `j! η_j = [j = 0] + F^(j)(1) + j F^(j−1)(1)` | limit is `(−1)^j j! η_j` in both cases | none |
| 3.1 uniform exponent | `(log x)^j e^(−c₀√log x)` against `e^(−(c₀/2)√log x)` | quotient `u^j e^(−(c₀/2)√u) → 0` for each `j` | `c = c₀/2` serves every `j`; quantifier order in Lean is `∃ c, ∀ j` | none |
| 4.1 statement, uniformity of `C` | `u = 1/log 2`; `L` from `0.3665` to `200` | `K = 1.0557 > 1`; loss `4(1/(1+L)² + 2/(1+L))(L − log(1+L)) ≤ 7.77 < 8`; `log(1 + 1/L) ≤ log 3.73` | one `C` on the whole range | none |
| 4.1 route inequalities, rederived without the source | pole term; low frequencies | `|G| ≤ ‖F‖²` on `[−a, a]` gives `4a cosh(a/2)`; `|F̂| ≤ √a ‖F‖` gives loss `≤ (aK/π) log K`, below the README's | each inequality of the route holds | none |
| 4.1 normalisation `W(g, g) = T[G]` | bump, `a = 0.6, 0.3, 0.1`, archimedean side | `0.030981857`, `0.331242255`, `1.16993` | equal to README | none |
| 4.1 identities for `φ = g ⋆ g*` | Mellin transform, support, pole terms | `mellin g* s = conj ĝ(1 − conj s)`; support `[e^(−a), eᵃ] ⊂ (1/2, 2)`; `φ̃(0) + φ̃(1) = ∫ 2 cosh(x/2) G` | as stated | none |
| 4.1 Check table of `log(1/a) − log log(1/a)` | `a = 0.69, 0.3, 0.1, 0.01, 10⁻⁴` | `1.3624, 1.0183, 1.4686, 3.0780, 6.9900`; least difference `0.0101 − 1.3624 = −1.352` | equal; "at least −1.36" holds | none |
| Conventions: copied definitions | compared with WeilPositivityAndLiCriterion at its open head | `zetaZeroMult`, `liCoeff`, `weilForm`: bodies identical character for character | verbatim, distinct namespace | none |
| C01: contract path | opened both files at the pin | `Analysis/Convolution.lean`: no hit; `Analysis/Calculus/ContDiff/Convolution.lean:428`: declared | path wrong, name right | C01 |

- Source locators checked against the text: 12 in Lagarias (arXiv:math/0404394v4: (1.1)–(1.3) p. 1; Definition 4.2, (4.5), Lemma 4.2, (4.6)–(4.9) p. 15; (4.11)–(4.13) and the display after (4.13) p. 16; Lemma 4.3 p. 17; the remark p. 18), all exact; 0 of 5 in Bombieri 2000.
- Library declarations opened at the pin: 22 Mathlib names of the supplier contracts (for example `riemannZeta₁` at `NumberTheory/Harmonic/ZetaAsymp.lean:566`, `log_deriv_riemannZeta_eq_neg_inv_sub_add` at `:650`, `iteratedDeriv_mul` at `Analysis/Calculus/IteratedDeriv/Lemmas.lean:418`, `Complex.digamma_one_half` at `Analysis/SpecialFunctions/Gamma/Digamma.lean:59`); all exist with the stated content; Tau Ceti at the pin has none of `liCoeff`, `zetaZeroMult`, `weilForm`, `digamma_eq_integral`.
- Cross-roadmap citations resolved: WeilPositivityAndLiCriterion 1.1, 3.1, 3.4, 5.1 (open head); ZerosOfLFunctions 1.2–1.4, 8.4, 8.5, 8.7; AnalyticNumberTheoryPartIII 9.1, 9.2, 10.2, 10.3; AnalyticNumberTheoryPartI §1.8a; ExplicitPrimeCounting 0.2, 0.7, 4.2; ExplicitMultiplicativeFunctions 0.5; SpecialFunctionsGamma 1.5; ExplicitNumberFields (its Part II sentence). All present and saying what is cited.
- Dependency check: `depcheck: 172 roadmaps, 2001 edges, 0 problem(s)`; no UPWARD or CYCLE line. WeilPositivityAndLiCriterion is another author's open pull request adding a new roadmap, and the description names it.
- Automatic checks: all passed, the targeted build included. A copy of `Suggested.lean` with `simp`, `rfl` and an `exact` witness tried on each of the three theorems closes none; `#check` of `liCoeff_eq_arithmetic` matches 2.1. No section variables, so no binder can be lost.
- Headline theorems: three (2.1, 3.1, 4.1), all stated; nothing is padding. The one proved `example` tests the sign of the new definition.
- Pull request text: title and description agree with the head (3 theorems, 4 definitions, one example, `import Mathlib` only, supplier and merge order named); no change outside the folder.
- Overlap check: read WeilPositivityAndLiCriterion, ExplicitNumberFields, SpecialFunctionsGamma, ZerosOfLFunctions, AnalyticNumberTheoryPartIII, AnalyticNumberTheoryPartI; shared objects: `zetaZeroMult`, `liCoeff`, `weilForm` and Li's derivative formula — owner WeilPositivityAndLiCriterion (it names the arithmetic formula and Yoshida's positivity as outside its scope); polygamma values at `1/2` — stated by SpecialFunctionsGamma 1.5, here a route step only; the first Stieltjes constant — owner ExplicitMultiplicativeFunctions 0.5; `∑ Λ(n)/n` explicit forms — owner ExplicitPrimeCounting 4.2.

Source independence: 8 passages compared with 1 source (Lagarias), none shared; largest share Lagarias, 12 of 17 locators; contents compared with Lagarias: independent (Layers 1–3 all draw on its single §4, Layer 4 on another source; no layer mirrors a section). Bombieri 2000 could not be read: wording and arrangement of Layer 4 not compared with it.

Research link: Layer 2 is Theorem 2 of Bombieri–Lagarias (1999), restated by Lagarias (2004, Lemma 4.2) as the starting point of his bounds for Li coefficients of automorphic L-functions; Layer 4 is Yoshida's (1992) positivity as proved in Bombieri (2000, §12). Rests on the README and on Lagarias's text (pp. 3–5, 15–16).

## Not verifiable

- Bombieri 2000, §12, Theorem 12, (12.3)–(12.9), pp. 226–227, and p. 184: the only full text found is at the BDIM archive, a host the source service does not classify; the EuDML record (doc 252338) carries no text. The statement and every inequality of the route were rederived instead.
- Bombieri–Lagarias 1999 (Theorem 2) and Yoshida 1992: not opened; the README attributes them in prose without locators, and Lagarias p. 16 confirms the attribution of the formula to Theorem 2 of the former.
- The zero-side sums over the first 600 zeros (Checks of 2.1 and 4.1): not recomputed; the closed form and the archimedean side they are compared with were.

## Source issues

- **Misprint** in Lagarias, arXiv:math/0404394v4 at (4.13), p. 16: the source says the finite-prime sum for the trivial representation carries the alternating sign `(−1)^(j−1)`; it should be without that sign, as (4.8) at `π_triv` gives; affects a stated result.
- **Misprint** in Lagarias, arXiv:math/0404394v4 at Definitions 4.1 and 4.2, p. 15: the source says the coefficients are indexed by `n ≥ 1`, and (4.3) has `s^j` under a sum over `n`; it should be `n ≥ 0` and `s^n`; affects nothing.

## For the human reviewers

- **Licence.** Bombieri 2000 (Rend. Lincei s. 9 v. 11, 183–233) is cited as open at bdim.eu; EuDML doc 252338 links there for the full text. The host is unclassified here, so the text was not read.
- **Not tested.** Layer 4's wording and its locators were not compared with Bombieri's text for the same reason; the largest-share source, Lagarias, was read in full at the cited places.
