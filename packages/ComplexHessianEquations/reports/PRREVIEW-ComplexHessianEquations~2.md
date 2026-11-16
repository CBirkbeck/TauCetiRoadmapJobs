# Review of ComplexHessianEquations (pull request #2440 at f6e02cc)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README:57 "`Matrix.IsHermitian.eigenvalues₀` (`Mathlib/Analysis/Matrix/Spectrum.lean`), the eigenvalues of a Hermitian matrix `A` sorted decreasingly (`Matrix.IsHermitian.eigenvalues₀_antitone`) … and `eigenvalueVector` is this vector reindexed to `Fin n` along `Fintype.card_fin n`"; the same at README:143, the Check at README:153 and `Suggested.lean`:69–72.
- R02 — repaired: description "Dependencies, all roadmaps on main …: ComplexManifolds (Milestones 1–2), ComplexKahlerGeometry (K1, K2, K4, K5a, K6.0), PseudodifferentialOperators (§§5.4, 6.2), DifferentialGeometry (Layers 0–1, 5 and 12), RiemannianGeometry (R5c, item 4) and PDE (§3.2 (C13), §5.6 (E25))."

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| §1.1 `eigenvalueVector` = reindexed `eigenvalues₀` (README:57, :143, :153; `Suggested.lean`:69–74) | `[[2,1],[1,2]]`; `[[1,i],[−i,1]]`; `n = 0`; `n = 1`, `[a]`; all `n` in Lean | `(2−t)²−1`: both `(3,1)`; `(1−t)²−1`: both `(2,0)`, Frobenius `√4 = 2`; `Fin (card (Fin 0)) = Fin 0`, both empty; both `(a)`; equality by `subst; rfl` | holds | none |
| Wrong model `Matrix.IsHermitian.eigenvalues` (Check, README:153) | `[[2,1],[1,2]]`, `eigenvalues = eigenvalues₀ ∘ (equivOfCardEq (card_fin 2)).symm` | swap equivalence gives `(1,3)`, not antitone; `eigenvalueVector` antitone by `eigenvalues_antitone` (probe) | Check discriminates | none |
| `differentiableAt_spectralFunction_iff` (uses `eigenvalueVector`) | `f = max`, `A = Id₂`; `f = x + y`; reindexing | `λ = (1,1)`, `max` kinked; `λ₁(Id + t·diag(1,−1)) = 1+|t|` kinked: both false; `tr` linear: both true; `hf` makes `f ∘ λ` order-free | holds | none |
| `fderiv_spectralFunction_apply` | `f(x,y) = xy`, `A = diag(3,1)`, `U = I`; increasing order | `∇f(3,1) = (1,3)`, formula `H₁₁ + 3H₂₂`; `tr(adj A·H) = H₁₁ + 3H₂₂`; `(1,3)` with `U = I` breaks `A = U diag(λ) U*` | holds | none |

The rows of the other statements stand as in the previous review, of `7fbebb5`.

- Source locators: §1.1's three (szekelyhidi2018 line 17–24, gpt2023 line 62–66, guo-phong2024 line 108–111) re-read; each defines the endomorphism relative to the metric and its eigenvalue vector. The change adds no locator; the other 14 sampled sections lie outside it.
- Library at the Mathlib pin `1b1ccf4`: `Mathlib/Analysis/Matrix/Spectrum.lean:60` (`eigenvalues₀`, indexed by `Fin (Fintype.card n)`, via `finrank_euclideanSpace`), `:63` (`eigenvalues₀_antitone`), `:66` (`eigenvalues` through `Fintype.equivOfCardEq`); `Mathlib/Analysis/InnerProductSpace/PiL2.lean:220, 225, 1219`; `Mathlib/Analysis/Matrix/Hermitian.lean:57`; `Mathlib/Data/Fintype/Card.lean:497`. Every clause of README:57 holds.
- Probe: a scratch copy of `Suggested.lean` with `eigenvalueVector A = fun i ↦ eigenvalues₀ (Fin.cast (Fintype.card_fin n).symm i)` (by `subst; rfl`) and `Antitone (eigenvalueVector A)` (by `LinearMap.IsSymmetric.eigenvalues_antitone`) elaborates without error; `#check @eigenvalueVector` is unchanged.
- Pull request text: the six suppliers it names are folders on main (2b9ce21); the summary block, the list of 17 headline theorems and the validation line agree with this head.
- Gate rerun at this head: every check 0, `OK`. Dependency check: `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`. No file changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 17 `sorry` warnings and nothing else. Only the docstring of `eigenvalueVector` changed, so the 31 signatures and the one-tactic probe stand as at `7fbebb5`.
- Overlap check: read DiracScatteringAndNonlinearFourierTransform (new in the closest list), DysonBrownianMotion and OperatorTheory/MatrixSpectralStatistics (main; both use `Matrix.IsHermitian.eigenvalues₀` directly); ComplexKahlerGeometry, PDE, Yamabe, CalibratedGeometry, SchrodingerOperatorsAndSpectralTypes as read at `7fbebb5`; nothing shared; the sorted eigenvalue vector is Mathlib's.
- Source independence: changed passages only; 4 passages (README:57, :143, :153, `Suggested.lean`:69–72) compared with 3 sources (szekelyhidi2018, gpt2023, guo-phong2024 at §1.1's locators), none shared; largest share gpt2023, 47 of 132 locators; contents not compared again (no layer added, removed or reordered).

## Not verifiable

- None in the changed passages; the uncertified texts listed at `7fbebb5` are cited only outside them.

## Source issues

- none

## For the human reviewers

- `packages/ComplexHessianEquations/design/plan.json` declares `gap:weak-harnack-supersolutions` (PDE §5.4 (E23)) for targets 5.4.2, 8.5 and 8.7. The README never names the gap; §5.4 uses the pinned homogeneous weak Harnack inequality with a barrier.
