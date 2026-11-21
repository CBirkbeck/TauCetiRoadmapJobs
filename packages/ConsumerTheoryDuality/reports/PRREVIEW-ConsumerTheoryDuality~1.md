# Review of ConsumerTheoryDuality (pull request #2871 at 6a66a17)

**Verdict:** accepted

**Summary.** Accepted: every statement of the five layers, and every Check, was recomputed (including the junk values of `sSup`, `sInf` and `fderiv`, `ℓ = 0` and `ℓ = 1`, and both inclusions of each equality of demand sets) and none is false; the Lean statements say what the README says, apart from one hypothesis placed more widely than the prose. There are three small corrections and no format note, none blocking. Two questions are left to the human reviewers: the only sources are one author's lecture notes, and the README names no research that uses these results.

## C01 — The Slutsky bullet of the Summary omits two hypotheses of 5.1

The Summary says that for a continuous `u` with single-valued Marshallian demand "the derivative in `p` of the Hicksian demand at level `ū` is the Slutsky matrix" (line 26). Section 5.1 proves this only where `x` is differentiable at `(p, e(p, ū))` and `ū` is reached by some bundle, and its own Check shows the first is needed: for `x₁ + 2√x₂` at `p = (1, 1)`, `ū = 2`, `∂h₂/∂q₁` is `2` on one side and `0` on the other, while the Slutsky matrix there is `0` by the `fderiv` convention. The other three bullets carry their hypotheses.

Adding "where `x` is differentiable at `(p, e(p, ū))` and some bundle reaches `ū`" to the bullet makes it the statement of 5.1.

## C02 — In `hasFDerivAt_hicksian_slutskyMatrix` the differentiability hypothesis also guards the conjunct that does not need it

The README's 5.1 states the identification of the Hicksian demand, `hicksianDemand u q ū = {x q (e(q, ū))}` for every `q ≫ 0`, without any differentiability, and adds the derivative "if `x` is differentiable at `(p, e(p, ū))`". In `Suggested.lean` (line 201) `hd` is a hypothesis of the whole conjunction, so the first conjunct, which mentions neither `p` nor a derivative, is stated only for demand functions differentiable at one point; an implementer of 5.2, whose route uses the identification at every `q` near `p` and for an `x` that may be nowhere differentiable, cannot take it from this theorem.

Either move `hd` inside, as the antecedent of the second conjunct, or state the identification as its own theorem with hypotheses `hu`, `hx`, `hū` only.

## C03 — The linear-utility formulas in the Examples of Layer 1 lack the ranges the other two examples carry

"Linear utility `x₁ + x₂`: `v = m/min(p₁, p₂)`, `e = ū min(p₁, p₂)`" (line 150) is stated with no range. With the conventions of this README, `e(p, ū) = 0` for `ū < 0` (the bundle `0` reaches the level) and `v(p, m) = 0` for `m < 0`, so the formulas hold for `ū ≥ 0` and `m ≥ 0` only; the Cobb–Douglas and Leontief lines say "for `ū ≥ 0`". Add the same two ranges.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 budget set, local nonsatiation | `ℓ = 0`; `u = −x`; `p = (0,1)`, `m = 1` | `ℓ = 0`: only `z = x`, no `u` nonsatiated; `u = −x`: fails at `0`, `v(1,1) = 0`, `e(1,0) = 0 ≠ 1`; `(t,0)` all affordable | true | none |
| 1.2 existence, `v = u x`, exhaustion | jump utility `x`/`x−1` at `(1,1)`; `x₁+x₂` at `p=(0,1)`; `−(x−1)²` at `(1,2)`; `p` with negative entries | sup `1` unattained, demand empty; unbounded so `v = 0`; demand `{1}`, cost `1 < 2`; exhaustion proof uses no sign of `p` | true | none |
| 1.3 Hicksian existence, `e = p·x` | `−(x−1)²`, `ū = −4`; `x`/`x+1`, `ū = 3/2`; `x₁x₂`, `p = (0,1)`; unreachable `ū` | contour `[0,3]`, `e = 0` (level set gives `3`); contour `(1,∞)`, `e = 1` unattained; inf `0` unattained; empty, `e = 0` | true | none |
| 2.1 `e(p, v(p,m)) = m`, demand equality | constant `u`; jump utility; `m = −1`; `p = (0,1)`; `sin 3x + x/5` at `m = 0.7`; `m = 0`; both inclusions | `e = 0 ≠ 1`; `v = 1`, `e(1,1) = 2`; `0 ≠ −1`; `0 ≠ 1`; `v = 1.10694` at `0.5458`, `e = 0.546`; `m = 0`: both `{0}` | true | none |
| 2.2 `v(p, e(p,ū)) = ū`, demand equality | `sin 3x + x/5` at four levels; step `0`/`1`; `x`/`x+1`; two-good three-valued `u`; `ū = −1 < u 0`; `ū = 2` unreachable; `ℓ = 0` | `e = 0.0950, 0.3289, 0.5065, 2.5644`, `v(1,e)` = level to `3·10⁻⁶`; `v = 1 ≠ 1/2`; `1 ≠ 3/2`; segment vs half segment; `0 ≠ −1`, demands both `{0}`; `0 ≠ 2`; `ℓ = 0` forces `ū = u 0` | true | none |
| 3.1 `e` concave, homogeneous, monotone | empty contour set; `t = 0`; `x₁+x₂`, `ū = 1`; `p` on the boundary of the orthant | `e ≡ 0`; `e(0,ū) = 0`; `min(p₁,p₂)`; costs `≥ 0` so the infimum is real on all of `p ≥ 0` | true | none |
| 3.2 homogeneity and monotonicity of `v` | Cobb–Douglas; constant `u`; `1/(1−x)` on `[0,1)` | `v = c m p₁^(−1/3) p₂^(−2/3)`; constant in `m`; `v(1,1.5) = 0` (unbounded), `v(2,1.5) = 4` | true | none |
| 3.3 quasiconvexity in `(p,m)` | `1/(1−x)` at incomes `0.5, 0.75, 2`; `√x` | `2`, `4`, `0`: fails without upper semicontinuity; `√2 > 1`: not convex; domain `{p ≫ 0, m ≥ 0}` convex | true | none |
| 4.1 Shephard and converse | `x₁+x₂` at `(1,1)`; Leontief; indicator of `(1,0)` and `(0,1+1/n)`; `x₁−√x₂` at `p = (1,0)`; `u = x`, `p = 0`; own proof of `x_q → h` | one-sided slopes `0`, `1`; gradient `(ū,ū)`; `e = min(q₁,q₂)` with demand `{(1,0)}`; `e(q) = 0`, `e(p) = 1`; demand `[0,∞)`, `e ≡ 0`; squeeze `(q−p)·x_q ≤ e(q)−e(p) ≤ (q−p)·h` | true | none |
| 4.2 Roy's identity | not differentiable; `p·x < m`; `p·x = m` with `u x > 0` and `≤ 0`; Cobb–Douglas; `(x₁+x₂−1)³` at `((1,2),1)`; satiated quadratic at `((1,2),1.5)` | `0 + xⱼ·0 = 0`; local minimum of `V` so `DV = 0`; local minimum of `q ↦ V(q, q·x)`; `m/(3p₁)`; all partials `0`, `x₁ = 1`; demand `(0.7, 0.4)` | true | none |
| 5.1 Slutsky matrix and equation | Cobb–Douglas at `((2,3),5)`; quasilinear at `((1,1),3)`; both wrong variants; `ℓ = 1`; the discontinuous exponential example | `[[−5/18,5/27],[5/27,−10/81]]`; `[[−2,2],[2,−2]]`; `[[−2,1],[3,−2]]`, `[[−4/3,−2/3],[−2/3,−10/3]]`; `0`; `e = 3/2 + log(27/32) = 1.3301`, Hicksian demand two points at `(1,1)` | true | C02 |
| 5.2 symmetry, negative semidefinite, kernel | Cobb–Douglas at `((2,3),5)`; quasilinear at `((2,3),5)`; `ū ≤ u 0` or unreachable; `x` not differentiable | trace `−65/162`, det `0`, `S p = 0`; `[[−2/3,4/9],[4/9,−8/27]]`, trace `−26/27`, det `0`; `x(q,0) = 0` so `S = 0`; `S = 0` | true | none |
| Summary, Slutsky bullet | quasilinear at `p = (1,1)`, `ū = 2` | `∂h₂/∂q₁` is `2` and `0` on the two sides; matrix `0` | hypothesis omitted | C01 |
| Layer 1 Examples, linear utility | `ū = −1`, `m = −1` | `e = 0 ≠ −min(p₁,p₂)`; `v = 0 ≠ −1/min(p₁,p₂)` | range omitted | C03 |

- Source locators checked against the text: 20 of 20 (Border's four notes, read from the author's page): Traditional Derivation lines 264–292, 402–416, 497–503; Duality Approach lines 10–128; Crib Sheet lines 12–41, 59–131; Profit-Cost lines 26–42, 209–263, 267–298.
- Library declarations opened at the pin: 22, all present where cited, among them `UpperSemicontinuousOn.exists_isMaxOn` (`Mathlib/Topology/Semicontinuity/Basic.lean:738`), `Real.sInf_smul_of_nonneg` (`Mathlib/Basic/Real/Pointwise.lean:42`), `ConcaveOn.continuousOn_interior` (`Mathlib/Analysis/Convex/Continuous.lean:220`), `second_derivative_symmetric_of_eventually` (`Mathlib/Analysis/Calculus/FDeriv/Symmetric.lean:467`), `HasFDerivAt.apply_self_eq_smul_of_eventuallyEq` (`Mathlib/Analysis/Calculus/LineDeriv/Basic.lean:285`, vector-valued), `ConvexOn.isPositive_of_hasFDerivAt_gradient` (`TauCeti/Analysis/Convex/Hessian.lean:93`, complete real inner product space).
- Cross-roadmap citations resolved: 5 of 5 (UtilityRepresentationTheorems 2.3; ConvexAnalysisAndDuality 2.1, 3.3, 3.4; KakutaniFixedPointAndContinuousGames 2.2; NonlinearProgrammingOptimality scope; MathematicalStatisticsFoundations 8.4). None is a supplier.
- Duplication by object: no budget set, demand, indirect utility, expenditure function or Slutsky matrix in the pinned Mathlib or Tau Ceti, nor in any roadmap on main or open; the only mention is UtilityRepresentationTheorems' scope, which excludes them.
- Dependency check: `depcheck: 172 roadmaps, 1999 edges, 0 problem(s)`; the README names no roadmap as a supplier. No change outside the folder.
- Elaboration: `Suggested.lean` elaborates with `sorry` (15) as the only warning; the 22 elaborated types were compared with the README (only difference: C02). One-tactic probe (`rfl`, `simp`, `simp` with the definitions unfolded, `simp_all`, `infer_instance`, `exact?`): none of the 15 theorems closes. All 15 headlines of the README are stated; no `set_option`, no sorried data, single `import Mathlib`.
- Automatic checks: all passed.

Overlap check: read UtilityRepresentationTheorems, KakutaniFixedPointAndContinuousGames, ConvexAnalysisAndDuality; nothing shared

Source independence: 9 passages compared with 4 sources (the definition of local nonsatiation, 1.2 exhaustion, the routes of 2.1, 2.2, 3.3, 4.1, 4.2, 5.1, 5.2), none shared; largest share Border's Crib Sheet, 7 of 20 locators; contents compared with the Crib Sheet (assumptions, solutions and value functions with their properties, equivalence, envelope theorem, Roy and Shephard, Slutsky, quasiconvexity): independent, the README's order being forced by its *Needs* lines (2 on 1; 4.1 on 3.1; 5 on 2.2, 3.1, 4.1).

Research link: none found. The README states no research motivation and Border's four notes carry no bibliography; the results are the classical duality theory of demand, stated here under weaker hypotheses than the notes'.

## Not verifiable

- none

## Source issues

- **Misprint** in Border, *Traditional Derivation of Demand Properties* (v. 2016.01.14) at the proof of Proposition 1 (1), printed page 6: the source says the improving bundle has utility above that of `y`, equal to that of an unbarred `x`; it should be the barred maximizer `x̄`; affects nothing.
- **Misprint** in Border, *Duality Approach to Demand Properties* (v. 2020.10.12) at the rearranged chain-rule display, printed page 2: the source writes the income derivative of ordinary demand with denominator `m`; it should be `∂m`; affects nothing.
- **Misprint** in Border, *Duality Approach to Demand Properties* (v. 2020.10.12) at the Hessian displays, printed pages 2 and 3: the last diagonal entry is printed as a first derivative of `e` over `∂²pₙ`; it should be `∂²e/∂pₙ²`; affects nothing.
- **Misprint** in Border, *Crib Sheet on Demand Theory* (v. 2016.01.15) at "Quasiconvexity of indirect utility", printed page 3: the source takes points named `x, y` in the lower contour set and then combines `z` and `y`; it should take `z, y`; affects nothing.

## For the human reviewers

- **Scope.** All 20 locators go to four sets of lecture notes by one author (Border, on his Caltech page, 2003–2020), not refereed; the README cites no textbook or article. The subject is classical demand theory; the README names no later theory using it.
- **Scope.** Most statements are marked "proved here" under hypotheses weaker than the notes' (no smoothness, monotonicity or quasiconcavity of `u`); no source states them in that form. I rechecked each proof route and found no gap.
