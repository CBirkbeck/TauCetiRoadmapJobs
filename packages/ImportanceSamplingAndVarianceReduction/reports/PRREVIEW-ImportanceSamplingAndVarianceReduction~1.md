# Review of ImportanceSamplingAndVarianceReduction (pull request #2697 at 71ba8e4)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every stated theorem was recomputed on degenerate instances (zero target, singular part, `n = 0`, `N = 0`, `Var h = 0`, infinite divergence, empty index set, junk values of `log 0` and of division by zero) and every numerical Check was recomputed; the 17 Owen locators and the Chatterjee–Diaconis theorem and proof were read at their pages and support the statements as written. There are three small corrections (a convention sentence that fails for non-measurable functions, a pointer to a roadmap that does not exist, one sentence of the description) and four format notes, none blocking. Two facts about the main source are left for the human reviewers.

## C01 — The convention that `variance X μ` is `0` and `evariance X μ` is `∞` when `X` is not square integrable holds only for a.e.-measurable `X`

The README treats non-measurable integrands as live cases (the third Check of 1.2), so a reader will apply the Conventions sentence "`variance X μ` is the real number `∫ (X − ∫ X dμ)² dμ` for square-integrable `X` and `0` otherwise" (lines 61–64) to them, and there it fails. On two points with the trivial σ-algebra and mass 1, `X = (1, 2)` is not a.e. strongly measurable, `∫ X dμ = 0` (the junk value), and `evariance X μ` is the lower integral of `(1, 4)`, which is `1`; so `variance X μ = 1`, not `0`, and `evariance` is finite although `X ∉ L²`. Mathlib's `evariance_eq_top` (`Mathlib/Probability/Moments/Variance.lean`, line 111) has the hypothesis `AEStronglyMeasurable X μ`. No stated result is affected: each one assumes or derives `MemLp`, or (2.4) measurability.

Smallest change: "for a.e. strongly measurable `X`: … for square-integrable `X` and `0` otherwise", and likewise "infinite when an a.e. strongly measurable `X` is not square integrable".

## C02 — PACBayesBounds, named in the scope section, is neither on main nor in an open pull request

In "Left to other roadmaps" (line 561) the text says "PACBayesBounds (a roadmap not on main) treats the change of measure inequality of PAC-Bayesian bounds". No roadmap of that name exists on main or at the head of any of the 465 open roadmap pull requests, so a reader cannot follow the pointer or check the claimed difference from 1.1. Drop the clause, or say what the statement is without naming a roadmap ("the change of measure inequality of PAC-Bayesian bounds, `∫ h dρ ≤ KL(ρ‖π) + log ∫ eʰ dπ`, is a different statement from 1.1 and is not treated").

## C03 — The description says the regression-estimator limit has no locator; the README gives one

The description's "Prior work" paragraph says "Harris's inequality for products of real laws and the regression-estimator limit are stated as targets with classical attributions in prose and no locator". At the head, 3.2 cites "(Owen, (8.34) and the discussion on p. 32)" for the limit, and the same paragraph of the description lists (8.29)–(8.34) among the locators checked. Text that would be right: "Harris's inequality for products of real laws is stated as a target with classical attributions in prose and no locator; the regression-estimator limit is cited to Owen's decomposition (8.34), which the source accompanies with an order-of-magnitude argument and not a stated theorem."

## N01 — Two Mathlib lemmas are listed under the wrong file

In "From Mathlib" (lines 579–582) `Measure.rnDeriv_withDensity` and `Measure.rnDeriv_smul_right` are listed under `Decomposition/RadonNikodym.lean`; at the pin both are in `Mathlib/MeasureTheory/Measure/Decomposition/Lebesgue.lean` (lines 591 and 638).

## N02 — Mathlib's Harris–Kleitman inequality is for families of finite sets, not for finite distributive lattices

The scope sentence "the Fortuin–Kasteleyn–Ginibre inequality and the Harris–Kleitman inequality on finite distributive lattices" (lines 532–534) reads as if both had that generality. At the pin, `fkg` is for a finite distributive lattice, while `IsUpperSet.card_inter_le_finset` (`Mathlib/Combinatorics/SetFamily/HarrisKleitman.lean`, line 98) is for families in `Finset (Finset α)`. Would read correctly as "…on finite distributive lattices and the Harris–Kleitman inequality for families of finite sets".

## N03 — The scope section compares 4.1 with BernoulliPercolation 3.1 but not with ConstructiveFieldTheoryPhi4 3.3

ConstructiveFieldTheoryPhi4 3.3 (an open roadmap, earlier in the merge order) states the FKG inequality for ferromagnetic Gibbs measures on `ℝ^V`, and its own Check says that for `J = 0` it is Harris's inequality for product measures. The common case with 4.1 is a product of copies of one admissible single-site law with polynomially bounded monotone functions; neither statement implies the other, so there is no second owner, but a line beside the BernoulliPercolation comparison would let a reader see that.

## N04 — Pairwise independence would suffice in the first sample-size bound and in 5.1

The route of 1.5 uses independence only through the variance of a sum, as 1.2 does with pairwise independence, and the same holds for the variance formula of 5.1; both are stated with `iIndepFun`. This is the sources' generality (i.i.d.), so nothing is wrong; the weaker hypothesis would match 1.2 if the author wishes.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 identity `integral_mul_isWeight` | `p` uniform on `{0,1}`, `q = δ₀`, `f = 1`; `f` only `p`-a.e. measurable | `∫ f w dq = 1/2`; `∫ f dp − ∫ f d(sing) = 1 − 1/2`; `f w` is `q`-a.e. measurable since `q` and `q.withDensity w` agree on `{w > 0}` | holds | none |
| 1.1 unbiasedness | same `p`, `q`, `f = 1_{0}`; `n = 0` | mean `1/2 = ∫ f dp` with `p` not `≪ q`; `n = 0` gives `0 ≠ 1/2`, excluded by `n ≥ 1` | holds | none |
| 1.2 variance | `q = p`; `n = 0`; non-measurable `f` on `{a,b,1,2}`; Gaussian example | `Var_p f / n`; `0 = 0`; left `1/(4n)`, right `5/(2n)` or `0`; `σ/(2 − σ⁻²)^{3/2}` is `1` at `σ² = 1`, `0.7698` at `σ² = 2`, minimum at `σ² = 2` | holds; `f ∈ L¹(p)` follows from support condition and `f w ∈ L²(q)` | none |
| 1.3 Kahn–Marshall bound | uniform on `{0,1,2}`, `f = (1,−1,2)`; `q = δ₀` without support condition; `∫⁻‖f‖ = ∞` | `16/9 ≤ 2` at `q = p`; `1 > 1/4` (control); `∞ ≤ ∞` | holds | none |
| 1.3 attainment | same `f`; `∫⁻‖f‖ = 0`; `= ∞` | `q* = (1/4,1/4,1/2)`, second moment `16/9 = (4/3)²`, variance `4/3`; `q* = 0`, `0 = 0`; `0` against `∞`, excluded | holds | none |
| 1.4 bounded weights | `f = 1`, `c = 2`; `q` uniform on `{0,2}` without support condition; `c < 1` | `1/3 ≤ 0 + 1`; `1/4 > 0` (control); derivation `c∫f²dp − μ²` unchanged | holds | none |
| 1.4 defensive | `p` uniform on `{0,1}`, `q = δ₀`, `a = 1/2`; `a = 1` | `q_a = (3/4,1/4)`, `w = (2/3,2)`, `Var = 1/3 ≤ 1`; `q_a = p`, `Var_p f ≤ Var_p f` | holds | none |
| 1.5 sufficiency | divergence `∞` (`L = 0`); `log 0 = 0`; `q = p`; 120 random pairs, `n ≤ 5`, exact | proof valid for any real `L`; `{L + t/2 < log w}` excludes `w = 0` as `L + t/2 ≥ 0`; `‖f‖e^{−t/4}`; no violation | holds | none |
| 1.5 necessity | no `p ≪ q`; `w = 0`; `n = 0`; same enumeration, `δ ∈ {0.1, 0.5, 0.9}` | `∫ w 1{w ≤ a} dq = p_ac{0 < w ≤ a} ≤ p{log w ≤ L − t/2}`; left side `0`; 1014 cases in all, no violation | holds | none |
| 1.5 direction of divergence | `p = (1/2,1/2)`, `q = (3/4,1/4)` | `KL(p‖q) = 0.14384`, `KL(q‖p) = 0.13081` | Check true | none |
| 2.1 consistency | `p = 0`; `p` uniform on `{0,1}`, `q = δ₀`, `f = 1_{0}` | estimate `0/0 = 0`, limit `0⁻¹·0 = 0`; estimate `1` against `1/2` (control for `p ≪ q`) | holds | none |
| 2.2 central limit theorem | `p = N(0,1)`, `q = N(0,4)`, `f = x²`; `f` constant; denominator `0` | variance `1.26502`; my simulations give `n Var` between `1.26` and `1.37`; variance `0`; `P(Dₙ = 0) → 0` | holds; `f ∈ L¹(p)` follows from `f w ∈ L²(q)`, `p ≪ q` | none |
| 2.3 lower bound | `f = 1_A`, `μ = 0.01`; `f ∉ L¹(p)` | `(2μ(1−μ))² = 0.00039204`, proposal mass `1/2` on `A`; `μ` reads `0` and the bound is 1.3 for `f` | holds | none |
| 2.4 defensive bound | `p` uniform on `{0,1}`, `q = δ₀`, `a = 1/2`, `f = 1_{1}` | `1/12 + 1/4 = 1/3 ≤ (1/4)/(1/2) = 1/2` | holds | none |
| 3.1 optimal coefficients | `Y = e^U`, `Z = U`; `ι` empty; two equal controls | `Var Y = 0.242036`, `Cov = 0.140859`, minimum `0.0039402`, `ρ² = 0.98372`; value `Var Y`; inverse `0`, excluded by positive definiteness | holds | none |
| 3.2 estimated coefficient | `Var h = 0`; `Y = e^U`, `h = U` | `β̂ = 0/0 = 0`, plain average, limit `N(0, Var f)` as the division convention reads; my simulation `n Var = 0.00386`, limit `0.00394` | holds | none |
| 4.1 Harris | `g = −f`; `ι` empty; monotone non-Borel indicator on `ℝ²` | `Cov = −Var < 0` (control); `Cov = 0`; up-set `{x+y>0} ∪ B` with `B` non-Borel on the antidiagonal is an up-set | holds | none |
| 4.2 antithetic pairs | `f = x`; `f = eˣ`; `f = (x − 1/2)²` | `Cov = −1/12`, average constant; `0.0039125 ≤ 0.12102`; variance `Var f`, twice the bound (control) | holds | none |
| 5.1 stratified estimate | four points, `Q = (1/6,1/3,1/4,1/4)`, `f = (2,−1,5,1)`, `n = (2,1)`; a null stratum | means `0, 3`, variances `2, 4`; mean `3/2`, variance `1/4 + 1 = 5/4`; `HasLaw X 0 P` impossible | holds | none |
| 5.2 proportional allocation | uniform on `[0,1]` cut at `1/2`, `N = 2`; `N = 0` | `1/96 ≤ 1/24`; `n = 0`, `0 ≤ Var/0 = 0` | holds | none |
| 5.3 Neyman | `ω = (1/2,1/2)`, `σ = (1,1)`, `n = (0,N)`; all `σ_h = 0`; some `σ_h = 0` with equality condition | `1/(4N) < 1/N` (control for `n_h ≥ 1`); `0 = 0`; condition forces `n_h = 0`, excluded | holds | none |
| Conventions, `variance` (C01) | two points, trivial σ-algebra, `X = (1,2)` | `variance = 1`, text says `0`; `evariance = 1`, text says `∞` | sentence fails off a.e.-measurable `X` | C01 |

- Source locators checked against the text: 17 of Owen (chapter 9: 10; chapter 8: 7) and Theorem 1.1 with its proof in Chatterjee–Diaconis; all at the pages given. OwenMCIS lines 84–112, 137–153, 191–196, 214–231, 257–283, 347–360, 380–384, 425–427, 434–442, 1316–1339, 2008–2016, 2086–2090; OwenMCVarBasic lines 206–243, 500–545, 586–609, 638–646, 2311–2343, 2385–2428, 2460–2482; ChatterjeeDiaconis2018 lines 98–114, 894–953.
- Library declarations opened at the pin: 33 Mathlib names of the supplier contracts (all present; two under another file, N01) and `TauCeti.covMatrix` (`TauCeti/Probability/Moments/Covariance.lean`, line 72).
- Cross-roadmap citations resolved: MathematicalStatisticsFoundations 4.2, 8.2, 8.3, 8.4, 8.5, 9.5 and MathematicalStatisticsNonparametric 1.2 on main; StatisticalLearningTheory 8.2, BernoulliPercolation 3.1, RenyiDivergenceAndPrivacy, MarkovChainMixing, LangevinAndHamiltonianMonteCarlo at their open heads; PACBayesBounds not found (C02).
- Duplication by object: no importance weight, self-normalized estimate, control-variate, antithetic or stratified statement in Mathlib, Tau Ceti, main or another open roadmap; nearest are StatisticalLearningTheory 8.2 and ConstructiveFieldTheoryPhi4 3.3 (N03).
- Overlap check: read RenyiDivergenceAndPrivacy, MartingaleCentralLimitTheorem, SeriesOfIndependentRandomVariables, MathematicalStatisticsFoundations, StochasticApproximationAveraging, MathematicalStatisticsAsymptotic, MathematicalStatisticsNonparametric; nothing shared.
- Dependency check: `depcheck: 109 roadmaps, 1320 edges, 0 problem(s)`; no UPWARD or CYCLE line. The only roadmap supplier is on main.
- Elaboration: `Suggested.lean` elaborates with 20 `sorry` warnings and no other message; single `import Mathlib`, no `set_option`, 10 definitions with real bodies. The 30 elaborated signatures were compared with the README statements: no binder lost, no difference of generality. One-tactic probe (`rfl`, `simp` with the definitions unfolded) on a probe copy of the file: none of the 20 theorems closes. Headlines: all those of the README are stated; the two declared consequences (zero variance, attainment of the self-normalized bound) are stated as such in the README.
- Automatic checks: all passed at this head; none set aside. No change outside the roadmap folder.

Source independence: 9 passages compared with 2 sources (3 chapter and paper files), none shared; largest share Owen, 17 of 18 locators; contents compared with Owen chapters 8 and 9: independent (Layers 1–2 draw on §9.1, §9.2, §9.11 and a second paper; Layers 3, 4, 5 correspond to §8.9, §8.2, §8.4, in another order, and Layer 4 is organised around an inequality the source does not state).

Research link: 1.5 states Theorem 1.1 of Chatterjee–Diaconis (arXiv:1511.01437v3, 2017); Layers 1–2 are the importance-sampling theory that, by the README's consumers section and Owen's chapter 9 introduction, sequential Monte Carlo builds on. Rests on the README and on the two sources read.

## Not verifiable

- The attributions made without a locator (Kahn–Marshall 1953, Hesterberg 1988 and 1995, Hammersley–Morton 1956, Harris 1960, Esary–Proschan–Walkup 1967, Neyman 1934) were not opened; the statements they are attached to were verified by computation or in Owen.
- The exact-enumeration Checks of 1.5 and 4.1 and the simulation figures of 2.2 and 3.2 were reproduced in kind (other random instances and seeds), not instance for instance.

## Source issues

- **Error** in OwenMCIS at §9.1, printed page 7: the source says weights bounded by `c` give importance-sampling variance at most `c` times the nominal variance; it should be `c σ_p² + (c − 1) μ²`, as in its Exercise 9.6 (for `f = 1`, `c = 2` the variance is `1/3 > 0`); affects nothing.
- **Gap** in ChatterjeeDiaconis2018 at Section 1, printed page 1, used in the proof of Theorem 1.1, printed page 21: the source says the samples are a sequence with common law and does not state independence there; it should say independent (or pairwise independent), which the variance step of the proof uses; affects nothing.

## For the human reviewers

- **Scope.** 17 of the 18 locators point to Owen's *Monte Carlo theory, methods and examples*, an unpublished book manuscript on its author's page (README References); the one refereed research source is Chatterjee–Diaconis. Harris's inequality (4.1) carries no locator.
- **Licence.** Each page of the two Owen chapter files carries the notice that they are not to be distributed or posted electronically without the author's permission (OwenMCIS line 26). They were read from the author's own page; the roadmap copies no passage, table or figure from them.
