# Review of DiscriminantAnalysisAndLogisticRegression (pull request #2952 at 723ec62)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every formula, Check and worked example of the three layers was recomputed and agrees with its theorem and with the Lean statement, the degenerate cases (empty index type, empty sample, an empty class, singular scatter, points that do not span) behave as the README says, and the route of 3.3 matches MathematicalStatisticsFoundations 3.6 as it is declared on main. There is one format note and no small correction. Two things are left to the human reviewers: the two textbooks (Bishop, which carries 12 of the 17 locators, and Shalev-Shwartz–Ben-David) could not be read through a legal copy, so their locators and the wording against them are unverified, and the scope question below.

## N01 — Two sentences narrate what the author did not read

In 3.3 ("their paper's proof was not read", line 399) and in the last entry of the References ("the paper was not opened, and no locator into it is given", lines 717–718) the README reports the drafting rather than the mathematics. The attribution itself is sound as written ("as stated by Candès–Sur"); the entry would read timelessly as "attributed through Candès–Sur, §1.1; no locator into the paper is given".

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `classModel`, route lemma | `p = 1/2`, `δ₁`, `δ₀` on `ℝ` | posterior `1` at `1`, `0` at `0`; `σ` takes values in `(0,1)` only | Check true; positivity of densities needed | none |
| 1.2 `qdaScore`, QDA posterior | `d=1`, `μ=0`, `S₀=1`, `S₁=4`, `p=1/2` | score `−(log 4)/2 − x²/8 + x²/2 = −log 2 + 3x²/8`; `σ(−log 2)=1/3`; Bayes `(1/2)/(1/2+1)=1/3`; boundary `√((8/3)log 2)=1.3596` | agree | none |
| 1.2 hypotheses | `p=1`; `p=0`; `S₁=0` | posterior `1` a.e., `0` a.e., and `1` at the atom `μ₁` (pinned Gaussian with `S=0` is a Dirac mass); `σ` never `0` or `1` | each hypothesis needed | none |
| 1.3 LDA posterior | expansion; `μ₀=0, μ₁=2, S=1, p=1/2`; reversed sign; `μ₀=μ₁` | quadratic terms cancel to `⟪S⁻¹(μ₁−μ₀),x⟫ − (μ₁S⁻¹μ₁ − μ₀S⁻¹μ₀)/2`; `w=2`, `w₀=−2`, `σ(0)=1/2` at `1`, `σ(−2)=0.1192`; wrong sign gives `σ(−6)` at `2` against `σ(2)`; `w=0`, rule is all or nothing by `p ≥ 1/2` | agree; orientation `true ↦ μ₁` same in README and Lean | none |
| 1.4 naive Bayes | regrouping; `d=1, θ₀=1/4, θ₁=3/4, p=1/2`; `d=0`; `θ₁=1` | `wⱼ = log(θ₁/θ₀) − log((1−θ₁)/(1−θ₀))`; `w₁=log 9`, `w₀=log(1/3)`, posteriors `3/4`, `1/4` = `(3/8)/(1/2)`, `(1/8)/(1/2)`; `d=0` gives `σ(log(p/(1−p)))=p`; `θ₁=1` gives posterior `0` at `false` | agree | none |
| 2.1 Fisher's theorem | sample `(0,0),(2,2)` / `(3,0),(3,2)`; `δ=0`; empty `ι`; `S_W=0` | `S_W=[[2,2],[2,4]]`, `det 4`, `S_W⁻¹δ=(−2,1)`, max `4`; `J(δ)=16/8=2`, `J((1,0))=4/2=2`; `δ=0`: `J≡0`; empty `ι`: value set empty; `S_W=0`: junk `0`, all `w` attain | agree; `Nonempty ι`, `δ ≠ 0`, positive definiteness each needed | none |
| 2.1 API: `n ≥ card ι + 2` | rank count | centred points of class `b` sum to `0`, rank `≤ n_b − 1`, total `≤ n − 2` | true | none |
| 2.2 least squares | derivation; sample of 2.1; all labels `true` at `0,1,3`; points `0`,`1` | `∑tᵢ=0`; `∑tᵢxᵢ=nδ`; `n₁(n₀/n)²+n₀(n₁/n)²=n₀n₁/n`; `c=4/5`, `w=(−8/5,4/5)`, `w₀=12/5`; junk formula `6/7` against true `w=0`; `S_W=0`: formula `0` against true `−4` | agree; Lean factor `n₀n₁/n` and targets match | none |
| 3.1 concavity, strict iff spanning | `n=0`; empty `ι`; two equal points in `ℝ²` | `n=0`, `ι` nonempty: `ℓ≡0`, span `⊥ ≠ ⊤`, not strict; `ι` empty: one-point space, both sides true; `ℓ` independent of `w₂` | both directions agree | none |
| 3.2 score | both labels; three points `x=1`, labels T,T,F | `y σ(−ys)`: `σ(−s)=1−σ(s)` and `−σ(s)=0−σ(s)`; gradient at `0` is `2·(1/2)−1/2=1/2`; root `σ(w)=2/3`, `w=log 2` | agree | none |
| 3.3 existence | quasi-separation `x=1` T, `x=0` F; two points `(1,0)` T/F; `n=0`; dictionary to Foundations 3.6 | `ℓ=−log(1+e^{−w})−log 2`, sup `−log 2` not attained, `ℓ(0)=−1.3863`; support `{0,1}`, `t=1` on boundary of `[0,1]`; rank-deficient: max `−2 log 2` on `w₁=0`; `tᵣ − log(1+eʳ) = −log(1+e^{−yr})` both labels; `max_Z⟪u,·⟫=∑max(0,⟪u,xᵢ⟫)` | both directions agree; hypotheses of 3.6 as declared on main are met | none |
| 3.4 unique existence iff overlap | rank-deficient sample; three points of 3.2; `n=0`; empty `ι` | maximizers a line, `b=(0,1)` violates overlap: both false; unique `log 2`, overlap: both true; `n=0`, `ι` nonempty: `ℓ≡0` not unique, any `b≠0` qualifies: both false; empty `ι`: both true | agree | none |
| 3.5 separation | `x=±1` T/F; one point `x=0`; `n=0`; empty `ι`, `n≥1` | `ℓ=−2log(1+e^{−w})`, sup `0`; `ℓ≡−log 2`; `ℓ≡0`, separation vacuous; `ℓ(0)=−n log 2 ≤ −log 2`, no separation | agree, bound sharp | none |
| Copied definitions | `labelSign`, `IsRegressionFunction` against StatisticalLearningTheory at its open head | bodies identical character for character; `classificationError_bayesClassifier` there assumes a probability measure and predicts `true` where `η ≥ 1/2` | agree with the README's use | none |

- Source locators checked against the text: 3 of 17 (Candès–Sur §1.1, (1), (2), p. 2, cited in 3.3, 3.4, 3.5); the 14 into Bishop and Shalev-Shwartz–Ben-David were not readable.
- Library declarations opened at the pins: 40 Mathlib (those of the supplier contracts, each found in the file the README names) and 6 Tau Ceti (`multivariateGaussianPDFReal` and its three companions, `Real.hasDerivAt_log_one_add_exp`, `IsCoercive.isLeast_rayleighQuotient`); no library declaration states any of the ten theorems.
- Cross-roadmap citations resolved: StatisticalLearningTheory 1.1, 1.2, 1.3, 1.4 (open head); MathematicalStatisticsFoundations 3.1, 3.3, 3.6, 9.5 (main; 9.5 has no Lean declaration, as the README says); MathematicalStatisticsAsymptotic Layer 5; ExponentialCone 2.3; GaussianLinearModels Layers 1 and 2 (open head).
- Dependency check: `depcheck: 170 roadmaps, 1983 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only supplier not on main, StatisticalLearningTheory, is an open pull request adding a new roadmap, and the description names it.
- Elaboration of `TauCetiRoadmap/DiscriminantAnalysisAndLogisticRegression/Suggested.lean`: ten `sorry` warnings, nothing else; no `set_option`, no sorry'd data, single `import Mathlib`.
- One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) on a copy: all ten theorems fail under each; no padding.
- Elaborated signatures compared with the README: `classCount`, `classMean` and `withinClassScatter` do not carry `[Fintype ι] [DecidableEq ι]`, which their types do not need; every theorem carries its hypotheses explicitly. Nothing changed.
- Headlines of the README (QDA, LDA, naive Bayes, Fisher, least squares, concavity, score, existence, uniqueness, separation): all ten stated in Lean at the README's generality. The automatic checks all passed. The pull request's title and description agree with the head.

Overlap check: read StatisticalLearningTheory, GaussianLinearModels, MathematicalStatisticsFoundations; `labelSign`, the regression-function predicate and the Bayes classifier theorem are owned by StatisticalLearningTheory (copied and cited here), the scatter matrix by MathematicalStatisticsFoundations 9.5 (cited), least squares in general by GaussianLinearModels (not restated); nothing has two owners. A search of all open heads and main for logistic regression, Fisher's discriminant, naive Bayes, discriminant analysis and complete separation found no other roadmap stating them.

Source independence: 4 passages compared with 1 source (CandesSur), none shared; largest share Bishop, 12 of 17 locators; Bishop's text and table of contents could not be read, so wording and arrangement were not compared with it. By the README's own locators the layers draw on §4.2, §4.1.4–4.1.5 and §4.3.2–4.3.3 in that order, not the source's, and 3.3–3.5 have no locator into it.

Research link: 3.3–3.5 are the separation and overlap conditions of Albert and Anderson (1984) for existence of the logistic maximum-likelihood estimate, the starting point of Candès and Sur (2018) on the phase transition for existence in high dimension; rests on the README's 3.3–3.4 and CandesSur lines 37–54.

## Not verifiable

- Bishop, *Pattern Recognition and Machine Learning*: all 12 locators (§4.1.4–§4.3.3, pp. 187–208) and the README's remarks on its pp. 207–208 and Exercise 4.6. The sources service found no legal copy and did not accept the PDF on the Microsoft Research site as an author's page.
- Shalev-Shwartz–Ben-David, *Understanding Machine Learning*, §9.3, (9.10), p. 127 (two locators in 3.1): the publisher's page is closed and the service did not accept the PDF on the first author's university page.
- Albert and Anderson (1984): no locator is given into it and it was not looked for.

## Source issues

- **Error** in CandesSur at §1.1, p. 2: the source says the maximum-likelihood estimate exists if and only if the data overlap, with no condition on the design; it should be assume the points span, or say "exists and is unique"; affects nothing.
- **Misprint** in CandesSur at §1.1, (2), p. 2: the source says quasi-complete separation occurs when the weak inequality holds for any nonzero direction; it should be for some nonzero direction, with equality at some observations; affects nothing.

## For the human reviewers

- **Not tested.** Bishop carries 12 of the 17 locators (README lines 695–705); its text and contents page were not readable through the sources service, so wording and arrangement were not compared with it.
- **Licence.** The README cites PDFs of Bishop's book on the Microsoft Research site and of Shalev-Shwartz–Ben-David on the first author's page (README lines 695–708); the sources service classified neither host.
- **Scope.** Two of the three cited texts are textbooks; the one research article is arXiv:1804.09753v1. The refereed origin of 3.3–3.4, Albert–Anderson (Biometrika 1984), is cited without a locator (README lines 716–718).
