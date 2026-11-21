# Review of RateDistortionTheory (pull request #2862 at 54cd413)

**Verdict:** accepted

**Summary.** Accepted: this is an incremental re-review of the 15 lines changed since `420b650`, and both remarks of the previous review are repaired. The product-channel identity of 3.1 is now stated for `n ≥ 1` with the value `0` at `n = 0`, and the convexity route of 1.1 now treats a pair whose output mass vanishes under one channel only; both were recomputed and are true, and neither repair introduces a new problem. There is no finding, no small correction and no format note. The Polyanskiy–Wu locators still could not be checked against the text, which is left to the human reviewers.

## Previous findings

- R01 — repaired: "for `n ≥ 1`, the expected block distortion of the product channel of a test channel `W` … is `expectedDistortion p W d` (for `n = 0` it is `0`)" (3.1, lines 358–360).
- C01 — repaired: "A pair with `y₁ = 0 < y₂` has `x₁ = 0`, so `x = (1 − λ) x₂`, `y = (1 − λ) y₂` and both sides are `(1 − λ) x₂ log (x₂ / y₂)`; symmetrically for `y₂ = 0 < y₁`" (1.1, lines 106–108).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 product-channel identity, `n ≥ 1` | fair bit, `W = ((0.9, 0.1), (0.2, 0.8))`, Hamming, `n = 1, 2, 3`; swap channel at `n = 0` | block side `0.15, 0.15, 0.15`, letter side `0.15`; at `n = 0` block side `0` (junk `0 / 0`), letter side `1` | true for `n ≥ 1`; the stated value `0` at `n = 0` is right | none |
| 1.1 route, pair with `y₁ = 0 < y₂` | `λ = 1/2`, `(x₂, y₂) = (0.3, 0.5)`; symmetric case `λ = 1/4`, `(x₁, y₁) = (0.2, 0.7)` | `−0.076624` both sides; `−0.062638` both sides; `x₁ = 0` follows from `q₁ b = 0` and `p a > 0` | equality, as stated | none |
| 1.1 convexity in the channel (cited by the changed route) | fair bit, `W₁` constant at the first letter (so `q₁` has a zero), `W₂` identity, `λ = 0.3, 0.5` | `I` of mixture `0.34201`, `0.21576`; mixture of `I` `0.48520`, `0.34657` | convex, with the new boundary case occurring | none |

The rows for the untouched statements stand as in the previous review, of `420b650`.

- Source locators checked against the text: none this round; the diff adds or changes no locator. The locators of the two changed sections (El Gamal–Kim Lecture 3, pp. 3–37 to 3–39, verified in the previous review; Polyanskiy–Wu Remark 5.2, Definition 24.2 and (24.8), not readable) are unchanged.
- Library declarations opened at the pin: none new; the changed passages name only `Real.convexOn_mul_log` and `Real.continuous_negMulLog`, both located in the previous review.
- Cross-roadmap citations resolved: ChannelCoding 1.4 ("Memoryless use and tensorization", `productChannel` in its `Suggested.lean` at its open head) and ChannelCoding 1.1.
- Automatic checks: all passed. Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; no UPWARD or CYCLE line (the roadmap is not in the merge order yet and is placed after its last supplier).
- Elaboration of `TauCetiRoadmap/RateDistortionTheory/Suggested.lean` (unchanged since `420b650`): 12 `sorry` warnings, no error, no other warning.
- The pull request's title and description: no sentence is contradicted by this head; the change touches an API sentence and a proof route that the description does not describe, and removes or renumbers nothing. No file is changed outside the folder.

Overlap check: read ChannelCoding, EntropyAndSourceCoding, DifferentialEntropyAndEntropyPower, PACBayesBounds, RenyiDivergenceAndPrivacy, AlgebraicCodingTheory, MathematicalStatisticsNonparametric (scopes as read in the previous review; the change adds no object and no supplier); nothing shared.

Source independence: changed passages only; 2 passages compared, both computations of the roadmap's own with no locator added, none shared with ElGamalKim as read in the previous review; largest share PolyanskiyWu, 14 of 21 locators, text and table of contents not readable; the diff adds, removes or reorders no layer, so the arrangement was not compared again.

Research link: The headline targets are Shannon's 1959 coding theorem for a source with a fidelity criterion, in the forms of Polyanskiy–Wu (2024) and El Gamal–Kim (2010); it is the prerequisite of the directions the scope excludes (dispersion, side information, multiterminal coding). Rests on the README's references and ElGamalKim.

## Not verifiable

- All 14 Polyanskiy–Wu locators (Theorems 5.3, 24.3, 24.4, 24.8, 25.1, 25.2, 26.1, Remark 5.2, Definition 24.2, (24.8), (25.1), p. 490): no legal copy was found in the previous review and none is recorded since; the mathematics of each target was checked independently.
- The two slips in Polyanskiy–Wu that the description reports ((26.1) and Theorem 24.4(e)): same reason.

## Source issues

- **Gap** in ElGamalKim at Lecture 3, p. 3–40: the source says the function is convex on the closed interval from `D_min` to `D_max` and hence continuous there; it should be that convexity gives continuity on the open interval only, the endpoint `D_min` needing a separate compactness argument; affects nothing.

## For the human reviewers

- **Not tested.** Polyanskiy–Wu carries 14 of the README's 21 locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- **Licence.** The README's References cite a prepublication copy of Polyanskiy–Wu "from the first author's page at MIT"; the host could not be classified as an author's page by the sources service.
- **Scope.** The headline theorems are textbook results (Shannon 1959); the sources are a published textbook and arXiv lecture notes, no research article.
