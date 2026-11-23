# Review of FinancialMathematics (pull request #2557 at 56ba65f)

**Verdict:** accepted

**Summary.** Accepted: no finding. This is an incremental re-review of the 21 README lines changed since e5111e5 and of the pull request's description. Both small corrections of the previous review are repaired, and the repair is mathematically sound: M0.3 now takes D = {s > 0, 0 ≤ t < T} with a right time derivative at t = 0, the set where σ ≠ 0 is correctly "open in D", and the growth adapter of §3.3 proves class C^(2,1) on D and the equation at t = 0 and takes starts t₀ ∈ [0, T). The description agrees with this head. One format note is carried, not blocking; for the human reviewers, Shreve 2004 remains unread (paywalled).

## N01 — The section comments of `Suggested.lean` say "Layer 3" and "Layer 4" where the README says M0.3 and M0.4

Lines 45 and 74 of the Lean file, unchanged since the previous review; the README's ids are the milestones M0.1–M0.4.

## Previous findings

The previous report had no finding (no R-numbered remark). Its two small corrections and its format note:

- C01 — repaired: "Let D = {(s, t) : s > 0, 0 ≤ t < T}; class C^(2,1) on D is that of Convention 8 with the time derivative at t = 0 taken from the right" (line 429); §3.3 now takes "t₀ ∈ [0, T)" (line 568). No new problem introduced.
- C02 — repaired: the description now says "StandardDistributions is therefore no longer a supplier: Scope and ownership lists it among the roadmaps owned elsewhere and not consumed here."
- N01 — not repaired: `Suggested.lean` is unchanged; carried as N01 above.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| M0.3 opening: class C^(2,1) on D with right derivative at t = 0 | C = s² e^((r+σ²)(T−t)) at t = 0; Itô from t₀ = 0 | right derivative −(r+σ²)C, operator −(r+σ²)C + σ²C + rC = 0 at t = 0; Itô on [ε, t], ε ↓ 0, by continuity | holds |
| §3.1: U = {σ ≠ 0} "open in D" | σ ≡ 1; σ(s, t) = t | σ ≡ 1: U = D, contains (s, 0), not open in the plane but open in D; σ = t: U = D ∩ {t > 0} | holds; the earlier "an open set" would be false for σ ≡ 1 |
| §3.1: operator vanishes on U from all starts, t₀ = 0 included | start (s₀, 0) ∈ U | operator jointly continuous on D (Convention 8 with right derivative); a.e. zero along paths for t ↓ 0 gives zero at (s₀, 0) | holds |
| §3.3 growth adapter: C of class C^(2,1) on D, equation at t = 0, bound, moment from t₀ ∈ [0, T) | h(s) = s, v = ρ = e^y/(1+e^y); constant σ, t₀ = 0 | s C_s = sρ + (1+s)ρ(1−ρ) = s; 2s ≤ (2·1 + ¼)(1+s); (S/β)² = (s₀/β₀)² e^(σ²t) E(2σW^Q)_t ≤ e^(ΛT)·martingale | holds |
| §3.3 route: "time derivative of `TauCeti.ParabolicC2HolderSpace` is taken within [0, T]" | definition at the pin | `HasDerivWithinAt … (Icc a b) t` in the graph condition (`Analysis/PDE/Parabolic/Holder/Two.lean:110–112`), `hasTimeDerivWithinAt` (`:248`); gradient bounded continuous, Hessian and time derivative Hölder | holds |
| `existsUnique_weighted_price` (cited by the changed text; unchanged) | elaborated type against §3.3 | equation for s > 0, t ∈ Ioo 0 T, as README line 536; the t = 0 claim is the adapter's, in prose only | Lean type equals README |

The rows for the untouched statements stand as in the previous review, of `e5111e5`.

- Source locators checked against the text: 0; the changed passages carry no locator, and `Shr04` cannot be read (see below).
- Library declarations opened at the pinned Tau Ceti: `TauCeti.ParabolicC2HolderSpace` (`Analysis/PDE/Parabolic/Holder/Two.lean:119`), its graph condition (`:106–112`), `timeExtension` (`:84`), `hasTimeDerivWithinAt` (`:248`), `derivWithin_eq` (`:271`).
- Cross-roadmap citations in the changed passages: StochasticCalculus §9.1 (unchanged, resolved on main in the previous review); none added. No citation or Lean name of the README is unresolved.
- Record against the README at the merge base: no layer or item removed or retitled; main's M0.3 reads "C^{2,1} on s>0, t<T", which the head widens to include t = 0, as the description states.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the folder. Automatic checks: all passed, re-run on this head.
- Elaboration: `Suggested.lean` gives three `sorry` warnings (lines 58, 83, 99) and nothing else; the file is unchanged since `e5111e5`, so the signature comparison and the one-tactic probes of the previous review stand.
- Description against the head: the milestone record, the supplier contracts (Mathlib, Tau Ceti, StochasticCalculus, PDE; PDE is already a supplier on main), the dropped supplier StandardDistributions, the four changed statements (M0.3 domain, §3.3 hypotheses and identification, §4.2 class, §3.2/§4.1 terminal positions), and the removed and added Lean declarations all agree with the head; nothing contradicted, nothing left unstated.

Overlap check: read MarketImpact, StochasticCalculus and DysonBrownianMotion on main and the open DiscreteTimeFinance, BinomialToBlackScholes and PortfolioTheory; nothing shared (as in the previous review; the change adds no object, and no open pull request changes this roadmap or drops an id it cites).

Source independence: changed passages only; 0 passages compared with 0 sources, since the text of `Shr04` could not be read and the changed passages cite no source; largest share `Shr04`, 11 of 12 locators; the change adds, removes and reorders no layer, so the arrangement was not compared again.

Research link: M0.2 is the completeness and martingale-pricing theory of Harrison–Pliska (1981); M0.4 is the Black–Scholes (1973) price and hedge; MarketImpact builds its feedback-pricing model on M0.1–M0.4. Rests on the README's reference list and MarketImpact's README; no source text was read.

## Not verifiable

- The seeded sample against `Shr04` (§4.5, §5.2.1, §5.2.2, §5.2.4, §5.2.5, §5.3.2, §5.4.3): the book is paywalled, recorded as cited by locator alone, and no copy is in the sources cache; the changed passages were checked by computation and against the pinned library.

## Source issues

- none

## For the human reviewers

- Not tested: eleven of the twelve locators point into Shreve 2004 (`Shr04`, §4.5, §5.2.1, §5.2.2, §5.2.4, §5.2.5, §5.3.2, §5.4.3), which is paywalled; wording, arrangement and section numbers were not compared with its text.
- Licence: the board's manifest entry for `Shr04` lists the sections 4.5, 5.2.4, 5.3.2 and 5.4.3; the README at this head also cites §5.2.1, §5.2.2 and §5.2.5.
- Scope: PDE on main says the bundled parabolic Hölder spaces are not at the pins (`TauCetiRoadmap/PDE/Suggested.lean`, line 48), while this roadmap states §3.3 on the pinned `TauCeti.ParabolicC2HolderSpace`.
