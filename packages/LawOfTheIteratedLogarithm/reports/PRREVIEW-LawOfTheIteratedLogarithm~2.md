# Review of LawOfTheIteratedLogarithm (pull request #2689 at cc4c2b8)

**Verdict:** accepted

**Summary.** Accepted: the hypothesis `ε ≤ 1` added to Kolmogorov's lower exponential bound (1.1) closes the gap of the previous review, the last step of the route now reads `1.959… ≤ 2`, and the new positive Checks lie inside the proved range with their numbers recomputed and correct. No finding remains. There are two small corrections (the two negative-control Checks of 1.1 no longer isolate the hypothesis each names; the hypothesis `ω < 1/256` is now implied by `ε ≤ 1`) and one format note, none blocking. The one licence fact for the human reviewers stands as before.

## C01 — The two negative controls of 1.1 violate `ε ≤ 1` as well, so neither shows that the hypothesis it names is needed in the statement as it now stands

A reader of the Checks "The condition on `λ` is needed" and "The condition on `ω` is needed" (README lines 122–125) expects an instance in which every other hypothesis holds. With the new hypothesis that is no longer so. In the first, `n = 100`, `x = 0.1` gives `ω = 0.001 > 1/4096`, hence `ε = 64 √ω = 2.0238… > 1`. In the second, `λ = 900` gives `32 √(log λ / λ) = 2.782… > 1` (the term is at most `1` only for `λ ≥ 9364.1…` when `λ > 512`), so `ε ≤ 1` fails through the `λ` term before `ω` is looked at. The printed values are right; the instances are excluded twice over.

Instances that fail one hypothesis only: for `λ`, `n = 10⁶` Rademacher terms and `x = 100` give `ω = 10⁻⁴ ≤ 1/4096`, `λ = 0.01`, `ε = 0.64`, right-hand side `exp(−0.005 · 1.64) = 0.9918…`, while `P(S > 100)` is about `0.46`; for `ω`, one Rademacher term and `x = 100` give `λ = 10⁴`, `32 √(log λ / λ) = 0.9711… ≤ 1`, `ω = 100`, and `P(S > 100) = 0`.

## C02 — With `ε ≤ 1` in place, the hypothesis `ω < 1/256` is implied and constrains nothing

The README itself notes (line 88) that `ε ≤ 1` says `ω ≤ 1/4096`, and `1/4096 < 1/256`; so `hw` in `kolmogorov_lower_exponential_bound` (`Suggested.lean` line 54) and "`ω = xM/B < 1/256`" in 1.1 and in the summary follow from the new hypothesis. (The hypothesis `λ > 512` is not implied: `log λ / λ ≤ 1/1024` also holds for `λ ≤ 1`, as the instance in C01 shows.) Nothing is false. If `ω < 1/256` is kept so that the statement reads as Kolmogorov's with one hypothesis added, a clause saying that it is implied would tell an implementer not to look for its use; otherwise it could be dropped from the statement and the Lean signature.

## N01 — `kolmogorovEpsilon`, whose docstring begins "1.1.", still stands before the `## Layer 1` section comment in `Suggested.lean` (lines 37–42); the heading itself now agrees with the README.

## Previous findings

- R01 — repaired: "If `x > 0`, `ω = xM/B < 1/256`, `λ = x²/B > 512` and `ε ≤ 1`, then …" (README line 83); `hε : kolmogorovEpsilon (x * M / B) (x ^ 2 / B) ≤ 1` (`Suggested.lean` line 55); positive Checks have `ε = 0.9711…`, `0.9265…`.
- C01 — repaired: "Exercise 8.5.2, p. 419, where it is stated as an exercise, for `σ = 1` … which Durrett states without proof as Theorem 8.5.3, p. 419, attributing it to Strassen (1964)" (README lines 267–269).
- N01 — partly repaired: `/-! ## Layer 1: Kolmogorov's lower exponential bound -/` (`Suggested.lean` line 42) now matches the README; the two definitions still precede it (N01 above).

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 last step of the route | `δ = 1/8`; roots of `8δ² − 15δ + 2` | `(1+4δ)/(1−δ)² = 1.95918…`, `1+8δ = 2`; small root `(15−√161)/16 = 0.144463…`, so `ε ≤ 1.15571…`; large root `1.73 > 1/2` | holds on `ε ≤ 1`; README's "true exactly for `δ ≤ 0.1444…` on `0 < δ < 1/2`" correct | none |
| 1.1 "`ε ≤ 1` says `ω ≤ 1/4096` and `log λ/λ ≤ 1/1024`" | `64√ω ≤ 1`; `32√(log λ/λ) ≤ 1` | `ω ≤ 1/4096 = 0.000244…`; for `λ > 512` the second holds iff `λ ≥ 9364.1…` | equivalence true | none |
| 1.1 "hence `ε < 4`" for the source's range | `ω = 1/256`; `λ = 512` | `64√ω = 4`; `32√(log 512/512) = 3.532…`, decreasing beyond | true | none |
| 1.1 Check, Rademacher | `n = 2.5·10¹¹`, `x = 5·10⁷` | `ω = 0.0002`, `λ = 10⁴`, terms `0.971153`, `0.905097`, exponent `9855.767`; exact binomial log-tail `−5005.524` | as printed; inside `ε ≤ 1` | none |
| 1.1 Check, centred Bernoulli | `p = 0.1`, `n = 2.5·10¹²`, `x = 5·10⁷` | `B = 2.25·10¹¹`, `ω = 0.0002`, `λ = 11111.1`, `ε = 0.926572`, exponent `10703.176`; exact binomial log-tail `−5560.796` | as printed; inside `ε ≤ 1` | none |
| 1.1 Check, unproved range | `n = 4·10⁷`, `x = 1.5·10⁵` | `ε = 3.91918`, stated form `1383.520`, route gives `3198.970`, exact log-tail `−285.341` | as printed | none |
| 1.1 negative controls against the new hypothesis | `n = 100, x = 0.1`; one sign, `x = 30`; replacements `n = 10⁶, x = 100`; one sign, `x = 100` | `ε = 2.0238`; `λ`-term `2.782`; replacement: `ε = 0.64`, bound `0.99183` vs `0.4602`; `λ`-term `0.9711`, `ω = 100`, `P = 0` | old instances fail `ε ≤ 1` too | C01 |
| 1.1 redundancy of hypotheses | `ε ≤ 1` against `ω < 1/256`, `λ > 512` | `1/4096 < 1/256`; `λ = 0.01` satisfies `ε ≤ 1` and not `λ > 512` | `ω` hypothesis implied, `λ` hypothesis not | C02 |
| 1.1 degenerate, new hypothesis | `s = ∅`; hypotheses jointly satisfiable | `B = 0`, `x²/0 = 0`, `512 < 0` false; Rademacher Check satisfies all five hypotheses | not vacuous | none |
| 1.1 Lean against README | elaborated type of `kolmogorov_lower_exponential_bound` | binders `hx`, `hw`, `hl`, `hε` present, `hε` on the same arguments `(x * M / B) (x ^ 2 / B)` as the conclusion | agree | none |
| 2.1 and 3.1 as consumers of 1.1 | block sums at level `(1−δ)·iteratedLogScale`; truncation at `η√(k/log log k)` | 2.1: `λ = 2(1−δ)² log log B' → ∞`, `ω → 0`; 3.1: `ω ≈ 2√2 η/σ²`, below `1/4096` for small `η` | `ε ≤ 1` holds eventually in both uses | none |
| 3.2 locators | Durrett2019 lines 19930, 19950 | Theorem 8.5.3 stated with attribution to Strassen (1964), no proof follows; Exercise 8.5.2 asks for a direct proof, limit set `[−1, 1]` | README sentence accurate | none |

The rows for the untouched statements (Conventions, 2.1, 2.2, 3.1, the Check of 3.2) stand as in the previous review, of `9937b6a`.

- Source locators checked against the text: 3 (Kolmogorov1929 lines 126–135 for the statement of Hilfssatz IV, lines 251–260 for its final display with `(1+4δ)`, `(1−δ)²` and `(1+8δ)`; Durrett2019 lines 19930 and 19950).
- Library declarations opened at the pins: none new; the change cites no further declaration.
- Cross-roadmap citations resolved: none changed; an object search of the open heads and main for the law, the lower exponential bound and the two definition names finds only StochasticCalculus §6.3, MathematicalStatisticsAsymptotic and the out-of-scope sentence of SeriesOfIndependentRandomVariables (README line 432).
- Dependency check: `depcheck: 182 roadmaps, 2068 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- The automatic checks all passed at this head. Elaboration of `Suggested.lean`: five `sorry` warnings, nothing else.
- One-tactic probe on a copy (`simp` with the definition unfolded, `rfl`, contradiction of the hypotheses by `linarith`): `kolmogorov_lower_exponential_bound` stays open; the new hypothesis does not make it trivial or contradictory.
- Pull request title and description read against this head: the first bullet states the added hypothesis and its reason; no sentence is contradicted.
- Overlap check: read SeriesOfIndependentRandomVariables, LocalLimitTheorems, MartingaleCentralLimitTheorem, RandomWalkFluctuationTheory (open), MathematicalStatisticsAsymptotic, StochasticCalculus (main) for the review of `9937b6a`, and searched all open heads and main by object at this head; nothing shared. The change adds no object.

Source independence: changed passages only; 4 passages compared with 2 sources (the paragraph on `ε ≤ 1`, the end of the route of 1.1, the Lean docstring of 1.1, the locator sentence of 3.2), none shared; largest share Kolmogorov1929, 8 of 14 locators; the diff adds, removes or reorders no layer, so the contents comparison stands: independent.

Research link: Kolmogorov (1929) and Hartman–Wintner (1941) are the scalar laws; Strassen's (1964) invariance principle and (1965) converse extend them (Durrett2019 §8.5); MathematicalStatisticsAsymptotic names a law of the iterated logarithm as the missing input for the Bahadur–Kiefer theorem. Rests on the README and Durrett2019.

## Not verifiable

- Kolmogorov1929, final display of Hilfssatz IV, p. 131: read in the OCR text only this round (lines 251–260, where the factors are legible but the layout is not); the page image was not rendered.
- The truth of Kolmogorov's bound for `1 < ε < 4`: outside the statement now, and the README says it is not proved here.
- Khinchin (1924), Hartman–Wintner (1941), de Acosta (1983), Strassen (1964, 1965): attributed in prose without locators; not opened.
- Ownership against public formalisations outside the pinned libraries was not searched.

## Source issues

- **Gap** in Kolmogorov1929 at Hilfssatz IV, proof, final display, p. 131: the source says the bound with `(1+4δ)/(1−δ)²` implies the one with `1+8δ`; it should be restricted to `δ ≤ 0.1444…`, whereas only `δ < 1/2` is available; affects the proof.
- **Misprint** in Kolmogorov1929 at Hilfssatz IV, proof, final display, p. 131: the source says the last two exponents are positive multiples of `x²/2B`; it should be their negatives; affects nothing.
- **Misprint** in Durrett2019 at the remark after Theorem 8.5.3, p. 419: the source says equality `f(1)² = 1` holds only for `f(t) = t`; it should be `f(t) = ±t`; affects nothing.

## For the human reviewers

- Licence: Durrett2019 was read from the author's page at Duke; its title page says all rights reserved (Durrett2019 line 9). The README uses its theorem numbers, pages and own-word statements only.
- Licence: no search was made for public formalisations of these laws outside the pinned libraries; the description says none was used.
