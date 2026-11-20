# Review of FinancialMathematics (pull request #2557 at 4a9abde)

**Verdict:** accepted

**Summary.** Accepted. The one finding of the previous round is repaired: §3.2 and §4.1 now hold a position at maturity that is worth the claim. In §4.1 that position is the almost-sure limit of the delta hedge, and §3.2's position is predictable on the Brownian filtration. All other earlier points are repaired except the missing source locators (C01). That leaves three small corrections and one format note, none of them blocking. The human reviewers still have to note that no source text could be read.

## C01 — No statement of the README carries a source locator, so no target can be checked against the literature

This is carried from the previous round. The References (lines 829–836) name four works without a theorem, section or page, and no target cites any of them. A reader therefore cannot tell which hypotheses come from the literature and which are the roadmap's own, such as the §3.2 growth criterion and the §4.2 class. Two changes would fix this. Give each classical target the theorem and page it comes from: completeness and pricing (§2.2), absence of arbitrage (§2.3), the progressive extension (§2.4), necessity of the pricing equation (§3.1), and the call and put replication and uniqueness (§4.1, §4.2). Then say which criteria are the roadmap's own formulations.

## C02 — The second Check of §1.1 calls the σ = 0 asset deterministic, which holds only when μ and S₀ are deterministic

§1.1 lets μ be any progressive process and S₀ any F₀-measurable variable. With σ = 0 and μ_t = W_t, the asset is S₀ exp(∫₀ᵗ W_u du). That is random and depends on the Brownian path, contrary to "the asset is deterministic … whatever the Brownian path" (lines 117–118). Two wordings would make the Check true. One is to begin it "For σ = 0 with μ and S₀ deterministic". The other is to say that for σ = 0 the asset is S₀ exp(∫₀ᵗ μ_u du) with no stochastic-integral term. Either keeps its contrast with a definition that leaves a term in W.

## C03 — MarketImpact's link to Layer 1 uses the old heading anchor, which no longer leads to the section

MarketImpact/README.md (line 612, on main and unchanged here) links to `../README.md#m01-assets-and-trading`, the anchor of main's heading "M0.1. Assets and trading". The renamed heading "Layer 1: assets and trading (M0.1)" (line 83) has the anchor `#layer-1-assets-and-trading-m01`. After the merge the link will therefore open the top of this README rather than Layer 1. The label M0.1 is kept, so the text of the citation stays right. MarketImpact's README is in this roadmap's folder, and changing that one anchor would repair the link. The other option is to leave it for MarketImpact's next revision.

## N01 — The StochasticCalculus contract and the scope list leave out §0.2, which Convention 6 consumes

Convention 6 (line 71) takes versions, indistinguishability and progressive measurability from StochasticCalculus §0.2. The "From TauCetiRoadmap.StochasticCalculus" contract (lines 813–821) and the consumed list under Scope and ownership (lines 721–727) do not list §0.2.

## Questions for the author

- Which step of §3.3 uses the hypothesis that the coefficients are globally Lipschitz in y, uniformly in t (line 482)? PDE §6.6 and §6.9, which the route cites, need only bounded Hölder coefficients and ellipticity. If the hypothesis serves the Feynman–Kac adapters this roadmap owns, saying so there would help. I could not settle this because those adapters are named but not stated. This is carried from the previous round.

## Previous findings

- R01 — repaired: "at maturity let `a_T = 1{S_T > K}` and `b_T = −K 1{S_T > K}/β_T`, the almost-sure limits of the hedge as t ↑ T, worth (S_T − K)⁺" (§4.1, line 581). §3.2 (lines 449–451) holds a position worth h(S_T).
- C01 — not repaired: the References (lines 829–836) still name four works without locators, and no target cites them. Carried as C01.
- C02 — repaired: "when |σ| is bounded above and away from zero and the market price of risk (μ − r)/σ is bounded, a solution continuous up to maturity" (lines 19–21).
- C03 — repaired: "exactly when the rebalancing identity of `TauCeti.Finance.IsSelfFinancing` (each rebalancing is paid for by the old position) holds for P-almost every ω; the predicate itself asks it for every ω" (lines 145–147).
- C04 — repaired: the formula, positivity, the σ = 0 case and the Gaussian law are now §9.4's, "used here as stated there" (lines 92–101). Only the identifications remain as targets.
- C05 — repaired: "The first three and the fifth need the stochastic integral" (`Suggested.lean`, line 27).
- C06 — repaired: StandardDistributions and MarketImpact now stand under "Owned elsewhere and not consumed here" (line 731).
- C07 — repaired: the description now says the update "replaces by citations the targets that the pinned Tau Ceti already proves or that StochasticCalculus §9.4 states, and states several targets more precisely".
- N01 — repaired: "statements listed in the preamble of Layer 2, §2.3, the head of Layer 4 and §4.1" (lines 806–807).

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| §1.1 formula, positivity, σ = 0, cited from StochasticCalculus §9.4 | §9.4 on main | progressive μ, σ, ∫(\|μ\|+σ²) < ∞, F₀-measurable S₀, positive for S₀ > 0, σ = 0 included / §9.4: same hypotheses and claims | holds |
| §1.1 Gaussian law of log S_t | μ = 0.1, σ = 0.2, S₀ = 1, t = 1 | mean 0.08, variance 0.04 / E S₁ = e^(0.08+0.02) = 1.10517 = e^(0.1); §9.4 needs deterministic S₀ > 0, as here | holds |
| §1.1 bond identification | σ = 0, μ = r = 0.05, β₀ = 2, t = 1 | S₁ = 2e^0.05 = 2.10254 / `bondPrice r 2 1` = 2·exp∫r = 2.10254 (Bond.lean l.74); S₀ = 1 gives 1.05127 | holds |
| §1.1 Check, σ = 0 | μ_t = W_t, σ = 0 | Check says deterministic / S₀ exp(∫₀ᵗ W_u du), random | false beyond deterministic μ, S₀ (C02) |
| §1.2 simple ⇔ `IsSelfFinancing` a.s. | n = 2, a₀ = 1, b₀ = 0, a₁ = 2, b₁ = −S_{t₁}/β_{t₁}; identity broken on a nonempty null set | 2S − S = S on both sides; a.s. form holds, ∀ω predicate (SimpleStrategy.lean l.365) fails / README now says a.s. | holds |
| §3.2 position at T | h(s) = s, C = s; a_T = 0, b_T = S_T/β_T | worth S_T = h(S_T) / continuous right side has limit lim C(S_t, t) = S_T | holds |
| §3.2 predictability at T | augmented Brownian F | F_T-measurable position / predictable representation forces F_{T−} = F_T, so the position is predictable | holds |
| §4.1 call at T | K = 1, r = 0, σ = 1; S_T = 1.5, 0.5 | τ = 10⁻²: (0.99998, −0.99997), worth 0.500001; limit (1, −1), worth 0.5; S_T = 0.5: (0, 0) / (S_T − K)⁺ = 0.5, 0 | holds; old a_T = b_T = 0 gave 0 |
| §4.1 put at T | same; S_T = 0.5, 1.5 | τ = 10⁻²: (−1.0, 1.0), worth 0.5; S_T = 1.5: (−2·10⁻⁵, 3.1·10⁻⁵) → (0, 0) / (K − S_T)⁺ = 0.5, 0 | holds |
| §4.1 "almost-sure limits" | event {S_T = K} | delta has no limit there / P(S_T = K) = 0, since S_T is lognormal with σ > 0 | holds a.s. |
| Overview, headline 2 | against §3.2 | bounds on σ and κ, continuity at T, growth A(1 + sᵖ), maximal 2p-moment / all five in §3.2, lines 437–458 | holds |
| `Suggested.lean` docstring | six listed headlines | stochastic integral needed for 1, 2, 3, 5; §3.3 needs Hölder spaces / "first three and the fifth" | holds |
| Tau Ceti contract pointer | 12 cited declarations | Layer 2 preamble NoArbitrage l.73; §2.3 l.117; Layer 4 head GBM l.96, ConditionalPrice l.193, 210; §4.1 ValueProcess l.232–305 | holds |

The rows for untouched statements stand as in the previous review of 87112b8: the Checks of §1.2, Layer 2, §3.1, §3.3 and §4.2, and the two theorems of `Suggested.lean`, whose signatures did not change.

- Source locators checked: 0, because the README still carries none.
- Library declarations opened at the pin: SimpleStrategy.lean 105, 117, 365, 484; Bond.lean 74; BlackScholes/NoArbitrage.lean 73, 117; GeometricBrownianMotion.lean 96; ConditionalPrice.lean 193, 210; Extension.lean 134; ValueProcess.lean 232, 245, 257, 269, 290, 305.
- Cross-roadmap citations resolved on main: StochasticCalculus §9.4 (explicit solution, positivity for S₀ > 0, the σ = 0 case, the Gaussian law for deterministic μ, σ, S₀ > 0, localization, the stopped integrating factor) and §0.2. No open pull request changes StochasticCalculus, PDE or MarketImpact. MarketImpact has one anchor link into this README (line 612), which is C03.
- Automatic checks: all passed, and the gate run again on this head gives OK. Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly two `sorry` warnings (lines 51 and 73). The elaborated signatures are unchanged and match README §4.2.

Overlap check: read MarketImpact, StochasticCalculus and DysonBrownianMotion (main), and MartingaleCentralLimitTheorem, YoungIntegrationAndRoughPaths and LawOfTheIteratedLogarithm (open); the lists are unchanged since the previous round. This change only turns §1.1's formula, positivity, σ = 0 case and Gaussian law into citations of StochasticCalculus §9.4, the owner on main, and stops listing MarketImpact and StandardDistributions as suppliers. A search of open and main roadmaps for self-financing, Black–Scholes, risk-neutral and geometric Brownian finds no other owner.

Source independence: changed passages only. 0 passages compared with 0 sources: the README carries no source locators (largest share: none, 0 of 0). No layer was added, removed or reordered, so the arrangement was not compared again.

Research link: Layer 2 is Harrison–Pliska's (1981) completeness and martingale-pricing theorem, and Layer 4 is the Black–Scholes (1973) price and its hedge. The sub-roadmap MarketImpact builds on Layers 1–3 for the Sircar–Papanicolaou (1997) feedback-hedging model. This rests on the References of the README and of MarketImpact; no source text was read.

## Not verifiable

- The seeded sample, §1.1 to §4.2: no target carries a source locator, so there was no theorem number, page or hypothesis list to check.
- Black–Scholes 1973, Harrison–Pliska 1981, Karatzas–Shreve 1998 and Shreve 2004: no legal copy was found when they were requested through the sources service in the previous round (publisher paywalls or no legal source). They were not requested again, since the README cites no locator in them.

## Source issues

- none

## For the human reviewers

- Not tested: the README (lines 829–836) cites Black–Scholes 1973, Harrison–Pliska 1981, Karatzas–Shreve 1998 and Shreve 2004 without locators, and none could be read legally. Wording and arrangement were therefore not compared with any source.
