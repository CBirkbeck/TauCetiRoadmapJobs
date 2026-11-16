# Review of Equidistribution (pull request #2112 at 6e18a21)

**Verdict:** accepted

No finding. Incremental re-review of the 10 lines changed since `1ceb674`, all in `TauCetiRoadmap/Equidistribution/README.md` (four Hardy–Wright locators).

## Previous findings

- R01 — repaired: 429 "Hardy–Wright Ch. X, §10.15 *Approximation by convergents*"; 450–451 "Ch. XI, §11.8 for Hurwitz's theorem and the sharpness of `√5`, §11.9 for three consecutive convergents"; 460 "Ch. XI, §11.8"; 482 "Ch. X, §10.14 *The series of Fibonacci and Lucas*".

## Verified sound

The diff changes no statement; the rows are for the statements the changed locators attach to.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §3.4 `exists_convDen_mul_abs_convErr_lt_inv_sqrt_five` (locator 450–451) | ξ = φ, n = 0, 2, 4 | `qₖ·φ^(−(k+1))`, k = 0…5: 0.618, 0.382, 0.472, 0.438, 0.451, 0.446; `1/√5 = 0.4472`. Windows {0,1,2}: 0.382; {2,3,4}: 0.438; {4,5,6}: 0.446 | true; two consecutive do not suffice (k = 2: 0.472, and k = 4: 0.451, flank one success each), so "three" is the right count for the §11.9 locator |
| §3.4 sharpness `√5 < c` (locator 460) | ξ = φ, c = √5 and c > √5 | odd k: 0.382, 0.438, 0.446 < 0.4472, increasing to it; even k: 0.618, 0.472, 0.451 > 0.4472 | at c = √5 infinitely many solutions, for c > √5 the products eventually exceed `1/c`: strict inequality is needed |
| §3.3 `isBestApprox_iff` (locator 429) | ξ = √2, q = 1, 2, 3, 5 | `‖√2‖ = 0.4142`, `‖2√2‖ = 0.1716`, `‖3√2‖ = 0.2426`, `‖5√2‖ = 0.0711`; `convDen`: 1, 2, 5 | q = 3 fails (0.2426 > 0.1716) and is no convergent denominator; 1, 2, 5 pass: both directions agree |
| §3.5 `convErr_goldenRatio`, `convDen_goldenRatio` (locator 482) | n = 0, 1, 4 | `convErr φ 0 = φ − 1 = 0.618 = −ψ`; `convErr φ 1 = φ − 2 = −0.382 = −ψ²`; `convDen φ 4 = fib 5 = 5`, `convNum φ 4 = fib 6 = 8` | true; the sign convention agrees with the two Checks |

The rows for the untouched statements stand as in the previous review, of `1ceb674`.

- **Locators.** The six Hardy–Wright citations (369, 400, 429, 450–451, 460, 482) each name a chapter and a section, so the References sentence "cited by chapter and section" (658–660) now holds. The titles of §§10.14, 10.15 and 11.9 agree with a public contents listing of the fifth edition; the text of the sections was not read (see Not verifiable).
- **Gate.** The worker's gate passes at `6e18a21` (every counter 0, build included). A rerun printed only `depcheck: NOT IN ORDER: Equidistribution (insert it after its last supplier)`, the not-yet-placed case, which is not a finding.
- **Dependency check.** `depcheck: 264 roadmaps, 2573 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the folder changes.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/Equidistribution/Suggested.lean` at the pins: 17 `sorry` warnings for the 17 theorems, no other output. The diff touches no Lean file.
- **Cross-roadmap citations resolved on main.** ProbabilisticAndMetricNumberTheory §§2.1–2.5 (headings at README 2360–2836) and DiophantineApproximationAndTranscendence §§0.4–0.6 (README 345–440) exist as cited.
- **Overlap check:** read ProbabilisticAndMetricNumberTheory, ClassicalErgodicTheory, SpecialFunctionsEiLiErfIncompleteGamma; owners as in the previous review (equidistribution on `UnitAddTorus d`: ProbabilisticAndMetricNumberTheory §2.5; the `AddCircle T` transfer, the orbit dichotomy and three gaps: this roadmap; ClassicalErgodicTheory uses circle rotations as examples of ergodicity only), and the change adds no shared object.
- **Pull request text.** The title and the description's prose say nothing of the Hardy–Wright locators; the change alters nothing they describe, and they agree with the head (four layers, the two roadmap suppliers, 17 warnings, three files).
- **Source independence:** changed passages only: 4 passages compared with 1 source (Hardy–Wright, by its contents listing; the text could not be read), none shared beyond two section titles of five and three words used as locators; no layer added, removed or reordered, so the arrangement was not compared again.

## Not verifiable

- Hardy–Wright, 6th ed., §§10.14, 10.15, 11.8, 11.9 (and §§10.2, 10.4, 10.7, 10.8 as before): the sources service found no legal copy (the publisher's page refused the request). Section titles agree with a contents listing of the fifth edition; that §11.8 holds Hurwitz's theorem with the sharpness of `√5`, and §11.9 the three-consecutive-convergents theorem, was not read against the text.
- Khinchin, Kuipers–Niederreiter, Einsiedler–Ward, Alessandri–Berthé, Liang, Weyl: as in the previous reviews; their locators did not change.

## Source issues

- none

## For the human reviewers

- **Licence.** `TauCetiRoadmap/Equidistribution/README.md` 672–674 says Layer 4's statement shape follows `dkunert/three-gap-theorem-lean` (stated there as MIT); `Suggested.lean` was not compared with that repository in this review.
- **Not tested.** Hardy–Wright's text could not be read legally; its section locators rest on a contents listing only.
