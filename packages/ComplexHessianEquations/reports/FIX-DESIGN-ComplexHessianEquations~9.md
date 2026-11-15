# FIX-DESIGN-ComplexHessianEquations~9

Repair of the two findings of `REV-DESIGN-ComplexHessianEquations~8` (both P3). I checked both against the sources and both hold. Files changed: `packages/ComplexHessianEquations/design/README.md` and `packages/ComplexHessianEquations/design/plan.json`. `packages/ComplexHessianEquations/sources.toml` is unchanged: the only new locator, pss2012 (2.6), lies in §2.2, which the manifest already records for 6.6.

## F01 (P3) — applied

Evidence: §8.2 needs `φ(s_0)^{δ_0} < 1/(2B_0)` (gpt2023 Lemma 2, line 412–426; s_0 fixed at line 416). For `1_{[0,1)}` at `B_0 = 1` that forces `φ(s_0) = 0`. At `δ_0 = 0`, `B_0 = 1` it reads `1 < 1/2`. So neither Check reaches the conclusion.

Change: Check 1 → `(1/4)·1_{[0,1/4)}`, `B_0 = δ_0 = 1`, `s_0 = 0`: hypothesis verified for `s ≥ 0`, threshold `2`, vanishing from `1/4`. Check 3 → `e^{−s}`, `B_0 = 1/e`, smallness `1 < e/2`, never vanishes. The plan's tests `deGiorgi_indicator` and `deGiorgi_delta_zero` follow.

## F02 (P3) — applied differently

Evidence: the map `(φ, β) ↦ log(ω_φ^n/ω^n) − β` solves `ω_φ^n = e^{tF+β}ω^n`. pss2012 (2.6), line 220–224, writes the path with the factor `∫ω^n/∫e^{tf}ω^n`. Layer 6 calls the whole exponent `F`. The suggested `‖tF + b_t‖_{C^k} ≤ 2‖F‖_{C^k}` assumes `‖1‖ = 1`. That fails for partition-of-unity forms of PseudodifferentialOperators §5.4's finite-atlas norms.

Change: the route now names the path `ω_{φ_t}^n = e^{tF+b_t}ω^n` and applies §§6.2–6.5 to `tF + b_t`. It gives `|b_t| ≤ t·sup|F|`, `sup|tF+b_t| ≤ 2sup|F|`, `Δ_ω(tF+b_t) = tΔ_ωF` and `‖tF+b_t‖ ≤ ‖F‖ + sup|F|·‖1‖`, which holds in every norm. Check 1 adds `b_t = −ta`. The plan's `yau_F_const` follows.

## Pattern searches (other places)

- **F01, data that does not visibly meet a hypothesis of the statement it tests.** I read every Check of Layers 1–8.
  - §5.4, Check 2 said `sup ψ_ε → 0`, but the statement needs `sup ψ = 0`. The function equals `0` at `∞`, so the Check now says `sup ψ_ε = 0`, attained only at `∞`. It also records `0 < ε < 1`, smoothness on `ℂP¹` and `ω' + i∂∂̄ψ_ε = i∂∂̄log(|z|²+ε)`. Plan test `qpsh_CP1_family` already said `sup ψ_ε = 0`.
  - The same smallness hypothesis is used in §8.3, which applies §8.2 at `s_0 = (2B_0)^{1/δ_0}Ē`. There Chebyshev gives only `s_0Φ(s_0) ≤ Ē`, not the strict inequality; gpt2023 line 433 has the same gap. §8.3 now proves the strict form: `Ω_{s_0}^∘` is open and `−φ_t > s_0` on it, so `s_0Φ(s_0) < E_t ≤ Ē`, and the case `Ē = 0` is impossible. The plan's 8.3 statement follows. The new `s_0` collided with the name used in the right-continuity clause, so that clause now uses `s_1`.
  - §8.1's three Checks are vacuity Checks. They say so, and they claim no instance of the conclusion. That conclusion is a finite bound with unspecified constants, which no explicit instance can test. No change.
  - §7.1 already guards its point-mass Check (`R' < R/2` "would test nothing"). No other Check fails a hypothesis.
- **F02, a continuity path whose exponent drops the normalizing constant.** The only continuity path is in §6.6, and "tF" occurs nowhere else. §8.1 and §8.5 solve their auxiliary equations through §6.6's theorem, with its `b`, and use no path. The admissible-pair form of §6.6 is Yau's theorem with background `χ`, exponent `nF + log(ω_X^n/χ^n)` and `b = n·log c`. Computed: `c^n = ∫χ^n/∫e^{nF}ω_X^n = ∫χ^n/V` for normalized `F`, which agrees.

## Adversarial pass on changed statements

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §8.2 Check 1, `(1/4)·1_{[0,1/4)}`, `B_0 = δ_0 = 1` | grid of 2001 × 2001 points `s ∈ [0, 0.6]`, `r ∈ [0, 1]`; `s_0 = 0` | `max(rφ(s+r) − φ(s)²) = 0`, reached only where both sides vanish (`s ≥ 1/4`); for `s + r < 1/4`, `r/4 < 1/16`; `φ(0) = 0.25 < 0.5`; threshold `0 + 1/(1 − 2^{−1}) = 2 ≥ 1/4` | Holds; replaces the vacuous Check |
| §8.2 at `s_0 = 0` (the source fixes `s_0 > 0`, line 416) | hypothesis stated for `s > 0` | right-continuity at `0` and at `r` gives `rφ(r) ≤ B_0φ(0)^{1+δ_0}` as the limit `ε ↓ 0` of the case `s = ε`; the Check's verification covers `s ≥ 0` directly | Holds; no change to the statement |
| §8.2 Check 3, `e^{−s}`, `δ_0 = 0` | `B_0 = 1/e`; `r ∈ [0, 1]` step 0.001; `s ∈ {0, 0.5, 3, 10}` | `max re^{−r} = 0.36788 = 1/e` at `r = 1`; `re^{−s−r} ≤ e^{−1}e^{−s}` at every sampled point; `1 < e/2 = 1.35914`; `φ > 0` everywhere; `1/(1 − 2^0) = 1/0` | Holds; the Check now shows that `δ_0 > 0` is needed |
| §8.2 Check 2 (unchanged), `e^{−s}`, `δ_0 > 0` | ratio `(re^{−r}/B_0)e^{δ_0 s}` | `→ ∞` as `s → ∞` for fixed `r > 0` | Holds |
| §6.6 path, `b_t = log(∫ω^n/∫e^{tF}ω^n)` | `F = a`; torus `n = 1`, `F = ε cos 2πx` with `ε ∈ {0.1, 1, 3}`, `t ∈ {1/4, 1/2, 1}`; 2000 random step functions on probability spaces with `F ∈ [−5, 5]` | `b_t = −ta`, exponent `0`; `b_1 = −log I_0(1) = −0.2359`, and `|b_t| ≤ tε` in all nine cases; random cases: `−t·max F ≤ b_t ≤ −t·min F` and `∫e^{tF+b_t} = 1` to `10⁻⁹` | Holds |
| §6.6 uniform bounds | `t ∈ [0, 1]` | `sup|tF + b_t| ≤ t·sup|F| + t·sup|F| ≤ 2·sup|F|`; `tΔ_ωF ≥ t·inf Δ_ωF ≥ min(0, inf Δ_ωF)`; `‖tF + b_t‖ ≤ t‖F‖ + |b_t|·‖1‖ ≤ ‖F‖ + sup|F|·‖1‖` | Holds in every norm; `2‖F‖` holds only when `‖1‖ = 1` |
| §6.6 Check 1, wrong exponent `ta` | `a ≠ 0`, `t > 0` | `∫e^{ta}ω^n = e^{ta}∫ω^n ≠ ∫ω^n = ∫ω_{φ_t}^n` (§3.2) | The Check separates `tF + b_t` from `tF` |
| §8.3 strict smallness at `s_0 = (2B_0)^{1/δ_0}Ē` | `Φ(s_0) > 0`, `Ē > 0`; `Ē = 0`; `Φ(s_0) = 0` | `Ω_{s_0}^∘` is open and nonempty, so it has positive `ω_X^n` measure, and `∫_{Ω^∘}(−φ_t − s_0)e^{nF_t} > 0` gives `Φ(s_0) < Ē/s_0 = (2B_0)^{−1/δ_0}`; `Ē = 0` gives `0 < 0`, impossible; `0 < 1/(2B_0)` | Holds; clause added |
| §5.4 Check 2, `ψ_ε` on `ℂP¹` | `ε ∈ (0, 1)`, chart `w = 1/z` | quotient `(|z|²+ε)/(1+|z|²) < 1` on `ℂ`, `= (1+ε|w|²)/(1+|w|²) = 1` at `w = 0`; `i∂∂̄log(|z|²+ε) = iε(|z|²+ε)^{−2}dz∧dz̄ ≥ 0`; `−ψ_ε ≤ log(1 + |z|^{−2})`, integrable for `ω'` | Holds; text made exact |

## Checks run

Dependency check (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2235 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The edge count is taken over all roadmaps, and this repair adds no cross-roadmap citation.

Other checks:

- `plan.json` parses, keeps its one-space indentation, and changes in four strings only (tests `yau_F_const`, `deGiorgi_indicator`, `deGiorgi_delta_zero`, and the statement of 8.3). No prerequisite, id or name changed.
- `sources.toml` parses and still has 19 entries; it is unchanged.
- `Suggested.lean`: none exists at the design stage. No Lean name was added or removed, so no `#check` comparison was run.
- The added text has no LaTeX delimiters, machine paths or process words. I searched for them; the only hit was "round" inside "backgrounds".

## Gate failures

None were listed for this round.

## For the maintainer

- No section, layer, target id or plan name was renamed or removed. Citations of this roadmap by other roadmaps are unaffected.
- Ownership: this repair adds no new construction. The bounds on `b_t` and the strict Chebyshev step are elementary steps inside the routes of §§6.6 and 8.3. Ownership against open pull requests was not re-checked this round, because nothing new is owned.
- Source issue for the record: gpt2023 line 433 chooses `s_0 = (2B_0)^{1/δ_0}E_t` for its Lemma 2, whose proof (line 416) needs the strict inequality. The strict inequality holds because `φ_t` is continuous, but the source does not say so. The README now does.
- `needs-references.toml` was not created: every text cited is in the manifest.
- Suspicious text: none found in the review or the sources read.
