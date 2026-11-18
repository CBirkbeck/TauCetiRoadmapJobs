# Review of LargeDeviations (pull request #2499 at 91b10e4)

**Verdict:** needs changes

**Summary.** Changes are needed, for three reasons. One conjunct of the 4.1 statement (convexity of `logMGF ν`) is false as stated, because nothing makes the open sets of `E` measurable; the Borel property of the Giry σ-algebra in 6.2 is already an instance in the pinned Tau Ceti; and essential smoothness is defined both here and in the open ConvexAnalysisAndDuality roadmap with no owner named. There are five small corrections and two format notes, none blocking. Only Anderson–Guionnet–Zeitouni could be read legally, so the locators into the other five books are unverified, and two points are left for the human reviewers.

## R01 (P2) — The convexity of `logMGF ν` in 4.1 is false when the open sets of `E` are not measurable

`lowerSemicontinuous_legendreRate_logMGF` (`Suggested.lean` line 314) assumes only `[MeasurableSpace E]` and a probability measure, and the README's 4.1 says "a real inner product space with a measurable structure" (line 577). An implementer cannot prove the fourth conjunct, and the proof route's Hölder step needs `x ↦ exp ⟪t, x⟫` to be measurable.

Take `E = ℝ` with the trivial σ-algebra `⊥` and `ν = Measure.dirac 0`, a probability measure. The only simple functions are constants, so the lower integral of `f` is `inf f`. Hence `∫⁻ exp (t x) dν = 0` and `logMGF ν t = ⊥` for `t ≠ 0`, while `logMGF ν 0 = 0`. The set `{p | logMGF ν p.1 ≤ p.2}` contains `(1, -1)` and `(-1, -1)` but not their midpoint `(0, -1)`, so it is not convex. (Concretely, `t ↦ inf_x t x` is concave, not convex.) The other three conjuncts hold in this example, the rate being identically `⊤`.

The smallest change is to add `[OpensMeasurableSpace E]` (or `[BorelSpace E]`) to this theorem, and "in which open sets are measurable" to the opening sentence of 4.1. I did not find a counterexample for `isGoodRateFunction_legendreRate_logMGF` (line 326), but its route bounds `logMGF` near `0` by the same convexity, so it should carry the same binder. The statements on `ℝ`, 4.4 and Layer 5 already have a Borel structure.

## R02 (P2) — The Borel property of the Giry σ-algebra (6.2) is already an instance in the pinned Tau Ceti

`borelSpace_probabilityMeasure` (`Suggested.lean` line 466) and the first bullet of 6.2 ask for something the pin proves, and the supplier contracts say of Mathlib that it has "no `BorelSpace` instance for `ProbabilityMeasure`" without mentioning Tau Ceti. At the pin, `TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Borel.lean` line 140 has the instance `TauCeti.MeasureTheory.ProbabilityMeasure.borelSpace : BorelSpace (ProbabilityMeasure X)` for a Borel space `X` with `HasOuterApproxClosed X` and hereditarily Lindelöf `ProbabilityMeasure X`. `TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Separable.lean` line 48 gives `SecondCountableTopology (ProbabilityMeasure X)` for second-countable standard Borel pseudometrizable `X`.

With those two modules imported, the statement of line 466 elaborates by `infer_instance` after `TopologicalSpace.upgradeIsCompletelyMetrizable E`; I ran it. The finite-alphabet case closes by `infer_instance` alone.

Remove the target from 6.2, from item 6 of the scope list and from the summary, and delete the Lean theorem. Under "From Tau Ceti", cite the two instances with their files, and import the two modules so that `sanov` and `isExponentiallyTight_empiricalLaw` use them. The proof routes of 6.2–6.3 then cite the instance where they now cite 6.2.

## R03 (P2) — Essential smoothness is defined here and in ConvexAnalysisAndDuality §4.3, by different formulas, and neither names the other

The open ConvexAnalysisAndDuality roadmap (pull request #2498) defines `IsEssentiallySmooth` on a finite-dimensional inner product space in its §4.3 (its `README.md` line 811, `Suggested.lean` line 451). There the third clause is that the subdifferential is empty off the interior of the domain. Section 5.3 here (README line 748, `Suggested.lean` line 372) defines it with the gradient norm tending to `∞` at the frontier. The two agree only for proper closed convex functions, so the library would get two notions with one name. Rockafellar's lemma here is close to that roadmap's strict–smooth duality, which gives it at least a shorter route. Neither README cites the other.

The smallest change is one sentence in "Not owned here" or in 5.3 that names the owner. One option is that ConvexAnalysisAndDuality §4.3 owns essential smoothness and 5.3 states the steep form as a variant, saying in one clause how it differs and that the two agree for closed proper convex `Λ`. The other is that this roadmap owns the steep form and §4.3 there cites it. Which roadmap owns it is the author's choice; LargeDeviations is the only one of the two that the merge order lists.

## C01 — 5.1 cites 1.5 for closed sets, but 1.5 as stated needs the lower bound, which 5.1 does not have

`WeakLargeDeviationPrinciple.of_isExponentiallyTight` takes the full weak principle. The Gärtner–Ellis upper bound has no lower bound to offer (5.2 gives one only over exposed points), so an implementer of 5.1 cannot apply 1.5 as stated. The proof of 1.5 already splits: upper bounds on compact sets plus exponential tightness give upper bounds on closed sets for any `I`, and the lower bound plus tightness gives goodness. Stating the first half as its own bullet in 1.5 would make the *Needs* line of 5.1 true.

## C02 — The proof route of the Cramér–Chernoff limit (4.2) uses an open set on the wrong side

"the lower bound of 4.3 on the open set `(x - ε, ∞)`" (line 618) bounds `P(X̄ > x - ε)`, which is larger than `P(X̄ ≥ x)`, so it gives nothing. The set should be `(x, ∞)`, giving `liminf ≥ -inf_{y > x} Λ*(y)`, which equals `-Λ*(x)` by right-continuity when `x` is not the right end of the domain. The remaining case, `x` equal to the essential supremum `M` with an atom, is not covered by the route: there `Λ* = ⊤` on `(M, ∞)` and one needs `P(X̄ ≥ M) = ν{M}^(n+1)` directly. The statement itself is true.

## C03 — The Polish half of the 1.5 proof route does not sum over `k`

The route takes, for each `k`, a set `U_k` with `limsup (a n)⁻¹ log μₙ(U_kᶜ) < -M` (line 318). A union bound over all `k` with the same exponent `-M` diverges. Covering `{I ≤ M + k}` at step `k`, so that the `k`-th term decays like `exp (-a n (M + k))`, repairs it.

## C04 — Goodness of `I` is not used in the tilting theorem

`LargeDeviationPrinciple.tilted` assumes `IsGoodRateFunction I`, but the route of 2.4 is the slab argument of 2.2, of which the README itself says that "no goodness or regularity is used". I checked that the two bounds and the lower semicontinuity of `I - F + sup (F - I)` go through without it. Either drop the hypothesis or say that it is kept to match Ellis and Klenke.

## C05 — The description says the local copies follow §9.1's definitions verbatim, which holds for one of the five

"the local copies follow §9.1's definitions verbatim": RandomMatrices declares only `LargeDeviationPrinciple` in Lean (its `Suggested.lean` line 396, identical to line 53 here). Goodness, the weak principle, exponential tightness and exponential equivalence are prose there, so their Lean forms originate here. Text that would be right: "the local copy of the principle is §9.1's definition verbatim; the other four are Lean forms of the notions §9.1 names". After R02 the Tau Ceti supplier list in the description gains the Borel and second-countability instances.

## N01 — Two passages are tied to a moment or to an unnamed project

"A search of open Mathlib pull requests … found none" (line 178) will not stay true. "Prior formalization" refers to "lean-CKMA", its "synopsis" and "charter entries" without a reference a reader can follow.

## N02 — A Check points to the wrong place

The last Check of Layer 6 cites "the coin rate of 4.4 Checks"; the value `0.130812` is in Layer 4's Examples.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 1.1 copies of the definitions | `δ₀`; `δ_{n+1}`; rate `0` | `{1}`: `⊥ ≤ ⊥`; with rate `0`: `⊥ ≤ 0` holds but lower bound fails; text identical to RandomMatrices line 396 | sound |
| 1.1 attainment | `I ≡ ⊤` on `F`; non-Hausdorff `X` | every point minimises; `F ∩ {I ≤ c}` compact without `T2` | sound |
| 1.2 normalization | arbitrary `a`, including negative | `F = univ`: `(a n)⁻¹ · log 1 = 0 ≤ -inf I` | sound, no speed hypothesis needed |
| 1.2 continuity sets | `s = ∅` | both infima `⊤`; `log 0 = ⊥ → -⊤` | sound |
| 1.2 decay | `F = ∅`; `m = ⊤`; no `ha` | `limsup ≤ -m < -c` gives eventually `≤ -c`; `c = 1` works | sound |
| 1.3 largest term | a term `0`; a term `⊤` | `max ≤ ∑ ≤ card · max`; `(a n)⁻¹ log card → 0` | sound |
| 1.4 uniqueness | infinite measures | `inf_F I ≤ J x` through `U ⊆ F`; no finiteness used | sound |
| 1.4 balls | `K = ∅`; `I x = ⊤` | monotone in `δ`; `{I > c}` open via `B(y, δ') ⊆ B(x, δ)` | sound; agrees with AGZ Thm D.5, Cor. D.6 |
| 1.5 weak plus tight | no measurability of `Kᶜ`; `X = ∅` | outer subadditivity suffices; `{I ≤ M} ⊆ K_{M'}` for `M' > M` | sound; see C01 |
| 1.5 Polish | non-Borel σ-algebra containing the opens | single measures tight after restriction to Borel sets | sound; route see C03 |
| 2.1 Chebyshev | `J = ∅`; `K = ∅`; `Λ j = ⊥`, `⊤` | `-⊥ = ⊤` trivial; `⊥ ≤ ⊥`; `F - ⊥ = ⊤` forces `⊥`, consistent | sound |
| 2.2 bounded Varadhan | no goodness; empty slab | slabs: `limsup ≤ sup (f - I) + ε` | sound |
| 2.2 tail form | `φ` unbounded below | `{φ ≤ -L}` contributes `≤ -L` | sound |
| 2.2 moment ⇒ tail | no measurability, no finiteness | pointwise bound and `restrict ≤ μ`: `limsup ≤ -(γ-1) M + C` | sound |
| 2.3 equivalence | closed `F`; `I x < ⊤` | `inf (k d∧1 + I) ↑ inf_F I` by compact sublevels; `liminf max(xₙ, -k)` | sound |
| 2.4 tilting | fair coin, `F x = x`, `x = 0.4` | `sup = 0.620115`; `0.020136 - 0.4 + 0.620115 = 0.240251`; coin `e/(1+e)`: `0.240251` | sound; see C04; AGZ D.8 sign is the source's misprint |
| 2.5 Bryc | `f = 0` | `Λ 0 = 0`, truncation invisible | sound |
| 3.1 image rate | empty fibre; `T1` only | `J = ⊤`; `{J ≤ c} = f '' {I ≤ c}` compact, closed by `T2` | sound |
| 3.1 inverse contraction | `x ∉ K_M` | use `K_M ∪ {x}`; `map f (f(K)ᶜ) = μ(Kᶜ)` by injectivity | sound |
| 3.2 transfer | interval of length `2^-(n+1)` | `(n+1)⁻¹ log 2^-(n+1) = -log 2 ≠ ⊥` | sound |
| 3.3 projective limits | `k = 0`; Gaussian sequences | one-point factor forces `I 0 = 0`; `∑ xᵢ²/2` | sound |
| 4.1 `logMGF`, transform | `⊥` σ-algebra on `ℝ`; `N(0,1)`; Cauchy | `logMGF = ⊥` off `0`: epigraph not convex; `1.125` at `1.5`; rate `0` | R01 |
| 4.1 zero at mean | integrable `id` | Jensen `Λ t ≥ ⟪t, m⟫`; conjugate `≤ 0`, `≥ 0` at `t = 0` | sound |
| 4.2 Chernoff bound | fair coin, `n = 0`, `x = 1`; `P = 0` | `log (1/2) = -log 2`; `⊥ ≤` anything | sound |
| 4.2 limit | `x = m`; `x` = ess sup with atom; beyond | `0`; `ν{M}^(n+1)`; `⊥ = -⊤` | statement sound; route C02 |
| 4.3, 4.4 Cramér | Bernoulli `0.3`, `0.6`; Poisson `1`, `2`; exponential, `2`; coin `3/4` | `0.192042`; `0.386294`; `0.306853`; `0.130812`, binomial `-0.150820`, `-0.133945` | sound |
| 5.1 upper bound | `Λ t = -∞` at some `t` | contradicts `Λ 0 = 0` with convexity and `0` interior | sound; see C01 |
| 5.2 exposed points | `I y = ⊤`; `x²/2`; non-steep `Λ` | never exposed if `E ≠ 0`; `η = y`; `x - Λ*(x) = 1/2` on `[1, ∞)` | sound |
| 5.3 essential smoothness, Rockafellar, full theorem | `Λ ≡ 0`; `|t|`; exponential means | `Λ* = 0` at `0` only, exposed; `0.630685`, `0.693069`; `Λ* x = x`, only `0` exposed | sound; ownership R03 |
| 6.1 types, finite Sanov | `n = 0`, `y = (a)`; `n = 1`, `y = (a, b)`; `μ(b) = 0` | `-log 2 ≤ -log 2`, `-3 log 2 ≤ -log 2`; `-2 log 3 ≤ log (1/2) ≤ 0`; both sides `⊥`; arbitrary `Γ` measurable up to finitely many types | sound |
| 6.2 Borel property | Polish `E`; finite `α` | closes by `infer_instance` from the pinned Tau Ceti instances | R02 |
| 6.2 tightness | `μ(K_kᶜ) ≤ exp (-2k²)` | Chernoff exponent `2k - log 2 ≥ k`; tail sum `≤ 2 exp (-(n+1) M)` | sound |
| 6.3 Sanov | `klDiv ν μ = 0` | only at `ν = μ` | sound, given R02 |

- Source locators checked against the text: 9 into Anderson–Guionnet–Zeitouni (Definitions D.1–D.3, Theorems D.4, D.5, D.7, D.8, Corollary D.6); all support the statements; none readable in the other five books.
- Library declarations opened at the pin: `TauCeti/MeasureTheory/Measure/ProbabilityMeasure/Borel.lean` 140, `…/Separable.lean` 40 and 48, `TauCeti/Analysis/Convex/Conjugate.lean` 119–288, `TauCeti/Probability/Process/EmpiricalMeasure.lean` 224, `TauCeti/InformationTheory/KullbackLeibler/Variational.lean` 482, 519, 534.
- Cross-roadmap citations resolved: RandomMatrices §9.1 and §§9.2–9.5, OptimalTransport §13.13, DysonBrownianMotion (line 28), all on main.
- Dependency check: `depcheck: 213 roadmaps, 2281 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 36 `sorry` warnings, no error, no other warning; 36 theorems and 12 definitions, as the description says.
- One-tactic probe (`infer_instance`, `rfl`, `simp`, `simp_all`) on all 36 theorems: none closes with the file's own imports; line 466 closes once the two Tau Ceti modules of R02 are imported.
- Elaborated types compared with the README: three definitions drop `[MeasurableSpace E]`, which they do not use; the only mismatch with the mathematics is R01.
- Headlines: every bold target with a Lean name is stated; the differentiability bullet of 4.1 and the contraction principle (owned by RandomMatrices) are prose only, as the module docstring says.

Overlap check: read ConvexAnalysisAndDuality (shares essential smoothness, no owner named: R03), MathematicalStatisticsHigherOrderAndResampling (lists large deviations as outside it; nothing shared), OptimalTransport (§13.13 Schilder, owner OptimalTransport), RandomMatrices (§9.1 definitions and contraction, owner RandomMatrices); MathematicalStatisticsAsymptotic and MathematicalStatisticsNonparametric searched by object, nothing shared.

Source independence: 8 passages compared with 1 source (AGZ Appendix D), none shared; largest share DemboZeitouni, 55 of 121 locators; its text and contents page could not be read, and by the section numbers of the README's own locators the layers do not follow its order (Layer 1 ↔ §1.2 and §4.1, Layer 2 ↔ §4.5, §4.3, §4.4, Layer 3 ↔ §4.2 and §4.6, Layer 4 ↔ §2.2, Layer 5 ↔ §2.3, Layer 6 ↔ §2.1 and §6.2): independent as far as tested.

Research link: the headlines are the theorems of Cramér, Gärtner–Ellis, Sanov, Varadhan, Bryc and Dawson–Gärtner as in Dembo–Zeitouni (1998); RandomMatrices §§9.2–9.5 (Anderson–Guionnet–Zeitouni 2009) and OptimalTransport §13.13 (Schilder) are stated in this framework. Rests on the README's Downstream consumers and on AGZ Appendix D, read.

## Not verifiable

- Dembo–Zeitouni (1998), Kallenberg (2021), Klenke (2020), Ellis (1985): the publisher's pages are paywalled; every locator into them is unverified, including those of the sampled targets 1.2, 2.1, 2.3, 3.3, 4.1, 4.2, 5.1, 6.1, 6.2.
- Dupuis–Ellis (1997): no legal copy found (the publisher's page refused the request).
- Page numbers into Anderson–Guionnet–Zeitouni: the copy read is the author's online version, which prints Appendix D on pp. 431–433; the README's pp. 427–429 are for the 2009 printing and were not checked. The theorem numbers agree.
- Dembo–Zeitouni's contents page: the publisher's site redirected to a sign-in, so the arrangement was compared through section numbers only.
- The sources service recorded entries for AGZ (author's page) and four uncertified books in the package's manifest while fetching.

Automatic checks set aside as false positives: the rule against a section comment with no declaration under it flagged the last heading of `Suggested.lean`; that heading introduces the `#check` lines that pin library declarations, which the form rules allow.

## Source issues

- **Misprint** in AGZ at Theorem D.8, p. 433 of the author's online copy: the source says the tilted rate is `I - F` minus the supremum of `F - I`; it should be `I - F` plus that supremum, so that its infimum is `0`; affects a stated result.

## For the human reviewers

- Licence: the README's "Prior formalization" (lines 951–969) names three files of "lean-CKMA" as design ideas; that repository was not read, so `Suggested.lean` was not compared with it and its licence is unchecked.
- Not tested: DemboZeitouni carries 55 of 121 locators and could not be read legally; wording and arrangement were not checked against its text.
