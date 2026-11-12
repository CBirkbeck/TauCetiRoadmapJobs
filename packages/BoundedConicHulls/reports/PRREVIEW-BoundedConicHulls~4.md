# Review of BoundedConicHulls (pull request #2215 at 3edf06d)

**Verdict:** needs changes

## R01 (P2) — The sources' unboxed conic-union hull theorem is still excluded; only its boxed corollary is planned

- **Location:** `TauCetiRoadmap/BoundedConicHulls/README.md` line 15, "Unbounded unions, common-summand theorems, general extended-valued perspectives, … are outside this bounded roadmap"; line 243, "this is the stated bounded variant, not their full unboxed theorem".
- **Claim:** This finding is carried from the last two reviews and is still not repaired. `hull_exact` is a special case of the sources' theorem, which has no box. Planning only the special case narrows the library below what its sources prove. The description says the author "chose to keep that scope". That records a preference. It does not show that the general statement is false or out of reach.
- **Witness:** BG21 v3 lines 349–385 (pp. 7–8) state `conv ⋃ P i ⊆ proj` and the closure bound for nonempty `P i`, without a box. For the rows `(A x − b, x − l, u − x)`, `(A w, w, −w) ∈ K × ℝⁿ₊ × ℝⁿ₊` forces `w = 0`, which is hypothesis (c).
- **Repair:** Add `### 2.1 Unboxed lift` and renumber the exact hull as 2.2. Update the 3.2 *Needs:* line, which reads "2.1, 3.1".
  - **Definition.** Let the residual spaces be real vector spaces `E i`. Define `conicLift A b K = {∑ i, v i | (∀ i, 0 ≤ w i), ∑ i, w i = 1, ∀ i, A i (v i) − w i • b i ∈ K i}`, with `K i : PointedCone ℝ (E i)` and `P i = {x | A i x − b i ∈ K i}`.
  - **(a)** Prove `convexHull ℝ (⋃ i, P i) ⊆ conicLift A b K` (BG21 Theorem 1; BTN01 Proposition 3.3.5, p. 100).
  - **(b)** Prove `conicLift A b K ⊆ closure (convexHull ℝ (⋃ i, P i))` when every `P i` is nonempty (BG21 Theorem 1(1); BTN01, proof, pp. 100–101).
  - **(c)** Prove `conicLift A b K = convexHull ℝ (⋃ i, P i)` when `∀ i w, A i w ∈ K i → w = 0`. Empty `P i` are allowed.
  - **(d)** Prove the equality and the closure statement when `P i = S i + W`, with each `S i` nonempty, compact and convex and `W` closed and convex (BG21 Theorem 1(2); BTN01 Proposition 3.3.5(ii)).
  - **Derive `hull_exact` from (c).** Use the cone `(K i).prod ((PointedCone.positive ℝ X).prod (PointedCone.positive ℝ X))`, built with Mathlib `Submodule.prod`. If `(A w, w, −w)` lies in this cone, then `w = 0`.
  - **Negative control for (b) and (c).** Take `P₁ = {0}` (`A = id`, `b = 0`, `K = {0}`) and `P₂ = ∅` (`A = 0`, `b = 1`, `K = {0}`). Then `conicLift = ℝ`, while the hull and its closure are `{0}`.
  - **`Suggested.lean`.** State (b) and (c) there.
  - **Scope.** Delete "Unbounded unions, common-summand theorems" from line 15, the clause at line 243, and "with the same bounded-variant qualification as 2.1" at line 312. Delete "Unbounded unions, common-summand theorems" from the description's scope sentence.

## Previous findings

- R01 — not repaired: line 15, "Unbounded unions, common-summand theorems, … are outside this bounded roadmap"; line 243, "this is the stated bounded variant, not their full unboxed theorem". Carried over as R01.
- R02 — repaired: lines 156–158 now read "With the empty branch of 1.1 (`A = 0`, `b = 1`, `K = {0}`, box `[0,1]`) as the only branch, `λ = 1` forces the residual `−1 ∉ {0}`, so `L = P = ∅`."
- R03 — repaired: the description now says "five headline theorem signatures (`hull_exact`, `isCompact_lift`, `isCompact_fullLift`, `isCompact_projection`, `closed_hull_exact`), each with intentional `sorry`" and "arbitrary closed sets `K i`". `grep -c '^theorem'` gives 5.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.2 `projection`, new Check (l. 156–158) | one branch: `A = 0`, `b = 1`, `K = {0}`, box `[0,1]` | `λ = 1`, residual `0 − 1 = −1 ∉ {0}`, so `L = P = ∅`; proved in a Lean probe on the real definitions | holds | none |
| same Check, wrong models | residual dropped; `P` taken to be the box | `(1, x)` is admissible for every `x ∈ [0,1]`, so `P = [0,1]` (Lean probe); box `= [0,1]` | discriminates | none |
| 1.4 all-empty claim (l. 206) against the new Check | empty-branch property on that branch | `λ = 0` contradicts `∑ λ = 1`, so `P = ∅`, as in the Check | agree | none |
| 1.2 locator (seeded) | BG21 v3 lines 388–405, page 8 (markers at lines 352 and 415) | HR-Cone: `A v ≽_K y b`, `x^l y ≤ v ≤ x^u y`, `∑ y = 1`, `x = ∑ v`; `lift` is this with real weights | matches | none |
| `hull_exact` from R01 (c) | augmented cone `K × ℝⁿ₊ × ℝⁿ₊` with map `w ↦ (A w, w, −w)` | `w ≥ 0` and `−w ≥ 0`, so `w = 0` (Lean probe); the augmented lift is `lift D K` | special case | R01 |
| `closed_hull_exact` against the R01 control | `P₁ = {0}`, `P₂ = ∅`, with box `[−1,1]` and without | box: `λ₂ = 0`, `v₂ ∈ [0,0]`, `P = {0} = closure conv U`. No box: `v₂` free, `conicLift = ℝ ≠ {0}` | boxed case agrees; unboxed needs the (b)/(c) hypotheses | R01 |
| R01 (c) signature | `E i` arbitrary real modules, `K i : PointedCone ℝ (E i)` | the scratch probe elaborates with `sorry` only | statable | R01 |

The rows of the previous review for the untouched statements (`branch`, `sumBlocks`, 1.3, 1.4, `isCompact_lift`, `isCompact_fullLift`, `isCompact_projection`, the other locators) stand as in the previous review, of `a6a21ae`.

- **Sources:** 1 locator checked against the text: BG21 arXiv v3 lines 388–405 (HR-Cone, p. 8).
- **Library declarations:** 3 opened at `1b1ccf4`: `Submodule.prod` (`Mathlib/LinearAlgebra/Span/Basic.lean`:383), `PointedCone.positive` and `PointedCone.mem_positive` (`Mathlib/Geometry/Convex/Cone/Pointed.lean`:304, :308).
- **Cross-roadmap citations:** the README cites none, and the resolver reports no unresolved name.
- **Overlap check:** read FiniteAffineBoundTightening and ExactPenalties; nothing shared. The main-closest and results-closest lists are empty.
- **Dependency check:** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. Nothing outside the folder changes.
- **Gate:** rerun at 3edf06d: OK, every check 0. The worker's targeted build check is 0.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives only 5 `sorry` warnings. The `#check @` types of all 14 declarations are unchanged, since `Suggested.lean` is unchanged since `a6a21ae`.
- **Description:** checked against this head. The comment-only diff of `Suggested.lean` since `a24ef8d` and "changes only `README.md`" both hold.

## Not verifiable

- BG21, published version (Comput. Optim. Appl. 88, 2024), HR-Cone, p. 260: paywalled (DOI prefix 10.1007), so not read. arXiv v3 was read instead.

## Source issues

- none
