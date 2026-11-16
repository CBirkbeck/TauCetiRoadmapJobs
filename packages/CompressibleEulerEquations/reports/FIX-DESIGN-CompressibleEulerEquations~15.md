# FIX-DESIGN-CompressibleEulerEquations~15

One review was settled: `REV-DESIGN-CompressibleEulerEquations~14`. It has one finding, F01 (P3).
Its `## For the human reviewers` section lists no finding, and nothing was changed because of it.

## F01 (P3) — applied differently

**Verified.** The finding is right. In the §3.2 *Limit curves* route, `σ_m^j` is the least time
from which `x_m` stays in `K_j` up to `t_{p_m}`. It exists only if `p_m = (t_{p_m}, x_m(t_{p_m}))`
lies in `K_j`. On the reviewer's witness (field `(1, 0)`, `D = H₀`, `K_j = [0, j] × [−j, j]`,
`p_m = p = (5, 0)`), `p ∉ K_j` for `j ≤ 4`, so the set of such times is empty.

**Old → new** (README §3.2 route, plan 3.2.3 route): "the least times `σ_m^j` … converge for every
`j`" → "fix `j_p` with `p` in the relative interior of `K_{j_p}`; for `m` large
`p_m ∈ K_{j_p} ⊆ K_j` for every `j ≥ j_p`, so `σ_m^j` exist (possibly not for `j < j_p`); along a
diagonal subsequence they converge for every `j ≥ j_p`"; "for every `j` the `x_m` eventually
leave" → "for every `j ≥ j_p`".

**Why "differently".** The proposed letter `j₀` is already used two sentences later in the same
route, for the index with the past endpoint `q` in the relative interior of `K_{j₀}`. Using it for
`p` too would give one symbol two meanings. So the new index is `j_p`. The mathematics is the
reviewer's.

**Pattern search.** I looked at every other first-exit or least-time construction in the README
and plan: §3.3 *Compact pasts* and *Openness*, which use the §3.2 statement, not its route;
§3.3 *Idempotence*, the first exit from `D⁺_D(S)` of a curve ending at `p ∈ D⁺_D(S)`; the §8.1
order bullet, the exit from `D` of a past curve ending at `p ∈ D`; the §8.2 route, which uses the
first exit from §3.3; and the §8.4 (a) route, segments starting at points of `D`. In each of these
the curve starts inside the set it leaves, so the exit time is defined. No other occurrence needed
a change.

## Adversarial pass on the changed text

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.2 route: `σ_m^j` exist for `j ≥ j_p`, `m` large | reviewer's witness: `D = H₀`, `K_j = [0,j] × [−j,j]`, `p_m = p = (5,0)`, `x_m ≡ 0` on `[1,5]` | relative interior of `K_j` in `H₀` is `[0,j) × (−j,j)`; it contains `(5,0)` iff `j > 5`, so `j_p = 6`; for `j ≥ 6`, `σ_m^j = 1 = a_m`; for `j ≤ 4`, no time | sound; without the restriction the infimum is over the empty set | restriction added |
| same, punctured domain | `D = H₀ \ {(1,0)}`, `K_j = {t ≤ j, |x| ≤ j, |(t−1, x)| ≥ 1/j}`, `x_m ≡ 1/m` on `[1,2]`, `p = (2,0)`, `p_m = (2, 1/m)` | `p` is in the relative interior iff `2 < j`, so `j_p = 3`; `p_m ∈ K_j` for every `j ≥ 3` and every `m` (since `|(1, 1/m)| ≥ 1 ≥ 1/j`); for `m > j`, `σ_m^j = 1 + √(1/j² − 1/m²) → 1 + 1/j`, which strictly decreases to `1 = a`, and `J = (1, 2]` | sound; agrees with the first Check of §3.2 | none |
| "for `m` large, `p_m ∈ K_{j_p} ⊆ K_j` for every `j ≥ j_p`" | `CompactExhaustion` gives `K_j ⊆ K_{j+1}` and `K_j ⊆` the interior of `K_{j+1}`, interiors taken in `D` | `p_m → p`, and the relative interior of `K_{j_p}` is an open set of `D` containing `p`, so `p_m` is in it for `m ≥ m₀`, with `m₀` independent of `j` | sound | none |
| diagonal subsequence over `j ≥ j_p` | `σ_m^j ∈ [a_m, t_{p_m}]`, with `a_m → a` and `t_{p_m} → t_p` | bounded for each `j`, so a convergent subsequence exists for each `j`, and the diagonal subsequence works for all `j ≥ j_p`; drop the finitely many `m < m₀` | sound | none |
| the two alternatives, now over `j ≥ j_p` | some `K_j` with `j < j_p` contains whole graphs | then `K_{j_p} ⊇ K_j` does too, so the first alternative is unchanged; the second is the negation of the first for `j ≥ j_p` | sound | wording "for every `j ≥ j_p`" |
| `J ≠ {t_p}` (statement says `J` contains `t_p`; nontriviality used in §3.3) | `p_m ∈ K_{j_p}`, `r` = distance from `K_{j_p}` to the boundary of `K_{j_p+1}` in `D`, `L = sup_{K_{j_p+1}} (|v| + c)` | the curves stay in `K_{j_p+1}` on `[max(a_m, t_{p_m} − r/L), t_{p_m}]`, so `J ⊇ [max(a, t_p − r/L), t_p]`, nontrivial since `a < t_p` | sound | none |
| plan 3.2.3 matches the README | text compared | same restriction, same index `j_p`, same two alternatives | agree | plan route updated |

The theorem statement of §3.2, its hypotheses, Checks, *Needs:* line and locators are unchanged.
Only the route changed. Its consumers (§3.3 *Compact pasts*, *Openness*) use the statement, so
nothing downstream needs recomputing.

## Checks run

**Dependency check** (command of the brief):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 241 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line. No *Needs:* line, supplier row or citation was added, and no notion was
moved down.

**Other checks.**
- `design/plan.json` parses after the edit (checked with `json.loads`). The edit replaced one
  string in place, so the rest of the file is unchanged.
- There is no `Suggested.lean` at the design stage, so the `#check @name` comparison had nothing
  to run on. No Lean was elaborated.
- `sources.toml` is unchanged. No new source was cited and none was fetched, so
  `needs-references.toml` was not written.
- Ownership against open pull requests: no new construction was added, so ownership is as the
  review audited it.

## Gate failures

None were listed for this round.

## Notes for the maintainer

- No name that another roadmap cites has changed. No roadmap cites CompressibleEulerEquations.
- The worker's citation lead `LinearSystem.IsSymmetricHyperbolic` (README line 103) is not a
  pinned name. It is a declaration of the supplier SymmetricHyperbolicSystems, which is an open
  pull request adding that folder; the review confirms it is declared in that roadmap's
  `Suggested.lean`. It is not a defect of this package.
- No text read in this round contained instructions.
