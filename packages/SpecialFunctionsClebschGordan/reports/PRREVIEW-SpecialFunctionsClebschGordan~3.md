# Review of SpecialFunctionsClebschGordan (pull request #2930 at a672a0c)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 36 lines changed since `6a9b08d`; the previous review had no finding, and its one small correction (the norm `h_n` of the dual Hahn orthogonality given as a quotient that is `0/0` at `n = 0`, `α + β = -1`) and three format notes are all repaired, with no new problem introduced. The repaired passages were recomputed in exact arithmetic and the Hahn row of DLMF Table 18.19.1 was read again. There are no small corrections and no format notes; the human reviewers are left the points of the previous review and one fact about the Lean file's stated choice of headlines.

## Previous findings

The previous review had no finding (R); its small correction and format notes are accounted for here.

- C01 — repaired: "For `2n + α + β + 1 ≠ 0`, `h_n` is the right side of `sum_hahn_mul_hahn` divided by `2n + α + β + 1`; at `n = 0` it is `h_0 = (α + β + 2)_N / N!`", with a Check at `α = β = -1/2`.
- N01 — repaired: "DLMF's first range `α, β > -1` … (its second range is `α, β < -N`)" in §4.2 and in the docstring of `sum_hahn_mul_hahn`; the Check now says "outside both of DLMF's ranges".
- N02 — repaired: "DLMF §34.2 states the same condition, with the triangle inequalities as DLMF 34.2.1" in the Conventions, §1.1 and the docstring of `IsTriad`.
- N03 — repaired: the module docstring now says "only the spherical-harmonic headlines of §3.3 need definitions from outside this file; the others are statable with the definitions here and are left in prose by choice".

## Verified sound

Exact rational arithmetic on a transcription of the Lean definitions of `hahn` and of the two sides of `sum_hahn_mul_hahn` (`x/0 = 0`).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §4.2 norm of the dual orthogonality (changed prose) | `N ≤ 5`, 7 pairs with `α, β > -1`, three of them with `α + β = -1` | `h_0 = Σ_x w_x = (α+β+2)_N/N!` at all 42; quotient form equals `h_n` at all 129 points with nonzero divisor; divisor `0` only at `n = 0`, `α + β = -1` (18 points, right side `0`) | holds | none |
| §4.2 new Check at `n = 0`, `N = 2`, `α = β = -1/2` | the stated instance | weights `3/8, 1/4, 3/8`, sum `1`; `(1)_2/2! = 1`; right side of `sum_hahn_mul_hahn` `0`; `2n + α + β + 1 = 0` | as stated | none |
| §4.2 dual orthogonality with `h_n` the sum | same 7 pairs, `N ≤ 5`, all `x, y` | 637 sums equal `δ_{xy}/w_x`, the points with `α + β = -1` included | holds | none |
| §4.2 `sum_hahn_mul_hahn` (docstring changed) | same pairs, all `n, m ≤ N ≤ 5`; `(-5/2, 7/3)`, `N = 2`, `n = 1`, `m = 2` | 637 instances equal; at `(-5/2, 7/3)`: sum `0`, weights `65/9, -5, 3/8`; `α < -N` but `β > -1`, so outside both ranges | holds | none |
| §1.1 `IsTriad` (docstring locator changed) | `(d₁, d₂, d) = (1,1,2), (1,1,1), (1,1,4)` | admissible (sum `4` even, `2 ≤ 2`); not (sum `3` odd); not (`4 > 2`) | definition unchanged | none |
| Reference note on the Hahn row of Table 18.19.1 (new) | read at DLMF §18.19 | the row has the factor `2n + α + β + 1` in the denominator and the ranges `α, β > -1` or `α, β < -N`; cancelled at `n = 0` it is `(α+β+2)_N/N!` | as stated | none |

The rows of the previous review for the untouched statements stand as in the previous review, of `6a9b08d`.

- Source locators checked against the text: 1 (DLMF Table 18.19.1, Hahn row: weight, both parameter ranges, the norm with the factor `2n + α + β + 1` in its denominator; the page of DLMF §18.19 as fetched, lines 143–148).
- Library declarations opened at the pin: none new; the change touches no library name.
- Cross-roadmap citations resolved: none new; the change adds or alters none, and the citation and overlap tools list nothing found nowhere and nothing dropped.
- Dependency check: `depcheck: 106 roadmaps, 1216 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean` with `lake env lean`: 51 `sorry` warnings and the 18 `#check` lines, no error and no other warning. The diff changes two docstrings and the module docstring only, so no signature changed and the one-tactic probe was not repeated.
- Automatic checks: all passed at this head. No file outside the folder is changed.
- Pull-request text: the description's source-check paragraph already states the reading `h_0 = (α + β + 2)_N / N!` of the Hahn row; the counts (51 theorems, 51 `sorry`, four Tau Ceti imports) and the supplier list agree with the head. Nothing to correct.
- Overlap check: read SpecialFunctionsSU2MatrixElements, SpecialFunctionsHigherSpheres, SpecialFunctionsGroupModels, SpecialFunctionsMotionGroupsBessel, SpecialFunctionsSU11MatrixElements, SpecialFunctionsGeneralizedHypergeometric, SpecialFunctionsLegendre, SpecialFunctionsOrthogonalPolynomialsGeneral; nothing shared (as in the previous review; the change adds no object and no layer).

Source independence: changed passages only; 6 passages compared with 1 source (the DLMF, §18.19), none shared beyond formulas; largest share Edmonds 1957, about 85 of about 227 locators, as in the previous review; its text and contents could not be read; the diff adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: Layers 4 and 6 realize the Hahn and Racah polynomials as Clebsch–Gordan and 6-j coefficients of SU(2), as in Vilenkin–Klimyk 1991, Ch. 8, and Klimyk–Vilenkin 1995; Layers 1–3 and 5 are the Wigner–Racah calculus of Edmonds 1957 and DLMF Ch. 34. Rests on the README's references and consumers.

## Not verifiable

- The running text of DLMF §34.2 outside its numbered equations, which the changed locator of §1.1 now cites for the integrality of `j₁ + j₂ + j₃`: the sources service returned the section's figure on three attempts, so only equations 34.2.1–34.2.3 (read in the previous review) support it; the integrality follows from 34.2.2 and 34.2.3.
- Every locator into Edmonds 1957, Vilenkin–Klimyk 1991, Klimyk–Vilenkin 1995 and Wawrzyńczyk 1984, as in the previous review (paywalled); the change alters none of them.

## Source issues

- **Gap** in DLMF at Table 18.19.1, Hahn row: the source gives the norm as a quotient with denominator factor `2n + α + β + 1`, which is `0/0` at `n = 0`, `α + β = -1` inside the stated range; it should be read with the factor cancelled, `h_0 = (α + β + 2)_N / N!`; affects nothing.

## For the human reviewers

- **Licence.** The README's "Prior formalization" section says `Suggested.lean` uses the names of lean-SFVK (`SFVK/ClebschGordan/`, Apache-2.0, by the pull request's author) at commit `2a512fe`. I did not open that repository.
- **Not tested.** Edmonds 1957 has the largest share of the locators (about 85 of about 227); its text and table of contents could not be read, nor those of the other three books. Wording and arrangement were compared with the DLMF only.
- **Scope.** The cited sources are four monographs (1957–1995) and the DLMF; the README cites no research article. The subject is the Wigner–Racah calculus and the Hahn and Racah families of the Askey scheme.
- **Headlines left in prose.** The module docstring of `TauCetiRoadmap/SpecialFunctionsClebschGordan/Suggested.lean` (lines 30–37) now says that the listed prose headlines other than those of §3.3 are statable with the file's definitions and are unstated by choice.
