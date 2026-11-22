# Review of BestArmIdentification (pull request #2987 at 759aec5)

**Verdict:** accepted

**Summary.** Accepted: no finding. The seven stated theorems were recomputed at degenerate parameters and along their proof routes, every Check was recomputed exactly, the deterministic theorem 3.1 was tested by brute force over all tie-breakings, and the locators into Lattimore–Szepesvári, Li et al., Jamieson–Talwalkar and Kaufmann–Cappé–Garivier were read at the text. There are two small corrections and three format notes, none blocking. Two sources (Karnin–Koren–Somekh and Even-Dar–Mannor–Mansour) could not be read through the sources service, so the locators of 4.1 and part of 1.2, 2.1 and 2.2 are unverified; that, and the fact that several statements are wider than any refereed source, is left to the human reviewers.

## C01 — The convention on ties says that every sampling condition allows a tie-breaking that depends on the whole trajectory; the halving schedule of 1.2 does not.

A reader of the Conventions (line 63) concludes that 2.1, 2.2 and 4.1 hold when the surviving sets break ties using later rounds. The second condition of 1.2 (line 99) requires `{ω | a ∈ A ℓ ω}` to be measurable and to depend only on the rounds before `s_ℓ`, and `Suggested.lean` has it as the fields `measurableSet` and `dependsOn` of `IsSequentialHalving` (lines 141–143); the route of 2.1 uses exactly this when it treats `a⋆`, `Top` and `b_r` as determined before the phase. Only the recommendation `ψ` (in 1.3, and in 1.2 when `A L ω` has more than one arm) may depend on the whole trajectory.

Smallest change: "Every sampling condition allows any tie-breaking: in a halving schedule, any measurable choice of the surviving sets that depends on the rounds before the next phase; for the recommendation, any choice, including one that depends on the whole trajectory."

## C02 — In 3.1, "the source" of the two repairs is Li et al.; the rule of Jamieson and Talwalkar is a different one, and the first Check does not apply to it as written.

The citation in 3.1 (line 322) gives Jamieson and Talwalkar's Theorem 1 as the same statement "without `ε`", and the next paragraph speaks of "the source's inverse" and "the source keeps `⌊|S|/2⌋` arms". That describes Li et al. (LiHyperband2018 lines 1021 and 1036–1038). Jamieson and Talwalkar's procedure (JamiesonTalwalkar2016 lines 300–305, 341) compares losses at the cumulative count `R_k = Σ_{j≤k} r_j`, keeps every arm whose loss is at most that of the arm of rank `⌊|S_k|/2⌋` (so tied arms all survive), assumes `ν_1 < ν_2`, and uses per-arm envelopes. In the tie example of the first Check their rule keeps both arms and then has no singleton to return; it does not name arm `1`.

Smallest change: write "Li et al.'s inverse" and "Li et al. keep" in the paragraph on the two repairs, and qualify the second citation, for instance "Jamieson and Talwalkar 2016, Theorem 1, p. 243, without `ε`, for a unique best arm, with cumulative pulls and all tied arms kept".

## N01 — Two proof routes re-derive items that MultiArmedBandits states, on the ground that they have no Lean declaration.

The route of 1.3 (line 145) re-proves the third item of MultiArmedBandits 2.2 and the route of 5.2 re-derives the two-bandit inequality of MultiArmedBandits 4.1. A README item of a supplier can be cited by section; "MultiArmedBandits 2.2, third item, with `n = K m`" and "the two-bandit inequality of MultiArmedBandits 4.1" would shorten both routes. Offered, not required: neither is restated as a target.

## N02 — The Check "`δ ≤ 1` is needed for the count" in 4.1 shows only that some upper bound on `δ` is needed.

The instance `δ = 2000` (right side `−300.09`, recomputed) rules out large `δ`; the argument for the count uses `log(3/δ) ≥ 0` only, so it goes through for `δ ≤ 3`. Wording such as "an upper bound on `δ` is needed for the count (the proof uses `δ ≤ 3`)" would be exact.

## N03 — Several Mathlib names are written without their namespace.

For example the Chernoff bound is `ProbabilityTheory.HasSubgaussianMGF.measure_ge_le`, Markov's inequality `MeasureTheory.mul_meas_ge_le_lintegral₀`, and `InformationTheory.klDiv_of_not_ac`, `InformationTheory.klDiv_self`. Also the Layer 3 heading reads "on loss sequences" in the README and "on deterministic loss sequences" in `Suggested.lean`.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 model (copied definitions) | bodies compared with MultiArmedBandits at its open head | 10 definitions and the instance agree line for line; only docstrings differ | sound | none |
| 1.2 `halvingSize`, `phaseStart`, schedule | `k=5`, `ℓ=0..3`; `K=4`, `T=(1,2)`; Bernoulli `(3/4,1/4)`, `T 0 = 0, 1` | `5,3,2,1`; starts `0,4,8`; errors `1/0` and `7/16`, `1/16` | sound | C01 |
| 1.2 satisfiability of `playsIn` | round `t` of phase `ℓ` at an arbitrary history | fewer than `m·T ℓ` rounds elapsed, so some arm has `< T ℓ` plays: set nonempty | sound | none |
| 1.3 uniform allocation | Bernoulli `(3/4,1/4)`, `m=0,1,4,8`; `(1/2,1/2,0)`, `m=4`; `c=0`; `m=0` | exact `1, 7/16, 7459/65536, 116522275/2^32` ≤ `1, .779, .368, .135`; `1/256 ≤ e⁻¹`; bound = number of suboptimal arms | sound | none |
| 1.3 route | weights with `V = 2m`, `ε = m·gap` | `exp(−m²gap²/(2c·2m)) = exp(−m gap²/(4c))` | sound | N01 |
| 2.1 phase-by-phase bound | `(1,1/2)`, `T=(8)`; `(1,1/2,1/2,0)`, `T=(12,12)`; `(1,1,1/2,0)`, `T=(2,2),(5,5)`; `k=1,L=0`; `c=0` | `H₂=8`, `1/256 ≤ 3e⁻² = .406`; `H₂=12`, `16781311/2^36 ≤ 6e⁻² = .812`; `1/16`, `1/1024`; `0 ≤ 0`; bound `3L` | sound | none |
| 2.1 counting step | `m = 2,3,4,5,8` and general `m` | `⌈m/2⌉−⌈m/4⌉+1 ≥ (m+1)/4 ≥ (m−⌈m/4⌉)/3`; index of `b ∈ B` at least `⌈m/4⌉` | sound | none |
| 2.2 even split | `(1,1/2,1/2,0)`, `n=192, 8`; `L=0`; Gaussian `(1,0)`, `v=1/100`, `n=1` with floors | `T=(24,48)`, `(2^49−1)/2^96 ≤ 6e⁻²`; `7/16 ≤ 6e^(−1/12)`; `0 ≤ 0`; floors: error `1 > 3e^(−25/8) = .13` | sound | none |
| 2.2 from 2.1 | `m_ℓ = 2^(L−ℓ)` | `T ℓ·j_ℓ ≥ n/(4L)`, each term `≤ exp(−n/(16cLH₂))` | sound | none |
| 3.1 deterministic guarantee | 3000 random loss families with 3 budgets each (`n ≤ 6`, `B = z+1, z+2, z+r`), every admissible tie-breaking; `n=1`; `γ ≡ 1` | 0 violations; `z=0`; `γ≡1`: `z=4`, `B=5`, arm 1 kept, `1 > 1/2` | sound | C02 |
| 3.1 Checks against Li et al. | tie example; floor rule `n=3,5,6,7`; second conclusion | non-strict `z=4`, `r_0=2`, tie; strict `z=24`; `3→1→0` etc.; loss `2/5 > 1/10` at `z=4`, `B=5` | sound | none |
| 4.1 median elimination, plays | `c=1/4`, `ε=1`, `δ=1, 1/2`; `K=2,4,5` | `115,283,643`; `160,362,784`; ends `230,1026,2710` ≤ `8456.15, 16912.30, 33824.61` | sound | none |
| 4.1 correctness and count | per-phase deviation; `δ=2000`; `c=0` | `exp(−Tε_ℓ²/(8c)) ≤ (δ_ℓ/3)²`; `Σε_ℓ < ε`, `Σδ_ℓ < δ`; sums `9`, `81`; right side `−300.09`; Dirac error `1 > 1/2` | sound | N02 |
| 5.1 change of measure | `Ber(3/4)` vs `Ber(1/4)`, `n=3`; `δ<0`, `δ=0`, `δ=1/2`; `δ=9/10`, `ν=ν'` | `P=27/32`, `Q=5/32`, `3^9 ≤ 5^11`; vacuous, `0`, `0`; left `(4/5)log 9 > 0 =` right | sound | none |
| 5.2 Gaussian lower bound | `K=1`; `v=0`; `n=0`; route with `μ`, `μ'` | `1/4 > 0`; `1/4 > 0`; error `1`; `klDiv = E[T_b]·2Δ²/v ≤ 2nΔ²/((K−1)v)`, sum of errors `≥ exp(−KL)/2` | sound | N01 |
| 5.2 against 1.3 | exponents for `n ≥ K ≥ 2` | ratio `8n/((K−1)⌊n/K⌋)` lies in `[8, 32]` | sound | none |

- Source locators checked against the text: 14 (LattimoreSzepesvari2020: Theorem 33.10, Algorithm 22, (33.9) and the display after it, Exercise 33.8, Theorems 5.3, 15.2, 33.5, 33.6, Lemma 5.4; LiHyperband2018: Theorem 1, Appendix B.1, Theorems 5 and 7; KaufmannCappeGarivier2016: Lemma 1 and (3); JamiesonTalwalkar2016: Theorem 1).
- Library declarations opened at the pin: 13, among them `Mathlib/Probability/Moments/SubGaussian.lean` 696 and 851, `Mathlib/MeasureTheory/Integral/Lebesgue/Markov.lean` 52, `Mathlib/InformationTheory/KullbackLeibler/Basic.lean` 56, 66, 74, `Mathlib/Data/Nat/Log.lean` 334 and 440, `Mathlib/Order/Lattice/Nat.lean` 75, `TauCeti/MeasureTheory/Measure/TotalVariation.lean` 94.
- Cross-roadmap citations resolved: 9 (MultiArmedBandits 1.1, 1.2, 2.1, 2.2, 4.1, 4.2 at its open head; MathematicalStatisticsNonparametric 1.3, 1.4 and MathematicalStatisticsFoundations 9.2 on main), each with the cited declaration or item present and its hypotheses as restated.
- Dependency check: `depcheck: 133 roadmaps, 1473 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 7 `sorry` warnings and nothing else; `#check`-level signatures of all 28 declarations compared with the README (the binders the definitions drop are ones their types do not mention; no theorem lost a hypothesis).
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy of the file: none of the 7 theorems closes; no padding.
- Pull request text: adds a new roadmap, 28 declarations (7 theorems, 20 definitions, 1 instance), no change outside the folder; the description agrees with the head.
- Automatic checks: all passed at this head.

Overlap check: read MultiArmedBandits, PACBayesBounds, StatisticalLearningTheory, PolicyGradientMethods, OnlineLearningAndLittlestoneDimension, MarkovDecisionProcesses, MathematicalStatisticsHighDimensional, MathematicalStatisticsNonparametric; the bandit model is owned by MultiArmedBandits (copied here only to state the theorems, its scope excludes best-arm identification), the Gaussian and binary divergences and Bretagnolle–Huber by MathematicalStatisticsNonparametric; nothing else shared.

Source independence: 9 passages compared with 4 sources, none shared; largest share LattimoreSzepesvari2020, 10 of 29 locators; contents compared with LattimoreSzepesvari2020 (Chapter 33: simple regret, fixed confidence, budget): independent. KarninKorenSomekh2013 and EvenDarMannorMansour2006 could not be read.

Research link: Fixed-budget best-arm identification: sequential halving (Karnin, Koren and Somekh 2013; Lattimore and Szepesvári 2020, Theorem 33.10), median elimination (Even-Dar, Mannor and Mansour 2006), successive halving for Hyperband (Li et al. 2018, Theorem 1), and the change of measure of Kaufmann, Cappé and Garivier (2016, Lemma 1). Rests on the README's sources and the four texts read.

## Not verifiable

- Karnin, Koren and Somekh 2013 (Algorithm 2, Lemmas 4.2 and 4.3, Theorem 4.1, the constant `8`): the sources service does not classify the proceedings host and found no other legal copy; cited in 1.2, 2.1, 2.2.
- Even-Dar, Mannor and Mansour 2006 (Algorithm 4, Theorem 10, Lemmas 11 and 12, pp. 1088–1089, the median rule): the sources service does not classify the journal's host and found no other legal copy; cited in 1.2 and 4.1. The mathematics of 4.1 was verified independently of the source.
- Jamieson and Talwalkar 2016, the printed page 243: read in the arXiv version (Theorem 1 on its fourth page, consistent with pages 240–248), not in the proceedings pagination.

## Source issues

- **Error** in LiHyperband2018 at Theorem 1, p. 25 (inverse defined p. 23): the source says a budget above the threshold, built from the non-strict inverse of the envelope, returns an arm within half the tolerance; it should use the strict inverse or fix ties in favour of the best arm (two arms tied at the comparison time give a counterexample); affects a stated result.
- **Error** in LiHyperband2018 at Figure 9, p. 24: the source says each of the rounded-up-logarithm many rounds keeps the rounded-down half of the arms; it should keep the rounded-up half, since otherwise no arm is left when the number of arms is not a power of two; affects a stated result.
- **Error** in LiHyperband2018 at Theorem 1, second assertion, p. 25 (proof p. 41): the source says the reported loss is within the tolerance of the best limit, using a budget bound in terms of the inverse at a quarter of the tolerance; it should assume that bound, which the threshold does not imply; affects a stated result.
- **Misprint** in LattimoreSzepesvari2020 at Exercise 33.8, p. 419: the source says the plays per arm in a phase are the budget times a power of two over the logarithm; it should also divide by the number of arms; affects the proof.
- **Gap** in LattimoreSzepesvari2020 at Theorem 33.10, p. 412 (Algorithm 22, p. 413): the source says the bound holds for every budget with rounded-down plays and unspecified ties; it should exclude phases with zero plays (two far-apart deterministic arms and budget one, with an adverse tie, exceed the bound); affects a stated result.

## For the human reviewers

- Scope: 5.2 is stated as the roadmap's own, and 2.1, 3.1 and the explicit count of 4.1 are wider than their cited sources (README lines 201, 322, 384); no refereed source states them in these forms.
- Licence: KarninKorenSomekh2013 (PMLR 28) and EvenDarMannorMansour2006 (JMLR 7) are on the publishers' open pages, which the sources service does not classify; neither was read.
- Reuse: ten definitions and one instance of `Suggested.lean` (lines 43–109) are copied verbatim from the open roadmap MultiArmedBandits by the same author, as the file's docstring says.
