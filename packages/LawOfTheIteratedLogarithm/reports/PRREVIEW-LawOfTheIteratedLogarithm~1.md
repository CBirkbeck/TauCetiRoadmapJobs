# Review of LawOfTheIteratedLogarithm (pull request #2689 at 9937b6a)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason: Kolmogorov's lower exponential bound (1.1) is stated on the full range `ω < 1/256`, `λ > 512`, but the proof in the cited source, which the route follows, only reaches the stated constant when `ε ≤ 1.155…`, while that range allows `ε` up to `4`; both positive Checks of 1.1 lie in the unproved part. The statement is the source's own and no counterexample was found, so this is a gap in support, not a known falsehood, and the three laws of Layers 2 and 3 are unaffected. There is one small correction and one format note, neither blocking, and one licence fact for the human reviewers.

## R01 (P2) — The proof cited for 1.1 gives the stated bound only for `ε ≤ 1.155…`; on the rest of the stated range the bound with these constants has no proof in the roadmap or its sources

An implementer who follows the route of 1.1 ("comparing gives the bound", README line 96) reaches, as Kolmogorov does on p. 131, `P(S > x) > exp(−(a²B/2)(1 + 4δ))` with `a²B = x²/(B(1 − δ)²)` and `δ = ε/8`, and must then pass to `exp(−(x²/2B)(1 + 8δ))`. That last step is the inequality `(1 + 4δ)/(1 − δ)² ≤ 1 + 8δ`, which is equivalent to `8δ² − 15δ + 2 ≥ 0` and holds only for `δ ≤ (15 − √161)/16 = 0.1444…`, that is `ε ≤ 1.155…`. The hypotheses `ω < 1/256`, `λ > 512` give only `δ < 1/2` (Kolmogorov's (9), (10), p. 128). Values: at `δ = 0.1` the two sides are `1.728 ≤ 1.8`; at `δ = 0.2`, `2.8125 > 2.6`; at `δ = 0.49`, `11.38 > 4.92`. So for `ε` between `1.155…` and `4` (any `ω > 1/3066`, or any `λ` below about `6750`) the argument proves a weaker exponent than the one stated, and `kolmogorov_lower_exponential_bound` in `Suggested.lean` (line 49), which is the acceptance test, asks for a statement that neither the route nor the cited proof delivers. Both positive Checks of 1.1 are in this part: the Rademacher instance has `ε = 3.919`, `δ = 0.490`, where the argument yields `exp(−3198.9…)` and not the printed `exp(−1383.5…)`; the Bernoulli instance has `ε = 2.862`, `δ = 0.358`, where it yields `exp(−13098.0…)` and not `exp(−8582.6…)`. (In both instances the stated bound is numerically true, the exact tails being `exp(−285.3…)` and at least `exp(−2232.1…)`; what is missing is a proof on the range, not a counterexample.)

The smallest change is to add the hypothesis `ε ≤ 1` to 1.1 and to the Lean statement, for instance as `kolmogorovEpsilon (x * M / B) (x ^ 2 / B) ≤ 1` (equivalently `ω ≤ 1/4096` and `log λ / λ ≤ 1/1024`): then `δ ≤ 1/8` and the last step reads `1.959… ≤ 2`. Nothing downstream is lost, since 2.1 uses 1.1 with `ε → 0` and 3.1 with `ε` small in `η`. The two positive Checks would then need instances with `ε ≤ 1`, or a sentence saying that they illustrate the source's statement outside the range proved here. The alternatives are to keep the range and state what the argument gives, `exp(−(x²/(2B(1 − δ)²))(1 + 4δ))` with `δ = ε/8`, or to keep the statement and add a route, with a source, for `1.155… < ε < 4`. The summary's first headline and the first bullet of the pull request description would change with it.

## C01 — Neither locator given for the cluster set (3.2) is a proof

A reader who opens the locators of 3.2 finds an exercise (Durrett, Exercise 8.5.2, p. 419, which asks for a direct proof) and Theorem 8.5.3 (p. 419), which Durrett states without proof and attributes to Strassen (1964). The statement is correct and the README's own route (limit points confined by 3.1, successive differences tending to `0`) is complete, so nothing is unsupported; but the sentence reads as if the source proved it. Saying "stated as an exercise" and "stated without proof there; Strassen 1964 for the proof" would be accurate; a primary locator in Strassen's paper would be better still.

## N01 — The first layer heading in `Suggested.lean` differs from the README's

`Suggested.lean` line 42 has `## Layer 1: the exponential bounds`; the README's Layer 1 is "Kolmogorov's lower exponential bound" (the upper bounds are explicitly not targets). The two definitions also stand before that heading.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: `iteratedLogScale` | `v = 3, e^e, e, 2, 0.01, −2, 0, 1`; `n = 10⁶` | `0.7512`, `5.5053`, `0`, `0`, `0.17477`, `1.2108`, `0`, `0`; `2291.6` | all as printed; zero exactly on `{0} ∪ [1/e, e]` for `v ≥ 0` | none |
| Conventions: `EReal` limits | `u_n = n` | real `limsup = sInf ∅ = 0`; `EReal` value `⊤` | Check true and discriminating | none |
| 1.1 statement against source | Hilfssatz IV, p. 128 read in the scan | `ω < 1/256`, `λ > 512`, `ε = max(32√(log λ/λ), 64√ω)`, `δ = ε/8`, `a = x/(B(1−δ))` | statement and constants as in source | none |
| 1.1 proof, last step | `δ = 0.1, 0.125, 0.1445, 0.2, 0.49` | `(1+4δ)/(1−δ)²`: `1.728, 1.959, 2.1561, 2.8125, 11.38`; `1+8δ`: `1.8, 2, 2.156, 2.6, 4.92` | fails for `δ > 0.1444…` | R01 |
| 1.1 Check, Rademacher | `n = 4·10⁷`, `x = 1.5·10⁵` | `ω = 0.00375`, `λ = 562.5`, `ε = 3.9192` (other term `3.395`), exponent `1383.52`; Gaussian tail `≈ exp(−285.33)` | numbers right; `δ = 0.49` in gap range | R01 |
| 1.1 Check, Bernoulli | `p = 0.1`, `n = 10¹⁰`, `x = 2·10⁶` | `B = 9·10⁸`, `ω = 0.002`, `λ = 4444.4`, `ε = 2.862`, exponent `8582.6`; point mass `≈ exp(−2232.1)` | numbers right; `δ = 0.358` in gap range | R01 |
| 1.1 negative controls | `n = 100, x = 0.1`; one sign, `x = 30` | `λ = 10⁻⁴`, `ε = 2.024` (log term is `0`), bound `0.99985` vs `P = 0.4602`; `ω = 30`, `P = 0` | both hypotheses needed | none |
| 1.1 degenerate | `s = ∅`; `B = 0` | `x²/0 = 0`, so `512 < 0` false; `M ≥ 0` forced when `s ≠ ∅` | not vacuous-true by junk | none |
| 1.1 Bernstein comparison | `t = xM/B` | `1/(1+t/3) ≥ 1 − t/2` iff `t/6 + t²/6 ≥ 0`; `≥ 1/2` iff `t ≤ 3`; `x/4M` case iff `(5/3)xM ≥ B` | Hilfssätze I–III with `≤` follow | none |
| 2.1 against source | p. 126 read in the scan | conditions I, II; source indexes from 1 so its `B_n` is README's `B_{n+1}` | shift correct | none |
| 2.1 hypothesis junk | `B → ∞` | eventually `B_{n+1} > e^e`, denominator positive; `m_n ≥ 0` forced | hypothesis not vacuous | none |
| 2.1 Checks | `α = 1`; `2^n`; `2^{−n}` | `0.0944`, `0.00333`; ratio `1.41` (n=10), `1.880` (n=80), quotient bound `0.7667`, `0.565`; `B_n ∈ {0} ∪ [1, 4/3)`, scale `0` | all true | none |
| 2.2 | route `m_n = 1`, `B_n = n` | hypothesis `√(log log(n+1)/(n+1)) → 0`; mean `0`, variance `1` at the pin | case of 2.1 | none |
| 3.1 against source | Theorem 8.5.2, p. 418 | i.i.d., mean `0`, second moment `1`, upper limit `1` | scaling and sign give stated form | none |
| 3.1 `σ = 0`; remainder series | `X = 0` a.s.; `c_k = √(k/log log k)` | all quotients `0`; `∑_{k ≤ K} 1/√(k log log k) ≈ 2c_K`, so series `≲ 2E[X²]/η` | degenerate case true; route step converges | none |
| 3.1 Check on moments | density `∝ |x|^(−5/2)` | `E|X| = ∫ x^(−3/2) < ∞`, `E|X|^(3/2) = ∫ x^(−1) = ∞` | true | none |
| 3.2 | `n = 1000, S_n = 30, X_n = −1`; `σ = 0` | step `0.016335`, `1/a_n = 0.016085`; identity `u_{n+1} − u_n = X/a_{n+1} − u_n(1 − a_n/a_{n+1})`; cluster set `{0}` | Check true; iff holds in both directions | C01 (locator only) |

- Source locators checked against the text: 11 (Kolmogorov1929: p. 126 conditions and display (2), Hilfssätze I–V pp. 127–131, §2 pp. 132–133, §3 pp. 133–135, read in the GDZ scan and its page images; Durrett2019 lines 19780, 19887, 19930, 19945, 19950 with printed pages 416, 418, 419).
- Library declarations opened at the pins: 20 (Mathlib: `Probability/Independence/Basic.lean` 135, 669; `Probability/BorelCantelli.lean` 51, 70; `MeasureTheory/OuterMeasure/BorelCantelli.lean` 62; `Probability/Martingale/OptionalStopping.lean` 144; `Probability/Martingale/Basic.lean` 65; `Probability/Moments/Basic.lean` 122, 430; `MeasureTheory/Integral/Layercake.lean` 476; `Probability/IdentDistrib.lean` 68, 106; `Probability/HasLaw.lean` 39; `MeasureTheory/Function/LpSeminorm/Defs.lean` 154; `Topology/Defs/Filter.lean` 284; `Probability/StrongLaw.lean` 598; `Probability/Moments/SubGaussian.lean` 772. Tau Ceti: `Probability/Moments/Bernstein.lean` 92, 115; `Probability/Distributions/Rademacher/Basic.lean` 31, 192, 197).
- No law of the iterated logarithm at either pin (object search in both libraries: no hit in a probability file).
- Cross-roadmap citations resolved: 2 (StochasticCalculus §6.3 `brownian_lil`, README line 2143 and `Suggested.lean` line 423 on main; MathematicalStatisticsAsymptotic, Bahadur–Kiefer scope bullet, README lines 2497–2500 on main).
- Dependency check: `depcheck: 186 roadmaps, 2084 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `Suggested.lean`: five `sorry` warnings, nothing else. `#check`-level comparison of the seven elaborated signatures with the README: same hypotheses, no lost binder. One-tactic probe (`simp`, `rfl`, `infer_instance`) on a copy: none of the five theorems closes; no padding.
- Headline theorems (five: 1.1, 2.1, 2.2, 3.1, 3.2) are all stated in `Suggested.lean`; the two definitions have real bodies; single `import Mathlib` plus one existing Tau Ceti module; no `set_option`.
- Overlap check: read SeriesOfIndependentRandomVariables, LocalLimitTheorems, MartingaleCentralLimitTheorem, RandomWalkFluctuationTheory (open), MathematicalStatisticsAsymptotic, StochasticCalculus (main); RandomMatrices and DysonBrownianMotion searched by object only; nothing shared. Kronecker's lemma and the Lévy–Ottaviani inequality are owned by SeriesOfIndependentRandomVariables (1.1, 2.1), which places the law of the iterated logarithm outside its scope; this roadmap states neither. The Brownian law is owned by StochasticCalculus §6.3.

Source independence: 7 passages compared with 2 sources (statements of 1.1, 2.1, 3.1, 3.2, the moment Check of 3.1, the route of 1.1, the opening summary), none shared beyond wording the mathematics forces; largest share Kolmogorov1929, 8 of 14 locators; contents compared with Kolmogorov1929 (§1 lemmas, §2 upper half, §3 lower half): independent — Layer 1 keeps one of its five lemmas, Layer 2 merges §§2–3 with Khinchin's law, Layer 3 is not in it, and the order 1.1 before 2.1 is forced by the *Needs* line of 2.1.

Research link: Kolmogorov (1929) and Hartman–Wintner (1941) are the scalar laws; Strassen's (1964) invariance principle and (1965) converse extend them (Durrett2019 §8.5); MathematicalStatisticsAsymptotic names a law of the iterated logarithm as the missing input for the Bahadur–Kiefer theorem. Rests on the README and Durrett2019.

## Not verifiable

- Khinchin (1924), Hartman–Wintner (1941), de Acosta (1983), Strassen (1964, 1965): attributed in prose without locators; not opened.
- The truth of 1.1 for `1.155… < ε < 4`: checked only numerically on the two instances of the Checks; no proof read.
- Ownership against public formalisations outside the pinned libraries was not searched.

## Source issues

- **Gap** in Kolmogorov1929 at Hilfssatz IV, proof, final display, p. 131: the source says the bound with `(1+4δ)/(1−δ)²` implies the one with `1+8δ`; it should be restricted to `δ ≤ 0.1444…`, whereas only `δ < 1/2` is available; affects the proof.
- **Misprint** in Kolmogorov1929 at Hilfssatz IV, proof, final display, p. 131: the source says the last two exponents are positive multiples of `x²/2B`; it should be their negatives; affects nothing.
- **Misprint** in Durrett2019 at the remark after Theorem 8.5.3, p. 419: the source says equality `f(1)² = 1` holds only for `f(t) = t`; it should be `f(t) = ±t`; affects nothing.

## For the human reviewers

- Licence: Durrett2019 was read from the author's page at Duke; its title page says all rights reserved (Durrett2019 line 9). The README uses its theorem numbers, pages and own-word statements only.
- Licence: no search was made for public formalisations of these laws outside the pinned libraries; the description says none was used.
