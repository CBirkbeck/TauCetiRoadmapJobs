# Review of BoundedConicHulls (pull request #2215 at ccbb181)

**Verdict:** needs changes

**Summary.** Needs changes: one finding, carried from the previous review, and the files have not changed since. The roadmap still plans only the boxed corollary of the conic-union hull theorem that its own sources state without a box, and excludes the general statement from scope. The rewritten description now names the right head and states the reordering, and every claim in it that can be checked agrees with the head; there are no small corrections and no format notes. The scope choice the author states in the description is put to the human reviewers.

## R01 (P2) — The sources' unboxed conic-union hull theorem is still excluded; `hull_exact` is its boxed special case

A library user whose branches are unbounded, or bounded by something other than a coordinate box, gets nothing from this roadmap, although the theorem the roadmap cites as its source covers them; and a later roadmap that plans the general theorem would have to restate 2.1 and 3.2 as corollaries. A roadmap states its results at the generality its sources support, with special cases as consequences.

The exclusion stands at this head: `TauCetiRoadmap/BoundedConicHulls/README.md` line 314, "Unbounded unions, common-summand theorems, … are outside this bounded roadmap", and line 211, "this is the stated bounded variant, not their full unboxed theorem"; the description repeats it ("remain outside the selected scope"). Bernal Neira–Grossmann, arXiv v3, Theorem 1 (BG21 lines 349–385, pp. 7–8) has no box: for `P i = {x | A i x ≽ b i}` it gives `conv ⋃ P i ⊆ proj`, the reverse inclusion into the closure when every `P i` is nonempty, and equality when `P i = S i + W`. The boxed statement follows from an unboxed one: take residual `(A x − b, x − l, u − x)` and the cone `K × ℝⁿ₊ × ℝⁿ₊`; the unboxed lift for these data is exactly `lift D K`, and `(A w, w, −w)` in that cone forces `w ≥ 0` and `−w ≥ 0`, hence `w = 0`. Under the hypothesis `∀ i w, A i w ∈ K i → w = 0` the unboxed equality has the same proof as 2.1: a zero weight gives `A i (v i) ∈ K i`, so `v i = 0`; a positive weight normalizes into `P i`; one-hot points lift because `0 ∈ K j`. The general statement elaborates at the pin with `PointedCone ℝ (E i)` over arbitrary real modules `E i`.

The smallest change: add a section to Layer 2 for the unboxed lift `conicLift A b K = {∑ i, v i | 0 ≤ w i, ∑ i, w i = 1, A i (v i) − w i • b i ∈ K i}` with (a) `convexHull ℝ (⋃ i, P i) ⊆ conicLift` (BG21 Theorem 1; Ben-Tal–Nemirovski Proposition 3.3.5); (b) `conicLift ⊆ closure (convexHull ℝ (⋃ i, P i))` when every `P i` is nonempty (BG21 Theorem 1(1)); (c) equality when `∀ i w, A i w ∈ K i → w = 0`, empty branches allowed; (d) equality and the closure statement when `P i = S i + W` with `S i` nonempty, compact and convex and `W` closed and convex (BG21 Theorem 1(2)). Then derive `hull_exact` from (c) with the augmented cone, state (b) and (c) in `Suggested.lean`, and drop "Unbounded unions, common-summand theorems" from line 314 and the qualifying clauses at lines 211 and 280. A negative control for (b) and (c): `P₁ = {0}` (`A = id`, `b = 0`, `K = {0}`) and `P₂ = ∅` (`A = 0`, `b = 1`, `K = {0}`) give `conicLift = ℝ` while the hull and its closure are `{0}`. The section numbers 2.1 and 3.2 can stay if the new section is numbered 2.2.

## Previous findings

- R01 — not repaired: README line 314, "Unbounded unions, common-summand theorems, … are outside this bounded roadmap"; line 211, "this is the stated bounded variant, not their full unboxed theorem". Files unchanged. Carried as R01.
- C01 (small correction) — repaired: the description now reads "Required pull-request CI for current head `ccbb1818…` passed in run 45635808167" and "The latest commit only reorders `README.md` sections … with no wording changes."

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| `hull_exact` against R01 (c) | cone `K × ℝⁿ₊ × ℝⁿ₊`, map `w ↦ (A w, w, −w)` | residual `(A v − λb, v − λl, λu − v)` gives the four constraints of `lift`; `0 ≤ w ∧ 0 ≤ −w ⇒ w = 0` (Lean probe closes) | special case | R01 |
| `closed_hull_exact` against the R01 control | `P₁ = {0}`, `P₂ = ∅`; box `[−1,1]` and no box | box: `λ₂ = 0` forces `v₂ = 0`, `P = {0}`. No box: `w = (1,0)`, `v = (0,x)` admissible for all `x` (Lean probe), lift `= ℝ` | boxed agrees; unboxed needs (b)/(c) hypotheses | R01 |
| R01 (c) signature | `E i` arbitrary real modules, `K i : PointedCone ℝ (E i)` | elaborates at the pin, `sorry` the only warning | statable | R01 |
| Description: "five headline theorem signatures (`hull_exact`, …, `closed_hull_exact`)" | `Suggested.lean` lines 65–94 | 5 theorems with those names, 9 definitions, 5 `sorry` warnings | true | none |
| Description: "`Suggested.lean` differs only in comments from … `a24ef8d5`" | diff of the file between `a24ef8d` and head | 8 insertions, 6 deletions: 6 docstrings reworded, 1 section comment added; no other token | true | none |
| Description: "The latest commit only reorders `README.md` sections" | head README lines 8, 307, 318 | "How to read the build" before Conventions; scope and supplier contracts after Layer 3; previous review found identical line multisets | true | none |
| Description: CI "for current head `ccbb1818…` passed in run 45635808167" | the run's record | head `ccbb1818…`, completed, success, job `build` success | true | none |
| Description: "Lean `v4.36.0-rc2` / Mathlib `1b1ccf4`" | toolchain file and manifest | `leanprover/lean4:v4.36.0-rc2`; Mathlib rev `1b1ccf4b…` | true | none |
| Description: scope sentences ("arbitrary closed sets `K i`", "Unbounded unions … remain outside") | README lines 248, 274, 311–316 | 3.1 for closed sets, 2.1 and 3.2 for `PointedCone`; exclusions as line 314 lists | agrees with head | none (see R01) |

The rows of the earlier reviews for the untouched statements stand as in the previous review, of `ccbb181`.

- **Sources:** 1 locator checked against the text: BG21 arXiv v3, Theorem 1, lines 349–385 (pp. 7–8), with HR-Cone at lines 388–405; no box in Theorem 1, the scaled bounds appear only in HR-Cone (line 401).
- **Library declarations:** none newly opened; the probe uses `PointedCone` and `convexHull` at Mathlib `1b1ccf4`.
- **Cross-roadmap citations:** the README cites none; none unresolved.
- Overlap check: read ExponentialCone, ConvexLifting, FiniteAffineBoundTightening (main) and searched the open heads, ExactPenalties and InteriorPointMethods among them, for union hulls; nothing shared (ExponentialCone, lines 49 and 392, leaves boxed-union hulls to this roadmap).
- **Dependency check:** `depcheck: 122 roadmaps, 1385 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the folder changes.
- **Automatic checks:** rerun at `ccbb181`: every check 0, OK.
- **Elaboration:** `lake env lean` on `Suggested.lean`: 5 `sorry` warnings and nothing else; the file is unchanged, so the `#check @` types of the previous review stand (`branch` and `boundedUnion` lack `[Fintype ι]` and do not use it).
- Source independence: changed passages only: the rewritten description (5 paragraphs) compared with 1 source (BG21 lines 340–410), none shared; largest share BG21, 5 of 15 locator sites (level with Ben-Tal–Nemirovski); contents not compared again, since no layer was added, removed or reordered.
- Research link: `hull_exact` and `closed_hull_exact` are the boxed case of the conic-union hull theorem of Ben-Tal–Nemirovski (2001, Proposition 3.3.5) used by Bernal Neira–Grossmann (2024, Theorem 1 and HR-Cone) for hull reformulations of generalized disjunctive programs; rests on the README's references and BG21 lines 349–405.

## Not verifiable

- BG21, published version (Comput. Optim. Appl. 88, 2024), pp. 259–260: paywalled, not read; arXiv v3 read instead.
- The description's "New private checks … establish eleven example and membership results" and their axiom reports: the checks are not in the pull request.
- The description's "Lean setup and Build were skipped" and the earlier run 43126989416: only the conclusion and head of run 45635808167 were read.

## Source issues

- none

## For the human reviewers

- Scope: the description says the author "chose to keep that scope when the broader unboxed extension was proposed". R01, the only finding, has been carried through several reviews on the generality rule; whether the boxed scope is acceptable is yours to decide.
- Licence: README lines 374–380 say the construction exists in the author's own repository `bernalde/complete-retained-library` (Apache-2.0) and ask implementers to reuse its proof strategy "preserving applicable software attribution"; the Lean definitions may be adapted from it.
