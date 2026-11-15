# Repair report: ComplexHessianEquations design, round 14

One review (`REV-DESIGN-ComplexHessianEquations~13`), two findings, both P3. I checked both against the README and against gpt2023 at the cited lines. Both are right, and both were applied with the review's wording.

Files changed:

- `packages/ComplexHessianEquations/design/README.md`: the Scope and ownership paragraph (one sentence) and §8.6 (one sentence).

These files are unchanged:

- `packages/ComplexHessianEquations/design/plan.json`. Its 8.6 locator "Theorem 1, line 84–89; proof line 442–457" is correct: those lines are where the source proves Theorem 1. The file still parses.
- `packages/ComplexHessianEquations/sources.toml`. No source was fetched and no new work is cited.
- `needs-references.toml` was not written, because every text I needed was readable.

## F01 (P3) — applied

**Verified.** README line 15 read "No roadmap on the content repository and no board package owns any of these objects." Both "content repository" and "board package" name stages of the workflow. A reader of the merged roadmap cannot resolve them.

**Change.** Old: "No roadmap on the content repository and no board package owns any of these objects." New: "No other roadmap owns any of these objects." The rest of the paragraph is unchanged. It still names the owners of the related objects: RiemannianGeometry R5c, the pinned Tau Ceti declarations, K3Surfaces §2.1, ComplexComparisonPartII C5.4 and OptimalTransport Layer 6.

**Pattern.** I searched the README and `plan.json` for "content repository", "board", "package", "pull request", "worker", "round" and "job". After the edit nothing matches. The other matches of "background" and "round" are mathematics, for example "degenerating backgrounds" and "ball around".

## F02 (P3) — applied

**Verified.** gpt2023 says the following at the cited lines:

- Line 443–447: the reduction of Theorem 1 to Theorem 2 with `χ = 0` and `t = 1`.
- Line 451: the bound on `c_1^n`.
- Line 455: the energy is bounded by Hölder's inequality: the `n/(n−1)`-th moment of `−φ`, raised to the power `(n−1)/n`. At `n = 1` the exponent `n/(n−1)` is undefined.
- Line 456–457: the proof is passed to Theorem 3(c).

None of these lines mentions `n = 1`. The README sentence "This holds also for `n = 1`, where no Hölder step is needed (gpt2023 line 442–457)" therefore put a locator after a claim that its lines do not make. The source's Hölder step in fact fails at `n = 1`. The review lists this under Source issues.

**Change.** Old: "This holds also for `n = 1`, where no Hölder step is needed (gpt2023 line 442–457)." New: "gpt2023 (line 442–457) makes the same reduction but bounds the energy through Hölder's inequality with the exponent `n/(n−1)`, which is undefined at `n = 1`; applying §8.5(c) at `N = 1` directly needs no Hölder step and covers every `n ≥ 1`." The plan locator is unchanged, as the review says.

**Pattern.** I searched the README for every sentence that combines `n = 1` or `n ≥ 1` with a gpt2023 locator, and for every "also holds", "implicit" or "differs" sentence ending in a gpt2023 line locator. There is no other match. The other place where the README departs from gpt2023 in a proof is §8.7 ("This step is implicit in gpt2023"), and that sentence makes no locator claim. §5.3's Sobolev line (`2n/(n−1)`, `n ≥ 2`) and its Check at line 537 already exclude `n = 1` and cite pss2012 correctly.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed on each side | Result; change |
| --- | --- | --- | --- |
| §8.6 route: §8.5(c) at `p' = n`, `N = 1` | `n = 1` (so `p' = 1`); `n = 2` | `n = 1`: the range `p' ∈ [1, n)` is empty and `p' = n = 1` allows every `N > 0`, so `N = 1` gives `∫(−φ)e^F ω_X ≤ C`. The source's exponent `n/(n−1) = 1/0` is undefined. `n = 2`: the source's step uses `N = 2` and the power `1/2`; the README's step uses `N = 1`, which is also allowed since `p' = n` | Holds for every `n ≥ 1`; sentence rewritten |
| `Ent_n(F) ≤ 1 + Ent_p(F)` for `p > n`, normalized `F` | `|F| ≥ 1` and `|F| < 1`; the two-valued `F` of the §8.7 Check (`n = 1`, `V = 1`, `F = 1/2` on half of `X` and `F = log(2 − e^{1/2}) ≈ −1.04618` on the other half), `p = 2` | `|F|^n ≤ |F|^p` where `|F| ≥ 1`, and `|F|^n < 1` where `|F| < 1`, so `Ent_n ≤ V⁻¹∫e^{nF}ω^n + Ent_p = 1 + Ent_p`. On the instance: `Ent_1 = (1/2)(1.64872·0.5 + 0.35128·1.04618) = 0.59593`; `Ent_2 = (1/2)(0.41218 + 0.38447) = 0.39833`; `0.59593 ≤ 1.39833` | Holds |
| §8.6 at `n = 1`, Laplace pair (Check `fixed_curve`) | torus `ℂ/(ℤ + iℤ)`, `e^F = 1 − a cos 2πx`, `a = 1/2` | `φ = (a/2π²)(cos 2πx − 1)`: `Δ_ωφ = (1/2)(a/2π²)(−4π² cos 2πx) = −a cos 2πx`, so `1 + Δ_ωφ = e^F`, `sup φ = 0` and `∫e^F = 1 = V`. `E(φ) = (a/2π²)∫(1 − cos)(1 − a cos) = (a/2π²)(1 + a/2) = 1.25/(4π²) ≈ 0.0317`, finite as the route predicts | Holds |
| Scope sentence | search of the README for owners of the listed objects | The paragraph names the owners of the Poincaré inequality (RiemannianGeometry R5c), the eigenvalue inequalities, the sub-mean-value and Sobolev inequalities and the Levi form (pinned Tau Ceti), the K3 equation (K3Surfaces §2.1), positive currents (ComplexComparisonPartII C5.4) and the transport Monge–Ampère equation (OptimalTransport Layer 6). None of them is among the objects listed as owned | Holds |

## Checks run

Dependency check (exit 0):

```text
candidate: ComplexHessianEquations is not in the merge order yet; checked as if placed after ComplexComparisonPartII (the intake inserts it when its design is accepted)
depcheck: 243 roadmaps, 2236 edges, 0 problem(s)
```

It shows no UPWARD, CYCLE or `moved:` line. `plan.json` parses. A search for LaTeX delimiters in the README finds nothing.

`Suggested.lean`: none exists at the design stage, so there was no `#check` comparison and nothing was elaborated.

Ownership against open pull requests: no ownership changed in this round. The edits add no object and no citation. The Scope sentence now states, without process vocabulary, the same ownership claim that the review re-checked against main and the open heads.

## For the maintainer

- No name, section or id that another roadmap cites has changed. The edits touch only prose.
- The review's "For the human reviewers" section (licence of `demailly2012`, scope) lists no finding and was not acted on.
- I found no suspicious text in the review or in the source lines I read.
