# Review of EllipticIntegrals (pull request #2556 at 81b06b4)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 34 lines changed since `1d029f4`: all five small corrections of the previous review are repaired, the new route sentence of §2.1 was recomputed and holds for every modulus, and the two corrected DLMF numbers were opened and are right. The description of the pull request was read against this head and nothing in it is contradicted. Three format notes remain, none blocking; the human reviewers have the same two facts to weigh as before.

## N01 — The *Needs:* line of §2.1 still omits what the bound "1 − tₙ is at most a constant times kₙ²" uses

The listed `TauCeti.Real.pi_div_two_le_legendreK` and `TauCeti.Real.legendreEc_le_pi_div_two` give only tₙ ≤ 1. The bound itself (constant 1; numerically (1 − tₙ)/kₙ² runs from 0.73 down to 0.50 at k′ = 0.1) comes from `TauCeti.Real.legendreK_le_pi_div_two_div_sqrt` and `TauCeti.Real.le_legendreE_integrand`, which the supplier contracts list but this line (README lines 179–183) does not.

## N02 — Line 58 of `TauCetiRoadmap/EllipticIntegrals/Suggested.lean` (the docstring of `pi_eq_four_mul_agm_sq_div_one_sub_tsum`) is still 106 characters long; rewrapping it brings it within 100.

## N03 — The docstring of `realPeriod_eq_of_three_real_roots` now names no source

With the Cremona citation removed (line 112 of `Suggested.lean`), the three-root K form has no locator in the Lean file, while its one-root companion cites Byrd–Friedman 239.00. §5.2 of the README cites Byrd and Friedman 236.00 for the three-root integral; the docstring could carry the same.

## Previous findings

The previous review, of `1d029f4`, had no finding; its small corrections and format notes are accounted for here.

- C01 (route of §2.1) — repaired: "uₙ → 0 because 1 − tₙ is at most a constant times kₙ², and 2ⁿaₙ²kₙ² = 2ⁿcₙ² ≤ 2⁻ⁿ by Mathlib's halving bound aₙ − gₙ ≤ 2⁻ⁿ(1 − k′)"; `NNReal.dist_agmSequences_fst_snd` is in the *Needs:* line.
- C02 (Hartogs sentence of §3.1) — repaired: "Holomorphy in each variable separately implies it by Hartogs' theorem on separately holomorphic functions; the route below proves it directly."
- C03 (two DLMF numbers) — repaired: Convention 4 reads "DLMF 19.16.1, 19.16.2, 19.16.2_5, 19.16.5, 19.2.17"; the scope bullet reads "the elementary R_C (DLMF 19.2.18, 19.2.19)". Both opened in DLMF and correct.
- C04 (Milestone 5 row) — repaired: "5.1, 5.3: Tau Ceti: *Special values*; 5.2: Tau Ceti's `TauCeti.Real.legendreEc_one_div_sqrt_two`".
- C05 (Cremona in two K-form docstrings) — repaired: the two K-form docstrings no longer cite Cremona §3.7; the two AGM-form docstrings keep it (N03 above on the source now missing from one).
- N01 (*Needs:* line of §2.1) — not repaired: the line gained the halving bound but not the two lemmas behind 1 − tₙ ≤ kₙ² (N01 above).
- N02 (line length) — not repaired: line 58 is unchanged (N02 above).

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §2.1 route: aₙ − gₙ ≤ 2⁻ⁿ(1 − k′) | k′ = 0.1, n = 0…4 | 0.900, 0.234, 1.61e-2, 7.60e-5, 1.70e-9 against 0.900, 0.450, 0.225, 0.1125, 0.05625 | holds | none |
| §2.1 route: 2ⁿcₙ² ≤ 2⁻ⁿ, uₙ → 0 | k′ = 0.1, n = 0…4; by hand for all k′ | 2ⁿcₙ² = 0.990, 0.405, 5.47e-2, 5.17e-4, 2.31e-8 against 1, 0.5, 0.25, 0.125, 0.0625; uₙ = −0.725, −0.230, −2.76e-2, −2.58e-4, −1.15e-8 | holds | none |
| §2.1 `legendreEc_eq_agm_tsum` (cited by the changed route) | k′ = 0.1 (k² = 0.99), six terms | K(k)(1 − Σ 2ⁿ⁻¹cₙ²) agrees with E(k) by Simpson quadrature to the precision of the quadrature | holds | N01 |
| Halving bound in Mathlib's indexing | `agmSequences 1 k′ n` = (gₙ₊₁, aₙ₊₁) | library: dist ≤ (1 − k′)/2ⁿ⁺¹, the README's bound at index n + 1; n = 0 is an equality | agrees | none |
| §3.1 Hartogs sentence | domain `slitPlane ×ˢ slitPlane ×ˢ slitPlane` | open subset of ℂ³; Hartogs' theorem applies with no continuity hypothesis | true | none |
| Convention 4 and scope locators | DLMF §19.16 and §19.2 opened | 19.16.2_5 is the single integral for R_G, 19.16.3 "moved"; 19.2.18 arccos case, 19.2.19 logarithm case, 19.2.20 principal value | correct | none |
| Milestone 5 row | `legendreEc_one_div_sqrt_two` in the contracts | listed under *At k = 1 and Legendre's relation* (README line 800), as the row now says | correct | none |
| Real-period docstrings | the four docstrings of Layer 5 | K forms: none and Byrd–Friedman 239.00; AGM forms: Cremona §3.7 | consistent with §§5.2–5.3 | N03 |

The rows for the statements the change does not touch stand as in the previous review, of `1d029f4`.

- Source locators checked against the text: 5 (DLMF 19.16.2_5, 19.16.3, 19.2.18, 19.2.19, 19.2.20, read on NIST's site).
- Library declarations opened at the pin: `NNReal.dist_agmSequences_fst_snd` (Mathlib `Analysis/SpecialFunctions/ArithmeticGeometricMean.lean` line 145), `NNReal.agmSequences` (line 56), `NNReal.agmSequences_succ'` (line 67), `NNReal.tendsto_agmSequences_snd_agm` (line 176).
- Cross-roadmap citations: the two open roadmaps the description names were re-read at their heads; PeriodsAndSpecialValues cites Milestones 1 and 3, EllipticCurvePeriodsAndModularParametrizations cites Milestone 8 and 8.2–8.3, and the table of Scope and ownership maps all of them.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`. The automatic checks all passed. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else. The change to the Lean file is in two docstrings only; no statement, binder or import changed, so the elaborated types and the one-tactic probe stand as in the previous review.
- Pull request text, read against this head: 22 Checks counted, 11 theorems, six added and one restated declaration, the removed declarations, the two corrected DLMF numbers, the absent Borwein–Borwein, Whittaker–Watson and GrothendieckPeriodConjecture citations, the pointer to mathlib4#34397, the milestone table; no sentence is contradicted and no reader-relevant change is left out.

Overlap check: read SpecialFunctionsTheta, SpecialFunctionsHypergeometric and SpecialFunctionsAppell (main and open), SpecialFunctionsLegendre and SpecialFunctionsGamma (open); nothing shared, as in the previous review. The change adds no object.

Source independence: changed passages only: 4 passages compared with 1 source (DLMF §§19.2 and 19.16), none shared; largest share DLMF, 25 of 30 locators; the diff adds, removes and reorders no layer, so the arrangement was not compared again (independent in the previous review).

Research link: Layer 5 evaluates the real period of the Birch–Swinnerton-Dyer quotient by the AGM, the method of Cremona 1997, §3.7 (read) for period lattices; Layer 3's duplication theorem is the step of Carlson's 1995 algorithms for complex elliptic integrals (§2, read). Rests on the README and those two sources.

## Not verifiable

- Carlson 1977, Chapter 9 (the locator of §3.1): a book, no legal copy found; untouched by this change.
- Byrd and Friedman, formulas 236.00 and 239.00 (§5.2 and one docstring): no legal copy found; the integrals were checked by quadrature in the previous review.
- The statement in Provenance that the author of `lean-codes` agreed to its use (Lean Zulip): not accessible to this review.

## Source issues

- none

## For the human reviewers

- Tau Ceti commit d2083f0 (2026-11-08) is later than the pinned one. The folder's `STATUS.md` reports seven of the eight former milestones proved there, including several targets of Layers 1–5; the reviews treated them as targets, since the pin lacks them.
- `lean-codes` (Apache-2.0 per the README) is said in Provenance to prove the duplication theorem; an earlier review found `carlsonRF_duplication` there with the same name and binders, in `Carlson/Elliptic/Addition.lean`. The README directs implementers to port from it.
