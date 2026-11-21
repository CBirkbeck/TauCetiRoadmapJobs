# Review of HankelFormsAndRealMomentProblems (pull request #2851 at c82f35d)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, route and Check was recomputed (degenerate cases `n = 0`, `k = 0`, `m₀ = 0`, the zero measure, `a = b`, `a > b`), every source locator was read at its place, and every library and supplier citation was opened at the pins or on main; nothing false or unsupported was found. There is one small correction (what Schmüdgen's Proposition 9.10 actually states) and one format note, neither blocking. Nothing is left for a human to decide beyond the final approval.

## C01 — Proposition 9.10 of Schmüdgen bounds the rank and gives a criterion for equality; it does not state the formula `min(n + 1, |supp μ|)`

In 1.2 (line 116) the rank formula is cited as "Schmüdgen, Ten Lectures, Proposition 9.10, pp. 71–72, for finitely atomic measures". A reader who opens the proposition finds, for a `k`-atomic measure, the decomposition of the Hankel matrix into `k` rank-one terms, the inequality `rank ≤ k`, and the statement that equality holds exactly when the moment vectors of the atoms are linearly independent. The formula with the minimum is not there: in one variable it needs the further (Vandermonde) step that the vectors `(1, x_j, …, x_jⁿ)` of `k` distinct points span a space of dimension `min(n + 1, k)`, which the route of 1.2 in fact supplies through the kernel.

The statement itself is correct (checked on `δ₀ + δ₁`, `(δ₋₁ + δ₁)/2`, the zero measure and Lebesgue measure). The smallest change is to the parenthesis, for instance: "Schmüdgen, Ten Lectures, Proposition 9.10, pp. 71–72, gives `rank ≤ |supp μ|` for finitely atomic measures, with equality iff the moment vectors of the atoms are independent; the formula and the general case are proved here by the route below".

## N01 — The last Check of 3.2 does not say what is restricted

"The uniqueness is among all measures on ℝ, which the log-normal family of 2.2 shows is a real restriction on `m`" (line 316) can be read several ways. If the point is that uniqueness among all measures on ℝ is not automatic for a positive semidefinite sequence (the sequence `e^{k²/2}` has many representing measures), saying that would do.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `posSemidef_hankelMatrix_iff`, kernel ideal | `m = (1,0,0,…)`; `m = (1,0,−1,0,…)`, `p = 1 + X` | sections `diag(1,0,…)` PSD, `L(X·q) = 0`; second: `L(p²) = 1+0−1 = 0`, `L(p) = 1`, section `diag(1,−1)` not PSD | holds; PSD needed | none |
| 1.2 `rank_hankelSection_eq_min` | `δ₀+δ₁`; zero measure; Lebesgue on `[0,1]`; Cauchy | dets `1,2,1,0`; ranks `0,1,2,2` = `min(N,2)`; zero: rank 0 = encard ∅; Hilbert dets `1, 1/12, 1/2160`; Cauchy excluded by integrability | holds | C01 (citation) |
| 2.1 uniqueness `eq_of_representsUpTo_of_not_posDef` | `k = 0`; 3-point Gauss vs Lebesgue, `k = 2` | `k=0`: `[m₀]` not PD ⇒ `m₀ ≤ 0` ⇒ `μ = ν = 0`; Gauss sixth moment `57/400 ≠ 1/7`, section size 3 PD (det `1/2160`) | holds; hypothesis needed | none |
| 2.1 `exists_atomic_of_not_posDef` | `m_k = 2(−1)ᵏ + 3·2ᵏ`; `n = 0`; `n = 1`; `m = (−1,0,…)` | `m = 5,4,14,22,50`; dets `5, 54, 0`; kernel `(−2,−1,1)`: `−10−4+14 = 0`, `−8−14+22 = 0`; `n=0` vacuous (empty matrix PD); `n=1` ⇒ `m = 0`, `s = ∅` | holds | none |
| 2.1 route (real simple roots) | `p = (X−a)²h`; `p = ((X−u)²+v²)h` | `L(q²) = L(ph) = 0`; `v²L(h²) = L(ph) − L(((X−u)h)²) ≤ 0`; both contradict PD of size `r` | route sound | none |
| 2.2 Hamburger | `(1,2,1,…)`; PD case; singular case | `[[1,2],[2,1]]` eigenvalues `3, −1`; PD ⇒ dets `> 0` ⇒ supplier 7.3 (structure has integrable powers and infinite support); singular ⇒ 2.1 | holds | none |
| 3.1 `stieltjes_iff_exists_represents` | `δ₋₁`; exponential law; route sequence `s` | shift section `[−1]`; dets of `k!`: `1,1,1,4,144`; of `(k+1)!`: `1,1,2,24,3456`; `s`: `1,1,1,1,2,8` (products `m`-det × shift-det) | holds | none |
| 3.1 `stieltjes_det_pos_iff` | `δ₀+δ₁`; `n = 0`; `m₀ ≠ 1` | det size 3 `= 0`, support finite; empty det `= 1 > 0`; scaling by `m₀ > 0` | holds | none |
| 3.2 `exists_unique_represents_Icc_iff` | Lebesgue, `(a,b)=(0,1)`; `δ₂`; `a=1,b=0`, `δ_{1/2}`; `a=b=3`; `a=b=0` | `1/((k+2)(k+3))`; `−2^{k+1}`; `(1/4)(1/2)ᵏ` PSD but `Icc 1 0 = ∅`; `δ₂`: `2ᵏ(12−4−9) = −2ᵏ`; `c = 0` ⇒ `m₀δ₀` | holds; `a ≤ b` needed | N01 |
| 3.2 route (growth bound) | `t = (m_{2n+2}/m_{2n})^{1/2}` | `t² ≤ |a+b|t + |ab|` ⇒ `t ≤ c`; `m_{2n} = 0` ⇒ `m_{2n+2} = 0`; supplier 7.4 auxiliary takes `M ≥ 0` | route sound | none |
| 3.3 Hausdorff, `IsCompletelyMonotoneSeq` | Lebesgue; `(1,1/2,0,…)`; `δ₂`; `δ₋₁`; `m₀ = 0`; sign | `k!n!/(n+k+1)!`; `n=3,k=0`: `1 − 3/2 = −1/2`; `1 − 2 = −1`; `n=0,k=1`: `−1`; weights sum to `m₀ = 0` ⇒ `m = 0`; plain `Δm(0) = −1/2` | holds; sign pinned | none |
| 4.1 `exists_representsUpTo_iff` | `(1,0,0,0,1)`; `(1,0,1,0,1)`; `(0,0,0,0,1)`; `k = 0`; `δ₋₂+2δ₁+3δ₃` | ranks `2 vs 1`, no measure; `2 vs 2`; `1 vs 0`, none; `k=0` ⇔ `m₀ ≥ 0`; moments `6,9,33,75,261`, PD for `k ≤ 2`, ranks `3,3` for `k = 3,4` | holds | none |
| 4.1 vs Zalar 2.4 (5) | matrix rank vs Curto–Fialkow rank | Zalar (5b): `M(0,k) ≽ 0`, `rank M(0,k) = rank M(0,k−1)`: the README's condition verbatim in content; `m₀ = 0`: PSD + flat ⇒ `m = 0` on `0..2k` | agrees | none |
| 4.2 `exists_atomic_of_representsUpTo` | zero measure; `(1,0,1,0,1)`; Lebesgue, `k = 2` | rank 0, `s = ∅`, empty sums `= 0 = m_j`; rank 2, atoms `±1`, weights `1/2`; rank 3, Gauss nodes `1/2, 1/2 ± √15/10` | holds | none |

- Source locators checked against the text: 17 (Schmüdgen Thm 1.12, Prop 1.13, Thm 1.15, 1.16, 1.18, Prop 9.2, 9.3 (i), 9.10, Thm 9.5; Simon Thm 1; Zalar Prop 2.1 (4), Thm 2.4 (1), (2), (5), (i), (ii)), all at the stated pages.
- Library declarations opened at the pins: 24, among them `Matrix.PosSemidef` (`Mathlib/LinearAlgebra/Matrix/PosDef.lean:62`, finitely supported vectors), `Matrix.PosDef` (`:176`), `Matrix.PosDef.fromBlocks₁₁` (`:649`), `fwdDiff_iter_eq_sum_shift` (`Mathlib/Algebra/Group/ForwardDiff.lean:137`), `MeasureTheory.Measure.measure_compl_support` (`Mathlib/MeasureTheory/Measure/Support.lean:202`), `isCompact_closure_of_isTightMeasureSet` (`Mathlib/MeasureTheory/Measure/Prokhorov.lean:530`), `TauCeti.Measure.ext_of_forall_integral_pow_eq_of_support` (`TauCeti/Probability/Moments/CompactDeterminacy.lean:154`), `TauCeti.sub_nonneg_of_posSemidef_hankel` (`TauCeti/Analysis/Matrix/PosSemidef/Basic.lean:159`).
- Cross-roadmap citations resolved: SpecialFunctionsOrthogonalPolynomialsGeneral 2.4, 5.3, 7.3, 7.4 and `hankelDet`, `exists_measure_iff_hankelDet_pos`, `gauss_quadrature` on main (its `hankelDet` has the same body as the determinant of `hankelSection`); ClassicalArithmeticCompletion 6.21 on main; Completed/OneParameterSemigroups Part B on main; PositiveDefiniteSequencesAndToeplitzForms 3.4, 5.1–5.3 at its open head (named as a neighbour, not a supplier).
- Duplication: no Hankel moment theorem, Hausdorff moment theorem or completely monotone sequence in the pinned Mathlib or Tau Ceti (searched by object); a search of all open heads and main for Hamburger, Stieltjes, Hausdorff and truncated moment problems finds only the roadmaps named in the scope section, each of which excludes Hankel forms on the line.
- Overlap check: read SpecialFunctionsOrthogonalPolynomialsGeneral, PositiveDefiniteSequencesAndToeplitzForms, NevanlinnaPickInterpolation; Hankel determinants and their positivity, Hamburger's theorem for positive determinants, Gauss quadrature and the support bound are owned by SpecialFunctionsOrthogonalPolynomialsGeneral and cited here, not restated; nothing shared with the other two.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else; the 17 elaborated types were compared with the README statements and none lost a binder; a one-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) closes none of the 12 theorems. All headline theorems of the Summary are stated; no `set_option`, no sorry'd data, single `import Mathlib`.
- Pull request text read against the head: 12 theorems and 5 definitions as described; suppliers and locators as described.

Source independence: 17 passages compared with 3 sources (12 statements at their locators and 5 routes or docstrings), none shared; largest share Schmudgen2020TenLectures, 11 of 18 locators; contents compared with Schmudgen2020TenLectures: independent (Layers 1–2 draw on Lecture 1 §1.3 and Lecture 9 together, Layer 4 on another source; the order Hamburger, Stieltjes, interval is forced by the Needs lines of 3.1 and 3.2 on 2.2).

Research link: Layer 4 is the truncated Hamburger theorem of Curto and Fialkow (1991), which Zalar (2022) uses for the strong truncated problem; Layers 2–3 are the existence theorems of Schmüdgen's lectures (2020) and Simon (1998). Rests on the README's references and the three texts read.

## Not verifiable

- Curto and Fialkow 1991, Theorems 3.9 and 3.10: not opened; the attribution rests on Zalar's Theorem 2.4, whose heading gives exactly these numbers, and the README says the same.

## Source issues

- **Misprint** in Schmudgen2020TenLectures at the proof of Theorem 1.12, printed page 15: the source says the polynomial is a sum over one index with coefficient and power carrying two other indices; it should be the sum of `a_k xᵏ` over `k = 0, …, n`; affects nothing.

## For the human reviewers

- none
