# Review of MarkovChainsAndRenewal (pull request #2605 at 710d7e5)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 141 lines changed since `1508422`: the numbered locators into Tassion's notes were read at the source and support the sections that cite them, the restated `isReversible_iff_singletons` is true for every measure and agrees with §3.1, the lazy-walk Check of §3.5 was recomputed, the declarations now cited in §1.4 and §2.4 exist at the pins with the hypotheses stated, and §7.3 matches StochasticCalculus §0.6. The description was read against the head and against the README on main and nothing in it is contradicted. There are two small corrections and three format notes, none blocking. Left for a human: the licence class of the notes' host, and the parallel between the layers and the notes' chapters.

## C01 — The description does not say that the section "Completion checks" is removed, nor where its content went

The README on main ends with a section "Completion checks" (a general requirement on every new definition and five boundary cases); the head has no such heading, and the description's account of the new shape does not mention it. A reader comparing the two texts cannot tell from the description whether those requirements were dropped. They were not: the general requirement is Convention 11 (README lines 120–126), and the five cases are Checks of §3.5 (line 512), §4.4 (line 567), §6.4 (line 740), §7.4 (line 830) and the Layer 7 Examples (lines 837–838), with the entrance-against-return case in Convention 3 and the Layer 2 Checks. One sentence under "What changes in form" would do, for example: "The section 'Completion checks' is gone: its general requirement is Convention 11 and its five cases are Checks of §3.5, §4.4, §6.4 and §7.4 and the Layer 7 Examples."

## C02 — The Norris, Feller and Last–Penrose citations are still by chapter

The previous review asked for numbered locators for all sources; the head gives them for Tassion's notes only, and the description says so. The notes leave Theorems 5.6 and 5.12 to exercises and admit Theorem 5.13 (Tassion2025 lines 1566, 1662, 1671), so §5.2–§5.4 rest on "Feller, vol. II, Chapter XI" for their proofs, and the Layer 2 Examples (line 397) now rest on "Norris, Chapter 1" alone. Those three books could not be read here, so no particular number is proposed; a theorem or section number at each of these citations would let a reader find the proof.

## N01 — The Layer 1 heading keeps a non-standard term

"Deterministic and strong Markov properties" (line 199): the property at fixed times is the simple Markov property in the literature, and in the notes (Tassion2025 line 377).

## N02 — Two dependency summaries omit an edge that the *Needs:* lines record

Layer 2's Dependencies (lines 405–407) does not say that §2.3 uses the later §2.4 (line 362). "How to read the build" (line 47) lists Layers 0, 4 and 5 for Layer 7, without the §1.1 that Layer 7's own Dependencies (line 842) gives.

## N03 — In §2.2 the locator "Theorem 3.1" stands for a law that is in the theorem's proof

The statement of Theorem 3.1 gives only `𝔼_x V_x < ∞` for a transient x; the geometric law and the value `ρ_x/(1 − ρ_x)` are in its proof (Tassion2025 lines 587–601). "Theorem 3.1 and its proof" would be exact.

## Previous findings

The previous report (of `1508422`) had no finding (no R-numbered point). Its small corrections and format notes at this head:

- C01 — partly repaired: every Tassion citation names numbered statements, e.g. "(Tassion, Theorem 4.2, with Lemma 4.3 …)"; Norris, Feller and Last–Penrose remain by chapter (C02 above).
- C02 — repaired: "(natural filtration: Tassion, Theorem 2.2 and Corollary 2.4 …)", "(under `P_y`: Tassion, Theorem 3.4 …)", "(λ = 1 on the 8 × 8 grid: Tassion, Proposition 4.18)".
- C03 — repaired: References now read "The main source, cited by numbered statement for the chain, renewal and Poisson results."
- C04 — repaired: "StochasticCalculus §0.6's restart property, applied to the natural filtration of N, makes … ; prove that it has the law of N."
- C05 — repaired: `theorem isReversible_iff_singletons (π : Measure S)`, with the docstring "for every measure `π`".
- C06 — repaired: §1.4 "are stopping times … (`MeasureTheory.Adapted.isStoppingTime_hittingAfter`, …)"; §2.4 cites `TauCeti.Probability.strong_law_ae_real_of_lintegral_eq_top` in the route and in *Needs:*.
- C07 — repaired: the description reads "Most Checks say what a plausible wrong convention would give".
- C08 — repaired: the fourth Check of §3.5 is the lazy symmetric walk, "irreducible and aperiodic with no invariant probability".
- N01 — not repaired: the heading is unchanged (N01 above).
- N02 — not repaired: both summaries are unchanged (N02 above).

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
| --- | --- | --- | --- | --- |
| §3.1 `isReversible_iff_singletons`, every π | a=½, b=¼, π=(⅓,⅔) and 3π; count on ℤ with the simple walk; π=0; 3-cycle, uniform π | ⅓·½=⅙=⅔·¼; scaled ½=½; count: 1·½=1·½, set form ½=½ and ∞=∞; cycle: ⅓ against 0 both forms | true without finiteness | none |
| §3.5 fourth Check, lazy walk | n=1, y=0, ±1; n=2, y=0; \|y\|>n | C(2,1)/4=½, C(2,2)/4=¼; C(4,2)/16=6/16 = ¼+2·(1/16); 0; mass sum 1, so distance to 0 is 1 | true; instance of the theorem | none |
| §3.5 `tendsto_comp_pow_apply_singleton_of_not_exists_invariant` | lazy walk at y=0 | C(2n,n)/4^n ≈ 1/√(πn) → 0; self-loop gives period 1; an invariant π would satisfy π{y}=∑π{x}p_n(x,y)→0 | true | none |
| §2.4 `ae_tendsto_occupation_div`, infinite-mean route | simple walk on ℤ at 0; absorbing chain | gaps iid, nonnegative, mean ∞: averages → ∞, V₀(n)/n → 0 = (⊤)⁻¹.toReal; pinned lemma needs only pairwise independence | true; citation fits | none |
| §1.4 stopping times and shifts | 3-cycle from 0; pinned hypotheses | gap 3 = excursion length 2 + 1; both lemmas need `Adapted` and a measurable set, any filtration | true as cited | none |
| §7.3 restart, discretisation | supplier text; two steps of i+Poi(λΔ) | supplier: future increments Poisson for own natural filtration, independent of `F_s`, passes to smaller filtrations; i+Poi(2λΔ) | true; supplier states it | none |
| §0.2 multi-time cylinders, new locator | 3-cycle from 0, times 0<2<3 | 1·p₂(0,2)·p₁(2,0)=1; Definition 1.3 and Propositions 1.1, 2.5 give prefix masses, n-step masses, Chapman–Kolmogorov | true; "from" is exact | none |
| §5.3 `tendsto_renewalFunction_lattice`, new locator | Unif{1,2} | U{n}=1, ½, ¾, ⅝ → ⅔ = a/μ; Theorem 5.12: m(ai)−m(a(i−1)) → a/μ | true; same statement | none |
| §6.3 key renewal theorem, new locator | Exp(λ), h=1_{[0,c)} | m(t)−m(t−c)=λc; Theorem 6.7: (h∗m)(t) → (1/μ)∫h, m's measure being U−δ₀ | true | none |
| §3.6 hard-core, new locator | one edge, λ=1 | π=(⅓,⅓,⅓); Proposition 4.18: limit 1/\|S\| on the 8×8 grid with a fair coin | true; qualifier exact | none |

The rows for the untouched statements stand as in the previous review, of `1508422`.

- Source locators checked against the text: all 30 Tassion citations of the head, 56 numbered statements between Definition 1.3 and Theorem 9.11; 35 read in full this round (including the new ones: Proposition 1.4, Remark 1.5, Definitions 9.1 and 9.4, Proposition 9.1, Theorem 9.8), the other 21 located by their opening lines and read in the previous round. The 15 sampled sections are all among them.
- Library declarations opened at the pins: Mathlib `Adapted.isStoppingTime_hittingAfter` (`Probability/Process/HittingTime.lean` line 413), `Kernel.IsReversible` (`Probability/Kernel/Invariance.lean` line 58), `etvDist`, `tvDist` (`MeasureTheory/Measure/TotalVariation/Defs.lean` lines 53, 62), `exists_mem_closure_of_ge` (`NumberTheory/FrobeniusNumber.lean` line 171); Tau Ceti `MeasureTheory.Adapted.isStoppingTime_successiveVisit` (`Probability/Process/SuccessiveVisits.lean` line 259), `TauCeti.Probability.measurable_shift_iterate` (`Probability/Process/PathLaw/Shift.lean` line 63), `TauCeti.Probability.strong_law_ae_real_of_lintegral_eq_top` (`Probability/StrongLaw.lean` line 154), `conditionallyIIDWith_excursionProcess`, `markovChainLaw_eq_map_pathOfExcursions`. No lemma on `IsReversible` beyond `IsReversible.invariant` at either pin.
- Cross-roadmap citations resolved: StochasticCalculus §0.6 on main (`TauCetiRoadmap/StochasticCalculus/README.md` lines 785–803) and at the head of its open revision, where the section and the restart bullet are unchanged.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder. The automatic checks all passed.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and no error. The elaborated type of `isReversible_iff_singletons` has `(π : Measure S)` with no instance on π, as §3.1 states. One-tactic probe on it (`rfl`, `exact Iff.rfl`, `simp [Kernel.IsReversible]`, `aesop`): none closes.
- Description against the head: 16 declarations (9 removed, 11 added, 2 restated) as it says; 42 Checks in 24 sections; the nine table rows §0.1 … §6.1 are present; old item k.n is §k.n in every layer; each item of main's README was found as a target or a pinned declaration; C01 is the only omission.
- Headlines: unchanged since the previous review; all are stated, and the docstring names none as not statable, correctly.

Overlap check: read StochasticCalculus (main and its open revision) again for the changed §7.3; MarkovChainMixing, PopulationDynamics, PoissonApproximation, PointProcesses, MarkovDecisionProcesses and MathematicalStatisticsFoundations stand as read in the previous review. The restart property of the Poisson process: StochasticCalculus §0.6 owns it, and §7.3 now cites it and adds only the law of the restarted process. The coupling inequality: this roadmap owns the meeting-time form, MarkovChainMixing 4.1 the Markovian-coupling form. Nothing else is shared.

Source independence: changed passages only; 9 passages compared with 1 source (Tassion2025; Norris, Feller and Last–Penrose could not be read), none shared beyond what the mathematics forces (the lazy walk and the concatenation target do not occur in the notes); largest share Tassion2025, 30 of 51 locators; the diff adds, removes and reorders no layer, so the contents comparison stands as in the previous review: independent, order forced by the *Needs:* lines.

Research link: Layers 5–6 are Blackwell's and the key renewal theorem (Feller 1971, vol. II, Ch. XI), consumed by ProbabilisticAndMetricNumberTheoryPartII; Layers 2–3 are the equilibrium theory (Norris 1997, Ch. 1) on which MarkovChainMixing builds quantitative mixing. Rests on the README's References and Downstream consumers and on those roadmaps' READMEs.

## Not verifiable

- Norris1997, Chapter 1 (13 locators): Cambridge University Press book; no legal open copy found.
- Feller1971, vol. II, Chapter XI (6 locators): no legal open copy found; the citation resolves to a paywalled page.
- LastPenrose2017, Chapters 3 and 5 (2 locators): the publisher's landing page only; no open copy fetched.
- The Zulip archive discussion cited in §1.1 for motivation was not opened.

## Source issues

- **Misprint** in Tassion2025 at Theorem 9.4, proof of (ii) ⇒ (i), p. 93: the source ends with the Poisson mass written with exponent −λk; it should be the exponent −λt, giving (λt)^k e^{−λt}/k!; affects nothing.
- **Gap** in Tassion2025 at §6.8 (application to the excess time), p. 64: the source applies the key renewal theorem to the forcing h_x by calling it directly Riemann integrable through a proposition it does not state, while Theorem 6.7 covers nonincreasing forcing; it should apply Theorem 6.7 to the nonincreasing tail P(T₁ > t + x), or state and prove the criterion; affects the proof.
- **Gap** in Tassion2025 at Theorem 3.4, proof, p. 26: the source applies the law of large numbers to the inter-visit times also when m_x = ∞, with only a remark that this case is included; it should cite or prove the infinite-mean form, by truncation; affects the proof.
- **Misprint** in Tassion2025 at Proposition 3.10(ii), proof, p. 29: the source concludes that m_x < ∞ implies m_y = ∞; it should conclude m_y < ∞; affects the proof.
- **Misprint** in Tassion2025 at Proposition 2.7, proof, p. 20: the event after the stopping time is written with n ≥ 0, which always holds; it should be n ≥ 1, giving P_x(T₁ < ∞); affects the proof.
- **Misprint** in Tassion2025 at Proposition 5.1, p. 48: the exponential distribution function is written 1 − e^{λt}; it should be 1 − e^{−λt}; affects nothing.
- **Misprint** in Tassion2025 at Theorem 9.3, proof of (iii) ⇒ (i), p. 91: the source writes e^{−A}(1 + λA/n)^n and a density with e^{λ y_k}; they should read e^{−λA}(1 + λA/n)^n and e^{−λ y_k}; affects nothing.

## For the human reviewers

- Licence: Tassion2025 was read from ETH Zürich's course server (metaphor.ethz.ch), a host with no recorded licence class; this review treated it as institutional lecture notes posted by the lecturer.
- Scope: the source with the largest share of locators (30 of 51) is unpublished lecture notes; the published texts cited beside it (Norris 1997, Feller 1971, Last–Penrose 2017) could not be read here.
- Arrangement: Layers 0–3, and §§3.1–3.6 within Layer 3, parallel Tassion2025 Chapters 1–4 and §§4.1–4.9 in order; the order is dependency-forced and inherited from main, so no finding was raised. The References no longer state the correspondence.
