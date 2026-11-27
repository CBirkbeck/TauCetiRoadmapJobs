# Review of DeterminantalPointProcesses (pull request #3230 at 1dcedf1)

**Verdict:** needs changes

**Summary.** Changes are needed: four findings, all in the text around correct theorems rather than in the main results. The canonical-version theorem of 3.2 lacks measurability of the kernel and cannot be proved as stated; 3.3 names a carrier on which the Mercer expansion can fail; one Check of 3.1 and one sentence of 2.3 assert false mathematics. Each has a one-line repair. There are eight small corrections and four format notes, none blocking. The Hough–Krishnapur–Peres–Virág locators could not be read, and two licence and source facts are left to the human reviewers.

## R01 (P2) — The canonical-version theorem of 3.2 does not assume the kernel measurable, and without that it cannot be proved

An implementer is given a target that no proof can reach. In 3.2 (README line 394, `exists_ae_eq_spectralForm` at `Suggested.lean` line 574) the only hypotheses on `K` are that a positive operator `T` of finite nuclear gauge has integral kernel `K`; `HasIntegralKernel` constrains each section `K(x, ·)` for a.e. `x`, never `K` jointly.

Take `S = W = [0, 1]` with Lebesgue measure and, under the continuum hypothesis, a well-ordering `≺` of `[0, 1]` of type `ω₁`. Let `K(x, y) = 1` when `y ≺ x` and `0` otherwise. Every section `K(x, ·)` vanishes off a countable set, so `T = 0` has integral kernel `K`, is positive and has nuclear gauge `0`. If a measurable `K'` agreed with `K` almost everywhere on the square, then for a.e. `x` one would have `K'(x, ·) = 0` a.e., and for a.e. `y` one would have `K'(·, y) = 1` a.e. (the set `{x : y ≺ x}` is co-countable); integrating the indicator of `{K' = 1}` in the two orders gives `0` and `1`, against Tonelli. So the conclusion fails in a model of the axioms.

Add `Measurable (uncurry K)` to the Lean statement and "measurable" to the README sentence. With it the statement is true: `K` then agrees a.e. with the Hilbert–Schmidt kernel of `T`. The other statements of Layers 3 to 5 already assume measurability or do not need it.

## R02 (P2) — In 3.3 the carrier of a continuous kernel is `W ∩ supp(μ|W)`, not `W ∩ supp μ`

Line 433 says a continuous positive semidefinite kernel "is a spectral kernel, with carrier W ∩ supp μ". An implementer who builds the spectral form on that carrier will fail, since Mercer's theorem gives the expansion on the support of the restricted measure only (RandomMatrices 8.3 states it "on the compact support of `μ|_W`").

On `ℝ` with Lebesgue measure take `W = {0} ∪ [1, 2]` and `K(x, y) = max(0, 1 − |x − y|)`. Here `W ∩ supp μ = W`. A spectral form with carrier `W` would need `∑ λₖ φₖ(0) conj φₖ(y) = K(0, y) = 0` for every `y ∈ [1, 2]`; the series also converges in `L²([1, 2])`, with coefficients `λₖ φₖ(0)` against the orthonormal `φₖ`, so every `λₖ φₖ(0)` is `0` and `∑ λₖ |φₖ(0)|² = 0`, while `K(0, 0) = 1`. The carrier `W ∩ supp(μ|W) = [1, 2]` works and has full measure in `W`, so the statement that the kernel is spectral is unaffected. Replace `supp μ` by the support of `μ` restricted to `W`.

## R03 (P2) — The Check on the integrability clause in 3.1 is false: without the clause the zero operator still does not have the kernel `1/|x − y|`

Lines 379–382 claim that without the clause the junk value of the Bochner integral "would let the operator 0 have this kernel". The Check is meant to show what the clause excludes, and it names something that the clause does not exclude.

Take `f` the indicator of `[0, 1/2]` and `x ∈ (1/2, 1]`. Then `y ↦ f(y)/|x − y|` is integrable and its integral is `log(x/(x − 1/2)) > 0`, so the clause-free condition already fails for `T = 0` on a set of positive measure. What the divergence at `f = 1` shows is weaker: for that `f` the equation reads `(Tf)(x) = 0` at every `x`, a constraint produced by the junk value. Replace the last sentence by that observation, or choose an example for which the claim holds.

## R04 (P2) — A gauged kernel is Hermitian whenever `|h|` is constant, not only when `|h| = 1`

Line 278 says "The gauged kernel is Hermitian only when |h| = 1." For `h ≡ 2` the gauged kernel `2 · K(x, y) · (1/2)` is `K` itself, Hermitian whenever `K` is. For Hermitian `K` the gauged kernel is Hermitian exactly when `|h(x)| = |h(y)|` at every pair with `K(x, y) ≠ 0`. State that condition, or "for instance when `|h|` is constant".

## C01 — `IsPSDKernel` is a second name for the library's `Matrix.PosSemidef K`, and Tau Ceti's Bochner theorem is not among the suppliers

At the pin `Matrix.PosSemidef` is defined for an arbitrary index type through finitely supported vectors (Mathlib, `LinearAlgebra/Matrix/PosDef.lean` line 62), and Tau Ceti states kernels that way: `TauCeti.bochner_posSemidef` (`Analysis/Bochner/BochnerTheorem.lean` line 262) has the hypothesis `Matrix.PosSemidef fun a b => F (a - b)`, which is the positivity of `stationaryKernel` in 7.2. On a copy of the file, `fun _ x => hK.submatrix x` proves `Matrix.PosSemidef K → IsPSDKernel K`; the converse is an enumeration of a finite support.

Would you state the hypotheses on `Matrix.PosSemidef K`, or keep `IsPSDKernel` with one clause saying it is that notion? Either way 7.2, whose route uses "Bochner's easy direction", could name `TauCeti.bochner_posSemidef` in its *Needs* line and in the supplier contracts.

## C02 — `IsPoissonRandomMeasure`, `IsIntegerValued` and `expNeg` are attributed to Tau Ceti modules that the pinned Tau Ceti does not contain

The Conventions (line 92), the supplier contracts (lines 804–815) and three docstrings of `Suggested.lean` (lines 70–95) call these "Tau Ceti's" and name `TauCeti.Probability.PointProcess.Poisson.Basic`, `TauCeti.MeasureTheory.Measure.IntegerValued.Basic` and `TauCeti.Analysis.SpecialFunctions.Exp.Negative`. At the pinned commit 2fd255d there is no `Probability/PointProcess` directory and no declaration of either of the first two names; the only `expNeg` is a private one in `Probability/Moments/LaplaceDeterminacy.lean` with another type. A reader who opens the pin finds nothing. Since the definitions are copied with their bodies, nothing depends on it: attribute them to SpatialPointProcessFoundations §§1.1, 5.1 and 6.2, or say which Tau Ceti commit has them.

## C03 — Four locators into Baccelli–Błaszczyszyn–Karray point at the wrong item

Read against the HAL text (hal-02460214v2):

- 4.3 (line 530) cites "(5.2.13) in the proof of Theorem 5.2.5, p. 239". Equation (5.2.13) is in the statement of Theorem 5.2.16(iii), p. 247, and the window form is Theorem 5.2.17(ii), p. 248. It gives the Janossy density as the Bernoulli mixture of squared determinants, not as `det(I − K_W) det K̃`; the README's route supplies that step, so say so.
- 2.4 (line 345) cites Corollary 5.1.19(i) for the void series; the void probability is item (iii), item (i) being the generating function.
- 2.3 (line 280): Definition 5.1.8 is on p. 230; Proposition 5.1.11 is on p. 231.
- 5.1, global form (line 565): Corollary 5.2.18 is existence for continuous kernels and does not compare the window condition with `0 ≤ T ≤ I`; the local-to-global step in that text is Lemma 5.2.12(ii), p. 245.

## C04 — SpatialPointPatternStatistics is named as a roadmap but exists neither on main nor among the open pull requests

Lines 737, 794 and 869 say it "takes the pair correlation of 2.2 and the Gaussian model of 7.3". No roadmap of that name is on main or open, so the reader cannot follow the pointer. Describe it in prose as a planned roadmap of the family, without the name in the present tense.

## C05 — Two conjuncts in `Suggested.lean` close by `simp` and ask an implementer for nothing

On a copy of the file, the second conjunct of `intensity_stationary` (the formula for `pairCorrelation (stationaryKernel C₀)`) closes by `simp [pairCorrelation, stationaryKernel, sq]`, and the first conjunct of `exists_isDeterminantal_of_spectralDensity` (the inverse transform at `0` equals `∫ φ`) by `simp [Real.fourierInv_eq, integral_complex_ofReal]`. If they are sanity checks on the definitions, mark them so in the docstrings; otherwise they can move to the README as Checks.

## C06 — The first sentence of 3.3 is statable with the file's own definitions, and the module docstring does not say why it is absent

"A continuous positive semidefinite Hermitian kernel, with μ finite on compact sets, is a spectral kernel" needs only `Continuous (uncurry K)`, the positivity predicate, `IsFiniteMeasureOnCompacts μ` and `IsSpectralKernel K μ`, all present. It is the step by which 7.2 and the bridge to RandomMatrices 8.3 reach Layer 5. The docstring lists "the continuous-kernel bridge" as not stated without a reason. Would you state it, or give the reason?

## C07 — The gauge kernel in the first Check of 7.1 is the kernel of no process

`exp(−(x − y)²)` on `ℝ` is the Gaussian model with `ρ = 1`, `α = 1`, and by 7.3 that model exists only for `ρ ≤ 1/√π = 0.5642`. The criterion of 7.1 is about a determinantal process with the kernel, so the Check illustrates it on a kernel to which it does not apply. Multiplying the kernel by `1/2` keeps the point (the values become `0.136984` and `0.229187`, the `3 × 3` determinants are divided by `8`).

## C08 — The README cites Lavancier–Møller–Rubak by numbers that the public preprint does not carry

In arXiv:1205.4818v5 the results are Theorems 2.3, 2.6, 2.8, Proposition 3.1 and Corollary 3.3, the intensity is (2.3), the count law (2.9) and the power exponential density (3.22); the README cites Theorems 1, 2, 4, Proposition 1, Corollary 1, (2.2), (2.10), (3.7) and Table 2 with journal pages. The mathematics of each was found in the preprint. If the journal numbering is what was read, a version note in the References ("numbering of the journal version; the preprint numbers by section") would let a reader without access find the statements.

## N01 — TeX-style sub- and superscripts outside code spans

About fifty places write `^{…}` or `_{…}` in running text (for example `N(Bⱼ)^{(nⱼ)}` and `B_{c(i)}` at lines 105–106, `E 2^{N(W)}` at line 357). Put them in code spans or in Unicode.

## N02 — Checks on "a random matrix" cannot be recomputed

The Checks of 1.1, 1.2, 1.3, 1.4, 2.1, 2.3, 4.2, 4.3, 5.1 and 6.1 report values (0.4469, 0.004182, 0.04425, 23.79040296, …) for unspecified random matrices. Giving one explicit small matrix per Check would let a reader verify them; the `2 × 2` example of 1.1 already does this.

## N03 — The void-series bullet of 2.4 does not repeat its hypotheses

`void_probability_eq_tsum` assumes an a.e. positive semidefinite kernel with locally integrable diagonal; the README bullet (line 345) says only "On a bounded window W".

## N04 — Form of `Suggested.lean`

The header `## Supplier declarations consumed` has only `#check` lines under it, and the file opens with `module`, `public import` and `@[expose] public section` where the roadmaps on main use plain `import Mathlib`.

## Questions for the author

- Do the equation numbers (2.2), (2.3), (2.10), (3.1), (3.3), (3.7) and "Table 2, p. 863" match the journal version of Lavancier–Møller–Rubak? Only the preprint could be read, and its numbers differ (C08).
- The Hough–Krishnapur–Peres–Virág locators could not be checked (no legal copy was reachable). Is "observation (4), pp. 48–49" of §4.2 the source's own label for the change of measure and gauge remarks?

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Hadamard `det_kernelMatrix_mem_Icc` | n = 0; `[[2,1+i],[1−i,3]]`; `[[1,2],[2,1]]` | n = 0: 1 ≤ 1; det 6 − 2 = 4 ≤ 6; non-PSD det −3 | holds | none |
| 1.2 weights, pair correlation | f = 0; x = y; sine kernel r = 1/2 | D K D gives ∏f · det; g(x,x) = 0; 1 − (2/π)² = 0.594715 | holds | none |
| 1.3 Schur `det_kernelMatrix_cons`, reduced kernel | K(u,u) = 0; rank one | division by 0 returns K, PSD forces K(x,u) = 0; rank one gives K^u = 0 | holds | none |
| 1.4 Cauchy–Binet | n = 0; r < n; non-injective f | 1 = 1; both sides 0; repeated column gives 0, each subset counted n! | holds | none |
| 2.1 `IsDeterminantal`, product-density form | n = 0; K = 0; one point with K = 2 | P(univ) = 1; N = 0 a.s.; E N(N−1) = 0 with E N = 2, impossible | holds | none |
| 2.2 intensity, simplicity | atom of μ; no local integrability | diagonal determinant 0 at atoms; intensity extends from windows by continuity from below | holds | none |
| 2.3 change of measure, congruence, restriction | f = 1/2; f = 0 on a set; `1{x=y}` against 0 | 2⁻ⁿ det K against (μ/2)ⁿ; both sides null where ∏f = 0; diagonal hypothesis needed | holds | R04 on the gauge sentence |
| 2.4 Poisson iff, domination, tails, void series | μ(W) = 1; λ = (0.9, 0.5, 0.2) | ∑(−1)ⁿ/n! = e⁻¹; E 2^N = 1.9·1.5·1.2 = 3.42 ≤ e^1.6 = 4.953 | holds | N03 |
| 3.1 `existsUnique_hasIntegralKernel` and its Checks | f = 1 on [0,1/2], x > 1/2 for 1/|x−y| | integral log(x/(x−1/2)) > 0, so T = 0 fails without the clause | theorem holds; Check false | R03 |
| 3.2 `exists_ae_eq_spectralForm` | K = indicator of y ≺ x under CH, T = 0 | iterated integrals of {K' = 1} are 0 and 1 | not provable as stated | R01 |
| 3.2 `SpectralForm.integralOperator`, `IsSpectralKernel.isAEPSDKernel` | μ(W) = 0; `1{x=y}` on [0,1] | all λ = 0, spectrum empty; trace 0 against ∫K(x,x) = 1 | holds | none |
| 3.3 continuous kernels | W = {0} ∪ [1,2], K = (1 − |x−y|)₊ | ∑λₖ|φₖ(0)|² = 0 against K(0,0) = 1 | carrier wrong, theorem holds | R02 |
| 4.1 projection processes | J = ∅; n = 1 | K = 0, empty process; Var N = n − ∑|⟨φⱼ,φₖ⟩|² = 0 | holds | none |
| 4.2 mixture, `count_determinantal` | λ = (0.9, 0.5, 0.2); some λ > 1; z = 0 | law (0.04, 0.41, 0.46, 0.09), mean 1.6, variance 0.5; product vanishes at 1 − 1/λ; 0⁰ = 1 | holds | none |
| 4.3 Janossy densities | normalization; mixture identity | ∏(1−λ) eₙ(λ/(1−λ)) = P(N = n); ∑_J ∏λ̃ |det φ_J|² = det K̃ by 1.4 | holds | C03 locator |
| 5.1 Macchi–Soshnikov, operator form | empty S; one point K = 2; rank one λ > 1 | all λ = 0, both sides true; eigenvalue 2, no process; void 1 − λ < 0 | holds | C03 locator |
| 6.1 reduced Palm kernel | Poisson; rank-one projection | K^u differs from `1{x=y}` only at (u,u); K^u = 0 | holds | none |
| 7.1 stationarity | gauge kernel at (0.1, −0.8), shift 0.37 | 0.615854·0.444858 = 0.273967; 1.030382·0.444858 = 0.458374 | holds | C05, C07 |
| 7.2 spectral condition | d = 0; unbounded φ | constant c, exists iff c ≤ 1; Fatou gives a window eigenvalue above 1 | holds | C05 |
| 7.3 models | Gaussian α = 0.7; Matérn d = 1, ν = 1.5; Cauchy; power exponential | 1.240718; ρ_max α = 0.25; 1.099557, 2.199115, 1.026254; 2.857143, 2.532077, 2.623340; ∫φ = ρ | holds | none |

- Source locators checked against the text: 23 into BBK (hal-02460214v2), 19 correct, 4 in C03; 10 results of LMR found in arXiv:1205.4818v5 under the preprint's numbers.
- Library declarations opened at the pins: `Matrix.PosSemidef` (Mathlib `LinearAlgebra/Matrix/PosDef.lean`:62), `Matrix.det_gram_le_prod_norm_sq` (Tau Ceti `Analysis/InnerProductSpace/Gram/Hadamard.lean`:115), `Matrix.det_mul_eq_sum_prod_mul_det_submatrix` (`LinearAlgebra/Matrix/Divisibility.lean`:183), `ContinuousLinearMap.nuclearENorm` (`Analysis/OperatorIdeal/Nuclear/Basic.lean`:53), `TauCeti.bochner_posSemidef` (`Analysis/Bochner/BochnerTheorem.lean`:262), `NullSingletonClass`, and the eleven `#check` lines.
- Cross-roadmap citations resolved: SpatialPointProcessFoundations §§1.1–1.3, 2.1, 3.2, 4.1–4.3, 5.1, 5.3, 6.2–6.3, 7.1 and SecondOrderRandomFields §4.1 at their open heads; RandomMatrices 8.3, OperatorIdeals OI-B29, OI-B30, OI-B32, OI-C14 and AnalyticNumberTheoryPartI §2.1a on main. All 31 local copies in `Suggested.lean` agree with the suppliers' declarations character for character.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line. The two family suppliers are new roadmaps in open pull requests and are named in the description.
- Elaboration: `lake env lean` on `Suggested.lean` gives 40 `sorry` warnings and no error. `#check @name` types compared with the README: every theorem keeps its Polish, locally compact and Borel binders; only definitions drop unused ones. No `set_option`, no sorry'd data.
- One-tactic probes on a copy: no sorried theorem closes whole; two conjuncts do (C05).
- Description against the head: 45 bold headlines, 40 with a Lean name, 40 `sorry`, the pins 1b1ccf4 and 2fd255d, and the supplier list all agree with the head.
- Overlap check: read SpatialPointProcessFoundations, FiniteGibbsPointProcesses, PointProcesses, SecondOrderRandomFields, ShotNoiseAndCampbellTheorem, RandomMatrices; the configuration space, moment measures, Palm kernels and Poisson property are owned by SpatialPointProcessFoundations and copied here; Mercer's theorem, accepted kernels and joint count laws by RandomMatrices 8.3; the Matérn family by SecondOrderRandomFields; PointProcesses lists determinantal processes as outside its scope; nothing else shared.

Source independence: 14 passages compared with 2 sources (BBK, LMR preprint), none shared beyond formulas and standard names; largest share BBK, 23 of about 60 locators; contents compared with BBK Chapter 5: independent (Layer 1 has no counterpart, Layers 3–5 split and reorder its §5.2, its §§5.3, 5.4, 5.7 are absent); HKPV not read.

Research link: the headline targets are the existence theorem of Macchi (1975) and Soshnikov (2000), the Palm kernel of Shirai–Takahashi (2003), the Bernoulli-mixture theorem of Hough–Krishnapur–Peres–Virág (2009) and the stationary models of Lavancier–Møller–Rubak (2015), used in spatial statistics; README References and the LMR preprint.

## Not verifiable

- Hough–Krishnapur–Peres–Virág 2009: every locator (Definition 4.2.1, Lemma 4.2.2, Assumption 4.2.3, Remarks 4.2.4–4.2.5, Lemma 4.2.6, Lemma 4.4.1, Lemma 4.5.1, Exercise 4.5.2, Theorems 4.5.3, 4.5.5, 4.6.1, the displayed equations and pages). The sources service found no legal copy: one author-page address returned 404 and two were refused as not naming an author. Lemma 4.2.6, Lemma 4.4.1, Lemma 4.5.1, Theorems 4.5.3 and 4.5.5 are cited under the same numbers by BBK and LMR for the same statements.
- Lavancier–Møller–Rubak 2015, journal version: its theorem and equation numbers and its pages; only arXiv:1205.4818v5 was read.
- Anderson–Guionnet–Zeitouni Lemma 4.2.13 and Theorem 4.2.25: read only as RandomMatrices 8.3 cites them.

Automatic checks set aside as false positives: the five hits for a name the project no longer uses are the directory `PointProcesses/` inside file paths of the external lean-MSSS repository (README lines 874–894), not a citation of a roadmap.

## Source issues

- **Misprint** in BBK at Lemma 5.1.3, proof, p. 228: the source says the product of retention probabilities runs to index n while the tuple has k points; it should be a product over the k points; affects nothing.
- **Gap** in BBK at Example 5.6.12, p. 282: the source says the bound of the Fourier transform by its value at 0 holds for shape η in [1/2, d/2); it should be every η > 0, since the covariance is nonnegative and integrable; affects a stated result.

## For the human reviewers

- **Licence.** The README (lines 871–894) says parts were first formalised in the author's repository lean-MSSS at commit 6826ba2, and `pairCorrelation_determinantal` shares its name; that repository and its licence were not read.
- **Licence.** The source with the largest share of locators, BBK, is a book manuscript on HAL (hal-02460214v2, 2024), not a published volume; the same results are cited from an AMS book and a journal article.
- **Not tested.** Hough–Krishnapur–Peres–Virág (about 20 of 60 locators) could not be read, so its wording and contents were not compared; Lavancier–Møller–Rubak was compared in its preprint only.
