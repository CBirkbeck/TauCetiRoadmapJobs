# Review of ClassicalErgodicTheory (pull request #2231 at e3c5108)

**Verdict:** accepted

No findings.

## Previous findings

- R01 — repaired: line 1063 reads "Auer2024, Theorem 3, p. 5 of arXiv version 3, for a continuous action of `ℝ^d` on a metric space and its restriction to `ℤ^d`, the time-1 map when `d = 1`"; line 2453 cites "arXiv:2408.15238v3 (2024, revised 2025), Theorem 3, p. 5".

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §3.2, 1 ⇔ 4 ⇔ 5 (`weakMixingVAdd_real_iff_weakMixing`; Auer2024, Thm 3), cited by the changed line 1063 | one-point flow, any `t ≠ 0` | every correlation `μ(A ∩ B) − μA·μB` is 0 for `A, B ∈ {∅, X}`; the product system on one point is ergodic | both sides true |
| same | flow `(x + t, y + αt)` on `𝕋²`, `α` irrational, `t = 1` | `e^{2πix}` is a nonconstant eigenfunction of frequency 1, so the flow is not weakly mixing; time 1 is `(x, y + α)`, which fixes `e^{2πix}`: not ergodic | both sides false |
| same, Auer's `ℤ^d` restriction with `d = 2` | translation action of `ℝ²` on `𝕋²` | the action has eigenfunction `e^{2πix}`; its restriction to `ℤ²` is the identity, not ergodic | both false; for `d = 2` the restriction is no time-1 map, as the new wording says |
| same, `t < 0` after rescaling | `t = −1`, sets `A`, `B` | `μ(A ∩ φ_{−n}⁻¹B) = μ(B ∩ φ_n⁻¹A)`, so the Cesàro means for `(A, B)` at `t = −1` are those for `(B, A)` at `t = 1` | holds |

The rows for statements the diff leaves untouched stand as in the previous review, of `1966f38`.

- **Source locators checked against the text: 9.**
  - Auer2024 (the cached text is arXiv version 3, dated Sep 2025 on its first page): Theorem 3 at line 212, printed p. 5; the restricted `ℤ^d` action and the `d = 1` remark at lines 191–193; the definition of weak mixing by Cesàro decay of `L²₀` correlations at lines 108–113.
  - Chung2013 (the cached text is arXiv:1110.0699v3, 29 May 2012, line 5), every locator the README gives for it, now declared as arXiv numbering: §3 on pp. 8–9 (line 462); Theorem 1.1 on p. 2 (line 60); the citations of Walters' Theorem 9.10 and Moulin Ollagnier's Theorem 5.2.7 on p. 2 (lines 66–67); Theorem 5.3 on p. 21 (line 1304); Proposition 6.1 on pp. 23–24 (line 1482); the uniqueness remark on p. 23 (line 1471).
- **Seeded sample:** of its targets only §3.2 falls in the change; it is checked above. The diff changes no Lean statement, no heading, no supplier and no `*Needs:*` line.
- **Signatures:** `Suggested.lean` is unchanged since `92f201c`. The elaborated type of `weakMixingVAdd_real_iff_weakMixing` carries `[MeasurableVAdd₂ ℝ X]`, `[IsProbabilityMeasure μ]`, `[VAddInvariantMeasure ℝ X μ]` and `t ≠ 0`.
- **Gate:** the worker's gate passed on this head (every check 0, build 0). Dependency check against the candidate order: `depcheck: 245 roadmaps, 2236 edges, 0 problem(s)`, no UPWARD or CYCLE line; the roadmap is at line 412 of that order, after MathematicalBilliards at line 411.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives 39 warnings, all `declaration uses sorry`, and no error.
- **Scope of the change:** nothing changed outside the folder; the diff touches only `README.md` (9 insertions, 6 deletions).
- **Pull request text, read against this head:** the title says the pull request adds the roadmap, and the folder is not on main. Checked in the description: the seven supplier lines against the `### From …` headings (ProbabilisticAndMetricNumberTheory §§4.1–4.3, 4.6, 5.1a; ProbabilisticAndMetricNumberTheoryPartII §3.3; GeometryOfNumbersAndQuadraticArithmetic §4.2; ArithmeticDynamics §§2.6–2.7; MathematicalBilliards §§12.1–12.5 and Layers 7–8; MarkovChainsAndRenewal Layers 0–3 and AmenableGroups Layer 5, both on main); the conversion `ξ ↦ -2π ξ` in §2.1 (line 870); the one unstated headline (suspension flows over subshifts of finite type, module docstring); the five restated entropy definitions (module docstring); `IsEquilibriumState` and `IsMeasureOfMaximalEntropy` under `[MeasurableSpace X] [UniformSpace X]` only; irreducible one- and two-sided uniqueness statements; `log c` equal to the pressure in `exists_ruelleOperator_eigen`; `metadata.toml` with `math.DS`; the summary block's hypotheses (countably infinite discrete amenable groups in §4.6, countable groups on standard Borel spaces in §0.8, nonempty compact metrizable spaces in Layer 7). No sentence is contradicted and no change is left unstated.
- **Overlap check:** read MathematicalBilliards, ArithmeticDynamics, PointProcesses, Equidistribution, ProbabilisticAndMetricNumberTheoryPartII, ProbabilisticAndMetricNumberTheory, Exchangeability, OptimalTransport (the third list is empty); nothing shared: the change adds no owned object, and the overlap listing reports no dropped id, no open revision and no second copy.
- **Source independence:** changed passages only: 3 passages compared with 2 sources (Auer2024 lines 108–113, 191–193 and 212–214; Chung2013 line 5), none shared beyond the standard term "time-1 map"; largest share Sarig2023, 31 of about 75 locators; the diff adds, removes and reorders no layer, so the contents were not compared again.

## Not verifiable

- The published version of Chung2013 (Ergodic Theory Dynam. Systems 33) is paywalled and was not read: its theorem and page numbers were not compared with the arXiv ones. The README now says that it cites the arXiv numbering, so nothing depends on this.

## Source issues

- none

## For the human reviewers

- **Licence.** Auer2024 (arXiv:2408.15238v3) is cited as an arXiv preprint and the README gives no journal reference for it (I did not search for one); README line 1063 cites its Theorem 3 beside the roadmap's own proof route for §3.2, 1 ⇔ 4 ⇔ 5.
- **Scope.** Three sources are lecture notes hosted on author pages and not published: Sarig2023 (31 locators, the largest share), Hochman2012 and Creutz; the README also cites refereed books (Walters1982, EinsiedlerWard2011, CornfeldFominSinai1982).
