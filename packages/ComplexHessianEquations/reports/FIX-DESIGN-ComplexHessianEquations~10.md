# Repair report: ComplexHessianEquations design, round 10

The review raised one finding, F01 (P3). The review's table row for §8.3 calls the same defect "R01"; it is settled here as F01. The section "For the human reviewers" (licence of `demailly2012`, `lewis1996`, `spruck2005`; scope) lists no finding, and nothing was changed because of it. The "Source issues" list concerns gpt2023 itself and the README already handles each point (strict sublevel sets and strict smallness in §8.3, `inf φ_t < −s` in §8.1, `n = 1` in §8.6, `Γ_{max(k,p)}` and `ℓ < k` in §2.5, `γ` in §8.7). It asks for no edit.

## F01 (P3) — applied

**Verified.** §2.4 requires only `f ∈ C¹` of an admissible pair, and Layer 8 assumes no more. The reviewer's witness holds:

- `f = σ_1 + δ|λ_1 − λ_2|^{3/2}σ_1^{−1/2}` on `Γ_2` is symmetric and 1-homogeneous.
- `f` is `C¹`. With `u = |λ_1 − λ_2|/σ_1 ∈ [0, 1)`, `∂_j f ≥ 1 − δ(3u^{1/2}/2 + u^{3/2}/2) > 1 − 2δ`.
- `f(1 + a, 1) = 2 + a + δ|a|^{3/2}(2 + a)^{−1/2}` has an unbounded second derivative at `a = 0`.

So the old wording "smooth normalized `F_t` … that the equation defines" was false for a general pair.

**Change** (`packages/ComplexHessianEquations/design/README.md`, §8.3, fourth Check). Old: "take `φ_t = −ε·ρ` … it solves the equation for the smooth normalized `F_t` and the constant `c_t` that the equation defines". New: "for the Monge–Ampère pair take `φ_t = −ε·ρ` … (possible since `ω_t ≥ tω_X`)", with:

- `c_t^n = V_t/V` (§3.4);
- `e^{nF_t} = c_t^{−n}·ω_{t,φ_t}^n/ω_X^n`, which is smooth and positive;
- normalized by `∫ω_{t,φ_t}^n = V_t` (§3.2);
- one sentence citing the `C¹` witness above to say why the pair matters.

The plan test `degenerating_right_continuity` of target 8.3 now names the Monge–Ampère pair, the formula for `e^{nF_t}`, `c_t^n = V_t/V`, smoothness and normalization.

**Pattern search.** I searched every place where the README builds a solution from a chosen `φ` and reads off `F` ("solves", "the equation defines", "F = log", "smooth normalized"):

- §6.2 Check (torus, `e^F = q`), §6.5 and §6.6 Checks, §8.5 fourth Check (`F = (log q)/3`): all use Monge–Ampère or Laplace (`n = 1`) equations, where `F` is explicitly smooth.
- §8.1 third and §8.3 first Checks: `F_t = 0`.
- §8.3 third and §8.6 second Checks: `n = 1`, where every pair is `f(λ) = f(1)·λ`.
- §8.7 second Check says outright that the inequality it tests is pointwise and needs no smoothness.

No other instance.

## Checks run

Dependency check (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

The output has no UPWARD, CYCLE or `moved:` line. `design/plan.json` parses, with one gap, `gap:weak-harnack-supersolutions`, unchanged. There are no gate failures to repair.

`Suggested.lean`: none exists at the design stage. No Lean statement changed, so there was nothing to elaborate and no `#check` comparison to run. No supplier, citation, source or manifest entry changed; `packages/ComplexHessianEquations/sources.toml` is untouched. Ownership: the repair introduces no new object, so no ownership check against open pull requests was needed.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| `ε` small gives `ω_{t,φ_t} > 0` | `χ ≥ 0`, `t ∈ (0, 1]`; `i∂∂̄ρ ≤ Cω_X` | `ω_t = χ + tω_X ≥ tω_X`; `ω_t − ε i∂∂̄ρ ≥ (t − εC)ω_X > 0` for `ε < t/C` | Holds; clause added |
| `e^{nF_t} = c_t^{−n}ω_{t,φ_t}^n/ω_X^n` | §3.2 form identity at `k = n` | coefficient `n!0!/n! = 1`, so `σ_n(λ[α])ω_X^n = α^n`; `f^n = σ_n = c_t^n e^{nF_t}` | Holds |
| normalization iff `c_t^n = V_t/V` | §3.2 Kähler invariance at `k = n`, `χ = ω_t`; §3.4 Check `χ = ω_X` | `∫e^{nF_t}ω_X^n = c_t^{−n}V_t = V`; `c_t^n = (1 + t)^n = V_t/V` | Holds; agrees with the §3.4 API `c_t^n/V_t = 1/V` |
| `F_t` smooth for Monge–Ampère | `ρ` smooth, `ω_{t,φ_t} > 0` | `ω_{t,φ_t}^n/ω_X^n` smooth and positive, so its `log` is smooth | Holds |
| `sup φ_t = 0` | `ρ = 0` somewhere, `ρ ≥ 0` | `sup(−ερ) = −ε·inf ρ = 0` | Holds |
| jump of the closed sublevel function | `s = ε`, `s > ε` | `Ω_ε = {ρ = 1} ⊇ U`, weighted mass `≥ (c_t^n/V_t)·min e^{nF_t}·vol(U) > 0`; `Ω_s = {ρ ≥ s/ε} = ∅` for `s > ε` | Holds: not right-continuous at `ε` |
| strict sublevel function at `ε` | `s = ε`, `s > ε` | `Ω_ε^∘ = {ρ > 1} = ∅`; `0` at and after `ε` | Holds: right-continuous |
| witness pair is admissible | `Γ_2`, `0 < δ < 1/2` | degree `3/2 − 1/2 = 1`; `u = |λ_1 − λ_2|/σ_1 < 1` on `Γ_2`; `∂_1 f = 1 + δ(±(3/2)u^{1/2} − (1/2)u^{3/2}) > 1 − 2δ`; `∏∂_jf > (1 − 2δ)²` | Holds |
| witness not `C²` | `λ = (1 + a, 1)` | `σ_1 = 2 + a`, `|λ_1 − λ_2| = |a|`; `(d/da)²|a|^{3/2} = (3/4)|a|^{−1/2} → ∞` | Holds |
| non-smooth `F_t` on a manifold | torus `ℂ²/ℤ⁴`, `χ = 0`, `t = 1`, `ρ = ρ(x_1)` | relative eigenvalues `(1 − ερ''/2, 1)` (as in §6.2's Check); `ρ''` changes sign between `ρ = 1` and `ρ = 0`, and at a simple zero `|ρ''|^{3/2}` is not `C²` | Holds: the `C¹` pair gives a non-smooth `F_t`, so restricting the Check to Monge–Ampère is needed |

## For the maintainer

The two changed lines are the fourth Check of §8.3 and the plan test `degenerating_right_continuity`. No section, layer, target id or name changed, so no other roadmap's citations are affected. The review's text contained nothing suspicious.
