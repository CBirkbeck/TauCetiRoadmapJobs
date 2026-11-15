# FIX-DESIGN-DynamicalDegreesOfRationalMaps~13

Findings of `REV-DESIGN-DynamicalDegreesOfRationalMaps~12` (one finding, P3).

## F01 (P3) — applied differently

Verified. `silverman2014` lines 350–357 say three things: the iterates of a morphism of degree `d` have degree `d^n`, in general the degree can be smaller, and the dynamical degree is defined (355–357). They say nothing about forms without common factor. That description is at `silverman2014` lines 43–45 (§1). `guedj2010` lines 1145–1147 (`r_1(f)` is the degree of the coprime homogeneous forms) and `russakovskiishiffman1997` line 510 (`δ_1(P) = deg P`) also back the description by reduced forms, not the codimension-one sentence where the parenthesis stood.

What changed:
- §6.1 Route: the parenthesis moved from "A codimension-one component of `V(F)` would give a common factor" to the sentence it backs, "… gives reduced forms". It now reads "(silverman2014 lines 43–45, for maps given by forms of one degree without common factor; guedj2010 …; russakovskiishiffman1997 line 510)".
- §6.1 *Iterates of morphisms*: added "(silverman2014 lines 350–354, for `n ≥ 1`)" after "morphisms of degree `a^n`".
- `plan.json` 6.1 `where`: "silverman2014 lines 350-357" → "silverman2014 lines 43-45 and 350-354", as the review asked.

Why this differs from the suggested repair: the review put both Silverman locators inside the Route parenthesis. The house rule is that a locator goes in parentheses at the claim it backs. Lines 350–354 back the iterates item, not the codimension sentence, so they now sit at the iterates item. The same rule moved the whole parenthesis to the reduced-forms sentence.

Pattern repair:
- The README reference entry for `silverman2014` now lists §1 ("§3, Examples 5–6, Proposition 7" → "§1 (maps by forms without common factor), §3, …").
- The manifest `locator` now lists Section 1 ahead of Section 3. Its `cited_for` already includes §6.1.
- §6.2 Route and `plan.json` 6.2 still cite "silverman2014 lines 350–357 and (3), line 387". That is correct: the morphism iterates item uses lines 350–354, the item "`λ_1(f)` … Silverman's first dynamical degree" uses the definition at lines 355–357, and the sub-multiplicativity uses (3) at line 387. Unchanged.
- No other README passage cites `silverman2014` lines 350–357 or lines 43–45.

## Adversarial pass on the changed passages

No statement, hypothesis or Check changed, only where the locators sit. I recomputed the Checks of §6.1 that use the two claims whose citations moved.

| Statement | Instances tried | Values on each side | Result; change |
| --- | --- | --- | --- |
| §6.1 reduced forms (lines 43–45: forms of one degree, no common nontrivial factor) | `(x_0², x_0x_1, x_0x_2)`; Cremona `(x_1x_2, x_0x_2, x_0x_1)`; `d = 0`, `[x_0]` | common factor `x_0`, reduced form `(x_0, x_1, x_2)`, degree `1` not `2`; gcd `1`, degree `2`; reduced form `(1)`, degree `0` | holds (the `d = 0` case stays excluded by `d ≥ 1`); locator moved |
| §6.1 codimension-one component gives a common factor | `V(x_0², x_0x_1, x_0x_2) ⊇ V(x_0)`; Cremona base locus | hyperplane `x_0 = 0`, codimension `1`, factor `x_0`; three points `[1:0:0], [0:1:0], [0:0:1]`, codimension `2`, no common factor | holds; parenthesis removed from this sentence (no source states it, and the Route proves it with the UFD property) |
| §6.1 iterates of morphisms (lines 350–354, `n ≥ 1`) | `[x_0² : x_1² : x_2²]`, `n = 1, 2`; Frobenius `[x_i^p]`; Cremona (not a morphism); constant `[0:0:1]` | `2 = 2¹`, `[x_i⁴]` of degree `4 = 2²`; `p^n` on both sides; `deg σ² = 1 < 4 = 2²` (no morphism, so outside the claim; this is the "may be strictly smaller" case at lines 351–352); degree `0`, `f^n = f`, `0 = 0^n` for `n ≥ 1`, `f^0 = id` of degree `1 = 0^0` (from the README's own convention; Silverman covers only dominant maps) | holds; locator added for `a ≥ 1`, `n ≥ 1` |
| §6.2 citation "lines 350–357, (3) line 387" (re-read for the pattern) | morphism `[x_i²]`; Fibonacci; Cremona composed with itself | `deg_{k,H}(f^n) = 2^{nk}` (350–354); `lim fib(n+2)^{1/n} = 1.618…` is Silverman's `δ_φ` (355–357); `deg(σ∘σ) = 1 ≤ 2·2` (387) | holds; unchanged |

## Checks run

Dependency check, full output:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2247 edges, 0 problem(s)
```

No UPWARD or CYCLE line. After the edits, `plan.json` parses as JSON and `sources.toml` parses as TOML.

Lean: the design stage has no `Suggested.lean`. Nothing was elaborated, and there was no `#check` comparison to run. No Lean command was run.

## Notes for the maintainer

- No target, Lean name, section number, statement or supplier changed, so no other roadmap's citation is affected. `gaps` stays empty.
- No source was fetched. The `silverman2014` text was already in the cache. The manifest changed only in that entry's `locator` field. `needs-references.toml` was not written.
- This round adds no construction, so there is no new ownership question. Ownership against open pull requests stands as checked in earlier rounds.
