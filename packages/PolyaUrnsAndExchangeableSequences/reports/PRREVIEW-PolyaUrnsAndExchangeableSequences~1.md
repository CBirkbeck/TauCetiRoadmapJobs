# Review of PolyaUrnsAndExchangeableSequences (pull request #3195 at 0d47d46)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of 1.1–3.4 was recomputed (degenerate weights, `n = 0`, the junk value `x / 0 = 0`, both directions of the equivalence in 2.1) and compared with its Lean signature, and no false or unsupported sentence was found; the Pemantle, Wagenmakers–Zabell–Gronau and Pólya locators agree with the texts. There is one small correction and one format note, neither blocking. Left for a human: the Durrett locators could not be read from a legal copy, and whether one classical textbook example is a roadmap-sized subject.

## C01 — Targets 1.1, 1.2, 1.3 and 3.4 carry no source locator in their layer

A reader of Layer 1 cannot tell from the layer where the word probability and exchangeability are stated in the literature: 1.1 and 1.2 end with `*Needs:*` only (README lines 76 and 99), although the References entry for Pemantle already attributes exactly these two results to §2.2. I read that passage: Pemantle2007 line 309 (Lemma 2.5, exchangeability, for real initial contents `a, b > 0` as set up at line 179) and lines 316–320 (equation (2.5), the product formula of 1.1). Adding "Source: Pemantle, §2.2, Lemma 2.5 and equation (2.5)" to the `*Needs:*` lines of 1.1 and 1.2 would settle those two.

Targets 1.3 (the beta-binomial count, line 121) and 3.4 (the conditional expectation, line 355) have no locator anywhere in the README. Both are proved in full in the text, so nothing is unsupported; a locator for each, or a clause saying that the statement is a direct consequence of 1.1 (respectively of 3.1 and Mathlib's convergence theorem) with no separate source, would make that explicit.

## N01 — Two steps the routes re-derive are already declarations of the pinned Tau Ceti

The identity `x⁽ᵐ⁾ = Γ(x + m)/Γ(x)` is derived "by induction on `m` from `Real.Gamma_add_one`" in 1.3, 2.1 and 2.2 (lines 116, 162, 211); the pinned Tau Ceti has it as `Real.Gamma_add_nat_div_Gamma_eq` (`TauCeti/Analysis/SpecialFunctions/Gamma.lean`, line 120, for `x` not a non-positive integer). The cylinder argument in the forward direction of 2.1 (lines 166–171) is `measure_eq_of_prefixProj_map_eq` (`TauCeti/Probability/Process/PathLaw/FiniteMarginals.lean`, line 62: two measures on `ℕ → α`, one finite, with equal prefix marginals are equal). The routes are correct as written; citing the two would shorten them.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `polyaWordProb` (definition) | `a=b=1`, `w=(T,F,T)`; `a=1,b=2`, `w=(T,T)`; `n=0` | `(1/2)(1/3)(2/4)=1/12`; `(1/3)(2/4)=1/6`; empty product `1` | matches README Conventions and the Lean body (`j < i`, denominator `a+b+i`) | none |
| 1.1 `polyaWordProb_eq` | all words of length ≤ 6, `a,b ∈ {0,1,−1,1/2,−3/2,2,−2,5/3}` (8128 cases, exact rationals, `x/0=0` on both sides) | 0 mismatches; `1⁽²⁾·1⁽¹⁾/2⁽³⁾ = 2/24 = 1/12` | true for all real `a, b` | none |
| 1.2 exchangeability | `σ` a transposition, `w=(T,F)`, `a=1,b=2`; Tau Ceti `Exchangeable` opened | `P(T,F)=(1/3)(2/4)=1/6`, `P(F,T)=(2/3)(1/4)=1/6`; non-independence `1/6 ≠ 1/9` | true; definition is `blockLaw … (σ i).val = prefixLaw` for all `n` | C01 (locator) |
| 1.3 beta-binomial count | `a=b=1`: `k ≤ n`; `k > n`; `n=0`; invalid shapes | `C(n,k)·k!(n−k)!/(n+1)! = 1/(n+1)`; both sides `0` (`C(n,k)=0`); `δ₀`; excluded by `0<a`, `0<b` in `IsPolyaUrn` | true; mass formula is `betaBinomialMeasure_real_singleton` | C01 (locator) |
| 2.1 iff with the Beta mixture | forward and converse; `μ = 0`, `a = 0`; `b = 0` | cylinder mass `beta(a+k,b+n−k)/beta(a,b) = a⁽ᵏ⁾b⁽ⁿ⁻ᵏ⁾/(a+b)⁽ⁿ⁾`; `betaMeasure 0 b = 0` so right side holds, left fails: `ha` needed; `beta a 0 = 0` | true with `ha`, `hb`, `hX`; both negative controls correct | N01 (route) |
| 2.2 rule of succession | `a=b=1`, `k=n`; next `m` all white; `m=0` in the joint law; non-measurable `X 0` | `(n+1)/(n+2)`; `∏ (n+1+j)/(n+2+j) = (n+1)/(n+m+1)`; `μ univ = 1` from the Beta law; `hX` not implied | true; agrees with WagenmakersZabellGronau2024 eq. (1) | none |
| `drawFiltration`, 3.1 martingale | one-step identity for `(a,b)=(2/3,5/2)`, `n ≤ 4`, all `k`; wrong filtration `σ(X 0..X n)` | weighted sum `= (a+k)/(a+b+n)` exactly; `M₁ ∈ {(a+1)/(a+b+1), a/(a+b+1)}`, both `≠ a/(a+b)` (differences `b`, `a`) | true; strict `i < n` is the right filtration | none |
| 3.2 a.s. limit with Beta law | bound on 2000 random `(a,b,n,s)`; `n=0` frequency; `a=b=1` | `|Mₙ − Sₙ/n| ≤ (2a+b)/(a+b+n)` always; `0/0=0` irrelevant to the limit; uniform limit | true; agrees with Pemantle2007 Theorem 2.1 | none |
| 3.3 conditional i.i.d. given the limit | `Θ` altered on a non-Borel null set | `coinKernel ∘ Θ'` not measurable, `ConditionallyIIDWith` requires `Measurable ν` (definition opened) | true; `hΘ` needed | none |
| 3.4 proportion as conditional expectation | `n=0`; `Θ` not measurable | `a/(a+b) = E[Θ]` (`integral_id_betaMeasure`); `Θ` a.e. measurable as an a.e. limit, bounded, so integrable | true without measurability of `Θ` | C01 (locator) |
| `polyaUrnLaw`, `urnProportion` | `p ∉ [0,1]`; `n = 0` | clamp is identity a.e. (`ae_mem_Ioo_betaMeasure`); `M₀ = a/(a+b)` | determined | none |

- Source locators checked against the text: 7 (Pemantle2007 lines 179, 192–195, 309–313, 316–320, 324–328; WagenmakersZabellGronau2024 lines 55–56, 60–61; Polya1930 lines 723, 762–792).
- Library declarations opened or `#check`ed at the pins: 26 Mathlib, 22 Tau Ceti; every name is in the file the supplier contracts give.
- Cross-roadmap citations resolved: 2 (Exchangeability under `Completed/`, FiniteSamplingDiscrepancy), both on main; the collision bound and its attainment are stated there (its README lines 16–29).
- Dependency check output: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no change outside the folder.
- Elaboration of `TauCetiRoadmap/PolyaUrnsAndExchangeableSequences/Suggested.lean`: `sorry` the only warning; every elaborated signature compared with its README statement, no binder lost, nothing changed.
- One-tactic probe (`simp` with the definitions unfolded) on 7 of the 9 theorems, the other two by reading: none closes; no padding. All 9 headline theorems are statable and stated.

Overlap check: read Exchangeability, FiniteSamplingDiscrepancy, DimerModelsAndLozengeTilings, KestenStigumAndCriticalBranching, RuinTheory, RandomWalkFluctuationTheory, and StandardDistributions §9.2; nothing shared (the beta-binomial law is StandardDistributions' and is used here through `betaBinomialMeasure`; the coin-flip kernel is Exchangeability's and is used through `coinKernel`; no roadmap, pinned Tau Ceti file or pinned Mathlib file states a Pólya urn).

Source independence: 8 passages compared with 3 sources, none shared; largest share Pemantle2007, 3 of 6 in-layer locators; contents compared with Pemantle2007: independent (its §2.1 limit theorem precedes its §2.2 exchangeability; here the order 1.1 → 1.2 → 2.1 → 3.2 is the reverse and is forced by the `*Needs:*` lines). Durrett2019 could not be read.

Research link: The headline targets are Lemma 2.5 and Theorem 2.1 of Pemantle (2007), the base case of the reinforcement processes that survey treats (generalised urns, reinforced random walks), and an instance of de Finetti's theorem; rests on Pemantle2007 §2.1–2.2 as read and the README's scope paragraph.

## Not verifiable

- Durrett, *Probability: Theory and Examples*, 5th ed.: §4.3.2, pp. 226–227, Theorems 4.7.9 and 4.7.10, and the example `c = g = r = 1` of Layer 1. No legal copy could be fetched (the publisher page is closed and the online version's address could not be shown to be the author's own page), so the locators of 3.1 and half of 3.2 are unchecked; the mathematics of both was recomputed independently.
- Ownership against open pull requests was checked by search over the open heads, not by reading every folder.

Automatic checks set aside as false positives: none failed. The listing of elaborated signatures counted the word after "theorem" in the module docstring ("every theorem with `sorry`") as a fifteenth declaration; the file has fourteen.

## Source issues

- none

## For the human reviewers

- **Scope.** The nine targets are classical results on one example (Pólya 1930; a textbook section, Durrett §4.3.2); the research connection found is Pemantle's 2007 survey of reinforcement processes. Sources: one textbook, one survey, the 1930 paper, one 2024 article.
- **Not tested.** Durrett2019 could not be read from a legal place; its locators (README lines 134, 265–266, 300, 492–495) and wording were not compared. The largest-share source, Pemantle2007, was read.
