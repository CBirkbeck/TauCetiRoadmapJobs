# Review of LinearSystemsAndControl (pull request #2568 at 0df8d12)

**Verdict:** accepted

**Summary.** Accepted. This round read the pull request's title and description against the head, whose folder is unchanged since the previous review: every sentence of the description agrees with the README and `Suggested.lean`, and the sentence the previous review corrected (on the dependency on a roadmap not on main) is now right. There are three small corrections (two carried over unchanged from the previous review, one on the description's list of checked locators) and one format note, none blocking. The two points for the human reviewers (scope, the host of the Sontag PDF) stand.

## C01 — The build guide says the sections of a layer are in build order, but 1.5 is built on 1.6

An implementer who takes the sections of Layer 1 in order reaches the Hautus test before the Kalman decomposition its route uses. "How to read the build" (README lines 52–53) says "Within a layer the sections are in build order", while the `*Needs:*` line of 1.5 (line 208) lists 1.6, and the route of 1.5 (lines 195–197) uses the block `A₂₂` of that decomposition. The smallest change is to the sentence: "Within a layer the sections are in build order, except that 1.5 uses 1.6." Exchanging the two sections would do as well; that is the author's choice.

## C02 — The convention on feedback signs says every statement quantifies over all feedback matrices; Ackermann's formula does not

A reader comparing 3.1 with a source in the convention `u = −K x` is told in the Conventions (README lines 64–65) that such sources "state the same theorems, since every statement quantifies over all feedback matrices". Section 3.1 names one specific row, `f = −(q ᵥ* χ(A))`; in the other convention the formula is `K = q χ(A)`, with the opposite sign, and the first Check of 3.1 itself computes that reversing the sign gives `X² − 3X − 2` instead of `X² + 3X + 2`. The smallest change: "…state the same theorems, since every statement but 3.1 quantifies over all feedback matrices; in Ackermann's formula of 3.1 the sign of the feedback row is reversed."

## C03 — The description's list of the Sontag locators that were checked omits Corollary 6.2.4

The description's "Prior work" paragraph lists the items of Sontag against which "locators were checked" (Corollary 3.2.10, Theorems 2, 3, 5, 13, 18, 23, 24, …, Definition C.5.2). The README also cites Corollary 6.2.4, p. 271, twice (in 2.1, line 257, for the definition of observability, and in 2.2, line 274, for the injectivity of the first `N` outputs), and it is not in the list, so a reader takes that locator as unchecked. Adding "Corollaries 3.2.10 and 6.2.4" to the list makes it complete.

## N01 — Two phrases of "Scope and ownership" describe the state of a pull request

"an open roadmap, not on main, on which this one depends for one statement" (README lines 675–676) will be out of date when the supplier merges. "IterativeMethodsForLinearSystems, on which this roadmap depends for one statement of 5.1, defines …" says the same without the date.

## Previous findings

- The previous report had no finding (no R01).
- Previous C01 — not repaired (the folder is unchanged): "Within a layer the sections are in build order." Written again as C01.
- Previous C02 — repaired: the description now reads "The only roadmap not on main that this one depends on is IterativeMethodsForLinearSystems, for the equivalence of Schur stability with `A^k → 0` (its 1.2)."
- Previous C03 — not repaired (the folder is unchanged): "…state the same theorems, since every statement quantifies over all feedback matrices." Written again as C02.
- Previous N01 — not repaired: "an open roadmap, not on main, on which this one depends for one statement". Written again as N01.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 3.1 Ackermann's formula (described in the pull request's text as `f = −q χ(A)`) | `A = [[1,1],[0,1]]`, `b = e₂`, `χ = X²`; `N = 1`, `A = [a]`, `b = [β]`, `χ = X − c` | `Ab = (1,1)`, `q = (1,0)`, `χ(A) = [[1,2],[0,1]]`, `f = (−1,−2)`, `A + b f = [[1,1],[−1,−1]]`, trace 0, det 0, charpoly `X²`; `a − βq(a − c) = c` | agrees with the description and the README | none |
| 5.1 Schur stability and powers (cited from IterativeMethodsForLinearSystems 1.2) | `[[0,2],[0,0]]`; `[1]` | square `0`, spectrum `{0}`, `‖μ‖ = 0 < 1`; powers constant `1`, `‖μ‖ = 1` | agrees; supplier 1.2 at its head states the real-matrix equivalence | none |
| Description: "22 headline theorems … 9 definitions" | count in `Suggested.lean` | 22 `sorry` warnings; 9 `def`s, `discreteState` recursive; one `import Mathlib` | agrees | none |
| Description: list of Sontag locators | every Sontag locator of the README against the list | Corollary 6.2.4 (README lines 257, 274) absent from the list; all others present | disagree | C03 |
| Build guide, 1.5 and 1.6 | `*Needs:*` of 1.5 | lists 1.6; guide says build order | disagree | C01 |
| Conventions, feedback sign, against 3.1 | double integrator, `χ = X² + 3X + 2`, sign of `f` reversed | `X² − 3X − 2 ≠ X² + 3X + 2` | disagree | C02 |

The rows of the previous review, of `0df8d12`, stand for every statement: the folder did not change.

- Pull request's text: every sentence of the title and description compared with the head (the list of targets, the counts, the suppliers and boundaries, the list of what is not treated, the account of which results are exercises in Sontag); one omission (C03), no sentence contradicted.
- Source locators: none new at this head; the 39 checked in the previous review stand (the seeded sample falls in no changed passage).
- Library declarations opened again at the pins: `Matrix.rank_map` (`TauCeti/LinearAlgebra/Matrix/Rank.lean:157`), `Matrix.isCompl_iInf_ker_mulVecLin_iSup_range_mulVecLin_conjTranspose` (same file, line 375), `ContinuousLinearMap.existsUnique_hasDerivAt_add` (`TauCeti/Analysis/ODE/Inhomogeneous.lean:34`), `LinearMap.IsSymmetric.stableSet_flow_eq_negativeSpectralSubspace` (`TauCeti/Analysis/ODE/Linear.lean:213`), `ContinuousLinearMap.sylvester` and `add_mul_norm_le_norm_comp_add_comp` (`TauCeti/Analysis/InnerProductSpace/Sylvester.lean:99, 128`).
- Cross-roadmap citations resolved again: IterativeMethodsForLinearSystems 1.2 ("Powers and the spectral radius", the real-matrix statement) and 4.1 ("Krylov spaces") at the head of its open pull request, which adds a new roadmap folder; OperatorTheory/SpectralSubspacePerturbation is on main.
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 22 `sorry` warnings and nothing else; no `set_option`, single `import Mathlib`.
- Automatic checks: all passed at this head. No file outside the roadmap folder is changed by the pull request.

Overlap check: read KalmanFiltering, IterativeMethodsForLinearSystems (no roadmap on main is close); the equivalence of `A ^ k → 0` with spectral radius below one and the Krylov spaces are owned by IterativeMethodsForLinearSystems (1.2, 4.1) and cited, not restated; KalmanFiltering excludes controllability, Gramians, the Kalman rank condition and stabilizability from its scope; nothing else shared.

Source independence: changed passages only: none changed, 0 passages compared; as in the previous review, largest share Sontag1998, 35 of 39 locators; contents compared with Sontag1998 then: independent; not compared again (no layer added, removed or reordered).

Research link: the README attributes its targets to Kalman (around 1960), Hautus (1969), Wonham (1967), Heymann (1968), Ackermann (1972) and Lyapunov (1892), and names linear-quadratic control, Riccati equations and the Kalman filter as users of these notions; Sontag (1998, Ch. 8) uses them for optimal control. Rests on the README and Sontag1998.

## Not verifiable

- The original papers of Kalman, Hautus, Wonham, Heymann, Ackermann and Lyapunov: attributed in prose without locators, not opened.
- The description's account of the author's own numerical checks (the enumerations over `𝔽₅` and for `N = 4` over `𝔽₂`, the Hautus test over `GF(2⁶)` and `GF(3²)`, the SymPy and `decide` checks): not rerun.
- The description's statement that the author's other repository has no material on this subject: not opened.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is classical linear control theory (1960–1972 results). 35 of the 39 locators are into one graduate textbook, Sontag (1998); eight cited items are exercises stated there without proof, as the README's References say.
- **Licence.** The Sontag PDF was read from `sontaglab.org`, which the sources service does not classify; it was treated as the author's own page. Åström–Murray was read from the authors' Caltech page.
