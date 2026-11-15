# Repair report: ComplexHessianEquations design, round 11

One review, two findings, both P3. Both were verified against the sources and both are repaired. Files changed: `packages/ComplexHessianEquations/design/README.md` and `packages/ComplexHessianEquations/design/plan.json`. `packages/ComplexHessianEquations/sources.toml` is unchanged (tosatti-weinkove2010 is still cited for 4.1, as Corollary 1).

## F01 (P3) — applied

Verified: tosatti-weinkove2010 line 38–47 is Corollary 1 (a unique constant `b` and a unique normalized solution for the Monge–Ampère equation). Line 36 is the sentence that introduces it. No inequality at a maximum point appears there. The pointwise comparison is the maximum-principle step the README proves itself in §4.1. The other sources say nothing more: szekelyhidi2018 line 1327 states only that the constant is unique, and pss2012 line 867 is about the `C¹` estimate.

Change (README §4.1, line 417): "(tosatti-weinkove2010 line 38–47 for the Monge–Ampère case)" → "(this is the maximum-principle step behind the uniqueness that tosatti-weinkove2010 Corollary 1, line 38–47, states for the Monge–Ampère pair; the source does not state the comparison itself)". Plan target 4.1 `locator.where`: "line 38–47" → "Corollary 1, line 38–47 (states the uniqueness this step yields; the comparison is not stated in the source)".

Pattern search: the only other citation of these lines is §4.2 (README line 427 and plan 4.2: "Corollary 1, line 36–47"). There the citation is correct, because §4.2 is the uniqueness theorem itself. No other locator claims a comparison at a maximum.

## F02 (P3) — applied differently

Verified: gpt2023 Theorem 4 (line 847–850) and Theorem 5 (line 948–952) both assume `C²` solutions normalized by `sup φ_t = 0`. The README's §8.4 statement and the first and third bullets of §8.7 left this to the Layer 8 preamble, and that preamble only says "the degenerating setting of §3.4 is used". The witness checks out. Take `n = k = 1`, `χ = 0`, `t = 1`, `F_1 = 0`, `c_1 = 1` and `φ_1 = −M`. Then `λ = 1 ∈ Γ_1`, `E_1(−M) = M` and `‖φ_1‖_{L^∞} = M` for every `M`. This breaks both the energy bound and the `L^∞` bound of §8.4, and the Hessian estimate of §8.7.

Change. §8.4 and the §8.7 Hessian estimate now begin "let `φ_t ∈ C²`, for `t ∈ (0, 1]`, solve the degenerating equation of §3.4 (so `sup φ_t = 0`; for §8.4 also `ω_{t,φ_t} > 0`) with constants `c_t > 0` and normalized smooth `F_t`". The §8.7 Hölder bound now assumes only the equation `f(λ[ω_{t,φ_t}]) = c_t e^{F_t}` with `λ ∈ Γ`. Plan 8.4 and 8.7 have the same hypotheses, plus the tests `MA_normalization_needed` and `hessian_normalization_needed`. Each section gained a README Check built on the witness.

Why this differs from the suggested repair: the review asked for the full "normalized smooth `F_t`, `sup φ_t = 0`" hypothesis on the Hölder bullet as well. Its proof is the identity (gpt2023 (1.9)), `−φ_t ≤ |φ_t|` and Hölder's inequality, and it uses neither the normalization nor smoothness. The new §8.7 Check shows equality at `φ_1 = −M`. Stating it with those hypotheses would narrow it below what holds.

Pattern search (a theorem whose solution or normalization hypotheses sit only in a layer preamble):
- §§8.1, 8.3, 8.5 and 8.6 already state "`φ_t ∈ C²` solves … with normalized smooth `F_t`" (or the fixed-background version).
- Layer 6's preamble explicitly fixes `φ` as a smooth solution. Its statements are either invariant under adding a constant (§§6.2–6.4) or state `sup φ = 0` (§6.5).
- The plan's 6.5 `hypotheses` listed no solution hypothesis. I added "φ smooth solution of ω_φ^n = e^F ω^n with ω_φ > 0, F smooth (a C^{2,α} solution for the regularity clause)".

Consumer inside the roadmap: the §8.7 `L^{p'}` bound uses §8.4 for the auxiliary solutions `v_j`. gpt2023 line 874–893 takes `η_j` smooth and positive with `∫η_j ω_X^n = 1` and `sup v_j = 0`. That is §8.4 at `χ = 0`, `t = 1` with `nF = log η_j` smooth and normalized, so the new hypotheses are met.

## Checks run

Dependency check, run after the final edit (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

- `plan.json` parses and round-trips: 47 targets, the same ids, one gap (`weak-harnack-supersolutions`, unchanged). The two new tests use the existing kind `non-example`.
- The README has 35 `*Needs:*` lines and 35 `**Checks.**` blocks (unchanged), and no LaTeX delimiters.
- No supplier, citation or library name was added or changed, so the supplier contracts and `sources.toml` are untouched.
- There is no `Suggested.lean` at the design stage, so no `#check` comparison applies.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result; change |
| --- | --- | --- | --- |
| §4.1 locator | tosatti-weinkove2010 line 36–47; grep for "maximum" and "unique" | lines 36, 38, 39, 414 only; Corollary 1 states existence and uniqueness of `(b, φ)` | locator now claims only uniqueness |
| §8.4 with the new hypotheses | `χ = 0`, `t = 1`, `F_1 = 0`, `φ_1 = −M` | `c_1 = 1`, `V_1 = V`, `Ent_q(0) = 0`; `E_1(−M) = V⁻¹∫M ω_X^n = M`; `sup φ_1 = −M` | excluded for `M > 0`; `M = 0` gives `E_1 = 0`, bound `0`; Check added |
| §8.4 first Check, re-evaluated | `χ = ω_X`, `F_t = 0`, `φ_t = 0` | `ω_t^n = (1+t)^nω_X^n = c_t^n ω_X^n`, `c_t = 1 + t`, `sup 0 = 0` | still within the statement |
| §8.4 background Check, re-evaluated | `χ = 3ω_X`, `t = 1`, eigenvalues of `i∂∂̄φ_t` all `−2.5` at a point | `4 − 2.5 = 1.5 > 0`, `2 − 2.5 = −0.5 < 0`; such a smooth `φ_t` with `sup φ_t = 0` solves with `e^{nF_t} = c_t^{−n}ω_{t,φ_t}^n/ω_X^n` smooth and normalized (§3.2) | holds |
| §8.4 as used by §8.7 (`v_j`) | gpt2023 line 874–893 | `η_j > 0` smooth, `∫η_j = 1 = V`, `sup v_j = 0`, `‖η_j‖_{L^{1+ε}} ≤ 5` | hypotheses met |
| §8.7 Hölder bound | `φ_1 = −M`, `n = 1`, `F_1 = 0`, `c_1 = 1` | left side `M`; right side `V⁻¹·V^{1/q}·M·V^{1/q'} = M` | equality; holds without `sup φ_t = 0` |
| §8.7 Hölder bound without the equation | `φ = −1`, `F_t` normalized, `c_t → 0` | left side `V_t⁻¹∫f(λ)^n ω_X^n > 0` fixed; right side `→ 0` | the equation is needed; kept |
| §8.7 Hessian estimate | same witness, `k = 1`, `γ = 1` (§2.5: `σ_1 ≥ n(∏μ)^{1/n}`) | `‖φ_1‖_{L^∞} = M`, constant independent of `M` | excluded by `sup φ_1 = −M ≠ 0`; Check added |
| §8.7 first Check, re-evaluated | `n = k = 2`, `q = 3/2` | `q' = 3`; §7.2 needs `sup φ_t = 0`, now stated | holds |
| §8.7 entropy Check, recomputed | `F = 1/2` and `log(2 − e^{1/2}) = −1.0461` on halves; `F = −2` on 9/10 and `log(10 − 9e^{−2}) = 2.1727` | means of `e^F`: `(1.6487 + 0.3513)/2 = 1`, `0.1218 + 0.8782 = 1`; `Ent_2 = 0.398` and `4.633`; bounds `0.5413·2.421 = 1.311` and `0.5413 + 4.184 = 4.725` | holds; the pointwise bound needs no smoothness |
| plan 6.5 hypothesis | flat torus, `F = 0`, `φ = M` | `ω_φ = ω`, `‖φ‖_{C^{k,α}} ≥ |M|`, `sup φ = M` | the solution hypothesis together with `sup φ = 0` gives `M = 0`; README unchanged (preamble states it) |

## For the maintainer

- No name, section or id that another roadmap cites has changed. The §§4.1, 8.4 and 8.7 headings and the plan ids are unchanged.
- Ownership against open pull requests: nothing new is stated that another roadmap could own. The edits restate hypotheses of existing targets and add Checks.
- I found no suspicious text in the review or the sources I read.
