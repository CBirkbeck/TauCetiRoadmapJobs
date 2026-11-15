# Review of QuadraticFormInvariantsPartII (pull request #1834 at 43253eb)

**Verdict:** needs changes

## R01 (P3) — Qualify the summary's isotropy–hyperbolicity claim

**Location:** PR description, `roadmap-summary` block, “What this roadmap builds”: “quadratic Pfister forms `quadraticPfister`, proving roundness, that isotropy means hyperbolicity”; repeated in the first prose paragraph.
**Claim:** The description drops nonsingularity from the isotropy–hyperbolicity equivalence. The head requires `1 − 4a₀ ≠ 0` in `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:756` and `TauCetiRoadmap/QuadraticFormInvariantsPartII/Suggested.lean:90`; `quadraticPfister` itself permits singular forms.
**Witness:** Over ℚ, fold one with `a₀ = 1/4` gives `(x + y/2)²`: value zero at `(1, −2)`, polar determinant zero; the hyperbolic plane has polar determinant −1. The head records this at README:770.
**Repair:** In the `roadmap-summary` block and the first prose paragraph, write “roundness in every fold, and isotropy equivalent to hyperbolicity for nonsingular quadratic Pfister forms (`1 − 4a₀ ≠ 0`)”. This excludes the counterexample and matches the head.

## Previous findings

- R01 — repaired: `TauCetiRoadmap/QuadraticFormInvariantsPartII/README.md:119` specifies a commutative `K`-algebra and locates the coefficient-extension comparison in `QuadraticFormsOverABase` §0.2; that target and its dependence on this roadmap's §0.2 remain present. The previous report had no open findings.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `quadraticPfister`, §1.1; summary claim in R01 | ℚ, `m = 0`, `a₀ = 1/4` | Definition gives `x² + xy + y²/4 = (x + y/2)²`; at `(1, −2)`, both give `0`. | Singular input is admitted. | Qualify PR text. |
| Isotropy ⇔ hyperbolicity, §1.5; R01 | Same form versus `xy` | Isotropic: true; hyperbolic: false. Polar determinants: `0` versus `−1`; `1 − 4a₀ = 0`. | Lean hypothesis excludes counterexample. | Qualify PR text. |
| Repaired claim with nonsingularity, §1.5 | ℚ, `m = 0`, `a₀ = 0` | `1 − 4a₀ = 1`; `q(0,1) = 0`; `q=x(x+y)=uv` under `u=x,v=x+y`, determinant `1`. | Isotropic and hyperbolic: both true. | None in roadmap. |

Untouched statements' adversarial rows stand as in the previous review of `43253eb`.

- Diff: 0 changed roadmap lines since `43253eb`; against base, 3 added files, 19 theorems and 6 definitions; 0 removed headings/declarations and 0 outside-folder paths.
- PR text: title, prose and `roadmap-summary` compared with the addition and head; 1 qualification finding; other generated blocks excluded.
- Sources: 0 of the 15 seeded targets fall in changed roadmap text; R01's Corollary 9.10, printed p. 54, read at ekm line 2933 with its nonsingular convention at ekm line 2853.
- Pinned declaration opened: `Mathlib/LinearAlgebra/QuadraticForm/Dual.lean:85`, `QuadraticForm.dualProd`, evaluates to `f x`; 3 relevant elaborated signatures compared, with nonsingularity retained explicitly.
- Cross-roadmap repair: `QuadraticFormsOverABase` §0.2 comparison and supplier edge resolved; worker citation scan has 0 unresolved cross-roadmap citations; its one Lean lead is declared at `Suggested.lean:301`.
- Gate rerun: all scanners pass, 0 failures; targeted Lake build and direct Lean elaboration both succeed, each with 19 `sorry` warnings and no errors.
- Dependency output: `depcheck: 244 roadmaps, 2210 edges, 0 problem(s)`; no UPWARD or CYCLE.

Overlap check: read QuadraticFormInvariants (main and open: characteristic-not-two Witt theory), GeometryOfNumbersAndQuadraticArithmeticPartII (integral Witt comparison), AdicCoefficientsAndComparisonsPartII (alterations), LocalFieldsRamificationPartII (valued henselization and Abhyankar), KTheoryFiniteLocalFields (Cartier and norm-residue comparisons), GlobalQuadraticForms (number-field local–global theory); those objects retain those owners, while all-fold quadratic Pfister theory belongs here. The supplied overlap scan reports no conflicting edits or dropped cited ids.

Source independence: changed passages only—0 roadmap passages and 0 new locators; no layers added, removed or reordered, so the source-share and arrangement audit is not repeated. R01's PR claim was compared with ekm; no copied expression or reused material identified in that passage.

## Not verifiable

- `kato82`, `arason75` and `milnor70` remain settled as uncertified, cited by locator only; no changed passage depends on reopening them.

## Source issues

- none

## For the human reviewers

- none
