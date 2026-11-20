# Review of UniversalApproximation (pull request #2671 at b863d90)

**Verdict:** accepted

**Summary.** Accepted: no statement, Check or route was found false, and every Pinkus and Telgarsky locator was read at its place and supports the statement as written. The seven headline theorems elaborate against the pins, none closes by a one-tactic probe, and every numerical value printed in a Check was recomputed and agrees. There are two small corrections and three format notes, none blocking. Barron's 1993 paper could not be read, so the attributions to it are unverified; that, and the use of unpublished lecture notes as the located source for Layer 4, are left to the human reviewers.

## C01 — Pinkus, pp. 179–181, does not discuss a dependence on the dimension "through the constant"

In the citation that closes the statement of 4.5 (line 478) the README says that Pinkus "discusses the result and its dependence on the dimension through the constant". A reader who opens those pages to find that discussion does not find it. What they contain is Makovoz's Theorem 6.12 and Theorem 6.13 with the rate `r^(−(n+1)/2n)`, a sketch of why Barron's class lies in the closed convex hull of the signed steps, and on p. 181 the remark that Barron's original estimate had the form `C r^(−1/2)` and started a debate about the curse of dimensionality (Pinkus1999 lines 1499–1502); the constant is not analysed.

Smallest change: "Pinkus, pp. 179–181, sketches Barron's argument and records his rate `C r^(−1/2)`".

## C02 — "Downstream consumers" says a ReLU-expressivity roadmap "can copy" `ShallowNet`, which is neither what that roadmap does nor how roadmaps share objects

The first bullet of "Downstream consumers" (line 520) invites a second definition of an object this roadmap owns. ReLUNetworkExpressivity, as it stands at its open head, builds its networks on Tau Ceti's `MLPSpec`, states that it does not depend on this roadmap, and only records that its depth-two networks compute the same functions as the one-hidden-layer rectifier networks here (its "Boundaries with other roadmaps", first bullet).

Smallest change: replace "can copy `ShallowNet` and `ShallowNet.eval` for" by "can cite `ShallowNet` and `ShallowNet.eval` as", or state the comparison instead: a depth-two ReLU network on `ℝⁿ` computes the same functions as `ShallowNet.eval` with the rectifier.

## N01 — Three boundary bullets describe other roadmaps as "an open roadmap, not on main"

In "Scope and ownership" (lines 547, 550, 553) the status of RobustnessCertificates, PolynomialInterpolationAndBestApproximation and StatisticalLearningTheory will be out of date once they merge. Naming the roadmap and what it treats is enough.

## N02 — The first Check of 4.1 reports an experiment, not a value a reader can recompute

"On 300 random finite sets … the identity for the mean holds to `10⁻⁹`" cannot be checked from the text. A computed instance would do the same work: in `ℝ` with `G = {0, 1}`, `b = 1`, `f = 1/2`, `k = 1`, the mean of `‖f − V‖²` is `1/4 = (1/2 − 1/4)/1`, each choice has squared distance `1/4`, and the bound is `3/4`; with `k = 2` the average of the two points is `f` itself and the bound is `3/8`.

## N03 — "networks are cubic polynomials" in the first Check of 3.4

With `σ(t) = t³` on `ℝ` the networks are the polynomials of degree at most `3` (constants and lower degrees included), as 1.3 says; "of degree at most `3`" would match it.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Networks | `σ = 0`; width 0; `σ(t) = t`; translate `x ↦ λx + v` | constant `outBias`; `⟪∑cᵢwᵢ, x⟫ + ∑cᵢbᵢ + c₀`; unit becomes `σ(⟪λw, x⟫ + ⟪w, v⟫ + b)` | agrees; `MLPSpec` depth 2 has one activation slot and affine last layer | none |
| 1.2 Density on compact sets | `K = ∅`; one-point space; lines against `t²` on `[0,1]` | `t² − t + 1/8` takes `1/8, −1/8, 1/8` at `0, 1/2, 1`: distance `1/8` | agrees | none |
| 1.3 Polynomial activations | `d = 0, 1`, general `d`; `E = {0}`; `σ = t²` on `ℝ²` | monic Chebyshev on `[0,1]`: `2^(1−2n)` with `n = d+1` gives `1/2`, `1/8`, `2^(−2d−1)`; span of `(⟪w,x⟫+b)²` has dimension 6 | agrees | none |
| 2.1 Ridge density (headline) | `E = ℝ`; `xy` on `ℝ²`; `K = ∅`; infinite-dimensional `E` | `((x+y)² − (x−y)²)/4 = xy`; `exp⟪a,x⟫·exp⟪b,x⟫ = exp⟪a+b,x⟫`, `a = x − y` separates | agrees; Lean set equals README's | none |
| 2.2 Reduction (headline) | Heaviside `σ`; `E = {0}`; zero ridge terms | `ε/2 + r·ε/(2r) = ε`; Heaviside networks are finite step functions, dense on compacts of `ℝ` | hypothesis non-vacuous for a discontinuous `σ` | none |
| 3.1 Smoothing | ReLU with normalised bump, `n = 4, 16, 64, 256` on `[−2,2]`; `1_ℚ` | errors `1.88e-2`, `1.15e-3`, `6.75e-5`, `4.21e-6`; README `2e-2`, `1.2e-3`, `7e-5`, `4e-6` | agrees | none |
| 3.2 Monomials | `tanh`, `θ = 0.3`, `t ∈ [−3,3]`, `h = 1e-1, 1e-2, 1e-3` | `0.2880`, `0.02459`, `0.002405`; leading term `h·9·0.533/2 = 2.4h` | agrees | none |
| 3.3 One variable | `|t|` on `[−M,M]`; `1_ℚ`; `k = 0` | `(|t+M| − |t−M|)/2 = t`; `1_ℚ` network constant off a countable set, so `v ≤ 1/4` and `v ≥ 3/4` | agrees; constants always in `A(σ)` so `k ≥ 1` | none |
| 3.4 Characterization (headline) | `E = {0}`; `σ = 0`; `σ = t³`; `1_ℚ` | trivial `E`: dense for all `σ`, so `Nontrivial` needed; zero polynomial gives constants, not dense | iff holds both ways; Lean carries `[Nontrivial E]` and `Continuous σ` | N03 |
| 3.5 Hornik (headline) | constant `σ`; `σ(t) = t`; `1_ℚ`; `E = {0}` | each hypothesis dropped gives a non-dense class; trivial `E` dense by width 0 | agrees; no `Nontrivial` needed | none |
| 4.1 Maurey (headline) | `G = {g, −g}`, `f = 0`, `k = 1`; `G = {0,1}`, `f = 1/2`; `k = 0`; `G = ∅` | `b² = b²`; mean `1/4 = (1/2 − 1/4)/1`; `k = 0` would give `‖f‖² ≤ 0` | sharp; `0 < k` needed and present | N02 |
| 4.2 Closed hull (headline) | `G = {(1−1/n, ±1)}`, `f = (1,0)`, `k = 1`, `c = 1` | norms² `(1−1/n)² + 1 < 2`; `‖f − g‖² = 1 + 1/n² > 1 = c` | strict inequality needed and present | none |
| 4.3 Sigmoidal and steps | `s > 0`, `s = 0`, `s < 0`; logistic without shift | `λs + √λ → +∞, +∞, −∞`; unshifted limit at `s = 0` is `1/2` | agrees | none |
| 4.4 Barron norm, step representation | Gaussian on `ℝ`; `r = 1/2` with wrong constant; `z ≥ 0`, `z < 0`; `E = {0}`, `r = 0`, `C = 0` | `2π∫|ξ|e^(−πξ²) = 2.0000`; `0.544` vs `0.159`; the two step integrals give `∫₀ᶻ g'` and `−∫_z⁰ g'`; mass `≤ 2r·C` | agrees with Telgarsky's `2C` at `r = 1` | none |
| 4.5 Barron (headline) | Gaussian, uniform on `[−1,1]`, `m = 1, 2, 3`; `m = 0`; `1_{0}` with three atoms; `r < 0`, `r = 0` | best errors `0.0796`, `0.0209`, `0.0151` against `16/m`; isotonic fit `(0, 1/2, 1/2)` gives `1/6 > 0`; `c = b² − ‖F‖²/2` gives `c/m < b²/m` | agrees; hypotheses in Lean signature match README | C01 |
| Conventions: Fourier normalisation | `ω = 2πξ` | `f̃(ω) = 𝓕f(ω/2π)/2π`, `∫|ω||f̃| dω = 2π∫|ξ|𝓕f dξ`; ball of radius `r` multiplies by `r` | agrees with `Real.fourier_eq'` at the pin | none |

- Source locators checked against the text: 14 in Pinkus1999 (pp. 150, 152–153, 153, 154, 155, 155–156, 156, 157–158, 179, 179–181), 4 in Telgarsky2021 (Definition 3.1 p. 17, Theorem 3.1 p. 18, Lemma 3.1 p. 20, Example 3.1 item 2 p. 22); all 18 at the stated place.
- Library declarations opened at the pin: all 31 Mathlib declarations of the supplier contracts, each in the file named (for example `Submodule.closed_of_finiteDimensional`, `Mathlib/Topology/Algebra/Module/FiniteDimension.lean` line 534; `Continuous.fourierInv_fourier_eq`, `Mathlib/Analysis/Fourier/Inversion.lean` line 175; `MeasureTheory.MemLp.of_bound`, `Mathlib/MeasureTheory/Function/LpSeminorm/Basic.lean` line 630); Tau Ceti `MLPSpec` (line 56), `MLPSpec.realize` (line 171), `MLPSpec.realize_succ` (line 187) of `TauCeti/Geometry/Neuromanifold/MLP/Basic.lean` and `reluActivation` (line 89) of `TauCeti/Geometry/Neuromanifold/Activation.lean`.
- Duplication by object: no declaration on Maurey's sampling lemma, the Barron norm, ridge functions or density of networks in the pinned Mathlib or Tau Ceti, on main, or at any open head other than this one.
- Cross-roadmap mentions resolved: Neuromanifolds (main, scope sentence excluding approximation), BanachSpaceTheory (main, the finite blocking lemma), RobustnessCertificates, PolynomialInterpolationAndBestApproximation, StatisticalLearningTheory and ReLUNetworkExpressivity at their open heads; none is a supplier.
- Dependency check output: `depcheck: 200 roadmaps, 2195 edges, 0 problem(s)`; no UPWARD or CYCLE line. No change outside the roadmap folder.
- Elaboration of `TauCetiRoadmap/UniversalApproximation/Suggested.lean`: seven `sorry` warnings and nothing else; the 13 elaborated signatures were compared with the README statements, no binder lost, nothing changed. One-tactic probe (`simp`, `rfl`, `infer_instance`, `simp` with the definitions unfolded) on a copy: all seven theorems remain open.
- The worker's automatic checks all passed on this head; none set aside.

Overlap check: read ReLUNetworkExpressivity, RobustnessCertificates, Neuromanifolds, PolynomialInterpolationAndBestApproximation; nothing shared (the one-hidden-layer network on an inner product space, density on compact sets, Maurey's lemma and the Barron norm are owned here only; `MLPSpec` is Tau Ceti's and is only compared with in a Check).

Source independence: 13 passages compared with 2 sources, none shared; largest share Pinkus1999, 14 of 18 locators; contents compared with Pinkus1999 (sections 1–7): independent — its Section 3 is spread over Layers 1–3 with the roadmap's own definitions and Checks, Layer 4 draws on its Section 6 and on Telgarsky2021, and the order 2.1 → 2.2 → 3.3 → 3.4 is forced by the Needs lines of 2.2, 3.3 and 3.4. Barron's 1993 paper could not be read and was not compared.

Research link: Layers 1–3 are the density theorem of Leshno, Lin, Pinkus and Schocken (1993) with Hornik (1991) and Cybenko (1989); Layer 4 is Barron's (1993) rate, generalised by Makovoz (1996), and its norm is used in Ji, Telgarsky and Xian (2020). Rests on Pinkus1999 pp. 152–153, 179–181 and Telgarsky2021 line 766.

## Not verifiable

- Barron, *Universal approximation bounds for superpositions of a sigmoidal function* (1993): the publisher's page is not an open copy and the author's page refused the connection. Unverified: the form of his constant in Conventions, the closed-convex-hull lemma with `c > b² − ‖f‖²` (4.2), his approximation of steps (4.3) and the bound `(2rC)²/m` (4.5). The README gives these without a locator, and each statement was checked here by its own proof route instead.
- Hornik (1991), Cybenko (1989) and Leshno, Lin, Pinkus and Schocken (1993) were read only through Pinkus's report of them, which is how the README cites them.

## Source issues

- **Error** in Telgarsky2021 at Example 3.1, item 2, p. 22: the source says the sampled threshold units exist first and then work for any probability measure on the unit ball; it should be that the units are chosen after, and depend on, the measure; affects nothing.

## For the human reviewers

- Licence: the located source for 4.1, 4.4 and 4.5 is Telgarsky's *Deep learning theory lecture notes*, version 2021-10-27 (alpha), unpublished notes on the author's page (Telgarsky2021 line 7); the refereed source, Barron 1993, is cited without locator.
- Not tested: Barron 1993 could not be read, so the wording and statements of 4.2–4.5 and of the Fourier paragraph of Conventions were not compared with it.
