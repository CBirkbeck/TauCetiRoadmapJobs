# Review of MathematicalStatisticsHigherOrderAndResampling (pull request #2504 at 8d88927)

**Verdict:** needs changes

**Summary.** Changes are needed: the coverage theorem for the subsampling interval in 7.2 is false under the stated hypothesis (a counterexample is given below), and the Kolmogorov distance of 1.1 is also built, with the same metric properties, by ArithmeticStatisticsPartVIII §5.14, an open roadmap earlier in the merge order, so the object has two owners. There are five small corrections and one format note, none blocking. Most cited books are behind paywalls, so only the Durrett locators were checked against the text; the rest of the review is by computation. Two points are left for the human reviewers.

## R01 (P1) — The coverage theorem for the subsampling interval is false when `J` is flat to the right of its `(1 - α)`-quantile and then jumps

The Coverage bullet of 7.2 (`README.md` line 1295) and `tendsto_measureReal_le_quantile_subsamplingLaw` (`Suggested.lean` line 830) assume only that `J` is continuous at its `(1 - α)`-quantile `c`. That does not make the subsampling quantile converge to `c`, and the coverage can tend to `1`.

Counterexample. Take `X` i.i.d. uniform on `[0, 1]`, `θ = 0`, `τₙ = n`, `b = ⌊n^{1/3}⌋`, `α ∈ (0, 1)`, `εₘ = 1/log (m + 2)`, `qₘ = 1 - α - εₘ` (for `m` large enough that `qₘ > 0`), and `θ̂ₘ(x) = hₘ(x₀)/m` with `hₘ(u) = u/qₘ - 1` for `u < qₘ` and `hₘ(u) = 1 + 1/m` otherwise. Then `τₙ (θ̂ₙ - θ) = hₙ(X₀)` has law `qₙ · U[-1, 0) + (1 - qₙ) · δ_{1 + 1/n}`, which converges at every continuity point to `J = (1 - α) · U[-1, 0] + α · δ₁`. The `(1 - α)`-quantile of `J` is `0`, where `J` is continuous; `b → ∞`, `b/n → 0`, `τ_b/τₙ = b/n → 0`, and each `θ̂ₘ` is measurable. The subsample values are `h_b(X_{ι(0)}) - (b/n) hₙ(X₀)`. The fraction of them below the largest value `A = 1 + 1/b - (b/n) hₙ(X₀)` is `W = ∑ᵢ wᵢ 1{Xᵢ < q_b}` with `wᵢ = P(ι(0) = i) ≤ b/n`, so `E W = 1 - α - ε_b` and `Var W ≤ b/n`, and `P(W ≥ 1 - α) ≤ (b/n)/ε_b² → 0`. On `{W < 1 - α}` the `(1 - α)`-quantile of the subsampling law (the infimum of `{x | 1 - α ≤ cdf L x}`, `TauCeti/Probability/Quantile.lean` line 164) is `A`, and `hₙ(X₀) ≤ A` in both cases (`hₙ(X₀) < 0 < A`, or `1 + 1/n ≤ 1 + 1/b - (b/n)(1 + 1/n)` for large `n`). So the probability in the conclusion tends to `1`, not to `1 - α`.

The proof route has the gap at the same place: "where `[c, c']` is the set where `J = 1 - α`, and `J(c - ε)` and `J(c' + ε)` tend to `1 - α`". When `J` jumps at `c'` that set is `[c, c')` and `J(c' + ε)` tends to `J(c') > 1 - α`. The smallest repair is one more hypothesis, in the README and in Lean: `1 - α < cdf J x` for every `x` greater than the quantile (the quantile is unique). With it the subsampling quantile lies in `(c - ε, c + ε]` with probability tending to `1` and the stated route goes through with `c' = c`. The example above would serve as the negative-control Check.

## R02 (P2) — The Kolmogorov distance has two owners: 1.1 here and §5.14 of ArithmeticStatisticsPartVIII

Section 1.1 defines `kolmogorovDist P Q = ⨆ t, |cdf P t - cdf Q t|` on Mathlib's `cdf` and lists as its facts that it lies in `[0, 1]`, is symmetric, satisfies the triangle inequality and vanishes iff `P = Q`. ArithmeticStatisticsPartVIII, in the open pull request that adds it (#1179), has under §5.14 the subsection "Kolmogorov distance" (`TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md` lines 357–365 at its head), which constructs the same supremum on Mathlib's `cdf` and proves the same list, and its scope says "the Kolmogorov distance built on them here is new" (line 1822). Two implementers would build the same definition and API in two places. Neither README mentions the other.

ArithmeticStatisticsPartVIII is earlier in the merge order, so the citation can only go from here to there: cite its §5.14 "Kolmogorov distance" for the definition and the four metric facts, keep the definition in `Suggested.lean` as a local copy with a docstring naming the owner (as is done for the Foundations and Asymptotic vocabulary), and keep as this roadmap's own what §5.14 does not have: the bound by `tvDist / 2`, the rational supremum and measurability, invariance under increasing homeomorphisms, the jump bound `a / 2` and Pólya's theorem. (Its "lower bound from an atom" is a different, one-sided statement and does not replace the jump bound.) If the author prefers this roadmap to be the owner, which is what MathematicalStatisticsFoundations 9.2 and MathematicalStatisticsNonparametric (README line 2937) anticipate, that has to be agreed with the other pull request, and the pull-request description here should then say so; the README cannot settle it alone.

## C01 — "No continuous expansion" in 4.3 is stated for one fixed law `G`, where it has content only for `G = N(0, 1)`

For a fixed law `G ≠ N(0, 1)` the distance `kolmogorovDist (law of Sₙ) G` tends to the positive number `kolmogorovDist N(0, 1) G`, so `√n` times it tends to infinity and the bound `h φ(0)/2 - ε` holds trivially. The statement therefore says something only at `G = N(0, 1)`, and it does not exclude an approximation that changes with `n`, such as `Φ + n^{-1/2} p₁ φ`, which is what the scope sentence "the failure of every continuous expansion for lattice means" promises. The proof route already gives the stronger form, since the jump bound of 1.1 uses only continuity at one point: for every sequence of continuous functions `Hₙ : ℝ → ℝ`, eventually `√n sup_x |P(Sₙ ≤ x) - Hₙ(x)| ≥ h φ(0)/2 - ε`. Stating that (README line 738, `Suggested.lean` line 410) would make the target match its title.

## C02 — Hypotheses that the statements do not use, in 5.2 and 9.1

In the saddlepoint theorem (`Suggested.lean` line 618) neither `P ≪ volume` nor `0 ∈ interior (integrableExpSet id P)` is used by the statement or by the proof route: the density of `X̄ₙ` and `K''(s) > 0` both come from the `L^ν` hypothesis on the tilted characteristic function, and the moments from `s` being interior.

In 9.1 the invariance identities hold for every `p`, `u`, `v`, `w` in `Fin m → ℝ`: the summand at `j` is `q j` times the summand at `block j` also when `p (block j) = 0`, where both are `0` by `x / 0 = 0`. So `hp`, `hu`, `hv`, `hw` in `fisherRao_congruentEmbedding` and `amariChentsov_congruentEmbedding` (lines 1066–1075) can go, or the README can say that they are kept only to match the geometric reading.

## C03 — Two declarations of 6.1 ask an implementer for nothing

`isMarkovKernel_bootstrapKernel` (line 656) closes on a scratch copy with `simp only [bootstrapKernel, hn, dite_false]; infer_instance`: it is the definition unfolded and a library instance. `condDistrib_snd_fst_bootstrap` (line 677) is Mathlib's `condDistrib_ae_eq_of_measure_eq_compProd` applied to `J = Pⁿ ⊗ₘ bootstrapKernel n m` with `X = Prod.fst`, `Y = Prod.snd`, after `J.map Prod.fst = Pⁿ`; it also takes the Markov property as an instance argument beside `hn`, so `hn` is unused. If they are kept as sanity checks of the definition, say so in their docstrings; otherwise they belong in the README as facts about `bootstrapKernel`, which already states them.

## C04 — The sentence on Mathlib's simplex in 9.1 overlooks `stdSimplex`

"Mathlib's `Convexity.StdSimplex` is a type of finitely supported weights, not a subset of `Fin m → ℝ`, so the open simplex is defined directly" (README line 1548). The pinned Mathlib also has the closed simplex as a subset, `stdSimplex ℝ (Fin m) : Set (Fin m → ℝ)` (`Mathlib/Analysis/Convex/StdSimplex.lean` line 40). The reason for a direct definition is that the open simplex is not there; the sentence would be right as "`openSimplex m` is the set of points of Mathlib's `stdSimplex ℝ (Fin m)` with all coordinates positive", and a reader then knows which library lemmas apply.

## C05 — Two notions of lattice law are in the project and 3.1 does not say how they differ

MarkovChainsAndRenewal, on main, defines lattice laws in its Layer 5 (README line 325) by support in `a ℕ` for some `a > 0`, without a translation. `IsLatticeLaw` of 3.1 allows a shift `a + h ℤ` on `ℝ` and counts point masses as lattice. Both are right for their use, but a reader who meets both needs one clause in the scope section: the renewal notion is the case of shift `0` on `[0, ∞)`, and a law that is lattice there is lattice here with the same maximal span when it is not a point mass.

## N01 — The last section of `Suggested.lean` is a list of 47 `#check` lines under a header with no declaration

The header "Supplier names cited in the README" (line 1116) heads only `#check` commands, and the supplier contracts of the README already name each of these declarations with its file. A few `#check` lines that pin the declarations the statements rely on would be enough.

## Questions for the author

- Does Politis–Romano–Wolf, Thm 2.2.1(iii), p. 43, print only "continuous at the `(1 - α)`-quantile"? If so the source shares the gap of R01 and the README should say that its hypothesis is stronger than the printed one. The book is behind a paywall and I could not read it.
- The Durrett page numbers (pp. 113, 136–138, 140) are those of the printed Cambridge edition; in the author's online copy of the fifth edition the same items are on pp. 131, 157–159 and 162. The theorem, lemma and example numbers agree. Is the printed pagination what the README intends? I could not open the printed edition.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Kolmogorov distance, Pólya | `N(0,1)` vs `N(0,4)`; `δ₀` vs `N(0,1)`; `δ_{1/n}` vs `δ₀`; `l = ⊥` | `Φ(c) - Φ(c/2) = 0.16134`, `c² = (8/3) log 2`; `1/2`; `1`; both sides true | true | R02 (ownership) |
| 1.1 bound by `tvDist / 2` | Mathlib `tvDist` at the pin | variation of `μ - ν` on `univ`, values in `[0, 2]` (`TotalVariation/Defs.lean` lines 20–62) | consistent | none |
| 1.2 bounded Lipschitz distance | `δ₀`, `δ_a`; clamp function | `f(a) - f(0) = 2 min(a/2, 1) = min(a, 2)`; upper bound `min(a, 2)` | true | none |
| 1.3 Kolmogorov form | `N(1/n, 1)`; typewriter; set of outer measure 1 | `Φ(1/2n) - Φ(-1/2n)`; BL distance `= Zₙ`; `μ*(A) = 1`, `A` in no null set | true | none |
| 2.1 Pólya density, transforms | `k = 3`, `t = 1`; `1_{[0,1]}` at `π`; tail | `i³e^{-1/2} = -0.6065i`; `2i/π`; `2∫_a^∞ 2/(πLx²) = 4/(πLa)` | true; Durrett Ex. 3.3.15 read | none |
| 2.2 smoothing inequality | `P = δ₀`, `g = φ`, `x = 0`, `T = 1, 5`; signed `g` in Durrett's Lemma 3.4.18 | left `0.5`; right `3.18897`, `1.59724`; proof uses only `|G(x+s) - G(x)| ≤ m|s|`, `F` monotone | true; Durrett pp. 157–159 (online copy) read | none |
| 2.3 Berry–Esseen, sharpness | Rademacher `n = 100`; `k = 0`; limit | bound `0.275`; `P(S₁₀₀ = 0) = 0.0795892`; `1/2 ≤ 1/2`; `√(2k)/(2√(πk)) = 1/√(2π)` | true; Durrett Thm 3.4.17 read (constant 3) | none |
| 3.1 lattice laws | Rademacher; `(δ₀ + δ_{√2})/2` at `t = π√2`; point mass | `|cos t| = 1` on `πℤ`; `(1 + e^{2πi})/2 = 1`; `‖φ‖ ≡ 1` | true; Durrett Thm 3.5.2 read | C05 |
| 3.2 Cramér's condition | uniform; `(δ₀ + N(0,1))/2`; zero space; three-point law | `≤ 2/|t|`; `(1 + e^{-t²/2})/2 > 1/2`; vacuous with `R = 1`; `(2 + e^{2πiq√2})/3 → 1` | true | none |
| 4.1 cumulants and polynomials | exponential; Rademacher; `-X` | `p₂ = -x⁵/18 + 11x³/36 - x/12`; `p₂ = He₃/12`; `p̃_r(-x) = -p_r(x)`; `r₃` recomputed | true | none |
| 4.2 one-term expansion (sampled) | centred exponential, `n = 10, 10², 10³` | `√n · err = 0.02522, 0.00678, 0.00205`; `√n sup|Fₙ - Φ| = 0.13298`; `sup|(x²-1)φ| = φ(0)` | consistent | none |
| 4.3 lattice expansion | Rademacher; Bernoulli `0.3`; `x = 0`, `n` even | `√n · err = 0.0125, 0.0062, 0.0031, 0.0015`; `0.0235 … 0.0029`; jump term `1/√(2πn)` both sides | consistent | C01 |
| 4.4 expansions of every order | exponential, two terms; `a > 1` class; `d = 0` | `n^{3/2} err = 0.0787, 0.0607, 0.0561`; `c ε^a ≤ max(c,1) ε`; empty determinant `1` | consistent | none |
| 4.5 smooth functions, `t` statistic | mean with `A = (x - m)/σ`; `n = 40` exponential | `A₁ = 0`, `A₂ = γ`, `p₁ = -γ(x²-1)/6`; `0.021029` vs `0.021026` | consistent | none |
| 4.6 local expansion | exponential, `ν = 2` | `n · err = 0.1619, 0.1148, 0.1048` | consistent | none |
| 4.7 Cornish–Fisher (sampled) | exponential, `n = 100, 1000`, `α = 0.05, 0.5, 0.95` | `0.0193, 0.0002, -0.0199`; `0.0062, 0.00002, -0.0062` | consistent | none |
| 5.1 tilting identity | `n = 0`; density ratio | both sides `δ₀`; `dPⁿ/dP_sⁿ = e^{n(K(s) - s x̄)}` | true | none |
| 5.2 saddlepoint density (sampled) | exponential `n = 1, 2, 10, 100`; `N(m, 1)` | `0.92214, 0.95950, 0.99170, 0.99917`; exponent `-(x-m)²/2`, exact | true | C02 |
| 6.1 resampling kernel (sampled) | `x = (0, 1)`; `m = 0`; non-measurable `R` | max `= 1` w.p. `3/4`; one index map; finite support gives a.e.-measurability | true | C03 |
| 6.2 bootstrap of the mean (sampled) | `x = (0, 1, 2)` | mass `7/27` at `0`, `1/27` at `±√3`, variance `2/3` | consistent | none |
| 6.3 bootstrap Donsker | `n = 2`, `a < b`; quantile transform | values `∓1/√2, 0`, variance `1/4 = F̂(1 - F̂)`; `1{Q̂(u) ≤ t} = 1{u ≤ F̂(t)}` | consistent | none |
| 6.4 delta method, failure | union of axes; `x²` at `0`; composition measurability | `1{X₀ ≠ Y₀}`, limit `(δ₀ + δ₁)/2 ≠ δ₀`; `Var M_z = σ⁴(2 + 4z²)`; finitely supported image | consistent | none |
| 6.5 sample maximum (sampled) | `n = 1, 2, 10, 100`; `(1, 1)`; `b n = 0`; Weibull route | `1, 0.75, 0.65132, 0.63397`; probability `1`; atom `1`; `F̂^m → e^{-(x/c)^δ}` | true | none |
| 7.1 jackknife | `x = (0, 1, 2)`, `g = id`, `g = t²` | `1/3`; `49/36` vs `4/3`; wrong factor gives `1/4` | true | none |
| 7.2 subsampling coverage | `J = (1-α)U[-1,0] + αδ₁`, `θ̂ₘ = hₘ(x₀)/m`, `b = n^{1/3}` | hypotheses hold; `P(W ≥ 1-α) ≤ (b/n)/ε_b² → 0`; coverage `→ 1` | false | R01 |
| 7.2 consistency, maximum | `τ ≡ 0`; negative `τ`; reflection | excluded by continuity of `J`; route unchanged; `1 - G(-x)` continuous | true | none |
| 7.3 empirical likelihood | `x = (0, 2)`, `m = 1/2, 0, 3` | `R = 3/4`, `-2 log R = 0.57536`; `R = 0`; `sSup ∅ = 0` | true | none |
| 8.2, 8.3 bootstrap expansion, accuracy (sampled) | existential `p̂`, `q̂` for `r > j`; difference of expansions | free choice `p̂ = p`; `n^{-1/2}(q̂₁ - q₁)φ = O_P(n⁻¹)` | consistent | none |
| 8.4 coverage | mean, `α = 0.05`, `γ = 2`, `n = 25`; percentile derivation | `0.11020γ`, `0.08088γ`; `-0.044`, `-0.032`; `1 - α - n^{-1/2}(p₁ + q₁)(zₐ)φ(zₐ)` rederived | consistent | none |
| 9.1 invariance | embedding `(0,1,1)`, `q = (1, ½, ½)`; `p` with a zero coordinate | `4 = 4`; `128/9 = 128/9`; variant `8/3 ≠ 10/3`; both sides `0` | true | C02, C04 |
| 9.2 Čencov, bilinear | `m = 2`; `m ≥ 3`; rational points | forms on a line: dimension 1; standard representation irreducible; `N = ∑kᵢ ≥ 2` | consistent | none |
| 9.3 trilinear (sampled) | `m = 2`; `m = 3, 4` | sign cubed is sign: `0` invariants; multiplicity of `V` in `V ⊗ V` is `1` | consistent | none |

- Source locators checked against the text: 6, all in Durrett (Example 3.3.15, Lemmas 3.4.18 and 3.4.19, Theorem 3.4.17 with its remarks, the inequality after Lemma 3.4.19, Theorem 3.5.2), read in the author's online copy; statements and numbers agree, pages differ (see the questions).
- Library declarations opened at the pin: `tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean` line 62), `MeasureTheory.Measure.quantile` (`TauCeti/Probability/Quantile.lean` line 164), `stdSimplex` (`Mathlib/Analysis/Convex/StdSimplex.lean` line 40), `condDistrib_ae_eq_of_measure_eq_compProd` and the 46 other names of the `#check` block, which all elaborate.
- Cross-roadmap citations resolved on main: MathematicalStatisticsFoundations 8.1–8.5, 9.1, 9.2 and MathematicalStatisticsAsymptotic 1.2, 1.3, 2.1–2.4, 3.4, 4.1, 4.2 exist and state what is consumed; the nine local copies in `Suggested.lean` agree with the owners' definitions.
- Dependency check: `depcheck: 211 roadmaps, 2260 edges, 0 problem(s)`; no change outside the roadmap folder.
- Elaboration of `Suggested.lean`: no error, 50 `sorry` warnings and no other; no `set_option`, no sorry'd data. The elaborated types were compared with the README statements; only `sample` drops a section binder (`[MeasurableSpace Ω]`), which it does not need.
- One-tactic probe on a scratch copy: `isMarkovKernel_bootstrapKernel` closes (C03); `polya_density_charFun_tail`, the nonlattice bound, `map_sampleMean_eq_tilted`, `bootstrapKernel_iSup_eq` and the two invariance theorems do not close with `simp`.
- Numerical Checks and examples of Layers 1, 2, 4, 5, 6, 7 and 8 recomputed independently (about fifty values): all agree to the printed digits; the `n = 10⁴` entries of the Layer 4 examples were not recomputed.
- The pull request's title and description agree with the head (nine layers, 50 admitted theorems, both suppliers on main).

Overlap check: read KernelsAndSpectralMethods, LargeDeviations, GaussianLinearModels, StatisticalLearningTheory (open), MathematicalStatisticsAsymptotic, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric (main); nothing shared with these (LargeDeviations tilts by bounded functionals for the large deviation principle, a different statement from 5.1; the three on main assign this material here). Found by object search outside the lists: the Kolmogorov distance, owner to be ArithmeticStatisticsPartVIII §5.14 (R02); lattice laws, a variant of MarkovChainsAndRenewal Layer 5 (C05).

Source independence: 6 passages compared with 1 source (Durrett), none shared beyond formulas; largest share Hall, 30 of 90 locators; Hall's text and table of contents could not be read, so the contents were not compared with it. Hall's locators occur only in 3.2, 4.1, 4.5, 4.7 and Layer 8, and Durrett's contents (read) do not map onto Layers 2–3.

Research link: The headlines are the theorems of Petrov (1975), Bhattacharya–Ranga Rao (1986), Hall (1992), Shao–Tu (1995), Politis–Romano–Wolf (1999), Owen (2001) and Čencov (1982) on Edgeworth expansions, the bootstrap, subsampling, empirical likelihood and invariant metrics, as the README's locators give them; rests on the README, and on Durrett (2019) for Berry–Esseen.

## Not verifiable

- Hall, *The Bootstrap and Edgeworth Expansion* (4.1, 4.5, 4.7, 3.2, 8.1–8.4): paywalled; the sources service found no legal copy.
- Bhattacharya–Ranga Rao (2.2, 2.3, 4.2, 4.4, 4.6, 5.2): publisher page refused access.
- Petrov (2.2, 2.3, 4.2–4.4), Shao–Tu (6.2, 6.4, 6.5, 7.1), van der Vaart (1.1, 6.2–6.5, Conventions), van der Vaart–Wellner (1.2), Severini (5.1, 5.2), Owen (7.3), Politis–Romano–Wolf (7.2), Čencov (9.1–9.3), Amari–Nagaoka (9.2): paywalled or no legal copy found.
- Of the sampled targets, 1.1, 1.2, 4.2, 4.7, 5.2, 6.2, 6.5, 8.2, 8.3 and 9.3 therefore have their locators unchecked; 1.3 and 6.1 carry no source locator of their own; their statements were checked by computation (table above).
- The printed page numbers of Durrett: only the author's online copy was read.
- Ownership against board packages not yet in a pull request was not checked beyond the two packages listed for this review (neither concerns statistics).

## Source issues

- **Error** in Dur19 at Lemma 3.4.19, p. 158 of the author's online copy of the fifth edition: the source says the two distribution functions have mean 0; it should be that their characteristic functions are differentiable at 0, since the smoothed laws have no mean; affects nothing; corrected in print at the preface of the same edition, which acknowledges the slip.

## For the human reviewers

- **Not tested.** Hall (1992) carries 30 of the 90 source locators and could not be read legally; the wording and arrangement checks were not made against it, nor against the other paywalled books.
- **Licence.** The README's "Prior formalization" section says Layers 1, 3–6, 8, 9 overlap `CKSD/Asymptotics/` of bjbraams/lean-CKSD (Apache 2.0, the author's project). I compared `InformationGeometry.lean` only: same mathematics, different names and binders (`fisherRaoMetric` over a `Fintype`).
