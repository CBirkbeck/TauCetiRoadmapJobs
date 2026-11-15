# Review of SpecialFunctionsGeneralizedHypergeometric (pull request #2136 at a7ab0ad)

**Verdict:** accepted

No findings. The folder is unchanged since the previous review of `a7ab0ad`; this round read the pull request's title and description against the head.

## Previous findings

- none: the previous review of `a7ab0ad` had no finding.

## Verified sound

| Statement | Instances tried | Left side / computed data | Right side / comparison | Result; change |
|---|---|---|---|---|
| 5.3 Check cited by the description: 16.8.9 off `centeredDomain z₀` | `q = 0`, `a = ½`, `(z, z₀) = (3 + i, 2i)`; `|z − z₀| = 3.162278 > R = 2.236068`, `ph(z₀ − z) = 2.819842` | `Γ(½)(1 − z)^{−1/2} = 0.272328739552 + 1.153603052970i` | `(z₀ − z)^{−a} ∑ₙ Γ(a+n)/n! ((1 − z₀)/(z − z₀))ⁿ = −0.272328739552 − 1.153603052970i` | Ratio `−1.000000000`; DLMF's two conditions hold; agrees with the README and the description |
| 5.3, 16.8.9 on `centeredDomain z₀` (`regularizedGeneralizedHypergeometric_eq_centered_expansion`) | `q = 0`, `a = ½`, `(z, z₀) = (−4 + i, 0.5 + 0.3i)` | `0.781111209362 + 0.077345252013i` | `0.781111209362 + 0.077345252013i` | Ratio `1.000000000`; no change |
| 5.3, 16.8.9 on `centeredDomain z₀` | `q = 0`, `a = ½`, `(z, z₀) = (5 + 2i, 1 + i)`; `ph(z₀ − z) = −2.896614` | `0.192565498449 + 0.815720541553i` | `0.192565498449 + 0.815720541553i` | Ratio `1.000000000`; no change |

The diff changes no statement; the rows for all other statements stand as in the previous review, of `a7ab0ad`.

- Title and description against the head, sentence by sentence: new roadmap (the folder is not on main; 1739 insertions, 0 deletions, nothing outside the folder); 7 layers with the contents listed; 58 `theorem`s in `Suggested.lean`; the single import `Mathlib`; the one headline not stated (the agreement of 1.2 with the Gauss function) named in the module docstring; Clausen's formula and 16.12.3 stated with the roadmap's own `F` (`gaussHypergeometric_sq_clausen`, `hasSum_gaussHypergeometric_sq`); the six Beyond items; review counts 11, 4 and 1 equal those of the first three reviews of this pull request. No sentence contradicts the head and no change is left unstated.
- 3 library declarations opened at the pins: `Complex.regularizedHGFun` (Mathlib `Analysis/SpecialFunctions/RegularizedHypergeometric.lean:192`), `radius_regularizedHGFunSeries_eq_top` and `_eq_one` (same file, 249 and 302), `Complex.hasSum_regularizedHGFun` (Tau Ceti `Analysis/SpecialFunctions/RegularizedHypergeometric.lean:53`); `regularizedGaussHypergeometric` occurs in neither library.
- 3 suppliers of the description resolved on main: SpecialFunctionsHypergeometric 1.2–1.4, 4.2, 4.3, 5.1, 6.3, 7.3; ZerosOfLFunctions 1.2, 1.3; AsymptoticExpansions 8.2, 8.6, 8.7 — every cited heading exists.
- Elaboration of `TauCetiRoadmap/SpecialFunctionsGeneralizedHypergeometric/Suggested.lean`: exit 0, 58 warnings, all `declaration uses sorry`, 0 errors.
- Worker gate on this head: every check passes, including the targeted build. A rerun without the merge order reports only `depcheck: NOT IN ORDER: SpecialFunctionsGeneralizedHypergeometric (insert it after its last supplier)`, which the placement rule exempts.
- Dependency check with the merge order: `depcheck: 245 roadmaps, 2207 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Seeded sample: no target falls in a changed passage (0 changed lines); no source locator was read this round.
- Overlap check: read SpecialFunctionsAppell, SpecialFunctionsGamma, SpecialFunctionsStruve, SpecialFunctionsLegendre, SpecialFunctionsConfluent (open) and SpecialFunctionsHypergeometric, SpecialFunctionsParabolicCylinder, SpecialFunctionsAiry (main); nothing shared. Appell owns DLMF §§16.13–16.16 only; Struve uses Mathlib's `₁F₂` series only; Confluent leaves the non-terminating `₂F₀` of 13.6.21 to a Chapter 16 roadmap, and this roadmap places it in Beyond with the Meijer `G`-function.

Source independence: changed passages only; 0 passages changed, so none compared; the arrangement was not compared again (no layer added, removed or reordered); largest share of the locators is DLMF Chapter 16, as in the earlier full reviews.

## Not verifiable

- The description's account of the two local reviews before the pull request (three and six findings): no record of them is in the repository; the head contradicts none of it.

## Source issues

- none

## For the human reviewers

- **Licence.** `README.md` lines 1113–1123 name the author's `lean-DLMF` (Apache-2.0) as prior proofs and say reused code carries attribution; `Suggested.lean` was not compared with that repository in this round.
