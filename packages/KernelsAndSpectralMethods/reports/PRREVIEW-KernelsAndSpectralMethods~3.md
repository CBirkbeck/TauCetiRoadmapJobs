# Review of KernelsAndSpectralMethods (pull request #2516 at ec81a1a)

**Verdict:** needs changes

**Summary.** Changes are still needed: the files are as the previous review read them, so its two findings stand, each one clause long (the operator form of the conditional mean embedding in 11.3 lacks the hypothesis that makes it true, and `E mmdU = MMD(P, Q)²` in 10.1 fails for `n ≤ 1`). The rewritten title and description were checked claim by claim against the head and agree with it, apart from two small points. There are two findings, five small corrections and four format notes, none of the last two kinds blocking; the human reviewers have the same four points as before.

## R01 (P2) — The operator form of the conditional mean embedding in 11.3 is false without the hypothesis that the conditional expectations lie in the Kolmogorov space of `k`

The "Consequence (prose target)" of 11.3 (line 1275) still reads: "if `C_{XX}` is injective and `Φ x` lies in its range, then `U_{Y|x} = C_{YX} C_{XX}⁻¹ Φ x` satisfies `E[g(Y) | X = x] = ⟪g, U_{Y|x}⟫` for every `g`". An implementer who takes these two hypotheses as the statement cannot prove it. Take `X = Y` uniform on a two-point set, `k ≡ 1` and `l` the identity kernel. The Kolmogorov space of `k` is the line spanned by `e = Φ(1) = Φ(2)`, `‖e‖ = 1`, and `C_{XX} f = ⟪f, e⟫ e` is the identity on it (injective, `Φ x` in its range). `C_{YX} e = E Ψ(Y) = (1/2, 1/2)`, so `⟪g, U_{Y|x}⟫ = (g(1) + g(2))/2`, while `E[g(Y) | X = x] = g(x)`: for `g = 𝟙_{1}` and `x = 1` the two sides are `1/2` and `1`.

What is missing is the hypothesis of `covariance_condExp_eq`, for every `g`: then `C_{XY} g = C_{XX} f_g` and `⟪g, U_{Y|x}⟫ = ⟪C_{XX} f_g, C_{XX}⁻¹ Φ x⟫ = f_g(x)`. The smallest change: "if moreover, for every `g`, some `f_g` in the Kolmogorov space of `k` represents `x ↦ E[g(Y) | X = x]` as above, then `⟪g, U_{Y|x}⟫ = f_g(x)` for every `g`". The sentence that follows ("The hypothesis can fail …") then refers to a hypothesis the target actually states.

## R02 (P2) — The identity `E mmdU = MMD(P, Q)²` of 10.1 fails for `n ≤ 1`, by the roadmap's own Check

Section 10.1 (line 1055) states "`E mmdU = MMD(P, Q)²` under `P ⊗ Q`" with no condition on `n` or on the kernel, and the module docstring of `Suggested.lean` lists it as a target. The local `uStatistic` is `(n.descFactorial 2)⁻¹` times a sum over injective pairs: at `n = 1` (and `n = 0`) the sum is empty and the factor is `0⁻¹ = 0`, so `mmdU = 0`, as the Check of Layer 10 (line 1172) records. With `P = δ₀`, `Q = δ₁` and the Gaussian kernel with `σ = 1` the right-hand side is `2 − 2e^{−1/2} ≈ 0.787`. The second identity of the sentence, `n · mmdV = (n − 1) · mmdU + n⁻¹ ∑ᵢ h(zᵢ, zᵢ)`, holds for every `n` (at `n = 1`: `h(z₀, z₀) = 0 + h(z₀, z₀)`).

The smallest change: "for `n ≥ 2` and feature maps integrable under `P` and `Q`, `E mmdU = MMD(P, Q)²` under `(P ⊗ Q)ⁿ`".

## C01 — The remark that Chung states both lower bounds of 3.2 as strict does not fit the author's revised chapter

Line 472 says "Chung states both lower bounds as strict inequalities for connected graphs". In the revised chapter 2 on the author's page, whose page numbers agree with the README's, Theorem 2.2 is `λ₁ > h²/2` and Theorem 2.3 is `λ_G ≥ 1 − √(1 − h²)`, not strict (which is consistent with `P₃`, where `h = λ₁ = 1`). If the 1997 printing has `>` in Theorem 2.3, say "the 1997 printing"; I could not read that printing.

## C02 — Genovese et al. (2012) is cited in 5.4 for a rate it does not state

The citation after `isBoundedInProbability_hausdorffDist` (lines 626–628) attaches the paper to the rate `(log n / n)^{1/d}` of the sample itself. Its Theorems 2 and 3 are minimax bounds `C n^{−2/d}` and `C (log n / n)^{2/d}` for estimating a manifold, with exponent `2/d` and for an estimator other than the sample. Keep the paper under "Manifold reach" in Beyond and drop it from 5.4, or add "who obtain the faster rate `(log n / n)^{2/d}` for manifolds without boundary".

## C03 — For a single vertex the index set of `fiedlerValue` is empty only when the vertex carries a loop

The Conventions (line 129), the Check of Layer 2 and the docstring of `fiedlerValue` say that for `card V = 1` the index set is empty. With `W = (0)` the constraint `∑ dᵢ gᵢ = 0` holds for every `g`, the index set is all nonzero `g`, and the value is `0` because the quotient is `0/0`; with a loop of weight `w > 0` the set is empty. The value `0` is right in both cases; the reason needs "or the quotient is `0/0`".

## C04 — The description's item for Layer 1 states the eigenvalue `2` criterion without the loop-free hypothesis

The description says Layer 1 covers "Weighted graphs with loops … the spectrum of the normalized Laplacian in `[0, 2]` with `2` exactly for a bipartite component". The head states the criterion only for `W` without loops (1.4, line 315), and its own Check shows it fails with one: `[[1, 1], [1, 0]]` has degrees `(2, 1)`, normalized Laplacian `[[1/2, −1/√2], [−1/√2, 1]]` with trace `3/2` and determinant `0`, eigenvalues `0` and `3/2`, while its positive graph `K₂` is bipartite. The text that would be right: "with `2` an eigenvalue of a loop-free graph exactly when a component is bipartite".

## C05 — The description says author–title–year citations are for results "in no book", and the README's list contains books

The description: "A result that is in no book, only in a paper we do not have a copy of, is cited by author, title and year". The last bullet of the References is headed "Books and papers without a local copy" and includes Dudley 2002 and Berg–Christensen–Ressel 1984, both books. "A result cited from a book or paper we do not have a copy of" would match the head.

## N01 — The formula defining `fiedlerValue` is Chung's (1.2), p. 4

Section 2.1 cites "(1.4), p. 5", which in the revised chapter is the equivalent form with `f − f̄` in the denominator and no constraint; the constrained infimum is (1.2) on p. 4.

## N02 — Three layer-level dependency lines disagree with the `*Needs:*` lines

"How to read the build" says the spectral strand runs `2 → 4`, while the Dependencies of Layer 4 say "Layer 1". The Dependencies of Layer 6 name "Layer 5 for the eigenvalue tools", which no `*Needs:*` line of 6.1 to 6.4 uses. The supplier contract for OptimalTransport says 12.1 is "cited in 6.4 and under Beyond", and neither place cites it.

## N03 — Two remarks are true but do not say what they are meant to

In the Examples of Layer 9 the total-variation bound of 9.1 with `C = 1` gives `MMD(μₙ, δ₀) ≤ 2/n`, not `√2 · 2/n`. In the Conventions, the statistic of Gretton et al. that keeps the terms `k(xᵢ, yᵢ)` differs from `mmdU` by `o_P(n⁻¹)`, which is what "the same null limit" needs; `O_P(n⁻¹)` alone would not give it.

## N04 — Two phrases describe how the text was produced

"Books and papers without a local copy" in the References, and the Check of `steinKernel` that reports Gauss–Hermite quadrature "to `10⁻¹⁶`". The first can read "cited by author, title and year"; the second can be dropped or replaced by a value computed by hand.

## Previous findings

- R01 — not repaired: "if `C_{XX}` is injective and `Φ x` lies in its range, then `U_{Y|x} = C_{YX} C_{XX}⁻¹ Φ x` satisfies `E[g(Y) | X = x] = ⟪g, U_{Y|x}⟫` for every `g`" (11.3, line 1275; R01 above).
- R02 — not repaired: "`E mmdU = MMD(P, Q)²` under `P ⊗ Q`, and `n · mmdV = (n - 1) · mmdU + n⁻¹ ∑ᵢ h(zᵢ, zᵢ)`" (10.1, line 1055; R02 above).

The previous small corrections C01 to C03 and format notes N01 to N04 are also unchanged and are written again above under the same numbers. No previous remark concerned the title or the description.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 10.1 `E mmdU = MMD²` (R02) | `n = 0, 1`; `δ₀`, `δ₁`, Gaussian `σ = 1` | `descFactorial 1 2 = 0`, empty sum: `mmdU = 0`; `MMD² = 2 − 2e^{−1/2} = 0.787` | false at `n ≤ 1` |
| 10.1 `mmdU`/`mmdV` identity | `n = 1` | `h(z₀,z₀) = 0 + h(z₀,z₀)` | true |
| 11.3 consequence (R01) | two points, `X = Y`, `k ≡ 1`, `l` identity | `C_{XX} = id` on a line; `⟪g,U⟫ = ½`, `E[g(Y)|X=1] = 1` | false as stated |
| 1.4 spectrum, as the description cites it (C04) | loop graph `[[1,1],[1,0]]`, `K₂`, `P₃` | `{0, 3/2}` with bipartite `K₂`; `{0,2}`; `{0,1,2}`; Chung Lemma 1.7(v) read ("bipartite and nontrivial") | README true; description drops loop-free |
| 2.1 bound `n/(n−1)`, as the description cites it | `K₃`, `K₂` | `3/2 = 3/2`, `2 = 2`; Chung Lemma 1.7(ii) read | true |
| 3.2 Cheeger chain, as the description cites it | `C₄`, `P₃` | `C₄`: `0.125 ≤ 0.134 ≤ 1 ≤ 1`; `P₃`: `0.5 ≤ 1 ≤ 1 ≤ 2`; Chung Theorems 2.2, 2.3 read | true; C01 |
| 10.4 `dCov² = 4 HSIC`, as the description cites it | README two-atom Check | `¼ = 4 · 1/16` | true |

The rows for the untouched statements stand as in the previous review, of `ec81a1a`.

- Description claims checked against the head: the sixteen books (all in the References with locators); the eleven layer items; the supplier sections Foundations 2.4, 8.2, 8.4, 8.5, Asymptotic 1.2, 6.2, 6.3, Nonparametric 5.8, OptimalTransport Layer 3, 12.2, 12.8, MSS-A05 to A07 and A09 (all on main); TopologicalDataAnalysis 5.3 and 8.4 and MarkovChainMixing 2.1 and 3.2 (at their open heads); Nonparametric's exclusion of permutation tests (its README line 2879); 50 theorems, 49 admitted, one proved; two local copies; the dictionary under Downstream consumers.
- Source locators read again: Chung (revised chapters) (1.2), (1.4), Lemma 1.7 (ii), (iv), (v), Lemma 2.1, Theorems 2.2 and 2.3; Genovese et al. Theorems 2 and 3.
- Library and local declarations opened: `uStatistic` (`TauCetiRoadmap/KernelsAndSpectralMethods/Suggested.lean` lines 78–80).
- Dependency check: `depcheck: 200 roadmaps, 2190 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: 49 `sorry` warnings, no error, no other warning. No `set_option`, a single `import Mathlib`.
- Overlap facts: no other open pull request changes this roadmap, none drops an id it cites, no second copy on main.

Overlap check: read StatisticalLearningTheory, MarkovChainMixing, MathematicalStatisticsHigherOrderAndResampling, TopologicalDataAnalysis, MathematicalStatisticsNonparametric, MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations (the last three, TopologicalDataAnalysis and MarkovChainMixing reopened at this round; the others as in the previous review); the Hausdorff sampling bound is owned by TopologicalDataAnalysis 8.4 and consumed here; Cheeger's inequality and the reversible spectral decomposition are owned by MarkovChainMixing for Markov kernels and here for weighted matrices, with the dictionary stated and no supply either way; nothing else shared.

Source independence: changed passages only (the pull request's title and description; the folder is unchanged): 4 passages of the description compared with 2 sources (Chung, Genovese et al.), none shared; largest share Chung, 14 of 64 page locators, as before; no layer added, removed or reordered, so the arrangement was not compared again. The sixteen books other than Chung could not be read.

Research link: The kernel layers state results of Gretton et al. 2012 (two-sample tests), Sriperumbudur et al. 2010 (characteristic kernels), Sejdinovic et al. 2013 (energy distance and distance covariance), Gorham–Mackey 2017 (Stein discrepancies) and Sutherland–Schneider 2015 (random features); the spectral layers those of Chung 1997. Rests on the README's citations and the papers read.

## Not verifiable

- The description's account of lean-CKSD (what is proved and what is admitted there) and of the numerical checks made while drafting: the repository was not opened, and the README's Prior formalization section lists the files without saying which are proved.
- Chung 1997 was read in the author's revised chapters 1 and 2; the 1997 printing was not read (C01).
- The books other than Chung, and the papers listed as not verifiable in the previous review, remain unread; nothing in the changed text rests on them.
- Ownership was checked against main and the open roadmap pull requests; packages on the board were not searched.

Automatic checks set aside as false positives: the section comment that heads the block of `#check` lines pinning supplier declarations was reported as a header with no declaration under it; the `#check` lines are what it heads.

## Source issues

- none

## For the human reviewers

- Scope: 5.4 consumes TopologicalDataAnalysis 8.4, a roadmap that is not on main (same author's open pull request #2525); the description says this pull request merges after it.
- Licence: the README (Prior formalization) and the description say most of the subject is formalized in the author's lean-CKSD (Apache 2.0) and that no code is copied; I did not open that repository to compare with `Suggested.lean`.
- Not tested: of the sixteen books cited, only Chung (chapters 1–2, in the author's revised version) could be read; wording and arrangement were compared with it and with six papers.
- Scope: 27 works are cited by author, title and year only (README, References, last bullet); the statements resting on them carry the roadmap's own proof routes.
