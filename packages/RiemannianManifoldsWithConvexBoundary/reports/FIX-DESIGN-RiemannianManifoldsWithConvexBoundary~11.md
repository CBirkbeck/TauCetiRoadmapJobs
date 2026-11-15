# Repair report: RiemannianManifoldsWithConvexBoundary design, round 11

This round settles both findings (both P3) of `REV-DESIGN-RiemannianManifoldsWithConvexBoundary~10`.
Two files change: `packages/RiemannianManifoldsWithConvexBoundary/design/plan.json` and
`packages/RiemannianManifoldsWithConvexBoundary/sources.toml`. `design/README.md` is unchanged, as
both findings ask. No new source is cited and no locator changed, so nothing was fetched and
nothing was added to `needs-references.toml`. The review's section for the human reviewers (the
licence of paternain-salo-uhlmann2023) lists no finding, so nothing was changed because of it.

## F01 (P3) — applied

Old: the plan's `hypotheses` of 5.2, 5.4.1, 5.4.2, 5.4.3, 5.4.4, 5.4.5, 5.5.1, 5.5.2, 5.6.1 and
5.6.2 omitted second countability of `N`. New: each list has "N second countable" right after the
regular-domain line, as in plan 5.1. This matches README Layer 5's standing hypothesis.

**Verification.** README line 1177 reads: "Throughout, `M = {ρ ≥ 0}` is a regular domain of a
Hausdorff second-countable boundaryless `(N, g)`." Before the repair, only plan 5.1 carried the
hypothesis. Plan 5.5.2 cites `target:3.4.1` and `target:4.6`, and both list "N second countable".
The review's instance is right: take `N` to be uncountably many disjoint copies of `ℝ²`, and `M` the
closed unit disc in one copy. The unrepaired plan admitted this `N`, and 5.5.2's route could not
use 3.4.1, which needs a partition of unity.

**Pattern.** I compared each plan target's hypotheses with the standing hypotheses of its README
layer:
- Layer 4 (README lines 911–913) requires second countability in 4.3, 4.4 and 4.6. The plan has it
  in 4.3.1, 4.3.2, 4.3.3, 4.4 and 4.6, and leaves it out of the local targets 4.1, 4.2.x and 4.5,
  as the README does.
- Layer 3 has it in 3.3.1, 3.4.1, 3.4.2 and 3.5.
- 3.3.2 assumes `M` compact. A compact manifold with boundary is a finite union of chart domains,
  each homeomorphic to an open subset of the half-space, so it is second countable. 3.3.2 needs no
  change.
- 5.3.1 and 5.3.2 are calculus lemmas on `ℝ × ℝ^K`, with no `N`. Layer 5's "Throughout" does not
  apply to them, so they are unchanged.
- In Layer 6, 6.4 already had the hypothesis. The other examples live on `ℝⁿ⁺¹`, `S^{n+1}` or the
  upper half-space, which are all second countable.

## F02 (P3) — applied

Old: `stefanov-uhlmann-vasy2021` lacked 1.4 and 3.5; `paternain-salo-uhlmann2023` lacked 3.4. New:
SUV gains "1.4 … positive second fundamental form (line 53)", and its 3.1 item becomes "3.1, 3.5 …
(lines 96-97)". PSU's item becomes "3.3, 3.4, 3.5 closed extension, extension of the metric and
double". Same pattern: PSU 1.3 and 3.1 added.

**Verification against the cached texts.**
- stefanov-uhlmann-vasy2021 line 53 identifies strict convexity with a positive second
  fundamental form. README 1.4, line 442, cites it.
- stefanov-uhlmann-vasy2021 lines 96–97 treat a not necessarily compact `M` as a subset of a
  manifold without boundary. README 3.1 and 3.5, line 829, cite them.
- paternain-salo-uhlmann2023 lines 2755–2762 give the special-case proof of Lemma 3.1.8 by extending
  `g` periodically, then Exercise 3.1.9 on the double. README 3.4, line 807, cites them.

**Pattern.** I wrote a script that splits the README at its `###` headings, finds each source by
its author string and compares the result with the leading section numbers of every `cited_for`
item. It found the review's three gaps and two more, both for paternain-salo-uhlmann2023:
- 1.3 refers to Lemma 3.1.10 for the normalised defining function. The item "4.3 normalised
  boundary defining function (Lemma 3.1.10, lines 2766-2773)" became "1.3, 4.3 …".
- 3.1 cites lines 2770–2772, which describe `M`, `∂M` and `N ∖ M` as `{ρ ≥ 0}`, `{ρ = 0}` and
  `{ρ < 0}`. I added a new item, "3.1 a domain as the set {ρ ≥ 0} of an ambient function, with
  boundary {ρ = 0} (lines 2770-2772)".

After the edit the script reports no README section missing from its work's list for any of the
six entries. It also reports no listed section that the README does not cite. The mentions in the
Summary, Scope and Conventions use locators already listed under a section, for example line 151
under 5.1, Example 3.2.1 under 6.1 and line 2642 under "Conventions". `sources.toml` parses as
TOML.

## Adversarial pass on the changed statements

The repairs add a hypothesis to ten plan targets and section labels to the manifest. No statement,
formula or Check of the README changed. The rows below test whether the added hypothesis excludes
an intended instance, or narrows a target below its sources.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 5.5.2 (non-trapping criteria) with "N second countable" | `N = ⊔_{i ∈ ℝ} ℝ²`, `ρ = 1 − ǀxǀ²` on copy 0, `ρ = −1` on the others; `M` the unit disc | `dρ = −2x`, with `ǀdρǀ = 2` on `ǀxǀ = 1`, so `0` is regular. `N` has uncountably many disjoint nonempty open sets, so it is not second countable: excluded, as in README Layer 5. On copy 0 alone, `τ(x, v) = −⟨x, v⟩ + √(⟨x, v⟩² + 1 − ǀxǀ²)`, with maximum `2` at `x = −v`, so the disc is non-trapping. | plan agrees with the README; the instance stays available on a second-countable `N` | applied |
| 5.5.2's route through 3.4.1 on `SN` | `N` second countable | `SN` is locally `U × Sⁿ` over countably many trivialising `U`, so it is second countable and 3.4.1's hypothesis holds for `SN` | route valid | none |
| 5.4.x, 5.5.x, 5.6.x: generality for compact `M` | compact `M ⊆ N`, `N` arbitrary Hausdorff | finitely many chart domains `U₁, …, U_k` of `N` cover `M`. `N′ = ⋃ U_i` is open and second countable, `0` is regular for `ρ ∣ N′`, and `{ρ ∣ N′ ≥ 0} = M` with the same atlas and metric | no loss of generality against paternain-salo-uhlmann2023, whose closed extension is compact | none |
| 5.2 (exit time), `M` not compact | Hausdorff second-countable `M` | by 3.5, `M ≅ {ρ̃ ≥ 0}` in a second-countable `M̃` | every `M` of the roadmap's realisation is still covered | applied |
| Layer 6 consumers of Layer 5 | 6.1.1 (ball in `ℝⁿ⁺¹`: 5.2, 5.4.5, 5.6.1); 6.1.2, 6.2 (`ℝⁿ⁺¹`); 6.3.1 (`S^{n+1}`); 6.3.2 (upper half-space); 6.4 | `ℝⁿ⁺¹` has the countable base of rational balls; `S^{n+1}` is compact; the upper half-space is open in `ℝⁿ⁺¹`; 6.4 lists the hypothesis | every example meets the added hypothesis | none |
| 3.3.2 (double), no "second countable" in the plan | closed unit disc `D` | two chart domains cover `D`, each an open subset of the half-space `{x₀ ≥ 0} ⊆ ℝ²`, so `D` is second countable | compactness implies the hypothesis | none |
| 5.3.1, 5.3.2 | `h = y − t²`, `K = 1` | domain `ℝ × ℝ`, no `N`; `Q = r`, `a = y` | outside Layer 5's standing setting | none |

## Checks run

**Dependency check** (exact output):

```text
candidate: RiemannianManifoldsWithConvexBoundary is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2242 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The suppliers are unchanged and no gap is declared
(`gaps: []`).

**Plan integrity.** After the edit, `plan.json` parses and still has 49 targets. Every Layer 5
target except the two calculus lemmas has "N second countable". A diff against the previous file
shows only the ten inserted strings. The file keeps its one-space JSON indentation and trailing
newline.

**Suggested.lean.** The design stage has no `Suggested.lean` among the files this job may edit.
So there was no `#check @name` binder audit and no Lean command was run, and no Lean name changed.

**Ownership.** This round states no new object, construction or target, so it raises no ownership
question. No cross-roadmap citation changed.

## For the maintainer

- No name, section or id that another roadmap could cite changed.
- The manifest edit only adds section labels to `cited_for`. No `url`, `sha256`, `status` or
  locator changed.
- No suspicious instruction appeared in the review text.
