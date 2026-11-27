# Review of LumpabilityAndKemenyConstant (pull request #3196 at 920f509)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or proof route was found false. All ten theorems were recomputed on degenerate and small cases, every numerical value in the Checks was recomputed by hand, every source locator was read at its place, and every library and roadmap citation was resolved. There are two small corrections (an ambiguous supplier relation in 3.2, and two open roadmaps that plan a matrix form of strong lumpability and are not both named in the scope) and three format notes, none blocking. One question is left to the human reviewers: three results are proved in the roadmap with no published statement cited.

## C01 — The route of 3.2 re-proves the invertibility of `I − P + Π₀`, which MCMCAsymptoticVariance 1.1 already lists, and the README says two different things about who supplies it

An implementer cannot tell whether 3.2 consumes that fact or proves it again. The route of 3.2 (lines 297–301) gives the whole maximum-principle argument and then says it "is the one listed in MCMCAsymptoticVariance 1.1"; the `*Needs:*` line of 3.2 (line 318) does not name MCMCAsymptoticVariance 1.1; the supplier contract (lines 478–479) lists "the invertibility argument of its 1.1 list, with its proof kept in 3.2". At its open head, MCMCAsymptoticVariance 1.1 has the bullet "`1 − P + Π` is invertible" for an irreducible chain with its stationary law, with the same argument.

The smallest change: in the route of 3.2 replace the argument by "by MCMCAsymptoticVariance 1.1, `I − P + Π₀` is invertible", add MCMCAsymptoticVariance 1.1 to the `*Needs:*` line of 3.2, and shorten the contract entry to the fact consumed. (The alternative, proving it here and consuming only the two definitions, would plan the same fact twice.)

## C02 — Two open roadmaps plan strong lumpability of a stochastic matrix; the scope names one of them and does not say that it plans this notion

A reader of the scope section cannot see where the boundary with the matrix form of the block condition lies. EquitableOperatorReduction, Layer 5 (its README line 187), lists among its adapters "row-stochastic and column-stochastic matrices, strong lumpability, and the induced quotient chain"; DiscreteQuantumWalks, Layer 4 (its README line 144), lists "strong lumpability of a stochastic matrix and its quotient row-stochastic matrix". The scope paragraph here (lines 427–431) describes the first as "an adapter to stochastic matrices" and does not mention the second. Neither of those roadmaps declares a Lean name for the notion and neither states the path-law criterion of 1.1, the lumped path law of 1.2 or the divisibility of 1.4, so no statement is owned twice; what is shared is the block condition `P U = U P̂` itself, which is `IsLumping` read on matrices.

The smallest change: in that paragraph say that EquitableOperatorReduction Layer 5 and DiscreteQuantumWalks Layer 4 plan the block condition for stochastic matrices and the quotient matrix, that this roadmap owns the kernel predicate and its path-law meaning, and that the two agree through `Kernel.coe_toMatrix_apply` (the first sentence of the route of 1.4).

## N01 — Two Mathlib names in the supplier contracts stand after the wrong file

In "From Mathlib" (lines 447–451) `Matrix.spectrum_toLin'` and `Module.End.hasEigenvalue_iff_mem_spectrum` follow the entry for `Mathlib/LinearAlgebra/Matrix/Charpoly/Coeff.lean`; at the pin they are in `Mathlib/LinearAlgebra/Eigenspace/Matrix.lean` (line 136) and `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` (line 525).

## N02 — Four locators in the References are cited nowhere in the text

BHLMT Theorem 3.2, p. 4, and CGRW Definitions 2.2 and 2.3, p. 16, and Theorem 10.1, p. 65, appear only in the reference list. Cite each where it is used (Definition 2.2 would fit the definition of lumping from one law in the Conventions or 2.1; BHLMT Theorem 3.2 is stated there for aperiodic chains only) or drop it.

## N03 — Wording that will date, and a generality worth a clause

"EquitableOperatorReduction (an open roadmap, not on main)" (line 427) describes the state of the repository rather than the mathematics. Separately, the route of 1.4 proves a fact about matrices over a field (`P U = U P̂` with `U` of full column rank gives `χ_(P̂) ∣ χ_P`); a clause saying so would let a matrix roadmap cite it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `isStronglyLumpable_iff` | lazy walk on `{0,1}²` by number of ones; 3-state chain with blocks `{0}`,`{1,2}`; `S` empty; `t` outside image | rows `(1/2,1/2,0)`,`(1/4,1/2,1/4)`,`(0,1/2,1/2)` agree per block; `P(1,{0})=1/2≠0=P(2,{0})`; empty `S` vacuous both sides | holds | none |
| 1.2 `map_markovChainLaw_of_isLumping` | word `(f x, t)` from point mass; word with a letter outside image; `ν = 0` | `κ x (f⁻¹{t}) = κ'(f x){t}`; both sides `0`; both `0` | holds | none |
| 1.3 inheritance | (a),(b) with empty block; (c) inclusion `{0,1}→{0,1,2}`, `κ' 2 = δ₂` | `Σ_x π{x}κ x(f⁻¹t) = π(f⁻¹t)`; both sides `0` on empty block; `2` reaches only `2`, not onto | holds; onto needed | none |
| 1.4 `charpoly_dvd_of_isLumping` | cube→Ehrenfest; 6-cycle→path; non-onto example | cube roots `1, 1/3, −1/3, −1` with multiplicities `1,3,3,1`, Ehrenfest once each, quotient `(X²−1/9)²`; `X²−1/4`; `X(X−1)²` does not divide `X(X−1)` | holds; onto needed | none |
| 2.1 `isLumpableFrom_of_reversal` | 3-state chain, `π=(1/5,2/5,2/5)`; `f` injective; `f` constant; `π{y}=0` | `πP=π`; reversal rows `(0,1,0)`,`(1/4,0,3/4)`,`(1/4,1/2,1/4)`; `P*(1,{0})=P*(2,{0})=1/4`; lumped kernel `[[0,1],[1/4,3/4]]`; hypothesis trivial or `π{y}π{y'}` both sides | holds | none |
| 2.2 `lumping_condition_of_isLumpableFrom` | `P=[[1/2,1/2,0],[1/2,1/2,0],[1,0,0]]`, `π=(1/2,1/2,0)`; chain of 2.1 | detailed balance `1/4=1/4`, `0=0`; image i.i.d. uniform; `P(1,{0})=1/2≠1=P(2,{0})`; `π₀P₀₁=1/10≠1/5=π₁P₁₀` | holds; both hypotheses needed | none |
| 3.1 `charpoly_sub_stationaryMatrix` | two-state `[[2/3,1/3],[1/2,1/2]]`, `π=(3/5,2/5)` and `(1,0)` | `χ_P=(X−1)(X−1/6)`; `tr(P−Π)=1/6`, `det=0`, so `χ=X(X−1/6)` for both | holds | none |
| 3.2 `trace_fundamentalMatrix_eq_sum_roots` | two-state, `π=(1,0)`; exchange; biased triangle; one state; identity on two states | `M⁻¹` trace `11/5`, `tr Z=6/5=1/(1−1/6)`; `1/2`; `2·(3/2)/(7/3)=9/7`; `0=0`; `−1≠0` | holds; irreducibility needed | none |
| 3.3 `card_sub_one_div_two_le_trace` | rotation on `ℤ/n`; `n=1`; two-state; triangle; identity | `Σ_{k=1}^{n−1}1/(1−ωᵏ)=(n−1)/2`; `0=0`, `σ=id`; `6/5>1/2`; `9/7>1`; `−1<1/2` | holds | none |
| 3.4 `trace_fundamentalMatrix_add_le_of_isLumping` | 6-cycle; cube; biased `ℤ/4` by parity; non-onto; identity to a point | `35/6−19/6=8/3≥1`; `29/4−11/4=9/2≥2`; `23/10−1/2=9/5≥1`; `5−1/2>1`; `1/2>−1` | holds; onto and irreducibility needed | none |
| `IsLumping`, `IsStronglyLumpable`, `IsLumpableFrom` | wrong model: kernel depending on `ν` | chain of 2.1 lumps from `π` yet fails block condition, so the two notions differ | definitions determine their objects | none |
| Convention "the trace does not depend on `π`" | `q(1)≠0`; `q(1)=0` | `det M = q(1)` for every `π`; then `Σ 1/(1−λ)`, else `Z=−Π`, trace `−1` | true for every Markov kernel | none |
| Target time convention (Check of 3.3) | rotation, hitting from time `0` | `(1/n)Σ_{k<n}k=(n−1)/2`; HittingAndCoverTimes sets `τ_A=0` when `ω 0 ∈ A` | agrees | none |
| C01: invertibility of `I−P+Π₀` | MCMCAsymptoticVariance 1.1 at its open head | same statement and argument listed there | duplicate route | C01 |

- Source locators checked against the text: 13 of 13 in the body (LPW Lemma 2.5 p. 25 at LPW line 1706, Lemma 12.9 p. 167 at line 8494; CGRW Definitions 2.18, 2.19 p. 25, Theorem 2.23 p. 27, Corollary 10.2 p. 67; GT Definition 7 p. 7; Hunter (9) p. 5, bound pp. 5–6, minimum p. 9; BHLMT Remark 4.2 p. 7), plus the four unused ones of N02.
- Library declarations opened at the pins: 16 in Mathlib (13 lemmas and `Kernel.Invariant`, `Kernel.IsReversible`, `Kernel.IsIrreducible`), 9 in Tau Ceti (`markovChainLaw`, the prefix formula, the prefix-law characterization, `Measure.markovChainLaw_map_eval`, `Kernel.toMatrix`, `Kernel.coe_toMatrix_apply`, `Kernel.reaches_def`, `Kernel.isIrreducible_count_iff_forall_reaches`); all exist with the stated hypotheses.
- Cross-roadmap citations resolved: 6 (MarkovChainMixing 2.1 and MarkovChainsAndRenewal §3.1, §3.2 on main; MCMCAsymptoticVariance 1.1 and HittingAndCoverTimes 2.3 at their open heads; EquitableOperatorReduction at its open head). The three copied definitions agree character for character with their owners' Lean files.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with ten `sorry` warnings and nothing else. One-tactic probe (`simp`, `rfl`, `infer_instance`, `exact?`) on a separate copy of the file: none of the ten theorems closes.
- Signatures: all 16 elaborated types compared with the README; the six definitions omit `MeasurableSingletonClass`, which their bodies do not use, and every theorem carries it. No change.
- Headline theorems: all ten are stated; none is declared not statable. No padding found.
- The worker's automatic checks all passed.

Overlap check: read HittingAndCoverTimes, MCMCAsymptoticVariance, MarkovChainMonteCarloGuarantees, ComparisonOfMarkovChains, LogSobolevForMarkovChains, MarkovChainMixing, ElectricalNetworksAndRandomWalks, MarkovChainsAndRenewal, and also TimeReversalOfMarkovChains, EquitableOperatorReduction and DiscreteQuantumWalks; fundamental matrix: MCMCAsymptoticVariance; random target lemma: HittingAndCoverTimes; transition matrix: MarkovChainMixing; block condition for stochastic matrices: EquitableOperatorReduction and DiscreteQuantumWalks (C02); nothing else shared.

Source independence: 18 passages compared with 5 sources, none shared; largest share CGRW, 5 of 13 locators; contents compared with CGRW (§2.1–2.6, §10): independent, the three layers do not follow its sections.

Research link: Layer 2 states the Burke–Rosenblatt theorem (1958) and a case of the time-reversal duality of Crane, Gutiérrez, Russell and Wildon (2024) for weak lumping; Layer 3 states the eigenvalue formula and lower bound for Kemeny's constant of Hunter (2014), used by Bini, Hunter, Latouche, Meini and Taylor (2018). Rests on the README's references and the texts read.

## Not verifiable

- Kemeny and Snell (1960) and Burke and Rosenblatt (1958): no open copy; the README gives no locator into either and credits them through GT Definition 7 and CGRW Theorem 2.23, which were read.

## Source issues

- none

## For the human reviewers

- **Scope.** 3.4, the equality case of 3.3 and the multiplicity statement of 1.4 carry no source locator ("Proved here"); their routes were checked by hand in this review, but no refereed statement of them was found in the five sources read.
- **Licence.** CGRW, the source with the largest share of locators (5 of 13), is an arXiv preprint (v1); the two classical primary sources are cited second-hand.
