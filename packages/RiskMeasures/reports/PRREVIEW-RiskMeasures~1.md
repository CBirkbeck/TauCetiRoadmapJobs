# Review of RiskMeasures (pull request #2895 at 0a124d7)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route sentence was found false, the twelve headline theorems are all stated in `Suggested.lean` at the README's generality, and nothing duplicates the pinned libraries or another roadmap. There are three small corrections (an API bullet of 4.1 that needs its range of `t`, the maximizer of 4.3 at `t = 1`, and the way 2.1 cites the strong representation of Föllmer–Schied) and one format note on locators; none blocks. For the human reviewers: the Rockafellar–Uryasev text could not be read, and the Lean file was not compared with the prior formalization the README names.

## C01 — The bullet `valueAtRisk μ t ≤ averageValueAtRisk μ t` in 4.1 states no range of `t` and no integrability, and it fails outside those of the theorem

An implementer who takes the bullet as written, next to a bullet that evaluates at `t = 1`, would state a false lemma. For `μ = δ_1` and `t = 1`: the upper quantile at level `1` is the junk value `0` (`MeasureTheory.Measure.upperQuantile_of_one_le`, `TauCeti/Probability/Quantile.lean` line 477), so `valueAtRisk μ 1 = 0`, while `averageValueAtRisk μ 1 = −1` by the bullet just above; `0 ≤ −1` is false. Without integrability of the negative part the right side is the junk value `0` and the left side can be positive at a small level.

In the second bullet of 4.1 (line 424), add "for `0 < t < 1` and a law with integrable negative part".

## C02 — The maximizer described in the route of 4.3 is not a probability measure at `t = 1`

The theorem covers `0 < t ≤ 1`, and the sentence "Equality holds at the `Q` with density `t⁻¹(1_{X < q} + κ 1_{X = q})` … where `q = q⁺(t)`" (lines 494–496) is written for all of them. At `t = 1` the upper quantile is the junk value `0`: for `X ≡ 1` one gets `q = 0`, `P[X < 0] = P[X = 0] = 0`, `κ = 0`, and the density is identically `0`. The preceding sentence already settles `t = 1` (`Q = P`), so the statement is unaffected.

Begin that sentence with "For `t < 1`".

## C03 — In 2.1 the strong representation (4.6) of Föllmer–Schied is cited as holding for bounded measurable functions, but the source gives it only as equivalent to continuity from below

A reader who opens p. 4 finds that (4.6) holds exactly when `ρ` is continuous from below (4.5), not for every convex risk measure on bounded measurable functions, so "of which this is the case of a finite set" (lines 206–208) reads as a specialisation of a theorem the source does not state. The target itself is correct and is proved in the route: on a finite set a pointwise monotone limit is uniform and `ρ` is `1`-Lipschitz (1.1), so continuity from below is automatic.

Say so in the parenthesis, for example: "(4.6) on p. 4, which the source gives under continuity from below; on a finite set that continuity follows from the Lipschitz bound of 1.1".

## N01 — Three locators are slightly off

Section 2.2 cites Artzner–Delbaen–Eber–Heath, Proposition 3.1, which the entry under References does not list; in 4.1, equation (3.3) of Acerbi–Tasche is on p. 7, not pp. 5–6; in 3.1, the claim that Value at Risk satisfies T, PH and M stands after the two Remarks that follow Definition 3.3, not in the sentence after the definition.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 axioms, `acceptanceSet` | empty `Ω`; worst case; `E_P[X]`; mean + deviation, `P=(9/10,1/10)`, `Y=(0,10)` | empty: `ρ X = ρ X − m` fails; `E[−Y]=−1`, `σ=3`, `ρ(Y)=2>0=ρ(0)` | sound; Föllmer–Schied Defs 2.1–2.3 p. 2, ADEH Axioms T, S, PH, M, Def 2.4 read | none |
| 1.2 convex iff convex set | one point: `−x²` (set `ℝ`), `x³` (set `(−∞,0]`, `ρ(2)=8≠2`); `−min X − 1` | `(−1,−1)` in, `(−2,−2)` out; `ρ(0)=−1` | sound, both directions rederived incl. `t=0` (`0 ≤ ρ(0) ≤ 0`) | none |
| 1.2 homogeneous iff cone | same; `t = 0` | cone with `t=2` gives `−ρ(0) ≤ 0`; `t=0` gives `ρ(0) ≤ 0` | sound | none |
| 1.3 `riskMeasureOf` | `A=∅`; `A=univ`; `A={0}` on two points; `Ω=ℕ`; `A=(0,∞)`; empty `Ω` | `sInf ∅ = 0`; `sInf ℝ = 0`; `−1` vs `0`; `0=0`; acceptance `[0,∞)`; empty: `hbdd` fails | sound; Föllmer–Schied (3.2)–(3.5) p. 3, ADEH Prop 2.1 read | none |
| 2.1 dual representation, `minimalPenalty` | `E_P[−X]` with `P=(1/2,1/2)`, `Q=(1/3,2/3)`, `Y=(1,−1)`; worst case; trivial σ-algebra | `E_Q[−cY]=c/3`; penalty `0` for all `Q`; `∫−X=0`, `0≠−1` | sound; route recomputed (`w ≥ 0`, `∑w = 1`, `c ≤ −α(Q)`) | C03 |
| 2.2 coherent, both theorems | `𝒬=∅`; `t=0` in homogeneity; `P=(1,0)` | `sSup ∅ = 0 ≠ −1`; `sSup {0} = 0`; `ρ(0,−1)=1≠0` | sound; ADEH Props 3.1, 4.1 and the set in its proof read | none |
| 2.3 entropic | `Q=(1/10,0,9/10,0)`, `β=1`, `c=0,5`; `β=0`; `β=−1`; `ℕ` | `KL=1.19274`; `0.9304`, `1.1907`; `0`; `−0.6201>−0.7169`; `log 0 = 0` | sound; Föllmer–Schied (5.1), penalty pp. 5–6 read | none |
| 3.1 `valueAtRisk` | `X=±1`, `t=1/2`; `c=0`; `t ≥ 1`; zero measure | `q⁺=1`, `q⁻=−1`, `VaR=−1`; `δ_0` gives `0=0`; junk `0`; `cdf 0 = 1_{x≥0}`, `q⁺=0` | sound; ADEH Def 3.3, Acerbi–Tasche Defs 2.1, 2.2 read | none |
| 3.2 not subadditive | general `t`; `t=1/4` | `F_X(−1)=t`; `F(−2)=t²<t<2t−t²=F(−1)`; `1/16`, `7/16`; `0+0<1` | sound | none |
| 4.1 Rockafellar–Uryasev | `X=±1`, `t=1/2`; exponential, `t=1`; `δ_1`, `t=1`; 9680 laws and levels by script | `AVaR=1`, `g≡1` on `[−1,1]`; `g=e^z−1`; `0 ≤ −1` false; 9680 cases, 0 failures | sound; Acerbi–Tasche Def 2.5, Prop 4.2, Cor 4.3 and remark read | C01 |
| 4.2 coherence | `c=0`; monotone with only `X⁻` integrable; 2916 cases by script | `δ_0`: `0=0`; `Y⁻ ≤ X⁻`; 2916 cases, 0 failures | sound; Acerbi–Tasche Prop 3.1 p. 5 read | none |
| 4.3 dual of AVaR | `t=1`; `t>1`; `t=0`, `X=1`; `X≡1`, `t=1` in the route; 1280 cases by script | `Q=P`; no `Q`; `−1≠0`; density `0`; 1280 cases, 0 failures | statement sound; Föllmer–Schied (5.5), (5.6) p. 6 read | C02 |
| Scope: NoncommutativeIntegration §1.4 | bounded `X ≤ 0` | `μ_s(X)=inf{λ: P[−X>λ]≤s}=VaR_s(X)`; `Φ_t=t·AVaR_t` | sound | none |
| Scope: UtilityRepresentationTheorems 4.1 | `u=−exp(−βx)` | `exp(−βc)=E exp(−βX)`, `c=−entropicRisk` | sound | none |

- Source locators checked against the text: 34 (Föllmer–Schied 14, Artzner–Delbaen–Eber–Heath 10, Acerbi–Tasche 10); 3 not checked (Rockafellar–Uryasev).
- Library declarations opened at the pins: 24, among them `TauCeti/Probability/Quantile.lean` lines 164, 247, 448, 477, 509, 521, 858, 893; `TauCeti/Probability/Cdf.lean` line 95; `TauCeti/Probability/Distributions/Affine.lean` line 300; `TauCeti/InformationTheory/KullbackLeibler/Variational.lean` lines 202, 378; `Tilted.lean` line 72; `TauCeti/Analysis/Convex/FenchelMoreau.lean` line 207; `Mathlib/Analysis/Convex/Approximation.lean` line 68; `Mathlib/Geometry/Convex/ConvexSpace/CompactSpaceStdSimplex.lean` line 69; `Mathlib/Topology/Semicontinuity/Basic.lean` line 738; `Mathlib/InformationTheory/KullbackLeibler/Basic.lean` lines 56, 74.
- Cross-roadmap citations resolved: 8 (StandardDistributions §7.2, §7.13; MeansMajorizationAndDiscreteInequalities Layer 6; ConvexAnalysisAndDuality §2.1, §3.2; NoncommutativeIntegration §1.4; UtilityRepresentationTheorems 4.1; DiscreteTimeFinance 3.2).
- Duplication: no risk measure, acceptance set, Value at Risk or expected shortfall in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open; three open roadmaps name risk measures only as out of their scope.
- Dependency check: `depcheck: 171 roadmaps, 1988 edges, 0 problem(s)`. The roadmap names no roadmap as a supplier.
- Elaboration: `Suggested.lean` elaborates with 12 `sorry` warnings and nothing else; every declaration carries its binders in its own signature; none of the 12 theorems closes with `rfl`, `simp`, `simp_all`, `norm_num` or `infer_instance`.
- Headline theorems of the README (dual representation of convex and of coherent risk measures with the converse, the entropic penalty, non-subadditivity and the monetary properties of Value at Risk, the Rockafellar–Uryasev formula, coherence and the dual of Average Value at Risk, and the acceptance-set correspondence): all stated; no padding found. Automatic checks: all passed.
- Pull request text: title and description agree with the head (a new roadmap, 12 theorems, 9 definitions, one Tau Ceti import, no roadmap supplier).

Overlap check: read PACBayesBounds, DiscreteTimeFinance, OnlineConvexOptimization, LargeDeviations, PortfolioTheory, OptimalTransport, MathematicalStatisticsFoundations, MathematicalStatisticsNonparametric; nothing shared (the quantiles and the Donsker–Varadhan formula they and this roadmap use are Tau Ceti declarations, cited here and owned by none of them as a new target).

Source independence: 10 passages compared with 3 sources, none shared beyond four consecutive words; largest share Föllmer–Schied, 15 of 36 source mentions; contents compared with Föllmer–Schied (§2 axioms, §3 acceptance sets, §4 dual representation, §5 examples, §6 law invariance, §7 conditional): independent (Layer 1 joins §§2–3, Layers 3–4 are separate from and do not use Layers 1–2, §§6–7 absent; the order of Layers 1, 2 is forced by the *Needs* of 2.1 on 1.1). Rockafellar–Uryasev could not be read.

Research link: the headline targets are the representation theorem of Artzner, Delbaen, Eber and Heath (1999), its convex extension surveyed by Föllmer and Schied (2008), and the expected-shortfall results of Acerbi and Tasche (2002) and Rockafellar and Uryasev; rests on the README's References and the three texts read.

## Not verifiable

- Rockafellar–Uryasev, Theorem 10 (p. 14), Corollary 7 (p. 12) and Corollary 12 (p. 18): the sources service found no copy it accepts (the publisher's landing page refused, and the first author's page was not accepted as an author's page). Each statement they are cited for is also covered by Acerbi–Tasche or was recomputed.
- The prior formalization named under References (formal-mathfin): its files were not opened, so its statements as the README describes them were not checked.

## Source issues

- **Misprint** in Föllmer–Schied (survey of October 8, 2008) at (5.5), p. 6: the source says Average Value at Risk is the infimum of `E_Q[X]` over the measures with density at most `1/λ`; it should be the supremum of `E_Q[−X]` over that set; affects nothing.
- **Misprint** in Artzner–Delbaen–Eber–Heath (preprint of July 22, 1998) at §3.3, p. 13: the source says the acceptable net worths of Value at Risk are taken in the sense of Definition 2.4 (coherence); it should be Definition 2.3 (the acceptance set of a risk measure); affects nothing.

## For the human reviewers

- **Licence.** README References (lines 675–682) names a prior Lean formalization, formal-mathfin (Apache 2.0), with the same theorems in the loss convention. Its files were not compared with `Suggested.lean`; both use the name `valueAtRisk`.
- **Not tested.** Rockafellar–Uryasev (version of November 28, 2001) could not be read; its three locators and its wording were not compared. It is not the source with the largest share.
- **Scope.** Subject is axiomatic risk measures in mathematical finance (`metadata.toml`: math.PR). Sources read are an encyclopedia survey and two preprints of refereed papers (Mathematical Finance 1999; Journal of Banking & Finance 2002), in author-page or arXiv versions.
