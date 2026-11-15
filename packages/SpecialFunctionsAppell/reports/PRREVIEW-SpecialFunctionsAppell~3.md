# Review of SpecialFunctionsAppell (pull request #2166 at ac7377f)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `ac7377f`; this round reads the pull request's title and description against the head. Both findings are in the description; the folder needs no change.

## R01 (P3) — The description places the large-parameter asymptotics in §16.15

**Location:** pull request description, "Outside the roadmap": "the integrals and large-parameter expansions of §16.15 that DLMF does not number;"

**Claim:** The head's Beyond section lists large-parameter asymptotics as what §16.13 cites, and under §16.15 the expansions for large `x` or `y`; the description merges the two into something neither says.

**Witness:** `TauCetiRoadmap/SpecialFunctionsAppell/README.md` lines 833–836: "Large-parameter asymptotics of the Appell functions, which §16.13 cites" and "(DLMF §16.15, unnumbered): the double Mellin–Barnes integrals, the inverse Laplace transforms, and the convergent expansions for large `x`, large `y`, or both". DLMF §16.13 last sentence; §16.15 closing paragraph.

**Repair:** Replace the bullet by two: "the large-parameter asymptotics that §16.13 cites;" and "the unnumbered material of §16.15: the double Mellin–Barnes integrals, the inverse Laplace transforms and the expansions for large `x` or `y` other than 16.16.10;".

## R02 (P3) — The description says symmetries are stated in `Suggested.lean`; none is

**Location:** pull request description: "the auxiliary statements of 1.2–1.4 and 2.2–2.4 (symmetries, conjugation, values on the axes, derivatives, fibre expansions, shift relations and holomorphy in the parameters) are stated for `𝐅₁` or `𝐅₄` only;"

**Claim:** The file states no symmetry of any of the four functions, so "stated for `𝐅₁` or `𝐅₄`" is false for the first item of the list.

**Witness:** The Layer 1–2 auxiliary theorems of `Suggested.lean` are `differentiableOn_regularizedAppellF4`, `regularizedAppellF1Series_zero`, `pdx_regularizedAppellF4`, `hasSum_regularizedAppellF1Series_fibre`, `regularizedAppellF1_shift_c`, `regularizedAppellF1_shift_a`, `differentiableOn_regularizedAppellF1`, `regularizedAppellF1_conj`, `regularizedAppellF1_zero_right`: no exchange of `(β, x)` with `(β′, y)`.

**Repair:** "the auxiliary statements of 1.2–1.4 and 2.2–2.4 (conjugation, values on the axes, derivatives, fibre expansions, shift relations and holomorphy in the parameters) are stated for `𝐅₁` or `𝐅₄` only, and the symmetries of 1.2 in the README only;".

## Previous findings

- none: the previous review, of `ac7377f`, had no finding (its eight `repaired` bullets concern the review before it), and the folder is unchanged since.

## Verified sound

| Statement | Instances | Values (left; right) | Result |
|---|---|---|---|
| 16.16.6 (`regularizedAppellF4_reduction_16_16_6`), cited by the description's Layer 5 | `α = 0.3`, `β = 0.45`, `γ = 1.6`, `γ′ = α + β − γ + 1`, `x = 0.1 + 0.05i`, `y = −0.1 + 0.05i`; double series to total degree 60 | `0.92311 26866 0964 + 0.04292 54853 6748 i`; `0.92311 26866 0964 + 0.04292 54853 6748 i`; `√|x(1 − y)| + √|y(1 − x)| = 0.66833` | agrees with the README's Check to 14 digits |
| Description: "56 headlines" | `grep -c '^theorem'`, elaboration | 56 theorems; 56 `sorry` warnings | agrees |
| Description: copies of four definitions "behind the Gauss function" | bodies of `eulerIntegral`, `IsEulerContinuation`, `regularizedGaussHypergeometric`, `gaussHypergeometric` here and in SpecialFunctionsHypergeometric's `Suggested.lean` on main (lines 51–75) | identical bodies; docstrings differ | agrees |
| Description: "every numbered formula of §§16.13–16.16" | 16.13.1–4, 16.14.1–6, 16.15.1–4, 16.16.1–10 with 16.16.5_5 against the declarations | each has a definition or theorem; 16.16.8 has two | agrees |

The rows for the untouched statements stand as in the previous review, of `ac7377f`.

- Description against the head, sentence by sentence: title (a new roadmap: 0 headings and 0 declarations removed), the four definition bullets, the five layers, the dependency list, the build line agree with the head; the two exceptions are R01 and R02.
- Library declarations opened at the pins (3): `ordinaryHypergeometric` (`Mathlib/Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:81`), `Complex.regularizedGaussHGFun` (`Mathlib/Analysis/SpecialFunctions/RegularizedHypergeometric.lean:428`), `TauCeti.hasSum_multichoose_mul_geometric_complex_of_norm_lt_one` (`TauCeti/Analysis/Analytic/Binomial.lean:46`). No declaration named for an Appell function at either pin.
- Cross-roadmap citations resolved (5): SpecialFunctionsHypergeometric 1.2, 1.3, 1.4, 4.2 (15.4.24, line 639), 5.1 (15.8.1 and 15.8.2, lines 708 and 714) exist on main. "Do not use each other": SpecialFunctionsGeneralizedHypergeometric's README at its open head (lines 122, 1079) leaves the Appell functions out and says they rest on SpecialFunctionsHypergeometric; this README names it under "does not own" only.
- Source locators checked against the text (2): DLMF §16.13 (line 177: large-parameter asymptotics, López et al.), DLMF §16.15 (lines 177–180: double Mellin–Barnes integrals, expansions for large `x`, `y`, inverse Laplace transforms).
- Gate at this head: every scanner 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- `lake env lean` on `TauCetiRoadmap/SpecialFunctionsAppell/Suggested.lean`: 56 `sorry` warnings and nothing else.
- No file outside the folder is changed; `overlaps.md` and the citation resolver list nothing for this roadmap.
- Remark: the module docstring of `Suggested.lean` (lines 11–13) lists "symmetries" among the statements made for `𝐅₁` or `𝐅₄`, as the description does.

Overlap check: read SpecialFunctionsGeneralizedHypergeometric (open), SpecialFunctionsHypergeometric (main), SpecialFunctionsGamma (open; searched for the Appell functions and two-variable series, none); nothing shared.

Source independence: changed passages only; 0 passages changed, so none compared; largest share DLMF Chapter 16, as in the previous reviews; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- "ran two local reviews" and their findings (description, last section): the author's own process, with no record in the repository.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/SpecialFunctionsAppell/README.md` "Prior formalization" names the author's `lean-DLMF` (Apache-2.0, as the README states) as source material for Layers 1–5; `Suggested.lean` was not compared with that repository.
- **Licence.** DLMF was read on `dlmf.nist.gov`, a host the sources service places in no licence class; it was fetched as an institutional open copy.
