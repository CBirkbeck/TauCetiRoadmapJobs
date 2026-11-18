# Review of GaussianLinearModels (pull request #2510 at 4bd9bf2)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the four layers was recomputed (degenerate designs, singular covariance, `σ < 0`, rank 0, empty families, the worked Checks) and none failed; the 26 source locators were read in Chua's notes and Shalizi's draft and hold, one page range excepted; `Suggested.lean` elaborates with `sorry` as its only warning and no theorem closes under a one-tactic probe. There are four small corrections and one format note, none blocking. Two questions are left for the human reviewers: both sources are unrefereed (lecture notes and a draft textbook), and the Lean statements were not compared with outside formalisations.

## C01 — Two Chua page locators are off by a page

A reader who opens the cited page does not find the start of the argument, or looks for a page that the cited copy does not have. In 4.1 (line 697) the one-way layout is cited as "Chua, §3.8.3, pp. 53–54": in the copy at the URL of the References, §3.8.3 begins and ends on printed p. 53, which is the last page of the notes (Chua line 2760 to line 2802). In 3.5 (line 523) the `t` statistic of a coefficient is cited as "Chua, §3.5, p. 47": §3.5 begins on p. 46 (Chua line 2394) and reaches the `t` law on p. 47 (Chua line 2424).

Write "§3.8.3, p. 53" and "§3.5, pp. 46–47".

## C02 — The Gauss–Markov identity is already in both cited proofs, for a design of full rank

In 2.3 (lines 306–308) the citation ends "for a matrix of full column rank, as an inequality; the identity is proved here". A reader takes the identity to be absent from the sources. Both theorems are stated as inequalities, but both proofs display the identity: Chua's proof writes the variance of the competing estimator as the least-squares variance plus `σ² ‖Bᵀt‖²` (Chua line 2112 to line 2115, p. 41), and Shalizi's eq. (21.26) is the same decomposition for a covariance matrix (Shalizi line 13219, p. 364). What is the roadmap's own is the form for a subspace `L` and a functional of the mean, with no rank assumption and with `σ = 0` allowed.

Would read better as: "stated as an inequality for a matrix of full column rank, the identity appearing in the proofs (Chua, p. 41; Shalizi, eq. (21.26)); the form for a subspace, with no rank assumption, is proved here".

## C03 — The confidence-interval bullet of 3.5 does not restate `P_L a' ≠ 0`, and fails without it

The bullet (lines 531–534) is read on its own as a statement for every `a'`, as the prediction bullet after it is. For `P_L a' = 0` the interval is the point `0` and `⟪a', μ⟫ = ⟪P_L a', μ⟫ = 0`, so the coverage is `1`, while Student's law gives `[−q, q]` mass less than `1`; at `q = 0` the claimed coverage is `0`. The hypotheses are those of the preceding bullet (`P_L a' ≠ 0`, `μ ∈ L`, `n > p`).

Begin the bullet "For `a'` as in the previous bullet and `q ≥ 0`, …".

## C04 — The density of 3.7 has a coordinate form in Tau Ceti that the scope section does not cite

The scope section lists three coordinate results of Tau Ceti and what the roadmap adds to each; the density of `μ + σ • Z` is a fourth. `TauCeti.Probability.multivariateGaussian_eq_withDensity` (`TauCeti/Probability/Distributions/Gaussian/Density.lean`, line 265) gives, for a positive definite matrix `S`, the law `multivariateGaussian m S` on `EuclideanSpace ℝ ι` as the volume with density `multivariateGaussianPDF m S`. For `S = v • 1` with `v > 0` that density is `(2π)^(−n/2) (vⁿ)^(−1/2) exp(−‖x − m‖²/(2v)) = (2πv)^(−n/2) exp(−‖x − m‖²/(2v))`, which is `gaussianLikelihood m v x`. An implementer of 3.7 should know of it, and the README names only `stdGaussian_eq_withDensity_norm`.

Add it to "Not owned here" with what 3.7 adds (any finite-dimensional inner product space, the scalar covariance written as `σ • Z`), and, if wanted, a Check in 3.7 that `gaussianLikelihood m v` agrees with `multivariateGaussianPDFReal m (v • 1)` for `v > 0`.

## N01 — Cochran (1934) and Aitken (1935) are attributed by year but are not in the References

Lines 344 and 402–403 attribute 2.4 and 3.1 to these two papers; the References list only Chua and Shalizi, so a reader cannot find either paper. Add the two bibliographic entries, or drop the years.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 normal equations | collinear `X(b)=(b₁+b₂)(1,1)`, `y=(1,3)`; `X=0`; `X(b)=b(1,1)` | fitted `(2,2)`, RSS `2`, solutions `b₁+b₂=2`, least norm `(1,1)`; `X†X=2`, `X†y=4`, `b=2` | holds | none |
| 1.2 hat operator | `X(b)=b(1,1)`; collinear design | `H=[[½,½],[½,½]]`, trace `1` = rank, not `2` columns; `X†X=[[2,2],[2,2]]`, det `0` | holds | none |
| 1.3 estimability | collinear design; `X=0`; `E=0` | `c=(1,1)`: value `2` on all solutions; `c=(1,0)`: `2` and `0`; `X=0`: range `X†=0` | iff holds both ways | none |
| 1.4 nested models, `R²` | `L=⟨(1,1,1),(0,1,2)⟩`, `y=(1,1,4)`; `L₀=L` | `P_L y=(½,2,7/2)`, RSS `3/2`, RSS₀ `6`, difference `9/2`, `R²=¾`; `L₀=L`: `0` | holds | none |
| 1.4 multiplier form | `X=id`, `C b=b₁−b₂`, `d=0`; `C=0`, `d≠0`; general proof | `u=(−1,1)`, `w=−1`, increase `⟪w,−2⟫=2=‖(1,3)−(2,2)‖²`; cross term `⟪w,Ch⟫=0`, minimum `‖Xu‖²=⟪w,Cu⟫` | holds; existence iff `d∈range C` | none |
| 1.4 subspace form | `ker X ≤ ker C` | `dim K=(dim E−dim ker X)−(dim ker C−dim ker X)=rank C` | holds | none |
| 2.1 covariance operator | `±1` coin; four points `(±1,0),(0,±1)`; constant `(1,0)`; `S=0` | `S=½·id`, coordinates dependent; constant: second moment `u₁v₁` but mean `≠0`; `∫‖ε‖²=tr S=0` | definition separates the wrong model | none |
| 2.2 mean of a quadratic form | `F=ℝ²`, `L=⟨(1,1)⟩`; `A=id`; `p=n` | `E⟪ε,Aε⟫=tr(SA†)=tr(AS)`; RSS `(Y₁−Y₂)²/2`, mean `σ²`; divisor `n`: `σ²/2` | holds | none |
| 2.3 Gauss–Markov | `a=b=(1,0)`, `L=⟨(1,1)⟩`; `σ=0`; `L=F`; `L=0` | `σ²‖b‖²=σ²‖P_L a‖²+σ²‖b−P_L a‖²`: `σ²=σ²/2+σ²/2`; operator cross term `A P_L B†−A P_L A†=0` | holds | C02 (citation) |
| 2.4 Aitken | `S=diag(1,4)`; `S=diag(1,0)`; `S=0`; `S=σ²·id` | `b₀=(4/5,1/5)`, variance `4/5`; mean: `5/4`; gap `(9/100)·5=9/20`; singular: `b₀=(0,1)`, variance `0` | holds; existence from `ker` argument | none |
| 3.1 Cochran, algebraic | `diag(½,1)+diag(½,0)`; oblique pair; three identities over `𝔽₂`; empty family | ranks `2+1=3≠2`, product `diag(¼,0)`; oblique: `A₁A₂=A₂A₁=0`, ranges `(1,0)`,`(−1,1)`; `𝔽₂`: ranks `3≠1` | three conditions agree; char 0 needed | none |
| 3.2 Cochran with a mean | `K=0`; `v⊥K`; empty family; nonorthogonal lines | degree `0`, noncentrality `0`: Dirac at `0`; `cov(Z₁²,(Z₁+Z₂)²/2)=½·2=1` | holds | none |
| 3.3 chi-squared forms | `A=2P` rank 1; `A=P/2` rank 2; `A=0`, `r=0`; converse | variances `8≠4`, `1≠2`; power sums `∑λʲ=r` for `j=2,4,6` give `∑λ²(1−λ²)²=0` | iff holds both ways | none |
| 3.4 fitted value, residual | `L=⟨(1,1)⟩`; four-point error; `p=n` | `(Y₁−Y₂)/(σ√2)` standard normal; `RSS=1−ε₁²`, `E[ε₁ε₂²]=0`, dependent | holds | none |
| 3.5 studentized functional | `F=ℝ²`, `a=(½,½)`; `F=M=ℝ`; `σ<0`; `ν=0`; `P_L a'=0` | `T=2(Ȳ−m)/|Y₁−Y₂|`; sign of `σZ`; numerator `δ+sgn(σ)⟪a,Z⟫/‖a‖`; `P_L a'=0`: coverage `1` | theorem holds; CI bullet needs `P_L a'≠0` | C01, C03 |
| 3.6 variance ratio | first Check of 1.4; one degree of freedom; `m₀∈L` | `(9/2)/(3/2)=3`; `T=(3/2)/√(3/4)=√3`, `T²=3`; `RSS₀−RSS=‖P_K(Y−m₀)‖²` | holds, `λ=δ²` | none |
| 3.7 likelihood | `n=1`: `v=1`, `v=4`; `L=0`, `y=2`; `n=0`; ratio | `0.3989`, `0.1995`; maximum at `v=4`: `(8πe)^(−½)=0.1210`; ratio `(RSS/RSS₀)^(n/2)` with `RSS₀/RSS=1+qf/(n−p)` | holds | C04 (citation) |
| 4.1 one-way layout | groups `{1,3}`,`{5}`; sizes `3,1` with means `0,4`; empty third group; `k=n`; `k=1` | between `6`, within `2`, total `8`, statistic `3`; `λσ²=3+9=12`, not `16` | holds; Lean noncentrality equals `∑(m(g i)−m̄)²/σ²` | C01 (page) |
| 4.2 two-sample `t` | groups `{1,3}`,`{5}`; `n₁=n₂=1` | `‖a‖²=½+1=3/2`, `s²=2`, `T=−3/√3=−√3`, `T²=3` = 4.1 | holds | none |
| 4.3 simple regression | `x=(0,1,2)`, `y=(1,1,4)`; `x` constant | `β̂=3/2`, `α̂=½`, RSS `3/2`, `Var β̂=σ²/2`, `Var α̂=σ²(⅓+½)=5σ²/6` | holds | none |
| 4.4 two-way layout | `y=[[1,2],[3,6]]`; `b=r=1`; unbalanced four cells | sums of squares `9`, `4`, `1`, total `14`; degrees `n−a−b+1=0`; inner product of centred row and column vectors `½≠0` | holds | none |

- Source locators checked against the text: 26 of 26 (Chua 19, Shalizi 7); 24 hold as written, 2 need the page range of C01.
- Library declarations opened at the pins: 23 of Tau Ceti (among them `chiSquaredMeasure`, `ChiSquared/Basic.lean` line 209; `noncentralTMeasure`, `NoncentralT/Basic.lean` line 70; `HasLaw.pi_norm_sq_orthogonalProjectionOnto_stdGaussian`, `Gaussian/Projection.lean` line 168; `multivariateGaussian_eq_withDensity`, `Gaussian/Density.lean` line 265) and 19 of Mathlib; every one cited exists with the stated content. No Gauss–Markov, Cochran or least-squares statement exists in either library.
- Cross-roadmap citations resolved on main: StandardDistributions 4.1, 4.2, 10.5, 10.6; MathematicalStatisticsFoundations 5.2, 7.4, 9.5 and Layer 6; MathematicalStatisticsAsymptotic 1.3 and 9.6; MathematicalStatisticsHighDimensional Layers 3 and 4. All are as described.
- Dependency check: `depcheck: 210 roadmaps, 2259 edges, 0 problem(s)`; no upward or cyclic line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 14 `sorry` warnings and nothing else. One-tactic probe (`rfl`, `simp`, `simp` with the six definitions unfolded, `constructor <;> simp_all`) on a copy: none of the 14 theorems closes. Elaborated types compared with the README statements: the three definitions that lose a section instance (`IsLeastSquares`, `IsCenteredWithCovariance`, `gaussianLikelihood`) do not need it; all 14 theorems carry their hypotheses.
- Headline theorems (Gauss–Markov, Aitken, Cochran in both forms, the noncentral `t` and `F` laws) are all stated in `Suggested.lean`; the pull request's description agrees with the head (14 theorems, 6 definitions, suppliers, sources).
- Automatic checks: all passed on this head.

Overlap check: read MathematicalStatisticsFoundations, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric (main), MathematicalStatisticsHigherOrderAndResampling, RandomizedSmoothing, KernelsAndSpectralMethods, StatisticalLearningTheory, LangevinAndHamiltonianMonteCarlo (open); nothing shared. Student's theorem, Scheffé's intervals and the unrestricted Gaussian likelihood stay with MathematicalStatisticsFoundations, as the README says.

Source independence: 32 passages compared with 2 sources (the 26 locators and 6 further passages: the proof line of 1.1, the Needs paragraph of 2.4, the routes of 3.1, 3.3 and 3.5, two docstrings), none shared; largest share Chua, 19 of 26 locators; contents compared with Chua §§3.1–3.8.3: independent (the source alternates general theory and simple regression; the layers are geometry, second moments, Gaussian laws, layouts, and no worked data of the source is reused).

Research link: none found in current research. The README attributes 3.1–3.2 to Cochran (1934) and 2.4 to Aitken (1935) and names penalized regression and model selection (MathematicalStatisticsHighDimensional, Layers 3 and 4) and Scheffé's intervals as consumers; the line rests on the README.

## Not verifiable

- The attributions to Cochran (1934) and Aitken (1935): neither paper is in the References and neither was read.
- Ownership against public formalisations outside the pinned libraries: not checked.

## Source issues

- **Misprint** in Chua at §3.3, p. 43: the source says the log-likelihood is maximized over `β` by maximizing `S(β)`; it should be by minimizing `S(β)`; affects nothing.
- **Misprint** in Chua at §3.8.1, p. 52: the source says `RSS` and `RSS₀ − RSS` have chi-squared laws; it should be `σ²` times chi-squared laws, as in its own lemma; affects nothing.
- **Misprint** in Chua at §3.7, p. 48: the source says the predicted response is `x*ᵀβ`; it should be `x*ᵀβ̂`; affects nothing.
- **Misprint** in Shalizi at §21.3, eq. (21.22), p. 364: the source says the middle factor is the inverse covariance; it should be the covariance, as in (21.21) and (21.23); affects nothing.
- **Error** in Shalizi at §21.3, p. 364, after eq. (21.26): the source says the competing variance is strictly larger; it should be at least as large, with equality when the row of the difference matrix is zero; affects nothing.

## For the human reviewers

- Scope: both sources are unrefereed, a student's notes of the Cambridge Part IB Statistics lectures (Chua) and a draft textbook (Shalizi); the subject is the classical linear model, and the two attributed papers (1934, 1935) are not in the References.
- Licence: both texts were read from their authors' pages; neither page's licence terms were examined. The roadmap takes only locators from them, no data or tables.
- Not tested: `Suggested.lean` was not compared with public formalisations outside the pinned libraries; the description says none was surveyed.
