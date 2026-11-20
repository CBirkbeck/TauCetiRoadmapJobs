# Review of FinancialMathematics (pull request #2557 at 87112b8)

**Verdict:** needs changes

**Summary.** One finding. The replication theorem of §4.1 lets the call and put hedges take any values at maturity. Wealth and terminal payoff are read off the holdings at T, so for most such choices the hedge neither pays the claim nor satisfies the self-financing equation at T. §3.2's delta strategy has the same gap when C(·, T) is not given. Everything else checks out: all 25 Checks and the worked examples recompute correctly; every Mathlib and Tau Ceti name the README cites exists at the pins with the hypotheses stated; the cross-roadmap citations resolve on main; and `Suggested.lean` correctly states the one headline that can be stated at the pins. There are seven small corrections and one format note. The first correction is that the README gives no source locator for any statement, so none could be checked against a source. The human reviewers are told that no source text could be read.

## R01 (P2) — The §4.1 hedges may take "any values at t = T", but the wealth at T is a_T S_T + b_T β_T, so the claimed terminal payoff and self-financing fail for most such choices

An implementer who follows the text, say with a_T = b_T = 0, is asked to prove a false statement. In §1.2 the wealth is V_t = a_t S_t + b_t β_t. The self-financing equation must hold at every t ∈ [0, T], including T, and its right-hand side is continuous in t. So at T it equals the limit of C(S_t, t) as t ↑ T, which is (S_T − K)⁺. With a_T = b_T = 0 the left side is V_T = 0. On {S_T > K}, an event of positive probability, the strategy is then not self-financing at T and does not pay (S_T − K)⁺. That contradicts "Prove that (a, b) is an admissible strategy (§2.2), self-financing, with wealth C(S_t, t) for t ∈ [0, T] and terminal payoff (S_T − K)⁺" (§4.1, line 576). The put sentence inherits the same clause.

Replace "with any values at t = T" with a choice that pays the claim. For the call, take a_T = 1{S_T > K} and b_T = −K 1{S_T > K}/β_T; for the put, a_T = −1{S_T < K} and b_T = K 1{S_T < K}/β_T. Any F_T-measurable pair with a_T S_T + b_T β_T equal to the payoff works. The general criterion of §3.2 (lines 440–444) has the same gap. Its delta strategy at T needs C(S_T, T), which that criterion does not define, since it assumes only that C(S_t, t) → h(S_T). Saying that the strategy at T uses C(s, T) = h(s) closes the gap; the growth criterion already assumes this extension.

## C01 — No statement of the README carries a source locator, so no target can be checked against the literature

The References (lines 817–824) name four works without a theorem, section or page, and no target cites any of them. A reader cannot tell which classical result a target is, or which hypotheses come from the literature and which are the roadmap's own, such as the §3.2 growth criterion and the §4.2 class. Two changes would fix this. Give each classical target the theorem and page it comes from: completeness and pricing (§2.2), absence of arbitrage (§2.3), the bounded-coefficient extension (§2.4), necessity of the pricing equation (§3.1), and the call and put price, hedge and uniqueness (§4.1, §4.2). Then say which criteria are the roadmap's own formulations, with their routes. None of the four references could be read legally for this review, so it proposes no locators.

## C02 — The overview's converse of the pricing equation leaves out the coefficient bounds that §3.2 assumes

Lines 19–21 say that a solution with |C| + |s ∂C/∂s| ≤ A(1 + sᵖ) and terminal value h "is the replication price of h(S_T) when the asset has finite maximal Q-moments of order 2p", for coefficients depending on spot and time. §3.2 (line 434) also assumes the §2.4 hypotheses along the solutions: |σ| bounded above and away from zero, and κ bounded. Without them the measure Q need not exist and the integrability of the holdings fails. §3.2 also asks that C extend continuously to t = T. Adding "with σ bounded above and away from zero, κ bounded, and C continuous up to maturity" to the sentence makes it the statement of §3.2.

## C03 — The simple-strategy bullet of §1.2 states an equivalence that holds only up to a null set

Lines 142–143 say that a simple strategy is self-financing "in the sense above exactly when it is in the sense of `TauCeti.Finance.IsSelfFinancing`". The continuous-time notion is an almost-sure identity, but the pinned predicate (`TauCeti/Probability/Finance/SimpleStrategy.lean`, line 365) quantifies over every ω. Holdings that break the rebalancing identity on a nonempty P-null set satisfy the first notion and not the second. Writing "exactly when the rebalancing identity of `IsSelfFinancing` holds for P-almost every ω" makes the equivalence true.

## C04 — §1.1 asks for proofs of statements that StochasticCalculus §9.4 already makes

Lines 89–104 ask to "prove that" S_t = S₀ exp(∫(μ − σ²/2) du + ∫σ dW) and that S is positive. They also list the σ = 0 case and the Gaussian law of log S_t for deterministic coefficients. StochasticCalculus §9.4 on main states each of these: the solution formula for progressive coefficients, positivity when S₀ > 0, the σ = 0 case, and the Gaussian law of log S_t. Citing them as §9.4's results would avoid restating them. The identification with Tau Ceti's `geometricBrownianMotion` and the description of S/β stay targets of this roadmap.

## C05 — The docstring of `Suggested.lean` says the general existence theorem needs the stochastic integral

Line 26 says "The first four and the fifth need the stochastic integral". The fourth headline in the list is the existence and uniqueness theorem of §3.3. That is a statement about a parabolic equation, and the docstring's own next sentences say it needs the Hölder spaces of PDE §6.4. The README and the description agree that it needs no stochastic integral. "The first three and the fifth" is what is meant.

## C06 — The scope section lists MarketImpact and StandardDistributions as consumed here, but nothing here uses either

Both are listed under "Owned elsewhere and consumed here" (lines 712–728), but no *Needs:* line and no Dependencies paragraph cites either one. MarketImpact consumes this roadmap and already appears under Downstream consumers, so listing it as a supplier reads as a cycle. StandardDistributions is mentioned only to say that the Gaussian identities used come from Mathlib and Tau Ceti. One fix is to list both under a heading such as "Owned elsewhere".

## C07 — The description's claim that the update "changes the form of the README, not the mathematics it plans" is contradicted by the head

The head drops from the plan every target that the pinned Tau Ceti already proves. On main, M0.2 asked for proofs of the density martingale, constant-drift Girsanov and the filtration identity, and M0.4 asked for the Gaussian identities, the closed forms, the Greeks and the limits; all of these are now cited. The head also adds API targets: closure under linear combinations, the discounted self-financing form and the law of one price. It turns the §3.2 growth criterion into a definite theorem and changes the §4.2 class. The description's later sections say most of this. Its opening sentence would be accurate as: "This update rewrites the README in the current form, replaces by citations the targets that the pinned Tau Ceti already proves, and states several targets more precisely (listed below)."

## N01 — A pointer in the Tau Ceti contract names the wrong sections

The "From Tau Ceti" contract (lines 795–798) says the expectation and conditional-price statements are "listed in §2.1–§2.3 and §4.1". The conditional prices and `callPrice_eq_integral_geometricBrownianMotion` are listed at the head of Layer 4, and the discounted-asset martingale is listed in the preamble of Layer 2.

## Questions for the author

- Which step of §3.3 uses the hypothesis that the coefficients are globally Lipschitz in y, uniformly in t (line 477)? PDE §6.6 and §6.9, which the route cites, need only bounded Hölder coefficients and ellipticity. If the hypothesis serves the Feynman–Kac adapters this roadmap owns, saying so there would show an implementer where it enters. I could not settle this because the adapters are named but not stated.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| §1.1 asset price | μ=0, σ=1, S₀=1, t=1; σ=0; μ=r, S₀=β₀ | E S₁ = 1 both; without −σ²/2: e^(1/2)=1.6487 both; σ=0 gives S₀e^(∫μ), deterministic; μ=r gives bond | holds; restates SC §9.4 (C04) |
| §1.1 discounted asset | d(S/β) | drift μ−r, vol σ, start S₀/β₀ / same by product rule | holds |
| §1.2 self-financing | a=1, b=−S₀/β₀ | V_t = S_t − S₀β_t/β₀ = gains both; omitting ∫b dβ gives S_t − S₀ | holds |
| §1.2 switch 1→2 shares at u | jump at u | wealth jump S_u > 0 vs continuous right side | not self-financing, as stated |
| §1.2 σ=0, μ=r example | V = xβ | SF ⇔ y=xβ solves y'=ry ⇔ x constant | holds |
| §1.2 simple ⇔ IsSelfFinancing | holdings off on a null set | a.s. identity holds; pinned ∀ω predicate fails | iff only up to null sets (C03) |
| §2.1 representation | ξ=W^Q_T; ξ=(W^Q_T)² | E_Q=0, h=1; against W: κT + ∫1 dW; E_Q=T, h=2W^Q | holds |
| §2.2 pricing, forward | H=S_T−K | V_t = S_t − Ke^(−r(T−t)) both; P-pricing S_t e^((μ−r)(T−t)) − Ke^(−r(T−t)) | holds |
| §2.2 route holdings | forward, H=1 | h=σS/β → a=1, b=−Ke^(−rT); without β: a=e^(−rt); H=1: b=e^(−rT) | holds |
| §2.3 static claim | q=10, p=9, β₀=1 | cost 9−10+1=0, payoff e^(rT); reversed −e^(rT); p=q pays 0 | holds |
| §2.4 Novikov normalisation | κ_t=t on [0,1] | Var=1/3, E Z₁=e^(1/6−1/6)=1; with −∫κ²: e^(−1/6)=0.8465 both | holds |
| §2.4 constant κ | exponentialMartingale def (pin line 74) | exp(θW−θ²t/2) at θ=−κ = exp(−κW−κ²t/2) | holds |
| Layer 2 example | r=.05, μ=.1, σ=.2 | κ=0.25, κ²/2=0.03125 both; digital e^(−rT)Φ(d₋) | holds |
| §3.1 bond and sign | C=e^(−r(T−t)) | operator rC+0−rC=0; flipped sign 2rC both | holds |
| §3.1 power claim | C=s²e^((r+σ²)τ) | −(r+σ²)C+σ²C+rC=0; P-value operator 2(r−μ)C ≠ 0 | holds |
| §3.1 degenerate | σ=0, μ=r=0, C=s² | a=0, b=s₀²/β replicates; C_s=2s₀ ≠ 0 | consistent with no-necessity clause |
| §3.2 growth bound | call, put, p=1 | call ≤ 2s ≤ 2(1+s); put ≤ Ke^(|r|T)+s | holds |
| §3.2 criterion at T | general criterion | b_T needs C(S_T,T), undefined when only C(S_t,t)→h(S_T) | gap (R01) |
| §3.3 log-spot form | s=e^y | sC_s=u_y, s²C_ss=u_yy−u_y → ½σ²u_yy+(r−½σ²)u_y−ru, matches pde_comp_log | holds |
| §3.3 Checks | h=s; call payoff at y=log K | weighted C = sigmoid; one-sided derivatives 0 and K/(1+K) (K=2: 0, 2/3) | holds |
| §4.1 hedge, Check 1 | s=K=1, r=0, σ=1, T=1 | d±=±0.5, Φ(.5)=0.69146, C=P=0.38292; call−put hedge (1,−1) both | holds |
| §4.1 hedge, Check 2 | s=K=100, r=.05, σ=.2, T=1 | C=10.4506, P=5.5735, C−P=4.8771=100−100e^(−.05) both | holds |
| §4.1 terminal holdings | a_T=b_T=0 | V_T=0 vs right side (S_T−K)⁺ on {S_T>K} | false as written (R01) |
| §4.2 / `eq_callValue_of_pde` | s=0, t=T, forward | callValue 0 … = 0 (pin, Extension l.151); callValue s r σ K 0 = (s−K)⁺; forward operator 0, e^(+rτ) gives 2rKe^(rτ) | holds; probe tactics fail |
| `eq_putValue_of_pde` | s=0; parity | putValue 0 … = Ke^(−rτ) (K>0); V+s−Ke^(−rτ) solves call problem | holds; probe tactics fail |
| §4.2 Tychonoff Check | substitution | u=e^(rτ)V, y=log s+(r−σ²/2)τ gives w_τ=½σ²w_yy; growth exp(c(log s)²) not ≤ A(1+s) | holds |
| Headline 1 (overview) | constant coefficients | matches §2.2–§2.3 rows | holds |
| Headline 2 (overview) | coefficients without §2.4 bounds | overview drops the bounds; §3.2 states them | under-stated (C02) |
| `Suggested.lean` docstring | fourth headline | §3.3 is PDE-only / docstring says it needs the stochastic integral | wrong count (C05) |

- Source locators checked: 0; the README has none. All four references were tried through the sources service and none was legally readable.
- Library declarations: all 107 qualified Mathlib and Tau Ceti names in the README exist at the pins. Hypotheses were read for more than 40, including Extension.lean 80–204, 230, 279; Hedge.lean 74, 92, 109, 130; ValueProcess.lean 232, 257, 290; Geometric.lean 73, 116, 186; NoArbitrage.lean 73, 117; Arbitrage.lean 68, 78; SimpleStrategy.lean 105, 117, 365, 484; NaturalFiltration.lean 47; LogSpot.lean 72; Sigmoid.lean 115, 146; Limits.lean 365–481.
- Cross-roadmap citations resolved on main: StochasticCalculus §0.2, §2.2, §3.2–§3.4, §4.1, §4.3, §5.1, §5.4, §6.1, §7.3, §7.4, §9.4 and §10.3; PDE §6.4, §6.6 and §6.9. The M0.1–M0.4 labels that MarketImpact cites are kept in the layer headings.
- Stochastic integral: none in pinned Mathlib `Probability/` or pinned Tau Ceti (Tau Ceti has only simple-strategy gains), so the docstring's account of which headlines can be stated holds.
- Automatic checks all passed. Dependency check output: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives exactly two `sorry` warnings. In a probe copy, `#check @eq_callValue_of_pde` and `#check @eq_putValue_of_pde` match README §4.2; the file has no `variable` block and no binder is lost.
- One-tactic probe: `simp`, `rfl`, `infer_instance` and `aesop` each fail on both theorems, and neither is at the pinned Tau Ceti, so there is no padding and no duplication.

Overlap check: read MarketImpact, StochasticCalculus and DysonBrownianMotion (main) and MartingaleCentralLimitTheorem, YoungIntegrationAndRoughPaths and LawOfTheIteratedLogarithm (open). Shared: the linear SDE, GBM moments, martingale representation and Girsanov are owned by StochasticCalculus (§9.4, §6.1, §7.3–§7.4) and cited here. Feedback pricing is owned by MarketImpact, a consumer. Nothing else is shared, and a search of open and main roadmaps for Black–Scholes, self-financing, arbitrage and risk-neutral pricing finds no second owner.

Source independence: 0 passages compared with 0 sources; the README has no locators (largest share: none, 0 of 0); contents not compared because no reference was legally readable. The layer order is the one the *Needs:* lines force (§2.2 needs §1.2, §3.2 needs §2.2 and §2.4, §4.1 needs §3.2) and is inherited from main's M0.1–M0.4.

Research link: Layer 2 is Harrison–Pliska's (1981) completeness and martingale-pricing theorem, and Layer 4 is the Black–Scholes (1973) price and its hedge. The sub-roadmap MarketImpact builds on Layers 1–3 for the Sircar–Papanicolaou (1997) feedback-hedging model. This rests on the README's and MarketImpact's References; no source text was read.

## Not verifiable

- The seeded sample, §1.1 to §4.2: none of these targets carries a source locator, so there was no theorem number, page or hypothesis list to check against a text.
- Black–Scholes 1973, DOI 10.1086/260062: the sources service found no legal copy (the publisher's page refused access).
- Harrison–Pliska 1981, DOI 10.1016/0304-4149(81)90026-0: the sources service reports a paywalled publisher.
- Karatzas–Shreve 1998, *Methods of Mathematical Finance*: the sources service reports a paywalled publisher.
- Shreve 2004, *Stochastic Calculus for Finance II*: the sources service found no legal source.

## Source issues

- none

## For the human reviewers

- Not tested: the README (lines 817–824) cites Black–Scholes 1973, Harrison–Pliska 1981, Karatzas–Shreve 1998 and Shreve 2004 without locators, and none could be read legally. Wording and arrangement were therefore not compared with any source.
