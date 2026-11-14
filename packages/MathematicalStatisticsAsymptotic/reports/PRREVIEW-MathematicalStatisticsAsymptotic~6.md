# Review of MathematicalStatisticsAsymptotic (pull request #2320 at d558329)

**Verdict:** needs changes

## R01 (P3) — Remove submission status from the roadmap

**Location:** TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:34, “which are not yet submitted”.
**Claim:** The added clause records temporary submission status, contrary to the timeless-writing rule.
**Witness:** README.md:32–37 describes the mathematical consumer contract; whether those consumers have been submitted changes without any change to that contract.
**Repair:** Replace the first sentence with: “This roadmap supplies its empirical-process toolkit and limits of experiments to MathematicalStatisticsSemiparametric, MathematicalStatisticsHigherOrderAndResampling, MathematicalStatisticsNonparametric and MathematicalStatisticsHighDimensional.” Keep submission status in the pull-request description.

## Previous findings

- R01 — repaired: README.md:1216 requires every sufficiently small ball; Suggested.lean:656 quantifies over all positive radii up to `r₀`, and :658 takes the positive-part supremum in `ℝ≥0∞`.
- R02 — repaired: README.md:699 supplies the Gaussian standard-deviation semimetric; :1036 uses it, and :1046 computes the constants-class negative control.
- R03 — repaired: Suggested.lean:486 states `isGlivenkoCantelli_indicator_Iic`; README.md:144 and :937 name it in the contract and target.
- R04 — repaired: README.md:2006 states quadratic-mean differentiability, the Lipschitz envelope, measurable maximizers, and the score expansion; its fixed-information statistics match Suggested.lean:1316.
- R05 — repaired: Suggested.lean:1053 adds the score mean, :1549 the influence-function assertion, and :1611 the contaminating law; README.md:438 separates joint Slutsky into an unnamed target.
- R06 — repaired: README.md:1938 replaces strict inequality by “at least” and computes both the truncated-square strict case and the nonconstant indicator equality case.
- R07 — repaired: README.md:2252 cites p. 292; :2289 cites pp. 291–292 and Theorem 20.8, p. 297, matching vdv lines 65 and 255.
- R08 — repaired: README.md:32 uses plain consumer names; :2127 removes the unavailable Nonparametric section numbers. The newly added submission-status clause is this report’s R01.
- R09 — repaired: the description retains the conclusions claim after the four repairs and updates the admitted-target count to 87, matching the head.

## Verified sound

| Statement | Instances tried | Computed, one side | Computed, other side | Result / change |
|---|---|---|---|---|
| 1.1 joint Slutsky | `Yₙ = Z ~ N(0,1)`, `Wₙ = 1/(n+1)` | distance to `(Z,0)` is `1/(n+1)` | tail probability `0` once `n+1 > 1/ε` | joint limit `(Z,0)`; separate prose target |
| 2.3 Gaussian semimetric | `X_t = 0`, `T = ℝ`; `X_t = tZ`, `T = [0,1]` | canonical distances `0`; `|s-t|` | covering sizes `1`; at most `⌈1/δ⌉+1`; moduli `0`, `δ|Z|` | new Gaussian clause passes |
| 3.4 classical Glivenko–Cantelli | `P = δ₀`, zero sample; uniform law, one observation `1/2` | supremum `0` for `n≥1`; `1/2` for uniform example | Dirac limiting supremum `0`; finite-sample discrepancy `1/2` | new signature passes |
| 3.6 random indices | constants `f_t=t`, any `τₙ` | empirical-process difference `0`; canonical distance `0` | modulus `0`; uncentred `L²` distance `|s-t|` | repaired route passes |
| 5.2 Wald consistency | normal location, `θ₀=0`, `Θ=[-1,1]`, radius `r≤1` | ball supremum at `x=2` is `2r-r²/2`; positive part bounded by `|x|` | rational supremum same; `E|X|=√(2/π)`; clipped mean tends to `0` | shrinking-ball and integrability repair passes |
| 7.3 QMD/LAN and score mean | normal location; constant model restricted to `{θ}`, score `1` | normal likelihood correction `1`, score mean `0`; singleton QMD remainder `0`, mean `1` | target limits `1`, `0`; singleton has empty interior | added interior condition discriminates |
| 7.6 minimax Check | constant estimator; `ℓ=min(x²,1)` and `ℓ=1{x≠0}` | supremum local risk `1` in both cases | Gaussian risks `1−2φ(1)=0.51605855`; `1` | corrected strict/equality cases pass |
| 8.1 composite tests | `N₂(θ,I)`, `c(θ)=θ₁`, local `h=(2,3)` | `λₙ=Wₙ=Sₙ=n X̄₁²`; `C I⁻¹ Cᵀ=1` | null `χ²₁`; local limit `(Z+2)²`, noncentrality `4`; differences `0` | rewritten hypotheses and statistics agree |
| 8.3 signed-rank convention | sample `(1,2)` | positive-rank sum `1+2=3` | positive pair sums with `i≤j`: `3` | ownership wording preserves the convention |
| 9.1 influence-function definition | `T(G)=G((-∞,t₀])`, `F(t₀)=1/2` | contamination derivatives `1/2` left of threshold, `−1/2` right | `1{x≤t₀}−F(t₀)=±1/2` | corrected page verified |
| 9.2 Hadamard cdf functional | `T(z)=z(t₀)`, `F(t₀)=1/2`; `P=δ₀` | influence mean `0`, variance `1/4`; Dirac influence `0` almost surely | limits `N(0,1/4)`; `δ₀`; linearization remainder `0` | added influence-function conjunct passes |
| 9.5 Huber minimax | `ε=.05`, `k=1.39837712`; `H=δ₀` | cutoff equation `.05263158`; mass `G₀=1`; variance `.97547340` | `ε/(1−ε)=.05263158`; `I=.79610014`, worst variance `1.25612338` | inequality and normalization pass |
| 9.5 contaminating law and score | same cutoff; `x=0,±k,2k` | excess density `0` inside; outside ratio to Gaussian `exp((|x|−k)²/2)≥1`; excess mass `.05` | `H₀` mass `1`, central mass `0`; log derivatives `0,∓k,−k` | new conjuncts and junction derivatives pass |

Untouched statement rows stand as in the previous review of `2ec3d2e`.

- Changed seeded targets: 3.6, 9.2 and 9.5; 3 locator occurrences verified in vdv §20.1 and Theorem 20.8 (vdv lines 65, 255); inaccessible texts listed below.
- Pinned declarations opened: `Mathlib/MeasureTheory/Function/ConvergenceInDistribution.lean:64`, :309; `Mathlib/MeasureTheory/Integral/Lebesgue/Basic.lean:48`; `Mathlib/MeasureTheory/Function/LpSeminorm/Defs.lean:92`; `TauCeti/Probability/Distributions/Gaussian/Cdf.lean:141`, :226.
- Supplier citations resolved: Foundations §§1.3, 2.4, 4.2, 4.3, 6.2, 8.1–8.6, 9.1–9.2; StochasticCalculus §§1.2, 1.4; StandardDistributions §5.3; OperatorTheory/PolarDecomposition PD-C19–PD-C27. No supplier added or dropped.
- Ownership searches: changed objects searched in the pinned libraries and indexed roadmaps; no duplicate target found. No files changed outside the folder; no layer or section removed or renumbered.
- Gate: worker’s candidate-order gate passed every check. Local rerun stopped at `depcheck: NOT IN ORDER: MathematicalStatisticsAsymptotic (insert it after its last supplier)`, explicitly exempted by the brief; candidate-order audit: `depcheck: 244 roadmaps, 2198 edges, 0 problem(s)`; no UPWARD or CYCLE.
- Targeted build and direct elaboration: exit `0`, with only `sorry` warnings. All 127 `#check @name` probes passed; changed signatures retain their hypotheses. Of 7 binder leads, 5 retain the instance and 2 are purely set-theoretic definitions needing none.
- Padding probes: 0 of 5 changed theorems closed with `rfl`, `simp` or `infer_instance`; no matching pinned theorem found. PR title, description and its count of 87 admitted targets checked against this head.

Overlap check: read MathematicalStatisticsFoundations, ProbabilisticAndMetricNumberTheory, PointProcesses, ClassicalErgodicTheory, StandardDistributions, RandomMatrices and OptimalTransport; Foundations owns the shared statistical definitions and fixed-space convergence algebra, StandardDistributions owns Gaussian projection norm laws; the new Glivenko–Cantelli theorem and Gaussian-process semimetric target belong here. No new shared ownership found.

Source independence: changed passages only; 3 passages compared with 1 readable source, vdv lines 65 and 255, with no shared expression beyond formulas and standard terminology. Largest share: vdv, 82 of 120 explicit source mentions in paragraphs with printed-page locators. No layer was added, removed or reordered; the previous contents comparison stands. Wording outside vdv Chapter 20 could not be compared.

## Not verifiable

- vdv outside Chapter 20: the source service could not obtain the book from Cambridge; the author’s excerpts omit the changed uses of Theorem 2.7, Lemma 18.15, Theorem 19.1, Lemma 19.24, Theorem 5.14, Theorem 7.2 and Theorem 16.7.
- vdvw: the source service classified the second edition as paywalled; the supporting §2.3 convergence locators could not be reread.
- js §2.4, equations (2.4.9)–(2.4.16), pp. 32–36: the source service found no legal text; the added Huber conclusions were checked mathematically, without certifying these locators.
- huber: the Project Euclid download returned a request-block page, not the article; it could not corroborate §9.5.

## Source issues

- **Misprint** in vdv at proof of Theorem 20.8, p. 297 (vdv line 266): the source says the paired map is differentiable at the pair of the point with itself; it should be at the point in the original domain; affects nothing.

## For the human reviewers

- Not tested: vdv has the largest locator share; only Chapter 20 was readable. Changed wording was compared against that chapter alone; the previous whole-book contents comparison stands.
- Licence: TauCetiRoadmap/MathematicalStatisticsAsymptotic/README.md:2514 and :2542 cite lean-CKSD and Statlib, including an Apache 2.0 attribution and adaptation of the QMD definition; neither repository was opened in this review.
- Scope: four roadmaps named as consumers and owners of excluded material at README.md:32 and :110 exist neither on main nor in the supplied open-pull-request index.
- Source status: hjort_pollard is a 1993 preprint, arXiv:1107.3806, cited beside a book for §9.6 (README.md:2462, :2563).
