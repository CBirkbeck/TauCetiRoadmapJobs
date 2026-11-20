# Review of OptimalStopping (pull request #2714 at b64cca2)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every theorem, definition, Check and numerical value was recomputed (the envelope examples, the threshold formula and optimal thresholds for `n ≤ 10`, the values near `1/e`, the prophet inequality with only `X n ≥ 0` and its sharpness family) and all agree with the text and with `Suggested.lean`, which elaborates with `sorry` as its only warning. There is one small correction (a hypothesis left implicit in 2.1), not blocking. For the humans: the locators into Ferguson's online text and Bingham's lecture notes could not be checked against the texts, and the standing of those two sources is theirs to judge.

## C01 — The reduction to the adapted reward in 2.1 does not say which `R` it is about

In the second "Prove" sentence of 2.1 (README lines 225–228), the equality of the expected reward at `τ` with the expected value of `(i + 1)/n · 1{R i = 0}` is stated "for every stopping time `τ` of `rankFiltration R hR` with `τ < n`" and carries no hypothesis on `R`. Read after the preceding sentence it is about the ranks of a uniform permutation; but the route of 2.3 uses it for an arbitrary measurable `R` with `IsRelativeRanks μ n R`, and without that hypothesis it is false: for `n = 2` and `R ≡ 0`, stopping at `0` earns `0` (candidate `1` is also relatively best), while the adapted reward at `0` is `1/2`. Begin the sentence with "if the `R i` are measurable and `IsRelativeRanks μ n R` holds", as 2.2 and 2.3 do.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 envelope, supermartingale (`snellEnvelope_supermartingale`) | `N = 0`; coin toss; constants `(2,0,1)`; `Z 0` not `𝓕 0`-measurable | `U = Z 0` constant in `n`; `U 0 = max(1, 3/2) = 3/2`; `U = (2,1,1)`, without max `(1,1,1) < 2`; `U 0` not adapted | holds; hypotheses needed | none |
| 1.1 minimality (`snellEnvelope_le_of_supermartingale`) | `N = 0`; `Z 1 = −1/ω` on `(0,1]`, `V = −1`; `Z` not adapted | `U 0 = Z 0 ≤ V 0`; `μ[Z 1 ∣ 𝓕 0] = 0`, `U 0 = 0 > −1`; induction uses only integrability and `condExp_mono` | holds; integrability needed, adaptedness not | none |
| 1.2 conditional optional sampling | `τ = n`; `V k = −k`, `τ = 0`, conditioning at `1`; route at `min N τ = τ`, `min n τ = n` | equality; `0 > −1` so `n ≤ τ` needed; stopped process of `−V` at `N` and `n` gives `−V τ`, `−V n` | holds | none |
| 1.3 bound (`condExp_stoppedValue_le_snellEnvelope`) | coin toss `τ = 0, 1`; `n > N` | `1 ≤ 3/2`, `3/2 ≤ 3/2`; hypotheses `n ≤ τ ≤ N` contradictory, vacuous | holds | none |
| 1.3 attainment (`condExp_stoppedValue_optimalStoppingTime`) | coin toss; `Z = (1,1)`; `Z = (1,0,3)`; `n > N`; pointwise split on `{U n = Z n}` | time `1`, value `3/2`; time `0`; `U = (3,3,3)`, time `2`, look-ahead earns `1`; time `N`, both sides `Z N`; off the event `U n = μ[U (n+1) ∣ 𝓕 n]` pointwise | holds | none |
| 1.4 value (`isGreatest_integral_stoppedValue`) | `N = 0`; coin toss | `μ[Z 0]`; `3/2` attained by `τ = 1`, `τ = 0` earns `1` | holds | none |
| 2.1 `IsRelativeRanks`, reward, reduction | `n = 3` permutations; `i = 0`; `∏_{i<j<n} j/(j+1)`; `R ≡ 0`, `n = 2` | 6 rank sequences each once; `μ{R 0 = 0} = 1`; product `= (i+1)/n`; reward `0` against `1/2` | holds under `IsRelativeRanks` | C01 |
| 2.2 `integral_stoppedValue_thresholdRule` | `n = 4`, `r = 1..4`; `r = 1`; `r = n ≥ 2`; `n = r = 1`; difference `p(r+1) − p(r)` at `r = 1` and `r ≥ 2` | `1/4, 11/24, 5/12, 1/4`; `1/n`; `(n−1)/n · 1/(n−1) = 1/n`; `1`; `(S_{r+1} − 1)/n` both cases | holds | none |
| 2.3 `secretary_isGreatest`, `secretaryThreshold` | `n = 0, 1, 2`; `n = 1..10` exact | thresholds `1,1,1` then `1,1,2,2,3,3,3,4,4,4`; values `1, 1/2, 1/2, 11/24, 13/30, 77/180, 29/70, 459/1120, 341/840, 3349/8400`; each the maximum over `r`; unique for `3 ≤ n ≤ 10`, tie `{1,2}` at `n = 2` | holds | none |
| 2.4 limits | `n = 100, 1000, 10⁶` | `38`, `0.3710428`; `369`, `0.3681956`; `367880`, `0.36787976`; `e⁻¹ = 0.36787944` | consistent | none |
| 3.1 `prophet_inequality` | `n = 0`, `X 0 = −1`; `X 0 ∈ {−1, 3}`, `X 1 = 1`; `X 0 = 2`, `X 1 = 3` w.p. `1/3`; route bound | `−1 ≤ −2` false; `μ[M] = 2`, reward `2`; `μ[M] = 7/3`, threshold `7/3` earns `1 < 7/6`, `7/6` earns `2`; `t p + (1 − p)(μ[M] − t) = t` | holds with `X n ≥ 0` only; a.e. measurability suffices | none |
| 3.2 `prophet_inequality_sharp` | `B = 2, 10, 100`; `c ≤ 0`; stopping times on trivial `𝓕 0` | `3/2, 19/10, 199/100` against `1`; `c · 1 < 2 − 1/B` iff `B > 1/(2 − c)`; only `τ ≡ 0`, `τ ≡ 1` | holds | none |

- Source locators checked against the text: 1 of 18 (Kleinberg–Weinberg §1, KleinbergWeinberg2012 lines 64–67, and its rank-one proof, lines 245–279); the other 17 are in texts that could not be read.
- Library declarations opened at the pin: 36, all present where cited (for example `Submartingale.stoppedProcess`, `Mathlib/Probability/Martingale/OptionalStopping.lean:95`; `Adapted.isStoppingTime_hittingBtwn`, `Mathlib/Probability/Process/HittingTime.lean:400`; `iIndepFun.indepFun_finset₀`, `Mathlib/Probability/Independence/Basic.lean:811`; `Real.tendsto_harmonic_sub_log`, `Mathlib/NumberTheory/Harmonic/EulerMascheroni.lean:153`). Mathlib's `Probability/Martingale/OptionalSampling.lean` treats martingales only; no Snell envelope, secretary or prophet statement at either pin.
- Cross-roadmap citations resolved: 3 (MarkovDecisionProcesses 2.1, its scope line on optimal stopping, its Downstream consumers), all on main as described.
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. Suppliers: Mathlib only.
- Elaboration: `Suggested.lean` elaborates, 11 `sorry` warnings and nothing else; with each `sorry` replaced by `simp`, none of the 11 theorems closes. The 20 elaborated types agree with the README statements; no binder lost.
- Headlines: all 11 of the README's headline statements are stated; none is declared not statable. No padding found.
- Pull request text: title and description agree with the head (new roadmap, 11 theorems, 9 definitions, Mathlib only); no change outside the folder.
- Automatic checks: all passed.

Overlap check: read MarkovDecisionProcesses, StochasticCalculus, MultiArmedBandits, MarkovChainsAndRenewal, MartingaleCentralLimitTheorem; nothing shared (StochasticCalculus 2.3 samples martingales in continuous time; none states a Snell envelope, supermartingale sampling at bounded times, or either classical problem).

Source independence: 3 passages compared with 1 source (KleinbergWeinberg2012), none shared, the proof route of 3.1 differs from that source's; largest share Ferguson, 12 of 18 locators; contents not compared with Ferguson, whose text and table of contents could not be read, nor wording with Ferguson or Bingham.

Research link: Layer 3 is the prophet inequality of Krengel, Sucheston and Garling (1978) with the threshold of Kleinberg and Weinberg (2012), whose paper extends it to matroids (KleinbergWeinberg2012 §1, read); Layer 1 is Snell's envelope (1952), per the README's References.

## Not verifiable

- Ferguson, *Optimal Stopping and Applications*, all locators (1.1, 1.3, 1.4, 2.1–2.4, 3.1, 3.2): the sources service does not recognise the UCLA page as the author's and returned no text; no other copy was sought.
- Bingham, M3A22 Lecture 13, all locators (1.1–1.4): likewise for the Imperial College page.
- The attributions to Snell, Krengel–Sucheston and Samuel-Cahn: the README says these papers were not consulted; only the Krengel–Sucheston–Garling attribution is confirmed (KleinbergWeinberg2012 lines 30–40).

## Source issues

- **Misprint** in KleinbergWeinberg2012 at §3.1, p. 5: the source says the rule stops at the first weight at least the threshold, while its §1 says the first weight exceeding it; it should be one convention throughout; affects nothing.

## For the human reviewers

- **Not tested.** Ferguson's online text has the largest share of locators (12 of 18); neither its text nor its table of contents could be read, so wording and arrangement were not compared with it.
- **Licence.** The two main sources are copies on personal university pages (`www.math.ucla.edu/~tom`, `www.ma.ic.ac.uk/~bin06`) that the sources service could not classify as the authors' own.
- **Scope.** The sources read by the author are an online text, lecture notes and one arXiv paper; the refereed papers (Snell 1952, Krengel–Sucheston 1977–78, Samuel-Cahn 1984) are named in References but were not consulted. The secretary problem is a classical textbook problem.
