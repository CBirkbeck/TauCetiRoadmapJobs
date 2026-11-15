# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 15)

This round answers the three findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~14`, F01, F02 and F03, all P3 and all on route sentences. Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`:
  - §8.7: one sentence of the route (the two-term form), the words "the function of §8.6" in the route of (1), and the free-case Check.
  - §8.8: the route rewritten, *Needs:* extended, two Checks added.
  - §9.3: one phrase of the statement ("the function" → "a function as in"), the route extended, *Needs:* extended.
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`: targets 8.7, 8.8 and 9.3. Their statements and tests were copied from the README. 8.8 gains prerequisites `target:8.5` and `target:8.6` and two tests. 9.3 gains prerequisites `target:3.1` and `target:3.2`, and its hypothesis reads "K a function C(t) as in 8.8 at s".
- `sources.toml`: unchanged. No new source was needed, and `needs-references.toml` was not written.

No statement of a target changed in content: no hypothesis, conclusion, id or supplier. The §9.3 statement now quantifies over every function with the property of §8.8 instead of naming "the" function; its route already used only that property.

There is no `Suggested.lean` at the design stage. So nothing was elaborated and the `#check` comparison does not apply. The review's "For the human reviewers" section asks for no edit, and none was made for it.

## F01 (P3) — applied differently

Old → new. §8.8 route: "inserting the two approximants into (2.2) on `ℝ ∩ Q(s, D/t)` …" becomes: two-term forms `T`, `T̃` on the common box, with `e^{3C}(η_C + η̃_C) → 0`. The oscillating part of (2.2) fixes `conj(b̃)/ã` to within `o(e^{−2C})`, and the constant part gives the cosine relation. *Needs:* gains §8.5 and §8.6. Two Checks added.

**Verification.** The finding is right.

- `D` is undefined in §8.8.
- The §8.7(1) approximants are accurate only to `o(1)` on the box. Moving a height `p̃` to `p` changes an approximant by about `e^{C − 2 min(p, p̃)}` at the bottom of the box. For `E` zero-free and `Ẽ` at the height `√C`, this is `e^{C−2√C}`: `2981`, `3.27·10⁶` and `2.65·10¹⁰` at `C = 16, 25, 36`.

The statement is true. The route now runs as follows:

- **Errors.** The forms of the routes of §8.6 and §8.7 are accurate to `O(e^Cη_C)` on the box. For §8.6 this comes from `2|β|²w = sinh(2tp) + O(η)` with `tp > 1`. The coefficient `γ(tp)e^{tp}` is at most `2/√(1 − e^{−4}) = 2.01857`.
- **Oscillating part.** On `ℝ`, the mean of `Im(T conj T̃)e^{2itx}` over a period is `(a conj b̃ − conj(b)ã)/(2i)`. The exact `E`, `Ẽ` give `0`.
- **Common height and `α`.** The ratio `conj(b)/a` equals `conj(α)²e^{−2tp}` for the sin-form. For every `ũ`, the cos-form with the same `α` and the same height has the same ratio. So choosing `ũ` by the argument of `ã/α` gives the common height and the common `α`. The error is `O(η̃ + e^C(η + η̃)) = o(e^{−2C})`.

Why the suggested text was not used verbatim:

1. **`|ã|²w̃ = 1 + o(1)` is false when `t ∈ T̃₀`.** There `|ã|²w̃(1 − e^{−4tp̃}) = 1 + o(1)` with `tp̃ ∈ (1, C]`. At `tp̃ = 1` the factor is `1/(1 − e^{−4}) = 1.018657`. The repair uses `|ã|² − |b̃|² = (1 + O(η̃_C))/w̃` instead.
2. **The condition `e^{2C}(η_C + η̃_C) → 0` is too weak to make the cosine relation exact.** On `ℝ`, the README bounds the error by `O(e^Cη)`, so the constant part of (2.2) has error `ε = O(e^C(η + η̃))`. At a point with `w w̃ = 1`, the cosine is at its maximum, and the angle then moves by `√(2ε)`, not `O(ε)`. Witness: take `η + η̃ = e^{−2.5C}`. Then `e^{2C}(η + η̃) = e^{−0.5C} → 0`, but `e^C·(e^C(η + η̃))^{1/2} = e^{0.25C}` (`7.39`, `54.6` and `2981` at `C = 8, 16, 32`). The repair therefore takes `C(t)` with `e^{3C}(η_C + η̃_C) → 0`. This costs nothing, because every smaller function tending to infinity keeps §8.7(1).

**The same pattern elsewhere.**

- "The function of §8.6" in the route of §8.7(1) asserts uniqueness where §8.6 asserts only existence. It now reads "a function as in §8.6". §8.6 holds for every smaller function above `D`: the boxes shrink, `T₀` shrinks, and the suprema decrease.
- No other §8.x route combines two `o(1)` approximants through (2.2).
- §9.5 uses §8.7(3) on constant boxes with fixed `D`, where `o(1)` errors suffice. It needs no change.

The two new Checks are the review's witness (`e⁸ ≈ 2981` at `C = 16`) and the `√(2ε)` loss (`0.0014142` at `ε = 10⁻⁶`).

## F02 (P3) — applied

Old → new. §9.3: "the function `C(t)` of §8.8" → "a function `C(t)` as in §8.8". The route adds sets `G_N` with uniform thresholds (outer measure, Borel–Cantelli for each `N`), and shows that one `Φ` serves `t₁`, `t₂`: the sign of `Re` of the mean of `Ẽ/E` is continuous in `t`, and `Φ = 0` when `w w̃ = 1`. *Needs:* gains §3.1, §3.2.

**Verification.** All three gaps are real, and the statement stands.

- **(a) The sign of `Φ`.** For the forms `E ∝ sin τ/√w` and `Ẽ ∝ cos(τ − Φ)/√w̃`, the quotient is `√(w/w̃)(cos Φ cot τ + sin Φ)`. The mean of `cot(a + ip)` over a period is exactly `−i` for `p > 0`. Take `w = 0.7`, `w̃ = 0.9`, height `1.5` and `Φ = ±Φ₀`, where `Φ₀ = arccos √0.63 = 0.6538871`. The mean is then `±0.5364492 − 0.7i`, both computed by quadrature and predicted by `−iw ± √(w/w̃) sin Φ₀`.
  - The mean of the true quotient over `x ∈ [s, s + π/t]` is continuous in `t`: `E`, `Ẽ` are jointly continuous (§3.1) and `E` has no real zeros (§3.2).
  - If `w w̃ = 1`, then `Φ₀ = 0`, and §9.2's `Φ ∈ (−π/2, π/2)` with `cos Φ = 1` is `0`. The review's text does not cover this case; the repair adds it.
- **(b) Uniformity in `s`.** The thresholds `ε₀` and `D` of §8.9 depend on `w(s)` and `w̃(s)`. So does the margin of the sign test. `G_N` therefore uses a threshold `ε₁(s)` that depends only on `C`, `m`, `w(s)` and `w̃(s)`, and it also asks `K(t) ≥ 4C` for `t ≥ 2^N`. The `G_N` cover almost every `s`, because at each such `s` the errors tend to `0`.
  - No measurability of `G_N`, `Zₙ` or `Sₙ` is needed. At the pinned Mathlib, `MeasureTheory.measure_limsup_atTop_eq_zero` (`Mathlib/MeasureTheory/OuterMeasure/BorelCantelli.lean` line 62) is stated for `[OuterMeasureClass F α]` with the single hypothesis `∑' i, μ (s i) ≠ ∞`. The pigeonhole step that gives `Sₙ` uses only subadditivity.
  - Because `K` may depend on `s`, the old contradiction phrasing ("if the set … had positive measure") was replaced by Borel–Cantelli for each `N`, which gives `lim sup ℓₙ(s)/2ⁿ ≤ 1/m` almost everywhere.
- **(c) "The function".** §8.8 asserts existence. The route of §9.3 uses only `K → ∞` and the approximations of §8.8, so it holds for every such `K`.

**The same pattern elsewhere.** "The function of §8.6" in §8.7 was repaired (see F01). No other target names "the" function of an existence statement.

## F03 (P3) — applied

Old → new. §8.7 route: "On such a box `(A(t, x), C(t, x))` … rotates on `ℝ ∩ Q(s, C/t)`" becomes "On such a box with `C ≥ 4π`, … makes more than a full turn on `ℝ ∩ Q(s, C/t)`, of length `2C/t ≥ 8π/t`, while one turn takes `2π/t`". The free-case Check now states its points at `s = 0` with `C ≥ 4π`.

**Verification.** Correct. `Q(s, C) = {|Re z − s| ≤ C, |Im z| ≤ C}` (Conventions), so `ℝ ∩ Q(s, 3/t)` has length `6/t`. That is less than the turn `2π/t = 6.2832/t`. At `C = 4π` the length is `25.13/t`, which is more than `(2π + π/2)/t = 7.854/t`.

- **Other parts of the route.** The Rouché part needs only `2C − 1 ≥ π`, that is `C ≥ 2.07`, so "let `C ≥ 3`" stays there. The modulus bound holds for `C ≥ 4π`: the relative error on `ℝ` is at most `O(√w e^Cη_C) + e^{1−C}`, and `e^{1−4π} = 9.48·10⁻⁶`.
- **Uses.** The only user of `x₀` and `x₁` is the route of (3), with `K ≥ 4π + 24π/ε`. The §8.8 route uses the two-term form, not `x₀` and `x₁`.
- **The free-case Check.** It took `x₀ = 0` and `x₁ = π/(2t)` without saying where `s` is. At `s = 0` with `C ≥ 4π`, both points lie in the box, since `π/(2t) ≤ 4π/t`. At `s = 10π/t` and `C = 4π`, `0` is not in the box. The Check now says `s = 0`.

## Checks run

**Dependency check** (the command of the brief):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2256 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**Citations** (`roadmaps resolve` on the README, main `ea83ad8` and 454 open heads): no cross-roadmap citation and no Lean name found nowhere. No cross-roadmap citation was added or changed. The suppliers are still AnalyticNumberTheoryPartI §0.23, AutomorphicSpectralTheory §0.5 and OperatorTheory/UnboundedOperators §4.8. `plan.json` keeps `gaps: []`.

**README and plan agree.** A script normalises whitespace and checks that every target statement and every test statement of `design/plan.json` occurs in the README. All 55 targets in 9 layers pass, with 0 problems.

**House style.** `grep` over the README finds no LaTeX delimiter, no machine path and no "deferred", "optional", "removed", "so far" or round label.

**Ownership.** No new object or construction was introduced. The repairs are proof routes inside §8.7, §8.8 and §9.3, which this roadmap owns, as the review's duplication audit records. Ownership against open pull requests was therefore not re-checked this round.

## Adversarial pass (changed and added text)

Values computed this round in plain Python.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.7, choice of `x₀`, `x₁` | `C = 3`; `C = 4π` | `2C = 6 < 2π = 6.2832`; `2C = 25.133 > 2π + π/2 = 7.854` | fails at `C = 3`, holds at `C ≥ 4π` | F03 |
| §8.7, modulus on the box with `C ≥ 4π` | relative error `e^{1−C}` | `e^{1−4π} = 9.48·10⁻⁶` | `[1/(2√w), 2/√w]` holds | none |
| §8.7, free-case Check | `s = 0`; `s = 10π/t`, `C = 4π` | `π/(2t) ≤ 4π/t`; `|0 − s| = 10π/t > 4π/t` | needs `s = 0` | Check reworded |
| §8.7, "a function as in §8.6" | `C′ ≤ C`, `C′ > D` | `Q(s, C′/t) ⊆ Q(s, C/t)`, `T₀(s, C′) ⊆ T₀(s, C)`, sup over the smaller box ≤ sup over the larger | §8.6 holds for `C′` | wording |
| §8.8, forms as coefficients | `α = e^{0.7i}`, `p = 1.3`, `tu = 0.4`, `tũ = 1.1`, `w = 0.7`, `w̃ = 0.9`, `tz = 0.37 + 0.2i` | sin-form and cos-form against their coefficients: `3.1·10⁻¹⁶`, `6.8·10⁻¹⁶` | holds | none |
| §8.8, ratio `conj(b)/a` | sin-form; cos-form at `tũ = 1.1` and `2.9` | all `0.0126241 − 0.0731929i = conj(α)²e^{−2.6}` | same ratio for every `ũ` | used in route |
| §8.8, `|a|² − |b|²` | same | `1.428571 = 1/0.7`, `1.111111 = 1/0.9` | holds | none |
| §8.8, constant part | same | `Im(a conj ã + b conj b̃) = 0.9636106 = cos(0.7)/√0.63` | holds | used in route |
| §8.8, oscillating part | a random two-term pair | quadrature mean `0.4609965 + 0.1725370i` = `(a conj b̃ − conj(b)ã)/(2i)` | holds | used in route |
| §8.8, naive height move | `E` zero-free, `Ẽ` at height `√C` | `e^{C−2√C}`: `2981`, `3.27·10⁶`, `2.65·10¹⁰` at `C = 16, 25, 36` | old route incomplete; excluded by (2.2) | F01, Check added |
| §8.8, reviewer's `|ã|²w̃ = 1 + o(1)` | `t ∈ T̃₀`, `tp̃ = 1` | `1/(1 − e^{−4}) = 1.018657` | false there | not used |
| §8.8, exact cosine at `w w̃ = 1` | `ε = 10⁻⁶`; `η + η̃ = e^{−2.5C}` | angle `0.0014142 = √(2ε)`; `e^{2C}(η+η̃) = 0.0183, 3.4·10⁻⁴, 1.1·10⁻⁷` but `e^C(e^C(η+η̃))^{1/2} = 7.39, 54.6, 2981` at `C = 8, 16, 32` | `e^{2C}` too weak | `e^{3C}`; Check added |
| §8.8, §8.6 error on the box | `tp = 1` | `γ(1)e¹ ≤ 2.01857`, `sinh 2 = 3.62686` | `O(e^Cη_C)` | none |
| §8.8, zero-free replacement | `C = 10` | `|b|e^C/|a| < e^{1−C} = 1.23·10⁻⁴`; `e^{2−4C}·e^C = e^{2−3C}` | `o(1)` on the box | none |
| §9.3, sign of `Φ` | `w = 0.7`, `w̃ = 0.9`, height `1.5`, `Φ = ±0.6538871` | mean `±0.5364492 − 0.7i` (quadrature = prediction) | determines the sign | F02(a) |
| §9.3, `w w̃ = 1` | `cos Φ = 1`, `Φ ∈ (−π/2, π/2)` | `Φ = 0` | no ambiguity | case added |
| §9.3, Borel–Cantelli | pinned declaration | `[OuterMeasureClass F α]`, hypothesis `∑' μ (s i) ≠ ∞` only | no measurability needed | F02(b) |
| §9.3, sweep | `t₂ − t₁ = 2ⁿ/(3m)`, `|J(s)| = C/2ⁿ` | `C/(3m)`, error `O(Dε₁(s))` | holds on `G_N` | wording |

## For the maintainer

- No Lean name, target id, section number or supplier changed, so no other roadmap is affected.
- §8.8 now lists §8.5 and §8.6 under *Needs:*, and §9.3 lists §3.1 and §3.2. These are already earlier layers, so the dependency graph inside the roadmap is unchanged.
- Untrusted text: the review contains no instruction outside its findings, and nothing in it was treated as one.
