# GATE-RandomMatrices~1: answers to human review

Reviewed head `a62a9af`; repairs committed as `ebac9fcd` (not pushed). Comments numbered in order:
the kim-em status comment makes three points (H01–H03), and the CBirkbeck review makes four findings
(H04–H07). Commit `a62a9af`, which is the head this job started from, already postdates both comments and
carries the repairs for H04–H07; each one was checked against the supplier as it stands now.

## H01 (kim-em) — answered

The circularity repair is present: Milestone 8 (`TauCetiRoadmap/RandomMatrices/README.md` lines 533–538)
bounds `α_k(W^k) = ∫_{W^k} det[K(xᵢ,xⱼ)] ≤ (∫_W K(x,x) dμ)^k = (tr K_W)^k` using Hadamard's bound and the Mercer
trace identity. This gives `E[(1+t)^{N(W)}] ≤ exp(t·tr K_W)` before the factorial expansion is used, and the
direct Fredholm-domination convergence argument stays in Milestone 8. The PointProcesses citation is now the
roadmap name (line 59), not a pull-request link.

## H02 (kim-em) — applied differently

The Gram realization is right, but the supplier was wrong. `hermitian_gram_hadamard` is owned by
SuccessiveMinima, Layer 0, target 0.1.2, which is on main (`TauCetiRoadmap/SuccessiveMinima/Suggested.lean`
line 192, with no independence assumption and `n = 0` allowed). GeometryOfNumbersAndQuadraticArithmetic only
imports it ("From TauCetiRoadmap.SuccessiveMinima: 0.1.1–0.1.3 supply … `hermitian_gram_hadamard`"). README
line 537 changes from "in the geometry-of-numbers roadmap ([…](…/pull/851), §0.1.2)" to "of
[SuccessiveMinima](../SuccessiveMinima/README.md), Layer 0, target 0.1.2". The roadmap now depends on main
for this input, not on an open pull request.

## H03 (kim-em) — answered

`TauCetiRoadmap/RandomMatrices/metadata.toml` is `topic = "math.PR"`, and the gate reports `metadata=0`.

## H04 (CBirkbeck) — applied

The counterexample is correct; the values were recomputed. For `K = 1_{x=y}` on Lebesgue `ℝ`:
- every finite matrix is a block sum of all-ones blocks, so it is PSD;
- the integral operator is `0`;
- `∫_{[0,1]} K(x,x) dx = 1`;
- distinct points give `det = 1`, which is the unit-rate Poisson process with void probability `e^{-1} ≠ det(I−0) = 1`.

At `a62a9af` (README lines 509–531) the constructor takes a continuous Hermitian PSD kernel on a locally compact
Polish space, with a locally finite `μ` and a contractive integral operator. Before any correlation is defined,
it proves `tr K_W = ∫_W K(x,x) dμ`, `tr Λ^k K_W = (k!)⁻¹ ∫_{W^k} det[K]` and the Fredholm series, using Mercer on
the compact support of `μ|_W`. The counterexample is recorded as the negative control, and kernels defined only
up to null sets (Soshnikov §1, Lemmas 1–2, (1.14); AGZ §4.2.2) are excluded explicitly.

Checks recomputed:
- rank-one projection `φ⊗φ̄`: the `k=2` determinant is `0` and `det(I−cK) = 1−c`, matching the series `1 − c + 0`;
- one-point process: `E e^{−f(X)} = 1 − ∫(1−e^{−f})|φ|²`, which equals `det(I − √φ' K √φ')`;
- sine kernel on `[0,1]`: `α₁ = 1 = tr K_W` and `α₂ = ∫∫(1−sinc²) ≤ 1`.

## H05 (CBirkbeck) — applied

At `a62a9af`, Milestone 10 consumes StochasticCalculus S1.2–S1.3, S3.2–S3.4, S4.1–S4.3, S5.1, S5.5, S9.1–S9.2
and S9.4, with adapters for:
- time `ℝ≥0` and `timeMeasure T`;
- `IsFilteredBrownian`;
- raw-filtration transport;
- the bracket normalization.

Each locator was checked at StochasticCalculus head `1af3598`: S1.2 has vector Brownian motion with orthonormal
components and isometry transport; S5.5 has the vector Lévy characterization; `IsFilteredBrownian` and
`timeMeasure` are at Suggested.lean lines 315 and 332. One locator is corrected: the supplier places
`IsStrongSolution` (its scalar carrier, Suggested.lean line 647) in S9.2 (README line 27), not S9.1. README line
630 changes from "strong-solution predicate of S9.1, whose scalar case is its `IsStrongSolution`" to
"strong-solution notion of S9.1–S9.2, whose scalar carrier is its `IsStrongSolution`". Pull-request links to
StochasticCalculus (README lines 78, 614) are replaced by the roadmap name.

Normalization recomputed: with inner product `(β/2) Re tr(AB)`, the Riesz vector of `H ↦ tr(AH)` is `(2/β)A`.
So `[tr(AH),tr(BH)]_t = (2/β) Re tr(AB) t`, which gives a diagonal variance of 1 for GUE (`β=2`) and 2 for GOE
(`β=1`), as in Convention 5.

## H06 (CBirkbeck) — applied

At `a62a9af`, `empiricalMeasure` is indexed by an arbitrary `[Fintype ι]`. `empiricalMeasure_eq_empiricalMeasureOfFintype`
(`TauCetiRoadmap/RandomMatrices/Suggested.lean` line 52) is proved by rewriting with Tau Ceti's
`empiricalMeasureOfFintype_toMeasure` (`TauCeti/Probability/Process/EmpiricalMeasure.lean` line 64).
`empiricalMeasure_isProbabilityMeasure` follows from it, and README line 187 forbids a second empirical
probability measure. The empty-index value is `(0:ℝ≥0∞)⁻¹ • 0 = ∞ • 0 = 0`, which keeps the zero-measure convention.

## H07 (CBirkbeck) — applied

At `a62a9af`, README lines 66–77 declare PolarDecomposition PD-A51–PD-A53 and OperatorIdeals OI-B01–OI-B19,
OI-B29, OI-B30, OI-B23 and Part C as suppliers. Both were checked on main (`d2e0f0d`):
- PD-A51 is the Courant–Fischer min–max formula (zero-based, over `(k+1)`-dimensional subspaces), PD-A52 is Loewner monotonicity, and PD-A53 is `|λₖ(S)−λₖ(T)| ≤ ‖S−T‖`.
- OI-B29 is the nuclear gauge, OI-B30 the trace-class family, OI-B23 its completeness, and Part C the Hilbert–Schmidt column model.

The bridge `Matrix.toEuclideanLin` exists at the pin (`Mathlib/Analysis/InnerProductSpace/PiL2.lean` line 1239), and
`Matrix.IsHermitian.eigenvalues₀` is antitone (`Mathlib/Analysis/Matrix/Spectrum.lean` line 62), which matches
the decreasing convention. The remaining one-based Weyl inequality was checked on `A = diag(1,0)`,
`B = diag(0,1)`: with `(i,j) = (1,2)` and `(2,1)`, both sides are `1`.

## Further repairs made (gate and house rules)

- **Imports:** `Suggested.lean` imported seven `Mathlib.*` submodules and an unused `TauCeti.Probability.Moments.Determinacy`. It now has `import Mathlib` plus `TauCeti.Probability.Process.EmpiricalMeasure`, and the docstring sentence about the unused import is removed.
- **Signature check:** every declaration was `#check @`-ed once in a temporary appendix, which was then removed. The elaborated types match the README prose and are unchanged by the import switch; no section variable was dropped (`wignerFromArray_isHermitian` keeps only `[MeasurableSpace Ω]`, which its statement does not use).
- **HCIZ display (README line 377):** the TeX-style `∏_{j=1}^{n-1}` / `e^{…}` now reads ``c_n t^(-n(n-1)/2) det[exp(t aᵢ bⱼ)] / (Δ(a)Δ(b))``, with `c_n = 1!·2!⋯(n-1)!`. Recomputed:
  - `n=1`: both sides are `e^{tab}`;
  - `n=2`, `t→0`: `det ≈ t(a₁−a₂)(b₁−b₂) = tΔ(a)Δ(b)`, so the right side tends to `1`, which is the left side at `t=0`.
- **Pull-request numbers:**
  - Mathlib PR numbers at README lines 221 and 273 become "interface proposed for Mathlib".
  - PointProcesses, StochasticCalculus and SuccessiveMinima are cited by name.
  - `SOURCES.md` still links StochasticCalculus by pull-request URL; it is outside the files this job may edit.
- **Ownership:** StochasticCalculus is an open new-roadmap pull request by the same author as this roadmap, and it is not in the merge order. Depcheck accepts it, and it does not consume RandomMatrices. Ownership was checked against the sibling checkouts and `roadmaps grep`.
- **Not changed (scope):** the README keeps its Milestone layout rather than the Layer/Checks form, and `Suggested.lean` keeps its prototype API lemmas (`stieltjes_eq_integral`, `frobeniusNorm`, …). Converting either to the current house form would widen this reply beyond the review.

## Adversarial pass (statements added, changed or vouched for)

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| HCIZ formula (README line 377) | `n=1`; `n=2`, `t→0` | `e^{tab}=e^{tab}`; RHS `→ 1!·t⁻¹·tΔΔ/ΔΔ = 1` = LHS at `t=0` | holds | display rewritten without TeX |
| Hadamard via Gram (line 537) | `k=1`; sine kernel `W=[0,1]`, `k=2` | `α₁ = ∫K(x,x) = tr K_W`; `α₂ = ∫∫(1−sinc²) ≤ 1 = (tr K_W)²` | holds | supplier → SuccessiveMinima 0.1.2 |
| Mercer trace / Fredholm series (lines 516–520) | rank-one `cφ⊗φ̄`; `1_{x=y}` | `det(I−cK)=1−c` = series; `1_{x=y}`: `∫diag=1 ≠ tr=0` | holds under continuity; negative control present | none |
| Laplace functional (lines 529–533) | one-point process `K=φ⊗φ̄` | `E e^{−f(X)} = 1−∫(1−e^{−f})|φ|² = det(I−√φ'K√φ')` | holds | none |
| Matrix BM bracket (M10) | GUE `β=2`, GOE `β=1`, entry `E₁₁` | `(2/β)Re tr(E₁₁E₁₁) = 1` resp. `2` | matches Convention 5 | none |
| `IsStrongSolution` locator (line 630) | supplier README line 27, Suggested line 647 | S9.2 (convention), scalar carrier | S9.1 alone was wrong | → S9.1–S9.2 |
| `empiricalMeasure` | `ι` empty; `ι` singleton | `∞•0 = 0`; `1⁻¹•δ = δ` | zero measure / Dirac | none |
| Weyl `λ_{i+j−1}(A+B) ≤ λᵢ(A)+λⱼ(B)` | `diag(1,0)+diag(0,1)`, `(i,j)=(1,2),(2,1)`; `n=1` | `1 ≤ 1`, `1 ≤ 1`; equality at `n=1` | holds | none |

## Build and gate

- `lake build TauCetiRoadmap.RandomMatrices.Suggested`: `Build completed successfully (8978 jobs)`, with only `declaration uses 'sorry'` warnings.
- Gate: `gate RandomMatrices: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK`
- Depcheck (`--movable`): `depcheck: 148 roadmaps, 999 edges, 0 problem(s)`. No UPWARD or CYCLE line; RandomMatrices is not yet in the merge order.
- Citation leads: the module paths `Mathlib.Probability.CentralLimitTheorem` and `Mathlib.MeasureTheory.Measure.ResolventTransform` both exist at the pin, so both leads are false positives.
- No sources were fetched and `needs-references.toml` was not written: every claim checked here was settled from the pinned libraries and the roadmaps.
