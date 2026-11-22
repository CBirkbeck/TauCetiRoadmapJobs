# Review of RuntimeAnalysisOfEvolutionaryAlgorithms (pull request #2982 at 8382851)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false. All fifteen targets were recomputed (the drift theorems by re-deriving each route and each counterexample, the OneMax, random-local-search and LeadingOnes values by exact linear algebra for `n ≤ 5`, the lower-tail bound on 2310 exact cases) and every source locator was read at its place. There are three small corrections and two format notes, none blocking. Two things are left to the human reviewers: the scope of the subject, and the fact that the supplier HittingAndCoverTimes is itself still an open pull request.

## C01 — The comparison in 1.5 says Lengler's Theorem 18 bounds the tail at a real time; the source takes the ceiling, so its bound is already at an integer time

In the source paragraph of 1.5 (README line 227) the theorem is described as giving "the bound at a real time `(r + log (X 0/xmin))/δ`", and the next sentence shows that `e^(−r)` can fail at a non-integer time. A reader concludes that the cited theorem is false as printed. It is not: Lengler2018 lines 1219–1226 (Theorem 18, p. 28) state `Pr[T > ⌈(r + ln(s0/smin))/δ⌉] ≤ e^(−r)`, with the ceiling, and the proof (line 1227) fixes that integer. The computation in the README (`P(T > 1/5) = 1 > e^(−1/10)` for the chain leaving `1` with probability `1/2`) is correct, and it explains why the ceiling is there.

Smallest change: write "with the bound at the integer time `⌈(r + log (X 0/xmin))/δ⌉`", and introduce the example as the reason the ceiling cannot be dropped. The description's "1.5 in integer time" among the statements wider than their sources would then read "1.5 for adapted processes and every real `δ`".

## C02 — The summary's guide says Layers 3 and 4 use Layer 2; Layer 4 does not, and in Layer 3 only 3.2 does

README line 42 reads "Layers 3 and 4 use Layer 2." The Dependencies of Layer 4 (line 565) say 4.1 uses 3.1 and Tau Ceti's Markov property, 4.2 uses 4.1 and 4.3 uses 4.2; those of Layer 3 (lines 478–479) give Layer 2 only to 3.2. An implementer reading the guide would wait for the fitness-level method before starting LeadingOnes. Smallest change: "3.2 uses Layer 2; Layer 4 uses only 3.1 and Tau Ceti's Markov property."

## C03 — 2.1 and 2.2 carry measurable singletons, which neither statement nor route uses, while 2.1 is announced "on a general measurable state space"

`meanHittingTime_le_of_drift` and `meanHittingTime_le_of_fitnessLevels` elaborate with `[MeasurableSingletonClass S]` (inherited from the section `variable` line; the copied `meanHittingTime` itself drops it). The route of 2.1 uses only that `A` is measurable, `piLE_eq_comap_prefix` and `markovChainLaw_map_prefix_succ_eq_compProd`, whose own hypotheses at the pin are `[MeasurableSpace α]` and `[SFinite ν]` (`TauCeti/Probability/Process/MarkovChain.lean` lines 107 and 250); 2.2 adds only the measurability of `f`. Either state the two theorems without the class (their own `variable {S : Type*} [MeasurableSpace S]`, the definition staying a verbatim copy), or say in 2.1 that measurable singletons are kept only to match HittingAndCoverTimes.

## N01 — Locators into Doerr's "Probabilistic tools" give theorem numbers without pages (2.2, 3.2, 3.3, 3.4, 3.5), while the other three sources carry pages throughout.

## N02 — The Layer 3 section comment of `Suggested.lean` ("elitist mutation chains on bit strings; OneMax") differs from the README heading ("elitist mutation chains; OneMax and lower bounds").

## Verified sound

| Statement | Instances tried | Values computed (claimed side / my side) | Result | Change |
|---|---|---|---|---|
| 1.1 additive upper | stay w.p. 2/3 else jump to −2; `δ = 0`, `X = 1`; three-path process on `{0,2}` | bound 1 vs mean 3; `ofReal(1/0)=0 < ⊤`; `P(X_t=2)=11/20`, drift `18/11`, `E[X0]=11/10`, `P(τ=⊤)=1/10` | route re-derived; Checks true | none |
| 1.2 additive lower | `X→0` or `2X−1`, `δ=1/2`; `δ=−1, X0=−1, τ=0`; `c<0` | drift `1/2`, bound 4 vs mean 2; `ofReal 1` vs 0; `c<0` forces `τ=0`, both sides 0 | true | none |
| 1.3 variable drift | start `0/1` w.p. ½, `h=1/4` below 1; `h=4` on `[1,2)`, `h(2)=1` | RHS `1+0−2=−1`, mean `1/2`; bound `1/2` vs mean 2; monotone `h` gives `≥2` | key inequality `g y ≤ g x + (y−x)/h x` checked in all three ranges | none |
| 1.4 multiplicative | `h x = δx`; jump to −1 w.p. ½; `δ=0` | `xmin/h(xmin)=1/δ`, integral `log(X0/xmin)/δ`; bound 1 vs mean 2; `ofReal(·/0)=0`, `T=⊤` | true | none |
| 1.5 tail | `δ>1`; chain `1→0` w.p. ½; `xmin=0`; base case `t=0` | `(1−δ)E X0 = −1/2 < 0=μ`; `2^(−t) ≤ e^(−t/2)`; RHS 0 vs `μ=1`; `∫_A X0 ≥ 0` from nonnegativity at `t=0` | true | C01 (source description) |
| 2.1 drift bound | two states, `q=1/2,1/3,2/5`; `g=0, δ=0`; `∫g dν=⊤` | `(1−q)/q+1=1/q`, means `2, 3, 5/2`; `0/0=0` in `ℝ≥0∞` vs mean `≥1` | telescoping re-derived | C03 |
| 2.2 fitness levels | LeadingOnes `n=3`, rate `1/3`; levels `0→1→{2,0}`; unattained level with `p i=⊤` | `345/32` vs exact `57/8`; bound 3 vs mean 4; potential still valid (`(p i)⁻¹=0`) | true | C03 |
| 3.1 definitions | `1101`, `0111`; ties, `n=2`, `p=1/3`, needle; `n=1,p=1` | oneMax 3, leadingOnes 2 and 0; means 6 (ties) and 9 (strict); `1/2` | determine the objects | none |
| 3.2 OneMax upper | `n=1..5` all starts; `n=0`; `n=1` | `n=2`: 4 (bound 6), 4 (bound 4), uniform 3; `n=3`: `189/22` (bound `99/8`), `1161/176`; equality at one zero for all `n ≤ 5`; `n=0`: `0 ≤ 0` | true | none |
| 3.3 lower tail | `n ≤ 3`, 5 objectives, all targets, rates `1/n,1/3,1/2,1`, `t ≤ 10` | 2310 distinct exact cases, 0 violations; `t=0`: both `2^(−n)`; `n=1,p=½`: `1−2^(−(t+1))` both sides | induction `p+(1−p)a_t=a_(t+1)` checked | none |
| 3.4 lower bound | `n=0,1,2`; `n=3,4,5` | RHS `0,0,0`; `0.513, 1.314, 2.317` vs exact OneMax means `6.60, 11.03, 16.11` | `(1−1/n)^s ≥ 2/n` for `s ≤ L` re-derived | none |
| 3.5 random local search | `n=1..5`, every start | `1, 3, 11/2, 25/3, 137/12` from all zeros; `n H_k` at every start; `1+kH_(k−1)+(n−k)H_k=nH_k` | true | none |
| 4.1 LeadingOnes formula | `n ≤ 5`; rates `1/n,1/3,2/3`, random local search, correlated law `1+(m mod 3)`; `p=1,n=2` | e.g. `n=4`: `350/27, 195/16, 30, 8, 465/32` exact = formula in all 25 cases; `q_1=0` gives `⊤` | independence argument holds for any mask law | none |
| 4.2 closed form | `n ≤ 5`, `p=1/3,1/2,2/3`; `n=0,1` | exact mean = `((1−p)^(1−n)−(1−p))/(2p²)` in 15 cases; `n=1`: `1/(2p)`; `n=0`: 0 | true | none |
| 4.3 rate `1/n` | `n=2..5`; `n=1` | `3, 57/8, 350/27, 10505/512`; lower bound attained at `n=2`; `n=1`: mean `1/2 <` 1 | true | none |

- Source locators checked against the text: 21 (KK2018: 10; Lengler2018: 4; DoerrTools: 5 theorem/lemma numbers; DoerrDomination: 6), one mismatch (C01).
- Library declarations opened at the pin: 28 (all exist where cited), among them `hittingAfter` (`Mathlib/Probability/Process/HittingTime.lean:66`), `Adapted.isStoppingTime_hittingAfter` (same file, 413), `bernoulliMeasure` (`Mathlib/Probability/Distributions/Bernoulli.lean:45`, mass `p` at the first point), `Real.one_sub_div_pow_le_exp_neg` (`Mathlib/Analysis/Complex/Exponential.lean:640`), `markovChainLaw` (`TauCeti/Probability/Process/MarkovChain.lean:161`), `Measure.markovChainLaw_map_shift_iterate` (`TauCeti/Probability/MarkovChain/MarkovProperty.lean:122`), `piLE_eq_comap_prefix` (`TauCeti/Probability/Process/PathLaw/Filtration.lean:35`).
- Cross-roadmap citations resolved: HittingAndCoverTimes 1.1, 1.2, 1.3 at its open head (the definition is identical character for character; `isLeast_meanHittingTime` and `meanHittingTime_ne_top_and_eq_iff` exist with the hypotheses quoted); MarkovChainsAndRenewal Layer 0 item 2 and Layer 1 item 2 on main.
- Duplication by object: no drift theorem, fitness-level bound, OneMax or LeadingOnes object in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open (searched by "additive/multiplicative drift", "fitness level", "OneMax", "LeadingOnes", "Foster", "mean hitting time", "coupon").
- Elaboration: `lake env lean` on `Suggested.lean` gives 14 `sorry` warnings and nothing else. One-tactic probe (`simp`, then `rfl`, on a copy of the file): none of the 14 theorems closes. Elaborated types compared with the README statements: all agree; the only dropped binder is `[MeasurableSingletonClass S]` on the copied `meanHittingTime`, which its body does not use.
- Automatic checks: all passed at this head. Dependency check output: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`. No change outside the roadmap folder.
- Headline theorems (README summary): additive drift upper and lower, multiplicative drift and its tail, the OneMax bounds, the random-local-search value, the LeadingOnes formula and its rate-`1/n` bounds: all stated in `Suggested.lean`; none is declared not statable.
- Pull request text: title and description agree with the head (14 theorems, 8 definitions, 3 instances; one supplier still open, named); only the phrase touched by C01.

Overlap check: read HittingAndCoverTimes, ElectricalNetworksAndRandomWalks, MarkovChainsAndRenewal, RuinTheory, PopulationDynamics, MarkovChainMixing (open) and MarkovDecisionProcesses, MarkovChainsAndRenewal, StochasticCalculus (main); the mean hitting time is owned by HittingAndCoverTimes 1.1 and copied here with attribution, the coupon-collector tail by MarkovChainMixing (not restated here); nothing else shared.

Source independence: 12 passages compared with 4 sources, none shared; largest share KK2018, 12 of 29 locators; contents compared with KK2018: independent (1.1, 1.2, 1.3, 1.4 fall in the order of its Sections 3.1, 3.2, 4, 5, an order forced by "1.3 needs 1.1" and "1.4 needs 1.3"; the scope differs: its bounded-process and hit-the-target variants are not taken, 1.5 and Layers 2–4 come from elsewhere).

Research link: Layer 1 is the drift analysis of He–Yao and Hajek in the form of Kötzing–Krejca (2018) and Doerr–Johannsen–Winzen's multiplicative drift; Layer 4 is the exact LeadingOnes runtime of Böttcher–Doerr–Neumann and Sudholt as formulated by Doerr (2018). Rests on the README's sources, read here.

## Not verifiable

- Droste–Jansen–Wegener (OneMax domination), Böttcher–Doerr–Neumann and Sudholt (exact LeadingOnes mean): cited by the README only through Doerr's two texts; the primary papers were not opened. The statements depending on them (3.2, 4.2) are proved in the README and were recomputed.
- Ownership against open pull requests was checked through the roadmap search tool over all open heads, not by reading each folder.

## Source issues

- **Error** in DoerrTools at Theorem 1.9.4 (page 39 of the arXiv PDF): the source says the optimum is found by time `(1−ε)(n−1) ln(n/2)` with probability at most `exp(−n^ε)`; it should be `exp(−n^ε / 2^ε)`, since each bit stays wrong with probability at least `2^(−ε) n^(−1+ε)`; at `ε = 1` the printed bound gives `2^(−n) ≤ e^(−n)`; affects nothing.
- **Gap** in DoerrDomination at Theorem 3, printed page 9: the source says the formula holds for every (1+1) algorithm with mutation operator as in its Algorithm 1; it should be restricted to mutations whose changed bits are independent of the parent's later bits (a mask law), as its proof assumes; affects nothing.
- **Misprint** in DoerrDomination at Theorem 3, printed page 9: the source says the reciprocal is read as infinite when `p_i = 0`; it should be `q_i = 0`; affects nothing.
- **Misprint** in DoerrDomination at Section 2.3, printed page 8: the source says LeadingOnes is the minimum of the indices `i` whose first `i` bits are ones; it should be the maximum; affects nothing.
- **Misprint** in DoerrDomination at the bullet on the (1 + 1) EA after Corollary 4, printed page 12: the source says the fitness-dependent rate gives `(e/4) n² ≈ 0.77 n²`; it should be `≈ 0.68 n²`; affects nothing.

## For the human reviewers

- Scope: the subject is runtime analysis of randomized search heuristics (theory of evolutionary computation); the README's four sources (References, README lines 668–678) are cited in their arXiv versions only, with no journal or book venue given.
- Supplier: HittingAndCoverTimes (1.1 copied, 1.3 used in 3.5) is itself an open pull request and is not yet listed in the merge order; this roadmap can merge only after it.
