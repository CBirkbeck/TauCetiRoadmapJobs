# Review of LocalLimitTheorems (pull request #2683 at 98e4695)

**Verdict:** needs changes

**Summary.** Changes are needed on one point: the lattice theorem the roadmap cites (Durrett, Theorem 3.5.3) is for real lattice laws of every span, but the only target is its integer, span-one case, and the general form is written out in 1.5 and then declared not to be a target. Everything else checked out: every statement survived the degenerate cases tried, every number printed in a Check was recomputed and agrees, every locator was read in the source, every cited library declaration exists at the pins, and `Suggested.lean` elaborates with `sorry` as its only warning. There are three small corrections and one format note, none blocking; one licence question and one note on what was read are left for the human reviewers.

## R01 (P2) — The lattice local limit theorem is a target only for integer laws of span one, although its source states it, and 1.5 derives it, for real lattice laws of every span.

A reader who finishes this roadmap has no theorem for a lattice law that is not integer valued with span one. The Rademacher walk, which the README uses as its running non-example and names under "Downstream consumers", is such a law (span 2), and so is any law on `b + hℤ` with `h ≠ 1` or `b` irrational. The source cited for 1.4 (Durrett, Theorem 3.5.3, p. 162) is the general statement; 1.4 is cited as its "case of span `h = 1`".

Section 1.5 (README line 182) writes the general form down and then says it is "recorded here and not a separate target"; the scope section repeats this, and `Suggested.lean` has only `localLimit_lattice`, for `X : ℕ → Ω → ℤ` with `HasMaximalSpanOne`. The derivation in 1.5 is correct, and it gives more than 1.5 claims. I recomputed it under the conventions of 1.4, with no centring and no moment hypothesis: for `Y = (X − b)/h`, the mean is `(m − b)/h` and the variance `σ²/h²`, so `(k − n·E Y)/√n = (n b + h k − n m)/(h√n)`, and `n_{σ²/h²}(y/h) = h·n_σ²(y)`. Hence, uniformly in `k : ℤ`, `(√n/h)·P(Sₙ = n b + h k) − n_σ²((n b + h k − n m)/√n) → 0`. When `X 0` is not integrable both variances are `0` by convention and the two total means no longer correspond, but the normal term is then identically `0`, so the statement still holds.

The smallest change: make 1.5 a target ("Prove", in place of "recorded here and not a separate target"), with the hypotheses of 1.4 in place of "mean `0` and finite variance", and correct the scope paragraph that lists it among the four non-targets. It is statable at the pins without a new definition, with the two carrier conditions written on `P.map (X 0)` (null complement of `b + hℤ`; non-null complement of every `b' + h'ℤ` with `h' > h`), so it belongs in `Suggested.lean` beside the integer theorem. The integer theorem can stay as it is; it is the step the general one is deduced from.

## C01 — The scope section lists the integral de Moivre–Laplace theorem among results "already in the libraries", and no declaration at the pins states it.

Under "Already in the libraries and therefore not targets" (README line 388) the list has "the central limit theorem for independent identically distributed summands and its integral form for the binomial law". Mathlib's `ProbabilityTheory.tendstoInDistribution_inv_sqrt_mul_sum_sub` (`Mathlib/Probability/CentralLimitTheorem.lean`, line 122) is there; that file does not mention the binomial law, and no file of the pinned Mathlib or Tau Ceti mentions both the binomial law and `gaussianReal` or `TendstoInDistribution`. A reader looking for the declaration finds none. The binomial form is a specialisation that nobody has stated: say so ("which specialises to the binomial law through Tau Ceti's `iIndepFun.hasLaw_sum_bernoulli`"), or drop the clause.

## C02 — The summary's sentence on infinite second moments describes a weaker statement than the theorems make.

Line 10 says that with an infinite second moment the two theorems "say that the local probabilities, or the densities, of `Sₙ/√n` tend to `0` uniformly". For the lattice theorem the content is `√n · P(Sₙ = k) → 0` uniformly in `k`, as the headline bullet two lines below says; that the probabilities `P(Sₙ/√n = x)` themselves tend to `0` is much weaker. "the rescaled local probabilities `√n · P(Sₙ = k)`, or the densities of `Sₙ/√n`" would match the statement. The description of the pull request has the same sentence.

## C03 — In the route of 3.2 the parenthesis justifying `σ² > 0` speaks of a law with a density, and the hypothesis gives a density to `S_ν`, not to `X 0`.

Line 320 says "with `σ² > 0` (a law with a density is not a point mass)". Under the smoothing condition it is the law of `S_ν` that has a density (3.1); the law of `X 0` need not. The conclusion is right, since a point mass `X 0` would make `S_ν` a point mass. "(`S_ν` has a density, so `X 0` is not a point mass)" says what is used.

## N01 — The scope section describes another roadmap by its state at the time of writing.

Line 400 has "MathematicalStatisticsHigherOrderAndResampling (an open roadmap, not on main)". Once that roadmap merges the parenthesis is false; the boundary it describes does not depend on it. Naming the roadmap and its sections is enough.

## Questions for the author

- The references attribute to "B. V. Gnedenko (1948)" both the lattice local limit theorem and the one for densities. I believe the lattice theorem is from 1948 and the density theorem from a later note (1954), but I had no text of either to check, and the one source read here that mentions the attribution (Bobkov–Marsiglietti, p. 2 and p. 4) cites only the Gnedenko–Kolmogorov book. Is one year meant for both?

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `HasMaximalSpanOne` | `δ_b`; zero measure; Bernoulli; uniform `{0,2,3}`; `{0,2}`; Rademacher | `δ_b`: complement of `b+2ℤ` has mass 0 (proved in Lean probe); zero measure fails too; differences gcd 1, 1, 2, 2 | sound; Rademacher excludes "support generates ℤ" | none |
| 1.2 characterisation | uniform `{0,2,3}` at `π` and on grid `2πj/1000`; Rademacher at `π` | `|1+1−1|/3 = 1/3`; grid max `0.999969`; `|cos π| = 1` | agrees | none |
| 1.3 inversion on ℤ | Bernoulli(1/2), `k = 1` | `(2π)⁻¹ ∫ (e^{−it}+1)/2 = 1/2`; Durrett Ex. 3.3.2 (ii) with `h = 1` | agrees | none |
| 1.4 `localLimit_lattice` | Bernoulli(1/2), uniform `{0,2,3}`, Rademacher, `n = 10, 40, 160, 640`; infinite variance; non-integrable `X 0`; measurability | max errors `0.0197, 0.0050, 0.0012, 0.0003`; `0.0120, 0.0048, 0.0023, 0.0011`; Rademacher `0.3795 … 0.3986`; `gaussianPDFReal 0 0 = 0`; `IdentDistrib` gives a.e. measurability | sound; span hypothesis needed | R01 on scope |
| 1.4 infinite-variance route | `g(t) = (1−|φ|²)/t²` | Fatou gives `g → ∞`; `|φ|ⁿ = (1 − t²g)^{n/2} ≤ exp(−n t² g/2)`; dominated by `exp(−c u²/2)` | sound | none |
| 1.5 real lattice laws | Rademacher `b=1, h=2`, `n=400, k=0`; general mean; point mass | `10·P(S₄₀₀=0) = 0.39869` against `0.39894`; `n_{σ²/h²}(y/h) = h n_σ²(y)`; point mass fails the maximality hypothesis | sound; holds without centring or moments | R01 |
| 2.1 `binomial_localLimit_ratio` | `p=1/2, A=1`; `p=0.3, A=3` to `n=10⁷`; off window; `p=0`; `A<0` | `0.0537, 0.0050, 0.0005`; `1.642, 7.628, 1.630, 0.429, 0.125, 0.038, 0.012`; ratio `1.67·10⁻⁴`; `p=0` error 1; vacuous | sound; `0<p<1` and window needed | none |
| 2.2 fair coin | `n = 100, 1000, 10⁴`, `kₙ = 7, 22, 71` | ratios `1.00080, 1.000078, 1.0000085`; against `e^{−1/2}`: `1.0109, 1.0162, 0.9959`; density `(πn)^{−1/2} e^{−k²/n}` | agrees with Durrett Thm 3.1.2 | none |
| 3.1 smoothing iff | `ν = 0`, `n = 0`; uniform `[−1,1]`; dependent copies with density `|x|^{−1/3}/3`; Rademacher | `|φ|⁰ = 1` not integrable, `δ₀` no density; `∫(sin t/t)² = π`; total mass 1, `∫|x|^{−2/3} = 6`; `|cos t|^ν` not integrable | both directions sound; independence needed | none |
| 3.2 `localLimit_density` | Gaussian; uniform `[−√3,√3]`, `n=2,3,4,8,12`; exponential, `n=2,10,100,1000`; Bernoulli; `ν=0`; `n<ν` | error 0; `0.0310, 0.0239, 0.0140, 0.0075, 0.0050`, density at 0 `0.40825`; `0.2311, 0.0700, 0.0193, 0.0059`; zero function against `n_σ²(0)>0`; hypothesis false | sound; smoothing needed | C03 on wording |
| Conventions: variance, normal density | infinite second moment; `v = 0` | `evariance = ∞` (`ProbabilityTheory.evariance_eq_top`), `toReal ∞ = 0`; `gaussianPDFReal m 0 = 0` (simp) | as stated | none |
| Scope: Wallis | formula | `2^{4n} n!⁴/((2n)!²(2n+1)) = 16ⁿ/(C(2n,n)²(2n+1))` | agrees with `Real.Wallis.W_eq_factorial_ratio` | none |

- Source locators read against the text: 9 of 9 (Durrett: definitions of §3.5 p. 161, Thm 3.5.2 p. 162, Thm 3.5.3 p. 162 and its proof pp. 163–164, Ex. 3.3.2 (ii) p. 131, Thm 3.1.2 p. 114; Bobkov–Marsiglietti §2, (2.1) and the following paragraph, p. 4).
- Library declarations opened at the pins: 34 (28 Mathlib, 6 Tau Ceti), all present with the stated content; for example `MeasureTheory.taylor_charFun_two` (`Mathlib/MeasureTheory/Measure/CharacteristicFunction/TaylorExpansion.lean`, line 150), `MeasureTheory.Measure.eq_withDensity_charFunDensity` (`TauCeti/Analysis/Bochner/CharFun/Inversion.lean`, line 184), `TauCeti.Probability.iIndepFun.hasLaw_sum_bernoulli` (`TauCeti/Probability/Distributions/Binomial/Basic.lean`, line 132).
- Cross-roadmap references resolved: MarkovChainsAndRenewal Layer 5 (main), MathematicalStatisticsAsymptotic §1.2 (main), MathematicalStatisticsHigherOrderAndResampling §3.1, §4.3, §4.6 (open head); each says what the README says of it. None is a supplier.
- Dependency check output: `depcheck: 196 roadmaps, 2156 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: all passed on this head. Elaboration of `TauCetiRoadmap/LocalLimitTheorems/Suggested.lean`: four `sorry` warnings, nothing else.
- Signatures: the elaborated type of each of the 5 declarations was compared with its README statement; all agree, no binder lost.
- One-tactic probe on copies of the file (`simp`, `rfl`, `infer_instance`, `simp [HasMaximalSpanOne]`, `aesop`): none closes any of the four theorems. No padding; all four README headlines are stated.
- No change outside the roadmap folder; no pinned-library or other-roadmap declaration already states any of the four theorems (searched Mathlib and Tau Ceti for local limit theorems, and the open and merged roadmaps for the same objects).

Overlap check: read MathematicalStatisticsHigherOrderAndResampling, SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, MarkovChainsAndRenewal, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric; nothing shared as a target. Lattice laws on `ℝ` and their characterisation by the characteristic function: owner MathematicalStatisticsHigherOrderAndResampling §3.1 (here only the integer span-one predicate, and the characterisation as a proof step). The local Edgeworth expansion of densities under a fourth moment: owner the same roadmap, §4.6 (a different theorem from 3.2). SeriesOfIndependentRandomVariables excludes local limit theorems from its scope.

Source independence: 11 passages compared with 2 sources, none shared; largest share DurrettPTE5, 7 of 9 locators; contents compared with DurrettPTE5 (Chapter 3: §3.1 de Moivre–Laplace, §3.3 characteristic functions, §3.5 local limit theorems): independent — Layer 1 draws on §3.5, Layer 2 on §3.1 in the opposite order, Layer 3 is not in that chapter.

Research link: Bobkov–Marsiglietti (2018) take Gnedenko's uniform local limit theorem and the smoothing condition (3.1, 3.2 here) as the starting point for the Rényi-entropy central limit theorem (BobkovMarsiglietti2018 lines 62–70, 146–172); local Edgeworth expansions refine 3.2 (README scope). Rests on the source read and the README.

## Not verifiable

- The attribution years for Gnedenko's two theorems and the Gnedenko–Kolmogorov book (cited in prose without a locator): no text read.

## Source issues

- none

## For the human reviewers

- **Licence.** DurrettPTE5 was read from the author's page at Duke University (version of 11 January 2019); its title page says "Copyright 2019, All rights reserved". The host was not in a known licence class and was recorded as an author page.
- **Not tested.** MathematicalStatisticsHigherOrderAndResampling, SeriesOfIndependentRandomVariables and MartingaleCentralLimitTheorem were read at their open heads through the roadmap index, not from checked-out files; ownership against other open pull requests was checked by searching the index for the objects.
