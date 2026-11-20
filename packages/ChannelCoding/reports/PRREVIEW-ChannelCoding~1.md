# Review of ChannelCoding (pull request #2799 at 3ee689e)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement, every number in a Check and every degenerate case (empty alphabets, word length 0, zero or one message, negative `γ` and `δ`) was recomputed and agrees with the text, `Suggested.lean` elaborates with `sorry` as its only warning, and the three suppliers state what is consumed from them. There are two small corrections and no format note, none blocking. One thing is left to the humans: the locators into Polyanskiy–Wu, 19 of the 22 in the README, could not be checked because no copy could be read through the project's sources service; the three locators into MacKay were read and are right.

## C01 — The entropy `log M` of a uniform label is attributed to a supplier section that does not state it

In the `*Needs:*` line of 2.4 (README line 366) the route's step `H(U) = log M` is charged to "ProbabilisticAndMetricNumberTheory §5.1a (the entropy `log M` of a uniform label, the chain rule)". That section, as it is on main, proves the chain rule, the bounds `0 ≤ H(X) ≤ log |A|` and additivity for independent labels; the only uniform value it gives is the fair bit, as a Check. An implementer who looks for the general statement there finds nothing.

The fact is one line from the definition (`M · negMulLog (1/M) = log M`), so the smallest change is to say so: "§5.1a (the chain rule); `H(U) = log M` for a uniform label, immediate from the definition".

## C02 — The kernel bullet of 1.1 does not say that Tau Ceti already has the square case

The second API bullet of 1.1 (README lines 111–115) and the supplier contract "From Tau Ceti" (lines 568–571) present the correspondence between channels and Markov kernels as resting only on `ProbabilityTheory.Kernel.toMatrix` and `ProbabilityTheory.Kernel.ofPMF`. At the pin, `TauCeti/Probability/Kernel/Matrix.lean` already proves it when the two alphabets coincide: `ProbabilityTheory.Kernel.toMatrix_mem_rowStochastic` (line 103, the matrix of a Markov kernel on a finite type is row-stochastic), `Matrix.rowStochastic.toKernel` with `toMatrix_toKernel` (lines 132 and 148) and `toKernel_toMatrix` (line 184), all with entries in `ℝ≥0`; and `ProbabilityTheory.Kernel.comp_apply_singleton_eq_vecMul` (line 114) is the output-law formula `q = p · W` for any finite kernel between possibly different types.

The bullet is still needed, since a channel has `A ≠ B` in general and real entries, but a reader should be told how it differs. One clause in the bullet or in the contract would do: "Tau Ceti has the case `A = B` with entries in `ℝ≥0` (`toMatrix_mem_rowStochastic`, `Matrix.rowStochastic.toKernel`); the bullet is its rectangular, real-valued form."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `channelMutualInformation_eq_sum` | Z channel, uniform `p`; noiseless, `p = (3/4, 1/4)`; point mass; `p` not summing to 1 | Z: `q = (3/4, 1/4)`, `h(1/4) − (1/2)log 2 = 0.5623 − 0.3466 = 0.2158`, double sum same; noiseless `0.5623`; point mass `0`; identity needs only `∑_b W a b = 1` | true | none |
| 1.1 wrong variant `∑ p W log W` | Z channel, uniform | `−(1/2) log 2 = −0.3466 ≠ 0.2158` | Check separates | none |
| 1.2 `concaveOn_channelMutualInformation` | `bsc 0.1`: two point masses and midpoint | `0, 0, log 2 − h(0.1) = 0.6931 − 0.3251 = 0.3681`; midpoint above chord, so concave and not convex | true | none |
| 1.3 `isGreatest_channelCapacity` | Z channel; empty `A` | `p = (3/5, 2/5)`: `h(0.2) − 0.4 log 2 = 0.5004 − 0.2773 = 0.2231 = log(5/4)`; uniform `0.2158`; empty `A`: no input law, `sSup ∅ = 0`, not a member | true; `Nonempty A` needed | none |
| 1.4 `channelCapacity_productChannel` | `bsc 0.1`, `n = 2`, uniform on `{00, 11}`; `n = 0`; empty `A` | `H(Y²) = 1.1645`, minus `2h(0.1) = 0.6502`, gives `0.5143 < 2C = 0.7361`; `n = 0`: one word each side, `0 = 0·C`; empty `A`, `n ≥ 1`: `0 = n·0` | true | none |
| 1.5 `channelCapacity_bsc` | `δ = 0.11, 1/2, 0, 1` | `h(0.11) = 0.3465`, `C = 0.3466`; `0`; `log 2`; `log 2` | true | none |
| 1.5 `channelCapacity_bec` | `ε = 0.3, 1, 1/2` with `p = (3/4, 1/4)`; rows of `bec` | `0.7 log 2 = 0.4852`; `0`; `(1/2) h(1/4) = 0.2812`; each row sums `(1 − ε) + ε = 1` | true | none |
| 2.1 codes and errors | Z channel identity code; noiseless, `M = 3`; `M = 0` | errors `0, 1/2`, max `1/2`, average `1/4`; best average `1/3`, best max `1`; `M = 0` forces empty `Y`, average `0⁻¹·0 = 0` | true | none |
| 2.2 `exists_errorProb_le` | route recomputed; noiseless, uniform, `M = 3`, `γ = −4`; `M = 0` | stopping rule gives `ε < P + M'/γ`, so `M' ≥ M`; `γ = −4`: `i = log 2 < log 4`, right side `1 − 3/4 = 1/4 < 1` = best max error | true; `γ > 0`, `M ≥ 1` needed | none |
| 2.3 Shannon's bound from 2.2 | `bsc 0.1`, `n = 3`, uniform, `M = 2`, `τ = 1` | densities `1.763` (3 agree) and `−0.434` (2 agree) against threshold `1.693`: `1 − 0.729 + e⁻¹ = 0.6389`; repetition code `0.028` | true | none |
| 2.4 `one_sub_avgErrorProb_mul_log_le` | noiseless `M = 2, 3`; `M = 0`; `M = 1`; repeated codewords | `log 2 = log 2 + 0`; `(2/3) log 3 = 0.7324 ≤ 0.6931 + 0.6365 = 1.3297`; `M = 0`: `0 ≤ 0`; `M = 1`: `0 ≤ C`; non-injective encoder still gives `I(U; Y) = I(p', V)` | true | C01 (attribution only) |
| 3.1 `exists_errorProb_productChannel_le` | `bsc 0.1` uniform, `n = 1000`, slack `0.05`; noiseless; `n = 0`; `δ = −2` | `v = 0.09 (log 9)² = 0.4345`, `v/(nδ²) = 0.1738`, second term `≤ e^(−50)`; noiseless `v = 0`; `n = 0`: bound `M ≥ 1`; `δ = −2`: `3/(2e²) = 0.2030 < 1` | true; `δ > 0` needed | none |
| 3.2 `eventually_exists_errorProb_le` | `R ≤ 0`; `R > 0`; empty `A` | one message, error `0`; `⌈e^(nR)⌉ ≤ 2e^(nR)` gives `v/(nδ²) + 2e^(−nδ) → 0`; empty `A`, `R < 0 = C`, `n ≥ 1`: no code with `M ≥ 1` | true; `Nonempty A` needed | none |
| 3.3 `exists_pos_le_avgErrorProb` | `bec 1/2`, `R = log 2`; empty `A` | `Pₑ ≥ 1 − 1/2 − 1/n ≥ 1/4` for `n ≥ 4`; general `η = (1 − C/R)/2` once `n ≥ 2 log 2/(R − C)`; empty `A`: no codes, vacuous | true | none |
| Supplier: Fano (EntropyAndSourceCoding 1.3) | statement at the open head against its use in 2.4 | `H(X | Y) ≤ h(Pₑ) + Pₑ log(|A| − 1)` for any `g : B → A`, probability measure; used with `A = Fin M`, `M ≥ 1` | matches | none |
| Kernel bullet of 1.1 | Tau Ceti at the pin | `toMatrix` in `ℝ≥0` (Matrix.lean:44), `ofPMF` (PMF.lean:44); square case already proved (Matrix.lean:103, 132, 148, 184) | true | C02 |

- Source locators checked against the text: 3 of 22 (MacKay §9.3 p. 148, (9.10) p. 150, §10.1 part 1 p. 162; MacKay lines 11794–11808, 12018–12021, 12917–12923). The 19 into Polyanskiy–Wu: not read.
- Library declarations opened at the pin: 26 in Mathlib (all at the files the supplier contracts name, e.g. `Real.negMulLog_mul` NegMulLog.lean:177, `Real.binEntropy` BinaryEntropy.lean:64, `ProbabilityTheory.IndepFun.variance_sum` Variance.lean:424, `ProbabilityTheory.meas_ge_le_variance_div_sq` Variance.lean:398, `Convexity.StdSimplex.range_toFun_comp_weights` ConvexSpace/Defs.lean:111, deprecated `stdSimplex` StdSimplex.lean:39) and 2 in Tau Ceti. No mutual information of a channel, capacity or channel code at either pin.
- Cross-roadmap citations resolved: 3 roadmaps, 5 sections (ProbabilisticAndMetricNumberTheory §5.1a, §5.2 on main; EntropyAndSourceCoding 1.3, 3.1 at its open head; MathematicalStatisticsNonparametric §2.4 on main, `mutualInfoUniform` and `fano_average` with `2 ≤ M` as described).
- Dependency check output: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. EntropyAndSourceCoding is an open pull request that adds a new roadmap; ChannelCoding is placed after it.
- Elaboration: `sorry` the only warning, 11 declarations. Elaborated types compared with the README statements (three re-elaborated with `#check` on a probe copy, the rest read from their signatures, which carry every binder explicitly); no binder lost.
- One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `infer_instance`): 0 of 11 theorems close. Headlines of the README: all 11 stated; Shannon's bound 2.3 is named in the docstring as a consequence of 2.2.
- Pull request text against the head: counts (11 theorems, 13 definitions, one structure), suppliers and the dependency block agree with the head.
- Overlap check: read EntropyAndSourceCoding, DifferentialEntropyAndEntropyPower, BoundsOnCodes, MathematicalStatisticsNonparametric, ProbabilisticAndMetricNumberTheory; nothing shared (the first two put channel coding and channel capacity outside their scope; a search of every open roadmap and main for capacity, Feinstein, information density, the two binary channels found no other owner).

Source independence: 3 passages compared with 1 source (MacKay), none shared; largest share PolyanskiyWu, 19 of 22 locators; its text and its table of contents could not be read, so wording and arrangement were not compared with it. By the README's own locators the layers do not follow a run of its chapters (Layer 1 cites Chapters 18, 5, 19, 6, 19; Layer 2 Chapters 17, 18, 18, 17; Layer 3 Chapter 19).

Research link: The headline targets are Shannon's 1948 coding theorem, Feinstein's maximal-coding lemma and Fano's inequality as treated in Polyanskiy–Wu (2024); the README's scope section names what builds on them: error exponents, the strong converse and channel dispersion. Rests on the README.

## Not verifiable

- All 19 locators into Polyanskiy–Wu (Definitions 17.1, 17.2, 18.1; Theorems 5.3, 6.1(a), 17.3, 18.5, 18.7, 19.7, 19.8, 19.9; Propositions 18.2, 19.10; Corollaries 18.4, 19.5; Remark 18.4; Table 19.1; §19.3; (19.8)): the sources service did not accept the first author's MIT page as an author's page, and the publisher's page has no open copy. The text has been requested.
- The remark in 2.3 that Polyanskiy–Wu compare the two bounds after Remark 18.4 (p. 358), and the description of Theorem 18.5 as stated for `τ > 0` with decoders that may declare failure: same reason.
- The mathematics of each of these targets was checked independently of the source (table above).

## Source issues

- none

## For the human reviewers

- **Licence.** The README's main source is the prepublication PDF of Polyanskiy–Wu on the first author's MIT page (README lines 591–593). The sources service could not classify that host, so the copy's status is not settled.
- **Not tested.** Polyanskiy–Wu carries 19 of the 22 locators. Neither its text nor its table of contents was read: wording and arrangement were compared with MacKay only (3 passages, none shared).
