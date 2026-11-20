# Review of MCMCAsymptoticVariance (pull request #2741 at 1aeaf3b)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every theorem, formula and Check was recomputed exactly (rational arithmetic, with Mathlib's zero inverse of a singular matrix and the zero infimum over an empty index modelled), including the statements the README proves beyond its sources (the spectral bound and the Dirichlet-form identity on reducible and non-reversible chains, Peskun's order with the dominating chain only stationary), and every locator was read in Aldous–Fill and Andrieu–Livingstone. There is one small correction and one format note, neither blocking. Two facts about the sources are left for the human reviewers.

## C01 — Two Checks sum a geometric series for "the two-state chain" without excluding `p = q = 1`

The two-state chain is introduced in the first Check of 1.1 with `p + q > 0` only, and the second Check of 1.2 (line 123) and the second Check of 2.3 (line 246) then say that the geometric series in `(1 − p − q)^t` gives `Z`, respectively `σ²(f)`. At `p = q = 1` this is the exchange chain, the ratio is `−1`, and the series diverges, as the Check just above each of them says. The closed forms themselves (`Z = (1 − Π)/(p + q)`, `σ²(f) = Var_π f · (2 − p − q)/(p + q)`) hold for all `p + q > 0`; only the summation needs `p + q < 2`. Adding "for `p + q < 2`" to the two bullets makes them true as written.

## N01 — The Lean section comment of Layer 4 has a different title from the README's

`Suggested.lean` line 164 reads "Layer 4: orderings of chains"; the README's heading is "Layer 4: comparison of chains". One title for both would do.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 fundamental matrix `Z = (1 − P + Π)⁻¹ − Π` | two-state `p=1/3, q=1/2`; exchange chain; one state; identity on two states | `π=(3/5,2/5)`, `Z=[[12/25,−12/25],[−18/25,18/25]]`; `[[1/4,−1/4],[−1/4,1/4]]`; `0`; det `0`, `Z=−Π` | agree with Checks | none |
| 1.1 identities `Z1=0`, `πZ=0`, `(1−P)Z=1−Π` | derived from invertibility, row-stochastic `P`, stationary `π` | `(1−P+Π)Π=Π`, `Π(1−P+Π)=Π`, hence `ZΠ=ΠZ=0`, `(1−P)(Z+Π)=1−Π` | hold | none |
| 1.1 singular ⇔ two closed classes | 3000 random chains (1–3 closed classes, 0–2 transient states, `π` possibly zero on a class) | singular in 1775 cases, exactly the 1775 with ≥ 2 closed classes | agree | none |
| 1.2 Cesàro limit (`tendsto_cesaro_fundamentalMatrix`) | exchange chain; period-2 path `a–b–c`, `n=200` | partial sums alternate `1−Π`, `0`, means → `(1−Π)/2 = Z`; path: Cesàro sum at `n=200` equals `Z` entrywise | holds | none |
| 1.2 series (`hasSum_fundamentalMatrix`) | two-state, ratio `1−p−q=1/6`; exchange chain (aperiodicity dropped) | `(1−Π)/(p+q) = Z`; terms `±(1−Π)`, no sum | holds; hypothesis needed | C01 |
| 1.3 `poisson_iff` | two-state, `f=1_a`, `g=Zf` and `g=Zf+3`; one state; identity kernel | `g−Pg=(2/5,−3/5)=f−3/5`; one state `Z=0`, `g=c`; identity: every `g` solves `g−Pg=0` | holds; irreducibility needed | none |
| 2.1 definition, `Γ` form | `Γ` row sums; two-state | `Σ_j Γ_ij = 0+0+π_i−π_i = 0`; `σ²=pq(2−p−q)/(p+q)³ = 42/125` | agree with (2.11), (2.12) | none |
| 2.1 Poisson formula (`asymptoticVariance_eq_of_poisson`) | two-state; 622 random irreducible chains with `g=Zf+3`; two disjoint exchange chains | `42/125` both sides; equal in all 622, `σ² ≥ 0` in all; disjoint: formula `0`, definition `−1/2`, `Var=1/2` | holds; irreducibility needed | none |
| 2.1 lazy chain, non-stationary `π` | two-state lazy; rows `(1/4,3/4),(1/2,1/2)` with uniform `π` | `Z_lazy=2Z`, `114/125 = 2·42/125+6/25`; `3/20` vs `18/125` at `π=(2/5,3/5)` | agree | none |
| 2.2 `tendsto_variance_sum_div` | path `a–b–c` from `δ_a` and `δ_b` (exact moment recursion); random 4-state chain from a point mass; identity kernel | `Var(S_7)=3/4=⌊6/2⌋/4`; `Var(S_400)/400=199/1600`, from `b` `0.125`, `σ²=1/8`; random: `3.327` at `n=300` vs `σ²=3.337`; identity `n²/4` | holds, periodic chains included | none |
| 2.3 `hasSum_covariance` | two-state; exchange chain | `2·Σ_{k≥1}⟨f̄,P^k f̄⟩ = 2⟨f̄,Zf̄⟩−2Var = σ²−Var`; exchange: terms `∓1/4`, no sum, `σ²=0` | holds; aperiodicity needed | C01 |
| 2.4 `asymptoticVariance_eq_zero_iff` | 3-state Check; 3-cycle; 622 random irreducible chains (324 with `σ²=0`), `u=Zf`; identity with `π=δ_a`, `f=(0,1)` | `π=(1/5,2/5,2/5)`, `σ²(0,1,−1)=0`, `σ²(1_a)=8/125`; cycle `0`; both directions agree in all 622; identity: `σ²=0`, no `u` | holds; irreducibility needed | none |
| 3.1 `asymptoticVariance_eq_two_mul_dirichletForm` (no irreducibility) | two-state; identity kernel; 3000 random stationary pairs incl. reducible and transient states; exchange chain with non-stationary `π=(2/3,1/3)` | `E(Zf)=36/125`, `2·36/125−6/25=42/125`; identity `−1/4` both; equal in all 3000; non-stationary `0` vs `1/36` | holds; stationarity needed | none |
| 3.2 `asymptoticVariance_le_spectralGap` (no reversibility, no irreducibility) | two-state; 3-cycle; exchange; one state; identity; 3000 random chains (1775 singular, 1799 with `γ=0`) | `(12/5−1)·6/25=42/125=σ²`; `γ=3/2`, `0 ≤ 2/27`; `γ=2`, `0 ≤ 0`; `0 ≤ 0`; `−1/4 ≤ −1/4`; no violation in 3000 | holds, junk cases included | none |
| 3.3 `isGreatest_variational` | two-state; 1500 random reversible irreducible chains, value at `g=Zf` and at random `g`; 3-cycle (non-reversible) | `36/125`; value at `Zf` equals `(σ²+Var)/2`, random `g` never above; cycle: max `4/27` vs `1/9` | holds; reversibility needed | none |
| 4.1 `asymptoticVariance_le_of_dirichletForm_le` | 1500 pairs: `κ₁` random non-reversible stationary, `κ₂` lazy additive reversibilization (`E₂=E₁/2`) | `σ²(κ₁) ≤ σ²(κ₂)` in all 1500 | holds with `κ₁` only stationary | none |
| 4.2 `asymptoticVariance_le_of_offDiag_le` | Metropolis vs Barker; 1500 pairs with `κ₁=κ₂+½(R−1)`, `R` non-reversible; `ZMod 4` pair; non-stationary `κ₁`; `κ₂` identity | `2/27 ≤ 2/9`; no violation, strict in 1445; `7/10 > 1/2`; `197/80 > 39/16`; `0 > −1/4` | holds; each hypothesis needed | none |
| 4.3 Metropolis remark | `M x y = min(q x y, π(y) q y x/π(x))` against reversible `κ ≤ q`; `q x y = 0` | `κ x y = π(y)κ y x/π(x) ≤ π(y) q y x/π(x)`, so `κ ≤ M` off the diagonal; at `q x y=0` both are `0` | 4.2 applies with `κ₁=M` | none |
| `spectralGap`, `dirichletForm`, `transitionMatrix` | compared with MarkovChainMixing `Suggested.lean` lines 90–91, 173–174, 178–179 | bodies identical character for character; namespaces differ | faithful copies | none |
| Headlines in `Suggested.lean` | Poisson equation, variance limit, Poisson formula, spectral bound, Peskun | `poisson_iff`, `tendsto_variance_sum_div`, `asymptoticVariance_eq_of_poisson`, `asymptoticVariance_le_spectralGap`, `asymptoticVariance_le_of_offDiag_le` | all stated | none |

- Source locators checked against the text: 13 (Aldous–Fill (2.6), (2.7), (2.10), (2.11), (2.12), Lemma 3.4, Proposition 4.29 and the display `(1+λ₂)/(1−λ₂)` in its proof, (11.2), Lemma 11.1; Andrieu–Livingstone (2), (3), Theorem 2.7, Corollary 2.8 and the display after it); all carry the statements cited, with the hypotheses the README attributes to them.
- Library declarations opened at the pins: 24. Tau Ceti `Kernel.toMatrix` (`Probability/Kernel/Matrix.lean:44`), `coe_toMatrix_apply` (:53), `toMatrix_pow` (:94), `toMatrix_mem_rowStochastic` (:103), `Kernel.Reaches` (`Reachability.lean:31`, zeroth power included), `isIrreducible_count_iff_forall_reaches` (:126), `IsClosedSet` (`ClosedClass.lean:44`), `Kernel.subtype` (:58), `isMarkovKernel_subtype_iff_isClosedSet` (:95), `Kernel.period` (`MarkovChain/Period.lean:83`), `IsAperiodic` (:108), `markovChainLaw` (`Process/MarkovChain.lean:161`), `markovChainLaw_map_eval` (:340), `markovChainLaw_map_prefix_apply_singleton` (:357); Mathlib `Kernel.Invariant` (`Probability/Kernel/Invariance.lean:39`), `IsReversible` (:58), `IsReversible.invariant` (:63), `IsIrreducible` (`Kernel/Irreducible.lean:56`), `Matrix.isUnit_iff_isUnit_det`, `nonsing_inv_apply_not_isUnit`, `mul_nonsing_inv`, `nonsing_inv_mul` (`NonsingularInverse.lean:125, 173, 209, 215`), `summable_geometric_of_lt_one`, `variance`, `covariance`. No fundamental matrix, asymptotic variance, Dirichlet form or spectral gap of a kernel exists in either pinned library.
- Cross-roadmap citations resolved: MarkovChainsAndRenewal Layer 2 items 3, 4 and Layer 3 items 1, 2, 5 on main (and present under the same layer numbers at its open revision); MarkovChainMixing 2.1, 2.2, 2.4, 6.4 at its open head; MathematicalStatisticsFoundations 9.4 on main. All say what the README assumes of them.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else. Elaborated types compared with the README: the six definitions do not carry `[MeasurableSingletonClass S]`, which none of them needs; every theorem carries all its hypotheses.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `simp` with the definitions unfolded) on a scratch copy: none of the 12 theorems closes; no padding.
- The automatic checks all passed on this head; no change outside the roadmap folder.
- Pull-request text read against the head: title and description agree with it (12 theorems, 6 definitions, three Tau Ceti imports, the supplier list, the copies shared with LogSobolevForMarkovChains).

Overlap check: read MarkovChainMixing, LogSobolevForMarkovChains, MartingaleCentralLimitTheorem, SimulatedAnnealing (scope), MarkovChainsAndRenewal, MathematicalStatisticsFoundations (9.4); MarkovDecisionProcesses searched by object only. Nothing shared: MarkovChainMixing owns the transition matrix, Dirichlet form, spectral gap and the finite-time bound of its 6.4, cited here and copied only as definitions; MartingaleCentralLimitTheorem and LogSobolevForMarkovChains each name the asymptotic variance, the Poisson equation and Peskun's ordering as outside their scope.

Source independence: 18 passages compared with 2 sources (13 at locators, 5 further: the invertibility argument of 1.1, the routes of 1.3, 2.2 and 4.2, the docstring of `poisson_iff`), none shared beyond formulas; largest share Aldous–Fill, 10 of 13 locators; contents compared with Aldous–Fill Chapters 2, 3, 4, 11: independent (Layer 1 ↔ 2.2.2, Layer 2 ↔ 2.3 and 11.1.1, Layer 3 ↔ 4.4.1, Layer 4 ↔ 3.1.2 and 11.4.1, neither in order nor one to one; the order here is forced by `Z` → `σ²` → Dirichlet form → comparison).

Research link: Layer 4 is the Peskun–Tierney ordering (Peskun 1973; Tierney 1998; Caracciolo–Pelissetto–Sokal 1990) that Andrieu–Livingstone 2019 extend beyond reversibility; Layers 1–2 give the limiting variance of the Markov chain central limit theorem (Aldous–Fill, Theorem 2.17). Rests on the README's provenance section and on both sources as read.

## Not verifiable

- The attributions to Peskun (1973), Tierney (1998), Caracciolo–Pelissetto–Sokal (1990) and Kemeny–Snell (1960): the README cites them in prose without locators and no text was read; the statements they are named for were checked in Aldous–Fill and Andrieu–Livingstone instead.
- Ownership against open pull requests was checked through the search over all open heads and by reading the five closest roadmaps; the remaining open roadmaps were searched by object, not read.

## Source issues

- **Error** in Aldous–Fill at Chapter 2, Section 2.3, the sentence after (2.11): the source says the matrix `Γ` of (2.12) is symmetric positive-definite; it should be positive semidefinite, since its row sums vanish and it kills constants; affects nothing.
- **Gap** in Aldous–Fill at Chapter 11, Section 11.1.1, (11.2): the source says the variance rate of an irreducible chain equals the two-sided sum of stationary autocovariances; it should assume aperiodicity or sum in the Cesàro sense, the series diverging for the two-state exchange chain; affects a stated result.
- **Misprint** in Aldous–Fill at Chapter 4, Section 4.4.1, proof of Proposition 4.29, discrete analogue of (4.26): the source writes the weight with an index `i` and the power `λ_m^s` under a sum over `s`; it should be `1 − |s|/t` and `λ_m^{|s|}`; affects nothing.
- **Misprint** in Aldous–Fill at Chapter 11, Section 11.4.1, the remark after Lemma 11.1: the source says a `max(1, ·)` acceptance probability; it should be `min(1, ·)`, as in the Metropolis chain displayed above it; affects nothing.

## For the human reviewers

- **Scope.** Ten of the README's thirteen locators are to Aldous–Fill, an unfinished monograph never published in print (web edition on the first author's page); the refereed primaries (Peskun, Tierney, Caracciolo–Pelissetto–Sokal, Kemeny–Snell) are cited in prose and, per README line 493, were not consulted.
- **Scope.** Ten statements are marked "proved here" with no source at that generality (variance limit from every initial law, spectral bound without reversibility, Peskun's order with one chain only stationary); this review confirmed them by exact computation, not from a refereed text.
