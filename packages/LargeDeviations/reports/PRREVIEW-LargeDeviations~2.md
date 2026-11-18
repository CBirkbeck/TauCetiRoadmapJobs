# Review of LargeDeviations (pull request #2499 at 34e511e)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons, both repaired by editing a sentence. Two Checks (the `δ₀` Check of Layer 1 and the Cauchy Check of Layer 4) give as the failing bound the one that holds; and the README states 2.1, 2.2, 2.4, 2.5, the inverse contraction of 3.1 and the Polish half of 1.5 for an arbitrary measurable structure, where 2.1 is false, while `Suggested.lean` rightly assumes that open sets are measurable. The three findings of the previous review are repaired, and no theorem of `Suggested.lean` was found false. There are three small corrections and two format notes, none blocking. Only Anderson–Guionnet–Zeitouni could be read, so the locators into the other five books are unverified; two points are left for the human reviewers.

## R01 (P2) — Two Checks name as the failing bound the one that holds

A reader who recomputes either Check finds the stated inequality true, and so cannot tell which half of the definition the Check is meant to test.

In the first Check of Layer 1 (README line 340): "it does not with rate `0` everywhere, since the closed set `{1}` has measure `0` and `-⨅_{1} I = 0 > ⊥`". The upper bound at `{1}` reads `⊥ ≤ 0`, which holds; with rate `0` every closed set obeys the upper bound, because `log μₙ(F) ≤ 0`. What fails is the lower bound: on the open set `(1/2, 3/2)` it reads `0 = -⨅ I ≤ liminf (n+1)⁻¹ log 0 = ⊥`.

In the Cauchy Check of Layer 4 (line 692): the transform of `cgf` is `⊤` off `0`, "a rate that fails the lower bound on `(0, 2)`". With `I = ⊤` on `(0, 2)` the lower bound reads `⊥ ≤ liminf`, which holds. What fails is the upper bound: the sample mean is standard Cauchy for every `n`, so the closed set `[1, 2]` has measure `(arctan 2 - arctan 1)/π ≈ 0.1024`, and `limsup (n+1)⁻¹ log 0.1024 = 0 > -⨅_{[1,2]} I = ⊥`.

The smallest change: in the first, "since the open set `(1/2, 3/2)` has measure `0` and the lower bound would read `0 ≤ ⊥`"; in the second, "a rate that fails the upper bound on the closed set `[1, 2]`".

## R02 (P2) — The README states 2.1 without the measurability of open sets, and it is false without it

The Conventions put a family on "a topological space `X` with a measurable structure" (line 104), and 2.1, 2.2, 2.3, 2.4, 2.5, the inverse contraction of 3.1 and the Polish half of 1.5 add nothing about that structure. `Suggested.lean` carries `[OpensMeasurableSpace X]` on each of them (lines 165, 188, 199, 204, 227, 232, 241, 269), so the prose is more general than the Lean, and an implementer reading the README alone has a false target in 2.1.

Take `X = ℝ` with the trivial σ-algebra, `μₙ` the Dirac measure at `0`, speed `n + 1`, `F j x = j x` for `j ∈ ℝ`. A lower integral is then the infimum of the integrand, so `∫⁻ exp ((n+1) j x) = 0` for `j ≠ 0`, and `Λ j = ⊥` for `j ≠ 0`, `Λ 0 = 0` are admissible bounds. For the compact `K = {0}` the outer measure is `1`, so the left side is `0`, while `sup_j (F j 0 - Λ j) = ⊤` and the right side is `⊥`. The same structure makes `f` non-measurable in 3.1, where the image measures are then `0` and satisfy the weak principle with rate `⊤`, which `μ` does not.

The smallest change is one sentence in the Conventions, under "Families and speeds": from Layer 2 on, and in the Polish half of 1.5, open sets of `X` are measurable. (4.1 already says so for `E`.)

## C01 — The proof route of 4.3 uses Chernoff's bound for laws that 4.2 excludes

"If the mean is `±∞` or undefined, the transform is monotone on all of `ℝ` … and one tail suffices" (line 655), with *Needs:* "4.2 (bound only)". The bound of 4.2 is stated for an integrable law and `x ≥ ∫ y dν`, so it does not apply to the laws of this case. What the case uses is the Markov step alone: for every law, every `x` and every `n`, `(n+1)⁻¹ log P(X̄ ≥ x) ≤ -sup_{λ ≥ 0} (λ x - Λ(λ))`, and the supremum over `λ ≥ 0` is the whole transform when `Λ = ⊤` on `(-∞, 0)`. Saying so in the route, or adding this form as a bullet of 4.2, would make the *Needs* line true.

## C02 — "At any speed" in the Checks of 3.2 holds only for speeds that are eventually positive

The first and third Checks of `ExponentiallyEquivalent` (lines 565 and 572) argue from `log 0 = ⊥`. The normalized value is `(a n)⁻¹ * ⊥`, which in `EReal` is `⊤` when `a n < 0` and `0` when `a n = 0`; the Conventions allow any `a : ℕ → ℝ`. "At any speed tending to `∞`" would be right.

## C03 — The description lists OptimalTransport among the suppliers consumed; the README consumes nothing from it

"Suppliers consumed: … OptimalTransport §13.13 (Schilder, Laplace-principle form): prose only; 2.3 is the bridge." In the README, OptimalTransport §13.13 appears under "Not owned here" and under "Downstream consumers", and the supplier contracts name RandomMatrices §9.1 alone. Text that would be right: move the line out of the supplier list, as "Downstream: OptimalTransport §13.13 states Schilder's theorem in Laplace-principle form; 2.3 converts it".

## N01 — 5.3 names the owner of essential smoothness only as "the convex-analysis roadmap"

A reader cannot follow that to a section. The open ConvexAnalysisAndDuality roadmap owns `IsEssentiallySmooth` and the equivalence with the steep form in its §4.3; naming it there (as the description does) would do, here and in the docstring of `IsEssentiallySmoothSteep`.

## N02 — `Suggested.lean` opens with `module`, `public import` lines and `@[expose] public section`

The roadmaps on main open with the plain line `import Mathlib` followed by the Tau Ceti modules (for example `TauCetiRoadmap/RandomMatrices/Suggested.lean`). The file elaborates either way.

## Earlier findings

- R01 of the previous review (convexity of `logMGF ν` without measurable open sets): repaired. `[OpensMeasurableSpace E]` is on the three statements of 4.1 (`Suggested.lean` lines 326, 335, 340) and 4.1 opens with "a measurable structure in which open sets are measurable".
- R02 (Borel property of the Giry σ-algebra): repaired. The target and its Lean theorem are gone; "From Tau Ceti" cites the two instances with their files, both modules are imported, and the instance search described there succeeds (run again on this head).
- R03 (two owners of essential smoothness): repaired. The predicate here is `IsEssentiallySmoothSteep`, 5.3 says how it differs and who owns the other form, and ConvexAnalysisAndDuality §4.3 at its head says the same from its side. See N01.
- C01–C05, N01, N02: all taken up (the compact-to-closed bullet of 1.5 with `IsExponentiallyTight.limsup_log_measure_le`; the open set `(x, ∞)` and the case `x = M` in 4.2; the exponent `M k + 1` in 1.5; goodness dropped from 2.4; the description; the link to lean-CKMA; "Layer 4 Examples").

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 local copies | text against RandomMatrices `Suggested.lean` line 396; AGZ D.1–D.3 | principle identical; tightness `∀ M ∃ K` equivalent to D.3(a) | sound |
| 1.1 Check, `δ₀` with rate `0` | `{1}`; `(1/2, 3/2)` | upper `⊥ ≤ 0` holds; lower `0 ≤ ⊥` fails | R01 |
| 1.1 attainment | `⨅_F I = ⊤`; non-Hausdorff `X` | every point minimises; `F ∩ {I ≤ c}` compact | sound |
| 1.2 normalization, continuity sets, decay | arbitrary `a`; `s = ∅`; `F = ∅` | `0 ≤ -⨅ I`; `⊥ → -⊤`; `limsup ≤ ⊥ < -1` | sound |
| 1.3 largest term | a term `0`, a term `⊤` | `max ≤ ∑ ≤ card · max`, `(a n)⁻¹ log card → 0` | sound |
| 1.4 uniqueness, balls | infinite measures; `K = ∅`; `I x = ⊤` | `inf_F I ≤ inf_U J ≤ J x`; `⊥ ≤ ⊥`; `B(y, δ/2) ⊆ B(x, δ)` gives `{I > c}` open | sound; AGZ D.5, D.6 |
| 1.5 compact to closed, weak plus tight, Polish | no measurability of `K_Mᶜ`; `T2` use; geometric sum | subadditivity of outer measure; `{I ≤ M} ⊆ K_{M'}`; `∑_k exp (-a M k)` gives `-M` | sound; AGZ D.4 |
| 2.1 Chebyshev | `J = ∅`; `K = ∅`; `Λ j = ⊥`; trivial σ-algebra | `⊤` trivial; `⊥ ≤ ⊥`; `⊥`; left `0`, right `⊥` without measurable opens | Lean sound; README R02 |
| 2.2 bounded, tail, moment | no goodness; `φ` unbounded below; no measurability | slabs `≤ sup (f - I) + ε`; `{φ ≤ -L}` gives `-L`; `-(γ-1) M + C` | sound; AGZ D.8 |
| 2.3 equivalence | closed `F`; `I x < ⊤` | `inf (k (d ∧ 1) + I) ↑ inf_F I` by compact sublevels; `-I x ≤ max (liminf, -k)` | sound |
| 2.4 tilting | fair coin, `F x = x`, `x = 0.4` | `0.620115`; `0.020136 - 0.4 + 0.620115 = 0.240250`; coin `e/(1+e)`: `0.240250` | sound |
| 2.5 Bryc | `f = 0`; `g = m (f - 1)` | `Λ 0 = 0`; `-I x ≤ Λ g ≤ max (liminf μₙ(G), -m)` | sound |
| 3.1 image rate, inverse contraction | empty fibre; `x ∉ K_M`; non-measurable `f` | `J = ⊤`; `K_M ∪ {x}`; `map f (f(K)ᶜ) = μ(Kᶜ)`; image measures `0` | Lean sound; README R02 |
| 3.2 transfer and Checks | interval `2^-(n+1)`; `a n = -1` | `-log 2`; `(-1) · ⊥ = ⊤` | sound; C02 |
| 3.3 projective limits | `k = 0`; Gaussian sequences | one-point factor forces `I 0 = 0`; `∑ xᵢ²/2` | sound |
| 4.1 `logMGF`, transform, mean, goodness | `N(0,1)`; Cauchy; `Λ = 1 + t²/2`; pairing direction | `1.125`; rate `0`; conjugate `-1`; `fenchelConjugate B f y = ⨆ x, B x y - f x` | sound |
| 4.1 Check, Cauchy with `cgf` | `(0, 2)`; `[1, 2]` | lower `⊥ ≤ liminf` holds; upper `0 ≤ ⊥` fails, mass `0.1024` | R01 |
| 4.2 bound and limit | fair coin `n = 0`, `x = 1`; `x = m`; `x = M` atom; `x > M` | `-log 2` equality; `0` by right-continuity; `ν{M}^(n+1)`, `-log ν{M}`; `⊥ = -⊤` | sound |
| 4.3 Cramér on `ℝ` | Bernoulli `0.3` at `0.6`; Poisson `1` at `2`; exponential at `2`; mean `-∞` | `0.192042`; `0.386294`; `0.306853`; bound needs `sup_{λ ≥ 0}` for every law | sound; route C01 |
| 4.4 Cramér in `E` | coin at `3/4`, `n + 1 = 100`, `1000` | `0.130812`; `-0.150820`, `-0.133945` | sound |
| 5.1 upper bound | `Λ t = ⊥` at some `t` | contradicts `Λ 0 = 0`, convexity, `0` interior | sound |
| 5.2 exposed points | `I y = ⊤`; `x²/2`; `dim E = 0` | never exposed; `η = y`; vacuous | sound |
| 5.3 steep form, Rockafellar, theorem | `t²/2` cut at `1`; `-log (1-t)`; `1 - √(1-t²)`; `cosh` | `x - 1/2`, `1.5`, `2.5`, no exposed `x > 1`; `η = 1 - 1/x`; `η = x/√(1+x²)`; `0.630685`, `0.693069` | sound |
| 5.3 Example, exponential mean `1/(n+1)` | `t < 1`, `t ≥ 1` | `Λ = 0`, `⊤`; transform `x`; only `0` exposed | sound |
| 6.1 types, finite Sanov | `n = 0`, `(a)`; `n = 1`, `(a, b)`; `μ(b) = 0`; arbitrary `Γ` | `-log 2`, `-3 log 2 ≤ -log 2`; `-2 log 3 ≤ -log 2 ≤ 0`; both `⊥`; finitely many types, singletons measurable | sound |
| 6.2 tightness | `μ(K_kᶜ) ≤ exp (-2k²)`, `λ = 2k²` | exponent `2k - log 2 ≥ k` | sound |
| 6.3 Sanov | Polish `E`; finite `α`; `klDiv ν μ = 0` | `BorelSpace (ProbabilityMeasure E)` by instance search after choosing a metric; directly; only `ν = μ` | sound |

- Source locators checked against the text: 9 into AGZ (Definitions D.1–D.3 at AGZ lines 20252–20285, Theorems D.4, D.5, D.7, D.8 and Corollary D.6 at AGZ lines 20289–20362); all support the statements. AGZ line 20289 and line 20292 also name Dembo–Zeitouni's Lemma 1.2.18 and Exercise 4.1.10 for the two halves of 1.5, as the README does.
- Library declarations opened at the pin: `TauCeti/Analysis/Convex/Conjugate.lean` 119, 132, 251, 288; `TauCeti/Analysis/Convex/FenchelMoreau.lean` 245; `TauCeti/InformationTheory/KullbackLeibler/Variational.lean` 378, 482, 519, 534; `TauCeti/Probability/Process/EmpiricalMeasure.lean` 224, 308, 325, 334; `TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Borel.lean` 140; `…/Separable.lean` 48; `Mathlib/Topology/Semicontinuity/Basic.lean` 77; `Mathlib/Probability/Moments/MGFAnalytic.lean` 171, 189; `Mathlib/Probability/Moments/IntegrableExpMul.lean` 119; `Mathlib/Topology/Separation/CompletelyRegular.lean` 249. All fifteen Mathlib files named in the contracts exist. No large deviation principle, rate function, exponential tightness or essential smoothness in either library.
- Cross-roadmap citations resolved: RandomMatrices §9.1 (README line 1348, `Suggested.lean` line 396) and §§9.2–9.5, OptimalTransport §13.13 (line 5041), DysonBrownianMotion (line 28), StochasticCalculus, all on main; ConvexAnalysisAndDuality §4.3 at its open head.
- Dependency check: `depcheck: 200 roadmaps, 2183 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: 36 `sorry` warnings, no error, no other warning; 36 theorems and 12 definitions, as the description says.
- One-tactic probe (`infer_instance`, `rfl`, `simp`, `simp_all`) on all 36 theorems: none closes.
- Elaborated types compared with the README: `legendreRate`, `IsExposedPoint` and `IsEssentiallySmoothSteep` drop `[MeasurableSpace E]`, which they do not use; the theorems of Layer 5 keep `[FiniteDimensional ℝ E] [BorelSpace E]`. The only mismatch with the prose is R02.
- Headlines: every bold target with a Lean name is stated; the differentiability bullet of 4.1 and the contraction principle (owned by RandomMatrices) are prose only, as the module docstring says.

Overlap check: read ConvexAnalysisAndDuality (essential smoothness: owner ConvexAnalysisAndDuality §4.3, the steep predicate here, each side says so), MathematicalStatisticsHigherOrderAndResampling (lists large deviations and Cramér's theorem as outside it), OptimalTransport (§13.13 Schilder, owner OptimalTransport), RandomMatrices (§9.1 definitions and contraction, owner RandomMatrices); ConstructiveFieldTheoryPhi4, StatisticalLearningTheory, ClassicalErgodicTheory, MathematicalStatisticsAsymptotic and MathematicalStatisticsNonparametric searched by object (rate functions, Chernoff, Legendre transform, Cramér, Sanov, Varadhan): nothing shared.

Source independence: 8 passages compared with 1 source (AGZ Appendix D), none shared; largest share DemboZeitouni, 55 of about 115 locators; its text and contents page could not be read, and by the section numbers of the README's own locators the layers do not follow its order (Layer 1 ↔ §1.2 and §4.1, Layer 2 ↔ §4.5, §4.3, §4.4, Layer 3 ↔ §4.2 and §4.6, Layer 4 ↔ §2.2, Layer 5 ↔ §2.3, Layer 6 ↔ §2.1 and §6.2): independent as far as tested.

Research link: the headlines are the theorems of Cramér, Gärtner–Ellis, Sanov, Varadhan, Bryc and Dawson–Gärtner as in Dembo–Zeitouni (1998); RandomMatrices §§9.2–9.5 (Anderson–Guionnet–Zeitouni 2009) and OptimalTransport §13.13 (Schilder) are stated in this framework. Rests on the README's Downstream consumers and on AGZ Appendix D, read.

## Not verifiable

- Dembo–Zeitouni (1998), Kallenberg (2021), Klenke (2020), Ellis (1985): recorded as paywalled and cited by locator alone; every locator into them is unverified, including those of the sampled targets 1.3, 2.1, 4.1, 4.3, 5.1, 5.2, 5.3, 6.1, 6.3 and the Dembo–Zeitouni, Kallenberg, Klenke and Ellis locators of 1.1, 1.4, 2.2, 2.4, 3.1.
- Dupuis–Ellis (1997), the only source of 2.3: no legal copy; the publisher's page for DOI 10.1002/9781118165904 refused the request.
- Page numbers into AGZ: the copy read is the author's online version, which prints Appendix D on pp. 431–433; the README's pp. 427–429 are for the 2009 printing and were not checked. The theorem numbers agree.
- Dembo–Zeitouni's contents page: not read, so the arrangement was compared through section numbers only.

Automatic checks set aside as false positives: the rule against a section comment with no declaration under it flagged the last heading of `Suggested.lean`; that heading introduces the `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- **Misprint** in AGZ at Theorem D.8, p. 433 of the author's online copy: the source says the tilted rate is `I - F` minus the supremum of `F - I`; it should be `I - F` plus that supremum, so that its infimum is `0`; affects a stated result.

## For the human reviewers

- Licence: the README's "Prior formalization" (lines 970–989) names three files of lean-CKMA (stated there as Apache 2.0) as design ideas; that repository was not read, so `Suggested.lean` was not compared with it.
- Not tested: DemboZeitouni carries 55 of about 115 locators and could not be read legally; wording and arrangement were not checked against its text.
