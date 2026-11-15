# Review of SpecialFunctionsOrthogonalPolynomialsGeneral (pull request #2192 at acaee4a)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README §§8.1, 8.4 and 10.1 retain Simon Proposition 5.7, Proposition 1.5 and Magnus §3, p. 8; §4.3’s obsolete locator remains absent.
- R02 — repaired: README §8.1 retains induction on `min(m, n)`; §8.2 retains the tail bound `R^{−j−2} ∫ x^{2j+2} dν_n`.
- R03 — repaired: README §10.2 cites DLMF §18.2(xii) for `not_isOrthogonal_bernoulli`; the obsolete abbreviation remains absent.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §3.2 `sum_recB`, cited by the PR's sign-correction paragraph | Gaussian N(2,1), n = 0,1; p₁ = X−2, p₂ = X²−4X+3 | h₀=h₁=1, b₀=b₁=2; n=0: 2=−(−2); n=1: 4=−(−4) | Both equalities hold; opposite sign fails | None |

The rows for untouched statements stand as in the previous review, of acaee4a.

- Incremental scope: 0 changed folder lines, 0 outside-folder changes; the previous report accepted this exact head.
- PR text: all 10 layer summaries, the exclusions, supplier descriptions and addition status match the head and base; 63 theorems and 31 definitions/structures match the stated counts.
- Source sample: 0 newly affected locators among the 15 seeded targets; no source-text check reopened.
- Pinned Mathlib inputs opened: 12 declarations in `Mathlib/Algebra/Group/ForwardDiff.lean:40,260`, `Mathlib/MeasureTheory/Measure/Support.lean:59`, `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean:131,934`, `Mathlib/Analysis/Matrix/Spectrum.lean:67`, `Mathlib/MeasureTheory/Measure/Prokhorov.lean:530`, `Mathlib/MeasureTheory/Measure/ResolventTransform.lean:108`, `Mathlib/RingTheory/PowerSeries/Substitution.lean:158,567`, `Mathlib/Algebra/ContinuedFractions/Basic.lean:109`, and `Mathlib/Analysis/SpecialFunctions/Trigonometric/Chebyshev/ChebyshevGauss.lean:109`.
- Pinned Tau Ceti inputs opened: 6 declarations in `TauCeti/Analysis/InnerProductSpace/PolynomialCompleteness.lean:165`, `TauCeti/Analysis/InnerProductSpace/WeightedOrthogonalBasis.lean:193`, `TauCeti/Probability/Moments/Determinacy.lean:246`, `TauCeti/Probability/Moments/WeakConvergence.lean:139`, `TauCeti/RingTheory/Polynomial/Hermite/GeneratingFunction.lean:80`, and `TauCeti/MeasureTheory/Measure/ResolventTransform/Basic.lean:41`.
- Cross-roadmap contracts: 2 section citations resolved on main, ClassicalArithmeticCompletion §6.21 and RandomMatrices §8.2; LaguerreJacobi's open head retains the named-family scope and excludes general Favard theory.
- Gate: every scanner passed; targeted build passed; direct elaboration passed with exactly 63 `sorry` warnings and no other output; `sum_recB`'s supplied elaborated signature retains both hypotheses, with no changed signatures.
- Dependency output: `depcheck: 245 roadmaps, 2206 edges, 0 problem(s)`; no UPWARD or CYCLE.

Overlap check: read LaguerreJacobi, SpecialFunctionsGamma, SpecialFunctionsLegendre, SpecialFunctionsConfluent, SpecialFunctionsAppell, OrthogonalL2Bases, SpecialFunctionsEiLiErfIncompleteGamma and SpecialFunctionsHypergeometric; named families remain with LaguerreJacobi/Mathlib, completeness with OrthogonalL2Bases/Tau Ceti, and general orthogonal-polynomial theory here. The two cited shared interfaces retain ClassicalArithmeticCompletion §6.21 and RandomMatrices §8.2 as owners.

Source independence: changed passages only; 0 changed passages, 0 sources compared and 0 new locators. DLMF remains the principal source; its locator share and the arrangement were not reassessed because no layer was added, removed or reordered.

## Not verifiable

- Inherited limitation: Ismail (2009), (3.2.3) and (3.2.10), had no legal text in the previous review; that review checked only DLMF's citation.
- Inherited limitation: Magnus (1995), the published journal version, was paywalled; the previous review used the arXiv version cited by the README.

## Source issues

- none

## For the human reviewers

- none
