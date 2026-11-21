# Review of RuinTheory (pull request #2906 at fe4f104)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement of the nine sections was recomputed on degenerate and two-term instances (the `±1` walk, the zero walk, `u < 0`, `R = 0`, non-integrable increments, exponential claims with constant and two-valued income) and each agrees with its Lean signature; all cited locators in Kevei's notes and in Durrett were read and support the statements as scoped. There is one small correction (the description of two Mathlib convergence lemmas in the supplier contracts) and one format note, neither blocking. Two points are left for the human reviewers: the main source is an unpublished set of lecture notes, and one author's page was identified by initials only.

## C01 — The contract for the two monotone-convergence lemmas for Bochner integrals understates their hypotheses

An implementer who reads the supplier contracts would expect to apply these lemmas knowing only that the first term is integrable, and would be stuck: at the pin both ask for more. In "Exact supplier contracts", under Mathlib (README line 590), `MeasureTheory.integral_tendsto_of_tendsto_of_monotone` and `MeasureTheory.integral_tendsto_of_tendsto_of_antitone` are described as "monotone convergence for real integrands with an integrable first term". At the pin (`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean`, lines 801–804 and 840) each assumes `hf : ∀ n, Integrable (f n) μ` and `hF : Integrable F μ`: every term and the limit are integrable.

No route is affected: in 2.1 the limit `X` is integrable because its mean is negative and each quotient is integrable on `(0, r]`, and the route of 3.2 already says that the monotone lemma "needs that integrability". The smallest change is to the parenthesis: "(monotone convergence for integrable real integrands with an integrable limit)".

## N01 — The first API bullet of 1.1 uses that `P` is a probability measure without saying so

"The ruin probability … equals `1` for `u < 0`" (README line 81) holds for a probability measure; `ruinProb` is defined for any measure, where the value is `P Ω`. Adding "for a probability measure `P`" to the bullet (and to the Check of 1.3 that says "for every walk") would match the definition's generality.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 `ruinProb`, `ruinTime` | `±1` walk `p = 0.3`, `u = 1`; zero walk; `u < 0` | strict `(3/7)² = 0.18367`, weak `3/7 = 0.42857`; zero walk: `0` at `u ≥ 0`, time `⊤`; `u < 0`: time `0`, value `1` | agrees; `u ≤ Sₙ` variant excluded by zero walk | none (N01) |
| 1.2 reserve ruin = walk ruin | `T = 0, Z = 1, u = 0`; `T ∈ {0,1}`, `Z₀ = 10, Z₁ = −10` on `E`; `c < 0`; `u < 0` | no-hypothesis cases: left `0`, right `1` and left `0`, right `1/4`; `c < 0`: reserve `> u − Sₙ₊₁`; `u < 0`: both `1` | true under stated hypotheses; both controls separate | none |
| 1.3 net-profit dichotomy | `±1` walk `p = 0.4` and `p = 0.6`; `u = −1`; `E Y⁺ = ∞` | `ψ(0) = 2/3 < 1`, `ψ(u) = (2/3)^(⌊u⌋+1) → 0`; mean `0.2`: `ψ = 1`; `ψ(−1) = 1`; Bochner mean `0`, neither applies | agrees with Lean (`0 ≤ u` guard present) | none |
| 2.1 uniqueness | `X = 0`; `X = a ≠ 0`; `±1` walk | `X = 0`: all `R` solve; constant: `exp (R a) ≠ 1`; `±1`: roots `0`, `log (q/p)` only | hypothesis `¬ X =ᵐ 0` needed and sufficient | none |
| 2.1 existence | normal `m = 1, σ = 2`; density `∝ e^(−z)/(1+z)³` shifted by `1` | `R = 2m/σ² = 1/2`; constant `3.35375`, `E X = −0.64625`, `E e^X = 0.61689 < 1`, no root | agrees; `1 ≤ mgf` hypothesis separates | none |
| 2.1 sign of drift | `X = 0`; non-integrable `X⁻` | `X = 0`: mean `0`, not `< 0`; `X⁻` non-integrable: Bochner mean `0` | both hypotheses needed | none |
| 2.2 exponential martingale | `n = 0`; `±1` walk `p = 0.4`, `r = 1`; filtration `σ(Y 0..Y n)` | value `1` at `0`; `E e^(S₁) = 0.4e + 0.6/e = 1.30804`; wrong filtration: `E[M₁ ∣ ℱ₀] = M₁ ≠ 1` | true; independence hypothesis excludes wrong filtration | none |
| 3.1 Lundberg | `±1` walk `p = 0.3`, `u = 1`; `u ≤ 0`; `R = 0`; `R < 0`; Pareto tail | weak event `3/7 = e^(−R)`, equality; `u ≤ 0`: `1 ≤ e^(−Ru)`; `R = 0`: bound `1`; `R < 0, u < 0`: `1 > e^(−Ru)`; `(u+3)^(−2) > e^(−Ru)` | true; `0 ≤ R` and integrability both in Lean | none |
| 3.2 overshoot identity | `±1` walk `p = 0.3`, `u = 2.5`; zero walk `u = 1`; `u < 0` | both sides `0.12024`; zero walk: `0` vs `e^(−R)`; `u < 0`: `e^(−Ru)` both sides | true; `¬ Y 0 =ᵐ 0` present in Lean | none |
| 4.1 exponential claims | `δ = 1`, `W = 1.5`; `W ∈ {−0.5, 3}`; `u = −1`; `R ≥ δ` | `R = 0.58281`, formula `0.41719`, simulation `0.4185`; negative income: formula `0.5613`, simulation `0.486`; `u = −1`: `1` vs `0.97712`; `R ≥ δ`: mgf infinite | true; `W ≥ 0`, `u ≥ 0` needed and present | none |
| 4.2 doubly exponential | `δ = λ = 1, c = 1.25, u = 5`; `δ = 2, λ = c = 1`; `λ > cδ`; `δ ≤ 0` | root of `(δ/(δ−r))(λ/(λ+cr)) = 1` is `δ − λ/c = 0.2`; `0.29430` vs bound `0.36788`; `e^(−u)/2`; formula `> 1`; zero measure, vacuous | true | none |
| Scope: forcing not monotone | claim `1`, `λ = 1`, `c = 3` | `e^R − 1 = 3R` at `R = 1.90381`; derivative of `e^(Ru)(1 − u)` at `0` is `R − 1 > 0` | true | none |
| C01 contract wording | pinned declaration opened | `hf : ∀ n, Integrable (f n) μ`, `hF : Integrable F μ` against "integrable first term" | wording too weak; routes unaffected | reword |

- Source locators checked against the text: 12 in Kevei (§11.1, Proposition 5, Theorem 27, Corollary 1, Lemma 15, (50) and the remark after it, Proposition 7, Corollaries 2 and 3, Theorem 28; Kevei lines 2292–2348, 2526–2537, 2563–2625, with printed pages 72 and 79–81 read as page images) and 2 in Durrett (Exercises 4.8.8 and 4.8.11, printed p. 262; Durrett lines 12774–12792). All agree, including the stated differences (Cramér–Lundberg model in the source, general increments here).
- Library declarations opened at the pins: 36 Mathlib names of the supplier contracts (each found in the file the README names) and 10 Tau Ceti names in `Probability/Renewal/Basic.lean`, `Probability/Renewal/Exponential.lean`, `Probability/Distributions/Exponential/Basic.lean`; `expMeasure r` is the zero measure for `r ≤ 0` (`gammaPDFReal`, `Mathlib/Probability/Distributions/Gamma.lean` line 45).
- Duplication: no declaration on ruin, Lundberg, an adjustment coefficient, an overshoot or a discrete exponential martingale of a walk in the pinned Mathlib or Tau Ceti; no other roadmap, open or on main, states these objects.
- Cross-roadmap citations resolved: StochasticCalculus §0.6 and §2.3, StandardDistributions §7.5, MarkovChainsAndRenewal Layer 4 and Layer 6 item 3 (on main); PointProcesses Layer 6, RandomWalkFluctuationTheory 1.1 and 3.2, LargeDeviations 4.1 and 4.2 (at their open heads). None is a supplier.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only suppliers are Mathlib and Tau Ceti.
- Elaboration of `TauCetiRoadmap/RuinTheory/Suggested.lean`: 11 warnings, each "declaration uses `sorry`", nothing else. The 13 elaborated types were compared with the README statements: all hypotheses are explicit binders, none lost; `ruinTime` needs no measurable space.
- One-tactic probe (`rfl`, `simp` with the two definitions unfolded, `infer_instance`, `exact?`) on a copy: none of the 11 theorems closes. No padding; all 9 headline groups of the README are stated.
- Overlap check: read MarkovChainsAndRenewal (main and open revision), LawOfTheIteratedLogarithm, SeriesOfIndependentRandomVariables, OptimalStopping, KestenStigumAndCriticalBranching, StochasticCalculus, DysonBrownianMotion; nothing shared. Ownership against the open pull requests was checked by object over all open heads.

Source independence: 16 passages compared with 2 sources, none shared; largest share Kevei, 12 of 14 locators; contents compared with Kevei §11.1–11.6: independent (Layer 1 ↔ §11.1; Layers 2, 3 and 4 all lie inside §11.4; §11.2, §11.3, §11.5, §11.6 have no layer; the source derives Lundberg from the overshoot identity, the README proves it first by Doob's inequality; the order 2 → 3 → 4 is forced by the `*Needs:*` lines of 3.1, 3.2 and 4.1).

Research link: Layers 3 and 4 are Lundberg's inequality and the overshoot identity of the Cramér–Lundberg risk model, the prerequisites of the Pollaczek–Khinchine formula and the Cramér–Lundberg approximation (Kevei 2026, Theorems 27 and 28, named as not treated); rests on the README's scope section and Kevei §11.4–11.5.

## Not verifiable

- none

Automatic checks set aside as false positives: the three mentions of PointProcesses, a roadmap not to be cited as a supplier; the README names it only to say that Poisson and compound Poisson processes are not defined here and that it does not depend on that roadmap.

## Source issues

- **Misprint** in Kevei at §11.4, the paragraph before Proposition 7, printed p. 80: the source says the time of ruin is recalled from section 9.1; it should be section 11.1, where it is defined (printed p. 72); affects nothing.
- **Misprint** in Kevei at Lemma 15, proof, printed p. 79: the source says the Cauchy–Schwarz inequality gives a strictly positive second derivative; it should be nonnegative, with equality for an almost surely constant variable; affects nothing.

## For the human reviewers

- **Scope.** 12 of the 14 source locators are to Kevei's lecture notes (unpublished, on the author's page, dated 19 November 2026); they state their Chapter 11 follows Asmussen–Steffensen, *Risk and Insurance* (Kevei line 2291). The other source is Durrett's textbook, two exercises.
- **Licence.** Durrett's text was read from the Duke page whose path carries only the initials `rtd`; it was taken as the author's own page on that basis.
