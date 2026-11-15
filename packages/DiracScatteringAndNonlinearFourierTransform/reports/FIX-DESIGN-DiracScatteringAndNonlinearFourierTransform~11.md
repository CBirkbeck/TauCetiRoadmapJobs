# Repair of DiracScatteringAndNonlinearFourierTransform (design, round 11)

This round answers the findings of `REV-DESIGN-DiracScatteringAndNonlinearFourierTransform~10`. The verdict was
`needs_changes`, with a single P3 finding. Files edited:

- `packages/DiracScatteringAndNonlinearFourierTransform/design/README.md` (§5.4, third Check)
- `packages/DiracScatteringAndNonlinearFourierTransform/design/plan.json` (target 5.4, the same test)

`sources.toml` is unchanged: no new work is cited. No source was fetched, and `needs-references.toml` was not
written. There is no `Suggested.lean` at the design stage, so the `#check` comparison of elaborated types does
not apply and was not run. The review's section "For the human reviewers" asks for no edit, and none was made
for it.

## F01 (P3) — applied

Verified. §2.1 defines `S[h] = (1/(πi))∫ (1/(x − z) − x/(1 + x²)) h dx` and `S⁰[h] = (1/(πi))∫ h/(x − z) dx`.
So `S⁰[h] − S[h] = −(i/π) I` with `I = ∫ x h/(1 + x²) dx`, and `O⁰_h = e^{−(i/π)I} O_h` (§2.8). The factor is
`1` exactly when `I/π ∈ 2πℤ`, that is `I ∈ 2π²ℤ`, not only when `I = 0`. The Check claimed "exactly when that
integral vanishes", which fails in one direction.

I recomputed the reviewer's witness in plain Python (trapezoid rule on `[−200, 200]`, steps down to
`3·10⁻⁶` near the bump). It uses `q = 0.3 e^{2iξs} 1_{[0,400]}`, with
`h₀(x) = ½ log(1 + 0.09 sin²(400κ)/κ²)`, `κ = √(x² − 0.09)` (sinh form for `|x| < 0.3`). By the modulation rule
of §4.1 (`G_{q e^{2iξ·}}(t, z) = G_q(t, z + ξ)`), `h(x) = h₀(x + ξ)`.

- Mass check: `∫ h₀ = 56.54867`, against `(π/2)(0.09)(400) = 56.54867`.
- `I(0) = 3·10⁻¹⁶`, since `h₀` is even.
- `I(−0.25) = 12.54182`, factor `e^{−3.9922i} = −0.6595 + 0.7517i`.
- `I(−0.5) = 21.70502`, factor `0.8105 − 0.5857i`.
- `2π² = 19.73921` lies in between.

`I` is continuous in `ξ`: `h₀ ∈ L¹`, and the kernel `(u − ξ)/(1 + (u − ξ)²)` is bounded by `½` and continuous
in `ξ` (dominated convergence). So some `ξ ∈ (−0.5, −0.25)` gives `I = 2π² ≠ 0` and factor `e^{−2πi} = 1`.

Old → new (README §5.4 and the mirrored plan.json test): "which is `1` exactly when that integral vanishes, as
for real `q`" → "which is `1` exactly when `I` is an integer multiple of `2π²`". Added: `I = 0` for real `q`
(even `log|a(∞, ·)|`); the modulated witness with its two values; factor `≠ 1` at `ξ = −0.25`, so `O_h ≠ a(∞, ·)`;
a crossing of `2π²` in between.

I took the reviewer's repair and added one clause, the factor `e^{−3.992i} ≠ 1` at `ξ = −0.25`. With it the
Check also rules out the plausible wrong normalisation `a(∞, ·) = O_h`. The statement of §5.4,
`a(∞, ·) = O⁰_{log|a(∞, ·)|}`, does not change.

Pattern search. I grepped the README for `(i/π)`, `O⁰`, `O_h` and "exactly when":

- §2.1, line 725–726: `S⁰[h] − S[h] = −(i/π)∫ x h/(1 + x²)` is an identity and is correct.
- §2.8, line 994: `O⁰_h = e^{−(i/π)∫ x h/(1+x²)} O_h` is an identity and is correct.
- §4.4, line 1256: `a(t, ·) = O⁰_{log|a(t,·)|}` uses the right normalisation and makes no "exactly when" claim.

None of these needed a change, and no other Check states when the factor equals `1`.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| `O⁰_h = e^{−(i/π)I} O_h` and the factor is `1` iff `I ∈ 2π²ℤ` | `I = 0`; `I = 2π²`; `I = π²` | `e^0 = 1`; `e^{−2πi} = 1`; `e^{−πi} = −1` | holds in both directions | Check restated |
| `I = 0` for real `q` | `q = 0.3·1_{[0,400]}` (`ξ = 0`) | `I = 3·10⁻¹⁶`; `h₀(−x) = h₀(x)` from `κ(−x) = κ(x)` | holds | none |
| Modulated witness, `ξ = −0.25` | trapezoid quadrature | `I = 12.54182`; `−I/π = −3.99222`; factor `−0.6595 + 0.7517i ≠ 1` | holds; `O_h ≠ a(∞, ·)` | added to the Check |
| Modulated witness, `ξ = −0.5` | trapezoid quadrature | `I = 21.70502 > 2π² = 19.73921 > 12.54182` | holds | added to the Check |
| Mass of `h₀` against §4.4 | `(π/2)·0.09·400` | `56.54867` both sides | holds | none |
| Continuity of `I(ξ)` | dominated convergence | `|(u − ξ)/(1 + (u − ξ)²)| ≤ 1/2`, `h₀ ∈ L¹(ℝ)` | holds; intermediate value applies | none |
| Compact support: `a(∞, ·) = a(400, ·)` | §5.4 first Check pattern | tail `q_{>400} = 0`, so §5.3 gives `a(∞) = a₁` | holds | none |

## Checks

- Dependency check (gate), run after the edits:

```
candidate: DiracScatteringAndNonlinearFourierTransform is not in the merge order yet; checked as if placed after AutomorphicSpectralTheory (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2243 edges, 0 problem(s)
```

  No UPWARD and no CYCLE line. The roadmap is not yet in the merge order, which is expected at the design stage.
- `plan.json` parses as JSON. Every `statement` string in it (369) occurs in the README up to whitespace
  (script, 0 misses).
- `Suggested.lean`: does not exist at the design stage. No elaboration and no `#check` comparison were run.

## For the maintainer

- No name, section or id that another roadmap cites has changed. Only the wording of one Check in §5.4 is
  different.
- No supplier changed, and no ownership question was raised. Ownership against the open pull requests was not
  re-checked this round, because no new object was introduced.
