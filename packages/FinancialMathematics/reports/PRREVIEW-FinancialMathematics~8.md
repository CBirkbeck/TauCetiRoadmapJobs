# Review of FinancialMathematics (pull request #2557 at e5111e5)

**Verdict:** accepted

**Summary.** Accepted: no finding. The earlier review had none to repair; on a full re-read every milestone and item of the README on main is present under its id with its statement, every statement, Check and worked value recomputes, the three Lean statements agree with §3.3 and §4.2, and all 144 library names resolve at the pins. There are two small corrections (Layer 3 does not say what happens at t = 0; the description does not say that StandardDistributions stops being a supplier) and one format note, none blocking. For the human reviewers: none of the twelve source locators could be compared with a text, since Shreve 2004 is paywalled.

## C01 — Layer 3 leaves the time t = 0 unsettled: its domain has no lower bound, and the growth adapter of §3.3 excludes starts at time 0

A reader cannot tell whether the pricing equation and the identification with the price are claimed at time 0, which is where the initial cost of a hedge is read off. The opening of M0.3 (line 430) sets "D = {(s, t) : s > 0, t < T}", while the coefficients are given on (0, ∞) × [0, T] only, the starts have t₀ ∈ [0, T) (line 427), and Convention 8 (line 81) defines class C^(2,1) on open sets. Read with Convention 1 the set is s > 0, 0 ≤ t < T, which is not open, so the time derivative at t = 0 is undefined as written, although §3.1 concludes that the operator vanishes "at every point of U", starts (s₀, 0) included. In the other direction, the growth adapter of §3.3 (lines 565–566) takes starts with "0 < t₀ < T", so the identity `C(S_t, t) = β_t E_Q[h(S_T)/β_T | F_t]` is not stated from time 0, although v lies in the Hölder class on the closed slab, so that C has its derivatives continuous up to t = 0 and solves the equation there by continuity.

The smallest change: write D = {(s, t) : s > 0, 0 ≤ t < T}, with the time derivative at t = 0 taken from the right, and let the adapter of §3.3 take t₀ ∈ [0, T) (or say why 0 is left out).

## C02 — The description does not say that StandardDistributions is no longer a supplier

On main, M0.4 proves the normalization, derivative, symmetry and tail identities of Φ "through StandardDistributions' Gaussian targets" and the closing section says that roadmap "owns the Gaussian CDF analytic identities". At this head §4.0 takes them from Mathlib and Tau Ceti (lines 629–633), and Scope and ownership lists StandardDistributions under "Owned elsewhere and not consumed here" (line 897). The description names the four suppliers of the head but not the one it drops. A sentence under "What changes in form" would do: "The Gaussian identities of §4.0 are now taken from Mathlib and Tau Ceti; StandardDistributions is no longer a supplier."

## N01 — The section comments of `Suggested.lean` say "Layer 3" and "Layer 4" where the README says M0.3 and M0.4

Lines 45 and 74 of the Lean file; the README's ids are the milestones M0.1–M0.4.

## Previous findings

The previous report had no finding. Its format note (the domain D of Layer 3 written without its lower time bound) is not repaired: line 430 still reads "D = {(s, t) : s > 0, t < T}". It is carried as C01 above, with the exclusion of t₀ = 0 in §3.3, which belongs to the same point.

## Verified sound

| Statement | Instances tried | Values computed (README side / my side) | Result |
|---|---|---|---|
| §1.1 asset price | μ = 0, σ = 1, S₀ = 1; σ = 0; discounting | E S₁ = 1, uncorrected e^(1/2) = 1.6487 / same; σ = 0 gives S₀exp(∫μ); S/β has drift μ − r | holds |
| §1.2 self-financing | a = 1, b = −S₀/β₀; jump at u; σ = 0, μ = r | V = S_t − S₀β_t/β₀ = gains; jump S_u vs continuous RHS; (xβ)' = r·xβ forces x' = 0 | holds |
| §1.2 simple-strategy formula | library predicate at `SimpleStrategy.lean:365`, `:484` | rebalancing identity for j + 1 < n, for every ω; equivalence on (τ₀, τ_n] under strict monotonicity / same | holds |
| §2.0 risk-neutral measure | κ ≠ 0; tilt +κ; no −κ²T/2 | E_Q W_T = −κT; wrong tilt 2κT; E e^(−κW_T) = e^(κ²T/2); μt + σW = rt + σ(W + κt) | holds |
| §2.1 representation | ξ = W^Q_T; ξ = (W^Q_T)² | h = 1, mean 0, against W constant κT; (W^Q_T)² = T + ∫2W^Q dW^Q | holds |
| §2.2 completeness and pricing | forward; H = 1; holdings | h = σS/β, a = βh/(σS) = 1, b = −Ke^(−rT); a²σ²S² = β²h²; P-price S e^((μ−r)(T−t)) − Ke^(−r(T−t)) | holds |
| §2.3 arbitrage, static claim | q = 10, p = 9; p = q; c = ±1 | cost cp − cq + c(q − p) = 0; payoff \|q − p\|β_T/β₀ = e^(rT); wrong sign −e^(rT); p = q pays 0 | holds |
| §2.4 progressive coefficients | κ_t = t on [0, 1]; constant κ; integrability | v = 1/3, E = e^(v/2 − v/2) = 1, wrong normalisation e^(−1/6) = 0.8465; \|aμS\| = β\|h\|\|κ + r/σ\| | holds |
| §3.1 necessity | C = s, e^(−r(T−t)), s²e^((r+σ²)(T−t)); σ = 0 | bond: rC − rC = 0, reversed 2rC; power: −(r+σ²)C + σ²C + rC = 0; P-value operator 2(r − μ)C; σ = 0: a = 0 ≠ 2s₀ | holds |
| §3.2 growth criterion | call, put, forward, s² | call ≤ 2(1 + s); put ≤ Ke^(\|r\|T) + s; s²: 3C ≤ A(1 + s²), a = 2S e^((r+σ²)(T−t)); domination by A(1 + sup Sᵖ) | holds |
| §3.3 and `existsUnique_weighted_price` | weight 1 + e^y; h = s; call payoff; growth | b = r − σ²/2 + σ²ρ, c = −r(1 − ρ) (also from PDE §6.9's formula); kink 0 vs K/(1+K); s C_s = sv + (1+s)v_y | holds; Lean type equals README |
| §4.0 closed forms | s = K = 100, r = 0.05, σ = 0.2, τ = 1; σ < 0; s → 0 | d₊ = 0.35, d₋ = 0.15, C = 63.683 − 53.233 = 10.4506, P = 5.5735; wrong put −10.45; C(−σ) = −P(\|σ\|) solves the equation | holds |
| §4.1 delta hedges | s = K = 1, r = 0, σ = 1, T = 1; maturity | 0.6915 shares, −0.3085 bonds, worth 0.3829; call minus put = (1, −1); a_T S_T + b_T β_T = (S_T − K)⁺ | holds |
| §4.2, `eq_callValue_of_pde`, `eq_putValue_of_pde` | weighted difference; forward; Tychonoff | \|v\| ≤ A + 1; drift ≤ \|r\| + σ²/2, c ≤ \|r\|; hypotheses of `WholeSpace.lean:478` met without joint continuity; wrong forward 2rKe^(r(T−t)) | holds; Lean types equal README |
| §4.3 Greeks and limits | same numbers; s = K, τ ↓ 0 | φ(0.35) = 0.37524, gamma 0.01876, vega 37.52; φ(0.15)/20 = 0.01972; 37.52 = 95.12·0.3945; √τ·gamma → 1/(Kσ√(2π)) | holds |
| C01: Layer 3 at t = 0 | lines 81, 427, 430, 565 | D not open at t = 0; starts t₀ ∈ [0, T) in §3.1, 0 < t₀ < T in §3.3 | small correction |

- Source locators checked against the text: 0 of 12 (eleven into `Shr04`: §4.5 five times, §5.2.1, §5.2.2, §5.2.4, §5.2.5, §5.3.2, §5.4.3; Black–Scholes 1973 without locator). No legal copy; statements checked by computation.
- Library declarations opened at the pinned Tau Ceti: 31, among them `callValue` (`Probability/Finance/BlackScholes/Extension.lean:80`), `continuous_callValue` (`:230`), `callValue_pde` (`:279`, σ ≠ 0), `riskNeutralPrice_call_eq_callValue` (`:134`, τ ≥ 0), `IsSelfFinancing` (`Probability/Finance/SimpleStrategy.lean:365`), `not_isArbitrage_geometricBrownianMotion` (`Probability/Finance/BlackScholes/NoArbitrage.lean:117`), `itoDrift_eq_hedgeDrift_iff_pde` (`Probability/Finance/BlackScholes/Hedge.lean:130`), `pde_comp_log` (`Probability/Finance/LogSpot.lean:72`), `ParabolicC2HolderSpace` and `timeExtension` (`Analysis/PDE/Parabolic/Holder/Two.lean:119`, `:84`), `eq_of_euclideanBackwardParabolicOperatorL_eq` (`Analysis/PDE/Parabolic/Holder/Backward.lean:377`), the whole-space uniqueness theorem (`Analysis/PDE/MaximumPrinciple/Parabolic/WholeSpace.lean:478`), `isBrownianReal_sub_mul_min_tilted_mul_eval` (`Probability/BrownianMotion/Girsanov.lean:177`), `rightCont_nullAugment_natural_add_drift_tilted` (`Probability/BrownianMotion/NaturalFiltration.lean:47`).
- All 144 backticked library names of the README are declared at the pinned Mathlib or Tau Ceti; no uniqueness theorem for `callValue` or `putValue` and no statement of §3.3 exists at the pin, so the three Lean targets duplicate nothing.
- Cross-roadmap citations resolved on main: StochasticCalculus §0.2, §2.2, §3.2–§3.4, §4.1, §4.3, §5.1, §5.4, §6.1, §7.3, §7.4, §9.1, §9.4, §10.3 and Layer 3; PDE §6.6 and §6.9; StandardDistributions; MarketImpact, whose link to the anchor `m01-assets-and-trading` still resolves.
- Record against the README at the merge base: M0.1–M0.4 keep their ids, order and subjects; every item of main was found at the head with its statement; the only hypothesis removed is the global Lipschitz condition of §3.3, which the description states.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`. No change outside the folder. Automatic checks: all passed.
- Elaboration: `Suggested.lean` gives three `sorry` warnings (lines 58, 83, 99) and nothing else. The three elaborated types were compared with §3.3 and §4.2: no binder lost, nothing changed. One-tactic probes (`simp`, `rfl`, `infer_instance`, `simp_all`, `aesop`) close none of the three.
- Description against the head: 14 Check blocks with 32 Checks; the milestones, the *In Tau Ceti* items, the changed statements of §3.3, §4.2, §3.2 and §4.1, the three declarations and the removed ones agree with the head; one omission, C02.

Overlap check: read MarketImpact, StochasticCalculus and DysonBrownianMotion on main and the open DiscreteTimeFinance, BinomialToBlackScholes and PortfolioTheory; nothing shared. The three open roadmaps name FinancialMathematics (M0.4) as the owner of the continuous-time market and the Black–Scholes prices and restate none of it; no open pull request changes this roadmap or drops an id it cites.

Source independence: 0 passages compared with 0 sources, since the text and the table of contents of `Shr04` could not be read; largest share `Shr04`, 11 of 12 locators; contents not compared (the cited sections run Ch. 5 in M0.2, §4.5 in M0.3, §4.5 and §5.2.5 in M0.4, so the milestones do not follow the cited sections in order).

Research link: M0.2 is the completeness and martingale-pricing theory of Harrison–Pliska (1981); M0.4 is the Black–Scholes (1973) price and hedge; MarketImpact builds its feedback-pricing model on M0.1–M0.4. Rests on the README's reference list and MarketImpact's README; no source text was read.

## Not verifiable

- The seeded sample against `Shr04` (§4.5, §5.2.1, §5.2.2, §5.2.4, §5.2.5, §5.3.2, §5.4.3): the book is behind the publisher's paywall, recorded as cited by locator alone, and no copy is in the sources cache; each statement was checked by computation instead.
- Black–Scholes 1973, Harrison–Pliska 1981 and Karatzas–Shreve 1998 carry no locator and were not read.

## Source issues

- none

## For the human reviewers

- Not tested: eleven of the twelve locators point into Shreve 2004 (`Shr04`, §4.5, §5.2.1, §5.2.2, §5.2.4, §5.2.5, §5.3.2, §5.4.3), which is paywalled; wording, arrangement and section numbers were not compared with its text.
- Licence: the board's manifest entry for `Shr04` lists the sections 4.5, 5.2.4, 5.3.2 and 5.4.3; the README at this head also cites §5.2.1, §5.2.2 and §5.2.5.
- Scope: PDE on main says the bundled parabolic Hölder spaces are not at the pins (`TauCetiRoadmap/PDE/Suggested.lean`, line 48), while this roadmap states §3.3 on the pinned `TauCeti.ParabolicC2HolderSpace`.
