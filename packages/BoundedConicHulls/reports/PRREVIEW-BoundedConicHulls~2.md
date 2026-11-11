# Review of BoundedConicHulls (pull request #2215 at a24ef8d)

**Verdict:** needs changes

## R01 (P2) — The sources' unboxed conic-union hull theorem is still excluded; only its boxed corollary is planned

- **Location:** `TauCetiRoadmap/BoundedConicHulls/README.md` line 15, "Unbounded unions, common-summand theorems, … are outside this bounded roadmap"; line 221, "this is the stated bounded variant, not their full unboxed theorem".
- **Claim:** The previous review's R01 is not repaired. Only the box-scaled lift is planned. The sources' theorem for `P i = {x | A i x − b i ∈ K i}` with no box is excluded, although `hull_exact` is an instance of it and the general proof is the same. This narrows the library below its sources.
- **Witness:** BG21 v3 lines 349–384 and LTV19 lines 391–408 state `conv ⋃ P i ⊆ proj P`, the closure sandwich for nonempty `P i` and the common-summand equality, all without a box. `hull_exact` is (c) below for rows `(A i x − b i, x − l, u − x)`.
- **Repair:** Add `### 2.1 Unboxed lift` (the exact hull becomes 2.2), on `Vec n`, `Vec (m i)` and `K i : PointedCone ℝ (Vec (m i))`:
  - Define `conicLift A b K = {∑ i, v i | (∀ i, 0 ≤ w i), ∑ i, w i = 1, ∀ i, A i (v i) − w i • b i ∈ K i}`.
  - (a) `convexHull ℝ (⋃ i, P i) ⊆ conicLift A b K` (BG21 Theorem 1; BTN01 Proposition 3.3.5, p. 100).
  - (b) `conicLift A b K ⊆ closure (convexHull ℝ (⋃ i, P i))` when every `P i` is nonempty (BG21 Theorem 1(1); BTN01 proof, p. 101).
  - (c) `conicLift A b K = convexHull ℝ (⋃ i, P i)` when `∀ i w, A i w ∈ K i → w = 0`. Empty `P i` are allowed.
  - (d) `convexHull ℝ (⋃ i, P i) = conicLift A b K = closure (convexHull ℝ (⋃ i, P i))` when `P i = S i + W`, with each `S i` nonempty, compact and convex and `W` closed and convex (BG21 Theorem 1(2); BTN01 Proposition 3.3.5(ii)).

  Then:
  - Derive `hull_exact` from (c) applied to the box-augmented rows.
  - Add the negative control from the table to (b) and (c): two branches, `P₁ = {0}` and `P₂ = ∅`, give `conicLift = ℝ ≠ {0}`.
  - State (b) and (c) in `Suggested.lean`. Their signatures elaborate at the pin.
  - Delete "Unbounded unions, common-summand theorems" from Scope.

## R02 (P3) — No layer ends with `### Examples` and `### Dependencies`

- **Location:** `README.md`, the ends of Layers 1–3 (lines 205, 237, 278). At the previous head these subsections were at lines 103/110, 128/134 and 151/158.
- **Claim:** The restructuring dropped both required subsections from all three layers.
- **Witness:** `grep -c '^### Examples'` on this README gives 0. On main, `AdicSpacesPartII/README.md` and `CStarAlgebras/README.md` have one of each per layer.
- **Repair:** End each layer with the two subsections:
  - **Layer 1.**
    - `### Examples`: the interval branch `[0,1]` (`A = 0`, `b = 0`, `K = {0}`) with lift point `λ = 1`, `v = 1/2`, and the two-branch control of 1.4.
    - `### Dependencies`: Mathlib `Set.Icc`, `LinearMap`, `PointedCone.smul_mem_iff`, `Finset.single_le_sum`. No roadmap.
  - **Layer 2.**
    - `### Examples`: the intervals `[0,1]` and `[2,3]` in box `[0,3]`, with `P = [0,3]`.
    - `### Dependencies`: 1.1–1.4; Mathlib `Convex.sum_mem`, `subset_convexHull`, `convexHull_min`, `convex_convexHull`.
  - **Layer 3.**
    - `### Examples`: the lift `L` of the two-interval example, as computed in R04.
    - `### Dependencies`: 1.2–1.3 for 3.1; 2.1 and 3.1 for 3.2; Mathlib `isCompact_Icc`, `IsCompact.of_isClosed_subset`, `IsCompact.image`, `IsCompact.isClosed`.

## R03 (P3) — Five backticked names of this roadmap are not declared in `Suggested.lean`

- **Location:** `README.md` line 173, "prove `zero_block`"; line 192, "`normalized_block`"; line 194, "`empty_branch_weight_block`"; line 212, "`convex_lift`, `convex_projection`"; line 225, "using `zero_block`".
- **Claim:** A backticked name of this roadmap's own claims a declaration in `Suggested.lean`. All five of these were deleted from that file.
- **Witness:** None of the five occurs in `Suggested.lean`, whose theorems are `hull_exact`, `isCompact_lift`, `isCompact_fullLift`, `isCompact_projection` and `closed_hull_exact`. None occurs in pinned Mathlib either.
- **Repair:** Name them in prose:
  - "prove the zero-block property: …"
  - "prove the normalization property: …"
  - "prove the empty-branch property: …"
  - "prove that `L` and `P` are convex, and `hull_exact`: …"
  - "reconstruct the sum using the zero-block property"

## R04 (P3) — Seven Checks compute nothing, restate a definition or contradict themselves

- **Location:** `README.md` lines 139, 153, 186, 233, 254, 255, 276. For example, line 276: "The empty and closed nonsalient-cone examples retain their expected behavior."
- **Claim:**
  - Lines 233, 254, 255 and 276 give no instance and no value.
  - Line 254 cites an "unequal-residual-dimension example" that the README never specifies.
  - Line 139 calls the selected block both nonzero and zero.
  - Line 153 restates the definition of `projection`.
  - Line 186 uses "nonzero coordinate", which is undefined.
- **Witness:** Lines 233, 254, 255 and 276 contain no number or set. No passage of the README gives `A`, `b` and `K` with unequal `m i`.
- **Repair:** Replace them as follows.
  - **139:** "For `ι = Fin 3`, the one-hot family `Pi.single 1 w` has `sumBlocks = w` for every `w`, including `w = 0`."
  - **153:** "For the interval branch of 1.1, `P = [0,1]`; summing weights instead of blocks would give `{1}`."
  - **186:** "If `l j > u j` for some `j`, then every weight is zero, contradicting `∑ λ = 1`, so `L = P = F = ∅`."
  - **233:** "In box `[0,1]`, take branch 1 with `Y = ℝ`, `A x = x`, `b = 0`, `K = [0,∞)`. Take branch 2 with `Y = ℝ²`, `A x = (x,−x)`, `b = 0` and the nonsalient cone `K = ℝ²`. Then `U = P = [0,1]`, and `λ = (1/2,1/2)`, `v = (1/2,1/2)` is a point of `L` over `1`."
  - **254:** "In the two-interval example of 2.1, `L = {(s, 1−s, v₁, v₂) | 0 ≤ s ≤ 1, 0 ≤ v₁ ≤ s, 2(1−s) ≤ v₂ ≤ 3(1−s)}`. It is closed, lies inside `[0,1]² × [0,3]²`, and `P = [0,3]`."
  - **255:** "Take `n = 0`, `ι = Fin 2`, `m = (0,1)`, `b₁ = 0`, `K₁ = {0}`, `b₂ = 1`, `K₂ = [0,∞)`. Then `B₂ = ∅`, `L = {((1,0), 0)}` and `P = {0}`: compact, with an empty branch."
  - **276:** "For the nonsalient example of 2.1, `closure (convexHull U) = [0,1] = P`. For empty `ι`, both sides are `∅`."

## R05 (P3) — The targets of 1.3 and 1.4 carry no locator

- **Location:** `README.md` lines 173–177, "prove `zero_block` … every weight lies in `[0,1]` …", and lines 192–195 (normalization, one-hot lift, empty branch).
- **Claim:** Every theorem needs a locator at the claim. The targets of 1.3 and 1.4 cite nothing.
- **Witness:**
  - GN25 line 460 (printed p. 10) states that a zero weight forces a zero block.
  - BTN01 lines 6727–6734 (p. 100, (3.3.24)) give the one-hot scaling.
  - BTN01 lines 6764–6769 (p. 101) normalize by the weight.
- **Repair:**
  - After the zero-block statement, add "(Gusev–Bernal Neira, discussion before Proposition 2, p. 10)".
  - After the one-hot lift, add "(Ben-Tal–Nemirovski, proof of Proposition 3.3.5, (3.3.24), p. 100)".
  - After the normalization, add "(ibid., p. 101)".

## R06 (P3) — The Ceria–Soares DOI does not resolve

- **Location:** `README.md` line 311, "[DOI](https://doi.org/10.1007/s101079900101)".
- **Claim:** The DOI does not resolve, so the reference cannot be followed.
- **Witness:** Crossref returns HTTP 404 for `10.1007/s101079900101`. It lists Ceria–Soares, *Convex programming for disjunctive convex optimization*, Math. Program. 86 (1999), under `10.1007/s101070050106`.
- **Repair:** Replace the link with `[DOI](https://doi.org/10.1007/s101070050106)`.

## R07 (P3) — "Row" vocabulary is undefined, and `Suggested.lean` has no Layer 1 section comment

- **Location:** `Suggested.lean` lines 34, 70, 75, 80 ("its row set", "Closed row sets", "every row set is closed") and line 38 ("affine-row branches"); `README.md` lines 52, 86, 118, 283 ("affine-row", "row membership", "conic row", "Closed-row clients").
- **Claim:** The Conventions call `K i` "sets" and never define "row". Layer 1's definitions also have no `/-! ## Layer 1 … -/` comment, while Layers 2 and 3 do.
- **Witness:** README line 27 reads "The sets `K i : Set (Y i)` are separate parameters", and "row" is defined nowhere. The file's first section comment is the Layer 2 one at line 59.
- **Repair:**
  - Replace "row set(s)" with "set(s) `K i`".
  - Replace "affine-row branches" with "branches".
  - Replace "row membership" and "conic row" with "residual condition `A i x − b i ∈ K i`".
  - Replace "Closed-row clients" with "Clients with closed `K i`".
  - Insert `/-! ## Layer 1: scaled boxes and branch interfaces -/` before line 34.

## R08 (P3) — The description counts ten headline signatures; the file has five

- **Location:** Pull-request description: "`Suggested.lean` has complete data definitions and ten headline target signatures with intentional `sorry` proofs".
- **Claim:** The sentence was written for the previous head. This head states five theorems.
- **Witness:** `grep -c '^theorem' Suggested.lean` gives 5: `hull_exact`, `isCompact_lift`, `isCompact_fullLift`, `isCompact_projection` and `closed_hull_exact`.
- **Repair:** "`Suggested.lean` has the data definitions and five headline theorem signatures (`hull_exact`, `isCompact_lift`, `isCompact_fullLift`, `isCompact_projection`, `closed_hull_exact`), each with `sorry`."

## Verified sound

**The previous review's findings (at 4afba09), checked at this head:**

| Previous finding | Passage at a24ef8d | Status |
| --- | --- | --- |
| R01 unboxed theorem | line 15, "Unbounded unions, common-summand theorems … outside" | not repaired → R01 |
| R02 headings | line 1, "# Roadmap: finite boxed…"; lines 68, 206, 238, "## Layer N:" | repaired |
| R03 targets | §§1.1–3.2; each definition has an API list and three Checks | repaired; layer endings lost → R02 |
| R04 negative controls | lines 201–204, 234–236, 256–259, 277 | repaired |
| R05 locators | lines 112–113, 217–221, 248–250, 269–271 | partly: 1.3 and 1.4 still lack one → R05 |
| R06 Lean names | all 14 Lean names occur in the README | repaired; five extra names → R03 |
| R07 padding | the five boundary theorems were deleted | repaired |
| R08 docstrings | every declaration has a docstring | repaired |
| R09 supplier contracts | lines 42–59, `### From Mathlib` and `### From Tau Ceti` | repaired |
| R10 process text | no build or tool instructions remain | repaired |
| R11 vocabulary | lines 30–33 define the original-space point, disaggregated variable and one-hot lift | partly: "row" remains → R07 |

**Adversarial table:**

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 1.1 `branch` | `n=1`, box `[0,1]`, `A=0`, `K={0}`, `b=0` and `b=1`; `n=0` | `0∈{0}` gives `[0,1]`; `−1∉{0}` gives `∅`; for `n=0` the branch is `{0}` iff `−b∈K` | Checks hold | none |
| 1.1 `boundedUnion` | empty `ι`; `[0,1]` plus an empty branch; wrong model `⋂` | `∅`; `[0,1]`; `⋂` gives `univ`, then `∅` | Checks 1 and 3 discriminate | none |
| 1.2 `lift` | interval `λ=1`, `v=½`; `ι=∅`; `λ i=0` | row `0∈{0}`, `0≤½≤1`; `∑_∅=0≠1`; `0≤v≤0` | holds | none |
| 1.2 `projection`, `fullLift` | `ι=∅`; `(½,(1,½))`; first coordinate changed to `0` | `L=∅`, so `P=F=∅`; `½=½`; `0≠½` | holds; two vacuous Checks | R04 |
| 1.3 bounds | `l=1,u=2,λ=0`; `l=−1,u=2,λ=½`; `l>u` | `v=0∉[1,2]`; `v∈[−½,1]`; `λ(l−u)≤0` forces all `λ=0` | holds | R04, R05 |
| 1.4 normalization, one-hot, empty branch | `λ=½`, `v=¼`; `b=1`, `K={0}`; control `K i={1}`, `b i=−2` | `2·¼=½∈B`; `−λ∈{0}` gives `λ=v=0`; control rows `0+1∈{1}`, sums `0` and `1` | holds; control correct | R05 |
| `hull_exact` (2.1) | `[0,1]`,`[2,3]` in `[0,3]`; `ι=∅`; `l>u`; `K=⊤` | `λ=(½,½)`, `v=(½,1)`: rows `0≤0`, `0≥0`, sum `3/2`; `∅=∅`; `∅=∅`; box = box | holds | none |
| `hull_exact` control `0∉K` | branch 2: `K=(0,∞)`, `A=b=0` | `B₂=∅`, `U=[0,1]`; row `0∉(0,∞)`, so `L=P=∅` | control correct | none |
| `isCompact_lift` (3.1) | 2.1 example; `K=∅`; `ι=∅` | `0≤v₁≤s`, `2−2s≤v₂≤3−3s`, inside `[0,1]²×[0,3]²`; `∅`; `∅` | holds | R04 |
| `isCompact_fullLift`, `isCompact_projection` | images of `L` | `sumBlocks` is continuous; the probe derives `isCompact_projection` from `isCompact_lift` in 3 tactics | holds | none |
| closedness control (3.1, 3.2) | `A x=(x,0)`, `b=(0,−1)`, `K={a>0}∪{0}` | residual `(x,1)∈K` iff `x>0`: `B=P=(0,1]`; closure `[0,1]≠P` | control correct | none |
| `closed_hull_exact` (3.2) | 2.1 example; `K=ℝ²`, `A x=(x,−x)` | `P=[0,3]` is closed; `[0,1]=[0,1]`; probe: `rw [← hull_exact]; exact hP.isClosed.closure_eq` | holds | none |
| R01 (c) recovers `hull_exact` | box-augmented rows `(A x−b, x−l, u−x)` | zero slice `{w | A w∈K, w≥0, −w≥0} = {0}` | repair consistent | R01 |
| R01 controls for (b), (c) | `P₁={0}` (`A=id`, `K={0}`); `P₂=∅` (`A=0`, `b=1`, `K={0}`) | `w₂=0`, `v₁=0`, `v₂` free: lift `=ℝ`; hull and its closure are `{0}` | hypotheses needed | R01 |
| R04 replacement Checks | `n=0`, `m=(0,1)`, `b₂=1`, `K₂=[0,∞)`; `K=ℝ²` | `−λ₂≥0` gives `L={((1,0),0)}`, `P={0}`; `v=(½,½)` sums to `1` | replacements hold | R04 |
| BG21 Theorem 1, HR-Cone (1.2, 2.1, 3.1, 3.2) | v3 lines 349–384, 397–405; v1 lines 384, 441 | v3 pp. 7–8; v1 pp. 10–11; proper `K i`; nonempty or common summand | match README | none |
| BTN01 Proposition 3.3.5 (2.1, 3.2) | lines 6636–6847 | stated p. 99, (i) p. 100, proof to p. 102; nonempty sets, ice-cream cones | matches qualification | none |
| LTV19 Theorem 4; GN25 Propositions 1–2 | LTV19 lines 9, 391; GN25 lines 48, 350, 468 | p. 10, 8 September 2020; printed pp. 8 and 10, 17 March 2026 | match | none |

**Counts:**

- **Sources:** 12 locators checked against the text; all match. BG21 = arXiv 2109.09657 v1 and v3; LTV19 = arXiv 1912.03166v2; BTN01 = the author-hosted 2001/6/18 layout; GN25 = arXiv 2508.16093v2.
- **Library declarations:** the 23 Mathlib names in the supplier table elaborate with `#check @` at `1b1ccf4`, e.g. `PointedCone.smul_mem_iff` (Pointed.lean:131), `Convex.sum_mem` (Combination.lean:217), `IsCompact.of_isClosed_subset` (Compact.lean:105). Tau Ceti `ConvexOn.antitoneOn_mul_map_div` is at `TauCeti/Analysis/Convex/Perspective.lean:35`.
- **Duplication:** neither pin has a lift of a finite-union convex hull. `convexHull_iUnion` and `convexHull (⋃` do not occur, and Tau Ceti `Analysis/Convex/Combination.lean` and `Join.lean` do not state it. This roadmap is the owner.
- **Overlap check:** read FiniteAffineBoundTightening and ExactPenalties; nothing shared. The main-closest and results-closest lists are empty, no open pull request changes this roadmap, and the README makes no cross-roadmap citations.
- **Dependency check:** `depcheck: 206 roadmaps, 1896 edges, 0 problem(s)`. Nothing outside the folder changes.
- **Gate:** rerun at this head; OK, every check 0.
- **Elaboration:** `lake env lean` on `Suggested.lean` gives only 5 `sorry` warnings. The `#check @` types of all 14 declarations match the README. `branch` and `boundedUnion` drop `[Fintype ι]`, which they do not use.
- **Padding probe:** `simp [definition]` closes none of the five theorems. `closed_hull_exact` follows in two tactics from `hull_exact` and `isCompact_projection`. All five are kept as the named targets of 2.1, 3.1 and 3.2.

## Not verifiable

- **BG21, published version** (Comput. Optim. Appl. 88, 2024): "equation (2)", pp. 259–260, and HR-Cone, p. 260. The DOI resolves only to arXiv v3, where the display is numbered (3.2).
- **Ceria–Soares** (Math. Program. 86, 1999), Theorem 1, pp. 600–601: paywalled, uncertified.
- **Software provenance:** `Chapter08HullCompact.lean` exists at the cited commit and declares `isCompact_lift` and `closed_hull_exact`. It was not compiled, and the other two files were not opened.

## Source issues

- **Gap** in BG21 at Theorem 1, arXiv v3 pp. 7–8: the source states the hull characterisation for arbitrary proper cones but proves it only by citing Ben-Tal–Nemirovski, whose proposition covers products of Lorentz cones; it should note that that proof carries over to closed convex cones, or give the argument; affects the proof.
- **Gap** in LTV19 at Theorem 4, p. 10: the source states the hull characterisation for arbitrary proper cones and cites only Ben-Tal–Nemirovski, whose proposition covers products of Lorentz cones; it should note that that proof carries over to closed convex cones, or give the argument; affects the proof.
