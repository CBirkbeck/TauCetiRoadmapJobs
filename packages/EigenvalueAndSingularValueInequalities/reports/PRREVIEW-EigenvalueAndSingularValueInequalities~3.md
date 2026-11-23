# Review of EigenvalueAndSingularValueInequalities (pull request #2969 at 5325990)

**Verdict:** accepted

**Summary.** Accepted: this was an incremental re-review of the 106 lines changed since `4e66ae1`, and no finding remains. The one finding of the previous review (the determinant identity `|det T| = ∏ sᵢ(T)` restated although Mathlib has it) is repaired, as are its five small corrections and its format note; the new statement of Thompson's product majorization and the rewritten routes for Rotfel'd's inequality and Fan–Hoffman were recomputed and are correct. There are no small corrections and no format notes. As before, none of the cited books could be read legally, so no locator was checked against its text; that is left to the human reviewers.

## Previous findings

- R01 — repaired: 2.3 now reads "The determinant identity … is Mathlib's: it is `LinearMap.normDet_eq_norm_det` combined with `LinearMap.normDet_eq_prod_singularValues`. It is not a target"; the theorem is gone from `Suggested.lean`, the clause from scope item 2, and both names are under "From Mathlib".
- C01 — repaired: the path to a Tau Ceti interlacing file is gone from "Scope and ownership" and "Prior formalization"; RandomMatrices, Section 1.2, remains the citation.
- C02 — repaired: "Not owned here" names NoncommutativeIntegration, Section 1.4, as owner of the τ-measurable forms and says how 4.1, 4.2 and 5.2 differ (finite-dimensional, unitaries, no continuity at `0`).
- C03 — repaired: the route of 4.1 now goes through the Rotfel'd–Thompson majorization of the same section and Jensen's inequality on the permutation hull; recomputed below.
- C04 — repaired: "Layers 1, 2, 3, 6 and 7 need nothing from this roadmap; Layer 4 needs Layer 2.2 …; … except that Rotfel'd's inequality (4.1) uses Thompson's triangle inequality (4.2)"; the Dependencies of Layers 4 and 6 agree with the routes.
- C05 — repaired: the items without a Lean name are now called "targets too (equivalent or more general forms of a headline, lemmas on its route and corollaries)", and Thompson's product majorization is stated in `Suggested.lean`.
- N01 — repaired: Horn's converse is stated with `∏_{i<k} |λᵢ| ≤ ∏_{i<k} σᵢ`, its route with `|λ₀⋯λ_{k-1}|²`, and the Fan–Hoffman route counts from `0` with the dimensions `j + 1` and `n - j`.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| 5.2 Thompson's product majorization (new Lean statement `sum_singularValues_le_of_two_smul_eq_comp`) | `A = I`, `B = E₁₂`; `A = E₁₂`, `B = E₂₁`; `A = B = E₁₂`; `k = 0`; `k > n`; `dim 0` | `s(H) = (1/2,1/2)` vs `(1,0)`: `1/2 ≤ 1`, `1 ≤ 1`; `(1,0)` vs `(1,0)`; `0 ≤ 0`; `0 ≤ 0`; tails zero; empty | true over `ℝ` and `ℂ`; README and Lean agree | none |
| 5.2 route of the same | `2·kyFan(H) = kyFan(T + T†) ≤ kyFan(T) + kyFan(T†) = 2·kyFan(T)`; then Horn with Layer 1 | both Tau Ceti lemmas exist at the pin; `sⱼ(A)sⱼ(B)` decreasing, so Layer 1 transfer applies | sound | none |
| 5 Examples, new bullet | `A = I`, `B = E₁₂` | `H` has eigenvalues `±1/2`; index 1 (from 0): `1/2 > 0 = s₁(A)s₁(B)` | true; shows termwise bound fails | none |
| 4.1 Rotfel'd, rewritten route | `f` concave, `f ≥ 0` on `[0,∞)`; hull point `x = ∑ t_σ σ·y`; `f = −t`, `A = I`, `B = −I` | `f` nondecreasing (else `f → −∞`); `∑f(x) ≥ ∑f(y)`; `∑f(s(A+B)) ≤ ∑f(λ(G+H)) ≤ ∑f(s(A)) + ∑f(s(B)) − n f(0)`; `0 > −2n` | sound; no circularity (the majorization does not use Thompson) | none |
| 4.2 Fan–Hoffman, rewritten route | dimensions; `j = 0`; `j = n − 1` | `(j+1) + (n−j) = n+1 > n`; `λⱼ(H) ≤ ⟪Hx,x⟫ = re⟪Tx,x⟫ ≤ ‖Tx‖ ≤ sⱼ(T)` | sound | none |
| 2.3 determinant identity (now cited) | elaborated `#check` of both Mathlib lemmas | `f.normDet = ‖LinearMap.det f‖`; `f.normDet = ∏ i ∈ range (finrank 𝕜 U), f.singularValues i` | cited correctly; used in 2.3 route and 5.1 | none |
| 5.5 Horn's converse, reindexed | `k = 0`; `λ = (2,1/2)`, `σ = (3,1/3)` | `1 ≤ 1`; `2 ≤ 3`, `1 = 1`; `t² = 175/36` | statement unchanged in content | none |
| Layer 6 dependencies | routes of 6.1 and 6.2 read for any use of Layers 1–5 | Schur complement induction, Schur product theorem, Gram Hadamard, Schur–Horn, AM–GM, Abel summation | "Nothing from Layers 1–5" true | none |

The rows for the untouched statements stand as in the previous review, of `4e66ae1`.

- Source locators checked against the text: 0 (the two locators the change adds or moves, Marshall–Olkin–Arnold 9.F.4.a and 9.F.4.b, p. 327, are into a book that could not be read).
- Library declarations opened at the pin: `LinearMap.normDet_eq_norm_det`, `LinearMap.normDet_eq_prod_singularValues` (Mathlib, elaborated by `#check`); `LinearMap.kyFanSum_adjoint` and `LinearMap.kyFanSum_add_le` (Tau Ceti `Analysis/InnerProductSpace/KyFan.lean:138`, `:387`); `LinearMap.IsSymmetric.eigenvalue_mono` (Tau Ceti `Analysis/InnerProductSpace/CourantFischer.lean:363`); Mathlib `LinearAlgebra/Matrix/SchurComplement.lean` exists.
- Cross-roadmap citations resolved: NoncommutativeIntegration, Sections 1.1, 1.4 and 3.3, on main (headings at README lines 125, 240, 615; `LinearMap.singularValues` identified at line 149; the concave inequality for continuous increasing concave `g` with `g(0)=0` at line 252).
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no upward or cyclic edge.
- Elaboration of `Suggested.lean`: exit 0, 34 `sorry` warnings (30 theorems and 4 marked sanity checks), no error, no `set_option`, no sorried data.
- Elaborated type of the new theorem compared with README 5.2: all instance binders present (`RCLike`, `NormedAddCommGroup`, `InnerProductSpace`, `FiniteDimensional`), hypothesis `(2 : 𝕜) • H = A ∘ₗ B + adjoint (A ∘ₗ B)`, conclusion for every `k`; nothing lost.
- One-tactic probe of the new theorem: `simp`, `rfl`, `exact?` and `simpa using LinearMap.kyFanSum_add_le _ _ k` all fail; it is not padding.
- Change outside the folder: none. Pull request text read against the head: the counts (30 theorems, 4 definitions, 34 `sorry`s), the consumed determinant identity, the suppliers and the import list all agree.

Overlap check: read Majorization (main and its open revision), PolarDecomposition, OperatorTheory, MeansMajorizationAndDiscreteInequalities, OperatorMonotoneFunctionsAndMatrixMeans, TraceInequalitiesAndQuantumEntropy, OperatorIdeals as in the previous review, and NoncommutativeIntegration again for the changed passage; Thompson's, Rotfel'd's and the product inequality for τ-measurable operators: owner NoncommutativeIntegration 1.4, the finite-dimensional variants here, now said; Lidskii's inequality: owner SpectralSteepestDescent, cited; chordal graphs: owner PerfectAndChordalGraphs, cited; nothing else shared.

Source independence: changed passages only; 0 passages compared with 0 sources, because none of the five cited books could be read legally; largest share Bhatia 1997, 34 of 85 locators at the previous count; contents not compared (the change adds, removes or reorders no layer).

Research link: Per the README, 2.4 is the input to the Oseledets multiplicative ergodic theorem; 1.1 and 3.3 feed the Araki–Lieb–Thirring trace inequalities; Layer 3 is the linear base of the Klyachko–Knutson–Tao description of eigenvalues of sums, listed as an extension; Layer 7 is the Grone–Johnson–Sá–Wolkowicz completion theorem. Rests on the README only.

## Not verifiable

- Every locator of the sample (2.1, 2.2, 2.4, 3.1–3.5, 4.1, 5.2–5.5, 6.2, 7.1) into Bhatia 1997 and Marshall–Olkin–Arnold 2011: both are recorded as paywalled and cited by locator only.
- Every locator of the sample into Horn–Johnson 1985 and 1991 and Bakonyi–Woerdeman 2011: no legal copy, as in the previous review.
- The locators the change adds for Thompson's product majorization (Marshall–Olkin–Arnold, 9.F.4.a and 9.F.4.b, p. 327): the statement and its route were verified mathematically, the source text was not read.

Automatic checks set aside as false positives: the section header "Library declarations consumed" in `Suggested.lean` has no declaration under it because it introduces the `#check` lines that pin library declarations, which the form allows.

## Source issues

- none

## For the human reviewers

- **Not tested.** Bhatia 1997 has the largest share of the locators (34 of 85) and could not be read; neither the wording nor the arrangement of the README was compared with it or with the other four books.
- **Scope.** The README states that it is a synthesis of four textbooks (README lines 27–31); all headline theorems are classical refereed results. No scope concern observed.
