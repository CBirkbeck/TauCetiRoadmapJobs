# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 17)

This round answers the two findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~16`, F01 (P3) on the route of §5.4 and F02 (P3) on a locator of §7.2. Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md`:
  - §5.4: the route's control of the cross term is replaced, its *Needs:* line gains §4.4, and one Check is added.
  - §7.2: the mauth2022 locator now records that source's weaker constant, and the route spells out the Apollonius estimate that gives the constant `3`.
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json`:
  - target 5.4: the statement is copied from the README, `target:4.4` is added to its prerequisites, and test `crossTermLogarithmicBound` is added;
  - target 7.2: the statement is copied from the README, and the locator `where` field is changed.
- `sources.toml`: unchanged. The mauth2022 entry already records "§3.4 Lemmas 29, 32" and lists 7.2 under `cited_for`. No source was fetched, and `needs-references.toml` was not written.

No hypothesis, conclusion, target id, Lean name or supplier changed. There is no `Suggested.lean` at the design stage, so nothing was elaborated and the `#check` comparison does not apply. The review's "For the human reviewers" section asks for no edit, and none was made for it.

## REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~16/F01 (P3) — applied

Old → new. The route said the cross term `∫|log|1 + uρ₂ conj ρ₁||` tends to `0` "because `‖ρ₂‖²_{L²} ≤ π‖q‖²_{L²(T,∞)}` … and `‖ρ₁‖²_{L²} ≤ π‖q‖²`". It now gives the bound `|log|1 + w|| ≤ −log(1 − |ρ₁||ρ₂|) ≤ (L(|ρ₁|)L(|ρ₂|))^{1/2}`, applies Cauchy–Schwarz in `x`, and concludes with `≤ π‖q‖_{L²(0,T)}‖q‖_{L²(T,∞)}`. *Needs:* gains §4.4. A Check is added.

**Verification.** The finding is right: the old reason does not suffice.

- On `ℝ`, `|u| = 1`, since `a₁(x) ≠ 0` (`|a₁|² − |b₁|² = 1`). So `w = uρ₂ conj ρ₁` has `|w| = |ρ₁||ρ₂| < 1` almost everywhere: `|ρ₁| < 1` on `ℝ`, and `|ρ₂| < 1` almost everywhere by the last clause of §5.3 applied to the tail.
- But `|log|1 + w||` is not bounded by a multiple of `|w|` as `|w| → 1`. At `w = −0.998001` it is `6.2151`. So a set of small measure where `|ρ₁|` and `|ρ₂|` are near `1` adds little to the two `L²` norms and arbitrarily much to the integral.
- The statement of §5.4 is true. The repaired route uses only inputs it already had.

**Proof of the new bound.** For `0 ≤ a, b < 1`:

1. `|log|1 + w|| ≤ −log(1 − |w|)`. Indeed `1 − |w| ≤ |1 + w| ≤ 1 + |w| ≤ 1/(1 − |w|)`.
2. `−log(1 − ab) = Σₙ (ab)ⁿ/n = Σₙ (aⁿ/√n)(bⁿ/√n) ≤ (Σ a²ⁿ/n)^{1/2}(Σ b²ⁿ/n)^{1/2} = (L(a)L(b))^{1/2}`, with `L(r) = −log(1 − r²)`.
3. Cauchy–Schwarz in `x` bounds the integral by `(∫L(|ρ₁|))^{1/2}(∫L(|ρ₂|))^{1/2}`.
4. `∫L(|ρ₁|) = π‖q‖²_{L²(0,T)}`, by the last clause of §4.4 at `t = T`.
5. `∫L(|ρ₂|) = 2∫log|a₂| ≤ π‖q_{>T}‖² = π‖q‖²_{L²(T,∞)}`, by §5.3 (its identity and its Plancherel inequality) applied to `q_{>T}`.
6. So the integral is at most `π‖q‖_{L²(0,T)}‖q‖_{L²(T,∞)} → 0` as `T → ∞`.

The review's repair text was used. Two additions:

- the clause "(§4.4 for the first term)", because the lower bound `π‖q‖²_{L²(0,T)}` already came from §4.4, which the old *Needs:* line omitted;
- the explicit `|u| = 1` on `ℝ`.

**The same pattern elsewhere.** I searched the README for every bound of `log|1 + …|` and every use of `‖ρ‖_{L²}`:

- **§5.5** (`|q⌃* − ρ₁| ≤ |ρ₂|(1 + |ρ₁|) ≤ 2|ρ₂|`, then `‖ρ₂‖²_{L²} ≤ π‖q‖²_{L²(T,∞)}`): the `L²` bound is enough there. The pointwise bound is linear in `|ρ₂|`. I rederived it: `q⌃* − ρ₁ = uρ₂(1 − |ρ₁|²)/(1 + uρ₂ conj ρ₁)` and `|1 + uρ₂ conj ρ₁| ≥ 1 − |ρ₁|`.
- **§5.3** (`log(1 + δ) ≤ 2 log|a₂|`): no cross term.
- **§6.8**: uses only `log|a| ≥ 0` and `dΠ ≤ dx`.

No other occurrence.

## REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~16/F02 (P3) — applied

Old → new. The locator "mauth2022 Lemma 29 line 1624" became "mauth2022 Lemma 29 line 1624–1627 with radius `4|y − x|/ε` for `0 < ε < ε₀` and a small fixed `ε₀`". The route gains: `|y − ζₙ| > √(1 + ε)|x − ζₙ|`, so `|x − ζₙ| < (√(1 + ε) + 1)|y − x|/ε < 3|y − x|/ε` for `0 < ε < 1`. `plan.json` mirrors both changes.

**Verification.**

- mauth2022 line 1624–1627 states Lemma 29 for `0 < ε < ε₀` with a small fixed `ε₀` and the ball of radius `4|y − x|/ε`. That is weaker than the README's statement in both the range of `ε` and the radius.
- poltoratski2024 line 332–334 has `1 > ε > 0` and radius `3|y − x|/ε`, exactly as the README states. Its proof (line 347–359) is the Apollonius argument.

**The constant `3` is right on the stated range.**

- Some summand `2 Im ζₙ/|· − ζₙ|²` satisfies the hypothesis' inequality. Otherwise `c + Σ ≤ (1 + ε)(c + Σ)` at `y`, since `c ≥ 0`.
- So `|y − ζₙ|/|x − ζₙ| > √(1 + ε)`, and `|y − x| ≥ |y − ζₙ| − |x − ζₙ| > (√(1 + ε) − 1)|x − ζₙ|`.
- Hence `|x − ζₙ| < (√(1 + ε) + 1)|y − x|/ε`. The factor `√(1 + ε) + 1` is `2.0050`, `2.2247` and `2.4139` at `ε = 0.01, 0.5, 0.999`, all below `3`.
- `x ≠ y` is forced, because the inequality is strict.

**The same pattern elsewhere.** mauth2022 Lemma 29 is cited only in §7.2 (README and `plan.json`). The radius `3|y − x|/ε` is used in §7.2 and its Checks only, and the Checks are unchanged:

- `b_i`: radius `3/ε` contains `i`;
- `b_{10i}`, `ε = ½`: radius `60` contains `10i`.

## Checks run

**Dependency check** (the command of the brief):

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 235 roadmaps, 2230 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

**README and plan agree.** A script normalises whitespace and checks every statement of `design/plan.json` against the README.

- All 55 targets and every test statement, including the new test, occur in the README: 0 missing.
- No `target:` prerequisite points forward; the new `target:4.4` of 5.4 points backward.
- `plan.json` round-trips through the JSON serialiser (indent 1, UTF-8, final newline).
- The README still has 55 `**Checks.**` blocks.
- Layer 5's Dependencies already name Layer 4, so they need no change.

**House style.** The added text has:

- no LaTeX delimiter, no machine path and no process word;
- no backticked Lean name of this roadmap.

`L(r)` is defined in the route sentence of §5.4 before the new Check uses it.

**Citations and ownership.** No cross-roadmap citation, supplier or library declaration was added or changed. The suppliers are still AnalyticNumberTheoryPartI §0.23, AutomorphicSpectralTheory §0.5 and OperatorTheory/UnboundedOperators §4.8, and `gaps` stays `[]`. The repairs add no object, only a proof step in §5.4 and a locator qualification in §7.2. Ownership against open pull requests was not re-checked this round.

## Adversarial pass (changed and added text)

Values were computed in plain Python (scratch only).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `|log|1 + w|| ≤ −log(1 − |w|)`, `|w| < 1` | `w = −0.998001`; `w = +0.998001`; 200 000 random `(a, b, arg u)` | `6.2151 = 6.2151` (equality at negative real `w`); `log 1.998 = 0.6922 ≤ 6.2151`; 0 violations | holds | route |
| `−log(1 − ab) ≤ (L(a)L(b))^{1/2}` | `(0.999, 0.999)`, `(0.999, 0.3)`, `(0.1, 0.9)`, `(0.5, 0.5)`, `(0, 0.7)` | `6.2151 = 6.2151`; `0.3562 ≤ 0.7656`; `0.0943 ≤ 0.1292`; `0.2877 = 0.2877`; `0 = 0` | holds; equality iff `a = b` | route, Check |
| Old reason (`L²` norms) | mass `δ` where `|ρ₁| = |ρ₂| = 0.999`, product `−0.998001` | each `‖ρⱼ‖²` grows by `≤ δ`, the integral by `6.2151δ`; as the moduli tend to `1` the ratio is unbounded | insufficient | replaced |
| `∫L(|ρ₁|) = π‖q‖²_{L²(0,T)}` | §4.4 at `t = T`; `q = 1_{[0,1]}`, `T = 1` | `2∫log|a(1, x)| dx = 2 · 1.5707 ≈ π` (§4.4 Check) | holds | *Needs:* §4.4 |
| `∫L(|ρ₂|) ≤ π‖q‖²_{L²(T,∞)}` | tail of compact support `q = q_{T₀}`, `T ≥ T₀` | `ρ₂ = 0`, both sides `0` | holds | none |
| Final bound `π‖q‖_{L²(0,T)}‖q‖_{L²(T,∞)}` | `q(s) = (1 + s)^{−1}` | `‖q‖_{L²(0,T)} ≤ 1`, `‖q‖_{L²(T,∞)} = (1 + T)^{−1/2}`, bound `≤ π/√(1 + T) → 0` | tends to `0` | none |
| `|u| = 1` on `ℝ` | `q = 1_{[0,1]}`, `x = 0` | `a₁(0) = cosh 1 = 1.5431 ≠ 0`, `u(0) = 1` | holds | stated |
| Cross-term Check against §5.3's Check | `ρ₁ = ρ₂ = ½`, `u = 1` | `|log|1 + ¼|| = 0.2231 ≤ −log(1 − ¼) = 0.2877 = L(½)` | consistent | none |
| §7.2 constant | `ε = 0.01, 0.5, 0.999` | `√(1 + ε) + 1 = 2.0050, 2.2247, 2.4139 < 3` | holds on `0 < ε < 1` | route |
| §7.2 at `ε → 1` | `ε = 1` (excluded) | `√2 + 1 = 2.4142 < 3`, so the bound survives at the endpoint too | range not narrowed | none |
| mauth2022 Lemma 29 | line 1624–1627 | `0 < ε < ε₀`, radius `4|y − x|/ε` | weaker; secondary locator | locator qualified |
| §7.2 Check `b_{10i}`, `ε = ½` | `x = 0`, `y = 10` | ratio `2 > 1.5`; zero `10i` at distance `10 < 60` | holds | none |

## For the maintainer

- No Lean name, target id, section number or supplier changed, so no other roadmap is affected.
- §5.4's *Needs:* line and `plan.json` prerequisites gain §4.4 (earlier in the same roadmap). Layer 5's Dependencies already list Layer 4.
- Untrusted text: the review contains no instruction outside its findings, and nothing in it was treated as one.
