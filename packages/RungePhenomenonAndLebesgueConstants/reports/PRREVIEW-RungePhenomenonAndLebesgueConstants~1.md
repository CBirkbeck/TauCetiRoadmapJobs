# Review of RungePhenomenonAndLebesgueConstants (pull request #3210 at 04b9762)

**Verdict:** accepted

**Summary.** Accepted: no finding. Every statement was rederived by hand, every numerical value in the README was recomputed, the three sources were read at their locators, and each cited library declaration was opened at the pin; nothing false or unsupported was found. There are two small corrections and two format notes, none blocking. Two questions are left for the human reviewers: several explicit bounds are the roadmap's own and appear in no source, and two of the three sources are not refereed.

## C01 — In the second Check of 2.2 the value `2.56` is not the bound the sentence has just named

A reader who recomputes the Check gets a different number and cannot tell which is wrong. The sentence (line 208) says `λ(x₀)` "is at least `2ⁿ/(2n(2n − 1))` in every case; for `n = 10` it is `24.66`, the bound `2.56`". At `n = 10`, `2ⁿ/(2n(2n − 1)) = 1024/380 = 2.69`; `2.56 = 1024/400` is the theorem's bound `2ⁿ/(4n²)`. I get `λ(x₀) = 24.661`, so both inequalities hold.

Either write `2.69`, or say "against the route's bound `2.69` and the theorem's `2.56`".

## C02 — The description counts the equally spaced points of 3.2 as `n`, the head as `n + 1`

The description says "the explicit divergence bound `(7/5)ⁿ/(1352 n²)` at `1 − 1/n` for `n ≥ 1` equally spaced points (3.2)". At the head, 3.2 and its Lean statement interpolate at the `n + 1` points `−1 + 2j/n`, `j ≤ n`, with `n ≥ 1` (for `n = 2`: three points, error `0.6217` at `1/2`). With `n` points the evaluation point and the bound would be different ones.

The text that would be right: "for the `n + 1` equally spaced points, `n ≥ 1` (3.2)".

## N01 — The smoothness order in the Lean statement of 1.2 is a sum of casts, the other three occurrences a cast of the sum

In `exists_sub_eval_eq_hermite` the hypothesis elaborates as `ContDiffOn ℝ (∑ i ∈ s, ↑(m i)) f (Icc a b)`, while the degree bound, the order of the derivative and the factorial use the natural number `∑ i ∈ s, m i`. The two agree (I checked `push_cast` closes the equality at the pin), so nothing is wrong; writing `((∑ i ∈ s, m i : ℕ) : WithTop ℕ∞)` would spare an implementer the rewrite, and it elaborates.

## N02 — The last Check of 1.2 names functions and multiplicities but no nodes or sample points

So it cannot be recomputed. Giving the nodes for one of the three functions, with one value of the quotient, would make it a test like the `eˣ` Check above it (which I recomputed: `1.48076`).

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 1.1 Rolle with multiplicities | `N = 0`; `a = b`; `(x−1)²x` on `[0,1]`; two labels at `0` for `g = x` | `N=0`: hypothesis `k=0` is the conclusion. `a=b`: one label, `μ = N+1`, `k = N` given. `g″ = 6x−4`, zero `2/3`. Repeated labels: `g′ = 1`, no zero | true; distinctness needed | none |
| 1.1 route | count after one step | `(#Z−1) + (N+1−k−#Z) = N−k`; `#Z−1` gaps each hold ≥ 1 of `#Z−1` points, so exactly one, none in `Z` | sound | none |
| 1.2 Hermite error | `N = 0`; `a = b`; `eˣ`, `m = (2,1)`; `p = x²+x`; two labels at `0` | `N=0`: `p = 0`, `ξ = x`. `eˣ` at `1/2`: quotient `1.48076 ∈ [1, e]`. Degree control: `−1` vs `2ξ ≥ 0`. Labels: `−1` vs `0` | true; both hypotheses needed | none |
| 1.2 Lean order of smoothness | sum of casts vs cast of sum | equal by `push_cast` at the pin | faithful | N01 |
| 2.1 operator norm | empty `s`; `a > b`; nodes `−1,0,1`; labels `0,0,1` | `Λ = sSup{0} = 0`, `sSup ∅ = 0`. `ℓ(1/2) = −1/8, 3/4, 3/8`, sum of moduli `5/4`; `λ = 1+x−x²` on `[0,1]`, max `5/4`. Labels: `λ = x²`, `Λ = 1`, `p_x = x²` | true, repeated labels included | none |
| 2.2 lower bound | `n = 1,2,3,10,30` exactly | `Λ = 1, 1.25, 1.6311` vs `0.5, 0.25, 0.2222`; `λ(x₀)`: `1, 1.25, 1.625, 24.661, 3.95·10⁶` vs `2ⁿ/(2n(2n−1))`: `1, 0.333, 0.267, 2.695, 3.03·10⁵` | true; route identity `P = (2n)!/(2ⁿn!)` checked | C01 |
| 2.3 upper bound | `n = 1..8` on a grid of 20001 points | `Λ = 1, 1.25, 1.6311, 2.2078, 3.1063, 4.5493, 6.9297, 10.9456` vs `2ⁿ`; `(m+1)!(n−m)!/n! = (m+1)/C(n,m) ≤ 1` | true; `2ⁿ⁺³/n < 2ⁿ` iff `n > 8` | none |
| 2.4 endpoint value | `n = 1,2,3,7,100` | both sides `1`, `1.4142136`, `1.6666667`, `2.2022146`, `3.8942696` | true | none |
| 2.5 log lower bound | `n = 1,2,100`; all `n ≤ 300` | `0 ≤ 1`; `0.4413 ≤ 1.4142`; `2.9317 ≤ 3.8943`; `log 2 = 0.693 > 3.15²/16 = 0.6202`; `(1/n)∑uᵢ/2 = π/8` | true | none |
| 2.5 with supplier bound | indexing of the two sides | both use `n` points `chebyshevRoot n i`, `i < n`; supplier 3.3 gives `≤ (2/π)log n + 3` | bracket consistent | none |
| 3.1 Cauchy kernel | nodes `0,1`, `z = 3`; no node; two labels at `0`; `z` a node | `p = −1/3 − x/6`, `(x−3)p = 1 + x/6 − x²/6 = 1 − x(x−1)/6`. Empty: `0 = 1 − 1`. Labels: `0` vs `1 − x²/z²`. `z` node: left vanishes at `z`, right is `1` | true; both hypotheses needed | none |
| 3.2 divergence | `n = 1,2,20,60` and all `n ≤ 120` in exact rationals | errors `0.9615, 0.6217, 39.995, 1.11·10⁸` vs bounds `1.04·10⁻³, 3.62·10⁻⁴, 1.55·10⁻³, 120.3`; never violated | true | C02 (description only) |
| 3.2 route constants | `I`, `ρ`, threshold | `I = −1.4114`; `ρ = 1.49012`; `e^{π/5} = 1.8745 < 1.88 < 2500/1274 = 1.9623`; `2·26·26 = 1352`; bound at `n = 43, 44`: `0.768, 1.027` | sound | none |
| 3.3 convergence | `n = 0,2,10,40`; grid for `n ≤ 40`; `x = 2`, `n = 2` | max errors `0.9615, 0.6006, 0.10915, 2.894·10⁻⁴` vs `5, 1.5823, 0.2277, 5.796·10⁻⁴`; outside: `4.0732 > 1.5823` | true; interval needed | none |
| 3.3 remark on supplier 1.3 | `f⁽²ᵏ⁾(0)` | coefficient of `x²ᵏ` is `(−25)ᵏ`, so `|f⁽ⁿ⁺¹⁾(0)| = (n+1)!·5ⁿ⁺¹` for odd `n`; supplier bound `M/(2ⁿ(n+1)!) ≥ 5ⁿ⁺¹/2ⁿ` | true | none |
| Definitions copied from the supplier | text of the three bodies | identical to `chebyshevRoot`, `lebesgueFunction`, `lebesgueConstant` in the supplier's Lean file on main | same objects | none |
| `equispacedNode` at `n = 0` | `2j/0` | single node `−1`; every statement about these nodes assumes `n ≥ 1` | convention stated | none |

- Source locators checked against the text: 8 of 8 (TrefethenWeideman1991 lines 21, 26, 167–169, 291–293; Sun2011 lines 1542, 1574–1580; BossoneyTroyanov2026 lines 248, 277).
- Library declarations opened at the pin: every Mathlib name of the supplier contracts (for example `Mathlib/LinearAlgebra/Lagrange.lean` 361, 644, 668; `Mathlib/Analysis/Calculus/IteratedDeriv/Defs.lean` 147; `Mathlib/Topology/TietzeExtension.lean` 274) and `TauCeti/Analysis/Calculus/LocalExtr/Rolle.lean` 51, whose statement matches the contract.
- Cross-roadmap citations resolved on main: PolynomialInterpolationAndBestApproximation 1.1, 1.2 (`nodal_chebyshevRoot`), 1.3, 3.1, 3.2, 3.3; ArithmeticInterpolationDeterminants 1.1 (`hermiteJet_bijective`). All say what is claimed of them.
- Duplication by object: no Lebesgue function or constant, Hermite error, multiplicity form of Rolle, or Cauchy-kernel interpolation identity in the pinned Mathlib or Tau Ceti; none in the 85 open heads read.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `Suggested.lean` elaborates with `sorry` as the only warning (10 theorems). Elaborated types of all 15 declarations compared with the README; no binder lost.
- One-tactic probe (`rfl`, `simp`, `infer_instance`) on a copy: none of the 10 theorems closes.
- The worker's automatic checks all passed; none was set aside.

Overlap check: read PolynomialInterpolationAndBestApproximation (main), LinearMultistepMethods (open); the Chebyshev points, Lebesgue function and Lebesgue constant are owned by PolynomialInterpolationAndBestApproximation and copied here with that stated; its scope lists the Hermite error, lower bounds for Lebesgue constants and the growth for equally spaced points as not treated, so this roadmap is their owner; nothing shared with LinearMultistepMethods.

Source independence: 8 passages compared with 3 sources, none shared (the longest common run is the six-word phrase for the operator norm, attributed in the text); largest share TrefethenWeideman1991, 5 of 8 locators; contents compared with TrefethenWeideman1991 (four sections: introduction, Newton's formula, band-limited interpolation, Lebesgue constants): independent.

Research link: Layer 2's bounds for equally spaced points are Theorem 2 of Trefethen–Weideman (1991), who attribute the growth rate to Turetskii (1940) and Schönhage (1961); Layer 3 quantifies the Runge phenomenon they describe; Layer 1 is the error side of the Hermite interpolation of Bossoney–Troyanov (2026). Rests on the sources read.

## Not verifiable

- nothing: all three cited texts were read (two from their authors' pages, one from arXiv).

## Source issues

- **Error** in Sun2011 at Section 3.7, proof of the bound (3.7.9), printed page 46 (Sun2011 line 1564): the source says the Lebesgue function of the Chebyshev zeros, as a function of the angle, has period π/n; it should be not periodic (for three points it is 5/3 at angle 0 and 1.2440 at π/3); affects the proof.

## For the human reviewers

- **Scope.** The explicit bounds of 2.3 (`2ⁿ`), 2.5, 3.2 (`(7/5)ⁿ/(1352 n²)`) and 3.3 (`1/sinh`), and 1.1–1.2 at general multiplicities, are marked "proved here"; no cited source states them. I rederived each route and recomputed the values.
- **Scope.** Of the three sources, one is a refereed article (Trefethen–Weideman 1991); Sun's text is a set of lecture notes (README line 491) and Bossoney–Troyanov is a 2026 arXiv preprint (README line 494).
