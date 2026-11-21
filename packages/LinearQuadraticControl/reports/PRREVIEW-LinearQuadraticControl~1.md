# Review of LinearQuadraticControl (pull request #2861 at 4997902)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every theorem, Check and convention of the README was recomputed (by hand, and numerically for Layers 1, 4 and 5) and agrees with `Suggested.lean`, which elaborates with `sorry` as its only warning and contains no padding; all supplier citations resolve at the heads of KalmanFiltering, LinearSystemsAndControl and IterativeMethodsForLinearSystems, and all sixteen Mathlib names at the pin. There is one small correction (a dependency line) and no format note. The two Anderson–Moore books could not be read from a place the sources service accepts, so their locators are unverified; that, and the status of the scans, is left to the human reviewers.

## C01 — The route of 3.1 uses that the Stein series bounds its partial sums, which the cited statement of LinearSystemsAndControl 5.4 does not give without the convergence of powers

An implementer who takes the dependency line of 3.1 (line 364) at its word has LinearSystemsAndControl 5.4 but not IterativeMethodsForLinearSystems 1.2, and cannot finish the bound. The route says the `j`-step cost of the feedback `F` "is at most `x₀ᵀ W x₀`" with `W` the series of 5.4. As stated at the supplier's head, `stein_eq_iff` says only that `Aᵀ P A − P = −Q` holds exactly for `P = ∑' k, Aᵀ ^ k * Q * A ^ k`; it asserts neither summability nor that `W` is positive semidefinite. From the equation one gets `W = ∑_{i<j} (Lᵀ)ⁱ (Q + Fᵀ R F) Lⁱ + (Lᵀ)ʲ W Lʲ` with `L = A + B F`, and the last term is seen to be nonnegative only after `Lʲ → 0`, which is IterativeMethodsForLinearSystems 1.2 (as 4.3 already lists for the same step).

The smallest change: add IterativeMethodsForLinearSystems 1.2 to the `*Needs:*` line of 3.1 and to the Dependencies of Layer 3, and to "Used in 2.3, 2.4, 4.2 and 4.3" in the supplier contracts.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 Riccati recursion, `valueMatrix`, `lqrGain` | scalar `A=B=Q=R=1`, `S=0`; `A=[[0,1],[0,0]]`, `B=1`, `P=1`; `N=0` | iterates `0,1,3/2,8/5,21/13,55/34`; gains `0`, `−1/2`; `AᵀA/2=diag(0,1/2)` vs `AAᵀ/2=diag(1/2,0)`; `P(0)=S` at `N=0` | agrees |
| 1.1 unfolding of `riccatiMap Aᵀ Bᵀ` | symbolic | `Aᵀ(P − PB(BᵀPB+R)⁻¹BᵀP)A + Q`; `lqrGain = −(kalmanGain Bᵀ R P)ᵀ A` for symmetric `P`, `R` | agrees |
| 1.2 `isLeast_lqCost`, `lqCost_eq_iff` | one-step identity expanded; `N=2` scalar; indefinite weights; `M=0`; `M=−1`; 136 random time-varying `2×2`, `N=3` | both sides `vᵀMv+2vᵀBᵀPAx+xᵀAᵀPBM⁻¹BᵀPAx`; cost `2 = 3/2+1/2`; optimum `3/2`; `u₀²`; all cost `0`; `−u₀²`; 0 failures | agrees; hypotheses needed |
| 2.1 definitions | double integrator `F=(−1,−2)`; `m` empty; `A=[2]`,`C=[0]`; `A=[1/2]` | `(A+BF)² = 0`; reduces to Schur stability of `A`; not detectable; detectable | agrees |
| 2.2 `isSchurStabilizable_iff_rank` | `diag(1/2,1)`,`e₁`; rotation, `B=0`; `diag(2,1/2)` with `e₂`, `e₁`; `n` empty | rank 1 at `μ=1`; `det=μ²+1`, drop at `i`; rank 1 at `μ=2`; `F=(−2,0)` gives `diag(0,1/2)`; rank `0 = card` | agrees, both directions |
| 2.3 `…_iff_forall_exists_tendsto` | `A=[2]`,`B=[0]`; `A=[2]`,`B=[1]`; uncontrollable block argument | `2ᵏx₀`; `0` after one step; second block evolves by `A₂₂` alone | agrees |
| 2.4 `isSchurDetectable_iff_tendsto` | `A=[2]`,`C=[0]`; `[[1,1],[0,1]]`,`C=(1,0)`; `p` empty | `2ᵏ` diverges, undetectable; only `x₀=0` has zero output; reduces to `Aᵏ→0` | agrees |
| 3.1 three theorems | scalar; `A=[2]`,`B=[0]`; `R=0` swap matrix; `A=[2]`,`Q=0` | limit root of `P²−P−1`; `0,1,5,21,85,341`; `0,diag(1,0),1,diag(1,0),1`; fixed points `0`, `3`, iterates stay `0` | agrees |
| 3.2 `isLeast_lqCostInf`, `lqCostInf_eq_iff` | scalar; `A=[2]`,`Q=0`; `m` empty; telescoped identity both directions | cost `φ`, gain `−1/φ`, loop `1/φ²`; cost `0` only at `u=0`, loop `2`; cost `∑xᵀQx = x₀ᵀPx₀` | agrees |
| 4.1 `isSchurStable_add_mul_lqrGain` | closed-loop form expanded; `A=[2]`,`B=C=R=1`; `C=[0]`; `2×2` with uncontrollable, unobservable mode `1/2` | `LᵀPL+CᵀC+KᵀRK = AᵀPA−KᵀMK+Q = P`; `P=2+√5`, loop `(3−√5)/2`; loop `2`; moduli `0.5`, `0.382` | agrees |
| 4.2 `existsUnique_posSemidef_dare` | scalar roots; `C=[0]` | `2±√5`, one nonnegative; solutions `0` and `3` | agrees |
| 4.3 `tendsto_riccatiMap_iterate` | scalar `S=10`; `C=[0]`; `2×2` from four starts | `10, 21/11, 53/32`; limit `3` from `S>0`, `0` from `0`; common limit `[[4.2361,2],[2,4/3]]`, spread `2e−16` | agrees |
| 5.1 `exists_steadyState_riccatiMap` | scalar; `C=[0]`; `G=[0]`; `2×2`; `p` empty | gain `1/φ`, `1/φ²`; `P↦4P+1`; fixed points `0`,`3`, error `2`; `(Aᵀ+Cᵀ·lqrGain)ᵀ = A(1−KC)` to `1e−316`, moduli `0.5`,`0.382` | agrees |
| Layer 4 preamble | kernels | `Cv=0 ⇔ CᵀCv=0`, so the two detectability rank tests coincide | agrees |
| C01: bound in 3.1 | supplier statement read | `stein_eq_iff` is an `iff` with `∑'`, no summability; bound needs `(Lᵀ)ʲWLʲ ⪰ 0` | dependency line incomplete |

- Source locators checked against the text: 7 of Sontag (3.3.10 p. 95; 5.5.6 p. 213; 5.5.7 p. 215; 8.2.7 p. 369; Theorem 41 p. 384; 8.4.4 p. 385; 8.4.5 p. 386), all correct, hypotheses included; 0 of 12 Anderson–Moore locators.
- Library declarations opened at the pin: 16, all present with the stated content (`Mathlib/LinearAlgebra/Matrix/PosDef.lean` 259, 319, 327, 479, 587; `Mathlib/Topology/Instances/Matrix.lean` 246, 496; `Mathlib/LinearAlgebra/Matrix/Charpoly/Eigs.lean` 83, 87; `Charpoly/Basic.lean` 193; `Rank.lean` 564; `NonsingularInverse.lean` 200; `Data/Matrix/Mul.lean` 786; `ColumnRowPartitioned.lean` 136; `Mathlib/Basic/ENNReal/BigOperators.lean` 118; `Logic/Function/Iterate.lean` 174).
- Cross-roadmap citations resolved at the open heads: KalmanFiltering 1.1, 1.2, 1.3, 1.4, 2.1, 2.2; LinearSystemsAndControl 1.1, 1.3, 1.4, 1.5, 1.6, 2.1, 3.3, 5.1, 5.4, 5.5; IterativeMethodsForLinearSystems 1.2; eight declaration names; the six copied definitions agree body for body.
- Dependency check: `depcheck: 172 roadmaps, 1998 edges, 0 problem(s)`; no UPWARD or CYCLE line. The three suppliers are open pull requests that add new roadmaps.
- Elaboration: `Suggested.lean` elaborates, 14 `sorry` warnings and nothing else; one `import Mathlib`, no `set_option`, no sorry'd data. `#check @name` types compared with the README for all 27 declarations: the only binders not carried are unused `DecidableEq` instances on five definitions; no hypothesis is lost.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`) on all 14 theorems: none closes. All headline theorems of the README are stated; none is absent or forced through a stand-in.
- Pull request text read against the head: title and description agree with the folder (new roadmap, 14 theorems and 13 definitions, three suppliers, copies named); no change outside the folder.

Overlap check: read KalmanFiltering, LinearSystemsAndControl, OptimalControlAndHamiltonJacobi (also LyapunovStabilityOfODEs, StochasticApproximationAveraging, MarkovDecisionProcesses on main); nothing shared. KalmanFiltering and LinearSystemsAndControl each list the Riccati asymptotics, the algebraic Riccati equation, discrete-time stabilizability and detectability as not treated; this roadmap owns them. Mathlib and Tau Ceti at the pins have no control Riccati equation, stabilizability or detectability (Tau Ceti's `GeometricMean.lean` treats the different equation `x a⁻¹ x = b`).

Source independence: 12 passages compared with 1 source (Sontag: seven statements, the proofs of Proposition 5.5.6 and Theorem 41, three docstrings), none shared beyond formulas; largest share Sontag1998, 11 of 23 locators; contents compared with Sontag1998 (Layers 1, 2, 3 against §8.2, §5.5, §8.4, not in its order; Layers 4 and 5 not in it): independent. Anderson–Moore's two books (12 locators) could not be read, so neither wording nor the order of Layers 3 to 5 was compared with *Optimal Filtering* §4.4.

Research link: the targets are the discrete-time regulator, algebraic Riccati and steady-state filter theorems of Kalman, as stated in Anderson–Moore (1979, 1989) and Sontag (1998, Lemma/Exercise 8.4.4, Proposition 5.5.6); they are prerequisites of linear-quadratic-Gaussian control and the separation principle, which the README's scope names. Rests on the README's references and on Sontag as read.

## Not verifiable

- Anderson–Moore, *Optimal Control: Linear Quadratic Methods*, §2.4, pp. 28–32, equations (2.4-11) to (2.4-14) (cited in 1.1, 1.2): the sources service does not accept the scan's host as an author's page; no other legal copy was sought. Requested.
- Anderson–Moore, *Optimal Filtering*, §4.4, pp. 76–84 with Problem 4.1 and equations (4.1) to (4.12), and Appendix C, p. 342 (cited in 2.1, 2.4, 3.1, 4.1, 4.2, 4.3, 5.1): same reason. Requested. The statements of 2.4 and 4.1 to 5.1 rest on this source alone; their mathematics was checked independently above.

## Source issues

- none

## For the human reviewers

- **Licence.** The README reads both Anderson–Moore books from scans on a page of John B. Moore at the Australian National University (`README.md`, References). The sources service refused that host as an author's page; whether the scans are a legal place is yours to settle.
- **Not tested.** Anderson–Moore, *Optimal Filtering*, carries 9 of the 23 locators and is the only source for Layers 4 and 5. Its text was not read, so wording and the order of 3.1, 4.1, 4.2, 4.3 against its §4.4 were not compared.
- **Licence.** `Suggested.lean` copies five definitions of KalmanFiltering and one of LinearSystemsAndControl verbatim (same author, both still open pull requests), under its own namespace; the README and the description say so.
