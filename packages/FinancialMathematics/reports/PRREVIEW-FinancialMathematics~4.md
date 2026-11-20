# Review of FinancialMathematics (pull request #2557 at 507c038)

**Verdict:** accepted

**Summary.** Accepted: no finding. The three findings of the previous review are repaired: §3.3 is now stated in `Suggested.lean` on Tau Ceti's parabolic Hölder spaces and I checked the statement by the weight computation and on three explicit solutions; the digital-claim example and the σ = 0 Check carry their hypotheses. There are two small corrections (no statement carries a literature locator; three hypotheses of the §4.2 theorems are not needed by the route at the pins) and one format note, none blocking. The human reviewers still have to note that no source text could be read.

## C01 — No statement of the README carries a source locator

Carried from the earlier rounds, partly repaired. The References now say which work is the classical source of which result and that "the hypotheses of every statement above are this roadmap's own formulation" (lines 883–887), so a reader knows the criteria of §2.4, §3.2, §3.3 and §4.2 are not quoted from the literature. The classical targets still cite nothing: completeness and pricing (§2.2), absence of arbitrage (§2.3), necessity of the pricing equation (§3.1), the call and put hedges (§4.1). A theorem and page number for each, in the four works already listed, would let a reader compare hypotheses; none could be checked in this review, since no legal copy of the four was readable.

## C02 — The joint continuity of the three derivatives in `eq_callValue_of_pde` and `eq_putValue_of_pde` is not needed by the route at the pins

The first route of §4.2 (lines 644–652) applies `TauCeti.PDE.eqOn_of_deriv_sub_sum_mul_fderiv_fderiv_add_fderiv_add_mul_eq_of_eqOn_initial` (`TauCeti/Analysis/PDE/MaximumPrinciple/Parabolic/WholeSpace.lean`, line 478). That theorem asks of each solution only continuity on the closed slab, a bounded difference, `ContDiffAt ℝ 2` in space and `DifferentiableAt` in time for 0 < t < T, and the equation. For `v(y, τ) = D(e^y, T − τ)/(1 + e^y)` these follow from `hcont`, `hspot`, `htime`, `hgrowth` and `hpde`; the hypotheses `hcont_t`, `hcont_s` and `hcont_ss` of `Suggested.lean` (lines 88–93 and 110–115) are used nowhere on that route. Only the second, stochastic route needs them, for Itô's formula.

The statements are true as they stand. If the stronger theorem is wanted as the acceptance test, the three hypotheses would be dropped from the two Lean statements and §4.2 would say that the class needs twice continuous differentiability in the spot and differentiability in time only; if the class C^(2,1) of Convention 8 is kept for uniformity with Layer 3, a clause in §4.2 saying that the first route does not use the joint continuity would do.

## N01 — The domain D of Layer 3 is written without its lower time bound

Layer 3 (line 395) sets "D = {(s, t) : s > 0, t < T}", while the coefficients live on (0, ∞) × [0, T] and the starts have t₀ ∈ [0, T). Writing 0 ≤ t < T, with the time derivative at t = 0 taken from the right, says what §3.1 uses when it evaluates the operator at a start (s₀, 0).

## Previous findings

- R01 — repaired: §3.3 now reads "Prove `existsUnique_weighted_price`: there is exactly one v in the parabolic Hölder space", the theorem is in `Suggested.lean` (line 58) on `TauCeti.ParabolicC2HolderSpace` and `TauCeti.CkHolderSpace`, and the docstring no longer says the spaces are missing.
- R02 — repaired: "with S₀ = s and σ > 0 its value at time 0 is `e^(−rT) Q(S_T > K) = e^(−rT) Φ(d₋)`" (lines 377–378).
- R03 — repaired: "For σ = 0, with μ and S₀ deterministic, the asset is deterministic" (line 117).
- C01 — partly repaired: the attribution sentence was added, no locator was; carried as C01 above.
- C02 — repaired: §4.2 now takes the whole-space uniqueness theorem of the pinned Tau Ceti as its first route and keeps the Itô argument as a second; the *Needs:* line separates the two.
- C03 — not repaired: deferred (D01).
- N01 — repaired: the StochasticCalculus contract and the scope list now include §0.2 and §9.1.
- The question on the Lipschitz hypothesis of §3.3 is settled: the hypothesis and the unstated adapters are gone.

## Deferred findings

- D01 — stands

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| §1.1 asset, cited from StochasticCalculus §9.4 | §9.4 on main, lines 2934–2948 | progressive μ, σ, ∫(\|μ\|+σ²) < ∞, positivity for S₀ > 0, σ = 0, Gaussian law for deterministic data / same there | holds |
| §1.1 Checks | μ = 0, σ = 1, S₀ = 1; σ = 0 deterministic data | E S₁ = 1, without −σ²/2: e^(1/2) = 1.6487; σ = 0 gives S₀ exp ∫μ | holds |
| §1.2 self-financing, discounted form | a = 1, b = −S₀/β₀; one share then two at u; d(V/β) | V = S − S₀β/β₀ both sides; jump S_u vs continuous gains; d(V/β) = a(dS − rS dt)/β = a d(S/β) | holds, iff both ways |
| Layer 1 example σ = 0, μ = r | y = xβ | y = y₀ + ∫ r y du gives y = x₀β, x constant (also r = 0) | holds |
| §2.1 representation | ξ = W^Q_T; ξ = (W^Q_T)² | E_Q = 0, h = 1; E_Q = T, h = 2W^Q; against W the constant is κT | holds |
| §2.2 completeness and pricing | forward; H = 1; route holdings | h = σS/β, a = 1, b = −Ke^(−rT); ∫a²σ²S² = ∫β²h²; P-price S e^((μ−r)τ) − Ke^(−rτ) | holds |
| §2.3 no arbitrage, static claim | q = 10, p = 9; p = q; general c | cost cp − cq + c(q − p) = 0; payoff \|q − p\|β_T/β₀; reversed −e^(rT); 0 at p = q | holds |
| §2.4 progressive coefficients | κ_t = t on [0, 1]; μ = r + κσ | v = 1/3, E Z = 1; wrong normalisation e^(−1/6) = 0.8465; μ bounded so §1.1 applies | holds |
| Layer 2 examples | r = .05, μ = .1, σ = .2; digital, σ > 0 | κ = 0.25, κ²/2 = 0.03125; Q(S_T > K) = Φ(d₋) | holds |
| §3.1 necessity | C = s; e^(−rτ); s²e^((r+σ²)τ); σ = 0, C = s² | 0; 0 (sign flip 2rC); −(r+σ²)C + σ²C + rC = 0; P-value fails for μ ≠ r; a = 0 ≠ 2s₀ | holds |
| §3.2 criterion and growth bound | call, put, forward, s² (p = 2) | \|C\|+\|sC_s\| ≤ 2s; ≤ Ke^(−rτ) + s; 3s²e^(..); ∫σ²(SC_s)² ≤ C_σ²A²∫(1+Sᵖ)²; dominated by A(1+sup Sᵖ) | holds |
| §3.3 `existsUnique_weighted_price`, weight transport | u = wv, w = 1 + e^y, ρ = e^y/(1+e^y) | u_y = w(v_y + ρv), u_yy = w(v_yy + 2ρv_y + ρv); b = r − σ²/2 + σ²ρ, c = −r(1 − ρ) / same | holds |
| §3.3 explicit solutions | h = 0; h = s; h = 1 with variable r | v = 0; v = ρ in class; v = exp(−∫_t^T r)/(1 + e^y), v_t = r v is α/2-Hölder exactly when r is | holds; r hypothesis sharp |
| §3.3 Lean against README | elaborated type; carriers at the pin | α : ℝ≥0, δ ≤ σ² ≤ Λ on s > 0, t ∈ [0, T]; terminal C(s, T) = h(s) ⇔ v(·, T) = g; value map injective on the space | agree; ∃! well posed |
| §3.3 call payoff outside the class | (e^y − K)⁺/(1 + e^y) at y = log K | one-sided derivatives 0 and K(1+K)/(1+K)² = K/(1+K) | holds |
| §4.1 replication | s = K = 1, r = 0, σ = 1; s = K = 100, r = .05, σ = .2 | Φ(½) = 0.69146, value 0.38292, difference of hedges (1, −1); d± = 0.35, 0.15; 10.4506, 5.5735, 4.8771; 63.68 − 53.23 | holds |
| §4.2 `eq_callValue_of_pde`, `eq_putValue_of_pde` | route through the pinned theorem; s = 0; t = T | \|v\| ≤ A + 1; \|b\| ≤ \|r\| + σ²/2; c ≤ \|r\|; callValue = 0 at s = 0, (s − K)⁺ at τ = 0 | holds; three hypotheses unused (C02) |
| §4.2 Checks | forward; sign flip; heat substitution | V = C − P; flipped operator 2rKe^(rτ); operator = e^(−rτ)(−u_τ + (σ²/2)u_yy) | holds |
| Overview headlines 1–3 | against §2.2–§2.4, §3.1–§3.2, §4.1–§4.2 | hypotheses in the overview / the same in the sections | agree |
| Layer 4 terminal Greeks | s = K, τ → 0 | d₊ = (r + σ²/2)√τ/σ → 0, delta → 1/2, gamma ~ 1/(Kσ√(2πτ)) | holds |

- Source locators checked: 0; the README carries none.
- Library declarations opened at the pins: `TauCeti/Analysis/PDE/Parabolic/Holder/Two.lean` 81–83 (`timeExtension`), 119–170 (`ParabolicC2HolderSpace`); `…/Holder/Backward.lean` 377; `…/MaximumPrinciple/Parabolic/WholeSpace.lean` 478–497; `TauCeti/Analysis/Holder/Iterated.lean` 98; `…/Parabolic/SpaceTime/Basic.lean` 94; `TauCeti/Analysis/SpecialFunctions/Sigmoid.lean` 115, 146; `TauCeti/Probability/Finance/LogSpot.lean` 72, 89; `…/Finance/Arbitrage.lean` 68; `…/BlackScholes/Extension.lean` 80, 87, 195, 230. Every backticked library name of the README resolves at the pins.
- Cross-roadmap citations resolved on main: StochasticCalculus §0.2, §2.2 (class DL at lines 1015, 1054), §3.2–§3.4, §4.1, §4.3, §5.1, §5.4, §6.1, §7.3, §7.4, §9.1, §9.4, §10.3; PDE §6.6 (lines 2502–2521) and §6.9 (lines 2616–2625), which state the backward terminal-data isomorphism and the weight transport with the coefficients computed above.
- Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. No change outside the folder.
- Automatic checks: all passed.
- Elaboration: `Suggested.lean` gives three `sorry` warnings (lines 58, 83, 105) and nothing else; the three elaborated types were compared with README §3.3 and §4.2 and no binder is lost. One-tactic probes (`simp`, `rfl`, `simp_all`, `exact?`) close none of the three theorems.
- Description against the head: 25 Checks in eleven sections, the three declarations, the four imports, the supplier sections and the listed statement changes agree with the head.

Overlap check: read MarketImpact and StochasticCalculus (scope and their citations of M0.1–M0.4), DysonBrownianMotion, and the open YoungIntegrationAndRoughPaths, MartingaleCentralLimitTheorem and LawOfTheIteratedLogarithm; nothing shared. StochasticCalculus owns the linear equation (§9.4) and assigns trading, assets and pricing to this roadmap; PDE owns the Schauder isomorphisms (§6.6, §6.9) that §3.3 applies; MarketImpact consumes M0.1–M0.4. A search of every open and main roadmap for self-financing, Black–Scholes and risk-neutral finds no other owner, and no other `Suggested.lean` declares the three names.

Source independence: 0 passages compared with 0 sources: the README has no source locator (largest share: none, 0 of 0), and none of its four references could be read legally, so neither wording nor arrangement was compared; the layers are those of the roadmap on main (M0.1–M0.4).

Research link: Layer 2 is the completeness and martingale-pricing theory of Harrison–Pliska (1981); Layer 4 is the Black–Scholes (1973) price and hedge; MarketImpact builds its feedback-pricing model on Layers 1–3. Rests on the README's and MarketImpact's reference lists; no source text was read.

## Not verifiable

- The seeded sample, §1.1 to §4.2, against the literature: no target carries a locator, so there was no theorem number, page or hypothesis list to check; each statement was checked by computation instead.
- Black–Scholes 1973, Harrison–Pliska 1981, Karatzas–Shreve 1998 and Shreve 2004: no legal copy was found in the earlier rounds (Harrison–Pliska resolves only to a paywalled page); not requested again.

## Source issues

- none

## For the human reviewers

- Not tested: the README (lines 876–881) cites Black–Scholes 1973, Harrison–Pliska 1981, Karatzas–Shreve 1998 and Shreve 2004 without locators, and none could be read legally; wording and arrangement were compared with no source.
- Scope: PDE on main still lists the bundled parabolic Hölder spaces as not at the pins (`TauCetiRoadmap/PDE/Suggested.lean`, line 48), while this roadmap states §3.3 on the pinned `TauCeti.ParabolicC2HolderSpace`.
