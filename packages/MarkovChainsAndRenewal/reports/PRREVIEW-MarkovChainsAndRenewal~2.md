# Review of MarkovChainsAndRenewal (pull request #2605 at 1508422)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, Check and worked example was recomputed and is true; every headline theorem of the README is stated in `Suggested.lean` at the README's generality; the file elaborates with only `sorry` warnings; and the fifteen sampled sections are supported by Tassion's notes at the numbered statements listed in C01. The head is the one the previous review read, so its seven small corrections and two format notes stand, and this review adds one: the Check given for the null-recurrent limit of §3.5 is a period-2 chain, outside the aperiodicity hypothesis of the theorem it illustrates (which does not need that hypothesis). There are eight small corrections and two format notes, none blocking. Two things are left for a human: the licence class of the notes' host, and the parallel between the layers and the notes' chapters.

## C01 — The locators into the main source are chapter ranges, so a cited result cannot be found without reading up to forty pages

Layers 0–3 cite "Tassion, Chapters 1–4" throughout (for example §3.2, line 431), Layers 4–5 "Chapter 5", Layer 6 "Chapter 6" and Layer 7 "Chapters 7–9". The numbered statements below were read in the notes and support the sections named; they could replace the ranges.

- **Layer 0.** §0.2: Definition 1.3 (p. 9), Proposition 1.1 (p. 10), Proposition 2.5 (p. 18); the multi-time formula itself is not stated in the notes and follows from these three. §0.4: Lemma 1.2 and Proposition 1.3 (pp. 10–11).
- **Layer 1.** §1.2: Theorem 2.2 and Corollary 2.4 (pp. 17–18). §1.3: Theorem 2.6 (p. 19). §1.4: Propositions 2.7–2.8 (pp. 20–21).
- **Layer 2.** §2.2: Definition 3.1, Theorem 3.1, Corollary 3.3 (pp. 23–24), Definition 3.2 (p. 25). §2.3: Proposition 3.10, Theorems 3.12–3.13, Corollary 3.15, Propositions 3.17–3.18 (pp. 28–32). §2.4: Theorems 3.4–3.5 (pp. 25–26).
- **Layer 3.** §3.1: Definitions 4.1–4.2, Proposition 4.1 (pp. 34–35). §3.2: Theorem 4.2 and Lemma 4.3 (p. 35). §3.4: Propositions 4.8–4.13, Lemma 4.14. §3.5: Theorems 4.15–4.16, Lemma 4.17. §3.6: Proposition 4.18 (p. 44).
- **Layers 4–6.** §4.4: Propositions 5.1–5.2 (pp. 48–49). §5.2: Theorem 5.6 (p. 52). §5.3: Definition 5.4 and Theorem 5.12 (p. 54). §5.4: Theorem 5.13 (p. 55). §6.2: Proposition 6.4, Theorem 6.6 (pp. 59–61). §6.3: Theorem 6.7 (p. 63). §6.4: Proposition 6.5 (p. 60) and §6.8 (pp. 64–65).
- **Layer 7.** §7.1: Theorem 9.3 (p. 90). §7.2: Theorem 9.4 (p. 92). §7.3: Theorem 9.7 (p. 93). §7.4: Theorems 9.9 and 9.11 (pp. 94–95).

The notes state Theorems 5.6 and 5.12 with the proofs left to exercises and Theorem 5.13 with the proof admitted, so §5.2–§5.4 rest on Feller for proofs; the Norris and Feller citations need theorem numbers in the same way.

## C02 — Four sections cite the notes for statements more general than the notes prove

§1.1–§1.3 state the Markov and strong Markov properties for an arbitrary filtration; the notes fix `F_n = σ(X_0, …, X_n)` (Tassion2025 line 378) and prove Theorems 2.2 and 2.6 for it only. §2.4 states almost sure convergence of the occupation frequency from every initial law; Theorem 3.4 is under `P_x` and Theorem 3.5 gives only the expectation from a general law. §3.6 states the hard-core chain on any finite graph at activity λ > 0; the notes' §4.9 treats the 8×8 grid with a fair coin, where the law is uniform (Tassion2025 lines 1320–1352).

All four statements are true as written (the general hard-core balance is `π(I) · λ/((1 + λ)|V|) = λπ(I) · 1/((1 + λ)|V|)`; the others follow by the routes the README gives). A reader is only told that the source proves more than it does. Qualifying the citations would repair it, for example "(natural filtration: Tassion, Theorem 2.2)", "(under `P_x`: Tassion, Theorem 3.4)" and "(λ = 1 on a grid: Tassion, Proposition 4.18)".

## C03 — The References say that the layers correspond to the main source's chapters

Line 1020 reads "Chapters 1–4 correspond to Layers 0–3, Chapter 5 to Layers 4–5 and Chapter 6 to Layer 6". A roadmap's organisation is its own, and here the order is the one the *Needs:* lines force, so the sentence presents the plan as something it is not. Deleting the correspondence clause and keeping "The main source", with what it is cited for, would repair it.

## C04 — §7.3 plans its own proof of a restart property that StochasticCalculus §0.6 already plans for every filtration

§7.3 (lines 790–795) asks for a proof, by cylinders and a π–λ argument, that `(N_{t+s} − N_t)` is a rate-λ Poisson process independent of the natural history. StochasticCalculus §0.6 on main plans that argument for an arbitrary filtration and passes to the natural filtration of N (`TauCetiRoadmap/StochasticCalculus/README.md` lines 796–802). The README already says its statement is this specialisation.

The smallest repair is to state the first claim of §7.3 as StochasticCalculus §0.6 for the natural filtration of N, keep "has the law of N" as the addition, and drop the π–λ route. The discretised chain `(N_{nΔ})` stays the target of §7.3.

## C05 — `isReversible_iff_singletons` assumes a probability measure, while §3.1 states the singleton test for every π

`Suggested.lean` line 77 has `[IsProbabilityMeasure π]`; README §3.1 (lines 405–408) puts no condition on π. The test holds for every measure on a countable space with measurable singletons, since both sides of Mathlib's `IsReversible` (`Mathlib/Probability/Kernel/Invariance.lean` line 58) are countable sums in `ℝ≥0∞` of the terms `π {x} * κ x {y}`. Dropping the binder, or writing "a probability π" in §3.1, would make the two agree.

## C06 — §1.4 and §2.4 ask for proofs of facts that are at the pins

§1.4 opens "Prove that the first entrance, the first return and the successive visits are stopping times … and that the shifts `θ_n` … are measurable" (line 274); these are Mathlib's `MeasureTheory.Adapted.isStoppingTime_hittingAfter` and Tau Ceti's `MeasureTheory.Adapted.isStoppingTime_successiveVisit` and `TauCeti.Probability.measurable_shift_iterate`, as the section's own *Needs:* line records. §2.4 says "Supply the consequence of the strong law … of infinite mean, that their averages tend to infinity almost surely, by truncation" (lines 371–374); that is `TauCeti.Probability.strong_law_ae_real_of_lintegral_eq_top` (`TauCeti/Probability/StrongLaw.lean` line 154), proved by truncation for pairwise independent nonnegative variables, and the README names it nowhere.

An implementer reading "Prove" or "Supply" may redo them. Saying "are stopping times (…)" with the declarations, keeping only the measurability of concatenation as a target of §1.4, and citing the Tau Ceti strong law in §2.4 and its *Needs:* line would repair both.

## C07 — The description says that every Check names the wrong convention it rules out, but about ten do not

The description says "Each Check says what a plausible wrong convention would give". Of the 42 Checks, the first Checks of §3.1, §3.2, §5.4, §6.3, §6.4 and §7.4, the second Check of §3.2, the first of §7.2, and the Checks of §7.1 and §7.3 do not. "Most Checks say …" would be accurate.

## C08 — The Check for the null-recurrent limit of §3.5 is a period-2 chain, outside the aperiodicity hypothesis of the theorem it illustrates

The fourth Check of §3.5 (line 501) uses the simple symmetric random walk on ℤ to illustrate `tendsto_comp_pow_apply_singleton_of_not_exists_invariant`, which assumes `κ.IsAperiodic`; the walk has period 2 (`p_n(0, 0) = 0` for odd n), so it is not an instance, and a reader cannot tell whether the hypothesis matters. The Check's assertion is true: `p_{2k}(0, y) ≤ C(2k, k)/4^k → 0`.

In fact the limit holds without aperiodicity. For period d, `p_{nd+r}(x, y) = ∑_z p_r(x, z) · p_{nd}(z, y)` with z in the cyclic class of y, and `κ^d` on that class is irreducible, aperiodic and null recurrent or transient, so each term tends to zero and dominated convergence applies. Either option would do: say in §3.5 that the hypothesis is kept for the product-chain route and that the walk shows the conclusion beyond it, or replace the walk by an aperiodic example such as the lazy walk (stay with probability 1/2), for which `p_n(0, 0) → 0` as well.

## N01 — The Layer 1 heading uses a non-standard term

"Deterministic and strong Markov properties" (line 197): the property at fixed times is the simple Markov property in the literature.

## N02 — Two dependency summaries omit an edge that the *Needs:* lines record

Layer 2's Dependencies (line 399) does not say that §2.3 uses the later §2.4 (line 354). "How to read the build" (line 48) lists Layers 0, 4 and 5 for Layer 7, without the §1.1 that Layer 7's Dependencies (line 828) adds.

## Verified sound

| Statement | Instances tried | Values computed (roadmap / independent) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.2 multi-time cylinders | 3-cycle from 0; times 0<2<3, states 0,2,0 | formula 1·p₂(0,2)·p₁(2,0)=1; path probability 1; one-step variant κ0{2}·κ2{0}=0 | true | C01 |
| §0.4 sampler | weights (½,0,½); weights 2^{−(k+1)} | c=(0,½,½,1): state 1 gets ∅; c_k=1−2^{−k}, u=1 uncovered; Tassion Lemma 1.2 same half-open intervals | true | none |
| §1.1 filtration Markov property | iid fair bits, F_n=σ(X₀…X_{n+1}) | P(X_{n+1}=1∣F_n)=1{X_{n+1}=1}, not ½ | Check true | C02 |
| §1.2 path-valued Markov property | Tassion Thm 2.2, Cor 2.4 | source conditions on X_k=x with F_k natural; README form with general F follows by tower | true; source narrower | C02 |
| §1.3 strong Markov | last exit L; κ0{0}=κ0{1}=½, κ1{1}=1 | P(X_{L+1}=0)=0 against P₀(X₁=0)=½ | Check true | C02 |
| §1.4 return gaps | 3-cycle from 0 | gap 3 = excursion length 2 + 1 | true | C06 |
| §2.2 visits | κ0{0}=κ0{1}=½, κ1{1}=1; absorbing chain | ρ=½, P(V≥k)=2^{−k}, 𝔼V=ρ/(1−ρ)=1, G=2; P(V=k)=(1−p)^k p with p=½ matches `geometricMeasure`; ρ₀=0, m₀=∞ | true | none |
| §2.3 class properties | {0,1,2}: 0→{0,1}, 1↔2 | {0} transient, not closed; {1,2} closed, m₁=m₂=2; Tassion Thm 3.13, Prop 3.17–3.18 | true | none |
| §2.4 `ae_tendsto_occupation_div` | switching chain; absorbing chain from 0 and from 1 | V₀(n)/n→½=1/m₀; reached, m₀=⊤: (⊤)⁻¹.toReal=0; unreached: if-branch 0 | true | C02, C06 |
| §3.1 `isReversible_iff_singletons` | two-state a,b; 3-cycle; infinite π | π₀a=ab/(a+b)=π₁b; cycle ⅓ against 0; sums in ℝ≥0∞ need no finiteness | true; Lean narrower | C05 |
| §3.2 `exists_invariant_probability_iff` | a=½, b=¼; SRW on ℤ | π=(⅓,⅔), all m finite; SRW: counting measure invariant, no probability, m₀=∞ | true | none |
| §3.2 `invariant_mass_eq_inv_meanReturn` | a=½, b=¼; one state; L-cycle | m₀=(1−a)+a(1+1/b)=3=1/π₀; m=1, π=δ; m=L, π=1/L | true | none |
| §3.2 `existsUnique_invariant_probability` | one state; 2-cycle | δ_x; uniform, unique although periodic | true | none |
| §3.4 coupling | switching chain from 0 and 1 | never meet; tvDist=2=2·P(τ>n); product: (0,1)↔(1,0) only | true | none |
| §3.5 `tendsto_tvDist_comp_pow` | a=½, b=¼ from 0; switching chain | (⅔,−⅔)·4^{−n}: 4/3, 1/3, 1/12; switching: \|1−½\|+\|0−½\|=1 for all n | true; aperiodicity needed | none |
| §3.5 `tendsto_comp_pow_apply_singleton_of_not_exists_invariant` | SRW on ℤ (period 2); lazy SRW | p_{2k}(0,0)=C(2k,k)/4^k→0, odd terms 0; holds for period d by cyclic classes | true; hypothesis not needed | C08 |
| §3.5 countable formula | δ₀, δ₁; count on ℕ against 0 | 2 = \|1−0\|+\|0−1\|; infinite measure: `etvDist`=∞, `tvDist`=0, sum ∞ | true with finiteness | none |
| §3.6 hard-core | one edge; λ=1, 2, ⅓ | π=(1,λ,λ)/(1+2λ); π(∅)P(∅→u)=λ/(2(1+λ))=π(u)P(u→∅); stay at ∅: 1/(1+λ) | true; source has λ=1 grid | C02 |
| §4.4 increments {0,a} | q=½, t=0 and 3a/2; q=1 | k=1: m=(k+1)/q−1=3; m(0)=1; P(N₀=j)=q(1−q)^j; q=1: ⌊t/a⌋; Tassion Prop 5.2 | true | none |
| §5.2 `tendstoInDistribution_renewalCountNat` | Exp(λ); t=0 | μ=σ=1/λ: σ√(t/μ³)=√(λt); variant √(t/λ); var>0 forces mean>0; t=0 junk off the limit | true | none |
| §5.3 `IsLatticeSpan`, `IsLattice`, spans | δ₀; atoms at n_i·a | δ₀: every a>0 a span, no maximal one; else spans = d/k with d=a·gcd(n_i), by Bézout | true | none |
| §5.3 `tendsto_renewalFunction_lattice` | Unif{1,2}; Unif{2,4}; ½δ₀+½δ₁; δ₀ | U{n}=1, ½, ¾, ⅝→⅔=a/μ; U{2n}→⅔, span 1 predicts ⅓; U{n}=2=1/(½); δ₀ excluded by maximality | true | none |
| §5.4 `tendsto_renewalFunction_add_sub` | Exp(λ); δ₁; δ₀ | λh exactly; δ₁: 0 and 1 alternately; δ₀ is lattice, so m finite under the hypothesis | true; nonlattice needed | none |
| §6.2 renewal equation at 0 | increments {0,a}, q | g(0)=h(0)·U{0}=h(0)/(1−F{0}); (1−q)/q=m(0) of §4.4 | true | none |
| §6.3 `tendsto_renewalConv_conv_renewalMeasure` | Exp(λ); h=1_{[0,c)}; μ=∞ | λ∫₀ᵗh→λ∫h; m(t)−m(t−c)→c·r; h∗U differs by h(t)→0; limit 0 | true | none |
| §6.4 `tendsto_measureReal_renewalExcess_le` | Exp(λ); δ_a; μ=∞ | 1−e^{−λx}=λ∫₀ˣe^{−λs}ds; δ_a: E_t cycles through (0,a]; tail route 1−(1/μ)∫ₓ^∞F̄ | true | none |
| §7.1 exponential renewals | Exp(λ) | P(N_t=0)=e^{−λt}=P(T₁>t); Tassion Thm 9.3 (i)⇔(ii)⇔(iii) | true | none |
| §7.2 microscopic characterization | Poisson; doubled Poisson | λh·e^{−λh}=λh+o(h); doubled: P(N_h≥2)=1−e^{−λh}∼λh | true | none |
| §7.3 restart, discretisation | two steps of i+Poi(λΔ) | i+Poi(2λΔ) by Poisson convolution | true; supplier plans the restart | C04 |
| §7.4 thinning, superposition | rates 1 and 2; p=0, 1 | P(N₁=0)=e^{−3}, maximum gives e^{−2}; p=0: kept process zero; Tassion Thm 9.9, 9.11 | true | none |
| `firstReturn`, `meanReturn` | one state; absorbing chain from 0 | T⁺=1, m=1; T⁺=⊤, m=⊤ by the if-branch; m∈[1,∞] | determine the object | none |
| Layer 2 examples | walk p=⅔ | ρ₀=1−\|p−q\|=⅔; G=1/(1−ρ)=3=1/√(1−4pq)=1/√(1/9) | true | none |

- Previous review: it had no finding to repair. The head is unchanged, so its seven small corrections and two format notes stand as C01–C07 and N01–N02; C02 and C06 gain one item each and C08 is new.
- Source locators checked against the text: the 15 sampled sections against Tassion2025, 47 numbered statements opened between pp. 9 and 95 (listed in C01); all support the README, with the narrower cases of C02.
- Library declarations opened at the pins: Mathlib `Kernel.IsIrreducible` (`Probability/Kernel/Irreducible.lean` line 56), `Kernel.IsReversible` (`Probability/Kernel/Invariance.lean` line 58), `etvDist`, `tvDist` (`MeasureTheory/Measure/TotalVariation/Defs.lean` lines 51–62; `VectorMeasure/TotalVariation.lean` line 41), the central limit theorem (`Probability/CentralLimitTheorem.lean` line 122), `strong_law_ae` (`Probability/StrongLaw.lean` line 787), `geometricMeasure` (`Probability/Distributions/Geometric.lean` line 52), `Filtration.natural` (`Probability/Process/Filtration.lean` line 435); Tau Ceti `arrival`, `renewalCount` (`Probability/Renewal/Basic.lean` lines 84, 121), `renewalCountNat` (`Count.lean` line 46), `renewalConv` (`Equation.lean` line 84), `renewalExcess` (`Excess.lean` line 82), `renewalMeasure`, `renewalFunction` (`Measure.lean` lines 82, 145), `returnLengths`, `period`, `IsAperiodic` (`Probability/MarkovChain/Period.lean` lines 70, 83, 108), `strong_law_ae_real_of_lintegral_eq_top` (`Probability/StrongLaw.lean` line 154).
- No headline is proved at the pins: the pinned libraries have no Blackwell, key-renewal, Kac, occupation-frequency, renewal-CLT, excess-limit or countable total-variation statement, and no lemma on `IsReversible` beyond `IsReversible.invariant`.
- Cross-roadmap citations resolved: StochasticCalculus §0.6 (main, lines 785–866) and StandardDistributions Layers 0–5 and 7 (main) carry what the supplier contracts say; Exchangeability is under Completed. The five consumers on main and the open ones (MarkovChainMixing, PopulationDynamics, PoissonApproximation, HiddenMarkovModels, ClassicalErgodicTheory) cite ids that all still exist, §0.3 through the table.
- Dependency check: `depcheck: 200 roadmaps, 2196 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder. The automatic checks all passed.
- Elaboration: `lake env lean` on `Suggested.lean` gives 12 `sorry` warnings and no error. The 16 elaborated types agree with the README except C05; `firstReturn` and `meanReturn` lose only instances their bodies do not use. One-tactic probe (`rfl`, `simp`, `infer_instance`) on scratch copies: none of the 12 theorems closes.
- Headlines: occupation frequencies, the invariant-probability criterion, Kac, the finite case, both convergence theorems, the renewal CLT, both Blackwell theorems, the key renewal theorem and the excess limit are all stated; the docstring names none as not statable, correctly.

Overlap check: read MarkovChainMixing, PopulationDynamics, PoissonApproximation, PointProcesses, StochasticCalculus, MarkovDecisionProcesses and MathematicalStatisticsFoundations. The restart property of the Poisson process: StochasticCalculus §0.6 owns it for every filtration, this roadmap states the natural-history case (C04). The coupling inequality: this roadmap owns the meeting-time form, MarkovChainMixing 4.1 the Markovian-coupling form, as it says. Temporal thinning and superposition are here; the general theorems are PointProcesses', which is not cited. Everything else those roadmaps name is consumed from here; nothing else is shared.

Source independence: 22 passages compared with 1 source (Tassion2025; Norris, Feller and Last–Penrose could not be read), none shared beyond statements the mathematics forces (longest: Theorem 3.13); largest share Tassion2025, 26 of 48 locators; contents compared with Tassion2025: Layers 0–3, 6 and 7 parallel Chapters 1–4, 6 and 9 in an order the *Needs:* lines force (§2.2–§2.4 need §1.3–§1.4, §3.2 needs §2.3, §5.3 needs §3.2 and §3.5, §6.3 needs §5.4), with scope differences (filtration-relative §1.1, Layer 2 reordered, Chapter 5 split over Layers 4–5, infinite-mean and zero-increment cases); no finding, see C03 and the human reviewers' section.

Research link: Layers 5–6 are Blackwell's and the key renewal theorem (Feller 1971, vol. II, Ch. XI), consumed by ProbabilisticAndMetricNumberTheoryPartII; Layers 2–3 are the equilibrium theory (Norris 1997, Ch. 1) on which MarkovChainMixing builds quantitative mixing. Rests on the README's References and Downstream consumers and on those roadmaps' READMEs.

## Not verifiable

- Norris1997, Chapter 1 (13 locators): Cambridge University Press book; no legal open copy found through the publisher's landing page.
- Feller1971, vol. II, Chapter XI (6 locators): no legal open copy found; the citation resolves to a paywalled page.
- LastPenrose2017, Chapters 3 and 5 (2 locators): the publisher's landing page only; no open copy fetched.
- The Zulip archive discussion cited in §1.1 for motivation was not opened.

## Source issues

- **Gap** in Tassion2025 at §6.8 (application to the excess time), p. 64: the source applies the key renewal theorem to the forcing h_x by calling it directly Riemann integrable through a proposition it does not state, while Theorem 6.7 covers nonincreasing forcing; it should apply Theorem 6.7 to the nonincreasing tail P(T₁ > t + x), or state and prove the criterion; affects the proof.
- **Gap** in Tassion2025 at Theorem 3.4, proof, p. 26: the source applies the law of large numbers to the inter-visit times also when m_x = ∞, with only a remark that this case is included; it should cite or prove the infinite-mean form, by truncation; affects the proof.
- **Misprint** in Tassion2025 at Proposition 3.10(ii), proof, p. 29: the source concludes that m_x < ∞ implies m_y = ∞; it should conclude m_y < ∞; affects the proof.
- **Misprint** in Tassion2025 at Proposition 2.7, proof, p. 20: the event after the stopping time is written with n ≥ 0, which always holds; it should be n ≥ 1, giving P_x(T₁ < ∞); affects the proof.
- **Misprint** in Tassion2025 at Proposition 5.1, p. 48: the exponential distribution function is written 1 − e^{λt}; it should be 1 − e^{−λt}; affects nothing.
- **Misprint** in Tassion2025 at Theorem 9.3, proof of (iii) ⇒ (i), p. 91: the source writes e^{−A}(1 + λA/n)^n and a density with e^{λ y_k}; they should read e^{−λA}(1 + λA/n)^n and e^{−λ y_k}; affects nothing.

## For the human reviewers

- Licence: Tassion2025 was read from ETH Zürich's course server (metaphor.ethz.ch), a host with no recorded licence class; this review treated it as institutional lecture notes posted by the lecturer.
- Scope: the source with the largest share of locators (26 of 48) is unpublished lecture notes; the published texts cited beside it (Norris 1997, Feller 1971, Last–Penrose 2017) could not be read here.
- Arrangement: Layers 0–3, and §§3.1–3.6 within Layer 3, parallel Tassion2025 Chapters 1–4 and §§4.1–4.9 in order, and README line 1020 says so; the order is dependency-forced and inherited from main, so no finding was raised.
