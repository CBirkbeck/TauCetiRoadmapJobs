# FIX-PKG-GaussianIsoperimetryAndClusters~4

Findings of REV-PKG-GaussianIsoperimetryAndClusters~3: three, all P3, all verified and applied.

## F01 (P3) — applied

What changed: §8.2 `Metric.cthickening` → `Metric.thickening`, locator naming Ledoux1999 line 211, route via §8.1's open form, closed form derived by inclusion; Checks (ℚ², Bernstein set) now open thickenings; §8.3 bound `{0 < d_A < r} ⊆ cthickening ∖ A` → `= thickening ∖ A` (closed nonempty `A`), its Check and *Needs:*; Lean `cthickening` → `thickening`, docstring "open".

Evidence: Ledoux1999 line 211 defines `A_r` as the open `r`-neighbourhood, and line 308–313 uses it. `Metric.thickening_subset_cthickening` (Mathlib/Topology/MetricSpace/Thickening.lean:267) makes the open form the stronger one. The Mathlib contract now cites it, and `Metric.self_subset_thickening` (line 309).

Pattern: the other `cthickening` occurrences in the README are a consequence (§8.1, "hence … closed thickening"), a route step (§8.4) or a correct value (Layer 8 Examples, `closedBall(0, 2)`). None is a narrowed statement, so none changed.

## F02 (P3) — applied

What changed: §9.4 keeps the closed case as a prose target; the Lean name is removed and the locator says what the source covers. §9.5 gains convexity of `S̄_{F,u}(C)` (`convex_closedGaussianSymmetral`) and of `S_{F,u}(C)` for every convex `C`, with a route, *Needs:* §6.1, §9.1 and a boundary Check. §9.1 points to §9.5, and Summary line 5 now places the theorem in §9.5. Lean: `hC` deleted, theorem moved after `ehrhard_inequality_convex`, docstrings updated.

Evidence: Ehrhard1983 line 368–369 states Théorème 3.1 for open or closed convex sets. Proof of the general case: for `x + y` and `x′ + y′` in `S̄_{F,u}(C)`, convexity of `C` gives `θC_x + (1 − θ)C_{x′} ⊆ C_{θx+(1−θ)x′}`. `ehrhard_inequality_convex` in `F` (convex sections, `γ_F`) then gives the level `Φ(θ⟨y,u⟩ + (1−θ)⟨y′,u⟩)`. There is no cycle: §9.5's own route uses only the closed case of §9.4. The witness `C = {x_1 > 0} ∪ {0}×[0, ∞)` was recomputed (table).

Pattern: §9.2 and §9.3 also assume closed `C`, but they also claim the symmetral is closed, which needs closed `C`, and they only feed §9.4. They stay as they are.

## F03 (P3) — applied

What changed: "(TauCeti/Analysis/BoundedVariation/Slicing.lean:199)" → "(TauCeti/Analysis/BoundedVariation/Slicing.lean:190 and 199)".

Evidence: at the pinned Tau Ceti (`2fd255d`), `TauCeti.lintegral_perimeter_lineSection_le` is at line 190 and `TauCeti.ae_perimeter_lineSection_lt_top` at line 199 (namespace `TauCeti`, lines 103–206).

Pattern: the README has two other places where two names share one locator. Both are correct at the pin: ReducedBoundary.lean:95 and 106, and EssentialBoundary.lean:143 and 132.

## Checks run

- **Elaboration.** `lake env lean packages/GaussianIsoperimetryAndClusters/Suggested.lean`, run from the content checkout: no errors and 19 warnings, all "declaration uses `sorry`" (lines 100, 113, 130, 145, 192, 257, 271, 306, 318, 330, 340, 353, 362, 375, 384, 394, 403, 423, 435). No `TauCeti.*` olean was missing. The imports did not change.
- **Signatures.** I put a scratch copy of the file with `#check @name` for all 36 declarations into the scratch directory and elaborated it once (no errors). I then compared each elaborated type with the worker's earlier listing, after normalising notation (`ENNReal`/`ℝ≥0∞`, `ℙ`/`volume`, `inner ℝ`/`⟪·,·⟫`, namespace prefixes, `nhdsWithin 0 (Ioi 0)`/`𝓝[>] 0`). Exactly two types changed, both as intended:
  - `gaussian_minkowskiContent_ge` now has `(stdGaussian E) (thickening r A)`;
  - `convex_closedGaussianSymmetral` is now `∀ {C : Set E}, Convex ℝ C → Convex ℝ (closedGaussianSymmetral F u C)`, keeping `FiniteDimensional`, `MeasurableSpace`, `BorelSpace`, `u ∈ F` and `‖u‖ = 1`.

  The three definitions the worker's listing flagged (`gaussianWeight`, `gaussianSymmetral`, `closedGaussianSymmetral`) are unchanged. They drop only instances their bodies never use, and every theorem that uses them carries those instances.
- **Dependency check** (`gate --depcheck … --movable`): output `depcheck: 244 roadmaps, 2235 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- **Citations** (`roadmaps resolve` on the README): "Cross-roadmap citations found nowhere: None. Lean names found nowhere: None."
- **Ownership.** No new object or construction was introduced. The general convexity theorem strengthens this roadmap's own Layer 9 target. I ran `roadmaps grep -i 'Ehrhard|Minkowski content|Gaussian symmetr'` over main and the open heads. It found only unrelated matches (a heading in MaassForms, a formula in StandardDistributions).
- **Sources.** `sources.toml` already lists Ehrhard1983 (Théorème 3.1, cited for 9.4 and 9.5) and Ledoux1999 (Section 1.2, cited for 8.2 and 8.3), so it was not changed. No source was fetched and `needs-references.toml` was not written. `design/plan.json` was not touched: no supplier gap is needed.
- **Gate failures.** None were listed.

## Adversarial pass (changed and added statements)

Values were computed with the error function and bisection for `Φ⁻¹`.

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| §8.2 `gaussian_minkowskiContent_ge`, open thickening | `A = ∅` | thickening is `∅`; quotient `0 ≥ I(0) = 0` | holds |
| | `A = E` | thickening is `E`; quotient `0 ≥ I(1) = 0` | holds |
| | `n = 0`, `A = {0}` | `γ = 1`, `I = 0` | holds |
| | `{x_1 < −0.5}` | `(Φ(−0.4) − Φ(−0.5))/0.1 = 0.360407`, `0.352941` at `r = 0.01`, limit `φ(−0.5) = 0.352065` | equality |
| | unit disc in `ℝ²` | `0.604562`, `0.606510` → `0.606531 ≥ I(0.393469) = 0.384633` | holds |
| | Bernstein set | thickening `(−∞, r)`; quotient `0.398278`, `0.398936`, `0.398942` at `r = 10^{−1}, 10^{−2}, 10^{−3}`, against `I(1/2) = 0.398942` | equality |
| | `ℚ²` | thickening `ℝ²`; quotient `1/r → ∞` | holds |
| | `r ≤ 0` | excluded by the filter `𝓝[>] 0`, so `ofReal r > 0` and there is no `0/0` | no junk |
| §8.2 remark, closed form | `closedBall(0, 1) ⊂ ℝ²` | open and closed thickenings `ball` / `closedBall(0, 1 + r)` have equal `γ`; the inclusion gives the closed form | holds |
| §8.3 `{0 < d_A < r} = thickening r A ∖ A` | `A = {x_1 ≤ 0}`, `r = 1` | `{0 < x_1 < 1}` on both sides | holds |
| | `A = (0, 1) ⊂ ℝ`, not closed | `(−r, 0) ∪ (1, 1 + r)` against `(−r, 0] ∪ [1, 1 + r)` | differ, so the hypothesis "closed" is needed |
| | `A = ∅` | excluded by nonemptiness (`f_r = 1`) | as stated |
| §8.3 half-space Check | `A = {x_1 ≤ 0}` | `∫‖∇f_1‖ dγ = Φ(1) − 1/2 = 0.341345 = γ({x_1 < 1}) − γ(A)` | equality |
| §9.5 convexity of `S̄_{F,u}(C)`, `C` convex | `F = E`, `C` = disc | `{⟨x,u⟩ ≤ −0.270288}`, a half-plane | convex |
| | `F = E`, `γ(C) = 0` (segment) | `∅` | convex |
| | `C = E` | `E` | convex |
| | `C = {x_1 > 0} ∪ {0}×[0, ∞)`, `F = ℝe_2` | `v_C = 1, 1/2, 0`; set `{x_1 > 0} ∪ {0}×(−∞, 0]`; `Φ(−5) = 2.87·10^{−7} ≤ 1/2`, `Φ(100) ≤ 1`, midpoint `Φ(47.5) ≤ 1` | convex, neither open nor closed |
| | same `C`, through the sections | `½[0, ∞) + ½ℝ = ℝ ⊆ C_{1/2}` | inclusion holds |
| | closed disc, `F = ℝe_2` | `f(z) = Φ⁻¹(2Φ(√(1 − z²)) − 1)`: `f(0) = 0.475233`, `f(0.6) = 0.192409`, `f(0.3) = 0.412151 ≥ 0.333821` (the average) | concave, as required |
| | wrong model: rule reads `closure C` | gives `{x_1 ≥ 0}`, not `S̄(C)` | excluded by the Check |
| | non-convex control: two discs | a half-plane; no converse is claimed | consistent |
| §9.5 convexity of `S_{F,u}(C)`, strict rule | same `C` | `{x_1 > 0} ∪ {0}×(−∞, 0)`; `(0, 0)` is in `S̄` but not in `S` (`Φ(0) = v_C(0) = 1/2`) | convex |
| | raising step | `(0, −1)` with `s = −0.5`: `Φ(−0.5) = 0.308538 ≤ 1/2`. `(1, 3)` with `s′ = 4`: `Φ(4) = 0.999968 ≤ 1`. Midpoint level `Φ(1) = 0.841345 < Φ(1.75) = 0.959941 ≤ 1` | holds |
| §9.4, closed case (statement unchanged) | `closedBall(0, 1) ⊂ ℝ³` | `{x_3 ≤ −0.846102}` | unchanged |
| Mathlib contract, new names | pin | `thickening_subset_cthickening` at Thickening.lean:267, `self_subset_thickening` (needs `0 < δ`) at line 309 | confirmed |
| F03 locator | pin `2fd255d` | Slicing.lean:190 and 199 | confirmed |

## For the maintainer

- **Changed Lean statements.** `gaussian_minkowskiContent_ge` now uses `thickening`, and `convex_closedGaussianSymmetral` no longer has `hC`; it is now §9.5, not §9.4. No name was added, renamed or deleted. This package is not on main, and no roadmap on main or at an open head cites either name.
- **plan.json.** `design/plan.json` still lists `convex_closedGaussianSymmetral` under 9.4 with its closedness hypothesis, and §8.2 with the closed thickening. This job may edit only the `gaps` list of that file.
- **A possible further simplification (P3, not changed).** In `convex_closedGaussianSymmetral`, the hypotheses `u ∈ F` and `‖u‖ = 1` may not be needed for convexity. Ehrhard's inequality in `F` makes `Φ⁻¹ ∘ v_C` concave, and the set is the superlevel set of a concave function minus a linear one. They are kept because they make the set a Gaussian symmetral.
