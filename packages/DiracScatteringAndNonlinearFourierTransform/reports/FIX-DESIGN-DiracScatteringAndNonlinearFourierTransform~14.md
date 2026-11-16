# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 14)

This round answers the two findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~13`, F01 (P2) and F02 (P2). Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`:
  - From Tau Ceti: one new bullet, Rouché's theorem.
  - §8.6: the statement and one route sentence.
  - §8.7: statement (1), the route of (1) rewritten, the free-case Check extended, one Check added, *Needs:*.
  - §8.8: the statement and the route.
  - Layer 8 Dependencies.
  - §9.3: the statement, the locator note, the route, two Checks reworded, one Check added.
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`: targets 8.6, 8.7, 8.8 and 9.3. Their statements and tests were copied from the README; 8.7 gains a `tauceti:` prerequisite and 9.3 a hypothesis.
- `sources.toml`: unchanged. No new source was needed, and `needs-references.toml` was not written.

There is no `Suggested.lean` at the design stage. So nothing was elaborated and the `#check` comparison does not apply. The review's "For the human reviewers" section asks for no edit, and none was made for it.

## F01 (P2) — applied differently

Old → new. §8.7(1) keeps one box function, with a rewritten route:

- **Times with a zero in the box** use §8.6, which now allows any zero, uniformly.
- **Zero-free times**: a two-term form and Rouché's theorem give the exponential on the whole box when `e^{2C}η_C → 0`.

§8.8 allows any zero in the box. One Check added.

**Verification.** The finding is right about the route, not about the statement.

- The old route sentence did not support one function. It said "one function serves `E` and `Ẽ` because the functions of §8.5 and §8.6 come from diagonal arguments". But the zero-free step went through §7.2 and gave the exponential only on a smaller box, the source's "on some `Q(s, C₁/t)`" (poltoratski2024 line 966–970). That step does not carry over to smaller functions.
- The old route had a second gap, shared by both sources: "§8.5 with two values of the second argument shows that `(A, C)` has modulus bounded below" (poltoratski2024 line 931–934; mauth2022 line 1369–1375). This does not follow from §8.5.
  - Every `(A, C) = M(cos tz, sin tz)/√w` with `M ∈ SL₂(ℝ)` satisfies the relation of §8.5 exactly.
  - For example `E = 2cos tz − (i/2) sin tz` with `w = 1` has `D(t, λ, z) = sin(t(λ − z))`. Computed residual: `2·10⁻¹⁶`. Its zeros lie at height `½ log(5/3)/t = 0.2554/t`.
  - This example is now the last Check of §8.7.

**Why the one-function statement is true.** Here is the new route, checked step by step.

1. **The two-term form.** Base points `ω₁, ω₂ = ω₁ + π/(2t)` define `M`. §8.5 gives:
   - `det M = 1 + O(η_C)`;
   - `(A, C)(z) = M(cos tz, sin tz)/√w + O(‖M‖e^{C}η_C)` on `Q(s, C/t)`, where the `e^{C}` comes from `|sin tz| ≤ e^{C}`.

   So `E` is within `O(‖M‖e^{C}η)` of `T = a e^{−itz} + b e^{itz}`, with:
   - `|a| = (σ₁ + σ₂)/(2√w)` and `|b| = (σ₁ − σ₂)/(2√w)`;
   - `|a|² − |b|² = det M/w`.

   Checked on three random `M`: `|a|² − |b|²` is `0.489200 = det/w`, `1.192891`, `2.206577`. `|a|` is `0.844983` both ways. The fit residual is `≤ 10⁻¹⁵`.
2. **Rouché's theorem.**
   - The zeros of `T` lie at height `P/t`, with `e^{2P} = |a|/|b|`, spaced `π/t` apart.
   - About each zero, `T = −2i a e^{−itζ} sin(t(z − ζ))`, so `|T| ≥ 2 sin(½)|a|e^{−P}` on the circle of radius `1/(2t)`. Computed: `min |sin|` on `|τ| = ½` is `0.479426 = sin ½`. On the Check's example, the minimum of `|T|` on the circle is `0.928404`, equal to the bound.
   - If `P ≤ C − ½` and `C ≥ 3`, one circle fits in the box. Then `e^{2C}η → 0` makes the error smaller than `|T|`, and `TauCeti.rouche_exists_eq_zero_iff` gives a zero of `E` in the box.
   - So on a box with no zero, `P > C − ½`.
3. **No zero in the box.** From `P > C − ½`:
   - `|b|e^{C} ≤ |a|e^{1−C}` and `σ₂/σ₁ ≥ (1 − e^{1−2C})/(1 + e^{1−2C})`; this is `0.98661` at `C = 3`;
   - `|a|²w = 1 + O(η + e^{2−4C})`;
   - `E` is within `O(e^{C}η + e^{1−C}) = o(1)` of `a e^{−itz}` on the whole box.

   Then `γ(2C) sin(t(z − u) + 2iC) = i e^{−it(z−u)} + O(e^{−3C})`. The computed supremum over the box is `1.234·10⁻⁴`, `3.059·10⁻⁷` and `3.775·10⁻¹¹` at `C = 3, 5, 8`, equal to `e^{−9}`, `e^{−15}`, `e^{−24}`. So (1) holds with `t y(t) = 2C(t)`.
4. **A zero in the box** (`t ∈ T₀ ∩ T₁`). Every zero in `Q(s, C/t)` has `ty > 1`. §8.6 then gives the approximation with that zero. Its proof (poltoratski2024 line 868–906) uses only suprema over the box and `sinh(2ty) > sinh 2 = 3.627`, so nothing depends on which zero is chosen. §8.6 now states this.
5. **One function for `E` and `Ẽ`.** The function `C(t)` needs three properties:
   - `C ≤` the function of §8.6;
   - `e^{2C}η_C → 0`;
   - where every `T₀(s, D)` is bounded, `T₀(s, C)` is bounded too.

   Each property survives passing to a smaller function that still tends to infinity. So the minimum of the functions for `E` and `Ẽ` serves both, which is what §8.8 needs.

**Why the suggested repair was not taken as written.**

- It narrows (1) to a pair `(L, K)`, but the statement of the source (Corollary 3(1), line 1002–1007) is provable.
- Its zero-free step relies on the unjustified modulus claim above.
- Its proposed Check, "one function does not suffice in the route", is false for the repaired route. On the reviewer's own instance, `t ∉ T₀(s, C₁)`, step 3 gives the exponential on the whole `C₁`-box, and §8.6's `o(γ(tp))` bound is never used.

What I kept from the suggestion: the restriction of §8.8 is unchanged in form, and "any zero in the box" was added to §8.6, §8.7(1) and §8.8 so that §9.3 can choose its zero. §8.7(3), §9.5 and §9.6 are unchanged.

## F02 (P2) — applied

Old → new. §9.3 now says `ℓₙ(s)/2ⁿ → 0`, where `ℓₙ(s)` is the supremum of the lengths of intervals in `[2ⁿ, 2ⁿ⁺¹] ∩ T₁(s, K) ∩ T̃₁(s, K)` (`K` from §8.8) on which `E(t, ·)` has a zero in `Q(s, C/t)`. The route adds `1 < tp ≤ C`. One Check added.

**Verification.** The finding is right.

- The route uses §8.8, which covers only times in `T₁ ∩ T̃₁`, and §8.9, which needs `1 < ty < 2C`. The source's Lemma 9 (line 1350–1352) is stated for every zero. Its proof uses (9.2), which rests on Lemma 7 and on Lemma 8, and Lemma 8 asks `1 < ty` (line 1127).
- The witness: a zero at `s − 0.3i/t` has `ty = 0.3`. It lies in `Q(s, K/t)` once `K ≥ 0.3`, so `t ∉ T₁(s, K)`.

**How the text differs from the suggestion.**

- **The supremum of lengths replaces "the longest interval".** A longest interval need not exist when the set of times is not closed. The route now picks, for `s ∈ Zₙ`, an interval `Iₙ(s)` of length `> 2ⁿ/m`.
- **Two facts the route needs are stated.**
  - For large `t`, `K(t) ≥ 4C`. So the zero in `Q(s, C/t)` lies in `Q(s, K/t)` below height `−1/t`. Taken as §8.8's `z(t)`, it gives `1 < tp ≤ C`, and the boxes `Q(p, 3C/t)` of §8.9 lie inside `Q(s, K/t)` for `p ∈ ℝ ∩ Q(s, C/t)`.
  - For `C ≤ 1` and large `n` there is no such interval.
- **`N` is bounded more carefully.** "`N` bounded in terms of `C`" now says why: `t₁y₁` and `t₂y₂` lie in `(1, C]`, and §8.9 moves them by `O(ε)`.
- **The wording close to the source is gone.** The sentence the review found too close to the source (line 1350–1352) is rewritten.
- **Checks.** The compact-support Check and the fixed-distance Check now speak of `ℓₙ(s)`, and the `−0.3i/t` Check was added.

## Dependency check

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 240 roadmaps, 2257 edges, 0 problem(s)
```

There is no UPWARD and no CYCLE line. `roadmaps resolve` on the README finds no cross-roadmap citation and no Lean name that cannot be found. It does not check names outside TauCetiRoadmap. I checked the one new library name by hand at the pin: `TauCeti.rouche_exists_eq_zero_iff` is in `TauCeti/Analysis/Complex/Conformal/Rouche.lean` line 359, in namespace `TauCeti`, with variables `{f g : ℂ → ℂ} {c : ℂ} {R : ℝ}`. Its hypotheses are `0 < R`, `AnalyticOnNhd ℂ` on `closedBall c R` for both functions, and `‖f z − g z‖ < ‖f z‖` on `sphere c R`. Its conclusion is that `f` has a zero in `ball c R` if and only if `g` has one.

## Adversarial pass

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §8.6, any choice of zero | two zeros in the box, at heights `1.2/t` and `2.5/t`; free case | error bound uses `sinh(2ty) ≥ sinh 2 = 3.627` for either zero; free case `T₀ = ∅`, vacuous | uniform in the choice | statement and route sentence |
| §8.7 two-term form, `|a|² − |b|² = det M/w` | `M = I`; `diag(2, ½)` with `w = 1`; three random `M` | `a = 1, b = 0`; `1.25² − 0.75² = 1.000`; `0.489200 = 0.489200`, `1.192891`, `2.206577`; reconstruction `≤ 10⁻¹⁵` | holds | new route |
| §8.7 Rouché step | `diag(2, ½)`, circle of radius `1/(2t)` about `(π/2 − 0.2554i)/t` | `min |T| = 0.928404 = 2 sin(½)·1.25·e^{−0.25541}`; `min_{|τ|=½} |sin τ| = 0.479426` | bound sharp | new route |
| §8.7 zero-free conclusion | `C = 3, 5` | `e^{1−2C} = 0.006738`, `1.234·10⁻⁴`; `σ₂/σ₁ ≥ 0.98661`, `0.99975` | `M` near a rotation | new route |
| §8.7 sine form against the exponential, `ty = 2C` | `C = 3, 5, 8`, a 41×41 grid on the box | sup `1.234·10⁻⁴ = e^{−9}`, `3.059·10⁻⁷ = e^{−15}`, `3.775·10⁻¹¹ = e^{−24}` | `O(e^{−3C})` as stated | new route |
| §8.7(1), one function | free case; `f = c1_{[0,T]}`; reviewer's instance (zero at `s + (C₁+1)/t − ip/t`) | free: `M = I`, `α = −ie^{−itu}`, approximant `e^{−itz}`; compact: `a ≈ e^{iTs}E(T, s)`, `|a|²w = 1`, error `O(Ce^{C}/t)`; instance: `t ∉ T₀(s, C₁)`, exponential on the whole `C₁`-box | holds | route |
| §8.7(1), smaller functions | `C′ ≤ C`, `C′ → ∞` | `e^{2C′}η_{C′} ≤ e^{2C}η_C`; `T₀(s, C′) ⊆ T₀(s, C)` | properties inherited | statement clause |
| §8.7 last Check (eccentric form) | `t = 3.7` at `z = 0.3 + 0.2i`, `−0.1 − 0.4i`, `1.1` | `|E − T| ≤ 9·10⁻¹⁶`; `D − sin ≤ 2.5·10⁻¹⁶`; `E(zero) = 1.2·10⁻¹⁶`; distance to `κe^{−itz}` at the zero `e^{−0.2554} = 0.7746` | as stated | added |
| §8.7(3), unchanged route | constant `K`: `e^{2K}η_K(t) → 0` as `t → ∞` | the zero-free step gives `c₁, c₂ ∈ [1/(2√w), 2/√w]`, so `cos(t(x₂ − x₀)) ≥ ¼ − o(1)` | the reference "bounds it gives" is now supported | none |
| §8.8, any zero | zeros at heights `1.5/t` and `3/t` in `Q(s, C/t)`, `C = 4` | `p = 1.5/t` or `3/t`, both `≤ C/t`; determinant Check `2/√0.63 = 2.5198` unchanged | holds | statement and route |
| §9.3, restricted | zero at `s − 0.3i/t`; `C ≤ 1`; compact support; sweep | `ty = 0.3 < 1`, excluded; `ℓₙ = 0` for large `n` in the last three; `(2ⁿ/(3m))(C/2ⁿ) = C/(3m)`; `N = sinh 3 = 10.018` at `t₁y₁ = t₂y₂ = 1.5`, `N ≤ sinh 6 = 201.7` at `C = 3` | holds | statement, route, Check |
| §9.3 context | `K(t) ≥ 4C` for large `t`; `|p − s| ≤ C/t` | `Q(p, 3C/t) ⊆ Q(s, 4C/t) ⊆ Q(s, K/t)` | the approximations of §8.8 are available | route |

**Duplication and ownership.** Rouché's theorem is consumed from Tau Ceti and is not restated. No new carrier, definition or target was added, so there was no new ownership question. The other sibling roadmaps were not consulted again.

## For the maintainer

- **No name changed.** No declaration name of this roadmap is cited by other roadmaps. Target ids, section numbers and plan.json names are unchanged, and two tests were added (`eccentricTwoTermForm`, `zeroAboveHeightExcluded`).
- **Source issues.** The review's source-issue notes on poltoratski2024 Corollary 3 and mauth2022 Corollary 6 should be read with F01 in mind. The one-function statement is true. What is missing in the sources is the bound on the two-term form, and the full-box exponential on boxes with no zero, which Rouché's theorem gives when the error of §8.5 is `o(e^{−2C})`. The note on Lemma 9 stands.
- **Suspicious text.** The review contains none.
