# Review of InfinitelyDivisibleLawsAndTriangularArrays (pull request #2970 at cc69036)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 12 lines changed since `76f3359`, one bullet of "Scope and ownership", and no finding remains. The bullet now names the four neighbouring roadmaps with their sections; every section it cites exists with the stated subject, and its closing claim that none of them states the interval inversion formula was checked against each. There are no small corrections and no format notes. Left to the human reviewers, as before: seven of the eight cited books could not be read, and the stated prior formalization was not compared with the Lean file.

## Questions for the author

- Are the page numbers given for Durrett those of the Cambridge print of the fifth edition? The author's online copy of the fifth edition confirms the theorem numbers but has its own pagination; the print could not be read. (Carried from the previous review; the change does not bear on it.)
- §7.1 says that Kallenberg's Theorem 6.17 omits the condition `E X₀ = 0` from the statement for `p ∈ (1, 2)` and derives it in the proof. Is that the wording of the third edition? The book could not be read. (Carried likewise.)

## Previous findings

- none to account for: the previous report, of `76f3359`, raised no finding, no small correction and no format note; the points it listed as repaired (R01, C01–C03, N01–N03 of the review before it) lie in passages this change does not touch.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope bullet: "its inversion theorem is the interval formula for an arbitrary law, which none of them states" (cites 1.1, `tendsto_levyInversionIntegral`) | `μ = δ₀`, `(a, b) = (-1, 1)` and `(0, 1)`; the four named roadmaps searched for an inversion statement | `(2π)⁻¹ ∫ 2 sin t / t dt → 1 = μ(-1, 1)`; real part `(2π)⁻¹ ∫ sin t / t dt → 1/2 = μ{0}/2`, imaginary part odd, `0`. Others: density inversion for integrable `φ`, and `μ{k}` on `ℤ` | true; no second owner | none |
| Scope bullet: "This roadmap's Poisson theorem is the qualitative limit … and states no rate" (cites 5.6) | `n` Bernoulli(`λ/n`) summands against PoissonApproximation §3.3 | Le Cam's bound `2 ∑ pᵢ² = 2λ²/n → 0`: the rate is there, the limit here; 5.6 states no bound | consistent | none |
| Scope bullet: the cited sections | PoissonApproximation Layers 2–3; MathematicalStatisticsHigherOrderAndResampling §1.1, §2.1, §2.3 | Layer 2 Stein equation, Layer 3 local dependence and §3.3 Le Cam; §1.1 Kolmogorov distance with Pólya's theorem, §2.1 Fourier–Stieltjes transforms, §2.3 Berry–Esseen | all resolve | none |

The rows of the earlier reviews for the untouched statements stand as in the previous review, of `76f3359`; the change touches no statement and no Lean declaration.

- Source locators checked against the text: none (the changed passage has no source locator, and no sampled target falls in it).
- Library declarations opened at the pin: none needed; the changed passage names none.
- Cross-roadmap citations resolved: 6 on main (PoissonApproximation Layers 2–3; LocalLimitTheorems; MathematicalStatisticsHigherOrderAndResampling §1.1, §2.1, §2.3) and 1 at an open head (SeriesOfIndependentRandomVariables §3.2, the three-series theorem). All are in "Not owned here"; none is a supplier, and none is on the list of roadmaps never to be cited as suppliers.
- Dependency check: `depcheck: 106 roadmaps, 1216 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean` at the pins: exit 0, 51 `sorry` warnings, no other warning or error. The Lean file is unchanged since `76f3359`, so the one-tactic probe was not repeated.
- Pull request text: its paragraph "Closest roadmaps and ownership" agrees with the bullet as changed (the same roadmaps, the same sections, three on main and SeriesOfIndependentRandomVariables open, all "named in prose only and not consumed"); the counts (49 theorems, 22 definitions, 51 `sorry`s), the suppliers and the import still describe the head.

Overlap check: read PoissonApproximation, LocalLimitTheorems, MathematicalStatisticsHigherOrderAndResampling, SeriesOfIndependentRandomVariables (scope and the cited sections); the rest as in the previous review; the change adds no object and no layer; nothing shared.

Source independence: changed passages only: 1 passage (the scope bullet) compared with 0 sources, since it is ownership bookkeeping with no source locator; none shared; largest share Klenke, 32 of 102 locators; contents of Klenke not read (text and contents page unavailable); the change adds, removes or reorders no layer.

Research link: the headline targets (the Lévy–Khintchine formula, the Khintchine–Doeblin–Gnedenko limit theorem, domains of attraction) are prerequisites of Lévy processes and the Lévy–Itô decomposition (Kallenberg 2021) and of local limit and rate theorems in stable domains; this rests on the README's "Downstream consumers" and "Beyond this roadmap" sections.

## Not verifiable

- Every locator into Kallenberg, Klenke, Petrov, Loève and Resnick (Springer, paywalled) and into Billingsley and Applebaum (no legal copy found), as in the previous review; the change adds no locator.
- The printed page numbers given for Durrett (only the author's online copy, with other pagination, was read).
- The README's statement about the wording of Kallenberg's Theorem 6.17.

## Source issues

- none

## For the human reviewers

- Not tested: Klenke, *Probability Theory* (3rd ed.), has the largest share of the locators (32 of 102); its text and contents page could not be read, so wording and arrangement were not compared with it.
- Not tested: seven of the eight cited books could not be read; only Durrett's theorem numbers were confirmed, from the author's online copy of the fifth edition.
- Licence: the README's "Prior formalization" section names the Lean project CKMA (Apache 2.0, a repository of the pull request's author) as the starting point for §§2.1–2.3, 3.1–3.2 and 5.5; `Suggested.lean` was not compared with it.
