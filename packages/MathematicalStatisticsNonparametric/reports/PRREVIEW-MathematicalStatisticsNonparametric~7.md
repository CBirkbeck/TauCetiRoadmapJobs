# Review of MathematicalStatisticsNonparametric (pull request #2368 at ecf3361)

**Verdict:** accepted

Incremental re-review of the 17 lines changed since `b6eaa8b`. No finding.

## Previous findings

- R01 — repaired: `README.md` lines 364–374 add `### From OperatorTheory/SpectralSubspacePerturbation`, defining a form separation of size `g` and its reverse and stating `‖P_U − P_V‖ ≤ ‖B − A‖/g`; lines 2797–2798 point to that definition.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| The contract (lines 364–374) against SSP-C15 and SSP-C16 on main | `W = Vᗮ`, then the reversed pair `V`, `Uᗮ` | C15 gives `‖P_{Vᗮ} P_U‖ ≤ ‖B − A‖/g` and `‖P_{Uᗮ} P_V‖ ≤ ‖B − A‖/g`; `‖P_U − P_V‖` is the larger of the two; hypotheses agree term by term | agrees | none |
| The contract on a 2×2 instance | `A = diag(3, 1)`, `B = A + ½(e₁e₂ᵀ + e₂e₁ᵀ)`, `U = span e₁`, `V` the top eigenline of `B` | eigenvalues of `B`: `3.118`, `0.882`; `c = 0.882`, `c' = 1`, size `2.118`; `‖P_U − P_V‖ = sin 0.2318 = 0.2297 ≤ 0.5/2.118 = 0.2361` | holds | none |
| 8.6 `fpca_eigenvector`, the rate (lines 2794–2802), first `j + 1` eigenvectors, `‖Ĉ_n − C‖ ≤ g/4` | general `j` | `c = λ_j − 3g/4 ≥ λ_j − g + g/4 ≥ λ̂_{j+1}`; `c' = λ_j − g ≥ λ_{j+1}` and `c' + 3g/4 = λ_j − g/4 ≤ λ̂_j`; bound `(4/3)‖·‖/g ≤ 2‖·‖/g` | holds | none |
| 8.6, the same for the first `j` eigenvectors | general `j ≥ 1`; `j = 0` | on `U`: `≥ λ_j + g`; on `Vᗮ`: `≤ λ_j + g/4`; on `V`: `≥ λ_j + 3g/4`; on `Uᗮ`: `≤ λ_j`; both sizes `3g/4`. `j = 0`: both spans `0`, bound `0` | holds | none |
| 8.6, same instance, size `3g/4` as the text claims | `g = 2`, `‖Ĉ − C‖ = ½ = g/4` | `c = 1.5 ≥ 0.882`, `c + 1.5 = 3`; `c' = 1`, `c' + 1.5 = 2.5 ≤ 3.118`; `0.2297 ≤ 0.5/1.5 = 0.333 ≤ 2·0.5/2 = 0.5` | holds | none |

The rows for the untouched statements stand as in the previous review, of `b6eaa8b`.

- The diff: 17 lines of `README.md` (one contract subsection, one reworded clause in 8.6); `Suggested.lean` unchanged; no locator added or changed; nothing outside the folder changes.
- Cross-roadmap citations resolved: main `OperatorTheory/SpectralSubspacePerturbation/README.md` lines 329–336 (SSP-C15, SSP-C16); the six mentions of the supplier here (lines 124, 364–374, 2794, 2798, 2806–2807, 2853) agree with it and with each other.
- Dependency check: `depcheck: 254 roadmaps, 2401 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate (the worker's, at this head): every check passed, build included. Elaboration: exit `0`, 202 `sorry` warnings and no other warning.
- Source locators: the diff adds or changes none; no target of the seeded sample falls in the changed passages (8.6 is not sampled).
- Pull request text, read against this head: adds a roadmap; 202 theorems (202 `theorem` lines); the Dependencies list names OperatorTheory/SpectralSubspacePerturbation SSP-C16 for 8.6; nothing contradicted or left out.
- Remark on untouched text: the tool lead on `IsEigenExpansion.sum_inner_le` (`README.md` line 2645) is outside the diff; not examined again.

Overlap check: read MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsSemiparametric, MathematicalStatisticsHighDimensional as in the earlier reviews, and OperatorTheory/SpectralSubspacePerturbation for the changed passages; the projector perturbation bound and its form-separation hypotheses are owned by SpectralSubspacePerturbation (SSP-C15, SSP-C16) and cited here, with nothing restated as a target; the other shared objects have the owners recorded in the previous reviews.

Source independence: changed passages only; 2 passages compared (the contract subsection, the reworded clause of 8.6) with 1 source (the SpectralSubspacePerturbation roadmap on main: the inequalities are forced by the mathematics, no sentence shared); largest share van der Vaart, 51 of 198 locators (Tsybakov 49); contents not compared again (no layer added, removed or reordered), and neither van der Vaart's nor Tsybakov's text or table of contents could be read.

## Not verifiable

- Nothing new: the diff adds no locator. The items of the earlier reviews stand (Tsybakov, van der Vaart, Samworth–Shah, Wainwright, Wand–Jones, Fan–Gijbels, Green–Silverman, Wahba, Robertson–Wright–Dykstra, Groeneboom–Jongbloed, Hsing–Eubank, Devroye–Györfi–Lugosi: no legal copy read).
- Ownership against the board's packages was not checked again.

## Source issues

- none

## For the human reviewers

- **Not tested.** van der Vaart (51 of 198 locators) and Tsybakov (49) could not be read, nor their tables of contents: wording and arrangement were not checked against them; 13 of the 15 sampled sections rest on unread books.
- **Licence.** `README.md` lines 2883–2914 map the layers to files of lean-CKSD (Apache 2.0, the author's project); whether declarations of `Suggested.lean` are adapted from it was not compared.
- **Licence.** `README.md` lines 2916–2922 say Layers 1 and 2 may port proofs with attribution from Statlib (Apache 2.0).
- **Licence.** Johnstone17 is an unpublished draft (version of August 9, 2017, `README.md` line 2961) read from the author's page; 8 locators point into it.
- **Scope.** `README.md` lines 2937–2939 hand the Kolmogorov distance to MathematicalStatisticsHigherOrderAndResampling, which is neither on main nor in an open pull request.
