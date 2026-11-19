# Review of MarkovChainsAndRenewal (pull request #2605 at 1508422)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every headline theorem of the README is stated in `Suggested.lean` at the README's generality, the file elaborates with only `sorry` warnings, all 42 Checks and the worked examples compute to the values claimed, and the fifteen sampled sections are supported by Tassion's notes at the locators given below. There are seven small corrections and two format notes, none blocking. Most of the corrections are about citations: the chapter-range locators need theorem numbers; three sections cite the notes for more than the notes prove; the References say the layers follow the notes' chapters; and §7.3 plans a second proof of a corollary of StochasticCalculus §0.6. Two things are left for a human: the licence class of the notes' host, and the fact that the layer arrangement parallels the notes' chapters.

## C01 — The locators into the main source are chapter ranges, so a reader cannot find a cited result without reading up to forty pages

All of Layers 0–3 cite "Tassion, Chapters 1–4" (for example §3.2, line 430), Layers 4–5 "Chapter 5" and Layer 7 "Chapters 7–9". A reader looking for Kac's formula or the null-recurrent limit has to search four chapters. The roadmap's own standard asks for exact locators. The numbers below were checked against the text and could replace the ranges:

- **Layer 0.** §0.2: Definition 1.3 (p. 9), Proposition 1.1 (p. 10) and Proposition 2.5 (p. 18). §0.4: Lemma 1.2 and Proposition 1.3 (pp. 10–11).
- **Layer 1.** §1.2: Theorem 2.2 and Corollary 2.4 (pp. 17–18). §1.3: Theorem 2.6 (p. 19). §1.4: Propositions 2.7–2.8 (pp. 20–21).
- **Layer 2.** §2.2: Definition 3.1 and Theorem 3.1 (pp. 23–24). §2.3: Proposition 3.10, Theorems 3.12–3.13 and Propositions 3.17–3.18 (pp. 28–32). §2.4: Theorems 3.4–3.5 (pp. 25–26).
- **Layer 3.** §3.1: Definitions 4.1–4.2 and Proposition 4.1 (pp. 34–35). §3.2: Theorem 4.2 (p. 35). §3.4: Propositions 4.8–4.13 and Lemmas 4.14 and 4.17 (pp. 39–42). §3.5: Proposition 4.13 and Theorems 4.15–4.16 (pp. 40–42). §3.6: Proposition 4.18 (p. 44).
- **Layers 4–5.** §4.4: Propositions 5.1–5.2 (pp. 48–49). §5.2: Theorem 5.6 (p. 52). §5.3: Definition 5.4 and Theorem 5.12 (p. 54). §5.4: Theorem 5.13 (p. 55).
- **Layer 6.** §6.2: Proposition 6.4 and Theorem 6.6 (pp. 59–61). §6.3: Theorem 6.7 (p. 63). §6.4: Proposition 6.5 (p. 60) and §6.8 (p. 64).
- **Layer 7.** §7.1: Theorems 9.3 and 9.8 (pp. 90, 94). §7.2: Theorem 9.4 (p. 92). §7.3: Theorem 9.7 (p. 93). §7.4: Theorems 9.9 and 9.11 (pp. 94–95).

The Norris and Feller citations would need theorem numbers in the same way.

## C02 — Three sections cite the notes for statements more general than the notes prove

§1.1–§1.3 state the Markov and strong Markov properties for an arbitrary filtration for which X is Markov. Tassion2025 proves them only for the natural filtration σ(X₀, …, X_n) (Tassion2025 line 378; Theorem 2.2, p. 17; Theorem 2.6, p. 19). §3.6 states the hard-core chain on an arbitrary finite graph at activity λ > 0. The notes' §4.9 treats only the 8×8 grid at λ = 1, where the law is uniform (Tassion2025 lines 1330–1352; Proposition 4.18, p. 44).

The statements themselves are true: detailed balance at activity λ is the one-line identity `π(I) · λ/((1 + λ)|V|) = λπ(I) · 1/((1 + λ)|V|)`, and the filtration-relative forms follow along the routes the README gives. The problem is that a reader is told the source proves what it does not. The fix is to qualify the citations, for example "(natural filtration: Tassion, Theorem 2.2)" and "(λ = 1 on a grid: Tassion, Proposition 4.18)", or to cite a text that treats the general case.

## C03 — The References say that the layers follow the main source's chapters

Line 1020 reads "Chapters 1–4 correspond to Layers 0–3, Chapter 5 to Layers 4–5 and Chapter 6 to Layer 6". This presents the plan as the notes' table of contents. In fact the layer order is the one the *Needs:* lines force, and that order is not in question. The fix is to delete the correspondence clause and keep "The main source", optionally with what it is cited for.

## C04 — §7.3 plans its own proof of a restart property that StochasticCalculus §0.6 already plans for every filtration

§7.3 (lines 790–795) asks for a proof by cylinders and π–λ that the restarted process is a rate-λ Poisson process independent of the natural history. StochasticCalculus §0.6 on main plans exactly that argument for an arbitrary filtration: `TauCetiRoadmap/StochasticCalculus/README.md` lines 796–800, with the passage to the natural filtration of N at line 801. The README already notes that its statement is this specialisation.

The smallest repair is to state the first claim of §7.3 as StochasticCalculus §0.6 specialised to the natural filtration of N, with "has the law of N" as the only addition, and to drop the π–λ route. The discretised chain `(N_{nΔ})` stays as the target of §7.3.

## C05 — `isReversible_iff_singletons` assumes a probability measure, while §3.1 states the singleton test for every π

`Suggested.lean` line 77 has `[IsProbabilityMeasure π]`, but README §3.1 (lines 405–408) puts no condition on π. The test holds for every measure on a countable space with measurable singletons: both sides of Mathlib's `IsReversible` (`Mathlib/Probability/Kernel/Invariance.lean` line 58) are countable sums of the terms `π {x} * κ x {y}`. Either dropping the binder or writing "a probability π" in §3.1 would make the README and the Lean statement agree.

## C06 — §1.4 asks for proofs of facts that are already at the pins

§1.4 opens with "Prove that the first entrance, the first return and the successive visits are stopping times … and that the shifts θ_n … are measurable" (line 274). Mathlib's `MeasureTheory.Adapted.isStoppingTime_hittingAfter` and Tau Ceti's `MeasureTheory.Adapted.isStoppingTime_successiveVisit` and `TauCeti.Probability.measurable_shift_iterate` already prove these, as the §1.4 row of the table under Scope and ownership records. An implementer reading "Prove" may redo them. The fix is to say "are stopping times (…) and are measurable (…)", naming the declarations, and to keep only the measurability of concatenation as a target.

## C07 — The description says that every Check names the wrong convention it rules out, but about ten do not

The description says: "Each Check says what a plausible wrong convention would give". Of the 42 Checks, the following do not: the first Checks of §3.1, §3.2, §5.4, §6.3, §6.4 and §7.4, the second Check of §3.2, the first Check of §7.2, and the Checks of §7.1 and §7.3. "Most Checks say what a plausible wrong convention would give" would be accurate.

## N01 — The Layer 1 heading uses a non-standard term

"Deterministic and strong Markov properties" (line 197) calls the Markov property at fixed times "deterministic". The literature calls it the simple Markov property, so "Simple and strong Markov properties" would match the usual name.

## N02 — Two dependency summaries leave out an edge that the *Needs:* lines record

Layer 2's Dependencies (line 399) does not mention that §2.3 uses the later §2.4 (line 354). "How to read the build" (line 48) lists Layers 0, 4 and 5 for Layer 7, without the §1.1 that Layer 7's Dependencies (line 828) adds.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.2 multi-time cylinders | 3-cycle from 0, times 0<2<3, states 0,2,0 | formula 1·p₂(0,2)·p₁(2,0)=1; path probability 1; one-step variant κ0{2}κ2{0}=0 | true; Check discriminates | none |
| §0.4 sampler | weights (½,0,½); weights 2^{−(k+1)} | c=(0,½,½,1), state 1 gets ∅; c_k=1−2^{−k}, u=1 uncovered; Tassion Lemma 1.2 same intervals | true | none |
| §1.1 filtration Markov property | iid fair bits, F_n=σ(X₀…X_{n+1}) | P(X_{n+1}=1∣F_n)=1{X_{n+1}=1} vs ½ | Check true | C02 |
| §1.2 path Markov property | natural filtration; source text | Tassion Thm 2.2 conditions on X_k=x, F_k natural only | true; source proves special case | C02 |
| §1.3 strong Markov | last exit L, κ0{0}=κ0{1}=½, κ1{1}=1 | P(X_{L+1}=0)=0 vs P₀(X₁=0)=½ | Check true | C02 |
| §1.4 return gaps | 3-cycle from 0 | gap 3 = excursion length 2 + 1 | true | C06 |
| §2.2 visits, geometric law | κ0{0}=κ0{1}=½, κ1{1}=1 | ρ=½, E V=ρ/(1−ρ)=1, G=2; P(V=k)=2^{−k}·½ = geometricMeasure(½) mass (1−p)^k p | true | none |
| §2.3 class properties | {0,1,2}: 0→{0,1}, 1↔2 | {0} transient, not closed; {1,2} closed, m₁=m₂=2; Tassion Thm 3.13, Prop 3.17 | true | none |
| §2.4 `ae_tendsto_occupation_div` | switching chain; absorbing chain from 0 and from 1 | V₀(n)/n→½=1/m₀; reached with m₀=⊤ → 0; unreached → if-branch 0 | true | none |
| §3.1 `isReversible_iff_singletons` | two-state a,b; 3-cycle; π=count | π₀a=ab/(a+b)=π₁b; cycle 1/3 vs 0; test also holds for infinite π | true; Lean narrower | C05 |
| §3.2 `exists_invariant_probability_iff` | a=½,b=¼; SRW on ℤ | π=(⅓,⅔); SRW: counting measure invariant, no probability, m₀=⊤ | true | none |
| §3.2 `invariant_mass_eq_inv_meanReturn` | a=½,b=¼; one state | m₀=(1−a)+a(1+1/b)=3=1/π₀; δ_x, m=1 | true | none |
| §3.2 `existsUnique_invariant_probability` | one state; 2-cycle (periodic) | δ_x; uniform, unique without aperiodicity | true | none |
| §3.4 coupling | switching chain from 0 and 1 | never meet; tvDist=2=2·P(τ>n); product: (0,1)↔(1,0) only | true | none |
| §3.5 `tendsto_tvDist_comp_pow` | a=½,b=¼ from 0; switching chain | 2·⅔·4^{−n}: 4/3, 1/3, 1/12; switching: constant 1 | true; aperiodicity needed | none |
| §3.5 `tendsto_comp_pow_apply_singleton_of_not_exists_invariant` | SRW on ℤ | p_{2n}(0,0)=C(2n,n)/4ⁿ≈(πn)^{−½}→0; tvDist(·,0)=1 | true | none |
| §3.5 countable formula | count on ℕ vs 0 | tvDist=0 (etvDist=∞ → toReal 0) vs sum ∞: finiteness needed | true as revised | none |
| §3.6 hard-core | one edge, λ=1, 2, ⅓ | π=(1,λ,λ)/(1+2λ); π(∅)P(∅→u)=λ/(2(1+λ))=π(u)P(u→∅) | true; source treats λ=1 grid | C02 |
| §4.4 increments {0,a} | q=½, t=3a/2; t=0 | k=1, m=(k+1)/q−1=3; N₀ law q(1−q)^j, matches Tassion Prop 5.2 | true | none |
| §5.2 `tendstoInDistribution_renewalCountNat` | Exp(λ) increments | μ=σ=1/λ: σ√(t/μ³)=√(λt); variant σ√(t/μ)=√(t/λ) | true | none |
| §5.3 `IsLatticeSpan`, `tendsto_renewalFunction_lattice` | Unif{1,2}; Unif{2,4}; ½δ₀+½δ₁; δ₀ | U{n}=⅔+⅓(−½)ⁿ→⅔; U{2n}→⅔; U{n}=2=a·r; δ₀: no maximal span, vacuous | true | none |
| §5.3 spans d/k | atoms n_i·a, gcd G | spans exactly Ga/k; maximal Ga | true | none |
| §5.4 `tendsto_renewalFunction_add_sub` | Exp(λ); δ₁ | λh exactly; δ₁: 0 and 1 alternately, no limit | true; nonlattice needed | none |
| §6.2 renewal equation at 0 | increments {0,a}, q | g(0)=h(0)/(1−F{0})=(1−q)/q=m(0) | true | none |
| §6.3 `tendsto_renewalConv_conv_renewalMeasure` | Exp(λ); h=1_{[0,c)} | λ∫₀ᵗh→λ∫h; m(t)−m(t−c)→c·r | true | none |
| §6.4 `tendsto_measureReal_renewalExcess_le` | Exp(λ); δ_a; μ=∞ | 1−e^{−λx}=λ∫₀ˣe^{−λs}ds; δ_a: periodic in (0,a], no limit; μ=∞: 0 | true | none |
| §7.1 exponential renewals | Exp(λ) | P(N_t=0)=e^{−λt}=P(T₁>t); Tassion Thm 9.3 equivalences | true | none |
| §7.2 microscopic characterization | Poisson; doubled Poisson | λh·e^{−λh}; doubled: P(N_h≥2)=1−e^{−λh}∼λh | true | none |
| §7.3 restart, discretisation | two steps of i+Poi(λΔ) | i+Poi(2λΔ) by Poisson convolution | true; duplicates supplier corollary | C04 |
| §7.4 thinning, superposition | rates 1 and 2; p=0, 1 | P(N₁=0)=e^{−3} vs maximum e^{−2}; p=0: kept process zero | true | none |
| `firstReturn`, `meanReturn` | one state; absorbing chain from 0 | T⁺=1, m=1; T⁺=⊤, m=⊤ via if-branch | determine the object | none |
| Convention 10, `tvDist` | δ₀, δ₁ | variation of δ₀−δ₁ on univ = 2 (Mathlib, [0,2] normalisation) | matches | none |

- Source locators checked against the text: the 15 sampled sections against Tassion2025, about 45 numbered statements opened between pp. 9 and 95. All support the README, except the special cases noted in C02.
- Library declarations: all 205 qualified names the README cites elaborate with `#check` at the pins. Opened in source:
  - Mathlib: `IsIrreducible` (`Probability/Kernel/Irreducible.lean` line 56), `IsReversible` (`Invariance.lean` line 58), `etvDist`/`tvDist` (`TotalVariation/Defs.lean` lines 51–62), `Adapted` (`Process/Adapted.lean` line 59), `TendstoInDistribution` (`ConvergenceInDistribution.lean` line 64), the CLT (`CentralLimitTheorem.lean` line 122) and `geometricMeasure` (`Distributions/Geometric.lean` line 52).
  - Tau Ceti: `renewalCount`, `renewalCountNat`, `renewalExcess`, `renewalConv`, `renewalMeasure`, `renewalFunction`, `Reaches`, `period`/`IsAperiodic`.
- No headline is proved at the pinned Tau Ceti: the pinned tree has no Blackwell, Kac, occupation-frequency, renewal-CLT or hard-core declaration.
- Cross-roadmap citations resolved:
  - Cited by this roadmap: StochasticCalculus §0.6 (main, lines 785–866), StandardDistributions Layers 0–5 and 7 (main), and Exchangeability Layer 8 (Completed).
  - Citing this roadmap: the five roadmaps on main and the three open ones. Every id they cite still exists, §0.3 through the table.
- Automatic checks: a rerun passes every check. The dependency check reports `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`, with no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and no error. `#check @name` on all 16 declarations gives the README's statements, except that `isReversible_iff_singletons` is narrower (C05). `firstReturn` and `meanReturn` drop section instances their types do not use, which is harmless for definitions.
- One-tactic probe (`rfl`, `infer_instance`, `simp`, `aesop`): none of the 12 theorems closes.
- Wording: a six-word n-gram scan of the README and `Suggested.lean` against Tassion2025 finds a longest shared prose run of 8 words, the statement of Theorem 3.13, which the mathematics forces.

Overlap check: read MarkovChainMixing, PopulationDynamics, PoissonApproximation, StochasticCalculus (main and its open revision), MarkovDecisionProcesses, MathematicalStatisticsFoundations and PointProcesses.
- The first three, MarkovDecisionProcesses and MathematicalStatisticsFoundations consume from this roadmap; it owns what they cite.
- The restart property of the Poisson process is owned by StochasticCalculus §0.6 for every filtration; this roadmap owns the natural-history corollary, and only its route duplicates (C04).
- PointProcesses (open, never cited) owns general thinning and superposition; §7.4 states the temporal case only.
- Nothing else is shared.

Source independence: 22 passages compared with 1 source (Tassion2025), plus an n-gram scan of the whole text: none copied, longest shared prose run 8 words. Largest share: Tassion2025, 26 of 48 locators. Contents compared with Tassion2025: Layers 0–3 and 4–6 parallel Chapters 1–4 and 5–6, in an order the *Needs:* lines force (Layer 1→0, 2→1, 3→2, §5.3→Layer 3, §6.3→§5.4). That arrangement is inherited from main and is no finding; the sentence claiming the correspondence is C03.

Research link: Layers 5–6 are Blackwell's renewal theorem and the key renewal theorem (Feller 1971, vol. II, Ch. XI), which ProbabilisticAndMetricNumberTheoryPartII consumes. Layers 2–3 are the equilibrium theory on which MarkovChainMixing builds the quantitative mixing bounds of Levin and Peres (2017). This rests on the README's Downstream consumers and References and on those roadmaps' READMEs.

## Not verifiable

- Norris1997, Chapter 1 (13 locators): Cambridge University Press book; the author's chapter PDFs on the Cambridge statistics server could not be fetched (certificate failure).
- Feller1971, vol. II, Chapter XI (6 locators): Wiley book; no legal open copy was found, and the DOI resolves to a paywalled page.
- LastPenrose2017, Chapters 3 and 5 (2 locators): the author-page link at KIT redirected to a landing page.
- The Zulip archive discussion cited in §1.1 for motivation was not opened.

## Source issues

- **Gap** in Tassion2025 at §6.8 (application to the excess time), p. 64: the source applies the key renewal theorem to the forcing h_x through an unstated criterion of direct Riemann integrability, while Theorem 6.7 covers only nonincreasing forcing; it should apply Theorem 6.7 to the nonincreasing tail P(T₁ > t + x), or state and prove the criterion; affects the proof.
- **Gap** in Tassion2025 at Theorem 3.4, p. 26: the proof applies the law of large numbers to the inter-visit times also when m_x = ∞, without saying why it extends to infinite mean; it should cite or prove the infinite-mean form, by truncation; affects the proof.
- **Misprint** in Tassion2025 at Proposition 3.10(ii), proof, p. 29: the source concludes that m_x < ∞ implies m_y = ∞; it should conclude m_y < ∞; affects the proof.
- **Misprint** in Tassion2025 at Proposition 2.7, proof, p. 20: the event after the stopping time is written with n ≥ 0, which is sure; it should be n ≥ 1, giving P_x(T₁ < ∞); affects the proof.
- **Misprint** in Tassion2025 at Proposition 5.1, p. 48: the exponential distribution function is written 1 − e^{λt}; it should be 1 − e^{−λt}; affects nothing.
- **Misprint** in Tassion2025 at Theorem 9.3, proof of (iii) ⇒ (i), p. 91: the source writes e^{−A}(1 + λA/n)^n and a density with e^{λ y_k}; they should read e^{−λA}(1 + λA/n)^n and e^{−λ y_k}; affects nothing.

## For the human reviewers

- Licence: Tassion2025 was read from ETH Zürich's course server (metaphor.ethz.ch), which the source service does not classify. This review classed it as institutional lecture notes posted by the lecturer.
- Arrangement: Layers 0–3, and §§3.1–3.6 within Layer 3, parallel Tassion2025 Chapters 1–4 and §§4.1–4.9 in the same order. The order is the one the *Needs:* lines force and is inherited from the roadmap on main; this review raised no finding.
