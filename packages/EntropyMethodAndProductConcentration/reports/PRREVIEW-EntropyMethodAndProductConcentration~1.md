# Review of EntropyMethodAndProductConcentration (pull request #3057 at ffd3ac5)

**Verdict:** needs changes

**Summary.** Changes are needed, for two reasons. Two proof routes apply the comparison lemma of 2.3 with formulas that are false as written (the choice of `f` in 4.4, and a doubled factor `v/2` in step 7 of 6.3); and Lévy's inequality of 7.2 is, in its real-valued case, a target that the open roadmap SeriesOfIndependentRandomVariables also owns, which this roadmap does not name. Every stated theorem I recomputed is true as stated, and `Suggested.lean` elaborates with `sorry` as the only warning. There are three small corrections and three format notes, none blocking. For the humans: the source with the largest share of the locators (Boucheron–Lugosi–Massart) and four of the other five books could not be read legally, so most page locators are unchecked.

## R01 (P2) — Two applications of the comparison lemma 2.3 are misstated: with `f(t) = t - a t²/2` the lemma does not give the bound of 4.4, and step 7 of 6.3 carries the factor `v/2` twice

An implementer who follows either route gets stuck or proves a different bound, and both sentences assert a formula that is false.

In the proof route of 4.4 (README line 482) the differential inequality is `(t - a t²/2) ψ' - ψ ≤ (t²/2) v`, and the text says "2.3 with `f(t) = t - a t²/2` on `(0, 2/a)` gives `ψ(t) ≤ v t²/(2(1 - a t/2))`". The lemma needs `f G' - f' G ≤ f² g`. For this `f`, `f' = 1 - a t`, so `f ψ' - f' ψ = (f ψ' - ψ) + a t ψ`, and since `ψ ≥ 0` the extra term has the wrong sign: the hypothesis of the lemma does not follow. The function that works is the solution of `f'/f = 1/(t(1 - a t/2))`, namely `f(t) = t/(1 - a t/2)`: then `f ψ' - f' ψ = (f/(t(1 - a t/2))) ((t - a t²/2) ψ' - ψ) ≤ f² · v/2`, so `g = v/2` and `ψ ≤ f · v t/2 = v t²/(2(1 - a t/2))`. (For `a = 0` the two choices agree, which is why the Check with `a = 0` does not see it.) Replace `f(t) = t - a t²/2` by `f(t) = t/(1 - a t/2)` and say `g = v/2`.

In step 7 of 6.3 (README lines 760–763), `g(t) = (v/2)(t f' - f)/f²` already contains `v/2` (and indeed `g(0) = v`, as the text says), but the conclusion reads "`G(t) ≤ (v/2) f(t) ∫₀^t g`". With `∫₀^t g = (v/2)(2 - t/f(t))` this would give `(v²/2) φ(t)`, which is false for `v < 2`: for one Rademacher coordinate and `|T| = 1`, `v = 1` and `log cosh t ≤ φ(t)/2` fails near `0` (`t²/2` against `t²/4`). The lemma gives `G(t) ≤ f(t) ∫₀^t g = (v/2)(2 f(t) - t) = v φ(t)`. Delete the factor `(v/2)` in front of `f(t) ∫₀^t g`.

## R02 (P2) — Lévy's inequality for the norm of the partial sums (7.2) is, for real summands, the target `levy_symmetric` of the open roadmap SeriesOfIndependentRandomVariables §2.2, and neither text names the other

Two open roadmaps would each have the library prove the same statement. SeriesOfIndependentRandomVariables (pull request #2686) says in its scope paragraph that it owns "Lévy's inequalities for symmetric summands (2.2)" and states, for independent measurable real `X i` each with the law of `-X i`, `P(max_{1 ≤ k ≤ n} |S_k| > a) ≤ 2 P(|Sₙ| > a)` (its README §2.2, and `levy_symmetric` in its `Suggested.lean`, second conjunct). With `E = ℝ` the first conjunct of `levy` here is that statement, under the same hypotheses (the extra index `k = 0` contributes nothing for `t ≥ 0`). The "Not owned here" list names NoncommutativeIntegration §6.2 for Rademacher sums of fixed vectors but not this roadmap, and the description's list of closest roadmaps omits it too.

The smallest change: add SeriesOfIndependentRandomVariables §2.2 to "Not owned here", as the owner of the real-valued inequalities (including the signed form `P(max S_k > a) ≤ 2 P(Sₙ > a)`, which 7.2 does not have), and say in one clause that 7.2 is the normed-space form together with the bound for `max ‖X i‖`; add the same line to the description. If the author prefers a single owner, 7.2 can keep the normed-space statement and say that its real case is that roadmap's §2.2.

## C01 — Several Tau Ceti files named as existing are not in the pinned Tau Ceti

A reader who opens the pinned library to see what is "formalized in Tau Ceti" finds nothing at these paths. The "Not owned here" paragraph on RandomMatrices (README lines 915–920) names `TauCeti/Probability/Concentration/EfronStein.lean`, `TauCeti/Probability/Concentration/Poincare/`, `TauCeti/MeasureTheory/Integral/Entropy.lean`, `TauCeti/Probability/McDiarmid/Independent.lean`, and Azuma–Hoeffding and Hanson–Wright under `TauCeti/Probability/Moments/`; the paragraph on NoncommutativeIntegration (line 935) names `TauCeti/Analysis/Normed/Module/RademacherSum/`; and the docstring of `entropy` in `Suggested.lean` (lines 153–155) says the definition is "formalized in Tau Ceti as `MeasureTheory.Measure.entropy`". At the pin of `lake-manifest.json` (Tau Ceti `2fd255d`) none of these paths exists: `TauCeti/Probability/` has `McDiarmid.lean` and no `Concentration/` or `McDiarmid/`, `TauCeti/Probability/Moments/` has no Azuma or Hanson–Wright file, and `TauCeti/MeasureTheory/Integral/` has no `Entropy.lean`. (A later Tau Ceti does have `MeasureTheory/Integral/Entropy.lean`.)

Either drop the file paths and say only which roadmap owns each result, or, once the pin has them, keep them. If the pin is moved to a Tau Ceti that has `MeasureTheory.Measure.entropy`, the local copy `entropy` should be replaced by it rather than kept beside it.

## C02 — The route of 3.2 uses a chain rule that needs a standard Borel factor, while Han's inequality is stated, correctly, with no such hypothesis

`sum_klDiv_map_restrict_le` and the README target hold for arbitrary measurable coordinate spaces, but the route (README lines 376–379) obtains `∫ Entᵢ(g) dP = D(Q ‖ P) - D(Q⁽ⁱ⁾ ‖ P⁽ⁱ⁾)` from `TauCeti.klDiv_eq_klDiv_fst_add_lintegral_condKernel`, which assumes `[StandardBorelSpace Ω] [Nonempty Ω]` for the second factor (`TauCeti/InformationTheory/KullbackLeibler/ChainRule.lean`, lines 169–176). The identity does not need disintegration: with `gᵢ = ∫ g dPᵢ`, which is the density of `Q⁽ⁱ⁾` with respect to `P⁽ⁱ⁾`, Fubini gives `∫ Entᵢ(g) dP = ∫ g log g dP - ∫ gᵢ log gᵢ dP`, and the two terms are the two relative entropies. Say that, or add the standard Borel hypothesis to the statement (the first is better: it keeps the general statement).

## C03 — The docstring of `freedman` attributes the stated form to Fan, Grama and Liu, whom the README never mentions

The README (7.1) gives Bercu–Delyon–Rio Theorem 3.10, (3.31), for the form with `b x/3` and calls the form with `b x` Freedman's; the docstring in `Suggested.lean` (line 509) says "Freedman's inequality in the form of Fan, Grama and Liu", and no work of these authors is in the References. Use one attribution in both places, and add the reference if the Fan–Grama–Liu one is kept.

## N01 — `Suggested.lean` opens with `public import Mathlib` and `@[expose] public section`; the roadmaps on main that use `module` write the plain line `import Mathlib` followed by the `TauCeti.*` imports.

## N02 — The module docstring says that "the README's other headlines" are stated in prose only, without naming them. There is one, the tensorization corollary of 5.2 (`T₁(C)` for the weighted sum metric `∑ cᵢ dᵢ`); naming it and the carrier it lacks (a metric structure for the weighted `ℓ¹` distance on the product) would tell a reader that nothing else is missing.

## N03 — `phi_neg_mul_le`, `exists_exp_mul_rpow_le` and `le_mul_integral_of_differential_ineq` are inequalities about bare real variables and functions. They are steps of the routes of 6.3, 5.3 and 2.3 rather than headline theorems; the author may wish to mark them as auxiliary in their docstrings.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 sub-gamma tails, sums, maximum (`v c : ℝ≥0` in Lean) | centred Exp(1) at `t = 1/2`; Gamma(2,1), `t = 1`; `N = 5` iid; `N = 1`; `c < 0` model | `1.2131 ≤ 1.2840`; `P(Y > 5) = 0.0404 ≤ 0.3679`; `1.2833 ≤ 3.4035`; bound `0`; `c < 0` would fail, excluded by `ℝ≥0` | true | none |
| 1.2 Bennett | 5 Bernoulli(0.1), `b = 1`, `v = 0.5`, `ε = 1`; `v = 0`; empty `s` | `0.0815 ≤ 0.5231`; bound `1`; `1 ≤ 1` (independence forces a probability measure) | true | none |
| 1.3 Bernstein, moment conditions (sampled) | Exp(1), `v = 2`, `c = 1`; `-Exp(1)`, `c = 0` | `E X^q = q! ≤ q!`; `e^{-t}/(1-t) ≤ e^{t²/(1-t)}`; `e^t/(1+t) ≤ e^{t²}` | true; BLM locator unread | none |
| 1.4 Paley–Zygmund (sampled) | `Y ∈ {0,2}`, `θ = 1/2`; `Y = 1`, `θ = -1` | `1/4 ≤ 1`, variance form `1/4 ≤ 0.625`; control `4 > 1` | true; proof re-derived; locators unread | none |
| 2.1 entropy identities | uniform two points, `g = (0, 2)`; `∫ g = 0` | `Ent = log 2 = 1 · D`; both sides `0` | true | none |
| 2.2 duality and variational formula (sampled) | `U = 0`; `Uₙ = log((g ∨ 1/n)/E(g ∨ 1/n))`; `g = 0`; `u = m` | set nonempty; `∫ Uₙ g → Ent`; `0 = 0`; gap `m log(m/u) - m + u ≥ 0` | true; van Handel Lemma 3.15, p. 57 read | none |
| 2.3 comparison lemma, Herbst (sampled) | `f = x`, `G = v x²/2`; `f = e^t - 1` (4.3); `f = φ + t/2` (6.3); `b ≤ 0` | equality; `f ∫g = m φ(t)`; `f ∫g = v φ(t)`; vacuous | true; van Handel Lemma 3.13, p. 56 read | none |
| 2.4 transportation lemma (sampled) | Rademacher, `q = 0.6`; `v = 0.9`; `v = 0` | `0.2 ≤ √(2 · 0.0201) = 0.2007`; `0.2 > 0.1904`; both sides force `Z = E Z` | true both directions; BLM locator unread | none |
| 3.1 subadditivity (sampled) | `g = 1 + x₁x₂` on `{0,1}²`; product `g`; empty `ι` | `0.0676 ≤ 0.0849`; equality; `0 ≤ 0` | true; van Handel Thm 3.14, p. 57 read | none |
| 3.2 Han (sampled) | `Q = (1/2,1/4,1/8,1/8)`; `Q = law(ξ,ξ)`; `n = 1`; general spaces | `0.1308 + 0.0316 = 0.1624 ≤ 0.1733`; `0 ≤ log 2`; `0 ≤ 0 · ∞ = 0`; Fubini identity holds | true without standard Borel | C02 |
| 4.1 modified LSI (sampled) | one coordinate, `g₁` constant; any sign of `t` | reduces to 2.2 with `u = e^{tc}`; integrand `e^{tf} φ(-t(f-g))` re-derived | true; BLM locator unread | none |
| 4.2 bounded differences (sampled) | `f = ∑ xᵢ`; empty `ι` | `∑ (f-gᵢ)² = ∑ xᵢ ≤ n`; `v ≥ 0` forced | true given 4.1, 2.3 | none |
| 4.3 self-bounding (sampled) | Bin(10, 0.1), `t = 1`; `f = 2x₁`, `t = -3`; `m = 0`; truncation `min(f, N)` | `0.2639 ≤ 0.6796`; `10.07 > 7.77`; bound `1`; `∑ (dᵢ - δ)₊ ≤ N` | true | none |
| 4.4 weakly self-bounding | Bin(n, p), `n ∈ {1,5,10,50}`, `t < 2`; route with `f = t - at²/2` and with `f = t/(1 - at/2)` | no violation on 796 points; first `f` leaves `+ a t ψ`, second gives `g = v/2` | statement true; route false | R01 |
| 4.5 symmetrized LSI, exponential Efron–Stein (sampled) | `φ(u) + e^u φ(-u)`; steps 3–5; `f` constant; Bernoulli sum | `= u(e^u - 1)`; `(1 - tθ) Ent ≤ tθ ρ E e^{tf}`, `∫₀^λ g ≤ θρ(λ/θ)/(1 - λθ)`; `0 ≤ 0`; `V⁺ = (1-p) ∑ xᵢ` | true | none |
| 5.1 Bobkov–Götze (sampled) | two points, `q = 0.51`, `C = 0.9`; `C = 0` | `4·10⁻⁴ > 3.6·10⁻⁴`; both sides say `μ` is a point mass | true; van Handel Thm 4.8, p. 76 read | none |
| 5.2 coupling, tensorization, Marton | `(1/2,1/2)` vs `(0.8,0.2)`; `etvDist` at the pin; binder of `⨅` | disagreement `0.3 = etvDist/2`; `etvDist` is the variation of `μ - ν` (twice TV); `(⨅ π, a) ≤ b` by `rfl` probe | true; van Handel Thm 4.15, p. 84, Cor 4.16, p. 85 read | none |
| 5.3 convex distance | `A = {(0,0)}`, `{(0,1),(1,0)}`, `∅`; one-variable inequality on 1000 points | `√2`; `1/√2`; `∞`, product `0 · ∞ = 0`; no violation | true | none |
| 6.1 elementary inequality | grid `β ∈ {0,…,100}`, `t ∈ [0,8]`, `x ∈ [-4,1]` | 645288 points, no violation | true | none |
| 6.2 Bernstein-type bound | `Z = \|∑ εᵢ\|`, `n = 1,2,4,8`; route algebra | no violation on `[0, 1/2)`; `t(e^t-1)/(1-t) ≤ t²/(1-2t)` | true | none |
| 6.3 Bousquet (sampled) | `n = 8`, `ε = 2`; `n = 0`; step 6; step 7 | `0.0703 ≤ 0.8575`; `1 ≤ 1`; `t - θ(t) = f/f'`; `f ∫g = v φ(t)`, not `(v²/2) φ(t)` | statement true; step 7 misprinted | R01 |
| 7.1 Freedman (sampled) | walk `n = 100`, `x = 10`; `y = 0`; `b = 0`; steps 1–5 | `0.1841 ≤ 0.6164`; event null; bound `e^{-x²/(2y)}`; `(y/b²) h(bx/y)` | true; BDR locator unread | C03 |
| 7.2 Lévy | Rademacher `N = 3`, `t = 1`; 300 random symmetric families, 1500 cases | `1/2 = 2 · 1/4`; no violation of either inequality | true; duplicate real case | R02 |
| 7.3 Hoffmann-Jørgensen (sampled) | 300 random families, `s ∈ {0,1,2}`; Rademacher `N ≤ 4`, `p = 1, 2` | no violation of (6.6), (6.7); moment form `2.125 ≤ 32`, `5.375 ≤ 544` | true; Ledoux–Talagrand unread | none |

- Source locators checked against the text: 7 (van Handel Lemma 3.13, Theorem 3.14, Lemma 3.15, Theorems 4.8, 4.15, 4.20, Corollary 4.16; printed page = PDF page − 6), all correct.
- Library declarations opened at the pin: `etvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean:53`), `VectorMeasure.etvDist`, `iIndepFun.isProbabilityMeasure`, `TauCeti.klDiv_eq_klDiv_fst_add_lintegral_condKernel` (`ChainRule.lean:175`), `TauCeti.wassersteinEDist_one_eq_iSup` (`KantorovichRubinstein.lean:233`), `TauCeti.etvDist_sq_le_two_mul_klDiv` (`Pinsker.lean:149`); the 43 `#check` pins all resolve.
- Cross-roadmap citations resolved: RandomMatrices §§2.1–2.2, MathematicalStatisticsAsymptotic §3.3 and its Beyond list, MathematicalStatisticsHighDimensional §1.2, NoncommutativeIntegration §6.2, MarkovChainMixing §1.1, OptimalTransport §11.1 on main; LogSobolevForMarkovChains 2.3, LogConcaveFunctionalInequalities, EntropyAndSourceCoding, LargeDeviations at their open heads.
- Dependency check: `depcheck: 132 roadmaps, 1464 edges, 0 problem(s)`; no change outside the folder.
- Elaboration: `Suggested.lean` elaborates, `sorry` the only warning (45 theorems, 7 definitions with real bodies, no `set_option`). One-tactic probe (`simp`, `rfl`) on all 45: none closes. Elaborated types compared with the README: the three "dropped" `MeasurableSpace` binders are on `IsSelfBounding`, `IsWeaklySelfBounding` and `convexDistance`, which do not need them.
- Duplication by object in the pinned Mathlib and Tau Ceti (sub-gamma, Bennett, Paley–Zygmund, self-bounding, convex distance, maximal coupling, Marton, Bousquet, Hoffmann-Jørgensen): no declaration found.

Overlap check: read LogConcaveFunctionalInequalities, PACBayesBounds, StatisticalLearningTheory, RandomMatrices, MathematicalStatisticsNonparametric, MathematicalStatisticsHighDimensional (and, by object, SeriesOfIndependentRandomVariables, LogSobolevForMarkovChains, MarkovChainMixing, NoncommutativeIntegration); Lévy's inequality for real symmetric summands: SeriesOfIndependentRandomVariables §2.2 (R02); subadditivity of entropy: this roadmap in general, with the finite-state case a proof step of LogSobolevForMarkovChains 2.3, as the scope paragraph says; the definition of entropy: RandomMatrices §2.2 (copied, as stated); the coupling form of total variation: MarkovChainMixing §1.1 on countable spaces, this roadmap on standard Borel spaces; nothing else shared.

Source independence: 6 passages compared with 1 source (van Handel: the statements of Lemma 3.13, Theorems 3.14, 4.8, 4.15, Corollary 4.16 and the proofs of Lemma 3.15 and Theorem 3.14), none shared; largest share Boucheron–Lugosi–Massart, about 60 of 100 page locators; its text and table of contents could not be read, and neither could Ledoux, Ledoux–Talagrand, Massart or Bercu–Delyon–Rio; contents compared with van Handel (chapters 3 and 4 against Layers 2–5): independent, since Layers 2–4 separate what its chapter 3 treats together and add Han's inequality, self-bounding functions and the exponential Efron–Stein inequality, which it lacks.

Research link: Layers 3–6 state the entropy and transport methods (Ledoux 2001; Boucheron–Lugosi–Massart 2013; Marton's inequality) and reach Talagrand's convex distance inequality (Talagrand 1995) and Bousquet's inequality for suprema of empirical processes (Bousquet 2002), used in empirical-process and model-selection theory (Massart 2007); this rests on the README's references and on van Handel's notes.

## Not verifiable

- Boucheron–Lugosi–Massart 2013 (all locators, including the sampled 1.3, 1.4, 2.4, 3.2, 4.1, 4.2, 4.3, 4.5, 6.3): the publisher's page refuses access and no legal copy was found.
- Ledoux 2001 (Propositions 5.6, 6.1, Theorem 4.6, (4.5), (8.12), Corollary 4.7): the author's page has only the introduction, the references and the erratum; the erratum does not touch the cited places.
- Ledoux–Talagrand 1991 (Propositions 2.3, 6.7, 6.8): paywalled; the author's page has only the erratum, which does not touch the cited places.
- Massart 2007 (Proposition 2.21, (5.49)): paywalled; no copy on the author's page.
- Bercu–Delyon–Rio 2015 (Theorem 3.10, (3.30)–(3.32), Lemmas 2.23, 3.12): paywalled.

Automatic checks set aside as false positives: the remark that a section comment in `Suggested.lean` has no declaration under it concerns the final block of `#check` lines that pin library declarations, which is what that heading is for.

## Source issues

- none

## For the human reviewers

- **Not tested.** Boucheron–Lugosi–Massart 2013 carries about 60 of the README's 100 page locators; neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- **Not tested.** Ledoux 2001, Ledoux–Talagrand 1991, Massart 2007 and Bercu–Delyon–Rio 2015 could not be read; the theorems cited to them were recomputed, their locators were not checked.
- **Licence.** van Handel's *Probability in High Dimension* (README References) is an unpublished set of lecture notes read from the author's Princeton page; it is cited only beside published sources.
