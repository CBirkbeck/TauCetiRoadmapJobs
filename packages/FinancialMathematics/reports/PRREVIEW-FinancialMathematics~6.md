# Review of FinancialMathematics (pull request #2557 at 1553734)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 18 lines changed since `9196a42`: four parenthetical section locators into Shreve 2004 (§2.2, §2.3, §3.1, §4.1), which change no statement, and a first reading of the description against this head, which it describes correctly. One format note is carried over, not blocking. The human reviewers should know that the new locators could not be compared with the book's text, which is behind a paywall.

## N01 — The domain D of Layer 3 is written without its lower time bound

Layer 3 (line 399) sets "D = {(s, t) : s > 0, t < T}", while the coefficients live on (0, ∞) × [0, T] and the starts have t₀ ∈ [0, T). Writing 0 ≤ t < T, with the time derivative at t = 0 taken from the right, says what §3.1 uses when it evaluates the operator at a start (s₀, 0).

## Previous findings

The previous report had no finding (R); its small correction and format note are accounted for here.

- C01 — repaired: §2.2 cites "Shreve 2004, §5.2.4 for the pricing formula and §5.3.2 for replication", §2.3 cites §5.4.3, §3.1 "for constant coefficients, Shreve 2004, §4.5", §4.1 §4.5; by section, since no copy was readable.
- N01 — not repaired: line 399 (398 before this change) still reads "D = {(s, t) : s > 0, t < T}"; carried as N01 above.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| §4.1 call and put cost (sentence now carrying the §4.5 locator) | s = K = 100, r = 0.05, σ = 0.2, T = 1 | d₊ = 0.35, d₋ = 0.15; Φ = 0.63683, 0.55962; call 63.683 − 95.1229·0.55962 = 10.4506; put 10.4506 − 100 + 95.1229 = 5.5735 / same | holds |
| §4.1 hedge worth the price | s = K = 1, r = 0, σ = 1, T = 1 | d± = ±1/2; Φ(1/2) − Φ(−1/2) = 0.6915 − 0.3085 = 0.3829 / 0.3829; call minus put hedge: 1 share, −1 bond | holds |
| §3.1 pricing equation (sentence now carrying the §4.5 locator) | C = s² e^((r+σ²)(T−t)); bond e^(−r(T−t)) | C_t = −(r+σ²)C, (σ²s²/2)C_ss = σ²C, r(sC_s − C) = rC, sum 0; bond: rC − rC = 0 | holds |
| §2.2 pricing formula (sentence now carrying the §5.2.4, §5.3.2 locators) | forward H = S_T − K; H = 1 | e^(rt)E_Q[e^(−rT)(S_T − K) \| F_t] = S_t − K e^(−r(T−t)); a = βh/(σS) = 1 with h = σS/β; H = 1 gives e^(−r(T−t)) | holds |
| §2.3 no arbitrage (sentence now carrying the §5.4.3 locator) | V₀ = 0, V_T ≥ 0 | E_Q[V_T/β_T] = V₀/β₀ = 0, so V_T = 0 Q-a.s., hence P-a.s. by equivalence; P(V_T > 0) = 0 contradicts arbitrage | holds |

The rows for the untouched statements stand as in the previous review, of `9196a42`; the diff changes no statement.

- Source locators checked against the text: 0 of 5 (§5.2.4, §5.3.2, §5.4.3, §4.5 twice, all `Shr04`); the text is recorded as paywalled and cited by locator alone. Each locator is qualified in the README by what it is cited for, and the References say that the hypotheses are the roadmap's own.
- Library declarations opened at the pins: none new; the changed passages name no declaration that the previous review had not resolved.
- Cross-roadmap citations resolved: none added by the change; MarketImpact's anchor `m01-assets-and-trading` is still at README line 84, and StochasticCalculus on main cites the labels M0.1 and M0.4, which the layer headings keep.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. No change outside the folder.
- Automatic checks: all passed.
- Elaboration: `Suggested.lean` gives three `sorry` warnings (lines 58, 83, 99) and nothing else; the file is unchanged since `9196a42`, and its three elaborated types agree with §3.3 and §4.2 as before.
- Description against the head: 25 Checks in eleven sections (counted); the supplier sections of StochasticCalculus and PDE, the three imports, the three declarations, the 26 removed declarations and the old labels M0.1–M0.4 agree with the head and with the folder's change; the sentence on the Shreve locators ("without theorem or page numbers") states the present change. Nothing a reader must know is left out: the description says that it revises a roadmap on main, how the sections were renumbered and which declarations went.

Overlap check: read MarketImpact, StochasticCalculus and DysonBrownianMotion on main and the open YoungIntegrationAndRoughPaths, MartingaleCentralLimitTheorem and LawOfTheIteratedLogarithm as in the previous review; nothing shared. The change adds no object; no open pull request changes this roadmap or drops an id it cites.

Source independence: changed passages only: 4 passages (the four locator parentheses) compared with 0 sources, since the text of `Shr04` could not be read; largest share `Shr04`, 5 of 5 locators; the change adds, removes or reorders no layer, so the contents were not compared again (the cited sections run Ch. 5, Ch. 5, §4.5, §4.5 against Layers 2, 2, 3, 4, which is not the book's order).

Research link: Layer 2 is the completeness and martingale-pricing theory of Harrison–Pliska (1981); Layer 4 is the Black–Scholes (1973) price and hedge; MarketImpact builds its feedback-pricing model on Layers 1–3. Rests on the README's and MarketImpact's reference lists; no source text was read.

## Not verifiable

- The seeded sample where it falls in the changed passages (§2.2, §2.3, §3.1, §4.1) against `Shr04` §5.2.4, §5.3.2, §5.4.3 and §4.5: the book is behind the publisher's paywall and no legal copy was found; the statements were checked by computation instead.
- Black–Scholes 1973, Harrison–Pliska 1981 and Karatzas–Shreve 1998: they carry no locator, and no legal copy was found in the earlier rounds; not requested again.

## Source issues

- none

## For the human reviewers

- Not tested: the five locators all point into Shreve 2004 (`Shr04`, sections 4.5, 5.2.4, 5.3.2, 5.4.3), which is paywalled; neither the wording nor the arrangement nor the section numbers were compared with its text.
- Scope: PDE on main still lists the bundled parabolic Hölder spaces as not at the pins (`TauCetiRoadmap/PDE/Suggested.lean`, line 48), while this roadmap states §3.3 on the pinned `TauCeti.ParabolicC2HolderSpace`.
