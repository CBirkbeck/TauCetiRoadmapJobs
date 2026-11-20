# Review of KestenStigumAndCriticalBranching (pull request #2805 at c82c785)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was recomputed on degenerate and boundary instances (`ν = δ_1`, `δ_2`, `μ = 0`, `σ² = 0` and `∞`, `n = 0`), every numerical Check was recomputed, and every Lyons–Peres locator was read at its page in the authors' version of 19 August 2026; all agree with the text. There is no small correction and one format note, not blocking. One item (the 2003 erratum) could not be read, and one fact about the concentration of the sources is left for the human reviewers.

## N01 — Two Checks describe how they were computed where an exact formula is available

In the first Check of 4.2 (line 411) the parenthesis "(exact computation for `n ≤ 4`, `k < 15`)" undersells the statement: with `f^[n](s) = (n − (n−1)s)/(n + 1 − ns)` the conditional generating function is `s/(n + 1 − ns)`, so `P(Z_n > k | Z_n > 0) = (n/(n+1))^k` for all `n` and `k`. Likewise the first Check of 2.3 (line 248) reports an enumeration of paths; the one-line identity `k ν^(*j)(k) = j m (ν^(*(j−1)) ∗ ν̂)(k)` already given in the route covers every path. The sentences could say that, or stay as they are.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 growth dichotomy | `X_n ≡ 1`; `P(X>x)=1/x`; `X_n = X_0` dependent; `n = 0` term | `1/n → 0`; `∑ P(X>Cn) = ∑ 1/(Cn) = ∞`; `X_0/n → 0` (independence needed); `X_0/0 = 0` in Lean, harmless | true; matches Lemma 12.1 | none |
| 1.1 bound in the route | `E X ≤ C(1 + ∑_{n≥1} P(X>Cn))` | `∫_0^∞ P(X>t)dt ≤ C ∑_{n≥0} P(X>Cn)`, first term `≤ 1` | true | none |
| 1.2 density dichotomy | `μ = 0`; `μ = ν`; coin tossing `¾` vs `½`; trivial filtration | all four clauses true for `μ=0`; `X=1`, `∫X dν=1`; log-means `−0.14384` (ν), `+0.13081` (μ); trivial `ℱ`: `∫X dν = μ(Ω)` yet singular | true; generating hypothesis is used | none |
| 1.2 null-set dependence | `X_n` changed on ν-null `N_n ∈ ℱ_n` | `μ(N_n) = ∫_{N_n} X_n dν = 0`, so `limsup` changes on a μ- and ν-null set | well posed | none |
| 2.1 immigration kernel | `ν=δ_2, ρ=δ_1`; state 1 with `ν=½δ_0+½δ_2`; `ρ=δ_0` | `Z_n = 0,1,3,7 = 2^n−1`; next state `1,3` w.p. `½,½` (wrong order gives `0,2,4`); kernel equals `gwKernel ν` | definition fixed by Check 2 | none |
| 2.1 mean formula | `n = 1`, `n = 0` | `E Z_1 = E Y`; empty sum `0 = E Z_0` | true | none |
| 2.2 Seneta | `ν=δ_2,ρ=δ_1`; `ρ{2^(2^j)}=2^(−j)`; `ν=δ_1,ρ=δ_1`; `ρ=δ_0` | limit `1`; `∑2^(−j)=1`, `E log Y=∑ log 2=∞`; `Z_n=n` diverges at `m=1`; `Z_n=0` converges | true; `m>1` needed; matches Thm 12.3 (`m ∈ (1,∞)`) | none |
| 2.3 size-biased identity | `ν=¼δ_0+¼δ_1+½δ_2`, path `(1,2)`; `n=0`; path through 0; unshifted `ν̂` | `m=5/4`, `ν̂=⅕δ_1+⅘δ_2`; `Q=⅘`, `(2/(5/4))·½=⅘`; `Q=P` on coordinate 0; both sides 0; `(1,3)`: `⅘` vs `0` | true; shift needed | none |
| 2.3 factor identity | `E[S 1_{S=k}]` for `S` sum of `j` copies | `j ∑_l l p_l ν^(*(j−1))(k−l) = j m (ν̂ ∗ ν^(*(j−1)))(k)`; telescopes to `z_n/m^n` with `z_0=1` | true | none |
| 3.1 Kesten–Stigum | `δ_2`; `¼δ_0+¼δ_1+½δ_2`; `k^(−3)/ζ(3)`; `c/(k² log² k)`; `m=1` binary | `W=1,q=0`; `q=½` (roots of `2s²−3s+1`), `E L log L=log 2`; `m=1.36843`; `∑=0.692606`, `m=3.0461`, `∑1/(k log k)=∞`; `E W=0≠1` | all clauses consistent; `P(W=0)∈{q,1}`, `q<1` | none |
| 3.1 step 3 bound | `k log k − k log(k−1)`, `k ≥ 2` | `k log(1+1/(k−1)) ∈ [0, k/(k−1)] ⊂ [0,2]` | true | none |
| 4.1 Kolmogorov | `δ_1`; geometric `½`; `½δ_0+½δ_2`; `f=s+½(1−s)^(3/2)` | `n → ∞ = 2/0`; `n/(n+1) → 1 = 2/2`; `1.98278` at `10³`, `1.99973` at `10⁵`; `1.5994·10⁻⁴` at `10⁵`, coefficients `½, ¼, 3/16, …` | true in `[0,∞]`, incl. `σ²=0,∞` | none |
| 4.1 route | `(s^k−1+k(1−s))/(1−s)²` | `= ∑_{j≤k−2}(k−1−j)s^j ↑ k(k−1)/2`; `(1−f)/(1−s) ≥ 1−p_0 > 0`; `φ → σ²/2` | true | none |
| 4.2 Yaglom | geometric `½`; `½δ_0+½δ_2`, `t=2`, `n=20000`; `δ_1` | conditional pgf `s/(n+1−ns)`, tail `(n/(n+1))^k`; `0.49969+0.50026i` vs `1/(1−i)`; `Z_n/n=1/n → δ_0` | true; `ν≠δ_1` needed; rate `2/σ²` = mean `σ²/2` | none |
| 4.2 limit of characteristic functions | `1 − (σ²/2)/(i/t+σ²/2)` | `= 1/(1 − itσ²/2) = r/(r−it)` at `r=2/σ²` (Tau Ceti `charFun_expMeasure`) | true | none |
| Conventions | `log` on `ℕ`; `2/∞`, `2/0` in `ℝ≥0∞`; `Var` at `m=1` | `log 0 = log 1 = 0`; `0`, `∞`; `Var = E(L−1)²` | consistent | none |

- Source locators read at the text: 13 in Lyons–Peres (version of 19 August 2026): Lemma 12.1 and Exercise 12.2 (p. 413, LyonsPeresCurrent lines 20875, 20885), (12.1)–(12.2) (p. 415, lines 20933, 20941), Figure 12.1 and immigration (p. 416, lines 20975–20993), Lemma 12.2 (p. 417, line 21018), Theorem 12.3 (p. 418, line 21069), Kesten–Stigum (p. 137, line 7319; p. 413, line 20867; proof p. 418, line 21110), Theorem 12.7 and the remark on `σ = ∞` (p. 420, lines 21194–21201), Exercise 12.12 (c) (p. 424, line 21366); 2 in Lyons–Pemantle–Peres, read in arXiv:math/0404083v1 (Theorems A and C, LyonsPemantlePeres1995 lines 45–68, the article's second page).
- Library declarations opened at the pins: 20 in Mathlib (among them `tsum_prob_mem_Ioi_lt_top` `Probability/StrongLaw.lean:289`, `measure_limsup_eq_one` `Probability/BorelCantelli.lean:70`, `Submartingale.ae_tendsto_limitProcess` `Probability/Martingale/Convergence.lean:213`, `tendsto_ae_condExp` `:427`, `ProbabilityMeasure.tendsto_iff_tendsto_charFun` `MeasureTheory/Measure/LevyConvergence.lean:214`, `Filtration.piLE` `Probability/Process/Filtration.lean:490`, `expMeasure` `Probability/Distributions/Exponential.lean:94`) and 11 in Tau Ceti (`weighted` `MeasureTheory/Measure/Weighted.lean:35`, `markovChainLaw` `Probability/Process/MarkovChain.lean:161`, `markovChainLaw_map_prefix_apply_singleton` `:357`, `condExp_shift_iterate_markovChainLaw` `Probability/MarkovChain/MarkovProperty.lean:157`, `charFun_expMeasure` `Probability/Distributions/Exponential/Basic.lean:332`, `weighted_poissonMeasure` `Probability/Distributions/Poisson/SizeBias.lean:72`); all exist with the stated content. No Galton–Watson, immigration or density-dichotomy declaration exists at either pin.
- Cross-roadmap citations resolved: PopulationDynamics 1.1–1.6 at its open head (the four copied definitions and the instance have identical bodies; its scope lists Kesten–Stigum under `L log L` as out of scope); StandardDistributions §7.12 (main); SeriesOfIndependentRandomVariables 4.2 (open); PointProcesses Layer 12 (open, named only as a boundary).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `TauCetiRoadmap/KestenStigumAndCriticalBranching/Suggested.lean`: seven `sorry` warnings, nothing else. `#check`-level signatures of the 13 declarations compared with the README statements: no binder lost, generality equal.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `decide`) on a scratch copy: none of the seven theorems closes. The four headline theorems of the Summary (Kesten–Stigum, Seneta, Kolmogorov, Yaglom) are all stated; no stand-in.
- Pull-request text read against the head: 7 theorems, 6 definitions, 2 instances, three Tau Ceti imports, the dependency on PopulationDynamics: all as described.

Overlap check: read PopulationDynamics, SeriesOfIndependentRandomVariables, MartingaleCentralLimitTheorem, LawOfTheIteratedLogarithm, MarkovChainsAndRenewal (open and main), StochasticCalculus, Exchangeability; nothing shared. PopulationDynamics owns the Galton–Watson process and its `L²` limit and names the `L log L` theorem as outside its scope; StochasticCalculus's density process is the Girsanov one for absolutely continuous laws, not the dichotomy 1.2.

Source independence: 11 passages compared with 2 sources (the statements and routes of 1.1, 1.2, 2.1, 2.2, 2.3, 3.1, 4.1, 4.2, and three docstrings), none shared beyond what the mathematics forces; largest share LyonsPeresCurrent, 13 of 15 locators; contents compared with LyonsPeresCurrent (Chapter 12, §§12.1–12.7): independent — Layers 1 and 2 each draw on both §12.1 and §12.2, §12.3 is not treated, and Layer 4 uses generating and characteristic functions where §12.4 uses trees; the order Layer 1 → 2 → 3 is forced by the *Needs* lines of 2.2 and 3.1.

Research link: the headlines are the theorems of Kesten–Stigum (1966), Seneta (1970) and Kesten–Ney–Spitzer (1966) as stated in Lyons–Pemantle–Peres (1995, Theorems A, C) and Lyons–Peres (2016, Ch. 12), whose notes cite Peköz–Röllin (2011) on rates in Yaglom's law; rests on the sources read.

## Not verifiable

- The authors' erratum of 26 October 2003 to Lyons–Pemantle–Peres (cited in 4.2 and in the References for the withdrawal of Theorem C (ii) at `σ = ∞`): not found on the first author's page at the address tried, nor through the article's DOI. The book's own remark after Theorem 12.7 (LyonsPeresCurrent line 21200) supports the sentence that the case is open.
- The journal page 1126 for Theorems A and C: the published article is behind the publisher's page; the statements were read in the arXiv version, where they stand on the second page of an article that begins on p. 1125.

Automatic checks set aside as false positives: the scan for names of roadmaps that may not be cited as suppliers stopped at the sentence of the scope section that names PointProcesses; that sentence says that roadmap builds its own Poisson Galton–Watson process and that nothing here concerns it, so it is a boundary remark and no supply. The four Lean names reported as found nowhere in the libraries are this roadmap's own theorems, declared in its `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- Source concentration: 13 of the README's 15 source locators point into Chapter 12 and §5.1 of one book (Lyons–Peres), which says it adapts the second source (Lyons–Pemantle–Peres 1995); the routes of Layer 4 are not the book's.
- The page numbers are those of the authors' online version dated 19 August 2026 (`TauCetiRoadmap/KestenStigumAndCriticalBranching/README.md` line 562); the authors' version of 8 November 2016 has the same theorem numbers three pages earlier in Chapter 12.
