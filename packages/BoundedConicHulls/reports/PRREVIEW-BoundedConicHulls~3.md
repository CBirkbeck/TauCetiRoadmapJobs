# Review of BoundedConicHulls (pull request #2215 at a6a21ae)

**Verdict:** needs changes

## R01 (P2) — The sources' unboxed conic-union hull theorem is still excluded; only its boxed corollary is planned

- **Location:** `TauCetiRoadmap/BoundedConicHulls/README.md` line 15, "Unbounded unions, common-summand theorems, general extended-valued perspectives, … are outside this bounded roadmap"; line 242, "this is the stated bounded variant, not their full unboxed theorem".
- **Claim:** This is the previous review's R01, still not repaired. The roadmap states the box-scaled lift only. The sources' theorem has no box, and `hull_exact` is an instance of it. That narrows the library below its sources.
- **Witness:** BG21 v3 lines 349–385 (pp. 7–8) state `conv ⋃ P i ⊆ proj P` without a box, plus the closure bound for nonempty `P i` and the common-summand equality. `hull_exact` is (c) below, for the rows `(A i x − b i, x − l, u − x)`.
- **Repair:** Add `### 2.1 Unboxed lift` and renumber the exact hull as 2.2.
  - **Definition.** `conicLift A b K = {∑ i, v i | (∀ i, 0 ≤ w i), ∑ i, w i = 1, ∀ i, A i (v i) − w i • b i ∈ K i}`, with `K i : PointedCone ℝ (Vec (m i))` and `P i = {x | A i x − b i ∈ K i}`.
  - **(a)** `convexHull ℝ (⋃ i, P i) ⊆ conicLift A b K` (BG21 Theorem 1; BTN01 Proposition 3.3.5, p. 100).
  - **(b)** `conicLift A b K ⊆ closure (convexHull ℝ (⋃ i, P i))` when every `P i` is nonempty (BG21 Theorem 1(1); BTN01, proof, pp. 100–101).
  - **(c)** `conicLift A b K = convexHull ℝ (⋃ i, P i)` when `∀ i w, A i w ∈ K i → w = 0`. Empty `P i` are allowed. Give it the bounded-variant qualification that 2.1 carries now.
  - **(d)** The equality and its closure when `P i = S i + W`, with each `S i` nonempty, compact and convex and `W` closed and convex (BG21 Theorem 1(2); BTN01 Proposition 3.3.5(ii)).
  - **Derive `hull_exact` from (c).** Apply (c) to the box-augmented rows: if `(A w, w, −w) ∈ K × ℝⁿ₊ × ℝⁿ₊` then `w = 0`.
  - **Negative control for (b) and (c).** Take `P₁ = {0}` (`A = id`, `b = 0`, `K = {0}`) and `P₂ = ∅` (`A = 0`, `b = 1`, `K = {0}`). Then `conicLift = ℝ`, but the hull and its closure are `{0}`.
  - **`Suggested.lean`.** State (b) and (c) there. Both signatures elaborate at the pin (see the table).
  - **Scope.** Delete "Unbounded unions, common-summand theorems" from line 15 and the clause at line 242.

## R02 (P3) — The rewritten third Check of `projection` says nothing about `P`

- **Location:** `README.md` lines 156–157, "For the interval lift `λ = 1`, `v = 1/2`, the projected point is `1/2`; changing only that point to `0` violates the sum equality."
- **Claim:** `0 ∈ P` regardless, through another lift. The Check is a fact about one pair (the `fullLift` Check at lines 169–170), not about `P`. It also holds when `P` is wrongly taken to be the box, or when the residual condition is dropped.
- **Witness:** For the interval branch, `(λ, v) = (1, 0)` satisfies `0 ∈ {0}` and `0 ≤ 0 ≤ 1`, so `0 = sumBlocks (1, 0) ∈ P`.
- **Repair:** Replace the bullet with: "With the empty branch of 1.1 (`A = 0`, `b = 1`, `K = {0}`, box `[0,1]`) as the only branch, `λ = 1` forces the residual `−1 ∉ {0}`, so `L = P = ∅`. Dropping the residual condition, or taking `P` to be the box, would give `[0,1]`."

## R03 (P3) — The description still counts ten headline signatures; the file has five

- **Location:** Pull-request description: "`Suggested.lean` has complete data definitions and ten headline target signatures with intentional `sorry` proofs".
- **Claim:** This is the previous review's R08, still not repaired. The sentence was written for the first head.
- **Witness:** `grep -c '^theorem' Suggested.lean` at a6a21ae gives 5: `hull_exact`, `isCompact_lift`, `isCompact_fullLift`, `isCompact_projection` and `closed_hull_exact`.
- **Repair:** Change the sentence to: "`Suggested.lean` has the data definitions and five headline theorem signatures (`hull_exact`, `isCompact_lift`, `isCompact_fullLift`, `isCompact_projection`, `closed_hull_exact`), each with `sorry`." In the first paragraph, change "arbitrary closed row sets" to "arbitrary closed sets `K i`".

## Previous findings

- R01 — not repaired: line 15, "Unbounded unions, common-summand theorems, … are outside this bounded roadmap"; line 242, "this is the stated bounded variant, not their full unboxed theorem". Carried over as R01.
- R02 — repaired: Layers 1–3 end with `### Examples` and `### Dependencies` (lines 216/221, 262/268, 320/325). In the Layer 2 example, weights `(2-x,x-1)` and blocks `(2-x,2(x-1))` sum to `x`.
- R03 — repaired: line 177 "prove the zero-block property", line 199 "prove the normalization property", line 233 "prove that `L` and `P` are convex". The gate reports `readme-ids-missing=0`.
- R04 — repaired: lines 140, 153, 192, 254–257, 289–295 and 316–317 carry the requested instances and values. The rewritten line 156 is a new defect, R02.
- R05 — repaired: line 178, "(Gusev–Bernal Neira, arXiv v2, Proposition 1, p. 8, zero-weight proof; … preceding Proposition 2, p. 10)"; lines 200–202, BTN01 p. 101 and (3.3.24), p. 100.
- R06 — repaired: line 363, `https://doi.org/10.1007/s101070050106`. Crossref resolves it to Ceria–Soares, Math. Program. 86 (1999), 595–614.
- R07 — repaired: no "row" remains in either file. `Suggested.lean` line 34 is `/-! ## Layer 1: scaled boxes and branch interfaces -/`.
- R08 — not repaired: the description still says "ten headline target signatures with intentional `sorry` proofs". Carried over as R03.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `branch`, `n = 0` Check (l. 86) | `Vec 0 = {0}`; `b = 0`, `K = {0}`; `b = 1`, `K = [0,∞)` | residual `= −b`: `0 ∈ {0}` gives `B = {0}`; `−1 ∉ [0,∞)` gives `B = ∅` | holds | none |
| 1.2 `lift` API (l. 118) | Lean `lift`, l. 47 | `D.map i (p.2 i) - p.1 i • D.offset i ∈ K i` matches `A i (v i) - λ i • b i ∈ K i` | agree | none |
| 1.2 `sumBlocks` Check (l. 140) | `ι = Fin 3`, `p.2 = Pi.single 1 w`; wrong model `p.2 0` | `∑ = w`; wrong model gives `0 ≠ w` for `w ≠ 0` | discriminates | none |
| 1.2 `projection` Checks (l. 153, 156) | interval branch; weight-sum model; `(1,0)` | `L = {(1,v) : 0≤v≤1}`, so `P = [0,1]`; weights give `{1}`; `0 ∈ P` anyway | l. 153 holds; l. 156 vacuous | R02 |
| R02 replacement | single branch `A = 0`, `b = 1`, `K = {0}`, box `[0,1]` | `λ = 1`, residual `−1 ∉ {0}`: `L = P = ∅`; without the residual condition or with `P` = box: `[0,1]` | discriminates | R02 |
| 1.3 zero-block, `l > u` Check (l. 177, 192) | `λ i = 0`; `l = 2`, `u = 1` | `0 ≤ v ≤ 0`; `2λ ≤ v ≤ λ` forces `λ ≤ 0`, so `∑ λ = 0 ≠ 1` and `L = ∅` | holds | none |
| 1.3 locator | GN25 lines 350, 378 (printed p. 8), 460 (printed p. 10) | Proposition 1, case `y = 0`: finite bounds force `v = 0`; the same before Proposition 2 | matches | none |
| 1.4 normalization, one-hot, empty branch (l. 199–205) | `λ = ½`, `v = ¼`; one-hot of `x ∈ B i`; `B i = ∅` | `2·¼ = ½ ∈ [0,1]`; other branches have residual `0 ∈ K j`; `λ i > 0` gives a point of `∅`, so `λ i = v i = 0` | holds | none |
| 1.4 locator | BTN01 lines 6727–6734 (p. 100), 6763–6769 (p. 101) | (3.3.24): `ξ i = t i x i`; p. 101: divide by `t_{i,ε} > 0` | matches | none |
| Layer 1 Examples (noncone control) | `A = 0`, `b = −2`, `K = {1}`, box `[0,1]` | `2 ∉ {1}`, so `U = ∅`; `0 + 2·½ = 1 ∈ {1}`; `v = (0,0)` gives 0, `v = (½,½)` gives 1 | holds | none |
| `hull_exact`, nonsalient Check (l. 254–257) | `K₁ = [0,∞)`, `K₂ = ℝ²`, box `[0,1]` | `B₁ = B₂ = [0,1]`; `λ = v = (½,½)`: `½ ≥ 0`, `0 ≤ ½ ≤ ½`, sum `1` | holds | none |
| `hull_exact`, Layer 2 Examples (l. 264–266) | `x ∈ [1,2]`, `λ = (2−x, x−1)`, `v = (2−x, 2(x−1))` | residuals `0 ≤ 0`, `0 ≥ 0`; `2(x−1) ≤ 3(x−1)`; sum `x`; `x = 3/2` gives `v = (½,1)`, as at l. 253 | holds | none |
| `isCompact_lift`, Checks (l. 289–295) | two intervals; `n = 0`, `m = (0,1)` | `0 ≤ v₁ ≤ s`, `2−2s ≤ v₂ ≤ 3−3s`, sums `[2−2s, 3−2s]` cover `[0,3]`; `−λ₂ ≥ 0` gives `L = {((1,0),0)}` | holds | none |
| `closed_hull_exact`, Check (l. 316–317) | `K₁ = [0,∞)`, `K₂ = ℝ²` (closed); `ι = ∅` | `closure (conv [0,1]) = [0,1] = P`; `∅ = ∅` | holds | none |
| R01 (c) gives `hull_exact` | rows `(A x − b, x − l, u − x)`, cone `K × ℝⁿ₊ × ℝⁿ₊` | `w ≥ 0` and `−w ≥ 0`, so `w = 0`; the augmented lift is the boxed `L` | consistent | R01 |
| R01 controls for (b), (c) | `P₁ = {0}`, `P₂ = ∅` (`A₂ = 0`, `b₂ = 1`) | `λ₂ = 0`, `v₁ = 0`, `v₂` free: lift `= ℝ`; hull and closure `{0}` | hypotheses needed | R01 |
| R01 signatures | `conicLift`; (b) `⊆ closure`; (c) `= convexHull` | the scratch probe elaborates both with `sorry` only | statable | R01 |

The diff changes no Lean statement. The rows of the previous review for `isCompact_fullLift`, `isCompact_projection`, the closedness control and the other source locators stand as in the previous review of a24ef8d.

- **Sources:** 6 locators checked against the text: GN25 lines 350, 378 and 460; BTN01 lines 6727–6734 and 6763–6769; BG21 v3 lines 349–385. The Ceria–Soares DOI resolves through Crossref.
- **Library declarations:** the 13 Mathlib names in the new Dependencies subsections and 1.4 elaborate with `#check @` at `1b1ccf4`, e.g. `PointedCone.smul_mem` and `PointedCone.smul_mem_iff` (`Mathlib/Geometry/Convex/Cone/Pointed.lean`:128 and :131).
- **Cross-roadmap citations:** the README cites no roadmap, and the citation resolver finds no unresolved name.
- **Overlap check:** read FiniteAffineBoundTightening and ExactPenalties; nothing shared. The main-closest and results-closest lists are empty. A search for disjunctive and convex-hull-of-union owners finds only this roadmap.
- **Dependency check:** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. Nothing outside the folder changes.
- **Gate:** rerun at a6a21ae: OK, every check 0. The worker's build check is 0.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives only 5 `sorry` warnings. The `#check @` types of all 14 declarations are those of a24ef8d, since the diff touches only docstrings and the Layer 1 comment.

## Not verifiable

- BG21, published version (Comput. Optim. Appl. 88, 2024), "equation (2)", pp. 259–260, and HR-Cone, p. 260: not read. arXiv v3 was read instead, where the display is numbered (3.2) (line 369).
- Ceria–Soares (Math. Program. 86, 1999), Theorem 1, pp. 600–601: paywalled, so uncertified. Only the DOI metadata was checked.

## Source issues

- **Gap** in BG21 at Theorem 1, arXiv v3 pp. 7–8: the source states the hull sandwich for arbitrary proper cones but proves it only by citing Ben-Tal–Nemirovski, whose proposition covers products of Lorentz cones; it should note that the argument uses only that each `K i` is a convex cone; affects the proof.
