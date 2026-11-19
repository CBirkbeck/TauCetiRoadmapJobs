# Review of KalmanFiltering (pull request #2564 at c8c8f85)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated identity, inequality and conditional law was recomputed (by hand on the scalar model, and in exact rational arithmetic against direct conditioning of the stacked Gaussian vector), every Check holds, all fifteen sampled source locators are right, and every cited library declaration exists at the pins with the stated hypotheses. There is one small correction (a sentence about inverses in the description and the module docstring that the head does not bear out) and three format notes, none blocking. Two points of scope and licence are left for the human reviewers.

## C01 — The sentence "every statement that uses a matrix inverse carries the hypothesis that makes it invertible, and the README gives a Check for each" is not what the head does

A reader of the description, or of the module docstring of `TauCetiRoadmap/KalmanFiltering/Suggested.lean` (lines 14–16: "every statement that uses an inverse assumes what makes the matrix invertible, the positive definiteness of the observation-noise covariances or of a predicted covariance"), expects no statement to rest on the junk inverse. But `riccatiMap_posSemidef` (line 69) assumes `R` only positive semidefinite, on purpose: README 1.3 (lines 169–170) explains that for singular `C P Cᵀ + R` the inverse is `0` and the update is `P`. Also `inv_measurementUpdate` assumes `P` positive definite, which is neither of the two hypotheses the docstring lists. And the junk-inverse Checks are in 1.1, 1.4, 1.5, 2.5, 3.1, 4.2 and 6.2; there is none for 1.2 or 5.1–5.3. The README's own convention ("uses an inverse in a way that matters") is the accurate wording.

Smallest change: in both places say "every statement whose truth depends on an inverse assumes what makes the matrix invertible (positive definite `R`, `P` or predicted covariance); `riccatiMap_posSemidef` needs no such hypothesis", and in the description replace "a Check for each" by the list of sections above.

## N01 — The Check of 1.5 on `P = 0` separates the two sides only when `Cᵀ R⁻¹ C ≠ 0`

In the second Check of 1.5 (lines 229–231) the left side `0` and the right side `Cᵀ R⁻¹ C` differ only for `C ≠ 0` (and nonempty `ι`); adding "for `C ≠ 0`" makes it a counterexample as written.

## N02 — Layers 4 and 6 use Layer 1 directly, but their Needs and Dependencies say it enters only through Layer 2

4.1 and 4.2 state their covariance with `innovationCov` of 1.1, and the guide (line 53) says Layer 4 depends on Layers 1 and 2; the Needs lines of 4.1 and 4.2 and the Dependencies of Layer 4 (line 523) would be consistent with that if they listed 1.1. Likewise 6.3 cites "the declarations of 3.1" while the guide gives Layer 6 only Layers 1 and 2.

## N03 — Layer 2 has two titles

The README calls it "the state-space model and the orthogonality principle", the section comment in `Suggested.lean` (line 98) "the state-space model and the filter recursion".

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 gain, updates, Riccati map | scalar `A=C=Q=R=P=1`; iterates; `R=0`, `C=1`, `P=diag(1,0)` | `S=2`, `K=1/2`, update `1/2`, map `3/2`; iterates `3/2, 8/5, 21/13, 55/34`; updates `1/2, 3/5, 8/13, 21/34`; junk update `diag(1,0)` | agrees with README | none |
| 1.1 comparison with `Matrix.gaussianCondCov` | definition opened at the pin | `S₁₁ − S₁₂ S₂₂⁻¹ S₂₁` with blocks `P, PCᵀ, CP, CPCᵀ+R` is `P − PCᵀS⁻¹CP` | agrees | none |
| 1.2 `joseph_eq_measurementUpdate_add` | scalar `K=0,1,1/2`; 400 random rational instances, singular `P` | `K=0`: `1=1/2+1/2`; `K=1`: `1=1`; `K=1/2`: `1/2=1/2`; random: both sides equal exactly | true | none |
| 1.3 `riccatiMap_posSemidef` | `A=0,Q=0`; `P=−1`; 400 instances with singular `R` and singular `S` | `0`; `−1` (not PSD, so `hP` needed); all principal minors ≥ 0 in every instance | true with `R` only PSD | C01 (wording only) |
| 1.4 `riccatiMap_sub_posSemidef` | scalar `0 ≤ 1`; `R=0` on `ℝ²`; `P=−1, P'=−9/10, R=C=1` | `1 ≤ 3/2`; `diag(1,0)` versus `0`; updates `−1` versus `−9`: both `hR` and `hP` needed; 400 instances PSD | true | none |
| 1.5 `inv_measurementUpdate`, `kalmanGain_eq_measurementUpdate_mul` | scalar; `P=0`; `P=−1,R=C=1`; 400 instances | `2=1+1`; gain `0=0`; gain `0` versus right side `−1` (so `hP` needed); exact equality in all | true | N01 |
| 2.1 `StateSpaceModel` | fields against README | six fields `A, C, Q, R, m₀, P₀`, no built-in condition | agrees | none |
| 2.2 recursion | scalar, `m₀=0` | `x̂(0\|0)=y₀/2`, `x̂(1\|0)=y₀/2`, gain at 1 `3/5`, `x̂(1\|1)=(y₀+3y₁)/5`, `P(1\|1)=3/5` | agrees | none |
| 2.3 Gaussian model | `P₀=−1`, `C=1`, `R=2`; `v=w` | `S=1`, gain `−1`, mean `2m₀−y₀`, cov `−2`; Dirac at `m₀` versus Dirac at `2m₀−y₀`; pairs independent, `w₀=v₀` not | Checks true | none |
| 2.4 second-order model | fields against prose; `R₀` not PSD | covariance of Dirac is `0 ≠ R₀`; `cov_w_v` covers equal times; PSD of `P₀,Q,R` follows from variance ≥ 0 | agrees | none |
| 2.5 orthogonality | scalar `k=0`; `ℝ²`, `R=0` | `cov=1−2/2=0`, `var=1−1+2/4=1/2`; junk gives error `x₀`, cross-covariance `diag(1,0)` | true; `hR` needed | none |
| 3.1 `condDistrib_state_obsWindow` | scalar `k=1`; 120 random models (dims 1–3, obs 0–2, horizon 0–3, singular `P₀`, `Q`) | coefficients `(1/5,3/5)`, variance `2−7/5=3/5`; recursion equals direct conditioning exactly in every model | true | none |
| 3.2 `condDistrib_succ_state_obsWindow` | scalar `k=0`; same 120 models | `N(y₀/2, 3/2)`; exact equality | true | none |
| 4.1 innovation | scalar | `y₀`, `y₁−y₀/2`; `C ε + v` form | agrees | N02 |
| 4.2 independence and law | scalar; `ℝ²`, `R=0`; 120 models | variances `2`, `5/2`, covariance `1−1=0`; both junk innovations equal `x₀`; cross-covariances `0`, diagonal `C P Cᵀ+R` exactly | true; `hR` needed | none |
| 5.1 `filtMean_ae_eq_condExp` | scalar; Rademacher `x₀`, `R=1/4` | `y₀/2`; `tanh(4y₀)` versus `(4/5)y₀` | Check true | none |
| 5.2 best affine estimator | Rademacher example | gain `4/5`, error `1−4/5=1/5`; `sign(y₀)`: `4Φ(−2)=0.0910` | true; affine restriction needed | none |
| 5.3 minimum mean squared error | scalar `k=1` | minimum `3/5`; `y₁` alone gives `var(v₁)=1` | true | none |
| 6.1 backward recursion | scalar `N=1`; Lean indexing `N−(j+1)` | `J=1/3`, `x̂(0\|1)=(2y₀+y₁)/5`, `P(0\|1)=1/2−1/10=2/5`; index `k+1=N−j` for `j+1≤N` | agrees | none |
| 6.3 smoother | scalar; `ℝ²` singular `P(1\|0)`; 120 models | `(2/5,1/5)`, `1−3/5=2/5`; junk `(1/2,0)`, `diag(1/2,0)` versus `(1,0)`, `diag(1/3,0)`; 506 exact equalities under hypothesis, 16 failures without | true; hypothesis needed | none |

- Source locators checked against the text: 15 sampled targets, 31 locators (23 Anderson–Moore, 8 Särkkä), all correct: AndersonMoore1979 lines 1618–1757 (§3.1, pp. 37–40), 1943 (Problem 1.2, p. 45), 1974–2047 (§3.2, pp. 46–47), 3266–3307 (§4.4, pp. 79–80), 3761–3859 (§5.2, pp. 93–95), 4134–4138 (§5.3, p. 102), 4256–4347 (§5.4, pp. 105–108), 5592–5652 (§6.3, pp. 139–140), 7662–7669 (§7.4, p. 189); Sarkka2013 lines 2823–2852 (pp. 56–57), 6376–6386 (p. 136).
- Library declarations opened at the pins: 24 of Mathlib (for example `Matrix.PosDef.fromBlocks₂₂`, `Mathlib/LinearAlgebra/Matrix/PosDef.lean` line 668; `Matrix.add_mul_mul_inv_eq_sub`, `NonsingularInverse.lean` line 614; `multivariateGaussian`, `Multivariate.lean` line 166, Dirac when not PSD, line 170; `condDistrib_ae_eq_of_measure_eq_compProd`, `CondDistrib.lean` line 164) and 4 of Tau Ceti (`map_affine_multivariateGaussian`, `Affine.lean` line 73; `Matrix.gaussianCondCov`, `gaussianCondCov_of_posDef`, `Conditional/Basic.lean` lines 105 and 121); all exist with the stated hypotheses. No Kalman, Riccati-map or smoother declaration exists at either pin.
- Cross-roadmap citations resolved: 1 (StandardDistributions §5.4, on main).
- Dependency check: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no change outside the folder.
- Automatic checks: all passed. Elaboration of `Suggested.lean`: 15 `sorry` warnings, nothing else.
- `#check @name` on all 34 declarations compared with the README: binders dropped are `DecidableEq`, `Fintype κ` and `MeasurableSpace Ω` on `innovationCov`, `timeUpdate`, `obsWindow`, `innovation`, which their types do not use; no hypothesis lost.
- One-tactic probe: each of the 15 theorems tried with `simp`, `rfl`, `infer_instance`, `simp` with the Layer 1 definitions unfolded, and `aesop`: none closes. No padding.
- Headline theorems (filter, prediction, innovations, three optimality statements, smoother, and the four Layer 1 results): all stated in `Suggested.lean`.

Overlap check: read GaussianLinearModels, LinearSystemsAndControl, HiddenMarkovModels (open), DenoisingDiffusion, MathematicalStatisticsSemiparametric, MathematicalStatisticsFoundations (main); nothing shared. LinearSystemsAndControl and HiddenMarkovModels each list the Kalman filter and the Riccati equations as not treated; GaussianLinearModels owns Gauss–Markov, which this roadmap excludes.

Source independence: 14 passages compared with 2 sources, none shared (no run of 9 common words with either text); largest share AndersonMoore1979, 23 of 31 locators; contents compared with AndersonMoore1979: independent (Layer 1 draws on its §§3.1, 4.4, 5.2, 6.3, Layer 5 on §§3.1, 3.2, 5.2).

Research link: Layers 3–6 state the filter of Kalman (1960) and the smoother of Rauch, Tung and Striebel (1965) as given in Anderson–Moore (1979) and Särkkä (2013); Layer 1's Riccati map is the object of the steady-state, algebraic Riccati and linear-quadratic duality theory that the README's scope names as not treated. Rests on the README and both texts.

## Not verifiable

- Kalman (1960), Rauch–Tung–Striebel (1965) and Joseph: attributed in the References without a locator and not consulted by the roadmap; nothing is cited to them, so nothing was checked.

## Source issues

- none

## For the human reviewers

- **Scope.** Both located sources are textbooks (Anderson–Moore 1979, Särkkä 2013); the primary papers are attributed without locators (README lines 788–790). The subject is discrete-time stochastic filtering (topic `math.OC`), stated as identities, with no procedure as a target.
- **Licence.** The Anderson–Moore text is a scan of a 1979 Prentice-Hall book on an author's university page; Särkkä's PDF carries a notice that it is for personal use. The roadmap shares no 9-word run with either.
