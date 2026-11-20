# Review of KernelsAndSpectralMethods (pull request #2516 at 33c2e73)

**Verdict:** accepted

**Summary.** Accepted: both findings of the previous review are repaired, and the repairs are correct. The operator form of the conditional mean embedding in 11.3 now carries the representability hypothesis, with a proof and a counterexample that I recomputed, and `E mmdU = MMD(P, Q)²` in 10.1 is stated for `n ≥ 2`. The five small corrections and four format notes of that review are repaired as well, and the description agrees with the head. There is no finding, no small correction and one format note; the human reviewers have the same four points as before.

## N01 — "How to read the build" says Layer 6 rests on Mathlib and Tau Ceti only

Section 6.4 also needs MathematicalStatisticsFoundations 8.4 and MathematicalStatisticsAsymptotic 1.2 (its `*Needs:*` line, line 764, and the Dependencies of Layer 6, line 811). The sentence at line 263 would agree with them as "Layer 6 resting on Mathlib, Tau Ceti and, for 6.4, Foundations 8.4 and Asymptotic 1.2".

## Previous findings

- R01 — repaired: "for every `g` in the Kolmogorov space of `l` some `f_g` in the Kolmogorov space of `k` represents `x ↦ E[g(Y) | X = x]` as above, then … `⟪g, U_{Y|x}⟫ = f_g(x)` for every `g`" (11.3, line 1281).
- R02 — repaired: "For `n ≥ 2` and feature maps integrable under `P` and under `Q`, `E mmdU = MMD(P, Q)²` under `(P ⊗ Q)ⁿ`; for every `n`, `n · mmdV = (n - 1) · mmdU + n⁻¹ ∑ᵢ h(zᵢ, zᵢ)`" (10.1, line 1058).

The previous small corrections and format notes: C01 repaired ("The 1997 printing of Chung states both lower bounds as strict", line 477); C02 repaired (Genovese et al. is cited only under Beyond, with its title); C03 repaired (Conventions, the Check of Layer 2 and the docstring of `fiedlerValue` give both cases); C04 and C05 repaired in the description; N01 repaired ("Chung (1.2), p. 4" in 2.1 and in the References); N02 repaired ("1 → 4", the Dependencies of Layer 6, the OptimalTransport contract), apart from the format note above; N03 repaired (`2/n`; `o_P(n⁻¹)` for independent samples); N04 repaired (the References heading; the `steinKernel` Check is now a value computed by hand). No repair introduced a problem.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 11.3 consequence, as repaired | general route; two points, `X = Y`, `k ≡ 1`, `l` identity | `⟪g, C_{YX}u⟫ = ⟪C_{XX} f_g, u⟫ = ⟪f_g, Φ x⟫ = f_g(x)`; counterexample: `C_{XX} = id`, `U = (½, ½)`, `⟪g,U⟫ = (g(1)+g(2))/2 ≠ g(x)` | true; counterexample true |
| 11.3, `f_g` well defined | two representatives `f`, `f'` | `C_{XX}(f − f') = E[(f − f')(X) Φ X] = 0`, so `f = f'` by injectivity | consistent |
| 10.1 `E mmdU = MMD²` for `n ≥ 2` | `n = 0, 1, 2`; `δ₀`, `δ₁`, Gaussian `σ = 1` | `n ≤ 1`: `descFactorial n 2 = 0`, `mmdU = 0` against `2 − 2e^{−1/2} = 0.787`; `n = 2`: mean of `h(z₀,z₁)`, `h(z₁,z₀)` | true as restated |
| 10.1 `n·mmdV = (n−1)·mmdU + n⁻¹∑h(zᵢ,zᵢ)` for every `n` | `n = 0, 1`, `n ≥ 2` | `0 = 0`; `h(z₀,z₀) = 0 + h(z₀,z₀)`; `n⁻¹∑_{i≠j} + n⁻¹∑ᵢ` both sides | true |
| Junk values of `fiedlerValue`, `cheegerConstant` at `card V = 1` | `W = (0)`, `W = (w)`, `w > 0` | no loop: `d = 0`, all `g ≠ 0`, `0/0 = 0`; loop: `w g = 0` forces `g = 0`, empty, `iInf = 0`; Cheeger: nonempty `S` is `univ`, empty | true |
| Conventions: Gretton's statistic minus `mmdU` | algebra in `n` | difference `= (2/n)(A − D)`, `A` the off-diagonal mean of `k(xᵢ,yⱼ)`, `D` the mean of `k(xᵢ,yᵢ)`; both `→ E k(X,Y)` | `o_P(n⁻¹)`, true |
| Layer 9 example `MMD(μₙ, δ₀) ≤ 2/n` | `μₙ − δ₀ = n⁻¹(δₙ − δ₀)` | `tvDist = 2/n`, `C = 1`; exact `MMD = n⁻¹√(2 − 2e^{−n²/2σ²}) ≤ √2/n`; `W₁ = n⁻¹ · n = 1` | true |
| `steinKernel` Check, diagonal value | `d = 1`, `b(x) = −x`, Gaussian width `σ` | `b²k = x²`; `∂ₓk = ∂_yk = 0`; `∂ₓ∂_yk = σ⁻²`; at `x = 0`, `σ = 1.3`: `1/1.69 = 0.5917` | true |
| 2.1 locator Chung (1.2), p. 4 | read at the locator | chung-ch1 line 162–168: infimum over `f ⊥ T1` of the Dirichlet sum over `∑ f(v)² d_v`, numbered (1.2), printed p. 4; (1.4) at line 207, p. 5 | agrees |
| 3.2 remark on Chung's strict forms | revised chapter read | chung-ch2 line 119–120: Theorem 2.2 strict; line 213–216: Theorem 2.3 with `≥`; `P₃`: `h = λ₁ = 1`, `1 − √0 = 1` | consistent; 1997 printing unread |

The rows for the untouched statements stand as in the previous review, of `ec81a1a`.

- Source locators read: Chung (revised chapters 1 and 2, author's page): (1.2), (1.4), Lemma 2.1, Theorems 2.2 and 2.3. Of the seeded sample, 2.1 and 3.2 fall in changed passages and were read; the other targets are untouched.
- Library declarations opened: `TauCeti.covMatrix` (`TauCeti/Probability/Moments/Covariance.lean` line 72), `TauCeti.exists_isFrechetBarycenter` (`TauCeti/MeasureTheory/Measure/FrechetMean/Basic.lean` line 288), `TauCeti.tendsto_of_isFrechetBarycenter_empiricalMeasure_ae` (`TauCeti/MeasureTheory/Measure/FrechetMean/Empirical.lean`); local `uStatistic`, `mmdU`, `mmdV`, `cheegerConstant`, `fiedlerValue`, `steinKernel`, `gaussianKernel` in `TauCetiRoadmap/KernelsAndSpectralMethods/Suggested.lean`.
- Cross-roadmap citations resolved: OptimalTransport 12.2 and 12.8 (on main, headings at lines 4434 and 4584 of its README), cited in 6.4 as the contract now says.
- The change to `Suggested.lean` is two docstrings; no statement changed, so the elaborated signatures stand.
- Elaboration: 49 `sorry` warnings, no error, no other warning (the `#check` output apart). 50 theorems, one proved. No `set_option`, a single `import Mathlib`.
- Dependency check: `depcheck: 199 roadmaps, 2189 edges, 0 problem(s)`; no change outside the folder.
- Description read against the head: the eleven layer items, the dependencies (OptimalTransport 12.2, 12.8), the count of theorems, the sentence on works cited by author, title and year; no sentence contradicted.
- Overlap facts: no other open pull request changes this roadmap, none drops an id it cites, no second copy on main.

Overlap check: read StatisticalLearningTheory, MarkovChainMixing, MathematicalStatisticsHigherOrderAndResampling, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric, MathematicalStatisticsFoundations (as in the previous reviews; the change touches no ownership statement); the Hausdorff sampling bound is owned by TopologicalDataAnalysis 8.4 and consumed here; Cheeger's inequality and the reversible spectral decomposition are owned by MarkovChainMixing for Markov kernels and here for weighted matrices, with no supply either way; nothing else shared.

Source independence: changed passages only: 3 passages (the definition line of 2.1, the remark of 3.2, the References entry) compared with 1 source (Chung, revised chapters), none shared; the other changed passages carry the roadmap's own proofs and computations; largest share Chung, 14 of 64 page locators, as before; no layer added, removed or reordered, so the arrangement was not compared again. The sixteen books other than Chung could not be read.

Research link: The kernel layers state results of Gretton et al. 2012 (two-sample tests), Sriperumbudur et al. 2010 (characteristic kernels), Sejdinovic et al. 2013 (energy distance and distance covariance), Gorham–Mackey 2017 (Stein discrepancies) and Sutherland–Schneider 2015 (random features); the spectral layers those of Chung 1997. Rests on the README's citations and the papers read.

## Not verifiable

- That the 1997 printing of Chung states Theorem 2.3 with a strict inequality (3.2, line 477): only the author's revised chapter, which has `≥`, could be read.
- The description's account of lean-CKSD (what is proved and what is admitted there): the repository was not opened.
- The books other than Chung, and the papers listed as not verifiable in the earlier reviews, remain unread; nothing in the changed text rests on them.
- Ownership was checked against main and the open roadmap pull requests; packages on the board were not searched.

Automatic checks set aside as false positives: the section comment that heads the block of `#check` lines pinning supplier declarations was reported as a header with no declaration under it; the `#check` lines are what it heads.

## Source issues

- none

## For the human reviewers

- Scope: 5.4 consumes TopologicalDataAnalysis 8.4, a roadmap that is not on main (same author's open pull request #2525); the description says this pull request merges after it.
- Licence: the README (Prior formalization) and the description say most of the subject is formalized in the author's lean-CKSD (Apache 2.0) and that no code is copied; I did not open that repository to compare with `Suggested.lean`.
- Not tested: of the sixteen books cited, only Chung (chapters 1–2, in the author's revised version) could be read; wording and arrangement were compared with it and with six papers.
- Scope: 27 works are cited by author, title and year only (README, References, last bullet); the statements resting on them carry the roadmap's own proof routes.
