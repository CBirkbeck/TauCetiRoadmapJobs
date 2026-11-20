# Review of FinancialMathematics (pull request #2557 at 4a9abde)

**Verdict:** needs changes

**Summary.** Changes are needed, all of them small. The acceptance file says the existence theorem of §3.3 cannot be stated because parabolic Hölder spaces are not at the pins; the pinned Tau Ceti has them, and a statement of §3.3 on those carriers elaborates (R01). Two sentences beside the results are false in the generality their layer declares: the digital-claim example for σ < 0 (R02) and the σ = 0 Check of §1.1 for random μ or S₀ (R03). There are three small corrections and one format note, none blocking; the human reviewers still have to note that no source text could be read.

## R01 (P2) — The existence theorem of §3.3 is statable at the pins, and the reason given for leaving it out is false

`Suggested.lean` lists §3.3 among the headline theorems and then says (lines 32–33): "The existence theorem of §3.3 needs the parabolic Hölder spaces of PDE §6.4, which are not at the pins either." They are at the pinned Tau Ceti (revision 2fd255d): `TauCeti.ParabolicC2HolderSpace α E F hab`, the bounded class `C_b^{2+α,1+α/2}` on a closed slab (`TauCeti/Analysis/PDE/Parabolic/Holder/Two.lean`, line 119); the terminal-data space `TauCeti.CkHolderSpace 2 α E F` (`TauCeti/Analysis/Holder/Iterated.lean`, line 98); the trace `ParabolicC2HolderSpace.spatialTraceL` (`…/Parabolic/Holder/Trace.lean`, line 191); Hölder coefficients on the slab as `HolderSpace α (slab t₀ t₁) ℝ`; and the backward operator `euclideanBackwardParabolicOperatorL` (`…/Parabolic/Holder/Backward.lean`, line 255). So a headline the file itself names is absent although it can be stated, and an implementer is told to wait for a carrier that exists.

I checked statability by elaboration, not by reading alone. With the single extra import `TauCeti.Analysis.PDE.Parabolic.Holder.Trace`, the following shape elaborates with `sorry` as its only warning: coefficients `vol rate : HolderSpace α (slab (E := ℝ) 0 T) ℝ` equal to `σ(e^y, t)` and `r(t)` on the slab, `δ ≤ σ²`, terminal data `g : CkHolderSpace 2 α ℝ ℝ`, and the conclusion `∃! v : ParabolicC2HolderSpace α ℝ ℝ hT` with `v(y, T) = g y` such that `C(s, t) = (1 + s) · v(log s, t)` satisfies the Black–Scholes equation of Convention 8 for s > 0, 0 < t < T. The pin does not prove the theorem: it has the time-reversal equivalence (`bijective_backwardParabolicOperatorL_prod_spatialTraceL_iff`, `Backward.lean`, line 169) but no variable-coefficient isomorphism and no weight transport, so PDE §6.6 and §6.9 remain suppliers of the proof.

The smallest change: state §3.3 in `Suggested.lean` on these carriers, with the hypotheses of README §3.3, and replace the sentence quoted above. In the README, cite the Tau Ceti carriers in the *Needs:* line of §3.3 and under "From Tau Ceti", keeping PDE §6.4 only for what the pin lacks. The pull-request description repeats the claim ("the general existence theorem needs parabolic Hölder spaces") and needs the same correction.

## R02 (P2) — The digital-claim example of Layer 2 is false for negative volatility

Layer 2 declares "σ ≠ 0" (line 196), and its second example (lines 376–377) says the digital claim is worth `e^(−rT) Q(S_T > K) = e^(−rT) Φ(d₋)`. With d₋ as in Convention 7 and Tau Ceti's `dMinus` (`TauCeti/Probability/Finance/BlackScholes/Basic.lean`, line 184), d₋ changes sign with σ, while Q(S_T > K) does not. At s = K = 100, r = 0.05, T = 1: for σ = 0.2, Φ(d₋) = Φ(0.15) = 0.5596 and Q(S_T > K) = 0.5596; for σ = −0.2, Φ(d₋) = Φ(−0.15) = 0.4404 while Q(S_T > K) = Φ(0.15) = 0.5596 (simulation with 400,000 samples: 0.5597). A reader who takes the example at Layer 2's generality gets the complementary probability.

The smallest change: add "for σ > 0" to the example, or write d₋ with |σ|.

## R03 (P2) — The σ = 0 Check of §1.1 calls the asset deterministic, which fails for the random μ and S₀ that §1.1 allows

The Check (lines 117–118) says: "For σ = 0 the asset is deterministic and equals S₀ exp(∫₀ᵗ μ_u du), whatever the Brownian path". §1.1 takes μ progressively measurable and S₀ an F₀-measurable random variable. With σ = 0, S₀ = 1 and μ_t = W_t the asset is exp(∫₀ᵗ W_u du), whose logarithm at t = 1 is Gaussian with variance 1/3: it is random and depends on the Brownian path. The formula in the Check is right; the word "deterministic" and the clause on the Brownian path are not. The previous review raised this as a small correction; the text is unchanged, and as it stands the Check asserts something false.

The smallest change: begin the Check "For σ = 0 with μ and S₀ deterministic", or say instead that for σ = 0 the asset is S₀ exp(∫₀ᵗ μ_u du) with no stochastic-integral term. Either keeps the contrast with a definition that leaves a term in σ dW.

## C01 — No statement of the README carries a source locator, so no target can be checked against the literature

Carried from the two previous rounds. The References (lines 829–836) name four works without theorem, section or page, and no target cites any of them, so a reader cannot tell which hypotheses are the literature's and which are the roadmap's own (the growth criterion of §3.2, the class of §4.2). Give each classical target its theorem and page: completeness and pricing (§2.2), absence of arbitrage (§2.3), the progressive extension (§2.4), necessity of the pricing equation (§3.1), replication and uniqueness of the call and put (§4.1, §4.2); and say which criteria are the roadmap's own formulations.

## C02 — §4.2 is made to wait for three StochasticCalculus sections, although the pinned Tau Ceti has the whole-space comparison principle that proves it

The *Needs:* line of §4.2 (lines 657–664) lists StochasticCalculus §5.1, §2.2 and §9.4, and the route is the Itô argument. The pinned Tau Ceti proves uniqueness for the Cauchy problem on the whole space among classical solutions with bounded difference, for coefficients with `tr a ≤ Λ(1 + ‖x‖²)`, `‖b‖ ≤ β(1 + ‖x‖)`, `c ≤ γ` and no regularity (`TauCeti.PDE.eqOn_of_deriv_sub_sum_mul_fderiv_fderiv_add_fderiv_add_mul_eq_of_eqOn_initial`, `TauCeti/Analysis/PDE/MaximumPrinciple/Parabolic/WholeSpace.lean`, line 474). It applies after the substitution the README already uses in §3.3: for D = V − C put `v(y, τ) = D(e^y, T − τ)/(1 + e^y)`. Then |v| ≤ A', v(·, 0) = 0, and with ρ = e^y/(1 + e^y) I computed `v_τ = (σ²/2) v_yy + (r − σ²/2 + σ²ρ) v_y − r(1 − ρ) v`, so a = σ²/2, |b| ≤ |r| + 3σ²/2 and c ≤ |r|. The theorem gives v = 0 for s > 0, and continuity gives s = 0.

Naming this route, or adding the declaration to the *Needs:* line as an alternative, would let the one theorem the acceptance file states be proved at the pins. The Itô route is correct and can stay.

## C03 — MarketImpact's link to Layer 1 uses the old heading anchor

`MarketImpact/README.md` (line 46, on main and unchanged here) links to `../README.md#m01-assets-and-trading`, the anchor of the old heading "M0.1. Assets and trading". The heading is now "Layer 1: assets and trading (M0.1)" (line 83), so after the merge the link opens the top of this README. The label M0.1 is kept, so the citation's text stays right; changing that one anchor in the sub-roadmap, which is in this folder, repairs the link.

## N01 — Two StochasticCalculus sections are used but not listed in the supplier contract

Convention 6 (line 71) takes versions and indistinguishability from StochasticCalculus §0.2, and the `Suggested.lean` docstring names §9.1 for the strong solutions that Layer 3 assumes (README line 391 uses "strong solution" without a citation). Neither section is in "From TauCetiRoadmap.StochasticCalculus" (lines 813–821) or in the consumed list under Scope and ownership.

## Questions for the author

- Which step of §3.3 uses the hypothesis that the coefficients are globally Lipschitz in y uniformly in t (line 482)? PDE §6.5 and §6.6 on main ask only for `C_b^{α,α/2}` coefficients and ellipticity. If it serves the "localization, Feynman–Kac coefficient and growth adapters" that §3.3 says this roadmap owns, those adapters are named but not stated as targets, which is what stopped me from settling it.

## Previous findings

- The previous review, of this same head, had no findings. Its small corrections C01 (no source locators), C02 (the σ = 0 Check, now R03) and C03 (the MarketImpact anchor), its format note N01 (§0.2 missing from the contract) and its question on the Lipschitz hypothesis are all unrepaired, the text being unchanged; they are carried above.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| §1.1 asset, cited from StochasticCalculus §9.4 | §9.4 on main, lines 2934–2948 | progressive μ, σ, ∫(\|μ\|+σ²) < ∞, positivity for S₀ > 0, σ = 0, Gaussian law for deterministic data / same there | holds |
| §1.1 Check 1 | μ = 0, σ = 1, S₀ = 1 | E S₁ = 1; without −σ²/2: e^(1/2) = 1.6487 / same | holds |
| §1.1 Check 2 | σ = 0, μ_t = W_t, S₀ = 1 | "deterministic" / exp(∫₀¹W), log-variance 1/3 | false in §1.1's generality (R03) |
| §1.2 self-financing, simple strategies | buy-and-hold a = 1, b = −S₀/β₀; one share then two at u | V = S − S₀β/β₀ both sides; jump S_u vs continuous right side / `IsSelfFinancing` (SimpleStrategy.lean l.365) asks every ω | holds |
| §1.2 discounted form | d(β·V/β) with dV/β = a d(S/β) | a dS + (V − aS) r dt = a dS + bβr dt | iff holds |
| Layer 1 example σ = 0, μ = r | y = xβ, y' = ry | y = x₀β, so x constant | holds |
| §2.1 representation | ξ = W^Q_T; ξ = (W^Q_T)² | E_Q = 0, h = 1; E_Q = T, h = 2W^Q / against W: constant κT | holds |
| §2.2 completeness and pricing | forward H = S_T − K; H = 1 | h = σS/β, a = 1, b = −Ke^(−rT); without β: a = e^(−rt); P-price S e^((μ−r)τ) − Ke^(−rτ) | holds |
| §2.3 no arbitrage, static claim | q = 10, p = 9, β₀ = 1 | cost 9 − 10 + 1 = 0, payoff e^(rT); reversed sign −e^(rT); p = q gives 0 | holds |
| §2.4 progressive coefficients | κ_t = t on [0,1]; holdings a = βh/(Sσ) | v = 1/3, E Z = e^(1/6−1/6) = 1; wrong normalisation e^(−1/6) = 0.8465; ∫a²σ²S² = ∫β²h² | holds |
| Layer 2 digital example | s = K = 100, r = 0.05, T = 1, σ = ±0.2 | σ = 0.2: 0.5596 / 0.5596; σ = −0.2: Φ(d₋) = 0.4404 / Q(S_T > K) = 0.5596 | false for σ < 0 (R02) |
| §3.1 necessity | C = s; C = e^(−rτ); C = s²e^((r+σ²)τ); σ = 0, C = s² | operator 0, 0, −(r+σ²)C + σ²C + rC = 0; P-value gives 2(r−μ)C; a = 0 ≠ 2s₀ at σ = 0 | holds |
| §3.2 criterion and growth bound | call, put, forward, s² | \|C\|+\|sC_s\| ≤ 2s; ≤ Ke^(−rτ)+s; 3s²e^(..) with p = 2; ∫σ²(SC_s)² ≤ C_σ²A²∫(1+Sᵖ)² | holds |
| §3.3 existence, weight 1 + e^y | h = s; call payoff | v = sigmoid, in class; one-sided derivatives 0 and K/(1+K); c_w = r(ρ − 1), b_w = r − σ²/2 + σ²ρ bounded Hölder | holds; statable at pins (R01) |
| §4.1 replication | s = K = 1, r = 0, σ = 1, T = 1; s = K = 100, r = .05, σ = .2 | Φ(½) = 0.69146, value 0.38292; d± = 0.35, 0.15; C = 10.4506, P = 5.5735, C − P = 4.8771 | holds |
| §4.2 uniqueness, both theorems of `Suggested.lean` | forward V = s − Ke^(−rτ); sign flip; Tychonoff | in class, V = C − P; flipped operator 2rKe^(rτ); heat substitution gives −u_τ + (σ²/2)u_yy | holds |
| §4.2 via pinned comparison principle | v = D(e^y, T−τ)/(1+e^y) | a = σ²/2, \|b\| ≤ \|r\|+3σ²/2, c = −r(1−ρ) ≤ \|r\|, \|v\| ≤ A' | hypotheses of WholeSpace.lean l.474 met (C02) |
| Overview headlines 1–3 | against §2.2–2.4, §3.1–3.2, §4.1–4.2 | hypotheses in overview / same in the sections (σ, κ bounds; growth, 2p-moment; class on closed domain) | agree |
| Convention 1, 7 and Layer 4 closed forms | `callValue`, `dPlus`, `dMinus`, `putPrice` at the pin | τ last argument; extension (s − Ke^(−rτ))⁺ gives (s−K)⁺ at τ = 0 and 0 at s = 0 | agree |
| Layer 2 preamble | `exponentialMartingale`, Girsanov, filtration identity at the pin | θ = −κ: exp(−κW − κ²t/2), W − θ·min(t,T) = W + κt on [0,T], tilt −κW_T | agree |

- Source locators checked: 0; the README carries none.
- Library declarations: all 107 backticked library names of the README resolved at the pins; opened in detail SimpleStrategy.lean 105, 117, 365, 484, 521; Arbitrage.lean 68, 78; BlackScholes/Basic.lean 175, 184, 232, 244; Extension.lean 80, 87, 230, 279; Filtered.lean 54; ExponentialMartingale.lean 74, 170, 188; Girsanov.lean 123, 177; NaturalFiltration.lean 47; Geometric.lean 73, 116, 186; Parabolic/Holder/Two.lean 119, Trace.lean 191, Backward.lean 169, 255; MaximumPrinciple/Parabolic/WholeSpace.lean 474.
- Cross-roadmap citations resolved on main: StochasticCalculus §0.2, §2.2, §3.2–§3.4, §4.1, §4.3, §5.1, §5.4, §6.1, §7.3, §7.4, §9.1, §9.4, §10.3 and PDE §6.4, §6.5, §6.6, §6.9: each section exists with the cited content.
- No stochastic integral at the pins: no declaration named for an Itô or stochastic integral in the pinned Mathlib or Tau Ceti.
- Automatic checks: all passed, and passed again when rerun on this head. Dependency check: `depcheck: 182 roadmaps, 2069 edges, 0 problem(s)`. No change outside the folder.
- Elaboration: `Suggested.lean` gives two `sorry` warnings (lines 51 and 73) and nothing else; the elaborated signatures match README §4.2 and no binder is lost. One-tactic probes (`simp`, `rfl`, `simp_all`, `simp` with the definitions unfolded) close neither theorem.
- Description against the head: 25 Checks counted in eleven sections, the imports, the two declarations and the supplier sections agree with the head; the one sentence at fault is named in R01.

Overlap check: read MarketImpact and StochasticCalculus (scope and their citations of M0.1–M0.4), DysonBrownianMotion, and the open MartingaleCentralLimitTheorem, YoungIntegrationAndRoughPaths and LawOfTheIteratedLogarithm; nothing shared. StochasticCalculus owns the linear equation (§9.4) and assigns trading, assets and pricing to this roadmap; MarketImpact consumes M0.1–M0.4. A search of all open and main roadmaps for self-financing, Black–Scholes and risk-neutral finds no other owner.

Source independence: 0 passages compared with 0 sources: the README has no source locator (largest share: none, 0 of 0), and none of its four references could be read legally, so neither wording nor arrangement was compared.

Research link: Layer 2 is the completeness and martingale-pricing theory of Harrison–Pliska (1981); Layer 4 is the Black–Scholes (1973) price and hedge; MarketImpact builds on Layers 1–3 for the feedback model it cites as SP97. Rests on the README's and MarketImpact's reference lists; no source text was read.

## Not verifiable

- The seeded sample, §1.1 to §4.2, against the literature: no target carries a locator, so there was no theorem number, page or hypothesis list to check; the statements were checked by computation instead.
- Black–Scholes 1973, Karatzas–Shreve 1998 and Shreve 2004: no legal copy in earlier rounds; not requested again. Harrison–Pliska 1981 (DOI 10.1016/0304-4149(81)90026-0): requested again, resolves only to a paywalled page.

## Source issues

- none

## For the human reviewers

- Not tested: the README (lines 829–836) cites Black–Scholes 1973, Harrison–Pliska 1981, Karatzas–Shreve 1998 and Shreve 2004 without locators, and none could be read legally; wording and arrangement were compared with no source.
- Scope: PDE on main still lists the bundled parabolic Hölder spaces as targets of its §6.4 (`TauCetiRoadmap/PDE/Suggested.lean`, lines 48–49), while the pinned Tau Ceti has `ParabolicC2HolderSpace`; R01 here has the same cause.
