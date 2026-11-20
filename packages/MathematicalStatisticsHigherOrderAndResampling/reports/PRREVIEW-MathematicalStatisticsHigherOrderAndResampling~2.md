# Review of MathematicalStatisticsHigherOrderAndResampling (pull request #2504 at 9af2fe3)

**Verdict:** needs changes

**Summary.** Changes are needed, for one reason: the three Layer 8 theorems of `Suggested.lean` assume `ContDiffOn ℝ ⊤ g U`, which at the pinned Mathlib means that `g` is analytic, while 8.1 of the README assumes `C^∞`; the fix is one token in three places. Both findings of the previous review (the subsampling coverage theorem and the ownership of the Kolmogorov distance) are repaired, and so are its five small corrections. There is one small correction and no format note. Apart from Durrett, the cited books could not be read legally, so most locators are unchecked; this and two further points are left to the human reviewers.

## R01 (P2) — In Layer 8 the Lean hypothesis on `g` is analyticity, not the `C^∞` of 8.1

An implementer who proves the three Layer 8 statements of `Suggested.lean` as written proves the bootstrap Edgeworth expansion, second-order accuracy and the coverage results only for `g` real-analytic near `μ`, which is less than the README states and less than Hall's smooth function model needs.

Section 8.1 (README line 1461) says "`g` is measurable and `C^∞` on a neighbourhood of `μ`". The Lean hypothesis is `hg : ∃ U ∈ 𝓝 (∫ x, x ∂P), ContDiffOn ℝ ⊤ g U` in `bootstrap_edgeworth_expansion`, `studentized_bootstrap_second_order_accuracy` and `bootstrap_interval_coverage` (`Suggested.lean` lines 923, 970, 997). At the pin the smoothness index of `ContDiffOn` has type `WithTop ℕ∞`, and its `⊤` is the analytic level: `Mathlib/Analysis/Calculus/ContDiff/FTaylorSeries.lean` line 118 has `notation3 "ω" => (⊤ : WithTop ℕ∞)` and line 120 has `notation3 "∞" => ((⊤ : ℕ∞) : WithTop ℕ∞)`; `ContDiffWithinAt` at `ω` asks for an analytic Taylor series (`ContDiff/Defs.lean` lines 130–133). In a separate test file, `example (g : ℝ → ℝ) (U : Set ℝ) (h : ContDiffOn ℝ ⊤ g U) : ContDiffOn ℝ ω g U := h` elaborates, and the elaborated signatures of the three theorems print `ContDiffOn ℝ ⊤ g U` with no coercion from `ℕ∞`.

The smallest repair: write the index as `((⊤ : ℕ∞) : WithTop ℕ∞)` in the three hypotheses (or `∞` after `open scoped ContDiff`). The README needs no change.

## C01 — Two Dependencies lines omit a supplier that the Needs lines of the same layer name

The Dependencies line of Layer 1 (README line 439) reads "Mathlib, Foundations 9.2, and Tau Ceti's bounded Lipschitz characterization and `leftLim_cdf`", while the Needs line of 1.1 (line 330) begins with ArithmeticStatisticsPartVIII §5.14, which now owns the definition that the whole layer rests on. The Dependencies line of Layer 2 (line 547) lists no earlier layer, while 2.3 needs 1.1 (line 532: the jump bound, for the sharpness statement). A reader who plans the build from the Dependencies lines misses both edges. Adding "ArithmeticStatisticsPartVIII §5.14" to the first and "Layer 1" to the second would make them agree with the Needs lines.

## Questions for the author

- The Durrett pages in 2.1–2.3 and 3.1 (pp. 113, 136, 137, 138, 140) are not those of the author's online copy of the fifth edition, where Example 3.3.15 is on p. 131, Theorem 3.4.17 on p. 157, Lemma 3.4.18 on p. 158, the smoothing inequality on p. 159 and Theorem 3.5.2 on p. 162 (Dur19 lines 6626–6627, 7979, 8013, 8046–8075, 8161–8165). The item numbers and statements agree. Are the README's pages those of the printed Cambridge edition? I could not open the printed edition. (The open LocalLimitTheorems roadmap cites Theorem 3.5.3 at p. 162, the online pagination.)
- 7.2 now says that Politis–Romano–Wolf, Thm 2.2.1(iii), p. 43, "prints only continuity at `c`, which is not enough". The mathematics of the README is right (the counterexample is recomputed below), but I could not read the book: does the printed theorem carry no further condition, such as the stated convergence holding for `α` in a range or `J` strictly increasing near `c`? If it does, the sentence should be softened.

## Earlier findings

- R01 of the previous review (coverage of the subsampling interval false under continuity at the quantile alone): repaired. The README now has "let `J` be continuous at its `(1 - α)`-quantile `c` with `J(x) > 1 - α` for every `x > c`" (line 1325), `Suggested.lean` has `hJα' : ∀ x, quantile J (1 - α) < x → 1 - α < cdf J x` (line 845), the proof route is rewritten, and the counterexample is a negative-control Check.
- R02 (two owners of the Kolmogorov distance): repaired. 1.1 reads "is the Kolmogorov distance of ArithmeticStatisticsPartVIII §5.14, which owns it" (line 305), with a supplier subsection, a Needs entry and a local copy whose docstring names the owner; the pull-request description names the dependency and the order.
- C01 (no continuous expansion for a fixed `G` only): repaired; 4.3 is now stated "for every sequence of continuous functions `Hₙ : ℝ → ℝ`".
- C02 (unused hypotheses in 5.2 and 9.1): repaired; `hac`, `hK`, `hp`, `hu`, `hv`, `hw` are gone and the README says why.
- C03 (two declarations of 6.1 that ask for nothing): repaired as offered; both docstrings say "A check of the definition rather than a target of its own", and the unused `hn` is gone.
- C04 (Mathlib's simplex): repaired; the new sentence is right at the pin (`stdSimplex` is deprecated in favour of `Convexity.StdSimplex`, `Mathlib/Analysis/Convex/StdSimplex.lean` lines 39–40).
- C05 (two notions of lattice law): repaired; 3.1 compares with MarkovChainsAndRenewal Layer 5 item 3, and the example `1 + 2B` (maximal span `1` there, `2` here) is correct.
- N01 (the `#check` block): the header now says what the block is for; nothing further.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Kolmogorov distance, Pólya (sampled) | `N(0,1)` vs `N(0,4)`; `δ_{1/n}` vs `δ₀`; `2•δ₀` | `c² = (8/3) log 2`, `Φ(1.3595) - Φ(0.6798) = 0.1613`; distance `1`; `cdf ≤ 1` | true; owner §5.14 resolved at its head | none |
| 1.2, 1.3 bounded Lipschitz, random laws | `δ₀`, `δ_a`; modulus by contradiction | `|f(a) - f(0)| ≤ min(a, 2)`, attained; BL → 0 ⇒ weak ⇒ Pólya | true | none |
| 2.1 Pólya density | scaling `x ↦ L x`; tail | density `(1 - cos Lx)/(πLx²)`, ch.f. `(1 - |t|/L)⁺`; `2∫_a^∞ 2/(πLx²) = 4/(πLa)` | true; Dur19 lines 6627–6629 | none |
| 2.2 smoothing inequality | `P = δ₀`, `g = φ`, `x = 0`, `T = 1` | left `0.5`; right `0.1413 + 3.0477 = 3.189` | true; Dur19 lines 8013–8020, 8075 | none |
| 2.3 Berry–Esseen, sharpness (sampled) | equal summands; Rademacher `k = 0`, `k → ∞` | `nρ/(nσ²)^{3/2} = ρ/(σ³√n)`; `1/2 ≤ 1/2`; `√(2k)/(2√(πk)) = 1/√(2π)` | true; Dur19 lines 7979–7987 (constant 3) | none |
| 3.1 lattice laws | `1 + 2B`; `(δ₀ + δ₁)/2` | support `{1, 3}`: span `1` in `aℕ`, `2` with shift; spans `1` and `1/2` | true; Dur19 lines 8165–8179 | none |
| 3.2 Cramér, atoms | uniform; dimension `0`; smoothing by `η² N` | `≤ 2/|t|`; vacuous with `R = 1`; density `≤ C + √(2π)`, atom `≤ 2C₂η + P(|N| > 1/η)` | true | none |
| 4.1 cumulants, polynomials | recursion at `r = 2, 3`; exponential | `r₂ = g₁²/2 + g₂`, `r₃ = g₁³/6 + g₁g₂ + g₃`; `p₂ = -x⁵/18 + 11x³/36 - x/12` | true | none |
| 4.2 one-term expansion, sharp constant (sampled) | extrema of `(x² - 1)φ` | `φ(0) = 0.3989` at `0`, `2φ(√3) = 0.178`; `2/(6√(2π)) = 0.13298` | true | none |
| 4.3 lattice expansion, no continuous expansion (sampled) | Rademacher, `n` even, `x = 0`; jump at a lattice point | both sides `1/√(2πn)`; sawtooth jump `+1` gives `(h/√n)φ(xₙ)`; half-jump `0.399` | true | none |
| 4.4 every order | class with `a > 1`; `d = 0` | `cε^a ≤ max(c,1)ε` for `ε ≤ 1`, `1 ≤ max(c,1)ε` after; empty determinant `1`, both sides `1_A(0)` | true | none |
| 4.5 smooth functions, `t` statistic (sampled) | `A = (x - m)/σ`; `A₁ = -γ/2`, `A₂ = -2γ` | `p₁ = -γ(x² - 1)/6`; `q₁ = γ/2 + γ(x² - 1)/3 = γ(2x² + 1)/6` | true | none |
| 4.6 local expansion | scaling by `σ`; tail of ch.f. | `σ⁻¹φ(x/σ)(1 + (κ₃/σ³)He₃(x/σ)/(6√n))`; `φ^ν` integrable ⇒ `φ → 0` | true | none |
| 4.7 Cornish–Fisher (sampled) | exponential, median | `p₁(0) = 1/3`, `w = -1/(3√n)`, sum median `n - 1/3` | true | none |
| 5.1 tilting (sampled) | `n = 0`; density ratio; `s` not in the set | both `δ₀`, factor `1`; `e^{n(K(s) - s x̄)}`; excluded by `hs` | true | none |
| 5.2 saddlepoint | exponential `n = 1`; continuity at `x` | `e⁻¹√(2π) = 0.9221`; `f = f*` near `x` where `f* > 0` | true without the removed hypotheses | none |
| 6.1 resampling kernel (sampled) | `x = (0, 1)`, `R = √2(ȳ - x̄)`; arbitrary `F` | masses `1/4, 1/2, 1/4`, variance `1/4`; finite-valued modification is measurable | true | none |
| 6.2 bootstrap of the mean | `x = (0, 1, 2)` | `7/27` at `0`, `1/27` at `±√3`, variance `2/3` | true | none |
| 6.3 bootstrap Donsker (sampled) | `n = 2`, `t ∈ [a, b)` | `√2(Bin(2, ½)/2 - ½)`, variance `1/4 = F̂(1 - F̂)` | consistent | none |
| 6.4 delta method, failure (sampled) | union of axes; `x²` at `0`; `E` without measurable singletons | `1{X₀ ≠ Y₀}` → `(δ₀ + δ₁)/2 ≠ δ₀`; `Var(W² + 2zW) = 2 + 4z²`; conclusion map a.e.-measurable when hypothesis map is | true | none |
| 6.5 sample maximum (sampled) | `x = (0, 1)`; `(1, 1)`; `m`-out-of-`n` route | `3/4`; `1`; `Bin(n, p_m)`, `n p_m → ∞`, `(1 - p_m)^m → e^{-(x/c)^δ}` | true | none |
| 7.1 jackknife (sampled) | `x = (0, 1, 2)`, `g = id`, `g = t²` | `1/3`; deviations `13/12, -1/6, -11/12`, `(2/3)(294/144) = 49/36` | true | none |
| 7.2 coverage, repaired | quantile bracketing; the counterexample | `J(c - ε) < 1 - α < J(c + ε)`, `J(c) = 1 - α`; `Var W ≤ b/n`, `P(W ≥ 1 - α) ≤ (b/n) log²(b + 2) → 0` | true with the new hypothesis; Check true | none |
| 7.3 empirical likelihood | `x = (0, 2)`, `m = 1/2`; range of `V` | `R = 3/4`, `-2 log R = 0.5754`; `K = range V` from the two hypotheses | true | none |
| 8.2 bootstrap expansion (sampled) | small `n`; indices `r` outside `1..j` | `C ≥ n₀^λ` makes the bound trivial; `p̂ = p` there | consistent; hypothesis on `g` narrower than 8.1 | R01 |
| 8.3, 8.4 accuracy, coverage | one-sided normal, percentile; `α = 0.05`, `γ = 2`, `n = 25` | `1 - α - n^{-1/2}q₁φ`; `1 - α - n^{-1/2}(p₁ + q₁)φ`; `-0.044`, `-0.032` | consistent | R01 |
| 9.1 invariance (sampled) | `block = (0,1,1)`, `q = (1, ½, ½)`; `p` with a zero | `4 = 4`; `128/9 = 128/9`; variant `8/3 ≠ 10/3`; both sides `0` | true for all `p, u, v, w` | none |
| 9.2 Čencov | rational point `(kᵢ/N)`; `m = 2` | image `c_N`, `N ≥ 2`; forms on a line: dimension `1` | consistent | none |
| 9.3 trilinear (sampled) | `m = 2, 3, ≥ 4` | multiplicity of `V` in `V ⊗ V`: `0, 1, 1`; at `c₂`, `4a³ - 4a³ = 0` | consistent | none |

- Source locators checked against the text: 6, all in Durrett's author-hosted fifth edition (Example 3.3.15, Theorem 3.4.17 and its remarks, Lemmas 3.4.18 and 3.4.19, the inequality before (3.4.1), Theorem 3.5.2); statements and numbers agree, pages differ (see the questions).
- Library declarations opened at the pin: `ContDiffWithinAt` and the notations `ω`, `∞` (`Mathlib/Analysis/Calculus/ContDiff/Defs.lean` line 130, `FTaylorSeries.lean` lines 118, 120), `stdSimplex` (`Mathlib/Analysis/Convex/StdSimplex.lean` line 40), `TendstoInDistribution` (`Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean` line 64), `MeasureTheory.Measure.quantile` (`TauCeti/Probability/Quantile.lean` line 164); the 47 names of the `#check` block elaborate.
- Cross-roadmap citations resolved: ArithmeticStatisticsPartVIII §5.14 "Kolmogorov distance" at the head of its open pull request (README lines 356–360, the five facts as cited); MarkovChainsAndRenewal Layer 5 item 3 on main (README line 325); MathematicalStatisticsFoundations and MathematicalStatisticsAsymptotic sections on main; MathematicalStatisticsNonparametric's pointer to this roadmap (README line 2938).
- Dependency check: `depcheck: 199 roadmaps, 2190 edges, 0 problem(s)`; no UPWARD or CYCLE line; no change outside the roadmap folder.
- Automatic checks: all passed on this head. Elaboration of `Suggested.lean`: no error, 50 `sorry` warnings and no other; no `set_option`, no sorry'd data; single `import Mathlib` and nine `TauCeti.*` modules.
- Elaborated signatures compared with the README statements for all 50 theorems: they agree except in the hypothesis on `g` in Layer 8 (R01); only `sample` drops a section binder, which it does not need.
- One-tactic probe on a copy of the file: `isMarkovKernel_bootstrapKernel` closes and is marked as a check of the definition; `polya_density_charFun_tail`, the nonlattice bound, `bootstrapKernel_iSup_eq` and the two invariance theorems do not close with `simp`.
- The pull request's title and description agree with the head (nine layers, 50 admitted theorems, the three roadmap suppliers and the merge after ArithmeticStatisticsPartVIII).

Overlap check: read LocalLimitTheorems, KernelsAndSpectralMethods (open), MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric (main, and as revised by the open section-order pull request, which drops no cited id); also ArithmeticStatisticsPartVIII and MarkovChainsAndRenewal by object. Kolmogorov distance: owner ArithmeticStatisticsPartVIII §5.14, cited here. Lattice laws on `ℝ` and their characterization: owner this roadmap (3.1); LocalLimitTheorems, later and not in the merge order, keeps integer laws of maximal span one as a proof step and says so in its scope. Density of `Sₙ` for `n ≥ ν`: a proof step in both 4.6 here and LocalLimitTheorems 3.2, a target in neither. Lattice laws on the half-line: MarkovChainsAndRenewal Layer 5, a narrower variant, compared in 3.1. KernelsAndSpectralMethods shares nothing (its "Kolmogorov" objects are feature spaces of kernels).

Source independence: 6 passages compared with 1 source (Durrett), none shared beyond formulas; largest share Hall, about 30 of about 99 locators; Hall's text and contents page could not be read, so the contents were not compared with it. Durrett's contents (read) do not map onto Layers 2–3.

Research link: The headlines are the theorems of Petrov (1975), Bhattacharya–Ranga Rao (1986), Hall (1992), Shao–Tu (1995), Politis–Romano–Wolf (1999), Owen (2001) and Čencov (1982) on Edgeworth expansions, the bootstrap, subsampling, empirical likelihood and invariant metrics; rests on the README's locators, and on Durrett (2019), read, for Berry–Esseen and lattice laws.

## Not verifiable

- Hall (3.2, 4.1, 4.5, 4.7, 8.1–8.4), Petrov (2.2, 2.3, 4.2–4.4), Bhattacharya–Ranga Rao (2.2, 2.3, 4.2, 4.4, 4.6, 5.2), Shao–Tu (6.2, 6.4, 6.5, 7.1), van der Vaart (1.1, 6.2–6.5), van der Vaart–Wellner (1.2), Severini (5.1, 5.2), Owen (7.3), Politis–Romano–Wolf (7.2), Čencov (9.1–9.3), Amari–Nagaoka (9.2): the sources service found no legal copy (publisher pages paywalled or refused).
- Of the sampled targets, the locators of 1.1, 4.2, 4.3, 4.5, 4.7, 5.1, 6.3, 6.4, 6.5, 7.1, 8.2, 9.1 and 9.3 are therefore unchecked; 6.1 has no source locator; the statements were checked by computation (table above). Only 2.3 was checked against a text (Durrett).
- The printed page numbers of Durrett: only the author's online copy was read.
- The README's sentence that Politis–Romano–Wolf, Thm 2.2.1(iii), states only continuity at the quantile.
- Ownership against board packages not yet in a pull request was checked only against the two packages listed for this review (neither concerns probability or statistics).

## Source issues

- **Error** in Dur19 at Lemma 3.4.19, p. 158 of the author's online copy of the fifth edition (Dur19 line 8040): the source says the two distribution functions have mean 0; it should be that their characteristic functions are differentiable at 0, since those means do not exist; affects nothing; corrected in print at the preface of the same edition (Dur19 lines 56–59), which acknowledges the slip.

## For the human reviewers

- **Not tested.** Hall (1992) carries about 30 of about 99 source locators and could not be read legally; the wording and arrangement checks were made against Durrett only, not against Hall or the other paywalled books.
- **Licence.** The README's "Prior formalization" section (line 1734) says Layers 1, 3–6, 8, 9 overlap `CKSD/Asymptotics/` of bjbraams/lean-CKSD (Apache 2.0, the author's own project). This round did not re-compare the Lean; the previous round compared one file and found different names and binders.
- **Source claim.** 7.2 (README line 1329) says a published theorem (Politis–Romano–Wolf, Thm 2.2.1(iii)) is stated with an insufficient hypothesis. The counterexample is correct; whether the book prints only that hypothesis was not checked by any reviewer.
