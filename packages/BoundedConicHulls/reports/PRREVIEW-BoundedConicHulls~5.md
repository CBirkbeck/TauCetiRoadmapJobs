# Review of BoundedConicHulls (pull request #2215 at ccbb181)

**Verdict:** needs changes

**Summary.** Needs changes: one finding, carried from the previous review and not addressed by this head. The roadmap still plans only the boxed corollary of the conic-union hull theorem that its own sources state without a box, and excludes the general statement from scope. The change since `3edf06d` moves three README sections without altering a word, and introduces no new problem. There is one small correction (the description names the previous head) and no format note; the scope choice the author states in the description is put to the human reviewers.

## R01 (P2) — The sources' unboxed conic-union hull theorem is still excluded; `hull_exact` is its boxed special case

A library user whose branches are unbounded, or bounded by something other than a coordinate box, gets nothing from this roadmap, although the theorem the roadmap cites as its source covers them; and a later roadmap that plans the general theorem would have to restate 2.1 and 3.2 as corollaries. A roadmap states its results at the generality its sources support, with special cases as consequences.

The exclusion is unchanged at this head: `TauCetiRoadmap/BoundedConicHulls/README.md` line 314, "Unbounded unions, common-summand theorems, … are outside this bounded roadmap", and line 211, "this is the stated bounded variant, not their full unboxed theorem". Bernal Neira–Grossmann, arXiv v3, Theorem 1 (BG21 lines 349–385, pp. 7–8) has no box: for `P i = {x | A i x ≽ b i}` it gives `conv ⋃ P i ⊆ proj`, the reverse inclusion into the closure when every `P i` is nonempty, and equality when `P i = S i + W`. The boxed statement follows from an unboxed one: take residual rows `(A x − b, x − l, u − x)` and the cone `K × ℝⁿ₊ × ℝⁿ₊`; the unboxed lift for these data is exactly `lift D K`, and `(A w, w, −w)` in that cone forces `w ≥ 0` and `−w ≥ 0`, so `w = 0` (proved in a scratch Lean file at the pin). The general statement elaborates at the pin with `PointedCone ℝ (E i)` for arbitrary real modules `E i`.

The smallest change: add a section to Layer 2 for the unboxed lift `conicLift A b K = {∑ i, v i | 0 ≤ w i, ∑ i, w i = 1, A i (v i) − w i • b i ∈ K i}` with (a) `convexHull ℝ (⋃ i, P i) ⊆ conicLift` (BG21 Theorem 1; Ben-Tal–Nemirovski Proposition 3.3.5); (b) `conicLift ⊆ closure (convexHull ℝ (⋃ i, P i))` when every `P i` is nonempty (BG21 Theorem 1(1)); (c) equality when `∀ i w, A i w ∈ K i → w = 0`, empty branches allowed; (d) equality and the closure statement when `P i = S i + W` with `S i` nonempty, compact and convex and `W` closed and convex (BG21 Theorem 1(2)). Then derive `hull_exact` from (c) with the augmented cone, state (b) and (c) in `Suggested.lean`, and drop "Unbounded unions, common-summand theorems" from line 314 and the qualifying clauses at lines 211 and 280. A negative control for (b) and (c): `P₁ = {0}` (`A = id`, `b = 0`, `K = {0}`) and `P₂ = ∅` (`A = 0`, `b = 1`, `K = {0}`) give `conicLift = ℝ` while the hull and its closure are `{0}`. The existing section numbers 2.1 and 3.2 can stay if the new section is numbered 2.2.

## C01 — The description names the previous head as the current one and does not mention the reordering

The description says "Required pull-request CI for current head `3edf06d41f58d62576d7d1c795929d3298fba256` passed"; the head is now `ccbb181`, whose only change is that "Scope and ownership" and "Exact supplier contracts" moved after the layers and "How to read the build" moved up, with no wording changed. A reader checking the CI claim is sent to a run for another commit. Name the head the run was for as an earlier head, or cite the run for `ccbb181`, and add a clause that the latest commit only reorders README sections.

## Previous findings

- R01 — not repaired: line 314, "Unbounded unions, common-summand theorems, … are outside this bounded roadmap"; line 211, "this is the stated bounded variant, not their full unboxed theorem". Carried as R01.
- R02 — repaired (at the previous head; unchanged here): lines 124–126, "as the only branch, `λ = 1` forces the residual `−1 ∉ {0}`, so `L = P = ∅`."
- R03 — repaired (at the previous head; unchanged here): the description lists five headline signatures and "arbitrary closed sets `K i`".

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| The reordered README | sorted lines of the README at `3edf06d` against this head | identical multisets of lines: 37 lines moved, none altered; 22 headings, same ids 1.1–3.2 | pure move | none |
| "above"/"below" pointers after the move | line 68 "the empty branch above"; line 379 "the native interfaces above"; *Needs:* of 2.1, 3.1 | each points to text still before it (1.1; Conventions and supplier table); *Needs:* name suppliers by kind, not position | still true | none |
| `hull_exact` against R01 (c) | cone `K × ℝⁿ₊ × ℝⁿ₊`, map `w ↦ (A w, w, −w)` | residual `(A v − λb, v − λl, λu − v)` reproduces the four constraints of `lift`; `w ≥ 0 ∧ −w ≥ 0 ⇒ w = 0` (Lean probe) | special case | R01 |
| `closed_hull_exact` against the R01 control | `P₁ = {0}`, `P₂ = ∅`; box `[−1,1]` and no box | box: `λ₂ = 0` forces `v₂ = 0`, `P = {0}`. No box: `w = (1,0)`, `v = (0,x)` admissible for every `x` (Lean probe), lift `= ℝ` | boxed agrees; unboxed needs (b)/(c) hypotheses | R01 |
| R01 (c) signature | `E i` arbitrary real modules, `K i : PointedCone ℝ (E i)` | elaborates at the pin with `sorry` only | statable | R01 |
| 2.1 source connection (cited by the moved scope text) | BG21 v3 lines 349–385 | Theorem 1: inclusion with no hypothesis; (1) nonempty `P i` gives closure bound; (2) `S i + W` gives equality; no box anywhere | README's description of the source is accurate | none |

The rows of the earlier reviews for the untouched statements stand as in the previous review, of `3edf06d`.

- **Sources:** 1 locator checked against the text: BG21 arXiv v3, Theorem 1, lines 349–385 (pp. 7–8); HR-Cone at lines 388–405 read alongside.
- **Library declarations:** 3 opened at Mathlib `1b1ccf4`: `PointedCone.positive`, `PointedCone.mem_positive` (used in the probe), `convexHull_union` (`Mathlib/Analysis/Convex/Join.lean`:174, the nonempty two-set join formula; not a match for any target).
- **Cross-roadmap citations:** the README cites none; none unresolved.
- **Overlap check:** read ExactPenalties, InteriorPointMethods, ExponentialCone, ConvexLifting, FiniteAffineBoundTightening; nothing shared (ExponentialCone on main explicitly leaves general GDP hulls outside its scope). The results-closest list is empty.
- **Dependency check:** `depcheck: 122 roadmaps, 1386 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing outside the folder changes.
- **Automatic checks:** rerun at `ccbb181`: every check 0, OK.
- **Elaboration:** `lake env lean` on `Suggested.lean`: 5 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since the previous review, so the `#check @` types of its 14 declarations stand; the two definitions without `[Fintype ι]` (`branch`, `boundedUnion`) do not use it.
- Source independence: changed passages only: the 3 moved passages (reading guide, scope, supplier contracts) compared with 1 source (BG21 lines 340–410), none shared and no wording changed; largest share BG21, 5 of 15 locator sites (level with Ben-Tal–Nemirovski); contents not compared again, since no layer was added, removed or reordered.
- Research link: `hull_exact` and `closed_hull_exact` are the boxed case of the conic-union hull theorem of Ben-Tal–Nemirovski (2001, Proposition 3.3.5) used by Bernal Neira–Grossmann (2024, Theorem 1 and HR-Cone) for hull reformulations of generalized disjunctive programs; rests on the README's references and BG21 lines 349–405.

## Not verifiable

- BG21, published version (Comput. Optim. Appl. 88, 2024), pp. 259–260: paywalled, not read; arXiv v3 read instead.

## Source issues

- none

## For the human reviewers

- Scope: the description says the author "chose to keep that scope when the broader unboxed extension was proposed". R01 has now been carried through several reviews on the generality rule; whether the boxed scope is acceptable is yours to decide.
- Licence: README lines 374–380 say the construction exists in the author's own repository `bernalde/complete-retained-library` (Apache-2.0) and ask implementers to reuse its proof strategy "preserving applicable software attribution"; the Lean definitions may be adapted from it.
